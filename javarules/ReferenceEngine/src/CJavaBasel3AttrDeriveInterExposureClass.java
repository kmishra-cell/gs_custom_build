import java.util.Calendar;
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

public class CJavaBasel3AttrDeriveInterExposureClass implements JavaRule {
    private final static Logger logger = Logger.getLogger("CJavaBasel3AttrDeriveInterExposureClass");
    String fetchInExpCZ3CEQry = " SELECT " +
        /*Initial Exp Class*/
        " (SELECT MAX(CL_VALUE) FROM FT_T_FICL FICL WHERE INDUS_CL_SET_ID='B3INIEXPCL' AND FICL.INST_MNEM=FINS.INST_MNEM AND END_TMS IS NULL), " +
        /*Country Zone*/
        " (SELECT MAX(COALESCE( (SELECT 'EEA' FROM FT_T_GUGR GUGR, FT_T_GUGP GUGP WHERE GUGR.GRP_NME = 'EEA' AND GUGR.GU_GRP_OID = GUGP.PRNT_GU_GRP_OID AND GUGP.END_TMS IS NULL AND GUGP.GU_ID = FIGU.GU_ID), FIGU.GU_ID)) FROM FT_T_FIGU FIGU WHERE FINS_GU_PURP_TYP='INCRPRTE' AND FIGU.GU_TYP='COUNTRY' AND FIGU.INST_MNEM = FINS.INST_MNEM AND FIGU.END_TMS IS NULL), " +
        /*PRA 3rd Cty Eq*/
        " (SELECT MAX(CL_VALUE) FROM FT_T_FICL FICL WHERE INDUS_CL_SET_ID='B3PRTRCTEQ' AND FICL.INST_MNEM=FINS.INST_MNEM AND END_TMS IS NULL), " +
        /*EBA 3rd Cty Eq*/
        " (SELECT MAX(CL_VALUE) FROM FT_T_FICL FICL WHERE INDUS_CL_SET_ID='B3EBTRCTEQ' AND FICL.INST_MNEM=FINS.INST_MNEM AND END_TMS IS NULL), " +
        /*Curr InterExp Cl PRA*/
        " (SELECT MAX(FINS_CLSF_OID) FROM FT_T_FICL FICL WHERE INDUS_CL_SET_ID='B3PRINEXCL' AND FICL.INST_MNEM=FINS.INST_MNEM AND END_TMS IS NULL), " +
        /*Curr InterExp Cl EBA*/
        " (SELECT MAX(FINS_CLSF_OID) FROM FT_T_FICL FICL WHERE INDUS_CL_SET_ID='B3EBINEXCL' AND FICL.INST_MNEM=FINS.INST_MNEM AND END_TMS IS NULL) " +
        " FROM FT_T_FINS FINS WHERE INST_MNEM = :INSTMNEM<char[11]> ";

    String fetchInterExpFromBIX1 = "SELECT PRA_INTER_EXPR_CLS, EBA_INTER_EXPR_CLS FROM FT_T_BIX1 " +    
        "  WHERE INIT_EXP_CLS_CDE= :INITEXPCLSCDE<char[41]> " +
        "  AND (CNTRY_GU_ID= :CNTRYGUID<char[9]> OR CNTRY_GU_ID IS NULL )" +
        "  AND (PRA_TRDCNTRY_EQ_VAL= :PRATRDCNTRYEQVAL<char[41]> OR PRA_TRDCNTRY_EQ_VAL IS NULL  ) " +
        "  AND (EBA_TRDCNTRY_EQ_VAL= :EBATRDCNTRYEQVAL<char[41]>  OR EBA_TRDCNTRY_EQ_VAL IS NULL ) " +
        "  ORDER BY  (CASE WHEN (CNTRY_GU_ID IS NOT NULL) THEN 5 ELSE 0 END ) " +
        "+ ( CASE WHEN (PRA_TRDCNTRY_EQ_VAL IS NOT NULL) THEN 2 ELSE 0 END) " +
        "+ ( CASE WHEN (EBA_TRDCNTRY_EQ_VAL IS NOT NULL) THEN 1 ELSE 0 END) DESC ";

    public boolean initialize(String[] params) {
        logger.info("Initializing CJavaBasel3AttrDeriveInterExposureClass Rule");
        return true;
    }

