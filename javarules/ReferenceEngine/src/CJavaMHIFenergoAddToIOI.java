import java.util.HashMap;
import java.util.Map;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.ArrayList;
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

public class CJavaMHIFenergoAddToIOI implements JavaRule {
// For Fenergo legalEntity message
// Triggered at Final segment
// Based on FINS.INST_MNEM populate ISSUR - IRGP segment for ISSUR, immediate parent ISSUER and ultimate parent ISSUER

	private static Logger logger = Logger.getLogger("CJavaMHIFenergoAddToIOI");
	private static Map<String,String> userIdMap=new HashMap<String, String>();
	private static Map<String,String> FiIdMap=new HashMap<String, String>();

	public boolean initialize(String[] params) {

		logger.info("Initializing CJavaMHIFenergoAddToIOI Rule");

//		Parameters will now look like this:
//		userIdMap.put("FENERGO", "IRGR000006");
//		userIdMap.put("STATICMASTER","IRGR000016");
		
// A new parameter has been addecd to map FINS_ID_CTXT_TYP to IRGP
// This allows User entered Fins IDs to trigger adding issuers		
		String userIdDetails = params[0];
		String[] maps = userIdDetails.split(";");
		for(String map : maps)
		{
			String[] pair = map.split(":");
			userIdMap.put(pair[0], pair[1]);
		}		
		logger.info("userIdMap "+userIdMap);

		String FiiDDetails = params[1];
		String[] FiidMaps = FiiDDetails.split(";");
		for(String map : FiidMaps)
		{
			String[] pair = map.split(":");
			FiIdMap.put(pair[0], pair[1]);
		}		
		logger.info("FiIdMap "+FiIdMap);

		return true;
	}

