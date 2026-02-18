import org.apache.log4j.Logger;

import com.thegoldensource.jbre.DatabaseAccess;
import com.thegoldensource.jbre.DatabaseObjectContainer;
import com.thegoldensource.jbre.GSException;
import com.thegoldensource.jbre.JavaRule;
import com.thegoldensource.jbre.NotificationCreator;
import com.thegoldensource.jbre.ProcessorContext;
import com.thegoldensource.jbre.SegmentId;
import com.thegoldensource.jbre.XMLMessage;


public class CJavaMHICustomerAddToSOI implements JavaRule {

	private static Logger logger = Logger.getLogger("CJavaMHICustomerAddToSOI");

	public boolean initialize(String[] params) {

		logger.info("Initializing CJavaMHICustomerAddToSOI Rule");
        return true;
	}

	public boolean process(XMLMessage msg, DatabaseObjectContainer dboc,
			ProcessorContext pContext, DatabaseAccess dbConn, NotificationCreator notfcn)
			throws GSException {
		String trn_id = pContext.getScopedTransaction().getTransactionID();
		String cstId = msg.getStringField("CST_ID",pContext.getCurrentSegmentId());
		logger.info("cstId: " + cstId);
		String instMnem = msg.getStringField("INST_MNEM",pContext.getCurrentSegmentId());
		logger.info("instMnem: " + instMnem);
		String instrIssrId = null;
		logger.info("Beginning CJavaMHICustomerAddToSOI");
		// EG-6984 start
		
		 if(logger.isDebugEnabled())
       logger.debug("xml: " + msg.getXMLString());
		
		if (cstId == null || "".equals(cstId)) {
			logger.info("cstId not found, check for Customer segment with CstID");
			for (int i = 0; i < msg.getSegmentCount(); i++) {
				SegmentId segId = new SegmentId(i);
				String segType = msg.getSegmentType(segId);
				logger.info("Checking segment: " + segType);
				if ("Customer".equals(segType)) {
					cstId = msg.getStringField("CST_ID", segId);
					if (logger.isInfoEnabled())
						logger.info("cstId: " + cstId);
					//if (cstId == null || "".equals(cstId))
					break;
				}

			}
		}
		// EG-6984 end
		// EG-7067 start - This rule was originally called for CUST segments only. Now it is also a final
		// sgement rule. If the customer Id cannot be found, then the rule should exit with no updates
		if (cstId == null || "".equals(cstId)) {
			logger.info("cstId not found, so exiting");
			return true;
		}
		// EG-7067 end
		if (instMnem == null || "".equals(instMnem))
		{
			String sql = 	"select c.inst_mnem, i.instr_issr_id " +
							"from ft_t_cust c,ft_t_issr i " +
							"where c.inst_mnem = i.fins_inst_mnem " +
							"and c.cst_id ='"+cstId+"' " +
							"and i.end_tms is null";

			dbConn.setSQL(sql);
			dbConn.execute();

			if (!dbConn.isEndOfStream())
			{
				instMnem = dbConn.getNextString();
				logger.info("d/b - instMnem: " + instMnem);
				instrIssrId = dbConn.getNextString();
				logger.info("d/b - instrIssrId: " + instrIssrId);
			}
		} else
		{

			String sql = 	"SELECT instr_issr_id FROM ft_t_issr " +
							"WHERE fins_inst_mnem='"+instMnem+"' " +
							"AND COALESCE(end_tms, SYSDATE() + INTERVAL '1 day') > SYSDATE()";

			dbConn.setSQL(sql);
			dbConn.execute();


			if (!dbConn.isEndOfStream())
			{
				instrIssrId = dbConn.getNextString();
				logger.info("d/b - instrIssrId: " + instrIssrId);
			}
		}
		if (instrIssrId == null || "".equals(instrIssrId))
		{
			logger.info("No Issuer linked to the Institution. Exit rule.");
			return true;
		}

		addIrgp(msg, instrIssrId, "CUSTOMER");
		logger.info("calling checkAddPublishIrgp for CUSTOMER ISSR");
		checkAddPublishIrgp(dbConn, instrIssrId, trn_id); //EG-5917

		//Ultimate Parent
		String sql = 	"SELECT instr_issr_id FROM ft_t_issr " +
						"WHERE fins_inst_mnem= (select mhi_fins_up('"+instMnem+"')) " +
						"AND COALESCE(end_tms, SYSDATE() + INTERVAL '1 day') > SYSDATE()";

		dbConn.setSQL(sql);
		dbConn.execute();
		String upInstrIssrId = null;

		if (!dbConn.isEndOfStream())
			upInstrIssrId = dbConn.getNextString();

		if (upInstrIssrId == null || "".equals(upInstrIssrId) || instrIssrId.equals(upInstrIssrId))
		{
			logger.info("No Ultimate Parent to add");
		} else
		{

			addIrgp(msg, upInstrIssrId, "CUSTOMER UP");
			logger.info("calling checkAddPublishIrgp for CUSTOMER UP");
			checkAddPublishIrgp(dbConn, upInstrIssrId, trn_id); //EG-5917
		}


		//Immediate Parent
		sql = 	"SELECT instr_issr_id FROM ft_t_issr " +
				"WHERE end_tms IS NULL " +
				"AND fins_inst_mnem IN (select prnt_inst_mnem from ft_t_ffrl " +
				"WHERE rel_typ = 'PARNTCOF' AND end_tms IS NULL AND inst_mnem IN ('"+instMnem+"'))";

		dbConn.setSQL(sql);
		dbConn.execute();
		String ipInstrIssrId = null;

		if (!dbConn.isEndOfStream())
			ipInstrIssrId = dbConn.getNextString();

		if (ipInstrIssrId == null || "".equals(ipInstrIssrId))
		{
			logger.info("No Immediate Parent to add");
		} else
		{
			addIrgp(msg, ipInstrIssrId, "CUSTOMER IP");
			logger.info("calling checkAddPublishIrgp for CUSTOMER IP");
			checkAddPublishIrgp(dbConn,ipInstrIssrId, trn_id); //EG-5917
		}

		SegmentId custSegmentId = msg.addSegment(XMLMessage.A_REFERENCE,"Customer");
		msg.addField("CST_ID", custSegmentId, cstId);
		
		
		 if(logger.isDebugEnabled())
             logger.debug("xml: " + msg.getXMLString());

		return true;

	}

