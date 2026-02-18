<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.07">
<package-comment/>
<businessobject displayString="11 - RemotePubAddedV10" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>false</alwaysPersist>
<clustered>true</clustered>
<comment id="1">RemotePubAddedV10</comment>
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
<name id="9">ToSplit</name>
<source id="10">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="11">Automatically generated</description>
<directJoin>false</directJoin>
<name id="12">Merge</name>
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
<name id="19">Raise cmfSOIConsumptionForUnderlyersEvent</name>
<nodeHandler>com.j2fe.event.RaiseEvent</nodeHandler>
<nodeHandlerClass id="20">com.j2fe.event.RaiseEvent</nodeHandlerClass>
<parameters id="21" type="java.util.HashSet">
<item id="22" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="23">eventName</name>
<stringValue id="24">cmfSOIConsumptionForUnderlyersEvent</stringValue>
<type>CONSTANT</type>
</item>
<item id="25" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="26">parameters["ParentSOIName"]</name>
<stringValue id="27">parentSOIName</stringValue>
<type>VARIABLE</type>
</item>
<item id="28" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="29">parameters["TriggeredByCmfSoiConsumption"]</name>
<stringValue id="30">TriggeredByCmfSoiConsumption</stringValue>
<type>VARIABLE</type>
</item>
<item id="31" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="32">parameters["UnderlyerSOIName"]</name>
<stringValue id="33">underlyerSOIName</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="34" type="java.util.HashSet">
<item id="35" type="com.j2fe.workflow.definition.Transition">
<name id="36">rows-found</name>
<source id="37">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="38"/>
<directJoin>false</directJoin>
<name id="39">Trigger Event</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="40">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="41" type="java.util.HashSet">
<item id="42" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="43">database</name>
<stringValue id="44">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="45" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="46">indexedParameters[0]</name>
<stringValue id="47">soiName</stringValue>
<type>VARIABLE</type>
</item>
<item id="48" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="49">[0]["PARENTSOINAME"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="50">mappedResult[0]["PARENTSOINAME"]</name>
<stringValue id="51">parentSOIName</stringValue>
<type>VARIABLE</type>
</item>
<item id="52" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="53">[0]["UNDERLYERSOINAME"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="54">mappedResult[0]["UNDERLYERSOINAME"]</name>
<stringValue id="55">underlyerSOIName</stringValue>
<type>VARIABLE</type>
</item>
<item id="56" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="57">querySQL</name>
<stringValue id="58">SELECT PRNTISG.GRP_NME PARENTSOINAME, UNDRISG.GRP_NME UNDERLYERSOINAME&#13;
FROM FT_T_ISGR ISGRMAIN,&#13;
      (SELECT ISGR.GRP_NME, ISGP.ISS_GRP_OID  FROM FT_T_ISGP ISGP, FT_T_ISGR ISGR WHERE ISGP.PRNT_ISS_GRP_OID= ISGR.ISS_GRP_OID AND ISGP.END_TMS IS NULL AND ISGR.END_TMS IS NULL&#13;
    AND ISGP.INSTR_ID IS NULL AND ISGP.PRT_PURP_TYP='PARENT') PRNTISG,&#13;
      (SELECT ISGR.GRP_NME, ISGP.ISS_GRP_OID  FROM FT_T_ISGP ISGP, FT_T_ISGR ISGR WHERE ISGP.PRNT_ISS_GRP_OID= ISGR.ISS_GRP_OID AND ISGP.END_TMS IS NULL AND ISGR.END_TMS IS NULL&#13;
    AND ISGP.INSTR_ID IS NULL AND ISGP.PRT_PURP_TYP='UNDERLYG') UNDRISG&#13;
WHERE PRNTISG.ISS_GRP_OID = ISGRMAIN.ISS_GRP_OID AND UNDRISG.ISS_GRP_OID = ISGRMAIN.ISS_GRP_OID AND END_TMS IS NULL AND ISGRMAIN.GRP_NME = CAST(? AS VARCHAR)&#13;
</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<persistentVariables id="59" type="java.util.HashSet">
<item id="60" type="java.lang.String">parentSOIName
1000</item>
<item id="61" type="java.lang.String">underlyerSOIName
1000</item>
</persistentVariables>
<sources id="62" type="java.util.HashSet">
<item id="63" type="com.j2fe.workflow.definition.Transition">
<name id="64">goto-next</name>
<source id="65">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="66"/>
<directJoin>false</directJoin>
<name id="67">Derive Parameters for cmfSOIConsumptionForUnderlyers</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="68">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="69" type="java.util.HashSet">
<item id="70" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="71">statements</name>
<stringValue id="72">String parentSOIName = "NULL";&#13;
String underlyerSOIName = "NULL";&#13;
String triggerWorkflow = "N";&#13;
if ( soiName.equals("MHI MX Inventory") ) {&#13;
	parentSOIName = "MHI Inventory";&#13;
	underlyerSOIName = "MHI Underlying Asset Inventory";&#13;
	triggerWorkflow="Y";&#13;
} else if ( soiName.equals("MHEU MX Inventory") ) {&#13;
	parentSOIName = "MHEU Inventory";&#13;
	underlyerSOIName = "MHEU Underlying Asset Inventory";&#13;
	triggerWorkflow="Y";&#13;
} else if ( soiName.equals("MHSS MX Inventory") ) {&#13;
	parentSOIName = "MHSS Inventory";&#13;
	underlyerSOIName = "MHSS Underlying Asset Inventory";&#13;
	triggerWorkflow="Y";&#13;
} else if ( soiName.equals("MHBL MX Inventory") ) {&#13;
	parentSOIName = "MHBL Inventory";&#13;
	underlyerSOIName = "MHBL Underlying Asset Inventory";&#13;
	triggerWorkflow="Y";&#13;
} else if ( soiName.equals("MBE MX Inventory") ) {&#13;
	parentSOIName = "MBE Inventory";&#13;
	underlyerSOIName = "MBE Underlying Asset Inventory";&#13;
	triggerWorkflow="Y";&#13;
}</stringValue>
<type>CONSTANT</type>
</item>
<item id="73" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="74">variables["parentSOIName"]</name>
<stringValue id="75">parentSOIName</stringValue>
<type>VARIABLE</type>
</item>
<item id="76" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="77">variables["soiName"]</name>
<stringValue id="78">soiName</stringValue>
<type>VARIABLE</type>
</item>
<item id="79" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="80">["triggerWorkflow"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="81">variables["triggerWorkflow"]</name>
<stringValue id="82">triggerWorkflow</stringValue>
<type>VARIABLE</type>
</item>
<item id="83" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="84">variables["underlyerSOIName"]</name>
<stringValue id="85">underlyerSOIName</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="86" type="java.util.HashSet">
<item id="87" type="com.j2fe.workflow.definition.Transition">
<name id="88">goto-next</name>
<source id="89">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="90"/>
<directJoin>false</directJoin>
<name id="91">Delete SOI1</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="92">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="93" type="java.util.HashSet">
<item id="94" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="95">database</name>
<stringValue id="96">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="97" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="98">indexedParameters[0]</name>
<stringValue id="99">soiName</stringValue>
<type>VARIABLE</type>
</item>
<item id="100" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="101">querySQL</name>
<stringValue id="102">delete from ft_t_soi1 where soi_nme = cast(? as varchar);</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<persistentVariables id="103" type="java.util.HashSet">
<item id="104" type="java.lang.String">extractDefinitions
1000</item>
<item id="105" type="java.lang.String">PublishQuery
1000</item>
<item id="106" type="java.lang.String">auditIdentifier
1000</item>
<item id="107" type="java.lang.String">queryParameter
1000</item>
</persistentVariables>
<sources id="108" type="java.util.HashSet">
<item id="109" type="com.j2fe.workflow.definition.Transition">
<name id="110">goto-next</name>
<source id="111">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="112"/>
<directJoin>true</directJoin>
<name id="113">Synchronize</name>
<nodeHandler>com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandler>
<nodeHandlerClass id="114">com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandlerClass>
<sources id="115" type="java.util.HashSet">
<item id="116" type="com.j2fe.workflow.definition.Transition">
<name id="117">goto-next</name>
<source id="118">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="119"/>
<directJoin>false</directJoin>
<name id="120">Remote Event Extraction</name>
<nodeHandler>com.j2fe.event.RaiseEventRemote</nodeHandler>
<nodeHandlerClass id="121">com.j2fe.event.RaiseEventRemote</nodeHandlerClass>
<parameters id="122" type="java.util.HashSet">
<item id="123" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="124">eventName</name>
<stringValue id="125">MizBulkExtraction_Event</stringValue>
<type>CONSTANT</type>
</item>
<item id="126" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="127">["AuditId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="128">parameters["AuditId"]</name>
<stringValue id="129">auditIdentifier</stringValue>
<type>VARIABLE</type>
</item>
<item id="130" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="131">["ExtDefs"]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="132">parameters["ExtDefs"]</name>
<stringValue id="133">extDefsPerBranch</stringValue>
<type>VARIABLE</type>
</item>
<item id="134" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="135">["Handle Extraction Failures"]@com/thegoldensource/subscription/ExceptionHandlingMode@</UITypeHint>
<input>true</input>
<name id="136">parameters["Handle Extraction Failures"]</name>
<objectValue id="137" type="com.thegoldensource.subscription.ExceptionHandlingMode">DO_NOT_HANDLE</objectValue>
<type>CONSTANT</type>
</item>
<item id="138" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="139">["JMSDestination"]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="140">parameters["JMSDestination"]</name>
<stringValue id="141">JMSDestination</stringValue>
<type>VARIABLE</type>
</item>
<item id="142" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="143">["PublishingBulkSize"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="144">parameters["PublishingBulkSize"]</name>
<objectValue id="145" type="java.lang.Integer">100</objectValue>
<type>CONSTANT</type>
</item>
<item id="146" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="147">propertyFileLocation</name>
<stringValue id="148">db://resource/PublishingConfiguration/PublishingConfig.properties</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="149" type="java.util.HashSet">
<item id="150" type="com.j2fe.workflow.definition.Transition">
<name id="151">goto-next</name>
<source id="152">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="153"/>
<directJoin>true</directJoin>
<name id="154">Bulk Items</name>
<nodeHandler>com.j2fe.general.activities.BulkItems</nodeHandler>
<nodeHandlerClass id="155">com.j2fe.general.activities.BulkItems</nodeHandlerClass>
<parameters id="156" type="java.util.HashSet">
<item id="157" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="158">bulk</name>
<stringValue id="159">pubBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="160" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="161">input</name>
<stringValue id="162">extractDefinitions</stringValue>
<type>VARIABLE</type>
</item>
<item id="163" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="164">output</name>
<stringValue id="165">extDefsPerBranch</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<persistentVariables id="166" type="java.util.HashSet">
<item id="167" type="java.lang.String">extDefsPerBranch
1000</item>
<item id="168" type="java.lang.String">extractDefinitions
1000</item>
<item id="169" type="java.lang.String">PublishQuery
1000</item>
<item id="170" type="java.lang.String">auditIdentifier
1000</item>
<item id="171" type="java.lang.String">pubBulkSize
1000</item>
<item id="172" type="java.lang.String">queryParameter
1000</item>
</persistentVariables>
<sources id="173" type="java.util.HashSet">
<item id="174" type="com.j2fe.workflow.definition.Transition">
<name id="175">goto-next</name>
<source id="176">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="177"/>
<directJoin>false</directJoin>
<name id="178">Bean Shell Script (Standard)</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="179">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="180" type="java.util.HashSet">
<item id="181" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="182">statements</name>
<stringValue id="183">int items = 0;        &#13;
int bulkSize = 0;    &#13;
&#13;


if (items &lt; 20)&#13;
{
    &#13;
bulkSize = 1;
&#13;
} &#13;
else {
    &#13;
bulkSize = items / 20;
    &#13;
	if (items % 20 != 0) &#13;
	{
        &#13;
	bulkSize = bulkSize +1;    &#13;
	}&#13;

}</stringValue>
<type>CONSTANT</type>
</item>
<item id="184" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="185">["NoOfThreads"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="186">variables["NoOfThreads"]</name>
<objectValue id="187" type="java.lang.Integer">20</objectValue>
<type>CONSTANT</type>
</item>
<item id="188" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="189">["bulkSize"]@java/lang/Integer@</UITypeHint>
<input>false</input>
<name id="190">variables["bulkSize"]</name>
<stringValue id="191">pubBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="192" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="193">["items"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="194">variables["items"]</name>
<stringValue id="195">extractDefinitions</stringValue>
<type>VARIABLE</type>
<variablePart id="196">length</variablePart>
</item>
</parameters>
<sources id="197" type="java.util.HashSet">
<item id="198" type="com.j2fe.workflow.definition.Transition">
<name id="199">extraction</name>
<source id="200">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="201"/>
<directJoin>false</directJoin>
<name id="202">End Date SOI Extraction</name>
<nodeHandler>com.thegoldensource.publishing.activity.WriteExtractionLog</nodeHandler>
<nodeHandlerClass id="203">com.thegoldensource.publishing.activity.WriteExtractionLog</nodeHandlerClass>
<parameters id="204" type="java.util.HashSet">
<item id="205" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="206">auditId</name>
<stringValue id="207">auditIdentifier</stringValue>
<type>VARIABLE</type>
</item>
<item id="208" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="209">entityMode</name>
<stringValue id="210">MODEL_ENTITY</stringValue>
<type>CONSTANT</type>
</item>
<item id="211" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="212">eql</name>
<stringValue id="213">PublishQuery</stringValue>
<type>VARIABLE</type>
</item>
<item id="214" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="215">extractDefinitions</name>
<stringValue id="216">extractDefinitions</stringValue>
<type>VARIABLE</type>
</item>
<item id="217" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="218">extractorFactory</name>
<stringValue id="219">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="220" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="221">maxExtractCount</name>
<stringValue id="222">100</stringValue>
<type>CONSTANT</type>
</item>
<item id="223" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="224">modelName</name>
<stringValue id="225">ISSUPUB</stringValue>
<type>CONSTANT</type>
</item>
<item id="226" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="227">queryParameter</name>
<stringValue id="228">queryParameter</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="229" type="java.util.HashSet">
<item id="230" type="com.j2fe.workflow.definition.Transition">
<name id="231">goto-next</name>
<source id="232">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="233"/>
<directJoin>false</directJoin>
<name id="234">End Date SOI Query</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="235">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="236" type="java.util.HashSet">
<item id="237" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="238">statements</name>
<stringValue id="239">query="&lt;sql&gt;instr_id in (select instr_id from FT_T_ISGP where prt_purp_typ = '" + purpTyp +"' and start_tms &lt;= sysdate() and DATE(end_tms) = CURRENT_DATE  and prnt_iss_grp_oid = (select iss_grp_oid from ft_t_isgr where grp_nme = '" + soiName +"' ))&lt;/sql&gt;";</stringValue>
<type>CONSTANT</type>
</item>
<item id="240" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="241">variables["purpTyp"]</name>
<stringValue id="242">purposeType</stringValue>
<type>VARIABLE</type>
</item>
<item id="243" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="244">["query"]@java/lang/Integer@</UITypeHint>
<input>false</input>
<name id="245">variables["query"]</name>
<stringValue id="246">PublishQuery</stringValue>
<type>VARIABLE</type>
</item>
<item id="247" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="248">variables["soiName"]</name>
<stringValue id="249">soiName</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="250" type="java.util.HashSet">
<item id="251" type="com.j2fe.workflow.definition.Transition">
<name id="252">ToSplit</name>
<source id="253">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="254">Automatically generated</description>
<directJoin>false</directJoin>
<name id="255">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="256">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="257" type="java.util.HashSet">
<item id="258" type="com.j2fe.workflow.definition.Transition">
<name id="259">goto-next</name>
<source id="260">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="261"/>
<directJoin>true</directJoin>
<name id="262">Synchronize</name>
<nodeHandler>com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandler>
<nodeHandlerClass id="263">com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandlerClass>
<sources id="264" type="java.util.HashSet">
<item id="265" type="com.j2fe.workflow.definition.Transition">
<name id="266">goto-next</name>
<source id="267">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="268"/>
<directJoin>false</directJoin>
<name id="269">Remote Event Extraction</name>
<nodeHandler>com.j2fe.event.RaiseEventRemote</nodeHandler>
<nodeHandlerClass id="270">com.j2fe.event.RaiseEventRemote</nodeHandlerClass>
<parameters id="271" type="java.util.HashSet">
<item id="272" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="273">eventName</name>
<stringValue id="274">MizBulkExtraction_Event</stringValue>
<type>CONSTANT</type>
</item>
<item id="275" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="276">["AuditId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="277">parameters["AuditId"]</name>
<stringValue id="278">auditIdentifier</stringValue>
<type>VARIABLE</type>
</item>
<item id="279" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="280">["ExtDefs"]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="281">parameters["ExtDefs"]</name>
<stringValue id="282">extDefsPerBranch</stringValue>
<type>VARIABLE</type>
</item>
<item id="283" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="284">["Handle Extraction Failures"]@com/thegoldensource/subscription/ExceptionHandlingMode@</UITypeHint>
<input>true</input>
<name id="285">parameters["Handle Extraction Failures"]</name>
<objectValue idref="137"/>
<type>CONSTANT</type>
</item>
<item id="286" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="287">["JMSDestination"]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="288">parameters["JMSDestination"]</name>
<stringValue id="289">JMSDestination</stringValue>
<type>VARIABLE</type>
</item>
<item id="290" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="291">["PublishingBulkSize"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="292">parameters["PublishingBulkSize"]</name>
<objectValue id="293" type="java.lang.Integer">100</objectValue>
<type>CONSTANT</type>
</item>
<item id="294" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="295">propertyFileLocation</name>
<stringValue id="296">db://resource/PublishingConfiguration/PublishingConfig.properties</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="297" type="java.util.HashSet">
<item id="298" type="com.j2fe.workflow.definition.Transition">
<name id="299">goto-next</name>
<source id="300">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="301"/>
<directJoin>true</directJoin>
<name id="302">Bulk Items</name>
<nodeHandler>com.j2fe.general.activities.BulkItems</nodeHandler>
<nodeHandlerClass id="303">com.j2fe.general.activities.BulkItems</nodeHandlerClass>
<parameters id="304" type="java.util.HashSet">
<item id="305" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="306">bulk</name>
<stringValue id="307">pubBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="308" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="309">input</name>
<stringValue id="310">extractDefinitions</stringValue>
<type>VARIABLE</type>
</item>
<item id="311" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="312">output</name>
<stringValue id="313">extDefsPerBranch</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<persistentVariables id="314" type="java.util.HashSet">
<item id="315" type="java.lang.String">extDefsPerBranch
1000</item>
<item id="316" type="java.lang.String">extractDefinitions
1000</item>
<item id="317" type="java.lang.String">PublishQuery
1000</item>
<item id="318" type="java.lang.String">auditIdentifier
1000</item>
<item id="319" type="java.lang.String">pubBulkSize
1000</item>
<item id="320" type="java.lang.String">queryParameter
1000</item>
</persistentVariables>
<sources id="321" type="java.util.HashSet">
<item id="322" type="com.j2fe.workflow.definition.Transition">
<name id="323">goto-next</name>
<source id="324">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="325"/>
<directJoin>false</directJoin>
<name id="326">Bean Shell Script (Standard)</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="327">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="328" type="java.util.HashSet">
<item id="329" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="330">statements</name>
<stringValue id="331">int items = 0;        &#13;
int bulkSize = 0;    &#13;
&#13;


if (items &lt; 20)&#13;
{
    &#13;
bulkSize = 1;
&#13;
} &#13;
else {
    &#13;
bulkSize = items / 20;
    &#13;
	if (items % 20 != 0) &#13;
	{
        &#13;
	bulkSize = bulkSize +1;    &#13;
	}&#13;

}</stringValue>
<type>CONSTANT</type>
</item>
<item id="332" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="333">["NoOfThreads"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="334">variables["NoOfThreads"]</name>
<objectValue id="335" type="java.lang.Integer">20</objectValue>
<type>CONSTANT</type>
</item>
<item id="336" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="337">["bulkSize"]@java/lang/Integer@</UITypeHint>
<input>false</input>
<name id="338">variables["bulkSize"]</name>
<stringValue id="339">pubBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="340" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="341">["items"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="342">variables["items"]</name>
<stringValue id="343">extractDefinitions</stringValue>
<type>VARIABLE</type>
<variablePart id="344">length</variablePart>
</item>
</parameters>
<sources id="345" type="java.util.HashSet">
<item id="346" type="com.j2fe.workflow.definition.Transition">
<name id="347">extraction</name>
<source id="348">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="349"/>
<directJoin>false</directJoin>
<name id="350">New SOI Extraction</name>
<nodeHandler>com.thegoldensource.publishing.activity.WriteExtractionLog</nodeHandler>
<nodeHandlerClass id="351">com.thegoldensource.publishing.activity.WriteExtractionLog</nodeHandlerClass>
<parameters id="352" type="java.util.HashSet">
<item id="353" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="354">auditId</name>
<stringValue id="355">auditIdentifier</stringValue>
<type>VARIABLE</type>
</item>
<item id="356" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="357">entityMode</name>
<stringValue id="358">MODEL_ENTITY</stringValue>
<type>CONSTANT</type>
</item>
<item id="359" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="360">eql</name>
<stringValue id="361">PublishQuery</stringValue>
<type>VARIABLE</type>
</item>
<item id="362" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="363">extractDefinitions</name>
<stringValue id="364">extractDefinitions</stringValue>
<type>VARIABLE</type>
</item>
<item id="365" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="366">extractorFactory</name>
<stringValue id="367">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="368" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="369">maxExtractCount</name>
<stringValue id="370">100</stringValue>
<type>CONSTANT</type>
</item>
<item id="371" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="372">modelName</name>
<stringValue id="373">ISSUPUB</stringValue>
<type>CONSTANT</type>
</item>
<item id="374" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="375">queryParameter</name>
<stringValue id="376">queryParameter</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="377" type="java.util.HashSet">
<item id="378" type="com.j2fe.workflow.definition.Transition">
<name id="379">goto-next</name>
<source id="380">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="381"/>
<directJoin>false</directJoin>
<name id="382">New SOI Query</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="383">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="384" type="java.util.HashSet">
<item id="385" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="386">statements</name>
<stringValue id="387">query="&lt;sql&gt;instr_id in (select instr_id from FT_T_ISGP where trim(prt_purp_typ) = '" + purpTyp +"' and DATE(start_tms) = CURRENT_DATE and end_tms is null and prnt_iss_grp_oid = (select iss_grp_oid from ft_t_isgr where grp_nme = '" + soiName +"' ))&lt;/sql&gt;";</stringValue>
<type>CONSTANT</type>
</item>
<item id="388" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="389">variables["purpTyp"]</name>
<stringValue id="390">purposeType</stringValue>
<type>VARIABLE</type>
</item>
<item id="391" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="392">["query"]@java/lang/Integer@</UITypeHint>
<input>false</input>
<name id="393">variables["query"]</name>
<stringValue id="394">PublishQuery</stringValue>
<type>VARIABLE</type>
</item>
<item id="395" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="396">variables["soiName"]</name>
<stringValue id="397">soiName</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="398" type="java.util.HashSet">
<item id="399" type="com.j2fe.workflow.definition.Transition">
<name id="400">goto-next</name>
<source id="401">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="402"/>
<directJoin>false</directJoin>
<name id="403">end Date ISGP</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="404">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="405" type="java.util.HashSet">
<item id="406" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="407">database</name>
<stringValue id="408">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="409" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="410">indexedParameters[0]</name>
<stringValue id="411">purposeType</stringValue>
<type>VARIABLE</type>
</item>
<item id="412" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="413">indexedParameters[1]</name>
<stringValue id="414">soiName</stringValue>
<type>VARIABLE</type>
</item>
<item id="415" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="416">indexedParameters[2]</name>
<stringValue id="417">soiName</stringValue>
<type>VARIABLE</type>
</item>
<item id="418" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="419">querySQL</name>
<stringValue id="420">update ft_t_isgp isgp set end_tms = sysdate(), last_chg_tms = sysdate(), last_chg_usr_id = 'WF'&#13;
where trim(prt_purp_typ) = cast(? as varchar) &#13;
and start_tms &lt;= sysdate() and (end_tms is null or end_tms &gt; sysdate())&#13;
and not exists (select 1 from ft_t_soi1 soi1 where soi1.instr_id = isgp.instr_id and soi1.soi_nme = cast(? as varchar)&#13;
and start_tms &lt;= sysdate() and (end_tms is null or end_tms &gt; sysdate())) &#13;
and prnt_iss_grp_oid = (select iss_grp_oid from ft_t_isgr where grp_nme = cast(? as varchar) and end_tms is null);</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="421" type="java.util.HashSet">
<item id="422" type="com.j2fe.workflow.definition.Transition">
<name id="423">goto-next</name>
<source id="424">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="425"/>
<directJoin>false</directJoin>
<name id="426">Process File</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="427">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="428" type="java.util.HashSet">
<item id="429" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="430">["File"]@java/net/URI@</UITypeHint>
<input>true</input>
<name id="431">input["File"]</name>
<stringValue id="432">filenameURI</stringValue>
<type>VARIABLE</type>
</item>
<item id="433" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="434">["MessageType"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="435">input["MessageType"]</name>
<objectValue id="436" type="java.lang.String">cmfSOIStatement</objectValue>
<type>CONSTANT</type>
</item>
<item id="437" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="438">["OutputDirectory"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="439">input["OutputDirectory"]</name>
<stringValue id="440">outputDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="441" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="442">["ParallelBranches"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="443">input["ParallelBranches"]</name>
<objectValue id="444" type="java.lang.Integer">2</objectValue>
<type>CONSTANT</type>
</item>
<item id="445" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="446">["SuccessAction"]@com/j2fe/feeds/SuccessAction@</UITypeHint>
<input>true</input>
<name id="447">input["SuccessAction"]</name>
<objectValue id="448" type="com.j2fe.feeds.SuccessAction">MOVE</objectValue>
<type>CONSTANT</type>
</item>
<item id="449" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="450">name</name>
<stringValue id="451">Standard File Load</stringValue>
<type>CONSTANT</type>
</item>
<item id="452" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="453">["JobId"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="454">output["JobId"]</name>
<stringValue id="455">JobID</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<persistentVariables id="456" type="java.util.HashSet">
<item id="457" type="java.lang.String">filenameURI
1000</item>
</persistentVariables>
<sources id="458" type="java.util.HashSet">
<item id="459" type="com.j2fe.workflow.definition.Transition">
<name id="460">goto-next</name>
<source id="461">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="462"/>
<directJoin>false</directJoin>
<name id="463">Create File Name</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="464">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="465" type="java.util.HashSet">
<item id="466" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="467">statements</name>
<stringValue id="468">String filename = "file:" + filepath + "/" + basename;&#13;
</stringValue>
<type>CONSTANT</type>
</item>
<item id="469" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="470">["basename"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="471">variables["basename"]</name>
<stringValue id="472">filename</stringValue>
<type>VARIABLE</type>
</item>
<item id="473" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="474">["filename"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="475">variables["filename"]</name>
<stringValue id="476">filenameURI</stringValue>
<type>VARIABLE</type>
</item>
<item id="477" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="478">["filepath"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="479">variables["filepath"]</name>
<stringValue id="480">inputDirectory</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="481" type="java.util.HashSet">
<item id="482" type="com.j2fe.workflow.definition.Transition">
<name id="483">goto-next</name>
<source id="484">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="485"/>
<directJoin>false</directJoin>
<name id="486">Write File</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="487">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="488" type="java.util.HashSet">
<item id="489" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="490">["BaseName"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="491">input["BaseName"]</name>
<stringValue id="492">BaseName</stringValue>
<type>VARIABLE</type>
</item>
<item id="493" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="494">["DestinationFTP"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="495">input["DestinationFTP"]</name>
<stringValue id="496">inputDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="497" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="498">["inputMgs"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="499">input["inputMgs"]</name>
<stringValue id="500">JMSTextMessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="501" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="502">name</name>
<stringValue id="503">WriteFile</stringValue>
<type>CONSTANT</type>
</item>
<item id="504" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="505">["filename"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="506">output["filename"]</name>
<stringValue id="507">filename</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<persistentVariables id="508" type="java.util.HashSet">
<item id="509" type="java.lang.String">filename
1000</item>
</persistentVariables>
<sources id="510" type="java.util.HashSet">
<item id="511" type="com.j2fe.workflow.definition.Transition">
<name id="512">goto-next</name>
<source id="513">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="514"/>
<directJoin>false</directJoin>
<name id="515">File Base Name</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="516">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="517" type="java.util.HashSet">
<item id="518" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="519">statements</name>
<stringValue id="520">String vBaseName = baseName + "_" + (soiName != null ? soiName.replaceAll("\\s+", "") : "");</stringValue>
<type>CONSTANT</type>
</item>
<item id="521" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="522">variables["baseName"]</name>
<stringValue id="523">BaseName</stringValue>
<type>VARIABLE</type>
</item>
<item id="524" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="525">variables["soiName"]</name>
<stringValue id="526">soiName</stringValue>
<type>VARIABLE</type>
</item>
<item id="527" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="528">variables["vBaseName"]</name>
<stringValue id="529">BaseName</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="530" type="java.util.HashSet">
<item id="531" type="com.j2fe.workflow.definition.Transition">
<name id="532">goto-next</name>
<source id="533">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="534"/>
<directJoin>false</directJoin>
<name id="535">Extract SOI Name</name>
<nodeHandler>com.j2fe.workflow.handler.impl.ExecuteXPath</nodeHandler>
<nodeHandlerClass id="536">com.j2fe.workflow.handler.impl.ExecuteXPath</nodeHandlerClass>
<parameters id="537" type="java.util.HashSet">
<item id="538" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="539">inputText</name>
<stringValue id="540">JMSTextMessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="541" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="542">outputValue</name>
<stringValue id="543">soiName</stringValue>
<type>VARIABLE</type>
</item>
<item id="544" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="545">xPath</name>
<stringValue id="546">/cmfSOIStatement/soiDomain</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="547" type="java.util.HashSet">
<item id="548" type="com.j2fe.workflow.definition.Transition">
<name id="549">N</name>
<source id="550">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="551"/>
<directJoin>false</directJoin>
<name id="552">BBG Request ?</name>
<nodeHandler>com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandler>
<nodeHandlerClass id="553">com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandlerClass>
<parameters id="554" type="java.util.HashSet">
<item id="555" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="556">caseItem</name>
<stringValue id="557">BloombergRequest</stringValue>
<type>VARIABLE</type>
</item>
<item id="558" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="559">nullTransition</name>
<stringValue id="560">N</stringValue>
<type>CONSTANT</type>
</item>
<item id="561" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="562">trimSpaces</name>
<stringValue id="563">true</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="564" type="java.util.HashSet">
<item id="565" type="com.j2fe.workflow.definition.Transition">
<name id="566">goto-next</name>
<source id="567">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="568"/>
<directJoin>false</directJoin>
<name id="569">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="570">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="571" type="java.util.HashSet"/>
<targets id="572" type="java.util.HashSet">
<item idref="565" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="550"/>
</item>
</sources>
<targets id="573" type="java.util.HashSet">
<item idref="548" type="com.j2fe.workflow.definition.Transition"/>
<item id="574" type="com.j2fe.workflow.definition.Transition">
<name id="575">Y</name>
<source idref="550"/>
<target id="576">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="577"/>
<directJoin>false</directJoin>
<name id="578">cmfSOIStatementBBGRequest</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="579">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="580" type="java.util.HashSet">
<item id="581" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="582">["SoiStatementMessage"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="583">input["SoiStatementMessage"]</name>
<stringValue id="584">JMSTextMessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="585" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="586">name</name>
<stringValue id="587">cmfSOIStatementBBGRequest</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="588" type="java.util.HashSet">
<item idref="574" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="589" type="java.util.HashSet">
<item id="590" type="com.j2fe.workflow.definition.Transition">
<name id="591">goto-next</name>
<source idref="576"/>
<target idref="533"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="533"/>
</item>
<item idref="590" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="592" type="java.util.HashSet">
<item idref="531" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="513"/>
</item>
</sources>
<targets id="593" type="java.util.HashSet">
<item idref="511" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="484"/>
</item>
</sources>
<targets id="594" type="java.util.HashSet">
<item idref="482" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="461"/>
</item>
</sources>
<targets id="595" type="java.util.HashSet">
<item idref="459" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="424"/>
</item>
</sources>
<targets id="596" type="java.util.HashSet">
<item idref="422" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="401"/>
</item>
</sources>
<targets id="597" type="java.util.HashSet">
<item idref="399" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="380"/>
</item>
</sources>
<targets id="598" type="java.util.HashSet">
<item idref="378" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="348"/>
</item>
</sources>
<targets id="599" type="java.util.HashSet">
<item idref="346" type="com.j2fe.workflow.definition.Transition"/>
<item id="600" type="com.j2fe.workflow.definition.Transition">
<name id="601">no-extraction</name>
<source idref="348"/>
<target idref="253"/>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="324"/>
</item>
</sources>
<targets id="602" type="java.util.HashSet">
<item idref="322" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="300"/>
</item>
</sources>
<targets id="603" type="java.util.HashSet">
<item idref="298" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDSPLIT</type>
</source>
<target idref="267"/>
</item>
</sources>
<targets id="604" type="java.util.HashSet">
<item idref="265" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="260"/>
</item>
</sources>
<targets id="605" type="java.util.HashSet">
<item idref="258" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDJOIN</type>
</source>
<target idref="253"/>
</item>
<item idref="600" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="606" type="java.util.HashSet">
<item idref="251" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="232"/>
</item>
</sources>
<targets id="607" type="java.util.HashSet">
<item idref="230" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="200"/>
</item>
</sources>
<targets id="608" type="java.util.HashSet">
<item idref="198" type="com.j2fe.workflow.definition.Transition"/>
<item id="609" type="com.j2fe.workflow.definition.Transition">
<name id="610">no-extraction</name>
<source idref="200"/>
<target idref="89"/>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="176"/>
</item>
</sources>
<targets id="611" type="java.util.HashSet">
<item idref="174" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="152"/>
</item>
</sources>
<targets id="612" type="java.util.HashSet">
<item idref="150" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDSPLIT</type>
</source>
<target idref="118"/>
</item>
</sources>
<targets id="613" type="java.util.HashSet">
<item idref="116" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="111"/>
</item>
</sources>
<targets id="614" type="java.util.HashSet">
<item idref="109" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDJOIN</type>
</source>
<target idref="89"/>
</item>
<item idref="609" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="615" type="java.util.HashSet">
<item idref="87" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="65"/>
</item>
</sources>
<targets id="616" type="java.util.HashSet">
<item idref="63" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="37"/>
</item>
</sources>
<targets id="617" type="java.util.HashSet">
<item id="618" type="com.j2fe.workflow.definition.Transition">
<name id="619">nothing-found</name>
<source idref="37"/>
<target idref="10"/>
</item>
<item idref="35" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="17"/>
</item>
</sources>
<targets id="620" type="java.util.HashSet">
<item idref="15" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="10"/>
</item>
<item idref="618" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="621" type="java.util.HashSet">
<item idref="8" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="3"/>
</item>
</sources>
<targets id="622" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="623">Mizuho</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="624">user1</lastChangeUser>
<lastUpdate id="625">2025-12-19T06:23:08.000+0000</lastUpdate>
<name id="626">cmfSOIConsumption</name>
<nodes id="627" type="java.util.HashSet">
<item idref="550" type="com.j2fe.workflow.definition.Node"/>
<item idref="324" type="com.j2fe.workflow.definition.Node"/>
<item idref="176" type="com.j2fe.workflow.definition.Node"/>
<item idref="300" type="com.j2fe.workflow.definition.Node"/>
<item idref="152" type="com.j2fe.workflow.definition.Node"/>
<item idref="461" type="com.j2fe.workflow.definition.Node"/>
<item idref="89" type="com.j2fe.workflow.definition.Node"/>
<item idref="65" type="com.j2fe.workflow.definition.Node"/>
<item idref="200" type="com.j2fe.workflow.definition.Node"/>
<item idref="232" type="com.j2fe.workflow.definition.Node"/>
<item idref="533" type="com.j2fe.workflow.definition.Node"/>
<item idref="513" type="com.j2fe.workflow.definition.Node"/>
<item idref="253" type="com.j2fe.workflow.definition.Node"/>
<item idref="10" type="com.j2fe.workflow.definition.Node"/>
<item idref="348" type="com.j2fe.workflow.definition.Node"/>
<item idref="380" type="com.j2fe.workflow.definition.Node"/>
<item idref="424" type="com.j2fe.workflow.definition.Node"/>
<item idref="17" type="com.j2fe.workflow.definition.Node"/>
<item idref="118" type="com.j2fe.workflow.definition.Node"/>
<item idref="267" type="com.j2fe.workflow.definition.Node"/>
<item idref="567" type="com.j2fe.workflow.definition.Node"/>
<item idref="3" type="com.j2fe.workflow.definition.Node"/>
<item idref="260" type="com.j2fe.workflow.definition.Node"/>
<item idref="111" type="com.j2fe.workflow.definition.Node"/>
<item idref="37" type="com.j2fe.workflow.definition.Node"/>
<item idref="484" type="com.j2fe.workflow.definition.Node"/>
<item idref="576" type="com.j2fe.workflow.definition.Node"/>
<item idref="401" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>true</optimize>
<parameter id="628" type="java.util.HashMap">
<entry>
<key id="629" type="java.lang.String">BaseName</key>
<value id="630" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="631">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="632" type="java.lang.String">BloombergRequest</key>
<value id="633" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="634">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="635">Possible values Y or N</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="636" type="java.lang.String">JMSDestination</key>
<value id="637" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="638">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="639"/>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="640" type="java.lang.String">JMSTextMessage</key>
<value id="641" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="642">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="643" type="java.lang.String">JobID</key>
<value id="644" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="645">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>false</input>
<output>true</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="646" type="java.lang.String">inputDirectory</key>
<value id="647" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="648">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="649" type="java.lang.String">outputDirectory</key>
<value id="650" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="651">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
</parameter>
<permissions id="652" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>false</purgeAtEnd>
<retries>0</retries>
<startNode idref="567"/>
<status>RELEASED</status>
<variables id="653" type="java.util.HashMap">
<entry>
<key id="654" type="java.lang.String">BaseName</key>
<value id="655" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="656">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="657" type="java.lang.String">cmfSOI</value>
</value>
</entry>
<entry>
<key id="658" type="java.lang.String">BloombergRequest</key>
<value id="659" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="660">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="661">Possible values Y or N</description>
<persistent>true</persistent>
<value id="662" type="java.lang.String">Y</value>
</value>
</entry>
<entry>
<key id="663" type="java.lang.String">JMSDestination</key>
<value id="664" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="665">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="666"/>
<persistent>false</persistent>
<value id="667" type="java.lang.String">jms/queue/security</value>
</value>
</entry>
<entry>
<key id="668" type="java.lang.String">JMSTextMessage</key>
<value id="669" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="670">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="671" type="java.lang.String">JobID</key>
<value id="672" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="673">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="674" type="java.lang.String">TriggeredByCmfSoiConsumption</key>
<value id="675" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="676">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>true</persistent>
<value id="677" type="java.lang.String">Y</value>
</value>
</entry>
<entry>
<key id="678" type="java.lang.String">inputDirectory</key>
<value id="679" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="680">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="681" type="java.lang.String">${gs.bin.path}/../GS-QueueMsg/cmfSOI/Input</value>
</value>
</entry>
<entry>
<key id="682" type="java.lang.String">outputDirectory</key>
<value id="683" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="684">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="685" type="java.lang.String">${gs.bin.path}/../GS-QueueMsg/cmfSOI/Output/</value>
</value>
</entry>
<entry>
<key id="686" type="java.lang.String">purposeType</key>
<value id="687" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="688">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="689" type="java.lang.String">INTEREST</value>
</value>
</entry>
<entry>
<key id="690" type="java.lang.String">soiName</key>
<value id="691" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="692">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
</variables>
<version>11</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
