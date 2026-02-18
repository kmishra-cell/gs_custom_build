
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.ArrayList;
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


public class CJavaMHIFindUPChildren implements JavaRule {
	

	private static Logger logger = Logger.getLogger("CJavaMHIFindUPChildren"); 
	
	private static List<String> IRGPInventoryNames = new ArrayList<String>();
	private static List<String> IRGPInventoryOids = new ArrayList<String>();
	private static List<String> IRGPCustomerPublishes = new ArrayList<String>();

	public boolean initialize(String[] parameters) {
		
		logger.info("Initialize Java rule CJavaMHIFindUPChildren Rule");
		for(String s: parameters[0].split(","))
		{
			IRGPInventoryNames.add(s);
		}
		logger.info("IRGPInventoryNames: " + IRGPInventoryNames);

		for(String s: parameters[1].split(","))
		{
			IRGPInventoryOids.add(s);
		}
		logger.info("IRGPInventoryOids: " + IRGPInventoryOids);
		for(String s: parameters[2].split(","))
		{
			IRGPCustomerPublishes.add(s);
		}
		logger.info("IRGPCustomerPublishes: " + IRGPCustomerPublishes);
		
		return true;
	}

	public boolean process(XMLMessage msg, DatabaseObjectContainer dboc,
			ProcessorContext pContext, DatabaseAccess dbConnection,
			NotificationCreator notificationCreator)
			throws GSException {
		for (int paramIndex=0; paramIndex < IRGPInventoryNames.size(); paramIndex++ ) {
			
			logger.info("calling processForInventory() for inventory " + IRGPInventoryNames.get(paramIndex)); 
			processForInventory(msg, dboc,
					pContext, dbConnection,
					notificationCreator,
					IRGPInventoryNames.get(paramIndex),
					IRGPInventoryOids.get(paramIndex),
					IRGPCustomerPublishes.get(paramIndex));
			logger.info("finished processForInventory() for inventory " + IRGPInventoryNames.get(paramIndex)); 
		}
		logger.info("Finished processing Java rule CJavaMHIFindUPChildren Rule for all inventories");
		return true;
	}
	public boolean processForInventory(XMLMessage msg, DatabaseObjectContainer dboc,
			ProcessorContext pContext, DatabaseAccess dbConnection,
			NotificationCreator notificationCreator,
			String IRGPInventoryName,
			String IRGPInventoryOid,
			String IRGPCustomerPublish)
			throws GSException {

		logger.info("Processing Java rule CJavaMHIFindUPChildren Rule for " + IRGPInventoryName);
		logger.info("IRGPInventoryName: " + IRGPInventoryName);
		logger.info("IRGPInventoryOid: " + IRGPInventoryOid);
		logger.info("IRGPCustomerPublish: " + IRGPCustomerPublish);
		
		 if(logger.isDebugEnabled())
               logger.debug("xml: " + msg.getXMLString());
	
		
		String trn_id = pContext.getScopedTransaction().getTransactionID();

		String mainEntityNme = msg.getStringField("MAIN_ENTITY_NME", new SegmentId(0));
		String mainEntitytTblTyp = msg.getStringField("MAIN_ENTITY_TBL_TYP", new SegmentId(0));
		
		if (logger.isInfoEnabled())
			logger.info("Entity name is: "+mainEntityNme+". Entity type is:"+mainEntitytTblTyp+".");

		
		List<SegmentId> segmentIDFFRL = new ArrayList<SegmentId>();
        segmentIDFFRL = getSegmentIds("FinsFinsRole", msg);
        
        List<SegmentId> segmentIDFIID = new ArrayList<SegmentId>();
        segmentIDFIID = getSegmentIds("FinancialInstitutionIdentifier", msg);

        // EG-7266 - start
        // Changes to Financial Institution or Geo Unit participants need to be checked for updates as these fields are
		// populated in cmfCounterparty and cmfParty
		List<SegmentId> segmentIDs = new ArrayList<SegmentId>();
		segmentIDs = getSegmentIds("FinancialInstitution", msg);
		segmentIDs.addAll(getSegmentIds("FinancialInstitutionGeoUnitPrt", msg));
		segmentIDs.addAll(getSegmentIds("FinancialInstitutionIdentifier", msg));
		// EG-7266 - end


		//EG-7266 START
		logger.info("listing all segments.....");
		for(int i=0; i < msg.getSegmentCount(); i++) {
			SegmentId segId = new SegmentId(i);
			String segType = msg.getSegmentType(segId);
			logger.info("Segment found - " + segType);
		}
		for(SegmentId msgSegId : segmentIDFFRL) {
			if (logger.isInfoEnabled())
			{
				logger.info("segmentIDFFRL found. segmentIDFFRL logic can be called");
			}
		}
		for(SegmentId msgSegId : segmentIDFIID)
		{
			if (logger.isInfoEnabled())
			{
				logger.info("segmentIDFIID found. segmentIDFIID logic can be called");
			}
		}
		//EG-7266 END


        //Used for debugging:
        //ArrayList<String> upChildren = new ArrayList<String>();
        
        //Use case for when MHIPARNT or PARNTCOF is updated
        for(SegmentId msgSegId : segmentIDFFRL)
        {
        	if (logger.isInfoEnabled())
			{
				logger.info("segmentIDFFRL found. Going into segmentIDFFRL logic...");
			}
        	
        	String relTyp = msg.getStringField("REL_TYP", msgSegId);
        	String ultParent = msg.getStringField("PRNT_INST_MNEM", msgSegId);
        	String MHIPARNTInstmnem = msg.getStringField("INST_MNEM", msgSegId);
        	String actionType = msg.getAction(msgSegId);
        	String segAtrib = msg.getSegmentAttribute(msgSegId, "SEGPROCESSEDIND");
        	
        	logger.info("Rel_typ found of:"+relTyp+" for instmnem:"+ultParent+". Segment attribute is: "+segAtrib+". Action type is: "+actionType);

        	// For UPDATE and DELETE, read row from DB to get REL_TYP using FFRL_OID as it is not in the message
        	if ("UPDATE".equals(actionType) || "DELETE".equals(actionType))
        	{
				String ffrlOid = msg.getStringField("FFRL_OID", msgSegId);
				logger.info("FFRL_OID from segment is " + ffrlOid);
				String getFfrlRelTypSql= "select rel_typ from ft_t_ffrl where FFRL_OID = '" + ffrlOid + "'";
				logger.info("Get REL_TYP from db. Query is :" + getFfrlRelTypSql);
				relTyp = selectQueryString(dbConnection, getFfrlRelTypSql);
				logger.info("REL_TYP from db is " + relTyp);
			}
        	//check if it is PARNTCOF or MHIPARNT
        	if ("MHIPARNT".equals(relTyp)) {
        		       		
        		if (logger.isInfoEnabled())
    			{
    				logger.info("Valid rel_typ found of:"+relTyp+" for instmnem:"+ultParent+".");
    			}
        		// EG-7266 - remove restriction on action = insert to allow delete and update to be actioned
        		// if ("INSERT".equals(actionType)){
        			
        			logger.info("Checking if MHIPARNT ultimate parent is in the IOI...");
	        		
        			String ultMhiparentSql = "select MHI_FINS_UP('"+ultParent+"') from dual";
        			
        			logger.info("MHIPARNT record Ultimate parent lookup returned: "+ultMhiparentSql);
        			
        			logger.info("Now checking if "+ultMhiparentSql+" is in the " + IRGPInventoryName + " IOI group...");
        			
	        		//Check record is of interest
	        		String checkIOIsql = "select irgp.instr_issr_id ofinterest, issr.instr_issr_id from FT_T_ISSR issr "+ 
	        		"LEFT JOIN (select * from FT_T_IRGP where prnt_issr_grp_oid='" + IRGPInventoryOid + "' and end_tms is null) irgp "+ 
	        		"ON issr.instr_issr_id = irgp.instr_issr_id"+
	        		"WHERE issr.end_tms is null "+
	        		"and issr.fins_inst_mnem ='"+selectQueryString(dbConnection,ultMhiparentSql)+"'";
	        		
	        		//String checkIOIresp = selectQueryString(dbConnection, checkIOIsql);
	        		
	        		ArrayList<String> checkIOIresp = selectQueryList(dbConnection,checkIOIsql);
	        		
	        		String getIOI = null;
	        		String getInstrIssrId = null;
	        		
	        		//check the DB response, loaded into the array was not empty and if not then assign the first element value 
	        		if (!checkIOIresp.isEmpty() && checkIOIresp.size() > 0) {
	        			getIOI = checkIOIresp.get(0);
	        			getInstrIssrId = checkIOIresp.get(1);
	        			
	        			logger.info("DB response loaded into array. First element value, representing IOI is: "+getIOI);
	        			logger.info("Second element value is instr_issr_id: "+getInstrIssrId);
	        	    }
	        		
	        		//Check if response given and if first element in array is empty, it means there is no IRGP entry, 
	        		// and if second element is present then use that as instr_issr_id in creating IRGP segment
	        		if ((getIOI == null || "".equals(getIOI)) && (!(getInstrIssrId == null || "".equals(getInstrIssrId)))) {
	        			
	        			logger.info("Record not in IOI...calling method to add record to IOI using instr_issr_id found in DB response.");
	        			
	        			SegmentId issrSeg = msg.addSegment(XMLMessage.A_REFERENCE, "Issuer");
	        			msg.addField("INSTR_ISSR_ID", issrSeg, getInstrIssrId);

	        			SegmentId irgpSeg = msg.addSegment(XMLMessage.A_UNKNOWN, "ISSRIssuerGroupParticipant");
	        			msg.addField("PRNT_ISSR_GRP_OID", irgpSeg, IRGPInventoryOid);
	        			msg.addField("PRT_PURP_TYP", irgpSeg, "INTEREST");
	        			msg.addField("INSTR_ISSR_ID", irgpSeg, getInstrIssrId);
	        		

	        		if(logger.isDebugEnabled())
                      logger.debug("xml: " + msg.getXMLString());;

	        		} else {
	        			
	        			logger.info("Record already in " + IRGPInventoryName + ". Continuing with processing...");
	        		}
        		// }

        		//Used for debugging:
        		//logger.info("Finding children instmnems to add to array list...");
        		//upChildren = findChildren(dbConnection, ultParent);
        		   		
        		
        		//find valid linked child issuers and insert into DB
        		findValidIssrs(dbConnection, trn_id, ultParent, IRGPInventoryOid);
        		//find valid linked child customers and insert into DB
        		if ("Y".equals(IRGPCustomerPublish)) {
        			logger.info("IRGPCustomerPublish is " + IRGPCustomerPublish + ", so looking for customers to publish");
        			findValidCusts(dbConnection, trn_id, ultParent);
        		}
        		else {
        			logger.info("IRGPCustomerPublish is " + IRGPCustomerPublish + ", so skip looking for customers to publish");
        		}
        		
        		
        		//next section covers when there is a change involving inst_mnem and prnt_inst_mnem for MHIPARNT updates
        		//find valid linked child issuers to MHIPARNT child inst_mnem and insert into DB
        		findValidMHIPChildIssrs(dbConnection, trn_id, MHIPARNTInstmnem, IRGPInventoryOid);
        		//find valid linked child customers to MHIPARNT child inst_mnem and insert into DB
        		if ("Y".equals(IRGPCustomerPublish)) {
        			logger.info("IRGPCustomerPublish is " + IRGPCustomerPublish + ", so looking for UP customers to publish");
        			findValidMHIPChildCusts(dbConnection, trn_id, MHIPARNTInstmnem, IRGPInventoryOid);
        		}
        		else {
        			logger.info("IRGPCustomerPublish is " + IRGPCustomerPublish + ", so skip looking for UP customers to publish");
        		}

        		//exit out of rule as there is no need to run processing again for other scenarios
        		return true;
        		
        	} else if ("PARNTCOF".equals(relTyp) && !("N".equals(segAtrib)))
        	
        	{
        		
        		if (logger.isInfoEnabled())
    			{
    				logger.info("Valid rel_typ found of:"+relTyp+" for instmnem:"+ultParent+".");
    			}
        		
        		//parntcofUpdate = true;
        		
        		boolean result= checkUPandIOI(dbConnection,ultParent, IRGPInventoryOid) ;
        		if (result == true) {
        			logger.info("Record "+ultParent+" is Ultimate Parent in the IOI.");
        			

    				findValidIssrs(dbConnection, trn_id, ultParent, IRGPInventoryOid);
    				if ("Y".equals(IRGPCustomerPublish)) {
            			logger.info("IRGPCustomerPublish is " + IRGPCustomerPublish + ", so looking for UP customers to publish");
            			findValidCusts(dbConnection, trn_id, ultParent);
    				}
    				else {
            			logger.info("IRGPCustomerPublish is " + IRGPCustomerPublish + ", so skip looking for UP customers to publish");
            		}
            		
            		//exit out of rule as there is no need to run processing again for other scenarios
            		return true;
    			
    			} else {
    				logger.info("Not an Ultimate Parent in the IOI.");
        			
        		}

        	}  
        	
        	logger.info("Rel_typ found of:"+relTyp+". Segment attributeis: "+segAtrib+". Action type is: "+actionType+". This combination is not valid for FFRL processing.");
        } 
        
        //Use case for when a SECOREFE is inserted 
        for(SegmentId msgSegId : segmentIDFIID)
        {
        	if (logger.isInfoEnabled())
			{
				logger.info("segmentIDFIID found. Going into segmentIDFIID logic...");
			}
        	//secorefeUpdate = true;
        	
        	String fiidCtxtTyp = msg.getStringField("FINS_ID_CTXT_TYP", msgSegId);
        	logger.info("FINS_ID_CTXT_TYP = " + fiidCtxtTyp);
        	String fiidInstmnem = msg.getStringField("INST_MNEM", msgSegId);
        	logger.info("INST_MNEM = " + fiidInstmnem);
        	String fiidOid = msg.getStringField("FIID_OID", msgSegId);
        	logger.info("FIID_OID = " + fiidOid);

			//EG-8701 - Excessive issuer publish fix change
			String strFinsId = msg.getStringField("FINS_ID", msgSegId);
			logger.info("FINS_ID = " + strFinsId);

			String segAtrib = msg.getSegmentAttribute(msgSegId, "SEGPROCESSEDIND");
			String segAction = msg.getAction(msgSegId);
			logger.info("Action is " + segAction);

			//check if it is SECOREFE
        	if ("".equals(fiidCtxtTyp) || fiidCtxtTyp == null) {
        		
        		//check on DB if update/delete is for fins_id_ctxt_tpy of SECOREFE. Cannot tell from message...
        		String fiidOID = msg.getStringField("FIID_OID", msgSegId);
        		String checkIdCtxtTypeSql = "select fins_id_ctxt_typ from FT_T_FIID where fiid_oid = '"+fiidOID+"'";
        		logger.info("SQL to find fins_id_ctxt_Type = " + checkIdCtxtTypeSql);

        		fiidCtxtTyp = selectQueryString(dbConnection, checkIdCtxtTypeSql);
	        	logger.info("After SQL call, fiidCtxtType = " + fiidCtxtTyp);
	        		
	        }
        	
			logger.info("fiidCtxtTyp: "+ fiidCtxtTyp);
			logger.info("segAtrib: "+ segAtrib);
			logger.info("segAction: "+ segAction);
			if ("SECOREFE".equals(fiidCtxtTyp)) { // SPT - was ("SECOREFE".equals(fiidCtxtTyp) && !("N".equals(segAtrib)))
				logger.info("Check INST_MNEM");
				if ("".equals(fiidInstmnem) || fiidInstmnem == null) {
	        		
	        		//get INST_MNEM from db
	        		String fiidOID = msg.getStringField("FIID_OID", msgSegId);
	        		String checkInstMnemInDbSql = "select inst_mnem from FT_T_FIID where fiid_oid = '"+fiidOID+"'";
	        		logger.info("SQL to find INST_MNEM = " + checkInstMnemInDbSql);

	        		fiidInstmnem = selectQueryString(dbConnection, checkInstMnemInDbSql);
		        	logger.info("After SQL call, INST_MNEM = " + fiidInstmnem);
		        		
		        }

        		logger.info("No longer check for IOI membership, continue as if it is a member....");
				logger.info("Found SECOREFE data...checking if record in IOI.");
        		
        		//Check record is of interest
						logger.info("checking if record is in the " + IRGPInventoryName + " IOI group...");

        		String checkIOIsql = "select count(*) from FT_T_ISSR issr, "+ 
        		"(select * from FT_T_IRGP where prnt_issr_grp_oid='" + IRGPInventoryOid + "' and end_tms is null) irgp "+ 
        		"where issr.instr_issr_id = irgp.instr_issr_id "+
        		"and issr.end_tms is null "+
        		"and issr.fins_inst_mnem ='"+fiidInstmnem+"'";
        		
        		// Force record to appear in IOI by adding 1 to count.
        		int checkIOIresp = Integer.valueOf(selectQueryString(dbConnection, checkIOIsql)) + 1;
        		
        		//Check if response given, hence in IOI
        		if (checkIOIresp > 0){
        			logger.info("We go here now, even if not in IOI");
        			logger.info("Record is in " + IRGPInventoryName + " Issuer of Interest group. Processing...");

					//SPT start
					logger.info("checking if SECOREFE is end dated");
					if ("DELETE".equals(segAction)) {
						logger.info("action is DELETE");
						logger.info("The new ultimate parent is now further up the tree, so find it");			
						logger.info("This inst_mnem is " + fiidInstmnem);
						String findNewUltimateParentsql= "select mhi_fins_up('" + fiidInstmnem + "') from dual";
						logger.info("SQL IS " + findNewUltimateParentsql);
						String newUltimateParent=String.valueOf(selectQueryString(dbConnection, findNewUltimateParentsql));
						logger.info("New ultimate parent InstMnem = " + newUltimateParent);
						String checkNewIOIsql = "select count(*) from FT_T_ISSR issr, "+
								"(select * from FT_T_IRGP where prnt_issr_grp_oid='" + IRGPInventoryOid + "' and end_tms is null) irgp "+
								"where issr.instr_issr_id = irgp.instr_issr_id "+
								"and issr.end_tms is null "+
								"and issr.fins_inst_mnem ='"+newUltimateParent+"'";

						int checkUPIOICount = Integer.valueOf(selectQueryString(dbConnection, checkNewIOIsql));
						if (checkUPIOICount>0) {
							logger.info("The new ultimate parent is in " + IRGPInventoryName);
							logger.info("Look for child issuers of " + fiidInstmnem);
							findValidIssrs(dbConnection, trn_id, fiidInstmnem, IRGPInventoryOid);
							if ("Y".equals(IRGPCustomerPublish)) {
		            			logger.info("IRGPCustomerPublish is " + IRGPCustomerPublish + ", so looking for child customers of " + fiidInstmnem);		            			
		            			findValidCusts(dbConnection, trn_id, fiidInstmnem);
							}
							else {
								logger.info("IRGPCustomerPublish is " + IRGPCustomerPublish + ", so skip looking for child customers of " + fiidInstmnem);
							}

						}
						else {
							logger.info("The new ultimate parent is not in IOI");
							logger.info("Record not in IOI...calling method to add record to IOI using instr_issr_id found in DB response.");

							String checkUPIOIsql = "select irgp.instr_issr_id ofinterest, issr.instr_issr_id from FT_T_ISSR issr, "+
									"LEFT JOIN (select * from FT_T_IRGP where prnt_issr_grp_oid='" + IRGPInventoryOid + "' and end_tms is null) irgp "+
									"ON issr.instr_issr_id = irgp.instr_issr_id"+
									"where issr.end_tms is null "+
									"and issr.fins_inst_mnem ='"+selectQueryString(dbConnection,findNewUltimateParentsql)+"'";

							ArrayList<String> checkUPIOIresp = selectQueryList(dbConnection,checkUPIOIsql);

							String getIOI = null;
							String getUPInstrIssrId = null;

							//If the new IOI is not in the inventory, add it to IOI and re-publish from new IOI downward
							if (!checkUPIOIresp.isEmpty() && checkUPIOIresp.size() > 0) {
								logger.info("new ultimate parent is not in " + IRGPInventoryName);
								getIOI = checkUPIOIresp.get(0);
								getUPInstrIssrId = checkUPIOIresp.get(1);

								logger.info("add ultimate parent to IOI - create ISSRIssuerGroupParticipant segment");
								SegmentId issrSeg = msg.addSegment(XMLMessage.A_REFERENCE, "Issuer");
								msg.addField("INSTR_ISSR_ID", issrSeg, getUPInstrIssrId);
								SegmentId irgpSeg = msg.addSegment(XMLMessage.A_UNKNOWN, "ISSRIssuerGroupParticipant");
								msg.addField("PRNT_ISSR_GRP_OID", irgpSeg, IRGPInventoryOid);
								msg.addField("PRT_PURP_TYP", irgpSeg, "INTEREST");
								msg.addField("INSTR_ISSR_ID", irgpSeg, getUPInstrIssrId);

								//logger.info("MSG after IRGP insertion = " + msg.getXMLString());
								logger.info("Look for child issuers of " + newUltimateParent);
								findValidIssrs(dbConnection, trn_id, newUltimateParent, IRGPInventoryOid);
								if ("Y".equals(IRGPCustomerPublish)) {
			            			logger.info("IRGPCustomerPublish is " + IRGPCustomerPublish + ", so looking for child customers of " + newUltimateParent);
			            			findValidCusts(dbConnection, trn_id, newUltimateParent);
								}
								else {
			            			logger.info("IRGPCustomerPublish is " + IRGPCustomerPublish + ", so skip looking for child customers of " + newUltimateParent);									
								}
							}
							else {
								// no need to publish new ultimate parent as it is in the IOI
								// so publish from current position downward
								logger.info("new ulitmate parent is already in IOI");
								logger.info("Look for child issuers of " + fiidInstmnem);
								findValidIssrs(dbConnection, trn_id, fiidInstmnem, IRGPInventoryOid);
								if ("Y".equals(IRGPCustomerPublish)) {
			            			logger.info("IRGPCustomerPublish is " + IRGPCustomerPublish + ", so looking for child customers of " + fiidInstmnem);
			            			findValidCusts(dbConnection, trn_id, fiidInstmnem);
								}
								else {
			            			logger.info("IRGPCustomerPublish is " + IRGPCustomerPublish + ", so skip looking for child customers of " + fiidInstmnem);									
								}
							}
						}
					}
					//SPT END
					else {
						//EG-8701 - Check if this SECOREFE is inserted on the database i.e., it is a new insert today.
						// For this FINS_ID and START_TMS in the message should be on the database.
						//Check record is of interest
						String strSecRefSql = "select count(*) from FT_T_FIID  "+
								"where fins_id_ctxt_typ = 'SECOREFE' "+
								"and inst_mnem ='"+fiidInstmnem+"' " +
								" and fins_id ='" + strFinsId + "' " +
								" and CAST(start_tms AS DATE) = CAST(SYSDATE() AS DATE) " +
								" and end_tms is null";

						logger.info("SECOREFE check SQL "+ strSecRefSql );
						int intSecrefCount = Integer.valueOf(selectQueryString(dbConnection, strSecRefSql));
						logger.info("Count of SECOREFE is = " + intSecrefCount);

						if( intSecrefCount > 0 ) {
							logger.info("Look for child issuers of " + fiidInstmnem);
							findValidIssrs(dbConnection, trn_id, fiidInstmnem, IRGPInventoryOid);
							if ("Y".equals(IRGPCustomerPublish)) {
		            			logger.info("IRGPCustomerPublish is " + IRGPCustomerPublish + ", so looking for child customers of " + fiidInstmnem);
		            			findValidCusts(dbConnection, trn_id, fiidInstmnem);
							}
							else {
								logger.info("IRGPCustomerPublish is " + IRGPCustomerPublish + ", so skip looking for child customers of " + fiidInstmnem);
							}
						}
					}
            		//exit out of rule as there is no need to run processing again for other scenarios
            		return true;
        			
        		} else {
        			if (logger.isInfoEnabled())
        			{
        				logger.info("Record is not in " + IRGPInventoryName);
        			}
        			
        		}
        	
    		
        	} else {

	        	logger.info("Record has not qualified as a FIID SECOREFE insert/delete.");
	        }
        }

        boolean publishRequired = false;
        for(SegmentId msgSegId : segmentIDs)
		{
			String segType = msg.getSegmentType(msgSegId);
			if (logger.isInfoEnabled())
			{
				logger.info("Segment found is " + segType);
			}
			//Check record is of interest
			String fiidInstmnem = msg.getStringField("INST_MNEM", msgSegId);

			String checkIOIsql = "select count(*) from FT_T_ISSR issr, "+
					"(select * from FT_T_IRGP where prnt_issr_grp_oid='" + IRGPInventoryOid + "' and end_tms is null) irgp "+
					"where issr.instr_issr_id = irgp.instr_issr_id "+
					"and issr.end_tms is null "+
					"and issr.fins_inst_mnem ='"+fiidInstmnem+"'";

			int checkIOIresp = Integer.valueOf(selectQueryString(dbConnection, checkIOIsql));

			//Check if response given, hence in IOI
			if (checkIOIresp > 0) {

				logger.info("Record is in Issuer of Interest group "+ IRGPInventoryName + ". Processing...");
				String actionType = msg.getAction(msgSegId);
				logger.info("Segment action is " + actionType);

				if ("FinancialInstitution".equals(segType) & "UPDATE".equals(actionType))
				{
					logger.info("This is a Financial Institution Update, so publish required");
					publishRequired = true;
				}
				if ("FinancialInstitutionIdentifier".equals(segType) & "UPDATE".equals(actionType))
				{
					logger.info("This is a Financial Institution Identifier Update, so publish required");
					publishRequired = true;
				}
				if ("FinancialInstitutionGeoUnitPrt".equals(segType) & "UPDATE".equals(actionType))
				{
					logger.info("This is a Financial Institution Geou Unit Prt change, so publish required");
					publishRequired = true;
				}
				if (publishRequired)
				{
					findValidIssrs(dbConnection, trn_id, fiidInstmnem, IRGPInventoryOid);
					if ("Y".equals(IRGPCustomerPublish)) {
            			logger.info("IRGPCustomerPublish is " + IRGPCustomerPublish + ", so looking for child customers of " + fiidInstmnem);
            			findValidCusts(dbConnection, trn_id, fiidInstmnem);
					}
					else {
						logger.info("IRGPCustomerPublish is " + IRGPCustomerPublish + ", so skip looking for child customers of " + fiidInstmnem);
					}

					//exit out of rule as there is no need to run processing again for other scenarios
					return true;
				}
			}
			else
			{
				logger.info("Record is not in Issuer of Interest group " + IRGPInventoryName + ". Exiting...");
				return true;
			}
		}
            
        return true;
	}

