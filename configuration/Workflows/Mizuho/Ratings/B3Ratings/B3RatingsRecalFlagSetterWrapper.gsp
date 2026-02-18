<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.03">
<package-comment/>
<businessobject displayString="3 - GU-312" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>false</alwaysPersist>
<clustered>true</clustered>
<comment id="1">GU-312</comment>
<description id="2">EG-10336&#13;
Wrapper for setting Basel 3 Recalc flag for Institutions that require recalculation</description>
<endNode id="3">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
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
<directJoin>false</directJoin>
<name id="10">Close Job</name>
<nodeHandler>com.j2fe.streetlamp.activities.CloseJob</nodeHandler>
<nodeHandlerClass id="11">com.j2fe.streetlamp.activities.CloseJob</nodeHandlerClass>
<parameters id="12" type="java.util.HashSet">
<item id="13" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="14">jobId</name>
<stringValue id="15">JobId</stringValue>
<type>VARIABLE</type>
</item>
<item id="16" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="17">skipConsolidateJob</name>
<stringValue id="18">true</stringValue>
<type>CONSTANT</type>
</item>
<item id="19" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="20">skipSeverityL3</name>
<stringValue id="21">true</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="22" type="java.util.HashSet">
<item id="23" type="com.j2fe.workflow.definition.Transition">
<name id="24">goto-next</name>
<source id="25">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="26">B3RatingsRecalFlagSetterForExpAttrs</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="27">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="28" type="java.util.HashSet">
<item id="29" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="30">["lastExecDateTms"]@java/util/Date@</UITypeHint>
<input>true</input>
<name id="31">input["lastExecDateTms"]</name>
<stringValue id="32">lastExecDateTms</stringValue>
<type>VARIABLE</type>
</item>
<item id="33" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="34">name</name>
<stringValue id="35">B3RatingsRecalFlagSetterForExposureAttrs</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="36" type="java.util.HashSet">
<item id="37" type="com.j2fe.workflow.definition.Transition">
<name id="38">goto-next</name>
<source id="39">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="40">B3RatingsRecalFlagSetterForSOI</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="41">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="42" type="java.util.HashSet">
<item id="43" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="44">["lastExecDateTms"]@java/util/Date@</UITypeHint>
<input>true</input>
<name id="45">input["lastExecDateTms"]</name>
<stringValue id="46">lastExecDateTms</stringValue>
<type>VARIABLE</type>
</item>
<item id="47" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="48">name</name>
<stringValue id="49">B3RatingsRecalFlagSetterForSOI</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="50" type="java.util.HashSet">
<item id="51" type="com.j2fe.workflow.definition.Transition">
<name id="52">goto-next</name>
<source id="53">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="54">B3RatingsRecalFlagSetterForIOI</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="55">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="56" type="java.util.HashSet">
<item id="57" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="58">["lastExecDateTms"]@java/util/Date@</UITypeHint>
<input>true</input>
<name id="59">input["lastExecDateTms"]</name>
<stringValue id="60">lastExecDateTms</stringValue>
<type>VARIABLE</type>
</item>
<item id="61" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="62">name</name>
<stringValue id="63">B3RatingsRecalFlagSetterForIOI</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="64" type="java.util.HashSet">
<item id="65" type="com.j2fe.workflow.definition.Transition">
<name id="66">goto-next</name>
<source id="67">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="68">B3RatingsRecalFlagSetterForISRT</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="69">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="70" type="java.util.HashSet">
<item id="71" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="72">["lastExecDateTms"]@java/util/Date@</UITypeHint>
<input>true</input>
<name id="73">input["lastExecDateTms"]</name>
<stringValue id="74">lastExecDateTms</stringValue>
<type>VARIABLE</type>
</item>
<item id="75" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="76">name</name>
<stringValue id="77">B3RatingsRecalFlagSetterForISRT</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="78" type="java.util.HashSet">
<item id="79" type="com.j2fe.workflow.definition.Transition">
<name id="80">goto-next</name>
<source id="81">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="82">B3RatingsRecalFlagSetterForFIRT</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="83">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="84" type="java.util.HashSet">
<item id="85" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="86">["lastExecDateTms"]@java/util/Date@</UITypeHint>
<input>true</input>
<name id="87">input["lastExecDateTms"]</name>
<stringValue id="88">lastExecDateTms</stringValue>
<type>VARIABLE</type>
</item>
<item id="89" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="90">name</name>
<stringValue id="91">B3RatingsRecalFlagSetterForFIRT</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="92" type="java.util.HashSet">
<item id="93" type="com.j2fe.workflow.definition.Transition">
<name id="94">goto-next</name>
<source id="95">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="96">Create Job</name>
<nodeHandler>com.j2fe.streetlamp.activities.CreateJob</nodeHandler>
<nodeHandlerClass id="97">com.j2fe.streetlamp.activities.CreateJob</nodeHandlerClass>
<parameters id="98" type="java.util.HashSet">
<item id="99" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="100">configInfo</name>
<stringValue id="101">B3RatingsRecalFlagSetter</stringValue>
<type>CONSTANT</type>
</item>
<item id="102" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="103">flushImmediate</name>
<stringValue id="104">true</stringValue>
<type>CONSTANT</type>
</item>
<item id="105" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="106">jobId</name>
<stringValue id="107">JobId</stringValue>
<type>VARIABLE</type>
</item>
<item id="108" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="109">parentJobId</name>
<stringValue id="110">ParentJobId</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="111" type="java.util.HashSet">
<item id="112" type="com.j2fe.workflow.definition.Transition">
<name id="113">goto-next</name>
<source id="114">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="115">Get Last Job TMS</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="116">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="117" type="java.util.HashSet">
<item id="118" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="119">database</name>
<stringValue id="120">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="121" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="122">firstColumnsResult[0]</name>
<stringValue id="123">lastExecDateTms</stringValue>
<type>VARIABLE</type>
</item>
<item id="124" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="125">querySQL</name>
<stringValue id="126">SELECT COALESCE (MAX(FT_T_JBLG.JOB_START_TMS),now()::Date -30) FROM FT_T_JBLG WHERE JOB_CONFIG_TXT = 'B3RatingsRecalFlagSetter'</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<persistentVariables id="127" type="java.util.HashSet">
<item id="128" type="java.lang.String">lastExecDateTms
1000</item>
</persistentVariables>
<sources id="129" type="java.util.HashSet">
<item id="130" type="com.j2fe.workflow.definition.Transition">
<name id="131">goto-next</name>
<source id="132">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="133">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="134">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="135" type="java.util.HashSet"/>
<targets id="136" type="java.util.HashSet">
<item idref="130" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="114"/>
</item>
</sources>
<targets id="137" type="java.util.HashSet">
<item idref="112" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="95"/>
</item>
</sources>
<targets id="138" type="java.util.HashSet">
<item idref="93" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="81"/>
</item>
</sources>
<targets id="139" type="java.util.HashSet">
<item idref="79" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="67"/>
</item>
</sources>
<targets id="140" type="java.util.HashSet">
<item idref="65" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="53"/>
</item>
</sources>
<targets id="141" type="java.util.HashSet">
<item idref="51" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="39"/>
</item>
</sources>
<targets id="142" type="java.util.HashSet">
<item idref="37" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="25"/>
</item>
</sources>
<targets id="143" type="java.util.HashSet">
<item idref="23" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="9"/>
</item>
</sources>
<targets id="144" type="java.util.HashSet">
<item idref="7" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="3"/>
</item>
</sources>
<targets id="145" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="146">Mizuho/Ratings/B3Ratings</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="147">user1</lastChangeUser>
<lastUpdate id="148">2025-07-16T15:24:41.000+0100</lastUpdate>
<name id="149">B3RatingsRecalFlagSetterWrapper</name>
<nodes id="150" type="java.util.HashSet">
<item idref="25" type="com.j2fe.workflow.definition.Node"/>
<item idref="81" type="com.j2fe.workflow.definition.Node"/>
<item idref="53" type="com.j2fe.workflow.definition.Node"/>
<item idref="67" type="com.j2fe.workflow.definition.Node"/>
<item idref="39" type="com.j2fe.workflow.definition.Node"/>
<item idref="9" type="com.j2fe.workflow.definition.Node"/>
<item idref="95" type="com.j2fe.workflow.definition.Node"/>
<item idref="114" type="com.j2fe.workflow.definition.Node"/>
<item idref="132" type="com.j2fe.workflow.definition.Node"/>
<item idref="3" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>true</optimize>
<parameter id="151" type="java.util.HashMap">
<entry>
<key id="152" type="java.lang.String">ParentJobId</key>
<value id="153" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="154">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
</parameter>
<permissions id="155" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>true</purgeAtEnd>
<retries>0</retries>
<startNode idref="132"/>
<status>RELEASED</status>
<variables id="156" type="java.util.HashMap">
<entry>
<key id="157" type="java.lang.String">ParentJobId</key>
<value id="158" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="159">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
</variables>
<version>3</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
