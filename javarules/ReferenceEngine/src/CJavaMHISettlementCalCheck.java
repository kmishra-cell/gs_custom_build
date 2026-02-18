import org.apache.log4j.Logger;

import com.thegoldensource.jbre.DatabaseAccess;
import com.thegoldensource.jbre.DatabaseObjectContainer;
import com.thegoldensource.jbre.GSException;
import com.thegoldensource.jbre.JavaRule;
import com.thegoldensource.jbre.NotificationCreator;
import com.thegoldensource.jbre.ProcessorContext;
import com.thegoldensource.jbre.SegmentId;
import com.thegoldensource.jbre.XMLMessage;


public class CJavaMHISettlementCalCheck implements JavaRule{
	
	private static final Logger logger = Logger.getLogger(CJavaMHISettlementCalCheck.class.getName());
	private static final String calSql = "select count(*) from ft_t_isca where instr_id=:1<char[11]> and end_tms is null and cal_purp_typ='SETLMENT' and (data_src_id is null or data_src_id<>'PM')";

	@Override
	public boolean initialize(String[] param) {
		
		log("Initializing the CJavaMHISettlementCalCheck");
		return true;
	}

	@Override
	public boolean process(XMLMessage xmlMsg, DatabaseObjectContainer dboc,
			ProcessorContext pContext, DatabaseAccess dbAccess, NotificationCreator notfcn)
			throws GSException {
		
		String msgClass=xmlMsg.getStringField("MSG_CLASSIFICATION", new SegmentId(0));
		if(!"PM".equals(msgClass)){
			log("Exiting as Message type is: "+ msgClass +" which is not PM");
			return true;
		}
		
		if(pContext.isNewIssue()){
			log("Exiting as it is new Instrument");
			return true;
		}
		SegmentId segISCA = Common.getSegmentId("IssueCalendarParticipant", xmlMsg);
		log("segISCA: "+segISCA);
		
		if(segISCA==null || "".equals(segISCA)){
			log("Exiting as there is no IssueCalendarParticipant segment is message");
			return true;
		}
		
		dbAccess.setSQL(calSql);
		try {
			dbAccess.addParameter(pContext.getInstrId());
			dbAccess.execute();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		int count = dbAccess.getNextInt();
		log("count: "+count);
		
		if(count > 0){
			log("Setting ISCA action to IGNORE");
			xmlMsg.setAction(segISCA, "IGNORE");
		}
		
		return true;
	}
	
	public void log(Object s){
		if(logger.isDebugEnabled())
			logger.debug(s);
	}

}
