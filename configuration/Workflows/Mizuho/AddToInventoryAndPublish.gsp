<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.04">
<package-comment/>
<businessobject displayString="23 - V10" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>false</alwaysPersist>
<clustered>true</clustered>
<comment id="1">V10</comment>
<description id="2">Add to UP IOI, IOI, SOI and Publish</description>
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
<name id="12">merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="13">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="14" type="java.util.HashSet">
<item id="15" type="com.j2fe.workflow.definition.Transition">
<name id="16">goto-next</name>
<source id="17">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="18"/>
<directJoin>false</directJoin>
<name id="19">SOI REAL message</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="20">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="21" type="java.util.HashSet">
<item id="22" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="23">["OverridePublishingCheck"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="24">input["OverridePublishingCheck"]</name>
<stringValue id="25">OverridePublishingCheck</stringValue>
<type>VARIABLE</type>
</item>
<item id="26" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="27">["PublishFlag"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="28">input["PublishFlag"]</name>
<objectValue id="29" type="java.lang.String">N</objectValue>
<type>CONSTANT</type>
</item>
<item id="30" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="31">["sqlSelect"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="32">input["sqlSelect"]</name>
<stringValue id="33">soiQuery</stringValue>
<type>VARIABLE</type>
</item>
<item id="34" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="35">name</name>
<stringValue id="36">RealMessageProcessing</stringValue>
<type>CONSTANT</type>
</item>
<item id="37" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="38">output["TransactionIDList"]</name>
<stringValue id="39">TransactionIDList</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<persistentVariables id="40" type="java.util.HashSet">
<item id="41" type="java.lang.String">soiQuery
1000</item>
</persistentVariables>
<sources id="42" type="java.util.HashSet">
<item id="43" type="com.j2fe.workflow.definition.Transition">
<name id="44">goto-next</name>
<source id="45">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="46"/>
<directJoin>false</directJoin>
<name id="47">BBPerSec - SOI REAL Query</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="48">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="49" type="java.util.HashSet">
<item id="50" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="51">statements</name>
<objectValue id="52" type="java.lang.String">query = "SELECT distinct '&lt;!DOCTYPE STREET_REF SYSTEM \"fti://repository/dtd/STREET_REF\"&gt;' || ";&#13;
query = query + "XMLElement(NAME \"STREET_REF\",XMLAttributes( 'GUEST' AS \"USERID\"), ";&#13;
query = query + "XMLElement(NAME \"HEADER\", ";&#13;
query = query + "XMLElement(NAME \"MAIN_ENTITY_ID\", XMLAttributes( (STRING_TO_ARRAY(event_value, ','))[2] AS \"VALUE\")), ";&#13;
query = query + "XMLElement(NAME \"MAIN_ENTITY_ID_CTXT_TYP\",XMLAttributes((STRING_TO_ARRAY(event_value, ','))[1] AS \"VALUE\")), XMLElement(NAME \"DATASOURCE\",XMLAttributes('cmfSOI' AS \"VALUE\")), ";&#13;
query = query + "XMLElement(NAME \"MAIN_ENTITY_TBL_TYP\",XMLAttributes('ISSU' AS \"VALUE\"))), ";&#13;
query = query + "XMLElement(NAME \"SEGMENT\", XMLAttributes( 'Issue' AS \"TYPE\", 'REFERENCE' AS \"ACTION\"), ";&#13;
query = query + "XMLElement(NAME \"Issue\", XMLElement(NAME \"INSTRID\",  XMLAttributes( (select rtrim(instr_id) from ft_t_isid where (case when id_ctxt_typ = 'BB8CHR' then 'TICKER' when id_ctxt_typ = 'BBUNIQUE' then 'BB_UNIQUE' when id_ctxt_typ = 'BBGLOBAL' then 'BB_GLOBAL' else id_ctxt_typ end)=(STRING_TO_ARRAY(event_value, ','))[1] and iss_id=(STRING_TO_ARRAY(event_value, ','))[2] AND end_tms IS NULL limit 1)AS \"VALUE\")), ";&#13;
query = query + "XMLElement(NAME \"LASTCHGUSRID\",XMLAttributes(((STRING_TO_ARRAY(event_value, ','))[3]) AS \"VALUE\")))),( SELECT XMLAGG (";&#13;
query = query + "XMLElement(NAME \"SEGMENT\", XMLAttributes( 'ISSUIssueGroupParticipant' AS \"TYPE\", 'UNKNOWN' AS \"ACTION\"),  XMLElement(NAME \"ISSUIssueGroupParticipant\", ";&#13;
query = query + "XMLElement(NAME \"PRNTISSGRPOID\", XMLAttributes( (select iss_grp_oid from fT_T_isgr where grp_nme = ((STRING_TO_ARRAY(event_value, ','))[4])) AS \"VALUE\")),  XMLElement(NAME \"PRTPURPTYP\", XMLAttributes( 'INTEREST' AS \"VALUE\")), XMLElement(NAME \"DATASTATTYP\", XMLAttributes( 'ACTIVE' AS \"VALUE\")), ";&#13;
query = query + "XMLElement(NAME \"LASTCHGUSRID\",XMLAttributes(((STRING_TO_ARRAY(event_value, ','))[3]) AS \"VALUE\"))))) FROM mhi_tb_eventlog m1 where event_job_id='"+ eventJobId +"' and event_creator='cmfSOIAdditionFilter Workflow' and event_desc='INSTRUMENT EXISTS' and m1.event_id=m2.event_id )) ";&#13;
query = query + "FROM mhi_tb_eventlog m2 where event_job_id='"+ eventJobId +"' and event_creator='cmfSOIAdditionFilter Workflow' and event_desc in ('INSTRUMENT EXISTS','INSTRUMENT NOT EXISTS') ";</objectValue>
<type>CONSTANT</type>
</item>
<item id="53" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="54">["eventJobId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="55">variables["eventJobId"]</name>
<stringValue id="56">EventJobId</stringValue>
<type>VARIABLE</type>
</item>
<item id="57" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="58">["query"]@java/lang/Integer@</UITypeHint>
<input>false</input>
<name id="59">variables["query"]</name>
<stringValue id="60">soiQuery</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="61" type="java.util.HashSet">
<item id="62" type="com.j2fe.workflow.definition.Transition">
<name id="63">Y</name>
<source id="64">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="65"/>
<directJoin>false</directJoin>
<name id="66">Triggered by BBPerSecurity Batch?</name>
<nodeHandler>com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandler>
<nodeHandlerClass id="67">com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandlerClass>
<parameters id="68" type="java.util.HashSet">
<item id="69" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="70">caseInsensitive</name>
<stringValue id="71">true</stringValue>
<type>CONSTANT</type>
</item>
<item id="72" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="73">caseItem</name>
<stringValue id="74">TriggeredByBBPerSecurityBatch</stringValue>
<type>VARIABLE</type>
</item>
<item id="75" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="76">defaultItem</name>
<stringValue id="77">Y</stringValue>
<type>CONSTANT</type>
</item>
<item id="78" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="79">nullTransition</name>
<stringValue id="80">Y</stringValue>
<type>CONSTANT</type>
</item>
<item id="81" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="82">trimSpaces</name>
<stringValue id="83">true</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="84" type="java.util.HashSet">
<item id="85" type="com.j2fe.workflow.definition.Transition">
<name id="86">goto-next</name>
<source id="87">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="88"/>
<directJoin>false</directJoin>
<name id="89">IOI REAL message</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="90">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="91" type="java.util.HashSet">
<item id="92" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="93">["OverridePublishingCheck"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="94">input["OverridePublishingCheck"]</name>
<stringValue id="95">OverridePublishingCheck</stringValue>
<type>VARIABLE</type>
</item>
<item id="96" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="97">["PublishFlag"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="98">input["PublishFlag"]</name>
<objectValue id="99" type="java.lang.String">Y</objectValue>
<type>CONSTANT</type>
</item>
<item id="100" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="101">["sqlSelect"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="102">input["sqlSelect"]</name>
<stringValue id="103">ioiQuery</stringValue>
<type>VARIABLE</type>
</item>
<item id="104" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="105">name</name>
<stringValue id="106">RealMessageProcessing</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<persistentVariables id="107" type="java.util.HashSet">
<item id="108" type="java.lang.String">ioiQuery
1000</item>
</persistentVariables>
<sources id="109" type="java.util.HashSet">
<item id="110" type="com.j2fe.workflow.definition.Transition">
<name id="111">goto-next</name>
<source id="112">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="113"/>
<directJoin>false</directJoin>
<name id="114">IOI REAL Query</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="115">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="116" type="java.util.HashSet">
<item id="117" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="118">statements</name>
<objectValue id="119" type="java.lang.String">query = "SELECT distinct '&lt;!DOCTYPE STREET_REF SYSTEM \"fti://repository/dtd/STREET_REF\"&gt;' || ";
query = query + "xmlelement(NAME \"STREET_REF\",xmlattributes( 'GUEST' AS \"USERID\"), ";
query = query + "xmlelement(NAME \"HEADER\", ";
query = query + "xmlelement(NAME \"MAIN_ENTITY_ID\", xmlattributes( RTRIM((select coalesce(max(pref_issr_id),'') from ft_t_issr where end_tms is null and instr_issr_id = (select instr_issr_id from ft_t_issu where end_tms is null and instr_id = (select rtrim(instr_id) from ft_t_isid where (case when id_ctxt_typ = 'BB8CHR' then 'TICKER' when id_ctxt_typ = 'BBUNIQUE' then 'BB_UNIQUE' when id_ctxt_typ = 'BBGLOBAL' then 'BB_GLOBAL' else id_ctxt_typ end)=(STRING_TO_ARRAY(event_value, ','))[1] and iss_id=(STRING_TO_ARRAY(event_value, ','))[2] AND end_tms IS NULL limit 1)))) AS \"VALUE\")), ";
query = query + "xmlelement(NAME \"MAIN_ENTITY_ID_CTXT_TYP\",xmlattributes( RTRIM((select coalesce(max(pref_id_ctxt_typ),'') from ft_t_issr where end_tms is null and instr_issr_id = (select instr_issr_id from ft_t_issu where end_tms is null and instr_id = (select rtrim(instr_id) from ft_t_isid where (case when id_ctxt_typ = 'BB8CHR' then 'TICKER' when id_ctxt_typ = 'BBUNIQUE' then 'BB_UNIQUE' when id_ctxt_typ = 'BBGLOBAL' then 'BB_GLOBAL' else id_ctxt_typ end)=(STRING_TO_ARRAY(event_value, ','))[1] and iss_id=(STRING_TO_ARRAY(event_value, ','))[2] AND end_tms IS NULL limit 1)))) AS \"VALUE\")) , ";
query = query + "xmlelement(NAME \"MAIN_ENTITY_TBL_TYP\", xmlattributes('ISSR' AS \"VALUE\"))), ";
query = query + "xmlelement(NAME \"SEGMENT\", xmlattributes( 'Issuer' AS \"TYPE\", 'REFERENCE' AS \"ACTION\"), ";
query = query + "xmlelement(NAME \"Issuer\", xmlelement(NAME \"INSTRISSRID\", xmlattributes( RTRIM((select instr_issr_id from ft_t_issr where end_tms is null and instr_issr_id = (select instr_issr_id from ft_t_issu where instr_id = (select rtrim(instr_id) from ft_t_isid where  (case when id_ctxt_typ = 'BB8CHR' then 'TICKER' when id_ctxt_typ = 'BBUNIQUE' then 'BB_UNIQUE' when id_ctxt_typ = 'BBGLOBAL' then 'BB_GLOBAL' else id_ctxt_typ end)=(STRING_TO_ARRAY(event_value, ','))[1] and iss_id=(STRING_TO_ARRAY(event_value, ','))[2] AND end_tms IS NULL limit 1) ))) AS \"VALUE\")), ";
query = query + "xmlelement(NAME \"LASTCHGUSRID\",xmlattributes( ((STRING_TO_ARRAY(event_value, ','))[3]) AS \"VALUE\")))), ";
query = query + "xmlelement(NAME \"SEGMENT\", xmlattributes( 'ISSRIssuerGroupParticipant' AS \"TYPE\", 'UNKNOWN' AS \"ACTION\"), xmlelement(NAME \"ISSRIssuerGroupParticipant\" , ";
query = query + "xmlelement(NAME \"PRNTISSRGRPOID\", xmlattributes( (case ";
query = query + "  when substr(regexp_substr(event_value, '[^,]+', 1, 4),1,4) = 'MHSS' then (SELECT ISSR_GRP_OID FROM FT_T_IRGR WHERE ORG_ID = 'MHSS') ";
query = query + "  when substr(regexp_substr(event_value, '[^,]+', 1, 4),1,4) = 'MHBK' then (SELECT ISSR_GRP_OID FROM FT_T_IRGR WHERE ORG_ID = 'MHBK') ";
query = query + "  when substr(regexp_substr(event_value, '[^,]+', 1, 4),1,3) = 'MBE' then (SELECT ISSR_GRP_OID FROM FT_T_IRGR WHERE ORG_ID = 'MBE') ";
query = query + " else (SELECT ISSR_GRP_OID FROM FT_T_IRGR WHERE ORG_ID = 'MHI') end) AS \"VALUE\")), xmlelement(NAME \"PRTPURPTYP\", xmlattributes( 'INTEREST' AS \"VALUE\")) ";
query = query + "))) ";
query = query + "FROM mhi_tb_eventlog where event_job_id='" + eventJobId + "' and event_creator='cmfSOIAdditionFilter Workflow' and event_desc in ('INSTRUMENT EXISTS','INSTRUMENT NOT EXISTS') ";</objectValue>
<type>CONSTANT</type>
</item>
<item id="120" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="121">["eventJobId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="122">variables["eventJobId"]</name>
<stringValue id="123">EventJobId</stringValue>
<type>VARIABLE</type>
</item>
<item id="124" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="125">["query"]@java/lang/Integer@</UITypeHint>
<input>false</input>
<name id="126">variables["query"]</name>
<stringValue id="127">ioiQuery</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="128" type="java.util.HashSet">
<item id="129" type="com.j2fe.workflow.definition.Transition">
<name id="130">goto-next</name>
<source id="131">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="132"/>
<directJoin>false</directJoin>
<name id="133">UP REAL message</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="134">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="135" type="java.util.HashSet">
<item id="136" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="137">["OverridePublishingCheck"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="138">input["OverridePublishingCheck"]</name>
<stringValue id="139">OverridePublishingCheck</stringValue>
<type>VARIABLE</type>
</item>
<item id="140" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="141">["PublishFlag"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="142">input["PublishFlag"]</name>
<objectValue id="143" type="java.lang.String">Y</objectValue>
<type>CONSTANT</type>
</item>
<item id="144" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="145">["sqlSelect"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="146">input["sqlSelect"]</name>
<stringValue id="147">upIOIQuery</stringValue>
<type>VARIABLE</type>
</item>
<item id="148" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="149">name</name>
<stringValue id="150">RealMessageProcessing</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<persistentVariables id="151" type="java.util.HashSet">
<item id="152" type="java.lang.String">upIOIQuery
1000</item>
</persistentVariables>
<sources id="153" type="java.util.HashSet">
<item id="154" type="com.j2fe.workflow.definition.Transition">
<name id="155">goto-next</name>
<source id="156">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="157"/>
<directJoin>false</directJoin>
<name id="158">UP REAL Query</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="159">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="160" type="java.util.HashSet">
<item id="161" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="162">statements</name>
<objectValue id="163" type="java.lang.String">query = "SELECT distinct '&lt;!DOCTYPE STREET_REF SYSTEM \"fti://repository/dtd/STREET_REF\"&gt;' || ";
query = query + "xmlelement(NAME \"STREET_REF\",xmlattributes( 'GUEST' AS \"USERID\"), ";
query = query + "xmlelement(NAME \"HEADER\", ";
query = query + "xmlelement(NAME \"MAIN_ENTITY_ID\", xmlattributes( RTRIM((select coalesce(max(pref_issr_id),'') from ft_t_issr where end_tms is null and instr_issr_id = (select instr_issr_id from ft_t_issu where end_tms is null and instr_id = (select rtrim(instr_id) from ft_t_isid where (case when id_ctxt_typ = 'BB8CHR' then 'TICKER' when id_ctxt_typ = 'BBUNIQUE' then 'BB_UNIQUE' when id_ctxt_typ = 'BBGLOBAL' then 'BB_GLOBAL' else id_ctxt_typ end)=(STRING_TO_ARRAY(event_value, ','))[1] and iss_id=(STRING_TO_ARRAY(event_value, ','))[2] AND end_tms IS NULL limit 1)))) AS \"VALUE\")), ";
query = query + "xmlelement(NAME \"MAIN_ENTITY_ID_CTXT_TYP\",xmlattributes( RTRIM((select coalesce(max(pref_id_ctxt_typ),'') from ft_t_issr where end_tms is null and instr_issr_id = (select instr_issr_id from ft_t_issu where end_tms is null and instr_id = (select rtrim(instr_id) from ft_t_isid where (case when id_ctxt_typ = 'BB8CHR' then 'TICKER' when id_ctxt_typ = 'BBUNIQUE' then 'BB_UNIQUE' when id_ctxt_typ = 'BBGLOBAL' then 'BB_GLOBAL' else id_ctxt_typ end)=(STRING_TO_ARRAY(event_value, ','))[1] and iss_id=(STRING_TO_ARRAY(event_value, ','))[2] AND end_tms IS NULL limit 1)))) AS \"VALUE\")) , ";
query = query + "xmlelement(NAME \"MAIN_ENTITY_TBL_TYP\", xmlattributes('ISSR' AS \"VALUE\"))), ";
query = query + "xmlelement(NAME \"SEGMENT\", xmlattributes( 'Issuer' AS \"TYPE\", 'REFERENCE' AS \"ACTION\"), ";
query = query + "xmlelement(NAME \"Issuer\", xmlelement(NAME \"INSTRISSRID\", xmlattributes( RTRIM((select instr_issr_id from ft_t_issr where end_tms is null and fins_inst_mnem = (select mhi_fins_up(fins_inst_mnem) from ft_t_issr where end_tms is null and instr_issr_id = (select instr_issr_id from ft_t_issu where instr_id = (select rtrim(instr_id) from ft_t_isid where (case when id_ctxt_typ = 'BB8CHR' then 'TICKER' when id_ctxt_typ = 'BBUNIQUE' then 'BB_UNIQUE' when id_ctxt_typ = 'BBGLOBAL' then 'BB_GLOBAL' else id_ctxt_typ end)=(STRING_TO_ARRAY(event_value, ','))[1] and iss_id=(STRING_TO_ARRAY(event_value, ','))[2] AND end_tms IS NULL limit 1) )))) AS \"VALUE\")), ";
query = query + "xmlelement(NAME \"LASTCHGUSRID\",xmlattributes( ((STRING_TO_ARRAY(event_value, ','))[3]) AS \"VALUE\")))), ";
query = query + "xmlelement(NAME \"SEGMENT\", xmlattributes( 'ISSRIssuerGroupParticipant' AS \"TYPE\", 'UNKNOWN' AS \"ACTION\"), xmlelement(NAME \"ISSRIssuerGroupParticipant\" , ";
query = query + "xmlelement(NAME \"PRNTISSRGRPOID\", xmlattributes( (case ";
query = query + "  when substr(regexp_substr(event_value, '[^,]+', 1, 4),1,4) = 'MHSS' then (SELECT ISSR_GRP_OID FROM FT_T_IRGR WHERE ORG_ID = 'MHSS') ";
query = query + "  when substr(regexp_substr(event_value, '[^,]+', 1, 4),1,4) = 'MHBK' then (SELECT ISSR_GRP_OID FROM FT_T_IRGR WHERE ORG_ID = 'MHBK') ";
query = query + "  when substr(regexp_substr(event_value, '[^,]+', 1, 4),1,3) = 'MBE' then (SELECT ISSR_GRP_OID FROM FT_T_IRGR WHERE ORG_ID = 'MBE') ";
query = query + " else (SELECT ISSR_GRP_OID FROM FT_T_IRGR WHERE ORG_ID = 'MHI') end) AS \"VALUE\")), xmlelement(NAME \"PRTPURPTYP\", xmlattributes( 'INTEREST' AS \"VALUE\")) ";
query = query + "))) ";
query = query + "FROM mhi_tb_eventlog where event_job_id='" + eventJobId + "' and event_creator='cmfSOIAdditionFilter Workflow' and event_desc in ('INSTRUMENT EXISTS','INSTRUMENT NOT EXISTS') ";</objectValue>
<type>CONSTANT</type>
</item>
<item id="164" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="165">["eventJobId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="166">variables["eventJobId"]</name>
<stringValue id="167">EventJobId</stringValue>
<type>VARIABLE</type>
</item>
<item id="168" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="169">["query"]@java/lang/Integer@</UITypeHint>
<input>false</input>
<name id="170">variables["query"]</name>
<stringValue id="171">upIOIQuery</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="172" type="java.util.HashSet">
<item id="173" type="com.j2fe.workflow.definition.Transition">
<name id="174">goto-next</name>
<source id="175">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="176"/>
<directJoin>false</directJoin>
<name id="177">cmfSOIAdditionFilter</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="178">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="179" type="java.util.HashSet">
<item id="180" type="com.j2fe.workflow.definition.Transition">
<name id="181">Y</name>
<source id="182">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="183"/>
<directJoin>false</directJoin>
<name id="184">Triggered by cmfSOiAdditionFilter ?</name>
<nodeHandler>com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandler>
<nodeHandlerClass id="185">com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandlerClass>
<parameters id="186" type="java.util.HashSet">
<item id="187" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="188">caseItem</name>
<stringValue id="189">TriggeredByCmfSOIAdditionFilter</stringValue>
<type>VARIABLE</type>
</item>
<item id="190" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="191">trimSpaces</name>
<stringValue id="192">true</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="193" type="java.util.HashSet">
<item id="194" type="com.j2fe.workflow.definition.Transition">
<name id="195">goto-next</name>
<source id="196">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="197"/>
<directJoin>false</directJoin>
<name id="198">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="199">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="200" type="java.util.HashSet"/>
<targets id="201" type="java.util.HashSet">
<item idref="194" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="182"/>
</item>
</sources>
<targets id="202" type="java.util.HashSet">
<item id="203" type="com.j2fe.workflow.definition.Transition">
<name id="204">N</name>
<source idref="182"/>
<target id="205">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="206"/>
<directJoin>false</directJoin>
<name id="207">cmfSOIAddition</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="208">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="209" type="java.util.HashSet">
<item idref="203" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="210" type="java.util.HashSet">
<item id="211" type="com.j2fe.workflow.definition.Transition">
<name id="212">goto-next</name>
<source idref="205"/>
<target id="213">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="214"/>
<directJoin>false</directJoin>
<name id="215">UP REAL Query</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="216">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="217" type="java.util.HashSet">
<item id="218" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="219">statements</name>
<objectValue id="220" type="java.lang.String">query = "SELECT distinct '&lt;!DOCTYPE STREET_REF SYSTEM \"fti://repository/dtd/STREET_REF\"&gt;' || ";
query = query + "xmlelement(NAME \"STREET_REF\",xmlattributes( 'GUEST' AS \"USERID\"), ";
query = query + "xmlelement(NAME \"HEADER\", ";
query = query + "xmlelement(NAME \"MAIN_ENTITY_ID\", xmlattributes( RTRIM((select coalesce(max(pref_issr_id),'') from ft_t_issr where end_tms is null and instr_issr_id = (select instr_issr_id from ft_t_issu where end_tms is null and instr_id = (select instr_id from ft_t_isid where end_tms is null and iss_id = vnd_rqst_xref_id and (case when id_ctxt_typ = 'BB8CHR' then 'TICKER' when id_ctxt_typ = 'BBUNIQUE' then 'BB_UNIQUE' when id_ctxt_typ = 'BBGLOBAL' then 'BB_GLOBAL' else id_ctxt_typ end) = vnd_rqst_xref_id_ctxt_typ limit 1)))) AS \"VALUE\")), ";
query = query + "xmlelement(NAME \"MAIN_ENTITY_ID_CTXT_TYP\",xmlattributes( RTRIM((select coalesce(max(pref_id_ctxt_typ),'') from ft_t_issr where end_tms is null and instr_issr_id = (select instr_issr_id from ft_t_issu where end_tms is null and instr_id = (select instr_id from ft_t_isid where end_tms is null and iss_id = vnd_rqst_xref_id and (case when id_ctxt_typ = 'BB8CHR' then 'TICKER' when id_ctxt_typ = 'BBUNIQUE' then 'BB_UNIQUE' when id_ctxt_typ = 'BBGLOBAL' then 'BB_GLOBAL' else id_ctxt_typ end)= vnd_rqst_xref_id_ctxt_typ limit 1)))) AS \"VALUE\")), ";
query = query + "xmlelement(NAME \"MAIN_ENTITY_TBL_TYP\",xmlattributes('ISSR' AS \"VALUE\"))), ";
query = query + "xmlelement(NAME \"SEGMENT\", xmlattributes( 'Issuer' AS \"TYPE\", 'REFERENCE' AS \"ACTION\"), ";
query = query + "xmlelement(NAME \"Issuer\", xmlelement(NAME \"INSTRISSRID\", ";
query = query + "xmlattributes( RTRIM((select instr_issr_id from ft_t_issr where end_tms is null and fins_inst_mnem = (select mhi_fins_up(fins_inst_mnem) from ft_t_issr where end_tms is null and instr_issr_id = (select instr_issr_id from ft_t_issu where instr_id = (select instr_id from ft_t_isid where end_tms is null and iss_id = vnd_rqst_xref_id and (case when id_ctxt_typ = 'BB8CHR' then 'TICKER' when id_ctxt_typ = 'BBUNIQUE' then 'BB_UNIQUE' when id_ctxt_typ = 'BBGLOBAL' then 'BB_GLOBAL' else id_ctxt_typ end) = vnd_rqst_xref_id_ctxt_typ limit 1))))) AS \"VALUE\")), ";
query = query + "xmlelement(NAME \"LASTCHGUSRID\",xmlattributes(CAST(vnd_rqstr_id AS TEXT) AS \"VALUE\")))),  ";
query = query + "xmlelement(NAME \"SEGMENT\", xmlattributes( 'ISSRIssuerGroupParticipant' AS \"TYPE\", 'UNKNOWN' AS \"ACTION\"), xmlelement(NAME \"ISSRIssuerGroupParticipant\",  ";
query = query + "xmlelement(NAME \"PRNTISSRGRPOID\", xmlattributes( (case ";
query = query + " when (select org_id from ft_t_isgr where FT_T_ISGR.GRP_NME = vrpm.VND_RQST_PARM_VAL_TXT) = 'MHSS' then (SELECT ISSR_GRP_OID FROM FT_T_IRGR WHERE ORG_ID = 'MHSS')  ";
query = query + " when (select org_id from ft_t_isgr where FT_T_ISGR.GRP_NME = vrpm.VND_RQST_PARM_VAL_TXT) = 'MHBK' then (SELECT ISSR_GRP_OID FROM FT_T_IRGR WHERE ORG_ID = 'MHBK') ";
query = query + " when (select org_id from ft_t_isgr where FT_T_ISGR.GRP_NME = vrpm.VND_RQST_PARM_VAL_TXT) = 'MBE' then (SELECT ISSR_GRP_OID FROM FT_T_IRGR WHERE ORG_ID = 'MBE') ";
query = query + " else (SELECT ISSR_GRP_OID FROM FT_T_IRGR WHERE ORG_ID = 'MHI') end) AS \"VALUE\")), xmlelement(NAME \"PRTPURPTYP\", xmlattributes( 'INTEREST' AS \"VALUE\")) ";
query = query + ")))  ";
query = query + "FROM ft_t_vreq v left join ft_t_vrpm vrpm on v.vnd_rqst_oid = vrpm.vnd_rqst_oid and vrpm.VND_RQST_PARM_KEY_ID like 'SOI%'  where vnd_rqst_typ != 'Generic' ";
query = query + "and coalesce(vnd_rqst_stat_typ,'x') != 'Could not determine Request Type. Please check the log file and configuration.'  ";
query = query + "and trn_id =  '" + trnId +"'" ;</objectValue>
<type>CONSTANT</type>
</item>
<item id="221" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="222">["query"]@java/lang/Integer@</UITypeHint>
<input>false</input>
<name id="223">variables["query"]</name>
<stringValue id="224">ioiQuery</stringValue>
<type>VARIABLE</type>
</item>
<item id="225" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="226">["trnId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="227">variables["trnId"]</name>
<stringValue id="228">RequestTrid</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="229" type="java.util.HashSet">
<item idref="211" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="230" type="java.util.HashSet">
<item id="231" type="com.j2fe.workflow.definition.Transition">
<name id="232">goto-next</name>
<source idref="213"/>
<target id="233">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="234"/>
<directJoin>false</directJoin>
<name id="235">UP REAL message</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="236">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="237" type="java.util.HashSet">
<item id="238" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="239">["PublishFlag"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="240">input["PublishFlag"]</name>
<objectValue id="241" type="java.lang.String">Y</objectValue>
<type>CONSTANT</type>
</item>
<item id="242" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="243">["sqlSelect"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="244">input["sqlSelect"]</name>
<stringValue id="245">ioiQuery</stringValue>
<type>VARIABLE</type>
</item>
<item id="246" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="247">name</name>
<stringValue id="248">RealMessageProcessing</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<persistentVariables id="249" type="java.util.HashSet">
<item id="250" type="java.lang.String">ioiQuery
1000</item>
</persistentVariables>
<sources id="251" type="java.util.HashSet">
<item idref="231" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="252" type="java.util.HashSet">
<item id="253" type="com.j2fe.workflow.definition.Transition">
<name id="254">goto-next</name>
<source idref="233"/>
<target id="255">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="256"/>
<directJoin>false</directJoin>
<name id="257">IOI REAL Query</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="258">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="259" type="java.util.HashSet">
<item id="260" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="261">statements</name>
<objectValue id="262" type="java.lang.String">query = "SELECT distinct '&lt;!DOCTYPE STREET_REF SYSTEM \"fti://repository/dtd/STREET_REF\"&gt;' || ";
query = query + "xmlelement(NAME \"STREET_REF\",xmlattributes( 'GUEST' AS \"USERID\"), ";
query = query + "xmlelement(NAME \"HEADER\", ";
query = query + "xmlelement(NAME \"MAIN_ENTITY_ID\", xmlattributes( RTRIM((select coalesce(max(pref_issr_id),'') from ft_t_issr where end_tms is null and instr_issr_id = (select instr_issr_id from ft_t_issu where end_tms is null and instr_id = (select instr_id from ft_t_isid where end_tms is null and iss_id = vnd_rqst_xref_id and (case when id_ctxt_typ = 'BB8CHR' then 'TICKER' when id_ctxt_typ = 'BBUNIQUE' then 'BB_UNIQUE' when id_ctxt_typ = 'BBGLOBAL' then 'BB_GLOBAL' else id_ctxt_typ end) = vnd_rqst_xref_id_ctxt_typ limit 1)))) AS \"VALUE\")), ";
query = query + "xmlelement(NAME \"MAIN_ENTITY_ID_CTXT_TYP\",xmlattributes( RTRIM((select coalesce(max(pref_id_ctxt_typ),'') from ft_t_issr where end_tms is null and instr_issr_id = (select instr_issr_id from ft_t_issu where end_tms is null and instr_id = (select instr_id from ft_t_isid where end_tms is null and iss_id = vnd_rqst_xref_id and (case when id_ctxt_typ = 'BB8CHR' then 'TICKER' when id_ctxt_typ = 'BBUNIQUE' then 'BB_UNIQUE' when id_ctxt_typ = 'BBGLOBAL' then 'BB_GLOBAL' else id_ctxt_typ end)= vnd_rqst_xref_id_ctxt_typ limit 1)))) AS \"VALUE\")), ";
query = query + "xmlelement(NAME \"MAIN_ENTITY_TBL_TYP\",xmlattributes('ISSR' AS \"VALUE\"))), ";
query = query + "xmlelement(NAME \"SEGMENT\", xmlattributes( 'Issuer' AS \"TYPE\", 'REFERENCE' AS \"ACTION\"), ";
query = query + "xmlelement(NAME \"Issuer\", xmlelement(NAME \"INSTRISSRID\", ";
query = query + "xmlattributes( RTRIM((select instr_issr_id from ft_t_issu where end_tms is null and instr_id = (select instr_id from ft_t_isid where end_tms is null and iss_id = vnd_rqst_xref_id and (case when id_ctxt_typ = 'BB8CHR' then 'TICKER' when id_ctxt_typ = 'BBUNIQUE' then 'BB_UNIQUE' when id_ctxt_typ = 'BBGLOBAL' then 'BB_GLOBAL' else id_ctxt_typ end) = vnd_rqst_xref_id_ctxt_typ limit 1))) AS \"VALUE\")), ";
query = query + "xmlelement(NAME \"LASTCHGUSRID\",xmlattributes(CAST(vnd_rqstr_id AS TEXT) AS \"VALUE\")))),  ";
query = query + "xmlelement(NAME \"SEGMENT\", xmlattributes( 'ISSRIssuerGroupParticipant' AS \"TYPE\", 'UNKNOWN' AS \"ACTION\"), xmlelement(NAME \"ISSRIssuerGroupParticipant\",  ";
query = query + "xmlelement(NAME \"PRNTISSRGRPOID\", xmlattributes( (case ";
query = query + " when (select org_id from ft_t_isgr where FT_T_ISGR.GRP_NME = vrpm.VND_RQST_PARM_VAL_TXT) = 'MHSS' then (SELECT ISSR_GRP_OID FROM FT_T_IRGR WHERE ORG_ID = 'MHSS') ";
query = query + " when (select org_id from ft_t_isgr where FT_T_ISGR.GRP_NME = vrpm.VND_RQST_PARM_VAL_TXT) = 'MHBK' then (SELECT ISSR_GRP_OID FROM FT_T_IRGR WHERE ORG_ID = 'MHBK') ";
query = query + " when (select org_id from ft_t_isgr where FT_T_ISGR.GRP_NME = vrpm.VND_RQST_PARM_VAL_TXT) = 'MBE' then (SELECT ISSR_GRP_OID FROM FT_T_IRGR WHERE ORG_ID = 'MBE') ";
query = query + " else (SELECT ISSR_GRP_OID FROM FT_T_IRGR WHERE ORG_ID = 'MHI') end) AS \"VALUE\")), xmlelement(NAME \"PRTPURPTYP\", xmlattributes( 'INTEREST' AS \"VALUE\")) ";
query = query + ")))  ";
query = query + "FROM ft_t_vreq v left join ft_t_vrpm vrpm on v.vnd_rqst_oid = vrpm.vnd_rqst_oid and vrpm.VND_RQST_PARM_KEY_ID like 'SOI%' where vnd_rqst_typ != 'Generic' ";
query = query + "and coalesce(vnd_rqst_stat_typ,'x') != 'Could not determine Request Type. Please check the log file and configuration.'  ";
query = query + "and trn_id =  '" + trnId +"'" ;</objectValue>
<type>CONSTANT</type>
</item>
<item id="263" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="264">["query"]@java/lang/Integer@</UITypeHint>
<input>false</input>
<name id="265">variables["query"]</name>
<stringValue id="266">ioiQuery</stringValue>
<type>VARIABLE</type>
</item>
<item id="267" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="268">["trnId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="269">variables["trnId"]</name>
<stringValue id="270">RequestTrid</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="271" type="java.util.HashSet">
<item idref="253" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="272" type="java.util.HashSet">
<item id="273" type="com.j2fe.workflow.definition.Transition">
<name id="274">goto-next</name>
<source idref="255"/>
<target id="275">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="276"/>
<directJoin>false</directJoin>
<name id="277">IOI REAL message</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="278">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="279" type="java.util.HashSet">
<item id="280" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="281">["PublishFlag"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="282">input["PublishFlag"]</name>
<objectValue id="283" type="java.lang.String">Y</objectValue>
<type>CONSTANT</type>
</item>
<item id="284" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="285">["sqlSelect"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="286">input["sqlSelect"]</name>
<stringValue id="287">ioiQuery</stringValue>
<type>VARIABLE</type>
</item>
<item id="288" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="289">name</name>
<stringValue id="290">RealMessageProcessing</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<persistentVariables id="291" type="java.util.HashSet">
<item id="292" type="java.lang.String">ioiQuery
1000</item>
</persistentVariables>
<sources id="293" type="java.util.HashSet">
<item idref="273" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="294" type="java.util.HashSet">
<item id="295" type="com.j2fe.workflow.definition.Transition">
<name id="296">goto-next</name>
<source idref="275"/>
<target id="297">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="298"/>
<directJoin>false</directJoin>
<name id="299">Additional Identifier to add?</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="300">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="301" type="java.util.HashSet">
<item id="302" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="303">database</name>
<stringValue id="304">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="305" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="306">firstColumnsResult</name>
<stringValue id="307">ignoreMe</stringValue>
<type>VARIABLE</type>
</item>
<item id="308" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="309">[0]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="310">indexedParameters[0]</name>
<stringValue id="311">RequestTrid</stringValue>
<type>VARIABLE</type>
</item>
<item id="312" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="313">querySQL</name>
<stringValue id="314">SELECT VND_RQST_OID FROM ft_t_vreq v WHERE vnd_rqst_typ != 'Generic'   AND split_part(COALESCE(USR_RQST_ID, 'x'), ',', 1) = 'cmfSOIAddition' AND COALESCE(vnd_rqst_stat_typ, 'x') != 'Could not determine Request Type. Please check the log file and configuration.'   AND trn_id = ?</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="315" type="java.util.HashSet">
<item idref="295" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="316" type="java.util.HashSet">
<item id="317" type="com.j2fe.workflow.definition.Transition">
<name id="318">nothing-found</name>
<source idref="297"/>
<target id="319">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="320"/>
<directJoin>false</directJoin>
<name id="321">no Identifier to Add</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="322">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="323" type="java.util.HashSet">
<item idref="317" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="324" type="java.util.HashSet">
<item id="325" type="com.j2fe.workflow.definition.Transition">
<name id="326">goto-next</name>
<source idref="319"/>
<target id="327">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="328">Automatically generated</description>
<directJoin>false</directJoin>
<name id="329">merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="330">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="331" type="java.util.HashSet">
<item id="332" type="com.j2fe.workflow.definition.Transition">
<name id="333">goto-next</name>
<source id="334">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="335"/>
<directJoin>false</directJoin>
<name id="336">Identifier REAL message</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="337">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="338" type="java.util.HashSet">
<item id="339" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="340">["PublishFlag"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="341">input["PublishFlag"]</name>
<objectValue id="342" type="java.lang.String">N</objectValue>
<type>CONSTANT</type>
</item>
<item id="343" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="344">["sqlSelect"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="345">input["sqlSelect"]</name>
<stringValue id="346">newIdentifierQuery</stringValue>
<type>VARIABLE</type>
</item>
<item id="347" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="348">name</name>
<stringValue id="349">RealMessageProcessing</stringValue>
<type>CONSTANT</type>
</item>
<item id="350" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="351">output["TransactionIDList"]</name>
<stringValue id="352">TransactionIDList</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="353" type="java.util.HashSet">
<item id="354" type="com.j2fe.workflow.definition.Transition">
<name id="355">goto-next</name>
<source id="356">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="357"/>
<directJoin>false</directJoin>
<name id="358">Identifier REAL Query</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="359">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="360" type="java.util.HashSet">
<item id="361" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="362">statements</name>
<objectValue id="363" type="java.lang.String">query = "";&#13;
query = query + "SELECT distinct '&lt;!DOCTYPE STREET_REF SYSTEM \"fti://repository/dtd/STREET_REF\"&gt;' || ";&#13;
query = query + "xmlelement(NAME \"STREET_REF\",xmlattributes( 'GUEST' AS \"USERID\"), ";&#13;
query = query + "xmlelement(NAME \"HEADER\", ";&#13;
query = query + "xmlelement(NAME \"MAIN_ENTITY_ID\", xmlattributes( vnd_rqst_xref_id AS \"VALUE\")), ";&#13;
query = query + "xmlelement(NAME \"MAIN_ENTITY_ID_CTXT_TYP\",xmlattributes(vnd_rqst_xref_id_ctxt_typ AS \"VALUE\")), ";&#13;
query = query + "xmlelement(NAME \"DATASOURCE\",xmlattributes('cmfSOI' AS \"VALUE\")), ";&#13;
query = query + "xmlelement(NAME \"MAIN_ENTITY_TBL_TYP\",xmlattributes('ISSU' AS \"VALUE\"))), ";&#13;
query = query + "xmlelement(NAME \"SEGMENT\", xmlattributes( 'Issue' AS \"TYPE\", 'REFERENCE' AS \"ACTION\"),  ";&#13;
query = query + "xmlelement(NAME \"Issue\", xmlelement(NAME \"INSTRID\",  ";&#13;
query = query + "xmlattributes( RTRIM((select instr_id from ft_t_isid where end_tms is null and iss_id = vnd_rqst_xref_id and "; query = query + "(case when id_ctxt_typ = 'BB8CHR' then 'TICKER' when id_ctxt_typ = 'BBUNIQUE' then 'BB_UNIQUE' when id_ctxt_typ = 'BBGLOBAL' then 'BB_GLOBAL' else id_ctxt_typ end)= vnd_rqst_xref_id_ctxt_typ limit 1)) AS \"VALUE\")), ";&#13;
query = query + "xmlelement(NAME \"LASTCHGUSRID\",xmlattributes(CAST(vnd_rqstr_id AS TEXT) AS \"VALUE\")))),  ";&#13;
query = query + "( SELECT XMLAGG (xmlelement(NAME \"SEGMENT\", xmlattributes( 'IssueIdentifier' AS \"TYPE\", 'UNKNOWN' AS \"ACTION\"),  ";&#13;
query = query + "xmlelement(NAME \"IssueIdentifier\", ";&#13;
query = query + "xmlelement(NAME \"IDCTXTTYP\", xmlattributes( (REGEXP_SUBSTR(USR_RQST_ID, '[^,]+', 1, 3)) AS \"VALUE\")),  ";&#13;
query = query + "xmlelement(NAME \"ISSID\", xmlattributes( (REGEXP_SUBSTR(USR_RQST_ID, '[^,]+', 1, 2)) AS \"VALUE\")), ";&#13;
query = query + "xmlelement(NAME \"DATASTATTYP\", xmlattributes( 'ACTIVE' AS \"VALUE\")),    ";&#13;
query = query + "xmlelement(NAME \"LASTCHGUSRID\",xmlattributes(vnd_rqstr_id AS \"VALUE\"))))) ";&#13;
query = query + "FROM ft_t_vrpm p ";&#13;
query = query + "WHERE 1=1  and v.VND_RQST_OID = p.VND_RQST_OID ";&#13;
query = query + "and p.VND_RQST_PARM_KEY_ID like 'SOI%'))  ";&#13;
query = query + "FROM ft_t_vreq v where vnd_rqst_typ != 'Generic' ";&#13;
query = query + "and REGEXP_SUBSTR(coalesce(USR_RQST_ID,'x'), '[^,]+', 1, 1) = 'cmfSOIAddition' ";&#13;
query = query + "and coalesce(vnd_rqst_stat_typ,'x') != 'Could not determine Request Type. Please check the log file and configuration.'  ";&#13;
query = query + "and trn_id =  '" + trnId +"'" ;&#13;
query = query + " group by v.vnd_rqst_xref_id, v.vnd_rqst_xref_id_ctxt_typ, v.vnd_rqstr_id, v.vnd_rqst_oid ";</objectValue>
<type>CONSTANT</type>
</item>
<item id="364" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="365">["query"]@java/lang/Integer@</UITypeHint>
<input>false</input>
<name id="366">variables["query"]</name>
<stringValue id="367">newIdentifierQuery</stringValue>
<type>VARIABLE</type>
</item>
<item id="368" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="369">["trnId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="370">variables["trnId"]</name>
<stringValue id="371">RequestTrid</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="372" type="java.util.HashSet">
<item id="373" type="com.j2fe.workflow.definition.Transition">
<name id="374">goto-next</name>
<source id="375">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="376"/>
<directJoin>false</directJoin>
<name id="377">Identifier to Add</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="378">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="379" type="java.util.HashSet">
<item id="380" type="com.j2fe.workflow.definition.Transition">
<name id="381">rows-found</name>
<source idref="297"/>
<target idref="375"/>
</item>
</sources>
<targets id="382" type="java.util.HashSet">
<item idref="373" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="356"/>
</item>
</sources>
<targets id="383" type="java.util.HashSet">
<item idref="354" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="334"/>
</item>
</sources>
<targets id="384" type="java.util.HashSet">
<item idref="332" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="327"/>
</item>
<item idref="325" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="385" type="java.util.HashSet">
<item id="386" type="com.j2fe.workflow.definition.Transition">
<name id="387">ToSplit</name>
<source idref="327"/>
<target id="388">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="389"/>
<directJoin>false</directJoin>
<name id="390">SOI REAL Query</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="391">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="392" type="java.util.HashSet">
<item id="393" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="394">statements</name>
<objectValue id="395" type="java.lang.String">query = "SELECT distinct '&lt;!DOCTYPE STREET_REF SYSTEM \"fti://repository/dtd/STREET_REF\"&gt;' || ";&#13;
query = query + "xmlelement(NAME \"STREET_REF\",xmlattributes( 'GUEST' AS \"USERID\"), ";&#13;
query = query + "xmlelement(NAME \"HEADER\", ";&#13;
query = query + "xmlelement(NAME \"MAIN_ENTITY_ID\", xmlattributes( vnd_rqst_xref_id AS \"VALUE\")), ";&#13;
query = query + "xmlelement(NAME \"MAIN_ENTITY_ID_CTXT_TYP\",xmlattributes(vnd_rqst_xref_id_ctxt_typ AS \"VALUE\")), ";&#13;
query = query + "xmlelement(NAME \"DATASOURCE\",xmlattributes('cmfSOI' AS \"VALUE\")), ";&#13;
query = query + "xmlelement(NAME \"MAIN_ENTITY_TBL_TYP\",xmlattributes('ISSU' AS \"VALUE\"))), ";&#13;
query = query + "xmlelement(NAME \"SEGMENT\", xmlattributes( 'Issue' AS \"TYPE\", 'REFERENCE' AS \"ACTION\"),  ";&#13;
query = query + "xmlelement(NAME \"Issue\", xmlelement(NAME \"INSTRID\",  ";&#13;
query = query + "xmlattributes( RTRIM((select instr_id from ft_t_isid where end_tms is null and iss_id = vnd_rqst_xref_id and (case when id_ctxt_typ = 'BB8CHR' then 'TICKER' when id_ctxt_typ = 'BBUNIQUE' then 'BB_UNIQUE' when id_ctxt_typ = 'BBGLOBAL' then 'BB_GLOBAL' else id_ctxt_typ end)= vnd_rqst_xref_id_ctxt_typ limit 1)) AS \"VALUE\")), ";&#13;
query = query + "xmlelement(NAME \"LASTCHGUSRID\",xmlattributes(CAST(vnd_rqstr_id AS TEXT) AS \"VALUE\")))),  ";&#13;
query = query + "( SELECT XMLAGG (xmlelement(NAME \"SEGMENT\", xmlattributes( 'ISSUIssueGroupParticipant' AS \"TYPE\", 'UNKNOWN' AS \"ACTION\"),  ";&#13;
query = query + "xmlelement(NAME \"ISSUIssueGroupParticipant\", xmlelement(NAME \"PRNTISSGRPOID\", xmlattributes( (select iss_grp_oid from fT_T_isgr where grp_nme = vnd_rqst_parm_val_txt) AS \"VALUE\")),  ";&#13;
query = query + "xmlelement(NAME \"PRTPURPTYP\", xmlattributes( 'INTEREST' AS \"VALUE\")),  ";&#13;
query = query + "xmlelement(NAME \"DATASTATTYP\", xmlattributes( 'ACTIVE' AS \"VALUE\")),  ";  &#13;
query = query + "xmlelement(NAME \"LASTCHGUSRID\",xmlattributes(vnd_rqstr_id AS \"VALUE\"))))) ";&#13;
query = query + "FROM ft_t_vrpm p ";&#13;
query = query + "WHERE 1=1  and v.VND_RQST_OID = p.VND_RQST_OID ";&#13;
query = query + "and p.VND_RQST_PARM_KEY_ID like 'SOI%'))  ";&#13;
query = query + "FROM ft_t_vreq v where vnd_rqst_typ != 'Generic' ";&#13;
query = query + "and coalesce(vnd_rqst_stat_typ,'x') != 'Could not determine Request Type. Please check the log file and configuration.'  ";&#13;
query = query + "and trn_id =  '" + trnId +"'" ;</objectValue>
<type>CONSTANT</type>
</item>
<item id="396" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="397">["query"]@java/lang/Integer@</UITypeHint>
<input>false</input>
<name id="398">variables["query"]</name>
<stringValue id="399">soiQuery</stringValue>
<type>VARIABLE</type>
</item>
<item id="400" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="401">["trnId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="402">variables["trnId"]</name>
<stringValue id="403">RequestTrid</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="404" type="java.util.HashSet">
<item idref="386" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="405" type="java.util.HashSet">
<item id="406" type="com.j2fe.workflow.definition.Transition">
<name id="407">goto-next</name>
<source idref="388"/>
<target id="408">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="409"/>
<directJoin>false</directJoin>
<name id="410">SOI REAL message</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="411">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="412" type="java.util.HashSet">
<item id="413" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="414">["PublishFlag"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="415">input["PublishFlag"]</name>
<objectValue id="416" type="java.lang.String">N</objectValue>
<type>CONSTANT</type>
</item>
<item id="417" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="418">["sqlSelect"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="419">input["sqlSelect"]</name>
<stringValue id="420">soiQuery</stringValue>
<type>VARIABLE</type>
</item>
<item id="421" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="422">name</name>
<stringValue id="423">RealMessageProcessing</stringValue>
<type>CONSTANT</type>
</item>
<item id="424" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="425">output["TransactionIDList"]</name>
<stringValue id="426">TransactionIDList</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="427" type="java.util.HashSet">
<item idref="406" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="428" type="java.util.HashSet">
<item id="429" type="com.j2fe.workflow.definition.Transition">
<name id="430">goto-next</name>
<source idref="408"/>
<target idref="10"/>
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
<item idref="380" type="com.j2fe.workflow.definition.Transition"/>
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
</targets>
<type>ACTIVITY</type>
</target>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item idref="180" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="175"/>
</item>
</sources>
<targets id="431" type="java.util.HashSet">
<item idref="173" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="156"/>
</item>
</sources>
<targets id="432" type="java.util.HashSet">
<item idref="154" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="131"/>
</item>
</sources>
<targets id="433" type="java.util.HashSet">
<item idref="129" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="112"/>
</item>
</sources>
<targets id="434" type="java.util.HashSet">
<item idref="110" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="87"/>
</item>
</sources>
<targets id="435" type="java.util.HashSet">
<item idref="85" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="64"/>
</item>
</sources>
<targets id="436" type="java.util.HashSet">
<item id="437" type="com.j2fe.workflow.definition.Transition">
<name id="438">N</name>
<source idref="64"/>
<target id="439">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="440"/>
<directJoin>false</directJoin>
<name id="441">SOI REAL Query</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="442">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="443" type="java.util.HashSet">
<item id="444" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="445">statements</name>
<objectValue id="446" type="java.lang.String">query = "SELECT distinct '&lt;!DOCTYPE STREET_REF SYSTEM \"fti://repository/dtd/STREET_REF\"&gt;' || ";&#13;
query = query + "xmlelement(NAME \"STREET_REF\",xmlattributes( 'GUEST' AS \"USERID\"), ";&#13;
query = query + "xmlelement(NAME \"HEADER\", ";&#13;
query = query + "xmlelement(NAME \"MAIN_ENTITY_ID\", xmlattributes( (STRING_TO_ARRAY(event_value, ','))[2] AS \"VALUE\")), ";&#13;
query = query + "xmlelement(NAME \"MAIN_ENTITY_ID_CTXT_TYP\",xmlattributes( (STRING_TO_ARRAY(event_value, ','))[1] AS \"VALUE\")), xmlelement(NAME \"DATASOURCE\",xmlattributes('cmfSOI' AS \"VALUE\")), ";&#13;
query = query + "xmlelement(NAME \"MAIN_ENTITY_TBL_TYP\",xmlattributes('ISSU' AS \"VALUE\"))), xmlelement(NAME \"SEGMENT\", xmlattributes( 'Issue' AS \"TYPE\", 'REFERENCE' AS \"ACTION\"), ";&#13;
query = query + "xmlelement(NAME \"Issue\", xmlelement(NAME \"INSTRID\",  xmlattributes( (select rtrim(instr_id) from ft_t_isid where (case when id_ctxt_typ = 'BB8CHR' then 'TICKER' when id_ctxt_typ = 'BBUNIQUE' then 'BB_UNIQUE' when id_ctxt_typ = 'BBGLOBAL' then 'BB_GLOBAL' else id_ctxt_typ end)=(STRING_TO_ARRAY(event_value, ','))[1] and iss_id=(STRING_TO_ARRAY(event_value, ','))[2] AND end_tms IS NULL limit 1)AS \"VALUE\")), ";&#13;
query = query + "xmlelement(NAME \"LASTCHGUSRID\",xmlattributes(((STRING_TO_ARRAY(event_value, ','))[3]) AS \"VALUE\")))),( SELECT XMLAGG (";&#13;
query = query + "xmlelement(NAME \"SEGMENT\", xmlattributes( 'ISSUIssueGroupParticipant' AS \"TYPE\", 'UNKNOWN' AS \"ACTION\"),  xmlelement(NAME \"ISSUIssueGroupParticipant\", xmlelement(NAME \"PRNTISSGRPOID\", xmlattributes( (select iss_grp_oid from fT_T_isgr where grp_nme = ((STRING_TO_ARRAY(event_value, ','))[4])) AS \"VALUE\")),  xmlelement(NAME \"PRTPURPTYP\", xmlattributes( 'INTEREST' AS \"VALUE\")), xmlelement(NAME \"DATASTATTYP\", xmlattributes( 'ACTIVE' AS \"VALUE\")), ";&#13;
query = query + "xmlelement(NAME \"LASTCHGUSRID\",xmlattributes(((STRING_TO_ARRAY(event_value, ','))[3]) AS \"VALUE\"))))) ";&#13;
query = query + "FROM mhi_tb_eventlog m1 where event_job_id='"+ eventJobId +"' and event_creator='cmfSOIAdditionFilter Workflow' and event_desc='INSTRUMENT EXISTS' and m1.event_id=m2.event_id and ((STRING_TO_ARRAY(event_value, ','))[8]) like 'SOI%')) FROM mhi_tb_eventlog m2 where event_job_id='"+ eventJobId +"' and event_creator='cmfSOIAdditionFilter Workflow' and event_desc in ('INSTRUMENT EXISTS','INSTRUMENT NOT EXISTS') ";</objectValue>
<type>CONSTANT</type>
</item>
<item id="447" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="448">["eventJobId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="449">variables["eventJobId"]</name>
<stringValue id="450">EventJobId</stringValue>
<type>VARIABLE</type>
</item>
<item id="451" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="452">["query"]@java/lang/Integer@</UITypeHint>
<input>false</input>
<name id="453">variables["query"]</name>
<stringValue id="454">soiQuery</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="455" type="java.util.HashSet">
<item idref="437" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="456" type="java.util.HashSet">
<item id="457" type="com.j2fe.workflow.definition.Transition">
<name id="458">goto-next</name>
<source idref="439"/>
<target idref="17"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item idref="62" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="45"/>
</item>
</sources>
<targets id="459" type="java.util.HashSet">
<item idref="43" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="17"/>
</item>
<item idref="457" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="460" type="java.util.HashSet">
<item idref="15" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="10"/>
</item>
<item idref="429" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="461" type="java.util.HashSet">
<item idref="8" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="3"/>
</item>
</sources>
<targets id="462" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="463">Mizuho</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="464">user1</lastChangeUser>
<lastUpdate id="465">2025-10-01T13:02:12.000+0100</lastUpdate>
<name id="466">AddToInventoryAndPublish</name>
<nodes id="467" type="java.util.HashSet">
<item idref="297" type="com.j2fe.workflow.definition.Node"/>
<item idref="45" type="com.j2fe.workflow.definition.Node"/>
<item idref="255" type="com.j2fe.workflow.definition.Node"/>
<item idref="112" type="com.j2fe.workflow.definition.Node"/>
<item idref="275" type="com.j2fe.workflow.definition.Node"/>
<item idref="87" type="com.j2fe.workflow.definition.Node"/>
<item idref="356" type="com.j2fe.workflow.definition.Node"/>
<item idref="334" type="com.j2fe.workflow.definition.Node"/>
<item idref="375" type="com.j2fe.workflow.definition.Node"/>
<item idref="439" type="com.j2fe.workflow.definition.Node"/>
<item idref="388" type="com.j2fe.workflow.definition.Node"/>
<item idref="17" type="com.j2fe.workflow.definition.Node"/>
<item idref="408" type="com.j2fe.workflow.definition.Node"/>
<item idref="196" type="com.j2fe.workflow.definition.Node"/>
<item idref="3" type="com.j2fe.workflow.definition.Node"/>
<item idref="64" type="com.j2fe.workflow.definition.Node"/>
<item idref="182" type="com.j2fe.workflow.definition.Node"/>
<item idref="156" type="com.j2fe.workflow.definition.Node"/>
<item idref="213" type="com.j2fe.workflow.definition.Node"/>
<item idref="233" type="com.j2fe.workflow.definition.Node"/>
<item idref="131" type="com.j2fe.workflow.definition.Node"/>
<item idref="205" type="com.j2fe.workflow.definition.Node"/>
<item idref="175" type="com.j2fe.workflow.definition.Node"/>
<item idref="10" type="com.j2fe.workflow.definition.Node"/>
<item idref="327" type="com.j2fe.workflow.definition.Node"/>
<item idref="319" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>true</optimize>
<parameter id="468" type="java.util.HashMap">
<entry>
<key id="469" type="java.lang.String">EventJobId</key>
<value id="470" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="471">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="472">Event Job ID from mhi_tb_eventlog - used for cmfSOIAdditionFilter</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="473" type="java.lang.String">OverridePublishingCheck</key>
<value id="474" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="475">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="476">Publish Entities even though there is No Change
Possible values Y or N</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="477" type="java.lang.String">PublishAssets</key>
<value id="478" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="479">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="480" type="java.lang.String">RequestTrid</key>
<value id="481" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="482">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="483" type="java.lang.String">TransactionIDList</key>
<value id="484" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="485">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>false</input>
<output>true</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="486" type="java.lang.String">TriggeredByBBPerSecurityBatch</key>
<value id="487" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="488">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="489" type="java.lang.String">TriggeredByCmfSOIAdditionFilter</key>
<value id="490" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="491">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
</parameter>
<permissions id="492" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>false</purgeAtEnd>
<retries>0</retries>
<startNode idref="196"/>
<status>RELEASED</status>
<variables id="493" type="java.util.HashMap">
<entry>
<key id="494" type="java.lang.String">EventJobId</key>
<value id="495" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="496">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="497">Event Job ID from mhi_tb_eventlog - used for cmfSOIAdditionFilter</description>
<persistent>true</persistent>
</value>
</entry>
<entry>
<key id="498" type="java.lang.String">OverridePublishingCheck</key>
<value id="499" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="500">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="501">Publish Entities even though there is No Change
Possible values Y or N</description>
<persistent>true</persistent>
<value id="502" type="java.lang.String">N</value>
</value>
</entry>
<entry>
<key id="503" type="java.lang.String">PublishAssets</key>
<value id="504" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="505">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>true</persistent>
<value id="506" type="java.lang.String">Y</value>
</value>
</entry>
<entry>
<key id="507" type="java.lang.String">RequestTrid</key>
<value id="508" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="509">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>true</persistent>
</value>
</entry>
<entry>
<key id="510" type="java.lang.String">TransactionIDList</key>
<value id="511" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="512">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="513" type="java.lang.String">TriggeredByBBPerSecurityBatch</key>
<value id="514" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="515">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>true</persistent>
<value id="516" type="java.lang.String">N</value>
</value>
</entry>
<entry>
<key id="517" type="java.lang.String">TriggeredByCmfSOIAdditionFilter</key>
<value id="518" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="519">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>true</persistent>
<value id="520" type="java.lang.String">N</value>
</value>
</entry>
</variables>
<version>23</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
