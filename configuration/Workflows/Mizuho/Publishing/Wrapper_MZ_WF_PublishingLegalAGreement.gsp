<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.07">
<package-comment/>
<businessobject displayString="2 - v10" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>false</alwaysPersist>
<clustered>true</clustered>
<comment id="1">v10</comment>
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
<stringValue id="17">MZ_WF_PublishingLegalAgreement_Event</stringValue>
<type>CONSTANT</type>
</item>
<item id="18" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="19">["DestinationFtp"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="20">parameters["DestinationFtp"]</name>
<stringValue id="21">DestinationFtp</stringValue>
<type>VARIABLE</type>
</item>
<item id="22" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="23">["JMSConnFactory"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="24">parameters["JMSConnFactory"]</name>
<stringValue id="25">JMSConnFactory</stringValue>
<type>VARIABLE</type>
</item>
<item id="26" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="27">["JMSQueueName"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="28">parameters["JMSQueueName"]</name>
<stringValue id="29">JMSQueueName</stringValue>
<type>VARIABLE</type>
</item>
<item id="30" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="31">["LegalAgrCrossRefId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="32">parameters["LegalAgrCrossRefId"]</name>
<stringValue id="33">LegalAgrCrossRefId</stringValue>
<type>VARIABLE</type>
</item>
<item id="34" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="35">["ModelID"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="36">parameters["ModelID"]</name>
<stringValue id="37">ModelID</stringValue>
<type>VARIABLE</type>
</item>
<item id="38" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="39">propertyFileLocation</name>
<stringValue id="40">db://resource/PublishingConfiguration/PublishingConfig.properties</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="41" type="java.util.HashSet">
<item id="42" type="com.j2fe.workflow.definition.Transition">
<name id="43">goto-next</name>
<source id="44">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="45"/>
<directJoin>false</directJoin>
<name id="46">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="47">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="48" type="java.util.HashSet"/>
<targets id="49" type="java.util.HashSet">
<item idref="42" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="10"/>
</item>
</sources>
<targets id="50" type="java.util.HashSet">
<item idref="8" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="3"/>
</item>
</sources>
<targets id="51" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="52">Mizuho/Publishing</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="53">user1</lastChangeUser>
<lastUpdate id="54">2025-10-19T22:16:27.000+0100</lastUpdate>
<name id="55">Wrapper_MZ_WF_PublishingLegalAGreement</name>
<nodes id="56" type="java.util.HashSet">
<item idref="10" type="com.j2fe.workflow.definition.Node"/>
<item idref="44" type="com.j2fe.workflow.definition.Node"/>
<item idref="3" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>true</optimize>
<parameter id="57" type="java.util.HashMap">
<entry>
<key id="58" type="java.lang.String">DestinationFtp</key>
<value id="59" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="60">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="61"/>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="62" type="java.lang.String">ExtractionResult</key>
<value id="63" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="64">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="65"/>
<input>false</input>
<output>true</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="66" type="java.lang.String">JMSConnFactory</key>
<value id="67" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="68">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="69"/>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="70" type="java.lang.String">JMSQueueName</key>
<value id="71" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="72">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="73"/>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="74" type="java.lang.String">LegalAgrCrossRefId</key>
<value id="75" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="76">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="77"/>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="78" type="java.lang.String">ModelID</key>
<value id="79" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="80">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="81"/>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
</parameter>
<permissions id="82" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>true</purgeAtEnd>
<retries>0</retries>
<startNode idref="44"/>
<status>RELEASED</status>
<variables id="83" type="java.util.HashMap">
<entry>
<key id="84" type="java.lang.String">DestinationFtp</key>
<value id="85" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="86">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="87"/>
<persistent>false</persistent>
<value id="88" type="java.lang.String">${gs.bin.path}/../MZPUB</value>
</value>
</entry>
<entry>
<key id="89" type="java.lang.String">ExtractionResult</key>
<value id="90" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="91">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="92"/>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="93" type="java.lang.String">JMSConnFactory</key>
<value id="94" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="95">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="96"/>
<persistent>false</persistent>
<value id="97" type="java.lang.String">jms/QueueConnection</value>
</value>
</entry>
<entry>
<key id="98" type="java.lang.String">JMSQueueName</key>
<value id="99" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="100">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="101"/>
<persistent>false</persistent>
<value id="102" type="java.lang.String">jms/queue/legalAgreement</value>
</value>
</entry>
<entry>
<key id="103" type="java.lang.String">LegalAgrCrossRefId</key>
<value id="104" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="105">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="106"/>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="107" type="java.lang.String">ModelID</key>
<value id="108" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="109">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="110"/>
<persistent>false</persistent>
<value id="111" type="java.lang.String">LAGR_PUB</value>
</value>
</entry>
</variables>
<version>2</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
