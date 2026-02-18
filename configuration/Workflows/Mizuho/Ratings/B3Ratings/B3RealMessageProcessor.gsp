<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.03">
<package-comment/>
<businessobject displayString="3 - GU-313" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>false</alwaysPersist>
<clustered>true</clustered>
<comment id="1">GU-313</comment>
<endNode id="2">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="3">END</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="4">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="5" type="java.util.HashSet">
<item id="6" type="com.j2fe.workflow.definition.Transition">
<name id="7">goto-next</name>
<source id="8">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="9">Close Transaction</name>
<nodeHandler>com.j2fe.streetlamp.activities.CloseTransaction</nodeHandler>
<nodeHandlerClass id="10">com.j2fe.streetlamp.activities.CloseTransaction</nodeHandlerClass>
<parameters id="11" type="java.util.HashSet">
<item id="12" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="13">flushImmediate</name>
<objectValue id="14" type="java.lang.Boolean">true</objectValue>
<type>CONSTANT</type>
</item>
<item id="15" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="16">messageType</name>
<stringValue id="17">MessageType</stringValue>
<type>VARIABLE</type>
</item>
<item id="18" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="19">transactionId</name>
<stringValue id="20">TransactionId</stringValue>
<type>VARIABLE</type>
</item>
<item id="21" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="22">transactionMetaData</name>
<stringValue id="23">Outputmsg</stringValue>
<type>VARIABLE</type>
<variablePart id="24">metaData</variablePart>
</item>
<item id="25" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="26">translatedTimestamp</name>
<stringValue id="27">TranslatedTimestamp</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="28" type="java.util.HashSet">
<item id="29" type="com.j2fe.workflow.definition.Transition">
<name id="30">goto-next</name>
<source id="31">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="32">Process Message</name>
<nodeHandler>com.j2fe.tp.activities.ProcessTransaction</nodeHandler>
<nodeHandlerClass id="33">com.j2fe.tp.activities.ProcessTransaction</nodeHandlerClass>
<parameters id="34" type="java.util.HashSet">
<item id="35" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="36">engineResource</name>
<stringValue id="37">engine/TPS-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="38" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="39">messageMetaData</name>
<stringValue id="40">message</stringValue>
<type>VARIABLE</type>
<variablePart id="41">properties.custom</variablePart>
</item>
<item id="42" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="43">messageType</name>
<stringValue id="44">MessageType</stringValue>
<type>VARIABLE</type>
</item>
<item id="45" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="46">processed</name>
<stringValue id="47">ProcessedMessages</stringValue>
<type>VARIABLE</type>
</item>
<item id="48" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="49">severity</name>
<stringValue id="50">Severity</stringValue>
<type>VARIABLE</type>
</item>
<item id="51" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="52">textInput</name>
<stringValue id="53">message</stringValue>
<type>VARIABLE</type>
<variablePart id="54">message</variablePart>
</item>
<item id="55" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="56">transactionId</name>
<stringValue id="57">TransactionId</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="58" type="java.util.HashSet">
<item id="59" type="com.j2fe.workflow.definition.Transition">
<name id="60">goto-next</name>
<source id="61">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="62">Translation (Standard)</name>
<nodeHandler>com.j2fe.translation.activities.Translation</nodeHandler>
<nodeHandlerClass id="63">com.j2fe.translation.activities.Translation</nodeHandlerClass>
<parameters id="64" type="java.util.HashSet">
<item id="65" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="66">MSFDBSelect</name>
<stringValue id="67">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="68" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="69">input</name>
<stringValue id="70">message</stringValue>
<type>VARIABLE</type>
</item>
<item id="71" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="72">messageType</name>
<stringValue id="73">MessageType</stringValue>
<type>VARIABLE</type>
</item>
<item id="74" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="75">metaData</name>
<stringValue id="76">message</stringValue>
<type>VARIABLE</type>
<variablePart id="77">properties.custom</variablePart>
</item>
<item id="78" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="79">output</name>
<stringValue id="80">Outputmsg</stringValue>
<type>VARIABLE</type>
</item>
<item id="81" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="82">transactionId</name>
<stringValue id="83">TransactionId</stringValue>
<type>VARIABLE</type>
</item>
<item id="84" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="85">wantedOutputType</name>
<stringValue id="86">Text</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="87" type="java.util.HashSet">
<item id="88" type="com.j2fe.workflow.definition.Transition">
<name id="89">false</name>
<source id="90">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="91">Message Null?</name>
<nodeHandler>com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandler>
<nodeHandlerClass id="92">com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandlerClass>
<parameters id="93" type="java.util.HashSet">
<item id="94" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="95">caseItem</name>
<stringValue id="96">message</stringValue>
<type>VARIABLE</type>
</item>
<item id="97" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="98">defaultItem</name>
<stringValue id="99">false</stringValue>
<type>CONSTANT</type>
</item>
<item id="100" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="101">nullTransition</name>
<stringValue id="102">true</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="103" type="java.util.HashSet">
<item id="104" type="com.j2fe.workflow.definition.Transition">
<name id="105">goto-next</name>
<source id="106">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="107">Create Message</name>
<nodeHandler>com.j2fe.feeds.activities.CreateMessage</nodeHandler>
<nodeHandlerClass id="108">com.j2fe.feeds.activities.CreateMessage</nodeHandlerClass>
<parameters id="109" type="java.util.HashSet">
<item id="110" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="111">intputMessage</name>
<stringValue id="112">singleMsg</stringValue>
<type>VARIABLE</type>
</item>
<item id="113" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="114">jobId</name>
<stringValue id="115">JobID</stringValue>
<type>VARIABLE</type>
</item>
<item id="116" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="117">message</name>
<stringValue id="118">message</stringValue>
<type>VARIABLE</type>
</item>
<item id="119" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="120">messageType</name>
<stringValue id="121">MessageType</stringValue>
<type>VARIABLE</type>
</item>
<item id="122" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="123">transactionId</name>
<stringValue id="124">TransactionId</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="125" type="java.util.HashSet">
<item id="126" type="com.j2fe.workflow.definition.Transition">
<name id="127">do-it</name>
<source id="128">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="129">Create Transaction</name>
<nodeHandler>com.j2fe.streetlamp.activities.CreateTransaction</nodeHandler>
<nodeHandlerClass id="130">com.j2fe.streetlamp.activities.CreateTransaction</nodeHandlerClass>
<parameters id="131" type="java.util.HashSet">
<item id="132" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="133">flushImmediate</name>
<objectValue id="134" type="java.lang.Boolean">true</objectValue>
<type>CONSTANT</type>
</item>
<item id="135" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="136">jobId</name>
<stringValue id="137">JobID</stringValue>
<type>VARIABLE</type>
</item>
<item id="138" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="139">messageType</name>
<stringValue id="140">MessageType</stringValue>
<type>VARIABLE</type>
</item>
<item id="141" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="142">transactionId</name>
<stringValue id="143">TransactionId</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="144" type="java.util.HashSet">
<item id="145" type="com.j2fe.workflow.definition.Transition">
<name id="146">goto-next</name>
<source id="147">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="148">Concatenate Strings</name>
<nodeHandler>com.j2fe.general.activities.ConcatenateStrings</nodeHandler>
<nodeHandlerClass id="149">com.j2fe.general.activities.ConcatenateStrings</nodeHandlerClass>
<parameters id="150" type="java.util.HashSet">
<item id="151" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="152">inputStrings[0]</name>
<stringValue id="153">&lt;!DOCTYPE STREET_REF SYSTEM "fti://repository/dtd/STREET_REF"&gt;</stringValue>
<type>CONSTANT</type>
</item>
<item id="154" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="155">inputStrings[1]</name>
<stringValue id="156">realMsg</stringValue>
<type>VARIABLE</type>
</item>
<item id="157" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="158">outputString</name>
<stringValue id="159">singleMsg</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="160" type="java.util.HashSet">
<item id="161" type="com.j2fe.workflow.definition.Transition">
<name id="162">go-to-translation</name>
<source id="163">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="164">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="165">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="166" type="java.util.HashSet"/>
<targets id="167" type="java.util.HashSet">
<item idref="161" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="147"/>
</item>
</sources>
<targets id="168" type="java.util.HashSet">
<item idref="145" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="128"/>
</item>
</sources>
<targets id="169" type="java.util.HashSet">
<item idref="126" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="106"/>
</item>
</sources>
<targets id="170" type="java.util.HashSet">
<item idref="104" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="90"/>
</item>
</sources>
<targets id="171" type="java.util.HashSet">
<item idref="88" type="com.j2fe.workflow.definition.Transition"/>
<item id="172" type="com.j2fe.workflow.definition.Transition">
<name id="173">true</name>
<source idref="90"/>
<target id="174">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="175">Report Notification</name>
<nodeHandler>com.j2fe.streetlamp.activities.ReportNotification</nodeHandler>
<nodeHandlerClass id="176">com.j2fe.streetlamp.activities.ReportNotification</nodeHandlerClass>
<parameters id="177" type="java.util.HashSet">
<item id="178" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="179">applicationId</name>
<stringValue id="180">INFSTRCT</stringValue>
<type>CONSTANT</type>
</item>
<item id="181" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="182">notificationId</name>
<stringValue id="183">2</stringValue>
<type>CONSTANT</type>
</item>
<item id="184" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="185">["errortext"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="186">parameterValues["errortext"]</name>
<stringValue id="187">message</stringValue>
<type>VARIABLE</type>
</item>
<item id="188" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="189">partId</name>
<stringValue id="190">CONTROLR</stringValue>
<type>CONSTANT</type>
</item>
<item id="191" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="192">severity</name>
<stringValue id="193">50</stringValue>
<type>CONSTANT</type>
</item>
<item id="194" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="195">transactionId</name>
<stringValue id="196">message</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="197" type="java.util.HashSet">
<item idref="172" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="198" type="java.util.HashSet">
<item id="199" type="com.j2fe.workflow.definition.Transition">
<name id="200">goto-next</name>
<source idref="174"/>
<target id="201">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="202">Close Transaction</name>
<nodeHandler>com.j2fe.streetlamp.activities.CloseTransaction</nodeHandler>
<nodeHandlerClass id="203">com.j2fe.streetlamp.activities.CloseTransaction</nodeHandlerClass>
<parameters id="204" type="java.util.HashSet">
<item id="205" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="206">flushImmediate</name>
<stringValue id="207">true</stringValue>
<type>CONSTANT</type>
</item>
<item id="208" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="209">submittedMessage</name>
<stringValue id="210">message</stringValue>
<type>VARIABLE</type>
</item>
<item id="211" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="212">transactionId</name>
<stringValue id="213">TransactionId</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="214" type="java.util.HashSet">
<item idref="199" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="215" type="java.util.HashSet">
<item id="216" type="com.j2fe.workflow.definition.Transition">
<name id="217">goto-next</name>
<source idref="201"/>
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
<target idref="61"/>
</item>
</sources>
<targets id="218" type="java.util.HashSet">
<item idref="59" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="31"/>
</item>
</sources>
<targets id="219" type="java.util.HashSet">
<item idref="29" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="8"/>
</item>
</sources>
<targets id="220" type="java.util.HashSet">
<item idref="6" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="2"/>
</item>
<item idref="216" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="221" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="222">Mizuho/Ratings/B3Ratings</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="223">user1</lastChangeUser>
<lastUpdate id="224">2025-07-25T11:44:22.000+0100</lastUpdate>
<name id="225">B3RealMessageProcessor</name>
<nodes id="226" type="java.util.HashSet">
<item idref="201" type="com.j2fe.workflow.definition.Node"/>
<item idref="8" type="com.j2fe.workflow.definition.Node"/>
<item idref="147" type="com.j2fe.workflow.definition.Node"/>
<item idref="106" type="com.j2fe.workflow.definition.Node"/>
<item idref="128" type="com.j2fe.workflow.definition.Node"/>
<item idref="2" type="com.j2fe.workflow.definition.Node"/>
<item idref="90" type="com.j2fe.workflow.definition.Node"/>
<item idref="31" type="com.j2fe.workflow.definition.Node"/>
<item idref="174" type="com.j2fe.workflow.definition.Node"/>
<item idref="163" type="com.j2fe.workflow.definition.Node"/>
<item idref="61" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>true</optimize>
<parameter id="227" type="java.util.HashMap">
<entry>
<key id="228" type="java.lang.String">JobID</key>
<value id="229" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="230">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="231" type="java.lang.String">realMsg</key>
<value id="232" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="233">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
</parameter>
<permissions id="234" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>true</purgeAtEnd>
<retries>1</retries>
<startNode idref="163"/>
<status>RELEASED</status>
<variables id="235" type="java.util.HashMap">
<entry>
<key id="236" type="java.lang.String">JobID</key>
<value id="237" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="238">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="239" type="java.lang.String">MessageType</key>
<value id="240" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="241">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="242" type="java.lang.String">REAL</value>
</value>
</entry>
<entry>
<key id="243" type="java.lang.String">loopCnt</key>
<value id="244" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="245">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<persistent>false</persistent>
<value id="246" type="java.lang.Integer">0</value>
</value>
</entry>
<entry>
<key id="247" type="java.lang.String">realMsg</key>
<value id="248" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="249">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
</variables>
<version>3</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
