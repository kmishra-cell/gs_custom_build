<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.09">
<package-comment/>
<businessobject displayString="4 - V-10" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>true</alwaysPersist>
<clustered>true</clustered>
<comment id="1">V-10</comment>
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
<name id="12">Raise Event Remote #1</name>
<nodeHandler>com.j2fe.event.RaiseEventRemote</nodeHandler>
<nodeHandlerClass id="13">com.j2fe.event.RaiseEventRemote</nodeHandlerClass>
<parameters id="14" type="java.util.HashSet">
<item id="15" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="16">eventName</name>
<stringValue id="17">PublishTxnEvent</stringValue>
<type>CONSTANT</type>
</item>
<item id="18" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="19">["No. Of Parallel Branches"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="20">parameters["No. Of Parallel Branches"]</name>
<objectValue id="21" type="java.lang.Integer">20</objectValue>
<type>CONSTANT</type>
</item>
<item id="22" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="23">["transactionId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="24">parameters["transactionId"]</name>
<stringValue id="25">TransactionId</stringValue>
<type>VARIABLE</type>
</item>
<item id="26" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="27">propertyFileLocation</name>
<stringValue id="28">db://resource/PublishingConfiguration/PublishingConfig.properties</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="29" type="java.util.HashSet">
<item id="30" type="com.j2fe.workflow.definition.Transition">
<name id="31">goto-next</name>
<source id="32">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="33"/>
<directJoin>false</directJoin>
<name id="34">Call Workstation W/F</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="35">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="36" type="java.util.HashSet">
<item id="37" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="38">["Database"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="39">input["Database"]</name>
<stringValue id="40">filesystem/local/user</stringValue>
<type>REFERENCE</type>
</item>
<item id="41" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="42">["IsWorkstationMessage"]@java/lang/Boolean@</UITypeHint>
<input>true</input>
<name id="43">input["IsWorkstationMessage"]</name>
<objectValue id="44" type="java.lang.Boolean">true</objectValue>
<type>CONSTANT</type>
</item>
<item id="45" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="46">["MessageType"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="47">input["MessageType"]</name>
<objectValue id="48" type="java.lang.String">SD</objectValue>
<type>CONSTANT</type>
</item>
<item id="49" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="50">["Messages"]@[Ljava/lang/String;@</UITypeHint>
<input>true</input>
<name id="51">input["Messages"]</name>
<stringValue id="52">Messages</stringValue>
<type>VARIABLE</type>
<variablePart id="53">[0]</variablePart>
</item>
<item id="54" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="55">name</name>
<stringValue id="56">Workstation Workflow</stringValue>
<type>CONSTANT</type>
</item>
<item id="57" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="58">output["Result"]</name>
<stringValue id="59">Result</stringValue>
<type>VARIABLE</type>
</item>
<item id="60" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="61">output["TransactionId"]</name>
<stringValue id="62">TransactionId</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="63" type="java.util.HashSet">
<item id="64" type="com.j2fe.workflow.definition.Transition">
<name id="65">goto-next</name>
<source id="66">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="67"/>
<directJoin>false</directJoin>
<name id="68">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="69">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="70" type="java.util.HashSet"/>
<targets id="71" type="java.util.HashSet">
<item idref="64" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="32"/>
</item>
</sources>
<targets id="72" type="java.util.HashSet">
<item idref="30" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="10"/>
</item>
</sources>
<targets id="73" type="java.util.HashSet">
<item idref="8" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="3"/>
</item>
</sources>
<targets id="74" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="75">Mizuho</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="76">user1</lastChangeUser>
<lastUpdate id="77">2025-10-11T16:39:24.000+0100</lastUpdate>
<name id="78">WrapperWorkstationPublishTxn</name>
<nodes id="79" type="java.util.HashSet">
<item idref="32" type="com.j2fe.workflow.definition.Node"/>
<item idref="10" type="com.j2fe.workflow.definition.Node"/>
<item idref="66" type="com.j2fe.workflow.definition.Node"/>
<item idref="3" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>false</optimize>
<parameter id="80" type="java.util.HashMap">
<entry>
<key id="81" type="java.lang.String">Messages</key>
<value id="82" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="83">[Ljava.lang.String;</className>
<clazz>[Ljava.lang.String;</clazz>
<description id="84"/>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="85" type="java.lang.String">Result</key>
<value id="86" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="87">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="88"/>
<input>false</input>
<output>true</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="89" type="java.lang.String">TransactionId</key>
<value id="90" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="91">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="92"/>
<input>false</input>
<output>true</output>
<required>false</required>
</value>
</entry>
</parameter>
<permissions id="93" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>false</purgeAtEnd>
<retries>0</retries>
<startNode idref="66"/>
<status>RELEASED</status>
<variables id="94" type="java.util.HashMap">
<entry>
<key id="95" type="java.lang.String">Messages</key>
<value id="96" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="97">[Ljava.lang.String;</className>
<clazz>[Ljava.lang.String;</clazz>
<description id="98"/>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="99" type="java.lang.String">Result</key>
<value id="100" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="101">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="102"/>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="103" type="java.lang.String">TransactionId</key>
<value id="104" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="105">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="106"/>
<persistent>false</persistent>
</value>
</entry>
</variables>
<version>4</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
