import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.thegoldensource.jbre.DatabaseAccess;
import com.thegoldensource.jbre.DatabaseObjectContainer;
import com.thegoldensource.jbre.GSException;
import com.thegoldensource.jbre.JavaRule;
import com.thegoldensource.jbre.NotificationCreator;
import com.thegoldensource.jbre.ProcessorContext;
import com.thegoldensource.jbre.SegmentId;
import com.thegoldensource.jbre.XMLMessage;

import org.apache.log4j.Logger;


public class CJavaMHIPublishDescendantsIP implements JavaRule{
	
	private static final Logger logger = Logger.getLogger(CJavaMHIPublishDescendantsIP.class.getName());
	private static final List<String> segmentList=Arrays.asList("FinancialInstitution","FinancialInstitutionIdentifier","Issuer","IssuerIdentifier","FinsFinsRole");
	private static final List<String> changeInd=Arrays.asList("C","U");
	private static String getInstMnemFromISSR="Select fins_inst_mnem from ft_T_issr where Instr_issr_id=:1<char[11]>";
	private static String getIP="select INST_MNEM from ft_t_ffrl where PRNT_INST_MNEM = :1<char[11]> and REL_TYP in ('PARNTCOF', 'MHIPARNT')";
	private static String getDesc="select instr_issr_id from ft_t_irgp where PRT_PURP_TYP = 'INTEREST' and END_TMS is null" +
			" and INSTR_ISSR_ID in (select INSTR_ISSR_ID from ft_t_issr where FINS_INST_MNEM = :1<char[11]> )";
	private static String getCust="select cst_id from ft_T_cust where INST_MNEM = :1<char[11]>";
	private static String custPubFlag;

	@Override
	public boolean initialize(String[] param) {
		// TODO Auto-generated method stub
		
		log("Initializing CJavaMHIPublishDescendantsIP");
		custPubFlag=param[0];
		return true;
	}

