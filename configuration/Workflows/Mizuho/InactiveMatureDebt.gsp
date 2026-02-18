<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.03">
<package-comment/>
<businessobject displayString="3 - V-10" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>false</alwaysPersist>
<clustered>true</clustered>
<comment id="1">V-10</comment>
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
<name id="11">Update Status</name>
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
<stringValue id="19">update ft_t_issu &#13;
set &#13;
	iss_actvy_stat_typ = 'INACTIVE', &#13;
	last_chg_tms = sysdate(), &#13;
	last_chg_usr_id = 'WFIAMD'&#13;
where mat_exp_tms &lt; sysdate() and start_tms &lt; sysdate() and (end_tms is null or end_tms &gt; sysdate()) and iss_actvy_stat_typ != 'INACTIVE'</stringValue>
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
<name id="25">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="26">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="27" type="java.util.HashSet"/>
<targets id="28" type="java.util.HashSet">
<item idref="21" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="9"/>
</item>
</sources>
<targets id="29" type="java.util.HashSet">
<item idref="7" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="2"/>
</item>
</sources>
<targets id="30" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="31">Mizuho</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="32">user1</lastChangeUser>
<lastUpdate id="33">2025-05-28T15:26:37.000+0100</lastUpdate>
<name id="34">InactiveMatureDebt</name>
<nodes id="35" type="java.util.HashSet">
<item idref="23" type="com.j2fe.workflow.definition.Node"/>
<item idref="2" type="com.j2fe.workflow.definition.Node"/>
<item idref="9" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>true</optimize>
<parameter id="36" type="java.util.HashMap"/>
<permissions id="37" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>false</purgeAtEnd>
<retries>0</retries>
<startNode idref="23"/>
<status>RELEASED</status>
<variables id="38" type="java.util.HashMap"/>
<version>3</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
