import com.thegoldensource.jbre.DatabaseAccess;
import com.thegoldensource.jbre.DatabaseObjectContainer;
import com.thegoldensource.jbre.GSException;
import com.thegoldensource.jbre.JavaRule;
import com.thegoldensource.jbre.NotificationCreator;
import com.thegoldensource.jbre.ProcessorContext;
import com.thegoldensource.jbre.SegmentId;
import com.thegoldensource.jbre.XMLMessage;
import java.util.HashMap;
import java.util.HashSet;
import org.apache.log4j.Logger;

public class CJavaMHIAcctClsfGenerator implements JavaRule
{
  private static Logger logger = Logger.getLogger("CJavaMHIAcctClsfGenerator");
  private static HashMap<String, String> clsfOidClValueMap = new HashMap<String, String>();
  private static HashSet<String> instrClassEquitySet;
  private static HashSet<String> instrClassDebtSet;

  static
  {
    instrClassEquitySet = new HashSet<String>();
    instrClassEquitySet.add("Equity");

    instrClassDebtSet = new HashSet<String>();
    instrClassDebtSet.add("Mtge");
    instrClassDebtSet.add("Corp");
    instrClassDebtSet.add("Muni");
    instrClassDebtSet.add("Govt");
    instrClassDebtSet.add("Pfd");
    instrClassDebtSet.add("M-Mkt");
  }

  public boolean initialize(String[] parameters)
  {
    logger.info("Initializing CJavaMHIAcctClsfGenerator Rule");
    return true;
  }

