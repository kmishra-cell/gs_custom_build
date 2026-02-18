import com.thegoldensource.jbre.*;

import org.apache.log4j.Logger;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Connection;


public class CJavaMHIFRTBCategoryCheck implements JavaRule {

	private static Logger logger = Logger.getLogger("CJavaMHIFRTBCategoryCheck");
	private String prtPurpTyps;
	
	public boolean initialize(String[] params) {
		prtPurpTyps = params[0];
		logger.info("Initializing CJavaMHIFRTBCategoryCheck Rule");
		return true;
	}

	public boolean process(XMLMessage msg, DatabaseObjectContainer dboc,
			ProcessorContext pContext, DatabaseAccess dbConnection, NotificationCreator notfcn)
	throws GSException {


		String segmentName = pContext.getCurrentSegmentType();
		logger.info("segmentName: " + segmentName);		
		List<SegmentId> segmentIDFICL = new ArrayList<SegmentId>();
		segmentIDFICL = Common.getSegmentIds("FinancialInstitutionClassification", msg);
		List<SegmentId> segmentIDFIRT = new ArrayList<SegmentId>();
		segmentIDFIRT = Common.getSegmentIds("FinancialInstitutionRating", msg);
		String bBIndGrpVal = "";
		String bBIndSubGrpVal = "";
		String indusClSetId = "";
		String indusClVal = "";
		String ficlInstmnem = "";
		String mizRtng2Val = "";
		boolean removeFICLCat1 = false;
		boolean removeISCLCat3 = false;
		boolean bBClsfUpdCheck = false;
		boolean bBIndGrpCheck = false;
		boolean bBIndSubGrpCheck = false;
		
		
    	
          if(logger.isDebugEnabled())
               logger.debug("Beginning of processing MSG = " + msg.getXMLString());

		SegmentId firstSeg = new SegmentId(0);

		String instMnem = "";
		
		if("Final".equalsIgnoreCase(segmentName))
		{
			instMnem = msg.getStringField("INST_MNEM", firstSeg);

			logger.info("instMnem: " + instMnem);

			if (instMnem == null || instMnem.equals(""))
			{
				logger.info("No inst_mnem. Exiting");
				return true;
			}

			if (prtPurpTyps != null && !prtPurpTyps.equals(""))
			{
				//Check in IOI Group(s)
				String[] issrGrpArray = prtPurpTyps.split(",");
				boolean irgpMember = false;

				String instrIssrId = null;
				String sql = 	"SELECT instr_issr_id from FT_T_ISSR " +
								"WHERE fins_inst_mnem = '" + instMnem + "'" +
								"AND COALESCE(end_tms, SYSDATE() + INTERVAL '1 day') > SYSDATE()";

				dbConnection.setSQL(sql);
				dbConnection.execute();

				if(!dbConnection.isEndOfStream())
				{
					instrIssrId=dbConnection.getNextString();
					logger.info("instrIssrId: " + instrIssrId);
				}

				for(int i=0; i < issrGrpArray.length; i++)
				{
					irgpMember = Common.checkIrgpExists(dbConnection, issrGrpArray[i], instrIssrId, logger);
					if (irgpMember == true)
						break;
				}

				if (irgpMember == false)
				{
					if(logger.isInfoEnabled())
						logger.info("Not in any of the groups. Exiting");

					return true;
				}
			}
		}
		
		for(SegmentId segIDFirt : segmentIDFIRT)
        {
			logger.info("Processing FinancialInstitutionRating Segment : "+segIDFirt);
			
			String firtRatingSetOid = msg.getStringField("RTNG_SET_OID", segIDFirt);
			String segAtrib = msg.getSegmentAttribute(segIDFirt, "SEGPROCESSEDIND");

				
			if ("MIZRTNG2".equals(firtRatingSetOid) && ("C".equals(segAtrib) || "U".equals(segAtrib))){
				logger.info("Rating set oid is: "+firtRatingSetOid);
				logger.info("Segment process indicator for mizRtng2Val attribute is: "+segAtrib+". Create or update for basel II standard rating, detected.");
				mizRtng2Val = msg.getStringField("RTNG_CDE", segIDFirt);				
		    	logger.info("Basel II standard rating code value is: "+mizRtng2Val);	
			}
        }
		
		
		//begin checks for category 1 BB industry classification changes
		for(SegmentId segID : segmentIDFICL)
        {
			String ficlAction = msg.getAction(segID);
			String ficlIndusClSetId = msg.getStringField("INDUS_CL_SET_ID", segID); 
			ficlInstmnem = msg.getStringField("INST_MNEM", segID);
			
			if ("INSERT".equals(ficlAction)){ 			
				if ("BBINDGRP".equals(ficlIndusClSetId)){
					bBIndGrpVal = msg.getStringField("CL_VALUE", segID);
					
					//update to relevant classification detected, set var to true.
					bBClsfUpdCheck = true;
				
				} else if ("BBINDSGR".equals(ficlIndusClSetId)){
					bBIndSubGrpVal = msg.getStringField("CL_VALUE", segID);
					
					//update to relevant classification detected, set var to true.
					bBClsfUpdCheck = true;
				}
			} // else if action is update/delete then check the indus_cl_set_ids
			//from the DB
			else if ("UPDATE".equals(ficlAction) || "DELETE".equals(ficlAction)){
				
				//using the fins_cls_foid find the Group and Value
				String finsClsfOid = msg.getStringField("FINS_CLSF_OID", segID);
				String finsClsfOidsql = "select INDUS_CL_SET_ID, CL_VALUE from FT_T_FICL where fins_clsf_oid = '" +finsClsfOid+ "'";
				
				logger.info("UPDATE or DELETE FICL found. Checking attributes in DB that will be updated to see if they are relevant.");
				ArrayList<String> dbIndGrpandValue = Common.selectQueryList(dbConnection, finsClsfOidsql);
				
				if (!dbIndGrpandValue.isEmpty() && dbIndGrpandValue.size() > 0) {
					indusClSetId = dbIndGrpandValue.get(0);
					indusClVal = dbIndGrpandValue.get(1);
        			
        			logger.info("Found first array element from DB lookup is, INDUS_CL_SET_ID is: "+indusClSetId);
        			logger.info("Second element value in DB is CL_VALUE: "+indusClVal);
        			
        			if ("UPDATE".equals(ficlAction)) {
        					logger.info("Update FICL found. Processing... ");
		        			if ("BBINDGRP".equals(indusClSetId)){
		        				//set BB Ind Group value 
		        				logger.info("Found BBINDGRP, so setting bBIndGrpVal value to : "+indusClVal);
		    					bBIndGrpVal = indusClVal;
		    					
		    					//update to relevant classification detected, set var to true.
		    					bBClsfUpdCheck = true;
		 					
		    				
		    				} else if ("BBINDSGR".equals(indusClSetId)){
		    					//set BB Ind Sub Group value 
		    					logger.info("Found BBINDSGR, so setting bBIndSubGrpVal value to : "+indusClVal);
		    					bBIndSubGrpVal = indusClVal;
		    					
		    					//update to relevant classification detected, set var to true.
		    					bBClsfUpdCheck = true;
		    				}
		        		} 
        			else if ("DELETE".equals(ficlAction)) {
		        				logger.info("Delete FICL found. Processing... ");
		        				if ("BBINDGRP".equals(indusClSetId)){
			    					bBIndGrpVal = indusClVal;
			    					if ("Sovereign".equals(indusClVal) || "Banks".equals(indusClVal)) {
			    						bBClsfUpdCheck = true;
			    						//remove FICL is true
			    						logger.info("Relevant BBINDGRP value found, marked for deletion. Setting removeFICLCat1 to true.");
			    						removeFICLCat1 = true;
			    						
			    						if ("Sovereign".equals(indusClVal)){
				    						//set remove cat3 from Assets linked to Issuer to true
				    						logger.info("Setting removeISCLCat3 to true.");
				    						removeISCLCat3 = true;
			    						}
			    						
			    					}
			 					
			    				
			    				} else if ("BBINDSGR".equals(indusClSetId)){
			    					if ("Sovereign".equals(indusClVal) || "Central Bank".equals(indusClVal)) {
			    						bBClsfUpdCheck = true;
			    						//remove FICL is true
			    						logger.info("Relevant BBINDSGR value found, marked for deletion. Setting removeFICLCat1 to true.");
			    						removeFICLCat1 = true;
			    						
			    						if ("Sovereign".equals(indusClVal)){
				    						//set remove cat3 from Assets linked to Issuer to true
				    						logger.info("Setting removeISCLCat3 to true.");
				    						removeISCLCat3 = true;
			    						}
			    					}
			    				}
		        				
		        			}
        	    }
				
			}
        } //end of For Loop
		
		//for each empty attribute value from the message, check the DB for a value instead
		if ("".equals(bBIndGrpVal) || bBIndGrpVal == null){
			logger.info("Found empty value for BBINDGRP on message. Checking DB for value instead.");
			
			String bBIndGrpValDBsql = "SELECT CL_VALUE FROM FT_T_FICL WHERE END_TMS IS NULL AND INDUS_CL_SET_ID = 'BBINDGRP' AND INST_MNEM ='" +ficlInstmnem+ "'";
			bBIndGrpVal = Common.selectQueryString(dbConnection, bBIndGrpValDBsql);
		}
		
		if ("".equals(bBIndSubGrpVal) || bBIndSubGrpVal == null){
			logger.info("Found empty value for BBINDSGR on message. Checking DB for value instead.");
			
			String bBIndSubGrpValDBsql = "SELECT CL_VALUE FROM FT_T_FICL WHERE END_TMS IS NULL AND INDUS_CL_SET_ID = 'BBINDSGR' AND INST_MNEM ='" +ficlInstmnem+ "'";
			bBIndSubGrpVal = Common.selectQueryString(dbConnection, bBIndSubGrpValDBsql);
		} 


		
		
		//If the message has a change for a relevant BB Industry classification then
		//check if all values are present.
		
		if (bBClsfUpdCheck == true){
			logger.info("bBIndGrpVal value: "+bBIndGrpVal);
			if ("Sovereign".equals(bBIndGrpVal) || "Banks".equals(bBIndGrpVal)) {
				
				bBIndGrpCheck = true;
			}
			
			logger.info("bBIndSubGrpVal value: "+bBIndSubGrpVal);
			if ("Sovereign".equals(bBIndSubGrpVal) || "Central Bank".equals(bBIndSubGrpVal)) {
				
				bBIndSubGrpCheck = true;
			}
			
			logger.info("Checking for removeISCLCat3 status");
			if (!"Sovereign".equals(bBIndGrpVal) || !"Sovereign".equals(bBIndSubGrpVal)) { 
				logger.info("Setting removeISCLCat3 to true as BB Industry Group or Sub group change affects linked assets.");
				removeISCLCat3 = true;
			}
			
			
			if (bBIndGrpCheck == true && bBIndSubGrpCheck == true) {
				
				logger.info("All attribute checks returned true. Final valdiation check on  DB being performed.");
				if ("".equals(mizRtng2Val)) {
						mizRtng2Val = "AAA', 'AA+', 'AA' , 'AA-";
						} 
						else {
							logger.info("Variable mizRtng2Val is not empty and set to: "+mizRtng2Val);
						}
				
				//check final attributes for category 1 validation on DB
				String cat1Attribsql = "SELECT DISTINCT "+
										"FIRT.INST_MNEM "+
										"FROM FT_T_FIRT FIRT "+
										"INNER JOIN FT_T_RTVL RTVL ON FIRT.RTNG_VALUE_OID= RTVL.RTNG_VALUE_OID AND FIRT.RTNG_CDE IN ('"+mizRtng2Val+"') "+
										"INNER JOIN FT_T_ISSR ISSR ON FIRT.INST_MNEM = ISSR.FINS_INST_MNEM "+
										"INNER JOIN FT_T_IRID IRID ON (IRID.instr_issr_id = ISSR.instr_issr_id "+ "AND IRID.ISSR_ID_CTXT_TYP = 'CLIENTREF')	"							                             
										+"WHERE FIRT.RTNG_SET_OID = 'MIZRTNG2' "+
										"AND FIRT.END_TMS IS NULL "+
										"AND FIRT.SYS_EFF_END_TMS IS NULL "+
										"AND IRID.ISSR_ID  <> 'BANCODSP' "+
										"AND NOT EXISTS ( SELECT 1 FROM FT_T_FICL SPB "+
										                  "WHERE SPB.INST_MNEM = FIRT.INST_MNEM "+ 
										                    "AND SPB.INDUS_CL_SET_ID = 'BBINDSGR' "+
										                    "AND SPB.CL_VALUE IN ('Special Purpose Banks')) "+
										"AND FIRT.INST_MNEM ='"+ficlInstmnem+"'"; 
													
				String cat1Attribs = null;
				cat1Attribs = Common.selectQueryString(dbConnection, cat1Attribsql);
				
				if (!(cat1Attribs == null || "".equals(cat1Attribs))){
					logger.info("All attribute checks returned true. Final valdiation check on DB also passed.");
					logger.info("Cat1 attribute check returned: "+cat1Attribs);
					logger.info("Creating FRTB and Risk Weight Cat1 segments.");
					
					logger.info("Creating cat 1 FICL segment for FRTB.");
					createFICL(msg, ficlInstmnem, "FRTBCATG", "FRTBCATG01", "1", "CLASSIFY");
					
					logger.info("Creating cat 1 FICL segment for Risk Weight.");
		        	createFICL(msg, ficlInstmnem, "RISKWGHT", "RISKWGHT01", "Y", "CLASSIFY");
		        	
					
				}
				else {
					logger.info("Not all checks returned true. Final DB validation failed. Check rating value, IOI participation, "+ 
							"Clientref and Special Purpose bank values!");
					logger.info("Setting removeFICLCat1 to true.");
					removeFICLCat1 = true;
				}
				
				
			} 
			else {
				
				logger.info("Not all attribute checks returned true.");
				logger.info("bBIndGrpCheck: "+bBIndGrpCheck);
				logger.info("bBIndSubGrpCheck: "+bBIndSubGrpCheck);
				logger.info("Setting removeFICLCat1 to true.");
				
				removeFICLCat1 = true;
	
			}
			
			if (removeFICLCat1 == true) {
				
				String frtbFinsClsfOidsql = "SELECT FINS_CLSF_OID FROM FT_T_FICL WHERE END_TMS IS NULL AND CLSF_PURP_TYP = 'CLASSIFY' AND "+
				"INDUS_CL_SET_ID = 'FRTBCATG' AND CLSF_OID = 'FRTBCATG01' AND INST_MNEM = '"+ficlInstmnem+"'"; 			
				String frtbFinsClsfOid = Common.selectQueryString(dbConnection, frtbFinsClsfOidsql);	
				
				if (!frtbFinsClsfOid.isEmpty()) {
					logger.info("Removing cat 1 FICL segment for FRTB.");
					deleteFICL(msg, frtbFinsClsfOid);
					
				}
				
				
				String rwghtFinsClsfOidsql = "SELECT FINS_CLSF_OID FROM FT_T_FICL WHERE END_TMS IS NULL AND CLSF_PURP_TYP = 'CLASSIFY' AND "+
				"INDUS_CL_SET_ID = 'RISKWGHT' AND CLSF_OID = 'RISKWGHT01' AND CL_VALUE='Y' AND INST_MNEM = '"+ficlInstmnem+"'"; 			
				
				String rwghtFinsClsfOid = Common.selectQueryString(dbConnection, rwghtFinsClsfOidsql);
				if (!rwghtFinsClsfOid.isEmpty()) {
					logger.info("Removing cat 1 FICL segment for Risk Weight.");
	
					//create update segment to set RiskWeight to 'N'
					createFICL(msg, ficlInstmnem, "RISKWGHT", "RISKWGHT02", "N", "CLASSIFY");
				}
				
			}
			
			logger.info("Calling method checkAndUpdateCat3Assets with variable removeISCLCat3 set to: "+removeISCLCat3);
			checkAndUpdateCat3Assets(msg,dbConnection,ficlInstmnem, removeISCLCat3 );
				
			//add Fins at end of message to safeguard proper processing
			logger.info("Adding FINS segment for inst_menm: "+ficlInstmnem);
		    SegmentId finsSegmentId = msg.addSegment(XMLMessage.A_REFERENCE,"FinancialInstitution");
			msg.addField("INST_MNEM", finsSegmentId, ficlInstmnem);
			
			if(logger.isDebugEnabled())
               logger.debug("End of processing MSG = "+ msg.getXMLString());
			
			
			//end checks for category 1 BB industry classification changes
		} else {
			logger.info("No relevant BB Classification detected. bBClsfUpdCheck var is set to: "+bBClsfUpdCheck);
		}
	    
	return true;
	}
	
