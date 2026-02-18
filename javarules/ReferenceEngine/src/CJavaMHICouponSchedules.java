
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
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


	public class CJavaMHICouponSchedules implements JavaRule {

	private static Logger logger = Logger.getLogger(CJavaMHICouponSchedules.class);
	private String prtPurpTyp;
	int exDivDays; //Used to store EX_DIV_DY_QTY value from DebtInstrumentStatistics segment

	public boolean initialize(String[] params)
	{
		if(params.length > 0)
			prtPurpTyp = params[0];
		return true;
	}
	
	public boolean process(XMLMessage xml, DatabaseObjectContainer dbObj, ProcessorContext pCon, DatabaseAccess dbConn, NotificationCreator notfcn) throws GSException
	{
		int recordDateOffset = -1;
		String recordDateMethod = "Business";
		boolean foundRecordDateOffset = false;
		boolean foundRecordDateMethod = false;

		logger.info("CJavaMHICouponSchedule.process()");
		
		if(logger.isDebugEnabled())
       logger.debug("xml: " + xml.getXMLString());

		if (Common.isMergeMessage(xml, logger))
			return true;

		String msgClassification = xml.getStringField("MSG_CLASSIFICATION", new SegmentId(0));
		logger.info("MSG_CLASSIFICATION is " + msgClassification);

		if("RDW".equalsIgnoreCase(msgClassification)){
			logger.info("Message is from RDW. Exiting");
			return true;
		}
        
		String instrId = pCon.getInstrId();
		
		if (instrId == null || instrId.equals(""))
		{
			logger.info("No INSTR_ID. Exiting");
			return true;
		}

//		EG-10122 change overwrite EG-8644 change
// 		When PM sends new non pool mortgage, the rule will derive coupon schedule based on PM information.
//		The mortgage will be requested to BBG and the connector populate MHI coupon schedules for that type.
//      In this rule, isMortgateNonPool returns true and skip deriving schedules.
//      We'd like to suppress deriving schedules when PM sends the mortgage next time.
////		EG-8644 change
////		Check if this instrument is MORTGAGE and not received from ProductMaster. If so, exit.
////		Because, Mortgage from ProductMaster will not have MHI schedules and hence need to be derived.
////		Whereas Mortgage from BB will have schedules, which will be mapped by connector.  Hence no need to derive it.
		
/* EG-10122 Comment out
  		if("PM".equalsIgnoreCase(msgClassification)) {
			logger.info("PM Message and hence continue deriving the schedule");
		}
		else
End of EG-10122 */
		
		if (isMortgageNonPool(dbConn, instrId)){
			logger.info("isMortgageNonPool is true. Exit the rule");
			return true;
		}

		if (prtPurpTyp != null && !prtPurpTyp.equals(""))
		{
			//Check in SOI Group(s)
			String[] issGrpArray = prtPurpTyp.split(",");
			boolean isgpMember = false;
			
			for(int i=0; i < issGrpArray.length; i++)
			{
				isgpMember = Common.checkIsgpExists(dbConn, issGrpArray[i], instrId, logger);
				if (isgpMember == true)
					break;
			}
			
			if (isgpMember == false)
			{
				logger.info("Not in any of the groups. Exiting");
				return true;
			}
		}
		

/*	EG-9327 Suppress unnecessary delete & regenerate IPDF records
 *      	Exit the rule if there is NO change made by the message. This check is for DATA_SRC_ID in BB,PM,MTN and cmfSOI, 
 */  
		 
		String dataSrcId = xml.getStringField("DATA_SRC_ID", new SegmentId(0));

		if ("BB".equalsIgnoreCase(dataSrcId) || "PM".equalsIgnoreCase(dataSrcId) || "MTN".equalsIgnoreCase(dataSrcId) || "cmfSOI".equalsIgnoreCase(dataSrcId))
		{  
			logger.info("EG-9327 Check segment status. DATA_SRC_ID: " + dataSrcId);

			Boolean anyUpdate = false;
			for (int i = 0; i < xml.getSegmentCount(); i++ ) 
            {
                SegmentId segId = new SegmentId(i);
                String segType = xml.getSegmentType(segId);
                logger.info((Object)("EG-9327 segType: " + segType));
                String segProcInd = xml.getSegmentAttribute(segId, "SEGPROCESSEDIND");
	            logger.info((Object)("EG-9327 segProcInd: " + segProcInd));
	            
	            if ("C".equals(segProcInd) || "U".equals(segProcInd) ) 
	            {
                  	logger.info((Object)("EG-9327 End: SegProcInd is C or U. Need to generate coupon schedule."));
                  	anyUpdate = true;
                    break;
                }
             }
         
			if (anyUpdate == false) // all segment status were N which means there is no update. Exit
			{
				logger.info("EG-9327 End: All SegProcInd not C or U. No need to recalculate Coupon schedule. Exit.");
				return true;
			}
		}
		else 
		{
			logger.info("EG-9327 Data_src_id not in scope. Proceed." + dataSrcId);
		}
		
/* EG-9327 End of Change
 */
		
		String incEvDefId = null;
		String evTyp = null;
		String evPayMethTyp = null;
		Date firstPyTms = null;
		String pyDteFqDyTyp = null;
		Integer pyDteFqQty = null;
		String daysMthBasis = null;
		String pyDteFqSpTyp = null;
		String busDyConvTyp = null;
		
		
		//try BDST
			
			if (logger.isInfoEnabled())
				logger.info("Try BDST.");
			
			String sql_exDivDays =	"SELECT DISTINCT COALESCE(EX_DIV_DY_QTY,0) FROM FT_T_BDST " +  // If EX_DIV_DY_QTY is null, set 0
			"WHERE INSTR_ID = '"+instrId+"'";
			
			if (logger.isInfoEnabled())
				logger.info("sql_exDivDayscheck: " + sql_exDivDays); // -- if no DebtInstrumentStatistics found, try to get exDivDays from FT_T_BDST
			
			dbConn.setSQL(sql_exDivDays);
			dbConn.execute();

			if (!dbConn.isEndOfStream())
			{
				//exDivDays = dbConn.getNextInt(); //This line of code is expecting int value but getting float value from DB 
				String raw = dbConn.getNextString();
				exDivDays = (int) Double.parseDouble(raw);
			
				if(logger.isInfoEnabled())
					logger.info("d/b - exDivDays value check : " + exDivDays);			
			}
		

		// -- try to get record date offset from database
		// -- if this is present it overrides exDivDays
		// EG-4954 - new code to allow Record Date Offset to override ex_div_days when present
		// First check message segments for Record Date Offset in IssueStatistic.
		if (logger.isInfoEnabled())
			logger.info("EG-4954 - !!About to check for recordDateOffset in message");

		

		boolean ignoreDbValueForRECDTOFF = false;

		//EG-4954 - if Record Date Offset not found in any segments in the message, check asset on db
		logger.info("EG-4954 - After message check foundRecordDateOffset: " + foundRecordDateOffset);
		if (!foundRecordDateOffset && !ignoreDbValueForRECDTOFF)
		{
			if (logger.isInfoEnabled())
				logger.info("EG-4954 - !!About to get recordDateOffset from db - issue");

			try {

				String sql_recDtOffset = "SELECT COALESCE(STAT_INT_VAL_NUM,0) FROM FT_T_ISST " +  // If STAT_INT_VAL_NUM is null, set 0
						"WHERE STAT_DEF_ID = 'RECDTOFF' and END_TMS is NULL and INSTR_ID = '"+instrId+"'";
				if (logger.isInfoEnabled())
					logger.info("EG-4954 - sql_recDtOffset: " + sql_recDtOffset);
				dbConn.setSQL(sql_recDtOffset);
				dbConn.execute();
				if (!dbConn.isEndOfStream())
				{
					recordDateOffset = dbConn.getNextInt();
					logger.info("d/b - issue recordDateOffset value check : " + recordDateOffset);
					foundRecordDateOffset = true;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		logger.info("after issue check - foundRecordDateOffset: " + foundRecordDateOffset);
		//EG-4954 - Now try looking on issuer statistics in db, if not yet found
		if (!foundRecordDateOffset)
		{
			if (logger.isInfoEnabled())
				logger.info("EG-4954 - !!About to get recordDateOffset from db - issuer");

			try {

				String sql_recDtOffset = "SELECT COALESCE(STAT_INT_VAL_NUM,0) FROM FT_T_IRST " +  // If STAT_INT_VAL_NUM is null, set 0
						"WHERE STAT_DEF_ID = 'RECDTOFF' and END_TMS is NULL and INSTR_ISSR_ID in " +
						"(select instr_issr_id from FT_T_ISSU where end_tms is null and INSTR_ID = '"+instrId+"')";


				if (logger.isInfoEnabled())
					logger.info("EG-4954 - sql_recDtOffset: " + sql_recDtOffset);

				dbConn.setSQL(sql_recDtOffset);
				dbConn.execute();

				if (!dbConn.isEndOfStream())
				{
					recordDateOffset = dbConn.getNextInt();
					logger.info("d/b - issuer recordDateOffset value check : " + recordDateOffset);
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		logger.info("after issuer check - foundRecordDateOffset: " + foundRecordDateOffset);
		// EG-4954 - new code for Record Date convention
		// Check message for Record Date Convention.

		//EG-4954 - if Record Date Convention not any segments in the message, check asset on db
		if (!foundRecordDateMethod && !ignoreDbValueForRECDTOFF)
		{
			if (logger.isInfoEnabled())
				logger.info("EG-4954 - !!About to get recordDateMethod from db - asset");
			try {
				String sql_recDtConv = "SELECT STAT_CHAR_VAL_TXT FROM FT_T_ISST " +
						"WHERE STAT_DEF_ID = 'RECNVNMD' and END_TMS is NULL and INSTR_ID = '"+instrId+"'";

				if (logger.isInfoEnabled())
					logger.info("EG-4954 - sql_recDtConv: " + sql_recDtConv);

				dbConn.setSQL(sql_recDtConv);
				dbConn.execute();

				if (!dbConn.isEndOfStream())
				{
					recordDateMethod = dbConn.getNextString();

					logger.info("d/b - issue recordDateMethod value check : " + recordDateMethod);
					foundRecordDateMethod = true;
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//EG-4954 - Now try looking on issuer statistics in db, if not yet found
		logger.info("EG-4954 - after issu check - foundRecordDateMethod: " + foundRecordDateMethod);
		if (!foundRecordDateMethod)
		{

			if (logger.isInfoEnabled())
				logger.info("EG-4954 - !!About to get recordDateMethod from db - issuer");
			try {
				String sql_recDtConv = "SELECT STAT_CHAR_VAL_TXT  FROM FT_T_IRST " +
						"WHERE STAT_DEF_ID = 'RECNVNMD' and END_TMS is NULL and INSTR_ISSR_ID in " +
						"(select instr_issr_id from FT_T_ISSU where end_tms is null and INSTR_ID = '"+instrId+"')";
				if (logger.isInfoEnabled())
					logger.info("EG-4954 - sql_recDtConv: " + sql_recDtConv);
				dbConn.setSQL(sql_recDtConv);
				dbConn.execute();

				if (!dbConn.isEndOfStream())
				{
					recordDateMethod = dbConn.getNextString();
					logger.info("d/b - issuer recordDateMethod value check : " + recordDateMethod);
					foundRecordDateMethod = true;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		logger.info("after issuer - foundRecordDateMethod: " + foundRecordDateMethod);
				
		String pyDteFqQtyStr = null;
		// -- if IEDF segment not in message, try reading FT_T_IEDF 
		// IEDF Segment not in message or not complete enough for schedule creation
		if (evTyp == null || evPayMethTyp == null || pyDteFqDyTyp == null || pyDteFqQty == null || daysMthBasis == null || pyDteFqSpTyp == null || firstPyTms == null)
		{
			// check if IEDF INTEREST exists in the database for this instrument
			String sql =	"SELECT FIRST_PY_TMS, PY_DTE_FQ_DY_TYP, PY_DTE_FQ_QTY, DAYS_MTH_BAS_TYP, " + "PY_DTE_FQ_SP_TYP, TRIM(BUS_DY_CONV_TYP),TRIM(INC_EV_DEF_ID) FROM FT_T_IEDF " +
							"WHERE END_TMS IS NULL " +
							"AND EV_TYP = 'INTEREST' " +
							"AND EV_PAY_METH_TYP = 'COUPON' " +
							"AND INSTR_ID = '"+instrId+"'";

			logger.info("sql: " + sql);
			
			dbConn.setSQL(sql);
			dbConn.execute();
			
			if (dbConn.isEndOfStream()) // -- If No Coupon IEDF exists, exit as schedules cannot be created
			{
				logger.info("No COUPON INTEREST IEDF. Exiting");
				return true;
			}
			
			evTyp = "INTEREST";
			evPayMethTyp = "COUPON";
			
			//firstPyTms = dbConn.getNextDate();
			firstPyTms = dbConn.getNextTimestamp();
			logger.info("d/b - firstPyTms: " + firstPyTms);

			pyDteFqDyTyp = dbConn.getNextString();
			logger.info("d/b - pyDteFqDyTyp: " + pyDteFqDyTyp);

			pyDteFqQtyStr = dbConn.getNextString();
			logger.info("pyDteFqQtyStr value is " + pyDteFqQtyStr);
			if (pyDteFqQtyStr == null || "".equals(pyDteFqQtyStr) || "0".equals(pyDteFqQtyStr))
			{
				logger.info("pyDteFqQtyStr value is missing");
			}
			else
			{
				//pyDteFqQty = new Integer(Integer.parseInt(pyDteFqQtyStr));
				
				pyDteFqQty = Integer.valueOf(pyDteFqQtyStr);
				logger.info("d/b - pyDteFqQty: " + pyDteFqQty);
			}

			daysMthBasis = dbConn.getNextString();
			logger.info("d/b - daysMthBasis: " + daysMthBasis);
			
			pyDteFqSpTyp = dbConn.getNextString();
			logger.info("d/b - pyDteFqSpTyp: " + pyDteFqSpTyp);

			busDyConvTyp = dbConn.getNextString();
			logger.info("d/b - busDyConvTyp: " + busDyConvTyp);

			incEvDefId = dbConn.getNextString();
			logger.info("d/b - incEvDefId: " + incEvDefId);

		}

		if (pyDteFqSpTyp == null || "".equals(pyDteFqSpTyp)) // -- If pyDteFqSpTyp des not exist, exit as schedules cannot be created
		{
			logger.info("No pyDteFqSpTyp. Exiting");
			return true;
		}

		if ("D".equals(pyDteFqSpTyp) && pyDteFqQty == 1) // -- If pyDteFqSpTyp= D (daily Coupon), exit
		{
			logger.info("Daily coupon. Exiting");
			return true;
		}
		
		if ("MT".equals(pyDteFqSpTyp)) // -- If pyDteFqSpTyp= MT (payable on maturity), exit
		{
			logger.info("Payable on Maturity and hence derive single schedule");
			//EG-8567 changes
			HandleOnMaturitySchedule(xml, dbConn, instrId);
			return true;
		}

		if (firstPyTms == null || "".equals(firstPyTms)) // -- If firstPyTms des not exist, exit as schedules cannot be created
		{
			logger.info("No firstPyTms. Check if this is PM message: " + msgClassification);

			if("PM".equalsIgnoreCase(msgClassification))
			{
				logger.info("Message is from PM. Testing ");
				HandleOnMaturitySchedule(xml, dbConn, instrId);
				return true;
			}
			else
				return true;
		}

		//EG-8567 changed.
		if (pyDteFqQtyStr == null || "".equals(pyDteFqQtyStr) || "0".equals(pyDteFqQtyStr)) // -- If pyDteFqQty is null, blank or 0, exit as schedules cannot be created
		{
				logger.info("No Payment Frequency value. Hence exit rule");
				return true;
		}

		final Calendar firstPayDte = Calendar.getInstance();
		firstPayDte.setTime(firstPyTms);
		if (logger.isInfoEnabled())
			logger.info("firstPayDte: " + firstPayDte.getTime());
		
		if (busDyConvTyp == null || "".equals(busDyConvTyp))
			busDyConvTyp = "FLBDYUAD";
		
		//Get the BDCH segment
		String eomDueDteInd = null;
		String cpnTyp = null;
		Date dtedTms = null;

		
		if (cpnTyp == null || dtedTms == null || eomDueDteInd ==  null) // -- if cpnTyp, dtedTms or eomDueDteInd re blank, get details from FT_T_BDCH
		{
			String sql =	"SELECT CPN_TYP, DTED_TMS, EOM_DUE_DTE_IND FROM FT_T_BDCH " +
							"WHERE END_TMS IS NULL " +
							"AND INSTR_ID = '"+instrId+"'";

			if (logger.isInfoEnabled())
				logger.info("sql: " + sql);
			
			dbConn.setSQL(sql);
			dbConn.execute();
			
			if (!dbConn.isEndOfStream())
			{
				cpnTyp = dbConn.getNextString();
			
				if(logger.isInfoEnabled())
					logger.info("d/b - cpnTyp: " + cpnTyp);
				
				if (cpnTyp == null || "".equals(cpnTyp))
				{
					logger.info("CPN_TYP is null. Exiting"); // -- cpnTyp not found exit
					return true;
				}

// EG-7625 if coupon type = ZERO_COUPON, NONE, DEFAULTED, EXCHANGED or FUNGED, exit
				if ("ZERO COUPON".equals(cpnTyp) || "NONE".equals(cpnTyp) || "DEFAULTED".equals(cpnTyp)
						|| "EXCHANGED".equals(cpnTyp) || "FUNGED".equals(cpnTyp))
				{
					if(logger.isInfoEnabled())
					{
						logger.info("CPN_TYP = " + cpnTyp + ". Exiting");
						return true;
					}
				}

				//dtedTms = dbConn.getNextDate();
				dtedTms = dbConn.getNextTimestamp();
			
				if(logger.isInfoEnabled())
					logger.info("d/b - dtedTms: " + dtedTms);
				
				if (dtedTms == null)
				{
					logger.info("No Dated Date. Exiting"); // -- dtedTms not found exit
					return true;
				}
				
				eomDueDteInd = dbConn.getNextString();
			
				if(logger.isInfoEnabled())
					logger.info("d/b - eomDueDteInd: " + eomDueDteInd);

			}
		}

		Calendar accStartDate = Calendar.getInstance();
		accStartDate.setTime(dtedTms);
		
		//Get the ISSU segment
		Date matExpTms = null;
		String currCode = null;
		

		if (matExpTms == null || currCode == null) // -- if not found, get matExpTms and currCode from FT_T_ISSU
		{
			String sql =	"SELECT MAT_EXP_TMS, DISTRIBUTION_CURR_CDE FROM FT_T_ISSU " +
							"WHERE INSTR_ID = '"+instrId+"'";

			if (logger.isInfoEnabled())
				logger.info("sql: " + sql);
			
			dbConn.setSQL(sql);
			dbConn.execute();
			
			if (!dbConn.isEndOfStream())
			{
				//matExpTms = dbConn.getNextDate();
				matExpTms = dbConn.getNextTimestamp();
			
				if(logger.isInfoEnabled())
					logger.info("d/b - matExpTms: " + matExpTms);
				
				currCode = dbConn.getNextString();
			
				if(logger.isInfoEnabled())
					logger.info("d/b - currCode: " + currCode);
			}
		}
		
		if (currCode == null)
		{
			logger.info("No currency. Exiting"); // -- if currCode not found, exit
			return true;
		}
		
		//Get the IEDFGNCM segment
		String fltPayDay = null;
		

		if (fltPayDay == null) // -- if fltPayDay not found, get from FT_T_IEDF
		{
			String sql =	"SELECT PY_DTE_FQ_DESC FROM FT_T_IEDF " +
							"WHERE END_TMS IS NULL " +
							"AND EV_TYP = 'INTEREST' " +
							"AND EV_PAY_METH_TYP = 'COUPON' " +
							"AND INSTR_ID = '"+instrId+"'";

			if (logger.isInfoEnabled())
				logger.info("sql: " + sql);
			
			dbConn.setSQL(sql);
			dbConn.execute();
			
			if (!dbConn.isEndOfStream())
			{
				fltPayDay = dbConn.getNextString();
			
				if(logger.isInfoEnabled())
					logger.info("d/b - fltPayDay: " + fltPayDay);
			}
		}
		
		//Get the ISCA segment
		String calId = null;
		List<String> calIDList = new ArrayList<String>(); // All linked calendars
		
		
		if (calId == null || "".equals(calId)){ // -- if no IssueCalendarParticipant segments found or calId = null ,get from FT_T_ISCA

			String sql =	"SELECT CAL_ID FROM FT_T_ISCA " +
							"WHERE CAL_PURP_TYP='SETLMENT' " +
							"AND END_TMS IS NULL " +
							"AND INSTR_ID = '"+instrId+"'";

			if (logger.isInfoEnabled())
				logger.info("sql: " + sql);
			
			dbConn.setSQL(sql);
			dbConn.execute();
			
			if (!dbConn.isEndOfStream())
			{
				do {
					calId = dbConn.getNextString();
					calIDList.add(calId);
					if(logger.isInfoEnabled())
						logger.info("d/b - calId: " + calId);
				} while (!dbConn.isEndOfStream());
			}
			
			if(calId == null || "".equals(calId)) // -- if no calendar in found exit
			{
				logger.info("No calendar. Exiting");
				return true;
			}

		}
		
		String sql = "SELECT COALESCE(to_number(TO_CHAR(MIN(greg_dte), 'YYYY'), '9999'), 0) FROM ft_t_cadp WHERE cal_id = '"+calId+"'";
		
		if (logger.isInfoEnabled())
			logger.info("sql: " + sql); // -- get calYear from FT_T_CADP
		
		dbConn.setSQL(sql);
		dbConn.execute();
		
		if (dbConn.isEndOfStream())
		{
			logger.info("Exiting as no Calendar dates for " + calId); // -- if calYear not found exit
			return true;
		}
				
		int calYear = dbConn.getNextInt();
		if (calYear==0)
		{
			logger.info("Exiting as no Calendar dates for " + calId);
			return true;
		}
		
		if(logger.isInfoEnabled())
			logger.info("Calendar dates from year: " + calYear);	
		
		int payDay=0;
		if(fltPayDay != null && fltPayDay.startsWith("Calendar day: ")) // -- if fltPayDay != '' and starts with "Calendar day: " get payday from fltPayDay
		{
			payDay = Integer.parseInt(fltPayDay.substring(14));
			/* commented due to this pushing the date to the next month i.e 30/6/2017 becomes 31/7/2017 when payDay is 31 which is incorrect 
			firstPayDte.set(Calendar.DAY_OF_MONTH, payDay);
			 */
		}
		
/* EG-10011 Derive recordDateOffset using ICE fields (Record Date, Pay Date)
 			This requires calendars linked to the instrument. Therefore this is added after getting the calendars. 
*/
		logger.info("EG-10011 Start"); 	
		
		if ("ICE".equalsIgnoreCase(msgClassification))  //This process is for ICE message
		{
			logger.info("EG-10011 msgClassification: " + msgClassification ); 	
		
			// When database holds "Active" in recordDateMethod, update it to "Business". It is used by record date calculation later
			if (recordDateMethod.length() > 0)
				if (recordDateMethod.charAt(0) == 'A' || recordDateMethod.charAt(0) == 'a')
					{	
						recordDateMethod = "Business";	
						logger.info("EG-10011 recordDateMethod is updated to: " + recordDateMethod ); 	
					}
			
			//Generate IssueStatistics segment for Record Date Method(RECNVNMD)
			logger.info("EG-10011 Generate IssueStatistics RECNVNMD Business" ); 

			Calendar cal = Calendar.getInstance();
			cal.set(Calendar.HOUR_OF_DAY, 0);
			cal.set(Calendar.MINUTE, 0);
			cal.set(Calendar.SECOND, 0);
			cal.set(Calendar.MILLISECOND, 0);
			Date today = cal.getTime();
			
			SegmentId newSeg1 = xml.addSegment(XMLMessage.A_UNKNOWN, "IssueStatistic"); // -- add UNKNOWN segment
			xml.addField("DATA_STAT_TYP", newSeg1, "ACTIVE");
			xml.addField("STAT_DEF_ID", newSeg1, "RECNVNMD");
			xml.addField("STAT_CHAR_VAL_TXT", newSeg1, "Business");
			xml.addField("START_TMS", newSeg1, today);
			xml.setFieldAttribute("START_TMS", newSeg1, "INSERT_ONLY", "Y");
			xml.addField("LAST_CHG_USR_ID", newSeg1, "ICE");
			xml.addField("DATA_SRC_ID", newSeg1, "ICE");	
			
			//Update recordDateOffset with the calculated iceRecordDateOffset
			//recordDateOffset takes priority over exDivDays by EG-4954 
			Integer iceRecordDateOffset = calcIceRecordDateOffset (instrId, dbConn, calId, calIDList );	
			logger.info("EG-10011 iceRecordDateOffset is calculated: " + iceRecordDateOffset);

			// When recordDateOffset is null, the default 1 is used to derive record date from payment date
			if (iceRecordDateOffset > 0){	
				
				recordDateOffset = iceRecordDateOffset;
				logger.info("EG-10011 recordDateOffset: " + recordDateOffset ); 

			//Generate IssueStatistics segment for recordDateOffset(RECDDTOFF)

				logger.info("EG-10011 Generate IssueStatistics RECDDTOFF" ); 
				SegmentId newSeg = xml.addSegment(XMLMessage.A_UNKNOWN, "IssueStatistic"); // -- add UNKNOWN segment
				xml.addField("DATA_STAT_TYP", newSeg, "ACTIVE");
				xml.addField("STAT_DEF_ID", newSeg, "RECDTOFF");
				xml.addField("STAT_INT_VAL_NUM", newSeg, BigDecimal.valueOf(recordDateOffset));			
				xml.addField("START_TMS", newSeg, today);
				xml.setFieldAttribute("START_TMS", newSeg, "INSERT_ONLY", "Y");
	
			}				
		}	
		logger.info("EG-10011 End"); 

/* EG-10011 end of change */

		List<Object []> schedule = new ArrayList<Object []>();
		Object[] latestSchedule;
			
		if (matExpTms == null)
		{
			for(int i=0; i < 120; i++)
			{
				latestSchedule = getCouponDetails(dbConn, xml, accStartDate, firstPayDte, pyDteFqDyTyp, pyDteFqQty,
							pyDteFqSpTyp, busDyConvTyp, eomDueDteInd, cpnTyp, daysMthBasis, payDay, calId, calIDList, instrId, null, i);
				schedule.add(latestSchedule);
				accStartDate.setTime(((Calendar) latestSchedule[3]).getTime());
				if(logger.isInfoEnabled())
					logger.info("accStartDate = "+accStartDate.getTime());
				accStartDate.add(Calendar.DAY_OF_MONTH, 1);
				if(logger.isInfoEnabled())
					logger.info("Adjusted: accStartDate = "+accStartDate.getTime());
			}
		} else {
			int i = 0;
			//Calendar latestCpnDate = Calendar.getInstance();
			Calendar matExpDte = Calendar.getInstance();
			matExpDte.setTime(matExpTms);
			BigDecimal dayCheck;
			
			do {
				if(logger.isInfoEnabled())
				{
					logger.info("firstPayDte = "+firstPayDte.getTime());
				}
				// -- call getCouponDetails to get accStartDate, firstPayDte, pyDteFqDyTyp, pyDteFqQty,  for each coupon
				latestSchedule = getCouponDetails(dbConn, xml, accStartDate, firstPayDte, pyDteFqDyTyp, pyDteFqQty, 
							pyDteFqSpTyp, busDyConvTyp, eomDueDteInd, cpnTyp, daysMthBasis, payDay, calId, calIDList, instrId, matExpDte, i);
				if(logger.isInfoEnabled())
				{
					logger.info("latestSchedule[1]" + latestSchedule[1].getClass().getName());
					logger.info("latestCpnDate = " + ((Calendar)latestSchedule[1]).getTime());
					logger.info("compareTo = " + matExpDte.compareTo((Calendar)latestSchedule[1]));
				}
				
				dayCheck = (BigDecimal)latestSchedule[4];

				if (dayCheck.compareTo(BigDecimal.ZERO)>0) // -- if dayCheck > 0 then adjust accStartDate
				{
					schedule.add(latestSchedule);
					accStartDate.setTime(((Calendar) latestSchedule[3]).getTime());
					if(logger.isInfoEnabled())
						logger.info("accStartDate = "+accStartDate.getTime());
					accStartDate.add(Calendar.DAY_OF_MONTH, 1);
					if(logger.isInfoEnabled())
						logger.info("Adjusted: accStartDate = "+accStartDate.getTime());
				} else
					logger.info("Num of days is zero.");

				i++;
			} while (matExpDte.compareTo((Calendar)latestSchedule[1]) > 0 && dayCheck.compareTo(BigDecimal.ZERO)>0 && i < 200);
		}
		
		int couponCnt = schedule.size();
		//
		
		// EG-7020 look for UPDATE IncomeEventParticipant segments. get INCEVPRTID and check for PRT_PURP_TYP
		// the schedules hanging off these need to be removed, but not the IncomeEventParticipant

		logger.info("EG-7020 start");
		boolean schedulesChanged = false;
		
		// EG-8245 Stop unwanted IPDF deletion when MSGCLASSIFICATION ="PM" (ProductMaster)
		
		if("PM".equalsIgnoreCase(msgClassification)){
			logger.info ("found msgClassification: " + msgClassification);
			logger.info ("Message is from ProductMaster. Skip EG-7020");
		}
		else {
			logger.info ("found msgClassification: " + msgClassification);
			logger.info ("Look for IncomeEventParticipant segment");
		
			for(int i=0; i < xml.getSegmentCount(); i++)
			{
				SegmentId segId = new SegmentId(i);
				String segType = xml.getSegmentType(segId);
				if ("IncomeEventParticipant".equals(segType)) // -- Look for IncomeEventParticipant segment
				{
					String incEvPrtId;
					try {
						
						incEvPrtId = xml.getStringField("INC_EV_PRT_ID", segId); // -- Found incEvPrtId, so 
						logger.info ("found incEvPrtId: " + incEvPrtId);
						schedulesChanged = true;
					} catch (Exception e) {
						logger.info ("Did not find incEvPrtId in this segment");
					}
				}
			}
		} // EG-8245 end of if-else
		
		if (schedulesChanged) // -- Schedules are likely to have changed, so remove existing schedules
		{
			logger.info("Schedules may have changed, so remove existing 'MHICPPAY', 'MHICPACC' schedules");
			logger.info("incEvDefId: " + incEvDefId);
			logger.info("check for GNCM recs to delete");
			String gncmDeleteCountSql = "select count(*) from ft_t_gncm where CROSS_REF_ID in " +
								 "(select INC_PAY_DEF_ID from FT_T_IPDF where INC_EV_PRT_ID in " +
								 "(select INC_EV_PRT_ID from FT_T_IEVP where PRT_PURP_TYP in ('MHICPPAY', 'MHICPACC' ) " +
								 "and INC_EV_DEF_ID = '" + incEvDefId + "'))";
			if (logger.isInfoEnabled())
				logger.info("gncmDeleteCountSql: " + gncmDeleteCountSql); // -- get calYear from FT_T_CADP
			try {		
					dbConn.setSQL(gncmDeleteCountSql); // -- count delete GNCM rows for updated schedules
					dbConn.execute();
					if (!dbConn.isEndOfStream()) {
						String countGNCMDeletes = dbConn.getNextString();
						logger.info("countGNCMDeletes: " + countGNCMDeletes);
					}
			} catch (Exception e) {
				//Report error
				e.printStackTrace();
				logger.info("count GNCM rows failed");
			}

			String gncmDeleteSql = "delete from ft_t_gncm where CROSS_REF_ID in " +
								 "(select INC_PAY_DEF_ID from FT_T_IPDF where INC_EV_PRT_ID in " +
								 "(select INC_EV_PRT_ID from FT_T_IEVP where PRT_PURP_TYP in ('MHICPPAY', 'MHICPACC' ) " +
								 "and INC_EV_DEF_ID = '" + incEvDefId + "'))";
			if (logger.isInfoEnabled())
				logger.info("gncmDeleteSql: " + gncmDeleteSql);
			try {		
					dbConn.setSQL(gncmDeleteSql); // -- delete GNCM rows for updated schedules
					dbConn.execute();
			} catch (Exception e) {
				//Report error
				e.printStackTrace();
				logger.info("delete GNCM rows failed");
			}
			logger.info("check for IPDF recs to delete");
			String ipdfDeleteCountSql = "select count(*) from FT_T_IPDF where INC_EV_PRT_ID in " +
													"(select INC_EV_PRT_ID from FT_T_IEVP where PRT_PURP_TYP in ('MHICPPAY', 'MHICPACC' ) " +
													"and INC_EV_DEF_ID = '" + incEvDefId + "')";
			if (logger.isInfoEnabled())
				logger.info("ipdfDeleteCountSql: " + ipdfDeleteCountSql);
			try {		
					dbConn.setSQL(ipdfDeleteCountSql); // -- delete IPDF rows for updated schedules
					dbConn.execute();
					if (!dbConn.isEndOfStream()) {
						String countIPDFDeletes = dbConn.getNextString();
						logger.info("countIPDFDeletes: " + countIPDFDeletes);
					}
			} catch (Exception e) {
				//Report error
				e.printStackTrace();
				logger.info("count IPDF rows failed");
			}
			String ipdfDeleteSql = "delete from FT_T_IPDF where INC_EV_PRT_ID in " +
													"(select INC_EV_PRT_ID from FT_T_IEVP where PRT_PURP_TYP in ('MHICPPAY', 'MHICPACC' ) " +
													"and INC_EV_DEF_ID = '" + incEvDefId + "')";
			if (logger.isInfoEnabled())
				logger.info("ipdfDeleteSql: " + ipdfDeleteSql);
			try {		
					dbConn.setSQL(ipdfDeleteSql); // -- delete IPDF rows for updated schedules
					dbConn.execute();
			} catch (Exception e) {
				//Report error
				e.printStackTrace();
				logger.info("delete IPDF rows failed");
			}
		}
		else {
			logger.info("Schedules have not changed");

		}
		logger.info("EG-7020 end");

		// -- EG-5550 start
		// -- EG-5550 delete GNCM, IPDF, IEVP for end dated IEVP rows associated with this IncomeEventDefinition
		logger.info("EG-5550 start");
		logger.info("incEvDefId: " + incEvDefId);
		logger.info("check for GNCM recs to delete");
		String gncmDeleteCountSql = "select count(*) from ft_t_gncm where CROSS_REF_ID in " +
							 "(select INC_PAY_DEF_ID from FT_T_IPDF where INC_EV_PRT_ID in " +
							 "(select INC_EV_PRT_ID from FT_T_IEVP where PRT_PURP_TYP in ('MHICPPAY', 'MHICPACC' ) " +
							 "and END_TMS is NOT NULL and INC_EV_DEF_ID = '" + incEvDefId + "'))";
		if (logger.isInfoEnabled())
			logger.info("gncmDeleteCountSql: " + gncmDeleteCountSql); // -- get calYear from FT_T_CADP
		try {		
				dbConn.setSQL(gncmDeleteCountSql); // -- count delete GNCM rows for end dated schedules
				dbConn.execute();
				if (!dbConn.isEndOfStream()) {
					String countGNCMDeletes = dbConn.getNextString();
					logger.info("countGNCMDeletes: " + countGNCMDeletes);
				}
		} catch (Exception e) {
			//Report error
			e.printStackTrace();
			logger.info("count GNCM rows failed");
		}

		String gncmDeleteSql = "delete from ft_t_gncm where CROSS_REF_ID in " +
							 "(select INC_PAY_DEF_ID from FT_T_IPDF where INC_EV_PRT_ID in " +
							 "(select INC_EV_PRT_ID from FT_T_IEVP where PRT_PURP_TYP in ('MHICPPAY', 'MHICPACC' ) " +
							 "and END_TMS is NOT NULL and INC_EV_DEF_ID = '" + incEvDefId + "'))";
		if (logger.isInfoEnabled())
			logger.info("gncmDeleteSql: " + gncmDeleteSql);
		try {		
				dbConn.setSQL(gncmDeleteSql); // -- delete GNCM rows for end dated schedules
				dbConn.execute();
		} catch (Exception e) {
			//Report error
			e.printStackTrace();
			logger.info("delete GNCM rows failed");
		}
		logger.info("check for IPDF recs to delete");
		String ipdfDeleteCountSql = "select count(*) from FT_T_IPDF where INC_EV_PRT_ID in " +
												"(select INC_EV_PRT_ID from FT_T_IEVP where PRT_PURP_TYP in ('MHICPPAY', 'MHICPACC' ) " +
												"and END_TMS is NOT NULL and INC_EV_DEF_ID = '" + incEvDefId + "')";
		if (logger.isInfoEnabled())
			logger.info("ipdfDeleteCountSql: " + ipdfDeleteCountSql);
		try {		
				dbConn.setSQL(ipdfDeleteCountSql); // -- delete IPDF rows for end dated schedules
				dbConn.execute();
				if (!dbConn.isEndOfStream()) {
					String countIPDFDeletes = dbConn.getNextString();
					logger.info("countIPDFDeletes: " + countIPDFDeletes);
				}
		} catch (Exception e) {
			//Report error
			e.printStackTrace();
			logger.info("count IPDF rows failed");
		}
		String ipdfDeleteSql = "delete from FT_T_IPDF where INC_EV_PRT_ID in " +
												"(select INC_EV_PRT_ID from FT_T_IEVP where PRT_PURP_TYP in ('MHICPPAY', 'MHICPACC' ) " +
												"and END_TMS is NOT NULL and INC_EV_DEF_ID = '" + incEvDefId + "')";
		if (logger.isInfoEnabled())
			logger.info("ipdfDeleteSql: " + ipdfDeleteSql);
		try {		
				dbConn.setSQL(ipdfDeleteSql); // -- delete IPDF rows for end dated schedules
				dbConn.execute();
		} catch (Exception e) {
			//Report error
			e.printStackTrace();
			logger.info("delete IPDF rows failed");
		}
		logger.info("check for IEVP recs to delete");
		String ievpDeleteCountSql = "select count(*) from FT_T_IEVP where PRT_PURP_TYP in ('MHICPPAY', 'MHICPACC' ) " +
												"and END_TMS is NOT NULL and INC_EV_DEF_ID = '" + incEvDefId + "'";
		if (logger.isInfoEnabled())
			logger.info("ievpDeleteCountSql: " + ievpDeleteCountSql);
		try {		
				dbConn.setSQL(ievpDeleteCountSql); // -- delete IEVP rows for end dated schedules
				dbConn.execute();
				if (!dbConn.isEndOfStream()) {
					String countIEVPDeletes = dbConn.getNextString();
					logger.info("countIEVPDeletes: " + countIEVPDeletes);
				}
		} catch (Exception e) {
			//Report error
			e.printStackTrace();
			logger.info("delete IEVP rows failed");
		}
		String ievpDeleteSql = "delete from FT_T_IEVP where PRT_PURP_TYP in ('MHICPPAY', 'MHICPACC' ) " +
												"and END_TMS is NOT NULL and INC_EV_DEF_ID = '" + incEvDefId + "'";
		if (logger.isInfoEnabled())
			logger.info("ievpDeleteSql: " + ievpDeleteSql);
		try {		
				dbConn.setSQL(ievpDeleteSql); // -- delete IEVP rows for end dated schedules
				dbConn.execute();
		} catch (Exception e) {
			//Report error
			e.printStackTrace();
			logger.info("delete IEVP rows failed");
		}
		logger.info("EG-5550 end");
		// -- EG-5550 end
		
		

		if (couponCnt > 0) // -- if couponCnt > 0 then begin creation of segments
		{
			SegmentId iedfPaySeg = xml.addSegment( XMLMessage.A_REFERENCE,"IncomeEventDefinition"); // -- create REFERENCE segment for IncomeEventDefinition
			xml.setSegmentAttribute(iedfPaySeg, "MATCH", "IEDF_MATCH_1");
			xml.addField("INSTR_ID", iedfPaySeg, instrId);
			xml.addField("EV_TYP", iedfPaySeg, "INTEREST");

			SegmentId ievpPaySeg = xml.addSegment( XMLMessage.A_UNKNOWN,"IncomeEventParticipant"); // -- create UNKNOWN segment for IncomeEventParticipant PRT_PURP_TYP = MHICPPAY
			xml.setSegmentAttribute(ievpPaySeg, "MATCH", "IEVP_PRTPURP_1");
			xml.addField("PRT_PURP_TYP", ievpPaySeg, "MHICPPAY");
		}

		for(int i=0; i < couponCnt; i++)																												// -- loop for each coupon
		{
			Object[] currCoupon = schedule.get(i); 
			
			logger.info("checking for busDyConvTyp == "+ busDyConvTyp);
			
			if(busDyConvTyp.length() > 4){
					
			//if ( ((Calendar) currCoupon[1]).compareTo(Calendar.getInstance()) > 0 || !"FLOATING".equals(cpnTyp))
			if ((busDyConvTyp.substring(5).equals("UAD") && ((Calendar) currCoupon[1]).get(Calendar.YEAR) >= calYear)
					|| ((Calendar) currCoupon[2]).get(Calendar.YEAR) >= calYear)
			{
				SegmentId newSeg = xml.addSegment(XMLMessage.A_UNKNOWN, "IncomePaymentDefinition"); // -- add UNKNOWN segment for IncomePaymentDefinition
				xml.setSegmentAttribute(newSeg, "MATCH", "IPDF_MATCH_10");
				SegmentId ccySeg = xml.addSegment(XMLMessage.A_REFERENCE, "CurrencyCharacteristics", newSeg); // -- Add a REFERENCE segment for CurrencyCharacteristics
				xml.setSegmentAttribute(ccySeg, "MATCH", "CYCH_CURCDE");
				xml.setSegmentAttribute(ccySeg, "COPY_FROM", "INSTR_ID");
				xml.setSegmentAttribute(ccySeg, "COPY_TO", "EV_INSTR_ID");
				logger.info("Adding ISO_CURR_CDE");
				xml.addField("ISO_CURR_CDE", ccySeg, currCode);
				xml.addField("DATA_STAT_TYP", newSeg, "ACTIVE");
				if(logger.isInfoEnabled())
				{
					logger.info("Adding EV_CRTE");
					logger.info("currCoupon[0]: " + currCoupon[0]);
				}
				if ((BigDecimal) currCoupon[0] != null)
					xml.addField("EV_CRTE", newSeg, (BigDecimal) currCoupon[0]);
				logger.info("Added EV_CRTE");
				xml.addField("EV_RATE_BAS_TYP", newSeg, "PAR VAL");
				xml.addField("EV_RATE_TYP", newSeg, "PERCENT");
				xml.addField("ISS_PART_RL_TYP", newSeg, "RECEIVE");
				xml.addField("START_TMS", newSeg, (Date) ((Calendar) currCoupon[1]).getTime());
				xml.addField("END_TMS", newSeg, (Date) ((Calendar) currCoupon[1]).getTime());

				if (logger.isInfoEnabled()) {
					logger.info("IPDF Segment added");
				}
								
				
				/*EG -49. Calculate record_date value.
				If exDivDays has a value then minus this value from the Income Payment Def Start TMS 
				value. This will give the record_date value to be used. If exDivDays does not have a value
				then check the UI field 'record offset' value and use that instead. Failing then use the default 
				value currently set to 1. */
																																																
				if(logger.isInfoEnabled())
					logger.info("!!About to calculate record_date. Var exDivDays check : " + exDivDays);
				
				try {	
					
					Date inc_pay_def_start_tms = null;
					Date record_date = null; 
					//Integer record_offset = null;
					Integer offsetDaysCnt = null;
					
					try {
						
						inc_pay_def_start_tms = (Date) ((Calendar) currCoupon[1]).getTime();
					
					} catch (Exception e) {
						
						e.printStackTrace();
						if(logger.isInfoEnabled())
							logger.info("!!Failed to get income payment date: " + inc_pay_def_start_tms);
					}
					
					GregorianCalendar gc = new GregorianCalendar();
					gc.setTime(inc_pay_def_start_tms);
					if (foundRecordDateMethod) {
						if (recordDateMethod.length() > 0)
							if (recordDateMethod.charAt(0) == 'A' || recordDateMethod.charAt(0) == 'a')
								{
									Date coupon_schedule_end_tms = (Date)((Calendar) currCoupon[3]).getTime();
									gc.setTime(coupon_schedule_end_tms);
									logger.info("!!Actual Record Date Method Override - Record Date be based on coupon_schedule_end_tms: " + coupon_schedule_end_tms);
								}
					}
					//EG-4954 - recordDateOffset takes priority over exDivDays
					if(logger.isInfoEnabled()) {
						logger.info("EG-4954 ** check if recordDateOffset overrides exDivDays **");
						logger.info("EG-4954 positive value found for recordDateOffset check : " + recordDateOffset);
						logger.info("EG-4954 positive value found for exDivDays check : " + exDivDays);
					}
					// EG-4954 - allow zero or positive value for record date offset
					if ( recordDateOffset >= 0) {
						if(logger.isInfoEnabled())
							logger.info("EG-4954 - d/b - positive/zero value found for recordDateOffset check : " + recordDateOffset);

						//set up the counter for recordDateOffset
						offsetDaysCnt = recordDateOffset;
					}
					else {

						if ( exDivDays > 0) {

							if(logger.isInfoEnabled())
									logger.info("d/b - positive value found for exDivDays check : " + exDivDays);

							//set up the counter for exDivDays
							offsetDaysCnt = exDivDays;

						}
						else {
							offsetDaysCnt = 1; // EG-5121 - This is the default value if no other can be found
							logger.info("exDivDays, recordDateOffset not found - using default value: 1: " + offsetDaysCnt);
						}
					}
					//using existing method of 'isBusinessDay', check the final calendar date and adjust if required
					//to most recent business day prior to this date.
					//EG-4954
					// this has been extended to take recordDateMethod parameter to handle either Business Days (the default)
					// or Actual days
					if(logger.isInfoEnabled()) {
						logger.info("EG-4954 PRE recordDateCalc - recordDateOffset: " + recordDateOffset);
						logger.info("EG-4954 PRE recordDateCalc - recordDateMethod: " + recordDateMethod);
					}
					record_date = recordDateCalc(offsetDaysCnt, dbConn,calId,calIDList,gc, recordDateMethod);
					if(logger.isInfoEnabled())
						logger.info("!!Var record_date value is: "+record_date);	
				
					//Add record_date comment segment to message
					SegmentId newSeg2 = xml.addSegment(XMLMessage.A_UNKNOWN, "IncomePaymentComment");												// -- add UNKNOWN segment of IncomePaymentComment for record date
					xml.setSegmentAttribute(newSeg2, "MATCH", "GNCM_MATCH");
					xml.addField("CMNT_TXT", newSeg2, "Record Date set for Income Payment Definition");
					xml.addField("CREATED_TMS", newSeg2,record_date );
					xml.addField("COMM_REAS_MNEM", newSeg2, "RECRD_DT");
					xml.addField("GNCM_TBL_TYP", newSeg2, "IPDF");
					xml.addField("LN_NUM", newSeg2,new BigDecimal("1.0"));
								
				
				} catch (Exception e) {

					if (logger.isInfoEnabled())
						logger.info("!!Failed to calculate record_date " );
					e.printStackTrace();
				
					
				}
				
			}
		  }
		}																																															// -- end of coupon loop

		if(logger.isDebugEnabled())
       logger.debug("xml: " + xml.getXMLString());
		
		if (couponCnt > 0)																					
		{		
			SegmentId iedfAccSeg = xml.addSegment( XMLMessage.A_REFERENCE,"IncomeEventDefinition"); // -- If coupons exist add REFERENCE segment for IncomeEventDefinition INTEREST
			xml.setSegmentAttribute(iedfAccSeg, "MATCH", "IEDF_MATCH_1");
			xml.addField("INSTR_ID", iedfAccSeg, instrId);
			xml.addField("EV_TYP", iedfAccSeg, "INTEREST");

			SegmentId ievpAccrSeg = xml.addSegment( XMLMessage.A_UNKNOWN,"IncomeEventParticipant"); // -- add UNKNOWN segment for IncomeEventParticipant PRT_PURP_TYP = MHICPACC
			xml.setSegmentAttribute(ievpAccrSeg, "MATCH", "IEVP_PRTPURP_1");
			xml.addField("PRT_PURP_TYP", ievpAccrSeg, "MHICPACC");
		}
		
		for(int i=0; i < couponCnt; i++)																	
		{
			Object[] currCoupon = schedule.get(i);
			
			logger.info("checking for busDyConvTyp == "+ busDyConvTyp);
			
			if(busDyConvTyp.length() > 4){
			
			if ((busDyConvTyp.substring(5).equals("UAD") && ((Calendar) currCoupon[1]).get(Calendar.YEAR) >= calYear)
					|| ((Calendar) currCoupon[2]).get(Calendar.YEAR) >= calYear)
			{
				SegmentId newSeg = xml.addSegment(XMLMessage.A_UNKNOWN, "IncomePaymentDefinition");				// -- add UNKNOWN segment for IncomePaymentDefinition
				xml.setSegmentAttribute(newSeg, "MATCH", "IPDF_MATCH_10");
				SegmentId ccySeg = xml.addSegment(XMLMessage.A_REFERENCE, "CurrencyCharacteristics", newSeg); // -- add REFERENCE segment for CurrencyCharacteristics
				xml.setSegmentAttribute(ccySeg, "MATCH", "CYCH_CURCDE");
				xml.setSegmentAttribute(ccySeg, "COPY_FROM", "INSTR_ID");
				xml.setSegmentAttribute(ccySeg, "COPY_TO", "EV_INSTR_ID");
				xml.addField("ISO_CURR_CDE", ccySeg, currCode);
				xml.addField("DATA_STAT_TYP", newSeg, "ACTIVE");
				if(logger.isInfoEnabled())
				{
					logger.info("Adding EV_CRTE");
					logger.info("currCoupon[5]: " + currCoupon[5]);
				}
				if ((BigDecimal) currCoupon[5] != null)
					xml.addField("EV_CRTE", newSeg, (BigDecimal) currCoupon[5]);
				logger.info("Added EV_CRTE");
				xml.addField("EV_RATE_BAS_TYP", newSeg, "PAR VAL");
				xml.addField("EV_RATE_TYP", newSeg, "PERCENT");
				xml.addField("ISS_PART_RL_TYP", newSeg, "RECEIVE");
				xml.addField("START_TMS", newSeg, (Date) ((Calendar) currCoupon[2]).getTime());
				xml.addField("END_TMS", newSeg, (Date) ((Calendar) currCoupon[3]).getTime());
				xml.addField("VAL_DAYS_OF_NUM", newSeg, (BigDecimal) currCoupon[4]);
	
				if(logger.isDebugEnabled())
                      logger.debug("xml: " + xml.getXMLString());
			}
		}
		
		}																																											
		

		return true;
	}

	public Object [] getCouponDetails(DatabaseAccess db, XMLMessage msg, Calendar accStDate, Calendar firstPyDte,
			String freqDyTyp, Integer freqQty, String freqSpan,	String busDyConv, 
			String eomDueDteInd, String cpnTyp, String daysMthBasis, int payDay, String calId, List<String> calIDList, String instrId, Calendar matExpDte, int dteNum) {
		
		Object[] latestCoupon = new Object[6];
		
		Calendar dteCpn = (Calendar) firstPyDte.clone();
		if (logger.isInfoEnabled())
			logger.info("dteCpn: '" + dteCpn.getTime() + "'");


		int multiple = 0;

		if (freqSpan.trim().equals("A")) {
			multiple = (12 / freqQty) * dteNum;
			dteCpn.add(Calendar.MONTH, multiple);
		} else if (freqSpan.trim().equals("MO")) {
			multiple = freqQty * dteNum;
			dteCpn.add(Calendar.MONTH, multiple);
		} else if (freqSpan.trim().equals("W")) {
			multiple = freqQty * dteNum * 7;
			dteCpn.add(Calendar.DAY_OF_MONTH, multiple);
		} else if (freqSpan.trim().equals("D")) {
			multiple = freqQty * dteNum;
			dteCpn.add(Calendar.DAY_OF_MONTH, multiple);
		} else {
			if (logger.isInfoEnabled())
				logger.info("Not a regular coupon. freqSpan: '" + freqSpan + "'. Exiting");
			return null;
		}
		
		if (freqDyTyp.equals("BOM")) 
		{
			dteCpn.set(Calendar.DAY_OF_MONTH, 1);
			
		} else if (freqDyTyp.equals("EOM") || "Y".equals(eomDueDteInd)) 
		{
			dteCpn.set(Calendar.DAY_OF_MONTH, dteCpn.getActualMaximum(Calendar.DAY_OF_MONTH));
		} else if (payDay > 0 && dteCpn.getActualMaximum(Calendar.DAY_OF_MONTH) >= payDay)
		{
			if (logger.isInfoEnabled())
				logger.info("Adjusting payDay to " + payDay);
			dteCpn.set(Calendar.DAY_OF_MONTH, payDay);
			
		}

		if (logger.isInfoEnabled()) {
			logger.info("freqSpan: '" + freqSpan + "'");
			logger.info("multiple: '" + multiple + "'");
			logger.info("dteCpn: '" + dteCpn.getTime() + "'");
		}
		
		/* Moved up due fix issue with EOM and Pay day adjustments resulting in date being in the next month 
		if (payDay > 0 && dteCpn.getActualMaximum(Calendar.DAY_OF_MONTH) >= payDay)
		{
			if (logger.isInfoEnabled())
				logger.info("Adjusting payDay to " + payDay);
			dteCpn.set(Calendar.DAY_OF_MONTH, payDay);
			
		}*/
		
		int weekDay = dteCpn.get(Calendar.DAY_OF_WEEK);
		if (logger.isInfoEnabled())
			logger.info("weekDay: '" + weekDay + "'");
		
		Calendar payDate = Calendar.getInstance();
		Calendar accEndDate = Calendar.getInstance();
		if (matExpDte != null && matExpDte.compareTo(dteCpn) < 0)
		{
			payDate = (Calendar) matExpDte.clone();
			accEndDate = (Calendar) matExpDte.clone();
		} else {
			payDate = (Calendar) dteCpn.clone();
			accEndDate = (Calendar) dteCpn.clone();
		}
		Calendar accStartDate = Calendar.getInstance();
		accStartDate = (Calendar) accStDate.clone();
		
		if ( calId != null && !calId.equals("") && !isBusinessDay(db, calId, calIDList, payDate) )
		{
			
			if ("FLBDYADJ".equals(busDyConv) || "FLBDYUAD".equals(busDyConv) || "MDBANM".equals(busDyConv))
			{
				do {
					payDate.add(Calendar.DAY_OF_MONTH, 1);
				} while (!isBusinessDay(db, calId, calIDList, payDate));
				
			} else if ("MDBDYADJ".equals(busDyConv) || "MDBDYUAD".equals(busDyConv))
			{
				do {
					payDate.add(Calendar.DAY_OF_MONTH, 1);
				} while (!isBusinessDay(db, calId, calIDList, payDate));
				
				if (payDate.get(Calendar.MONTH) != dteCpn.get(Calendar.MONTH)) //amended to cater for not rolling to the next month as well as not to the next year
				{
					do {
						payDate.add(Calendar.DAY_OF_MONTH, -1);
					} while (!isBusinessDay(db, calId, calIDList, payDate));
				}
				
			} else  if ("PRBDYADJ".equals(busDyConv) || "PRBDYUAD".equals(busDyConv))
			{
				do {
					payDate.add(Calendar.DAY_OF_MONTH, -1);
				} while (!isBusinessDay(db, calId, calIDList, payDate));
			}
			
			if ("FLBDYADJ".equals(busDyConv) || "MDBDYADJ".equals(busDyConv) || "PRBDYADJ".equals(busDyConv) || "MDBANM".equals(busDyConv))
			{
				accEndDate = (Calendar) payDate.clone();
			} 
		}
		accEndDate.add(Calendar.DAY_OF_MONTH, -1);
		
		int numOfDays = 0;
		if (logger.isInfoEnabled())
			logger.info("daysMthBasis: '" + daysMthBasis + "'");
		
		if ("ACT".equals(daysMthBasis))
			numOfDays = calculateDaysBetween(accStartDate, accEndDate)+1;
		else if ("30".equals(daysMthBasis)||"I30".equals(daysMthBasis)||"I30E".equals(daysMthBasis)||"30E".equals(daysMthBasis))
		{	
			int startDay = accStartDate.get(Calendar.DAY_OF_MONTH);
			if (logger.isInfoEnabled())
			logger.info("startDay: '" + startDay + "'");
			int endDay = accEndDate.get(Calendar.DAY_OF_MONTH);
			if (logger.isInfoEnabled())
				logger.info("endDay: '" + endDay + "'");
			int endLastDay = accEndDate.getActualMaximum(Calendar.DAY_OF_MONTH);
			if (logger.isInfoEnabled())
				logger.info("endLastDay: '" + endLastDay + "'");
			
			if (endDay == endLastDay && startDay == 1)
			{
				if (accEndDate.get(Calendar.YEAR) - accStartDate.get(Calendar.YEAR) > 0)
				{
					numOfDays = (13 + accEndDate.get(Calendar.MONTH) - accStartDate.get(Calendar.MONTH)) * 30;
				} else
				{
					numOfDays = (1 + accEndDate.get(Calendar.MONTH) - accStartDate.get(Calendar.MONTH)) * 30;
				}
			} else 
			{
				int compMonthDays = 0;
				if ((accEndDate.get(Calendar.YEAR) - accStartDate.get(Calendar.YEAR)) > 0)
				{
					compMonthDays = (12 + accEndDate.get(Calendar.MONTH) - accStartDate.get(Calendar.MONTH) - 1) * 30;
					if (logger.isInfoEnabled())
						logger.info("Diff year - compMonthDays: '" + compMonthDays + "'");
				} else
				{
					compMonthDays = (accEndDate.get(Calendar.MONTH) - accStartDate.get(Calendar.MONTH) - 1) * 30;
					if (logger.isInfoEnabled())
						logger.info("Same year - compMonthDays: '" + compMonthDays + "'");
				}
				numOfDays = 30 - (startDay - 1) + endDay + compMonthDays;
				if (logger.isInfoEnabled())
					logger.info("numOfDays: '" + numOfDays + "'");
				
				if ("I30E".equals(daysMthBasis) && endLastDay == 31 && endDay == 30)
				{
					numOfDays = numOfDays - 1;
				}
			}
		}
		else if ("NL".equals(daysMthBasis))
		{
			int startLeapYr = accStartDate.get(Calendar.YEAR) % 4;
			if (logger.isInfoEnabled())
				logger.info("startLeapYr: " + startLeapYr);
			
			int endLeapYr = accEndDate.get(Calendar.YEAR) % 4;
			if (logger.isInfoEnabled())
				logger.info("endLeapYr: " + endLeapYr);
			
			if (startLeapYr == 0 || endLeapYr == 0)
			{
				Calendar leapDate = Calendar.getInstance();
				
				if (startLeapYr ==  0)
				{
					leapDate = (Calendar) accStartDate.clone();
					leapDate.set(accStartDate.get(Calendar.YEAR), 1, 29);
				}
				else
				{
					leapDate = (Calendar) accEndDate.clone();
					leapDate.set(accEndDate.get(Calendar.YEAR), 1, 29);
				}

				if (leapDate.after(accStartDate) && leapDate.before(accStartDate))
				{
					numOfDays = calculateDaysBetween(accStartDate, accEndDate) - 1;
				} else
				{
					numOfDays = calculateDaysBetween(accStartDate, accEndDate);
				}	

			} else
			{
				numOfDays = calculateDaysBetween(accStartDate, accEndDate);
			}			
		}
		
		//Get the BDST segment
		BigDecimal cpnRate = null;  // current cpn rate
				
		if(cpnRate == null)
		{
			String sql =	"SELECT COALESCE(CPN_CRTE,0) FROM FT_T_BDST " +
							"WHERE INSTR_ID = '"+instrId+"'";

			if (logger.isInfoEnabled())
				logger.info("sql: " + sql);
			
			db.setSQL(sql);
			db.execute();
			
			if (!db.isEndOfStream())
			{
				cpnRate = db.getNextDecimal();
			
				if(logger.isInfoEnabled())
					logger.info("d/b - cpnRate: " + cpnRate);
			}
		}

		if ("FIXED".equals(cpnTyp))
		{
			
			if(cpnRate != null)
			{
				if (logger.isInfoEnabled())
					logger.info("cpnRate: '" + cpnRate + "'");
				latestCoupon[0] = cpnRate;
				latestCoupon[5] = cpnRate;	// added due to the fix done in the floating schedule rate selection
				logger.info("cpnRate added to array");
			}
// EG-7668 Add VARIBLE coupon type			
		} else if ( "VARIABLE".equals(cpnTyp)||"STEP COUPON".equals(cpnTyp)||"FLOATING".equals(cpnTyp))
		{			
/*
			Calendar rateDate = Calendar.getInstance();
			rateDate = (Calendar) accStartDate.clone();
			rateDate.add(Calendar.DAY_OF_MONTH, 7);
*/			BigDecimal cpnRateBB = null;
			BigDecimal cpnRatePreviousBB = null;
			
			cpnRateBB = getPeriodRate(db, payDate, instrId);
			cpnRatePreviousBB = getPeriodRate(db, accStartDate, instrId);
							
			if(cpnRateBB != null)
			{
				latestCoupon[0] = cpnRateBB;
				logger.info("cpnRate added to array");
			} else if(cpnRate != null && accStartDate.before(Calendar.getInstance())
						&& accEndDate.after(Calendar.getInstance()))
			{
				logger.info("Current accrual period. Using current coupon rate");
				//latestCoupon[0] = cpnRate;
				latestCoupon[5] = cpnRate; // setting cpn rate on ACC Schedule and not PAY schedule to fix issue with the wrong rates being displayed on accrual schedules
				logger.info("cpnRate added to array");
			}
			
			if(cpnRatePreviousBB != null)
			{
				latestCoupon[5] = cpnRatePreviousBB;
				logger.info("PreviousCpnRate added to array");
			} 
		}
		if (logger.isInfoEnabled())
			logger.info("payDate: '" + payDate.getTime() + "'");
		
		latestCoupon[1] = payDate;
		
		if (logger.isInfoEnabled())
			logger.info("payDate added to array");
			logger.info("accStDate: '" + accStartDate.getTime() + "'");
			
		latestCoupon[2] = accStartDate;
		
		if (logger.isInfoEnabled())
			logger.info("accStDate added to array");
		
		//EG-10543 Adjust accrual end date to less than maturity date
		if (logger.isInfoEnabled())
			logger.info("accEndDate: '" + accEndDate.getTime() + "'");
		//
		
		if ( matExpDte != null )	//EG-10543 2025/07/02 Add check to skip if the bond is perpetual
		{	
			if (logger.isInfoEnabled()) logger.info("matExpDte is not null. Proceed");
			
			if (accEndDate.compareTo(matExpDte) >= 0 )
			{
			  if (logger.isInfoEnabled())
			  logger.info("AccEndDate is after or equal to maturity date.  Hence start subtracting 1 day until AccEndate is before maturity");
			  
			  do 
			{      accEndDate.add(Calendar.DAY_OF_MONTH, -1);    }
			  
			while (accEndDate.compareTo(matExpDte) >= 0);
			}
		}  //EG-10543 2025/07/02
		//*/		
		if (logger.isInfoEnabled())
			logger.info("accEndDate after modified: '" + accEndDate.getTime() + "'");
		//EG-10543 End
			
		latestCoupon[3] = accEndDate;
		
		if (logger.isInfoEnabled())
			logger.info("accEndDate added to array");
			logger.info("numOfDays: '" + numOfDays + "'");
			
		latestCoupon[4] = new BigDecimal(numOfDays);
		logger.info("numOfDays added to array");;

		return latestCoupon;

	}
	
	private static Integer calculateDaysBetween ( Calendar start, Calendar end )
	{
	    long startTime = start.getTimeInMillis();
	    long endTime = end.getTimeInMillis();
	    long diffTime = endTime - startTime;
	    return (int)( diffTime / (1000 * 60 * 60 * 24) );
	}
	
	public boolean isBusinessDay (DatabaseAccess db, String calendarId, List<String> calendars, Calendar theDay )
	{
		int weekDay = theDay.get(Calendar.DAY_OF_WEEK);
		if (logger.isInfoEnabled())
			logger.info("theDay: '" + theDay + "'");
		
		if ( weekDay == 1 || weekDay == 7 )
			return false;
		else
		{
			StringBuilder calenderSqlValue = new StringBuilder("(");
			Iterator<String> i = calendars.iterator();
			do {
				calenderSqlValue.append("'");
				calenderSqlValue.append(i.next());
				calenderSqlValue.append("',");
				
			} while (i.hasNext());
			calenderSqlValue.deleteCharAt(calenderSqlValue.length()-1);
			calenderSqlValue.append(")");
			
			SimpleDateFormat dteFormat = new SimpleDateFormat("dd-MMM-yyyy");
			if (logger.isInfoEnabled())
				logger.info("dteFormat: '" + dteFormat + "'");
			String dte = dteFormat.format(theDay.getTimeInMillis());

			if (logger.isInfoEnabled())
				logger.info("dte: '" + dte + "'");			
			
			
			String sql =	"SELECT COUNT(*) FROM FT_T_CADP " +
							"WHERE CAL_ID in "+calenderSqlValue.toString()+" " +
							//"AND to_char(GREG_DTE,'dd-Mon-yyyy') = '"+dte+"' " +
							"AND GREG_DTE = '"+dte+"' " +
							"AND BUS_DTE_IND = 'N'";
			
			if (logger.isInfoEnabled())
				logger.info("sql: '" + sql + "'");
			
			db.setSQL(sql);
			db.execute();

			int cnt = db.getNextInt();
			
			if (logger.isInfoEnabled())
				logger.info("cnt: " + cnt);
			
			if (cnt > 0)
			{
				logger.info("Date is a non-business day");
				return false;
			} else
			{
				logger.info("Date is a business day");
				return true;
			}
		}
	}
	
	public Date recordDateCalc (int offsetCnt, DatabaseAccess dbConn, String calId, List<String> calendars, Calendar gc, String recordDateMethod )
	{
		
		Date dateCalc = null;
		char recDtMethod;

		if(logger.isInfoEnabled())
			logger.info("!!recordDateCalc method called.");
		
		int count = offsetCnt;
		if (recordDateMethod.charAt(0) == 'A' || recordDateMethod.charAt(0) == 'a')
			recDtMethod = 'A';
		else
			recDtMethod = 'B';
		logger.info("recordDateCalc - recDtMethod: " + recDtMethod);
		logger.info("recordDateCalc - Days offset: " + offsetCnt);

		//Loop control to go back for the number of offset days and check each day to see if its a business day and if it is, 
		//decrement the counter until the offset number of days have been reached. 
		while (count > 0){
			
			if(logger.isInfoEnabled())
				logger.info("EG-4954 - !!Check recordDateCalc method while loop counter value: "+count);
			
			//Call isBusinessDay method and check if the current day is a business day.
			//If it is then decrement the counter by one
			//EG-4954 For Actual recordDateMethod, always decrement the counter
			if (calId != null && !calId.equals("") && (isBusinessDay(dbConn, calId, calendars, gc)) || recDtMethod == 'A') --count;
			gc.add(Calendar.DAY_OF_YEAR, -1);
			
			
			if(logger.isInfoEnabled())
				logger.info("!!Decremented calendar date/time is: "+gc.getTime());
		}
		
		//Final check of the returned date to ensure it is a business day and if not then find the next business day.
		//This is only applicable to "Business" Record Date Method
		if (recDtMethod == 'B') {
			while (calId != null && !calId.equals("") && !isBusinessDay(dbConn, calId, calendars, gc)) {

				if (logger.isInfoEnabled())
					logger.info("!!Final check - Calendar date/time is: " + gc.getTime());
				gc.add(Calendar.DAY_OF_MONTH, -1);
			}
		}
		else
		{
			if (logger.isInfoEnabled())
				logger.info("!!Do not adjust final date for non-Business Record Date - Calendar date/time is: " + gc.getTime());
		}
		//assign and return the calculated record date
		dateCalc = gc.getTime();
		
		return dateCalc;

	}
	
	private BigDecimal getPeriodRate (DatabaseAccess dbConn, Calendar date, String instrId)
	{
		
		SimpleDateFormat dteFormat = new SimpleDateFormat("yyyyMMdd");
		if (logger.isInfoEnabled())
			logger.info("dteFormat: '" + dteFormat + "'");

		String dte = dteFormat.format(date.getTimeInMillis());

		if (logger.isInfoEnabled())
		logger.info("Getting period Coupon Rate for dte: '" + dte + "'");
		// EG-9636 - preserve historic coupon rates. changed PRT_PURP_TYP from MHICPPAY to MHICPACC
		String sql =	"SELECT EV_CRTE FROM FT_T_IPDF " +
						"WHERE TRIM(EV_RATE_TYP)='PERCENT' " +
						"AND EV_CRTE IS NOT NULL " +
						"AND '"+dte+"' BETWEEN CAST(start_tms AS DATE) " +
						"AND CAST(END_TMS AS DATE) " +
						"AND INC_EV_PRT_ID in ( SELECT INC_EV_PRT_ID " +
						"FROM FT_T_IEVP WHERE trim(PRT_PURP_TYP) IN ('MHICPACC') " +
						"AND INC_EV_DEF_ID IN ( SELECT INC_EV_DEF_ID " +
						"FROM FT_T_IEDF WHERE EV_TYP = 'INTEREST' " +
						"AND INSTR_ID = '"+instrId+"')) " +
						"order by start_tms desc";
		
		if (logger.isInfoEnabled())
			logger.info("sql: " + sql);
		
		dbConn.setSQL(sql);
		dbConn.execute();
		
		BigDecimal cpnRateBB = null;
		
		if (!dbConn.isEndOfStream())
		{
			cpnRateBB = dbConn.getNextDecimal();
			
			if(logger.isInfoEnabled())
				logger.info("cpnRateBB: " + cpnRateBB);
			
		}
			
		return cpnRateBB;

	}

	//EG-8567 function
	private void HandleOnMaturitySchedule(XMLMessage xml, DatabaseAccess dbConn, String strInstrId)
	{
		/*
			1. Fetch Coupon data - Accrual Date, Maturity Date & Coupon Rate - for single schedule.
			2. If any attribute is empty then exit rule
			3. Delete any existing IPDF, IEVP and GNCM records for MHICCPAC & MHICPPAY  for 'INTEREST' event
			4. Create segments - IEVP and IPDF with one schedule.
		*/
		logger.info("Starting HandleOnMaturitySchedule");

		try {
				Object[] cpnDetails;
				cpnDetails = FetchCpnData(dbConn, strInstrId);

				logger.info("Accrual Date is - " + cpnDetails[0]);
				logger.info("Coupon Rate is - " + cpnDetails[1]);
				logger.info("Maturity Date is - " + cpnDetails[2]);

				BigDecimal cpnRate = (BigDecimal) cpnDetails[1];

				if (cpnRate.equals(BigDecimal.ZERO)) {
					logger.info("Exiting as it is a zero coupon bond");
					return;
				}

				if( cpnDetails[0] == null || "".equals(cpnDetails[0])){
					logger.info("Exiting as Accrual date is missing");
					return;
				}

				if( cpnDetails[2] == null || "".equals(cpnDetails[2])){
					logger.info("Exiting as maturity date is missing");
					return;
				}

				DeleteCouponSchedules(dbConn, strInstrId); //Delete any existing schedules
				AddOnMaturitySchedule(xml, cpnDetails, strInstrId); //Add a single schedule
		}
		catch (Exception e) {
			//Report error
			e.printStackTrace();
			logger.info("HandleOnMaturitySchedule failed");
		}

		logger.info("Completed HandleOnMaturitySchedule");
	}
	//EG-8567 function
	private Object [] FetchCpnData(DatabaseAccess db, String strInstrId)
	{
		Object[] cpnData = new Object[3];
		try {
				//Fetch DTED_TMS, MAT_EXP_TMS, CPN_CRTE from db to create a single schedule for 'OnMaturity' bonds
				Date dtedTms = null;
				Date dtMaturity = null;
				BigDecimal cpnRate = null;

				String sql = "SELECT DTED_TMS FROM FT_T_BDCH WHERE END_TMS IS NULL AND INSTR_ID = '" + strInstrId + "'"; 

				db.setSQL(sql);
				db.execute();

				if (!db.isEndOfStream()) {
					//dtedTms = db.getNextDate();
					dtedTms = db.getNextTimestamp();
				}
				cpnData[0] = dtedTms;

				sql = "SELECT COALESCE(CPN_CRTE,0) FROM FT_T_BDST WHERE INSTR_ID = '" + strInstrId + "'";

				db.setSQL(sql);
				db.execute();

				if (!db.isEndOfStream()) {
					cpnRate = db.getNextDecimal();
				}
				cpnData[1] = cpnRate;

				sql = "SELECT MAT_EXP_TMS FROM FT_T_ISSU WHERE INSTR_ID = '" + strInstrId + "'";

				db.setSQL(sql);
				db.execute();

				if (!db.isEndOfStream()) {
					//dtMaturity = db.getNextDate();
					dtMaturity = db.getNextTimestamp();
				}
				cpnData[2] = dtMaturity;
		}
		catch (Exception e) {
			//Report error
			e.printStackTrace();
			logger.info("FetchCpnData failed");
		}

		return cpnData;
	}

	//EG-8567 function

	private static void DeleteCouponSchedules(DatabaseAccess db, String strInstrId)
	{

		try {
				String gncmDeleteSql = "delete from ft_t_gncm where CROSS_REF_ID in " +
						"(select INC_PAY_DEF_ID from FT_T_IPDF where INC_EV_PRT_ID in " +
						"(select INC_EV_PRT_ID from FT_T_IEVP where PRT_PURP_TYP in ('MHICPPAY', 'MHICPACC' ) " +
						"and INC_EV_DEF_ID in (Select inc_ev_def_id from ft_t_iedf where ev_typ = 'INTEREST' and instr_id ='" + strInstrId + "')))";

				logger.info("gncmDeleteSql: " + gncmDeleteSql);

				db.setSQL(gncmDeleteSql); // -- delete GNCM rows for updated schedules
				db.execute();

				String ipdfDeleteSql = "delete from  FT_T_IPDF where INC_EV_PRT_ID in " +
					"(select INC_EV_PRT_ID from FT_T_IEVP where PRT_PURP_TYP in ('MHICPPAY', 'MHICPACC' ) " +
					" and INC_EV_DEF_ID in (Select inc_ev_def_id from ft_t_iedf where ev_typ = 'INTEREST' " +
					" and instr_id = '" + strInstrId + "'))";
				logger.info("ipdfDeleteSql: " + ipdfDeleteSql);

				db.setSQL(ipdfDeleteSql); // -- delete IPDF rows for end dated schedules
				db.execute();

				String ievpDeleteSql = "delete from FT_T_IEVP where PRT_PURP_TYP in ('MHICPPAY', 'MHICPACC' ) " +
					" and INC_EV_DEF_ID in (Select inc_ev_def_id from ft_t_iedf where ev_typ = 'INTEREST' " +
					" and instr_id = '" + strInstrId + "')";
				logger.info("ievpDeleteSql: " + ievpDeleteSql);

				db.setSQL(ievpDeleteSql); // -- delete IEVP rows for end dated schedules
				db.execute();


			} catch (Exception e) {
			//Report error
			e.printStackTrace();
			logger.info("delete GNCM, IPDF AND IEVP rows failed");
		}

	}

	private static void AddOnMaturitySchedule(XMLMessage xml, Object[] cpnScheduleData, String strInstrId)
	{
		logger.info("Starting AddOnMaturitySchedule");

		try
		{
			logger.info ("Accrual Date  " + cpnScheduleData[0]);
			logger.info ("Coupon Rate " + cpnScheduleData[1] );
			logger.info ("Maturity Date " + cpnScheduleData[2]);

			//Create Coupon Payment Schedule - MHICPPAY

			// -- create REFERENCE segment for IncomeEventDefinition
			SegmentId iedfPaySeg = xml.addSegment( XMLMessage.A_REFERENCE,"IncomeEventDefinition");
			xml.setSegmentAttribute(iedfPaySeg, "MATCH", "IEDF_MATCH_1");
			xml.addField("INSTR_ID", iedfPaySeg, strInstrId);
			xml.addField("EV_TYP", iedfPaySeg, "INTEREST");

			// -- create UNKNOWN segment for IncomeEventParticipant PRT_PURP_TYP = MHICPPAY
			SegmentId ievpPaySeg = xml.addSegment( XMLMessage.A_UNKNOWN,"IncomeEventParticipant");
			xml.setSegmentAttribute(ievpPaySeg, "MATCH", "IEVP_PRTPURP_1");
			xml.addField("PRT_PURP_TYP", ievpPaySeg, "MHICPPAY");

			// -- add UNKNOWN segment for IncomePaymentDefinition
			SegmentId newSeg = xml.addSegment(XMLMessage.A_UNKNOWN, "IncomePaymentDefinition");
			xml.setSegmentAttribute(newSeg, "MATCH", "IPDF_MATCH_10");
			xml.addField("DATA_STAT_TYP", newSeg, "ACTIVE");
			xml.addField("EV_CRTE", newSeg, (BigDecimal) cpnScheduleData[1]);
			xml.addField("EV_RATE_BAS_TYP", newSeg, "PAR VAL");
			xml.addField("EV_RATE_TYP", newSeg, "PERCENT");
			xml.addField("ISS_PART_RL_TYP", newSeg, "RECEIVE");
			xml.addField("START_TMS", newSeg, (Date) cpnScheduleData[2]); //set to maturity date
			xml.addField("END_TMS", newSeg, (Date) cpnScheduleData[2]); //set to maturity date

			logger.info("MHICPPAY IPDF Segment added");

			//Add coupon accrual schedule - MHICPACC
			// -- If coupons exist add REFERENCE segment for IncomeEventDefinition INTEREST
			SegmentId iedfAccSeg = xml.addSegment( XMLMessage.A_REFERENCE,"IncomeEventDefinition");
			xml.setSegmentAttribute(iedfAccSeg, "MATCH", "IEDF_MATCH_1");
			xml.addField("INSTR_ID", iedfAccSeg, strInstrId);
			xml.addField("EV_TYP", iedfAccSeg, "INTEREST");

			// -- add UNKNOWN segment for IncomeEventParticipant PRT_PURP_TYP = MHICPACC
			SegmentId ievpAccrSeg = xml.addSegment( XMLMessage.A_UNKNOWN,"IncomeEventParticipant");
			xml.setSegmentAttribute(ievpAccrSeg, "MATCH", "IEVP_PRTPURP_1");
			xml.addField("PRT_PURP_TYP", ievpAccrSeg, "MHICPACC");

			// -- add UNKNOWN segment for IncomePaymentDefinition
			SegmentId newSeg1 = xml.addSegment(XMLMessage.A_UNKNOWN, "IncomePaymentDefinition");
			xml.setSegmentAttribute(newSeg, "MATCH", "IPDF_MATCH_10");
			xml.addField("DATA_STAT_TYP", newSeg1, "ACTIVE");
			xml.addField("EV_CRTE", newSeg1, (BigDecimal) cpnScheduleData[1]);
			xml.addField("EV_RATE_BAS_TYP", newSeg1, "PAR VAL");
			xml.addField("EV_RATE_TYP", newSeg1, "PERCENT");
			xml.addField("ISS_PART_RL_TYP", newSeg1, "RECEIVE");
			xml.addField("START_TMS", newSeg1, (Date) cpnScheduleData[0]);
			//Coupon Accrual end date is 1 day less than Maturity date.  Note - it is not adjusted for business day conventions
			Calendar matExpDte = Calendar.getInstance();
			matExpDte.setTime((Date) cpnScheduleData[2]);
			matExpDte.add(Calendar.DAY_OF_MONTH, -1);

			logger.info("Maturity Date Minus one day is  " + matExpDte.getTime() );

			xml.addField("END_TMS", newSeg1, matExpDte.getTime());

			logger.info("MHICPACC IPDF Segment added");

		}
		catch(Exception e){
			e.printStackTrace();
			logger.info("AddOnMaturitySchedule failed");
		}

		logger.info("Completed AddOnMaturitySchedule");
	}

	private boolean isMortgageNonPool (DatabaseAccess db, String strInstrId )
	{
		boolean blMtge = false;

		logger.info("Starting isMortgageNonPool");

		try
		{
			// EG-9625 - remove instrument type query as it is no longer required
			//String strInstrumentType = null;

			//String sql = "SELECT ISS_TYP FROM FT_T_ISSU WHERE INSTR_ID = '" + strInstrId + "'";

			//db.setSQL(sql);
			//db.execute();

			//if (!db.isEndOfStream()) {
			//	strInstrumentType = db.getNextString();
			//}
			//logger.info("Instrument Type is - " + strInstrumentType);

			// EG-9625 - remove check for instrument type = "MORTGAGE"
			//if(strInstrumentType.equals("MORTGAGE"))
			//{
				// EG-9625 - remove check for request type MortgagePools
				//Check if it belongs to MortgagePools category.  If so, return false as connector should not map the schedules from BBG
				String nonPoolsql = "select vnd_rqst_typ from ft_cfg_vret vret " +
						"where ext_iss_typ_txt in (select cl_value " +
						"from ft_t_iscl where indus_cl_set_id = 'BBSECTYP' " +
						"and clsf_purp_typ = 'BBISSTYP' and end_tms is null " +
						"and instr_id = '" + strInstrId +"') ";
				//		"and vnd_rqst_typ = 'MortgagePools'";

				db.setSQL(nonPoolsql);
				db.execute();

				String strVndRqstType = null;

				if(!db.isEndOfStream())
				{
					strVndRqstType = db.getNextString();
					// EG-9625 - change check for MortgagePools to Mortgage Non Pool
					if (strVndRqstType.equals("Mortgage Non Pool")) {
						logger.info("Mortgage Non Pool type of request.  Hence return true and the rule will not derive schedule");
						blMtge = true;
					} else {
						logger.info("Not a Mortgage Non Pool type of request.  Hence return false and let the rule derive schedule");
						blMtge = false;
					}
				}
				else
				{
					logger.info("SQL did not fetch any rows.  Hence it may not be a Mortgage Non Pool.  Return false");
					blMtge = false;
				}
			//}

			logger.info("Completed isMortgageNonPool");
		}
		catch(Exception e) {
			e.printStackTrace();
			logger.info("Error while checking MORTGAGE NON POOL instrument");
		}

		return blMtge;
	}
	
	private Integer calcIceRecordDateOffset (String strInstrId, DatabaseAccess dbConn, String calId, List<String> calIDList )
	{ 
/*	EG-10011 Calculate number of "Business" days between (ICE)Record Date and (ICE) Pay Date 
 */
		logger.info("EG-10011 calcIceRecordDateOffset start");
		int iceRecordDateOffset = 0;	// number of days between record date and pay date
		String sql = null;
		Date iceRecordDate = null;
		Date icePayDate = null;
		
		// get Record Date and Pay Date from FT_T_ISST
		sql = "SELECT STAT_VAL_DTE FROM FT_T_ISST WHERE STAT_DEF_ID='ICERECDT' AND INSTR_ID = '" + strInstrId + "' limit 1";

		dbConn.setSQL(sql);
		dbConn.execute();

		if (!dbConn.isEndOfStream()) {
			//iceRecordDate = dbConn.getNextDate();
			iceRecordDate = dbConn.getNextTimestamp();
		}

		sql = "SELECT STAT_VAL_DTE FROM FT_T_ISST WHERE STAT_DEF_ID='ICEPAYDT' AND INSTR_ID = '" + strInstrId + "' limit 1";

		dbConn.setSQL(sql);
		dbConn.execute();

		if (!dbConn.isEndOfStream()) {
			//icePayDate = dbConn.getNextDate();
			icePayDate = dbConn.getNextTimestamp();
		}
		
		// If either Record Date or Pay Date is missing, stop processing and return 0
		logger.info("ISST.ICERECDT: " + iceRecordDate);
		logger.info("ISST.ICEPAYDT: " + icePayDate);
		
		if (iceRecordDate == null || icePayDate == null){
			logger.info("RecordDate and PayDate are not set by ICE. Return 0");
			return iceRecordDateOffset;  // return 0
		}
		
		
		// Calculate day number into iceRecordDateOffset: between Record Date and Pay Date using isBusinessDay
		
		Date dd = iceRecordDate;				// Set base date to compare with pay date
		Calendar gc = Calendar.getInstance();	// gc to increment dates
		gc.setTime(iceRecordDate); 				// calendar starts from record date 
		
		// Adjust starting day (dd) to the previous business day if record date is non-business day
		
		logger.info("Record Date dd: "+ dd );
		
		if (!isBusinessDay(dbConn, calId, calIDList, gc))
		{
			logger.info("Record date is non-business day. Adjust -1: " + dd);
			do {
				gc.add(Calendar.DAY_OF_MONTH, -1);
				dd = gc.getTime();
				logger.info("After the adjustment: "+ dd );
				
			} while (!isBusinessDay(dbConn, calId, calIDList, gc));				
		}
		
		logger.info("dd: "+ dd + " icePayDate: " + icePayDate );
		
		while (dd.before(icePayDate)) {
			
			logger.info("dd.before(icePayDate) is true");
			logger.info("dd: "+ dd + " icePayDate: " + icePayDate );
	
			if (iceRecordDateOffset > 90) {
				logger.info("Break as iceRecordDateOffset is exceeded 90. iceRecordDateOffset: " + iceRecordDateOffset);
				break;
			}

			if (isBusinessDay(dbConn, calId, calIDList, gc))	{
				iceRecordDateOffset = iceRecordDateOffset + 1;	// Increment iceRecordDateOffset
				logger.info(dd + " is a business day, iceRecordDateOffset: " + iceRecordDateOffset );
			}
			else {
				logger.info(dd + " is not a business day, move one day");	
			}
			
			gc.add(Calendar.DAY_OF_MONTH, 1);	//Increment gc
			dd = gc.getTime();					// Set the current date to Date variable
		} // end of while

		logger.info("End of calculation. iceRecordDateOffset: " + iceRecordDateOffset );
		
		return iceRecordDateOffset;

	} // end of calcIceRecordDateOffset
}
