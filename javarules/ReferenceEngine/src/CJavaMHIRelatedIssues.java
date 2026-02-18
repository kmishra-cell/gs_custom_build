import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.log4j.Logger;

import com.thegoldensource.jbre.DatabaseAccess;
import com.thegoldensource.jbre.DatabaseObjectContainer;
import com.thegoldensource.jbre.GSException;
import com.thegoldensource.jbre.JavaRule;
import com.thegoldensource.jbre.NotificationCreator;
import com.thegoldensource.jbre.ProcessorContext;
import com.thegoldensource.jbre.SegmentId;
import com.thegoldensource.jbre.XMLMessage;


public class CJavaMHIRelatedIssues implements JavaRule
{
	private final static Logger logger = Logger.getLogger(CJavaMHIRelatedIssues.class);
	String[] rissParams;

	public boolean initialize(String[] params)
	{
		if(params.length > 0)
		{	
			rissParams = params;
			return true;
		}
		else
		{
			if(logger.isInfoEnabled())
				logger.info("No params specified for the rule. Exiting");
			return false;
		}
	}

	public boolean process(XMLMessage xml, DatabaseObjectContainer dbObj, ProcessorContext pCon, DatabaseAccess dbConn, NotificationCreator notfcn) throws GSException
	{

		if(logger.isInfoEnabled())
			logger.info("CJavaMHIRelatedIssues.process()");
		
		 if(logger.isDebugEnabled())
       logger.debug("xml: " + xml.getXMLString());
		
		if (Common.isMergeMessage(xml, logger))
			return true;
		
		String mainEntityTblTyp = xml.getStringField("MAIN_ENTITY_TBL_TYP", new SegmentId(0));

		if(null == mainEntityTblTyp || !"ISSU".equalsIgnoreCase(mainEntityTblTyp)){
			logger.info("mainEntityTblTyp: " + mainEntityTblTyp + ". Exiting");
			return true;
		}
		
		String userId = xml.getStringField("LAST_CHG_USR_ID", new SegmentId(0));

		if(null == userId)
		{ 
			logger.info("userId is null. Exiting");
			return true;
		}
		
		String[] rissParam;
		
		for (int x=0; x < rissParams.length; x++)
		{
			rissParam = rissParams[x].split(",");
			
			if (rissParam[0].equalsIgnoreCase(userId))
			{
			
				List <String> rissOids = new ArrayList<String>();
		
				for(int i=0; i < xml.getSegmentCount(); i++)
				{
					SegmentId segId = new SegmentId(i);
					String segType = xml.getSegmentType(segId);
		
					if(logger.isInfoEnabled())
						logger.info("segType: " + segType);
					
					if ("RelatedIssueDefinition".equals(segType)) 
					{
						String relType = xml.getStringField("REL_TYP", segId);
					
						if (rissParam[1].equals(relType))
						{
							
							for(int j=i+1; j < xml.getSegmentCount(); j++)
							{
								i=j;   //  outer for loop will carry on from j+1
								segId = new SegmentId(j);
								segType = xml.getSegmentType(segId);
								
								if(logger.isInfoEnabled())
									logger.info("rissSegType: " + segType);
								
								if ("RelatedIssue".equals(segType)) 
								{
									String issPartRlType = xml.getStringField("ISS_PART_RL_TYP", segId);
								
									if (rissParam[2].equals(issPartRlType))
									{
										rissOids.add(xml.getStringField("RISS_OID", segId));
									
										if (logger.isInfoEnabled())
											logger.info("rissOids: " + rissOids);
									}
								} else
									break;
							}
							
							String instrId = pCon.getInstrId();
							logger.info("instrId: " + instrId);
							
							String sql = 	"SELECT riss_oid, rld_iss_feat_id FROM ft_t_riss " +
											"WHERE rld_iss_feat_id = " +
											"(SELECT rld_iss_feat_id FROM ft_t_ridf " + 
											"WHERE instr_id = '" + instrId + "' " +
											"AND rel_typ = '" + rissParam[1] + "' " + 
											"AND end_tms IS NULL) " +
											"AND end_tms IS NULL";
					
							if (logger.isInfoEnabled())
							{
								logger.info("sql: " + sql);
								logger.info("rissOids.size: " + rissOids.size());
							}
							
							if (rissOids.size() > 0)
							{
								sql = sql + " AND riss_oid NOT IN (";
					
								if (logger.isInfoEnabled())
									logger.info("sql: " + sql);
								
								for(int j=0; j < rissOids.size(); j++)
								{
									sql = sql + "'" + rissOids.get(j) + "'";
									if (j != rissOids.size()-1)
										sql = sql + ",";
									if (logger.isInfoEnabled())
										logger.info("sql: " + sql);
								}
								
								sql = sql + ")";
							}

							if (logger.isInfoEnabled())
								logger.info("sql: " + sql);
					
							dbConn.setSQL(sql);
							dbConn.execute();
					
							List <String> rissDel = new ArrayList<String>();
							HashMap<String, String> ridfRissMap = new HashMap<String, String>();
					
							while (!dbConn.isEndOfStream())
							{
								String rissOid = dbConn.getNextString();
								rissDel.add(rissOid);
								if (!dbConn.isEndOfStream()) {
									ridfRissMap.put(rissOid, dbConn.getNextString()); 
								}
							}
							
							if (rissDel.size() > 0)
							{
								for(int j=0; j < rissDel.size(); j++)
								{
									String rldFeatId = ridfRissMap.get(rissDel.get(j));
									if (  rldFeatId != null && !"".equals(rldFeatId) ) {
										SegmentId newRidfSeg = xml.addSegment(XMLMessage.A_REFERENCE, "RelatedIssueDefinition");
										xml.addField("RLD_ISS_FEAT_ID", newRidfSeg, rldFeatId );
										
										SegmentId newSeg = xml.addSegment(XMLMessage.A_DELETE, "RelatedIssue");
										xml.addField("RISS_OID", newSeg, rissDel.get(j));
									}
								}
								
								 if(logger.isDebugEnabled())
                                       logger.debug("xml: " + xml.getXMLString());
								//return true;
							} else
							{
								if (logger.isInfoEnabled())
									logger.info("No RISS to delete for " + rissParam[1]);
							}
						} else
						{
							if (logger.isInfoEnabled())
								logger.info("RIDF is for " + relType + ", not " + rissParam[1]);
						}
					}
				}
			}
			if(logger.isInfoEnabled())
				logger.info("userId: "+ userId+". Nothing to do.");
		}
		
		logger.info("No RelatedIssue segments in message. Exit");
		return true;
		
	}
}
