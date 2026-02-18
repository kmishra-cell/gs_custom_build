<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.03">
<package-comment/>
<businessobject displayString="3 - GU-312" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>false</alwaysPersist>
<clustered>true</clustered>
<comment id="1">GU-312</comment>
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
<name id="9">Set B3RECALF for IOI</name>
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
<input>true</input>
<name id="16">indexedParameters[0]</name>
<stringValue id="17">lastExecDateTms</stringValue>
<type>VARIABLE</type>
</item>
<item id="18" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="19">querySQL</name>
<stringValue id="20">MERGE INTO FT_T_FIST S
USING (select distinct FT_T_ISSR.FINS_INST_MNEM 
from FT_T_ISSR
where (FT_T_ISSR.END_TMS IS NULL OR FT_T_ISSR.END_TMS &gt; now()) AND FT_T_ISSR.INSTR_ISSR_ID in
(select FT_T_IRGP.INSTR_ISSR_ID from FT_T_IRGP where FT_T_IRGP.END_TMS is null and FT_T_IRGP.PRT_PURP_TYP = 'INTEREST'
and FT_T_IRGP.LAST_CHG_TMS &gt; ?
AND FT_T_IRGP.PRNT_ISSR_GRP_OID IN (SELECT FT_T_IRGR.ISSR_GRP_OID FROM FT_T_IRGR WHERE FT_T_IRGR.END_TMS IS NULL AND FT_T_IRGR.GRP_PURP_TYP = 'INTEREST'))) E
  ON (E.FINS_INST_MNEM = S.INST_MNEM AND S.STAT_DEF_ID = 'B3RECALF' AND (S.END_TMS IS NULL OR S.END_TMS &gt; now()))
WHEN MATCHED AND STAT_CHAR_VAL_TXT != 'Y' THEN
  UPDATE set STAT_CHAR_VAL_TXT = 'Y', LAST_CHG_TMS = now(), LAST_CHG_USR_ID = 'B3IoiAddition' 
WHEN NOT MATCHED THEN
  INSERT ( STAT_ID,STAT_DEF_ID,INST_MNEM,START_TMS,LAST_CHG_TMS,LAST_CHG_USR_ID,STAT_CHAR_VAL_TXT)
  VALUES (new_oid(),'B3RECALF',e.FINS_INST_MNEM,now(),now(),'B3IoiAddition','Y')	
	</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="21" type="java.util.HashSet">
<item id="22" type="com.j2fe.workflow.definition.Transition">
<name id="23">goto-next</name>
<source id="24">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="25">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="26">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="27" type="java.util.HashSet"/>
<targets id="28" type="java.util.HashSet">
<item idref="22" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="8"/>
</item>
</sources>
<targets id="29" type="java.util.HashSet">
<item idref="6" type="com.j2fe.workflow.definition.Transition"/>
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
<group id="31">Mizuho/Ratings/B3Ratings</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="32">user1</lastChangeUser>
<lastUpdate id="33">2025-07-16T15:06:29.000+0100</lastUpdate>
<name id="34">B3RatingsRecalFlagSetterForIOI</name>
<nodes id="35" type="java.util.HashSet">
<item idref="8" type="com.j2fe.workflow.definition.Node"/>
<item idref="24" type="com.j2fe.workflow.definition.Node"/>
<item idref="2" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>true</optimize>
<parameter id="36" type="java.util.HashMap">
<entry>
<key id="37" type="java.lang.String">lastExecDateTms</key>
<value id="38" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="39">java.util.Date</className>
<clazz>java.util.Date</clazz>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
</parameter>
<permissions id="40" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>true</purgeAtEnd>
<retries>0</retries>
<startNode idref="24"/>
<status>RELEASED</status>
<variables id="41" type="java.util.HashMap">
<entry>
<key id="42" type="java.lang.String">lastExecDateTms</key>
<value id="43" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="44">java.util.Date</className>
<clazz>java.util.Date</clazz>
<persistent>true</persistent>
</value>
</entry>
</variables>
<version>3</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
