
import org.apache.log4j.Logger;
import com.thegoldensource.jbre.DatabaseAccess;
import com.thegoldensource.jbre.DatabaseObjectContainer;
import com.thegoldensource.jbre.GSException;
import com.thegoldensource.jbre.JavaRule;
import com.thegoldensource.jbre.NotificationCreator;
import com.thegoldensource.jbre.ProcessorContext;
import com.thegoldensource.jbre.SegmentId;
import com.thegoldensource.jbre.XMLMessage;


public class CJavaMHIAddMhiGeoUnitGrpID implements JavaRule {

    private static Logger logger = Logger.getLogger("CJavaMHIAddMhiGeoUnitGrpID");

    public boolean initialize(String[] params) {

        logger.info("Initializing CJavaMHIAddMhiGeoUnitGrpID Rule");
        return true;
    }

    public boolean process(XMLMessage msg, DatabaseObjectContainer dboc,
                           ProcessorContext pContext, DatabaseAccess dbConn, NotificationCreator notfcn)
            throws GSException {


          if(logger.isDebugEnabled())
            logger.debug("xml: " + msg.getXMLString());

        String mainEntityTblTyp  = msg.getStringField("MAIN_ENTITY_TBL_TYP", new SegmentId(0));

        if ("GUGR".equalsIgnoreCase(mainEntityTblTyp)) {

            String msgClassification = msg.getStringField("MSG_CLASSIFICATION", new SegmentId(0));
            if("WEBMSG".equalsIgnoreCase(msgClassification))
            {

                for(int i=0; i < msg.getSegmentCount(); i++)
                {
                    SegmentId segId = new SegmentId(i);
                    String segType = msg.getSegmentType(segId);
                    if ("GeographicUnitGroup".equals(segType)) {
                        String action = msg.getAction(segId);
                        logger.info("action: " + action);

                        if ("INSERT".equals(action)) {
                            logger.info("Insert GeographicUnitGroup, so add new MHIGEOID Id");
                            String PrntGuTyp = msg.getSegmentAttribute(segId, "PRNTGUTYP");
                            logger.info("PrntGuTyp = " + PrntGuTyp);
                            Integer mhiGeoUnitId = 0;
                            Integer lastAllocatedMhGeoId = 0;
                            // get highest MHIGEOID that has already been added, then add 1 to it.
                            // if none allocated, this returns (lowest id - 1) so adding 1 results in
                            // correct value in all cases
                            try {

                                //String sql_MhiGeoIdGroup = "select coalesce(max(grp_desc),'6999') from ft_t_gugr";
                                String sql_MhiGeoIdGroup = "select coalesce(max(grp_desc),'6999') from ft_t_gugr "+
                                        "where CASE "+
                                        	"WHEN grp_desc ~ '^[0-9]+$' THEN 'NUMBER' "+
                                        	"ELSE 'NOT_NUMBER'"+
                                        	"END = 'NUMBER'";
                                logger.info("sql_MhiGeoIdGroup: " + sql_MhiGeoIdGroup);

                                dbConn.setSQL(sql_MhiGeoIdGroup);
                                dbConn.execute();

                                if (!dbConn.isEndOfStream()) {
                                    lastAllocatedMhGeoId = dbConn.getNextInt();
                                    logger.info("d/b - lastAllocatedMhGeoId value check : " + lastAllocatedMhGeoId);
                                }
                                mhiGeoUnitId = lastAllocatedMhGeoId + 1;
                                logger.info("New group is assigned MHIGEOID = " + mhiGeoUnitId);

                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                            // For GeoUnit Groups, add GRP_DESC as field to existing segment in msg.
                            // First, remove grp_desc if present in message

                            Boolean ignoreResponse = msg.removeField("GRP_DESC", segId);
                            msg.addField("GRP_DESC", segId, mhiGeoUnitId.toString());
                          
                            logger.info("mhiGeoUnitIdSeg created. exiting");
                            return true;
                        }
                        else
                            logger.info("not an INSERT, skipping");
                    }
                    else
                        logger.info("Not a GeographicUnitGroup, skipping");
                }
                //} else
                return true;
            }
            logger.info("Not a GeographicUnit UI message. Hence Exiting");
            return true;
        }
        logger.info("Not a GUNT or GUGR message, exiting");
        return true;
    }

}
