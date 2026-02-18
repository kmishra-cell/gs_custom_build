<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<goldensource-package version="10.0.0.02">
    <package-comment/>
    <businessobject displayString="18 - V-10" type="com.j2fe.workflow.definition.Workflow">
        <com.j2fe.workflow.definition.Workflow id="0">
            <alwaysPersist>false</alwaysPersist>
            <clustered>true</clustered>
            <comment id="1">V-10</comment>
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
                        <name id="8">2</name>
                        <source id="9">
                            <activation>INVOKE</activation>
                            <clusteredCall>false</clusteredCall>
                            <description idref="3"/>
                            <directJoin>false</directJoin>
                            <name id="10">Bean Shell Script (Xor Split)</name>
                            <nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
                            <nodeHandlerClass id="11">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
                            <parameters id="12" type="java.util.HashSet">
                                <item id="13" type="com.j2fe.workflow.definition.Parameter">
                                    <input>true</input>
                                    <name id="14">statements</name>
                                    <objectValue id="15" type="java.lang.String">boolean found = false;&#13;
String [][] match = new String[unrated.length][3];&#13;
int count = 0;&#13;
for(int i=0; i&lt;unrated.length; i++){&#13;
	for(int j=0; j&lt;rated.length; j++){&#13;
		if (&#13;
				((rated[j][1] != null &amp;&amp; rated[j][1].equalsIgnoreCase(unrated[i][1])) &#13;
						|| (rated[j][1] == null &amp;&amp; rated[j][1] == unrated[i][1]))&#13;
				&amp;&amp; ((rated[j][2] != null &amp;&amp; rated[j][2].equalsIgnoreCase(unrated[i][2])) &#13;
						|| (rated[j][2] == null &amp;&amp; rated[j][2] == unrated[i][2]))&#13;
				&amp;&amp; ((rated[j][3] != null &amp;&amp; rated[j][3].equalsIgnoreCase(unrated[i][3])) &#13;
						|| (rated[j][3] == null &amp;&amp; rated[j][3] == unrated[i][3]))&#13;
				&amp;&amp; ((rated[j][4] != null &amp;&amp; rated[j][4].equalsIgnoreCase(unrated[i][4])) &#13;
						|| (rated[j][4] == null &amp;&amp; rated[j][4] == unrated[i][4]))&#13;
				&amp;&amp; ((rated[j][5] != null &amp;&amp; rated[j][5].equalsIgnoreCase(unrated[i][5])) &#13;
						|| (rated[j][5] == null &amp;&amp; rated[j][5] == unrated[i][5]))&#13;
				&amp;&amp; ((rated[j][5] != null &amp;&amp; rated[j][5].equalsIgnoreCase(unrated[i][5])) &#13;
						|| (rated[j][6] == null &amp;&amp; rated[j][6] == unrated[i][6]))&#13;
				&amp;&amp; ((rated[j][7] != null &amp;&amp; rated[j][7].equalsIgnoreCase(unrated[i][7])) &#13;
						|| (rated[j][7] == null &amp;&amp; rated[j][7] == unrated[i][7]))&#13;
		){&#13;
			derivePolicy = "SUBORDINATED";&#13;
			match[count][0] = unrated[i][0];&#13;
			match[count][1] = rated[j][0];&#13;
			match[count][2] = unrated[i][8];&#13;
			found = true;&#13;
			break;&#13;
		}&#13;
	}&#13;
}&#13;
&#13;
if(found)&#13;
	return 1;&#13;
