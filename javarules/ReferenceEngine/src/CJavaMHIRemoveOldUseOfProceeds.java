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


public class CJavaMHIRemoveOldUseOfProceeds implements JavaRule
{
	private final static Logger logger = Logger.getLogger(CJavaMHIRemoveOldUseOfProceeds.class);
	String[] rissParams;

	public boolean initialize(String[] params)
	{
		logger.info("Initializing CJavaMHIRemoveOldUseOfProceeds Rule");
		return true;
	}

	public boolean process(XMLMessage xml, DatabaseObjectContainer dbObj, ProcessorContext pCon, DatabaseAccess dbConn, NotificationCreator notfcn) throws GSException
	{

		if(logger.isInfoEnabled())
			logger.info("CJavaMHIRemoveOldUseOfProceeds.process()");


		String mainEntityTblTyp = xml.getStringField("MAIN_ENTITY_TBL_TYP", new SegmentId(0));

		String mainEntityId  = xml.getStringField("MAIN_ENTITY_ID", new SegmentId(0));
		logger.info("mainEntityId: " + mainEntityId);
		
		String mainEntityIdCtxTyp  = xml.getStringField("MAIN_ENTITY_ID_CTXT_TYP", new SegmentId(0));
		logger.info("mainEntityIdCtxTyp: " + mainEntityIdCtxTyp);

		if(null == mainEntityTblTyp || !"ISSU".equalsIgnoreCase(mainEntityTblTyp)){
			logger.info("mainEntityTblTyp: " + mainEntityTblTyp + ". Exiting");
			return true;
		}
		// Do not manage classifications when message comes from the UI
		String msgClassification = xml.getStringField("MSG_CLASSIFICATION", new SegmentId(0));
		logger.info("found MSG_CLASSIFICATION: " + msgClassification);
		if("WEBMSG".equalsIgnoreCase(msgClassification)) {
			logger.info("MSG_CLASSIFICATION: " + msgClassification + ". Exiting");
			return true;	
		}
		
		// This rule is intended to end-date  any Issue Classifications where INDUS_CL_SET_ID = 'USEOFPRO' and the classification is not found in the current message

		// get segment count before adding any new segments 
		// otherwise the code will pick up the new segments added later in this rule
		// and keep iterating too far
		
		ArrayList<String> clValues = new ArrayList<String>();
		int segmentCount = xml.getSegmentCount();
		logger.info("Segment count is " + segmentCount);
		
		 if(logger.isDebugEnabled())
            logger.debug("xml: " + xml.getXMLString());
		
		for(int i=0; i < segmentCount; i++) {
			SegmentId segId = new SegmentId(i);
			String segType = xml.getSegmentType(segId);
			String segAction = xml.getAction(segId);

			logger.info("Segment number " + i + ", segType: " + segType + ", segAction: " + segAction);

			//if ("IssueClassification".equals(segType) && "UNKNOWN".equals(segAction)) {
			if ("IssueClassification".equals(segType)) {
				logger.info("Found a segment called " + segType);
				String indClSetId = xml.getStringField("INDUS_CL_SET_ID", segId);
				logger.info("Found INDUS_CL_SET_ID = " + indClSetId);
				if(null == indClSetId) {
					logger.info("Skip segment as no INDUS_CL_SET_ID found");
				}
				if (!"USEOFPRO".equals(indClSetId)) {
					logger.info("Skip segment as INDUS_CL_SET_ID != USEOFPRO");

				}
				String clValue = xml.getStringField("CL_VALUE", segId);
				logger.info("Found CL_VALUE = " + clValue);
				if(null == clValue) {
					logger.info("Skip segment as no CL_VALUE found");
				}
				else {
					if ("USEOFPRO".equals(indClSetId)) {
						logger.info("Add to list of cl_values : " + clValue );
						clValues.add(clValue);
					}
				}
			} // segment name
		}
		logger.info("The list of clValues is " + clValues);
		if (clValues.size() == 0) {
			logger.info("No values were found. Exiting");
			return true;
		}
		String retainString = "";
		for (int i = 0 ; i< clValues.size(); i++) {
			if (i==0)
				retainString = "'" + clValues.get(i) + "'";
			else
				retainString = retainString + ",'" + clValues.get(i) + "'";
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
		String getOldOidsSQL = "SELECT ISS_CLSF_OID FROM FT_T_ISCL WHERE INDUS_CL_SET_ID = 'USEOFPRO' AND CL_VALUE NOT IN (" + retainString + ") AND END_TMS IS NULL " +
				 "AND INSTR_ID IN (SELECT INSTR_ID FROM FT_T_ISID WHERE ISS_ID = '" + mainEntityId + "' AND ID_CTXT_TYP = '" + mainEntityIdCtxTyp + "' AND END_TMS IS NULL) " +
				 "AND 'ISS_CLSF_OID=' || ISS_CLSF_OID || ';' NOT IN (SELECT OVR_TBL_KEY_TXT FROM FT_T_OVRC WHERE OVR_REF_TYP = 'ISSU' AND END_TMS IS NULL)";
		logger.info("getOldOidsSQL is " + getOldOidsSQL);

		dbConn.setSQL(getOldOidsSQL);
		dbConn.execute();
		logger.info("Before adding segments");
		while(!dbConn.isEndOfStream())
		{
			String removeOid = dbConn.getNextString();
			logger.info("Remove issClsfOid is " + removeOid);

			SegmentId isclSegment = xml.addSegment(XMLMessage.A_D_DELETE,"IssueClassification");
			xml.setSegmentAttribute(isclSegment, "SEGPROCESSEDIND", "N");

			// add fields to segment
			xml.addField("INSTR_ID", isclSegment, instrId);
			xml.addField("ISS_CLSF_OID", isclSegment, removeOid);

			logger.info("Add Segment: " + isclSegment);
		}
		logger.info("After adding segments");
		
		 if(logger.isDebugEnabled())
            logger.debug("xml: " + xml.getXMLString());
   
		logger.info("Exiting rule");
		return true;
	}
	
}
