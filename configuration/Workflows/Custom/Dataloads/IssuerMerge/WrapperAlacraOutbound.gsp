<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.09">
<package-comment/>
<businessobject displayString="6 - V-10" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>false</alwaysPersist>
<clustered>false</clustered>
<comment id="1">V-10</comment>
<description id="2">To Create a pass the Parent Job id to the sub workflow.</description>
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
<name id="12">Close Job</name>
<nodeHandler>com.j2fe.streetlamp.activities.CloseJob</nodeHandler>
<nodeHandlerClass id="13">com.j2fe.streetlamp.activities.CloseJob</nodeHandlerClass>
<parameters id="14" type="java.util.HashSet">
<item id="15" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="16">jobId</name>
<stringValue id="17">ParentJobID</stringValue>
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
<name id="23">Consolidate Job</name>
<nodeHandler>com.j2fe.streetlamp.activities.ConsolidateJob</nodeHandler>
<nodeHandlerClass id="24">com.j2fe.streetlamp.activities.ConsolidateJob</nodeHandlerClass>
<parameters id="25" type="java.util.HashSet">
<item id="26" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="27">jobId</name>
<stringValue id="28">ParentJobID</stringValue>
<type>VARIABLE</type>
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
<name id="34">Call Subworkflow</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="35">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="36" type="java.util.HashSet">
<item id="37" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="38">["AlacraOutboundFileDirectory"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="39">input["AlacraOutboundFileDirectory"]</name>
<stringValue id="40">AlacraOutboundFileDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="41" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="42">["BaseFileName"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="43">input["BaseFileName"]</name>
<stringValue id="44">BaseFileName</stringValue>
<type>VARIABLE</type>
</item>
<item id="45" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="46">["ParentJobID"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="47">input["ParentJobID"]</name>
<stringValue id="48">ParentJobID</stringValue>
<type>VARIABLE</type>
</item>
<item id="49" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="50">name</name>
<stringValue id="51">AlacraOutbound</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="52" type="java.util.HashSet">
<item id="53" type="com.j2fe.workflow.definition.Transition">
<name id="54">goto-next</name>
<source id="55">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="56"/>
<directJoin>false</directJoin>
<name id="57">Create Parent Job Id</name>
<nodeHandler>com.j2fe.streetlamp.activities.CreateJob</nodeHandler>
<nodeHandlerClass id="58">com.j2fe.streetlamp.activities.CreateJob</nodeHandlerClass>
<parameters id="59" type="java.util.HashSet">
<item id="60" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="61">configInfo</name>
<stringValue id="62">WrapperAlacraOutbound</stringValue>
<type>CONSTANT</type>
</item>
<item id="63" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="64">jobId</name>
<stringValue id="65">ParentJobID</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="66" type="java.util.HashSet">
<item id="67" type="com.j2fe.workflow.definition.Transition">
<name id="68">goto-next</name>
<source id="69">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="70"/>
<directJoin>false</directJoin>
<name id="71">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="72">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="73" type="java.util.HashSet"/>
<targets id="74" type="java.util.HashSet">
<item idref="67" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="55"/>
</item>
</sources>
<targets id="75" type="java.util.HashSet">
<item idref="53" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="32"/>
</item>
</sources>
<targets id="76" type="java.util.HashSet">
<item idref="30" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="21"/>
</item>
</sources>
<targets id="77" type="java.util.HashSet">
<item idref="19" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="10"/>
</item>
</sources>
<targets id="78" type="java.util.HashSet">
<item idref="8" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="3"/>
</item>
</sources>
<targets id="79" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="80">Custom/Dataloads/IssuerMerge</group>
<haltOnError>true</haltOnError>
<lastChangeUser id="81">user1</lastChangeUser>
<lastUpdate id="82">2025-07-03T15:58:04.000+0100</lastUpdate>
<name id="83">WrapperAlacraOutbound</name>
<nodes id="84" type="java.util.HashSet">
<item idref="32" type="com.j2fe.workflow.definition.Node"/>
<item idref="10" type="com.j2fe.workflow.definition.Node"/>
<item idref="21" type="com.j2fe.workflow.definition.Node"/>
<item idref="55" type="com.j2fe.workflow.definition.Node"/>
<item idref="69" type="com.j2fe.workflow.definition.Node"/>
<item idref="3" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>true</optimize>
<parameter id="85" type="java.util.HashMap">
<entry>
<key id="86" type="java.lang.String">AlacraOutboundFileDirectory</key>
<value id="87" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="88">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="89"/>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="90" type="java.lang.String">BaseFileName</key>
<value id="91" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="92">java.lang.String</className>
<clazz>java.lang.String</clazz>
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
<startNode idref="69"/>
<status>RELEASED</status>
<variables id="94" type="java.util.HashMap">
<entry>
<key id="95" type="java.lang.String">AlacraOutboundFileDirectory</key>
<value id="96" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="97">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="98"/>
<persistent>false</persistent>
<value id="99" type="java.lang.String">/gold/app/AlacraOutbound</value>
</value>
</entry>
<entry>
<key id="100" type="java.lang.String">BaseFileName</key>
<value id="101" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="102">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="103" type="java.lang.String">Alacra_DeDup_File</value>
</value>
</entry>
</variables>
<version>6</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
