import java.util.Calendar;
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

public class CJavaBasel3AttrDeriveCntrlGovt implements JavaRule {
    private final static Logger logger = Logger.getLogger("CJavaBasel3AttrDeriveCntrlGovt");
    String fetchCntrlGovtInstMnem = " SELECT GUID.GU_ID, GUID.GEO_UNIT_ID," +
    		" (SELECT INSTR_ISSR_ID FROM FT_T_IRID IRID WHERE IRID.ISSR_ID = GUID.GEO_UNIT_ID AND IRID.END_TMS IS NULL LIMIT 1 )," +
    		" (SELECT FINS.INST_MNEM FROM FT_T_IRID IRID, FT_T_ISSR ISSR, FT_T_FINS FINS WHERE IRID.ISSR_ID = GUID.GEO_UNIT_ID AND IRID.END_TMS IS NULL " +
    		" AND IRID.INSTR_ISSR_ID = ISSR.INSTR_ISSR_ID AND ISSR.FINS_INST_MNEM = FINS.INST_MNEM LIMIT 1 ), " +
    		" (SELECT PRNT_INST_MNEM FROM FT_T_FFRL FFRL WHERE FFRL.INST_MNEM = FIGU.INST_MNEM AND FFRL.REL_TYP = 'CENTRALGOVTINST' AND FFRL.END_TMS IS NULL) EXTPRNTINSTMNEM " +
    		" FROM FT_T_FIGU FIGU "+
    		" left join (select * from FT_T_GUID GUI where GUI.GU_TYP='COUNTRY' AND GUI.GU_ID_CTXT_TYP = 'CLIENTREF'  AND GUI.END_TMS IS NULL) GUID on GUID.GU_ID = FIGU.GU_ID" +
    		" WHERE FINS_GU_PURP_TYP='INCRPRTE' AND FIGU.GU_TYP='COUNTRY' AND INST_MNEM = :INSTMNEM<char[11]> AND FIGU.END_TMS IS NULL  ";

    public boolean initialize(String[] params) {
        logger.info("Initializing CJavaBasel3AttrDeriveCntrlGovt Rule");
        return true;
    }

