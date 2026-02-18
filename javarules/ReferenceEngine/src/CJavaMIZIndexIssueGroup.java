

import java.util.HashSet;
import java.util.Set;

import org.apache.log4j.Logger;

import com.thegoldensource.jbre.DatabaseAccess;
import com.thegoldensource.jbre.DatabaseObjectContainer;
import com.thegoldensource.jbre.GSException;
import com.thegoldensource.jbre.JavaRule;
import com.thegoldensource.jbre.NotificationCreator;
import com.thegoldensource.jbre.ProcessorContext;
import com.thegoldensource.jbre.SegmentId;
import com.thegoldensource.jbre.XMLMessage;

public class CJavaMIZIndexIssueGroup implements JavaRule
{
	private String glbIssueType;
	private String issueGroupType;	
	private final static Logger logger = Logger.getLogger(CJavaMIZIndexIssueGroup.class);
	
	private static final String highLiquiditySql = "select distinct ft_t_isgr.grp_nme,ft_t_isgp.prnt_iss_grp_oid from ft_t_isgp,ft_t_isgr where ft_t_isgp.prnt_iss_grp_oid = ft_t_isgr.iss_grp_oid ";

	private static final String relatedIssuesSql = 	"SELECT DISTINCT FT_T_RISS.INSTR_ID FROM FT_T_RIDF,FT_T_RISS " +
													"WHERE FT_T_RIDF.rld_iss_feat_id = FT_T_RISS.rld_iss_feat_id AND FT_T_RIDF.START_TMS < SYSDATE() " +
													"AND (FT_T_RIDF.END_TMS IS NULL OR FT_T_RIDF.END_TMS > SYSDATE()) AND FT_T_RISS.START_TMS < SYSDATE() " +
													"AND (FT_T_RISS.END_TMS IS NULL OR FT_T_RISS.END_TMS > SYSDATE()) AND FT_T_RIDF.INSTR_ID = '";

	private static final String relIssueWithIssGp= "SELECT  DISTINCT FT_T_RISS.INSTR_ID FROM FT_T_RIDF,FT_T_RISS,FT_T_ISGP,FT_T_ISGR " +
													"WHERE FT_T_RIDF.rld_iss_feat_id = FT_T_RISS.rld_iss_feat_id AND FT_T_RIDF.START_TMS < SYSDATE() " +
													"AND (FT_T_RIDF.END_TMS IS NULL OR FT_T_RIDF.END_TMS > SYSDATE()) AND FT_T_RISS.START_TMS < SYSDATE() " +
													"AND (FT_T_RISS.END_TMS IS NULL OR FT_T_RISS.END_TMS > SYSDATE()) AND FT_T_RISS.INSTR_ID = FT_T_ISGP.INSTR_ID " +
													"AND FT_T_ISGP.START_TMS < SYSDATE() AND (FT_T_ISGP.END_TMS IS NULL OR FT_T_ISGP.END_TMS > SYSDATE()) " +
													"AND FT_T_ISGP.prnt_iss_grp_oid = FT_T_ISGR.iss_grp_oid AND FT_T_ISGR.grp_nme = 'HighLiquidity' AND FT_T_RIDF.INSTR_ID = '";
	@Override
	public boolean initialize(String[] param) 
	{
		glbIssueType = param[0];
		issueGroupType = param[1];
		return true;
	}

