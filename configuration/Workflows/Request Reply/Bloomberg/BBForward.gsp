<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.07">
<package-comment/>
<businessobject displayString="8 - Removed_VendorString" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>false</alwaysPersist>
<clustered>true</clustered>
<comment id="1">Removed_VendorString</comment>
<endNode id="2">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="3">END</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="4">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="5" type="java.util.HashSet">
<item id="6" type="com.j2fe.workflow.definition.Transition">
<name id="7">goto-next</name>
<source id="8">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="9">Call Subworkflow</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="10">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="11" type="java.util.HashSet">
<item id="12" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="13">["AllRequestOIDs"]@[Ljava/lang/String;@</UITypeHint>
<input>true</input>
<name id="14">input["AllRequestOIDs"]</name>
<stringValue id="15">AllRequestOIDs</stringValue>
<type>VARIABLE</type>
</item>
<item id="16" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="17">["BusinessFeed"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="18">input["BusinessFeed"]</name>
<stringValue id="19">BusinessFeed</stringValue>
<type>VARIABLE</type>
</item>
<item id="20" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="21">["DownloadDirectory"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="22">input["DownloadDirectory"]</name>
<stringValue id="23">DownloadDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="24" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="25">["FilePattern"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="26">input["FilePattern"]</name>
<stringValue id="27">FilePattern</stringValue>
<type>VARIABLE</type>
</item>
<item id="28" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="29">["MaxRetryTime"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="30">input["MaxRetryTime"]</name>
<stringValue id="31">MaxRetryTime</stringValue>
<type>VARIABLE</type>
</item>
<item id="32" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="33">["Parent Job Id"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="34">input["Parent Job Id"]</name>
<stringValue id="35">Parent Job Id</stringValue>
<type>VARIABLE</type>
</item>
<item id="36" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="37">["ProcessFilteredMessages"]@java/lang/Boolean@</UITypeHint>
<input>true</input>
<name id="38">input["ProcessFilteredMessages"]</name>
<stringValue id="39">ProcessFilteredMessages</stringValue>
<type>VARIABLE</type>
</item>
<item id="40" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="41">["RemoveDuplicateFields"]@java/lang/Boolean@</UITypeHint>
<input>true</input>
<name id="42">input["RemoveDuplicateFields"]</name>
<stringValue id="43">RemoveDuplicateFields</stringValue>
<type>VARIABLE</type>
</item>
<item id="44" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="45">["RequestTransaction"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="46">input["RequestTransaction"]</name>
<stringValue id="47">RequestTransaction</stringValue>
<type>VARIABLE</type>
</item>
<item id="48" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="49">["UploadDirectory"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="50">input["UploadDirectory"]</name>
<stringValue id="51">UploadDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="52" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="53">["VendorRequest"]@org/w3c/dom/Document@</UITypeHint>
<input>true</input>
<name id="54">input["VendorRequest"]</name>
<stringValue id="55">VendorRequest</stringValue>
<type>VARIABLE</type>
</item>
<item id="56" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="57">["XSLTMappingFile"]@java/net/URI@</UITypeHint>
<input>true</input>
<name id="58">input["XSLTMappingFile"]</name>
<stringValue id="59">XSLTMappingFile</stringValue>
<type>VARIABLE</type>
</item>
<item id="60" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="61">name</name>
<stringValue id="62">BloombergUpDownloadRequestReply</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="63" type="java.util.HashSet">
<item id="64" type="com.j2fe.workflow.definition.Transition">
<name id="65">FTP</name>
<source id="66">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="67">Switch Case</name>
<nodeHandler>com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandler>
<nodeHandlerClass id="68">com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandlerClass>
<parameters id="69" type="java.util.HashSet">
<item id="70" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="71">caseItem</name>
<stringValue id="72">BBFileSystemType</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="73" type="java.util.HashSet">
<item id="74" type="com.j2fe.workflow.definition.Transition">
<name id="75">goto-next</name>
<source id="76">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="77">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="78">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="79" type="java.util.HashSet"/>
<targets id="80" type="java.util.HashSet">
<item idref="74" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="66"/>
</item>
</sources>
<targets id="81" type="java.util.HashSet">
<item idref="64" type="com.j2fe.workflow.definition.Transition"/>
<item id="82" type="com.j2fe.workflow.definition.Transition">
<name id="83">SFTP</name>
<source idref="66"/>
<target id="84">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="85">Call Subworkflow  #2</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="86">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="87" type="java.util.HashSet">
<item id="88" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="89">["AllRequestOIDs"]@[Ljava/lang/String;@</UITypeHint>
<input>true</input>
<name id="90">input["AllRequestOIDs"]</name>
<stringValue id="91">AllRequestOIDs</stringValue>
<type>VARIABLE</type>
</item>
<item id="92" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="93">["BusinessFeed"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="94">input["BusinessFeed"]</name>
<stringValue id="95">BusinessFeed</stringValue>
<type>VARIABLE</type>
</item>
<item id="96" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="97">["DownloadDirectory"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="98">input["DownloadDirectory"]</name>
<stringValue id="99">DownloadDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="100" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="101">["FilePattern"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="102">input["FilePattern"]</name>
<stringValue id="103">FilePattern</stringValue>
<type>VARIABLE</type>
</item>
<item id="104" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="105">["MaxRetryTime"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="106">input["MaxRetryTime"]</name>
<stringValue id="107">MaxRetryTime</stringValue>
<type>VARIABLE</type>
</item>
<item id="108" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="109">["Parent Job Id"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="110">input["Parent Job Id"]</name>
<stringValue id="111">Parent Job Id</stringValue>
<type>VARIABLE</type>
</item>
<item id="112" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="113">["ProcessFilteredMessages"]@java/lang/Boolean@</UITypeHint>
<input>true</input>
<name id="114">input["ProcessFilteredMessages"]</name>
<stringValue id="115">ProcessFilteredMessages</stringValue>
<type>VARIABLE</type>
</item>
<item id="116" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="117">["RemoveDuplicateFields"]@java/lang/Boolean@</UITypeHint>
<input>true</input>
<name id="118">input["RemoveDuplicateFields"]</name>
<stringValue id="119">RemoveDuplicateFields</stringValue>
<type>VARIABLE</type>
</item>
<item id="120" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="121">["RequestTransaction"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="122">input["RequestTransaction"]</name>
<stringValue id="123">RequestTransaction</stringValue>
<type>VARIABLE</type>
</item>
<item id="124" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="125">["UploadDirectory"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="126">input["UploadDirectory"]</name>
<stringValue id="127">UploadDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="128" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="129">["VendorRequestString"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="130">input["VendorRequestString"]</name>
<stringValue id="131">VendorRequestString</stringValue>
<type>VARIABLE</type>
</item>
<item id="132" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="133">["XSLTMappingFile"]@java/net/URI@</UITypeHint>
<input>true</input>
<name id="134">input["XSLTMappingFile"]</name>
<stringValue id="135">XSLTMappingFile</stringValue>
<type>VARIABLE</type>
</item>
<item id="136" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="137">name</name>
<stringValue id="138">BloombergUpDownloadRequestReplySFTP</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="139" type="java.util.HashSet">
<item idref="82" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="140" type="java.util.HashSet">
<item id="141" type="com.j2fe.workflow.definition.Transition">
<name id="142">goto-next</name>
<source idref="84"/>
<target idref="2"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="8"/>
</item>
</sources>
<targets id="143" type="java.util.HashSet">
<item idref="6" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="2"/>
</item>
<item idref="141" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="144" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="145">Request Reply/Bloomberg</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="146">gc_own</lastChangeUser>
<lastUpdate id="147">2025-10-31T13:51:32.000+0000</lastUpdate>
<name id="148">BBForward</name>
<nodes id="149" type="java.util.HashSet">
<item idref="8" type="com.j2fe.workflow.definition.Node"/>
<item idref="84" type="com.j2fe.workflow.definition.Node"/>
<item idref="2" type="com.j2fe.workflow.definition.Node"/>
<item idref="76" type="com.j2fe.workflow.definition.Node"/>
<item idref="66" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>true</optimize>
<parameter id="150" type="java.util.HashMap">
<entry>
<key id="151" type="java.lang.String">AllRequestOIDs</key>
<value id="152" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="153">[Ljava.lang.String;</className>
<clazz>[Ljava.lang.String;</clazz>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="154" type="java.lang.String">BBFileSystemType</key>
<value id="155" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="156">com.j2fe.connector.BBFileSystemType</className>
<clazz>com.j2fe.connector.BBFileSystemType</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="157" type="java.lang.String">BusinessFeed</key>
<value id="158" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="159">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="160" type="java.lang.String">DownloadDirectory</key>
<value id="161" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="162">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="163" type="java.lang.String">FilePattern</key>
<value id="164" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="165">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="166" type="java.lang.String">MaxRetryTime</key>
<value id="167" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="168">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="169" type="java.lang.String">Parent Job Id</key>
<value id="170" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="171">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="172" type="java.lang.String">ProcessFilteredMessages</key>
<value id="173" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="174">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="175" type="java.lang.String">RemoveDuplicateFields</key>
<value id="176" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="177">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="178" type="java.lang.String">RequestTransaction</key>
<value id="179" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="180">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="181" type="java.lang.String">UploadDirectory</key>
<value id="182" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="183">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="184" type="java.lang.String">VendorRequest</key>
<value id="185" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="186">org.w3c.dom.Document</className>
<clazz>org.w3c.dom.Document</clazz>
<description id="187"/>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="188" type="java.lang.String">VendorRequestString</key>
<value id="189" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="190">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="191"/>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="192" type="java.lang.String">XSLTMappingFile</key>
<value id="193" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="194">java.net.URI</className>
<clazz>java.net.URI</clazz>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
</parameter>
<permissions id="195" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>true</purgeAtEnd>
<retries>0</retries>
<startNode idref="76"/>
<status>RELEASED</status>
<variables id="196" type="java.util.HashMap">
<entry>
<key id="197" type="java.lang.String">AllRequestOIDs</key>
<value id="198" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="199">[Ljava.lang.String;</className>
<clazz>[Ljava.lang.String;</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="200" type="java.lang.String">BBFileSystemType</key>
<value id="201" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="202">com.j2fe.connector.BBFileSystemType</className>
<clazz>com.j2fe.connector.BBFileSystemType</clazz>
<persistent>false</persistent>
<value id="203" type="java.lang.String">SFTP</value>
</value>
</entry>
<entry>
<key id="204" type="java.lang.String">BusinessFeed</key>
<value id="205" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="206">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="207" type="java.lang.String">DownloadDirectory</key>
<value id="208" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="209">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="210" type="java.lang.String">FilePattern</key>
<value id="211" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="212">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="213" type="java.lang.String">MaxRetryTime</key>
<value id="214" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="215">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="216" type="java.lang.String">Parent Job Id</key>
<value id="217" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="218">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="219" type="java.lang.String">ProcessFilteredMessages</key>
<value id="220" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="221">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="222" type="java.lang.String">RemoveDuplicateFields</key>
<value id="223" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="224">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<persistent>false</persistent>
<value id="225" type="java.lang.Boolean">true</value>
</value>
</entry>
<entry>
<key id="226" type="java.lang.String">RequestTransaction</key>
<value id="227" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="228">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="229" type="java.lang.String">UploadDirectory</key>
<value id="230" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="231">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="232" type="java.lang.String">VendorRequest</key>
<value id="233" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="234">org.w3c.dom.Document</className>
<clazz>org.w3c.dom.Document</clazz>
<description id="235"/>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="236" type="java.lang.String">VendorRequestString</key>
<value id="237" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="238">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="239"/>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="240" type="java.lang.String">XSLTMappingFile</key>
<value id="241" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="242">java.net.URI</className>
<clazz>java.net.URI</clazz>
<persistent>false</persistent>
</value>
</entry>
</variables>
<version>8</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
