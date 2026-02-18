<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.04">
<package-comment/>
<businessobject displayString="15 - V-10 Raise remote events" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>true</alwaysPersist>
<clustered>true</clustered>
<comment id="1">V-10 Raise remote events</comment>
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
<name id="9">goto-next</name>
<source id="10">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="11"/>
<directJoin>false</directJoin>
<name id="12">FATAL ERROR</name>
<nodeHandler>com.j2fe.general.activities.LogMessage</nodeHandler>
<nodeHandlerClass id="13">com.j2fe.general.activities.LogMessage</nodeHandlerClass>
<parameters id="14" type="java.util.HashSet">
<item id="15" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="16">logLevel</name>
<stringValue id="17">FATAL</stringValue>
<type>CONSTANT</type>
</item>
<item id="18" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="19">message</name>
<stringValue id="20">rebuildIOI2 workflow cannot determine link between FT_T_IRGP and FT_T_IRGR as PRNT_ISSR_GRP_OID cannot be identified</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="21" type="java.util.HashSet">
<item id="22" type="com.j2fe.workflow.definition.Transition">
<name id="23">nothing-found</name>
<source id="24">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="25"/>
<directJoin>false</directJoin>
<name id="26">Get ISSR_GRP_OID</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="27">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="28" type="java.util.HashSet">
<item id="29" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="30">database</name>
<stringValue id="31">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="32" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="33">[0]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="34">firstColumnsResult[0]</name>
<stringValue id="35">ISSR_GRP_OID</stringValue>
<type>VARIABLE</type>
</item>
<item id="36" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="37">indexedParameters[0]</name>
<stringValue id="38">OrgId</stringValue>
<type>VARIABLE</type>
</item>
<item id="39" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="40">querySQL</name>
<stringValue id="41">select ISSR_GRP_OID from FT_T_IRGR where trim(ORG_ID) = CAST(? AS VARCHAR)</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="42" type="java.util.HashSet">
<item id="43" type="com.j2fe.workflow.definition.Transition">
<name id="44">goto-next</name>
<source id="45">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="46"/>
<directJoin>false</directJoin>
<name id="47">get OID for IRGR / IRGP</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="48">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="49" type="java.util.HashSet">
<item id="50" type="com.j2fe.workflow.definition.Transition">
<name id="51">goto-next</name>
<source id="52">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="53"/>
<directJoin>false</directJoin>
<name id="54">LAGR_FLAR_RUP</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="55">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="56" type="java.util.HashSet">
<item id="57" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="58">database</name>
<stringValue id="59">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="60" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="61">indexedParameters[0]</name>
<stringValue id="62">OrgId</stringValue>
<type>VARIABLE</type>
</item>
<item id="63" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="64">indexedParameters[1]</name>
<stringValue id="65">OrgId</stringValue>
<type>VARIABLE</type>
</item>
<item id="66" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="67">querySQL</name>
<stringValue id="68">WITH source_data AS (
  SELECT DISTINCT issr.INSTR_ISSR_ID, CAST(? AS VARCHAR) AS ORG_ID
  FROM FT_T_FLAR flar
  INNER JOIN FT_T_ISSR issr
    ON (SELECT MHI_FINS_UP(flar.inst_mnem)) = issr.fins_inst_mnem
   AND issr.end_tms IS NULL
  INNER JOIN FT_T_LAGR lagr
    ON flar.leg_agrmnt_id = lagr.leg_agrmnt_id
   AND lagr.agrmnt_termintn_dte IS NULL
   AND lagr.agrmnt_stat_typ NOT IN ('SUPERSEDED', 'TERMNTED')
  WHERE flar.end_tms IS NULL
    AND TRIM(lagr.ORG_ID) = CAST(? AS VARCHAR)
)
INSERT INTO FT_T_IOI2 (
  INSTR_ISSR_ID, ORG_ID, UPDATING, UPDATED, ASSET_SOI,
  GTOR, CUST, ASSET_RUP, GTOR_RUP, CUST_RUP,
  NEW_IOI_MEMBER, CUST_IP, LAGR_FLAR, LAGR_FLAR_RUP
)
SELECT 
  s.INSTR_ISSR_ID, s.ORG_ID, 'N', 'N', 'N',
  'N', 'N', 'N', 'N', 'N',
  'Y', 'N', 'N', 'Y'
FROM source_data s
ON CONFLICT (INSTR_ISSR_ID, ORG_ID)
DO UPDATE SET
  LAGR_FLAR = EXCLUDED.LAGR_FLAR
WHERE FT_T_IOI2.LAGR_FLAR IS DISTINCT FROM 'Y';</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="69" type="java.util.HashSet">
<item id="70" type="com.j2fe.workflow.definition.Transition">
<name id="71">goto-next</name>
<source id="72">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="73"/>
<directJoin>false</directJoin>
<name id="74">log add lagr flar rup issuers</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="75">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="76" type="java.util.HashSet">
<item id="77" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="78">database</name>
<stringValue id="79">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="80" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="81">querySQL</name>
<stringValue id="82">call&#13;
 mhi_sp_eventlog (&#13;
	 'rebuildIOI2 Workflow',&#13;
	 'add LAGR FLAR RUP Issuers',&#13;
	'N/A'); &#13;
</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="83" type="java.util.HashSet">
<item id="84" type="com.j2fe.workflow.definition.Transition">
<name id="85">rows-found</name>
<source id="86">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="87"/>
<directJoin>false</directJoin>
<name id="88">Add LAGR_FLAR_RUP Issuers?</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="89">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="90" type="java.util.HashSet">
<item id="91" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="92">database</name>
<stringValue id="93">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="94" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="95">firstColumnsResult</name>
<stringValue id="96">newNonRUPIssuers</stringValue>
<type>VARIABLE</type>
</item>
<item id="97" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="98">indexedParameters[0]</name>
<stringValue id="99">OrgId</stringValue>
<type>VARIABLE</type>
</item>
<item id="100" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="101">querySQL</name>
<stringValue id="102">select 1 from FT_T_IOI2 where INSTR_ISSR_ID = 'CONTROL'  and ORG_ID = CAST(? AS VARCHAR) and LAGR_FLAR_RUP ='Y'</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="103" type="java.util.HashSet">
<item id="104" type="com.j2fe.workflow.definition.Transition">
<name id="105">ToSplit</name>
<source id="106">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="107">Automatically generated</description>
<directJoin>false</directJoin>
<name id="108">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="109">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="110" type="java.util.HashSet">
<item id="111" type="com.j2fe.workflow.definition.Transition">
<name id="112">goto-next</name>
<source id="113">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="114"/>
<directJoin>false</directJoin>
<name id="115">LAGR_FLAR</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="116">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="117" type="java.util.HashSet">
<item id="118" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="119">database</name>
<stringValue id="120">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="121" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="122">indexedParameters[0]</name>
<stringValue id="123">OrgId</stringValue>
<type>VARIABLE</type>
</item>
<item id="124" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="125">indexedParameters[1]</name>
<stringValue id="126">OrgId</stringValue>
<type>VARIABLE</type>
</item>
<item id="127" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="128">querySQL</name>
<stringValue id="129">WITH source_data AS (&#13;
  SELECT DISTINCT issr.INSTR_ISSR_ID, CAST(? as VARCHAR) AS ORG_ID&#13;
  FROM FT_T_FLAR flar&#13;
  INNER JOIN FT_T_ISSR issr &#13;
    ON flar.inst_mnem = issr.fins_inst_mnem&#13;
   AND issr.end_tms IS NULL&#13;
  INNER JOIN FT_T_LAGR lagr &#13;
    ON flar.leg_agrmnt_id = lagr.leg_agrmnt_id&#13;
   AND lagr.agrmnt_termintn_dte IS NULL&#13;
   AND lagr.agrmnt_stat_typ NOT IN ('SUPERSEDED', 'TERMNTED')&#13;
  WHERE flar.end_tms IS NULL&#13;
    AND TRIM(lagr.ORG_ID) = CAST(? as VARCHAR)&#13;
)&#13;
INSERT INTO FT_T_IOI2 (&#13;
  INSTR_ISSR_ID, ORG_ID, UPDATING, UPDATED, ASSET_SOI,&#13;
  GTOR, CUST, ASSET_RUP, GTOR_RUP, CUST_RUP,&#13;
  NEW_IOI_MEMBER, CUST_IP, LAGR_FLAR, LAGR_FLAR_RUP&#13;
)&#13;
SELECT &#13;
  s.INSTR_ISSR_ID, s.ORG_ID, 'N', 'N', 'N',&#13;
  'N', 'N', 'N', 'N', 'N',&#13;
  'Y', 'N', 'Y', 'N'&#13;
FROM source_data s&#13;
ON CONFLICT (INSTR_ISSR_ID, ORG_ID)&#13;
DO UPDATE SET&#13;
  LAGR_FLAR = EXCLUDED.LAGR_FLAR&#13;
WHERE FT_T_IOI2.LAGR_FLAR IS DISTINCT FROM 'Y';</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="130" type="java.util.HashSet">
<item id="131" type="com.j2fe.workflow.definition.Transition">
<name id="132">goto-next</name>
<source id="133">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="134"/>
<directJoin>false</directJoin>
<name id="135">log add lagr flar issuers</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="136">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="137" type="java.util.HashSet">
<item id="138" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="139">database</name>
<stringValue id="140">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="141" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="142">querySQL</name>
<stringValue id="143">call&#13;
 mhi_sp_eventlog (&#13;
	 'rebuildIOI2 Workflow',&#13;
	 'add LAGR FLAR Issuers',&#13;
	'N/A'); &#13;
</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="144" type="java.util.HashSet">
<item id="145" type="com.j2fe.workflow.definition.Transition">
<name id="146">rows-found</name>
<source id="147">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="148"/>
<directJoin>false</directJoin>
<name id="149">Add LAGR_FLAR Issuers?</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="150">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="151" type="java.util.HashSet">
<item id="152" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="153">database</name>
<stringValue id="154">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="155" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="156">firstColumnsResult</name>
<stringValue id="157">newNonRUPIssuers</stringValue>
<type>VARIABLE</type>
</item>
<item id="158" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="159">indexedParameters[0]</name>
<stringValue id="160">OrgId</stringValue>
<type>VARIABLE</type>
</item>
<item id="161" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="162">querySQL</name>
<stringValue id="163">select 1 from FT_T_IOI2 where INSTR_ISSR_ID = 'CONTROL'  and ORG_ID = CAST(? AS VARCHAR) and LAGR_FLAR ='Y'</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="164" type="java.util.HashSet">
<item id="165" type="com.j2fe.workflow.definition.Transition">
<name id="166">ToSplit</name>
<source id="167">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="168">Automatically generated</description>
<directJoin>false</directJoin>
<name id="169">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="170">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="171" type="java.util.HashSet">
<item id="172" type="com.j2fe.workflow.definition.Transition">
<name id="173">goto-next</name>
<source id="174">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="175"/>
<directJoin>false</directJoin>
<name id="176">MBE CUST IPS</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="177">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="178" type="java.util.HashSet">
<item id="179" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="180">database</name>
<stringValue id="181">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="182" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="183">indexedParameters[0]</name>
<stringValue id="184">OrgId</stringValue>
<type>VARIABLE</type>
</item>
<item id="185" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="186">querySQL</name>
<objectValue id="187" type="java.lang.String">WITH source_data AS (&#13;
  SELECT DISTINCT issr.INSTR_ISSR_ID, CAST(? as VARCHAR) AS ORG_ID&#13;
  FROM FT_T_ISSR issr&#13;
  WHERE issr.END_TMS IS NULL&#13;
    AND issr.FINS_INST_MNEM IN (&#13;
      SELECT ffrl.PRNT_INST_MNEM&#13;
      FROM FT_T_FFRL ffrl&#13;
      WHERE ffrl.END_TMS IS NULL&#13;
        AND ffrl.REL_TYP = 'PARNTCOF'&#13;
        AND ffrl.INST_MNEM IN (&#13;
          SELECT fiid.INST_MNEM&#13;
          FROM ft_t_fiid fiid&#13;
          WHERE fiid.END_TMS IS NULL&#13;
            AND fiid.FINS_ID_CTXT_TYP IN ('CCIF', 'ISSR_GCIF', 'LNLEGID')&#13;
            AND (&#13;
              fiid.INST_SYMBOL_STAT_TYP = 'ACTIVE'&#13;
              OR (&#13;
                fiid.INST_SYMBOL_STAT_TYP = 'INACTIVE'&#13;
                AND fiid.INST_SYMBOL_STAT_TMS &gt;= CURRENT_DATE - INTERVAL '35 days'&#13;
              )&#13;
            )&#13;
        )&#13;
    )&#13;
)&#13;
INSERT INTO FT_T_IOI2 (&#13;
  INSTR_ISSR_ID, ORG_ID, UPDATING, UPDATED, ASSET_SOI,&#13;
  GTOR, CUST, ASSET_RUP, GTOR_RUP, CUST_RUP,&#13;
  NEW_IOI_MEMBER, CUST_IP, LAGR_FLAR, LAGR_FLAR_RUP&#13;
)&#13;
SELECT &#13;
  s.INSTR_ISSR_ID, s.ORG_ID, 'N', 'N', 'N',&#13;
  'N', 'N', 'N', 'N', 'N',&#13;
  'Y', 'Y', 'N', 'N'&#13;
FROM source_data s&#13;
ON CONFLICT (INSTR_ISSR_ID, ORG_ID)&#13;
DO UPDATE SET&#13;
  CUST_IP = EXCLUDED.CUST_IP&#13;
WHERE FT_T_IOI2.CUST_IP IS DISTINCT FROM 'Y';</objectValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="188" type="java.util.HashSet">
<item id="189" type="com.j2fe.workflow.definition.Transition">
<name id="190">goto-next</name>
<source id="191">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="192"/>
<directJoin>false</directJoin>
<name id="193">log add cust ip issuers</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="194">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="195" type="java.util.HashSet">
<item id="196" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="197">database</name>
<stringValue id="198">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="199" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="200">querySQL</name>
<stringValue id="201">call &#13;
 mhi_sp_eventlog (&#13;
	 'rebuildIOI2 Workflow',&#13;
	 'add CUST IP Issuers',&#13;
	'N/A'); </stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="202" type="java.util.HashSet">
