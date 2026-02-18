import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.*;
import java.lang.*;
import org.apache.log4j.Logger;

import com.thegoldensource.jbre.DatabaseAccess;
import com.thegoldensource.jbre.DatabaseObjectContainer;
import com.thegoldensource.jbre.GSException;
import com.thegoldensource.jbre.JavaRule;
import com.thegoldensource.jbre.NotificationCreator;
import com.thegoldensource.jbre.ProcessorContext;
import com.thegoldensource.jbre.SegmentId;
import com.thegoldensource.jbre.XMLMessage;

public class CJavaMHICheckIssuerFinsRel implements JavaRule{
	
	
	private static Logger logger = Logger.getLogger("CJavaMHICheckIssuerFinsRel");
	//private static int count= 0;
	
	public boolean initialize(String[] params) {
		if (logger.isInfoEnabled())
		logger.info("Initializing CJavaMHICheckIssuerFinsRel Rule");
		return true;
	}
	
	public boolean process(XMLMessage msg, DatabaseObjectContainer dboc,
			ProcessorContext pContext, DatabaseAccess dbConn, NotificationCreator notfcn)
	throws GSException {
	
	 if(logger.isDebugEnabled())
       logger.debug("xml: " + msg.getXMLString());
	
	
	String mainEntityTblTyp = msg.getStringField("MAIN_ENTITY_TBL_TYP", new SegmentId(0));
		if(null == mainEntityTblTyp || !"ISSR".equalsIgnoreCase(mainEntityTblTyp)){
			
			if(logger.isDebugEnabled()){
             logger.debug("xml: " + msg.getXMLString());
		      logger.info("Message is not for Issuer. Hence Exiting");
			}
		 
			return true;
		}
		
		
		String msgClassification = msg.getStringField("MSG_CLASSIFICATION", new SegmentId(0));
	
	//to work this code for data load comment below if block
	if(!"WEBMSG".equalsIgnoreCase(msgClassification))
		{
			
			 if(logger.isDebugEnabled()){
             logger.debug("xml: " + msg.getXMLString());
			 logger.info("Message is not UI. Hence Exiting");
			 }
	
			return true;
		}
	
	    SegmentId issuerSegId = new SegmentId(0);
		String action = msg.getAction(issuerSegId);
		
		
		
	            	logger.info("segmentISSUER - "+ issuerSegId);
					String finsInstMnem = msg.getStringField("FINS_INST_MNEM", issuerSegId);
					
					logger.info("finsInstMnem - "+ finsInstMnem);
					
					
					String existingInstrIssrId = msg.getStringField("INSTR_ISSR_ID", issuerSegId);
					
					logger.info("existingInstrIssrId - "+ existingInstrIssrId);
		
		 logger.info("Checking if fins is already liked to any othere Issuer =========== ");
	 
	 
	   String instrIssrD = getFirstValDB("select instr_issr_id  from ft_T_issr where fins_inst_mnem='"+finsInstMnem+"' and end_tms is null",dbConn, logger);
		
		
		logger.info("instrIssrD - "+ instrIssrD);
		
					// if(instrIssrD != null || !instrIssrD.trim().isEmpty()){
					
					if(!instrIssrD.equals("TEST")){
					
					if(!instrIssrD.equals(existingInstrIssrId)){
					 
					String IssuerName =  getFirstValDB("select issr_nme  from ft_T_issr where fins_inst_mnem='"+finsInstMnem+"' and end_tms is null",dbConn, logger);
					 
				          logger.info("Fins is already linked to the Issuer,raising Exception ===");
								
								notfcn.raiseException("STRDATA", "JAVARULE", 50010, 
										new String[]{"Fins is already linked with issuer='"+IssuerName+"'"}, 
										new String[]{"Fins is already linked with issuer='"+IssuerName+"'"});
					 }
					}
		
		
		    return true;
	}
	
	
	public List<SegmentId> getSegmentIds(String segType, XMLMessage msg) {
        List<SegmentId> segIdList = new ArrayList<SegmentId>();
        for (int i=0; i<msg.getSegmentCount(); i++) {
                        SegmentId segId = new SegmentId(i);                                   
                        if (msg.getSegmentType(segId).equals(segType)) {
                                        segIdList.add(segId);
                        }
        }                              
        return segIdList;               
    }
	
	
	public String getFirstValDB(String query, DatabaseAccess dbConnection, Logger logger) {
		String dbout= "TEST";
		if (query==null || "".equals(query)){
		return null;
		}
		logger.info("Executing: " + query);
		try {
		dbConnection.setSQL(query);
		if (!dbConnection.execute()) {
		logger.error("ERROR: Failed to execute SQL statement.");
		}
		if (!dbConnection.isEndOfStream()) {
			dbout =  dbConnection.getNextString();
			 if (dbout != null) {
                dbout = dbout.trim();
            }
			//count = dbConnection.getNextInt();
		}
		} catch (Exception e) {
		if (!(e instanceof GSException)) {
		logger.error("ERROR: " + e.getMessage());
		}
		} 
		logger.info("dbout --> "+dbout);
		return dbout;
		}
	
	
}