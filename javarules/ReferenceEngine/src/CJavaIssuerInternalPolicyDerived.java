import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import org.apache.log4j.Logger;


import com.thegoldensource.jbre.DatabaseAccess;
import com.thegoldensource.jbre.DatabaseObjectContainer;
import com.thegoldensource.jbre.JavaRule;
import com.thegoldensource.jbre.NotificationCreator;
import com.thegoldensource.jbre.ProcessorContext;
import com.thegoldensource.jbre.SegmentId;
import com.thegoldensource.jbre.XMLMessage;

public class CJavaIssuerInternalPolicyDerived implements JavaRule {
	private static Logger logger = Logger.getLogger("CJavaIssuerInternalPolicyDerived");
	private String prtPurpTyps;

	public CJavaIssuerInternalPolicyDerived() { }

	// Function to indicate initialisation of the Issuer Rating Derived Rule along with any variables.
	public boolean initialize(String[] parameters) {
		logger.info("Initializing CJavaIssuerInternalPolicyDerived Rule");
		prtPurpTyps = parameters[0];
		logger.info("Initialized CJavaIssuerInternalPolicyDerived Rule");

		return true;
	}

	// Function to process the XML message being processed.
	public boolean process(XMLMessage msg, DatabaseObjectContainer dboc, ProcessorContext pContext, DatabaseAccess dbConnection, NotificationCreator notificationCreator) {

		logger.info("Processing Java rule CJavaIssuerInternalPolicyDerived Rule");

		// EG-8768 - Ignore messages from Product Master
		String msgClassification = msg.getStringField("MSG_CLASSIFICATION",
				new SegmentId(0));
		logger.debug("MSG_CLASSIFICATION = " + msgClassification);
		if ("PMISSR".equalsIgnoreCase(msgClassification)) {
			logger.info("Message is from PM. Exiting");
			return true;
		}

		String segmentName = pContext.getCurrentSegmentType();
		logger.info("segmentName: " + segmentName);
		SegmentId firstSeg = new SegmentId(0);

		// EG-8443 Only run this rule from Final segment to prevent FINS group segments from populating inbetween ISSR group segmetns
		// EG-8443 Only proceed if MAIN_ENTITY_TBL_TYP is ISSR or FINS
		String mainIssueType  = msg.getStringField("MAIN_ENTITY_TBL_TYP", firstSeg);

		if (mainIssueType == null || (!mainIssueType.equals("FINS") && !mainIssueType.equals("ISSR") ))
		{
			logger.info("Not a FINS or ISSR. Exiting");
			logger.info("Variable mainIssueType detected:" + mainIssueType);
			return true;
		}
		logger.info("mainIssueType: " + mainIssueType);

		// If FINS record, then find inst_mnem

		String instMnem = "";
		// EG-8443 commented out if("Final".equalsIgnoreCase(segmentName))
		if (mainIssueType.equals("FINS")) {
			instMnem = msg.getStringField("INST_MNEM", firstSeg);

			logger.info("instMnem: " + instMnem);

			if (instMnem == null || instMnem.equals("")) {
				logger.info("No inst_mnem. Exiting");
				return true;
			}

			if (prtPurpTyps != null && !prtPurpTyps.equals("")) {
				// Check in IOI Group(s)
				String[] issrGrpArray = prtPurpTyps.split(",");
				boolean irgpMember = false;

				String instrIssrId = null;
				String sql = "SELECT instr_issr_id from FT_T_ISSR " + "WHERE fins_inst_mnem = '" + instMnem + "'" + "AND COALESCE(end_tms, SYSDATE() + INTERVAL '1 day') > SYSDATE()";
				dbConnection.setSQL(sql);
				dbConnection.execute();

				if (!dbConnection.isEndOfStream()) {
					instrIssrId = dbConnection.getNextString();
					logger.info("instrIssrId: " + instrIssrId);
				}

				for (int i = 0; i < issrGrpArray.length; i++) {
					irgpMember = Common.checkIrgpExists(dbConnection, issrGrpArray[i], instrIssrId, logger);
					if (irgpMember == true)
						break;
				}

				if (irgpMember == false) {
					if (logger.isInfoEnabled())
						logger.info("Not in any of the groups. Exiting");
					return true;
				}
			}
		} // end of FINS

		// If ISSR record, then find ISSRIssuerGroupParticipant segment. If the segment not present, exit

		//else if("ISSRIssuerGroupParticipant".equalsIgnoreCase(segmentName))
		if (mainIssueType.equals("ISSR")) {

			for (int ii = 0; ii < msg.getSegmentCount(); ii++) {
				SegmentId segId = new SegmentId(ii);
				String segType = msg.getSegmentType(segId);
				logger.info("segType: " + segType);

				// Look for ISSRIssuerGroupParticipant segment
				if ("ISSRIssuerGroupParticipant".equals(segType)) 
				{
					String prtPurpTyp = msg.getStringField("PRT_PURP_TYP", segId);
					logger.info("prtPurpTyp: " + prtPurpTyp);

					if (prtPurpTyp == null || "".equals(prtPurpTyp)) {
						String irgpOid = msg.getStringField("IRGP_OID", segId);
						logger.info("irgpOid: " + irgpOid);
						if (irgpOid == null || "".equals(irgpOid)) {
							logger.info("Invalid IRGP row. Exiting");
							return true;
						}
						String sql = "SELECT trim(prt_purp_typ) from FT_T_IRGP " + "WHERE irgp_oid = '" + irgpOid + "'" + "AND COALESCE(end_tms, SYSDATE() + INTERVAL '1 day') > SYSDATE()";

						dbConnection.setSQL(sql);
						dbConnection.execute();

						if (!dbConnection.isEndOfStream()) {
							prtPurpTyp = dbConnection.getNextString();
							logger.info("d/b - prtPurpTyp: " + prtPurpTyp);
						} else {
							logger.info("prtPurpTyp not found. Must be end dated so exiting rule");
							return true;
						}
					}

					if (prtPurpTyps != null && !prtPurpTyps.equals("")) {
						// Check in IOI Group(s)
						String[] issrGrpArray = prtPurpTyps.split(",");
						boolean irgpMember = false;

						for (int i = 0; i < issrGrpArray.length; i++) {
							// irgpMember = Common.checkIrgpExists(dbConnection,
							// issrGrpArray[i], instrIssrId, logger);
							if (prtPurpTyp.equals(issrGrpArray[i])) {
								irgpMember = true;
								break;
							}
						}

						if (irgpMember == false) {
							if (logger.isInfoEnabled())
								logger.info("Not in any of the groups. Exiting");
							return true;
						}
					}

					String instrIssrId = msg.getStringField("INSTR_ISSR_ID",segId);
					logger.info("instrIssrId: " + instrIssrId);

					String sql = "SELECT fins_inst_mnem from FT_T_ISSR " + "WHERE instr_issr_id = '" + instrIssrId + "'" + "AND COALESCE(end_tms, SYSDATE() + INTERVAL '1 day') > SYSDATE()";


					dbConnection.setSQL(sql);
					dbConnection.execute();

					if (!dbConnection.isEndOfStream()) {
						instMnem = dbConnection.getNextString();
						logger.info("instMnem: " + instMnem);
					}

					if (instMnem == null || "".equals(instMnem)) {
						logger.info("No instMnem found. Exiting.");
						return true;
					}

					break; // Procesing once is enough so exit the loop

				} // end of ISSRIssuerGroupParticipant
			} // end of For loop

			if (instMnem == null || "".equals(instMnem)) {
				logger.info("No instMnem found. Exiting.");
				return true; // EG-8443 Exit as INST_NMEM is not found
			}

		} // end of ISSR
		// else
		// return true;

		String sqlQuery = "";
		int codemaxinternal = 0;
		int codemaxfitch = 0;
		int codeMaxMoodyPri = 0;
		int codeMaxMoodySec = 0;
		int codeMaxSNP = 0;
		int codemaxjcr = 0;
		int codemaxpolicy = 0;
		String policy = "";
		String policyrtvl = "";
		String vendor = "";

		// Select Lowest Rank of Internal Rating - MHI Internal Rating and MHSS
		// Internal Rating.

		sqlQuery = "SELECT COALESCE(MAX(RTVL.RANK_NUM),0) FROM FT_T_RTVL RTVL,FT_T_FIRT FIRT, FT_T_RTNG RTNG "
					+ "WHERE FIRT.INST_MNEM='"+ instMnem + "' "
					+ "AND RTNG.RTNG_SET_OID = RTVL.RTNG_SET_OID "
					+ "AND RTNG.RTNG_SET_MNEM IN ('INTRNLPA', 'MHSSINPA') "
					+ "AND RTVL.RTNG_VALUE_OID=FIRT.RTNG_VALUE_OID "
					+ "AND FIRT.SYS_EFF_END_TMS IS NULL "
					+ "AND FIRT.END_TMS IS NULL";

		codemaxinternal = selectQueryInt(dbConnection, sqlQuery);
		logger.info("Internal code: " + codemaxinternal);

		if (codemaxinternal > 0) {
			// Internal Rating exists , hence using it for Derived Policy Rating
			codemaxpolicy = codemaxinternal;
			vendor = "MHI";
		} else {
			// Internal Rating does not exists, hence proceeding further to check for SNP 
			sqlQuery = "SELECT COALESCE(MAX(RNKNUM),0) FROM "
						+ "(SELECT RANK() OVER (ORDER BY CASE RTNG_CURR_TYP WHEN 'FOREIGN CURRENCY' THEN 1 WHEN 'LOCAL CURRENCY' THEN 2 ELSE 3 END, RANK_NUM DESC ) RNK , "
						+ "RTVL.RANK_NUM RNKNUM FROM FT_T_RTVL RTVL,FT_T_FIRT FIRT, FT_T_RTNG RTNG "
						+ "WHERE FIRT.INST_MNEM='" + instMnem + "' "
						+ "AND RTNG.RTNG_SET_OID = RTVL.RTNG_SET_OID "
						+ "AND RTNG.RTNG_SET_MNEM IN ('126', '130') "
						+ "AND RTVL.RTNG_VALUE_OID=FIRT.RTNG_VALUE_OID "
						+ "AND FIRT.SYS_EFF_END_TMS IS NULL "
						+ "AND FIRT.END_TMS IS NULL "
						+ "AND RTVL.RANK_NUM IS NOT NULL ) QRY "
						+ "WHERE QRY.RNK = 1 ";

			codeMaxSNP = selectQueryInt(dbConnection, sqlQuery);
			logger.info("S&P code: " + codeMaxSNP);

			// Internal Rating does not exists, hence proceeding further to check for Primary Moody's Rating.
			sqlQuery = "SELECT COALESCE(MAX(RNKNUM),0) FROM "
						+ "(SELECT RANK() OVER (ORDER BY CASE RTNG_CURR_TYP WHEN 'FOREIGN CURRENCY' THEN 1 WHEN 'LOCAL CURRENCY' THEN 2 ELSE 3 END, RANK_NUM DESC ) RNK , "
						+ "RTVL.RANK_NUM RNKNUM FROM FT_T_RTVL RTVL,FT_T_FIRT FIRT, FT_T_RTNG RTNG "
						+ "WHERE FIRT.INST_MNEM='" + instMnem + "' "
						+ "AND RTNG.RTNG_SET_OID = RTVL.RTNG_SET_OID "
						+ "AND ( 	( RTNG.RTNG_SET_MNEM IN ('534') AND FIRT.RTNG_DEBT_CL_TYP IN ('CTP','CRR','SI','REG') )"
						+ "		OR	( RTNG.RTNG_SET_MNEM IN ('545') AND FIRT.RTNG_DEBT_CL_TYP IN ('CLM' ) ) )"
						+ "AND RTVL.RTNG_VALUE_OID=FIRT.RTNG_VALUE_OID "
						+ "AND FIRT.SYS_EFF_END_TMS IS NULL "
						+ "AND FIRT.END_TMS IS NULL "
						+ "AND RTVL.RANK_NUM IS NOT NULL ) QRY "
						+ "WHERE QRY.RNK = 1 ";

			codeMaxMoodyPri = selectQueryInt(dbConnection, sqlQuery);
			logger.info("MOODY Primary code: " + codeMaxMoodyPri);

			if (codeMaxSNP > 0 || codeMaxMoodyPri > 0) {
				// SNP or Moody Primary Rating exists , hence using whichever is lowest for Derived Policy Rating
				if ( codeMaxMoodyPri > codeMaxSNP) {
					codemaxpolicy = codeMaxMoodyPri;
					vendor = "MOODY";
				} else {
					codemaxpolicy = codeMaxSNP;
					vendor = "SAP";
				}

			} else {
				// Internal, SNP or Moody's Primary Rating does not exists, hence proceeding further to check for Secondary Moody's Rating.
				
				sqlQuery = "SELECT COALESCE(MAX(RTVL.RANK_NUM),0) FROM FT_T_RTVL RTVL,FT_T_FIRT FIRT, FT_T_RTNG RTNG "
							+ "WHERE FIRT.INST_MNEM='" + instMnem + "' "
							+ "AND RTNG.RTNG_SET_OID = RTVL.RTNG_SET_OID "
							+ "AND RTNG.RTNG_SET_MNEM IN ('538') "
							+ "AND FIRT.RTNG_DEBT_CL_TYP IN ('SCD' )"
							+ "AND RTVL.RTNG_VALUE_OID=FIRT.RTNG_VALUE_OID "
							+ "AND FIRT.SYS_EFF_END_TMS IS NULL "
							+ "AND FIRT.END_TMS IS NULL";

				codeMaxMoodySec = selectQueryInt(dbConnection, sqlQuery);
				logger.info("MOODY Secondary code: " + codeMaxMoodySec);

				if (codeMaxMoodySec > 0) {
					// Internal Rating exists , hence using it for Derived
					// Policy Rating
					codemaxpolicy = codeMaxMoodySec;
					vendor = "MOODY";
				} else {

					sqlQuery = "SELECT COALESCE(MAX(RTVL.RANK_NUM),0) FROM FT_T_RTVL RTVL,FT_T_FIRT FIRT, FT_T_RTNG RTNG "
								+ "WHERE FIRT.INST_MNEM='"+ instMnem+ "' "
								+ "AND RTNG.RTNG_SET_OID = RTVL.RTNG_SET_OID "
								+ "AND RTNG.RTNG_SET_MNEM IN ('LTISRDRF','LTNIFSRT','INSFSTRT','LTLCRISR') "
								+ "AND RTVL.RTNG_VALUE_OID=FIRT.RTNG_VALUE_OID "
								+ "AND FIRT.SYS_EFF_END_TMS IS NULL "
								+ "AND FIRT.END_TMS IS NULL";

					codemaxfitch = selectQueryInt(dbConnection, sqlQuery);
					logger.info("Fitch code: " + codemaxfitch);
					if (codemaxfitch > 0) {
						codemaxpolicy = codemaxfitch;
						vendor = "FITCH";
					} else {
						sqlQuery = "SELECT COALESCE(MAX(RTVL.RANK_NUM),0) FROM FT_T_RTVL RTVL,FT_T_FIRT FIRT, FT_T_RTNG RTNG "
									+ "WHERE FIRT.INST_MNEM='"+ instMnem+ "' "
									+ "AND RTNG.RTNG_SET_OID = RTVL.RTNG_SET_OID "
									+ "AND RTNG.RTNG_SET_MNEM = 'JCR' AND RTVL.RTNG_VALUE_OID=FIRT.RTNG_VALUE_OID "
									+ "AND FIRT.SYS_EFF_END_TMS IS NULL "
									+ "AND FIRT.END_TMS IS NULL";

						codemaxjcr = selectQueryInt(dbConnection, sqlQuery);
						logger.info("JCR code: " + codemaxjcr);
						if (codemaxjcr > 0) {
							codemaxpolicy = codemaxjcr;
							vendor = "JCR";
						}
					}

				}
			}
		}
		// Derive the Derived party policy code

		logger.info("codemaxpolicy: " + codemaxpolicy + " and Verdor: "
				+ vendor);

		if (codemaxpolicy > 0) {
			sqlQuery = "select rtng_cde, rtng_value_oid from ft_t_rtvl where rank_num="
					+ codemaxpolicy + " and RTNG_SET_OID in ('MIZRTNG3')";
			ArrayList<String> policyList = selectQueryStringList(dbConnection,
					sqlQuery);
			if (policyList.size() > 1) {
				policy = policyList.get(0);
				policyrtvl = policyList.get(1);
			}
			logger.info("policy: " + policy + " and policyrtvl: " + policyrtvl);

		} else {
			policy = "NR";
			sqlQuery = "select rtng_value_oid from ft_t_rtvl where rtng_set_oid = 'MIZRTNG3' and rtng_cde = 'NR'";
			policyrtvl = selectQueryStringOne(dbConnection, sqlQuery);
			logger.info("policyrtvl: " + policyrtvl);

		}

		sqlQuery = "select rtng_cde from ft_t_firt firt "
					+ "where firt.inst_mnem='" + instMnem + "' "
					+ "and firt.rtng_set_oid = 'MIZRTNG3' "
					+ "and firt.sys_eff_end_tms is NULL "
					+ "and firt.end_tms is NULL";

		String currPolicy = selectQueryStringOne(dbConnection, sqlQuery);
		logger.info("currPolicy: " + currPolicy);

		if (!currPolicy.equals(policy))
			addFinsRating(dbConnection, msg, instMnem, policy, "MIZRTNG3",policyrtvl, vendor);

		return true;

	}

