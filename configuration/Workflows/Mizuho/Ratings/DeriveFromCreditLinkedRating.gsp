<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<goldensource-package version="10.0.0.02">
    <package-comment/>
    <businessobject displayString="6 - V-10-QueriesFixed" type="com.j2fe.workflow.definition.Workflow">
        <com.j2fe.workflow.definition.Workflow id="0">
            <alwaysPersist>false</alwaysPersist>
            <clustered>true</clustered>
            <comment id="1">V-10-QueriesFixed</comment>
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
                            <description idref="3"/>
                            <directJoin>true</directJoin>
                            <name id="10">Synchronize</name>
                            <nodeHandler>com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandler>
                            <nodeHandlerClass id="11">com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandlerClass>
                            <sources id="12" type="java.util.HashSet">
                                <item id="13" type="com.j2fe.workflow.definition.Transition">
                                    <name id="14">0</name>
                                    <source id="15">
                                        <activation>INVOKE</activation>
                                        <clusteredCall>false</clusteredCall>
                                        <description idref="3"/>
                                        <directJoin>false</directJoin>
                                        <name id="16">If inserted</name>
                                        <nodeHandler>com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandler>
                                        <nodeHandlerClass id="17">com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandlerClass>
                                        <parameters id="18" type="java.util.HashSet">
                                            <item id="19" type="com.j2fe.workflow.definition.Parameter">
                                                <input>true</input>
                                                <name id="20">caseItem</name>
                                                <stringValue id="21">RowCount</stringValue>
                                                <type>VARIABLE</type>
                                            </item>
                                            <item id="22" type="com.j2fe.workflow.definition.Parameter">
                                                <input>true</input>
                                                <name id="23">defaultItem</name>
                                                <stringValue id="24">1</stringValue>
                                                <type>CONSTANT</type>
                                            </item>
                                            <item id="25" type="com.j2fe.workflow.definition.Parameter">
                                                <input>true</input>
                                                <name id="26">nullTransition</name>
                                                <stringValue id="27">0</stringValue>
                                                <type>CONSTANT</type>
                                            </item>
                                        </parameters>
                                        <sources id="28" type="java.util.HashSet">
                                            <item id="29" type="com.j2fe.workflow.definition.Transition">
                                                <name id="30">goto-next</name>
                                                <source id="31">
                                                    <activation>INVOKE</activation>
                                                    <clusteredCall>false</clusteredCall>
                                                    <description idref="3"/>
                                                    <directJoin>false</directJoin>
                                                    <name id="32">Insert Rating</name>
                                                    <nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
                                                    <nodeHandlerClass id="33">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
                                                    <parameters id="34" type="java.util.HashSet">
                                                        <item id="35" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="36">database</name>
                                                            <stringValue id="37">jdbc/GSDM-1</stringValue>
                                                            <type>REFERENCE</type>
                                                        </item>
                                                        <item id="38" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="39">indexedParameters[0]</name>
                                                            <stringValue id="40">portfolioID</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                        <item id="41" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="42">indexedParameters[1]</name>
                                                            <stringValue id="43">crlinked</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                        <item id="44" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="45">querySQL</name>
                                                            <objectValue id="46" type="java.lang.String">--RDD-268 start&#13;
