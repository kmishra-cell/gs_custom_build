/* Put rule on LAGR Segment Level
 * 1. Check if main entity is LAGR or not
 * 2. if message contains LAAT segment and action is update else go to step 6
 * 3. if yes check if min_tsfr_meth_txt or thshld_meth_txt is present else exit
 * 4. if min_tsfr_meth_txt is present and equals "Fixed Amount" or "Other" or "Not Applicable" then end date RTG1 where rtng_grid_purp_typ='MTA'
 * 5. if thshld_meth_txt is present and equals "Fixed Amount" or "Other" or "Not Applicable" then end date RTG1 where rtng_grid_purp_typ='THSHLD'
 * 5.1. if THSHLDVALFQSPTYP is present and is equal to "MN" or "WK"
 *      take all afd1 with action as update
 *      take afd1_oid and leg_agrmnt_id, extract rl_typ from it 
 *      and if equal to MHIMN set FREQ_MNTH_ORD_TYP, FREQ_DY_WK_TYP as null where afd1_oid not in current one and current leg_agrmnt_id and end_tms is null
 *      and if equal to MHIRMN set FREQ_DY_MNTH_TYP as null where afd1_oid not in current one and current leg_agrmnt_id and end_tms is null
 *      and if equal to MHIWK set FREQ_DY_MNTH_TYP, FREQ_MNTH_ORD_TYP as null where afd1_oid not in current one and current leg_agrmnt_id and end_tms is null
 * 6. if message contains LAAP segment and action is update
 * 7. if INDEPENDENTMETHTXT is present and equals "Fixed Amount" or "Other"  or "Not Applicable" then end date RTG1 where rtng_grid_purp_typ='INDPTAMT'
 * 
 */




import java.util.ArrayList;
import java.util.List;
import java.util.Date;

import org.apache.log4j.Logger;

import com.thegoldensource.jbre.DatabaseAccess;
import com.thegoldensource.jbre.DatabaseObjectContainer;
import com.thegoldensource.jbre.GSException;
import com.thegoldensource.jbre.JavaRule;
import com.thegoldensource.jbre.NotificationCreator;
import com.thegoldensource.jbre.ProcessorContext;
import com.thegoldensource.jbre.SegmentId;
import com.thegoldensource.jbre.XMLMessage;

public class CJavaMHIEnddateMarginCall implements JavaRule {
	private static Logger logger = Logger.getLogger("CJavaMHIEnddateMarginCall");

	public boolean initialize(String[] params) {
		if (logger.isDebugEnabled())
		logger.debug("Initializing CJavaMHIEnddateMarginCall Rule");
		return true;
	}

