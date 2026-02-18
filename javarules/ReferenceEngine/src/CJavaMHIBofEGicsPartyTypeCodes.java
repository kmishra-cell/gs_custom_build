//package com.mizuho.rd.securitymaster.rules;

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


public class CJavaMHIBofEGicsPartyTypeCodes implements JavaRule 
{
	private final static Logger logger = Logger.getLogger(CJavaMHIBofEGicsPartyTypeCodes.class);
	String prtPurpTyp;
	
	private static String sqlIRCL =	"SELECT clsf_oid, cl_value FROM ft_t_ficl " +
									"WHERE indus_cl_set_id = :INDUS_CL_SET_ID<char[41]> " +
									"AND COALESCE(end_tms, SYSDATE() + INTERVAL '1 day') > SYSDATE() " +
									"AND inst_mnem =:INST_MNEM<char[11]>";
	
	private class inclParent
	{
		public String clsfOid = null;
		public String indusClSetId = null;
		public String clValue = null;
	}

	public boolean initialize(String[] params) 
	{
		prtPurpTyp = params[0];
		return true;
	}

	public boolean process(XMLMessage xml, DatabaseObjectContainer dbObj, ProcessorContext pCon, DatabaseAccess dbConn, NotificationCreator notfcn) throws GSException 
	{		
		try 
		{
			logger.info("Inside CJavaMHIBofEGicsPartyTypeCodes.process()");			
		//	logger.info("Message is " + xml.getXMLString());
		
		
		 if(logger.isDebugEnabled())
            logger.debug("xml: " + xml.getXMLString());

			//If ProductMaster asset load, Exit (EG-7826) 
			//String dataSourceId = xml.getStringField("DATA_SRC_ID", new SegmentId(0));
			String dataSourceId = null;
            try {
                dataSourceId = xml.getStringField("DATA_SRC_ID", new SegmentId(0));
            } catch (Exception ex) {
                logger.error("Failed to get DATA_SRC_ID: " + ex.getMessage());
                return true;
            }
			
            if("PM".equalsIgnoreCase(dataSourceId)){
                  logger.info("Message is from MHSC ProductMaster. Exiting");
                  return true;
            }
			
			//SegmentId currSeg = pCon.getCurrentSegmentId();
			//String segName = xml.getSegmentType(currSeg);
			SegmentId currSeg = null;
            try {
                currSeg = pCon.getCurrentSegmentId();
            } catch (Exception segEx) {
                logger.error("Could not fetch current segment: " + segEx.getMessage());
                return true;
            }
            String segName = null;
            try {
                segName = xml.getSegmentType(currSeg);
            } catch (Exception ex) {
                logger.error("Could not get segment type for segment: " + currSeg + ". Exception: " + ex.getMessage());
                return true;
            }
			
			String instrIssrId = null;
			String instMnem = null;
			
			if ("ISSRIssuerGroupParticipant".equalsIgnoreCase(segName)) 
			{
				instrIssrId = xml.getStringField("INSTR_ISSR_ID", currSeg);
				
				if (instrIssrId == null || instrIssrId.equals(""))
				{
					logger.info("INSTR_ISSR_ID is NULL. Exiting");
					return true;
				}
				
				logger.info("INSTR_ISSR_ID is:" + instrIssrId);
				
				String sql = 	"SELECT fins_inst_mnem from FT_T_ISSR " +
				"WHERE instr_issr_id = '" + instrIssrId + "'" +
				"AND COALESCE(end_tms, SYSDATE() + INTERVAL '1 day') > SYSDATE()";

				dbConn.setSQL(sql);
				dbConn.execute();

				if(!dbConn.isEndOfStream())
					instMnem=dbConn.getNextString();
				
				if (instMnem == null || instMnem.equals(""))
				{
					logger.info("INST_MNEM is NULL. Exiting");
					return true;
				}
				
			} else
			{
				String mainIssueType  = xml.getStringField("MAIN_ENTITY_TBL_TYP", new SegmentId(0));
				
				
				if (mainIssueType == null || (!mainIssueType.equals("FINS") && !mainIssueType.equals("ISSR") && !mainIssueType.equals("CUST")))
				{
					logger.info("Not a CUST, FINS or ISSR. Exiting");
					logger.info("Variable mainIssueType detected:" + mainIssueType);
					return true;
				}
				
				
				//If FINS record, then find inst_mnem
				if (mainIssueType.equals("FINS") || mainIssueType.equals("CUST"))
				{
					instMnem = xml.getStringField("INST_MNEM", new SegmentId(0));
		
					if (instMnem == null || instMnem.equals(""))
					{
						logger.info("INST_MNEM is NULL. Exiting");
						return true;
					}
				}
				
				//If ISSR record then find inst_mnem
				
				if (mainIssueType.equals("ISSR"))
				{
					instrIssrId = xml.getStringField("INSTR_ISSR_ID", new SegmentId(0));
					logger.info("INSTR_ISSR_ID is:" + instrIssrId);
					
					String sql = 	"SELECT fins_inst_mnem from FT_T_ISSR " +
					"WHERE instr_issr_id = '" + instrIssrId + "'" +
					"AND COALESCE(end_tms, SYSDATE() + INTERVAL '1 day') > SYSDATE()";
	
					dbConn.setSQL(sql);
					dbConn.execute();
	
					if(!dbConn.isEndOfStream())
						instMnem=dbConn.getNextString();
					
					if (instMnem == null || instMnem.equals(""))
					{
						logger.info("INST_MNEM is NULL. Exiting");
						return true;
					}
					
				}
		
				if(logger.isInfoEnabled())
					logger.info("INST_MNEM = " + instMnem);
	
				if (prtPurpTyp != null && !prtPurpTyp.equals(""))
				{
					//Check in IOI Group(s)
					String[] issrGrpArray = prtPurpTyp.split(",");
					boolean irgpMember = false;
					
					
					String sql = 	"SELECT instr_issr_id from FT_T_ISSR " +
									"WHERE fins_inst_mnem = '" + instMnem + "'" +
									"AND COALESCE(end_tms, SYSDATE() + INTERVAL '1 day') > SYSDATE()";
					
					dbConn.setSQL(sql);
					dbConn.execute();
			
					if(!dbConn.isEndOfStream())
						instrIssrId=dbConn.getNextString();
					
					for(int i=0; i < issrGrpArray.length; i++)
					{
						irgpMember = Common.checkIrgpExists(dbConn, issrGrpArray[i], instrIssrId, logger);
						if (irgpMember == true)
							break;
					}
					SegmentId irgpSegId=null;
					irgpSegId=Common.getSegmentId("ISSRIssuerGroupParticipant", xml);
					
					if (irgpMember == false && irgpSegId==null)
					{
						if(logger.isInfoEnabled())
							logger.info("Not in any of the groups. Exiting");
						
						return true;
					}
				}
			}
			
			String msgClassification = xml.getStringField("MSG_CLASSIFICATION", new SegmentId(0));
			
			SegmentId newSeg = xml.addSegment( XMLMessage.A_REFERENCE,"FinancialInstitution");
			xml.addField("INST_MNEM", newSeg, instMnem);
			
			//Get BBINDGRP
			String bbIndGrp = null;
	
			String sql = 	"SELECT cl_value FROM ft_t_ficl " +
							"WHERE indus_cl_set_id = 'BBINDGRP' " +
							"AND COALESCE(end_tms, SYSDATE() + INTERVAL '1 day') > SYSDATE() " +
							"AND inst_mnem ='" + instMnem + "'";
	
			if(logger.isInfoEnabled())
				logger.info("SQL = " + sql);
		

			dbConn.setSQL(sql);
			dbConn.execute();
	
			if(!dbConn.isEndOfStream())
				bbIndGrp=dbConn.getNextString();
	
			//GICS Code
			if (bbIndGrp != null && !bbIndGrp.equals(""))
			{
				if(logger.isInfoEnabled())
					logger.info("bbIndGrp = " + bbIndGrp);

				sql =	"SELECT intrnl_dmn_val_nme FROM ft_t_idmv " +
						"WHERE intrnl_dmn_val_txt = '" + bbIndGrp + "' " +
						"AND fld_data_cl_id = 'GICINDGR'";
	
				if(logger.isInfoEnabled())
					logger.info("GICS SQL = " + sql);
	
				dbConn.setSQL(sql);
				dbConn.execute();
	
				String gicsCode = null;
	
				if(!dbConn.isEndOfStream())
					gicsCode=dbConn.getNextString();
	
				if (gicsCode != null && !gicsCode.equals(""))
				{
					sql =	"SELECT clsf_oid FROM ft_t_incl " +
							"WHERE indus_cl_set_id = 'GICS' " + 
							"AND cl_value = '" + gicsCode + "'";
	
					if(logger.isInfoEnabled())
						logger.info("clsfOid SQL = " + sql);
	
					dbConn.setSQL(sql);
					dbConn.execute();
	
					String clsfOid = null;
	
					if(!dbConn.isEndOfStream())
						clsfOid=dbConn.getNextString();
	
					if (clsfOid != null && !clsfOid.equals(""))
					{
						if(!lockedRecord(dbConn, "GICS",instMnem)){
							createFiclSegment(xml, gicsCode, clsfOid, "GICS",instMnem);
						} else
							logger.info("Locked record. No GICS update");
	
					} else
					{
						logger.error("GICS code " + gicsCode + " missing from FT_T_INCL. Unable to add code");
						if(!"WEBMSG".equalsIgnoreCase(msgClassification)){
							String[] param = {"GicsCode"};
							String[] paramVal = {gicsCode};
							notfcn.raiseException("STRDATA","RULEPRC", 50002, param, paramVal);
						}
					}
				} else
				{
					logger.error("No GICS code found in IDMV table for BBINDGRP " + bbIndGrp);
					if(!"WEBMSG".equalsIgnoreCase(msgClassification)){
						String[] param = {"BBIndGrp"};
						String[] paramVal = {bbIndGrp};
						notfcn.raiseException("STRDATA","RULEPRC", 50003, param, paramVal);
					}
				}
			}else
			{
				logger.error("No BBINDGRP found in FT_T_FICL table. Unable to derive GICS code");

				if(!"WEBMSG".equalsIgnoreCase(msgClassification))
					notfcn.raiseException("STRDATA","RULEPRC", 50004, null, null);
			}
	
			//BOE Code
			sql =	"SELECT trim(gu_id) FROM ft_t_figu " +
					"WHERE fins_gu_purp_typ = 'DOMICILE' " +
					"AND gu_typ = 'COUNTRY' " +
					"AND inst_mnem =:INST_MNEM<char[11]> " +
					"AND end_tms IS NULL";
	
			if(logger.isInfoEnabled())
				logger.info("SQL = " + sql);
	
			dbConn.setSQL(sql);
			dbConn.addParameter(instMnem);
			dbConn.execute();
	
			String country = null;
	
			if(!dbConn.isEndOfStream())
				country=dbConn.getNextString();
	
			if (country == null || country.equals(""))
			{
				logger.error("No Country of Domicile. Exiting");

				if(!"WEBMSG".equalsIgnoreCase(msgClassification))
					notfcn.raiseException("STRDATA","RULEPRC", 50005, null, null);

				return true;
			}
			
			if(logger.isInfoEnabled())
				logger.info("country = " + country);

			//Try BBINDSGR
			logger.info("Getting BBINDSGR FICL");

			dbConn.setSQL(sqlIRCL);
			dbConn.addParameter("BBINDSGR");
			dbConn.addParameter(instMnem);
			dbConn.execute();

			String clsfOid = null;
			String clValue = null;
			
			if (!dbConn.isEndOfStream())
			{
				clsfOid = dbConn.getNextString();
				clValue = dbConn.getNextString();
			}

			inclParent boeIncl = null;
			
			if (clsfOid != null && clValue != null)	boeIncl = getInclParent(dbConn, clValue, clsfOid, "BBINDSGR");

			if (boeIncl == null || boeIncl.indusClSetId == null || !boeIncl.indusClSetId.equals("BOE"))  
			{
				logger.info("No BOE code found for BBINDSGR");

				if (bbIndGrp != null && !bbIndGrp.equals(""))
				{
					//Try BBINDGRP
					dbConn.setSQL(sqlIRCL);
					dbConn.addParameter("BBINDGRP");
					dbConn.addParameter(instMnem);
					dbConn.execute();
					
					clsfOid = null;
					clValue = null;

					if (!dbConn.isEndOfStream())
					{
						clsfOid = dbConn.getNextString();
						clValue = dbConn.getNextString();
					}

					if (clsfOid != null && clValue != null)	boeIncl = getInclParent(dbConn, clValue, clsfOid, "BBINDGRP");
				} 
				else
				{
					logger.info("No BBINDGRP found");
				}
			}
	
			if (boeIncl == null || boeIncl.indusClSetId == null || !boeIncl.indusClSetId.equals("BOE"))
			{
				logger.info("No BOE code found for BBINDGRP");
	
				//Try BBINDSEC
				dbConn.setSQL(sqlIRCL);
				dbConn.addParameter("BBINDSEC");
				dbConn.addParameter(instMnem);
				dbConn.execute();
				
				clsfOid = null;
				clValue = null;

				if (!dbConn.isEndOfStream())
				{
					clsfOid = dbConn.getNextString();
					clValue = dbConn.getNextString();
				}

				if (clsfOid != null && clValue != null)	boeIncl = getInclParent(dbConn, clValue, clsfOid, "BBINDSEC");
			}
	
			if (boeIncl != null && "BOE".equals(boeIncl.indusClSetId))
			{
				inclParent gbBoeIncl = getInclParent(dbConn, boeIncl.clValue, boeIncl.clsfOid, boeIncl.indusClSetId);
				
				if (country.equals("GB"))
				{
					if (boeIncl != null && "BOE".equals(gbBoeIncl.indusClSetId))
					{
						if(!lockedRecord(dbConn, gbBoeIncl.indusClSetId, instMnem)){
							createFiclSegment(xml, gbBoeIncl.clValue, gbBoeIncl.clsfOid, gbBoeIncl.indusClSetId, instMnem);
							logger.info("UK BOE code segment added");
						} else
							logger.info("Locked record. No UK BOE update");
					}
					else
					{
						logger.error("No GB BOE code found for " + boeIncl.indusClSetId + " value of " + boeIncl.clValue);
						
						if(!"WEBMSG".equalsIgnoreCase(msgClassification))
							notfcn.raiseException("STRDATA","RULEPRC", 50005, null, null);

						return true;
					}
				}
				else
				{
					if(!lockedRecord(dbConn, boeIncl.indusClSetId, instMnem)){
						createFiclSegment(xml, boeIncl.clValue, boeIncl.clsfOid, boeIncl.indusClSetId, instMnem);
						logger.info("Non-UK BOE code segment added");
					} else
						logger.info("Locked record. No Non-UK BOE update");
					
				}
				
				//Add Party Type
				if (gbBoeIncl != null && "PARTYTYP".equals(gbBoeIncl.indusClSetId) && !"GB".equals(country))
				{
					if(!lockedRecord(dbConn, gbBoeIncl.indusClSetId, instMnem)){
						createFiclSegment(xml, gbBoeIncl.clValue, gbBoeIncl.clsfOid, gbBoeIncl.indusClSetId, instMnem);
						logger.info("Non-UK Party code segment added. Non-UK BOE has no UK equivalent");
					} else
						logger.info("Locked record. No Party code update");
					return true;
				}
				
				inclParent partyType = getInclParent(dbConn, gbBoeIncl.clValue, gbBoeIncl.clsfOid, gbBoeIncl.indusClSetId);
				
				if (partyType == null || partyType.indusClSetId == null || !partyType.indusClSetId.equals("PARTYTYP"))
				{
					logger.error("No Party Type found for:-");
					logger.error("Non-UK BOE value of " + boeIncl.clValue);
					logger.error("UK BOE value of " + gbBoeIncl.clValue);
					if(!"WEBMSG".equalsIgnoreCase(msgClassification)){
						String[] param = {"UkBOE","UkBOE"};
						String[] paramVal = {gbBoeIncl.clValue,boeIncl.clValue};
						notfcn.raiseException("STRDATA","RULEPRC", 50006, param, paramVal);
					}
					return true;
				}
				
				//Hard coded Party Type for UK BOE 20059 as it's different from Non-UK BOE 20059
				if (country.equals("GB") && gbBoeIncl.clValue.equals("20059"))
				{
					dbConn.setSQL(	"SELECT clsf_oid FROM ft_t_incl " +
									"WHERE indus_cl_set_id='PARTYTYP' " +
									"AND cl_value='Building Societies'");
					dbConn.execute();
					if(!lockedRecord(dbConn, partyType.indusClSetId, instMnem)){
						createFiclSegment(xml, "Building Societies", dbConn.getNextString(), partyType.indusClSetId, instMnem);
						logger.info("Hardcoded UK Party type segment added for 20059");
					} else
						logger.info("Locked record. No Party code update for 20059");

					return true;
				}
				
				if(!lockedRecord(dbConn, partyType.indusClSetId, instMnem)){
					createFiclSegment(xml, partyType.clValue, partyType.clsfOid, partyType.indusClSetId, instMnem);
					logger.info("Party type segment added");
				} else
					logger.info("Locked record. No Party type update");
					
			}
			else
			{
				logger.error("No BOE found. Hence, also no Party Type");
				if(!"WEBMSG".equalsIgnoreCase(msgClassification))
					notfcn.raiseException("STRDATA","RULEPRC", 50005, null, null);
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
	
	private inclParent getInclParent(DatabaseAccess db, String clValue, String clsfOid, String indusClSetId) throws Exception
	{
		inclParent inclString = null;
		
		String sql =	"SELECT p.clsf_oid, p.indus_cl_set_id, p.cl_value " +
						"FROM ft_t_incl p, ft_t_incl c " +
						"WHERE p.clsf_oid=c.prnt_clsf_oid " +
						"AND p.cl_value=c.prnt_cl_value " +
						"AND c.indus_cl_set_id=:INDUS_CL_SET_ID<char[11]> " +
						"AND c.cl_value=:CL_VALUE<char[41]>";
		
		if (clsfOid != null) sql = sql + " AND c.clsf_oid=:CLSF_OID<char[11]> ";
		
		try 
		{
			db.setSQL(sql);
		
			db.addParameter(indusClSetId);
		
			db.addParameter(clValue);
		
			if (clsfOid != null) db.addParameter(clsfOid);
		
			db.execute();
			
			if (db.isEndOfStream()) return null;
			
			while(!db.isEndOfStream())
			{
				inclString = new CJavaMHIBofEGicsPartyTypeCodes().new inclParent();
				
				inclString.clsfOid=db.getNextString().trim();
				
				if(logger.isInfoEnabled())
					logger.info("clsf_oid - '" + inclString.clsfOid + "'");
				
				inclString.indusClSetId=db.getNextString().trim();
				
				if(logger.isInfoEnabled())
					logger.info("indus_cl_set_id - '" + inclString.indusClSetId + "'");
				
				inclString.clValue=db.getNextString().trim();
				
				if(logger.isInfoEnabled())
					logger.info("cl_value - '" + inclString.clValue + "'");
			}
		}
		catch (Exception e)
		{
			throw new Exception("SQL Error - " + e.getMessage() + ", for SQL = " + sql);
		}
		finally
		{
			db.close();
		}
		
		return inclString;
	}
	
	private void createFiclSegment(XMLMessage xml, String clValue, String clsfOid, String indusClSetId, String instMnem)
	{
		SegmentId newSeg = xml.addSegment( XMLMessage.A_UNKNOWN,"FinancialInstitutionClassification");
		xml.setSegmentAttribute(newSeg, "MATCH", "FICL_MATCH_SET");
		xml.setSegmentAttribute(newSeg, "TSATTRIBUTE", "CLSF_OID");
		xml.setSegmentAttribute(newSeg, "TSOPTION", "Y");
		xml.addField("CL_VALUE", newSeg, clValue);
		xml.addField("CLSF_OID", newSeg, clsfOid);
		xml.addField("INDUS_CL_SET_ID", newSeg, indusClSetId);
		xml.addField("INST_MNEM", newSeg, instMnem);
		xml.addField("CLSF_PURP_TYP", newSeg, "INDCLASS");		
		
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.HOUR_OF_DAY, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);
		cal.set(Calendar.MILLISECOND, 0);
		Date today = cal.getTime();
		
		xml.addField("START_TMS", newSeg, today);
		xml.setFieldAttribute("START_TMS", newSeg, "INSERT_ONLY", "Y");
		
		if(logger.isInfoEnabled())
			logger.info(indusClSetId + " Segment added");
	}
	private boolean lockedRecord(DatabaseAccess db, String indusClSetId, String instMnem)
	{
		String sql =	"select count(*) from ft_t_ovrc " +
						"where  OVR_REF_OID = '"+ instMnem+ "' " +
						"and end_tms is null " +
						"and OVR_TBL_KEY_TXT in (select 'FINS_CLSF_OID='||fins_clsf_oid||';' " +
						"from ft_t_ficl " +
						"where indus_cl_set_id = '"+ indusClSetId+ "' " +
						"and inst_mnem = '"+ instMnem+ "' " +
						"and end_tms is null)";
		db.setSQL(sql);
		db.execute();
		
		int cnt = db.getNextInt();
		
		if(logger.isInfoEnabled())
			logger.info("sql: " + sql);
			logger.info("Lock count: " + cnt);
		
		if (cnt > 0){
			return true;
		} else
			return false;
		
	}
}
