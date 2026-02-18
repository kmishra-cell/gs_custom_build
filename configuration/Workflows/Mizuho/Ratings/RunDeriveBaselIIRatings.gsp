<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.07">
<package-comment/>
<businessobject displayString="5 - RemotePubAddedV10" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>false</alwaysPersist>
<clustered>true</clustered>
<comment id="1">RemotePubAddedV10</comment>
<description id="2">Commit CalculatePortfolio</description>
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
<name id="12">Delete ISGP</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="13">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="14" type="java.util.HashSet">
<item id="15" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="16">database</name>
<stringValue id="17">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="18" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="19">querySQL</name>
<stringValue id="20">delete from ft_t_isgp where prnt_iss_grp_oid = 'ISGR000011' and prt_purp_typ = 'PRTFLIOC'&#13;
and start_tms &lt;= current_timestamp and (end_tms is null or end_tms &gt; current_timestamp)</stringValue>
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
<name id="26">NOP</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="27">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="28" type="java.util.HashSet">
<item id="29" type="com.j2fe.workflow.definition.Transition">
<name id="30">goto-next</name>
<source id="31">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="32"/>
<directJoin>true</directJoin>
<name id="33">Synchronize</name>
<nodeHandler>com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandler>
<nodeHandlerClass id="34">com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandlerClass>
<sources id="35" type="java.util.HashSet">
<item id="36" type="com.j2fe.workflow.definition.Transition">
<name id="37">goto-next</name>
<source id="38">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="39"/>
<directJoin>false</directJoin>
<name id="40">MizBulkExtraction_RemoteEvent</name>
<nodeHandler>com.j2fe.event.RaiseEventRemote</nodeHandler>
<nodeHandlerClass id="41">com.j2fe.event.RaiseEventRemote</nodeHandlerClass>
<parameters id="42" type="java.util.HashSet">
<item id="43" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="44">eventName</name>
<stringValue id="45">MizBulkExtraction_Event</stringValue>
<type>CONSTANT</type>
</item>
<item id="46" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="47">["AuditId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="48">parameters["AuditId"]</name>
<stringValue id="49">auditIdentifier</stringValue>
<type>VARIABLE</type>
</item>
<item id="50" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="51">["ExtDefs"]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="52">parameters["ExtDefs"]</name>
<stringValue id="53">extDefsPerBranch</stringValue>
<type>VARIABLE</type>
</item>
<item id="54" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="55">["Handle Extraction Failures"]@com/thegoldensource/subscription/ExceptionHandlingMode@</UITypeHint>
<input>true</input>
<name id="56">parameters["Handle Extraction Failures"]</name>
<objectValue id="57" type="com.thegoldensource.subscription.ExceptionHandlingMode">DO_NOT_HANDLE</objectValue>
<type>CONSTANT</type>
</item>
<item id="58" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="59">["JMSDestination"]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="60">parameters["JMSDestination"]</name>
<stringValue id="61">JMSDestination</stringValue>
<type>VARIABLE</type>
</item>
<item id="62" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="63">["PublishingBulkSize"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="64">parameters["PublishingBulkSize"]</name>
<objectValue id="65" type="java.lang.Integer">100</objectValue>
<type>CONSTANT</type>
</item>
<item id="66" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="67">propertyFileLocation</name>
<stringValue id="68">db://resource/PublishingConfiguration/PublishingConfig.properties</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="69" type="java.util.HashSet">
<item id="70" type="com.j2fe.workflow.definition.Transition">
<name id="71">goto-next</name>
<source id="72">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="73"/>
<directJoin>true</directJoin>
<name id="74">Bulk Items</name>
<nodeHandler>com.j2fe.general.activities.BulkItems</nodeHandler>
<nodeHandlerClass id="75">com.j2fe.general.activities.BulkItems</nodeHandlerClass>
<parameters id="76" type="java.util.HashSet">
<item id="77" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="78">bulk</name>
<stringValue id="79">pubBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="80" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="81">input</name>
<stringValue id="82">extractDefinitions</stringValue>
<type>VARIABLE</type>
</item>
<item id="83" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="84">output</name>
<stringValue id="85">extDefsPerBranch</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="86" type="java.util.HashSet">
<item id="87" type="com.j2fe.workflow.definition.Transition">
<name id="88">goto-next</name>
<source id="89">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="90"/>
<directJoin>false</directJoin>
<name id="91">Bean Shell Script (Standard)</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="92">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="93" type="java.util.HashSet">
<item id="94" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="95">statements</name>
<stringValue id="96">if(NoOfThreads &lt;= 0) {
	NoOfThreads = 1;
}
else if(items &lt; NoOfThreads)
{
NoOfThreads = items;
}
bulkSize = items / NoOfThreads;
if(items % NoOfThreads != 0)
{
bulkSize = bulkSize +1;
}</stringValue>
<type>CONSTANT</type>
</item>
<item id="97" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="98">["NoOfThreads"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="99">variables["NoOfThreads"]</name>
<objectValue id="100" type="java.lang.Integer">20</objectValue>
<type>CONSTANT</type>
</item>
<item id="101" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="102">["bulkSize"]@java/lang/Integer@</UITypeHint>
<input>false</input>
<name id="103">variables["bulkSize"]</name>
<stringValue id="104">pubBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="105" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="106">["items"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="107">variables["items"]</name>
<stringValue id="108">extractDefinitions</stringValue>
<type>VARIABLE</type>
<variablePart id="109">length</variablePart>
</item>
</parameters>
<sources id="110" type="java.util.HashSet">
<item id="111" type="com.j2fe.workflow.definition.Transition">
<name id="112">extraction</name>
<source id="113">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="114"/>
<directJoin>false</directJoin>
<name id="115">Asset Extraction Log</name>
<nodeHandler>com.thegoldensource.publishing.activity.WriteExtractionLog</nodeHandler>
<nodeHandlerClass id="116">com.thegoldensource.publishing.activity.WriteExtractionLog</nodeHandlerClass>
<parameters id="117" type="java.util.HashSet">
<item id="118" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="119">auditId</name>
<stringValue id="120">auditIdentifier</stringValue>
<type>VARIABLE</type>
</item>
<item id="121" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="122">entityMode</name>
<stringValue id="123">MODEL_ENTITY</stringValue>
<type>CONSTANT</type>
</item>
<item id="124" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="125">eql</name>
<stringValue id="126">&lt;sql&gt;instr_id in (select instr_id from ft_t_isgp where prnt_iss_grp_oid = 'ISGR000011' and prt_purp_typ = 'PRTFLIOC' and start_tms &lt;= current_timestamp and (end_tms is null or end_tms &gt; current_timestamp))
and instr_id in (select instr_id from ft_t_isgp where prt_purp_typ = 'INTEREST' and PRNT_ISS_GRP_OID not in (select ISS_GRP_OID from FT_T_ISGR where GRP_NME like 'MHSC%')  and start_tms &lt;= current_timestamp and (end_tms is null or end_tms &gt; current_timestamp))&lt;/sql&gt;</stringValue>
<type>CONSTANT</type>
</item>
<item id="127" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="128">extractDefinitions</name>
<stringValue id="129">extractDefinitions</stringValue>
<type>VARIABLE</type>
</item>
<item id="130" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="131">extractorFactory</name>
<stringValue id="132">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="133" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="134">maxExtractCount</name>
<stringValue id="135">100</stringValue>
<type>CONSTANT</type>
</item>
<item id="136" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="137">modelName</name>
<stringValue id="138">ISSUPUB</stringValue>
<type>CONSTANT</type>
</item>
<item id="139" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="140">queryParameter</name>
<stringValue id="141">queryParameter</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="142" type="java.util.HashSet">
<item id="143" type="com.j2fe.workflow.definition.Transition">
<name id="144">goto-next</name>
<source id="145">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="146"/>
<directJoin>false</directJoin>
<name id="147">NOP</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="148">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="149" type="java.util.HashSet">
<item id="150" type="com.j2fe.workflow.definition.Transition">
<name id="151">end-loop</name>
<source id="152">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="153"/>
<directJoin>false</directJoin>
<name id="154">Loop the issuers</name>
<nodeHandler>com.j2fe.workflow.handler.impl.ForEach</nodeHandler>
<nodeHandlerClass id="155">com.j2fe.workflow.handler.impl.ForEach</nodeHandlerClass>
<parameters id="156" type="java.util.HashSet">
<item id="157" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="158">counter</name>
<stringValue id="159">LoopCounter</stringValue>
<type>VARIABLE</type>
</item>
<item id="160" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="161">counter</name>
<stringValue id="162">LoopCounter</stringValue>
<type>VARIABLE</type>
</item>
<item id="163" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="164">input</name>
<stringValue id="165">Issuers</stringValue>
<type>VARIABLE</type>
</item>
<item id="166" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="167">output</name>
<stringValue id="168">Issuer</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="169" type="java.util.HashSet">
<item id="170" type="com.j2fe.workflow.definition.Transition">
<name id="171">ToSplit</name>
<source id="172">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="173">Automatically generated</description>
<directJoin>false</directJoin>
<name id="174">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="175">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="176" type="java.util.HashSet">
<item id="177" type="com.j2fe.workflow.definition.Transition">
<name id="178">goto-next</name>
<source id="179">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="180"/>
<directJoin>false</directJoin>
<name id="181">NOP</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="182">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="183" type="java.util.HashSet">
<item id="184" type="com.j2fe.workflow.definition.Transition">
<name id="185">goto-next</name>
<source id="186">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="187"/>
<directJoin>false</directJoin>
<name id="188">Reset MIZRECAL for Issuer</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="189">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="190" type="java.util.HashSet">
<item id="191" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="192">database</name>
<stringValue id="193">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="194" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="195">indexedParameters[0]</name>
<stringValue id="196">Issuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="197" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="198">querySQL</name>
<stringValue id="199">update FT_T_ISST&#13;
set STAT_CHAR_VAL_TXT = 'N', LAST_CHG_USR_ID = 'FRTBRecalc', LAST_CHG_TMS = current_timestamp&#13;
where STAT_DEF_ID = 'MIZRECAL' and STAT_CHAR_VAL_TXT = 'Y' and END_TMS is NULL and LAST_CHG_USR_ID = 'FRTBRecalc'&#13;
and INSTR_ID in (select INSTR_ID from FT_T_ISSU where END_TMS is NULL and INSTR_ISSR_ID = ? and ISS_TYP = 'PORT')</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="200" type="java.util.HashSet">
<item id="201" type="com.j2fe.workflow.definition.Transition">
<name id="202">goto-next</name>
<source id="203">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="204"/>
<directJoin>false</directJoin>
<name id="205">Calculate Basel II</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="206">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="207" type="java.util.HashSet">
<item id="208" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="209">["Issuer"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="210">input["Issuer"]</name>
<stringValue id="211">Issuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="212" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="213">name</name>
<stringValue id="214">DeriveBaselIIAsetRating</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="215" type="java.util.HashSet">
<item id="216" type="com.j2fe.workflow.definition.Transition">
<name id="217">goto-next</name>
<source id="218">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="219"/>
<directJoin>false</directJoin>
<name id="220">Set MIZRECAL for Issuer</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="221">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="222" type="java.util.HashSet">
<item id="223" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="224">database</name>
<stringValue id="225">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="226" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="227">indexedParameters[0]</name>
<stringValue id="228">Issuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="229" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="230">querySQL</name>
<stringValue id="231">update FT_T_ISST&#13;
set STAT_CHAR_VAL_TXT = 'Y', LAST_CHG_USR_ID = 'FRTBRecalc', LAST_CHG_TMS = current_timestamp&#13;
where STAT_DEF_ID = 'MIZRECAL' and STAT_CHAR_VAL_TXT != 'Y' and END_TMS is NULL&#13;
and INSTR_ID in (select INSTR_ID from FT_T_ISSU where END_TMS is NULL and INSTR_ISSR_ID = ? and ISS_TYP = 'PORT')</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="232" type="java.util.HashSet">
<item id="233" type="com.j2fe.workflow.definition.Transition">
<name id="234">loop</name>
<source idref="152"/>
<target idref="218"/>
</item>
</sources>
<targets id="235" type="java.util.HashSet">
<item idref="216" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="203"/>
</item>
</sources>
<targets id="236" type="java.util.HashSet">
<item idref="201" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="186"/>
</item>
</sources>
<targets id="237" type="java.util.HashSet">
<item idref="184" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="179"/>
</item>
</sources>
<targets id="238" type="java.util.HashSet">
<item idref="177" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="172"/>
</item>
<item id="239" type="com.j2fe.workflow.definition.Transition">
<name id="240">rows-found</name>
<source id="241">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="242"/>
<directJoin>false</directJoin>
<name id="243">Get Issuer</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="244">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="245" type="java.util.HashSet">
<item id="246" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="247">database</name>
<stringValue id="248">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="249" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="250">firstColumnsResult</name>
<stringValue id="251">Issuers</stringValue>
<type>VARIABLE</type>
</item>
<item id="252" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="253">mappedParameters["1"]</name>
<stringValue id="254">ioiPurpTyp</stringValue>
<type>VARIABLE</type>
</item>
<item id="255" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="256">querySQL</name>
<stringValue id="257">SELECT INSTR_ISSR_ID FROM FT_T_ISSR ISSR&#13;
WHERE&#13;
-- There is a portfolio instrument&#13;
EXISTS(SELECT 1 FROM FT_T_ISSU ISSU WHERE ISS_TYP = 'PORT' &#13;
AND ISSU.INSTR_ISSR_ID = ISSR.INSTR_ISSR_ID AND ISSU.START_TMS &lt;= current_timestamp &#13;
AND (ISSU.END_TMS IS NULL OR END_TMS &gt; current_timestamp))&#13;
-- The issuer is in an Of Interest group&#13;
AND EXISTS (SELECT 1 FROM FT_T_IRGP IRGP WHERE IRGP.PRT_PURP_TYP= ? AND IRGP.INSTR_ISSR_ID = ISSR.INSTR_ISSR_ID AND IRGP.START_TMS &lt;= current_timestamp AND (IRGP.END_TMS IS NULL OR IRGP.END_TMS &gt; current_timestamp) )</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="258" type="java.util.HashSet">
<item id="259" type="com.j2fe.workflow.definition.Transition">
<name id="260">Y</name>
<source id="261">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="262"/>
<directJoin>false</directJoin>
<name id="263">Scheduled?</name>
<nodeHandler>com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandler>
<nodeHandlerClass id="264">com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandlerClass>
<parameters id="265" type="java.util.HashSet">
<item id="266" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="267">caseItem</name>
<stringValue id="268">Scheduled</stringValue>
<type>VARIABLE</type>
</item>
<item id="269" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="270">defaultItem</name>
<stringValue id="271">N</stringValue>
<type>CONSTANT</type>
</item>
<item id="272" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="273">nullTransition</name>
<stringValue id="274">N</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="275" type="java.util.HashSet">
<item id="276" type="com.j2fe.workflow.definition.Transition">
<name id="277">goto-next</name>
<source id="278">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="279"/>
<directJoin>false</directJoin>
<name id="280">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="281">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="282" type="java.util.HashSet"/>
<targets id="283" type="java.util.HashSet">
<item idref="276" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="261"/>
</item>
</sources>
<targets id="284" type="java.util.HashSet">
<item id="285" type="com.j2fe.workflow.definition.Transition">
<name id="286">N</name>
<source idref="261"/>
<target id="287">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="288"/>
<directJoin>false</directJoin>
<name id="289">Set MIZRECAL for Issuer</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="290">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="291" type="java.util.HashSet">
<item id="292" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="293">database</name>
<stringValue id="294">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="295" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="296">indexedParameters[0]</name>
<stringValue id="297">Issuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="298" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="299">querySQL</name>
<stringValue id="300">update FT_T_ISST&#13;
set STAT_CHAR_VAL_TXT = 'Y', LAST_CHG_USR_ID = 'FRTBRecalc', LAST_CHG_TMS = current_timestamp&#13;
where STAT_DEF_ID = 'MIZRECAL' and STAT_CHAR_VAL_TXT != 'Y' and END_TMS is NULL&#13;
and INSTR_ID in (select INSTR_ID from FT_T_ISSU where END_TMS is NULL and INSTR_ISSR_ID = ? and ISS_TYP = 'PORT')</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="301" type="java.util.HashSet">
<item idref="285" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="302" type="java.util.HashSet">
<item id="303" type="com.j2fe.workflow.definition.Transition">
<name id="304">goto-next</name>
<source idref="287"/>
<target id="305">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="306"/>
<directJoin>false</directJoin>
<name id="307">Calculate Basel II</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="308">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="309" type="java.util.HashSet">
<item id="310" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="311">["Issuer"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="312">input["Issuer"]</name>
<stringValue id="313">Issuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="314" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="315">name</name>
<stringValue id="316">DeriveBaselIIAsetRating</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="317" type="java.util.HashSet">
<item idref="303" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="318" type="java.util.HashSet">
<item id="319" type="com.j2fe.workflow.definition.Transition">
<name id="320">goto-next</name>
<source idref="305"/>
<target id="321">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="322"/>
<directJoin>false</directJoin>
<name id="323">Reset MIZRECAL for Issuer</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="324">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="325" type="java.util.HashSet">
<item id="326" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="327">database</name>
<stringValue id="328">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="329" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="330">indexedParameters[0]</name>
<stringValue id="331">Issuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="332" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="333">querySQL</name>
<stringValue id="334">update FT_T_ISST&#13;
set STAT_CHAR_VAL_TXT = 'N', LAST_CHG_USR_ID = 'FRTBRecalc', LAST_CHG_TMS = current_timestamp&#13;
where STAT_DEF_ID = 'MIZRECAL' and STAT_CHAR_VAL_TXT = 'Y' and END_TMS is NULL and LAST_CHG_USR_ID = 'FRTBRecalc'&#13;
and INSTR_ID in (select INSTR_ID from FT_T_ISSU where END_TMS is NULL and INSTR_ISSR_ID = ? and ISS_TYP = 'PORT')</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="335" type="java.util.HashSet">
<item idref="319" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="336" type="java.util.HashSet">
<item id="337" type="com.j2fe.workflow.definition.Transition">
<name id="338">goto-next</name>
<source idref="321"/>
<target idref="145"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item idref="259" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="241"/>
</item>
</sources>
<targets id="339" type="java.util.HashSet">
<item id="340" type="com.j2fe.workflow.definition.Transition">
<name id="341">nothing-found</name>
<source idref="241"/>
<target idref="145"/>
</item>
<item idref="239" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="172"/>
</item>
</sources>
<targets id="342" type="java.util.HashSet">
<item idref="170" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="152"/>
</item>
</sources>
<targets id="343" type="java.util.HashSet">
<item idref="150" type="com.j2fe.workflow.definition.Transition"/>
<item idref="233" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="145"/>
</item>
<item idref="337" type="com.j2fe.workflow.definition.Transition"/>
<item idref="340" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="344" type="java.util.HashSet">
<item idref="143" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="113"/>
</item>
</sources>
<targets id="345" type="java.util.HashSet">
<item idref="111" type="com.j2fe.workflow.definition.Transition"/>
<item id="346" type="com.j2fe.workflow.definition.Transition">
<name id="347">no-extraction</name>
<source idref="113"/>
<target idref="3"/>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="89"/>
</item>
</sources>
<targets id="348" type="java.util.HashSet">
<item idref="87" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="72"/>
</item>
</sources>
<targets id="349" type="java.util.HashSet">
<item idref="70" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDSPLIT</type>
</source>
<target idref="38"/>
</item>
</sources>
<targets id="350" type="java.util.HashSet">
<item idref="36" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="31"/>
</item>
</sources>
<targets id="351" type="java.util.HashSet">
<item idref="29" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDJOIN</type>
</source>
<target idref="24"/>
</item>
</sources>
<targets id="352" type="java.util.HashSet">
<item idref="22" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="10"/>
</item>
</sources>
<targets id="353" type="java.util.HashSet">
<item idref="8" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="3"/>
</item>
<item idref="346" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="354" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="355">Mizuho/Ratings</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="356">user1</lastChangeUser>
<lastUpdate id="357">2025-12-19T07:36:34.000+0000</lastUpdate>
<name id="358">RunDeriveBaselIIRatings</name>
<nodes id="359" type="java.util.HashSet">
<item idref="113" type="com.j2fe.workflow.definition.Node"/>
<item idref="89" type="com.j2fe.workflow.definition.Node"/>
<item idref="72" type="com.j2fe.workflow.definition.Node"/>
<item idref="203" type="com.j2fe.workflow.definition.Node"/>
<item idref="305" type="com.j2fe.workflow.definition.Node"/>
<item idref="10" type="com.j2fe.workflow.definition.Node"/>
<item idref="241" type="com.j2fe.workflow.definition.Node"/>
<item idref="152" type="com.j2fe.workflow.definition.Node"/>
<item idref="172" type="com.j2fe.workflow.definition.Node"/>
<item idref="38" type="com.j2fe.workflow.definition.Node"/>
<item idref="179" type="com.j2fe.workflow.definition.Node"/>
<item idref="145" type="com.j2fe.workflow.definition.Node"/>
<item idref="24" type="com.j2fe.workflow.definition.Node"/>
<item idref="321" type="com.j2fe.workflow.definition.Node"/>
<item idref="186" type="com.j2fe.workflow.definition.Node"/>
<item idref="261" type="com.j2fe.workflow.definition.Node"/>
<item idref="218" type="com.j2fe.workflow.definition.Node"/>
<item idref="287" type="com.j2fe.workflow.definition.Node"/>
<item idref="278" type="com.j2fe.workflow.definition.Node"/>
<item idref="3" type="com.j2fe.workflow.definition.Node"/>
<item idref="31" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>true</optimize>
<parameter id="360" type="java.util.HashMap">
<entry>
<key id="361" type="java.lang.String">Issuer</key>
<value id="362" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="363">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="364" type="java.lang.String">JMSDestination</key>
<value id="365" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="366">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="367"/>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="368" type="java.lang.String">OutputMsg</key>
<value id="369" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="370">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>false</input>
<output>true</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="371" type="java.lang.String">Scheduled</key>
<value id="372" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="373">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
</parameter>
<permissions id="374" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>false</purgeAtEnd>
<retries>0</retries>
<startNode idref="278"/>
<status>RELEASED</status>
<variables id="375" type="java.util.HashMap">
<entry>
<key id="376" type="java.lang.String">Issuer</key>
<value id="377" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="378">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="379" type="java.lang.String">JMSDestination</key>
<value id="380" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="381">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="382"/>
<persistent>false</persistent>
<value id="383" type="java.lang.String">jms/queue/security</value>
</value>
</entry>
<entry>
<key id="384" type="java.lang.String">LoopCounter</key>
<value id="385" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="386">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<persistent>false</persistent>
<value id="387" type="java.lang.Integer">0</value>
</value>
</entry>
<entry>
<key id="388" type="java.lang.String">OutputMsg</key>
<value id="389" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="390">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="391" type="java.lang.String">&lt;?xml version="1.0" encoding="UTF-8"?&gt;&lt;OutputMsg&gt;Portfolio Recalculated, Please click on Reload Entity&lt;/OutputMsg&gt;</value>
</value>
</entry>
<entry>
<key id="392" type="java.lang.String">Scheduled</key>
<value id="393" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="394">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="395" type="java.lang.String">N</value>
</value>
</entry>
<entry>
<key id="396" type="java.lang.String">ioiPurpTyp</key>
<value id="397" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="398">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="399" type="java.lang.String">INTEREST</value>
</value>
</entry>
</variables>
<version>5</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
