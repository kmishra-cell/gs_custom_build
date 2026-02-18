import java.math.BigDecimal;

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

	public class CJavaMHSCDeriveRecordDate implements JavaRule {

	private static Logger logger = Logger.getLogger(CJavaMHSCDeriveRecordDate.class);
	private String prtPurpTyp;
	
	public boolean initialize(String[] params)
	{
		if(params.length > 0)
			prtPurpTyp = params[0];
		return true;
	}
	
	public boolean process(XMLMessage xml, DatabaseObjectContainer dbObj, ProcessorContext pCon, DatabaseAccess dbConn, NotificationCreator notfcn) throws GSException
	{
		log("CJavaMHSCDeriveRecordDate.process()");

		String msgClassification = xml.getStringField("MSG_CLASSIFICATION", new SegmentId(0));
		log("MSG_CLASSIFICATION : " + msgClassification);
		boolean iedfFound = false;
	
// Check MSG_CLASSIFICATION: Process only ProductMasterAsset message and GS UI message
		if (!("WEBMSG".equalsIgnoreCase(msgClassification)) && !("PM".equalsIgnoreCase(msgClassification))) 
		{
			log("MessageClassification is not PM or WEBMSG. Exiting"); 
			return true;
		}

// Exit if not ISSU message			
		String instrId = pCon.getInstrId();
		
		if (instrId == null || instrId.equals(""))
		{
			log("No INSTR_ID. Exiting");
			return true;
		}	
		log("instrId: " + instrId);
        		
// Check for PM message. Exit if there is no IncomeEventDefinition, ev_typ='PMINTRST'
		if ("PM".equalsIgnoreCase(msgClassification))
		{
			log("MessageClassification is PM. Look for IncomeEventDefinition segment");
			
			for(int i=0; i < xml.getSegmentCount(); i++)	// -- Look for IncomeEventDefinition segment
			{
				SegmentId segId = new SegmentId(i);
				String segType = xml.getSegmentType(segId);
				if ("IncomeEventDefinition".equals(segType))
				{
				// Check if EV_TYP = "PMINTRST"
					String evType = xml.getStringField("EV_TYP", segId);
					if ( "PMINTRST".equalsIgnoreCase(evType) ) {
						
						iedfFound = true;
						log("PMINTRST found in STREETREF. iedfFound: " + iedfFound + " Proceed");
											
						break;
					}
				}
			}
			if (iedfFound == false)
			{
				log("IncomeEventDefinition not found. Exiting");
				return true;
			}
			
			// EG-10198 Do another loop over incoming message. Exit if RecordDate is set under MHSCCPPAY in PM message 
			log("Look for IncomePaymentComment, COMMREASMNEM = RECRD_DT and LASTCHGUSRID =PMASSETMDX");
			boolean recDtFound = false;
			
			for(int i=0; i < xml.getSegmentCount(); i++)
			{
				SegmentId segId = new SegmentId(i);
				String segType = xml.getSegmentType(segId);
				if ("IncomePaymentComment".equals(segType))
				{
				// Check if COMMREASMNEM = RECRD_DT and LASTCHGUSRID =PMASSETMDX
					String commReasMnem = xml.getStringField("COMM_REAS_MNEM", segId);
					String lastChgUsrId = xml.getStringField("LAST_CHG_USR_ID", segId);
					if ( "RECRD_DT".equalsIgnoreCase(commReasMnem) && "PMASSETMDX".equalsIgnoreCase(lastChgUsrId) ) {
						
						recDtFound = true;
						log("RECRD_DT found in STREETREF. recDtFound: " + recDtFound + " Exit");
						
						return true;
					}
				}
			}
			if (recDtFound == false)
			{
				log("RecordDate is not found. Proceed");

			}
			
		}

		
// Check of WEBMSG. Exit if the instrument is not in MHSC SOI
// EG-10198 Exit if Record Date is set by ProductMasterAsset connector		
		if ("WEBMSG".equalsIgnoreCase(msgClassification))
		{
			log("MessageClassification is WEBMSG. Check SOI status");
		try{	
			String sql_isgp = "SELECT COUNT(1) FROM FT_T_ISGP ISGP "+
			"INNER JOIN FT_T_ISGR ISGR ON ISGP.PRNT_ISS_GRP_OID = ISGR.ISS_GRP_OID " +
			"AND ISGR.ORG_ID = 'MHSC'" +
			"WHERE ISGP.INSTR_ID = '" + instrId + "' " +
			"AND ISGP.PRT_PURP_TYP = '" + prtPurpTyp + "' " +
			"AND COALESCE(ISGP.END_TMS, SYSDATE() + INTERVAL '1 day') > SYSDATE() ";
			log("sql: " + sql_isgp);		
			dbConn.setSQL(sql_isgp);
			dbConn.execute();	
			if (dbConn.getNextInt() == 0)	{
				log("MessageClassification is WEBMSG and not in MHSC INTEREST group. Exiting");
				return true;
			}
			}catch (Exception e) {
				e.printStackTrace();
			}		
		
			log(instrId + " is a member of MHSC SOI. Proceed");
		
			log("Check LAST_CHG_USR_ID of RECRD_DT in FT_T_GNCM");  // EG-10198 Exit if PMASSETMDX
			try{		
			String sql_gncm = "SELECT COUNT(1) FROM FT_T_GNCM GNCM "+
			"INNER JOIN FT_T_IPDF IPDF ON GNCM.CROSS_REF_ID = IPDF.INC_PAY_DEF_ID " +
			"INNER JOIN FT_T_IEVP IEVP ON IPDF.INC_EV_PRT_ID = IEVP.INC_EV_PRT_ID AND IEVP.PRT_PURP_TYP='MHSCCPAY' " +
			"INNER JOIN FT_T_IEDF IEDF ON IEVP.INC_EV_DEF_ID = IEDF.INC_EV_DEF_ID AND IEDF.EV_TYP='PMINTRST' " +
			"AND IEDF.INSTR_ID ='" + instrId + "' " +
			"WHERE GNCM.COMM_REAS_MNEM='RECRD_DT' AND GNCM.LAST_CHG_USR_ID='PMASSETMDX'"
			;
				
			log("sql: " + sql_gncm);		
			dbConn.setSQL(sql_gncm);
			dbConn.execute();	
				
			if (dbConn.getNextInt() > 0)	{	
				log("RECRD_DT is set by MDX. Exiting");
				return true;
			}
			}catch (Exception e) {
				e.printStackTrace();
			}		
			
			log("RECRD_DT is not set by MDX. Proceed");			
		
		} // end of if
		
	
		
// Fetch parameters for Record Date calculation from database
// Bond Type
		String pmBndTyp = null;
		boolean isMortgage = false;

		log("About to determine the bond type");
		try {
			String sql_pmBndTyp = "SELECT CL_VALUE FROM FT_T_ISCL " +
						"WHERE INDUS_CL_SET_ID = 'MHSCBTID' AND END_TMS IS NULL AND INSTR_ID = '"+instrId+"'";
		    log("sql_pmBndTyp: " + sql_pmBndTyp);
			dbConn.setSQL(sql_pmBndTyp);
			dbConn.execute();
			if (!dbConn.isEndOfStream())
			{
				pmBndTyp = dbConn.getNextString();
				log("ProductMaster bond type : " + pmBndTyp);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if ("7A".equalsIgnoreCase(pmBndTyp) || "7B".equalsIgnoreCase(pmBndTyp)){
			isMortgage = true;
			log("The issue is mortgage: " + isMortgage);
		}
		
// recordDateOffset, businessDayConvention from FT_T_IEDF where EV_TYP= 'PMINTRST' (ProductMaster data)	
		String incEvDefId = null; 				// primary key for table ft_t_iedf
		int recordDateOffset = -1; 				// number of days to offset from the base date
		String busDyConvTyp = null;				// business day convention from table ft_t_iedf
		
// If ft_t_iedf.recdt_dy_aj_num or bus_dy_conv_typ is not set, i.e. null,
//   If msgClassification = WEBMSG, exit without deriving Record Date
//   If msgClassification = PM, raise severity 40 error		
	
		log("About to get parameters from IEDF");
		
		try {
			String sql_iedf = "SELECT INC_EV_DEF_ID, COALESCE(RECDT_DY_AJ_NUM,-1), TRIM(BUS_DY_CONV_TYP) FROM FT_T_IEDF " + 
				     "WHERE EV_TYP = 'PMINTRST' and END_TMS IS NULL AND INSTR_ID = '"+instrId+"'";

			logger.info("sql_recDtOffset: " + sql_iedf);
			
			dbConn.setSQL(sql_iedf);
			dbConn.execute();
			
			if (!dbConn.isEndOfStream()) {
				incEvDefId = dbConn.getNextString();				// For querying FT_T_IEVP
				log("incEvDefId: " + incEvDefId);	 				
				recordDateOffset = dbConn.getNextInt();
				log("recordDateOffset: " + recordDateOffset);								
				busDyConvTyp = dbConn.getNextString();
				log("busDyConvTyp: " + busDyConvTyp);
			}
		} catch (Exception e) {
				e.printStackTrace();
		}

		// Check recordDateOffset
		// If ft_t_iedf.recdt_dy_aj_num is not set, i.e. null,
		//   If msgClassification = WEBMSG, exit without deriving Record Date
		//   For others, raise severity 40 error		
		
		if (recordDateOffset == -1 ) {
			
			if ("WEBMSG".equalsIgnoreCase(msgClassification)) {
				log("ft_t_iedf.recdt_dy_aj_num is not set.Exiting. msgClassification = " + msgClassification );
				return true;
			}
			else {
				log("ft_t_iedf.recdt_dy_aj_num is not set.Raising error. msgClassification = " + msgClassification );
				return false;
			}	
		}
		
		// Check businessDayConvention
		// If ft_t_iedf.bus_dy_conv_typ is not set, i.e. null (This is unlikely),
		//   If msgClassification = WEBMSG, exit without deriving Record Date
		//   For others, raise severity 40 error		
		
		if (busDyConvTyp == null || "".equals(busDyConvTyp)) {
			
			if ("WEBMSG".equalsIgnoreCase(msgClassification)) {
				log("ft_t_iedf.bus_dy_conv_typ is not set.Exiting. msgClassification = " + msgClassification );
				return true;
			}
			else {
				log("ft_t_iedf.bus_dy_conv_typ is not set.Raising error. msgClassification = " + msgClassification );
				return false;
			}	
		}

		
		// Check ProductMaster Record Date Convention Type
		// When PM Bond Type is not Mortgage (7A or 7B),
		// Decide Business day or Actual Day from ProductMaster Record Date Convention Type 'PMRDCNVC' in FT_T_ISST
		// If 'PMRDCNVC' is 2 or 4, offset record date by business day bases 

	
		String recordDateMethod = "Actual";  // Default to Actual. Mortgage is always Actual. The other bonds depend on ISST.PMRDCNVC
		String recDtConv = null;

		if (!isMortgage){
		
			try {
				log("Not a Mortgage. Check Record Date Convention Type at ISST PMRDCNVC");
				
				String sql_recDtConv = "SELECT STAT_CHAR_VAL_TXT FROM FT_T_ISST " +
							"WHERE STAT_DEF_ID = 'PMRDCNVC' AND END_TMS IS NULL AND INSTR_ID = '"+instrId+"'";
	
				log("sql_recDtConv: " + sql_recDtConv);
				dbConn.setSQL(sql_recDtConv);
				dbConn.execute();
				
				if (!dbConn.isEndOfStream()) {
					recDtConv = dbConn.getNextString();
					log("recDtConv: " + recDtConv);
				}
				// If 'PMRDCNVC' is not found, raise error if PM message and exit if WEBMSG
				if (recDtConv == null || "".equals(recDtConv)) {
					if ("WEBMSG".equalsIgnoreCase(msgClassification)) {
						log("PMRDCNVC is not set. Exiting. msgClassification = " + msgClassification );
						return true;
					}
					else {
						log("PMRDCNVC is not set. Raising error. msgClassification = " + msgClassification );
						return false;
					}				
				}
				
				// If 'PMRDCNVC' is 2 or 4, offset record date by business day bases 
				if ("2".equals(recDtConv) || "4".equals(recDtConv)){
					recordDateMethod = "Business";
				}	
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}	// End of checking PMRDCNVC
		
		log("recordDateMethod: " + recordDateMethod);
		
		// ProductMaster Settlement Calendar from FT_T_ISST
		List<String> calIDList = new ArrayList<String>(); // All linked calendars	
		String pmStlCal = null;
		
		log("About to set Calendar");
		// Use Euroclear calendar "Ecl" - "E-C-L - Euroclear holidays" instead of settlement calendar in PM asset message
		pmStlCal = "Ecl";
		log("pmStlCal : " + pmStlCal);
		calIDList.add(pmStlCal);	
		log("calIDList : " + calIDList);
				
		// Verify the calendar 
		int calYear = 0;
			log("Validate Calendar against ft_t_cadp");

			try {
			String sql_cadp = "SELECT COALESCE(to_number(TO_CHAR(MIN(greg_dte), 'YYYY'), '9999'), 0) FROM ft_t_cadp WHERE cal_id = '"+pmStlCal+"'";	

			log("sql_cadp:" + sql_cadp); // -- get calYear from FT_T_CADP

			dbConn.setSQL(sql_cadp);
			dbConn.execute();
		
			if (dbConn.isEndOfStream())
			{
				log("Exiting as no Calendar dates for " + pmStlCal); // -- if calYear not found exit
				return true;
			}				
			calYear = dbConn.getNextInt();
			if (calYear==0)
			{
				log("Exiting as no Calendar dates for " + pmStlCal);
				return true;
			}
			
			log("calYear: " + calYear);	
			
		} catch (Exception e) {
			e.printStackTrace();	
		}
		
		// Define variables used later 
      				
		Calendar accStartDate = Calendar.getInstance(); // Set today's date for now
		Calendar today = Calendar.getInstance();
		Date dt = today.getTime();
		accStartDate.setTime(dt);
		
		
// Which date is used to derive Record Date. Coupon Payment Date or Roll Date.

		String  baseDateType =  "PaymentDate"; // default to PaymentDate;
		
		if (isMortgage){
			if ("MDBDYADJ".equalsIgnoreCase(busDyConvTyp) || "FLBDYADJ".equalsIgnoreCase(busDyConvTyp) || "PRBDYADJ".equalsIgnoreCase(busDyConvTyp)) 
			{
				baseDateType = "PaymentDate";	//record date = Payment date - 'iedf.recdt_dy_ad_num'
			}
			else {
				baseDateType = "RollDate";		//record date = Roll date - 'iedf.recdt_dy_ad_num'
			}
		}
		else if ("3".equals(recDtConv) || "4".equals(recDtConv)) { //non mortgage, check record date convention code
			baseDateType = "PaymentDate";		
		}
		else if ("1".equals(recDtConv) || "2".equals(recDtConv)) { //non mortgage, check record date convention code
			baseDateType = "RollDate";
		}

		log("baseDateType: "+ baseDateType);

// Get incEvPrtID from ft_t_ievp table
		
		String incEvPrtId = null;
		try {
			String sql_ievp = "SELECT inc_ev_prt_id FROM ft_t_ievp WHERE prt_purp_typ='MHSCCPAY' " +
					"AND END_TMS IS NULL AND INC_EV_DEF_ID = '"+incEvDefId+"'";
			
			log("sql_ievp:" + sql_ievp); 
			dbConn.setSQL(sql_ievp);
			dbConn.execute();
			
			if (!dbConn.isEndOfStream()) {
				incEvPrtId = dbConn.getNextString();
				log("incEvPrtId: " + incEvPrtId);
			}
			
		} catch (Exception e) {
			e.printStackTrace();	
		}

// Set variables for Record date calculation 	
		
		CJavaMHICouponSchedules varCJavaMHICouponSchedules = new CJavaMHICouponSchedules();
		Date recordDate = null;
		
	
// Create REFERENCE segment for IncomeEventDefinition and IncomeEventParticipant
		log("About to generate IEDF and IEVP Reference segments ");
		
		SegmentId iedfPaySeg = xml.addSegment( XMLMessage.A_REFERENCE,"IncomeEventDefinition"); // -- create REFERENCE segment for IncomeEventDefinition
		xml.setSegmentAttribute(iedfPaySeg, "MATCH", "IEDF_MATCH_1");
		xml.addField("INSTR_ID", iedfPaySeg, instrId);
		xml.addField("EV_TYP", iedfPaySeg, "PMINTRST");
		
		SegmentId ievpPaySeg = xml.addSegment( XMLMessage.A_REFERENCE,"IncomeEventParticipant"); // -- create REFERENCE segment for IncomeEventParticipant PRT_PURP_TYP = MHSCCPAY
		xml.setSegmentAttribute(ievpPaySeg, "MATCH", "IEVP_PRTPURP_1");
		xml.addField("INC_EV_PRT_ID", ievpPaySeg, incEvPrtId);
		xml.addField("PRT_PURP_TYP", ievpPaySeg, "MHSCCPAY");
		
// Query FT_T_IPDF or FT_T_GNCM depending on baseDateType
		
		String sql_basedate = null;

		if ("RollDate".equals(baseDateType)) {	
			sql_basedate = "SELECT GNCM.CROSS_REF_ID, GNCM.CREATED_TMS FROM FT_T_GNCM GNCM WHERE  " +
				"GNCM_TBL_TYP = 'IPDF' AND COMM_REAS_MNEM = 'ROLL_DT' AND END_TMS IS NULL " +
				"AND EXISTS ( SELECT 1 FROM FT_T_IPDF IPDF WHERE IPDF.INC_PAY_DEF_ID = GNCM.CROSS_REF_ID " +
				"AND IPDF.INC_EV_PRT_ID = '"+incEvPrtId+"' ) " +
				"ORDER BY GNCM.CREATED_TMS";
		}
		
		else if ("PaymentDate".equals(baseDateType)) {
			sql_basedate = "SELECT INC_PAY_DEF_ID, START_TMS FROM FT_T_IPDF WHERE  " +
				 "INC_EV_PRT_ID = '"+incEvPrtId+"' " +
				 "ORDER BY START_TMS";				
		}
		else {
			log("baseDateType is unknown. Exiting");
			return true; 
		}
					
		log("sql_basedate: " + sql_basedate ); 
		
		dbConn.setSQL(sql_basedate);
		dbConn.execute();
		
		String cross_ref_id = null;
		Date baseofRecordDate = null;

		List<Object []> schedule = new ArrayList<Object []>();
						
		while (!dbConn.isEndOfStream()) {
			
			Object[] couponSchedule = new Object [2];
			
			// save all dates in lists
			cross_ref_id = dbConn.getNextString();
			log("cross_ref_id:" + cross_ref_id); 
			couponSchedule[0] = cross_ref_id;
			log("cross_ref_id added to array: " + cross_ref_id );
			
			//baseofRecordDate = dbConn.getNextDate();
			baseofRecordDate = dbConn.getNextTimestamp();
			log("baseofRecordDate:" + baseofRecordDate); 
			couponSchedule[1] = baseofRecordDate;
			log("baseofRecordDate added to array: " + baseofRecordDate );
			
			schedule.add(couponSchedule);
		}

		int couponCnt = schedule.size();
		log("couponCnt: " + couponCnt);

		// loop for count
		
		for(int i=0; i < couponCnt; i++) {
			log("Loop over couponPaymentSchedule");	
			log("i: "+ i);	
			
			Object[] currCoupon = schedule.get(i);
			recordDate = null;
			Date recordDateBaseDate = null;
			
			log("currCoupon[0]: " + currCoupon[0]);
			log("currCoupon[1]: " + currCoupon[1]);			
			log("recordDateOffset: " + recordDateOffset); 
			log("pmStlCal: " + pmStlCal);
			log("calIDList: " + calIDList);
			log("recordDateMethod: " + recordDateMethod);
			
			try {
			recordDateBaseDate =  (Date) currCoupon[1];
			//inc_pay_def_start_tms = (Date) ((Calendar) currCoupon[1]).getTime();
				
			log("recordDateBaseDate: " + recordDateBaseDate);
			
			GregorianCalendar vgc = new GregorianCalendar();
			vgc.setTime(recordDateBaseDate);
			
			// If baseDate = "RollDate" and recordDateMethod =  "Business", check 
			// check whether recordDateBaseDate is non business day. 
			// If the day is non business day, get the next business day 
			// before calling recordDateCalc.
			// The method does holiday adjustment for recordDateBaseDate
				
			if ("RollDate".equals(baseDateType) && "Business".equals(recordDateMethod) ) 
			{ 	
				if (!varCJavaMHICouponSchedules.isBusinessDay(dbConn, pmStlCal, calIDList, vgc))
				{
					log("Adjust recordDateBaseDate" + recordDateBaseDate);
					do {
						vgc.add(Calendar.DAY_OF_MONTH, 1);
					} while (!varCJavaMHICouponSchedules.isBusinessDay(dbConn, pmStlCal, calIDList, vgc));				
				}
			}
							
			log("About to calculate record date");				
			recordDate = varCJavaMHICouponSchedules.recordDateCalc(recordDateOffset, dbConn, pmStlCal,calIDList,vgc, recordDateMethod);
				
			if (recordDate == null){
				log("recordDate is null. Skip");
				continue;
			}
				
			log("recordDate: "+ recordDate);
			log("About to generate segments ");
								
			// Add IncomePaymentDefinition REFERENCE segment
			SegmentId newSeg = xml.addSegment(XMLMessage.A_REFERENCE, "IncomePaymentDefinition"); 
			xml.setSegmentAttribute(newSeg, "MATCH", "IPDF_MATCH_10");
			xml.addField("INC_PAY_DEF_ID",newSeg, cross_ref_id);
						
			// -- add UNKNOWN segment of IncomePaymentComment for record date
			SegmentId newSeg2 = xml.addSegment(XMLMessage.A_UNKNOWN, "IncomePaymentComment");	
			xml.setSegmentAttribute(newSeg2, "MATCH", "GNCM_MATCH");
			xml.addField("CROSS_REF_ID", newSeg2, (String) currCoupon[0] );
			xml.addField("CMNT_TXT", newSeg2, "Record Date set for Income Payment Definition");
			xml.addField("CREATED_TMS", newSeg2,recordDate );
			xml.addField("COMM_REAS_MNEM", newSeg2, "RECRD_DT");
			xml.addField("GNCM_TBL_TYP", newSeg2, "IPDF");
			xml.addField("LN_NUM", newSeg2,new BigDecimal("1.0"));
			xml.addField("NLS_CDE", newSeg2, "ENGLISH");
			}
			catch (Exception e) {
				
				e.printStackTrace();
				log ("!!Failed to calculate record date for : " + recordDateBaseDate);
			}
													
		}// End of while			
	
	   if(logger.isDebugEnabled()){
           logger.debug("End of CJavaMHSCDeriveRecordDate. msg: " + xml.getXMLString());
	   }
		return true; // End of Process
	}

	public void log(Object s){
		if(logger.isInfoEnabled())
			logger.info(s); 
	}

}	// End of Class