	public boolean process(XMLMessage msg, DatabaseObjectContainer dboc,
			ProcessorContext pContext, DatabaseAccess dbConn, NotificationCreator notfcn)
			throws GSException {
		logger.info("Beginning CJavaMHIFenergoAddToIOI");
		
	 if(logger.isDebugEnabled())
       logger.debug("xml: " + msg.getXMLString());
	
		String trn_id = pContext.getScopedTransaction().getTransactionID();

//SegmentId(1) = FinancialInstitution must have INST_MNEM  		
		String instMnem = msg.getStringField("INST_MNEM", new SegmentId(1));
		logger.info("instMnem: " + instMnem);
		if (instMnem == null || "".equals(instMnem)) {
			logger.info("instMnem not found, so exiting");
			return true;
		}		
		
//If HEADER.LAST_CHG_USR_ID != FENERGO, exit

		String msgClassification = msg.getStringField("MSG_CLASSIFICATION", new SegmentId(0));
		String inventory = "";
		if("WEBMSG".equalsIgnoreCase(msgClassification)) {
			// For user generated FIID, regular USERID checks will not work.
			// Need to look for FINS_ID_CTXT_TYP and map this to the inventory OID
			String FiidType = "";
			List<SegmentId> segmentIDFIID = new ArrayList<SegmentId>();
			
			segmentIDFIID = getSegmentIds("FinancialInstitutionIdentifier", msg);
			
			for(SegmentId msgSegId : segmentIDFIID) {
				if (logger.isInfoEnabled())
				{
						try {
							FiidType = msg.getStringField("FINS_ID_CTXT_TYP", msgSegId);
							if(!(FiidType == null || "".equals(FiidType)))
								break;
						} catch (Exception e) {
							// error encountered getting FINS_ID_CTXT_TYP so not a problem
							logger.info("Unable to find FINS_ID_CTXT_TYP in segment, message = '"+ e.getMessage() + "'");
							logger.info(e);
						}
				}
			}
			if(FiidType != null || !("".equals(FiidType))) {
				inventory = FiIdMap.get(FiidType);
				if(inventory == null || "".equals(inventory)) {
					logger.info("unable to map FINS_ID_CTXT_TYP to inventory, exiting rule");
					return true;
				}					
			}
			else {
				logger.info("unable to find FINS_ID_CTXT_TYP in message, exiting rule");
					return true;
			}
			
		}
		else {
			String userId = msg.getStringField("LAST_CHG_USR_ID", new SegmentId(0));
			if(null == userId || !userIdMap.keySet().contains(userId)){
				logger.info("userId: " + userId + ". Exiting");
				return true;
			}
			inventory=userIdMap.get(userId);
		}
		if (inventory == null || "".equals(inventory)) {
			logger.info("unable to determine inventory from message. Exiting");
			return true;
		}
		else
			logger.info("inventory is " + inventory);


		//If HEADER.MSG_CLASSIFICATION = INACTIVE, exit
		//The field is ACTIVE when customerStatus in legalEntity message is ACTIVE		
		//		String msgClassification = msg.getStringField("MSG_CLASSIFICATION", new SegmentId(0));
		if(null == msgClassification || "INACTIVE".equalsIgnoreCase(msgClassification)){
			logger.info("msgClassification: " + msgClassification + ". Exiting");
			return true;
		}
		
		logger.info("Proceed to get ISSUER");
//get ISSUER
		String instrIssrId = null;
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

		if (instrIssrId == null || "".equals(instrIssrId))
		{
			logger.info("No Issuer linked to the Institution. Exit rule.");
			return true;
		}
		
		if (!activeIrgp (dbConn, instrIssrId, inventory)) 
		{
			logger.info("d/b active IRGP not found. calling addIrgp for CUSTOMER ISSR");
			addIrgp(msg, instrIssrId, "CUSTOMER",inventory);
		}
		
		logger.info("calling checkAddPublishIrgp for CUSTOMER ISSR");
		checkAddPublishIrgp(dbConn, instrIssrId, trn_id,inventory); //EG-5917

		//Ultimate Parent
		String upsql = 	"SELECT instr_issr_id FROM ft_t_issr " +
						"WHERE fins_inst_mnem = (select mhi_fins_up('"+instMnem+"')) " +
						"AND COALESCE(end_tms, SYSDATE() + INTERVAL '1 day') > SYSDATE()";

		dbConn.setSQL(upsql);
		dbConn.execute();
		String upInstrIssrId = null;

		if (!dbConn.isEndOfStream())
			upInstrIssrId = dbConn.getNextString();

		if (upInstrIssrId == null || "".equals(upInstrIssrId) || instrIssrId.equals(upInstrIssrId))
		{
			logger.info("No Ultimate Parent to add");
		} else
		{
			if (!activeIrgp (dbConn, upInstrIssrId, inventory)) 
			{
				logger.info("d/b active IRGP not found. calling addIrgp for CUSTOMER UP");
				addIrgp(msg, upInstrIssrId, "CUSTOMER UP",inventory);
			}

			logger.info("calling checkAddPublishIrgp for CUSTOMER UP");
			checkAddPublishIrgp(dbConn, upInstrIssrId, trn_id, inventory); 
		}


		//Immediate Parent
		String ipsql = 	"SELECT instr_issr_id FROM ft_t_issr " +
				"WHERE end_tms IS NULL " +
				"AND fins_inst_mnem IN (select prnt_inst_mnem from ft_t_ffrl " +
				"WHERE rel_typ = 'PARNTCOF' AND end_tms IS NULL AND inst_mnem IN ('"+instMnem+"'))";

		dbConn.setSQL(ipsql);
		dbConn.execute();
		String ipInstrIssrId = null;

		if (!dbConn.isEndOfStream())
			ipInstrIssrId = dbConn.getNextString();

		if (ipInstrIssrId == null || "".equals(ipInstrIssrId))
		{
			logger.info("No Immediate Parent to add");
		} else
		{
		
			if (!activeIrgp (dbConn, ipInstrIssrId, inventory)) 
			{
				logger.info("d/b active IRGP not found. calling addIrgp for CUSTOMER IP");
				addIrgp(msg, ipInstrIssrId, "CUSTOMER IP",inventory);
			}
			
			logger.info("calling checkAddPublishIrgp for CUSTOMER IP");
			checkAddPublishIrgp(dbConn,ipInstrIssrId, trn_id,inventory); //EG-5917
		}
//EG-7613 Unclear this part. Commented out for testing
//		SegmentId custSegmentId = msg.addSegment(XMLMessage.A_REFERENCE,"Customer");  --"MHI Inventory"
//		msg.addField("CST_ID", custSegmentId, cstId);
//		logger.info("MSG = "+msg.getXMLString());
	//	logger.info("MSG = "+msg.getXMLString());


           if(logger.isDebugEnabled())
             logger.debug("xml: " + msg.getXMLString());
   
		return true;

	}

