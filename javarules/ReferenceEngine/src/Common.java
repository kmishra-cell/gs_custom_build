

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.log4j.Logger;
import com.thegoldensource.jbre.DatabaseAccess;
import com.thegoldensource.jbre.SegmentId;
import com.thegoldensource.jbre.XMLMessage;

public final class Common {
	
	private final static Logger commonLogger = Logger.getLogger(Common.class);
	
	public static boolean checkIrgpExists(DatabaseAccess db, String prtPurpTyp, String instrIssrId, Logger logger)
	{
		String sql = 	"SELECT count(*) FROM ft_t_irgp " +
						"WHERE instr_issr_id = '" + instrIssrId + "' " +
						"AND COALESCE(end_tms, SYSDATE() + INTERVAL '1 day') > SYSDATE()" +
						"AND prt_purp_typ  = '" + prtPurpTyp +"'";
		
		db.setSQL(sql);
		db.execute();
		
		if (db.getNextInt() > 0)
		{
			if(logger.isInfoEnabled())
				logger.info("Issuer is a member of " + prtPurpTyp + " group");
			
			return true;
		}
		
		if(logger.isInfoEnabled())
			logger.info("Issuer is not a member of " + prtPurpTyp + " group");
		
		return false;
	}

	public static boolean checkMhiIrgpExists(DatabaseAccess db, String prtPurpTyp, String instrIssrId, Logger logger)
	{
		String sql = 	"SELECT count(*) FROM ft_t_irgp " +
						"WHERE instr_issr_id = '" + instrIssrId + "' " +
						"AND COALESCE(end_tms, SYSDATE() + INTERVAL '1 day') > SYSDATE()" +
						"AND prnt_issr_grp_oid = 'IRGR000006' " +
						"AND prt_purp_typ  = '" + prtPurpTyp +"'";
		
		db.setSQL(sql);
		db.execute();
		
		if (db.getNextInt() > 0)
		{
			if(logger.isInfoEnabled())
				logger.info("Issuer is a member of MHI " + prtPurpTyp + " group");
			
			return true;
		}
		
		if(logger.isInfoEnabled())
			logger.info("Issuer is not a member of MHI " + prtPurpTyp + " group");
		
		return false;
	}
	
	public static boolean checkIrgpExists(DatabaseAccess db, String prtPurpTyp, String instrIssrId)
	{
		return checkIrgpExists(db, prtPurpTyp, instrIssrId, commonLogger);
	}
	
	public static boolean checkMhiIrgpExists(DatabaseAccess db, String prtPurpTyp, String instrIssrId)
	{
		return checkMhiIrgpExists(db, prtPurpTyp, instrIssrId, commonLogger);
	}
	
	public static boolean checkIridExists(DatabaseAccess db, String issrIdCtxtTyp, String instrIssrId, Logger logger)
	{
		String sql = 	"SELECT count(*) FROM ft_t_irid " +
						"WHERE issr_id_ctxt_typ = '" + issrIdCtxtTyp + "' " +
						"AND instr_issr_id = '" + instrIssrId + "' " +
						"AND COALESCE(end_tms, SYSDATE() + INTERVAL '1 day') > SYSDATE()";
		
		db.setSQL(sql);
		db.execute();
		
		if (db.getNextInt() > 0)
		{
			if(logger.isInfoEnabled())
				logger.info(issrIdCtxtTyp + " already exists");
			
			return true;
		}
		
		if(logger.isInfoEnabled())
			logger.info(issrIdCtxtTyp + " not yet created");
		
		return false;
	}
	
	public static boolean checkIridExists(DatabaseAccess db, String issrIdCtxtTyp, String instrIssrId)
	{
		return checkIridExists(db, issrIdCtxtTyp, instrIssrId, commonLogger);
	}
	
	public static boolean checkIsgpExists(DatabaseAccess db, String prtPurpTyp, String instrId, Logger logger)
	{
		String sql = 	"SELECT count(*) FROM ft_t_isgp " +
						"WHERE instr_id = '" + instrId + "' " +
						"AND COALESCE(end_tms, SYSDATE() + INTERVAL '1 day') > SYSDATE()" +
						"AND prt_purp_typ = '" + prtPurpTyp +"'";
		
		db.setSQL(sql);
		db.execute();
		
		if (db.getNextInt() > 0)
		{
			if(logger.isInfoEnabled())
				logger.info("Issue is a member of " + prtPurpTyp + " group");
			return true;
		}
		
		if(logger.isInfoEnabled())
			logger.info("Issue is not a member of " + prtPurpTyp + " group");
		return false;
	}
	
