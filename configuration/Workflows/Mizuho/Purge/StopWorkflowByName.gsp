<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.03">
<package-comment/>
<businessobject displayString="3 - V-10" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>false</alwaysPersist>
<clustered>true</clustered>
<comment id="1">V-10</comment>
<description id="2">Stops workflows matching workflow name.&#13;
Use with Caution!</description>
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
<name id="12">Stop Workflow</name>
<nodeHandler>com.j2fe.general.activities.StopWorkflow</nodeHandler>
<nodeHandlerClass id="13">com.j2fe.general.activities.StopWorkflow</nodeHandlerClass>
<parameters id="14" type="java.util.HashSet">
<item id="15" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="16">workflowName</name>
<stringValue id="17">WorkflowName</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="18" type="java.util.HashSet">
<item id="19" type="com.j2fe.workflow.definition.Transition">
<name id="20">goto-next</name>
<source id="21">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="22"/>
<directJoin>false</directJoin>
<name id="23">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="24">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="25" type="java.util.HashSet"/>
<targets id="26" type="java.util.HashSet">
<item idref="19" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="10"/>
</item>
</sources>
<targets id="27" type="java.util.HashSet">
<item idref="8" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="3"/>
</item>
</sources>
<targets id="28" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="29">Mizuho/Purge</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="30">user1</lastChangeUser>
<lastUpdate id="31">2025-05-18T12:04:25.000+0100</lastUpdate>
<name id="32">StopWorkflowByName</name>
<nodes id="33" type="java.util.HashSet">
<item idref="21" type="com.j2fe.workflow.definition.Node"/>
<item idref="3" type="com.j2fe.workflow.definition.Node"/>
<item idref="10" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>true</optimize>
<parameter id="34" type="java.util.HashMap">
<entry>
<key id="35" type="java.lang.String">WorkflowName</key>
<value id="36" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="37">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="38">The name of the workflow to stop.&#13;
All instances of workflows with this name will be stopped</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
</parameter>
<permissions id="39" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>false</purgeAtEnd>
<retries>0</retries>
<startNode idref="21"/>
<status>RELEASED</status>
<variables id="40" type="java.util.HashMap">
<entry>
<key id="41" type="java.lang.String">WorkflowName</key>
<value id="42" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="43">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="44">The name of the workflow to stop.&#13;
All instances of workflows with this name will be stopped</description>
<persistent>false</persistent>
</value>
</entry>
</variables>
<version>3</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
