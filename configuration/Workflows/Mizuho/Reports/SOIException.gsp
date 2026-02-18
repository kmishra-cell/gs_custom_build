<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.09">
<package-comment/>
<businessobject displayString="21 - V10-Concat-Queries-Corrected" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>true</alwaysPersist>
<clustered>true</clustered>
<comment id="1">V10-Concat-Queries-Corrected</comment>
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
<objectValue id="17" type="java.lang.String">SOI_Exceptions</objectValue>
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
<objectValue id="25" type="java.lang.String">Please find attached SOI exception report</objectValue>
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
<objectValue id="33" type="java.lang.String">SOI Addition Exception Report</objectValue>
<type>CONSTANT</type>
</item>
<item id="34" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="35">["sqlSelect"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="36">input["sqlSelect"]</name>
<objectValue id="37" type="java.lang.String">SELECT 
    '"Vendor Requestor ID","Vendor Requested Date","Identifier Type","Vendor ID","Bloomberg Response File Name","Request Error","SOI Inventory","GoldenSpource Published Date"'
FROM DUAL
UNION ALL
SELECT concat(
    '"' , VREQ.VND_RQSTR_ID , '",' ,
    '"' , VREQ.VND_RQST_TMS , '",' ,
    '"' , VREQ.VND_RQST_XREF_ID_CTXT_TYP , '",' ,
    '"' , VREQ.VND_RQST_XREF_ID , '",' ,
    '"' , VREQ.VND_RESP_FILE_NME , '",' ,
    '"' , VREQ.VND_RQST_STAT_TXT , '",' ,
    '"' , COALESCE(ISGR.GRP_NME, 'Not in SOI') , '",' ,
    '"' , 'Not Published' , '"')
FROM FT_T_VREQ VREQ
LEFT JOIN FT_T_ISID ISID 
    ON ISID.ISS_ID = VREQ.VND_RQST_XREF_ID 
    AND ISID.ID_CTXT_TYP = CASE 
                            WHEN VREQ.VND_RQST_XREF_ID_CTXT_TYP = 'BB_UNIQUE' THEN 'BBUNIQUE'
                            WHEN VREQ.VND_RQST_XREF_ID_CTXT_TYP = 'BB_GLOBAL' THEN 'BBGLOBAL'
                            ELSE VREQ.VND_RQST_XREF_ID_CTXT_TYP 
                          END
    AND ISID.END_TMS IS NULL
LEFT JOIN FT_T_PBAT PBAT 
    ON ISID.INSTR_ID = PBAT.PUB_CROSS_REF_ID 
    AND PBAT.LAST_CHG_TMS &gt; SYSDATE() - INTERVAL '5 days'
LEFT JOIN FT_T_ISGP ISGP 
    ON ISID.INSTR_ID = ISGP.INSTR_ID 
    AND ISGP.END_TMS IS NULL 
    AND ISGP.PRT_PURP_TYP = 'INTEREST'
LEFT JOIN FT_T_ISGR ISGR 
    ON ISGR.ISS_GRP_OID = ISGP.PRNT_ISS_GRP_OID
WHERE 
    VREQ.vnd_rqstr_ID IN ('MUREX', 'MHSA', 'MHSS')
    AND VREQ.VND_RQST_TMS &gt; SYSDATE() - INTERVAL '5 days'
    AND PBAT.LAST_CHG_TMS IS NULL;</objectValue>
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
<objectValue id="54" type="java.lang.String">select concat(
'""""',VREQ.VND_RQSTR_ID
,'"""",""""',VREQ.VND_RQST_TMS 
,'"""",""""',VREQ.VND_RQST_XREF_ID_CTXT_TYP
,'"""",""""',VREQ.VND_RQST_XREF_ID
,'"""",""""',VREQ.VND_RESP_FILE_NME
,'"""",""""',VREQ.VND_RQST_STAT_TXT
--,'"""",""""',CASE ISGP.PRNT_ISS_GRP_OID WHEN 'ISGR000006' THEN 'MHI MX Inventory' WHEN 'ISGR000013' THEN 'MHSA Inventory' WHEN 'ISGR000014' THEN 'MHI Repo Trading' WHEN 'ISGR000015' THEN 'MHEU MX Inventory' ELSE 'Not in SOI' END
,'"""",""""',COALESCE(ISGR.GRP_NME,'Not in SOI') 
,'"""",""""','Not Published'
,'""""')
from FT_T_VREQ VREQ
--left outer join FT_T_TRID TRID ON VREQ.VND_RQST_OID=TRID.VND_RQST_OID
left outer join FT_T_ISID ISID ON ISID.ISS_ID=VREQ.VND_RQST_XREF_ID 
AND ISID.ID_CTXT_TYP= CASE WHEN VREQ.VND_RQST_XREF_ID_CTXT_TYP = 'BB_UNIQUE' THEN 'BBUNIQUE' WHEN VREQ.VND_RQST_XREF_ID_CTXT_TYP = 'BB_GLOBAL' THEN 'BBGLOBAL' ELSE VREQ.VND_RQST_XREF_ID_CTXT_TYP END  
AND ISID.END_TMS IS NULL   -- Is the requested id set up in ISID?
left outer join FT_T_PBAT PBAT ON ISID.INSTR_ID=PBAT.PUB_CROSS_REF_ID AND PBAT.LAST_CHG_TMS &gt; sysdate()- INTERVAL '5 days'
left outer join FT_T_ISGP ISGP ON ISID.INSTR_ID=ISGP.INSTR_ID AND ISGP.END_TMS IS NULL AND ISGP.PRT_PURP_TYP='INTEREST'
left outer join FT_T_ISGR ISGR ON ISGR.ISS_GRP_OID=ISGP.PRNT_ISS_GRP_OID      --and ISGR.GRP_NME in ('MHI Inventory')
--left outer join FT_T_PBDP PBDP ON PBAT.PUB_AUDIT_ID = PBDP.PUB_AUDIT_ID   -- No need to refer PBDP
where 1=1
-- vnd_rqstr_id='MUREX' this is the flag for SOIaddition
--and ( VREQ.vnd_rqstr_ID = 'MUREX' or VREQ.USR_RQST_ID ='MUREX' )    -- VREQ.USR_RQST_ID ='MUREX' for manual request
and VREQ.vnd_rqstr_ID in ('MUREX','MHSA','MHSS')
and VREQ.VND_RQST_TMS &gt; sysdate()- INTERVAL '5 days'       -- check 5 days 
and PBAT.LAST_CHG_TMS is null</objectValue>
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
<target id="67">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="68"/>
<directJoin>false</directJoin>
<name id="69">Email</name>
<nodeHandler>com.j2fe.general.activities.EMAIL</nodeHandler>
<nodeHandlerClass id="70">com.j2fe.general.activities.EMAIL</nodeHandlerClass>
<parameters id="71" type="java.util.HashSet">
<item id="72" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="73">emailText</name>
<stringValue id="74">Nothing to Report.</stringValue>
<type>CONSTANT</type>
</item>
<item id="75" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="76">from</name>
<stringValue id="77">noreply@thegoldensource.com</stringValue>
<type>CONSTANT</type>
</item>
<item id="78" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="79">recipients</name>
<stringValue id="80">Recipients</stringValue>
<type>VARIABLE</type>
</item>
<item id="81" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="82">session</name>
<stringValue id="83">email/session</stringValue>
<type>REFERENCE</type>
</item>
<item id="84" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="85">subject</name>
<stringValue id="86">SOI Addition Exception Report</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="87" type="java.util.HashSet">
<item idref="65" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="88" type="java.util.HashSet">
<item id="89" type="com.j2fe.workflow.definition.Transition">
<name id="90">goto-next</name>
<source idref="67"/>
<target idref="2"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item idref="42" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="9"/>
</item>
</sources>
<targets id="91" type="java.util.HashSet">
<item idref="7" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="2"/>
</item>
<item idref="89" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="92" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="93">Mizuho/Reports</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="94">user1</lastChangeUser>
<lastUpdate id="95">2025-11-27T19:08:19.000+0000</lastUpdate>
<name id="96">SOIException</name>
<nodes id="97" type="java.util.HashSet">
<item idref="9" type="com.j2fe.workflow.definition.Node"/>
<item idref="44" type="com.j2fe.workflow.definition.Node"/>
<item idref="67" type="com.j2fe.workflow.definition.Node"/>
<item idref="58" type="com.j2fe.workflow.definition.Node"/>
<item idref="2" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>true</optimize>
<parameter id="98" type="java.util.HashMap">
<entry>
<key id="99" type="java.lang.String">CopyIn</key>
<value id="100" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="101">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="102">Multiple addresses separated by ;</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="103" type="java.lang.String">Recipients</key>
<value id="104" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="105">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="106">Multiple addresses separated by ;</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
</parameter>
<permissions id="107" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>false</purgeAtEnd>
<retries>0</retries>
<startNode idref="58"/>
<status>RELEASED</status>
<variables id="108" type="java.util.HashMap">
<entry>
<key id="109" type="java.lang.String">CopyIn</key>
<value id="110" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="111">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="112">Multiple addresses separated by ;</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="113" type="java.lang.String">Recipients</key>
<value id="114" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="115">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="116">Multiple addresses separated by ;</description>
<persistent>false</persistent>
</value>
</entry>
</variables>
<version>21</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
