<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<goldensource-package version="10.0.0.02">
    <package-comment/>
    <businessobject displayString="4 - V10_FinalTest" type="com.j2fe.workflow.definition.Workflow">
        <com.j2fe.workflow.definition.Workflow id="0">
            <alwaysPersist>true</alwaysPersist>
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
                            <name id="10">Call Subworkflow</name>
                            <nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
                            <nodeHandlerClass id="11">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
                            <parameters id="12" type="java.util.HashSet">
                                <item id="13" type="com.j2fe.workflow.definition.Parameter">
                                    <UITypeHint id="14">["Attachment"]@java/lang/String@</UITypeHint>
                                    <input>true</input>
                                    <name id="15">input["Attachment"]</name>
                                    <stringValue id="16">MHSA_NoListing</stringValue>
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
                                    <stringValue id="24">Please find attached Multiple Listing report</stringValue>
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
                                    <stringValue id="32">MHILISTID without Listing for MHSA</stringValue>
                                    <type>CONSTANT</type>
                                </item>
                                <item id="33" type="com.j2fe.workflow.definition.Parameter">
                                    <UITypeHint id="34">["sqlSelect"]@java/lang/String@</UITypeHint>
                                    <input>true</input>
                                    <name id="35">input["sqlSelect"]</name>
                                    <objectValue id="36" type="java.lang.String">SELECT '"Type","ISO Country","BBGlobalCtry","IssueIdentifier","IdType","IssueName","MhiListingID","MhiListExch","BBGlobal","BBGlobalMarket","InstrID","MHI SOI"'&#13;
FROM dual&#13;
UNION ALL&#13;
SELECT &#13;
  '"' || COALESCE(issu.iss_typ, '') || '"'&#13;
  || ',"' || COALESCE(isgu.gu_id, '') || '"'&#13;
  || ',"' || COALESCE(mrkt.gu_id, '') || '"'&#13;
  || ',"' || COALESCE(issu.pref_iss_id, '') || '"'&#13;
  || ',"' || COALESCE(issu.pref_id_ctxt_typ, '') || '"'&#13;
  || ',"' || COALESCE(issu.pref_iss_nme, '') || '"'&#13;
  || ',"' || COALESCE(mhi.iss_id, '') || '"'&#13;
  || ',"No MARKET"'&#13;
  || ',"' || COALESCE(bb.iss_id, '') || '"'&#13;
  || ',"' || COALESCE(mrkt.mkt_nme, '') || '"'&#13;
  || ',"' || COALESCE(mhi.instr_id, '') || '"'&#13;
  || ',"' || COALESCE((&#13;
    SELECT 'MHI SOI'&#13;
    FROM ft_t_isgp&#13;
    WHERE instr_id = mhi.instr_id&#13;
      AND end_tms IS NULL&#13;
      AND prnt_iss_grp_oid IN ('ISGR000006', 'ISGR000014')&#13;
    LIMIT 1&#13;
  ), '') || '"'&#13;
FROM ft_t_isid mhi&#13;
INNER JOIN ft_t_issu issu&#13;
  ON mhi.instr_id = issu.instr_id&#13;
  AND issu.iss_typ NOT LIKE '%BOND%'&#13;
  AND mhi.id_ctxt_typ = 'MHILIST'&#13;
  AND mhi.mkt_oid = 'MKTMICXXXX'&#13;
  AND mhi.end_tms IS NULL&#13;
INNER JOIN ft_t_isgp isgp&#13;
  ON isgp.instr_id = mhi.instr_id&#13;
  AND isgp.prnt_iss_grp_oid = 'ISGR000013'&#13;
  AND isgp.end_tms IS NULL -- MHSA SOI&#13;
INNER JOIN ft_t_isid bb&#13;
  ON mhi.instr_id = bb.instr_id&#13;
  AND bb.id_ctxt_typ = 'BBGLOBAL'&#13;
  AND bb.end_tms IS NULL&#13;
INNER JOIN ft_t_mrkt mrkt&#13;
  ON bb.mkt_oid = mrkt.mkt_oid&#13;
