import org.apache.log4j.Logger;

import com.thegoldensource.jbre.DatabaseAccess;
import com.thegoldensource.jbre.DatabaseObjectContainer;
import com.thegoldensource.jbre.GSException;
import com.thegoldensource.jbre.JavaRule;
import com.thegoldensource.jbre.NotificationCreator;
import com.thegoldensource.jbre.ProcessorContext;
import com.thegoldensource.jbre.SegmentId;
import com.thegoldensource.jbre.XMLMessage;

public class CJavaMIZFCYIssueGroup implements JavaRule 
{
	private final static Logger logger = Logger.getLogger(CJavaMIZFCYIssueGroup.class);
	
	public boolean initialize(String[] params) 
	{
		return true;
	}

	public boolean process(XMLMessage xmlMsg, DatabaseObjectContainer ctn,ProcessorContext pContext, DatabaseAccess conn, NotificationCreator notfy) throws GSException 
	{
		if(logger.isInfoEnabled())
			logger.info("CJavaMIZFCYIssueGroup.process()");
		
		String mainIssueType  = xmlMsg.getStringField("MAIN_ENTITY_TBL_TYP", new SegmentId(0));
		String issueType  = xmlMsg.getStringField("MAIN_ENTITY_TYP", new SegmentId(0));
		if(logger.isInfoEnabled())
		{
			logger.info("mainIssueType: "+mainIssueType);
			logger.info("issueType: "+issueType);
		}

		if("ISSU".equals(mainIssueType))
		{
			String instrumentId = pContext.getInstrId();
			if(logger.isInfoEnabled())
				logger.info("instrumentId: "+instrumentId);
			
			int count = xmlMsg.getSegmentCount();			
			for(int i=0; i<count; i++)
			{
				SegmentId seg = new SegmentId(i);
				String segName = xmlMsg.getSegmentType(seg);				
				
				if("Issue".equals(segName))
				{
					StringBuffer sql = new StringBuffer(	"select ft_t_issu.denom_curr_cde, ft_t_gunt.pref_curr_cde from ft_t_issu, ft_t_irgu, ft_t_gunt " +
															"where ft_t_irgu.issr_gu_purp_typ = 'INCRPRTE' and  ft_t_irgu.start_tms <= SYSDATE() " +
															"and (ft_t_irgu.end_tms is null or ft_t_irgu.end_tms > SYSDATE()) " +
															"and ft_t_irgu.gu_typ = ft_t_gunt.prnt_gu_typ and ft_t_irgu.gu_cnt = ft_t_gunt.prnt_gu_cnt " +
															"and ft_t_irgu.gu_id = ft_t_gunt.prnt_gu_id and ft_t_gunt.start_tms <= SYSDATE() " +
															"and (ft_t_gunt.end_tms is null or ft_t_gunt.end_tms > SYSDATE()) " +
															"and ft_t_issu.instr_issr_id = ft_t_irgu.instr_issr_id and  ft_t_issu.instr_id = '");
					sql.append(instrumentId);
					sql.append("'");
					conn.setSQL(sql.toString());
					conn.execute();
					if(!conn.isEndOfStream())
					{
						String issueCurrency = conn.getNextString();
						String issuerIncorporationCurrency = conn.getNextString();
						logger.info("issueCurrency: "+issueCurrency);
						logger.info("issuerIncorporationCurrency: "+issuerIncorporationCurrency);
						if((issueCurrency != null && issueCurrency.equals(issuerIncorporationCurrency)) || isRelatedToEuro(issueCurrency, issuerIncorporationCurrency,conn))
						{
							String fcySql = "select prnt_iss_grp_oid from ft_t_isgp,ft_t_isgr " +
											"where ft_t_isgp.prnt_iss_grp_oid = ft_t_isgr.iss_grp_oid " +
											"and ft_t_isgp.end_tms is null " +
											"and ft_t_isgr.iss_grp_id = 'FCY' " +
											"and ft_t_isgp.instr_id = '";

							conn.setSQL(fcySql+instrumentId+"'");
							conn.execute();
							if(!conn.isEndOfStream())
							{
								createIssueGroupSegment(xmlMsg, conn,instrumentId,XMLMessage.A_D_DELETE);								
							}							
						}
						else
						{
							conn.setSQL("select iss_grp_oid from ft_t_isgr where iss_grp_id = 'FCY'");
							conn.execute();
							if(!conn.isEndOfStream())
							{
								createIssueGroupSegment(xmlMsg, conn,instrumentId,XMLMessage.A_D_UNKNOWN);
							}							
						}
					}
				}
			}
		}
		return true;
	}

	private void createIssueGroupSegment(XMLMessage xmlMsg, DatabaseAccess conn, String instrumentId, String action) 
	{
		SegmentId issueGroupParticipant = xmlMsg.addSegment(action,"ISSUIssueGroupParticipant");
		xmlMsg.addField("INSTR_ID", issueGroupParticipant, instrumentId);
		xmlMsg.addField("PRNT_ISS_GRP_OID", issueGroupParticipant, conn.getNextString());
		xmlMsg.addField("PRT_PURP_TYP", issueGroupParticipant, "ISIDGRP");
		//xmlMsg.addField("LAST_CHG_USR_ID", issueGroupParticipant, "MZSYSUSR");
	}
	
	private boolean isRelatedToEuro(String issueCurrency, String issuerCurrency,DatabaseAccess conn)
	{
		logger.info("isRelatedToEuro");
		if("EUR".equals(issuerCurrency))
		{
			String sql = "select ft_t_edmv.ext_dmn_val_nme from ft_t_idmv, ft_t_edmv where fld_data_cl_id='CURRENCY' and ft_t_edmv.data_stat_typ = 'ACTIVE' and ft_t_idmv.intrnl_dmn_val_id = ft_t_edmv.intrnl_dmn_val_id and ft_t_edmv.ext_dmn_val_nme = '";
			conn.setSQL(sql+issueCurrency+"'");
			conn.execute();
			return !conn.isEndOfStream();
		}
		logger.info("isRelatedToEuro returning false");
		return false;
	}
}