    public boolean process(XMLMessage xmlMsg, DatabaseObjectContainer dbObj, ProcessorContext pCon, DatabaseAccess dbConn, NotificationCreator notfcn) throws GSException {

        String instMnem = null;
        String currSegmentName = null;
        String guId = null, geoUnitId= null, cntrlGovIssrId=null, cntrlGovInstMnem = null, extPrntInstMnem=null;
        
        try {
        	logger.info(":::::::::CJavaBasel3AttrDeriveCntrlGovt Processing Starts:::::::::");
            // Fetch InstMnem and Indus Cl Set id needed for processing and condition checking starts 
            SegmentId currSegId = pCon.getCurrentSegmentId();
            instMnem = xmlMsg.getStringField("INST_MNEM", currSegId);
            logger.info("instMnem = " + instMnem);

            // Exit if INST_MNEM is not available
            if (instMnem == null || instMnem.equals("")) {
                SegmentId finsSeg = Common.getSegmentId("FinancialInstitution", xmlMsg);
                instMnem = xmlMsg.getStringField("INST_MNEM", finsSeg);
                if (instMnem == null || instMnem.equals("")) {
                    logger.info("Unable to Fetch InstMnem, Hence Existing");
                    return true;
                }
            }

            currSegmentName = pCon.getCurrentSegmentType();
            logger.info("currSegmentName: " + currSegmentName);

            if ("FinancialInstitutionGeoUnitPrt".equalsIgnoreCase(currSegmentName)) {
                logger.info("FinancialInstitutionGeoUnitPrt. Check finsGuPurpType and guTyp");

                String finsGuPurpType = xmlMsg.getStringField("FINS_GU_PURP_TYP", currSegId);
                String guTyp = xmlMsg.getStringField("GU_TYP", currSegId);
                String figuOid = xmlMsg.getStringField("FIGU_OID", currSegId);

                logger.info("finsGuPurpType = " + finsGuPurpType + ", guTyp = " + guTyp + " and figuOid = " + figuOid);

                if (("".equals(finsGuPurpType) || finsGuPurpType == null) && (figuOid != null && !"".equals(figuOid))) {
                    String sql = "SELECT COUNT(1) FROM ft_t_figu WHERE fins_gu_purp_typ = 'INCRPRTE' AND gu_typ='COUNTRY' AND figu_oid = :FIGUOID<char[11]> ";
                    dbConn.setSQL(sql);
                    dbConn.addParameter(figuOid);
                    dbConn.execute();
                    if (!dbConn.isEndOfStream()) {
                        int cnt = dbConn.getNextInt();
                        if (cnt != 0) {
                            finsGuPurpType = "INCRPRTE";
                            guTyp = "COUNTRY";
                        }
                    }
                }

                if (finsGuPurpType == null || !finsGuPurpType.equalsIgnoreCase("INCRPRTE") || guTyp == null || !guTyp.equalsIgnoreCase("COUNTRY")) {
                    logger.info("Not INCRPRTE or Not COUNTRY. Exit");
                    return true;
                }
            } else {
                logger.info("Not FinancialInstitutionGeoUnitPrt segment, Hence Exit");
                return true;
            }

            // Get active value of GU_ID, GEO_UNIT_ID and inst_mnem of Central Govt.  
            dbConn.setSQL(fetchCntrlGovtInstMnem);
            dbConn.addParameter(instMnem);
            dbConn.execute();

            if (!dbConn.isEndOfStream()) {
                guId = dbConn.getNextString();
            }
            if (!dbConn.isEndOfStream()) {
                geoUnitId = dbConn.getNextString();
            }
            if (!dbConn.isEndOfStream()) {
                cntrlGovIssrId = dbConn.getNextString();
            }
            if (!dbConn.isEndOfStream()) {
                cntrlGovInstMnem = dbConn.getNextString();
            }
            if (!dbConn.isEndOfStream()) {
            	extPrntInstMnem = dbConn.getNextString();
            }
            
            logger.info(" Fetched Values are as follow: guId =" + guId + ", geoUnitId =" + geoUnitId + ", cntrlGovIssrId="+cntrlGovIssrId+", cntrlGovInstMnem =" + cntrlGovInstMnem+ ", extPrntInstMnem:"+extPrntInstMnem );
            
            if ((cntrlGovInstMnem==null || "".equals(cntrlGovInstMnem))) {
            	logger.error("Unable to fetch Central Government for guId:" + guId + " with geoUnitId =" + geoUnitId );
            	if (extPrntInstMnem!=null && !"".equals(extPrntInstMnem) ) {
            		createFFRLDelSegment(xmlMsg, instMnem);
            	}
            	
            	if(logger.isDebugEnabled()) {
    				logger.debug("xml: " + xmlMsg.getXMLString()); }
            	
                return true;	
            }
            
            
            
            if (!cntrlGovInstMnem.equals(extPrntInstMnem)) {
            	createFFRLSegment(xmlMsg, instMnem, cntrlGovInstMnem );
            }
            
			if(logger.isDebugEnabled())
				logger.debug("xml: " + xmlMsg.getXMLString());
           
		   
        } catch (Exception e) {
            throw new GSException(e.getMessage());
        } finally {
            dbConn.close();
        }
        return true;
    }

    private void createFFRLSegment(XMLMessage xmlMsg, String instMnem, String cntrlGovInstMnem ) {
    	// Set A_UNKNOWN as action type so that the rules will be applied to this segment 
		SegmentId newSeg = xmlMsg.addSegment( XMLMessage.A_UNKNOWN,"FinsFinsRole");
		
		xmlMsg.setSegmentAttribute(newSeg, "MATCH", "FFRL_MATCH_1");
		
		xmlMsg.addField("REL_TYP", newSeg, "CENTRALGOVTINST");
		xmlMsg.addField("INST_MNEM", newSeg, instMnem);
		xmlMsg.addField("PRNT_INST_MNEM", newSeg, cntrlGovInstMnem);
		xmlMsg.addField("DATA_STAT_TYP", newSeg, "ACTIVE");
		xmlMsg.addField("DATA_SRC_ID", newSeg, "MHI");		
		
		// START_TMS is required by GS engine. Setting StartTms as the first second of the day
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.HOUR_OF_DAY, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);
		cal.set(Calendar.MILLISECOND, 0);
		Date today = cal.getTime();				
		xmlMsg.addField("START_TMS", newSeg, today);
		xmlMsg.setFieldAttribute("START_TMS", newSeg, "INSERT_ONLY", "Y");

		logger.info("FinsFinsRole Segment added");
    }

    private void createFFRLDelSegment(XMLMessage xmlMsg, String instMnem) {
        // Set A_D_DELETE as action type so that this segment will not trigger other rules 
        SegmentId newSeg = xmlMsg.addSegment(XMLMessage.A_D_DELETE, "FinsFinsRole");
        xmlMsg.setSegmentAttribute(newSeg, "MATCH", "FFRL_MATCH_1");
        xmlMsg.setSegmentAttribute(newSeg, "ERROR", "N");
        xmlMsg.addField("REL_TYP", newSeg, "CENTRALGOVTINST");
		xmlMsg.addField("INST_MNEM", newSeg, instMnem);

        if (logger.isInfoEnabled())
            logger.info(" Delete Segment added");
    }

}