else&#13;
	return 2;</objectValue>
                                    <type>CONSTANT</type>
                                </item>
                                <item id="16" type="com.j2fe.workflow.definition.Parameter">
                                    <input>false</input>
                                    <name id="17">variables["match"]</name>
                                    <stringValue id="18">match</stringValue>
                                    <type>VARIABLE</type>
                                </item>
                                <item id="19" type="com.j2fe.workflow.definition.Parameter">
                                    <input>true</input>
                                    <name id="20">variables["rated"]</name>
                                    <stringValue id="21">RatedPortfolio</stringValue>
                                    <type>VARIABLE</type>
                                </item>
                                <item id="22" type="com.j2fe.workflow.definition.Parameter">
                                    <input>true</input>
                                    <name id="23">variables["unrated"]</name>
                                    <stringValue id="24">UnRatedPortfolio</stringValue>
                                    <type>VARIABLE</type>
                                </item>
                            </parameters>
                            <sources id="25" type="java.util.HashSet">
                                <item id="26" type="com.j2fe.workflow.definition.Transition">
                                    <name id="27">rows-found</name>
                                    <source id="28">
                                        <activation>INVOKE</activation>
                                        <clusteredCall>false</clusteredCall>
                                        <description idref="3"/>
                                        <directJoin>false</directJoin>
                                        <name id="29">Select Non Subordinated Portfolio</name>
                                        <nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
                                        <nodeHandlerClass id="30">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
                                        <parameters id="31" type="java.util.HashSet">
                                            <item id="32" type="com.j2fe.workflow.definition.Parameter">
                                                <input>true</input>
                                                <name id="33">database</name>
                                                <stringValue id="34">jdbc/GSDM-1</stringValue>
                                                <type>REFERENCE</type>
                                            </item>
                                            <item id="35" type="com.j2fe.workflow.definition.Parameter">
                                                <input>true</input>
                                                <name id="36">indexedParameters[0]</name>
                                                <stringValue id="37">Issuer</stringValue>
                                                <type>VARIABLE</type>
                                            </item>
                                            <item id="38" type="com.j2fe.workflow.definition.Parameter">
                                                <input>false</input>
                                                <name id="39">indexedResult</name>
                                                <stringValue id="40">RatedPortfolio</stringValue>
                                                <type>VARIABLE</type>
                                            </item>
                                            <item id="41" type="com.j2fe.workflow.definition.Parameter">
                                                <input>true</input>
                                                <name id="42">querySQL</name>
                                                <objectValue id="43" type="java.lang.String">SELECT isgp.prnt_iss_grp_oid, (SELECT INST_MNEM FROM FT_T_FINS FINS WHERE EXISTS ( SELECT 1 FROM FT_T_FINR WHERE FINSRL_TYP = 'GUARNTOR'  AND INST_MNEM = FINS.INST_MNEM  AND START_TMS &lt;= current_timestamp  AND (END_TMS IS NULL OR END_TMS &gt; current_timestamp) ) AND EXISTS ( SELECT 1 FROM FT_T_FRIP WHERE INST_MNEM = FINS.INST_MNEM  AND INSTR_ID = ISSU.INSTR_ID  AND START_TMS &lt;= current_timestamp  AND (END_TMS IS NULL OR END_TMS &gt; current_timestamp) ) AND START_TMS &lt;= current_timestamp AND (END_TMS IS NULL OR END_TMS &gt; current_timestamp) LIMIT 1) AS GUARANTOR, (SELECT RISS.INSTR_ID FROM FT_T_RISS RISS JOIN FT_T_RIDF RIDF ON RIDF.RLD_ISS_FEAT_ID = RISS.RLD_ISS_FEAT_ID WHERE RISS.ISS_PART_RL_TYP = 'UNDLYING'   AND RIDF.REL_TYP = 'CreditLinked'   AND RIDF.INSTR_ID = ISSU.INSTR_ID   AND RIDF.START_TMS &lt;= current_timestamp   AND (RIDF.END_TMS IS NULL OR RIDF.END_TMS &gt; current_timestamp)   AND RISS.START_TMS &lt;= current_timestamp   AND (RISS.END_TMS IS NULL OR RISS.END_TMS &gt; current_timestamp) LIMIT 1) AS CREDITLINKED, (SELECT COLL_TYP FROM FT_T_ISLL WHERE INSTR_ID = ISSU.INSTR_ID   AND COLL_TYP = 'Secured'   AND START_TMS &lt;= current_timestamp   AND (END_TMS IS NULL OR END_TMS &gt; current_timestamp) LIMIT 1) AS SECURED, (SELECT CL_VALUE FROM FT_T_ISCL WHERE INSTR_ID = ISSU.INSTR_ID   AND INDUS_CL_SET_ID = 'MIZUNIQE'   AND START_TMS &lt;= current_timestamp   AND (END_TMS IS NULL OR END_TMS &gt; current_timestamp) LIMIT 1) AS UNIQU, (SELECT ISGP.PRNT_ISS_GRP_OID FROM FT_T_ISGP ISGP JOIN FT_T_ISGR ISGR ON ISGP.PRNT_ISS_GRP_OID = ISGR.ISS_GRP_OID WHERE ISGP.INSTR_ID = ISSU.INSTR_ID   AND ISGR.GRP_NME = 'FCY'   AND ISGP.START_TMS &lt;= current_timestamp   AND (ISGP.END_TMS IS NULL OR ISGP.END_TMS &gt; current_timestamp)   AND ISGR.START_TMS &lt;= current_timestamp   AND (ISGR.END_TMS IS NULL OR ISGR.END_TMS &gt; current_timestamp) LIMIT 1) AS FCY, issu.series_typ AS iseries, (SELECT coll_grp_desc FROM FT_T_ISLL WHERE INSTR_ID = ISSU.INSTR_ID   AND COLL_TYP = 'Mortgage Backed'   AND coll_grp_desc IS NOT NULL   AND START_TMS &lt;= current_timestamp   AND (END_TMS IS NULL OR END_TMS &gt; current_timestamp) LIMIT 1) AS igroup FROM ft_t_issu issu JOIN ft_t_isgp isgp   ON issu.instr_id = isgp.instr_id WHERE issu.instr_issr_id = ?   AND issu.iss_typ = 'PORT'   AND isgp.prt_purp_typ = 'PRTFLIOP'   AND issu.start_tms &lt;= current_timestamp   AND (issu.end_tms IS NULL OR issu.end_tms &gt; current_timestamp)   AND isgp.start_tms &lt;= current_timestamp   AND (isgp.end_tms IS NULL OR isgp.end_tms &gt; current_timestamp)   AND EXISTS (  SELECT 1  FROM ft_t_isrt isrt  JOIN ft_t_isgp isgp1 ON isgp1.instr_id = isrt.instr_id AND isgp1.prnt_iss_grp_oid = isgp.prnt_iss_grp_oid AND isgp1.prt_purp_typ = 'PRTFLIOC'  WHERE isrt.rtng_eff_tms &lt;= current_timestamp AND (isrt.sys_eff_end_tms IS NULL OR isrt.sys_eff_end_tms &gt; current_timestamp) AND isgp1.start_tms &lt;= current_timestamp AND (isgp1.end_tms IS NULL OR isgp1.end_tms &gt; current_timestamp) AND isrt.orig_data_prov_id = 'DERIVED'   )   AND NOT EXISTS (  SELECT COLL_TYP  FROM FT_T_ISLL  WHERE INSTR_ID = ISSU.INSTR_ID AND COLL_TYP = 'Subordinated' AND START_TMS &lt;= current_timestamp AND (END_TMS IS NULL OR END_TMS &gt; current_timestamp))</objectValue>
                                                <type>CONSTANT</type>
                                            </item>
                                        </parameters>
                                        <sources id="44" type="java.util.HashSet">
                                            <item id="45" type="com.j2fe.workflow.definition.Transition">
                                                <name id="46">rows-found</name>
                                                <source id="47">
                                                    <activation>INVOKE</activation>
                                                    <clusteredCall>false</clusteredCall>
                                                    <description idref="3"/>
                                                    <directJoin>false</directJoin>
                                                    <name id="48">Select Subordinated Portfoli</name>
                                                    <nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
                                                    <nodeHandlerClass id="49">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
                                                    <parameters id="50" type="java.util.HashSet">
                                                        <item id="51" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="52">database</name>
                                                            <stringValue id="53">jdbc/GSDM-1</stringValue>
                                                            <type>REFERENCE</type>
                                                        </item>
                                                        <item id="54" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="55">indexedParameters[0]</name>
                                                            <stringValue id="56">Issuer</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                        <item id="57" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>false</input>
                                                            <name id="58">indexedResult</name>
                                                            <stringValue id="59">UnRatedPortfolio</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                        <item id="60" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="61">querySQL</name>
                                                            <objectValue id="62" type="java.lang.String">select isgp.prnt_iss_grp_oid,&#13;