	public static boolean checkIsgpExists(DatabaseAccess db, String prtPurpTyp, String instrId)
	{
		return checkIsgpExists(db, prtPurpTyp, instrId, commonLogger);
	}
	
	public static boolean checkIsidExists(DatabaseAccess db, String idCtxtTyp, String instrId, String mktOid, String trdCurr, String mktIssOid, Logger logger)
	{
		String sql = 	"SELECT count(*) FROM ft_t_isid i " +
						"WHERE id_ctxt_typ = '" + idCtxtTyp + "' " +
						"AND instr_id = '" + instrId + "' " +
						"AND COALESCE(end_tms, SYSDATE() + INTERVAL '1 day') > SYSDATE()";
		
		if (mktOid != null && !"".equals(mktOid))
			sql = sql + " AND mkt_oid = '" + mktOid + "'";
		
		if (trdCurr != null && !"".equals(trdCurr))
			sql = sql + " AND trdng_curr_cde = '" + trdCurr + "'";
		
		if (mktIssOid != null && !"".equals(mktIssOid))
			sql = sql +	" AND EXISTS ( SELECT 1 FROM ft_t_mixr m " +
						"WHERE i.isid_oid = m.isid_oid " +
						"AND m.end_tms IS NULL " +
						"AND m.mkt_iss_oid = '" + mktIssOid + "')";
		
		if(logger.isInfoEnabled())
			logger.info("sql: " + sql);
		
		db.setSQL(sql);
		db.execute();
		
		if (db.getNextInt() > 0)
		{
			if(logger.isInfoEnabled())
			{
				String str = idCtxtTyp + " already exists";
				if (mktOid != null && !"".equals(mktOid))
					str = str + " for mkt_oid  " + mktOid;
				if (trdCurr != null && !"".equals(trdCurr))
					str = str + " for trdng_curr_cde  " + trdCurr;
				logger.info(str);
			}
			return true;
		}
		
		if(logger.isInfoEnabled())
		{
			String str = idCtxtTyp + " not yet created";
			if (mktOid != null && !"".equals(mktOid))
				str = str + " for mkt_oid  " + mktOid;
			if (trdCurr != null && !"".equals(trdCurr))
				str = str + " for trdng_curr_cde  " + trdCurr;
			logger.info(str);
		}

		return false;
	}
	
	public static boolean checkIsidExists(DatabaseAccess db, String idCtxtTyp, String instrId, String mktOid, String trdCurr)
	{
		return checkIsidExists(db, idCtxtTyp, instrId, mktOid, trdCurr, null, commonLogger);
	}
	
	public static boolean checkIsidExists(DatabaseAccess db, String idCtxtTyp, String instrId, String mktOid)
	{
		return checkIsidExists(db, idCtxtTyp, instrId, mktOid, null, null, commonLogger);
	}
	
	public static boolean checkIsidExists(DatabaseAccess db, String idCtxtTyp, String instrId, Logger logger)
	{
		return checkIsidExists(db, idCtxtTyp, instrId, null, null, null, logger);
	}
	
	public static boolean checkIsidExists(DatabaseAccess db, String idCtxtTyp, String instrId)
	{
		return checkIsidExists(db, idCtxtTyp, instrId, null, null, null, commonLogger);
	}
	
	public static boolean checkIsidExists(DatabaseAccess db, String idCtxtTyp, String instrId, String mktOid, String trdCurr, Logger logger)
	{
		return checkIsidExists(db, idCtxtTyp, instrId, mktOid, trdCurr, null, logger);
	}
	
	public static String getIsid(DatabaseAccess db, String idCtxtTyp, String instrId, String mktOid, Logger logger)
	{
		String sql = 	"SELECT iss_id FROM ft_t_isid " +
						"WHERE id_ctxt_typ = '" + idCtxtTyp + "' " +
						"AND instr_id = '" + instrId + "' " +
						"AND COALESCE(end_tms, SYSDATE() + INTERVAL '1 day') > SYSDATE()";
		
		String sql2=sql;
		
		if (mktOid != null && !"".equals(mktOid))
			sql2 = sql2 + " AND mkt_oid = '" + mktOid + "'";
		
		db.setSQL(sql2);
		db.execute();
		
		String issId;
		
		if(db.isEndOfStream());
		{
			db.setSQL(sql);
			db.execute();			
		}
		
		while (!db.isEndOfStream())
		{
			issId = db.getNextString();
			if(logger.isInfoEnabled())
				logger.info(idCtxtTyp + ": " + issId);
			return issId;
		}
		
		if(logger.isInfoEnabled())
		{
			String str = "No " + idCtxtTyp + " found";
			if (mktOid != null && !"".equals(mktOid))
				str = str + " for mkt_oid  " + mktOid;
			logger.info(str);
		}

		return null;
		
	}
	