	int selectQueryInt(DatabaseAccess dbConnection, String query) {
		int retValue = 0;
		try {
			dbConnection.setSQL(query);
			dbConnection.execute();
			if (!dbConnection.isEndOfStream()) {
				retValue = dbConnection.getNextInt();
			}
			dbConnection.close();
		} catch (Exception e) {
			logger.error("SQL query failed, message = '" + e.getMessage() + "'");
			logger.info(e);
		}
		return retValue;
	}

	ArrayList<String> selectQueryStringList(DatabaseAccess dbConnection,
			String query) {
		ArrayList<String> retValue = new ArrayList<String>();
		try {
			dbConnection.setSQL(query);
			dbConnection.execute();
			while (!dbConnection.isEndOfStream()) {
				retValue.add(dbConnection.getNextString().trim());
			}
			dbConnection.close();
		} catch (Exception e) {
			logger.error("SQL query failed, message = '" + e.getMessage()	+ "'");
			logger.info(e);
		}
		return retValue;
	}

	String selectQueryStringOne(DatabaseAccess dbConnection, String query) {
		String retValue = "";
		try {
			dbConnection.setSQL(query);
			dbConnection.execute();
			if (!dbConnection.isEndOfStream()) {
				retValue = dbConnection.getNextString().trim();
			}
			dbConnection.close();
		} catch (Exception e) {
			logger.error("SQL query failed, message = '" + e.getMessage()+ "'");
			logger.info(e);
		}
		return retValue;
	}