--insert into ft_t_isrt (ISS_RTNG_OID, INSTR_ID, START_TMS, LAST_CHG_USR_ID, LAST_CHG_TMS, RTNG_CDE, RTNG_VALUE_OID, RTNG_SET_OID, orig_data_prov_id, data_stat_typ, rtng_eff_tms)&#13;
insert into ft_t_isrt (ISS_RTNG_OID, INSTR_ID, START_TMS, LAST_CHG_USR_ID, LAST_CHG_TMS, RTNG_CDE, RTNG_SYMBOL_TXT, RTNG_VALUE_OID, RTNG_SET_OID, orig_data_prov_id, data_stat_typ, rtng_eff_tms, data_src_id)&#13;
--RDD-268 end&#13;
select  new_oid(), ai.instr_id, current_timestamp, 'DeriveFromCreditLinkedRating', current_timestamp, isrt.rtng_cde, isrt.rtng_cde, isrt.rtng_value_oid, isrt.rtng_set_oid, 'DERIVED', 'ACTIVE', current_timestamp::date, isrt.data_src_id&#13;
from ft_t_isrt isrt,&#13;
(select instr_id from ft_t_isgp isgp where isgp.prnt_iss_grp_oid = ? and isgp.prt_purp_typ = 'PRTFLIOC'&#13;
and isgp.start_tms &lt;= current_timestamp and (isgp.end_tms is null or isgp.end_tms &gt; current_timestamp)) ai&#13;
where isrt.orig_data_prov_id = 'DERIVED' and isrt.instr_id = ?&#13;
--RDD-268 start&#13;
and isrt.rtng_eff_tms &lt;= current_timestamp and (isrt.sys_eff_end_tms is null or isrt.sys_eff_end_tms &gt; current_timestamp)&#13;
--RDD-268 end</objectValue>
                                                            <type>CONSTANT</type>
                                                        </item>
                                                        <item id="47" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>false</input>
                                                            <name id="48">rowCount</name>
                                                            <stringValue id="49">RowCount</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                    </parameters>
                                                    <sources id="50" type="java.util.HashSet">
                                                        <item id="51" type="com.j2fe.workflow.definition.Transition">
                                                            <name id="52">goto-next</name>
                                                            <source id="53">
                                                                <activation>INVOKE</activation>
                                                                <clusteredCall>false</clusteredCall>
                                                                <description idref="3"/>
                                                                <directJoin>false</directJoin>
                                                                <name id="54">Bean Shell Script (Standard)</name>
                                                                <nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
                                                                <nodeHandlerClass id="55">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
                                                                <parameters id="56" type="java.util.HashSet">
                                                                    <item id="57" type="com.j2fe.workflow.definition.Parameter">
                                                                        <input>true</input>
                                                                        <name id="58">statements</name>
                                                                        <stringValue id="59">String portfolioID = input[0];&#13;
String crlinked = input[1];&#13;
String Issue = input[2];</stringValue>
                                                                        <type>CONSTANT</type>
                                                                    </item>
                                                                    <item id="60" type="com.j2fe.workflow.definition.Parameter">
                                                                        <UITypeHint id="61">["Issue"]@java/lang/String@</UITypeHint>
                                                                        <input>false</input>
                                                                        <name id="62">variables["Issue"]</name>
                                                                        <stringValue id="63">Issue</stringValue>
                                                                        <type>VARIABLE</type>
                                                                    </item>
                                                                    <item id="64" type="com.j2fe.workflow.definition.Parameter">
                                                                        <UITypeHint id="65">["crlinked"]@java/lang/String@</UITypeHint>
                                                                        <input>false</input>
                                                                        <name id="66">variables["crlinked"]</name>
                                                                        <stringValue id="67">crlinked</stringValue>
                                                                        <type>VARIABLE</type>
                                                                    </item>
                                                                    <item id="68" type="com.j2fe.workflow.definition.Parameter">
                                                                        <input>true</input>
                                                                        <name id="69">variables["input"]</name>
                                                                        <stringValue id="70">UnratedSingel</stringValue>
                                                                        <type>VARIABLE</type>
                                                                    </item>
                                                                    <item id="71" type="com.j2fe.workflow.definition.Parameter">
                                                                        <UITypeHint id="72">["portfolioID"]@java/lang/String@</UITypeHint>
                                                                        <input>false</input>
                                                                        <name id="73">variables["portfolioID"]</name>
                                                                        <stringValue id="74">portfolioID</stringValue>
                                                                        <type>VARIABLE</type>
                                                                    </item>
                                                                </parameters>
                                                                <sources id="75" type="java.util.HashSet">
                                                                    <item id="76" type="com.j2fe.workflow.definition.Transition">
                                                                        <name id="77">goto-next</name>
                                                                        <source id="78">
                                                                            <activation>INVOKE</activation>
                                                                            <clusteredCall>false</clusteredCall>
                                                                            <description idref="3"/>
                                                                            <directJoin>true</directJoin>
                                                                            <name id="79">For Each Split</name>
                                                                            <nodeHandler>com.j2fe.workflow.handler.impl.GenericSplit</nodeHandler>
                                                                            <nodeHandlerClass id="80">com.j2fe.workflow.handler.impl.GenericSplit</nodeHandlerClass>
                                                                            <parameters id="81" type="java.util.HashSet">
                                                                                <item id="82" type="com.j2fe.workflow.definition.Parameter">
                                                                                    <input>true</input>
                                                                                    <name id="83">input</name>
                                                                                    <stringValue id="84">UnRatedPortfolio</stringValue>
                                                                                    <type>VARIABLE</type>
                                                                                </item>
                                                                                <item id="85" type="com.j2fe.workflow.definition.Parameter">
                                                                                    <input>false</input>
                                                                                    <name id="86">output</name>
                                                                                    <stringValue id="87">UnratedSingel</stringValue>
                                                                                    <type>VARIABLE</type>
                                                                                </item>
                                                                            </parameters>
                                                                            <sources id="88" type="java.util.HashSet">
                                                                                <item id="89" type="com.j2fe.workflow.definition.Transition">
                                                                                    <name id="90">rows-found</name>
                                                                                    <source id="91">
                                                                                        <activation>INVOKE</activation>
                                                                                        <clusteredCall>false</clusteredCall>
                                                                                        <description idref="3"/>
                                                                                        <directJoin>false</directJoin>
                                                                                        <name id="92">Select CreditLinked Portfoli</name>
                                                                                        <nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
                                                                                        <nodeHandlerClass id="93">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
                                                                                        <parameters id="94" type="java.util.HashSet">
                                                                                            <item id="95" type="com.j2fe.workflow.definition.Parameter">
                                                                                                <input>true</input>
                                                                                                <name id="96">database</name>
                                                                                                <stringValue id="97">jdbc/GSDM-1</stringValue>
                                                                                                <type>REFERENCE</type>
                                                                                            </item>
                                                                                            <item id="98" type="com.j2fe.workflow.definition.Parameter">
                                                                                                <input>true</input>
                                                                                                <name id="99">indexedParameters[0]</name>
                                                                                                <stringValue id="100">Issuer</stringValue>
                                                                                                <type>VARIABLE</type>
                                                                                            </item>
                                                                                            <item id="101" type="com.j2fe.workflow.definition.Parameter">
                                                                                                <input>false</input>
                                                                                                <name id="102">indexedResult</name>
                                                                                                <stringValue id="103">UnRatedPortfolio</stringValue>
                                                                                                <type>VARIABLE</type>
                                                                                            </item>
                                                                                            <item id="104" type="com.j2fe.workflow.definition.Parameter">
                                                                                                <input>true</input>
                                                                                                <name id="105">querySQL</name>
                                                                                                <objectValue id="106" type="java.lang.String">select isgp.prnt_iss_grp_oid,&#13;
