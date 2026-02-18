<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.03">
<package-comment/>
<businessobject displayString="3 - V-10" type="com.j2fe.workflow.definition.Workflow">
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
<name id="11">Shrink FT_WF_TOKN</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="12">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="13" type="java.util.HashSet">
<item id="14" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="15">["Table"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="16">input["Table"]</name>
<stringValue id="17">FT_WF_TOKN</stringValue>
<type>CONSTANT</type>
</item>
<item id="18" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="19">name</name>
<stringValue id="20">Shrink</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="21" type="java.util.HashSet">
<item id="22" type="com.j2fe.workflow.definition.Transition">
<name id="23">goto-next</name>
<source id="24">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="25"/>
<directJoin>false</directJoin>
<name id="26">Shrink FT_WF_WFTI</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="27">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="28" type="java.util.HashSet">
<item id="29" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="30">["Table"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="31">input["Table"]</name>
<stringValue id="32">FT_WF_WFTI</stringValue>
<type>CONSTANT</type>
</item>
<item id="33" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="34">name</name>
<stringValue id="35">Shrink</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="36" type="java.util.HashSet">
<item id="37" type="com.j2fe.workflow.definition.Transition">
<name id="38">goto-next</name>
<source id="39">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="40"/>
<directJoin>false</directJoin>
<name id="41">Shrink FT_WF_WFRV</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="42">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="43" type="java.util.HashSet">
<item id="44" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="45">["Table"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="46">input["Table"]</name>
<stringValue id="47">FT_WF_WFRV</stringValue>
<type>CONSTANT</type>
</item>
<item id="48" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="49">name</name>
<stringValue id="50">Shrink</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="51" type="java.util.HashSet">
<item id="52" type="com.j2fe.workflow.definition.Transition">
<name id="53">goto-next</name>
<source id="54">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="55"/>
<directJoin>false</directJoin>
<name id="56">MHI_P_WF_DELETE</name>
<nodeHandler>com.j2fe.general.activities.database.PLSQLprocedure</nodeHandler>
<nodeHandlerClass id="57">com.j2fe.general.activities.database.PLSQLprocedure</nodeHandlerClass>
<parameters id="58" type="java.util.HashSet">
<item id="59" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="60">PLSQLQuery</name>
<stringValue id="61">BEGIN&#13;
MHI_P_WF_DELETE(?);&#13;
END&#13;
&#13;
</stringValue>
<type>CONSTANT</type>
</item>
<item id="62" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="63">database</name>
<stringValue id="64">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="65" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="66">indexParameters[0]</name>
<objectValue id="67" type="java.lang.String">IN</objectValue>
<type>CONSTANT</type>
</item>
<item id="68" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="69">indexedParameterType[0]</name>
<objectValue id="70" type="java.lang.String">INTEGER</objectValue>
<type>CONSTANT</type>
</item>
<item id="71" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="72">[0]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="73">indexedParameterValue[0]</name>
<stringValue id="74">days</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="75" type="java.util.HashSet">
<item id="76" type="com.j2fe.workflow.definition.Transition">
<name id="77">goto-next</name>
<source id="78">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="79"/>
<directJoin>false</directJoin>
<name id="80">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="81">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="82" type="java.util.HashSet"/>
<targets id="83" type="java.util.HashSet">
<item idref="76" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="54"/>
</item>
</sources>
<targets id="84" type="java.util.HashSet">
<item idref="52" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="39"/>
</item>
</sources>
<targets id="85" type="java.util.HashSet">
<item idref="37" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="24"/>
</item>
</sources>
<targets id="86" type="java.util.HashSet">
<item idref="22" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="9"/>
</item>
</sources>
<targets id="87" type="java.util.HashSet">
<item idref="7" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="2"/>
</item>
</sources>
<targets id="88" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="89">Mizuho/Purge</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="90">user1</lastChangeUser>
<lastUpdate id="91">2025-05-19T05:00:39.000+0100</lastUpdate>
<name id="92">PurgeWorkflows</name>
<nodes id="93" type="java.util.HashSet">
<item idref="54" type="com.j2fe.workflow.definition.Node"/>
<item idref="9" type="com.j2fe.workflow.definition.Node"/>
<item idref="39" type="com.j2fe.workflow.definition.Node"/>
<item idref="24" type="com.j2fe.workflow.definition.Node"/>
<item idref="78" type="com.j2fe.workflow.definition.Node"/>
<item idref="2" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>true</optimize>
<parameter id="94" type="java.util.HashMap">
<entry>
<key id="95" type="java.lang.String">days</key>
<value id="96" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="97">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
</parameter>
<permissions id="98" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>true</purgeAtEnd>
<retries>0</retries>
<startNode idref="78"/>
<status>RELEASED</status>
<variables id="99" type="java.util.HashMap">
<entry>
<key id="100" type="java.lang.String">days</key>
<value id="101" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="102">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<persistent>false</persistent>
<value id="103" type="java.lang.Integer">3</value>
</value>
</entry>
</variables>
<version>3</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
