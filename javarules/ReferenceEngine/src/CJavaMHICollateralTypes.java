//package com.mizuho.rd.securitymaster.rules;


import java.util.ArrayList;
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


public class CJavaMHICollateralTypes implements JavaRule
{
	private final static Logger logger = Logger.getLogger(CJavaMHICollateralTypes.class);

	public boolean initialize(String[] params)
	{
		return true;
	}

	public boolean process(XMLMessage xml, DatabaseObjectContainer dbObj, ProcessorContext pCon, DatabaseAccess dbConn, NotificationCreator notfcn) throws GSException
	{
		if(logger.isInfoEnabled())
			logger.info("CJavaMHICollatTyps.process()");
		
		if (Common.isMergeMessage(xml, logger))
			return true;
		
		String userId = xml.getStringField("LAST_CHG_USR_ID", new SegmentId(0));

		if(null == userId || !"BBCGCPFDCSTM".equalsIgnoreCase(userId)){
			logger.info("userId: " + userId + ". Exiting");
			return true;
		}
		
		String mainEntityTblTyp = xml.getStringField("MAIN_ENTITY_TBL_TYP", new SegmentId(0));
		
		
		 if(logger.isDebugEnabled())
       logger.debug("xml: " + xml.getXMLString());

		if(null == mainEntityTblTyp || !"ISSU".equalsIgnoreCase(mainEntityTblTyp)){
			logger.info("mainEntityTblTyp: " + mainEntityTblTyp + ". Exiting");
			return true;
		}

		List <String> isllOids = new ArrayList<String>();

		for(int i=0; i < xml.getSegmentCount(); i++)
		{
			SegmentId segId = new SegmentId(i);
			String segType = xml.getSegmentType(segId);

			if(logger.isInfoEnabled())
				logger.info("segType: " + segType);

			if ("IssueCollateral".equals(segType))
			{
				isllOids.add(xml.getStringField("ISLL_OID", segId));

				if (logger.isInfoEnabled())
					logger.info("isllOids: " + isllOids);
			}
		}

		if (isllOids.size() > 0)
		{

			String instrId = pCon.getInstrId();
			logger.info("instrId: " + instrId);
			
			String sql = 	"SELECT isll_oid FROM ft_t_isll " +
							"WHERE instr_id='" + instrId + "' " +
							"AND end_tms IS NULL " +
							"AND coll_id IS NULL";
	
			if (logger.isInfoEnabled())
			{
				logger.info("sql: " + sql);
				logger.info("isllOids.size: " + isllOids.size());
			}
			sql = sql + " AND isll_oid NOT IN (";

			if (logger.isInfoEnabled())
				logger.info("sql: " + sql);
			
			for(int i=0; i < isllOids.size(); i++)
			{
				sql = sql + "'" + isllOids.get(i) + "'";
				if (i != isllOids.size()-1)
					sql = sql + ",";
				if (logger.isInfoEnabled())
					logger.info("sql: " + sql);
			}
			
			sql = sql + ")";
		
			if (logger.isInfoEnabled())
				logger.info("sql: " + sql);
	
			dbConn.setSQL(sql);
			dbConn.execute();
	
			List <String> isllDel = new ArrayList<String>();
	
			while (!dbConn.isEndOfStream())
			{
				isllDel.add(dbConn.getNextString());
			}
	
			if (isllDel.size() > 0)
			{
				for(int i=0; i < isllDel.size(); i++)
				{
					SegmentId newSeg = xml.addSegment(XMLMessage.A_DELETE, "IssueCollateral");
					xml.addField("ISLL_OID", newSeg, isllDel.get(i));
				}
				
				 if(logger.isDebugEnabled())
                        logger.debug("xml: " + xml.getXMLString());
				
				
				return true;
			}
			
			logger.info("No IssueCollateral to delete. Exit");
			return true;
		}
		
		logger.info("No IssueCollateral segments in message. Exit");
		return true;
		
	}
}
