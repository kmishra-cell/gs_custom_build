

import com.thegoldensource.jbre.*;

import org.apache.log4j.Logger;

public class  AccountIdentifier implements JavaRule
{
    private static Logger logger = Logger.getLogger("AccountIdentifier");
    private String param;
    private SegmentId currSegmentId,newSegmentId;
    Integer count=0;

    public AccountIdentifier()
    {
    }

 
//Function to indicate initialization of the Account Identifiers Rule along with any variables.
    public boolean initialize(String[] parameters)
    {
        logger.debug("Initializing AccountIdentifiers Rule");
        
        //Reading ACCT_ID_CTXT_TYP value defined in the StreetRefMsgSet.xml file
        param=parameters[0];
        
        logger.debug("Initialized AccountIdentifiers Rule");
        
        return true;
    }


//Function to process the XML message being processed.
    public boolean process(XMLMessage msg, DatabaseObjectContainer dboc,
							ProcessorContext pContext,
							DatabaseAccess dbConnection,
							NotificationCreator notificationCreator)
    {
    	try
    	{

    		currSegmentId = pContext.getCurrentSegmentId();
    		String acctId = msg.getStringField("ACCT_ID", currSegmentId);
    		String bkId = msg.getStringField("BK_ID", currSegmentId);
    		String orgId = msg.getStringField("ORG_ID", currSegmentId);
    		
    		dbConnection.setSQL("select count(*) from ft_t_acid " +
    							"where acct_id = '" + acctId + "' " +
    							"and bk_id = '" + bkId + "' " +
    							"and org_id = '" + orgId + "' " +
    							"and acct_id_ctxt_typ = '" + param + "'");
			
    		if (!dbConnection.execute())
			{
				logger.debug("The acct_id query execution failed");
			}
    		
    		//To confirm that the rule is executed only for New Insert segments.    		
    		if (dbConnection.getNextInt().intValue() == 0)
    		{
    			dbConnection.setSQL("select account_id.nextval from dual");
    			if (!dbConnection.execute())
    			{
    				logger.debug("The query execution failed");
    			}

    			if (dbConnection.isEndOfStream())
    			{
    				logger.debug("No rows are fetched");
    			}
	        
    			while (!dbConnection.isEndOfStream())
    			{
    				count = dbConnection.getNextInt();
    			}
  
    			// To convert the sequence value to a String datatype        
    			String sequence_count=String.valueOf(count);
	        
    			// To insert Account Identifier segment    
    			newSegmentId=msg.addSegment(XMLMessage.A_UNKNOWN,"AccountAlternateIdentifier");
	        
    			//Fields
    			msg.addField("ACCT_ID",newSegmentId,acctId);
    			msg.addField("ORG_ID",newSegmentId,bkId);
    			msg.addField("BK_ID",newSegmentId,orgId);
    			msg.addField("ACCT_ALT_ID",newSegmentId,sequence_count);
    			msg.addField("ACCT_ID_CTXT_TYP",newSegmentId,param);
	        
    		}
        logger.debug("Sucessfully processed Java rule AccountIdentifier");
    	}
    	catch (Exception e)
    	{
    		logger.debug("Exception while running the Account Identifiers debug rule: Details ---"+ e);
    	}
    	finally 
    	{
    		dbConnection.close();
    	}
        return true;

    }    
}

