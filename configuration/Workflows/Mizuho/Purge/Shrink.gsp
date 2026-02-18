<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.03">
<package-comment/>
<businessobject displayString="3 - V-10" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>true</alwaysPersist>
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
<name id="11">Log Events in Orchestrator Log</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="12">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="13" type="java.util.HashSet">
<item id="14" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="15">statements</name>
<stringValue id="16">import org.apache.log4j.Logger;&#13;
Logger logger = Logger.getLogger("Shrink");&#13;
logger.info("Shrink " + tableName + " Completed");</stringValue>
<type>CONSTANT</type>
</item>
<item id="17" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="18">variables["tableName"]</name>
<stringValue id="19">Table</stringValue>
<type>VARIABLE</type>
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
<name id="25">Log Events in DB</name>
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
<name id="32">indexedParameters[0]</name>
<stringValue id="33">Table</stringValue>
<type>VARIABLE</type>
</item>
<item id="34" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="35">querySQL</name>
<stringValue id="36">begin &#13;
 mhi_sp_eventlog (&#13;
	  'Shrink Workflow',&#13;
	  'Shrink Workflow',&#13;
	  'Shrink '|| ? || ' Completed'&#13;
	); &#13;
end;</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="37" type="java.util.HashSet">
<item id="38" type="com.j2fe.workflow.definition.Transition">
<name id="39">goto-next</name>
<source id="40">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="41"/>
<directJoin>false</directJoin>
<name id="42">PLSQL Statement</name>
<nodeHandler>com.j2fe.general.activities.database.PLSQLprocedure</nodeHandler>
<nodeHandlerClass id="43">com.j2fe.general.activities.database.PLSQLprocedure</nodeHandlerClass>
<parameters id="44" type="java.util.HashSet">
<item id="45" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="46">PLSQLQuery</name>
<stringValue id="47">DO $$&#13;
DECLARE&#13;
    v_schema VARCHAR;&#13;
    v_table VARCHAR:= ?;&#13;
BEGIN&#13;
    SELECT DISTINCT schemaname&#13;
    INTO v_schema&#13;
    FROM pg_catalog.pg_tables&#13;
    WHERE schemaname ILIKE 'gc_own%';&#13;
&#13;
    EXECUTE format('VACUUM FULL %I.%I', v_schema, v_table);&#13;
END&#13;
$$ LANGUAGE plpgsql;</stringValue>
<type>CONSTANT</type>
</item>
<item id="48" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="49">database</name>
<stringValue id="50">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="51" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="52">indexParameters[0]</name>
<objectValue id="53" type="java.lang.String">IN</objectValue>
<type>CONSTANT</type>
</item>
<item id="54" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="55">indexedParameterType[0]</name>
<objectValue id="56" type="java.lang.String">VARCHAR</objectValue>
<type>CONSTANT</type>
</item>
<item id="57" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="58">indexedParameterValue[0]</name>
<stringValue id="59">Table</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="60" type="java.util.HashSet">
<item id="61" type="com.j2fe.workflow.definition.Transition">
<name id="62">goto-next</name>
<source id="63">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="64"/>
<directJoin>false</directJoin>
<name id="65">Log Events in Orchestrator Log</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="66">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="67" type="java.util.HashSet">
<item id="68" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="69">statements</name>
<stringValue id="70">import org.apache.log4j.Logger;&#13;
Logger logger = Logger.getLogger("Shrink");&#13;
logger.info("Shrink " + tableName + " Started...");</stringValue>
<type>CONSTANT</type>
</item>
<item id="71" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="72">variables["tableName"]</name>
<stringValue id="73">Table</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="74" type="java.util.HashSet">
<item id="75" type="com.j2fe.workflow.definition.Transition">
<name id="76">goto-next</name>
<source id="77">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="78"/>
<directJoin>false</directJoin>
<name id="79">Log Events in DB</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="80">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="81" type="java.util.HashSet">
<item id="82" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="83">database</name>
<stringValue id="84">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="85" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="86">indexedParameters[0]</name>
<stringValue id="87">Table</stringValue>
<type>VARIABLE</type>
</item>
<item id="88" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="89">querySQL</name>
<stringValue id="90">begin &#13;
 mhi_sp_eventlog (&#13;
	  'Shrink Workflow',&#13;
	  'Shrink Workflow',&#13;
	  'Shrink '|| ? || ' Started...'&#13;
	); &#13;
end;</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="91" type="java.util.HashSet">
<item id="92" type="com.j2fe.workflow.definition.Transition">
<name id="93">goto-next</name>
<source id="94">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="95"/>
<directJoin>false</directJoin>
<name id="96">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="97">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="98" type="java.util.HashSet"/>
<targets id="99" type="java.util.HashSet">
<item idref="92" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="77"/>
</item>
</sources>
<targets id="100" type="java.util.HashSet">
<item idref="75" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="63"/>
</item>
</sources>
<targets id="101" type="java.util.HashSet">
<item idref="61" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="40"/>
</item>
</sources>
<targets id="102" type="java.util.HashSet">
<item idref="38" type="com.j2fe.workflow.definition.Transition"/>
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
<group id="106">Mizuho/Purge</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="107">user1</lastChangeUser>
<lastUpdate id="108">2025-05-21T06:30:52.000+0100</lastUpdate>
<name id="109">Shrink</name>
<nodes id="110" type="java.util.HashSet">
<item idref="77" type="com.j2fe.workflow.definition.Node"/>
<item idref="23" type="com.j2fe.workflow.definition.Node"/>
<item idref="63" type="com.j2fe.workflow.definition.Node"/>
<item idref="9" type="com.j2fe.workflow.definition.Node"/>
<item idref="40" type="com.j2fe.workflow.definition.Node"/>
<item idref="94" type="com.j2fe.workflow.definition.Node"/>
<item idref="2" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>false</optimize>
<parameter id="111" type="java.util.HashMap">
<entry>
<key id="112" type="java.lang.String">Table</key>
<value id="113" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="114">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
</parameter>
<permissions id="115" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>false</purgeAtEnd>
<retries>0</retries>
<startNode idref="94"/>
<status>RELEASED</status>
<variables id="116" type="java.util.HashMap">
<entry>
<key id="117" type="java.lang.String">Table</key>
<value id="118" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="119">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
</variables>
<version>3</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
