<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.07">
<package-comment/>
<businessobject displayString="12 - V10-QuerryCorrected_org_id_MHI" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>false</alwaysPersist>
<clustered>true</clustered>
<comment id="1">V10-QuerryCorrected_org_id_MHI</comment>
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
<objectValue id="17" type="java.lang.String">MonthlyIsdaReport</objectValue>
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
<objectValue id="25" type="java.lang.String">Please find attached your monthly ISDA Agreements Report</objectValue>
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
<objectValue id="33" type="java.lang.String">Monthly ISDA Agreement Report</objectValue>
<type>CONSTANT</type>
</item>
<item id="34" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="35">["sqlSelect"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="36">input["sqlSelect"]</name>
<objectValue id="37" type="java.lang.String">select '"Institution","Instructed","Approved","Doc Type/Version","Status","Version","Ver. Amendment Date"' , 1 as ordernum
union all
select * from (
    select concat(
    '"' , COALESCE(INST_NME, '') , '","'
        , COALESCE(agrmnt_negotn_instruc_dte::text, '') , '","'
        , COALESCE(AGRMNT_APRVL_DTE::text, '') , '","'
        , COALESCE(DOCTYPE_VER, '') , '","'
        , COALESCE(STATUS, '') , '","'
        , COALESCE(VERSION::text, '') , '","'
        , COALESCE(VER_AMEND_DTE::text, '') , '"') as value,
    2 as ordernum
    from (
        select
            case 
                when fins.INST_NME = lag(fins.INST_NME) over (order by fins.INST_NME, idmv1.INTRNL_DMN_VAL_NME, lav1.VERSION_NO) 
                then null
                else fins.INST_NME
            end as INST_NME,
            lagr.agrmnt_negotn_instruc_dte,
            lagr.AGRMNT_APRVL_DTE,
            idmv1.INTRNL_DMN_VAL_NME DOCTYPE_VER,
            case 
                when idmv2.INTRNL_DMN_VAL_NME is null 
                then lagr.AGRMNT_STAT_TYP 
                else idmv2.INTRNL_DMN_VAL_NME 
            end as STATUS,
            lav1.VERSION_NO VERSION,
            lav1.VER_AMEND_DTE
        from FT_T_LAGR as lagr
        inner join FT_T_FLAR as flar on flar.ORG_ID = lagr.ORG_ID and lagr.LAGR_OID = flar.LAGR_OID and flar.RL_TYP = 'CPTY'
        inner join FT_T_FINS as fins on flar.INST_MNEM = fins.INST_MNEM
        left join FT_T_IDMV as idmv1 on lagr.AGRMNT_TYP = idmv1.INTRNL_DMN_VAL_TXT and idmv1.FLD_ID = '00000325'
        left join FT_T_IDMV as idmv2 on lagr.AGRMNT_STAT_TYP = idmv2.INTRNL_DMN_VAL_TXT and idmv2.FLD_ID = '00173418'
        left join FT_T_LAV1 as lav1 on lagr.LAGR_OID = lav1.LAGR_OID and lagr.ORG_ID = lav1.ORG_ID and lav1.VER_AMEND_DTE is not null
        where lagr.AGRMNT_TYP like '%ISDA%' and lagr.END_TMS is null and lagr.org_id = 'MHI'
        order by fins.INST_NME, idmv1.INTRNL_DMN_VAL_NME, lav1.VERSION_NO asc
    ) as t1
) a 
where value is not null</objectValue>
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
<group id="52">Mizuho/Reports/LegalAgreements</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="53">user1</lastChangeUser>
<lastUpdate id="54">2025-12-04T17:45:21.000+0000</lastUpdate>
<name id="55">IsdaMonthly</name>
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
<purgeAtEnd>false</purgeAtEnd>
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
<version>12</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
