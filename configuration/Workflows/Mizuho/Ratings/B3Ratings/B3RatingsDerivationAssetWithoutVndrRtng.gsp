<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.07">
<package-comment/>
<businessobject displayString="9 - GU-311 v10" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>false</alwaysPersist>
<clustered>true</clustered>
<comment id="1">GU-311 v10</comment>
<endNode id="2">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="3">Stop</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="4">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="5" type="java.util.HashSet">
<item id="6" type="com.j2fe.workflow.definition.Transition">
<name id="7">goto-next</name>
<source id="8">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="9">NOP</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="10">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="11" type="java.util.HashSet">
<item id="12" type="com.j2fe.workflow.definition.Transition">
<name id="13">goto-next</name>
<source id="14">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="15">NOP</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="16">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="17" type="java.util.HashSet">
<item id="18" type="com.j2fe.workflow.definition.Transition">
<name id="19">goto-next</name>
<source id="20">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<directJoin>true</directJoin>
<name id="21">Synchronize</name>
<nodeHandler>com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandler>
<nodeHandlerClass id="22">com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandlerClass>
<sources id="23" type="java.util.HashSet">
<item id="24" type="com.j2fe.workflow.definition.Transition">
<name id="25">goto-next</name>
<source id="26">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="27"/>
<directJoin>false</directJoin>
<name id="28">Raise Event Remote #1</name>
<nodeHandler>com.j2fe.event.RaiseEventRemote</nodeHandler>
<nodeHandlerClass id="29">com.j2fe.event.RaiseEventRemote</nodeHandlerClass>
<parameters id="30" type="java.util.HashSet">
<item id="31" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="32">eventName</name>
<stringValue id="33">MizBulkExtractionEvent</stringValue>
<type>CONSTANT</type>
</item>
<item id="34" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="35">["AuditId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="36">parameters["AuditId"]</name>
<stringValue id="37">auditIdentifier</stringValue>
<type>VARIABLE</type>
</item>
<item id="38" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="39">["ExtDefs"]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="40">parameters["ExtDefs"]</name>
<stringValue id="41">extDefsPerBranch</stringValue>
<type>VARIABLE</type>
</item>
<item id="42" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="43">["Handle Extraction Failures"]@com/thegoldensource/subscription/ExceptionHandlingMode@</UITypeHint>
<input>true</input>
<name id="44">parameters["Handle Extraction Failures"]</name>
<objectValue id="45" type="com.thegoldensource.subscription.ExceptionHandlingMode">DO_NOT_HANDLE</objectValue>
<type>CONSTANT</type>
</item>
<item id="46" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="47">["JMSDestination"]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="48">parameters["JMSDestination"]</name>
<stringValue id="49">JMSSecurityQueueNmae</stringValue>
<type>VARIABLE</type>
</item>
<item id="50" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="51">["PublishingBulkSize"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="52">parameters["PublishingBulkSize"]</name>
<stringValue id="53">bulkSplitSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="54" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="55">propertyFileLocation</name>
<stringValue id="56">db://resource/PublishingConfiguration/PublishingConfig.properties</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="57" type="java.util.HashSet">
<item id="58" type="com.j2fe.workflow.definition.Transition">
<name id="59">goto-next</name>
<source id="60">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<directJoin>true</directJoin>
<name id="61">Bulk Items</name>
<nodeHandler>com.j2fe.general.activities.BulkItems</nodeHandler>
<nodeHandlerClass id="62">com.j2fe.general.activities.BulkItems</nodeHandlerClass>
<parameters id="63" type="java.util.HashSet">
<item id="64" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="65">bulk</name>
<stringValue id="66">bulkSplitSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="67" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="68">input</name>
<stringValue id="69">extractDefinitions</stringValue>
<type>VARIABLE</type>
</item>
<item id="70" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="71">output</name>
<stringValue id="72">extDefsPerBranch</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="73" type="java.util.HashSet">
<item id="74" type="com.j2fe.workflow.definition.Transition">
<name id="75">extraction</name>
<source id="76">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="77">Extraction Log</name>
<nodeHandler>com.thegoldensource.publishing.activity.WriteExtractionLog</nodeHandler>
<nodeHandlerClass id="78">com.thegoldensource.publishing.activity.WriteExtractionLog</nodeHandlerClass>
<parameters id="79" type="java.util.HashSet">
<item id="80" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="81">auditId</name>
<stringValue id="82">auditIdentifier</stringValue>
<type>VARIABLE</type>
</item>
<item id="83" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="84">entityMode</name>
<stringValue id="85">MODEL_ENTITY</stringValue>
<type>CONSTANT</type>
</item>
<item id="86" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="87">eql</name>
<stringValue id="88">pubExtQry</stringValue>
<type>VARIABLE</type>
</item>
<item id="89" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="90">extractDefinitions</name>
<stringValue id="91">extractDefinitions</stringValue>
<type>VARIABLE</type>
</item>
<item id="92" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="93">extractorFactory</name>
<stringValue id="94">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="95" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="96">maxExtractCount</name>
<stringValue id="97">bulkSplitSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="98" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="99">modelName</name>
<stringValue id="100">ISSUPUB</stringValue>
<type>CONSTANT</type>
</item>
<item id="101" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="102">queryParameter</name>
<stringValue id="103">queryParameter</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="104" type="java.util.HashSet">
<item id="105" type="com.j2fe.workflow.definition.Transition">
<name id="106">ToSplit</name>
<source id="107">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="108">Automatically generated</description>
<directJoin>false</directJoin>
<name id="109">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="110">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="111" type="java.util.HashSet">
<item id="112" type="com.j2fe.workflow.definition.Transition">
<name id="113">goto-next</name>
<source id="114">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>true</directJoin>
<name id="115">Synchronize</name>
<nodeHandler>com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandler>
<nodeHandlerClass id="116">com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandlerClass>
<sources id="117" type="java.util.HashSet">
<item id="118" type="com.j2fe.workflow.definition.Transition">
<name id="119">goto-next</name>
<source id="120">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="121">Call Subworkflow</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="122">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="123" type="java.util.HashSet">
<item id="124" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="125">["JobID"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="126">input["JobID"]</name>
<stringValue id="127">jobId</stringValue>
<type>VARIABLE</type>
</item>
<item id="128" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="129">["bulkRealMsgs"]@[Ljava/lang/String;@</UITypeHint>
<input>true</input>
<name id="130">input["bulkRealMsgs"]</name>
<stringValue id="131">RealMsgsBulk</stringValue>
<type>VARIABLE</type>
</item>
<item id="132" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="133">name</name>
<stringValue id="134">B3RealMessageProcessorBulkWrapper</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="135" type="java.util.HashSet">
<item id="136" type="com.j2fe.workflow.definition.Transition">
<name id="137">goto-next</name>
<source id="138">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>true</directJoin>
<name id="139">Bulk Items</name>
<nodeHandler>com.j2fe.general.activities.BulkItems</nodeHandler>
<nodeHandlerClass id="140">com.j2fe.general.activities.BulkItems</nodeHandlerClass>
<parameters id="141" type="java.util.HashSet">
<item id="142" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="143">bulk</name>
<stringValue id="144">bulkSplitSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="145" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="146">input</name>
<stringValue id="147">StreetRefMsgList</stringValue>
<type>VARIABLE</type>
</item>
<item id="148" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="149">output</name>
<stringValue id="150">RealMsgsBulk</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="151" type="java.util.HashSet">
<item id="152" type="com.j2fe.workflow.definition.Transition">
<name id="153">goto-next</name>
<source id="154">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="155">Thread to Bulk Pub Qry</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="156">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="157" type="java.util.HashSet">
<item id="158" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="159">statements</name>
<stringValue id="160">if(NoOfThreads &lt;= 0) {
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

String pubExtQry = "&lt;sql&gt; INSTR_ID IN ( SELECT INSTR_ID FROM FT_T_ISSU ISSU, FT_T_ISSR ISSR WHERE ISSU.INSTR_ISSR_ID = ISSR.INSTR_ISSR_ID AND ISSR.FINS_INST_MNEM = '"+instMnem+"' " +
    					" AND EXISTS (SELECT 1 FROM FT_T_MSGP MSGP, FT_T_TRID TRID WHERE "+jobIdQryPrt+"  TRID.TRN_ID = MSGP.TRN_ID " +
    					" AND XREF_TBL_ROW_OID  = ISSU.INSTR_ID  AND ENTITY_CHG_IND IN ('C','U') )) &lt;/sql&gt;";</stringValue>
<type>CONSTANT</type>
</item>
<item id="161" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="162">["NoOfThreads"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="163">variables["NoOfThreads"]</name>
<stringValue id="164">ParallelBranches</stringValue>
<type>VARIABLE</type>
</item>
<item id="165" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="166">["bulkSize"]@java/lang/Integer@</UITypeHint>
<input>false</input>
<name id="167">variables["bulkSize"]</name>
<stringValue id="168">bulkSplitSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="169" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="170">["instMnem"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="171">variables["instMnem"]</name>
<stringValue id="172">instMnem</stringValue>
<type>VARIABLE</type>
</item>
<item id="173" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="174">["items"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="175">variables["items"]</name>
<stringValue id="176">StreetRefMsgList</stringValue>
<type>VARIABLE</type>
<variablePart id="177">length</variablePart>
</item>
<item id="178" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="179">["jobId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="180">variables["jobId"]</name>
<stringValue id="181">jobId</stringValue>
<type>VARIABLE</type>
</item>
<item id="182" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="183">["pubExtQry"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="184">variables["pubExtQry"]</name>
<stringValue id="185">pubExtQry</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="186" type="java.util.HashSet">
<item id="187" type="com.j2fe.workflow.definition.Transition">
<name id="188">rows-found</name>
<source id="189">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="190">StreetRef Selector</name>
<nodeHandler>com.j2fe.general.activities.database.XMLQuery</nodeHandler>
<nodeHandlerClass id="191">com.j2fe.general.activities.database.XMLQuery</nodeHandlerClass>
<parameters id="192" type="java.util.HashSet">
<item id="193" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="194">database</name>
<stringValue id="195">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="196" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="197">[0]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="198">indexedParameters[0]</name>
<stringValue id="199">instMnem</stringValue>
<type>VARIABLE</type>
</item>
<item id="200" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="201">queryName</name>
<stringValue id="202">Basel3AssetRatingsWithoutVndrRtgStreetRefQuery</stringValue>
<type>CONSTANT</type>
</item>
<item id="203" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="204">result</name>
<stringValue id="205">StreetRefMsgList</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="206" type="java.util.HashSet">
<item id="207" type="com.j2fe.workflow.definition.Transition">
<name id="208">goto-next</name>
<source id="209">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="210">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="211">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="212" type="java.util.HashSet"/>
<targets id="213" type="java.util.HashSet">
<item idref="207" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="189"/>
</item>
</sources>
<targets id="214" type="java.util.HashSet">
<item id="215" type="com.j2fe.workflow.definition.Transition">
<name id="216">nothing-found</name>
<source idref="189"/>
<target id="217">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="218">Thread to Bulk Pub Qry</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="219">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="220" type="java.util.HashSet">
<item id="221" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="222">statements</name>
<stringValue id="223">int bulkSize = 100;

String jobIdQryPrt="TRID.JOB_ID = '"+jobId+"' AND";
if (jobId == null) {
jobIdQryPrt="TRID.INPUT_MSG_TYP='REAL' AND TRID.CREATED_TMS &gt; now()::DATE - 1/(24*60) AND";
}

String pubExtQry = "&lt;sql&gt; INSTR_ID IN ( SELECT INSTR_ID FROM FT_T_ISSU ISSU, FT_T_ISSR ISSR WHERE ISSU.INSTR_ISSR_ID = ISSR.INSTR_ISSR_ID AND ISSR.FINS_INST_MNEM = '"+instMnem+"' " +
    					" AND EXISTS (SELECT 1 FROM FT_T_MSGP MSGP, FT_T_TRID TRID WHERE "+jobIdQryPrt+"  TRID.TRN_ID = MSGP.TRN_ID " +
    					" AND XREF_TBL_ROW_OID  = ISSU.INSTR_ID  AND ENTITY_CHG_IND IN ('C','U') )) &lt;/sql&gt;";</stringValue>
<type>CONSTANT</type>
</item>
<item id="224" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="225">["NoOfThreads"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="226">variables["NoOfThreads"]</name>
<stringValue id="227">ParallelBranches</stringValue>
<type>VARIABLE</type>
</item>
<item id="228" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="229">["bulkSize"]@java/lang/Integer@</UITypeHint>
<input>false</input>
<name id="230">variables["bulkSize"]</name>
<stringValue id="231">bulkSplitSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="232" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="233">["instMnem"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="234">variables["instMnem"]</name>
<stringValue id="235">instMnem</stringValue>
<type>VARIABLE</type>
</item>
<item id="236" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="237">["jobId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="238">variables["jobId"]</name>
<stringValue id="239">jobId</stringValue>
<type>VARIABLE</type>
</item>
<item id="240" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="241">["pubExtQry"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="242">variables["pubExtQry"]</name>
<stringValue id="243">pubExtQry</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="244" type="java.util.HashSet">
<item idref="215" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="245" type="java.util.HashSet">
<item id="246" type="com.j2fe.workflow.definition.Transition">
<name id="247">goto-next</name>
<source idref="217"/>
<target idref="107"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item idref="187" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="154"/>
</item>
</sources>
<targets id="248" type="java.util.HashSet">
<item idref="152" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="138"/>
</item>
</sources>
<targets id="249" type="java.util.HashSet">
<item idref="136" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDSPLIT</type>
</source>
<target idref="120"/>
</item>
</sources>
<targets id="250" type="java.util.HashSet">
<item idref="118" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="114"/>
</item>
</sources>
<targets id="251" type="java.util.HashSet">
<item idref="112" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDJOIN</type>
</source>
<target idref="107"/>
</item>
<item idref="246" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="252" type="java.util.HashSet">
<item idref="105" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="76"/>
</item>
</sources>
<targets id="253" type="java.util.HashSet">
<item idref="74" type="com.j2fe.workflow.definition.Transition"/>
<item id="254" type="com.j2fe.workflow.definition.Transition">
<name id="255">no-extraction</name>
<source idref="76"/>
<target idref="14"/>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="60"/>
</item>
</sources>
<targets id="256" type="java.util.HashSet">
<item idref="58" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDSPLIT</type>
</source>
<target idref="26"/>
</item>
</sources>
<targets id="257" type="java.util.HashSet">
<item idref="24" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="20"/>
</item>
</sources>
<targets id="258" type="java.util.HashSet">
<item idref="18" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDJOIN</type>
</source>
<target idref="14"/>
</item>
<item idref="254" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="259" type="java.util.HashSet">
<item idref="12" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="8"/>
</item>
</sources>
<targets id="260" type="java.util.HashSet">
<item idref="6" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="2"/>
</item>
</sources>
<targets id="261" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="262">Mizuho/Ratings/B3Ratings</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="263">user1</lastChangeUser>
<lastUpdate id="264">2025-11-10T13:50:59.000+0000</lastUpdate>
<name id="265">B3RatingsDerivationAssetWithoutVndrRtng</name>
<nodes id="266" type="java.util.HashSet">
<item idref="138" type="com.j2fe.workflow.definition.Node"/>
<item idref="60" type="com.j2fe.workflow.definition.Node"/>
<item idref="120" type="com.j2fe.workflow.definition.Node"/>
<item idref="76" type="com.j2fe.workflow.definition.Node"/>
<item idref="107" type="com.j2fe.workflow.definition.Node"/>
<item idref="8" type="com.j2fe.workflow.definition.Node"/>
<item idref="14" type="com.j2fe.workflow.definition.Node"/>
<item idref="26" type="com.j2fe.workflow.definition.Node"/>
<item idref="209" type="com.j2fe.workflow.definition.Node"/>
<item idref="2" type="com.j2fe.workflow.definition.Node"/>
<item idref="189" type="com.j2fe.workflow.definition.Node"/>
<item idref="20" type="com.j2fe.workflow.definition.Node"/>
<item idref="114" type="com.j2fe.workflow.definition.Node"/>
<item idref="154" type="com.j2fe.workflow.definition.Node"/>
<item idref="217" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>true</optimize>
<parameter id="267" type="java.util.HashMap">
<entry>
<key id="268" type="java.lang.String">JMSSecurityQueueNmae</key>
<value id="269" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="270">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="271"/>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="272" type="java.lang.String">ParallelBranches</key>
<value id="273" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="274">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="275" type="java.lang.String">instMnem</key>
<value id="276" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="277">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="278" type="java.lang.String">jobId</key>
<value id="279" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="280">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
</parameter>
<permissions id="281" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>true</purgeAtEnd>
<retries>0</retries>
<startNode idref="209"/>
<status>RELEASED</status>
<variables id="282" type="java.util.HashMap">
<entry>
<key id="283" type="java.lang.String">JMSSecurityQueueNmae</key>
<value id="284" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="285">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="286"/>
<persistent>false</persistent>
<value id="287" type="java.lang.String">jms/queue/security</value>
</value>
</entry>
<entry>
<key id="288" type="java.lang.String">ParallelBranches</key>
<value id="289" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="290">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<persistent>false</persistent>
<value id="291" type="java.lang.Integer">2</value>
</value>
</entry>
<entry>
<key id="292" type="java.lang.String">instMnem</key>
<value id="293" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="294">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="295" type="java.lang.String">jobId</key>
<value id="296" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="297">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
</variables>
<version>9</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
