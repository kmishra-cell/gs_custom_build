<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.07">
<package-comment/>
<businessobject displayString="9 - v10 Parallel Branches" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>false</alwaysPersist>
<clustered>false</clustered>
<comment id="1">v10 Parallel Branches</comment>
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
<name id="11">NOP</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="12">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="13" type="java.util.HashSet">
<item id="14" type="com.j2fe.workflow.definition.Transition">
<name id="15">goto-next</name>
<source id="16">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="17"/>
<directJoin>true</directJoin>
<name id="18">Synchronize</name>
<nodeHandler>com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandler>
<nodeHandlerClass id="19">com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandlerClass>
<sources id="20" type="java.util.HashSet">
<item id="21" type="com.j2fe.workflow.definition.Transition">
<name id="22">goto-next</name>
<source id="23">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="24"/>
<directJoin>false</directJoin>
<name id="25">Call Subworkflow</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="26">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="27" type="java.util.HashSet">
<item id="28" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="29">["AuditId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="30">input["AuditId"]</name>
<stringValue id="31">auditIdentifier</stringValue>
<type>VARIABLE</type>
</item>
<item id="32" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="33">["ExtDefs"]@[Ljava/lang/Object;@</UITypeHint>
<input>true</input>
<name id="34">input["ExtDefs"]</name>
<stringValue id="35">extDefsPerBranch</stringValue>
<type>VARIABLE</type>
</item>
<item id="36" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="37">["Handle Extraction Failures"]@com/thegoldensource/subscription/ExceptionHandlingMode@</UITypeHint>
<input>true</input>
<name id="38">input["Handle Extraction Failures"]</name>
<stringValue id="39">Handle Extraction Failures</stringValue>
<type>VARIABLE</type>
</item>
<item id="40" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="41">["JMSDestination"]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="42">input["JMSDestination"]</name>
<stringValue id="43">jmsDestination</stringValue>
<type>VARIABLE</type>
</item>
<item id="44" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="45">["PublishingBulkSize"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="46">input["PublishingBulkSize"]</name>
<stringValue id="47">PublishingBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="48" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="49">["Threshold for Extraction Failures"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="50">input["Threshold for Extraction Failures"]</name>
<stringValue id="51">Threshold for Extraction Failures</stringValue>
<type>VARIABLE</type>
</item>
<item id="52" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="53">name</name>
<stringValue id="54">MizBulkExtraction</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="55" type="java.util.HashSet">
<item id="56" type="com.j2fe.workflow.definition.Transition">
<name id="57">goto-next</name>
<source id="58">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="59"/>
<directJoin>true</directJoin>
<name id="60">Bulk Items</name>
<nodeHandler>com.j2fe.general.activities.BulkItems</nodeHandler>
<nodeHandlerClass id="61">com.j2fe.general.activities.BulkItems</nodeHandlerClass>
<parameters id="62" type="java.util.HashSet">
<item id="63" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="64">bulk</name>
<stringValue id="65">pubBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="66" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="67">input</name>
<stringValue id="68">extractDefinitions</stringValue>
<type>VARIABLE</type>
</item>
<item id="69" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="70">output</name>
<stringValue id="71">extDefsPerBranch</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<persistentVariables id="72" type="java.util.HashSet">
<item id="73" type="java.lang.String">extDefsPerBranch
1000</item>
<item id="74" type="java.lang.String">extractDefinitions
1000</item>
<item id="75" type="java.lang.String">PublishQuery
1000</item>
<item id="76" type="java.lang.String">auditIdentifier
1000</item>
<item id="77" type="java.lang.String">pubBulkSize
1000</item>
<item id="78" type="java.lang.String">queryParameter
1000</item>
</persistentVariables>
<sources id="79" type="java.util.HashSet">
<item id="80" type="com.j2fe.workflow.definition.Transition">
<name id="81">goto-next</name>
<source id="82">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="83"/>
<directJoin>false</directJoin>
<name id="84">Bean Shell Script (Standard)</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="85">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="86" type="java.util.HashSet">
<item id="87" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="88">statements</name>
<stringValue id="89">if(NoOfThreads &lt;= 0) {
	NoOfThreads = 1;
}
else if(items &lt; NoOfThreads)
{
NoOfThreads = items;
}
bulkSize = items / NoOfThreads;
if(items % NoOfThreads != 0)
{
bulkSize = bulkSize +1;
}</stringValue>
<type>CONSTANT</type>
</item>
<item id="90" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="91">["NoOfThreads"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="92">variables["NoOfThreads"]</name>
<stringValue id="93">No. Of Parallel Branches</stringValue>
<type>VARIABLE</type>
</item>
<item id="94" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="95">["bulkSize"]@java/lang/Integer@</UITypeHint>
<input>false</input>
<name id="96">variables["bulkSize"]</name>
<stringValue id="97">pubBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="98" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="99">["items"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="100">variables["items"]</name>
<stringValue id="101">extractDefinitions</stringValue>
<type>VARIABLE</type>
<variablePart id="102">length</variablePart>
</item>
</parameters>
<sources id="103" type="java.util.HashSet">
<item id="104" type="com.j2fe.workflow.definition.Transition">
<name id="105">extraction</name>
<source id="106">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="107"/>
<directJoin>false</directJoin>
<name id="108">Asset Extraction Log</name>
<nodeHandler>com.thegoldensource.publishing.activity.WriteExtractionLog</nodeHandler>
<nodeHandlerClass id="109">com.thegoldensource.publishing.activity.WriteExtractionLog</nodeHandlerClass>
<parameters id="110" type="java.util.HashSet">
<item id="111" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="112">auditId</name>
<stringValue id="113">auditIdentifier</stringValue>
<type>VARIABLE</type>
</item>
<item id="114" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="115">entityMode</name>
<stringValue id="116">MODEL_ENTITY</stringValue>
<type>CONSTANT</type>
</item>
<item id="117" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="118">eql</name>
<stringValue id="119">PublishQuery</stringValue>
<type>VARIABLE</type>
</item>
<item id="120" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="121">extractDefinitions</name>
<stringValue id="122">extractDefinitions</stringValue>
<type>VARIABLE</type>
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
<stringValue id="128">PublishingBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="129" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="130">modelName</name>
<stringValue id="131">ISSUPUB</stringValue>
<type>CONSTANT</type>
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
<name id="137">goto-next</name>
<source id="138">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="139"/>
<directJoin>false</directJoin>
<name id="140">Asset Publish Query</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="141">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="142" type="java.util.HashSet">
<item id="143" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="144">statements</name>
<stringValue id="145">query="&lt;sql&gt;instr_id in ('" + InstrumentId +"')&lt;/sql&gt;";</stringValue>
<type>CONSTANT</type>
</item>
<item id="146" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="147">variables["InstrumentId"]</name>
<stringValue id="148">InstrumentId</stringValue>
<type>VARIABLE</type>
</item>
<item id="149" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="150">["query"]@java/lang/Integer@</UITypeHint>
<input>false</input>
<name id="151">variables["query"]</name>
<stringValue id="152">PublishQuery</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="153" type="java.util.HashSet">
<item id="154" type="com.j2fe.workflow.definition.Transition">
<name id="155">goto-next</name>
<source id="156">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="157"/>
<directJoin>false</directJoin>
<name id="158">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="159">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="160" type="java.util.HashSet"/>
<targets id="161" type="java.util.HashSet">
<item idref="154" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="138"/>
</item>
</sources>
<targets id="162" type="java.util.HashSet">
<item idref="136" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="106"/>
</item>
</sources>
<targets id="163" type="java.util.HashSet">
<item idref="104" type="com.j2fe.workflow.definition.Transition"/>
<item id="164" type="com.j2fe.workflow.definition.Transition">
<name id="165">no-extraction</name>
<source idref="106"/>
<target idref="9"/>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="82"/>
</item>
</sources>
<targets id="166" type="java.util.HashSet">
<item idref="80" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="58"/>
</item>
</sources>
<targets id="167" type="java.util.HashSet">
<item idref="56" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDSPLIT</type>
</source>
<target idref="23"/>
</item>
</sources>
<targets id="168" type="java.util.HashSet">
<item idref="21" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="16"/>
</item>
</sources>
<targets id="169" type="java.util.HashSet">
<item idref="14" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDJOIN</type>
</source>
<target idref="9"/>
</item>
<item idref="164" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="170" type="java.util.HashSet">
<item idref="7" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="2"/>
</item>
</sources>
<targets id="171" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="172">Mizuho/Publishing</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="173">user1</lastChangeUser>
<lastUpdate id="174">2025-11-20T00:26:24.000+0000</lastUpdate>
<name id="175">AssetById</name>
<nodes id="176" type="java.util.HashSet">
<item idref="106" type="com.j2fe.workflow.definition.Node"/>
<item idref="138" type="com.j2fe.workflow.definition.Node"/>
<item idref="82" type="com.j2fe.workflow.definition.Node"/>
<item idref="58" type="com.j2fe.workflow.definition.Node"/>
<item idref="23" type="com.j2fe.workflow.definition.Node"/>
<item idref="9" type="com.j2fe.workflow.definition.Node"/>
<item idref="156" type="com.j2fe.workflow.definition.Node"/>
<item idref="2" type="com.j2fe.workflow.definition.Node"/>
<item idref="16" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>true</optimize>
<parameter id="177" type="java.util.HashMap">
<entry>
<key id="178" type="java.lang.String">Handle Extraction Failures</key>
<value id="179" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="180">com.thegoldensource.subscription.ExceptionHandlingMode</className>
<clazz>com.thegoldensource.subscription.ExceptionHandlingMode</clazz>
<description id="181">This value is used for Exception Handling configuration.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="182" type="java.lang.String">InstrumentId</key>
<value id="183" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="184">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="185" type="java.lang.String">No. Of Parallel Branches</key>
<value id="186" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="187">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="188">Defines how many parallel branches to be run for publishing.</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="189" type="java.lang.String">OutputMsg</key>
<value id="190" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="191">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>false</input>
<output>true</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="192" type="java.lang.String">PublishingBulkSize</key>
<value id="193" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="194">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="195">Defines how many entities you want to extract in one bulk.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="196" type="java.lang.String">Threshold for Extraction Failures</key>
<value id="197" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="198">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="199">Value for this field should be specified in x/y format, both x and y is numeric. 
Here x is percentage of instruments allowed to fail during extraction and y is minimum sampling size.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="200" type="java.lang.String">jmsDestination</key>
<value id="201" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="202">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="203"/>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
</parameter>
<permissions id="204" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>false</purgeAtEnd>
<retries>0</retries>
<startNode idref="156"/>
<status>RELEASED</status>
<variables id="205" type="java.util.HashMap">
<entry>
<key id="206" type="java.lang.String">Handle Extraction Failures</key>
<value id="207" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="208">com.thegoldensource.subscription.ExceptionHandlingMode</className>
<clazz>com.thegoldensource.subscription.ExceptionHandlingMode</clazz>
<description id="209">This value is used for Exception Handling configuration.</description>
<persistent>false</persistent>
<value id="210" type="com.thegoldensource.subscription.ExceptionHandlingMode">DO_NOT_HANDLE</value>
</value>
</entry>
<entry>
<key id="211" type="java.lang.String">InstrumentId</key>
<value id="212" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="213">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="214" type="java.lang.String">No. Of Parallel Branches</key>
<value id="215" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="216">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="217">Defines how many parallel branches to be run for publishing.</description>
<persistent>false</persistent>
<value id="218" type="java.lang.Integer">5</value>
</value>
</entry>
<entry>
<key id="219" type="java.lang.String">OutputMsg</key>
<value id="220" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="221">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>true</persistent>
<value id="222" type="java.lang.String">&lt;?xml version='1.0' encoding='utf-8'?&gt;&lt;OutputMsg&gt;Publish done!&lt;/OutputMsg&gt;</value>
</value>
</entry>
<entry>
<key id="223" type="java.lang.String">PublishingBulkSize</key>
<value id="224" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="225">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="226">Defines how many entities you want to extract in one bulk.</description>
<persistent>false</persistent>
<value id="227" type="java.lang.Integer">100</value>
</value>
</entry>
<entry>
<key id="228" type="java.lang.String">Threshold for Extraction Failures</key>
<value id="229" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="230">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="231">Value for this field should be specified in x/y format, both x and y is numeric. 
Here x is percentage of instruments allowed to fail during extraction and y is minimum sampling size.</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="232" type="java.lang.String">jmsDestination</key>
<value id="233" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="234">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="235"/>
<persistent>false</persistent>
<value id="236" type="java.lang.String">jms/queue/security</value>
</value>
</entry>
</variables>
<version>9</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
