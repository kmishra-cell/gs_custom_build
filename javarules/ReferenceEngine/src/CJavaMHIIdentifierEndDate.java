

import org.apache.log4j.Logger;

import com.thegoldensource.jbre.DatabaseAccess;
import com.thegoldensource.jbre.DatabaseObjectContainer;
import com.thegoldensource.jbre.GSException;
import com.thegoldensource.jbre.JavaRule;
import com.thegoldensource.jbre.NotificationCreator;
import com.thegoldensource.jbre.ProcessorContext;
import com.thegoldensource.jbre.SegmentId;
import com.thegoldensource.jbre.XMLMessage;

public class CJavaMHIIdentifierEndDate implements JavaRule {

	private static final Logger logger = Logger.getLogger(CJavaMHIIdentifierEndDate.class.getName());
	String idCtxtTyps;

	public boolean initialize(String[] params) {
		idCtxtTyps = params[0];
		return true;
	}

	public boolean process(XMLMessage xmlMsg,DatabaseObjectContainer dbCon,ProcessorContext pCon,DatabaseAccess conn,NotificationCreator nCreator) throws GSException
	{
		logger.info("CJavaMHIIdentifierEndDate.process()");
		
		String mainIssueType  = xmlMsg.getStringField("MAIN_ENTITY_TBL_TYP", new SegmentId(0));

		if(logger.isInfoEnabled())
			logger.info("mainIssueType: "+mainIssueType);
		
		if(logger.isDebugEnabled())
                  logger.debug("xml: " + xmlMsg.getXMLString());

		if("ISSU".equals(mainIssueType) && (idCtxtTyps != null && !idCtxtTyps.equals("")))
		{
			
			
			//Split parameter
			String[] issGrpArray = idCtxtTyps.split(",");
			String idCtxtString = "'";
	
			for(int i=0; i < issGrpArray.length; i++)
			{
				idCtxtString = idCtxtString + issGrpArray[i] + "',";
			}
			
			idCtxtString = idCtxtString.substring(0, idCtxtString.length() - 1);
					
			String instrId = pCon.getInstrId();

			if(logger.isInfoEnabled())
				logger.info("instrId :"+instrId);
		
			String sql = 
    "SELECT i.id_ctxt_typ, i.iss_id, " +
    "(SELECT mkt_nme FROM ft_t_mrkt WHERE mkt_oid = i.mkt_oid) AS mkt_nme, " +
    "i.isid_oid, m.mixr_oid " +
    "FROM ft_t_isid i " +
    "LEFT JOIN ft_t_mixr m ON i.isid_oid = m.isid_oid " +
    "WHERE i.end_tms IS NULL " +
    "AND m.end_tms IS NULL " +
    "AND i.instr_id = '" + instrId + "' " +
    "AND ID_CTXT_TYP IN (" + idCtxtString + ") " +
    "AND EXISTS ( " +
        "SELECT 1 FROM ( " +
            "SELECT i.instr_id, i.ID_CTXT_TYP, i.mkt_oid, m.MKT_ISS_OID, MIN(i.start_tms) AS start_tms " +
            "FROM ft_t_isid i " +
            "LEFT JOIN ft_t_mixr m ON i.isid_oid = m.isid_oid " +
            "WHERE i.end_tms IS NULL " +
            "AND m.end_tms IS NULL " +
            "GROUP BY i.instr_id, i.ID_CTXT_TYP, i.mkt_oid, m.MKT_ISS_OID " +
            "HAVING COUNT(*) > 1 " +
            "AND MIN(i.start_tms) != MAX(i.start_tms) " +
        ") old " +
        "WHERE i.instr_id = old.instr_id " +
        "AND i.id_ctxt_typ = old.id_ctxt_typ " +
        "AND i.start_tms = old.start_tms " +
        "AND i.mkt_oid = old.mkt_oid " +
        "AND COALESCE(m.mkt_iss_oid, 'x') = COALESCE(old.mkt_iss_oid, 'x') " +
    ")";

			if(logger.isInfoEnabled())
				logger.info("sql :"+sql);
	
			conn.setSQL(sql);
			conn.execute();
			
			if(conn.isEndOfStream())
			{
				logger.info("No identifier to end date. Exiting");
			}
			else
			{
				while (!conn.isEndOfStream())
				{
					String idCtxt = conn.getNextString();
					if(logger.isInfoEnabled())
						logger.info("idCtxt: "+idCtxt);

					String issId = conn.getNextString();
					if(logger.isInfoEnabled())
						logger.info("issId: "+issId);

					String mktNme = conn.getNextString();
					if(logger.isInfoEnabled())
						logger.info("mktNme: "+mktNme);

					String isidOid = conn.getNextString();
					if(logger.isInfoEnabled())
						logger.info("isidOid: "+isidOid);

					String mixrOid = conn.getNextString();
					if(logger.isInfoEnabled())
						logger.info("mixrOid: "+mixrOid);

					
					SegmentId isidSeg = xmlMsg.addSegment(XMLMessage.A_D_DELETE,"IssueIdentifier");
					xmlMsg.addField("ISID_OID", isidSeg, isidOid);
					logger.info(idCtxt + " " + issId + " deleted for market "+ mktNme);
					
					if (mixrOid != null && !mixrOid.equals(""))
					{
						SegmentId mixrSeg = xmlMsg.addSegment(XMLMessage.A_D_DELETE,"ISIDMarketIssueCrossReference");
						xmlMsg.addField("MIXR_OID", mixrSeg, mixrOid);
						logger.info("MIXR deleted for " + idCtxt + " " + issId + " for market "+ mktNme);
					}						
				}
				
				 if(logger.isDebugEnabled())
                  logger.debug("xml: " + xmlMsg.getXMLString());
			  
			  
			}
			return true;
		}
		logger.info("Not an issue. Exiting");
		return true;

	}

}
