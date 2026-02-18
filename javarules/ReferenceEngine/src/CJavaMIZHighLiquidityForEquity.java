import org.apache.log4j.Logger;

import com.thegoldensource.jbre.DatabaseAccess;
import com.thegoldensource.jbre.DatabaseObjectContainer;
import com.thegoldensource.jbre.GSException;
import com.thegoldensource.jbre.JavaRule;
import com.thegoldensource.jbre.NotificationCreator;
import com.thegoldensource.jbre.ProcessorContext;
import com.thegoldensource.jbre.SegmentId;
import com.thegoldensource.jbre.XMLMessage;

public class CJavaMIZHighLiquidityForEquity implements JavaRule 
{
	private static final Logger logger = Logger.getLogger(CJavaMIZHighLiquidityForEquity.class);
	private String glbIssueType;
	
	private static final String relIssueWithIssGp= 	"SELECT FT_T_ISGP.prnt_iss_grp_oid FROM FT_T_RIDF,FT_T_RISS,FT_T_ISGP,FT_T_ISGR " +
													"WHERE FT_T_RIDF.rld_iss_feat_id = FT_T_RISS.rld_iss_feat_id AND FT_T_RIDF.START_TMS <= SYSDATE() " +
													"AND (FT_T_RIDF.END_TMS IS NULL OR FT_T_RIDF.END_TMS > SYSDATE()) AND FT_T_RISS.START_TMS <= SYSDATE() " +
													"AND (FT_T_RISS.END_TMS IS NULL OR FT_T_RISS.END_TMS > SYSDATE()) AND FT_T_RISS.INSTR_ID = FT_T_ISGP.INSTR_ID " +
													"AND FT_T_ISGP.START_TMS <= SYSDATE() AND (FT_T_ISGP.END_TMS IS NULL OR FT_T_ISGP.END_TMS > SYSDATE()) " +
													"AND FT_T_ISGP.prnt_iss_grp_oid = FT_T_ISGR.iss_grp_oid AND FT_T_ISGR.grp_nme = 'HighLiquidity' AND FT_T_RIDF.INSTR_ID = '";

	private static final String issueGroupSql  = 	"SELECT FT_T_ISGP.prnt_iss_grp_oid FROM FT_T_ISGP,FT_T_ISGR WHERE FT_T_ISGP.START_TMS <= SYSDATE() " +
													"AND (FT_T_ISGP.END_TMS IS NULL OR FT_T_ISGP.END_TMS > SYSDATE()) AND FT_T_ISGP.prnt_iss_grp_oid = FT_T_ISGR.iss_grp_oid " +
													"AND FT_T_ISGR.grp_nme = 'HighLiquidity' AND FT_T_ISGP.INSTR_ID = '"; 
	@Override
	public boolean initialize(String[] param) 
	{
		glbIssueType = param[0];
		return true;
	}

	@Override
	public boolean process(XMLMessage xmlMsg, DatabaseObjectContainer ctn,ProcessorContext pContext, DatabaseAccess conn, NotificationCreator notfy) throws GSException 
	{
		if(logger.isDebugEnabled())
			logger.debug("CJavaMIZEquityRelatedIssue.process()");
		
		String mainIssueType  = xmlMsg.getStringField("MAIN_ENTITY_TBL_TYP", new SegmentId(0));
		String issueType  = xmlMsg.getStringField("MAIN_ENTITY_TYP", new SegmentId(0));
		if(logger.isDebugEnabled())
		{
			logger.debug("mainIssueType: "+mainIssueType);
			logger.debug("issueType: "+issueType);
		}

		if("ISSU".equals(mainIssueType) && issueType != null &&  glbIssueType.contains(issueType))
		{
			//Set<String> deletedIssues = new HashSet<String>();
			//Set<String> modifiedIssues = new HashSet<String>();
			boolean isChanged = false;
			
			String instrumentId = pContext.getInstrId();
			if(logger.isDebugEnabled())
				logger.debug("instrumentId: "+instrumentId);
			
			int count = xmlMsg.getSegmentCount();
			for(int i=0; i<count; i++)
			{
				SegmentId seg = new SegmentId(i);
				String segName = xmlMsg.getSegmentType(seg);
				String processInd = xmlMsg.getSegmentAttribute(seg, "SEGPROCESSEDIND");
				logger.debug("processInd: "+processInd);

				if("RelatedIssue".equals(segName))
				{
					isChanged = isChanged ? isChanged : !"N".equals(processInd);
				}
			}
			
			
			logger.debug("isChanged"+isChanged);
			//get all the related issues for the equity
			if(isChanged)
			{
				conn.setSQL(relIssueWithIssGp+instrumentId+"'");
				conn.execute();
				if(conn.isEndOfStream())
				{					
					conn.setSQL(issueGroupSql+instrumentId+"'");
					conn.execute();
					if(!conn.isEndOfStream())
					{
						String PRNT_ISS_GRP_OID = conn.getNextString();
						logger.debug("D: PRNT_ISS_GRP_OID"+PRNT_ISS_GRP_OID);
						setIssueGroup(xmlMsg, XMLMessage.A_D_DELETE, instrumentId, PRNT_ISS_GRP_OID);
					}
					else
					{
						logger.debug("Nothing to delete");
					}
				}
				else
				{
					logger.debug("atleast one of the index has a high liquidity group");
					setIssueGroup(xmlMsg, XMLMessage.A_D_UNKNOWN, instrumentId, conn.getNextString());
				}
			}
		}		
		return true;
	}
	
	private void setIssueGroup(XMLMessage xmlMsg, String action, String instrumentId, String PRNT_ISS_GRP_OID)
	{
		if(logger.isDebugEnabled())
			logger.debug("relatedIssue -->"+instrumentId);
		SegmentId issueGroupParticipant = xmlMsg.addSegment(action,"ISSUIssueGroupParticipant");
		xmlMsg.addField("INSTR_ID", issueGroupParticipant, instrumentId);
		xmlMsg.addField("PRNT_ISS_GRP_OID", issueGroupParticipant, PRNT_ISS_GRP_OID);
		xmlMsg.addField("PRT_PURP_TYP", issueGroupParticipant, "ISIDGRP");
		xmlMsg.addField("LAST_CHG_USR_ID", issueGroupParticipant, "MZSYSUSR");
	}	
}
