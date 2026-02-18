<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.12">
<package-comment/>
<businessobject displayString="23 - v10 Optimised" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>false</alwaysPersist>
<clustered>false</clustered>
<comment id="1">v10 Optimised</comment>
<description id="2"/>
<endNode id="3">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="4"/>
<directJoin>false</directJoin>
<name id="5">Stop</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="6">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="7" type="java.util.HashSet">
<item id="8" type="com.j2fe.workflow.definition.Transition">
<name id="9">Y</name>
<source id="10">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="11"/>
<directJoin>false</directJoin>
<name id="12">Issuer null?</name>
<nodeHandler>com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandler>
<nodeHandlerClass id="13">com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandlerClass>
<parameters id="14" type="java.util.HashSet">
<item id="15" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="16">caseItem</name>
<stringValue id="17">Issuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="18" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="19">defaultItem</name>
<stringValue id="20">N</stringValue>
<type>CONSTANT</type>
</item>
<item id="21" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="22">nullTransition</name>
<stringValue id="23">Y</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="24" type="java.util.HashSet">
<item id="25" type="com.j2fe.workflow.definition.Transition">
<name id="26">goto-next</name>
<source id="27">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="28"/>
<directJoin>false</directJoin>
<name id="29">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="30">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="31" type="java.util.HashSet"/>
<targets id="32" type="java.util.HashSet">
<item idref="25" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="10"/>
</item>
</sources>
<targets id="33" type="java.util.HashSet">
<item id="34" type="com.j2fe.workflow.definition.Transition">
<name id="35">N</name>
<source idref="10"/>
<target id="36">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="37"/>
<directJoin>false</directJoin>
<name id="38">Select instrument Data</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="39">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="40" type="java.util.HashSet">
<item id="41" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="42">database</name>
<stringValue id="43">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="44" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="45">indexedResult</name>
<stringValue id="46">Instruments</stringValue>
<type>VARIABLE</type>
</item>
<item id="47" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="48">mappedParameters["1,2"]</name>
<stringValue id="49">Issuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="50" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="51">querySQL</name>
<objectValue id="52" type="java.lang.String">SELECT
    ISSU.INSTR_ID,
    (
        SELECT DISTINCT COLL_TYP
        FROM FT_T_ISLL
        WHERE INSTR_ID = ISSU.INSTR_ID
          AND COLL_TYP = 'Subordinated'
          AND START_TMS &lt;= current_timestamp
          AND (END_TMS IS NULL OR END_TMS &gt; current_timestamp)
        LIMIT 1
    ) AS SUBORDINATED,
    (
        SELECT INST_MNEM
        FROM FT_T_FRIP FRIP
        WHERE FINSRL_TYP = 'GUARNTOR'
          AND INSTR_ID = ISSU.INSTR_ID
          AND START_TMS &lt;= current_timestamp
          AND (END_TMS IS NULL OR END_TMS &gt; current_timestamp)
        LIMIT 1
    ) AS GUARANTOR,
    (
        SELECT RISS.INSTR_ID
        FROM FT_T_RISS RISS
        JOIN FT_T_RIDF RIDF ON RIDF.RLD_ISS_FEAT_ID = RISS.RLD_ISS_FEAT_ID
        WHERE RISS.ISS_PART_RL_TYP = 'UNDLYING'
          AND RIDF.REL_TYP = 'CreditLinked'
          AND RISS.INSTR_ID IS NOT NULL
          AND RIDF.INSTR_ID = ISSU.INSTR_ID
          AND RIDF.START_TMS &lt;= current_timestamp
          AND (RIDF.END_TMS IS NULL OR RIDF.END_TMS &gt; current_timestamp)
          AND RISS.START_TMS &lt;= current_timestamp
          AND (RISS.END_TMS IS NULL OR RISS.END_TMS &gt; current_timestamp)
        LIMIT 1
    ) AS CREDITLINKED,
    (
        SELECT COLL_TYP
        FROM FT_T_ISLL
        WHERE INSTR_ID = ISSU.INSTR_ID
          AND COLL_TYP = 'Secured'
          AND START_TMS &lt;= current_timestamp
          AND (END_TMS IS NULL OR END_TMS &gt; current_timestamp)
        LIMIT 1
    ) AS SECURED,
    (
        SELECT CL_VALUE
        FROM FT_T_ISCL
        WHERE INSTR_ID = ISSU.INSTR_ID
          AND INDUS_CL_SET_ID = 'MIZUNIQE'
          AND START_TMS &lt;= current_timestamp
          AND (END_TMS IS NULL OR END_TMS &gt; current_timestamp)
        LIMIT 1
    ) AS UNIQU,
    (
        SELECT ISGP.PRNT_ISS_GRP_OID
        FROM FT_T_ISGP ISGP
        JOIN FT_T_ISGR ISGR ON ISGP.PRNT_ISS_GRP_OID = ISGR.ISS_GRP_OID
        WHERE ISGP.INSTR_ID = ISSU.INSTR_ID
          AND GRP_NME = 'FCY'
          AND ISGP.START_TMS &lt;= current_timestamp
          AND (ISGP.END_TMS IS NULL OR ISGP.END_TMS &gt; current_timestamp)
          AND ISGR.START_TMS &lt;= current_timestamp
          AND (ISGR.END_TMS IS NULL OR ISGR.END_TMS &gt; current_timestamp)
        LIMIT 1
    ) AS FCY,
    CASE
        WHEN (SELECT COUNT(*) FROM FT_T_ISLL
              WHERE INSTR_ID = ISSU.INSTR_ID
                AND COLL_TYP IN ('Asset Backed', 'Mortgage Backed')
                AND START_TMS &lt;= current_timestamp
                AND (END_TMS IS NULL OR END_TMS &gt; current_timestamp)) = 0
        THEN NULL
        ELSE ISSU.SERIES_TYP
    END AS iseries,
    (
        SELECT CASE
            WHEN SUBSTRING(coll_grp_desc FROM 1 FOR 11) = 'Group Name-'
            THEN SUBSTRING(coll_grp_desc FROM 12 FOR POSITION(' ' IN SUBSTRING(coll_grp_desc FROM 12)))
            ELSE coll_grp_desc
        END
        FROM FT_T_ISLL
        WHERE INSTR_ID = ISSU.INSTR_ID
          AND COLL_TYP IN ('Asset Backed', 'Mortgage Backed')
          AND coll_grp_desc IS NOT NULL
          AND START_TMS &lt;= current_timestamp
          AND (END_TMS IS NULL OR END_TMS &gt; current_timestamp)
        LIMIT 1
    ) AS igroup
FROM FT_T_ISSU ISSU
WHERE ISSU.INSTR_ISSR_ID = ?
  AND EXISTS (
      SELECT 1
      FROM FT_T_ISTY ISTY
      WHERE ISTY.ISS_TYP = ISSU.ISS_TYP
        AND ISTY.PRNT_ISS_TYP = 'DEBT'
        AND ISTY.START_TMS &lt;= current_timestamp
        AND (ISTY.END_TMS IS NULL OR ISTY.END_TMS &gt; current_timestamp)
  )
  AND ISSU.START_TMS &lt;= current_timestamp
  AND (ISSU.END_TMS IS NULL OR ISSU.END_TMS &gt; current_timestamp)
  AND EXISTS (
      SELECT 1
      FROM FT_T_ISGP ISGP
      WHERE ISGP.INSTR_ID = ISSU.INSTR_ID
        AND ISGP.PRT_PURP_TYP = 'INTEREST'
        AND ISGP.PRNT_ISS_GRP_OID NOT IN (
            SELECT ISS_GRP_OID
            FROM FT_T_ISGR
            WHERE GRP_NME LIKE 'MHSC%'
        )
        AND ISGP.START_TMS &lt;= current_timestamp
        AND (ISGP.END_TMS IS NULL OR ISGP.END_TMS &gt; current_timestamp)
  )
  AND ISSU.INSTR_ID IN (
      SELECT INSTR_ID
      FROM FT_T_ISGP ISGP
      WHERE ISSU.INSTR_ID = ISGP.INSTR_ID
        AND ISGP.PRT_PURP_TYP = 'PRTFLIOC'
        AND ISGP.START_TMS &lt;= current_timestamp
        AND (ISGP.END_TMS IS NULL OR ISGP.END_TMS &gt; current_timestamp)
        AND ISGP.PRNT_ISS_GRP_OID IN (
            SELECT ISGP.PRNT_ISS_GRP_OID
            FROM FT_T_ISSU ISSU
            JOIN FT_T_ISGP ISGP ON ISSU.INSTR_ID = ISGP.INSTR_ID
            WHERE ISSU.ISS_TYP = 'PORT'
              AND ISSU.START_TMS &lt;= current_timestamp
              AND (ISSU.END_TMS IS NULL OR ISSU.END_TMS &gt; current_timestamp)
              AND EXISTS (
                  SELECT 1
                  FROM FT_T_ISST ISST
                  WHERE ISST.STAT_DEF_ID = 'MIZRECAL'
                    AND ISST.INSTR_ID = ISSU.INSTR_ID
                    AND STAT_CHAR_VAL_TXT = 'Y'
                    AND ISST.START_TMS &lt;= current_timestamp
                    AND (ISST.END_TMS IS NULL OR ISST.END_TMS &gt; current_timestamp)
              )
        )
  )
