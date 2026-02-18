<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.07">
<package-comment/>
<businessobject displayString="12 - v10 Optimised - RemotePub - Parallel Branches" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>false</alwaysPersist>
<clustered>false</clustered>
<comment id="1">v10 Optimised - RemotePub - Parallel Branches</comment>
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
<name id="12">Close Job  #2</name>
<nodeHandler>com.j2fe.streetlamp.activities.CloseJob</nodeHandler>
<nodeHandlerClass id="13">com.j2fe.streetlamp.activities.CloseJob</nodeHandlerClass>
<parameters id="14" type="java.util.HashSet">
<item id="15" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="16">jobId</name>
<stringValue id="17">PrntJobID</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="18" type="java.util.HashSet">
<item id="19" type="com.j2fe.workflow.definition.Transition">
<name id="20">end-loop</name>
<source id="21">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="22"/>
<directJoin>false</directJoin>
<name id="23">Job Loop</name>
<nodeHandler>com.j2fe.workflow.handler.impl.ForEach</nodeHandler>
<nodeHandlerClass id="24">com.j2fe.workflow.handler.impl.ForEach</nodeHandlerClass>
<parameters id="25" type="java.util.HashSet">
<item id="26" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="27">counter</name>
<stringValue id="28">JobLoop</stringValue>
<type>VARIABLE</type>
</item>
<item id="29" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="30">counter</name>
<stringValue id="31">JobLoop</stringValue>
<type>VARIABLE</type>
</item>
<item id="32" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="33">input</name>
<stringValue id="34">JobNodes</stringValue>
<type>VARIABLE</type>
</item>
<item id="35" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="36">output</name>
<stringValue id="37">Job</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="38" type="java.util.HashSet">
<item id="39" type="com.j2fe.workflow.definition.Transition">
<name id="40">goto-next</name>
<source id="41">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="42"/>
<directJoin>false</directJoin>
<name id="43">merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="44">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="45" type="java.util.HashSet">
<item id="46" type="com.j2fe.workflow.definition.Transition">
<name id="47">goto-next</name>
<source id="48">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="49"/>
<directJoin>false</directJoin>
<name id="50">Create Job</name>
<nodeHandler>com.j2fe.streetlamp.activities.CreateJob</nodeHandler>
<nodeHandlerClass id="51">com.j2fe.streetlamp.activities.CreateJob</nodeHandlerClass>
<parameters id="52" type="java.util.HashSet">
<item id="53" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="54">configInfo</name>
<stringValue id="55">Bulk Publishing Parent Job</stringValue>
<type>CONSTANT</type>
</item>
<item id="56" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="57">jobId</name>
<stringValue id="58">PrntJobID</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<persistentVariables id="59" type="java.util.HashSet">
<item id="60" type="java.lang.String">PrntJobID
1000</item>
<item id="61" type="java.lang.String">JobNodes
1000</item>
</persistentVariables>
<sources id="62" type="java.util.HashSet">
<item id="63" type="com.j2fe.workflow.definition.Transition">
<name id="64">false</name>
<source id="65">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="66"/>
<directJoin>false</directJoin>
<name id="67">No Jobs?</name>
<nodeHandler>com.j2fe.general.activities.IsNull</nodeHandler>
<nodeHandlerClass id="68">com.j2fe.general.activities.IsNull</nodeHandlerClass>
<parameters id="69" type="java.util.HashSet">
<item id="70" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="71">input</name>
<stringValue id="72">JobNodes</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="73" type="java.util.HashSet">
<item id="74" type="com.j2fe.workflow.definition.Transition">
<name id="75">goto-next</name>
<source id="76">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="77"/>
<directJoin>false</directJoin>
<name id="78">Get jobs</name>
<nodeHandler>com.j2fe.workflow.handler.impl.ExecuteXPath</nodeHandler>
<nodeHandlerClass id="79">com.j2fe.workflow.handler.impl.ExecuteXPath</nodeHandlerClass>
<parameters id="80" type="java.util.HashSet">
<item id="81" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="82">inputText</name>
<stringValue id="83">JobXML</stringValue>
<type>VARIABLE</type>
</item>
<item id="84" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="85">outputNodes</name>
<stringValue id="86">JobNodes</stringValue>
<type>VARIABLE</type>
</item>
<item id="87" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="88">validating</name>
<stringValue id="89">true</stringValue>
<type>CONSTANT</type>
</item>
<item id="90" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="91">xPath</name>
<stringValue id="92">JobExtractionXPath</stringValue>
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
<name id="98">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="99">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="100" type="java.util.HashSet"/>
<targets id="101" type="java.util.HashSet">
<item idref="94" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="76"/>
</item>
</sources>
<targets id="102" type="java.util.HashSet">
<item idref="74" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="65"/>
</item>
</sources>
<targets id="103" type="java.util.HashSet">
<item idref="63" type="com.j2fe.workflow.definition.Transition"/>
<item id="104" type="com.j2fe.workflow.definition.Transition">
<name id="105">true</name>
<source idref="65"/>
<target id="106">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="107"/>
<directJoin>false</directJoin>
<name id="108">LogMessage</name>
<nodeHandler>com.j2fe.general.activities.LogMessage</nodeHandler>
<nodeHandlerClass id="109">com.j2fe.general.activities.LogMessage</nodeHandlerClass>
<parameters id="110" type="java.util.HashSet">
<item id="111" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="112">logLevel</name>
<stringValue id="113">ERROR</stringValue>
<type>CONSTANT</type>
</item>
<item id="114" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="115">message</name>
<stringValue id="116">No Jobs found</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="117" type="java.util.HashSet">
<item idref="104" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="118" type="java.util.HashSet">
<item id="119" type="com.j2fe.workflow.definition.Transition">
<name id="120">goto-next</name>
<source idref="106"/>
<target idref="3"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="48"/>
</item>
</sources>
<targets id="121" type="java.util.HashSet">
<item idref="46" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="41"/>
</item>
<item id="122" type="com.j2fe.workflow.definition.Transition">
<name id="123">goto-next</name>
<source id="124">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="125"/>
<directJoin>false</directJoin>
<name id="126">NOP</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="127">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="128" type="java.util.HashSet">
<item id="129" type="com.j2fe.workflow.definition.Transition">
<name id="130">goto-next</name>
<source id="131">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="132"/>
<directJoin>false</directJoin>
<name id="133">Close Job</name>
<nodeHandler>com.j2fe.streetlamp.activities.CloseJob</nodeHandler>
<nodeHandlerClass id="134">com.j2fe.streetlamp.activities.CloseJob</nodeHandlerClass>
<parameters id="135" type="java.util.HashSet">
<item id="136" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="137">jobId</name>
<stringValue id="138">JobID</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="139" type="java.util.HashSet">
<item id="140" type="com.j2fe.workflow.definition.Transition">
<name id="141">goto-next</name>
<source id="142">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="143"/>
<directJoin>true</directJoin>
<name id="144">Synchronize</name>
<nodeHandler>com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandler>
<nodeHandlerClass id="145">com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandlerClass>
<sources id="146" type="java.util.HashSet">
<item id="147" type="com.j2fe.workflow.definition.Transition">
<name id="148">goto-next</name>
<source id="149">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="150"/>
<directJoin>false</directJoin>
<name id="151">Raise Event Remote #1</name>
<nodeHandler>com.j2fe.event.RaiseEventRemote</nodeHandler>
<nodeHandlerClass id="152">com.j2fe.event.RaiseEventRemote</nodeHandlerClass>
<parameters id="153" type="java.util.HashSet">
<item id="154" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="155">eventName</name>
<stringValue id="156">MizBulkExtraction_Event</stringValue>
<type>CONSTANT</type>
</item>
<item id="157" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="158">["AuditId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="159">parameters["AuditId"]</name>
<stringValue id="160">auditIdentifier</stringValue>
<type>VARIABLE</type>
</item>
<item id="161" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="162">["ExtDefs"]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="163">parameters["ExtDefs"]</name>
<stringValue id="164">extDefsPerBranch</stringValue>
<type>VARIABLE</type>
</item>
<item id="165" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="166">["JMSDestination"]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="167">parameters["JMSDestination"]</name>
<stringValue id="168">queue</stringValue>
<type>VARIABLE</type>
</item>
<item id="169" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="170">["PublishingBulkSize"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="171">parameters["PublishingBulkSize"]</name>
<stringValue id="172">PublishingBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="173" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="174">["Threshold for Extraction Failures"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="175">parameters["Threshold for Extraction Failures"]</name>
<stringValue id="176">Threshold for Extraction Failures</stringValue>
<type>VARIABLE</type>
</item>
<item id="177" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="178">propertyFileLocation</name>
<stringValue id="179">db://resource/PublishingConfiguration/PublishingConfig.properties</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="180" type="java.util.HashSet">
<item id="181" type="com.j2fe.workflow.definition.Transition">
<name id="182">goto-next</name>
<source id="183">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="184"/>
<directJoin>true</directJoin>
<name id="185">Bulk Items</name>
<nodeHandler>com.j2fe.general.activities.BulkItems</nodeHandler>
<nodeHandlerClass id="186">com.j2fe.general.activities.BulkItems</nodeHandlerClass>
<parameters id="187" type="java.util.HashSet">
<item id="188" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="189">bulk</name>
<stringValue id="190">pubBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="191" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="192">input</name>
<stringValue id="193">extractDefinitions</stringValue>
<type>VARIABLE</type>
</item>
<item id="194" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="195">output</name>
<stringValue id="196">extDefsPerBranch</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<persistentVariables id="197" type="java.util.HashSet">
<item id="198" type="java.lang.String">JobConfigInfo
0000</item>
<item id="199" type="java.lang.String">extDefsPerBranch
1000</item>
<item id="200" type="java.lang.String">Job
0000</item>
<item id="201" type="java.lang.String">NewExtractionLogStartIndex
1000</item>
<item id="202" type="java.lang.String">queue
1000</item>
<item id="203" type="java.lang.String">extractDefinitions
0100</item>
<item id="204" type="java.lang.String">model
0000</item>
<item id="205" type="java.lang.String">sql
0000</item>
<item id="206" type="java.lang.String">auditIdentifier
1000</item>
<item id="207" type="java.lang.String">BulkSize
0000</item>
<item id="208" type="java.lang.String">PrntJobID
0000</item>
<item id="209" type="java.lang.String">rawsql
0000</item>
<item id="210" type="java.lang.String">pubBulkSize
0000</item>
<item id="211" type="java.lang.String">JobNodes
0000</item>
<item id="212" type="java.lang.String">JobID
0000</item>
<item id="213" type="java.lang.String">queryParameter
1000</item>
</persistentVariables>
<sources id="214" type="java.util.HashSet">
<item id="215" type="com.j2fe.workflow.definition.Transition">
<name id="216">goto-next</name>
<source id="217">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="218"/>
<directJoin>false</directJoin>
<name id="219">Calculate bulk size</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="220">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="221" type="java.util.HashSet">
<item id="222" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="223">statements</name>
<stringValue id="224">if(NoOfThreads &lt;= 0) {&#13;
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
<item id="225" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="226">["NoOfThreads"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="227">variables["NoOfThreads"]</name>
<stringValue id="228">No. Of Parallel Branches</stringValue>
<type>VARIABLE</type>
</item>
<item id="229" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="230">["bulkSize"]@java/lang/Integer@</UITypeHint>
<input>false</input>
<name id="231">variables["bulkSize"]</name>
<stringValue id="232">pubBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="233" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="234">["items"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="235">variables["items"]</name>
<stringValue id="236">extractDefinitions</stringValue>
<type>VARIABLE</type>
<variablePart id="237">length</variablePart>
</item>
</parameters>
<persistentVariables id="238" type="java.util.HashSet">
<item id="239" type="java.lang.String">pubBulkSize
1000</item>
</persistentVariables>
<sources id="240" type="java.util.HashSet">
<item id="241" type="com.j2fe.workflow.definition.Transition">
<name id="242">goto-next</name>
<source id="243">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="244"/>
<directJoin>false</directJoin>
<name id="245">Create Job  #2</name>
<nodeHandler>com.j2fe.streetlamp.activities.CreateJob</nodeHandler>
<nodeHandlerClass id="246">com.j2fe.streetlamp.activities.CreateJob</nodeHandlerClass>
<parameters id="247" type="java.util.HashSet">
<item id="248" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="249">configInfo</name>
<stringValue id="250">JobConfigInfo</stringValue>
<type>VARIABLE</type>
</item>
<item id="251" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="252">jobId</name>
<stringValue id="253">JobID</stringValue>
<type>VARIABLE</type>
</item>
<item id="254" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="255">parentJobId</name>
<stringValue id="256">PrntJobID</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<persistentVariables id="257" type="java.util.HashSet">
<item id="258" type="java.lang.String">JobID
1000</item>
</persistentVariables>
<sources id="259" type="java.util.HashSet">
<item id="260" type="com.j2fe.workflow.definition.Transition">
<name id="261">goto-next</name>
<source id="262">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="263"/>
<directJoin>false</directJoin>
<name id="264">Concatenate Strings</name>
<nodeHandler>com.j2fe.general.activities.ConcatenateStrings</nodeHandler>
<nodeHandlerClass id="265">com.j2fe.general.activities.ConcatenateStrings</nodeHandlerClass>
<parameters id="266" type="java.util.HashSet">
<item id="267" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="268">ignoreNullStrings</name>
<stringValue id="269">true</stringValue>
<type>CONSTANT</type>
</item>
<item id="270" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="271">inputStrings[0]</name>
<stringValue id="272">auditIdentifier</stringValue>
<type>VARIABLE</type>
</item>
<item id="273" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="274">inputStrings[1]</name>
<objectValue id="275" type="java.lang.String">-</objectValue>
<type>CONSTANT</type>
</item>
<item id="276" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="277">inputStrings[2]</name>
<stringValue id="278">model</stringValue>
<type>VARIABLE</type>
</item>
<item id="279" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="280">inputStrings[3]</name>
<objectValue id="281" type="java.lang.String">-</objectValue>
<type>CONSTANT</type>
</item>
<item id="282" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="283">inputStrings[4]</name>
<stringValue id="284">queue</stringValue>
<type>VARIABLE</type>
</item>
<item id="285" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="286">outputString</name>
<stringValue id="287">JobConfigInfo</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="288" type="java.util.HashSet">
<item id="289" type="com.j2fe.workflow.definition.Transition">
<name id="290">extraction</name>
<source id="291">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="292"/>
<directJoin>false</directJoin>
<name id="293">Counterparty Extraction Log</name>
<nodeHandler>com.thegoldensource.publishing.activity.WriteExtractionLog</nodeHandler>
<nodeHandlerClass id="294">com.thegoldensource.publishing.activity.WriteExtractionLog</nodeHandlerClass>
<parameters id="295" type="java.util.HashSet">
<item id="296" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="297">auditId</name>
<stringValue id="298">auditIdentifier</stringValue>
<type>VARIABLE</type>
</item>
<item id="299" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="300">entityMode</name>
<stringValue id="301">MODEL_ENTITY</stringValue>
<type>CONSTANT</type>
</item>
<item id="302" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="303">eql</name>
<stringValue id="304">sql</stringValue>
<type>VARIABLE</type>
</item>
<item id="305" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="306">extractDefinitions</name>
<stringValue id="307">extractDefinitions</stringValue>
<type>VARIABLE</type>
</item>
<item id="308" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="309">extractorFactory</name>
<stringValue id="310">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="311" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="312">maxExtractCount</name>
<stringValue id="313">PublishingBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="314" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="315">maxExtractCount</name>
<stringValue id="316">BulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="317" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="318">modelName</name>
<stringValue id="319">model</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="320" type="java.util.HashSet">
<item id="321" type="com.j2fe.workflow.definition.Transition">
<name id="322">goto-next</name>
<source id="323">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="324"/>
<directJoin>false</directJoin>
<name id="325">start publishing</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="326">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="327" type="java.util.HashSet">
<item id="328" type="com.j2fe.workflow.definition.Transition">
<name id="329">false</name>
<source id="330">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="331"/>
<directJoin>false</directJoin>
<name id="332">No queue?</name>
<nodeHandler>com.j2fe.general.activities.IsNull</nodeHandler>
<nodeHandlerClass id="333">com.j2fe.general.activities.IsNull</nodeHandlerClass>
<parameters id="334" type="java.util.HashSet">
<item id="335" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="336">input</name>
<stringValue id="337">queue</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="338" type="java.util.HashSet">
<item id="339" type="com.j2fe.workflow.definition.Transition">
<name id="340">goto-next</name>
<source id="341">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="342"/>
<directJoin>false</directJoin>
<name id="343">Get jms dest</name>
<nodeHandler>com.j2fe.workflow.handler.impl.ExecuteXPath</nodeHandler>
<nodeHandlerClass id="344">com.j2fe.workflow.handler.impl.ExecuteXPath</nodeHandlerClass>
<parameters id="345" type="java.util.HashSet">
<item id="346" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="347">input</name>
<stringValue id="348">Job</stringValue>
<type>VARIABLE</type>
</item>
<item id="349" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="350">outputValue</name>
<stringValue id="351">queue</stringValue>
<type>VARIABLE</type>
</item>
<item id="352" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="353">xPath</name>
<stringValue id="354">@destinationJMS</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="355" type="java.util.HashSet">
<item id="356" type="com.j2fe.workflow.definition.Transition">
<name id="357">goto-next</name>
<source id="358">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="359"/>
<directJoin>false</directJoin>
<name id="360">make sql string</name>
<nodeHandler>com.j2fe.general.activities.ConcatenateStrings</nodeHandler>
<nodeHandlerClass id="361">com.j2fe.general.activities.ConcatenateStrings</nodeHandlerClass>
<parameters id="362" type="java.util.HashSet">
<item id="363" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="364">inputStrings[0]</name>
<objectValue id="365" type="java.lang.String">&lt;sql&gt;</objectValue>
<type>CONSTANT</type>
</item>
<item id="366" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="367">inputStrings[1]</name>
<stringValue id="368">rawsql</stringValue>
<type>VARIABLE</type>
</item>
<item id="369" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="370">inputStrings[2]</name>
<objectValue id="371" type="java.lang.String">&lt;/sql&gt;</objectValue>
<type>CONSTANT</type>
</item>
<item id="372" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="373">outputString</name>
<stringValue id="374">sql</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<persistentVariables id="375" type="java.util.HashSet">
<item id="376" type="java.lang.String">sql
1000</item>
</persistentVariables>
<sources id="377" type="java.util.HashSet">
<item id="378" type="com.j2fe.workflow.definition.Transition">
<name id="379">false</name>
<source id="380">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="381"/>
<directJoin>false</directJoin>
<name id="382">No Sql?</name>
<nodeHandler>com.j2fe.general.activities.IsNull</nodeHandler>
<nodeHandlerClass id="383">com.j2fe.general.activities.IsNull</nodeHandlerClass>
<parameters id="384" type="java.util.HashSet">
<item id="385" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="386">input</name>
<stringValue id="387">rawsql</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="388" type="java.util.HashSet">
<item id="389" type="com.j2fe.workflow.definition.Transition">
<name id="390">goto-next</name>
<source id="391">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="392"/>
<directJoin>false</directJoin>
<name id="393">Get sql</name>
<nodeHandler>com.j2fe.workflow.handler.impl.ExecuteXPath</nodeHandler>
<nodeHandlerClass id="394">com.j2fe.workflow.handler.impl.ExecuteXPath</nodeHandlerClass>
<parameters id="395" type="java.util.HashSet">
<item id="396" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="397">input</name>
<stringValue id="398">Job</stringValue>
<type>VARIABLE</type>
</item>
<item id="399" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="400">outputValue</name>
<stringValue id="401">rawsql</stringValue>
<type>VARIABLE</type>
</item>
<item id="402" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="403">xPath</name>
<stringValue id="404">sql</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="405" type="java.util.HashSet">
<item id="406" type="com.j2fe.workflow.definition.Transition">
<name id="407">false</name>
<source id="408">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="409"/>
<directJoin>false</directJoin>
<name id="410">no modelID?</name>
<nodeHandler>com.j2fe.general.activities.IsNull</nodeHandler>
<nodeHandlerClass id="411">com.j2fe.general.activities.IsNull</nodeHandlerClass>
<parameters id="412" type="java.util.HashSet">
<item id="413" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="414">input</name>
<stringValue id="415">model</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="416" type="java.util.HashSet">
<item id="417" type="com.j2fe.workflow.definition.Transition">
<name id="418">goto-next</name>
<source id="419">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="420"/>
<directJoin>false</directJoin>
<name id="421">Get ModelId</name>
<nodeHandler>com.j2fe.workflow.handler.impl.ExecuteXPath</nodeHandler>
<nodeHandlerClass id="422">com.j2fe.workflow.handler.impl.ExecuteXPath</nodeHandlerClass>
<parameters id="423" type="java.util.HashSet">
<item id="424" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="425">input</name>
<stringValue id="426">Job</stringValue>
<type>VARIABLE</type>
</item>
<item id="427" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="428">outputValue</name>
<stringValue id="429">model</stringValue>
<type>VARIABLE</type>
</item>
<item id="430" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="431">xPath</name>
<stringValue id="432">@modelId</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="433" type="java.util.HashSet">
<item id="434" type="com.j2fe.workflow.definition.Transition">
<name id="435">loop</name>
<source idref="21"/>
<target idref="419"/>
</item>
</sources>
<targets id="436" type="java.util.HashSet">
<item idref="417" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="408"/>
</item>
</sources>
<targets id="437" type="java.util.HashSet">
<item idref="406" type="com.j2fe.workflow.definition.Transition"/>
<item id="438" type="com.j2fe.workflow.definition.Transition">
<name id="439">true</name>
<source idref="408"/>
<target idref="3"/>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="391"/>
</item>
</sources>
<targets id="440" type="java.util.HashSet">
<item idref="389" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="380"/>
</item>
</sources>
<targets id="441" type="java.util.HashSet">
<item idref="378" type="com.j2fe.workflow.definition.Transition"/>
<item id="442" type="com.j2fe.workflow.definition.Transition">
<name id="443">true</name>
<source idref="380"/>
<target idref="3"/>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="358"/>
</item>
</sources>
<targets id="444" type="java.util.HashSet">
<item idref="356" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="341"/>
</item>
</sources>
<targets id="445" type="java.util.HashSet">
<item idref="339" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="330"/>
</item>
</sources>
<targets id="446" type="java.util.HashSet">
<item idref="328" type="com.j2fe.workflow.definition.Transition"/>
<item id="447" type="com.j2fe.workflow.definition.Transition">
<name id="448">true</name>
<source idref="330"/>
<target idref="3"/>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="323"/>
</item>
</sources>
<targets id="449" type="java.util.HashSet">
<item idref="321" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="291"/>
</item>
</sources>
<targets id="450" type="java.util.HashSet">
<item idref="289" type="com.j2fe.workflow.definition.Transition"/>
<item id="451" type="com.j2fe.workflow.definition.Transition">
<name id="452">no-extraction</name>
<source idref="291"/>
<target idref="124"/>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="262"/>
</item>
</sources>
<targets id="453" type="java.util.HashSet">
<item idref="260" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="243"/>
</item>
</sources>
<targets id="454" type="java.util.HashSet">
<item idref="241" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="217"/>
</item>
</sources>
<targets id="455" type="java.util.HashSet">
<item idref="215" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="183"/>
</item>
</sources>
<targets id="456" type="java.util.HashSet">
<item idref="181" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDSPLIT</type>
</source>
<target idref="149"/>
</item>
</sources>
<targets id="457" type="java.util.HashSet">
<item idref="147" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="142"/>
</item>
</sources>
<targets id="458" type="java.util.HashSet">
<item idref="140" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDJOIN</type>
</source>
<target idref="131"/>
</item>
</sources>
<targets id="459" type="java.util.HashSet">
<item idref="129" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="124"/>
</item>
<item idref="451" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="460" type="java.util.HashSet">
<item idref="122" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="41"/>
</item>
</sources>
<targets id="461" type="java.util.HashSet">
<item idref="39" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="21"/>
</item>
</sources>
<targets id="462" type="java.util.HashSet">
<item idref="19" type="com.j2fe.workflow.definition.Transition"/>
<item idref="434" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="10"/>
</item>
</sources>
<targets id="463" type="java.util.HashSet">
<item idref="8" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="3"/>
</item>
<item idref="119" type="com.j2fe.workflow.definition.Transition"/>
<item idref="442" type="com.j2fe.workflow.definition.Transition"/>
<item idref="447" type="com.j2fe.workflow.definition.Transition"/>
<item idref="438" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="464" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="465">Mizuho/Publishing</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="466">user1</lastChangeUser>
<lastUpdate id="467">2025-11-20T00:44:32.000+0000</lastUpdate>
<name id="468">PublishUsingXML</name>
<nodes id="469" type="java.util.HashSet">
<item idref="183" type="com.j2fe.workflow.definition.Node"/>
<item idref="217" type="com.j2fe.workflow.definition.Node"/>
<item idref="131" type="com.j2fe.workflow.definition.Node"/>
<item idref="10" type="com.j2fe.workflow.definition.Node"/>
<item idref="262" type="com.j2fe.workflow.definition.Node"/>
<item idref="291" type="com.j2fe.workflow.definition.Node"/>
<item idref="48" type="com.j2fe.workflow.definition.Node"/>
<item idref="243" type="com.j2fe.workflow.definition.Node"/>
<item idref="419" type="com.j2fe.workflow.definition.Node"/>
<item idref="341" type="com.j2fe.workflow.definition.Node"/>
<item idref="76" type="com.j2fe.workflow.definition.Node"/>
<item idref="391" type="com.j2fe.workflow.definition.Node"/>
<item idref="21" type="com.j2fe.workflow.definition.Node"/>
<item idref="106" type="com.j2fe.workflow.definition.Node"/>
<item idref="124" type="com.j2fe.workflow.definition.Node"/>
<item idref="65" type="com.j2fe.workflow.definition.Node"/>
<item idref="380" type="com.j2fe.workflow.definition.Node"/>
<item idref="330" type="com.j2fe.workflow.definition.Node"/>
<item idref="149" type="com.j2fe.workflow.definition.Node"/>
<item idref="96" type="com.j2fe.workflow.definition.Node"/>
<item idref="3" type="com.j2fe.workflow.definition.Node"/>
<item idref="142" type="com.j2fe.workflow.definition.Node"/>
<item idref="358" type="com.j2fe.workflow.definition.Node"/>
<item idref="41" type="com.j2fe.workflow.definition.Node"/>
<item idref="408" type="com.j2fe.workflow.definition.Node"/>
<item idref="323" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>true</optimize>
<parameter id="470" type="java.util.HashMap">
<entry>
<key id="471" type="java.lang.String">JobExtractionXPath</key>
<value id="472" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="473">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="474" type="java.lang.String">JobLoop</key>
<value id="475" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="476">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<input>true</input>
<output>true</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="477" type="java.lang.String">JobXML</key>
<value id="478" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="479">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="480">Sample XML = &lt;?xml version="1.0" encoding="UTF-8"?&gt;&#13;
&lt;root&gt;&#13;
	&lt;job modelId="PCUSTONB" destinationJMS="jms/queue/client"&gt;&#13;
		&lt;sql&gt;select 'GRroN8QG81' from dual&lt;/sql&gt;&#13;
	&lt;/job&gt;&#13;
	&lt;job modelId="ISSUPUB" destinationJMS="jms/queue/security"&gt;&#13;
		&lt;sql&gt;select instr_id from ft_t_issu where instr_id = 'It6&amp;amp;05n%e1'&lt;/sql&gt;&#13;
	&lt;/job&gt;&#13;
	&lt;job modelId="ISSRPUB" destinationJMS="jms/queue/issuer"&gt;&#13;
		&lt;sql&gt;select instr_issr_id from ft_t_issr where instr_issr_id in (select instr_issr_id from ft_t_irid where issr_id = 'ABNAMRBN')&lt;/sql&gt;&#13;
	&lt;/job&gt;&#13;
	&lt;job modelId="LAGR_PUB" destinationJMS="jms/queue/legalAgreement"&gt;&#13;
		&lt;sql&gt;select 'pbAs685a81' from dual&lt;/sql&gt;&#13;
	&lt;/job&gt;&#13;
&lt;/root&gt;&#13;
</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="481" type="java.lang.String">No. Of Parallel Branches</key>
<value id="482" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="483">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="484">Defines how many parallel branches to be run for publishing.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="485" type="java.lang.String">PublishingBulkSize</key>
<value id="486" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="487">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="488">Defines how many entities you want to extract in one bulk.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="489" type="java.lang.String">Threshold for Extraction Failures</key>
<value id="490" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="491">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="492">Value for this field should be specified in x/y format, both x and y is numeric. 
Here x is percentage of instruments allowed to fail during extraction and y is minimum sampling size.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
</parameter>
<permissions id="493" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>true</purgeAtEnd>
<retries>3</retries>
<startNode idref="96"/>
<status>RELEASED</status>
<variables id="494" type="java.util.HashMap">
<entry>
<key id="495" type="java.lang.String">JobExtractionXPath</key>
<value id="496" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="497">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="498" type="java.lang.String">/root/job</value>
</value>
</entry>
<entry>
<key id="499" type="java.lang.String">JobLoop</key>
<value id="500" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="501">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<persistent>false</persistent>
<value id="502" type="java.lang.Integer">0</value>
</value>
</entry>
<entry>
<key id="503" type="java.lang.String">JobXML</key>
<value id="504" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="505">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="506">Sample XML = &lt;?xml version="1.0" encoding="UTF-8"?&gt;&#13;
&lt;root&gt;&#13;
	&lt;job modelId="PCUSTONB" destinationJMS="jms/queue/client"&gt;&#13;
		&lt;sql&gt;select 'GRroN8QG81' from dual&lt;/sql&gt;&#13;
	&lt;/job&gt;&#13;
	&lt;job modelId="ISSUPUB" destinationJMS="jms/queue/security"&gt;&#13;
		&lt;sql&gt;select instr_id from ft_t_issu where instr_id = 'It6&amp;amp;05n%e1'&lt;/sql&gt;&#13;
	&lt;/job&gt;&#13;
	&lt;job modelId="ISSRPUB" destinationJMS="jms/queue/issuer"&gt;&#13;
		&lt;sql&gt;select instr_issr_id from ft_t_issr where instr_issr_id in (select instr_issr_id from ft_t_irid where issr_id = 'ABNAMRBN')&lt;/sql&gt;&#13;
	&lt;/job&gt;&#13;
	&lt;job modelId="LAGR_PUB" destinationJMS="jms/queue/legalAgreement"&gt;&#13;
		&lt;sql&gt;select 'pbAs685a81' from dual&lt;/sql&gt;&#13;
	&lt;/job&gt;&#13;
&lt;/root&gt;&#13;
</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="507" type="java.lang.String">No. Of Parallel Branches</key>
<value id="508" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="509">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="510">Defines how many parallel branches to be run for publishing.</description>
<persistent>false</persistent>
<value id="511" type="java.lang.Integer">5</value>
</value>
</entry>
<entry>
<key id="512" type="java.lang.String">PublishingBulkSize</key>
<value id="513" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="514">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="515">Defines how many entities you want to extract in one bulk.</description>
<persistent>false</persistent>
<value id="516" type="java.lang.Integer">100</value>
</value>
</entry>
<entry>
<key id="517" type="java.lang.String">Threshold for Extraction Failures</key>
<value id="518" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="519">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="520">Value for this field should be specified in x/y format, both x and y is numeric. 
Here x is percentage of instruments allowed to fail during extraction and y is minimum sampling size.</description>
<persistent>false</persistent>
</value>
</entry>
</variables>
<version>12</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