	private boolean checkUPandIOI (DatabaseAccess dbConnection, String ultParent, String IRGPInventoryOid ){
		//check if ultimate parent and in IOI
		String checkUPSql = "select count(*) from (select * from FT_T_FIID where end_tms is null and fins_id_ctxt_typ = 'SECOREFE') fiid, "+
		"FT_T_ISSR issr, "+
		"(select * from FT_T_IRGP where prnt_issr_grp_oid='" + IRGPInventoryOid + "' and end_tms is null) irgp "+
		"where fiid.INST_MNEM = issr.FINS_INST_MNEM "+
		"and issr.instr_issr_id = irgp.instr_issr_id "+
		"and issr.end_tms is null "+
		"and fiid.inst_mnem ='"+ultParent+"'";
		
		String checkUPreply = "";
		
		try {
			dbConnection.setSQL(checkUPSql);
			dbConnection.execute();
			while (!dbConnection.isEndOfStream()) {
				checkUPreply = (dbConnection.getNextString().trim());
			}
			dbConnection.close();
		} catch (Exception e) {
			logger.error("SQL query failed, message = '"+ e.getMessage() + "'");
			logger.info(e);
		}
		
		
		if (Integer.parseInt(checkUPreply) > 0 ) {
			return true;
		}
		
		
		return false;
	}
	