	public boolean process(XMLMessage msg, DatabaseObjectContainer dboc,
			ProcessorContext pContext, DatabaseAccess dbConn, NotificationCreator notfcn)
	throws GSException {

		 if(logger.isDebugEnabled())
       logger.debug("xml: " + msg.getXMLString());
		

		String mainEntityTblTyp = msg.getStringField("MAIN_ENTITY_TBL_TYP", new SegmentId(0));
		if(null == mainEntityTblTyp || !"LAGR".equalsIgnoreCase(mainEntityTblTyp)){
			if (logger.isDebugEnabled())
			{
			logger.debug("Message is not for Legal Agreement. Hence Exiting");
		
			}
			return true;
		}
		
		String msgClassification = msg.getStringField("MSG_CLASSIFICATION", new SegmentId(0));
		if(!"WEBMSG".equalsIgnoreCase(msgClassification))
		{
			if (logger.isDebugEnabled())
			{
			logger.debug("Message is not UI. Hence Exiting");
		
			}
			return true;
		}
		
		
		List<SegmentId> segmentIDLAAT = new ArrayList<SegmentId>();
        segmentIDLAAT = getSegmentIds("LAAPLegalAgreementAnnexPrtThreshold", msg);
        List<SegmentId> segmentIDLAAP = new ArrayList<SegmentId>();
        segmentIDLAAP = getSegmentIds("FLARLegalAgreementAnnexParticipant", msg);
        
        
        List<SegmentId> segmentIDRTG1LAAT = new ArrayList<SegmentId>();
        segmentIDRTG1LAAT = getSegmentIds("LAATRatingTriggerGrid", msg);
        List<SegmentId> segmentIDRTG1LAAP = new ArrayList<SegmentId>();
        segmentIDRTG1LAAP = getSegmentIds("LAAPRatingTriggerGrid", msg);
        
        List<SegmentId> segmentIDAFD1 = new ArrayList<SegmentId>();
        segmentIDAFD1 = getSegmentIds("LAGRAnnexureFrequencyDetails", msg);
        
        List<String> RTG1IDs = new ArrayList<String>();
        
        SegmentId lagrSegId = new SegmentId(0);
		
		String lagrOid = msg.getStringField("LAGR_OID", lagrSegId);
        
        //LAAT Segment Found
        for(SegmentId segID : segmentIDLAAT)
        {
            String action = msg.getAction(segID);
            if(("UPDATE".equals(action)))
            {
            	String minTsfrMethTxt = msg.getStringField("MIN_TSFR_METH_TXT", segID);
            	String thshldMethTxt = msg.getStringField("THSHLD_METH_TXT", segID);
            	if (logger.isDebugEnabled())
            		logger.debug("Inside LAAT"+minTsfrMethTxt+thshldMethTxt);
            	if(null != minTsfrMethTxt && ("Fixed Amount".equals(minTsfrMethTxt) || "Other".equals(minTsfrMethTxt) || "Not Applicable".equals(minTsfrMethTxt)))
            	{
            		String laatOID = msg.getStringField("LAAT_OID", segID);
            		RTG1IDs = getRTG1List(laatOID,"MTA",dbConn);
            		if (logger.isDebugEnabled())
                		logger.debug("Inside LAAT: RTG1IDs "+RTG1IDs);
            		for(String RTG1OID : RTG1IDs)
                    {
            			SegmentId newRTG1seg = msg.addSegment(XMLMessage.A_D_DELETE, "LAATRatingTriggerGrid");
            			msg.addField("RTG1_OID", newRTG1seg, RTG1OID);
            			msg.addField("END_TMS", newRTG1seg, new Date());
            			
            			for(SegmentId RTG1segID :segmentIDRTG1LAAT)
            			{
            				String rtg1OID = msg.getStringField("RTG1_OID", RTG1segID);
            				
            				if(null != rtg1OID && rtg1OID.equals(RTG1OID))
            				{
            					String action1 = msg.getAction(RTG1segID);
            					if(("UPDATE".equals(action1)) ||("INSERT".equals(action1)) )
            		            {
            						msg.setAction(RTG1segID, XMLMessage.A_IGNORE);
            		            }
            					
            				}
            			}
                    }
                 }
            	RTG1IDs.clear();
            	if(null != thshldMethTxt && ("Fixed Amount".equals(thshldMethTxt) || "Other".equals(thshldMethTxt) || "Not Applicable".equals(thshldMethTxt)))
            	{
            		String laatOID = msg.getStringField("LAAT_OID", segID);
            		RTG1IDs = getRTG1List(laatOID,"THSHLD", dbConn);
            		if (logger.isDebugEnabled())
                		logger.debug("Inside LAAT: RTG1IDs "+RTG1IDs);
            		for(String RTG1OID : RTG1IDs)
                    {
            			SegmentId newRTG1seg = msg.addSegment(XMLMessage.A_D_DELETE, "LAATRatingTriggerGrid");
            			msg.addField("RTG1_OID", newRTG1seg, RTG1OID);
            			msg.addField("END_TMS", newRTG1seg, new Date());
            			
            			for(SegmentId RTG1segID : segmentIDRTG1LAAT)
            			{
            				String rtg1OID = msg.getStringField("RTG1_OID", RTG1segID);
            				
            				if(null != rtg1OID && rtg1OID.equals(RTG1OID))
            				{
            					String action1 = msg.getAction(RTG1segID);
            					if(("UPDATE".equals(action1)) ||("INSERT".equals(action1)) )
            		            {
            						msg.setAction(RTG1segID, XMLMessage.A_IGNORE);
            		            }
            					
            				}
            			}
                    }
                 }
            	RTG1IDs.clear();
            	
            	//comparision for frequency
                
                /*5.1. if THSHLDVALFQSPTYP is present and is equal to "MN" or "WK"
                *      take all afd1 with action as update
                *      take afd1_oid and leg_agrmnt_id, extract rl_typ from it 
                *      and if equal to MHIMN set FREQ_MNTH_ORD_TYP, FREQ_DY_WK_TYP as null where afd1_oid not in current one and current leg_agrmnt_id and end_tms is null
                *      and if equal to MHIRMN set FREQ_DY_MNTH_TYP as null where afd1_oid not in current one and current leg_agrmnt_id and end_tms is null
                *      and if equal to MHIWK set FREQ_DY_MNTH_TYP, FREQ_MNTH_ORD_TYP as null where afd1_oid not in current one and current leg_agrmnt_id and end_tms is null*/
                String THSHLDVALFQSPTYP = msg.getStringField("THSHLD_VAL_FQ_SP_TYP", segID);
                if (logger.isDebugEnabled())
            		logger.debug("Inside LAAT"+THSHLDVALFQSPTYP);
                if(null != THSHLDVALFQSPTYP && ("MN".equals(THSHLDVALFQSPTYP) || "WK".equals(THSHLDVALFQSPTYP)) )
                {
                    for(SegmentId segIDAFD1 : segmentIDAFD1)
                    {
                    	
                        	String AFD1OID = msg.getStringField("AFD1_OID", segIDAFD1);
                        	String lagrOID = msg.getStringField("LAGR_OID", segIDAFD1);
                        	String query = null;
                        	String rl_typ = msg.getStringField("RL_TYP", segIDAFD1);
                        	if(null==rl_typ){
                        		
                        	query = "select rl_typ from ft_T_afd1 where end_tms is null and afd1_oid='"+AFD1OID+"'";
                        	rl_typ = getFirstValDB(query, dbConn, logger);
                        	}
                        	if (logger.isDebugEnabled())
                        		logger.debug("Inside AFD1 "+ lagrOID +" "+rl_typ);
                        	if("MHIMN".equals(rl_typ) && null != lagrOID && "MN".equals(THSHLDVALFQSPTYP))
                        	{
                        		String afd1query ="update ft_t_afd1 set end_tms = sysdate() where leg_agrmnt_id ='"+lagrOID+"' and rl_typ in ('MHIRMN','MHIWK')  and end_tms is null";
                        		updateAFD1(afd1query, dbConn, logger);
                        	}
                        	if("MHIRMN".equals(rl_typ) && null != lagrOID && "MN".equals(THSHLDVALFQSPTYP))
                        	{
                        		String afd1query ="update ft_t_afd1 set end_tms = sysdate() where leg_agrmnt_id ='"+lagrOID+"'  and rl_typ in ('MHIMN','MHIWK') and end_tms is null ";
                        		updateAFD1(afd1query, dbConn, logger);
                        	}
                        	if("MHIWK".equals(rl_typ) && null != lagrOID && "WK".equals(THSHLDVALFQSPTYP))
                        	{
                        		String afd1query ="update ft_t_afd1 set end_tms = sysdate() where leg_agrmnt_id ='"+lagrOID+"' and rl_typ in ('MHIMN','MHIRMN') and end_tms is null ";
                        		updateAFD1(afd1query, dbConn, logger);
                        	}
               
                        }
                    }
                if(null != THSHLDVALFQSPTYP && "DY".equals(THSHLDVALFQSPTYP)) 
                {
                	String afd1query ="update ft_t_afd1 set end_tms=sysdate() where lagr_oid ='"+lagrOid+"' ";
            		updateAFD1(afd1query, dbConn, logger);
                }
                }
                
                
                
                }
            	
        for(SegmentId segIDAFD1 : segmentIDAFD1)
        {
        	if("MHIRMN".equals(msg.getStringField("RL_TYP", segIDAFD1))){
        	String query = "select rl_typ from ft_T_afd1 where end_tms is null and lagr_oid='"+lagrOid+"'";
        	if("MHIMN".equals(getFirstValDB(query, dbConn, logger)))
        	{
        		String afd1query ="update ft_t_afd1 set end_tms = sysdate() where lagr_oid ='"+lagrOid+"'  and rl_typ in ('MHIMN') and end_tms is null ";
        		updateAFD1(afd1query, dbConn, logger);
        	}
        	}
        	
        	if("MHIMN".equals(msg.getStringField("RL_TYP", segIDAFD1))){
            	String query = "select rl_typ from ft_T_afd1 where end_tms is null and lagr_oid='"+lagrOid+"'";
            	if("MHIRMN".equals(getFirstValDB(query, dbConn, logger)))
            	{
            		String afd1query ="update ft_t_afd1 set end_tms = sysdate() where lagr_oid ='"+lagrOid+"'  and rl_typ in ('MHIRMN') and end_tms is null ";
            		updateAFD1(afd1query, dbConn, logger);
            	}
            	}
        }
            
        //LAAP Segment Found
        RTG1IDs.clear();
        for(SegmentId segID : segmentIDLAAP)
        {
            String action = msg.getAction(segID);
            if(("UPDATE".equals(action)))
            {
            	String independentMethTxt = msg.getStringField("INDEPENDENT_METH_TXT", segID);
            	if(null != independentMethTxt && ("Fixed Amount".equals(independentMethTxt) || "Other".equals(independentMethTxt) || "Not Applicable".equals(independentMethTxt)))
            	{
            		String laapOID = msg.getStringField("LAAP_OID", segID);
            		RTG1IDs = getRTG1List(laapOID,"INDPTAMT", dbConn);
            		if (logger.isDebugEnabled())
                		logger.debug("Inside LAAP: RTG1IDs "+RTG1IDs);
            		for(String RTG1OID : RTG1IDs)
                    {
            			SegmentId newRTG1seg = msg.addSegment(XMLMessage.A_D_DELETE, "LAATRatingTriggerGrid");
            			msg.addField("RTG1_OID", newRTG1seg, RTG1OID);
            			msg.addField("END_TMS", newRTG1seg, new Date());
            			
            			for(SegmentId RTG1segID : segmentIDRTG1LAAP)
            			{
            				String rtg1OID = msg.getStringField("RTG1_OID", RTG1segID);
            				
            				if(null != rtg1OID && rtg1OID.equals(RTG1OID))
            				{
            					String action1 = msg.getAction(RTG1segID);
            					if(("UPDATE".equals(action1)) ||("INSERT".equals(action1)) )
            		            {
            						msg.setAction(RTG1segID, XMLMessage.A_IGNORE);
            		            }
            					
            				}
            			}
                    }
                 }
            }
            }
        
       
       if(logger.isDebugEnabled())
       logger.debug("xml: " + msg.getXMLString());
		
		return true;

	}
	
