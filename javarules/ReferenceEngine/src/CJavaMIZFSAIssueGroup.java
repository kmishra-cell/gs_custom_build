import java.util.ArrayList;
import java.util.Arrays;
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

public class CJavaMIZFSAIssueGroup implements JavaRule 
{
	private final static Logger logger = Logger.getLogger(CJavaMIZFSAIssueGroup.class);
	List<String> issueTypes = new ArrayList<String>();
	
	@Override
	public boolean initialize(String[] params) 
	{
		String issueTypeParams = params[0];
		String[] types = issueTypeParams.split(",");
		issueTypes.addAll(Arrays.asList(types));
		for(String s : issueTypes)
			logger.debug("CJavaMIZFSAIssueGroup : "+s);
		
		return true;
	}

	@Override
	public boolean process(XMLMessage xmlMsg, DatabaseObjectContainer ctn,ProcessorContext pContext, DatabaseAccess conn, NotificationCreator notfy) throws GSException 
	{
		if(logger.isDebugEnabled())
			logger.debug("CJavaMIZFSAIssueGroup.process()");
		
		String mainIssueType  = xmlMsg.getStringField("MAIN_ENTITY_TBL_TYP", new SegmentId(0));
		String issueType  = xmlMsg.getStringField("MAIN_ENTITY_TYP", new SegmentId(0));
		if(logger.isDebugEnabled())
		{
			logger.debug("mainIssueType: "+mainIssueType);
			logger.debug("issueType: "+issueType);
		}

		if("ISSU".equals(mainIssueType) && issueTypes.contains(issueType))
		{
			String instrumentId = pContext.getInstrId();
			if(logger.isDebugEnabled())
				logger.debug("instrumentId: "+instrumentId);
			
			int count = xmlMsg.getSegmentCount();			
			for(int i=0; i<count; i++)
			{
				SegmentId seg = new SegmentId(i);
				String segName = xmlMsg.getSegmentType(seg);				
				
				if("Issue".equals(segName))
				{
					String issrId = xmlMsg.getStringField("INSTR_ISSR_ID", seg);
					String sql = "select issuerGp.grp_nme from ft_t_issr issuer,ft_t_irgp issuerGpMem,ft_t_irgr issuerGp,ft_t_irgp parentGpMem,ft_t_irgr parentGp where   issuer.instr_issr_id = issuerGpMem.instr_issr_id and issuerGpMem.prnt_issr_grp_oid = issuerGp.issr_grp_oid and issuerGp.issr_grp_oid = parentGpMem.issr_grp_oid and parentGpMem.prnt_issr_grp_oid = parentGp.issr_grp_oid and parentGp.grp_nme = 'Issuer FSA Approved' and issuer.instr_issr_id = '";
					conn.setSQL(sql+issrId+"'");
					conn.execute();
					if(!conn.isEndOfStream())
					{
						String issuerFSAGroupName = conn.getNextString();
						logger.debug("issuerFSAGroupName: "+issuerFSAGroupName);
						String issueFSAGroupName = issuerFSAGroupName.replace("Issuer", "Asset");
						logger.debug("issueFSAGroupName: "+issueFSAGroupName);
						String issueGrpSql= "select iss_grp_oid from ft_t_isgr where grp_nme = '";
						conn.setSQL(issueGrpSql+issueFSAGroupName+"'");
						conn.execute();
						if(!conn.isEndOfStream())
						{
							SegmentId issueGroupParticipant = xmlMsg.addSegment(XMLMessage.A_D_UNKNOWN,"ISSUIssueGroupParticipant");
							xmlMsg.addField("INSTR_ID", issueGroupParticipant, instrumentId);
							xmlMsg.addField("PRNT_ISS_GRP_OID", issueGroupParticipant, conn.getNextString());
							xmlMsg.addField("PRT_PURP_TYP", issueGroupParticipant, "ISIDGRP");
							xmlMsg.addField("LAST_CHG_USR_ID", issueGroupParticipant, "MZSYSUSR");
						}
					}
				}
			}
		}
		return true;
	}
}
