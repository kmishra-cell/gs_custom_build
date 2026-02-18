<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.09">
<package-comment/>
<businessobject displayString="17 - V10-Nulls_Handled" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>false</alwaysPersist>
<clustered>true</clustered>
<comment id="1">V10-Nulls_Handled</comment>
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
<name id="11">Email</name>
<nodeHandler>com.j2fe.general.activities.EMAIL</nodeHandler>
<nodeHandlerClass id="12">com.j2fe.general.activities.EMAIL</nodeHandlerClass>
<parameters id="13" type="java.util.HashSet">
<item id="14" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="15">cc_recipients</name>
<stringValue id="16">CopyInArray</stringValue>
<type>VARIABLE</type>
</item>
<item id="17" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="18">emailText</name>
<stringValue id="19">mail</stringValue>
<type>VARIABLE</type>
</item>
<item id="20" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="21">from</name>
<stringValue id="22">noreply@thegoldensource.com</stringValue>
<type>CONSTANT</type>
</item>
<item id="23" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="24">mimeType</name>
<stringValue id="25">text/html</stringValue>
<type>CONSTANT</type>
</item>
<item id="26" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="27">recipients</name>
<stringValue id="28">RecipientArray</stringValue>
<type>VARIABLE</type>
</item>
<item id="29" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="30">session</name>
<stringValue id="31">email/session</stringValue>
<type>REFERENCE</type>
</item>
<item id="32" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="33">subject</name>
<stringValue id="34">env</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="35" type="java.util.HashSet">
<item id="36" type="com.j2fe.workflow.definition.Transition">
<name id="37">goto-next</name>
<source id="38">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="39"/>
<directJoin>false</directJoin>
<name id="40">Get env</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="41">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="42" type="java.util.HashSet">
<item id="43" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="44">database</name>
<stringValue id="45">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="46" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="47">firstColumnsResult[0]</name>
<stringValue id="48">env</stringValue>
<type>VARIABLE</type>
</item>
<item id="49" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="50">querySQL</name>
<stringValue id="51">SELECT 
    '[' || 
   (select ENV_NME from MIZ_Environment_Name) || 
    ']: Morning checks for Credit Risk' AS env