(SELECT INST_MNEM FROM FT_T_FINS FINS&#13;
WHERE EXISTS(SELECT 1 FROM FT_T_FINR WHERE FINSRL_TYP = 'GUARNTOR' AND INST_MNEM = FINS.INST_MNEM AND START_TMS &lt;= current_timestamp AND (END_TMS IS NULL OR END_TMS &gt; current_timestamp))&#13;
AND EXISTS(SELECT 1 FROM FT_T_FRIP WHERE INST_MNEM = FINS.INST_MNEM AND INSTR_ID =  ISSU.INSTR_ID AND START_TMS &lt;= current_timestamp AND (END_TMS IS NULL OR END_TMS &gt; current_timestamp))&#13;
AND START_TMS &lt;= current_timestamp AND (END_TMS IS NULL OR END_TMS &gt; current_timestamp)) AS GUARANTOR,&#13;
(SELECT RISS.INSTR_ID FROM FT_T_RISS RISS, FT_T_RIDF RIDF WHERE RISS.ISS_PART_RL_TYP = 'UNDLYING' AND RIDF.REL_TYP = 'CreditLinked'&#13;
AND RIDF.RLD_ISS_FEAT_ID = RISS.RLD_ISS_FEAT_ID AND RISS.INSTR_ID IS NOT NULL AND RIDF.INSTR_ID = ISSU.INSTR_ID&#13;
AND RIDF.START_TMS &lt;= current_timestamp AND (RIDF.END_TMS IS NULL OR RIDF.END_TMS &gt; current_timestamp)&#13;
AND RISS.START_TMS &lt;= current_timestamp AND (RISS.END_TMS IS NULL OR RISS.END_TMS &gt; current_timestamp)) AS CREDITLINKED,&#13;
(SELECT COLL_TYP FROM FT_T_ISLL WHERE INSTR_ID = ISSU.INSTR_ID AND COLL_TYP = 'Secured' &#13;
AND START_TMS &lt;= current_timestamp AND (END_TMS IS NULL OR END_TMS &gt; current_timestamp)) AS SECURED,&#13;
(SELECT CL_VALUE FROM FT_T_ISCL WHERE INSTR_ID = ISSU.INSTR_ID AND INDUS_CL_SET_ID= 'MIZUNIQE' &#13;
AND START_TMS &lt;= current_timestamp AND (END_TMS IS NULL OR END_TMS &gt; current_timestamp)) AS UNIQU,&#13;
(SELECT ISGP.PRNT_ISS_GRP_OID FROM FT_T_ISGP ISGP, FT_T_ISGR ISGR&#13;
where isgp.prnt_iss_grp_oid = isgr.iss_grp_oid and isgp.instr_id = ISSU.INSTR_ID and GRP_nme = 'FCY'&#13;
AND ISGP.START_TMS &lt;= current_timestamp AND (ISGP.END_TMS IS NULL OR ISGP.END_TMS &gt; current_timestamp)&#13;
AND ISGR.START_TMS &lt;= current_timestamp AND (ISGR.END_TMS IS NULL OR ISGR.END_TMS &gt; current_timestamp)) AS FCY,&#13;
issu.series_typ iseries,&#13;
(SELECT coll_grp_desc FROM FT_T_ISLL WHERE INSTR_ID = ISSU.INSTR_ID AND COLL_TYP = 'Mortgage Backed' and coll_grp_desc is not null&#13;
AND START_TMS &lt;= current_timestamp AND (END_TMS IS NULL OR END_TMS &gt; current_timestamp)) AS igroup,&#13;
issu.instr_id&#13;
from ft_t_issu issu, ft_t_isgp isgp where issu.instr_issr_id = ? and issu.iss_typ = 'PORT'&#13;
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
and exists (SELECT COLL_TYP FROM FT_T_ISLL WHERE INSTR_ID = ISSU.INSTR_ID AND COLL_TYP = 'Subordinated' &#13;
AND START_TMS &lt;= current_timestamp AND (END_TMS IS NULL OR END_TMS &gt; current_timestamp))&#13;
and exists (SELECT 1 FROM FT_T_ISST ISST WHERE ISST.STAT_DEF_ID = 'MIZRECAL' AND ISST.INSTR_ID = issu.instr_id and (stat_char_val_txt = 'Y') and (stat_int_val_num = 0 or stat_int_val_num is null)&#13;
AND ISST.START_TMS &lt;= current_timestamp AND (ISST.END_TMS IS NULL OR ISST.END_TMS &gt; current_timestamp))</objectValue>
                                                            <type>CONSTANT</type>
                                                        </item>
                                                    </parameters>
                                                    <sources id="63" type="java.util.HashSet">
                                                        <item id="64" type="com.j2fe.workflow.definition.Transition">
                                                            <name id="65">goto-next</name>
                                                            <source id="66">
                                                                <activation>ASYNCHRONOUS</activation>
                                                                <clusteredCall>false</clusteredCall>
                                                                <description idref="3"/>
                                                                <directJoin>false</directJoin>
                                                                <name id="67">Start</name>
                                                                <nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
                                                                <nodeHandlerClass id="68">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
                                                                <sources id="69" type="java.util.HashSet"/>
                                                                <targets id="70" type="java.util.HashSet">
                                                                    <item idref="64" type="com.j2fe.workflow.definition.Transition"/>
                                                                </targets>
                                                                <type>START</type>
                                                            </source>
                                                            <target idref="47"/>
                                                        </item>
                                                    </sources>
                                                    <targets id="71" type="java.util.HashSet">
                                                        <item id="72" type="com.j2fe.workflow.definition.Transition">
                                                            <name id="73">nothing-found</name>
                                                            <source idref="47"/>
                                                            <target idref="2"/>
                                                        </item>
                                                        <item idref="45" type="com.j2fe.workflow.definition.Transition"/>
                                                    </targets>
                                                    <type>XORSPLIT</type>
                                                </source>
                                                <target idref="28"/>
                                            </item>
                                        </sources>
                                        <targets id="74" type="java.util.HashSet">
                                            <item id="75" type="com.j2fe.workflow.definition.Transition">
                                                <name id="76">nothing-found</name>
                                                <source idref="28"/>
                                                <target idref="2"/>
                                            </item>
                                            <item idref="26" type="com.j2fe.workflow.definition.Transition"/>
                                        </targets>
                                        <type>XORSPLIT</type>
                                    </source>
                                    <target idref="9"/>
                                </item>
                            </sources>
                            <targets id="77" type="java.util.HashSet">
                                <item id="78" type="com.j2fe.workflow.definition.Transition">
                                    <name id="79">1</name>
                                    <source idref="9"/>
                                    <target id="80">
                                        <activation>INVOKE</activation>
                                        <clusteredCall>false</clusteredCall>
                                        <description id="81">Automatically generated</description>
                                        <directJoin>false</directJoin>
                                        <name id="82">Merge</name>
                                        <nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
                                        <nodeHandlerClass id="83">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
                                        <sources id="84" type="java.util.HashSet">
                                            <item id="85" type="com.j2fe.workflow.definition.Transition">
                                                <name id="86">1</name>
                                                <source id="87">
                                                    <activation>INVOKE</activation>
                                                    <clusteredCall>false</clusteredCall>
                                                    <description idref="3"/>
                                                    <directJoin>false</directJoin>
                                                    <name id="88">Bean Shell Script (Xor Split)</name>
                                                    <nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
                                                    <nodeHandlerClass id="89">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
                                                    <parameters id="90" type="java.util.HashSet">
                                                        <item id="91" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="92">statements</name>
                                                            <stringValue id="93">String unRatedOid = "";&#13;