	private XMLMessage createFICL(XMLMessage msg, String instmnem, String indusClSetId, String clsfOid, String clValue, String clsfPurpTyp)
	  {
		logger.info("Running createFICL method.");
	    SegmentId FICLSeg = msg.addSegment("D_UNKNOWN", "FinancialInstitutionClassification");	    
	    
	    if (!"FRTBCATG".equals(indusClSetId)){msg.setSegmentAttribute(FICLSeg, "MATCH", "FICL_MATCH_SET_2");}
	    //msg.setSegmentAttribute(FICLSeg, "MATCH", "FICL_MATCH_SET_2");
		msg.setSegmentAttribute(FICLSeg, "TSATTRIBUTE", "CLSF_OID:CL_VALUE");
		//msg.setSegmentAttribute(FICLSeg, "TSOPTION", "Y");	    
	    msg.addField("INST_MNEM", FICLSeg, instmnem);
	    msg.addField("INDUS_CL_SET_ID", FICLSeg, indusClSetId);
	    msg.addField("CLSF_OID", FICLSeg, clsfOid);
	    msg.addField("CL_VALUE", FICLSeg, clValue);
	    msg.addField("CLSF_PURP_TYP", FICLSeg, clsfPurpTyp);
	    
	    Calendar cal = Calendar.getInstance();
		cal.set(Calendar.HOUR_OF_DAY, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);
		cal.set(Calendar.MILLISECOND, 0);
		Date today = cal.getTime();
		logger.info("Created timestamp of START_TMS:"+today);
		msg.addField("START_TMS", FICLSeg, today);
		msg.setFieldAttribute("START_TMS", FICLSeg, "INSERT_ONLY", "Y");
		
		return msg;
	    
	  }

	
	private void checkAndUpdateCat4CountryPSEs(DatabaseAccess dbConnection,String instmnem, XMLMessage msg, String cqsRanking) {
		  
		  logger.info("Checking if Cat4 status for: "+instmnem);
		  
		  String cat4CntCheckSql = "SELECT PSE.inst_mnem FROM "+
			"(SELECT INST_MNEM FROM FT_T_FICL WHERE END_TMS IS NULL AND INDUS_CL_SET_ID = 'FRTBCATG' AND CLSF_OID = 'FRTBCNTY04') CAT4COUNTRY, "+
			"(SELECT INST_MNEM, GU_ID FROM FT_T_FIGU WHERE END_TMS IS NULL AND FINS_GU_PURP_TYP = 'RISK') RISKCOUNTRY, "+
			"(SELECT GU_ID, FICL.INST_MNEM FROM FT_T_FICL FICL, FT_T_FIGU FIGU WHERE FICL.END_TMS IS NULL AND FIGU.END_TMS IS NULL "+ 
			"AND FICL.INST_MNEM = FIGU.INST_MNEM AND FICL.INDUS_CL_SET_ID = 'FRTBCATG' AND FICL.CLSF_OID = 'FRTBCATG04' AND FIGU.FINS_GU_PURP_TYP = 'RISK' AND FIGU.GU_TYP = 'COUNTRY') PSE "+
			"WHERE CAT4COUNTRY.INST_MNEM = RISKCOUNTRY.INST_MNEM "+
			"AND RISKCOUNTRY.GU_ID = PSE.GU_ID "+
			"AND CAT4COUNTRY.INST_MNEM = '"+instmnem+"'";

		  ArrayList<String> publicSectorEntityArray = Common.selectQueryList(dbConnection, cat4CntCheckSql);
		  
		  if (!publicSectorEntityArray.isEmpty() && publicSectorEntityArray.size() > 0) {
		  
			  if ("1".equals(cqsRanking)) {
				  
			  logger.info("CQS ranking of '1' found for: "+instmnem);	  
			  //For each PSE inst_mnem returned, create a risk weight FICL segment, Action='UNKNOWN'			 
			  for(String pse_rgla_instmnem : publicSectorEntityArray)
				{
				  logger.info("Creating cat 4 FICL segment for Risk Weight.");
		        	createFICL(msg,pse_rgla_instmnem, "RISKWGHT", "RISKWGHT01", "Y", "CLASSIFY");
				}
			  } else {
				  logger.info("CQS ranking of "+cqsRanking+" found for: "+instmnem);
				  for(String pse_rgla_instmnem : publicSectorEntityArray)
					{
					  logger.info("CQS rank too low. Checking and deleting any PSE/RGLAs FICL segments for Risk Weight.");
					  String rwghtFinsClsfOidsql = "SELECT FINS_CLSF_OID FROM FT_T_FICL WHERE END_TMS IS NULL AND CLSF_PURP_TYP = 'CLASSIFY' AND "+
						"INDUS_CL_SET_ID = 'RISKWGHT' AND CLSF_OID = 'RISKWGHT01' AND CL_VALUE='Y' AND INST_MNEM = '"+pse_rgla_instmnem+"'"; 			
						
						String rwghtFinsClsfOid = Common.selectQueryString(dbConnection, rwghtFinsClsfOidsql);
						if (!rwghtFinsClsfOid.isEmpty()) {
							logger.info("Removing cat 1 FICL segment for Risk Weight.");
							//creating FICL segment to set Riskweight to 'N'
							createFICL(msg, pse_rgla_instmnem, "RISKWGHT", "RISKWGHT02", "N", "CLASSIFY");
							}
					}  
			  	}
		  }
	  }
	
