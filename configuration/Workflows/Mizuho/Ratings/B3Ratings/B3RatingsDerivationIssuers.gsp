<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.07">
<package-comment/>
<businessobject displayString="11 - GU-310 v10" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>false</alwaysPersist>
<clustered>true</clustered>
<comment id="1">GU-310 v10</comment>
<description id="2">Derive Basel3.1 ratings for a single FINS/Issuer</description>
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
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="10">NOP</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="11">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="12" type="java.util.HashSet">
<item id="13" type="com.j2fe.workflow.definition.Transition">
<name id="14">goto-next</name>
<source id="15">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<directJoin>true</directJoin>
<name id="16">Synchronize</name>
<nodeHandler>com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandler>
<nodeHandlerClass id="17">com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandlerClass>
<sources id="18" type="java.util.HashSet">
<item id="19" type="com.j2fe.workflow.definition.Transition">
<name id="20">goto-next</name>
<source id="21">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="22"/>
<directJoin>false</directJoin>
<name id="23">Raise Event Remote #1</name>
<nodeHandler>com.j2fe.event.RaiseEventRemote</nodeHandler>
<nodeHandlerClass id="24">com.j2fe.event.RaiseEventRemote</nodeHandlerClass>
<parameters id="25" type="java.util.HashSet">
<item id="26" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="27">eventName</name>
<stringValue id="28">MizBulkExtractionEvent</stringValue>
<type>CONSTANT</type>
</item>
<item id="29" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="30">["AuditId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="31">parameters["AuditId"]</name>
<stringValue id="32">auditIdentifier</stringValue>
<type>VARIABLE</type>
</item>
<item id="33" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="34">["ExtDefs"]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="35">parameters["ExtDefs"]</name>
<stringValue id="36">extDefsPerBranch</stringValue>
<type>VARIABLE</type>
</item>
<item id="37" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="38">["Handle Extraction Failures"]@com/thegoldensource/subscription/ExceptionHandlingMode@</UITypeHint>
<input>true</input>
<name id="39">parameters["Handle Extraction Failures"]</name>
<objectValue id="40" type="com.thegoldensource.subscription.ExceptionHandlingMode">DO_NOT_HANDLE</objectValue>
<type>CONSTANT</type>
</item>
<item id="41" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="42">["JMSDestination"]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="43">parameters["JMSDestination"]</name>
<stringValue id="44">IssuerQueueNmae</stringValue>
<type>VARIABLE</type>
</item>
<item id="45" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="46">["PublishingBulkSize"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="47">parameters["PublishingBulkSize"]</name>
<stringValue id="48">bulkSplitSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="49" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="50">propertyFileLocation</name>
<stringValue id="51">db://resource/PublishingConfiguration/PublishingConfig.properties</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="52" type="java.util.HashSet">
<item id="53" type="com.j2fe.workflow.definition.Transition">
<name id="54">goto-next</name>
<source id="55">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<directJoin>true</directJoin>
<name id="56">Bulk Items</name>
<nodeHandler>com.j2fe.general.activities.BulkItems</nodeHandler>
<nodeHandlerClass id="57">com.j2fe.general.activities.BulkItems</nodeHandlerClass>
<parameters id="58" type="java.util.HashSet">
<item id="59" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="60">bulk</name>
<stringValue id="61">bulkSplitSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="62" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="63">input</name>
<stringValue id="64">extractDefinitions</stringValue>
<type>VARIABLE</type>
</item>
<item id="65" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="66">output</name>
<stringValue id="67">extDefsPerBranch</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="68" type="java.util.HashSet">
<item id="69" type="com.j2fe.workflow.definition.Transition">
<name id="70">extraction</name>
<source id="71">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="72">Extraction Log</name>
<nodeHandler>com.thegoldensource.publishing.activity.WriteExtractionLog</nodeHandler>
<nodeHandlerClass id="73">com.thegoldensource.publishing.activity.WriteExtractionLog</nodeHandlerClass>
<parameters id="74" type="java.util.HashSet">
<item id="75" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="76">auditId</name>
<stringValue id="77">auditIdentifier</stringValue>
<type>VARIABLE</type>
</item>
<item id="78" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="79">entityMode</name>
<stringValue id="80">MODEL_ENTITY</stringValue>
<type>CONSTANT</type>
</item>
<item id="81" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="82">eql</name>
<stringValue id="83">pubExtQry</stringValue>
<type>VARIABLE</type>
</item>
<item id="84" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="85">extractDefinitions</name>
<stringValue id="86">extractDefinitions</stringValue>
<type>VARIABLE</type>
</item>
<item id="87" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="88">extractorFactory</name>
<stringValue id="89">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="90" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="91">maxExtractCount</name>
<stringValue id="92">bulkSplitSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="93" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="94">modelName</name>
<stringValue id="95">ISSRPUB</stringValue>
<type>CONSTANT</type>
</item>
<item id="96" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="97">queryParameter</name>
<stringValue id="98">queryParameter</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="99" type="java.util.HashSet">
<item id="100" type="com.j2fe.workflow.definition.Transition">
<name id="101">goto-next</name>
<source id="102">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>true</directJoin>
<name id="103">Synchronize</name>
<nodeHandler>com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandler>
<nodeHandlerClass id="104">com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandlerClass>
<sources id="105" type="java.util.HashSet">
<item id="106" type="com.j2fe.workflow.definition.Transition">
<name id="107">goto-next</name>
<source id="108">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="109">Call Subworkflow</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="110">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="111" type="java.util.HashSet">
<item id="112" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="113">["JobID"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="114">input["JobID"]</name>
<stringValue id="115">jobId</stringValue>
<type>VARIABLE</type>
</item>
<item id="116" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="117">["bulkRealMsgs"]@[Ljava/lang/String;@</UITypeHint>
<input>true</input>
<name id="118">input["bulkRealMsgs"]</name>
<stringValue id="119">RealMsgsBulk</stringValue>
<type>VARIABLE</type>
</item>
<item id="120" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="121">name</name>
<stringValue id="122">B3RealMessageProcessorBulkWrapper</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="123" type="java.util.HashSet">
<item id="124" type="com.j2fe.workflow.definition.Transition">
<name id="125">goto-next</name>
<source id="126">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>true</directJoin>
<name id="127">Bulk Items</name>
<nodeHandler>com.j2fe.general.activities.BulkItems</nodeHandler>
<nodeHandlerClass id="128">com.j2fe.general.activities.BulkItems</nodeHandlerClass>
<parameters id="129" type="java.util.HashSet">
<item id="130" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="131">bulk</name>
<stringValue id="132">bulkSplitSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="133" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="134">input</name>
<stringValue id="135">StreetRefMsgList</stringValue>
<type>VARIABLE</type>
</item>
<item id="136" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="137">output</name>
<stringValue id="138">RealMsgsBulk</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="139" type="java.util.HashSet">
<item id="140" type="com.j2fe.workflow.definition.Transition">
<name id="141">goto-next</name>
<source id="142">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="143">Thread to Bulk Pub Qry</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="144">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="145" type="java.util.HashSet">
<item id="146" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="147">statements</name>
<stringValue id="148">if(NoOfThreads &lt;= 0) {
	NoOfThreads = 1;
}
else if(items &lt; NoOfThreads)
{
	NoOfThreads = items;
	if (NoOfThreads == 0) {
		NoOfThreads = 1;
	}
}
int bulkSize = items / NoOfThreads;
if(items % NoOfThreads != 0)
{
	bulkSize = bulkSize + 1;
}

String jobIdQryPrt="TRID.JOB_ID = '"+jobId+"' AND";
if (jobId == null) {
jobIdQryPrt="TRID.INPUT_MSG_TYP='REAL' AND TRID.CREATED_TMS &gt; now()::DATE - 1/(24*60) AND";
}

String pubExtQry = "&lt;sql&gt; INSTR_ISSR_ID IN ( SELECT INSTR_ISSR_ID FROM FT_T_ISSR ISSR WHERE FINS_INST_MNEM = '"+instMnem+"' " +
    					" AND EXISTS (SELECT 1 FROM FT_T_MSGP MSGP, FT_T_TRID TRID WHERE "+jobIdQryPrt+"  TRID.TRN_ID = MSGP.TRN_ID " +
    					" AND XREF_TBL_ROW_OID  = ISSR.FINS_INST_MNEM AND ENTITY_CHG_IND IN ('C','U') )) &lt;/sql&gt;";</stringValue>
<type>CONSTANT</type>
</item>
<item id="149" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="150">["NoOfThreads"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="151">variables["NoOfThreads"]</name>
<stringValue id="152">ParallelBranches</stringValue>
<type>VARIABLE</type>
</item>
<item id="153" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="154">["bulkSize"]@java/lang/Integer@</UITypeHint>
<input>false</input>
<name id="155">variables["bulkSize"]</name>
<stringValue id="156">bulkSplitSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="157" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="158">["instMnem"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="159">variables["instMnem"]</name>
<stringValue id="160">instMnem</stringValue>
<type>VARIABLE</type>
</item>
<item id="161" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="162">["items"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="163">variables["items"]</name>
<stringValue id="164">StreetRefMsgList</stringValue>
<type>VARIABLE</type>
<variablePart id="165">length</variablePart>
</item>
<item id="166" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="167">["jobId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="168">variables["jobId"]</name>
<stringValue id="169">jobId</stringValue>
<type>VARIABLE</type>
</item>
<item id="170" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="171">["pubExtQry"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="172">variables["pubExtQry"]</name>
<stringValue id="173">pubExtQry</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="174" type="java.util.HashSet">
<item id="175" type="com.j2fe.workflow.definition.Transition">
<name id="176">rows-found</name>
<source id="177">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="178">StreetRef Selector</name>
<nodeHandler>com.j2fe.general.activities.database.XMLQuery</nodeHandler>
<nodeHandlerClass id="179">com.j2fe.general.activities.database.XMLQuery</nodeHandlerClass>
<parameters id="180" type="java.util.HashSet">
<item id="181" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="182">database</name>
<stringValue id="183">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="184" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="185">[0]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="186">indexedParameters[0]</name>
<stringValue id="187">instMnem</stringValue>
<type>VARIABLE</type>
</item>
<item id="188" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="189">queryName</name>
<stringValue id="190">Basel3InstitutionRatingsStreetRefQuery</stringValue>
<type>CONSTANT</type>
</item>
<item id="191" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="192">result</name>
<stringValue id="193">StreetRefMsgList</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="194" type="java.util.HashSet">
<item id="195" type="com.j2fe.workflow.definition.Transition">
<name id="196">goto-next</name>
<source id="197">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="198">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="199">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="200" type="java.util.HashSet"/>
<targets id="201" type="java.util.HashSet">
<item idref="195" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="177"/>
</item>
</sources>
<targets id="202" type="java.util.HashSet">
<item id="203" type="com.j2fe.workflow.definition.Transition">
<name id="204">nothing-found</name>
<source idref="177"/>
<target idref="3"/>
</item>
<item idref="175" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="142"/>
</item>
</sources>
<targets id="205" type="java.util.HashSet">
<item idref="140" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="126"/>
</item>
</sources>
<targets id="206" type="java.util.HashSet">
<item idref="124" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDSPLIT</type>
</source>
<target idref="108"/>
</item>
</sources>
<targets id="207" type="java.util.HashSet">
<item idref="106" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="102"/>
</item>
</sources>
<targets id="208" type="java.util.HashSet">
<item idref="100" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDJOIN</type>
</source>
<target idref="71"/>
</item>
</sources>
<targets id="209" type="java.util.HashSet">
<item idref="69" type="com.j2fe.workflow.definition.Transition"/>
<item id="210" type="com.j2fe.workflow.definition.Transition">
<name id="211">no-extraction</name>
<source idref="71"/>
<target idref="9"/>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="55"/>
</item>
</sources>
<targets id="212" type="java.util.HashSet">
<item idref="53" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDSPLIT</type>
</source>
<target idref="21"/>
</item>
</sources>
<targets id="213" type="java.util.HashSet">
<item idref="19" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="15"/>
</item>
</sources>
<targets id="214" type="java.util.HashSet">
<item idref="13" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDJOIN</type>
</source>
<target idref="9"/>
</item>
<item idref="210" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="215" type="java.util.HashSet">
<item idref="7" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="3"/>
</item>
<item idref="203" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="216" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="217">Mizuho/Ratings/B3Ratings</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="218">user1</lastChangeUser>
<lastUpdate id="219">2025-11-10T14:06:25.000+0000</lastUpdate>
<name id="220">B3RatingsDerivationIssuers</name>
<nodes id="221" type="java.util.HashSet">
<item idref="126" type="com.j2fe.workflow.definition.Node"/>
<item idref="55" type="com.j2fe.workflow.definition.Node"/>
<item idref="108" type="com.j2fe.workflow.definition.Node"/>
<item idref="71" type="com.j2fe.workflow.definition.Node"/>
<item idref="9" type="com.j2fe.workflow.definition.Node"/>
<item idref="21" type="com.j2fe.workflow.definition.Node"/>
<item idref="197" type="com.j2fe.workflow.definition.Node"/>
<item idref="3" type="com.j2fe.workflow.definition.Node"/>
<item idref="177" type="com.j2fe.workflow.definition.Node"/>
<item idref="102" type="com.j2fe.workflow.definition.Node"/>
<item idref="15" type="com.j2fe.workflow.definition.Node"/>
<item idref="142" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>true</optimize>
<parameter id="222" type="java.util.HashMap">
<entry>
<key id="223" type="java.lang.String">IssuerQueueNmae</key>
<value id="224" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="225">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="226"/>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="227" type="java.lang.String">ParallelBranches</key>
<value id="228" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="229">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="230" type="java.lang.String">instMnem</key>
<value id="231" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="232">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="233">the inst_mnem for a single FINS to be derived</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="234" type="java.lang.String">jobId</key>
<value id="235" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="236">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
</parameter>
<permissions id="237" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>true</purgeAtEnd>
<retries>0</retries>
<startNode idref="197"/>
<status>RELEASED</status>
<variables id="238" type="java.util.HashMap">
<entry>
<key id="239" type="java.lang.String">IssuerQueueNmae</key>
<value id="240" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="241">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="242"/>
<persistent>false</persistent>
<value id="243" type="java.lang.String">jms/queue/issuer</value>
</value>
</entry>
<entry>
<key id="244" type="java.lang.String">ParallelBranches</key>
<value id="245" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="246">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<persistent>false</persistent>
<value id="247" type="java.lang.Integer">2</value>
</value>
</entry>
<entry>
<key id="248" type="java.lang.String">instMnem</key>
<value id="249" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="250">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="251">the inst_mnem for a single FINS to be derived</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="252" type="java.lang.String">jobId</key>
<value id="253" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="254">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
</variables>
<version>11</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
