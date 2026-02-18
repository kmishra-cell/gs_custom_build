<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.07">
<package-comment/>
<businessobject displayString="33 - v10 Basel2 Ratings Fix v5" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>true</alwaysPersist>
<clustered>false</clustered>
<comment id="1">v10 Basel2 Ratings Fix v5</comment>
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
<name id="9">end-loop</name>
<source id="10">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="11"/>
<directJoin>false</directJoin>
<name id="12">Instrument Loop</name>
<nodeHandler>com.j2fe.workflow.handler.impl.ForEach</nodeHandler>
<nodeHandlerClass id="13">com.j2fe.workflow.handler.impl.ForEach</nodeHandlerClass>
<parameters id="14" type="java.util.HashSet">
<item id="15" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="16">counter</name>
<stringValue id="17">IssueLoopCounter</stringValue>
<type>VARIABLE</type>
</item>
<item id="18" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="19">counter</name>
<stringValue id="20">IssueLoopCounter</stringValue>
<type>VARIABLE</type>
</item>
<item id="21" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="22">input</name>
<stringValue id="23">Instruments</stringValue>
<type>VARIABLE</type>
</item>
<item id="24" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="25">output</name>
<stringValue id="26">Instument</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="27" type="java.util.HashSet">
<item id="28" type="com.j2fe.workflow.definition.Transition">
<name id="29">ToSplit</name>
<source id="30">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="31">Automatically generated</description>
<directJoin>false</directJoin>
<name id="32">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="33">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="34" type="java.util.HashSet">
<item id="35" type="com.j2fe.workflow.definition.Transition">
<name id="36">goto-next</name>
<source id="37">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="38">Automatically generated</description>
<directJoin>false</directJoin>
<name id="39">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="40">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="41" type="java.util.HashSet">
<item id="42" type="com.j2fe.workflow.definition.Transition">
<name id="43">goto-next</name>
<source id="44">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="45"/>
<directJoin>false</directJoin>
<name id="46">Risk Weight check/insert</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="47">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="48" type="java.util.HashSet">
<item id="49" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="50">database</name>
<stringValue id="51">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="52" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="53">indexedParameters[0]</name>
<stringValue id="54">dataSrc</stringValue>
<type>VARIABLE</type>
</item>
<item id="55" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="56">indexedParameters[1]</name>
<stringValue id="57">Instument</stringValue>
<type>VARIABLE</type>
</item>
<item id="58" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="59">querySQL</name>
<stringValue id="60">Insert into FT_T_ISCL (ISS_CLSF_OID,INSTR_ID,INDUS_CL_SET_ID,CLSF_OID,CL_VALUE,CLSF_PURP_TYP,START_TMS,LAST_CHG_TMS,LAST_CHG_USR_ID,DATA_STAT_TYP,DATA_SRC_ID)&#13;
SELECT new_oid(),ISSU.INSTR_ID,'RISKWGHT','RISKWGHT01','Y','CLASSIFY',now(),now(),'DeriveBaselIIRating','ACTIVE',?&#13;
FROM FT_T_ISSU ISSU&#13;
WHERE  ISSU.INSTR_ID = ?&#13;
and exists (select 1 FROM FT_T_ISCL ISCL3 WHERE ISCL3.INSTR_ID = ISSU.INSTR_ID and ISCL3.INDUS_CL_SET_ID = 'FRTBCATG' and ISCL3.END_TMS is NULL)&#13;
and not exists (select 1 from FT_T_ISCL ISCLW where ISCLW.INDUS_CL_SET_ID = 'RISKWGHT' and ISCLW.END_TMS IS null and ISCLW.INSTR_ID = ISSU.INSTR_ID)</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="61" type="java.util.HashSet">
<item id="62" type="com.j2fe.workflow.definition.Transition">
<name id="63">goto-next</name>
<source id="64">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="65">End date existing CQS Ranking in FICL</description>
<directJoin>false</directJoin>
<name id="66">End date existing Risk Weight Ranking</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="67">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="68" type="java.util.HashSet">
<item id="69" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="70">database</name>
<stringValue id="71">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="72" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="73">indexedParameters[0]</name>
<stringValue id="74">Instument</stringValue>
<type>VARIABLE</type>
</item>
<item id="75" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="76">querySQL</name>
<stringValue id="77">update FT_T_ISCL set end_tms = now(), last_chg_tms = now(), last_chg_usr_id = 'DeriveBaselIIRating' where  INDUS_CL_SET_ID = 'RISKWGHT' and CLSF_PURP_TYP = 'CLASSIFY' and end_tms is null and instr_id = ?</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="78" type="java.util.HashSet">
<item id="79" type="com.j2fe.workflow.definition.Transition">
<name id="80">nothing-found</name>
<source id="81">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="82"/>
<directJoin>false</directJoin>
<name id="83">RISKWGHT LOCK?</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="84">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="85" type="java.util.HashSet">
<item id="86" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="87">database</name>
<stringValue id="88">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="89" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="90">indexedParameters[0]</name>
<stringValue id="91">Instument</stringValue>
<type>VARIABLE</type>
</item>
<item id="92" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="93">querySQL</name>
<stringValue id="94">select * from ft_t_ovrc, &#13;
(select instr_id, 'ISS_CLSF_OID='||iss_clsf_oid||';' iss_clsf_oid from ft_t_iscl where instr_id = ?  and indus_cl_set_id = 'RISKWGHT') iscl_rskwgt&#13;
where ovr_ref_oid = iscl_rskwgt.instr_id&#13;
and ovr_tbl_key_txt = iscl_rskwgt.iss_clsf_oid </stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="95" type="java.util.HashSet">
<item id="96" type="com.j2fe.workflow.definition.Transition">
<name id="97">ToSplit</name>
<source id="98">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="99">Automatically generated</description>
<directJoin>false</directJoin>
<name id="100">After FRTB</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="101">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="102" type="java.util.HashSet">
<item id="103" type="com.j2fe.workflow.definition.Transition">
<name id="104">goto-next</name>
<source id="105">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="106"/>
<directJoin>false</directJoin>
<name id="107">END-DATE old FRTB ISCL</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="108">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="109" type="java.util.HashSet">
<item id="110" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="111">database</name>
<stringValue id="112">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="113" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="114">indexedParameters[0]</name>
<stringValue id="115">Instument</stringValue>
<type>VARIABLE</type>
</item>
<item id="116" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="117">querySQL</name>
<stringValue id="118">UPDATE FT_T_ISCL
SET END_TMS = now(), LAST_CHG_TMS = now(), LAST_CHG_USR_ID = 'DeriveBaselIIAssetRating'
where INSTR_ID = ? and INDUS_CL_SET_ID ='FRTBCATG' and END_TMS is null</stringValue>
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
<name id="124">LogMessage CAT3 not eligibile</name>
<nodeHandler>com.j2fe.general.activities.LogMessage</nodeHandler>
<nodeHandlerClass id="125">com.j2fe.general.activities.LogMessage</nodeHandlerClass>
<parameters id="126" type="java.util.HashSet">
<item id="127" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="128">logLevel</name>
<stringValue id="129">INFO</stringValue>
<type>CONSTANT</type>
</item>
<item id="130" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="131">message</name>
<stringValue id="132">addFRTB3String</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="133" type="java.util.HashSet">
<item id="134" type="com.j2fe.workflow.definition.Transition">
<name id="135">goto-next</name>
<source id="136">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="137"/>
<directJoin>false</directJoin>
<name id="138">FRTB chk not eligible</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="139">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="140" type="java.util.HashSet">
<item id="141" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="142">statements</name>
<stringValue id="143">String addFRTB3String = "FRTB CAT not eligible. instr_id = '" + instrument + "'";&#13;
&#13;
return addFRTB3String;</stringValue>
<type>CONSTANT</type>
</item>
<item id="144" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="145">variables["addFRTB3String"]</name>
<stringValue id="146">addFRTB3String</stringValue>
<type>VARIABLE</type>
</item>
<item id="147" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="148">variables["instrument"]</name>
<stringValue id="149">Instument</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="150" type="java.util.HashSet">
<item id="151" type="com.j2fe.workflow.definition.Transition">
<name id="152">nothing-found</name>
<source id="153">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="154"/>
<directJoin>false</directJoin>
<name id="155">FRTB query</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="156">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="157" type="java.util.HashSet">
<item id="158" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="159">database</name>
<stringValue id="160">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="161" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="162">[0]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="163">indexedParameters[0]</name>
<stringValue id="164">Instument</stringValue>
<type>VARIABLE</type>
</item>
<item id="165" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="166">indexedResult[0][0]</name>
<stringValue id="167">thisInstrId</stringValue>
<type>VARIABLE</type>
<variablePart id="168"/>
</item>
<item id="169" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="170">indexedResult[0][1]</name>
<stringValue id="171">FRTBCategory</stringValue>
<type>VARIABLE</type>
<variablePart id="172"/>
</item>
<item id="173" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="174">mappedParameters</name>
<stringValue id="175">Mapped Parameters</stringValue>
<type>VARIABLE</type>
<variablePart id="176"/>
</item>
<item id="177" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="178">querySQL</name>
<objectValue id="179" type="java.lang.String">SELECT * FROM &#13;
(&#13;
    (&#13;
    -- ISSUER / FINS is CAT 1&#13;
    SELECT ISSU.INSTR_ID, 1 CATEGORY&#13;
    FROM FT_T_ISSU ISSU&#13;
    INNER JOIN FT_T_ISSR ISSR ON ISSU.INSTR_ISSR_ID = ISSR.INSTR_ISSR_ID -- Issuer of the Asset&#13;
    INNER JOIN FT_T_ISGP ISGP ON ISGP.INSTR_ID = ISSU.INSTR_ID AND PRT_PURP_TYP = 'INTEREST' AND ISGP.END_TMS IS NULL and ISGP.PRNT_ISS_GRP_OID not in (select ISS_GRP_OID from FT_T_ISGR where GRP_NME like 'MHSC%')&#13;
    INNER JOIN FT_T_FICL GICS ON (GICS.INST_MNEM = ISSR.FINS_INST_MNEM AND GICS.INDUS_CL_SET_ID = 'GICS' and GICS.END_TMS IS NULL&#13;
    )&#13;
    INNER JOIN FT_T_FIGU DOMI ON( DOMI.INST_MNEM = ISSR.FINS_INST_MNEM&#13;
    and DOMI.FINS_GU_PURP_TYP = 'DOMICILE' and DOMI.GU_TYP = 'COUNTRY' and DOMI.END_TMS Is Null&#13;
    )&#13;
    INNER JOIN  FT_T_FICL FRTBCAT ON (FRTBCAT.INST_MNEM = ISSR.FINS_INST_MNEM &#13;
      AND FRTBCAT.CLSF_OID IN ('FRTBCATG01') AND FRTBCAT.END_TMS IS NULL)&#13;
    )&#13;
    UNION&#13;
    (    &#13;
    -- Sovereign Issuer + Sovereign Issuer is CQS1 CAT3 Flow 1&#13;
	SELECT ISSU.INSTR_ID, 3 CATEGORY&#13;
    FROM FT_T_ISSU ISSU&#13;
    INNER JOIN FT_T_ISSR ISSR ON ISSU.INSTR_ISSR_ID = ISSR.INSTR_ISSR_ID -- Issuer of the Asset&#13;
    INNER JOIN FT_T_FIGU DOMI ON( DOMI.INST_MNEM = ISSR.FINS_INST_MNEM AND DOMI.FINS_GU_PURP_TYP = 'DOMICILE' AND DOMI.GU_TYP = 'COUNTRY'AND DOMI.END_TMS IS NULL)&#13;
    INNER JOIN FT_T_ISGP ISGP ON ISGP.INSTR_ID = ISSU.INSTR_ID AND PRT_PURP_TYP = 'INTEREST' AND ISGP.END_TMS IS NULL  and ISGP.PRNT_ISS_GRP_OID not in (select ISS_GRP_OID from FT_T_ISGR where GRP_NME like 'MHSC%')    &#13;
    INNER JOIN FT_T_FICL FICLG ON(FICLG.INST_MNEM = DOMI.INST_MNEM AND FICLG.INDUS_CL_SET_ID = 'BBINDGRP' AND FICLG.CL_VALUE IN ('Sovereign') AND FICLG.END_TMS IS NULL)&#13;
    INNER JOIN FT_T_FICL FICL2 ON(FICL2.INST_MNEM = DOMI.INST_MNEM AND FICL2.INDUS_CL_SET_ID = 'BBINDSGR' AND FICL2.CL_VALUE IN ('Sovereign') AND FICL2.END_TMS IS NULL)&#13;
    WHERE (EXISTS ( SELECT 'Y' FROM FT_T_FICL CQS WHERE CQS.INST_MNEM = DOMI.INST_MNEM AND CQS.INDUS_CL_SET_ID = 'CQSRANKG' AND CQS.CL_VALUE IN ('1') AND CQS.END_TMS IS NULL )&#13;
    OR EXISTS ( SELECT 'X' FROM FT_T_FICL CQSU WHERE CQSU.INST_MNEM = MHI_FINS_UP(DOMI.INST_MNEM) AND CQSU.INDUS_CL_SET_ID = 'CQSRANKG' AND CQSU.CL_VALUE IN ('1') AND CQSU.END_TMS IS NULL ))&#13;
  )&#13;
  UNION&#13;
  (&#13;
  --Sovereign Issuer + Sovereign Issuer is NOT CQS1 + Sovereign Issuer in Equiv countries + Issue CCY matches Issuer CCY - CAT3 flow 3&#13;
     SELECT ISSU.INSTR_ID, 3 CATEGORY&#13;
    FROM FT_T_ISSU ISSU&#13;
    INNER JOIN FT_T_ISSR ISSR ON ISSU.INSTR_ISSR_ID = ISSR.INSTR_ISSR_ID -- Issuer of the Asset&#13;
    INNER JOIN FT_T_FIGU DOMI ON( DOMI.INST_MNEM = ISSR.FINS_INST_MNEM AND DOMI.FINS_GU_PURP_TYP = 'DOMICILE' AND DOMI.GU_TYP = 'COUNTRY'AND DOMI.END_TMS IS NULL)&#13;
    INNER JOIN FT_T_ISGP ISGP ON ISGP.INSTR_ID = ISSU.INSTR_ID AND PRT_PURP_TYP = 'INTEREST' AND ISGP.END_TMS IS NULL  and ISGP.PRNT_ISS_GRP_OID not in (select ISS_GRP_OID from FT_T_ISGR where GRP_NME like 'MHSC%')    &#13;
    INNER JOIN FT_T_FICL FICLG ON(FICLG.INST_MNEM = DOMI.INST_MNEM AND FICLG.INDUS_CL_SET_ID = 'BBINDGRP' AND FICLG.CL_VALUE IN ('Sovereign') AND FICLG.END_TMS IS NULL)&#13;
    INNER JOIN FT_T_FICL FICL2 ON(FICL2.INST_MNEM = DOMI.INST_MNEM AND FICL2.INDUS_CL_SET_ID = 'BBINDSGR' AND FICL2.CL_VALUE IN ('Sovereign') AND FICL2.END_TMS IS NULL)&#13;
    WHERE NOT EXISTS ( SELECT 'Y' FROM FT_T_FICL CQS WHERE CQS.INST_MNEM = DOMI.INST_MNEM AND CQS.INDUS_CL_SET_ID = 'CQSRANKG' AND CQS.CL_VALUE IN ('1') AND CQS.END_TMS IS NULL )&#13;
    AND exists (-- Check if Issuer is in EU or Equivalent Country&#13;
                SELECT 'x' &#13;
                FROM FT_T_GUNT GUNT1&#13;
                WHERE GUNT1.PRNT_GU_ID = DOMI.GU_ID&#13;
                AND GUNT1.PRNT_GU_TYP = 'COUNTRY'&#13;
                AND (GUNT1.REGION_NME = 'European Union' or GUNT1.PRNT_GU_ID in --Equivalent Country&#13;
                    (select GU_ID from ft_t_gugp where END_TMS is null and PRNT_GU_GRP_OID in (select GU_GRP_OID from ft_t_gugr where GU_GRP_OID like 'GUGR000002')))&#13;
                )&#13;
     AND EXISTS ( --check the Issuer Country's currency matches Instrument Currency&#13;
                SELECT 'Y' &#13;
                FROM FT_T_GUNT GUNT2&#13;
                WHERE GUNT2.PRNT_GU_ID = DOMI.GU_ID&#13;
                AND GUNT2.PRNT_GU_TYP = 'COUNTRY'&#13;
                AND GUNT2.PREF_CURR_CDE = ISSU.DENOM_CURR_CDE&#13;
             )&#13;
  )&#13;
  UNION&#13;
    (&#13;
      -- Non-Sovereign Issuer + Sovereign Guarantor + Guarantor is CQS1 - CAT3 Flow 5&#13;
			SELECT ISSU.INSTR_ID, 3 CATEGORY&#13;
      FROM FT_T_ISSU ISSU&#13;
      INNER JOIN FT_T_ISSR ISSR ON ISSU.INSTR_ISSR_ID = ISSR.INSTR_ISSR_ID&#13;
      INNER JOIN FT_T_IRID IRID ON (IRID.INSTR_ISSR_ID = ISSR.INSTR_ISSR_ID AND IRID.ISSR_ID_CTXT_TYP = 'CLIENTREF')&#13;
      INNER JOIN FT_T_FRIP FRIP ON(FRIP.INSTR_ID = ISSU.INSTR_ID AND FRIP.FINSRL_TYP = 'GUARNTOR'AND FRIP.END_TMS IS NULL)&#13;
      INNER JOIN FT_T_FINS GUARANTR ON(GUARANTR.INST_MNEM = FRIP.INST_MNEM AND GUARANTR.END_TMS IS NULL)                           &#13;
      INNER JOIN FT_T_FIGU DOMI ON( DOMI.INST_MNEM = FRIP.INST_MNEM AND DOMI.FINS_GU_PURP_TYP = 'DOMICILE'AND DOMI.GU_TYP = 'COUNTRY')&#13;
      INNER JOIN FT_T_FICL FICLG ON(FICLG.INST_MNEM = ISSR.FINS_INST_MNEM AND FICLG.INDUS_CL_SET_ID IN ('BBINDGRP','BBINDSGR') AND FICLG.CL_VALUE NOT IN ('Sovereign')) -- Issuer is not sovereign&#13;
      INNER JOIN FT_T_FICL FICL3 ON(FICL3.INST_MNEM = FRIP.INST_MNEM AND FICL3.INDUS_CL_SET_ID = 'BBINDGRP' AND FICL3.CL_VALUE IN ('Sovereign')) -- Guarantor is Sovereign&#13;
      INNER JOIN FT_T_FICL FICL4 ON(FICL4.INST_MNEM = FRIP.INST_MNEM AND FICL4.INDUS_CL_SET_ID = 'BBINDSGR' AND FICL4.CL_VALUE IN ('Sovereign')) -- Guarantor is Sovereign&#13;
      INNER JOIN FT_T_ISGP ISGP ON ISGP.INSTR_ID = ISSU.INSTR_ID AND ISGP.PRT_PURP_TYP = 'INTEREST' AND ISGP.END_TMS IS NULL and ISGP.PRNT_ISS_GRP_OID not in (select ISS_GRP_OID from FT_T_ISGR where GRP_NME like 'MHSC%')&#13;
      WHERE ( EXISTS ( SELECT 'Y' FROM FT_T_FICL CQS WHERE CQS.INST_MNEM = FRIP.INST_MNEM AND CQS.INDUS_CL_SET_ID = 'CQSRANKG' AND CQS.CL_VALUE IN ('1') AND CQS.END_TMS IS NULL )&#13;
      OR EXISTS ( SELECT 'X' FROM FT_T_FICL CQSU WHERE CQSU.INST_MNEM = MHI_FINS_UP(FRIP.INST_MNEM) AND CQSU.INDUS_CL_SET_ID = 'CQSRANKG' AND CQSU.CL_VALUE IN ('1') AND CQSU.END_TMS IS NULL))&#13;
  )&#13;
UNION&#13;
	(&#13;
      -- Non Sovereign Issuer + Sovereign Guarantor + Guarantor is NOT CQS1 + Guarantor in Equiv countries + Isue CCY matches Guarantor Country's CCY - CAT3 flow 7&#13;
      SELECT ISSU.INSTR_ID, 3 CATEGORY&#13;
      FROM FT_T_ISSU ISSU&#13;
      INNER JOIN FT_T_ISSR ISSR ON ISSU.INSTR_ISSR_ID = ISSR.INSTR_ISSR_ID&#13;
      INNER JOIN FT_T_IRID IRID ON (IRID.INSTR_ISSR_ID = ISSR.INSTR_ISSR_ID AND IRID.ISSR_ID_CTXT_TYP = 'CLIENTREF')&#13;
      INNER JOIN FT_T_FRIP FRIP ON(FRIP.INSTR_ID = ISSU.INSTR_ID AND FRIP.FINSRL_TYP = 'GUARNTOR' AND FRIP.END_TMS IS NULL)&#13;
      INNER JOIN FT_T_FINS GUARANTR ON(GUARANTR.INST_MNEM = FRIP.INST_MNEM AND GUARANTR.END_TMS IS NULL)                           &#13;
      INNER JOIN FT_T_FIGU DOMI ON( DOMI.INST_MNEM = FRIP.INST_MNEM AND DOMI.FINS_GU_PURP_TYP = 'DOMICILE'AND DOMI.GU_TYP = 'COUNTRY')&#13;
      INNER JOIN FT_T_FICL FICLG ON(FICLG.INST_MNEM = ISSR.FINS_INST_MNEM AND FICLG.INDUS_CL_SET_ID IN ('BBINDGRP','BBINDSGR') AND FICLG.CL_VALUE NOT IN ('Sovereign')) -- Issuer is not sovereign&#13;
      INNER JOIN FT_T_FICL FICL3 ON(FICL3.INST_MNEM = FRIP.INST_MNEM AND FICL3.INDUS_CL_SET_ID = 'BBINDGRP' AND FICL3.CL_VALUE IN ('Sovereign')) -- Guarantor is Sovereign&#13;
      INNER JOIN FT_T_FICL FICL4 ON(FICL4.INST_MNEM = FRIP.INST_MNEM AND FICL4.INDUS_CL_SET_ID = 'BBINDSGR' AND FICL4.CL_VALUE IN ('Sovereign')) -- Guarantor is Sovereign&#13;
      INNER JOIN FT_T_ISGP ISGP ON ISGP.INSTR_ID = ISSU.INSTR_ID AND ISGP.PRT_PURP_TYP = 'INTEREST' AND ISGP.END_TMS IS NULL and ISGP.PRNT_ISS_GRP_OID not in (select ISS_GRP_OID from FT_T_ISGR where GRP_NME like 'MHSC%')&#13;
      WHERE NOT EXISTS ( SELECT 'Y' FROM FT_T_FICL CQS WHERE CQS.INST_MNEM = FRIP.INST_MNEM AND CQS.INDUS_CL_SET_ID = 'CQSRANKG' AND CQS.CL_VALUE IN ('1') AND CQS.END_TMS IS NULL )&#13;
      AND EXISTS (-- Check if Issuer is in EU or Equivalent Country&#13;
                SELECT 'x' &#13;
                FROM FT_T_GUNT GUNT1&#13;
                WHERE GUNT1.PRNT_GU_ID = DOMI.GU_ID&#13;
                AND GUNT1.PRNT_GU_TYP = 'COUNTRY'&#13;
                AND (GUNT1.REGION_NME = 'European Union' or GUNT1.PRNT_GU_ID in --Equivalent Country&#13;
                    (select GU_ID from ft_t_gugp where END_TMS is null and PRNT_GU_GRP_OID in (select GU_GRP_OID from ft_t_gugr where GU_GRP_OID like 'GUGR000002')))&#13;
                )&#13;
      AND EXISTS ( --check the Gurantor Country's currency matches Instrument Currency&#13;
                    SELECT 'Y' &#13;
                    FROM FT_T_GUNT GUNT2&#13;
                    WHERE GUNT2.PRNT_GU_ID = DOMI.GU_ID&#13;
                    AND GUNT2.PRNT_GU_TYP = 'COUNTRY'&#13;
                    AND GUNT2.PREF_CURR_CDE = ISSU.DENOM_CURR_CDE&#13;
                 )&#13;
	)&#13;
  -- CAT4 Queries from confluence &#13;
  UNION&#13;
  (&#13;
  -- Issuer is PSE + Issuer Country is CQS1 CAT4 flow 1&#13;
    SELECT ISSU.INSTR_ID, 4 CATEGORY&#13;
    FROM FT_T_ISSU ISSU&#13;
    INNER JOIN FT_T_ISSR ISSR ON ISSU.INSTR_ISSR_ID = ISSR.INSTR_ISSR_ID -- Issuer of the Asset&#13;
    INNER JOIN FT_T_ISGP ISGP ON ISGP.INSTR_ID = ISSU.INSTR_ID AND ISGP.PRT_PURP_TYP = 'INTEREST' AND ISGP.END_TMS IS NULL and ISGP.PRNT_ISS_GRP_OID not in (select ISS_GRP_OID from FT_T_ISGR where GRP_NME like 'MHSC%')&#13;
    INNER JOIN FT_T_FICL FRTB4 ON (FRTB4.INST_MNEM = ISSR.FINS_INST_MNEM AND FRTB4.INDUS_CL_SET_ID = 'FRTBCATG' and FRTB4.CLSF_OID = 'FRTBCATG04' AND FRTB4.END_TMS IS NULL ) -- Issuer in list of PSE Article 116(4)&#13;
    INNER JOIN FT_T_FIGU DOMI ON( DOMI.INST_MNEM = ISSR.FINS_INST_MNEM and DOMI.FINS_GU_PURP_TYP = 'DOMICILE' and DOMI.GU_TYP = 'COUNTRY' and DOMI.END_TMS Is Null )&#13;
    INNER JOIN ( SELECT FIGU1.GU_ID, FIGU1.INST_MNEM  FROM FT_T_FIGU FIGU1 INNER JOIN FT_T_FICL FICL1 ON FIGU1.INST_MNEM = FICL1.INST_MNEM&#13;
                 WHERE FICL1.INDUS_CL_SET_ID = 'FRTBCATG' AND FICL1.CLSF_OID = 'FRTBCNTY04' AND FICL1.END_TMS IS NULL&#13;
                 AND FIGU1.FINS_GU_PURP_TYP = 'RISK' AND FIGU1.GU_TYP = 'COUNTRY' AND FIGU1.END_TMS IS NULL&#13;
                ) RISKGU ON DOMI.GU_ID = RISKGU.GU_ID --Country Issuers&#13;
    WHERE EXISTS ( SELECT 'Y' FROM FT_T_FICL CQS WHERE CQS.INST_MNEM = RISKGU.INST_MNEM AND CQS.INDUS_CL_SET_ID = 'CQSRANKG' AND CQS.CL_VALUE IN ('1') AND CQS.END_TMS IS NULL )  --Country Issuer is CQS1&#13;
  )&#13;
  UNION&#13;
  (&#13;
  -- Issuer is PSE + Issuer Country is NOT CQS1 + Issue CCY matches PSE Issuer Country's CCY CAT4 flow 2&#13;
 SELECT ISSU.INSTR_ID, 4 CATEGORY&#13;
    FROM FT_T_ISSU ISSU&#13;
    INNER JOIN FT_T_ISSR ISSR ON ISSU.INSTR_ISSR_ID = ISSR.INSTR_ISSR_ID -- Issuer of the Asset&#13;
    INNER JOIN FT_T_ISGP ISGP ON ISGP.INSTR_ID = ISSU.INSTR_ID AND ISGP.PRT_PURP_TYP = 'INTEREST' AND ISGP.END_TMS IS NULL and ISGP.PRNT_ISS_GRP_OID not in (select ISS_GRP_OID from FT_T_ISGR where GRP_NME like 'MHSC%')&#13;
    INNER JOIN FT_T_FICL FRTB4 ON (FRTB4.INST_MNEM = ISSR.FINS_INST_MNEM AND FRTB4.INDUS_CL_SET_ID = 'FRTBCATG' and FRTB4.CLSF_OID = 'FRTBCATG04' AND FRTB4.END_TMS IS NULL ) -- Issuer in list of PSE Article 116(4)&#13;
    INNER JOIN FT_T_FIGU DOMI ON( DOMI.INST_MNEM = ISSR.FINS_INST_MNEM and DOMI.FINS_GU_PURP_TYP = 'DOMICILE' and DOMI.GU_TYP = 'COUNTRY' and DOMI.END_TMS Is Null )&#13;
    INNER JOIN ( SELECT FIGU1.GU_ID, FIGU1.INST_MNEM  FROM FT_T_FIGU FIGU1 INNER JOIN FT_T_FICL FICL1 ON FIGU1.INST_MNEM = FICL1.INST_MNEM&#13;
                 WHERE FICL1.INDUS_CL_SET_ID = 'FRTBCATG' AND FICL1.CLSF_OID = 'FRTBCNTY04' AND FICL1.END_TMS IS NULL&#13;
                 AND FIGU1.FINS_GU_PURP_TYP = 'RISK' AND FIGU1.GU_TYP = 'COUNTRY' AND FIGU1.END_TMS IS NULL&#13;
                ) RISKGU ON DOMI.GU_ID = RISKGU.GU_ID --Country Issuers&#13;
    WHERE NOT EXISTS ( SELECT 'Y' FROM FT_T_FICL CQS WHERE CQS.INST_MNEM = RISKGU.INST_MNEM AND CQS.INDUS_CL_SET_ID = 'CQSRANKG' AND CQS.CL_VALUE IN ('1') AND CQS.END_TMS IS NULL )  --Country Issuer is NOT CQS1&#13;
    AND  EXISTS ( --check the Issuer Country's currency matches Instrument Currency&#13;
                    SELECT 'Y' &#13;
                    FROM FT_T_GUNT GUNT2&#13;
                    WHERE GUNT2.PRNT_GU_ID = DOMI.GU_ID&#13;
                    AND GUNT2.PRNT_GU_TYP = 'COUNTRY'&#13;
                    AND GUNT2.PREF_CURR_CDE = ISSU.DENOM_CURR_CDE&#13;
                 )&#13;
  )&#13;
  UNION&#13;
  (&#13;
  -- Guarantor is PSE + Guarantor Country is CQS1 CAT4 flow 5&#13;
 SELECT ISSU.INSTR_ID, 4 CATEGORY&#13;
    FROM FT_T_ISSU ISSU&#13;
    INNER JOIN FT_T_FRIP FRIP ON ( ISSU.INSTR_ID = FRIP.INSTR_ID AND FRIP.FINSRL_TYP = 'GUARNTOR' AND FRIP.END_TMS IS NULL )-- Guarantor of the Asset&#13;
    INNER JOIN FT_T_ISGP ISGP ON (ISGP.INSTR_ID = ISSU.INSTR_ID AND ISGP.PRT_PURP_TYP = 'INTEREST' AND ISGP.END_TMS IS NULL and ISGP.PRNT_ISS_GRP_OID not in (select ISS_GRP_OID from FT_T_ISGR where GRP_NME like 'MHSC%') )&#13;
    INNER JOIN FT_T_FICL FRTB4 ON (FRTB4.INST_MNEM = FRIP.INST_MNEM AND FRTB4.INDUS_CL_SET_ID = 'FRTBCATG' and FRTB4.CLSF_OID = 'FRTBCATG04' AND FRTB4.END_TMS IS NULL ) -- Guarantor in list of PSE Article 116(4)&#13;
    INNER JOIN FT_T_FIGU DOMI ON( DOMI.INST_MNEM = FRIP.INST_MNEM and DOMI.FINS_GU_PURP_TYP = 'DOMICILE' and DOMI.GU_TYP = 'COUNTRY' and DOMI.END_TMS Is Null )&#13;
    INNER JOIN ( SELECT FIGU1.GU_ID, FIGU1.INST_MNEM  FROM FT_T_FIGU FIGU1 INNER JOIN FT_T_FICL FICL1 ON FIGU1.INST_MNEM = FICL1.INST_MNEM&#13;
                 WHERE FICL1.INDUS_CL_SET_ID = 'FRTBCATG' AND FICL1.CLSF_OID = 'FRTBCNTY04' AND FICL1.END_TMS IS NULL&#13;
                 AND FIGU1.FINS_GU_PURP_TYP = 'RISK' AND FIGU1.GU_TYP = 'COUNTRY' AND FIGU1.END_TMS IS NULL&#13;
                ) RISKGU ON DOMI.GU_ID = RISKGU.GU_ID --Country Issuers&#13;
    WHERE EXISTS ( SELECT 'Y' FROM FT_T_FICL CQS WHERE CQS.INST_MNEM = RISKGU.INST_MNEM AND CQS.INDUS_CL_SET_ID = 'CQSRANKG' AND CQS.CL_VALUE IN ('1') AND CQS.END_TMS IS NULL )  --Country Issuer is CQS1&#13;
  )&#13;
  UNION&#13;
  (&#13;
  -- Guarantor is PSE + Guarantor Country is NOT CQS1 + Issue CCY matches Guarantory Country's CCY CAT4 flow 6&#13;
 SELECT ISSU.INSTR_ID, 4 CATEGORY&#13;
    FROM FT_T_ISSU ISSU&#13;
    INNER JOIN FT_T_FRIP FRIP ON ( ISSU.INSTR_ID = FRIP.INSTR_ID AND FRIP.FINSRL_TYP = 'GUARNTOR' AND FRIP.END_TMS IS NULL )-- Guarantor of the Asset&#13;
    INNER JOIN FT_T_ISGP ISGP ON ( ISGP.INSTR_ID = ISSU.INSTR_ID AND ISGP.PRT_PURP_TYP = 'INTEREST' AND ISGP.END_TMS IS NULL and ISGP.PRNT_ISS_GRP_OID not in (select ISS_GRP_OID from FT_T_ISGR where GRP_NME like 'MHSC%'))&#13;
    INNER JOIN FT_T_FICL FRTB4 ON (FRTB4.INST_MNEM = FRIP.INST_MNEM AND FRTB4.INDUS_CL_SET_ID = 'FRTBCATG' and FRTB4.CLSF_OID = 'FRTBCATG04' AND FRTB4.END_TMS IS NULL ) -- Guarantor in list of PSE Article 116(4)&#13;
    INNER JOIN FT_T_FIGU DOMI ON( DOMI.INST_MNEM = FRIP.INST_MNEM and DOMI.FINS_GU_PURP_TYP = 'DOMICILE' and DOMI.GU_TYP = 'COUNTRY' and DOMI.END_TMS Is Null )&#13;
    INNER JOIN ( SELECT FIGU1.GU_ID, FIGU1.INST_MNEM  FROM FT_T_FIGU FIGU1 INNER JOIN FT_T_FICL FICL1 ON FIGU1.INST_MNEM = FICL1.INST_MNEM&#13;
                 WHERE FICL1.INDUS_CL_SET_ID = 'FRTBCATG' AND FICL1.CLSF_OID = 'FRTBCNTY04' AND FICL1.END_TMS IS NULL&#13;
                 AND FIGU1.FINS_GU_PURP_TYP = 'RISK' AND FIGU1.GU_TYP = 'COUNTRY' AND FIGU1.END_TMS IS NULL&#13;
                ) RISKGU ON DOMI.GU_ID = RISKGU.GU_ID --Country Issuers&#13;
    WHERE NOT EXISTS ( SELECT 'Y' FROM FT_T_FICL CQS WHERE CQS.INST_MNEM = RISKGU.INST_MNEM AND CQS.INDUS_CL_SET_ID = 'CQSRANKG' AND CQS.CL_VALUE IN ('1') AND CQS.END_TMS IS NULL )  --Country Issuer is NOT CQS1&#13;
    AND  EXISTS ( --check the Issuer Country's currency matches Instrument Currency&#13;
                    SELECT 'Y' &#13;
                    FROM FT_T_GUNT GUNT2&#13;
                    WHERE GUNT2.PRNT_GU_ID = DOMI.GU_ID&#13;
                    AND GUNT2.PRNT_GU_TYP = 'COUNTRY'&#13;
                    AND GUNT2.PREF_CURR_CDE = ISSU.DENOM_CURR_CDE&#13;
                 )&#13;
  )&#13;
  UNION&#13;
  (SELECT ISSU.INSTR_ID, 5 CATEGORY&#13;
    FROM FT_T_ISSU ISSU&#13;
    INNER JOIN FT_T_ISSR ISSR ON ISSU.INSTR_ISSR_ID = ISSR.INSTR_ISSR_ID -- Issuer of the Asset&#13;
    INNER JOIN FT_T_ISGP ISGP ON ISGP.INSTR_ID = ISSU.INSTR_ID AND PRT_PURP_TYP = 'INTEREST' AND ISGP.END_TMS IS NULL and ISGP.PRNT_ISS_GRP_OID not in (select ISS_GRP_OID from FT_T_ISGR where GRP_NME like 'MHSC%')&#13;
    INNER JOIN FT_T_FICL GICS ON (GICS.INST_MNEM = ISSR.FINS_INST_MNEM AND GICS.INDUS_CL_SET_ID = 'GICS' and GICS.END_TMS IS NULL&#13;
    )&#13;
    INNER JOIN FT_T_FIGU DOMI ON( DOMI.INST_MNEM = ISSR.FINS_INST_MNEM&#13;
    and DOMI.FINS_GU_PURP_TYP = 'DOMICILE' and DOMI.GU_TYP = 'COUNTRY' and DOMI.END_TMS Is Null&#13;
    )&#13;
    INNER JOIN  FT_T_FICL FRTBCAT ON (FRTBCAT.INST_MNEM = ISSR.FINS_INST_MNEM &#13;
      AND FRTBCAT.CLSF_OID IN ( 'FRTBCATG05') AND FRTBCAT.END_TMS IS NULL)&#13;
  )&#13;
  UNION&#13;
    (SELECT ISSU.INSTR_ID, 6 CATEGORY&#13;
    FROM FT_T_ISSU ISSU&#13;
    INNER JOIN FT_T_ISSR ISSR ON ISSU.INSTR_ISSR_ID = ISSR.INSTR_ISSR_ID -- Issuer of the Asset&#13;
    INNER JOIN FT_T_ISGP ISGP ON ISGP.INSTR_ID = ISSU.INSTR_ID AND PRT_PURP_TYP = 'INTEREST' AND ISGP.END_TMS IS NULL and ISGP.PRNT_ISS_GRP_OID not in (select ISS_GRP_OID from FT_T_ISGR where GRP_NME like 'MHSC%')&#13;
    INNER JOIN FT_T_FICL GICS ON (GICS.INST_MNEM = ISSR.FINS_INST_MNEM AND GICS.INDUS_CL_SET_ID = 'GICS' and GICS.END_TMS IS NULL&#13;
    )&#13;
    INNER JOIN FT_T_FIGU DOMI ON( DOMI.INST_MNEM = ISSR.FINS_INST_MNEM&#13;
    and DOMI.FINS_GU_PURP_TYP = 'DOMICILE' and DOMI.GU_TYP = 'COUNTRY' and DOMI.END_TMS Is Null&#13;
    )&#13;
    INNER JOIN  FT_T_FICL FRTBCAT ON (FRTBCAT.INST_MNEM = ISSR.FINS_INST_MNEM &#13;
      AND FRTBCAT.CLSF_OID IN ('FRTBCATG06') AND FRTBCAT.END_TMS IS NULL)&#13;
  )&#13;
	UNION&#13;
	(&#13;
	-- Issuer is Bank of England + Issue CCY is GBP&#13;
	SELECT ISSU.INSTR_ID, 7 CATEGORY&#13;
    FROM FT_T_ISSU ISSU&#13;
    INNER JOIN FT_T_ISSR ISSR ON ( ISSU.INSTR_ISSR_ID = ISSR.INSTR_ISSR_ID )-- Issuer of the Asset&#13;
    INNER JOIN FT_T_FICL FICL ON (ISSR.FINS_INST_MNEM = FICL.INST_MNEM and FICL.INDUS_CL_SET_ID = 'FRTBCATG' AND FICL.CLSF_OID = 'FRTBCATG07' AND FICL.END_TMS IS NULL) -- BANK OF ENGLAND ISSUER&#13;
    INNER JOIN FT_T_ISGP ISGP ON ( ISGP.INSTR_ID = ISSU.INSTR_ID AND ISGP.PRT_PURP_TYP = 'INTEREST' AND ISGP.END_TMS IS NULL and ISGP.PRNT_ISS_GRP_OID not in (select ISS_GRP_OID from FT_T_ISGR where GRP_NME like 'MHSC%'))&#13;
    WHERE ISSU.DENOM_CURR_CDE = 'GBP'&#13;
	)&#13;
	UNION&#13;
	(&#13;
	--Guarantor is Bank of England + Issue CCY is GBP&#13;
    SELECT ISSU.INSTR_ID, 7 CATEGORY&#13;
    FROM FT_T_ISSU ISSU&#13;
    INNER JOIN FT_T_FRIP FRIP ON ( ISSU.INSTR_ID = FRIP.INSTR_ID )-- Guarantor of the Asset&#13;
    INNER JOIN FT_T_FICL FICL ON (FRIP.INST_MNEM = FICL.INST_MNEM and FICL.INDUS_CL_SET_ID = 'FRTBCATG' AND FICL.CLSF_OID = 'FRTBCATG07' AND FICL.END_TMS IS NULL) -- BANK OF ENGLAND GUARANTOR&#13;
    INNER JOIN FT_T_ISGP ISGP ON ( ISGP.INSTR_ID = ISSU.INSTR_ID AND ISGP.PRT_PURP_TYP = 'INTEREST' AND ISGP.END_TMS IS NULL and ISGP.PRNT_ISS_GRP_OID not in (select ISS_GRP_OID from FT_T_ISGR where GRP_NME like 'MHSC%'))&#13;
    WHERE ISSU.DENOM_CURR_CDE = 'GBP'&#13;
	)&#13;
order by CATEGORY asc&#13;
) main&#13;
where 1=1&#13;
and INSTR_ID = ? &#13;
 limit 1</objectValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="180" type="java.util.HashSet">
