import org.apache.log4j.Logger;

import com.thegoldensource.jbre.DatabaseAccess;
import com.thegoldensource.jbre.DatabaseObjectContainer;
import com.thegoldensource.jbre.GSException;
import com.thegoldensource.jbre.JavaRule;
import com.thegoldensource.jbre.NotificationCreator;
import com.thegoldensource.jbre.ProcessorContext;
import com.thegoldensource.jbre.SegmentId;
import com.thegoldensource.jbre.XMLMessage;


public class CJavaMHIStratusUnique implements JavaRule {

	private static Logger logger = Logger.getLogger("CJavaMHIStratusUnique");

	public boolean initialize(String[] parameters) {
	    {
	        logger.info("Initializing CJavaMHIStratusUnique Rule");

	        return true;
	    }
	}


	public boolean process(XMLMessage msg, DatabaseObjectContainer dboc,
			ProcessorContext pContext, DatabaseAccess dbConn, NotificationCreator notfcn)
			throws GSException {
  logger.info("Inside CJavaMHIStratusUnique process method.");

		String msgClassification = msg.getStringField("MSG_CLASSIFICATION", new SegmentId(0));
		if("WEBMSG".equalsIgnoreCase(msgClassification)){

			SegmentId currSegmentId = pContext.getCurrentSegmentId();
			String currSegTyp = pContext.getCurrentSegmentType();
			String idStratus;
			String acidOid;
			String cuidOid;
			String fiidOid;
			String iridOid;
			String sql;
			String entity;

			if ("AccountAlternateIdentifier".equals(currSegTyp))
			{
				String acctCtxt = msg.getStringField("ACCT_ID_CTXT_TYP", currSegmentId);
				idStratus = msg.getStringField("ACCT_ALT_ID", currSegmentId);

				if (acctCtxt == null || acctCtxt.equals("") || idStratus == null || idStratus.equals(""))
				{
					acidOid = msg.getStringField("ACID_OID", currSegmentId);
					sql = 	"SELECT acct_alt_id,acct_id_ctxt_typ FROM ft_t_acid " +
							"WHERE COALESCE(end_tms, SYSDATE() + INTERVAL '1 day') > SYSDATE()" +
							"AND acid_oid='" + acidOid + "'";
					dbConn.setSQL(sql);
					dbConn.execute();

					idStratus = dbConn.getNextString();
					acctCtxt = dbConn.getNextString();
				}

				if (acctCtxt == null || !acctCtxt.equals("STRAREFE"))
				{
					logger.info("Not a Stratus Ref. Exiting");
					return true;
				}

				entity = "Trading Account";

			} else if ("CustomerIdentifier".equals(currSegTyp))
			{
				String custCtxt = msg.getStringField("CST_ID_CTXT_TYP", currSegmentId);
				idStratus = msg.getStringField("CUSTOMER_ID", currSegmentId);

				if (custCtxt == null || custCtxt.equals("") || idStratus == null || idStratus.equals(""))
				{
					cuidOid = msg.getStringField("CUID_OID", currSegmentId);
					sql = 	"SELECT customer_id,cst_id_ctxt_typ FROM ft_t_cuid " +
							"WHERE COALESCE(end_tms, SYSDATE() + INTERVAL '1 day') > SYSDATE()" +
							"AND cuid_oid='" + cuidOid + "'";
					dbConn.setSQL(sql);
					dbConn.execute();

					idStratus = dbConn.getNextString();
					custCtxt = dbConn.getNextString();
				}

				if (custCtxt == null || !custCtxt.equals("STRATREF"))
				{
					if (logger.isInfoEnabled())
						logger.info("Not a Stratus Ref. Exiting");
						return true;
				}

				entity = "Customer";

			} else if ("FinancialInstitutionIdentifier".equals(currSegTyp))
			{
				String finsCtxt = msg.getStringField("FINS_ID_CTXT_TYP", currSegmentId);
				idStratus = msg.getStringField("FINS_ID", currSegmentId);

				if (finsCtxt == null || finsCtxt.equals("") || idStratus == null || idStratus.equals(""))
				{
					fiidOid = msg.getStringField("FIID_OID", currSegmentId);
					sql = 	"SELECT fins_id,fins_id_ctxt_typ FROM ft_t_fiid " +
							"WHERE COALESCE(end_tms, SYSDATE() + INTERVAL '1 day') > SYSDATE()" +
							"AND fiid_oid='" + fiidOid + "'";
					dbConn.setSQL(sql);
					dbConn.execute();

					idStratus = dbConn.getNextString();
					finsCtxt = dbConn.getNextString();
				}

				if (finsCtxt == null || !finsCtxt.equals("SECOREFE"))
				{
					if (logger.isInfoEnabled())
						logger.info("Not a Stratus Ref. Exiting");
						return true;
				}

				entity = "Financial Institution";

			} else if ("IssuerIdentifier".equals(currSegTyp))
			{
				String issrCtxt = msg.getStringField("ISSR_ID_CTXT_TYP", currSegmentId);
				idStratus = msg.getStringField("ISSR_ID", currSegmentId);

				if (issrCtxt == null || issrCtxt.equals("") || idStratus == null || idStratus.equals(""))
				{
					iridOid = msg.getStringField("IRID_OID", currSegmentId);
					sql = 	"SELECT issr_id,issr_id_ctxt_typ FROM ft_t_irid " +
							"WHERE COALESCE(end_tms, SYSDATE() + INTERVAL '1 day') > SYSDATE()" +
							"AND irid_oid='" + iridOid + "'";
					dbConn.setSQL(sql);
					dbConn.execute();

					idStratus = dbConn.getNextString();
					issrCtxt = dbConn.getNextString();
				}

				if (issrCtxt == null || !issrCtxt.equals("CLIENTREF"))
				{
					if (logger.isInfoEnabled())
						logger.info("Not a Client Ref. Exiting");
						return true;
				}

				entity = "Issuer";

			} else
			{
				logger.error("Not a Issuer, Customer, Account or FINS Identifier segment. Exiting");
				return true;
			}

			sql = 	"SELECT count(*) FROM ft_t_fiid " +
					"WHERE fins_id_ctxt_typ = 'SECOREFE' " +
					"AND fins_id  = '" + idStratus + "' " +
					"UNION ALL " +
					"SELECT count(*) FROM ft_t_cuid " +
					"WHERE cst_id_ctxt_typ = 'STRATREF' " +
					"AND customer_id = '" + idStratus + "' " +
					"UNION ALL " +
					"SELECT count(*) FROM ft_t_acid " +
					"WHERE acct_id_ctxt_typ = 'STRAREFE' " +
					"AND acct_alt_id = '" + idStratus + "'" +
					"UNION ALL " +
					"SELECT count(*) FROM ft_t_irid " +
					"WHERE issr_id_ctxt_typ = 'CLIENTREF' " +
					"AND issr_id = '" + idStratus + "'";

			dbConn.setSQL(sql);
			dbConn.execute();

			Integer stratCnt = dbConn.getNextInt();

			if (logger.isInfoEnabled())
				logger.info("FIID Identifier count is: " + stratCnt);

			stratCnt = stratCnt + dbConn.getNextInt();

			if (logger.isInfoEnabled())
				logger.info("FIID + CUID Identifier count is: " + stratCnt);

			stratCnt = stratCnt + dbConn.getNextInt();

			if (logger.isInfoEnabled())
				logger.info("FIID + CUID + ACID Identifier count is: " + stratCnt);

			stratCnt = stratCnt + dbConn.getNextInt();

			if (logger.isInfoEnabled())
				logger.info("All Identifiers final count is: " + stratCnt);

			if (stratCnt > 1)
			{
				logger.error("Stratus Reference " + idStratus + " in use. Please change the Stratus Reference on the " + entity);
				String[] param = {"StratRef","Entity"};
				String[] paramVal = {idStratus,entity};
				notfcn.raiseException("STRDATA","RULEPRC", 50007, param, paramVal);
			}

			return true;
		}
		logger.info("Not a UI message. Hence Exiting");
		return true;


	}

}
