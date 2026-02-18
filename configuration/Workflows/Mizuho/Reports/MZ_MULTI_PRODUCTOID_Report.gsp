<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<goldensource-package version="10.0.0.02">
    <package-comment/>
    <businessobject displayString="5 - V10_FinalTest" type="com.j2fe.workflow.definition.Workflow">
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
                            <name id="10">Found</name>
                            <nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
                            <nodeHandlerClass id="11">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
                            <parameters id="12" type="java.util.HashSet">
                                <item id="13" type="com.j2fe.workflow.definition.Parameter">
                                    <UITypeHint id="14">["Attachment"]@java/lang/String@</UITypeHint>
                                    <input>true</input>
                                    <name id="15">input["Attachment"]</name>
                                    <stringValue id="16">MULTIPLE_PROD_OID_ON_Asset</stringValue>
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
                                    <stringValue id="24">Please find attached Assets with multiple PRODUCTOID.</stringValue>
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
                                    <stringValue id="32">Multiple PRODUCTOID on single Asset list</stringValue>
                                    <type>CONSTANT</type>
                                </item>
                                <item id="33" type="com.j2fe.workflow.definition.Parameter">
                                    <UITypeHint id="34">["sqlSelect"]@java/lang/String@</UITypeHint>
                                    <input>true</input>
                                    <name id="35">input["sqlSelect"]</name>
                                    <stringValue id="36">&#13;
select '"Product OID","Product OID Creation Date","Issue Name","Pref Issue Id","Pref Issue Id Type","MHILIST ID"'&#13;
, 1 ordernum FROM DUAL&#13;
union all&#13;
&#13;
select distinct  '"'||poid.iss_id ||'","'|| poid.start_tms||'","'||issu.pref_iss_nme ||'","'|| issu.pref_iss_id ||'","'|| issu.pref_id_ctxt_typ ||'","'|| MHIL.iss_id  ||'"', 2 ordernum &#13;
from &#13;
(select instr_id from ft_t_isid &#13;
where id_ctxt_typ ='PRODUCTOID' &#13;
and end_tms is null&#13;
group by instr_id&#13;
having count(*) &gt; 1&#13;
) M_POID&#13;
join ft_t_isid poid&#13;
on  M_POID.instr_id = poid.instr_id &#13;
and poid.id_ctxt_typ ='PRODUCTOID' &#13;
and poid.end_tms is null&#13;
join ft_t_issu issu&#13;
on  M_POID.instr_id = issu.instr_id &#13;
left join ft_t_isid mhil&#13;
on  M_POID.instr_id = mhil.instr_id &#13;
and mhil.id_ctxt_typ ='MHILIST' &#13;
and mhil.end_tms is null&#13;
&#13;
order by ordernum&#13;
</stringValue>
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
                                    <name id="42">rows-found</name>
                                    <source id="43">
                                        <activation>INVOKE</activation>
                                        <clusteredCall>false</clusteredCall>
                                        <description idref="3"/>
                                        <directJoin>false</directJoin>
                                        <name id="44">Database Select (Xor Split)</name>
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
                                                <input>true</input>
                                                <name id="51">querySQL</name>
                                                <stringValue id="52">select distinct  '"'||poid.iss_id ||'","'|| poid.start_tms||'","'||issu.pref_iss_nme ||'","'|| issu.pref_iss_id ||'","'|| issu.pref_id_ctxt_typ ||'","'|| MHIL.iss_id  ||'"', 2 ordernum &#13;