	public void addIrgp(XMLMessage msg, String instrIssrId, String prtDesc, String inventory){
        
		SegmentId issrSeg = msg.addSegment(XMLMessage.A_REFERENCE, "Issuer");
		msg.addField("INSTR_ISSR_ID", issrSeg, instrIssrId);

		SegmentId irgpSeg = msg.addSegment(XMLMessage.A_UNKNOWN, "ISSRIssuerGroupParticipant");
		msg.addField("PRNT_ISSR_GRP_OID", irgpSeg, inventory);
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
	public void checkAddPublishIrgp(DatabaseAccess dbConn, String issrId, String trn_id, String inventory)
	{
		// Check if issuer is already in IOI
		String sql = "select issr.FINS_INST_MNEM from FT_T_ISSR issr " +
				"inner join FT_T_IRGP irgp on irgp.INSTR_ISSR_ID = issr.INSTR_ISSR_ID and irgp.END_TMS is null and irgp.PRT_PURP_TYP = 'INTEREST' " +
				"and irgp.PRNT_ISSR_GRP_OID='" + inventory + "'" +
				"where issr.INSTR_ISSR_ID = '" + issrId + "'";
		dbConn.setSQL(sql);
		dbConn.execute();
		String instMnem = null;
		if (!dbConn.isEndOfStream())
		{
			instMnem = dbConn.getNextString();
			if (instMnem == null || "".equals(instMnem))
			{
				logger.info("d/b fins_inst_mnem not found");
			} else
			{		
				logger.info("d/b found fins_inst_mnem="+instMnem);
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
				sql = "INSERT INTO up_children SELECT new_oid(),'"+trn_id+"', null, SYSDATE(),'"+instMnem+"','"+issrId+"','ISSR'"+
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

	public List<SegmentId> getSegmentIds(String segType, XMLMessage msg) {
        List<SegmentId> segIdList = new ArrayList<SegmentId>();
        for (int i=0; i<msg.getSegmentCount(); i++) {
                        SegmentId segId = new SegmentId(i);                                   
                        if (msg.getSegmentType(segId).equals(segType)) {
                                        segIdList.add(segId);
                        }
        }                              
        return segIdList;               
	}


	// EG-10019 MHSS IOI may have future START_TMS due to time zone. Check active IRGP before generating segments 
	public boolean activeIrgp(DatabaseAccess dbConn, String issrId, String inventory)
	{
		// Check if issuer is already in IOI
		String sql = "select distinct issr.INSTR_ISSR_ID from FT_T_ISSR issr " +
				"inner join FT_T_IRGP irgp on irgp.INSTR_ISSR_ID = issr.INSTR_ISSR_ID and irgp.END_TMS is null and irgp.PRT_PURP_TYP = 'INTEREST' " +
				"and irgp.PRNT_ISSR_GRP_OID='" + inventory + "'" +
				"where issr.INSTR_ISSR_ID = '" + issrId + "'";
		logger.info("Check active IRGP. sql: " + sql);
		dbConn.setSQL(sql);
		dbConn.execute();
		String instr_issr_id = null;
		if (!dbConn.isEndOfStream())
		{
			instr_issr_id = dbConn.getNextString();
			if (instr_issr_id != null && !"".equals(instr_issr_id))
			{
				logger.info("d/b active irgp found for instr_issr_id: " + instr_issr_id );
				return true; 
			}
		}
		logger.info("d/b active irgp not found. issr_ID: " + issrId);
		return false;
	}
}
