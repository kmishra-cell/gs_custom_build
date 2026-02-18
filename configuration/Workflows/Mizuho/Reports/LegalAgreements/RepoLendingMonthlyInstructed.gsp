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
<objectValue id="17" type="java.lang.String">MonthlyRepoSecuritiesLendingInstructed</objectValue>
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
<objectValue id="25" type="java.lang.String">Please find attached your monthly Repo and Securities Lending Documents - Instructed Report</objectValue>
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
<objectValue id="33" type="java.lang.String">Repo and Securities Lending Documents - Instructed Report</objectValue>
<type>CONSTANT</type>
</item>
<item id="34" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="35">["sqlSelect"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="36">input["sqlSelect"]</name>
<objectValue id="37" type="java.lang.String">SELECT '"INSTITUTION NAME",' || '"AGREEMENT REF",' || '"DOCTYPE_VER",' || '"AGREEMENT INSTRUCT DATE",' || '"AGREEMENT SIGN DATE",' || '"AGREEMENT STATUS",' || '"SUPPORTING DOC NAME",' || '"SUPPORTING DOC",' || '"SUPPORTING DOC INSTRUCT DATE",' || '"SUPPORTING DOC SIGN DATE",' || '"SUPPORTING DOC STATUS",' || '"TRIPARTY NAME",' || '"TRIPARTY DOC NAME",' || '"TRIPARTY DOC INSTRUCT DATE",' || '"TRIPARTY DOC SIGN DATE"'
FROM (SELECT 1) AS dual
UNION ALL
SELECT 
  '"' || COALESCE(inst_nme, '') || '",'
  || '"' || COALESCE(agreement_ref, '') || '",'
  || '"' || COALESCE(doctype_ver, '') || '",'
  || '"' || COALESCE(agrmnt_negotn_instruc_dte::text, '') || '",'
  || '"' || COALESCE(agrmnt_sign_dte::text, '') || '",'
  || '"' || COALESCE(status, '') || '",'
  || '"' || COALESCE(doc_link, '') || '",'
  || '"' || COALESCE(amend_desc, '') || '",'
  || '"' || COALESCE(instruc_release_tms::text, '') || '",'
  || '"' || COALESCE(ver_amend_dte::text, '') || '",'
  || '"' || COALESCE(supportstatus, '') || '",'
  || '"' || COALESCE(triname, '') || '",'
  || '"' || COALESCE(tridocname, '') || '",'
  || '"' || COALESCE(tripartyinstruc::text, '') || '",'
  || '"' || COALESCE(sign_dte::text, '') || '"'
FROM (
    SELECT
        CASE
            WHEN INST_NME = LAG(INST_NME) OVER (ORDER BY INST_NME, DOCTYPE_VER) THEN NULL
            ELSE INST_NME
        END AS INST_NME,
        AGREEMENT_REF,
        DOCTYPE_VER,
        agrmnt_negotn_instruc_dte,
        AGRMNT_SIGN_DTE,
        STATUS,
        DOC_LINK,
        AMEND_DESC,
        INSTRUC_RELEASE_TMS,
        VER_AMEND_DTE,
        Supportstatus,
        Triname,
        tridocname,
        tripartyinstruc,
        SIGN_DTE
    FROM (
        SELECT
            fins.INST_NME,
            (SELECT legal_agrmnt_id
             FROM ft_t_laid
             WHERE LAGR_OID = lagr.LAGR_OID
               AND lagr_id_ctxt_typ = 'LEGREF') AS AGREEMENT_REF,
            idmv1.INTRNL_DMN_VAL_NME AS DOCTYPE_VER,
            lagr.agrmnt_negotn_instruc_dte,
            lagr.AGRMNT_SIGN_DTE,
            COALESCE(idmv2.INTRNL_DMN_VAL_NME, lagr.AGRMNT_STAT_TYP) AS STATUS,
            lav12.doc_link,
            lav12.amend_desc,
            lav12.instruc_release_tms,
            lav12.ver_amend_dte,
            lav12.agrmnt_stat_typ AS Supportstatus,
            fins1.inst_nme AS Triname,
            lav11.doc_link AS tridocname,
            lav11.instruc_release_tms AS tripartyinstruc,
            lav11.sign_dte
        FROM FT_T_LAGR lagr
        INNER JOIN FT_T_FLAR flar
            ON flar.ORG_ID = lagr.ORG_ID
            AND lagr.LAGR_OID = flar.LAGR_OID
            AND flar.RL_TYP = 'CPTY'
        INNER JOIN FT_T_FINS fins
            ON flar.INST_MNEM = fins.INST_MNEM
        LEFT JOIN ft_t_lav1 lav1
            ON lav1.LAGR_OID = lagr.LAGR_OID
        LEFT JOIN ft_t_lav1 lav12
            ON lav12.lav1_oid = lav1.lav1_oid
            AND lav12.flar_oid IS NULL
        LEFT JOIN FT_T_IDMV idmv1
            ON lagr.AGRMNT_TYP = idmv1.INTRNL_DMN_VAL_TXT
            AND idmv1.FLD_ID = '00000325'
        LEFT JOIN FT_T_IDMV idmv2
            ON lagr.AGRMNT_STAT_TYP = idmv2.INTRNL_DMN_VAL_TXT
            AND idmv2.FLD_ID = '00173418'
        LEFT JOIN ft_t_flar flar1
            ON flar1.flar_oid = lav1.Flar_oid
            AND flar1.rl_typ = 'TRI'
            AND flar1.end_tms IS NULL
        LEFT JOIN ft_t_fins fins1
            ON fins1.inst_mnem = flar1.inst_mnem
        LEFT JOIN ft_t_lav1 lav11
            ON lav11.flar_oid = flar1.flar_oid
            AND lav11.sign_dte IS NULL
        WHERE lagr.END_TMS IS NULL
		AND lagr.org_id = 'MHI'
          AND lagr.AGRMNT_TYP IN (
              'PSAISMA1995', 'TBMAISMA2000', 'TBMAISMA2011', 'MAFT', 'OSLA1995', 'GMSLA2000', 'GMSLA2010',
              'NEW', 'RAGA', 'PSAISMA1992', 'AFTB', 'TBMAISMA2000', 'PSA1987', 'PSA1996', 'NSBA', 'EMA2004',
              'MGSLA1996', 'MEFISLA1996', 'GENSAKI', 'EMA2001', 'TFA', 'MRA')
          AND (
              lagr.agrmnt_negotn_instruc_dte &gt;= sysdate() - INTERVAL '1 month'
              OR lav1.instruc_release_tms &gt;= sysdate() - INTERVAL '1 month'
              OR lav11.sign_dte &gt;= sysdate() - INTERVAL '1 month'
          )
        ORDER BY fins.INST_NME, idmv1.INTRNL_DMN_DESC ASC
    ) sub1
) sub2</objectValue>
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
<lastUpdate id="54">2025-12-04T17:55:21.000+0000</lastUpdate>
<name id="55">RepoLendingMonthlyInstructed</name>
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
