<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<goldensource-package version="10.0.0.02">
    <package-comment/>
    <businessobject displayString="7 - V10FinalTest" type="com.j2fe.workflow.definition.Workflow">
        <com.j2fe.workflow.definition.Workflow id="0">
            <alwaysPersist>false</alwaysPersist>
            <clustered>true</clustered>
            <comment id="1">V10FinalTest</comment>
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
                            <directJoin>false</directJoin>
                            <name id="10">Error</name>
                            <nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
                            <nodeHandlerClass id="11">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
                            <parameters id="12" type="java.util.HashSet">
                                <item id="13" type="com.j2fe.workflow.definition.Parameter">
                                    <UITypeHint id="14">["Attachment"]@java/lang/String@</UITypeHint>
                                    <input>true</input>
                                    <name id="15">input["Attachment"]</name>
                                    <stringValue id="16">Entities_With_AsOf_Dates</stringValue>
                                    <type>CONSTANT</type>
                                </item>
                                <item id="17" type="com.j2fe.workflow.definition.Parameter">
                                    <UITypeHint id="18">["CopyIn"]@java/lang/String@</UITypeHint>
                                    <input>true</input>
                                    <name id="19">input["CopyIn"]</name>
                                    <stringValue id="20">CopyIn</stringValue>
                                    <type>VARIABLE</type>
                                </item>
                                <item id="21" type="com.j2fe.workflow.definition.Parameter">
                                    <UITypeHint id="22">["EmailText"]@java/lang/String@</UITypeHint>
                                    <input>true</input>
                                    <name id="23">input["EmailText"]</name>
                                    <stringValue id="24">The reported Instruments or Financial Institution have ASOf Dates associated with them. Please investigate.</stringValue>
                                    <type>CONSTANT</type>
                                </item>
                                <item id="25" type="com.j2fe.workflow.definition.Parameter">
                                    <UITypeHint id="26">["NoteText"]@java/lang/String@</UITypeHint>
                                    <input>true</input>
                                    <name id="27">input["NoteText"]</name>
                                    <stringValue id="28">"N.B. This is an automated e-mail. Please do not respond to this e-mail as this mailbox is not monitored.</stringValue>
                                    <type>CONSTANT</type>
                                </item>
                                <item id="29" type="com.j2fe.workflow.definition.Parameter">
                                    <UITypeHint id="30">["Recipients"]@java/lang/String@</UITypeHint>
                                    <input>true</input>
                                    <name id="31">input["Recipients"]</name>
                                    <stringValue id="32">Recipients</stringValue>
                                    <type>VARIABLE</type>
                                </item>
                                <item id="33" type="com.j2fe.workflow.definition.Parameter">
                                    <UITypeHint id="34">["Subject"]@java/lang/String@</UITypeHint>
                                    <input>true</input>
                                    <name id="35">input["Subject"]</name>
                                    <stringValue id="36">GoldenSource Instruments and Financial Institutions with AsOf Dates</stringValue>
                                    <type>CONSTANT</type>
                                </item>
                                <item id="37" type="com.j2fe.workflow.definition.Parameter">
                                    <UITypeHint id="38">["sqlSelect"]@java/lang/String@</UITypeHint>
                                    <input>true</input>
                                    <name id="39">input["sqlSelect"]</name>
                                    <objectValue id="40" type="java.lang.String">select column1 from (&#13;
select &#13;
 '"Entity Type","Entity Name","Preferred ID Type","Preferred ID","ASOF DATE","When Added","Added By","Inventory Groups"' as column1 , 1 AS ordernum &#13;
from dual&#13;
union&#13;
select column1, 2 AS ordernum  from &#13;
(select&#13;
'"'|| 'Instrument",' ||&#13;
'"'|| issu.PREF_ISS_NME ||'",' ||&#13;
'"'|| issu.PREF_ID_CTXT_TYP ||'",' ||&#13;
'"'|| issu.PREF_ISS_ID ||'",' ||&#13;
'"'|| TO_CHAR(isst.STAT_VAL_TMS, 'dd-Mon-YYYY HH:MI:SS AM') ||'",' ||&#13;
'"'|| TO_CHAR(isst.LAST_CHG_TMS, 'dd-Mon-YYYY HH:MI:SS AM') ||'",' ||&#13;
'"'|| isst.LAST_CHG_USR_ID ||'",' ||&#13;
'"'|| &#13;
	(&#13;
		select &#13;
			coalesce (string_agg(CASE WHEN isgp.PRT_PURP_TYP IN ('MUREX', 'INTEREST') THEN TRIM(isgr.GRP_NME) END, ' / ' ORDER BY isgp.PRT_PURP_TYP),'') AS INVENTORIES&#13;
								   &#13;
										   &#13;
	  &#13;
  		from ft_t_isgp as isgp&#13;
  		inner join ft_t_isgr as isgr on isgp.PRNT_ISS_GRP_OID = isgr.ISS_GRP_OID&#13;
										&#13;
  		where isgp.INSTR_ID = isst.INSTR_ID and isgp.PRT_PURP_TYP in ('MUREX', 'INTEREST') and isgp.END_TMS is null&#13;
							  &#13;
) || '"' as  column1&#13;
from FT_T_ISST isst&#13;
inner join ft_t_isgp as isgp on isst.INSTR_ID = isgp.INSTR_ID and isgp.END_TMS is null&#13;
inner join ft_t_isgr as isgr on isgp.PRNT_ISS_GRP_OID = isgr.ISS_GRP_OID&#13;
inner join FT_T_ISSU as issu on issu.INSTR_ID = isst.INSTR_ID &#13;
where isst.STAT_DEF_ID = 'ASOFDATE' and isst.END_TMS is null&#13;
union&#13;
select &#13;
'"'|| 'Financial Institution",' ||&#13;
'"'|| fins.INST_NME ||'",' ||&#13;
'"'|| fins.PREF_FINS_ID_CTXT_TYP ||'",' ||&#13;
'"'|| fins.PREF_FINS_ID ||'",' ||&#13;
'"'|| TO_CHAR(fist.STAT_VAL_TMS, 'dd-Mon-YYYY HH:MI:SS AM') ||'",' ||&#13;
'"'|| TO_CHAR(fist.LAST_CHG_TMS, 'dd-Mon-YYYY HH:MI:SS AM') ||'",' ||&#13;
'"'|| fist.LAST_CHG_USR_ID  ||'",' ||&#13;
'"'|| (&#13;
		select &#13;
			coalesce (string_agg(CASE WHEN irgp.PRT_PURP_TYP IN ('MUREX', 'INTEREST') THEN TRIM(irgr.GRP_NME) END, ' / ' ORDER BY irgp.PRT_PURP_TYP),'') AS INVENTORIES -- inventory groups&#13;
								   &#13;
										   &#13;
	  &#13;
  		from ft_t_irgp as irgp&#13;
  		inner join ft_t_irgr as irgr on irgp.PRNT_ISSR_GRP_OID = irgr.ISSR_GRP_OID&#13;
  		where irgp.INSTR_ISSR_ID = issr.INSTR_ISSR_ID and irgp.PRT_PURP_TYP in ('MUREX', 'INTEREST') and irgp.END_TMS is null&#13;
													 &#13;
							  &#13;
) || '"'&#13;
from ft_t_fist fist&#13;
inner join FT_T_FINS as fins on fist.INST_MNEM = fins.INST_MNEM&#13;
inner join FT_T_ISSR as issr on issr.FINS_INST_MNEM = fins.INST_MNEM&#13;
where fist.STAT_DEF_ID = 'ASOFDATE' and fist.END_TMS is null) asd where column1 is not null )we order by ordernum;&#13;
</objectValue>
                                    <type>CONSTANT</type>
                                </item>
                                <item id="41" type="com.j2fe.workflow.definition.Parameter">
                                    <input>true</input>
                                    <name id="42">name</name>
                                    <stringValue id="43">EmailExcelReport</stringValue>
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
                                        <name id="48">Database Select (Xor Split)</name>
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
                                                <name id="55">querySQL</name>
                                                <objectValue id="56" type="java.lang.String">select column1 from (&#13;
select &#13;
  '"Entity Type","Entity Name","Preferred ID Type","Preferred ID","ASOF DATE","When Added","Added By","Inventory Groups"' as column1 , 1 AS ordernum &#13;
from dual&#13;
union &#13;
select column1, 2 AS ordernum  from &#13;
(select&#13;
  '"Instrument",' ||&#13;
  '"' || issu.PREF_ISS_NME || '",' ||&#13;
  '"' || issu.PREF_ID_CTXT_TYP || '",' ||&#13;
  '"' || issu.PREF_ISS_ID || '",' ||&#13;
  '"' || TO_CHAR(isst.STAT_VAL_TMS, 'dd-Mon-YYYY HH:MI:SS AM') || '",' ||&#13;
  '"' || TO_CHAR(isst.LAST_CHG_TMS, 'dd-Mon-YYYY HH:MI:SS AM') || '",' ||&#13;
  '"' || isst.LAST_CHG_USR_ID || '",' ||&#13;
  '"' || (&#13;
    select coalesce (string_agg(&#13;
      case when isgp.PRT_PURP_TYP in ('MUREX', 'INTEREST') &#13;
           then trim(isgr.GRP_NME) &#13;
      end, ' / ' ORDER BY isgp.PRT_PURP_TYP&#13;
    ),'')&#13;
    from ft_t_isgp isgp&#13;
    inner join ft_t_isgr isgr on isgp.PRNT_ISS_GRP_OID = isgr.ISS_GRP_OID&#13;
    where isgp.INSTR_ID = isst.INSTR_ID &#13;
      and isgp.PRT_PURP_TYP in ('MUREX', 'INTEREST') &#13;
      and isgp.END_TMS is null&#13;
  ) || '"' as  column1&#13;
from FT_T_ISST isst&#13;
inner join ft_t_isgp isgp on isst.INSTR_ID = isgp.INSTR_ID and isgp.END_TMS is null&#13;
inner join ft_t_isgr isgr on isgp.PRNT_ISS_GRP_OID = isgr.ISS_GRP_OID&#13;
inner join FT_T_ISSU issu on issu.INSTR_ID = isst.INSTR_ID &#13;
where isst.STAT_DEF_ID = 'ASOFDATE' and isst.END_TMS is null&#13;
union &#13;
select &#13;
  '"Financial Institution",' ||&#13;
  '"' || fins.INST_NME || '",' ||&#13;
  '"' || fins.PREF_FINS_ID_CTXT_TYP || '",' ||&#13;
  '"' || fins.PREF_FINS_ID || '",' ||&#13;
  '"' || TO_CHAR(fist.STAT_VAL_TMS, 'dd-Mon-YYYY HH:MI:SS AM') || '",' ||&#13;
  '"' || TO_CHAR(fist.LAST_CHG_TMS, 'dd-Mon-YYYY HH:MI:SS AM') || '",' ||&#13;
  '"' || fist.LAST_CHG_USR_ID || '",' ||&#13;
  '"' || (&#13;
    select coalesce (string_agg(&#13;
      case when irgp.PRT_PURP_TYP in ('MUREX', 'INTEREST') &#13;
           then trim(irgr.GRP_NME) &#13;
      end, ' / ' ORDER BY irgp.PRT_PURP_TYP&#13;
    ),'')&#13;
    from ft_t_irgp irgp&#13;
    inner join ft_t_irgr irgr on irgp.PRNT_ISSR_GRP_OID = irgr.ISSR_GRP_OID&#13;
    where irgp.INSTR_ISSR_ID = issr.INSTR_ISSR_ID &#13;
      and irgp.PRT_PURP_TYP in ('MUREX', 'INTEREST') &#13;
      and irgp.END_TMS is null&#13;
  ) || '"'&#13;
from ft_t_fist fist&#13;
inner join FT_T_FINS fins on fist.INST_MNEM = fins.INST_MNEM&#13;
inner join FT_T_ISSR issr on issr.FINS_INST_MNEM = fins.INST_MNEM&#13;
where fist.STAT_DEF_ID = 'ASOFDATE' and fist.END_TMS is null)asd where column1 is not null )we order by ordernum;&#13;
</objectValue>
                                                <type>CONSTANT</type>
                                            </item>
                                        </parameters>
                                        <sources id="57" type="java.util.HashSet">
                                            <item id="58" type="com.j2fe.workflow.definition.Transition">
                                                <name id="59">goto-next</name>
                                                <source id="60">
                                                    <activation>INVOKE</activation>
                                                    <clusteredCall>false</clusteredCall>
                                                    <description idref="3"/>
                                                    <directJoin>false</directJoin>
                                                    <name id="61">Start</name>
                                                    <nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
                                                    <nodeHandlerClass id="62">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
                                                    <sources id="63" type="java.util.HashSet"/>
                                                    <targets id="64" type="java.util.HashSet">
                                                        <item idref="58" type="com.j2fe.workflow.definition.Transition"/>
                                                    </targets>
                                                    <type>START</type>
                                                </source>
                                                <target idref="47"/>
                                            </item>
                                        </sources>
                                        <targets id="65" type="java.util.HashSet">
                                            <item id="66" type="com.j2fe.workflow.definition.Transition">
                                                <name id="67">nothing-found</name>
                                                <source idref="47"/>
                                                <target id="68">
                                                    <activation>INVOKE</activation>
                                                    <clusteredCall>false</clusteredCall>
                                                    <description idref="3"/>
                                                    <directJoin>false</directJoin>
                                                    <name id="69">No Error</name>
                                                    <nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
                                                    <nodeHandlerClass id="70">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
                                                    <parameters id="71" type="java.util.HashSet">
                                                        <item id="72" type="com.j2fe.workflow.definition.Parameter">
                                                            <UITypeHint id="73">["Attachment"]@java/lang/String@</UITypeHint>
                                                            <input>true</input>
                                                            <name id="74">input["Attachment"]</name>
                                                            <stringValue id="75">Entities_With_AsOf_Dates</stringValue>
                                                            <type>CONSTANT</type>
                                                        </item>
                                                        <item id="76" type="com.j2fe.workflow.definition.Parameter">
                                                            <UITypeHint id="77">["CopyIn"]@java/lang/String@</UITypeHint>
                                                            <input>true</input>
                                                            <name id="78">input["CopyIn"]</name>
                                                            <stringValue id="79">CopyIn</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                        <item id="80" type="com.j2fe.workflow.definition.Parameter">
                                                            <UITypeHint id="81">["EmailText"]@java/lang/String@</UITypeHint>
                                                            <input>true</input>
                                                            <name id="82">input["EmailText"]</name>
                                                            <stringValue id="83">No Instruments or Financial Institution have been found with associated. ASOf Dates</stringValue>
                                                            <type>CONSTANT</type>
                                                        </item>
                                                        <item id="84" type="com.j2fe.workflow.definition.Parameter">
                                                            <UITypeHint id="85">["NoteText"]@java/lang/String@</UITypeHint>
                                                            <input>true</input>
                                                            <name id="86">input["NoteText"]</name>
                                                            <stringValue id="87">"N.B. This is an automated e-mail. Please do not respond to this e-mail as this mailbox is not monitored.</stringValue>
                                                            <type>CONSTANT</type>
                                                        </item>
                                                        <item id="88" type="com.j2fe.workflow.definition.Parameter">
                                                            <UITypeHint id="89">["Recipients"]@java/lang/String@</UITypeHint>
                                                            <input>true</input>
                                                            <name id="90">input["Recipients"]</name>
                                                            <stringValue id="91">Recipients</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                        <item id="92" type="com.j2fe.workflow.definition.Parameter">
                                                            <UITypeHint id="93">["Subject"]@java/lang/String@</UITypeHint>
                                                            <input>true</input>
                                                            <name id="94">input["Subject"]</name>
                                                            <stringValue id="95">GoldenSource Instruments and Financial Institutions with AsOf Dates - none found</stringValue>
                                                            <type>CONSTANT</type>
                                                        </item>
                                                        <item id="96" type="com.j2fe.workflow.definition.Parameter">
                                                            <UITypeHint id="97">["sqlSelect"]@java/lang/String@</UITypeHint>
                                                            <input>true</input>
                                                            <name id="98">input["sqlSelect"]</name>
                                                            <objectValue id="99" type="java.lang.String">select column1 from (&#13;
select &#13;
 '"Entity Type","Entity Name","Preferred ID Type","Preferred ID","ASOF DATE","When Added","Added By","Inventory Groups"' as column1 , 1 AS ordernum &#13;
from dual&#13;
union&#13;
select column1, 2 AS ordernum  from &#13;
(select&#13;
'"'|| 'Instrument",' ||&#13;
'"'|| issu.PREF_ISS_NME ||'",' ||&#13;
'"'|| issu.PREF_ID_CTXT_TYP ||'",' ||&#13;
'"'|| issu.PREF_ISS_ID ||'",' ||&#13;
'"'|| TO_CHAR(isst.STAT_VAL_TMS, 'dd-Mon-YYYY HH:MI:SS AM') ||'",' ||&#13;
'"'|| TO_CHAR(isst.LAST_CHG_TMS, 'dd-Mon-YYYY HH:MI:SS AM') ||'",' ||&#13;
'"'|| isst.LAST_CHG_USR_ID ||'",' ||&#13;
'"'|| &#13;
	(&#13;
		select &#13;
			coalesce (string_agg(CASE WHEN isgp.PRT_PURP_TYP IN ('MUREX', 'INTEREST') THEN TRIM(isgr.GRP_NME) END, ' / ' ORDER BY isgp.PRT_PURP_TYP),'') AS INVENTORIES&#13;
								   &#13;
										   &#13;
	  &#13;
  		from ft_t_isgp as isgp&#13;
  		inner join ft_t_isgr as isgr on isgp.PRNT_ISS_GRP_OID = isgr.ISS_GRP_OID&#13;
										&#13;
  		where isgp.INSTR_ID = isst.INSTR_ID and isgp.PRT_PURP_TYP in ('MUREX', 'INTEREST') and isgp.END_TMS is null&#13;
							  &#13;
) || '"' as  column1&#13;
from FT_T_ISST isst&#13;
inner join ft_t_isgp as isgp on isst.INSTR_ID = isgp.INSTR_ID and isgp.END_TMS is null&#13;
inner join ft_t_isgr as isgr on isgp.PRNT_ISS_GRP_OID = isgr.ISS_GRP_OID&#13;
inner join FT_T_ISSU as issu on issu.INSTR_ID = isst.INSTR_ID &#13;
where isst.STAT_DEF_ID = 'ASOFDATE' and isst.END_TMS is null&#13;
union&#13;
select &#13;
'"'|| 'Financial Institution",' ||&#13;
'"'|| fins.INST_NME ||'",' ||&#13;
'"'|| fins.PREF_FINS_ID_CTXT_TYP ||'",' ||&#13;
'"'|| fins.PREF_FINS_ID ||'",' ||&#13;
'"'|| TO_CHAR(fist.STAT_VAL_TMS, 'dd-Mon-YYYY HH:MI:SS AM') ||'",' ||&#13;
'"'|| TO_CHAR(fist.LAST_CHG_TMS, 'dd-Mon-YYYY HH:MI:SS AM') ||'",' ||&#13;
'"'|| fist.LAST_CHG_USR_ID  ||'",' ||&#13;
'"'|| (&#13;
		select &#13;
			coalesce (string_agg(CASE WHEN irgp.PRT_PURP_TYP IN ('MUREX', 'INTEREST') THEN TRIM(irgr.GRP_NME) END, ' / ' ORDER BY irgp.PRT_PURP_TYP),'') AS INVENTORIES -- inventory groups&#13;
								   &#13;
										   &#13;
	  &#13;
  		from ft_t_irgp as irgp&#13;
  		inner join ft_t_irgr as irgr on irgp.PRNT_ISSR_GRP_OID = irgr.ISSR_GRP_OID&#13;
  		where irgp.INSTR_ISSR_ID = issr.INSTR_ISSR_ID and irgp.PRT_PURP_TYP in ('MUREX', 'INTEREST') and irgp.END_TMS is null&#13;
													 &#13;
							  &#13;
) || '"'&#13;
from ft_t_fist fist&#13;
inner join FT_T_FINS as fins on fist.INST_MNEM = fins.INST_MNEM&#13;
inner join FT_T_ISSR as issr on issr.FINS_INST_MNEM = fins.INST_MNEM&#13;
where fist.STAT_DEF_ID = 'ASOFDATE' and fist.END_TMS is null) asd where column1 is not null )we order by ordernum;&#13;
</objectValue>
                                                            <type>CONSTANT</type>
                                                        </item>
                                                        <item id="100" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="101">name</name>
                                                            <stringValue id="102">EmailExcelReport</stringValue>
                                                            <type>CONSTANT</type>
                                                        </item>
                                                    </parameters>
                                                    <sources id="103" type="java.util.HashSet">
                                                        <item idref="66" type="com.j2fe.workflow.definition.Transition"/>
                                                    </sources>
                                                    <targets id="104" type="java.util.HashSet">
                                                        <item id="105" type="com.j2fe.workflow.definition.Transition">
                                                            <name id="106">goto-next</name>
                                                            <source idref="68"/>
                                                            <target idref="2"/>
                                                        </item>
                                                    </targets>
                                                    <type>ACTIVITY</type>
                                                </target>
                                            </item>
                                            <item idref="45" type="com.j2fe.workflow.definition.Transition"/>
                                        </targets>
                                        <type>XORSPLIT</type>
                                    </source>
                                    <target idref="9"/>
                                </item>
                            </sources>
                            <targets id="107" type="java.util.HashSet">
                                <item idref="7" type="com.j2fe.workflow.definition.Transition"/>
                            </targets>
                            <type>ACTIVITY</type>
                        </source>
                        <target idref="2"/>
                    </item>
                    <item idref="105" type="com.j2fe.workflow.definition.Transition"/>
                </sources>
                <targets id="108" type="java.util.HashSet"/>
                <type>END</type>
            </endNode>
            <forcePurgeAtEnd>false</forcePurgeAtEnd>
            <group id="109">Mizuho/Reports</group>
            <haltOnError>false</haltOnError>
            <lastChangeUser id="110">user1</lastChangeUser>
            <lastUpdate id="111">2025-06-11T11:41:41.000+0000</lastUpdate>
            <name id="112">MZ_ASOF_Dates_Report</name>
            <nodes id="113" type="java.util.HashSet">
                <item idref="47" type="com.j2fe.workflow.definition.Node"/>
                <item idref="9" type="com.j2fe.workflow.definition.Node"/>
                <item idref="68" type="com.j2fe.workflow.definition.Node"/>
                <item idref="60" type="com.j2fe.workflow.definition.Node"/>
                <item idref="2" type="com.j2fe.workflow.definition.Node"/>
            </nodes>
            <optimize>true</optimize>
            <parameter id="114" type="java.util.HashMap">
                <entry>
                    <key id="115" type="java.lang.String">CopyIn</key>
                    <value id="116" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="117">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description id="118">Multiple addresses separated by ;</description>
                        <input>true</input>
                        <output>false</output>
                        <required>false</required>
                    </value>
                </entry>
                <entry>
                    <key id="119" type="java.lang.String">Recipients</key>
                    <value id="120" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="121">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description id="122">Multiple addresses separated by ;</description>
                        <input>true</input>
                        <output>false</output>
                        <required>true</required>
                    </value>
                </entry>
            </parameter>
            <permissions id="123" type="java.util.HashSet"/>
            <priority>50</priority>
            <purgeAtEnd>false</purgeAtEnd>
            <retries>0</retries>
            <startNode idref="60"/>
            <status>RELEASED</status>
            <variables id="124" type="java.util.HashMap">
                <entry>
                    <key id="125" type="java.lang.String">CopyIn</key>
                    <value id="126" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="127">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description id="128">Multiple addresses separated by ;</description>
                        <persistent>false</persistent>
                    </value>
                </entry>
                <entry>
                    <key id="129" type="java.lang.String">Recipients</key>
                    <value id="130" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="131">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description id="132">Multiple addresses separated by ;</description>
                        <persistent>false</persistent>
                    </value>
                </entry>
            </variables>
            <version>7</version>
        </com.j2fe.workflow.definition.Workflow>
    </businessobject>
</goldensource-package>
