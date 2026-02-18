<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.07">
<package-comment/>
<businessobject displayString="10 - V10-Concat_Query_Corrected" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>true</alwaysPersist>
<clustered>true</clustered>
<comment id="1">V10-Concat_Query_Corrected</comment>
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
<name id="11">Call Subworkflow</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="12">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="13" type="java.util.HashSet">
<item id="14" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="15">["Attachment"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="16">input["Attachment"]</name>
<objectValue id="17" type="java.lang.String">NewISINChange</objectValue>
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
<objectValue id="25" type="java.lang.String">Please find attached new ISIN change report</objectValue>
<type>CONSTANT</type>
</item>
<item id="26" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="27">["Recipients"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="28">input["Recipients"]</name>
<stringValue id="29">Recipients</stringValue>
<type>VARIABLE</type>
</item>
<item id="30" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="31">["Subject"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="32">input["Subject"]</name>
<objectValue id="33" type="java.lang.String">New ISIN Change Report</objectValue>
<type>CONSTANT</type>
</item>
<item id="34" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="35">["sqlSelect"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="36">input["sqlSelect"]</name>
<objectValue id="37" type="java.lang.String">SELECT '"MIZUHO ID","Issue Name","Active ISIN","Active ISIN Start_Tms","Old ISIN","Old ISIN Start_Tms","Old ISIN End_Tms","MHI Listing IDs and Markets","BBGlobal IDs and Markets"'
FROM dual -- Note: 'dual' is not standard in PostgreSQL, but often tolerated or replaced with a SELECT
UNION ALL
SELECT
    CONCAT(
        '"', MIZUHO.ISS_ID,
        '","', ISSUE.PREF_ISS_NME,
        '","', ISIN.ISS_ID,
        '","', ISIN.START_TMS,
        '","', OLD_ISIN.ISS_ID,
        '","', OLD_ISIN.START_TMS,
        '","', OLD_ISIN.END_TMS,
        '","',
        STRING_AGG(CASE
            WHEN IDS.id_ctxt_typ = 'MHILIST' THEN IDS.iss_id || ' (' || MARKET.mkt_nme || ') '
            END, ', ' ORDER BY IDS.iss_id || ' ' || MARKET.mkt_nme),
        '","',
        STRING_AGG(CASE
            WHEN IDS.id_ctxt_typ = 'BBGLOBAL' THEN IDS.iss_id || ' (' || MARKET.mkt_nme || ') '
            END, ', ' ORDER BY IDS.iss_id || ' ' || MARKET.mkt_nme),
        '"'
    )
FROM ft_t_isid ISIN
INNER JOIN ft_t_isid MIZUHO
    ON MIZUHO.INSTR_ID = ISIN.INSTR_ID
    AND MIZUHO.END_TMS IS NULL
    AND MIZUHO.ID_CTXT_TYP = 'MIZUHO'
INNER JOIN ft_t_issu ISSUE
    ON ISSUE.INSTR_ID = ISIN.INSTR_ID
INNER JOIN ft_t_isid OLD_ISIN
    ON OLD_ISIN.INSTR_ID = ISIN.INSTR_ID
    AND OLD_ISIN.ID_CTXT_TYP = 'ISIN'
    AND OLD_ISIN.ISS_ID  != ISIN.ISS_ID
    -- PostgreSQL syntax for interval is correct in the original query
    AND OLD_ISIN.LAST_CHG_TMS &gt; NOW() - INTERVAL '4 days'
LEFT JOIN ft_t_isid IDS
    ON IDS.INSTR_ID = ISIN.INSTR_ID
    AND IDS.id_ctxt_typ IN ('MHILIST', 'BBGLOBAL')
    AND IDS.END_TMS IS NULL
LEFT JOIN ft_t_mrkt MARKET
    ON IDS.mkt_oid = MARKET.mkt_oid
WHERE ISIN.ID_CTXT_TYP = 'ISIN'
    AND ISIN.END_TMS IS NULL
    AND ISIN.LAST_CHG_TMS &gt; NOW() - INTERVAL '4 days'
GROUP BY MIZUHO.ISS_ID, ISSUE.PREF_ISS_NME, ISIN.ISS_ID, ISIN.START_TMS, OLD_ISIN.ISS_ID, OLD_ISIN.START_TMS, OLD_ISIN.END_TMS</objectValue>
<type>CONSTANT</type>
</item>
<item id="38" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="39">name</name>
<stringValue id="40">EmailExcelReport</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="41" type="java.util.HashSet">
<item id="42" type="com.j2fe.workflow.definition.Transition">
<name id="43">goto-next</name>
<source id="44">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="45"/>
<directJoin>false</directJoin>
<name id="46">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="47">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="48" type="java.util.HashSet"/>
<targets id="49" type="java.util.HashSet">
<item idref="42" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="9"/>
</item>
</sources>
<targets id="50" type="java.util.HashSet">
<item idref="7" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="2"/>
</item>
</sources>
<targets id="51" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="52">Mizuho/Reports</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="53">user1</lastChangeUser>
<lastUpdate id="54">2025-11-28T23:42:32.000+0000</lastUpdate>
<name id="55">ISINChange</name>
<nodes id="56" type="java.util.HashSet">
<item idref="9" type="com.j2fe.workflow.definition.Node"/>
<item idref="44" type="com.j2fe.workflow.definition.Node"/>
<item idref="2" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>true</optimize>
<parameter id="57" type="java.util.HashMap">
<entry>
<key id="58" type="java.lang.String">CopyIn</key>
<value id="59" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="60">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="61">Multiple addresses separated by ;</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="62" type="java.lang.String">Recipients</key>
<value id="63" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="64">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="65">Multiple addresses separated by ;</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
</parameter>
<permissions id="66" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>true</purgeAtEnd>
<retries>0</retries>
<startNode idref="44"/>
<status>RELEASED</status>
<variables id="67" type="java.util.HashMap">
<entry>
<key id="68" type="java.lang.String">CopyIn</key>
<value id="69" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="70">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="71">Multiple addresses separated by ;</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="72" type="java.lang.String">Recipients</key>
<value id="73" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="74">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="75">Multiple addresses separated by ;</description>
<persistent>false</persistent>
</value>
</entry>
</variables>
<version>10</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