	private List<String> getRTG1List(String OID, String rtnggridpurptyp, DatabaseAccess dbConn) {
		List<String> RTG1IDs = new ArrayList<String>();
		if(null != OID && null != rtnggridpurptyp && null!= dbConn)
		{
		String sql = "";
		
		if("INDPTAMT".equals(rtnggridpurptyp)) 
		{
			sql = "select rtg1_oid from ft_t_rtg1 where laap_oid ='"+OID+"' and RTNG_GRID_PURP_TYP='INDPTAMT' and end_tms is null";
		}
		if("MTA".equals(rtnggridpurptyp)) 
		{
			sql = "select rtg1_oid from ft_t_rtg1 where laat_oid ='"+OID+"' and RTNG_GRID_PURP_TYP='MTA' and end_tms is null";
		}
		if("THSHLD".equals(rtnggridpurptyp)) 
		{
			sql = "select rtg1_oid from ft_t_rtg1 where laat_oid ='"+OID+"' and RTNG_GRID_PURP_TYP='THSHLD' and end_tms is null";
		}
		try {
		dbConn.setSQL(sql);
		dbConn.execute();
		
		while (!dbConn.isEndOfStream())
		{
			RTG1IDs.add(dbConn.getNextString().trim());
		}dbConn.close();
		} catch (Exception e) {
			logger.error("SQL query failed, message = '"+ e.getMessage() + "'");
			logger.debug(e);
		}	
		}
		return RTG1IDs;
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
		if (query==null || "".equals(query)){
		return null;
		}
		logger.debug("Executing: " + query);
		try {
		dbConnection.setSQL(query);
		if (!dbConnection.execute()) {
		logger.error("ERROR: Failed to execute SQL statement.");
		}
		if (!dbConnection.isEndOfStream()) {
		return dbConnection.getNextString().trim();
		}
		} catch (Exception e) {
		if (!(e instanceof GSException)) {
		logger.error("ERROR: " + e.getMessage());
		}
		} 
		return null;
		}
	private boolean updateAFD1(String query, DatabaseAccess dbConnection, Logger logger){
		
		try 
		{
		dbConnection.setSQL(query);
		if (!dbConnection.execute()) {
		logger.error("ERROR: Failed to execute SQL statement.");
		return false;
		}
		return true;
		}catch(Exception e)
		{
		if (!(e instanceof GSException)) {
		logger.error("ERROR: " + e.getMessage());
		}
		}finally {
		dbConnection.close();
		}
		return false;
		}


	
}

	