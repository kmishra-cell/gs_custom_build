import org.apache.log4j.Logger;

import com.thegoldensource.jbre.DatabaseAccess;
import com.thegoldensource.jbre.DatabaseObjectContainer;
import com.thegoldensource.jbre.GSException;
import com.thegoldensource.jbre.JavaRule;
import com.thegoldensource.jbre.NotificationCreator;
import com.thegoldensource.jbre.ProcessorContext;
import com.thegoldensource.jbre.SegmentId;
import com.thegoldensource.jbre.XMLMessage;


public class CJavaMHICustCreateFins implements JavaRule {

	private static Logger logger = Logger.getLogger("CJavaMHICustCreateFins");
	String modelIds;

	public boolean initialize(String[] params) {

		logger.debug("Initializing CJavaMHICustCreateFinsIssr Rule");
		if(params.length > 0)
			modelIds = params[0];
		return true;
	}

	public boolean process(XMLMessage msg, DatabaseObjectContainer dboc,
			ProcessorContext pContext, DatabaseAccess dbConn, NotificationCreator notfcn)
			throws GSException {
		
		String action = msg.getAction(pContext.getCurrentSegmentId());
		logger.info("action: " + action);
		
		 if(logger.isDebugEnabled())
             logger.debug("xml: " + msg.getXMLString());

		if (action.equals(XMLMessage.A_INSERT))
		{
		
			if (modelIds == null || "".equals(modelIds))
			{
				logger.info("No model parameters set. Exiting");
				return true;
			}
			
			String modelId = msg.getStringField("MODL_ID", new SegmentId(0));
			
			if (modelId == null || "".equals(modelId))
			{
				logger.info("No model in the message. Exiting");
				return true;
			}
			
			logger.info("modelId: " + modelId);		
			
			String[] modelIdArray = modelIds.split(",");
			boolean modelProcess = false;
	
			for(int i=0; i < modelIdArray.length; i++)
			{
				modelProcess = modelId.equals(modelIdArray[i]);
				if (modelProcess == true)
					break;
			}
	
			if (modelProcess == false)
			{
				if(logger.isInfoEnabled())
					logger.info("Not in any of the groups. Exiting");
	
				return true;
			}
			
			String cstId = msg.getStringField("CST_ID",pContext.getCurrentSegmentId());
	
			String instMnem = msg.getStringField("INST_MNEM",pContext.getCurrentSegmentId());
	
			logger.info("cstId: " + cstId + ", instMnem: " + instMnem);
			
			if (instMnem == null || "".equals(instMnem))
			{
				instMnem = pContext.getOid();
				for(int i=0; i < msg.getSegmentCount(); i++)
				{
					SegmentId segId = new SegmentId(i);
					String segType = msg.getSegmentType(segId);
					if ("Customer".equals(segType))
					{
						logger.info("Create FinancialInstitution");
						String cstNme = msg.getStringField("CST_NME", segId);
						SegmentId newSeg = msg.addSegment(XMLMessage.A_INSERT, "FinancialInstitution");
						msg.addField("INST_MNEM", newSeg, instMnem);
						msg.addField("INST_NME", newSeg, cstNme);
						msg.addField("START_TMS", newSeg, msg.getDateTimeField("START_TMS", segId));
						msg.addField("PREF_FINS_ID", newSeg, msg.getStringField("PREF_CUSTOMER_ID", segId)+"G");
						msg.addField("PREF_ID_CTXT_TYP", newSeg, "SECOREFE");
						msg.addField("INST_DESC", newSeg, cstNme);
						msg.addField("INST_STAT_TYP", newSeg, msg.getStringField("CST_STAT_TYP", segId));
	
						logger.info("Create FinancialInstitutionDescription");
						SegmentId fideSeg = msg.addSegment(XMLMessage.A_INSERT, "FinancialInstitutionDescription");
						msg.addField("INST_NME", fideSeg, cstNme);
						msg.addField("INST_DESC", fideSeg, cstNme);
						msg.addField("START_TMS", fideSeg, msg.getDateTimeField("START_TMS", segId));
					}
					else if ("CustomerIdentifier".equals(segType))
					{
						if ("STRATREF".equals(msg.getStringField("CST_ID_CTXT_TYP", segId)))
						{
							logger.info("Create FinancialInstitutionIdentifier");
							SegmentId newSeg = msg.addSegment(XMLMessage.A_INSERT, "FinancialInstitutionIdentifier");
							msg.addField("FINS_ID", newSeg, msg.getStringField("CUSTOMER_ID", segId)+"G");
							msg.addField("FINS_ID_CTXT_TYP", newSeg, "SECOREFE");
							msg.addField("START_TMS", newSeg, msg.getDateTimeField("START_TMS", segId));
						}
					}
					else if ("CustomerGeographicUnit".equals(segType))
					{
						logger.info("Create FinancialInstitutionGeoUnitPrt");
						SegmentId newSeg = msg.addSegment(XMLMessage.A_INSERT, "FinancialInstitutionGeoUnitPrt");
						msg.addField("GU_CNT", newSeg, msg.getDecimalField("GU_CNT", segId));
						msg.addField("GU_ID", newSeg, msg.getStringField("GU_ID", segId));
						msg.addField("GU_TYP", newSeg, msg.getStringField("GU_TYP", segId));
						msg.addField("FINS_GU_PURP_TYP", newSeg, "INCRPRTE");
						msg.addField("START_TMS", newSeg, msg.getDateTimeField("START_TMS", segId));
					}
	
				}
				
				logger.info("Create Customer UPDATE INST_MNEM segment");
				SegmentId cstSegmentIdFINS = msg.addSegment(XMLMessage.A_UNKNOWN,"Customer");
				msg.addField("CST_ID", cstSegmentIdFINS, cstId);
				msg.addField("INST_MNEM", cstSegmentIdFINS, instMnem);
				
				logger.info("Create Customer Reference segment");
				SegmentId cstSegmentId = msg.addSegment(XMLMessage.A_REFERENCE,"Customer");
				msg.addField("CST_ID", cstSegmentId, cstId);
			
			
			 if(logger.isDebugEnabled())
                logger.debug("xml: " + msg.getXMLString());
	
			} else
				logger.info("Insitituion exists for customer. Exiting");
		} else
			logger.info("No an INSERT segment. Exiting");
		
		return true;

	}

}
