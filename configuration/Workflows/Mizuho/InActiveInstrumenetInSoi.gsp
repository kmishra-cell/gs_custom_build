<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.03">
<package-comment/>
<businessobject displayString="3 - V10" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>true</alwaysPersist>
<clustered>true</clustered>
<comment id="1">V10</comment>
<endNode id="2">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="3">Stop</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="4">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="5" type="java.util.HashSet">
<item id="6" type="com.j2fe.workflow.definition.Transition">
<name id="7">goto-next</name>
<source id="8">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="9">Database Statement (Standard)</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="10">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="11" type="java.util.HashSet">
<item id="12" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="13">database</name>
<stringValue id="14">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="15" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="16">[0]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="17">indexedParameters[0]</name>
<stringValue id="18">SoiNameToEndDate</stringValue>
<type>VARIABLE</type>
</item>
<item id="19" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="20">[1]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="21">indexedParameters[1]</name>
<stringValue id="22">SoiNameFromEndDate</stringValue>
<type>VARIABLE</type>
</item>
<item id="23" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="24">querySQL</name>
<stringValue id="25">UPDATE ft_t_isgp
SET end_tms = sysdate(), 
    last_chg_tms = sysdate(), 
    last_chg_usr_id = 'WF'
WHERE PRT_PURP_TYP = ?
AND NOT EXISTS (
    SELECT 1 
    FROM ft_t_isgp isgp2
    WHERE isgp2.prt_purp_typ = ? 
    AND isgp2.instr_id = ft_t_isgp.instr_id
    AND isgp2.start_tms &lt;= sysdate() 
    AND (isgp2.end_tms IS NULL OR isgp2.end_tms &gt; sysdate())
)
AND start_tms &lt;= sysdate()
AND (end_tms IS NULL OR end_tms &gt; sysdate())</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="26" type="java.util.HashSet">
<item id="27" type="com.j2fe.workflow.definition.Transition">
<name id="28">goto-next</name>
<source id="29">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="30">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="31">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="32" type="java.util.HashSet"/>
<targets id="33" type="java.util.HashSet">
<item idref="27" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="8"/>
</item>
</sources>
<targets id="34" type="java.util.HashSet">
<item idref="6" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="2"/>
</item>
</sources>
<targets id="35" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="36">Mizuho</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="37">user1</lastChangeUser>
<lastUpdate id="38">2025-06-16T12:48:24.000+0100</lastUpdate>
<name id="39">InActiveInstrumenetInSoi</name>
<nodes id="40" type="java.util.HashSet">
<item idref="8" type="com.j2fe.workflow.definition.Node"/>
<item idref="29" type="com.j2fe.workflow.definition.Node"/>
<item idref="2" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>true</optimize>
<parameter id="41" type="java.util.HashMap">
<entry>
<key id="42" type="java.lang.String">SoiNameFromEndDate</key>
<value id="43" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="44">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="45" type="java.lang.String">SoiNameToEndDate</key>
<value id="46" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="47">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
</parameter>
<permissions id="48" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>false</purgeAtEnd>
<retries>0</retries>
<startNode idref="29"/>
<status>RELEASED</status>
<variables id="49" type="java.util.HashMap">
<entry>
<key id="50" type="java.lang.String">SoiNameFromEndDate</key>
<value id="51" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="52">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>true</persistent>
<value id="53" type="java.lang.String">MUREX</value>
</value>
</entry>
<entry>
<key id="54" type="java.lang.String">SoiNameToEndDate</key>
<value id="55" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="56">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>true</persistent>
<value id="57" type="java.lang.String">MTN</value>
</value>
</entry>
</variables>
<version>3</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
