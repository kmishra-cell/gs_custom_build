<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.04">
<package-comment/>
<businessobject displayString="18 - V-10 Raise remote event for publishing" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>true</alwaysPersist>
<clustered>true</clustered>
<comment id="1">V-10 Raise remote event for publishing</comment>
<endNode id="2">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="3"/>
<directJoin>false</directJoin>
<name id="4">Stop</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="5">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<persistentVariables id="6" type="java.util.HashSet">
<item id="7" type="java.lang.String">messages
0100</item>
</persistentVariables>
<sources id="8" type="java.util.HashSet">
<item id="9" type="com.j2fe.workflow.definition.Transition">
<name id="10">goto-next</name>
<source id="11">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="12"/>
<directJoin>false</directJoin>
<name id="13">merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="14">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<persistentVariables id="15" type="java.util.HashSet">
<item id="16" type="java.lang.String">messages
0100</item>
<item id="17" type="java.lang.String">bulkedMessages
0100</item>
</persistentVariables>
<sources id="18" type="java.util.HashSet">
<item id="19" type="com.j2fe.workflow.definition.Transition">
<name id="20">goto-next</name>
<source id="21">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="22"/>
<directJoin>false</directJoin>
<name id="23">Set TransactionIDList</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="24">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="25" type="java.util.HashSet">
<item id="26" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="27">statements</name>
<stringValue id="28">String trnIDList = trnIdList;</stringValue>
<type>CONSTANT</type>
</item>
<item id="29" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="30">variables["trnIDList"]</name>
<stringValue id="31">TransactionIDList</stringValue>
<type>VARIABLE</type>
</item>
<item id="32" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="33">["trnIdList"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="34">variables["trnIdList"]</name>
<stringValue id="35">TransactionIDs</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="36" type="java.util.HashSet">
<item id="37" type="com.j2fe.workflow.definition.Transition">
<name id="38">end-loop</name>
<source id="39">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="40"/>
<directJoin>false</directJoin>
<name id="41">For Loop</name>
<nodeHandler>com.j2fe.workflow.handler.impl.ForEach</nodeHandler>
<nodeHandlerClass id="42">com.j2fe.workflow.handler.impl.ForEach</nodeHandlerClass>
<parameters id="43" type="java.util.HashSet">
<item id="44" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="45">counter</name>
<stringValue id="46">LoopCounter</stringValue>
<type>VARIABLE</type>
</item>
<item id="47" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="48">counter</name>
<stringValue id="49">LoopCounter</stringValue>
<type>VARIABLE</type>
</item>
<item id="50" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="51">incrementValue</name>
<stringValue id="52">BulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="53" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="54">input</name>
<stringValue id="55">messages</stringValue>
<type>VARIABLE</type>
</item>
<item id="56" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="57">outputObjects</name>
<stringValue id="58">bulkedMessages</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="59" type="java.util.HashSet">
<item id="60" type="com.j2fe.workflow.definition.Transition">
<name id="61">goto-next</name>
<source id="62">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="63"/>
<directJoin>false</directJoin>
<name id="64">merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="65">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="66" type="java.util.HashSet">
<item id="67" type="com.j2fe.workflow.definition.Transition">
<name id="68">goto-next</name>
<source id="69">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="70"/>
<directJoin>false</directJoin>
<name id="71">NOP</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="72">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="73" type="java.util.HashSet">
<item id="74" type="com.j2fe.workflow.definition.Transition">
<name id="75">goto-next</name>
<source id="76">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="77"/>
<directJoin>true</directJoin>
<name id="78">Synchronize</name>
<nodeHandler>com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandler>
<nodeHandlerClass id="79">com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandlerClass>
<sources id="80" type="java.util.HashSet">
<item id="81" type="com.j2fe.workflow.definition.Transition">
<name id="82">N</name>
<source id="83">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="84"/>
<directJoin>false</directJoin>
<name id="85">Publish?</name>
<nodeHandler>com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandler>
<nodeHandlerClass id="86">com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandlerClass>
<parameters id="87" type="java.util.HashSet">
<item id="88" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="89">caseItem</name>
<stringValue id="90">PublishFlag</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="91" type="java.util.HashSet">
<item id="92" type="com.j2fe.workflow.definition.Transition">
<name id="93">ToSplit</name>
<source id="94">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="95">Automatically generated</description>
<directJoin>false</directJoin>
<name id="96">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="97">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="98" type="java.util.HashSet">
<item id="99" type="com.j2fe.workflow.definition.Transition">
<name id="100">goto-next</name>
<source id="101">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="102"/>
<directJoin>false</directJoin>
<name id="103">Build TrnID List</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="104">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="105" type="java.util.HashSet">
<item id="106" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="107">statements</name>
<stringValue id="108">String trnIDList = trnIdList;	&#13;
&#13;
if(trnIDList != null &amp;&amp; !trnIDList.isEmpty()) {	&#13;
	trnIDList = trnIDList + "," + trnID;	&#13;
}	&#13;
else	&#13;
{	&#13;
	trnIDList = trnID;	&#13;
}	</stringValue>
<type>CONSTANT</type>
</item>
<item id="109" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="110">["trnID"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="111">variables["trnID"]</name>
<stringValue id="112">trnId</stringValue>
<type>VARIABLE</type>
</item>
<item id="113" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="114">variables["trnIDList"]</name>
<stringValue id="115">TransactionIDs</stringValue>
<type>VARIABLE</type>
</item>
<item id="116" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="117">["trnIdList"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="118">variables["trnIdList"]</name>
<stringValue id="119">TransactionIDs</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="120" type="java.util.HashSet">
<item id="121" type="com.j2fe.workflow.definition.Transition">
<name id="122">goto-next</name>
<source id="123">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="124"/>
<directJoin>false</directJoin>
<name id="125">Process REAL message</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="126">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="127" type="java.util.HashSet">
<item id="128" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="129">["IsWorkstationMessage"]@java/lang/Boolean@</UITypeHint>
<input>true</input>
<name id="130">input["IsWorkstationMessage"]</name>
<objectValue id="131" type="java.lang.Boolean">false</objectValue>
<type>CONSTANT</type>
</item>
<item id="132" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="133">["MessageType"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="134">input["MessageType"]</name>
<objectValue id="135" type="java.lang.String">REAL</objectValue>
<type>CONSTANT</type>
</item>
<item id="136" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="137">["Messages"]@[Ljava/lang/String;@</UITypeHint>
<input>true</input>
<name id="138">input["Messages"]</name>
<stringValue id="139">message</stringValue>
<type>VARIABLE</type>
</item>
<item id="140" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="141">name</name>
<stringValue id="142">Workstation Workflow</stringValue>
<type>CONSTANT</type>
</item>
<item id="143" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="144">["TransactionId"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="145">output["TransactionId"]</name>
<stringValue id="146">trnId</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<persistentVariables id="147" type="java.util.HashSet">
<item id="148" type="java.lang.String">message
1100</item>
<item id="149" type="java.lang.String">messages
1000</item>
<item id="150" type="java.lang.String">bulkedMessages
1000</item>
</persistentVariables>
<sources id="151" type="java.util.HashSet">
<item id="152" type="com.j2fe.workflow.definition.Transition">
<name id="153">goto-next</name>
<source id="154">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="155"/>
<directJoin>true</directJoin>
<name id="156">For Each Split</name>
<nodeHandler>com.j2fe.workflow.handler.impl.GenericSplit</nodeHandler>
<nodeHandlerClass id="157">com.j2fe.workflow.handler.impl.GenericSplit</nodeHandlerClass>
<parameters id="158" type="java.util.HashSet">
<item id="159" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="160">input</name>
<stringValue id="161">bulkedMessages</stringValue>
<type>VARIABLE</type>
</item>
<item id="162" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="163">output</name>
<stringValue id="164">message</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<persistentVariables id="165" type="java.util.HashSet">
<item id="166" type="java.lang.String">bulkedMessages
0100</item>
</persistentVariables>
<sources id="167" type="java.util.HashSet">
<item id="168" type="com.j2fe.workflow.definition.Transition">
<name id="169">loop</name>
<source idref="39"/>
<target idref="154"/>
</item>
</sources>
<targets id="170" type="java.util.HashSet">
<item idref="152" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDSPLIT</type>
</source>
<target idref="123"/>
</item>
</sources>
<targets id="171" type="java.util.HashSet">
<item idref="121" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="101"/>
</item>
</sources>
<targets id="172" type="java.util.HashSet">
<item idref="99" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="94"/>
</item>
</sources>
<targets id="173" type="java.util.HashSet">
<item idref="92" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="83"/>
</item>
</sources>
<targets id="174" type="java.util.HashSet">
<item idref="81" type="com.j2fe.workflow.definition.Transition"/>
<item id="175" type="com.j2fe.workflow.definition.Transition">
<name id="176">Y</name>
<source idref="83"/>
<target id="177">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="178"/>
<directJoin>false</directJoin>
<name id="179">Publishing Event Remote</name>
<nodeHandler>com.j2fe.event.RaiseEventRemote</nodeHandler>
<nodeHandlerClass id="180">com.j2fe.event.RaiseEventRemote</nodeHandlerClass>
<parameters id="181" type="java.util.HashSet">
<item id="182" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="183">eventName</name>
<stringValue id="184">MizPublishForTxn_Event</stringValue>
<type>CONSTANT</type>
</item>
<item id="185" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="186">["No. Of Parallel Branches"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="187">parameters["No. Of Parallel Branches"]</name>
<objectValue id="188" type="java.lang.Integer">20</objectValue>
<type>CONSTANT</type>
</item>
<item id="189" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="190">["transactionId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="191">parameters["transactionId"]</name>
<stringValue id="192">trnId</stringValue>
<type>VARIABLE</type>
</item>
<item id="193" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="194">propertyFileLocation</name>
<stringValue id="195">db://resource/PublishingConfiguration/PublishingConfig.properties</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="196" type="java.util.HashSet">
<item idref="175" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="197" type="java.util.HashSet">
<item id="198" type="com.j2fe.workflow.definition.Transition">
<name id="199">goto-next</name>
<source idref="177"/>
<target idref="76"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="76"/>
</item>
<item idref="198" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="200" type="java.util.HashSet">
<item idref="74" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDJOIN</type>
</source>
<target idref="69"/>
</item>
</sources>
<targets id="201" type="java.util.HashSet">
<item idref="67" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="62"/>
</item>
<item id="202" type="com.j2fe.workflow.definition.Transition">
<name id="203">rows-found</name>
<source id="204">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="205"/>
<directJoin>false</directJoin>
<name id="206">Database Select (Standard)</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="207">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="208" type="java.util.HashSet">
<item id="209" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="210">database</name>
<stringValue id="211">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="212" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="213">firstColumnsResult</name>
<stringValue id="214">messages</stringValue>
<type>VARIABLE</type>
</item>
<item id="215" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="216">querySQL</name>
<stringValue id="217">sqlSelect</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="218" type="java.util.HashSet">
<item id="219" type="com.j2fe.workflow.definition.Transition">
<name id="220">goto-next</name>
<source id="221">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="222"/>
<directJoin>false</directJoin>
<name id="223">NOP </name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="224">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="225" type="java.util.HashSet">
<item id="226" type="com.j2fe.workflow.definition.Transition">
<name id="227">goto-next</name>
<source id="228">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="229"/>
<directJoin>false</directJoin>
<name id="230">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="231">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="232" type="java.util.HashSet"/>
<targets id="233" type="java.util.HashSet">
<item idref="226" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="221"/>
</item>
</sources>
<targets id="234" type="java.util.HashSet">
<item idref="219" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="204"/>
</item>
</sources>
<targets id="235" type="java.util.HashSet">
<item id="236" type="com.j2fe.workflow.definition.Transition">
<name id="237">nothing-found</name>
<source idref="204"/>
<target idref="2"/>
</item>
<item idref="202" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="62"/>
</item>
</sources>
<targets id="238" type="java.util.HashSet">
<item idref="60" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="39"/>
</item>
</sources>
<targets id="239" type="java.util.HashSet">
<item idref="37" type="com.j2fe.workflow.definition.Transition"/>
<item idref="168" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="21"/>
</item>
</sources>
<targets id="240" type="java.util.HashSet">
<item idref="19" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="11"/>
</item>
</sources>
<targets id="241" type="java.util.HashSet">
<item idref="9" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="2"/>
</item>
<item idref="236" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="242" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="243">Custom/Dataloads</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="244">user1</lastChangeUser>
<lastUpdate id="245">2025-10-17T17:05:09.000+0100</lastUpdate>
<name id="246">RealMessageProcessing</name>
<nodes id="247" type="java.util.HashSet">
<item idref="101" type="com.j2fe.workflow.definition.Node"/>
<item idref="204" type="com.j2fe.workflow.definition.Node"/>
<item idref="154" type="com.j2fe.workflow.definition.Node"/>
<item idref="39" type="com.j2fe.workflow.definition.Node"/>
<item idref="94" type="com.j2fe.workflow.definition.Node"/>
<item idref="69" type="com.j2fe.workflow.definition.Node"/>
<item idref="221" type="com.j2fe.workflow.definition.Node"/>
<item idref="123" type="com.j2fe.workflow.definition.Node"/>
<item idref="83" type="com.j2fe.workflow.definition.Node"/>
<item idref="177" type="com.j2fe.workflow.definition.Node"/>
<item idref="21" type="com.j2fe.workflow.definition.Node"/>
<item idref="228" type="com.j2fe.workflow.definition.Node"/>
<item idref="2" type="com.j2fe.workflow.definition.Node"/>
<item idref="76" type="com.j2fe.workflow.definition.Node"/>
<item idref="62" type="com.j2fe.workflow.definition.Node"/>
<item idref="11" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>false</optimize>
<parameter id="248" type="java.util.HashMap">
<entry>
<key id="249" type="java.lang.String">BulkSize</key>
<value id="250" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="251">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="252" type="java.lang.String">PublishFlag</key>
<value id="253" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="254">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="255">Do you want to publish? Y/N</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="256" type="java.lang.String">TransactionIDList</key>
<value id="257" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="258">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>false</input>
<output>true</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="259" type="java.lang.String">sqlSelect</key>
<value id="260" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="261">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="262"/>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
</parameter>
<permissions id="263" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>false</purgeAtEnd>
<retries>0</retries>
<startNode idref="228"/>
<status>RELEASED</status>
<variables id="264" type="java.util.HashMap">
<entry>
<key id="265" type="java.lang.String">BulkSize</key>
<value id="266" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="267">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<persistent>false</persistent>
<value id="268" type="java.lang.Integer">20</value>
</value>
</entry>
<entry>
<key id="269" type="java.lang.String">LoopCounter</key>
<value id="270" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="271">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<persistent>false</persistent>
<value id="272" type="java.lang.Integer">0</value>
</value>
</entry>
<entry>
<key id="273" type="java.lang.String">PublishFlag</key>
<value id="274" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="275">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="276">Do you want to publish? Y/N</description>
<persistent>false</persistent>
<value id="277" type="java.lang.String">Y</value>
</value>
</entry>
<entry>
<key id="278" type="java.lang.String">TransactionIDList</key>
<value id="279" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="280">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="281" type="java.lang.String">TransactionIDs</key>
<value id="282" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="283">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="284" type="java.lang.String">sqlSelect</key>
<value id="285" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="286">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="287"/>
<persistent>false</persistent>
<value id="288" type="java.lang.String">SELECT '&lt;!DOCTYPE STREET_REF SYSTEM "fti://repository/dtd/STREET_REF"&gt;' || xmlelement(NAME "STREET_REF", xmlattributes('GUEST' AS "USERID"), xmlelement(NAME "SEGMENT", xmlattributes('Issuer' AS "TYPE", 'REFERENCE' AS "ACTION"), xmlelement(NAME "Issuer", xmlelement(NAME "INSTRISSRID", xmlattributes(rtrim(ft_t_issr.instr_issr_id) AS "VALUE")), xmlelement(NAME "LASTCHGUSRID", xmlattributes(ft_t_issr.last_chg_usr_id::text AS "VALUE")))), xmlelement(NAME "SEGMENT", xmlattributes('ISSRIssuerGroupParticipant' AS "TYPE", 'UNKNOWN' AS "ACTION"), xmlelement(NAME "ISSRIssuerGroupParticipant", xmlelement(NAME "PRNTISSRGRPOID", xmlattributes('IRGR000006' AS "VALUE")), xmlelement(NAME "PRTPURPTYP", xmlattributes('INTEREST' AS "VALUE")), xmlelement(NAME "LASTCHGUSRID", xmlattributes(ft_t_issr.last_chg_usr_id::text AS "VALUE"))))) FROM ft_t_issr ft_t_issr WHERE (ft_t_issr.end_tms IS NULL OR ft_t_issr.end_tms &gt; sysdate()) AND instr_issr_id IN (SELECT instr_issr_id FROM ft_t_irgp WHERE end_tms IS NULL) AND fins_inst_mnem IN (SELECT inst_mnem FROM ft_t_fins WHERE end_tms IS NULL AND NOT EXISTS (SELECT 1 FROM ft_t_firt r WHERE ft_t_fins.inst_mnem = r.inst_mnem AND end_tms IS NULL AND rtng_set_oid = 'MIZRTNG3' AND r.sys_eff_end_tms IS NULL));</value>
</value>
</entry>
</variables>
<version>18</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
