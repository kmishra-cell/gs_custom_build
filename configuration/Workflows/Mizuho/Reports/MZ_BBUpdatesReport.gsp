<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.09">
<package-comment/>
<businessobject displayString="17 - V10-NewLine_Changes" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>true</alwaysPersist>
<clustered>false</clustered>
<comment id="1">V10-NewLine_Changes</comment>
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
<stringValue id="22">BBUpdatesReportList</stringValue>
<type>VARIABLE</type>
</item>
<item id="23" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="24">output</name>
<stringValue id="25">BBUpdatesReportRow</stringValue>
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
<stringValue id="65">BBUpdatesReportList</stringValue>
<type>VARIABLE</type>
<variablePart id="66"/>
</item>
<item id="67" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="68">mappedParameters["1-5"]</name>
<stringValue id="69">LastNumDaysToCheck</stringValue>
<type>VARIABLE</type>
</item>
<item id="70" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="71">querySQL</name>
<objectValue id="72" type="java.lang.String">
select 'SECOREFE,ISSUER_Name,BBCOMPANY_ID,ISSUER_CHG_TMS,COUNTRY_OF_RISK_NAME,COUNTRY_OF_RISK_CODE,GU_CHG_TMS,RATING_CDE,RATING_DIRECTION,RATING_TYPE,RTNG_CHG_TMS,RATING_SET,RTNG_SET_CHG_TMS,CUST_CHG_TMS,ULTIMATE_PARENT_NAME,ULTIMATE_PARENT_BBCOMPANY_ID,UP_ISSUER_CHG_TMS,UP_COUNTRY_OF_RISK_NAME,UP_COUNTRY_OF_RISK_CODE,UP_GU_CHG_TMS,UP_RATING_CDE,UP_RATING_DIRECTION,UP_RATING_TYPE,UP_RTNG_CHG_TMS', 1 AS ordernum
union all
select  concat ( SECOREFE,',',ISSUER_Name,',',BBCOMPANY_ID,',',ISSUER_CHG_TMS
,',',COUNTRY_OF_RISK_NAME,',',COUNTRY_OF_RISK_CODE,',',GU_CHG_TMS
,',',RATING_CDE,',',RATING_DIRECTION,',',RATING_TYPE,',',RTNG_CHG_TMS
,',',RATING_SET,',',RTNG_SET_CHG_TMS
,',',CUST_CHG_TMS
,',',ULTIMATE_PARENT_NAME,',',ULTIMATE_PARENT_BBCOMPANY_ID,',',UP_ISSUER_CHG_TMS
,',',UP_COUNTRY_OF_RISK_NAME,',',UP_COUNTRY_OF_RISK_CODE,',',UP_GU_CHG_TMS
,',',UP_RATING_CDE,',',UP_RATING_DIRECTION,',',UP_RATING_TYPE,',',UP_RTNG_CHG_TMS), 2 ordernum
from( 
	select 
		record.*, 
		up_record.* 
	from
	( 
		select 
			fins.inst_mnem as inst_mnem, 
			fiid.fins_id as SECOREFE, 
			fins.inst_nme as ISSUER_Name, 
			fins.pref_fins_id as BBCOMPANY_ID, 
			fins.last_chg_tms as ISSUER_CHG_TMS,
			gunt.gu_nme as COUNTRY_OF_RISK_NAME,
			gunt.cntry_cde as COUNTRY_OF_RISK_CODE, 
			gunt.last_chg_tms as GU_CHG_TMS,
			firt.rtng_cde as RATING_CDE, 
			firt.rtng_direction_txt as RATING_DIRECTION, 
			firt.rtng_purp_typ as RATING_TYPE, 
			firt.last_chg_tms as RTNG_CHG_TMS ,
			rtng.rtng_set_nme as RATING_SET, 
			rtng.last_chg_tms as RTNG_SET_CHG_TMS,
			cust.cst_nme as cst_nme, 
			cust.last_chg_tms as CUST_CHG_TMS
		from 
		(
			SELECT * 
			from FT_T_FINS 
				where LAST_CHG_USR_ID in ('BBGEN','BBDLCRSP','BBCGCPFD','BBEQEURO','BBCRDRSK','BBDLCRJCR')
  				and end_tms is null
  		) as fins
  		left join (select * from FT_T_FIID where fins_id_ctxt_typ = 'SECOREFE' and end_tms is null) as fiid on fins.inst_mnem= fiid.inst_mnem
  		left join (select * from FT_T_FIGU where gu_typ = 'COUNTRY' and fins_gu_purp_typ = 'RISK') as figu on fins.inst_mnem = figu.inst_mnem
  		inner join FT_T_GUNT as gunt on figu.gu_id = gunt.prnt_gu_id and figu.gu_typ = gunt.prnt_gu_typ and figu.gu_cnt = gunt.prnt_gu_cnt
		left join (select * from FT_T_FIRT where last_chg_usr_id in ('BBDLCRSP','BBDLCRJCR') and end_tms is null) as firt on fins.inst_mnem = firt.inst_mnem 
		left join FT_T_CUST as cust on fins.inst_mnem = cust.inst_mnem
		left join (select * from FT_T_CUID cuid where cst_id_ctxt_typ = 'STRATREF' and end_tms is null) as cuid on cust.cst_id = cuid.cst_id
		left join FT_T_RTNG as rtng on firt.rtng_set_oid = rtng.rtng_set_oid
		where figu.gu_id = gunt.prnt_gu_id
			and figu.gu_typ = gunt.prnt_gu_typ
			and figu.gu_cnt = gunt.prnt_gu_cnt
		) as record
		inner join (
				select 
					fins.inst_mnem, 
					fins.inst_nme as ULTIMATE_PARENT_NAME, 
					fins.pref_fins_id as ULTIMATE_PARENT_BBCOMPANY_ID, 
					fins.last_chg_tms as UP_ISSUER_CHG_TMS,
					gunt_up.gu_nme UP_COUNTRY_OF_RISK_NAME,
					gunt_up.cntry_cde UP_COUNTRY_OF_RISK_CODE, 
					gunt_up.last_chg_tms as UP_GU_CHG_TMS, 
					firt_up.rtng_cde as UP_RATING_CDE, 
					firt_up.rtng_direction_txt as UP_RATING_DIRECTION, 
					firt_up.rtng_purp_typ as UP_RATING_TYPE, 
					firt_up.last_chg_tms as UP_RTNG_CHG_TMS,
					rtng_up.rtng_set_nme as UP_RATING_SET,  
					rtng_up.last_chg_tms as UP_RTNG_SET_CHG_TMS
				from (
						SELECT * 
						from FT_T_FINS 
						where LAST_CHG_USR_ID in ('BBGEN','BBDLCRSP','BBCGCPFD','BBEQEURO','BBCRDRSK','BBDLCRJCR')
  							and end_tms is null
					) as fins
  					inner join (
						select * from FT_T_FIGU where gu_typ = 'COUNTRY' and fins_gu_purp_typ = 'RISK'
					) as figu2 on fins.inst_mnem= figu2.inst_mnem
					inner join FT_T_GUNT as gunt_up on figu2.gu_id = gunt_up.prnt_gu_id and figu2.gu_typ = gunt_up.prnt_gu_typ and figu2.gu_cnt = gunt_up.prnt_gu_cnt
					left join (select * from FT_T_FIRT where last_chg_usr_id in ('BBDLCRSP','BBDLCRJCR') and end_tms is null) firt_up
						on fins.inst_mnem = firt_up.inst_mnem
					left join FT_T_RTNG as rtng_up on firt_up.rtng_set_oid = rtng_up.rtng_set_oid
		) as up_record on record.rating_type = up_record.up_rating_type
		inner join FT_T_FFRL as ffrl on record.inst_mnem = ffrl.inst_mnem and up_record.inst_mnem = ffrl.prnt_inst_mnem
		where ffrl.rel_typ = 'CURRORGN'
			and record.inst_mnem in 
			(
				select fins_inst_mnem from FT_T_ISSR where instr_issr_id in(select instr_issr_id from ft_t_irgp where prt_purp_typ = 'INTEREST' and prnt_issr_grp_oid in (select issr_grp_oid from ft_t_irgr where grp_nme='MHI Inventory'))
				union all
				select inst_mnem from FT_T_CUST
			)
			and (
				issuer_chg_tms &gt; SYSDATE() - make_interval(days =&gt; ?::INTEGER)
	OR gu_chg_tms &gt; SYSDATE() - make_interval(days =&gt; ?::INTEGER)
	OR rtng_chg_tms &gt; SYSDATE() - make_interval(days =&gt; ?::INTEGER)
	OR rtng_set_chg_tms &gt; SYSDATE() - make_interval(days =&gt; ?::INTEGER)
	OR cust_chg_tms &gt; SYSDATE() - make_interval(days =&gt; ?::INTEGER)
			)
		) as t1
