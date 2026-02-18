

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
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

public class CJavaMIZSecRefGeneration implements JavaRule 
{
	private static final Logger logger = Logger.getLogger(CJavaMIZSecRefGeneration.class.getName());
	String prtPurpTyp;
	String issueType;
	String instrumentId;
	Map<Double,Integer> couponMaps = new HashMap<Double, Integer>();
	Map<String,String> mappingForCoverer = new HashMap<String, String>();
	List<String> secRefs = new ArrayList<String>();

	@Override
	public boolean initialize(String[] params) 
	{
		String couponMapParams = params[0];
		String[] maps = couponMapParams.split(";");
		for(String map : maps)
		{
			String[] pair = map.split(",");
			couponMaps.put(Double.valueOf(pair[0]), Integer.valueOf(pair[1]));
		}
		
		prtPurpTyp = params[1];
		
		mappingForCoverer.put("Banque Nationale de Paris", "BNP");
		mappingForCoverer.put("Commerzbank", "CMZ");
		mappingForCoverer.put("Credit Suisse First Boston", "CSFB");
		mappingForCoverer.put("JP Morgan", "JPM");
		mappingForCoverer.put("KBC Financial Products", "KBC");
		mappingForCoverer.put("Lehman Brothers", "LEH");
		mappingForCoverer.put("Macquarie Bank Ltd", "MAQ");
		mappingForCoverer.put("Mizuho", "MIZ");
		mappingForCoverer.put("Nomura", "NOM");
		mappingForCoverer.put("Paribas", "PAR");
		mappingForCoverer.put("Swiss Bank Corporation", "SBC");
		mappingForCoverer.put("Societe Generale", "SOCG");
		
		return true;
	}

	@Override
	public boolean process(XMLMessage xmlMsg,DatabaseObjectContainer dbContainer,ProcessorContext pContext,DatabaseAccess conn,NotificationCreator nCreator) throws GSException
	{
		logger.info("CJavaMIZSecRefGeneration.process()");

		String mainIssueType  = xmlMsg.getStringField("MAIN_ENTITY_TBL_TYP", new SegmentId(0));
		issueType  = xmlMsg.getStringField("MAIN_ENTITY_TYP", new SegmentId(0));
		if(logger.isInfoEnabled())
		{
			logger.info("mainIssueType: "+mainIssueType);
			logger.info("issueType: "+issueType);
		}

		if("ISSU".equals(mainIssueType))
		{
			//instrumentId = xmlMsg.getStringField("INSTR_ID", new SegmentId(0));
			instrumentId = pContext.getInstrId();

			if(logger.isInfoEnabled())
				logger.info("instrumentId :"+instrumentId);
			
			// Get ISS_TYP from d/b due to VSH on Vendor ratings feed
			String sql = "SELECT TRIM(ISS_TYP) FROM FT_T_ISSU WHERE INSTR_ID='" + instrumentId + "'";
			conn.setSQL(sql);
			conn.execute();

			if(!conn.isEndOfStream())
				issueType = conn.getNextString();

			if(logger.isInfoEnabled())
				logger.info("issueType: "+issueType);

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
			
			String mktSql = "SELECT mkt_iss_oid, mkt_oid, trdng_curr_cde FROM ft_t_mkis " +
							"WHERE end_tms IS NULL " +
							"AND instr_id = '" + instrumentId + "'";
			
			if(logger.isInfoEnabled())
				logger.info("mktSql: "+mktSql);
			
			conn.setSQL(mktSql);
			conn.execute();

			if(conn.isEndOfStream())
			{
				createSecRef(xmlMsg, conn, pContext, "MKTMICXXXX", null,null);
			}
			else
			{
				List<String> mktIssOids = new ArrayList<String>();
				List<String> mktOids = new ArrayList<String>();
				List<String> trdCurrs = new ArrayList<String>();

				while (!conn.isEndOfStream())
				{
					mktIssOids.add(conn.getNextString());
					mktOids.add(conn.getNextString());
					trdCurrs.add(conn.getNextString());
				}
				
				if(logger.isInfoEnabled())
				{
					logger.info("mktIssOids: " + mktIssOids);
					logger.info("mktOids: " + mktOids);
					logger.info("trdCurrs: " + trdCurrs);
				}
				
				for (int i=0; i< mktOids.size(); i++)
				{
					if(logger.isInfoEnabled())
					{
						logger.info("mktIssOid: " + mktIssOids.get(i));
						logger.info("mktOid: " + mktOids.get(i));
						logger.info("trdCurr: " + trdCurrs.get(i));
					}
					
					createSecRef(xmlMsg, conn, pContext, mktOids.get(i),trdCurrs.get(i), mktIssOids.get(i));
				}
			}
			
			 if(logger.isDebugEnabled())
                  logger.debug("xml: " + xmlMsg.getXMLString());
			
			return true;
			
		}
		logger.info("Not an issue. Exiting");
		return true;
	}

