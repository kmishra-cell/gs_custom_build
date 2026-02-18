<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.07">
<package-comment/>
<businessobject displayString="13 - v10" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>true</alwaysPersist>
<clustered>false</clustered>
<comment id="1">v10</comment>
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
<name id="11">ISSU Delete</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="12">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="13" type="java.util.HashSet">
<item id="14" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="15">database</name>
<stringValue id="16">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="17" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="18">querySQL</name>
<stringValue id="19">update ft_t_issu set end_tms = current_timestamp, last_chg_usr_id = 'DeleteInactivePortfolios', last_chg_tms = current_timestamp&#13;
where end_tms is null&#13;
and instr_id in (select distinct instr_id&#13;
from ft_t_isgp where prt_purp_typ = 'PRTFLIOP'&#13;
and prnt_iss_grp_oid not in (&#13;
select prnt_iss_grp_oid from ft_t_isgp where prt_purp_typ = 'PRTFLIOC'&#13;
and start_tms &lt;=current_timestamp and (end_tms is null or end_tms&gt;current_timestamp))&#13;
and prnt_iss_grp_oid != 'ISGR000011')</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="20" type="java.util.HashSet">
<item id="21" type="com.j2fe.workflow.definition.Transition">
<name id="22">goto-next</name>
<source id="23">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="24"/>
<directJoin>false</directJoin>
<name id="25">ISGR Delete</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="26">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="27" type="java.util.HashSet">
<item id="28" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="29">database</name>
<stringValue id="30">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="31" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="32">querySQL</name>
<stringValue id="33">update ft_t_isgr set end_tms = current_timestamp, last_chg_usr_id = 'DeleteInactivePortfolios', last_chg_tms = current_timestamp&#13;
where end_tms is null&#13;
and iss_grp_oid in (select distinct prnt_iss_grp_oid&#13;
from ft_t_isgp where prt_purp_typ = 'PRTFLIOP'&#13;
and start_tms &lt;=current_timestamp and (end_tms is null or end_tms&gt;current_timestamp)&#13;
and prnt_iss_grp_oid not in (&#13;
select prnt_iss_grp_oid from ft_t_isgp where prt_purp_typ = 'PRTFLIOC'&#13;
and start_tms &lt;=current_timestamp and (end_tms is null or end_tms&gt;current_timestamp))&#13;
and prnt_iss_grp_oid != 'ISGR000011')</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="34" type="java.util.HashSet">
<item id="35" type="com.j2fe.workflow.definition.Transition">
<name id="36">goto-next</name>
<source id="37">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="38"/>
<directJoin>false</directJoin>
<name id="39">ISGP Delete</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="40">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="41" type="java.util.HashSet">
<item id="42" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="43">database</name>
<stringValue id="44">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="45" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="46">querySQL</name>
<stringValue id="47">update ft_t_isgp set end_tms = current_timestamp, last_chg_usr_id = 'DeleteInactivePortfolios', last_chg_tms = current_timestamp&#13;
where end_tms is null&#13;
and prnt_iss_grp_oid in (select distinct prnt_iss_grp_oid&#13;
from ft_t_isgp where prt_purp_typ = 'PRTFLIOP'&#13;
and start_tms &lt;=current_timestamp and (end_tms is null or end_tms&gt;current_timestamp)&#13;
and prnt_iss_grp_oid not in (&#13;
select prnt_iss_grp_oid from ft_t_isgp where prt_purp_typ = 'PRTFLIOC'&#13;
and start_tms &lt;=current_timestamp and (end_tms is null or end_tms&gt;current_timestamp))&#13;
and prnt_iss_grp_oid != 'ISGR000011')</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="48" type="java.util.HashSet">
<item id="49" type="com.j2fe.workflow.definition.Transition">
<name id="50">goto-next</name>
<source id="51">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="52"/>
<directJoin>false</directJoin>
<name id="53">ISLL Delete</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="54">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="55" type="java.util.HashSet">
<item id="56" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="57">database</name>
<stringValue id="58">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="59" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="60">querySQL</name>
<stringValue id="61">update ft_t_isll set end_tms = current_timestamp, last_chg_usr_id = 'DeleteInactivePortfolios', last_chg_tms = current_timestamp&#13;
where end_tms is null&#13;
and instr_id in (select distinct instr_id&#13;
from ft_t_isgp where prt_purp_typ = 'PRTFLIOP'&#13;
and start_tms &lt;=current_timestamp and (end_tms is null or end_tms&gt;current_timestamp)&#13;
and prnt_iss_grp_oid not in (&#13;
select prnt_iss_grp_oid from ft_t_isgp where prt_purp_typ = 'PRTFLIOC'&#13;
and start_tms &lt;=current_timestamp and (end_tms is null or end_tms&gt;current_timestamp))&#13;
and prnt_iss_grp_oid != 'ISGR000011')</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="62" type="java.util.HashSet">
<item id="63" type="com.j2fe.workflow.definition.Transition">
<name id="64">goto-next</name>
<source id="65">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="66"/>
<directJoin>false</directJoin>
<name id="67">ISST Delete</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="68">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="69" type="java.util.HashSet">
<item id="70" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="71">database</name>
<stringValue id="72">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="73" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="74">querySQL</name>
<stringValue id="75">update ft_t_isst set end_tms = current_timestamp, last_chg_usr_id = 'DeleteInactivePortfolios', last_chg_tms = current_timestamp&#13;
where end_tms is null&#13;
and instr_id in (select distinct instr_id&#13;
from ft_t_isgp where prt_purp_typ = 'PRTFLIOP'&#13;
and start_tms &lt;=current_timestamp and (end_tms is null or end_tms&gt;current_timestamp)&#13;
and prnt_iss_grp_oid not in (&#13;
select prnt_iss_grp_oid from ft_t_isgp where prt_purp_typ = 'PRTFLIOC'&#13;
and start_tms &lt;=current_timestamp and (end_tms is null or end_tms&gt;current_timestamp))&#13;
and prnt_iss_grp_oid != 'ISGR000011')</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="76" type="java.util.HashSet">
<item id="77" type="com.j2fe.workflow.definition.Transition">
<name id="78">goto-next</name>
<source id="79">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="80"/>
<directJoin>false</directJoin>
<name id="81">FRIP Delete</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="82">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="83" type="java.util.HashSet">
<item id="84" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="85">database</name>
<stringValue id="86">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="87" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="88">querySQL</name>
<stringValue id="89">update ft_t_frip set end_tms = current_timestamp, last_chg_usr_id = 'DeleteInactivePortfolios', last_chg_tms = current_timestamp&#13;
where end_tms is null&#13;
and instr_id in (select distinct instr_id&#13;
from ft_t_isgp where prt_purp_typ = 'PRTFLIOP'&#13;
and start_tms &lt;=current_timestamp and (end_tms is null or end_tms&gt;current_timestamp)&#13;
and prnt_iss_grp_oid not in (&#13;
select prnt_iss_grp_oid from ft_t_isgp where prt_purp_typ = 'PRTFLIOC'&#13;
and start_tms &lt;=current_timestamp and (end_tms is null or end_tms&gt;current_timestamp))&#13;
and prnt_iss_grp_oid != 'ISGR000011')</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="90" type="java.util.HashSet">
<item id="91" type="com.j2fe.workflow.definition.Transition">
<name id="92">goto-next</name>
<source id="93">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="94"/>
<directJoin>false</directJoin>
<name id="95">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="96">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="97" type="java.util.HashSet"/>
<targets id="98" type="java.util.HashSet">
<item idref="91" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="79"/>
</item>
</sources>
<targets id="99" type="java.util.HashSet">
<item idref="77" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="65"/>
</item>
</sources>
<targets id="100" type="java.util.HashSet">
<item idref="63" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="51"/>
</item>
</sources>
<targets id="101" type="java.util.HashSet">
<item idref="49" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="37"/>
</item>
</sources>
<targets id="102" type="java.util.HashSet">
<item idref="35" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="23"/>
</item>
</sources>
<targets id="103" type="java.util.HashSet">
<item idref="21" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="9"/>
</item>
</sources>
<targets id="104" type="java.util.HashSet">
<item idref="7" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="2"/>
</item>
</sources>
<targets id="105" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="106">Mizuho/Ratings</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="107">user1</lastChangeUser>
<lastUpdate id="108">2025-10-31T13:51:24.000+0000</lastUpdate>
<name id="109">DeleteInactivePortfolio</name>
<nodes id="110" type="java.util.HashSet">
<item idref="79" type="com.j2fe.workflow.definition.Node"/>
<item idref="37" type="com.j2fe.workflow.definition.Node"/>
<item idref="23" type="com.j2fe.workflow.definition.Node"/>
<item idref="51" type="com.j2fe.workflow.definition.Node"/>
<item idref="65" type="com.j2fe.workflow.definition.Node"/>
<item idref="9" type="com.j2fe.workflow.definition.Node"/>
<item idref="93" type="com.j2fe.workflow.definition.Node"/>
<item idref="2" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>false</optimize>
<parameter id="111" type="java.util.HashMap"/>
<permissions id="112" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>false</purgeAtEnd>
<retries>0</retries>
<startNode idref="93"/>
<status>RELEASED</status>
<variables id="113" type="java.util.HashMap"/>
<version>13</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
