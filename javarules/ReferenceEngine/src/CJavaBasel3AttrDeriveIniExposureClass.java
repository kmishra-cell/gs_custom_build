import java.util.Calendar;
import java.util.Date;

import org.apache.log4j.Logger;

import com.thegoldensource.jbre.DatabaseAccess;
import com.thegoldensource.jbre.DatabaseObjectContainer;
import com.thegoldensource.jbre.GSException;
import com.thegoldensource.jbre.JavaRule;
import com.thegoldensource.jbre.NotificationCreator;
import com.thegoldensource.jbre.ProcessorContext;
import com.thegoldensource.jbre.SegmentId;
import com.thegoldensource.jbre.XMLMessage;


public class CJavaBasel3AttrDeriveIniExposureClass implements JavaRule 
{
	private final static Logger logger = Logger.getLogger("CJavaBasel3AttrDeriveIniExposureClass");
	

	public boolean initialize(String[] params) 
	{
		logger.info("Initializing CJavaBasel3AttrDeriveIniExposureClass Rule");
		return true;
	}

	public boolean process(XMLMessage xml, DatabaseObjectContainer dbObj, ProcessorContext pCon, DatabaseAccess dbConn, NotificationCreator notfcn) throws GSException 
	{			
// This rule is applied to FinancialInstitutionClassification and derive initialExposureClassCode from BOE code
// The derivation is required when BOE code is created/updated so check if the segment is for BOE
// Create FICL segment for B3INIEXPCL with action UNKNOWN
// If BOE is end dated and there is active B3INIEXPCL in the database, create DELETE segment
		
		String instMnem = null;
		
		try 
		{
			logger.info("CJavaBasel3AttrDeriveIniExposureClass.process()");

			// WEBMSG is for UI updates
			String msgClassification = null;
			msgClassification = xml.getStringField("MSG_CLASSIFICATION", new SegmentId(0));
			logger.info("msgClassification = " + msgClassification);
					
			//check SEGPROCESSEDIND and INDUSCLSETID			
			String segmentName = pCon.getCurrentSegmentType();
			logger.info("segmentName: " + segmentName);			
			
			String procInd = null;
			String indusClSetId = null;
			
			SegmentId currSegId = pCon.getCurrentSegmentId();
			instMnem = xml.getStringField("INST_MNEM", currSegId);
			logger.info("instMnem = " + instMnem);
			procInd = xml.getSegmentAttribute(currSegId, "SEGPROCESSEDIND");
			logger.info("procInd = " + procInd);
			indusClSetId = xml.getStringField("INDUS_CL_SET_ID", currSegId);
			logger.info("indusClSetId = " + indusClSetId);
					
			//If MSGCLASSIFICATION = WEBMSG, proceed.(WEBMSG may not contain INDUS_CL_SET_ID)
			//Otherwise, proceed if INDUSCLSETID = BOE
			//In the future, proceed if SEGPROCESSEDIND is C or U
				
			if(msgClassification == null) {
				logger.info("msgClassification is not found. Exit");
				return true;
			}
			
			if(!"WEBMSG".equalsIgnoreCase(msgClassification))
			{
				logger.info("msgClassification is not WEBMSG. Check indusClSetId");
				
				if  ( indusClSetId != null && indusClSetId.equalsIgnoreCase("BOE")) 
				{
					logger.info("indusClSetId is BOE. Proceed");
				}else
				{
					logger.info("indusClSetId is not BOE. Exit");
					return true;
				}
			}else  //Message is WEBMSG
			{
				logger.info("msgClassification is WEBMSG. Check if BOE record is updated");
				String finsClsfOid = xml.getStringField("FINS_CLSF_OID", currSegId);
					
				if (finsClsfOid == null)
				{
					logger.info("finsClsfOid is not set. We cannot determine if this segment is BOE. Proceed.");
				}else
				{
				// Using Fins_clsf_oid, look up FICL table to check if BOE is updated
					logger.info("finsClsfOid = " + finsClsfOid);
						
					String sql  = 	"SELECT COUNT(1) FROM ft_t_ficl " +
					"WHERE indus_cl_set_id='BOE' " +
					"AND fins_clsf_oid ='" + finsClsfOid + "' " ;
				
					logger.info("SQL = " + sql);
					
					dbConn.setSQL(sql);
					dbConn.execute();	
							
					int cnt = dbConn.getNextInt();						
					logger.info("cnt: " + cnt);
							
					if (cnt > 0)
					{
						logger.info("BOE record is being updated. Derive Initial Exposure Class Code");

					} else
					{
						logger.info("BOE is not updated. Exit");
						return true;
					}// end of BOE check				

				}// end of finsClsfOid has value
			}// end of WEBMSG			
			
// End of FinancialInstitutionClassification specific filter		

//Start of derivation
		
			// Get BOE from FT_T_FICL
			
			String boeCode = null;
			
			String sql_boe = 	"WITH boe_latest AS ( " +
			"SELECT cl_value, RANK() OVER (ORDER BY last_chg_tms DESC) AS upd_rank " +
			"FROM ft_t_ficl " +
			"WHERE indus_cl_set_id='BOE' " +
			"AND COALESCE(end_tms, SYSDATE() + INTERVAL '1 day') > SYSDATE() " +
			"AND inst_mnem ='" + instMnem + "' )" +		
			"SELECT cl_value FROM boe_latest " +
			"WHERE upd_rank = 1" ;

			logger.info("SQL = " + sql_boe);
		
			dbConn.setSQL(sql_boe);
			dbConn.execute();
			
			if(!dbConn.isEndOfStream())
				boeCode=dbConn.getNextString();			
			
			//Get INIT_EXP_CLS_CDE from FT_T_BBX1 by looking up BOE_CDE_EXPR
			if (boeCode != null && !boeCode.equals(""))
			{
				logger.info("boecode = " + boeCode);

				String bbx1sql =	"SELECT init_exp_cls_cde FROM ft_t_bbx1 " +
						"WHERE '" + boeCode + "' LIKE boe_cde_expr||'%' " + 
						"AND end_tms is null  " +
						"ORDER BY REGEXP_COUNT( boe_cde_expr, '_') ASC" ;

				logger.info("bbx1sql SQL = " + bbx1sql);
	
				dbConn.setSQL(bbx1sql);
				dbConn.execute();

				String expCls = null;

				if(!dbConn.isEndOfStream())
					expCls=dbConn.getNextString();
				
				logger.info("expCls = " + expCls);
					
				if (expCls != null &&  !expCls.equals(""))	// init_exp_cls_cde returned
				{
	
					// Get INCL fields
					String inclSql =	
					"SELECT clsf_oid FROM ft_t_incl " +
					"WHERE indus_cl_set_id='B3INIEXPCL' " +
					"AND cl_value='" + expCls + "'";
		
					logger.info("inclSql SQL = " + inclSql);
						
					dbConn.setSQL(inclSql);
					dbConn.execute();						
					
					String clsfOid = null;
						
					if(!dbConn.isEndOfStream())
						clsfOid=dbConn.getNextString();	
						
					logger.info("clsfOid = " + clsfOid);
					
					// create reference segment
					createFinsRefSegment (xml,instMnem);
					
					// Call createFiclSegment for "B3INIEXPCL"
					createFiclSegment(xml, expCls, clsfOid, "B3INIEXPCL",instMnem);
						
				} else // init_exp_cls_cde is not returned
				{
					logger.info("Initial Exposure Class Code is not found. B3INIEXPCL will not be created ");
				}
			}else // There is no active BOE in the database... This is only applicable for UI change
			{
				logger.info("BOE is not active in the database. Check if active B3INIEXPCL presents ");
				
				String sql_iec = "SELECT clsf_oid, cl_value FROM ft_t_ficl " +
				"WHERE indus_cl_set_id='B3INIEXPCL' " +
				"AND end_tms is null "  +
				"AND inst_mnem ='" + instMnem + "' " ;
				
				logger.info("sql_iec SQL = " + sql_iec);
				
				dbConn.setSQL(sql_iec);
				dbConn.execute();
				
				String clsfOidIec = null;
				String clValueIec = null;
				
				if(dbConn.isEndOfStream())
				{
					logger.info("No active B3INIEXPCL in the database. Exit ");	
					return true;
				}	
				else
				{
					clsfOidIec=dbConn.getNextString();		
					logger.info("clsfOidIec = " + clsfOidIec);

					clValueIec=dbConn.getNextString();					
					logger.info("clValueIec = " + clValueIec);
				}
				// create FinancialInstitution reference segment
				createFinsRefSegment (xml,instMnem);
				// create FinancialInstitutionClassification segment with A_D_DELETE action
				createFiclDelSegment(xml, clValueIec, clsfOidIec, "B3INIEXPCL", instMnem );
				
				
			} // End of if (boeCode != null && !boeCode.equals(""))
	
		} 
		catch (Exception e) {
			throw new GSException(e.getMessage());
		}
		finally
		{
			dbConn.close();
		}
		return true;
	}


