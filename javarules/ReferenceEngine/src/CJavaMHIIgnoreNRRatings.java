import org.apache.log4j.Logger;

import com.thegoldensource.jbre.DatabaseAccess;
import com.thegoldensource.jbre.DatabaseObjectContainer;
import com.thegoldensource.jbre.GSException;
import com.thegoldensource.jbre.JavaRule;
import com.thegoldensource.jbre.NotificationCreator;
import com.thegoldensource.jbre.ProcessorContext;
import com.thegoldensource.jbre.SegmentId;
import com.thegoldensource.jbre.XMLMessage;

import java.util.ArrayList;
import java.util.List;


public class CJavaMHIIgnoreNRRatings implements JavaRule {

	private static List<String> IgnoreRatingDataSrcList = new ArrayList<String>();
	private static List<String> IgnoreRatingSetOidList = new ArrayList<String>();
	private static String IgnoreRatingSetString = "";
	private static String IgnoreRatingSetSql = "";
	private static Logger logger = Logger.getLogger("CJavaMHIIgnoreNRRatings");

	public boolean initialize(String[] parameters) {
		logger.info("Initialize Java rule CJavaMHIIgnoreNRRatings Rule");
		for(String s: parameters[0].split(","))
		{
			IgnoreRatingDataSrcList.add(s);
		}
		logger.info("IgnoreRatingDataSrcList: " + IgnoreRatingDataSrcList);

		return true;
	}

	public boolean process(XMLMessage msg, DatabaseObjectContainer dboc,
			ProcessorContext pContext, DatabaseAccess dbConnection,
			NotificationCreator notificationCreator)
			throws GSException {
		
		logger.info("Processing Java rule CJavaMHIIgnoreNRRatings Rule");
		
		String dataSrcId = msg.getStringField("DATA_SRC_ID", new SegmentId(0));
		
		if (logger.isInfoEnabled())
			logger.info("dataSrcId: " + dataSrcId);

		// Initialise (only once) the list of Rating Set OIDs to be ignored
		// This is the set of OIDs for internal ratings 
		if ("".equals(IgnoreRatingSetString) || IgnoreRatingSetString == null)
		{
			logger.info("load ignrore rating OIDs from FT_T_RTNG");
			for (int i = 0; i < IgnoreRatingDataSrcList.size(); i++)
			{
				if ("".equals(IgnoreRatingSetString) || IgnoreRatingSetString == null)
					IgnoreRatingSetString = "'" + IgnoreRatingDataSrcList.get(i) + "'";
				else
					IgnoreRatingSetString = IgnoreRatingSetString + "," + "'" + IgnoreRatingDataSrcList.get(i) + "'";				
			}
			logger.info("IgnoreRatingSetString = " + IgnoreRatingSetString);
			try {
				IgnoreRatingSetSql = "select RTNG_SET_OID from FT_T_RTNG where DATA_SRC_ID in (" + IgnoreRatingSetString + ")";
				dbConnection.setSQL(IgnoreRatingSetSql);
				logger.info("IgnoreRatingSetSql = " + IgnoreRatingSetSql);
				dbConnection.execute();
				while (!dbConnection.isEndOfStream())
				{
					String thisOid = dbConnection.getNextString();
					IgnoreRatingSetOidList.add(thisOid.trim());
				}	      
			} catch (Exception e) {	
				e.printStackTrace();
				logger.info("Exception in executing: "+IgnoreRatingSetSql);
			}
		}
		// show the list of Rating set OIDs to be ignore
		logger.info("IgnoreRatingSetOidList = " + IgnoreRatingSetOidList);

		if ("FITCH".equals(dataSrcId)||"MOODYS_RDS".equals(dataSrcId)||"SNPXF_RT".equals(dataSrcId))
		{
			boolean noRatings = true;
			
			int count = msg.getSegmentCount();
			for(int i=0; i<count; i++)
			{
				SegmentId seg = new SegmentId(i);
				String segName = msg.getSegmentType(seg);
				//String processInd = xmlMsg.getSegmentAttribute(seg, "SEGPROCESSEDIND");
	
				if(logger.isInfoEnabled())
					logger.info("segName :"+segName);
	
				if("IssueRating".equals(segName)||"FinancialInstitutionRating".equals(segName))
				{
					
					String rtngSymbolTxt = msg.getStringField("RTNG_SYMBOL_TXT", seg);
					
					if (logger.isInfoEnabled())
						logger.info("rtngSymbolTxt: " + rtngSymbolTxt);
					
					if (rtngSymbolTxt != null && !rtngSymbolTxt.equals(""))
					{
					
						if (rtngSymbolTxt.length() > 2)
							rtngSymbolTxt = rtngSymbolTxt.substring(0, 2);
						
						if (logger.isInfoEnabled())
							logger.info("rtngSymbolTxt2char: " + rtngSymbolTxt);
						
						if ("NR".equals(rtngSymbolTxt) && !"SNPXF_RT".equals(dataSrcId))
						{
							String rtngSetOid = msg.getStringField("RTNG_SET_OID", seg);
							logger.info("(1) rtngSetOid: " + rtngSetOid);
							if (rtngSetOid == null) {
								logger.info("settling rtngSetOid  to empty string as it is null");
								rtngSetOid = "";
							}
							logger.info("(2) rtngSetOid: " + rtngSetOid);
							// check if Rating set OID is in the ignore list
							if (IgnoreRatingSetOidList.contains(rtngSetOid.trim()))
							{
								logger.info("Basel II rating. Exiting.");
								return true;
							}
									
							msg.setAction(seg, XMLMessage.A_UPDATE);
							msg.setSegmentAttribute(seg, "ERROR", "N");
							msg.setSegmentAttribute(seg, "TSOPTION", "N");
							
						if(logger.isDebugEnabled())
                          logger.debug("xml: " + msg.getXMLString());
					  
					  
						} else
							noRatings = false;
					}
				}
			}
			
			if (logger.isInfoEnabled())
				logger.info("allUnratedFlag: " + noRatings);
				
			
			if (noRatings)
			{
				SegmentId seg = new SegmentId(0);
				msg.setAction(seg, XMLMessage.A_REFERENCE);
				msg.setSegmentAttribute(seg, "ERROR", "N");
				
				if(logger.isDebugEnabled())
                 logger.debug("xml: " + msg.getXMLString());
			}
		}
		return true;
	}

}
