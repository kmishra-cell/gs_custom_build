
import com.thegoldensource.jbre.*;
import org.apache.log4j.Logger;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class CJavaMHIIssuerRatingDerived implements JavaRule {
	private static Logger logger = Logger.getLogger("CJavaMHIIssuerRatingDerived");
	private String prtPurpTyps;

	public CJavaMHIIssuerRatingDerived() {
	}

	// Function to indicate initialisation of the Issuer Rating Derived Rule
	// along with any variables.
	public boolean initialize(String[] parameters) {
		logger.info("Initializing CJavaMHIIssuerRatingDerived Rule");
		prtPurpTyps = parameters[0];
		logger.info("Initialized CJavaMHIIssuerRatingDerived Rule");

		return true;
	}
	

	// Function to process the XML message being processed.
	public boolean process(XMLMessage msg, DatabaseObjectContainer dboc,
			ProcessorContext pContext, DatabaseAccess dbConnection,
			NotificationCreator notificationCreator) {
		
		logger.info("Processing Java rule CJavaMHIIssuerRatingDerived Rule");
		
		
		 if(logger.isDebugEnabled())
       logger.debug("xml: " + msg.getXMLString());
		
		// EG-8768 - Ignore messages from Product Master
		String msgClassification = msg.getStringField("MSG_CLASSIFICATION", new SegmentId(0));
		logger.debug("MSG_CLASSIFICATION = " + msgClassification);
		if("PMISSR".equalsIgnoreCase(msgClassification)){
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

		//If FINS record, then find inst_mnem

			String instMnem = "";
		//	EG-8443 commented out	if("Final".equalsIgnoreCase(segmentName))
		if (mainIssueType.equals("FINS"))
		{
			instMnem = msg.getStringField("INST_MNEM", firstSeg);

			logger.info("instMnem: " + instMnem);

			if (instMnem == null || instMnem.equals(""))
			{
				logger.info("No inst_mnem. Exiting");
				return true;
			}

			if (prtPurpTyps != null && !prtPurpTyps.equals(""))
			{
				//Check in IOI Group(s)
				String[] issrGrpArray = prtPurpTyps.split(",");
				boolean irgpMember = false;

				String instrIssrId = null;
				String sql = 	"SELECT instr_issr_id from FT_T_ISSR " +
								"WHERE fins_inst_mnem = '" + instMnem + "'" +
								"AND COALESCE(end_tms, SYSDATE() + INTERVAL '1 day') > SYSDATE()";

				dbConnection.setSQL(sql);
				dbConnection.execute();

				if(!dbConnection.isEndOfStream())
				{
					instrIssrId=dbConnection.getNextString();
					logger.info("instrIssrId: " + instrIssrId);
				}

				for(int i=0; i < issrGrpArray.length; i++)
				{
					irgpMember = Common.checkIrgpExists(dbConnection, issrGrpArray[i], instrIssrId, logger);
					if (irgpMember == true)
						break;
				}

				if (irgpMember == false)
				{
					if(logger.isInfoEnabled())
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
				
				if ("ISSRIssuerGroupParticipant".equals(segType)) // -- Look for ISSRIssuerGroupParticipant segment
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
						String sql = "SELECT trim(prt_purp_typ) from FT_T_IRGP " +
								"WHERE irgp_oid = '" + irgpOid + "'" +
								"AND COALESCE(end_tms, SYSDATE() + INTERVAL '1 day') > SYSDATE()";

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
						//Check in IOI Group(s)
						String[] issrGrpArray = prtPurpTyps.split(",");
						boolean irgpMember = false;

						for (int i = 0; i < issrGrpArray.length; i++) {
							//irgpMember = Common.checkIrgpExists(dbConnection, issrGrpArray[i], instrIssrId, logger);
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

					String instrIssrId = msg.getStringField("INSTR_ISSR_ID", segId);
					logger.info("instrIssrId: " + instrIssrId);

					String sql = "SELECT fins_inst_mnem from FT_T_ISSR " +
							"WHERE instr_issr_id = '" + instrIssrId + "'" +
							"AND COALESCE(end_tms, SYSDATE() + INTERVAL '1 day') > SYSDATE()";

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
					
				}  // end of ISSRIssuerGroupParticipant
			} // end of For loop
			
			if (instMnem == null || "".equals(instMnem)) {
				logger.info("No instMnem found. Exiting.");
				return true;   //EG-8443 Exit as INST_NMEM is not found
			}
			
		} // end of ISSR
		//  else
		//	return true;

		String sqlQuery = "";
		//SegmentId currSegmentId;
		//String finsRtngOid = "";
		//String rtngValueOid = "";
		String policy = "";
		int code = 0;
		int codemaxinternal = 0;
		int codemaxfitch = 0;
		int codemaxmoody = 0;
		int codemaxsp = 0;
		int codemaxjcr = 0;
		//Integer codemaxri = 0;
		int codemaxpolicy = 0;
		int codemaxbasel = 0;
		String policyrtvl = "";
		String codemaxbaselcde = "";
		String basel = "";
		String baselrtvl = "";
		String baselstdrtvl = "";
		//String rtngsetoid1 = "";
		String vendor = "";

		// Extend query to include MHSS Internal ratings (rtng.rtng_set_mnem = 'MHSSINPA')
		// Return the lower of the two (if both present)

		sqlQuery =	"select coalesce(max(rtvl.rank_num),0) from ft_t_rtvl rtvl,ft_t_firt firt, ft_t_rtng rtng " +
					"where firt.inst_mnem='"+ instMnem + "' " +
					"and rtng.rtng_set_oid = rtvl.rtng_set_oid "+
					"and rtng.rtng_set_mnem in ('INTRNLPA', 'MHSSINPA') " +
					"and rtvl.rtng_value_oid=firt.rtng_value_oid " +
					"and firt.sys_eff_end_tms is NULL " +
					"and firt.end_tms is NULL";
		logger.info("Internal code query is " + sqlQuery);
		code = selectQueryInt(dbConnection, sqlQuery);
		logger.info("Internal code: " + code);

		if (code > codemaxinternal)
			codemaxinternal = code;

		sqlQuery =	"select coalesce(max(rtvl.rank_num),0) from ft_t_rtvl rtvl,ft_t_firt firt, ft_t_rtng rtng " +
					"where firt.inst_mnem='"+ instMnem + "' " +
					"and rtng.rtng_set_oid = rtvl.rtng_set_oid "+
					"and rtng.rtng_set_mnem IN ('534', '538', '545') " +
					"and rtvl.rtng_value_oid=firt.rtng_value_oid " +
					"and firt.sys_eff_end_tms is NULL " +
					"and firt.end_tms is NULL " +
					"and (firt.rtng_class_txt is null or firt.rtng_class_txt not in ('Senior Unsecured', 'BACKED Senior Unsecured') ) " ;
		logger.info("Moody code query is " + sqlQuery);
		code = selectQueryInt(dbConnection, sqlQuery);
		logger.info("Moodys code: " + code);
		
		if (code > codemaxmoody) {
			codemaxmoody = code;
		}

		sqlQuery = 	"select coalesce(max(rtvl.rank_num),0) from ft_t_rtvl rtvl,ft_t_firt firt, ft_t_rtng rtng " +
					"where firt.inst_mnem='"+ instMnem + "' " +
					"and rtng.rtng_set_oid = rtvl.rtng_set_oid "+
					"and rtng.rtng_set_mnem in ('LTISRDRF','LTNIFSRT','INSFSTRT','LTLCRISR') " +
					"and rtvl.rtng_value_oid=firt.rtng_value_oid " +
					"and firt.sys_eff_end_tms is NULL " +
					"and firt.end_tms is NULL";
		logger.info("Fitch code query is " + sqlQuery);
		code = selectQueryInt(dbConnection, sqlQuery);
		logger.info("Fitch code: " + code);
		if (code > codemaxfitch) {
			codemaxfitch = code;
		}

		sqlQuery =	"select coalesce(max(rtvl.rank_num),0) from ft_t_rtvl rtvl,ft_t_firt firt, ft_t_rtng rtng " +
					"where firt.inst_mnem='"+ instMnem + "' " +
					"and rtng.rtng_set_oid = rtvl.rtng_set_oid "+
					"and rtng.rtng_set_mnem IN ('126', '130') " +
					"and rtvl.rtng_value_oid=firt.rtng_value_oid " +
					"and firt.sys_eff_end_tms is NULL " +
					"and firt.end_tms is NULL";
		logger.info("S&P code query is " + sqlQuery);
		code = selectQueryInt(dbConnection, sqlQuery);
		logger.info("S&P code: " + code);
		if (code > codemaxsp) {
			codemaxsp = code;
		}

		sqlQuery =	"select coalesce(max(rtvl.rank_num),0) from ft_t_rtvl rtvl,ft_t_firt firt, ft_t_rtng rtng " +
					"where firt.inst_mnem='"+ instMnem + "' " +
					"and rtng.rtng_set_oid = rtvl.rtng_set_oid "+
					"and rtng.rtng_set_mnem = 'JCR' and rtvl.rtng_value_oid=firt.rtng_value_oid " +
					"and firt.sys_eff_end_tms is NULL " +
					"and firt.end_tms is NULL";
		logger.info("JCR code query is " + sqlQuery);
		code = selectQueryInt(dbConnection, sqlQuery);
		logger.info("JCR code: " + code);
		if (code > codemaxjcr) {
			codemaxjcr = code;
		}
		// To calculate policy code

		if (codemaxinternal > 0) {
			codemaxpolicy = codemaxinternal;
			vendor = "MHI";
		} else if (codemaxmoody > 0 && codemaxsp == 0) {
			codemaxpolicy = codemaxmoody;
			vendor = "MOODY";
		} else if (codemaxsp > 0 && codemaxmoody == 0) {
			codemaxpolicy = codemaxsp;
			vendor = "SAP";
		} else if (codemaxsp > 0 && codemaxmoody > 0) {
			if (codemaxsp > codemaxmoody) {
				codemaxpolicy = codemaxsp;
				vendor = "SAP";
			} else {
				codemaxpolicy = codemaxmoody;
				vendor = "MOODY";
			}
		} else if (codemaxsp == 0 && codemaxmoody == 0 && codemaxfitch > 0) {
			codemaxpolicy = codemaxfitch;
			vendor = "FITCH";
		} else if (codemaxsp == 0 && codemaxmoody == 0 && codemaxfitch == 0
				&& (codemaxjcr > 0)) {
			codemaxpolicy = codemaxjcr;
			vendor = "JCR";
		}

		/*
		 * EG-9788 Code removed from this rule of  'Internal Policy Code' Derivation. 
		 * This has been moved to separate rule - CJavaIssuerInternalPolicyDerived while this rule is responsible for Basel 2
		  
		// Derive the Derived party policy code
		
		logger.info("codemaxpolicy: " + codemaxpolicy);

		if (codemaxpolicy > 0)
		{
			sqlQuery = "select rtng_cde from ft_t_rtvl where rank_num="
					+ codemaxpolicy + " and RTNG_SET_OID in ('MIZRTNG3')";
			policy = selectQueryStringOne(dbConnection, sqlQuery);
			logger.info("policy: " + policy);

			sqlQuery = "select rtng_value_oid from ft_t_rtvl where rank_num="
					+ codemaxpolicy + " and RTNG_SET_OID in ('MIZRTNG3')";
			policyrtvl = selectQueryStringOne(dbConnection, sqlQuery);
			logger.info("policyrtvl: " + policyrtvl);

		}
		else 
		{
			policy="NR";
			sqlQuery = "select rtng_value_oid from ft_t_rtvl where rtng_set_oid = 'MIZRTNG3' and rtng_cde = 'NR'";
			policyrtvl = selectQueryStringOne(dbConnection, sqlQuery);
			logger.info("policyrtvl: " + policyrtvl);
			
		}
		
		sqlQuery =	"select rtng_cde from ft_t_firt firt " +
					"where firt.inst_mnem='"+ instMnem + "' " +
					"and firt.rtng_set_oid = 'MIZRTNG3' "+
					"and firt.sys_eff_end_tms is NULL " +
					"and firt.end_tms is NULL";

		String currPolicy = selectQueryStringOne(dbConnection, sqlQuery);
		logger.info("currPolicy: " + currPolicy);
		
		if (!currPolicy.equals(policy))
			addFinsRating(dbConnection, msg, instMnem, policy, "MIZRTNG3", policyrtvl, vendor);
		*/

		// Calculation of Basel 2 Issuer Ratings
		if (codemaxsp > 0 || codemaxmoody > 0 || codemaxfitch > 0) { //code change need whole block
			logger.info("codemaxfitch: "+codemaxfitch);
			logger.info("codemaxmoody: "+codemaxmoody);
			logger.info("codemaxsp: "+codemaxsp);
			if (0 != codemaxsp && 0 != codemaxmoody && 0 != codemaxfitch
					&& codemaxsp != codemaxmoody
					&& codemaxmoody != codemaxfitch
					&& codemaxfitch != codemaxsp) { // when all present all different 7
				logger.info("MDY, SP, and FITCH - all different");
				if (codemaxsp < codemaxmoody && codemaxfitch > codemaxmoody
						|| codemaxfitch < codemaxmoody
						&& codemaxsp > codemaxmoody) {
					vendor = "MOODY";
					codemaxbasel = codemaxmoody;//code change done
					sqlQuery =	"select rtng_cde from ft_t_rtvl rtvl, ft_t_rtng rtng " +
								"where rtng_set_mnem IN ('534', '538', '545') " +
								"and rtng.rtng_set_oid = rtvl.rtng_set_oid " +
								"and rank_num="+ codemaxbasel+" "+ "and exists(select 1 from ft_t_rtvl rtvl2 where rtvl.rtng_cde = rtvl2.rtng_cde and rtvl2.RTNG_SET_OID in ('MIZRTNG1','MIZRTNG2') and end_tms is null)";
								
					logger.info("MOODY Basel2 code query is " + sqlQuery);
					codemaxbaselcde = selectQueryStringOne(dbConnection,sqlQuery);
					logger.info("MOODY, codemaxbasel: "+codemaxbasel+", codemaxbaselcde: "+codemaxbaselcde);
				}
				if (codemaxfitch < codemaxsp && codemaxmoody > codemaxsp
						|| codemaxmoody < codemaxsp && codemaxfitch > codemaxsp) {
					codemaxbasel = codemaxsp;
					vendor = "SAP"; //code change done
					sqlQuery =	"select rtng_cde from ft_t_rtvl rtvl, ft_t_rtng rtng " +
								"where rtng_set_mnem IN ('126', '130') " +
								"and rtng.rtng_set_oid = rtvl.rtng_set_oid " +
								"and rank_num="+ codemaxbasel+" "+ "and exists(select 1 from ft_t_rtvl rtvl2 where rtvl.rtng_cde = rtvl2.rtng_cde and rtvl2.RTNG_SET_OID in ('MIZRTNG1','MIZRTNG2') and end_tms is null)";

					logger.info("SAP Basel2 code query is " + sqlQuery);
					codemaxbaselcde = selectQueryStringOne(dbConnection,sqlQuery);
					logger.info("SAP, codemaxbasel: "+codemaxbasel+", codemaxbaselcde: "+codemaxbaselcde);
				}
				if (codemaxmoody < codemaxfitch && codemaxsp > codemaxfitch
						|| codemaxsp < codemaxfitch
						&& codemaxmoody > codemaxfitch) {
					vendor = "FITCH";
					codemaxbasel = codemaxfitch;//code change done
					sqlQuery =	"select rtng_cde from ft_t_rtvl rtvl, ft_t_rtng rtng " +
								"where rtng_set_mnem in ('LTISRDRF','LTNIFSRT','INSFSTRT','LTLCRISR') " +
								"and rtng.rtng_set_oid = rtvl.rtng_set_oid " +
								"and rank_num="+ codemaxbasel+" "+ "and exists(select 1 from ft_t_rtvl rtvl2 where rtvl.rtng_cde = rtvl2.rtng_cde and rtvl2.RTNG_SET_OID in ('MIZRTNG1','MIZRTNG2') and end_tms is null)";

					logger.info("FITCH Basel2 code query is " + sqlQuery);
					codemaxbaselcde = selectQueryStringOne(dbConnection,sqlQuery);
					logger.info("FITCH, codemaxbasel: "+codemaxbasel+", codemaxbaselcde: "+codemaxbaselcde);
				}
			} else if (0 != codemaxsp && 0 != codemaxmoody && 0 == codemaxfitch
					&& codemaxsp != codemaxmoody) { // when snp and moody all different 4
				logger.info("No FITCH");
				if (codemaxsp < codemaxmoody) {
					vendor = "MOODY";
					codemaxbasel = codemaxmoody;//code change done
					sqlQuery =	"select rtng_cde from ft_t_rtvl rtvl, ft_t_rtng rtng " +
								"where rtng_set_mnem IN ('534', '538', '545') " +
								"and rtng.rtng_set_oid = rtvl.rtng_set_oid " +
								"and rank_num="+ codemaxbasel+" "+ "and exists(select 1 from ft_t_rtvl rtvl2 where rtvl.rtng_cde = rtvl2.rtng_cde and rtvl2.RTNG_SET_OID in ('MIZRTNG1','MIZRTNG2') and end_tms is null)";

					logger.info("MOODY Basel2 code query is " + sqlQuery);
					codemaxbaselcde = selectQueryStringOne(dbConnection, sqlQuery);
					logger.info("MOODY, codemaxbasel: "+codemaxbasel+", codemaxbaselcde: "+codemaxbaselcde);
				} else {
					vendor = "SAP";
					codemaxbasel = codemaxsp;//code change done
					sqlQuery =	"select rtng_cde from ft_t_rtvl rtvl, ft_t_rtng rtng " +
								"where rtng_set_mnem IN ('126', '130') " +
								"and rtng.rtng_set_oid = rtvl.rtng_set_oid " +
								"and rank_num="+ codemaxbasel+" "+ "and exists(select 1 from ft_t_rtvl rtvl2 where rtvl.rtng_cde = rtvl2.rtng_cde and rtvl2.RTNG_SET_OID in ('MIZRTNG1','MIZRTNG2') and end_tms is null)";

					logger.info("SAP Basel2 code query is " + sqlQuery);
					codemaxbaselcde = selectQueryStringOne(dbConnection,sqlQuery);
					logger.info("SAP, codemaxbasel: "+codemaxbasel+", codemaxbaselcde: "+codemaxbaselcde);
				}

			} else if (0 != codemaxsp && 0 == codemaxmoody && 0 != codemaxfitch
					&& codemaxsp != codemaxfitch) { // when snp and fitch all diffrent 6
				logger.info("No MOODY");
				if (codemaxsp < codemaxfitch) {
					vendor = "FITCH";
					codemaxbasel = codemaxfitch; //code change done
					sqlQuery =	"select rtng_cde from ft_t_rtvl rtvl, ft_t_rtng rtng " +
								"where rtng_set_mnem in ('LTISRDRF','LTNIFSRT','INSFSTRT','LTLCRISR') " +
								"and rtng.rtng_set_oid = rtvl.rtng_set_oid " +
								"and rank_num="+ codemaxbasel+" "+ "and exists(select 1 from ft_t_rtvl rtvl2 where rtvl.rtng_cde = rtvl2.rtng_cde and rtvl2.RTNG_SET_OID in ('MIZRTNG1','MIZRTNG2') and end_tms is null)";

					logger.info("FITCH Basel2 code query is " + sqlQuery);
					codemaxbaselcde = selectQueryStringOne(dbConnection,sqlQuery);
					logger.info("FITCH, codemaxbasel: "+codemaxbasel+", codemaxbaselcde: "+codemaxbaselcde);
				} else {
					vendor = "SAP";
					codemaxbasel = codemaxsp;//code change done
					sqlQuery =	"select rtng_cde from ft_t_rtvl rtvl, ft_t_rtng rtng " +
								"where rtng_set_mnem IN ('126', '130') " +
								"and rtng.rtng_set_oid = rtvl.rtng_set_oid " +
								"and rank_num="+ codemaxbasel+" "+ "and exists(select 1 from ft_t_rtvl rtvl2 where rtvl.rtng_cde = rtvl2.rtng_cde and rtvl2.RTNG_SET_OID in ('MIZRTNG1','MIZRTNG2') and end_tms is null)";

					logger.info("SAP Basel2 code query is " + sqlQuery);
					codemaxbaselcde = selectQueryStringOne(dbConnection,sqlQuery);
					logger.info("SAP, codemaxbasel: "+codemaxbasel+", codemaxbaselcde: "+codemaxbaselcde);
				}

			} else if (0 == codemaxsp && 0 != codemaxmoody && 0 != codemaxfitch
					&& codemaxmoody != codemaxfitch) { // when moody and fitch all diffrent 5
				logger.info("No SAP");
				if (codemaxmoody < codemaxfitch) {
					vendor = "FITCH";
					codemaxbasel = codemaxfitch; //code change done
					sqlQuery =	"select rtng_cde from ft_t_rtvl rtvl, ft_t_rtng rtng " +
								"where rtng_set_mnem in ('LTISRDRF','LTNIFSRT','INSFSTRT','LTLCRISR') " +
								"and rtng.rtng_set_oid = rtvl.rtng_set_oid " +
								"and rank_num="+ codemaxbasel+" "+ "and exists(select 1 from ft_t_rtvl rtvl2 where rtvl.rtng_cde = rtvl2.rtng_cde and rtvl2.RTNG_SET_OID in ('MIZRTNG1','MIZRTNG2') and end_tms is null)";

					logger.info("FITCH Basel2 code query is " + sqlQuery);
					codemaxbaselcde = selectQueryStringOne(dbConnection,sqlQuery);
					logger.info("FITCH, codemaxbasel: "+codemaxbasel+", codemaxbaselcde: "+codemaxbaselcde);
				} else {
					vendor = "MOODY";
					codemaxbasel = codemaxmoody; //code change done
					sqlQuery =	"select rtng_cde from ft_t_rtvl rtvl, ft_t_rtng rtng " +
								"where rtng_set_mnem IN ('534', '538', '545') " +
								"and rtng.rtng_set_oid = rtvl.rtng_set_oid " +
								"and rank_num="+ codemaxbasel+" "+ "and exists(select 1 from ft_t_rtvl rtvl2 where rtvl.rtng_cde = rtvl2.rtng_cde and rtvl2.RTNG_SET_OID in ('MIZRTNG1','MIZRTNG2') and end_tms is null)";

					logger.info("MOODY Basel2 code query is " + sqlQuery);
					codemaxbaselcde = selectQueryStringOne(dbConnection,sqlQuery);
					logger.info("MOODY, codemaxbasel: "+codemaxbasel+", codemaxbaselcde: "+codemaxbaselcde);
				}

			} else if ((0 != codemaxsp && 0 == codemaxmoody && 0 == codemaxfitch) // when snp only
					|| (0 != codemaxsp && 0 != codemaxmoody && 0 == codemaxfitch && codemaxsp == codemaxmoody) // when snp & moody all same 8
					|| (0 != codemaxsp && 0 == codemaxmoody && 0 != codemaxfitch && codemaxsp == codemaxfitch) // when snp and fitch all same 10
					|| (0 != codemaxsp && 0 != codemaxmoody && 0 != codemaxfitch && codemaxsp == codemaxmoody && codemaxsp == codemaxfitch)// when all present all same 14
					|| (0 != codemaxsp && 0 != codemaxmoody && 0 != codemaxfitch && codemaxsp != codemaxmoody && codemaxsp == codemaxfitch) // when all present snp and fitch same 13
					|| (0 != codemaxsp && 0 != codemaxmoody && 0 != codemaxfitch && codemaxsp == codemaxmoody && codemaxsp != codemaxfitch)) { // when all present snp and moody same 11
				vendor = "SAP";
				codemaxbasel = codemaxsp; //code change done
				sqlQuery =	"select rtng_cde from ft_t_rtvl rtvl, ft_t_rtng rtng " +
							"where rtng_set_mnem IN ('126', '130') " +
							"and rtng.rtng_set_oid = rtvl.rtng_set_oid " +
							"and rank_num="+ codemaxbasel+" "+ "and exists(select 1 from ft_t_rtvl rtvl2 where rtvl.rtng_cde = rtvl2.rtng_cde and rtvl2.RTNG_SET_OID in ('MIZRTNG1','MIZRTNG2') and end_tms is null)";

				logger.info("SAP Basel2 code query is " + sqlQuery);
				codemaxbaselcde = selectQueryStringOne(dbConnection, sqlQuery);
				logger.info("SAP, codemaxbasel: "+codemaxbasel+", codemaxbaselcde: "+codemaxbaselcde);
			} else if ((0 == codemaxsp && 0 != codemaxmoody && 0 == codemaxfitch) // when moody only 2
					|| (0 != codemaxsp && 0 != codemaxmoody && 0 != codemaxfitch && codemaxsp != codemaxmoody && codemaxmoody == codemaxfitch) // when all available moody and fitch are same 12
					|| (0 == codemaxsp && 0 != codemaxfitch && 0 != codemaxmoody && codemaxfitch == codemaxmoody)) { // when moody and fitch all same 9
				vendor = "MOODY";
				codemaxbasel = codemaxmoody; //code change done
				sqlQuery =	"select rtng_cde from ft_t_rtvl rtvl, ft_t_rtng rtng " +
							"where rtng_set_mnem IN ('534', '538', '545') " +
							"and rtng.rtng_set_oid = rtvl.rtng_set_oid " +
							"and rank_num="+ codemaxbasel+" "+ "and exists(select 1 from ft_t_rtvl rtvl2 where rtvl.rtng_cde = rtvl2.rtng_cde and rtvl2.RTNG_SET_OID in ('MIZRTNG1','MIZRTNG2') and end_tms is null)";
				logger.info("MOODY Basel2 code query is " + sqlQuery);
				codemaxbaselcde = selectQueryStringOne(dbConnection, sqlQuery);
				logger.info("MOODY, codemaxbasel: "+codemaxbasel+", codemaxbaselcde: "+codemaxbaselcde);
			} else { // when fitch only 3
				vendor = "FITCH";
				codemaxbasel = codemaxfitch; //code change done
				sqlQuery =	"select rtng_cde from ft_t_rtvl rtvl, ft_t_rtng rtng " +
							"where rtng_set_mnem in ('LTISRDRF','LTNIFSRT','INSFSTRT','LTLCRISR') " +
							"and rtng.rtng_set_oid = rtvl.rtng_set_oid " +
							"and rank_num="+ codemaxbasel+" "+ "and exists(select 1 from ft_t_rtvl rtvl2 where rtvl.rtng_cde = rtvl2.rtng_cde and rtvl2.RTNG_SET_OID in ('MIZRTNG1','MIZRTNG2') and end_tms is null)";
				logger.info("FITCH Basel2 code query is " + sqlQuery);
				codemaxbaselcde = selectQueryStringOne(dbConnection, sqlQuery);
				logger.info("FITCH, codemaxbasel: "+codemaxbasel+", codemaxbaselcde: "+codemaxbaselcde);
			}
		} else if (codemaxjcr > 0) 
		{
			vendor = "JCR";
			codemaxbasel = codemaxjcr; //code change done
			sqlQuery =	"select rtng_cde from ft_t_rtvl rtvl, ft_t_rtng rtng " +
						"where rtng_set_mnem = 'JCR' " +
						"and rtng.rtng_set_oid = rtvl.rtng_set_oid " +
						"and rank_num="+ codemaxbasel+" "+ "and exists(select 1 from ft_t_rtvl rtvl2 where rtvl.rtng_cde = rtvl2.rtng_cde and rtvl2.RTNG_SET_OID in ('MIZRTNG1','MIZRTNG2') and end_tms is null)";
			logger.info("JCR Basel2 code query is " + sqlQuery);
			codemaxbaselcde = selectQueryStringOne(dbConnection, sqlQuery);
			logger.info("JCR, codemaxbasel: "+codemaxbasel+", codemaxbaselcde: "+codemaxbaselcde);
		}

		// Derive the Basel 2 Issuer Ratings code.
		logger.info("FINAL - codemaxbasel: "+codemaxbasel+", codemaxbaselcde: "+codemaxbaselcde);

		if (codemaxbasel > 0) {
			sqlQuery = "select rtng_cde from ft_T_rtvl where rank_num="
					+ codemaxbasel + " and RTNG_SET_OID in ('MIZRTNG2')";
			basel = selectQueryStringOne(dbConnection, sqlQuery);
			sqlQuery = "select rtng_value_oid from ft_T_rtvl where rank_num="
					+ codemaxbasel + " and RTNG_SET_OID in ('MIZRTNG2')";
			baselrtvl = selectQueryStringOne(dbConnection, sqlQuery);

			logger.info("MIZRTNG1 query is " + sqlQuery);
			sqlQuery = "select rtng_value_oid from ft_T_rtvl where rtng_cde='"
					+ codemaxbaselcde
					+ "' and RTNG_SET_OID in ('MIZRTNG1')";
			baselstdrtvl = selectQueryStringOne(dbConnection, sqlQuery);
			
			sqlQuery =	"select rtng_cde from ft_t_firt firt " +
						"where firt.inst_mnem='"+ instMnem + "' " +
						"and firt.rtng_set_oid = 'MIZRTNG2' "+
						"and firt.sys_eff_end_tms is NULL " +
						"and firt.end_tms is NULL";

			logger.info("MIZRTNG2 query is " + sqlQuery);
			String currBasel2 = selectQueryStringOne(dbConnection, sqlQuery);
			logger.info("currBasel2: " + currBasel2);
			

			if (!currBasel2.equals(basel)) {
				addFinsRating(dbConnection, msg, instMnem, basel, "MIZRTNG2", baselrtvl, vendor);
					
				//Begin Cat 1 processing checks
				CJavaMHIFRTBCategoryCheck frtbProcess = new CJavaMHIFRTBCategoryCheck();
				msg = frtbProcess.processFRTB(basel,dbConnection,instMnem,msg);
					
				 if(logger.isDebugEnabled())
                  logger.debug("xml: " + msg.getXMLString());
				
			}

			sqlQuery =	"select rtng_cde from ft_t_firt firt " +
						"where firt.inst_mnem='"+ instMnem + "' " +
						"and firt.rtng_set_oid = 'MIZRTNG1' "+
						"and firt.sys_eff_end_tms is NULL " +
						"and firt.end_tms is NULL";

			logger.info("MIZRTNG1 query is " + sqlQuery);
			String currBasel2Std = selectQueryStringOne(dbConnection, sqlQuery);
			logger.info("currBasel2Std: " + currBasel2Std);

			if (!currBasel2Std.equals(codemaxbaselcde))
				addFinsRating(dbConnection, msg, instMnem, codemaxbaselcde, "MIZRTNG1", baselstdrtvl, vendor);

		}else{
			// Create NR
			logger.info("***NR Section - Started***");
			sqlQuery =	"select rtng_cde from ft_t_firt firt " +
						"where firt.inst_mnem='"+ instMnem + "' " +
						"and firt.rtng_set_oid = 'MIZRTNG1' "+
						"and firt.sys_eff_end_tms is NULL " +
						"and firt.end_tms is NULL";

			logger.info("MIZRTNG1 query is " + sqlQuery);
			String currBasel2 = selectQueryStringOne(dbConnection, sqlQuery);
			logger.info("currBasel2: " + currBasel2);

			if (!currBasel2.equals("NR"))
				createNRRatings(dbConnection, msg, instMnem);
			
			CJavaMHIFRTBCategoryCheck frtbProcess = new CJavaMHIFRTBCategoryCheck();
			msg = frtbProcess.processFRTB("NR",dbConnection,instMnem,msg);
			
			logger.info("***NR Section - Ended***");
			//logger.info("msg: " + msg.getXMLString());
		}
		

		return true;
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
			logger
					.error("SQL query failed, message = '" + e.getMessage()
							+ "'");
			logger.info(e);
		}
		return retValue;
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
			logger.error("SQL query failed, message = '" + e.getMessage()+ "'");
			logger.info(e);
		}
		return retValue;
	}
	List<String> selectQueryList(DatabaseAccess dbConnection, String query){
		List<String> retValue = new ArrayList<String>();
		try {
			dbConnection.setSQL(query);
			dbConnection.execute();
			while (!dbConnection.isEndOfStream()) {
				retValue.add(dbConnection.getNextString().trim());
			}
			dbConnection.close();
		} catch (Exception e) {
			logger.error("SQL query failed, message = '"+ e.getMessage() + "'");
			logger.info(e);
		}		
		return retValue;
	}
	
	void addFinsRating(DatabaseAccess dbConnection, XMLMessage msg, String instMnem, String rtngCode, String rtngSetOid, String rtngvalueOid, String vendor){

		//EG-8502 - Remove existing rating row before attempting to add a new rating. This is to prevent duplicate ratings appearing
		String RemoveExistingRating = "DELETE FROM FT_T_FIRT WHERE INST_MNEM = '" + instMnem + "' AND RTNG_SET_OID = '" + rtngSetOid + "'";
		logger.info ("Delete existing rating. SQL is " + RemoveExistingRating);
		try {
			dbConnection.setSQL(RemoveExistingRating);
			dbConnection.execute();
			dbConnection.close();
		} catch (Exception e) {
			logger.error("SQL query failed, message = '"+ e.getMessage() + "'");
			logger.info(e);
		}
		logger.info("Add rating " + rtngCode + " with RTNG_SET_OID = '" + rtngSetOid + "'");
		
		SegmentId finsSegmentId = msg.addSegment(XMLMessage.A_REFERENCE,"FinancialInstitution");
		msg.addField("INST_MNEM", finsSegmentId, instMnem);
		
		SegmentId newSegmentId = msg.addSegment(XMLMessage.A_D_UNKNOWN, "FinancialInstitutionRating");
		msg.setSegmentAttribute(newSegmentId, "MATCH", "FIRT_MATCH_5");
		//msg.setSegmentAttribute(newSegmentId, "TSATTRIBUTE", "RTNG_VALUE_OID");
		//msg.setSegmentAttribute(newSegmentId, "TSOPTION", "Y");
		msg.addField("INST_MNEM", newSegmentId, instMnem);
		msg.addField("RTNG_CDE", newSegmentId, rtngCode);
		msg.addField("RTNG_SYMBOL_TXT", newSegmentId, rtngCode);
		msg.addField("RTNG_SET_OID", newSegmentId, rtngSetOid);
		msg.addField("RTNG_VALUE_OID", newSegmentId, rtngvalueOid);
		msg.addField("DATA_STAT_TYP", newSegmentId, "ACTIVE");
		
		//Date today = new Date();
		Calendar cal = Calendar.getInstance();
		//cal.setTime(today);
		cal.set(Calendar.HOUR_OF_DAY, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);
		cal.set(Calendar.MILLISECOND, 0);
		Date today = cal.getTime();
		
		msg.addField("START_TMS", newSegmentId, today);
		msg.setFieldAttribute("START_TMS", newSegmentId, "INSERT_ONLY", "Y");
		
		msg.addField("RTNG_EFF_TMS", newSegmentId, today);
		msg.setFieldAttribute("RTNG_EFF_TMS", newSegmentId, "INSERT_ONLY", "Y");
		
		if(!"".equalsIgnoreCase(vendor)){
			msg.addField("DATA_SRC_ID", newSegmentId, vendor);
		}
	}
	
	void createNRRatings(DatabaseAccess dbConnection, XMLMessage msg, String instMnem){
		
		String sqlQuery = "select rtng_value_oid from ft_t_rtvl where rtng_set_oid = 'MIZRTNG1' and rtng_cde = 'NR'";
		String baseldrvl = selectQueryStringOne(dbConnection, sqlQuery);
		sqlQuery = "select rtng_value_oid from ft_t_rtvl where rtng_set_oid = 'MIZRTNG2' and rtng_cde = 'NR'";
		String baselstdrvl = selectQueryStringOne(dbConnection, sqlQuery);

		addFinsRating(dbConnection, msg, instMnem, "NR", "MIZRTNG1", baseldrvl, "MHI");
		addFinsRating(dbConnection, msg, instMnem, "NR", "MIZRTNG2", baselstdrvl, "MHI");	
	}
	
	  
	  
	  
}