import com.thegoldensource.jbre.DatabaseAccess;
import com.thegoldensource.jbre.DatabaseObjectContainer;
import com.thegoldensource.jbre.GSException;
import com.thegoldensource.jbre.JavaRule;
import com.thegoldensource.jbre.NotificationCreator;
import com.thegoldensource.jbre.ProcessorContext;
import com.thegoldensource.jbre.SegmentId;
import com.thegoldensource.jbre.XMLMessage;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;

import org.apache.log4j.Logger;

public class CJavaMHIDeriveSettleCodes implements JavaRule
{

	private final static Logger logger = Logger.getLogger(CJavaMHIDeriveSettleCodes.class);
	private boolean re_derive=false;

	public boolean initialize(String[] parameters)
	{
		logger.info("Initializing CJavaMHIDeriveSettleCodes Rule");
		return true;
	}

	public boolean process(XMLMessage msg, DatabaseObjectContainer dboc, ProcessorContext pContext, DatabaseAccess dbConn, NotificationCreator notfcn)
			throws GSException
	{
		String issuerName = "";
		String isinId = "";
		String wsolxidnId = "";
		String bbMktSct = "";
		String bbIndSec = "";
		String bbIndsGr = "";
		String mhscbdcl = "";
		String mhscstlg = "";
		String soiMember = "";
		String denomCurrency = "";
		String bbissType = "";
		String issuIssType = "";
		String mhiAcctcls = "";
		String map1InstrClassify = "";
		String map1IssueType = "";

		logger.info("Processing rule CJavaMHIDeriveSettleCodes to generate GLOSS Settle Codes Starts");
		int segmentCount = msg.getSegmentCount();
		logger.info("Segment count is " + segmentCount);
		
		
		 if(logger.isDebugEnabled())
               logger.debug("xml: " + msg.getXMLString());

		String mainEntityTblTyp = msg.getStringField("MAIN_ENTITY_TBL_TYP", new SegmentId(0));

		if(null == mainEntityTblTyp || !"ISSU".equalsIgnoreCase(mainEntityTblTyp)){
			logger.info("Not an Issue message but is " + mainEntityTblTyp + " message. Hence exiting from Rule");
			return true;
		}
		
		String instrId = pContext.getInstrId();

		if ((instrId == null) || ("".equals(instrId)))
		{
			logger.info("Unable to get Instrument Id for this message. Exiting from Rule");
			return true;
		}
		else
		{
			logger.info("instrId = " + instrId);
		}
		List<SegmentId> segIdsISCL=getSegmentIds("IssueClassification", msg);
		
		
		for(SegmentId segId:segIdsISCL){
			
			if("C".equals(msg.getSegmentAttribute(segId, "SEGPROCESSEDIND"))
				&& "BB".equals(msg.getStringField("DATA_SRC_ID", segId))	
				&& "BBINDSEC".equals(msg.getStringField("INDUS_CL_SET_ID", segId))){
				
				re_derive=true;
				logger.info("Setting re-derive flag to: " + re_derive);
				break;
			}
		}
		
		String sqlQuery =  "SELECT (SELECT ISSR.ISSR_NME FROM FT_T_ISSR ISSR WHERE ISSR.INSTR_ISSR_ID = ISSU.INSTR_ISSR_ID  and ISSR.END_TMS IS NULL) ISSR_NME " +
				",(SELECT ISIN.ISS_ID FROM FT_T_ISID ISIN WHERE ISIN.INSTR_ID = ISSU.INSTR_ID AND ISIN.END_TMS IS NULL AND ISIN.ID_CTXT_TYP = 'ISIN' limit 1) ISIN " +
				",(SELECT ISID.ISS_ID FROM FT_T_ISID ISID WHERE ISID.INSTR_ID = ISSU.INSTR_ID AND ISID.END_TMS IS NULL AND ISID.ID_CTXT_TYP = 'WSOLXIDN' limit 1) WSOLXIDN " +
				",(SELECT ISCL.CL_VALUE FROM FT_T_ISCL ISCL WHERE ISCL.INSTR_ID = ISSU.INSTR_ID AND ISCL.END_TMS IS NULL AND ISCL.INDUS_CL_SET_ID = 'BBMKTSCT' limit 1) BBMKTSCT " +
				",(select bbindsec.cl_value from FT_T_ISCL bbindsec where bbindsec.instr_id = issu.instr_id and bbindsec.end_tms is null and bbindsec.INDUS_CL_SET_ID = 'BBINDSEC' and bbindsec.CLSF_PURP_TYP = 'INDCLASS') bbindsec " +
				",(select bbindsec.cl_value from FT_T_ISCL bbindsec where bbindsec.instr_id = issu.instr_id and bbindsec.end_tms is null and bbindsec.INDUS_CL_SET_ID = 'BBINDSGR') bbindsgr " +

				",(select bbindsec.cl_value from FT_T_ISCL bbindsec where bbindsec.instr_id = issu.instr_id and bbindsec.end_tms is null and bbindsec.INDUS_CL_SET_ID = 'MHSCBDCL'  limit 1) mhscbdcl " +
				",(select bbindsec.cl_value from FT_T_ISCL bbindsec where bbindsec.instr_id = issu.instr_id and bbindsec.end_tms is null and bbindsec.INDUS_CL_SET_ID = 'MHSCSTLG'  limit 1) mhscstlg " +
				
				//",case when issu.instr_id in (select instr_id from ft_t_isgp isgp where isgp.prt_purp_typ = 'INTEREST' and isgp.end_tms is null) then 'Y' else 'N' end as  SOI " +  
				",case when exists (select instr_id from ft_t_isgp isgp where isgp.prt_purp_typ = 'INTEREST' and isgp.end_tms is null and isgp.instr_id = issu.instr_id ) then 'Y' else 'N' end as  SOI " +  
				",ISSU.DENOM_CURR_CDE " +
				",ISSU.ISS_TYP " +
				",ISCL.CL_VALUE as BBISSTYP " +
				",(SELECT ISCL.CL_VALUE FROM FT_T_ISCL ISCL WHERE ISCL.INSTR_ID = ISSU.INSTR_ID AND ISCL.END_TMS IS NULL AND ISCL.INDUS_CL_SET_ID = 'MHACTCLS') AS MHACTCLS " +
				",MAP1.INSTR_CLASSIFY " +
				",MAP1.ISSUE_TYPE " +
				"FROM FT_T_ISSU ISSU " +
				"LEFT JOIN FT_T_ISCL ISCL ON ISCL.INSTR_ID = ISSU.INSTR_ID AND ISCL.INDUS_CL_SET_ID = 'BBSECTYP' AND ISCL.CLSF_PURP_TYP = 'BBISSTYP' AND ISCL.END_TMS IS NULL " +
				"LEFT join MHI_SETTLECODE_MAP1 MAP1 on MAP1.ISSUE_TYPE = UPPER(ISCL.CL_VALUE) " +
				"WHERE ISSU.INSTR_ID = '" + instrId + "' ";
		logger.info("Get useful info. SQL query is: " + sqlQuery);
		dbConn.setSQL(sqlQuery);
		dbConn.execute();

		if (!dbConn.isEndOfStream()) {
			issuerName = dbConn.getNextString();
			logger.info("issuerName: "+issuerName);
		}

		if (!dbConn.isEndOfStream()) {
			isinId = dbConn.getNextString();
			logger.info("isinId: "+isinId);
		}

		if (!dbConn.isEndOfStream()) {
			wsolxidnId = dbConn.getNextString();
			logger.info("wsolxidnId: "+wsolxidnId);
		}
		if (!dbConn.isEndOfStream()) {
			bbMktSct = dbConn.getNextString();
			logger.info("bbMktSct: "+bbMktSct);
		}
		if (!dbConn.isEndOfStream()) {
			bbIndSec = dbConn.getNextString();
			logger.info("bbIndSec: "+bbIndSec);
		}

		if (!dbConn.isEndOfStream()) {
			bbIndsGr = dbConn.getNextString();
			logger.info("bbIndsGr: "+bbIndsGr);
		}

		if (!dbConn.isEndOfStream()) {
			mhscbdcl = dbConn.getNextString();
			logger.info("mhscbdcl: "+mhscbdcl);
		}

		if (!dbConn.isEndOfStream()) {
			mhscstlg = dbConn.getNextString();
			logger.info("mhscstlg: "+mhscstlg);
		}

		if (!dbConn.isEndOfStream()) {
			soiMember = dbConn.getNextString();
			logger.info("soiMember: "+soiMember);
		}

		if (!dbConn.isEndOfStream()) {
			denomCurrency = dbConn.getNextString();
			logger.info("denomCurrency: "+denomCurrency);
		}
		if (!dbConn.isEndOfStream()) {
			issuIssType = dbConn.getNextString();
			logger.info("issuIssType: "+issuIssType);
		}

		if (!dbConn.isEndOfStream()) {
			bbissType = dbConn.getNextString();
			logger.info("bbissType: "+bbissType);
		}

		if (!dbConn.isEndOfStream()) {
			mhiAcctcls = dbConn.getNextString();
			logger.info("mhiAcctcls: "+mhiAcctcls);
		}

		if (!dbConn.isEndOfStream()) {
			map1InstrClassify = dbConn.getNextString();
			logger.info("map1InstrClassify: "+map1InstrClassify);
		}

		if (!dbConn.isEndOfStream()) {
			map1IssueType = dbConn.getNextString();
			logger.info("map1IssueType: "+map1IssueType);
		}
		
		if (mhiAcctcls==null ||"".equals(mhiAcctcls)){

			for(SegmentId segId:segIdsISCL){
				
				if("MHACTCLS".equals(msg.getStringField("INDUS_CL_SET_ID", segId)))	
					{
					
					mhiAcctcls=msg.getStringField("CL_VALUE", segId);
					logger.info("mhiAcctcls from msg: " + mhiAcctcls);
					break;
				}
			}
		}

		// Exit if not in a SOI group

		if (!"Y".equals(soiMember))
		{
			logger.info("Exiting from rule as instrument is not in any SOI.");
			return true;
		}
		if (("".equals(map1InstrClassify)) || (map1InstrClassify == null))
		{
			logger.info("Exiting from rule as instrument type not mapped to BOND or EQUITY");
			return true;
		}
		if ("EQUITY".equals(map1InstrClassify))
			getSettleCodeForEquity(dbConn, msg, instrId, issuerName, bbissType, isinId);
		if ("BOND".equals(map1InstrClassify))
			getSettleCodeForBond(dbConn, msg, instrId, mhiAcctcls, wsolxidnId, denomCurrency, isinId, bbissType, bbMktSct, bbIndSec, bbIndsGr, mhscbdcl, mhscstlg, issuIssType);
		logger.info("CJavaMHIDeriveSettleCodes finished.");
		return true;
	}

