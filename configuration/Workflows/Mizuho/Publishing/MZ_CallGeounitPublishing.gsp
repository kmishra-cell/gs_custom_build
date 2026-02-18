<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.07">
<package-comment/>
<businessobject displayString="7 - JMSQConfig" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>false</alwaysPersist>
<clustered>true</clustered>
<comment id="1">JMSQConfig</comment>
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
</item>
<item id="21" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="22">input</name>
<stringValue id="23">ExtractDefinitions</stringValue>
<type>VARIABLE</type>
</item>
<item id="24" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="25">output</name>
<stringValue id="26">SingleExtDef</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="27" type="java.util.HashSet">
<item id="28" type="com.j2fe.workflow.definition.Transition">
<name id="29">extraction</name>
<source id="30">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="31"/>
<directJoin>false</directJoin>
<name id="32">Write ExtractionLog</name>
<nodeHandler>com.thegoldensource.publishing.activity.WriteExtractionLog</nodeHandler>
<nodeHandlerClass id="33">com.thegoldensource.publishing.activity.WriteExtractionLog</nodeHandlerClass>
<parameters id="34" type="java.util.HashSet">
<item id="35" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="36">auditId</name>
<stringValue id="37">AuditIdentifier</stringValue>
<type>VARIABLE</type>
</item>
<item id="38" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="39">entityMode</name>
<stringValue id="40">MODEL_ENTITY</stringValue>
<type>CONSTANT</type>
</item>
<item id="41" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="42">eql</name>
<stringValue id="43">PublishQuery</stringValue>
<type>VARIABLE</type>
</item>
<item id="44" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="45">extractDefinitions</name>
<stringValue id="46">ExtractDefinitions</stringValue>
<type>VARIABLE</type>
</item>
<item id="47" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="48">extractorFactory</name>
<stringValue id="49">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="50" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="51">maxExtractCount</name>
<stringValue id="52">BulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="53" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="54">modelName</name>
<stringValue id="55">ModelID</stringValue>
<type>VARIABLE</type>
</item>
<item id="56" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="57">newStartIndex</name>
<stringValue id="58">NewExtractionLogStartIndex</stringValue>
<type>VARIABLE</type>
</item>
<item id="59" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="60">queryParameter</name>
<stringValue id="61">QueryParameter</stringValue>
<type>VARIABLE</type>
</item>
<item id="62" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="63">["id"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="64">queryParameter["id"]</name>
<stringValue id="65">CrossRefId</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="66" type="java.util.HashSet">
<item id="67" type="com.j2fe.workflow.definition.Transition">
<name id="68">goto-next</name>
<source id="69">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="70"/>
<directJoin>false</directJoin>
<name id="71">PublishQuery</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="72">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="73" type="java.util.HashSet">
<item id="74" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="75">statements</name>
<stringValue id="76">String query = "&lt;sql&gt;cross_ref_id in (select cross_ref_id from ft_t_gunt where cross_ref_id = '"+crossrefid+ "' and PRNT_GU_ID in (select gu_id from ft_t_gugp where ft_t_gugp.GU_TYP = ft_t_gunt.PRNT_GU_TYP))&lt;/sql&gt;"</stringValue>
<type>CONSTANT</type>
</item>
<item id="77" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="78">["crossrefid"]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="79">variables["crossrefid"]</name>
<stringValue id="80">CrossRefId</stringValue>
<type>VARIABLE</type>
</item>
<item id="81" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="82">@java/util/Map@["query"]@java/lang/Object@</UITypeHint>
<input>false</input>
<name id="83">variables["query"]</name>
<stringValue id="84">PublishQuery</stringValue>
<type>VARIABLE</type>
<variablePart id="85">["query"]</variablePart>
</item>
</parameters>
<sources id="86" type="java.util.HashSet">
<item id="87" type="com.j2fe.workflow.definition.Transition">
<name id="88">rows-found</name>
<source id="89">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="90"/>
<directJoin>false</directJoin>
<name id="91">Database Select (Xor Split)</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="92">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
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
<stringValue id="99">CrossRefId</stringValue>
<type>VARIABLE</type>
</item>
<item id="100" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="101">querySQL</name>
<stringValue id="102">select cross_ref_id from ft_t_gunt where cross_ref_id = ? and PRNT_GU_ID in (select gu_id from ft_t_gugp where ft_t_gugp.GU_TYP = ft_t_gunt.PRNT_GU_TYP)</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="103" type="java.util.HashSet">
<item id="104" type="com.j2fe.workflow.definition.Transition">
<name id="105">goto-next</name>
<source id="106">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="107"/>
<directJoin>false</directJoin>
<name id="108">Get CrossRefId</name>
<nodeHandler>com.j2fe.workflow.handler.impl.ExecuteXPath</nodeHandler>
<nodeHandlerClass id="109">com.j2fe.workflow.handler.impl.ExecuteXPath</nodeHandlerClass>
<parameters id="110" type="java.util.HashSet">
<item id="111" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="112">inputText</name>
<stringValue id="113">inputMessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="114" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="115">outputValue</name>
<stringValue id="116">CrossRefId</stringValue>
<type>VARIABLE</type>
</item>
<item id="117" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="118">xPath</name>
<stringValue id="119">/STREET_REF/SEGMENT[@TYPE="GeographicUnit"]/GeographicUnit/CROSSREFID/@VALUE</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="120" type="java.util.HashSet">
<item id="121" type="com.j2fe.workflow.definition.Transition">
<name id="122">goto-next</name>
<source id="123">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="124"/>
<directJoin>false</directJoin>
<name id="125">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="126">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="127" type="java.util.HashSet"/>
<targets id="128" type="java.util.HashSet">
<item idref="121" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="106"/>
</item>
</sources>
<targets id="129" type="java.util.HashSet">
<item idref="104" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="89"/>
</item>
</sources>
<targets id="130" type="java.util.HashSet">
<item id="131" type="com.j2fe.workflow.definition.Transition">
<name id="132">nothing-found</name>
<source idref="89"/>
<target idref="3"/>
</item>
<item idref="87" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="69"/>
</item>
</sources>
<targets id="133" type="java.util.HashSet">
<item idref="67" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="30"/>
</item>
</sources>
<targets id="134" type="java.util.HashSet">
<item idref="28" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="10"/>
</item>
</sources>
<targets id="135" type="java.util.HashSet">
<item idref="8" type="com.j2fe.workflow.definition.Transition"/>
<item id="136" type="com.j2fe.workflow.definition.Transition">
<name id="137">loop</name>
<source idref="10"/>
<target id="138">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="139"/>
<directJoin>false</directJoin>
<name id="140">Extract Entity</name>
<nodeHandler>com.thegoldensource.publishing.activity.ExtractBusinessEntity</nodeHandler>
<nodeHandlerClass id="141">com.thegoldensource.publishing.activity.ExtractBusinessEntity</nodeHandlerClass>
<parameters id="142" type="java.util.HashSet">
<item id="143" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="144">additionalData</name>
<stringValue id="145">AdditionalData</stringValue>
<type>VARIABLE</type>
</item>
<item id="146" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="147">extractionDefinition</name>
<stringValue id="148">SingleExtDef</stringValue>
<type>VARIABLE</type>
</item>
<item id="149" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="150">extractionResult</name>
<stringValue id="151">ExtractedEntities</stringValue>
<type>VARIABLE</type>
</item>
<item id="152" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="153">extractorFactory</name>
<stringValue id="154">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="155" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="156">queryParameter</name>
<stringValue id="157">QueryParameter</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="158" type="java.util.HashSet">
<item idref="136" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="159" type="java.util.HashSet">
<item id="160" type="com.j2fe.workflow.definition.Transition">
<name id="161">found Entities</name>
<source idref="138"/>
<target id="162">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="163"/>
<directJoin>false</directJoin>
<name id="164">Convert Entity</name>
<nodeHandler>com.thegoldensource.publishing.activity.ConvertBusinessEntity</nodeHandler>
<nodeHandlerClass id="165">com.thegoldensource.publishing.activity.ConvertBusinessEntity</nodeHandlerClass>
<parameters id="166" type="java.util.HashSet">
<item id="167" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="168">addXMLHeader</name>
<stringValue id="169">true</stringValue>
<type>CONSTANT</type>
</item>
<item id="170" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="171">businessEntity</name>
<stringValue id="172">ExtractedEntities</stringValue>
<type>VARIABLE</type>
</item>
<item id="173" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="174">entitySequenceNumbers</name>
<stringValue id="175">EntitySequenceNumbers</stringValue>
<type>VARIABLE</type>
</item>
<item id="176" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="177">output</name>
<stringValue id="178">ExtractionResult</stringValue>
<type>VARIABLE</type>
</item>
<item id="179" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="180">outputType</name>
<stringValue id="181">XML</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="182" type="java.util.HashSet">
<item idref="160" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="183" type="java.util.HashSet">
<item id="184" type="com.j2fe.workflow.definition.Transition">
<name id="185">goto-next</name>
<source idref="162"/>
<target id="186">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="187"/>
<directJoin>false</directJoin>
<name id="188">JMS Publisher</name>
<nodeHandler>com.j2fe.general.activities.JMS</nodeHandler>
<nodeHandlerClass id="189">com.j2fe.general.activities.JMS</nodeHandlerClass>
<parameters id="190" type="java.util.HashSet">
<item id="191" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="192">connectionFactory</name>
<stringValue id="193">JMSConFactory</stringValue>
<type>VARIABLE</type>
</item>
<item id="194" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="195">destination</name>
<stringValue id="196">GeoUnitQueue</stringValue>
<type>VARIABLE</type>
</item>
<item id="197" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="198">persistent</name>
<stringValue id="199">true</stringValue>
<type>CONSTANT</type>
</item>
<item id="200" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="201">textInput</name>
<stringValue id="202">ExtractionResult</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="203" type="java.util.HashSet">
<item idref="184" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="204" type="java.util.HashSet">
<item id="205" type="com.j2fe.workflow.definition.Transition">
<name id="206">goto-next</name>
<source idref="186"/>
<target id="207">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="208"/>
<directJoin>false</directJoin>
<name id="209">Add To Audit Trail</name>
<nodeHandler>com.thegoldensource.publishing.activity.AddAuditTrail</nodeHandler>
<nodeHandlerClass id="210">com.thegoldensource.publishing.activity.AddAuditTrail</nodeHandlerClass>
<parameters id="211" type="java.util.HashSet">
<item id="212" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="213">GSDM</name>
<stringValue id="214">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="215" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="216">auditId</name>
<stringValue id="217">AuditIdentifier</stringValue>
<type>VARIABLE</type>
</item>
<item id="218" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="219">dataSource</name>
<stringValue id="220">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="221" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="222">downstreamSystemName</name>
<stringValue id="223">Default</stringValue>
<type>CONSTANT</type>
</item>
<item id="224" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="225">entities</name>
<stringValue id="226">ExtractedEntities</stringValue>
<type>VARIABLE</type>
</item>
<item id="227" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="228">entitySequenceNumbers</name>
<stringValue id="229">EntitySequenceNumbers</stringValue>
<type>VARIABLE</type>
</item>
<item id="230" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="231">status</name>
<stringValue id="232">SUCCESSFUL</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="233" type="java.util.HashSet">
<item idref="205" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="234" type="java.util.HashSet">
<item id="235" type="com.j2fe.workflow.definition.Transition">
<name id="236">goto-next</name>
<source idref="207"/>
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
<target idref="3"/>
</item>
<item idref="235" type="com.j2fe.workflow.definition.Transition"/>
<item idref="131" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="237" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="238">Mizuho/Publishing</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="239">user1</lastChangeUser>
<lastUpdate id="240">2025-08-21T05:46:57.000+0100</lastUpdate>
<name id="241">MZ_CallGeounitPublishing</name>
<nodes id="242" type="java.util.HashSet">
<item idref="207" type="com.j2fe.workflow.definition.Node"/>
<item idref="162" type="com.j2fe.workflow.definition.Node"/>
<item idref="89" type="com.j2fe.workflow.definition.Node"/>
<item idref="138" type="com.j2fe.workflow.definition.Node"/>
<item idref="10" type="com.j2fe.workflow.definition.Node"/>
<item idref="106" type="com.j2fe.workflow.definition.Node"/>
<item idref="186" type="com.j2fe.workflow.definition.Node"/>
<item idref="69" type="com.j2fe.workflow.definition.Node"/>
<item idref="123" type="com.j2fe.workflow.definition.Node"/>
<item idref="3" type="com.j2fe.workflow.definition.Node"/>
<item idref="30" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>true</optimize>
<parameter id="243" type="java.util.HashMap">
<entry>
<key id="244" type="java.lang.String">GeoUnitQueue</key>
<value id="245" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="246">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="247"/>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="248" type="java.lang.String">JMSConFactory</key>
<value id="249" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="250">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="251"/>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="252" type="java.lang.String">JobId</key>
<value id="253" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="254">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="255" type="java.lang.String">LoopCounter</key>
<value id="256" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="257">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="258"/>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="259" type="java.lang.String">MessageType</key>
<value id="260" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="261">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="262" type="java.lang.String">ModelID</key>
<value id="263" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="264">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="265">Publising model ID</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="266" type="java.lang.String">TESTJMSConnection</key>
<value id="267" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="268">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="269"/>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="270" type="java.lang.String">inputMessage</key>
<value id="271" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="272">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="273" type="java.lang.String">processedMessages</key>
<value id="274" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="275">[[B</className>
<clazz>[[B</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="276" type="java.lang.String">prpFileLocation</key>
<value id="277" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="278">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="279" type="java.lang.String">severity</key>
<value id="280" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="281">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="282" type="java.lang.String">transactionId</key>
<value id="283" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="284">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="285" type="java.lang.String">translatedMessages</key>
<value id="286" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="287">com.j2fe.translation.Result</className>
<clazz>com.j2fe.translation.Result</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
</parameter>
<permissions id="288" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>false</purgeAtEnd>
<retries>0</retries>
<startNode idref="123"/>
<status>RELEASED</status>
<variables id="289" type="java.util.HashMap">
<entry>
<key id="290" type="java.lang.String">GeoUnitQueue</key>
<value id="291" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="292">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="293"/>
<persistent>false</persistent>
<value id="294" type="java.lang.String">jms/queue/geographicUnit</value>
</value>
</entry>
<entry>
<key id="295" type="java.lang.String">JMSConFactory</key>
<value id="296" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="297">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="298"/>
<persistent>false</persistent>
<value id="299" type="java.lang.String">jms/QueueConnection</value>
</value>
</entry>
<entry>
<key id="300" type="java.lang.String">JobId</key>
<value id="301" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="302">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="303" type="java.lang.String">LoopCounter</key>
<value id="304" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="305">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="306"/>
<persistent>false</persistent>
<value id="307" type="java.lang.Integer">0</value>
</value>
</entry>
<entry>
<key id="308" type="java.lang.String">MessageType</key>
<value id="309" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="310">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="311" type="java.lang.String">ModelID</key>
<value id="312" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="313">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="314">Publising model ID</description>
<persistent>false</persistent>
<value id="315" type="java.lang.String">GUNT_PUB</value>
</value>
</entry>
<entry>
<key id="316" type="java.lang.String">TESTJMSConnection</key>
<value id="317" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="318">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="319"/>
<persistent>false</persistent>
<value id="320" type="java.lang.String">TESTJMSConnection</value>
</value>
</entry>
<entry>
<key id="321" type="java.lang.String">inputMessage</key>
<value id="322" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="323">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="324" type="java.lang.String">processedMessages</key>
<value id="325" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="326">[[B</className>
<clazz>[[B</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="327" type="java.lang.String">prpFileLocation</key>
<value id="328" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="329">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="330" type="java.lang.String">severity</key>
<value id="331" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="332">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="333" type="java.lang.String">transactionId</key>
<value id="334" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="335">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="336" type="java.lang.String">translatedMessages</key>
<value id="337" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="338">com.j2fe.translation.Result</className>
<clazz>com.j2fe.translation.Result</clazz>
<persistent>false</persistent>
</value>
</entry>
</variables>
<version>7</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