	private void createFinsRefSegment (XMLMessage xml, String instMnem) 
	{
		SegmentId newSeg = xml.addSegment( XMLMessage.A_REFERENCE,"FinancialInstitution");
		xml.addField("INST_MNEM", newSeg, instMnem);
		
		logger.info("FinancialInstitution REFERENCE added");
	}
	
	public void createFiclSegment(XMLMessage xml, String clValue, String clsfOid, String indusClSetId, String instMnem )
	{
		// Set A_UNKNOWN as action type so that the rules will be applied to this segment 
		SegmentId newSeg = xml.addSegment( XMLMessage.A_UNKNOWN,"FinancialInstitutionClassification");
		
		xml.setSegmentAttribute(newSeg, "MATCH", "FICL_MATCH_SET");
		xml.setSegmentAttribute(newSeg, "TSATTRIBUTE", "CLSF_OID");
		xml.setSegmentAttribute(newSeg, "TSOPTION", "Y");
		xml.addField("CL_VALUE", newSeg, clValue);
		xml.addField("CLSF_OID", newSeg, clsfOid);
		xml.addField("INDUS_CL_SET_ID", newSeg, indusClSetId);
		xml.addField("INST_MNEM", newSeg, instMnem);
		xml.addField("CLSF_PURP_TYP", newSeg, "INDCLASS");		
		// START_TMS is required by GS engine. Setting StartTms as the first second of the day
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.HOUR_OF_DAY, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);
		cal.set(Calendar.MILLISECOND, 0);
		Date today = cal.getTime();
				