from &#13;
(select instr_id from ft_t_isid &#13;
where id_ctxt_typ ='PRODUCTOID' &#13;
and end_tms is null&#13;
group by instr_id&#13;
having count(*) &gt; 1&#13;
) M_POID&#13;
join ft_t_isid poid&#13;
on  M_POID.instr_id = poid.instr_id &#13;
and poid.id_ctxt_typ ='PRODUCTOID' &#13;
and poid.end_tms is null&#13;
join ft_t_issu issu&#13;
on  M_POID.instr_id = issu.instr_id &#13;
left join ft_t_isid mhil&#13;
on  M_POID.instr_id = mhil.instr_id &#13;
and mhil.id_ctxt_typ ='MHILIST' &#13;
and mhil.end_tms is null</stringValue>
                                                <type>CONSTANT</type>
                                            </item>
                                        </parameters>
                                        <sources id="53" type="java.util.HashSet">
                                            <item id="54" type="com.j2fe.workflow.definition.Transition">
                                                <name id="55">goto-next</name>
                                                <source id="56">
                                                    <activation>INVOKE</activation>
                                                    <clusteredCall>false</clusteredCall>
                                                    <description idref="3"/>
                                                    <directJoin>false</directJoin>
                                                    <name id="57">Start</name>
                                                    <nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
                                                    <nodeHandlerClass id="58">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
                                                    <sources id="59" type="java.util.HashSet"/>
                                                    <targets id="60" type="java.util.HashSet">
                                                        <item idref="54" type="com.j2fe.workflow.definition.Transition"/>
                                                    </targets>
                                                    <type>START</type>
                                                </source>
                                                <target idref="43"/>
                                            </item>
                                        </sources>
                                        <targets id="61" type="java.util.HashSet">
                                            <item id="62" type="com.j2fe.workflow.definition.Transition">
                                                <name id="63">nothing-found</name>
                                                <source idref="43"/>
                                                <target id="64">
                                                    <activation>INVOKE</activation>
                                                    <clusteredCall>false</clusteredCall>
                                                    <description idref="3"/>
                                                    <directJoin>false</directJoin>
                                                    <name id="65">Not Found</name>
                                                    <nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
                                                    <nodeHandlerClass id="66">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
                                                    <parameters id="67" type="java.util.HashSet">
                                                        <item id="68" type="com.j2fe.workflow.definition.Parameter">
                                                            <UITypeHint id="69">["Attachment"]@java/lang/String@</UITypeHint>
                                                            <input>true</input>
                                                            <name id="70">input["Attachment"]</name>
                                                            <stringValue id="71">MULTIPLE_PROD_OID_ON_Asset</stringValue>
                                                            <type>CONSTANT</type>
                                                        </item>
                                                        <item id="72" type="com.j2fe.workflow.definition.Parameter">
                                                            <UITypeHint id="73">["CopyIn"]@java/lang/String@</UITypeHint>
                                                            <input>true</input>
                                                            <name id="74">input["CopyIn"]</name>
                                                            <stringValue id="75">CopyIn</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                        <item id="76" type="com.j2fe.workflow.definition.Parameter">
                                                            <UITypeHint id="77">["EmailText"]@java/lang/String@</UITypeHint>
                                                            <input>true</input>
                                                            <name id="78">input["EmailText"]</name>
                                                            <stringValue id="79">(NO ISSUES) Please find attached Assets with multiple PRODUCTOID.</stringValue>
                                                            <type>CONSTANT</type>
                                                        </item>
                                                        <item id="80" type="com.j2fe.workflow.definition.Parameter">
                                                            <UITypeHint id="81">["NoteText"]@java/lang/String@</UITypeHint>
                                                            <input>true</input>
                                                            <name id="82">input["NoteText"]</name>
                                                            <stringValue id="83">"N.B. This is an automated e-mail. Please do not respond to this e-mail as this mailbox is not monitored. If you have questions about this message, please contact Global IT Apps &amp; Services Team (pur_in_gitcas@mizuho-sc.com)."</stringValue>
                                                            <type>CONSTANT</type>
                                                        </item>
                                                        <item id="84" type="com.j2fe.workflow.definition.Parameter">
                                                            <UITypeHint id="85">["Recipients"]@java/lang/String@</UITypeHint>
                                                            <input>true</input>
                                                            <name id="86">input["Recipients"]</name>
                                                            <stringValue id="87">Recipients</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                        <item id="88" type="com.j2fe.workflow.definition.Parameter">
                                                            <UITypeHint id="89">["Subject"]@java/lang/String@</UITypeHint>
                                                            <input>true</input>
                                                            <name id="90">input["Subject"]</name>
                                                            <stringValue id="91">(NO ISSUES) Multiple PRODUCTOID on single Asset list</stringValue>
                                                            <type>CONSTANT</type>
                                                        </item>
                                                        <item id="92" type="com.j2fe.workflow.definition.Parameter">
                                                            <UITypeHint id="93">["sqlSelect"]@java/lang/String@</UITypeHint>
                                                            <input>true</input>
                                                            <name id="94">input["sqlSelect"]</name>
                                                            <stringValue id="95">&#13;