	public void findValidIssrs(DatabaseAccess dbConnection, String trn_id, String ultParent, String IRGPInventoryOid){
		ArrayList<String> issrsList = new ArrayList<String>();
		
		
			logger.info("Checking if there are linked issuers to inst_mnem: "+ultParent);
			
			//check if inst_mnem has linked issuers that are of interest and extract issr_instr_id
			String listIssrSql = "SELECT distinct issr.instr_issr_id "+
								"FROM ft_t_issr issr, ft_t_irgp irgp "+
								"WHERE issr.instr_issr_id = irgp.instr_issr_id "+
								"AND irgp.prt_purp_typ = 'INTEREST' "+
								"AND irgp.prnt_issr_grp_oid = '" + IRGPInventoryOid + "' "+
								"AND issr.end_tms IS NULL "+
								"AND irgp.end_tms IS NULL "+
								"AND fins_inst_mnem IN "+
								       "(SELECT ffrl.inst_mnem "+
								        "FROM ft_t_ffrl ffrl "+
								          "JOIN ft_t_fins fins1 "+
								              "ON     fins1.inst_mnem = ffrl.inst_mnem "+
								              "AND fins1.end_tms IS NULL "+
								        "WHERE     ffrl.rel_typ IN ('PARNTCOF', 'MHIPARNT') "+
								              "AND ffrl.end_tms IS NULL "+
								        "START WITH     ffrl.prnt_inst_mnem IN ('"+ultParent+"') "+
								                   "AND ffrl.rel_typ IN ('PARNTCOF', 'MHIPARNT') "+
								                   "AND ffrl.end_tms IS NULL "+
								        "CONNECT BY NOCYCLE     ffrl.prnt_inst_mnem = "+
								                           "PRIOR ffrl.inst_mnem "+
								                           "AND ffrl.rel_typ IN ('PARNTCOF', 'MHIPARNT') "+
								                           "AND ffrl.end_tms IS NULL)";
				
			
			try {
				dbConnection.setSQL(listIssrSql);
				dbConnection.execute();
				while (!dbConnection.isEndOfStream()) {
					issrsList.add(dbConnection.getNextString().trim());
				}
				dbConnection.close();
			} catch (Exception e) {
				logger.error("SQL query failed, message = '"+ e.getMessage() + "'");
				logger.info(e);
			}

		
		
		if (logger.isInfoEnabled())
		{
			logger.info("Count of child issuers found: "+issrsList.size());
		}

		if(issrsList.size() > 0){
			
			logger.info("Found following valid child instr_issr_id(s): ");
			for (String strIssr : issrsList) {
				logger.info(strIssr);        			
			}
			
			logger.info("Now inserting ISSRs into DB table...");
			//insert issrs into DB
			insertListIntoDB(dbConnection, trn_id, ultParent, issrsList, "ISSR");
		} else
		{
			logger.info("No linked issuers found. ");
		}
	}
	
