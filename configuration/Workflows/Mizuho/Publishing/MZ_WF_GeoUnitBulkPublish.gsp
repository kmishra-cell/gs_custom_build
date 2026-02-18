<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.07">
<package-comment/>
<businessobject displayString="9 - v10 Parallel Branches" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>false</alwaysPersist>
<clustered>false</clustered>
<comment id="1">v10 Parallel Branches</comment>
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
<name id="11">NOP (Standard)</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="12">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="13" type="java.util.HashSet">
<item id="14" type="com.j2fe.workflow.definition.Transition">
<name id="15">goto-next</name>
<source id="16">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="17"/>
<directJoin>true</directJoin>
<name id="18">Synchronize</name>
<nodeHandler>com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandler>
<nodeHandlerClass id="19">com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandlerClass>
<sources id="20" type="java.util.HashSet">
<item id="21" type="com.j2fe.workflow.definition.Transition">
<name id="22">goto-next</name>
<source id="23">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="24"/>
<directJoin>false</directJoin>
<name id="25">Raise Event Remote #1</name>
<nodeHandler>com.j2fe.event.RaiseEventRemote</nodeHandler>
<nodeHandlerClass id="26">com.j2fe.event.RaiseEventRemote</nodeHandlerClass>
<parameters id="27" type="java.util.HashSet">
<item id="28" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="29">eventName</name>
<stringValue id="30">MizBulkExtraction_Event</stringValue>
<type>CONSTANT</type>
</item>
<item id="31" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="32">["AuditId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="33">parameters["AuditId"]</name>
<stringValue id="34">auditIdentifier</stringValue>
<type>VARIABLE</type>
</item>
<item id="35" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="36">["ExtDefs"]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="37">parameters["ExtDefs"]</name>
<stringValue id="38">extDefsPerBranch</stringValue>
<type>VARIABLE</type>
</item>
<item id="39" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="40">["JMSDestination"]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="41">parameters["JMSDestination"]</name>
<stringValue id="42">GeoUnitQueue</stringValue>
<type>VARIABLE</type>
</item>
<item id="43" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="44">["PublishingBulkSize"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="45">parameters["PublishingBulkSize"]</name>
<stringValue id="46">PublishingBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="47" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="48">["Threshold for Extraction Failures"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="49">parameters["Threshold for Extraction Failures"]</name>
<stringValue id="50">Threshold for extraction failures</stringValue>
<type>VARIABLE</type>
</item>
<item id="51" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="52">propertyFileLocation</name>
<stringValue id="53">db://resource/PublishingConfiguration/PublishingConfig.properties</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="54" type="java.util.HashSet">
<item id="55" type="com.j2fe.workflow.definition.Transition">
<name id="56">goto-next</name>
<source id="57">
<activation>ASYNCHRONOUS</activation>
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
<stringValue id="64">pubBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="65" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="66">input</name>
<stringValue id="67">extractDefinitions</stringValue>
<type>VARIABLE</type>
</item>
<item id="68" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="69">output</name>
<stringValue id="70">extDefsPerBranch</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="71" type="java.util.HashSet">
<item id="72" type="com.j2fe.workflow.definition.Transition">
<name id="73">goto-next</name>
<source id="74">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="75"/>
<directJoin>false</directJoin>
<name id="76">Bean Shell Script (Standard)</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="77">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="78" type="java.util.HashSet">
<item id="79" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="80">statements</name>
<stringValue id="81">if(NoOfThreads &lt;= 0) {&#13;
	NoOfThreads = 1;&#13;
}&#13;
else if(items &lt; NoOfThreads)&#13;
{&#13;
NoOfThreads = items;&#13;
}&#13;
bulkSize = items / NoOfThreads;&#13;
if(items % NoOfThreads != 0)&#13;
{&#13;
bulkSize = bulkSize +1;&#13;
}</stringValue>
<type>CONSTANT</type>
</item>
<item id="82" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="83">["NoOfThreads"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="84">variables["NoOfThreads"]</name>
<stringValue id="85">No. of parallel branches</stringValue>
<type>VARIABLE</type>
</item>
<item id="86" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="87">["bulkSize"]@java/lang/Integer@</UITypeHint>
<input>false</input>
<name id="88">variables["bulkSize"]</name>
<stringValue id="89">pubBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="90" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="91">["items"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="92">variables["items"]</name>
<stringValue id="93">extractDefinitions</stringValue>
<type>VARIABLE</type>
<variablePart id="94">length</variablePart>
</item>
</parameters>
<sources id="95" type="java.util.HashSet">
<item id="96" type="com.j2fe.workflow.definition.Transition">
<name id="97">extraction</name>
<source id="98">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="99"/>
<directJoin>false</directJoin>
<name id="100"> Extraction Log</name>
<nodeHandler>com.thegoldensource.publishing.activity.WriteExtractionLog</nodeHandler>
<nodeHandlerClass id="101">com.thegoldensource.publishing.activity.WriteExtractionLog</nodeHandlerClass>
<parameters id="102" type="java.util.HashSet">
<item id="103" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="104">auditId</name>
<stringValue id="105">auditIdentifier</stringValue>
<type>VARIABLE</type>
</item>
<item id="106" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="107">entityMode</name>
<stringValue id="108">MODEL_ENTITY</stringValue>
<type>CONSTANT</type>
</item>
<item id="109" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="110">eql</name>
<stringValue id="111">PublishQuery</stringValue>
<type>VARIABLE</type>
</item>
<item id="112" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="113">extractDefinitions</name>
<stringValue id="114">extractDefinitions</stringValue>
<type>VARIABLE</type>
</item>
<item id="115" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="116">extractorFactory</name>
<stringValue id="117">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="118" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="119">maxExtractCount</name>
<stringValue id="120">PublishingBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="121" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="122">modelName</name>
<stringValue id="123">GUNT_PUB</stringValue>
<type>CONSTANT</type>
</item>
<item id="124" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="125">queryParameter</name>
<stringValue id="126">queryParameter</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="127" type="java.util.HashSet">
<item id="128" type="com.j2fe.workflow.definition.Transition">
<name id="129">goto-next</name>
<source id="130">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="131"/>
<directJoin>false</directJoin>
<name id="132">Geographic Unit Publish Query</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="133">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="134" type="java.util.HashSet">
<item id="135" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="136">statements</name>
<stringValue id="137">query="&lt;sql&gt;cross_ref_id in (select ft_t_gunt.cross_ref_id from ft_t_gunt where ft_t_gunt.end_tms IS NULL  and ft_t_gunt.PRNT_GU_ID in (select ft_t_gugp.gu_id from ft_t_gugp where ft_t_gugp.GU_TYP = ft_t_gunt.PRNT_GU_TYP) )&lt;/sql&gt;";&#13;
</stringValue>
<type>CONSTANT</type>
</item>
<item id="138" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="139">variables["query"]</name>
<stringValue id="140">PublishQuery</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="141" type="java.util.HashSet">
<item id="142" type="com.j2fe.workflow.definition.Transition">
<name id="143">goto-next</name>
<source id="144">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="145"/>
<directJoin>false</directJoin>
<name id="146">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="147">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="148" type="java.util.HashSet"/>
<targets id="149" type="java.util.HashSet">
<item idref="142" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="130"/>
</item>
</sources>
<targets id="150" type="java.util.HashSet">
<item idref="128" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="98"/>
</item>
</sources>
<targets id="151" type="java.util.HashSet">
<item idref="96" type="com.j2fe.workflow.definition.Transition"/>
<item id="152" type="com.j2fe.workflow.definition.Transition">
<name id="153">no-extraction</name>
<source idref="98"/>
<target idref="9"/>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="74"/>
</item>
</sources>
<targets id="154" type="java.util.HashSet">
<item idref="72" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="57"/>
</item>
</sources>
<targets id="155" type="java.util.HashSet">
<item idref="55" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDSPLIT</type>
</source>
<target idref="23"/>
</item>
</sources>
<targets id="156" type="java.util.HashSet">
<item idref="21" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="16"/>
</item>
</sources>
<targets id="157" type="java.util.HashSet">
<item idref="14" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDJOIN</type>
</source>
<target idref="9"/>
</item>
<item idref="152" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="158" type="java.util.HashSet">
<item idref="7" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="2"/>
</item>
</sources>
<targets id="159" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="160">Mizuho/Publishing</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="161">user1</lastChangeUser>
<lastUpdate id="162">2025-11-20T00:34:54.000+0000</lastUpdate>
<name id="163">MZ_WF_GeoUnitBulkPublish</name>
<nodes id="164" type="java.util.HashSet">
<item idref="98" type="com.j2fe.workflow.definition.Node"/>
<item idref="74" type="com.j2fe.workflow.definition.Node"/>
<item idref="57" type="com.j2fe.workflow.definition.Node"/>
<item idref="130" type="com.j2fe.workflow.definition.Node"/>
<item idref="9" type="com.j2fe.workflow.definition.Node"/>
<item idref="23" type="com.j2fe.workflow.definition.Node"/>
<item idref="144" type="com.j2fe.workflow.definition.Node"/>
<item idref="2" type="com.j2fe.workflow.definition.Node"/>
<item idref="16" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>true</optimize>
<parameter id="165" type="java.util.HashMap">
<entry>
<key id="166" type="java.lang.String">GeoUnitQueue</key>
<value id="167" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="168">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="169"/>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="170" type="java.lang.String">No. of parallel branches</key>
<value id="171" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="172">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="173">This defines how many branches would run in parallel while publishing</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="174" type="java.lang.String">OutputMessage</key>
<value id="175" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="176">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>false</input>
<output>true</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="177" type="java.lang.String">PublishingBulkSize</key>
<value id="178" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="179">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="180">It defines number of entities to be extracted in one bulk</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="181" type="java.lang.String">Threshold for extraction failures</key>
<value id="182" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="183">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
</parameter>
<permissions id="184" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>false</purgeAtEnd>
<retries>0</retries>
<startNode idref="144"/>
<status>RELEASED</status>
<variables id="185" type="java.util.HashMap">
<entry>
<key id="186" type="java.lang.String">GeoUnitQueue</key>
<value id="187" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="188">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="189"/>
<persistent>false</persistent>
<value id="190" type="java.lang.String">jms/queue/geographicUnit</value>
</value>
</entry>
<entry>
<key id="191" type="java.lang.String">No. of parallel branches</key>
<value id="192" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="193">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="194">This defines how many branches would run in parallel while publishing</description>
<persistent>false</persistent>
<value id="195" type="java.lang.Integer">5</value>
</value>
</entry>
<entry>
<key id="196" type="java.lang.String">OutputMessage</key>
<value id="197" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="198">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>true</persistent>
<value id="199" type="java.lang.String">&lt;?xml version='1.0' encoding='utf-8'?&gt;&lt;OutputMsg&gt;Publish done!&lt;/OutputMsg&gt;</value>
</value>
</entry>
<entry>
<key id="200" type="java.lang.String">PublishingBulkSize</key>
<value id="201" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="202">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="203">It defines number of entities to be extracted in one bulk</description>
<persistent>false</persistent>
<value id="204" type="java.lang.Integer">100</value>
</value>
</entry>
<entry>
<key id="205" type="java.lang.String">Threshold for extraction failures</key>
<value id="206" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="207">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
</variables>
<version>9</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