<item id="203" type="com.j2fe.workflow.definition.Transition">
<name id="204">rows-found</name>
<source id="205">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="206"/>
<directJoin>false</directJoin>
<name id="207">Add CUST IP Issuers?</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="208">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="209" type="java.util.HashSet">
<item id="210" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="211">database</name>
<stringValue id="212">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="213" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="214">firstColumnsResult</name>
<stringValue id="215">newNonRUPIssuers</stringValue>
<type>VARIABLE</type>
</item>
<item id="216" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="217">indexedParameters[0]</name>
<stringValue id="218">OrgId</stringValue>
<type>VARIABLE</type>
</item>
<item id="219" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="220">querySQL</name>
<stringValue id="221">select 1 from FT_T_IOI2 where INSTR_ISSR_ID = 'CONTROL' and ORG_ID = CAST(? AS VARCHAR) and CUST_IP ='Y'</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="222" type="java.util.HashSet">
<item id="223" type="com.j2fe.workflow.definition.Transition">
<name id="224">ToSplit</name>
<source id="225">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="226">Automatically generated</description>
<directJoin>false</directJoin>
<name id="227">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="228">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="229" type="java.util.HashSet">
<item id="230" type="com.j2fe.workflow.definition.Transition">
<name id="231">goto-next</name>
<source id="232">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="233"/>
<directJoin>false</directJoin>
<name id="234">MBE CUST RUPS</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="235">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="236" type="java.util.HashSet">
<item id="237" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="238">database</name>
<stringValue id="239">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="240" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="241">indexedParameters[0]</name>
<stringValue id="242">OrgId</stringValue>
<type>VARIABLE</type>
</item>
<item id="243" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="244">querySQL</name>
<objectValue id="245" type="java.lang.String">WITH source_data AS (&#13;
  SELECT DISTINCT issr.INSTR_ISSR_ID, CAST(? as VARCHAR) AS ORG_ID&#13;
  FROM FT_T_ISSR issr&#13;
  WHERE issr.END_TMS IS NULL&#13;
    AND issr.FINS_INST_MNEM IN (&#13;
      SELECT MHI_FINS_UP(fiid.INST_MNEM)&#13;
      FROM ft_t_fiid fiid&#13;
      WHERE fiid.FINS_ID_CTXT_TYP IN ('CCIF', 'ISSR_GCIF', 'LNLEGID')&#13;
        AND fiid.END_TMS IS NULL&#13;
        AND (&#13;
          fiid.INST_SYMBOL_STAT_TYP = 'ACTIVE'&#13;
          OR (&#13;
            fiid.INST_SYMBOL_STAT_TYP = 'INACTIVE'&#13;
            AND fiid.INST_SYMBOL_STAT_TMS &gt;= CURRENT_DATE - INTERVAL '35 days'&#13;
          )&#13;
        )&#13;
    )&#13;
)&#13;
INSERT INTO FT_T_IOI2 (&#13;
  INSTR_ISSR_ID, ORG_ID, UPDATING, UPDATED, ASSET_SOI,&#13;
  GTOR, CUST, ASSET_RUP, GTOR_RUP, CUST_RUP,&#13;
  NEW_IOI_MEMBER, CUST_IP, LAGR_FLAR, LAGR_FLAR_RUP&#13;
)&#13;
SELECT &#13;
  s.INSTR_ISSR_ID, s.ORG_ID, 'N', 'N', 'N',&#13;
  'N', 'N', 'N', 'N', 'Y',&#13;
  'Y', 'N', 'N', 'N'&#13;
FROM source_data s&#13;
ON CONFLICT (INSTR_ISSR_ID, ORG_ID)&#13;
DO UPDATE SET&#13;
  CUST_RUP = EXCLUDED.CUST_RUP&#13;
WHERE FT_T_IOI2.CUST_RUP IS DISTINCT FROM 'Y';</objectValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="246" type="java.util.HashSet">
<item id="247" type="com.j2fe.workflow.definition.Transition">
<name id="248">goto-next</name>
<source id="249">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="250"/>
<directJoin>false</directJoin>
<name id="251">log add cust rup issuers</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="252">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="253" type="java.util.HashSet">
<item id="254" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="255">database</name>
<stringValue id="256">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="257" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="258">querySQL</name>
<stringValue id="259">call mhi_sp_eventlog (&#13;
	 'rebuildIOI2 Workflow',&#13;
	 'add CUST RUP Issuers',&#13;
	'N/A'); </stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="260" type="java.util.HashSet">
<item id="261" type="com.j2fe.workflow.definition.Transition">
<name id="262">rows-found</name>
<source id="263">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="264"/>
<directJoin>false</directJoin>
<name id="265">Add CUST RUP Issuers?</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="266">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="267" type="java.util.HashSet">
<item id="268" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="269">database</name>
<stringValue id="270">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="271" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="272">firstColumnsResult</name>
<stringValue id="273">newNonRUPIssuers</stringValue>
<type>VARIABLE</type>
</item>
<item id="274" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="275">indexedParameters[0]</name>
<stringValue id="276">OrgId</stringValue>
<type>VARIABLE</type>
</item>
<item id="277" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="278">querySQL</name>
<stringValue id="279">select 1 from FT_T_IOI2 where INSTR_ISSR_ID = 'CONTROL'  and ORG_ID = CAST(? AS VARCHAR) and CUST_RUP ='Y'</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="280" type="java.util.HashSet">
<item id="281" type="com.j2fe.workflow.definition.Transition">
<name id="282">ToSplit</name>
<source id="283">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="284">Automatically generated</description>
<directJoin>false</directJoin>
<name id="285">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="286">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="287" type="java.util.HashSet">
<item id="288" type="com.j2fe.workflow.definition.Transition">
<name id="289">goto-next</name>
<source id="290">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="291"/>
<directJoin>false</directJoin>
<name id="292">MBE CUST Issuers</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="293">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="294" type="java.util.HashSet">
<item id="295" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="296">database</name>
<stringValue id="297">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="298" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="299">indexedParameters[0]</name>
<stringValue id="300">OrgId</stringValue>
<type>VARIABLE</type>
</item>
<item id="301" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="302">querySQL</name>
<stringValue id="303">WITH source_data AS (&#13;
  SELECT DISTINCT issr.INSTR_ISSR_ID, CAST(? as VARCHAR) AS ORG_ID&#13;
  FROM FT_T_ISSR issr&#13;
  WHERE issr.END_TMS IS NULL&#13;
    AND issr.FINS_INST_MNEM IN (&#13;
      SELECT fiid.INST_MNEM&#13;
      FROM ft_t_fiid fiid&#13;
      WHERE fiid.FINS_ID_CTXT_TYP IN ('CCIF', 'ISSR_GCIF', 'LNLEGID')&#13;
        AND fiid.END_TMS IS NULL&#13;
        AND (&#13;
          fiid.INST_SYMBOL_STAT_TYP = 'ACTIVE'&#13;
          OR (&#13;
            fiid.INST_SYMBOL_STAT_TYP = 'INACTIVE'&#13;
            AND fiid.INST_SYMBOL_STAT_TMS &gt;= CURRENT_DATE - INTERVAL '35 days'&#13;
          )&#13;
        )&#13;
    )&#13;
)&#13;
INSERT INTO FT_T_IOI2 (&#13;
  INSTR_ISSR_ID, ORG_ID, UPDATING, UPDATED, ASSET_SOI,&#13;
  GTOR, CUST, ASSET_RUP, GTOR_RUP, CUST_RUP,&#13;
  NEW_IOI_MEMBER, CUST_IP, LAGR_FLAR, LAGR_FLAR_RUP&#13;
)&#13;
SELECT &#13;
  s.INSTR_ISSR_ID, s.ORG_ID, 'N', 'N', 'N',&#13;
  'N', 'Y', 'N', 'N', 'N',&#13;
  'Y', 'N', 'N', 'N'&#13;
FROM source_data s&#13;
ON CONFLICT (INSTR_ISSR_ID, ORG_ID)&#13;
DO UPDATE SET&#13;
  CUST = EXCLUDED.CUST&#13;
WHERE FT_T_IOI2.CUST IS DISTINCT FROM 'Y';</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="304" type="java.util.HashSet">
<item id="305" type="com.j2fe.workflow.definition.Transition">
<name id="306">goto-next</name>
<source id="307">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="308"/>
<directJoin>false</directJoin>
<name id="309">log add cust issuers</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="310">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="311" type="java.util.HashSet">
<item id="312" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="313">database</name>
<stringValue id="314">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="315" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="316">querySQL</name>
<stringValue id="317">call mhi_sp_eventlog (&#13;
	 'rebuildIOI2 Workflow',&#13;
	 'add CUST Issuers',&#13;
	'N/A'); </stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="318" type="java.util.HashSet">
<item id="319" type="com.j2fe.workflow.definition.Transition">
<name id="320">rows-found</name>
<source id="321">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="322"/>
<directJoin>false</directJoin>
<name id="323">Add CUST Issuers?</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="324">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="325" type="java.util.HashSet">
<item id="326" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="327">database</name>
<stringValue id="328">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="329" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="330">firstColumnsResult</name>
<stringValue id="331">newNonRUPIssuers</stringValue>
<type>VARIABLE</type>
</item>
<item id="332" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="333">indexedParameters[0]</name>
<stringValue id="334">OrgId</stringValue>
<type>VARIABLE</type>
</item>
<item id="335" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="336">querySQL</name>
<stringValue id="337">select 1 from FT_T_IOI2 where INSTR_ISSR_ID = 'CONTROL' and org_id = CAST(? AS VARCHAR) and CUST ='Y'</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="338" type="java.util.HashSet">
<item id="339" type="com.j2fe.workflow.definition.Transition">
<name id="340">goto-next</name>
<source id="341">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="342">Automatically generated</description>
<directJoin>false</directJoin>
<name id="343">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="344">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="345" type="java.util.HashSet">
<item id="346" type="com.j2fe.workflow.definition.Transition">
<name id="347">goto-next</name>
<source id="348">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="349"/>
<directJoin>false</directJoin>
<name id="350">GTOR RUPS</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="351">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="352" type="java.util.HashSet">
<item id="353" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="354">database</name>
<stringValue id="355">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="356" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="357">indexedParameters[0]</name>
<stringValue id="358">OrgId</stringValue>
<type>VARIABLE</type>
</item>
<item id="359" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="360">indexedParameters[1]</name>
<stringValue id="361">OrgId</stringValue>
<type>VARIABLE</type>
</item>
<item id="362" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="363">querySQL</name>
<objectValue id="364" type="java.lang.String">WITH source_data AS (&#13;
  SELECT DISTINCT issr.INSTR_ISSR_ID, CAST(? as VARCHAR) AS ORG_ID&#13;
  FROM FT_T_ISSR issr&#13;
  WHERE issr.END_TMS IS NULL&#13;
    AND issr.FINS_INST_MNEM IN (&#13;
      SELECT MHI_FINS_UP(sub_issr.FINS_INST_MNEM)&#13;
      FROM FT_T_ISSR sub_issr&#13;
      WHERE sub_issr.END_TMS IS NULL&#13;
        AND sub_issr.INSTR_ISSR_ID IN (&#13;
          SELECT issr_inner.INSTR_ISSR_ID&#13;
          FROM FT_T_ISSR issr_inner&#13;
          WHERE issr_inner.END_TMS IS NULL&#13;
            AND issr_inner.FINS_INST_MNEM IN (&#13;
              SELECT frip.INST_MNEM&#13;
              FROM FT_T_FRIP frip&#13;
              WHERE frip.FINSRL_TYP = 'GUARNTOR'&#13;
                AND frip.END_TMS IS NULL&#13;
                AND frip.INSTR_ID IN (&#13;
                  SELECT issu.INSTR_ID&#13;
                  FROM FT_T_ISSU issu&#13;
                  WHERE issu.END_TMS IS NULL&#13;
                    AND issu.INSTR_ID IN (&#13;
                      SELECT gp.INSTR_ID&#13;
                      FROM FT_T_ISGP gp&#13;
                      WHERE gp.END_TMS IS NULL&#13;
                        AND gp.PRNT_ISS_GRP_OID IN (&#13;
                          SELECT gr.ISS_GRP_OID&#13;
                          FROM FT_T_ISGR gr&#13;
                          WHERE TRIM(gr.ORG_ID) = CAST(? as VARCHAR)&#13;
                        )&#13;
                    )&#13;
                )&#13;
            )&#13;
        )&#13;
    )&#13;
)&#13;
INSERT INTO FT_T_IOI2 (&#13;
  INSTR_ISSR_ID, ORG_ID, UPDATING, UPDATED, ASSET_SOI,&#13;
  GTOR, CUST, ASSET_RUP, GTOR_RUP, CUST_RUP,&#13;
  NEW_IOI_MEMBER, CUST_IP, LAGR_FLAR, LAGR_FLAR_RUP&#13;
)&#13;
SELECT &#13;
  s.INSTR_ISSR_ID, s.ORG_ID, 'N', 'N', 'N',&#13;
  'N', 'N', 'N', 'Y', 'N',&#13;
  'Y', 'N', 'N', 'N'&#13;
FROM source_data s&#13;
ON CONFLICT (INSTR_ISSR_ID, ORG_ID)&#13;
DO UPDATE SET&#13;
  GTOR_RUP = EXCLUDED.GTOR_RUP&#13;
WHERE FT_T_IOI2.GTOR_RUP IS DISTINCT FROM 'Y';</objectValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="365" type="java.util.HashSet">
<item id="366" type="com.j2fe.workflow.definition.Transition">
<name id="367">goto-next</name>
<source id="368">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="369"/>
<directJoin>false</directJoin>
<name id="370">log add gtor rup issuers</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="371">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="372" type="java.util.HashSet">
<item id="373" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="374">database</name>
<stringValue id="375">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="376" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="377">querySQL</name>
<stringValue id="378">call mhi_sp_eventlog (&#13;
	 'rebuildIOI2 Workflow',&#13;
	 'add GTOR RUP Issuers',&#13;
	'N/A'); </stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="379" type="java.util.HashSet">
<item id="380" type="com.j2fe.workflow.definition.Transition">
<name id="381">rows-found</name>
<source id="382">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="383"/>
<directJoin>false</directJoin>
<name id="384">Add GTOR RUP Issuers?</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="385">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="386" type="java.util.HashSet">
<item id="387" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="388">database</name>
<stringValue id="389">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="390" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="391">firstColumnsResult</name>
<stringValue id="392">newNonRUPIssuers</stringValue>
<type>VARIABLE</type>
</item>
<item id="393" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="394">indexedParameters[0]</name>
<stringValue id="395">OrgId</stringValue>
<type>VARIABLE</type>
</item>
<item id="396" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="397">querySQL</name>
<stringValue id="398">select 1 from FT_T_IOI2 where INSTR_ISSR_ID = 'CONTROL'  and ORG_ID = CAST(? AS VARCHAR) and GTOR_RUP ='Y'</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="399" type="java.util.HashSet">
<item id="400" type="com.j2fe.workflow.definition.Transition">
<name id="401">ToSplit</name>
<source id="402">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="403">Automatically generated</description>
<directJoin>false</directJoin>
<name id="404">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="405">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="406" type="java.util.HashSet">
<item id="407" type="com.j2fe.workflow.definition.Transition">
<name id="408">goto-next</name>
<source id="409">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="410"/>
<directJoin>false</directJoin>
<name id="411">GTOR Issuers</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="412">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="413" type="java.util.HashSet">
<item id="414" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="415">database</name>
<stringValue id="416">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="417" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="418">indexedParameters[0]</name>
<stringValue id="419">OrgId</stringValue>
<type>VARIABLE</type>
</item>
<item id="420" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="421">indexedParameters[1]</name>
<stringValue id="422">OrgId</stringValue>
<type>VARIABLE</type>
</item>
<item id="423" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="424">querySQL</name>
<objectValue id="425" type="java.lang.String">WITH source_data AS (&#13;
  SELECT DISTINCT issr.INSTR_ISSR_ID, CAST(? as VARCHAR) AS ORG_ID&#13;
  FROM FT_T_ISSR issr&#13;
  WHERE issr.END_TMS IS NULL&#13;
    AND issr.FINS_INST_MNEM IN (&#13;
      SELECT frip.INST_MNEM&#13;
      FROM FT_T_FRIP frip&#13;
      WHERE frip.FINSRL_TYP = 'GUARNTOR'&#13;
        AND frip.END_TMS IS NULL&#13;
        AND frip.INSTR_ID IN (&#13;
          SELECT issu.INSTR_ID&#13;
          FROM FT_T_ISSU issu&#13;
          WHERE issu.END_TMS IS NULL&#13;
            AND issu.INSTR_ID IN (&#13;
              SELECT gp.INSTR_ID&#13;
              FROM FT_T_ISGP gp&#13;
              WHERE gp.END_TMS IS NULL&#13;
                AND gp.PRNT_ISS_GRP_OID IN (&#13;
                  SELECT gr.ISS_GRP_OID&#13;
                  FROM FT_T_ISGR gr&#13;
                  WHERE TRIM(gr.ORG_ID) = CAST(? as VARCHAR)&#13;
                )&#13;
            )&#13;
        )&#13;
    )&#13;
)&#13;
INSERT INTO FT_T_IOI2 (&#13;
  INSTR_ISSR_ID, ORG_ID, UPDATING, UPDATED, ASSET_SOI,&#13;
  GTOR, CUST, ASSET_RUP, GTOR_RUP, CUST_RUP,&#13;
  NEW_IOI_MEMBER, CUST_IP, LAGR_FLAR, LAGR_FLAR_RUP&#13;
)&#13;
SELECT &#13;
  s.INSTR_ISSR_ID, s.ORG_ID, 'N', 'N', 'N',&#13;
  'Y', 'N', 'N', 'N', 'N',&#13;
  'Y', 'N', 'N', 'N'&#13;
