<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<goldensource-package version="10.0.0.02">
    <package-comment/>
    <businessobject displayString="9 - V10_TestFinal" type="com.j2fe.workflow.definition.Workflow">
        <com.j2fe.workflow.definition.Workflow id="0">
            <alwaysPersist>false</alwaysPersist>
            <clustered>true</clustered>
            <comment id="1">V10_TestFinal</comment>
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
                                    <stringValue id="16">Report_Assets_locked_24hrs_</stringValue>
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
                                    <stringValue id="24">"The reported assets have been locked in last 24 hrs."</stringValue>
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
                                    <stringValue id="32">SubjectOut</stringValue>
                                    <type>VARIABLE</type>
                                </item>
                                <item id="33" type="com.j2fe.workflow.definition.Parameter">
                                    <UITypeHint id="34">["sqlSelect"]@java/lang/String@</UITypeHint>
                                    <input>true</input>
                                    <name id="35">input["sqlSelect"]</name>
                                    <objectValue id="36" type="java.lang.String">&#13;
SELECT '"MIZUHO","ISIN","SOI_LIST"', 1 as ordernum&#13;
UNION ALL&#13;
SELECT DISTINCT &#13;
       '"' || COALESCE(MIZUHO, '') || '","' || &#13;
             COALESCE(ISIN, '') || '","' || &#13;
             COALESCE(SOI_LIST, '') || '"', &#13;
       2 as ordernum&#13;