	public void getSettleCodeForEquity(DatabaseAccess dbConn, XMLMessage msg, String instrId, String issuerName, String bbissType, String isinId)
	{
	
		List<String> mktOidArrayList = new ArrayList<String>();
		List<String> mktGeoUnitArrayList = new ArrayList<String>();
	
		logger.info("This instrument is classified as EQUITY");
		getMktOids(dbConn, msg, instrId, mktOidArrayList, mktGeoUnitArrayList);
		for (int i = 0 ; i < mktOidArrayList.size(); i++) {
			String thisMktOid = mktOidArrayList.get(i);
			String thisGeoUnit = mktGeoUnitArrayList.get(i);
			
			String mic_code=getMICCode(dbConn,thisMktOid);
			
			if(mic_code!=null && !"".equals(mic_code) && "XSSC|XSEC".contains(mic_code)){
				
				if("XSSC".equals(mic_code)){
					createSettleCodeIdentifier(msg, instrId, thisMktOid, "C3EQ");
				}
				else if("XSEC".equals(mic_code)){
					createSettleCodeIdentifier(msg, instrId, thisMktOid, "C4EQ");
				}
			}
			
			else if ( ("Fund of Funds".equals(bbissType) || "ETP".equals(bbissType)) && "IE".equals(isinId.substring(0,2))) {
				// create identifier wih ID = "EURO"
				logger.info("BBISSTYPE is " + bbissType + "  and ISIN starts with IE " + isinId + " Hence settlecode is EURO");
				createSettleCodeIdentifier(msg, instrId, thisMktOid, "EURO");
			}
			else
			{
				// Java 6 substring paramters are start position and length
				String mktSettleCode = thisGeoUnit.substring(0,2) + "EQ";
				createSettleCodeIdentifier(msg, instrId, thisMktOid, mktSettleCode);				
			}
		}
		
	}