	//Following method called from CJavaMHIIssuerRatingDerived class, when ratings are updated/created
	public XMLMessage processFRTB(String basel,DatabaseAccess dbConnection,String instMnem, XMLMessage msg){
		//Begin Cat 1 processing checks
		
		logger.info("Running processFRTB method.");
		logger.info("Basel value passed into method is:"+basel);
		logger.info("Checking cat 1 status for record.");
		if ("AAA".equals(basel)||"AA+".equals(basel)||"AA".equals(basel)||"AA-".equals(basel)) {
			//check cat 1 eligibility
			logger.info("Rating value is correct for cat1. Continuing cat 1 checks...");
			String issrCat1 = processInstrIssrIdCat1(dbConnection, instMnem);

	        if ((issrCat1 != null) && (!"".equals(issrCat1))) {
	        	//if cat 1 check is valid and if record is not locked then create FRTB Cat 1 classification
	        	logger.info("Remaining cat 1 checks passed. Checking for lock on FRTBCATG record entry...");
	        	boolean existsFRTBCATGLock = Common.lockedRecord(dbConnection, "FRTBCATG", instMnem);
	        	if (existsFRTBCATGLock==false) {
	        	  logger.info("No lock detected. Creating cat 1 FICL segment for FRTB.");
	        	  createFICL(msg, issrCat1, "FRTBCATG", "FRTBCATG01", "1", "CLASSIFY");

	        	}
	        	//if cat 1 check is valid and if record is not locked then create RiskWeight Zero classification
	        	logger.info("Checking for lock on RISKWGHT record entry...");
	        	boolean existsRISKWGHTLock = Common.lockedRecord(dbConnection, "RISKWGHT", instMnem);
	        	if (existsRISKWGHTLock==false) {
	        		logger.info("No lock detected. Creating cat 1 FICL segment for Risk Weight.");
	        	 createFICL(msg, issrCat1, "RISKWGHT", "RISKWGHT01", "Y", "CLASSIFY");
	        	
	        	}
	        } else {
	        	//As the Cat 1 validation has failed, check if there are existing records in FICL 
	        	//which are Cat1, are not locked and should now be removed.
	        	logger.info("Cat 1 checks show this record not be cat 1. Rating code too low: "+basel);
	        	checkAndRemoveCat1(msg, dbConnection, instMnem);
	        } 
		}else {
			//As the Cat 1 validation has failed due to rating value, check if there are existing records in FICL 
        	//which are Cat1, are not locked and should now be removed.
			logger.info("Cat 1 checks show this record not be cat 1.");
        	checkAndRemoveCat1(msg, dbConnection, instMnem);
        }
		logger.info("Processing FinancialInstitutionRating segment for ranking logic.");
			
		boolean existsCQSRANKGLock = Common.lockedRecord(dbConnection, "CQSRANKG", instMnem);
          
		if (existsCQSRANKGLock==false) {
        	  logger.info("Creating CQS Ranking.");
        	  
			String rtngCode = basel;
			
			dbConnection.setSQL("select RTNG_ID, CLSF_OID from FT_T_RTVL, FT_T_INCL where FT_T_RTVL.RTNG_ID = FT_T_INCL.CL_VALUE " +
					"AND RTNG_SET_OID ='MIZRTNG2' AND FT_T_INCL.INDUS_CL_SET_ID = 'CQSRANKG' AND RTNG_CDE='"+rtngCode+"'");

			if (dbConnection.execute()) {
				//String cqsRanking = dbConnection.getNextString();
				//String clsfOid = dbConnection.getNextString();
				logger.info("Initialize cqsRanking & clsfOid");
				String cqsRanking = "";
				String clsfOid = "";
		
				if (!dbConnection.isEndOfStream()) {
					cqsRanking = dbConnection.getNextString();
					logger.info("cqsRanking: " + cqsRanking);
					clsfOid = dbConnection.getNextString();
					logger.info("clsfOid: " + clsfOid);
				
					String indusClSetId = "CQSRANKG";	
					String clsfPurpTyp = "CLASSIFY";		
				
					logger.info("Creating CQS ranking of "+cqsRanking+" for: "+instMnem);
					createFICL(msg, instMnem, indusClSetId, clsfOid, cqsRanking, clsfPurpTyp);
				
					//run a category 4 check for this record and then find
					logger.info("Checking if category 4 record, with linked PSE/RGLAs for: "+instMnem);
					checkAndUpdateCat4CountryPSEs(dbConnection, instMnem, msg, cqsRanking);
				}
				
			} else {
				// Fail message
				if(logger.isInfoEnabled())
					logger.info("Failed dbconnection.execute sql add CQS Ranking...");
			}
          }
		  
		//logger.info("Post processing processFRTB method, msg is: " + msg.getXMLString());
		
		 if(logger.isDebugEnabled()){
             logger.debug("Post processing processFRTB method, msg is: " + msg.getXMLString());
	   
		 }
   
		return msg;
	}
	
