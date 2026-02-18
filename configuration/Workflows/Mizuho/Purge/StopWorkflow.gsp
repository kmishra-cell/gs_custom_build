<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.03">
<package-comment/>
<businessobject displayString="4 - V-10" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>false</alwaysPersist>
<clustered>true</clustered>
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
<name id="11">Stop Workflow</name>
<nodeHandler>com.j2fe.general.activities.StopWorkflow</nodeHandler>
<nodeHandlerClass id="12">com.j2fe.general.activities.StopWorkflow</nodeHandlerClass>
<parameters id="13" type="java.util.HashSet">
<item id="14" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="15">instanceIdList</name>
<stringValue id="16">WorkflowInstanceId</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="17" type="java.util.HashSet">
<item id="18" type="com.j2fe.workflow.definition.Transition">
<name id="19">goto-next</name>
<source id="20">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="21"/>
<directJoin>false</directJoin>
<name id="22">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="23">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="24" type="java.util.HashSet"/>
<targets id="25" type="java.util.HashSet">
<item idref="18" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="9"/>
</item>
</sources>
<targets id="26" type="java.util.HashSet">
<item idref="7" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="2"/>
</item>
</sources>
<targets id="27" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="28">Mizuho/Purge</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="29">user1</lastChangeUser>
<lastUpdate id="30">2025-05-19T05:19:59.000+0100</lastUpdate>
<name id="31">StopWorkflow</name>
<nodes id="32" type="java.util.HashSet">
<item idref="20" type="com.j2fe.workflow.definition.Node"/>
<item idref="2" type="com.j2fe.workflow.definition.Node"/>
<item idref="9" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>true</optimize>
<parameter id="33" type="java.util.HashMap">
<entry>
<key id="34" type="java.lang.String">WorkflowInstanceId</key>
<value id="35" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="36">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="37">The instance Id of a workflow</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
</parameter>
<permissions id="38" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>true</purgeAtEnd>
<retries>0</retries>
<startNode idref="20"/>
<status>RELEASED</status>
<variables id="39" type="java.util.HashMap">
<entry>
<key id="40" type="java.lang.String">WorkflowInstanceId</key>
<value id="41" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="42">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="43">The instance Id of a workflow</description>
<persistent>false</persistent>
</value>
</entry>
</variables>
<version>4</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