  public boolean process(XMLMessage msg, DatabaseObjectContainer dboc, ProcessorContext pContext, DatabaseAccess dbConn, NotificationCreator notfcn)
    throws GSException
  {
    String sqlQuery = "";
    String derivedMHIAcctClass = "";
    String availableMHIAcctClass = "";
    String secOfInterest = "";
    String countryOfRisk = "";
    String instrClassification = "";
    String industrySector = "";
    String instrCategory = "";
    String isBndGuarnted = "";


    logger.info("Processing rule CJavaMHIAcctClsfGenerator to generate MHI Accouting Classification Starts");
	
	 if(logger.isDebugEnabled())
       logger.debug("xml: " + msg.getXMLString());

    String entityTableType = msg.getStringField("MAIN_ENTITY_TBL_TYP", new SegmentId(0));
    if ((entityTableType == null) || ("".equals(entityTableType)) || (!"ISSU".equals(entityTableType)))
    {
      logger.info("Not an Issue message but is " + entityTableType + " message. Hence exiting from Rule");
      return true;
    }
    String instrId = pContext.getInstrId();
    if ((instrId == null) || ("".equals(instrId)))
    {
      logger.info("Unable to get Instrument Id for this message. Exiting from Rule");
      return true;
    }
    sqlQuery =  "select  " +
    			"(select trim(cl_value) from ft_t_iscl iscl where indus_cl_set_id = 'BBMKTSCT' and iscl.instr_id = issu.instr_id and iscl.end_tms is null limit 1) instrClass,  " +
    			"(select trim(GU_ID) from ft_t_figu figu where fins_gu_purp_typ = 'RISK' and figu.gu_typ='COUNTRY' and figu.inst_mnem = (select fins_inst_mnem from ft_t_issr r where r.instr_issr_id=issu.instr_issr_id) and figu.end_tms is null limit 1) cntryRisk,  " +
    			"(select 1 from ft_t_isgp isgp where  prt_purp_typ = 'INTEREST' and isgp.instr_id = issu.instr_id and isgp.end_tms is null limit 1) SOI,  " +
    			"(select cl_value from ft_t_iscl iscl where indus_cl_set_id = 'MHACTCLS' and iscl.instr_id = issu.instr_id and iscl.end_tms is null limit 1) mhiAcctClass,  " +
    			"(select trim(cl_value) from ft_t_iscl iscl where indus_cl_set_id = 'BBINDSGR' and iscl.instr_id = issu.instr_id and iscl.end_tms is null limit 1) industrySector,  " +
    			"(select trim(cl_value) from ft_t_iscl iscl where indus_cl_set_id = 'BBSECTYP' and clsf_purp_typ = 'BBISSTYP' and iscl.instr_id = issu.instr_id and iscl.end_tms is null limit 1) instrTyp, " +
    			"coalesce((select 'Y' from ft_t_frip p where prt_purp_typ = 'GUARANTR' and inst_mnem in (select inst_mnem from ft_t_fins where inst_nme = 'Japan') and p.instr_id = issu.instr_id),'N') guaranteed  " +
    			"from fT_T_issu issu where instr_id = '" + instrId + "' ";

    dbConn.setSQL(sqlQuery);
    dbConn.execute();

    if (!dbConn.isEndOfStream()) {
      instrClassification = dbConn.getNextString();
      logger.info("instrClassification: "+instrClassification);
    }

    if (!dbConn.isEndOfStream()) {
      countryOfRisk = dbConn.getNextString();
      logger.info("countryOfRisk: "+countryOfRisk);
    }

    if (!dbConn.isEndOfStream()) {
      secOfInterest = dbConn.getNextString();
      logger.info("secOfInterest: "+secOfInterest);
    }

    if (!dbConn.isEndOfStream())
    {
    	availableMHIAcctClass = dbConn.getNextString();

    	if (availableMHIAcctClass == null) {
    		availableMHIAcctClass = "";
    	}
    	logger.info("availableMHIAcctClass: "+availableMHIAcctClass);
    }

    if (!dbConn.isEndOfStream()) {
    	industrySector = dbConn.getNextString();
      	logger.info("industrySector: "+industrySector);
    }

    if (!dbConn.isEndOfStream()) {
    	instrCategory = dbConn.getNextString();
    	logger.info("instrCategory: "+instrCategory);
    }

    if (!dbConn.isEndOfStream()) {
    	isBndGuarnted = dbConn.getNextString();
    	logger.info("isBndGuarnted: "+isBndGuarnted);
    }

    if (!"1".equals(secOfInterest))
    {
      logger.info("Exiting from rule as instrument is not in any SOI.");
      return true;
    }

    if ((instrClassEquitySet.contains(instrClassification)) || (instrClassDebtSet.contains(instrClassification)))
    {
      if (instrClassEquitySet.contains(instrClassification))
      {
        instrClassification = "EQUITY";
      }
      else
      {
        instrClassification = "DEBT";
      }

      StringBuffer getMHIAcctClasCodeQry = new StringBuffer(" SELECT MHI_ACCT_CLASS FROM FT_T_MAC1 WHERE INSTR_CLASSIFY = '" + instrClassification + "' ");

      if ((countryOfRisk != null) && (!"".equals(countryOfRisk)))
      {
        getMHIAcctClasCodeQry.append(" AND (CNTRY_OF_RISK ='").append(countryOfRisk).append("' OR  ( CNTRY_OF_RISK NOT LIKE 'NOT%_").append(countryOfRisk).append("%' and CNTRY_OF_RISK LIKE 'NOT%_%') ) ");
      }
      else
      {
        getMHIAcctClasCodeQry.append(" AND (CNTRY_OF_RISK IS NULL OR  CNTRY_OF_RISK LIKE 'NOT_%'  ) ");
      }

      if ((instrCategory != null) && (!"".equals(instrCategory)))
      {
        getMHIAcctClasCodeQry.append(" AND ( INSTR_CATEGORY IS NULL OR INSTR_CATEGORY = '").append(instrCategory).append("' )");
      }
      else
      {
        getMHIAcctClasCodeQry.append(" AND INSTR_CATEGORY IS NULL ");
      }

      if ("EQUITY".equals(instrClassification))
      {
        getMHIAcctClasCodeQry.append(" AND SECTOR_TYP IS NULL ");
      }
      else if ("Sovereign".equals(industrySector))
      {
        getMHIAcctClasCodeQry.append(" AND UPPER(SECTOR_TYP) ='GOVERNMENT' ");

        if ("Y".equals(isBndGuarnted))
        {
          getMHIAcctClasCodeQry.append(" AND UPPER(GOV_GUARANTEED_FLAG)='Y' ");
        }
        else
        {
          getMHIAcctClasCodeQry.append(" AND ( UPPER(GOV_GUARANTEED_FLAG)='N' or GOV_GUARANTEED_FLAG IS NULL ) ");
        }
      }
      else if ("Municipals".equals(industrySector))
      {
        getMHIAcctClasCodeQry.append(" AND UPPER(SECTOR_TYP) ='MUNICIPALS' ");
      }
      else if (("Sovereign Agency".equals(industrySector)) || ("Export/Import Bank".equals(industrySector)))
      {
        getMHIAcctClasCodeQry.append(" AND UPPER(SECTOR_TYP) ='GOVERNMENT AGENCY' ");

        if ("Y".equals(isBndGuarnted))
        {
          getMHIAcctClasCodeQry.append(" AND UPPER(GOV_GUARANTEED_FLAG)='Y' ");
        }
        else
        {
          getMHIAcctClasCodeQry.append(" AND ( UPPER(GOV_GUARANTEED_FLAG)='N' or GOV_GUARANTEED_FLAG IS NULL ) ");
        }
      }
      else
      {
        getMHIAcctClasCodeQry.append(" AND UPPER(SECTOR_TYP) ='OTHER' ");
      }

      logger.info("getMHIAcctClasCodeQry: "+getMHIAcctClasCodeQry);

      dbConn.setSQL(getMHIAcctClasCodeQry.toString());
      dbConn.execute();

      if (!dbConn.isEndOfStream())
      {
        derivedMHIAcctClass = dbConn.getNextString();
        if (derivedMHIAcctClass == null) {
          derivedMHIAcctClass = "";
        }
      }
      if (!dbConn.isEndOfStream())
      {
        String listOfMAC = derivedMHIAcctClass;
        while (!dbConn.isEndOfStream()) {
          listOfMAC = listOfMAC + ", " + dbConn.getNextString();
        }
        logger.error(" More then one matching records found in config table FT_T_MAC1. Kindly correct the configuration. Values ->" + listOfMAC);
        return true;
      }
    }
    else
    {
      derivedMHIAcctClass = "";
    }
    logger.info("Derived Value for MHI Acct Class is " + derivedMHIAcctClass + ", against previous value of " + availableMHIAcctClass);
		//EG-9595 - remove old classification before adding a new one if relevant.
		
		// if new is blank or old and new differ, remove old one
		if (!"".equals(availableMHIAcctClass) && ("".equals(derivedMHIAcctClass) || !derivedMHIAcctClass.equals(availableMHIAcctClass) ))
		{
			logger.info("end-date existing MHI Accounting Classification");
			deleteISCLSegmentToMsg(msg, instrId, availableMHIAcctClass, dbConn);
		}
		// add insert segment if new <> old and new is present
		if (!"".equals(derivedMHIAcctClass) && !derivedMHIAcctClass.equals(availableMHIAcctClass)) {
			logger.info("insert new  MHI Accounting Classification");
			addISCLSegmentToMsg(msg, instrId, derivedMHIAcctClass, dbConn);
		}
		// if both blank or old and new same, report no change
		if (("".equals(derivedMHIAcctClass) && "".equals(availableMHIAcctClass)) || derivedMHIAcctClass.equals(availableMHIAcctClass))
		{
			logger.info("MHI Account Classification remains unchanged");
		} else
		{
		//	logger.info("msg is " + msg.getXMLString());
		}
		logger.info("Processing rule CJavaMHIAcctClsfGenerator to generate MHI Accouting Classification Ends");
		return true;
	}
	// EG-9575 - 2 new methods to remove and add rows using segments instead of SQL.
	// the old method is no longer required and has been commented out
  public boolean addISCLSegmentToMsg(XMLMessage msg, String instrId, String newClValue, DatabaseAccess dbConn)
  {
		logger.info("Creating add segment for ISCL for MHI Acct Classification");
		
		if ( clsfOidClValueMap.get(newClValue) ==null || "".equals(clsfOidClValueMap.get(newClValue)) ) {
			fetchMHACTCLSCLSFOidMap(dbConn);
		}
		
		SegmentId isclSegId;
		isclSegId = msg.addSegment("D_UNKNOWN", "IssueClassification");
		msg.addField("CLSF_OID", isclSegId, (String)clsfOidClValueMap.get(newClValue));
		msg.addField("CL_VALUE", isclSegId, newClValue);
		msg.setSegmentAttribute(isclSegId, "MATCH", "ISCL_MATCH_SET_PURP");
		msg.addField("INSTR_ID", isclSegId, instrId);
		msg.addField("INDUS_CL_SET_ID", isclSegId, "MHACTCLS");
		msg.addField("CLSF_PURP_TYP", isclSegId, "INDCLASS");
    return true;
  }
	 
