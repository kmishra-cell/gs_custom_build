<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<goldensource-package version="10.0.0.02">
    <package-comment/>
    <businessobject displayString="5 - V10_FinalTest" type="com.j2fe.workflow.definition.Workflow">
        <com.j2fe.workflow.definition.Workflow id="0">
            <alwaysPersist>false</alwaysPersist>
            <clustered>true</clustered>
            <comment id="1">V10_FinalTest</comment>
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
                            <name id="10">Create Report</name>
                            <nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
                            <nodeHandlerClass id="11">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
                            <parameters id="12" type="java.util.HashSet">
                                <item id="13" type="com.j2fe.workflow.definition.Parameter">
                                    <UITypeHint id="14">["Attachment"]@java/lang/String@</UITypeHint>
                                    <input>true</input>
                                    <name id="15">input["Attachment"]</name>
                                    <stringValue id="16">IssuerInternalRatingsReport</stringValue>
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
                                    <stringValue id="24">Please find attached the GoldenSource extract of all Internal Ratings for Issuers</stringValue>
                                    <type>CONSTANT</type>
                                </item>
                                <item id="25" type="com.j2fe.workflow.definition.Parameter">
                                    <UITypeHint id="26">["Recipients"]@java/lang/String@</UITypeHint>
                                    <input>true</input>
                                    <name id="27">input["Recipients"]</name>
                                    <stringValue id="28">Recipients</stringValue>
                                    <type>VARIABLE</type>
                                </item>
                                <item id="29" type="com.j2fe.workflow.definition.Parameter">
                                    <UITypeHint id="30">["Subject"]@java/lang/String@</UITypeHint>
                                    <input>true</input>
                                    <name id="31">input["Subject"]</name>
                                    <stringValue id="32">GoldenSource Issuer Internal Ratings Report</stringValue>
                                    <type>CONSTANT</type>
                                </item>
                                <item id="33" type="com.j2fe.workflow.definition.Parameter">
                                    <UITypeHint id="34">["sqlSelect"]@java/lang/String@</UITypeHint>
                                    <input>true</input>
                                    <name id="35">input["sqlSelect"]</name>
                                    <objectValue id="36" type="java.lang.String">SELECT '"CLIENTREF","BBCMPYID","Party Name","MHI Internal Rating","MHI Internal Effective Date","MHI Internal User","MHI Inventory","","MHSS Internal Rating","MHSS Internal Effective Date","MHSS Internal User","MHSS Inventory","","Derived Policy Rating","MHI v MHSS Conflict","S&amp;P LT Issuer Rating","Moodys LT Debt Rating","Fitch LT Issuer Default Rating","Japan Credit Rating"'&#13;
