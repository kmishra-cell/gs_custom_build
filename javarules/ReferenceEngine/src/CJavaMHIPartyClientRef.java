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


public class CJavaMHIPartyClientRef implements JavaRule
{
	private final static Logger logger = Logger.getLogger(CJavaMHIPartyClientRef.class);
	String prtPurpTyps;

	public boolean initialize(String[] params)
	{
		if(params.length > 0)
			prtPurpTyps = params[0];
		return true;
	}

	public boolean process(XMLMessage xml, DatabaseObjectContainer dbObj, ProcessorContext pCon, DatabaseAccess dbConn, NotificationCreator notfcn) throws GSException
	{
		if(logger.isInfoEnabled())
			logger.info("CJavaMHIPartyClientRef.process()");

		String segmentName = pCon.getCurrentSegmentType();
		logger.info("segmentName: " + segmentName);
		SegmentId firstSeg = new SegmentId(0);
		String instrIssrId = null;
   
    if(logger.isDebugEnabled())
       logger.debug("xml: " + xml.getXMLString());


		if("Final".equalsIgnoreCase(segmentName))
		{
			String mainIssueType  = xml.getStringField("MAIN_ENTITY_TBL_TYP", firstSeg);

			if (mainIssueType == null || !mainIssueType.equals("ISSR"))
			{
				logger.info("Not an Issuer. Exiting");
				return true;
			}

			instrIssrId = xml.getStringField("INSTR_ISSR_ID", firstSeg);

			if (instrIssrId == null || instrIssrId.equals(""))
			{
				logger.info("INSTR_ISSR_ID is NULL. Exiting");
				return true;
			}

			if(logger.isInfoEnabled())
				logger.info("INSTR_ISSR_ID = " + instrIssrId);

			if (prtPurpTyps != null && !prtPurpTyps.equals(""))
			{
				//Check in IOI Group(s)
				String[] issrGrpArray = prtPurpTyps.split(",");
				boolean irgpMember = false;

				for(int i=0; i < issrGrpArray.length; i++)
				{
					irgpMember = Common.checkIrgpExists(dbConn, issrGrpArray[i], instrIssrId, logger);
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
		} else if("ISSRIssuerGroupParticipant".equalsIgnoreCase(segmentName))
		{
			String prtPurpTyp = xml.getStringField("PRT_PURP_TYP", pCon.getCurrentSegmentId());
			logger.info("prtPurpTyp: " + prtPurpTyp);

			if (prtPurpTyp == null || "".equals(prtPurpTyp))
			{
				String irgpOid = xml.getStringField("IRGP_OID", pCon.getCurrentSegmentId());
				logger.info("irgpOid: " + irgpOid);
				if (irgpOid == null || "".equals(irgpOid))
				{
					logger.info("Invalid IRGP row. Exiting");
					return true;
				}
				String sql = 	"SELECT trim(prt_purp_typ) from FT_T_IRGP " +
								"WHERE irgp_oid = '" + irgpOid + "'" +
								"AND COALESCE(end_tms, SYSDATE() + INTERVAL '1 day') > SYSDATE()";

				dbConn.setSQL(sql);
				dbConn.execute();

				if(!dbConn.isEndOfStream())
				{
					prtPurpTyp=dbConn.getNextString();
					logger.info("d/b - prtPurpTyp: " + prtPurpTyp);
				} else
				{
					logger.info("prtPurpTyp not found. Must be end dated so exiting rule");
					return true;
				}
			}

			if (prtPurpTyps != null && !prtPurpTyps.equals(""))
			{
				//Check in IOI Group(s)
				String[] issrGrpArray = prtPurpTyps.split(",");
				boolean irgpMember = false;

				for(int i=0; i < issrGrpArray.length; i++)
				{
					if (prtPurpTyp.equals(issrGrpArray[i]))
					{
						irgpMember = true;
						break;
					}

				}

				if (irgpMember == false)
				{
					if(logger.isInfoEnabled())
						logger.info("Not in any of the groups. Exiting");

					return true;
				}
			}

			instrIssrId = xml.getStringField("INSTR_ISSR_ID", pCon.getCurrentSegmentId());

			if(logger.isInfoEnabled())
				logger.info("INSTR_ISSR_ID = " + instrIssrId);

		} else
			return true;

		//Check if Identifier already exists
		if (Common.checkIridExists(dbConn, "CLIENTREF", instrIssrId, logger))
		{
			logger.info("Identifier already exists. Exiting");
			return true;
		}

		String issrNme = "";
		String sql = 	"SELECT issr_nme " +
						"FROM ft_t_issr WHERE instr_issr_id='" + instrIssrId +"'";

		dbConn.setSQL(sql);
		dbConn.execute();

		if(!dbConn.isEndOfStream())
			issrNme = dbConn.getNextString();

		int cnt;

		String issrId = generateClientRef(dbConn, issrNme);
		String newCliRef = issrId;
		String suffix = "A";

		do
		{

			if(logger.isInfoEnabled())
				logger.info("newCliRef: " + newCliRef);

			sql = 	"SELECT count(*) FROM ft_t_fiid " +
					"WHERE fins_id_ctxt_typ = 'SECOREFE' " +
					"AND fins_id  = '" + newCliRef + "' " +
					"UNION ALL " +
					"SELECT count(*) FROM ft_t_cuid " +
					"WHERE cst_id_ctxt_typ = 'STRATREF' " +
					"AND customer_id = '" + newCliRef + "' " +
					"UNION ALL " +
					"SELECT count(*) FROM ft_t_acid " +
					"WHERE acct_id_ctxt_typ = 'STRAREFE' " +
					"AND acct_alt_id = '" + newCliRef + "'" +
					"UNION ALL " +
					"SELECT count(*) FROM ft_t_irid " +
					"WHERE issr_id_ctxt_typ = 'CLIENTREF' " +
					"AND issr_id = '" + newCliRef + "'";

			dbConn.setSQL(sql);
			dbConn.execute();

			cnt = dbConn.getNextInt();

			if (logger.isInfoEnabled())
				logger.info("FIID Identifier count is: " + cnt);

			cnt = cnt + dbConn.getNextInt();

			if (logger.isInfoEnabled())
				logger.info("FIID + CUID Identifier count is: " + cnt);

			cnt = cnt + dbConn.getNextInt();

			if (logger.isInfoEnabled())
				logger.info("FIID + CUID + ACID Identifier count is: " + cnt);

			cnt = cnt + dbConn.getNextInt();

			if (logger.isInfoEnabled())
				logger.info("All Identifiers final count is: " + cnt);

			if (cnt > 0)
			{
				newCliRef = issrId + suffix;
				suffix = Common.increment(suffix);
			}

		} while ( cnt > 0 );

		createIridSegment(xml, newCliRef, "CLIENTREF", instrIssrId);

	  if(logger.isDebugEnabled())
       logger.debug("xml: " + xml.getXMLString());

		return true;
	}

	private void createIridSegment(XMLMessage xml, String issrId, String issrIdCtxtTyp, String instrIssrId)
	{

		SegmentId issrSegmentId = xml.addSegment(XMLMessage.A_REFERENCE,"Issuer");
		xml.addField("INSTR_ISSR_ID", issrSegmentId, instrIssrId);
		
		SegmentId newSeg = xml.addSegment( XMLMessage.A_INSERT,"IssuerIdentifier");
		xml.addField("ISSR_ID", newSeg, issrId);
		xml.addField("ISSR_ID_CTXT_TYP", newSeg, issrIdCtxtTyp);
		xml.addField("INSTR_ISSR_ID", newSeg, instrIssrId);
		xml.addField("DATA_STAT_TYP", newSeg, "ACTIVE");

		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.HOUR_OF_DAY, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);
		cal.set(Calendar.MILLISECOND, 0);
		Date today = cal.getTime();

		xml.addField("START_TMS", newSeg, today);
		xml.setFieldAttribute("START_TMS", newSeg, "INSERT_ONLY", "Y");

		if(logger.isInfoEnabled())
			logger.info(issrIdCtxtTyp + " Segment added");
	}

	public static String generateClientRef(DatabaseAccess db, String party) throws GSException
	{
		String clientRef = null;

		try
		{
			if(party != null)
			{
				// Upper case
				clientRef = party.toUpperCase();
				// Remove Spaces
				clientRef = clientRef.replaceAll("\\s", "");
				// Substitute values
				clientRef = substituteClientRefAbbreviations(db, clientRef);
				// Remove Everything Except [A-Z0-9]
				clientRef = filterStringForAlphaNumerics(clientRef);
				// Remove vowels - except from first position.
				clientRef = removeVowels(clientRef);
				//  Finally truncate to 8 chars.
				int len = clientRef.length();
				clientRef = clientRef.substring(0, (len > 8) ? 8: len);
			}
		}
		catch(Exception ex)
		{
			logger.error("Error occured while trying to generate client ref for party name = "+party);
			throw new GSException();
		}
		return clientRef;
	}

	private static String substituteClientRefAbbreviations(DatabaseAccess db, String fullString)
	{
		String substitutedString = fullString;

		String sqlAbbr = 	"SELECT INTRNL_DMN_VAL_TXT, INTRNL_DMN_VAL_NME FROM FT_T_IDMV " +
							"WHERE FLD_DATA_CL_ID='CLIREFAB' ORDER BY 1";

		db.setSQL(sqlAbbr);
		db.execute();

		while (!db.isEndOfStream())
		{
			String findStr = db.getNextString().toUpperCase().replaceAll("\\s", "");
			String replaceStr = db.getNextString();

			if (findStr != null && replaceStr != null)
				substitutedString = substitutedString.replaceAll(findStr, replaceStr);
		}

		return substitutedString;
	}

	private static String filterStringForAlphaNumerics(String fullString)
	{
		StringBuffer alphaNum = new StringBuffer();
		if(fullString != null && fullString.length() > 0)
		{
			char[] str = fullString.toCharArray();
			int len = str.length;

			for(int oldIndex = 0; oldIndex < len; oldIndex++)
			{
				char test = str[oldIndex];
				if((test >= 'A' && test <= 'Z') || (test >= '0' && test <= '9'))
				{
					alphaNum.append(test);
				}
			}
		}
		return alphaNum.toString();
	}

	private static String removeVowels(String fullString)
	{
		StringBuffer noVowel = new StringBuffer();
		if(fullString != null && fullString.length() > 0)
		{
			char[] str = fullString.toCharArray();
			int len = str.length;

			for(int oldIndex = 0; oldIndex < len; oldIndex++)
			{
				if(oldIndex < 5)
				{
					noVowel.append(str[oldIndex]);
				}
				else
				{
					char test = str[oldIndex];
					if(!(test == 'A' || test == 'E' || test == 'I' || test == 'O' || test == 'U'))
					{
						noVowel.append(test);
					}
				}
			}
		}
		return noVowel.toString();
	}
}