		xml.addField("START_TMS", newSeg, today);
		xml.setFieldAttribute("START_TMS", newSeg, "INSERT_ONLY", "Y");

		logger.info(indusClSetId + " Segment added");
	}

	public void createFiclDelSegment(XMLMessage xml, String clValue, String clsfOid, String indusClSetId, String instMnem )
	{
		// Set A_D_DELETE as action type so that this segment will not trigger other rules 
		SegmentId newSeg = xml.addSegment( XMLMessage.A_D_DELETE,"FinancialInstitutionClassification");
		xml.setSegmentAttribute(newSeg, "MATCH", "FICL_MATCH_SET");
		xml.setSegmentAttribute(newSeg, "TSATTRIBUTE", "CLSF_OID");
		xml.setSegmentAttribute(newSeg, "TSOPTION", "Y");
		xml.addField("CL_VALUE", newSeg, clValue);
		xml.addField("CLSF_OID", newSeg, clsfOid);
		xml.addField("INDUS_CL_SET_ID", newSeg, indusClSetId);
		xml.addField("INST_MNEM", newSeg, instMnem);
		xml.addField("CLSF_PURP_TYP", newSeg, "INDCLASS");		
				
		if(logger.isInfoEnabled())
			logger.info(indusClSetId + " Delete Segment added");
	}
}