String ratedOid = "";&#13;
String unRatedIssue = "";&#13;
&#13;
if(arrOne[0] == null)&#13;
	return 1;&#13;
&#13;
unRatedOid = arrOne[0];&#13;
ratedOid = arrOne[1];&#13;
unRatedIssue = arrOne[2];&#13;
&#13;
return 2;</stringValue>
                                                            <type>CONSTANT</type>
                                                        </item>
                                                        <item id="94" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="95">variables["arrOne"]</name>
                                                            <stringValue id="96">OneMatch</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                        <item id="97" type="com.j2fe.workflow.definition.Parameter">
                                                            <UITypeHint id="98">["ratedOid"]@java/lang/String@</UITypeHint>
                                                            <input>false</input>
                                                            <name id="99">variables["ratedOid"]</name>
                                                            <stringValue id="100">ratedOid</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                        <item id="101" type="com.j2fe.workflow.definition.Parameter">
                                                            <UITypeHint id="102">["unRatedIssue"]@java/lang/String@</UITypeHint>
                                                            <input>false</input>
                                                            <name id="103">variables["unRatedIssue"]</name>
                                                            <stringValue id="104">unRatedIssue</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                        <item id="105" type="com.j2fe.workflow.definition.Parameter">
                                                            <UITypeHint id="106">["unRatedOid"]@java/lang/String@</UITypeHint>
                                                            <input>false</input>
                                                            <name id="107">variables["unRatedOid"]</name>
                                                            <stringValue id="108">unRatedOid</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                    </parameters>
                                                    <sources id="109" type="java.util.HashSet">
                                                        <item id="110" type="com.j2fe.workflow.definition.Transition">
                                                            <name id="111">loop</name>
                                                            <source id="112">
                                                                <activation>INVOKE</activation>
                                                                <clusteredCall>false</clusteredCall>
                                                                <description idref="3"/>
                                                                <directJoin>false</directJoin>
                                                                <name id="113">For Loop</name>
                                                                <nodeHandler>com.j2fe.workflow.handler.impl.ForEach</nodeHandler>
                                                                <nodeHandlerClass id="114">com.j2fe.workflow.handler.impl.ForEach</nodeHandlerClass>
                                                                <parameters id="115" type="java.util.HashSet">
                                                                    <item id="116" type="com.j2fe.workflow.definition.Parameter">
                                                                        <input>true</input>
                                                                        <name id="117">counter</name>
                                                                        <stringValue id="118">LoopCounter</stringValue>
                                                                        <type>VARIABLE</type>
                                                                    </item>
                                                                    <item id="119" type="com.j2fe.workflow.definition.Parameter">
                                                                        <input>false</input>
                                                                        <name id="120">counter</name>
                                                                        <stringValue id="121">LoopCounter</stringValue>
                                                                        <type>VARIABLE</type>
                                                                    </item>
                                                                    <item id="122" type="com.j2fe.workflow.definition.Parameter">
                                                                        <input>true</input>
                                                                        <name id="123">input</name>
                                                                        <stringValue id="124">match</stringValue>
                                                                        <type>VARIABLE</type>
                                                                    </item>
                                                                    <item id="125" type="com.j2fe.workflow.definition.Parameter">
                                                                        <input>false</input>
                                                                        <name id="126">output</name>
                                                                        <stringValue id="127">OneMatch</stringValue>
                                                                        <type>VARIABLE</type>
                                                                    </item>
                                                                </parameters>
                                                                <sources id="128" type="java.util.HashSet">
                                                                    <item id="129" type="com.j2fe.workflow.definition.Transition">
                                                                        <name id="130">ToSplit</name>
                                                                        <source idref="80"/>
                                                                        <target idref="112"/>
                                                                    </item>
                                                                </sources>
                                                                <targets id="131" type="java.util.HashSet">
                                                                    <item id="132" type="com.j2fe.workflow.definition.Transition">
                                                                        <name id="133">end-loop</name>
                                                                        <source idref="112"/>
                                                                        <target idref="2"/>
                                                                    </item>
                                                                    <item idref="110" type="com.j2fe.workflow.definition.Transition"/>
                                                                </targets>
                                                                <type>XORSPLIT</type>
                                                            </source>
                                                            <target idref="87"/>
                                                        </item>
                                                    </sources>
                                                    <targets id="134" type="java.util.HashSet">
                                                        <item idref="85" type="com.j2fe.workflow.definition.Transition"/>
                                                        <item id="135" type="com.j2fe.workflow.definition.Transition">
                                                            <name id="136">2</name>
                                                            <source idref="87"/>
                                                            <target id="137">
                                                                <activation>INVOKE</activation>
                                                                <clusteredCall>false</clusteredCall>
                                                                <description idref="3"/>
                                                                <directJoin>false</directJoin>
                                                                <name id="138">Delete Existing Portfolio Rating</name>
                                                                <nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
                                                                <nodeHandlerClass id="139">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
                                                                <parameters id="140" type="java.util.HashSet">
                                                                    <item id="141" type="com.j2fe.workflow.definition.Parameter">
                                                                        <input>true</input>
                                                                        <name id="142">database</name>
                                                                        <stringValue id="143">jdbc/GSDM-1</stringValue>
                                                                        <type>REFERENCE</type>
                                                                    </item>
                                                                    <item id="144" type="com.j2fe.workflow.definition.Parameter">
                                                                        <input>true</input>
                                                                        <name id="145">indexedParameters[0]</name>
                                                                        <stringValue id="146">unRatedOid</stringValue>
                                                                        <type>VARIABLE</type>
                                                                    </item>
                                                                    <item id="147" type="com.j2fe.workflow.definition.Parameter">
                                                                        <input>true</input>
                                                                        <name id="148">querySQL</name>
                                                                        <stringValue id="149">delete from ft_t_isrt where instr_id in (&#13;
select instr_id from ft_t_isgp where prnt_iss_grp_oid =  ? &#13;
and prt_purp_typ = 'PRTFLIOC' and start_tms &lt;= current_timestamp and (end_tms is null or end_tms &gt; current_timestamp))&#13;
--RDD-268 start&#13;
--and start_tms &lt;= current_timestamp and (end_tms is null or end_tms &gt; current_timestamp)&#13;
and rtng_eff_tms &lt;= current_timestamp and (sys_eff_end_tms is null or sys_eff_end_tms &gt; current_timestamp)&#13;
--RDD-268 end&#13;
and orig_data_prov_id = 'DERIVED'</stringValue>
                                                                        <type>CONSTANT</type>
                                                                    </item>
                                                                </parameters>
                                                                <sources id="150" type="java.util.HashSet">
                                                                    <item idref="135" type="com.j2fe.workflow.definition.Transition"/>
                                                                </sources>
                                                                <targets id="151" type="java.util.HashSet">
                                                                    <item id="152" type="com.j2fe.workflow.definition.Transition">
                                                                        <name id="153">goto-next</name>
                                                                        <source idref="137"/>
                                                                        <target id="154">
                                                                            <activation>INVOKE</activation>
                                                                            <clusteredCall>false</clusteredCall>
                                                                            <description idref="3"/>
                                                                            <directJoin>false</directJoin>
                                                                            <name id="155">Intert Notch Rating</name>
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
                                                                                    <stringValue id="163">ratedOid</stringValue>
                                                                                    <type>VARIABLE</type>
                                                                                </item>
                                                                                <item id="164" type="com.j2fe.workflow.definition.Parameter">
                                                                                    <input>true</input>
                                                                                    <name id="165">indexedParameters[1]</name>
                                                                                    <stringValue id="166">unRatedOid</stringValue>
                                                                                    <type>VARIABLE</type>
                                                                                </item>
                                                                                <item id="167" type="com.j2fe.workflow.definition.Parameter">
                                                                                    <input>true</input>
                                                                                    <name id="168">querySQL</name>
                                                                                    <objectValue id="169" type="java.lang.String">insert into ft_t_isrt (ISS_RTNG_OID, INSTR_ID, START_TMS, LAST_CHG_USR_ID, LAST_CHG_TMS, RTNG_CDE, RTNG_SYMBOL_TXT, RTNG_VALUE_OID, RTNG_SET_OID, orig_data_prov_id, data_stat_typ, rtng_eff_tms, data_src_id)&#13;