</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="52" type="java.util.HashSet">
<item id="53" type="com.j2fe.workflow.definition.Transition">
<name id="54">goto-next</name>
<source id="55">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="56"/>
<directJoin>false</directJoin>
<name id="57">Split Recipients</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="58">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="59" type="java.util.HashSet">
<item id="60" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="61">statements</name>
<stringValue id="62">String[] CopyInArray= CopyIn.split(";");&#13;
String[] RecipientArray = Recipients.split(";");&#13;
mail = mail + "&lt;p&gt;&lt;/p&gt;&amp;nbsp;&lt;/p&gt;&lt;img src=\"http://apl-rdgs01:8080/configGS/Images/enterprise_logo_gs.gif\"&gt;&lt;/body&gt;&lt;/html&gt;";</stringValue>
<type>CONSTANT</type>
</item>
<item id="63" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="64">variables["CopyIn"]</name>
<stringValue id="65">CopyIn</stringValue>
<type>VARIABLE</type>
</item>
<item id="66" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="67">variables["CopyInArray"]</name>
<stringValue id="68">CopyInArray</stringValue>
<type>VARIABLE</type>
</item>
<item id="69" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="70">variables["RecipientArray"]</name>
<stringValue id="71">RecipientArray</stringValue>
<type>VARIABLE</type>
</item>
<item id="72" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="73">variables["Recipients"]</name>
<stringValue id="74">Recipients</stringValue>
<type>VARIABLE</type>
</item>
<item id="75" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="76">variables["mail"]</name>
<stringValue id="77">mail</stringValue>
<type>VARIABLE</type>
</item>
<item id="78" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="79">variables["mail"]</name>
<stringValue id="80">mail</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="81" type="java.util.HashSet">
<item id="82" type="com.j2fe.workflow.definition.Transition">
<name id="83">goto-next</name>
<source id="84">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="85"/>
<directJoin>false</directJoin>
<name id="86">Add issuer clear email</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="87">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="88" type="java.util.HashSet">
<item id="89" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="90">statements</name>
<stringValue id="91">mail = mail + "&lt;p&gt;&lt;b&gt;Issuers of Interest with more than one parent:-&lt;/b&gt;&lt;/p&gt;&lt;p&gt;Clear&lt;/p&gt;";</stringValue>
<type>CONSTANT</type>
</item>
<item id="92" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="93">variables["mail"]</name>
<stringValue id="94">mail</stringValue>
<type>VARIABLE</type>
</item>
<item id="95" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="96">["mail"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="97">variables["mail"]</name>
<stringValue id="98">mail</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="99" type="java.util.HashSet">
<item id="100" type="com.j2fe.workflow.definition.Transition">
<name id="101">nothing-found</name>
<source id="102">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="103"/>
<directJoin>false</directJoin>
<name id="104">Issuers</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="105">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="106" type="java.util.HashSet">
<item id="107" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="108">database</name>
<stringValue id="109">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="110" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="111">mappedResult</name>
<stringValue id="112">queryOutput</stringValue>
<type>VARIABLE</type>
</item>
<item id="113" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="114">querySQL</name>
<objectValue id="115" type="java.lang.String">
select
	(
		select issr_id 
			from ft_t_irid where end_tms is null 
				and issr_id_ctxt_typ = 'CLIENTREF' 
				and instr_issr_id=issr.instr_issr_id
	) as clientref, 
	inst_nme as inst_nme, 
	issr_nme as issr_nme, 
	pref_id_ctxt_typ as id_ctxt, 
	pref_issr_id as id, 
	ffrl.rel_typ as rel_typ, 
	ffrl.last_chg_tms as last_chg_tms, 
	ffrl.last_chg_usr_id as last_chg_usr_id
from ft_t_fins as fins
	inner join ft_t_ffrl as ffrl on ffrl.inst_mnem = fins.inst_mnem and rel_typ = 'PARNTCOF' and ffrl.end_tms is null
	inner join (
  		select inst_mnem
  		from ft_t_ffrl
  		where rel_typ = 'PARNTCOF'
  			and end_tms is null
  		group by inst_mnem having count(*) &gt; 1
	) as dups on dups.inst_mnem = fins.inst_mnem
	left outer join ft_t_issr issr on issr.fins_inst_mnem = fins.inst_mnem
	inner join ft_t_irgp irgp on irgp.instr_issr_id = issr.instr_issr_id and issr.end_tms is null and irgp.prnt_issr_grp_oid = 'IRGR000006' and irgp.end_tms is null
	union all
	select (select issr_id from ft_t_irid where end_tms is null and issr_id_ctxt_typ = 'CLIENTREF' and instr_issr_id=issr.instr_issr_id) clientref, inst_nme, issr_nme, pref_id_ctxt_typ id_ctxt, pref_issr_id id, ffrl.rel_typ, ffrl.last_chg_tms, ffrl.last_chg_usr_id
	from ft_t_fins fins
	inner join ft_t_ffrl ffrl on ffrl.inst_mnem = fins.inst_mnem and rel_typ = 'MHIPARNT' and ffrl.end_tms is null
	inner join (
  		select inst_mnem
  		from ft_t_ffrl
  		where rel_typ = 'MHIPARNT'
  		and end_tms is null
  		group by inst_mnem having count(*) &gt; 1
) dups on dups.inst_mnem = fins.inst_mnem
left outer join ft_t_issr issr on issr.fins_inst_mnem = fins.inst_mnem
inner join ft_t_irgp irgp on irgp.instr_issr_id = issr.instr_issr_id and issr.end_tms is null and irgp.prnt_issr_grp_oid = 'IRGR000006' and irgp.end_tms is null</objectValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="116" type="java.util.HashSet">
<item id="117" type="com.j2fe.workflow.definition.Transition">
<name id="118">goto-next</name>
<source id="119">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="120"/>
<directJoin>false</directJoin>
<name id="121">setup email</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="122">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="123" type="java.util.HashSet">
<item id="124" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="125">statements</name>
<stringValue id="126">String mail = "&lt;html&gt;&lt;body&gt;";</stringValue>
<type>CONSTANT</type>
</item>
<item id="127" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="128">["mail"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="129">variables["mail"]</name>
<stringValue id="130">mail</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="131" type="java.util.HashSet">
<item id="132" type="com.j2fe.workflow.definition.Transition">
<name id="133">goto-next</name>
<source id="134">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="135"/>
<directJoin>false</directJoin>
<name id="136">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="137">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="138" type="java.util.HashSet"/>
<targets id="139" type="java.util.HashSet">
<item idref="132" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="119"/>
</item>
</sources>
<targets id="140" type="java.util.HashSet">
<item idref="117" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="102"/>
</item>
</sources>
<targets id="141" type="java.util.HashSet">
<item idref="100" type="com.j2fe.workflow.definition.Transition"/>
<item id="142" type="com.j2fe.workflow.definition.Transition">
<name id="143">rows-found</name>
<source idref="102"/>
<target id="144">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="145"/>
<directJoin>false</directJoin>
<name id="146">Add issuer to email</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="147">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="148" type="java.util.HashSet">
<item id="149" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="150">statements</name>
<objectValue id="151" type="java.lang.String">mail = mail + "&lt;p&gt;&lt;b&gt;Issuers of Interest with more than one parent:-&lt;/b&gt;&lt;/p&gt;";

mail = mail + "&lt;table&gt;&lt;tr style='background:SILVER;color:BLACK'&gt;";
mail = mail + "&lt;td&gt;&lt;p&gt;Client Ref&lt;/p&gt;&lt;/td&gt;";
mail = mail + "&lt;td&gt;&lt;p&gt;Institution Name&lt;/p&gt;&lt;/td&gt;";
mail = mail + "&lt;td&gt;&lt;p&gt;Issuer Name&lt;/p&gt;&lt;/td&gt;";
mail = mail + "&lt;td&gt;&lt;p&gt;ID Context Type&lt;/p&gt;&lt;/td&gt;";
mail = mail + "&lt;td&gt;&lt;p&gt;ID&lt;/p&gt;&lt;/td&gt;";
mail = mail + "&lt;td&gt;&lt;p&gt;Change User&lt;/p&gt;&lt;/td&gt;";
mail = mail + "&lt;td&gt;&lt;p&gt;Change Date/Time&lt;/p&gt;&lt;/td&gt;&lt;/tr&gt;";

for (int i = 0; i &lt; issuers.length; i++) {
    Object clientref       = issuers[i].get("clientref");
    Object inst_nme        = issuers[i].get("inst_nme");
    Object issr_nme        = issuers[i].get("issr_nme");
    Object id_ctxt         = issuers[i].get("id_ctxt");
    Object id              = issuers[i].get("id");
    Object last_chg_usr_id = issuers[i].get("last_chg_usr_id");
    Object last_chg_tms    = issuers[i].get("last_chg_tms");

    mail = mail + "&lt;tr&gt;";
    mail = mail + "&lt;td&gt;&lt;p&gt;" + (clientref == null ? "" : clientref.toString()) + "&lt;/p&gt;&lt;/td&gt;";
    mail = mail + "&lt;td&gt;&lt;p&gt;" + (inst_nme == null ? "" : inst_nme.toString()) + "&lt;/p&gt;&lt;/td&gt;";
    mail = mail + "&lt;td&gt;&lt;p&gt;" + (issr_nme == null ? "" : issr_nme.toString()) + "&lt;/p&gt;&lt;/td&gt;";
    mail = mail + "&lt;td&gt;&lt;p&gt;" + (id_ctxt == null ? "" : id_ctxt.toString()) + "&lt;/p&gt;&lt;/td&gt;";
    mail = mail + "&lt;td&gt;&lt;p&gt;" + (id == null ? "" : id.toString()) + "&lt;/p&gt;&lt;/td&gt;";
    mail = mail + "&lt;td&gt;&lt;p&gt;" + (last_chg_usr_id == null ? "" : last_chg_usr_id.toString()) + "&lt;/p&gt;&lt;/td&gt;";
    mail = mail + "&lt;td&gt;&lt;p&gt;" + (last_chg_tms == null ? "" : last_chg_tms.toString()) + "&lt;/p&gt;&lt;/td&gt;";
    mail = mail + "&lt;/tr&gt;";
}

mail = mail + "&lt;/table&gt;";</objectValue>
<type>CONSTANT</type>
</item>
<item id="152" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="153">["issuers"]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="154">variables["issuers"]</name>
<stringValue id="155">queryOutput</stringValue>
<type>VARIABLE</type>
</item>
<item id="156" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="157">variables["mail"]</name>
<stringValue id="158">mail</stringValue>
<type>VARIABLE</type>
</item>
<item id="159" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="160">["mail"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="161">variables["mail"]</name>
<stringValue id="162">mail</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="163" type="java.util.HashSet">
<item idref="142" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="164" type="java.util.HashSet">
<item id="165" type="com.j2fe.workflow.definition.Transition">
<name id="166">goto-next</name>
<source idref="144"/>
<target idref="55"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="84"/>
</item>
</sources>
<targets id="167" type="java.util.HashSet">
<item idref="82" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="55"/>
</item>
<item idref="165" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="168" type="java.util.HashSet">
<item idref="53" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="38"/>
</item>
</sources>
<targets id="169" type="java.util.HashSet">
<item idref="36" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="9"/>
</item>
</sources>
<targets id="170" type="java.util.HashSet">
<item idref="7" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="2"/>
</item>
</sources>
<targets id="171" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="172">Mizuho/Reports</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="173">user1</lastChangeUser>
<lastUpdate id="174">2025-11-29T00:13:24.000+0000</lastUpdate>
<name id="175">CreditChecks</name>
<nodes id="176" type="java.util.HashSet">
<item idref="84" type="com.j2fe.workflow.definition.Node"/>
<item idref="144" type="com.j2fe.workflow.definition.Node"/>
<item idref="9" type="com.j2fe.workflow.definition.Node"/>
<item idref="38" type="com.j2fe.workflow.definition.Node"/>
<item idref="102" type="com.j2fe.workflow.definition.Node"/>
<item idref="55" type="com.j2fe.workflow.definition.Node"/>
<item idref="134" type="com.j2fe.workflow.definition.Node"/>
<item idref="2" type="com.j2fe.workflow.definition.Node"/>
<item idref="119" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>true</optimize>
<parameter id="177" type="java.util.HashMap">
<entry>
<key id="178" type="java.lang.String">CopyIn</key>
<value id="179" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="180">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="181">Multiple addresses separated by ;</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="182" type="java.lang.String">Recipients</key>
<value id="183" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="184">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="185">Multiple addresses separated by ;</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
</parameter>
<permissions id="186" type="java.util.HashSet"/>
<priority>0</priority>
<purgeAtEnd>false</purgeAtEnd>
<retries>0</retries>
<startNode idref="134"/>
<status>RELEASED</status>
<variables id="187" type="java.util.HashMap">
<entry>
<key id="188" type="java.lang.String">CopyIn</key>
<value id="189" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="190">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="191">Multiple addresses separated by ;</description>
<persistent>false</persistent>
<value id="192" type="java.lang.String">rthanekar@thegoldensource.com</value>
</value>
</entry>
<entry>
<key id="193" type="java.lang.String">Recipients</key>
<value id="194" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="195">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="196">Multiple addresses separated by ;</description>
<persistent>false</persistent>
<value id="197" type="java.lang.String">rthanekar@thegoldensource.com</value>
</value>
</entry>
</variables>
<version>17</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
