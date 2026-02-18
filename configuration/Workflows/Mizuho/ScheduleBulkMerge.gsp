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
<directJoin>true</directJoin>
<name id="11">Synchronize</name>
<nodeHandler>com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandler>
<nodeHandlerClass id="12">com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandlerClass>
<sources id="13" type="java.util.HashSet">
<item id="14" type="com.j2fe.workflow.definition.Transition">
<name id="15">end-loop</name>
<source id="16">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="17"/>
<directJoin>false</directJoin>
<name id="18">For Loop</name>
<nodeHandler>com.j2fe.workflow.handler.impl.ForEach</nodeHandler>
<nodeHandlerClass id="19">com.j2fe.workflow.handler.impl.ForEach</nodeHandlerClass>
<parameters id="20" type="java.util.HashSet">
<item id="21" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="22">counter</name>
<stringValue id="23">LoopCounter</stringValue>
<type>VARIABLE</type>
</item>
<item id="24" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="25">counter</name>
<stringValue id="26">LoopCounter</stringValue>
<type>VARIABLE</type>
</item>
<item id="27" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="28">input</name>
<stringValue id="29">BulkedItems</stringValue>
<type>VARIABLE</type>
</item>
<item id="30" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="31">output</name>
<stringValue id="32">cnstOid</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="33" type="java.util.HashSet">
<item id="34" type="com.j2fe.workflow.definition.Transition">
<name id="35">ToSplit</name>
<source id="36">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="37">Automatically generated</description>
<directJoin>false</directJoin>
<name id="38">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="39">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="40" type="java.util.HashSet">
<item id="41" type="com.j2fe.workflow.definition.Transition">
<name id="42">goto-next</name>
<source id="43">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="44"/>
<directJoin>false</directJoin>
<name id="45">Bean Shell Script (Standard)</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="46">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="47" type="java.util.HashSet">
<item id="48" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="49">statements</name>
<stringValue id="50">int counter=0;</stringValue>
<type>CONSTANT</type>
</item>
<item id="51" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="52">variables["counter"]</name>
<stringValue id="53">LoopCounter</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="54" type="java.util.HashSet">
<item id="55" type="com.j2fe.workflow.definition.Transition">
<name id="56">goto-next</name>
<source id="57">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="58"/>
<directJoin>true</directJoin>
<name id="59">Bulk Items</name>
<nodeHandler>com.j2fe.general.activities.BulkItems</nodeHandler>
<nodeHandlerClass id="60">com.j2fe.general.activities.BulkItems</nodeHandlerClass>
<parameters id="61" type="java.util.HashSet">
<item id="62" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="63">bulk</name>
<stringValue id="64">BulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="65" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="66">input</name>
<stringValue id="67">cnstOids</stringValue>
<type>VARIABLE</type>
</item>
<item id="68" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="69">output</name>
<stringValue id="70">BulkedItems</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="71" type="java.util.HashSet">
<item id="72" type="com.j2fe.workflow.definition.Transition">
<name id="73">rows-found</name>
<source id="74">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="75"/>
<directJoin>false</directJoin>
<name id="76">Select CNST</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="77">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="78" type="java.util.HashSet">
<item id="79" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="80">database</name>
<stringValue id="81">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="82" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="83">firstColumnsResult</name>
<stringValue id="84">cnstOids</stringValue>
<type>VARIABLE</type>
</item>
<item id="85" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="86">querySQL</name>
<stringValue id="87">select cnst_oid from ft_t_cnst&#13;
where merge_stat_typ = 'TO MERGE'&#13;
and merge_exec_typ = 'BATCH'&#13;
and cons_cross_ref_id is not null&#13;
and surviving_cross_ref_id is not null&#13;
and start_tms &lt;= sysdate() and (end_tms is null or end_tms &gt; sysdate())
</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="88" type="java.util.HashSet">
<item id="89" type="com.j2fe.workflow.definition.Transition">
<name id="90">goto-next</name>
<source id="91">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="92"/>
<directJoin>false</directJoin>
<name id="93">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="94">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="95" type="java.util.HashSet"/>
<targets id="96" type="java.util.HashSet">
<item idref="89" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="74"/>
</item>
</sources>
<targets id="97" type="java.util.HashSet">
<item id="98" type="com.j2fe.workflow.definition.Transition">
<name id="99">nothing-found</name>
<source idref="74"/>
<target idref="2"/>
</item>
<item idref="72" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="57"/>
</item>
</sources>
<targets id="100" type="java.util.HashSet">
<item idref="55" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDSPLIT</type>
</source>
<target idref="43"/>
</item>
</sources>
<targets id="101" type="java.util.HashSet">
<item idref="41" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="36"/>
</item>
<item id="102" type="com.j2fe.workflow.definition.Transition">
<name id="103">goto-next</name>
<source id="104">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="105"/>
<directJoin>false</directJoin>
<name id="106">Process CNST</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="107">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="108" type="java.util.HashSet">
<item id="109" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="110">["cnstOid"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="111">input["cnstOid"]</name>
<stringValue id="112">cnstOid</stringValue>
<type>VARIABLE</type>
</item>
<item id="113" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="114">["messageType"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="115">input["messageType"]</name>
<stringValue id="116">MERGEENTITY</stringValue>
<type>CONSTANT</type>
</item>
<item id="117" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="118">["multipleMergeInstructions"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="119">input["multipleMergeInstructions"]</name>
<stringValue id="120">Yes</stringValue>
<type>CONSTANT</type>
</item>
<item id="121" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="122">name</name>
<stringValue id="123">ProcessMergeInstructions</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="124" type="java.util.HashSet">
<item id="125" type="com.j2fe.workflow.definition.Transition">
<name id="126">loop</name>
<source idref="16"/>
<target idref="104"/>
</item>
</sources>
<targets id="127" type="java.util.HashSet">
<item idref="102" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="36"/>
</item>
</sources>
<targets id="128" type="java.util.HashSet">
<item idref="34" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="16"/>
</item>
</sources>
<targets id="129" type="java.util.HashSet">
<item idref="14" type="com.j2fe.workflow.definition.Transition"/>
<item idref="125" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="9"/>
</item>
</sources>
<targets id="130" type="java.util.HashSet">
<item idref="7" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDJOIN</type>
</source>
<target idref="2"/>
</item>
<item idref="98" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="131" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="132">Mizuho</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="133">user1</lastChangeUser>
<lastUpdate id="134">2025-05-28T10:44:23.000+0100</lastUpdate>
<name id="135">ScheduleBulkMerge</name>
<nodes id="136" type="java.util.HashSet">
<item idref="43" type="com.j2fe.workflow.definition.Node"/>
<item idref="57" type="com.j2fe.workflow.definition.Node"/>
<item idref="16" type="com.j2fe.workflow.definition.Node"/>
<item idref="36" type="com.j2fe.workflow.definition.Node"/>
<item idref="104" type="com.j2fe.workflow.definition.Node"/>
<item idref="74" type="com.j2fe.workflow.definition.Node"/>
<item idref="91" type="com.j2fe.workflow.definition.Node"/>
<item idref="2" type="com.j2fe.workflow.definition.Node"/>
<item idref="9" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>true</optimize>
<parameter id="137" type="java.util.HashMap">
<entry>
<key id="138" type="java.lang.String">BulkSize</key>
<value id="139" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="140">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
</parameter>
<permissions id="141" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>true</purgeAtEnd>
<retries>0</retries>
<startNode idref="91"/>
<status>RELEASED</status>
<variables id="142" type="java.util.HashMap">
<entry>
<key id="143" type="java.lang.String">BulkSize</key>
<value id="144" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="145">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<persistent>false</persistent>
<value id="146" type="java.lang.Integer">20</value>
</value>
</entry>
<entry>
<key id="147" type="java.lang.String">LoopCounter</key>
<value id="148" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="149">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<persistent>false</persistent>
<value id="150" type="java.lang.Integer">0</value>
</value>
</entry>
</variables>
<version>3</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