FROM(&#13;
	SELECT MIZUHO, ISIN, SOI_LIST&#13;
  	from(&#13;
  		SELECT &#13;
  			DISTINCT miz.iss_id as MIZUHO, &#13;
  			isin.iss_id as ISIN, &#13;
  			miz.instr_id&#13;
		FROM(&#13;
			SELECT * FROM ft_t_isid WHERE ID_CTXT_TYP = 'MIZUHO' AND end_tms IS null&#13;
			) as miz&#13;
		LEFT join (&#13;
			SELECT * FROM ft_t_isid WHERE ID_CTXT_TYP IN ('ISIN') AND end_tms IS null&#13;
    		) as isin ON miz.instr_id=isin.instr_id&#13;
    	INNER JOIN ft_t_isgp as isgp ON miz.instr_id=isgp.instr_id&#13;
    		WHERE isgp.prt_purp_typ = 'INTEREST'&#13;
    		AND isgp.end_tms IS NULL&#13;
    		AND exists (SELECT 'X'&#13;
      						FROM ft_t_ovrc as ovrc WHERE ovrc.ovr_ref_oid = miz.instr_id&#13;
      						AND ovrc.end_tms IS NULL&#13;
      						AND ovrc.start_tms &gt; (CURRENT_DATE - &#13;
        						CASE WHEN EXTRACT(DOW FROM CURRENT_DATE) = 1 THEN INTERVAL '3 days' ELSE INTERVAL '1 day' END)&#13;
					)&#13;
		) as sub2&#13;
  		LEFT join (&#13;
  			SELECT &#13;
  				univ.instr_id,&#13;
      			string_agg(univ.grp_nme, ';' order by instr_id, grp_nme) as SOI_LIST &#13;
    		FROM(&#13;
    			SELECT &#13;
    				isgp.instr_id,&#13;
        			isgr.grp_nme&#13;
      			FROM ft_t_isgp as isgp&#13;
      				INNER JOIN ft_t_isgr as isgr ON isgp.prnt_iss_grp_oid = isgr.iss_grp_oid&#13;
      			WHERE isgp.end_tms      IS NULL&#13;
      				AND isgr.grp_nme LIKE 'M%'&#13;
      			) as univ group by univ.instr_id&#13;
    		) as soi ON sub2.instr_id = soi.instr_id&#13;
  		) as t1&#13;
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
                                        <name id="44">Database Select (Standard)</name>
                                        <nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
                                        <nodeHandlerClass id="45">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
                                        <parameters id="46" type="java.util.HashSet">
                                            <item id="47" type="com.j2fe.workflow.definition.Parameter">
                                                <input>true</input>
                                                <name id="48">database</name>
                                                <stringValue id="49">jdbc/GSDM-1</stringValue>
                                                <type>REFERENCE</type>
                                            </item>
                                            <item id="50" type="com.j2fe.workflow.definition.Parameter">
                                                <UITypeHint id="51">[0]@java/lang/String@</UITypeHint>
                                                <input>false</input>
                                                <name id="52">firstColumnsResult[0]</name>
                                                <stringValue id="53">SubjectOut</stringValue>
                                                <type>VARIABLE</type>
                                            </item>
                                            <item id="54" type="com.j2fe.workflow.definition.Parameter">
                                                <input>true</input>
                                                <name id="55">querySQL</name>
                                                <stringValue id="56">select 'Reports of Assets Locked in GS in the 24 hours as of'|| ' ' || to_char(sysdate(),'DD/MON/YYYY') from dual</stringValue>
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
                                                <target idref="43"/>
                                            </item>
                                        </sources>
                                        <targets id="65" type="java.util.HashSet">
                                            <item idref="41" type="com.j2fe.workflow.definition.Transition"/>
                                        </targets>
                                        <type>ACTIVITY</type>
                                    </source>
                                    <target idref="9"/>
                                </item>
                            </sources>
                            <targets id="66" type="java.util.HashSet">
                                <item idref="7" type="com.j2fe.workflow.definition.Transition"/>
                            </targets>
                            <type>ACTIVITY</type>
                        </source>
                        <target idref="2"/>
                    </item>
                </sources>
                <targets id="67" type="java.util.HashSet"/>
                <type>END</type>
            </endNode>
            <forcePurgeAtEnd>false</forcePurgeAtEnd>
            <group id="68">Mizuho/Reports</group>
            <haltOnError>false</haltOnError>
            <lastChangeUser id="69">user1</lastChangeUser>
            <lastUpdate id="70">2025-06-10T06:22:26.000+0000</lastUpdate>
            <name id="71">MZ_24_Asset_Lock_Report</name>
            <nodes id="72" type="java.util.HashSet">
                <item idref="9" type="com.j2fe.workflow.definition.Node"/>
                <item idref="43" type="com.j2fe.workflow.definition.Node"/>
                <item idref="60" type="com.j2fe.workflow.definition.Node"/>
                <item idref="2" type="com.j2fe.workflow.definition.Node"/>
            </nodes>
            <optimize>true</optimize>
            <parameter id="73" type="java.util.HashMap">
                <entry>
                    <key id="74" type="java.lang.String">CopyIn</key>
                    <value id="75" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="76">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description id="77">Multiple addresses separated by ;</description>
                        <input>true</input>
                        <output>false</output>
                        <required>false</required>
                    </value>
                </entry>
                <entry>
                    <key id="78" type="java.lang.String">Recipients</key>
                    <value id="79" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="80">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description id="81">Multiple addresses separated by ;</description>
                        <input>true</input>
                        <output>false</output>
                        <required>true</required>
                    </value>
                </entry>
            </parameter>
            <permissions id="82" type="java.util.HashSet"/>
            <priority>50</priority>
            <purgeAtEnd>false</purgeAtEnd>
            <retries>0</retries>
            <startNode idref="60"/>
            <status>RELEASED</status>
            <variables id="83" type="java.util.HashMap">
                <entry>
                    <key id="84" type="java.lang.String">CopyIn</key>
                    <value id="85" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="86">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description id="87">Multiple addresses separated by ;</description>
                        <persistent>false</persistent>
                    </value>
                </entry>
                <entry>
                    <key id="88" type="java.lang.String">Recipients</key>
                    <value id="89" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="90">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description id="91">Multiple addresses separated by ;</description>
                        <persistent>false</persistent>
                    </value>
                </entry>
                <entry>
                    <key id="92" type="java.lang.String">SubDefault</key>
                    <value id="93" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="94">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <persistent>false</persistent>
                        <value id="95" type="java.lang.String">Reports of Assets Locked in GS in the 24 hours as of</value>
                    </value>
                </entry>
            </variables>
            <version>9</version>
        </com.j2fe.workflow.definition.Workflow>
    </businessobject>
</goldensource-package>
