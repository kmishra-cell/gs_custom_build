import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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


public class CJavaMHIValidateLegAgrmntLabel implements JavaRule {

	private static Logger logger = Logger.getLogger("CJavaMHIValidateLegAgrmntLabel");
	private static int count= 0;

	public boolean initialize(String[] params) {

		logger.info("Initializing CJavaMHIValidateLegAgrmntLabel Rule");
		return true;
	}

	public boolean process(XMLMessage msg, DatabaseObjectContainer dboc,
			ProcessorContext pContext, DatabaseAccess dbConn, NotificationCreator notfcn)
	throws GSException {

	      if(logger.isDebugEnabled())
                 logger.debug("xml: " + msg.getXMLString());
	

		String mainEntityTblTyp = msg.getStringField("MAIN_ENTITY_TBL_TYP", new SegmentId(0));
		if(null == mainEntityTblTyp || !"LAGR".equalsIgnoreCase(mainEntityTblTyp)){
			logger.debug("Message is not for Legal Agreement. Hence Exiting");
			
			
			 if(logger.isDebugEnabled())
                 logger.debug("xml: " + msg.getXMLString());
			
			return true;
		}	
		
		//get Agreement Label from message segment
		SegmentId lagrSegId = new SegmentId(0);
		
		//Vars for LAGR
		String orgId = msg.getStringField("ORG_ID", lagrSegId);
		String lagrOId = msg.getStringField("LAGR_OID", lagrSegId);
        String agrmntPurpTyp = msg.getStringField("AGRMNT_PURP_TYP", lagrSegId);
		String agrmntTyp = msg.getStringField("AGRMNT_TYP", lagrSegId);
		String agrmntStatTyp = msg.getStringField("AGRMNT_STAT_TYP", lagrSegId);
		String lagrAction = msg.getAction(lagrSegId);
		
		//Vars for FLARS
		List<SegmentId> segmentIDFLAR = new ArrayList<SegmentId>();
        segmentIDFLAR = getSegmentIds("LAGRFinancialInstitutionAgreementRole", msg); //FinancialInstOrAgreementRole
		String instMnem = null;
		String agncyTranAppliesInd = null;
		
		//Vars for LACVs
		List<SegmentId> segmentIDFLARLACV = new ArrayList<SegmentId>();
        segmentIDFLARLACV = getSegmentIds("FLARLegalAgreementCoverage", msg); //LegalAgreementCoverage
		String branchName = null;
		String branchNameStr = null;
		Integer lacvCounter = 0;
		
		String counter = "01";
		String issrId = null;
		String fagrmntStatTyp = null;
		String lacvoidStr = null;
		
		logger.info("LAGR_OID : " + lagrOId);
		logger.info("ORG_ID: " + orgId);
		
		if ("SIGNED".equals(agrmntStatTyp)) {fagrmntStatTyp = "SIGNED";}
		if  (agrmntStatTyp == null || "".equals(agrmntStatTyp)) {
			//Check DB if this is an update message
			agrmntStatTyp = getFirstValDB("select agrmnt_stat_typ from ft_T_lagr lagr where end_tms is null and lagr.LAGR_OID ='"+lagrOId+"'", dbConn, logger);   		
		}
		
		//I don't think we need this anymore
		//agrmntLabel = agrmntLabel.replaceAll("'", "''");
		
		if ("SIGNED".equals(agrmntStatTyp)) {
			
			//Check fields which are not on the message but may be saved to the DB for this record (update message scenario)
			
			
			if  (orgId == null || "".equals(orgId)) {
				//Check DB if this is an update message
				orgId = getFirstValDB("select org_id from ft_t_lagr lagr where end_tms is null and lagr.LAGR_OID ='"+lagrOId+"'", dbConn, logger);    		
				
				if (logger.isInfoEnabled())
    			{
            		logger.info("An orgId field was not found on message. Checked from DB and found: "+orgId);
    			}
			}
			
			
			if  (agrmntPurpTyp == null || "".equals(agrmntPurpTyp)) {
				//Check DB if this is an update message
				agrmntPurpTyp = getFirstValDB("select agrmnt_purp_typ from ft_t_lagr lagr where end_tms is null and lagr.LAGR_OID ='"+lagrOId+"'", dbConn, logger);   		
				
				if (logger.isInfoEnabled())
    			{
            		logger.info("An agrmnt_purp_typ field was not found on message. Checked from DB and found: "+agrmntPurpTyp);
    			}
			}
			
			if  (agrmntTyp == null || "".equals(agrmntTyp)) {
				//Check DB if this is an update message
				agrmntTyp = getFirstValDB("select agrmnt_typ from ft_t_lagr lagr where end_tms is null and lagr.LAGR_OID ='"+lagrOId+"'", dbConn, logger);   		
				
				if (logger.isInfoEnabled())
    			{
            		logger.info("An agrmnt_typ field was not found on message. Checked from DB and found: "+agrmntTyp);
    			}
			}
				
			Integer lonBrnchCnt =0;
					
			for(SegmentId segID : segmentIDFLARLACV)
	        {
				String actionLACV = msg.getAction(segID);
				
				//debug info
				if (logger.isInfoEnabled())
				{
					logger.info("actionLACV is: "+actionLACV);
				}
				
				if("INSERT".equals(actionLACV) || "UPDATE".equals(actionLACV))
	        	{
					
					
					branchName = msg.getStringField("DLR_BR_NME", segID);
					
					//The following checks if there is a branch update. If so then this branch should later be excluded from
					//the logic which checks what db entries for branches exist for the agreement. The logic being that this 
					//data will now be updated so should not be included in the uniqueness check. The logic also checks there 
					//is a branch present on the update segment else it may be an update to another field (e.g product for example) 
					if("UPDATE".equals(actionLACV) && !(branchName==null ||"".equals(branchName)))
		        	{	
						if (logger.isInfoEnabled())
						{
							logger.info("Entered update LACV logic...");
						}
						String lacvoid = msg.getStringField("LACV_OID", segID);
						if (lacvCounter > 0) {lacvoidStr = lacvoidStr+",";}
						if (lacvCounter == 0) {lacvoidStr = "'"+lacvoid+"'";}
						else {lacvoidStr = lacvoidStr+"'"+lacvoid+"'";}
						if (logger.isInfoEnabled())
						{
							logger.info("Completed LACV logic. LACV_ID string is set to: "+lacvoidStr);
						}
		        	}
					
					
					if ("London".equals(branchName)){lonBrnchCnt++;}
					
					
					//debug info
					if (logger.isInfoEnabled())
					{
						logger.info("agrmntPurpTyp is: "+agrmntPurpTyp+". The branch name is: "+branchName+". The actionLACV is: "+actionLACV+". The London branch counter is:"+lonBrnchCnt);
					}
					
					
					//The MHI London branch needs to be excluded from the count for the check.
					//By default the MHI London branch is always present therefore only when London branch count is above 1 is there
					//a CPTY London branch present.				
					if (!("London".equals(branchName) && lonBrnchCnt == 1 && "INSERT".equals(lagrAction))){
					
						if (lacvCounter > 0) {branchNameStr = branchNameStr+",";}
						
						if (lacvCounter == 0) {branchNameStr = "'"+branchName+"'";}
						else {branchNameStr = branchNameStr+"'"+branchName+"'";}
						
						lacvCounter++;
						if (logger.isInfoEnabled())
						{
							logger.info("Legal Ref segmentIDFLARLACV logic.The lacvCounter is: "+lacvCounter+". The branch name is: "+branchName+". The branch name string is: "+branchNameStr+". The London branch counter is:"+lonBrnchCnt);
						}
					}
	        	}
				
	        }
			
			for(SegmentId segID : segmentIDFLAR)
	        {
	        	if (logger.isInfoEnabled())
				{
					logger.info("segmentIDFLAR found. Going into segmentIDFLAR logic...");
				}
	        	
	        	String rlTyp = msg.getStringField("RL_TYP", segID);
	        	
	        	if (null == rlTyp || "".equals(rlTyp)) {
	        		
	        		String flaroid = msg.getStringField("FLAR_OID", segID);
	        		rlTyp = getFirstValDB("select distinct rl_typ from FT_T_FLAR where end_tms is null and flar_oid = '"+flaroid+"'", dbConn, logger);
            		
	        		if (logger.isInfoEnabled())
					{
						logger.info("RL_TYP set to: "+rlTyp);
					}
	        	}
	        	
	        	String actionFLAR = msg.getAction(segID);
	        	
	        	
	        	
	        	if("CPTY".equals(rlTyp) && ("INSERT".equals(actionFLAR) || "UPDATE".equals(actionFLAR)))
	        	{
	        		instMnem = msg.getStringField("INST_MNEM", segID);
	        		
	            	if (logger.isInfoEnabled())
	    			{
	            		logger.info("FLAR CPTY update or insert segment found...");
	            		logger.info("Checking CLEINTREF ISSR ID against LAGR in database...");
	    			}
							   				
    				issrId = getFirstValDB("select irid.ISSR_ID,count(*) from ft_T_lagr lagr, ft_t_flar flar, ft_t_issr issr, ft_t_irid irid  where lagr.LAGR_OID = flar.LAGR_OID and flar.INST_MNEM = issr.FINS_INST_MNEM and issr.INSTR_ISSR_ID = irid.INSTR_ISSR_ID and flar.rl_typ in ('CPTY') and flar.org_id='MHI' and agrmnt_purp_typ in ('"+agrmntPurpTyp+"') and irid.ISSR_ID_CTXT_TYP='CLIENTREF' and issr.END_TMS is null and irid.END_TMS is null and flar.inst_mnem='"+instMnem+"' group by irid.ISSR_ID", dbConn, logger);
            			
    				
    				if((null == issrId || "".equals(issrId)))
            		{
    					
            			issrId = getFirstValDB("select irid.issr_id from ft_T_issr issr, ft_t_irid irid where issr.INSTR_ISSR_ID = irid.INSTR_ISSR_ID  and ISSR.FINS_INST_MNEM='"+instMnem+"' and irid.ISSR_ID_CTXT_TYP='CLIENTREF' and issr.END_TMS is null and irid.END_TMS is null", dbConn, logger);
            			
            			if (logger.isInfoEnabled())
    					{
    						logger.info("LAGR check for ISSR ID not found. Trying check against IRID, ISSR and found: "+issrId);
    					}
            		}else
            		{
            			counter = String.format("%02d", count+1);
            			if (logger.isInfoEnabled())
    					{
    						logger.info("LAGR check for ISSR ID found: "+issrId+". Counter is: "+counter);
    					}
            		}
	    					            			        	
	              }
	        	
	        	//check for AGNCY_TRAN_APPLIES_IND on MHI FLAR entry
	        	if("MHI".equals(rlTyp) && ("INSERT".equals(actionFLAR) || "UPDATE".equals(actionFLAR)))
	        	{
	        		
	            	if (logger.isInfoEnabled())
	    			{
	            		logger.info("FLAR MHI update or insert segment found...");
	            		logger.info("Checking for AGNCY_TRAN_APPLIES_IND...");
	    			}
	            	
	            	agncyTranAppliesInd = msg.getStringField("AGNCY_TRAN_APPLIES_IND", segID);
	            	
	            	if (logger.isInfoEnabled())
	    			{
	            		logger.info("AGNCY_TRAN_APPLIES_IND from message: "+agncyTranAppliesInd);
	    			}            	
	        	}
		
			}
			
			//If fields are not present on the message they could be present on the DB so check there...
			
			//taken from the CPTY entry for FLAR
			if  (instMnem == null || "".equals(instMnem)) {
				instMnem = getFirstValDB("select inst_mnem from ft_t_flar flar where end_tms is null and rl_typ ='CPTY' and flar.LAGR_OID ='"+lagrOId+"'", dbConn, logger);   		
				if (logger.isInfoEnabled())
    			{
            		logger.info("An inst_mnem field was not found on message. Checked from DB and found: "+instMnem);
    			}
			}
			
			//taken from the MHI entry for FLAR
			if  (agncyTranAppliesInd == null || "".equals(agncyTranAppliesInd)) {
				agncyTranAppliesInd = getFirstValDB("select agncy_tran_applies_ind from ft_t_flar flar where end_tms is null and rl_typ ='MHI' and flar.LAGR_OID ='"+lagrOId+"'", dbConn, logger);   		
				if (logger.isInfoEnabled())
    			{
            		logger.info("An agncy_tran_applies_ind field was not found on message. Checked from DB and found: "+agncyTranAppliesInd);
    			}
			}
						
			if ("Y".equals(agncyTranAppliesInd)) {agncyTranAppliesInd="='Y'";}
        	else {agncyTranAppliesInd="!='Y'";}
			
			//if there is no branch on the message or the lagr already exists, so update or reference (meaning there could be locations attached already) 
			//then check the database for any entries
			if (("SIGNED".equals(fagrmntStatTyp)) && ("UPDATE".equals(lagrAction) || "REFERENCE".equals(lagrAction))){
				
				if (logger.isInfoEnabled())
				{
					logger.info("Entering DB branch logic - branchName: "+branchName);
					logger.info("lagrAction:"+lagrAction);
				}
				
				String sqlLocation = 	"select dlr_br_nme from (select * from FT_T_FLAR where end_tms is null and rl_typ = 'CPTY') flarcpty,"+" (select * from FT_T_LACV where end_tms is null) lacv"+
				" where flarcpty.flar_oid = lacv.flar_oid and FLARCPTY.lagr_oid = '"+lagrOId+"'";
				if (!(lacvoidStr == null || "".equals(lacvoidStr))){
					sqlLocation= sqlLocation+" and lacv_oid not in("+lacvoidStr+")";
				}
				
				dbConn.setSQL(sqlLocation);
				try{
					dbConn.execute();
					if (logger.isInfoEnabled())
					{
						logger.info("Execution of sql has run:"+sqlLocation);
					}
					
				} catch (Exception ex){
					//if error given on sql execution, log error and raise notification and exit rule
					logger.error("Oracle sql error: "+ex);
					
					String[] param = {"SQLString"};
					String[] paramVal = {sqlLocation};
					notfcn.raiseException("STRDATA","RULEPRC", 50008, param, paramVal);
					return true;
				}
				
				while (!dbConn.isEndOfStream()) {
					branchName = dbConn.getNextString().trim();
					
					if (lacvCounter == 0) {branchNameStr = "'"+branchName+"'";}
					else {branchNameStr = branchNameStr+",'"+branchName+"'";}
					
					
					if (logger.isInfoEnabled())
	    			{
	            		logger.info("Branch name from DB is: "+branchName+". Branch name string is: "+branchNameStr+". Lacv Counter set to: "+lacvCounter);
	    			}
					
					lacvCounter++;
					
				}
				
			}
			
			String sql = null;
			
			if ("LEGAGRMT".equals(agrmntPurpTyp)) {					
				//build ISDA string...
				
				sql = 	"select agrmnt_desc from "+	
				" (select * from FT_T_LAGR where end_tms is null) lagr,"+
				" (select * from FT_T_FLAR where end_tms is null and rl_typ = 'CPTY') flarcpty,"+
				" (select * from FT_T_LACV where end_tms is null) lacv"+
				" where LAGR.leg_agrmnt_id = FLARCPTY.leg_agrmnt_id"+
				" and FLARCPTY.flar_oid = LACV.flar_oid"+ 
				" and LAGR.agrmnt_stat_typ = 'SIGNED'"+ //check is always for SIGNED records only
				" and LAGR.lagr_oid = '"+lagrOId+"'"+
				" and LAGR.agrmnt_purp_typ = '"+agrmntPurpTyp+"'"+
				" and FLARCPTY.inst_mnem = '"+instMnem+"'"+
				" and LACV.dlr_br_nme in ("+branchNameStr+")";
				
				if (logger.isInfoEnabled())
    			{
            		logger.info("Build ISDA/CEA sql string. Sql set to: "+sql);
    			}
					
			}else if ("LGAGTREPO".equals(agrmntPurpTyp)||"LGAGTCEA".equals(agrmntPurpTyp)) {
				//build REPO/CEA sql string...
				
				sql = 	"select agrmnt_desc from "+	
				" (select * from FT_T_LAGR where end_tms is null) lagr,"+
				" (select * from FT_T_FLAR where end_tms is null and rl_typ = 'CPTY') flarcpty,"+
				" (select * from FT_T_FLAR where end_tms is null and rl_typ = 'MHI') flarmhi,"+
				" (select * from FT_T_LACV where end_tms is null) lacv"+
				" where LAGR.leg_agrmnt_id = FLARCPTY.leg_agrmnt_id"+
				" and FLARCPTY.leg_agrmnt_id = FLARMHI.leg_agrmnt_id"+
				" and FLARCPTY.flar_oid = LACV.flar_oid"+ 
				" and LAGR.agrmnt_stat_typ = 'SIGNED'"+ //check is always for SIGNED records only
				" and LAGR.lagr_oid = '"+lagrOId+"'"+
				" and LAGR.agrmnt_typ = '"+agrmntTyp+"'"+
				" and LAGR.agrmnt_purp_typ = '"+agrmntPurpTyp+"'"+				
				" and FLARCPTY.inst_mnem = '"+instMnem+"'"+
				" and FLARMHI.agncy_tran_applies_ind "+agncyTranAppliesInd+
				" and LACV.dlr_br_nme in ("+branchNameStr+")";
				
				if (logger.isInfoEnabled())
    			{
            		logger.info("Build Repo sql string. Sql set to: "+sql);
    			}
			} else {
				if (logger.isInfoEnabled())
	    			{
	            		logger.info("Model is not valid for this rule. Model set to: "+agrmntPurpTyp);
	            		//exit rule
	            		return true;
	    			}
				
			}		

			//execute string
			
			if (logger.isInfoEnabled())
			{
        		logger.info("About to run sql...");
			}
			dbConn.setSQL(sql);
			try{
				dbConn.execute();
				if (logger.isInfoEnabled())
				{
					logger.info("Execution of sql has run:"+sql);
				}
				
			} catch (Exception ex){
				//if error given on sql execution, log error and raise notification and exit rule
				logger.error("Oracle sql error: "+ex);
				
				String[] param = {"SQLString"};
				String[] paramVal = {sql};
				notfcn.raiseException("STRDATA","RULEPRC", 50008, param, paramVal);
				return true;
			}
			
			//if select returns data found then raise error...
			if (!dbConn.isEndOfStream())
			{
				logger.error("A signed agreement already exists with this combination of Counterparty, Agreement Type, MHI Agency Flag and Location(s) selection: " +instMnem+","+agrmntTyp+","+agncyTranAppliesInd+","+branchNameStr+ ". Please enter a different combination.");
				String[] param = {"AgreementLabel"};
				String[] paramVal = {agrmntTyp};
				notfcn.raiseException("STRDATA","RULEPRC", 50008, param, paramVal);
				return true;
			}
			
			//otherwise no data found and label is valid
			logger.debug("The Agreement does not exist.Valid. ");
			return true;
		
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
	
	
}