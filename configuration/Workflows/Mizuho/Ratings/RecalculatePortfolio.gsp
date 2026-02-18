<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.07">
<package-comment/>
<businessobject displayString="17 - RemotePubAddedV10" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>true</alwaysPersist>
<clustered>false</clustered>
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
<name id="12">Database Statement #1</name>
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
<stringValue id="20">delete from ft_t_isrt
where 1 = 1
	and ctid in (
	select ctid
	from
		(
		select
			ctid,
			row_number() over (partition by instr_id, rtng_set_oid order by last_chg_tms desc) as rownum
		from
			ft_t_isrt
		where
			1 = 1
			and rtng_set_oid in (select rtng_set_oid from ft_t_rtng where rtng_set_oid like 'RTNG%' and rtng_set_nme  like 'Derived%')
			and sys_eff_end_tms is null
			and end_tms is null
			and instr_id in (select instr_id from ft_t_isrt where last_chg_tms &gt;= date_trunc('day', now())::timestamp - interval '3 days')
    ) sq
	where sq.rownum &gt; 1
)</stringValue>
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
<name id="26">Delete Inactive Portfolio</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="27">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="28" type="java.util.HashSet">
<item id="29" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="30">name</name>
<stringValue id="31">DeleteInactivePortfolio</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="32" type="java.util.HashSet">
<item id="33" type="com.j2fe.workflow.definition.Transition">
<name id="34">goto-next</name>
<source id="35">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="36"/>
<directJoin>false</directJoin>
<name id="37">Delete ISGP</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="38">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="39" type="java.util.HashSet">
<item id="40" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="41">database</name>
<stringValue id="42">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="43" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="44">querySQL</name>
<stringValue id="45">delete from ft_t_isgp where prnt_iss_grp_oid = 'ISGR000011' and prt_purp_typ = 'PRTFLIOC'
and start_tms &lt;= current_timestamp and (end_tms is null or end_tms &gt; current_timestamp) </stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="46" type="java.util.HashSet">
<item id="47" type="com.j2fe.workflow.definition.Transition">
<name id="48">goto-next</name>
<source id="49">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="50"/>
<directJoin>false</directJoin>
<name id="51">NOP</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="52">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="53" type="java.util.HashSet">
<item id="54" type="com.j2fe.workflow.definition.Transition">
<name id="55">goto-next</name>
<source id="56">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="57"/>
<directJoin>true</directJoin>
<name id="58">Synchronize</name>
<nodeHandler>com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandler>
<nodeHandlerClass id="59">com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandlerClass>
<sources id="60" type="java.util.HashSet">
<item id="61" type="com.j2fe.workflow.definition.Transition">
<name id="62">goto-next</name>
<source id="63">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="64"/>
<directJoin>false</directJoin>
<name id="65">Raise Event Remote #2</name>
<nodeHandler>com.j2fe.event.RaiseEventRemote</nodeHandler>
<nodeHandlerClass id="66">com.j2fe.event.RaiseEventRemote</nodeHandlerClass>
<parameters id="67" type="java.util.HashSet">
<item id="68" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="69">eventName</name>
<stringValue id="70">MizBulkExtractionEvent</stringValue>
<type>CONSTANT</type>
</item>
<item id="71" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="72">["AuditId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="73">parameters["AuditId"]</name>
<stringValue id="74">auditIdentifier</stringValue>
<type>VARIABLE</type>
</item>
<item id="75" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="76">["ExtDefs"]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="77">parameters["ExtDefs"]</name>
<stringValue id="78">extDefsPerBranch</stringValue>
<type>VARIABLE</type>
</item>
<item id="79" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="80">["Handle Extraction Failures"]@com/thegoldensource/subscription/ExceptionHandlingMode@</UITypeHint>
<input>true</input>
<name id="81">parameters["Handle Extraction Failures"]</name>
<objectValue id="82" type="com.thegoldensource.subscription.ExceptionHandlingMode">DO_NOT_HANDLE</objectValue>
<type>CONSTANT</type>
</item>
<item id="83" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="84">["JMSDestination"]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="85">parameters["JMSDestination"]</name>
<stringValue id="86">JMSDestinationSecurity</stringValue>
<type>VARIABLE</type>
</item>
<item id="87" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="88">["PublishingBulkSize"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="89">parameters["PublishingBulkSize"]</name>
<objectValue id="90" type="java.lang.Integer">100</objectValue>
<type>CONSTANT</type>
</item>
<item id="91" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="92">propertyFileLocation</name>
<stringValue id="93">db://resource/PublishingConfiguration/PublishingConfig.properties</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="94" type="java.util.HashSet">
<item id="95" type="com.j2fe.workflow.definition.Transition">
<name id="96">goto-next</name>
<source id="97">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="98"/>
<directJoin>true</directJoin>
<name id="99">Bulk Items</name>
<nodeHandler>com.j2fe.general.activities.BulkItems</nodeHandler>
<nodeHandlerClass id="100">com.j2fe.general.activities.BulkItems</nodeHandlerClass>
<parameters id="101" type="java.util.HashSet">
<item id="102" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="103">bulk</name>
<stringValue id="104">pubBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="105" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="106">input</name>
<stringValue id="107">extractDefinitions</stringValue>
<type>VARIABLE</type>
</item>
<item id="108" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="109">output</name>
<stringValue id="110">extDefsPerBranch</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="111" type="java.util.HashSet">
<item id="112" type="com.j2fe.workflow.definition.Transition">
<name id="113">goto-next</name>
<source id="114">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="115"/>
<directJoin>false</directJoin>
<name id="116">Bean Shell Script (Standard)</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="117">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="118" type="java.util.HashSet">
<item id="119" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="120">statements</name>
<stringValue id="121">if(NoOfThreads &lt;= 0) {&#13;
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
<item id="122" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="123">["NoOfThreads"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="124">variables["NoOfThreads"]</name>
<objectValue id="125" type="java.lang.Integer">20</objectValue>
<type>CONSTANT</type>
</item>
<item id="126" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="127">["bulkSize"]@java/lang/Integer@</UITypeHint>
<input>false</input>
<name id="128">variables["bulkSize"]</name>
<stringValue id="129">pubBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="130" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="131">["items"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="132">variables["items"]</name>
<stringValue id="133">extractDefinitions</stringValue>
<type>VARIABLE</type>
<variablePart id="134">length</variablePart>
</item>
</parameters>
<sources id="135" type="java.util.HashSet">
<item id="136" type="com.j2fe.workflow.definition.Transition">
<name id="137">extraction</name>
<source id="138">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="139"/>
<directJoin>false</directJoin>
<name id="140">Asset Extraction Log</name>
<nodeHandler>com.thegoldensource.publishing.activity.WriteExtractionLog</nodeHandler>
<nodeHandlerClass id="141">com.thegoldensource.publishing.activity.WriteExtractionLog</nodeHandlerClass>
<parameters id="142" type="java.util.HashSet">
<item id="143" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="144">auditId</name>
<stringValue id="145">auditIdentifier</stringValue>
<type>VARIABLE</type>
</item>
<item id="146" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="147">entityMode</name>
<stringValue id="148">MODEL_ENTITY</stringValue>
<type>CONSTANT</type>
</item>
<item id="149" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="150">eql</name>
<stringValue id="151">&lt;sql&gt;instr_id in (select instr_id from ft_t_isgp where prnt_iss_grp_oid = 'ISGR000011' and prt_purp_typ = 'PRTFLIOC' and start_tms &lt;= current_timestamp and (end_tms is null or end_tms &gt; current_timestamp))&#13;
and instr_id in (select instr_id from ft_t_isgp where prt_purp_typ = 'INTEREST' and PRNT_ISS_GRP_OID not in (select ISS_GRP_OID from FT_T_ISGR where GRP_NME like 'MHSC%')  and start_tms &lt;= current_timestamp and (end_tms is null or end_tms &gt; current_timestamp))&lt;/sql&gt;</stringValue>
<type>CONSTANT</type>
</item>
<item id="152" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="153">extractDefinitions</name>
<stringValue id="154">extractDefinitions</stringValue>
<type>VARIABLE</type>
</item>
<item id="155" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="156">extractorFactory</name>
<stringValue id="157">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="158" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="159">maxExtractCount</name>
<stringValue id="160">100</stringValue>
<type>CONSTANT</type>
</item>
<item id="161" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="162">modelName</name>
<stringValue id="163">ISSUPUB</stringValue>
<type>CONSTANT</type>
</item>
<item id="164" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="165">queryParameter</name>
<stringValue id="166">queryParameter</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="167" type="java.util.HashSet">
<item id="168" type="com.j2fe.workflow.definition.Transition">
<name id="169">goto-next</name>
<source id="170">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="171"/>
<directJoin>false</directJoin>
<name id="172">Insert missing ISRT for CreditLinked Portfolio</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="173">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="174" type="java.util.HashSet">
<item id="175" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="176">database</name>
<stringValue id="177">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="178" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="179">querySQL</name>
<objectValue id="180" type="java.lang.String">insert into ft_t_isrt (ISS_RTNG_OID, INSTR_ID, START_TMS, LAST_CHG_USR_ID, LAST_CHG_TMS, RTNG_CDE, RTNG_SYMBOL_TXT, RTNG_VALUE_OID, RTNG_SET_OID, orig_data_prov_id, data_stat_typ, RTNG_EFF_TMS, data_src_id)&#13;
--RDD-268 end&#13;
select  new_oid(), issu.instr_id, current_timestamp, 'RecalculatePortfolio', current_timestamp, isrt1.rtng_cde, isrt1.rtng_cde, isrt1.rtng_value_oid, isrt1.rtng_set_oid, 'DERIVED', 'ACTIVE', current_timestamp, isrt1.data_src_id&#13;
from ft_t_issu issu, ft_t_isgp isgp, ft_t_isrt isrt1, ft_t_ridf ridf, ft_t_riss riss&#13;
where riss.instr_id = isrt1.instr_id&#13;
and ridf.instr_id = issu.instr_id&#13;
and ridf.rld_iss_feat_id = riss.rld_iss_feat_id&#13;
and riss.iss_part_rl_typ = 'UNDLYING' &#13;
and ridf.rel_typ = 'CreditLinked'&#13;
and isrt1.orig_data_prov_id = 'DERIVED'&#13;
and isgp.instr_id = issu.instr_id&#13;
and isgp.prt_purp_typ = 'PRTFLIOC'&#13;
and issu.start_tms &lt;=current_timestamp and (issu.end_tms is null or issu.end_tms&gt;current_timestamp)&#13;
--RDD-268 start&#13;
--and isrt1.start_tms &lt;=current_timestamp and (isrt1.end_tms is null or isrt1.end_tms&gt;current_timestamp)&#13;
and isrt1.rtng_eff_tms &lt;=current_timestamp and (isrt1.sys_eff_end_tms is null or isrt1.sys_eff_end_tms&gt;current_timestamp)&#13;
--RDD-268 end&#13;
and exists (select 1 from ft_t_isgp isgp1 where isgp1.prnt_iss_grp_oid = isgp.prnt_iss_grp_oid and isgp1.prt_purp_typ = 'PRTFLIOP'&#13;
            and isgp1.start_tms &lt;=current_timestamp and (isgp1.end_tms is null or isgp1.end_tms&gt;current_timestamp)&#13;
            and exists (select 1 from ft_t_isst isst where ISST.STAT_DEF_ID='MIZDRVRL' and isst.stat_char_val_txt = 'CREDITLINKED'&#13;
                          and isst.instr_id = isgp1.instr_id))&#13;
and not exists (&#13;
select 1 from ft_t_isrt isrt where isrt.instr_id = issu.instr_id and isrt.rtng_cde = isrt1.rtng_cde&#13;
and isrt.rtng_set_oid = isrt1.rtng_set_oid and isrt.rtng_value_oid = isrt1.rtng_value_oid)</objectValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="181" type="java.util.HashSet">
<item id="182" type="com.j2fe.workflow.definition.Transition">
<name id="183">goto-next</name>
<source id="184">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="185"/>
<directJoin>false</directJoin>
<name id="186">Insert missing ISGP for CreditLinked Portfolio</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="187">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="188" type="java.util.HashSet">
<item id="189" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="190">database</name>
<stringValue id="191">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="192" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="193">querySQL</name>
<objectValue id="194" type="java.lang.String">Insert into ft_t_isgp (ISGP_OID, PRNT_ISS_GRP_OID, INSTR_ID, PRT_PURP_TYP, START_TMS, LAST_CHG_TMS, LAST_CHG_USR_ID) &#13;
select new_oid(),  'ISGR000011', dd.instr_id, 'PRTFLIOC', current_timestamp, current_timestamp, 'RecalculatePortfolio'&#13;
from (select distinct issu.instr_id from &#13;
ft_t_issu issu, ft_t_isgp isgp, ft_t_isrt isrt1, ft_t_ridf ridf, ft_t_riss riss&#13;
where riss.instr_id = isrt1.instr_id&#13;
and ridf.instr_id = issu.instr_id&#13;
and ridf.rld_iss_feat_id = riss.rld_iss_feat_id&#13;
and riss.iss_part_rl_typ = 'UNDLYING' &#13;
and ridf.rel_typ = 'CreditLinked'&#13;
and isrt1.orig_data_prov_id = 'DERIVED'&#13;
and isgp.instr_id = issu.instr_id&#13;
and isgp.prt_purp_typ = 'PRTFLIOC'&#13;
and issu.start_tms &lt;=current_timestamp and (issu.end_tms is null or issu.end_tms&gt;current_timestamp)&#13;
--RDD-268 start&#13;
--and isrt1.start_tms &lt;=current_timestamp and (isrt1.end_tms is null or isrt1.end_tms&gt;current_timestamp)&#13;
and isrt1.rtng_eff_tms &lt;=current_timestamp and (isrt1.sys_eff_end_tms is null or isrt1.sys_eff_end_tms&gt;current_timestamp)&#13;
--RDD-268 end&#13;
and exists (select 1 from ft_t_isgp isgp1 where isgp1.prnt_iss_grp_oid = isgp.prnt_iss_grp_oid and isgp1.prt_purp_typ = 'PRTFLIOP'&#13;
            and isgp1.start_tms &lt;=current_timestamp and (isgp1.end_tms is null or isgp1.end_tms&gt;current_timestamp)&#13;
            and exists (select 1 from ft_t_isst isst where ISST.STAT_DEF_ID='MIZDRVRL' and isst.stat_char_val_txt = 'CREDITLINKED'&#13;
                          and isst.instr_id = isgp1.instr_id))&#13;
and not exists (&#13;
select 1 from ft_t_isrt isrt where isrt.instr_id = issu.instr_id and isrt.rtng_cde = isrt1.rtng_cde&#13;
and isrt.rtng_set_oid = isrt1.rtng_set_oid and isrt.rtng_value_oid = isrt1.rtng_value_oid)) dd&#13;
where not exists (select 1 from ft_t_isgp isgp1 where prnt_iss_grp_oid = 'ISGR000011' &#13;
and isgp1.instr_id = dd.instr_id and prt_purp_typ = 'PRTFLIOC'&#13;
and start_tms &lt;= current_timestamp and (end_tms is null or end_tms &gt; current_timestamp))</objectValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="195" type="java.util.HashSet">
<item id="196" type="com.j2fe.workflow.definition.Transition">
<name id="197">goto-next</name>
<source id="198">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="199"/>
<directJoin>false</directJoin>
<name id="200">Delete ISRT for Creditlinked portfolio which is deleted from underlying instrument</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="201">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="202" type="java.util.HashSet">
<item id="203" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="204">database</name>
<stringValue id="205">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="206" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="207">querySQL</name>
<objectValue id="208" type="java.lang.String">DELETE FROM ft_t_isrt WHERE (instr_id || rtng_cde || rtng_value_oid || rtng_set_oid) IN ( SELECT issu.instr_id || isrt.rtng_cde || isrt.rtng_value_oid || isrt.rtng_set_oid FROM ft_t_issu issu, ft_t_isgp isgp, ft_t_isrt isrt WHERE isrt.orig_data_prov_id = 'DERIVED' AND isgp.instr_id = issu.instr_id AND isrt.instr_id = issu.instr_id AND isgp.prt_purp_typ = 'PRTFLIOC' AND issu.start_tms &gt;= current_timestamp AND (issu.end_tms IS NULL OR issu.end_tms &lt; current_timestamp) AND isrt.rtng_eff_tms &gt;= current_timestamp AND (isrt.sys_eff_end_tms IS NULL OR isrt.sys_eff_end_tms &lt; current_timestamp) AND EXISTS ( SELECT 1 FROM ft_t_isgp isgp1 WHERE isgp1.prnt_iss_grp_oid = isgp.prnt_iss_grp_oid AND isgp1.prt_purp_typ = 'PRTFLIOP' AND isgp1.start_tms &gt;= current_timestamp AND (isgp1.end_tms IS NULL OR isgp1.end_tms &lt; current_timestamp) AND EXISTS ( SELECT 1 FROM ft_t_isst isst WHERE isst.stat_def_id = 'MIZDRVRL' AND isst.stat_char_val_txt = 'CREDITLINKED' AND isst.instr_id = isgp1.instr_id ) ) ) AND NOT EXISTS ( SELECT issu.instr_id || isrt1.rtng_cde || isrt1.rtng_value_oid || isrt1.rtng_set_oid FROM ft_t_issu issu, ft_t_isgp isgp, ft_t_isrt isrt1, ft_t_ridf ridf, ft_t_riss riss WHERE riss.instr_id = isrt1.instr_id AND ridf.instr_id = issu.instr_id AND riss.iss_part_rl_typ = 'UNDLYING' AND ridf.rel_typ = 'CreditLinked' AND ridf.rld_iss_feat_id = riss.rld_iss_feat_id AND isrt1.orig_data_prov_id = 'DERIVED' AND isgp.instr_id = issu.instr_id AND isgp.prt_purp_typ = 'PRTFLIOC' AND issu.start_tms &gt;= current_timestamp AND (issu.end_tms IS NULL OR issu.end_tms &lt; current_timestamp) AND isrt1.rtng_eff_tms &gt;= current_timestamp AND (isrt1.sys_eff_end_tms IS NULL OR isrt1.sys_eff_end_tms &lt; current_timestamp) AND EXISTS ( SELECT 1 FROM ft_t_isgp isgp1 WHERE isgp1.prnt_iss_grp_oid = isgp.prnt_iss_grp_oid AND isgp1.prt_purp_typ = 'PRTFLIOP' AND isgp1.start_tms &gt;= current_timestamp AND (isgp1.end_tms IS NULL OR isgp1.end_tms &lt; current_timestamp) AND EXISTS ( SELECT 1 FROM ft_t_isst isst WHERE isst.stat_def_id = 'MIZDRVRL' AND isst.stat_char_val_txt = 'CREDITLINKED' AND isst.instr_id = isgp1.instr_id ) ) )</objectValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="209" type="java.util.HashSet">
<item id="210" type="com.j2fe.workflow.definition.Transition">
<name id="211">goto-next</name>
<source id="212">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="213"/>
<directJoin>false</directJoin>
<name id="214">Insert ISGP for Creditlinked portfolio which is deleted from underlying instrument</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="215">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="216" type="java.util.HashSet">
<item id="217" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="218">database</name>
<stringValue id="219">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="220" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="221">querySQL</name>
<objectValue id="222" type="java.lang.String">INSERT INTO ft_t_isgp (ISGP_OID, PRNT_ISS_GRP_OID, INSTR_ID, PRT_PURP_TYP, START_TMS, LAST_CHG_TMS, LAST_CHG_USR_ID) SELECT new_oid(), 'ISGR000011', issu.instr_id, 'PRTFLIOC', current_timestamp, current_timestamp, 'RecalculatePortfolio' FROM ft_t_issu issu JOIN ( SELECT issu.instr_id FROM ft_t_issu issu JOIN ft_t_isgp isgp ON isgp.instr_id = issu.instr_id JOIN ft_t_isrt isrt ON isrt.instr_id = issu.instr_id WHERE isrt.orig_data_prov_id = 'DERIVED' AND isgp.prt_purp_typ = 'PRTFLIOC' AND issu.start_tms &lt;= current_timestamp AND (issu.end_tms IS NULL OR issu.end_tms &gt; current_timestamp) AND isrt.rtng_eff_tms &lt;= current_timestamp AND (isrt.sys_eff_end_tms IS NULL OR isrt.sys_eff_end_tms &gt; current_timestamp) AND EXISTS ( SELECT 1 FROM ft_t_isgp isgp1 WHERE isgp1.prnt_iss_grp_oid = isgp.prnt_iss_grp_oid AND isgp1.prt_purp_typ = 'PRTFLIOP' AND isgp1.start_tms &lt;= current_timestamp AND (isgp1.end_tms IS NULL OR isgp1.end_tms &gt; current_timestamp) AND EXISTS ( SELECT 1 FROM ft_t_isst isst WHERE isst.stat_def_id = 'MIZDRVRL' AND isst.stat_char_val_txt = 'CREDITLINKED' AND isst.instr_id = isgp1.instr_id ) ) EXCEPT  SELECT issu.instr_id FROM ft_t_issu issu JOIN ft_t_isgp isgp ON isgp.instr_id = issu.instr_id JOIN ft_t_isrt isrt1 ON isrt1.instr_id = issu.instr_id JOIN ft_t_ridf ridf ON ridf.instr_id = issu.instr_id JOIN ft_t_riss riss ON riss.instr_id = isrt1.instr_id WHERE riss.iss_part_rl_typ = 'UNDLYING' AND ridf.rel_typ = 'CreditLinked' AND ridf.rld_iss_feat_id = riss.rld_iss_feat_id AND isrt1.orig_data_prov_id = 'DERIVED' AND isgp.prt_purp_typ = 'PRTFLIOC' AND issu.start_tms &lt;= current_timestamp AND (issu.end_tms IS NULL OR issu.end_tms &gt; current_timestamp) AND isrt1.rtng_eff_tms &lt;= current_timestamp AND (isrt1.sys_eff_end_tms IS NULL OR isrt1.sys_eff_end_tms &gt; current_timestamp) AND EXISTS ( SELECT 1 FROM ft_t_isgp isgp1 WHERE isgp1.prnt_iss_grp_oid = isgp.prnt_iss_grp_oid AND isgp1.prt_purp_typ = 'PRTFLIOP' AND isgp1.start_tms &lt;= current_timestamp AND (isgp1.end_tms IS NULL OR isgp1.end_tms &gt; current_timestamp) AND EXISTS (SELECT 1 FROM ft_t_isst isst WHERE isst.stat_def_id = 'MIZDRVRL' AND isst.stat_char_val_txt = 'CREDITLINKED' AND isst.instr_id = isgp1.instr_id ))) dd ON dd.instr_id = issu.instr_id WHERE issu.iss_typ != 'PORT' AND NOT EXISTS ( SELECT 1 FROM ft_t_isgp isgp WHERE isgp.prnt_iss_grp_oid = 'ISGR000011' AND isgp.instr_id = issu.instr_id AND isgp.prt_purp_typ = 'PRTFLIOC' AND isgp.start_tms &lt;= current_timestamp AND (isgp.end_tms IS NULL OR isgp.end_tms &gt; current_timestamp))</objectValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="223" type="java.util.HashSet">
<item id="224" type="com.j2fe.workflow.definition.Transition">
<name id="225">goto-next</name>
<source id="226">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="227"/>
<directJoin>false</directJoin>
<name id="228">NOP</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="229">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="230" type="java.util.HashSet">
<item id="231" type="com.j2fe.workflow.definition.Transition">
<name id="232">end-loop</name>
<source id="233">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="234"/>
<directJoin>false</directJoin>
<name id="235">Loop the issuers</name>
<nodeHandler>com.j2fe.workflow.handler.impl.ForEach</nodeHandler>
<nodeHandlerClass id="236">com.j2fe.workflow.handler.impl.ForEach</nodeHandlerClass>
<parameters id="237" type="java.util.HashSet">
<item id="238" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="239">counter</name>
<stringValue id="240">LoopCounter</stringValue>
<type>VARIABLE</type>
</item>
<item id="241" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="242">counter</name>
<stringValue id="243">LoopCounter</stringValue>
<type>VARIABLE</type>
</item>
<item id="244" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="245">input</name>
<stringValue id="246">Issuers</stringValue>
<type>VARIABLE</type>
</item>
<item id="247" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="248">output</name>
<stringValue id="249">Issuer</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="250" type="java.util.HashSet">
<item id="251" type="com.j2fe.workflow.definition.Transition">
<name id="252">ToSplit</name>
<source id="253">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="254">Automatically generated</description>
<directJoin>false</directJoin>
<name id="255">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="256">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="257" type="java.util.HashSet">
<item id="258" type="com.j2fe.workflow.definition.Transition">
<name id="259">goto-next</name>
<source id="260">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="261"/>
<directJoin>false</directJoin>
<name id="262">Update Re-Calculate Flag</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="263">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="264" type="java.util.HashSet">
<item id="265" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="266">database</name>
<stringValue id="267">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="268" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="269">indexedParameters[0]</name>
<stringValue id="270">Issuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="271" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="272">querySQL</name>
<stringValue id="273">UPDATE FT_T_ISST ISST SET STAT_CHAR_VAL_TXT = 'N', STAT_VAL_TMS = current_timestamp, LAST_CHG_USR_ID = 'RecalculatePortfolio', LAST_CHG_TMS = current_timestamp, DATA_SRC_ID= NULL&#13;
WHERE ISST.STAT_DEF_ID = 'MIZRECAL' &#13;
AND ISST.STAT_CHAR_VAL_TXT = 'Y'&#13;
AND ISST.START_TMS &lt;= current_timestamp AND (ISST.END_TMS IS NULL OR ISST.END_TMS &gt; current_timestamp)&#13;
AND EXISTS (SELECT 1 FROM FT_T_ISSU ISSU WHERE ISSU.INSTR_ID = ISST.INSTR_ID AND ISSU.INSTR_ISSR_ID = ?&#13;
AND ISSU.ISS_TYP = 'PORT')</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="274" type="java.util.HashSet">
<item id="275" type="com.j2fe.workflow.definition.Transition">
<name id="276">goto-next</name>
<source id="277">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="278"/>
<directJoin>false</directJoin>
<name id="279">Calculate Basel II</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="280">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="281" type="java.util.HashSet">
<item id="282" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="283">["Issuer"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="284">input["Issuer"]</name>
<stringValue id="285">Issuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="286" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="287">name</name>
<stringValue id="288">DeriveBaselIIAsetRating</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="289" type="java.util.HashSet">
<item id="290" type="com.j2fe.workflow.definition.Transition">
<name id="291">goto-next</name>
<source id="292">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="293"/>
<directJoin>false</directJoin>
<name id="294">Calculate JBIS and CAR</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="295">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="296" type="java.util.HashSet">
<item id="297" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="298">["Issuer"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="299">input["Issuer"]</name>
<stringValue id="300">Issuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="301" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="302">name</name>
<stringValue id="303">CalculateJBISandCAR</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="304" type="java.util.HashSet">
<item id="305" type="com.j2fe.workflow.definition.Transition">
<name id="306">goto-next</name>
<source id="307">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="308"/>
<directJoin>false</directJoin>
<name id="309">Recalculate CreditLinked Portfolio</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="310">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="311" type="java.util.HashSet">
<item id="312" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="313">["Issuer"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="314">input["Issuer"]</name>
<stringValue id="315">Issuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="316" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="317">name</name>
<stringValue id="318">DeriveFromCreditLinkedRating</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="319" type="java.util.HashSet">
<item id="320" type="com.j2fe.workflow.definition.Transition">
<name id="321">goto-next</name>
<source id="322">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="323"/>
<directJoin>false</directJoin>
<name id="324">Recalculate Subordinated Portfolio</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="325">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="326" type="java.util.HashSet">
<item id="327" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="328">["Issuer"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="329">input["Issuer"]</name>
<stringValue id="330">Issuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="331" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="332">name</name>
<stringValue id="333">SubordinatedPortfolioCalc</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="334" type="java.util.HashSet">
<item id="335" type="com.j2fe.workflow.definition.Transition">
<name id="336">goto-next</name>
<source id="337">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="338"/>
<directJoin>false</directJoin>
<name id="339">Set Subordinated Portfolio to recalculate</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="340">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="341" type="java.util.HashSet">
<item id="342" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="343">database</name>
<stringValue id="344">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="345" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="346">indexedParameters[0]</name>
<stringValue id="347">Issuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="348" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="349">indexedParameters[1]</name>
<stringValue id="350">Issuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="351" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="352">querySQL</name>
<objectValue id="353" type="java.lang.String">UPDATE FT_T_ISST ISST SET STAT_CHAR_VAL_TXT = 'Y', STAT_VAL_TMS = current_timestamp, LAST_CHG_USR_ID = 'RecalculatePortfolio', LAST_CHG_TMS = current_timestamp, DATA_SRC_ID = NULL WHERE ISST.STAT_DEF_ID = 'MIZRECAL' AND ISST.STAT_CHAR_VAL_TXT = 'N' AND ISST.START_TMS &lt;= current_timestamp AND (ISST.END_TMS IS NULL OR ISST.END_TMS &gt; current_timestamp) AND instr_id IN ( SELECT subor.instr_id FROM ( SELECT isgp.prnt_iss_grp_oid, COALESCE( ( SELECT INST_MNEM FROM FT_T_FINS FINS WHERE EXISTS ( SELECT 1 FROM FT_T_FINR WHERE FINSRL_TYP = 'GUARNTOR' AND INST_MNEM = FINS.INST_MNEM AND START_TMS &lt;= current_timestamp AND (END_TMS IS NULL OR END_TMS &gt; current_timestamp) ) AND EXISTS ( SELECT 1 FROM FT_T_FRIP WHERE INST_MNEM = FINS.INST_MNEM AND INSTR_ID = ISSU.INSTR_ID AND START_TMS &lt;= current_timestamp AND (END_TMS IS NULL OR END_TMS &gt; current_timestamp) ) AND START_TMS &lt;= current_timestamp AND (END_TMS IS NULL OR END_TMS &gt; current_timestamp) ), 'NULL' ) AS GUARANTOR, COALESCE( ( SELECT RISS.INSTR_ID FROM FT_T_RISS RISS JOIN FT_T_RIDF RIDF ON RIDF.RLD_ISS_FEAT_ID = RISS.RLD_ISS_FEAT_ID WHERE RISS.ISS_PART_RL_TYP = 'UNDLYING' AND RIDF.REL_TYP = 'CreditLinked' AND RISS.INSTR_ID IS NOT NULL AND RIDF.INSTR_ID = ISSU.INSTR_ID AND RIDF.START_TMS &lt;= current_timestamp AND (RIDF.END_TMS IS NULL OR RIDF.END_TMS &gt; current_timestamp) AND RISS.START_TMS &lt;= current_timestamp AND (RISS.END_TMS IS NULL OR RISS.END_TMS &gt; current_timestamp) LIMIT 1 ), 'NULL' ) AS CREDITLINKED, COALESCE( ( SELECT COLL_TYP FROM FT_T_ISLL WHERE INSTR_ID = ISSU.INSTR_ID AND COLL_TYP = 'Secured' AND START_TMS &lt;= current_timestamp AND (END_TMS IS NULL OR END_TMS &gt; current_timestamp) ), 'NULL' ) AS SECURED, COALESCE( ( SELECT CL_VALUE FROM FT_T_ISCL WHERE INSTR_ID = ISSU.INSTR_ID AND INDUS_CL_SET_ID = 'MIZUNIQE' AND START_TMS &lt;= current_timestamp AND (END_TMS IS NULL OR END_TMS &gt; current_timestamp) ), 'NULL' ) AS UNIQU, COALESCE( ( SELECT ISGP.PRNT_ISS_GRP_OID FROM FT_T_ISGP ISGP JOIN FT_T_ISGR ISGR ON ISGP.PRNT_ISS_GRP_OID = ISGR.ISS_GRP_OID WHERE ISGP.INSTR_ID = ISSU.INSTR_ID AND GRP_NME = 'FCY' AND ISGP.START_TMS &lt;= current_timestamp AND (ISGP.END_TMS IS NULL OR ISGP.END_TMS &gt; current_timestamp) AND ISGR.START_TMS &lt;= current_timestamp AND (ISGR.END_TMS IS NULL OR ISGR.END_TMS &gt; current_timestamp) ), 'NULL' ) AS FCY, COALESCE(issu.series_typ, 'NULL') AS iseries, COALESCE( ( SELECT COLL_GRP_DESC FROM FT_T_ISLL WHERE INSTR_ID = ISSU.INSTR_ID AND COLL_TYP = 'Mortgage Backed' AND COLL_GRP_DESC IS NOT NULL AND START_TMS &lt;= current_timestamp AND (END_TMS IS NULL OR END_TMS &gt; current_timestamp) ), 'NULL' ) AS igroup, issu.pref_iss_nme FROM ft_t_issu issu JOIN ft_t_isgp isgp ON issu.instr_id = isgp.instr_id WHERE issu.instr_issr_id = ? AND issu.iss_typ = 'PORT' AND issu.start_tms &lt;= current_timestamp AND (issu.end_tms IS NULL OR issu.end_tms &gt; current_timestamp) AND isgp.start_tms &lt;= current_timestamp AND (isgp.end_tms IS NULL OR isgp.end_tms &gt; current_timestamp) AND EXISTS ( SELECT 1 FROM ft_t_isrt isrt JOIN ft_t_isgp isgp1 ON isgp1.instr_id = isrt.instr_id WHERE isgp1.prnt_iss_grp_oid = isgp.prnt_iss_grp_oid AND isgp1.prt_purp_typ = 'PRTFLIOC' AND isrt.rtng_eff_tms &lt;= current_timestamp AND (isrt.sys_eff_end_tms IS NULL OR isrt.sys_eff_end_tms &gt; current_timestamp) AND isgp1.start_tms &lt;= current_timestamp AND (isgp1.end_tms IS NULL OR isgp1.end_tms &gt; current_timestamp) AND isrt.orig_data_prov_id = 'DERIVED' ) AND NOT EXISTS ( SELECT COLL_TYP FROM FT_T_ISLL WHERE INSTR_ID = ISSU.INSTR_ID AND COLL_TYP = 'Subordinated' AND START_TMS &lt;= current_timestamp AND (END_TMS IS NULL OR END_TMS &gt; current_timestamp) ) AND EXISTS ( SELECT 1 FROM FT_T_ISST ISST WHERE ISST.STAT_DEF_ID = 'MIZRECAL' AND ISST.INSTR_ID = ISSU.INSTR_ID AND STAT_CHAR_VAL_TXT = 'Y' AND ISST.START_TMS &lt;= current_timestamp AND (ISST.END_TMS IS NULL OR ISST.END_TMS &gt; current_timestamp) ) ) unsub JOIN ( SELECT isgp.prnt_iss_grp_oid, COALESCE( ( SELECT INST_MNEM FROM FT_T_FINS FINS WHERE EXISTS ( SELECT 1 FROM FT_T_FINR WHERE FINSRL_TYP = 'GUARNTOR' AND INST_MNEM = FINS.INST_MNEM AND START_TMS &lt;= current_timestamp AND (END_TMS IS NULL OR END_TMS &gt; current_timestamp) ) AND EXISTS ( SELECT 1 FROM FT_T_FRIP WHERE INST_MNEM = FINS.INST_MNEM AND INSTR_ID = ISSU.INSTR_ID AND START_TMS &lt;= current_timestamp AND (END_TMS IS NULL OR END_TMS &gt; current_timestamp) ) AND START_TMS &lt;= current_timestamp AND (END_TMS IS NULL OR END_TMS &gt; current_timestamp) ), 'NULL' ) AS GUARANTOR, COALESCE( ( SELECT RISS.INSTR_ID FROM FT_T_RISS RISS JOIN FT_T_RIDF RIDF ON RIDF.RLD_ISS_FEAT_ID = RISS.RLD_ISS_FEAT_ID WHERE RISS.ISS_PART_RL_TYP = 'UNDLYING' AND RIDF.REL_TYP = 'CreditLinked' AND RISS.INSTR_ID IS NOT NULL AND RIDF.INSTR_ID = ISSU.INSTR_ID AND RIDF.START_TMS &lt;= current_timestamp AND (RIDF.END_TMS IS NULL OR RIDF.END_TMS &gt; current_timestamp) AND RISS.START_TMS &lt;= current_timestamp AND (RISS.END_TMS IS NULL OR RISS.END_TMS &gt; current_timestamp) LIMIT 1 ), 'NULL' ) AS CREDITLINKED, COALESCE( ( SELECT COLL_TYP FROM FT_T_ISLL WHERE INSTR_ID = ISSU.INSTR_ID AND COLL_TYP = 'Secured' AND START_TMS &lt;= current_timestamp AND (END_TMS IS NULL OR END_TMS &gt; current_timestamp) ), 'NULL' ) AS SECURED, COALESCE( ( SELECT CL_VALUE FROM FT_T_ISCL WHERE INSTR_ID = ISSU.INSTR_ID AND INDUS_CL_SET_ID = 'MIZUNIQE' AND START_TMS &lt;= current_timestamp AND (END_TMS IS NULL OR END_TMS &gt; current_timestamp) ), 'NULL' ) AS UNIQU, COALESCE( ( SELECT ISGP.PRNT_ISS_GRP_OID FROM FT_T_ISGP ISGP JOIN FT_T_ISGR ISGR ON ISGP.PRNT_ISS_GRP_OID = ISGR.ISS_GRP_OID WHERE ISGP.INSTR_ID = ISSU.INSTR_ID AND GRP_NME = 'FCY' AND ISGP.START_TMS &lt;= current_timestamp AND (ISGP.END_TMS IS NULL OR ISGP.END_TMS &gt; current_timestamp) AND ISGR.START_TMS &lt;= current_timestamp AND (ISGR.END_TMS IS NULL OR ISGR.END_TMS &gt; current_timestamp) ), 'NULL' ) AS FCY, COALESCE(issu.series_typ, 'NULL') AS iseries, COALESCE( ( SELECT COLL_GRP_DESC FROM FT_T_ISLL WHERE INSTR_ID = ISSU.INSTR_ID AND COLL_TYP = 'Mortgage Backed' AND COLL_GRP_DESC IS NOT NULL AND START_TMS &lt;= current_timestamp AND (END_TMS IS NULL OR END_TMS &gt; current_timestamp) ), 'NULL' ) AS igroup, issu.instr_id, issu.pref_iss_nme FROM ft_t_issu issu JOIN ft_t_isgp isgp ON issu.instr_id = isgp.instr_id WHERE issu.instr_issr_id = ? AND issu.iss_typ = 'PORT' AND issu.start_tms &lt;= current_timestamp AND (issu.end_tms IS NULL OR issu.end_tms &gt; current_timestamp) AND isgp.start_tms &lt;= current_timestamp AND (isgp.end_tms IS NULL OR isgp.end_tms &gt; current_timestamp) AND EXISTS ( SELECT 1 FROM ft_t_isst isst WHERE ISST.STAT_DEF_ID = 'MIZDRVRL' AND ISST.stat_char_val_txt = 'SUBORDINATED' AND isst.instr_id = ISSU.instr_id AND isst.start_tms &lt;= current_timestamp AND (isst.end_tms IS NULL OR isst.end_tms &gt; current_timestamp) ) AND EXISTS ( SELECT COLL_TYP FROM FT_T_ISLL WHERE INSTR_ID = ISSU.INSTR_ID AND COLL_TYP = 'Subordinated' AND START_TMS &lt;= current_timestamp AND (END_TMS IS NULL OR END_TMS &gt; current_timestamp) ) AND EXISTS ( SELECT 1 FROM FT_T_ISST ISST WHERE ISST.STAT_DEF_ID = 'MIZRECAL' AND ISST.INSTR_ID = ISSU.INSTR_ID AND STAT_CHAR_VAL_TXT = 'N' AND ISST.START_TMS &lt;= current_timestamp AND (ISST.END_TMS IS NULL OR ISST.END_TMS &gt; current_timestamp) ) ) subor ON subor.secured = unsub.secured AND subor.guarantor = unsub.guarantor AND subor.fcy = unsub.fcy AND subor.creditlinked = unsub.creditlinked AND subor.uniqu = unsub.uniqu AND subor.iseries = unsub.iseries)</objectValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="354" type="java.util.HashSet">
<item id="355" type="com.j2fe.workflow.definition.Transition">
<name id="356">rows-found</name>
<source id="357">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="358"/>
<directJoin>false</directJoin>
<name id="359">If Subordinated exists unrated</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="360">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="361" type="java.util.HashSet">
<item id="362" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="363">database</name>
<stringValue id="364">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="365" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="366">indexedParameters[0]</name>
<stringValue id="367">Issuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="368" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="369">querySQL</name>
<objectValue id="370" type="java.lang.String">select&#13;
issu.instr_id&#13;
from ft_t_issu issu, ft_t_isgp isgp where issu.instr_issr_id = ?  and issu.iss_typ = 'PORT'&#13;
and issu.instr_id = isgp.instr_id&#13;
and isgp.prt_purp_typ = 'PRTFLIOP'&#13;
and issu.start_tms &lt;= current_timestamp and (issu.end_tms is null or issu.end_tms &gt; current_timestamp)&#13;
and isgp.start_tms &lt;= current_timestamp and (isgp.end_tms is null or isgp.end_tms &gt; current_timestamp)&#13;
and ((not exists(&#13;
select 1 from ft_t_isrt isrt , ft_t_isgp isgp1 where &#13;
isgp1.instr_id = isrt.instr_id &#13;
and isgp1.prnt_iss_grp_oid = isgp.prnt_iss_grp_oid&#13;
and isgp1.prt_purp_typ = 'PRTFLIOC'&#13;
--RDD-268 start&#13;
--and isrt.start_tms &lt;= current_timestamp and (isrt.end_tms is null or isrt.end_tms &gt; current_timestamp)&#13;
and isrt.rtng_eff_tms &lt;= current_timestamp and (isrt.sys_eff_end_tms is null or isrt.sys_eff_end_tms &gt; current_timestamp)&#13;
--RDD-268 end&#13;
and isgp1.start_tms &lt;= current_timestamp and (isgp1.end_tms is null or isgp1.end_tms &gt; current_timestamp)&#13;
and isrt.orig_data_prov_id = 'DERIVED'))&#13;
or (exists (select 1 from ft_t_isst isst where ISST.STAT_DEF_ID='MIZDRVRL' and isst.stat_char_val_txt = 'SUBORDINATED' and isst.instr_id = ISSU.instr_id&#13;
and isst.start_tms &lt;= current_timestamp and (isst.end_tms is null or isst.end_tms &gt; current_timestamp))))&#13;
--and exists (SELECT COLL_TYP FROM FT_T_ISLL WHERE INSTR_ID = ISSU.INSTR_ID AND COLL_TYP = 'Subordinated' &#13;
--AND START_TMS &lt;= current_timestamp AND (END_TMS IS NULL OR END_TMS &gt; current_timestamp))&#13;
and exists (SELECT 1 FROM FT_T_ISST ISST WHERE ISST.STAT_DEF_ID = 'MIZRECAL' AND ISST.INSTR_ID = issu.instr_id and (stat_char_val_txt = 'Y') and (stat_int_val_num = 0 or stat_int_val_num is null)&#13;
AND ISST.START_TMS &lt;= current_timestamp AND (ISST.END_TMS IS NULL OR ISST.END_TMS &gt; current_timestamp))</objectValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="371" type="java.util.HashSet">
<item id="372" type="com.j2fe.workflow.definition.Transition">
<name id="373">goto-next</name>
<source id="374">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="375"/>
<directJoin>false</directJoin>
<name id="376">CalculatePortfolio</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="377">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="378" type="java.util.HashSet">
<item id="379" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="380">["Issuer"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="381">input["Issuer"]</name>
<stringValue id="382">Issuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="383" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="384">name</name>
<stringValue id="385">CalculatePortfolio</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="386" type="java.util.HashSet">
<item id="387" type="com.j2fe.workflow.definition.Transition">
<name id="388">loop</name>
<source idref="233"/>
<target idref="374"/>
</item>
</sources>
<targets id="389" type="java.util.HashSet">
<item idref="372" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="357"/>
</item>
</sources>
<targets id="390" type="java.util.HashSet">
<item id="391" type="com.j2fe.workflow.definition.Transition">
<name id="392">nothing-found</name>
<source idref="357"/>
<target idref="307"/>
</item>
<item idref="355" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="337"/>
</item>
</sources>
<targets id="393" type="java.util.HashSet">
<item idref="335" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="322"/>
</item>
</sources>
<targets id="394" type="java.util.HashSet">
<item idref="320" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="307"/>
</item>
<item idref="391" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="395" type="java.util.HashSet">
<item idref="305" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="292"/>
</item>
</sources>
<targets id="396" type="java.util.HashSet">
<item idref="290" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="277"/>
</item>
</sources>
<targets id="397" type="java.util.HashSet">
<item idref="275" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="260"/>
</item>
</sources>
<targets id="398" type="java.util.HashSet">
<item idref="258" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="253"/>
</item>
<item id="399" type="com.j2fe.workflow.definition.Transition">
<name id="400">rows-found</name>
<source id="401">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="402"/>
<directJoin>false</directJoin>
<name id="403">Get Issuer</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="404">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="405" type="java.util.HashSet">
<item id="406" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="407">database</name>
<stringValue id="408">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="409" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="410">firstColumnsResult</name>
<stringValue id="411">Issuers</stringValue>
<type>VARIABLE</type>
</item>
<item id="412" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="413">mappedParameters["1-2"]</name>
<stringValue id="414">ioiPurpTyp</stringValue>
<type>VARIABLE</type>
</item>
<item id="415" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="416">querySQL</name>
<objectValue id="417" type="java.lang.String">SELECT INSTR_ISSR_ID FROM FT_T_ISSR ISSR&#13;
WHERE&#13;
(EXISTS(&#13;
SELECT 1 FROM FT_T_ISSU ISSU WHERE ISS_TYP = 'PORT' AND ISSU.INSTR_ISSR_ID = ISSR.INSTR_ISSR_ID&#13;
AND ISSU.START_TMS &lt;= current_timestamp AND (ISSU.END_TMS IS NULL OR END_TMS &gt; current_timestamp)&#13;
AND EXISTS (&#13;
SELECT 1 FROM FT_T_ISST ISST WHERE ISST.INSTR_ID = ISSU.INSTR_ID &#13;
AND ISST.STAT_DEF_ID = 'MIZRECAL' AND STAT_CHAR_VAL_TXT = 'Y'&#13;
AND ISST.START_TMS &lt;= current_timestamp AND (ISST.END_TMS IS NULL OR ISST.END_TMS &gt; current_timestamp)))&#13;
OR EXISTS (&#13;
SELECT 1 FROM FT_T_ISSU ISSU WHERE ISSU.INSTR_ISSR_ID = ISSR.INSTR_ISSR_ID&#13;
AND ISSU.START_TMS &lt;= current_timestamp AND (ISSU.END_TMS IS NULL OR END_TMS &gt; current_timestamp)&#13;
AND EXISTS (SELECT 1 FROM FT_T_ISTY ISTY WHERE ISTY.ISS_TYP = ISSU.ISS_TYP AND ISTY.PRNT_ISS_TYP ='DEBT'&#13;
AND ISTY.START_TMS &lt;=current_timestamp AND (ISTY.END_TMS IS NULL OR ISTY.END_TMS &gt; current_timestamp))&#13;
AND NOT EXISTS (SELECT 1 FROM FT_T_ISGP ISGP WHERE ISGP.INSTR_ID = ISSU.INSTR_ID&#13;
AND ISGP.START_TMS &lt;= current_timestamp AND (ISGP.END_TMS IS NULL OR ISGP.END_TMS &gt; current_timestamp)&#13;
AND ISGP.PRT_PURP_TYP = 'PRTFLIOC')&#13;
AND EXISTS (SELECT 1 FROM FT_T_ISGP ISGP, FT_T_ISGR ISGR WHERE ISGP.INSTR_ID = ISSU.INSTR_ID&#13;
AND ISGP.START_TMS &lt;= current_timestamp AND (ISGP.END_TMS IS NULL OR ISGP.END_TMS &gt; current_timestamp)&#13;
AND ISGP.PRT_PURP_TYP = ? AND ISGP.PRNT_ISS_GRP_OID = ISGR.ISS_GRP_OID AND ISGR.ORG_ID != 'MHSC')))&#13;
AND EXISTS (SELECT 1 FROM FT_T_IRGP IRGP WHERE IRGP.PRT_PURP_TYP=? AND IRGP.INSTR_ISSR_ID = ISSR.INSTR_ISSR_ID&#13;
AND IRGP.START_TMS &lt;= current_timestamp AND (IRGP.END_TMS IS NULL OR IRGP.END_TMS &gt; current_timestamp))</objectValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="418" type="java.util.HashSet">
<item id="419" type="com.j2fe.workflow.definition.Transition">
<name id="420">Y</name>
<source id="421">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="422"/>
<directJoin>false</directJoin>
<name id="423">Scheduled?</name>
<nodeHandler>com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandler>
<nodeHandlerClass id="424">com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandlerClass>
<parameters id="425" type="java.util.HashSet">
<item id="426" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="427">caseItem</name>
<stringValue id="428">Scheduled</stringValue>
<type>VARIABLE</type>
</item>
<item id="429" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="430">defaultItem</name>
<stringValue id="431">N</stringValue>
<type>CONSTANT</type>
</item>
<item id="432" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="433">nullTransition</name>
<stringValue id="434">N</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="435" type="java.util.HashSet">
<item id="436" type="com.j2fe.workflow.definition.Transition">
<name id="437">goto-next</name>
<source id="438">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="439"/>
<directJoin>false</directJoin>
<name id="440">Delete ISGP for issu which is not in same issuer of portfolio</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="441">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="442" type="java.util.HashSet">
<item id="443" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="444">database</name>
<stringValue id="445">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="446" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="447">querySQL</name>
<objectValue id="448" type="java.lang.String">UPDATE FT_T_ISGP SET END_TMS = current_timestamp, LAST_CHG_USR_ID = 'RecalculatePortfolio', LAST_CHG_TMS = current_timestamp&#13;
WHERE START_TMS &lt;= current_timestamp AND (END_TMS IS NULL OR END_TMS &gt; current_timestamp)&#13;
AND PRT_PURP_TYP = 'PRTFLIOC' AND INSTR_ID IN (&#13;
select ISSU.INSTR_ID from ft_t_issu issu, FT_T_ISGP ISGP, FT_T_ISGP ISGPP&#13;
where 1=1 &#13;
AND ISSU.START_TMS &lt;=current_timestamp AND (ISSU.END_TMS IS NULL OR ISSU.END_TMS &gt; current_timestamp)&#13;
and EXISTS (SELECT 1 FROM FT_T_ISTY ISTY WHERE ISTY.ISS_TYP = ISSU.ISS_TYP AND ISTY.PRNT_ISS_TYP ='DEBT'&#13;
AND ISTY.START_TMS &lt;=current_timestamp AND (ISTY.END_TMS IS NULL OR ISTY.END_TMS &gt; current_timestamp))&#13;
AND ISGP.INSTR_ID = ISSU.INSTR_ID&#13;
AND ISGP.START_TMS &lt;= current_timestamp AND (ISGP.END_TMS IS NULL OR ISGP.END_TMS &gt; current_timestamp)&#13;
AND ISGPP.START_TMS &lt;= current_timestamp AND (ISGPP.END_TMS IS NULL OR ISGPP.END_TMS &gt; current_timestamp)&#13;
AND ISGP.PRT_PURP_TYP = 'PRTFLIOC'&#13;
AND ISGPP.PRT_PURP_TYP = 'PRTFLIOP'&#13;
AND ISGP.PRNT_ISS_GRP_OID = ISGPP.PRNT_ISS_GRP_OID&#13;
AND NOT EXISTS (SELECT 1 FROM FT_T_ISSU ISSUP WHERE ISSUP.ISS_TYP = 'PORT'&#13;
AND ISSUP.START_TMS &lt;=current_timestamp AND (ISSUP.END_TMS IS NULL OR ISSUP.END_TMS &gt; current_timestamp)&#13;
AND ISSUP.INSTR_ID = ISGPP.INSTR_ID&#13;
AND ISSUP.INSTR_ISSR_ID = ISSU.INSTR_ISSR_ID))</objectValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="449" type="java.util.HashSet">
<item id="450" type="com.j2fe.workflow.definition.Transition">
<name id="451">goto-next</name>
<source id="452">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="453"/>
<directJoin>false</directJoin>
<name id="454">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="455">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="456" type="java.util.HashSet"/>
<targets id="457" type="java.util.HashSet">
<item idref="450" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="438"/>
</item>
</sources>
<targets id="458" type="java.util.HashSet">
<item idref="436" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="421"/>
</item>
</sources>
<targets id="459" type="java.util.HashSet">
<item id="460" type="com.j2fe.workflow.definition.Transition">
<name id="461">N</name>
<source idref="421"/>
<target id="462">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="463"/>
<directJoin>false</directJoin>
<name id="464">CalculatePortfolio</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="465">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="466" type="java.util.HashSet">
<item id="467" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="468">["Issuer"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="469">input["Issuer"]</name>
<stringValue id="470">Issuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="471" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="472">name</name>
<stringValue id="473">CalculatePortfolio</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="474" type="java.util.HashSet">
<item idref="460" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="475" type="java.util.HashSet">
<item id="476" type="com.j2fe.workflow.definition.Transition">
<name id="477">goto-next</name>
<source idref="462"/>
<target id="478">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="479"/>
<directJoin>false</directJoin>
<name id="480">If Subordinated exists unrated</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="481">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="482" type="java.util.HashSet">
<item id="483" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="484">database</name>
<stringValue id="485">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="486" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="487">indexedParameters[0]</name>
<stringValue id="488">Issuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="489" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="490">querySQL</name>
<objectValue id="491" type="java.lang.String">select&#13;
issu.instr_id&#13;
from ft_t_issu issu, ft_t_isgp isgp where issu.instr_issr_id = ?  and issu.iss_typ = 'PORT'&#13;
and issu.instr_id = isgp.instr_id&#13;
and isgp.prt_purp_typ = 'PRTFLIOP'&#13;
and issu.start_tms &lt;= current_timestamp and (issu.end_tms is null or issu.end_tms &gt; current_timestamp)&#13;
and isgp.start_tms &lt;= current_timestamp and (isgp.end_tms is null or isgp.end_tms &gt; current_timestamp)&#13;
and ((not exists(&#13;
select 1 from ft_t_isrt isrt , ft_t_isgp isgp1 where &#13;
isgp1.instr_id = isrt.instr_id &#13;
and isgp1.prnt_iss_grp_oid = isgp.prnt_iss_grp_oid&#13;
and isgp1.prt_purp_typ = 'PRTFLIOC'&#13;
--RDD-268 start &#13;
--and isrt.start_tms &lt;= current_timestamp and (isrt.end_tms is null or isrt.end_tms &gt; current_timestamp)&#13;
and isrt.RTNG_EFF_TMS &lt;= current_timestamp and (isrt.SYS_EFF_END_TMS is null or isrt.SYS_EFF_END_TMS &gt; current_timestamp)&#13;
--RDD-268 end&#13;
and isgp1.start_tms &lt;= current_timestamp and (isgp1.end_tms is null or isgp1.end_tms &gt; current_timestamp)&#13;
and isrt.orig_data_prov_id = 'DERIVED'))&#13;
or (exists (select 1 from ft_t_isst isst where ISST.STAT_DEF_ID='MIZDRVRL' and isst.stat_char_val_txt = 'SUBORDINATED' and isst.instr_id = ISSU.instr_id&#13;
and isst.start_tms &lt;= current_timestamp and (isst.end_tms is null or isst.end_tms &gt; current_timestamp))))&#13;
and exists (SELECT COLL_TYP FROM FT_T_ISLL WHERE INSTR_ID = ISSU.INSTR_ID AND COLL_TYP = 'Subordinated' &#13;
AND START_TMS &lt;= current_timestamp AND (END_TMS IS NULL OR END_TMS &gt; current_timestamp))&#13;
and exists (SELECT 1 FROM FT_T_ISST ISST WHERE ISST.STAT_DEF_ID = 'MIZRECAL' AND ISST.INSTR_ID = issu.instr_id and (stat_char_val_txt = 'Y') and (stat_int_val_num = 0 or stat_int_val_num is null)&#13;
AND ISST.START_TMS &lt;= current_timestamp AND (ISST.END_TMS IS NULL OR ISST.END_TMS &gt; current_timestamp))</objectValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="492" type="java.util.HashSet">
<item idref="476" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="493" type="java.util.HashSet">
<item id="494" type="com.j2fe.workflow.definition.Transition">
<name id="495">nothing-found</name>
<source idref="478"/>
<target id="496">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="497"/>
<directJoin>false</directJoin>
<name id="498">Recalculate CreditLinked Portfolio</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="499">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="500" type="java.util.HashSet">
<item id="501" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="502">["Issuer"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="503">input["Issuer"]</name>
<stringValue id="504">Issuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="505" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="506">name</name>
<stringValue id="507">DeriveFromCreditLinkedRating</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="508" type="java.util.HashSet">
<item id="509" type="com.j2fe.workflow.definition.Transition">
<name id="510">goto-next</name>
<source id="511">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="512"/>
<directJoin>false</directJoin>
<name id="513">Recalculate Subordinated Portfolio</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="514">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="515" type="java.util.HashSet">
<item id="516" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="517">["Issuer"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="518">input["Issuer"]</name>
<stringValue id="519">Issuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="520" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="521">name</name>
<stringValue id="522">SubordinatedPortfolioCalc</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="523" type="java.util.HashSet">
<item id="524" type="com.j2fe.workflow.definition.Transition">
<name id="525">goto-next</name>
<source id="526">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="527"/>
<directJoin>false</directJoin>
<name id="528">Set Subordinated Portfolio to recalculate</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="529">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="530" type="java.util.HashSet">
<item id="531" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="532">database</name>
<stringValue id="533">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="534" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="535">indexedParameters[0]</name>
<stringValue id="536">Issuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="537" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="538">indexedParameters[1]</name>
<stringValue id="539">Issuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="540" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="541">querySQL</name>
<objectValue id="542" type="java.lang.String">UPDATE FT_T_ISST SET STAT_CHAR_VAL_TXT = 'Y', STAT_VAL_TMS = now(), LAST_CHG_USR_ID = 'RecalculatePortfolio', LAST_CHG_TMS = now(), DATA_SRC_ID= NULL
WHERE STAT_DEF_ID = 'MIZRECAL' 
and STAT_CHAR_VAL_TXT = 'N'
AND START_TMS &lt;= now() AND (END_TMS IS NULL OR END_TMS &gt; now())
AND instr_id in (
select subor.instr_id from
(select isgp.prnt_iss_grp_oid,
coalesce((SELECT INST_MNEM FROM FT_T_FINS FINS
WHERE EXISTS(SELECT 1 FROM FT_T_FINR WHERE FINSRL_TYP = 'GUARNTOR' AND INST_MNEM = FINS.INST_MNEM AND START_TMS &lt;= now() AND (END_TMS IS NULL OR END_TMS &gt; now()))
AND EXISTS(SELECT 1 FROM FT_T_FRIP WHERE INST_MNEM = FINS.INST_MNEM AND INSTR_ID =  ISSU.INSTR_ID AND START_TMS &lt;= now() AND (END_TMS IS NULL OR END_TMS &gt; now()))
AND START_TMS &lt;= now() AND (END_TMS IS NULL OR END_TMS &gt; now())),'NULL') AS GUARANTOR,
coalesce((SELECT RISS.INSTR_ID FROM FT_T_RISS RISS, FT_T_RIDF RIDF WHERE RISS.ISS_PART_RL_TYP = 'UNDLYING' AND RIDF.REL_TYP = 'CreditLinked'
AND RIDF.RLD_ISS_FEAT_ID = RISS.RLD_ISS_FEAT_ID AND RISS.INSTR_ID IS NOT NULL AND RIDF.INSTR_ID = ISSU.INSTR_ID
AND RIDF.START_TMS &lt;= now() AND (RIDF.END_TMS IS NULL OR RIDF.END_TMS &gt; now())
AND RISS.START_TMS &lt;= now() AND (RISS.END_TMS IS NULL OR RISS.END_TMS &gt; now()) limit 1),'NULL') AS CREDITLINKED,
coalesce((SELECT COLL_TYP FROM FT_T_ISLL WHERE INSTR_ID = ISSU.INSTR_ID AND COLL_TYP = 'Secured' 
AND START_TMS &lt;= now() AND (END_TMS IS NULL OR END_TMS &gt; now())),'NULL') AS SECURED,
coalesce((SELECT CL_VALUE FROM FT_T_ISCL WHERE INSTR_ID = ISSU.INSTR_ID AND INDUS_CL_SET_ID= 'MIZUNIQE' 
AND START_TMS &lt;= now() AND (END_TMS IS NULL OR END_TMS &gt; now())),'NULL') AS UNIQU,
coalesce((SELECT ISGP.PRNT_ISS_GRP_OID FROM FT_T_ISGP ISGP, FT_T_ISGR ISGR
where isgp.prnt_iss_grp_oid = isgr.iss_grp_oid and isgp.instr_id = ISSU.INSTR_ID and GRP_nme = 'FCY'
AND ISGP.START_TMS &lt;= now() AND (ISGP.END_TMS IS NULL OR ISGP.END_TMS &gt; now())
AND ISGR.START_TMS &lt;= now() AND (ISGR.END_TMS IS NULL OR ISGR.END_TMS &gt; now())),'NULL') AS FCY,
coalesce(issu.series_typ,'NULL') iseries,
coalesce((SELECT coll_grp_desc FROM FT_T_ISLL WHERE INSTR_ID = ISSU.INSTR_ID AND COLL_TYP = 'Mortgage Backed' and coll_grp_desc is not null
AND START_TMS &lt;= now() AND (END_TMS IS NULL OR END_TMS &gt; now())),'NULL') AS igroup,
issu.pref_iss_nme
from ft_t_issu issu, ft_t_isgp isgp where issu.instr_issr_id = ?  and issu.iss_typ = 'PORT'
and issu.instr_id = isgp.instr_id
and isgp.prt_purp_typ = 'PRTFLIOP'
and issu.start_tms &lt;= now() and (issu.end_tms is null or issu.end_tms &gt; now())
and isgp.start_tms &lt;= now() and (isgp.end_tms is null or isgp.end_tms &gt; now())
and exists (
select 1 from ft_t_isrt isrt , ft_t_isgp isgp1 where 
isgp1.instr_id = isrt.instr_id 
and isgp1.prnt_iss_grp_oid = isgp.prnt_iss_grp_oid
and isgp1.prt_purp_typ = 'PRTFLIOC'
--RDD-268 start 
--and isrt.start_tms &lt;= now() and (isrt.end_tms is null or isrt.end_tms &gt; now())
and isrt.rtng_eff_tms &lt;= now() and (isrt.sys_eff_end_tms is null or isrt.sys_eff_end_tms &gt; now())
--RDD-268 end
and isgp1.start_tms &lt;= now() and (isgp1.end_tms is null or isgp1.end_tms &gt; now())
and isrt.orig_data_prov_id = 'DERIVED')
and not exists (SELECT COLL_TYP FROM FT_T_ISLL WHERE INSTR_ID = ISSU.INSTR_ID AND COLL_TYP = 'Subordinated' 
AND START_TMS &lt;= now() AND (END_TMS IS NULL OR END_TMS &gt; now()))
and exists (SELECT 1 FROM FT_T_ISST ISST WHERE ISST.STAT_DEF_ID = 'MIZRECAL' AND ISST.INSTR_ID = issu.instr_id and stat_char_val_txt = 'Y'
AND ISST.START_TMS &lt;= now() AND (ISST.END_TMS IS NULL OR ISST.END_TMS &gt; now()))) unsub,
(select isgp.prnt_iss_grp_oid,
coalesce((SELECT INST_MNEM FROM FT_T_FINS FINS
WHERE EXISTS(SELECT 1 FROM FT_T_FINR WHERE FINSRL_TYP = 'GUARNTOR' AND INST_MNEM = FINS.INST_MNEM AND START_TMS &lt;= now() AND (END_TMS IS NULL OR END_TMS &gt; now()))
AND EXISTS(SELECT 1 FROM FT_T_FRIP WHERE INST_MNEM = FINS.INST_MNEM AND INSTR_ID =  ISSU.INSTR_ID AND START_TMS &lt;= now() AND (END_TMS IS NULL OR END_TMS &gt; now()))
AND START_TMS &lt;= now() AND (END_TMS IS NULL OR END_TMS &gt; now())),'NULL') AS GUARANTOR,
coalesce((SELECT RISS.INSTR_ID FROM FT_T_RISS RISS, FT_T_RIDF RIDF WHERE RISS.ISS_PART_RL_TYP = 'UNDLYING' AND RIDF.REL_TYP = 'CreditLinked'
AND RIDF.RLD_ISS_FEAT_ID = RISS.RLD_ISS_FEAT_ID AND RISS.INSTR_ID IS NOT NULL AND RIDF.INSTR_ID = ISSU.INSTR_ID
AND RIDF.START_TMS &lt;= now() AND (RIDF.END_TMS IS NULL OR RIDF.END_TMS &gt; now())
AND RISS.START_TMS &lt;= now() AND (RISS.END_TMS IS NULL OR RISS.END_TMS &gt; now()) limit 1),'NULL') AS CREDITLINKED,
coalesce((SELECT COLL_TYP FROM FT_T_ISLL WHERE INSTR_ID = ISSU.INSTR_ID AND COLL_TYP = 'Secured' 
AND START_TMS &lt;= now() AND (END_TMS IS NULL OR END_TMS &gt; now())),'NULL') AS SECURED,
coalesce((SELECT CL_VALUE FROM FT_T_ISCL WHERE INSTR_ID = ISSU.INSTR_ID AND INDUS_CL_SET_ID= 'MIZUNIQE' 
AND START_TMS &lt;= now() AND (END_TMS IS NULL OR END_TMS &gt; now())),'NULL') AS UNIQU,
coalesce((SELECT ISGP.PRNT_ISS_GRP_OID FROM FT_T_ISGP ISGP, FT_T_ISGR ISGR
where isgp.prnt_iss_grp_oid = isgr.iss_grp_oid and isgp.instr_id = ISSU.INSTR_ID and GRP_nme = 'FCY'
AND ISGP.START_TMS &lt;= now() AND (ISGP.END_TMS IS NULL OR ISGP.END_TMS &gt; now())
AND ISGR.START_TMS &lt;= now() AND (ISGR.END_TMS IS NULL OR ISGR.END_TMS &gt; now())),'NULL') AS FCY,
coalesce(issu.series_typ,'NULL') iseries,
coalesce((SELECT coll_grp_desc FROM FT_T_ISLL WHERE INSTR_ID = ISSU.INSTR_ID AND COLL_TYP = 'Mortgage Backed' and coll_grp_desc is not null
AND START_TMS &lt;= now() AND (END_TMS IS NULL OR END_TMS &gt; now())),'NULL') AS igroup,
issu.instr_id,issu.pref_iss_nme
from ft_t_issu issu, ft_t_isgp isgp where issu.instr_issr_id = ?  and issu.iss_typ = 'PORT'
and issu.instr_id = isgp.instr_id
and isgp.prt_purp_typ = 'PRTFLIOP'
and issu.start_tms &lt;= now() and (issu.end_tms is null or issu.end_tms &gt; now())
and isgp.start_tms &lt;= now() and (isgp.end_tms is null or isgp.end_tms &gt; now())
and exists (select 1 from ft_t_isst isst where ISST.STAT_DEF_ID='MIZDRVRL' and isst.stat_char_val_txt = 'SUBORDINATED' and isst.instr_id = ISSU.instr_id
and isst.start_tms &lt;= now() and (isst.end_tms is null or isst.end_tms &gt; now()))
and exists (SELECT COLL_TYP FROM FT_T_ISLL WHERE INSTR_ID = ISSU.INSTR_ID AND COLL_TYP = 'Subordinated' 
AND START_TMS &lt;= now() AND (END_TMS IS NULL OR END_TMS &gt; now()))
and exists (SELECT 1 FROM FT_T_ISST ISST WHERE ISST.STAT_DEF_ID = 'MIZRECAL' 
AND ISST.INSTR_ID = issu.instr_id and stat_char_val_txt = 'N'
AND ISST.START_TMS &lt;= now() AND (ISST.END_TMS IS NULL OR ISST.END_TMS &gt; now())))subor
where subor.secured = unsub.secured
and subor.guarantor = unsub.guarantor
and subor.fcy = unsub.fcy
and subor.creditlinked = unsub.creditlinked
and subor.uniqu = unsub.uniqu
and subor.iseries = unsub.iseries
and subor.igroup = unsub.igroup)</objectValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="543" type="java.util.HashSet">
<item id="544" type="com.j2fe.workflow.definition.Transition">
<name id="545">rows-found</name>
<source idref="478"/>
<target idref="526"/>
</item>
</sources>
<targets id="546" type="java.util.HashSet">
<item idref="524" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="511"/>
</item>
</sources>
<targets id="547" type="java.util.HashSet">
<item idref="509" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="496"/>
</item>
<item idref="494" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="548" type="java.util.HashSet">
<item id="549" type="com.j2fe.workflow.definition.Transition">
<name id="550">goto-next</name>
<source idref="496"/>
<target id="551">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="552"/>
<directJoin>false</directJoin>
<name id="553">Calculate JBIS and CAR</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="554">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="555" type="java.util.HashSet">
<item id="556" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="557">["Issuer"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="558">input["Issuer"]</name>
<stringValue id="559">Issuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="560" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="561">name</name>
<stringValue id="562">CalculateJBISandCAR</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="563" type="java.util.HashSet">
<item idref="549" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="564" type="java.util.HashSet">
<item id="565" type="com.j2fe.workflow.definition.Transition">
<name id="566">goto-next</name>
<source idref="551"/>
<target id="567">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="568"/>
<directJoin>false</directJoin>
<name id="569">Calculate Basel II</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="570">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="571" type="java.util.HashSet">
<item id="572" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="573">["Issuer"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="574">input["Issuer"]</name>
<stringValue id="575">Issuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="576" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="577">name</name>
<stringValue id="578">DeriveBaselIIAsetRating</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="579" type="java.util.HashSet">
<item idref="565" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="580" type="java.util.HashSet">
<item id="581" type="com.j2fe.workflow.definition.Transition">
<name id="582">goto-next</name>
<source idref="567"/>
<target id="583">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="584"/>
<directJoin>false</directJoin>
<name id="585">Update Re-Calculate Flag</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="586">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="587" type="java.util.HashSet">
<item id="588" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="589">database</name>
<stringValue id="590">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="591" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="592">indexedParameters[0]</name>
<stringValue id="593">Issuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="594" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="595">querySQL</name>
<stringValue id="596">UPDATE FT_T_ISST  SET STAT_CHAR_VAL_TXT = 'N', STAT_VAL_TMS = current_timestamp, LAST_CHG_USR_ID = 'RecalculatePortfolio', LAST_CHG_TMS = current_timestamp, DATA_SRC_ID= NULL&#13;
WHERE STAT_DEF_ID = 'MIZRECAL' &#13;
AND STAT_CHAR_VAL_TXT = 'Y'&#13;
AND START_TMS &lt;= current_timestamp AND (END_TMS IS NULL OR END_TMS &gt; current_timestamp)&#13;
AND EXISTS (SELECT 1 FROM FT_T_ISSU ISSU WHERE ISSU.INSTR_ID = INSTR_ID AND ISSU.INSTR_ISSR_ID = ?&#13;
AND ISSU.ISS_TYP = 'PORT')</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="597" type="java.util.HashSet">
<item idref="581" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="598" type="java.util.HashSet">
<item id="599" type="com.j2fe.workflow.definition.Transition">
<name id="600">goto-next</name>
<source idref="583"/>
<target idref="226"/>
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
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item idref="544" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</target>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item idref="419" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="401"/>
</item>
</sources>
<targets id="601" type="java.util.HashSet">
<item id="602" type="com.j2fe.workflow.definition.Transition">
<name id="603">nothing-found</name>
<source idref="401"/>
<target idref="226"/>
</item>
<item idref="399" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="253"/>
</item>
</sources>
<targets id="604" type="java.util.HashSet">
<item idref="251" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="233"/>
</item>
</sources>
<targets id="605" type="java.util.HashSet">
<item idref="231" type="com.j2fe.workflow.definition.Transition"/>
<item idref="387" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="226"/>
</item>
<item idref="599" type="com.j2fe.workflow.definition.Transition"/>
<item idref="602" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="606" type="java.util.HashSet">
<item idref="224" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="212"/>
</item>
</sources>
<targets id="607" type="java.util.HashSet">
<item idref="210" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="198"/>
</item>
</sources>
<targets id="608" type="java.util.HashSet">
<item idref="196" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="184"/>
</item>
</sources>
<targets id="609" type="java.util.HashSet">
<item idref="182" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="170"/>
</item>
</sources>
<targets id="610" type="java.util.HashSet">
<item idref="168" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="138"/>
</item>
</sources>
<targets id="611" type="java.util.HashSet">
<item idref="136" type="com.j2fe.workflow.definition.Transition"/>
<item id="612" type="com.j2fe.workflow.definition.Transition">
<name id="613">no-extraction</name>
<source idref="138"/>
<target idref="24"/>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="114"/>
</item>
</sources>
<targets id="614" type="java.util.HashSet">
<item idref="112" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="97"/>
</item>
</sources>
<targets id="615" type="java.util.HashSet">
<item idref="95" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDSPLIT</type>
</source>
<target idref="63"/>
</item>
</sources>
<targets id="616" type="java.util.HashSet">
<item idref="61" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="56"/>
</item>
</sources>
<targets id="617" type="java.util.HashSet">
<item idref="54" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDJOIN</type>
</source>
<target idref="49"/>
</item>
</sources>
<targets id="618" type="java.util.HashSet">
<item idref="47" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="35"/>
</item>
</sources>
<targets id="619" type="java.util.HashSet">
<item idref="33" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="24"/>
</item>
<item idref="612" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="620" type="java.util.HashSet">
<item idref="22" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="10"/>
</item>
</sources>
<targets id="621" type="java.util.HashSet">
<item idref="8" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="3"/>
</item>
</sources>
<targets id="622" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="623">Mizuho/Ratings</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="624">user1</lastChangeUser>
<lastUpdate id="625">2025-12-31T12:23:04.000+0000</lastUpdate>
<name id="626">RecalculatePortfolio</name>
<nodes id="627" type="java.util.HashSet">
<item idref="138" type="com.j2fe.workflow.definition.Node"/>
<item idref="114" type="com.j2fe.workflow.definition.Node"/>
<item idref="97" type="com.j2fe.workflow.definition.Node"/>
<item idref="277" type="com.j2fe.workflow.definition.Node"/>
<item idref="567" type="com.j2fe.workflow.definition.Node"/>
<item idref="292" type="com.j2fe.workflow.definition.Node"/>
<item idref="551" type="com.j2fe.workflow.definition.Node"/>
<item idref="462" type="com.j2fe.workflow.definition.Node"/>
<item idref="374" type="com.j2fe.workflow.definition.Node"/>
<item idref="10" type="com.j2fe.workflow.definition.Node"/>
<item idref="35" type="com.j2fe.workflow.definition.Node"/>
<item idref="438" type="com.j2fe.workflow.definition.Node"/>
<item idref="198" type="com.j2fe.workflow.definition.Node"/>
<item idref="24" type="com.j2fe.workflow.definition.Node"/>
<item idref="401" type="com.j2fe.workflow.definition.Node"/>
<item idref="478" type="com.j2fe.workflow.definition.Node"/>
<item idref="357" type="com.j2fe.workflow.definition.Node"/>
<item idref="212" type="com.j2fe.workflow.definition.Node"/>
<item idref="184" type="com.j2fe.workflow.definition.Node"/>
<item idref="170" type="com.j2fe.workflow.definition.Node"/>
<item idref="233" type="com.j2fe.workflow.definition.Node"/>
<item idref="253" type="com.j2fe.workflow.definition.Node"/>
<item idref="226" type="com.j2fe.workflow.definition.Node"/>
<item idref="49" type="com.j2fe.workflow.definition.Node"/>
<item idref="63" type="com.j2fe.workflow.definition.Node"/>
<item idref="307" type="com.j2fe.workflow.definition.Node"/>
<item idref="496" type="com.j2fe.workflow.definition.Node"/>
<item idref="511" type="com.j2fe.workflow.definition.Node"/>
<item idref="322" type="com.j2fe.workflow.definition.Node"/>
<item idref="421" type="com.j2fe.workflow.definition.Node"/>
<item idref="526" type="com.j2fe.workflow.definition.Node"/>
<item idref="337" type="com.j2fe.workflow.definition.Node"/>
<item idref="452" type="com.j2fe.workflow.definition.Node"/>
<item idref="3" type="com.j2fe.workflow.definition.Node"/>
<item idref="56" type="com.j2fe.workflow.definition.Node"/>
<item idref="260" type="com.j2fe.workflow.definition.Node"/>
<item idref="583" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>false</optimize>
<parameter id="628" type="java.util.HashMap">
<entry>
<key id="629" type="java.lang.String">Issuer</key>
<value id="630" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="631">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="632" type="java.lang.String">Scheduled</key>
<value id="633" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="634">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
</parameter>
<permissions id="635" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>false</purgeAtEnd>
<retries>0</retries>
<startNode idref="452"/>
<status>RELEASED</status>
<variables id="636" type="java.util.HashMap">
<entry>
<key id="637" type="java.lang.String">Issuer</key>
<value id="638" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="639">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="640" type="java.lang.String">JMSDestinationSecurity</key>
<value id="641" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="642">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="643"/>
<persistent>false</persistent>
<value id="644" type="java.lang.String">jms/queue/security</value>
</value>
</entry>
<entry>
<key id="645" type="java.lang.String">LoopCounter</key>
<value id="646" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="647">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<persistent>false</persistent>
<value id="648" type="java.lang.Integer">0</value>
</value>
</entry>
<entry>
<key id="649" type="java.lang.String">OutputMsg</key>
<value id="650" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="651">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="652"/>
<persistent>false</persistent>
<value id="653" type="java.lang.String">&lt;?xml version="1.0" encoding="UTF-8"?&gt;&lt;OutputMsg&gt;Portfolio Recalculated, Please click on Reload Entity&lt;/OutputMsg&gt;</value>
</value>
</entry>
<entry>
<key id="654" type="java.lang.String">Scheduled</key>
<value id="655" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="656">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="657" type="java.lang.String">N</value>
</value>
</entry>
<entry>
<key id="658" type="java.lang.String">ioiPurpTyp</key>
<value id="659" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="660">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="661" type="java.lang.String">INTEREST</value>
</value>
</entry>
</variables>
<version>17</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
