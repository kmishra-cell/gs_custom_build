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

public class CJavaBasel3AttrDeriveFinalExposureClass implements JavaRule {
    private final static Logger logger = Logger.getLogger("CJavaBasel3AttrDeriveFinalExposureClass");
    String fetchInitExpDesgCptyQry = "SELECT " +
        /*PRA Intermediate Exposure Class*/
        " (SELECT MAX(CL_VALUE) FROM FT_T_FICL FICL WHERE INDUS_CL_SET_ID='B3PRINEXCL' AND FICL.INST_MNEM=FINS.INST_MNEM AND END_TMS IS NULL), " +
        /*EBA Intermediate Exposure Class*/
        " (SELECT MAX(CL_VALUE) FROM FT_T_FICL FICL WHERE INDUS_CL_SET_ID='B3EBINEXCL' AND FICL.INST_MNEM=FINS.INST_MNEM AND END_TMS IS NULL), " +
        /*PRA Designated Counterparty */
        " (SELECT MAX(CL_VALUE) FROM FT_T_FICL FICL WHERE INDUS_CL_SET_ID='B3PRDSGCTP' AND FICL.INST_MNEM=FINS.INST_MNEM AND END_TMS IS NULL), " +
        /*EBA Designated Counterparty */
        " (SELECT MAX(CL_VALUE) FROM FT_T_FICL FICL WHERE INDUS_CL_SET_ID='B3EBDSGCTP' AND FICL.INST_MNEM=FINS.INST_MNEM AND END_TMS IS NULL)," +
        /*PRA Final Exposure Class Active OID*/
        " (SELECT MAX(FINS_CLSF_OID) FROM FT_T_FICL FICL WHERE INDUS_CL_SET_ID='B3PRFNEXCL' AND FICL.INST_MNEM=FINS.INST_MNEM AND END_TMS IS NULL)," +
        /*EBA Final Exposure Class Active OID*/
        " (SELECT MAX(FINS_CLSF_OID) FROM FT_T_FICL FICL WHERE INDUS_CL_SET_ID='B3EBFNEXCL' AND FICL.INST_MNEM=FINS.INST_MNEM AND END_TMS IS NULL) " +
        " FROM FT_T_FINS FINS WHERE INST_MNEM = :INSTMNEM<char[11]> ";


    public boolean initialize(String[] params) {
        logger.info("Initializing CJavaBasel3AttrDeriveFinalExposureClass Rule");
        return true;
    }

    /* 
     * Inputs : 
     * PRA_IntermediateExposureClass -> Stored at FICL where INDUS_CL_SET_ID = 'B3PRINEXCL'
     * EBA_IntermediateExposureClass -> Stored at FICL where INDUS_CL_SET_ID = 'B3EBINEXCL'
     * PRA_DesignatedCpty -> Stored at FICL where INDUS_CL_SET_ID = 'B3PRDSGCTP'
     * EBA_DesignatedCpty -> Stored at FICL where INDUS_CL_SET_ID = 'B3EBDSGCTP'
     * 
     * Output :
     * PRA_FinalExposureClass -> Store at FICL where INDUS_CL_SET_ID = 'B3PRFNEXCL'
     * EBA_FinalExposureClass -> Store at FICL where INDUS_CL_SET_ID = 'B3EBFNEXCL'
     * 
     * Rule : If value is available for DesignatedCpty set it as FinalExposureClass if not use IntermediateExposureClass and set it as FinalExposureClass. 
     * If none of value is available then end-date existing and skip further processing for each Jurisdiction.  
     */