FROM dual&#13;
UNION ALL&#13;
SELECT&#13;
    '"' || COALESCE((&#13;
        SELECT irid.ISSR_ID FROM ft_t_irid irid &#13;
        WHERE irid.INSTR_ISSR_ID = issr.INSTR_ISSR_ID AND irid.end_tms IS NULL AND irid.ISSR_ID_CTXT_TYP = 'CLIENTREF' LIMIT 1&#13;
    ), '') || '","' || COALESCE((&#13;
        SELECT irid.ISSR_ID FROM ft_t_irid irid &#13;
        WHERE irid.INSTR_ISSR_ID = issr.INSTR_ISSR_ID AND irid.end_tms IS NULL AND irid.ISSR_ID_CTXT_TYP = 'BBCMPYID' LIMIT 1&#13;
    ), '') || '","' || COALESCE(issr.ISSR_NME, '')&#13;
    || '","' || COALESCE((&#13;
        SELECT firt.rtng_cde FROM ft_t_firt firt &#13;
        WHERE firt.INST_MNEM = fins.INST_MNEM AND firt.END_TMS IS NULL AND firt.SYS_EFF_END_TMS IS NULL &#13;
        AND firt.RTNG_EFF_TMS IS NOT NULL AND firt.RTNG_SET_OID = 'MIZRTNG7' LIMIT 1&#13;
    ), '') || '","' || COALESCE((&#13;
        SELECT TO_CHAR(firt.RTNG_EFF_TMS, 'DD-Mon-YY') FROM ft_t_firt firt &#13;
        WHERE firt.INST_MNEM = fins.INST_MNEM AND firt.END_TMS IS NULL AND firt.SYS_EFF_END_TMS IS NULL &#13;
        AND firt.RTNG_EFF_TMS IS NOT NULL AND firt.RTNG_SET_OID = 'MIZRTNG7' LIMIT 1&#13;
    ), '') || '","' || COALESCE((&#13;
        SELECT firt.LAST_CHG_USR_ID FROM ft_t_firt firt &#13;
        WHERE firt.INST_MNEM = fins.INST_MNEM AND firt.END_TMS IS NULL AND firt.SYS_EFF_END_TMS IS NULL &#13;
        AND firt.RTNG_EFF_TMS IS NOT NULL AND firt.RTNG_SET_OID = 'MIZRTNG7' LIMIT 1&#13;
    ), '') || '","' || (&#13;
        CASE &#13;
            WHEN EXISTS (&#13;
                SELECT 1 FROM FT_T_IRGP irgp &#13;
                WHERE irgp.INSTR_ISSR_ID = issr.INSTR_ISSR_ID AND irgp.end_tms IS NULL AND irgp.PRNT_ISSR_GRP_OID = 'IRGR000006'&#13;
            ) THEN 'Y' ELSE '' &#13;
        END&#13;
    ) || '",""' || '","' || COALESCE((&#13;
        SELECT firt.rtng_cde FROM ft_t_firt firt &#13;
        WHERE firt.INST_MNEM = fins.INST_MNEM AND firt.END_TMS IS NULL AND firt.SYS_EFF_END_TMS IS NULL &#13;
        AND firt.RTNG_EFF_TMS IS NOT NULL AND firt.RTNG_SET_OID = 'MIZRTNG8' LIMIT 1&#13;
    ), '') || '","' || COALESCE((&#13;
        SELECT TO_CHAR(firt.RTNG_EFF_TMS, 'DD-Mon-YY') FROM ft_t_firt firt &#13;
        WHERE firt.INST_MNEM = fins.INST_MNEM AND firt.END_TMS IS NULL AND firt.SYS_EFF_END_TMS IS NULL &#13;
        AND firt.RTNG_EFF_TMS IS NOT NULL AND firt.RTNG_SET_OID = 'MIZRTNG8' LIMIT 1&#13;
    ), '') || '","' || COALESCE((&#13;
        SELECT firt.LAST_CHG_USR_ID FROM ft_t_firt firt &#13;
        WHERE firt.INST_MNEM = fins.INST_MNEM AND firt.END_TMS IS NULL AND firt.SYS_EFF_END_TMS IS NULL &#13;
        AND firt.RTNG_EFF_TMS IS NOT NULL AND firt.RTNG_SET_OID = 'MIZRTNG8' LIMIT 1&#13;
    ), '') || '","' || (&#13;
        CASE &#13;
            WHEN EXISTS (&#13;
                SELECT 1 FROM FT_T_IRGP irgp &#13;
                WHERE irgp.INSTR_ISSR_ID = issr.INSTR_ISSR_ID AND irgp.end_tms IS NULL AND irgp.PRNT_ISSR_GRP_OID = 'IRGR000016'&#13;
            ) THEN 'Y' ELSE '' &#13;
        END&#13;
    ) || '",""' || '","' || COALESCE((&#13;
        SELECT firt.rtng_cde FROM ft_t_firt firt &#13;
        WHERE firt.INST_MNEM = fins.INST_MNEM AND firt.END_TMS IS NULL AND firt.SYS_EFF_END_TMS IS NULL &#13;
        AND firt.RTNG_EFF_TMS IS NOT NULL AND firt.RTNG_SET_OID = 'MIZRTNG3' LIMIT 1&#13;
    ), '') || '","' || (&#13;
        CASE &#13;
            WHEN COALESCE((SELECT rtng_cde FROM ft_t_firt WHERE INST_MNEM = fins.INST_MNEM AND END_TMS IS NULL AND SYS_EFF_END_TMS IS NULL AND RTNG_SET_OID = 'MIZRTNG7' LIMIT 1), '0') &#13;
               != COALESCE((SELECT rtng_cde FROM ft_t_firt WHERE INST_MNEM = fins.INST_MNEM AND END_TMS IS NULL AND SYS_EFF_END_TMS IS NULL AND RTNG_SET_OID = 'MIZRTNG8' LIMIT 1), '0')&#13;
               AND EXISTS (SELECT 1 FROM ft_t_firt WHERE INST_MNEM = fins.INST_MNEM AND END_TMS IS NULL AND SYS_EFF_END_TMS IS NULL AND RTNG_EFF_TMS IS NOT NULL AND RTNG_SET_OID = 'MIZRTNG7')&#13;
               AND EXISTS (SELECT 1 FROM ft_t_firt WHERE INST_MNEM = fins.INST_MNEM AND END_TMS IS NULL AND SYS_EFF_END_TMS IS NULL AND RTNG_EFF_TMS IS NOT NULL AND RTNG_SET_OID = 'MIZRTNG8')&#13;
        THEN 'Yes' ELSE '' &#13;
        END&#13;
    ) || '","' || COALESCE((&#13;
        -- S&amp;P&#13;
        SELECT RTNG_CDE FROM ft_t_firt firt WHERE firt.INST_MNEM = fins.INST_MNEM AND END_TMS IS NULL AND SYS_EFF_END_TMS IS NULL &#13;
        AND RTNG_EFF_TMS IS NOT NULL AND FINS_RTNG_OID = (&#13;
            SELECT FINS_RTNG_OID FROM ft_t_firt &#13;
            WHERE end_tms IS NULL AND SYS_EFF_END_TMS IS NULL AND RTNG_EFF_TMS IS NOT NULL AND INST_MNEM = fins.INST_MNEM &#13;
            AND RTNG_EFF_TMS = (&#13;
                SELECT MAX(RTNG_EFF_TMS) FROM ft_t_firt &#13;
                WHERE RTNG_SET_OID IN (&#13;
                    SELECT RTNG_SET_OID FROM ft_t_rtng WHERE RTNG_SET_MNEM IN ('126', '130') AND END_TMS IS NULL&#13;
                ) AND INST_MNEM = fins.INST_MNEM&#13;
            ) LIMIT 1&#13;
        ) LIMIT 1&#13;
    ), '') || '","' || COALESCE((&#13;
        -- Moody's&#13;
        SELECT RTNG_CDE FROM ft_t_firt firt WHERE firt.INST_MNEM = fins.INST_MNEM AND END_TMS IS NULL AND SYS_EFF_END_TMS IS NULL &#13;
        AND RTNG_EFF_TMS IS NOT NULL AND FINS_RTNG_OID = (&#13;
            SELECT FINS_RTNG_OID FROM ft_t_firt &#13;
            WHERE end_tms IS NULL AND SYS_EFF_END_TMS IS NULL AND RTNG_EFF_TMS IS NOT NULL AND INST_MNEM = fins.INST_MNEM &#13;
            AND RTNG_EFF_TMS = (&#13;
                SELECT MAX(RTNG_EFF_TMS) FROM ft_t_firt &#13;
                WHERE RTNG_SET_OID IN (&#13;
                    SELECT RTNG_SET_OID FROM ft_t_rtng WHERE RTNG_SET_MNEM IN ('534', '538', '545') AND END_TMS IS NULL&#13;
                ) AND INST_MNEM = fins.INST_MNEM&#13;
            ) LIMIT 1&#13;
        ) LIMIT 1&#13;
    ), '') || '","' || COALESCE((&#13;
        -- Fitch&#13;
        SELECT RTNG_CDE FROM ft_t_firt firt WHERE firt.INST_MNEM = fins.INST_MNEM AND END_TMS IS NULL AND SYS_EFF_END_TMS IS NULL &#13;
        AND RTNG_EFF_TMS IS NOT NULL AND FINS_RTNG_OID = (&#13;
            SELECT FINS_RTNG_OID FROM ft_t_firt &#13;
            WHERE end_tms IS NULL AND SYS_EFF_END_TMS IS NULL AND RTNG_EFF_TMS IS NOT NULL AND INST_MNEM = fins.INST_MNEM &#13;
            AND RTNG_EFF_TMS = (&#13;
                SELECT MAX(RTNG_EFF_TMS) FROM ft_t_firt &#13;
                WHERE RTNG_SET_OID IN (&#13;
                    SELECT RTNG_SET_OID FROM ft_t_rtng WHERE RTNG_SET_MNEM IN ('LTISRDRF') AND END_TMS IS NULL&#13;
                ) AND INST_MNEM = fins.INST_MNEM&#13;
            ) LIMIT 1&#13;
        ) LIMIT 1&#13;
    ), '') || '","' || COALESCE((&#13;
        -- Japan Credit Rating&#13;
        SELECT firt.RTNG_CDE FROM ft_t_firt firt &#13;
        WHERE firt.INST_MNEM = fins.INST_MNEM AND firt.END_TMS IS NULL &#13;
        AND firt.SYS_EFF_END_TMS IS NULL AND firt.RTNG_EFF_TMS IS NOT NULL &#13;
        AND firt.RTNG_SET_OID = '3000000006' LIMIT 1&#13;
    ), '') || '"'&#13;