	 private String processInstrIssrIdCat1(DatabaseAccess dbConnection, String instmnem)
	  {
	    if (logger.isInfoEnabled()) {
	      logger.info("Processing method processInstrIssrIdCat1. About to do sql lookup.");
	    }
	    
	    dbConnection.setSQL("SELECT ISSR.FINS_INST_MNEM "+
	    					"FROM FT_T_ISSR ISSR "+
	    					"INNER JOIN FT_T_FICL FICLSG ON(FICLSG.INST_MNEM = ISSR.FINS_INST_MNEM "+
                                "AND FICLSG.INDUS_CL_SET_ID = 'BBINDSGR' "+ 
                                "AND FICLSG.CL_VALUE IN ('Central Bank', 'Sovereign')) "+
                           "INNER JOIN FT_T_FICL FICLG ON(FICLG.INST_MNEM = ISSR.FINS_INST_MNEM "+
                                "AND FICLG.INDUS_CL_SET_ID = 'BBINDGRP' "+
                                "AND FICLG.CL_VALUE IN ('Banks', 'Sovereign')) "+
                           "INNER JOIN FT_T_FICL GICS ON (GICS.INST_MNEM = ISSR.FINS_INST_MNEM "+
                              "AND GICS.INDUS_CL_SET_ID = 'GICS' "+
                              "AND GICS.CL_VALUE IN ('401010', 'M11010', 'M1101030')) "+
                           "INNER JOIN FT_T_IRID IRID ON (IRID.instr_issr_id = ISSR.instr_issr_id "+
                             "AND IRID.ISSR_ID_CTXT_TYP = 'CLIENTREF') "+
                           "INNER JOIN FT_T_IRGP IRGP ON (IRGP.INSTR_ISSR_ID = ISSR.INSTR_ISSR_ID "+
                           	"AND IRGP.PRNT_ISSR_GRP_OID = 'IRGR000006' "+
                           	"AND IRGP.END_TMS IS NULL) "+
                          "WHERE IRID.ISSR_ID  <> 'BANCODSP' "+
                          "AND NOT EXISTS ( SELECT 1 FROM FT_T_FICL SPB "+
                          "WHERE SPB.INST_MNEM = ISSR.FINS_INST_MNEM "+ 
                          "AND SPB.INDUS_CL_SET_ID = 'BBINDSGR' "+
                          "AND SPB.CL_VALUE IN ('Special Purpose Banks')) "+
                          "AND ISSR.FINS_INST_MNEM = '" +instmnem+ "'");
	    
        String fins_frtbcat1 = "";
        
	    try
	    {
	      dbConnection.execute();
	      
	      if (!dbConnection.isEndOfStream()) {
	    	 fins_frtbcat1 = dbConnection.getNextString().trim();
			}
			dbConnection.close();
	    }
	    catch (Exception e1)
	    {
	      e1.printStackTrace();
	      logger.info("Failed dbconnection.execute process:" + instmnem);
	    }
	    finally {
	      dbConnection.close();
	      logger.info("Closing DB connection.");
	    }
	    

	    if (logger.isInfoEnabled())
	      logger.info("Instmnem lookup found and returning: " + fins_frtbcat1);
	    
	    return fins_frtbcat1;
	  }
	 
