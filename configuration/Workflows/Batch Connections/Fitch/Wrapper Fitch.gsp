<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.07">
<package-comment/>
<businessobject displayString="10 - ParentJobID persisted" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>false</alwaysPersist>
<clustered>false</clustered>
<comment id="1">ParentJobID persisted</comment>
<description id="2">To Create a pass the Parent Job id to the sub workflow.</description>
<endNode id="3">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="4">Stop</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="5">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<persistentVariables id="6" type="java.util.HashSet">
<item id="7" type="java.lang.String">ParentJobID
1000</item>
</persistentVariables>
<sources id="8" type="java.util.HashSet">
<item id="9" type="com.j2fe.workflow.definition.Transition">
<name id="10">goto-next</name>
<source id="11">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="12">Close Job</name>
<nodeHandler>com.j2fe.streetlamp.activities.CloseJob</nodeHandler>
<nodeHandlerClass id="13">com.j2fe.streetlamp.activities.CloseJob</nodeHandlerClass>
<parameters id="14" type="java.util.HashSet">
<item id="15" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="16">jobId</name>
<stringValue id="17">ParentJobID</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<persistentVariables id="18" type="java.util.HashSet">
<item id="19" type="java.lang.String">ParentJobID
1000</item>
</persistentVariables>
<sources id="20" type="java.util.HashSet">
<item id="21" type="com.j2fe.workflow.definition.Transition">
<name id="22">goto-next</name>
<source id="23">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="24">Consolidate Job</name>
<nodeHandler>com.j2fe.streetlamp.activities.ConsolidateJob</nodeHandler>
<nodeHandlerClass id="25">com.j2fe.streetlamp.activities.ConsolidateJob</nodeHandlerClass>
<parameters id="26" type="java.util.HashSet">
<item id="27" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="28">jobId</name>
<stringValue id="29">ParentJobID</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<persistentVariables id="30" type="java.util.HashSet">
<item id="31" type="java.lang.String">ParentJobID
1000</item>
</persistentVariables>
<sources id="32" type="java.util.HashSet">
<item id="33" type="com.j2fe.workflow.definition.Transition">
<name id="34">goto-next</name>
<source id="35">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="36">Call Subworkflow</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="37">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="38" type="java.util.HashSet">
<item id="39" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="40">["BusinessFeed"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="41">input["BusinessFeed"]</name>
<stringValue id="42">BusinessFeed</stringValue>
<type>VARIABLE</type>
</item>
<item id="43" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="44">["Directory"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="45">input["Directory"]</name>
<stringValue id="46">Directory</stringValue>
<type>VARIABLE</type>
</item>
<item id="47" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="48">["FileLoadEvent"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="49">input["FileLoadEvent"]</name>
<stringValue id="50">FileLoadEvent</stringValue>
<type>VARIABLE</type>
</item>
<item id="51" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="52">["FilePatterns"]@[Ljava/lang/String;@</UITypeHint>
<input>true</input>
<name id="53">input["FilePatterns"]</name>
<stringValue id="54">FilePatterns</stringValue>
<type>VARIABLE</type>
</item>
<item id="55" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="56">["IncludeFilePatternNBusinessFeed"]@java/lang/Boolean@</UITypeHint>
<input>true</input>
<name id="57">input["IncludeFilePatternNBusinessFeed"]</name>
<stringValue id="58">IncludeFilePatternNBusinessFeed</stringValue>
<type>VARIABLE</type>
</item>
<item id="59" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="60">["MessageBulkSize"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="61">input["MessageBulkSize"]</name>
<stringValue id="62">MessageBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="63" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="64">["MessageProcessingEvent"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="65">input["MessageProcessingEvent"]</name>
<stringValue id="66">MessageProcessingEvent</stringValue>
<type>VARIABLE</type>
</item>
<item id="67" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="68">["NrOfFilesParallel"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="69">input["NrOfFilesParallel"]</name>
<stringValue id="70">NrOfFilesParallel</stringValue>
<type>VARIABLE</type>
</item>
<item id="71" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="72">["OutputDirectory"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="73">input["OutputDirectory"]</name>
<stringValue id="74">OutputDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="75" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="76">["ParallelBranches"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="77">input["ParallelBranches"]</name>
<stringValue id="78">ParallelBranches</stringValue>
<type>VARIABLE</type>
</item>
<item id="79" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="80">["ParentJobID"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="81">input["ParentJobID"]</name>
<stringValue id="82">ParentJobID</stringValue>
<type>VARIABLE</type>
</item>
<item id="83" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="84">["ReProcessProcessedFiles"]@java/lang/Boolean@</UITypeHint>
<input>true</input>
<name id="85">input["ReProcessProcessedFiles"]</name>
<stringValue id="86">ReProcessProcessedFiles</stringValue>
<type>VARIABLE</type>
</item>
<item id="87" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="88">["RecursiveSearch"]@java/lang/Boolean@</UITypeHint>
<input>true</input>
<name id="89">input["RecursiveSearch"]</name>
<stringValue id="90">RecursiveSearch</stringValue>
<type>VARIABLE</type>
</item>
<item id="91" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="92">["SortAscending"]@java/lang/Boolean@</UITypeHint>
<input>true</input>
<name id="93">input["SortAscending"]</name>
<stringValue id="94">SortAscending</stringValue>
<type>VARIABLE</type>
</item>
<item id="95" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="96">["SortOrder"]@com/j2fe/feeds/activities/ListFiles$Sort@</UITypeHint>
<input>true</input>
<name id="97">input["SortOrder"]</name>
<stringValue id="98">SortOrder</stringValue>
<type>VARIABLE</type>
</item>
<item id="99" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="100">["SuccessAction"]@com/j2fe/feeds/SuccessAction@</UITypeHint>
<input>true</input>
<name id="101">input["SuccessAction"]</name>
<stringValue id="102">SuccessAction</stringValue>
<type>VARIABLE</type>
</item>
<item id="103" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="104">["VendorDefinition"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="105">input["VendorDefinition"]</name>
<stringValue id="106">VendorDefinition</stringValue>
<type>VARIABLE</type>
</item>
<item id="107" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="108">["serverTimestampChanged"]@java/lang/Boolean@</UITypeHint>
<input>true</input>
<name id="109">input["serverTimestampChanged"]</name>
<stringValue id="110">serverTimestampChanged</stringValue>
<type>VARIABLE</type>
</item>
<item id="111" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="112">name</name>
<stringValue id="113">Fitch</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<persistentVariables id="114" type="java.util.HashSet">
<item id="115" type="java.lang.String">ParentJobID
1000</item>
</persistentVariables>
<sources id="116" type="java.util.HashSet">
<item id="117" type="com.j2fe.workflow.definition.Transition">
<name id="118">goto-next</name>
<source id="119">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="120">Create Parent Job Id</name>
<nodeHandler>com.j2fe.streetlamp.activities.CreateJob</nodeHandler>
<nodeHandlerClass id="121">com.j2fe.streetlamp.activities.CreateJob</nodeHandlerClass>
<parameters id="122" type="java.util.HashSet">
<item id="123" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="124">jobId</name>
<stringValue id="125">ParentJobID</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<persistentVariables id="126" type="java.util.HashSet">
<item id="127" type="java.lang.String">ParentJobID
1000</item>
</persistentVariables>
<sources id="128" type="java.util.HashSet">
<item id="129" type="com.j2fe.workflow.definition.Transition">
<name id="130">goto-next</name>
<source id="131">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="132">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="133">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="134" type="java.util.HashSet"/>
<targets id="135" type="java.util.HashSet">
<item idref="129" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="119"/>
</item>
</sources>
<targets id="136" type="java.util.HashSet">
<item idref="117" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="35"/>
</item>
</sources>
<targets id="137" type="java.util.HashSet">
<item idref="33" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="23"/>
</item>
</sources>
<targets id="138" type="java.util.HashSet">
<item idref="21" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="11"/>
</item>
</sources>
<targets id="139" type="java.util.HashSet">
<item idref="9" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="3"/>
</item>
</sources>
<targets id="140" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="141">Batch Connections/Fitch</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="142">user1</lastChangeUser>
<lastUpdate id="143">2025-12-04T14:23:11.000+0000</lastUpdate>
<name id="144">Wrapper Fitch</name>
<nodes id="145" type="java.util.HashSet">
<item idref="35" type="com.j2fe.workflow.definition.Node"/>
<item idref="11" type="com.j2fe.workflow.definition.Node"/>
<item idref="23" type="com.j2fe.workflow.definition.Node"/>
<item idref="119" type="com.j2fe.workflow.definition.Node"/>
<item idref="131" type="com.j2fe.workflow.definition.Node"/>
<item idref="3" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>true</optimize>
<parameter id="146" type="java.util.HashMap">
<entry>
<key id="147" type="java.lang.String">BusinessFeed</key>
<value id="148" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="149">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="150">The Business Feed to be used for the file processing. Only files which belong to the feed will be picked up from the directory! Either Business Feed or the Vendor Definition must be provided.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="151" type="java.lang.String">Directory</key>
<value id="152" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="153">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="154">Directory from Bloomberg ftp site.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="155" type="java.lang.String">FileLoadEvent</key>
<value id="156" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="157">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="158">The Event that is called to process a file.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="159" type="java.lang.String">FilePatterns</key>
<value id="160" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="161">[Ljava.lang.String;</className>
<clazz>[Ljava.lang.String;</clazz>
<description id="162">File patterns to look for at Bloomberg download directory.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="163" type="java.lang.String">IncludeFilePatternNBusinessFeed</key>
<value id="164" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="165">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<description id="166">Whether to consider both Custom File patterns and patterns in Business Feed while listing of files.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="167" type="java.lang.String">MessageBulkSize</key>
<value id="168" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="169">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="170">The number of messages from a file which should be processed in parallel.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="171" type="java.lang.String">MessageProcessingEvent</key>
<value id="172" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="173">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="174">The Event that is called to process a message.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="175" type="java.lang.String">NrOfFilesParallel</key>
<value id="176" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="177">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="178">The number of files that are processed in parallel, as long as they belong to the same group (see File Definitions at Business Feed).</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="179" type="java.lang.String">OutputDirectory</key>
<value id="180" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="181">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="182">Only if SuccessAction is MOVE. The files will be moved to this directory.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="183" type="java.lang.String">ParallelBranches</key>
<value id="184" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="185">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="186">The number of branches in parallel.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="187" type="java.lang.String">ReProcessProcessedFiles</key>
<value id="188" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="189">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<description id="190">Should already processed files be processed again?</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="191" type="java.lang.String">RecursiveSearch</key>
<value id="192" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="193">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<description id="194">Should sub directories be searched?</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="195" type="java.lang.String">SortAscending</key>
<value id="196" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="197">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<description id="198">Sort the files ascending or descending.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="199" type="java.lang.String">SortOrder</key>
<value id="200" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="201">com.j2fe.feeds.activities.ListFiles$Sort</className>
<clazz>com.j2fe.feeds.activities.ListFiles$Sort</clazz>
<description id="202">Sort the files by TIME or NATURAL or FILESIZE?</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="203" type="java.lang.String">SuccessAction</key>
<value id="204" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="205">com.j2fe.feeds.SuccessAction</className>
<clazz>com.j2fe.feeds.SuccessAction</clazz>
<description id="206">What should be done with the file after processing. MOVE or LEAVE (no action) or DELETE.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="207" type="java.lang.String">VendorDefinition</key>
<value id="208" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="209">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="210">The vendor definition (VENDOR ID) is used to find the message types and business feeds of the files in the directory. Only files which belong to the different Business Feeds will be processed. Either the vendor or the business feed has to be provided to the WF.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="211" type="java.lang.String">serverTimestampChanged</key>
<value id="212" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="213">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<description id="214">When Server Time has been modified then need to be set to true</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
</parameter>
<permissions id="215" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>false</purgeAtEnd>
<retries>0</retries>
<startNode idref="131"/>
<status>RELEASED</status>
<variables id="216" type="java.util.HashMap">
<entry>
<key id="217" type="java.lang.String">BusinessFeed</key>
<value id="218" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="219">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="220">The Business Feed to be used for the file processing. Only files which belong to the feed will be picked up from the directory! Either Business Feed or the Vendor Definition must be provided.</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="221" type="java.lang.String">Directory</key>
<value id="222" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="223">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="224">Directory from Bloomberg ftp site.</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="225" type="java.lang.String">FileLoadEvent</key>
<value id="226" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="227">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="228">The Event that is called to process a file.</description>
<persistent>false</persistent>
<value id="229" type="java.lang.String">StandardFileLoad</value>
</value>
</entry>
<entry>
<key id="230" type="java.lang.String">FilePatterns</key>
<value id="231" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="232">[Ljava.lang.String;</className>
<clazz>[Ljava.lang.String;</clazz>
<description id="233">File patterns to look for at Bloomberg download directory.</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="234" type="java.lang.String">IncludeFilePatternNBusinessFeed</key>
<value id="235" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="236">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<description id="237">Whether to consider both Custom File patterns and patterns in Business Feed while listing of files.</description>
<persistent>false</persistent>
<value id="238" type="java.lang.Boolean">false</value>
</value>
</entry>
<entry>
<key id="239" type="java.lang.String">MessageBulkSize</key>
<value id="240" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="241">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="242">The number of messages from a file which should be processed in parallel.</description>
<persistent>false</persistent>
<value id="243" type="java.lang.Integer">500</value>
</value>
</entry>
<entry>
<key id="244" type="java.lang.String">MessageProcessingEvent</key>
<value id="245" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="246">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="247">The Event that is called to process a message.</description>
<persistent>false</persistent>
<value id="248" type="java.lang.String">ProcessFeedMessage</value>
</value>
</entry>
<entry>
<key id="249" type="java.lang.String">NrOfFilesParallel</key>
<value id="250" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="251">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="252">The number of files that are processed in parallel, as long as they belong to the same group (see File Definitions at Business Feed).</description>
<persistent>false</persistent>
<value id="253" type="java.lang.Integer">2</value>
</value>
</entry>
<entry>
<key id="254" type="java.lang.String">OutputDirectory</key>
<value id="255" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="256">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="257">Only if SuccessAction is MOVE. The files will be moved to this directory.</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="258" type="java.lang.String">ParallelBranches</key>
<value id="259" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="260">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="261">The number of branches in parallel.</description>
<persistent>false</persistent>
<value idref="253"/>
</value>
</entry>
<entry>
<key id="262" type="java.lang.String">ReProcessProcessedFiles</key>
<value id="263" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="264">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<description id="265">Should already processed files be processed again?</description>
<persistent>false</persistent>
<value idref="238"/>
</value>
</entry>
<entry>
<key id="266" type="java.lang.String">RecursiveSearch</key>
<value id="267" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="268">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<description id="269">Should sub directories be searched?</description>
<persistent>false</persistent>
<value idref="238"/>
</value>
</entry>
<entry>
<key id="270" type="java.lang.String">SortAscending</key>
<value id="271" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="272">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<description id="273">Sort the files ascending or descending.</description>
<persistent>false</persistent>
<value id="274" type="java.lang.Boolean">true</value>
</value>
</entry>
<entry>
<key id="275" type="java.lang.String">SortOrder</key>
<value id="276" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="277">com.j2fe.feeds.activities.ListFiles$Sort</className>
<clazz>com.j2fe.feeds.activities.ListFiles$Sort</clazz>
<description id="278">Sort the files by TIME or NATURAL or FILESIZE?</description>
<persistent>false</persistent>
<value id="279" type="com.j2fe.feeds.activities.ListFiles$Sort">NATURAL</value>
</value>
</entry>
<entry>
<key id="280" type="java.lang.String">SuccessAction</key>
<value id="281" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="282">com.j2fe.feeds.SuccessAction</className>
<clazz>com.j2fe.feeds.SuccessAction</clazz>
<description id="283">What should be done with the file after processing. MOVE or LEAVE (no action) or DELETE.</description>
<persistent>false</persistent>
<value id="284" type="com.j2fe.feeds.SuccessAction">LEAVE</value>
</value>
</entry>
<entry>
<key id="285" type="java.lang.String">VendorDefinition</key>
<value id="286" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="287">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="288">The vendor definition (VENDOR ID) is used to find the message types and business feeds of the files in the directory. Only files which belong to the different Business Feeds will be processed. Either the vendor or the business feed has to be provided to the WF.</description>
<persistent>false</persistent>
<value id="289" type="java.lang.String">FITCH</value>
</value>
</entry>
<entry>
<key id="290" type="java.lang.String">serverTimestampChanged</key>
<value id="291" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="292">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<description id="293">When Server Time has been modified then need to be set to true</description>
<persistent>false</persistent>
<value idref="238"/>
</value>
</entry>
</variables>
<version>10</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
