<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.07">
<package-comment/>
<businessobject displayString="26 - v10" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>false</alwaysPersist>
<clustered>true</clustered>
<comment id="1">v10</comment>
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
<name id="11">Insert Derive Policy</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="12">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="13" type="java.util.HashSet">
<item id="14" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="15">database</name>
<stringValue id="16">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="17" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="18">indexedParameters[0]</name>
<stringValue id="19">code</stringValue>
<type>VARIABLE</type>
</item>
<item id="20" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="21">indexedParameters[1]</name>
<stringValue id="22">code</stringValue>
<type>VARIABLE</type>
</item>
<item id="23" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="24">indexedParameters[2]</name>
<stringValue id="25">rtngvalueoid</stringValue>
<type>VARIABLE</type>
</item>
<item id="26" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="27">indexedParameters[3]</name>
<stringValue id="28">DeriveSetOid</stringValue>
<type>VARIABLE</type>
</item>
<item id="29" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="30">indexedParameters[4]</name>
<stringValue id="31">dataSrc</stringValue>
<type>VARIABLE</type>
</item>
<item id="32" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="33">indexedParameters[5]</name>
<stringValue id="34">Issuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="35" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="36">querySQL</name>
<objectValue id="37" type="java.lang.String">insert into ft_t_isrt (ISS_RTNG_OID, INSTR_ID,  START_TMS, LAST_CHG_USR_ID, LAST_CHG_TMS, RTNG_CDE, RTNG_SYMBOL_TXT, RTNG_VALUE_OID, RTNG_SET_OID, orig_data_prov_id, data_stat_typ, rtng_eff_tms, data_src_id)
select new_oid(), instr_id, current_timestamp, 'CalculateDeriveRatingEquity', current_timestamp, ?,?, ?, ?, 'DERIVED', 'ACTIVE' ,date_trunc('day',now()), ? from ft_t_issu issu
where issu.instr_issr_id = ?
and exists (select 1 from ft_t_isty isty where isty.iss_typ = issu.iss_typ 
and trim(isty.prnt_iss_typ) in ('EQSHR','ETP') and isty.start_tms &lt;= current_timestamp and (isty.end_tms is null or isty.end_tms &gt; current_timestamp))
and issu.start_tms &lt;= current_timestamp and (issu.end_tms is null or issu.end_tms &gt; current_timestamp)
and exists (select 1 from ft_t_isgp isgp where isgp.instr_id =issu.instr_id and prt_purp_typ = 'INTEREST'  and isgp.PRNT_ISS_GRP_OID not in (select ISS_GRP_OID from FT_T_ISGR where GRP_NME like 'MHSC%')
and start_tms &lt;= current_timestamp and (end_tms is null or end_tms &gt; current_timestamp))</objectValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="38" type="java.util.HashSet">
<item id="39" type="com.j2fe.workflow.definition.Transition">
<name id="40">goto-next</name>
<source id="41">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="42"/>
<directJoin>false</directJoin>
<name id="43">Bean Shell Script (Standard)</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="44">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="45" type="java.util.HashSet">
<item id="46" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="47">statements</name>
<objectValue id="48" type="java.lang.String">boolean internalfound = false;&#13;
boolean snpfound = false;&#13;
boolean fitchfound = false;&#13;
boolean moodyfound = false;&#13;
boolean jcrfound = false;&#13;
String[] derRating = new String[3];&#13;
int internal= -1;&#13;
int snp = -1;&#13;
int fitch = -1;&#13;
int moody = -1;&#13;
int jcr = -1;&#13;
	&#13;
for(int i=0; i&lt; input.length; i++){&#13;
	if("RTNG000001".equalsIgnoreCase(input[i][0]) &amp;&amp; null != input[i][3]){&#13;
		moodyfound = true;&#13;
		moody = i;&#13;
	}else if("RTNG000002".equalsIgnoreCase(input[i][0]) &amp;&amp; null != input[i][3]){&#13;
		fitchfound = true;&#13;
		fitch = i;&#13;
	}else if("RTNG000003".equalsIgnoreCase(input[i][0]) &amp;&amp; null != input[i][3]){&#13;
		snpfound = true;&#13;
		snp = i;&#13;
	}else if("RTNG000004".equalsIgnoreCase(input[i][0]) &amp;&amp; null != input[i][3]){&#13;
		jcrfound = true;&#13;
		jcr = i;&#13;
	}else if("RTNG000006".equalsIgnoreCase(input[i][0]) &amp;&amp; null != input[i][3]){&#13;
		internalfound = true;&#13;
		internal = i;&#13;
	}&#13;
}&#13;
		&#13;