LEFT JOIN ft_t_isgu isgu&#13;
  ON mhi.instr_id = isgu.instr_id&#13;
  AND isgu.end_tms IS NULL&#13;
  AND isgu.iss_gu_purp_typ = 'ISOCNTRY'</objectValue>
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
                                        <name id="44">Call Subworkflow</name>
                                        <nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
                                        <nodeHandlerClass id="45">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
                                        <parameters id="46" type="java.util.HashSet">
                                            <item id="47" type="com.j2fe.workflow.definition.Parameter">
                                                <UITypeHint id="48">["Attachment"]@java/lang/String@</UITypeHint>
                                                <input>true</input>
                                                <name id="49">input["Attachment"]</name>
                                                <stringValue id="50">MHSA_multipleListing</stringValue>
                                                <type>CONSTANT</type>
                                            </item>
                                            <item id="51" type="com.j2fe.workflow.definition.Parameter">
                                                <UITypeHint id="52">["CopyIn"]@java/lang/String@</UITypeHint>
                                                <input>true</input>
                                                <name id="53">input["CopyIn"]</name>
                                                <stringValue id="54">CopyIn</stringValue>
                                                <type>VARIABLE</type>
                                            </item>
                                            <item id="55" type="com.j2fe.workflow.definition.Parameter">
                                                <UITypeHint id="56">["EmailText"]@java/lang/String@</UITypeHint>
                                                <input>true</input>
                                                <name id="57">input["EmailText"]</name>
                                                <stringValue id="58">Please find attached Multiple Listing report</stringValue>
                                                <type>CONSTANT</type>
                                            </item>
                                            <item id="59" type="com.j2fe.workflow.definition.Parameter">
                                                <UITypeHint id="60">["Recipients"]@java/lang/String@</UITypeHint>
                                                <input>true</input>
                                                <name id="61">input["Recipients"]</name>
                                                <stringValue id="62">Recipients</stringValue>
                                                <type>VARIABLE</type>
                                            </item>
                                            <item id="63" type="com.j2fe.workflow.definition.Parameter">
                                                <UITypeHint id="64">["Subject"]@java/lang/String@</UITypeHint>
                                                <input>true</input>
                                                <name id="65">input["Subject"]</name>
                                                <stringValue id="66">Multiple Listing Report for MHSA</stringValue>
                                                <type>CONSTANT</type>
                                            </item>
                                            <item id="67" type="com.j2fe.workflow.definition.Parameter">
                                                <UITypeHint id="68">["sqlSelect"]@java/lang/String@</UITypeHint>
                                                <input>true</input>
                                                <name id="69">input["sqlSelect"]</name>
                                                <objectValue id="70" type="java.lang.String">SELECT '"Type","ListingCountry","IssueIdentifier","IssueName","BBGlobal","MhiListingID","InstrID","MHI SOI"' , 1 as ordernum&#13;
