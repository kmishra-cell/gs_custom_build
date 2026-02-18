import org.apache.log4j.Logger;

import com.thegoldensource.jbre.DatabaseAccess;
import com.thegoldensource.jbre.DatabaseObjectContainer;
import com.thegoldensource.jbre.GSException;
import com.thegoldensource.jbre.JavaRule;
import com.thegoldensource.jbre.NotificationCreator;
import com.thegoldensource.jbre.ProcessorContext;
import com.thegoldensource.jbre.SegmentId;
import com.thegoldensource.jbre.XMLMessage;


public class CJavaMHIIssuerUPAddToIOI implements JavaRule {

	private static Logger logger = Logger.getLogger("CJavaMHIIssuerUPAddToIOI ");
	private String prtPurpTyps;

	public boolean initialize(String[] params) {

		logger.info("Initializing CJavaMHIIssuerUPAddToIOI  Rule");
		prtPurpTyps = params[0];
		return true;
	}

	public boolean process(XMLMessage msg, DatabaseObjectContainer dboc,
			ProcessorContext pContext, DatabaseAccess dbConn, NotificationCreator notfcn)
	throws GSException {

		if(logger.isDebugEnabled())
       logger.debug("xml: " + msg.getXMLString());

		String mainEntityTblTyp = msg.getStringField("MAIN_ENTITY_TBL_TYP", new SegmentId(0));
		if(null == mainEntityTblTyp || !"ISSR".equalsIgnoreCase(mainEntityTblTyp)){
			logger.debug("Message is not for Issuer. Hence Exiting");
			if(logger.isDebugEnabled())
               logger.debug("xml: " + msg.getXMLString());
			return true;
		}

		String prtPurpTyp = msg.getStringField("PRT_PURP_TYP", pContext.getCurrentSegmentId());
		logger.info("prtPurpTyp: " + prtPurpTyp);

		if (prtPurpTyp == null || "".equals(prtPurpTyp))
		{
			String irgpOid = msg.getStringField("IRGP_OID", pContext.getCurrentSegmentId());
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
				//irgpMember = Common.checkIrgpExists(dbConnection, issrGrpArray[i], instrIssrId, logger);
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

		String instrIssrId = msg.getStringField("INSTR_ISSR_ID", pContext.getCurrentSegmentId());
		logger.info("instrIssrId: " + instrIssrId);

		String sql =	"SELECT instr_issr_id FROM ft_t_issr " +
						"WHERE fins_inst_mnem IN " +
						"(SELECT (select mhi_fins_up(fins_inst_mnem)) FROM FT_T_ISSR " +
						"WHERE instr_issr_id = '" + instrIssrId + "' " +
						"AND (select mhi_fins_up(fins_inst_mnem))!= fins_inst_mnem " +
						"AND end_tms IS NULL) " +
						"AND end_tms IS NULL";

		logger.info("sql: " + sql);

		dbConn.setSQL(sql);
		dbConn.execute();
		String issrUP = null;


		if (!dbConn.isEndOfStream())
			issrUP = dbConn.getNextString();

		if (issrUP == null || "".equals(issrUP))
		{
			logger.info("No ultimate parent found for Issuer. Exiting Function.");
			return true;
		}

		/* EG-9826 - CJavaMHIIssuerUPAddToIOI Java Rule changes to incorporate ORG_ID and SUBDIV_ID changes.
		 * Commenting below section as reference segment is not required. Directly available Parent Issuer Group OID shall be used for 
		 * 
		//EG-8387 Ultima new IOI MHSS IOI
		//Query FT_T_ISGR.GRP_NME with PRNT_ISSR_GRP_OID in the message, instead of "MHI Inventory" 

		logger.info("prntIssrGrpOid: " + prntIssrGrpOid);
		
		String irgrsql =	"SELECT grp_nme FROM ft_t_irgr " +
							"WHERE end_tms IS NULL and issr_grp_oid = '" + prntIssrGrpOid + "'";
		
		logger.info("irgrsql: " + irgrsql);
		
		dbConn.setSQL(irgrsql);
		dbConn.execute();
		String GrpNme = null;
		
		if (!dbConn.isEndOfStream())
			GrpNme = dbConn.getNextString();

		if (GrpNme == null || "".equals(GrpNme))
		{
			logger.info("No grp_mme found for IssuerGroup. Exiting Function.");
			return true;
		}	
		
		logger.info("GrpNme: " + GrpNme);
		
		SegmentId irgrSeg = msg.addSegment(XMLMessage.A_REFERENCE, "IssuerGroup", irgpSeg);
		msg.setSegmentAttribute(irgrSeg, "COPY_FROM", "ISSR_GRP_OID");
		msg.setSegmentAttribute(irgrSeg, "COPY_TO", "PRNT_ISSR_GRP_OID");
		msg.addField("GRP_NME", irgrSeg, GrpNme );
		
		 */
		
		String prntIssrGrpOid = msg.getStringField("PRNT_ISSR_GRP_OID", pContext.getCurrentSegmentId());
		
		// Change for GRP_NME 		
		SegmentId issrSeg = msg.addSegment(XMLMessage.A_REFERENCE, "Issuer");
		msg.addField("INSTR_ISSR_ID", issrSeg, issrUP);
 
		SegmentId irgpSeg = msg.addSegment(XMLMessage.A_UNKNOWN, "ISSRIssuerGroupParticipant");
		msg.addField("PRT_PURP_TYP", irgpSeg, "INTEREST");
		msg.addField("PRNT_ISSR_GRP_OID", irgpSeg, prntIssrGrpOid);

		SegmentId issrSegmentId = msg.addSegment(XMLMessage.A_REFERENCE,"Issuer");
		msg.addField("INSTR_ISSR_ID", issrSegmentId, instrIssrId);

         if(logger.isDebugEnabled())
             logger.debug("xml: " + msg.getXMLString());

		return true;

	}
}
