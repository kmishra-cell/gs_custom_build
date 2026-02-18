<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.07">
<package-comment/>
<businessobject displayString="18 - V-10 Raise remote events v3" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>true</alwaysPersist>
<clustered>false</clustered>
<comment id="1">V-10 Raise remote events v3</comment>
<endNode id="2">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="3">Stop</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="4">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="5" type="java.util.HashSet">
<item id="6" type="com.j2fe.workflow.definition.Transition">
<name id="7">goto-next</name>
<source id="8">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="9">NOP</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="10">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="11" type="java.util.HashSet">
<item id="12" type="com.j2fe.workflow.definition.Transition">
<name id="13">N</name>
<source id="14">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="15">Check if event should be triggered</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="16">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="17" type="java.util.HashSet">
<item id="18" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="19">statements</name>
<stringValue id="20">if (inSoiGroups.contains(inThisGroup))&#13;
	return 'Y';&#13;
else&#13;
	return 'N';</stringValue>
<type>CONSTANT</type>
</item>
<item id="21" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="22">variables["inSoiGroups"]</name>
<stringValue id="23">ioiRebuildSoiGroups</stringValue>
<type>VARIABLE</type>
</item>
<item id="24" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="25">variables["inThisGroup"]</name>
<stringValue id="26">soiName</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="27" type="java.util.HashSet">
<item id="28" type="com.j2fe.workflow.definition.Transition">
<name id="29">goto-next</name>
<source id="30">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="31">generic IOI logic</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="32">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="33" type="java.util.HashSet">
<item id="34" type="com.j2fe.workflow.definition.Transition">
<name id="35">N</name>
<source id="36">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="37">triggerMHSSIOIRebuild</name>
<nodeHandler>com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandler>
<nodeHandlerClass id="38">com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandlerClass>
<parameters id="39" type="java.util.HashSet">
<item id="40" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="41">caseItem</name>
<stringValue id="42">triggerMHSSIOIRebuild</stringValue>
<type>VARIABLE</type>
</item>
<item id="43" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="44">defaultItem</name>
<stringValue id="45">N</stringValue>
<type>CONSTANT</type>
</item>
<item id="46" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="47">nullTransition</name>
<stringValue id="48">N</stringValue>
<type>CONSTANT</type>
</item>
<item id="49" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="50">trimSpaces</name>
<stringValue id="51">true</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="52" type="java.util.HashSet">
<item id="53" type="com.j2fe.workflow.definition.Transition">
<name id="54">goto-next</name>
<source id="55">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="56">Determine triggerMHSS  IOI Rebuild</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="57">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="58" type="java.util.HashSet">
<item id="59" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="60">statements</name>
<stringValue id="61">String triggerIOIRebuild= "NULL";

if (underlyerSOIName != null &amp;&amp; underlyerSOIName.equals("MHSS Underlying Asset Inventory") ){
	triggerIOIRebuild = "Y";
} else {
	triggerIOIRebuild = "N";
}</stringValue>
<type>CONSTANT</type>
</item>
<item id="62" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="63">variables["triggerIOIRebuild"]</name>
<stringValue id="64">triggerMHSSIOIRebuild</stringValue>
<type>VARIABLE</type>
</item>
<item id="65" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="66">variables["underlyerSOIName"]</name>
<stringValue id="67">UnderlyerSOIName</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="68" type="java.util.HashSet">
<item id="69" type="com.j2fe.workflow.definition.Transition">
<name id="70">N</name>
<source id="71">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="72">triggerIOIRebuild</name>
<nodeHandler>com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandler>
<nodeHandlerClass id="73">com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandlerClass>
<parameters id="74" type="java.util.HashSet">
<item id="75" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="76">caseItem</name>
<stringValue id="77">triggerIOIRebuild</stringValue>
<type>VARIABLE</type>
</item>
<item id="78" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="79">defaultItem</name>
<stringValue id="80">N</stringValue>
<type>CONSTANT</type>
</item>
<item id="81" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="82">nullTransition</name>
<stringValue id="83">N</stringValue>
<type>CONSTANT</type>
</item>
<item id="84" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="85">trimSpaces</name>
<stringValue id="86">true</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<persistentVariables id="87" type="java.util.HashSet">
<item id="88" type="java.lang.String">triggerIOIRebuild
1000</item>
</persistentVariables>
<sources id="89" type="java.util.HashSet">
<item id="90" type="com.j2fe.workflow.definition.Transition">
<name id="91">goto-next</name>
<source id="92">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="93">Determine trigger IOI Rebuild</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="94">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="95" type="java.util.HashSet">
<item id="96" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="97">statements</name>
<stringValue id="98">String triggerIOIRebuild= "NULL";