	@Override
	public boolean process(XMLMessage msg, DatabaseObjectContainer dboc,
			ProcessorContext pContext, DatabaseAccess db, NotificationCreator ntfcn)
			throws GSException {
		// TODO Auto-generated method stub
		
		String mainEntityType  = msg.getStringField("MAIN_ENTITY_TBL_TYP", new SegmentId(0));
		
		if(logger.isDebugEnabled())
         logger.debug("xml: " + msg.getXMLString());
		
		log("Main Entity Table:  "+mainEntityType);
		
//Checking Entity if not FINS or ISSR exit
		if (!("ISSR".equals(mainEntityType) || "FINS".equals(mainEntityType))){
			log("Exiting Rule as it is not an ISSR or FINS entity");
			return true;
		}
		boolean changedEntity=false;
		int segCount=msg.getSegmentCount();
		
		for(int i=0;i<segCount;i++){
			SegmentId segId = new SegmentId(i);
			if (segmentList.contains(msg.getSegmentType(segId)) && changeInd.contains(msg.getSegmentAttribute(segId, "SEGPROCESSEDIND"))) {
				changedEntity=true;
			}
		}
//Checking Entity has changed/updated if not then exit
		if (changedEntity==false){
			log("Exiting Rule as there is no change to "+mainEntityType+" entity");
			return true;
		}
	
		String instMnem=null;
//Get Institution mnemonic of current message		
		if("FINS".equals(mainEntityType)){
			instMnem=msg.getStringField("INST_MNEM", new SegmentId(0));
		}
		
		else{
			instMnem=msg.getStringField("INST_MNEM", new SegmentId(0));
			if(instMnem==null || "".equals(instMnem)){
				String issrOid=msg.getStringField("INSTR_ISSR_ID", new SegmentId(0));
				log("ISSR OID: "+issrOid);
				instMnem=getFieldFromDB(db,getInstMnemFromISSR,issrOid);
			}
			
			if (instMnem==null || "".equals(instMnem)){
				log("Exiting as there is no FINS(INST_MNEM)");
				return true;
			}
			
		}	
		
//Get descendant mnemonic list	
		List<String> desc_Inst_Mnen=getFirstColListDB(db,getIP,Arrays.asList(instMnem));
		log("desc_Inst_Mnen: "+ desc_Inst_Mnen);
		
//Exiting if no descendant found			
		if(desc_Inst_Mnen==null){
			log("Exiting Rules there are no descendant ");
			return true;
		}
		String trn_id=pContext.getScopedTransaction().getTransactionID();
//Checking descendant if they are part of IOI if yes insert entry in UP_children
		for(String desc_Inst:desc_Inst_Mnen){
			
			String result=null;
			result=getFieldFromDB(db,getDesc,desc_Inst);
			if(result==null){
			continue;	
			}			
			String insertUPChildrenSQL="INSERT INTO up_children SELECT new_oid(),'"+trn_id+"', null, SYSDATE(),'"+instMnem+"','"+result+"','ISSR'"+ 
    		" FROM dual WHERE NOT EXISTS (SELECT * FROM UP_CHILDREN WHERE prnt_inst_mnem = '"+instMnem+"' AND cross_ref_id='"+result+"'"
			+ " AND START_TMS > sysdate() - INTERVAL '1 hour' )";
			logger.info("insertUPChildrenSQL = " + insertUPChildrenSQL);
			db.setSQL(insertUPChildrenSQL);
            
			try
		    {
		      db.execute();
		    }
		    
		    catch (Exception e1)
		    {
		      e1.printStackTrace();
		      logger.info("Failed to insert desc instr_issr_id dbconnection.execute process:" + desc_Inst);
		    }
		    
		    if("N".equals(custPubFlag)){
		    	logger.info("Customer publishing is not required");
		    	continue;
		    }
		    List<String> linked_Cust=getFirstColListDB(db,getCust,Arrays.asList(desc_Inst));
			log("linked_Cust: "+ linked_Cust);	
			if(linked_Cust==null){
				log("There are no linked customer for INST_MNEM: "+desc_Inst);
				continue;
			}
			for(String rel_cust:linked_Cust){
				String insertCustUPChildrenSQL="INSERT INTO up_children SELECT new_oid(),'"+trn_id+"', null, SYSDATE(),'"+instMnem+"','"+rel_cust+"','CUST'"+ 
	    		" FROM dual WHERE NOT EXISTS (SELECT * FROM UP_CHILDREN WHERE prnt_inst_mnem = '"+instMnem+"' AND cross_ref_id='"+rel_cust+"'"
				+ " AND START_TMS > sysdate() - INTERVAL '1 hour' )";
				logger.info("insertCustUPChildrenSQL = " + insertCustUPChildrenSQL);
				db.setSQL(insertCustUPChildrenSQL);
	            
				try
			    {
			      db.execute();
			    }
			    
			    catch (Exception e1)
			    {
			      e1.printStackTrace();
			      logger.info("Failed to insert cust dbconnection.execute process:" + rel_cust);
			    }
			}
		}
		
		return true;
	}
		
	 String getFieldFromDB(DatabaseAccess dbConnection, String query, String... paramValues) {
		 	String result=null;
				try {
			dbConnection.setSQL(query);
			for (String paramValue : paramValues)
				dbConnection.addParameter(paramValue);

			dbConnection.execute();
			if (!dbConnection.isEndOfStream()) {
				result = getNextField(dbConnection);
			}
		} catch (Exception e) {
			logger.error("Unable to retirive value from DB", e);
		} finally {
			dbConnection.close();
		}

		return result;
	}
	 
	 public List<String> getFirstColListDB(DatabaseAccess dbConnection, String query, List<String> queryParams) 
		{
			List<String> ValuesDB=new ArrayList<String>();
			if (query == null || "".equals(query)) {
				return null;
			}
			
				log("Executing: " + query);
			try {
				dbConnection.setSQL(query);
				for (int i = 0; i < queryParams.size(); i++) {
					dbConnection.addParameter(new String(queryParams.get(i)));
				}
				
				if (!dbConnection.execute()) 
				{
					logger.error("ERROR: Failed to execute SQL statement.");
				}
				 
					log("Before while: "+dbConnection.isEndOfStream());
				
				if(dbConnection.isEndOfStream())
				{
					return null;
				}
				
					while (!dbConnection.isEndOfStream()) 
					{
							log("Inside while");
						ValuesDB.add(dbConnection.getNextString());
							log("Valuieof db"+ValuesDB);
					}
				
				
				} 
				catch (Exception e) {
				if (!(e instanceof GSException)) {
					logger.error("ERROR: " + e.getMessage());
				}
				
			}return ValuesDB;
		}
				public void log(Object s){
					if(logger.isDebugEnabled())
						logger.debug(s);
				}
	 String getNextField(DatabaseAccess dbConnection) {
			return dbConnection.getNextString();
		}
}
