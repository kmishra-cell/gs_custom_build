import com.thegoldensource.jbre.*;
import org.apache.log4j.Logger;

public class CJavaMIZResetRecalculateIssue implements JavaRule {
	private static Logger logger = Logger.getLogger("InternalRating");

	public CJavaMIZResetRecalculateIssue() {
	}

	// Function to indicate initialization of the Internal Ratings Rule along
	// with any variables.
	public boolean initialize(String[] parameters) {
		logger.debug("Initializing CJavaMIZResetRecalculateIssue Rule");
		logger.debug("Initialized CJavaMIZResetRecalculateIssue Rule");
		return true;
	}

	// Function to process the XML message being processed.
	public boolean process(XMLMessage msg, DatabaseObjectContainer dboc,
			ProcessorContext pContext, DatabaseAccess dbConnection,
			NotificationCreator notificationCreator) {

		logger.debug("Processing Java rule CJavaMIZResetRecalculateIssue Rule");
		
		if(logger.isDebugEnabled())
           logger.debug("xml: " + msg.getXMLString());
		

		if (Common.isMergeMessage(msg, logger))
			return true;
/*
		String msgClassification = msg.getStringField("MSG_CLASSIFICATION", new SegmentId(0));
		if("WEBMSG".equalsIgnoreCase(msgClassification)){
			logger.debug("Message is from UI. Hence Exiting");
			return true;
		}
*/
		String mainEntityTblTyp = msg.getStringField("MAIN_ENTITY_TBL_TYP", new SegmentId(0));
		if(null !=mainEntityTblTyp && "ISSU".equalsIgnoreCase(mainEntityTblTyp)){
			String strInstrId = pContext.getInstrId();
			String sqlGetPortfolioOid = "SELECT P.INSTR_ID FROM FT_T_ISGP P, FT_T_ISGP CL WHERE P.PRNT_ISS_GRP_OID = CL.PRNT_ISS_GRP_OID"+
										" AND P.PRT_PURP_TYP = 'PRTFLIOP' AND CL.PRT_PURP_TYP = 'PRTFLIOC' AND CL.INSTR_ID = '"+strInstrId+"'"+
										" AND P.START_TMS <= SYSDATE() AND (P.END_TMS IS NULL OR P.END_TMS > SYSDATE())"+
										" AND CL.START_TMS <= SYSDATE() AND (CL.END_TMS IS NULL OR CL.END_TMS > SYSDATE())";
			int segmentCount = msg.getSegmentCount();
			boolean ratingFlag = false;
			
			logger.debug("segmentCount="+segmentCount);
			for(int currSegment = 0; currSegment < segmentCount; currSegment++){
				SegmentId segId = new SegmentId(currSegment);
				String segName = msg.getSegmentType(segId);
				logger.debug("CJavaMIZResetRecalculateIssue: segName="+segName);
				if (segName.equalsIgnoreCase("IssueRating") || segName.equalsIgnoreCase("ISSUIssueGroupParticipant")){
					String segProcInd = msg.getSegmentAttribute(segId,"SEGPROCESSEDIND");
					if(null != segProcInd && ("C".equalsIgnoreCase(segProcInd)
												|| "U".equalsIgnoreCase(segProcInd)
												|| "D".equalsIgnoreCase(segProcInd))){
						ratingFlag = true;
						break;
					}
				}
			}
			// EG-6782 set sys_eff_end_Tms for deleted IssueRatings
			logger.info("CJavaMIZResetRecalculateIssue check for deleted IssueRating");
			for(int currSegment = 0; currSegment < segmentCount; currSegment++){
				SegmentId segId = new SegmentId(currSegment);
				String segName = msg.getSegmentType(segId);
				if (segName.equalsIgnoreCase("IssueRating") ){
					logger.info("CJavaMIZResetRecalculateIssue: segName="+segName);
					String segProcInd = msg.getSegmentAttribute(segId,"SEGPROCESSEDIND");
					if(null != segProcInd && "D".equalsIgnoreCase(segProcInd)){
						String ratingOid = msg.getStringField("ISS_RTNG_OID", segId);
						logger.info("CJavaMIZResetRecalculateIssue: ISS_RTNG_OID="+ratingOid);
						try {
							String setSysEffEndTmsSQL = "update FT_T_ISRT set SYS_EFF_END_TMS = END_TMS where ISS_RTNG_OID = '" + ratingOid + "'";
							logger.info("setSysEffEndTmsSQL: " + setSysEffEndTmsSQL);
							dbConnection.setSQL(setSysEffEndTmsSQL);
							dbConnection.execute();
						} catch (Exception e) {
							e.printStackTrace();
						}
					}
				}
			}
			logger.info("CJavaMIZResetRecalculateIssue end of check for deleted IssueRating");
				

			String strPortId = selectQueryString(dbConnection, sqlGetPortfolioOid);
			if(null == strPortId || "".equalsIgnoreCase(strPortId)){
				logger.debug("No portfolio found. Hence Exiting...");
				return true;
			}
			if(ratingFlag){
				// Rating changed hence changing the statistics to Y
				generateIsstSegment(msg, strInstrId, strPortId);
			}else{
				String sqlCheckPortfolio = "SELECT GETRECALCFLAF('"+strInstrId+"', '"+strPortId+"') FROM DUAL";
				String getValue = selectQueryString(dbConnection, sqlCheckPortfolio);
				if(null == getValue || "".equalsIgnoreCase(getValue) || "null".equalsIgnoreCase(getValue)){
					logger.debug("No matching portfolio found with Issuer information. Hence reseting the flag to Y....");
					generateIsstSegment(msg, strInstrId, strPortId);
				}
			}
		} else {
			logger.debug("Main Entity is not Issue. Hence Exiting");
			return true;
		}

		 if(logger.isDebugEnabled())
       logger.debug("xml: " + msg.getXMLString());
   
		logger.debug("Sucessfully processed Java rule CJavaMIZResetRecalculateIssue");
		return true;
	}
	void generateIsstSegment(XMLMessage msg, String instrId, String strPortId){
		SegmentId portIssueSegmentId = msg.addSegment(XMLMessage.A_REFERENCE,"Issue");
		msg.addField("INSTR_ID", portIssueSegmentId, strPortId );

		SegmentId segmentId = msg.addSegment(XMLMessage.A_D_UNKNOWN,"IssueStatistic");
		msg.addField("STAT_DEF_ID", segmentId, "MIZRECAL");
		msg.addField("INSTR_ID", segmentId, strPortId );
		msg.addField("STAT_CHAR_VAL_TXT", segmentId, "Y");

		SegmentId issueSegmentId = msg.addSegment(XMLMessage.A_REFERENCE,"Issue");
		msg.addField("INSTR_ID", issueSegmentId, instrId );

	}
	String selectQueryString(DatabaseAccess dbConnection, String query){
		String retValue = "";
		try {
			dbConnection.setSQL(query);
			dbConnection.execute();
			if (!dbConnection.isEndOfStream()) {
				retValue = dbConnection.getNextString().trim();
			}
			dbConnection.close();
		} catch (Exception e) {
			logger.error("SQL query failed, message = '"+ e.getMessage() + "'");
			logger.debug(e);
		}
		return retValue;
	}
}