	 private void checkAndRemoveCat1(XMLMessage msg, DatabaseAccess dbConnection, String instmnem)
	  {
		  boolean existsFRTBCATGLock = Common.lockedRecord(dbConnection, "FRTBCATG", instmnem);
		  if (existsFRTBCATGLock==false) {
			  logger.info("Removing cat 1 FICL segment for FRTB, for record: "+instmnem);      	 
			  String finsClsfOidSql = "SELECT FINS_CLSF_OID FROM FT_T_FICL WHERE CLSF_PURP_TYP = 'CLASSIFY' AND INDUS_CL_SET_ID = 'FRTBCATG' AND CLSF_OID = 'FRTBCATG01' AND END_TMS IS NULL AND INST_MNEM = '"+instmnem+"'";
			  String finsClsfOid = Common.selectQueryString(dbConnection, finsClsfOidSql);
			  deleteFICL(msg, finsClsfOid);
	      }
     	
		  //if cat 1 check is valid and if record is not locked then create RiskWeight Zero classification
		  boolean existsRISKWGHTLock = Common.lockedRecord(dbConnection, "RISKWGHT", instmnem);
		  if (existsRISKWGHTLock==false) {
			  logger.info("Removing cat 1 FICL segment for Risk Weight,for record: "+instmnem);
			  
			  //update RiskWeight to 'N'
			  createFICL(msg, instmnem, "RISKWGHT", "RISKWGHT02", "N", "CLASSIFY");

			  
  	      }
     	
     }
	 