FROM ft_t_issr issr &#13;
INNER JOIN ft_t_fins fins ON fins.inst_mnem = issr.FINS_INST_MNEM AND fins.END_TMS IS NULL&#13;
WHERE issr.END_TMS IS NULL&#13;
AND issr.FINS_INST_MNEM IN (&#13;
    SELECT DISTINCT inst_mnem &#13;
    FROM ft_t_firt &#13;
    WHERE END_TMS IS NULL AND RTNG_EFF_TMS IS NOT NULL AND SYS_EFF_END_TMS IS NULL &#13;
    AND RTNG_SET_OID IN ('MIZRTNG7', 'MIZRTNG8')&#13;
);&#13;
</objectValue>
                                    <type>CONSTANT</type>
                                </item>
                                <item id="37" type="com.j2fe.workflow.definition.Parameter">
                                    <input>true</input>
                                    <name id="38">name</name>
                                    <stringValue id="39">EmailExcelReport</stringValue>
                                    <type>CONSTANT</type>
                                </item>
                            </parameters>
                            <sources id="40" type="java.util.HashSet">
                                <item id="41" type="com.j2fe.workflow.definition.Transition">
                                    <name id="42">goto-next</name>
                                    <source id="43">
                                        <activation>INVOKE</activation>
                                        <clusteredCall>false</clusteredCall>
                                        <description idref="3"/>
                                        <directJoin>false</directJoin>
                                        <name id="44">Start</name>
                                        <nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
                                        <nodeHandlerClass id="45">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
                                        <sources id="46" type="java.util.HashSet"/>
                                        <targets id="47" type="java.util.HashSet">
                                            <item idref="41" type="com.j2fe.workflow.definition.Transition"/>
                                        </targets>
                                        <type>START</type>
                                    </source>
                                    <target idref="9"/>
                                </item>
                            </sources>
                            <targets id="48" type="java.util.HashSet">
                                <item idref="7" type="com.j2fe.workflow.definition.Transition"/>
                            </targets>
                            <type>ACTIVITY</type>
                        </source>
                        <target idref="2"/>
                    </item>
                </sources>
                <targets id="49" type="java.util.HashSet"/>
                <type>END</type>
            </endNode>
            <forcePurgeAtEnd>false</forcePurgeAtEnd>
            <group id="50">Mizuho/Reports</group>
            <haltOnError>false</haltOnError>
            <lastChangeUser id="51">user1</lastChangeUser>
            <lastUpdate id="52">2025-06-13T12:08:39.000+0000</lastUpdate>
            <name id="53">MZ_Internal_Ratings_Report</name>
            <nodes id="54" type="java.util.HashSet">
                <item idref="9" type="com.j2fe.workflow.definition.Node"/>
                <item idref="43" type="com.j2fe.workflow.definition.Node"/>
                <item idref="2" type="com.j2fe.workflow.definition.Node"/>
            </nodes>
            <optimize>true</optimize>
            <parameter id="55" type="java.util.HashMap">
                <entry>
                    <key id="56" type="java.lang.String">CopyIn</key>
                    <value id="57" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="58">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description id="59">Multiple addresses separated by ;</description>
                        <input>true</input>
                        <output>false</output>
                        <required>false</required>
                    </value>
                </entry>
                <entry>
                    <key id="60" type="java.lang.String">Recipients</key>
                    <value id="61" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="62">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description id="63">Multiple addresses separated by ;</description>
                        <input>true</input>
                        <output>false</output>
                        <required>true</required>
                    </value>
                </entry>
            </parameter>
            <permissions id="64" type="java.util.HashSet"/>
            <priority>50</priority>
            <purgeAtEnd>false</purgeAtEnd>
            <retries>0</retries>
            <startNode idref="43"/>
            <status>RELEASED</status>
            <variables id="65" type="java.util.HashMap">
                <entry>
                    <key id="66" type="java.lang.String">CopyIn</key>
                    <value id="67" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="68">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description id="69">Multiple addresses separated by ;</description>
                        <persistent>false</persistent>
                    </value>
                </entry>
                <entry>
                    <key id="70" type="java.lang.String">Recipients</key>
                    <value id="71" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="72">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description id="73">Multiple addresses separated by ;</description>
                        <persistent>false</persistent>
                    </value>
                </entry>
            </variables>
            <version>5</version>
        </com.j2fe.workflow.definition.Workflow>
    </businessobject>
</goldensource-package>
