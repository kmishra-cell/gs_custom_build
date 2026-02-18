import org.apache.log4j.Logger;
import java.util.Date;
import java.math.BigDecimal;

import com.thegoldensource.jbre.DatabaseAccess;
import com.thegoldensource.jbre.DatabaseObjectContainer;
import com.thegoldensource.jbre.GSException;
import com.thegoldensource.jbre.JavaRule;
import com.thegoldensource.jbre.NotificationCreator;
import com.thegoldensource.jbre.ProcessorContext;
import com.thegoldensource.jbre.SegmentId;
import com.thegoldensource.jbre.XMLMessage;

public class CJavaMHIUpdatedTMS implements JavaRule {

	private static Logger logger = Logger.getLogger("CJavaMHILastUpdatedTMS");

	public boolean initialize(String[] params) {
		return true;
	}

	public boolean process(XMLMessage xml, DatabaseObjectContainer dbObj,
			ProcessorContext pCon, DatabaseAccess dbConn,
			NotificationCreator notfcn) throws GSException {
		logger.info("CJavaMHILastUpdatedTMS.process()");
	
	 if(logger.isDebugEnabled())
       logger.debug("xml: " + xml.getXMLString());
	
		
		// Run process only for ISSU, ISSR, FINS, CUST or LAGR type 
		SegmentId mainSegId = new SegmentId(0);   				// Read the first segment

		String mainEntityTblTyp = xml.getStringField("MAIN_ENTITY_TBL_TYP", mainSegId);

		if (null == mainEntityTblTyp) {
			logger.info("mainEntityTblTyp is not set. Exiting");
			return true;
		}
		// Exit if not ISSU, ISSR, FINS, CUST or LAGR
		if (!"ISSU".equalsIgnoreCase(mainEntityTblTyp)
				&& !"ISSR".equalsIgnoreCase(mainEntityTblTyp)
				&& !"CUST".equalsIgnoreCase(mainEntityTblTyp)
				&& !"FINS".equalsIgnoreCase(mainEntityTblTyp)
				&& !"LAGR".equalsIgnoreCase(mainEntityTblTyp)) {
			logger.info("mainEntityTblTyp: " + mainEntityTblTyp + ". Exiting");
			return true;
		}

		// Continue process
		logger.info("mainEntityTblTyp: " + mainEntityTblTyp + ".");
		
		// This rule is plugged in two segments: Final and EntityUpdateTimestamp (This is a dummy segment)
		
		String segmentName = pCon.getCurrentSegmentType();
		logger.info("segmentName: " + segmentName);
		
			
		if ("Final".equalsIgnoreCase(segmentName))  // FINAL: Create a dummy segment to plug in this rule
		{
			logger.info("Final - Create a dummy segment." );
			SegmentId dummySegId = xml.addSegment("D_UNKNOWN", "EntityUpdateTimestamp"); 
			xml.addField("UPD1_OID", dummySegId, "DUMMYOID00"); 
			xml.addField("ENTITY_TBL_TYP", dummySegId, "DMMY");	
			xml.addField("XREF_TBL_ROW_OID", dummySegId, "1");	
			
			 if(logger.isDebugEnabled())
                logger.debug("xml: " + xml.getXMLString());
			
			return true;
		}
		else if ( "EntityUpdateTimestamp".equalsIgnoreCase(segmentName) )  // Insert a record to FT_T_UPD1
		{
		
		// entity oid from the first segment
		String tblRowOid = null;

		if ("ISSU".equalsIgnoreCase(mainEntityTblTyp)) {	

			// EG-3492 When updating attributes on FT_T_ISSU table from UI, ISSUER segment is generated bofore ISSU
			//  	   with ACTION=REFERENCE
			//         In such case, treat the next ISSUE segment as mainSegId
			
			if ("ISSUER".equalsIgnoreCase(xml.getSegmentType(mainSegId))){  
				logger.info("MAIN ENTITY=ISSU.TYPE:ISSUER");
				// Read the next segment	
				mainSegId = new SegmentId(1);
				logger.info("INSTR_ID from the second: " + xml.getStringField("INSTR_ID", mainSegId));
			}
			tblRowOid = xml.getStringField("INSTR_ID", mainSegId);
			logger.info("ISSU tblRowOid: " + tblRowOid);
		} else if ("FINS".equalsIgnoreCase(mainEntityTblTyp)) {
			tblRowOid = xml.getStringField("INST_MNEM", mainSegId);
			logger.info("FINS tblRowOid: " + tblRowOid);
		} else if ("ISSR".equalsIgnoreCase(mainEntityTblTyp)) {
			tblRowOid = xml.getStringField("INSTR_ISSR_ID", mainSegId);
			logger.info("ISSR tblRowOid: " + tblRowOid);
		} else if ("CUST".equalsIgnoreCase(mainEntityTblTyp)) {
			tblRowOid = xml.getStringField("CST_ID", mainSegId);
			logger.info("CUST tblRowOid: " + tblRowOid);
		} else if ("LAGR".equalsIgnoreCase(mainEntityTblTyp)) {
			tblRowOid = xml.getStringField("CROSS_REF_ID", mainSegId);
			logger.info("LAGR tblRowOid: " + tblRowOid);
		}

		// user id
		String userId = xml.getStringField("LAST_CHG_USR_ID", mainSegId);	
		
		// Get PROCESSIND from the processed segments 
		// Only C, U and D are interested in
		
		String action = "";
        String mainSegProcInd = xml.getSegmentAttribute(mainSegId, "SEGPROCESSEDIND");
        logger.info((Object)("MAIN SEGPROCESSEDIND: " + mainSegProcInd));
        //if ("N".equals(mainSegProcInd)) {
        if ("C".equals(mainSegProcInd) || "U".equals(mainSegProcInd) || "D".equals(mainSegProcInd)){
        // The main segment is 'C' or 'U' or 'D' - Use that action
            action = mainSegProcInd;
            logger.info((Object)("action from main: " + action));
             
        } else {
        // The main segment is N or E             
            int i = 0;
            while (i < xml.getSegmentCount()) 
            {
                SegmentId segId = new SegmentId(i);
                String segType = xml.getSegmentType(segId);
                logger.info((Object)("segType: " + segType));
                
                if ("SecurityOfInterest".equals(segType))
                {
                	logger.info("SOI segment. Ignoring.");

                } else
                {
	                String segProcInd = xml.getSegmentAttribute(segId, "SEGPROCESSEDIND");
	                logger.info((Object)("segProcInd: " + segProcInd));
	                if ("C".equals(segProcInd) || "U".equals(segProcInd) || "D".equals(segProcInd)) {
	                    action = "U";
	                    logger.info((Object)("action set to : " + action));
	                    break;
	                }
                }
                ++i;
            }
            if ("".equals(action)) {
                logger.info((Object)("None of the segment was updated. Action: " + action + ". Existing"));
                return true;
            }        
        }       
    
		logger.info("Message action: " + action + ". addUpd1");	
		addUpd1(xml, tblRowOid, mainEntityTblTyp, userId, action,	pCon, dbConn);
		
/* Generate UPD1 segment as the transaction updated the data model -- redefined as a method addUpd1 below

		// version number - get max from the table and increment
		
		int verNum = 1;

		String versql = "SELECT NVL(MAX(VERSION),0) FROM FT_T_UPD1 WHERE XREF_TBL_ROW_OID ='" + tblRowOid + "'";

		logger.info("sql :" + versql);

		dbConn.setSQL(versql);
		dbConn.execute();

		if (!dbConn.isEndOfStream()) {

		 	verNum = dbConn.getNextInt().intValue();
		 	logger.info("Current version Number in table: " + verNum);
		 	verNum = verNum + 1;  // Add 1 to the currect value
  		}

		logger.info("New version Number: " + verNum);
		
		// sequenceno - get the unique number
		BigDecimal seqno = null;
		
		dbConn.setSQL("select FT_T_UPD1_VERSION_SEQUENCE.nextval from dual");
		if (!dbConn.execute())
			{
				logger.debug("nextval The query execution failed");
			}
		if (dbConn.isEndOfStream())
			{
				logger.debug("nextval No rows are fetched");
			}    
		while (!dbConn.isEndOfStream())
			{
			seqno = dbConn.getNextDecimal();
			}
		logger.info("From Sequence - seqno:" + seqno );

		// Add UPD1 segment
		
		logger.info("Add UPD1 segment." );
		SegmentId newSegId = xml.addSegment("D_INSERT", "EntityUpdateTimestamp"); 
		xml.addField("UPD1_OID", newSegId, pCon.getOid() ); 
		xml.addField("ENTITY_TBL_TYP", newSegId, mainEntityTblTyp);	
		xml.addField("XREF_TBL_ROW_OID", newSegId, tblRowOid);	
		xml.addField("UPDATED_TMSMP", newSegId, new Date());
		xml.addField("TRN_ID", newSegId, pCon.getScopedTransaction().getTransactionID());
		xml.addField("REFERENCE", newSegId, userId);
		xml.addField("ENTITY_CHG_IND", newSegId, action);
		xml.addField("VERSION", newSegId, new BigDecimal(verNum));
		xml.addField("SEQUENCENO", newSegId, seqno);
		
		logger.debug("EntityUpdateTimestamp Segment Added. MSG = " + xml.getXMLString());
*/		
		
		// EG-8049 Adding Ultimate Parent Issuer to IOI is not logged in UPD1 hence not included to subsequent publishing
		// Apply only ISSR message. USERID = AddToIOI. Capture INSTR_ISSR_ID for Ultimate Parent Issue
        // Look for SEGMENT where TYPE="ISSRIssuerGroupParticipant" SEGPROCESSEDIND="C"  &  INSTRISSRID != MAIN_ENTITY_ID         
        		
		if ("ISSR".equalsIgnoreCase(mainEntityTblTyp) && "AddToIOI".equalsIgnoreCase(userId) ) { 

		logger.debug("Checkif AddToIOI && IRGP Segment && SEGPROCESSEDIND=C") ;
		int i = 0;
        while (i < xml.getSegmentCount()) 
        {
            SegmentId segId = new SegmentId(i);
            String segType = xml.getSegmentType(segId);
            String segProcInd = xml.getSegmentAttribute(segId, "SEGPROCESSEDIND");
            logger.info((Object)("segType: " + segType));
            logger.info((Object)("segProcInd: " + segProcInd));
            
            if ("ISSRIssuerGroupParticipant".equals(segType)) {
                       	 	
            	if ("C".equals(segProcInd)) {
            		logger.info("Action is C");
        			logger.info("InstrIssrId for child issuer: " + tblRowOid);
 	
            		String instrIssrId = xml.getStringField("INSTR_ISSR_ID", segId);
            		logger.info("InstrIssrId for IRGP segment: " + instrIssrId);
            		
            		// If INSTR_ISSR_ID != tblRowOid, generate UPD1 segment
            		if (!(tblRowOid.equals(instrIssrId))) 
            		{
            			logger.info("InstrIsserId is different from tblRowOID. Call addUPD1");
	            		addUpd1(xml, instrIssrId, "ISSR", userId, "U",	pCon, dbConn);
	            		
            		} // End if	
            	}

            } 
            
            ++i;
            
        } // End while
        
        if ("".equals(action)) {
            logger.info((Object)("action not set: " + action + ". Existing"));
            return true;
        } 
		} // End of Issuer message type additional
		
		// End of EG-8049
				        
		return true;
	}// End EntityUpdateTimestamp segment process
		return true; // when Segment Name is not Final nor EntityUpdateTimestamp
  } // End process
	