(SELECT RISS.INSTR_ID FROM FT_T_RISS RISS, FT_T_RIDF RIDF WHERE RISS.ISS_PART_RL_TYP = 'UNDLYING' AND RIDF.REL_TYP = 'CreditLinked'&#13;
AND RIDF.RLD_ISS_FEAT_ID = RISS.RLD_ISS_FEAT_ID AND RISS.INSTR_ID IS NOT NULL AND RIDF.INSTR_ID = ISSU.INSTR_ID&#13;
AND RIDF.START_TMS &lt;= current_timestamp AND (RIDF.END_TMS IS NULL OR RIDF.END_TMS &gt; current_timestamp)&#13;
AND RISS.START_TMS &lt;= current_timestamp AND (RISS.END_TMS IS NULL OR RISS.END_TMS &gt; current_timestamp)  limit 1) AS CREDITLINKED,&#13;
issu.instr_id&#13;
from ft_t_issu issu, ft_t_isgp isgp where issu.instr_issr_id = ?  and issu.iss_typ = 'PORT'&#13;
and issu.instr_id = isgp.instr_id&#13;
and isgp.prt_purp_typ = 'PRTFLIOP'&#13;
and issu.start_tms &lt;= current_timestamp and (issu.end_tms is null or issu.end_tms &gt; current_timestamp)&#13;
and isgp.start_tms &lt;= current_timestamp and (isgp.end_tms is null or isgp.end_tms &gt; current_timestamp)&#13;
and not exists (&#13;
select 1 from ft_t_isrt isrt , ft_t_isgp isgp1 where &#13;
isgp1.instr_id = isrt.instr_id &#13;
and isgp1.prnt_iss_grp_oid = isgp.prnt_iss_grp_oid&#13;
and isgp1.prt_purp_typ = 'PRTFLIOC'&#13;
--RDD-268 start&#13;
and isrt.rtng_eff_tms &lt;= current_timestamp and (isrt.sys_eff_end_tms is null or isrt.sys_eff_end_tms &gt; current_timestamp)&#13;
--RDD-268 end&#13;
and isgp1.start_tms &lt;= current_timestamp and (isgp1.end_tms is null or isgp1.end_tms &gt; current_timestamp)&#13;
and isrt.orig_data_prov_id = 'DERIVED')&#13;
and exists (SELECT RISS.INSTR_ID FROM FT_T_RISS RISS, FT_T_RIDF RIDF WHERE RISS.ISS_PART_RL_TYP = 'UNDLYING' AND RIDF.REL_TYP = 'CreditLinked'&#13;
AND RIDF.RLD_ISS_FEAT_ID = RISS.RLD_ISS_FEAT_ID AND RISS.INSTR_ID IS NOT NULL AND RIDF.INSTR_ID = ISSU.INSTR_ID&#13;
AND RIDF.START_TMS &lt;= current_timestamp AND (RIDF.END_TMS IS NULL OR RIDF.END_TMS &gt; current_timestamp)&#13;
AND RISS.START_TMS &lt;= current_timestamp AND (RISS.END_TMS IS NULL OR RISS.END_TMS &gt; current_timestamp) limit 1)&#13;
and exists (SELECT 1 FROM FT_T_ISST ISST WHERE ISST.STAT_DEF_ID = 'MIZRECAL' AND ISST.INSTR_ID = issu.instr_id and stat_char_val_txt = 'Y' and (stat_int_val_num = 0 or stat_int_val_num is null)&#13;
AND ISST.START_TMS &lt;= current_timestamp AND (ISST.END_TMS IS NULL OR ISST.END_TMS &gt; current_timestamp))</objectValue>
                                                                                                <type>CONSTANT</type>
                                                                                            </item>
                                                                                        </parameters>
                                                                                        <sources id="107" type="java.util.HashSet">
                                                                                            <item id="108" type="com.j2fe.workflow.definition.Transition">
                                                                                                <name id="109">goto-next</name>
                                                                                                <source id="110">
                                                                                                    <activation>INVOKE</activation>
                                                                                                    <clusteredCall>false</clusteredCall>
                                                                                                    <description idref="3"/>
                                                                                                    <directJoin>false</directJoin>
                                                                                                    <name id="111">Start</name>
                                                                                                    <nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
                                                                                                    <nodeHandlerClass id="112">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
                                                                                                    <sources id="113" type="java.util.HashSet"/>
                                                                                                    <targets id="114" type="java.util.HashSet">
                                                                                                        <item idref="108" type="com.j2fe.workflow.definition.Transition"/>
                                                                                                    </targets>
                                                                                                    <type>START</type>
                                                                                                </source>
                                                                                                <target idref="91"/>
                                                                                            </item>
                                                                                        </sources>
                                                                                        <targets id="115" type="java.util.HashSet">
                                                                                            <item id="116" type="com.j2fe.workflow.definition.Transition">
                                                                                                <name id="117">nothing-found</name>
                                                                                                <source idref="91"/>
                                                                                                <target idref="2"/>
                                                                                            </item>
                                                                                            <item idref="89" type="com.j2fe.workflow.definition.Transition"/>
                                                                                        </targets>
                                                                                        <type>XORSPLIT</type>
                                                                                    </source>
                                                                                    <target idref="78"/>
                                                                                </item>
                                                                            </sources>
                                                                            <targets id="118" type="java.util.HashSet">
                                                                                <item idref="76" type="com.j2fe.workflow.definition.Transition"/>
                                                                            </targets>
                                                                            <type>ANDSPLIT</type>
                                                                        </source>
                                                                        <target idref="53"/>
                                                                    </item>
                                                                </sources>
                                                                <targets id="119" type="java.util.HashSet">
                                                                    <item idref="51" type="com.j2fe.workflow.definition.Transition"/>
                                                                </targets>
                                                                <type>ACTIVITY</type>
                                                            </source>
                                                            <target idref="31"/>
                                                        </item>
                                                    </sources>
                                                    <targets id="120" type="java.util.HashSet">
                                                        <item idref="29" type="com.j2fe.workflow.definition.Transition"/>
                                                    </targets>
                                                    <type>ACTIVITY</type>
                                                </source>
                                                <target idref="15"/>
                                            </item>
                                        </sources>
                                        <targets id="121" type="java.util.HashSet">
                                            <item idref="13" type="com.j2fe.workflow.definition.Transition"/>
                                            <item id="122" type="com.j2fe.workflow.definition.Transition">
                                                <name id="123">1</name>
                                                <source idref="15"/>
                                                <target id="124">
                                                    <activation>INVOKE</activation>
                                                    <clusteredCall>false</clusteredCall>
                                                    <description idref="3"/>
                                                    <directJoin>false</directJoin>
                                                    <name id="125">Insert/Update Derivation Rule</name>
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
                                                            <stringValue id="133">Issue</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                        <item id="134" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="135">indexedParameters[1]</name>
                                                            <stringValue id="136">Issue</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                        <item id="137" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="138">querySQL</name>
                                                            <stringValue id="139">MERGE INTO ft_t_isst AS isst&#13;
