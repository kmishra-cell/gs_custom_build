<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.07">
<package-comment/>
<businessobject displayString="3 - v10" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>false</alwaysPersist>
<clustered>true</clustered>
<comment id="1">v10</comment>
<description id="2">Prepare Request String to be passed to Request Reply Workflow</description>
<endNode id="3">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
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
<directJoin>false</directJoin>
<name id="10">Call Subworkflow</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="11">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="12" type="java.util.HashSet">
<item id="13" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="14">["BBDownloadDirectory"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="15">input["BBDownloadDirectory"]</name>
<stringValue id="16">BBDownloadDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="17" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="18">["BBUploadDirectory"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="19">input["BBUploadDirectory"]</name>
<stringValue id="20">BBUploadDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="21" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="22">["IDCFormat"]@com/j2fe/connector/IDCFormat@</UITypeHint>
<input>true</input>
<name id="23">input["IDCFormat"]</name>
<stringValue id="24">vendorRequestFormat</stringValue>
<type>VARIABLE</type>
</item>
<item id="25" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="26">["IDCRR"]@java/lang/Boolean@</UITypeHint>
<input>true</input>
<name id="27">input["IDCRR"]</name>
<stringValue id="28">IDCRR</stringValue>
<type>VARIABLE</type>
</item>
<item id="29" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="30">["InteractiveDataServiceID"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="31">input["InteractiveDataServiceID"]</name>
<stringValue id="32">interactiveDataServiceID</stringValue>
<type>VARIABLE</type>
</item>
<item id="33" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="34">["InteractiveDataUniverseID"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="35">input["InteractiveDataUniverseID"]</name>
<stringValue id="36">interactiveDataUniverseID</stringValue>
<type>VARIABLE</type>
</item>
<item id="37" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="38">["Message"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="39">input["Message"]</name>
<stringValue id="40">VendorRequest</stringValue>
<type>VARIABLE</type>
</item>
<item id="41" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="42">["NoOfFilesToRunInParallel"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="43">input["NoOfFilesToRunInParallel"]</name>
<objectValue id="44" type="java.lang.Integer">2</objectValue>
<type>CONSTANT</type>
</item>
<item id="45" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="46">name</name>
<stringValue id="47">Request Reply</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="48" type="java.util.HashSet">
<item id="49" type="com.j2fe.workflow.definition.Transition">
<name id="50">Request Reply</name>
<source id="51">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="52">Switch Case</name>
<nodeHandler>com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandler>
<nodeHandlerClass id="53">com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandlerClass>
<parameters id="54" type="java.util.HashSet">
<item id="55" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="56">caseItem</name>
<stringValue id="57">workflow</stringValue>
<type>VARIABLE</type>
</item>
<item id="58" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="59">defaultItem</name>
<stringValue id="60">workflow</stringValue>
<type>VARIABLE</type>
</item>
<item id="61" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="62">nullTransition</name>
<stringValue id="63">workflow</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="64" type="java.util.HashSet">
<item id="65" type="com.j2fe.workflow.definition.Transition">
<name id="66">goto-next</name>
<source id="67">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="68">PrepareVendorRequest</name>
<nodeHandler>com.thegoldensource.publishing.activity.PrepareVendorRequest</nodeHandler>
<nodeHandlerClass id="69">com.thegoldensource.publishing.activity.PrepareVendorRequest</nodeHandlerClass>
<parameters id="70" type="java.util.HashSet">
<item id="71" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="72">GSOName</name>
<stringValue id="73">GSOName</stringValue>
<type>VARIABLE</type>
</item>
<item id="74" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="75">IDCRR</name>
<stringValue id="76">IDCRR</stringValue>
<type>VARIABLE</type>
</item>
<item id="77" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="78">dataSource</name>
<stringValue id="79">DataSource</stringValue>
<type>VARIABLE</type>
</item>
<item id="80" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="81">entityXML</name>
<stringValue id="82">EntityObjectAsXML</stringValue>
<type>VARIABLE</type>
</item>
<item id="83" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="84">extractorFactory</name>
<stringValue id="85">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="86" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="87">interactiveDataServiceID</name>
<stringValue id="88">interactiveDataServiceID</stringValue>
<type>VARIABLE</type>
</item>
<item id="89" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="90">interactiveDataUniverseID</name>
<stringValue id="91">interactiveDataUniverseID</stringValue>
<type>VARIABLE</type>
</item>
<item id="92" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="93">requestFile</name>
<stringValue id="94">requestFile</stringValue>
<type>VARIABLE</type>
</item>
<item id="95" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="96">requestString</name>
<stringValue id="97">VendorRequest</stringValue>
<type>VARIABLE</type>
</item>
<item id="98" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="99">sourceofData</name>
<stringValue id="100">sourceofData</stringValue>
<type>VARIABLE</type>
</item>
<item id="101" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="102">userId</name>
<stringValue id="103">Current User</stringValue>
<type>VARIABLE</type>
</item>
<item id="104" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="105">userId</name>
<stringValue id="106">userId</stringValue>
<type>VARIABLE</type>
</item>
<item id="107" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="108">vendorChainRequestIndicator</name>
<stringValue id="109">vendorChainRequestIndicator</stringValue>
<type>VARIABLE</type>
</item>
<item id="110" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="111">vendorRequestFormat</name>
<stringValue id="112">vendorRequestFormat</stringValue>
<type>VARIABLE</type>
</item>
<item id="113" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="114">vendorServiceName</name>
<stringValue id="115">vendorServiceName</stringValue>
<type>VARIABLE</type>
</item>
<item id="116" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="117">workflowName</name>
<stringValue id="118">workflow</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="119" type="java.util.HashSet">
<item id="120" type="com.j2fe.workflow.definition.Transition">
<name id="121">goto-next</name>
<source id="122">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="123">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="124">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="125" type="java.util.HashSet"/>
<targets id="126" type="java.util.HashSet">
<item idref="120" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="67"/>
</item>
</sources>
<targets id="127" type="java.util.HashSet">
<item idref="65" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="51"/>
</item>
</sources>
<targets id="128" type="java.util.HashSet">
<item id="129" type="com.j2fe.workflow.definition.Transition">
<name id="130">RMDSRequestReply</name>
<source idref="51"/>
<target id="131">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="132">Call Subworkflow</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="133">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="134" type="java.util.HashSet">
<item id="135" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="136">["IsChainRequest"]@java/lang/Boolean@</UITypeHint>
<input>true</input>
<name id="137">input["IsChainRequest"]</name>
<stringValue id="138">vendorChainRequestIndicator</stringValue>
<type>VARIABLE</type>
</item>
<item id="139" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="140">["Message"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="141">input["Message"]</name>
<stringValue id="142">VendorRequest</stringValue>
<type>VARIABLE</type>
</item>
<item id="143" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="144">["RMDS Service"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="145">input["RMDS Service"]</name>
<stringValue id="146">vendorServiceName</stringValue>
<type>VARIABLE</type>
</item>
<item id="147" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="148">name</name>
<stringValue id="149">RMDSRequestReply</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="150" type="java.util.HashSet">
<item idref="129" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="151" type="java.util.HashSet">
<item id="152" type="com.j2fe.workflow.definition.Transition">
<name id="153">goto-next</name>
<source idref="131"/>
<target idref="3"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item idref="49" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="9"/>
</item>
</sources>
<targets id="154" type="java.util.HashSet">
<item idref="7" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="3"/>
</item>
<item idref="152" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="155" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="156">Publishing</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="157">user1</lastChangeUser>
<lastUpdate id="158">2025-09-19T17:19:30.000+0100</lastUpdate>
<name id="159">PrepareRequest</name>
<nodes id="160" type="java.util.HashSet">
<item idref="9" type="com.j2fe.workflow.definition.Node"/>
<item idref="131" type="com.j2fe.workflow.definition.Node"/>
<item idref="67" type="com.j2fe.workflow.definition.Node"/>
<item idref="122" type="com.j2fe.workflow.definition.Node"/>
<item idref="3" type="com.j2fe.workflow.definition.Node"/>
<item idref="51" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>true</optimize>
<parameter id="161" type="java.util.HashMap">
<entry>
<key id="162" type="java.lang.String">BBDownloadDirectory</key>
<value id="163" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="164">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="165"/>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="166" type="java.lang.String">BBUploadDirectory</key>
<value id="167" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="168">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="169"/>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="170" type="java.lang.String">Current User</key>
<value id="171" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="172">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="173">Current User that initiated the request</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="174" type="java.lang.String">DataSource</key>
<value id="175" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="176">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="177">DataSource</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="178" type="java.lang.String">EntityObjectAsXML</key>
<value id="179" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="180">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="181">Entity Object as XML String</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="182" type="java.lang.String">GSOName</key>
<value id="183" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="184">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="185">Name of the GSO</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
</parameter>
<permissions id="186" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>true</purgeAtEnd>
<retries>0</retries>
<startNode idref="122"/>
<status>RELEASED</status>
<variables id="187" type="java.util.HashMap">
<entry>
<key id="188" type="java.lang.String">BBDownloadDirectory</key>
<value id="189" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="190">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="191"/>
<persistent>false</persistent>
<value id="192" type="java.lang.String">/gold/GSFTP/files/bbg_esb_temp</value>
</value>
</entry>
<entry>
<key id="193" type="java.lang.String">BBUploadDirectory</key>
<value id="194" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="195">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="196"/>
<persistent>false</persistent>
<value id="197" type="java.lang.String">/gold/GSFTP/files/bbg_esb_temp</value>
</value>
</entry>
<entry>
<key id="198" type="java.lang.String">Current User</key>
<value id="199" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="200">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="201">Current User that initiated the request</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="202" type="java.lang.String">DataSource</key>
<value id="203" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="204">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="205">DataSource</description>
<persistent>false</persistent>
<value id="206" type="java.lang.String">jdbc/GSDM-1</value>
</value>
</entry>
<entry>
<key id="207" type="java.lang.String">EntityObjectAsXML</key>
<value id="208" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="209">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="210">Entity Object as XML String</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="211" type="java.lang.String">GSOName</key>
<value id="212" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="213">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="214">Name of the GSO</description>
<persistent>false</persistent>
</value>
</entry>
</variables>
<version>3</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