FROM source_data s&#13;
ON CONFLICT (INSTR_ISSR_ID, ORG_ID)&#13;
DO UPDATE SET&#13;
  GTOR = EXCLUDED.GTOR&#13;
WHERE FT_T_IOI2.GTOR IS DISTINCT FROM 'Y';</objectValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="426" type="java.util.HashSet">
<item id="427" type="com.j2fe.workflow.definition.Transition">
<name id="428">goto-next</name>
<source id="429">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="430"/>
<directJoin>false</directJoin>
<name id="431">log add gtor issuers</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="432">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="433" type="java.util.HashSet">
<item id="434" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="435">database</name>
<stringValue id="436">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="437" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="438">querySQL</name>
<stringValue id="439">call mhi_sp_eventlog (&#13;
	 'rebuildIOI2 Workflow',&#13;
	 'add GTOR Issuers',&#13;
	'N/A'); </stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="440" type="java.util.HashSet">
<item id="441" type="com.j2fe.workflow.definition.Transition">
<name id="442">rows-found</name>
<source id="443">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="444"/>
<directJoin>false</directJoin>
<name id="445">Add GTOR Issuers?</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="446">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="447" type="java.util.HashSet">
<item id="448" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="449">database</name>
<stringValue id="450">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="451" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="452">firstColumnsResult</name>
<stringValue id="453">newNonRUPIssuers</stringValue>
<type>VARIABLE</type>
</item>
<item id="454" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="455">indexedParameters[0]</name>
<stringValue id="456">OrgId</stringValue>
<type>VARIABLE</type>
</item>
<item id="457" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="458">querySQL</name>
<stringValue id="459">select 1 from FT_T_IOI2 where INSTR_ISSR_ID = 'CONTROL'  and ORG_ID = CAST(? AS VARCHAR) and GTOR ='Y'</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="460" type="java.util.HashSet">
<item id="461" type="com.j2fe.workflow.definition.Transition">
<name id="462">goto-next</name>
<source id="463">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="464">Automatically generated</description>
<directJoin>false</directJoin>
<name id="465">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="466">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="467" type="java.util.HashSet">
<item id="468" type="com.j2fe.workflow.definition.Transition">
<name id="469">goto-next</name>
<source id="470">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="471"/>
<directJoin>false</directJoin>
<name id="472">SOI Asset RUPS</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="473">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="474" type="java.util.HashSet">
<item id="475" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="476">database</name>
<stringValue id="477">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="478" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="479">indexedParameters[0]</name>
<stringValue id="480">OrgId</stringValue>
<type>VARIABLE</type>
</item>
<item id="481" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="482">indexedParameters[1]</name>
<stringValue id="483">OrgId</stringValue>
<type>VARIABLE</type>
</item>
<item id="484" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="485">querySQL</name>
<objectValue id="486" type="java.lang.String">WITH source_data AS (&#13;
  SELECT DISTINCT issr.INSTR_ISSR_ID, CAST(? as VARCHAR) AS ORG_ID&#13;
  FROM FT_T_ISSR issr&#13;
  WHERE issr.END_TMS IS NULL&#13;
    AND issr.FINS_INST_MNEM IN (&#13;
      SELECT MHI_FINS_UP(sub_issr.FINS_INST_MNEM)&#13;
      FROM FT_T_ISSR sub_issr&#13;
      WHERE sub_issr.END_TMS IS NULL&#13;
        AND sub_issr.INSTR_ISSR_ID IN (&#13;
          SELECT issu.INSTR_ISSR_ID&#13;
          FROM FT_T_ISSU issu&#13;
          WHERE issu.END_TMS IS NULL&#13;
            AND issu.INSTR_ID IN (&#13;
              SELECT isgp.INSTR_ID&#13;
              FROM FT_T_ISGP isgp&#13;
              WHERE isgp.END_TMS IS NULL&#13;
                AND isgp.PRNT_ISS_GRP_OID IN (&#13;
                  SELECT isgr.ISS_GRP_OID&#13;
                  FROM FT_T_ISGR isgr&#13;
                  WHERE TRIM(isgr.ORG_ID) = CAST(? as VARCHAR)&#13;
                )&#13;
            )&#13;
        )&#13;
    )&#13;
)&#13;
INSERT INTO FT_T_IOI2 (&#13;
  INSTR_ISSR_ID, ORG_ID, UPDATING, UPDATED, ASSET_SOI,&#13;
  GTOR, CUST, ASSET_RUP, GTOR_RUP, CUST_RUP,&#13;
  NEW_IOI_MEMBER, CUST_IP, LAGR_FLAR, LAGR_FLAR_RUP&#13;
)&#13;
SELECT &#13;
  s.INSTR_ISSR_ID, s.ORG_ID, 'N', 'N', 'N',&#13;
  'N', 'N', 'Y', 'N', 'N',&#13;
  'Y', 'N', 'N', 'N'&#13;
FROM source_data s&#13;
ON CONFLICT (INSTR_ISSR_ID, ORG_ID)&#13;
DO UPDATE SET&#13;
  ASSET_RUP = EXCLUDED.ASSET_RUP&#13;
WHERE FT_T_IOI2.ASSET_RUP IS DISTINCT FROM 'Y';</objectValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="487" type="java.util.HashSet">
<item id="488" type="com.j2fe.workflow.definition.Transition">
<name id="489">goto-next</name>
<source id="490">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="491"/>
<directJoin>false</directJoin>
<name id="492">log add asset rup issuers</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="493">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="494" type="java.util.HashSet">
<item id="495" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="496">database</name>
<stringValue id="497">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="498" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="499">querySQL</name>
<stringValue id="500">call mhi_sp_eventlog (&#13;
	 'rebuildIOI2 Workflow',&#13;
	 'add asset RUP Issuers',&#13;
	'N/A'); </stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="501" type="java.util.HashSet">
<item id="502" type="com.j2fe.workflow.definition.Transition">
<name id="503">rows-found</name>
<source id="504">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="505"/>
<directJoin>false</directJoin>
<name id="506">Add ASSET_RUP Issuers?</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="507">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="508" type="java.util.HashSet">
<item id="509" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="510">database</name>
<stringValue id="511">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="512" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="513">firstColumnsResult</name>
<stringValue id="514">newNonRUPIssuers</stringValue>
<type>VARIABLE</type>
</item>
<item id="515" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="516">indexedParameters[0]</name>
<stringValue id="517">OrgId</stringValue>
<type>VARIABLE</type>
</item>
<item id="518" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="519">querySQL</name>
<stringValue id="520">select 1 from FT_T_IOI2 where INSTR_ISSR_ID = 'CONTROL' and org_id = CAST(? AS VARCHAR) and ASSET_RUP ='Y'</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="521" type="java.util.HashSet">
<item id="522" type="com.j2fe.workflow.definition.Transition">
<name id="523">ToSplit</name>
<source id="524">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="525">Automatically generated</description>
<directJoin>false</directJoin>
<name id="526">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="527">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="528" type="java.util.HashSet">
<item id="529" type="com.j2fe.workflow.definition.Transition">
<name id="530">goto-next</name>
<source id="531">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="532"/>
<directJoin>false</directJoin>
<name id="533">SOI Issuers</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="534">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="535" type="java.util.HashSet">
<item id="536" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="537">database</name>
<stringValue id="538">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="539" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="540">indexedParameters[0]</name>
<stringValue id="541">OrgId</stringValue>
<type>VARIABLE</type>
</item>
<item id="542" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="543">indexedParameters[1]</name>
<stringValue id="544">OrgId</stringValue>
<type>VARIABLE</type>
</item>
<item id="545" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="546">querySQL</name>
<stringValue id="547">WITH source_data AS (&#13;
  SELECT DISTINCT &#13;
    issu.INSTR_ISSR_ID, &#13;
    CAST(? AS VARCHAR) AS ORG_ID&#13;
  FROM FT_T_ISSU issu&#13;
  WHERE issu.INSTR_ID IN (&#13;
    SELECT isgp.INSTR_ID&#13;
    FROM FT_T_ISGP isgp&#13;
    WHERE isgp.END_TMS IS NULL&#13;
      AND isgp.PRNT_ISS_GRP_OID IN (&#13;
        SELECT isgr.ISS_GRP_OID&#13;
        FROM FT_T_ISGR isgr&#13;
        WHERE TRIM(isgr.ORG_ID) = CAST(? AS VARCHAR)&#13;
      )&#13;
  )&#13;
)&#13;
INSERT INTO FT_T_IOI2 (&#13;
  INSTR_ISSR_ID, ORG_ID, UPDATING, UPDATED, ASSET_SOI,&#13;
  GTOR, CUST, ASSET_RUP, GTOR_RUP, CUST_RUP,&#13;
  NEW_IOI_MEMBER, CUST_IP, LAGR_FLAR, LAGR_FLAR_RUP&#13;
)&#13;
SELECT &#13;
  s.INSTR_ISSR_ID, s.ORG_ID, 'N', 'N', 'Y',&#13;
  'N', 'N', 'N', 'N', 'N',&#13;
  'Y', 'N', 'N', 'N'&#13;
FROM source_data s&#13;
ON CONFLICT (INSTR_ISSR_ID, ORG_ID)&#13;
DO UPDATE SET &#13;
  ASSET_SOI = EXCLUDED.ASSET_SOI&#13;
WHERE FT_T_IOI2.ASSET_SOI IS DISTINCT FROM 'Y';</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="548" type="java.util.HashSet">
<item id="549" type="com.j2fe.workflow.definition.Transition">
<name id="550">goto-next</name>
<source id="551">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="552"/>
<directJoin>false</directJoin>
<name id="553">log add soi issuers</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="554">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="555" type="java.util.HashSet">
<item id="556" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="557">database</name>
<stringValue id="558">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="559" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="560">querySQL</name>
<stringValue id="561">call mhi_sp_eventlog (&#13;
	 'rebuildIOI2 Workflow',&#13;
	 'add SOI Issuers',&#13;
	'N/A'); </stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="562" type="java.util.HashSet">
<item id="563" type="com.j2fe.workflow.definition.Transition">
<name id="564">rows-found</name>
<source id="565">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="566"/>
<directJoin>false</directJoin>
<name id="567">Add SOI Issuers?</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="568">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="569" type="java.util.HashSet">
<item id="570" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="571">database</name>
<stringValue id="572">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="573" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="574">firstColumnsResult</name>
<stringValue id="575">newNonRUPIssuers</stringValue>
<type>VARIABLE</type>
</item>
<item id="576" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="577">indexedParameters[0]</name>
<stringValue id="578">OrgId</stringValue>
<type>VARIABLE</type>
</item>
<item id="579" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="580">querySQL</name>
<stringValue id="581">select 1 from FT_T_IOI2 where INSTR_ISSR_ID = 'CONTROL' and ORG_ID = CAST(? AS VARCHAR) and ASSET_SOI ='Y'</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="582" type="java.util.HashSet">
<item id="583" type="com.j2fe.workflow.definition.Transition">
<name id="584">goto-next</name>
<source id="585">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="586"/>
<directJoin>false</directJoin>
<name id="587">Pop IOI2 with existing issuers</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="588">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="589" type="java.util.HashSet">
<item id="590" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="591">database</name>
<stringValue id="592">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="593" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="594">indexedParameters[0]</name>
<stringValue id="595">OrgId</stringValue>
<type>VARIABLE</type>
</item>
<item id="596" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="597">indexedParameters[1]</name>
<stringValue id="598">OrgId</stringValue>
<type>VARIABLE</type>
</item>
<item id="599" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="600">querySQL</name>
<stringValue id="601">INSERT INTO FT_T_IOI2 (INSTR_ISSR_ID,ORG_ID,UPDATING, UPDATED, ASSET_SOI, GTOR, CUST, ASSET_RUP, GTOR_RUP, CUST_RUP, CUST_IP, LAGR_FLAR, LAGR_FLAR_RUP, NEW_IOI_MEMBER, DELETE_FROM_IOI)&#13;
SELECT INSTR_ISSR_ID, CAST(? AS VARCHAR),  'N' UPDATING, 'N' UPDATED, 'N' ASSET_SOI, 'N' GTOR, 'N' CUST, 'N' ASSET_RUP, 'N' GTOR_RUP, 'N' CUST_RUP, 'N' CUST_IP, 'N' LAGR_FLAR, 'N' LAGR_FLAR_RUP, 'N' NEW_IOI_MEMBER, 'N' DELETE_FROM_IOI  &#13;
FROM FT_T_IRGP WHERE END_TMS IS NULL and PRNT_ISSR_GRP_OID in (select ISSR_GRP_OID from FT_T_IRGR where ORG_ID = CAST(? AS VARCHAR));</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="602" type="java.util.HashSet">
<item id="603" type="com.j2fe.workflow.definition.Transition">
<name id="604">goto-next</name>
<source id="605">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="606"/>
<directJoin>false</directJoin>
<name id="607">remove issuer rows</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="608">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="609" type="java.util.HashSet">
<item id="610" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="611">database</name>
<stringValue id="612">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="613" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="614">indexedParameters[0]</name>
<stringValue id="615">OrgId</stringValue>
<type>VARIABLE</type>
</item>
<item id="616" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="617">querySQL</name>
<stringValue id="618">DELETE FROM FT_T_IOI2 where INSTR_ISSR_ID != 'CONTROL'&#13;
and org_id = CAST(? AS VARCHAR)</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="619" type="java.util.HashSet">
<item id="620" type="com.j2fe.workflow.definition.Transition">
<name id="621">rows-found</name>
<source id="622">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="623"/>
<directJoin>false</directJoin>
<name id="624">check if run = Y</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="625">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="626" type="java.util.HashSet">
<item id="627" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="628">database</name>
<stringValue id="629">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="630" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="631">firstColumnsResult</name>
<stringValue id="632">newNonRUPIssuers</stringValue>
<type>VARIABLE</type>
</item>
<item id="633" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="634">indexedParameters[0]</name>
<stringValue id="635">OrgId</stringValue>
<type>VARIABLE</type>
</item>
<item id="636" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="637">querySQL</name>
<stringValue id="638">select 1 from FT_T_IOI2 where INSTR_ISSR_ID = 'CONTROL' and ORG_ID = ? and RUN_WORKFLOW='Y'</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="639" type="java.util.HashSet">
<item id="640" type="com.j2fe.workflow.definition.Transition">
<name id="641">goto-next</name>
<source id="642">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="643"/>
<directJoin>false</directJoin>
<name id="644">log IOI name</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="645">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="646" type="java.util.HashSet">
<item id="647" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="648">database</name>
<stringValue id="649">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="650" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="651">indexedParameters[0]</name>
<stringValue id="652">ioiName</stringValue>
<type>VARIABLE</type>
</item>
<item id="653" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="654">querySQL</name>
<stringValue id="655">call mhi_sp_eventlog (&#13;
	 'rebuildIOI2 Issuer Group Name',&#13;
	 cast(? as varchar),&#13;
	'N/A');</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="656" type="java.util.HashSet">