	private String getMICCode(DatabaseAccess dbConn, String mktOid) {
		// TODO Auto-generated method stub
		
		String micSql="Select mkt_id from ft_t_mkid where mkt_oid=:1<char[11]> and mkt_id_ctxt_typ='MIC'";
		logger.info("Get MIC SQL is " + micSql);
		
		try {
			dbConn.setSQL(micSql);
			dbConn.addParameter(mktOid);
			dbConn.execute();
		} catch (Exception e) {
			
			e.printStackTrace();
			logger.info("Exception in executing: "+micSql);
		}
		
		//String mic = dbConn.getNextString(); causing index out of bound execption
		
		String mic = "";
		
		if (!dbConn.isEndOfStream()) {
			mic = dbConn.getNextString();
			logger.info("Mic Code: "+mic);
		}
		
		return mic;
	}

	public void getSettleCodeForBond(DatabaseAccess dbConn,
			XMLMessage msg,
			String instrId,
			String mhiAcctcls,
			String wsolxidnId,
			String denomCurrency,
			String isinId,
			String bbissType,
			String bbMktSct,
			String bbIndSec,
			String bbIndsGr,
			String mhscbdcl,
			String mhscstlg,
		 	String issuIssType)
	{
		List<String> mktOidArrayList = new ArrayList<String>();
		List<String> mktGeoUnitArrayList = new ArrayList<String>();

		logger.info("Beginning of getSettleCodeForBond");
		logger.info("... SPT ...");

		getBondMktOids(dbConn, msg, instrId, mktOidArrayList, mktGeoUnitArrayList);
		logger.info("After call to getBondMktOids");
		logger.info("Size of mktOidArrayList is " + mktOidArrayList.size() );
		String bondSettleCode = "";
		String isinPrefix = "";
		if (!"".equals(isinId) && isinId != null) {
			isinPrefix = isinId.substring(0, 2);
		}
		else {
			isinPrefix = "";
		}

		// SETTLECODE for loans
		if (!"".equals(wsolxidnId) && wsolxidnId != null) {
			// Condition 2. If this is a Loan (i.e., WSOLXIDN has a value) then use 'denomination currency' values and set the Settle Code accordingly.
			logger.info("Found WSOLXNID = " + wsolxidnId);
			if ("EUR".equals(denomCurrency))
			{
				logger.info("Set up settle code for currency = EUR,  CODE = AFBD");
				bondSettleCode = "AFBD";
			}else if("GBP".equals(denomCurrency))
			{
				logger.info("Set up settle code for currency = GBP CODE = AGBD");
				bondSettleCode = "AGBD";
			}else if("USD".equals(denomCurrency))
			{
				logger.info("Set up settle code for currency = USD CODE = AIBD");
				bondSettleCode = "AIBD";
			}else if("ZAR".equals(denomCurrency))
			{
				logger.info("Set up settle code for currency = ZAR CODE = ALBD");
				bondSettleCode = "ALBD";
			}else if("NOK".equals(denomCurrency))
			{
				logger.info("Set up settle code for currency = NOK CODE = AMBD");
				bondSettleCode = "AMBD";
			}else {
				logger.info("Unable to set up loans SETTLECODE as currency " + denomCurrency + " is not in expected list");
			}
		}
		//End of SETTLECODE for loans

		//Start of SETTLECODE for Minerva Domestic Bonds
		logger.info("Start of SETTLECODE for Minerva Domestic Bonds");
		logger.info("bondSettleCode = " + bondSettleCode);
		if( "".equals(bondSettleCode) || bondSettleCode == null ) {
			logger.info("check for DMB...");
			if ("DMB".equals(mhscbdcl)) { // Minerva Domestic Bond
				logger.info("Bond is a Minerva Domstic Bond");
				if("1".equals(mhscstlg)) {
					bondSettleCode = "JPGV";
					logger.info("Set bondSettleCode to " + bondSettleCode);
				} else if("2".equals(mhscstlg) || "4".equals(mhscstlg) || "6".equals(mhscstlg)) {
					bondSettleCode = "JPCD";
					logger.info("Set bondSettleCode to " + bondSettleCode);
				}else {
					bondSettleCode = "JPHY";
					logger.info("Set bondSettleCode to " + bondSettleCode);
				}
			} else
				logger.info("Bond is NOT a Minerva Domstic Bond");
		}
		logger.info("End of SETTLECODE for Minerva Domestic Bonds");
		//End of SETTLECODE for Minerva Domestic Bonds
		logger.info("After Minerva Domestic Bonds");
		logger.info("mhscbdcl = " + mhscbdcl);
		logger.info("mhscstlg = " + mhscstlg);
		logger.info("bondSettleCode = " + bondSettleCode);


		//Missing ISIN condition
		if( "".equals(bondSettleCode) || bondSettleCode == null ) {
			// Check ISINs
			if ("".equals(isinId) || isinId == null) {
				// Condition 3. if this is not a Loan and ISIN has no value then set the Settle Code to 'EURO'
				logger.info("No Isin is found, so SETTLECODE = EURO");
				bondSettleCode = "EURO";
			}
		}
		//End of Missing ISIN condition

		//ISIN starting with XS/LU/EU/JE condition
		if( "".equals(bondSettleCode) || bondSettleCode == null) {

			if ("XS|LU|EU|JE".contains(isinPrefix)) {
				// ISIN prefix is XS or LU or EU or JE
				// Condition 4. If the ISIN code starts with either 'XS' or 'LU' or 'EU' or 'JE' then set the Settle Code to 'EURO'
				logger.info("Isin prefix " + isinPrefix + " is one of XS,LU,EU,JE , so SETTLECODE = EURO");
				bondSettleCode = "EURO";
			}
		}
		//End of ISIN starting with XS/LU/EU/JE condition

		//ISIN + Currency mismatch check
		if("".equals(bondSettleCode) || bondSettleCode == null) {
			if ( ("JP".contains(isinPrefix) && !"JPY".equals(denomCurrency)) || ("GB".contains(isinPrefix) && !"GBP".equals(denomCurrency))
					|| ("US".contains(isinPrefix) && !"USD".equals(denomCurrency)) ) {
				logger.info("ISIN starts with " + isinPrefix + " and currency is " + denomCurrency);
				bondSettleCode = "EURO";
			}
		}
		//End of ISIN + Currency mismatch check

		//ISIN starting with JP
		if( ("".equals(bondSettleCode) || bondSettleCode == null) && "JP".contains(isinPrefix) )
		{
			// ISIN prefix is JP or US
			logger.info("Isin prefix " + isinPrefix + " is one of JP");
			logger.info("check bbIndSec: " + bbIndSec);
			if ("Government".equals(bbIndSec) && ("Sovereign".equals(bbIndsGr) || "Sovereign Agency".equals(bbIndsGr))) {
				logger.info("MHI Account Classification: " + mhiAcctcls);
				if ("JBON|JGGB".contains(mhiAcctcls))
					bondSettleCode = "JPCD";
				else
					bondSettleCode = "JPGV";

				logger.info("Settle code is " + bondSettleCode);
			}
			else
			{
		         //  if ("CVTBOND".equals(issuIssType.substring(0,7))) 
					 
				if (issuIssType != null && issuIssType.startsWith("CVTBOND")) {
					bondSettleCode = "JPBD";
					logger.info("Issue Type is " + issuIssType + ". So settle code is " + bondSettleCode);
				} else {
					bondSettleCode = "JPCD";
					logger.info("Issue Type is " + issuIssType + ". So settle code is " + bondSettleCode);
				}
			}
		}
		//End of ISIN starting with JP

		//ISIN starting with US
		if( ("".equals(bondSettleCode) || bondSettleCode == null) && "US".contains(isinPrefix) ) {
			if( ("US9127".equals(isinId.substring(0,6))) || ("US9128".equals(isinId.substring(0,6))) )
				bondSettleCode = "USGV";
			else
				bondSettleCode = "USBD";
			logger.info("ISIN starts with " + isinId.substring(0,6) + ".  Hence SettleCode is " + bondSettleCode);
		}
		//End of ISIN starting with US

		//Final Condition
		if("".equals(bondSettleCode) || bondSettleCode == null ) {
			if ("Government".equals(bbIndSec) && ("Sovereign".equals(bbIndsGr) || "Sovereign Agency".equals(bbIndsGr)))
					bondSettleCode = isinPrefix + "GV";
				else
					bondSettleCode = isinPrefix + "BD";

				logger.info("Settle code is " + bondSettleCode);
		}
		//End of Final Condition

		//Default Settle Code
		if ("".equals(bondSettleCode) || bondSettleCode == null) {
			logger.info("setting default settleCode = EURO");
			bondSettleCode = "EURO";
		}

		//Settle Code for bond is not dependent on listing details.  Hence add the same SettleCode for all listings
		for (int i = 0 ; i < mktOidArrayList.size(); i++)
		{
			String thisMktOid = mktOidArrayList.get(i);
			String thisGeoUnit = mktGeoUnitArrayList.get(i);
			logger.info("Add BOND SETTLECODE for MKT_OID = " + thisMktOid + " for ISIN prefix = " + isinPrefix);
			createSettleCodeIdentifier(msg, instrId, thisMktOid, bondSettleCode);
		}

		logger.info("END of getSettleCodeForBond");
	}