	public void findValidMHIPChildIssrs(DatabaseAccess dbConnection, String trn_id, String MHIPARNTInstmnem, String IRGPInventoryOid){
		ArrayList<String> issrsList = new ArrayList<String>();
		
		
			logger.info("Checking if there are linked issuers to inst_mnem: "+MHIPARNTInstmnem);
			
			//check if inst_mnem has linked issuers that are of interest and extract issr_instr_id
			
			String listMHIIssrSql = "SELECT DISTINCT issr.instr_issr_id "+ 
			"FROM ft_t_issr issr, ft_t_irgp irgp "+
			"WHERE issr.instr_issr_id = irgp.instr_issr_id "+
			"AND irgp.prt_purp_typ = 'INTEREST' "+
			"AND irgp.prnt_issr_grp_oid = '" + IRGPInventoryOid + "' "+
			"AND issr.end_tms IS NULL "+
			"AND irgp.end_tms IS NULL "+
			"AND fins_inst_mnem = '"+MHIPARNTInstmnem+"'";
			
			
			try {
				dbConnection.setSQL(listMHIIssrSql);
				dbConnection.execute();
				while (!dbConnection.isEndOfStream()) {
					issrsList.add(dbConnection.getNextString().trim());
				}
				dbConnection.close();
			} catch (Exception e) {
				logger.error("SQL query failed, message = '"+ e.getMessage() + "'");
				logger.info(e);
			}

		
		
		if (logger.isInfoEnabled())
		{
			logger.info("Count of child issuers found: "+issrsList.size());
		}

		if(issrsList.size() > 0){
			
			logger.info("Found following valid child instr_issr_id(s): ");
			for (String strIssr : issrsList) {
				logger.info(strIssr);        			
			}
			
			logger.info("Now inserting ISSRs into DB table...");
			//insert issrs into DB
			insertListIntoDB(dbConnection, trn_id, MHIPARNTInstmnem, issrsList, "ISSR");
		} else
		{
			logger.info("No linked issuers found. ");
		}
	}
	
	
	public void findValidCusts(DatabaseAccess dbConnection, String trn_id, String ultParent){
		ArrayList<String> custsList = new ArrayList<String>();
		
		
		logger.info("Checking if there are linked customers to inst_mnem: "+ultParent);
		
		//check if inst_mnem has linked customers that are of interest and extract cst_id(s)
		String listCustSql ="SELECT distinct cust.cst_id "+  
							"FROM FT_T_CUST cust "+ 
							"WHERE cust.end_tms IS NULL "+ 
							"AND cust.CST_STAT_TYP IN ('ACTIVE','OPEN') "+  
							"AND cust.inst_mnem in "+ 
							"(SELECT ffrl.inst_mnem "+
							"FROM ft_t_ffrl ffrl "+
							"JOIN ft_t_fins fins1 "+
							"ON     fins1.inst_mnem = ffrl.inst_mnem "+
							"AND fins1.end_tms IS NULL "+
							"WHERE     ffrl.rel_typ IN ('PARNTCOF', 'MHIPARNT') "+
							"AND ffrl.end_tms IS NULL "+
							"START WITH     ffrl.inst_mnem IN ('"+ultParent+"') "+
							"AND ffrl.rel_typ IN ('PARNTCOF', 'MHIPARNT') "+
							"AND ffrl.end_tms IS NULL "+
							"CONNECT BY NOCYCLE     ffrl.prnt_inst_mnem = "+
							"PRIOR ffrl.inst_mnem "+
					        "AND ffrl.rel_typ IN ('PARNTCOF', 'MHIPARNT') "+
					        "AND ffrl.end_tms IS NULL)";
			
		
		try {
			dbConnection.setSQL(listCustSql);
			dbConnection.execute();
			while (!dbConnection.isEndOfStream()) {
				custsList.add(dbConnection.getNextString().trim());
			}
			dbConnection.close();
		} catch (Exception e) {
			logger.error("SQL query failed, message = '"+ e.getMessage() + "'");
			logger.info(e);
		}

		
		
		if (logger.isInfoEnabled())
		{
			logger.info("Count of child customers found: "+custsList.size());
		}
	
		if(custsList.size() > 0){
			
			logger.info("Found following valid customer(s): ");
			for (String strIssr : custsList) {
				logger.info(strIssr);        			
			} 
			
			logger.info("Now inserting CUSTs into DB table...");
			//insert custs into DB
			insertListIntoDB(dbConnection, trn_id, ultParent, custsList, "CUST");
		} else
		{
			logger.info("No linked customers found. ");
		}
	}
	
	
	public void findValidMHIPChildCusts(DatabaseAccess dbConnection, String trn_id, String MHIPARNTInstmnem, String IRGPInventoryOid){
		ArrayList<String> custsList = new ArrayList<String>();
		
		
		logger.info("Checking if there are linked customers to inst_mnem: "+MHIPARNTInstmnem);
		
		//check if inst_mnem has linked customers that are of interest and extract cst_id(s)
		String listMHICustsSql = "SELECT DISTINCT cust.cst_id "+
		"FROM ft_t_issr issr, ft_t_irgp irgp, ft_t_cust cust "+
		"WHERE issr.instr_issr_id = irgp.instr_issr_id "+
		"AND issr.fins_inst_mnem = cust.inst_mnem "+
		"AND irgp.prt_purp_typ = 'INTEREST' "+
		"AND irgp.prnt_issr_grp_oid = '" + IRGPInventoryOid + "' "+
		"AND issr.end_tms IS NULL "+
		"AND irgp.end_tms IS NULL "+
		"AND cust.end_tms IS NULL "+
		"AND cust.CST_STAT_TYP IN ('ACTIVE','OPEN') "+
		"AND fins_inst_mnem = '"+MHIPARNTInstmnem+"'";
		
		
		try {
			dbConnection.setSQL(listMHICustsSql);
			dbConnection.execute();
			while (!dbConnection.isEndOfStream()) {
				custsList.add(dbConnection.getNextString().trim());
			}
			dbConnection.close();
		} catch (Exception e) {
			logger.error("SQL query failed, message = '"+ e.getMessage() + "'");
			logger.info(e);
		}

		
		
		if (logger.isInfoEnabled())
		{
			logger.info("Count of child customers found: "+custsList.size());
		}
	
		if(custsList.size() > 0){
			
			logger.info("Found following valid customer(s): ");
			for (String strIssr : custsList) {
				logger.info(strIssr);        			
			} 
			
			logger.info("Now inserting CUSTs into DB table...");
			//insert custs into DB
			insertListIntoDB(dbConnection, trn_id, MHIPARNTInstmnem, custsList, "CUST");
		} else
		{
			logger.info("No linked customers found. ");
		}
	}

