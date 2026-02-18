
import org.apache.log4j.Logger;

import com.thegoldensource.jbre.DatabaseAccess;
import com.thegoldensource.jbre.DatabaseObjectContainer;
import com.thegoldensource.jbre.GSException;
import com.thegoldensource.jbre.JavaRule;
import com.thegoldensource.jbre.NotificationCreator;
import com.thegoldensource.jbre.ProcessorContext;
import com.thegoldensource.jbre.SegmentId;
import com.thegoldensource.jbre.XMLMessage;

public class CJavaMIZNonUniqueIdentifier implements JavaRule 
{
	private static final Logger logger = Logger.getLogger(CJavaMIZNonUniqueIdentifier.class.getName());

	@Override
	public boolean initialize(String[] params) 
	{
		return true;
	}

	@Override
	public boolean process(XMLMessage xmlMsg,DatabaseObjectContainer dbContainer,ProcessorContext pContext,DatabaseAccess conn,NotificationCreator nCreator) throws GSException
	{
		logger.debug("CJavaMIZNonUniqueIdentifier");
		
		String mainIssueType  = xmlMsg.getStringField("MAIN_ENTITY_TBL_TYP", new SegmentId(0));
		String issueType  = xmlMsg.getStringField("MAIN_ENTITY_TYP", new SegmentId(0));
		if(logger.isDebugEnabled())
		{
			logger.debug("mainIssueType: "+mainIssueType);
			logger.debug("issueType: "+issueType);
		}

		if("ISSU".equals(mainIssueType))
		{
			int count = xmlMsg.getSegmentCount();
			for(int i=0; i<count; i++)
			{
				SegmentId seg = new SegmentId(i);
				String segName = xmlMsg.getSegmentType(seg);
				String processInd = xmlMsg.getSegmentAttribute(seg, "SEGPROCESSEDIND");
				logger.debug("processInd: "+processInd);
				if("IssueIdentifier".equals(segName))
				{
					String idType =  xmlMsg.getStringField("ID_CTXT_TYP", seg);
					if("TICKER".equals(idType) || "SERIES".equals(idType))
					{
						xmlMsg.setSegmentAttribute(seg, "MATCH", "ISID_MATCH_1");
					}
				}
			}
		}
		return true;
	}

}