	void addFinsRating(DatabaseAccess dbConnection, XMLMessage msg,
			String instMnem, String rtngCode, String rtngSetOid,
			String rtngvalueOid, String vendor) {

		// EG-8502 - Remove existing rating row before attempting to add a new
		// rating. This is to prevent duplicate ratings appearing
		String RemoveExistingRating = "DELETE FROM FT_T_FIRT WHERE INST_MNEM = '" + instMnem + "' AND RTNG_SET_OID = '" + rtngSetOid + "'";
		logger.info("Delete existing rating. SQL is " + RemoveExistingRating);
		try {
			dbConnection.setSQL(RemoveExistingRating);
			dbConnection.execute();
			dbConnection.close();
		} catch (Exception e) {
			logger.error("SQL query failed, message = '" + e.getMessage()+ "'");
			logger.info(e);
		}
		logger.info("Add rating " + rtngCode + " with RTNG_SET_OID = '"	+ rtngSetOid + "'");

		SegmentId finsSegmentId = msg.addSegment(XMLMessage.A_REFERENCE, "FinancialInstitution");
		msg.addField("INST_MNEM", finsSegmentId, instMnem);

		SegmentId newSegmentId = msg.addSegment(XMLMessage.A_D_UNKNOWN, "FinancialInstitutionRating");
		msg.setSegmentAttribute(newSegmentId, "MATCH", "FIRT_MATCH_5");
		msg.addField("INST_MNEM", newSegmentId, instMnem);
		msg.addField("RTNG_CDE", newSegmentId, rtngCode);
		msg.addField("RTNG_SYMBOL_TXT", newSegmentId, rtngCode);
		msg.addField("RTNG_SET_OID", newSegmentId, rtngSetOid);
		msg.addField("RTNG_VALUE_OID", newSegmentId, rtngvalueOid);
		msg.addField("DATA_STAT_TYP", newSegmentId, "ACTIVE");

		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.HOUR_OF_DAY, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);
		cal.set(Calendar.MILLISECOND, 0);
		Date today = cal.getTime();

		msg.addField("START_TMS", newSegmentId, today);
		msg.setFieldAttribute("START_TMS", newSegmentId, "INSERT_ONLY", "Y");

		msg.addField("RTNG_EFF_TMS", newSegmentId, today);
		msg.setFieldAttribute("RTNG_EFF_TMS", newSegmentId, "INSERT_ONLY", "Y");

		if (!"".equalsIgnoreCase(vendor)) {
			msg.addField("DATA_SRC_ID", newSegmentId, vendor);
		}
	}

}