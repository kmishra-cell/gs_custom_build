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

public class CJavaMHISFTRSecCollType implements JavaRule
{
  private static Logger logger = Logger.getLogger("CJavaMHISFTRSecCollType");
  private static final HashMap<String, String> clsfOidClValueMap = new HashMap<String, String>();
  private static HashSet<String> instrClassDebtSet;
  private static HashSet<String> issTypeNonDebtSet;
  private static HashSet<String> instrClassEquitySet;

  static
  {
    clsfOidClValueMap.put("GOVS", "SFTRGOVS");
    clsfOidClValueMap.put("SUNS", "SFTRSUNS");
    clsfOidClValueMap.put("FIDE", "SFTRFIDE");
    clsfOidClValueMap.put("NFID", "SFTRNFID");
    clsfOidClValueMap.put("SEPR", "SFTRSEPR");
    clsfOidClValueMap.put("MEQU", "SFTRMEQU");
    clsfOidClValueMap.put("OTHR", "SFTROTHR");
    clsfOidClValueMap.put("OEQU", "SFTROEQU");

    instrClassEquitySet = new HashSet<String>();
    instrClassEquitySet.add("Equity");
    instrClassEquitySet.add("Index");

    instrClassDebtSet = new HashSet<String>();
    instrClassDebtSet.add("Corp");
    instrClassDebtSet.add("Pfd");
    instrClassDebtSet.add("Muni");
    instrClassDebtSet.add("Govt");
    instrClassDebtSet.add("Comdty");
    instrClassDebtSet.add("M-Mkt");
    instrClassDebtSet.add("Mtge");

    issTypeNonDebtSet = new HashSet<String>();
    issTypeNonDebtSet.add("WARRANTS");
    issTypeNonDebtSet.add("FUTURES");
    
  }

  public boolean initialize(String[] parameters)
  {
    logger.info("Initializing CJavaMHISFTRSecCollType Rule");
    return true;
  }

