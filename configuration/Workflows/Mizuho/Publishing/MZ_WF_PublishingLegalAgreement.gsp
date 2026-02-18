<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.07">
<package-comment/>
<businessobject displayString="9 - JMSQConfig" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>false</alwaysPersist>
<clustered>true</clustered>
<comment id="1">JMSQConfig</comment>
<description id="2">UI Publish single Legal Agreement</description>
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
<name id="12">For Loop </name>
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
<variablePart id="21"/>
</item>
<item id="22" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="23">incrementValue</name>
<stringValue id="24">1</stringValue>
<type>CONSTANT</type>
</item>
<item id="25" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="26">input</name>
<stringValue id="27">ExtractDefinitions</stringValue>
<type>VARIABLE</type>
</item>
<item id="28" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="29">output</name>
<stringValue id="30">SingleExtDef</stringValue>
<type>VARIABLE</type>
<variablePart id="31"/>
</item>
<item id="32" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="33">resetOnEnd</name>
<stringValue id="34">true</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="35" type="java.util.HashSet">
<item id="36" type="com.j2fe.workflow.definition.Transition">
<name id="37">extraction</name>
<source id="38">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="39"/>
<directJoin>false</directJoin>
<name id="40">Write ExtractionLog</name>
<nodeHandler>com.thegoldensource.publishing.activity.WriteExtractionLog</nodeHandler>
<nodeHandlerClass id="41">com.thegoldensource.publishing.activity.WriteExtractionLog</nodeHandlerClass>
<parameters id="42" type="java.util.HashSet">
<item id="43" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="44">auditId</name>
<stringValue id="45">AuditIdentifier</stringValue>
<type>VARIABLE</type>
</item>
<item id="46" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="47">entityMode</name>
<stringValue id="48">MODEL_ENTITY</stringValue>
<type>CONSTANT</type>
</item>
<item id="49" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="50">eql</name>
<stringValue id="51">PublishingQuery</stringValue>
<type>VARIABLE</type>
</item>
<item id="52" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="53">extractDefinitions</name>
<stringValue id="54">ExtractDefinitions</stringValue>
<type>VARIABLE</type>
</item>
<item id="55" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="56">extractorFactory</name>
<stringValue id="57">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="58" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="59">maxExtractCount</name>
<stringValue id="60">100</stringValue>
<type>CONSTANT</type>
</item>
<item id="61" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="62">maxExtractCount</name>
<stringValue id="63">BulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="64" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="65">modelName</name>
<stringValue id="66">ModelID</stringValue>
<type>VARIABLE</type>
</item>
<item id="67" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="68">newStartIndex</name>
<stringValue id="69">NewExtractionLogStartIndex</stringValue>
<type>VARIABLE</type>
</item>
<item id="70" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="71">queryParameter</name>
<stringValue id="72">QueryParameter</stringValue>
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
<name id="78">Extraction Query</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="79">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="80" type="java.util.HashSet">
<item id="81" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="82">statements</name>
<stringValue id="83">String query = "&lt;sql&gt; lagr_oid in (select lagr_oid from ft_t_lagr where cross_ref_id = '" + id +"')&lt;/sql&gt;"</stringValue>
<type>CONSTANT</type>
</item>
<item id="84" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="85">["id"]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="86">variables["id"]</name>
<stringValue id="87">LegalAgrCrossRefId</stringValue>
<type>VARIABLE</type>
</item>
<item id="88" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="89">@java/util/Map@["query"]@java/lang/Object@</UITypeHint>
<input>false</input>
<name id="90">variables["query"]</name>
<stringValue id="91">PublishingQuery</stringValue>
<type>VARIABLE</type>
<variablePart id="92">["query"]</variablePart>
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
<target idref="38"/>
</item>
</sources>
<targets id="103" type="java.util.HashSet">
<item idref="36" type="com.j2fe.workflow.definition.Transition"/>
<item id="104" type="com.j2fe.workflow.definition.Transition">
<name id="105">no-extraction</name>
<source idref="38"/>
<target idref="3"/>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="10"/>
</item>
</sources>
<targets id="106" type="java.util.HashSet">
<item idref="8" type="com.j2fe.workflow.definition.Transition"/>
<item id="107" type="com.j2fe.workflow.definition.Transition">
<name id="108">loop</name>
<source idref="10"/>
<target id="109">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="110"/>
<directJoin>false</directJoin>
<name id="111">Extract Entity</name>
<nodeHandler>com.thegoldensource.publishing.activity.ExtractBusinessEntity</nodeHandler>
<nodeHandlerClass id="112">com.thegoldensource.publishing.activity.ExtractBusinessEntity</nodeHandlerClass>
<parameters id="113" type="java.util.HashSet">
<item id="114" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="115">additionalData</name>
<stringValue id="116">AdditionalData</stringValue>
<type>VARIABLE</type>
</item>
<item id="117" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="118">extractionDefinition</name>
<stringValue id="119">SingleExtDef</stringValue>
<type>VARIABLE</type>
</item>
<item id="120" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="121">extractionResult</name>
<stringValue id="122">ExtractedEntities</stringValue>
<type>VARIABLE</type>
</item>
<item id="123" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="124">extractorFactory</name>
<stringValue id="125">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="126" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="127">queryParameter</name>
<stringValue id="128">QueryParameter</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="129" type="java.util.HashSet">
<item idref="107" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="130" type="java.util.HashSet">
<item id="131" type="com.j2fe.workflow.definition.Transition">
<name id="132">found Entities</name>
<source idref="109"/>
<target id="133">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="134"/>
<directJoin>true</directJoin>
<name id="135">For Each Split</name>
<nodeHandler>com.j2fe.workflow.handler.impl.GenericSplit</nodeHandler>
<nodeHandlerClass id="136">com.j2fe.workflow.handler.impl.GenericSplit</nodeHandlerClass>
<parameters id="137" type="java.util.HashSet">
<item id="138" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="139">input</name>
<stringValue id="140">ExtractedEntities</stringValue>
<type>VARIABLE</type>
</item>
<item id="141" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="142">output</name>
<stringValue id="143">Entity</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="144" type="java.util.HashSet">
<item idref="131" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="145" type="java.util.HashSet">
<item id="146" type="com.j2fe.workflow.definition.Transition">
<name id="147">goto-next</name>
<source idref="133"/>
<target id="148">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="149"/>
<directJoin>false</directJoin>
<name id="150">Convert Entity </name>
<nodeHandler>com.thegoldensource.publishing.activity.ConvertBusinessEntity</nodeHandler>
<nodeHandlerClass id="151">com.thegoldensource.publishing.activity.ConvertBusinessEntity</nodeHandlerClass>
<parameters id="152" type="java.util.HashSet">
<item id="153" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="154">addXMLHeader</name>
<stringValue id="155">true</stringValue>
<type>CONSTANT</type>
</item>
<item id="156" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="157">businessEntity</name>
<stringValue id="158">Entity</stringValue>
<type>VARIABLE</type>
</item>
<item id="159" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="160">entitySequenceNumbers</name>
<stringValue id="161">EntitySequenceNum</stringValue>
<type>VARIABLE</type>
<variablePart id="162"/>
</item>
<item id="163" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="164">output</name>
<stringValue id="165">ExtractionResult</stringValue>
<type>VARIABLE</type>
</item>
<item id="166" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="167">outputType</name>
<stringValue id="168">XML</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="169" type="java.util.HashSet">
<item idref="146" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="170" type="java.util.HashSet">
<item id="171" type="com.j2fe.workflow.definition.Transition">
<name id="172">goto-next</name>
<source idref="148"/>
<target id="173">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="174"/>
<directJoin>false</directJoin>
<name id="175">JMS Publisher</name>
<nodeHandler>com.j2fe.general.activities.JMS</nodeHandler>
<nodeHandlerClass id="176">com.j2fe.general.activities.JMS</nodeHandlerClass>
<parameters id="177" type="java.util.HashSet">
<item id="178" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="179">connectionFactory</name>
<stringValue id="180">JMSConnFactory</stringValue>
<type>VARIABLE</type>
</item>
<item id="181" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="182">destination</name>
<stringValue id="183">JMSQueueName</stringValue>
<type>VARIABLE</type>
</item>
<item id="184" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="185">persistent</name>
<stringValue id="186">true</stringValue>
<type>CONSTANT</type>
</item>
<item id="187" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="188">textInput</name>
<stringValue id="189">ExtractionResult</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="190" type="java.util.HashSet">
<item idref="171" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="191" type="java.util.HashSet">
<item id="192" type="com.j2fe.workflow.definition.Transition">
<name id="193">goto-next</name>
<source idref="173"/>
<target id="194">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="195"/>
<directJoin>false</directJoin>
<name id="196">Add To Audit Trail</name>
<nodeHandler>com.thegoldensource.publishing.activity.AddAuditTrail</nodeHandler>
<nodeHandlerClass id="197">com.thegoldensource.publishing.activity.AddAuditTrail</nodeHandlerClass>
<parameters id="198" type="java.util.HashSet">
<item id="199" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="200">GSDM</name>
<stringValue id="201">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="202" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="203">auditId</name>
<stringValue id="204">AuditIdentifier</stringValue>
<type>VARIABLE</type>
</item>
<item id="205" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="206">dataSource</name>
<stringValue id="207">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="208" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="209">downstreamSystemName</name>
<stringValue id="210">Default</stringValue>
<type>CONSTANT</type>
</item>
<item id="211" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="212">entities</name>
<stringValue id="213">ExtractedEntities</stringValue>
<type>VARIABLE</type>
</item>
<item id="214" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="215">entitySequenceNumbers</name>
<stringValue id="216">EntitySequenceNum</stringValue>
<type>VARIABLE</type>
</item>
<item id="217" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="218">status</name>
<stringValue id="219">SUCCESSFUL</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="220" type="java.util.HashSet">
<item idref="192" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="221" type="java.util.HashSet">
<item id="222" type="com.j2fe.workflow.definition.Transition">
<name id="223">goto-next</name>
<source idref="194"/>
<target id="224">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="225"/>
<directJoin>true</directJoin>
<name id="226">Synchronize</name>
<nodeHandler>com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandler>
<nodeHandlerClass id="227">com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandlerClass>
<sources id="228" type="java.util.HashSet">
<item idref="222" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="229" type="java.util.HashSet">
<item id="230" type="com.j2fe.workflow.definition.Transition">
<name id="231">goto-next</name>
<source idref="224"/>
<target idref="3"/>
</item>
</targets>
<type>ANDJOIN</type>
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
<type>ANDSPLIT</type>
</target>
</item>
<item id="232" type="com.j2fe.workflow.definition.Transition">
<name id="233">no Entities</name>
<source idref="109"/>
<target idref="3"/>
</item>
</targets>
<type>XORSPLIT</type>
</target>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="3"/>
</item>
<item idref="230" type="com.j2fe.workflow.definition.Transition"/>
<item idref="232" type="com.j2fe.workflow.definition.Transition"/>
<item idref="104" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="234" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="235">Mizuho/Publishing</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="236">user1</lastChangeUser>
<lastUpdate id="237">2025-08-20T09:47:40.000+0100</lastUpdate>
<name id="238">MZ_WF_PublishingLegalAgreement</name>
<nodes id="239" type="java.util.HashSet">
<item idref="194" type="com.j2fe.workflow.definition.Node"/>
<item idref="148" type="com.j2fe.workflow.definition.Node"/>
<item idref="109" type="com.j2fe.workflow.definition.Node"/>
<item idref="76" type="com.j2fe.workflow.definition.Node"/>
<item idref="133" type="com.j2fe.workflow.definition.Node"/>
<item idref="10" type="com.j2fe.workflow.definition.Node"/>
<item idref="173" type="com.j2fe.workflow.definition.Node"/>
<item idref="96" type="com.j2fe.workflow.definition.Node"/>
<item idref="3" type="com.j2fe.workflow.definition.Node"/>
<item idref="224" type="com.j2fe.workflow.definition.Node"/>
<item idref="38" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>true</optimize>
<parameter id="240" type="java.util.HashMap">
<entry>
<key id="241" type="java.lang.String">DestinationFtp</key>
<value id="242" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="243">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="244" type="java.lang.String">ExtractionResult</key>
<value id="245" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="246">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>false</input>
<output>true</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="247" type="java.lang.String">JMSConnFactory</key>
<value id="248" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="249">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="250"/>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="251" type="java.lang.String">JMSQueueName</key>
<value id="252" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="253">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="254"/>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="255" type="java.lang.String">LegalAgrCrossRefId</key>
<value id="256" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="257">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="258" type="java.lang.String">ModelID</key>
<value id="259" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="260">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
</parameter>
<permissions id="261" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>false</purgeAtEnd>
<retries>0</retries>
<startNode idref="96"/>
<status>RELEASED</status>
<variables id="262" type="java.util.HashMap">
<entry>
<key id="263" type="java.lang.String">DestinationFtp</key>
<value id="264" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="265">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="266" type="java.lang.String">${gs.bin.path}/../MZPUB</value>
</value>
</entry>
<entry>
<key id="267" type="java.lang.String">ExtractionResult</key>
<value id="268" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="269">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>true</persistent>
</value>
</entry>
<entry>
<key id="270" type="java.lang.String">JMSConnFactory</key>
<value id="271" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="272">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="273"/>
<persistent>false</persistent>
<value id="274" type="java.lang.String">jms/QueueConnection</value>
</value>
</entry>
<entry>
<key id="275" type="java.lang.String">JMSQueueName</key>
<value id="276" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="277">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="278"/>
<persistent>false</persistent>
<value id="279" type="java.lang.String">jms/queue/legalAgreement</value>
</value>
</entry>
<entry>
<key id="280" type="java.lang.String">LegalAgrCrossRefId</key>
<value id="281" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="282">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="283" type="java.lang.String">LoopCounter</key>
<value id="284" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="285">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="286"/>
<persistent>false</persistent>
<value id="287" type="java.lang.Integer">0</value>
</value>
</entry>
<entry>
<key id="288" type="java.lang.String">ModelID</key>
<value id="289" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="290">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="291" type="java.lang.String">LAGR_PUB</value>
</value>
</entry>
</variables>
<version>9</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