FROM dual&#13;
UNION all&#13;
select * from (&#13;
SELECT &#13;
  '"' || COALESCE(issu.iss_typ, '') &#13;
  || '","' || COALESCE(mrkt.gu_id, '') &#13;
  || '","' || COALESCE(issu.pref_iss_id, '') &#13;
  || '","' || COALESCE(issu.pref_iss_nme, '') &#13;
  || '","' || COALESCE(bbgl.iss_id, '') &#13;
  || '","' || COALESCE(string_agg(mhi.iss_id || '-' || mrkt.mkt_nme, ',  ' ORDER BY mhi.iss_id || '-' || mrkt.mkt_nme), '') &#13;
  || '","' || COALESCE(mhi.instr_id, '') &#13;
  || '","' || COALESCE((&#13;
      SELECT 'MHI SOI' &#13;
      FROM ft_t_isgp &#13;
      WHERE instr_id = mhi.instr_id AND end_tms IS NULL AND prnt_iss_grp_oid IN ('ISGR000006', 'ISGR000014') &#13;
      LIMIT 1&#13;
  ), '') &#13;
  || '"' AS value,&#13;
  2 AS ordernum&#13;
FROM ft_t_isid mhi&#13;
INNER JOIN ft_t_issu issu &#13;
  ON mhi.instr_id = issu.instr_id &#13;
  AND issu.end_tms IS NULL &#13;
  AND mhi.ID_CTXT_TYP = 'MHILIST' &#13;
  AND mhi.end_tms IS NULL&#13;
INNER JOIN ft_t_isgp isgp &#13;
  ON isgp.instr_id = mhi.instr_id &#13;
  AND isgp.prnt_iss_grp_oid = 'ISGR000013' &#13;
  AND isgp.end_tms IS NULL&#13;
INNER JOIN ft_t_mrkt mrkt &#13;
  ON mhi.mkt_oid = mrkt.mkt_oid &#13;
  AND mrkt.end_tms IS NULL&#13;
INNER JOIN (&#13;
  SELECT isid.instr_id, isid.mkt_oid, isid.iss_id, mrkt.gu_id&#13;
  FROM ft_t_isid isid&#13;
  INNER JOIN ft_t_mrkt mrkt &#13;
    ON isid.mkt_oid = mrkt.mkt_oid&#13;
  WHERE isid.id_ctxt_typ = 'BBGLOBAL' &#13;
    AND isid.end_tms IS NULL &#13;
    AND mrkt.end_tms IS NULL&#13;
) bbgl&#13;
  ON mhi.instr_id = bbgl.instr_id &#13;
  AND mrkt.gu_id = bbgl.gu_id &#13;
  AND mrkt.mkt_oid != bbgl.mkt_oid&#13;
WHERE mrkt.gu_id NOT IN ('HK', 'SG')&#13;
GROUP BY mrkt.gu_id, issu.pref_iss_id, issu.pref_iss_nme, mhi.instr_id, bbgl.iss_id, issu.iss_typ&#13;
HAVING COUNT(*) &gt; 1&#13;
) a &#13;
where value is not null;</objectValue>
                                                <type>CONSTANT</type>
                                            </item>
                                            <item id="71" type="com.j2fe.workflow.definition.Parameter">
                                                <input>true</input>
                                                <name id="72">name</name>
                                                <stringValue id="73">EmailExcelReport</stringValue>
                                                <type>CONSTANT</type>
                                            </item>
                                        </parameters>
                                        <sources id="74" type="java.util.HashSet">
                                            <item id="75" type="com.j2fe.workflow.definition.Transition">
                                                <name id="76">goto-next</name>
                                                <source id="77">
                                                    <activation>INVOKE</activation>
                                                    <clusteredCall>false</clusteredCall>
                                                    <description idref="3"/>
                                                    <directJoin>false</directJoin>
                                                    <name id="78">Start</name>
                                                    <nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
                                                    <nodeHandlerClass id="79">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
                                                    <sources id="80" type="java.util.HashSet"/>
                                                    <targets id="81" type="java.util.HashSet">
                                                        <item idref="75" type="com.j2fe.workflow.definition.Transition"/>
                                                    </targets>
                                                    <type>START</type>
                                                </source>
                                                <target idref="43"/>
                                            </item>
                                        </sources>
                                        <targets id="82" type="java.util.HashSet">
                                            <item idref="41" type="com.j2fe.workflow.definition.Transition"/>
                                        </targets>
                                        <type>ACTIVITY</type>
                                    </source>
                                    <target idref="9"/>
                                </item>
                            </sources>
                            <targets id="83" type="java.util.HashSet">
                                <item idref="7" type="com.j2fe.workflow.definition.Transition"/>
                            </targets>
                            <type>ACTIVITY</type>
                        </source>
                        <target idref="2"/>
                    </item>
                </sources>
                <targets id="84" type="java.util.HashSet"/>
                <type>END</type>
            </endNode>
            <forcePurgeAtEnd>false</forcePurgeAtEnd>
            <group id="85">Mizuho/Reports</group>
            <haltOnError>false</haltOnError>
            <lastChangeUser id="86">user1</lastChangeUser>
            <lastUpdate id="87">2025-06-13T08:59:14.000+0000</lastUpdate>
            <name id="88">MHSA_Report</name>
            <nodes id="89" type="java.util.HashSet">
                <item idref="9" type="com.j2fe.workflow.definition.Node"/>
                <item idref="43" type="com.j2fe.workflow.definition.Node"/>
                <item idref="77" type="com.j2fe.workflow.definition.Node"/>
                <item idref="2" type="com.j2fe.workflow.definition.Node"/>
            </nodes>
            <optimize>true</optimize>
            <parameter id="90" type="java.util.HashMap">
                <entry>
                    <key id="91" type="java.lang.String">CopyIn</key>
                    <value id="92" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="93">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description id="94">Multiple addresses separated by ;</description>
                        <input>true</input>
                        <output>false</output>
                        <required>false</required>
                    </value>
                </entry>
                <entry>
                    <key id="95" type="java.lang.String">Recipients</key>
                    <value id="96" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="97">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description id="98">Multiple addresses separated by ;</description>
                        <input>true</input>
                        <output>false</output>
                        <required>true</required>
                    </value>
                </entry>
            </parameter>
            <permissions id="99" type="java.util.HashSet"/>
            <priority>50</priority>
            <purgeAtEnd>false</purgeAtEnd>
            <retries>0</retries>
            <startNode idref="77"/>
            <status>RELEASED</status>
            <variables id="100" type="java.util.HashMap">
                <entry>
                    <key id="101" type="java.lang.String">CopyIn</key>
                    <value id="102" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="103">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description id="104">Multiple addresses separated by ;</description>
                        <persistent>false</persistent>
                    </value>
                </entry>
                <entry>
                    <key id="105" type="java.lang.String">Recipients</key>
                    <value id="106" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="107">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description id="108">Multiple addresses separated by ;</description>
                        <persistent>false</persistent>
                    </value>
                </entry>
            </variables>
            <version>4</version>
        </com.j2fe.workflow.definition.Workflow>
    </businessobject>
</goldensource-package>