	public void addUpd1(XMLMessage xml, String tblRowOid, String mainEntityTblTyp, String userId, String action,
			ProcessorContext pCon, DatabaseAccess dbConn){
		
		// Generate UPD1 segment as the transaction updated the database
		// version number - get max from the table and increment
		
		int verNum = 1;

		String versql = "SELECT COALESCE(MAX(VERSION),0) FROM FT_T_UPD1 WHERE XREF_TBL_ROW_OID ='" + tblRowOid + "'";

		logger.info("sql :" + versql);

		dbConn.setSQL(versql);
		dbConn.execute();

		if (!dbConn.isEndOfStream()) {

		 	verNum = dbConn.getNextInt().intValue();
		 	logger.info("Current version Number in table: " + verNum);
		 	verNum = verNum + 1;  // Add 1 to the current value
  		}

		logger.info("New version Number: " + verNum);
		
		// sequenceNo - get the unique number
		BigDecimal seqno = null;
		
		dbConn.setSQL("select nextval('FT_T_UPD1_VERSION_SEQUENCE') from dual");
		if (!dbConn.execute())
			{
				logger.debug("nextval The query execution failed");
			}
		if (dbConn.isEndOfStream())
			{
				logger.debug("nextval No rows are fetched");
			}    
		while (!dbConn.isEndOfStream())
			{
			seqno = dbConn.getNextDecimal();
			}
		logger.info("From Sequence - seqno:" + seqno );

		// Add UPD1 segment
		
		logger.info("Add UPD1 segment." );
		SegmentId newSegId = xml.addSegment("D_INSERT", "EntityUpdateTimestamp"); 
		xml.addField("UPD1_OID", newSegId, pCon.getOid() );
		xml.addField("ENTITY_TBL_TYP", newSegId, mainEntityTblTyp);	
		xml.addField("XREF_TBL_ROW_OID", newSegId, tblRowOid);	
		xml.addField("UPDATED_TMSMP", newSegId, new Date());
		xml.addField("TRN_ID", newSegId, pCon.getScopedTransaction().getTransactionID());
		xml.addField("REFERENCE", newSegId, userId);
		xml.addField("ENTITY_CHG_IND", newSegId, action);
		xml.addField("VERSION", newSegId, new BigDecimal(verNum));
		xml.addField("SEQUENCENO", newSegId, seqno);
		
		 if(logger.isDebugEnabled())
          logger.debug("EntityUpdateTimestamp Segment Added. MSG = " + xml.getXMLString());
		
	}// End addUpd1

} // End CJavaMHIUpdatedTMS
