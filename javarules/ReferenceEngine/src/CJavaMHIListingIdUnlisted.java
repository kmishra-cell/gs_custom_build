import org.apache.log4j.Logger;

import com.thegoldensource.jbre.DatabaseAccess;
import com.thegoldensource.jbre.DatabaseObjectContainer;
import com.thegoldensource.jbre.GSException;
import com.thegoldensource.jbre.JavaRule;
import com.thegoldensource.jbre.NotificationCreator;
import com.thegoldensource.jbre.ProcessorContext;
import com.thegoldensource.jbre.SegmentId;
import com.thegoldensource.jbre.XMLMessage;

public class CJavaMHIListingIdUnlisted implements JavaRule 
{
	private static final Logger logger = Logger.getLogger(CJavaMHIListingIdUnlisted.class.getName());
	String prtPurpTyp;
	
	public boolean initialize(String[] params) 
	{
		prtPurpTyp = params[0];
		return true;
	}

	@Override
	public boolean process(XMLMessage xmlMsg,DatabaseObjectContainer dbContainer,ProcessorContext pContext,DatabaseAccess conn,NotificationCreator nCreator) throws GSException
	{
		logger.info("CJavaMHIListingIdUnlisted.process()");

		String mainIssueType  = xmlMsg.getStringField("MAIN_ENTITY_TBL_TYP", new SegmentId(0));

		if(logger.isInfoEnabled())
			logger.info("mainIssueType: "+mainIssueType);


		if("ISSU".equals(mainIssueType))
		{
			String instrumentId = pContext.getInstrId();

			if(logger.isInfoEnabled())
				logger.info("instrumentId :"+instrumentId);
			
			if (prtPurpTyp != null && !prtPurpTyp.equals(""))
			{
				//Check in SOI Group(s)
				String[] issGrpArray = prtPurpTyp.split(",");
				boolean isgpMember = false;

				for(int i=0; i < issGrpArray.length; i++)
				{
					isgpMember = Common.checkIsgpExists(conn, issGrpArray[i], instrumentId, logger);
					if (isgpMember == true)
						break;
				}

				if (isgpMember == false)
				{
					if(logger.isInfoEnabled())
						logger.info("Not in any of the groups. Exiting");
					
					return true;
				}
			}
			
			String sql = 	"SELECT COUNT(*) FROM FT_T_MKIS "+
							"WHERE INSTR_ID = '" + instrumentId + "' " +
							"AND end_tms IS NULL";

			conn.setSQL(sql);
			conn.execute();
			
			int listCnt = conn.getNextInt();

			if(logger.isInfoEnabled())
				logger.info("listCnt: " + listCnt);
			
			if (listCnt > 0)
			{
				logger.info("Active listing exists for instrument. Exiting");
				return true;
			}
			
			sql = 	"SELECT COUNT(*) FROM FT_T_ISID "+
					"WHERE INSTR_ID = '" + instrumentId + "' " +
					"AND ID_CTXT_TYP = 'MHILIST' " +
					"AND MKT_OID = 'MKTMICXXXX'" +
					"AND end_tms IS NULL";

			conn.setSQL(sql);
			conn.execute();

			int mhiListCnt = conn.getNextInt();

			if(logger.isInfoEnabled())
				logger.info("mhiListCnt: " + mhiListCnt);

			if (mhiListCnt > 0)
			{
				logger.info("Unlisted MHI Listing ID already exists. Exiting");
				return true;
			}
			
			sql = 	"SELECT MHI_LISTING_ID() FROM DUAL";
			conn.setSQL(sql);
			conn.execute();

			String mhiListId = conn.getNextString();

			if(logger.isInfoEnabled())
				logger.info("mhiListId: " + mhiListId);

			SegmentId mhiListSeg = xmlMsg.addSegment(XMLMessage.A_D_UNKNOWN,"IssueIdentifier");
			xmlMsg.setSegmentAttribute(mhiListSeg, "MATCH", "ISID6_CTX_ID_MKT_USG");
			xmlMsg.addField("INSTR_ID", mhiListSeg, instrumentId);
			xmlMsg.addField("ID_CTXT_TYP", mhiListSeg, "MHILIST");
			xmlMsg.addField("ISS_ID", mhiListSeg, mhiListId);
			xmlMsg.addField("MKT_OID", mhiListSeg, "MKTMICXXXX");
			xmlMsg.addField("GLOBAL_UNIQ_IND", mhiListSeg, "N");
			xmlMsg.addField("DATA_STAT_TYP", mhiListSeg, "ACTIVE");
			logger.info("MHILIST created. Exiting");
			return true;

		}
		logger.info("Not an issue. Exiting");
		return true;
	}
	
}