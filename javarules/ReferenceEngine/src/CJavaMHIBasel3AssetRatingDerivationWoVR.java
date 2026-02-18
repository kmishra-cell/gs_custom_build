import com.thegoldensource.jbre.*;

import org.apache.log4j.Logger;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class CJavaMHIBasel3AssetRatingDerivationWoVR implements JavaRule {
    private final static Logger logger = Logger.getLogger("CJavaMHIBasel3AssetRatingDerivationWoVR");
    private static List<String> Juristictions = new ArrayList<String> ();
    private String b3IssrDfltRtngSetOid = "B3ISRDRT";
    private String seniorityIdmvflgId = "00161384";
    private int SnrUnscrRankNum = 81;
    
    //Query to return the number of ratings that are eligible for the derivation query
    private String deriveRatingFromIssuerQuery = "SELECT ISSU.INSTR_ISSR_ID, IDMV.INTRNL_DMN_VAL_NME, IDMV.QUAL_VAL_TXT, " +
    		" ISSR.FINS_INST_MNEM,  ISSRTNG.RTNG_CDE, ISSRTNG.RTNG_OUTLOOK_TYP, BRTVL.RTNG_VALUE_OID, BRTVL.RTNG_CQS_NUM, " +
    		" (SELECT MIN(CL_VALUE) FROM FT_T_FICL FICL WHERE INDUS_CL_SET_ID= :JURISDPRECLID_1<char[21]> AND FICL.INST_MNEM = ISSR.FINS_INST_MNEM AND END_TMS IS NULL ) FINEXPCL " +
    		" FROM FT_T_ISSU ISSU, FT_T_ISSR ISSR" +
    		" LEFT JOIN (SELECT * FROM FT_T_FIRT FIRT WHERE  FIRT.RTNG_SET_OID = '"+b3IssrDfltRtngSetOid+"' AND RTNG_PURP_TYP= :JURISD_2<char[11]> AND FIRT.SYS_EFF_END_TMS IS NULL AND FIRT.END_TMS IS NULL" +
    		" AND COALESCE(FIRT.RTNG_CURR_TYP ,'NULL') = :RTNG_CURR_TYP_3<char[20]> ) ISSRTNG ON ISSR.FINS_INST_MNEM = ISSRTNG.INST_MNEM "+
    		" LEFT JOIN (SELECT  RTV.RTNG_VALUE_OID, BC.RTNG_CDE, BC.RTNG_RANK_NUM, BC.RTNG_CQS_NUM, BC.RTNG_JURIS_NME FROM FT_T_RTVL RTV, FT_T_BCQ1 BC WHERE  BC.DATA_SRC_ID ='BASEL3' " +
    		" AND BC.RTNG_CDE = RTV.RTNG_CDE AND RTV.RTNG_SET_OID = :RTNG_SET_OID_4<char[11]> AND RTV.END_TMS IS NULL AND BC.END_TMS IS NULL ) BRTVL ON BRTVL.RTNG_CDE = ISSRTNG.RTNG_CDE , " +
    		" (SELECT * FROM FT_T_IDMV IDMV WHERE IDMV.FLD_ID = '"+seniorityIdmvflgId+"' AND DMN_VAL_PURP_TYP = 'MHI' AND QUAL_VAL_TXT IS NOT NULL) IDMV " +
    		" WHERE ISSU.INSTR_ISSR_ID = ISSR.INSTR_ISSR_ID AND ISSU.LIQUID_RIGHT_RANK_TYP = IDMV.INTRNL_DMN_VAL_TXT " +
    		" AND INSTR_ID = :INSTR_ID_5<char[11]> ";
    
    private String deriveRatingFromAssetQuery = "WITH QRY AS " +
    		"(SELECT ISSU.INSTR_ID, IDMV.INTRNL_DMN_VAL_NME, IDMV.QUAL_VAL_TXT," +
    		"(SELECT MAX(CASE WHEN (ISSU.DENOM_CURR_CDE IS NULL OR  GUNT.PREF_CURR_CDE IS NULL) THEN '' WHEN ISSU.DENOM_CURR_CDE = GUNT.PREF_CURR_CDE THEN 'LOCAL' ELSE 'FOREIGN' END ) FROM FT_T_FIGU FIGU, FT_T_GUNT GUNT WHERE " +
    		"	ISSR.FINS_INST_MNEM = FIGU.INST_MNEM AND FIGU.FINS_GU_PURP_TYP='INCRPRTE' AND FIGU.GU_TYP='COUNTRY' AND FIGU.END_TMS IS NULL" +
    		"   AND FIGU.GU_ID = GUNT.PRNT_GU_ID AND FIGU.GU_TYP = GUNT.PRNT_GU_TYP AND GUNT.END_TMS IS NULL) CURRTYP " +
    		" FROM FT_T_ISSU ISSU , FT_T_IDMV IDMV, FT_T_ISSR ISSR WHERE ISSU.INSTR_ISSR_ID = ISSR.INSTR_ISSR_ID " +
    		" AND IDMV.FLD_ID = '"+seniorityIdmvflgId+"' AND DMN_VAL_PURP_TYP = 'MHI' AND QUAL_VAL_TXT IS NOT NULL AND ISSU.LIQUID_RIGHT_RANK_TYP = IDMV.INTRNL_DMN_VAL_TXT " +
    		" AND ISSU.INSTR_ISSR_ID = :INSTRISSRID_1<char[11]>) " +
    		" SELECT Q.INSTR_ID, ISRT.RTNG_CDE, ISRT.RTNG_VALUE_OID, ISRT.RTNG_OUTLOOK_TYP,  BCQ.RTNG_CQS_NUM, Q.INTRNL_DMN_VAL_NME, Q.QUAL_VAL_TXT FROM QRY Q, FT_T_ISRT ISRT, FT_T_RTVL RTVL, FT_T_BCQ1 BCQ " +
    		" WHERE Q.INSTR_ID = ISRT.INSTR_ID AND ISRT.SYS_EFF_END_TMS IS NULL AND ISRT.END_TMS IS NULL AND ISRT.RTNG_SET_OID = :RTNG_SET_OID_2<char[11]> AND ISRT.RTNG_PURP_TYP = :JURISD_3<char[11]>  " +
    		" AND ISRT.RTNG_CLASS_TXT='Art139_A' AND RTVL.RTNG_VALUE_OID = ISRT.RTNG_VALUE_OID " +
    		" AND BCQ.DATA_SRC_ID ='BASEL3' AND BCQ.RTNG_CDE = RTVL.RTNG_CDE AND BCQ.END_TMS IS NULL " +
    		" AND ( ( cast(Q.QUAL_VAL_TXT as decimal) >= :SENO_RNK_4<char[4]> AND ISRT.RTNG_OUTLOOK_TYP='LQ') OR ( cast(Q.QUAL_VAL_TXT as decimal)  >= :SENO_RNK_5<char[4]> AND ISRT.RTNG_OUTLOOK_TYP='HQ') ) " +
    		" AND COALESCE(Q.CURRTYP ,'NULL') = :RTNG_CURR_TYP_5<char[20]> ORDER BY RTVL.RANK_NUM";

    private String blg1Query = "INSERT INTO FT_T_BLG1 " +
        "	(BLG1_OID, B3_RTNG_SET_OID, INSTR_ID, STATUS_TYP, ADDL_INFO_TXT, TRACE_PATH, TRN_ID, DRV_RTNG_SRC_INSTR_ID, DRV_RTNG_SRC_INST_MNEM, CREATED_TMS,LAST_CHG_TMS,LAST_CHG_USR_ID) " +
        "	VALUES (NEW_OID(), :B3_RTNG_SET_OID<char[11]> , :INSTR_ID<char[11]>, :STATUS_TYP<char[40]>, :ADDL_INFO_TXT<char[1000]>, :TRACE_PATH<char[4000]>, :TRN_ID<char[17]>, :SRC_INSTR_ID<char[11]>, :SRC_INST_MNEM<char[11]>, SYSDATE(), SYSDATE(), 'AssetRtngDerWoVR')";

    private String existingDeriveRatingQuery = "SELECT ISRT.RTNG_CDE, ISRT.DATA_SRC_ID, ISRT.ISS_RTNG_OID, ISRT.RTNG_VALUE_OID  " +
        " FROM FT_T_ISRT ISRT WHERE ISRT.END_TMS IS NULL AND ISRT.SYS_EFF_END_TMS IS NULL AND ISRT.START_TMS < SYSDATE() " +
        " AND ISRT.INSTR_ID = :INSTR_ID<char[11]> " +
        " AND ISRT.RTNG_SET_OID = :RTNG_SET_OID<char[11]> " +
        " AND ISRT.RTNG_PURP_TYP = :RTNG_PURP_TYP<char[9]> ";

    private String ratingSetsQuery = "SELECT DISTINCT B3_RTNG_SET_OID FROM FT_T_BRM1 WHERE (RTNG_SET_TBL_TYP IS NULL OR RTNG_SET_TBL_TYP IN ('ISSU','FIIS','ALL') ) AND END_TMS IS NULL " +
        " AND (RTNG_JURIS_NME IS NULL OR RTNG_JURIS_NME =:RTNG_JURIS_NME_1<char[8]>)";

    private String fetchCntrlGovCQSQry = "WITH QRY AS ( " +
    " SELECT ISSR.FINS_INST_MNEM INST_MNEM, FFRL.PRNT_INST_MNEM, (SELECT RTNG_SET_OID FROM FT_T_RTNG WHERE RTNG_SET_MNEM = 'B3ISRDRT' AND END_TMS IS NULL) B3ISSRDR " +
    " FROM FT_T_ISSU ISSU, FT_T_ISSR ISSR" +
    " LEFT JOIN (SELECT * FROM FT_T_FFRL WHERE END_TMS IS NULL AND REL_TYP='CENTRALGOVTINST'  ) FFRL ON FFRL.INST_MNEM = ISSR.FINS_INST_MNEM " +
    " WHERE ISSU.INSTR_ID = :INSTR_ID<char[11]>  AND ISSU.INSTR_ISSR_ID = ISSR.INSTR_ISSR_ID ) " +
    " SELECT " +
    " (SELECT MIN(BCQ1.RTNG_CQS_NUM) FROM FT_T_FIRT FIRT, FT_T_RTNG RTNG, FT_T_BCQ1 BCQ1 WHERE FIRT.RTNG_PURP_TYP= :JURISD1<char[11]> AND RTNG.RTNG_SET_MNEM ='B3ISRDRT' AND RTNG_CURR_TYP IS NULL AND RTNG.RTNG_SET_OID = FIRT.RTNG_SET_OID AND  FIRT.INST_MNEM = QRY.PRNT_INST_MNEM   AND RTNG.END_TMS IS NULL AND FIRT.END_TMS IS NULL AND FIRT.SYS_EFF_END_TMS IS NULL AND BCQ1.END_TMS IS NULL AND BCQ1.DATA_SRC_ID = 'BASEL3' AND BCQ1.RTNG_CDE = FIRT.RTNG_CDE )," +
    " (SELECT MIN(BCQ1.RTNG_CQS_NUM) FROM FT_T_FIRT FIRT, FT_T_RTNG RTNG, FT_T_BCQ1 BCQ1 WHERE FIRT.RTNG_PURP_TYP= :JURISD2<char[11]> AND RTNG.RTNG_SET_MNEM ='B3ISRDRT' AND RTNG_CURR_TYP ='LOCAL CURRENCY' AND RTNG.RTNG_SET_OID = FIRT.RTNG_SET_OID AND  FIRT.INST_MNEM = QRY.PRNT_INST_MNEM   AND RTNG.END_TMS IS NULL AND FIRT.END_TMS IS NULL AND FIRT.SYS_EFF_END_TMS IS NULL  AND BCQ1.END_TMS IS NULL AND BCQ1.DATA_SRC_ID = 'BASEL3' AND BCQ1.RTNG_CDE = FIRT.RTNG_CDE), " +
    " (SELECT MIN(BCQ1.RTNG_CQS_NUM) FROM FT_T_FIRT FIRT, FT_T_RTNG RTNG, FT_T_BCQ1 BCQ1 WHERE FIRT.RTNG_PURP_TYP= :JURISD3<char[11]> AND RTNG.RTNG_SET_MNEM ='B3ISRDRT' AND RTNG_CURR_TYP = 'FOREIGN CURRENCY' AND RTNG.RTNG_SET_OID = FIRT.RTNG_SET_OID AND  FIRT.INST_MNEM = QRY.PRNT_INST_MNEM   AND RTNG.END_TMS IS NULL AND FIRT.END_TMS IS NULL AND FIRT.SYS_EFF_END_TMS IS NULL  AND BCQ1.END_TMS IS NULL AND BCQ1.DATA_SRC_ID = 'BASEL3' AND BCQ1.RTNG_CDE = FIRT.RTNG_CDE), " +
    " (SELECT MIN(CL_VALUE) FROM FT_T_FICL FICL WHERE INDUS_CL_SET_ID= :JURISDPRECLID<char[21]> AND FICL.INST_MNEM = QRY.INST_MNEM AND END_TMS IS NULL ), " +
    "  ( CASE WHEN QRY.INST_MNEM = QRY.PRNT_INST_MNEM THEN 'Y' ELSE 'N' END )" +
    " FROM  QRY ";

    private String fetchRtngQualityFlgQry = "SELECT QLTY_CDE FROM FT_T_BRQ1 WHERE EXP_CLS_NME = :EXPCLS<char[41]> AND (CGOV_CQS= :CGOVCQS<char[4]> OR CGOV_CQS IS NULL ) AND RTNG_CQS_NUM= :RTNGCQS<char[4]> AND END_TMS IS NULL ORDER BY CGOV_CQS";
    public CJavaMHIBasel3AssetRatingDerivationWoVR() {}

    // Function to indicate initialisation of the Issuer Rating Derived Rule along with any variables.
    public boolean initialize(String[] parameters) {
        logger.info("Initializing CJavaMHIBasel3AssetRatingDerivationWoVR Rule");

        for (String s: parameters[0].split(",")) {
            Juristictions.add(s);
        }
        logger.info("Juristictions: " + Juristictions);
        logger.info("Initialized CJavaMHIBasel3AssetRatingDerivationWoVR Rule");
        return true;
    }

    public boolean process(XMLMessage msg, DatabaseObjectContainer dboc, ProcessorContext pContext, DatabaseAccess dbConnection, NotificationCreator notificationCreator) throws GSException {
        try {

            logger.info("Processing Starts of CJavaMHIBasel3AssetRatingDerivationWoVR Rule");
			SegmentId firstSeg = new SegmentId(0);
            String msgClassification = msg.getStringField("MSG_CLASSIFICATION", firstSeg );

            if (!"B3ISSURTNGCALBTCHWOVR".equalsIgnoreCase(msgClassification)) {
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

                for (String thisB3RtngSetOid: B3RatingSetsCurr) {
                    // get a new oid for logging in FT_T_BLG1
                    logger.info("Starting process of FOR loop for B3RatingSetsCurr:" + thisB3RtngSetOid);
                    
                    StringBuilder addlInfoSB = new StringBuilder("Searching for->" + issuCurrTyp + "->" + thisJuristiction);
                    StringBuilder tracePathSB = new StringBuilder("Calculating->VendorRating Not Found->Deriving Now->");
                    StringBuilder srcInstrId = new StringBuilder("");
                    StringBuilder srcInstMnem = new StringBuilder("");
                    String statusTyp = "PENDING";

                    // Get attribues for existing Rating (if any)
                    CJavaMHIBasel3RatingAttributes thisExistingDerivedRating = getExistingB3IssuRating(instrId, thisB3RtngSetOid, thisJuristiction, dbConnection);

                    // Get attribues for new Rating (if any)
                    CJavaMHIBasel3RatingAttributes newDerivedRating = getDerivedRatingAttributes(instrId, thisB3RtngSetOid, issuCurrTyp, dbConnection, thisJuristiction, addlInfoSB, tracePathSB, srcInstrId, srcInstMnem );

                    if (!newDerivedRating.isEmpty()) {
                        logger.info("*** Add or amend the rating ***");
                        if (!thisExistingDerivedRating.ratingCode.equals(newDerivedRating.ratingCode)) {
                            tracePathSB.append("->Rating Derived");
                            addlInfoSB.append("->Derived Rating{" + newDerivedRating.ratingCode + "} Found");
                            if (thisExistingDerivedRating.isEmpty()) {
                                statusTyp = "ADDING";
                            } else {
                                statusTyp = "UPDATING";
                            }

                            String hqLqFlag = fetchRtngQltyByCntrlGovtCQSNum(instrId, newDerivedRating.ratingCqsNum, issuCurrTyp, thisJuristiction, dbConnection, tracePathSB, addlInfoSB);
                            addAmendIssuRating(dbConnection, msg, instrId, thisB3RtngSetOid, newDerivedRating, thisJuristiction, thisExistingDerivedRating, hqLqFlag);
                            tracePathSB.append("->Storing in DB");
                            addUpdateBlg1Log(thisB3RtngSetOid, instrId, statusTyp, tracePathSB.toString(), addlInfoSB.toString(), transactionID, dbConnection, srcInstrId.toString(), srcInstMnem.toString() );
                        } else {
                            tracePathSB.append("->Derived Rating matches with Existing Basel Rating. Nothing to Update");
                            addlInfoSB.append("->Derived Rating{" + newDerivedRating.ratingCode + "} Found matches with Basel Rating{" + thisExistingDerivedRating.ratingCode + "}");
                            statusTyp = "NOCHANGE";
                            addUpdateBlg1Log(thisB3RtngSetOid, instrId, statusTyp, tracePathSB.toString(), addlInfoSB.toString(), transactionID, dbConnection,"","");
                        }
                    } else {
                        if (!thisExistingDerivedRating.isEmpty()) {
                            // remove existing rating
                            logger.info("*** Remove old rating ***");
                            endDateExistingDerivedRating(dbConnection, msg, instrId, thisExistingDerivedRating.ratingOid);
                            tracePathSB.append("->Derived Rating Not Found, removing Existing");
                            addlInfoSB.append("->Removing{" + thisB3RtngSetOid + "}");
                            statusTyp = "REMOVING";
                            addUpdateBlg1Log(thisB3RtngSetOid, instrId, statusTyp, tracePathSB.toString(), addlInfoSB.toString(), transactionID, dbConnection,"","");
                        } else if (newDerivedRating.isEmpty()) {
                            tracePathSB.append("->Derived Rating Not Found Nor Basel Rating exists.");
                            addlInfoSB.append("->No Match found");
                            statusTyp = "SKIPPED";
                            addUpdateBlg1Log(thisB3RtngSetOid, instrId, statusTyp, tracePathSB.toString(), addlInfoSB.toString(), transactionID, dbConnection,"","");
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
        //	try {
        dbConnection.setSQL(ratingSetsQuery);
        dbConnection.addParameter(thisJuristiction);

        dbConnection.execute();
        while (!dbConnection.isEndOfStream()) {
            String brm1RatingSet = dbConnection.getNextString();
            RatingSets.add(brm1RatingSet);
        }
        return RatingSets;
    }
    CJavaMHIBasel3RatingAttributes getExistingB3IssuRating(String instrId, String b3RtngSetOid, String juristiction, DatabaseAccess dbConnection) throws Exception {
        logger.info("Within method getExistingIssuRating()");

        String ratingCode = "";
        String ratingVendor = "";
        String ratingOid = "";
        String ratingValueOid = "";
        dbConnection.setSQL(existingDeriveRatingQuery);
        //		try {
        dbConnection.addParameter(instrId);
        dbConnection.addParameter(b3RtngSetOid);
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
        /*	} catch (Exception e) {
			logger.error("SQL query failed to get results of query = '" + e.getMessage() + "'");
			logger.info(e);
		}
*/
        CJavaMHIBasel3RatingAttributes existingRating = new CJavaMHIBasel3RatingAttributes(ratingCode, ratingVendor, ratingOid, ratingValueOid, "");
        logger.debug("getExistingFinsRating -> " + existingRating.getAttributesString());
        return existingRating;
    }


    CJavaMHIBasel3RatingAttributes getDerivedRatingAttributes(String instrId, String rtngB3SetOid, String currType, DatabaseAccess dbConnection, String juristiction, StringBuilder addlInfoSB, StringBuilder tracePathSB, StringBuilder srcInstrId, StringBuilder srcInstMnem) throws Exception {
        logger.info("Within method getDerivedRatingAttributes()");
        String rtngDerivationPath = "";
        String instrIssrId="", instMnem="", seniorityName="", seniorityRnk="";
        String issrRtngCde="", issrRtngQlty="", issrRtngValOid="", issrRtngCqsNum="", issrFnlExpCls="";
        String srcIssuRtngCde="", srcIssuRtngQlty="", srcIssuRtngValOid="", srcIssuRtngCqsNum="", srcIssuInstrId="", srcIssuSeniorityName="", srcIssuSeniorityRnk="";
        CJavaMHIBasel3RatingAttributes derivedRating = new CJavaMHIBasel3RatingAttributes();

        String fnlExlPerJuris = "";
        if ("PRA".equals(juristiction)) {
        	fnlExlPerJuris = "B3PRFNEXCL";
    	}else {
        	fnlExlPerJuris = "B3EBFNEXCL";
        }
        
        String currTypTmp;
        if (currType==null || "".equals(currType) ) { 
        	currTypTmp = "NULL";
        } else if ("FOREIGN".equals(currType)) {
        	currTypTmp = "FOREIGN CURRENCY";
        } else {
        	currTypTmp = "LOCAL CURRENCY";
        }
        
        dbConnection.setSQL(deriveRatingFromIssuerQuery);
        dbConnection.addParameter(fnlExlPerJuris);
        dbConnection.addParameter(juristiction);
        dbConnection.addParameter( currTypTmp );
        dbConnection.addParameter(rtngB3SetOid);
        dbConnection.addParameter(instrId);
        dbConnection.execute();

        if(!dbConnection.isEndOfStream()) {
        	instrIssrId = dbConnection.getNextString();
        if (!dbConnection.isEndOfStream()) {
        	seniorityName = dbConnection.getNextString();
        }
        if (!dbConnection.isEndOfStream()) {
        	seniorityRnk = dbConnection.getNextString();
        }
        if (!dbConnection.isEndOfStream()) {
        	instMnem = dbConnection.getNextString();
        }
        if (!dbConnection.isEndOfStream()) {
        	issrRtngCde = dbConnection.getNextString();
        }
        if (!dbConnection.isEndOfStream()) {
        	issrRtngQlty = dbConnection.getNextString();
        }
        if (!dbConnection.isEndOfStream()) {
        	issrRtngValOid = dbConnection.getNextString();
        }
        if (!dbConnection.isEndOfStream()) {
        	issrRtngCqsNum = dbConnection.getNextString();
        }
        if (!dbConnection.isEndOfStream()) {
        	issrFnlExpCls = dbConnection.getNextString();
        }
        }
        
        logger.debug("Fetched following deriveRatingFromIssuerQuery: instrIssrId:"+instrIssrId+", seniorityName:"+seniorityName+", seniorityRnk:"+seniorityRnk+", instMnem:"+instMnem+", issrRtngCde:"+issrRtngCde
        		+", issrRtngQlty:"+issrRtngQlty+", issrRtngValOid:"+issrRtngValOid+", issrRtngCqsNum:"+issrRtngCqsNum+", issrFnlExpCls:"+issrFnlExpCls) ;
		
        dbConnection.setSQL( deriveRatingFromAssetQuery );
        dbConnection.addParameter(instrIssrId);
        dbConnection.addParameter(rtngB3SetOid);
        dbConnection.addParameter(juristiction);
        dbConnection.addParameter(seniorityRnk);
        dbConnection.addParameter(seniorityRnk);
        dbConnection.addParameter(currType);
        dbConnection.execute();
        
        if(!dbConnection.isEndOfStream()) {
        	srcIssuInstrId = dbConnection.getNextString();
        if (!dbConnection.isEndOfStream()) {
        	srcIssuRtngCde = dbConnection.getNextString();
        }
        if (!dbConnection.isEndOfStream()) {
        	srcIssuRtngValOid = dbConnection.getNextString();
        }
        if (!dbConnection.isEndOfStream()) {
        	srcIssuRtngQlty = dbConnection.getNextString();
        }
        if (!dbConnection.isEndOfStream()) {
        	srcIssuRtngCqsNum = dbConnection.getNextString();
        }
        if (!dbConnection.isEndOfStream()) {
        	srcIssuSeniorityName = dbConnection.getNextString();
        }
        if (!dbConnection.isEndOfStream()) {
        	srcIssuSeniorityRnk = dbConnection.getNextString();
        }
        }
        
        logger.debug("Fetched following deriveRatingFromAssetQuery: srcIssuInstrId:"+srcIssuInstrId+", srcIssuRtngCde:"+srcIssuRtngCde+", srcIssuRtngValOid:"+srcIssuRtngValOid+
        			", srcIssuRtngQlty:"+srcIssuRtngQlty+", srcIssuRtngCqsNum:"+srcIssuRtngCqsNum+", srcIssuSeniorityName:"+srcIssuSeniorityName+", srcIssuSeniorityRnk:"+srcIssuSeniorityRnk);

        
        if (srcIssuInstrId!=null && !"".equals(srcIssuInstrId)) {
        	
        	if ("HQ".equalsIgnoreCase(srcIssuRtngQlty)) {        		
        		if ( "PRA".equals(juristiction)) {
    				if ("INST".equals(issrFnlExpCls)) {
    					rtngDerivationPath = "Art139_B";
    					
        			}else {
    					rtngDerivationPath = "Art139_C";
        			}
    			}else {
    				rtngDerivationPath = "Art139_B";
    			}	
        	} else {
        			if ( "PRA".equals(juristiction)) {
        				if ("INST".equals(issrFnlExpCls)) {
        					rtngDerivationPath = "Art139_D";
            			}else {
        					rtngDerivationPath = "Art139_E";
            			}
        			}else {
        			rtngDerivationPath = "Art139_D";
        			}
           	}
        	if (!"".equals(rtngDerivationPath)){
        		derivedRating = new CJavaMHIBasel3RatingAttributes(srcIssuRtngCde, "MHI", rtngB3SetOid, srcIssuRtngValOid, srcIssuRtngCqsNum, rtngDerivationPath);
        		srcInstrId.append( srcIssuInstrId);
        		tracePathSB.append("->Rating Derived From Rated Issue");
                addlInfoSB.append("->Derived Rating{" + srcIssuRtngCde + "} Found with Qlty="+srcIssuRtngQlty+" Rated Issue Seniority="+srcIssuSeniorityName+" while Asset Seniority="+seniorityName+" Article="+rtngDerivationPath);
            	
        	} else {
        		tracePathSB.append("->Rating Not Derived From Issue");
        	}
        	logger.debug("Inside Derive rating from other rated Issue : rtngDerivationPath:"+rtngDerivationPath);
        	
        } else if (issrRtngValOid!=null && !"".equals(issrRtngValOid) ) {
        	tracePathSB.append("->Rating Not Derived From Issue");
        	int snrRankNum = Integer.parseInt(seniorityRnk);
        	if ("HQ".equalsIgnoreCase(issrRtngQlty)) {        		
        		if (snrRankNum<=SnrUnscrRankNum) {
        			rtngDerivationPath = "Art139_F";
        		}
        	} else {
        		if (snrRankNum>=SnrUnscrRankNum) {
        			rtngDerivationPath = "Art139_G";
        		}
        	}
        	if (!"".equals(rtngDerivationPath)){
    			derivedRating = new CJavaMHIBasel3RatingAttributes(issrRtngCde, "MHI", rtngB3SetOid, issrRtngValOid, issrRtngCqsNum, rtngDerivationPath);
    			srcInstMnem.append(instMnem);
    			tracePathSB.append("->Rating Derived From Issuer");
                addlInfoSB.append("->Derived Rating{" + issrRtngCde + "} Found with Qlty="+issrRtngQlty+" Asset Seniority="+seniorityName+" Article="+rtngDerivationPath);
            	
        	} else { 
        		tracePathSB.append("->Rating Not Derived From Issuer");
        	}
        	logger.debug("Inside Derive rating from rated Issuer : rtngDerivationPath:"+rtngDerivationPath);
        }else {
        	tracePathSB.append("->Rating Not Derived From Issue");
        	tracePathSB.append("->Rating Not Derived From Issuer");
        }
        
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
        CJavaMHIBasel3RatingAttributes thisExistingDerivedRating, String hqLqFlag) {
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
        msg.addField("RTNG_CLASS_TXT", newSegmentId, newDerivedRating.rtngDerivationPath);
        msg.addField("RTNG_OUTLOOK_TYP", newSegmentId, hqLqFlag);
        msg.addField("START_TMS", newSegmentId, today);
        msg.setFieldAttribute("START_TMS", newSegmentId, "INSERT_ONLY", "Y");
        msg.addField("RTNG_EFF_TMS", newSegmentId, today);
        msg.setFieldAttribute("RTNG_EFF_TMS", newSegmentId, "INSERT_ONLY", "Y");

        if (!"".equals(newDerivedRating.vendor)) {
            msg.addField("ORIG_DATA_PROV_ID", newSegmentId, newDerivedRating.vendor);
        }

        logger.info("exiting method addAmendIssuRating");
    }
    private String fetchRtngQltyByCntrlGovtCQSNum(String instrId, String ratingCqsNum, String currTyp, String rtngJuristiction, DatabaseAccess dbConnection, StringBuilder tracePathSB, StringBuilder addlInfoSB) throws Exception {
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
            if ("LOCAL".equals(currTyp)) {
                fnlGovtCQS = issrDfltLcl;
            } else if ("FOREIGN".equals(currTyp)) {
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

    void addUpdateBlg1Log(String b3RtngSetOid, String instMnem, String statusTyp, String tracePath, String addlInfoTxt, String transactionID, DatabaseAccess dbConnection, String srcInstrId, String srcInstMnem) throws Exception {
        logger.info("Within method addUpdateBlg1Log");
        dbConnection.setSQL(blg1Query);
        dbConnection.addParameter(b3RtngSetOid);
        dbConnection.addParameter(instMnem);
        dbConnection.addParameter(statusTyp);
        dbConnection.addParameter(addlInfoTxt);
        dbConnection.addParameter(tracePath);
        dbConnection.addParameter(transactionID);
        dbConnection.addParameter(srcInstrId);
        dbConnection.addParameter(srcInstMnem);
        dbConnection.execute();
    }
}