UNION
SELECT
    ISSU.INSTR_ID,
    (
        SELECT DISTINCT COLL_TYP
        FROM FT_T_ISLL
        WHERE INSTR_ID = ISSU.INSTR_ID
          AND COLL_TYP = 'Subordinated'
          AND START_TMS &lt;= current_timestamp
          AND (END_TMS IS NULL OR END_TMS &gt; current_timestamp)
        LIMIT 1
    ) AS SUBORDINATED,
    (
        SELECT INST_MNEM
        FROM FT_T_FRIP FRIP
        WHERE FINSRL_TYP = 'GUARNTOR'
          AND INSTR_ID = ISSU.INSTR_ID
          AND START_TMS &lt;= current_timestamp
          AND (END_TMS IS NULL OR END_TMS &gt; current_timestamp)
        LIMIT 1
    ) AS GUARANTOR,
    (
        SELECT RISS.INSTR_ID
        FROM FT_T_RISS RISS
        JOIN FT_T_RIDF RIDF ON RIDF.RLD_ISS_FEAT_ID = RISS.RLD_ISS_FEAT_ID
        WHERE RISS.ISS_PART_RL_TYP = 'UNDLYING'
          AND RIDF.REL_TYP = 'CreditLinked'
          AND RISS.INSTR_ID IS NOT NULL
          AND RIDF.INSTR_ID = ISSU.INSTR_ID
          AND RIDF.START_TMS &lt;= current_timestamp
          AND (RIDF.END_TMS IS NULL OR RIDF.END_TMS &gt; current_timestamp)
          AND RISS.START_TMS &lt;= current_timestamp
          AND (RISS.END_TMS IS NULL OR RISS.END_TMS &gt; current_timestamp)
        LIMIT 1
    ) AS CREDITLINKED,
    (
        SELECT COLL_TYP
        FROM FT_T_ISLL
        WHERE INSTR_ID = ISSU.INSTR_ID
          AND COLL_TYP = 'Secured'
          AND START_TMS &lt;= current_timestamp
          AND (END_TMS IS NULL OR END_TMS &gt; current_timestamp)
        LIMIT 1
    ) AS SECURED,
    (
        SELECT CL_VALUE
        FROM FT_T_ISCL
        WHERE INSTR_ID = ISSU.INSTR_ID
          AND INDUS_CL_SET_ID = 'MIZUNIQE'
          AND START_TMS &lt;= current_timestamp
          AND (END_TMS IS NULL OR END_TMS &gt; current_timestamp)
        LIMIT 1
    ) AS UNIQU,
    (
        SELECT ISGP.PRNT_ISS_GRP_OID
        FROM FT_T_ISGP ISGP
        JOIN FT_T_ISGR ISGR ON ISGP.PRNT_ISS_GRP_OID = ISGR.ISS_GRP_OID
        WHERE ISGP.INSTR_ID = ISSU.INSTR_ID
          AND GRP_NME = 'FCY'
          AND ISGP.START_TMS &lt;= current_timestamp
          AND (ISGP.END_TMS IS NULL OR ISGP.END_TMS &gt; current_timestamp)
          AND ISGR.START_TMS &lt;= current_timestamp
          AND (ISGR.END_TMS IS NULL OR ISGR.END_TMS &gt; current_timestamp)
        LIMIT 1
    ) AS FCY,
    CASE
        WHEN (SELECT COUNT(*) FROM FT_T_ISLL
              WHERE INSTR_ID = ISSU.INSTR_ID
                AND COLL_TYP IN ('Asset Backed', 'Mortgage Backed')
                AND START_TMS &lt;= current_timestamp
                AND (END_TMS IS NULL OR END_TMS &gt; current_timestamp)) = 0
        THEN NULL
        ELSE ISSU.SERIES_TYP
    END AS iseries,
    (
        SELECT CASE
            WHEN SUBSTRING(coll_grp_desc FROM 1 FOR 11) = 'Group Name-'
            THEN SUBSTRING(coll_grp_desc FROM 12 FOR POSITION(' ' IN SUBSTRING(coll_grp_desc FROM 12)))
            ELSE coll_grp_desc
        END
        FROM FT_T_ISLL
        WHERE INSTR_ID = ISSU.INSTR_ID
          AND COLL_TYP IN ('Asset Backed', 'Mortgage Backed')
          AND coll_grp_desc IS NOT NULL
          AND START_TMS &lt;= current_timestamp
          AND (END_TMS IS NULL OR END_TMS &gt; current_timestamp)
        LIMIT 1
    ) AS igroup
FROM FT_T_ISSU ISSU
WHERE ISSU.INSTR_ISSR_ID = ?
  AND EXISTS (
      SELECT 1
      FROM FT_T_ISTY ISTY
      WHERE ISTY.ISS_TYP = ISSU.ISS_TYP
        AND ISTY.PRNT_ISS_TYP = 'DEBT'
        AND ISTY.START_TMS &lt;= current_timestamp
        AND (ISTY.END_TMS IS NULL OR ISTY.END_TMS &gt; current_timestamp)
  )
  AND ISSU.START_TMS &lt;= current_timestamp
  AND (ISSU.END_TMS IS NULL OR ISSU.END_TMS &gt; current_timestamp)
  AND EXISTS (
      SELECT 1
      FROM FT_T_ISGP ISGP
      WHERE ISGP.INSTR_ID = ISSU.INSTR_ID
        AND ISGP.PRT_PURP_TYP = 'INTEREST'
        AND ISGP.PRNT_ISS_GRP_OID NOT IN (
            SELECT ISS_GRP_OID
            FROM FT_T_ISGR
            WHERE GRP_NME LIKE 'MHSC%'
        )
        AND ISGP.START_TMS &lt;= current_timestamp
        AND (ISGP.END_TMS IS NULL OR ISGP.END_TMS &gt; current_timestamp)
  )
  AND (
      SELECT INSTR_ID
      FROM FT_T_ISGP ISGP
      WHERE ISGP.INSTR_ID = ISSU.INSTR_ID
        AND ISGP.PRT_PURP_TYP = 'PRTFLIOC'
        AND ISGP.START_TMS &lt;= current_timestamp
        AND (ISGP.END_TMS IS NULL OR ISGP.END_TMS &gt; current_timestamp)
      LIMIT 1
  ) IS NULL</objectValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="53" type="java.util.HashSet">