order by ordernum






</objectValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="73" type="java.util.HashSet">
<item id="74" type="com.j2fe.workflow.definition.Transition">
<name id="75">goto-next</name>
<source id="76">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="77"/>
<directJoin>false</directJoin>
<name id="78">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="79">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="80" type="java.util.HashSet"/>
<targets id="81" type="java.util.HashSet">
<item idref="74" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="55"/>
</item>
</sources>
<targets id="82" type="java.util.HashSet">
<item id="83" type="com.j2fe.workflow.definition.Transition">
<name id="84">nothing-found</name>
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
<targets id="85" type="java.util.HashSet">
<item idref="34" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="29"/>
</item>
<item id="86" type="com.j2fe.workflow.definition.Transition">
<name id="87">goto-next</name>
<source id="88">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="89"/>
<directJoin>false</directJoin>
<name id="90">Write to Temp File</name>
<nodeHandler>com.j2fe.general.activities.File</nodeHandler>
<nodeHandlerClass id="91">com.j2fe.general.activities.File</nodeHandlerClass>
<parameters id="92" type="java.util.HashSet">
<item id="93" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="94">appendEOFLine</name>
<stringValue id="95">true</stringValue>
<type>CONSTANT</type>
</item>
<item id="96" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="97">directory</name>
<stringValue id="98">FtpFileDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="99" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="100">fileName</name>
<stringValue id="101">fileNameBase</stringValue>
<type>VARIABLE</type>
</item>
<item id="102" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="103">text</name>
<stringValue id="104">BBUpdatesReportRow</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="105" type="java.util.HashSet">
<item id="106" type="com.j2fe.workflow.definition.Transition">
<name id="107">loop</name>
<source idref="9"/>
<target idref="88"/>
</item>
</sources>
<targets id="108" type="java.util.HashSet">
<item idref="86" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="29"/>
</item>
</sources>
<targets id="109" type="java.util.HashSet">
<item idref="27" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="9"/>
</item>
</sources>
<targets id="110" type="java.util.HashSet">
<item idref="7" type="com.j2fe.workflow.definition.Transition"/>
<item idref="106" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="2"/>
</item>
<item idref="83" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="111" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="112">Mizuho/Reports</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="113">user1</lastChangeUser>
<lastUpdate id="114">2025-12-01T20:04:50.000+0000</lastUpdate>
<name id="115">MZ_BBUpdatesReport</name>
<nodes id="116" type="java.util.HashSet">
<item idref="36" type="com.j2fe.workflow.definition.Node"/>
<item idref="55" type="com.j2fe.workflow.definition.Node"/>
<item idref="9" type="com.j2fe.workflow.definition.Node"/>
<item idref="29" type="com.j2fe.workflow.definition.Node"/>
<item idref="76" type="com.j2fe.workflow.definition.Node"/>
<item idref="2" type="com.j2fe.workflow.definition.Node"/>
<item idref="88" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>false</optimize>
<parameter id="117" type="java.util.HashMap">
<entry>
<key id="118" type="java.lang.String">FtpFileDirectory</key>
<value id="119" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="120">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="121" type="java.lang.String">LastNumDaysToCheck</key>
<value id="122" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="123">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="124">Query is based on sysdate (minus number provided) and will retrieve data based on this.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="125" type="java.lang.String">QueryNameForPublishing</key>
<value id="126" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="127">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="128">BBUpdatesReport</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
</parameter>
<permissions id="129" type="java.util.HashSet"/>
<priority>0</priority>
<purgeAtEnd>false</purgeAtEnd>
<retries>0</retries>
<startNode idref="76"/>
<status>RELEASED</status>
<variables id="130" type="java.util.HashMap">
<entry>
<key id="131" type="java.lang.String">FtpFileDirectory</key>
<value id="132" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="133">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="134" type="java.lang.String">/tmp/</value>
</value>
</entry>
<entry>
<key id="135" type="java.lang.String">LastNumDaysToCheck</key>
<value id="136" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="137">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="138">Query is based on sysdate (minus number provided) and will retrieve data based on this.</description>
<persistent>false</persistent>
<value id="139" type="java.lang.String">1</value>
</value>
</entry>
<entry>
<key id="140" type="java.lang.String">QueryNameForPublishing</key>
<value id="141" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="142">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="143">BBUpdatesReport</description>
<persistent>false</persistent>
<value id="144" type="java.lang.String">BBUpdatesReport</value>
</value>
</entry>
<entry>
<key id="145" type="java.lang.String">forLoopCnt</key>
<value id="146" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="147">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<persistent>false</persistent>
<value id="148" type="java.lang.Integer">0</value>
</value>
</entry>
</variables>
<version>17</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
