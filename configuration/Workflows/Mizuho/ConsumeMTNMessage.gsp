<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.04">
<package-comment/>
<businessobject displayString="16 - V-10 Raise remote events" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>false</alwaysPersist>
<clustered>true</clustered>
<comment id="1">V-10 Raise remote events</comment>
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
<name id="11">Remote Event Publishing</name>
<nodeHandler>com.j2fe.event.RaiseEventRemote</nodeHandler>
<nodeHandlerClass id="12">com.j2fe.event.RaiseEventRemote</nodeHandlerClass>
<parameters id="13" type="java.util.HashSet">
<item id="14" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="15">eventName</name>
<stringValue id="16">MizPublishForTxn_Event</stringValue>
<type>CONSTANT</type>
</item>
<item id="17" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="18">["transactionId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="19">parameters["transactionId"]</name>
<stringValue id="20">trid</stringValue>
<type>VARIABLE</type>
</item>
<item id="21" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="22">propertyFileLocation</name>
<stringValue id="23">db://resource/PublishingConfiguration/PublishingConfig.properties</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="24" type="java.util.HashSet">
<item id="25" type="com.j2fe.workflow.definition.Transition">
<name id="26">rows-found</name>
<source id="27">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="28"/>
<directJoin>false</directJoin>
<name id="29">Get TRN_ID</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="30">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="31" type="java.util.HashSet">
<item id="32" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="33">database</name>
<stringValue id="34">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="35" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="36">firstColumnsResult[0]</name>
<stringValue id="37">trid</stringValue>
<type>VARIABLE</type>
</item>
<item id="38" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="39">indexedParameters[0]</name>
<stringValue id="40">JobId</stringValue>
<type>VARIABLE</type>
</item>
<item id="41" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="42">querySQL</name>
<stringValue id="43">GetTridQuery</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="44" type="java.util.HashSet">
<item id="45" type="com.j2fe.workflow.definition.Transition">
<name id="46">goto-next</name>
<source id="47">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="48"/>
<directJoin>false</directJoin>
<name id="49">Process File</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="50">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="51" type="java.util.HashSet">
<item id="52" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="53">["File"]@java/net/URI@</UITypeHint>
<input>true</input>
<name id="54">input["File"]</name>
<stringValue id="55">filename</stringValue>
<type>VARIABLE</type>
</item>
<item id="56" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="57">["MessageType"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="58">input["MessageType"]</name>
<stringValue id="59">MessageType</stringValue>
<type>VARIABLE</type>
</item>
<item id="60" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="61">["OutputDirectory"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="62">input["OutputDirectory"]</name>
<stringValue id="63">output</stringValue>
<type>VARIABLE</type>
</item>
<item id="64" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="65">["ParallelBranches"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="66">input["ParallelBranches"]</name>
<objectValue id="67" type="java.lang.Integer">2</objectValue>
<type>CONSTANT</type>
</item>
<item id="68" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="69">["SuccessAction"]@com/j2fe/feeds/SuccessAction@</UITypeHint>
<input>true</input>
<name id="70">input["SuccessAction"]</name>
<objectValue id="71" type="com.j2fe.feeds.SuccessAction">MOVE</objectValue>
<type>CONSTANT</type>
</item>
<item id="72" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="73">name</name>
<stringValue id="74">Standard File Load</stringValue>
<type>CONSTANT</type>
</item>
<item id="75" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="76">["JobId"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="77">output["JobId"]</name>
<stringValue id="78">JobId</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="79" type="java.util.HashSet">
<item id="80" type="com.j2fe.workflow.definition.Transition">
<name id="81">goto-next</name>
<source id="82">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="83"/>
<directJoin>false</directJoin>
<name id="84">Create File Name</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="85">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="86" type="java.util.HashSet">
<item id="87" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="88">statements</name>
<stringValue id="89">String filename = "file:" + filepath + "/" + basename;&#13;
</stringValue>
<type>CONSTANT</type>
</item>
<item id="90" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="91">["basename"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="92">variables["basename"]</name>
<stringValue id="93">filename</stringValue>
<type>VARIABLE</type>
</item>
<item id="94" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="95">["filename"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="96">variables["filename"]</name>
<stringValue id="97">filename</stringValue>
<type>VARIABLE</type>
</item>
<item id="98" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="99">["filepath"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="100">variables["filepath"]</name>
<stringValue id="101">input</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="102" type="java.util.HashSet">
<item id="103" type="com.j2fe.workflow.definition.Transition">
<name id="104">goto-next</name>
<source id="105">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="106"/>
<directJoin>false</directJoin>
<name id="107">Call Subworkflow</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="108">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="109" type="java.util.HashSet">
<item id="110" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="111">["BaseName"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="112">input["BaseName"]</name>
<stringValue id="113">BaseName</stringValue>
<type>VARIABLE</type>
</item>
<item id="114" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="115">["DestinationFTP"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="116">input["DestinationFTP"]</name>
<stringValue id="117">input</stringValue>
<type>VARIABLE</type>
</item>
<item id="118" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="119">["inputMgs"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="120">input["inputMgs"]</name>
<stringValue id="121">JMSTextMessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="122" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="123">name</name>
<stringValue id="124">WriteFile</stringValue>
<type>CONSTANT</type>
</item>
<item id="125" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="126">output["filename"]</name>
<stringValue id="127">filename</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="128" type="java.util.HashSet">
<item id="129" type="com.j2fe.workflow.definition.Transition">
<name id="130">goto-next</name>
<source id="131">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="132"/>
<directJoin>false</directJoin>
<name id="133">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="134">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="135" type="java.util.HashSet"/>
<targets id="136" type="java.util.HashSet">
<item idref="129" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="105"/>
</item>
</sources>
<targets id="137" type="java.util.HashSet">
<item idref="103" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="82"/>
</item>
</sources>
<targets id="138" type="java.util.HashSet">
<item idref="80" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="47"/>
</item>
</sources>
<targets id="139" type="java.util.HashSet">
<item idref="45" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="27"/>
</item>
</sources>
<targets id="140" type="java.util.HashSet">
<item id="141" type="com.j2fe.workflow.definition.Transition">
<name id="142">nothing-found</name>
<source idref="27"/>
<target idref="2"/>
</item>
<item idref="25" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="9"/>
</item>
</sources>
<targets id="143" type="java.util.HashSet">
<item idref="7" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="2"/>
</item>
<item idref="141" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="144" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="145">Mizuho</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="146">user1</lastChangeUser>
<lastUpdate id="147">2025-10-18T14:37:57.000+0100</lastUpdate>
<name id="148">ConsumeMTNMessage</name>
<nodes id="149" type="java.util.HashSet">
<item idref="105" type="com.j2fe.workflow.definition.Node"/>
<item idref="82" type="com.j2fe.workflow.definition.Node"/>
<item idref="27" type="com.j2fe.workflow.definition.Node"/>
<item idref="47" type="com.j2fe.workflow.definition.Node"/>
<item idref="9" type="com.j2fe.workflow.definition.Node"/>
<item idref="131" type="com.j2fe.workflow.definition.Node"/>
<item idref="2" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>false</optimize>
<parameter id="150" type="java.util.HashMap">
<entry>
<key id="151" type="java.lang.String">BaseName</key>
<value id="152" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="153">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="154" type="java.lang.String">GetTridQuery</key>
<value id="155" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="156">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="157" type="java.lang.String">JMSTextMessage</key>
<value id="158" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="159">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="160">If the JMS message type is Text then this property contains the message.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="161" type="java.lang.String">MessageType</key>
<value id="162" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="163">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="164" type="java.lang.String">filename</key>
<value id="165" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="166">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="167" type="java.lang.String">input</key>
<value id="168" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="169">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="170" type="java.lang.String">output</key>
<value id="171" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="172">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
</parameter>
<permissions id="173" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>true</purgeAtEnd>
<retries>0</retries>
<startNode idref="131"/>
<status>RELEASED</status>
<variables id="174" type="java.util.HashMap">
<entry>
<key id="175" type="java.lang.String">BaseName</key>
<value id="176" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="177">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="178" type="java.lang.String">MTN</value>
</value>
</entry>
<entry>
<key id="179" type="java.lang.String">GetTridQuery</key>
<value id="180" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="181">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="182" type="java.lang.String">select trn_id from fT_t_trid where job_id = ?</value>
</value>
</entry>
<entry>
<key id="183" type="java.lang.String">JMSTextMessage</key>
<value id="184" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="185">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="186">If the JMS message type is Text then this property contains the message.</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="187" type="java.lang.String">MessageType</key>
<value id="188" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="189">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>true</persistent>
<value id="190" type="java.lang.String">MTNASSETUNVALIDATED</value>
</value>
</entry>
<entry>
<key id="191" type="java.lang.String">filename</key>
<value id="192" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="193">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="194" type="java.lang.String">input</key>
<value id="195" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="196">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="197" type="java.lang.String">${gs.bin.path}/../GS-QueueMsg/MTN/input</value>
</value>
</entry>
<entry>
<key id="198" type="java.lang.String">output</key>
<value id="199" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="200">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="201" type="java.lang.String">${gs.bin.path}/../GS-QueueMsg/MTN/output</value>
</value>
</entry>
</variables>
<version>16</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
