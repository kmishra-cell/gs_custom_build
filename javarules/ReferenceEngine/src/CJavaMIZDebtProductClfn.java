import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.log4j.Logger;

import com.thegoldensource.jbre.DatabaseAccess;
import com.thegoldensource.jbre.DatabaseObjectContainer;
import com.thegoldensource.jbre.GSException;
import com.thegoldensource.jbre.JavaRule;
import com.thegoldensource.jbre.NotificationCreator;
import com.thegoldensource.jbre.ProcessorContext;
import com.thegoldensource.jbre.SegmentId;
import com.thegoldensource.jbre.XMLMessage;

public class CJavaMIZDebtProductClfn implements JavaRule 
{
	private static final Logger logger = Logger.getLogger(CJavaMIZDebtProductClfn.class);
	
	private static List<String> issTypes = new ArrayList<String>();
	private static List<String> segments = new ArrayList<String>();
	//IssueIdentifier
	//ISSTYP
	//ISSUIssueGroupParticipant
	//RelatedIssueDefinition
	//Issuer
	
	private static final String IssuerSovereignSql = 	"select count(*) from ft_t_issu, ft_t_issr,ft_t_fins,ft_t_ficl,ft_t_incl " +
														"where ft_t_issu.instr_issr_id = ft_t_issr.instr_issr_id " +
														"and ft_t_issr.start_tms <= SYSDATE() " +
														"and (ft_t_issr.end_tms is null or ft_t_issr.end_tms > SYSDATE()) " +
														"and ft_t_issr.fins_inst_mnem = ft_t_fins.inst_mnem " +
														"and ft_t_fins.start_tms <= SYSDATE() " +
														"and (ft_t_fins.end_tms is null or ft_t_fins.end_tms > SYSDATE()) " +
														"and ft_t_fins.inst_mnem = ft_t_ficl.inst_mnem " +
														"and ft_t_ficl.start_tms <= SYSDATE() " +
														"and (ft_t_ficl.end_tms is null or ft_t_ficl.end_tms > SYSDATE()) " +
														"and ft_t_ficl.indus_cl_set_id = 'BBINDSGR' " +
														"and ft_t_ficl.clsf_oid=ft_t_incl.clsf_oid " +
														"and ft_t_incl.start_tms <= SYSDATE() " +
														"and (ft_t_incl.end_tms is null or ft_t_incl.end_tms > SYSDATE()) " +
														"and ft_t_incl.cl_value='Sovereign Agency' and ft_t_issu.instr_id = '";
	
	private static final String issueGroupSql = "SELECT FT_T_ISGP.prnt_iss_grp_oid FROM FT_T_ISGP,FT_T_ISGR " +
												"WHERE FT_T_ISGP.START_TMS <= SYSDATE() " +
												"AND (FT_T_ISGP.END_TMS IS NULL OR FT_T_ISGP.END_TMS > SYSDATE()) " +
												"AND FT_T_ISGP.prnt_iss_grp_oid = FT_T_ISGR.iss_grp_oid " +
												"AND FT_T_ISGR.grp_nme = 'FCY' AND FT_T_ISGP.INSTR_ID = '"; 

	public boolean initialize(String[] param) 
	{
		for(String s: param[0].split(","))
		{
			issTypes.add(s);
		}
		logger.debug("issTypes: " + issTypes);

		for(String s: param[1].split(","))
		{
			segments.add(s);
		}
		logger.debug("segments: " + segments);
		
		return true;
	}