--RDD-268 end&#13;
select  new_oid() , instr_id, current_timestamp, 'SubordinatedPortfolioCalc', current_timestamp, rtng_cde, rtng_cde, rtng_value_oid, rtng_set_oid, 'DERIVED', 'ACTIVE' ,(current_timestamp), data_src_id&#13;
from (select  ai.instr_id, rtvl.rtng_cde, rtvl.rtng_value_oid, rtvl.rtng_set_oid, orig.data_src_id, rank() over( partition by ai.instr_id, rtvl.rtng_set_oid order by rtvl.rank_num desc) rank&#13;
from ft_t_rtvl rtvl,&#13;
(select distinct isrt.rtng_set_oid, isrt.rtng_value_oid, isrt.rtng_cde, rtvl.rank_num, isrt.data_src_id from ft_t_isrt isrt, ft_t_rtvl rtvl&#13;
where isrt.rtng_cde = rtvl.rtng_cde&#13;
and isrt.rtng_set_oid = rtvl.rtng_set_oid&#13;
and isrt.rtng_value_oid = rtvl.rtng_value_oid&#13;
and exists (&#13;
select 1 from ft_t_isgp isgp where isgp.instr_id = isrt.instr_id&#13;
and isgp.start_tms &lt;= current_timestamp and (isgp.end_tms is null or end_tms &gt; current_timestamp)&#13;
and prnt_iss_grp_oid = ?&#13;
and prt_purp_typ = 'PRTFLIOC')&#13;
and orig_data_prov_id = 'DERIVED') orig,&#13;
(select instr_id from ft_t_isgp isgp where isgp.prnt_iss_grp_oid = ? and isgp.prt_purp_typ = 'PRTFLIOC'&#13;
and isgp.start_tms &lt;= current_timestamp and (isgp.end_tms is null or isgp.end_tms &gt; current_timestamp)) ai&#13;
where rtvl.rtng_set_oid = orig.rtng_set_oid&#13;
and orig.rtng_set_oid not in ('RTNG000008','RTNG000007')&#13;
and (rtvl.rank_num =(&#13;
      select aa.rank_num from (&#13;
      select rtvl.rtng_cde, rtvl.rank_num, rtng_set_oid,&#13;
      rank() over (partition by rtng_set_oid order by rank_num ) &#13;
      rank  from ft_t_rtvl rtvl)aa,&#13;
      (&#13;
      select rtvl.rtng_cde, rtvl.rank_num, rtng_set_oid,&#13;
      rank() over (partition by rtng_set_oid order by rank_num ) &#13;
      rank  from ft_t_rtvl rtvl)bb where (aa.rank) = (bb.rank+1)&#13;
      and bb.rtng_cde = orig.rtng_cde&#13;
      and aa.rtng_set_oid = bb.rtng_set_oid and bb.rtng_set_oid = orig.rtng_set_oid)&#13;
or rtvl.rank_num =(&#13;
      select (rtvl1.rank_num) &#13;
      from ft_t_rtvl rtvl1 &#13;
      where rtvl1.rtng_set_oid = orig.rtng_set_oid and rtvl1.rtng_cde = orig.rtng_cde)))dd&#13;