if(underlyerSOIName != null &amp;&amp; underlyerSOIName.equals("MHI Underlying Asset Inventory") ) {
	triggerIOIRebuild = "Y";
} else {
	triggerIOIRebuild = "N";
}
</stringValue>
<type>CONSTANT</type>
</item>
<item id="99" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="100">variables["triggerIOIRebuild"]</name>
<stringValue id="101">triggerIOIRebuild</stringValue>
<type>VARIABLE</type>
</item>
<item id="102" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="103">variables["underlyerSOIName"]</name>
<stringValue id="104">UnderlyerSOIName</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<persistentVariables id="105" type="java.util.HashSet">
<item id="106" type="java.lang.String">triggerIOIRebuild
1000</item>
</persistentVariables>
<sources id="107" type="java.util.HashSet">
<item id="108" type="com.j2fe.workflow.definition.Transition">
<name id="109">N</name>
<source id="110">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="111">TriggeredByCmfSoiConsumption?</name>
<nodeHandler>com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandler>
<nodeHandlerClass id="112">com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandlerClass>
<parameters id="113" type="java.util.HashSet">
<item id="114" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="115">caseItem</name>
<stringValue id="116">TriggeredByCmfSoiConsumption</stringValue>
<type>VARIABLE</type>
</item>
<item id="117" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="118">defaultItem</name>
<stringValue id="119">N</stringValue>
<type>CONSTANT</type>
</item>
<item id="120" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="121">nullTransition</name>
<stringValue id="122">N</stringValue>
<type>CONSTANT</type>
</item>
<item id="123" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="124">trimSpaces</name>
<stringValue id="125">true</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="126" type="java.util.HashSet">
<item id="127" type="com.j2fe.workflow.definition.Transition">
<name id="128">goto-next</name>
<source id="129">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="130">merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="131">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="132" type="java.util.HashSet">
<item id="133" type="com.j2fe.workflow.definition.Transition">
<name id="134">goto-next</name>
<source id="135">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="136">Delete SOI1</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="137">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="138" type="java.util.HashSet">
<item id="139" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="140">database</name>
<stringValue id="141">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="142" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="143">indexedParameters[0]</name>
<stringValue id="144">soiName</stringValue>
<type>VARIABLE</type>
</item>
<item id="145" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="146">querySQL</name>
<stringValue id="147">delete from ft_t_soi1 where soi_nme = ?</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="148" type="java.util.HashSet">
<item id="149" type="com.j2fe.workflow.definition.Transition">
<name id="150">goto-next</name>
<source id="151">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<directJoin>true</directJoin>
<name id="152">Synchronize</name>
<nodeHandler>com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandler>
<nodeHandlerClass id="153">com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandlerClass>
<sources id="154" type="java.util.HashSet">
<item id="155" type="com.j2fe.workflow.definition.Transition">
<name id="156">goto-next</name>
<source id="157">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="158"/>
<directJoin>false</directJoin>
<name id="159">MizBulkExtraction_RemoteEvent</name>
<nodeHandler>com.j2fe.event.RaiseEventRemote</nodeHandler>
<nodeHandlerClass id="160">com.j2fe.event.RaiseEventRemote</nodeHandlerClass>
<parameters id="161" type="java.util.HashSet">
<item id="162" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="163">eventName</name>
<stringValue id="164">MizBulkExtraction_Event</stringValue>
<type>CONSTANT</type>
</item>
<item id="165" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="166">["AuditId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="167">parameters["AuditId"]</name>
<stringValue id="168">auditIdentifier</stringValue>
<type>VARIABLE</type>
</item>
<item id="169" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="170">["ExtDefs"]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="171">parameters["ExtDefs"]</name>
<stringValue id="172">extDefsPerBranch</stringValue>
<type>VARIABLE</type>
</item>
<item id="173" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="174">["Handle Extraction Failures"]@com/thegoldensource/subscription/ExceptionHandlingMode@</UITypeHint>
<input>true</input>
<name id="175">parameters["Handle Extraction Failures"]</name>
<objectValue id="176" type="com.thegoldensource.subscription.ExceptionHandlingMode">DO_NOT_HANDLE</objectValue>
<type>CONSTANT</type>
</item>
<item id="177" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="178">["JMSDestination"]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="179">parameters["JMSDestination"]</name>
<stringValue id="180">jmsDestination</stringValue>
<type>VARIABLE</type>
</item>
<item id="181" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="182">["PublishingBulkSize"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="183">parameters["PublishingBulkSize"]</name>
<objectValue id="184" type="java.lang.Integer">100</objectValue>
<type>CONSTANT</type>
</item>
<item id="185" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="186">propertyFileLocation</name>
<stringValue id="187">db://resource/PublishingConfiguration/PublishingConfig.properties</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="188" type="java.util.HashSet">
<item id="189" type="com.j2fe.workflow.definition.Transition">
<name id="190">goto-next</name>
<source id="191">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<directJoin>true</directJoin>
<name id="192">Bulk Items</name>
<nodeHandler>com.j2fe.general.activities.BulkItems</nodeHandler>
<nodeHandlerClass id="193">com.j2fe.general.activities.BulkItems</nodeHandlerClass>
<parameters id="194" type="java.util.HashSet">
<item id="195" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="196">bulk</name>
<stringValue id="197">pubBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="198" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="199">input</name>
<stringValue id="200">extractDefinitions</stringValue>
<type>VARIABLE</type>
</item>
<item id="201" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="202">output</name>
<stringValue id="203">extDefsPerBranch</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<persistentVariables id="204" type="java.util.HashSet">
<item id="205" type="java.lang.String">extDefsPerBranch
1000</item>
<item id="206" type="java.lang.String">extractDefinitions
1000</item>
<item id="207" type="java.lang.String">PublishQuery
1000</item>
<item id="208" type="java.lang.String">auditIdentifier
1000</item>
<item id="209" type="java.lang.String">pubBulkSize
1000</item>
<item id="210" type="java.lang.String">queryParameter
1000</item>
</persistentVariables>
<sources id="211" type="java.util.HashSet">
<item id="212" type="com.j2fe.workflow.definition.Transition">
<name id="213">goto-next</name>
<source id="214">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="215">Bean Shell Script (Standard)</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="216">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="217" type="java.util.HashSet">
<item id="218" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="219">statements</name>
<stringValue id="220">if(items &lt; 20)&#13;
{&#13;
bulkSize = 1;&#13;
}&#13;
else {&#13;
bulkSize = items / 20;&#13;
	if(items % 20 != 0)&#13;
	{&#13;
	bulkSize = bulkSize +1;&#13;
	}&#13;
}</stringValue>
<type>CONSTANT</type>
</item>
<item id="221" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="222">["NoOfThreads"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="223">variables["NoOfThreads"]</name>
<objectValue id="224" type="java.lang.Integer">20</objectValue>
<type>CONSTANT</type>
</item>
<item id="225" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="226">["bulkSize"]@java/lang/Integer@</UITypeHint>
<input>false</input>
<name id="227">variables["bulkSize"]</name>
<stringValue id="228">pubBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="229" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="230">["items"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="231">variables["items"]</name>
<stringValue id="232">extractDefinitions</stringValue>
<type>VARIABLE</type>
<variablePart id="233">length</variablePart>
</item>
</parameters>
<sources id="234" type="java.util.HashSet">
<item id="235" type="com.j2fe.workflow.definition.Transition">
<name id="236">extraction</name>
<source id="237">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="238">End Date SOI Extraction</name>
<nodeHandler>com.thegoldensource.publishing.activity.WriteExtractionLog</nodeHandler>
<nodeHandlerClass id="239">com.thegoldensource.publishing.activity.WriteExtractionLog</nodeHandlerClass>
<parameters id="240" type="java.util.HashSet">
<item id="241" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="242">auditId</name>
<stringValue id="243">auditIdentifier</stringValue>
<type>VARIABLE</type>
</item>
<item id="244" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="245">entityMode</name>
<stringValue id="246">MODEL_ENTITY</stringValue>
<type>CONSTANT</type>
</item>
<item id="247" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="248">eql</name>
<stringValue id="249">PublishQuery</stringValue>
<type>VARIABLE</type>
</item>
<item id="250" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="251">extractDefinitions</name>
<stringValue id="252">extractDefinitions</stringValue>
<type>VARIABLE</type>
</item>
<item id="253" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="254">extractorFactory</name>
<stringValue id="255">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="256" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="257">maxExtractCount</name>
<stringValue id="258">100</stringValue>
<type>CONSTANT</type>
</item>
<item id="259" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="260">modelName</name>
<stringValue id="261">ISSUPUB</stringValue>
<type>CONSTANT</type>
</item>
<item id="262" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="263">queryParameter</name>
<stringValue id="264">queryParameter</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="265" type="java.util.HashSet">
<item id="266" type="com.j2fe.workflow.definition.Transition">
<name id="267">goto-next</name>
<source id="268">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="269">End Date SOI Query</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="270">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="271" type="java.util.HashSet">
<item id="272" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="273">statements</name>
<stringValue id="274">query="&lt;sql&gt;instr_id in (select instr_id from FT_T_ISGP where prt_purp_typ = '" + purpTyp +"' and start_tms &lt;= now() and date_trunc('day',end_tms)::timestamp = date_trunc('day',now())::timestamp  and prnt_iss_grp_oid = (select iss_grp_oid from ft_t_isgr where grp_nme = '" + soiName +"' ))&lt;/sql&gt;";</stringValue>
<type>CONSTANT</type>
</item>
<item id="275" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="276">variables["purpTyp"]</name>
<stringValue id="277">purposeType</stringValue>
<type>VARIABLE</type>
</item>
<item id="278" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="279">["query"]@java/lang/Integer@</UITypeHint>
<input>false</input>
<name id="280">variables["query"]</name>
<stringValue id="281">PublishQuery</stringValue>
<type>VARIABLE</type>
</item>
<item id="282" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="283">variables["soiName"]</name>
<stringValue id="284">soiName</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="285" type="java.util.HashSet">
<item id="286" type="com.j2fe.workflow.definition.Transition">
<name id="287">ToSplit</name>
<source id="288">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="289">Automatically generated</description>
<directJoin>false</directJoin>
<name id="290">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="291">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="292" type="java.util.HashSet">
<item id="293" type="com.j2fe.workflow.definition.Transition">
<name id="294">goto-next</name>
<source id="295">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<directJoin>true</directJoin>
<name id="296">Synchronize</name>
<nodeHandler>com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandler>
<nodeHandlerClass id="297">com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandlerClass>
<sources id="298" type="java.util.HashSet">
<item id="299" type="com.j2fe.workflow.definition.Transition">
<name id="300">goto-next</name>
<source id="301">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="302"/>
<directJoin>false</directJoin>
<name id="303">MizBulkExtraction_RemoteEvent</name>
<nodeHandler>com.j2fe.event.RaiseEventRemote</nodeHandler>
<nodeHandlerClass id="304">com.j2fe.event.RaiseEventRemote</nodeHandlerClass>
<parameters id="305" type="java.util.HashSet">
<item id="306" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="307">eventName</name>
<stringValue id="308">MizBulkExtraction_Event</stringValue>
<type>CONSTANT</type>
</item>
<item id="309" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="310">["AuditId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="311">parameters["AuditId"]</name>
<stringValue id="312">auditIdentifier</stringValue>
<type>VARIABLE</type>
</item>
<item id="313" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="314">["ExtDefs"]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="315">parameters["ExtDefs"]</name>
<stringValue id="316">extDefsPerBranch</stringValue>
<type>VARIABLE</type>
</item>
<item id="317" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="318">["Handle Extraction Failures"]@com/thegoldensource/subscription/ExceptionHandlingMode@</UITypeHint>
<input>true</input>
<name id="319">parameters["Handle Extraction Failures"]</name>
<objectValue idref="176"/>
<type>CONSTANT</type>
</item>
<item id="320" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="321">["JMSDestination"]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="322">parameters["JMSDestination"]</name>
<stringValue id="323">jmsDestination</stringValue>
<type>VARIABLE</type>
</item>
<item id="324" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="325">["PublishingBulkSize"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="326">parameters["PublishingBulkSize"]</name>
<objectValue id="327" type="java.lang.Integer">100</objectValue>
<type>CONSTANT</type>
</item>
<item id="328" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="329">propertyFileLocation</name>
<stringValue id="330">db://resource/PublishingConfiguration/PublishingConfig.properties</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="331" type="java.util.HashSet">
<item id="332" type="com.j2fe.workflow.definition.Transition">
<name id="333">goto-next</name>
<source id="334">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<directJoin>true</directJoin>
<name id="335">Bulk Items</name>
<nodeHandler>com.j2fe.general.activities.BulkItems</nodeHandler>
<nodeHandlerClass id="336">com.j2fe.general.activities.BulkItems</nodeHandlerClass>
<parameters id="337" type="java.util.HashSet">
<item id="338" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="339">bulk</name>
<stringValue id="340">pubBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="341" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="342">input</name>
<stringValue id="343">extractDefinitions</stringValue>
<type>VARIABLE</type>
</item>
<item id="344" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="345">output</name>
<stringValue id="346">extDefsPerBranch</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<persistentVariables id="347" type="java.util.HashSet">
<item id="348" type="java.lang.String">extDefsPerBranch
1000</item>
<item id="349" type="java.lang.String">extractDefinitions
1000</item>
<item id="350" type="java.lang.String">PublishQuery
1000</item>
<item id="351" type="java.lang.String">auditIdentifier
1000</item>
<item id="352" type="java.lang.String">pubBulkSize
1000</item>
<item id="353" type="java.lang.String">queryParameter
1000</item>
</persistentVariables>
<sources id="354" type="java.util.HashSet">
<item id="355" type="com.j2fe.workflow.definition.Transition">
<name id="356">goto-next</name>
<source id="357">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="358">Bean Shell Script (Standard)</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="359">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="360" type="java.util.HashSet">
<item id="361" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="362">statements</name>
<stringValue id="363">if(items &lt; 20)&#13;
{&#13;
bulkSize = 1;&#13;
}&#13;
else {&#13;
bulkSize = items / 20;&#13;
	if(items % 20 != 0)&#13;
	{&#13;
	bulkSize = bulkSize +1;&#13;
	}&#13;
}</stringValue>
<type>CONSTANT</type>
</item>
<item id="364" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="365">["NoOfThreads"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="366">variables["NoOfThreads"]</name>
<objectValue id="367" type="java.lang.Integer">20</objectValue>
<type>CONSTANT</type>
</item>
<item id="368" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="369">["bulkSize"]@java/lang/Integer@</UITypeHint>
<input>false</input>
<name id="370">variables["bulkSize"]</name>
<stringValue id="371">pubBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="372" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="373">["items"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="374">variables["items"]</name>
<stringValue id="375">extractDefinitions</stringValue>
<type>VARIABLE</type>
<variablePart id="376">length</variablePart>
</item>
</parameters>
<sources id="377" type="java.util.HashSet">
<item id="378" type="com.j2fe.workflow.definition.Transition">
<name id="379">extraction</name>
<source id="380">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="381">New SOI Extraction</name>
<nodeHandler>com.thegoldensource.publishing.activity.WriteExtractionLog</nodeHandler>
<nodeHandlerClass id="382">com.thegoldensource.publishing.activity.WriteExtractionLog</nodeHandlerClass>
<parameters id="383" type="java.util.HashSet">
<item id="384" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="385">auditId</name>
<stringValue id="386">auditIdentifier</stringValue>
<type>VARIABLE</type>
</item>
<item id="387" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="388">entityMode</name>
<stringValue id="389">MODEL_ENTITY</stringValue>
<type>CONSTANT</type>
</item>
<item id="390" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="391">eql</name>
<stringValue id="392">PublishQuery</stringValue>
<type>VARIABLE</type>
</item>
<item id="393" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="394">extractDefinitions</name>
<stringValue id="395">extractDefinitions</stringValue>
<type>VARIABLE</type>
</item>
<item id="396" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="397">extractorFactory</name>
<stringValue id="398">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="399" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="400">maxExtractCount</name>
<stringValue id="401">100</stringValue>
<type>CONSTANT</type>
</item>
<item id="402" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="403">modelName</name>
<stringValue id="404">ISSUPUB</stringValue>
<type>CONSTANT</type>
</item>
<item id="405" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="406">queryParameter</name>
<stringValue id="407">queryParameter</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="408" type="java.util.HashSet">
<item id="409" type="com.j2fe.workflow.definition.Transition">
<name id="410">goto-next</name>
<source id="411">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="412">New SOI Query</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="413">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="414" type="java.util.HashSet">
<item id="415" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="416">statements</name>
<stringValue id="417">query="&lt;sql&gt;instr_id in (select instr_id from FT_T_ISGP where trim(prt_purp_typ) = '" + purpTyp +"' and date_trunc('day',start_tms)::timestamp = date_trunc('day',now())::timestamp and end_tms is null and prnt_iss_grp_oid = (select iss_grp_oid from ft_t_isgr where grp_nme = '" + soiName +"' ))&lt;/sql&gt;";</stringValue>
<type>CONSTANT</type>
</item>
<item id="418" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="419">variables["purpTyp"]</name>
<stringValue id="420">purposeType</stringValue>
<type>VARIABLE</type>
</item>
<item id="421" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="422">["query"]@java/lang/Integer@</UITypeHint>
<input>false</input>
<name id="423">variables["query"]</name>
<stringValue id="424">PublishQuery</stringValue>
<type>VARIABLE</type>
</item>
<item id="425" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="426">variables["soiName"]</name>
<stringValue id="427">soiName</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="428" type="java.util.HashSet">
<item id="429" type="com.j2fe.workflow.definition.Transition">
<name id="430">goto-next</name>
<source id="431">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="432">end Date ISGP</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="433">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="434" type="java.util.HashSet">
<item id="435" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="436">database</name>
<stringValue id="437">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="438" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="439">indexedParameters[0]</name>
<stringValue id="440">purposeType</stringValue>
<type>VARIABLE</type>
</item>
<item id="441" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="442">indexedParameters[1]</name>
<stringValue id="443">soiName</stringValue>
<type>VARIABLE</type>
</item>
<item id="444" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="445">indexedParameters[2]</name>
<stringValue id="446">soiName</stringValue>
<type>VARIABLE</type>
</item>
<item id="447" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="448">querySQL</name>
<stringValue id="449">update ft_t_isgp isgp set end_tms = now(), last_chg_tms = now(), last_chg_usr_id = 'WF'
where trim(prt_purp_typ) = ?
and start_tms &lt;= now() and (end_tms is null or end_tms &gt; now())
and not exists (select 1 from ft_t_soi1 soi1 where soi1.instr_id = isgp.instr_id and soi1.soi_nme = ?
and start_tms &lt;= now() and (end_tms is null or end_tms &gt; now())) 
and prnt_iss_grp_oid = (select iss_grp_oid from ft_t_isgr where grp_nme = ? and end_tms is null)</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="450" type="java.util.HashSet">
<item id="451" type="com.j2fe.workflow.definition.Transition">
<name id="452">goto-next</name>
<source id="453">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="454">Process File</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="455">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="456" type="java.util.HashSet">
<item id="457" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="458">["File"]@java/net/URI@</UITypeHint>
<input>true</input>
<name id="459">input["File"]</name>
<stringValue id="460">filenameURI</stringValue>
<type>VARIABLE</type>
</item>
<item id="461" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="462">["MessageType"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="463">input["MessageType"]</name>
<objectValue id="464" type="java.lang.String">cmfSOIStatement</objectValue>
<type>CONSTANT</type>
</item>
<item id="465" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="466">["OutputDirectory"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="467">input["OutputDirectory"]</name>
<stringValue id="468">outputDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="469" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="470">["ParallelBranches"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="471">input["ParallelBranches"]</name>
<objectValue id="472" type="java.lang.Integer">2</objectValue>
<type>CONSTANT</type>
</item>
<item id="473" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="474">["SuccessAction"]@com/j2fe/feeds/SuccessAction@</UITypeHint>
<input>true</input>
<name id="475">input["SuccessAction"]</name>
<objectValue id="476" type="com.j2fe.feeds.SuccessAction">MOVE</objectValue>
<type>CONSTANT</type>
</item>
<item id="477" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="478">name</name>
<stringValue id="479">Standard File Load</stringValue>
<type>CONSTANT</type>
</item>
<item id="480" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="481">["JobId"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="482">output["JobId"]</name>
<stringValue id="483">JobID</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<persistentVariables id="484" type="java.util.HashSet">
<item id="485" type="java.lang.String">filenameURI
1000</item>
</persistentVariables>
<sources id="486" type="java.util.HashSet">
<item id="487" type="com.j2fe.workflow.definition.Transition">
<name id="488">goto-next</name>
<source id="489">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="490">Create File Name</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="491">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="492" type="java.util.HashSet">
<item id="493" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="494">statements</name>
<stringValue id="495">String filename = "file:" + filepath + "/" + basename;</stringValue>
<type>CONSTANT</type>
</item>
<item id="496" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="497">["basename"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="498">variables["basename"]</name>
<stringValue id="499">filename</stringValue>
<type>VARIABLE</type>
</item>
<item id="500" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="501">["filename"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="502">variables["filename"]</name>
<stringValue id="503">filenameURI</stringValue>
<type>VARIABLE</type>
</item>
<item id="504" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="505">["filepath"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="506">variables["filepath"]</name>
<stringValue id="507">inputDirectory</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="508" type="java.util.HashSet">
<item id="509" type="com.j2fe.workflow.definition.Transition">
<name id="510">goto-next</name>
<source id="511">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="512">Write File</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="513">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="514" type="java.util.HashSet">
<item id="515" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="516">["BaseName"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="517">input["BaseName"]</name>
<stringValue id="518">BaseName</stringValue>
<type>VARIABLE</type>
</item>
<item id="519" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="520">["DestinationFTP"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="521">input["DestinationFTP"]</name>
<stringValue id="522">inputDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="523" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="524">["inputMgs"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="525">input["inputMgs"]</name>
<stringValue id="526">JMSTextMessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="527" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="528">name</name>
<stringValue id="529">WriteFile</stringValue>
<type>CONSTANT</type>
</item>
<item id="530" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="531">["filename"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="532">output["filename"]</name>
<stringValue id="533">filename</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<persistentVariables id="534" type="java.util.HashSet">
<item id="535" type="java.lang.String">filename
1000</item>
</persistentVariables>
<sources id="536" type="java.util.HashSet">
<item id="537" type="com.j2fe.workflow.definition.Transition">
<name id="538">goto-next</name>
<source id="539">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="540">File Base Name</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="541">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="542" type="java.util.HashSet">
<item id="543" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="544">statements</name>
<stringValue id="545">String vBaseName = baseName + "_" + soiName.replaceAll("\\s+", "");</stringValue>
<type>CONSTANT</type>
</item>
<item id="546" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="547">variables["baseName"]</name>
<stringValue id="548">BaseName</stringValue>
<type>VARIABLE</type>
</item>
<item id="549" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="550">variables["soiName"]</name>
<stringValue id="551">soiName</stringValue>
<type>VARIABLE</type>
</item>
<item id="552" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="553">variables["vBaseName"]</name>
<stringValue id="554">BaseName</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="555" type="java.util.HashSet">
<item id="556" type="com.j2fe.workflow.definition.Transition">
<name id="557">goto-next</name>
<source id="558">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="559">Extract SOI Name</name>
<nodeHandler>com.j2fe.workflow.handler.impl.ExecuteXPath</nodeHandler>
<nodeHandlerClass id="560">com.j2fe.workflow.handler.impl.ExecuteXPath</nodeHandlerClass>
<parameters id="561" type="java.util.HashSet">
<item id="562" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="563">inputText</name>
<stringValue id="564">JMSTextMessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="565" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="566">outputValue</name>
<stringValue id="567">soiName</stringValue>
<type>VARIABLE</type>
</item>
<item id="568" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="569">xPath</name>
<stringValue id="570">/cmfSOIStatement/soiDomain</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="571" type="java.util.HashSet">
<item id="572" type="com.j2fe.workflow.definition.Transition">
<name id="573">N</name>
<source id="574">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="575">BBG Request ?</name>
<nodeHandler>com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandler>
<nodeHandlerClass id="576">com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandlerClass>
<parameters id="577" type="java.util.HashSet">
<item id="578" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="579">caseItem</name>
<stringValue id="580">BloombergRequest</stringValue>
<type>VARIABLE</type>
</item>
<item id="581" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="582">defaultItem</name>
<stringValue id="583">N</stringValue>
<type>CONSTANT</type>
</item>
<item id="584" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="585">nullTransition</name>
<stringValue id="586">N</stringValue>
<type>CONSTANT</type>
</item>
<item id="587" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="588">trimSpaces</name>
<stringValue id="589">true</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="590" type="java.util.HashSet">
<item id="591" type="com.j2fe.workflow.definition.Transition">
<name id="592">true</name>
<source id="593">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="594">Instruments ?</name>
<nodeHandler>com.j2fe.workflow.handler.impl.XPathXorSplit</nodeHandler>
<nodeHandlerClass id="595">com.j2fe.workflow.handler.impl.XPathXorSplit</nodeHandlerClass>
<parameters id="596" type="java.util.HashSet">
<item id="597" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="598">inputText</name>
<stringValue id="599">JMSTextMessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="600" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="601">xPath</name>
<stringValue id="602">//instrument</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="603" type="java.util.HashSet">
<item id="604" type="com.j2fe.workflow.definition.Transition">
<name id="605">rows-found</name>
<source id="606">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="607">Build Underlyers SOI Statement Message</name>
<nodeHandler>com.j2fe.general.activities.database.XMLQuery</nodeHandler>
<nodeHandlerClass id="608">com.j2fe.general.activities.database.XMLQuery</nodeHandlerClass>
<parameters id="609" type="java.util.HashSet">
<item id="610" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="611">database</name>
<stringValue id="612">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="613" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="614">[0]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="615">indexedParameters[0]</name>
<stringValue id="616">UnderlyerSOIName</stringValue>
<type>VARIABLE</type>
</item>
<item id="617" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="618">[1]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="619">indexedParameters[1]</name>
<stringValue id="620">ParentSOIName</stringValue>
<type>VARIABLE</type>
</item>
<item id="621" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="622">queryName</name>
<stringValue id="623">SOIMaintenanceUnderlyersList</stringValue>
<type>CONSTANT</type>
</item>
<item id="624" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="625">result[0]</name>
<stringValue id="626">JMSTextMessage</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="627" type="java.util.HashSet">
<item id="628" type="com.j2fe.workflow.definition.Transition">
<name id="629">goto-next</name>
<source id="630">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="631">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="632">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="633" type="java.util.HashSet"/>
<targets id="634" type="java.util.HashSet">
<item idref="628" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="606"/>
</item>
</sources>
<targets id="635" type="java.util.HashSet">
<item id="636" type="com.j2fe.workflow.definition.Transition">
<name id="637">nothing-found</name>
<source idref="606"/>
<target idref="129"/>
</item>
<item idref="604" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="593"/>
</item>
</sources>
<targets id="638" type="java.util.HashSet">
<item id="639" type="com.j2fe.workflow.definition.Transition">
<name id="640">false</name>
<source idref="593"/>
<target idref="558"/>
</item>
<item idref="591" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="574"/>
</item>
</sources>
<targets id="641" type="java.util.HashSet">
<item idref="572" type="com.j2fe.workflow.definition.Transition"/>
<item id="642" type="com.j2fe.workflow.definition.Transition">
<name id="643">Y</name>
<source idref="574"/>
<target id="644">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="645">cmfSOIStatementBBGRequest</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="646">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="647" type="java.util.HashSet">
<item id="648" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="649">["SoiStatementMessage"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="650">input["SoiStatementMessage"]</name>
<stringValue id="651">JMSTextMessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="652" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="653">name</name>
<stringValue id="654">cmfSOIStatementBBGRequest</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="655" type="java.util.HashSet">
<item idref="642" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="656" type="java.util.HashSet">
<item id="657" type="com.j2fe.workflow.definition.Transition">
<name id="658">goto-next</name>
<source idref="644"/>
<target idref="558"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="558"/>
</item>
<item idref="639" type="com.j2fe.workflow.definition.Transition"/>
<item idref="657" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="659" type="java.util.HashSet">
<item idref="556" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="539"/>
</item>
</sources>
<targets id="660" type="java.util.HashSet">
<item idref="537" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="511"/>
</item>
</sources>
<targets id="661" type="java.util.HashSet">
<item idref="509" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="489"/>
</item>
</sources>
<targets id="662" type="java.util.HashSet">
<item idref="487" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="453"/>
</item>
</sources>
<targets id="663" type="java.util.HashSet">
<item idref="451" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="431"/>
</item>
</sources>
<targets id="664" type="java.util.HashSet">
<item idref="429" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="411"/>
</item>
</sources>
<targets id="665" type="java.util.HashSet">
<item idref="409" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="380"/>
</item>
</sources>
<targets id="666" type="java.util.HashSet">
<item idref="378" type="com.j2fe.workflow.definition.Transition"/>
<item id="667" type="com.j2fe.workflow.definition.Transition">
<name id="668">no-extraction</name>
<source idref="380"/>
<target idref="288"/>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="357"/>
</item>
</sources>
<targets id="669" type="java.util.HashSet">
<item idref="355" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="334"/>
</item>
</sources>
<targets id="670" type="java.util.HashSet">
<item idref="332" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDSPLIT</type>
</source>
<target idref="301"/>
</item>
</sources>
<targets id="671" type="java.util.HashSet">
<item idref="299" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="295"/>
</item>
</sources>
<targets id="672" type="java.util.HashSet">
<item idref="293" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDJOIN</type>
</source>
<target idref="288"/>
</item>
<item idref="667" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="673" type="java.util.HashSet">
<item idref="286" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="268"/>
</item>
</sources>
<targets id="674" type="java.util.HashSet">
<item idref="266" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="237"/>
</item>
</sources>
<targets id="675" type="java.util.HashSet">
<item idref="235" type="com.j2fe.workflow.definition.Transition"/>
<item id="676" type="com.j2fe.workflow.definition.Transition">
<name id="677">no-extraction</name>
<source idref="237"/>
<target idref="135"/>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="214"/>
</item>
</sources>
<targets id="678" type="java.util.HashSet">
<item idref="212" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="191"/>
</item>
</sources>
<targets id="679" type="java.util.HashSet">
<item idref="189" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDSPLIT</type>
</source>
<target idref="157"/>
</item>
</sources>
<targets id="680" type="java.util.HashSet">
<item idref="155" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="151"/>
</item>
</sources>
<targets id="681" type="java.util.HashSet">
<item idref="149" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDJOIN</type>
</source>
<target idref="135"/>
</item>
<item idref="676" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="682" type="java.util.HashSet">
<item idref="133" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="129"/>
</item>
<item idref="636" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="683" type="java.util.HashSet">
<item idref="127" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="110"/>
</item>
</sources>
<targets id="684" type="java.util.HashSet">
<item idref="108" type="com.j2fe.workflow.definition.Transition"/>
<item id="685" type="com.j2fe.workflow.definition.Transition">
<name id="686">Y</name>
<source idref="110"/>
<target id="687">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="688">Initialize</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="689">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="690" type="java.util.HashSet">
<item id="691" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="692">statements</name>
<stringValue id="693">String triggeredByCmfSoiConsumption = "N";</stringValue>
<type>CONSTANT</type>
</item>
<item id="694" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="695">variables["triggeredByCmfSoiConsumption"]</name>
<stringValue id="696">TriggeredByCmfSoiConsumption</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="697" type="java.util.HashSet">
<item idref="685" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="698" type="java.util.HashSet">
<item id="699" type="com.j2fe.workflow.definition.Transition">
<name id="700">goto-next</name>
<source idref="687"/>
<target id="701">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="702">Raise cmfSOIConsumptionForUnderlyersEvent</name>
<nodeHandler>com.j2fe.event.RaiseEvent</nodeHandler>
<nodeHandlerClass id="703">com.j2fe.event.RaiseEvent</nodeHandlerClass>
<parameters id="704" type="java.util.HashSet">
<item id="705" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="706">eventName</name>
<stringValue id="707">cmfSOIConsumptionForUnderlyersEvent</stringValue>
<type>CONSTANT</type>
</item>
<item id="708" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="709">parameters["ParentSOIName"]</name>
<stringValue id="710">ParentSOIName</stringValue>
<type>VARIABLE</type>
</item>
<item id="711" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="712">parameters["TriggeredByCmfSoiConsumption"]</name>
<stringValue id="713">TriggeredByCmfSoiConsumption</stringValue>
<type>VARIABLE</type>
</item>
<item id="714" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="715">parameters["UnderlyerSOIName"]</name>
<stringValue id="716">UnderlyerSOIName</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="717" type="java.util.HashSet">
<item idref="699" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="718" type="java.util.HashSet">
<item id="719" type="com.j2fe.workflow.definition.Transition">
<name id="720">goto-next</name>
<source idref="701"/>
<target idref="2"/>
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
<target idref="92"/>
</item>
</sources>
<targets id="721" type="java.util.HashSet">
<item idref="90" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="71"/>
</item>
</sources>
<targets id="722" type="java.util.HashSet">
<item idref="69" type="com.j2fe.workflow.definition.Transition"/>
<item id="723" type="com.j2fe.workflow.definition.Transition">
<name id="724">Y</name>
<source idref="71"/>
<target id="725">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="726">Is RebuildIOI enabled?</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="727">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="728" type="java.util.HashSet">
<item id="729" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="730">database</name>
<stringValue id="731">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="732" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="733">firstColumnsResult</name>
<stringValue id="734">RebuildIOIEnabled</stringValue>
<type>VARIABLE</type>
</item>
<item id="735" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="736">querySQL</name>
<stringValue id="737">select TRIGGER_STATE from QRTZ_TRIGGERS WHERE TRIGGER_NAME = 'RebuildIOITask' and TRIGGER_STATE = 'WAITING'</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="738" type="java.util.HashSet">
<item idref="723" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="739" type="java.util.HashSet">
<item id="740" type="com.j2fe.workflow.definition.Transition">
<name id="741">nothing-found</name>
<source idref="725"/>
<target idref="55"/>
</item>
<item id="742" type="com.j2fe.workflow.definition.Transition">
<name id="743">rows-found</name>
<source idref="725"/>
<target id="744">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="745">Raise Event</name>
<nodeHandler>com.j2fe.event.RaiseEvent</nodeHandler>
<nodeHandlerClass id="746">com.j2fe.event.RaiseEvent</nodeHandlerClass>
<parameters id="747" type="java.util.HashSet">
<item id="748" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="749">eventName</name>
<stringValue id="750">RebuildIOIEvent</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="751" type="java.util.HashSet">
<item idref="742" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="752" type="java.util.HashSet">
<item id="753" type="com.j2fe.workflow.definition.Transition">
<name id="754">goto-next</name>
<source idref="744"/>
<target idref="55"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
</targets>
<type>XORSPLIT</type>
</target>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="55"/>
</item>
<item idref="753" type="com.j2fe.workflow.definition.Transition"/>
<item idref="740" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="755" type="java.util.HashSet">
<item idref="53" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="36"/>
</item>
</sources>
<targets id="756" type="java.util.HashSet">
<item idref="34" type="com.j2fe.workflow.definition.Transition"/>
<item id="757" type="com.j2fe.workflow.definition.Transition">
<name id="758">Y</name>
<source idref="36"/>
<target id="759">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="760">Is RebuildIOI enabled?</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="761">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="762" type="java.util.HashSet">
<item id="763" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="764">database</name>
<stringValue id="765">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="766" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="767">firstColumnsResult</name>
<stringValue id="768">RebuildMHSSIOIEnabled</stringValue>
<type>VARIABLE</type>
</item>
<item id="769" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="770">querySQL</name>
<stringValue id="771">select TRIGGER_STATE from QRTZ_TRIGGERS WHERE TRIGGER_NAME = 'RebuildMhssIOITask' and TRIGGER_STATE = 'WAITING'</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="772" type="java.util.HashSet">
<item idref="757" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="773" type="java.util.HashSet">
<item id="774" type="com.j2fe.workflow.definition.Transition">
<name id="775">nothing-found</name>
<source idref="759"/>
<target idref="30"/>
</item>
<item id="776" type="com.j2fe.workflow.definition.Transition">
<name id="777">rows-found</name>
<source idref="759"/>
<target id="778">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="779">Raise Event</name>
<nodeHandler>com.j2fe.event.RaiseEvent</nodeHandler>
<nodeHandlerClass id="780">com.j2fe.event.RaiseEvent</nodeHandlerClass>
<parameters id="781" type="java.util.HashSet">
<item id="782" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="783">eventName</name>
<stringValue id="784">RebuildIOIMhssEvent</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="785" type="java.util.HashSet">
<item idref="776" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="786" type="java.util.HashSet">
<item id="787" type="com.j2fe.workflow.definition.Transition">
<name id="788">goto-next</name>
<source idref="778"/>
<target idref="30"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
</targets>
<type>XORSPLIT</type>
</target>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="30"/>
</item>
<item idref="787" type="com.j2fe.workflow.definition.Transition"/>
<item idref="774" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="789" type="java.util.HashSet">
<item idref="28" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="14"/>
</item>
</sources>
<targets id="790" type="java.util.HashSet">
<item idref="12" type="com.j2fe.workflow.definition.Transition"/>
<item id="791" type="com.j2fe.workflow.definition.Transition">
<name id="792">Y</name>
<source idref="14"/>
<target id="793">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="794">Get OrgId</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="795">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="796" type="java.util.HashSet">
<item id="797" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="798">database</name>
<stringValue id="799">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="800" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="801">[0]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="802">firstColumnsResult[0]</name>
<stringValue id="803">OrgId</stringValue>
<type>VARIABLE</type>
</item>
<item id="804" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="805">indexedParameters[0]</name>
<stringValue id="806">soiName</stringValue>
<type>VARIABLE</type>
</item>
<item id="807" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="808">querySQL</name>
<stringValue id="809">select ORG_ID from FT_T_ISGR where GRP_NME = ?</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="810" type="java.util.HashSet">
<item idref="791" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="811" type="java.util.HashSet">
<item id="812" type="com.j2fe.workflow.definition.Transition">
<name id="813">goto-next</name>
<source idref="793"/>
<target id="814">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="815">Should workflow run?</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="816">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="817" type="java.util.HashSet">
<item id="818" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="819">database</name>
<stringValue id="820">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="821" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="822">indexedParameters[0]</name>
<stringValue id="823">OrgId</stringValue>
<type>VARIABLE</type>
</item>
<item id="824" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="825">querySQL</name>
<stringValue id="826">select 1 from FT_T_IOI2 where ORG_ID = ? and RUN_WORKFLOW = 'Y' and INSTR_ISSR_ID = 'CONTROL'</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="827" type="java.util.HashSet">
<item idref="812" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="828" type="java.util.HashSet">
<item id="829" type="com.j2fe.workflow.definition.Transition">
<name id="830">nothing-found</name>
<source idref="814"/>
<target idref="8"/>
</item>
<item id="831" type="com.j2fe.workflow.definition.Transition">
<name id="832">rows-found</name>
<source idref="814"/>
<target id="833">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="834">raise rebuildIOI2 event</name>
<nodeHandler>com.j2fe.event.RaiseEvent</nodeHandler>
<nodeHandlerClass id="835">com.j2fe.event.RaiseEvent</nodeHandlerClass>
<parameters id="836" type="java.util.HashSet">
<item id="837" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="838">eventName</name>
<stringValue id="839">rebuildIOI2Event</stringValue>
<type>CONSTANT</type>
</item>
<item id="840" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="841">parameters["OrgId"]</name>
<stringValue id="842">OrgId</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="843" type="java.util.HashSet">
<item idref="831" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="844" type="java.util.HashSet">
<item id="845" type="com.j2fe.workflow.definition.Transition">
<name id="846">goto-next</name>
<source idref="833"/>
<target idref="8"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
</targets>
<type>XORSPLIT</type>
</target>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="8"/>
</item>
<item idref="845" type="com.j2fe.workflow.definition.Transition"/>
<item idref="829" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="847" type="java.util.HashSet">
<item idref="6" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="2"/>
</item>
<item idref="719" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="848" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="849">Mizuho</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="850">user1</lastChangeUser>
<lastUpdate id="851">2025-12-04T17:16:44.000+0000</lastUpdate>
<name id="852">cmfSOIConsumptionForUnderlyers</name>
<nodes id="853" type="java.util.HashSet">
<item idref="574" type="com.j2fe.workflow.definition.Node"/>
<item idref="357" type="com.j2fe.workflow.definition.Node"/>
<item idref="214" type="com.j2fe.workflow.definition.Node"/>
<item idref="606" type="com.j2fe.workflow.definition.Node"/>
<item idref="334" type="com.j2fe.workflow.definition.Node"/>
<item idref="191" type="com.j2fe.workflow.definition.Node"/>
<item idref="14" type="com.j2fe.workflow.definition.Node"/>
<item idref="489" type="com.j2fe.workflow.definition.Node"/>
<item idref="135" type="com.j2fe.workflow.definition.Node"/>
<item idref="92" type="com.j2fe.workflow.definition.Node"/>
<item idref="55" type="com.j2fe.workflow.definition.Node"/>
<item idref="237" type="com.j2fe.workflow.definition.Node"/>
<item idref="268" type="com.j2fe.workflow.definition.Node"/>
<item idref="558" type="com.j2fe.workflow.definition.Node"/>
<item idref="539" type="com.j2fe.workflow.definition.Node"/>
<item idref="793" type="com.j2fe.workflow.definition.Node"/>
<item idref="687" type="com.j2fe.workflow.definition.Node"/>
<item idref="593" type="com.j2fe.workflow.definition.Node"/>
<item idref="759" type="com.j2fe.workflow.definition.Node"/>
<item idref="725" type="com.j2fe.workflow.definition.Node"/>
<item idref="288" type="com.j2fe.workflow.definition.Node"/>
<item idref="301" type="com.j2fe.workflow.definition.Node"/>
<item idref="157" type="com.j2fe.workflow.definition.Node"/>
<item idref="8" type="com.j2fe.workflow.definition.Node"/>
<item idref="380" type="com.j2fe.workflow.definition.Node"/>
<item idref="411" type="com.j2fe.workflow.definition.Node"/>
<item idref="453" type="com.j2fe.workflow.definition.Node"/>
<item idref="778" type="com.j2fe.workflow.definition.Node"/>
<item idref="744" type="com.j2fe.workflow.definition.Node"/>
<item idref="701" type="com.j2fe.workflow.definition.Node"/>
<item idref="814" type="com.j2fe.workflow.definition.Node"/>
<item idref="630" type="com.j2fe.workflow.definition.Node"/>
<item idref="2" type="com.j2fe.workflow.definition.Node"/>
<item idref="151" type="com.j2fe.workflow.definition.Node"/>
<item idref="295" type="com.j2fe.workflow.definition.Node"/>
<item idref="110" type="com.j2fe.workflow.definition.Node"/>
<item idref="511" type="com.j2fe.workflow.definition.Node"/>
<item idref="644" type="com.j2fe.workflow.definition.Node"/>
<item idref="431" type="com.j2fe.workflow.definition.Node"/>
<item idref="30" type="com.j2fe.workflow.definition.Node"/>
<item idref="129" type="com.j2fe.workflow.definition.Node"/>
<item idref="833" type="com.j2fe.workflow.definition.Node"/>
<item idref="71" type="com.j2fe.workflow.definition.Node"/>
<item idref="36" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>false</optimize>
<parameter id="854" type="java.util.HashMap">
<entry>
<key id="855" type="java.lang.String">BaseName</key>
<value id="856" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="857">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="858" type="java.lang.String">BloombergRequest</key>
<value id="859" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="860">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="861">Possible values Y or N</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="862" type="java.lang.String">JobID</key>
<value id="863" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="864">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>false</input>
<output>true</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="865" type="java.lang.String">ParentSOIName</key>
<value id="866" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="867">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="868" type="java.lang.String">TriggeredByCmfSoiConsumption</key>
<value id="869" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="870">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="871" type="java.lang.String">UnderlyerSOIName</key>
<value id="872" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="873">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="874" type="java.lang.String">inputDirectory</key>
<value id="875" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="876">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="877" type="java.lang.String">jmsDestination</key>
<value id="878" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="879">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="880"/>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="881" type="java.lang.String">outputDirectory</key>
<value id="882" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="883">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
</parameter>
<permissions id="884" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>false</purgeAtEnd>
<retries>0</retries>
<startNode idref="630"/>
<status>RELEASED</status>
<variables id="885" type="java.util.HashMap">
<entry>
<key id="886" type="java.lang.String">BaseName</key>
<value id="887" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="888">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="889" type="java.lang.String">cmfSOI</value>
</value>
</entry>
<entry>
<key id="890" type="java.lang.String">BloombergRequest</key>
<value id="891" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="892">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="893">Possible values Y or N</description>
<persistent>false</persistent>
<value id="894" type="java.lang.String">N</value>
</value>
</entry>
<entry>
<key id="895" type="java.lang.String">JMSTextMessage</key>
<value id="896" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="897">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>true</persistent>
</value>
</entry>
<entry>
<key id="898" type="java.lang.String">JobID</key>
<value id="899" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="900">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="901" type="java.lang.String">ParentSOIName</key>
<value id="902" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="903">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>true</persistent>
</value>
</entry>
<entry>
<key id="904" type="java.lang.String">TriggeredByCmfSoiConsumption</key>
<value id="905" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="906">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="907" type="java.lang.String">N</value>
</value>
</entry>
<entry>
<key id="908" type="java.lang.String">UnderlyerSOIName</key>
<value id="909" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="910">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>true</persistent>
</value>
</entry>
<entry>
<key id="911" type="java.lang.String">inputDirectory</key>
<value id="912" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="913">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="914" type="java.lang.String">${gs.bin.path}/../GS-QueueMsg/cmfSOI/Input</value>
</value>
</entry>
<entry>
<key id="915" type="java.lang.String">ioiRebuildSoiGroups</key>
<value id="916" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="917">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="918">a sequence of SOI Group names that should trigger a rebuild of an IOI group. Each should be separated by comma</description>
<persistent>true</persistent>
<value id="919" type="java.lang.String">MHBK Underlying Asset Inventory,MBE Underlying Asset Inventory</value>
</value>
</entry>
<entry>
<key id="920" type="java.lang.String">jmsDestination</key>
<value id="921" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="922">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="923"/>
<persistent>false</persistent>
<value id="924" type="java.lang.String">jms/queue/security</value>
</value>
</entry>
<entry>
<key id="925" type="java.lang.String">outputDirectory</key>
<value id="926" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="927">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="928" type="java.lang.String">${gs.bin.path}/../GS-QueueMsg/cmfSOI/Output/</value>
</value>
</entry>
<entry>
<key id="929" type="java.lang.String">purposeType</key>
<value id="930" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="931">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="932" type="java.lang.String">INTEREST</value>
</value>
</entry>
<entry>
<key id="933" type="java.lang.String">soiName</key>
<value id="934" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="935">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
</variables>
<version>18</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
