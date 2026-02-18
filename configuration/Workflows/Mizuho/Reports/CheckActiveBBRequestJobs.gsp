<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.07">
<package-comment/>
<businessobject displayString="9 - V10-EnvNme-Added" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>false</alwaysPersist>
<clustered>true</clustered>
<comment id="1">V10-EnvNme-Added</comment>
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
<stringValue id="16">Recipients</stringValue>
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
<stringValue id="28">Recipients</stringValue>
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
<stringValue id="34">emailSubject</stringValue>
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
<name id="40">jobs active email header</name>
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
<stringValue id="48">emailSubject</stringValue>
<type>VARIABLE</type>
</item>
<item id="49" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="50">querySQL</name>
<stringValue id="51">SELECT
'[' || 
       (SELECT Env_Nme FROM MIZ_Environment_Name) || 
       ']: '||' Bloomberg Request-Reply Jobs are active' AS env</stringValue>
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
<name id="57">Create Job email</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="58">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="59" type="java.util.HashSet">
<item id="60" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="61">statements</name>
<stringValue id="62">String mail = "&lt;html&gt;&lt;body&gt;&lt;p&gt;&lt;b&gt;Active Bloomberg Request-Reply jobs:-&lt;/b&gt;&lt;/p&gt;";&#13;
&#13;
&#13;
mail = mail + "&lt;table&gt;&lt;tr style='background:SILVER;color:BLACK'&gt;";&#13;
mail = mail + "&lt;td&gt;&lt;p&gt;Workflow Name&lt;/p&gt;&lt;/td&gt;";&#13;
mail = mail + "&lt;td&gt;&lt;p&gt;Workflow Status&lt;/p&gt;&lt;/td&gt;&lt;/tr&gt;";&#13;
&#13;
for(int i=0; i&lt; jobList.length; i++){&#13;
	mail = mail + "&lt;tr&gt;";&#13;
	mail = mail + "&lt;td&gt;&lt;p&gt;" + jobList[i].get("TRIGGER_NAME") + "&lt;/p&gt;&lt;/td&gt;";&#13;
	mail = mail + "&lt;td&gt;&lt;p&gt;" + jobList[i].get("TRIGGER_STATE") + "&lt;/p&gt;&lt;/td&gt;";&#13;
	mail = mail + "&lt;/tr&gt;";&#13;
}&#13;
&#13;
mail = mail + "&lt;/table&gt;&lt;p&gt;&lt;/p&gt;&amp;nbsp;&lt;/p&gt;";</stringValue>
<type>CONSTANT</type>
</item>
<item id="63" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="64">["jobList"]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="65">variables["jobList"]</name>
<stringValue id="66">queryOutput</stringValue>
<type>VARIABLE</type>
</item>
<item id="67" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="68">["mail"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="69">variables["mail"]</name>
<stringValue id="70">mail</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="71" type="java.util.HashSet">
<item id="72" type="com.j2fe.workflow.definition.Transition">
<name id="73">rows-found</name>
<source id="74">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="75"/>
<directJoin>false</directJoin>
<name id="76">Active Jobs Check</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="77">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="78" type="java.util.HashSet">
<item id="79" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="80">database</name>
<stringValue id="81">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="82" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="83">mappedResult</name>
<stringValue id="84">queryOutput</stringValue>
<type>VARIABLE</type>
</item>
<item id="85" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="86">querySQL</name>
<stringValue id="87">&#13;
select t1.TRIGGER_NAME, t1.TRIGGER_STATE from &#13;
(&#13;
	select&#13;
  		qrtz_triggers.TRIGGER_NAME,&#13;
  		qrtz_triggers.TRIGGER_STATE&#13;
	from qrtz_triggers&#13;
		where qrtz_triggers.TRIGGER_NAME in ('BBPerSecurityBulkRequest', 'BBPerSecurityYieldCurve')&#13;
			and qrtz_triggers.TRIGGER_STATE not in ('PAUSED')&#13;
	order by qrtz_triggers.TRIGGER_NAME asc&#13;
) as t1&#13;
</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="88" type="java.util.HashSet">
<item id="89" type="com.j2fe.workflow.definition.Transition">
<name id="90">rows-found</name>
<source id="91">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="92"/>
<directJoin>false</directJoin>
<name id="93">is This Prod?</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="94">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="95" type="java.util.HashSet">
<item id="96" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="97">database</name>
<stringValue id="98">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="99" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="100">mappedResult</name>
<stringValue id="101">isThisPRD</stringValue>
<type>VARIABLE</type>
</item>
<item id="102" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="103">querySQL</name>
<stringValue id="104">SELECT current_database() AS ora_database_name&#13;
WHERE current_database() NOT LIKE 'OPLRDDB%'</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="105" type="java.util.HashSet">
<item id="106" type="com.j2fe.workflow.definition.Transition">
<name id="107">goto-next</name>
<source id="108">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="109"/>
<directJoin>false</directJoin>
<name id="110">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="111">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="112" type="java.util.HashSet"/>
<targets id="113" type="java.util.HashSet">
<item idref="106" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="91"/>
</item>
</sources>
<targets id="114" type="java.util.HashSet">
<item id="115" type="com.j2fe.workflow.definition.Transition">
<name id="116">nothing-found</name>
<source idref="91"/>
<target idref="2"/>
</item>
<item idref="89" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="74"/>
</item>
</sources>
<targets id="117" type="java.util.HashSet">
<item id="118" type="com.j2fe.workflow.definition.Transition">
<name id="119">nothing-found</name>
<source idref="74"/>
<target id="120">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="121"/>
<directJoin>false</directJoin>
<name id="122">Create no Jobs email</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="123">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="124" type="java.util.HashSet">
<item id="125" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="126">statements</name>
<stringValue id="127">String mail = "&lt;html&gt;&lt;body&gt;&lt;p&gt;&lt;b&gt;There are no active Bloomberg Request-Reply jobs:-&lt;/b&gt;&lt;/p&gt;";&#13;
&#13;
mail = mail + "&lt;p&gt;&lt;/p&gt;&amp;nbsp;&lt;/p&gt;";&#13;
</stringValue>
<type>CONSTANT</type>
</item>
<item id="128" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="129">["jobList"]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="130">variables["jobList"]</name>
<stringValue id="131">queryOutput</stringValue>
<type>VARIABLE</type>
</item>
<item id="132" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="133">["mail"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="134">variables["mail"]</name>
<stringValue id="135">mail</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="136" type="java.util.HashSet">
<item idref="118" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="137" type="java.util.HashSet">
<item id="138" type="com.j2fe.workflow.definition.Transition">
<name id="139">goto-next</name>
<source idref="120"/>
<target id="140">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="141"/>
<directJoin>false</directJoin>
<name id="142">no jobs email header</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="143">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="144" type="java.util.HashSet">
<item id="145" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="146">database</name>
<stringValue id="147">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="148" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="149">firstColumnsResult[0]</name>
<stringValue id="150">emailSubject</stringValue>
<type>VARIABLE</type>
</item>
<item id="151" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="152">querySQL</name>
<stringValue id="153">SELECT
  '[' || 
       (SELECT Env_Nme FROM MIZ_Environment_Name) || 
  ']: There are no active Bloomberg Request-Reply Jobs' AS env</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="154" type="java.util.HashSet">
<item idref="138" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="155" type="java.util.HashSet">
<item id="156" type="com.j2fe.workflow.definition.Transition">
<name id="157">goto-next</name>
<source idref="140"/>
<target idref="9"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item idref="72" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="55"/>
</item>
</sources>
<targets id="158" type="java.util.HashSet">
<item idref="53" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="38"/>
</item>
</sources>
<targets id="159" type="java.util.HashSet">
<item idref="36" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="9"/>
</item>
<item idref="156" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="160" type="java.util.HashSet">
<item idref="7" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="2"/>
</item>
<item idref="115" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="161" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="162">Mizuho/Reports</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="163">user1</lastChangeUser>
<lastUpdate id="164">2025-11-26T15:06:23.000+0000</lastUpdate>
<name id="165">CheckActiveBBRequestJobs</name>
<nodes id="166" type="java.util.HashSet">
<item idref="74" type="com.j2fe.workflow.definition.Node"/>
<item idref="55" type="com.j2fe.workflow.definition.Node"/>
<item idref="120" type="com.j2fe.workflow.definition.Node"/>
<item idref="9" type="com.j2fe.workflow.definition.Node"/>
<item idref="108" type="com.j2fe.workflow.definition.Node"/>
<item idref="2" type="com.j2fe.workflow.definition.Node"/>
<item idref="91" type="com.j2fe.workflow.definition.Node"/>
<item idref="38" type="com.j2fe.workflow.definition.Node"/>
<item idref="140" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>true</optimize>
<parameter id="167" type="java.util.HashMap">
<entry>
<key id="168" type="java.lang.String">CopyIn</key>
<value id="169" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="170">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="171">Multiple addresses separated by ;</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="172" type="java.lang.String">Recipients</key>
<value id="173" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="174">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="175">Multiple addresses separated by ;</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
</parameter>
<permissions id="176" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>true</purgeAtEnd>
<retries>0</retries>
<startNode idref="108"/>
<status>RELEASED</status>
<variables id="177" type="java.util.HashMap">
<entry>
<key id="178" type="java.lang.String">CopyIn</key>
<value id="179" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="180">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="181">Multiple addresses separated by ;</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="182" type="java.lang.String">Recipients</key>
<value id="183" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="184">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="185">Multiple addresses separated by ;</description>
<persistent>false</persistent>
</value>
</entry>
</variables>
<version>9</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
