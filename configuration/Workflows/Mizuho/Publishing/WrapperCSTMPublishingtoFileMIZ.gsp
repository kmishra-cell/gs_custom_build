<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.07">
<package-comment/>
<businessobject displayString="4 - v10 - priority queue" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>false</alwaysPersist>
<clustered>false</clustered>
<comment id="1">v10 - priority queue</comment>
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
<stringValue id="17">CSTMPublishingtoFileMIZEvent</stringValue>
<type>CONSTANT</type>
</item>
<item id="18" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="19">["EntityId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="20">parameters["EntityId"]</name>
<stringValue id="21">EntityId</stringValue>
<type>VARIABLE</type>
</item>
<item id="22" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="23">["IssueQueue"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="24">parameters["IssueQueue"]</name>
<stringValue id="25">IssueQueue</stringValue>
<type>VARIABLE</type>
</item>
<item id="26" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="27">["IssuerQueue"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="28">parameters["IssuerQueue"]</name>
<stringValue id="29">IssuerQueue</stringValue>
<type>VARIABLE</type>
</item>
<item id="30" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="31">["JMSConFactory"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="32">parameters["JMSConFactory"]</name>
<stringValue id="33">JMSConFactory</stringValue>
<type>VARIABLE</type>
</item>
<item id="34" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="35">["LoopCounter"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="36">parameters["LoopCounter"]</name>
<stringValue id="37">LoopCounter</stringValue>
<type>VARIABLE</type>
</item>
<item id="38" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="39">["ModelID"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="40">parameters["ModelID"]</name>
<stringValue id="41">ModelID</stringValue>
<type>VARIABLE</type>
</item>
<item id="42" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="43">propertyFileLocation</name>
<stringValue id="44">db://resource/PublishingConfiguration/PublishingConfig.properties</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="45" type="java.util.HashSet">
<item id="46" type="com.j2fe.workflow.definition.Transition">
<name id="47">goto-next</name>
<source id="48">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="49"/>
<directJoin>false</directJoin>
<name id="50">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="51">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="52" type="java.util.HashSet"/>
<targets id="53" type="java.util.HashSet">
<item idref="46" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="10"/>
</item>
</sources>
<targets id="54" type="java.util.HashSet">
<item idref="8" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="3"/>
</item>
</sources>
<targets id="55" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="56">Mizuho/Publishing</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="57">user1</lastChangeUser>
<lastUpdate id="58">2025-11-06T17:43:46.000+0000</lastUpdate>
<name id="59">WrapperCSTMPublishingtoFileMIZ</name>
<nodes id="60" type="java.util.HashSet">
<item idref="10" type="com.j2fe.workflow.definition.Node"/>
<item idref="48" type="com.j2fe.workflow.definition.Node"/>
<item idref="3" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>true</optimize>
<parameter id="61" type="java.util.HashMap">
<entry>
<key id="62" type="java.lang.String">EntityId</key>
<value id="63" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="64">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="65"/>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="66" type="java.lang.String">ExtractionResult</key>
<value id="67" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="68">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="69"/>
<input>false</input>
<output>true</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="70" type="java.lang.String">IssueQueue</key>
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
<key id="74" type="java.lang.String">IssuerQueue</key>
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
<key id="78" type="java.lang.String">JMSConFactory</key>
<value id="79" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="80">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="81"/>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="82" type="java.lang.String">LoopCounter</key>
<value id="83" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="84">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="85"/>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="86" type="java.lang.String">ModelID</key>
<value id="87" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="88">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="89"/>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
</parameter>
<permissions id="90" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>true</purgeAtEnd>
<retries>0</retries>
<startNode idref="48"/>
<status>RELEASED</status>
<variables id="91" type="java.util.HashMap">
<entry>
<key id="92" type="java.lang.String">EntityId</key>
<value id="93" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="94">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="95"/>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="96" type="java.lang.String">ExtractionResult</key>
<value id="97" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="98">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="99"/>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="100" type="java.lang.String">IssueQueue</key>
<value id="101" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="102">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="103"/>
<persistent>false</persistent>
<value id="104" type="java.lang.String">jms/queue/securityPriority</value>
</value>
</entry>
<entry>
<key id="105" type="java.lang.String">IssuerQueue</key>
<value id="106" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="107">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="108"/>
<persistent>false</persistent>
<value id="109" type="java.lang.String">jms/queue/issuer</value>
</value>
</entry>
<entry>
<key id="110" type="java.lang.String">JMSConFactory</key>
<value id="111" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="112">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="113"/>
<persistent>false</persistent>
<value id="114" type="java.lang.String">jms/QueueConnection</value>
</value>
</entry>
<entry>
<key id="115" type="java.lang.String">LoopCounter</key>
<value id="116" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="117">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="118"/>
<persistent>false</persistent>
<value id="119" type="java.lang.Integer">0</value>
</value>
</entry>
<entry>
<key id="120" type="java.lang.String">ModelID</key>
<value id="121" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="122">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="123"/>
<persistent>false</persistent>
<value id="124" type="java.lang.String">ISSUPUB</value>
</value>
</entry>
</variables>
<version>4</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