	boolean checkSettleCodeExists(DatabaseAccess dbConn, String instrId, String checkMktOid)
	{
		logger.info("checkSettleCodeExists Check if there is already a settle code present for mkt_oid = " + checkMktOid);
		String checkExistingMktOidSql = "select iss_id from FT_T_ISID where (end_tms is null or end_tms > sysdate()) and ID_CTXT_TYP = 'SETTLECODE' and instr_id = '" + instrId + "'" + 
				" and mkt_oid = '" + checkMktOid + "'";	
		logger.info("checkExistingMktOidSql: " + checkExistingMktOidSql);
		dbConn.setSQL(checkExistingMktOidSql);
		dbConn.execute();
        
		String settleCodeExists="";
		 if (!dbConn.isEndOfStream()) {
					settleCodeExists = dbConn.getNextString();
			} 
		 
		//String settleCodeExists = dbConn.getNextString();  causing index out of bound exception
		if ((!"".equals(settleCodeExists)) && (settleCodeExists != null))
		{
			logger.info("checkSettleCodeExists settle code " + settleCodeExists + " exists for mkt_oid = " + checkMktOid);
			return true;
		}
		else
		{
			logger.info("checkSettleCodeExists settle code does not exist for mkt_oid = " + checkMktOid);
			return false;					
		}
	}
	
