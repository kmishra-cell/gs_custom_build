import org.apache.log4j.Logger;

import com.thegoldensource.jbre.DatabaseAccess;
import com.thegoldensource.jbre.DatabaseObjectContainer;
import com.thegoldensource.jbre.GSException;
import com.thegoldensource.jbre.JavaRule;
import com.thegoldensource.jbre.NotificationCreator;
import com.thegoldensource.jbre.ProcessorContext;
import com.thegoldensource.jbre.SegmentId;
import com.thegoldensource.jbre.XMLMessage;


public class CJavaMHIAddMhiGeoUnitID implements JavaRule {

	private static Logger logger = Logger.getLogger("CJavaMHIAddMhiGeoUnitID");

	public boolean initialize(String[] params) {

		logger.info("Initializing CJavaMHIAddMhiGeoUnitID Rule");
        return true;
	}

	public boolean process(XMLMessage msg, DatabaseObjectContainer dboc,
			ProcessorContext pContext, DatabaseAccess dbConn, NotificationCreator notfcn)
			throws GSException {
			
			if(logger.isDebugEnabled())
                logger.debug("xml: " + msg.getXMLString());
	

		String mainEntityTblTyp  = msg.getStringField("MAIN_ENTITY_TBL_TYP", new SegmentId(0));
		
		if ("GUNT".equalsIgnoreCase(mainEntityTblTyp)) {
			logger.info("MAIN_ENTITY_TBL_TYP = " + mainEntityTblTyp);
			String msgClassification = msg.getStringField("MSG_CLASSIFICATION", new SegmentId(0));
			if("WEBMSG".equalsIgnoreCase(msgClassification)){

				logger.info("MSG_CLASSIFICATION = " + msgClassification);

				//if (action.equals(XMLMessage.A_INSERT))
				//{

				for(int i=0; i < msg.getSegmentCount(); i++)
				{
					SegmentId segId = new SegmentId(i);
					String segType = msg.getSegmentType(segId);
					logger.info("segType: " + segType);
					String action = msg.getAction(segId);
					logger.info("action: " + action);

					if ("GeographicUnit".equals(segType) && "INSERT".equals(action))
					{
						logger.info("Insert GeographicUnit, so add new MHIGEOID Id");
						String PrntGuTyp = msg.getStringField( "PRNT_GU_TYP", segId);
						String PrntGuId = msg.getStringField("PRNT_GU_ID", segId);
						logger.info("PrntGuTyp = " + PrntGuTyp);
						logger.info("PrntGuId = " + PrntGuId);
						String PrntGuTypFilter;
						String InitialPrntGuIdMinusOne;
						Integer mhiGeoUnitId = 0;
						Integer lastAllocatedMhGeoId = 0;
						if ("COUNTRY".equals(PrntGuTyp)) {
							PrntGuTypFilter = "GU_TYP in ('COUNTRY')";
							InitialPrntGuIdMinusOne = "999";
						}
						else if ("CITY".equals(PrntGuTyp)) {
							PrntGuTypFilter = "GU_TYP in ('CITY')";
							InitialPrntGuIdMinusOne = "9999";
						}
						else {
							// not a city or country so it is some kind of region/province
							PrntGuTypFilter = "GU_TYP not in ('CITY','COUNTRY')";
							InitialPrntGuIdMinusOne = "1999";
						}
						// get highest MHIGEOID that has already been added, then add 1 to it.
						// if none allocated, this returns (lowest id - 1) so adding 1 results in
						// correct value in all cases
						try {

							String sql_MhiGeoId = "select coalesce(max(GEO_UNIT_ID),'" + InitialPrntGuIdMinusOne + "') from ft_t_guid "
								+ "where CASE WHEN GEO_UNIT_ID ~ '^[0-9]+$' THEN 'NUMBER' ELSE 'NOT_NUMBER' END = 'NUMBER' "
								+ "and GU_ID_CTXT_TYP = 'MHIGEOID' and " + PrntGuTypFilter;

							logger.info("sql_MhiGeoId: " + sql_MhiGeoId);

							dbConn.setSQL(sql_MhiGeoId);
							dbConn.execute();

							if (!dbConn.isEndOfStream()) {
								lastAllocatedMhGeoId = dbConn.getNextInt();
								logger.info("d/b - lastAllocatedMhGeoId value check : " + lastAllocatedMhGeoId);
							}
							mhiGeoUnitId = lastAllocatedMhGeoId + 1;
							logger.info("New GeoUnit is assigned MHIGEOID = " + mhiGeoUnitId);
						} catch (Exception e) {
							e.printStackTrace();
						}
						int guCntValue = 1;
						SegmentId mhiGeoUnitIdSeg = msg.addSegment(XMLMessage.A_INSERT,"GeographicUnitIdentifier");
						msg.addField("GU_ID", mhiGeoUnitIdSeg, PrntGuId);
						msg.addField("GU_TYP", mhiGeoUnitIdSeg, PrntGuTyp);
						msg.addField("GU_CNT", mhiGeoUnitIdSeg, msg.getStringField("GU_CNT", segId));
						msg.addField("GEO_UNIT_ID", mhiGeoUnitIdSeg, mhiGeoUnitId.toString());
						msg.addField("GU_ID_CTXT_TYP", mhiGeoUnitIdSeg, "MHIGEOID");

					if(logger.isDebugEnabled())
                logger.debug("xml: " + msg.getXMLString());
					
						logger.info("mhiGeoUnitIdSeg created. exiting");
						return true;

					}
				}
				//} else
				//	logger.info("Not an GeographicUnit insert.");

				return true;
			}
			logger.info("Not a GeographicUnit UI message. Hence Exiting");
			return true;
		}
		logger.info("Not a GUNT , exiting");
		return true;
	}

}