	 private void deleteFICL(XMLMessage msg, String finsClsfOid)
	  {
		logger.info("Running deleteFICL method.");
		if ("".equals(finsClsfOid) || finsClsfOid == null){
			logger.info("No fins clsf oid found. Cannot create deleteFICL segment so exiting method and returning to main execution.");
		} else {
			SegmentId FICLSeg = msg.addSegment("PHYDELETE", "FinancialInstitutionClassification");
		    msg.addField("FINS_CLSF_OID", FICLSeg, finsClsfOid);
		}
	  }
	 
	 private void checkAndUpdateCat3Assets(XMLMessage msg,DatabaseAccess dbConnection, String instmnem, Boolean removeISCLCat3){
		 if (logger.isInfoEnabled()) {
		      logger.info("Processing method checkAndUpdateCat3Assets. Var 'removeISCLCat3' set to: "+removeISCLCat3+". About to do sql lookup.");
		    }

		    //removal checks for FRTB and RiskWeight.
		    if (removeISCLCat3 == true) {
		    	
		    	//Remove FRTBCAT3 based on existing linked assets with FRTB cat3 status
		    	String cat3AssetRemoveSql =("SELECT ISS_CLSF_OID FROM FT_T_ISCL WHERE END_TMS IS NULL AND CLSF_PURP_TYP = 'CLASSIFY' AND INDUS_CL_SET_ID = 'FRTBCATG' AND CLSF_OID = 'FRTBCATG03' AND CL_VALUE = '3' "+
		    							"AND INSTR_ID IN ( "+
		    							"SELECT DISTINCT INSTR_ID FROM FT_T_ISSU WHERE END_TMS IS NULL AND INSTR_ISSR_ID IN ( "+
		    								"SELECT INSTR_ISSR_ID FROM FT_T_ISSR WHERE END_TMS IS NULL AND FINS_INST_MNEM = '"+instmnem+"'))");
			    	
		    	ArrayList<String> removeCat3assets = Common.selectQueryList(dbConnection,cat3AssetRemoveSql);
		    	
		        if (removeCat3assets.size() > 0) {
	
					logger.info("Removing category 3 status for linked asset(s) for inst_mnem: "+instmnem+".");
					for (String isclIssClsfOid : removeCat3assets) {
						logger.info("Calling method for removal of FRTB Cat3 Asset for ISS_CLSF_OID: "+isclIssClsfOid);
						
						//remove FRTB Cat3 ISCL entry
						String cat3InstrId =("SELECT INSTR_ID FROM FT_T_ISCL WHERE END_TMS IS NULL AND CLSF_PURP_TYP = 'CLASSIFY' AND INDUS_CL_SET_ID = 'FRTBCATG' AND CLSF_OID = 'FRTBCATG03' AND CL_VALUE = '3' "+
    							"AND ISS_CLSF_OID = '"+isclIssClsfOid+"'");
						
						String instrId = Common.selectQueryString(dbConnection,cat3InstrId);
						logger.info("Running deleteISCL with isclIssClsfOid = "+isclIssClsfOid+" and instrId = "+instrId);
						deleteISCL(msg, isclIssClsfOid, instrId);
					}	
			    } else
				{
					logger.info("No existing frtb category 3 assets found linked to: "+instmnem);
				}
				    
			    //If there are linked assets with Risk Weight Zero = 'Y' then remove these entries
		        String riskWeightZeroYAssetRemoveSql =("SELECT ISS_CLSF_OID FROM FT_T_ISCL WHERE END_TMS IS NULL AND CLSF_PURP_TYP = 'CLASSIFY' AND INDUS_CL_SET_ID = 'RISKWGHT' AND CLSF_OID = 'RISKWGHT01' AND CL_VALUE = 'Y' "+
						"AND INSTR_ID IN ( "+
						"SELECT DISTINCT INSTR_ID FROM FT_T_ISSU WHERE END_TMS IS NULL AND INSTR_ISSR_ID IN ( "+
							"SELECT INSTR_ISSR_ID FROM FT_T_ISSR WHERE END_TMS IS NULL AND FINS_INST_MNEM = '"+instmnem+"'))");
	
		        ArrayList<String> removeRiskWeightZeroYassets = Common.selectQueryList(dbConnection,riskWeightZeroYAssetRemoveSql);
		        
		        if (removeRiskWeightZeroYassets.size() > 0) {
	
		        	logger.info("Inserting RiskWeight to 'N' for linked asset(s) for inst_mnem: "+instmnem+".");
					for (String isclIssClsfOid : removeRiskWeightZeroYassets) {
						logger.info("RiskWeight Zero Asset ISS_CLSF_OID: "+isclIssClsfOid);
						
						String riskWeightInstrId =("SELECT INSTR_ID FROM FT_T_ISCL WHERE END_TMS IS NULL AND CLSF_PURP_TYP = 'CLASSIFY' AND INDUS_CL_SET_ID = 'RISKWGHT' AND CLSF_OID = 'RISKWGHT01' AND CL_VALUE = 'Y' "+
    							"AND ISS_CLSF_OID = '"+isclIssClsfOid+"'");
						
						String instrId = Common.selectQueryString(dbConnection,riskWeightInstrId);
						
						//remove Risk Weight Zero = 'Y' s
						logger.info("RiskWeight Zero Asset ISS_CLSF_OID: "+isclIssClsfOid+" and INSTR_ID = "+instrId);
						deleteISCL(msg, isclIssClsfOid, instrId);
					}
		        } else {
		        	logger.info("No existing RiskWeight Zero Y assets found. ");
		        }

	        	logger.info("Checking and will insert RiskWeight 'N's for valid linked asset(s), for inst_mnem: "+instmnem+".");
	        	// EG-7619 - Extended Country check to include FRTB Equivalent countries
	        	String linkedAssetsSql =("SELECT ISSU.INSTR_ID FROM FT_T_ISSU ISSU "+ 
						"INNER JOIN FT_T_ISSR ISSR ON (ISSU.INSTR_ISSR_ID = ISSR.INSTR_ISSR_ID AND ISSR.END_TMS IS NULL) "+ 
						"INNER JOIN FT_T_IRID IRID ON (IRID.INSTR_ISSR_ID = ISSR.INSTR_ISSR_ID AND IRID.ISSR_ID_CTXT_TYP = 'CLIENTREF' AND IRID.END_TMS IS NULL) "+ 
						"INNER JOIN FT_T_FIGU DOMI ON( DOMI.INST_MNEM = ISSR.FINS_INST_MNEM AND DOMI.FINS_GU_PURP_TYP = 'DOMICILE' AND DOMI.GU_TYP = 'COUNTRY' AND DOMI.END_TMS IS NULL) "+ 
						"INNER JOIN FT_T_GUNT GUNT ON( DOMI.GU_ID = GUNT.PRNT_GU_ID AND GUNT.PRNT_GU_TYP = 'COUNTRY' AND (GUNT.REGION_NME = 'European Union' or "+ 
						"GUNT.PRNT_GU_ID IN (SELECT GU_ID FROM FT_T_GUGP WHERE END_TMS is null and PRNT_GU_GRP_OID in (select GU_GRP_OID from ft_t_gugr where GU_GRP_OID like 'GUGR000002')))) "+
						"INNER JOIN FT_T_ISGP ISGP ON (ISGP.INSTR_ID = ISSU.INSTR_ID AND  ISGP.PRT_PURP_TYP = 'INTEREST' AND PRNT_ISS_GRP_OID = 'ISGR000006' AND ISGP.END_TMS IS NULL) "+  
						"WHERE  ISSU.DENOM_CURR_CDE = GUNT.PREF_CURR_CDE  AND ISSR.FINS_INST_MNEM ='"+instmnem+"'");
	        	 
	        	ArrayList<String> insertRiskWeightZeroNassets = Common.selectQueryList(dbConnection,linkedAssetsSql);
	        	
				for (String isclInstrId : insertRiskWeightZeroNassets) {
					logger.info("RiskWeight Zero 'N' Asset INSTR_ID: "+isclInstrId);
					
					//update RiskWeight Zero to 'N'
					createISCL(msg, isclInstrId, "RISKWGHT", "RISKWGHT02", "N", "CLASSIFY");
				}
			    
		        
		    } else 
		    
		    	//removeISCLCat3 set to false and therefore linked assets should have FRTB Cat3 added if not present and risk weight zero set to 'Y'
		    {
		    		
		    		logger.info("RemoveISCLCat3 is set to false. Processing...");
		    		
		    		//If there are linked assets with Risk Weight Zero = 'N' then remove these entries
			        String riskWeightZeroNAssetRemoveSql =("SELECT ISS_CLSF_OID FROM FT_T_ISCL WHERE END_TMS IS NULL AND CLSF_PURP_TYP = 'CLASSIFY' AND INDUS_CL_SET_ID = 'RISKWGHT' AND CLSF_OID = 'RISKWGHT02' AND CL_VALUE = 'N' "+
							"AND INSTR_ID IN ( "+
							"SELECT DISTINCT INSTR_ID FROM FT_T_ISSU WHERE END_TMS IS NULL AND INSTR_ISSR_ID IN ( "+
								"SELECT INSTR_ISSR_ID FROM FT_T_ISSR WHERE END_TMS IS NULL AND FINS_INST_MNEM = '"+instmnem+"'))");
		
			        ArrayList<String> removeRiskWeightZeroNassets = Common.selectQueryList(dbConnection,riskWeightZeroNAssetRemoveSql);
			        
			        if (removeRiskWeightZeroNassets.size() > 0) {
		
			        	logger.info("Inserting RiskWeight to 'N' for linked asset(s) for inst_mnem: "+instmnem+".");
						for (String isclIssClsfOid : removeRiskWeightZeroNassets) {
							logger.info("RiskWeight Zero Asset ISS_CLSF_OID: "+isclIssClsfOid);
							
							String riskWeightInstrId =("SELECT INSTR_ID FROM FT_T_ISCL WHERE END_TMS IS NULL AND CLSF_PURP_TYP = 'CLASSIFY' AND INDUS_CL_SET_ID = 'RISKWGHT' AND CLSF_OID = 'RISKWGHT02' AND CL_VALUE = 'N' "+
	    							"AND ISS_CLSF_OID = '"+isclIssClsfOid+"'");
							
							String instrId = Common.selectQueryString(dbConnection,riskWeightInstrId);
							
							//remove Risk Weight Zero = 'Y' s
							logger.info("RiskWeight Zero Asset ISS_CLSF_OID: "+isclIssClsfOid+" and INSTR_ID = "+instrId);
							deleteISCL(msg, isclIssClsfOid, instrId);
						}
			        } else {
			        	logger.info("No existing RiskWeight Zero N assets found. ");
			        }
		    		
				    //Sql to find all valid linked assets 
				    String linkedAssetsSql =("SELECT ISSU.INSTR_ID FROM FT_T_ISSU ISSU "+ 
							"INNER JOIN FT_T_ISSR ISSR ON (ISSU.INSTR_ISSR_ID = ISSR.INSTR_ISSR_ID AND ISSR.END_TMS IS NULL) "+ 
							"INNER JOIN FT_T_IRID IRID ON (IRID.INSTR_ISSR_ID = ISSR.INSTR_ISSR_ID AND IRID.ISSR_ID_CTXT_TYP = 'CLIENTREF' AND IRID.END_TMS IS NULL) "+ 
							"INNER JOIN FT_T_FIGU DOMI ON( DOMI.INST_MNEM = ISSR.FINS_INST_MNEM AND DOMI.FINS_GU_PURP_TYP = 'DOMICILE' AND DOMI.GU_TYP = 'COUNTRY' AND DOMI.END_TMS IS NULL) "+ 
							"INNER JOIN FT_T_GUNT GUNT ON( DOMI.GU_ID = GUNT.PRNT_GU_ID AND GUNT.PRNT_GU_TYP = 'COUNTRY' AND GUNT.REGION_NME = 'European Union') "+ 
							"INNER JOIN FT_T_ISGP ISGP ON (ISGP.INSTR_ID = ISSU.INSTR_ID AND  ISGP.PRT_PURP_TYP = 'INTEREST' AND PRNT_ISS_GRP_OID = 'ISGR000006' AND ISGP.END_TMS IS NULL) "+  
							"WHERE  ISSU.DENOM_CURR_CDE = GUNT.PREF_CURR_CDE  AND ISSR.FINS_INST_MNEM ='"+instmnem+"'");
				    
				    ArrayList<String> linkedAssets = Common.selectQueryList(dbConnection,linkedAssetsSql);
		    		
		    		
		    		//using checkCat3assets results as this checks other criteria are fulfilled
		    		if (linkedAssets.size() > 0) {
		    			
						logger.info("Creating category 3 segments for assets linked to inst_mnem: "+instmnem+".");
						for (String isclInstrId : linkedAssets) {
							
							logger.info("FRTB Cat3 Asset INSTR_ID: "+isclInstrId);
							createISCL(msg, isclInstrId, "FRTBCATG", "FRTBCATG03", "3", "CLASSIFY");
							
							logger.info("Updating RiskWeight to 'Y' for linked asset(s) for inst_mnem: "+instmnem+".");
							createISCL(msg, isclInstrId, "RISKWGHT", "RISKWGHT01", "Y", "CLASSIFY");
						}	
				    } else
					{
						logger.info("No valid linked assets found for inst_mnem: "+instmnem+".");
					}
		    		  
		    }
			
	 }
	 
