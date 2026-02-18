<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.07">
<package-comment/>
<businessobject displayString="4 - RemotePubAddedV10" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>false</alwaysPersist>
<clustered>false</clustered>
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
<name id="9">goto-next</name>
<source id="10">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="11"/>
<directJoin>false</directJoin>
<name id="12">Remote Event Publishing</name>
<nodeHandler>com.j2fe.event.RaiseEventRemote</nodeHandler>
<nodeHandlerClass id="13">com.j2fe.event.RaiseEventRemote</nodeHandlerClass>
<parameters id="14" type="java.util.HashSet">
<item id="15" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="16">eventName</name>
<stringValue id="17">MizPublishForTxn_Event</stringValue>
<type>CONSTANT</type>
</item>
<item id="18" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="19">["transactionId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="20">parameters["transactionId"]</name>
<stringValue id="21">trid</stringValue>
<type>VARIABLE</type>
</item>
<item id="22" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="23">propertyFileLocation</name>
<stringValue id="24">db://resource/PublishingConfiguration/PublishingConfig.properties</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="25" type="java.util.HashSet">
<item id="26" type="com.j2fe.workflow.definition.Transition">
<name id="27">goto-next</name>
<source id="28">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="29"/>
<directJoin>false</directJoin>
<name id="30">NOP</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="31">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="32" type="java.util.HashSet">
<item id="33" type="com.j2fe.workflow.definition.Transition">
<name id="34">goto-next</name>
<source id="35">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="36"/>
<directJoin>false</directJoin>
<name id="37">Add TRN_ID to PBAT</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="38">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="39" type="java.util.HashSet">
<item id="40" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="41">database</name>
<stringValue id="42">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="43" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="44">indexedParameters[0]</name>
<stringValue id="45">trid</stringValue>
<type>VARIABLE</type>
</item>
<item id="46" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="47">indexedParameters[1]</name>
<stringValue id="48">auditIdentifier</stringValue>
<type>VARIABLE</type>
</item>
<item id="49" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="50">querySQL</name>
<stringValue id="51">update ft_t_pbat set trn_id = ? where pub_audit_id = ?</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="52" type="java.util.HashSet">
<item id="53" type="com.j2fe.workflow.definition.Transition">
<name id="54">goto-next</name>
<source id="55">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="56"/>
<directJoin>true</directJoin>
<name id="57">Synchronize</name>
<nodeHandler>com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandler>
<nodeHandlerClass id="58">com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandlerClass>
<sources id="59" type="java.util.HashSet">
<item id="60" type="com.j2fe.workflow.definition.Transition">
<name id="61">goto-next</name>
<source id="62">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="63"/>
<directJoin>false</directJoin>
<name id="64">Remote Event Extraction</name>
<nodeHandler>com.j2fe.event.RaiseEventRemote</nodeHandler>
<nodeHandlerClass id="65">com.j2fe.event.RaiseEventRemote</nodeHandlerClass>
<parameters id="66" type="java.util.HashSet">
<item id="67" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="68">eventName</name>
<stringValue id="69">MizBulkExtraction_Event</stringValue>
<type>CONSTANT</type>
</item>
<item id="70" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="71">["AuditId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="72">parameters["AuditId"]</name>
<stringValue id="73">auditIdentifier</stringValue>
<type>VARIABLE</type>
</item>
<item id="74" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="75">["ExtDefs"]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="76">parameters["ExtDefs"]</name>
<stringValue id="77">extDefsPerBranch</stringValue>
<type>VARIABLE</type>
</item>
<item id="78" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="79">["JMSDestination"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="80">parameters["JMSDestination"]</name>
<stringValue id="81">JMSDestination</stringValue>
<type>VARIABLE</type>
</item>
<item id="82" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="83">["PublishingBulkSize"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="84">parameters["PublishingBulkSize"]</name>
<stringValue id="85">PublishingBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="86" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="87">propertyFileLocation</name>
<stringValue id="88">db://resource/PublishingConfiguration/PublishingConfig.properties</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="89" type="java.util.HashSet">
<item id="90" type="com.j2fe.workflow.definition.Transition">
<name id="91">goto-next</name>
<source id="92">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="93"/>
<directJoin>true</directJoin>
<name id="94">Bulk Items</name>
<nodeHandler>com.j2fe.general.activities.BulkItems</nodeHandler>
<nodeHandlerClass id="95">com.j2fe.general.activities.BulkItems</nodeHandlerClass>
<parameters id="96" type="java.util.HashSet">
<item id="97" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="98">bulk</name>
<stringValue id="99">pubBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="100" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="101">input</name>
<stringValue id="102">extractDefinitions</stringValue>
<type>VARIABLE</type>
</item>
<item id="103" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="104">output</name>
<stringValue id="105">extDefsPerBranch</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="106" type="java.util.HashSet">
<item id="107" type="com.j2fe.workflow.definition.Transition">
<name id="108">goto-next</name>
<source id="109">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="110"/>
<directJoin>false</directJoin>
<name id="111">Bean Shell Script (Standard)</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="112">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="113" type="java.util.HashSet">
<item id="114" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="115">statements</name>
<stringValue id="116">if(NoOfThreads &lt;= 0) {&#13;
	NoOfThreads = 1;&#13;
}&#13;
else if(items &lt; NoOfThreads)&#13;
{&#13;
NoOfThreads = items;&#13;
}&#13;
bulkSize = items / NoOfThreads;&#13;
if(items % NoOfThreads != 0)&#13;
{&#13;
bulkSize = bulkSize +1;&#13;
}</stringValue>
<type>CONSTANT</type>
</item>
<item id="117" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="118">["NoOfThreads"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="119">variables["NoOfThreads"]</name>
<stringValue id="120">No. of Parallel Branches</stringValue>
<type>VARIABLE</type>
</item>
<item id="121" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="122">["bulkSize"]@java/lang/Integer@</UITypeHint>
<input>false</input>
<name id="123">variables["bulkSize"]</name>
<stringValue id="124">pubBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="125" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="126">["items"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="127">variables["items"]</name>
<stringValue id="128">extractDefinitions</stringValue>
<type>VARIABLE</type>
<variablePart id="129">length</variablePart>
</item>
</parameters>
<sources id="130" type="java.util.HashSet">
<item id="131" type="com.j2fe.workflow.definition.Transition">
<name id="132">extraction</name>
<source id="133">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="134"/>
<directJoin>false</directJoin>
<name id="135">Party Extraction Log</name>
<nodeHandler>com.thegoldensource.publishing.activity.WriteExtractionLog</nodeHandler>
<nodeHandlerClass id="136">com.thegoldensource.publishing.activity.WriteExtractionLog</nodeHandlerClass>
<parameters id="137" type="java.util.HashSet">
<item id="138" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="139">auditId</name>
<stringValue id="140">auditIdentifier</stringValue>
<type>VARIABLE</type>
</item>
<item id="141" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="142">entityMode</name>
<stringValue id="143">MODEL_ENTITY</stringValue>
<type>CONSTANT</type>
</item>
<item id="144" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="145">eql</name>
<stringValue id="146">PublishQuery</stringValue>
<type>VARIABLE</type>
</item>
<item id="147" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="148">extractDefinitions</name>
<stringValue id="149">extractDefinitions</stringValue>
<type>VARIABLE</type>
</item>
<item id="150" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="151">extractorFactory</name>
<stringValue id="152">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="153" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="154">maxExtractCount</name>
<stringValue id="155">PublishingBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="156" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="157">modelName</name>
<stringValue id="158">ISSRPUB</stringValue>
<type>CONSTANT</type>
</item>
<item id="159" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="160">queryParameter</name>
<stringValue id="161">queryParameter</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="162" type="java.util.HashSet">
<item id="163" type="com.j2fe.workflow.definition.Transition">
<name id="164">goto-next</name>
<source id="165">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="166"/>
<directJoin>false</directJoin>
<name id="167">UP and IP Publish Query</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="168">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="169" type="java.util.HashSet">
<item id="170" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="171">statements</name>
<stringValue id="172">query = "&lt;sql&gt; instr_issr_id in (select instr_issr_id from ft_t_issr issr where issr.end_tms is null";&#13;
query = query + " and exists ( select 1 from ft_t_irgp irgp where issr.instr_issr_id = irgp.instr_issr_id and irgp.end_tms is null";&#13;
query = query + " and irgp.prt_purp_typ = '" + pubSoi + "' )";&#13;
query = query + " and issr.fins_inst_mnem in (select prnt_inst_mnem from ft_t_ffrl where inst_mnem = '" + instMnem + "'";&#13;
query = query + " and end_tms is null and rel_typ in ( 'CURRORGN','PARNTCOF') ))&lt;/sql&gt;"</stringValue>
<type>CONSTANT</type>
</item>
<item id="173" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="174">variables["instMnem"]</name>
<stringValue id="175">instMnem</stringValue>
<type>VARIABLE</type>
</item>
<item id="176" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="177">variables["pubSoi"]</name>
<stringValue id="178">IOIPurpType</stringValue>
<type>VARIABLE</type>
</item>
<item id="179" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="180">variables["query"]</name>
<stringValue id="181">PublishQuery</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="182" type="java.util.HashSet">
<item id="183" type="com.j2fe.workflow.definition.Transition">
<name id="184">rows-found</name>
<source id="185">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="186"/>
<directJoin>false</directJoin>
<name id="187">Fins Updated (C,U)?</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="188">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="189" type="java.util.HashSet">
<item id="190" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="191">database</name>
<stringValue id="192">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="193" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="194">firstColumnsResult[0]</name>
<stringValue id="195">instMnem</stringValue>
<type>VARIABLE</type>
</item>
<item id="196" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="197">indexedParameters[0]</name>
<stringValue id="198">trid</stringValue>
<type>VARIABLE</type>
</item>
<item id="199" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="200">querySQL</name>
<stringValue id="201">GetInstMnemQuery</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<persistentVariables id="202" type="java.util.HashSet">
<item id="203" type="java.lang.String">instMnem
1000</item>
</persistentVariables>
<sources id="204" type="java.util.HashSet">
<item id="205" type="com.j2fe.workflow.definition.Transition">
<name id="206">rows-found</name>
<source id="207">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="208"/>
<directJoin>false</directJoin>
<name id="209">Get TRN_ID</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="210">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="211" type="java.util.HashSet">
<item id="212" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="213">database</name>
<stringValue id="214">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="215" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="216">firstColumnsResult[0]</name>
<stringValue id="217">trid</stringValue>
<type>VARIABLE</type>
</item>
<item id="218" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="219">indexedParameters[0]</name>
<stringValue id="220">JobId</stringValue>
<type>VARIABLE</type>
</item>
<item id="221" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="222">querySQL</name>
<stringValue id="223">GetTridQuery</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="224" type="java.util.HashSet">
<item id="225" type="com.j2fe.workflow.definition.Transition">
<name id="226">goto-next</name>
<source id="227">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="228"/>
<directJoin>false</directJoin>
<name id="229">Process File</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="230">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="231" type="java.util.HashSet">
<item id="232" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="233">["File"]@java/net/URI@</UITypeHint>
<input>true</input>
<name id="234">input["File"]</name>
<stringValue id="235">filename</stringValue>
<type>VARIABLE</type>
</item>
<item id="236" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="237">["MessageType"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="238">input["MessageType"]</name>
<stringValue id="239">MessageType</stringValue>
<type>VARIABLE</type>
</item>
<item id="240" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="241">["OutputDirectory"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="242">input["OutputDirectory"]</name>
<stringValue id="243">output</stringValue>
<type>VARIABLE</type>
</item>
<item id="244" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="245">["ParallelBranches"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="246">input["ParallelBranches"]</name>
<objectValue id="247" type="java.lang.Integer">2</objectValue>
<type>CONSTANT</type>
</item>
<item id="248" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="249">["SuccessAction"]@com/j2fe/feeds/SuccessAction@</UITypeHint>
<input>true</input>
<name id="250">input["SuccessAction"]</name>
<objectValue id="251" type="com.j2fe.feeds.SuccessAction">MOVE</objectValue>
<type>CONSTANT</type>
</item>
<item id="252" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="253">name</name>
<stringValue id="254">Standard File Load</stringValue>
<type>CONSTANT</type>
</item>
<item id="255" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="256">["JobId"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="257">output["JobId"]</name>
<stringValue id="258">JobId</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<persistentVariables id="259" type="java.util.HashSet">
<item id="260" type="java.lang.String">JobId
1000</item>
</persistentVariables>
<sources id="261" type="java.util.HashSet">
<item id="262" type="com.j2fe.workflow.definition.Transition">
<name id="263">goto-next</name>
<source id="264">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="265"/>
<directJoin>false</directJoin>
<name id="266">Create File Name</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="267">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="268" type="java.util.HashSet">
<item id="269" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="270">statements</name>
<stringValue id="271">String filename = "file:" + filepath + "/" + basename;
</stringValue>
<type>CONSTANT</type>
</item>
<item id="272" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="273">["basename"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="274">variables["basename"]</name>
<stringValue id="275">filename</stringValue>
<type>VARIABLE</type>
</item>
<item id="276" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="277">["filename"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="278">variables["filename"]</name>
<stringValue id="279">filename</stringValue>
<type>VARIABLE</type>
</item>
<item id="280" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="281">["filepath"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="282">variables["filepath"]</name>
<stringValue id="283">input</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="284" type="java.util.HashSet">
<item id="285" type="com.j2fe.workflow.definition.Transition">
<name id="286">goto-next</name>
<source id="287">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="288"/>
<directJoin>false</directJoin>
<name id="289">Call Subworkflow</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="290">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="291" type="java.util.HashSet">
<item id="292" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="293">["BaseName"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="294">input["BaseName"]</name>
<stringValue id="295">BaseName</stringValue>
<type>VARIABLE</type>
</item>
<item id="296" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="297">["DestinationFTP"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="298">input["DestinationFTP"]</name>
<stringValue id="299">input</stringValue>
<type>VARIABLE</type>
</item>
<item id="300" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="301">["inputMgs"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="302">input["inputMgs"]</name>
<stringValue id="303">JMSTextMessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="304" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="305">name</name>
<stringValue id="306">WriteFile</stringValue>
<type>CONSTANT</type>
</item>
<item id="307" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="308">output["filename"]</name>
<stringValue id="309">filename</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="310" type="java.util.HashSet">
<item id="311" type="com.j2fe.workflow.definition.Transition">
<name id="312">goto-next</name>
<source id="313">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="314"/>
<directJoin>false</directJoin>
<name id="315">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="316">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="317" type="java.util.HashSet"/>
<targets id="318" type="java.util.HashSet">
<item idref="311" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="287"/>
</item>
</sources>
<targets id="319" type="java.util.HashSet">
<item idref="285" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="264"/>
</item>
</sources>
<targets id="320" type="java.util.HashSet">
<item idref="262" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="227"/>
</item>
</sources>
<targets id="321" type="java.util.HashSet">
<item idref="225" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="207"/>
</item>
</sources>
<targets id="322" type="java.util.HashSet">
<item id="323" type="com.j2fe.workflow.definition.Transition">
<name id="324">nothing-found</name>
<source idref="207"/>
<target idref="3"/>
</item>
<item idref="205" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="185"/>
</item>
</sources>
<targets id="325" type="java.util.HashSet">
<item id="326" type="com.j2fe.workflow.definition.Transition">
<name id="327">nothing-found</name>
<source idref="185"/>
<target idref="3"/>
</item>
<item idref="183" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="165"/>
</item>
</sources>
<targets id="328" type="java.util.HashSet">
<item idref="163" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="133"/>
</item>
</sources>
<targets id="329" type="java.util.HashSet">
<item idref="131" type="com.j2fe.workflow.definition.Transition"/>
<item id="330" type="com.j2fe.workflow.definition.Transition">
<name id="331">no-extraction</name>
<source idref="133"/>
<target idref="28"/>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="109"/>
</item>
</sources>
<targets id="332" type="java.util.HashSet">
<item idref="107" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="92"/>
</item>
</sources>
<targets id="333" type="java.util.HashSet">
<item idref="90" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDSPLIT</type>
</source>
<target idref="62"/>
</item>
</sources>
<targets id="334" type="java.util.HashSet">
<item idref="60" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="55"/>
</item>
</sources>
<targets id="335" type="java.util.HashSet">
<item idref="53" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDJOIN</type>
</source>
<target idref="35"/>
</item>
</sources>
<targets id="336" type="java.util.HashSet">
<item idref="33" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="28"/>
</item>
<item idref="330" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="337" type="java.util.HashSet">
<item idref="26" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="10"/>
</item>
</sources>
<targets id="338" type="java.util.HashSet">
<item idref="8" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="3"/>
</item>
<item idref="326" type="com.j2fe.workflow.definition.Transition"/>
<item idref="323" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="339" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="340">Mizuho</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="341">user1</lastChangeUser>
<lastUpdate id="342">2025-12-16T14:27:44.000+0000</lastUpdate>
<name id="343">ConsumeFenergoMessage</name>
<nodes id="344" type="java.util.HashSet">
<item idref="35" type="com.j2fe.workflow.definition.Node"/>
<item idref="109" type="com.j2fe.workflow.definition.Node"/>
<item idref="92" type="com.j2fe.workflow.definition.Node"/>
<item idref="287" type="com.j2fe.workflow.definition.Node"/>
<item idref="264" type="com.j2fe.workflow.definition.Node"/>
<item idref="185" type="com.j2fe.workflow.definition.Node"/>
<item idref="207" type="com.j2fe.workflow.definition.Node"/>
<item idref="28" type="com.j2fe.workflow.definition.Node"/>
<item idref="133" type="com.j2fe.workflow.definition.Node"/>
<item idref="227" type="com.j2fe.workflow.definition.Node"/>
<item idref="62" type="com.j2fe.workflow.definition.Node"/>
<item idref="10" type="com.j2fe.workflow.definition.Node"/>
<item idref="313" type="com.j2fe.workflow.definition.Node"/>
<item idref="3" type="com.j2fe.workflow.definition.Node"/>
<item idref="55" type="com.j2fe.workflow.definition.Node"/>
<item idref="165" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>true</optimize>
<parameter id="345" type="java.util.HashMap">
<entry>
<key id="346" type="java.lang.String">BaseName</key>
<value id="347" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="348">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="349" type="java.lang.String">GetInstMnemQuery</key>
<value id="350" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="351">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="352">Get XREF_TBL_ROW_OID for inst_mnem</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="353" type="java.lang.String">GetTridQuery</key>
<value id="354" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="355">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="356" type="java.lang.String">IOIPurpType</key>
<value id="357" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="358">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="359">IOI purpose type</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="360" type="java.lang.String">JMSDestination</key>
<value id="361" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="362">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="363"/>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="364" type="java.lang.String">JMSTextMessage</key>
<value id="365" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="366">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="367">If the JMS message type is Text then this property contains the message.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="368" type="java.lang.String">MessageType</key>
<value id="369" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="370">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="371" type="java.lang.String">No. of Parallel Branches</key>
<value id="372" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="373">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="374" type="java.lang.String">PublishingBulkSize</key>
<value id="375" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="376">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="377" type="java.lang.String">filename</key>
<value id="378" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="379">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="380" type="java.lang.String">input</key>
<value id="381" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="382">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="383" type="java.lang.String">output</key>
<value id="384" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="385">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
</parameter>
<permissions id="386" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>false</purgeAtEnd>
<retries>0</retries>
<startNode idref="313"/>
<status>RELEASED</status>
<variables id="387" type="java.util.HashMap">
<entry>
<key id="388" type="java.lang.String">BaseName</key>
<value id="389" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="390">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="391" type="java.lang.String">FNG</value>
</value>
</entry>
<entry>
<key id="392" type="java.lang.String">GetInstMnemQuery</key>
<value id="393" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="394">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="395">Get XREF_TBL_ROW_OID for inst_mnem</description>
<persistent>false</persistent>
<value id="396" type="java.lang.String">select XREF_TBL_ROW_OID from ft_t_msgp where trn_id = ? and XREF_TBL_TYP='FINS' and entity_chg_ind in ('C','U')</value>
</value>
</entry>
<entry>
<key id="397" type="java.lang.String">GetTridQuery</key>
<value id="398" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="399">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="400" type="java.lang.String">select trn_id from fT_t_trid where job_id = ?</value>
</value>
</entry>
<entry>
<key id="401" type="java.lang.String">IOIPurpType</key>
<value id="402" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="403">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="404">IOI purpose type</description>
<persistent>false</persistent>
<value id="405" type="java.lang.String">INTEREST</value>
</value>
</entry>
<entry>
<key id="406" type="java.lang.String">JMSDestination</key>
<value id="407" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="408">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="409"/>
<persistent>false</persistent>
<value id="410" type="java.lang.String">jms/queue/issuer</value>
</value>
</entry>
<entry>
<key id="411" type="java.lang.String">JMSTextMessage</key>
<value id="412" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="413">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="414">If the JMS message type is Text then this property contains the message.</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="415" type="java.lang.String">MessageType</key>
<value id="416" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="417">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>true</persistent>
<value id="418" type="java.lang.String">LEGALENTITY</value>
</value>
</entry>
<entry>
<key id="419" type="java.lang.String">No. of Parallel Branches</key>
<value id="420" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="421">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<persistent>false</persistent>
<value id="422" type="java.lang.Integer">20</value>
</value>
</entry>
<entry>
<key id="423" type="java.lang.String">PublishingBulkSize</key>
<value id="424" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="425">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<persistent>false</persistent>
<value id="426" type="java.lang.Integer">100</value>
</value>
</entry>
<entry>
<key id="427" type="java.lang.String">filename</key>
<value id="428" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="429">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="430" type="java.lang.String">input</key>
<value id="431" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="432">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="433" type="java.lang.String">${gs.bin.path}/../GS-QueueMsg/FENERGO/input</value>
</value>
</entry>
<entry>
<key id="434" type="java.lang.String">output</key>
<value id="435" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="436">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="437" type="java.lang.String">${gs.bin.path}/../GS-QueueMsg/FENERGO/output</value>
</value>
</entry>
</variables>
<version>4</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
