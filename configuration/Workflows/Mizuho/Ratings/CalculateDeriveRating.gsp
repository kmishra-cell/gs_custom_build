<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.11">
<package-comment/>
<businessobject displayString="53 - V10 global variables and NR and sys_eff_end_tms check and logger" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>true</alwaysPersist>
<clustered>false</clustered>
<comment id="1">V10 global variables and NR and sys_eff_end_tms check and logger</comment>
<description id="2"/>
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
<name id="19">indexedParameters[0]</name>
<stringValue id="20">PortfolioOid</stringValue>
<type>VARIABLE</type>
</item>
<item id="21" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="22">indexedParameters[1]</name>
<stringValue id="23">DeriveSetOid</stringValue>
<type>VARIABLE</type>
</item>
<item id="24" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="25">querySQL</name>
<objectValue id="26" type="java.lang.String">insert into ft_t_isrt (ISS_RTNG_OID, INSTR_ID, START_TMS, LAST_CHG_USR_ID, LAST_CHG_TMS, RTNG_CDE, RTNG_SYMBOL_TXT, RTNG_VALUE_OID, RTNG_SET_OID, orig_data_prov_id, data_stat_typ, rtng_eff_tms, data_src_id)
select new_oid(), instr_id, sysdate(), 'CalculateDeriveRating_NR', sysdate(), RTNG_CDE,RTNG_CDE,RTNG_VALUE_OID, RTNG_SET_OID, 'DERIVED', 'ACTIVE', date_trunc('day', sysdate())::timestamp, 'MHI' from ft_t_isgp isgp, ft_t_rtvl rtvl
where prnt_iss_grp_oid = ? and prt_purp_typ = 'PRTFLIOC'
and isgp.start_tms &lt;= sysdate() and (isgp.end_tms is null or isgp.end_tms &gt; sysdate())
and rtvl.rtng_set_oid = ?
and rtvl.rtng_cde = 'NR'
and not exists (select 1 from ft_t_isrt where instr_id=isgp.instr_id and rtng_set_oid = 'RTNG000014' and rtng_cde = 'NR' and sys_eff_end_tms is null)
ON conflict (instr_id, rtng_set_oid, rtng_value_oid, COALESCE(rtng_debt_cl_typ, '=NULL='::character varying), COALESCE(rtng_curr_cde, '=NULL='::character varying), COALESCE(rtng_snrty_typ, '=NULL='::character varying), COALESCE(rtng_purp_typ, '=NULL='::character varying), COALESCE(rtng_curr_typ, '=NULL='::character varying), COALESCE(rtng_eff_tms, '9999-12-31 00:00:00'::timestamp without time zone), COALESCE(rtng_sec_instr_ind, '=NULL='::bpchar), COALESCE(rtng_id, '=NULL='::character varying), start_tms, COALESCE(rtng_calc_typ, '=NULL='::character varying), COALESCE(support_clsf_oid, '=NULL='::character varying))
do nothing;</objectValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="27" type="java.util.HashSet">
<item id="28" type="com.j2fe.workflow.definition.Transition">
<name id="29">2</name>
<source id="30">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="31"/>
<directJoin>false</directJoin>
<name id="32">Rating VlaueOid and RatingSetOid Null check</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="33">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="34" type="java.util.HashSet">
<item id="35" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="36">statements</name>
<stringValue id="37">System.out.println("Printing variable values ratingSetoid,ratingValueOid,ratingCode,portfolioOid,dataSource");

System.out.println(ratingSetoid);

System.out.println(ratingValueOid);

System.out.println(ratingCode);

System.out.println(portfolioOid);

System.out.println(dataSource);


if((ratingSetoid != null) &amp;&amp; (ratingValueOid != null) &amp;&amp; (ratingCode != null) &amp;&amp; (portfolioOid != null) &amp;&amp; (dataSource != null))
  return 1;
else
  return 2;</stringValue>
