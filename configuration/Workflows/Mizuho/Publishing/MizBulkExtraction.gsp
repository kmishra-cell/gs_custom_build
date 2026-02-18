<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.07">
<package-comment/>
<businessobject displayString="7 - OptimizedV2" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>false</alwaysPersist>
<clustered>false</clustered>
<comment id="1">OptimizedV2</comment>
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
<name id="12">For Loop</name>
<nodeHandler>com.j2fe.workflow.handler.impl.ForEach</nodeHandler>
<nodeHandlerClass id="13">com.j2fe.workflow.handler.impl.ForEach</nodeHandlerClass>
<parameters id="14" type="java.util.HashSet">
<item id="15" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="16">counter</name>
<stringValue id="17">LoopCounter</stringValue>
<type>VARIABLE</type>
</item>
<item id="18" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="19">counter</name>
<stringValue id="20">LoopCounter</stringValue>
<type>VARIABLE</type>
</item>
<item id="21" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="22">incrementValue</name>
<stringValue id="23">1</stringValue>
<type>CONSTANT</type>
</item>
<item id="24" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="25">input</name>
<stringValue id="26">ExtDefs</stringValue>
<type>VARIABLE</type>
</item>
<item id="27" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="28">output</name>
<stringValue id="29">SingleExtDef</stringValue>
<type>VARIABLE</type>
</item>
<item id="30" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="31">resetOnEnd</name>
<stringValue id="32">true</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="33" type="java.util.HashSet">
<item id="34" type="com.j2fe.workflow.definition.Transition">
<name id="35">goto-next</name>
<source id="36">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="37"/>
<directJoin>false</directJoin>
<name id="38">NOP</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="39">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="40" type="java.util.HashSet">
<item id="41" type="com.j2fe.workflow.definition.Transition">
<name id="42">goto-next</name>
<source id="43">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="44"/>
<directJoin>false</directJoin>
<name id="45">NOP  #3</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="46">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="47" type="java.util.HashSet">
<item id="48" type="com.j2fe.workflow.definition.Transition">
<name id="49">goto-next</name>
<source id="50">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="51"/>
<directJoin>false</directJoin>
<name id="52">Raise Extraction Exception</name>
<nodeHandler>com.thegoldensource.publishing.activity.RaiseExtractionException</nodeHandler>
<nodeHandlerClass id="53">com.thegoldensource.publishing.activity.RaiseExtractionException</nodeHandlerClass>
<parameters id="54" type="java.util.HashSet">
<item id="55" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="56">auditId</name>
<stringValue id="57">AuditId</stringValue>
<type>VARIABLE</type>
</item>
<item id="58" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="59">extractionFailureThreshold</name>
<stringValue id="60">Threshold for Extraction Failures</stringValue>
<type>VARIABLE</type>
</item>
<item id="61" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="62">gsdm</name>
<stringValue id="63">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="64" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="65">logExceptionAndProceed</name>
<stringValue id="66">Handle Extraction Failures</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="67" type="java.util.HashSet">
<item id="68" type="com.j2fe.workflow.definition.Transition">
<name id="69">goto-next</name>
<source id="70">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="71"/>
<directJoin>false</directJoin>
<name id="72">Add To Audit Trail</name>
<nodeHandler>com.thegoldensource.publishing.activity.AddAuditTrail</nodeHandler>
<nodeHandlerClass id="73">com.thegoldensource.publishing.activity.AddAuditTrail</nodeHandlerClass>
<parameters id="74" type="java.util.HashSet">
<item id="75" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="76">GSDM</name>
<stringValue id="77">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="78" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="79">auditId</name>
<stringValue id="80">AuditId</stringValue>
<type>VARIABLE</type>
</item>
<item id="81" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="82">dataSource</name>
<stringValue id="83">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="84" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="85">downstreamSystemName</name>
<stringValue id="86">Default</stringValue>
<type>CONSTANT</type>
</item>
<item id="87" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="88">entityInstrumentIds</name>
<stringValue id="89">failedEntities</stringValue>
<type>VARIABLE</type>
</item>
<item id="90" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="91">status</name>
<stringValue id="92">FAILED</stringValue>
<type>CONSTANT</type>
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
<name id="98">Add To Audit Trail #1</name>
<nodeHandler>com.thegoldensource.publishing.activity.AddAuditTrail</nodeHandler>
<nodeHandlerClass id="99">com.thegoldensource.publishing.activity.AddAuditTrail</nodeHandlerClass>
<parameters id="100" type="java.util.HashSet">
<item id="101" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="102">GSDM</name>
<stringValue id="103">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="104" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="105">auditId</name>
<stringValue id="106">AuditId</stringValue>
<type>VARIABLE</type>
</item>
<item id="107" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="108">dataSource</name>
<stringValue id="109">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="110" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="111">downstreamSystemName</name>
<stringValue id="112">Default</stringValue>
<type>CONSTANT</type>
</item>
<item id="113" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="114">entities</name>
<stringValue id="115">Entities</stringValue>
<type>VARIABLE</type>
</item>
<item id="116" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="117">entitySequenceNumbers</name>
<stringValue id="118">EntitySequenceNumbers</stringValue>
<type>VARIABLE</type>
</item>
<item id="119" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="120">status</name>
<stringValue id="121">SUCCESSFUL</stringValue>
<type>CONSTANT</type>
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
<name id="127">Bulk JMS Publisher #1</name>
<nodeHandler>com.j2fe.general.activities.BulkJMS</nodeHandler>
<nodeHandlerClass id="128">com.j2fe.general.activities.BulkJMS</nodeHandlerClass>
<parameters id="129" type="java.util.HashSet">
<item id="130" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="131">connectionFactory</name>
<stringValue id="132">JMSConFactory</stringValue>
<type>VARIABLE</type>
</item>
<item id="133" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="134">destination</name>
<stringValue id="135">JMSDestination</stringValue>
<type>VARIABLE</type>
</item>
<item id="136" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="137">persistent</name>
<stringValue id="138">true</stringValue>
<type>CONSTANT</type>
</item>
<item id="139" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="140">textArrayInput</name>
<stringValue id="141">textToPublish</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="142" type="java.util.HashSet">
<item id="143" type="com.j2fe.workflow.definition.Transition">
<name id="144">goto-next</name>
<source id="145">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="146"/>
<directJoin>false</directJoin>
<name id="147">Convert Entity #1</name>
<nodeHandler>com.thegoldensource.publishing.activity.ConvertBusinessEntity</nodeHandler>
<nodeHandlerClass id="148">com.thegoldensource.publishing.activity.ConvertBusinessEntity</nodeHandlerClass>
<parameters id="149" type="java.util.HashSet">
<item id="150" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="151">addXMLHeader</name>
<stringValue id="152">true</stringValue>
<type>CONSTANT</type>
</item>
<item id="153" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="154">businessEntity</name>
<stringValue id="155">Entities</stringValue>
<type>VARIABLE</type>
</item>
<item id="156" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="157">entitySequenceNumbers</name>
<stringValue id="158">EntitySequenceNumbers</stringValue>
<type>VARIABLE</type>
</item>
<item id="159" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="160">outputPerEntity</name>
<stringValue id="161">textToPublish</stringValue>
<type>VARIABLE</type>
</item>
<item id="162" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="163">outputType</name>
<stringValue id="164">XML</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<persistentVariables id="165" type="java.util.HashSet">
<item id="166" type="java.lang.String">Entity
1000</item>
</persistentVariables>
<sources id="167" type="java.util.HashSet">
<item id="168" type="com.j2fe.workflow.definition.Transition">
<name id="169">found Entities</name>
<source id="170">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="171"/>
<directJoin>false</directJoin>
<name id="172">Extract Entity</name>
<nodeHandler>com.thegoldensource.publishing.activity.ExtractBusinessEntity</nodeHandler>
<nodeHandlerClass id="173">com.thegoldensource.publishing.activity.ExtractBusinessEntity</nodeHandlerClass>
<parameters id="174" type="java.util.HashSet">
<item id="175" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="176">bulkSize</name>
<stringValue id="177">PublishingBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="178" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="179">extractionDefinition</name>
<stringValue id="180">SingleExtDef</stringValue>
<type>VARIABLE</type>
</item>
<item id="181" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="182">extractionResult</name>
<stringValue id="183">Entities</stringValue>
<type>VARIABLE</type>
</item>
<item id="184" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="185">extractorFactory</name>
<stringValue id="186">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="187" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="188">failedEntities</name>
<stringValue id="189">failedEntities</stringValue>
<type>VARIABLE</type>
</item>
<item id="190" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="191">logExceptionAndProceed</name>
<stringValue id="192">Handle Extraction Failures</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="193" type="java.util.HashSet">
<item id="194" type="com.j2fe.workflow.definition.Transition">
<name id="195">loop</name>
<source idref="10"/>
<target idref="170"/>
</item>
</sources>
<targets id="196" type="java.util.HashSet">
<item idref="168" type="com.j2fe.workflow.definition.Transition"/>
<item id="197" type="com.j2fe.workflow.definition.Transition">
<name id="198">no Entities</name>
<source idref="170"/>
<target idref="36"/>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="145"/>
</item>
</sources>
<targets id="199" type="java.util.HashSet">
<item idref="143" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="125"/>
</item>
</sources>
<targets id="200" type="java.util.HashSet">
<item idref="123" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="96"/>
</item>
</sources>
<targets id="201" type="java.util.HashSet">
<item idref="94" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="70"/>
</item>
</sources>
<targets id="202" type="java.util.HashSet">
<item idref="68" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="50"/>
</item>
</sources>
<targets id="203" type="java.util.HashSet">
<item idref="48" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="43"/>
</item>
</sources>
<targets id="204" type="java.util.HashSet">
<item idref="41" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="36"/>
</item>
<item id="205" type="com.j2fe.workflow.definition.Transition">
<name id="206">goto-next</name>
<source id="207">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="208"/>
<directJoin>false</directJoin>
<name id="209">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="210">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="211" type="java.util.HashSet"/>
<targets id="212" type="java.util.HashSet">
<item idref="205" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="36"/>
</item>
<item idref="197" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="213" type="java.util.HashSet">
<item idref="34" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="10"/>
</item>
</sources>
<targets id="214" type="java.util.HashSet">
<item idref="8" type="com.j2fe.workflow.definition.Transition"/>
<item idref="194" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="3"/>
</item>
</sources>
<targets id="215" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="216">Mizuho/Publishing</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="217">user1</lastChangeUser>
<lastUpdate id="218">2025-12-16T14:38:54.000+0000</lastUpdate>
<name id="219">MizBulkExtraction</name>
<nodes id="220" type="java.util.HashSet">
<item idref="70" type="com.j2fe.workflow.definition.Node"/>
<item idref="96" type="com.j2fe.workflow.definition.Node"/>
<item idref="125" type="com.j2fe.workflow.definition.Node"/>
<item idref="145" type="com.j2fe.workflow.definition.Node"/>
<item idref="170" type="com.j2fe.workflow.definition.Node"/>
<item idref="10" type="com.j2fe.workflow.definition.Node"/>
<item idref="36" type="com.j2fe.workflow.definition.Node"/>
<item idref="43" type="com.j2fe.workflow.definition.Node"/>
<item idref="50" type="com.j2fe.workflow.definition.Node"/>
<item idref="207" type="com.j2fe.workflow.definition.Node"/>
<item idref="3" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>true</optimize>
<parameter id="221" type="java.util.HashMap">
<entry>
<key id="222" type="java.lang.String">AuditId</key>
<value id="223" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="224">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="225"/>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="226" type="java.lang.String">ExtDefs</key>
<value id="227" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="228">[Ljava.lang.Object;</className>
<clazz>[Ljava.lang.Object;</clazz>
<description id="229"/>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="230" type="java.lang.String">Handle Extraction Failures</key>
<value id="231" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="232">com.thegoldensource.subscription.ExceptionHandlingMode</className>
<clazz>com.thegoldensource.subscription.ExceptionHandlingMode</clazz>
<description id="233">This value is used for Exception Handling configuration.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="234" type="java.lang.String">JMSConFactory</key>
<value id="235" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="236">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="237"/>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="238" type="java.lang.String">JMSConnectionFactory</key>
<value id="239" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="240">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="241"/>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="242" type="java.lang.String">JMSDestination</key>
<value id="243" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="244">java.lang.Object</className>
<clazz>java.lang.Object</clazz>
<description id="245"/>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="246" type="java.lang.String">PublishingBulkSize</key>
<value id="247" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="248">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="249">Defines how many entities you want to extract in one bulk.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="250" type="java.lang.String">Threshold for Extraction Failures</key>
<value id="251" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="252">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="253">Value for this field should be specified in x/y format, both x and y is numeric. 
Here x is percentage of instruments allowed to fail during extraction and y is minimum sampling size.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
</parameter>
<permissions id="254" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>false</purgeAtEnd>
<retries>0</retries>
<startNode idref="207"/>
<status>RELEASED</status>
<variables id="255" type="java.util.HashMap">
<entry>
<key id="256" type="java.lang.String">AuditId</key>
<value id="257" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="258">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="259"/>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="260" type="java.lang.String">ExtDefs</key>
<value id="261" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="262">[Ljava.lang.Object;</className>
<clazz>[Ljava.lang.Object;</clazz>
<description id="263"/>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="264" type="java.lang.String">Handle Extraction Failures</key>
<value id="265" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="266">com.thegoldensource.subscription.ExceptionHandlingMode</className>
<clazz>com.thegoldensource.subscription.ExceptionHandlingMode</clazz>
<description id="267">This value is used for Exception Handling configuration.</description>
<persistent>false</persistent>
<value id="268" type="com.thegoldensource.subscription.ExceptionHandlingMode">DO_NOT_HANDLE</value>
</value>
</entry>
<entry>
<key id="269" type="java.lang.String">JMSConFactory</key>
<value id="270" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="271">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="272"/>
<persistent>false</persistent>
<value id="273" type="java.lang.String">jms/QueueConnection</value>
</value>
</entry>
<entry>
<key id="274" type="java.lang.String">JMSConnectionFactory</key>
<value id="275" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="276">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="277"/>
<persistent>false</persistent>
<value id="278" type="java.lang.String">TESTJMS</value>
</value>
</entry>
<entry>
<key id="279" type="java.lang.String">JMSDestination</key>
<value id="280" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="281">java.lang.Object</className>
<clazz>java.lang.Object</clazz>
<description id="282"/>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="283" type="java.lang.String">LoopCounter</key>
<value id="284" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="285">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<persistent>false</persistent>
<value id="286" type="java.lang.Integer">0</value>
</value>
</entry>
<entry>
<key id="287" type="java.lang.String">PublishingBulkSize</key>
<value id="288" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="289">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="290">Defines how many entities you want to extract in one bulk.</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="291" type="java.lang.String">Threshold for Extraction Failures</key>
<value id="292" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="293">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="294">Value for this field should be specified in x/y format, both x and y is numeric. 
Here x is percentage of instruments allowed to fail during extraction and y is minimum sampling size.</description>
<persistent>false</persistent>
</value>
</entry>
</variables>
<version>7</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