	void getMktOids(DatabaseAccess dbConn, XMLMessage msg, String instrId, List<String> mktOidArrayList, List<String> mktGuArrayList)
	{
		List<String> uncheckedMktOidArrayList = new ArrayList<String>();
		String mktOidSql = "select distinct mkt_oid from ft_t_isid where INSTR_ID = '" + instrId + "' and MKT_OID is not null and ID_CTXT_TYP = 'MHILIST'";
		logger.info("getMktOids - Get MKT_OIDs SQL is " + mktOidSql);
	
		dbConn.setSQL(mktOidSql);
		dbConn.execute();
	
	     
				String newMktOid = null;
				 if (!dbConn.isEndOfStream()) {
							newMktOid = dbConn.getNextString();
					} 
	
		//String newMktOid = dbConn.getNextString();
	
		if(!(newMktOid == null)) {

			while (!(newMktOid == null)) {
				newMktOid = newMktOid.trim();
				logger.info("getMktOids - This MKT_OID = >" + newMktOid + "<");

				uncheckedMktOidArrayList.add(newMktOid);
				
				if (!dbConn.isEndOfStream()) {
					newMktOid = dbConn.getNextString();
				} else
				{
					newMktOid = null;
				}				
				//newMktOid = dbConn.getNextString(); This line of code causing indexOutOfBounds error
			}
		} else
		{
			logger.info("MHILIST id not found on DB.  Checking the same in the message");
			for (int i=0; i<msg.getSegmentCount(); i++)
			{
				SegmentId segId = new SegmentId(i);
				if (msg.getSegmentType(segId).equals("IssueIdentifier"))
				{
					String idTyp = msg.getStringField("ID_CTXT_TYP", segId);
					if("MHILIST".equals(idTyp))
					{
						String idMhilist = msg.getStringField("ISS_ID", segId);
						String strMktOid = msg.getStringField("MKT_OID", segId);
						logger.info("Found MHILIST ID - " + idMhilist + " and adding MKT_OID  " + strMktOid + "  to array");
						uncheckedMktOidArrayList.add(strMktOid);
					}
				}
			}

		}

		logger.info("getMktOids - mktOidArrayList.size() is " + uncheckedMktOidArrayList.size());
		for ( String thisMktOid : uncheckedMktOidArrayList)
		{
			if (checkSettleCodeExists(dbConn, instrId, thisMktOid) && !re_derive)
			{
				logger.info("getMktOids - A settlecode exists for mkt_oid = " + thisMktOid);
				logger.info("getMktOids - no further action for this market");
			}
			else {
				logger.info("getMktOids - No settlecode exists for mkt_oid = " + thisMktOid);
				String guIdSql = "select gu_id from ft_t_mrkt where gu_typ = 'COUNTRY' and mkt_oid = '" + thisMktOid + "'";
				dbConn.setSQL(guIdSql);
				dbConn.execute();
				
				String thisMktGuId="";
				 if (!dbConn.isEndOfStream()) {
							thisMktGuId = dbConn.getNextString();
					} 
			
			//	String thisMktGuId = dbConn.getNextString();
			
				logger.info("getMktOids - gu_id for market is " + thisMktGuId);
				if (("".equals(thisMktGuId)) || (thisMktGuId == null))
				{
					logger.info("getMktOids - No GU_ID for market, so cannot add SETTLECODE");
				}
				else
				{
					logger.info("getMktOids - GU_ID exists for market. Add MKT_OID = " + thisMktOid + " and GU_ID = " + thisMktGuId + " to arraylists");
					mktOidArrayList.add(thisMktOid);
					String newGuId = thisMktGuId.trim();
					mktGuArrayList.add(newGuId);
				}

			}
		}

		logger.info("getMktOids - At end of method getMktOids");
		logger.info("getMktOids - uncheckedMktOidArrayList = " + uncheckedMktOidArrayList.toString());
		logger.info("getMktOids - uncheckedMktOidArrayList size = " + uncheckedMktOidArrayList.size());
		logger.info("getMktOids - mktOidArrayList = " + mktOidArrayList.toString());
		logger.info("getMktOids - mktOidArrayList size = " + mktOidArrayList.size());
		logger.info("getMktOids - mktGuArrayList = " + mktGuArrayList.toString());
		logger.info("getMktOids - mktGuArrayList size = "+ mktGuArrayList.size());
		
	}