  public boolean deleteISCLSegmentToMsg(XMLMessage msg, String instrId, String oldClValue, DatabaseAccess dbConn)
  {
		logger.info("Creating delete segment for old ISCL for MHI Acct Classification");
		
		if ( clsfOidClValueMap.get(oldClValue) == null || "".equals(clsfOidClValueMap.get(oldClValue)) ) {
			fetchMHACTCLSCLSFOidMap(dbConn);
		}
		
		SegmentId isclSegId;
		isclSegId = msg.addSegment("D_DELETE", "IssueClassification");
		msg.addField("CLSF_OID", isclSegId, (String)clsfOidClValueMap.get(oldClValue));
		msg.addField("CL_VALUE", isclSegId, oldClValue);
		msg.setSegmentAttribute(isclSegId, "MATCH", "ISCL_MATCH_SET_PURP");
		msg.addField("INSTR_ID", isclSegId, instrId);
		msg.addField("INDUS_CL_SET_ID", isclSegId, "MHACTCLS");
		msg.addField("CLSF_PURP_TYP", isclSegId, "INDCLASS");
    return true;
  }

	private void fetchMHACTCLSCLSFOidMap(DatabaseAccess dbConn) {
		
		HashMap<String, String> clsfOidMaptmp = new HashMap<String, String>();
		 
		dbConn.setSQL("SELECT CL_VALUE, CLSF_OID FROM FT_T_INCL WHERE  INDUS_CL_SET_ID = 'MHACTCLS' AND END_TMS IS NULL");
	    dbConn.execute();
	      while (!dbConn.isEndOfStream())
	      {
	    	String clvalue = dbConn.getNextString();
	    	String clsfOid = dbConn.getNextString();
	    	clsfOidMaptmp.put(clvalue, clsfOid);
	      }	      
	      clsfOidClValueMap = clsfOidMaptmp ;
	}
	  
	  

