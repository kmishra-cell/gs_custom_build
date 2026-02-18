<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.09">
<package-comment/>
<businessobject displayString="8 - v10 - Yield Curve flag" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>false</alwaysPersist>
<clustered>false</clustered>
<comment id="1">v10 - Yield Curve flag</comment>
<endNode id="2">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="3">Stop</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="4">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="5" type="java.util.HashSet">
<item id="6" type="com.j2fe.workflow.definition.Transition">
<name id="7">goto-next</name>
<source id="8">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="9">BBPerSec</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="10">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="11" type="java.util.HashSet">
<item id="12" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="13">["BatchDescription"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="14">input["BatchDescription"]</name>
<stringValue id="15">BatchDescription</stringValue>
<type>VARIABLE</type>
</item>
<item id="16" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="17">["Message"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="18">input["Message"]</name>
<stringValue id="19">Message</stringValue>
<type>VARIABLE</type>
</item>
<item id="20" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="21">["Scheduled"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="22">input["Scheduled"]</name>
<objectValue id="23" type="java.lang.String">YC</objectValue>
<type>CONSTANT</type>
</item>
<item id="24" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="25">name</name>
<stringValue id="26">BBPerSecurityBatch</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="27" type="java.util.HashSet">
<item id="28" type="com.j2fe.workflow.definition.Transition">
<name id="29">rows-found</name>
<source id="30">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="31">Get Yield Curves</name>
<nodeHandler>com.j2fe.general.activities.database.XMLQuery</nodeHandler>
<nodeHandlerClass id="32">com.j2fe.general.activities.database.XMLQuery</nodeHandlerClass>
<parameters id="33" type="java.util.HashSet">
<item id="34" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="35">database</name>
<stringValue id="36">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="37" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="38">queryName</name>
<stringValue id="39">BBPerSecYieldCurve</stringValue>
<type>CONSTANT</type>
</item>
<item id="40" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="41">result[0]</name>
<stringValue id="42">Message</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="43" type="java.util.HashSet">
<item id="44" type="com.j2fe.workflow.definition.Transition">
<name id="45">goto-next</name>
<source id="46">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="47">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="48">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="49" type="java.util.HashSet"/>
<targets id="50" type="java.util.HashSet">
<item idref="44" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="30"/>
</item>
</sources>
<targets id="51" type="java.util.HashSet">
<item id="52" type="com.j2fe.workflow.definition.Transition">
<name id="53">nothing-found</name>
<source idref="30"/>
<target idref="2"/>
</item>
<item idref="28" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="8"/>
</item>
</sources>
<targets id="54" type="java.util.HashSet">
<item idref="6" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="2"/>
</item>
<item idref="52" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="55" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="56">Custom/Dataloads</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="57">user1</lastChangeUser>
<lastUpdate id="58">2025-11-12T14:38:46.000+0000</lastUpdate>
<name id="59">BBPerSecurityYieldCurve</name>
<nodes id="60" type="java.util.HashSet">
<item idref="8" type="com.j2fe.workflow.definition.Node"/>
<item idref="30" type="com.j2fe.workflow.definition.Node"/>
<item idref="46" type="com.j2fe.workflow.definition.Node"/>
<item idref="2" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>true</optimize>
<parameter id="61" type="java.util.HashMap">
<entry>
<key id="62" type="java.lang.String">BatchDescription</key>
<value id="63" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="64">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="65">description of Per security batch</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
</parameter>
<permissions id="66" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>false</purgeAtEnd>
<retries>0</retries>
<startNode idref="46"/>
<status>RELEASED</status>
<variables id="67" type="java.util.HashMap">
<entry>
<key id="68" type="java.lang.String">BatchDescription</key>
<value id="69" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="70">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="71">description of Per security batch</description>
<persistent>false</persistent>
</value>
</entry>
</variables>
<version>8</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
