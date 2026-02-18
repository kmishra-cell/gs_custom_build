
/* Put Rule on Lagr segment level before

 * 1. Check if main entity is LAGR or not
 * 2. Check if Message action for LAGR is 'INSERT' or UPDATE
 * 3. Exit if FinancialInstOrAgreementRole segemnt not present in message
 * 4. Exit if Rl_TYP is not CPTY
 * 5. Take inst_mnem and find corresponding issuer id
 * 5.2 create legal reference id 
 * 6.1. create derived segment "LegalAgreementAltIdentifier" to delete existing legal_agrmnt_id with action DELETE
 * 6.2. create derived segment "LegalAgreementAltIdentifier" with action unknown
 * 7. Similar procedure for agrmnt_purp_typ='LGAGTCEA'
 */

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;

import com.thegoldensource.jbre.DatabaseAccess;
import com.thegoldensource.jbre.DatabaseObjectContainer;
import com.thegoldensource.jbre.GSException;
import com.thegoldensource.jbre.JavaRule;
import com.thegoldensource.jbre.NotificationCreator;
import com.thegoldensource.jbre.ProcessorContext;
import com.thegoldensource.jbre.SegmentId;
import com.thegoldensource.jbre.XMLMessage;



public class CJavaMHIAddLegalRef implements JavaRule{

	private static Logger logger = Logger.getLogger("CJavaMHIAddLegalRef");
	private static int count= 0;
	private static int flarUpsertcount= 0;

	public boolean initialize(String[] params) {
		if (logger.isInfoEnabled())
		logger.info("Initializing CJavaMHIAddLegalRef Rule");
		return true;
	}