if (internalfound){&#13;
	derRating = input[internal][3].split(";");&#13;
} else if (moodyfound || fitchfound || snpfound || jcrfound){&#13;
	if(moodyfound &amp;&amp; snpfound){&#13;
		String[] derRatingM = input[moody][3].split(";");&#13;
		String[] derRatingS = input[snp][3].split(";");&#13;
		if(Integer.parseInt(derRatingM[1]) &gt;= Integer.parseInt(derRatingS[1])){&#13;
			derRating = derRatingM;&#13;
			dataSrc = "MOODY";&#13;
		} else {&#13;
			derRating = derRatingS;&#13;
			dataSrc = "SAP";&#13;
		}&#13;
	}else if (snpfound){ &#13;
		derRating = input[snp][3].split(";");&#13;
		dataSrc = "SAP";&#13;
	}else if (moodyfound){ &#13;
		derRating = input[moody][3].split(";");&#13;
		dataSrc = "MOODY";&#13;
	}else if (fitchfound){ &#13;
		derRating = input[fitch][3].split(";");&#13;
		dataSrc = "FITCH";&#13;
	}else if (jcrfound){ &#13;
		derRating = input[jcr][3].split(";");&#13;
		dataSrc = "JCR";&#13;
	}&#13;
}&#13;
		&#13;
		&#13;