    public boolean process(XMLMessage xmlMsg, DatabaseObjectContainer dbObj, ProcessorContext pCon, DatabaseAccess dbConn, NotificationCreator notfcn) throws GSException {

        String instMnem = null;
        String msgClassification = null;
        String currSegmentName = null;
        String activeInterEFiclOidPRA = null, activeInterEFiclOidEBA = null;
        String initialExpClass = null, countryZone = null, thrdCtyEqPRA = null, thrdCtyEqEBA = null;
        String interExpClassPRA = null, interExpClassEBA = null;
        String interExpClIndusSetIdPRA = "B3PRINEXCL", interExpClIndusSetIdEBA = "B3EBINEXCL";

        try {
        	logger.info(":::::::::CJavaBasel3AttrDeriveInterExposureClass Processing Starts:::::::::");
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

            if ("FinancialInstitutionClassification".equalsIgnoreCase(currSegmentName)) {
                logger.info("FinancialInstitutionClassification fetch indus_cl_set_id");
                String msgIndusClSetId = xmlMsg.getStringField("INDUS_CL_SET_ID", currSegId);
                logger.info("msgIndusClSetId = " + msgIndusClSetId);

                if (msgIndusClSetId == null || "".equals(msgIndusClSetId)) {
                    logger.info("FinancialInstitutionClassification. Query table with finsClsfOid");
                    String finsClsfOid = xmlMsg.getStringField("FINS_CLSF_OID", currSegId);
                    logger.info("finsClsfOid = " + finsClsfOid);
                    if (finsClsfOid == null || finsClsfOid.equals("")) {
                        logger.info("finsClsfOid or msgIndusClSetId is not set. Exit");
                        return true;
                    }

                    String sql = "SELECT indus_cl_set_id FROM ft_t_ficl  WHERE fins_clsf_oid = :FINSOID<char[11]> ";
                    dbConn.setSQL(sql);
                    dbConn.addParameter(finsClsfOid);
                    dbConn.execute();
                    if (!dbConn.isEndOfStream()) {
                        msgIndusClSetId = dbConn.getNextString();
                    }
                }

                if (msgIndusClSetId == null || "".equals(msgIndusClSetId)) {
                    logger.info("Unable to fetch IndusClSetId hence exit");
                    return true;
                }

                if (!"B3INIEXPCL".equals(msgIndusClSetId) && !"B3PRTRCTEQ".equals(msgIndusClSetId) && !"B3EBTRCTEQ".equals(msgIndusClSetId)) {
                    logger.info("Available indus Cl set id :" + msgIndusClSetId + " does not qualify for further processing hence existing.");
                    return true;
                }
            } else if ("FinancialInstitutionGeoUnitPrt".equalsIgnoreCase(currSegmentName)) {
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
                logger.info("Not FinancialInstitutionClassification or FinancialInstitutionGeoUnitPrt segment, Hence Exit");
                return true;
            }

            // Get active value of PRA_IntermediateExposureClass, EBA_IntermediateExposureClass, PRA_DesignatedCpty, EBA_DesignatedCpty and Active FICL OIDs for both Final exp Class.  
            dbConn.setSQL(fetchInExpCZ3CEQry);
            dbConn.addParameter(instMnem);
            dbConn.execute();

            if (!dbConn.isEndOfStream()) {
                initialExpClass = dbConn.getNextString();
            }
            if (!dbConn.isEndOfStream()) {
                countryZone = dbConn.getNextString();
            }
            if (!dbConn.isEndOfStream()) {
                thrdCtyEqPRA = dbConn.getNextString();
            }
            if (!dbConn.isEndOfStream()) {
                thrdCtyEqEBA = dbConn.getNextString();
            }
            if (!dbConn.isEndOfStream()) {
                activeInterEFiclOidPRA = dbConn.getNextString();
            }
            if (!dbConn.isEndOfStream()) {
                activeInterEFiclOidEBA = dbConn.getNextString();
            }

            logger.info(" Fetched Values are as follow: InitialExposureClass =" + initialExpClass + ", CountryZone =" + countryZone + ", PRA_ThirdCtyEquiv =" + thrdCtyEqPRA + ", EBA_ThirdCtyEquiv =" + thrdCtyEqEBA + ", PRA_IntermediateExposureClassOid =" + activeInterEFiclOidPRA + " and EBA_IntermediateExposureClassOID =" + activeInterEFiclOidEBA);

            dbConn.setSQL(fetchInterExpFromBIX1);
            dbConn.addParameter(initialExpClass);
            dbConn.addParameter(countryZone);
            dbConn.addParameter(thrdCtyEqPRA);
            dbConn.addParameter(thrdCtyEqEBA);
            dbConn.execute();

            if (!dbConn.isEndOfStream())
                interExpClassPRA = dbConn.getNextString();
            if (!dbConn.isEndOfStream())
                interExpClassEBA = dbConn.getNextString();

            logger.info("Fetched interExpClassPRA=" + interExpClassPRA + " and interExpClassEBA=" + interExpClassEBA);

            if (interExpClassPRA != null && !"".equals(interExpClassPRA)) {
                logger.info("Create FICL segment for interExpClIndusSetIdPRA: " + interExpClIndusSetIdPRA + " and interExpClassPRA: " + interExpClassPRA);
                createFiclSegment(xmlMsg, interExpClassPRA, interExpClIndusSetIdPRA, instMnem);
            } else if (activeInterEFiclOidPRA != null && !"".equals(activeInterEFiclOidPRA)) {
                logger.info("interExpClassPRA is not found but activeInterEFiclOidPRA exists, hence creating delete record.");
                createFiclDelSegment(xmlMsg, activeInterEFiclOidPRA);
            }

            if (interExpClassEBA != null && !"".equals(interExpClassEBA)) {
                logger.info("Create FICL segment for interExpClIndusSetIdEBA: " + interExpClIndusSetIdEBA + " and interExpClassEBA: " + interExpClassEBA);
                createFiclSegment(xmlMsg, interExpClassEBA, interExpClIndusSetIdEBA, instMnem);
            } else if (activeInterEFiclOidEBA != null && !"".equals(activeInterEFiclOidEBA)) {
                logger.info("interExpClassEBA is not found but activeInterEFiclOidEBA exists, hence creating delete record.");
                createFiclDelSegment(xmlMsg, activeInterEFiclOidEBA);
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

    private void createFiclSegment(XMLMessage xmlMsg, String clValue, String indusClSetId, String instMnem) {
        Calendar cal = Calendar.getInstance();
        cal.set(Calendar.HOUR_OF_DAY, 0);
        cal.set(Calendar.MINUTE, 0);
        cal.set(Calendar.SECOND, 0);
        cal.set(Calendar.MILLISECOND, 0);
        Date today = cal.getTime();

        SegmentId newFICLSeg = new SegmentId();
        boolean segPreExists = false;

        List < SegmentId > ficlSegList = Common.getSegmentIds("FinancialInstitutionClassification", xmlMsg);
        if (ficlSegList != null && !ficlSegList.isEmpty()) {
            for (SegmentId ficlSeg: ficlSegList) {
                String preExistIndusClSetId = xmlMsg.getStringField("INDUS_CL_SET_ID", ficlSeg);
                String segProcessInd = xmlMsg.getSegmentAttribute(ficlSeg, "SEGPROCESSEDIND");
                if (indusClSetId.equals(preExistIndusClSetId) && segProcessInd != null && !"".equals(segProcessInd)) {
                    newFICLSeg = ficlSeg;
                    segPreExists = true;
                    String preExistClValue = xmlMsg.getStringField("CL_VALUE", ficlSeg);
                    if (clValue.equals(preExistClValue)) {
                        logger.debug("Already Segment Exists for same IndusClSetId and ClValue, hence not recreating");
                        return;
                    }
                    break;

                }
            }
        }

        
        if (!segPreExists) {
        	newFICLSeg = xmlMsg.addSegment(XMLMessage.A_UNKNOWN, "FinancialInstitutionClassification");

            SegmentId newSubRefSeg = xmlMsg.addSegment(XMLMessage.A_REFERENCE, "IndustryClassification", newFICLSeg);
            xmlMsg.setSegmentAttribute(newSubRefSeg, "COPY_FROM", "CLSF_OID");
            xmlMsg.setSegmentAttribute(newSubRefSeg, "COPY_TO", "CLSF_OID");
            xmlMsg.setSegmentAttribute(newSubRefSeg, "MATCH", "INCL_VALUE");
            xmlMsg.setSegmentAttribute(newSubRefSeg, "NESTED_ERR_LVL", "ERROR");
            xmlMsg.addField("CL_VALUE", newSubRefSeg, clValue);
            xmlMsg.addField("INDUS_CL_SET_ID", newSubRefSeg, indusClSetId);
            xmlMsg.addField("LEVEL_NUM", newSubRefSeg, "1");

            xmlMsg.setSegmentAttribute(newFICLSeg, "MATCH", "FICL_MATCH_SET");
            xmlMsg.setSegmentAttribute(newFICLSeg, "TSATTRIBUTE", "CLSF_OID");
            xmlMsg.setSegmentAttribute(newFICLSeg, "TSOPTION", "Y");
            xmlMsg.addField("CL_VALUE", newFICLSeg, clValue);
            xmlMsg.addField("INDUS_CL_SET_ID", newFICLSeg, indusClSetId);
            xmlMsg.addField("INST_MNEM", newFICLSeg, instMnem);
            xmlMsg.addField("CLSF_PURP_TYP", newFICLSeg, "INDCLASS");
            xmlMsg.addField("START_TMS", newFICLSeg, today);
            xmlMsg.setFieldAttribute("START_TMS", newFICLSeg, "INSERT_ONLY", "Y");
            logger.info(indusClSetId + " FICL Segment added");
        } else {
            int childCnt = xmlMsg.countSegmentChildren(newFICLSeg);
            if (childCnt != 0) {
                newFICLSeg.add(0);
                String childSegType = xmlMsg.getSegmentType(newFICLSeg);
                if ("IndustryClassification".equals(childSegType)) {
                    xmlMsg.setFieldValue("CL_VALUE", newFICLSeg, clValue);
                }
                newFICLSeg.removeLast();

            }
            xmlMsg.setFieldValue("CL_VALUE", newFICLSeg, clValue);
            logger.info(indusClSetId + " FICL Segment Modified");
        }
    }

    private void createFiclDelSegment(XMLMessage xmlMsg, String finsClsfOid) {
        // Set A_D_DELETE as action type so that this segment will not trigger other rules 
        SegmentId newSeg = xmlMsg.addSegment(XMLMessage.A_D_DELETE, "FinancialInstitutionClassification");
        xmlMsg.addField("FINS_CLSF_OID", newSeg, finsClsfOid);

        if (logger.isInfoEnabled())
            logger.info(finsClsfOid + " Delete Segment added");
    }

}