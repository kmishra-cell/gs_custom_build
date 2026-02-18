<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.03">
<package-comment/>
<businessobject displayString="3 - V-10" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>true</alwaysPersist>
<clustered>false</clustered>
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
<name id="11">Close Job</name>
<nodeHandler>com.j2fe.streetlamp.activities.CloseJob</nodeHandler>
<nodeHandlerClass id="12">com.j2fe.streetlamp.activities.CloseJob</nodeHandlerClass>
<parameters id="13" type="java.util.HashSet">
<item id="14" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="15">jobId</name>
<stringValue id="16">JobID</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="17" type="java.util.HashSet">
<item id="18" type="com.j2fe.workflow.definition.Transition">
<name id="19">false</name>
<source id="20">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="21"/>
<directJoin>false</directJoin>
<name id="22">Switch Case</name>
<nodeHandler>com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandler>
<nodeHandlerClass id="23">com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandlerClass>
<parameters id="24" type="java.util.HashSet">
<item id="25" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="26">caseItem</name>
<stringValue id="27">hasElement</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="28" type="java.util.HashSet">
<item id="29" type="com.j2fe.workflow.definition.Transition">
<name id="30">goto-next</name>
<source id="31">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="32"/>
<directJoin>false</directJoin>
<name id="33">Bean Shell Script (Standard)</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="34">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="35" type="java.util.HashSet">
<item id="36" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="37">statements</name>
<stringValue id="38">boolean hasElement=false;&#13;
if(msgOutput.length &gt; 0)&#13;
{&#13;
 hasElement=true;&#13;
}</stringValue>
<type>CONSTANT</type>
</item>
<item id="39" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="40">variables["hasElement"]</name>
<stringValue id="41">hasElement</stringValue>
<type>VARIABLE</type>
</item>
<item id="42" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="43">variables["msgOutput"]</name>
<stringValue id="44">XMLmessageoutput</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="45" type="java.util.HashSet">
<item id="46" type="com.j2fe.workflow.definition.Transition">
<name id="47">goto-next</name>
<source id="48">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="49"/>
<directJoin>false</directJoin>
<name id="50">LDAP Synchronization</name>
<nodeHandler>com.j2fe.management.LDAPSynchronization</nodeHandler>
<nodeHandlerClass id="51">com.j2fe.management.LDAPSynchronization</nodeHandlerClass>
<parameters id="52" type="java.util.HashSet">
<item id="53" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="54">attributeMappingFileURI</name>
<stringValue id="55">db://resource/ldap/defaultUserMapping.xml</stringValue>
<type>CONSTANT</type>
</item>
<item id="56" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="57">dataSource</name>
<stringValue id="58">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="59" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="60">groupRoleAttribute</name>
<stringValue id="61">UserRolesAttribute</stringValue>
<type>VARIABLE</type>
</item>
<item id="62" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="63">jobId</name>
<stringValue id="64">JobID</stringValue>
<type>VARIABLE</type>
</item>
<item id="65" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="66">outputMessages</name>
<stringValue id="67">XMLmessageoutput</stringValue>
<type>VARIABLE</type>
</item>
<item id="68" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="69">password</name>
<stringValue id="70">LDAPPassword</stringValue>
<type>VARIABLE</type>
</item>
<item id="71" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="72">providerUrl</name>
<stringValue id="73">LDAPServerURL</stringValue>
<type>VARIABLE</type>
</item>
<item id="74" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="75">roleBasePath</name>
<stringValue id="76">RoleBasePath</stringValue>
<type>VARIABLE</type>
</item>
<item id="77" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="78">roleFilter</name>
<stringValue id="79">RoleFilter</stringValue>
<type>VARIABLE</type>
</item>
<item id="80" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="81">roleIdentifierAttribute</name>
<stringValue id="82">RoleIdentifierAttribute</stringValue>
<type>VARIABLE</type>
</item>
<item id="83" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="84">roleMemberAttribute</name>
<stringValue id="85">RoleMemberAttribute</stringValue>
<type>VARIABLE</type>
</item>
<item id="86" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="87">roleRecursion</name>
<objectValue id="88" type="java.lang.Integer">9</objectValue>
<type>CONSTANT</type>
</item>
<item id="89" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="90">synchronize</name>
<stringValue id="91">DeleteNonExistentUsers</stringValue>
<type>VARIABLE</type>
</item>
<item id="92" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="93">user</name>
<stringValue id="94">LDAPUser</stringValue>
<type>VARIABLE</type>
</item>
<item id="95" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="96">userBasePath</name>
<stringValue id="97">UserBasePath</stringValue>
<type>VARIABLE</type>
</item>
<item id="98" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="99">userFilter</name>
<stringValue id="100">UserFilter</stringValue>
<type>VARIABLE</type>
</item>
<item id="101" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="102">userIdentifierAttribute</name>
<stringValue id="103">UserIdentifierAttribute</stringValue>
<type>VARIABLE</type>
</item>
<item id="104" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="105">userRolesAttributes</name>
<stringValue id="106">UserRolesAttribute</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<persistentVariables id="107" type="java.util.HashSet">
<item id="108" type="java.lang.String">XMLmessageoutput
1000</item>
</persistentVariables>
<sources id="109" type="java.util.HashSet">
<item id="110" type="com.j2fe.workflow.definition.Transition">
<name id="111">goto-next</name>
<source id="112">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="113"/>
<directJoin>false</directJoin>
<name id="114">Create Job</name>
<nodeHandler>com.j2fe.streetlamp.activities.CreateJob</nodeHandler>
<nodeHandlerClass id="115">com.j2fe.streetlamp.activities.CreateJob</nodeHandlerClass>
<parameters id="116" type="java.util.HashSet">
<item id="117" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="118">configInfo</name>
<stringValue id="119">Created by the LDAP Synchronization Workflow.</stringValue>
<type>CONSTANT</type>
</item>
<item id="120" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="121">jobId</name>
<stringValue id="122">JobID</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="123" type="java.util.HashSet">
<item id="124" type="com.j2fe.workflow.definition.Transition">
<name id="125">goto-next</name>
<source id="126">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="127"/>
<directJoin>false</directJoin>
<name id="128">Bean Shell Script</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="129">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="130" type="java.util.HashSet">
<item id="131" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="132">statements</name>
<stringValue id="133">if(LDAPServerURL != null)&#13;
{&#13;
	String strLDAP = LDAPServerURL;&#13;
	String strOrgLDAP = LDAPServerURL;&#13;
	strLDAP = strLDAP.toLowerCase();&#13;
&#13;
	if(strLDAP != null &amp;&amp; strLDAP.startsWith("ldap://",0) == false)&#13;
	{&#13;
		LDAPServerURL   = "ldap://";&#13;
		LDAPServerURL +=  strOrgLDAP;&#13;
	}&#13;
}</stringValue>
<type>CONSTANT</type>
</item>
<item id="134" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="135">["LDAPServerURL"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="136">variables["LDAPServerURL"]</name>
<stringValue id="137">LDAPServerURL</stringValue>
<type>VARIABLE</type>
</item>
<item id="138" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="139">["LDAPServerURL"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="140">variables["LDAPServerURL"]</name>
<stringValue id="141">LDAPServerURL</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="142" type="java.util.HashSet">
<item id="143" type="com.j2fe.workflow.definition.Transition">
<name id="144">ANY</name>
<source id="145">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="146"/>
<directJoin>false</directJoin>
<name id="147">Switch Case</name>
<nodeHandler>com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandler>
<nodeHandlerClass id="148">com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandlerClass>
<parameters id="149" type="java.util.HashSet">
<item id="150" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="151">caseItem</name>
<stringValue id="152">SelectOutput</stringValue>
<type>VARIABLE</type>
</item>
<item id="153" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="154">defaultItem</name>
<stringValue id="155">ANY</stringValue>
<type>CONSTANT</type>
</item>
<item id="156" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="157">nullTransition</name>
<stringValue id="158">0</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="159" type="java.util.HashSet">
<item id="160" type="com.j2fe.workflow.definition.Transition">
<name id="161">goto-next</name>
<source id="162">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="163"/>
<directJoin>false</directJoin>
<name id="164">Database Select</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="165">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="166" type="java.util.HashSet">
<item id="167" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="168">database</name>
<stringValue id="169">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="170" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="171">firstColumnsResult[0]</name>
<stringValue id="172">SelectOutput</stringValue>
<type>VARIABLE</type>
</item>
<item id="173" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="174">querySQL</name>
<stringValue id="175">select count(1) from ft_t_sctx</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="176" type="java.util.HashSet">
<item id="177" type="com.j2fe.workflow.definition.Transition">
<name id="178">goto-next</name>
<source id="179">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="180"/>
<directJoin>false</directJoin>
<name id="181">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="182">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="183" type="java.util.HashSet"/>
<targets id="184" type="java.util.HashSet">
<item idref="177" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="162"/>
</item>
</sources>
<targets id="185" type="java.util.HashSet">
<item idref="160" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="145"/>
</item>
</sources>
<targets id="186" type="java.util.HashSet">
<item id="187" type="com.j2fe.workflow.definition.Transition">
<name id="188">0</name>
<source idref="145"/>
<target id="189">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="190"/>
<directJoin>false</directJoin>
<name id="191">Throw Error</name>
<nodeHandler>com.j2fe.workflow.handler.impl.ThrowError</nodeHandler>
<nodeHandlerClass id="192">com.j2fe.workflow.handler.impl.ThrowError</nodeHandlerClass>
<parameters id="193" type="java.util.HashSet">
<item id="194" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="195">message</name>
<stringValue id="196">Workstation is not installed</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="197" type="java.util.HashSet">
<item idref="187" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="198" type="java.util.HashSet">
<item id="199" type="com.j2fe.workflow.definition.Transition">
<name id="200">goto-next</name>
<source idref="189"/>
<target idref="2"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item idref="143" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="126"/>
</item>
</sources>
<targets id="201" type="java.util.HashSet">
<item idref="124" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="112"/>
</item>
</sources>
<targets id="202" type="java.util.HashSet">
<item idref="110" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="48"/>
</item>
</sources>
<targets id="203" type="java.util.HashSet">
<item idref="46" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="31"/>
</item>
</sources>
<targets id="204" type="java.util.HashSet">
<item idref="29" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="20"/>
</item>
</sources>
<targets id="205" type="java.util.HashSet">
<item idref="18" type="com.j2fe.workflow.definition.Transition"/>
<item id="206" type="com.j2fe.workflow.definition.Transition">
<name id="207">true</name>
<source idref="20"/>
<target id="208">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="209"/>
<directJoin>true</directJoin>
<name id="210">For Each Split</name>
<nodeHandler>com.j2fe.workflow.handler.impl.GenericSplit</nodeHandler>
<nodeHandlerClass id="211">com.j2fe.workflow.handler.impl.GenericSplit</nodeHandlerClass>
<parameters id="212" type="java.util.HashSet">
<item id="213" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="214">input</name>
<stringValue id="215">XMLmessageoutput</stringValue>
<type>VARIABLE</type>
</item>
<item id="216" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="217">output</name>
<stringValue id="218">Output</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="219" type="java.util.HashSet">
<item idref="206" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="220" type="java.util.HashSet">
<item id="221" type="com.j2fe.workflow.definition.Transition">
<name id="222">goto-next</name>
<source idref="208"/>
<target id="223">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="224"/>
<directJoin>false</directJoin>
<name id="225">Create Transaction</name>
<nodeHandler>com.j2fe.streetlamp.activities.CreateTransaction</nodeHandler>
<nodeHandlerClass id="226">com.j2fe.streetlamp.activities.CreateTransaction</nodeHandlerClass>
<parameters id="227" type="java.util.HashSet">
<item id="228" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="229">jobId</name>
<stringValue id="230">JobID</stringValue>
<type>VARIABLE</type>
</item>
<item id="231" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="232">messageType</name>
<stringValue id="233">MHILDAPSynchronization</stringValue>
<type>CONSTANT</type>
</item>
<item id="234" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="235">transactionId</name>
<stringValue id="236">TransactionID</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="237" type="java.util.HashSet">
<item idref="221" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="238" type="java.util.HashSet">
<item id="239" type="com.j2fe.workflow.definition.Transition">
<name id="240">goto-next</name>
<source idref="223"/>
<target id="241">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="242"/>
<directJoin>false</directJoin>
<name id="243">Call Subworkflow</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="244">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="245" type="java.util.HashSet">
<item id="246" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="247">["Message"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="248">input["Message"]</name>
<stringValue id="249">Output</stringValue>
<type>VARIABLE</type>
</item>
<item id="250" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="251">["MessageType"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="252">input["MessageType"]</name>
<stringValue id="253">MHILDAPSynchronization</stringValue>
<type>CONSTANT</type>
</item>
<item id="254" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="255">["TransactionId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="256">input["TransactionId"]</name>
<stringValue id="257">TransactionID</stringValue>
<type>VARIABLE</type>
</item>
<item id="258" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="259">name</name>
<stringValue id="260">Basic Message Processing</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="261" type="java.util.HashSet">
<item idref="239" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="262" type="java.util.HashSet">
<item id="263" type="com.j2fe.workflow.definition.Transition">
<name id="264">goto-next</name>
<source idref="241"/>
<target id="265">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="266"/>
<directJoin>true</directJoin>
<name id="267">Synchronize</name>
<nodeHandler>com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandler>
<nodeHandlerClass id="268">com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandlerClass>
<sources id="269" type="java.util.HashSet">
<item idref="263" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="270" type="java.util.HashSet">
<item id="271" type="com.j2fe.workflow.definition.Transition">
<name id="272">goto-next</name>
<source idref="265"/>
<target idref="9"/>
</item>
</targets>
<type>ANDJOIN</type>
</target>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
</targets>
<type>ANDSPLIT</type>
</target>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="9"/>
</item>
<item idref="271" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="273" type="java.util.HashSet">
<item idref="7" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="2"/>
</item>
<item idref="199" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="274" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="275">Mizuho</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="276">user1</lastChangeUser>
<lastUpdate id="277">2025-05-28T14:28:31.000+0100</lastUpdate>
<name id="278">MizuhoLDAPSynchronization</name>
<nodes id="279" type="java.util.HashSet">
<item idref="126" type="com.j2fe.workflow.definition.Node"/>
<item idref="31" type="com.j2fe.workflow.definition.Node"/>
<item idref="241" type="com.j2fe.workflow.definition.Node"/>
<item idref="9" type="com.j2fe.workflow.definition.Node"/>
<item idref="112" type="com.j2fe.workflow.definition.Node"/>
<item idref="223" type="com.j2fe.workflow.definition.Node"/>
<item idref="162" type="com.j2fe.workflow.definition.Node"/>
<item idref="208" type="com.j2fe.workflow.definition.Node"/>
<item idref="48" type="com.j2fe.workflow.definition.Node"/>
<item idref="179" type="com.j2fe.workflow.definition.Node"/>
<item idref="2" type="com.j2fe.workflow.definition.Node"/>
<item idref="145" type="com.j2fe.workflow.definition.Node"/>
<item idref="20" type="com.j2fe.workflow.definition.Node"/>
<item idref="265" type="com.j2fe.workflow.definition.Node"/>
<item idref="189" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>false</optimize>
<parameter id="280" type="java.util.HashMap">
<entry>
<key id="281" type="java.lang.String">DeleteNonExistentUsers</key>
<value id="282" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="283">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<description id="284">Specifies if existing users in the database should be removed if they do not exist any longer in the LDAP directory.</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="285" type="java.lang.String">LDAPPassword</key>
<value id="286" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="287">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="288">The password used to connect to the LDAP Server</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="289" type="java.lang.String">LDAPServerURL</key>
<value id="290" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="291">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="292">The URL for connecting to the LDAP server, the url should be in the following form:
   ldap://&lt;host&gt;:&lt;port&gt;
where port usually is 389.</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="293" type="java.lang.String">LDAPUser</key>
<value id="294" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="295">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="296">The username to connect to the LDAP server.</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="297" type="java.lang.String">RoleBasePath</key>
<value id="298" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="299">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="300">The path in LDAP that leads to the list of roles.</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="301" type="java.lang.String">RoleFilter</key>
<value id="302" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="303">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="304">A LDAP search string that selects all role-objects.</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="305" type="java.lang.String">RoleIdentifierAttribute</key>
<value id="306" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="307">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="308">The attribute in LDAP which identifies a role.</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="309" type="java.lang.String">RoleMemberAttribute</key>
<value id="310" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="311">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="312">A attribute that lists the members of a role.</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="313" type="java.lang.String">UserBasePath</key>
<value id="314" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="315">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="316">The path in LDAP that leads to the list of users.
The default is an example that should be adjusted.</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="317" type="java.lang.String">UserFilter</key>
<value id="318" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="319">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="320">A LDAP search string that selects all user-objects under UserBasePath.</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="321" type="java.lang.String">UserIdentifierAttribute</key>
<value id="322" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="323">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="324">The attribute in LDAP which identifies a user.</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="325" type="java.lang.String">UserRolesAttribute</key>
<value id="326" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="327">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="328">The attribute in LDAP which identifies the roles of a user</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
</parameter>
<permissions id="329" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>false</purgeAtEnd>
<retries>0</retries>
<startNode idref="179"/>
<status>RELEASED</status>
<variables id="330" type="java.util.HashMap">
<entry>
<key id="331" type="java.lang.String">DeleteNonExistentUsers</key>
<value id="332" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="333">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<description id="334">Specifies if existing users in the database should be removed if they do not exist any longer in the LDAP directory.</description>
<persistent>false</persistent>
<value id="335" type="java.lang.Boolean">false</value>
</value>
</entry>
<entry>
<key id="336" type="java.lang.String">LDAPPassword</key>
<value id="337" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="338">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="339">The password used to connect to the LDAP Server</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="340" type="java.lang.String">LDAPServerURL</key>
<value id="341" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="342">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="343">The URL for connecting to the LDAP server, the url should be in the following form:
   ldap://&lt;host&gt;:&lt;port&gt;
where port usually is 389.</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="344" type="java.lang.String">LDAPUser</key>
<value id="345" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="346">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="347">The username to connect to the LDAP server.</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="348" type="java.lang.String">RoleBasePath</key>
<value id="349" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="350">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="351">The path in LDAP that leads to the list of roles.</description>
<persistent>false</persistent>
<value id="352" type="java.lang.String">OU=Security Groups &amp; Distribution Lists,DC=gsc,DC=zz</value>
</value>
</entry>
<entry>
<key id="353" type="java.lang.String">RoleFilter</key>
<value id="354" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="355">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="356">A LDAP search string that selects all role-objects.</description>
<persistent>false</persistent>
<value id="357" type="java.lang.String">(cn=*)</value>
</value>
</entry>
<entry>
<key id="358" type="java.lang.String">RoleIdentifierAttribute</key>
<value id="359" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="360">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="361">The attribute in LDAP which identifies a role.</description>
<persistent>false</persistent>
<value id="362" type="java.lang.String">displayName</value>
</value>
</entry>
<entry>
<key id="363" type="java.lang.String">RoleMemberAttribute</key>
<value id="364" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="365">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="366">A attribute that lists the members of a role.</description>
<persistent>false</persistent>
<value id="367" type="java.lang.String">member</value>
</value>
</entry>
<entry>
<key id="368" type="java.lang.String">UserBasePath</key>
<value id="369" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="370">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="371">The path in LDAP that leads to the list of users.
The default is an example that should be adjusted.</description>
<persistent>false</persistent>
<value id="372" type="java.lang.String">OU=Development,OU=Austria,OU=Europe,OU=Sites,DC=gsc,DC=zz</value>
</value>
</entry>
<entry>
<key id="373" type="java.lang.String">UserFilter</key>
<value id="374" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="375">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="376">A LDAP search string that selects all user-objects under UserBasePath.</description>
<persistent>false</persistent>
<value id="377" type="java.lang.String">(cn=*)</value>
</value>
</entry>
<entry>
<key id="378" type="java.lang.String">UserIdentifierAttribute</key>
<value id="379" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="380">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="381">The attribute in LDAP which identifies a user.</description>
<persistent>false</persistent>
<value id="382" type="java.lang.String">sAMAccountName</value>
</value>
</entry>
<entry>
<key id="383" type="java.lang.String">UserRolesAttribute</key>
<value id="384" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="385">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="386">The attribute in LDAP which identifies the roles of a user</description>
<persistent>false</persistent>
<value id="387" type="java.lang.String">memberOf</value>
</value>
</entry>
</variables>
<version>3</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
