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


public class CJavaMHIRemoveOldDeliveryType implements JavaRule
{
	private final static Logger logger = Logger.getLogger(CJavaMHIRemoveOldDeliveryType.class);
	String[] rissParams;

	public boolean initialize(String[] params)
	{
		logger.info("Initializing CJavaMHIRemoveOldUseOfProceeds Rule");
		return true;
	}

	public boolean process(XMLMessage xml, DatabaseObjectContainer dbObj, ProcessorContext pCon, DatabaseAccess dbConn, NotificationCreator notfcn) throws GSException
	{
		// This rule is called at FINAL with B (before) process mode
		
		if(logger.isInfoEnabled())
			logger.info("CJavaMHIRemoveOldUseOfProceeds.process()");

		// Exit if MAIN_ENTITY_TBL_TYP != ISSU
		String mainEntityTblTyp = xml.getStringField("MAIN_ENTITY_TBL_TYP", new SegmentId(0));
		
		if(null == mainEntityTblTyp || !"ISSU".equalsIgnoreCase(mainEntityTblTyp)){
			logger.info("mainEntityTblTyp: " + mainEntityTblTyp + ". Exiting");
			return true;
		}
		
		// Exit when message comes from the UI
		String msgClassification = xml.getStringField("MSG_CLASSIFICATION", new SegmentId(0));
		logger.info("found MSG_CLASSIFICATION: " + msgClassification);
		if("WEBMSG".equalsIgnoreCase(msgClassification)) {
			logger.info("MSG_CLASSIFICATION: " + msgClassification + ". Exiting");
			return true;	
		}
		
		// get ID and CTXT_TYP of the processed instrument
		String mainEntityId  = xml.getStringField("MAIN_ENTITY_ID", new SegmentId(0));
		logger.info("mainEntityId: " + mainEntityId);
		
		String mainEntityIdCtxTyp  = xml.getStringField("MAIN_ENTITY_ID_CTXT_TYP", new SegmentId(0));
		logger.info("mainEntityIdCtxTyp: " + mainEntityIdCtxTyp);

	
		// This rule is intended to end-date Issue Comment where ISCM.CMNT_REAS_TYP = 'DLTYPLST' and the text is not found in the current message

		// get segment count before adding any new segments 
		// otherwise the code will pick up the new segments added later in this rule
		// and keep iterating too far
		
		ArrayList<String> incomingValues = new ArrayList<String>();
		int segmentCount = xml.getSegmentCount();
		logger.info("Segment count is " + segmentCount);
	
	 if(logger.isDebugEnabled())
       logger.debug("xml: " + xml.getXMLString());
		
		// go through all segments and process IssueComment segments
		for(int i=0; i < segmentCount; i++) {
			SegmentId segId = new SegmentId(i);
			String segType = xml.getSegmentType(segId);
			String segAction = xml.getAction(segId);

			logger.info("Segment number " + i + ", segType: " + segType + ", segAction: " + segAction);

			//if ("IssueComment".equals(segType) && "UNKNOWN".equals(segAction)) {
			if ("IssueComment".equals(segType)) {
				logger.info("Found a segment called " + segType);
				String keyField = xml.getStringField("CMNT_REAS_TYP", segId);
				logger.info("Found CMNT_REAS_TYP = " + keyField);
				if(null == keyField) {
					logger.info("Skip segment as no CMNT_REAS_TYP found");
				}
				if (!"DLTYPLST".equals(keyField)) {
					logger.info("Skip segment as CMNT_REAS_TYP != DLTYPLST");

				}
				String inputTxt = xml.getStringField("CMNT_TXT", segId);
				logger.info("Found CMNT_TXT = " + inputTxt);
				if(null == inputTxt) {
					logger.info("Skip segment as no CMNT_TXT found");
				}
				else {
					if ("DLTYPLST".equals(keyField)) {
						logger.info("Add to list of inputTxt : " + inputTxt);
						incomingValues.add(inputTxt);
					}
				}
			} // segment name
		}
		logger.info("The list of incomingValues is " + incomingValues);
		if (incomingValues.size() == 0) {
			logger.info("No values were found. Exiting");
			return true;
		}
		// make lists of input value separeted by comma
		String retainString = "";
		for (int i = 0 ; i< incomingValues.size(); i++) {
			if (i==0)
				retainString = "'" + incomingValues.get(i) + "'";
			else
				retainString = retainString + ",'" + incomingValues.get(i) + "'";
		}
		
		String getInstrIdSQL = "SELECT INSTR_ID FROM FT_T_ISID WHERE ISS_ID = '" + mainEntityId + "' AND ID_CTXT_TYP = '" + mainEntityIdCtxTyp + "' AND END_TMS IS NULL";
		logger.info("getInstrIdSQL is " + getInstrIdSQL);
		String instrId="";
		dbConn.setSQL(getInstrIdSQL);
		dbConn.execute();

		if (!dbConn.isEndOfStream())
		{
			instrId = dbConn.getNextString();
			logger.info("d/b - instrId: " + instrId);
		}
		if (instrId == null) {
			logger.info("Cannot find InstrId, exiting");
			return true;
		}
		String getOldOidsSQL = "SELECT ISCM.ISCM_OID FROM FT_T_ISCM ISCM WHERE ISCM.CMNT_REAS_TYP='DLTYPLST' AND ISCM.CMNT_TXT NOT IN (" + retainString + ") " +
		"AND EXISTS (SELECT 1 FROM FT_T_ISID ISID WHERE ISID.INSTR_ID = ISCM.INSTR_ID AND ISID.END_TMS IS NULL " +
		"AND ISID.ISS_ID = '" + mainEntityId + "' AND ISID.ID_CTXT_TYP = '" + mainEntityIdCtxTyp + "')"; 
		logger.info("getOldOidsSQL is " + getOldOidsSQL);

		dbConn.setSQL(getOldOidsSQL);
		dbConn.execute();
		logger.info("Adding ISCM segments ACTION PHYDELETE");
		while(!dbConn.isEndOfStream())
		{
			String removeOid = dbConn.getNextString();
			logger.info("Remove Oid is " + removeOid);

			SegmentId TgtSegment = xml.addSegment(XMLMessage.A_D_PHYDELETE,"IssueComment");
			xml.setSegmentAttribute(TgtSegment, "SEGPROCESSEDIND", "N");

			// add fields to segment
			xml.addField("INSTR_ID", TgtSegment, instrId);
			xml.addField("ISCM_OID", TgtSegment, removeOid);

			logger.info("Add Segment: " + TgtSegment);
		}
		logger.info("After adding segments");
	
         if(logger.isDebugEnabled())
            logger.debug("xml: " + xml.getXMLString());

		logger.info("Exiting rule");
		return true;
	}
	
}