  public boolean process(XMLMessage msg, DatabaseObjectContainer dboc, ProcessorContext pContext, DatabaseAccess dbConn, NotificationCreator notfcn)
    throws GSException
  {
    String sqlQuery = "";
    String secOfInterest = "";
    String marketSector = "";
    String issType = "";
    String securityType = "";
    String industrySector = "";
    String industryGroup = "";
    String industrySubGroup = "";
    String currentSftrType = "";
    String lockCount = "";
    String derivedSFTRType = "";

    String instrClassification = "";


    logger.info("Processing rule CJavaMHISFTRSecCollType to generate SFTR Security Collateral Type");
    logger.info("code changed 2019-10-15 16:00");

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
    			" (select trim(cl_value) from ft_t_iscl iscl where indus_cl_set_id = 'BBMKTSCT' and iscl.instr_id = issu.instr_id and iscl.end_tms is null limit 1) marketSector," +
          " trim(iss_typ) issType," +
          " (select trim(cl_value) from ft_t_iscl iscl where indus_cl_set_id = 'BBSECTYP' and CLSF_PURP_TYP='BBISSTYP' and iscl.instr_id = issu.instr_id and iscl.end_tms is null limit 1) SecurityType," +
          " (select trim(cl_value) from ft_t_iscl iscl where indus_cl_set_id = 'BBINDSEC' and iscl.instr_id = issu.instr_id and iscl.end_tms is null limit 1) IndustrySector," +
          " (select trim(cl_value) from ft_t_iscl iscl where indus_cl_set_id = 'BBINDGRP' and iscl.instr_id = issu.instr_id and iscl.end_tms is null limit 1) IndustryGroup," +
          " (select trim(cl_value) from ft_t_iscl iscl where indus_cl_set_id = 'BBINDSGR' and iscl.instr_id = issu.instr_id and iscl.end_tms is null limit 1) industrySubGroup," +
          " (select 1 from ft_t_isgp isgp where  prt_purp_typ = 'INTEREST' and isgp.instr_id = issu.instr_id and isgp.end_tms is null limit 1) SOI," +
          " (select cl_value from ft_t_iscl iscl where indus_cl_set_id = 'SFTRTYPE' and iscl.instr_id = issu.instr_id and iscl.end_tms is null limit 1) currentSftrType" +
    			" from fT_T_issu issu where instr_id = '" + instrId + "' ";
    logger.info("sqlQuery is: " + sqlQuery);
    dbConn.setSQL(sqlQuery);
    dbConn.execute();

    if (!dbConn.isEndOfStream()) {
      marketSector = dbConn.getNextString();
      logger.info("marketSector: "+marketSector);
    }

    if (!dbConn.isEndOfStream()) {
      issType = dbConn.getNextString();
      logger.info("issType: "+issType);
    }

    if (!dbConn.isEndOfStream()) {
      securityType = dbConn.getNextString();
      logger.info("securityType: "+securityType);
    }

    if (!dbConn.isEndOfStream()) {
      industrySector = dbConn.getNextString();
      logger.info("industrySector: "+industrySector);
    }

    if (!dbConn.isEndOfStream()) {
      industryGroup = dbConn.getNextString();
      logger.info("industryGroup: "+industryGroup);
    }

    if (!dbConn.isEndOfStream()) {
      industrySubGroup = dbConn.getNextString();
      logger.info("industrySubGroup: "+industrySubGroup);
    }

    if (!dbConn.isEndOfStream()) {
      secOfInterest = dbConn.getNextString();
      logger.info("secOfInterest: "+secOfInterest);
    }
    
    if (!dbConn.isEndOfStream())
    {
    	currentSftrType = dbConn.getNextString();

    	if (currentSftrType == null) {
    		currentSftrType = "";
    	}
    	logger.info("currentSftrType: "+currentSftrType);
    }


    if (!"1".equals(secOfInterest))
    {
      logger.info("Exiting from rule as instrument is not in any SOI.");
      return true;
    }
    if (!"".equals(currentSftrType)) // There is an existing SFTRTYPE classification, so check if it has a lock applied
    {
      sqlQuery =  "select  count(*) from FT_T_ISCL iscl" +
        " inner join FT_T_OVRC ovrc on ovrc.OVR_REF_OID = iscl.INSTR_ID and ovrc.END_TMS is NULL and ovrc.OVR_TBL_KEY_TXT = 'ISS_CLSF_OID='||iscl.ISS_CLSF_OID||';'" +
        " where iscl.END_TMS is NULL and iscl.INDUS_CL_SET_ID = 'SFTRTYPE' and iscl.INSTR_ID = '" + instrId + "' ";
      logger.info("sqlQuery is: " + sqlQuery);
      dbConn.setSQL(sqlQuery);
      dbConn.execute();
      if (!dbConn.isEndOfStream()) {
        lockCount = dbConn.getNextString();
        logger.info("currentSftrType lockCount: "+lockCount);
        if (!"0".equals(lockCount))
        {
          logger.info("Exiting from rule as currentSftrType classification exists and has a lock applied.");
          return true;
        }
      }  
    }

    if (instrClassDebtSet.contains(marketSector) && !issTypeNonDebtSet.contains(issType))
    {
      instrClassification = "DEBT";
    }
    else
    {
      instrClassification = "NON-DEBT";
    }

    /* Consider debt type first, as these follow table rules */
    if ("DEBT".equals(instrClassification))
    {
      logger.info("DEBT type checks follow");
      sqlQuery = "select SFTR_TYPE from FT_T_SFTR1 where asset_type in ( '" + instrClassification + "') and " +
              "industry_sector in ('" + industrySector + "') and " +
              "industry_group in ('" + industryGroup + "','*') and " +
              "industry_subgroup in ('" + industrySubGroup + "','*')";
      logger.info("sqlQuery is: " + sqlQuery);
      dbConn.setSQL(sqlQuery);
      dbConn.execute();

      if (!dbConn.isEndOfStream())
      {
        derivedSFTRType = dbConn.getNextString();
        if (derivedSFTRType == null) {
          derivedSFTRType = "";
        }
      }
      if (!dbConn.isEndOfStream())
      {
        String listOfSFTRs = derivedSFTRType;
        while (!dbConn.isEndOfStream()) {
          listOfSFTRs = listOfSFTRs + ", " + dbConn.getNextString();
        }
        logger.error(" More then one matching records found in config table FT_T_SFTR1. Kindly correct the configuration. Values ->" + listOfSFTRs);
        return true;
      }
      logger.info("Derived Value for SFTR Collateral Type is " + derivedSFTRType + ", against previous value of " + currentSftrType);
      if (derivedSFTRType.equals(currentSftrType)) 
      {
        logger.info("New SFTR Type (" + derivedSFTRType + ") is the same as the existing SFTR Type ("+ currentSftrType +") - no change required");
        return true;
      }
    }
    else /* non debt types */
    {
      logger.info("NON-DEBT type checks follow");
      if ("Equity".equals(marketSector))
      {
        logger.info("Equity type checks follow");

        String isMajorIndexMember;
        /* look for major index - check for ISCL existence where INDUS_CL_SET_ID = 'MAININDEX' */
        /* <1> */
        sqlQuery = "select iscl.CL_VALUE from ft_t_ridf ridf " +
                "inner join FT_T_riss riss on riss.RLD_ISS_FEAT_ID = ridf.RLD_ISS_FEAT_ID and riss.END_TMS is null " +
                "inner join ft_t_iscl iscl on riss.INSTR_ID = iscl.instr_id and iscl.end_tms is null and iscl.INDUS_CL_SET_ID = 'MAININDX' " +
                "where ridf.REL_TYP  in ('MEMBER_OF') and ridf.END_TMS is null and ridf.instr_id = '" + instrId + "'";
        /* Set YES/NO flag */
        logger.info("sqlQuery is: " + sqlQuery);
        dbConn.setSQL(sqlQuery);
        dbConn.execute();
        if (dbConn.isEndOfStream()) {
          isMajorIndexMember = "NO";
          logger.info("Did not find MAININDX classification for parent instrument, so isMAjorIndexMember = 'NO'");
        } else {
          isMajorIndexMember = "YES";
          logger.info("Found MAININDX classification for parent instrument, so isMAjorIndexMember = 'YES'");
        }
        /* <2> */
        sqlQuery = "select SFTR_TYPE from FT_T_SFTR1 where ASSET_TYPE = 'NON-DEBT' and MARKET_SECTOR = 'Equity' and SECURITY_TYPE = '" + securityType + "' " +
                " and MAIN_INDEX = '" + isMajorIndexMember + "'";
        logger.info("sqlQuery is: " + sqlQuery);
        dbConn.setSQL(sqlQuery);
        dbConn.execute();

        if (!dbConn.isEndOfStream()) {
          derivedSFTRType = dbConn.getNextString();
          logger.info("derivedSFTRType: " + derivedSFTRType);
        }
        /* <3> */
        if ("".equals(derivedSFTRType))
        {
          logger.info("Did not find SFTRTYPE searching with MAIN INDEX test and SECURITY_TYPE, try INDUSTRY_SECTOR, INDUSTRY_GROUP and MAIN_INDEX next");
          sqlQuery = "select SFTR_TYPE from FT_T_SFTR1 where ASSET_TYPE = 'NON-DEBT' and MARKET_SECTOR = 'Equity' and INDUSTRY_SECTOR= '" + industrySector + "' " +
                  " and INDUSTRY_GROUP = '" + industryGroup + "' " +
                  " and MAIN_INDEX = '" + isMajorIndexMember + "'";
          logger.info("sqlQuery is: " + sqlQuery);
          dbConn.setSQL(sqlQuery);
          dbConn.execute();

          if (!dbConn.isEndOfStream()) {
            derivedSFTRType = dbConn.getNextString();
            logger.info("derivedSFTRType: " + derivedSFTRType);
          }
        }

        /* <4> */
        if ("".equals(derivedSFTRType))
        {
          logger.info("Did not find SFTRTYPE searching with INDUSTRY_SECTOR, INDUSTRY_GROUP and MAIN_INDEX, try INDUSTRY_SECTOR and MAIN_INDEX next");
          sqlQuery = "select SFTR_TYPE from FT_T_SFTR1 where ASSET_TYPE = 'NON-DEBT' and MARKET_SECTOR = 'Equity' and INDUSTRY_SECTOR= '" + industrySector + "' " +
                  " and MAIN_INDEX = '" + isMajorIndexMember + "'";
          logger.info("sqlQuery is: " + sqlQuery);
          dbConn.setSQL(sqlQuery);
          dbConn.execute();

          if (!dbConn.isEndOfStream()) {
            derivedSFTRType = dbConn.getNextString();
            logger.info("derivedSFTRType: " + derivedSFTRType);
          }
        }
      }
      else
      {
        /* Not equity */
        logger.info("NON-DEBT and non-Equity type checks follow");
        sqlQuery = "select SFTR_TYPE from FT_T_SFTR1 where ASSET_TYPE = 'NON-DEBT' and MARKET_SECTOR = '" + marketSector + "'" +
                " and SECURITY_TYPE = '" + issType + "'";
        logger.info("sqlQuery is: " + sqlQuery);
        dbConn.setSQL(sqlQuery);
        dbConn.execute();

        if (!dbConn.isEndOfStream()) {
          derivedSFTRType = dbConn.getNextString();
          logger.info("derivedSFTRType: " + derivedSFTRType);
        }
      }
    }
    logger.info("After searching through FT_T_SFTR1, derivedSFTRType: " + derivedSFTRType);



    logger.info("Derived Value for SFTR Collateral Type is " + derivedSFTRType + ", against previous value of " + currentSftrType);

    if ((!derivedSFTRType.equals(currentSftrType)) &&
      (!addDelISCLSegmentToMsg(msg, instrId, derivedSFTRType, currentSftrType)))
    {
      logger.info("Error Processing rule CJavaMHISFTRSecCollType to generate SFTR Collateral Type Classification Ends");
      return false;
    }
    logger.info("Processing rule CJavaMHISFTRSecCollType to generate SFTR Collateral Type Classification Ends");
    return true;
  }