	public void addIrgp(XMLMessage msg, String instrIssrId, String prtDesc){

		SegmentId issrSeg = msg.addSegment(XMLMessage.A_REFERENCE, "Issuer");
		msg.addField("INSTR_ISSR_ID", issrSeg, instrIssrId);

		SegmentId irgpSeg = msg.addSegment(XMLMessage.A_UNKNOWN, "ISSRIssuerGroupParticipant");
		SegmentId irgrSeg = msg.addSegment(XMLMessage.A_REFERENCE, "IssuerGroup", irgpSeg);
		msg.setSegmentAttribute(irgrSeg, "COPY_FROM", "ISSR_GRP_OID");
		msg.setSegmentAttribute(irgrSeg, "COPY_TO", "PRNT_ISSR_GRP_OID");
		msg.addField("GRP_NME", irgrSeg, "MHI Inventory");
		msg.addField("INSTR_ISSR_ID", irgpSeg, instrIssrId);
		msg.addField("PRT_PURP_TYP", irgpSeg, "INTEREST");
		msg.addField("PRT_DESC", irgpSeg, prtDesc);
		msg.setFieldAttribute("PRT_DESC", irgpSeg, "INSERT_ONLY", "Y");
	}
	// EG-5917
	// This method will determine if an issuer is already in the IOI by looking for an active
	// row in IRGP for this instr_issr_id.
	// If found, there is no need to publish an existing IOI member.
	// if not found, find the fins_inst_mnem for the issuer and add a row to UP_CHILDREN.
	// The MizPublishForUP workflow will take care of the publishing
	public void checkAddPublishIrgp(DatabaseAccess dbConn, String issrId, String trn_id)
	{
		// Check if issuer is already in IOI
		String sql = "select issr.FINS_INST_MNEM from FT_T_ISSR issr " +
				"inner join FT_T_IRGP irgp on irgp.INSTR_ISSR_ID = issr.INSTR_ISSR_ID and irgp.END_TMS is null and irgp.PRT_PURP_TYP = 'INTEREST' " +
				"where issr.INSTR_ISSR_ID = '" + issrId + "'";
		dbConn.setSQL(sql);
		dbConn.execute();
		String instMnem = null;
		if (!dbConn.isEndOfStream())
		{
			instMnem = dbConn.getNextString();
			if (instMnem == null || "".equals(instMnem))
			{
				logger.info("d/b found fins_inst_mnem="+instMnem);
			} else
			{
				logger.info("d/b fins_inst_mnem not found");
			}
		}
		if (instMnem == null || "".equals(instMnem))
		{
			logger.info("INSTR_ISSR_ID = " + issrId);
			logger.info("No IRGP record on db, so this will require publishing");
			// find Inst mnemonic for issuer before adding to UP_CHILDREN for publishing
			sql = "select issr.FINS_INST_MNEM from FT_T_ISSR issr where issr.INSTR_ISSR_ID = '" + issrId + "'";
			dbConn.setSQL(sql);
			dbConn.execute();
			if (!dbConn.isEndOfStream())
				instMnem = dbConn.getNextString();
			if (instMnem != null && !("".equals(instMnem)))
			{
				// Now generate SQL to publish issuer
				sql = "INSERT INTO up_children SELECT new_oid,'"+trn_id+"', null, SYSDATE,'"+instMnem+"','"+issrId+"','ISSR'"+
				" FROM dual WHERE NOT EXISTS (SELECT * FROM UP_CHILDREN WHERE prnt_inst_mnem = '"+instMnem+"' AND cross_ref_id='"+issrId+"')";
				dbConn.setSQL(sql);
				logger.info("Execute SQL:\n" + sql);
				try
				{
					dbConn.execute();
				}
				catch (Exception e1)
				{
					e1.printStackTrace();
					logger.info("Failed dbconn.execute process:" + issrId);
				}
			} else
			{
				// cannot find inst_mnem, so cannot publish
				logger.error("Unable to find ins_mnem for issuer instr_issr_id = " + instMnem);
				logger.error("Please investigate");
			}
		} else
		{
			logger.info("INSTR_ISSR_ID = " + issrId);
			logger.info("IRGP record found on db, so this will NOT require publishing");
		}
	}
}
