import java.util.Date;
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


public class CJavaIssuerMatchEnhancement implements JavaRule
{
	
	private static final Logger logger = Logger.getLogger(CJavaIssuerMatchEnhancement.class.getName());
	String prtPurpTyp;
	
	public boolean initialize(String[] params) 
	{
		log("Initialize CJavaIssuerMatchEnhancement");
		return true;
	}
	
	public boolean process(XMLMessage xmlMsg,DatabaseObjectContainer dbContainer,ProcessorContext pContext,DatabaseAccess conn,NotificationCreator nCreator) throws GSException
	{
		logger.info("CJavaIssuerMatchEnhancement.process()");
		
		String msgClass=xmlMsg.getStringField("MSG_CLASSIFICATION", new SegmentId(0));
			
		log("Message Class: "+msgClass);

		if (!"PM".equals(msgClass)){
			log("Exiting rule as it is not PMASSET");
			return true;
		}
				
		String mainIssueType  = xmlMsg.getStringField("MAIN_ENTITY_TBL_TYP", new SegmentId(0));
		log("mainIssueType: "+mainIssueType);
		
		if (!"ISSU".equals(mainIssueType)){
			log("Exiting rule as it is not ISSU as main entity type");
			return true;
		}
		
		List<SegmentId> segIdsIsst=Common.getSegmentIds("IssueStatistic", xmlMsg);
		log("segIdsIsst: "+segIdsIsst);
		SegmentId isrOidSeg=null;
		for(SegmentId segid: segIdsIsst){
			
			if("ISROID".equals(xmlMsg.getStringField("STAT_DEF_ID", segid))){
				isrOidSeg=segid;
				break;
			}
		}
		
		if(isrOidSeg==null){
			log("exiting as there is no ISROID in msg");
			return true;
		}
				
		String instrId=pContext.getInstrId();
		log("instrId: "+instrId);
		
		String sql="Select instr_issr_id from ft_t_issu where instr_id=:1<char[11]>";
		
		conn.setSQL(sql);
		try {
			conn.addParameter(instrId);
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		conn.execute(); 
		
		String dbInstrIssrId=conn.getNextString();
		log("dbInstrIssrId:"+dbInstrIssrId);
		
		String tempIssrId=null;
		
		if(dbInstrIssrId==null || "".equals(dbInstrIssrId)){
			
			String sql2="select distinct(issr.instr_issr_id ) "
						+"from "
						+"ft_t_figu figu, "
						+"ft_t_issr issr, "
						+"ft_t_isgu isgu "
						+"where "
						+"upper(issr.issr_nme) like 'PRE-REGISTERED ISSUER%' "
						+"and issr.FINS_INST_MNEM = figu.INST_MNEM "
						+"and figu.gu_id = isgu.gu_id "
						+"and figu.gu_typ = 'COUNTRY' "
						+"and isgu.instr_id=:1<char[11]> "
						+"and isgu.gu_typ='COUNTRY' "
						+"and isgu.iss_gu_purp_typ='ISOCNTRY'"
						+"and issr.end_Tms is null "
						+"and figu.end_Tms is null "
						+"and isgu.end_Tms is null ";
			
			conn.setSQL(sql2);
			try {
				conn.addParameter(instrId);
			} catch (Exception e) {
				
				e.printStackTrace();
			}
			
			conn.execute();
			
			 if (!conn.isEndOfStream()) {
							tempIssrId = conn.getNextString();
					} 
					
			log("tempIssrId: "+tempIssrId);
			
			//tempIssrId=conn.getNextString();
			if(tempIssrId==null || "".equals(tempIssrId)){
				log("Exiting rule as no temp issuer found");
				return true;
			}
				
							
			SegmentId issuSeg = xmlMsg.addSegment(XMLMessage.A_D_UNKNOWN,"Issue");
			xmlMsg.addField("INSTR_ISSR_ID", issuSeg, tempIssrId);
			xmlMsg.addField("LAST_CHG_TMS", issuSeg, new Date());
			xmlMsg.addField("INSTR_ID", issuSeg, instrId);
					
			return true;		
		}
		
		
//		String instrIssrId=conn.getNextString();
//		log("instrIssrId: "+instrIssrId);
		String isrOid=xmlMsg.getStringField("STAT_CHAR_VAL_TXT", isrOidSeg);
		log("isrOid: "+isrOid);
		
		String sqlIsrOid="SELECT INSTR_ISSR_ID FROM FT_T_IRID WHERE ISSR_ID_CTXT_TYP='ISROID' and issr_id = :1<char[100]> and END_TMS is null";
		
		conn.setSQL(sqlIsrOid);
		try {
			conn.addParameter(isrOid);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		conn.execute();
		
		String issrForISROID = null;
				 if (!conn.isEndOfStream()) {
							issrForISROID = conn.getNextString();
					} 
		
		
	//	String issrForISROID=conn.getNextString();
		log("issrForISROID:"+issrForISROID);
		
		if(issrForISROID==null|| "".equals(issrForISROID)){
			
			if(dbInstrIssrId!=null && !"".equals(dbInstrIssrId)){
				
				String sqlIsTempIssrSql="select case when upper(issr.issr_nme) like 'PRE-REGISTERED ISSUER%' then 'Y' else 'N' end from ft_t_issr issr where instr_issr_id=:1<char[11]> and end_tms is null";
				String isTempIssr=getQueryResult(conn,sqlIsTempIssrSql,dbInstrIssrId);
				
				if(isTempIssr!=null && "N".equals(isTempIssr)){
					SegmentId issrIdSeg = xmlMsg.addSegment(XMLMessage.A_D_UNKNOWN,"IssuerIdentifier");
					xmlMsg.setSegmentAttribute(issrIdSeg, "MATCH", "IRID2_INSTR_IDCTXT_ISSR_ID");
					xmlMsg.addField("INSTR_ISSR_ID", issrIdSeg, dbInstrIssrId);
					xmlMsg.addField("ISSR_ID_CTXT_TYP", issrIdSeg, "ISROID");
					xmlMsg.addField("ISSR_ID", issrIdSeg, isrOid);
				}
			}
		}
		
		return true;
	}	
	
	public void log(Object s){
		if(logger.isDebugEnabled())
			logger.debug(s);
	}
	

	String getQueryResult(DatabaseAccess conn, String sql, String param){
		conn.setSQL(sql);
		try {
			conn.addParameter(param);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		conn.execute();
		
		String result= null;
		
		 if (!conn.isEndOfStream()) {
				result = conn.getNextString();
			} 
				log("result: "+result);
		
		//String result=conn.getNextString();
		return result;
	}
}