	public static String getIsid(DatabaseAccess db, String idCtxtTyp, String instrId, String mktOid)
	{
		return getIsid(db, idCtxtTyp, instrId, mktOid, commonLogger);
	}
	
	public static String getIsid(DatabaseAccess db, String idCtxtTyp, String instrId, Logger logger)
	{
		return getIsid(db, idCtxtTyp, instrId, null, logger);
	}
	
	public static String getIsid(DatabaseAccess db, String idCtxtTyp, String instrId)
	{
		return getIsid(db, idCtxtTyp, instrId, null, commonLogger);
	}
	
	public static boolean isMergeMessage(XMLMessage xml, Logger logger)
	{
		String userId = xml.getStringField("LAST_CHG_USR_ID", new SegmentId(0));
		if(logger.isInfoEnabled())
			logger.info("userId: " + userId);
		
		if ("MERGE".equals(userId))
		{
			logger.info("This is a MERGE message");
			return true;
		}
		
		return false;
	}
	
	public static boolean isMergeMessage(XMLMessage xml)
	{
		return isMergeMessage(xml, commonLogger);
	}

	public static String increment(String str)
	{
		StringBuffer temp = new StringBuffer(str);
		int index = temp.length() - 1 ;

		boolean contInc = true;
		while(contInc)
		{
			if(index < 0)
			{
				temp.insert(0, 'A');
				contInc = false;
			}
			else
			{
				char lastChar = temp.charAt(index);
				if(lastChar == 'Z')
				{
					lastChar = 'A';
					temp.deleteCharAt(index);
					temp.insert(index, lastChar);
					contInc = true;
					index--;
				}
				else
				{
					lastChar++;
					temp.deleteCharAt(index);
					temp.insert(index, lastChar);
					contInc = false;
				}
			}
		}
		return temp.toString();
	}
	
	public static boolean  lockedRecord(DatabaseAccess db, String indusClSetId, String instMnem)
	{
		String sql =	"select count(*) from ft_t_ovrc " +
						"where  OVR_REF_OID = '"+ instMnem+ "' " +
						"and end_tms is null " +
						"and OVR_TBL_KEY_TXT in (select 'FINS_CLSF_OID='||fins_clsf_oid||';' " +
						"from ft_t_ficl " +
						"where indus_cl_set_id = '"+ indusClSetId+ "' " +
						"and inst_mnem = '"+ instMnem+ "' " +
						"and end_tms is null)";
		db.setSQL(sql);
		db.execute();
		
		int cnt = db.getNextInt();
		
		if (cnt > 0){
			return true;
		} else
			return false;
		
	}
	
	public static List<SegmentId> getSegmentIds(String segType, XMLMessage msg) {
        List<SegmentId> segIdList = new ArrayList<SegmentId>();
        for (int i=0; i<msg.getSegmentCount(); i++) {
                        SegmentId segId = new SegmentId(i);                                   
                        if (msg.getSegmentType(segId).equals(segType)) {
                                        segIdList.add(segId);
                        }
        }                              
        return segIdList;               
	}
	
	public static SegmentId getSegmentId(String segType, XMLMessage msg) {
       
        for (int i=0; i<msg.getSegmentCount(); i++) {
                        SegmentId segId = new SegmentId(i);                                   
                        if (msg.getSegmentType(segId).equals(segType)) {
                                        return segId;
                        }
        }                              
        return null;              
	}
	
	public static ArrayList<String> selectQueryList(DatabaseAccess dbConnection, String query){
		ArrayList<String> retValue = new ArrayList<String>();
		try {
			dbConnection.setSQL(query);
			dbConnection.execute();
			while (!dbConnection.isEndOfStream()) {
				retValue.add(dbConnection.getNextString().trim());
			}
			dbConnection.close();
		} catch (Exception e) {
			
			System.err.println("Caught exception: " + e.getMessage());
		}
		return retValue;
	}
	
	public static String selectQueryString(DatabaseAccess dbConnection, String query){
		String retValue = "";
		try {
			dbConnection.setSQL(query);
			dbConnection.execute();
			while (!dbConnection.isEndOfStream()) {
				retValue = (dbConnection.getNextString().trim());
			}
			dbConnection.close();
		} catch (Exception e) {
			System.err.println("Caught exception: " + e.getMessage());
		}
		return retValue;
	}
	
}
