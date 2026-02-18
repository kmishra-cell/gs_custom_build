<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.03">
<package-comment/>
<businessobject displayString="3 - V-10" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>false</alwaysPersist>
<clustered>false</clustered>
<comment id="1">V-10</comment>
<description id="2">This workflow is for processing Fitch files (from Fitch FTP account)</description>
<endNode id="3">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="4">END</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="5">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="6" type="java.util.HashSet">
<item id="7" type="com.j2fe.workflow.definition.Transition">
<name id="8">empty</name>
<source id="9">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="10">List Files</name>
<nodeHandler>com.j2fe.feeds.activities.ListFiles</nodeHandler>
<nodeHandlerClass id="11">com.j2fe.feeds.activities.ListFiles</nodeHandlerClass>
<parameters id="12" type="java.util.HashSet">
<item id="13" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="14">businessFeedFilter</name>
<stringValue id="15">BusinessFeed</stringValue>
<type>VARIABLE</type>
</item>
<item id="16" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="17">dataSourceFilter</name>
<stringValue id="18">VendorDefinition</stringValue>
<type>VARIABLE</type>
</item>
<item id="19" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="20">directory</name>
<stringValue id="21">Directory</stringValue>
<type>VARIABLE</type>
</item>
<item id="22" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="23">fileSystem</name>
<stringValue id="24">filesystem/sftp/fitch</stringValue>
<type>REFERENCE</type>
</item>
<item id="25" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="26">fileSystemId</name>
<stringValue id="27">filesystem/sftp/fitch/user</stringValue>
<type>REFERENCE</type>
</item>
<item id="28" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="29">includeBoth</name>
<stringValue id="30">IncludeFilePatternNBusinessFeed</stringValue>
<type>VARIABLE</type>
</item>
<item id="31" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="32">list</name>
<stringValue id="33">Files</stringValue>
<type>VARIABLE</type>
</item>
<item id="34" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="35">pattern</name>
<stringValue id="36">FilePatterns</stringValue>
<type>VARIABLE</type>
</item>
<item id="37" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="38">recursive</name>
<stringValue id="39">RecursiveSearch</stringValue>
<type>VARIABLE</type>
</item>
<item id="40" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="41">sort</name>
<stringValue id="42">SortOrder</stringValue>
<type>VARIABLE</type>
</item>
<item id="43" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="44">sortAscending</name>
<stringValue id="45">SortAscending</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="46" type="java.util.HashSet">
<item id="47" type="com.j2fe.workflow.definition.Transition">
<name id="48">false</name>
<source id="49">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="50">Is Workflow Running?</name>
<nodeHandler>com.j2fe.feeds.activities.CheckRunningWorkflows</nodeHandler>
<nodeHandlerClass id="51">com.j2fe.feeds.activities.CheckRunningWorkflows</nodeHandlerClass>
<parameters id="52" type="java.util.HashSet">
<item id="53" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="54">businessFeed</name>
<stringValue id="55">BusinessFeed</stringValue>
<type>VARIABLE</type>
</item>
<item id="56" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="57">uri</name>
<stringValue id="58">Directory</stringValue>
<type>VARIABLE</type>
</item>
<item id="59" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="60">vendorDefinition</name>
<stringValue id="61">VendorDefinition</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="62" type="java.util.HashSet">
<item id="63" type="com.j2fe.workflow.definition.Transition">
<name id="64">goto-next</name>
<source id="65">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="66">START</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="67">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="68" type="java.util.HashSet"/>
<targets id="69" type="java.util.HashSet">
<item idref="63" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="49"/>
</item>
</sources>
<targets id="70" type="java.util.HashSet">
<item idref="47" type="com.j2fe.workflow.definition.Transition"/>
<item id="71" type="com.j2fe.workflow.definition.Transition">
<name id="72">true</name>
<source idref="49"/>
<target idref="3"/>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="9"/>
</item>
</sources>
<targets id="73" type="java.util.HashSet">
<item idref="7" type="com.j2fe.workflow.definition.Transition"/>
<item id="74" type="com.j2fe.workflow.definition.Transition">
<name id="75">not-empty</name>
<source idref="9"/>
<target id="76">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="77">Call Prepare File Processing</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="78">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="79" type="java.util.HashSet">
<item id="80" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="81">["BusinessFeed"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="82">input["BusinessFeed"]</name>
<stringValue id="83">BusinessFeed</stringValue>
<type>VARIABLE</type>
</item>
<item id="84" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="85">["FileLoadEvent"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="86">input["FileLoadEvent"]</name>
<stringValue id="87">FileLoadEvent</stringValue>
<type>VARIABLE</type>
</item>
<item id="88" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="89">["Files"]@[Ljava/lang/Object;@</UITypeHint>
<input>true</input>
<name id="90">input["Files"]</name>
<stringValue id="91">Files</stringValue>
<type>VARIABLE</type>
</item>
<item id="92" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="93">["MessageBulkSize"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="94">input["MessageBulkSize"]</name>
<stringValue id="95">MessageBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="96" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="97">["MessageProcessingEvent"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="98">input["MessageProcessingEvent"]</name>
<stringValue id="99">MessageProcessingEvent</stringValue>
<type>VARIABLE</type>
</item>
<item id="100" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="101">["NrOfFilesParallel"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="102">input["NrOfFilesParallel"]</name>
<stringValue id="103">NrOfFilesParallel</stringValue>
<type>VARIABLE</type>
</item>
<item id="104" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="105">["OutputDirectory"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="106">input["OutputDirectory"]</name>
<stringValue id="107">OutputDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="108" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="109">["ParallelBranches"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="110">input["ParallelBranches"]</name>
<stringValue id="111">ParallelBranches</stringValue>
<type>VARIABLE</type>
</item>
<item id="112" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="113">["Parent Job Id"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="114">input["Parent Job Id"]</name>
<stringValue id="115">ParentJobID</stringValue>
<type>VARIABLE</type>
</item>
<item id="116" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="117">["ReProcessProcessedFiles"]@java/lang/Boolean@</UITypeHint>
<input>true</input>
<name id="118">input["ReProcessProcessedFiles"]</name>
<stringValue id="119">ReProcessProcessedFiles</stringValue>
<type>VARIABLE</type>
</item>
<item id="120" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="121">["SuccessAction"]@com/j2fe/feeds/SuccessAction@</UITypeHint>
<input>true</input>
<name id="122">input["SuccessAction"]</name>
<stringValue id="123">SuccessAction</stringValue>
<type>VARIABLE</type>
</item>
<item id="124" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="125">["VendorDefinition"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="126">input["VendorDefinition"]</name>
<stringValue id="127">VendorDefinition</stringValue>
<type>VARIABLE</type>
</item>
<item id="128" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="129">["serverTimestampChanged"]@java/lang/Boolean@</UITypeHint>
<input>true</input>
<name id="130">input["serverTimestampChanged"]</name>
<stringValue id="131">serverTimestampChanged</stringValue>
<type>VARIABLE</type>
</item>
<item id="132" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="133">name</name>
<stringValue id="134">Prepare File Processing</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="135" type="java.util.HashSet">
<item idref="74" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="136" type="java.util.HashSet">
<item id="137" type="com.j2fe.workflow.definition.Transition">
<name id="138">goto-next</name>
<source idref="76"/>
<target idref="3"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="3"/>
</item>
<item idref="137" type="com.j2fe.workflow.definition.Transition"/>
<item idref="71" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="139" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="140">Batch Connections/Fitch</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="141">user1</lastChangeUser>
<lastUpdate id="142">2025-05-18T11:04:51.000+0100</lastUpdate>
<name id="143">Fitch</name>
<nodes id="144" type="java.util.HashSet">
<item idref="76" type="com.j2fe.workflow.definition.Node"/>
<item idref="3" type="com.j2fe.workflow.definition.Node"/>
<item idref="49" type="com.j2fe.workflow.definition.Node"/>
<item idref="9" type="com.j2fe.workflow.definition.Node"/>
<item idref="65" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>true</optimize>
<parameter id="145" type="java.util.HashMap">
<entry>
<key id="146" type="java.lang.String">BusinessFeed</key>
<value id="147" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="148">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="149">The Business Feed to be used for the file processing. Only files which belong to the feed will be picked up from the directory! Either Business Feed or the Vendor Definition must be provided.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="150" type="java.lang.String">Directory</key>
<value id="151" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="152">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="153">The directory it is searched for files. If not set the working directory configured in the Assembly will be used as directory searched for files.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="154" type="java.lang.String">FileLoadEvent</key>
<value id="155" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="156">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="157">The Event that is called to process a file.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="158" type="java.lang.String">FilePatterns</key>
<value id="159" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="160">[Ljava.lang.String;</className>
<clazz>[Ljava.lang.String;</clazz>
<description id="161">In addition to the file patterns defined at Business Feed level, more restrictive file patterns can be specified.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="162" type="java.lang.String">IncludeFilePatternNBusinessFeed</key>
<value id="163" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="164">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<description id="165">Whether to consider both Custom File patterns and patterns in Business Feed while listing of files.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="166" type="java.lang.String">MessageBulkSize</key>
<value id="167" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="168">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="169">The number of messages from a file which are processed in parallel.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="170" type="java.lang.String">MessageProcessingEvent</key>
<value id="171" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="172">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="173">The Event that is called to process a message.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="174" type="java.lang.String">NrOfFilesParallel</key>
<value id="175" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="176">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="177">The number of files that are processed in parallel, as long as they belong to the same group (see File Definitions at Business Feed).</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="178" type="java.lang.String">OutputDirectory</key>
<value id="179" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="180">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="181">Only if SuccessAction is MOVE. The files will be moved to this directory.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="182" type="java.lang.String">ParallelBranches</key>
<value id="183" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="184">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="185">The number of branches in parallel.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="186" type="java.lang.String">ParentJobID</key>
<value id="187" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="188">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="189">Parent Job id is used to correlated all the child jobs.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="190" type="java.lang.String">ReProcessProcessedFiles</key>
<value id="191" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="192">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<description id="193">Should already processed files be processed again</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="194" type="java.lang.String">RecursiveSearch</key>
<value id="195" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="196">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<description id="197">Should sub directories be searched?</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="198" type="java.lang.String">SortAscending</key>
<value id="199" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="200">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<description id="201">Sort the files ascending or descending.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="202" type="java.lang.String">SortOrder</key>
<value id="203" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="204">com.j2fe.feeds.activities.ListFiles$Sort</className>
<clazz>com.j2fe.feeds.activities.ListFiles$Sort</clazz>
<description id="205">Sort the files by TIME or NATURAL or FILESIZE?</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="206" type="java.lang.String">SuccessAction</key>
<value id="207" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="208">com.j2fe.feeds.SuccessAction</className>
<clazz>com.j2fe.feeds.SuccessAction</clazz>
<description id="209">What should be done with the file after processing. MOVE or LEAVE (no action) or DELETE.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="210" type="java.lang.String">VendorDefinition</key>
<value id="211" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="212">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="213">The vendor definition (VENDOR ID) is used to find the message types and business feeds of the files in the directory. Only files which belong to the different Business Feeds will be processed. Either the vendor or the business feed has to be provided to the WF.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="214" type="java.lang.String">serverTimestampChanged</key>
<value id="215" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="216">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<description id="217">When Server Time has been modified then need to be set to true</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
</parameter>
<permissions id="218" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>true</purgeAtEnd>
<retries>0</retries>
<startNode idref="65"/>
<status>RELEASED</status>
<variables id="219" type="java.util.HashMap">
<entry>
<key id="220" type="java.lang.String">BusinessFeed</key>
<value id="221" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="222">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="223">The Business Feed to be used for the file processing. Only files which belong to the feed will be picked up from the directory! Either Business Feed or the Vendor Definition must be provided.</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="224" type="java.lang.String">Directory</key>
<value id="225" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="226">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="227">The directory it is searched for files. If not set the working directory configured in the Assembly will be used as directory searched for files.</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="228" type="java.lang.String">FileLoadEvent</key>
<value id="229" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="230">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="231">The Event that is called to process a file.</description>
<persistent>false</persistent>
<value id="232" type="java.lang.String">StandardFileLoad</value>
</value>
</entry>
<entry>
<key id="233" type="java.lang.String">FilePatterns</key>
<value id="234" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="235">[Ljava.lang.String;</className>
<clazz>[Ljava.lang.String;</clazz>
<description id="236">In addition to the file patterns defined at Business Feed level, more restrictive file patterns can be specified.</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="237" type="java.lang.String">IncludeFilePatternNBusinessFeed</key>
<value id="238" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="239">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<description id="240">Whether to consider both Custom File patterns and patterns in Business Feed while listing of files.</description>
<persistent>false</persistent>
<value id="241" type="java.lang.Boolean">false</value>
</value>
</entry>
<entry>
<key id="242" type="java.lang.String">MessageBulkSize</key>
<value id="243" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="244">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="245">The number of messages from a file which are processed in parallel.</description>
<persistent>false</persistent>
<value id="246" type="java.lang.Integer">500</value>
</value>
</entry>
<entry>
<key id="247" type="java.lang.String">MessageProcessingEvent</key>
<value id="248" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="249">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="250">The Event that is called to process a message.</description>
<persistent>false</persistent>
<value id="251" type="java.lang.String">ProcessFeedMessage</value>
</value>
</entry>
<entry>
<key id="252" type="java.lang.String">NrOfFilesParallel</key>
<value id="253" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="254">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="255">The number of files that are processed in parallel, as long as they belong to the same group (see File Definitions at Business Feed).</description>
<persistent>false</persistent>
<value id="256" type="java.lang.Integer">2</value>
</value>
</entry>
<entry>
<key id="257" type="java.lang.String">OutputDirectory</key>
<value id="258" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="259">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="260">Only if SuccessAction is MOVE. The files will be moved to this directory.</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="261" type="java.lang.String">ParallelBranches</key>
<value id="262" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="263">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="264">The number of branches in parallel.</description>
<persistent>false</persistent>
<value idref="256"/>
</value>
</entry>
<entry>
<key id="265" type="java.lang.String">ParentJobID</key>
<value id="266" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="267">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="268">Parent Job id is used to correlated all the child jobs.</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="269" type="java.lang.String">ReProcessProcessedFiles</key>
<value id="270" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="271">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<description id="272">Should already processed files be processed again</description>
<persistent>false</persistent>
<value idref="241"/>
</value>
</entry>
<entry>
<key id="273" type="java.lang.String">RecursiveSearch</key>
<value id="274" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="275">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<description id="276">Should sub directories be searched?</description>
<persistent>false</persistent>
<value idref="241"/>
</value>
</entry>
<entry>
<key id="277" type="java.lang.String">SortAscending</key>
<value id="278" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="279">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<description id="280">Sort the files ascending or descending.</description>
<persistent>false</persistent>
<value id="281" type="java.lang.Boolean">true</value>
</value>
</entry>
<entry>
<key id="282" type="java.lang.String">SortOrder</key>
<value id="283" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="284">com.j2fe.feeds.activities.ListFiles$Sort</className>
<clazz>com.j2fe.feeds.activities.ListFiles$Sort</clazz>
<description id="285">Sort the files by TIME or NATURAL or FILESIZE?</description>
<persistent>false</persistent>
<value id="286" type="java.lang.String">NATURAL</value>
</value>
</entry>
<entry>
<key id="287" type="java.lang.String">SuccessAction</key>
<value id="288" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="289">com.j2fe.feeds.SuccessAction</className>
<clazz>com.j2fe.feeds.SuccessAction</clazz>
<description id="290">What should be done with the file after processing. MOVE or LEAVE (no action) or DELETE.</description>
<persistent>false</persistent>
<value id="291" type="java.lang.String">LEAVE</value>
</value>
</entry>
<entry>
<key id="292" type="java.lang.String">VendorDefinition</key>
<value id="293" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="294">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="295">The vendor definition (VENDOR ID) is used to find the message types and business feeds of the files in the directory. Only files which belong to the different Business Feeds will be processed. Either the vendor or the business feed has to be provided to the WF.</description>
<persistent>false</persistent>
<value id="296" type="java.lang.String">FITCH</value>
</value>
</entry>
<entry>
<key id="297" type="java.lang.String">serverTimestampChanged</key>
<value id="298" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="299">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<description id="300">When Server Time has been modified then need to be set to true</description>
<persistent>false</persistent>
<value idref="241"/>
</value>
</entry>
</variables>
<version>3</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
