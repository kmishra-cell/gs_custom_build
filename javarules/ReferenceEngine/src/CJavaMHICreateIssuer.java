import org.apache.log4j.Logger;

import com.thegoldensource.jbre.DatabaseAccess;
import com.thegoldensource.jbre.DatabaseObjectContainer;
import com.thegoldensource.jbre.GSException;
import com.thegoldensource.jbre.JavaRule;
import com.thegoldensource.jbre.NotificationCreator;
import com.thegoldensource.jbre.ProcessorContext;
import com.thegoldensource.jbre.SegmentId;
import com.thegoldensource.jbre.XMLMessage;


public class CJavaMHICreateIssuer implements JavaRule {

	private static Logger logger = Logger.getLogger("CJavaMHICreateIssuer");

	public boolean initialize(String[] params) {

		logger.debug("Initializing CJavaMHICreateIssuer Rule");
        return true;
	}

	public boolean process(XMLMessage msg, DatabaseObjectContainer dboc,
			ProcessorContext pContext, DatabaseAccess dbConn, NotificationCreator notfcn)
			throws GSException {
			
			 if(logger.isDebugEnabled())
               logger.debug("xml: " + msg.getXMLString());

		String msgClassification = msg.getStringField("MSG_CLASSIFICATION", new SegmentId(0));
		if("WEBMSG".equalsIgnoreCase(msgClassification)){

			String action = msg.getAction(pContext.getCurrentSegmentId());
			logger.info("action: " + action);

			if (action.equals(XMLMessage.A_INSERT))
			{

				String instMnem = msg.getStringField("INST_MNEM",pContext.getCurrentSegmentId());
				logger.info("instMnem: " + instMnem);

				for(int i=0; i < msg.getSegmentCount(); i++)
				{
					SegmentId segId = new SegmentId(i);
					String segType = msg.getSegmentType(segId);
					if ("FinancialInstitution".equals(segType))
					{
						SegmentId newSeg = msg.addSegment(XMLMessage.A_INSERT, "Issuer");
						msg.addField("FINS_INST_MNEM", newSeg, instMnem);
						msg.addField("DATA_SRC_ID", newSeg, msg.getStringField("DATA_SRC_ID", segId));
						msg.addField("DATA_STAT_TYP", newSeg, msg.getStringField("DATA_STAT_TYP", segId));
						msg.addField("ISSR_NME", newSeg, msg.getStringField("INST_NME", segId));
						msg.addField("START_TMS", newSeg, msg.getDateTimeField("START_TMS", segId));
						msg.addField("PREF_ISSR_ID", newSeg, msg.getStringField("PREF_FINS_ID", segId));
						msg.addField("PREF_ID_CTXT_TYP", newSeg, msg.getStringField("PREF_FINS_ID_CTXT_TYP", segId));
						msg.addField("ISSR_DESC", newSeg, msg.getStringField("INST_DESC", segId));
						msg.addField("ISSR_TYP", newSeg, msg.getStringField("INST_TYP", segId));
						msg.addField("SEC_FORM_15_IND", newSeg, msg.getStringField("SEC_FORM_15_IND", segId));
						msg.addField("COMPANY_MATCH_ID", newSeg, msg.getStringField("COMPANY_MATCH_ID", segId));
						msg.addField("FISCAL_YR_END_TYP", newSeg, msg.getStringField("FISCAL_YR_END_TYP", segId));
						msg.addField("FUND_SRCE_TYP", newSeg, msg.getStringField("FUND_SRCE_TYP", segId));
						msg.addField("GOVT_AGENCY_FILING_IND", newSeg, msg.getStringField("GOVT_AGENCY_FILING_IND", segId));
						msg.addField("INST_LEGAL_FORM_TYP", newSeg, msg.getStringField("INST_LEGAL_FORM_TYP", segId));
						msg.addField("INST_LEGAL_NME", newSeg, msg.getStringField("INST_LEGAL_NME", segId));
						msg.addField("ISSR_STAT_TYP", newSeg, msg.getStringField("INST_STAT_TYP", segId));
					}
					else if ("FinancialInstitutionIdentifier".equals(segType))
					{
						SegmentId newSeg = msg.addSegment(XMLMessage.A_INSERT, "IssuerIdentifier");
						msg.addField("DATA_SRC_ID", newSeg, msg.getStringField("DATA_SRC_ID", segId));
						msg.addField("DATA_STAT_TYP", newSeg, msg.getStringField("DATA_STAT_TYP", segId));
						msg.addField("GU_CNT", newSeg, msg.getStringField("GU_CNT", segId));
						msg.addField("GU_ID", newSeg, msg.getStringField("GU_ID", segId));
						msg.addField("GU_TYP", newSeg, msg.getStringField("GU_TYP", segId));
						msg.addField("ISSR_ID", newSeg, msg.getStringField("FINS_ID", segId));
						msg.addField("ISSR_ID_CTXT_TYP", newSeg, msg.getStringField("FINS_ID_CTXT_TYP", segId));
						msg.addField("ISSR_USAGE_TYP", newSeg, msg.getStringField("INST_USAGE_TYP", segId));
						msg.addField("START_TMS", newSeg, msg.getDateTimeField("START_TMS", segId));
					}
					else if ("FinancialInstitutionDescription".equals(segType))
					{
						SegmentId newSeg = msg.addSegment(XMLMessage.A_INSERT, "ISSRIssuerDescription");
						msg.addField("DATA_SRC_ID", newSeg, msg.getStringField("DATA_SRC_ID", segId));
						msg.addField("DATA_STAT_TYP", newSeg, msg.getStringField("DATA_STAT_TYP", segId));
						msg.addField("DESC_USAGE_TYP", newSeg, msg.getStringField("DESC_USAGE_TYP", segId));
						msg.addField("ISSR_DESC", newSeg, msg.getStringField("INST_DESC", segId));
						msg.addField("ISSR_NME", newSeg, msg.getStringField("INST_NME", segId));
						msg.addField("NLS_CDE", newSeg, msg.getStringField("NLS_CDE", segId));
						msg.addField("START_TMS", newSeg, msg.getDateTimeField("START_TMS", segId));
					}

				}
				SegmentId newSeg = msg.addSegment(XMLMessage.A_INSERT, "ISSRIssuerGroupParticipant");
				msg.addField("PRT_PURP_TYP", newSeg, "INTEREST");
				msg.addField("PRNT_ISSR_GRP_OID", newSeg, "IRGR000006");

				SegmentId issueSegmentId = msg.addSegment(XMLMessage.A_REFERENCE,"FinancialInstitution");
				msg.addField("INST_MNEM", issueSegmentId, instMnem);
				
				
				 if(logger.isDebugEnabled())
                 logger.debug("xml: " + msg.getXMLString());

			} else
				logger.info("Not an insert. Exiting");

			return true;
		}
		logger.info("Not a UI message. Hence Exiting");
		return true;
	}

}