  public boolean addDelISCLSegmentToMsg(XMLMessage msg, String instrId, String newClValue, String oldClValue)
  {
    if (("".equals(newClValue)) || (clsfOidClValueMap.get(newClValue) != null))
    {
      logger.info("Creating segment for ISCL to add SFTR Type Classification");
      SegmentId isclSegId;
      if ("".equals(newClValue))
      {
        isclSegId = msg.addSegment("D_DELETE", "IssueClassification");
        msg.addField("CLSF_OID", isclSegId, (String)clsfOidClValueMap.get(oldClValue));
        msg.addField("CL_VALUE", isclSegId, oldClValue);
      }
      else
      {
        isclSegId = msg.addSegment("D_UNKNOWN", "IssueClassification");
        msg.addField("CLSF_OID", isclSegId, (String)clsfOidClValueMap.get(newClValue));
        msg.addField("CL_VALUE", isclSegId, newClValue);
      }
      msg.setSegmentAttribute(isclSegId, "MATCH", "ISCL_MATCH_SET_PURP");
      msg.addField("INSTR_ID", isclSegId, instrId);
      msg.addField("INDUS_CL_SET_ID", isclSegId, "SFTRTYPE");
      msg.addField("CLSF_PURP_TYP", isclSegId, "SECUTYPE");
    }
    else
    {
      logger.error("Unable to get associated CLSF_OID for clValue=" + newClValue);
      return false;
    }
    return true;
  }
}
