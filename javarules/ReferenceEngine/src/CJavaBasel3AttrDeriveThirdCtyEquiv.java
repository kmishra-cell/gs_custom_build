

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

public class CJavaBasel3AttrDeriveThirdCtyEquiv implements JavaRule 
{
	private final static Logger logger = Logger.getLogger("CJavaBasel3AttrDeriveThirdCtyEquivClass");
	
	public boolean initialize(String[] params) 
	{
		logger.info("Initializing CJavaBasel3AttrDeriveThirdCtyEquivClass Rule");
		return true;
	}

	public boolean process(XMLMessage xml, DatabaseObjectContainer dbObj, ProcessorContext pCon, DatabaseAccess dbConn, NotificationCreator notfcn) throws GSException 
	{			
		
/* This rule is applied to two segment types 
 * FinancialInstitutionClassification (InitialExposureClass) with FINAL attribute
 * FinancialInstitutionGeoUnitPrt (Country of Incorporation) with FINAL attribute
 * The rule will derive ThirdCtyEquiv from InitialExposureClass & Country Zone (EEA or not)
 * Create 2FICL UNKNOWN segments for each Jurisdiction - EBA and PRA. B3PRTRCTEQ for PRA and B3EBTRCTEQ for EBA.
 * If they cannot be derived create DELETE segment with ERROR=N 
 * The derivation is required when InitialExposureClass or Country zone is created/updated.
*/		
		String instMnem = null;
		String msgClassification = null;
		String segmentName = null;
		String activeFiclOid = null;
			
		try 
		{
			logger.info("CJavaBasel3AttrDeriveThirdCtyEquivClass.process()");		
			//MSG_CLASSIFICATION - WEBMSG for UI updates
			msgClassification = xml.getStringField("MSG_CLASSIFICATION", new SegmentId(0));  
			logger.info("msgClassification = " + msgClassification);
			
			// Exit if MSG_CLASSIFICATION is not set
			if(msgClassification == null || msgClassification.equals("") ) 
				return true;	
					
			SegmentId currSegId = pCon.getCurrentSegmentId();				//currentSegment	
			
			instMnem = xml.getStringField("INST_MNEM", currSegId);			//inst_mnem must be presetn
			logger.info("instMnem = " + instMnem);
			
			// Exit if INST_MNEM is not set in the current segment
			if(instMnem == null || instMnem.equals("") ) 
				return true;
								
			segmentName = pCon.getCurrentSegmentType();						//segmentName
			logger.info("segmentName: " + segmentName);	


/* The rule is triggered by FinancialInstitutionClassification
 * Exit if indusClSetId != 'B3INIEXPCL'
 * For UI updates(WEBMSG), INDUS_CL_SET_ID may not be found. 
 * Query table using Primary key ficl_clsf_oid
*/			
			if("FinancialInstitutionClassification".equalsIgnoreCase(segmentName) && !"WEBMSG".equalsIgnoreCase(msgClassification))
			{
				logger.info("FinancialInstitutionClassification. Non-UI. INDUS_CL_SET_ID is B3INIEXPCL");
				String msgIndusClSetId = xml.getStringField("INDUS_CL_SET_ID", currSegId);
				logger.info("msgIndusClSetId = " + msgIndusClSetId);		
				if  ( msgIndusClSetId == null || !msgIndusClSetId.equalsIgnoreCase("B3INIEXPCL"))
				{
					logger.info("msgIndusClSetId is not B3INIEXPCL. Exit");
					return true;
				}
			}			
			
			if("FinancialInstitutionClassification".equalsIgnoreCase(segmentName) && "WEBMSG".equalsIgnoreCase(msgClassification))	
			{
				logger.info("FinancialInstitutionClassification. WEBMSG. Query table with finsClsfOid for B3INIEXPCL");
				String finsClsfOid = xml.getStringField("FINS_CLSF_OID", currSegId);
				logger.info("finsClsfOid = " + finsClsfOid);			
				if (finsClsfOid == null || finsClsfOid.equals("") )
				{
					logger.info("finsClsfOid is not set. Exit");
					return true;
				}
						
				String sql  = 	"SELECT COUNT(1) FROM ft_t_ficl " +
				"WHERE indus_cl_set_id = 'B3INIEXPCL' " +
				"AND fins_clsf_oid ='" + finsClsfOid + "' " ;				
				logger.info("SQL = " + sql);
					
				dbConn.setSQL(sql);
				dbConn.execute();								
				int cnt = dbConn.getNextInt();						
				logger.info("cnt: " + cnt + " for B3INIEXPCL");		
				if (cnt == 0) // The message is not for B3INIEXPCL. Exit
				{
					logger.info("Not B3INIEXPCL. Exit");
					return true;
				} 	
			} 				
			
/* The current segment is  FinancialInstitutionGeoUnitPrt. 
 * It must have FINS_GU_PURP_TYP ='INCRPRTE' and gu_typ='COUNTRY'	
 * FINS_GU_PURP_TYP may not be found when msgClassification is WEBMSG. Primary key figu_oid should be available
 * Query table for GU_PURP_TYP ='INCRPRTE' and gu_typ='COUNTRY'
*/
			if("FinancialInstitutionGeoUnitPrt".equalsIgnoreCase(segmentName) && !"WEBMSG".equalsIgnoreCase(msgClassification))
			{
				logger.info("FinancialInstitutionGeoUnitPrt. Non-UI. Check finsGuPurpType and guTyp");
				
				String finsGuPurpType = xml.getStringField("FINS_GU_PURP_TYP", currSegId);
				logger.info("finsGuPurpType = " + finsGuPurpType);
				String guTyp = xml.getStringField("GU_TYP", currSegId);
				logger.info("guTyp = " + guTyp);	
	
				if  ( finsGuPurpType == null || !finsGuPurpType.equalsIgnoreCase("INCRPRTE") || guTyp == null || !guTyp.equalsIgnoreCase("COUNTRY"))
				{
					logger.info("Not INCRPRTE or Not COUNTRY. Exit");
					return true;						
				}
			}
			
			if("FinancialInstitutionGeoUnitPrt".equalsIgnoreCase(segmentName) && "WEBMSG".equalsIgnoreCase(msgClassification))
			{
				logger.info("FinancialInstitutionGeoUnitPrt.WEBMSG. Query table with figu_oid");
				String figuOid = xml.getStringField("FIGU_OID", currSegId);
				logger.info("figuOid = " + figuOid);
				
				if (figuOid == null || figuOid.equals(""))
					return true;
					
				String sql  = 	"SELECT COUNT(1) FROM ft_t_figu " +
				"WHERE fins_gu_purp_typ = 'INCRPRTE' AND gu_typ='COUNTRY' " +
				"AND figu_oid ='" + figuOid + "' " ;		
				logger.info("SQL = " + sql);
				
				dbConn.setSQL(sql);
				dbConn.execute();	
						
				int cnt = dbConn.getNextInt();						
				logger.info("cnt: " + cnt + " INCRPRTE & COUNTRY");				
								
				if (cnt == 0) 
				{
					logger.info("cnt: " + cnt + " The message is not in scope. Exit");
					return true;
				} 	
	
			}// End of Initial filtering
			
// Get active Initial Exposure Class FT_T_FICL B3INIEXPCL  
			String b3InitExp = null;
			
			String sql_ficl = 	"WITH ficl_latest AS ( " +
			"SELECT cl_value, RANK() OVER (ORDER BY last_chg_tms DESC) AS upd_rank " +
			"FROM ft_t_ficl " +
			"WHERE indus_cl_set_id='B3INIEXPCL' " +
			"AND COALESCE(end_tms, SYSDATE() + INTERVAL '1 day') > SYSDATE()" +
			"AND inst_mnem ='" + instMnem + "' )" +		
			"SELECT cl_value FROM ficl_latest " +
			"WHERE upd_rank = 1" ;

			logger.info("SQL = " + sql_ficl);
		
			dbConn.setSQL(sql_ficl);
			dbConn.execute();
			
			if(!dbConn.isEndOfStream())
				b3InitExp=dbConn.getNextString();	
			
			logger.info("b3InitExp: " + b3InitExp);
			
/*Get Country of Incorporation FT_T_FIGU
 * and determine if the country belongs to EEA. If so, use 'EEA'. If not, use GU_ID.
 * NOTE Multiple active Country of Incorporation may be found. In such case the last updated record will have priority
*/			
			String guId = null;	
			
			// Get the active Country of Incorporation
			String sql_figu = 	"WITH thelatest AS ( " +
			"SELECT gu_id, RANK() OVER (ORDER BY last_chg_tms DESC) AS upd_rank " +
			"FROM ft_t_figu " +
			"WHERE fins_gu_purp_typ = 'INCRPRTE' " + 			//Country of Incorporation
			"AND gu_typ = 'COUNTRY' " +							//gu_typ = country
			"AND COALESCE(end_tms, SYSDATE() + INTERVAL '1 day') > SYSDATE() " +
			"AND inst_mnem ='" + instMnem + "' )" +		
			"SELECT gu_id FROM thelatest " +
			"WHERE upd_rank = 1" ;

			logger.info("SQL = " + sql_figu);
		
			dbConn.setSQL(sql_figu);
			dbConn.execute();
			
			if(!dbConn.isEndOfStream())
				guId=dbConn.getNextString();	
			logger.info("guId: " + guId);
			
			if  (guId != null && !guId.equals(""))	// Active guId is found 
			{
			// Check FT_T_GUGP FT_T_GUGR if the county belongs to EEA: gu_typ='COUNTRY', prt_purp_typ='MEMBER'
			// EEA is FT_T_GUGR WHERE GRP_NME='EEA'		
				
				String sql = "SELECT COUNT(1) FROM ft_t_gugp gugp " +
				"WHERE EXISTS " +
				"( SELECT 1 FROM ft_t_gugr gugr WHERE gugr.gu_grp_oid = gugp.prnt_gu_grp_oid " +
				"AND gugr.grp_nme = 'EEA' " +
				"AND COALESCE(gugr.end_tms, SYSDATE() + INTERVAL '1 day') > SYSDATE() ) " +
				"AND gugp.prt_purp_typ = 'MEMBER' AND gugp.gu_typ = 'COUNTRY' " +
				"AND COALESCE(gugp.end_tms, SYSDATE() + INTERVAL '1 day') > SYSDATE() " + 
				"AND gugp.gu_id ='" + guId + "' ";
			
				logger.info("SQL = " + sql);
				
				dbConn.setSQL(sql);
				dbConn.execute();	
			
				int eeaCnt = dbConn.getNextInt();						
				logger.info("eeaCnt: " + eeaCnt);				
							
				if ( eeaCnt > 0) 	// Set to "EEA" as the country is the member of EEA
					guId  = "EEA";	
					logger.info("guId: " + guId + " updated" );
			}
			
// If input parameters are not available, third_cntry_eq cannot be derived. 
// Create Delete segments  for B3PRTRCTEQ and B3EBTRCTEQ with ERROR=N if the active record presents. Then Exit

			if (b3InitExp == null || b3InitExp.equals("") || guId == null || guId.equals("") )
			{			
				logger.info("Input parameters are not available. Check active records and create DELETE segments");
				// Check 	B3PRTRCTEQ
				activeFiclOid = activeFiclOid (dbObj, pCon, dbConn, xml, instMnem, "B3PRTRCTEQ");
				
				if (activeFiclOid != null &&  !activeFiclOid.equals(""))	// active record presents
					createFiclDelSegment (xml, instMnem, activeFiclOid, "B3PRTRCTEQ" );
				
				// Check 	B3EBTRCTEQ
				activeFiclOid = null;  // Initialise
				activeFiclOid = activeFiclOid (dbObj, pCon, dbConn, xml, instMnem, "B3EBTRCTEQ");
				
				if (activeFiclOid != null &&  !activeFiclOid.equals(""))	// active record presents
					createFiclDelSegment (xml, instMnem, activeFiclOid, "B3EBTRCTEQ" );
							
				return true;
			}
		
/* Get ft_t_btc1.third_cntry_eq by cntry_gu_id, init_exp_cls_cde, rtng_juris_nme
 * The classification is configured for two jurisdictions PRA and EBA, indus_cl_set_id B3PRTRCTEQ and B3EBTRCTEQ
*/
			//B3PRTRCTEQ for PRA
			String pra3rdCtry = null;
			String jurisNme = "PRA";
			String tgtIndusClSetID = "B3PRTRCTEQ";
			
			String sql = "SELECT third_cntry_eq FROM ft_t_btc1 " +
				"WHERE cntry_gu_id = '" + guId + "' " + 
				"AND rtng_juris_nme = '" + jurisNme + "' " + 
				"AND init_exp_cls_cde = '" + b3InitExp + "' " + 
				"AND COALESCE(end_tms, SYSDATE() + INTERVAL '1 day') > SYSDATE() " ;		

			logger.info("SQL = " + sql);
	
			dbConn.setSQL(sql);
			dbConn.execute();

			if(!dbConn.isEndOfStream())
				pra3rdCtry=dbConn.getNextString();
				logger.info("pra3rdCtry: " + pra3rdCtry );
							
			if (pra3rdCtry != null &&  !pra3rdCtry.equals(""))	
			{
				logger.info("Create FICL segment for tgtIndusClSetID: " + tgtIndusClSetID + " and pra3rdCtry: " + pra3rdCtry);
				String clsfOid = clsfOidByClValue (dbObj, pCon, dbConn, tgtIndusClSetID, pra3rdCtry );		
				createFiclSegment(xml, pra3rdCtry, clsfOid, tgtIndusClSetID, instMnem); 
						
			} else // third_cntry_eq is not found
			{
				logger.info("third_cntry_eq is not found. Check active record");	
				activeFiclOid = null;
				activeFiclOid = activeFiclOid (dbObj, pCon, dbConn, xml, instMnem, tgtIndusClSetID);
					
				if (activeFiclOid != null &&  !activeFiclOid.equals("")) // active record presents
				{
					logger.info("Active record is found. Create DELETE segment");
					createFiclDelSegment (xml, instMnem, activeFiclOid, tgtIndusClSetID );
				}
			} 

			//B3EBTRCTEQ for EBA
			String eba3rdCtry = null;
			jurisNme = "EBA";
			tgtIndusClSetID = "B3EBTRCTEQ";
			
			sql = "SELECT third_cntry_eq FROM ft_t_btc1 " +
				"WHERE cntry_gu_id = '" + guId + "' " + 
				"AND rtng_juris_nme = '" + jurisNme + "' " + 
				"AND init_exp_cls_cde = '" + b3InitExp + "' " + 
				"AND COALESCE(end_tms, SYSDATE() + INTERVAL '1 day') > SYSDATE()" ;			

			logger.info("SQL = " + sql);
	
			dbConn.setSQL(sql);
			dbConn.execute();

			if(!dbConn.isEndOfStream())
				eba3rdCtry=dbConn.getNextString();
				logger.info("eba3rdCtry: " + eba3rdCtry );
							
			if (eba3rdCtry != null &&  !eba3rdCtry.equals(""))	
			{
				logger.info("Create FICL segment");
				String clsfOid = clsfOidByClValue (dbObj, pCon, dbConn, tgtIndusClSetID, eba3rdCtry );		
				createFiclSegment(xml, eba3rdCtry, clsfOid, tgtIndusClSetID, instMnem); 
						
			} else // third_cntry_eq is not found
			{
				logger.info("third_cntry_eq is not found. Check active record");		
				activeFiclOid = null;
				activeFiclOid = activeFiclOid (dbObj, pCon, dbConn, xml, instMnem, tgtIndusClSetID);
					
				if (activeFiclOid != null &&  !activeFiclOid.equals("")) // active record presents
				{
					logger.info("Active record is found. Create DELETE segment");
					createFiclDelSegment (xml, instMnem, activeFiclOid, tgtIndusClSetID );
				}
			} 			
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
		
	private void createFiclSegment(XMLMessage xml, String clValue, String clsfOid, String indusClSetId, String instMnem )
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

	
	
	private void createFiclDelSegment(XMLMessage xml, String instMnem, String finsClsfOid, String indusClSetId  )
	{
		
		// Set A_D_DELETE as action type so that this segment will not trigger other rules 
		SegmentId newSeg = xml.addSegment( XMLMessage.A_D_DELETE,"FinancialInstitutionClassification");
		xml.setSegmentAttribute(newSeg, "MATCH", "FICL_MATCH_SET");
		xml.setSegmentAttribute(newSeg, "TSATTRIBUTE", "CLSF_OID");
		xml.setSegmentAttribute(newSeg, "TSOPTION", "Y");
		xml.setSegmentAttribute(newSeg, "ERROR", "N");
		xml.addField("FINS_CLSF_OID", newSeg, finsClsfOid);
		xml.addField("INDUS_CL_SET_ID", newSeg, indusClSetId);
		xml.addField("INST_MNEM", newSeg, instMnem);
		xml.addField("CLSF_PURP_TYP", newSeg, "INDCLASS");		
				
		if(logger.isInfoEnabled())
			logger.info(indusClSetId + " Delete Segment added");
	}
	
	private String activeFiclOid (DatabaseObjectContainer dbObj, ProcessorContext pCon, DatabaseAccess dbConn, XMLMessage xml, String instMnem, String indusClSetId )
	{
	// return active FINS_CLSF_OID
		String finsClsfOid = null;
		String sql_ficl = "SELECT fins_clsf_oid FROM ft_t_ficl " +
		"WHERE indus_cl_set_id ='" + indusClSetId + "' " +
		"AND COALESCE(end_tms, SYSDATE() + INTERVAL '1 day') > SYSDATE() " +
		"AND inst_mnem ='" + instMnem + "' " ;
	
		logger.info("SQL = " + sql_ficl);
		
		dbConn.setSQL(sql_ficl);
		dbConn.execute();
		
		if(!dbConn.isEndOfStream())
			finsClsfOid=dbConn.getNextString();
				
		return finsClsfOid;
	}
	
	private String clsfOidByClValue (DatabaseObjectContainer dbObj, ProcessorContext pCon, DatabaseAccess dbConn, String indusClSetId, String clValue )
	{
	// return CLSF_OID
		String clsfOid = null;
		String inclSql = "SELECT clsf_oid FROM ft_t_incl " +
		"WHERE indus_cl_set_id ='" + indusClSetId + "' " +
		"AND COALESCE(end_tms, SYSDATE() + INTERVAL '1 day') > SYSDATE() " +
		"AND cl_value='" + clValue + "'";
	
		logger.info("SQL = " + clsfOid);
		
		dbConn.setSQL(inclSql);
		dbConn.execute();
		
		if(!dbConn.isEndOfStream())
			clsfOid=dbConn.getNextString();
				
		return clsfOid;
	}

}
