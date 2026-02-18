<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.09">
<package-comment/>
<businessobject displayString="16 - V10-NewLine_changes" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>true</alwaysPersist>
<clustered>true</clustered>
<comment id="1">V10-NewLine_changes</comment>
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
<name id="8">end-loop</name>
<source id="9">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="10"/>
<directJoin>false</directJoin>
<name id="11">For Loop to get all rows</name>
<nodeHandler>com.j2fe.workflow.handler.impl.ForEach</nodeHandler>
<nodeHandlerClass id="12">com.j2fe.workflow.handler.impl.ForEach</nodeHandlerClass>
<parameters id="13" type="java.util.HashSet">
<item id="14" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="15">counter</name>
<stringValue id="16">forLoopCnt</stringValue>
<type>VARIABLE</type>
</item>
<item id="17" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="18">counter</name>
<stringValue id="19">forLoopCnt</stringValue>
<type>VARIABLE</type>
</item>
<item id="20" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="21">input</name>
<stringValue id="22">BoEUpdatesReportList</stringValue>
<type>VARIABLE</type>
</item>
<item id="23" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="24">output</name>
<stringValue id="25">BoEUpdatesReportRow</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="26" type="java.util.HashSet">
<item id="27" type="com.j2fe.workflow.definition.Transition">
<name id="28">ToSplit</name>
<source id="29">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="30">Automatically generated</description>
<directJoin>false</directJoin>
<name id="31">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="32">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="33" type="java.util.HashSet">
<item id="34" type="com.j2fe.workflow.definition.Transition">
<name id="35">goto-next</name>
<source id="36">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="37"/>
<directJoin>false</directJoin>
<name id="38">Create File Name</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="39">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="40" type="java.util.HashSet">
<item id="41" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="42">statements</name>
<stringValue id="43">import java.util.Date;&#13;
&#13;
import java.text.DateFormat;&#13;
&#13;
import java.text.SimpleDateFormat;&#13;
&#13;
DateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd-HH_mm_ss_SSS");&#13;
&#13;
Date date = new Date();&#13;
&#13;
String filename = baseName + "_" + dateFormat.format(date) + ".csv";&#13;
</stringValue>
<type>CONSTANT</type>
</item>
<item id="44" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="45">["baseName"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="46">variables["baseName"]</name>
<stringValue id="47">QueryNameForPublishing</stringValue>
<type>VARIABLE</type>
</item>
<item id="48" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="49">["filename"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="50">variables["filename"]</name>
<stringValue id="51">fileNameBase</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="52" type="java.util.HashSet">
<item id="53" type="com.j2fe.workflow.definition.Transition">
<name id="54">rows-found</name>
<source id="55">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="56"/>
<directJoin>false</directJoin>
<name id="57">Fetch Rows from Query</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="58">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="59" type="java.util.HashSet">
<item id="60" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="61">database</name>
<stringValue id="62">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="63" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="64">firstColumnsResult</name>
<stringValue id="65">BoEUpdatesReportList</stringValue>
<type>VARIABLE</type>
</item>
<item id="66" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="67">mappedParameters["1"]</name>
<stringValue id="68">LastNumDaysToCheck</stringValue>
<type>VARIABLE</type>
</item>
<item id="69" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="70">["2"]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="71">mappedParameters["2"]</name>
<stringValue id="72">LastNumDaysToCheck</stringValue>
<type>VARIABLE</type>
</item>
<item id="73" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="74">querySQL</name>
<objectValue id="75" type="java.lang.String">select concat(
  'Customer Name',',','Stratus Ref',',','Customer Status',',','New Customer BOE',',','CustBOEChgDate',',','CustBOEChgBy',',','Institution Name',',','BB CompanyId',',','Old BOE',',','New BOE'
  ,',','Changed Date',',','Changed By',',','Industry Group',',','Industry Subgroup'
  ,',','Industry Sector',',','Domicile',',','Issuer Name',',','Client Ref',',','SOI Asset Count'), 1 as ordernum
union all 
select concat(
  COALESCE("Customer Name",''),',',COALESCE("Stratus Ref",''),',',COALESCE("Customer Status",''),',',COALESCE("New Customer BOE",''),',',COALESCE(to_char("CustBOEChgDate"::timestamp, 'YYYY-MM-DD'),''),',',COALESCE("CustBOEChgBy",''),',',COALESCE("Institution Name",''),',',COALESCE("BB CompanyId",''),',',COALESCE("Old BOE",''),',',COALESCE("New BOE",'')
  ,',',COALESCE(to_char("Changed Date"::timestamp, 'YYYY-MM-DD'),''),',',COALESCE("Changed By",''),',',COALESCE("Industry Group",''),',',COALESCE("Industry Subgroup",'')
  ,',',COALESCE("Industry Sector",''),',',COALESCE("Domicile",''),',',COALESCE("Issuer Name",''),',',COALESCE("Client Ref",''),',',COALESCE(CAST("SOI Count" AS VARCHAR),''))
  , 3 as ordernum
from (
  select
    replace(cust.cst_nme,',',' ') as "Customer Name", 
    cuid.customer_id as "Stratus Ref",
    cust.cst_stat_typ as "Customer Status",
    null as "New Customer BOE",
    null as "CustBOEChgDate",
    null as "CustBOEChgBy",
    replace(fins.inst_nme,',',' ') as "Institution Name",
    fins.inst_mnem,
    bbcmpyid.fins_id as "BB CompanyId",
    oldboe.cl_value as "Old BOE",
    boe.cl_value as "New BOE", 
    boe.last_chg_tms as "Changed Date", 
    boe.last_chg_usr_id as "Changed By" ,
    replace(bbgrp.cl_value,',',' ') as "Industry Group", 
    replace(bbsgr.cl_value,',',' ') as "Industry Subgroup", 
    replace(bbsec.cl_value,',',' ') as "Industry Sector",
    figu.gu_id as "Domicile",
    replace(issr.issr_nme,',',' ') as "Issuer Name",
    irid.issr_id as "Client Ref", 
    (select count(distinct instr_id) from ft_t_isgp where end_tms is null and prt_purp_typ = 'INTEREST' and instr_id in (select instr_id from ft_t_issu where instr_issr_id in (select instr_issr_id from ft_t_issr where fins_inst_mnem = fins.inst_mnem))) as "SOI Count"
  from ft_t_ficl as boe
    left join
      (select distinct inst_mnem, first_value(cl_value) over ( partition by inst_mnem, indus_cl_set_id order by start_tms desc) cl_value from FT_T_ficl 
        where indus_cl_set_id ='BOE' and end_tms is not null) as oldboe
      on oldboe.inst_mnem= boe.inst_mnem
    join ft_t_fins as fins on boe.inst_mnem = fins.inst_mnem
      and COALESCE(boe.end_tms, to_date('20501231','yyyymmdd')) = to_date('20501231','yyyymmdd') 
      and boe.indus_cl_set_id = 'BOE'
      and fins.inst_nme NOT LIKE '%Curve%'
    left outer join ft_t_figu as figu on figu.inst_mnem = fins.inst_mnem
      and figu.gu_typ = 'COUNTRY'
      and figu.fins_gu_purp_typ = 'DOMICILE'
      and COALESCE(figu.end_tms, to_date('20501231','yyyymmdd')) = to_date('20501231','yyyymmdd')
      and exists (select prnt_gu_id from ft_t_gunt where prnt_gu_id = figu.gu_id and prnt_gu_typ = 'COUNTRY' and end_tms is null)
    left outer join ft_t_fiid bbcmpyid on fins.inst_mnem = bbcmpyid.inst_mnem
      and bbcmpyid.fins_id_ctxt_typ = 'BBCMPYID' 
      and COALESCE(bbcmpyid.end_tms, to_date('20501231','yyyymmdd')) = to_date('20501231','yyyymmdd') 
    left outer join ft_t_ficl bbgrp on fins.inst_mnem = bbgrp.inst_mnem
      and bbgrp.indus_cl_set_id = 'BBINDGRP' 
      and COALESCE(bbgrp.end_tms, to_date('20501231','yyyymmdd')) = to_date('20501231','yyyymmdd') 
    left outer join ft_t_ficl bbsgr on fins.inst_mnem = bbsgr.inst_mnem
      and bbsgr.indus_cl_set_id = 'BBINDSGR' 
      and COALESCE(bbsgr.end_tms, to_date('20501231','yyyymmdd')) = to_date('20501231','yyyymmdd') 
    left outer join ft_t_ficl bbsec on fins.inst_mnem = bbsec.inst_mnem
      and bbsec.indus_cl_set_id = 'BBINDSEC' 
      and COALESCE(bbsec.end_tms, to_date('20501231','yyyymmdd')) = to_date('20501231','yyyymmdd') 
    left outer join ft_t_cust cust on cust.inst_mnem = fins.inst_mnem
    left outer join ft_t_cuid cuid on cuid.cst_id = cust.cst_id
      and cuid.CST_ID_CTXT_TYP =  'STRATREF' 
      and COALESCE(cuid.end_tms, to_date('20501231','yyyymmdd')) = to_date('20501231','yyyymmdd') 
    left outer join ft_t_issr issr on issr.fins_inst_mnem = fins.inst_mnem
      and issr.end_tms is null
    left outer join ft_t_irid irid on irid.instr_issr_id = issr.instr_issr_id
      and irid.ISSR_ID_CTXT_TYP =  'CLIENTREF' 
      and COALESCE(irid.end_tms, to_date('20501231','yyyymmdd')) = to_date('20501231','yyyymmdd') 
  where 1=1
    and boe.last_chg_tms &gt; (SYSDATE() - make_interval(days =&gt; ?::INTEGER))::DATE

) as t1
union all
select concat (
  COALESCE("Customer Name",''),',',COALESCE("Stratus Ref",''),',',COALESCE("Customer Status",''),',',COALESCE("New Customer BOE",''),',',COALESCE(to_char("CustBOEChgDate"::timestamp, 'YYYY-MM-DD'),''),',',COALESCE("CustBOEChgBy",''),',',COALESCE("Institution Name",''),',',COALESCE("BB CompanyId",''),',',COALESCE("Old BOE",''),',',COALESCE("New BOE",'')
  ,',',COALESCE(to_char("Changed Date"::timestamp, 'YYYY-MM-DD'),''),',',COALESCE("Changed By",''),',',COALESCE("Industry Group",''),',',COALESCE("Industry Subgroup",'')
  ,',',COALESCE("Industry Sector",''),',',COALESCE("Domicile",''),',',COALESCE("Issuer Name",''),',',COALESCE("Client Ref",''),',',COALESCE(CAST("SOI Count" AS VARCHAR),'')
)  , 4 ordernum
from (
  select
    null as "Customer Name", 
    null as "Stratus Ref",
    null as "Customer Status",
    null as "New Customer BOE",
    null as "CustBOEChgDate",
    null as "CustBOEChgBy",
    replace(fins.inst_nme,',',' ') as "Institution Name",
    fins.inst_mnem,
    bbcmpyid.fins_id as "BB CompanyId",
    null as "Old BOE",
    null as "New BOE", 
    null as "Changed Date", 
    null as "Changed By" ,
    replace(bbgrp.cl_value,',',' ') as "Industry Group", 
    replace(bbsgr.cl_value,',',' ') as "Industry Subgroup", 
    replace(bbsec.cl_value,',',' ') as "Industry Sector",
    figu.gu_id as "Domicile",
    replace(issr.issr_nme,',',' ') as "Issuer Name",
    irid.issr_id as "Client Ref", 
    (select count(distinct instr_id) from ft_t_isgp where end_tms is null and prt_purp_typ = 'INTEREST' and instr_id in (select instr_id from ft_t_issu where instr_issr_id = issr.instr_issr_id)) as "SOI Count"
  from ft_t_irgp as irgp
    join ft_t_issr as issr on issr.instr_issr_id=irgp.instr_issr_id and issr.end_tms is null
    inner join ft_t_fins as fins on issr.fins_inst_mnem = fins.inst_mnem and COALESCE(fins.end_tms, to_date('20501231','yyyymmdd')) = to_date('20501231','yyyymmdd') and fins.inst_nme NOT LIKE '%Curve%'
    left outer join ft_t_ficl as boe on boe.inst_mnem = fins.inst_mnem and boe.indus_cl_set_id = 'BOE' and COALESCE(boe.end_tms, to_date('20501231','yyyymmdd')) = to_date('20501231','yyyymmdd') 
    left outer join ft_t_ficl as bbgrp on fins.inst_mnem = bbgrp.inst_mnem and bbgrp.indus_cl_set_id = 'BBINDGRP' and COALESCE(bbgrp.end_tms, to_date('20501231','yyyymmdd')) = to_date('20501231','yyyymmdd') 
    left outer join ft_t_ficl as bbsgr on fins.inst_mnem = bbsgr.inst_mnem and bbsgr.indus_cl_set_id = 'BBINDSGR' and COALESCE(bbsgr.end_tms, to_date('20501231','yyyymmdd')) = to_date('20501231','yyyymmdd') 
    left outer join ft_t_ficl as bbsec on fins.inst_mnem = bbsec.inst_mnem and bbsec.indus_cl_set_id = 'BBINDSEC' and COALESCE(bbsec.end_tms, to_date('20501231','yyyymmdd')) = to_date('20501231','yyyymmdd') 
    left outer join ft_t_fiid as bbcmpyid on fins.inst_mnem = bbcmpyid.inst_mnem and bbcmpyid.fins_id_ctxt_typ = 'BBCMPYID' and COALESCE(bbcmpyid.end_tms, to_date('20501231','yyyymmdd')) = to_date('20501231','yyyymmdd') 
    left outer join ft_t_irid as irid on irid.instr_issr_id = irgp.instr_issr_id and irid.ISSR_ID_CTXT_TYP =  'CLIENTREF'  and irid.end_tms is null
    left outer join ft_t_figu as figu  on figu.inst_mnem = fins.inst_mnem and figu.gu_typ = 'COUNTRY' and figu.fins_gu_purp_typ = 'DOMICILE' and figu.end_tms is null
      and exists (select prnt_gu_id from ft_t_gunt where prnt_gu_id = figu.gu_id and prnt_gu_typ = 'COUNTRY' and end_tms is null)
  where irgp.prnt_issr_grp_oid = 'IRGR000006' 
    and irgp.end_tms is null /* In IOI */
    and boe.cl_value is null /* no BOE code */
) as t2
union all
select concat (
  COALESCE("Customer Name",''),',',COALESCE("Stratus Ref",''),',',COALESCE("Customer Status",''),',',COALESCE("New Customer BOE",''),',',COALESCE(TO_CHAR("CustBOEChgDate", 'YYYY-MM-DD'),''),',',COALESCE("CustBOEChgBy",''),',',COALESCE("Institution Name",''),',',COALESCE("BB CompanyId",''),',',COALESCE("Old BOE",''),',',COALESCE("New BOE",'')
  ,',',COALESCE(TO_CHAR("Changed Date", 'YYYY-MM-DD'),''),',',COALESCE("Changed By",''),',',COALESCE("Industry Group",''),',',COALESCE("Industry Subgroup",'')
  ,',',COALESCE("Industry Sector",''),',',COALESCE("Domicile",''),',',COALESCE("Issuer Name",''),',',COALESCE("Client Ref",''),',',COALESCE(CAST("SOI Count" AS VARCHAR),'')
)  ,2 as ordernum
from (
  select
    replace(cust.cst_nme,',',' ') as "Customer Name", 
    cuid.customer_id as "Stratus Ref",
    cust.cst_stat_typ as "Customer Status",
    cucl.cl_value as "New Customer BOE",
    cucl.last_chg_tms as "CustBOEChgDate",
    cucl.last_chg_usr_id as "CustBOEChgBy",
    replace(fins.inst_nme,',',' ') as "Institution Name",
    --fins.inst_mnem,
    bbcmpyid.fins_id as "BB CompanyId",
    boe.cl_value as "Old BOE",
    null as "New BOE", 
    boe.last_chg_tms as "Changed Date", 
    boe.last_chg_usr_id as "Changed By" ,
    replace(bbgrp.cl_value,',',' ') as "Industry Group", 
    replace(bbsgr.cl_value,',',' ') as "Industry Subgroup", 
    replace(bbsec.cl_value,',',' ') as "Industry Sector",
    figu.gu_id as "Domicile",
    null as "Issuer Name",
    null as "Client Ref",
    0 as "SOI Count"
  from ft_t_cucl as cucl
  inner join ft_t_cust cust on cucl.cst_id=cust.cst_id and cust.end_tms is null
    and cucl.indus_cl_set_id = 'BOE' and cucl.end_tms is null
  left outer join ft_t_cuid cuid on cuid.cst_id = cust.cst_id and cuid.CST_ID_CTXT_TYP = 'STRATREF' and cuid.end_tms is null
  inner join ft_t_fins fins on cust.inst_mnem = fins.inst_mnem and fins.end_tms is null
  left outer join ft_t_ficl boe on fins.inst_mnem = boe.inst_mnem and boe.indus_cl_set_id = 'BOE' and boe.end_tms is null
  left outer join ft_t_fiid bbcmpyid on fins.inst_mnem = bbcmpyid.inst_mnem and bbcmpyid.fins_id_ctxt_typ = 'BBCMPYID' and bbcmpyid.end_tms is null
  left outer join ft_t_ficl bbgrp on fins.inst_mnem = bbgrp.inst_mnem and bbgrp.indus_cl_set_id = 'BBINDGRP' and bbgrp.end_tms is null
  left outer join ft_t_ficl bbsgr on fins.inst_mnem = bbsgr.inst_mnem and bbsgr.indus_cl_set_id = 'BBINDSGR' and bbsgr.end_tms is null
  left outer join ft_t_ficl bbsec on fins.inst_mnem = bbsec.inst_mnem and bbsec.indus_cl_set_id = 'BBINDSEC' and bbsec.end_tms is null
  left outer join ft_t_figu figu on fins.inst_mnem = figu.inst_mnem and figu.gu_typ = 'COUNTRY' and figu.fins_gu_purp_typ = 'DOMICILE' and figu.end_tms is null
  where cucl.last_chg_tms &gt; (SYSDATE() - make_interval(days =&gt; ?::INTEGER))::DATE
) as t3
order by ordernum</objectValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="76" type="java.util.HashSet">
<item id="77" type="com.j2fe.workflow.definition.Transition">
<name id="78">goto-next</name>
<source id="79">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="80"/>
<directJoin>false</directJoin>
<name id="81">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="82">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="83" type="java.util.HashSet"/>
<targets id="84" type="java.util.HashSet">
<item idref="77" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="55"/>
</item>
</sources>
<targets id="85" type="java.util.HashSet">
<item id="86" type="com.j2fe.workflow.definition.Transition">
<name id="87">nothing-found</name>
<source idref="55"/>
<target idref="2"/>
</item>
<item idref="53" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="36"/>
</item>
</sources>
<targets id="88" type="java.util.HashSet">
<item idref="34" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="29"/>
</item>
<item id="89" type="com.j2fe.workflow.definition.Transition">
<name id="90">goto-next</name>
<source id="91">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="92"/>
<directJoin>false</directJoin>
<name id="93">Write to Temp File</name>
<nodeHandler>com.j2fe.general.activities.File</nodeHandler>
<nodeHandlerClass id="94">com.j2fe.general.activities.File</nodeHandlerClass>
<parameters id="95" type="java.util.HashSet">
<item id="96" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="97">appendEOFLine</name>
<stringValue id="98">true</stringValue>
<type>CONSTANT</type>
</item>
<item id="99" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="100">directory</name>
<stringValue id="101">FtpFileDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="102" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="103">fileName</name>
<stringValue id="104">fileNameBase</stringValue>
<type>VARIABLE</type>
</item>
<item id="105" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="106">text</name>
<stringValue id="107">BoEUpdatesReportRow</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="108" type="java.util.HashSet">
<item id="109" type="com.j2fe.workflow.definition.Transition">
<name id="110">loop</name>
<source idref="9"/>
<target idref="91"/>
</item>
</sources>
<targets id="111" type="java.util.HashSet">
<item idref="89" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="29"/>
</item>
</sources>
<targets id="112" type="java.util.HashSet">
<item idref="27" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="9"/>
</item>
</sources>
<targets id="113" type="java.util.HashSet">
<item idref="7" type="com.j2fe.workflow.definition.Transition"/>
<item idref="109" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="2"/>
</item>
<item idref="86" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="114" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="115">Mizuho/Reports</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="116">user1</lastChangeUser>
<lastUpdate id="117">2025-12-01T19:45:43.000+0000</lastUpdate>
<name id="118">MZ_BoEUpdatesReport</name>
<nodes id="119" type="java.util.HashSet">
<item idref="36" type="com.j2fe.workflow.definition.Node"/>
<item idref="55" type="com.j2fe.workflow.definition.Node"/>
<item idref="9" type="com.j2fe.workflow.definition.Node"/>
<item idref="29" type="com.j2fe.workflow.definition.Node"/>
<item idref="79" type="com.j2fe.workflow.definition.Node"/>
<item idref="2" type="com.j2fe.workflow.definition.Node"/>
<item idref="91" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>true</optimize>
<parameter id="120" type="java.util.HashMap">
<entry>
<key id="121" type="java.lang.String">FtpFileDirectory</key>
<value id="122" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="123">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="124" type="java.lang.String">LastNumDaysToCheck</key>
<value id="125" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="126">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="127">Query is based on sysdate (minus number provided) and will retrieve data based on this.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="128" type="java.lang.String">QueryNameForPublishing</key>
<value id="129" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="130">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="131">BoEUpdatesReport</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
</parameter>
<permissions id="132" type="java.util.HashSet"/>
<priority>0</priority>
<purgeAtEnd>false</purgeAtEnd>
<retries>0</retries>
<startNode idref="79"/>
<status>RELEASED</status>
<variables id="133" type="java.util.HashMap">
<entry>
<key id="134" type="java.lang.String">FtpFileDirectory</key>
<value id="135" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="136">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="137" type="java.lang.String">/tmp/</value>
</value>
</entry>
<entry>
<key id="138" type="java.lang.String">LastNumDaysToCheck</key>
<value id="139" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="140">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="141">Query is based on sysdate (minus number provided) and will retrieve data based on this.</description>
<persistent>false</persistent>
<value id="142" type="java.lang.String">1</value>
</value>
</entry>
<entry>
<key id="143" type="java.lang.String">QueryNameForPublishing</key>
<value id="144" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="145">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="146">BoEUpdatesReport</description>
<persistent>false</persistent>
<value id="147" type="java.lang.String">BoEUpdatesReport</value>
</value>
</entry>
<entry>
<key id="148" type="java.lang.String">forLoopCnt</key>
<value id="149" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="150">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<persistent>false</persistent>
<value id="151" type="java.lang.Integer">0</value>
</value>
</entry>
</variables>
<version>16</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