	@Override
	public boolean process(XMLMessage xmlMsg, DatabaseObjectContainer ctn,ProcessorContext pContext, DatabaseAccess conn, NotificationCreator notfy) throws GSException 
	{
		if(logger.isDebugEnabled())
			logger.debug("CJavaMIZIndexIssueGroup.process()");
		
		String PRNT_ISS_GRP_OID = null;
		String mainIssueType  = xmlMsg.getStringField("MAIN_ENTITY_TBL_TYP", new SegmentId(0));
		String issueType  = xmlMsg.getStringField("MAIN_ENTITY_TYP", new SegmentId(0));
		if(logger.isDebugEnabled())
		{
			logger.debug("mainIssueType: "+mainIssueType);
			logger.debug("issueType: "+issueType);
		}

		if("ISSU".equals(mainIssueType) && issueType != null &&  glbIssueType.contains(issueType))
		{
			String instrumentId = pContext.getInstrId();
			SegmentId currentSegment = pContext.getCurrentSegmentId();
			String action = xmlMsg.getAction(currentSegment);
			if(logger.isDebugEnabled())
			{
				logger.debug("instrumentId: "+instrumentId);
				logger.debug("currentSegment: "+currentSegment);
				logger.debug("action: "+action);
			}
			
			if("DELETE".equals(action))
			{
				String ISGP_OID = xmlMsg.getStringField("ISGP_OID", currentSegment);
				logger.debug("ISGP_OID: "+ISGP_OID);
				conn.setSQL(highLiquiditySql+" and ft_t_isgp.isgp_oid = '"+ISGP_OID+"'");
				conn.execute();
				if(!conn.isEndOfStream() && issueGroupType.equals(conn.getNextString()))
				{
					PRNT_ISS_GRP_OID = conn.getNextString();
					if(logger.isDebugEnabled())
						logger.debug("D: PRNT_ISS_GRP_OID: "+PRNT_ISS_GRP_OID);
					
					Set<String> relatedIssues = getRelatedIssues(relIssueWithIssGp,instrumentId, conn);
					
					if(logger.isDebugEnabled())
						logger.debug("D: relatedIssues: "+relatedIssues.size());
					setIssueGroupsForRelatedIssues(xmlMsg,XMLMessage.A_D_DELETE, relatedIssues,PRNT_ISS_GRP_OID);
				}
			}
			else if("INSERT".equals(action) || "UPDATE".equals(action))
			{
				PRNT_ISS_GRP_OID = xmlMsg.getStringField("PRNT_ISS_GRP_OID", currentSegment);
				if(logger.isDebugEnabled())
					logger.debug("PRNT_ISS_GRP_OID: "+PRNT_ISS_GRP_OID);
				conn.setSQL(highLiquiditySql+" and ft_t_isgp.prnt_iss_grp_oid = '"+PRNT_ISS_GRP_OID+"'");
				conn.execute();
				if(!conn.isEndOfStream() && issueGroupType.equals(conn.getNextString()))
				{
					Set<String> relatedIssues = getRelatedIssues(relatedIssuesSql,instrumentId, conn);
					if(logger.isDebugEnabled())
						logger.debug("relatedIssues: "+relatedIssues.size());
					setIssueGroupsForRelatedIssues(xmlMsg, XMLMessage.A_D_UNKNOWN, relatedIssues,PRNT_ISS_GRP_OID);
				}
			}
		}
		return true;
	}
	
	private Set<String> getRelatedIssues(String sql, String instrumentId,DatabaseAccess conn)
	{
		Set<String> relatedIssues = new HashSet<String>();
		conn.setSQL(sql+instrumentId+"'");
		conn.execute();
		while(!conn.isEndOfStream())
		{
			relatedIssues.add(conn.getNextString());
		}
		return relatedIssues;
	}

	private void setIssueGroupsForRelatedIssues(XMLMessage xmlMsg, String action, Set<String> relatedIssues, String PRNT_ISS_GRP_OID)
	{
		for(String relatedIssue : relatedIssues)
		{
			if(logger.isDebugEnabled())
				logger.debug("relatedIssue -->"+relatedIssue);
			// Added Reference segment of related Issue for IssueClassification segment
			SegmentId groupIssue = xmlMsg.addSegment(XMLMessage.A_REFERENCE,"Issue");
			xmlMsg.addField("INSTR_ID", groupIssue, relatedIssue);

			SegmentId issueGroupParticipant = xmlMsg.addSegment(action,"ISSUIssueGroupParticipant");
			xmlMsg.addField("INSTR_ID", issueGroupParticipant, relatedIssue);
			xmlMsg.addField("PRNT_ISS_GRP_OID", issueGroupParticipant, PRNT_ISS_GRP_OID);
			xmlMsg.addField("PRT_PURP_TYP", issueGroupParticipant, "ISIDGRP");
			xmlMsg.addField("LAST_CHG_USR_ID", issueGroupParticipant, "MZSYSUSR");
		}
	}
}