<item id="181" type="com.j2fe.workflow.definition.Transition">
<name id="182">goto-next</name>
<source id="183">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="184"/>
<directJoin>false</directJoin>
<name id="185">FRTB checks</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="186">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="187" type="java.util.HashSet">
<item id="188" type="com.j2fe.workflow.definition.Transition">
<name id="189">goto-next</name>
<source id="190">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="191"/>
<directJoin>false</directJoin>
<name id="192">SFTR collateral ISCL insert</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="193">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="194" type="java.util.HashSet">
<item id="195" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="196">database</name>
<stringValue id="197">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="198" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="199">indexedParameters[0]</name>
<stringValue id="200">Instument</stringValue>
<type>VARIABLE</type>
</item>
<item id="201" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="202">indexedParameters[1]</name>
<stringValue id="203">dataSrc</stringValue>
<type>VARIABLE</type>
</item>
<item id="204" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="205">indexedParameters[2]</name>
<stringValue id="206">Instument</stringValue>
<type>VARIABLE</type>
</item>
<item id="207" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="208">querySQL</name>
<stringValue id="209">Insert into FT_T_ISCL (ISS_CLSF_OID,INSTR_ID,INDUS_CL_SET_ID,CLSF_OID,CL_VALUE,CLSF_PURP_TYP,START_TMS,LAST_CHG_TMS,LAST_CHG_USR_ID,DATA_STAT_TYP,DATA_SRC_ID)
select new_oid(),?,'SFTRQUAL','SFTRQUAL03', 'NOTR', 'SECUQUAL',now(),now(),'DeriveBaselIIAssetRating','ACTIVE',?
from dual
where NOT EXISTS (SELECT 1 from FT_T_ISCL where INSTR_ID = ? AND INDUS_CL_SET_ID = 'SFTRQUAL' AND END_TMS IS NULL)</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="210" type="java.util.HashSet">
<item id="211" type="com.j2fe.workflow.definition.Transition">
<name id="212">goto-next</name>
<source id="213">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="214">End date existing CQS Ranking in FICL</description>
<directJoin>false</directJoin>
<name id="215">End date SFTR</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="216">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="217" type="java.util.HashSet">
<item id="218" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="219">database</name>
<stringValue id="220">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="221" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="222">indexedParameters[0]</name>
<stringValue id="223">Instument</stringValue>
<type>VARIABLE</type>
</item>
<item id="224" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="225">indexedParameters[1]</name>
<stringValue id="226">dataSrc</stringValue>
<type>VARIABLE</type>
</item>
<item id="227" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="228">querySQL</name>
<objectValue id="229" type="java.lang.String">--update FT_T_ISCL iscl set iscl.end_tms = SYSDATE, iscl.LAST_CHG_TMS = SYSDATE, iscl.LAST_CHG_USR_ID = 'DeriveBaselIIAssetRating' where  iscl.INDUS_CL_SET_ID in ('SFTRQUAL') and iscl.CLSF_PURP_TYP = 'SECUQUAL' and iscl.END_TMS is null and iscl.INSTR_ID = ?
--and not exists (select 1 from FT_T_OVRC where OVR_REF_OID = iscl.INSTR_ID and END_TMS is null and OVR_REF_TYP = 'ISSU' and OVR_TBL_KEY_TXT = 'ISS_CLSF_OID='||iscl.ISS_CLSF_OID||';' )
-- delete SFTRQUAL ISCL where there is not a lock and (not NR or data_src changed)
-- and old cl_value / data_src_id different to new cl_value / data_src_id
update FT_T_ISCL iscl set end_tms = now(), last_chg_tms = now(), last_chg_usr_id = 'DeriveBaselIIAssetRating'
where iscl.INDUS_CL_SET_ID in ('SFTRQUAL') and iscl.CLSF_PURP_TYP = 'SECUQUAL' and iscl.end_tms is null and iscl.instr_id = ?
and not exists (select 1 FROM FT_T_OVRC where OVR_REF_OID =iscl.INSTR_ID and 'ISS_CLSF_OID=' || iscl.ISS_CLSF_OID|| ';' = OVR_TBL_KEY_TXT)
and (iscl.CLSF_OID != 'SFTRQUAL03' or iscl.data_src_id != ?)</objectValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="230" type="java.util.HashSet">
<item id="231" type="com.j2fe.workflow.definition.Transition">
<name id="232">goto-next</name>
<source id="233">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="234"/>
<directJoin>false</directJoin>
<name id="235">CQS Ranking ISCL insert</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="236">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="237" type="java.util.HashSet">
<item id="238" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="239">database</name>
<stringValue id="240">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="241" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="242">indexedParameters[0]</name>
<stringValue id="243">Instument</stringValue>
<type>VARIABLE</type>
</item>
<item id="244" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="245">indexedParameters[1]</name>
<stringValue id="246">Instument</stringValue>
<type>VARIABLE</type>
</item>
<item id="247" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="248">querySQL</name>
<objectValue id="249" type="java.lang.String">INSERT INTO FT_T_ISCL (ISS_CLSF_OID,INSTR_ID,INDUS_CL_SET_ID,CLSF_OID,CL_VALUE,CLSF_PURP_TYP,START_TMS,LAST_CHG_TMS,LAST_CHG_USR_ID,DATA_STAT_TYP,DATA_SRC_ID)
SELECT new_oid(), ?, 'CQSRANKG', CASE
		WHEN RTNG_CDE = 'AAA' THEN 'CQSRANKG01'
		WHEN RTNG_CDE = 'AA+' THEN 'CQSRANKG01'
		WHEN RTNG_CDE = 'AA' THEN 'CQSRANKG01'
		WHEN RTNG_CDE = 'AA-' THEN 'CQSRANKG01'
		WHEN RTNG_CDE = 'A+' THEN 'CQSRANKG02'
		WHEN RTNG_CDE = 'A' THEN 'CQSRANKG02'
		WHEN RTNG_CDE = 'A-' THEN 'CQSRANKG02'
		WHEN RTNG_CDE = 'BBB+' THEN 'CQSRANKG03'
		WHEN RTNG_CDE = 'BBB' THEN 'CQSRANKG03'
		WHEN RTNG_CDE = 'BBB-' THEN 'CQSRANKG03'
		WHEN RTNG_CDE = 'BB+' THEN 'CQSRANKG04'
		WHEN RTNG_CDE = 'BB' THEN 'CQSRANKG04'
		WHEN RTNG_CDE = 'BB-' THEN 'CQSRANKG04'
		WHEN RTNG_CDE = 'B+' THEN 'CQSRANKG05'
		WHEN RTNG_CDE = 'B' THEN 'CQSRANKG05'
		WHEN RTNG_CDE = 'B-' THEN 'CQSRANKG05'
		WHEN RTNG_CDE = 'CCC+' THEN 'CQSRANKG06'
		WHEN RTNG_CDE = 'CCC' THEN 'CQSRANKG06'
		WHEN RTNG_CDE = 'CCC-' THEN 'CQSRANKG06'
		WHEN RTNG_CDE = 'CC' THEN 'CQSRANKG06'
		WHEN RTNG_CDE = 'C' THEN 'CQSRANKG06'
		WHEN RTNG_CDE = 'D' THEN 'CQSRANKGDF'
		WHEN RTNG_CDE = 'NR' THEN 'CQSRANKGNR'
		ELSE NULL
    END AS CLSF_OID,
    CASE 
        WHEN RTNG_CDE = 'AAA' THEN '1'
        WHEN RTNG_CDE = 'AA+' THEN '1'
        WHEN RTNG_CDE = 'AA' THEN '1'
        WHEN RTNG_CDE = 'AA-' THEN '1'
        WHEN RTNG_CDE = 'A+' THEN '2'
        WHEN RTNG_CDE = 'A' THEN '2'
        WHEN RTNG_CDE = 'A-' THEN '2'
        WHEN RTNG_CDE = 'BBB+' THEN '3'
        WHEN RTNG_CDE = 'BBB' THEN '3'
        WHEN RTNG_CDE = 'BBB-' THEN '3'
        WHEN RTNG_CDE = 'BB+' THEN '4'
        WHEN RTNG_CDE = 'BB' THEN '4'
        WHEN RTNG_CDE = 'BB-' THEN '4'
        WHEN RTNG_CDE = 'B+' THEN '5'
        WHEN RTNG_CDE = 'B' THEN '5'
        WHEN RTNG_CDE = 'B-' THEN '5'
        WHEN RTNG_CDE = 'CCC+' THEN '6'
        WHEN RTNG_CDE = 'CCC' THEN '6'
        WHEN RTNG_CDE = 'CCC-' THEN '6'
        WHEN RTNG_CDE = 'CC' THEN '6'
        WHEN RTNG_CDE = 'C' THEN '6'
        WHEN RTNG_CDE = 'D' THEN 'D'
        WHEN RTNG_CDE = 'NR' THEN 'NR'
        ELSE NULL
    END AS RTNG_CDE,'CLASSIFY',current_timestamp,current_timestamp,'DeriveBaselIIAssetRating', 'ACTIVE','MHI'