	private void insertListIntoDB(DatabaseAccess dbConnection, String trn_id, String ultParent, ArrayList<String> upEntityChildren, String entityType ){
	    if (logger.isInfoEnabled()) {
	      logger.info("Processing method insertListIntoDB.");
	    }
	    
	    for (String item : upEntityChildren) {
	        System.out.println(item);
	        String insertUPChildrenSQL="INSERT INTO up_children SELECT new_oid(),'"+trn_id+"', null, SYSDATE(),'"+ultParent+"','"+item+"','"+entityType+"'"+ 
	        		" FROM dual WHERE NOT EXISTS (SELECT * FROM UP_CHILDREN WHERE prnt_inst_mnem = '"+ultParent+"' AND cross_ref_id='"+item+"'"
    				+ " AND START_TMS > sysdate() - INTERVAL '1 hour' )";
	        logger.info("insertUPChildrenSQL = " + insertUPChildrenSQL);
	        dbConnection.setSQL(insertUPChildrenSQL);
	        
	        
	        try
		    {
		      dbConnection.execute();
		    }
	        
	        catch (Exception e1)
		    {
		      e1.printStackTrace();
		      logger.info("Failed dbconnection.execute process:" + item);
		    }
    
	    }
	    
	    logger.info("Closing DB connection.");
	    dbConnection.close();
 
	}
	
	
	public List<SegmentId> getSegmentIds(String segType, XMLMessage msg) {
        List<SegmentId> segIdList = new ArrayList<SegmentId>();
        for (int i=0; i<msg.getSegmentCount(); i++) {
                        SegmentId segId = new SegmentId(i);                                   
                        if (msg.getSegmentType(segId).equals(segType)) {
                                        segIdList.add(segId);
                        }
        }                              
        return segIdList;               
	}
	
	ArrayList<String> selectQueryList(DatabaseAccess dbConnection, String query){
		ArrayList<String> retValue = new ArrayList<String>();
		try {
			dbConnection.setSQL(query);
			dbConnection.execute();
			while (!dbConnection.isEndOfStream()) {
				retValue.add(dbConnection.getNextString().trim());
			}
			dbConnection.close();
		} catch (Exception e) {
			logger.error("SQL query failed, message = '"+ e.getMessage() + "'");
			logger.info(e);
		}
		return retValue;
	}
	
	String selectQueryString(DatabaseAccess dbConnection, String query){
		String retValue = "";
		try {
			dbConnection.setSQL(query);
			dbConnection.execute();
			while (!dbConnection.isEndOfStream()) {
				retValue = (dbConnection.getNextString().trim());
			}
			dbConnection.close();
		} catch (Exception e) {
			logger.error("SQL query failed, message = '"+ e.getMessage() + "'");
			logger.info(e);
		}
		return retValue;
	}
	
}