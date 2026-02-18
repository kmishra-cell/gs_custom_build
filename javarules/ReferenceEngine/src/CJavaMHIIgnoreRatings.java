import org.apache.log4j.Logger;

import com.thegoldensource.jbre.DatabaseAccess;
import com.thegoldensource.jbre.DatabaseObjectContainer;
import com.thegoldensource.jbre.GSException;
import com.thegoldensource.jbre.JavaRule;
import com.thegoldensource.jbre.NotificationCreator;
import com.thegoldensource.jbre.ProcessorContext;
import com.thegoldensource.jbre.SegmentId;
import com.thegoldensource.jbre.XMLMessage;


public class CJavaMHIIgnoreRatings implements JavaRule {
	private static Logger logger = Logger.getLogger("CJavaMHIIgnoreRatings");
	private String dataSrc;
	private String rtngDebtClTypes;

	public boolean initialize(String[] parameters) {
		logger.info("Initializing CJavaMHIIgnoreRatings Rule");
		dataSrc = parameters[0];
		rtngDebtClTypes = parameters[1];
		logger.info("Initialized CJavaMHIIgnoreRatings Rule");
		return true;
	}

	public boolean process(XMLMessage msg, DatabaseObjectContainer dboc,
			ProcessorContext pContext, DatabaseAccess dbConn,
			NotificationCreator notificationCreator)
			throws GSException {
		
		logger.info("Processing Java rule CJavaMHIIgnoreRatings Rule");
	
	 if(logger.isDebugEnabled())
       logger.debug("xml: " + msg.getXMLString());
		
		if (dataSrc == null || "".equals(dataSrc))
		{
			logger.info("No Data Source configured in the rule config. Exiting rule.");
			return true;
		}

		
		String dataSrcId = msg.getStringField("DATA_SRC_ID", new SegmentId(0));

		if (logger.isInfoEnabled())
			logger.info("dataSrcId: " + dataSrcId);
		
		if (dataSrc.equals(dataSrcId))
		{
			int count = msg.getSegmentCount();
			
			for(int i=0; i<count; i++)
			{
				SegmentId segId = new SegmentId(i);
				String segName = msg.getSegmentType(segId);

				if("IssueRating".equals(segName)||"FinancialInstitutionRating".equals(segName))
				{
					Integer rtngClassId = msg.getIntegerField("RTNG_CLASS_ID", segId);
					
					if (rtngClassId == null)
					{
						logger.info("rtngClassId is null. Loop on the next IssueRating or FinancialInstitutionRating segment." );
						//logger.info("rtngClassId is null. Break loop." );
						//break;
					}

					if (rtngClassId != null && !rtngClassId.equals(""))
					{
						if(logger.isInfoEnabled())
							logger.info("rtngClassId: "+ rtngClassId);
					
						if (rtngClassId > 0){
			            
							logger.info("Data Class Id greater than zero. Continuing.");
			            
							if (rtngDebtClTypes != null && !rtngDebtClTypes.equals(""))
							{
								String[] rtngDebtClTypesArray = rtngDebtClTypes.split(",");
								String rtngDebtClType = msg.getStringField("RTNG_DEBT_CL_TYP", segId);
			            
								if(logger.isInfoEnabled())
									logger.info("rtngDebtClType: "+ rtngDebtClType);
								
								boolean addRating = false;
								
								for(int j=0; j < rtngDebtClTypesArray.length; j++)
								{
									if ( rtngDebtClTypesArray[j].equals(rtngDebtClType))
									{
										logger.info("Rating Debt Class of interest. Break loop.");
										addRating = true;
										break;
									}
								}
								
								if (addRating == false)
								{
									logger.info("Rating Debt Class not of interest. Ignoring segment.");
									msg.setAction(segId, XMLMessage.A_IGNORE);
								}
							} 
						} else if (rtngClassId == -10200 ||  rtngClassId == -200){
			            
							logger.info("Data Class Id = "+rtngClassId+". Continuing.");
			            
							if (rtngDebtClTypes != null && !rtngDebtClTypes.equals(""))
							{
								String rtngDebtClType = msg.getStringField("RTNG_DEBT_CL_TYP", segId);
			            
								if(logger.isInfoEnabled())
									logger.info("rtngDebtClType: "+ rtngDebtClType);
								
								if ( "REG".equals(rtngDebtClType))
									{
										logger.info("Rating Debt Class of interest. Break loop.");
									} else {
									logger.info("Rating Debt Class not of interest. Ignoring segment.");
									msg.setAction(segId, XMLMessage.A_IGNORE);
								}
							} 
						}
						else {
							logger.info("Data Class Id = "+rtngClassId+" which is not valid and hence ignoring segment.");
							msg.setAction(segId, XMLMessage.A_IGNORE);
			            
						} 
					}
				}
			}

		} else
		{
			logger.info("Rule not required for message data source. Exiting rule.");
			
			
			 if(logger.isDebugEnabled())
               logger.debug("xml: " + msg.getXMLString());
		   
		   
			return true;
		}
		
		 if(logger.isDebugEnabled())
            logger.debug("xml: " + msg.getXMLString());
		
		return true;
	}

}
