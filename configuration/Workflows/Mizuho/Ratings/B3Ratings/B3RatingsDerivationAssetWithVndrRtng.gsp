<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.03">
<package-comment/>
<businessobject displayString="3 - GU-311" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>false</alwaysPersist>
<clustered>true</clustered>
<comment id="1">GU-311</comment>
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
<name id="9">NOP</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="10">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="11" type="java.util.HashSet">
<item id="12" type="com.j2fe.workflow.definition.Transition">
<name id="13">goto-next</name>
<source id="14">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>true</directJoin>
<name id="15">Synchronize</name>
<nodeHandler>com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandler>
<nodeHandlerClass id="16">com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandlerClass>
<sources id="17" type="java.util.HashSet">
<item id="18" type="com.j2fe.workflow.definition.Transition">
<name id="19">goto-next</name>
<source id="20">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="21">Call Subworkflow</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="22">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="23" type="java.util.HashSet">
<item id="24" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="25">["JobID"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="26">input["JobID"]</name>
<stringValue id="27">jobId</stringValue>
<type>VARIABLE</type>
</item>
<item id="28" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="29">["bulkRealMsgs"]@[Ljava/lang/String;@</UITypeHint>
<input>true</input>
<name id="30">input["bulkRealMsgs"]</name>
<stringValue id="31">RealMsgsBulk</stringValue>
<type>VARIABLE</type>
</item>
<item id="32" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="33">name</name>
<stringValue id="34">B3RealMessageProcessorBulkWrapper</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="35" type="java.util.HashSet">
<item id="36" type="com.j2fe.workflow.definition.Transition">
<name id="37">goto-next</name>
<source id="38">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>true</directJoin>
<name id="39">Bulk Items</name>
<nodeHandler>com.j2fe.general.activities.BulkItems</nodeHandler>
<nodeHandlerClass id="40">com.j2fe.general.activities.BulkItems</nodeHandlerClass>
<parameters id="41" type="java.util.HashSet">
<item id="42" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="43">bulk</name>
<stringValue id="44">bulkSplitSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="45" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="46">input</name>
<stringValue id="47">StreetRefMsgList</stringValue>
<type>VARIABLE</type>
</item>
<item id="48" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="49">output</name>
<stringValue id="50">RealMsgsBulk</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="51" type="java.util.HashSet">
<item id="52" type="com.j2fe.workflow.definition.Transition">
<name id="53">goto-next</name>
<source id="54">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="55">Thread to Bulk</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="56">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="57" type="java.util.HashSet">
<item id="58" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="59">statements</name>
<stringValue id="60">if(NoOfThreads &lt;= 0) {
	NoOfThreads = 1;
}
else if(items &lt; NoOfThreads)
{
	NoOfThreads = items;
	if (NoOfThreads == 0) {
		NoOfThreads = 1;
	}
}
int bulkSize = items / NoOfThreads;
if(items % NoOfThreads != 0)
{
	bulkSize = bulkSize + 1;
}</stringValue>
<type>CONSTANT</type>
</item>
<item id="61" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="62">["NoOfThreads"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="63">variables["NoOfThreads"]</name>
<stringValue id="64">ParallelBranches</stringValue>
<type>VARIABLE</type>
</item>
<item id="65" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="66">["bulkSize"]@java/lang/Integer@</UITypeHint>
<input>false</input>
<name id="67">variables["bulkSize"]</name>
<stringValue id="68">bulkSplitSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="69" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="70">["items"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="71">variables["items"]</name>
<stringValue id="72">StreetRefMsgList</stringValue>
<type>VARIABLE</type>
<variablePart id="73">length</variablePart>
</item>
</parameters>
<sources id="74" type="java.util.HashSet">
<item id="75" type="com.j2fe.workflow.definition.Transition">
<name id="76">rows-found</name>
<source id="77">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="78">StreetRef Selector</name>
<nodeHandler>com.j2fe.general.activities.database.XMLQuery</nodeHandler>
<nodeHandlerClass id="79">com.j2fe.general.activities.database.XMLQuery</nodeHandlerClass>
<parameters id="80" type="java.util.HashSet">
<item id="81" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="82">database</name>
<stringValue id="83">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="84" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="85">[0]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="86">indexedParameters[0]</name>
<stringValue id="87">instMnem</stringValue>
<type>VARIABLE</type>
</item>
<item id="88" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="89">queryName</name>
<stringValue id="90">Basel3AssetRatingsWithVndrRtgStreetRefQuery</stringValue>
<type>CONSTANT</type>
</item>
<item id="91" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="92">result</name>
<stringValue id="93">StreetRefMsgList</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="94" type="java.util.HashSet">
<item id="95" type="com.j2fe.workflow.definition.Transition">
<name id="96">goto-next</name>
<source id="97">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="98">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="99">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="100" type="java.util.HashSet"/>
<targets id="101" type="java.util.HashSet">
<item idref="95" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="77"/>
</item>
</sources>
<targets id="102" type="java.util.HashSet">
<item id="103" type="com.j2fe.workflow.definition.Transition">
<name id="104">nothing-found</name>
<source idref="77"/>
<target idref="8"/>
</item>
<item idref="75" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="54"/>
</item>
</sources>
<targets id="105" type="java.util.HashSet">
<item idref="52" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="38"/>
</item>
</sources>
<targets id="106" type="java.util.HashSet">
<item idref="36" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDSPLIT</type>
</source>
<target idref="20"/>
</item>
</sources>
<targets id="107" type="java.util.HashSet">
<item idref="18" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="14"/>
</item>
</sources>
<targets id="108" type="java.util.HashSet">
<item idref="12" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDJOIN</type>
</source>
<target idref="8"/>
</item>
<item idref="103" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="109" type="java.util.HashSet">
<item idref="6" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="2"/>
</item>
</sources>
<targets id="110" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="111">Mizuho/Ratings/B3Ratings</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="112">user1</lastChangeUser>
<lastUpdate id="113">2025-08-01T13:19:48.000+0100</lastUpdate>
<name id="114">B3RatingsDerivationAssetWithVndrRtng</name>
<nodes id="115" type="java.util.HashSet">
<item idref="38" type="com.j2fe.workflow.definition.Node"/>
<item idref="20" type="com.j2fe.workflow.definition.Node"/>
<item idref="8" type="com.j2fe.workflow.definition.Node"/>
<item idref="97" type="com.j2fe.workflow.definition.Node"/>
<item idref="2" type="com.j2fe.workflow.definition.Node"/>
<item idref="77" type="com.j2fe.workflow.definition.Node"/>
<item idref="14" type="com.j2fe.workflow.definition.Node"/>
<item idref="54" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>true</optimize>
<parameter id="116" type="java.util.HashMap">
<entry>
<key id="117" type="java.lang.String">ParallelBranches</key>
<value id="118" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="119">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="120" type="java.lang.String">instMnem</key>
<value id="121" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="122">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="123" type="java.lang.String">jobId</key>
<value id="124" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="125">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
</parameter>
<permissions id="126" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>true</purgeAtEnd>
<retries>0</retries>
<startNode idref="97"/>
<status>RELEASED</status>
<variables id="127" type="java.util.HashMap">
<entry>
<key id="128" type="java.lang.String">ParallelBranches</key>
<value id="129" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="130">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<persistent>false</persistent>
<value id="131" type="java.lang.Integer">2</value>
</value>
</entry>
<entry>
<key id="132" type="java.lang.String">instMnem</key>
<value id="133" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="134">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="135" type="java.lang.String">jobId</key>
<value id="136" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="137">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
</variables>
<version>3</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