select '"Product OID","Product OID Creation Date","Issue Name","Pref Issue Id","Pref Issue Id Type","MHILIST ID"'&#13;
, 1 ordernum FROM DUAL&#13;
union all&#13;
&#13;
select distinct  '"'||poid.iss_id ||'","'|| poid.start_tms||'","'||issu.pref_iss_nme ||'","'|| issu.pref_iss_id ||'","'|| issu.pref_id_ctxt_typ ||'","'|| MHIL.iss_id  ||'"', 2 ordernum &#13;
from &#13;
(select instr_id from ft_t_isid &#13;
where id_ctxt_typ ='PRODUCTOID' &#13;
and end_tms is null&#13;
group by instr_id&#13;
having count(*) &gt; 1&#13;
) M_POID&#13;
join ft_t_isid poid&#13;
on  M_POID.instr_id = poid.instr_id &#13;
and poid.id_ctxt_typ ='PRODUCTOID' &#13;
and poid.end_tms is null&#13;
join ft_t_issu issu&#13;
on  M_POID.instr_id = issu.instr_id &#13;
left join ft_t_isid mhil&#13;
on  M_POID.instr_id = mhil.instr_id &#13;
and mhil.id_ctxt_typ ='MHILIST' &#13;
and mhil.end_tms is null&#13;
&#13;
order by ordernum&#13;
</stringValue>
                                                            <type>CONSTANT</type>
                                                        </item>
                                                        <item id="96" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="97">name</name>
                                                            <stringValue id="98">EmailExcelReport</stringValue>
                                                            <type>CONSTANT</type>
                                                        </item>
                                                    </parameters>
                                                    <sources id="99" type="java.util.HashSet">
                                                        <item idref="62" type="com.j2fe.workflow.definition.Transition"/>
                                                    </sources>
                                                    <targets id="100" type="java.util.HashSet">
                                                        <item id="101" type="com.j2fe.workflow.definition.Transition">
                                                            <name id="102">goto-next</name>
                                                            <source idref="64"/>
                                                            <target idref="2"/>
                                                        </item>
                                                    </targets>
                                                    <type>ACTIVITY</type>
                                                </target>
                                            </item>
                                            <item idref="41" type="com.j2fe.workflow.definition.Transition"/>
                                        </targets>
                                        <type>XORSPLIT</type>
                                    </source>
                                    <target idref="9"/>
                                </item>
                            </sources>
                            <targets id="103" type="java.util.HashSet">
                                <item idref="7" type="com.j2fe.workflow.definition.Transition"/>
                            </targets>
                            <type>ACTIVITY</type>
                        </source>
                        <target idref="2"/>
                    </item>
                    <item idref="101" type="com.j2fe.workflow.definition.Transition"/>
                </sources>
                <targets id="104" type="java.util.HashSet"/>
                <type>END</type>
            </endNode>
            <forcePurgeAtEnd>false</forcePurgeAtEnd>
            <group id="105">Mizuho/Reports</group>
            <haltOnError>false</haltOnError>
            <lastChangeUser id="106">user1</lastChangeUser>
            <lastUpdate id="107">2025-06-13T12:39:48.000+0000</lastUpdate>
            <name id="108">MZ_MULTI_PRODUCTOID_Report</name>
            <nodes id="109" type="java.util.HashSet">
                <item idref="43" type="com.j2fe.workflow.definition.Node"/>
                <item idref="9" type="com.j2fe.workflow.definition.Node"/>
                <item idref="64" type="com.j2fe.workflow.definition.Node"/>
                <item idref="56" type="com.j2fe.workflow.definition.Node"/>
                <item idref="2" type="com.j2fe.workflow.definition.Node"/>
            </nodes>
            <optimize>true</optimize>
            <parameter id="110" type="java.util.HashMap">
                <entry>
                    <key id="111" type="java.lang.String">CopyIn</key>
                    <value id="112" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="113">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description id="114">Multiple addresses separated by ;</description>
                        <input>true</input>
                        <output>false</output>
                        <required>false</required>
                    </value>
                </entry>
                <entry>
                    <key id="115" type="java.lang.String">Recipients</key>
                    <value id="116" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="117">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description id="118">Multiple addresses separated by ;</description>
                        <input>true</input>
                        <output>false</output>
                        <required>true</required>
                    </value>
                </entry>
            </parameter>
            <permissions id="119" type="java.util.HashSet"/>
            <priority>50</priority>
            <purgeAtEnd>false</purgeAtEnd>
            <retries>0</retries>
            <startNode idref="56"/>
            <status>RELEASED</status>
            <variables id="120" type="java.util.HashMap">
                <entry>
                    <key id="121" type="java.lang.String">CopyIn</key>
                    <value id="122" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="123">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description id="124">Multiple addresses separated by ;</description>
                        <persistent>false</persistent>
                    </value>
                </entry>
                <entry>
                    <key id="125" type="java.lang.String">Recipients</key>
                    <value id="126" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="127">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description id="128">Multiple addresses separated by ;</description>
                        <persistent>false</persistent>
                    </value>
                </entry>
            </variables>
            <version>5</version>
        </com.j2fe.workflow.definition.Workflow>
    </businessobject>
</goldensource-package>
