<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.07">
<package-comment/>
<businessobject displayString="4 - V10-OrderingChange_GrpName_PrefIssId" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>false</alwaysPersist>
<clustered>true</clustered>
<comment id="1">V10-OrderingChange_GrpName_PrefIssId</comment>
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
<stringValue id="22">PortfolioDifferenceReportList</stringValue>
<type>VARIABLE</type>
</item>
<item id="23" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="24">output</name>
<stringValue id="25">PortfolioDifferenceReportRow</stringValue>
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
<stringValue id="43">import java.util.Date;

import java.text.DateFormat;

import java.text.SimpleDateFormat;

DateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd-HH_mm_ss_SSS");

Date date = new Date();

String filename = baseName + "_" + dateFormat.format(date) + ".csv";
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
<stringValue id="65">PortfolioDifferenceReportList</stringValue>
<type>VARIABLE</type>
</item>
<item id="66" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="67">querySQL</name>
<objectValue id="68" type="java.lang.String">select concat(
	'GRP_NME',',','ISSR_NME',',','MIZUHO',',','PREF_ISS_ID',',','PREF_ISS_NME',',','RTNG_SRC_ID',',','RTNG_SET_NME',',','RTNG_CDE',',','RTNG_EFF_TMS'), 
	0 ordernum 
union
select concat(
	GRP_NME,',',ISSR_NME,',',MIZUHO,',',PREF_ISS_ID,',',PREF_ISS_NME,',',RTNG_SRC_ID,',',RTNG_SET_NME,',',RTNG_CDE,',',RTNG_EFF_TMS), 
	dense_rank() OVER (ORDER BY GRP_NME, PREF_ISS_ID DESC) AS ordernum