	public boolean process(XMLMessage msg, DatabaseObjectContainer dboc,
			ProcessorContext pContext, DatabaseAccess dbConn, NotificationCreator notfcn)
	throws GSException {

	

		String mainEntityTblTyp = msg.getStringField("MAIN_ENTITY_TBL_TYP", new SegmentId(0));
		if(null == mainEntityTblTyp || !"LAGR".equalsIgnoreCase(mainEntityTblTyp)){
			
			if(logger.isDebugEnabled()){
			logger.debug("xml: " + msg.getXMLString());
			logger.debug("Message is not for LegalAgreement. Hence Exiting");
			}
			return true;
		}
		
		String msgClassification = msg.getStringField("MSG_CLASSIFICATION", new SegmentId(0));
		if(!"WEBMSG".equalsIgnoreCase(msgClassification))
		{
			if (logger.isInfoEnabled())
			{
			logger.info("Message is not UI. Hence Exiting");
			}
			return true;
		}
		
		SegmentId lagrSegId = new SegmentId(0);
		String action = msg.getAction(lagrSegId);
		
		if(!(("INSERT".equals(action)) || ("UPDATE".equals(action))))
		{
			
			if(logger.isDebugEnabled()){
			logger.debug("xml: " + msg.getXMLString());
			logger.debug("Message action is not insert or update. Hence Exiting");
			}	
			
			return true;
		}
		List<SegmentId> segmentIDFLAR = new ArrayList<SegmentId>();
        segmentIDFLAR = getSegmentIds("LAGRFinancialInstitutionAgreementRole", msg);
        String lagrOid = msg.getStringField("LAGR_OID", lagrSegId);
		String orgId = msg.getStringField("ORG_ID", lagrSegId);
		String agrmntPurpTyp = msg.getStringField("AGRMNT_PURP_TYP", lagrSegId);
		String agrmntTyp = msg.getStringField("AGRMNT_TYP", lagrSegId);
		String model=null;
		String issrId = null;
		String counter = "01";
		
		
		if(null == agrmntPurpTyp)
		{
			agrmntPurpTyp = getFirstValDB("select agrmnt_purp_typ from ft_t_lagr where LAGR_OID='"+lagrOid+"' and end_tms is null", dbConn, logger);
		}
		
		if (logger.isInfoEnabled())
		{
			logger.info("agrmntPurpTyp = "+agrmntPurpTyp);
		}
		
		String DBagrmntTyp = getFirstValDB("select agrmnt_typ from ft_t_lagr where LAGR_OID='"+lagrOid+"' and end_tms is null", dbConn, logger);
		
		//for repos
		if(null == agrmntTyp)
		{
			agrmntTyp = DBagrmntTyp;
		}
		
		
		//Check if agreement type is NEWDOC and if so, exit rule
		if (!("NEWDOC".equals(agrmntTyp))) {
			
			if (logger.isInfoEnabled())
			{
				logger.info("agrmntPurpTyp = "+agrmntPurpTyp);
				logger.info("agrmntTyp = "+agrmntTyp);
				logger.info("DBagrmntTyp = "+DBagrmntTyp);
				logger.info("Begin processsing logic...");
			}

		
			//new Repo plus	
	    	if ("LEGAGRMT".equals(agrmntPurpTyp)) {					
					model = "ISDACSA";					
				}else if ("LGAGTCEA".equals(agrmntPurpTyp)) {		
					model = "CEA";					
				}else if ("LGAGTREPO".equals(agrmntPurpTyp)) {
					model = "REPO";
				}
	    	
	    	if (logger.isInfoEnabled())
			{
				logger.info("model = "+model);
			}  	
			
	        for(SegmentId segID : segmentIDFLAR)
	        {
	        	if (logger.isInfoEnabled())
				{
					logger.info("segmentIDFLAR found. Going into segmentIDFLAR logic...");
				}
	        	
	        	String rlTyp = msg.getStringField("RL_TYP", segID);
				
				logger.info("rlTyp == "+ rlTyp);
				
				String instMnemCheck = msg.getStringField("INST_MNEM", segID);
				String flarOidCheck = msg.getStringField("FLAR_OID", segID);
				
				String flarOID = getFirstValDB("select flar_oid from ft_T_flar where lagr_oid='"+lagrOid+"' and INST_MNEM ='"+instMnemCheck+"' and end_tms is null",dbConn, logger);

                String actionFLAR;
				
                if(flarOID == null)
					actionFLAR="INSERT";
				else
					actionFLAR = "UPDATE";
				
				logger.info("actionFLAR == "+ actionFLAR);
				
				
	        	//String actionFLAR = msg.getAction(segID);
				
	        	if(null == rlTyp && "UPDATE".equals(actionFLAR))
	    		{
					
	        		String flarOid = msg.getStringField("FLAR_OID", segID);
	        		rlTyp = getFirstValDB("select rl_typ from ft_T_flar where flar_oid='"+flarOid+"' and end_tms is null", dbConn, logger);
	    		}
	        	
	        	if("CPTY".equals(rlTyp) && ("INSERT".equals(actionFLAR) || "UPDATE".equals(actionFLAR)))
	        	{
	        		flarUpsertcount++;
	        		String instMnem = msg.getStringField("INST_MNEM", segID);
	        		
	            	
	            	if (logger.isInfoEnabled())
	    			{
	            		logger.info("FLAR CPTY update or insert segment found...");
	            		logger.info("flarUpsertcount: "+flarUpsertcount);
	            		logger.info("Model assigned to model variable as: "+model);
	            		logger.info("Checking ISSR ID against LAGR in database...");
	    			}
							   				
    				issrId = getFirstValDB(												
											"select irid.ISSR_ID " +
											"from ft_T_lagr lagr " +
											"join ft_t_flar flar on lagr.LAGR_OID = flar.LAGR_OID " +
											"join ft_t_issr issr on flar.INST_MNEM = issr.FINS_INST_MNEM " +
											"join ft_t_irid irid on issr.INSTR_ISSR_ID = irid.INSTR_ISSR_ID " +
											"where flar.rl_typ = 'CPTY' " +
											"and flar.org_id = 'MHI' " +
											"and agrmnt_purp_typ = '" + agrmntPurpTyp + "' " +
											"and irid.ISSR_ID_CTXT_TYP = 'CLIENTREF' " +
											"and issr.END_TMS is null " +
											"and irid.END_TMS is null " +
											"and flar.inst_mnem = '" + instMnem + "' " +
											"group by irid.ISSR_ID", dbConn, logger);
													
													
	
            			
    				
    				if((null == issrId || "".equals(issrId)))
            		{
    					
            			issrId = getFirstValDB("select irid.issr_id from ft_T_issr issr, ft_t_irid irid where issr.INSTR_ISSR_ID = irid.INSTR_ISSR_ID  and ISSR.FINS_INST_MNEM='"+instMnem+"' and irid.ISSR_ID_CTXT_TYP='CLIENTREF' and issr.END_TMS is null and irid.END_TMS is null", dbConn, logger);
            			
            			if (logger.isInfoEnabled())
    					{
    						logger.info("LAGR check for ISSR ID not found. Trying check agaisnt IRID, ISSR and found: "+issrId);
    					}
            		}else
            		{
            			counter = String.format("%02d", count+1);
            			if (logger.isInfoEnabled())
    					{
    						logger.info("LAGR check for ISSR ID found: "+issrId+". Counter is: "+counter);
    					}
            		}
    				
    				if(null != issrId && "INSERT".equals(actionFLAR))
            		{
			        	logger.info("Inside insert block ");
				
    					if (logger.isInfoEnabled())
    					{
    						logger.info("LAGR check for ISSR ID found: "+issrId+". Counter is: "+counter);
    						logger.info("Creating LAID segment");
    					}
    					
            			//ft_T_laid derived segment 
            	        SegmentId LAIDSeg = msg.addSegment(XMLMessage.A_D_UNKNOWN, "LegalAgreementAltIdentifier");
            			msg.addField("LAGR_OID", LAIDSeg, lagrOid);
            			msg.addField("LAGR_ID_CTXT_TYP", LAIDSeg, "LEGREF");
            			
            			//repo needs legal agreement ID to be made up of Repo Agreement Type and not just agreement type
            			if ("REPO".equals(model) || "CEA".equals(model)) {
            				
							logger.info("For repo and clearing======");
            				//check if the LAID entry exists in the DB already. If so add one to the value 
            				//found and set the counter variable to this value
            				String LaIdCheck = getFirstValDB("select max(right(LEGAL_AGRMNT_ID, 2)) " +
																			"from FT_T_LAID " +
																			"where left(LEGAL_AGRMNT_ID, length(LEGAL_AGRMNT_ID) - 3) = '" + agrmntTyp + "-" + issrId + "' " +
																			"and end_tms is null", dbConn, logger);
            				
							logger.info("LaIdCheck == " +LaIdCheck);
							
							if (!(null == LaIdCheck || "".equals(LaIdCheck))){ 
            					counter= String.format("%02d",Integer.parseInt(LaIdCheck.trim())+1);
            					}          				
            				
            				if (logger.isInfoEnabled())
        					{
        						logger.info("LaIdCheck var set to: "+LaIdCheck+". Counter is: "+counter);
        					}
            				
            				msg.addField("LEGAL_AGRMNT_ID", LAIDSeg, agrmntTyp+"-"+issrId+"-"+counter);
    					}else
    						//otherwise type of agreement only, used to make create the LAID
                		{
    						//check if the LAID entry exists in the DB already. If so add one to the value 
            				//found and set the counter variable to this value
            				String LaIdCheck = getFirstValDB("select max(right(LEGAL_AGRMNT_ID, 2)) " +
																"from FT_T_LAID " +
																"where left(LEGAL_AGRMNT_ID, length(LEGAL_AGRMNT_ID) - 3) = '" + model + "-" + issrId + "' " +
																"and end_tms is null", dbConn, logger);
            					
								logger.info("LaIdCheck == " +LaIdCheck);
							
							
							if (!(null == LaIdCheck || "".equals(LaIdCheck))){ 
            					counter= String.format("%02d",Integer.parseInt(LaIdCheck.trim())+1);
            					}            				
            				
            				if (logger.isInfoEnabled())
        					{
        						logger.info("LaIdCheck var set to: "+LaIdCheck+". Counter is: "+counter);
        					}
    						msg.addField("LEGAL_AGRMNT_ID", LAIDSeg, model+"-"+issrId+"-"+counter);
                		}
            			
            			msg.addField("START_TMS", LAIDSeg, new Date());
            			msg.addField("DATA_STAT_TYP", LAIDSeg, "ACTIVE");
            			
            		}
    				
    				if(null != issrId && "UPDATE".equals(actionFLAR))
            		{
            			logger.info("Inside update  block ");
						
						
    					if ("CEA".equals(model)) {
    						issrId = issrId.replaceAll("'", "''");
    					}
    					
            			//check if getting inst_mnem
            			String laidOid = getFirstValDB("select laid_oid from ft_t_laid where LAGR_OID='"+lagrOid+"' and END_TMS is null", dbConn, logger);
            			
            			
            			if(!(null == laidOid || "".equals(laidOid))) 
            			{
            				if (logger.isInfoEnabled())
        					{
        						logger.info("Existing Legal ID found. Creating Delete segment.");
        					}
	            			//ft_t_laid derived segment
	            			SegmentId LAIDSegDel = msg.addSegment(XMLMessage.A_D_DELETE, "LegalAgreementAltIdentifier");
	            			msg.addField("LAID_OID", LAIDSegDel, laidOid);
	            			
	            			//ft_T_laid derived segment 
            			
            			
	            			String existingLegalId = null;
	            			int count1 = 1;
	            		
	            			do
	            			{
	    	        			String existingLegalIdcounter = getFirstValDB("select max(substr(legal_agrmnt_id, -2)) " +
												"from ft_t_laid " +
												"where legal_agrmnt_id like '" + model + "-" + issrId + "-%' " +
												"and END_TMS is null", dbConn, logger);
	    	        			if (logger.isInfoEnabled())
	    	    				{
	    	    				logger.info("existingLegalIdcounter : "+existingLegalIdcounter);
	    	    				}
	    	        	        if((!(null== existingLegalIdcounter || "".equals(existingLegalIdcounter)))&& isNumeric(existingLegalIdcounter))
	    	        	        {
	    	        	        	count = Integer.parseInt(existingLegalIdcounter);
	    	        	        	counter = String.format("%02d", count+count1);
	    	        	        	if (logger.isInfoEnabled())
	    	        				{
	    	        				logger.info("count"+count);
	    	        				logger.info("counter = "+counter);
	    	        				}
	    	        	        	
	    	        	        }
	    	        	        existingLegalId = getFirstValDB("select legal_agrmnt_id from ft_t_laid where legal_agrmnt_id ='"+model+"-"+issrId+"-"+counter+"' and END_TMS is null", dbConn, logger);
	    	        	        count1++;
	            			}while(((model+"-"+issrId+"-"+counter).equals(existingLegalId)) && count1 < 20);
            			}
            			
            			SegmentId LAIDSeg = msg.addSegment(XMLMessage.A_D_UNKNOWN, "LegalAgreementAltIdentifier");
            			msg.addField("LAGR_OID", LAIDSeg, lagrOid);
            			msg.addField("LAGR_ID_CTXT_TYP", LAIDSeg, "LEGREF");
            			
            			//repo needs legal agreement ID to be made up of Repo Agreement Type and not just agreement type
            			if ("REPO".equals(model)) {
            				
            				//check if the LAID entry exists in the DB already. If so add one to the value 
            				//found and set the counter variable to this value
            				String LaIdCheck = getFirstValDB("select max(SUBSTR(LEGAL_AGRMNT_ID,-2,2)) from FT_T_LAID where SUBSTR(LEGAL_AGRMNT_ID,1,(length(LEGAL_AGRMNT_ID)-3)) ='"+agrmntTyp+"-"+issrId+"' and end_tms is null", dbConn, logger);
            				if (!(null == LaIdCheck || "".equals(LaIdCheck))){ 
            					counter= String.format("%02d",Integer.parseInt(LaIdCheck.trim())+1);
            					}          				
            				
            				if (logger.isInfoEnabled())
        					{
        						logger.info("LaIdCheck var set to: "+LaIdCheck+". Counter is: "+counter);
        					}
            				
            				msg.addField("LEGAL_AGRMNT_ID", LAIDSeg, agrmntTyp+"-"+issrId+"-"+counter);
    					}else
    						//otherwise type of agreement only, used to make create the LAID
                		{
    						//check if the LAID entry exists in the DB already. If so add one to the value 
            				//found and set the counter variable to this value
            				String LaIdCheck = getFirstValDB("select max(SUBSTR(LEGAL_AGRMNT_ID,-2,2)) from FT_T_LAID where SUBSTR(LEGAL_AGRMNT_ID,1,(length(LEGAL_AGRMNT_ID)-3)) ='"+model+"-"+issrId+"' and end_tms is null", dbConn, logger);
            				if (!(null == LaIdCheck || "".equals(LaIdCheck))){ 
            					counter= String.format("%02d",Integer.parseInt(LaIdCheck.trim())+1);
            					}            				
            				
            				if (logger.isInfoEnabled())
        					{
        						logger.info("LaIdCheck var set to: "+LaIdCheck+". Counter is: "+counter);
        					}
    						msg.addField("LEGAL_AGRMNT_ID", LAIDSeg, model+"-"+issrId+"-"+counter);
                		}
            			
            			msg.addField("DATA_STAT_TYP", LAIDSeg, "ACTIVE");
            			
            		}
	    					            			        	
	            	}
			
				}
	        	
	      //if previous agreement type (i.e current DB entry) is 'NEWDOC' and it has now been updated in the message but there is no FLAR update (i.e the couterparty was set prior and is not being updated) then 
			//we need to check the FLARCPTY entry for this Repo Legal Agreement and use it to generate an ID.
	        if (logger.isInfoEnabled())
			{
				logger.info("flarUpsertcount: "+flarUpsertcount);
			}
	        
	        	if (flarUpsertcount == 0 && "NEWDOC".equals(DBagrmntTyp)) {
	
	    				if (logger.isInfoEnabled())
	    				{
	    					logger.info("DBagrmntTyp is NEWDOC and segmentIDFLAR is not present in message. Processing NEWDOC with existing DB FLAR entry, scenario...");
	    				}
	    				
	    				String instMnem = getFirstValDB("select inst_mnem from FT_T_FLAR where rl_typ = 'CPTY' and LAGR_OID = '"+lagrOid+"' and end_tms is null",dbConn, logger);					
	    				if (logger.isInfoEnabled())
	    				{
	    					logger.info("Checking ISSR ID against LAGR in database...");
	    				}			
	    				
						issrId = getFirstValDB("select irid.ISSR_ID " +
												"from ft_T_lagr lagr, ft_t_flar flar, ft_t_issr issr, ft_t_irid irid " +
												"where lagr.LAGR_OID = flar.LAGR_OID " +
												"and flar.INST_MNEM = issr.FINS_INST_MNEM " +
												"and issr.INSTR_ISSR_ID = irid.INSTR_ISSR_ID " +
												"and flar.rl_typ = 'CPTY' " +
												"and flar.org_id = 'MHI' " +
												"and agrmnt_purp_typ = '" + agrmntPurpTyp + "' " +
												"and irid.ISSR_ID_CTXT_TYP = 'CLIENTREF' " +
												"and issr.END_TMS is null " +
												"and irid.END_TMS is null " +
												"and flar.inst_mnem = '" + instMnem + "' " +
												"group by irid.ISSR_ID", dbConn, logger);
	    									
	    				if((null == issrId || "".equals(issrId)))
	    				{					
	    					issrId = getFirstValDB("select irid.issr_id from ft_T_issr issr, ft_t_irid irid where issr.INSTR_ISSR_ID = irid.INSTR_ISSR_ID  and ISSR.FINS_INST_MNEM='"+instMnem+"' and irid.ISSR_ID_CTXT_TYP='CLIENTREF' and issr.END_TMS is null and irid.END_TMS is null", dbConn, logger);					
	    					if (logger.isInfoEnabled())
	    					{
	    						logger.info("LAGR check for ISSR ID not found. Trying check agaisnt IRID, ISSR and found: "+issrId);
	    					}
	    				}else
	    				{
	    					counter = String.format("%02d", count+1);
	    					if (logger.isInfoEnabled())
	    					{
	    						logger.info("LAGR check for ISSR ID found: "+issrId+". Counter is: "+counter);
	    					}
	    				}
	    					
	    				//ft_T_laid derived segment 
	    				SegmentId LAIDSeg = msg.addSegment(XMLMessage.A_D_UNKNOWN, "LegalAgreementAltIdentifier");
	    				msg.addField("LAGR_OID", LAIDSeg, lagrOid);
	    				msg.addField("LAGR_ID_CTXT_TYP", LAIDSeg, "LEGREF");
	    				
	    				//repo needs legal agreement ID to be made up of Repo Agreement Type and not just agreement type
	    				if ("REPO".equals(model)) {
            				
            				//check if the LAID entry exists in the DB already. If so add one to the value 
            				//found and set the counter variable to this value
            				String LaIdCheck = getFirstValDB("select max(SUBSTR(LEGAL_AGRMNT_ID,-2,2)) from FT_T_LAID where SUBSTR(LEGAL_AGRMNT_ID,1,(length(LEGAL_AGRMNT_ID)-3)) ='"+agrmntTyp+"-"+issrId+"' and end_tms is null", dbConn, logger);
            				if (!(null == LaIdCheck || "".equals(LaIdCheck))){ 
            					counter= String.format("%02d",Integer.parseInt(LaIdCheck.trim())+1);
            					}          				
            				
            				if (logger.isInfoEnabled())
        					{
        						logger.info("LaIdCheck var set to: "+LaIdCheck+". Counter is: "+counter);
        					}
            				
            				msg.addField("LEGAL_AGRMNT_ID", LAIDSeg, agrmntTyp+"-"+issrId+"-"+counter);
    					}else
    						//otherwise type of agreement only, used to make create the LAID
                		{
    						//check if the LAID entry exists in the DB already. If so add one to the value 
            				//found and set the counter variable to this value
            				String LaIdCheck = getFirstValDB("select max(SUBSTR(LEGAL_AGRMNT_ID,-2,2)) from FT_T_LAID where SUBSTR(LEGAL_AGRMNT_ID,1,(length(LEGAL_AGRMNT_ID)-3)) ='"+model+"-"+issrId+"' and end_tms is null", dbConn, logger);
            				if (!(null == LaIdCheck || "".equals(LaIdCheck))){ 
            					counter= String.format("%02d",Integer.parseInt(LaIdCheck.trim())+1);
            					}            				
            				
            				if (logger.isInfoEnabled())
        					{
        						logger.info("LaIdCheck var set to: "+LaIdCheck+". Counter is: "+counter);
        					}
    						msg.addField("LEGAL_AGRMNT_ID", LAIDSeg, model+"-"+issrId+"-"+counter);
                		}
	    				
	    				msg.addField("START_TMS", LAIDSeg, new Date());
	    				msg.addField("DATA_STAT_TYP", LAIDSeg, "ACTIVE");
	    															
	        		
	        	} else {
	        		if (logger.isInfoEnabled())
    				{
    					logger.info("flarUpsertcount was not deemed to be 0. :"+flarUpsertcount);
    				}
	        	}
	        	
	        
	        if (logger.isInfoEnabled())
			{
				logger.info("Ending rule processsing logic...");
			}
			
		} else {
			
			if (logger.isInfoEnabled())
			{
				logger.info("Model assigned to model variable as: "+model);
				logger.info("Agreement Type is: "+agrmntTyp);
				logger.info("Agreement Type selected will not generate an ID until it is updated to a proper agreement type. Exiting rule.");
			}
		}
	
return true;

	}
	
	public List<SegmentId> getSegmentIds(String segType, XMLMessage msg) {
        List<SegmentId> segIdList = new ArrayList<SegmentId>();
        for (int i=0; i<msg.getSegmentCount(); i++) {
                        SegmentId segId = new SegmentId(i);                                   
                        if (msg.getSegmentType(segId).equals(segType)) {
                                        segIdList.add(segId);
                        }
        }                              
        return segIdList;               
}

	
	public String getFirstValDB(String query, DatabaseAccess dbConnection, Logger logger) {
		String dbout= null;
		if (query==null || "".equals(query)){
		return null;
		}
		logger.info("Executing: " + query);
		try {
		dbConnection.setSQL(query);
		if (!dbConnection.execute()) {
		logger.error("ERROR: Failed to execute SQL statement.");
		}
		if (!dbConnection.isEndOfStream()) {
			dbout =  dbConnection.getNextString().trim();
			count = dbConnection.getNextInt();
		}
		} catch (Exception e) {
		if (!(e instanceof GSException)) {
		logger.error("ERROR: " + e.getMessage());
		}
		} 
		return dbout;
		}
	public boolean isNumeric(String s) {  
	    return s.matches("[-+]?\\d*\\.?\\d+");  
	}
	
	
}