    public boolean process(XMLMessage xmlMsg, DatabaseObjectContainer dbObj, ProcessorContext pCon, DatabaseAccess dbConn, NotificationCreator notfcn) throws GSException {

        String instMnem = null;
        String currSegmentName = null;
        String activeFiclOidPRA = null, activeFiclOidEBA = null;
        String interExpClassPRA = null, interExpClassEBA = null, desigCptyPRA = null, desigCptyEBA = null;
        String finalExpClassPRA, finalExpClassEBA;
        String finalExpClIndusSetIdPRA = "B3PRFNEXCL", finalExpClIndusSetIdEBA = "B3EBFNEXCL";

        try {
            logger.info(":::::::::CJavaBasel3AttrDeriveFinalExposureClass Processing Starts:::::::::");
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

            String msgIndusClSetId = xmlMsg.getStringField("INDUS_CL_SET_ID", currSegId);
            logger.info("msgIndusClSetId = " + msgIndusClSetId);

            if (msgIndusClSetId == null || "".equals(msgIndusClSetId)) {
                String finsClsfOid = xmlMsg.getStringField("FINS_CLSF_OID", currSegId);
                logger.info("finsClsfOid = " + finsClsfOid);
                if (finsClsfOid == null || finsClsfOid.equals("")) {
                    logger.info("finsClsfOid or msgIndusClSetId is not set. Exit");
                    return true;
                }

                String sql = "SELECT INDUS_CL_SET_ID FROM FT_T_FICL  WHERE FINS_CLSF_OID = :FINSOID<char[11]> ";
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
            // Fetch InstMnem and Indus Cl Set id needed for processing and condition checking  Ends

            // Check current Segment Type : If its FinancialInstitutionClassification then check INDUS_CL_SET_ID = 'B3PRINEXCL',  'B3EBINEXCL' , 'B3PRDSGCTP' or  'B3EBDSGCTP' else exit from rule without error. 
            if (!"B3PRINEXCL".equals(msgIndusClSetId) && !"B3EBINEXCL".equals(msgIndusClSetId) && !"B3PRDSGCTP".equals(msgIndusClSetId) && !"B3EBDSGCTP".equals(msgIndusClSetId)) {
                logger.info("Available indus Cl set id :" + msgIndusClSetId + " does not qualify for further processing hence existing.");
                return true;
            }

            // Get active value of PRA_IntermediateExposureClass, EBA_IntermediateExposureClass, PRA_DesignatedCpty, EBA_DesignatedCpty and Active FICL OIDs for both Final exp Class.  
            dbConn.setSQL(fetchInitExpDesgCptyQry);
            dbConn.addParameter(instMnem);
            dbConn.execute();

            if (!dbConn.isEndOfStream()) {
                interExpClassPRA = dbConn.getNextString();
            }
            if (!dbConn.isEndOfStream()) {
                interExpClassEBA = dbConn.getNextString();
            }
            if (!dbConn.isEndOfStream()) {
                desigCptyPRA = dbConn.getNextString();
            }
            if (!dbConn.isEndOfStream()) {
                desigCptyEBA = dbConn.getNextString();
            }
            if (!dbConn.isEndOfStream()) {
                activeFiclOidPRA = dbConn.getNextString();
            }
            if (!dbConn.isEndOfStream()) {
                activeFiclOidEBA = dbConn.getNextString();
            }
            logger.info(" Fetched Values are as follow PRA_IntermediateExposureClass=" + interExpClassPRA + ", EBA_IntermediateExposureClass=" + interExpClassEBA + ", PRA_DesignatedCpty=" + desigCptyPRA + " and EBA_DesignatedCpty=" + desigCptyEBA);


            //If PRA_DesignatedCpty is not null set it as PRA_FinalExposureClass else if PRA_IntermediateExposureClass is not null then set it as PRA_FinalExposureClass else end-date existing record without error using delete segment. 
            if (!"".equals(desigCptyPRA) && desigCptyPRA != null) {
                finalExpClassPRA = desigCptyPRA;
            } else if (!"".equals(interExpClassPRA) && interExpClassPRA != null) {
                finalExpClassPRA = interExpClassPRA;
            } else {
                finalExpClassPRA = null;
            }
            if (finalExpClassPRA != null && !("").equals(finalExpClassPRA)) {
                logger.info("Create FICL segment for finalExpClassPRA: " + finalExpClassPRA);
                createFiclSegment(xmlMsg, finalExpClassPRA, finalExpClIndusSetIdPRA, instMnem);

            } else {
                logger.info("Final Exposure Class is not derived for PRA. Delete active record if present");

                if (activeFiclOidPRA != null && !"".equals(activeFiclOidPRA)) {
                    logger.info("Active record is found. Create DELETE segment");
                    createFiclDelSegment(xmlMsg, activeFiclOidPRA);
                }
            }

            //If EBA_DesignatedCpty is not null set it as EBA_FinalExposureClass else if EBA_IntermediateExposureClass is not null then set it as EBA_FinalExposureClass else end-date existing record without error using delete segment. 
            if (!"".equals(desigCptyEBA) && desigCptyEBA != null) {
                finalExpClassEBA = desigCptyEBA;
            } else if (!"".equals(interExpClassEBA) && interExpClassEBA != null) {
                finalExpClassEBA = interExpClassEBA;
            } else {
                finalExpClassEBA = null;
            }
            if (finalExpClassEBA != null && !("").equals(finalExpClassEBA)) {
                logger.info("Create FICL segment for finalExpClassEBA: " + finalExpClassEBA);
                createFiclSegment(xmlMsg, finalExpClassEBA, finalExpClIndusSetIdEBA, instMnem);

            } else {
                logger.info("Final Exposure Class is not derived for EBA. Delete active record if present");
                if (activeFiclOidEBA != null && !"".equals(activeFiclOidEBA)) {
                    logger.info("Active record is found. Create DELETE segment");
                    createFiclDelSegment(xmlMsg, activeFiclOidEBA);
                }
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