where rank=1&#13;
&#13;
</objectValue>
                                                                                    <type>CONSTANT</type>
                                                                                </item>
                                                                            </parameters>
                                                                            <sources id="170" type="java.util.HashSet">
                                                                                <item idref="152" type="com.j2fe.workflow.definition.Transition"/>
                                                                            </sources>
                                                                            <targets id="171" type="java.util.HashSet">
                                                                                <item id="172" type="com.j2fe.workflow.definition.Transition">
                                                                                    <name id="173">goto-next</name>
                                                                                    <source idref="154"/>
                                                                                    <target id="174">
                                                                                        <activation>INVOKE</activation>
                                                                                        <clusteredCall>false</clusteredCall>
                                                                                        <description idref="3"/>
                                                                                        <directJoin>false</directJoin>
                                                                                        <name id="175">Insert Derivation Rule</name>
                                                                                        <nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
                                                                                        <nodeHandlerClass id="176">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
                                                                                        <parameters id="177" type="java.util.HashSet">
                                                                                            <item id="178" type="com.j2fe.workflow.definition.Parameter">
                                                                                                <input>true</input>
                                                                                                <name id="179">database</name>
                                                                                                <stringValue id="180">jdbc/GSDM-1</stringValue>
                                                                                                <type>REFERENCE</type>
                                                                                            </item>
                                                                                            <item id="181" type="com.j2fe.workflow.definition.Parameter">
                                                                                                <input>true</input>
                                                                                                <name id="182">indexedParameters[0]</name>
                                                                                                <stringValue id="183">unRatedIssue</stringValue>
                                                                                                <type>VARIABLE</type>
                                                                                            </item>
                                                                                            <item id="184" type="com.j2fe.workflow.definition.Parameter">
                                                                                                <input>true</input>
                                                                                                <name id="185">indexedParameters[1]</name>
                                                                                                <stringValue id="186">unRatedIssue</stringValue>
                                                                                                <type>VARIABLE</type>
                                                                                            </item>
                                                                                            <item id="187" type="com.j2fe.workflow.definition.Parameter">
                                                                                                <input>true</input>
                                                                                                <name id="188">querySQL</name>
                                                                                                <stringValue id="189">WITH upsert AS ( UPDATE FT_T_ISST ISST SET stat_char_val_txt = 'SUBORDINATED', LAST_CHG_USR_ID = 'SubordinatedPortfolioCalc', LAST_CHG_TMS = current_timestamp WHERE ISST.INSTR_ID = (SELECT INSTR_ID FROM FT_T_ISSU ISSU WHERE INSTR_ID = ?) AND ISST.STAT_DEF_ID = 'MIZDRVRL' AND ISST.START_TMS &lt; current_timestamp AND (ISST.END_TMS IS NULL OR ISST.END_TMS &gt; current_timestamp) RETURNING ISST.INSTR_ID ) INSERT INTO FT_T_ISST (STAT_ID, STAT_DEF_ID, INSTR_ID, START_TMS, LAST_CHG_TMS, LAST_CHG_USR_ID, STAT_CHAR_VAL_TXT) SELECT new_oid(), 'MIZDRVRL', ?, current_timestamp, current_timestamp, 'SubordinatedPortfolioCalc', 'SUBORDINATED' WHERE NOT EXISTS (SELECT 1 FROM upsert)</stringValue>
                                                                                                <type>CONSTANT</type>
                                                                                            </item>
                                                                                        </parameters>
                                                                                        <sources id="190" type="java.util.HashSet">
                                                                                            <item idref="172" type="com.j2fe.workflow.definition.Transition"/>
                                                                                        </sources>
                                                                                        <targets id="191" type="java.util.HashSet">
                                                                                            <item id="192" type="com.j2fe.workflow.definition.Transition">
                                                                                                <name id="193">goto-next</name>
                                                                                                <source idref="174"/>
                                                                                                <target idref="80"/>
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
                                                    <type>XORSPLIT</type>
                                                </source>
                                                <target idref="80"/>
                                            </item>
                                            <item idref="78" type="com.j2fe.workflow.definition.Transition"/>
                                            <item idref="192" type="com.j2fe.workflow.definition.Transition"/>
                                        </sources>
                                        <targets id="194" type="java.util.HashSet">
                                            <item idref="129" type="com.j2fe.workflow.definition.Transition"/>
                                        </targets>
                                        <type>ACTIVITY</type>
                                    </target>
                                </item>
                                <item idref="7" type="com.j2fe.workflow.definition.Transition"/>
                            </targets>
                            <type>XORSPLIT</type>
                        </source>
                        <target idref="2"/>
                    </item>
                    <item idref="132" type="com.j2fe.workflow.definition.Transition"/>
                    <item idref="75" type="com.j2fe.workflow.definition.Transition"/>
                    <item idref="72" type="com.j2fe.workflow.definition.Transition"/>
                </sources>
                <targets id="195" type="java.util.HashSet"/>
                <type>END</type>
            </endNode>
            <forcePurgeAtEnd>false</forcePurgeAtEnd>
            <group id="196">Mizuho/Ratings</group>
            <haltOnError>false</haltOnError>
            <lastChangeUser id="197">user1</lastChangeUser>
            <lastUpdate id="198">2025-07-08T11:50:22.000+0000</lastUpdate>
            <name id="199">SubordinatedPortfolioCalc</name>
            <nodes id="200" type="java.util.HashSet">
                <item idref="87" type="com.j2fe.workflow.definition.Node"/>
                <item idref="9" type="com.j2fe.workflow.definition.Node"/>
                <item idref="137" type="com.j2fe.workflow.definition.Node"/>
                <item idref="112" type="com.j2fe.workflow.definition.Node"/>
                <item idref="174" type="com.j2fe.workflow.definition.Node"/>
                <item idref="154" type="com.j2fe.workflow.definition.Node"/>
                <item idref="80" type="com.j2fe.workflow.definition.Node"/>
                <item idref="28" type="com.j2fe.workflow.definition.Node"/>
                <item idref="47" type="com.j2fe.workflow.definition.Node"/>
                <item idref="66" type="com.j2fe.workflow.definition.Node"/>
                <item idref="2" type="com.j2fe.workflow.definition.Node"/>
            </nodes>
            <optimize>true</optimize>
            <parameter id="201" type="java.util.HashMap">
                <entry>
                    <key id="202" type="java.lang.String">Issuer</key>
                    <value id="203" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="204">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <input>true</input>
                        <output>false</output>
                        <required>false</required>
                    </value>
                </entry>
            </parameter>
            <permissions id="205" type="java.util.HashSet"/>
            <priority>50</priority>
            <purgeAtEnd>false</purgeAtEnd>
            <retries>0</retries>
            <startNode idref="66"/>
            <status>RELEASED</status>
            <variables id="206" type="java.util.HashMap">
                <entry>
                    <key id="207" type="java.lang.String">Issuer</key>
                    <value id="208" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="209">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <persistent>false</persistent>
                    </value>
                </entry>
                <entry>
                    <key id="210" type="java.lang.String">LoopCounter</key>
                    <value id="211" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="212">java.lang.Integer</className>
                        <clazz>java.lang.Integer</clazz>
                        <persistent>false</persistent>
                        <value id="213" type="java.lang.Integer">0</value>
                    </value>
                </entry>
            </variables>
            <version>18</version>
        </com.j2fe.workflow.definition.Workflow>
    </businessobject>
</goldensource-package>