	public boolean process(XMLMessage xmlMsg, DatabaseObjectContainer ctn,ProcessorContext pContext, DatabaseAccess conn, NotificationCreator notfy) throws GSException 
	{
		if(logger.isDebugEnabled())
			logger.debug("CJavaMIZDebtProductClfn.process()");
		
		boolean isChanged = false;
		String mainIssueType  = xmlMsg.getStringField("MAIN_ENTITY_TBL_TYP", new SegmentId(0));
		String issueType  = xmlMsg.getStringField("MAIN_ENTITY_TYP", new SegmentId(0));
		if(logger.isDebugEnabled())
		{
			logger.debug("mainIssueType: "+mainIssueType);
			logger.debug("issueType: "+issueType);
		}

		if("ISSU".equals(mainIssueType))
		{
			String instrumentId = pContext.getInstrId();
			if(logger.isDebugEnabled())
				logger.debug("instrumentId: "+instrumentId);
			
			if (issueType == null || issueType.equals(""))
			{
				issueType  = xmlMsg.getStringField("ISS_TYP", new SegmentId(0));
				
				if (issueType == null || issueType.equals(""))
				{
					String sql = "SELECT TRIM(ISS_TYP) FROM FT_T_ISSU WHERE INSTR_ID='" + instrumentId + "'";
					conn.setSQL(sql);
					conn.execute();
					
					if(!conn.isEndOfStream())
						issueType = conn.getNextString();
				}
			}
			
			if(logger.isDebugEnabled())
				logger.debug("issueType: "+issueType);
			
			if (issTypes.contains(issueType))
			{			
				int count = xmlMsg.getSegmentCount();			
				for(int i=0; i<count; i++)
				{
					SegmentId seg = new SegmentId(i);
					String segName = xmlMsg.getSegmentType(seg);				
					String processInd = xmlMsg.getSegmentAttribute(seg, "SEGPROCESSEDIND");				
					logger.debug("processInd : "+processInd);
					logger.debug("segName : "+segName);
					if("Issue".equals(segName) && !"N".equals(processInd))
					{
						String issrId = xmlMsg.getStringField("INSTR_ISSR_ID", seg);
						logger.debug("issrId"+issrId+" : isChanged : "+isChanged);
						isChanged = isChanged || issrId != null;
						logger.debug("issrId"+issrId+" : isChanged : "+isChanged);
					}
					isChanged = isChanged ? isChanged : segments.contains(segName) && !"N".equals(processInd);
				}
				logger.debug("isChanged: "+isChanged);
				if(isChanged)
				{
					String classification = isMizuhoMtn(conn, instrumentId);
					logger.debug("isMizuhoMtn :"+classification);
					
					if(classification == null)
					{
						classification = isAbsMbsSecurity(conn, instrumentId,issueType);
						logger.debug("isAbsMbsSecurity :"+classification);
					}

					if(classification == null)
					{
						classification = isCoveredSecurity(conn, instrumentId,issueType);			
						logger.debug("isCoveredSecurity :"+classification);
					}

					if(classification == null)
					{
						classification = isConvertible(issueType);
						logger.debug("isConvertible :"+classification);
					}

					if(classification == null)
					{
						classification = isCreditLinked(conn, instrumentId);
						logger.debug("isCreditLinked :"+classification);
					}

					if(classification == null)
					{
						classification = getClassificationFromIssuer(conn, instrumentId);
						logger.debug("getClassificationFromIssuer :"+classification);
					}
					
					setClassification(xmlMsg,XMLMessage.A_D_UNKNOWN,classification,instrumentId,conn);
				}
				return true;
			}
			logger.debug("Not a Debt instrument. Exiting");
			return true;
		}
		logger.debug("Not an issue. Exiting");
		return true;
	}
	
	private String isMizuhoMtn(DatabaseAccess conn, String instrumentId)
	{
		conn.setSQL("select count(*) from ft_t_isid " +
					"where ft_t_isid.id_ctxt_typ = 'MZHMTNREF' " +
					"and ft_t_isid.start_tms <= SYSDATE() " +
					"and (ft_t_isid.end_tms is null or ft_t_isid.end_tms > SYSDATE())  " +
					"and ft_t_isid.instr_id = '"+instrumentId+"'");
		
		conn.execute();
		logger.debug("conn.isEndOfStream(): "+conn.isEndOfStream());
		
		if(!conn.isEndOfStream() && conn.getNextInt() > 0)
		{
			conn.setSQL("select count(*) from ft_t_issu,ft_t_issr " +
						"where ft_t_issu.instr_issr_id = ft_t_issr.instr_issr_id " +
						"and ft_t_issr.issr_nme = 'Mizuho Financial Group Inc' " +
						"and ft_t_issu.instr_id = '"+instrumentId+"'");
			
			conn.execute();
			if(!conn.isEndOfStream() && conn.getNextInt() > 0)
				return "Mizuho MTN";
		}
		return null;
		
	}
	
	private String isAbsMbsSecurity(DatabaseAccess conn, String instrumentId, String issueType)
	{
		if("ABS".equals(issueType) || "MORTGAGE".equals(issueType))
		{
			conn.setSQL(IssuerSovereignSql+instrumentId+"'");
			conn.execute();
			if(!conn.isEndOfStream() && conn.getNextInt() == 0)
				return "Asset Backed";
		}
		return null;
	}
	