FROM FT_T_RTVL
WHERE RTNG_SET_OID = 'RTNG000010'AND RTNG_CDE = 'NR'
AND NOT EXISTS (SELECT 1 FROM FT_T_ISCL WHERE INSTR_ID = ? AND INDUS_CL_SET_ID = 'CQSRANKG' AND END_TMS IS NULL)</objectValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="250" type="java.util.HashSet">
<item id="251" type="com.j2fe.workflow.definition.Transition">
<name id="252">goto-next</name>
<source id="253">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="254">End date existing CQS Ranking in FICL</description>
<directJoin>false</directJoin>
<name id="255">End date CQS Ranking</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="256">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="257" type="java.util.HashSet">
<item id="258" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="259">database</name>
<stringValue id="260">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="261" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="262">indexedParameters[0]</name>
<stringValue id="263">Instument</stringValue>
<type>VARIABLE</type>
</item>
<item id="264" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="265">indexedParameters[1]</name>
<stringValue id="266">dataSrc</stringValue>
<type>VARIABLE</type>
</item>
<item id="267" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="268">querySQL</name>
<stringValue id="269">--update FT_T_ISCL set end_tms = sysdate, last_chg_tms = sysdate, last_chg_usr_id = 'DeriveBaselIIAssetRating' where  INDUS_CL_SET_ID in ('CQSRANKG') and CLSF_PURP_TYP = 'CLASSIFY' and end_tms is null and instr_id = ?
-- delete CQSRANKG ISCL where there is not a lock and (not NR or data src different)
update FT_T_ISCL iscl set end_tms = now(), last_chg_tms = now(), last_chg_usr_id = 'DeriveBaselIIAssetRating'
where iscl.INDUS_CL_SET_ID in ('CQSRANKG') and iscl.CLSF_PURP_TYP = 'CLASSIFY' and iscl.end_tms is null and iscl.instr_id = ?
and not exists (select 1 FROM FT_T_OVRC where OVR_REF_OID =iscl.INSTR_ID and 'ISS_CLSF_OID=' || iscl.ISS_CLSF_OID|| ';' = OVR_TBL_KEY_TXT)
and (iscl.CLSF_OID != 'CQSRANKGNR' 
or iscl.data_src_id != ?)</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="270" type="java.util.HashSet">
<item id="271" type="com.j2fe.workflow.definition.Transition">
<name id="272">goto-next</name>
<source id="273">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="274"/>
<directJoin>false</directJoin>
<name id="275">NR insert Basel II Rating Standard</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="276">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="277" type="java.util.HashSet">
<item id="278" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="279">database</name>
<stringValue id="280">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="281" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="282">indexedParameters[0]</name>
<stringValue id="283">Instument</stringValue>
<type>VARIABLE</type>
</item>
<item id="284" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="285">indexedParameters[1]</name>
<stringValue id="286">Instument</stringValue>
<type>VARIABLE</type>
</item>
<item id="287" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="288">querySQL</name>
<objectValue id="289" type="java.lang.String">--RDD-268 start
--insert into ft_t_isrt (ISS_RTNG_OID, INSTR_ID, START_TMS, LAST_CHG_USR_ID, LAST_CHG_TMS, RTNG_CDE, RTNG_VALUE_OID, RTNG_SET_OID, orig_data_prov_id, data_stat_typ, rtng_eff_tms)
insert into ft_t_isrt (ISS_RTNG_OID, INSTR_ID, START_TMS, LAST_CHG_USR_ID, LAST_CHG_TMS, RTNG_CDE, RTNG_SYMBOL_TXT, RTNG_VALUE_OID, RTNG_SET_OID, orig_data_prov_id, data_stat_typ, rtng_eff_tms, data_src_id)
--RDD-268 end
select new_oid(), ?, now(), 'DeriveBaselIIAssetRating', now(), rtng_cde, rtng_cde, rtng_value_oid, rtng_set_oid, 'DERIVED', 'ACTIVE', (date_trunc('day', now())::timestamp), 'MHI'  from ft_t_rtvl
where rtng_set_oid = 'RTNG000010'
and rtng_cde = 'NR'
--RDD-268 start
--and not exists (select 1 from ft_t_isrt where rtng_set_oid = 'RTNG000010' and instr_id = ? and start_tms &lt;= now() and (end_tms is null or end_tms &gt; now()))
and not exists (select 1 from ft_t_isrt where rtng_set_oid = 'RTNG000010' and instr_id = ? and rtng_eff_tms &lt;= now() and (sys_eff_end_tms is null or sys_eff_end_tms &gt; now()))
--RDD-268 end</objectValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="290" type="java.util.HashSet">
<item id="291" type="com.j2fe.workflow.definition.Transition">
<name id="292">goto-next</name>
<source id="293">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="294"/>
<directJoin>false</directJoin>
<name id="295">NR insert Basel II Rating</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="296">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="297" type="java.util.HashSet">
<item id="298" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="299">database</name>
<stringValue id="300">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="301" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="302">indexedParameters[0]</name>
<stringValue id="303">Instument</stringValue>
<type>VARIABLE</type>
</item>
<item id="304" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="305">indexedParameters[1]</name>
<stringValue id="306">Instument</stringValue>
<type>VARIABLE</type>
</item>
<item id="307" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="308">querySQL</name>
<stringValue id="309">--RDD-268 start
--insert into ft_t_isrt (ISS_RTNG_OID, INSTR_ID, START_TMS, LAST_CHG_USR_ID, LAST_CHG_TMS, RTNG_CDE, RTNG_VALUE_OID, RTNG_SET_OID, orig_data_prov_id, data_stat_typ, rtng_eff_tms)
insert into ft_t_isrt (ISS_RTNG_OID, INSTR_ID, START_TMS, LAST_CHG_USR_ID, LAST_CHG_TMS, RTNG_CDE, RTNG_SYMBOL_TXT, RTNG_VALUE_OID, RTNG_SET_OID, orig_data_prov_id, data_stat_typ, rtng_eff_tms, data_src_id)
--RDD-268 end
select new_oid(), ?, now(), 'DeriveBaselIIAssetRating', now(), rtng_cde, rtng_cde, rtng_value_oid, rtng_set_oid, 'NR', 'ACTIVE', (date_trunc('day', now())::timestamp), 'MHI' from ft_t_rtvl
where rtng_set_oid = 'RTNG000009'
and rtng_cde = 'NR'
--RDD-268 start
--and not exists (select 1 from ft_t_isrt where rtng_set_oid = 'RTNG000009' and instr_id = ? and start_tms &lt;= now() and (end_tms is null or end_tms &gt; now()))
and not exists (select 1 from ft_t_isrt where rtng_set_oid = 'RTNG000009' and instr_id = ? and rtng_eff_tms &lt;= now() and (sys_eff_end_tms is null or sys_eff_end_tms &gt; now()))
--RDD-268 end</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="310" type="java.util.HashSet">
<item id="311" type="com.j2fe.workflow.definition.Transition">
<name id="312">nothing-found</name>
<source id="313">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="314"/>
<directJoin>false</directJoin>
<name id="315">UP ISSR JCR rating</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="316">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="317" type="java.util.HashSet">
<item id="318" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="319">database</name>
<stringValue id="320">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="321" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="322">[0]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="323">indexedParameters[0]</name>
<stringValue id="324">Issuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="325" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="326">[1]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="327">indexedParameters[1]</name>
<stringValue id="328">Instument</stringValue>
<type>VARIABLE</type>
</item>
<item id="329" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="330">indexedResult</name>
<stringValue id="331">JRRating</stringValue>
<type>VARIABLE</type>
</item>
<item id="332" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="333">querySQL</name>
<objectValue id="334" type="java.lang.String">select rtvl.rtng_cde, vendor,  to_char(rank_num, '99999') , '3' ,  rtngname from
(
select 
rtng_set_nme rtngname,
'JCR' vendor, rtvl.rtng_cde, rtvl.rank_num num, rtvl.rtng_set_oid, rtvl.rtng_value_oid, firt.rtng_cde rating, 
rank() over ( order by rtvl.rank_num desc) rank, rtvl.rank_num
from ft_t_issr issr, ft_t_firt firt, ft_t_rtvl rtvl, ft_t_rtng rtng where 1=1
and instr_issr_id = ?
and issr.fins_inst_mnem = firt.inst_mnem
and rtng.rtng_set_oid = rtvl.rtng_set_oid 
and now() between rtng.start_tms and coalesce(rtng.end_tms, now() + interval '1 day')
and rtvl.rtng_value_oid = firt.rtng_value_oid 
and firt.rtng_cde = rtvl.rtng_cde
and rtvl.rank_num is not null
and firt.rtng_set_oid = rtvl.rtng_set_oid
and coalesce(firt.rtng_purp_typ,'x') != 'PSTANDRD'
--RDD-268 start
and firt.start_tms &lt;= now() and (firt.end_tms is null or firt.end_tms &gt; now())
and firt.rtng_eff_tms &lt;= now() and (firt.sys_eff_end_tms is null or firt.sys_eff_end_tms &gt; now())
--RDD-268 end
and rtvl.start_tms &lt;= now() and (rtvl.end_tms is null or rtvl.end_tms &gt; now())
and rtng.rtng_set_oid = rtvl.rtng_set_oid
and  trim(rtvl.rtng_set_oid) = '3000000006'
)rtvl where rtvl.rank=1
and exists (
select 1 from ft_t_iscl grp, ft_t_iscl sgr, ft_t_iscl sec
where grp.instr_id  = ?
and grp.instr_id = sgr.instr_id and grp.instr_id = sec.instr_id
and grp.INDUS_CL_SET_ID = 'BBINDGRP' and grp.cl_value = 'Sovereign'
and grp.end_tms is null
and sgr.INDUS_CL_SET_ID = 'BBINDSGR' and sgr.cl_value = 'Sovereign'
and sgr.end_tms is null
and sec.INDUS_CL_SET_ID = 'BBINDSEC' and sec.cl_value = 'Government'
and sec.end_tms is null)</objectValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="335" type="java.util.HashSet">
<item id="336" type="com.j2fe.workflow.definition.Transition">
<name id="337">nothing-found</name>
<source id="338">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="339"/>
<directJoin>false</directJoin>
<name id="340">ISSR JCR rating</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="341">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="342" type="java.util.HashSet">
<item id="343" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="344">database</name>
<stringValue id="345">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="346" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="347">[0]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="348">indexedParameters[0]</name>
<stringValue id="349">Issuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="350" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="351">indexedResult</name>
<stringValue id="352">JRRating</stringValue>
<type>VARIABLE</type>
</item>
<item id="353" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="354">querySQL</name>
<objectValue id="355" type="java.lang.String">select rtvl.rtng_cde, vendor,  to_char(rank_num,'99999') , '3' ,  rtngname from
(
select 
rtng_set_nme rtngname,
'JCR' vendor, rtvl.rtng_cde, rtvl.rank_num num, rtvl.rtng_set_oid, rtvl.rtng_value_oid, firt.rtng_cde rating, 
rank() over ( order by rtvl.rank_num desc) rank, rtvl.rank_num
from ft_t_issr issr, ft_t_firt firt, ft_t_rtvl rtvl, ft_t_rtng rtng where 1=1
and instr_issr_id = ?
and issr.fins_inst_mnem = firt.inst_mnem
and rtng.rtng_set_oid = rtvl.rtng_set_oid 
and now() between rtng.start_tms and coalesce(rtng.end_tms, now() + interval'1 day')
and rtvl.rtng_value_oid = firt.rtng_value_oid 
and firt.rtng_cde = rtvl.rtng_cde
and rtvl.rank_num is not null
and firt.rtng_set_oid = rtvl.rtng_set_oid
and coalesce(firt.rtng_purp_typ,'x') != 'PSTANDRD'
--RDD-268 start
and firt.start_tms &lt;= now() and (firt.end_tms is null or firt.end_tms &gt; now())
and firt.rtng_eff_tms &lt;= now() and (firt.sys_eff_end_tms is null or firt.sys_eff_end_tms &gt; now())
--RDD-268 end
and rtvl.start_tms &lt;= now() and (rtvl.end_tms is null or rtvl.end_tms &gt; now())
and rtng.rtng_set_oid = rtvl.rtng_set_oid
and  trim(rtvl.rtng_set_oid) = '3000000006'
)rtvl where rtvl.rank=1</objectValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="356" type="java.util.HashSet">
<item id="357" type="com.j2fe.workflow.definition.Transition">
<name id="358">goto-next</name>
<source id="359">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="360">Automatically generated</description>
<directJoin>false</directJoin>
<name id="361">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="362">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="363" type="java.util.HashSet">
<item id="364" type="com.j2fe.workflow.definition.Transition">
<name id="365">2</name>
<source id="366">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="367"/>
<directJoin>false</directJoin>
<name id="368">Check what exists</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="369">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="370" type="java.util.HashSet">
<item id="371" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="372">statements</name>
<stringValue id="373">String subordinated = "NULL";&#13;
String secured = "NULL";&#13;
String guarantor = "NULL";&#13;
String creditlinked = "NULL";&#13;
String uniqu = "NULL";&#13;
String fcy = "NULL";&#13;
&#13;
if(null != Seniority[0][2]){&#13;
	creditlinked = Seniority[0][2];&#13;
}&#13;
&#13;
if(null != Seniority[0][4]){&#13;
	uniqu = Seniority[0][4];&#13;
}&#13;
&#13;
if(null != Seniority[0][5]){&#13;
	fcy = Seniority[0][5];&#13;
}&#13;
&#13;
if (null != Seniority[0][0] &amp;&amp; null == Seniority[0][3] &amp;&amp; null == Seniority[0][1]){&#13;
	subordinated = Seniority[0][0];&#13;
	return 1;&#13;
} else if (null == Seniority[0][0] &amp;&amp; null != Seniority[0][3] &amp;&amp; null == Seniority[0][1]){&#13;
	secured = Seniority[0][3];	&#13;
	return 1;&#13;
} else if (null == Seniority[0][0] &amp;&amp; null == Seniority[0][3] &amp;&amp; null != Seniority[0][1]){&#13;
	guarantor = Seniority[0][1];&#13;
	return 1;&#13;
} else {&#13;
	return 2;&#13;
}</stringValue>
<type>CONSTANT</type>
</item>
<item id="374" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="375">["Seniority"]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="376">variables["Seniority"]</name>
<stringValue id="377">SeniorityInfo</stringValue>
<type>VARIABLE</type>
</item>
<item id="378" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="379">["creditlinked"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="380">variables["creditlinked"]</name>
<stringValue id="381">creditlinked</stringValue>
<type>VARIABLE</type>
</item>
<item id="382" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="383">["fcy"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="384">variables["fcy"]</name>
<stringValue id="385">fcy</stringValue>
<type>VARIABLE</type>
</item>
<item id="386" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="387">["guarantor"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="388">variables["guarantor"]</name>
<stringValue id="389">guarantor</stringValue>
<type>VARIABLE</type>
</item>
<item id="390" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="391">["secured"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="392">variables["secured"]</name>
<stringValue id="393">secured</stringValue>
<type>VARIABLE</type>
</item>
<item id="394" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="395">["subordinated"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="396">variables["subordinated"]</name>
<stringValue id="397">subordinated</stringValue>
<type>VARIABLE</type>
</item>
<item id="398" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="399">["uniqu"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="400">variables["uniqu"]</name>
<stringValue id="401">uniqu</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="402" type="java.util.HashSet">
<item id="403" type="com.j2fe.workflow.definition.Transition">
<name id="404">rows-found</name>
<source id="405">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="406"/>
<directJoin>false</directJoin>
<name id="407">Check for Seniority</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="408">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="409" type="java.util.HashSet">
<item id="410" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="411">database</name>
<stringValue id="412">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="413" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="414">indexedParameters[0]</name>
<stringValue id="415">Instument</stringValue>
<type>VARIABLE</type>
</item>
<item id="416" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="417">indexedResult</name>
<stringValue id="418">SeniorityInfo</stringValue>
<type>VARIABLE</type>
</item>
<item id="419" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="420">querySQL</name>
<objectValue id="421" type="java.lang.String">select 
(SELECT COLL_TYP FROM FT_T_ISLL WHERE INSTR_ID = ISSU.INSTR_ID AND COLL_TYP = 'Subordinated' 
AND START_TMS &lt;= now() AND (END_TMS IS NULL OR END_TMS &gt; now()) limit 1) AS Subordinated,
(SELECT INST_MNEM FROM FT_T_FINS FINS
WHERE EXISTS(SELECT 1 FROM FT_T_FINR WHERE FINSRL_TYP = 'GUARNTOR' AND INST_MNEM = FINS.INST_MNEM AND START_TMS &lt;= now() AND (END_TMS IS NULL OR END_TMS &gt; now()))
AND EXISTS(SELECT 1 FROM FT_T_FRIP WHERE INST_MNEM = FINS.INST_MNEM AND INSTR_ID =  ISSU.INSTR_ID AND START_TMS &lt;= now() AND (END_TMS IS NULL OR END_TMS &gt; now()))
AND START_TMS &lt;= now() AND (END_TMS IS NULL OR END_TMS &gt; now()) limit 1) AS GUARANTOR,
(SELECT RISS.INSTR_ID FROM FT_T_RISS RISS, FT_T_RIDF RIDF WHERE RISS.ISS_PART_RL_TYP = 'UNDLYING' AND RIDF.REL_TYP = 'CreditLinked'
AND RIDF.RLD_ISS_FEAT_ID = RISS.RLD_ISS_FEAT_ID AND RISS.INSTR_ID IS NOT NULL AND RIDF.INSTR_ID = ISSU.INSTR_ID
AND RIDF.START_TMS &lt;= now() AND (RIDF.END_TMS IS NULL OR RIDF.END_TMS &gt; now())
AND RISS.START_TMS &lt;= now() AND (RISS.END_TMS IS NULL OR RISS.END_TMS &gt; now()) limit 1) AS CREDITLINKED,
(SELECT COLL_TYP FROM FT_T_ISLL WHERE INSTR_ID = ISSU.INSTR_ID AND COLL_TYP = 'Secured' 
AND START_TMS &lt;= now() AND (END_TMS IS NULL OR END_TMS &gt; now()) limit 1) AS SECURED,
(SELECT CL_VALUE FROM FT_T_ISCL WHERE INSTR_ID = ISSU.INSTR_ID AND INDUS_CL_SET_ID= 'MIZUNIQE' 
AND START_TMS &lt;= now() AND (END_TMS IS NULL OR END_TMS &gt; now()) limit 1) AS UNIQU,
(SELECT ISGP.PRNT_ISS_GRP_OID FROM FT_T_ISGP ISGP, FT_T_ISGR ISGR
where isgp.prnt_iss_grp_oid = isgr.iss_grp_oid and isgp.instr_id = ISSU.INSTR_ID and GRP_nme = 'FCY'
AND ISGP.START_TMS &lt;= now() AND (ISGP.END_TMS IS NULL OR ISGP.END_TMS &gt; now())
AND ISGR.START_TMS &lt;= now() AND (ISGR.END_TMS IS NULL OR ISGR.END_TMS &gt; now()) limit 1) AS FCY
from ft_t_issu issu where issu.instr_id = ?
AND EXISTS (SELECT 1 FROM FT_T_ISTY ISTY WHERE ISTY.ISS_TYP = ISSU.ISS_TYP AND ISTY.PRNT_ISS_TYP = 'DEBT'
AND ISTY.START_TMS &lt;=now() AND (ISTY.END_TMS IS NULL OR ISTY.END_TMS &gt; now()))
and issu.start_tms &lt;= now() and (issu.end_tms is null or issu.end_tms &gt; now())</objectValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="422" type="java.util.HashSet">
<item id="423" type="com.j2fe.workflow.definition.Transition">
<name id="424">nothing-found</name>
<source id="425">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="426"/>
<directJoin>false</directJoin>
<name id="427">Derived JCR rating</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="428">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="429" type="java.util.HashSet">
<item id="430" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="431">database</name>
<stringValue id="432">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="433" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="434">[0]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="435">indexedParameters[0]</name>
<stringValue id="436">Instument</stringValue>
<type>VARIABLE</type>
</item>
<item id="437" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="438">indexedResult</name>
<stringValue id="439">JRRating</stringValue>
<type>VARIABLE</type>
</item>
<item id="440" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="441">querySQL</name>
<stringValue id="442">select isrt.rtng_cde, 
'JCR' vendor,
(select to_char(rtvl.rank_num, '99999') from ft_t_rtvl rtvl
 where rtvl.rtng_cde = isrt.rtng_cde
 and  trim(rtvl.rtng_set_oid) = isrt.rtng_set_oid) num , '2'
from ft_t_isrt isrt where isrt.instr_id = ?
--RDD-268 start
and isrt.start_tms &lt;= now() and (isrt.end_tms is null or isrt.end_tms &gt; now())
and isrt.rtng_eff_tms &lt;= now() and (isrt.sys_eff_end_tms is null or isrt.sys_eff_end_tms &gt; now())
--RDD-268 start
and isrt.rtng_set_oid ='RTNG000004'</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="443" type="java.util.HashSet">
<item id="444" type="com.j2fe.workflow.definition.Transition">
<name id="445">nothing-found</name>
<source id="446">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="447"/>
<directJoin>false</directJoin>
<name id="448">JCR rating</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="449">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="450" type="java.util.HashSet">
<item id="451" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="452">database</name>
<stringValue id="453">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="454" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="455">[0]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="456">indexedParameters[0]</name>
<stringValue id="457">Instument</stringValue>
<type>VARIABLE</type>
</item>
<item id="458" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="459">indexedResult</name>
<stringValue id="460">JRRating</stringValue>
<type>VARIABLE</type>
</item>
<item id="461" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="462">querySQL</name>
<objectValue id="463" type="java.lang.String">select distinct rtng_cde, vendor, to_char(rank_num,'99999') , '1' from (
select isrt.rtng_cde, 'JCR' vendor,
rtvl.rank_num ,
rank() over ( order by rtvl.rank_num desc) rank
from ft_t_isrt isrt, ft_t_rtvl rtvl , ft_t_rtvl drtvl, ft_t_rtng rtng
where isrt.instr_id = ?
and rtng.rtng_set_oid = isrt.rtng_set_oid
and  rtvl.rtng_cde = isrt.rtng_cde
--EG-2532 add rank_num check
and rtvl.rank_num is not null
and  drtvl.rtng_cde = isrt.rtng_cde
and trim (drtvl.rtng_value_oid) = trim (isrt.rtng_value_oid)
and coalesce(isrt.rtng_purp_typ,'x') != 'PSTANDRD'
--RDD-268 start
and isrt.start_tms &lt;= now() and (isrt.end_tms is null or isrt.end_tms &gt; now())
and isrt.rtng_eff_tms &lt;= now() and (isrt.sys_eff_end_tms is null or isrt.sys_eff_end_tms &gt; now())
--RDD-268 end
and rtvl.start_tms &lt;= now() and (rtvl.end_tms is null or rtvl.end_tms &gt; now())
and drtvl.start_tms &lt;= now() and (drtvl.end_tms is null or drtvl.end_tms &gt; now())
and  rtvl.rtng_cde = isrt.rtng_cde
and  rtng.rtng_set_oid = rtvl.rtng_set_oid
and  trim(rtvl.rtng_set_oid) =  '3000000006' 
) sq1 where rank =1</objectValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="464" type="java.util.HashSet">
<item id="465" type="com.j2fe.workflow.definition.Transition">
<name id="466">nothing-found</name>
<source id="467">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="468"/>
<directJoin>false</directJoin>
<name id="469">UP S, M and F rating</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="470">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="471" type="java.util.HashSet">
<item id="472" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="473">database</name>
<stringValue id="474">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="475" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="476">[0]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="477">indexedParameters[0]</name>
<stringValue id="478">Issuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="479" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="480">indexedParameters[1]</name>
<stringValue id="481">Instument</stringValue>
<type>VARIABLE</type>
</item>
<item id="482" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="483">indexedParameters[2]</name>
<stringValue id="484">Instument</stringValue>
<type>VARIABLE</type>
</item>
<item id="485" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="486">indexedParameters[3]</name>
<stringValue id="487">Instument</stringValue>
<type>VARIABLE</type>
</item>
<item id="488" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="489">indexedResult</name>
<stringValue id="490">SMFRating</stringValue>
<type>VARIABLE</type>
</item>
<item id="491" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="492">querySQL</name>
<objectValue id="493" type="java.lang.String">select distinct rtvl.rtng_cde, vendor,  to_char(rank_num,'99999') , '3',  rtngname from
(
select 
(select rtng_set_nme from ft_t_rtng where rtng_set_oid = rtvl.rtng_set_oid and start_tms &lt;= now() and (end_tms is null or end_tms &gt; now())) rtngname,
(case  when upper(rtvl.data_src_id) like '%MOODYS%' then 'MOODYS'
      when upper(rtvl.data_src_id) like '%FITCH%' then 'FITCH'
      when upper(rtvl.data_src_id) like '%SNP%' then 'SNP'
end) vendor, drvl.rtng_cde, drvl.rank_num num, drvl.rtng_set_oid, drvl.rtng_value_oid, firt.rtng_cde rating, 
rank() over (partition by (case  when upper(rtvl.data_src_id) like '%MOODYS%' then 'MOODY'
      when upper(rtvl.data_src_id) like '%FITCH%' then 'FITCH'
      when upper(rtvl.data_src_id) like '%SNP%' then 'SNP'
end) order by drvl.rank_num desc) rank, DRVL.rank_num
from ft_t_issr issr, ft_t_firt firt, ft_t_rtvl rtvl, ft_t_rtvl drvl where 1=1
and instr_issr_id in (select instr_issr_id from ft_t_issr
where END_TMS is null
and fins_inst_mnem = (
select mhi_fins_up(fins_inst_mnem)
from ft_t_issr
where end_tms is null
and instr_issr_id = ?))
and issr.fins_inst_mnem = firt.inst_mnem
and rtvl.rtng_value_oid = firt.rtng_value_oid 
and firt.rtng_cde = rtvl.rtng_cde
and firt.rtng_set_oid = rtvl.rtng_set_oid
and coalesce(firt.rtng_purp_typ,'x') != 'PSTANDRD'
and drvl.rtng_cde = rtvl.rtng_cde 
--RDD-268 start
and firt.start_tms &lt;= now() and (firt.end_tms is null or firt.end_tms &gt; now())
and firt.rtng_eff_tms &lt;= now() and (firt.sys_eff_end_tms is null or firt.sys_eff_end_tms &gt; now())
--RDD-268 end
and rtvl.start_tms &lt;= now() and (rtvl.end_tms is null or rtvl.end_tms &gt; now())
and drvl.start_tms &lt;= now() and (drvl.end_tms is null or drvl.end_tms &gt; now())
and trim(drvl.rtng_set_oid) = (
case  when upper(rtvl.data_src_id) like '%MOODYS%' then 'RTNG000001'
      when upper(rtvl.data_src_id) like '%FITCH%' then 'RTNG000002'
      when upper(rtvl.data_src_id) like '%SNP%' then 'RTNG000003'
end)
)rtvl where rtvl.rank=1
and exists (
select 1 from ft_t_iscl grp, ft_t_iscl sgr, ft_t_iscl sec
where grp.instr_id  = ?
and grp.instr_id = sgr.instr_id and grp.instr_id = sec.instr_id
and grp.INDUS_CL_SET_ID = 'BBINDGRP' and grp.cl_value = 'Sovereign'
and grp.end_tms is null
and sgr.INDUS_CL_SET_ID = 'BBINDSGR' and sgr.cl_value = 'Sovereign'
and sgr.end_tms is null
and sec.INDUS_CL_SET_ID = 'BBINDSEC' and sec.cl_value = 'Government'
and sec.end_tms is null)
and 1 = (case when  (( SELECT '1' FROM FT_T_ISGP ISGP, FT_T_ISGR ISGR where isgp.prnt_iss_grp_oid = isgr.iss_grp_oid and isgp.instr_id = ? and GRP_nme = 'FCY' AND ISGP.START_TMS &lt;= now() AND (ISGP.END_TMS IS NULL OR ISGP.END_TMS &gt; now()) AND ISGR.START_TMS &lt;= now() AND (ISGR.END_TMS IS NULL OR ISGR.END_TMS &gt; now())) = '1' and  rtngname like '%Local Currency%') then 2
          when  (( SELECT '1' FROM FT_T_ISGP ISGP, FT_T_ISGR ISGR where isgp.prnt_iss_grp_oid = isgr.iss_grp_oid and isgp.instr_id = ? and GRP_nme = 'FCY' AND ISGP.START_TMS &lt;= now() AND (ISGP.END_TMS IS NULL OR ISGP.END_TMS &gt; now()) AND ISGR.START_TMS &lt;= now() AND (ISGR.END_TMS IS NULL OR ISGR.END_TMS &gt; now())) is null and  rtngname like '%Foreign Currency%') then 2
          else 1
    end)</objectValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="494" type="java.util.HashSet">
<item id="495" type="com.j2fe.workflow.definition.Transition">
<name id="496">nothing-found</name>
<source id="497">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="498"/>
<directJoin>false</directJoin>
<name id="499">ISSR S, M and F rating</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="500">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="501" type="java.util.HashSet">
<item id="502" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="503">database</name>
<stringValue id="504">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="505" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="506">[0]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="507">indexedParameters[0]</name>
<stringValue id="508">Issuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="509" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="510">indexedParameters[1]</name>
<stringValue id="511">Instument</stringValue>
<type>VARIABLE</type>
</item>
<item id="512" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="513">indexedParameters[2]</name>
<stringValue id="514">Instument</stringValue>
<type>VARIABLE</type>
</item>
<item id="515" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="516">indexedResult</name>
<stringValue id="517">SMFRating</stringValue>
<type>VARIABLE</type>
</item>
<item id="518" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="519">querySQL</name>
<objectValue id="520" type="java.lang.String">select distinct rtvl.rtng_cde, vendor,  to_char(rank_num,'99999') , '3',  rtngname from
(
select 
(select rtng_set_nme from ft_t_rtng where rtng_set_oid = rtvl.rtng_set_oid and start_tms &lt;= now() and (end_tms is null or end_tms &gt; now())) rtngname,
(case  when upper(rtvl.data_src_id) like '%MOODYS%' then 'MOODYS'
      when upper(rtvl.data_src_id) like '%FITCH%' then 'FITCH'
      when upper(rtvl.data_src_id) like '%SNP%' then 'SNP'
end) vendor, drvl.rtng_cde, drvl.rank_num num, drvl.rtng_set_oid, drvl.rtng_value_oid, firt.rtng_cde rating, 
rank() over (partition by (case  when upper(rtvl.data_src_id) like '%MOODYS%' then 'MOODY'
      when upper(rtvl.data_src_id) like '%FITCH%' then 'FITCH'
      when upper(rtvl.data_src_id) like '%SNP%' then 'SNP'
end) order by drvl.rank_num desc) rank, DRVL.rank_num
from ft_t_issr issr, ft_t_firt firt, ft_t_rtvl rtvl, ft_t_rtvl drvl where 1=1
and instr_issr_id = ?
and issr.fins_inst_mnem = firt.inst_mnem
and rtvl.rtng_value_oid = firt.rtng_value_oid 
and firt.rtng_cde = rtvl.rtng_cde
and firt.rtng_set_oid = rtvl.rtng_set_oid
and coalesce(firt.rtng_purp_typ,'x') != 'PSTANDRD'
and drvl.rtng_cde = rtvl.rtng_cde 
--RDD-268 start
and firt.start_tms &lt;= now() and (firt.end_tms is null or firt.end_tms &gt; now())
and firt.rtng_eff_tms &lt;= now() and (firt.sys_eff_end_tms is null or firt.sys_eff_end_tms &gt; now())
--RDD-268 end
and rtvl.start_tms &lt;= now() and (rtvl.end_tms is null or rtvl.end_tms &gt; now())
and drvl.start_tms &lt;= now() and (drvl.end_tms is null or drvl.end_tms &gt; now())
and trim(drvl.rtng_set_oid) = (
case  when upper(rtvl.data_src_id) like '%MOODYS%' then 'RTNG000001'
      when upper(rtvl.data_src_id) like '%FITCH%' then 'RTNG000002'
      when upper(rtvl.data_src_id) like '%SNP%' then 'RTNG000003'
end)
)rtvl where rtvl.rank=1
and 1 = (case when  (( SELECT '1' FROM FT_T_ISGP ISGP, FT_T_ISGR ISGR where isgp.prnt_iss_grp_oid = isgr.iss_grp_oid and isgp.instr_id = ? and GRP_nme = 'FCY' AND ISGP.START_TMS &lt;= now() AND (ISGP.END_TMS IS NULL OR ISGP.END_TMS &gt; now()) AND ISGR.START_TMS &lt;= now() AND (ISGR.END_TMS IS NULL OR ISGR.END_TMS &gt; now())) = '1' and  rtngname like '%LCcy%') then 2
          when  (( SELECT '1' FROM FT_T_ISGP ISGP, FT_T_ISGR ISGR where isgp.prnt_iss_grp_oid = isgr.iss_grp_oid and isgp.instr_id = ? and GRP_nme = 'FCY' AND ISGP.START_TMS &lt;= now() AND (ISGP.END_TMS IS NULL OR ISGP.END_TMS &gt; now()) AND ISGR.START_TMS &lt;= now() AND (ISGR.END_TMS IS NULL OR ISGR.END_TMS &gt; now())) is null and  rtngname like '%FCcy%') then 2
          else 1
    end)</objectValue>
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
<name id="530">2</name>
<source id="531">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="532"/>
<directJoin>false</directJoin>
<name id="533">Check what exists</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="534">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="535" type="java.util.HashSet">
<item id="536" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="537">statements</name>
<stringValue id="538">String subordinated = "NULL";&#13;
String secured = "NULL";&#13;
String guarantor = "NULL";&#13;
String creditlinked = "NULL";&#13;
String uniqu = "NULL";&#13;
String fcy = "NULL";&#13;
&#13;
if(null != Seniority[0][2]){&#13;
	creditlinked = Seniority[0][2];&#13;
}&#13;
&#13;
if(null != Seniority[0][4]){&#13;
	uniqu = Seniority[0][4];&#13;
}&#13;
&#13;
if(null != Seniority[0][5]){&#13;
	fcy = Seniority[0][5];&#13;
}&#13;
&#13;
if (null != Seniority[0][0] &amp;&amp; null == Seniority[0][3] &amp;&amp; null == Seniority[0][1]){&#13;
	subordinated = Seniority[0][0];&#13;
	return 1;&#13;
} else if (null == Seniority[0][0] &amp;&amp; null != Seniority[0][3] &amp;&amp; null == Seniority[0][1]){&#13;
	secured = Seniority[0][3];	&#13;
	return 1;&#13;
} else if (null == Seniority[0][0] &amp;&amp; null == Seniority[0][3] &amp;&amp; null != Seniority[0][1]){&#13;
	guarantor = Seniority[0][1];&#13;
	return 1;&#13;
} else {&#13;
	return 2;&#13;
}</stringValue>
<type>CONSTANT</type>
</item>
<item id="539" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="540">["Seniority"]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="541">variables["Seniority"]</name>
<stringValue id="542">SeniorityInfo</stringValue>
<type>VARIABLE</type>
</item>
<item id="543" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="544">["creditlinked"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="545">variables["creditlinked"]</name>
<stringValue id="546">creditlinked</stringValue>
<type>VARIABLE</type>
</item>
<item id="547" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="548">["fcy"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="549">variables["fcy"]</name>
<stringValue id="550">fcy</stringValue>
<type>VARIABLE</type>
</item>
<item id="551" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="552">["guarantor"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="553">variables["guarantor"]</name>
<stringValue id="554">guarantor</stringValue>
<type>VARIABLE</type>
</item>
<item id="555" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="556">["secured"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="557">variables["secured"]</name>
<stringValue id="558">secured</stringValue>
<type>VARIABLE</type>
</item>
<item id="559" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="560">["subordinated"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="561">variables["subordinated"]</name>
<stringValue id="562">subordinated</stringValue>
<type>VARIABLE</type>
</item>
<item id="563" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="564">["uniqu"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="565">variables["uniqu"]</name>
<stringValue id="566">uniqu</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="567" type="java.util.HashSet">
<item id="568" type="com.j2fe.workflow.definition.Transition">
<name id="569">rows-found</name>
<source id="570">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="571"/>
<directJoin>false</directJoin>
<name id="572">Check for Seniority</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="573">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="574" type="java.util.HashSet">
<item id="575" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="576">database</name>
<stringValue id="577">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="578" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="579">indexedParameters[0]</name>
<stringValue id="580">Instument</stringValue>
<type>VARIABLE</type>
</item>
<item id="581" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="582">indexedResult</name>
<stringValue id="583">SeniorityInfo</stringValue>
<type>VARIABLE</type>
</item>
<item id="584" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="585">querySQL</name>
<objectValue id="586" type="java.lang.String">select 
(SELECT COLL_TYP FROM FT_T_ISLL WHERE INSTR_ID = ISSU.INSTR_ID AND COLL_TYP = 'Subordinated' 
AND START_TMS &lt;= now() AND (END_TMS IS NULL OR END_TMS &gt; now()) limit 1) AS Subordinated,
(SELECT INST_MNEM FROM FT_T_FINS FINS
WHERE EXISTS(SELECT 1 FROM FT_T_FINR WHERE FINSRL_TYP = 'GUARNTOR' AND INST_MNEM = FINS.INST_MNEM AND START_TMS &lt;= now() AND (END_TMS IS NULL OR END_TMS &gt; now()))
AND EXISTS(SELECT 1 FROM FT_T_FRIP WHERE INST_MNEM = FINS.INST_MNEM AND INSTR_ID =  ISSU.INSTR_ID AND START_TMS &lt;= now() AND (END_TMS IS NULL OR END_TMS &gt; now()))
AND START_TMS &lt;= now() AND (END_TMS IS NULL OR END_TMS &gt; now()) limit 1) AS GUARANTOR,
(SELECT RISS.INSTR_ID FROM FT_T_RISS RISS, FT_T_RIDF RIDF WHERE RISS.ISS_PART_RL_TYP = 'UNDLYING' AND RIDF.REL_TYP = 'CreditLinked'
AND RIDF.RLD_ISS_FEAT_ID = RISS.RLD_ISS_FEAT_ID AND RISS.INSTR_ID IS NOT NULL AND RIDF.INSTR_ID = ISSU.INSTR_ID
AND RIDF.START_TMS &lt;= now() AND (RIDF.END_TMS IS NULL OR RIDF.END_TMS &gt; now())
AND RISS.START_TMS &lt;= now() AND (RISS.END_TMS IS NULL OR RISS.END_TMS &gt; now()) limit 1) AS CREDITLINKED,
(SELECT COLL_TYP FROM FT_T_ISLL WHERE INSTR_ID = ISSU.INSTR_ID AND COLL_TYP = 'Secured' 
AND START_TMS &lt;= now() AND (END_TMS IS NULL OR END_TMS &gt; now()) limit 1) AS SECURED,
(SELECT CL_VALUE FROM FT_T_ISCL WHERE INSTR_ID = ISSU.INSTR_ID AND INDUS_CL_SET_ID= 'MIZUNIQE' 
AND START_TMS &lt;= now() AND (END_TMS IS NULL OR END_TMS &gt; now()) limit 1) AS UNIQU,
(SELECT ISGP.PRNT_ISS_GRP_OID FROM FT_T_ISGP ISGP, FT_T_ISGR ISGR
where isgp.prnt_iss_grp_oid = isgr.iss_grp_oid and isgp.instr_id = ISSU.INSTR_ID and GRP_nme = 'FCY'
AND ISGP.START_TMS &lt;= now() AND (ISGP.END_TMS IS NULL OR ISGP.END_TMS &gt; now())
AND ISGR.START_TMS &lt;= now() AND (ISGR.END_TMS IS NULL OR ISGR.END_TMS &gt; now()) limit 1) AS FCY
from ft_t_issu issu where issu.instr_id = ?
AND EXISTS (SELECT 1 FROM FT_T_ISTY ISTY WHERE ISTY.ISS_TYP = ISSU.ISS_TYP AND ISTY.PRNT_ISS_TYP = 'DEBT'
AND ISTY.START_TMS &lt;=now() AND (ISTY.END_TMS IS NULL OR ISTY.END_TMS &gt; now()))
and issu.start_tms &lt;= now() and (issu.end_tms is null or issu.end_tms &gt; now())</objectValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="587" type="java.util.HashSet">
<item id="588" type="com.j2fe.workflow.definition.Transition">
<name id="589">nothing-found</name>
<source id="590">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="591"/>
<directJoin>false</directJoin>
<name id="592">Derived S, M and F rating</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="593">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="594" type="java.util.HashSet">
<item id="595" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="596">database</name>
<stringValue id="597">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="598" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="599">[0]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="600">indexedParameters[0]</name>
<stringValue id="601">Instument</stringValue>
<type>VARIABLE</type>
</item>
<item id="602" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="603">indexedResult</name>
<stringValue id="604">SMFRating</stringValue>
<type>VARIABLE</type>
</item>
<item id="605" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="606">querySQL</name>
<stringValue id="607">select isrt.rtng_cde, 
case 
 when isrt.rtng_set_oid = 'RTNG000003' then 'SNP'
 when isrt.rtng_set_oid = 'RTNG000001' then 'MOODYS'
 when isrt.rtng_set_oid = 'RTNG000002' then 'FITCH'
end vendor,
(select to_char(rtvl.rank_num,'99999') from ft_t_rtvl rtvl
 where rtvl.rtng_cde = isrt.rtng_cde
 and  trim(rtvl.rtng_set_oid) = isrt.rtng_set_oid) num , '2'
from ft_t_isrt isrt where isrt.instr_id = ?
--RDD-268 start
and isrt.start_tms &lt;= now() and (isrt.end_tms is null or isrt.end_tms &gt; now())
and isrt.rtng_eff_tms &lt;= now() and (isrt.sys_eff_end_tms is null or isrt.sys_eff_end_tms &gt; now())
--RDD-268 end
and isrt.rtng_set_oid in (
'RTNG000001',
'RTNG000002',
'RTNG000003')</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="608" type="java.util.HashSet">
<item id="609" type="com.j2fe.workflow.definition.Transition">
<name id="610">nothing-found</name>
<source id="611">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="612"/>
<directJoin>false</directJoin>
<name id="613">S, M and F rating</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="614">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="615" type="java.util.HashSet">
<item id="616" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="617">database</name>
<stringValue id="618">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="619" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="620">[0]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="621">indexedParameters[0]</name>
<stringValue id="622">Instument</stringValue>
<type>VARIABLE</type>
</item>
<item id="623" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="624">indexedResult</name>
<stringValue id="625">SMFRating</stringValue>
<type>VARIABLE</type>
</item>
<item id="626" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="627">querySQL</name>
<objectValue id="628" type="java.lang.String">select distinct rtng_cde, vendor, to_char(rank_num,'99999') , '1' from (&#13;
select isrt.rtng_cde, &#13;
case  &#13;
 when upper(drtvl.data_src_id) like '%SNP%' then 'SNP'&#13;
 when upper(drtvl.data_src_id) like '%MOODYS%' then 'MOODYS'&#13;
 when upper(drtvl.data_src_id) like '%FITCH%' then 'FITCH'&#13;
end vendor,&#13;
rtvl.rank_num ,&#13;
rank() over (partition by (&#13;
  case  &#13;
    when upper(drtvl.data_src_id) like '%SNP%' then '%SNP%'&#13;
    when upper(drtvl.data_src_id) like '%MOODYS%' then '%MOODYS%'&#13;
    when upper(drtvl.data_src_id) like '%FITCH%' then '%FITCH%'&#13;
  end) order by rtvl.rank_num desc) rank&#13;
from ft_t_isrt isrt, ft_t_rtvl rtvl, ft_t_rtvl drtvl&#13;
where isrt.instr_id = ?&#13;
and  rtvl.rtng_cde = isrt.rtng_cde&#13;
and  drtvl.rtng_cde = isrt.rtng_cde&#13;
and trim (drtvl.rtng_value_oid) = trim (isrt.rtng_value_oid)&#13;
and coalesce(isrt.rtng_purp_typ,'x') != 'PSTANDRD'&#13;
--RDD-268 start&#13;
and isrt.start_tms &lt;= now() and (isrt.end_tms is null or isrt.end_tms &gt; now())&#13;
and isrt.rtng_eff_tms &lt;= now() and (isrt.sys_eff_end_tms is null or isrt.sys_eff_end_tms &gt; now())&#13;
--RDD-268 end&#13;
and rtvl.start_tms &lt;= now() and (rtvl.end_tms is null or rtvl.end_tms &gt; now())&#13;
and drtvl.start_tms &lt;= now() and (drtvl.end_tms is null or drtvl.end_tms &gt; now())&#13;
and  trim(rtvl.rtng_set_oid) = (&#13;
case  &#13;
 when upper(drtvl.data_src_id) like '%MOODYS%' then 'RTNG000001'&#13;
 when upper(drtvl.data_src_id) like '%FITCH%' then 'RTNG000002'&#13;
 when upper(drtvl.data_src_id) like '%SNP%' then 'RTNG000003'&#13;
end)&#13;
) subquery where rank =1</objectValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="629" type="java.util.HashSet">
<item id="630" type="com.j2fe.workflow.definition.Transition">
<name id="631">loop</name>
<source idref="10"/>
<target idref="611"/>
</item>
</sources>
<targets id="632" type="java.util.HashSet">
<item idref="609" type="com.j2fe.workflow.definition.Transition"/>
<item id="633" type="com.j2fe.workflow.definition.Transition">
<name id="634">rows-found</name>
<source idref="611"/>
<target id="635">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="636"/>
<directJoin>false</directJoin>
<name id="637">Get Code and number</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="638">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="639" type="java.util.HashSet">
<item id="640" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="641">statements</name>
<objectValue id="642" type="java.lang.String">String[] moody = new String[3];
String[] snp = new String[3];
String[] fitch = new String[3];
String dValue = SMFRating[0][3];

for(int i=0; i&lt; SMFRating.length; i++){

	if("SNP".equalsIgnoreCase(SMFRating[i][1])){
		snp[0] = SMFRating[i][0];
		snp[1] = SMFRating[i][1];
		snp[2] = SMFRating[i][2];
	} else if("MOODYS".equalsIgnoreCase(SMFRating[i][1])){
		moody[0] = SMFRating[i][0];
		moody[1] = SMFRating[i][1];
		moody[2] = SMFRating[i][2];
	} else if("FITCH".equalsIgnoreCase(SMFRating[i][1])){
		fitch[0] = SMFRating[i][0];
		fitch[1] = SMFRating[i][1];
		fitch[2] = SMFRating[i][2];
	}
}	

String dataProvidor="";
String code="";
String rnumber="";
String dataSrc="";
if(null != snp[2] &amp;&amp; null != moody[2] &amp;&amp; null != fitch[2]
   &amp;&amp; !snp[2].equalsIgnoreCase(moody[2])
   &amp;&amp; !moody[2].equalsIgnoreCase(fitch[2])
   &amp;&amp; !fitch[2].equalsIgnoreCase(snp[2])){ // when all present all diffrent 7
	
	int isnp = Integer.parseInt(snp[2].trim());
	int imoody = Integer.parseInt(moody[2].trim());
	int ifitch = Integer.parseInt(fitch[2].trim());
	if (isnp &lt; imoody &amp;&amp; ifitch &gt; imoody || ifitch &lt; imoody &amp;&amp; isnp &gt; imoody){ 
		code=moody[0];
		rnumber = moody[2];
		if("1".equalsIgnoreCase(dValue)){
			dataProvidor = "M1";
		} else if("2".equalsIgnoreCase(dValue)){
			dataProvidor = "M2";
		} else{
			dataProvidor = "M3";
		}
		dataSrc="MOODY";
	}
	if (ifitch &lt; isnp &amp;&amp; imoody &gt; isnp || imoody &lt; isnp &amp;&amp; ifitch &gt; isnp){ 
		code=snp[0];
		rnumber = snp[2];
		if("1".equalsIgnoreCase(dValue)){
			dataProvidor = "S1";
		} else if("2".equalsIgnoreCase(dValue)){
			dataProvidor = "S2";
		} else{
			dataProvidor = "S3";
		}
		dataSrc="SAP";
	}
	if (imoody &lt; ifitch &amp;&amp; isnp &gt; ifitch || isnp &lt; ifitch &amp;&amp; imoody &gt; ifitch){ 
		code=fitch[0];
		rnumber = fitch[2];
		if("1".equalsIgnoreCase(dValue)){
			dataProvidor = "F1";
		} else if("2".equalsIgnoreCase(dValue)){
			dataProvidor = "F2";
		} else{
			dataProvidor = "F3";
		}
		dataSrc="FITCH";
	}			
} else if(null != snp[2] &amp;&amp; null != moody[2] &amp;&amp; null == fitch[2]
          &amp;&amp; !snp[2].equalsIgnoreCase(moody[2])){ // when snp and moody all diffrent 4
	int isnp = Integer.parseInt(snp[2].trim());
	int imoody = Integer.parseInt(moody[2].trim());
	if (isnp &lt; imoody){ 
		code=moody[0];
		rnumber = moody[2];
		if("1".equalsIgnoreCase(dValue)){
			dataProvidor = "M1";
		} else if("2".equalsIgnoreCase(dValue)){
			dataProvidor = "M2";
		} else{
			dataProvidor = "M3";
		}
		dataSrc="MOODY";
	} else{
		code=snp[0];
		rnumber = snp[2];
		if("1".equalsIgnoreCase(dValue)){
			dataProvidor = "S1";
		} else if("2".equalsIgnoreCase(dValue)){
			dataProvidor = "S2";
		} else{
			dataProvidor = "S3";
		}
		dataSrc="SAP";
	}
		
} else if(null != snp[2] &amp;&amp; null == moody[2] &amp;&amp; null != fitch[2]
          &amp;&amp; !snp[2].equalsIgnoreCase(fitch[2])){ // when snp and fitch all diffrent 6
	int isnp = Integer.parseInt(snp[2].trim());
	int ifitch = Integer.parseInt(fitch[2].trim());
	if (isnp &lt; ifitch){ 
		code= fitch[0];
		rnumber = fitch[2];
		if("1".equalsIgnoreCase(dValue)){
			dataProvidor = "F1";
		} else if("2".equalsIgnoreCase(dValue)){
			dataProvidor = "F2";
		} else{
			dataProvidor = "F3";
		}
		dataSrc="FITCH";
	} else{
		code=snp[0];
		rnumber = snp[2];
		if("1".equalsIgnoreCase(dValue)){
			dataProvidor = "S1";
		} else if("2".equalsIgnoreCase(dValue)){
			dataProvidor = "S2";
		} else{
			dataProvidor = "S3";
		}
		dataSrc="SAP";
	}
			
} else if(null == snp[2] &amp;&amp; null != moody[2] &amp;&amp; null != fitch[2]
          &amp;&amp; !moody[2].equalsIgnoreCase(fitch[2])){ // when moody and fitch all diffrent 5

	int imoody = Integer.parseInt(moody[2].trim());
	int ifitch = Integer.parseInt(fitch[2].trim());
	if (imoody &lt; ifitch){ 
		code= fitch[0];
		rnumber = fitch[2];
		if("1".equalsIgnoreCase(dValue)){
			dataProvidor = "F1";
		} else if("2".equalsIgnoreCase(dValue)){
			dataProvidor = "F2";
		} else{
			dataProvidor = "F3";
		}
		dataSrc="FITCH";
	} else{
		code=moody[0];
		rnumber = moody[2];
		if("1".equalsIgnoreCase(dValue)){
			dataProvidor = "M1";
		} else if("2".equalsIgnoreCase(dValue)){
			dataProvidor = "M2";
		} else{
			dataProvidor = "M3";
		}
		dataSrc="MOODY";
	}
	
} else if((null != snp[2] &amp;&amp; null == moody[2] &amp;&amp; null == fitch[2]) // when snp only 1
			|| (null!= snp[2] &amp;&amp; null != moody[2] &amp;&amp; null == fitch[2] &amp;&amp; snp[2].equalsIgnoreCase(moody[2])) // when snp &amp; moody all same 8
			|| (null!= snp[2] &amp;&amp; null == moody[2] &amp;&amp; null != fitch[2] &amp;&amp; snp[2].equalsIgnoreCase(fitch[2])) // when snp and fitch all same 10
			|| (null!= snp[2] &amp;&amp; null != moody[2] &amp;&amp; null != fitch[2] &amp;&amp; snp[2].equalsIgnoreCase(moody[2]) &amp;&amp; snp[2].equalsIgnoreCase(fitch[2]))// when all present all same 14
			|| (null!= snp[2] &amp;&amp; null != moody[2] &amp;&amp; null != fitch[2] &amp;&amp; !snp[2].equalsIgnoreCase(moody[2]) &amp;&amp; snp[2].equalsIgnoreCase(fitch[2])) // when all present snp and fitch same 13
			|| (null!= snp[2] &amp;&amp; null != moody[2] &amp;&amp; null != fitch[2] &amp;&amp; snp[2].equalsIgnoreCase(moody[2]) &amp;&amp; !snp[2].equalsIgnoreCase(fitch[2]))){ // when all present snp and moody same  11
	code=snp[0];
	rnumber = snp[2];
	if("1".equalsIgnoreCase(dValue)){
		dataProvidor = "S1";
	} else if("2".equalsIgnoreCase(dValue)){
		dataProvidor = "S2";
	} else{
		dataProvidor = "S3";
	}
	dataSrc="SAP";
} else if ((null == snp[2] &amp;&amp; null != moody[2] &amp;&amp; null == fitch[2]) // when moody only 2
			|| (null != snp[2] &amp;&amp; null != moody[2] &amp;&amp; null != fitch[2] &amp;&amp; !snp[2].equalsIgnoreCase(moody[2]) &amp;&amp; moody[2].equalsIgnoreCase(fitch[2])) // when all available moody and fitch are same 12  
			|| (null == snp[2] &amp;&amp; null != fitch[2] &amp;&amp; null != moody[2] &amp;&amp; fitch[2].equalsIgnoreCase(moody[2]))){ // when moody and fitch all same  9

	code=moody[0];
	rnumber = moody[2];
	if("1".equalsIgnoreCase(dValue)){
		dataProvidor = "M1";
	} else if("2".equalsIgnoreCase(dValue)){
		dataProvidor = "M2";
	} else{
		dataProvidor = "M3";
	}
	dataSrc="MOODY";
} else{ // when fitch only 3

	code=fitch[0];
	rnumber = fitch[2];
	if("1".equalsIgnoreCase(dValue)){
		dataProvidor = "F1";
	} else if("2".equalsIgnoreCase(dValue)){
		dataProvidor = "F2";
	} else{
		dataProvidor = "F3";
	}
	dataSrc="FITCH";
}
</objectValue>
<type>CONSTANT</type>
</item>
<item id="643" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="644">["SMFRating"]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="645">variables["SMFRating"]</name>
<stringValue id="646">SMFRating</stringValue>
<type>VARIABLE</type>
</item>
<item id="647" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="648">["code"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="649">variables["code"]</name>
<stringValue id="650">ratignCode</stringValue>
<type>VARIABLE</type>
</item>
<item id="651" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="652">["dataProvidor"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="653">variables["dataProvidor"]</name>
<stringValue id="654">dataProvidor</stringValue>
<type>VARIABLE</type>
</item>
<item id="655" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="656">variables["dataSrc"]</name>
<stringValue id="657">dataSrc</stringValue>
<type>VARIABLE</type>
</item>
<item id="658" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="659">["rnumber"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="660">variables["rnumber"]</name>
<stringValue id="661">ratignNumber</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<persistentVariables id="662" type="java.util.HashSet">
<item id="663" type="java.lang.String">dataSrc
1000</item>
</persistentVariables>
<sources id="664" type="java.util.HashSet">
<item id="665" type="com.j2fe.workflow.definition.Transition">
<name id="666">rows-found</name>
<source id="667">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="668"/>
<directJoin>false</directJoin>
<name id="669">Another instrument Derived S, M and F rating</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="670">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="671" type="java.util.HashSet">
<item id="672" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="673">database</name>
<stringValue id="674">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="675" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="676">[0]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="677">indexedParameters[0]</name>
<stringValue id="678">Issuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="679" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="680">indexedParameters[1]</name>
<stringValue id="681">subordinated</stringValue>
<type>VARIABLE</type>
</item>
<item id="682" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="683">indexedParameters[2]</name>
<stringValue id="684">guarantor</stringValue>
<type>VARIABLE</type>
</item>
<item id="685" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="686">indexedParameters[3]</name>
<stringValue id="687">creditlinked</stringValue>
<type>VARIABLE</type>
</item>
<item id="688" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="689">indexedParameters[4]</name>
<stringValue id="690">secured</stringValue>
<type>VARIABLE</type>
</item>
<item id="691" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="692">indexedParameters[5]</name>
<stringValue id="693">uniqu</stringValue>
<type>VARIABLE</type>
</item>
<item id="694" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="695">indexedParameters[6]</name>
<stringValue id="696">fcy</stringValue>
<type>VARIABLE</type>
</item>
<item id="697" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="698">indexedResult</name>
<stringValue id="699">SMFRating</stringValue>
<type>VARIABLE</type>
</item>
<item id="700" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="701">querySQL</name>
<objectValue id="702" type="java.lang.String">select isrt.rtng_cde, 
case 
 when isrt.rtng_set_oid = 'RTNG000003' then 'SNP'
 when isrt.rtng_set_oid = 'RTNG000001' then 'MOODYS'
 when isrt.rtng_set_oid = 'RTNG000002' then 'FITCH'
end vendor,
(select to_char(rtvl.rank_num, '99999') from ft_t_rtvl rtvl
 where rtvl.rtng_cde = isrt.rtng_cde
 and  trim(rtvl.rtng_set_oid) = isrt.rtng_set_oid
and rtvl.start_tms &lt;= now() and (rtvl.end_tms is null or rtvl.end_tms &gt; now())) num , '2'
from ft_t_isrt isrt where 
--RDD-268 start
--isrt.start_tms &lt;= now() and (isrt.end_tms is null or isrt.end_tms &gt; now())
isrt.rtng_eff_tms &lt;= now() and (isrt.sys_eff_end_tms is null or isrt.sys_eff_end_tms &gt; now())
--RDD-268 end
and coalesce(isrt.rtng_purp_typ,'x') != 'PSTANDRD'
and isrt.rtng_set_oid in (
'RTNG000001',
'RTNG000002',
'RTNG000003')
and isrt.instr_id =(
select instr_id from (
select issu.instr_id,
coalesce((SELECT COLL_TYP FROM FT_T_ISLL WHERE INSTR_ID = ISSU.INSTR_ID AND COLL_TYP = 'Subordinated' 
AND START_TMS &lt;= now() AND (END_TMS IS NULL OR END_TMS &gt; now()) limit 1),'NULL') AS Subordinated,
coalesce((SELECT INST_MNEM FROM FT_T_FINS FINS
WHERE EXISTS(SELECT 1 FROM FT_T_FINR WHERE FINSRL_TYP = 'GUARNTOR' AND INST_MNEM = FINS.INST_MNEM AND START_TMS &lt;= now() AND (END_TMS IS NULL OR END_TMS &gt; now()))
AND EXISTS(SELECT 1 FROM FT_T_FRIP WHERE INST_MNEM = FINS.INST_MNEM AND INSTR_ID =  ISSU.INSTR_ID AND START_TMS &lt;= now() AND (END_TMS IS NULL OR END_TMS &gt; now()))
AND START_TMS &lt;= now() AND (END_TMS IS NULL OR END_TMS &gt; now()) limit 1),'NULL') AS GUARANTOR,
coalesce((SELECT RISS.INSTR_ID FROM FT_T_RISS RISS, FT_T_RIDF RIDF WHERE RISS.ISS_PART_RL_TYP = 'UNDLYING' AND RIDF.REL_TYP = 'CreditLinked'
AND RIDF.RLD_ISS_FEAT_ID = RISS.RLD_ISS_FEAT_ID AND RISS.INSTR_ID IS NOT NULL AND RIDF.INSTR_ID = ISSU.INSTR_ID
AND RIDF.START_TMS &lt;= now() AND (RIDF.END_TMS IS NULL OR RIDF.END_TMS &gt; now())
AND RISS.START_TMS &lt;= now() AND (RISS.END_TMS IS NULL OR RISS.END_TMS &gt; now()) limit 1),'NULL') AS CREDITLINKED,
coalesce((SELECT COLL_TYP FROM FT_T_ISLL WHERE INSTR_ID = ISSU.INSTR_ID AND COLL_TYP = 'Secured' 
AND START_TMS &lt;= now() AND (END_TMS IS NULL OR END_TMS &gt; now()) limit 1),'NULL') AS SECURED,
coalesce((SELECT CL_VALUE FROM FT_T_ISCL WHERE INSTR_ID = ISSU.INSTR_ID AND INDUS_CL_SET_ID= 'MIZUNIQE' 
AND START_TMS &lt;= now() AND (END_TMS IS NULL OR END_TMS &gt; now()) limit 1),'NULL') AS UNIQU,
coalesce((SELECT ISGP.PRNT_ISS_GRP_OID FROM FT_T_ISGP ISGP, FT_T_ISGR ISGR
where isgp.prnt_iss_grp_oid = isgr.iss_grp_oid and isgp.instr_id = ISSU.INSTR_ID and GRP_nme = 'FCY'
AND ISGP.START_TMS &lt;= now() AND (ISGP.END_TMS IS NULL OR ISGP.END_TMS &gt; now())
AND ISGR.START_TMS &lt;= now() AND (ISGR.END_TMS IS NULL OR ISGR.END_TMS &gt; now()) limit 1),'NULL') AS FCY
from ft_t_issu issu where issu.instr_issr_id = ?
AND EXISTS (SELECT 1 FROM FT_T_ISTY ISTY WHERE ISTY.ISS_TYP = ISSU.ISS_TYP AND ISTY.PRNT_ISS_TYP = 'DEBT'
AND ISTY.START_TMS &lt;=now() AND (ISTY.END_TMS IS NULL OR ISTY.END_TMS &gt; now()))
and issu.start_tms &lt;= now() and (issu.end_tms is null or issu.end_tms &gt; now())
and not exists (SELECT COLL_TYP FROM FT_T_ISLL WHERE INSTR_ID = ISSU.INSTR_ID AND COLL_TYP = 'Subordinated' 
AND START_TMS &lt;= now() AND (END_TMS IS NULL OR END_TMS &gt; now()))
) sq1 where 1=1
and subordinated = ?
and guarantor = ?
and creditlinked = ?
and secured = ?
and UNIQU= ?
and fcy=? limit 1)</objectValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="703" type="java.util.HashSet">
<item id="704" type="com.j2fe.workflow.definition.Transition">
<name id="705">1</name>
<source idref="531"/>
<target idref="667"/>
</item>
</sources>
<targets id="706" type="java.util.HashSet">
<item id="707" type="com.j2fe.workflow.definition.Transition">
<name id="708">nothing-found</name>
<source idref="667"/>
<target idref="524"/>
</item>
<item idref="665" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="635"/>
</item>
<item id="709" type="com.j2fe.workflow.definition.Transition">
<name id="710">rows-found</name>
<source idref="590"/>
<target idref="635"/>
</item>
<item id="711" type="com.j2fe.workflow.definition.Transition">
<name id="712">rows-found</name>
<source idref="497"/>
<target idref="635"/>
</item>
<item idref="633" type="com.j2fe.workflow.definition.Transition"/>
<item id="713" type="com.j2fe.workflow.definition.Transition">
<name id="714">rows-found</name>
<source idref="467"/>
<target idref="635"/>
</item>
</sources>
<targets id="715" type="java.util.HashSet">
<item id="716" type="com.j2fe.workflow.definition.Transition">
<name id="717">goto-next</name>
<source idref="635"/>
<target id="718">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="719"/>
<directJoin>false</directJoin>
<name id="720">insert Basel II Rating</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="721">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="722" type="java.util.HashSet">
<item id="723" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="724">database</name>
<stringValue id="725">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="726" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="727">indexedParameters[0]</name>
<stringValue id="728">Instument</stringValue>
<type>VARIABLE</type>
</item>
<item id="729" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="730">indexedParameters[1]</name>
<stringValue id="731">dataProvidor</stringValue>
<type>VARIABLE</type>
</item>
<item id="732" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="733">indexedParameters[2]</name>
<stringValue id="734">dataSrc</stringValue>
<type>VARIABLE</type>
</item>
<item id="735" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="736">indexedParameters[3]</name>
<stringValue id="737">ratignCode</stringValue>
<type>VARIABLE</type>
</item>
<item id="738" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="739">indexedParameters[4]</name>
<stringValue id="740">Instument</stringValue>
<type>VARIABLE</type>
</item>
<item id="741" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="742">querySQL</name>
<stringValue id="743">--RDD-268 start
--insert into ft_t_isrt (ISS_RTNG_OID, INSTR_ID, START_TMS, LAST_CHG_USR_ID, LAST_CHG_TMS, RTNG_CDE, RTNG_VALUE_OID, RTNG_SET_OID, orig_data_prov_id, data_stat_typ, rtng_eff_tms)
insert into ft_t_isrt (ISS_RTNG_OID, INSTR_ID, START_TMS, LAST_CHG_USR_ID, LAST_CHG_TMS, RTNG_CDE, RTNG_SYMBOL_TXT, RTNG_VALUE_OID, RTNG_SET_OID, orig_data_prov_id, data_stat_typ, rtng_eff_tms, data_src_id)
--RDD-268 end
select new_oid(), ?, now(), 'DeriveBaselIIAssetRating', now(), rtng_cde, rtng_cde, rtng_value_oid, rtng_set_oid, ?, 'ACTIVE', (date_trunc('day', now())::timestamp), ? from ft_t_rtvl
where rtng_set_oid = 'RTNG000009'
and rtng_cde = ?
--RDD-268 start
--and not exists (select 1 from ft_t_isrt where rtng_set_oid = 'RTNG000009' and instr_id = ? and start_tms &lt;= now() and (end_tms is null or end_tms &gt; now()))
and not exists (select 1 from ft_t_isrt where rtng_set_oid = 'RTNG000009' and instr_id = ? and rtng_eff_tms &lt;= now() and (sys_eff_end_tms is null or sys_eff_end_tms &gt; now()))
--RDD-268 end</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="744" type="java.util.HashSet">
<item id="745" type="com.j2fe.workflow.definition.Transition">
<name id="746">goto-next</name>
<source id="747">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="748"/>
<directJoin>false</directJoin>
<name id="749">Delete JIG</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="750">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="751" type="java.util.HashSet">
<item id="752" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="753">database</name>
<stringValue id="754">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="755" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="756">indexedParameters[0]</name>
<stringValue id="757">Instument</stringValue>
<type>VARIABLE</type>
</item>
<item id="758" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="759">querySQL</name>
<stringValue id="760">update ft_t_isgp set end_tms =  ((date_trunc('day', now())::timestamp)- interval '1 second'), last_chg_tms = now(), last_chg_usr_id = 'DeriveBaselIIAssetRating'
where instr_id = ? and prnt_iss_grp_oid = 'ISGR000012' and prt_purp_typ = 'JAPINGRD' and start_tms &lt;= now() and (end_tms is null or end_tms &gt; now())  </stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="761" type="java.util.HashSet">
<item id="762" type="com.j2fe.workflow.definition.Transition">
<name id="763">2</name>
<source id="764">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="765"/>
<directJoin>false</directJoin>
<name id="766">Bean Shell Script (Xor Split)</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="767">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="768" type="java.util.HashSet">
<item id="769" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="770">statements</name>
<objectValue id="771" type="java.lang.String">String[] jcr = new String[3];
String[] rni = new String[3];
String dValue = JRRating[0][3];
		
for(int i=0; i&lt;JRRating.length; i++){
	 if("JCR".equalsIgnoreCase(JRRating[i][1])){
		jcr[0] = JRRating[i][0];
		jcr[1] = JRRating[i][1];
		jcr[2] = JRRating[i][2];
	} else if("RNI".equalsIgnoreCase(JRRating[i][1])){
		rni[0] = JRRating[i][0];
		rni[1] = JRRating[i][1];
		rni[2] = JRRating[i][2];
	}
}		

String vendor="";
String code="";
String rnumber="";
String dataSrc="";
String dataProvidor="";

if(null != jcr[2] &amp;&amp; null != rni[2]
          ){ // when jcr and rni 
	if (jcr[2].trim().equalsIgnoreCase(rni[2].trim())){ // when JCR = RNI

		code=jcr[0];
		vendor = jcr[1];
		rnumber = jcr[2].trim();
		if("1".equalsIgnoreCase(dValue)){
			dataProvidor = "J1";
		} else if("2".equalsIgnoreCase(dValue)){
			dataProvidor = "J2";
		} else{
			dataProvidor = "J3";
		}
		dataSrc="JCR";
	}else { // when JCR != RNI
		int ijcr = Integer.parseInt(jcr[2].trim());
		int irni = Integer.parseInt(rni[2].trim());
		if (ijcr &lt; irni){ 

			vendor = rni[1];
			code= rni[0];
			rnumber = rni[2].trim();
			if("1".equalsIgnoreCase(dValue)){
				dataProvidor = "R1";
			} else if("2".equalsIgnoreCase(dValue)){
				dataProvidor = "R2";
			} else{
				dataProvidor = "R3";
			}
			dataSrc="RNI";
		} else{

			code=jcr[0];
			vendor = jcr[1];
			rnumber = jcr[2].trim();
			if("1".equalsIgnoreCase(dValue)){
				dataProvidor = "J1";
			} else if("2".equalsIgnoreCase(dValue)){
				dataProvidor = "J2";
			} else{
				dataProvidor = "J3";
			}
			dataSrc="JCR";
		}
	}
			
} else if(null != jcr[2] &amp;&amp; null == rni[2]){

	code=jcr[0];
	vendor = jcr[1];
	rnumber = jcr[2].trim();
	if("1".equalsIgnoreCase(dValue)){
		dataProvidor = "J1";
	} else if("2".equalsIgnoreCase(dValue)){
		dataProvidor = "J2";
	} else{
		dataProvidor = "J3";
	}
	dataSrc="JCR";
} else{

	vendor = rni[1];
	code= rni[0];
	rnumber = rni[2].trim();
	if("1".equalsIgnoreCase(dValue)){
		dataProvidor = "R1";
	} else if("2".equalsIgnoreCase(dValue)){
		dataProvidor = "R2";
	} else{
		dataProvidor = "R3";
	}
	dataSrc="RNI";
}

int numcode =  Integer.parseInt(rnumber.trim());

if(numcode&gt;100)
	return 2;
else 
	return 1;
</objectValue>
<type>CONSTANT</type>
</item>
<item id="772" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="773">variables["JRRating"]</name>
<stringValue id="774">JRRating</stringValue>
<type>VARIABLE</type>
</item>
<item id="775" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="776">["code"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="777">variables["code"]</name>
<stringValue id="778">ratignCode</stringValue>
<type>VARIABLE</type>
</item>
<item id="779" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="780">["dataProvidor"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="781">variables["dataProvidor"]</name>
<stringValue id="782">dataProvidor</stringValue>
<type>VARIABLE</type>
</item>
<item id="783" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="784">variables["dataSrc"]</name>
<stringValue id="785">dataSrc</stringValue>
<type>VARIABLE</type>
</item>
<item id="786" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="787">["rnumber"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="788">variables["rnumber"]</name>
<stringValue id="789">ratignNumber</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="790" type="java.util.HashSet">
<item id="791" type="com.j2fe.workflow.definition.Transition">
<name id="792">ToSplit</name>
<source id="793">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="794">Automatically generated</description>
<directJoin>false</directJoin>
<name id="795">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="796">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="797" type="java.util.HashSet">
<item id="798" type="com.j2fe.workflow.definition.Transition">
<name id="799">rows-found</name>
<source id="800">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="801"/>
<directJoin>false</directJoin>
<name id="802">Another instrument Derived JCR rating</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="803">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="804" type="java.util.HashSet">
<item id="805" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="806">database</name>
<stringValue id="807">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="808" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="809">[0]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="810">indexedParameters[0]</name>
<stringValue id="811">Issuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="812" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="813">indexedParameters[1]</name>
<stringValue id="814">subordinated</stringValue>
<type>VARIABLE</type>
</item>
<item id="815" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="816">indexedParameters[2]</name>
<stringValue id="817">guarantor</stringValue>
<type>VARIABLE</type>
</item>
<item id="818" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="819">indexedParameters[3]</name>
<stringValue id="820">creditlinked</stringValue>
<type>VARIABLE</type>
</item>
<item id="821" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="822">indexedParameters[4]</name>
<stringValue id="823">secured</stringValue>
<type>VARIABLE</type>
</item>
<item id="824" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="825">indexedParameters[5]</name>
<stringValue id="826">uniqu</stringValue>
<type>VARIABLE</type>
</item>
<item id="827" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="828">indexedParameters[6]</name>
<stringValue id="829">fcy</stringValue>
<type>VARIABLE</type>
</item>
<item id="830" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="831">indexedResult</name>
<stringValue id="832">JRRating</stringValue>
<type>VARIABLE</type>
</item>
<item id="833" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="834">querySQL</name>
<objectValue id="835" type="java.lang.String">select isrt.rtng_cde, 
'JCR' vendor,
(select to_char(rtvl.rank_num, '99999') from ft_t_rtvl rtvl
 where rtvl.rtng_cde = isrt.rtng_cde
 and  trim(rtvl.rtng_set_oid) = isrt.rtng_set_oid
and rtvl.start_tms &lt;= now() and (rtvl.end_tms is null or rtvl.end_tms &gt; now())) num , '2'
from ft_t_isrt isrt where 
isrt.start_tms &lt;= now() and (isrt.end_tms is null or isrt.end_tms &gt; now())
and coalesce(isrt.rtng_purp_typ,'x') != 'PSTANDRD'
and isrt.rtng_set_oid ='RTNG000004'
and isrt.instr_id =(
select instr_id from (
select issu.instr_id,
coalesce((SELECT COLL_TYP FROM FT_T_ISLL WHERE INSTR_ID = ISSU.INSTR_ID AND COLL_TYP = 'Subordinated' 
AND START_TMS &lt;= now() AND (END_TMS IS NULL OR END_TMS &gt; now()) limit 1),'NULL') AS Subordinated,
coalesce((SELECT INST_MNEM FROM FT_T_FINS FINS
WHERE EXISTS(SELECT 1 FROM FT_T_FINR WHERE FINSRL_TYP = 'GUARNTOR' AND INST_MNEM = FINS.INST_MNEM AND START_TMS &lt;= now() AND (END_TMS IS NULL OR END_TMS &gt; now()))
AND EXISTS(SELECT 1 FROM FT_T_FRIP WHERE INST_MNEM = FINS.INST_MNEM AND INSTR_ID =  ISSU.INSTR_ID AND START_TMS &lt;= now() AND (END_TMS IS NULL OR END_TMS &gt; now()))
AND START_TMS &lt;= now() AND (END_TMS IS NULL OR END_TMS &gt; now()) limit 1),'NULL') AS GUARANTOR,
coalesce((SELECT RISS.INSTR_ID FROM FT_T_RISS RISS, FT_T_RIDF RIDF WHERE RISS.ISS_PART_RL_TYP = 'UNDLYING' AND RIDF.REL_TYP = 'CreditLinked'
AND RIDF.RLD_ISS_FEAT_ID = RISS.RLD_ISS_FEAT_ID AND RISS.INSTR_ID IS NOT NULL AND RIDF.INSTR_ID = ISSU.INSTR_ID
AND RIDF.START_TMS &lt;= now() AND (RIDF.END_TMS IS NULL OR RIDF.END_TMS &gt; now())
AND RISS.START_TMS &lt;= now() AND (RISS.END_TMS IS NULL OR RISS.END_TMS &gt; now()) limit 1),'NULL') AS CREDITLINKED,
coalesce((SELECT COLL_TYP FROM FT_T_ISLL WHERE INSTR_ID = ISSU.INSTR_ID AND COLL_TYP = 'Secured' 
AND START_TMS &lt;= now() AND (END_TMS IS NULL OR END_TMS &gt; now()) limit 1),'NULL') AS SECURED,
coalesce((SELECT CL_VALUE FROM FT_T_ISCL WHERE INSTR_ID = ISSU.INSTR_ID AND INDUS_CL_SET_ID= 'MIZUNIQE' 
AND START_TMS &lt;= now() AND (END_TMS IS NULL OR END_TMS &gt; now()) limit 1),'NULL') AS UNIQU,
coalesce((SELECT ISGP.PRNT_ISS_GRP_OID FROM FT_T_ISGP ISGP, FT_T_ISGR ISGR
where isgp.prnt_iss_grp_oid = isgr.iss_grp_oid and isgp.instr_id = ISSU.INSTR_ID and GRP_nme = 'FCY'
AND ISGP.START_TMS &lt;= now() AND (ISGP.END_TMS IS NULL OR ISGP.END_TMS &gt; now())
AND ISGR.START_TMS &lt;= now() AND (ISGR.END_TMS IS NULL OR ISGR.END_TMS &gt; now()) limit 1),'NULL') AS FCY
from ft_t_issu issu where issu.instr_issr_id = ?
AND EXISTS (SELECT 1 FROM FT_T_ISTY ISTY WHERE ISTY.ISS_TYP = ISSU.ISS_TYP AND ISTY.PRNT_ISS_TYP = 'DEBT'
AND ISTY.START_TMS &lt;=now() AND (ISTY.END_TMS IS NULL OR ISTY.END_TMS &gt; now()))
and issu.start_tms &lt;= now() and (issu.end_tms is null or issu.end_tms &gt; now())
and not exists (SELECT COLL_TYP FROM FT_T_ISLL WHERE INSTR_ID = ISSU.INSTR_ID AND COLL_TYP = 'Subordinated' 
AND START_TMS &lt;= now() AND (END_TMS IS NULL OR END_TMS &gt; now()))
) sq1 where 1=1
and subordinated = ?
and guarantor = ?
and creditlinked = ?
and secured = ?
and UNIQU= ?
and fcy=? limit 1)</objectValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="836" type="java.util.HashSet">
<item id="837" type="com.j2fe.workflow.definition.Transition">
<name id="838">1</name>
<source idref="366"/>
<target idref="800"/>
</item>
</sources>
<targets id="839" type="java.util.HashSet">
<item id="840" type="com.j2fe.workflow.definition.Transition">
<name id="841">nothing-found</name>
<source idref="800"/>
<target idref="359"/>
</item>
<item idref="798" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="793"/>
</item>
<item id="842" type="com.j2fe.workflow.definition.Transition">
<name id="843">rows-found</name>
<source idref="425"/>
<target idref="793"/>
</item>
<item id="844" type="com.j2fe.workflow.definition.Transition">
<name id="845">rows-found</name>
<source idref="338"/>
<target idref="793"/>
</item>
<item id="846" type="com.j2fe.workflow.definition.Transition">
<name id="847">rows-found</name>
<source idref="446"/>
<target idref="793"/>
</item>
<item id="848" type="com.j2fe.workflow.definition.Transition">
<name id="849">rows-found</name>
<source idref="313"/>
<target idref="793"/>
</item>
</sources>
<targets id="850" type="java.util.HashSet">
<item idref="791" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="764"/>
</item>
</sources>
<targets id="851" type="java.util.HashSet">
<item id="852" type="com.j2fe.workflow.definition.Transition">
<name id="853">1</name>
<source idref="764"/>
<target id="854">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="855"/>
<directJoin>false</directJoin>
<name id="856">Insert JIG</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="857">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="858" type="java.util.HashSet">
<item id="859" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="860">database</name>
<stringValue id="861">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="862" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="863">indexedParameters[0]</name>
<stringValue id="864">Instument</stringValue>
<type>VARIABLE</type>
</item>
<item id="865" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="866">indexedParameters[1]</name>
<stringValue id="867">Instument</stringValue>
<type>VARIABLE</type>
</item>
<item id="868" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="869">querySQL</name>
<stringValue id="870">Insert into ft_t_isgp (ISGP_OID, PRNT_ISS_GRP_OID, INSTR_ID, PRT_PURP_TYP, START_TMS, LAST_CHG_TMS, LAST_CHG_USR_ID) 
select new_oid(), 'ISGR000012', ?, 'JAPINGRD', now(), now(), 'DeriveBaselIIAssetRating' from  dual
where not exists (select 1 from ft_t_isgp isgp where prnt_iss_grp_oid = 'ISGR000012' 
                  and isgp.instr_id = ? and prt_purp_typ = 'JAPINGRD' 
                  and start_tms &lt;= now() and (end_tms is null or end_tms &gt; now()))</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="871" type="java.util.HashSet">
<item idref="852" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="872" type="java.util.HashSet">
<item id="873" type="com.j2fe.workflow.definition.Transition">
<name id="874">goto-next</name>
<source idref="854"/>
<target idref="718"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item idref="762" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="747"/>
</item>
</sources>
<targets id="875" type="java.util.HashSet">
<item idref="745" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="718"/>
</item>
<item idref="716" type="com.j2fe.workflow.definition.Transition"/>
<item idref="873" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="876" type="java.util.HashSet">
<item id="877" type="com.j2fe.workflow.definition.Transition">
<name id="878">goto-next</name>
<source idref="718"/>
<target id="879">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="880"/>
<directJoin>false</directJoin>
<name id="881">insert Basel II Rating Standard</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="882">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="883" type="java.util.HashSet">
<item id="884" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="885">database</name>
<stringValue id="886">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="887" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="888">indexedParameters[0]</name>
<stringValue id="889">Instument</stringValue>
<type>VARIABLE</type>
</item>
<item id="890" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="891">indexedParameters[1]</name>
<stringValue id="892">dataSrc</stringValue>
<type>VARIABLE</type>
</item>
<item id="893" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="894">indexedParameters[2]</name>
<stringValue id="895">ratignNumber</stringValue>
<type>VARIABLE</type>
</item>
<item id="896" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="897">indexedParameters[3]</name>
<stringValue id="898">Instument</stringValue>
<type>VARIABLE</type>
</item>
<item id="899" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="900">querySQL</name>
<objectValue id="901" type="java.lang.String">--RDD-268 start
--insert into ft_t_isrt (ISS_RTNG_OID, INSTR_ID, START_TMS, LAST_CHG_USR_ID, LAST_CHG_TMS, RTNG_CDE, RTNG_VALUE_OID, RTNG_SET_OID, orig_data_prov_id, data_stat_typ, rtng_eff_tms)
insert into ft_t_isrt (ISS_RTNG_OID, INSTR_ID, START_TMS, LAST_CHG_USR_ID, LAST_CHG_TMS, RTNG_CDE, RTNG_SYMBOL_TXT, RTNG_VALUE_OID, RTNG_SET_OID, orig_data_prov_id, data_stat_typ, rtng_eff_tms, data_src_id)
--RDD-268 end
select new_oid(), ?, now(), 'DeriveBaselIIAssetRating', now(), rtng_cde, rtng_cde, rtng_value_oid, rtng_set_oid, 'DERIVED', 'ACTIVE', (date_trunc('day', now())::timestamp), ? from ft_t_rtvl
where rtng_set_oid = 'RTNG000010'
and rtng_cde_num = cast(? as int)
--RDD-268 start
--and not exists (select 1 from ft_t_isrt where rtng_set_oid = 'RTNG000010' and instr_id = ? and start_tms &lt;= now() and (end_tms is null or end_tms &gt; now()))
and not exists (select 1 from ft_t_isrt where rtng_set_oid = 'RTNG000010' and instr_id = ? and rtng_eff_tms &lt;= now() and (sys_eff_end_tms is null or sys_eff_end_tms &gt; now()))
--RDD-268 end</objectValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="902" type="java.util.HashSet">
<item idref="877" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="903" type="java.util.HashSet">
<item id="904" type="com.j2fe.workflow.definition.Transition">
<name id="905">goto-next</name>
<source idref="879"/>
<target id="906">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="907">End date existing CQS Ranking in FICL</description>
<directJoin>false</directJoin>
<name id="908">End date CQS Ranking</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="909">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="910" type="java.util.HashSet">
<item id="911" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="912">database</name>
<stringValue id="913">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="914" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="915">indexedParameters[0]</name>
<stringValue id="916">Instument</stringValue>
<type>VARIABLE</type>
</item>
<item id="917" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="918">indexedParameters[1]</name>
<stringValue id="919">ratignNumber</stringValue>
<type>VARIABLE</type>
</item>
<item id="920" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="921">indexedParameters[2]</name>
<stringValue id="922">dataSrc</stringValue>
<type>VARIABLE</type>
</item>
<item id="923" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="924">querySQL</name>
<objectValue id="925" type="java.lang.String">update
	FT_T_ISCL iscl
set
	end_tms = now(),
	last_chg_tms = now(),
	last_chg_usr_id = 'DeriveBaselIIAssetRating'
where
	INDUS_CL_SET_ID in ('CQSRANKG')
	and CLSF_PURP_TYP = 'CLASSIFY'
	and end_tms is null
	and instr_id = ?
	and not exists (
	select
		1
	from
		FT_T_OVRC
	where
		OVR_REF_OID = iscl.instr_id 
		and 'ISS_CLSF_OID=' || iscl.ISS_CLSF_OID::text || ';' = OVR_TBL_KEY_TXT )
	and ( iscl.CLSF_OID::text != (
	select
		case
			RTNG_CDE when 'AAA' then 'CQSRANKG01'
			when 'AA+' then 'CQSRANKG01'
			when 'AA' then 'CQSRANKG01'
			when 'AA-' then 'CQSRANKG01'
			when 'A+' then 'CQSRANKG02'
			when 'A' then 'CQSRANKG02'
			when 'A-' then 'CQSRANKG02'
			when 'BBB+' then 'CQSRANKG03'
			when 'BBB' then 'CQSRANKG03'
			when 'BBB-' then 'CQSRANKG03'
			when 'BB+' then 'CQSRANKG04'
			when 'BB' then 'CQSRANKG04'
			when 'BB-' then 'CQSRANKG04'
			when 'B+' then 'CQSRANKG05'
			when 'B' then 'CQSRANKG05'
			when 'B-' then 'CQSRANKG05'
			when 'CCC+' then 'CQSRANKG06'
			when 'CCC' then 'CQSRANKG06'
			when 'CCC-' then 'CQSRANKG06'
			when 'CC' then 'CQSRANKG06'
			when 'C' then 'CQSRANKG06'
			when 'D' then 'CQSRANKGDF'
			when 'NR' then 'CQSRANKGNR'
			else null
		end as CLSF_OID
	from
		FT_T_RTVL
	where
		RTNG_SET_OID = 'RTNG000010'
		and RTNG_CDE_NUM = cast(? as int) )
		or iscl.data_src_id != ? )</objectValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="926" type="java.util.HashSet">
<item idref="904" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="927" type="java.util.HashSet">
<item id="928" type="com.j2fe.workflow.definition.Transition">
<name id="929">goto-next</name>
<source idref="906"/>
<target id="930">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="931"/>
<directJoin>false</directJoin>
<name id="932">CQS Ranking ISCL insert</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="933">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="934" type="java.util.HashSet">
<item id="935" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="936">database</name>
<stringValue id="937">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="938" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="939">indexedParameters[0]</name>
<stringValue id="940">Instument</stringValue>
<type>VARIABLE</type>
</item>
<item id="941" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="942">indexedParameters[1]</name>
<stringValue id="943">dataSrc</stringValue>
<type>VARIABLE</type>
</item>
<item id="944" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="945">indexedParameters[2]</name>
<stringValue id="946">ratignNumber</stringValue>
<type>VARIABLE</type>
</item>
<item id="947" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="948">indexedParameters[3]</name>
<stringValue id="949">Instument</stringValue>
<type>VARIABLE</type>
</item>
<item id="950" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="951">querySQL</name>
<objectValue id="952" type="java.lang.String">insert
	into
	FT_T_ISCL ( ISS_CLSF_OID,
	INSTR_ID,
	INDUS_CL_SET_ID,
	CLSF_OID,
	CL_VALUE,
	CLSF_PURP_TYP,
	START_TMS,
	LAST_CHG_TMS,
	LAST_CHG_USR_ID,
	DATA_STAT_TYP,
	DATA_SRC_ID )
select
	new_oid(),
	?,
	'CQSRANKG',
	case
		RTNG_CDE when 'AAA' then 'CQSRANKG01'
		when 'AA+' then 'CQSRANKG01'
		when 'AA' then 'CQSRANKG01'
		when 'AA-' then 'CQSRANKG01'
		when 'A+' then 'CQSRANKG02'
		when 'A' then 'CQSRANKG02'
		when 'A-' then 'CQSRANKG02'
		when 'BBB+' then 'CQSRANKG03'
		when 'BBB' then 'CQSRANKG03'
		when 'BBB-' then 'CQSRANKG03'
		when 'BB+' then 'CQSRANKG04'
		when 'BB' then 'CQSRANKG04'
		when 'BB-' then 'CQSRANKG04'
		when 'B+' then 'CQSRANKG05'
		when 'B' then 'CQSRANKG05'
		when 'B-' then 'CQSRANKG05'
		when 'CCC+' then 'CQSRANKG06'
		when 'CCC' then 'CQSRANKG06'
		when 'CCC-' then 'CQSRANKG06'
		when 'CC' then 'CQSRANKG06'
		when 'C' then 'CQSRANKG06'
		when 'D' then 'CQSRANKGDF'
		when 'NR' then 'CQSRANKGNR'
		else null
	end as CLSF_OID,
	case
		RTNG_CDE when 'AAA' then '1'
		when 'AA+' then '1'
		when 'AA' then '1'
		when 'AA-' then '1'
		when 'A+' then '2'
		when 'A' then '2'
		when 'A-' then '2'
		when 'BBB+' then '3'
		when 'BBB' then '3'
		when 'BBB-' then '3'
		when 'BB+' then '4'
		when 'BB' then '4'
		when 'BB-' then '4'
		when 'B+' then '5'
		when 'B' then '5'
		when 'B-' then '5'
		when 'CCC+' then '6'
		when 'CCC' then '6'
		when 'CCC-' then '6'
		when 'CC' then '6'
		when 'C' then '6'
		when 'D' then 'D'
		when 'NR' then 'NR'
		else null
	end as RTNG_CDE,
	'CLASSIFY',
	now(),
	now(),
	'DeriveBaselIIAssetRating',
	'ACTIVE',
	?
from
	FT_T_RTVL
where
	RTNG_SET_OID = 'RTNG000010'
	and RTNG_CDE_NUM = cast(? as int)
	and not exists (
	select
		1
	from
		FT_T_ISCL
	where
		INSTR_ID = ?
		and INDUS_CL_SET_ID = 'CQSRANKG'
		and END_TMS is null )</objectValue>
<type>CONSTANT</type>
</item>
</parameters>
<persistentVariables id="953" type="java.util.HashSet">
<item id="954" type="java.lang.String">dataSrc
1000</item>
</persistentVariables>
<sources id="955" type="java.util.HashSet">
<item idref="928" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="956" type="java.util.HashSet">
<item id="957" type="com.j2fe.workflow.definition.Transition">
<name id="958">goto-next</name>
<source idref="930"/>
<target id="959">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="960">End date existing CQS Ranking in FICL</description>
<directJoin>false</directJoin>
<name id="961">End date SFTR</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="962">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="963" type="java.util.HashSet">
<item id="964" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="965">database</name>
<stringValue id="966">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="967" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="968">indexedParameters[0]</name>
<stringValue id="969">Instument</stringValue>
<type>VARIABLE</type>
</item>
<item id="970" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="971">indexedParameters[1]</name>
<stringValue id="972">ratignNumber</stringValue>
<type>VARIABLE</type>
</item>
<item id="973" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="974">indexedParameters[2]</name>
<stringValue id="975">dataSrc</stringValue>
<type>VARIABLE</type>
</item>
<item id="976" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="977">querySQL</name>
<objectValue id="978" type="java.lang.String">update
	FT_T_ISCL iscl
set
	end_tms = now(),
	last_chg_tms = now(),
	last_chg_usr_id = 'DeriveBaselIIAssetRating'
where
	INDUS_CL_SET_ID in ('SFTRQUAL')
	and CLSF_PURP_TYP = 'SECUQUAL'
	and end_tms is null
	and instr_id = ?
	and not exists (
	select
		1
	from
		FT_T_OVRC
	where
		OVR_REF_OID = iscl.INSTR_ID
		and 'ISS_CLSF_OID=' || iscl.ISS_CLSF_OID::text || ';' = OVR_TBL_KEY_TXT )
	and ( CLSF_OID::text != (
	select
		case
			RTNG_CDE when 'AAA' then 'SFTRQUAL01'
			when 'AA+' then 'SFTRQUAL01'
			when 'AA' then 'SFTRQUAL01'
			when 'AA-' then 'SFTRQUAL01'
			when 'A+' then 'SFTRQUAL01'
			when 'A' then 'SFTRQUAL01'
			when 'A-' then 'SFTRQUAL01'
			when 'BBB+' then 'SFTRQUAL01'
			when 'BBB' then 'SFTRQUAL01'
			when 'BBB-' then 'SFTRQUAL01'
			when 'BB+' then 'SFTRQUAL02'
			when 'BB' then 'SFTRQUAL02'
			when 'BB-' then 'SFTRQUAL02'
			when 'B+' then 'SFTRQUAL02'
			when 'B' then 'SFTRQUAL02'
			when 'B-' then 'SFTRQUAL02'
			when 'CCC+' then 'SFTRQUAL02'
			when 'CCC' then 'SFTRQUAL02'
			when 'CCC-' then 'SFTRQUAL02'
			when 'CC' then 'SFTRQUAL02'
			when 'C' then 'SFTRQUAL02'
			when 'D' then 'SFTRQUAL02'
			when 'NR' then 'SFTRQUAL03'
			else null
		end as CLSF_OID
	from
		FT_T_RTVL
	where
		RTNG_SET_OID = 'RTNG000010'
		and RTNG_CDE_NUM = cast(? as INTEGER) )
		or iscl.data_src_id != ? )</objectValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="979" type="java.util.HashSet">
<item idref="957" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="980" type="java.util.HashSet">
<item id="981" type="com.j2fe.workflow.definition.Transition">
<name id="982">goto-next</name>
<source idref="959"/>
<target id="983">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="984"/>
<directJoin>false</directJoin>
<name id="985">SFTR collateral ISCL insert</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="986">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="987" type="java.util.HashSet">
<item id="988" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="989">database</name>
<stringValue id="990">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="991" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="992">indexedParameters[0]</name>
<stringValue id="993">Instument</stringValue>
<type>VARIABLE</type>
</item>
<item id="994" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="995">indexedParameters[1]</name>
<stringValue id="996">dataSrc</stringValue>
<type>VARIABLE</type>
</item>
<item id="997" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="998">indexedParameters[2]</name>
<stringValue id="999">ratignNumber</stringValue>
<type>VARIABLE</type>
</item>
<item id="1000" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1001">indexedParameters[3]</name>
<stringValue id="1002">Instument</stringValue>
<type>VARIABLE</type>
</item>
<item id="1003" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1004">querySQL</name>
<objectValue id="1005" type="java.lang.String">insert
	into
	FT_T_ISCL (ISS_CLSF_OID,
	INSTR_ID,
	INDUS_CL_SET_ID,
	CLSF_OID,
	CL_VALUE,
	CLSF_PURP_TYP,
	START_TMS,
	LAST_CHG_TMS,
	LAST_CHG_USR_ID,
	DATA_STAT_TYP,
	DATA_SRC_ID)
select
	new_oid(),
	?,
	'SFTRQUAL',
	case
		RTNG_CDE when 'AAA' then 'SFTRQUAL01'
		when 'AA+' then 'SFTRQUAL01'
		when 'AA' then 'SFTRQUAL01'
		when 'AA-' then 'SFTRQUAL01'
		when 'A+' then 'SFTRQUAL01'
		when 'A' then 'SFTRQUAL01'
		when 'A-' then 'SFTRQUAL01'
		when 'BBB+' then 'SFTRQUAL01'
		when 'BBB' then 'SFTRQUAL01'
		when 'BBB-' then 'SFTRQUAL01'
		when 'BB+' then 'SFTRQUAL02'
		when 'BB' then 'SFTRQUAL02'
		when 'BB-' then 'SFTRQUAL02'
		when 'B+' then 'SFTRQUAL02'
		when 'B' then 'SFTRQUAL02'
		when 'B-' then 'SFTRQUAL02'
		when 'CCC+' then 'SFTRQUAL02'
		when 'CCC' then 'SFTRQUAL02'
		when 'CCC-' then 'SFTRQUAL02'
		when 'CC' then 'SFTRQUAL02'
		when 'C' then 'SFTRQUAL02'
		when 'D' then 'SFTRQUAL02'
		when 'NR' then 'SFTRQUAL03'
		else null
	end as CLSF_OID,
	case
		RTNG_CDE when 'AAA' then 'INVG'
		when 'AA+' then 'INVG'
		when 'AA' then 'INVG'
		when 'AA-' then 'INVG'
		when 'A+' then 'INVG'
		when 'A' then 'INVG'
		when 'A-' then 'INVG'
		when 'BBB+' then 'INVG'
		when 'BBB' then 'INVG'
		when 'BBB-' then 'INVG'
		when 'BB+' then 'NIVG'
		when 'BB' then 'NIVG'
		when 'BB-' then 'NIVG'
		when 'B+' then 'NIVG'
		when 'B' then 'NIVG'
		when 'B-' then 'NIVG'
		when 'CCC+' then 'NIVG'
		when 'CCC' then 'NIVG'
		when 'CCC-' then 'NIVG'
		when 'CC' then 'NIVG'
		when 'C' then 'NIVG'
		when 'D' then 'NIVG'
		when 'NR' then 'NOTR'
		else null
	end as RTNG_CDE,
	'SECUQUAL',
	current_timestamp,
	current_timestamp,
	'DeriveBaselIIAssetRating',
	'ACTIVE',
	?
from
	FT_T_RTVL
where
	RTNG_SET_OID = 'RTNG000010'
	and RTNG_CDE_NUM = cast(? as int)
	and not exists (
	select
		1
	from
		FT_T_ISCL
	where
		INSTR_ID = ?
		and INDUS_CL_SET_ID = 'SFTRQUAL'
		and END_TMS is null )</objectValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1006" type="java.util.HashSet">
<item idref="981" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1007" type="java.util.HashSet">
<item id="1008" type="com.j2fe.workflow.definition.Transition">
<name id="1009">goto-next</name>
<source idref="983"/>
<target idref="183"/>
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
</targets>
<type>ACTIVITY</type>
</target>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="590"/>
</item>
</sources>
<targets id="1010" type="java.util.HashSet">
<item idref="588" type="com.j2fe.workflow.definition.Transition"/>
<item idref="709" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="570"/>
</item>
</sources>
<targets id="1011" type="java.util.HashSet">
<item id="1012" type="com.j2fe.workflow.definition.Transition">
<name id="1013">nothing-found</name>
<source idref="570"/>
<target idref="524"/>
</item>
<item idref="568" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="531"/>
</item>
</sources>
<targets id="1014" type="java.util.HashSet">
<item idref="704" type="com.j2fe.workflow.definition.Transition"/>
<item idref="529" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="524"/>
</item>
<item idref="707" type="com.j2fe.workflow.definition.Transition"/>
<item idref="1012" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1015" type="java.util.HashSet">
<item idref="522" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="497"/>
</item>
</sources>
<targets id="1016" type="java.util.HashSet">
<item idref="495" type="com.j2fe.workflow.definition.Transition"/>
<item idref="711" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="467"/>
</item>
</sources>
<targets id="1017" type="java.util.HashSet">
<item idref="465" type="com.j2fe.workflow.definition.Transition"/>
<item idref="713" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="446"/>
</item>
</sources>
<targets id="1018" type="java.util.HashSet">
<item idref="444" type="com.j2fe.workflow.definition.Transition"/>
<item idref="846" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="425"/>
</item>
</sources>
<targets id="1019" type="java.util.HashSet">
<item idref="423" type="com.j2fe.workflow.definition.Transition"/>
<item idref="842" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="405"/>
</item>
</sources>
<targets id="1020" type="java.util.HashSet">
<item id="1021" type="com.j2fe.workflow.definition.Transition">
<name id="1022">nothing-found</name>
<source idref="405"/>
<target idref="359"/>
</item>
<item idref="403" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="366"/>
</item>
</sources>
<targets id="1023" type="java.util.HashSet">
<item idref="837" type="com.j2fe.workflow.definition.Transition"/>
<item idref="364" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="359"/>
</item>
<item idref="840" type="com.j2fe.workflow.definition.Transition"/>
<item idref="1021" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1024" type="java.util.HashSet">
<item idref="357" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="338"/>
</item>
</sources>
<targets id="1025" type="java.util.HashSet">
<item idref="336" type="com.j2fe.workflow.definition.Transition"/>
<item idref="844" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="313"/>
</item>
</sources>
<targets id="1026" type="java.util.HashSet">
<item idref="311" type="com.j2fe.workflow.definition.Transition"/>
<item idref="848" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="293"/>
</item>
</sources>
<targets id="1027" type="java.util.HashSet">
<item idref="291" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="273"/>
</item>
</sources>
<targets id="1028" type="java.util.HashSet">
<item idref="271" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="253"/>
</item>
</sources>
<targets id="1029" type="java.util.HashSet">
<item idref="251" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="233"/>
</item>
</sources>
<targets id="1030" type="java.util.HashSet">
<item idref="231" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="213"/>
</item>
</sources>
<targets id="1031" type="java.util.HashSet">
<item idref="211" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="190"/>
</item>
</sources>
<targets id="1032" type="java.util.HashSet">
<item idref="188" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="183"/>
</item>
<item idref="1008" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1033" type="java.util.HashSet">
<item idref="181" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="153"/>
</item>
</sources>
<targets id="1034" type="java.util.HashSet">
<item idref="151" type="com.j2fe.workflow.definition.Transition"/>
<item id="1035" type="com.j2fe.workflow.definition.Transition">
<name id="1036">rows-found</name>
<source idref="153"/>
<target id="1037">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="1038"/>
<directJoin>false</directJoin>
<name id="1039">FRTB chk passed</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="1040">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="1041" type="java.util.HashSet">
<item id="1042" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1043">statements</name>
<stringValue id="1044">String addFRTB3String = "FRTB CAT is " + frtbcat + ". instr_id = '" + instrument + "'";&#13;
&#13;
return addFRTB3String;</stringValue>
<type>CONSTANT</type>
</item>
<item id="1045" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="1046">variables["addFRTB3String"]</name>
<stringValue id="1047">addFRTB3String</stringValue>
<type>VARIABLE</type>
</item>
<item id="1048" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1049">variables["frtbcat"]</name>
<stringValue id="1050">FRTBCategory</stringValue>
<type>VARIABLE</type>
</item>
<item id="1051" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1052">variables["instrument"]</name>
<stringValue id="1053">Instument</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="1054" type="java.util.HashSet">
<item idref="1035" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1055" type="java.util.HashSet">
<item id="1056" type="com.j2fe.workflow.definition.Transition">
<name id="1057">goto-next</name>
<source idref="1037"/>
<target id="1058">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="1059"/>
<directJoin>false</directJoin>
<name id="1060">LogMessage CAT3 eligibile</name>
<nodeHandler>com.j2fe.general.activities.LogMessage</nodeHandler>
<nodeHandlerClass id="1061">com.j2fe.general.activities.LogMessage</nodeHandlerClass>
<parameters id="1062" type="java.util.HashSet">
<item id="1063" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1064">logLevel</name>
<stringValue id="1065">INFO</stringValue>
<type>CONSTANT</type>
</item>
<item id="1066" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1067">message</name>
<stringValue id="1068">addFRTB3String</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="1069" type="java.util.HashSet">
<item idref="1056" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1070" type="java.util.HashSet">
<item id="1071" type="com.j2fe.workflow.definition.Transition">
<name id="1072">goto-next</name>
<source idref="1058"/>
<target id="1073">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="1074"/>
<directJoin>false</directJoin>
<name id="1075">Get OID for FTRB ISCL</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="1076">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="1077" type="java.util.HashSet">
<item id="1078" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1079">database</name>
<stringValue id="1080">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="1081" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="1082">firstColumnsResult[0]</name>
<stringValue id="1083">FrtbOid</stringValue>
<type>VARIABLE</type>
</item>
<item id="1084" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1085">indexedParameters[0]</name>
<stringValue id="1086">FRTBCategory</stringValue>
<type>VARIABLE</type>
</item>
<item id="1087" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1088">querySQL</name>
<stringValue id="1089">select CLSF_OID from FT_T_INCL where INDUS_CL_SET_ID = 'FRTBCATG' and CL_VALUE = CAST(? AS TEXT)  and CLSF_OID like 'FRTBCAT%'</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1090" type="java.util.HashSet">
<item idref="1071" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1091" type="java.util.HashSet">
<item id="1092" type="com.j2fe.workflow.definition.Transition">
<name id="1093">goto-next</name>
<source idref="1073"/>
<target id="1094">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="1095"/>
<directJoin>false</directJoin>
<name id="1096">Get dataSrc for FTRB ISCL</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="1097">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="1098" type="java.util.HashSet">
<item id="1099" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1100">database</name>
<stringValue id="1101">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="1102" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="1103">firstColumnsResult[0]</name>
<stringValue id="1104">FrtbDataSrcId</stringValue>
<type>VARIABLE</type>
</item>
<item id="1105" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1106">indexedParameters[0]</name>
<stringValue id="1107">Instument</stringValue>
<type>VARIABLE</type>
</item>
<item id="1108" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1109">querySQL</name>
<stringValue id="1110">select coalesce(DATA_SRC_ID, 'MHI')  from FT_T_ISCL where INDUS_CL_SET_ID = 'FRTBCATG' and INSTR_ID = ? and CLSF_OID like 'FRTBCAT%'&#13;
order by start_tms desc LIMIT 1 </stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1111" type="java.util.HashSet">
<item idref="1092" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1112" type="java.util.HashSet">
<item id="1113" type="com.j2fe.workflow.definition.Transition">
<name id="1114">goto-next</name>
<source idref="1094"/>
<target id="1115">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="1116"/>
<directJoin>false</directJoin>
<name id="1117">FRTB ISCL Merge</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="1118">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="1119" type="java.util.HashSet">
<item id="1120" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1121">database</name>
<stringValue id="1122">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="1123" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1124">indexedParameters[0]</name>
<stringValue id="1125">Instument</stringValue>
<type>VARIABLE</type>
</item>
<item id="1126" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1127">indexedParameters[1]</name>
<stringValue id="1128">FRTBCategory</stringValue>
<type>VARIABLE</type>
</item>
<item id="1129" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1130">indexedParameters[2]</name>
<stringValue id="1131">FRTBCategory</stringValue>
<type>VARIABLE</type>
</item>
<item id="1132" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1133">indexedParameters[3]</name>
<stringValue id="1134">FrtbOid</stringValue>
<type>VARIABLE</type>
</item>
<item id="1135" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1136">indexedParameters[4]</name>
<stringValue id="1137">dataSrc</stringValue>
<type>VARIABLE</type>
</item>
<item id="1138" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1139">indexedParameters[5]</name>
<stringValue id="1140">Instument</stringValue>
<type>VARIABLE</type>
</item>
<item id="1141" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1142">indexedParameters[6]</name>
<stringValue id="1143">FrtbOid</stringValue>
<type>VARIABLE</type>
</item>
<item id="1144" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1145">indexedParameters[7]</name>
<stringValue id="1146">FRTBCategory</stringValue>
<type>VARIABLE</type>
</item>
<item id="1147" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1148">indexedParameters[8]</name>
<stringValue id="1149">dataSrc</stringValue>
<type>VARIABLE</type>
</item>
<item id="1150" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1151">querySQL</name>
<stringValue id="1152">MERGE INTO ft_t_iscl AS s&#13;
USING (VALUES (cast(? as text) , 'FRTBCATG')) AS e(instr_id, indus_cl_set_id)&#13;
ON (e.instr_id = s.instr_id&#13;
    AND e.indus_cl_set_id = s.indus_cl_set_id&#13;
    AND s.end_tms IS NULL)&#13;
WHEN MATCHED AND s.cl_value != cast(? as text) THEN&#13;
  UPDATE SET cl_value      = cast(? as text),&#13;
             clsf_oid      = cast(? as text),&#13;
             last_chg_tms  = now(),&#13;
             last_chg_usr_id = 'DeriveBaselIIAssetRating',&#13;
             data_src_id   = cast(? as text),&#13;
             data_stat_typ = 'ACTIVE',&#13;
             start_tms     = now()&#13;
WHEN NOT MATCHED THEN&#13;
  INSERT (iss_clsf_oid, instr_id, indus_cl_set_id, clsf_oid, cl_value, clsf_purp_typ, start_tms, last_chg_tms, last_chg_usr_id, data_stat_typ, data_src_id)&#13;
  VALUES (new_oid(), cast(? as text), 'FRTBCATG', cast(? as text), cast(? as text), 'CLASSIFY',now(), now(), 'DeriveBaselIIRating', 'ACTIVE', cast(? as text));</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1153" type="java.util.HashSet">
<item idref="1113" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1154" type="java.util.HashSet">
<item id="1155" type="com.j2fe.workflow.definition.Transition">
<name id="1156">goto-next</name>
<source idref="1115"/>
<target idref="98"/>
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
</targets>
<type>ACTIVITY</type>
</target>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="136"/>
</item>
</sources>
<targets id="1157" type="java.util.HashSet">
<item idref="134" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="122"/>
</item>
</sources>
<targets id="1158" type="java.util.HashSet">
<item idref="120" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="105"/>
</item>
</sources>
<targets id="1159" type="java.util.HashSet">
<item idref="103" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="98"/>
</item>
<item idref="1155" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1160" type="java.util.HashSet">
<item idref="96" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="81"/>
</item>
</sources>
<targets id="1161" type="java.util.HashSet">
<item idref="79" type="com.j2fe.workflow.definition.Transition"/>
<item id="1162" type="com.j2fe.workflow.definition.Transition">
<name id="1163">rows-found</name>
<source idref="81"/>
<target idref="37"/>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="64"/>
</item>
</sources>
<targets id="1164" type="java.util.HashSet">
<item idref="62" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="44"/>
</item>
</sources>
<targets id="1165" type="java.util.HashSet">
<item idref="42" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="37"/>
</item>
<item idref="1162" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1166" type="java.util.HashSet">
<item idref="35" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="30"/>
</item>
<item id="1167" type="com.j2fe.workflow.definition.Transition">
<name id="1168">rows-found</name>
<source id="1169">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="1170"/>
<directJoin>false</directJoin>
<name id="1171">Select instruments</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="1172">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="1173" type="java.util.HashSet">
<item id="1174" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1175">database</name>
<stringValue id="1176">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="1177" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="1178">firstColumnsResult</name>
<stringValue id="1179">Instruments</stringValue>
<type>VARIABLE</type>
</item>
<item id="1180" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="1181">[0]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="1182">indexedParameters[0]</name>
<stringValue id="1183">Issuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="1184" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1185">querySQL</name>
<stringValue id="1186">SELECT DISTINCT ISSU.INSTR_ID&#13;
FROM FT_T_ISSU ISSU, ft_t_isgp isgpc&#13;
WHERE ISSU.INSTR_ISSR_ID = ?&#13;
and isgpc.end_tms IS NULL&#13;
and isgpc.INSTR_ID = ISSU.INSTR_ID AND ISGPc.PRT_PURP_TYP = 'PRTFLIOC'&#13;
AND EXISTS (SELECT 1 FROM FT_T_ISTY ISTY WHERE ISTY.ISS_TYP = ISSU.ISS_TYP AND ISTY.PRNT_ISS_TYP = 'DEBT'&#13;
AND ISTY.START_TMS &lt;=now() AND (ISTY.END_TMS IS NULL OR ISTY.END_TMS &gt; now()))&#13;
AND ISSU.START_TMS &lt;=now() AND (ISSU.END_TMS IS NULL OR ISSU.END_TMS &gt; now())&#13;
and exists ( select 1 from ft_t_isgp isgp where ISGP.PRT_PURP_TYP = 'PRTFLIOP'&#13;
  AND ISGP.START_TMS &lt;= now() AND (ISGP.END_TMS IS NULL OR ISGP.END_TMS &gt; now())&#13;
  AND ISGP.PRNT_ISS_GRP_OID = isgpc.prnt_iss_grp_oid&#13;
  and exists (SELECT 1 FROM FT_T_ISST ISST WHERE ISST.STAT_DEF_ID = 'MIZRECAL' AND ISST.INSTR_ID = ISGP.INSTR_ID  AND STAT_CHAR_VAL_TXT= 'Y'&#13;
  AND ISST.START_TMS &lt;= now() AND (ISST.END_TMS IS NULL OR ISST.END_TMS &gt; now()))&#13;
)</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1187" type="java.util.HashSet">
<item id="1188" type="com.j2fe.workflow.definition.Transition">
<name id="1189">goto-next</name>
<source id="1190">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="1191"/>
<directJoin>false</directJoin>
<name id="1192">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="1193">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="1194" type="java.util.HashSet"/>
<targets id="1195" type="java.util.HashSet">
<item idref="1188" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="1169"/>
</item>
</sources>
<targets id="1196" type="java.util.HashSet">
<item id="1197" type="com.j2fe.workflow.definition.Transition">
<name id="1198">nothing-found</name>
<source idref="1169"/>
<target idref="3"/>
</item>
<item idref="1167" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="30"/>
</item>
</sources>
<targets id="1199" type="java.util.HashSet">
<item idref="28" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="10"/>
</item>
</sources>
<targets id="1200" type="java.util.HashSet">
<item idref="8" type="com.j2fe.workflow.definition.Transition"/>
<item idref="630" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="3"/>
</item>
<item idref="1197" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1201" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="1202">Mizuho/Ratings</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="1203">user1</lastChangeUser>
<lastUpdate id="1204">2025-11-27T22:42:58.000+0000</lastUpdate>
<name id="1205">DeriveBaselIIAsetRating</name>
<nodes id="1206" type="java.util.HashSet">
<item idref="98" type="com.j2fe.workflow.definition.Node"/>
<item idref="800" type="com.j2fe.workflow.definition.Node"/>
<item idref="667" type="com.j2fe.workflow.definition.Node"/>
<item idref="764" type="com.j2fe.workflow.definition.Node"/>
<item idref="233" type="com.j2fe.workflow.definition.Node"/>
<item idref="930" type="com.j2fe.workflow.definition.Node"/>
<item idref="570" type="com.j2fe.workflow.definition.Node"/>
<item idref="405" type="com.j2fe.workflow.definition.Node"/>
<item idref="531" type="com.j2fe.workflow.definition.Node"/>
<item idref="366" type="com.j2fe.workflow.definition.Node"/>
<item idref="747" type="com.j2fe.workflow.definition.Node"/>
<item idref="425" type="com.j2fe.workflow.definition.Node"/>
<item idref="590" type="com.j2fe.workflow.definition.Node"/>
<item idref="105" type="com.j2fe.workflow.definition.Node"/>
<item idref="253" type="com.j2fe.workflow.definition.Node"/>
<item idref="906" type="com.j2fe.workflow.definition.Node"/>
<item idref="213" type="com.j2fe.workflow.definition.Node"/>
<item idref="959" type="com.j2fe.workflow.definition.Node"/>
<item idref="64" type="com.j2fe.workflow.definition.Node"/>
<item idref="1115" type="com.j2fe.workflow.definition.Node"/>
<item idref="183" type="com.j2fe.workflow.definition.Node"/>
<item idref="136" type="com.j2fe.workflow.definition.Node"/>
<item idref="1037" type="com.j2fe.workflow.definition.Node"/>
<item idref="153" type="com.j2fe.workflow.definition.Node"/>
<item idref="635" type="com.j2fe.workflow.definition.Node"/>
<item idref="1073" type="com.j2fe.workflow.definition.Node"/>
<item idref="1094" type="com.j2fe.workflow.definition.Node"/>
<item idref="338" type="com.j2fe.workflow.definition.Node"/>
<item idref="497" type="com.j2fe.workflow.definition.Node"/>
<item idref="854" type="com.j2fe.workflow.definition.Node"/>
<item idref="10" type="com.j2fe.workflow.definition.Node"/>
<item idref="446" type="com.j2fe.workflow.definition.Node"/>
<item idref="1058" type="com.j2fe.workflow.definition.Node"/>
<item idref="122" type="com.j2fe.workflow.definition.Node"/>
<item idref="30" type="com.j2fe.workflow.definition.Node"/>
<item idref="524" type="com.j2fe.workflow.definition.Node"/>
<item idref="37" type="com.j2fe.workflow.definition.Node"/>
<item idref="793" type="com.j2fe.workflow.definition.Node"/>
<item idref="359" type="com.j2fe.workflow.definition.Node"/>
<item idref="293" type="com.j2fe.workflow.definition.Node"/>
<item idref="273" type="com.j2fe.workflow.definition.Node"/>
<item idref="81" type="com.j2fe.workflow.definition.Node"/>
<item idref="44" type="com.j2fe.workflow.definition.Node"/>
<item idref="611" type="com.j2fe.workflow.definition.Node"/>
<item idref="190" type="com.j2fe.workflow.definition.Node"/>
<item idref="983" type="com.j2fe.workflow.definition.Node"/>
<item idref="1169" type="com.j2fe.workflow.definition.Node"/>
<item idref="1190" type="com.j2fe.workflow.definition.Node"/>
<item idref="3" type="com.j2fe.workflow.definition.Node"/>
<item idref="313" type="com.j2fe.workflow.definition.Node"/>
<item idref="467" type="com.j2fe.workflow.definition.Node"/>
<item idref="718" type="com.j2fe.workflow.definition.Node"/>
<item idref="879" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>false</optimize>
<parameter id="1207" type="java.util.HashMap">
<entry>
<key id="1208" type="java.lang.String">Issuer</key>
<value id="1209" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="1210">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="1211" type="java.lang.String">Mapped Parameters</key>
<value id="1212" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="1213">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
</parameter>
<permissions id="1214" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>false</purgeAtEnd>
<retries>0</retries>
<startNode idref="1190"/>
<status>RELEASED</status>
<variables id="1215" type="java.util.HashMap">
<entry>
<key id="1216" type="java.lang.String">Indexed Parameters</key>
<value id="1217" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="1218">[Ljava.lang.Object;</className>
<clazz>[Ljava.lang.Object;</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="1219" type="java.lang.String">IssueLoopCounter</key>
<value id="1220" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="1221">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<persistent>false</persistent>
<value id="1222" type="java.lang.Integer">0</value>
</value>
</entry>
<entry>
<key id="1223" type="java.lang.String">Issuer</key>
<value id="1224" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="1225">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="1226" type="java.lang.String">Mapped Parameters</key>
<value id="1227" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="1228">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="1229" type="java.lang.String">dataSrc</key>
<value id="1230" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="1231">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="1232">datsSrc</description>
<persistent>true</persistent>
</value>
</entry>
</variables>
<version>33</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