<item id="657" type="com.j2fe.workflow.definition.Transition">
<name id="658">goto-next</name>
<source id="659">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="660"/>
<directJoin>false</directJoin>
<name id="661">get IOI name</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="662">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="663" type="java.util.HashSet">
<item id="664" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="665">database</name>
<stringValue id="666">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="667" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="668">[0]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="669">firstColumnsResult[0]</name>
<stringValue id="670">ioiName</stringValue>
<type>VARIABLE</type>
</item>
<item id="671" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="672">indexedParameters[0]</name>
<stringValue id="673">OrgId</stringValue>
<type>VARIABLE</type>
</item>
<item id="674" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="675">querySQL</name>
<stringValue id="676">select GRP_NME from FT_T_IRGR where trim(ORG_ID) = cast(? as varchar)</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="677" type="java.util.HashSet">
<item id="678" type="com.j2fe.workflow.definition.Transition">
<name id="679">goto-next</name>
<source id="680">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="681"/>
<directJoin>false</directJoin>
<name id="682">log OrgID</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="683">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="684" type="java.util.HashSet">
<item id="685" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="686">database</name>
<stringValue id="687">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="688" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="689">indexedParameters[0]</name>
<stringValue id="690">OrgId</stringValue>
<type>VARIABLE</type>
</item>
<item id="691" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="692">querySQL</name>
<stringValue id="693">call mhi_sp_eventlog (&#13;
	 'rebuildIOI2 Workflow OrgId',&#13;
	 cast(? as varchar),&#13;
	'N/A');</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="694" type="java.util.HashSet">
<item id="695" type="com.j2fe.workflow.definition.Transition">
<name id="696">goto-next</name>
<source id="697">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="698"/>
<directJoin>false</directJoin>
<name id="699">log job start</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="700">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="701" type="java.util.HashSet">
<item id="702" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="703">database</name>
<stringValue id="704">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="705" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="706">querySQL</name>
<stringValue id="707">call mhi_sp_eventlog (&#13;
	 'rebuildIOI2 Workflow',&#13;
	 'workflow starting',&#13;
	'N/A');</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="708" type="java.util.HashSet">
<item id="709" type="com.j2fe.workflow.definition.Transition">
<name id="710">goto-next</name>
<source id="711">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="712"/>
<directJoin>false</directJoin>
<name id="713">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="714">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="715" type="java.util.HashSet"/>
<targets id="716" type="java.util.HashSet">
<item idref="709" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="697"/>
</item>
</sources>
<targets id="717" type="java.util.HashSet">
<item idref="695" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="680"/>
</item>
</sources>
<targets id="718" type="java.util.HashSet">
<item idref="678" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="659"/>
</item>
</sources>
<targets id="719" type="java.util.HashSet">
<item idref="657" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="642"/>
</item>
</sources>
<targets id="720" type="java.util.HashSet">
<item idref="640" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="622"/>
</item>
</sources>
<targets id="721" type="java.util.HashSet">
<item id="722" type="com.j2fe.workflow.definition.Transition">
<name id="723">nothing-found</name>
<source idref="622"/>
<target id="724">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="725"/>
<directJoin>false</directJoin>
<name id="726">log job terminating</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="727">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="728" type="java.util.HashSet">
<item id="729" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="730">database</name>
<stringValue id="731">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="732" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="733">querySQL</name>
<stringValue id="734">call mhi_sp_eventlog (&#13;
	 'rebuildIOI2 Workflow',&#13;
	 'terminating as RUN_WORKFLOW=N',&#13;
	'N/A');</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="735" type="java.util.HashSet">
<item idref="722" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="736" type="java.util.HashSet">
<item id="737" type="com.j2fe.workflow.definition.Transition">
<name id="738">goto-next</name>
<source idref="724"/>
<target id="739">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="740"/>
<directJoin>false</directJoin>
<name id="741">log job finish</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="742">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="743" type="java.util.HashSet">
<item id="744" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="745">database</name>
<stringValue id="746">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="747" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="748">querySQL</name>
<stringValue id="749">call&#13;
 mhi_sp_eventlog (&#13;
	 'rebuildIOI2 Workflow',&#13;
	 'workflow ending',&#13;
	'N/A'); &#13;