	 private void deleteISCL(XMLMessage msg, String isclIssClsfOid, String instrId)
	  {
		logger.info("Running deleteISCL method.");
		
		if ("".equals(isclIssClsfOid) || isclIssClsfOid == null){
			logger.info("No oid found. Cannot create deleteISCL segment so exiting method and returning to main execution.");
		} else {
			SegmentId ISSUSeg = msg.addSegment("REFERENCE", "Issue");
			msg.addField("INSTR_ID", ISSUSeg, instrId);
			SegmentId ISCLSeg = msg.addSegment("PHYDELETE", "IssueClassification");
		    msg.addField("ISS_CLSF_OID", ISCLSeg, isclIssClsfOid);
		}
    
	  }
	 
	
	 private XMLMessage createISCL(XMLMessage msg, String instrId, String indusClSetId, String ClsfOid, String clValue, String clsfPurpTyp)
	  {
		logger.info("Running createISCL method.");
		SegmentId ISSUSeg = msg.addSegment("REFERENCE", "Issue");
		msg.addField("INSTR_ID", ISSUSeg, instrId);
	    SegmentId ISCLSeg = msg.addSegment("D_UNKNOWN", "IssueClassification");	    
	    msg.setSegmentAttribute(ISCLSeg, "MATCH", "ISCL_MATCH_9");
		msg.setSegmentAttribute(ISCLSeg, "TSATTRIBUTE", "CLSF_OID:CL_VALUE");
		msg.setSegmentAttribute(ISCLSeg, "TSOPTION", "Y");	    
	    msg.addField("INDUS_CL_SET_ID", ISCLSeg, indusClSetId);
	    msg.addField("CLSF_OID", ISCLSeg, ClsfOid);
	    msg.addField("CL_VALUE", ISCLSeg, clValue);
	    msg.addField("CLSF_PURP_TYP", ISCLSeg, clsfPurpTyp);
	    msg.addField("INSTR_ID", ISCLSeg, instrId);
	    Calendar cal = Calendar.getInstance();
		cal.set(Calendar.HOUR_OF_DAY, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);
		cal.set(Calendar.MILLISECOND, 0);
		Date today = cal.getTime();
		logger.info("Created timestamp of START_TMS:"+today);
		msg.addField("START_TMS", ISCLSeg, today);
		msg.setFieldAttribute("START_TMS", ISCLSeg, "INSERT_ONLY", "Y");
		
		return msg;
	    
	  }

}
