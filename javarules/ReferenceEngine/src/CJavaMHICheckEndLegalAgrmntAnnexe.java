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


public class CJavaMHICheckEndLegalAgrmntAnnexe implements JavaRule {

    private static Logger logger = Logger.getLogger("CJavaMHICheckEndLegalAgrmntAnnexe");
    private static int count= 0;

    public boolean initialize(String[] params) {

        logger.info("Initializing CJavaMHICheckEndLegalAgrmntAnnexe Rule");
        return true;
    }

    public boolean process(XMLMessage msg, DatabaseObjectContainer dboc,
            ProcessorContext pContext, DatabaseAccess dbConn, NotificationCreator notfcn)
        throws GSException {

       if(logger.isDebugEnabled())
       logger.debug("xml: " + msg.getXMLString());

        String mainEntityTblTyp = msg.getStringField("MAIN_ENTITY_TBL_TYP", new SegmentId(0));
        if (null == mainEntityTblTyp || !"LAGR".equalsIgnoreCase(mainEntityTblTyp)) {
            logger.debug("Message is not for Legal Agreement. Hence Exiting");

           if(logger.isDebugEnabled())
                  logger.debug("xml: " + msg.getXMLString());
            return true;
        }

        List<SegmentId> segmentIDLAAN = new ArrayList<SegmentId>();
        segmentIDLAAN = getSegmentIds("LAGRLegalAgreementAnnexure", msg); //LegalAgreementAnnexure
        for (SegmentId segID : segmentIDLAAN)
        {
            

           String laanoidCheck = msg.getStringField("LAAN_OID", segID);

             logger.info("Before fetching laanoid from db---");
				
				String laanOID = getFirstValDB("select laan_oid from ft_T_laan where LAAN_OID ='"+laanoidCheck+"' and end_tms is null",dbConn, logger);

             logger.info("After fetching laanoid from db---");

           String actionLAAN;
		   
		    if(laanOID == null)
					actionLAAN="UPDATE";
				else
					actionLAAN = "INSERT";
				

           logger.info("Segment Action --"+actionLAAN);


            if ("UPDATE".equals(actionLAAN))
            {
            	logger.info("EG-4887 - LAAN has been updated, so check if it has been end-dated");
                Date laanEndTms = msg.getDateTimeField("END_TMS", segID);
                logger.info("EG-4887 - END_TMS is " + laanEndTms);

                if (laanEndTms != null) {
                	logger.info("EG-4887 - LAAN has been end-dated, so end-date connected LAAPs");
                	String LAANOID = msg.getStringField("LAAN_OID", segID);
                    logger.info("EG-4887 - LAAN_OID is " + LAANOID);
                    
                	String lastChgUser = msg.getStringField("LAST_CHG_USR_ID", segID);
                	logger.info("EG-4887 - LAST_CHG_USR_ID is " + lastChgUser);
                	
	                String endLaapSQL = "update FT_T_LAAP set END_TMS = SYSDATE(), LAST_CHG_TMS = SYSDATE(), LAST_CHG_USR_ID = '" + lastChgUser + "' " +
	                        "where LAAN_OID = '" + LAANOID + "'";
	                logger.info("EG-4887 - end LAAP SQL is: " + endLaapSQL);
	                dbConn.setSQL(endLaapSQL);
	                dbConn.execute();
                }
                else
                {
                	logger.info("EG-4887 - LAAN has not been end-dated so take no action");
                }


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


}


