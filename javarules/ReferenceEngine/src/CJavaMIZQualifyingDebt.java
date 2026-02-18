

import org.apache.log4j.Logger;

import com.thegoldensource.jbre.DatabaseAccess;
import com.thegoldensource.jbre.DatabaseObjectContainer;
import com.thegoldensource.jbre.GSException;
import com.thegoldensource.jbre.JavaRule;
import com.thegoldensource.jbre.NotificationCreator;
import com.thegoldensource.jbre.ProcessorContext;
import com.thegoldensource.jbre.SegmentId;
import com.thegoldensource.jbre.XMLMessage;

public class CJavaMIZQualifyingDebt implements JavaRule 
{
	private static final Logger logger = Logger.getLogger(CJavaMIZQualifyingDebt.class);
	String prtPurpTyp;
	private static int qualifyingThreshold;
	private static final String ratingSql = "select ft_t_rtvl.rank_num from ft_t_isrt,ft_t_rtvl where ft_t_isrt.rtng_set_oid = ft_t_rtvl.rtng_set_oid " +
											"and ft_t_isrt.rtng_cde = ft_t_rtvl.rtng_cde and ft_t_rtvl.data_src_id != 'MHI' and rank_num > 1 " +
											"and ft_t_isrt.instr_id = '";
	
	private static final String qualifyingDebtSql = "select ft_t_isgr.iss_grp_oid from ft_t_isgr where ft_t_isgr.grp_nme = 'QualifyingDebt'";
	
	private static final String issueGroupSql = "SELECT FT_T_ISGP.prnt_iss_grp_oid FROM FT_T_ISGP,FT_T_ISGR WHERE FT_T_ISGP.START_TMS <= SYSDATE() " +
												"AND (FT_T_ISGP.END_TMS IS NULL OR FT_T_ISGP.END_TMS > SYSDATE()) AND FT_T_ISGP.prnt_iss_grp_oid = FT_T_ISGR.iss_grp_oid " +
												"AND FT_T_ISGR.grp_nme = 'QualifyingDebt' AND FT_T_ISGP.INSTR_ID = '"; 

	public boolean initialize(String[] param) 
	{
		prtPurpTyp = param[0];
		qualifyingThreshold = Integer.parseInt(param[1]);
		return true;
	}

	public boolean process(XMLMessage xmlMsg, DatabaseObjectContainer ctn,ProcessorContext pContext, DatabaseAccess conn, NotificationCreator notfy) throws GSException 
	{
		if(logger.isInfoEnabled())
			logger.info("CJavaMIZQualifyingDebt.process()");
		
		//boolean isChanged = false;
		boolean qlfyRatingsFound = false;
		boolean worseRatingsFound = false;
		
		String mainIssueType  = xmlMsg.getStringField("MAIN_ENTITY_TBL_TYP", new SegmentId(0));
		String issueType  = xmlMsg.getStringField("MAIN_ENTITY_TYP", new SegmentId(0));
		if(logger.isInfoEnabled())
		{
			logger.info("mainIssueType: "+mainIssueType);
			logger.info("issueType: "+issueType);
		}

		if("ISSU".equals(mainIssueType) && issueType != null)
		{
			String instrumentId = pContext.getInstrId();
			if(logger.isInfoEnabled())
				logger.info("instrumentId: "+instrumentId);
			
			if (prtPurpTyp != null && !prtPurpTyp.equals(""))
			{
				//Check in SOI Group(s)
				String[] issGrpArray = prtPurpTyp.split(",");
				boolean isgpMember = false;

				for(int i=0; i < issGrpArray.length; i++)
				{
					isgpMember = Common.checkIsgpExists(conn, issGrpArray[i], instrumentId, logger);
					if (isgpMember == true)
						break;
				}

				if (isgpMember == false)
				{
					if(logger.isInfoEnabled())
						logger.info("Not in any of the groups. Exiting");
					
					return true;
				}
			}
/*			
			int count = xmlMsg.getSegmentCount();			
			for(int i=0; i<count; i++)
			{
				SegmentId seg = new SegmentId(i);
				String segName = xmlMsg.getSegmentType(seg);
				String processInd = xmlMsg.getSegmentAttribute(seg, "SEGPROCESSEDIND");
				logger.info("processInd: "+processInd);

				if("IssueRating".equals(segName))
				{
					isChanged = isChanged ? isChanged : !"N".equals(processInd);
				}
			}
	
			logger.info("isChanged: "+isChanged);
			if(isChanged)
			{
*/
			conn.setSQL(ratingSql+instrumentId+"'");
			conn.execute();
			while(!conn.isEndOfStream())
			{
				int stdRatingCode = conn.getNextInt();
				if(stdRatingCode <= qualifyingThreshold)
				{
					qlfyRatingsFound = true;
				}
				else
				{
					worseRatingsFound = true;
				}
			}
			
			if(qlfyRatingsFound && !worseRatingsFound)
			{
				//set qualifying debt flag to the
				conn.setSQL(qualifyingDebtSql);
				conn.execute();
				if(!conn.isEndOfStream())
				{
					setIssueGroup(xmlMsg,XMLMessage.A_D_UNKNOWN,instrumentId,conn.getNextString());
				}
			}
			else
			{
				conn.setSQL(issueGroupSql+instrumentId+"'");
				conn.execute();
				if(!conn.isEndOfStream())
				{
					setIssueGroup(xmlMsg,XMLMessage.A_D_DELETE,instrumentId,conn.getNextString());
				}
			}
			//}
		}
		return true;
	}
	
	private void setIssueGroup(XMLMessage xmlMsg, String action, String instrumentId, String PRNT_ISS_GRP_OID)
	{
		if(logger.isInfoEnabled())
			logger.info("relatedIssue --> "+instrumentId);
		SegmentId issueGroupParticipant = xmlMsg.addSegment(action,"ISSUIssueGroupParticipant");
		xmlMsg.addField("INSTR_ID", issueGroupParticipant, instrumentId);
		xmlMsg.addField("PRNT_ISS_GRP_OID", issueGroupParticipant, PRNT_ISS_GRP_OID);
		xmlMsg.addField("PRT_PURP_TYP", issueGroupParticipant, "MEMBER");
		//xmlMsg.addField("LAST_CHG_USR_ID", issueGroupParticipant, "MZSYSUSR");
	}		
}