USING (&#13;
    SELECT instr_id FROM ft_t_issu WHERE instr_id = ?&#13;
) AS issu&#13;
ON (&#13;
    isst.instr_id = issu.instr_id&#13;
    AND isst.stat_def_id = 'MIZDRVRL'&#13;
    AND isst.start_tms &lt; current_timestamp&#13;
    AND (isst.end_tms IS NULL OR isst.end_tms &gt; current_timestamp)&#13;
)&#13;
WHEN MATCHED THEN&#13;
    UPDATE SET&#13;
        stat_char_val_txt = 'CREDITLINKED',&#13;
        last_chg_usr_id = 'DeriveFromCreditLinkedRating',&#13;
        last_chg_tms = current_timestamp&#13;
WHEN NOT MATCHED THEN&#13;
    INSERT (&#13;
        stat_id, stat_def_id, instr_id, start_tms, last_chg_tms, last_chg_usr_id, stat_char_val_txt&#13;
    )&#13;
    VALUES (&#13;
        new_oid(), 'MIZDRVRL', ?, current_timestamp, current_timestamp, 'DeriveFromCreditLinkedRating', 'CREDITLINKED'&#13;
    )</stringValue>
                                                            <type>CONSTANT</type>
                                                        </item>
                                                    </parameters>
                                                    <sources id="140" type="java.util.HashSet">
                                                        <item idref="122" type="com.j2fe.workflow.definition.Transition"/>
                                                    </sources>
                                                    <targets id="141" type="java.util.HashSet">
                                                        <item id="142" type="com.j2fe.workflow.definition.Transition">
                                                            <name id="143">goto-next</name>
                                                            <source idref="124"/>
                                                            <target idref="9"/>
                                                        </item>
                                                    </targets>
                                                    <type>ACTIVITY</type>
                                                </target>
                                            </item>
                                        </targets>
                                        <type>XORSPLIT</type>
                                    </source>
                                    <target idref="9"/>
                                </item>
                                <item idref="142" type="com.j2fe.workflow.definition.Transition"/>
                            </sources>
                            <targets id="144" type="java.util.HashSet">
                                <item idref="7" type="com.j2fe.workflow.definition.Transition"/>
                            </targets>
                            <type>ANDJOIN</type>
                        </source>
                        <target idref="2"/>
                    </item>
                    <item idref="116" type="com.j2fe.workflow.definition.Transition"/>
                </sources>
                <targets id="145" type="java.util.HashSet"/>
                <type>END</type>
            </endNode>
            <forcePurgeAtEnd>false</forcePurgeAtEnd>
            <group id="146">Mizuho/Ratings</group>
            <haltOnError>false</haltOnError>
            <lastChangeUser id="147">user1</lastChangeUser>
            <lastUpdate id="148">2025-06-20T22:11:05.000+0000</lastUpdate>
            <name id="149">DeriveFromCreditLinkedRating</name>
            <nodes id="150" type="java.util.HashSet">
                <item idref="53" type="com.j2fe.workflow.definition.Node"/>
                <item idref="78" type="com.j2fe.workflow.definition.Node"/>
                <item idref="15" type="com.j2fe.workflow.definition.Node"/>
                <item idref="31" type="com.j2fe.workflow.definition.Node"/>
                <item idref="124" type="com.j2fe.workflow.definition.Node"/>
                <item idref="91" type="com.j2fe.workflow.definition.Node"/>
                <item idref="110" type="com.j2fe.workflow.definition.Node"/>
                <item idref="2" type="com.j2fe.workflow.definition.Node"/>
                <item idref="9" type="com.j2fe.workflow.definition.Node"/>
            </nodes>
            <optimize>true</optimize>
            <parameter id="151" type="java.util.HashMap">
                <entry>
                    <key id="152" type="java.lang.String">Issuer</key>
                    <value id="153" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="154">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <input>true</input>
                        <output>false</output>
                        <required>false</required>
                    </value>
                </entry>
            </parameter>
            <permissions id="155" type="java.util.HashSet"/>
            <priority>50</priority>
            <purgeAtEnd>true</purgeAtEnd>
            <retries>0</retries>
            <startNode idref="110"/>
            <status>RELEASED</status>
            <variables id="156" type="java.util.HashMap">
                <entry>
                    <key id="157" type="java.lang.String">Issuer</key>
                    <value id="158" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="159">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <persistent>false</persistent>
                    </value>
                </entry>
            </variables>
            <version>6</version>
        </com.j2fe.workflow.definition.Workflow>
    </businessobject>
</goldensource-package>
