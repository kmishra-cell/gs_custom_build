import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.*;


import org.apache.log4j.Logger;

import com.thegoldensource.jbre.DatabaseAccess;
import com.thegoldensource.jbre.DatabaseObjectContainer;
import com.thegoldensource.jbre.GSException;
import com.thegoldensource.jbre.JavaRule;
import com.thegoldensource.jbre.NotificationCreator;
import com.thegoldensource.jbre.ProcessorContext;
import com.thegoldensource.jbre.SegmentId;
import com.thegoldensource.jbre.XMLMessage;


public class CJavaMHIHqlaCopyToExchanges implements JavaRule
{
	private final static Logger logger = Logger.getLogger(CJavaMHIHqlaCopyToExchanges.class);
	String[] rissParams;

	public boolean initialize(String[] params)
	{
		logger.info("Initializing CJavaMHIHqlaCopyToExchanges Rule");
		return true;
	}

	public boolean process(XMLMessage xml, DatabaseObjectContainer dbObj, ProcessorContext pCon, DatabaseAccess dbConn, NotificationCreator notfcn) throws GSException
	{

		if(logger.isInfoEnabled())
			logger.info("CJavaMHIHqlaCopyToExchanges.process()");


		String mainEntityTblTyp = xml.getStringField("MAIN_ENTITY_TBL_TYP", new SegmentId(0));

		if(null == mainEntityTblTyp || !"ISSU".equalsIgnoreCase(mainEntityTblTyp)){
			logger.info("mainEntityTblTyp: " + mainEntityTblTyp + ". Exiting");
			return true;
		}
		// get segment count before adding any new segments 
		// otherwise the code will pick up the new segments added later in this rule
		// and keep iterating too far
		int segmentCount = xml.getSegmentCount();
		logger.info("Segment count is " + segmentCount);

      if(logger.isDebugEnabled())
          logger.debug("xml: " + xml.getXMLString());

		for(int i=0; i < segmentCount; i++) {
			SegmentId segId = new SegmentId(i);
			String segType = xml.getSegmentType(segId);
			String segAction = xml.getAction(segId);

			logger.info("Segment number " + i + ", segType: " + segType + ", segAction: " + segAction);

			if ("ISSUIssueHighQltyLiquidityAssetDetails".equals(segType) && "UNKNOWN".equals(segAction)) {
				logger.info("Found a segment called " + segType);
				String segMtkOid = xml.getStringField("MKT_OID", segId);
				logger.info("Found MKT_OID = " + segMtkOid);
				if(null == segMtkOid) {
					logger.info("Skipping segment as no MKT_OID found");
				}else {
					logger.info("got an OID");
					String instrId = xml.getStringField("INSTR_ID", segId);
					logger.info("Found INSTR_ID = >" + instrId + "<");
					if (instrId == null) {
						logger.info("Skipping segment as no INSTR_ID found");
					} else {	
						String getMktInfoSql = "select GU_ID, GU_TYP from FT_T_MRKT where MKT_OID = '" + segMtkOid + "'";
						dbConn.setSQL(getMktInfoSql);
						dbConn.execute();
						// GU_ID and DU_TYP are returned with a trailing space, so trim these before comparing values
						String mktGuId = dbConn.getNextString();
						mktGuId=mktGuId.trim();
						logger.info("This market has GU_ID = >" + mktGuId + "<");
						String mktGuTyp = dbConn.getNextString();
						mktGuTyp = mktGuTyp.trim();
						logger.info("This market has GU_TYP = >" + mktGuTyp + "<");
						if ("COUNTRY".equals(mktGuTyp)) {
							logger.info("This is a candidate for checking");
							String getMktOidsSql = "SELECT MKT_OID FROM FT_T_ISID WHERE INSTR_ID = '" + instrId + "' AND ID_CTXT_TYP = 'MHILIST' AND END_TMS IS NULL AND MKT_OID IS NOT NULL" + " AND MKT_OID IN (SELECT MKT_OID FROM FT_T_MRKT WHERE GU_ID = '" + mktGuId + "' AND MKT_OID != '" + segMtkOid + "' AND END_TMS IS NULL)";
							logger.info("SQL Query is: " + getMktOidsSql );
							dbConn.setSQL(getMktOidsSql);
							dbConn.execute();
							String newMktOid = null;
							 if (!dbConn.isEndOfStream()) {
										newMktOid = dbConn.getNextString();
								}  
								///This line of code causing indexOutOfBounds error 29/8/25	
	
							if(!(newMktOid == null)) {
								List<String> mktOidArrayList = new ArrayList<String>();
	
								while (!(newMktOid == null)) {
									newMktOid = newMktOid.trim();
									logger.info("This MKT_OID = >" + newMktOid + "<" );
									mktOidArrayList.add(newMktOid);
									
									if (!dbConn.isEndOfStream()) {
											newMktOid = dbConn.getNextString();
										} else
										{
										newMktOid = null;
										}
										
									//newMktOid = dbConn.getNextString();		This line of code causing indexOutOfBounds error 8/8/25					
								}
								logger.info("Market OID ArrayList = " + mktOidArrayList.toString());
	
								// Get all fields and attributes from the existing segment
								// These are used to create a new segment
	
								String tsAttribute = xml.getSegmentAttribute(segId, "TSATTRIBUTE");
								logger.info("TSATTRIBUTE = " + tsAttribute);
	
								String tsOption = xml.getSegmentAttribute(segId, "TSOPTION");
								logger.info("TSOPTION = " + tsOption);


								String dataSrcId = xml.getStringField("DATA_SRC_ID", segId);
								logger.info("DATA_SRC_ID = " + dataSrcId);
	
								String dataStatTyp = xml.getStringField("DATA_STAT_TYP", segId);
								logger.info("DATA_STAT_TYP = " + dataStatTyp);

								String bisAstClEligTyp = "";
								boolean gotbisAstClEligTyp = false;
								try {
									bisAstClEligTyp = xml.getStringField("BIS_AST_CL_ELIG_TYP", segId);
									logger.info("BIS_AST_CL_ELIG_TYP = " + bisAstClEligTyp);
									gotbisAstClEligTyp = true;
								}
								catch (Exception e1) {
									//e1.printStackTrace();
									logger.info("Failed to get BIS_AST_CL_ELIG_TYP from message");
									gotbisAstClEligTyp = false;
									logger.info("Setting gotbisAstClEligTyp to " + gotbisAstClEligTyp);
								}

								String euAstClEligTyp = "";
								boolean goteuAstClEligTyp = false;
								try {
									euAstClEligTyp = xml.getStringField("EU_AST_CL_ELIG_TYP", segId);
									logger.info("EU_AST_CL_ELIG_TYP = " + euAstClEligTyp);
									goteuAstClEligTyp = true;
								}
								catch (Exception e1) {
									//e1.printStackTrace();
									logger.info("Failed to get EU_AST_CL_ELIG_TYP from message");
									goteuAstClEligTyp = false;
									logger.info("Setting goteuAstClEligTyp to " + goteuAstClEligTyp);
								}

								String japaneseAstClEligTyp = "";
								boolean gotjapaneseAstClEligTyp = false;
								try {
									japaneseAstClEligTyp = xml.getStringField("JAPANESE_AST_CL_ELIG_TYP", segId);
									logger.info("JAPANESE_AST_CL_ELIG_TYP = " + japaneseAstClEligTyp);
									gotjapaneseAstClEligTyp = true;
								}
								catch (Exception e1) {
									//e1.printStackTrace();
									logger.info("Failed to get JAPANESE_AST_CL_ELIG_TYP from message");
									gotjapaneseAstClEligTyp = false;
									logger.info("Setting gotjapaneseAstClEligTyp to " + gotjapaneseAstClEligTyp);
								}

								Date maxPrdDrop30dDte= new Date();
								boolean gotmaxPrdDrop30dDte;
								try {
									maxPrdDrop30dDte = xml.getDateTimeField("MAX_PRC_DROP_30D_DTE", segId);
									logger.info("MAX_PRC_DROP_30D_DTE = " + maxPrdDrop30dDte.toString());
									gotmaxPrdDrop30dDte = true;
								}
								catch (Exception e1) {
										//e1.printStackTrace();
										logger.info("Failed to get MAX_PRC_DROP_30D_DTE from message");
										gotmaxPrdDrop30dDte = false;
										logger.info("Setting gotmaxPrdDrop30dDte to " + gotmaxPrdDrop30dDte);
								}

								String oecdMemberCountryInd  = "";
								boolean gotoecdMemberCountryInd = false;
								try {
									oecdMemberCountryInd  = xml.getStringField("OECD_MEMBER_COUNTRY_IND", segId);
									gotoecdMemberCountryInd = true;
									logger.info("OECD_MEMBER_COUNTRY_IND = " + oecdMemberCountryInd);
								}
								catch (Exception e1) {
									//e1.printStackTrace();
									logger.info("Failed to get OECD_MEMBER_COUNTRY_IND from message");
									gotoecdMemberCountryInd = false;
									logger.info("Setting gotoecdMemberCountryInd to " + gotoecdMemberCountryInd);
								}

								String oecdMemberCrcTyp  = "";
								boolean gotoecdMemberCrcTyp= false;
								try {
									oecdMemberCrcTyp = xml.getStringField("OECD_MEMBER_CRC_TYP", segId);
									gotoecdMemberCrcTyp= true;
									logger.info("OECD_MEMBER_CRC_TYP = " + oecdMemberCrcTyp);
								}
								catch (Exception e1) {
									//e1.printStackTrace();
									logger.info("Failed to get OECD_MEMBER_CRC_TYP from message");
									gotoecdMemberCrcTyp = false;
									logger.info("Setting gotoecdMemberCountryInd to " + gotoecdMemberCrcTyp);
								}

								BigDecimal prcDrop30dCpct = new BigDecimal("0.0");
								boolean gotprcDrop30dCpct;
								try {
									prcDrop30dCpct = xml.getDecimalField("PRC_DROP_30D_CPCT", segId);
									logger.info("PRC_DROP_30D_CPCT = " + prcDrop30dCpct.toString());
									gotprcDrop30dCpct = true;
								}
								catch (Exception e1) {
									//e1.printStackTrace();
									logger.info("Failed to get PRC_DROP_30D_CPCT from message");
									gotprcDrop30dCpct = false;
									logger.info("Setting gotprcDrop30dCpct to " + gotprcDrop30dCpct);
								}

								Date prcDrop30dStartDte = new Date();
								boolean gotprcDrop30dStartDte;
								try {
									prcDrop30dStartDte = xml.getDateTimeField("PRC_DROP_AN_30D_START_DTE", segId);
									logger.info("PRC_DROP_AN_30D_START_DTE = " + prcDrop30dStartDte.toString());
									gotprcDrop30dStartDte = true;
								}
								catch (Exception e1) {
									//e1.printStackTrace();
									logger.info("Failed to get PRC_DROP_AN_30D_START_DTE from message");
									gotprcDrop30dStartDte = false;
									logger.info("Setting gotprcDrop30dStartDte to " + gotprcDrop30dStartDte);
								}

								String ukAstClEligTyp = "";
								boolean gotukAstClEligTyp = false;
								try {
									ukAstClEligTyp = xml.getStringField("UK_AST_CL_ELIG_TYP", segId);
									gotukAstClEligTyp = true;
									logger.info("UK_AST_CL_ELIG_TYP = " + ukAstClEligTyp);
								}
								catch (Exception e1) {
									//e1.printStackTrace();
									logger.info("Failed to get UK_AST_CL_ELIG_TYP from message");
									gotukAstClEligTyp = false;
									logger.info("Setting gotukAstClEligTyp to " + gotukAstClEligTyp);
								}

								Date startTms = xml.getDateTimeField("START_TMS", segId);
								logger.info("START_TMS = " + startTms.toString());
	
								String startTmsInsertOnlyAttr = xml.getFieldAttribute("START_TMS", segId, "INSERT_ONLY");
	
								for(String thisMktOid: mktOidArrayList) {
	
									logger.info("Add a segment for MKT_OID: " + thisMktOid);
	
									// Create a new segment, set its attributes
									SegmentId ishqSegment = xml.addSegment(XMLMessage.A_UNKNOWN,"ISSUIssueHighQltyLiquidityAssetDetails");
									xml.setSegmentAttribute(ishqSegment, "TSATTRIBUTE", tsAttribute);
									xml.setSegmentAttribute(ishqSegment, "TSOPTION", tsOption);
									xml.setSegmentAttribute(ishqSegment, "SEGPROCESSEDIND", "N");
	
									// add fields to segment

									xml.addField("DATA_SRC_ID", ishqSegment, dataSrcId);
									xml.addField("DATA_STAT_TYP", ishqSegment, dataStatTyp);

									if (gotbisAstClEligTyp){
										logger.info("adding BIS_AST_CL_ELIG_TYP to segment");
										xml.addField("BIS_AST_CL_ELIG_TYP", ishqSegment, bisAstClEligTyp);
									}
									if (goteuAstClEligTyp) {
										logger.info("adding EU_AST_CL_ELIG_TYP to segment");
										xml.addField("EU_AST_CL_ELIG_TYP", ishqSegment, euAstClEligTyp);
									}

									if (gotjapaneseAstClEligTyp) {
										logger.info("adding JAPANESE_AST_CL_ELIG_TYP to segment");
										xml.addField("JAPANESE_AST_CL_ELIG_TYP", ishqSegment, japaneseAstClEligTyp);
									}

									if (gotmaxPrdDrop30dDte) {
										logger.info("adding MAX_PRC_DROP_30D_DTE to segment");
										xml.addField("MAX_PRC_DROP_30D_DTE", ishqSegment, maxPrdDrop30dDte);
										xml.setFieldAttribute("MAX_PRC_DROP_30D_DTE", ishqSegment, "DTYPE", "TMS");
									}
									if (gotoecdMemberCountryInd) {
										logger.info("adding OECD_MEMBER_COUNTRY_IND to segment");
										xml.addField("OECD_MEMBER_COUNTRY_IND", ishqSegment, oecdMemberCountryInd);
									}
									if (gotoecdMemberCrcTyp) {
										logger.info("adding OECD_MEMBER_CRC_TYP to segment");
										xml.addField("OECD_MEMBER_CRC_TYP", ishqSegment, oecdMemberCrcTyp);
									}

									if (gotprcDrop30dCpct) {
										logger.info("adding PRC_DROP_30D_CPCT to segment");
										xml.addField("PRC_DROP_30D_CPCT", ishqSegment, prcDrop30dCpct);
										xml.setFieldAttribute("PRC_DROP_30D_CPCT", ishqSegment, "DTYPE", "LNUM");
									}

									if(gotprcDrop30dStartDte) {
										logger.info("adding PRC_DROP_AN_30D_START_DTE to segment");
										xml.addField("PRC_DROP_AN_30D_START_DTE", ishqSegment, prcDrop30dStartDte);
										xml.setFieldAttribute("PRC_DROP_AN_30D_START_DTE", ishqSegment, "DTYPE", "TMS");
									}
									if (gotukAstClEligTyp) {
										logger.info("adding UK_AST_CL_ELIG_TYP to segment");
										xml.addField("UK_AST_CL_ELIG_TYP", ishqSegment, ukAstClEligTyp);
									}

									xml.addField("START_TMS", ishqSegment, startTms);
									xml.setFieldAttribute("START_TMS", ishqSegment, "INSERT_ONLY", startTmsInsertOnlyAttr);
									xml.addField("INSTR_ID",  ishqSegment, instrId);
									xml.addField("MKT_OID",  ishqSegment, thisMktOid);
									
									if(logger.isDebugEnabled()){
                                logger.debug("xml: " + xml.getXMLString());
								
								logger.info("XML after ading segment for MKT_OID = " + thisMktOid);
								
								}
									
								
								}
	
								if(logger.isDebugEnabled())
                                   logger.debug("xml: " + xml.getXMLString());
							}
							else {
								logger.info("No MKT_OIDs found for this segment");
							}
							logger.info("finished looking for MKT_OID for this segment");
	
						} else {
							logger.info("This is NOT a candidate for checking");
						}
						logger.info("finished looking at this segment");
					} // INSTR_ID in original segment
				} // MKT_OID in original segment

			} // segment name

		}
		logger.info("Exiting rule");
		return true;


	}
}
