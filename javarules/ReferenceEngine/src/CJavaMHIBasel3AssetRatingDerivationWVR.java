import com.thegoldensource.jbre.*;

import org.apache.log4j.Logger;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class CJavaMHIBasel3AssetRatingDerivationWVR implements JavaRule {
    private final static Logger logger = Logger.getLogger("CJavaMHIBasel3AssetRatingDerivationWVR");
    private static List < String > Juristictions = new ArrayList < String > ();

    //Query to return the number of ratings that are eligible for the derivation query
    private String deriveRatingQuery = "SELECT BRTVL.RTNG_CDE, VRTNG.DATA_SRC_ID, BRM1.BRM1_OID, BRTVL.RTNG_VALUE_OID,VRTNG.RTNG_CQS_NUM " +
    	"FROM FT_T_ISRT ISRT, (SELECT * FROM FT_T_BRM1 BRM1 " +
    	" WHERE RTNG_SET_TBL_TYP IN ('ISSU','FIIS','ALL') AND (BRM1.END_TMS IS NULL OR BRM1.END_TMS > SYSDATE()) AND " +
    	" EXISTS (SELECT 1 FROM FT_T_RTNG  RTNG WHERE RTNG.RTNG_SET_OID = BRM1.VND_RTNG_SET_OID " + 
    	" AND (case when RTNG_SET_MNEM='126' then 'LOCAL' when RTNG_SET_MNEM='130' then 'FOREIGN' else 'BOTH' end ) != :RTNG_CURR_TYP<char[20]>" + 
		")) BRM1, " +
        " (SELECT RTG.RTNG_SET_OID, RTG.DATA_SRC_ID, RTV.RTNG_VALUE_OID, BC.RTNG_CDE, BC.RTNG_RANK_NUM, BC.RTNG_CQS_NUM, BC.RTNG_JURIS_NME FROM FT_T_RTNG RTG, FT_T_RTVL RTV, FT_T_BCQ1 BC  " +
        " WHERE RTG.RTNG_SET_OID = RTV.RTNG_SET_OID AND RTG.DATA_SRC_ID = BC.DATA_SRC_ID AND BC.RTNG_CDE = RTV.RTNG_CDE " +
        " AND RTG.END_TMS IS NULL AND RTV.END_TMS IS NULL AND BC.END_TMS IS NULL) VRTNG, FT_T_RTVL BRTVL WHERE ISRT.RTNG_SET_OID = BRM1.VND_RTNG_SET_OID " +
        " AND (ISRT.RTNG_CURR_TYP = BRM1.VND_RTNG_CURR_TYP OR (ISRT.RTNG_CURR_TYP IS NULL AND BRM1.VND_RTNG_CURR_TYP IS NULL) ) " +
        " AND (ISRT.RTNG_DEBT_CL_TYP = BRM1.MDY_RTNG_DEBT_CL_TYP OR BRM1.MDY_RTNG_DEBT_CL_TYP IS NULL) AND ISRT.RTNG_SET_OID = VRTNG.RTNG_SET_OID AND VRTNG.RTNG_CDE = ISRT.RTNG_CDE " +
        " AND ( VRTNG.RTNG_JURIS_NME = BRM1.RTNG_JURIS_NME OR (VRTNG.RTNG_JURIS_NME IS NULL AND BRM1.RTNG_JURIS_NME IS NULL) ) " +
        " AND BRTVL.RTNG_SET_OID = BRM1.B3_RTNG_SET_OID AND BRTVL.RANK_NUM = VRTNG.RTNG_RANK_NUM " +
        " and (ISRT.END_TMS IS NULL OR ISRT.END_TMS > SYSDATE()) " +
        " AND (ISRT.SYS_EFF_END_TMS IS NULL OR ISRT.SYS_EFF_END_TMS > SYSDATE()) AND ISRT.START_TMS < SYSDATE() " +
        " AND ISRT.DATA_SRC_ID NOT IN ('MHI') AND ISRT.RTNG_CDE NOT IN ('WR','NR','WD','SD') " +
        " AND EXISTS (SELECT 1 FROM FT_T_RTQL RTQL WHERE RTQL.ISS_RTNG_OID = ISRT.ISS_RTNG_OID AND RTQL.END_TMS IS NULL AND RTQL.RTNG_QUAL_TYP = 'SOLICITATION STATUS' and RTQL.RTNG_QUAL_TXT = 'Solicited' ) " +
        " AND ISRT.INSTR_ID = :INSTR_ID<char[11]> AND BRM1.B3_RTNG_SET_OID = :B3_RTNG_SET_OID<char[11]> " +
        " AND (BRM1.RTNG_JURIS_NME = :RTNG_JURIS_NME<char[9]> OR (BRM1.RTNG_JURIS_NME IS NULL) ) " +
        " ORDER BY VRTNG.RTNG_RANK_NUM, " +
        " (CASE WHEN ISRT.DATA_SRC_ID IN ('MOODYS_RDS','MOODYS RDS', 'MOODY') THEN 1  WHEN ISRT.DATA_SRC_ID IN ('SNPXF_RT','SAP') THEN 2  WHEN ISRT.DATA_SRC_ID IN ('FITCH') THEN 3 WHEN ISRT.DATA_SRC_ID IN ('BB', 'JCR') THEN 4  ELSE 5 END) ";

    private String blg1Query = "INSERT INTO FT_T_BLG1 " +
        "	(BLG1_OID, B3_RTNG_SET_OID, INSTR_ID, STATUS_TYP, ADDL_INFO_TXT, TRACE_PATH, TRN_ID, CREATED_TMS,LAST_CHG_TMS,LAST_CHG_USR_ID) " +
        "	VALUES (NEW_OID(), :B3_RTNG_SET_OID<char[11]> , :INSTR_ID<char[11]>, :STATUS_TYP<char[40]>, :ADDL_INFO_TXT<char[1000]>, :TRACE_PATH<char[4000]>, :TRN_ID<char[17]>, SYSDATE(), SYSDATE(), 'AssetRtngDerWithVR')";

    private String existingDeriveRatingQuery = "SELECT ISRT.RTNG_CDE, ISRT.DATA_SRC_ID, ISRT.ISS_RTNG_OID, ISRT.RTNG_VALUE_OID, ISRT.RTNG_CLASS_TXT  " +
        " FROM FT_T_ISRT ISRT WHERE ISRT.END_TMS IS NULL AND ISRT.SYS_EFF_END_TMS IS NULL AND ISRT.START_TMS < SYSDATE() " +
        " AND ISRT.INSTR_ID = :INSTR_ID<char[11]> " +
        " AND ISRT.RTNG_SET_OID = :RTNG_SET_OID<char[11]> " +
        " AND COALESCE(ISRT.RTNG_CURR_TYP ,'NULL') = :RTNG_CURR_TYP_3<char[20]> " +
        " AND ISRT.RTNG_PURP_TYP = :RTNG_PURP_TYP<char[9]> ";

    private String ratingSetsQuery = "SELECT DISTINCT B3_RTNG_SET_OID||'<DELM>'||COALESCE(B3_RTNG_CURR_TYP,'') FROM FT_T_BRM1 WHERE (RTNG_SET_TBL_TYP IS NULL OR RTNG_SET_TBL_TYP IN ('ISSU','FIIS','ALL') ) AND END_TMS IS NULL " +
        " AND (RTNG_JURIS_NME IS NULL OR RTNG_JURIS_NME =:RTNG_JURIS_NME_1<char[8]>)";

    private String fetchCntrlGovCQSQry = "WITH QRY AS ( " +
    " SELECT ISSR.FINS_INST_MNEM INST_MNEM, FFRL.PRNT_INST_MNEM, (SELECT RTNG_SET_OID FROM FT_T_RTNG WHERE RTNG_SET_MNEM = 'B3ISRDRT' AND END_TMS IS NULL) B3ISSRDR  " +
    " FROM FT_T_ISSU issu, FT_t_ISSR ISSR" + 
    " LEFT JOIN (SELECT * FROM FT_T_FFRL WHERE END_TMS IS NULL AND REL_TYP='CENTRALGOVTINST'  ) FFRL ON FFRL.INST_MNEM = ISSR.FINS_INST_MNEM " +
    " WHERE  ISSU.INSTR_ID = :INSTR_ID<char[11]> AND ISSU.INSTR_ISSR_ID=ISSR.INSTR_ISSR_ID ) " +
    " SELECT " +
    " (SELECT MIN(BCQ1.RTNG_CQS_NUM) FROM FT_T_FIRT FIRT, FT_T_RTNG RTNG, FT_T_BCQ1 BCQ1 WHERE FIRT.RTNG_PURP_TYP= :JURISD1<char[11]> AND RTNG.RTNG_SET_MNEM ='B3ISRDRT' AND RTNG_CURR_TYP IS NULL AND RTNG.RTNG_SET_OID = FIRT.RTNG_SET_OID AND  FIRT.INST_MNEM = QRY.PRNT_INST_MNEM   AND RTNG.END_TMS IS NULL AND FIRT.END_TMS IS NULL AND FIRT.SYS_EFF_END_TMS IS NULL AND BCQ1.END_TMS IS NULL AND BCQ1.DATA_SRC_ID = 'BASEL3' AND BCQ1.RTNG_CDE = FIRT.RTNG_CDE )," +
    " (SELECT MIN(BCQ1.RTNG_CQS_NUM) FROM FT_T_FIRT FIRT, FT_T_RTNG RTNG, FT_T_BCQ1 BCQ1 WHERE FIRT.RTNG_PURP_TYP= :JURISD2<char[11]> AND RTNG.RTNG_SET_MNEM ='B3ISRDRT' AND RTNG_CURR_TYP ='LOCAL CURRENCY' AND RTNG.RTNG_SET_OID = FIRT.RTNG_SET_OID AND  FIRT.INST_MNEM = QRY.PRNT_INST_MNEM   AND RTNG.END_TMS IS NULL AND FIRT.END_TMS IS NULL AND FIRT.SYS_EFF_END_TMS IS NULL  AND BCQ1.END_TMS IS NULL AND BCQ1.DATA_SRC_ID = 'BASEL3' AND BCQ1.RTNG_CDE = FIRT.RTNG_CDE), " +
    " (SELECT MIN(BCQ1.RTNG_CQS_NUM) FROM FT_T_FIRT FIRT, FT_T_RTNG RTNG, FT_T_BCQ1 BCQ1 WHERE FIRT.RTNG_PURP_TYP= :JURISD3<char[11]> AND RTNG.RTNG_SET_MNEM ='B3ISRDRT' AND RTNG_CURR_TYP = 'FOREIGN CURRENCY' AND RTNG.RTNG_SET_OID = FIRT.RTNG_SET_OID AND  FIRT.INST_MNEM = QRY.PRNT_INST_MNEM   AND RTNG.END_TMS IS NULL AND FIRT.END_TMS IS NULL AND FIRT.SYS_EFF_END_TMS IS NULL  AND BCQ1.END_TMS IS NULL AND BCQ1.DATA_SRC_ID = 'BASEL3' AND BCQ1.RTNG_CDE = FIRT.RTNG_CDE), " +
    " (SELECT MIN(CL_VALUE) FROM FT_T_FICL FICL WHERE INDUS_CL_SET_ID= :JURISDPRECLID<char[21]> AND FICL.INST_MNEM = QRY.INST_MNEM AND END_TMS IS NULL ), " +
    "  ( CASE WHEN QRY.INST_MNEM = QRY.PRNT_INST_MNEM THEN 'Y' ELSE 'N' END ) " +
    " FROM  QRY ";
    
    private String fetchRtngQualityFlgQry = "SELECT QLTY_CDE FROM FT_T_BRQ1 WHERE EXP_CLS_NME = :EXPCLS<char[41]> AND (CGOV_CQS= :CGOVCQS<char[4]> OR CGOV_CQS IS NULL ) AND RTNG_CQS_NUM= :RTNGCQS<char[4]> AND END_TMS IS NULL ORDER BY CGOV_CQS";


    public CJavaMHIBasel3AssetRatingDerivationWVR() {}

    // Function to indicate initialisation of the Issuer Rating Derived Rule along with any variables.
    public boolean initialize(String[] parameters) {
        logger.info("Initializing CJavaMHIBasel3AssetRatingDerivationWVR Rule");

        for (String s: parameters[0].split(",")) {
            Juristictions.add(s);
        }
        logger.info("Juristictions: " + Juristictions);
        logger.info("Initialized CJavaMHIBasel3AssetRatingDerivationWVR Rule");
        return true;
    }

    public boolean process(XMLMessage msg, DatabaseObjectContainer dboc, ProcessorContext pContext, DatabaseAccess dbConnection, NotificationCreator notificationCreator) throws GSException {
        try {

            logger.info("Processing Starts of CJavaMHIBasel3AssetRatingDerivationWVR Rule");
            SegmentId firstSeg = new SegmentId(0);
            String msgClassification = msg.getStringField("MSG_CLASSIFICATION", firstSeg );
            
            if (!"B3ISSURTNGCALBTCHWVR".equalsIgnoreCase(msgClassification)) {
                logger.info("Message not for asset Rating with Vendor rating, hence exiting");
                return true;
            }
            
            
            String issuCurrTyp = msg.getStringField("ISS_RATE_TXT", firstSeg );
            if (issuCurrTyp == null) {
            	issuCurrTyp="";
            }
            // Get Instrument Id from Msg
            String instrId = msg.getStringField("INSTR_ID", firstSeg);
            String transactionID = pContext.getScopedTransaction().getTransactionID();
            logger.info("Processing Rule for InstrumentId:" + instrId + ", CurrTyp="+issuCurrTyp+" and TrnId:" + transactionID);

            if (instrId == null || instrId.equals("")) {
                logger.info("No instrId found. Exiting");
                return true;
            }
            // B3 - loop over each Rating Currency Type (Local, foreign, blank)

            // Get list of rating types 
            List < String > B3RatingSetsCurr = new ArrayList < String > ();
            logger.info("Juristictions for loop");

            for (String thisJuristiction: Juristictions) {
                B3RatingSetsCurr = getRatingSetsForJurisdiction(thisJuristiction, dbConnection);
                logger.info("B3RatingSets for loop");

                for (String thisB3RatingSetCurr: B3RatingSetsCurr) {
                    // get a new oid for logging in FT_T_BLG1
                    logger.info("Starting process of FOR loop for B3RatingSetsCurr:" + thisB3RatingSetCurr);
                    String[] thisB3RtngCurrSplt = thisB3RatingSetCurr.split("<DELM>");
                    String thisB3RtngSetOid = thisB3RtngCurrSplt[0];
                    String thisB3RtngCurr = "";
                    if (thisB3RtngCurrSplt.length > 1) {
                        thisB3RtngCurr = thisB3RtngCurrSplt[1];
                    }

                    StringBuilder addlInfoSB = new StringBuilder("Searching for->" + thisB3RtngCurr + "->" + thisJuristiction);
                    StringBuilder tracePathSB = new StringBuilder("Calculating");
                    String statusTyp = "PENDING";
                    // Get attributes for existing Rating
                    CJavaMHIBasel3RatingAttributes thisExistingDerivedRating = getExistingB3IssuRating(instrId, thisB3RtngSetOid, thisB3RtngCurr, thisJuristiction, dbConnection);

                    // Get attributes for new Rating 
                    CJavaMHIBasel3RatingAttributes newDerivedRating = getDerivedRatingAttributes(instrId, thisB3RtngSetOid, issuCurrTyp, dbConnection, thisJuristiction);

                    if (!newDerivedRating.isEmpty()) {
                        logger.info("*** Add or amend the rating ***");
                        
                        if (!thisExistingDerivedRating.isEmpty() && !"Art139_A".equals(thisExistingDerivedRating.rtngDerivationPath)) {
                        	endDateExistingDerivedRating(dbConnection, msg, instrId, thisExistingDerivedRating.ratingOid);
                            tracePathSB.append("->Existing rating Not of Art139_A found, Hence removing and adding New Rating");
                            addlInfoSB.append("->Removing{" + thisB3RtngSetOid + "}");
                            statusTyp = "RE-ADDING";
                        }                       
                        
                        
                        if (!thisExistingDerivedRating.ratingCode.equals(newDerivedRating.ratingCode) || "RE-ADDING".equals(statusTyp)) {
                            tracePathSB.append("->Matching VendorRating Found");
                            addlInfoSB.append("->Direct Rating{" + newDerivedRating.ratingCode + "} Found from {" + newDerivedRating.vendor + "}");
                            
                            if (!"RE-ADDING".equals(statusTyp)) {
                               if (thisExistingDerivedRating.isEmpty()) {
	                                statusTyp = "ADDING";
	                            } else {
	                                statusTyp = "UPDATING";
	                            }
                            }
                            String hqLqFlag = fetchRtngQltyByCntrlGovtCQSNum(instrId, newDerivedRating.ratingCqsNum, thisB3RtngCurr, thisJuristiction, dbConnection, tracePathSB, addlInfoSB);

                            addAmendIssuRating(dbConnection, msg, instrId, thisB3RtngSetOid, newDerivedRating, thisJuristiction, thisExistingDerivedRating, thisB3RtngCurr, hqLqFlag);
                            tracePathSB.append("->Storing in DB");
                            addUpdateBlg1Log(thisB3RtngSetOid, instrId, statusTyp, tracePathSB.toString(), addlInfoSB.toString(), transactionID, dbConnection);
                        } else {
                            tracePathSB.append("->VendorRating matches with Existing Basel Rating. Nothing to Update");
                            addlInfoSB.append("->Direct Rating{" + newDerivedRating.ratingCode + "} Found from {" + newDerivedRating.vendor + "} matches with Basel Rating{" + thisExistingDerivedRating.ratingCode + "}");
                            statusTyp = "NOCHANGE";
                            addUpdateBlg1Log(thisB3RtngSetOid, instrId, statusTyp, tracePathSB.toString(), addlInfoSB.toString(), transactionID, dbConnection);
                        }
                    } else {
                        if (!thisExistingDerivedRating.isEmpty() && "Art139_A".equals(thisExistingDerivedRating.rtngDerivationPath)) {
                            // remove existing rating
                            logger.info("*** Remove old rating ***");
                            endDateExistingDerivedRating(dbConnection, msg, instrId, thisExistingDerivedRating.ratingOid);
                            tracePathSB.append("->Matching Vendor Rating Not Found, removing Existing");
                            addlInfoSB.append("->Removing{" + thisB3RtngSetOid + "}");
                            statusTyp = "REMOVING";
                            addUpdateBlg1Log(thisB3RtngSetOid, instrId, statusTyp, tracePathSB.toString(), addlInfoSB.toString(), transactionID, dbConnection);
                        } else if (newDerivedRating.isEmpty()) {
                            tracePathSB.append("->Matching Vendor Rating Not Found Nor Basel Rating exists.");
                            addlInfoSB.append("->No Match found");
                            statusTyp = "SKIPPED";
                            addUpdateBlg1Log(thisB3RtngSetOid, instrId, statusTyp, tracePathSB.toString(), addlInfoSB.toString(), transactionID, dbConnection);
                            logger.debug("*** No data exists for given Basel3 Rating Set, Skipping to Next record ***");
                        }

                    }
                } //for loop B3RatingSets
            } // for loop Jurisdictions
            if (logger.isDebugEnabled())
                logger.debug("xml: " + msg.getXMLString());

        } catch (Exception e) {
            logger.error(e.getMessage());
            throw new GSException(e.getMessage());
        } finally {
            dbConnection.close();
        }
        return true;
    }

    List < String > getRatingSetsForJurisdiction(String thisJuristiction, DatabaseAccess dbConnection) throws Exception {
        List < String > RatingSets = new ArrayList < String > ();
        logger.info("Within method getRatingSetsForJurisdiction Juristiction = " + thisJuristiction);
        dbConnection.setSQL(ratingSetsQuery);
        dbConnection.addParameter(thisJuristiction);

        dbConnection.execute();
        while (!dbConnection.isEndOfStream()) {
            String brm1RatingSet = dbConnection.getNextString();
            RatingSets.add(brm1RatingSet);
        }
        return RatingSets;
    }

    CJavaMHIBasel3RatingAttributes getExistingB3IssuRating(String instrId, String b3RtngSetOid, String b3RatingSetCurrTyp, String juristiction, DatabaseAccess dbConnection) throws Exception {
        logger.info("Within method getExistingB3IssuRating ");

        String ratingCode = "";
        String ratingVendor = "";
        String ratingOid = "";
        String ratingValueOid = "";
        String ratingDerivationPath = "";

        dbConnection.setSQL(existingDeriveRatingQuery);
        dbConnection.addParameter(instrId);
        dbConnection.addParameter(b3RtngSetOid);
        dbConnection.addParameter( ( (b3RatingSetCurrTyp==null || "".equals(b3RatingSetCurrTyp) )? "NULL" : b3RatingSetCurrTyp ));
        dbConnection.addParameter(juristiction);
        dbConnection.execute();

        if (!dbConnection.isEndOfStream()) {
            ratingCode = dbConnection.getNextString();
        }
        if (!dbConnection.isEndOfStream()) {
            ratingVendor = dbConnection.getNextString();
        }
        if (!dbConnection.isEndOfStream()) {
            ratingOid = dbConnection.getNextString();
        }
        if (!dbConnection.isEndOfStream()) {
            ratingValueOid = dbConnection.getNextString();
        }
        if (!dbConnection.isEndOfStream()) {
        	ratingDerivationPath = dbConnection.getNextString();
        }

        CJavaMHIBasel3RatingAttributes existingRating = new CJavaMHIBasel3RatingAttributes(ratingCode, ratingVendor, ratingOid, ratingValueOid, "",ratingDerivationPath);
        logger.debug("getExistingFinsRating -> " + existingRating.getAttributesString());
        return existingRating;
    }


    CJavaMHIBasel3RatingAttributes getDerivedRatingAttributes(String instrId, String rtngB3SetOid, String b3RtngCurrType, DatabaseAccess dbConnection, String juristiction) throws Exception {
        logger.info("Within method getDerivedRatingAttributes()");
        String ratingCode = "";
        String ratingVendor = "";
        String ratingOid = "";
        String ratingValueOid = "";
        String ratingCqsNum = "";

        dbConnection.setSQL(deriveRatingQuery);
        dbConnection.addParameter( ( (b3RtngCurrType==null || "".equals(b3RtngCurrType) )? "NULL" : b3RtngCurrType ));
        dbConnection.addParameter(instrId);
        dbConnection.addParameter(rtngB3SetOid);
        dbConnection.addParameter(juristiction);
        dbConnection.execute();

        // this loop will return the second set of rating attributes if >1 or the first if only one.
        // if none are returned, the calling method has logic to handle this too
        int count = 0;

        while (!dbConnection.isEndOfStream()) {

            count++;

            ratingCode = dbConnection.getNextString();

            if (!dbConnection.isEndOfStream()) {
                ratingVendor = dbConnection.getNextString();
            }
            if (!dbConnection.isEndOfStream()) {
                ratingOid = dbConnection.getNextString();
            }
            if (!dbConnection.isEndOfStream()) {
                ratingValueOid = dbConnection.getNextString();
            }
            if (!dbConnection.isEndOfStream()) {
                ratingCqsNum = dbConnection.getNextString();
            }

            if (count == 2)
                break;
        }

        /*		} catch (Exception e) {
        			logger.error("SQL query failed to get results = '" + e.getMessage() + "'");
        			logger.info(e);
        		}
        */

        CJavaMHIBasel3RatingAttributes derivedRating = new CJavaMHIBasel3RatingAttributes(ratingCode, ratingVendor, ratingOid, ratingValueOid, ratingCqsNum);

        if (derivedRating.isEmpty()) {
            logger.info("Return the following atributes: No data found. Returning Empty object of derivedRating");
        } else {
            logger.info("Return the following atributes:" + derivedRating.getAttributesString());
        }
        return derivedRating;


    }
    void endDateExistingDerivedRating(DatabaseAccess dbConnection, XMLMessage msg, String insrtId, String ratingOid) {
        logger.info("Within EndDateExistingDerivedRating : end-date rating with ISS_RTNG_OID = '" + ratingOid + "'");

        Calendar cal = Calendar.getInstance();
        cal.set(Calendar.HOUR_OF_DAY, 0);
        cal.set(Calendar.MINUTE, 0);
        cal.set(Calendar.SECOND, 0);
        cal.set(Calendar.MILLISECOND, 0);
        Date today = cal.getTime();

        SegmentId newSegmentId = msg.addSegment(XMLMessage.A_D_UPDATE, "IssueRating");
        msg.addField("INSRT_ID", newSegmentId, insrtId);
        msg.addField("DATA_SRC_ID", newSegmentId, "MHI");
        msg.addField("ISS_RTNG_OID", newSegmentId, ratingOid);
        msg.addField("SYS_EFF_END_TMS", newSegmentId, today);
        msg.addField("END_TMS", newSegmentId, today);
    }
    void addAmendIssuRating(DatabaseAccess dbConnection, XMLMessage msg, String insrtId, String b3RtngSetOid, CJavaMHIBasel3RatingAttributes newDerivedRating, String rtngJuristiction,
        CJavaMHIBasel3RatingAttributes thisExistingDerivedRating, String b3RtngCurrTyp, String hqLqFlag) {
        logger.info("in method addAmendIssuRating()");
        logger.info("Add rating " + newDerivedRating.ratingCode + " with RTNG_SET_OID = '" + b3RtngSetOid + "'");

        Calendar cal = Calendar.getInstance();
        cal.set(Calendar.HOUR_OF_DAY, 0);
        cal.set(Calendar.MINUTE, 0);
        cal.set(Calendar.SECOND, 0);
        cal.set(Calendar.MILLISECOND, 0);
        Date today = cal.getTime();

        SegmentId newSegmentId = msg.addSegment(XMLMessage.A_D_UNKNOWN, "IssueRating");

        msg.setSegmentAttribute(newSegmentId, "TSATTRIBUTE", "RTNG_CDE:RTNG_VALUE_OID");
        msg.setSegmentAttribute(newSegmentId, "TSOPTION", "Y");
        msg.setSegmentAttribute(newSegmentId, "MATCH", "ISRT_MATCH_MHIB3");

        msg.addField("INSTR_ID", newSegmentId, insrtId);
        msg.addField("RTNG_CDE", newSegmentId, newDerivedRating.ratingCode);
        msg.addField("RTNG_SYMBOL_TXT", newSegmentId, newDerivedRating.ratingCode);
        msg.addField("RTNG_SET_OID", newSegmentId, b3RtngSetOid);
        msg.addField("RTNG_VALUE_OID", newSegmentId, newDerivedRating.ratingValueOid);
        msg.addField("RTNG_PURP_TYP", newSegmentId, rtngJuristiction);
        msg.addField("DATA_STAT_TYP", newSegmentId, "ACTIVE");
        msg.addField("DATA_SRC_ID", newSegmentId, "MHI");
        msg.addField("RTNG_OUTLOOK_TYP", newSegmentId, hqLqFlag);
        msg.addField("RTNG_CLASS_TXT", newSegmentId, "Art139_A");
        if (b3RtngCurrTyp != null && !"".equals(b3RtngCurrTyp)) {
            msg.addField("RTNG_CURR_TYP", newSegmentId, b3RtngCurrTyp);
        }
        msg.addField("START_TMS", newSegmentId, today);
        msg.setFieldAttribute("START_TMS", newSegmentId, "INSERT_ONLY", "Y");
        msg.addField("RTNG_EFF_TMS", newSegmentId, today);
        msg.setFieldAttribute("RTNG_EFF_TMS", newSegmentId, "INSERT_ONLY", "Y");

        if (!"".equals(newDerivedRating.vendor)) {
            msg.addField("ORIG_DATA_PROV_ID", newSegmentId, newDerivedRating.vendor);
        }

        logger.info("exiting method addAmendIssuRating");
    }
    
    private String fetchRtngQltyByCntrlGovtCQSNum(String instrId, String ratingCqsNum, String b3RtngCurrTyp, String rtngJuristiction, DatabaseAccess dbConnection, StringBuilder tracePathSB, StringBuilder addlInfoSB) throws Exception {
        String hqLqFlag = "";
        String issrDflt = "", issrDfltLcl = "", issrDfltFgn = "", fnlExpCls = "", selfPrntFlg = "";
        String fnlGovtCQS = "";
        String fnlExlPerJuris = "";
        if ("PRA".equals(rtngJuristiction)) {
        	fnlExlPerJuris = "B3PRFNEXCL";
    	}else {
        	fnlExlPerJuris = "B3EBFNEXCL";
        }

        dbConnection.setSQL(fetchCntrlGovCQSQry);
        dbConnection.addParameter(instrId);
        dbConnection.addParameter(rtngJuristiction);
        dbConnection.addParameter(rtngJuristiction);
        dbConnection.addParameter(rtngJuristiction);
        dbConnection.addParameter(fnlExlPerJuris);
        
        dbConnection.execute();

        if (!dbConnection.isEndOfStream()) {
            issrDflt = dbConnection.getNextString();
        }
        if (!dbConnection.isEndOfStream()) {
            issrDfltLcl = dbConnection.getNextString();
        }
        if (!dbConnection.isEndOfStream()) {
            issrDfltFgn = dbConnection.getNextString();
        }
        if (!dbConnection.isEndOfStream()) {
            fnlExpCls = dbConnection.getNextString();
        }
        if (!dbConnection.isEndOfStream()) {
            selfPrntFlg = dbConnection.getNextString();
        }

        if ("Y".equals(selfPrntFlg)) {
            fnlGovtCQS = ratingCqsNum;
        } else {
            if ("LOCAL CURRENCY".equals(b3RtngCurrTyp)) {
                fnlGovtCQS = issrDfltLcl;
            } else if ("FOREIGN CURRENCY".equals(b3RtngCurrTyp)) {
                fnlGovtCQS = issrDfltFgn;
            }
            if (fnlGovtCQS == null || "".equals(fnlGovtCQS)) {
                fnlGovtCQS = issrDflt;
            }
        }
        tracePathSB.append("->Fetching GovtCQS->Derive HQ/LQ");
        addlInfoSB.append("CntrlGovTCQS=" + fnlGovtCQS);
        addlInfoSB.append("->FinalExpClass=" + fnlExpCls + "->");
        logger.debug("Fetched values for instrId=" + instrId + " and rtngJuristiction=" + rtngJuristiction + " : issrDflt=" + issrDflt + ", issrDfltLcl=" + issrDfltLcl + ", issrDfltFgn=" + issrDfltFgn + " and fnlExpCls=" + fnlExpCls + " Hence derived Value is fnlGovtCQS=" + fnlGovtCQS);

        dbConnection.setSQL(fetchRtngQualityFlgQry);
        dbConnection.addParameter(fnlExpCls);
        dbConnection.addParameter(fnlGovtCQS);
        dbConnection.addParameter(ratingCqsNum);
        dbConnection.execute();

        if (!dbConnection.isEndOfStream()) {
            hqLqFlag = dbConnection.getNextString();
        }

        if (hqLqFlag == null || "".equals(hqLqFlag)) {
            hqLqFlag = "LQ";
        }

        addlInfoSB.append("HQ/LQ Flag=" + hqLqFlag + "->");
        return hqLqFlag;
    }

    void addUpdateBlg1Log(String b3RtngSetOid, String instMnem, String statusTyp, String tracePath, String addlInfoTxt, String transactionID, DatabaseAccess dbConnection) throws Exception {
        logger.info("Within method addUpdateBlg1Log");
        dbConnection.setSQL(blg1Query);
        dbConnection.addParameter(b3RtngSetOid);
        dbConnection.addParameter(instMnem);
        dbConnection.addParameter(statusTyp);
        dbConnection.addParameter(addlInfoTxt);
        dbConnection.addParameter(tracePath);
        dbConnection.addParameter(transactionID);
        dbConnection.execute();
    }
}