String code = derRating[0];&#13;
String rtngvalueoid = derRating[2];&#13;
&#13;
</objectValue>
<type>CONSTANT</type>
</item>
<item id="49" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="50">["code"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="51">variables["code"]</name>
<stringValue id="52">code</stringValue>
<type>VARIABLE</type>
</item>
<item id="53" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="54">variables["dataSrc"]</name>
<stringValue id="55">dataSrc</stringValue>
<type>VARIABLE</type>
</item>
<item id="56" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="57">variables["input"]</name>
<stringValue id="58">DerivedRatings</stringValue>
<type>VARIABLE</type>
</item>
<item id="59" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="60">["rtngvalueoid"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="61">variables["rtngvalueoid"]</name>
<stringValue id="62">rtngvalueoid</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="63" type="java.util.HashSet">
<item id="64" type="com.j2fe.workflow.definition.Transition">
<name id="65">rows-found</name>
<source id="66">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="67"/>
<directJoin>false</directJoin>
<name id="68">Get Derived rating value for Derived Policy</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="69">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="70" type="java.util.HashSet">
<item id="71" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="72">database</name>
<stringValue id="73">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="74" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="75">indexedParameters[0]</name>
<stringValue id="76">DeriveSetOid</stringValue>
<type>VARIABLE</type>
</item>
<item id="77" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="78">indexedParameters[1]</name>
<stringValue id="79">Issuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="80" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="81">indexedResult</name>
<stringValue id="82">DerivedRatings</stringValue>
<type>VARIABLE</type>
</item>
<item id="83" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="84">querySQL</name>
<stringValue id="85">select distinct rtng_set_oid, rtng_value_oid, rtng_cde,&#13;
( select rtng_cde||';'||rtng_cde_num||';'||trim(rtng_value_oid) from ft_t_rtvl where rtng_cde_num = &#13;
(select rtng_cde_num from ft_t_rtvl rtvl1 where rtvl1.rtng_cde = isrt.rtng_cde and rtvl1.rtng_set_oid = isrt.rtng_set_oid)&#13;
and rtng_set_oid = ?) AS derive&#13;
from ft_t_isrt isrt, ft_t_issu issu&#13;
where &#13;
isrt.instr_id = issu.instr_id&#13;
and issu.instr_issr_id = ?&#13;
and exists (select 1 from ft_t_isty isty where isty.iss_typ = issu.iss_typ &#13;
and trim(isty.prnt_iss_typ) in ('EQSHR','ETP') and isty.start_tms &lt;= current_timestamp and (isty.end_tms is null or isty.end_tms &gt; current_timestamp))&#13;
and isrt.data_stat_typ = 'ACTIVE'&#13;
and isrt.orig_data_prov_id = 'DERIVED'&#13;
and current_timestamp between isrt.start_tms and coalesce(isrt.end_tms, current_timestamp + INTERVAL '1 day')</stringValue>
<type>CONSTANT</type>
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
<name id="91">Insert Derive Issue Rating for Issuer</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="92">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="93" type="java.util.HashSet">
<item id="94" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="95">database</name>
<stringValue id="96">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="97" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="98">indexedParameters[0]</name>
<stringValue id="99">Issuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="100" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="101">querySQL</name>
<objectValue id="102" type="java.lang.String">insert into ft_t_isrt (ISS_RTNG_OID, INSTR_ID, START_TMS, LAST_CHG_USR_ID, LAST_CHG_TMS, RTNG_CDE, RTNG_SYMBOL_TXT, RTNG_VALUE_OID, RTNG_SET_OID, orig_data_prov_id, data_stat_typ, rtng_eff_tms, data_src_id)
select new_oid(), issu.instr_id, now(), 'CalculateDeriveRatingEquity', now(), rtvl.rtng_cde, rtvl.rtng_cde,  rtvl.rtng_value_oid, rtvl.rtng_set_oid, 'DERIVED', 'ACTIVE',date_trunc('day',now()), rtvl.data_src_id from
(
select distinct drvl.rtng_cde, drvl.rtng_cde_num num, drvl.rtng_set_oid, drvl.rtng_value_oid, firt.rtng_cde rating,  rtng.data_src_id,
rank() over (partition by (case when rtng.data_src_id like 'MOODYS%' then 'RTNG000001'
      when rtng.data_src_id = 'FITCH' then 'RTNG000002'
      when rtng.data_src_id like ('S_P%') then 'RTNG000003'
      when rtng.data_src_id = 'JCR' then 'RTNG000004'
      when rtng_set_mnem = 'INTRNLPA' then 'RTNG000006'
end) order by drvl.rtng_cde_num desc) rank, issr.instr_issr_id
from ft_t_issr issr, ft_t_firt firt, ft_t_rtvl rtvl, ft_t_rtvl drvl, ft_t_rtng rtng where 1=1
and issr.fins_inst_mnem = firt.inst_mnem
and instr_issr_id = ?
and rtvl.rtng_value_oid = firt.rtng_value_oid 
and rtng.rtng_set_oid=firt.rtng_set_oid
and firt.rtng_cde = rtvl.rtng_cde
and firt.rtng_set_oid = rtvl.rtng_set_oid
and drvl.rtng_cde = rtvl.rtng_cde 
and firt.rtng_eff_tms &lt;= now() and (firt.sys_eff_end_tms is null or firt.sys_eff_end_tms &gt; now())
and firt.start_tms &lt;= now() and (firt.end_tms is null or firt.end_tms &gt; now())
and rtvl.start_tms &lt;= now() and (rtvl.end_tms is null or rtvl.end_tms &gt; now())
and drvl.start_tms &lt;= now() and (drvl.end_tms is null or drvl.end_tms &gt; now())
and trim(drvl.rtng_set_oid) = (
 case  when rtng.data_src_id like 'MOODYS%' then 'RTNG000001'
      when rtng.data_src_id = 'FITCH' then 'RTNG000002'
      when rtng.data_src_id like ('S_P%') then 'RTNG000003'
      when rtng.data_src_id = 'JCR' then 'RTNG000004'
      when rtng_set_mnem = 'INTRNLPA' then 'RTNG000006'
end)
)rtvl, ft_t_issu issu where rtvl.rank=1
and issu.instr_issr_id = rtvl.instr_issr_id
and issu.start_tms &lt;= now() and (issu.end_tms is null or issu.end_tms &gt; now())
and exists (select 1 from ft_t_isty isty where isty.iss_typ = issu.iss_typ 
and trim(isty.prnt_iss_typ) in ('EQSHR','ETP') and isty.start_tms &lt;= now() and (isty.end_tms is null or isty.end_tms &gt; now()))
and exists (select 1 from ft_t_isgp isgp where isgp.instr_id =issu.instr_id and prt_purp_typ = 'INTEREST' and isgp.PRNT_ISS_GRP_OID not in (select ISS_GRP_OID from FT_T_ISGR where GRP_NME like 'MHSC%')
and start_tms &lt;= now() and (end_tms is null or end_tms &gt; now()))</objectValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="103" type="java.util.HashSet">
<item id="104" type="com.j2fe.workflow.definition.Transition">
<name id="105">rows-found</name>
<source id="106">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="107"/>
<directJoin>false</directJoin>
<name id="108">Check if rating exists</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="109">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="110" type="java.util.HashSet">
<item id="111" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="112">database</name>
<stringValue id="113">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="114" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="115">indexedParameters[0]</name>
<stringValue id="116">Issuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="117" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="118">querySQL</name>
<objectValue id="119" type="java.lang.String">select issr.instr_issr_id&#13;
from ft_t_issr issr, ft_t_firt firt, ft_t_rtvl rtvl, ft_t_rtvl drvl, ft_t_rtng rtng where 1=1&#13;
and issr.instr_issr_id = ?&#13;
and issr.fins_inst_mnem = firt.inst_mnem&#13;
and rtvl.rtng_value_oid = firt.rtng_value_oid &#13;
and rtng.rtng_set_oid=firt.rtng_set_oid&#13;
and firt.rtng_cde = rtvl.rtng_cde&#13;
and firt.rtng_set_oid = rtvl.rtng_set_oid&#13;
and drvl.rtng_cde = rtvl.rtng_cde&#13;
--RDD-268 start &#13;
and firt.start_tms &lt;= current_timestamp and (firt.end_tms is null or firt.end_tms &gt; current_timestamp)&#13;
and firt.rtng_eff_tms &lt;= current_timestamp and (firt.sys_eff_end_tms is null or firt.sys_eff_end_tms &gt; current_timestamp)&#13;
--RDD-268 end&#13;
and rtvl.start_tms &lt;= current_timestamp and (rtvl.end_tms is null or rtvl.end_tms &gt; current_timestamp)&#13;
and drvl.start_tms &lt;= current_timestamp and (drvl.end_tms is null or drvl.end_tms &gt; current_timestamp)&#13;
and trim(drvl.rtng_set_oid) = (&#13;
 case  when rtng.data_src_id like 'MOODYS%' then 'RTNG000001'&#13;
      when rtng.data_src_id = 'FITCH' then 'RTNG000002'&#13;
      when rtng.data_src_id like ('S_P%') then 'RTNG000003'&#13;
      when rtng.data_src_id = 'JCR' then 'RTNG000004'&#13;
      when rtng_set_mnem = 'INTRNLPA' then 'RTNG000006'&#13;
end)</objectValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="120" type="java.util.HashSet">
<item id="121" type="com.j2fe.workflow.definition.Transition">
<name id="122">goto-next</name>
<source id="123">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="124"/>
<directJoin>false</directJoin>
<name id="125">Delete Existing Portfolio Rating</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="126">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="127" type="java.util.HashSet">
<item id="128" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="129">database</name>
<stringValue id="130">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="131" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="132">indexedParameters[0]</name>
<stringValue id="133">Issuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="134" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="135">querySQL</name>
<stringValue id="136">delete from ft_t_isrt where instr_id in (&#13;
select issu.instr_id from ft_t_issu issu where issu.instr_issr_id = ?&#13;
--and issu.start_tms &lt;= sysdate and (issu.end_tms is null or issu.end_tms &gt; sysdate)&#13;
and exists (select 1 from ft_t_isty isty where isty.iss_typ = issu.iss_typ &#13;
and trim(isty.prnt_iss_typ) in ('EQSHR','ETP') and isty.start_tms &lt;= current_timestamp and (isty.end_tms is null or isty.end_tms &gt; current_timestamp)))&#13;
and orig_data_prov_id = 'DERIVED'</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="137" type="java.util.HashSet">
<item id="138" type="com.j2fe.workflow.definition.Transition">
<name id="139">goto-next</name>
<source id="140">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="141"/>
<directJoin>false</directJoin>
<name id="142">insert into ISGP</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="143">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="144" type="java.util.HashSet">
<item id="145" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="146">database</name>
<stringValue id="147">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="148" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="149">indexedParameters[0]</name>
<stringValue id="150">Issuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="151" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="152">querySQL</name>
<objectValue id="153" type="java.lang.String">Insert into ft_t_isgp (ISGP_OID, PRNT_ISS_GRP_OID, INSTR_ID, PRT_PURP_TYP, START_TMS, LAST_CHG_TMS, LAST_CHG_USR_ID) 
select new_oid(), 'ISGR000011', issu.instr_id, 'PRTFLIOP', current_timestamp, current_timestamp, 'CalculateDeriveRatingEquity' from ft_t_issu issu
where issu.instr_issr_id = ?
and not exists (select 1 from ft_t_isgp isgp where prnt_iss_grp_oid = 'ISGR000011' 
and isgp.instr_id = issu.instr_id and prt_purp_typ = 'PRTFLIOP' 
and start_tms &lt;= current_timestamp and (end_tms is null or end_tms &gt; current_timestamp))
and exists (select 1 from ft_t_isty isty where isty.iss_typ = issu.iss_typ 
and trim(isty.prnt_iss_typ) in ('EQSHR','ETP') and isty.start_tms &lt;= current_timestamp and (isty.end_tms is null or isty.end_tms &gt; current_timestamp))
and exists (select 1 from ft_t_isgp isgp where isgp.instr_id = issu.instr_id and prt_purp_typ = 'INTEREST' and isgp.PRNT_ISS_GRP_OID not in (select ISS_GRP_OID from FT_T_ISGR where GRP_NME like 'MHSC%')
and start_tms &lt;= current_timestamp and (end_tms is null or end_tms &gt; current_timestamp))</objectValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="154" type="java.util.HashSet">
<item id="155" type="com.j2fe.workflow.definition.Transition">
<name id="156">goto-next</name>
<source id="157">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="158"/>
<directJoin>false</directJoin>
<name id="159">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="160">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="161" type="java.util.HashSet"/>
<targets id="162" type="java.util.HashSet">
<item idref="155" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="140"/>
</item>
</sources>
<targets id="163" type="java.util.HashSet">
<item idref="138" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="123"/>
</item>
</sources>
<targets id="164" type="java.util.HashSet">
<item idref="121" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="106"/>
</item>
</sources>
<targets id="165" type="java.util.HashSet">
<item id="166" type="com.j2fe.workflow.definition.Transition">
<name id="167">nothing-found</name>
<source idref="106"/>
<target id="168">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="169"/>
<directJoin>false</directJoin>
<name id="170">Insert NR Derive Policy</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="171">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="172" type="java.util.HashSet">
<item id="173" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="174">database</name>
<stringValue id="175">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="176" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="177">indexedParameters[0]</name>
<stringValue id="178">Issuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="179" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="180">indexedParameters[1]</name>
<stringValue id="181">DeriveSetOid</stringValue>
<type>VARIABLE</type>
</item>
<item id="182" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="183">indexedParameters[2]</name>
<stringValue id="184">DeriveSetOid</stringValue>
<type>VARIABLE</type>
</item>
<item id="185" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="186">querySQL</name>
<objectValue id="187" type="java.lang.String">insert into ft_t_isrt (ISS_RTNG_OID, INSTR_ID,  START_TMS, LAST_CHG_USR_ID, LAST_CHG_TMS, RTNG_CDE, RTNG_VALUE_OID, RTNG_SET_OID, orig_data_prov_id, data_stat_typ, rtng_eff_tms, data_src_id, rtng_symbol_txt)
select new_oid(), instr_id, current_timestamp, 'CalculateDeriveRatingEquity', current_timestamp, RTNG_CDE,RTNG_VALUE_OID, RTNG_SET_OID, 'DERIVED', 'ACTIVE' ,date_trunc('day',now()), 'MHI', RTNG_CDE from ft_t_issu issu, ft_t_rtvl rtvl
where issu.instr_issr_id = ?
and exists (select 1 from ft_t_isty isty where isty.iss_typ = issu.iss_typ 
and trim(isty.prnt_iss_typ) in ('EQSHR','ETP') and isty.start_tms &lt;= current_timestamp and (isty.end_tms is null or isty.end_tms &gt; current_timestamp))
and issu.start_tms &lt;= current_timestamp and (issu.end_tms is null or issu.end_tms &gt; current_timestamp)
and exists (select 1 from ft_t_isgp isgp where isgp.instr_id =issu.instr_id and prt_purp_typ = 'INTEREST' and isgp.PRNT_ISS_GRP_OID not in (select ISS_GRP_OID from FT_T_ISGR where GRP_NME like 'MHSC%')
and start_tms &lt;= current_timestamp and (end_tms is null or end_tms &gt; current_timestamp))
and rtvl.rtng_set_oid = ?
and rtvl.rtng_cde = 'NR'
and not exists (select 1 from ft_t_isrt r where r.instr_id = issu.instr_id and r.rtng_set_oid = ? and r.sys_eff_end_tms is NULL and r.end_tms is NULL)</objectValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="188" type="java.util.HashSet">
<item idref="166" type="com.j2fe.workflow.definition.Transition"/>
<item id="189" type="com.j2fe.workflow.definition.Transition">
<name id="190">nothing-found</name>
<source idref="66"/>
<target idref="168"/>
</item>
</sources>
<targets id="191" type="java.util.HashSet">
<item id="192" type="com.j2fe.workflow.definition.Transition">
<name id="193">goto-next</name>
<source idref="168"/>
<target idref="2"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item idref="104" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="89"/>
</item>
</sources>
<targets id="194" type="java.util.HashSet">
<item idref="87" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="66"/>
</item>
</sources>
<targets id="195" type="java.util.HashSet">
<item idref="189" type="com.j2fe.workflow.definition.Transition"/>
<item idref="64" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="41"/>
</item>
</sources>
<targets id="196" type="java.util.HashSet">
<item idref="39" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="9"/>
</item>
</sources>
<targets id="197" type="java.util.HashSet">
<item idref="7" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="2"/>
</item>
<item idref="192" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="198" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="199">Mizuho/Ratings</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="200">user1</lastChangeUser>
<lastUpdate id="201">2025-10-14T00:56:25.000+0100</lastUpdate>
<name id="202">CalculateDeriveRatingEquity</name>
<nodes id="203" type="java.util.HashSet">
<item idref="41" type="com.j2fe.workflow.definition.Node"/>
<item idref="106" type="com.j2fe.workflow.definition.Node"/>
<item idref="123" type="com.j2fe.workflow.definition.Node"/>
<item idref="66" type="com.j2fe.workflow.definition.Node"/>
<item idref="89" type="com.j2fe.workflow.definition.Node"/>
<item idref="9" type="com.j2fe.workflow.definition.Node"/>
<item idref="168" type="com.j2fe.workflow.definition.Node"/>
<item idref="157" type="com.j2fe.workflow.definition.Node"/>
<item idref="2" type="com.j2fe.workflow.definition.Node"/>
<item idref="140" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>true</optimize>
<parameter id="204" type="java.util.HashMap">
<entry>
<key id="205" type="java.lang.String">Issuer</key>
<value id="206" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="207">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
</parameter>
<permissions id="208" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>false</purgeAtEnd>
<retries>0</retries>
<startNode idref="157"/>
<status>RELEASED</status>
<variables id="209" type="java.util.HashMap">
<entry>
<key id="210" type="java.lang.String">DeriveSetOid</key>
<value id="211" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="212">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="213" type="java.lang.String">RTNG000014</value>
</value>
</entry>
<entry>
<key id="214" type="java.lang.String">Issuer</key>
<value id="215" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="216">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="217" type="java.lang.String">code</key>
<value id="218" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="219">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="220" type="java.lang.String">rtngvalueoid</key>
<value id="221" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="222">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
</variables>
<version>26</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