<type>CONSTANT</type>
</item>
<item id="38" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="39">["dataSource"]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="40">variables["dataSource"]</name>
<stringValue id="41">dataSrc</stringValue>
<type>VARIABLE</type>
</item>
<item id="42" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="43">["portfolioOid"]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="44">variables["portfolioOid"]</name>
<stringValue id="45">PortfolioOid</stringValue>
<type>VARIABLE</type>
</item>
<item id="46" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="47">["ratingCode"]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="48">variables["ratingCode"]</name>
<stringValue id="49">code</stringValue>
<type>VARIABLE</type>
</item>
<item id="50" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="51">["ratingSetoid"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="52">variables["ratingSetoid"]</name>
<stringValue id="53">DeriveSetOid</stringValue>
<type>VARIABLE</type>
</item>
<item id="54" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="55">["ratingValueOid"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="56">variables["ratingValueOid"]</name>
<stringValue id="57">rtngvalueoid</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="58" type="java.util.HashSet">
<item id="59" type="com.j2fe.workflow.definition.Transition">
<name id="60">goto-next</name>
<source id="61">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="62"/>
<directJoin>false</directJoin>
<name id="63">Insert Derivation Rule</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="64">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="65" type="java.util.HashSet">
<item id="66" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="67">database</name>
<stringValue id="68">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="69" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="70">indexedParameters[0]</name>
<stringValue id="71">Issue</stringValue>
<type>VARIABLE</type>
</item>
<item id="72" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="73">indexedParameters[1]</name>
<stringValue id="74">derivePolicy</stringValue>
<type>VARIABLE</type>
</item>
<item id="75" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="76">indexedParameters[2]</name>
<stringValue id="77">Issue</stringValue>
<type>VARIABLE</type>
</item>
<item id="78" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="79">indexedParameters[3]</name>
<stringValue id="80">derivePolicy</stringValue>
<type>VARIABLE</type>
</item>
<item id="81" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="82">querySQL</name>
<stringValue id="83">MERGE INTO ft_t_isst AS isst
USING (
    SELECT instr_id
    FROM ft_t_issu issu
    WHERE instr_id = ?
) AS issu
ON (
    isst.instr_id = issu.instr_id
    AND isst.stat_def_id = 'MIZDRVRL'
    AND isst.start_tms &lt; sysdate()
    AND (isst.end_tms IS NULL OR isst.end_tms &gt; sysdate())
)
WHEN MATCHED THEN
    UPDATE SET stat_char_val_txt = ?,
               last_chg_usr_id   = 'CalculateDeriveRating',
               last_chg_tms      = sysdate()
WHEN NOT MATCHED THEN
    INSERT (stat_id, stat_def_id, instr_id, start_tms, last_chg_tms, last_chg_usr_id, stat_char_val_txt)
    VALUES (new_oid(), 'MIZDRVRL', ?, sysdate(), sysdate(), 'CalculateDeriveRating', ?);</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="84" type="java.util.HashSet">
<item id="85" type="com.j2fe.workflow.definition.Transition">
<name id="86">goto-next</name>
<source id="87">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="88"/>
<directJoin>false</directJoin>
<name id="89">Bean Shell Script (Standard)</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="90">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="91" type="java.util.HashSet">
<item id="92" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="93">statements</name>
<objectValue id="94" type="java.lang.String">boolean internalfound = false;
boolean snpfound = false;
boolean fitchfound = false;
boolean moodyfound = false;
boolean jcrfound = false;
String[] derRating = new String[3];
int internal= -1;
int snp = -1;
int fitch = -1;
int moody = -1;
int jcr = -1;
		
		
String derivePolicy = "";
String dataSrc = "";
	
for(int i=0; i&lt; input.length; i++){
	if("RTNG000001".equalsIgnoreCase(input[i][0])){
		moodyfound = true;
		moody = i;
	}else if("RTNG000002".equalsIgnoreCase(input[i][0])){
		fitchfound = true;
		fitch = i;
	}else if("RTNG000003".equalsIgnoreCase(input[i][0])){
		snpfound = true;
		snp = i;
	}else if("RTNG000004".equalsIgnoreCase(input[i][0])){
		jcrfound = true;
		jcr = i;
	}else if("RTNG000006".equalsIgnoreCase(input[i][0])){
		internalfound = true;
		internal = i;
	}
}
		
if (internalfound &amp;&amp; !(moodyfound || fitchfound || snpfound || jcrfound)){
	derivePolicy = "DIRECT INTERNAL";
	derRating = input[internal][3].split(";");
	dataSrc = "MHI";
}else if (internalfound &amp;&amp; (moodyfound || fitchfound || snpfound || jcrfound)){
	derivePolicy = "DIRECT BOTH";
	derRating = input[internal][3].split(";");
	dataSrc = "MHI";
} else if (!internalfound &amp;&amp; (moodyfound || fitchfound || snpfound || jcrfound)){
	derivePolicy = "DIRECT AGENCY";
	if(moodyfound &amp;&amp; snpfound){
		String[] derRatingM = input[moody][3].split(";");
		String[] derRatingS = input[snp][3].split(";");
	if(Integer.parseInt(derRatingM[1]) &gt;= Integer.parseInt(derRatingS[1])){
		derRating = derRatingM;
		dataSrc = "MOODY";
	} else {
		derRating = derRatingS;
		dataSrc = "SAP";
	}
		
}else if (!moodyfound &amp;&amp; snpfound){ 
		derRating = input[snp][3].split(";");
		dataSrc = "SAP";
	}else if (moodyfound &amp;&amp; !snpfound){ 
		derRating = input[moody][3].split(";");
		dataSrc = "MOODY";
	}else if (fitchfound){ 
		derRating = input[fitch][3].split(";");
		dataSrc = "FITCH";
	}else if (jcrfound){ 
		derRating = input[jcr][3].split(";");
		dataSrc = "JCR";
	}
}
		
		
String code = derRating[0];
String rtngvalueoid = derRating[2];
</objectValue>
<type>CONSTANT</type>
</item>
<item id="95" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="96">["code"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="97">variables["code"]</name>
<stringValue id="98">code</stringValue>
<type>VARIABLE</type>
</item>
<item id="99" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="100">variables["dataSrc"]</name>
<stringValue id="101">dataSrc</stringValue>
<type>VARIABLE</type>
</item>
<item id="102" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="103">variables["derivePolicy"]</name>
<stringValue id="104">derivePolicy</stringValue>
<type>VARIABLE</type>
</item>
<item id="105" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="106">variables["input"]</name>
<stringValue id="107">DerivedRatings</stringValue>
<type>VARIABLE</type>
</item>
<item id="108" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="109">["rtngvalueoid"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="110">variables["rtngvalueoid"]</name>
<stringValue id="111">rtngvalueoid</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="112" type="java.util.HashSet">
<item id="113" type="com.j2fe.workflow.definition.Transition">
<name id="114">rows-found</name>
<source id="115">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="116"/>
<directJoin>false</directJoin>
<name id="117">Get Portfolio Instrumennts</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="118">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="119" type="java.util.HashSet">
<item id="120" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="121">database</name>
<stringValue id="122">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="123" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="124">indexedParameters[0]</name>
<stringValue id="125">DeriveSetOid</stringValue>
<type>VARIABLE</type>
</item>
<item id="126" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="127">indexedParameters[1]</name>
<stringValue id="128">PortfolioOid</stringValue>
<type>VARIABLE</type>
</item>
<item id="129" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="130">indexedResult</name>
<stringValue id="131">DerivedRatings</stringValue>
<type>VARIABLE</type>
<variablePart id="132"/>
</item>
<item id="133" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="134">querySQL</name>
<stringValue id="135">select * from (select rtng_set_oid, rtng_value_oid, rtng_cde,
( select rtng_cde||';'||rank_num||';'||trim(rtng_value_oid) from ft_t_rtvl where rank_num = 
(select rank_num from ft_t_rtvl rtvl1 where rtvl1.rtng_cde = isrt.rtng_cde and rtvl1.rtng_set_oid = isrt.rtng_set_oid)
and rtng_set_oid = ?) derive
from ft_t_isrt isrt
where instr_id = (select instr_id from ft_t_isgp isgp where isgp.prnt_iss_grp_oid = ? and isgp.prt_purp_typ = 'PRTFLIOC'
and isgp.start_tms &lt;= sysdate() and (isgp.end_tms is null or isgp.end_tms &gt; sysdate()) limit 1) 
and orig_data_prov_id = 'DERIVED'
and isrt.end_tms is null and isrt.sys_eff_end_tms is null
and data_stat_typ = 'ACTIVE') sq1 where derive is not null</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="136" type="java.util.HashSet">
<item id="137" type="com.j2fe.workflow.definition.Transition">
<name id="138">goto-next</name>
<source id="139">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="140"/>
<directJoin>false</directJoin>
<name id="141">Insert Rating for Portfolio</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="142">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="143" type="java.util.HashSet">
<item id="144" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="145">database</name>
<stringValue id="146">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="147" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="148">querySQL</name>
<stringValue id="149">sqlExecute</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="150" type="java.util.HashSet">
<item id="151" type="com.j2fe.workflow.definition.Transition">
<name id="152">goto-next</name>
<source id="153">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="154"/>
<directJoin>false</directJoin>
<name id="155">Missmatch=False</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="156">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="157" type="java.util.HashSet">
<item id="158" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="159">database</name>
<stringValue id="160">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="161" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="162">indexedParameters[0]</name>
<stringValue id="163">Issue</stringValue>
<type>VARIABLE</type>
</item>
<item id="164" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="165">querySQL</name>
<stringValue id="166">update ft_t_isst set stat_int_val_num = 0, data_src_id = NULL&#13;
where stat_def_id = 'MIZRECAL'&#13;
and start_tms &lt;= now() and (end_tms is null or end_tms &gt; now())&#13;
and instr_id = ? and (stat_int_val_num = 1 or stat_int_val_num is null)</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="167" type="java.util.HashSet">
<item id="168" type="com.j2fe.workflow.definition.Transition">
<name id="169">1</name>
<source id="170">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="171"/>
<directJoin>false</directJoin>
<name id="172">Check if rating missmatch</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="173">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="174" type="java.util.HashSet">
<item id="175" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="176">statements</name>
<objectValue id="177" type="java.lang.String">String excludeList = "'DERIVED'";
boolean missmatch = false;
for(int i=0; i&lt; Ratings.length; i++){
	for(int j=i+1; j&lt; Ratings.length; j++){

		if( Ratings[i][1].equalsIgnoreCase( Ratings[j][1])){
			excludeList = excludeList + ",'"+Ratings[j][1]+"'";			
			missmatch = true;
		}
	}
}


String sqlExecute = "insert into ft_t_isrt (ISS_RTNG_OID, INSTR_ID, START_TMS, LAST_CHG_USR_ID, LAST_CHG_TMS, RTNG_CDE, RTNG_SYMBOL_TXT, RTNG_VALUE_OID, RTNG_SET_OID, orig_data_prov_id, data_stat_typ, rtng_eff_tms, data_src_id)"+
" select  new_oid(),  instr_id, sysdate(), 'CalculateDeriveRating', sysdate(), rtng_cde, rtng_cde, rtng_value_oid, rtng_set_oid, 'DERIVED', 'ACTIVE', date_trunc('day', CURRENT_TIMESTAMP)::timestamp, data_src_id"+
" from ("+
" select  distinct  ai.instr_id, rtvl.rtng_cde, rtvl.rtng_value_oid, rtvl.rtng_set_oid, e.data_src_id from ft_t_rtvl rtvl,"+
" ("+
" select distinct isrt.rtng_cde, rtvl.rtng_set_oid, rtvl.data_src_id, rtvl.rank_num"+
" from ft_t_isrt isrt, ft_t_issu issu , ft_t_rtvl rtvl where issu.instr_issr_id = '"+Issuer + "' and isrt.instr_id = issu.instr_id"+
" and issu.start_tms &lt;= sysdate() and (issu.end_tms is null or issu.end_tms &gt; sysdate())"+
" and sysdate() between isrt.start_tms and coalesce(isrt.end_tms, sysdate() + interval '1 day') and sysdate() between isrt.rtng_eff_tms and coalesce(isrt.sys_eff_end_tms, sysdate() + interval '1 day')"+
" and coalesce(isrt.rtng_purp_typ,'x') != 'PSTANDRD'"+
" AND EXISTS (SELECT 1 FROM FT_T_ISTY ISTY WHERE ISTY.ISS_TYP = ISSU.ISS_TYP AND ISTY.PRNT_ISS_TYP = 'DEBT'"+
" AND ISTY.START_TMS &lt;=sysdate() AND (ISTY.END_TMS IS NULL OR ISTY.END_TMS &gt; sysdate()))"+
" and rtvl.start_tms &lt;= sysdate() and (rtvl.end_tms is null or rtvl.end_tms &gt; sysdate()) and isrt.rtng_value_oid = rtvl.rtng_value_oid"+
" and exists (select 1 from ft_t_isgp isgp where isgp.prnt_iss_grp_oid ='"+Portfolio+"' and isgp.instr_id = issu.instr_id and isgp.prt_purp_typ = 'PRTFLIOC'"+
" and isgp.start_tms &lt;= sysdate() and (isgp.end_tms is null or isgp.end_tms &gt; sysdate()))"+
" and (isrt.data_src_id is null or isrt.data_src_id not in ("+excludeList+"))"+
" union"+
" select distinct firt.rtng_cde, rtvl.rtng_set_oid, rtvl.data_src_id, rtvl.rank_num"+
" from ft_t_firt firt, ft_t_rtvl rtvl"+
" where inst_mnem in (select mhi_fins_up(fins_inst_mnem) from ft_t_issr where instr_issr_id = '"+Issuer + "')"+
" and sysdate() between firt.start_tms and coalesce(firt.end_tms, sysdate() + interval '1 day')"+
" and sysdate() between firt.rtng_eff_tms and coalesce(firt.sys_eff_end_tms, sysdate() + interval '1 day')"+
" and firt.RTNG_VALUE_OID = rtvl.RTNG_VALUE_OID"+
" and firt.RTNG_CDE = rtvl.RTNG_CDE"+
" and firt.data_src_id in ('FITCH','MOODYS_RDS','SNPXF_RT','BB')"+
" and (firt.data_src_id is null or firt.data_src_id not in ("+excludeList+"))"+
" and exists ("+
" select 1 from ft_t_iscl grp, ft_t_iscl sgr, ft_t_iscl sec"+
" where grp.instr_id in (select instr_id from ft_t_isgp isgp where isgp.prnt_iss_grp_oid = '"+Portfolio+"'"+
" and isgp.prt_purp_typ = 'PRTFLIOC' and isgp.start_tms &lt;= sysdate() and (isgp.end_tms is null or isgp.end_tms &gt; sysdate()))"+
" and grp.instr_id = sgr.instr_id and grp.instr_id = sec.instr_id"+
" and grp.INDUS_CL_SET_ID = 'BBINDGRP' and grp.cl_value = 'Sovereign'"+
" and grp.end_tms is null"+
" and sgr.INDUS_CL_SET_ID = 'BBINDSGR' and sgr.cl_value = 'Sovereign'"+
" and sgr.end_tms is null"+
" and sec.INDUS_CL_SET_ID = 'BBINDSEC' and sec.cl_value = 'Government'"+
" and sec.end_tms is null)"+
" and not exists ("+
" select 1 from ft_t_isrt isrt"+
" where isrt.instr_id in (select instr_id from ft_t_isgp isgp where isgp.prnt_iss_grp_oid = '"+Portfolio+"'"+
" and isgp.prt_purp_typ = 'PRTFLIOC' and isgp.start_tms &lt;= sysdate() and (isgp.end_tms is null or isgp.end_tms &gt; sysdate()))"+
" and isrt.data_src_id = firt.data_src_id)"+
" ) e,"+
" (select instr_id from ft_t_isgp isgp where isgp.prnt_iss_grp_oid = '"+Portfolio+"' and isgp.prt_purp_typ = 'PRTFLIOC'"+
" and isgp.start_tms &lt;= sysdate() and (isgp.end_tms is null or isgp.end_tms &gt; sysdate())) ai"+
" where rtvl.rank_num = e.rank_num"+
" and trim(rtvl.rtng_set_oid) = ("+
" case  when e.data_src_id = 'MOODYS_RDS' then 'RTNG000001'"+
"      when e.data_src_id = 'FITCH' then 'RTNG000002'"+
"      when e.data_src_id = 'SNPXF_RT' then 'RTNG000003'"+
"      when e.data_src_id = 'BB' then 'RTNG000004'"+
"      when e.data_src_id = 'JCR' then 'RTNG000004'"+
"      when e.RTNG_SET_OID = '3000000006' then 'RTNG000004'" +
"      when e.rtng_set_oid = 'MIZRTN18' then 'RTNG000006'"+
" end)) sq1 "+
" on conflict (instr_id, rtng_set_oid, rtng_value_oid, COALESCE(rtng_debt_cl_typ, '=NULL='::character varying), COALESCE(rtng_curr_cde, '=NULL='::character varying), COALESCE(rtng_snrty_typ, '=NULL='::character varying), COALESCE(rtng_purp_typ, '=NULL='::character varying), COALESCE(rtng_curr_typ, '=NULL='::character varying), COALESCE(rtng_eff_tms, '9999-12-31 00:00:00'::timestamp without time zone), COALESCE(rtng_sec_instr_ind, '=NULL='::bpchar), COALESCE(rtng_id, '=NULL='::character varying), start_tms, COALESCE(rtng_calc_typ, '=NULL='::character varying), COALESCE(support_clsf_oid, '=NULL='::character varying)) "+
" do nothing";

if(missmatch){
	return 2;
}else{
	return 1;
}</objectValue>
<type>CONSTANT</type>
</item>
<item id="178" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="179">["Issuer"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="180">variables["Issuer"]</name>
<stringValue id="181">Issuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="182" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="183">["Portfolio"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="184">variables["Portfolio"]</name>
<stringValue id="185">PortfolioOid</stringValue>
<type>VARIABLE</type>
</item>
<item id="186" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="187">variables["Ratings"]</name>
<stringValue id="188">Ratings</stringValue>
<type>VARIABLE</type>
</item>
<item id="189" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="190">variables["excludeList"]</name>
<stringValue id="191">excludeList</stringValue>
<type>VARIABLE</type>
</item>
<item id="192" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="193">["sqlExecute"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="194">variables["sqlExecute"]</name>
<stringValue id="195">sqlExecute</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="196" type="java.util.HashSet">
<item id="197" type="com.j2fe.workflow.definition.Transition">
<name id="198">rows-found</name>
<source id="199">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="200"/>
<directJoin>false</directJoin>
<name id="201">Database Select (Xor Split)</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="202">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="203" type="java.util.HashSet">
<item id="204" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="205">database</name>
<stringValue id="206">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="207" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="208">indexedResult</name>
<stringValue id="209">Ratings</stringValue>
<type>VARIABLE</type>
</item>
<item id="210" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="211">["1"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="212">mappedParameters["1"]</name>
<stringValue id="213">Issuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="214" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="215">["2"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="216">mappedParameters["2"]</name>
<stringValue id="217">PortfolioOid</stringValue>
<type>VARIABLE</type>
</item>
<item id="218" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="219">["3"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="220">mappedParameters["3"]</name>
<stringValue id="221">Issuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="222" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="223">["4"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="224">mappedParameters["4"]</name>
<stringValue id="225">PortfolioOid</stringValue>
<type>VARIABLE</type>
</item>
<item id="226" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="227">["5"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="228">mappedParameters["5"]</name>
<stringValue id="229">PortfolioOid</stringValue>
<type>VARIABLE</type>
</item>
<item id="230" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="231">querySQL</name>
<objectValue id="232" type="java.lang.String">select distinct isrt.rtng_cde, COALESCE(isrt.data_src_id, 'MHI')
from ft_t_isrt isrt, ft_t_rtvl rtvl, ft_t_issu issu where issu.instr_issr_id = ?
and isrt.instr_id = issu.instr_id
and issu.start_tms &lt;= sysdate() and (issu.end_tms is null or issu.end_tms &gt; sysdate())
--RDD-268 start
and sysdate() between isrt.start_tms and coalesce(isrt.end_tms, sysdate() + interval '1 day')
and sysdate() between isrt.rtng_eff_tms and coalesce(isrt.sys_eff_end_tms, sysdate() + interval '1 day')
--RDD-268 end
AND EXISTS (SELECT 1 FROM FT_T_ISTY ISTY WHERE ISTY.ISS_TYP = ISSU.ISS_TYP AND ISTY.PRNT_ISS_TYP = 'DEBT'
AND ISTY.START_TMS &lt;=sysdate() AND (ISTY.END_TMS IS NULL OR ISTY.END_TMS &gt; sysdate()))
--COP-26620 start
--and isrt.data_src_id is not null
--COP-26620 end
and exists (select 1 from ft_t_isgp isgp where isgp.prnt_iss_grp_oid = ? 
and isgp.instr_id = issu.instr_id and isgp.prt_purp_typ = 'PRTFLIOC'
and isgp.start_tms &lt;= sysdate() and (isgp.end_tms is null or isgp.end_tms &gt; sysdate()))
and (isrt.orig_data_prov_id != 'DERIVED' or isrt.orig_data_prov_id is null)
--COP-26620 start
and (isrt.data_stat_typ != 'INACTIVE' or isrt.data_stat_typ is null)
--COP-26620 end
and coalesce(isrt.rtng_purp_typ,'x') != 'PSTANDRD'
and isrt.RTNG_VALUE_OID = rtvl.RTNG_VALUE_OID
and isrt.RTNG_CDE = rtvl.RTNG_CDE
and coalesce(rtvl.RANK_NUM,1) &gt; 1
union
select distinct firt.rtng_cde, firt.data_src_id
from ft_t_firt firt, ft_t_rtvl rtvl
where inst_mnem in (select mhi_fins_up(fins_inst_mnem) from ft_t_issr where instr_issr_id = ?)
and sysdate() between firt.start_tms and coalesce(firt.end_tms, sysdate() + interval'1 day')
and sysdate() between firt.rtng_eff_tms and coalesce(firt.sys_eff_end_tms, sysdate() + interval'1 day')
and firt.RTNG_VALUE_OID = rtvl.RTNG_VALUE_OID
and firt.RTNG_CDE = rtvl.RTNG_CDE
and firt.data_src_id in ('FITCH','MOODYS_RDS','SNPXF_RT')
and coalesce(rtvl.RANK_NUM,1) &gt; 1
and exists (
select 1 from ft_t_iscl grp, ft_t_iscl sgr, ft_t_iscl sec
where grp.instr_id in (select instr_id from ft_t_isgp isgp where isgp.prnt_iss_grp_oid =?
and isgp.prt_purp_typ = 'PRTFLIOC' and isgp.start_tms &lt;= sysdate() and (isgp.end_tms is null or isgp.end_tms &gt; sysdate()))
and grp.instr_id = sgr.instr_id and grp.instr_id = sec.instr_id
and grp.INDUS_CL_SET_ID = 'BBINDGRP' and grp.cl_value = 'Sovereign'
and grp.end_tms is null
and sgr.INDUS_CL_SET_ID = 'BBINDSGR' and sgr.cl_value = 'Sovereign'
and sgr.end_tms is null
and sec.INDUS_CL_SET_ID = 'BBINDSEC' and sec.cl_value = 'Government'
and sec.end_tms is null)
and not exists (
select 1 from ft_t_isrt isrt
where isrt.instr_id in (select instr_id from ft_t_isgp isgp where isgp.prnt_iss_grp_oid =?
and isgp.prt_purp_typ = 'PRTFLIOC' and isgp.start_tms &lt;= sysdate() and (isgp.end_tms is null or isgp.end_tms &gt; sysdate()))
and isrt.data_src_id = firt.data_src_id)</objectValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="233" type="java.util.HashSet">
<item id="234" type="com.j2fe.workflow.definition.Transition">
<name id="235">goto-next</name>
<source id="236">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="237"/>
<directJoin>false</directJoin>
<name id="238">Delete non SOI</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="239">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="240" type="java.util.HashSet">
<item id="241" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="242">database</name>
<stringValue id="243">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="244" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="245">indexedParameters[0]</name>
<stringValue id="246">PortfolioOid</stringValue>
<type>VARIABLE</type>
</item>
<item id="247" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="248">querySQL</name>
<stringValue id="249">update ft_t_isgp p
set end_tms = sysdate(), last_chg_tms = sysdate(), last_chg_usr_id = 'CalculateDeriveRating'
where prnt_iss_grp_oid = ?
and prt_purp_typ = 'PRTFLIOC'
and not exists (select 1 from ft_t_isgp m where end_tms is null and m.instr_id = p.instr_id and m.prt_purp_typ = 'INTEREST' and m.PRNT_ISS_GRP_OID not in (select ISS_GRP_OID from FT_T_ISGR where GRP_NME like 'MHSC%'))</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="250" type="java.util.HashSet">
<item id="251" type="com.j2fe.workflow.definition.Transition">
<name id="252">goto-next</name>
<source id="253">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="254"/>
<directJoin>false</directJoin>
<name id="255">Delete Existing Portfolio Rating</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="256">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="257" type="java.util.HashSet">
<item id="258" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="259">database</name>
<stringValue id="260">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="261" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="262">indexedParameters[0]</name>
<stringValue id="263">PortfolioOid</stringValue>
<type>VARIABLE</type>
</item>
<item id="264" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="265">querySQL</name>
<stringValue id="266">delete
from
	ft_t_isrt isrt
where
	instr_id in (
	select
		instr_id
	from
		ft_t_isgp
	where
		prnt_iss_grp_oid = ?
		and prt_purp_typ = 'PRTFLIOC'
		and start_tms &lt;= sysdate()
		and (end_tms is null or end_tms &gt; sysdate()))
	and sysdate() between isrt.start_tms and coalesce(isrt.end_tms, sysdate() + interval '1 day')
	and sysdate() between isrt.rtng_eff_tms and coalesce(isrt.sys_eff_end_tms, sysdate() + interval '1 day')
	and orig_data_prov_id in ('DERIVED','S1','M1','F1','J1','S2','M2','F2','J2','S3','M3','F3','J3','NR')</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="267" type="java.util.HashSet">
<item id="268" type="com.j2fe.workflow.definition.Transition">
<name id="269">goto-next</name>
<source id="270">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="271"/>
<directJoin>false</directJoin>
<name id="272">Delete Derivation Rule</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="273">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="274" type="java.util.HashSet">
<item id="275" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="276">database</name>
<stringValue id="277">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="278" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="279">indexedParameters[0]</name>
<stringValue id="280">Issue</stringValue>
<type>VARIABLE</type>
</item>
<item id="281" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="282">querySQL</name>
<stringValue id="283">delete from ft_t_isst where instr_id = ? and stat_def_id = 'MIZDRVRL'</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="284" type="java.util.HashSet">
<item id="285" type="com.j2fe.workflow.definition.Transition">
<name id="286">goto-next</name>
<source id="287">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="288"/>
<directJoin>false</directJoin>
<name id="289">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="290">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="291" type="java.util.HashSet"/>
<targets id="292" type="java.util.HashSet">
<item idref="285" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="270"/>
</item>
</sources>
<targets id="293" type="java.util.HashSet">
<item idref="268" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="253"/>
</item>
</sources>
<targets id="294" type="java.util.HashSet">
<item idref="251" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="236"/>
</item>
</sources>
<targets id="295" type="java.util.HashSet">
<item idref="234" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="199"/>
</item>
</sources>
<targets id="296" type="java.util.HashSet">
<item id="297" type="com.j2fe.workflow.definition.Transition">
<name id="298">nothing-found</name>
<source idref="199"/>
<target id="299">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="300"/>
<directJoin>false</directJoin>
<name id="301">Missmatch=False</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="302">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="303" type="java.util.HashSet">
<item id="304" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="305">database</name>
<stringValue id="306">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="307" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="308">indexedParameters[0]</name>
<stringValue id="309">Issue</stringValue>
<type>VARIABLE</type>
</item>
<item id="310" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="311">querySQL</name>
<stringValue id="312">update ft_t_isst set stat_int_val_num = 0, data_src_id = NULL&#13;
where stat_def_id = 'MIZRECAL'&#13;
and start_tms &lt;= now() and (end_tms is null or end_tms &gt; now())&#13;
and instr_id = ? and (stat_int_val_num = 1 or stat_int_val_num is null)</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="313" type="java.util.HashSet">
<item idref="297" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="314" type="java.util.HashSet">
<item id="315" type="com.j2fe.workflow.definition.Transition">
<name id="316">goto-next</name>
<source idref="299"/>
<target id="317">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="318"/>
<directJoin>false</directJoin>
<name id="319">Insert NR Derive Policy</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="320">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="321" type="java.util.HashSet">
<item id="322" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="323">database</name>
<stringValue id="324">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="325" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="326">indexedParameters[0]</name>
<stringValue id="327">PortfolioOid</stringValue>
<type>VARIABLE</type>
</item>
<item id="328" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="329">indexedParameters[1]</name>
<stringValue id="330">DeriveSetOid</stringValue>
<type>VARIABLE</type>
</item>
<item id="331" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="332">querySQL</name>
<objectValue id="333" type="java.lang.String">insert into ft_t_isrt (ISS_RTNG_OID, INSTR_ID, START_TMS, LAST_CHG_USR_ID, LAST_CHG_TMS, RTNG_CDE, RTNG_SYMBOL_TXT, RTNG_VALUE_OID, RTNG_SET_OID, orig_data_prov_id, data_stat_typ, rtng_eff_tms, data_src_id)
select new_oid(), instr_id, sysdate(), 'CalculateDeriveRating', sysdate(), RTNG_CDE,RTNG_CDE,RTNG_VALUE_OID, RTNG_SET_OID, 'DERIVED', 'ACTIVE', date_trunc('day', sysdate())::timestamp, 'MHI' from ft_t_isgp isgp, ft_t_rtvl rtvl
where prnt_iss_grp_oid = ? and prt_purp_typ = 'PRTFLIOC'
and isgp.start_tms &lt;= sysdate() and (isgp.end_tms is null or isgp.end_tms &gt; sysdate())
and rtvl.rtng_set_oid = ?
and rtvl.rtng_cde = 'NR'
and not exists (select 1 from ft_t_isrt where instr_id=isgp.instr_id and rtng_set_oid = 'RTNG000014' and rtng_cde = 'NR' and sys_eff_end_tms is null)
ON conflict (instr_id, rtng_set_oid, rtng_value_oid, COALESCE(rtng_debt_cl_typ, '=NULL='::character varying), COALESCE(rtng_curr_cde, '=NULL='::character varying), COALESCE(rtng_snrty_typ, '=NULL='::character varying), COALESCE(rtng_purp_typ, '=NULL='::character varying), COALESCE(rtng_curr_typ, '=NULL='::character varying), COALESCE(rtng_eff_tms, '9999-12-31 00:00:00'::timestamp without time zone), COALESCE(rtng_sec_instr_ind, '=NULL='::bpchar), COALESCE(rtng_id, '=NULL='::character varying), start_tms, COALESCE(rtng_calc_typ, '=NULL='::character varying), COALESCE(support_clsf_oid, '=NULL='::character varying))
do nothing;</objectValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="334" type="java.util.HashSet">
<item idref="315" type="com.j2fe.workflow.definition.Transition"/>
<item id="335" type="com.j2fe.workflow.definition.Transition">
<name id="336">nothing-found</name>
<source idref="115"/>
<target idref="317"/>
</item>
</sources>
<targets id="337" type="java.util.HashSet">
<item id="338" type="com.j2fe.workflow.definition.Transition">
<name id="339">goto-next</name>
<source idref="317"/>
<target idref="3"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item idref="197" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="170"/>
</item>
</sources>
<targets id="340" type="java.util.HashSet">
<item idref="168" type="com.j2fe.workflow.definition.Transition"/>
<item id="341" type="com.j2fe.workflow.definition.Transition">
<name id="342">2</name>
<source idref="170"/>
<target id="343">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="344"/>
<directJoin>false</directJoin>
<name id="345">Missmatch=True</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="346">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="347" type="java.util.HashSet">
<item id="348" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="349">database</name>
<stringValue id="350">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="351" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="352">indexedParameters[0]</name>
<stringValue id="353">Issue</stringValue>
<type>VARIABLE</type>
</item>
<item id="354" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="355">querySQL</name>
<stringValue id="356">update ft_t_isst set stat_int_val_num = 1, data_src_id = NULL&#13;
where stat_def_id = 'MIZRECAL'&#13;
and start_tms &lt;= now() and (end_tms is null or end_tms &gt; now())&#13;
and instr_id = ? and (stat_int_val_num = 0 or stat_int_val_num is null)</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="357" type="java.util.HashSet">
<item idref="341" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="358" type="java.util.HashSet">
<item id="359" type="com.j2fe.workflow.definition.Transition">
<name id="360">goto-next</name>
<source idref="343"/>
<target idref="139"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="153"/>
</item>
</sources>
<targets id="361" type="java.util.HashSet">
<item idref="151" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="139"/>
</item>
<item idref="359" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="362" type="java.util.HashSet">
<item idref="137" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="115"/>
</item>
</sources>
<targets id="363" type="java.util.HashSet">
<item idref="335" type="com.j2fe.workflow.definition.Transition"/>
<item idref="113" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="87"/>
</item>
</sources>
<targets id="364" type="java.util.HashSet">
<item idref="85" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="61"/>
</item>
</sources>
<targets id="365" type="java.util.HashSet">
<item idref="59" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="30"/>
</item>
</sources>
<targets id="366" type="java.util.HashSet">
<item id="367" type="com.j2fe.workflow.definition.Transition">
<name id="368">1</name>
<source idref="30"/>
<target id="369">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="370"/>
<directJoin>false</directJoin>
<name id="371">Insert Derive Policy</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="372">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="373" type="java.util.HashSet">
<item id="374" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="375">database</name>
<stringValue id="376">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="377" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="378">indexedParameters[0]</name>
<stringValue id="379">code</stringValue>
<type>VARIABLE</type>
</item>
<item id="380" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="381">indexedParameters[1]</name>
<stringValue id="382">code</stringValue>
<type>VARIABLE</type>
</item>
<item id="383" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="384">indexedParameters[2]</name>
<stringValue id="385">rtngvalueoid</stringValue>
<type>VARIABLE</type>
</item>
<item id="386" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="387">indexedParameters[3]</name>
<stringValue id="388">DeriveSetOid</stringValue>
<type>VARIABLE</type>
</item>
<item id="389" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="390">indexedParameters[4]</name>
<stringValue id="391">dataSrc</stringValue>
<type>VARIABLE</type>
</item>
<item id="392" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="393">indexedParameters[5]</name>
<stringValue id="394">PortfolioOid</stringValue>
<type>VARIABLE</type>
</item>
<item id="395" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="396">querySQL</name>
<objectValue id="397" type="java.lang.String">insert into ft_t_isrt (ISS_RTNG_OID, INSTR_ID, START_TMS, LAST_CHG_USR_ID, LAST_CHG_TMS, RTNG_CDE, RTNG_SYMBOL_TXT, RTNG_VALUE_OID, RTNG_SET_OID, orig_data_prov_id, data_stat_typ, rtng_eff_tms, data_src_id)
select new_oid(), instr_id, sysdate(), 'CalculateDeriveRating', sysdate(), ?, ?, ?, ?, 'DERIVED', 'ACTIVE', date_trunc('day', sysdate())::timestamp, ? from ft_t_isgp
where prnt_iss_grp_oid = ? and prt_purp_typ = 'PRTFLIOC'
and start_tms &lt;= sysdate() and (end_tms is null or end_tms &gt; sysdate())
ON conflict (instr_id, rtng_set_oid, rtng_value_oid, COALESCE(rtng_debt_cl_typ, '=NULL='::character varying), COALESCE(rtng_curr_cde, '=NULL='::character varying), COALESCE(rtng_snrty_typ, '=NULL='::character varying), COALESCE(rtng_purp_typ, '=NULL='::character varying), COALESCE(rtng_curr_typ, '=NULL='::character varying), COALESCE(rtng_eff_tms, '9999-12-31 00:00:00'::timestamp without time zone), COALESCE(rtng_sec_instr_ind, '=NULL='::bpchar), COALESCE(rtng_id, '=NULL='::character varying), start_tms, COALESCE(rtng_calc_typ, '=NULL='::character varying), COALESCE(support_clsf_oid, '=NULL='::character varying))
do nothing;</objectValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="398" type="java.util.HashSet">
<item idref="367" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="399" type="java.util.HashSet">
<item id="400" type="com.j2fe.workflow.definition.Transition">
<name id="401">goto-next</name>
<source idref="369"/>
<target idref="3"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item idref="28" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="10"/>
</item>
</sources>
<targets id="402" type="java.util.HashSet">
<item idref="8" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="3"/>
</item>
<item idref="400" type="com.j2fe.workflow.definition.Transition"/>
<item idref="338" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="403" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="404">Mizuho/Ratings</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="405">user1</lastChangeUser>
<lastUpdate id="406">2026-01-21T11:33:58.000+0000</lastUpdate>
<name id="407">CalculateDeriveRating</name>
<nodes id="408" type="java.util.HashSet">
<item idref="87" type="com.j2fe.workflow.definition.Node"/>
<item idref="170" type="com.j2fe.workflow.definition.Node"/>
<item idref="199" type="com.j2fe.workflow.definition.Node"/>
<item idref="10" type="com.j2fe.workflow.definition.Node"/>
<item idref="270" type="com.j2fe.workflow.definition.Node"/>
<item idref="253" type="com.j2fe.workflow.definition.Node"/>
<item idref="236" type="com.j2fe.workflow.definition.Node"/>
<item idref="115" type="com.j2fe.workflow.definition.Node"/>
<item idref="61" type="com.j2fe.workflow.definition.Node"/>
<item idref="369" type="com.j2fe.workflow.definition.Node"/>
<item idref="317" type="com.j2fe.workflow.definition.Node"/>
<item idref="139" type="com.j2fe.workflow.definition.Node"/>
<item idref="299" type="com.j2fe.workflow.definition.Node"/>
<item idref="153" type="com.j2fe.workflow.definition.Node"/>
<item idref="343" type="com.j2fe.workflow.definition.Node"/>
<item idref="30" type="com.j2fe.workflow.definition.Node"/>
<item idref="287" type="com.j2fe.workflow.definition.Node"/>
<item idref="3" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>false</optimize>
<parameter id="409" type="java.util.HashMap">
<entry>
<key id="410" type="java.lang.String">Issue</key>
<value id="411" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="412">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="413" type="java.lang.String">Issuer</key>
<value id="414" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="415">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="416" type="java.lang.String">PortfolioOid</key>
<value id="417" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="418">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
</parameter>
<permissions id="419" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>false</purgeAtEnd>
<retries>0</retries>
<startNode idref="287"/>
<status>RELEASED</status>
<variables id="420" type="java.util.HashMap">
<entry>
<key id="421" type="java.lang.String">DeriveSetOid</key>
<value id="422" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="423">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="424" type="java.lang.String">RTNG000014</value>
</value>
</entry>
<entry>
<key id="425" type="java.lang.String">DerivedRatings</key>
<value id="426" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="427">java.lang.Object</className>
<clazz>java.lang.Object</clazz>
<description id="428"/>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="429" type="java.lang.String">Issue</key>
<value id="430" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="431">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="432" type="java.lang.String">Issuer</key>
<value id="433" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="434">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="435" type="java.lang.String">PortfolioOid</key>
<value id="436" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="437">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="438" type="java.lang.String">Ratings</key>
<value id="439" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="440">java.lang.Object</className>
<clazz>java.lang.Object</clazz>
<description id="441"/>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="442" type="java.lang.String">code</key>
<value id="443" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="444">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="445" type="java.lang.String">derivePolicy</key>
<value id="446" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="447">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="448" type="java.lang.String">rtngvalueoid</key>
<value id="449" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="450">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
</variables>
<version>53</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