  //public boolean addDelISCLSegmentToMsg(XMLMessage msg, String instrId, String newClValue, String oldClValue)
  //{
  //  if (("".equals(newClValue)) || (clsfOidClValueMap.get(newClValue) != null))
  //  {
  //    logger.info("Creating segment for ISCL to add MHI Acct Classification");
  //    SegmentId isclSegId;
  //    if ("".equals(newClValue))
  //    {
  //      isclSegId = msg.addSegment("D_DELETE", "IssueClassification");
  //      msg.addField("CLSF_OID", isclSegId, (String)clsfOidClValueMap.get(oldClValue));
  //      msg.addField("CL_VALUE", isclSegId, oldClValue);
  //    }
  //    else
  //    {
  //      isclSegId = msg.addSegment("D_UNKNOWN", "IssueClassification");
  //      msg.addField("CLSF_OID", isclSegId, (String)clsfOidClValueMap.get(newClValue));
  //      msg.addField("CL_VALUE", isclSegId, newClValue);
  //    }
  //    msg.setSegmentAttribute(isclSegId, "MATCH", "ISCL_MATCH_SET_PURP");
  //    msg.addField("INSTR_ID", isclSegId, instrId);
  //    msg.addField("INDUS_CL_SET_ID", isclSegId, "MHACTCLS");
  //    msg.addField("CLSF_PURP_TYP", isclSegId, "INDCLASS");
  //  }
  //  else
  //  {
  //    logger.error("Unable to get associated CLSF_OID for clValue=" + newClValue);
  //    return false;
  //  }
  //  return true;
  //}

}
