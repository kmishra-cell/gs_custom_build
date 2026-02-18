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
import com.thegoldensource.jbre.TableObject;


public class CJavaMHIMTNISINChange implements JavaRule {
	

	private static Logger logger = Logger.getLogger("CJavaMHIMTNISINChange"); 
	

	public boolean initialize(String[] parameters) {
		
		logger.info("Initialize Java rule CJavaMHIMTNISINChange Rule");		
		return true;
	}

	public boolean process(XMLMessage msg, DatabaseObjectContainer dboc,
			ProcessorContext pContext, DatabaseAccess dbConn,
			NotificationCreator notificationCreator)
			throws GSException {
		
		 if(logger.isDebugEnabled())
              logger.debug("xml: " + msg.getXMLString());
		
		String trn_id = pContext.getScopedTransaction().getTransactionID();

		String mainEntityNme = msg.getStringField("MAIN_ENTITY_NME", new SegmentId(0));
		String mainEntitytTblTyp = msg.getStringField("MAIN_ENTITY_TBL_TYP", new SegmentId(0));
		
		logger.info("Entity name is: "+mainEntityNme+". Entity type is:"+mainEntitytTblTyp+".");
		if(!"ISSU".equalsIgnoreCase(mainEntitytTblTyp)){
			logger.info("mainEntitytTblTyp is not ISSU. exiting");
			return true;
		}
		String userId = msg.getStringField("LAST_CHG_USR_ID", new SegmentId(0));
		logger.info("User ID is: " + userId);
		if (userId == null || "".equals(userId)) {
			logger.info("empty user Id, exiting");
			return true;
		}
		if (!"MTNASSET".equals(userId)) {
			logger.info("user is not MTNASSET, exiting");
			return true;
		}
		SegmentId currSegId = pContext.getCurrentSegmentId();
		String segType = msg.getSegmentType(currSegId );
		if ("IssueIdentifier".equalsIgnoreCase(segType)) {
			logger.info("Found IssueIdentifier segment....");
			String instrId = msg.getStringField("INSTR_ID", currSegId);
			logger.info("instrId = " + instrId);
			String idCtxtTyp = msg.getStringField("ID_CTXT_TYP", currSegId);
			logger.info("idCtxtTyp = " + idCtxtTyp);
			if(!"ISIN".equalsIgnoreCase(idCtxtTyp)) {
				logger.info("Not an ISIN ID_CTXT_TYP");
				return true ;
			}
			TableObject	 thisTableObject = dboc.getTableObject();
			String oldIsin= thisTableObject.getFieldString("ISS_ID");
			logger.info("ISS_ID from object is " + oldIsin);			
			if("".equals(oldIsin) || oldIsin == null) {
				logger.info("old Isin is blank, exiting");
				return true;
			}

			String newIsin = msg.getStringField("ISS_ID", currSegId);
			logger.info("newIsin = " + newIsin);
			if("".equals(newIsin) || newIsin == null) {
				logger.info("new Isin is blank, setting to empty string for notification purposes");
				newIsin = "";
			}
			if("".equals(oldIsin) && "".equals(newIsin)) {
				logger.info("No ISIN ws found, exiting");
				return true;
			}
			if(!oldIsin.equals(newIsin)) {
				logger.info("ISIN has changed....");
				logger.info("Raise the notification!!!!!");

				String[] paramVal =	{instrId,oldIsin,newIsin};
				String[] param = {"instrId","oldIsin","newIsin"};
				notificationCreator.raiseException("STRDATA","RULEPRC", 50009, param, paramVal);
				logger.info("notification raised");
			} else {
				logger.info("ISIN has NOT changed....");
			}
		}
		return true;
	}	
}