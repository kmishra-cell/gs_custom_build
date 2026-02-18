<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.03">
<package-comment/>
<businessobject displayString="4 - V10" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>true</alwaysPersist>
<clustered>false</clustered>
<comment id="1">V10</comment>
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
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="10"/>
<directJoin>false</directJoin>
<name id="11">release db lock</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="12">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="13" type="java.util.HashSet">
<item id="14" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="15">database</name>
<stringValue id="16">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="17" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="18">indexedParameters[0]</name>
<stringValue id="19">lockJobId</stringValue>
<type>VARIABLE</type>
</item>
<item id="20" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="21">indexedParameters[1]</name>
<stringValue id="22">lockJobId</stringValue>
<type>VARIABLE</type>
</item>
<item id="23" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="24">querySQL</name>
<stringValue id="25">delete from CMFSOIADDITION_LOCK where KEYS = CAST(? AS VARCHAR)&#13;
and exists (SELECT 1 FROM CMFSOIADDITION_LOCK where KEYS = CAST(? AS VARCHAR));</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="26" type="java.util.HashSet">
<item id="27" type="com.j2fe.workflow.definition.Transition">
<name id="28">goto-next</name>
<source id="29">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="30"/>
<directJoin>false</directJoin>
<name id="31">log request unlock</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="32">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="33" type="java.util.HashSet">
<item id="34" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="35">database</name>
<stringValue id="36">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="37" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="38">indexedParameters[0]</name>
<stringValue id="39">lockJobId</stringValue>
<type>VARIABLE</type>
</item>
<item id="40" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="41">[1]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="42">indexedParameters[1]</name>
<stringValue id="43">lockJobId</stringValue>
<type>VARIABLE</type>
</item>
<item id="44" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="45">querySQL</name>
<stringValue id="46">call mhi_sp_eventlog (&#13;
	  'cmfSOIAdditionLock',&#13;
	  'request unlock for inventory ',&#13;
	  CAST(? AS VARCHAR),&#13;
	  CAST(? AS VARCHAR)&#13;
	); </stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="47" type="java.util.HashSet">
<item id="48" type="com.j2fe.workflow.definition.Transition">
<name id="49">goto-next</name>
<source id="50">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="51"/>
<directJoin>false</directJoin>
<name id="52">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="53">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="54" type="java.util.HashSet"/>
<targets id="55" type="java.util.HashSet">
<item idref="48" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="29"/>
</item>
</sources>
<targets id="56" type="java.util.HashSet">
<item idref="27" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="9"/>
</item>
</sources>
<targets id="57" type="java.util.HashSet">
<item idref="7" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="2"/>
</item>
</sources>
<targets id="58" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="59">Mizuho</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="60">user1</lastChangeUser>
<lastUpdate id="61">2025-07-04T06:57:01.000+0100</lastUpdate>
<name id="62">cmfSOIAdditionUnlockWrapper</name>
<nodes id="63" type="java.util.HashSet">
<item idref="50" type="com.j2fe.workflow.definition.Node"/>
<item idref="2" type="com.j2fe.workflow.definition.Node"/>
<item idref="29" type="com.j2fe.workflow.definition.Node"/>
<item idref="9" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>false</optimize>
<parameter id="64" type="java.util.HashMap">
<entry>
<key id="65" type="java.lang.String">lockJobId</key>
<value id="66" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="67">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
</parameter>
<permissions id="68" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>false</purgeAtEnd>
<retries>0</retries>
<startNode idref="50"/>
<status>RELEASED</status>
<variables id="69" type="java.util.HashMap">
<entry>
<key id="70" type="java.lang.String">lockJobId</key>
<value id="71" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="72">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
</variables>
<version>4</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
