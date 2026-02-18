<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.12">
<package-comment/>
<businessobject displayString="13 - V10-Query-Corrected" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>false</alwaysPersist>
<clustered>true</clustered>
<comment id="1">V10-Query-Corrected</comment>
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
<objectValue id="17" type="java.lang.String">FENERGO_ID_error_report</objectValue>
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
<objectValue id="25" type="java.lang.String">"CRM or CLM team is expected to manually check the Customer in Fenergo and identify the equivalent Issuer in GS. They are then expected to add the Fenergo id under FIID in GS, and also add the Issuer to IOI if not already in MHI IOI group. This will generate a CLIENTREF (where not already in IOI) and the published message /cmfparty is expected to contain the Fenergo id."</objectValue>
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
<objectValue id="33" type="java.lang.String">++  - Missing FENERGO ids in GoldenSource</objectValue>
<type>CONSTANT</type>
</item>
<item id="34" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="35">["sqlSelect"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="36">input["sqlSelect"]</name>
<objectValue id="37" type="java.lang.String">select '"FENERGO ID","FENERGO Name","Exception Date/Time"',1 ordernum
union all
select concat('"',trid.main_entity_id ,'","', trid.main_entity_nme ,'","', trid.created_tms ,'"'), 2 ordernum
from ft_t_trid trid
where trid.input_msg_typ = 'LEGALENTITY'
and trid.created_tms &gt; (sysdate() - INTERVAL '5 day')::DATE --last 5 days.  This should be changed based on the decisions around frequency
and not exists
(select 'x' from ft_t_fiid fiid
where trid.main_entity_id = fiid.fins_id
and fiid.fins_id_ctxt_typ = 'FENERGOID'
and fiid.end_tms is null
)
order by ordernum,2 desc</objectValue>
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
<name id="43">rows-found</name>
<source id="44">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="45"/>
<directJoin>false</directJoin>
<name id="46">Database Select (Xor Split)</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="47">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="48" type="java.util.HashSet">
<item id="49" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="50">database</name>
<stringValue id="51">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="52" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="53">querySQL</name>
<stringValue id="54">select '"FENERGO ID","FENERGO Name","Exception Date/Time"',1 ordernum
union all
select concat('"', trid.main_entity_id, '","', trid.main_entity_nme, '","', trid.created_tms, '"'), 2 ordernum
from ft_t_trid trid
where trid.input_msg_typ = 'LEGALENTITY'
and trid.created_tms &gt; (sysdate() - INTERVAL '5 day')::DATE   --last 5 days.  This should be changed based on the decisions around frequency
and not exists
(select 'x' from ft_t_fiid fiid
where trid.main_entity_id = fiid.fins_id
and fiid.fins_id_ctxt_typ = 'FENERGOID'
and fiid.end_tms is null
)
order by ordernum,2 desc
</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="55" type="java.util.HashSet">
<item id="56" type="com.j2fe.workflow.definition.Transition">
<name id="57">goto-next</name>
<source id="58">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="59"/>
<directJoin>false</directJoin>
<name id="60">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="61">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="62" type="java.util.HashSet"/>
<targets id="63" type="java.util.HashSet">
<item idref="56" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="44"/>
</item>
</sources>
<targets id="64" type="java.util.HashSet">
<item id="65" type="com.j2fe.workflow.definition.Transition">
<name id="66">nothing-found</name>
<source idref="44"/>
<target idref="2"/>
</item>
<item idref="42" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="9"/>
</item>
</sources>
<targets id="67" type="java.util.HashSet">
<item idref="7" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="2"/>
</item>
<item idref="65" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="68" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="69">Mizuho/Reports</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="70">user1</lastChangeUser>
<lastUpdate id="71">2025-11-27T21:44:54.000+0000</lastUpdate>
<name id="72">MZ_FENERGO_ID_Report</name>
<nodes id="73" type="java.util.HashSet">
<item idref="9" type="com.j2fe.workflow.definition.Node"/>
<item idref="44" type="com.j2fe.workflow.definition.Node"/>
<item idref="58" type="com.j2fe.workflow.definition.Node"/>
<item idref="2" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>true</optimize>
<parameter id="74" type="java.util.HashMap">
<entry>
<key id="75" type="java.lang.String">CopyIn</key>
<value id="76" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="77">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="78">Multiple addresses separated by ;</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="79" type="java.lang.String">Recipients</key>
<value id="80" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="81">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="82">Multiple addresses separated by ;</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
</parameter>
<permissions id="83" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>false</purgeAtEnd>
<retries>0</retries>
<startNode idref="58"/>
<status>RELEASED</status>
<variables id="84" type="java.util.HashMap">
<entry>
<key id="85" type="java.lang.String">CopyIn</key>
<value id="86" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="87">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="88">Multiple addresses separated by ;</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="89" type="java.lang.String">Recipients</key>
<value id="90" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="91">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="92">Multiple addresses separated by ;</description>
<persistent>false</persistent>
</value>
</entry>
</variables>
<version>13</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