	private String isCoveredSecurity(DatabaseAccess conn, String instrumentId, String issueType)
	{
		conn.setSQL("select count(*) from ft_t_isll " +
					"where coll_typ = 'Covered' " +
					"and instr_id = '" + instrumentId + "'");

		conn.execute();
		if(!conn.isEndOfStream() && conn.getNextInt() > 0)
			return "Covered";
		else
			return null;
	}
	
	private String isConvertible(String issueType)
	{
		if("CVTBOND".equals(issueType))
		{
			return "Convertible";
		}
		else
			return null;
	}

	private String isCreditLinked(DatabaseAccess conn, String instrumentId)
	{
		conn.setSQL("SELECT count(*) FROM FT_T_RIDF " +
					"WHERE FT_T_RIDF.START_TMS < SYSDATE() " +
					"AND (FT_T_RIDF.END_TMS IS NULL OR FT_T_RIDF.END_TMS > SYSDATE()) " +
					"and FT_T_RIDF.REL_TYP = 'CreditLinked' " +
					"AND FT_T_RIDF.INSTR_ID = '"+instrumentId+"'");

		conn.execute();
		if(!conn.isEndOfStream() && conn.getNextInt() > 0)
			return "Credit Linked";
		else
			return null;
	}
	
	private String getClassificationFromIssuer(DatabaseAccess conn, String instrumentId)
	{
		Map<String, String> clfn = new HashMap<String, String>();
		conn.setSQL("select incl.indus_cl_set_id, incl.cl_nme " +
					"from ft_t_issu issu, ft_t_ircl ircl, ft_t_incl incl " +
					"where issu.instr_issr_id = ircl.instr_issr_id " +
					"and ircl.start_tms <= SYSDATE() " +
					"and (ircl.end_tms is null or ircl.end_tms > SYSDATE()) " + 
					"and ircl.clsf_oid=incl.clsf_oid " +
					"and issu.instr_id = '"+instrumentId+"'");

		conn.execute();
		while(!conn.isEndOfStream())
		{
			clfn.put(conn.getNextString().trim(), conn.getNextString());
		}
		
		if(clfn.get("BBINDSGR") != null)
		{
			String indSub = clfn.get("BBINDSGR");
			if("Sovereign".equals(indSub))
			{
				conn.setSQL(issueGroupSql+instrumentId+"'");
				conn.execute();
				logger.debug("conn.isEndOfStream()"+conn.isEndOfStream());
				if(conn.isEndOfStream())
				{
					return "Government";
				}
				else
				{
					return "Sovereign";
				}
			}
			else if("Supranational Bank".equals(indSub))
			{
				return "Supranational";
			}
			else if("Sovereign Agency".equals(indSub) || "Export/Import Bank".equals(indSub))				
			{
				return "Agency";
			}
		}
		
		if(clfn.get("BBINDGRP") != null)
		{
			String indGrp = clfn.get("BBINDGRP");
			if("Municipal".equals(indGrp) || "Regional(state/provnc)".equals(indGrp))
			{
				return "Regional Govt";
			}
		}
		return null;
	}	

	
	private void setClassification(XMLMessage xmlMsg, String action, String CL_VALUE,String istrumentId,DatabaseAccess conn)
	{
		if(CL_VALUE == null)
			CL_VALUE = "Corporate";
		
		conn.setSQL("select ft_t_incl.clsf_oid,ft_t_incl.indus_cl_set_id " +
					"from ft_t_incl, ft_t_incs " +
					"where ft_t_incl.indus_cl_set_id = ft_t_incs.indus_cl_set_id " +
					"and ft_t_incs.cl_set_nme = 'Debt Product Classification' " +
					"and CL_VALUE = '"+CL_VALUE+"'");

		conn.execute();
		if(!conn.isEndOfStream())
		{
			SegmentId topixIndClassification = xmlMsg.addSegment(action,"IssueClassification");
			xmlMsg.setSegmentAttribute(topixIndClassification, "MATCH", "ISCL_MATCH_SET");			
			xmlMsg.addField("CL_VALUE", topixIndClassification, CL_VALUE);
			xmlMsg.addField("CLSF_OID", topixIndClassification, conn.getNextString());
			xmlMsg.addField("INDUS_CL_SET_ID", topixIndClassification, conn.getNextString());
			xmlMsg.addField("INSTR_ID", topixIndClassification, istrumentId);
			xmlMsg.addField("CLSF_PURP_TYP", topixIndClassification, "INDCLASS");
		}
	}
}