	private void createSecRef(XMLMessage xmlMsg, DatabaseAccess conn, ProcessorContext pContext, String mktOid, String trdCurr, String mktIssOid) throws GSException
	{
		

		SecRefTemplate template = null;

		if("CVTBOND".equals(issueType))
		{
			if (Common.checkIsidExists(conn,"SECREF",instrumentId, mktOid, trdCurr, logger))
				return;

			template = new ConvertibleBondSecRef();
			logger.info("template: ConvertibleBondSecRef()");
			template.setSubType(issueType);
		}
		else if("FUTURES".equals(issueType))
		{
			if (Common.checkIsidExists(conn,"SECREF",instrumentId, mktOid, trdCurr, logger))
				return;
			template = new FuturesSecRef();
			logger.info("template: FuturesSecRef()");
			template.setSubType(issueType);

		}
		else if(	"BOND".equals(issueType) || "FIXDBOND".equals(issueType) || "COML PPR".equals(issueType) ||
					"CERTDEPT".equals(issueType) || "MORTGAGE".equals(issueType) || "ABS".equals(issueType) || "TBOND".equals(issueType) || "LOAN".equals(issueType) || /* EG-7006 Added LOAN */ 
					"ZERO CPN".equals(issueType) ) 																														// EG-7604
		{
			if (Common.checkIsidExists(conn,"SECREF",instrumentId, mktOid, trdCurr, logger))
				return;

			String sql = 	"select cl_value from ft_t_iscl " +
							"where (cl_value = 'MED TERM NOTE' or cl_value like '%MTN' or cl_value = 'EURO CD') " +
							"and instr_id = '"+instrumentId+"'";

			conn.setSQL(sql);
			conn.execute();
			if(conn.isEndOfStream())
			{
				template =  new BondSecRef();
				logger.info("template: BondSecRef()");
				template.setSubType(issueType);
			}
			else
			{
				template =  new MTNSecRef();
				logger.info("template: MTNSecRef()");
				// Commented below as it's never used
				// template.setSubType("MED TERM NOTE");
				// get bond structure from DB 
				String strucsql = 	"SELECT bond_rtr_meth_typ FROM FT_T_BDCH " +
				                    "WHERE END_TMS IS NULL " +
							        "AND INSTR_ID = '"+instrumentId+"'";

			conn.setSQL(strucsql);
			conn.execute();
			if(!conn.isEndOfStream())
			{
				template.setBondStructure(conn.getNextString());
				if(logger.isInfoEnabled())
					logger.info("BondStructure: " + template.getBondStructure());
			}
			
			}
			template.setDecToFractions(couponMaps);
		}
		else if (	"COMMON".equals(issueType) || "EQSHR".equals(issueType) || "WARRANTS".equals(issueType) || "INDEX".equals(issueType) ||
				"PFD".equals(issueType) || "RECEIPTS".equals(issueType)	|| "HYBRID".equals(issueType)	|| "RIGHTS".equals(issueType) || 
				"UNIT".equals(issueType) || "REALESTA".equals(issueType) || "ETF".equals(issueType) || "FUND".equals(issueType) ||				// EG-7604
				"MISC".equals(issueType) || "LTDPART".equals(issueType)) 																		// EG-7604
		{			
			if (Common.checkIsidExists(conn,"SECREF",instrumentId, mktOid, trdCurr, mktIssOid, logger))
				return;
			
			template = new EquitySecRef();
			
			logger.info("template: EquitySecRef()");
			template.setSubType(issueType);

			if("WARRANTS".equals(issueType))
			{
				logger.info("Set the coverer for the warrant");
				String sql = 	"select ft_t_fins.inst_nme from ft_t_frip,ft_t_idmv,ft_t_fldf,ft_t_fins " +
								"where rtrim(ft_t_frip.prt_purp_typ) = ft_t_idmv.intrnl_dmn_val_txt " +
								"and ft_t_idmv.fld_id = ft_t_fldf.fld_id " +
								"and ft_t_fldf.ddl_nme ='PRT_PURP_TYP' " +
								"and ft_t_idmv.intrnl_dmn_val_nme = 'COVERER' " +
								"and ft_t_frip.inst_mnem = ft_t_fins.inst_mnem " +
								"and coalesce(ft_t_frip.end_tms, SYSDATE() + INTERVAL '1 day') > SYSDATE()" +
								"and ft_t_frip.instr_id = '"+instrumentId+"'";

				conn.setSQL(sql);
				conn.execute();
				if(!conn.isEndOfStream())
				{
					template.setMappingForCoverer(mappingForCoverer);
					template.setCoverer(conn.getNextString());
				}
			}

			//set the issuer client ref
			String sql = 	"select irid.issr_id from ft_t_issu issu,ft_t_irid irid " +
							"where irid.issr_id_ctxt_typ = 'CLIENTREF' " +
							"and issu.instr_issr_id = irid.instr_issr_id " +
							"and coalesce(irid.end_tms, SYSDATE() + INTERVAL '1 day') > SYSDATE() " +
							"and issu.instr_id = '"+instrumentId+"'";
			conn.setSQL(sql);
			conn.execute();
			if(!conn.isEndOfStream())
			{
				template.setIssuerClientRef(conn.getNextString());
				if(logger.isInfoEnabled())
					logger.info("IssuerClientRef: " + template.getIssuerClientRef());
			}
		}

		if(template != null)
		{
			String underlyingInstrId = null;
			String denCurr = null;

			int count = xmlMsg.getSegmentCount();
			for(int i=0; i<count; i++)
			{
				SegmentId seg = new SegmentId(i);
				String segName = xmlMsg.getSegmentType(seg);
				//String processInd = xmlMsg.getSegmentAttribute(seg, "SEGPROCESSEDIND");

				if(logger.isInfoEnabled())
				{
					//logger.info("processInd: "+processInd);
					logger.info("segName :"+segName);
				}

				if("Issue".equals(segName))
				{
					Date matDate = xmlMsg.getDateTimeField("MAT_EXP_TMS", seg);
					denCurr = xmlMsg.getStringField("DENOM_CURR_CDE", seg);
					String seriesTyp = xmlMsg.getStringField("SERIES_TYP", seg);

					if (matDate == null || denCurr == null || (seriesTyp == null && template.getClass().getName().equals("BondSecRef")))
					{
						String sql = 	"SELECT MAT_EXP_TMS,DENOM_CURR_CDE, SERIES_TYP FROM FT_T_ISSU "+
										"WHERE INSTR_ID = '" + instrumentId + "'";
						conn.setSQL(sql);
						conn.execute();

						while (!conn.isEndOfStream())
						{
							//matDate = conn.getNextDate();
							matDate = conn.getNextTimestamp();
							if(logger.isInfoEnabled())
								logger.info("matDate: " + matDate);

							denCurr = conn.getNextString();
							if(logger.isInfoEnabled())
								logger.info("denCurr: " + denCurr);

							seriesTyp = conn.getNextString();
							if(logger.isInfoEnabled())
								logger.info("seriesTyp: " + seriesTyp);
						}
					}

					template.setDate(matDate);
					//template.setDenominationCurrency(denCurr);
					template.setSeries(seriesTyp);

					//String issuerId = xmlMsg.getStringField("INSTR_ISSR_ID", seg);
					String sql =       "SELECT r.issr_nme, TRIM(g.gu_id), TRIM(c.cl_value) " +
									   "FROM ft_t_issr r " +
										"LEFT JOIN ft_t_irgu g ON r.instr_issr_id = g.instr_issr_id AND g.end_tms IS NULL AND g.issr_gu_purp_typ = 'DOMICILE' " + 
										"LEFT JOIN ft_t_ircl c ON r.instr_issr_id = c.instr_issr_id AND c.end_tms IS NULL AND c.indus_cl_set_id = 'BBINDSGR' " +
										"WHERE r.instr_issr_id = ( " +
										"SELECT instr_issr_id FROM ft_t_issu " +
										 "WHERE instr_id = '" + instrumentId + "' " + ")";


					conn.setSQL(sql);
					conn.execute();
					if(!conn.isEndOfStream())
					{
						template.setIssuer(conn.getNextString());
						
						if ("JP".equals(conn.getNextString()) && "Sovereign".equals(conn.getNextString()))
						{
							template.japaneseGovt = true;
							logger.info("Issuer is Japanese Government");
						}
					}
				}
/*				else if ("MarketIssueCharacteristics".equals(segName))
				{
					String mkt = xmlMsg.getStringField("MKT_OID", seg);
					
					if (mktOid.equals(mkt))
						tradingCurr = xmlMsg.getStringField("TRDNG_CURR_CDE", seg);
				}
				*/
				else if ("RelatedIssue".equals(segName))
				{
					String relationShip = xmlMsg.getStringField("ISS_PART_RL_TYP", seg);

					if("UNDLYING".equals(relationShip))
						underlyingInstrId = xmlMsg.getStringField("INSTR_ID", seg);

				}
				else if("IssueIdentifier".equals(segName))
				{
					String idType =  xmlMsg.getStringField("ID_CTXT_TYP", seg);
					String idValue = xmlMsg.getStringField("ISS_ID", seg);
					
					if("TICKER".equals(idType)||"BBTRDGSYMB".equals(idType))
					{
						template.setIdentifier(idValue);
					}
					else if("BBCPTICK".equals(idType))
					{
						idValue = idValue.substring(0,idValue.indexOf(" "));
						template.setIdentifier(idValue);
					}
					else if("ISIN".equals(idType))
					{
						template.setIsin(idValue);
					}

				}
				else if("IssueStatistic".equals(segName) && template.getIdentifier() == null)
				{
					String statDefId =  xmlMsg.getStringField("STAT_DEF_ID", seg);
					String statCharValTxt = xmlMsg.getStringField("STAT_CHAR_VAL_TXT", seg);
					
					if("BBTICKER".equals(statDefId))
					{
						template.setIdentifier(statCharValTxt);
					}

				}
				else if("DebtInstrumentCharacteristics".equals(segName))
				{
					template.setCouponType(CouponType.get(xmlMsg.getStringField("CPN_TYP", seg)));
				}
				else if ("DebtInstrumentStatistics".equals(segName))
				{
					BigDecimal couponRate = xmlMsg.getDecimalField("CPN_CRTE", seg);
					if(couponRate != null)
					{
						template.setCouponRate(couponRate.doubleValue());
					}
				}
			}
		
			if (trdCurr != null && !trdCurr.equals(""))
			{
				template.setDenominationCurrency(trdCurr);
			} else
			{
				template.setDenominationCurrency(denCurr);
			}

			if (logger.isInfoEnabled())
			{
				logger.info("UnderlyingDenominationCurrency: " + template.getUnderlyingDenominationCurrency());
			}

			if (logger.isInfoEnabled())
				logger.info("template.getClass().getName(): " + template.getClass().getName());

			if (template.getClass().getName().equals("EquitySecRef") || template.getClass().getName().equals("ConvertibleBondSecRef"))
			{
				String sql1 =	"SELECT distinct ft_t_issu.denom_curr_cde, ft_t_isid.iss_id FROM ft_t_issu " +
								"LEFT OUTER JOIN ft_t_isid ON ft_t_issu.instr_id = ft_t_isid.instr_id " +
								"AND ft_t_isid.id_ctxt_typ in ('TICKER','BBTRDGSYMB','BBCPTICK') " +
								"AND ft_t_isid.mkt_oid =  '" + mktOid + "' " +
								"WHERE ft_t_issu.instr_id";

				if (underlyingInstrId == null || underlyingInstrId.equals(""))
				{
					sql1 = 	sql1 + " IN (SELECT instr_id FROM ft_t_riss " +
							"WHERE iss_part_rl_typ = 'UNDLYING' " +
							"AND rld_iss_feat_id IN (SELECT rld_iss_feat_id FROM ft_t_ridf " +
							"WHERE end_tms is null AND instr_id = '" + instrumentId + "'))";
				} else
				{
					sql1 = 	sql1 + "='" + underlyingInstrId + "'";
				}
				
				if (logger.isInfoEnabled())
					logger.info("sql: " + sql1);

				conn.setSQL(sql1);
				conn.execute();
				if(!conn.isEndOfStream())
				{
					template.setUnderlyingDenominationCurrency(conn.getNextString());
					String undTicker = conn.getNextString();
					
					if (undTicker != null && !undTicker.equals(""))
					{
						if(undTicker.indexOf(" ") != -1)
							template.setIdentifierForUnderlying(undTicker.substring(0,undTicker.indexOf(" ")));
						else
							template.setIdentifierForUnderlying(undTicker);
					}
					
					if (logger.isInfoEnabled())
					{
						logger.info("UnderlyingDenominationCurrency: " + template.getUnderlyingDenominationCurrency());
						logger.info("IdentifierForUnderlying: " + template.getIdentifierForUnderlying());
					}
				}
			}

			if (template.getClass().getName().equals("ConvertibleBondSecRef") && template.getIsin() == null)
			{
				String isin = Common.getIsid(conn, "ISIN", instrumentId, logger);
				if (isin== null)
				{
					logger.info("Convertible Bond but no ISIN found. Exiting");
					return;
				}
			}

			if (template.getIdentifier() == null)
			{
				String ticker = Common.getIsid(conn, "TICKER", instrumentId, mktOid, logger);
				if (ticker == null)
				{
					logger.info("No TICKER found. Trying BBTRDGSYMB");
					ticker = Common.getIsid(conn, "BBTRDGSYMB", instrumentId, mktOid, logger);
					if (ticker == null)
					{
						logger.info("No BBTRDGSYMB found. Trying BBCPTICK");
						ticker = Common.getIsid(conn, "BBCPTICK", instrumentId, mktOid, logger);
						
						if (ticker == null)
						{
							if (!(template.getClass().getName().equals("EquitySecRef") && ("JPY".equals(template.denominationCurrency) || "JPY".equals(template.denominationCurrencyForUnderlying))))
							{
								logger.info("No BBCPTICK found and it's required. Trying ISST");
		
								String sql1 = 	"SELECT stat_char_val_txt FROM ft_t_isst " +
												"WHERE end_tms is null AND stat_def_id = 'BBTICKER' " +
												"AND instr_id = '" + instrumentId + "'";
		
								conn.setSQL(sql1);
								conn.execute();
								
								if(!conn.isEndOfStream())
									ticker = conn.getNextString();
		
								if (ticker == null)
								{
									logger.info("No TICKER found in ISST. Trying IRST");
		
									sql1 = 	"SELECT distinct stat_char_val_txt FROM ft_t_irst " +
											"WHERE end_tms is null AND stat_def_id in ('BBCRPTIC','BBMTGTIC','BBPFDTIC','BBTICKER') " +
											"AND instr_issr_id IN ( SELECT instr_issr_id FROM ft_t_issu " +
											"WHERE instr_id = '" + instrumentId + "')";
		
									conn.setSQL(sql1);
									conn.execute();
									
									if(!conn.isEndOfStream())
										ticker = conn.getNextString();
								}
		
								if (ticker == null)
								{
									logger.info("No TICKER found and it's required. Exiting");
									return;
								}
							}
						} else
						{
							logger.info("BBCPTICK found. Trimming EXCH CODE."); // BBCPTICK ABC
							//ticker = ticker.substring(0,ticker.indexOf(" "));
							//Adding check for index out of bound exception where Ticker has no space
							int spaceIndex = ticker.indexOf(" ");
							if (spaceIndex > 0) {
								ticker = ticker.substring(0, spaceIndex);
							}

						}
					}
				}
				logger.info("Ticker: " + ticker);
				template.setIdentifier(ticker);
			}

			if (!template.getClass().getName().equals("EquitySecRef"))
			{
				if (template.getCouponType() == null)
				{
					String sql1 = 	"SELECT cpn_typ FROM ft_t_bdch " +
									"WHERE instr_id = '" + instrumentId + "' " +
									"AND COALESCE(end_tms, SYSDATE() + INTERVAL '1 day') > SYSDATE() " +
									"AND cpn_typ IS NOT NULL";
					conn.setSQL(sql1);
					conn.execute();

					while (!conn.isEndOfStream())
						template.setCouponType(CouponType.get(conn.getNextString()));

				}

				if (template.getCouponRate() == 0.0)
				{
					String sql1 = 	"SELECT cpn_crte FROM ft_t_bdst " +
									"WHERE instr_id = '" + instrumentId + "' " +
									"AND cpn_crte IS NOT NULL";

					conn.setSQL(sql1);
					conn.execute();

					while (!conn.isEndOfStream())
						template.setCouponRate(conn.getNextDecimal().doubleValue());

				}
			}

			if(logger.isInfoEnabled())
				logger.info("template :" + template);

			if(logger.isInfoEnabled())
			{
				logger.info("getBBTicker(): " + template.getBBTicker());
				logger.info("getDescriptiveElement(): " + template.getDescriptiveElement());
				logger.info("getDate(): " + template.getDate());
				logger.info("getSuffix(): " + template.getSuffix());
			}

			String secRef = template.generateSecRefLiterals();

			if(logger.isInfoEnabled())
				logger.info("secRef: " + secRef + " for mkt " + mktOid);

			if (secRef.contains("null"))
			{
				logger.info("SecRef invalid. Exiting");
				return;
			}
			
			String newSecRef = secRef;
			String suffix = "A";
			int cnt;
			
			do
			{
				cnt=0;
				
				if(logger.isInfoEnabled())
					logger.info("newSecRef: " + newSecRef);
				
				for (int i=0; i < secRefs.size(); i++)
				{
					if(newSecRef.equals(secRefs.get(i)))
					{
						cnt = 1;
						break;
					}
				}
				
				if (cnt == 0)
				{
					String sql1 = 	"SELECT count(*) FROM ft_t_isid " +
									"WHERE id_ctxt_typ = 'SECREF' " +
									"AND iss_id = '" + newSecRef + "'";
		
					conn.setSQL(sql1);
					conn.execute();
		
					cnt = conn.getNextInt();
				}
				
				if (cnt > 0)
				{
					newSecRef = secRef + suffix;
					suffix = Common.increment(suffix);
				}
				
			} while ( cnt > 0 );

			SegmentId secRefSeg = xmlMsg.addSegment(XMLMessage.A_D_UNKNOWN,"IssueIdentifier");
			xmlMsg.addField("INSTR_ID", secRefSeg, instrumentId);
			xmlMsg.addField("ID_CTXT_TYP", secRefSeg, "SECREF");
			xmlMsg.addField("ISS_ID", secRefSeg, newSecRef);
			xmlMsg.addField("MKT_OID", secRefSeg, mktOid);
			xmlMsg.addField("GLOBAL_UNIQ_IND", secRefSeg, "N");
			xmlMsg.addField("DATA_STAT_TYP", secRefSeg, "ACTIVE");
			
			String isidOid = pContext.getOid();
			xmlMsg.addField("ISID_OID", secRefSeg, isidOid);

			if (trdCurr==null || "".equals(trdCurr))
			{
				xmlMsg.setSegmentAttribute(secRefSeg, "MATCH", "ISID6_CTX_ID_MKT_USG");
			} else
			{
				xmlMsg.setSegmentAttribute(secRefSeg, "MATCH", "ISID15_CTX_ID_MKT_USG_TNGCUR");
				xmlMsg.addField("TRDNG_CURR_CDE", secRefSeg, trdCurr);
			}
			
			Calendar cal = Calendar.getInstance();
			cal.set(Calendar.HOUR_OF_DAY, 0);
			cal.set(Calendar.MINUTE, 0);
			cal.set(Calendar.SECOND, 0);
			cal.set(Calendar.MILLISECOND, 0);
			Date today = cal.getTime();
			
			xmlMsg.addField("START_TMS", secRefSeg, today);
			xmlMsg.setFieldAttribute("START_TMS", secRefSeg, "INSERT_ONLY", "Y");
			
			logger.info("SECREF created");
			secRefs.add(newSecRef);
			
			if (template.getClass().getName().equals("EquitySecRef")
					&& !"MKTMICXXXX".equals(mktOid))
			{
				SegmentId secRefMixrSeg = xmlMsg.addSegment(XMLMessage.A_D_UNKNOWN,"ISIDMarketIssueCrossReference");
				xmlMsg.addField("MKT_ISS_OID", secRefMixrSeg, mktIssOid);
				xmlMsg.addField("ISID_OID", secRefMixrSeg, isidOid);
				xmlMsg.addField("DATA_STAT_TYP", secRefMixrSeg, "ACTIVE");
				xmlMsg.addField("TRDNG_STAT_TYP", secRefMixrSeg, "ACTIVE");
				logger.info("SECREF MIXR created");
			}
			return;
		}				
		logger.info("Template is null. Exiting");
		return;
	}
}