<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.07">
<package-comment/>
<businessobject displayString="11 - v10 Parallel Branches" type="com.j2fe.workflow.definition.Workflow">
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
<name id="11">NOP</name>
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
<name id="25">Extraction Event Remote</name>
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
<stringValue id="42">jmsDestination</stringValue>
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
<stringValue id="50">Threshold for Extraction Failures</stringValue>
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
<persistentVariables id="71" type="java.util.HashSet">
<item id="72" type="java.lang.String">extDefsPerBranch
1000</item>
<item id="73" type="java.lang.String">extractDefinitions
1000</item>
<item id="74" type="java.lang.String">PublishQuery
1000</item>
<item id="75" type="java.lang.String">auditIdentifier
1000</item>
<item id="76" type="java.lang.String">pubBulkSize
1000</item>
<item id="77" type="java.lang.String">queryParameter
1000</item>
</persistentVariables>
<sources id="78" type="java.util.HashSet">
<item id="79" type="com.j2fe.workflow.definition.Transition">
<name id="80">goto-next</name>
<source id="81">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="82"/>
<directJoin>false</directJoin>
<name id="83">Bean Shell Script (Standard)</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="84">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="85" type="java.util.HashSet">
<item id="86" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="87">statements</name>
<stringValue id="88">if(NoOfThreads &lt;= 0) {&#13;
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
<item id="89" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="90">["NoOfThreads"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="91">variables["NoOfThreads"]</name>
<stringValue id="92">No. Of Parallel Branches</stringValue>
<type>VARIABLE</type>
</item>
<item id="93" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="94">["bulkSize"]@java/lang/Integer@</UITypeHint>
<input>false</input>
<name id="95">variables["bulkSize"]</name>
<stringValue id="96">pubBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="97" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="98">["items"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="99">variables["items"]</name>
<stringValue id="100">extractDefinitions</stringValue>
<type>VARIABLE</type>
<variablePart id="101">length</variablePart>
</item>
</parameters>
<sources id="102" type="java.util.HashSet">
<item id="103" type="com.j2fe.workflow.definition.Transition">
<name id="104">extraction</name>
<source id="105">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="106"/>
<directJoin>false</directJoin>
<name id="107">Asset Extraction Log</name>
<nodeHandler>com.thegoldensource.publishing.activity.WriteExtractionLog</nodeHandler>
<nodeHandlerClass id="108">com.thegoldensource.publishing.activity.WriteExtractionLog</nodeHandlerClass>
<parameters id="109" type="java.util.HashSet">
<item id="110" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="111">auditId</name>
<stringValue id="112">auditIdentifier</stringValue>
<type>VARIABLE</type>
</item>
<item id="113" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="114">entityMode</name>
<stringValue id="115">MODEL_ENTITY</stringValue>
<type>CONSTANT</type>
</item>
<item id="116" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="117">eql</name>
<stringValue id="118">PublishQuery</stringValue>
<type>VARIABLE</type>
</item>
<item id="119" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="120">extractDefinitions</name>
<stringValue id="121">extractDefinitions</stringValue>
<type>VARIABLE</type>
</item>
<item id="122" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="123">extractorFactory</name>
<stringValue id="124">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="125" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="126">maxExtractCount</name>
<stringValue id="127">PublishingBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="128" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="129">modelName</name>
<stringValue id="130">ISSUPUB</stringValue>
<type>CONSTANT</type>
</item>
<item id="131" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="132">queryParameter</name>
<stringValue id="133">queryParameter</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="134" type="java.util.HashSet">
<item id="135" type="com.j2fe.workflow.definition.Transition">
<name id="136">goto-next</name>
<source id="137">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="138"/>
<directJoin>false</directJoin>
<name id="139">Asset Publish Query</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="140">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="141" type="java.util.HashSet">
<item id="142" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="143">statements</name>
<stringValue id="144">query="&lt;sql&gt;instr_id in (SELECT instr_id FROM ft_t_isgp WHERE ft_t_isgp.PRNT_ISS_GRP_OID  = '" + pubSoi +"' AND end_tms IS NULL AND instr_id IS NOT NULL";&#13;
&#13;
query = query + " union SELECT instr_id FROM ft_t_isgp WHERE ft_t_isgp.PRNT_ISS_GRP_OID  in (SELECT iss_grp_oid FROM ft_t_isgp where PRNT_ISS_GRP_OID =  '" + pubSoi +"' and instr_id is null) AND end_tms IS NULL AND instr_id is not null";&#13;
&#13;
if (mktOid != null) {&#13;
query = query + " intersect SELECT instr_id FROM ft_t_mkis WHERE mkt_oid  = '" + mktOid +"'  AND end_tms IS NULL";&#13;
}&#13;
&#13;
query = query + ")&lt;/sql&gt;";</stringValue>
<type>CONSTANT</type>
</item>
<item id="145" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="146">variables["mktOid"]</name>
<stringValue id="147">MktOid</stringValue>
<type>VARIABLE</type>
</item>
<item id="148" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="149">variables["pubSoi"]</name>
<stringValue id="150">PublishSoi</stringValue>
<type>VARIABLE</type>
</item>
<item id="151" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="152">["query"]@java/lang/Integer@</UITypeHint>
<input>false</input>
<name id="153">variables["query"]</name>
<stringValue id="154">PublishQuery</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="155" type="java.util.HashSet">
<item id="156" type="com.j2fe.workflow.definition.Transition">
<name id="157">goto-next</name>
<source id="158">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="159"/>
<directJoin>false</directJoin>
<name id="160">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="161">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="162" type="java.util.HashSet"/>
<targets id="163" type="java.util.HashSet">
<item idref="156" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="137"/>
</item>
</sources>
<targets id="164" type="java.util.HashSet">
<item idref="135" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="105"/>
</item>
</sources>
<targets id="165" type="java.util.HashSet">
<item idref="103" type="com.j2fe.workflow.definition.Transition"/>
<item id="166" type="com.j2fe.workflow.definition.Transition">
<name id="167">no-extraction</name>
<source idref="105"/>
<target idref="9"/>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="81"/>
</item>
</sources>
<targets id="168" type="java.util.HashSet">
<item idref="79" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="57"/>
</item>
</sources>
<targets id="169" type="java.util.HashSet">
<item idref="55" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDSPLIT</type>
</source>
<target idref="23"/>
</item>
</sources>
<targets id="170" type="java.util.HashSet">
<item idref="21" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="16"/>
</item>
</sources>
<targets id="171" type="java.util.HashSet">
<item idref="14" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDJOIN</type>
</source>
<target idref="9"/>
</item>
<item idref="166" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="172" type="java.util.HashSet">
<item idref="7" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="2"/>
</item>
</sources>
<targets id="173" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="174">Mizuho/Publishing</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="175">user1</lastChangeUser>
<lastUpdate id="176">2025-11-20T00:32:46.000+0000</lastUpdate>
<name id="177">AssetsBySoiMarket</name>
<nodes id="178" type="java.util.HashSet">
<item idref="105" type="com.j2fe.workflow.definition.Node"/>
<item idref="137" type="com.j2fe.workflow.definition.Node"/>
<item idref="81" type="com.j2fe.workflow.definition.Node"/>
<item idref="57" type="com.j2fe.workflow.definition.Node"/>
<item idref="23" type="com.j2fe.workflow.definition.Node"/>
<item idref="9" type="com.j2fe.workflow.definition.Node"/>
<item idref="158" type="com.j2fe.workflow.definition.Node"/>
<item idref="2" type="com.j2fe.workflow.definition.Node"/>
<item idref="16" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>true</optimize>
<parameter id="179" type="java.util.HashMap">
<entry>
<key id="180" type="java.lang.String">MktOid</key>
<value id="181" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="182">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="183" type="java.lang.String">No. Of Parallel Branches</key>
<value id="184" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="185">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="186">Defines how many parallel branches to be run for publishing.</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="187" type="java.lang.String">OutputMsg</key>
<value id="188" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="189">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>false</input>
<output>true</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="190" type="java.lang.String">PublishSoi</key>
<value id="191" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="192">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="193" type="java.lang.String">PublishingBulkSize</key>
<value id="194" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="195">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="196">Defines how many entities you want to extract in one bulk.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="197" type="java.lang.String">Threshold for Extraction Failures</key>
<value id="198" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="199">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="200">Value for this field should be specified in x/y format, both x and y is numeric. 
Here x is percentage of instruments allowed to fail during extraction and y is minimum sampling size.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="201" type="java.lang.String">jmsDestination</key>
<value id="202" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="203">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="204"/>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
</parameter>
<permissions id="205" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>false</purgeAtEnd>
<retries>0</retries>
<startNode idref="158"/>
<status>RELEASED</status>
<variables id="206" type="java.util.HashMap">
<entry>
<key id="207" type="java.lang.String">MktOid</key>
<value id="208" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="209">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="210" type="java.lang.String">No. Of Parallel Branches</key>
<value id="211" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="212">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="213">Defines how many parallel branches to be run for publishing.</description>
<persistent>false</persistent>
<value id="214" type="java.lang.Integer">5</value>
</value>
</entry>
<entry>
<key id="215" type="java.lang.String">OutputMsg</key>
<value id="216" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="217">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>true</persistent>
<value id="218" type="java.lang.String">&lt;?xml version='1.0' encoding='utf-8'?&gt;&lt;OutputMsg&gt;Publish done!&lt;/OutputMsg&gt;</value>
</value>
</entry>
<entry>
<key id="219" type="java.lang.String">PublishSoi</key>
<value id="220" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="221">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="222" type="java.lang.String">PublishingBulkSize</key>
<value id="223" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="224">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="225">Defines how many entities you want to extract in one bulk.</description>
<persistent>false</persistent>
<value id="226" type="java.lang.Integer">100</value>
</value>
</entry>
<entry>
<key id="227" type="java.lang.String">Threshold for Extraction Failures</key>
<value id="228" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="229">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="230">Value for this field should be specified in x/y format, both x and y is numeric. 
Here x is percentage of instruments allowed to fail during extraction and y is minimum sampling size.</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="231" type="java.lang.String">jmsDestination</key>
<value id="232" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="233">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="234"/>
<persistent>false</persistent>
<value id="235" type="java.lang.String">jms/queue/security</value>
</value>
</entry>
</variables>
<version>11</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
