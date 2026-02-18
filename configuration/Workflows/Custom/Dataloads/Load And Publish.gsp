<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.04">
<package-comment/>
<businessobject displayString="19 - V-10 Raise remote event for publishing" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>true</alwaysPersist>
<clustered>false</clustered>
<comment id="1">V-10 Raise remote event for publishing</comment>
<endNode id="2">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="3"/>
<directJoin>false</directJoin>
<name id="4">Stop</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="5">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="6" type="java.util.HashSet">
<item id="7" type="com.j2fe.workflow.definition.Transition">
<name id="8">goto-next</name>
<source id="9">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="10"/>
<directJoin>false</directJoin>
<name id="11">Add MHBKLDN UP Issuer to IOI</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="12">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="13" type="java.util.HashSet">
<item id="14" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="15">["sqlSelect"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="16">input["sqlSelect"]</name>
<stringValue id="17">sqlSelect</stringValue>
<type>VARIABLE</type>
</item>
<item id="18" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="19">name</name>
<stringValue id="20">RealMessageProcessing</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="21" type="java.util.HashSet">
<item id="22" type="com.j2fe.workflow.definition.Transition">
<name id="23">goto-next</name>
<source id="24">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="25"/>
<directJoin>false</directJoin>
<name id="26">Build MHBK UP SQL Select</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="27">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="28" type="java.util.HashSet">
<item id="29" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="30">statements</name>
<objectValue id="31" type="java.lang.String">String sqlSelect = "SELECT '&lt;!DOCTYPE STREET_REF SYSTEM \"fti://repository/dtd/STREET_REF\"&gt;' || XMLElement(NAME \"STREET_REF\",XMLAttributes( 'GUEST' AS \"USERID\"), ";
sqlSelect = sqlSelect  + "XMLElement(NAME \"HEADER\", XMLElement(NAME \"USERID\", XMLAttributes( 'AddUpToIOI' AS \"VALUE\")), XMLElement(NAME \"MAIN_ENTITY_TBL_TYP\", XMLAttributes( 'ISSR' AS \"VALUE\"))), ";
sqlSelect = sqlSelect  + "XMLElement(NAME \"SEGMENT\", XMLAttributes( 'Issuer' AS \"TYPE\", 'REFERENCE' AS \"ACTION\"), ";
sqlSelect = sqlSelect  + "XMLElement(NAME \"Issuer\", XMLElement(NAME \"INSTRISSRID\", XMLAttributes( RTRIM(ft_t_issr.instr_issr_id) AS \"VALUE\")))), ";
sqlSelect = sqlSelect  + "XMLElement(NAME \"SEGMENT\", XMLAttributes( 'ISSRIssuerGroupParticipant' AS \"TYPE\", 'UNKNOWN' AS \"ACTION\"), XMLElement(NAME \"ISSRIssuerGroupParticipant\", ";
sqlSelect = sqlSelect  + "XMLElement(NAME \"PRNTISSRGRPOID\", XMLAttributes( 'IRGR000026' AS \"VALUE\")), XMLElement(NAME \"PRTPURPTYP\", XMLAttributes( 'INTEREST' AS \"VALUE\")) ";
sqlSelect = sqlSelect  + "))) FROM ft_t_issr ft_t_issr ";
sqlSelect = sqlSelect  + "WHERE ( ft_t_issr.END_TMS IS NULL OR ft_t_issr.END_TMS &gt; sysdate()) ";
sqlSelect = sqlSelect  + "and instr_issr_id not in (select instr_issr_id from ft_t_irgp where end_tms is null and PRNT_ISSR_GRP_OID = 'IRGR000026') ";
sqlSelect = sqlSelect  + "and instr_issr_id in (select instr_issr_id from ft_t_issr j where j.FINS_INST_MNEM in ( ";
sqlSelect = sqlSelect  + "select mhi_fins_up(fins_inst_mnem) from ft_t_issr i where i.instr_issr_id in (select instr_issr_id from ft_t_issu where end_tms is null and instr_id in (SELECT p.instr_id ";
sqlSelect = sqlSelect  + "FROM ft_t_isgp p, ft_t_isgr g ";
sqlSelect = sqlSelect  + "WHERE    1=1 ";
sqlSelect = sqlSelect  + "AND g.iss_grp_oid = p.prnt_iss_grp_oid ";
sqlSelect = sqlSelect  + "AND p.prt_purp_typ = 'INTEREST' and g.GRP_PURP_TYP = 'INTEREST' AND g.org_id in ('MHBK') ";
sqlSelect = sqlSelect  + "AND p.end_tms IS NULL ";
sqlSelect = sqlSelect  + "AND g.end_tms IS NULL)))) ";</objectValue>
<type>CONSTANT</type>
</item>
<item id="32" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="33">variables["sqlSelect"]</name>
<stringValue id="34">sqlSelect</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="35" type="java.util.HashSet">
<item id="36" type="com.j2fe.workflow.definition.Transition">
<name id="37">goto-next</name>
<source id="38">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="39"/>
<directJoin>false</directJoin>
<name id="40">Add MHSS UP Issuer to IOI</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="41">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="42" type="java.util.HashSet">
<item id="43" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="44">["sqlSelect"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="45">input["sqlSelect"]</name>
<stringValue id="46">sqlSelect</stringValue>
<type>VARIABLE</type>
</item>
<item id="47" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="48">name</name>
<stringValue id="49">RealMessageProcessing</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="50" type="java.util.HashSet">
<item id="51" type="com.j2fe.workflow.definition.Transition">
<name id="52">goto-next</name>
<source id="53">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="54"/>
<directJoin>false</directJoin>
<name id="55">Build MHSS UP SQL Select</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="56">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="57" type="java.util.HashSet">
<item id="58" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="59">statements</name>
<objectValue id="60" type="java.lang.String">String sqlSelect = "SELECT '&lt;!DOCTYPE STREET_REF SYSTEM \"fti://repository/dtd/STREET_REF\"&gt;' || XMLElement(NAME \"STREET_REF\",XMLAttributes( 'GUEST' AS \"USERID\"), ";
sqlSelect = sqlSelect  + "XMLElement(NAME \"HEADER\", XMLElement(NAME \"USERID\", XMLAttributes( 'AddUpToIOI' AS \"VALUE\")), XMLElement(NAME \"MAIN_ENTITY_TBL_TYP\", XMLAttributes( 'ISSR' AS \"VALUE\"))), ";
sqlSelect = sqlSelect  + "XMLElement(NAME \"SEGMENT\", XMLAttributes( 'Issuer' AS \"TYPE\", 'REFERENCE' AS \"ACTION\"), ";
sqlSelect = sqlSelect  + "XMLElement(NAME \"Issuer\", XMLElement(NAME \"INSTRISSRID\", XMLAttributes( RTRIM(ft_t_issr.instr_issr_id) AS \"VALUE\")))), ";
sqlSelect = sqlSelect  + "XMLElement(NAME \"SEGMENT\", XMLAttributes( 'ISSRIssuerGroupParticipant' AS \"TYPE\", 'UNKNOWN' AS \"ACTION\"), XMLElement(NAME \"ISSRIssuerGroupParticipant\", ";
sqlSelect = sqlSelect  + "XMLElement(NAME \"PRNTISSRGRPOID\", XMLAttributes( 'IRGR000016' AS \"VALUE\")), XMLElement(NAME \"PRTPURPTYP\", XMLAttributes( 'INTEREST' AS \"VALUE\")) ";
sqlSelect = sqlSelect  + "))) FROM ft_t_issr ft_t_issr ";
sqlSelect = sqlSelect  + "WHERE ( ft_t_issr.END_TMS IS NULL OR ft_t_issr.END_TMS &gt; sysdate() ) ";
sqlSelect = sqlSelect  + "and instr_issr_id not in (select instr_issr_id from ft_t_irgp where end_tms is null and PRNT_ISSR_GRP_OID = 'IRGR000016') ";
sqlSelect = sqlSelect  + "and instr_issr_id in (select instr_issr_id from ft_t_issr j where j.FINS_INST_MNEM in ( ";
sqlSelect = sqlSelect  + "select mhi_fins_up(fins_inst_mnem) from ft_t_issr i where i.instr_issr_id in (select instr_issr_id from ft_t_issu where end_tms is null and instr_id in (SELECT p.instr_id ";
sqlSelect = sqlSelect  + "FROM ft_t_isgp p, ft_t_isgr g ";
sqlSelect = sqlSelect  + "WHERE    1=1 ";
sqlSelect = sqlSelect  + "AND g.iss_grp_oid = p.prnt_iss_grp_oid ";
sqlSelect = sqlSelect  + "AND p.prt_purp_typ = 'INTEREST' and g.GRP_PURP_TYP = 'INTEREST' AND g.org_id in('MHSS') ";
sqlSelect = sqlSelect  + "AND p.end_tms IS NULL ";
sqlSelect = sqlSelect  + "AND g.end_tms IS NULL)))) ";</objectValue>
<type>CONSTANT</type>
</item>
<item id="61" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="62">variables["sqlSelect"]</name>
<stringValue id="63">sqlSelect</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="64" type="java.util.HashSet">
<item id="65" type="com.j2fe.workflow.definition.Transition">
<name id="66">goto-next</name>
<source id="67">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="68"/>
<directJoin>false</directJoin>
<name id="69">Add MHI/MHEU UP Issuer to IOI</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="70">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="71" type="java.util.HashSet">
<item id="72" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="73">["sqlSelect"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="74">input["sqlSelect"]</name>
<stringValue id="75">sqlSelect</stringValue>
<type>VARIABLE</type>
</item>
<item id="76" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="77">name</name>
<stringValue id="78">RealMessageProcessing</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="79" type="java.util.HashSet">
<item id="80" type="com.j2fe.workflow.definition.Transition">
<name id="81">goto-next</name>
<source id="82">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="83"/>
<directJoin>false</directJoin>
<name id="84">Build MHI/MHEU UP SQL Select</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="85">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="86" type="java.util.HashSet">
<item id="87" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="88">statements</name>
<objectValue id="89" type="java.lang.String">String sqlSelect = "SELECT '&lt;!DOCTYPE STREET_REF SYSTEM \"fti://repository/dtd/STREET_REF\"&gt;' || XMLElement(NAME \"STREET_REF\",XMLAttributes( 'GUEST' AS \"USERID\"), ";
sqlSelect = sqlSelect  + "XMLElement(NAME \"HEADER\", XMLElement(NAME \"USERID\", XMLAttributes( 'AddUpToIOI' AS \"VALUE\")), XMLElement(NAME \"MAIN_ENTITY_TBL_TYP\", XMLAttributes( 'ISSR' AS \"VALUE\"))), ";
sqlSelect = sqlSelect  + "XMLElement(NAME \"SEGMENT\", XMLAttributes( 'Issuer' AS \"TYPE\", 'REFERENCE' AS \"ACTION\"), ";
sqlSelect = sqlSelect  + "XMLElement(NAME \"Issuer\", XMLElement(NAME \"INSTRISSRID\", XMLAttributes( RTRIM(ft_t_issr.instr_issr_id) AS \"VALUE\")))), ";
sqlSelect = sqlSelect  + "XMLElement(NAME \"SEGMENT\", XMLAttributes( 'ISSRIssuerGroupParticipant' AS \"TYPE\", 'UNKNOWN' AS \"ACTION\"), XMLElement(NAME \"ISSRIssuerGroupParticipant\", ";
sqlSelect = sqlSelect  + "XMLElement(NAME \"PRNTISSRGRPOID\", XMLAttributes( 'IRGR000006' AS \"VALUE\")), XMLElement(NAME \"PRTPURPTYP\", XMLAttributes( 'INTEREST' AS \"VALUE\")) ";
sqlSelect = sqlSelect  + "))) FROM ft_t_issr ft_t_issr ";
sqlSelect = sqlSelect  + "WHERE ( ft_t_issr.END_TMS IS NULL OR ft_t_issr.END_TMS &gt; sysdate() ) ";
sqlSelect = sqlSelect  + "and instr_issr_id not in (select instr_issr_id from ft_t_irgp where end_tms is null and PRNT_ISSR_GRP_OID = 'IRGR000006') ";
sqlSelect = sqlSelect  + "and instr_issr_id in (select instr_issr_id from ft_t_issr j where j.FINS_INST_MNEM in ( ";
sqlSelect = sqlSelect  + "select mhi_fins_up(fins_inst_mnem) from ft_t_issr i where i.instr_issr_id in (select instr_issr_id from ft_t_issu where end_tms is null and instr_id in (SELECT p.instr_id ";
sqlSelect = sqlSelect  + "FROM ft_t_isgp p, ft_t_isgr g ";
sqlSelect = sqlSelect  + "WHERE    1=1 ";
sqlSelect = sqlSelect  + "AND g.iss_grp_oid = p.prnt_iss_grp_oid ";
sqlSelect = sqlSelect  + "AND p.prt_purp_typ = 'INTEREST' and g.GRP_PURP_TYP = 'INTEREST' AND g.org_id in('MHI','MHEU') ";
sqlSelect = sqlSelect  + "AND p.end_tms IS NULL ";
sqlSelect = sqlSelect  + "AND g.end_tms IS NULL)))) ";</objectValue>
<type>CONSTANT</type>
</item>
<item id="90" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="91">variables["sqlSelect"]</name>
<stringValue id="92">sqlSelect</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="93" type="java.util.HashSet">
<item id="94" type="com.j2fe.workflow.definition.Transition">
<name id="95">goto-next</name>
<source id="96">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="97"/>
<directJoin>false</directJoin>
<name id="98">Add MHBK Issuer to IOI</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="99">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="100" type="java.util.HashSet">
<item id="101" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="102">["sqlSelect"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="103">input["sqlSelect"]</name>
<stringValue id="104">sqlSelect</stringValue>
<type>VARIABLE</type>
</item>
<item id="105" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="106">name</name>
<stringValue id="107">RealMessageProcessing</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="108" type="java.util.HashSet">
<item id="109" type="com.j2fe.workflow.definition.Transition">
<name id="110">goto-next</name>
<source id="111">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="112"/>
<directJoin>false</directJoin>
<name id="113">Build MHBK SQL Select</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="114">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="115" type="java.util.HashSet">
<item id="116" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="117">statements</name>
<objectValue id="118" type="java.lang.String">String sqlSelect = "SELECT '&lt;!DOCTYPE STREET_REF SYSTEM \"fti://repository/dtd/STREET_REF\"&gt;' || XMLElement(NAME \"STREET_REF\",XMLAttributes( 'GUEST' AS \"USERID\"), ";
sqlSelect = sqlSelect  + "XMLElement(NAME \"HEADER\", XMLElement(NAME \"USERID\", XMLAttributes( 'AddToIOI' AS \"VALUE\")), XMLElement(NAME \"MAIN_ENTITY_TBL_TYP\", XMLAttributes( 'ISSR' AS \"VALUE\"))),";
sqlSelect = sqlSelect  + "XMLElement(NAME \"SEGMENT\", XMLAttributes( 'Issuer' AS \"TYPE\", 'REFERENCE' AS \"ACTION\"), ";
sqlSelect = sqlSelect  + "XMLElement(NAME \"Issuer\", XMLElement(NAME \"INSTRISSRID\", XMLAttributes( RTRIM(ft_t_issr.instr_issr_id) AS \"VALUE\")))), ";
sqlSelect = sqlSelect  + "XMLElement(NAME \"SEGMENT\", XMLAttributes( 'ISSRIssuerGroupParticipant' AS \"TYPE\", 'UNKNOWN' AS \"ACTION\"), XMLElement(NAME \"ISSRIssuerGroupParticipant\", ";
sqlSelect = sqlSelect  + "XMLElement(NAME \"PRNTISSRGRPOID\", XMLAttributes( 'IRGR000026' AS \"VALUE\")), XMLElement(NAME \"PRTPURPTYP\", XMLAttributes( 'INTEREST' AS \"VALUE\"))";
sqlSelect = sqlSelect  + "))) FROM ft_t_issr ft_t_issr ";
sqlSelect = sqlSelect  + "WHERE ( ft_t_issr.END_TMS IS NULL OR ft_t_issr.END_TMS &gt; sysdate() ) ";
sqlSelect = sqlSelect  + "and instr_issr_id not in (select instr_issr_id from ft_t_irgp where end_tms is null and prnt_issr_grp_oid = 'IRGR000026') ";
sqlSelect = sqlSelect  + "and instr_issr_id in (select instr_issr_id from ft_t_issu where end_tms is null and instr_id in (SELECT p.instr_id ";
sqlSelect = sqlSelect  + "FROM ft_t_isgp p, ft_t_isgr g ";
sqlSelect = sqlSelect  + "WHERE    1=1 ";
sqlSelect = sqlSelect  + "AND g.iss_grp_oid = p.prnt_iss_grp_oid ";
sqlSelect = sqlSelect  + "AND p.prt_purp_typ = 'INTEREST' and g.GRP_PURP_TYP = 'INTEREST' AND g.org_id in ('MHBK') ";
sqlSelect = sqlSelect  + "AND p.end_tms IS NULL ";
sqlSelect = sqlSelect  + "AND g.end_tms IS NULL))";</objectValue>
<type>CONSTANT</type>
</item>
<item id="119" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="120">variables["sqlSelect"]</name>
<stringValue id="121">sqlSelect</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="122" type="java.util.HashSet">
<item id="123" type="com.j2fe.workflow.definition.Transition">
<name id="124">goto-next</name>
<source id="125">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="126"/>
<directJoin>false</directJoin>
<name id="127">Add MHSS Issuer to IOI</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="128">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="129" type="java.util.HashSet">
<item id="130" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="131">["sqlSelect"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="132">input["sqlSelect"]</name>
<stringValue id="133">sqlSelect</stringValue>
<type>VARIABLE</type>
</item>
<item id="134" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="135">name</name>
<stringValue id="136">RealMessageProcessing</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="137" type="java.util.HashSet">
<item id="138" type="com.j2fe.workflow.definition.Transition">
<name id="139">goto-next</name>
<source id="140">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="141"/>
<directJoin>false</directJoin>
<name id="142">Build MHSS SQL Select</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="143">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="144" type="java.util.HashSet">
<item id="145" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="146">statements</name>
<objectValue id="147" type="java.lang.String">String sqlSelect = "SELECT '&lt;!DOCTYPE STREET_REF SYSTEM \"fti://repository/dtd/STREET_REF\"&gt;' || XMLElement(NAME \"STREET_REF\",XMLAttributes( 'GUEST' AS \"USERID\"), ";
sqlSelect = sqlSelect  + "XMLElement(NAME \"HEADER\", XMLElement(NAME \"USERID\", XMLAttributes( 'AddToIOI' AS \"VALUE\")), XMLElement(NAME \"MAIN_ENTITY_TBL_TYP\", XMLAttributes( 'ISSR' AS \"VALUE\"))),";
sqlSelect = sqlSelect  + "XMLElement(NAME \"SEGMENT\", XMLAttributes( 'Issuer' AS \"TYPE\", 'REFERENCE' AS \"ACTION\"), ";
sqlSelect = sqlSelect  + "XMLElement(NAME \"Issuer\", XMLElement(NAME \"INSTRISSRID\", XMLAttributes( RTRIM(ft_t_issr.instr_issr_id) AS \"VALUE\")))), ";
sqlSelect = sqlSelect  + "XMLElement(NAME \"SEGMENT\", XMLAttributes( 'ISSRIssuerGroupParticipant' AS \"TYPE\", 'UNKNOWN' AS \"ACTION\"), XMLElement(NAME \"ISSRIssuerGroupParticipant\", ";
sqlSelect = sqlSelect  + "XMLElement(NAME \"PRNTISSRGRPOID\", XMLAttributes( 'IRGR000016' AS \"VALUE\")), XMLElement(NAME \"PRTPURPTYP\", XMLAttributes( 'INTEREST' AS \"VALUE\"))";
sqlSelect = sqlSelect  + "))) FROM ft_t_issr ft_t_issr ";
sqlSelect = sqlSelect  + "WHERE ( ft_t_issr.END_TMS IS NULL OR ft_t_issr.END_TMS &gt; sysdate()) ";
sqlSelect = sqlSelect  + "and instr_issr_id not in (select instr_issr_id from ft_t_irgp where end_tms is null and prnt_issr_grp_oid = 'IRGR000016') ";
sqlSelect = sqlSelect  + "and instr_issr_id in (select instr_issr_id from ft_t_issu where end_tms is null and instr_id in (SELECT p.instr_id ";
sqlSelect = sqlSelect  + "FROM ft_t_isgp p, ft_t_isgr g ";
sqlSelect = sqlSelect  + "WHERE    1=1 ";
sqlSelect = sqlSelect  + "AND g.iss_grp_oid = p.prnt_iss_grp_oid ";
sqlSelect = sqlSelect  + "AND p.prt_purp_typ = 'INTEREST' and g.GRP_PURP_TYP = 'INTEREST' AND g.org_id in ('MHSS') ";
sqlSelect = sqlSelect  + "AND p.end_tms IS NULL ";
sqlSelect = sqlSelect  + "AND g.end_tms IS NULL))";</objectValue>
<type>CONSTANT</type>
</item>
<item id="148" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="149">variables["sqlSelect"]</name>
<stringValue id="150">sqlSelect</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="151" type="java.util.HashSet">
<item id="152" type="com.j2fe.workflow.definition.Transition">
<name id="153">goto-next</name>
<source id="154">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="155"/>
<directJoin>false</directJoin>
<name id="156">Add MHI/MHEU Issuer to IOI</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="157">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="158" type="java.util.HashSet">
<item id="159" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="160">["sqlSelect"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="161">input["sqlSelect"]</name>
<stringValue id="162">sqlSelect</stringValue>
<type>VARIABLE</type>
</item>
<item id="163" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="164">name</name>
<stringValue id="165">RealMessageProcessing</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="166" type="java.util.HashSet">
<item id="167" type="com.j2fe.workflow.definition.Transition">
<name id="168">goto-next</name>
<source id="169">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="170"/>
<directJoin>false</directJoin>
<name id="171">Build MHI/MHEU SQL Select</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="172">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="173" type="java.util.HashSet">
<item id="174" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="175">statements</name>
<objectValue id="176" type="java.lang.String">String sqlSelect = "SELECT '&lt;!DOCTYPE STREET_REF SYSTEM \"fti://repository/dtd/STREET_REF\"&gt;' || XMLElement(NAME \"STREET_REF\",XMLAttributes( 'GUEST' AS \"USERID\"), ";
sqlSelect = sqlSelect  + "XMLElement(NAME \"HEADER\", XMLElement(NAME \"USERID\", XMLAttributes( 'AddToIOI' AS \"VALUE\")), XMLElement(NAME \"MAIN_ENTITY_TBL_TYP\", XMLAttributes( 'ISSR' AS \"VALUE\"))),";
sqlSelect = sqlSelect  + "XMLElement(NAME \"SEGMENT\", XMLAttributes( 'Issuer' AS \"TYPE\", 'REFERENCE' AS \"ACTION\"), ";
sqlSelect = sqlSelect  + "XMLElement(NAME \"Issuer\", XMLElement(NAME \"INSTRISSRID\", XMLAttributes( RTRIM(ft_t_issr.instr_issr_id) AS \"VALUE\")))), ";
sqlSelect = sqlSelect  + "XMLElement(NAME \"SEGMENT\", XMLAttributes( 'ISSRIssuerGroupParticipant' AS \"TYPE\", 'UNKNOWN' AS \"ACTION\"), XMLElement(NAME \"ISSRIssuerGroupParticipant\", ";
sqlSelect = sqlSelect  + "XMLElement(NAME \"PRNTISSRGRPOID\", XMLAttributes( 'IRGR000006' AS \"VALUE\")), XMLElement(NAME \"PRTPURPTYP\", XMLAttributes( 'INTEREST' AS \"VALUE\"))";
sqlSelect = sqlSelect  + "))) FROM ft_t_issr ft_t_issr ";
sqlSelect = sqlSelect  + "WHERE ( ft_t_issr.END_TMS IS NULL OR ft_t_issr.END_TMS &gt; sysdate() ) ";
sqlSelect = sqlSelect  + "and instr_issr_id not in (select instr_issr_id from ft_t_irgp where end_tms is null and prnt_issr_grp_oid = 'IRGR000006') ";
sqlSelect = sqlSelect  + "and instr_issr_id in (select instr_issr_id from ft_t_issu where end_tms is null and instr_id in (SELECT p.instr_id ";
sqlSelect = sqlSelect  + "FROM ft_t_isgp p, ft_t_isgr g ";
sqlSelect = sqlSelect  + "WHERE    1=1 ";
sqlSelect = sqlSelect  + "AND g.iss_grp_oid = p.prnt_iss_grp_oid ";
sqlSelect = sqlSelect  + "AND p.prt_purp_typ = 'INTEREST' and g.GRP_PURP_TYP = 'INTEREST' AND g.org_id in ('MHI','MHEU') ";
sqlSelect = sqlSelect  + "AND p.end_tms IS NULL ";
sqlSelect = sqlSelect  + "AND g.end_tms IS NULL))";</objectValue>
<type>CONSTANT</type>
</item>
<item id="177" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="178">variables["sqlSelect"]</name>
<stringValue id="179">sqlSelect</stringValue>
<type>VARIABLE</type>
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
<name id="185">Publishing Event</name>
<nodeHandler>com.j2fe.event.RaiseEventRemote</nodeHandler>
<nodeHandlerClass id="186">com.j2fe.event.RaiseEventRemote</nodeHandlerClass>
<parameters id="187" type="java.util.HashSet">
<item id="188" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="189">eventName</name>
<stringValue id="190">MizBulkPublishing_Event</stringValue>
<type>CONSTANT</type>
</item>
<item id="191" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="192">["JobId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="193">parameters["JobId"]</name>
<stringValue id="194">JobID</stringValue>
<type>VARIABLE</type>
</item>
<item id="195" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="196">["No. Of Parallel Branches"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="197">parameters["No. Of Parallel Branches"]</name>
<objectValue id="198" type="java.lang.Integer">10</objectValue>
<type>CONSTANT</type>
</item>
<item id="199" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="200">propertyFileLocation</name>
<stringValue id="201">db://resource/PublishingConfiguration/PublishingConfig.properties</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="202" type="java.util.HashSet">
<item id="203" type="com.j2fe.workflow.definition.Transition">
<name id="204">goto-next</name>
<source id="205">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="206"/>
<directJoin>false</directJoin>
<name id="207">Call Standard File Load</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="208">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="209" type="java.util.HashSet">
<item id="210" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="211">["BulkSize"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="212">input["BulkSize"]</name>
<stringValue id="213">MessageBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="214" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="215">["BusinessFeed"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="216">input["BusinessFeed"]</name>
<stringValue id="217">BusinessFeed</stringValue>
<type>VARIABLE</type>
</item>
<item id="218" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="219">["File"]@java/net/URI@</UITypeHint>
<input>true</input>
<name id="220">input["File"]</name>
<stringValue id="221">File</stringValue>
<type>VARIABLE</type>
</item>
<item id="222" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="223">["MessageProcessingEvent"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="224">input["MessageProcessingEvent"]</name>
<stringValue id="225">MessageProcessingEvent</stringValue>
<type>VARIABLE</type>
</item>
<item id="226" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="227">["MessageType"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="228">input["MessageType"]</name>
<stringValue id="229">MessageType</stringValue>
<type>VARIABLE</type>
</item>
<item id="230" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="231">["OutputDirectory"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="232">input["OutputDirectory"]</name>
<stringValue id="233">OutputDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="234" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="235">["OverridePriceSourceType"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="236">input["OverridePriceSourceType"]</name>
<stringValue id="237">OverridePriceSourceType</stringValue>
<type>VARIABLE</type>
</item>
<item id="238" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="239">["Parallel File Load Sub"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="240">input["Parallel File Load Sub"]</name>
<objectValue id="241" type="java.lang.String">Parallel File Load Sub</objectValue>
<type>CONSTANT</type>
</item>
<item id="242" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="243">["ParallelBranches"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="244">input["ParallelBranches"]</name>
<stringValue id="245">ParallelBranches</stringValue>
<type>VARIABLE</type>
</item>
<item id="246" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="247">["ParentJobId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="248">input["ParentJobId"]</name>
<stringValue id="249">Parent Job Id</stringValue>
<type>VARIABLE</type>
</item>
<item id="250" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="251">["SuccessAction"]@com/j2fe/feeds/SuccessAction@</UITypeHint>
<input>true</input>
<name id="252">input["SuccessAction"]</name>
<stringValue id="253">SuccessAction</stringValue>
<type>VARIABLE</type>
</item>
<item id="254" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="255">name</name>
<stringValue id="256">Standard File Load</stringValue>
<type>CONSTANT</type>
</item>
<item id="257" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="258">["JobId"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="259">output["JobId"]</name>
<stringValue id="260">JobID</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="261" type="java.util.HashSet">
<item id="262" type="com.j2fe.workflow.definition.Transition">
<name id="263">goto-next</name>
<source id="264">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="265"/>
<directJoin>false</directJoin>
<name id="266">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="267">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="268" type="java.util.HashSet"/>
<targets id="269" type="java.util.HashSet">
<item idref="262" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="205"/>
</item>
</sources>
<targets id="270" type="java.util.HashSet">
<item idref="203" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="183"/>
</item>
</sources>
<targets id="271" type="java.util.HashSet">
<item idref="181" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="169"/>
</item>
</sources>
<targets id="272" type="java.util.HashSet">
<item idref="167" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="154"/>
</item>
</sources>
<targets id="273" type="java.util.HashSet">
<item idref="152" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="140"/>
</item>
</sources>
<targets id="274" type="java.util.HashSet">
<item idref="138" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="125"/>
</item>
</sources>
<targets id="275" type="java.util.HashSet">
<item idref="123" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="111"/>
</item>
</sources>
<targets id="276" type="java.util.HashSet">
<item idref="109" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="96"/>
</item>
</sources>
<targets id="277" type="java.util.HashSet">
<item idref="94" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="82"/>
</item>
</sources>
<targets id="278" type="java.util.HashSet">
<item idref="80" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="67"/>
</item>
</sources>
<targets id="279" type="java.util.HashSet">
<item idref="65" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="53"/>
</item>
</sources>
<targets id="280" type="java.util.HashSet">
<item idref="51" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="38"/>
</item>
</sources>
<targets id="281" type="java.util.HashSet">
<item idref="36" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="24"/>
</item>
</sources>
<targets id="282" type="java.util.HashSet">
<item idref="22" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="9"/>
</item>
</sources>
<targets id="283" type="java.util.HashSet">
<item idref="7" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="2"/>
</item>
</sources>
<targets id="284" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="285">Custom/Dataloads</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="286">user1</lastChangeUser>
<lastUpdate id="287">2025-10-17T16:40:07.000+0100</lastUpdate>
<name id="288">Load And Publish</name>
<nodes id="289" type="java.util.HashSet">
<item idref="96" type="com.j2fe.workflow.definition.Node"/>
<item idref="9" type="com.j2fe.workflow.definition.Node"/>
<item idref="154" type="com.j2fe.workflow.definition.Node"/>
<item idref="67" type="com.j2fe.workflow.definition.Node"/>
<item idref="125" type="com.j2fe.workflow.definition.Node"/>
<item idref="38" type="com.j2fe.workflow.definition.Node"/>
<item idref="111" type="com.j2fe.workflow.definition.Node"/>
<item idref="24" type="com.j2fe.workflow.definition.Node"/>
<item idref="169" type="com.j2fe.workflow.definition.Node"/>
<item idref="82" type="com.j2fe.workflow.definition.Node"/>
<item idref="140" type="com.j2fe.workflow.definition.Node"/>
<item idref="53" type="com.j2fe.workflow.definition.Node"/>
<item idref="205" type="com.j2fe.workflow.definition.Node"/>
<item idref="183" type="com.j2fe.workflow.definition.Node"/>
<item idref="264" type="com.j2fe.workflow.definition.Node"/>
<item idref="2" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>true</optimize>
<parameter id="290" type="java.util.HashMap">
<entry>
<key id="291" type="java.lang.String">BusinessFeed</key>
<value id="292" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="293">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="294">The Business Feed to be used to process the file. Either Vendor Definition or Business Feed is required.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="295" type="java.lang.String">File</key>
<value id="296" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="297">java.net.URI</className>
<clazz>java.net.URI</clazz>
<description id="298">The input file to be processed.</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="299" type="java.lang.String">JobID</key>
<value id="300" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="301">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="302">The JobID of the processed file.</description>
<input>false</input>
<output>true</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="303" type="java.lang.String">MessageBulkSize</key>
<value id="304" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="305">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="306">The Message Bulk Size indicates how much messages within a file should be processed in parallel.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="307" type="java.lang.String">MessageProcessingEvent</key>
<value id="308" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="309">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="310">The Event that is called for processing a single message.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="311" type="java.lang.String">MessageType</key>
<value id="312" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="313">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="314">Can be use to override the Message Type to be used.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="315" type="java.lang.String">OutputDirectory</key>
<value id="316" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="317">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="318">Only used if SuccessAction is MOVE</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="319" type="java.lang.String">OverridePriceSourceType</key>
<value id="320" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="321">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="322">The Price Source Type will be overridden by the value provided in this parameter.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="323" type="java.lang.String">ParallelBranches</key>
<value id="324" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="325">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="326">The number of branches in parallel.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="327" type="java.lang.String">Parent Job Id</key>
<value id="328" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="329">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="330">Parent Job id is used to correlated all the child jobs.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="331" type="java.lang.String">SuccessAction</key>
<value id="332" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="333">com.j2fe.feeds.SuccessAction</className>
<clazz>com.j2fe.feeds.SuccessAction</clazz>
<description id="334">After processing, if the file should be moved to a different directory, choose MOVE or LEAVE (no action) or DELETE</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
</parameter>
<permissions id="335" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>false</purgeAtEnd>
<retries>0</retries>
<startNode idref="264"/>
<status>RELEASED</status>
<variables id="336" type="java.util.HashMap">
<entry>
<key id="337" type="java.lang.String">BusinessFeed</key>
<value id="338" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="339">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="340">The Business Feed to be used to process the file. Either Vendor Definition or Business Feed is required.</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="341" type="java.lang.String">File</key>
<value id="342" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="343">java.net.URI</className>
<clazz>java.net.URI</clazz>
<description id="344">The input file to be processed.</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="345" type="java.lang.String">JobID</key>
<value id="346" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="347">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="348">The JobID of the processed file.</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="349" type="java.lang.String">MessageBulkSize</key>
<value id="350" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="351">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="352">The Message Bulk Size indicates how much messages within a file should be processed in parallel.</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="353" type="java.lang.String">MessageProcessingEvent</key>
<value id="354" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="355">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="356">The Event that is called for processing a single message.</description>
<persistent>false</persistent>
<value id="357" type="java.lang.String">ProcessFeedMessage</value>
</value>
</entry>
<entry>
<key id="358" type="java.lang.String">MessageType</key>
<value id="359" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="360">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="361">Can be use to override the Message Type to be used.</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="362" type="java.lang.String">OutputDirectory</key>
<value id="363" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="364">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="365">Only used if SuccessAction is MOVE</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="366" type="java.lang.String">OverridePriceSourceType</key>
<value id="367" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="368">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="369">The Price Source Type will be overridden by the value provided in this parameter.</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="370" type="java.lang.String">ParallelBranches</key>
<value id="371" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="372">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="373">The number of branches in parallel.</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="374" type="java.lang.String">Parent Job Id</key>
<value id="375" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="376">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="377">Parent Job id is used to correlated all the child jobs.</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="378" type="java.lang.String">SuccessAction</key>
<value id="379" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="380">com.j2fe.feeds.SuccessAction</className>
<clazz>com.j2fe.feeds.SuccessAction</clazz>
<description id="381">After processing, if the file should be moved to a different directory, choose MOVE or LEAVE (no action) or DELETE</description>
<persistent>false</persistent>
<value id="382" type="com.j2fe.feeds.SuccessAction">LEAVE</value>
</value>
</entry>
</variables>
<version>19</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