<item idref="34" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="54" type="java.util.HashSet">
<item id="55" type="com.j2fe.workflow.definition.Transition">
<name id="56">nothing-found</name>
<source idref="36"/>
<target id="57">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="58"/>
<directJoin>false</directJoin>
<name id="59">Delete Portfolio Ratings</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="60">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="61" type="java.util.HashSet">
<item id="62" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="63">database</name>
<stringValue id="64">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="65" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="66">indexedParameters[0]</name>
<stringValue id="67">Issuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="68" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="69">querySQL</name>
<objectValue id="70" type="java.lang.String">delete from ft_t_isrt isrt where exists ( select instr_id from ft_t_isgp isgp where isrt.INSTR_ID = ISGP.INSTR_ID AND ISGP.PRT_PURP_TYP = 'PRTFLIOC' AND ISGP.START_TMS &lt;= current_timestamp AND (ISGP.END_TMS IS NULL OR ISGP.END_TMS &gt; current_timestamp) AND ISGP.PRNT_ISS_GRP_OID IN ( SELECT ISGP.PRNT_ISS_GRP_OID FROM FT_T_ISSU ISSU, FT_T_ISGP ISGP WHERE ISSU.ISS_TYP = 'PORT' AND ISSU.INSTR_ID = ISGP.INSTR_ID and issu.instr_issr_id = ? AND ISSU.START_TMS &lt;= current_timestamp AND (ISSU.END_TMS IS NULL OR ISSU.END_TMS &gt; current_timestamp) AND EXISTS (SELECT 1 FROM FT_T_ISST ISST WHERE ISST.STAT_DEF_ID = 'MIZRECAL' AND ISST.INSTR_ID = ISSU.INSTR_ID AND STAT_CHAR_VAL_TXT= 'Y' AND ISST.START_TMS &lt;= current_timestamp AND (ISST.END_TMS IS NULL OR ISST.END_TMS &gt; current_timestamp)) ) ) and current_timestamp between isrt.start_tms and coalesce(isrt.end_tms, current_timestamp+ INTERVAL '1 day') and current_timestamp between isrt.rtng_eff_tms and coalesce(isrt.sys_eff_end_tms, current_timestamp+ INTERVAL '1 day') and orig_data_prov_id in ( 'DERIVED', 'S1', 'M1', 'F1', 'J1', 'S2', 'M2', 'F2', 'J2', 'S3', 'M3', 'F3', 'J3', 'NR')</objectValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="71" type="java.util.HashSet">
<item idref="55" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="72" type="java.util.HashSet">
<item id="73" type="com.j2fe.workflow.definition.Transition">
<name id="74">goto-next</name>
<source idref="57"/>
<target id="75">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="76"/>
<directJoin>false</directJoin>
<name id="77">Delete Portfolio Participants</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="78">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="79" type="java.util.HashSet">
<item id="80" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="81">database</name>
<stringValue id="82">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="83" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="84">indexedParameters[0]</name>
<stringValue id="85">Issuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="86" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="87">querySQL</name>
<stringValue id="88">update ft_t_isgp isgp&#13;
set end_tms = current_timestamp, last_chg_tms = current_timestamp, last_chg_usr_id = 'CalculatePortfolio'&#13;
where ISGP.PRT_PURP_TYP = 'PRTFLIOC'&#13;
AND ISGP.START_TMS &lt;= current_timestamp AND (ISGP.END_TMS IS NULL OR ISGP.END_TMS &gt; current_timestamp)&#13;
AND ISGP.PRNT_ISS_GRP_OID IN (&#13;
SELECT ISGP.PRNT_ISS_GRP_OID FROM FT_T_ISSU ISSU, FT_T_ISGP ISGP WHERE ISSU.ISS_TYP = 'PORT' &#13;
AND ISSU.INSTR_ID = ISGP.INSTR_ID&#13;
and issu.instr_issr_id =  ?&#13;
AND ISSU.START_TMS &lt;= current_timestamp AND (ISSU.END_TMS IS NULL OR ISSU.END_TMS &gt; current_timestamp)&#13;
AND EXISTS (SELECT 1 FROM FT_T_ISST ISST WHERE ISST.STAT_DEF_ID = 'MIZRECAL' AND ISST.INSTR_ID = ISSU.INSTR_ID AND STAT_CHAR_VAL_TXT= 'Y'&#13;
AND ISST.START_TMS &lt;= current_timestamp AND (ISST.END_TMS IS NULL OR ISST.END_TMS &gt; current_timestamp))&#13;
)</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="89" type="java.util.HashSet">
<item idref="73" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="90" type="java.util.HashSet">
<item id="91" type="com.j2fe.workflow.definition.Transition">
<name id="92">goto-next</name>
<source idref="75"/>
<target idref="3"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item id="93" type="com.j2fe.workflow.definition.Transition">
<name id="94">rows-found</name>
<source idref="36"/>
<target id="95">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="96">Automatically generated</description>
<directJoin>false</directJoin>
<name id="97">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="98">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="99" type="java.util.HashSet">
<item id="100" type="com.j2fe.workflow.definition.Transition">
<name id="101">goto-next</name>
<source id="102">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="103"/>
<directJoin>false</directJoin>
<name id="104">Insert ISGP for publishing</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="105">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="106" type="java.util.HashSet">
<item id="107" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="108">database</name>
<stringValue id="109">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="110" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="111">indexedParameters[0]</name>
<stringValue id="112">DeleteissueId</stringValue>
<type>VARIABLE</type>
</item>
<item id="113" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="114">indexedParameters[1]</name>
<stringValue id="115">DeleteissueId</stringValue>
<type>VARIABLE</type>
</item>
<item id="116" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="117">querySQL</name>
<stringValue id="118">Insert into ft_t_isgp (ISGP_OID, PRNT_ISS_GRP_OID, INSTR_ID, PRT_PURP_TYP, START_TMS, LAST_CHG_TMS, LAST_CHG_USR_ID) 
select new_oid(),  'ISGR000011', ?, 'PRTFLIOC', current_timestamp, current_timestamp, 'CalculatePortfolio' from dual
where not exists (select 1 from ft_t_isgp where prnt_iss_grp_oid = 'ISGR000011' and instr_id = ? and prt_purp_typ = 'PRTFLIOC' and start_tms &lt;= current_timestamp and (end_tms is null or end_tms &gt; current_timestamp))</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="119" type="java.util.HashSet">
<item id="120" type="com.j2fe.workflow.definition.Transition">
<name id="121">goto-next</name>
<source id="122">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="123"/>
<directJoin>false</directJoin>
<name id="124">Database Statement (Standard)</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="125">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="126" type="java.util.HashSet">
<item id="127" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="128">database</name>
<stringValue id="129">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="130" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="131">indexedParameters[0]</name>
<stringValue id="132">DeleteissueId</stringValue>
<type>VARIABLE</type>
</item>
<item id="133" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="134">querySQL</name>
<stringValue id="135">update ft_t_isgp set end_tms = current_timestamp, last_chg_tms = current_timestamp, last_chg_usr_id = 'CalculatePortfolio'&#13;
where instr_id = ?&#13;
and prt_purp_typ = 'PRTFLIOC'&#13;
and start_tms &lt;= current_timestamp and (end_tms is null or end_tms &gt; current_timestamp)</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="136" type="java.util.HashSet">
<item id="137" type="com.j2fe.workflow.definition.Transition">
<name id="138">goto-next</name>
<source id="139">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="140"/>
<directJoin>false</directJoin>
<name id="141">Delete Rating</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="142">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="143" type="java.util.HashSet">
<item id="144" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="145">database</name>
<stringValue id="146">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="147" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="148">indexedParameters[0]</name>
<stringValue id="149">DeleteissueId</stringValue>
<type>VARIABLE</type>
</item>
<item id="150" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="151">querySQL</name>
<stringValue id="152">delete from ft_t_isrt isrt where instr_id = ?&#13;
--RDD-268 start&#13;
and current_timestamp between isrt.start_tms and coalesce(isrt.end_tms, current_timestamp+INTERVAL '1 day')&#13;
and current_timestamp between isrt.rtng_eff_tms and coalesce(isrt.sys_eff_end_tms, current_timestamp+INTERVAL '1 day')&#13;
--RDD-268 end&#13;
and orig_data_prov_id = 'DERIVED'</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="153" type="java.util.HashSet">
<item id="154" type="com.j2fe.workflow.definition.Transition">
<name id="155">rows-found</name>
<source id="156">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="157"/>
<directJoin>false</directJoin>
<name id="158">Check if instrument having multiple Credit Linked</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="159">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="160" type="java.util.HashSet">
<item id="161" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="162">database</name>
<stringValue id="163">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="164" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="165">indexedParameters[0]</name>
<stringValue id="166">DeleteissueId</stringValue>
<type>VARIABLE</type>
</item>
<item id="167" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="168">querySQL</name>
<stringValue id="169">SELECT RISS.INSTR_ID FROM FT_T_RISS RISS, FT_T_RIDF RIDF &#13;
WHERE RISS.ISS_PART_RL_TYP = 'UNDLYING' AND RIDF.REL_TYP = 'CreditLinked'&#13;
AND RIDF.RLD_ISS_FEAT_ID = RISS.RLD_ISS_FEAT_ID AND RISS.INSTR_ID IS NOT NULL&#13;
AND RIDF.INSTR_ID = ?&#13;
AND RIDF.START_TMS &lt;= current_timestamp AND (RIDF.END_TMS IS NULL OR RIDF.END_TMS &gt; current_timestamp)&#13;
AND RISS.START_TMS &lt;= current_timestamp AND (RISS.END_TMS IS NULL OR RISS.END_TMS &gt; current_timestamp)&#13;
group by riss.instr_id having count(riss.instr_id) &gt; 1</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="170" type="java.util.HashSet">
<item id="171" type="com.j2fe.workflow.definition.Transition">
<name id="172">goto-next</name>
<source id="173">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="174"/>
<directJoin>false</directJoin>
<name id="175">Delete InstrumentId</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="176">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="177" type="java.util.HashSet">
<item id="178" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="179">statements</name>
<stringValue id="180">String issueId = input[0];</stringValue>
<type>CONSTANT</type>
</item>
<item id="181" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="182">["input"]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="183">variables["input"]</name>
<stringValue id="184">Instument</stringValue>
<type>VARIABLE</type>
</item>
<item id="185" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="186">["issueId"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="187">variables["issueId"]</name>
<stringValue id="188">DeleteissueId</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="189" type="java.util.HashSet">
<item id="190" type="com.j2fe.workflow.definition.Transition">
<name id="191">loop</name>
<source id="192">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="193"/>
<directJoin>false</directJoin>
<name id="194">Instrument Loop</name>
<nodeHandler>com.j2fe.workflow.handler.impl.ForEach</nodeHandler>
<nodeHandlerClass id="195">com.j2fe.workflow.handler.impl.ForEach</nodeHandlerClass>
<parameters id="196" type="java.util.HashSet">
<item id="197" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="198">counter</name>
<stringValue id="199">LoopCounter</stringValue>
<type>VARIABLE</type>
</item>
<item id="200" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="201">counter</name>
<stringValue id="202">LoopCounter</stringValue>
<type>VARIABLE</type>
</item>
<item id="203" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="204">input</name>
<stringValue id="205">Instruments</stringValue>
<type>VARIABLE</type>
</item>
<item id="206" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="207">output</name>
<stringValue id="208">Instument</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="209" type="java.util.HashSet">
<item id="210" type="com.j2fe.workflow.definition.Transition">
<name id="211">ToSplit</name>
<source idref="95"/>
<target idref="192"/>
</item>
</sources>
<targets id="212" type="java.util.HashSet">
<item id="213" type="com.j2fe.workflow.definition.Transition">
<name id="214">end-loop</name>
<source idref="192"/>
<target id="215">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="216"/>
<directJoin>false</directJoin>
<name id="217">Select Portfolio</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="218">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="219" type="java.util.HashSet">
<item id="220" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="221">database</name>
<stringValue id="222">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="223" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="224">indexedParameters[0]</name>
<stringValue id="225">Issuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="226" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="227">indexedResult</name>
<stringValue id="228">IssuerPortfolio</stringValue>
<type>VARIABLE</type>
</item>
<item id="229" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="230">querySQL</name>
<stringValue id="231">select prnt_iss_grp_oid, instr_id from ft_t_isgp isgp where instr_id in (&#13;
select instr_id from ft_t_issu where instr_issr_id = ?&#13;
and iss_typ = 'PORT'  and start_tms &lt;=current_timestamp and (end_tms is null or end_tms&gt;current_timestamp))&#13;
and prt_purp_typ = 'PRTFLIOP' and start_tms &lt;=current_timestamp and (end_tms is null or end_tms&gt;current_timestamp)&#13;
and prnt_iss_grp_oid in (select prnt_iss_grp_oid from ft_t_isgp where prt_purp_typ = 'PRTFLIOC' and start_tms &lt;=current_timestamp and (end_tms is null or end_tms&gt;current_timestamp))&#13;
and exists (SELECT 1 FROM FT_T_ISST ISST WHERE ISST.STAT_DEF_ID = 'MIZRECAL' AND ISST.INSTR_ID = isgp.instr_id and stat_char_val_txt = 'Y'&#13;
AND ISST.START_TMS &lt;= current_timestamp AND (ISST.END_TMS IS NULL OR ISST.END_TMS &gt; current_timestamp))</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="232" type="java.util.HashSet">
<item idref="213" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="233" type="java.util.HashSet">
<item id="234" type="com.j2fe.workflow.definition.Transition">
<name id="235">nothing-found</name>
<source idref="215"/>
<target idref="3"/>
</item>
<item id="236" type="com.j2fe.workflow.definition.Transition">
<name id="237">rows-found</name>
<source idref="215"/>
<target id="238">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="239">Automatically generated</description>
<directJoin>false</directJoin>
<name id="240">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="241">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="242" type="java.util.HashSet">
<item id="243" type="com.j2fe.workflow.definition.Transition">
<name id="244">goto-next</name>
<source id="245">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="246"/>
<directJoin>false</directJoin>
<name id="247">Calculate Rating</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="248">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="249" type="java.util.HashSet">
<item id="250" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="251">["Issue"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="252">input["Issue"]</name>
<stringValue id="253">issueId</stringValue>
<type>VARIABLE</type>
</item>
<item id="254" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="255">["Issuer"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="256">input["Issuer"]</name>
<stringValue id="257">Issuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="258" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="259">["PortfolioOid"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="260">input["PortfolioOid"]</name>
<stringValue id="261">isgpOId</stringValue>
<type>VARIABLE</type>
</item>
<item id="262" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="263">name</name>
<stringValue id="264">CalculateDeriveRating</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="265" type="java.util.HashSet">
<item id="266" type="com.j2fe.workflow.definition.Transition">
<name id="267">goto-next</name>
<source id="268">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="269"/>
<directJoin>false</directJoin>
<name id="270">Insert ISGP for publishing</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="271">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="272" type="java.util.HashSet">
<item id="273" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="274">database</name>
<stringValue id="275">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="276" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="277">indexedParameters[0]</name>
<stringValue id="278">isgpOId</stringValue>
<type>VARIABLE</type>
</item>
<item id="279" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="280">querySQL</name>
<stringValue id="281">Insert into ft_t_isgp (ISGP_OID, PRNT_ISS_GRP_OID, INSTR_ID, PRT_PURP_TYP, START_TMS, LAST_CHG_TMS, LAST_CHG_USR_ID) &#13;
select new_oid(),  'ISGR000011', issu.instr_id, 'PRTFLIOC', current_timestamp, current_timestamp, 'CalculatePortfolio'&#13;
from ft_t_issu issu, ft_t_isgp isgp1 where &#13;
isgp1.instr_id = issu.instr_id and isgp1.prnt_iss_grp_oid = ? and isgp1.start_tms &lt;= current_timestamp &#13;
and (isgp1.end_tms is null or isgp1.end_tms &gt; current_timestamp) and issu.iss_typ != 'PORT' and isgp1.prt_purp_typ = 'PRTFLIOC'&#13;
and not exists (select 1 from ft_t_isgp isgp where prnt_iss_grp_oid = 'ISGR000011' and isgp.instr_id = issu.instr_id and prt_purp_typ = 'PRTFLIOC' and start_tms &lt;= current_timestamp and (end_tms is null or end_tms &gt; current_timestamp))</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="282" type="java.util.HashSet">
<item id="283" type="com.j2fe.workflow.definition.Transition">
<name id="284">goto-next</name>
<source id="285">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="286"/>
<directJoin>false</directJoin>
<name id="287">Array to single</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="288">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="289" type="java.util.HashSet">
<item id="290" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="291">statements</name>
<stringValue id="292">String isgpOId = input[0];&#13;
String issueId = input[1];</stringValue>
<type>CONSTANT</type>
</item>
<item id="293" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="294">["input"]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="295">variables["input"]</name>
<stringValue id="296">PortfolioInfo</stringValue>
<type>VARIABLE</type>
</item>
<item id="297" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="298">variables["isgpOId"]</name>
<stringValue id="299">isgpOId</stringValue>
<type>VARIABLE</type>
</item>
<item id="300" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="301">["issueId"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="302">variables["issueId"]</name>
<stringValue id="303">issueId</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="304" type="java.util.HashSet">
<item id="305" type="com.j2fe.workflow.definition.Transition">
<name id="306">loop</name>
<source id="307">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="308"/>
<directJoin>false</directJoin>
<name id="309">Portfolio Loop</name>
<nodeHandler>com.j2fe.workflow.handler.impl.ForEach</nodeHandler>
<nodeHandlerClass id="310">com.j2fe.workflow.handler.impl.ForEach</nodeHandlerClass>
<parameters id="311" type="java.util.HashSet">
<item id="312" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="313">counter</name>
<stringValue id="314">LoopCounter1</stringValue>
<type>VARIABLE</type>
</item>
<item id="315" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="316">counter</name>
<stringValue id="317">LoopCounter1</stringValue>
<type>VARIABLE</type>
</item>
<item id="318" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="319">input</name>
<stringValue id="320">IssuerPortfolio</stringValue>
<type>VARIABLE</type>
</item>
<item id="321" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="322">output</name>
<stringValue id="323">PortfolioInfo</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="324" type="java.util.HashSet">
<item id="325" type="com.j2fe.workflow.definition.Transition">
<name id="326">ToSplit</name>
<source idref="238"/>
<target idref="307"/>
</item>
</sources>
<targets id="327" type="java.util.HashSet">
<item id="328" type="com.j2fe.workflow.definition.Transition">
<name id="329">end-loop</name>
<source idref="307"/>
<target idref="3"/>
</item>
<item idref="305" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="285"/>
</item>
</sources>
<targets id="330" type="java.util.HashSet">
<item idref="283" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="268"/>
</item>
</sources>
<targets id="331" type="java.util.HashSet">
<item idref="266" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="245"/>
</item>
</sources>
<targets id="332" type="java.util.HashSet">
<item idref="243" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="238"/>
</item>
<item idref="236" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="333" type="java.util.HashSet">
<item idref="325" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</target>
</item>
</targets>
<type>XORSPLIT</type>
</target>
</item>
<item idref="190" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="173"/>
</item>
</sources>
<targets id="334" type="java.util.HashSet">
<item idref="171" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="156"/>
</item>
</sources>
<targets id="335" type="java.util.HashSet">
<item id="336" type="com.j2fe.workflow.definition.Transition">
<name id="337">nothing-found</name>
<source idref="156"/>
<target id="338">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="339"/>
<directJoin>false</directJoin>
<name id="340">Select Existing Portfolio Query</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="341">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="342" type="java.util.HashSet">
<item id="343" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="344">statements</name>
<objectValue id="345" type="java.lang.String">String subordinated = input[1];
String guarantor = input[2];
String credit = input[3];
String secured = input[4];
String uniq = input[5];
String fcy = input[6];
String iseries = input[7];
String igroup = input[8];

String sqlPortfolio = "SELECT INSTR_ID, PRNT_ISS_GRP_OID from (SELECT ISSU.INSTR_ID, ISGP.PRNT_ISS_GRP_OID,"
				+ " (SELECT COLL_TYP FROM FT_T_ISLL WHERE INSTR_ID = ISSU.INSTR_ID AND COLL_TYP = 'Subordinated' AND START_TMS &lt;= CURRENT_TIMESTAMP AND (END_TMS IS NULL OR END_TMS &gt; CURRENT_TIMESTAMP)) SUBORDINATED,"
				+ " (SELECT INST_MNEM FROM FT_T_FINS FINS"
				+ " WHERE EXISTS(SELECT 1 FROM FT_T_FINR WHERE FINSRL_TYP = 'GUARNTOR' AND INST_MNEM = FINS.INST_MNEM AND START_TMS &lt;= CURRENT_TIMESTAMP AND (END_TMS IS NULL OR END_TMS &gt; CURRENT_TIMESTAMP))"
				+ " AND EXISTS(SELECT 1 FROM FT_T_FRIP WHERE INST_MNEM = FINS.INST_MNEM AND INSTR_ID = ISSU.INSTR_ID AND START_TMS &lt;= CURRENT_TIMESTAMP AND (END_TMS IS NULL OR END_TMS &gt; CURRENT_TIMESTAMP))"
				+ " AND START_TMS &lt;= CURRENT_TIMESTAMP AND (END_TMS IS NULL OR END_TMS &gt; CURRENT_TIMESTAMP)) GUARANTOR,"
				+ " (SELECT RISS.INSTR_ID FROM FT_T_RISS RISS, FT_T_RIDF RIDF WHERE RISS.ISS_PART_RL_TYP = 'UNDLYING' AND RIDF.REL_TYP = 'CreditLinked' "
				+ " AND RIDF.RLD_ISS_FEAT_ID = RISS.RLD_ISS_FEAT_ID AND RISS.INSTR_ID IS NOT NULL AND RIDF.INSTR_ID = ISSU.INSTR_ID"
				+ " AND RIDF.START_TMS &lt;= CURRENT_TIMESTAMP AND (RIDF.END_TMS IS NULL OR RIDF.END_TMS &gt; CURRENT_TIMESTAMP)"
				+ " AND RISS.START_TMS &lt;= CURRENT_TIMESTAMP AND (RISS.END_TMS IS NULL OR RISS.END_TMS &gt; CURRENT_TIMESTAMP)) CREDIT_LINKED,"
				+ " (SELECT COLL_TYP FROM FT_T_ISLL WHERE INSTR_ID = ISSU.INSTR_ID AND COLL_TYP = 'Secured' AND START_TMS &lt;= CURRENT_TIMESTAMP AND (END_TMS IS NULL OR END_TMS &gt; CURRENT_TIMESTAMP)) SECURED,"
				+ " (SELECT CL_VALUE FROM FT_T_ISCL WHERE INSTR_ID = ISSU.INSTR_ID AND INDUS_CL_SET_ID= 'MIZUNIQE' AND START_TMS &lt;= CURRENT_TIMESTAMP AND (END_TMS IS NULL OR END_TMS &gt; CURRENT_TIMESTAMP)) UNIQ,"
				+ " (SELECT ISGP.PRNT_ISS_GRP_OID FROM FT_T_ISGP ISGP, FT_T_ISGR ISGR"
				+ " WHERE ISGP.PRNT_ISS_GRP_OID = ISGR.ISS_GRP_OID AND ISGP.INSTR_ID = ISSU.INSTR_ID AND GRP_nme = 'FCY'"
				+ " AND ISGP.START_TMS &lt;= CURRENT_TIMESTAMP AND (ISGP.END_TMS IS NULL OR ISGP.END_TMS &gt; CURRENT_TIMESTAMP)"
				+ " AND ISGR.START_TMS &lt;= CURRENT_TIMESTAMP AND (ISGR.END_TMS IS NULL OR ISGR.END_TMS &gt; CURRENT_TIMESTAMP)) AS FCY,"
				+ " issu.series_typ iseries,"
				+ " (SELECT coll_grp_desc FROM FT_T_ISLL WHERE INSTR_ID = ISSU.INSTR_ID AND COLL_TYP = 'Mortgage Backed' and coll_grp_desc is not null"
				+ " AND START_TMS &lt;= CURRENT_TIMESTAMP AND (END_TMS IS NULL OR END_TMS &gt; CURRENT_TIMESTAMP)) AS igroup"
				+ " FROM FT_T_ISSU ISSU, FT_T_ISGP ISGP "
				+ " WHERE ISSU.ISS_TYP = 'PORT' "
				+ " AND ISSU.INSTR_ID = ISGP.INSTR_ID "
				+ " AND ISGP.PRT_PURP_TYP = 'PRTFLIOP'"
				+ " AND ISGP.START_TMS &lt;= CURRENT_TIMESTAMP AND (ISGP.END_TMS IS NULL OR ISGP.END_TMS &gt; CURRENT_TIMESTAMP)"
				+ " AND ISSU.INSTR_ISSR_ID = '"
				+ Issuer
				+ "'"
				+ " AND ISSU.START_TMS &lt;=CURRENT_TIMESTAMP AND (ISSU.END_TMS IS NULL OR ISSU.END_TMS &gt; CURRENT_TIMESTAMP)) As foo where 1=1";

		if (subordinated == null) {
			sqlPortfolio = sqlPortfolio + " AND SUBORDINATED IS NULL ";
		} else {
			sqlPortfolio = sqlPortfolio + " AND SUBORDINATED = 'Subordinated'";
		}

		if (null == guarantor) {
			sqlPortfolio = sqlPortfolio + " AND GUARANTOR IS NULL ";
		} else {
			sqlPortfolio = sqlPortfolio + " AND GUARANTOR = '" + guarantor+ "'";
		}

		if (null == credit) {
			sqlPortfolio = sqlPortfolio + " AND CREDIT_LINKED IS NULL ";
		} else {
			sqlPortfolio = sqlPortfolio + " AND CREDIT_LINKED = '" + credit+ "'";
		}

		if (null == secured) {
			sqlPortfolio = sqlPortfolio + " AND SECURED IS NULL ";
		} else {
			sqlPortfolio = sqlPortfolio + " AND SECURED = 'Secured'";
		}
		if (null == uniq) {
			sqlPortfolio = sqlPortfolio + " AND UNIQ IS NULL ";
		} else {
			sqlPortfolio = sqlPortfolio + " AND UNIQ = '" + uniq + "'";
		}
		if (null == fcy) {
			sqlPortfolio = sqlPortfolio + " AND FCY IS NULL ";
		} else {
			sqlPortfolio = sqlPortfolio + " AND FCY = '" + fcy + "'";
		}
		if (null == iseries ) {
			sqlPortfolio = sqlPortfolio + " AND ISERIES IS NULL ";
		} else {
			sqlPortfolio = sqlPortfolio + " AND ISERIES = '" + iseries + "'";
		}
		if (null == igroup) {
			sqlPortfolio = sqlPortfolio + " AND IGROUP IS NULL ";
		} else {
			sqlPortfolio = sqlPortfolio + " AND IGROUP = '" + igroup + "'";
		}

String issueId = input[0];</objectValue>
<type>CONSTANT</type>
</item>
<item id="346" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="347">["Issuer"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="348">variables["Issuer"]</name>
<stringValue id="349">Issuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="350" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="351">["input"]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="352">variables["input"]</name>
<stringValue id="353">Instument</stringValue>
<type>VARIABLE</type>
</item>
<item id="354" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="355">variables["issueId"]</name>
<stringValue id="356">issueId</stringValue>
<type>VARIABLE</type>
</item>
<item id="357" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="358">["sqlPortfolio"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="359">variables["sqlPortfolio"]</name>
<stringValue id="360">sqlPortfolio</stringValue>
<type>VARIABLE</type>
</item>
<item id="361" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="362">variables["uniq"]</name>
<stringValue id="363">uniq</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="364" type="java.util.HashSet">
<item idref="336" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="365" type="java.util.HashSet">
<item id="366" type="com.j2fe.workflow.definition.Transition">
<name id="367">goto-next</name>
<source idref="338"/>
<target id="368">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="369"/>
<directJoin>false</directJoin>
<name id="370">Database Select (Xor Split)</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="371">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="372" type="java.util.HashSet">
<item id="373" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="374">database</name>
<stringValue id="375">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="376" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="377">indexedResult</name>
<stringValue id="378">ExistingPortfolio</stringValue>
<type>VARIABLE</type>
</item>
<item id="379" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="380">querySQL</name>
<stringValue id="381">sqlPortfolio</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="382" type="java.util.HashSet">
<item idref="366" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="383" type="java.util.HashSet">
<item id="384" type="com.j2fe.workflow.definition.Transition">
<name id="385">nothing-found</name>
<source idref="368"/>
<target id="386">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="387"/>
<directJoin>false</directJoin>
<name id="388">Get New Oid</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="389">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="390" type="java.util.HashSet">
<item id="391" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="392">database</name>
<stringValue id="393">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="394" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="395">indexedParameters[0]</name>
<stringValue id="396">uniq</stringValue>
<type>VARIABLE</type>
</item>
<item id="397" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="398">indexedResult</name>
<stringValue id="399">OidArr</stringValue>
<type>VARIABLE</type>
</item>
<item id="400" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="401">querySQL</name>
<stringValue id="402">SELECT new_oid(), new_oid(), new_oid(),nextval('grp_seq')::text,&#13;
(SELECT CLSF_OID FROM FT_T_INCL WHERE INDUS_CL_SET_ID='MIZUNIQE' AND CL_VALUE = ? ) unq&#13;
from dual</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="403" type="java.util.HashSet">
<item idref="384" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="404" type="java.util.HashSet">
<item id="405" type="com.j2fe.workflow.definition.Transition">
<name id="406">goto-next</name>
<source idref="386"/>
<target id="407">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="408"/>
<directJoin>false</directJoin>
<name id="409">insert querys</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="410">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="411" type="java.util.HashSet">
<item id="412" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="413">statements</name>
<objectValue id="414" type="java.lang.String">		int LoopCounter = 0 ;
		String subordinated = input[1];
		String guarantor = input[2];
		String credit = input[3];
		String secured = input[4];
		String uniq = input[5];
		String fcy = input[6];
		String iseries = input[7];
		String igroup = input[8];


		String instrid = oid[0][0];
		String ridfoid = oid[0][1];
		String isgroid = oid[0][2];
		String grpseq = oid[0][3];
		String cldfoid = oid[0][4];

		int i =4;
		if(null != subordinated){
			i++;
		} 
		if(null != guarantor){
			i++;
		} 
		if(null != credit ){
			i = i + 2;
		} 
		if(null != secured ){
			i++;
		}
		if(null != uniq){
			i++;
		}
		if(null != fcy){
			i++;
		}
		if(null != igroup ){
			i++;
		}
		
		String [] sqlQuery = new String[i];
		int j=0;
		
		if(null != iseries){
			sqlQuery[j] = "insert into ft_t_issu( instr_id, instr_issr_id, iss_typ, iss_actvy_stat_typ, pref_iss_id, pref_iss_nme, iss_rate_txt, iss_alph_srch_txt, start_tms, last_chg_tms, last_chg_usr_id, series_typ)"+
				" values ( '"+instrid+"','"+Issuer+"', 'PORT', 'ACTIVE','PORT"+grpseq+"', 'PORT"+grpseq+"', '0', '20', current_timestamp, current_timestamp, 'CalculatePortfolio', '"+iseries+"')";
		}else{
			sqlQuery[j] = "insert into ft_t_issu( instr_id, instr_issr_id, iss_typ, iss_actvy_stat_typ, pref_iss_id, pref_iss_nme, iss_rate_txt, iss_alph_srch_txt, start_tms, last_chg_tms, last_chg_usr_id)"+
				" values ( '"+instrid+"','"+Issuer+"', 'PORT', 'ACTIVE','PORT"+grpseq+"', 'PORT"+grpseq+"', '0', '20', current_timestamp, current_timestamp, 'CalculatePortfolio')";
		}


		if(null != subordinated){
			j++;
			sqlQuery[j] = "insert into ft_t_isll( isll_oid, instr_id, coll_typ, start_tms, last_chg_tms, last_chg_usr_id)"+
					" values ( new_oid(), '"+instrid+"', 'Subordinated', current_timestamp, current_timestamp, 'CalculatePortfolio')";
		} 

		if(null != guarantor){
			j++;
			sqlQuery[j] = "insert into ft_t_frip( finsrl_iss_prt_id, inst_mnem, instr_id, finsrl_typ, prt_purp_typ, start_tms, last_chg_tms, last_chg_usr_id)"+
					" values ( new_oid(), '"+guarantor+"', '"+instrid+"','GUARNTOR','GUARNTOR', current_timestamp, current_timestamp, 'CalculatePortfolio')";
		} 

		if(null != credit ){
			j++;
			sqlQuery[j] = "insert into ft_t_ridf( rld_iss_feat_id, instr_id, rel_typ, start_tms, last_chg_tms, last_chg_usr_id)"+
					" values ( '"+ridfoid+"', '"+instrid+"', 'CreditLinked', current_timestamp, current_timestamp, 'CalculatePortfolio')";

			j++;
			sqlQuery[j] = "insert into ft_t_riss(riss_oid, rld_iss_feat_id, instr_id, iss_part_rl_typ, part_units_typ, start_tms, last_chg_tms, last_chg_usr_id)"+
					" values ( new_oid(), '"+ridfoid+"', '"+credit+"', 'UNDLYING', 'ALL', current_timestamp, current_timestamp, 'CalculatePortfolio')";
		} 

		if(null != secured ){
			j++;
			sqlQuery[j] = "insert into ft_t_isll( isll_oid, instr_id, coll_typ, start_tms, last_chg_tms, last_chg_usr_id)"+
					" values ( new_oid(), '"+instrid+"', 'Secured', current_timestamp, current_timestamp, 'CalculatePortfolio')";
		}

		if(null != uniq){
			j++;
			sqlQuery[j] = "insert into ft_t_iscl(iss_clsf_oid, instr_id, indus_cl_set_id, clsf_oid, cl_value, clsf_purp_typ, start_tms, last_chg_tms, last_chg_usr_id)"+
					" values ( new_oid(), '"+instrid+"', 'MIZUNIQE', '"+cldfoid +"','"+uniq+"', 'INDCLASS', current_timestamp, current_timestamp, 'CalculatePortfolio')";
		}

		j++;
		sqlQuery[j] = "insert into ft_t_isst(stat_id, instr_id, stat_def_id, stat_char_val_txt, stat_val_tms, start_tms, last_chg_tms, last_chg_usr_id, stat_int_val_num)"+
					" values ( new_oid(), '"+instrid+"', 'MIZRECAL', 'Y', current_timestamp, current_timestamp, current_timestamp, 'CalculatePortfolio', '0')";
		
		j++;
		sqlQuery[j] = "insert into ft_t_isgr(iss_grp_oid, iss_grp_id, grp_nme, start_tms, last_chg_tms, last_chg_usr_id)"+
					" values ( '"+isgroid+"', 'PRTFOLIO"+grpseq+"', 'PRTFOLIO"+grpseq+"', current_timestamp, current_timestamp, 'CalculatePortfolio')";
		
		j++;
		sqlQuery[j] = "insert into ft_t_isgp(isgp_oid, prnt_iss_grp_oid, prt_purp_typ, instr_id, start_tms, last_chg_tms, last_chg_usr_id)"+
					" values ( new_oid(), '"+isgroid+"', 'PRTFLIOP', '"+instrid+"', current_timestamp, current_timestamp, 'CalculatePortfolio')";
		
		if(null != fcy){
			j++;
			sqlQuery[j] = "insert into ft_t_isgp(isgp_oid, prnt_iss_grp_oid, prt_purp_typ, instr_id, start_tms, last_chg_tms, last_chg_usr_id)"+
					" values ( new_oid(), '"+fcy+"', 'ISIDGRP', '"+instrid+"', current_timestamp, current_timestamp, 'CalculatePortfolio')";
		}

		if(null != igroup){
			j++;
			sqlQuery[j] = "insert into ft_t_isll( isll_oid, instr_id, coll_typ, start_tms, last_chg_tms, last_chg_usr_id, coll_grp_desc)"+
					" values ( new_oid(), '"+instrid+"', 'Mortgage Backed', current_timestamp, current_timestamp, 'CalculatePortfolio','"+igroup+"')";
		}</objectValue>
<type>CONSTANT</type>
</item>
<item id="415" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="416">["Issuer"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="417">variables["Issuer"]</name>
<stringValue id="418">Issuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="419" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="420">["LoopCounter"]@java/lang/Object@</UITypeHint>
<input>false</input>
<name id="421">variables["LoopCounter"]</name>
<stringValue id="422">LoopPortfolioInsert</stringValue>
<type>VARIABLE</type>
</item>
<item id="423" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="424">["input"]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="425">variables["input"]</name>
<stringValue id="426">Instument</stringValue>
<type>VARIABLE</type>
</item>
<item id="427" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="428">variables["oid"]</name>
<stringValue id="429">OidArr</stringValue>
<type>VARIABLE</type>
</item>
<item id="430" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="431">variables["sqlQuery"]</name>
<stringValue id="432">sqlqrys</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="433" type="java.util.HashSet">
<item idref="405" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="434" type="java.util.HashSet">
<item id="435" type="com.j2fe.workflow.definition.Transition">
<name id="436">goto-next</name>
<source idref="407"/>
<target id="437">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="438">Automatically generated</description>
<directJoin>false</directJoin>
<name id="439">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="440">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="441" type="java.util.HashSet">
<item id="442" type="com.j2fe.workflow.definition.Transition">
<name id="443">goto-next</name>
<source id="444">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="445"/>
<directJoin>false</directJoin>
<name id="446">Database Statement (Standard) #2</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="447">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="448" type="java.util.HashSet">
<item id="449" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="450">database</name>
<stringValue id="451">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="452" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="453">querySQL</name>
<stringValue id="454">singleSql</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="455" type="java.util.HashSet">
<item id="456" type="com.j2fe.workflow.definition.Transition">
<name id="457">loop</name>
<source id="458">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="459"/>
<directJoin>false</directJoin>
<name id="460">For Loop SQL Inserts</name>
<nodeHandler>com.j2fe.workflow.handler.impl.ForEach</nodeHandler>
<nodeHandlerClass id="461">com.j2fe.workflow.handler.impl.ForEach</nodeHandlerClass>
<parameters id="462" type="java.util.HashSet">
<item id="463" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="464">counter</name>
<stringValue id="465">LoopPortfolioInsert</stringValue>
<type>VARIABLE</type>
</item>
<item id="466" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="467">counter</name>
<stringValue id="468">LoopPortfolioInsert</stringValue>
<type>VARIABLE</type>
</item>
<item id="469" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="470">input</name>
<stringValue id="471">sqlqrys</stringValue>
<type>VARIABLE</type>
</item>
<item id="472" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="473">output</name>
<stringValue id="474">singleSql</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="475" type="java.util.HashSet">
<item id="476" type="com.j2fe.workflow.definition.Transition">
<name id="477">ToSplit</name>
<source idref="437"/>
<target idref="458"/>
</item>
</sources>
<targets id="478" type="java.util.HashSet">
<item id="479" type="com.j2fe.workflow.definition.Transition">
<name id="480">end-loop</name>
<source idref="458"/>
<target id="481">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="482"/>
<directJoin>false</directJoin>
<name id="483">InstrumentId</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="484">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="485" type="java.util.HashSet">
<item id="486" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="487">statements</name>
<stringValue id="488">String issueId = input[0];&#13;
&#13;
int portLength = Port.length;&#13;
String isgrOid = "";&#13;
String portIssuOid = "";&#13;
&#13;
if(portLength &gt; 0){&#13;
	isgrOid = Port[0][1];&#13;
	portIssuOid  = Port[0][0];&#13;
} else {&#13;
	isgrOid = oid[0][2];&#13;
	portIssuOid  = oid[0][0];&#13;
}</stringValue>
<type>CONSTANT</type>
</item>
<item id="489" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="490">variables["Port"]</name>
<stringValue id="491">ExistingPortfolio</stringValue>
<type>VARIABLE</type>
</item>
<item id="492" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="493">["input"]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="494">variables["input"]</name>
<stringValue id="495">Instument</stringValue>
<type>VARIABLE</type>
</item>
<item id="496" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="497">variables["isgrOid"]</name>
<stringValue id="498">isgrOid1</stringValue>
<type>VARIABLE</type>
</item>
<item id="499" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="500">["issueId"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="501">variables["issueId"]</name>
<stringValue id="502">issueId</stringValue>
<type>VARIABLE</type>
</item>
<item id="503" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="504">["oid"]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="505">variables["oid"]</name>
<stringValue id="506">OidArr</stringValue>
<type>VARIABLE</type>
</item>
<item id="507" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="508">variables["portIssuOid"]</name>
<stringValue id="509">portIssuOid</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="510" type="java.util.HashSet">
<item idref="479" type="com.j2fe.workflow.definition.Transition"/>
<item id="511" type="com.j2fe.workflow.definition.Transition">
<name id="512">rows-found</name>
<source idref="368"/>
<target idref="481"/>
</item>
</sources>
<targets id="513" type="java.util.HashSet">
<item id="514" type="com.j2fe.workflow.definition.Transition">
<name id="515">goto-next</name>
<source idref="481"/>
<target id="516">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="517"/>
<directJoin>false</directJoin>
<name id="518">Update ISGP</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="519">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="520" type="java.util.HashSet">
<item id="521" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="522">database</name>
<stringValue id="523">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="524" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="525">indexedParameters[0]</name>
<stringValue id="526">isgrOid1</stringValue>
<type>VARIABLE</type>
</item>
<item id="527" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="528">indexedParameters[1]</name>
<stringValue id="529">issueId</stringValue>
<type>VARIABLE</type>
</item>
<item id="530" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="531">querySQL</name>
<stringValue id="532">update ft_t_isgp set end_tms = current_timestamp, last_chg_tms = current_timestamp, last_chg_usr_id = 'CalculatePortfolio'&#13;
where prnt_iss_grp_oid != ? and instr_id = ?&#13;
and prt_purp_typ = 'PRTFLIOC'&#13;
and start_tms &lt;= current_timestamp and (end_tms is null or end_tms &gt; current_timestamp)</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="533" type="java.util.HashSet">
<item idref="514" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="534" type="java.util.HashSet">
<item id="535" type="com.j2fe.workflow.definition.Transition">
<name id="536">goto-next</name>
<source idref="516"/>
<target id="537">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="538"/>
<directJoin>false</directJoin>
<name id="539">Insert ISGP</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="540">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="541" type="java.util.HashSet">
<item id="542" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="543">database</name>
<stringValue id="544">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="545" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="546">indexedParameters[0]</name>
<stringValue id="547">isgrOid1</stringValue>
<type>VARIABLE</type>
</item>
<item id="548" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="549">indexedParameters[1]</name>
<stringValue id="550">issueId</stringValue>
<type>VARIABLE</type>
</item>
<item id="551" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="552">indexedParameters[2]</name>
<stringValue id="553">isgrOid1</stringValue>
<type>VARIABLE</type>
</item>
<item id="554" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="555">indexedParameters[3]</name>
<stringValue id="556">issueId</stringValue>
<type>VARIABLE</type>
</item>
<item id="557" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="558">querySQL</name>
<stringValue id="559">Insert into ft_t_isgp (ISGP_OID, PRNT_ISS_GRP_OID, INSTR_ID, PRT_PURP_TYP, START_TMS, LAST_CHG_TMS, LAST_CHG_USR_ID) &#13;
select new_oid(),  ?, ?, 'PRTFLIOC', current_timestamp, current_timestamp, 'CalculatePortfolio' from dual&#13;
where not exists (select 1 from ft_t_isgp where prnt_iss_grp_oid = ? and instr_id = ? and prt_purp_typ = 'PRTFLIOC' and start_tms &lt;= current_timestamp and (end_tms is null or end_tms &gt; current_timestamp))</stringValue>
<type>CONSTANT</type>
</item>
<item id="560" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="561">rowCount</name>
<stringValue id="562">RowCount</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="563" type="java.util.HashSet">
<item idref="535" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="564" type="java.util.HashSet">
<item id="565" type="com.j2fe.workflow.definition.Transition">
<name id="566">goto-next</name>
<source idref="537"/>
<target id="567">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="568"/>
<directJoin>false</directJoin>
<name id="569">New issue in portfolio</name>
<nodeHandler>com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandler>
<nodeHandlerClass id="570">com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandlerClass>
<parameters id="571" type="java.util.HashSet">
<item id="572" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="573">caseItem</name>
<stringValue id="574">RowCount</stringValue>
<type>VARIABLE</type>
</item>
<item id="575" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="576">defaultItem</name>
<stringValue id="577">1</stringValue>
<type>CONSTANT</type>
</item>
<item id="578" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="579">nullTransition</name>
<stringValue id="580">0</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="581" type="java.util.HashSet">
<item idref="565" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="582" type="java.util.HashSet">
<item id="583" type="com.j2fe.workflow.definition.Transition">
<name id="584">0</name>
<source idref="567"/>
<target id="585">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="586"/>
<directJoin>false</directJoin>
<name id="587">NOP</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="588">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="589" type="java.util.HashSet">
<item idref="583" type="com.j2fe.workflow.definition.Transition"/>
<item id="590" type="com.j2fe.workflow.definition.Transition">
<name id="591">goto-next</name>
<source id="592">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="593"/>
<directJoin>false</directJoin>
<name id="594">Update Recalculate to Y for new</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="595">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="596" type="java.util.HashSet">
<item id="597" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="598">database</name>
<stringValue id="599">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="600" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="601">indexedParameters[0]</name>
<stringValue id="602">portIssuOid</stringValue>
<type>VARIABLE</type>
</item>
<item id="603" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="604">querySQL</name>
<stringValue id="605">update ft_t_isst set stat_char_val_txt = 'Y', last_chg_tms = current_timestamp, last_chg_usr_id = 'CalculatePortfolio', DATA_SRC_ID = NULL&#13;
where stat_char_val_txt = 'N' and instr_id = ?&#13;
and start_tms &lt;= current_timestamp and (end_tms is null or end_tms &gt; current_timestamp)</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="606" type="java.util.HashSet">
<item id="607" type="com.j2fe.workflow.definition.Transition">
<name id="608">1</name>
<source idref="567"/>
<target idref="592"/>
</item>
</sources>
<targets id="609" type="java.util.HashSet">
<item idref="590" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="585"/>
</item>
</sources>
<targets id="610" type="java.util.HashSet">
<item id="611" type="com.j2fe.workflow.definition.Transition">
<name id="612">goto-next</name>
<source idref="585"/>
<target idref="95"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item idref="607" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</target>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item idref="456" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="444"/>
</item>
</sources>
<targets id="613" type="java.util.HashSet">
<item idref="442" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="437"/>
</item>
<item idref="435" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="614" type="java.util.HashSet">
<item idref="476" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</target>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item idref="511" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</target>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item idref="154" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="139"/>
</item>
</sources>
<targets id="615" type="java.util.HashSet">
<item idref="137" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="122"/>
</item>
</sources>
<targets id="616" type="java.util.HashSet">
<item idref="120" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="102"/>
</item>
</sources>
<targets id="617" type="java.util.HashSet">
<item idref="100" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="95"/>
</item>
<item idref="611" type="com.j2fe.workflow.definition.Transition"/>
<item idref="93" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="618" type="java.util.HashSet">
<item idref="210" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</target>
</item>
</targets>
<type>XORSPLIT</type>
</target>
</item>
<item idref="8" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="3"/>
</item>
<item idref="328" type="com.j2fe.workflow.definition.Transition"/>
<item idref="91" type="com.j2fe.workflow.definition.Transition"/>
<item idref="234" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="619" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="620">Mizuho/Ratings</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="621">user1</lastChangeUser>
<lastUpdate id="622">2025-11-20T01:11:03.000+0000</lastUpdate>
<name id="623">CalculatePortfolio</name>
<nodes id="624" type="java.util.HashSet">
<item idref="285" type="com.j2fe.workflow.definition.Node"/>
<item idref="245" type="com.j2fe.workflow.definition.Node"/>
<item idref="156" type="com.j2fe.workflow.definition.Node"/>
<item idref="368" type="com.j2fe.workflow.definition.Node"/>
<item idref="122" type="com.j2fe.workflow.definition.Node"/>
<item idref="444" type="com.j2fe.workflow.definition.Node"/>
<item idref="173" type="com.j2fe.workflow.definition.Node"/>
<item idref="75" type="com.j2fe.workflow.definition.Node"/>
<item idref="57" type="com.j2fe.workflow.definition.Node"/>
<item idref="139" type="com.j2fe.workflow.definition.Node"/>
<item idref="458" type="com.j2fe.workflow.definition.Node"/>
<item idref="386" type="com.j2fe.workflow.definition.Node"/>
<item idref="537" type="com.j2fe.workflow.definition.Node"/>
<item idref="268" type="com.j2fe.workflow.definition.Node"/>
<item idref="102" type="com.j2fe.workflow.definition.Node"/>
<item idref="192" type="com.j2fe.workflow.definition.Node"/>
<item idref="481" type="com.j2fe.workflow.definition.Node"/>
<item idref="10" type="com.j2fe.workflow.definition.Node"/>
<item idref="95" type="com.j2fe.workflow.definition.Node"/>
<item idref="238" type="com.j2fe.workflow.definition.Node"/>
<item idref="437" type="com.j2fe.workflow.definition.Node"/>
<item idref="585" type="com.j2fe.workflow.definition.Node"/>
<item idref="567" type="com.j2fe.workflow.definition.Node"/>
<item idref="307" type="com.j2fe.workflow.definition.Node"/>
<item idref="338" type="com.j2fe.workflow.definition.Node"/>
<item idref="215" type="com.j2fe.workflow.definition.Node"/>
<item idref="36" type="com.j2fe.workflow.definition.Node"/>
<item idref="27" type="com.j2fe.workflow.definition.Node"/>
<item idref="3" type="com.j2fe.workflow.definition.Node"/>
<item idref="516" type="com.j2fe.workflow.definition.Node"/>
<item idref="592" type="com.j2fe.workflow.definition.Node"/>
<item idref="407" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>true</optimize>
<parameter id="625" type="java.util.HashMap">
<entry>
<key id="626" type="java.lang.String">Issuer</key>
<value id="627" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="628">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="629">		</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="630" type="java.lang.String">Output</key>
<value id="631" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="632">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>false</input>
<output>true</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="633" type="java.lang.String">Scheduled</key>
<value id="634" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="635">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
</parameter>
<permissions id="636" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>false</purgeAtEnd>
<retries>0</retries>
<startNode idref="27"/>
<status>RELEASED</status>
<variables id="637" type="java.util.HashMap">
<entry>
<key id="638" type="java.lang.String">Issuer</key>
<value id="639" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="640">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="641">		</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="642" type="java.lang.String">LoopCounter</key>
<value id="643" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="644">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<persistent>false</persistent>
<value id="645" type="java.lang.Integer">0</value>
</value>
</entry>
<entry>
<key id="646" type="java.lang.String">LoopCounter1</key>
<value id="647" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="648">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="649">		</description>
<persistent>false</persistent>
<value idref="645"/>
</value>
</entry>
<entry>
<key id="650" type="java.lang.String">LoopPortfolioInsert</key>
<value id="651" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="652">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<persistent>false</persistent>
<value idref="645"/>
</value>
</entry>
<entry>
<key id="653" type="java.lang.String">Output</key>
<value id="654" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="655">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="656" type="java.lang.String">Done</value>
</value>
</entry>
<entry>
<key id="657" type="java.lang.String">Scheduled</key>
<value id="658" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="659">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="660" type="java.lang.String">N</value>
</value>
</entry>
<entry>
<key id="661" type="java.lang.String">sqlarr</key>
<value id="662" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="663">[Ljava.lang.String;</className>
<clazz>[Ljava.lang.String;</clazz>
<persistent>true</persistent>
</value>
</entry>
</variables>
<version>23</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
