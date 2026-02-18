<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.07">
<package-comment/>
<businessobject displayString="12 - V10-QueriesChanged-Both" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>false</alwaysPersist>
<clustered>true</clustered>
<comment id="1">V10-QueriesChanged-Both</comment>
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
<name id="11">Error</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="12">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="13" type="java.util.HashSet">
<item id="14" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="15">["Attachment"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="16">input["Attachment"]</name>
<objectValue id="17" type="java.lang.String">MTN_ISIN_Change_Report__from_GS_</objectValue>
<type>CONSTANT</type>
</item>
<item id="18" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="19">["CopyIn"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="20">input["CopyIn"]</name>
<stringValue id="21">CopyIn</stringValue>
<type>VARIABLE</type>
</item>
<item id="22" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="23">["EmailText"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="24">input["EmailText"]</name>
<objectValue id="25" type="java.lang.String">The reported MTNs have had their ISINs changed. Please investigate.</objectValue>
<type>CONSTANT</type>
</item>
<item id="26" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="27">["NoteText"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="28">input["NoteText"]</name>
<objectValue id="29" type="java.lang.String">"N.B. This is an automated e-mail. Please do not respond to this e-mail as this mailbox is not monitored. If you have questions about this message, please contact Global IT Apps &amp; Services Team (pur_in_gitcas@mizuho-sc.com)."</objectValue>
<type>CONSTANT</type>
</item>
<item id="30" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="31">["Recipients"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="32">input["Recipients"]</name>
<stringValue id="33">Recipients</stringValue>
<type>VARIABLE</type>
</item>
<item id="34" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="35">["Subject"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="36">input["Subject"]</name>
<objectValue id="37" type="java.lang.String">MTN ISIN changes were identified  while processing asset in the last 24 hours</objectValue>
<type>CONSTANT</type>
</item>
<item id="38" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="39">["sqlSelect"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="40">input["sqlSelect"]</name>
<objectValue id="41" type="java.lang.String">select x from (
select '"MTN Bond Ref","Instrument Name","Old ISIN","New ISIN","Changed Time"' x, 1 REC_SEQUENCE,sysdate() RPT_TIME from DUAL
union
select * from (select 
'"' || MTNREF.ISS_ID || '"' || ','  ||
'"' || FT_T_ISSU.PREF_ISS_NME || '"' || ',' ||
'"' || OLDISIN.CHAR_VAL_TXT || '"' || ',' ||
'"' || NEWISIN.CHAR_VAL_TXT  || '"' || ',' ||
'"' || TO_CHAR(FT_T_TRID.CREATED_TMS, 'Mon-DD-YYYY hh24:mi:ss') || '"' x, 2 REC_SEQUENCE, FT_T_TRID.CREATED_TMS RPT_TIME
from FT_T_TRID
inner join FT_T_NTEL INSTRID on INSTRID.TRN_ID = FT_T_TRID.TRN_ID and INSTRID.NOTFCN_ID = 50009 --and INSTRID.PARM_NME = 'instrId'
inner join FT_T_NTEL OLDISIN on OLDISIN.TRN_ID = FT_T_TRID.TRN_ID and OLDISIN.NOTFCN_ID = 50009 --and OLDISIN.PARM_NME = 'oldIsin'
inner join FT_T_NTEL NEWISIN on NEWISIN.TRN_ID = FT_T_TRID.TRN_ID and NEWISIN.NOTFCN_ID = 50009 --and NEWISIN.PARM_NME = 'newIsin'
inner join FT_T_ISSU on FT_T_ISSU.INSTR_ID = INSTRID.CHAR_VAL_TXT
left join FT_T_ISID MTNREF on MTNREF.INSTR_ID = FT_T_ISSU.INSTR_ID and MTNREF.ID_CTXT_TYP = 'MZHMTNREF' and MTNREF.END_TMS is NULL
where FT_T_TRID.INPUT_MSG_TYP = 'MTNASSETUNVALIDATED' and FT_T_TRID.CREATED_TMS &gt; sysdate() - interval '1 day'
order by FT_T_TRID.CREATED_TMS asc)a)b
order by REC_SEQUENCE, RPT_TIME
</objectValue>
<type>CONSTANT</type>
</item>
<item id="42" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="43">name</name>
<stringValue id="44">EmailExcelReport</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="45" type="java.util.HashSet">
<item id="46" type="com.j2fe.workflow.definition.Transition">
<name id="47">rows-found</name>
<source id="48">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="49"/>
<directJoin>false</directJoin>
<name id="50">Database Select (Xor Split)</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="51">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="52" type="java.util.HashSet">
<item id="53" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="54">database</name>
<stringValue id="55">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="56" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="57">querySQL</name>
<objectValue id="58" type="java.lang.String">SELECT x
FROM (
    SELECT 
        '"' || MTNREF.ISS_ID || '",' ||
        '"' || FT_T_ISSU.PREF_ISS_NME || '",' ||
        '"' || OLDISIN.CHAR_VAL_TXT || '",' ||
        '"' || NEWISIN.CHAR_VAL_TXT || '",' ||
        '"' || TO_CHAR(FT_T_TRID.CREATED_TMS, 'Mon-DD-YYYY HH24:MI:SS') || '"' AS x,
        2 AS rec_sequence
    FROM FT_T_TRID
    INNER JOIN FT_T_NTEL AS INSTRID 
        ON INSTRID.TRN_ID = FT_T_TRID.TRN_ID 
       AND INSTRID.NOTFCN_ID = 50009 
       --AND INSTRID.PARM_NME = 'instrId'
    INNER JOIN FT_T_NTEL AS OLDISIN 
        ON OLDISIN.TRN_ID = FT_T_TRID.Trn_ID 
       AND OLDISIN.NOTFCN_ID = 50009 
       --AND OLDISIN.PARM_NME = 'oldIsin'
    INNER JOIN FT_T_NTEL AS NEWISIN 
        ON NEWISIN.TRN_ID = FT_T_TRID.TRN_ID 
       AND NEWISIN.NOTFCN_ID = 50009 
       --AND NEWISIN.PARM_NME = 'newIsin'
    INNER JOIN FT_T_ISSU 
        ON FT_T_ISSU.INSTR_ID = INSTRID.CHAR_VAL_TXT
    LEFT JOIN FT_T_ISID AS MTNREF 
        ON MTNREF.INSTR_ID = FT_T_ISSU.INSTR_ID 
       AND MTNREF.ID_CTXT_TYP = 'MZHMTNREF' 
       AND MTNREF.END_TMS IS NULL
    WHERE FT_T_TRID.INPUT_MSG_TYP = 'MTNASSETUNVALIDATED'
      AND FT_T_TRID.CREATED_TMS &gt; CURRENT_TIMESTAMP - INTERVAL '1 day'
    ORDER BY FT_T_TRID.CREATED_TMS ASC
) AS t
ORDER BY rec_sequence</objectValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="59" type="java.util.HashSet">
<item id="60" type="com.j2fe.workflow.definition.Transition">
<name id="61">goto-next</name>
<source id="62">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="63"/>
<directJoin>false</directJoin>
<name id="64">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="65">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="66" type="java.util.HashSet"/>
<targets id="67" type="java.util.HashSet">
<item idref="60" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="48"/>
</item>
</sources>
<targets id="68" type="java.util.HashSet">
<item id="69" type="com.j2fe.workflow.definition.Transition">
<name id="70">nothing-found</name>
<source idref="48"/>
<target id="71">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="72"/>
<directJoin>false</directJoin>
<name id="73">No Error</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="74">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="75" type="java.util.HashSet">
<item id="76" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="77">["Attachment"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="78">input["Attachment"]</name>
<objectValue id="79" type="java.lang.String">MTN_ISIN_Change_Report__from_GS_</objectValue>
<type>CONSTANT</type>
</item>
<item id="80" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="81">["CopyIn"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="82">input["CopyIn"]</name>
<stringValue id="83">CopyIn</stringValue>
<type>VARIABLE</type>
</item>
<item id="84" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="85">["EmailText"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="86">input["EmailText"]</name>
<objectValue id="87" type="java.lang.String">NO ISIN changes were made while processing MTNs in the last 24 hours. No need for investigation.</objectValue>
<type>CONSTANT</type>
</item>
<item id="88" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="89">["NoteText"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="90">input["NoteText"]</name>
<objectValue id="91" type="java.lang.String">"N.B. This is an automated e-mail. Please do not respond to this e-mail as this mailbox is not monitored. If you have questions about this message, please contact Global IT Apps &amp; Services Team (pur_in_gitcas@mizuho-sc.com)."</objectValue>
<type>CONSTANT</type>
</item>
<item id="92" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="93">["Recipients"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="94">input["Recipients"]</name>
<stringValue id="95">Recipients</stringValue>
<type>VARIABLE</type>
</item>
<item id="96" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="97">["Subject"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="98">input["Subject"]</name>
<objectValue id="99" type="java.lang.String">NO MTN ISIN changes were identified  while processing asset in the last 24 hours</objectValue>
<type>CONSTANT</type>
</item>
<item id="100" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="101">["sqlSelect"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="102">input["sqlSelect"]</name>
<objectValue id="103" type="java.lang.String">select x from (
select '"MTN Bond Ref","Instrument Name","Old ISIN","New ISIN","Changed Time"' x, 1 REC_SEQUENCE,sysdate() RPT_TIME from DUAL
union
select * from (select 
'"' || MTNREF.ISS_ID || '"' || ','  ||
'"' || FT_T_ISSU.PREF_ISS_NME || '"' || ',' ||
'"' || OLDISIN.CHAR_VAL_TXT || '"' || ',' ||
'"' || NEWISIN.CHAR_VAL_TXT  || '"' || ',' ||
'"' || TO_CHAR(FT_T_TRID.CREATED_TMS, 'Mon-DD-YYYY hh24:mi:ss') || '"' x, 2 REC_SEQUENCE, FT_T_TRID.CREATED_TMS RPT_TIME
from FT_T_TRID
inner join FT_T_NTEL INSTRID on INSTRID.TRN_ID = FT_T_TRID.TRN_ID and INSTRID.NOTFCN_ID = 50009 --and INSTRID.PARM_NME = 'instrId'
inner join FT_T_NTEL OLDISIN on OLDISIN.TRN_ID = FT_T_TRID.TRN_ID and OLDISIN.NOTFCN_ID = 50009 --and OLDISIN.PARM_NME = 'oldIsin'
inner join FT_T_NTEL NEWISIN on NEWISIN.TRN_ID = FT_T_TRID.TRN_ID and NEWISIN.NOTFCN_ID = 50009 --and NEWISIN.PARM_NME = 'oldIsin'
inner join FT_T_ISSU on FT_T_ISSU.INSTR_ID = INSTRID.CHAR_VAL_TXT
left join FT_T_ISID MTNREF on MTNREF.INSTR_ID = FT_T_ISSU.INSTR_ID and MTNREF.ID_CTXT_TYP = 'MZHMTNREF' and MTNREF.END_TMS is NULL
where FT_T_TRID.INPUT_MSG_TYP = 'MTNASSETUNVALIDATED' and FT_T_TRID.CREATED_TMS &gt; sysdate() - interval '1 day'
order by FT_T_TRID.CREATED_TMS asc)a)b
order by REC_SEQUENCE, RPT_TIME</objectValue>
<type>CONSTANT</type>
</item>
<item id="104" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="105">name</name>
<stringValue id="106">EmailExcelReport</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="107" type="java.util.HashSet">
<item idref="69" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="108" type="java.util.HashSet">
<item id="109" type="com.j2fe.workflow.definition.Transition">
<name id="110">goto-next</name>
<source idref="71"/>
<target idref="2"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item idref="46" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="9"/>
</item>
</sources>
<targets id="111" type="java.util.HashSet">
<item idref="7" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="2"/>
</item>
<item idref="109" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="112" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="113">Mizuho/Reports</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="114">user1</lastChangeUser>
<lastUpdate id="115">2025-12-02T05:56:06.000+0000</lastUpdate>
<name id="116">MZ_MTN_ISIN_Change_Report</name>
<nodes id="117" type="java.util.HashSet">
<item idref="48" type="com.j2fe.workflow.definition.Node"/>
<item idref="9" type="com.j2fe.workflow.definition.Node"/>
<item idref="71" type="com.j2fe.workflow.definition.Node"/>
<item idref="62" type="com.j2fe.workflow.definition.Node"/>
<item idref="2" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>true</optimize>
<parameter id="118" type="java.util.HashMap">
<entry>
<key id="119" type="java.lang.String">CopyIn</key>
<value id="120" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="121">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="122">Multiple addresses separated by ;</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="123" type="java.lang.String">Recipients</key>
<value id="124" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="125">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="126">Multiple addresses separated by ;</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
</parameter>
<permissions id="127" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>false</purgeAtEnd>
<retries>0</retries>
<startNode idref="62"/>
<status>RELEASED</status>
<variables id="128" type="java.util.HashMap">
<entry>
<key id="129" type="java.lang.String">CopyIn</key>
<value id="130" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="131">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="132">Multiple addresses separated by ;</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="133" type="java.lang.String">Recipients</key>
<value id="134" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="135">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="136">Multiple addresses separated by ;</description>
<persistent>false</persistent>
</value>
</entry>
</variables>
<version>12</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
