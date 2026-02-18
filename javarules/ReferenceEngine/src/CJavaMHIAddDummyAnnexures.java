import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.*;
import java.lang.*;
import org.apache.log4j.Logger;

import com.thegoldensource.jbre.DatabaseAccess;
import com.thegoldensource.jbre.DatabaseObjectContainer;
import com.thegoldensource.jbre.GSException;
import com.thegoldensource.jbre.JavaRule;
import com.thegoldensource.jbre.NotificationCreator;
import com.thegoldensource.jbre.ProcessorContext;
import com.thegoldensource.jbre.SegmentId;
import com.thegoldensource.jbre.XMLMessage;

public class CJavaMHIAddDummyAnnexures implements JavaRule{
	
	
	private static Logger logger = Logger.getLogger("CJavaMHIAddDummyAnnexures");
	//private static int count= 0;
	
	public boolean initialize(String[] params) {
		if (logger.isInfoEnabled())
		logger.info("Initializing CJavaMHIAddDummyAnnexures Rule");
		return true;
	}
	
	public boolean process(XMLMessage msg, DatabaseObjectContainer dboc,
			ProcessorContext pContext, DatabaseAccess dbConn, NotificationCreator notfcn)
	throws GSException {
	
	 if(logger.isDebugEnabled())
       logger.debug("xml: " + msg.getXMLString());
	
	
	String mainEntityTblTyp = msg.getStringField("MAIN_ENTITY_TBL_TYP", new SegmentId(0));
		if(null == mainEntityTblTyp || !"LAGR".equalsIgnoreCase(mainEntityTblTyp)){
			
			if(logger.isDebugEnabled())
             logger.debug("xml: " + msg.getXMLString());
		 
			return true;
		}
		
		
		String msgClassification = msg.getStringField("MSG_CLASSIFICATION", new SegmentId(0));
		if(!"WEBMSG".equalsIgnoreCase(msgClassification))
		{
			
			 if(logger.isDebugEnabled()){
             logger.debug("xml: " + msg.getXMLString());
			 logger.info("Message is not UI. Hence Exiting");
			 }
	
			return true;
		}
	
	    SegmentId lagrSegId = new SegmentId(0);
		String action = msg.getAction(lagrSegId);
		
		//if(!("INSERT".equals(action)))
		//{
			//if (logger.isInfoEnabled())
			//{
			//logger.info("Message action is not insert. Hence Exiting");
			//logger.info("MSG = "+msg.getXMLString());
			//}
			//return true;
		//}
					  List<SegmentId> segmentIDLAGR = new ArrayList<SegmentId>();
					segmentIDLAGR = getSegmentIds("LegalAgreement", msg);
					
					logger.info("segmentIDLAGR - "+ segmentIDLAGR);
					String agrmntPurpTyp = msg.getStringField("AGRMNT_PURP_TYP", lagrSegId);
					
					logger.info("agrmntPurpTyp - "+ agrmntPurpTyp);
					
					logger.info("segmentIDLAGR - "+ segmentIDLAGR);
					String agrmntTyp = msg.getStringField("AGRMNT_TYP", lagrSegId);
					
					logger.info("agrmntTyp - "+ agrmntTyp);
					
					String lagrOID = msg.getStringField("LAGR_OID", lagrSegId);
					logger.info("lagrOID - "+ lagrOID);
					
					
					String lastChangeUserID = msg.getStringField("LAST_CHG_USR_ID", lagrSegId);
					logger.info("lastChangeUserID - "+ lastChangeUserID);
		
		
					//	if(!(agrmntPurpTyp.equals("LEGAGRMT") || agrmntPurpTyp.equals("LGAGTCEA")))
					//		return true;
					
					
					//only for clearing agreement screen 
	 if(agrmntPurpTyp.equals("LGAGTCEA")){
	 
	 //CODE STARTS FOR AUTO GENERATION OF AGREEMENT DESCRIPTION
	 
	  logger.info("CODE STARTS FOR AUTO GENERATION OF LGAGTCEA AGREEMENT DESCRIPTION== ");
	 
	 
	 String agrmntDesc = getFirstValDB("select agrmnt_desc from ft_T_lagr where lagr_oid='"+lagrOID+"' and end_tms is null",dbConn, logger);
	 
	 logger.info("agrmntDesc - "+ agrmntDesc);
	 
					 if(agrmntDesc == null || agrmntDesc.trim().isEmpty()){
					 
					 String institutionName = getFirstValDB(
															"SELECT inst_nme FROM FT_T_FINS " +
															"WHERE inst_mnem IN(" +
																"SELECT inst_mnem FROM FT_T_FLAR " +
																"WHERE lagr_oid = '"+lagrOID+"'" +
																" AND rl_typ = 'CPTY' " +
																" AND end_tms IS NULL" +
															")",
															dbConn, logger
														);
														
										 logger.info("institutionName - "+ institutionName);
										 
					 	//concat institutionName and agrmntTyp
					 
					 String agreemntDescription = institutionName+" - "+agrmntTyp;
					 
					 
					 SegmentId LAGRSeg = msg.addSegment(XMLMessage.A_D_UPDATE,"LegalAgreement");
										msg.addField("LAGR_OID",LAGRSeg,lagrOID);
										msg.addField("AGRMNT_DESC",LAGRSeg,agreemntDescription); 
																			
									//logger.info("after adding AGRMNT_DESC in LAGR segment - "+ msg.getXMLString());
					 
					 
							 }
	 
                   logger.info("CODE ENDS FOR AUTO GENERATION OF AGREEMENT DESCRIPTION== ");

	 
	 List<SegmentId> segmentIDLAAP = new ArrayList<SegmentId>();
												segmentIDLAAP = getSegmentIds("FLARLegalAgreementAnnexParticipant", msg);
											
												if(segmentIDLAAP.size() == 0)
												return true;
											
								List<SegmentId> segmentIFLAR = new ArrayList<SegmentId>();
												segmentIFLAR = getSegmentIds("LAGRFinancialInstitutionAgreementRole", msg);					
												
												
											//loop in flar segment to check platform segment is created or not
					for(int f=0; f < segmentIFLAR.size(); f++){
											
											 SegmentId flarsegid = segmentIFLAR.get(f);
							                String rlType = msg.getStringField("RL_TYP", flarsegid);
											String flaroid = msg.getStringField("FLAR_OID", flarsegid);
											logger.info("flaroid - "+ flaroid);
											logger.info("rlType - "+ rlType);
											
							if(rlType.equals("PLATFORM")){
							          
									  logger.info("Processing PLATFORM Segments");	
																					    
											//loop in laap segemnts 
								for(int l=0;l< segmentIDLAAP.size();l++){
											
											SegmentId laapsegid = segmentIDLAAP.get(l);
											String laapoid = msg.getStringField("LAAP_OID", laapsegid);
											String laapFlaroid = msg.getStringField("FLAR_OID", laapsegid);
											
											logger.info("laapoid - "+ laapoid);
											
											 String annexprtModlTyp = msg.getStringField("ANNEX_PRT_MODL_TYP", laapsegid);
											logger.info("annexprtModlTyp - "+ annexprtModlTyp);
											
											//laapflaroid matches flaroid of platform segment
											if(flaroid.equals(laapFlaroid))
											{
										  
										  logger.info("flaroid of flar and flaroid of laap segment matches -- .");

										  String proceed = getFirstValDB("select laan_oid from ft_T_laap where laap_oid='"+laapoid+"' and flar_oid ='"+flaroid+"' and annex_prt_modl_typ = '"+annexprtModlTyp+"' and end_tms is null",dbConn, logger);
										        
												logger.info("proceed if laan oid is null-- "+proceed);

												
												if(proceed == null || proceed.trim().isEmpty()){
												
												logger.info("No laan oid exists for laap oid proceeding further --");
												
												if(annexprtModlTyp.equals("IM")){
												        String newOID = pContext.getOid();
														
														logger.info("before adding dummy laan segment for IM - "+ msg.getXMLString());

												
													SegmentId LAANSeg = msg.addSegment(XMLMessage.A_D_UNKNOWN, "LAGRLegalAgreementAnnexure");
													msg.addField("ANNEX_TYP",LAANSeg, "PLATFORMIM");
													msg.addField("ANNEX_MODL_TYP",LAANSeg, "DUMMYIM");
													msg.addField("START_TMS",LAANSeg, new Date());
													msg.addField("LAST_CHG_TMS",LAANSeg, new Date());
													msg.addField("DATA_STAT_TYP",LAANSeg, "ACTIVE");
													msg.addField("LAAN_OID",LAANSeg, newOID);
													msg.addField("LAGR_OID",LAANSeg, lagrOID);
													msg.addField("LAST_CHG_USR_ID",LAANSeg, lastChangeUserID);
								
											 logger.info("after adding dummy laan segment for IM - "+ msg.getXMLString());

												// add laan_oid of dummy laan segment in in LAAP Segment
								
											 SegmentId LAAPSeg = msg.addSegment(XMLMessage.A_UPDATE,"FLARLegalAgreementAnnexParticipant");
													msg.addField("LAAN_OID",LAAPSeg,newOID);
													msg.addField("LAAP_OID",LAAPSeg,laapoid);
													msg.addField("FLAR_OID",LAAPSeg,laapFlaroid);
													
												logger.info("after adding laan_oid in laap segment - "+ msg.getXMLString());
										   }
										
										     if(annexprtModlTyp.equals("VM")){
												String newOID = pContext.getOid();
												
													SegmentId LAANSeg = msg.addSegment(XMLMessage.A_D_UNKNOWN, "LAGRLegalAgreementAnnexure");
													msg.addField("ANNEX_TYP",LAANSeg, "PLATFORMVM");
													msg.addField("ANNEX_MODL_TYP",LAANSeg, "DUMMYVM");
													msg.addField("START_TMS",LAANSeg, new Date());
													msg.addField("LAST_CHG_TMS",LAANSeg, new Date());
													msg.addField("DATA_STAT_TYP",LAANSeg, "ACTIVE");
													msg.addField("LAAN_OID",LAANSeg, newOID);
													msg.addField("LAGR_OID",LAANSeg, lagrOID);
													msg.addField("LAST_CHG_USR_ID",LAANSeg, lastChangeUserID);
								
											 logger.info("after adding dummy laan segment For VM - "+ msg.getXMLString());

												// add laan_oid of dummy laan segment in in LAAP Segment
								
											 SegmentId LAAPSeg = msg.addSegment(XMLMessage.A_UPDATE,"FLARLegalAgreementAnnexParticipant");
													msg.addField("LAAN_OID",LAAPSeg,newOID);
													msg.addField("LAAP_OID",LAAPSeg,laapoid);
													msg.addField("FLAR_OID",LAAPSeg,laapFlaroid);
													
												logger.info("after adding laan_oid in laap segment - "+ msg.getXMLString());
										   }
																			   
								    }	
								}
							}
							
							//platform ends	
							}	
						      
							 if(rlType.equals("GUARPRTY")){
																	
													logger.info("Processing GUPARTY Segments");				
											//loop in laap segemnts 
								for(int l=0;l< segmentIDLAAP.size();l++){
											
											SegmentId laapsegid = segmentIDLAAP.get(l);
											String laapoid = msg.getStringField("LAAP_OID", laapsegid);
											String laapFlaroid = msg.getStringField("FLAR_OID", laapsegid);
											
											logger.info("laapoid - "+ laapoid);
											
											 String annexprtModlTyp = msg.getStringField("ANNEX_PRT_MODL_TYP", laapsegid);
											logger.info("annexprtModlTyp - "+ annexprtModlTyp);
											
											//laapflaroid matches flaroid of platform segment
											if(flaroid.equals(laapFlaroid))
											{
										  logger.info("flaroid of flar and flaroid of laap segment matches for GUARPRTY -- .");
										
										 String proceed = getFirstValDB("select laan_oid from ft_T_laap where laap_oid='"+laapoid+"' and flar_oid ='"+flaroid+"' and annex_prt_modl_typ = '"+annexprtModlTyp+"' and end_tms is null",dbConn, logger);
										 
										 logger.info("proceed if laan oid is null-- "+proceed);
										 
										 if(proceed == null || proceed.trim().isEmpty()){
										         if(annexprtModlTyp.equals("IM")){
												        String newOID = pContext.getOid();
												
													SegmentId LAANSeg = msg.addSegment(XMLMessage.A_D_UNKNOWN, "LAGRLegalAgreementAnnexure");
													msg.addField("ANNEX_TYP",LAANSeg, "GUARPARTYIM");
													msg.addField("ANNEX_MODL_TYP",LAANSeg, "DUMMYIM");
													msg.addField("START_TMS",LAANSeg, new Date());
													msg.addField("LAST_CHG_TMS",LAANSeg, new Date());
													msg.addField("DATA_STAT_TYP",LAANSeg, "ACTIVE");
													msg.addField("LAAN_OID",LAANSeg, newOID);
													msg.addField("LAGR_OID",LAANSeg, lagrOID);
													msg.addField("LAST_CHG_USR_ID",LAANSeg, lastChangeUserID);
								
											 logger.info("after adding dummy laan segment for Guparty IM - "+ msg.getXMLString());

												// add laan_oid of dummy laan segment in in LAAP Segment
								
											 SegmentId LAAPSeg = msg.addSegment(XMLMessage.A_UPDATE,"FLARLegalAgreementAnnexParticipant");
													msg.addField("LAAN_OID",LAAPSeg,newOID);
													msg.addField("LAAP_OID",LAAPSeg,laapoid);
													msg.addField("FLAR_OID",LAAPSeg,laapFlaroid);
													
												logger.info("after adding laan_oid in laap segment - "+ msg.getXMLString());
										   }
										
										     if(annexprtModlTyp.equals("VM")){
												String newOID = pContext.getOid();
												
													SegmentId LAANSeg = msg.addSegment(XMLMessage.A_D_UNKNOWN, "LAGRLegalAgreementAnnexure");
													msg.addField("ANNEX_TYP",LAANSeg, "GUARPARTYVM");
													msg.addField("ANNEX_MODL_TYP",LAANSeg, "DUMMYVM");
													msg.addField("START_TMS",LAANSeg, new Date());
													msg.addField("LAST_CHG_TMS",LAANSeg, new Date());
													msg.addField("DATA_STAT_TYP",LAANSeg, "ACTIVE");
													msg.addField("LAAN_OID",LAANSeg, newOID);
													msg.addField("LAGR_OID",LAANSeg, lagrOID);
													msg.addField("LAST_CHG_USR_ID",LAANSeg, lastChangeUserID);
								
											 logger.info("after adding dummy laan segment For Guparty VM - "+ msg.getXMLString());

												// add laan_oid of dummy laan segment in in LAAP Segment
								
											 SegmentId LAAPSeg = msg.addSegment(XMLMessage.A_UPDATE,"FLARLegalAgreementAnnexParticipant");
													msg.addField("LAAN_OID",LAAPSeg,newOID);
													msg.addField("LAAP_OID",LAAPSeg,laapoid);
													msg.addField("FLAR_OID",LAAPSeg,laapFlaroid);
													
												logger.info("after adding laan_oid in laap segment - "+ msg.getXMLString());
										   }
										 }								   
								    }	
								}
							
							//GUPARTY Ends	
							} 
							  
						}								   
				//clearing agreement code ends						
				 }
							  
					logger.info("Start Processing for reposeclending agreement ==  ");		  
							   //RepoSecLending  code starts
				 if(agrmntPurpTyp.equals("LGAGTREPO")){
							 
							 
					  logger.info("CODE ENDS FOR AUTO GENERATION OF LGAGTREPO AGREEMENT  DESCRIPTION== ");
							 
			   	 String agrmntDesc = getFirstValDB("select agrmnt_desc from ft_T_lagr where lagr_oid='"+lagrOID+"' and end_tms is null",dbConn, logger);
	 
	               logger.info("agrmntDesc - "+ agrmntDesc);
	 
					 if(agrmntDesc == null || agrmntDesc.trim().isEmpty()){
					 
					 String institutionName = getFirstValDB(
															"SELECT inst_nme FROM FT_T_FINS " +
															"WHERE inst_mnem IN(" +
																"SELECT inst_mnem FROM FT_T_FLAR " +
																"WHERE lagr_oid = '"+lagrOID+"'" +
																" AND rl_typ = 'CPTY' " +
																" AND end_tms IS NULL" +
															")",
															dbConn, logger
														);
														
										 logger.info("institutionName - "+ institutionName);
										 
					 	//concat institutionName and agrmntTyp
					 
					 String agreemntDescription = institutionName+" - "+agrmntTyp;
					 
					 
					 SegmentId LAGRSeg = msg.addSegment(XMLMessage.A_D_UPDATE,"LegalAgreement");
										msg.addField("LAGR_OID",LAGRSeg,lagrOID);
										msg.addField("AGRMNT_DESC",LAGRSeg,agreemntDescription); 
																			
									logger.info("after adding AGRMNT_DESC in LAGR segment - "+ msg.getXMLString());
					 
					 
							 }
	 
                   logger.info("CODE ENDS FOR AUTO GENERATION OF LGAGTREPO AGREEMENT  DESCRIPTION== ");
							 
							 
			}// RepoSecLending  code starts
							  
							  
							 
							 //ISDA master code starts
							 if(agrmntPurpTyp.equals("LEGAGRMT")){
							 
							  //if(!("INSERT".equals(action)))
								//{
								//	if (logger.isInfoEnabled())
								//	{
								//	logger.info("Message action is not insert. Hence Exiting");
								//	logger.info("MSG = "+msg.getXMLString());
								//	}
								//  return true;
							//	}
							 
							 
							  logger.info("CODE ENDS FOR AUTO GENERATION OF LEGAGRMT AGREEMENT DESCRIPTION== ");
							 
			   	 String agrmntDesc = getFirstValDB("select agrmnt_desc from ft_T_lagr where lagr_oid='"+lagrOID+"' and end_tms is null",dbConn, logger);
	 
	               logger.info("agrmntDesc - "+ agrmntDesc);
	 
					 if(agrmntDesc == null || agrmntDesc.trim().isEmpty()){
					 
					 String institutionName = getFirstValDB(
															"SELECT inst_nme FROM FT_T_FINS " +
															"WHERE inst_mnem IN(" +
																"SELECT inst_mnem FROM FT_T_FLAR " +
																"WHERE lagr_oid = '"+lagrOID+"'" +
																" AND rl_typ = 'CPTY' " +
																" AND end_tms IS NULL" +
															")",
															dbConn, logger
														);
														
										 logger.info("institutionName - "+ institutionName);
										 
					 	//concat institutionName and agrmntTyp
					 
					 String agreemntDescription = "ISDA/CSA - "+institutionName+" - "+agrmntTyp;
					 
					 
					 SegmentId LAGRSeg = msg.addSegment(XMLMessage.A_D_UPDATE,"LegalAgreement");
										msg.addField("LAGR_OID",LAGRSeg,lagrOID);
										msg.addField("AGRMNT_DESC",LAGRSeg,agreemntDescription); 
																			
									logger.info("after adding AGRMNT_DESC in LAGR segment - "+ msg.getXMLString());
					 
					 
							 }
	 
                   logger.info("CODE ENDS FOR AUTO GENERATION OF LEGAGRMT AGREEMENT DESCRIPTION== ");
							 
							 
							 
							 //lis of LAAN seg
							 List<SegmentId> segmentIDLAAN = new ArrayList<SegmentId>();
												segmentIDLAAN = getSegmentIds("LAGRLegalAgreementAnnexure", msg); 
							 
							 //lis of LAAP seg
							 List<SegmentId> segmentIDLAAP = new ArrayList<SegmentId>();
												segmentIDLAAP = getSegmentIds("FLARLegalAgreementAnnexParticipant", msg);
							
							//lis of FLAR seg
							List<SegmentId> segmentIFLAR = new ArrayList<SegmentId>();
												segmentIFLAR = getSegmentIds("LAGRFinancialInstitutionAgreementRole", msg);					
							 
						//	 int laapSegMentSize = segmentIDLAAP.size();
						//	 logger.info("laapSegMentSize - "+ laapSegMentSize);
							 
							 
							  // Laan oid based on ANNEX_MODL_TYP i.e CSA,VM and IM
							 String VMLaanOID="";
							  String IMLaanOID="";
							  String CSALaanOID="";
							
							
							  //looping on LAANSeg list to fetch laan oids
							  
							  for(int i=0;i < segmentIDLAAN.size();i++ ){
		
							  SegmentId laansegid = segmentIDLAAN.get(i);
							  String annexModlType = msg.getStringField("ANNEX_MODL_TYP", laansegid);
							  
							 if(annexModlType.equals("IM"))
								  IMLaanOID= msg.getStringField("LAAN_OID", laansegid);
							  
							  if(annexModlType.equals("VM"))
								  VMLaanOID= msg.getStringField("LAAN_OID", laansegid);
							  
							   if(annexModlType.equals("CSA"))
								  CSALaanOID= msg.getStringField("LAAN_OID", laansegid);
							  
							  
							  }
							  						 	
														
			          logger.info("VMLaanOID -- "+VMLaanOID);
					   logger.info("IMLaanOID -- "+IMLaanOID);
					    logger.info("CSALaanOID -- "+CSALaanOID);
						
						 //checking for VM  segment is there in streetRef 
						 if(!("".equals(VMLaanOID))){
							 
							 //LOOPING ON LAAP segments to add laan oid 
							 for(int i=0; i < segmentIDLAAP.size();i++){
							 
							        SegmentId laapsegid = segmentIDLAAP.get(i);	//ANNEX_PRT_MODL_TYP
									String annexPrtModlTyp = msg.getStringField("ANNEX_PRT_MODL_TYP", laapsegid);
									logger.info("annexPrtModlTyp -  "+ annexPrtModlTyp);	
											
									
									if(annexPrtModlTyp.equals("VM")){
									
									String VMlaapOID = msg.getStringField("LAAP_OID", laapsegid);
								 		logger.info("VMlaapOID - "+ VMlaapOID);
										
										String VMflarOID = msg.getStringField("FLAR_OID", laapsegid);
								 		logger.info("VMflarOID - "+ VMflarOID);
										
									
									String proceed = getFirstValDB("select laan_oid from ft_T_laap where laap_oid='"+VMlaapOID+"' and flar_oid ='"+VMflarOID+"' and annex_prt_modl_typ = '"+annexPrtModlTyp+"' and end_tms is null",dbConn, logger);
										 
										 logger.info("proceed if laan oid is null-- "+proceed);
									
							            if(proceed == null || proceed.trim().isEmpty()){

										SegmentId VMLAAPSeg = msg.addSegment(XMLMessage.A_D_UPDATE,"FLARLegalAgreementAnnexParticipant");
										msg.addField("LAAN_OID",VMLAAPSeg,VMLaanOID);
										msg.addField("LAAP_OID",VMLAAPSeg,VMlaapOID); 
																			
									logger.info("after adding laan_oid in laap segment(VM) - "+ msg.getXMLString());	
									   }
									}
							 }
							 
						// LAAN VM check ends
						}	
												
						 //checking for LAAN IM  segment is there in streetRef 
						 if(!("".equals(IMLaanOID))){
							 
							 //LOOPING ON LAAP segments to add laan oid 
							 for(int i=0; i < segmentIDLAAP.size();i++){
							 
							        SegmentId laapsegid = segmentIDLAAP.get(i);	//ANNEX_PRT_MODL_TYP
									String annexPrtModlTyp = msg.getStringField("ANNEX_PRT_MODL_TYP", laapsegid);
									logger.info("annexPrtModlTyp -  "+ annexPrtModlTyp);	
									
									if(annexPrtModlTyp.equals("IM")){
									
							            String IMlaapOID = msg.getStringField("LAAP_OID", laapsegid);
								 		logger.info("laapOID - "+ IMlaapOID);
																
										
										String IMflarOID = msg.getStringField("FLAR_OID", laapsegid);
								 		logger.info("IMflarOID - "+ IMflarOID);
										
										String proceed = getFirstValDB("select laan_oid from ft_T_laap where laap_oid='"+IMlaapOID+"' and flar_oid ='"+IMflarOID+"' and annex_prt_modl_typ = '"+annexPrtModlTyp+"' and end_tms is null",dbConn, logger);
										 
										 logger.info("proceed if laan oid is null-- "+proceed);
										
										 if(proceed == null || proceed.trim().isEmpty()){

										SegmentId IMLAAPSeg = msg.addSegment(XMLMessage.A_D_UPDATE,"FLARLegalAgreementAnnexParticipant");
										msg.addField("LAAN_OID",IMLAAPSeg,IMLaanOID);
										msg.addField("LAAP_OID",IMLAAPSeg,IMlaapOID); 
																			
									logger.info("after adding laan_oid in laap segment(IM) - "+ msg.getXMLString());
									
										 }
									
									}
							 }
							 
						// LAAN IM check ends
						}	
						
						
						 //checking for  CSA segment is there in streetRef  
							  if(!("".equals(CSALaanOID))){
							 
							 //LOOPING ON LAAP segments to add laan oid 
							 for(int i=0; i < segmentIDLAAP.size();i++){
							 
							        SegmentId laapsegid = segmentIDLAAP.get(i);	
									String annexPrtModlTyp = msg.getStringField("ANNEX_PRT_MODL_TYP", laapsegid);
									logger.info("annexPrtModlTyp -  "+ annexPrtModlTyp);	
									
			
									if(annexPrtModlTyp.equals("CSA")){
																		
							            String CSAlaapOID = msg.getStringField("LAAP_OID", laapsegid);
								 		logger.info("laapOID - "+ CSAlaapOID);									
											
										String CSAflarOID = msg.getStringField("FLAR_OID", laapsegid);
								 		logger.info("CSAflarOID - "+ CSAflarOID);
										
										String proceed = getFirstValDB("select laan_oid from ft_T_laap where laap_oid='"+CSAlaapOID+"' and flar_oid ='"+CSAflarOID+"' and annex_prt_modl_typ = '"+annexPrtModlTyp+"' and end_tms is null",dbConn, logger);
										 
										 logger.info("proceed if laan oid is null-- "+proceed);
										
										 if(proceed == null || proceed.trim().isEmpty()){

										SegmentId LAAPSeg = msg.addSegment(XMLMessage.A_D_UPDATE,"FLARLegalAgreementAnnexParticipant");
										msg.addField("LAAN_OID",LAAPSeg,CSALaanOID);
										msg.addField("LAAP_OID",LAAPSeg,CSAlaapOID); 
																			
									logger.info("after adding laan_oid in laap segment(CSA) - "+ msg.getXMLString());	
									}
									}
							 }
						// LAAN CSA check ends
						}
							
						//ISDA Masetr check ends
					  }
	            return true;
				
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
	
	
	public String getFirstValDB(String query, DatabaseAccess dbConnection, Logger logger) {
		String dbout= "TEST";
		if (query==null || "".equals(query)){
		return null;
		}
		logger.info("Executing: " + query);
		try {
		dbConnection.setSQL(query);
		if (!dbConnection.execute()) {
		logger.error("ERROR: Failed to execute SQL statement.");
		}
		if (!dbConnection.isEndOfStream()) {
			dbout =  dbConnection.getNextString();
			 if (dbout != null) {
                dbout = dbout.trim();
            }
			//count = dbConnection.getNextInt();
		}
		} catch (Exception e) {
		if (!(e instanceof GSException)) {
		logger.error("ERROR: " + e.getMessage());
		}
		} 
		logger.info("dbout --> "+dbout);
		return dbout;
		}
	
}