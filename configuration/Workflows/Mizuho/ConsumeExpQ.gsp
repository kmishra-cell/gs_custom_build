<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.03">
<package-comment/>
<businessobject displayString="3 - V-10" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>true</alwaysPersist>
<clustered>false</clustered>
<comment id="1">V-10</comment>
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
<name id="11">Call Subworkflow</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="12">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="13" type="java.util.HashSet">
<item id="14" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="15">["DestinationFTP"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="16">input["DestinationFTP"]</name>
<stringValue id="17">Path</stringValue>
<type>VARIABLE</type>
</item>
<item id="18" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="19">["inputMgs"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="20">input["inputMgs"]</name>
<stringValue id="21">JMSTextMessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="22" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="23">name</name>
<stringValue id="24">MIZ_WF_WriteFile</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="25" type="java.util.HashSet">
<item id="26" type="com.j2fe.workflow.definition.Transition">
<name id="27">goto-next</name>
<source id="28">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="29"/>
<directJoin>false</directJoin>
<name id="30">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="31">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="32" type="java.util.HashSet"/>
<targets id="33" type="java.util.HashSet">
<item idref="26" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="9"/>
</item>
</sources>
<targets id="34" type="java.util.HashSet">
<item idref="7" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="2"/>
</item>
</sources>
<targets id="35" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="36">Mizuho</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="37">user1</lastChangeUser>
<lastUpdate id="38">2025-05-28T12:51:27.000+0100</lastUpdate>
<name id="39">ConsumeExpQ</name>
<nodes id="40" type="java.util.HashSet">
<item idref="9" type="com.j2fe.workflow.definition.Node"/>
<item idref="28" type="com.j2fe.workflow.definition.Node"/>
<item idref="2" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>false</optimize>
<parameter id="41" type="java.util.HashMap">
<entry>
<key id="42" type="java.lang.String">JMSByteMessage</key>
<value id="43" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="44">[B</className>
<clazz>[B</clazz>
<description id="45">If a byte message is set then this property contains the value.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="46" type="java.lang.String">JMSCorrelationID</key>
<value id="47" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="48">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="49">The Correlation ID is an ID supplied by the customer that identifies one or more related transactions throughout processing.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="50" type="java.lang.String">JMSDestinationName</key>
<value id="51" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="52">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="53">This property displays the JMS destination name.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="54" type="java.lang.String">JMSMessageID</key>
<value id="55" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="56">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="57">The Message ID contains a value that uniquely identifies each message sent by a JMS provider. The scope of its uniqueness depdends on your JMS system</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="58" type="java.lang.String">JMSMessages</key>
<value id="59" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="60">java.util.Map</className>
<clazz>java.util.Map</clazz>
<description id="61">If the JMS message type is MapMessage then this property contains the map of messages.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="62" type="java.lang.String">JMSObjectMessage</key>
<value id="63" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="64">java.lang.Object</className>
<clazz>java.lang.Object</clazz>
<description id="65">If the JMS message type is Object then this property contains the message.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="66" type="java.lang.String">JMSProperties</key>
<value id="67" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="68">java.util.Map</className>
<clazz>java.util.Map</clazz>
<description id="69">This property displays the JMS header properties.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="70" type="java.lang.String">JMSTextMessage</key>
<value id="71" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="72">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="73">If the JMS message type is Text then this property contains the message.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="74" type="java.lang.String">JMSTimestamp</key>
<value id="75" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="76">java.util.Date</className>
<clazz>java.util.Date</clazz>
<description id="77">This property displays the JMS timestamp.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="78" type="java.lang.String">JMSType</key>
<value id="79" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="80">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="81">This property defines the JMS type.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="82" type="java.lang.String">Path</key>
<value id="83" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="84">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="85" type="java.lang.String">metadata</key>
<value id="86" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="87">java.util.Map</className>
<clazz>java.util.Map</clazz>
<description id="88">Metadata for the event-instance.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="89" type="java.lang.String">name</key>
<value id="90" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="91">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="92">The name of the event-instance.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
</parameter>
<permissions id="93" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>false</purgeAtEnd>
<retries>0</retries>
<startNode idref="28"/>
<status>RELEASED</status>
<variables id="94" type="java.util.HashMap">
<entry>
<key id="95" type="java.lang.String">JMSByteMessage</key>
<value id="96" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="97">[B</className>
<clazz>[B</clazz>
<description id="98">If a byte message is set then this property contains the value.</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="99" type="java.lang.String">JMSCorrelationID</key>
<value id="100" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="101">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="102">The Correlation ID is an ID supplied by the customer that identifies one or more related transactions throughout processing.</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="103" type="java.lang.String">JMSDestinationName</key>
<value id="104" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="105">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="106">This property displays the JMS destination name.</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="107" type="java.lang.String">JMSMessageID</key>
<value id="108" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="109">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="110">The Message ID contains a value that uniquely identifies each message sent by a JMS provider. The scope of its uniqueness depdends on your JMS system</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="111" type="java.lang.String">JMSMessages</key>
<value id="112" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="113">java.util.Map</className>
<clazz>java.util.Map</clazz>
<description id="114">If the JMS message type is MapMessage then this property contains the map of messages.</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="115" type="java.lang.String">JMSObjectMessage</key>
<value id="116" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="117">java.lang.Object</className>
<clazz>java.lang.Object</clazz>
<description id="118">If the JMS message type is Object then this property contains the message.</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="119" type="java.lang.String">JMSProperties</key>
<value id="120" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="121">java.util.Map</className>
<clazz>java.util.Map</clazz>
<description id="122">This property displays the JMS header properties.</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="123" type="java.lang.String">JMSTextMessage</key>
<value id="124" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="125">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="126">If the JMS message type is Text then this property contains the message.</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="127" type="java.lang.String">JMSTimestamp</key>
<value id="128" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="129">java.util.Date</className>
<clazz>java.util.Date</clazz>
<description id="130">This property displays the JMS timestamp.</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="131" type="java.lang.String">JMSType</key>
<value id="132" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="133">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="134">This property defines the JMS type.</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="135" type="java.lang.String">Path</key>
<value id="136" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="137">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="138" type="java.lang.String">${gs.log.path}/../GS-QueueMsg/DLQ</value>
</value>
</entry>
<entry>
<key id="139" type="java.lang.String">metadata</key>
<value id="140" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="141">java.util.Map</className>
<clazz>java.util.Map</clazz>
<description id="142">Metadata for the event-instance.</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="143" type="java.lang.String">name</key>
<value id="144" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="145">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="146">The name of the event-instance.</description>
<persistent>false</persistent>
</value>
</entry>
</variables>
<version>3</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