	void getBondMktOids(DatabaseAccess dbConn, XMLMessage msg, String instrId, List<String> mktOidArrayList, List<String> mktGuArrayList)
	{
		List<String> uncheckedMktOidArrayList = new ArrayList<String>();
		String mktOidSql = "select distinct mkt_oid from ft_t_isid where INSTR_ID = '" + instrId + "' and MKT_OID is not null and ID_CTXT_TYP = 'MHILIST'";
		logger.info("getBondMktOids - Get MKT_OIDs SQL is " + mktOidSql);
	
		dbConn.setSQL(mktOidSql);
		dbConn.execute();
	
	
			   String newMktOid = null;
			  if (!dbConn.isEndOfStream()) {
						newMktOid = dbConn.getNextString();
				} 
			
		//String newMktOid = dbConn.getNextString();
	
		if(!(newMktOid == null)) {

			while (!(newMktOid == null)) {
				newMktOid = newMktOid.trim();
				logger.info("getBondMktOids - This MKT_OID = >" + newMktOid + "<");
				uncheckedMktOidArrayList.add(newMktOid);
				
				if (!dbConn.isEndOfStream()) {
					newMktOid = dbConn.getNextString();
				} else
				{
					newMktOid = null;
				}				
				//newMktOid = dbConn.getNextString(); This line of code causing indexOutOfBounds error
			}
		} else
		{
			logger.info("MHILIST id not found on DB.  Checking the same in the message");
			for (int i=0; i<msg.getSegmentCount(); i++)
			{
				SegmentId segId = new SegmentId(i);
				if (msg.getSegmentType(segId).equals("IssueIdentifier"))
				{
					String idTyp = msg.getStringField("ID_CTXT_TYP", segId);
					if("MHILIST".equals(idTyp))
					{
						String idMhilist = msg.getStringField("ISS_ID", segId);
						String strMktOid = msg.getStringField("MKT_OID", segId);
						logger.info("Found MHILIST ID - " + idMhilist + " and adding MKT_OID  " + strMktOid + "  to array");
						uncheckedMktOidArrayList.add(strMktOid);
					}
				}
			}

		}

		logger.info("getBondMktOids - mktOidArrayList.size() is " + uncheckedMktOidArrayList.size());
		for ( String thisMktOid : uncheckedMktOidArrayList)
		{
			if (checkSettleCodeExists(dbConn, instrId, thisMktOid) && !re_derive)
			{
				logger.info("getBondMktOids - A settlecode exists for mkt_oid = " + thisMktOid);
				logger.info("getBondMktOids - no further action for this market");
			}
			else {
				logger.info("getBondMktOids - No settlecode exists for mkt_oid = " + thisMktOid);
				String guIdSql = "select gu_id from ft_t_mrkt where mkt_oid = '" + thisMktOid + "'";
				dbConn.setSQL(guIdSql);
				dbConn.execute();
				
					String thisMktGuId="";
					 if (!dbConn.isEndOfStream()) {
								thisMktGuId = dbConn.getNextString();
						} 
				
				//String thisMktGuId = dbConn.getNextString();
				
				logger.info("getBondMktOids - (country not necessary for Bonds) gu_id for market is " + thisMktGuId);
				if (("".equals(thisMktGuId)) || (thisMktGuId == null))
				{
					logger.info("getBondMktOids - No GU_ID for market, so cannot add SETTLECODE");
				}
				else
				{
					logger.info("getBondMktOids - GU_ID exists for market. Add MKT_OID = " + thisMktOid + " and GU_ID = " + thisMktGuId + " to arraylists");
					mktOidArrayList.add(thisMktOid);
					String newGuId = thisMktGuId.trim();
					mktGuArrayList.add(newGuId);
				}

			}
		}

		logger.info("getBondMktOids - At end of method getBondMktOids");
		logger.info("getBondMktOids - uncheckedMktOidArrayList = " + uncheckedMktOidArrayList.toString());
		logger.info("getBondMktOids - uncheckedMktOidArrayList size = " + uncheckedMktOidArrayList.size());
		logger.info("getBondMktOids - mktOidArrayList = " + mktOidArrayList.toString());
		logger.info("getBondMktOids - mktOidArrayList size = " + mktOidArrayList.size());
		logger.info("getBondMktOids - mktGuArrayList = " + mktGuArrayList.toString());
		logger.info("getBondMktOids - mktGuArrayList size = "+ mktGuArrayList.size());
		
	}

	
	public void createSettleCodeIdentifier(XMLMessage msg, String instrId, String thisMktOid, String settleCode) {
		logger.info("***** createSettleCodeIdentifier Create SETTLECODE = " + settleCode + " for MKT_OID = " + thisMktOid);
		
		logger.info("Add a segment for MKT_OID: " + thisMktOid + " settleCode: " + settleCode);
		SegmentId isidSegment = msg.addSegment(XMLMessage.A_UNKNOWN,"IssueIdentifier");
		msg.setSegmentAttribute(isidSegment, "SEGPROCESSEDIND", "N");
		msg.addField("ID_CTXT_TYP", isidSegment, "SETTLECODE");
		msg.addField("ISS_ID", isidSegment, settleCode);
		msg.addField("MKT_OID",  isidSegment, thisMktOid);
		msg.addField("ISS_USAGE_TYP",  isidSegment, instrId);
		msg.setSegmentAttribute(isidSegment, "MATCH", "ISID7_INSTR_CTX_MKT_USG");
		logger.info(" - createSettleCodeIdentifier - after adding segment");
	//	logger.info("msg is " + msg.getXMLString());

	}
	
	public List<SegmentId> getSegmentIds(String segType, XMLMessage msg) {
		List<SegmentId> segIdList = new ArrayList<SegmentId>();
		for (int i = 0; i < msg.getSegmentCount(); i++) {
			SegmentId segId = new SegmentId(i);
			if (msg.getSegmentType(segId).equals(segType)) {
				segIdList.add(segId);
			}
		}
		return segIdList;
	}	

}