from (
with notsame as (
	select isgr.grp_nme as grp_nme, 
		   isrt.DATA_SRC_ID as data_src_id, 
		   rtng.RTNG_SET_NME as rtng_set_nme
	from ft_t_isgr isgr, ft_t_isgp isgp, ft_t_isrt isrt, ft_t_rtng rtng, ft_t_rtvl rtvl
		where isgr.GRP_NME like 'PRT%'
			and isgr.ISS_GRP_OID = isgp.PRNT_ISS_GRP_OID 
			and isgp.END_TMS is null
			and isgp.INSTR_ID = isrt.INSTR_ID and isrt.END_TMS is null and isrt.SYS_EFF_END_TMS is null
			and isrt.RTNG_SET_OID = rtng.RTNG_SET_OID
			and isrt.RTNG_VALUE_OID = rtvl.RTNG_VALUE_OID
			and coalesce(rtvl.rank_num,0) != 0  -- exclude WR, NR etc.
			--EG-2585 only vendor ratings
			and (rtng.data_src_id like 'MOODYS%'  or rtng.data_src_id = 'FITCH' or rtng.data_src_id like ('S_P%') or rtng.data_src_id = 'JCR')
			--EG-2585 end
		group by isgr.GRP_NME, isrt.DATA_SRC_ID, rtng.RTNG_SET_NME
		having count(distinct rtvl.rtng_value_oid) &gt; 1
		)
	select 
		isgr.grp_nme, 
		issr.issr_nme, 		
		mhid.iss_id as mizuho,	
		issu.pref_iss_id, 
		issu.PREF_ISS_NME, 
		isrt.DATA_SRC_ID as RTNG_SRC_ID, 
		rtng.RTNG_SET_NME, 
		isrt.RTNG_CDE, 
		to_char(isrt.RTNG_EFF_TMS,'DD/MM/YYYY') as RTNG_EFF_TMS
	from ft_t_isrt isrt
		join ft_t_rtng rtng on isrt.RTNG_SET_OID = rtng.RTNG_SET_OID
		join ft_t_rtvl rtvl on isrt.RTNG_VALUE_OID = rtvl.RTNG_VALUE_OID
			and coalesce(rtvl.rank_num,0) != 0  -- exclude WR, NR etc.
		join ft_t_issu issu on isrt.instr_id = issu.instr_id
		join ft_t_issr issr on issu.instr_issr_id=issr.instr_issr_id
		join ft_t_isid mhid on isrt.instr_id = mhid.instr_id
			and mhid.id_ctxt_typ='MIZUHO'
			and mhid.end_tms is null
		join ft_t_isgp isgp on isgp.instr_id = issu.instr_id
			and isgp.end_tms is null
		join ft_t_isgr isgr on isgr.ISS_GRP_OID = isgp.PRNT_ISS_GRP_OID
			and isgr.GRP_NME like 'PRT%'
		join notsame on isgr.grp_nme = notsame.grp_nme
			and isrt.DATA_SRC_ID = notsame.DATA_SRC_ID
			and rtng.RTNG_SET_NME = notsame.RTNG_SET_NME
	where isrt.END_TMS is null 
		and isrt.SYS_EFF_END_TMS is null
	order by isgr.grp_nme, rtng.RTNG_SET_NME, isrt.RTNG_CDE desc, pref_iss_id) as data
	order by ordernum</objectValue>
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
<directJoin>false</directJoin>
<name id="74">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="75">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="76" type="java.util.HashSet"/>
<targets id="77" type="java.util.HashSet">
<item idref="70" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="55"/>
</item>
</sources>
<targets id="78" type="java.util.HashSet">
<item id="79" type="com.j2fe.workflow.definition.Transition">
<name id="80">nothing-found</name>
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
<targets id="81" type="java.util.HashSet">
<item idref="34" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="29"/>
</item>
<item id="82" type="com.j2fe.workflow.definition.Transition">
<name id="83">goto-next</name>
<source id="84">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="85"/>
<directJoin>false</directJoin>
<name id="86">Write to Temp File</name>
<nodeHandler>com.j2fe.general.activities.File</nodeHandler>
<nodeHandlerClass id="87">com.j2fe.general.activities.File</nodeHandlerClass>
<parameters id="88" type="java.util.HashSet">
<item id="89" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="90">appendEOFLine</name>
<stringValue id="91">true</stringValue>
<type>CONSTANT</type>
</item>
<item id="92" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="93">directory</name>
<stringValue id="94">FtpFileDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="95" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="96">fileName</name>
<stringValue id="97">fileNameBase</stringValue>
<type>VARIABLE</type>
</item>
<item id="98" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="99">text</name>
<stringValue id="100">PortfolioDifferenceReportRow</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="101" type="java.util.HashSet">
<item id="102" type="com.j2fe.workflow.definition.Transition">
<name id="103">loop</name>
<source idref="9"/>
<target idref="84"/>
</item>
</sources>
<targets id="104" type="java.util.HashSet">
<item idref="82" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="29"/>
</item>
</sources>
<targets id="105" type="java.util.HashSet">
<item idref="27" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="9"/>
</item>
</sources>
<targets id="106" type="java.util.HashSet">
<item idref="7" type="com.j2fe.workflow.definition.Transition"/>
<item idref="102" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="2"/>
</item>
<item idref="79" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="107" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="108">Mizuho</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="109">user1</lastChangeUser>
<lastUpdate id="110">2026-01-07T09:48:17.000+0000</lastUpdate>
<name id="111">MZ_PortfolioDifferenceReport</name>
<nodes id="112" type="java.util.HashSet">
<item idref="36" type="com.j2fe.workflow.definition.Node"/>
<item idref="55" type="com.j2fe.workflow.definition.Node"/>
<item idref="9" type="com.j2fe.workflow.definition.Node"/>
<item idref="29" type="com.j2fe.workflow.definition.Node"/>
<item idref="72" type="com.j2fe.workflow.definition.Node"/>
<item idref="2" type="com.j2fe.workflow.definition.Node"/>
<item idref="84" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>true</optimize>
<parameter id="113" type="java.util.HashMap">
<entry>
<key id="114" type="java.lang.String">FtpFileDirectory</key>
<value id="115" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="116">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="117" type="java.lang.String">QueryNameForPublishing</key>
<value id="118" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="119">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="120">PortfolioDifferenceReport</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
</parameter>
<permissions id="121" type="java.util.HashSet"/>
<priority>0</priority>
<purgeAtEnd>false</purgeAtEnd>
<retries>0</retries>
<startNode idref="72"/>
<status>RELEASED</status>
<variables id="122" type="java.util.HashMap">
<entry>
<key id="123" type="java.lang.String">FtpFileDirectory</key>
<value id="124" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="125">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="126" type="java.lang.String">/tmp/</value>
</value>
</entry>
<entry>
<key id="127" type="java.lang.String">QueryNameForPublishing</key>
<value id="128" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="129">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="130">PortfolioDifferenceReport</description>
<persistent>false</persistent>
<value id="131" type="java.lang.String">PortfolioDifferenceReport</value>
</value>
</entry>
<entry>
<key id="132" type="java.lang.String">forLoopCnt</key>
<value id="133" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="134">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<persistent>false</persistent>
<value id="135" type="java.lang.Integer">0</value>
</value>
</entry>
</variables>
<version>4</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
