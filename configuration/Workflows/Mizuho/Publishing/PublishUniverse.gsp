<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.07">
<package-comment/>
<businessobject displayString="11 - JMSQConfig RemotePub" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>false</alwaysPersist>
<clustered>false</clustered>
<comment id="1">JMSQConfig RemotePub</comment>
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
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="11"/>
<directJoin>true</directJoin>
<name id="12">Synchronize</name>
<nodeHandler>com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandler>
<nodeHandlerClass id="13">com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandlerClass>
<sources id="14" type="java.util.HashSet">
<item id="15" type="com.j2fe.workflow.definition.Transition">
<name id="16">goto-next</name>
<source id="17">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="18"/>
<directJoin>false</directJoin>
<name id="19">Raise Event Remote #1</name>
<nodeHandler>com.j2fe.event.RaiseEventRemote</nodeHandler>
<nodeHandlerClass id="20">com.j2fe.event.RaiseEventRemote</nodeHandlerClass>
<parameters id="21" type="java.util.HashSet">
<item id="22" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="23">eventName</name>
<stringValue id="24">MizBulkExtraction_Event</stringValue>
<type>CONSTANT</type>
</item>
<item id="25" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="26">["AuditId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="27">parameters["AuditId"]</name>
<stringValue id="28">auditIdentifier</stringValue>
<type>VARIABLE</type>
</item>
<item id="29" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="30">["ExtDefs"]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="31">parameters["ExtDefs"]</name>
<stringValue id="32">extDefsPerBranch</stringValue>
<type>VARIABLE</type>
</item>
<item id="33" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="34">["JMSDestination"]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="35">parameters["JMSDestination"]</name>
<stringValue id="36">AssetQueue</stringValue>
<type>VARIABLE</type>
</item>
<item id="37" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="38">["PublishingBulkSize"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="39">parameters["PublishingBulkSize"]</name>
<stringValue id="40">pubBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="41" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="42">propertyFileLocation</name>
<stringValue id="43">db://resource/PublishingConfiguration/PublishingConfig.properties</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="44" type="java.util.HashSet">
<item id="45" type="com.j2fe.workflow.definition.Transition">
<name id="46">ISSUPUB</name>
<source id="47">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="48"/>
<directJoin>false</directJoin>
<name id="49">Switch Case</name>
<nodeHandler>com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandler>
<nodeHandlerClass id="50">com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandlerClass>
<parameters id="51" type="java.util.HashSet">
<item id="52" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="53">caseItem</name>
<stringValue id="54">publishModel</stringValue>
<type>VARIABLE</type>
</item>
<item id="55" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="56">defaultItem</name>
<stringValue id="57">null</stringValue>
<type>CONSTANT</type>
</item>
<item id="58" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="59">nullTransition</name>
<stringValue id="60">null</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="61" type="java.util.HashSet">
<item id="62" type="com.j2fe.workflow.definition.Transition">
<name id="63">goto-next</name>
<source id="64">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="65"/>
<directJoin>true</directJoin>
<name id="66">Bulk Items</name>
<nodeHandler>com.j2fe.general.activities.BulkItems</nodeHandler>
<nodeHandlerClass id="67">com.j2fe.general.activities.BulkItems</nodeHandlerClass>
<parameters id="68" type="java.util.HashSet">
<item id="69" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="70">bulk</name>
<stringValue id="71">pubBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="72" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="73">input</name>
<stringValue id="74">extractDefinitions</stringValue>
<type>VARIABLE</type>
</item>
<item id="75" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="76">output</name>
<stringValue id="77">extDefsPerBranch</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="78" type="java.util.HashSet">
<item id="79" type="com.j2fe.workflow.definition.Transition">
<name id="80">goto-next</name>
<source id="81">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="82"/>
<directJoin>false</directJoin>
<name id="83">Bean Shell Script (Standard)</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="84">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="85" type="java.util.HashSet">
<item id="86" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="87">statements</name>
<stringValue id="88">int bulkSize=0;&#13;
if(items &lt; 20)&#13;
{&#13;
bulkSize = 1;&#13;
}&#13;
else {&#13;
bulkSize = items / 20;&#13;
	if(items % 20 != 0)&#13;
	{&#13;
	bulkSize = bulkSize +1;&#13;
	}&#13;
}&#13;
</stringValue>
<type>CONSTANT</type>
</item>
<item id="89" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="90">["NoOfThreads"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="91">variables["NoOfThreads"]</name>
<objectValue id="92" type="java.lang.Integer">20</objectValue>
<type>CONSTANT</type>
</item>
<item id="93" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="94">["bulkSize"]@java/lang/Integer@</UITypeHint>
<input>false</input>
<name id="95">variables["bulkSize"]</name>
<stringValue id="96">pubBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="97" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="98">["items"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="99">variables["items"]</name>
<stringValue id="100">extractDefinitions</stringValue>
<type>VARIABLE</type>
<variablePart id="101">length</variablePart>
</item>
</parameters>
<sources id="102" type="java.util.HashSet">
<item id="103" type="com.j2fe.workflow.definition.Transition">
<name id="104">extraction</name>
<source id="105">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="106"/>
<directJoin>false</directJoin>
<name id="107">Extraction Log</name>
<nodeHandler>com.thegoldensource.publishing.activity.WriteExtractionLog</nodeHandler>
<nodeHandlerClass id="108">com.thegoldensource.publishing.activity.WriteExtractionLog</nodeHandlerClass>
<parameters id="109" type="java.util.HashSet">
<item id="110" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="111">auditId</name>
<stringValue id="112">auditIdentifier</stringValue>
<type>VARIABLE</type>
</item>
<item id="113" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="114">entityMode</name>
<stringValue id="115">MODEL_ENTITY</stringValue>
<type>CONSTANT</type>
</item>
<item id="116" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="117">eql</name>
<stringValue id="118">PublishQuery</stringValue>
<type>VARIABLE</type>
</item>
<item id="119" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="120">extractDefinitions</name>
<stringValue id="121">extractDefinitions</stringValue>
<type>VARIABLE</type>
<variablePart id="122"/>
</item>
<item id="123" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="124">extractorFactory</name>
<stringValue id="125">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="126" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="127">maxExtractCount</name>
<stringValue id="128">100</stringValue>
<type>CONSTANT</type>
</item>
<item id="129" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="130">modelName</name>
<stringValue id="131">publishModel</stringValue>
<type>VARIABLE</type>
</item>
<item id="132" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="133">queryParameter</name>
<stringValue id="134">queryParameter</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="135" type="java.util.HashSet">
<item id="136" type="com.j2fe.workflow.definition.Transition">
<name id="137">ToSplit</name>
<source id="138">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="139">Automatically generated</description>
<directJoin>false</directJoin>
<name id="140">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="141">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="142" type="java.util.HashSet">
<item id="143" type="com.j2fe.workflow.definition.Transition">
<name id="144">goto-next</name>
<source id="145">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="146"/>
<directJoin>false</directJoin>
<name id="147">Asset Publish Query</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="148">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="149" type="java.util.HashSet">
<item id="150" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="151">statements</name>
<stringValue id="152">String query="&lt;sql&gt;instr_id in (select instr_id from ft_t_isgp where prt_purp_typ = '" + universe +"' and end_tms is null)&lt;/sql&gt;";&#13;
</stringValue>
<type>CONSTANT</type>
</item>
<item id="153" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="154">["query"]@java/lang/Integer@</UITypeHint>
<input>false</input>
<name id="155">variables["query"]</name>
<stringValue id="156">PublishQuery</stringValue>
<type>VARIABLE</type>
</item>
<item id="157" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="158">variables["universe"]</name>
<stringValue id="159">universe</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="160" type="java.util.HashSet">
<item id="161" type="com.j2fe.workflow.definition.Transition">
<name id="162">ISSUPUB</name>
<source id="163">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="164"/>
<directJoin>false</directJoin>
<name id="165">Switch Case</name>
<nodeHandler>com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandler>
<nodeHandlerClass id="166">com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandlerClass>
<parameters id="167" type="java.util.HashSet">
<item id="168" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="169">caseItem</name>
<stringValue id="170">publishModel</stringValue>
<type>VARIABLE</type>
</item>
<item id="171" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="172">defaultItem</name>
<stringValue id="173">null</stringValue>
<type>CONSTANT</type>
</item>
<item id="174" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="175">nullTransition</name>
<stringValue id="176">null</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="177" type="java.util.HashSet">
<item id="178" type="com.j2fe.workflow.definition.Transition">
<name id="179">goto-next</name>
<source id="180">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="181"/>
<directJoin>false</directJoin>
<name id="182">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="183">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="184" type="java.util.HashSet"/>
<targets id="185" type="java.util.HashSet">
<item idref="178" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="163"/>
</item>
</sources>
<targets id="186" type="java.util.HashSet">
<item id="187" type="com.j2fe.workflow.definition.Transition">
<name id="188">ISSRPUB</name>
<source idref="163"/>
<target id="189">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="190"/>
<directJoin>false</directJoin>
<name id="191">Party Publish Query</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="192">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="193" type="java.util.HashSet">
<item id="194" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="195">statements</name>
<stringValue id="196">String query="&lt;sql&gt;instr_issr_id in (select instr_issr_id from ft_t_irgp where prt_purp_typ = '" + universe +"' and end_tms is null)&lt;/sql&gt;";&#13;
</stringValue>
<type>CONSTANT</type>
</item>
<item id="197" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="198">["query"]@java/lang/Integer@</UITypeHint>
<input>false</input>
<name id="199">variables["query"]</name>
<stringValue id="200">PublishQuery</stringValue>
<type>VARIABLE</type>
</item>
<item id="201" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="202">variables["universe"]</name>
<stringValue id="203">universe</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="204" type="java.util.HashSet">
<item idref="187" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="205" type="java.util.HashSet">
<item id="206" type="com.j2fe.workflow.definition.Transition">
<name id="207">goto-next</name>
<source idref="189"/>
<target idref="138"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item idref="161" type="com.j2fe.workflow.definition.Transition"/>
<item id="208" type="com.j2fe.workflow.definition.Transition">
<name id="209">null</name>
<source idref="163"/>
<target idref="3"/>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="145"/>
</item>
</sources>
<targets id="210" type="java.util.HashSet">
<item idref="143" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="138"/>
</item>
<item idref="206" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="211" type="java.util.HashSet">
<item idref="136" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="105"/>
</item>
</sources>
<targets id="212" type="java.util.HashSet">
<item idref="103" type="com.j2fe.workflow.definition.Transition"/>
<item id="213" type="com.j2fe.workflow.definition.Transition">
<name id="214">no-extraction</name>
<source idref="105"/>
<target idref="3"/>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="81"/>
</item>
</sources>
<targets id="215" type="java.util.HashSet">
<item idref="79" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="64"/>
</item>
</sources>
<targets id="216" type="java.util.HashSet">
<item idref="62" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDSPLIT</type>
</source>
<target idref="47"/>
</item>
</sources>
<targets id="217" type="java.util.HashSet">
<item id="218" type="com.j2fe.workflow.definition.Transition">
<name id="219">ISSRPUB</name>
<source idref="47"/>
<target id="220">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="221"/>
<directJoin>false</directJoin>
<name id="222">Raise Event Remote #2</name>
<nodeHandler>com.j2fe.event.RaiseEventRemote</nodeHandler>
<nodeHandlerClass id="223">com.j2fe.event.RaiseEventRemote</nodeHandlerClass>
<parameters id="224" type="java.util.HashSet">
<item id="225" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="226">eventName</name>
<stringValue id="227">MizBulkExtraction_Event</stringValue>
<type>CONSTANT</type>
</item>
<item id="228" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="229">["AuditId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="230">parameters["AuditId"]</name>
<stringValue id="231">auditIdentifier</stringValue>
<type>VARIABLE</type>
</item>
<item id="232" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="233">["ExtDefs"]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="234">parameters["ExtDefs"]</name>
<stringValue id="235">extDefsPerBranch</stringValue>
<type>VARIABLE</type>
</item>
<item id="236" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="237">["JMSDestination"]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="238">parameters["JMSDestination"]</name>
<stringValue id="239">PartyQueue</stringValue>
<type>VARIABLE</type>
</item>
<item id="240" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="241">["PublishingBulkSize"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="242">parameters["PublishingBulkSize"]</name>
<stringValue id="243">pubBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="244" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="245">propertyFileLocation</name>
<stringValue id="246">db://resource/PublishingConfiguration/PublishingConfig.properties</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="247" type="java.util.HashSet">
<item idref="218" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="248" type="java.util.HashSet">
<item id="249" type="com.j2fe.workflow.definition.Transition">
<name id="250">goto-next</name>
<source idref="220"/>
<target idref="10"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item idref="45" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="17"/>
</item>
</sources>
<targets id="251" type="java.util.HashSet">
<item idref="15" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="10"/>
</item>
<item idref="249" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="252" type="java.util.HashSet">
<item idref="8" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDJOIN</type>
</source>
<target idref="3"/>
</item>
<item idref="213" type="com.j2fe.workflow.definition.Transition"/>
<item idref="208" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="253" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="254">Mizuho/Publishing</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="255">user1</lastChangeUser>
<lastUpdate id="256">2025-11-11T01:20:15.000+0000</lastUpdate>
<name id="257">PublishUniverse</name>
<nodes id="258" type="java.util.HashSet">
<item idref="145" type="com.j2fe.workflow.definition.Node"/>
<item idref="81" type="com.j2fe.workflow.definition.Node"/>
<item idref="64" type="com.j2fe.workflow.definition.Node"/>
<item idref="105" type="com.j2fe.workflow.definition.Node"/>
<item idref="138" type="com.j2fe.workflow.definition.Node"/>
<item idref="189" type="com.j2fe.workflow.definition.Node"/>
<item idref="17" type="com.j2fe.workflow.definition.Node"/>
<item idref="220" type="com.j2fe.workflow.definition.Node"/>
<item idref="180" type="com.j2fe.workflow.definition.Node"/>
<item idref="3" type="com.j2fe.workflow.definition.Node"/>
<item idref="163" type="com.j2fe.workflow.definition.Node"/>
<item idref="47" type="com.j2fe.workflow.definition.Node"/>
<item idref="10" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>true</optimize>
<parameter id="259" type="java.util.HashMap">
<entry>
<key id="260" type="java.lang.String">AssetQueue</key>
<value id="261" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="262">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="263"/>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="264" type="java.lang.String">PartyQueue</key>
<value id="265" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="266">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="267"/>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="268" type="java.lang.String">publishModel</key>
<value id="269" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="270">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="271">Publishing model - ISSUPUB or ISSRPUB</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="272" type="java.lang.String">universe</key>
<value id="273" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="274">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="275">The Universe to publish</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
</parameter>
<permissions id="276" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>false</purgeAtEnd>
<retries>0</retries>
<startNode idref="180"/>
<status>RELEASED</status>
<variables id="277" type="java.util.HashMap">
<entry>
<key id="278" type="java.lang.String">AssetQueue</key>
<value id="279" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="280">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="281"/>
<persistent>false</persistent>
<value id="282" type="java.lang.String">jms/queue/security</value>
</value>
</entry>
<entry>
<key id="283" type="java.lang.String">PartyQueue</key>
<value id="284" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="285">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="286"/>
<persistent>false</persistent>
<value id="287" type="java.lang.String">jms/queue/issuer</value>
</value>
</entry>
<entry>
<key id="288" type="java.lang.String">publishModel</key>
<value id="289" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="290">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="291">Publishing model - ISSUPUB or ISSRPUB</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="292" type="java.lang.String">universe</key>
<value id="293" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="294">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="295">The Universe to publish</description>
<persistent>false</persistent>
<value id="296" type="java.lang.String">INTEREST</value>
</value>
</entry>
</variables>
<version>11</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
