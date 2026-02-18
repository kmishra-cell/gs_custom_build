<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.09">
<package-comment/>
<businessobject displayString="19 - JMSQConfig Persist" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>true</alwaysPersist>
<clustered>false</clustered>
<comment id="1">JMSQConfig Persist</comment>
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
<stringValue id="51">Publishquery</stringValue>
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
<input>false</input>
<name id="59">maxExtractCount</name>
<stringValue id="60">BulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="61" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="62">modelName</name>
<stringValue id="63">ModelID</stringValue>
<type>VARIABLE</type>
</item>
<item id="64" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="65">newStartIndex</name>
<stringValue id="66">NewExtractionLogStartIndex</stringValue>
<type>VARIABLE</type>
</item>
<item id="67" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="68">queryParameter</name>
<stringValue id="69">QueryParameter</stringValue>
<type>VARIABLE</type>
</item>
<item id="70" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="71">["id"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="72">queryParameter["id"]</name>
<stringValue id="73">EntityId</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="74" type="java.util.HashSet">
<item id="75" type="com.j2fe.workflow.definition.Transition">
<name id="76">goto-next</name>
<source id="77">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="78"/>
<directJoin>false</directJoin>
<name id="79">Publishing query</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="80">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="81" type="java.util.HashSet">
<item id="82" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="83">statements</name>
<stringValue id="84">String query="";

if("ISSUPUB".equals(modelid))
 query = "&lt;sql&gt;instr_id in (select instr_id from ft_t_issu where instr_id = '" + entityid +"')&lt;/sql&gt;";

if("ISSRPUB".equals(modelid))
 query = "&lt;sql&gt;instr_issr_id in (select instr_issr_id from ft_t_issr where instr_issr_id = '" + entityid +"')&lt;/sql&gt;";





    

    </stringValue>
<type>CONSTANT</type>
</item>
<item id="85" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="86">["entityid"]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="87">variables["entityid"]</name>
<stringValue id="88">EntityId</stringValue>
<type>VARIABLE</type>
</item>
<item id="89" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="90">["modelid"]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="91">variables["modelid"]</name>
<stringValue id="92">ModelID</stringValue>
<type>VARIABLE</type>
</item>
<item id="93" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="94">@java/util/Map@["query"]@java/lang/Object@</UITypeHint>
<input>false</input>
<name id="95">variables["query"]</name>
<stringValue id="96">Publishquery</stringValue>
<type>VARIABLE</type>
<variablePart id="97">["query"]</variablePart>
</item>
</parameters>
<sources id="98" type="java.util.HashSet">
<item id="99" type="com.j2fe.workflow.definition.Transition">
<name id="100">goto-next</name>
<source id="101">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="102"/>
<directJoin>false</directJoin>
<name id="103">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="104">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="105" type="java.util.HashSet"/>
<targets id="106" type="java.util.HashSet">
<item idref="99" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="77"/>
</item>
</sources>
<targets id="107" type="java.util.HashSet">
<item idref="75" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="38"/>
</item>
</sources>
<targets id="108" type="java.util.HashSet">
<item idref="36" type="com.j2fe.workflow.definition.Transition"/>
<item id="109" type="com.j2fe.workflow.definition.Transition">
<name id="110">no-extraction</name>
<source idref="38"/>
<target idref="3"/>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="10"/>
</item>
</sources>
<targets id="111" type="java.util.HashSet">
<item idref="8" type="com.j2fe.workflow.definition.Transition"/>
<item id="112" type="com.j2fe.workflow.definition.Transition">
<name id="113">loop</name>
<source idref="10"/>
<target id="114">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="115"/>
<directJoin>false</directJoin>
<name id="116">Extract Entity</name>
<nodeHandler>com.thegoldensource.publishing.activity.ExtractBusinessEntity</nodeHandler>
<nodeHandlerClass id="117">com.thegoldensource.publishing.activity.ExtractBusinessEntity</nodeHandlerClass>
<parameters id="118" type="java.util.HashSet">
<item id="119" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="120">additionalData</name>
<stringValue id="121">AdditionalData</stringValue>
<type>VARIABLE</type>
</item>
<item id="122" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="123">extractionDefinition</name>
<stringValue id="124">SingleExtDef</stringValue>
<type>VARIABLE</type>
</item>
<item id="125" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="126">extractionResult</name>
<stringValue id="127">ExtractionEntity</stringValue>
<type>VARIABLE</type>
</item>
<item id="128" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="129">extractorFactory</name>
<stringValue id="130">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="131" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="132">queryParameter</name>
<stringValue id="133">QueryParameter</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="134" type="java.util.HashSet">
<item idref="112" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="135" type="java.util.HashSet">
<item id="136" type="com.j2fe.workflow.definition.Transition">
<name id="137">found Entities</name>
<source idref="114"/>
<target id="138">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="139"/>
<directJoin>false</directJoin>
<name id="140">Convert Entity</name>
<nodeHandler>com.thegoldensource.publishing.activity.ConvertBusinessEntity</nodeHandler>
<nodeHandlerClass id="141">com.thegoldensource.publishing.activity.ConvertBusinessEntity</nodeHandlerClass>
<parameters id="142" type="java.util.HashSet">
<item id="143" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="144">addXMLHeader</name>
<stringValue id="145">true</stringValue>
<type>CONSTANT</type>
</item>
<item id="146" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="147">businessEntity</name>
<stringValue id="148">ExtractionEntity</stringValue>
<type>VARIABLE</type>
</item>
<item id="149" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="150">entitySequenceNumbers</name>
<stringValue id="151">EntitySequenceNumbers</stringValue>
<type>VARIABLE</type>
</item>
<item id="152" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="153">output</name>
<stringValue id="154">ExtractionResult</stringValue>
<type>VARIABLE</type>
</item>
<item id="155" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="156">outputType</name>
<stringValue id="157">XML</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="158" type="java.util.HashSet">
<item idref="136" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="159" type="java.util.HashSet">
<item id="160" type="com.j2fe.workflow.definition.Transition">
<name id="161">goto-next</name>
<source idref="138"/>
<target id="162">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="163"/>
<directJoin>false</directJoin>
<name id="164">Switch Case</name>
<nodeHandler>com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandler>
<nodeHandlerClass id="165">com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandlerClass>
<parameters id="166" type="java.util.HashSet">
<item id="167" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="168">caseItem</name>
<stringValue id="169">ModelID</stringValue>
<type>VARIABLE</type>
</item>
<item id="170" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="171">defaultItem</name>
<stringValue id="172">FILE</stringValue>
<type>CONSTANT</type>
</item>
<item id="173" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="174">nullTransition</name>
<stringValue id="175">FILE</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="176" type="java.util.HashSet">
<item idref="160" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="177" type="java.util.HashSet">
<item id="178" type="com.j2fe.workflow.definition.Transition">
<name id="179">ISSRPUB</name>
<source idref="162"/>
<target id="180">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="181"/>
<directJoin>false</directJoin>
<name id="182">JMS Publisher</name>
<nodeHandler>com.j2fe.general.activities.JMS</nodeHandler>
<nodeHandlerClass id="183">com.j2fe.general.activities.JMS</nodeHandlerClass>
<parameters id="184" type="java.util.HashSet">
<item id="185" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="186">connectionFactory</name>
<stringValue id="187">JMSConFactory</stringValue>
<type>VARIABLE</type>
</item>
<item id="188" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="189">destination</name>
<stringValue id="190">IssuerQueue</stringValue>
<type>VARIABLE</type>
</item>
<item id="191" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="192">persistent</name>
<stringValue id="193">true</stringValue>
<type>CONSTANT</type>
</item>
<item id="194" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="195">textInput</name>
<stringValue id="196">ExtractionResult</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="197" type="java.util.HashSet">
<item idref="178" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="198" type="java.util.HashSet">
<item id="199" type="com.j2fe.workflow.definition.Transition">
<name id="200">goto-next</name>
<source idref="180"/>
<target id="201">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="202"/>
<directJoin>false</directJoin>
<name id="203">Add To Audit Trail</name>
<nodeHandler>com.thegoldensource.publishing.activity.AddAuditTrail</nodeHandler>
<nodeHandlerClass id="204">com.thegoldensource.publishing.activity.AddAuditTrail</nodeHandlerClass>
<parameters id="205" type="java.util.HashSet">
<item id="206" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="207">GSDM</name>
<stringValue id="208">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="209" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="210">auditId</name>
<stringValue id="211">AuditIdentifier</stringValue>
<type>VARIABLE</type>
</item>
<item id="212" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="213">dataSource</name>
<stringValue id="214">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="215" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="216">downstreamSystemName</name>
<stringValue id="217">Default</stringValue>
<type>CONSTANT</type>
</item>
<item id="218" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="219">entities</name>
<stringValue id="220">ExtractionEntity</stringValue>
<type>VARIABLE</type>
</item>
<item id="221" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="222">entitySequenceNumbers</name>
<stringValue id="223">EntitySequenceNumbers</stringValue>
<type>VARIABLE</type>
</item>
<item id="224" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="225">status</name>
<stringValue id="226">SUCCESSFUL</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="227" type="java.util.HashSet">
<item id="228" type="com.j2fe.workflow.definition.Transition">
<name id="229">goto-next</name>
<source id="230">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="231"/>
<directJoin>false</directJoin>
<name id="232">JMS Publisher</name>
<nodeHandler>com.j2fe.general.activities.JMS</nodeHandler>
<nodeHandlerClass id="233">com.j2fe.general.activities.JMS</nodeHandlerClass>
<parameters id="234" type="java.util.HashSet">
<item id="235" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="236">connectionFactory</name>
<stringValue id="237">JMSConFactory</stringValue>
<type>VARIABLE</type>
</item>
<item id="238" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="239">destination</name>
<stringValue id="240">IssueQueue</stringValue>
<type>VARIABLE</type>
</item>
<item id="241" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="242">persistent</name>
<stringValue id="243">true</stringValue>
<type>CONSTANT</type>
</item>
<item id="244" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="245">textInput</name>
<stringValue id="246">ExtractionResult</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="247" type="java.util.HashSet">
<item id="248" type="com.j2fe.workflow.definition.Transition">
<name id="249">ISSUPUB</name>
<source idref="162"/>
<target idref="230"/>
</item>
</sources>
<targets id="250" type="java.util.HashSet">
<item idref="228" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="201"/>
</item>
<item idref="199" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="251" type="java.util.HashSet">
<item id="252" type="com.j2fe.workflow.definition.Transition">
<name id="253">goto-next</name>
<source idref="201"/>
<target idref="3"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item idref="248" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</target>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item id="254" type="com.j2fe.workflow.definition.Transition">
<name id="255">no Entities</name>
<source idref="114"/>
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
<item idref="252" type="com.j2fe.workflow.definition.Transition"/>
<item idref="254" type="com.j2fe.workflow.definition.Transition"/>
<item idref="109" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="256" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="257">Mizuho/Publishing</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="258">user1</lastChangeUser>
<lastUpdate id="259">2025-10-10T17:32:30.000+0100</lastUpdate>
<name id="260">CSTMPublishingtoFileMIZ</name>
<nodes id="261" type="java.util.HashSet">
<item idref="201" type="com.j2fe.workflow.definition.Node"/>
<item idref="138" type="com.j2fe.workflow.definition.Node"/>
<item idref="114" type="com.j2fe.workflow.definition.Node"/>
<item idref="10" type="com.j2fe.workflow.definition.Node"/>
<item idref="230" type="com.j2fe.workflow.definition.Node"/>
<item idref="180" type="com.j2fe.workflow.definition.Node"/>
<item idref="77" type="com.j2fe.workflow.definition.Node"/>
<item idref="101" type="com.j2fe.workflow.definition.Node"/>
<item idref="3" type="com.j2fe.workflow.definition.Node"/>
<item idref="162" type="com.j2fe.workflow.definition.Node"/>
<item idref="38" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>false</optimize>
<parameter id="262" type="java.util.HashMap">
<entry>
<key id="263" type="java.lang.String">EntityId</key>
<value id="264" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="265">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="266" type="java.lang.String">ExtractionResult</key>
<value id="267" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="268">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>false</input>
<output>true</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="269" type="java.lang.String">IssueQueue</key>
<value id="270" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="271">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="272"/>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="273" type="java.lang.String">IssuerQueue</key>
<value id="274" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="275">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="276"/>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="277" type="java.lang.String">JMSConFactory</key>
<value id="278" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="279">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="280"/>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="281" type="java.lang.String">LoopCounter</key>
<value id="282" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="283">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="284"/>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="285" type="java.lang.String">ModelID</key>
<value id="286" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="287">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
</parameter>
<permissions id="288" type="java.util.HashSet"/>
<priority>0</priority>
<purgeAtEnd>false</purgeAtEnd>
<retries>0</retries>
<startNode idref="101"/>
<status>RELEASED</status>
<variables id="289" type="java.util.HashMap">
<entry>
<key id="290" type="java.lang.String">EntityId</key>
<value id="291" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="292">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="293" type="java.lang.String">ExtractionResult</key>
<value id="294" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="295">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>true</persistent>
</value>
</entry>
<entry>
<key id="296" type="java.lang.String">IssueQueue</key>
<value id="297" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="298">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="299"/>
<persistent>false</persistent>
<value id="300" type="java.lang.String">jms/queue/security</value>
</value>
</entry>
<entry>
<key id="301" type="java.lang.String">IssuerQueue</key>
<value id="302" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="303">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="304"/>
<persistent>false</persistent>
<value id="305" type="java.lang.String">jms/queue/issuer</value>
</value>
</entry>
<entry>
<key id="306" type="java.lang.String">JMSConFactory</key>
<value id="307" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="308">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="309"/>
<persistent>false</persistent>
<value id="310" type="java.lang.String">jms/QueueConnection</value>
</value>
</entry>
<entry>
<key id="311" type="java.lang.String">LoopCounter</key>
<value id="312" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="313">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="314"/>
<persistent>false</persistent>
<value id="315" type="java.lang.Integer">0</value>
</value>
</entry>
<entry>
<key id="316" type="java.lang.String">ModelID</key>
<value id="317" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="318">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="319" type="java.lang.String">ISSUPUB</value>
</value>
</entry>
</variables>
<version>19</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
