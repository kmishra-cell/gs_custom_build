<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.07">
<package-comment/>
<businessobject displayString="21 - Raise remote event added for Security pub" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>false</alwaysPersist>
<clustered>true</clustered>
<comment id="1">Raise remote event added for Security pub</comment>
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
<name id="11">Raise Event Remote #Call SFTR Quality NOAP</name>
<nodeHandler>com.j2fe.event.RaiseEventRemote</nodeHandler>
<nodeHandlerClass id="12">com.j2fe.event.RaiseEventRemote</nodeHandlerClass>
<parameters id="13" type="java.util.HashSet">
<item id="14" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="15">eventName</name>
<stringValue id="16">SFTR_Quality_NOAP_Event</stringValue>
<type>CONSTANT</type>
</item>
<item id="17" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="18">propertyFileLocation</name>
<stringValue id="19">db://resource/PublishingConfiguration/PublishingConfig.properties</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="20" type="java.util.HashSet">
<item id="21" type="com.j2fe.workflow.definition.Transition">
<name id="22">goto-next</name>
<source id="23">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="24"/>
<directJoin>false</directJoin>
<name id="25">Delete ISGP</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="26">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="27" type="java.util.HashSet">
<item id="28" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="29">database</name>
<stringValue id="30">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="31" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="32">querySQL</name>
<stringValue id="33">delete from ft_t_isgp where prnt_iss_grp_oid = 'ISGR000011' and prt_purp_typ = 'PRTFLIOP'&#13;
and start_tms &lt;= current_timestamp and (end_tms is null or end_tms &gt; current_timestamp)</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="34" type="java.util.HashSet">
<item id="35" type="com.j2fe.workflow.definition.Transition">
<name id="36">goto-next</name>
<source id="37">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="38"/>
<directJoin>true</directJoin>
<name id="39">Synchronize</name>
<nodeHandler>com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandler>
<nodeHandlerClass id="40">com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandlerClass>
<sources id="41" type="java.util.HashSet">
<item id="42" type="com.j2fe.workflow.definition.Transition">
<name id="43">goto-next</name>
<source id="44">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="45"/>
<directJoin>false</directJoin>
<name id="46">Raise Event Remote #1</name>
<nodeHandler>com.j2fe.event.RaiseEventRemote</nodeHandler>
<nodeHandlerClass id="47">com.j2fe.event.RaiseEventRemote</nodeHandlerClass>
<parameters id="48" type="java.util.HashSet">
<item id="49" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="50">eventName</name>
<stringValue id="51">MizBulkExtraction_Event</stringValue>
<type>CONSTANT</type>
</item>
<item id="52" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="53">["AuditId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="54">parameters["AuditId"]</name>
<stringValue id="55">auditIdentifier</stringValue>
<type>VARIABLE</type>
</item>
<item id="56" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="57">["ExtDefs"]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="58">parameters["ExtDefs"]</name>
<stringValue id="59">extDefsPerBranch</stringValue>
<type>VARIABLE</type>
</item>
<item id="60" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="61">["Handle Extraction Failures"]@com/thegoldensource/subscription/ExceptionHandlingMode@</UITypeHint>
<input>true</input>
<name id="62">parameters["Handle Extraction Failures"]</name>
<objectValue id="63" type="com.thegoldensource.subscription.ExceptionHandlingMode">DO_NOT_HANDLE</objectValue>
<type>CONSTANT</type>
</item>
<item id="64" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="65">["JMSDestination"]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="66">parameters["JMSDestination"]</name>
<stringValue id="67">JMSdestination</stringValue>
<type>VARIABLE</type>
</item>
<item id="68" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="69">["PublishingBulkSize"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="70">parameters["PublishingBulkSize"]</name>
<objectValue id="71" type="java.lang.Integer">100</objectValue>
<type>CONSTANT</type>
</item>
<item id="72" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="73">propertyFileLocation</name>
<stringValue id="74">db://resource/PublishingConfiguration/PublishingConfig.properties</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="75" type="java.util.HashSet">
<item id="76" type="com.j2fe.workflow.definition.Transition">
<name id="77">goto-next</name>
<source id="78">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="79"/>
<directJoin>true</directJoin>
<name id="80">Bulk Items</name>
<nodeHandler>com.j2fe.general.activities.BulkItems</nodeHandler>
<nodeHandlerClass id="81">com.j2fe.general.activities.BulkItems</nodeHandlerClass>
<parameters id="82" type="java.util.HashSet">
<item id="83" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="84">bulk</name>
<stringValue id="85">pubBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="86" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="87">input</name>
<stringValue id="88">extractDefinitions</stringValue>
<type>VARIABLE</type>
</item>
<item id="89" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="90">output</name>
<stringValue id="91">extDefsPerBranch</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="92" type="java.util.HashSet">
<item id="93" type="com.j2fe.workflow.definition.Transition">
<name id="94">goto-next</name>
<source id="95">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="96"/>
<directJoin>false</directJoin>
<name id="97">Bean Shell Script (Standard)</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="98">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="99" type="java.util.HashSet">
<item id="100" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="101">statements</name>
<stringValue id="102">int bulkSize;&#13;
if(items &lt; 20)&#13;
{&#13;
bulkSize = 1;&#13;
}&#13;
else {&#13;
bulkSize = items / 20;&#13;
	if(items % 20 != 0)&#13;
	{&#13;
	bulkSize = bulkSize +1;&#13;
	}&#13;
}&#13;
</stringValue>
<type>CONSTANT</type>
</item>
<item id="103" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="104">["NoOfThreads"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="105">variables["NoOfThreads"]</name>
<objectValue id="106" type="java.lang.Integer">20</objectValue>
<type>CONSTANT</type>
</item>
<item id="107" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="108">["bulkSize"]@java/lang/Integer@</UITypeHint>
<input>false</input>
<name id="109">variables["bulkSize"]</name>
<stringValue id="110">pubBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="111" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="112">["items"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="113">variables["items"]</name>
<stringValue id="114">extractDefinitions</stringValue>
<type>VARIABLE</type>
<variablePart id="115">length</variablePart>
</item>
</parameters>
<sources id="116" type="java.util.HashSet">
<item id="117" type="com.j2fe.workflow.definition.Transition">
<name id="118">extraction</name>
<source id="119">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="120"/>
<directJoin>false</directJoin>
<name id="121">Asset Extraction</name>
<nodeHandler>com.thegoldensource.publishing.activity.WriteExtractionLog</nodeHandler>
<nodeHandlerClass id="122">com.thegoldensource.publishing.activity.WriteExtractionLog</nodeHandlerClass>
<parameters id="123" type="java.util.HashSet">
<item id="124" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="125">auditId</name>
<stringValue id="126">auditIdentifier</stringValue>
<type>VARIABLE</type>
</item>
<item id="127" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="128">entityMode</name>
<stringValue id="129">MODEL_ENTITY</stringValue>
<type>CONSTANT</type>
</item>
<item id="130" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="131">eql</name>
<stringValue id="132">&lt;sql&gt;instr_id in (select instr_id from ft_t_isgp where prnt_iss_grp_oid = 'ISGR000011' and prt_purp_typ = 'PRTFLIOP' and start_tms &lt;= current_timestamp and (end_tms is null or end_tms &gt; current_timestamp))&#13;
and instr_id in (select instr_id from ft_t_isgp where prt_purp_typ = 'INTEREST' and PRNT_ISS_GRP_OID not in (select ISS_GRP_OID from FT_T_ISGR where GRP_NME like 'MHSC%') and start_tms &lt;= current_timestamp and (end_tms is null or end_tms &gt; current_timestamp))&lt;/sql&gt;</stringValue>
<type>CONSTANT</type>
</item>
<item id="133" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="134">extractDefinitions</name>
<stringValue id="135">extractDefinitions</stringValue>
<type>VARIABLE</type>
</item>
<item id="136" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="137">extractorFactory</name>
<stringValue id="138">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="139" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="140">maxExtractCount</name>
<stringValue id="141">100</stringValue>
<type>CONSTANT</type>
</item>
<item id="142" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="143">modelName</name>
<stringValue id="144">ISSUPUB</stringValue>
<type>CONSTANT</type>
</item>
<item id="145" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="146">queryParameter</name>
<stringValue id="147">queryParameter</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="148" type="java.util.HashSet">
<item id="149" type="com.j2fe.workflow.definition.Transition">
<name id="150">goto-next</name>
<source id="151">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="152"/>
<directJoin>true</directJoin>
<name id="153">Synchronize</name>
<nodeHandler>com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandler>
<nodeHandlerClass id="154">com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandlerClass>
<sources id="155" type="java.util.HashSet">
<item id="156" type="com.j2fe.workflow.definition.Transition">
<name id="157">end-loop</name>
<source id="158">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="159"/>
<directJoin>false</directJoin>
<name id="160">Loop each issuer</name>
<nodeHandler>com.j2fe.workflow.handler.impl.ForEach</nodeHandler>
<nodeHandlerClass id="161">com.j2fe.workflow.handler.impl.ForEach</nodeHandlerClass>
<parameters id="162" type="java.util.HashSet">
<item id="163" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="164">counter</name>
<stringValue id="165">LoopCounter</stringValue>
<type>VARIABLE</type>
</item>
<item id="166" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="167">counter</name>
<stringValue id="168">LoopCounter</stringValue>
<type>VARIABLE</type>
</item>
<item id="169" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="170">input</name>
<stringValue id="171">BulkIssuers</stringValue>
<type>VARIABLE</type>
</item>
<item id="172" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="173">output</name>
<stringValue id="174">Issuer</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="175" type="java.util.HashSet">
<item id="176" type="com.j2fe.workflow.definition.Transition">
<name id="177">ToSplit</name>
<source id="178">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="179">Automatically generated</description>
<directJoin>false</directJoin>
<name id="180">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="181">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="182" type="java.util.HashSet">
<item id="183" type="com.j2fe.workflow.definition.Transition">
<name id="184">goto-next</name>
<source id="185">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="186"/>
<directJoin>false</directJoin>
<name id="187">Bean Shell Script (Standard)</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="188">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="189" type="java.util.HashSet">
<item id="190" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="191">statements</name>
<stringValue id="192">int loopCounter =0;</stringValue>
<type>CONSTANT</type>
</item>
<item id="193" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="194">variables["loopCounter"]</name>
<stringValue id="195">LoopCounter</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="196" type="java.util.HashSet">
<item id="197" type="com.j2fe.workflow.definition.Transition">
<name id="198">goto-next</name>
<source id="199">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="200"/>
<directJoin>true</directJoin>
<name id="201">Bulk Items</name>
<nodeHandler>com.j2fe.general.activities.BulkItems</nodeHandler>
<nodeHandlerClass id="202">com.j2fe.general.activities.BulkItems</nodeHandlerClass>
<parameters id="203" type="java.util.HashSet">
<item id="204" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="205">bulk</name>
<stringValue id="206">BulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="207" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="208">input</name>
<stringValue id="209">Issuers</stringValue>
<type>VARIABLE</type>
</item>
<item id="210" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="211">output</name>
<stringValue id="212">BulkIssuers</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="213" type="java.util.HashSet">
<item id="214" type="com.j2fe.workflow.definition.Transition">
<name id="215">rows-found</name>
<source id="216">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="217"/>
<directJoin>false</directJoin>
<name id="218">Found Issuers for rating changes</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="219">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="220" type="java.util.HashSet">
<item id="221" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="222">database</name>
<stringValue id="223">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="224" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="225">firstColumnsResult</name>
<stringValue id="226">Issuers</stringValue>
<type>VARIABLE</type>
</item>
<item id="227" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="228">querySQL</name>
<objectValue id="229" type="java.lang.String">select rtvl.instr_issr_id from (
select distinct drvl.rtng_cde, drvl.rtng_cde_num num, drvl.rtng_set_oid, drvl.rtng_value_oid, 
rank() over (partition by (case  when rtng_set_mnem = 'MODLTISR' then 'MOODY'
      when upper(rtng_set_mnem) like 'MDY%' then 'MOODY'
      when rtng_set_mnem = 'FITLTISR' then 'FITCH'
      when upper(rtng_set_mnem) like 'FTCH%' then 'FITCH'
      when upper(rtng_set_mnem) like 'SP%' then 'SnP'
      when upper(rtng_set_mnem) like 'JCR%' then 'JCR'
      when upper(rtng_set_mnem) like 'RI%' then 'RnI'
      when upper(rtng_set_mnem) = 'INTRNLPA' then 'INTRNL'
  else rtng_set_mnem
end), issr.instr_issr_id order by drvl.rtng_cde_num desc) rank, issr.instr_issr_id
from ft_t_issr issr, ft_t_firt firt, ft_t_rtvl rtvl, ft_t_rtvl drvl, ft_t_rtng rtng where 1=1
and issr.fins_inst_mnem = firt.inst_mnem
and rtng.rtng_set_oid=firt.rtng_set_oid
and rtng.start_tms &lt;= current_timestamp and (rtng.end_tms is null or rtng.end_tms &gt; current_timestamp) 
and rtvl.rtng_value_oid = firt.rtng_value_oid 
and firt.rtng_cde = rtvl.rtng_cde
and firt.rtng_set_oid = rtvl.rtng_set_oid
and drvl.rtng_cde = rtvl.rtng_cde 
--RDD-268 start 
and firt.start_tms &lt;= current_timestamp and (firt.end_tms is null or firt.end_tms &gt; current_timestamp)
and firt.rtng_eff_tms &lt;= current_timestamp and (firt.sys_eff_end_tms is null or firt.sys_eff_end_tms &gt; current_timestamp)
--RDD-268 end
and rtvl.start_tms &lt;= current_timestamp and (rtvl.end_tms is null or rtvl.end_tms &gt; current_timestamp)
and drvl.start_tms &lt;= current_timestamp and (drvl.end_tms is null or drvl.end_tms &gt; current_timestamp)
and trim(drvl.rtng_set_oid) = (
 case  when rtng_set_mnem = 'MODLTISR' then 'RTNG000001'
      when upper(rtng_set_mnem) like 'MDY%' then 'RTNG000001'
      when rtng_set_mnem = 'FITLTISR' then 'RTNG000002'
      when upper(rtng_set_mnem) like 'FTCH%' then 'RTNG000002'
      when upper(rtng_set_mnem) like 'SP%' then 'RTNG000003'
      when upper(rtng_set_mnem) like 'JCR%' then 'RTNG000004'
      when upper(rtng_set_mnem) like 'RI%' then 'RTNG000005'
      when upper(rtng_set_mnem) = 'INTRNLPA' then 'RTNG000006'
end)
)rtvl, ft_t_issu issu
where 1=1
and rtvl.rank=1
and issu.instr_issr_id = rtvl.instr_issr_id 
and issu.start_tms &lt;= current_timestamp and (issu.end_tms is null or issu.end_tms &gt; current_timestamp)
and exists (select 1 from ft_t_isty isty where isty.iss_typ = issu.iss_typ 
and trim(isty.prnt_iss_typ) in ( 'EQSHR','ETP')  and isty.start_tms &lt;= current_timestamp and (isty.end_tms is null or isty.end_tms &gt; current_timestamp))
and issu.instr_id in (select instr_id from ft_t_isgp where prt_purp_typ = 'INTEREST' and end_tms is null and PRNT_ISS_GRP_OID not in (select ISS_GRP_OID from FT_T_ISGR where GRP_NME like 'MHSC%'))
and not exists(
select 1 from ft_t_isrt where instr_id = issu.instr_id
and rtng_cde = rtvl.rtng_cde
and rtng_set_oid = rtvl.rtng_set_oid
and rtng_value_oid = rtvl.rtng_value_oid
and end_tms is null
and sys_eff_end_tms is null)
union
select instr_issr_id
from ft_t_issu issu
where issu.instr_issr_id is not null
and exists (select 1 from ft_t_isty isty where isty.iss_typ = issu.iss_typ 
and trim(isty.prnt_iss_typ) in ( 'EQSHR','ETP') and isty.start_tms &lt;= current_timestamp and (isty.end_tms is null or isty.end_tms &gt; current_timestamp))
and issu.start_tms &lt;= current_timestamp and (issu.end_tms is null or issu.end_tms &gt; current_timestamp)
and exists (select 1 from ft_t_isgp isgp where isgp.instr_id =issu.instr_id and prt_purp_typ = 'INTEREST' and PRNT_ISS_GRP_OID not in (select ISS_GRP_OID from FT_T_ISGR where GRP_NME like 'MHSC%')
and start_tms &lt;= current_timestamp and (end_tms is null or end_tms &gt; current_timestamp))
and not exists (select 1 from ft_t_isrt r where r.instr_id = issu.instr_id and r.rtng_set_oid = 'RTNG000014' and r.sys_eff_end_tms is NULL and r.end_tms is NULL)</objectValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="230" type="java.util.HashSet">
<item id="231" type="com.j2fe.workflow.definition.Transition">
<name id="232">goto-next</name>
<source id="233">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="234"/>
<directJoin>false</directJoin>
<name id="235">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="236">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="237" type="java.util.HashSet"/>
<targets id="238" type="java.util.HashSet">
<item idref="231" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="216"/>
</item>
</sources>
<targets id="239" type="java.util.HashSet">
<item id="240" type="com.j2fe.workflow.definition.Transition">
<name id="241">nothing-found</name>
<source idref="216"/>
<target idref="9"/>
</item>
<item idref="214" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="199"/>
</item>
</sources>
<targets id="242" type="java.util.HashSet">
<item idref="197" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDSPLIT</type>
</source>
<target idref="185"/>
</item>
</sources>
<targets id="243" type="java.util.HashSet">
<item idref="183" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="178"/>
</item>
<item id="244" type="com.j2fe.workflow.definition.Transition">
<name id="245">goto-next</name>
<source id="246">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="247"/>
<directJoin>false</directJoin>
<name id="248">Calculate EquityRating</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="249">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="250" type="java.util.HashSet">
<item id="251" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="252">["Issuer"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="253">input["Issuer"]</name>
<stringValue id="254">Issuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="255" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="256">name</name>
<stringValue id="257">CalculateDeriveRatingEquity</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="258" type="java.util.HashSet">
<item id="259" type="com.j2fe.workflow.definition.Transition">
<name id="260">loop</name>
<source idref="158"/>
<target idref="246"/>
</item>
</sources>
<targets id="261" type="java.util.HashSet">
<item idref="244" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="178"/>
</item>
</sources>
<targets id="262" type="java.util.HashSet">
<item idref="176" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="158"/>
</item>
</sources>
<targets id="263" type="java.util.HashSet">
<item idref="156" type="com.j2fe.workflow.definition.Transition"/>
<item idref="259" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="151"/>
</item>
</sources>
<targets id="264" type="java.util.HashSet">
<item idref="149" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDJOIN</type>
</source>
<target idref="119"/>
</item>
</sources>
<targets id="265" type="java.util.HashSet">
<item idref="117" type="com.j2fe.workflow.definition.Transition"/>
<item id="266" type="com.j2fe.workflow.definition.Transition">
<name id="267">no-extraction</name>
<source idref="119"/>
<target idref="9"/>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="95"/>
</item>
</sources>
<targets id="268" type="java.util.HashSet">
<item idref="93" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="78"/>
</item>
</sources>
<targets id="269" type="java.util.HashSet">
<item idref="76" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDSPLIT</type>
</source>
<target idref="44"/>
</item>
</sources>
<targets id="270" type="java.util.HashSet">
<item idref="42" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="37"/>
</item>
</sources>
<targets id="271" type="java.util.HashSet">
<item idref="35" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDJOIN</type>
</source>
<target idref="23"/>
</item>
</sources>
<targets id="272" type="java.util.HashSet">
<item idref="21" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="9"/>
</item>
<item idref="266" type="com.j2fe.workflow.definition.Transition"/>
<item idref="240" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="273" type="java.util.HashSet">
<item idref="7" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="2"/>
</item>
</sources>
<targets id="274" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="275">Mizuho/Ratings</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="276">user1</lastChangeUser>
<lastUpdate id="277">2025-12-04T15:48:39.000+0000</lastUpdate>
<name id="278">ScheduledCalculateEquityRating</name>
<nodes id="279" type="java.util.HashSet">
<item idref="119" type="com.j2fe.workflow.definition.Node"/>
<item idref="95" type="com.j2fe.workflow.definition.Node"/>
<item idref="185" type="com.j2fe.workflow.definition.Node"/>
<item idref="78" type="com.j2fe.workflow.definition.Node"/>
<item idref="199" type="com.j2fe.workflow.definition.Node"/>
<item idref="246" type="com.j2fe.workflow.definition.Node"/>
<item idref="23" type="com.j2fe.workflow.definition.Node"/>
<item idref="216" type="com.j2fe.workflow.definition.Node"/>
<item idref="158" type="com.j2fe.workflow.definition.Node"/>
<item idref="178" type="com.j2fe.workflow.definition.Node"/>
<item idref="44" type="com.j2fe.workflow.definition.Node"/>
<item idref="9" type="com.j2fe.workflow.definition.Node"/>
<item idref="233" type="com.j2fe.workflow.definition.Node"/>
<item idref="2" type="com.j2fe.workflow.definition.Node"/>
<item idref="37" type="com.j2fe.workflow.definition.Node"/>
<item idref="151" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>true</optimize>
<parameter id="280" type="java.util.HashMap">
<entry>
<key id="281" type="java.lang.String">BulkSize</key>
<value id="282" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="283">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="284" type="java.lang.String">ModelId</key>
<value id="285" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="286">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="287">	</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
</parameter>
<permissions id="288" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>false</purgeAtEnd>
<retries>0</retries>
<startNode idref="233"/>
<status>RELEASED</status>
<variables id="289" type="java.util.HashMap">
<entry>
<key id="290" type="java.lang.String">BulkSize</key>
<value id="291" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="292">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<persistent>false</persistent>
<value id="293" type="java.lang.Integer">20</value>
</value>
</entry>
<entry>
<key id="294" type="java.lang.String">JMSdestination</key>
<value id="295" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="296">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="297"/>
<persistent>false</persistent>
<value id="298" type="java.lang.String">jms/queue/security</value>
</value>
</entry>
<entry>
<key id="299" type="java.lang.String">ModelId</key>
<value id="300" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="301">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="302">	</description>
<persistent>false</persistent>
<value id="303" type="java.lang.String">ISSUPUB</value>
</value>
</entry>
</variables>
<version>21</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
