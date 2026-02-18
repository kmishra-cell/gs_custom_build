<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.07">
<package-comment/>
<businessobject displayString="13 - v10 RemotePub - Parallel Branches" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>false</alwaysPersist>
<clustered>false</clustered>
<comment id="1">v10 RemotePub - Parallel Branches</comment>
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
<name id="11">NOP (Standard)</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="12">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="13" type="java.util.HashSet">
<item id="14" type="com.j2fe.workflow.definition.Transition">
<name id="15">goto-next</name>
<source id="16">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="17"/>
<directJoin>true</directJoin>
<name id="18">Synchronize</name>
<nodeHandler>com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandler>
<nodeHandlerClass id="19">com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandlerClass>
<sources id="20" type="java.util.HashSet">
<item id="21" type="com.j2fe.workflow.definition.Transition">
<name id="22">goto-next</name>
<source id="23">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="24"/>
<directJoin>false</directJoin>
<name id="25">Raise Event Remote #1</name>
<nodeHandler>com.j2fe.event.RaiseEventRemote</nodeHandler>
<nodeHandlerClass id="26">com.j2fe.event.RaiseEventRemote</nodeHandlerClass>
<parameters id="27" type="java.util.HashSet">
<item id="28" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="29">eventName</name>
<stringValue id="30">MizBulkExtraction_Event</stringValue>
<type>CONSTANT</type>
</item>
<item id="31" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="32">["AuditId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="33">parameters["AuditId"]</name>
<stringValue id="34">auditIdentifier</stringValue>
<type>VARIABLE</type>
</item>
<item id="35" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="36">["ExtDefs"]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="37">parameters["ExtDefs"]</name>
<stringValue id="38">extDefsPerBranch</stringValue>
<type>VARIABLE</type>
</item>
<item id="39" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="40">["JMSDestination"]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="41">parameters["JMSDestination"]</name>
<stringValue id="42">jmsDestination</stringValue>
<type>VARIABLE</type>
</item>
<item id="43" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="44">["PublishingBulkSize"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="45">parameters["PublishingBulkSize"]</name>
<stringValue id="46">PublishingBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="47" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="48">["Threshold for Extraction Failures"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="49">parameters["Threshold for Extraction Failures"]</name>
<stringValue id="50">Threshold for extraction failures</stringValue>
<type>VARIABLE</type>
</item>
<item id="51" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="52">propertyFileLocation</name>
<stringValue id="53">db://resource/PublishingConfiguration/PublishingConfig.properties</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="54" type="java.util.HashSet">
<item id="55" type="com.j2fe.workflow.definition.Transition">
<name id="56">goto-next</name>
<source id="57">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="58"/>
<directJoin>true</directJoin>
<name id="59">Bulk Items</name>
<nodeHandler>com.j2fe.general.activities.BulkItems</nodeHandler>
<nodeHandlerClass id="60">com.j2fe.general.activities.BulkItems</nodeHandlerClass>
<parameters id="61" type="java.util.HashSet">
<item id="62" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="63">bulk</name>
<stringValue id="64">pubBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="65" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="66">input</name>
<stringValue id="67">extractDefinitions</stringValue>
<type>VARIABLE</type>
</item>
<item id="68" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="69">output</name>
<stringValue id="70">extDefsPerBranch</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="71" type="java.util.HashSet">
<item id="72" type="com.j2fe.workflow.definition.Transition">
<name id="73">goto-next</name>
<source id="74">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="75"/>
<directJoin>false</directJoin>
<name id="76">Bean Shell Script (Standard)</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="77">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="78" type="java.util.HashSet">
<item id="79" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="80">statements</name>
<stringValue id="81">if(NoOfThreads &lt;= 0) {&#13;
	NoOfThreads = 1;&#13;
}&#13;
else if(items &lt; NoOfThreads)&#13;
{&#13;
NoOfThreads = items;&#13;
}&#13;
bulkSize = items / NoOfThreads;&#13;
if(items % NoOfThreads != 0)&#13;
{&#13;
bulkSize = bulkSize +1;&#13;
}</stringValue>
<type>CONSTANT</type>
</item>
<item id="82" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="83">["NoOfThreads"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="84">variables["NoOfThreads"]</name>
<stringValue id="85">No. of parallel branches</stringValue>
<type>VARIABLE</type>
</item>
<item id="86" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="87">["bulkSize"]@java/lang/Integer@</UITypeHint>
<input>false</input>
<name id="88">variables["bulkSize"]</name>
<stringValue id="89">pubBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="90" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="91">["items"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="92">variables["items"]</name>
<stringValue id="93">extractDefinitions</stringValue>
<type>VARIABLE</type>
<variablePart id="94">length</variablePart>
</item>
</parameters>
<sources id="95" type="java.util.HashSet">
<item id="96" type="com.j2fe.workflow.definition.Transition">
<name id="97">goto-next</name>
<source id="98">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="99"/>
<directJoin>false</directJoin>
<name id="100">Determine jms queue</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="101">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="102" type="java.util.HashSet">
<item id="103" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="104">statements</name>
<stringValue id="105">String jmsDestination = "";&#13;
if ("MHSC".equals(org_id)) {&#13;
	jmsDestination="jms/queue/mhscLegalAgreement";&#13;
}&#13;
else {&#13;
	jmsDestination="jms/queue/legalAgreement";&#13;
}&#13;
&#13;
return jmsDestination;</stringValue>
<type>CONSTANT</type>
</item>
<item id="106" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="107">variables["jmsDestination"]</name>
<stringValue id="108">jmsDestination</stringValue>
<type>VARIABLE</type>
</item>
<item id="109" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="110">["org_id"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="111">variables["org_id"]</name>
<stringValue id="112">OrgId</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="113" type="java.util.HashSet">
<item id="114" type="com.j2fe.workflow.definition.Transition">
<name id="115">extraction</name>
<source id="116">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="117"/>
<directJoin>false</directJoin>
<name id="118"> Extraction Log</name>
<nodeHandler>com.thegoldensource.publishing.activity.WriteExtractionLog</nodeHandler>
<nodeHandlerClass id="119">com.thegoldensource.publishing.activity.WriteExtractionLog</nodeHandlerClass>
<parameters id="120" type="java.util.HashSet">
<item id="121" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="122">auditId</name>
<stringValue id="123">auditIdentifier</stringValue>
<type>VARIABLE</type>
</item>
<item id="124" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="125">entityMode</name>
<stringValue id="126">MODEL_ENTITY</stringValue>
<type>CONSTANT</type>
</item>
<item id="127" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="128">eql</name>
<stringValue id="129">PublishQuery</stringValue>
<type>VARIABLE</type>
</item>
<item id="130" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="131">extractDefinitions</name>
<stringValue id="132">extractDefinitions</stringValue>
<type>VARIABLE</type>
</item>
<item id="133" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="134">extractorFactory</name>
<stringValue id="135">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="136" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="137">maxExtractCount</name>
<stringValue id="138">PublishingBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="139" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="140">modelName</name>
<stringValue id="141">LAGR_PUB</stringValue>
<type>CONSTANT</type>
</item>
<item id="142" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="143">queryParameter</name>
<stringValue id="144">queryParameter</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="145" type="java.util.HashSet">
<item id="146" type="com.j2fe.workflow.definition.Transition">
<name id="147">goto-next</name>
<source id="148">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="149"/>
<directJoin>false</directJoin>
<name id="150">Legal Agreements Publish Query</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="151">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="152" type="java.util.HashSet">
<item id="153" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="154">statements</name>
<stringValue id="155">query="&lt;sql&gt;lagr_oid in (select lagr_oid from ft_T_lagr where org_id = '" + org_id + "' and agrmnt_purp_typ in ('LEGAGRMT','LGAGTCEA','LGAGTREPO')  AND end_tms IS NULL  )&lt;/sql&gt;";</stringValue>
<type>CONSTANT</type>
</item>
<item id="156" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="157">["org_id"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="158">variables["org_id"]</name>
<stringValue id="159">OrgId</stringValue>
<type>VARIABLE</type>
</item>
<item id="160" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="161">variables["query"]</name>
<stringValue id="162">PublishQuery</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="163" type="java.util.HashSet">
<item id="164" type="com.j2fe.workflow.definition.Transition">
<name id="165">goto-next</name>
<source id="166">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="167"/>
<directJoin>false</directJoin>
<name id="168">Report org_id</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="169">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="170" type="java.util.HashSet">
<item id="171" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="172">statements</name>
<stringValue id="173">import java.util.ArrayList;&#13;
import java.util.Arrays;&#13;
&#13;
    System.out.println("ORG_ID = " + org_id);&#13;
</stringValue>
<type>CONSTANT</type>
</item>
<item id="174" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="175">["org_id"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="176">variables["org_id"]</name>
<stringValue id="177">OrgId</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="178" type="java.util.HashSet">
<item id="179" type="com.j2fe.workflow.definition.Transition">
<name id="180">goto-next</name>
<source id="181">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="182"/>
<directJoin>false</directJoin>
<name id="183">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="184">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="185" type="java.util.HashSet"/>
<targets id="186" type="java.util.HashSet">
<item idref="179" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="166"/>
</item>
</sources>
<targets id="187" type="java.util.HashSet">
<item idref="164" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="148"/>
</item>
</sources>
<targets id="188" type="java.util.HashSet">
<item idref="146" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="116"/>
</item>
</sources>
<targets id="189" type="java.util.HashSet">
<item idref="114" type="com.j2fe.workflow.definition.Transition"/>
<item id="190" type="com.j2fe.workflow.definition.Transition">
<name id="191">no-extraction</name>
<source idref="116"/>
<target idref="9"/>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="98"/>
</item>
</sources>
<targets id="192" type="java.util.HashSet">
<item idref="96" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="74"/>
</item>
</sources>
<targets id="193" type="java.util.HashSet">
<item idref="72" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="57"/>
</item>
</sources>
<targets id="194" type="java.util.HashSet">
<item idref="55" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDSPLIT</type>
</source>
<target idref="23"/>
</item>
</sources>
<targets id="195" type="java.util.HashSet">
<item idref="21" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="16"/>
</item>
</sources>
<targets id="196" type="java.util.HashSet">
<item idref="14" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDJOIN</type>
</source>
<target idref="9"/>
</item>
<item idref="190" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="197" type="java.util.HashSet">
<item idref="7" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="2"/>
</item>
</sources>
<targets id="198" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="199">Mizuho/Publishing</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="200">user1</lastChangeUser>
<lastUpdate id="201">2025-11-20T00:36:41.000+0000</lastUpdate>
<name id="202">MZ_WF_LegalAgrmntBulkPublish</name>
<nodes id="203" type="java.util.HashSet">
<item idref="116" type="com.j2fe.workflow.definition.Node"/>
<item idref="74" type="com.j2fe.workflow.definition.Node"/>
<item idref="57" type="com.j2fe.workflow.definition.Node"/>
<item idref="98" type="com.j2fe.workflow.definition.Node"/>
<item idref="148" type="com.j2fe.workflow.definition.Node"/>
<item idref="9" type="com.j2fe.workflow.definition.Node"/>
<item idref="23" type="com.j2fe.workflow.definition.Node"/>
<item idref="166" type="com.j2fe.workflow.definition.Node"/>
<item idref="181" type="com.j2fe.workflow.definition.Node"/>
<item idref="2" type="com.j2fe.workflow.definition.Node"/>
<item idref="16" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>true</optimize>
<parameter id="204" type="java.util.HashMap">
<entry>
<key id="205" type="java.lang.String">No. of parallel branches</key>
<value id="206" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="207">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="208">This defines how many branches would run in parallel while publishing</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="209" type="java.lang.String">OrgId</key>
<value id="210" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="211">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="212" type="java.lang.String">OutputMessage</key>
<value id="213" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="214">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>false</input>
<output>true</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="215" type="java.lang.String">PublishingBulkSize</key>
<value id="216" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="217">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="218">It defines number of entities to be extracted in one bulk</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="219" type="java.lang.String">Threshold for extraction failures</key>
<value id="220" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="221">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
</parameter>
<permissions id="222" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>false</purgeAtEnd>
<retries>0</retries>
<startNode idref="181"/>
<status>RELEASED</status>
<variables id="223" type="java.util.HashMap">
<entry>
<key id="224" type="java.lang.String">No. of parallel branches</key>
<value id="225" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="226">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="227">This defines how many branches would run in parallel while publishing</description>
<persistent>false</persistent>
<value id="228" type="java.lang.Integer">5</value>
</value>
</entry>
<entry>
<key id="229" type="java.lang.String">OrgId</key>
<value id="230" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="231">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="232" type="java.lang.String">OutputMessage</key>
<value id="233" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="234">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>true</persistent>
<value id="235" type="java.lang.String">&lt;?xml version='1.0' encoding='utf-8'?&gt;&lt;OutputMsg&gt;Publish done!&lt;/OutputMsg&gt;</value>
</value>
</entry>
<entry>
<key id="236" type="java.lang.String">PublishingBulkSize</key>
<value id="237" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="238">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="239">It defines number of entities to be extracted in one bulk</description>
<persistent>false</persistent>
<value id="240" type="java.lang.Integer">100</value>
</value>
</entry>
<entry>
<key id="241" type="java.lang.String">Threshold for extraction failures</key>
<value id="242" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="243">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
</variables>
<version>13</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