</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="750" type="java.util.HashSet">
<item id="751" type="com.j2fe.workflow.definition.Transition">
<name id="752">goto-next</name>
<source id="753">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="754"/>
<directJoin>false</directJoin>
<name id="755">XML publish end dated issuers</name>
<nodeHandler>com.j2fe.event.RaiseEventRemote</nodeHandler>
<nodeHandlerClass id="756">com.j2fe.event.RaiseEventRemote</nodeHandlerClass>
<parameters id="757" type="java.util.HashSet">
<item id="758" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="759">eventName</name>
<stringValue id="760">PublishUsingXML</stringValue>
<type>CONSTANT</type>
</item>
<item id="761" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="762">["JobXML"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="763">parameters["JobXML"]</name>
<stringValue id="764">publishXML</stringValue>
<type>VARIABLE</type>
</item>
<item id="765" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="766">propertyFileLocation</name>
<stringValue id="767">db://resource/PublishingConfiguration/PublishingConfig.properties</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="768" type="java.util.HashSet">
<item id="769" type="com.j2fe.workflow.definition.Transition">
<name id="770">goto-next</name>
<source id="771">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="772"/>
<directJoin>false</directJoin>
<name id="773">setup publish XML</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="774">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="775" type="java.util.HashSet">
<item id="776" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="777">statements</name>
<stringValue id="778">String publishXML = "&lt;?xml version=\"1.0\" encoding=\"UTF-8\"?&gt;";&#13;
publishXML = publishXML + "&lt;root&gt;";&#13;
publishXML = publishXML + " &lt;job modelId=\"ISSRPUB\" destinationJMS=\"jms/queue/issuer\"&gt;";&#13;
publishXML = publishXML + " &lt;sql&gt;INSTR_ISSR_ID IN (SELECT DISTINCT INSTR_ISSR_ID FROM FT_T_IOI2 WHERE DELETE_FROM_IOI = 'Y' AND INSTR_ISSR_ID != 'CONTROL' and ORG_ID = trim('" + OrgId + "'))&lt;/sql&gt;";&#13;
publishXML = publishXML + " &lt;/job&gt;";&#13;
publishXML = publishXML + "&lt;/root&gt;";</stringValue>
<type>CONSTANT</type>
</item>
<item id="779" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="780">variables["OrgId"]</name>
<stringValue id="781">OrgId</stringValue>
<type>VARIABLE</type>
</item>
<item id="782" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="783">variables["publishXML"]</name>
<stringValue id="784">publishXML</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="785" type="java.util.HashSet">
<item id="786" type="com.j2fe.workflow.definition.Transition">
<name id="787">goto-next</name>
<source id="788">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="789"/>
<directJoin>true</directJoin>
<name id="790">Synchronize</name>
<nodeHandler>com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandler>
<nodeHandlerClass id="791">com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandlerClass>
<sources id="792" type="java.util.HashSet">
<item id="793" type="com.j2fe.workflow.definition.Transition">
<name id="794">end-loop</name>
<source id="795">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="796"/>
<directJoin>false</directJoin>
<name id="797">Loop each old issuer</name>
<nodeHandler>com.j2fe.workflow.handler.impl.ForEach</nodeHandler>
<nodeHandlerClass id="798">com.j2fe.workflow.handler.impl.ForEach</nodeHandlerClass>
<parameters id="799" type="java.util.HashSet">
<item id="800" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="801">counter</name>
<stringValue id="802">LoopCounter</stringValue>
<type>VARIABLE</type>
</item>
<item id="803" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="804">counter</name>
<stringValue id="805">LoopCounter</stringValue>
<type>VARIABLE</type>
</item>
<item id="806" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="807">input</name>
<stringValue id="808">BulkOldIssuers</stringValue>
<type>VARIABLE</type>
</item>
<item id="809" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="810">output</name>
<stringValue id="811">oldIssuer</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="812" type="java.util.HashSet">
<item id="813" type="com.j2fe.workflow.definition.Transition">
<name id="814">ToSplit</name>
<source id="815">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="816">Automatically generated</description>
<directJoin>false</directJoin>
<name id="817">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="818">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="819" type="java.util.HashSet">
<item id="820" type="com.j2fe.workflow.definition.Transition">
<name id="821">goto-next</name>
<source id="822">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="823"/>
<directJoin>false</directJoin>
<name id="824">Bean Shell Script (Standard)</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="825">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="826" type="java.util.HashSet">
<item id="827" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="828">statements</name>
<stringValue id="829">int loopCounter =0;</stringValue>
<type>CONSTANT</type>
</item>
<item id="830" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="831">variables["loopCounter"]</name>
<stringValue id="832">LoopCounter</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="833" type="java.util.HashSet">
<item id="834" type="com.j2fe.workflow.definition.Transition">
<name id="835">goto-next</name>
<source id="836">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="837"/>
<directJoin>true</directJoin>
<name id="838">Bulk delete IOI</name>
<nodeHandler>com.j2fe.general.activities.BulkItems</nodeHandler>
<nodeHandlerClass id="839">com.j2fe.general.activities.BulkItems</nodeHandlerClass>
<parameters id="840" type="java.util.HashSet">
<item id="841" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="842">bulk</name>
<stringValue id="843">BulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="844" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="845">input</name>
<stringValue id="846">oldIssuers</stringValue>
<type>VARIABLE</type>
</item>
<item id="847" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="848">output</name>
<stringValue id="849">BulkOldIssuers</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="850" type="java.util.HashSet">
<item id="851" type="com.j2fe.workflow.definition.Transition">
<name id="852">goto-next</name>
<source id="853">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="854"/>
<directJoin>false</directJoin>
<name id="855">log remove issuers from IOI</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="856">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="857" type="java.util.HashSet">
<item id="858" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="859">database</name>
<stringValue id="860">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="861" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="862">querySQL</name>
<stringValue id="863">call&#13;
 mhi_sp_eventlog (&#13;
	 'rebuildIOI2 Workflow',&#13;
	 'remove issuers from IOI',&#13;
	'N/A'); &#13;
</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="864" type="java.util.HashSet">
<item id="865" type="com.j2fe.workflow.definition.Transition">
<name id="866">rows-found</name>
<source id="867">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="868"/>
<directJoin>false</directJoin>
<name id="869">Issuers to remove from IOI</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="870">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="871" type="java.util.HashSet">
<item id="872" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="873">database</name>
<stringValue id="874">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="875" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="876">firstColumnsResult</name>
<stringValue id="877">oldIssuers</stringValue>
<type>VARIABLE</type>
</item>
<item id="878" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="879">indexedParameters[0]</name>
<stringValue id="880">OrgId</stringValue>
<type>VARIABLE</type>
</item>
<item id="881" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="882">querySQL</name>
<stringValue id="883">select INSTR_ISSR_ID from FT_T_IOI2 where UPDATED='N' and DELETE_FROM_IOI = 'Y'  AND INSTR_ISSR_ID != 'CONTROL' and ORG_ID = CAST(? AS VARCHAR) </stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="884" type="java.util.HashSet">
<item id="885" type="com.j2fe.workflow.definition.Transition">
<name id="886">ToSplit</name>
<source id="887">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="888">Automatically generated</description>
<directJoin>false</directJoin>
<name id="889">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="890">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="891" type="java.util.HashSet">
<item id="892" type="com.j2fe.workflow.definition.Transition">
<name id="893">goto-next</name>
<source id="894">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="895"/>
<directJoin>true</directJoin>
<name id="896">Synchronize</name>
<nodeHandler>com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandler>
<nodeHandlerClass id="897">com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandlerClass>
<sources id="898" type="java.util.HashSet">
<item id="899" type="com.j2fe.workflow.definition.Transition">
<name id="900">end-loop</name>
<source id="901">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="902"/>
<directJoin>false</directJoin>
<name id="903">Loop each locked issuer</name>
<nodeHandler>com.j2fe.workflow.handler.impl.ForEach</nodeHandler>
<nodeHandlerClass id="904">com.j2fe.workflow.handler.impl.ForEach</nodeHandlerClass>
<parameters id="905" type="java.util.HashSet">
<item id="906" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="907">counter</name>
<stringValue id="908">LoopCounter</stringValue>
<type>VARIABLE</type>
</item>
<item id="909" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="910">counter</name>
<stringValue id="911">LoopCounter</stringValue>
<type>VARIABLE</type>
</item>
<item id="912" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="913">input</name>
<stringValue id="914">BulkLockedIssuers</stringValue>
<type>VARIABLE</type>
</item>
<item id="915" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="916">output</name>
<stringValue id="917">lockedIssuer</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="918" type="java.util.HashSet">
<item id="919" type="com.j2fe.workflow.definition.Transition">
<name id="920">ToSplit</name>
<source id="921">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="922">Automatically generated</description>
<directJoin>false</directJoin>
<name id="923">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="924">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="925" type="java.util.HashSet">
<item id="926" type="com.j2fe.workflow.definition.Transition">
<name id="927">goto-next</name>
<source id="928">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="929"/>
<directJoin>false</directJoin>
<name id="930">Bean Shell Script (Standard)</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="931">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="932" type="java.util.HashSet">
<item id="933" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="934">statements</name>
<stringValue id="935">int loopCounter =0;</stringValue>
<type>CONSTANT</type>
</item>
<item id="936" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="937">variables["loopCounter"]</name>
<stringValue id="938">LoopCounter</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="939" type="java.util.HashSet">
<item id="940" type="com.j2fe.workflow.definition.Transition">
<name id="941">goto-next</name>
<source id="942">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="943"/>
<directJoin>true</directJoin>
<name id="944">Bulk update locked issuers</name>
<nodeHandler>com.j2fe.general.activities.BulkItems</nodeHandler>
<nodeHandlerClass id="945">com.j2fe.general.activities.BulkItems</nodeHandlerClass>
<parameters id="946" type="java.util.HashSet">
<item id="947" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="948">bulk</name>
<stringValue id="949">BulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="950" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="951">input</name>
<stringValue id="952">lockedIssuers</stringValue>
<type>VARIABLE</type>
</item>
<item id="953" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="954">output</name>
<stringValue id="955">BulkLockedIssuers</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="956" type="java.util.HashSet">
<item id="957" type="com.j2fe.workflow.definition.Transition">
<name id="958">rows-found</name>
<source id="959">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="960"/>
<directJoin>false</directJoin>
<name id="961">Check for locks</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="962">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="963" type="java.util.HashSet">
<item id="964" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="965">database</name>
<stringValue id="966">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="967" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="968">firstColumnsResult</name>
<stringValue id="969">lockedIssuers</stringValue>
<type>VARIABLE</type>
</item>
<item id="970" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="971">indexedParameters[0]</name>
<stringValue id="972">OrgId</stringValue>
<type>VARIABLE</type>
</item>
<item id="973" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="974">querySQL</name>
<stringValue id="975">select INSTR_ISSR_ID from FT_T_IOI2 where UPDATED='N' and DELETE_FROM_IOI = 'Y'  AND INSTR_ISSR_ID != 'CONTROL' and ORG_ID = CAST(? AS VARCHAR) &#13;
and INSTR_ISSR_ID in (select OVR_REF_OID from ft_t_ovrc where tbl_id = 'IRGP' and END_TMS is null)</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="976" type="java.util.HashSet">
<item id="977" type="com.j2fe.workflow.definition.Transition">
<name id="978">goto-next</name>
<source id="979">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="980"/>
<directJoin>false</directJoin>
<name id="981">Flag Issuers to remove from IOI</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="982">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="983" type="java.util.HashSet">
<item id="984" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="985">database</name>
<stringValue id="986">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="987" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="988">indexedParameters[0]</name>
<stringValue id="989">OrgId</stringValue>
<type>VARIABLE</type>
</item>
<item id="990" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="991">querySQL</name>
<stringValue id="992">UPDATE FT_T_IOI2 SET DELETE_FROM_IOI='Y'&#13;
WHERE ASSET_SOI = 'N' AND GTOR='N' AND CUST='N' AND ASSET_RUP='N' AND GTOR_RUP='N' AND CUST_RUP='N' AND CUST_IP='N' and LAGR_FLAR = 'N' and LAGR_FLAR_RUP = 'N' and INSTR_ISSR_ID != 'CONTROL' and ORG_ID = CAST(? AS VARCHAR)</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="993" type="java.util.HashSet">
<item id="994" type="com.j2fe.workflow.definition.Transition">
<name id="995">goto-next</name>
<source id="996">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="997"/>
<directJoin>false</directJoin>
<name id="998">log check for locks</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="999">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="1000" type="java.util.HashSet">
<item id="1001" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1002">database</name>
<stringValue id="1003">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="1004" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1005">querySQL</name>
<stringValue id="1006">call&#13;
 mhi_sp_eventlog (&#13;
	 'rebuildIOI2 Workflow',&#13;
	 'check for locks',&#13;
	'N/A'); &#13;
</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1007" type="java.util.HashSet">
<item id="1008" type="com.j2fe.workflow.definition.Transition">
<name id="1009">ToSplit</name>
<source id="1010">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="1011">Automatically generated</description>
<directJoin>false</directJoin>
<name id="1012">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="1013">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="1014" type="java.util.HashSet">
<item id="1015" type="com.j2fe.workflow.definition.Transition">
<name id="1016">goto-next</name>
<source id="1017">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="1018"/>
<directJoin>true</directJoin>
<name id="1019">Synchronize</name>
<nodeHandler>com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandler>
<nodeHandlerClass id="1020">com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandlerClass>
<sources id="1021" type="java.util.HashSet">
<item id="1022" type="com.j2fe.workflow.definition.Transition">
<name id="1023">end-loop</name>
<source id="1024">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="1025"/>
<directJoin>false</directJoin>
<name id="1026">Loop each new issuer</name>
<nodeHandler>com.j2fe.workflow.handler.impl.ForEach</nodeHandler>
<nodeHandlerClass id="1027">com.j2fe.workflow.handler.impl.ForEach</nodeHandlerClass>
<parameters id="1028" type="java.util.HashSet">
<item id="1029" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1030">counter</name>
<stringValue id="1031">LoopCounter</stringValue>
<type>VARIABLE</type>
</item>
<item id="1032" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="1033">counter</name>
<stringValue id="1034">LoopCounter</stringValue>
<type>VARIABLE</type>
</item>
<item id="1035" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1036">input</name>
<stringValue id="1037">newNonRUPIssuers</stringValue>
<type>VARIABLE</type>
</item>
<item id="1038" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="1039">output</name>
<stringValue id="1040">nonRUPIssuer</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="1041" type="java.util.HashSet">
<item id="1042" type="com.j2fe.workflow.definition.Transition">
<name id="1043">ToSplit</name>
<source id="1044">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="1045">Automatically generated</description>
<directJoin>false</directJoin>
<name id="1046">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="1047">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="1048" type="java.util.HashSet">
<item id="1049" type="com.j2fe.workflow.definition.Transition">
<name id="1050">goto-next</name>
<source id="1051">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="1052"/>
<directJoin>false</directJoin>
<name id="1053">Bean Shell Script (Standard)</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="1054">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="1055" type="java.util.HashSet">
<item id="1056" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1057">statements</name>
<stringValue id="1058">int loopCounter =0;</stringValue>
<type>CONSTANT</type>
</item>
<item id="1059" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="1060">variables["loopCounter"]</name>
<stringValue id="1061">LoopCounter</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="1062" type="java.util.HashSet">
<item id="1063" type="com.j2fe.workflow.definition.Transition">
<name id="1064">goto-next</name>
<source id="1065">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="1066"/>
<directJoin>true</directJoin>
<name id="1067">Bulk newIssuers</name>
<nodeHandler>com.j2fe.general.activities.BulkItems</nodeHandler>
<nodeHandlerClass id="1068">com.j2fe.general.activities.BulkItems</nodeHandlerClass>
<parameters id="1069" type="java.util.HashSet">
<item id="1070" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1071">bulk</name>
<stringValue id="1072">BulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="1073" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1074">input</name>
<stringValue id="1075">newNonRUPIssuers</stringValue>
<type>VARIABLE</type>
</item>
<item id="1076" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="1077">output</name>
<stringValue id="1078">BulknonRUPIssuers</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="1079" type="java.util.HashSet">
<item id="1080" type="com.j2fe.workflow.definition.Transition">
<name id="1081">goto-next</name>
<source id="1082">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="1083"/>
<directJoin>false</directJoin>
<name id="1084">log add issuers to IOI</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="1085">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="1086" type="java.util.HashSet">
<item id="1087" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1088">database</name>
<stringValue id="1089">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="1090" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1091">querySQL</name>
<stringValue id="1092">call&#13;
 mhi_sp_eventlog (&#13;
	 'rebuildIOI2 Workflow',&#13;
	 'add Issuers to IOI',&#13;
	'N/A'); &#13;
</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1093" type="java.util.HashSet">
<item id="1094" type="com.j2fe.workflow.definition.Transition">
<name id="1095">rows-found</name>
<source id="1096">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="1097"/>
<directJoin>false</directJoin>
<name id="1098">Issuers to Add to IOI</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="1099">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="1100" type="java.util.HashSet">
<item id="1101" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1102">database</name>
<stringValue id="1103">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="1104" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="1105">firstColumnsResult</name>
<stringValue id="1106">newNonRUPIssuers</stringValue>
<type>VARIABLE</type>
</item>
<item id="1107" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1108">indexedParameters[0]</name>
<stringValue id="1109">OrgId</stringValue>
<type>VARIABLE</type>
</item>
<item id="1110" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1111">querySQL</name>
<stringValue id="1112">select INSTR_ISSR_ID from FT_T_IOI2 &#13;
where UPDATED='N' and NEW_IOI_MEMBER = 'Y' AND INSTR_ISSR_ID != 'CONTROL' and ORG_ID = CAST(? AS VARCHAR) </stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1113" type="java.util.HashSet">
<item id="1114" type="com.j2fe.workflow.definition.Transition">
<name id="1115">ToSplit</name>
<source id="1116">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="1117">Automatically generated</description>
<directJoin>false</directJoin>
<name id="1118">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="1119">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="1120" type="java.util.HashSet">
<item id="1121" type="com.j2fe.workflow.definition.Transition">
<name id="1122">goto-next</name>
<source id="1123">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="1124"/>
<directJoin>true</directJoin>
<name id="1125">Synchronize</name>
<nodeHandler>com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandler>
<nodeHandlerClass id="1126">com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandlerClass>
<sources id="1127" type="java.util.HashSet">
<item id="1128" type="com.j2fe.workflow.definition.Transition">
<name id="1129">end-loop</name>
<source id="1130">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="1131"/>
<directJoin>false</directJoin>
<name id="1132">Loop each new issuer</name>
<nodeHandler>com.j2fe.workflow.handler.impl.ForEach</nodeHandler>
<nodeHandlerClass id="1133">com.j2fe.workflow.handler.impl.ForEach</nodeHandlerClass>
<parameters id="1134" type="java.util.HashSet">
<item id="1135" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1136">counter</name>
<stringValue id="1137">LoopCounter</stringValue>
<type>VARIABLE</type>
</item>
<item id="1138" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="1139">counter</name>
<stringValue id="1140">LoopCounter</stringValue>
<type>VARIABLE</type>
</item>
<item id="1141" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1142">input</name>
<stringValue id="1143">BulkNewIssuers</stringValue>
<type>VARIABLE</type>
</item>
<item id="1144" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="1145">output</name>
<stringValue id="1146">newIssuer</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="1147" type="java.util.HashSet">
<item id="1148" type="com.j2fe.workflow.definition.Transition">
<name id="1149">ToSplit</name>
<source id="1150">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="1151">Automatically generated</description>
<directJoin>false</directJoin>
<name id="1152">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="1153">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="1154" type="java.util.HashSet">
<item id="1155" type="com.j2fe.workflow.definition.Transition">
<name id="1156">goto-next</name>
<source id="1157">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="1158"/>
<directJoin>false</directJoin>
<name id="1159">Bean Shell Script (Standard)</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="1160">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="1161" type="java.util.HashSet">
<item id="1162" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1163">statements</name>
<stringValue id="1164">int loopCounter =0;</stringValue>
<type>CONSTANT</type>
</item>
<item id="1165" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="1166">variables["loopCounter"]</name>
<stringValue id="1167">LoopCounter</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="1168" type="java.util.HashSet">
<item id="1169" type="com.j2fe.workflow.definition.Transition">
<name id="1170">goto-next</name>
<source id="1171">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="1172"/>
<directJoin>true</directJoin>
<name id="1173">Bulk RUP newIssuers</name>
<nodeHandler>com.j2fe.general.activities.BulkItems</nodeHandler>
<nodeHandlerClass id="1174">com.j2fe.general.activities.BulkItems</nodeHandlerClass>
<parameters id="1175" type="java.util.HashSet">
<item id="1176" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1177">bulk</name>
<stringValue id="1178">BulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="1179" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1180">input</name>
<stringValue id="1181">newIssuers</stringValue>
<type>VARIABLE</type>
</item>
<item id="1182" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="1183">output</name>
<stringValue id="1184">BulkNewIssuers</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="1185" type="java.util.HashSet">
<item id="1186" type="com.j2fe.workflow.definition.Transition">
<name id="1187">goto-next</name>
<source id="1188">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="1189"/>
<directJoin>false</directJoin>
<name id="1190">log add rup issuers to IOI</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="1191">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="1192" type="java.util.HashSet">
<item id="1193" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1194">database</name>
<stringValue id="1195">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="1196" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1197">querySQL</name>
<stringValue id="1198">call&#13;
 mhi_sp_eventlog (&#13;
	 'rebuildIOI2 Workflow',&#13;
	 'add RUP Issuers to IOI',&#13;
	'N/A'); </stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1199" type="java.util.HashSet">
<item id="1200" type="com.j2fe.workflow.definition.Transition">
<name id="1201">rows-found</name>
<source id="1202">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="1203"/>
<directJoin>false</directJoin>
<name id="1204">RUP Issuers to Add to IOI</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="1205">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="1206" type="java.util.HashSet">
<item id="1207" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1208">database</name>
<stringValue id="1209">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="1210" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="1211">firstColumnsResult</name>
<stringValue id="1212">newIssuers</stringValue>
<type>VARIABLE</type>
</item>
<item id="1213" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1214">indexedParameters[0]</name>
<stringValue id="1215">OrgId</stringValue>
<type>VARIABLE</type>
</item>
<item id="1216" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1217">querySQL</name>
<stringValue id="1218">select INSTR_ISSR_ID from FT_T_IOI2&#13;
where UPDATED='N' and NEW_IOI_MEMBER = 'Y'&#13;
and (ASSET_RUP='Y' or GTOR_RUP='Y' or CUST_RUP='Y' or LAGR_FLAR_RUP = 'Y')&#13;
and ORG_ID = CAST(? AS VARCHAR) &#13;
and INSTR_ISSR_ID != 'CONTROL'</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1219" type="java.util.HashSet">
<item id="1220" type="com.j2fe.workflow.definition.Transition">
<name id="1221">goto-next</name>
<source id="1222">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="1223"/>
<directJoin>false</directJoin>
<name id="1224">Create Request Transaction</name>
<nodeHandler>com.j2fe.streetlamp.activities.CreateTransaction</nodeHandler>
<nodeHandlerClass id="1225">com.j2fe.streetlamp.activities.CreateTransaction</nodeHandlerClass>
<parameters id="1226" type="java.util.HashSet">
<item id="1227" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1228">flushImmediate</name>
<stringValue id="1229">true</stringValue>
<type>CONSTANT</type>
</item>
<item id="1230" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1231">jobId</name>
<stringValue id="1232">ParentJobID</stringValue>
<type>VARIABLE</type>
</item>
<item id="1233" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="1234">transactionId</name>
<stringValue id="1235">RequestTransaction</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="1236" type="java.util.HashSet">
<item id="1237" type="com.j2fe.workflow.definition.Transition">
<name id="1238">rows-found</name>
<source idref="24"/>
<target idref="1222"/>
</item>
</sources>
<targets id="1239" type="java.util.HashSet">
<item idref="1220" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="1202"/>
</item>
</sources>
<targets id="1240" type="java.util.HashSet">
<item id="1241" type="com.j2fe.workflow.definition.Transition">
<name id="1242">nothing-found</name>
<source idref="1202"/>
<target idref="1116"/>
</item>
<item idref="1200" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="1188"/>
</item>
</sources>
<targets id="1243" type="java.util.HashSet">
<item idref="1186" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="1171"/>
</item>
</sources>
<targets id="1244" type="java.util.HashSet">
<item idref="1169" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDSPLIT</type>
</source>
<target idref="1157"/>
</item>
</sources>
<targets id="1245" type="java.util.HashSet">
<item idref="1155" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="1150"/>
</item>
<item id="1246" type="com.j2fe.workflow.definition.Transition">
<name id="1247">goto-next</name>
<source id="1248">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="1249"/>
<directJoin>false</directJoin>
<name id="1250">UPDATE IOI2</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="1251">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="1252" type="java.util.HashSet">
<item id="1253" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1254">database</name>
<stringValue id="1255">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="1256" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1257">indexedParameters[0]</name>
<stringValue id="1258">newIssuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="1259" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1260">indexedParameters[1]</name>
<stringValue id="1261">OrgId</stringValue>
<type>VARIABLE</type>
</item>
<item id="1262" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1263">querySQL</name>
<stringValue id="1264">UPDATE FT_T_IOI2 &#13;
SET UPDATING='N', UPDATED='Y' WHERE INSTR_ISSR_ID = CAST(? AS VARCHAR) &#13;
and ORG_ID = CAST(? AS VARCHAR) </stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1265" type="java.util.HashSet">
<item id="1266" type="com.j2fe.workflow.definition.Transition">
<name id="1267">goto-next</name>
<source id="1268">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="1269"/>
<directJoin>false</directJoin>
<name id="1270">log updated issuer</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="1271">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="1272" type="java.util.HashSet">
<item id="1273" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1274">database</name>
<stringValue id="1275">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="1276" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1277">indexedParameters[0]</name>
<stringValue id="1278">newIssuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="1279" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1280">querySQL</name>
<stringValue id="1281">call&#13;
 mhi_sp_eventlog (&#13;
	 'rebuildIOI2 Workflow',&#13;
	 'flagged isuer as updated',&#13;
  CAST(? AS VARCHAR)); &#13;
</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1282" type="java.util.HashSet">
<item id="1283" type="com.j2fe.workflow.definition.Transition">
<name id="1284">goto-next</name>
<source id="1285">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="1286"/>
<directJoin>false</directJoin>
<name id="1287">IOI REAL message</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="1288">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="1289" type="java.util.HashSet">
<item id="1290" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="1291">["BulkSize"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="1292">input["BulkSize"]</name>
<stringValue id="1293">BulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="1294" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="1295">["PublishFlag"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="1296">input["PublishFlag"]</name>
<objectValue id="1297" type="java.lang.String">Y</objectValue>
<type>CONSTANT</type>
</item>
<item id="1298" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="1299">["sqlSelect"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="1300">input["sqlSelect"]</name>
<stringValue id="1301">ioiAddMSg</stringValue>
<type>VARIABLE</type>
</item>
<item id="1302" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1303">name</name>
<stringValue id="1304">RealMessageProcessing</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1305" type="java.util.HashSet">
<item id="1306" type="com.j2fe.workflow.definition.Transition">
<name id="1307">goto-next</name>
<source id="1308">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="1309"/>
<directJoin>false</directJoin>
<name id="1310">IOI REAL Query</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="1311">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="1312" type="java.util.HashSet">
<item id="1313" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1314">statements</name>
<objectValue id="1315" type="java.lang.String">query = "SELECT distinct '&lt;!DOCTYPE STREET_REF SYSTEM \"fti://repository/dtd/STREET_REF\"&gt;' || ";&#13;
query = query + "XMLElement(NAME \"STREET_REF\",XMLAttributes( 'GUEST' AS \"USERID\"), ";&#13;
query = query + "XMLElement(NAME \"HEADER\", ";&#13;
query = query + "XMLElement(NAME \"MAIN_ENTITY_ID\", XMLAttributes( RTRIM((select pref_issr_id from ft_t_issr where INSTR_ISSR_ID = '" + newIssuer + "')) AS \"VALUE\")), ";&#13;
query = query + "XMLElement(NAME \"MAIN_ENTITY_ID_CTXT_TYP\",XMLAttributes( RTRIM((select pref_id_ctxt_typ from ft_t_issr where INSTR_ISSR_ID = '" + newIssuer +"')) AS \"VALUE\")), ";&#13;
query = query + "XMLElement(NAME \"MAIN_ENTITY_TBL_TYP\",XMLAttributes('ISSR' AS \"VALUE\"))), ";&#13;
query = query + "XMLElement(NAME \"SEGMENT\", XMLAttributes( 'Issuer' AS \"TYPE\", 'REFERENCE' AS \"ACTION\"), ";&#13;
query = query + "XMLElement(NAME \"Issuer\", XMLElement(NAME \"INSTRISSRID\", ";&#13;
query = query + "XMLAttributes( RTRIM('" + newIssuer + "') AS \"VALUE\")), ";&#13;
query = query + "XMLElement(NAME \"LASTCHGUSRID\",XMLAttributes('rebuildIOI2' AS \"VALUE\")))), ";&#13;
query = query + "XMLElement(NAME \"SEGMENT\", XMLAttributes( 'ISSRIssuerGroupParticipant' AS \"TYPE\", 'UNKNOWN' AS \"ACTION\"), XMLElement(NAME \"ISSRIssuerGroupParticipant\",  ";&#13;
query = query + "XMLElement(NAME \"PRNTISSRGRPOID\", XMLAttributes( '" + ISSR_GRP_OID + "' AS \"VALUE\")), XMLElement(NAME \"PRTPURPTYP\", XMLAttributes( 'INTEREST' AS \"VALUE\")) ";&#13;
query = query + ")))";&#13;
query = query + "FROM DUAL";&#13;
</objectValue>
<type>CONSTANT</type>
</item>
<item id="1316" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1317">variables["ISSR_GRP_OID"]</name>
<stringValue id="1318">ISSR_GRP_OID</stringValue>
<type>VARIABLE</type>
</item>
<item id="1319" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="1320">["newIssuer"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="1321">variables["newIssuer"]</name>
<stringValue id="1322">newIssuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="1323" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="1324">["query"]@java/lang/Integer@</UITypeHint>
<input>false</input>
<name id="1325">variables["query"]</name>
<stringValue id="1326">ioiAddMSg</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<persistentVariables id="1327" type="java.util.HashSet">
<item id="1328" type="java.lang.String">ISSR_GRP_OID
1000</item>
</persistentVariables>
<sources id="1329" type="java.util.HashSet">
<item id="1330" type="com.j2fe.workflow.definition.Transition">
<name id="1331">goto-next</name>
<source id="1332">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="1333"/>
<directJoin>false</directJoin>
<name id="1334">log add issuer</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="1335">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="1336" type="java.util.HashSet">
<item id="1337" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1338">database</name>
<stringValue id="1339">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="1340" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1341">indexedParameters[0]</name>
<stringValue id="1342">newIssuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="1343" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1344">querySQL</name>
<stringValue id="1345">call&#13;
 mhi_sp_eventlog (&#13;
	 'rebuildIOI2 Workflow',&#13;
	 'RUP add to IOI',&#13;
	CAST(? AS VARCHAR)); &#13;
</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1346" type="java.util.HashSet">
<item id="1347" type="com.j2fe.workflow.definition.Transition">
<name id="1348">goto-next</name>
<source id="1349">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="1350"/>
<directJoin>false</directJoin>
<name id="1351">Identify Issuer to add to IOI</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="1352">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="1353" type="java.util.HashSet">
<item id="1354" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1355">database</name>
<stringValue id="1356">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="1357" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1358">indexedParameters[0]</name>
<stringValue id="1359">newIssuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="1360" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1361">indexedParameters[1]</name>
<stringValue id="1362">OrgId</stringValue>
<type>VARIABLE</type>
</item>
<item id="1363" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1364">querySQL</name>
<stringValue id="1365">UPDATE FT_T_IOI2 &#13;
SET UPDATING='Y' WHERE INSTR_ISSR_ID = CAST(? AS VARCHAR) AND ORG_ID = CAST(? AS VARCHAR) </stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1366" type="java.util.HashSet">
<item id="1367" type="com.j2fe.workflow.definition.Transition">
<name id="1368">loop</name>
<source idref="1130"/>
<target idref="1349"/>
</item>
</sources>
<targets id="1369" type="java.util.HashSet">
<item idref="1347" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="1332"/>
</item>
</sources>
<targets id="1370" type="java.util.HashSet">
<item idref="1330" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="1308"/>
</item>
</sources>
<targets id="1371" type="java.util.HashSet">
<item idref="1306" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="1285"/>
</item>
</sources>
<targets id="1372" type="java.util.HashSet">
<item idref="1283" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="1268"/>
</item>
</sources>
<targets id="1373" type="java.util.HashSet">
<item idref="1266" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="1248"/>
</item>
</sources>
<targets id="1374" type="java.util.HashSet">
<item idref="1246" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="1150"/>
</item>
</sources>
<targets id="1375" type="java.util.HashSet">
<item idref="1148" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="1130"/>
</item>
</sources>
<targets id="1376" type="java.util.HashSet">
<item idref="1128" type="com.j2fe.workflow.definition.Transition"/>
<item idref="1367" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="1123"/>
</item>
</sources>
<targets id="1377" type="java.util.HashSet">
<item idref="1121" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDJOIN</type>
</source>
<target idref="1116"/>
</item>
<item idref="1241" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1378" type="java.util.HashSet">
<item idref="1114" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="1096"/>
</item>
</sources>
<targets id="1379" type="java.util.HashSet">
<item id="1380" type="com.j2fe.workflow.definition.Transition">
<name id="1381">nothing-found</name>
<source idref="1096"/>
<target idref="1010"/>
</item>
<item idref="1094" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="1082"/>
</item>
</sources>
<targets id="1382" type="java.util.HashSet">
<item idref="1080" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="1065"/>
</item>
</sources>
<targets id="1383" type="java.util.HashSet">
<item idref="1063" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDSPLIT</type>
</source>
<target idref="1051"/>
</item>
</sources>
<targets id="1384" type="java.util.HashSet">
<item idref="1049" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="1044"/>
</item>
<item id="1385" type="com.j2fe.workflow.definition.Transition">
<name id="1386">goto-next</name>
<source id="1387">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="1388"/>
<directJoin>false</directJoin>
<name id="1389">UPDATE IOI2</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="1390">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="1391" type="java.util.HashSet">
<item id="1392" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1393">database</name>
<stringValue id="1394">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="1395" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1396">indexedParameters[0]</name>
<stringValue id="1397">nonRUPIssuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="1398" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1399">indexedParameters[1]</name>
<stringValue id="1400">OrgId</stringValue>
<type>VARIABLE</type>
</item>
<item id="1401" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1402">querySQL</name>
<stringValue id="1403">UPDATE FT_T_IOI2 SET UPDATING='N', UPDATED='Y' &#13;
WHERE INSTR_ISSR_ID = ? &#13;
and ORG_ID = ?</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1404" type="java.util.HashSet">
<item id="1405" type="com.j2fe.workflow.definition.Transition">
<name id="1406">goto-next</name>
<source id="1407">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="1408"/>
<directJoin>false</directJoin>
<name id="1409">IOI REAL message</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="1410">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="1411" type="java.util.HashSet">
<item id="1412" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="1413">["BulkSize"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="1414">input["BulkSize"]</name>
<stringValue id="1415">BulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="1416" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="1417">["PublishFlag"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="1418">input["PublishFlag"]</name>
<objectValue id="1419" type="java.lang.String">Y</objectValue>
<type>CONSTANT</type>
</item>
<item id="1420" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="1421">["sqlSelect"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="1422">input["sqlSelect"]</name>
<stringValue id="1423">ioiAddMSg</stringValue>
<type>VARIABLE</type>
</item>
<item id="1424" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1425">name</name>
<stringValue id="1426">RealMessageProcessing</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1427" type="java.util.HashSet">
<item id="1428" type="com.j2fe.workflow.definition.Transition">
<name id="1429">goto-next</name>
<source id="1430">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="1431"/>
<directJoin>false</directJoin>
<name id="1432">IOI REAL Query</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="1433">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="1434" type="java.util.HashSet">
<item id="1435" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1436">statements</name>
<objectValue id="1437" type="java.lang.String">query = "SELECT distinct '&lt;!DOCTYPE STREET_REF SYSTEM \"fti://repository/dtd/STREET_REF\"&gt;' || ";&#13;
query = query + "XMLElement(NAME \"STREET_REF\",XMLAttributes( 'GUEST' AS \"USERID\"), ";&#13;
query = query + "XMLElement(NAME \"HEADER\", ";&#13;
query = query + "XMLElement(NAME \"MAIN_ENTITY_ID\", XMLAttributes( RTRIM((select pref_issr_id from ft_t_issr where INSTR_ISSR_ID = '" + newIssuer + "')) AS \"VALUE\")), ";&#13;
query = query + "XMLElement(NAME \"MAIN_ENTITY_ID_CTXT_TYP\",XMLAttributes( RTRIM((select pref_id_ctxt_typ from ft_t_issr where INSTR_ISSR_ID = '" + newIssuer +"')) AS \"VALUE\")), ";&#13;
query = query + "XMLElement(NAME \"MAIN_ENTITY_TBL_TYP\",XMLAttributes('ISSR' AS \"VALUE\"))), ";&#13;
query = query + "XMLElement(NAME \"SEGMENT\", XMLAttributes( 'Issuer' AS \"TYPE\", 'REFERENCE' AS \"ACTION\"), ";&#13;
query = query + "XMLElement(NAME \"Issuer\", XMLElement(NAME \"INSTRISSRID\", ";&#13;
query = query + "XMLAttributes( RTRIM('" + newIssuer + "') AS \"VALUE\")), ";&#13;
query = query + "XMLElement(NAME \"LASTCHGUSRID\",XMLAttributes('rebuildIOI2' AS \"VALUE\")))), ";&#13;
query = query + "XMLElement(NAME \"SEGMENT\", XMLAttributes( 'ISSRIssuerGroupParticipant' AS \"TYPE\", 'UNKNOWN' AS \"ACTION\"), XMLElement(NAME \"ISSRIssuerGroupParticipant\",  ";&#13;
query = query + "XMLElement(NAME \"PRNTISSRGRPOID\", XMLAttributes( '" + ISSR_GRP_OID + "' AS \"VALUE\")), XMLElement(NAME \"PRTPURPTYP\", XMLAttributes( 'INTEREST' AS \"VALUE\")) ";&#13;
query = query + ")))";&#13;
query = query + "FROM DUAL";&#13;
</objectValue>
<type>CONSTANT</type>
</item>
<item id="1438" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1439">variables["ISSR_GRP_OID"]</name>
<stringValue id="1440">ISSR_GRP_OID</stringValue>
<type>VARIABLE</type>
</item>
<item id="1441" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="1442">["newIssuer"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="1443">variables["newIssuer"]</name>
<stringValue id="1444">nonRUPIssuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="1445" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="1446">["query"]@java/lang/Integer@</UITypeHint>
<input>false</input>
<name id="1447">variables["query"]</name>
<stringValue id="1448">ioiAddMSg</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<persistentVariables id="1449" type="java.util.HashSet">
<item id="1450" type="java.lang.String">ISSR_GRP_OID
1000</item>
</persistentVariables>
<sources id="1451" type="java.util.HashSet">
<item id="1452" type="com.j2fe.workflow.definition.Transition">
<name id="1453">goto-next</name>
<source id="1454">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="1455"/>
<directJoin>false</directJoin>
<name id="1456">log add issuer</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="1457">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="1458" type="java.util.HashSet">
<item id="1459" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1460">database</name>
<stringValue id="1461">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="1462" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1463">indexedParameters[0]</name>
<stringValue id="1464">nonRUPIssuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="1465" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1466">querySQL</name>
<stringValue id="1467">call&#13;
 mhi_sp_eventlog (&#13;
	 'rebuildIOI2 Workflow',&#13;
	 'Non-RUP add to IOI',&#13;
	CAST(? AS VARCHAR)); &#13;
</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1468" type="java.util.HashSet">
<item id="1469" type="com.j2fe.workflow.definition.Transition">
<name id="1470">goto-next</name>
<source id="1471">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="1472"/>
<directJoin>false</directJoin>
<name id="1473">Identify Issuer to add to IOI</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="1474">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="1475" type="java.util.HashSet">
<item id="1476" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1477">database</name>
<stringValue id="1478">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="1479" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1480">indexedParameters[0]</name>
<stringValue id="1481">nonRUPIssuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="1482" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1483">indexedParameters[1]</name>
<stringValue id="1484">OrgId</stringValue>
<type>VARIABLE</type>
</item>
<item id="1485" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1486">querySQL</name>
<stringValue id="1487">UPDATE FT_T_IOI2 &#13;
SET UPDATING='Y' WHERE INSTR_ISSR_ID = CAST(? AS VARCHAR) and ORG_ID = CAST(? AS VARCHAR) </stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1488" type="java.util.HashSet">
<item id="1489" type="com.j2fe.workflow.definition.Transition">
<name id="1490">loop</name>
<source idref="1024"/>
<target idref="1471"/>
</item>
</sources>
<targets id="1491" type="java.util.HashSet">
<item idref="1469" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="1454"/>
</item>
</sources>
<targets id="1492" type="java.util.HashSet">
<item idref="1452" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="1430"/>
</item>
</sources>
<targets id="1493" type="java.util.HashSet">
<item idref="1428" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="1407"/>
</item>
</sources>
<targets id="1494" type="java.util.HashSet">
<item idref="1405" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="1387"/>
</item>
</sources>
<targets id="1495" type="java.util.HashSet">
<item idref="1385" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="1044"/>
</item>
</sources>
<targets id="1496" type="java.util.HashSet">
<item idref="1042" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="1024"/>
</item>
</sources>
<targets id="1497" type="java.util.HashSet">
<item idref="1022" type="com.j2fe.workflow.definition.Transition"/>
<item idref="1489" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="1017"/>
</item>
</sources>
<targets id="1498" type="java.util.HashSet">
<item idref="1015" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDJOIN</type>
</source>
<target idref="1010"/>
</item>
<item idref="1380" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1499" type="java.util.HashSet">
<item idref="1008" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="996"/>
</item>
</sources>
<targets id="1500" type="java.util.HashSet">
<item idref="994" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="979"/>
</item>
</sources>
<targets id="1501" type="java.util.HashSet">
<item idref="977" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="959"/>
</item>
</sources>
<targets id="1502" type="java.util.HashSet">
<item id="1503" type="com.j2fe.workflow.definition.Transition">
<name id="1504">nothing-found</name>
<source idref="959"/>
<target idref="887"/>
</item>
<item idref="957" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="942"/>
</item>
</sources>
<targets id="1505" type="java.util.HashSet">
<item idref="940" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDSPLIT</type>
</source>
<target idref="928"/>
</item>
</sources>
<targets id="1506" type="java.util.HashSet">
<item idref="926" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="921"/>
</item>
<item id="1507" type="com.j2fe.workflow.definition.Transition">
<name id="1508">goto-next</name>
<source id="1509">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="1510"/>
<directJoin>false</directJoin>
<name id="1511">NOP  #3</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="1512">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="1513" type="java.util.HashSet">
<item id="1514" type="com.j2fe.workflow.definition.Transition">
<name id="1515">goto-next</name>
<source id="1516">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="1517"/>
<directJoin>false</directJoin>
<name id="1518">UPDATE IOI2</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="1519">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="1520" type="java.util.HashSet">
<item id="1521" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1522">database</name>
<stringValue id="1523">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="1524" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1525">indexedParameters[0]</name>
<stringValue id="1526">lockedIssuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="1527" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1528">indexedParameters[1]</name>
<stringValue id="1529">OrgId</stringValue>
<type>VARIABLE</type>
</item>
<item id="1530" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1531">querySQL</name>
<stringValue id="1532">UPDATE FT_T_IOI2 SET UPDATING='N', UPDATED='Y', DELETE_FROM_IOI = 'N'&#13;
WHERE INSTR_ISSR_ID = CAST(? AS VARCHAR) and ORG_ID = CAST(? AS VARCHAR) </stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1533" type="java.util.HashSet">
<item id="1534" type="com.j2fe.workflow.definition.Transition">
<name id="1535">goto-next</name>
<source id="1536">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="1537"/>
<directJoin>false</directJoin>
<name id="1538">log retain issuer</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="1539">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="1540" type="java.util.HashSet">
<item id="1541" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1542">database</name>
<stringValue id="1543">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="1544" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1545">indexedParameters[0]</name>
<stringValue id="1546">lockedIssuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="1547" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1548">querySQL</name>
<stringValue id="1549">call&#13;
 mhi_sp_eventlog (&#13;
	 'rebuildIOI2 Workflow',&#13;
	 'retain as Issuer has a lock',&#13;
	?); &#13;
</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1550" type="java.util.HashSet">
<item id="1551" type="com.j2fe.workflow.definition.Transition">
<name id="1552">goto-next</name>
<source id="1553">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="1554"/>
<directJoin>false</directJoin>
<name id="1555">Identify Issuer to flag as locked</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="1556">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="1557" type="java.util.HashSet">
<item id="1558" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1559">database</name>
<stringValue id="1560">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="1561" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1562">indexedParameters[0]</name>
<stringValue id="1563">lockedIssuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="1564" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1565">indexedParameters[1]</name>
<stringValue id="1566">OrgId</stringValue>
<type>VARIABLE</type>
</item>
<item id="1567" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1568">querySQL</name>
<stringValue id="1569">UPDATE FT_T_IOI2 SET UPDATING='Y' WHERE INSTR_ISSR_ID = CAST(? AS VARCHAR) and ORG_ID = CAST(? AS VARCHAR)</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1570" type="java.util.HashSet">
<item id="1571" type="com.j2fe.workflow.definition.Transition">
<name id="1572">loop</name>
<source idref="901"/>
<target idref="1553"/>
</item>
</sources>
<targets id="1573" type="java.util.HashSet">
<item idref="1551" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="1536"/>
</item>
</sources>
<targets id="1574" type="java.util.HashSet">
<item idref="1534" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="1516"/>
</item>
</sources>
<targets id="1575" type="java.util.HashSet">
<item idref="1514" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="1509"/>
</item>
</sources>
<targets id="1576" type="java.util.HashSet">
<item idref="1507" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="921"/>
</item>
</sources>
<targets id="1577" type="java.util.HashSet">
<item idref="919" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="901"/>
</item>
</sources>
<targets id="1578" type="java.util.HashSet">
<item idref="899" type="com.j2fe.workflow.definition.Transition"/>
<item idref="1571" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="894"/>
</item>
</sources>
<targets id="1579" type="java.util.HashSet">
<item idref="892" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDJOIN</type>
</source>
<target idref="887"/>
</item>
<item idref="1503" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1580" type="java.util.HashSet">
<item idref="885" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="867"/>
</item>
</sources>
<targets id="1581" type="java.util.HashSet">
<item id="1582" type="com.j2fe.workflow.definition.Transition">
<name id="1583">nothing-found</name>
<source idref="867"/>
<target idref="739"/>
</item>
<item idref="865" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="853"/>
</item>
</sources>
<targets id="1584" type="java.util.HashSet">
<item idref="851" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="836"/>
</item>
</sources>
<targets id="1585" type="java.util.HashSet">
<item idref="834" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDSPLIT</type>
</source>
<target idref="822"/>
</item>
</sources>
<targets id="1586" type="java.util.HashSet">
<item idref="820" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="815"/>
</item>
<item id="1587" type="com.j2fe.workflow.definition.Transition">
<name id="1588">goto-next</name>
<source id="1589">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="1590"/>
<directJoin>false</directJoin>
<name id="1591">UPDATE IOI2</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="1592">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="1593" type="java.util.HashSet">
<item id="1594" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1595">database</name>
<stringValue id="1596">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="1597" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1598">indexedParameters[0]</name>
<stringValue id="1599">oldIssuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="1600" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1601">indexedParameters[1]</name>
<stringValue id="1602">OrgId</stringValue>
<type>VARIABLE</type>
</item>
<item id="1603" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1604">querySQL</name>
<stringValue id="1605">UPDATE FT_T_IOI2 SET UPDATING='N', UPDATED='Y'&#13;
WHERE INSTR_ISSR_ID = CAST(? AS VARCHAR) and ORG_ID = CAST(? AS VARCHAR)</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1606" type="java.util.HashSet">
<item id="1607" type="com.j2fe.workflow.definition.Transition">
<name id="1608">goto-next</name>
<source id="1609">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="1610"/>
<directJoin>false</directJoin>
<name id="1611">END DATE IRGP</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="1612">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="1613" type="java.util.HashSet">
<item id="1614" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1615">database</name>
<stringValue id="1616">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="1617" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1618">indexedParameters[0]</name>
<stringValue id="1619">oldIssuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="1620" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1621">indexedParameters[1]</name>
<stringValue id="1622">OrgId</stringValue>
<type>VARIABLE</type>
</item>
<item id="1623" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1624">querySQL</name>
<stringValue id="1625">UPDATE FT_T_IRGP&#13;
SET &#13;
  END_TMS = DATE_TRUNC('day', CURRENT_TIMESTAMP),&#13;
  LAST_CHG_TMS = SYSDATE(),&#13;
  LAST_CHG_USR_ID = 'rebuildIOI2'&#13;
WHERE &#13;
  INSTR_ISSR_ID = CAST(? AS VARCHAR)&#13;
  AND END_TMS IS NULL&#13;
  AND PRNT_ISSR_GRP_OID = CAST(? AS VARCHAR);&#13;
</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1626" type="java.util.HashSet">
<item id="1627" type="com.j2fe.workflow.definition.Transition">
<name id="1628">goto-next</name>
<source id="1629">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="1630"/>
<directJoin>false</directJoin>
<name id="1631">log remove issuer</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="1632">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="1633" type="java.util.HashSet">
<item id="1634" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1635">database</name>
<stringValue id="1636">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="1637" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1638">indexedParameters[0]</name>
<stringValue id="1639">oldIssuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="1640" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1641">querySQL</name>
<stringValue id="1642">call&#13;
 mhi_sp_eventlog (&#13;
	 'rebuildIOI2 Workflow',&#13;
	 'remove from IOI',&#13;
	CAST(? AS VARCHAR)); &#13;
</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1643" type="java.util.HashSet">
<item id="1644" type="com.j2fe.workflow.definition.Transition">
<name id="1645">goto-next</name>
<source id="1646">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="1647"/>
<directJoin>false</directJoin>
<name id="1648">Identify Issuer to remove from IOI</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="1649">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="1650" type="java.util.HashSet">
<item id="1651" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1652">database</name>
<stringValue id="1653">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="1654" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1655">indexedParameters[0]</name>
<stringValue id="1656">newIssuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="1657" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1658">indexedParameters[1]</name>
<stringValue id="1659">OrgId</stringValue>
<type>VARIABLE</type>
</item>
<item id="1660" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1661">querySQL</name>
<stringValue id="1662">UPDATE FT_T_IOI2 SET UPDATING='Y' WHERE INSTR_ISSR_ID = CAST(? AS VARCHAR) and ORG_ID = CAST(? AS VARCHAR) </stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1663" type="java.util.HashSet">
<item id="1664" type="com.j2fe.workflow.definition.Transition">
<name id="1665">loop</name>
<source idref="795"/>
<target idref="1646"/>
</item>
</sources>
<targets id="1666" type="java.util.HashSet">
<item idref="1644" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="1629"/>
</item>
</sources>
<targets id="1667" type="java.util.HashSet">
<item idref="1627" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="1609"/>
</item>
</sources>
<targets id="1668" type="java.util.HashSet">
<item idref="1607" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="1589"/>
</item>
</sources>
<targets id="1669" type="java.util.HashSet">
<item idref="1587" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="815"/>
</item>
</sources>
<targets id="1670" type="java.util.HashSet">
<item idref="813" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="795"/>
</item>
</sources>
<targets id="1671" type="java.util.HashSet">
<item idref="793" type="com.j2fe.workflow.definition.Transition"/>
<item idref="1664" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="788"/>
</item>
</sources>
<targets id="1672" type="java.util.HashSet">
<item idref="786" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDJOIN</type>
</source>
<target idref="771"/>
</item>
</sources>
<targets id="1673" type="java.util.HashSet">
<item idref="769" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="753"/>
</item>
</sources>
<targets id="1674" type="java.util.HashSet">
<item idref="751" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="739"/>
</item>
<item idref="737" type="com.j2fe.workflow.definition.Transition"/>
<item idref="1582" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1675" type="java.util.HashSet">
<item id="1676" type="com.j2fe.workflow.definition.Transition">
<name id="1677">goto-next</name>
<source idref="739"/>
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
<item idref="620" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="605"/>
</item>
</sources>
<targets id="1678" type="java.util.HashSet">
<item idref="603" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="585"/>
</item>
</sources>
<targets id="1679" type="java.util.HashSet">
<item idref="583" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="565"/>
</item>
</sources>
<targets id="1680" type="java.util.HashSet">
<item id="1681" type="com.j2fe.workflow.definition.Transition">
<name id="1682">nothing-found</name>
<source idref="565"/>
<target id="1683">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="1684"/>
<directJoin>false</directJoin>
<name id="1685">log skip soi issuers</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="1686">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="1687" type="java.util.HashSet">
<item id="1688" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1689">database</name>
<stringValue id="1690">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="1691" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1692">querySQL</name>
<stringValue id="1693">call mhi_sp_eventlog (&#13;
	 'rebuildIOI2 Workflow',&#13;
	 'skip SOI Issuers',&#13;
	'N/A'); </stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1694" type="java.util.HashSet">
<item idref="1681" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1695" type="java.util.HashSet">
<item id="1696" type="com.j2fe.workflow.definition.Transition">
<name id="1697">goto-next</name>
<source idref="1683"/>
<target idref="524"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item idref="563" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="551"/>
</item>
</sources>
<targets id="1698" type="java.util.HashSet">
<item idref="549" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="531"/>
</item>
</sources>
<targets id="1699" type="java.util.HashSet">
<item idref="529" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="524"/>
</item>
<item idref="1696" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1700" type="java.util.HashSet">
<item idref="522" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="504"/>
</item>
</sources>
<targets id="1701" type="java.util.HashSet">
<item id="1702" type="com.j2fe.workflow.definition.Transition">
<name id="1703">nothing-found</name>
<source idref="504"/>
<target id="1704">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="1705"/>
<directJoin>false</directJoin>
<name id="1706">log skip asset rup issuers</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="1707">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="1708" type="java.util.HashSet">
<item id="1709" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1710">database</name>
<stringValue id="1711">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="1712" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1713">querySQL</name>
<stringValue id="1714">call mhi_sp_eventlog (&#13;
	 'rebuildIOI2 Workflow',&#13;
	 'skip asset RUP Issuers',&#13;
	'N/A'); </stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1715" type="java.util.HashSet">
<item idref="1702" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1716" type="java.util.HashSet">
<item id="1717" type="com.j2fe.workflow.definition.Transition">
<name id="1718">goto-next</name>
<source idref="1704"/>
<target idref="463"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item idref="502" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="490"/>
</item>
</sources>
<targets id="1719" type="java.util.HashSet">
<item idref="488" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="470"/>
</item>
</sources>
<targets id="1720" type="java.util.HashSet">
<item idref="468" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="463"/>
</item>
<item idref="1717" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1721" type="java.util.HashSet">
<item idref="461" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="443"/>
</item>
</sources>
<targets id="1722" type="java.util.HashSet">
<item id="1723" type="com.j2fe.workflow.definition.Transition">
<name id="1724">nothing-found</name>
<source idref="443"/>
<target id="1725">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="1726"/>
<directJoin>false</directJoin>
<name id="1727">log skip gtor issuers</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="1728">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="1729" type="java.util.HashSet">
<item id="1730" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1731">database</name>
<stringValue id="1732">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="1733" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1734">querySQL</name>
<stringValue id="1735">call mhi_sp_eventlog (&#13;
	 'rebuildIOI2 Workflow',&#13;
	 'skip GTOR Issuers',&#13;
	'N/A'); </stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1736" type="java.util.HashSet">
<item idref="1723" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1737" type="java.util.HashSet">
<item id="1738" type="com.j2fe.workflow.definition.Transition">
<name id="1739">goto-next</name>
<source idref="1725"/>
<target idref="402"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item idref="441" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="429"/>
</item>
</sources>
<targets id="1740" type="java.util.HashSet">
<item idref="427" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="409"/>
</item>
</sources>
<targets id="1741" type="java.util.HashSet">
<item idref="407" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="402"/>
</item>
<item idref="1738" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1742" type="java.util.HashSet">
<item idref="400" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="382"/>
</item>
</sources>
<targets id="1743" type="java.util.HashSet">
<item id="1744" type="com.j2fe.workflow.definition.Transition">
<name id="1745">nothing-found</name>
<source idref="382"/>
<target id="1746">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="1747"/>
<directJoin>false</directJoin>
<name id="1748">log skip gtor rup issuers</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="1749">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="1750" type="java.util.HashSet">
<item id="1751" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1752">database</name>
<stringValue id="1753">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="1754" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1755">querySQL</name>
<stringValue id="1756">call mhi_sp_eventlog (&#13;
	 'rebuildIOI2 Workflow',&#13;
	 'skip GTOR RUP Issuers',&#13;
	'N/A'); </stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1757" type="java.util.HashSet">
<item idref="1744" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1758" type="java.util.HashSet">
<item id="1759" type="com.j2fe.workflow.definition.Transition">
<name id="1760">goto-next</name>
<source idref="1746"/>
<target idref="341"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item idref="380" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="368"/>
</item>
</sources>
<targets id="1761" type="java.util.HashSet">
<item idref="366" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="348"/>
</item>
</sources>
<targets id="1762" type="java.util.HashSet">
<item idref="346" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="341"/>
</item>
<item idref="1759" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1763" type="java.util.HashSet">
<item idref="339" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="321"/>
</item>
</sources>
<targets id="1764" type="java.util.HashSet">
<item id="1765" type="com.j2fe.workflow.definition.Transition">
<name id="1766">nothing-found</name>
<source idref="321"/>
<target id="1767">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="1768"/>
<directJoin>false</directJoin>
<name id="1769">log skip cust issuers</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="1770">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="1771" type="java.util.HashSet">
<item id="1772" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1773">database</name>
<stringValue id="1774">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="1775" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1776">querySQL</name>
<stringValue id="1777">call mhi_sp_eventlog (&#13;
	 'rebuildIOI2 Workflow',&#13;
	 'skip CUST Issuers',&#13;
	'N/A'); </stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1778" type="java.util.HashSet">
<item idref="1765" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1779" type="java.util.HashSet">
<item id="1780" type="com.j2fe.workflow.definition.Transition">
<name id="1781">goto-next</name>
<source idref="1767"/>
<target idref="283"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item idref="319" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="307"/>
</item>
</sources>
<targets id="1782" type="java.util.HashSet">
<item idref="305" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="290"/>
</item>
</sources>
<targets id="1783" type="java.util.HashSet">
<item idref="288" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="283"/>
</item>
<item idref="1780" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1784" type="java.util.HashSet">
<item idref="281" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="263"/>
</item>
</sources>
<targets id="1785" type="java.util.HashSet">
<item id="1786" type="com.j2fe.workflow.definition.Transition">
<name id="1787">nothing-found</name>
<source idref="263"/>
<target id="1788">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="1789"/>
<directJoin>false</directJoin>
<name id="1790">log skip cust rup issuers</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="1791">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="1792" type="java.util.HashSet">
<item id="1793" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1794">database</name>
<stringValue id="1795">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="1796" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1797">querySQL</name>
<stringValue id="1798">call mhi_sp_eventlog (&#13;
	 'rebuildIOI2 Workflow',&#13;
	 'skip CUST RUP Issuers',&#13;
	'N/A'); </stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1799" type="java.util.HashSet">
<item idref="1786" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1800" type="java.util.HashSet">
<item id="1801" type="com.j2fe.workflow.definition.Transition">
<name id="1802">goto-next</name>
<source idref="1788"/>
<target idref="225"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item idref="261" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="249"/>
</item>
</sources>
<targets id="1803" type="java.util.HashSet">
<item idref="247" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="232"/>
</item>
</sources>
<targets id="1804" type="java.util.HashSet">
<item idref="230" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="225"/>
</item>
<item idref="1801" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1805" type="java.util.HashSet">
<item idref="223" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="205"/>
</item>
</sources>
<targets id="1806" type="java.util.HashSet">
<item id="1807" type="com.j2fe.workflow.definition.Transition">
<name id="1808">nothing-found</name>
<source idref="205"/>
<target id="1809">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="1810"/>
<directJoin>false</directJoin>
<name id="1811">log skip cust ip issuers</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="1812">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="1813" type="java.util.HashSet">
<item id="1814" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1815">database</name>
<stringValue id="1816">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="1817" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1818">querySQL</name>
<stringValue id="1819">call mhi_sp_eventlog (&#13;
	 'rebuildIOI2 Workflow',&#13;
	 'skip CUST IP Issuers',&#13;
	'N/A'); </stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1820" type="java.util.HashSet">
<item idref="1807" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1821" type="java.util.HashSet">
<item id="1822" type="com.j2fe.workflow.definition.Transition">
<name id="1823">goto-next</name>
<source idref="1809"/>
<target idref="167"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item idref="203" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="191"/>
</item>
</sources>
<targets id="1824" type="java.util.HashSet">
<item idref="189" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="174"/>
</item>
</sources>
<targets id="1825" type="java.util.HashSet">
<item idref="172" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="167"/>
</item>
<item idref="1822" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1826" type="java.util.HashSet">
<item idref="165" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="147"/>
</item>
</sources>
<targets id="1827" type="java.util.HashSet">
<item id="1828" type="com.j2fe.workflow.definition.Transition">
<name id="1829">nothing-found</name>
<source idref="147"/>
<target id="1830">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="1831"/>
<directJoin>false</directJoin>
<name id="1832">log skip lagr flar issuers</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="1833">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="1834" type="java.util.HashSet">
<item id="1835" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1836">database</name>
<stringValue id="1837">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="1838" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1839">querySQL</name>
<stringValue id="1840">call&#13;
 mhi_sp_eventlog (&#13;
	 'rebuildIOI2 Workflow',&#13;
	 'skip LAGR FLAR Issuers',&#13;
	'N/A'); &#13;
</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1841" type="java.util.HashSet">
<item idref="1828" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1842" type="java.util.HashSet">
<item id="1843" type="com.j2fe.workflow.definition.Transition">
<name id="1844">goto-next</name>
<source idref="1830"/>
<target idref="106"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item idref="145" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="133"/>
</item>
</sources>
<targets id="1845" type="java.util.HashSet">
<item idref="131" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="113"/>
</item>
</sources>
<targets id="1846" type="java.util.HashSet">
<item idref="111" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="106"/>
</item>
<item idref="1843" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1847" type="java.util.HashSet">
<item idref="104" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="86"/>
</item>
</sources>
<targets id="1848" type="java.util.HashSet">
<item id="1849" type="com.j2fe.workflow.definition.Transition">
<name id="1850">nothing-found</name>
<source idref="86"/>
<target id="1851">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="1852"/>
<directJoin>false</directJoin>
<name id="1853">log skip lagr flar rup issuers</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="1854">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="1855" type="java.util.HashSet">
<item id="1856" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1857">database</name>
<stringValue id="1858">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="1859" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1860">querySQL</name>
<stringValue id="1861">call&#13;
 mhi_sp_eventlog (&#13;
	 'rebuildIOI2 Workflow',&#13;
	 'skip LAGR FLAR RUP Issuers',&#13;
	'N/A'); &#13;
</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1862" type="java.util.HashSet">
<item idref="1849" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1863" type="java.util.HashSet">
<item id="1864" type="com.j2fe.workflow.definition.Transition">
<name id="1865">goto-next</name>
<source idref="1851"/>
<target idref="45"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item idref="84" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="72"/>
</item>
</sources>
<targets id="1866" type="java.util.HashSet">
<item idref="70" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="52"/>
</item>
</sources>
<targets id="1867" type="java.util.HashSet">
<item idref="50" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="45"/>
</item>
<item idref="1864" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1868" type="java.util.HashSet">
<item idref="43" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="24"/>
</item>
</sources>
<targets id="1869" type="java.util.HashSet">
<item idref="22" type="com.j2fe.workflow.definition.Transition"/>
<item idref="1237" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="10"/>
</item>
</sources>
<targets id="1870" type="java.util.HashSet">
<item idref="8" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="3"/>
</item>
<item idref="1676" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1871" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="1872">Mizuho</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="1873">user1</lastChangeUser>
<lastUpdate id="1874">2025-10-19T02:21:25.000+0100</lastUpdate>
<name id="1875">rebuildIOI2</name>
<nodes id="1876" type="java.util.HashSet">
<item idref="504" type="com.j2fe.workflow.definition.Node"/>
<item idref="205" type="com.j2fe.workflow.definition.Node"/>
<item idref="321" type="com.j2fe.workflow.definition.Node"/>
<item idref="263" type="com.j2fe.workflow.definition.Node"/>
<item idref="443" type="com.j2fe.workflow.definition.Node"/>
<item idref="382" type="com.j2fe.workflow.definition.Node"/>
<item idref="147" type="com.j2fe.workflow.definition.Node"/>
<item idref="86" type="com.j2fe.workflow.definition.Node"/>
<item idref="565" type="com.j2fe.workflow.definition.Node"/>
<item idref="928" type="com.j2fe.workflow.definition.Node"/>
<item idref="1051" type="com.j2fe.workflow.definition.Node"/>
<item idref="1157" type="com.j2fe.workflow.definition.Node"/>
<item idref="822" type="com.j2fe.workflow.definition.Node"/>
<item idref="1171" type="com.j2fe.workflow.definition.Node"/>
<item idref="836" type="com.j2fe.workflow.definition.Node"/>
<item idref="1065" type="com.j2fe.workflow.definition.Node"/>
<item idref="942" type="com.j2fe.workflow.definition.Node"/>
<item idref="959" type="com.j2fe.workflow.definition.Node"/>
<item idref="1222" type="com.j2fe.workflow.definition.Node"/>
<item idref="1609" type="com.j2fe.workflow.definition.Node"/>
<item idref="10" type="com.j2fe.workflow.definition.Node"/>
<item idref="979" type="com.j2fe.workflow.definition.Node"/>
<item idref="409" type="com.j2fe.workflow.definition.Node"/>
<item idref="348" type="com.j2fe.workflow.definition.Node"/>
<item idref="24" type="com.j2fe.workflow.definition.Node"/>
<item idref="1430" type="com.j2fe.workflow.definition.Node"/>
<item idref="1308" type="com.j2fe.workflow.definition.Node"/>
<item idref="1285" type="com.j2fe.workflow.definition.Node"/>
<item idref="1407" type="com.j2fe.workflow.definition.Node"/>
<item idref="1471" type="com.j2fe.workflow.definition.Node"/>
<item idref="1349" type="com.j2fe.workflow.definition.Node"/>
<item idref="1553" type="com.j2fe.workflow.definition.Node"/>
<item idref="1646" type="com.j2fe.workflow.definition.Node"/>
<item idref="1096" type="com.j2fe.workflow.definition.Node"/>
<item idref="867" type="com.j2fe.workflow.definition.Node"/>
<item idref="113" type="com.j2fe.workflow.definition.Node"/>
<item idref="52" type="com.j2fe.workflow.definition.Node"/>
<item idref="901" type="com.j2fe.workflow.definition.Node"/>
<item idref="1024" type="com.j2fe.workflow.definition.Node"/>
<item idref="1130" type="com.j2fe.workflow.definition.Node"/>
<item idref="795" type="com.j2fe.workflow.definition.Node"/>
<item idref="174" type="com.j2fe.workflow.definition.Node"/>
<item idref="290" type="com.j2fe.workflow.definition.Node"/>
<item idref="232" type="com.j2fe.workflow.definition.Node"/>
<item idref="463" type="com.j2fe.workflow.definition.Node"/>
<item idref="815" type="com.j2fe.workflow.definition.Node"/>
<item idref="1116" type="com.j2fe.workflow.definition.Node"/>
<item idref="1010" type="com.j2fe.workflow.definition.Node"/>
<item idref="402" type="com.j2fe.workflow.definition.Node"/>
<item idref="167" type="com.j2fe.workflow.definition.Node"/>
<item idref="341" type="com.j2fe.workflow.definition.Node"/>
<item idref="106" type="com.j2fe.workflow.definition.Node"/>
<item idref="283" type="com.j2fe.workflow.definition.Node"/>
<item idref="225" type="com.j2fe.workflow.definition.Node"/>
<item idref="887" type="com.j2fe.workflow.definition.Node"/>
<item idref="921" type="com.j2fe.workflow.definition.Node"/>
<item idref="524" type="com.j2fe.workflow.definition.Node"/>
<item idref="1150" type="com.j2fe.workflow.definition.Node"/>
<item idref="1044" type="com.j2fe.workflow.definition.Node"/>
<item idref="1509" type="com.j2fe.workflow.definition.Node"/>
<item idref="585" type="com.j2fe.workflow.definition.Node"/>
<item idref="1202" type="com.j2fe.workflow.definition.Node"/>
<item idref="470" type="com.j2fe.workflow.definition.Node"/>
<item idref="531" type="com.j2fe.workflow.definition.Node"/>
<item idref="711" type="com.j2fe.workflow.definition.Node"/>
<item idref="3" type="com.j2fe.workflow.definition.Node"/>
<item idref="1017" type="com.j2fe.workflow.definition.Node"/>
<item idref="788" type="com.j2fe.workflow.definition.Node"/>
<item idref="1123" type="com.j2fe.workflow.definition.Node"/>
<item idref="894" type="com.j2fe.workflow.definition.Node"/>
<item idref="1248" type="com.j2fe.workflow.definition.Node"/>
<item idref="1387" type="com.j2fe.workflow.definition.Node"/>
<item idref="1516" type="com.j2fe.workflow.definition.Node"/>
<item idref="1589" type="com.j2fe.workflow.definition.Node"/>
<item idref="753" type="com.j2fe.workflow.definition.Node"/>
<item idref="622" type="com.j2fe.workflow.definition.Node"/>
<item idref="659" type="com.j2fe.workflow.definition.Node"/>
<item idref="45" type="com.j2fe.workflow.definition.Node"/>
<item idref="642" type="com.j2fe.workflow.definition.Node"/>
<item idref="680" type="com.j2fe.workflow.definition.Node"/>
<item idref="490" type="com.j2fe.workflow.definition.Node"/>
<item idref="191" type="com.j2fe.workflow.definition.Node"/>
<item idref="307" type="com.j2fe.workflow.definition.Node"/>
<item idref="249" type="com.j2fe.workflow.definition.Node"/>
<item idref="429" type="com.j2fe.workflow.definition.Node"/>
<item idref="368" type="com.j2fe.workflow.definition.Node"/>
<item idref="1454" type="com.j2fe.workflow.definition.Node"/>
<item idref="1332" type="com.j2fe.workflow.definition.Node"/>
<item idref="1082" type="com.j2fe.workflow.definition.Node"/>
<item idref="133" type="com.j2fe.workflow.definition.Node"/>
<item idref="72" type="com.j2fe.workflow.definition.Node"/>
<item idref="1188" type="com.j2fe.workflow.definition.Node"/>
<item idref="551" type="com.j2fe.workflow.definition.Node"/>
<item idref="996" type="com.j2fe.workflow.definition.Node"/>
<item idref="739" type="com.j2fe.workflow.definition.Node"/>
<item idref="697" type="com.j2fe.workflow.definition.Node"/>
<item idref="724" type="com.j2fe.workflow.definition.Node"/>
<item idref="1629" type="com.j2fe.workflow.definition.Node"/>
<item idref="853" type="com.j2fe.workflow.definition.Node"/>
<item idref="1536" type="com.j2fe.workflow.definition.Node"/>
<item idref="1704" type="com.j2fe.workflow.definition.Node"/>
<item idref="1809" type="com.j2fe.workflow.definition.Node"/>
<item idref="1767" type="com.j2fe.workflow.definition.Node"/>
<item idref="1788" type="com.j2fe.workflow.definition.Node"/>
<item idref="1725" type="com.j2fe.workflow.definition.Node"/>
<item idref="1746" type="com.j2fe.workflow.definition.Node"/>
<item idref="1830" type="com.j2fe.workflow.definition.Node"/>
<item idref="1851" type="com.j2fe.workflow.definition.Node"/>
<item idref="1683" type="com.j2fe.workflow.definition.Node"/>
<item idref="1268" type="com.j2fe.workflow.definition.Node"/>
<item idref="605" type="com.j2fe.workflow.definition.Node"/>
<item idref="771" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>false</optimize>
<parameter id="1877" type="java.util.HashMap">
<entry>
<key id="1878" type="java.lang.String">BulkSize</key>
<value id="1879" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="1880">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="1881" type="java.lang.String">OrgId</key>
<value id="1882" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="1883">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="1884">ORG_ID for inventory to be managed</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
</parameter>
<permissions id="1885" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>false</purgeAtEnd>
<retries>0</retries>
<startNode idref="711"/>
<status>RELEASED</status>
<variables id="1886" type="java.util.HashMap">
<entry>
<key id="1887" type="java.lang.String">BulkSize</key>
<value id="1888" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="1889">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<persistent>false</persistent>
<value id="1890" type="java.lang.Integer">1</value>
</value>
</entry>
<entry>
<key id="1891" type="java.lang.String">OrgId</key>
<value id="1892" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="1893">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="1894">ORG_ID for inventory to be managed</description>
<persistent>true</persistent>
</value>
</entry>
</variables>
<version>15</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
