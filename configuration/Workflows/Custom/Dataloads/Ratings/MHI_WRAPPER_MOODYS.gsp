<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.09">
<package-comment/>
<businessobject displayString="9 - FileSystem_Corrected" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>false</alwaysPersist>
<clustered>false</clustered>
<comment id="1">FileSystem_Corrected</comment>
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
<name id="8">empty</name>
<source id="9">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="10"/>
<directJoin>false</directJoin>
<name id="11">List Files</name>
<nodeHandler>com.j2fe.feeds.activities.ListFiles</nodeHandler>
<nodeHandlerClass id="12">com.j2fe.feeds.activities.ListFiles</nodeHandlerClass>
<parameters id="13" type="java.util.HashSet">
<item id="14" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="15">dataSourceFilter</name>
<stringValue id="16">VendorDefinition</stringValue>
<type>VARIABLE</type>
</item>
<item id="17" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="18">directory</name>
<stringValue id="19">Directory</stringValue>
<type>VARIABLE</type>
</item>
<item id="20" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="21">fileSystem</name>
<stringValue id="22">filesystem/sftp/MoodysRDS2</stringValue>
<type>REFERENCE</type>
</item>
<item id="23" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="24">fileSystemId</name>
<stringValue id="25">filesystem/sftp/MoodysRDS2/user</stringValue>
<type>REFERENCE</type>
</item>
<item id="26" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="27">list</name>
<stringValue id="28">FileList</stringValue>
<type>VARIABLE</type>
</item>
<item id="29" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="30">pattern</name>
<stringValue id="31">PatternZipped</stringValue>
<type>VARIABLE</type>
</item>
<item id="32" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="33">recursive</name>
<stringValue id="34">Recursive</stringValue>
<type>VARIABLE</type>
</item>
<item id="35" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="36">sort</name>
<stringValue id="37">SortOrder</stringValue>
<type>VARIABLE</type>
</item>
<item id="38" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="39">sortAscending</name>
<stringValue id="40">SortAscending</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="41" type="java.util.HashSet">
<item id="42" type="com.j2fe.workflow.definition.Transition">
<name id="43">goto-next</name>
<source id="44">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="45"/>
<directJoin>false</directJoin>
<name id="46">Create Parent Job Id</name>
<nodeHandler>com.j2fe.streetlamp.activities.CreateJob</nodeHandler>
<nodeHandlerClass id="47">com.j2fe.streetlamp.activities.CreateJob</nodeHandlerClass>
<parameters id="48" type="java.util.HashSet">
<item id="49" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="50">jobId</name>
<stringValue id="51">ParentJobID</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="52" type="java.util.HashSet">
<item id="53" type="com.j2fe.workflow.definition.Transition">
<name id="54">false</name>
<source id="55">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="56"/>
<directJoin>false</directJoin>
<name id="57">Is Workflow Running?</name>
<nodeHandler>com.j2fe.feeds.activities.CheckRunningWorkflows</nodeHandler>
<nodeHandlerClass id="58">com.j2fe.feeds.activities.CheckRunningWorkflows</nodeHandlerClass>
<parameters id="59" type="java.util.HashSet">
<item id="60" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="61">uri</name>
<stringValue id="62">Directory</stringValue>
<type>VARIABLE</type>
</item>
<item id="63" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="64">vendorDefinition</name>
<stringValue id="65">VendorDefinition</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="66" type="java.util.HashSet">
<item id="67" type="com.j2fe.workflow.definition.Transition">
<name id="68">goto-next</name>
<source id="69">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="70"/>
<directJoin>false</directJoin>
<name id="71">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="72">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="73" type="java.util.HashSet"/>
<targets id="74" type="java.util.HashSet">
<item idref="67" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="55"/>
</item>
</sources>
<targets id="75" type="java.util.HashSet">
<item idref="53" type="com.j2fe.workflow.definition.Transition"/>
<item id="76" type="com.j2fe.workflow.definition.Transition">
<name id="77">true</name>
<source idref="55"/>
<target idref="2"/>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="44"/>
</item>
</sources>
<targets id="78" type="java.util.HashSet">
<item idref="42" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="9"/>
</item>
</sources>
<targets id="79" type="java.util.HashSet">
<item idref="7" type="com.j2fe.workflow.definition.Transition"/>
<item id="80" type="com.j2fe.workflow.definition.Transition">
<name id="81">not-empty</name>
<source idref="9"/>
<target id="82">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="83">Automatically generated</description>
<directJoin>false</directJoin>
<name id="84">FileList Loop</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="85">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="86" type="java.util.HashSet">
<item id="87" type="com.j2fe.workflow.definition.Transition">
<name id="88">goto-next</name>
<source id="89">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="90"/>
<directJoin>false</directJoin>
<name id="91">FileList Loop</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="92">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="93" type="java.util.HashSet">
<item id="94" type="com.j2fe.workflow.definition.Transition">
<name id="95">false</name>
<source id="96">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="97"/>
<directJoin>false</directJoin>
<name id="98">ReDownloadfiles ?</name>
<nodeHandler>com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandler>
<nodeHandlerClass id="99">com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandlerClass>
<parameters id="100" type="java.util.HashSet">
<item id="101" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="102">caseItem</name>
<stringValue id="103">ReDownloadfiles</stringValue>
<type>VARIABLE</type>
</item>
<item id="104" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="105">defaultItem</name>
<stringValue id="106">false</stringValue>
<type>CONSTANT</type>
</item>
<item id="107" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="108">nullTransition</name>
<stringValue id="109">false</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="110" type="java.util.HashSet">
<item id="111" type="com.j2fe.workflow.definition.Transition">
<name id="112">false</name>
<source id="113">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="114"/>
<directJoin>false</directJoin>
<name id="115">Is New File?</name>
<nodeHandler>com.j2fe.feeds.activities.CheckRestart</nodeHandler>
<nodeHandlerClass id="116">com.j2fe.feeds.activities.CheckRestart</nodeHandlerClass>
<parameters id="117" type="java.util.HashSet">
<item id="118" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="119">file</name>
<stringValue id="120">File</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="121" type="java.util.HashSet">
<item id="122" type="com.j2fe.workflow.definition.Transition">
<name id="123">loop</name>
<source id="124">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="125"/>
<directJoin>false</directJoin>
<name id="126">For Each File</name>
<nodeHandler>com.j2fe.workflow.handler.impl.ForEach</nodeHandler>
<nodeHandlerClass id="127">com.j2fe.workflow.handler.impl.ForEach</nodeHandlerClass>
<parameters id="128" type="java.util.HashSet">
<item id="129" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="130">counter</name>
<stringValue id="131">Counter</stringValue>
<type>VARIABLE</type>
</item>
<item id="132" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="133">counter</name>
<stringValue id="134">Counter</stringValue>
<type>VARIABLE</type>
</item>
<item id="135" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="136">input</name>
<stringValue id="137">FileList</stringValue>
<type>VARIABLE</type>
</item>
<item id="138" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="139">output</name>
<stringValue id="140">File</stringValue>
<type>VARIABLE</type>
</item>
<item id="141" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="142">@java/io/File@.name</UITypeHint>
<input>false</input>
<name id="143">output.name</name>
<stringValue id="144">Filename</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="145" type="java.util.HashSet">
<item id="146" type="com.j2fe.workflow.definition.Transition">
<name id="147">ToSplit</name>
<source idref="82"/>
<target idref="124"/>
</item>
</sources>
<targets id="148" type="java.util.HashSet">
<item id="149" type="com.j2fe.workflow.definition.Transition">
<name id="150">end-loop</name>
<source idref="124"/>
<target id="151">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="152"/>
<directJoin>false</directJoin>
<name id="153">End FileList Loop</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="154">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="155" type="java.util.HashSet">
<item idref="149" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="156" type="java.util.HashSet">
<item id="157" type="com.j2fe.workflow.definition.Transition">
<name id="158">goto-next</name>
<source idref="151"/>
<target id="159">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="160"/>
<directJoin>false</directJoin>
<name id="161">Remove Aged Files from InputZippedProcessed</name>
<nodeHandler>com.j2fe.general.activities.CommandLine</nodeHandler>
<nodeHandlerClass id="162">com.j2fe.general.activities.CommandLine</nodeHandlerClass>
<parameters id="163" type="java.util.HashSet">
<item id="164" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="165">commandLine</name>
<stringValue id="166">find $TgtDir/*.zip -mtime +$DysToKeep -exec rm {} \;</stringValue>
<type>CONSTANT</type>
</item>
<item id="167" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="168">["DysToKeep"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="169">environment["DysToKeep"]</name>
<stringValue id="170">ZipInputDaysToKeep</stringValue>
<type>VARIABLE</type>
</item>
<item id="171" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="172">["TgtDir"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="173">environment["TgtDir"]</name>
<stringValue id="174">ZipInputProcessedDirectory</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="175" type="java.util.HashSet">
<item idref="157" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="176" type="java.util.HashSet">
<item id="177" type="com.j2fe.workflow.definition.Transition">
<name id="178">goto-next</name>
<source idref="159"/>
<target id="179">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="180"/>
<directJoin>false</directJoin>
<name id="181">Consolidate Job</name>
<nodeHandler>com.j2fe.streetlamp.activities.ConsolidateJob</nodeHandler>
<nodeHandlerClass id="182">com.j2fe.streetlamp.activities.ConsolidateJob</nodeHandlerClass>
<parameters id="183" type="java.util.HashSet">
<item id="184" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="185">jobId</name>
<stringValue id="186">ParentJobID</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="187" type="java.util.HashSet">
<item idref="177" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="188" type="java.util.HashSet">
<item id="189" type="com.j2fe.workflow.definition.Transition">
<name id="190">goto-next</name>
<source idref="179"/>
<target id="191">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="192"/>
<directJoin>false</directJoin>
<name id="193">Close Job</name>
<nodeHandler>com.j2fe.streetlamp.activities.CloseJob</nodeHandler>
<nodeHandlerClass id="194">com.j2fe.streetlamp.activities.CloseJob</nodeHandlerClass>
<parameters id="195" type="java.util.HashSet">
<item id="196" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="197">jobId</name>
<stringValue id="198">ParentJobID</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="199" type="java.util.HashSet">
<item idref="189" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="200" type="java.util.HashSet">
<item id="201" type="com.j2fe.workflow.definition.Transition">
<name id="202">goto-next</name>
<source idref="191"/>
<target idref="2"/>
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
<type>ACTIVITY</type>
</target>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item idref="122" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="113"/>
</item>
</sources>
<targets id="203" type="java.util.HashSet">
<item idref="111" type="com.j2fe.workflow.definition.Transition"/>
<item id="204" type="com.j2fe.workflow.definition.Transition">
<name id="205">true</name>
<source idref="113"/>
<target id="206">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="207">Automatically generated</description>
<directJoin>false</directJoin>
<name id="208">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="209">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="210" type="java.util.HashSet">
<item idref="204" type="com.j2fe.workflow.definition.Transition"/>
<item id="211" type="com.j2fe.workflow.definition.Transition">
<name id="212">true</name>
<source idref="96"/>
<target idref="206"/>
</item>
</sources>
<targets id="213" type="java.util.HashSet">
<item id="214" type="com.j2fe.workflow.definition.Transition">
<name id="215">ToSplit</name>
<source idref="206"/>
<target id="216">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="217"/>
<directJoin>false</directJoin>
<name id="218">Open file</name>
<nodeHandler>com.j2fe.feeds.activities.ReadFile</nodeHandler>
<nodeHandlerClass id="219">com.j2fe.feeds.activities.ReadFile</nodeHandlerClass>
<parameters id="220" type="java.util.HashSet">
<item id="221" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="222">businessFeed</name>
<stringValue id="223">BusinessFeed</stringValue>
<type>VARIABLE</type>
</item>
<item id="224" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="225">file</name>
<stringValue id="226">File</stringValue>
<type>VARIABLE</type>
</item>
<item id="227" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="228">sortedFileDirectory</name>
<stringValue id="229">ZipInputDirectory</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="230" type="java.util.HashSet">
<item idref="214" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="231" type="java.util.HashSet">
<item id="232" type="com.j2fe.workflow.definition.Transition">
<name id="233">goto-next</name>
<source idref="216"/>
<target id="234">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="235"/>
<directJoin>false</directJoin>
<name id="236">End File</name>
<nodeHandler>com.j2fe.feeds.activities.EndFile</nodeHandler>
<nodeHandlerClass id="237">com.j2fe.feeds.activities.EndFile</nodeHandlerClass>
<parameters id="238" type="java.util.HashSet">
<item id="239" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="240">file</name>
<stringValue id="241">File</stringValue>
<type>VARIABLE</type>
</item>
<item id="242" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="243">successAction</name>
<stringValue id="244">LEAVE</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="245" type="java.util.HashSet">
<item idref="232" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="246" type="java.util.HashSet">
<item id="247" type="com.j2fe.workflow.definition.Transition">
<name id="248">goto-next</name>
<source idref="234"/>
<target id="249">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="250"/>
<directJoin>false</directJoin>
<name id="251">Call RATINGS_MOODYS</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="252">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="253" type="java.util.HashSet">
<item id="254" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="255">["BulkSize"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="256">input["BulkSize"]</name>
<stringValue id="257">BulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="258" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="259">["BusinessFeed"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="260">input["BusinessFeed"]</name>
<stringValue id="261">BusinessFeed</stringValue>
<type>VARIABLE</type>
</item>
<item id="262" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="263">["FileLoadEvent"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="264">input["FileLoadEvent"]</name>
<stringValue id="265">FileLoadEvent</stringValue>
<type>VARIABLE</type>
</item>
<item id="266" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="267">["InputDirectory"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="268">input["InputDirectory"]</name>
<stringValue id="269">InputDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="270" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="271">["IsInstrumentFile"]@java/lang/Boolean@</UITypeHint>
<input>true</input>
<name id="272">input["IsInstrumentFile"]</name>
<stringValue id="273">IsInstrumentFile</stringValue>
<type>VARIABLE</type>
</item>
<item id="274" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="275">["MessageBulkSize"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="276">input["MessageBulkSize"]</name>
<stringValue id="277">MessageBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="278" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="279">["MessageType"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="280">input["MessageType"]</name>
<stringValue id="281">MessageType</stringValue>
<type>VARIABLE</type>
</item>
<item id="282" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="283">["MoveOutputDirectory"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="284">input["MoveOutputDirectory"]</name>
<stringValue id="285">OutputProcessedDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="286" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="287">["NoOfParallelFiles"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="288">input["NoOfParallelFiles"]</name>
<stringValue id="289">NrOfFilesParallel</stringValue>
<type>VARIABLE</type>
</item>
<item id="290" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="291">["OutputDirectory"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="292">input["OutputDirectory"]</name>
<stringValue id="293">OutputDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="294" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="295">["ParallelBranches"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="296">input["ParallelBranches"]</name>
<stringValue id="297">ParallelBranches</stringValue>
<type>VARIABLE</type>
</item>
<item id="298" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="299">["Pattern"]@[Ljava/lang/String;@</UITypeHint>
<input>true</input>
<name id="300">input["Pattern"]</name>
<stringValue id="301">PatternUnzipped</stringValue>
<type>VARIABLE</type>
</item>
<item id="302" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="303">["SuccessAction"]@com/j2fe/feeds/SuccessAction@</UITypeHint>
<input>true</input>
<name id="304">input["SuccessAction"]</name>
<stringValue id="305">SuccessAction</stringValue>
<type>VARIABLE</type>
</item>
<item id="306" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="307">["VendorDefinition"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="308">input["VendorDefinition"]</name>
<stringValue id="309">VendorDefinition</stringValue>
<type>VARIABLE</type>
</item>
<item id="310" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="311">["ZipInputDirectory"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="312">input["ZipInputDirectory"]</name>
<stringValue id="313">ZipInputDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="314" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="315">name</name>
<stringValue id="316">RATINGS_MOODYS</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="317" type="java.util.HashSet">
<item idref="247" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="318" type="java.util.HashSet">
<item id="319" type="com.j2fe.workflow.definition.Transition">
<name id="320">goto-next</name>
<source idref="249"/>
<target id="321">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="322"/>
<directJoin>false</directJoin>
<name id="323">Move Processed Files from InputZipped</name>
<nodeHandler>com.j2fe.general.activities.CommandLine</nodeHandler>
<nodeHandlerClass id="324">com.j2fe.general.activities.CommandLine</nodeHandlerClass>
<parameters id="325" type="java.util.HashSet">
<item id="326" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="327">commandLine</name>
<stringValue id="328">mv $SrcDir/* $TgtDir</stringValue>
<type>CONSTANT</type>
</item>
<item id="329" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="330">["SrcDir"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="331">environment["SrcDir"]</name>
<stringValue id="332">ZipInputDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="333" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="334">["TgtDir"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="335">environment["TgtDir"]</name>
<stringValue id="336">ZipInputProcessedDirectory</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="337" type="java.util.HashSet">
<item idref="319" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="338" type="java.util.HashSet">
<item id="339" type="com.j2fe.workflow.definition.Transition">
<name id="340">goto-next</name>
<source idref="321"/>
<target id="341">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="342"/>
<directJoin>false</directJoin>
<name id="343">Delete Files from Input</name>
<nodeHandler>com.j2fe.general.activities.CommandLine</nodeHandler>
<nodeHandlerClass id="344">com.j2fe.general.activities.CommandLine</nodeHandlerClass>
<parameters id="345" type="java.util.HashSet">
<item id="346" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="347">commandLine</name>
<stringValue id="348">rm $SrcDir/*</stringValue>
<type>CONSTANT</type>
</item>
<item id="349" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="350">["SrcDir"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="351">environment["SrcDir"]</name>
<stringValue id="352">InputDirectory</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="353" type="java.util.HashSet">
<item idref="339" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="354" type="java.util.HashSet">
<item id="355" type="com.j2fe.workflow.definition.Transition">
<name id="356">goto-next</name>
<source idref="341"/>
<target idref="89"/>
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
<type>ACTIVITY</type>
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
<type>ACTIVITY</type>
</target>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="96"/>
</item>
</sources>
<targets id="357" type="java.util.HashSet">
<item idref="94" type="com.j2fe.workflow.definition.Transition"/>
<item idref="211" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="89"/>
</item>
<item idref="355" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="358" type="java.util.HashSet">
<item idref="87" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="82"/>
</item>
<item idref="80" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="359" type="java.util.HashSet">
<item idref="146" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</target>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="2"/>
</item>
<item idref="201" type="com.j2fe.workflow.definition.Transition"/>
<item idref="76" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="360" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="361">Custom/Dataloads/Ratings</group>
<haltOnError>true</haltOnError>
<lastChangeUser id="362">user1</lastChangeUser>
<lastUpdate id="363">2025-09-12T16:01:01.000+0100</lastUpdate>
<name id="364">MHI_WRAPPER_MOODYS</name>
<nodes id="365" type="java.util.HashSet">
<item idref="249" type="com.j2fe.workflow.definition.Node"/>
<item idref="191" type="com.j2fe.workflow.definition.Node"/>
<item idref="179" type="com.j2fe.workflow.definition.Node"/>
<item idref="44" type="com.j2fe.workflow.definition.Node"/>
<item idref="341" type="com.j2fe.workflow.definition.Node"/>
<item idref="234" type="com.j2fe.workflow.definition.Node"/>
<item idref="151" type="com.j2fe.workflow.definition.Node"/>
<item idref="89" type="com.j2fe.workflow.definition.Node"/>
<item idref="82" type="com.j2fe.workflow.definition.Node"/>
<item idref="124" type="com.j2fe.workflow.definition.Node"/>
<item idref="113" type="com.j2fe.workflow.definition.Node"/>
<item idref="55" type="com.j2fe.workflow.definition.Node"/>
<item idref="9" type="com.j2fe.workflow.definition.Node"/>
<item idref="206" type="com.j2fe.workflow.definition.Node"/>
<item idref="321" type="com.j2fe.workflow.definition.Node"/>
<item idref="216" type="com.j2fe.workflow.definition.Node"/>
<item idref="96" type="com.j2fe.workflow.definition.Node"/>
<item idref="159" type="com.j2fe.workflow.definition.Node"/>
<item idref="69" type="com.j2fe.workflow.definition.Node"/>
<item idref="2" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>true</optimize>
<parameter id="366" type="java.util.HashMap">
<entry>
<key id="367" type="java.lang.String">BulkSize</key>
<value id="368" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="369">java.lang.Long</className>
<clazz>java.lang.Long</clazz>
<description id="370">The number of lines in which the input file will be split.</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="371" type="java.lang.String">BusinessFeed</key>
<value id="372" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="373">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="374">MoodysRDSInstrument or MoodysRDSOrganization

The Business Feed to be used for the file processing. Only files which belong to the feed will be picked up from the directory!
Either Business Feed or the Vendor Definition must be provided.</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="375" type="java.lang.String">Directory</key>
<value id="376" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="377">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="378" type="java.lang.String">FileLoadEvent</key>
<value id="379" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="380">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="381" type="java.lang.String">FileSystem</key>
<value id="382" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="383">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="384"/>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="385" type="java.lang.String">FileSystemName</key>
<value id="386" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="387">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="388"/>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="389" type="java.lang.String">InputDirectory</key>
<value id="390" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="391">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="392">The directory it uses to store unzipped files</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="393" type="java.lang.String">IsInstrumentFile</key>
<value id="394" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="395">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<description id="396">Whether to ocnsider input file as an instrument file or an organisation file</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="397" type="java.lang.String">MessageBulkSize</key>
<value id="398" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="399">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="400" type="java.lang.String">MessageType</key>
<value id="401" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="402">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="403">Sets the Message Type to be used for processing a list of files. Processing of the files will be done in sequence (Grouping on file level will not be taken into consideration).</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="404" type="java.lang.String">NrOfFilesParallel</key>
<value id="405" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="406">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="407" type="java.lang.String">OutputDirectory</key>
<value id="408" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="409">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="410">The output directory for generated bulk files.</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="411" type="java.lang.String">OutputProcessedDirectory</key>
<value id="412" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="413">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="414" type="java.lang.String">ParallelBranches</key>
<value id="415" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="416">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="417">The number of files that are processed in parallel, as long as they belong to the same group (see File Definitions at Business Feed).</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="418" type="java.lang.String">PatternUnzipped</key>
<value id="419" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="420">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="421">Used to determine which .split files to process cfg*inst* or cfg*org*</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="422" type="java.lang.String">PatternZipped</key>
<value id="423" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="424">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="425" type="java.lang.String">ReDownloadfiles</key>
<value id="426" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="427">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<description id="428">Should redownload files or not</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="429" type="java.lang.String">Recursive</key>
<value id="430" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="431">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="432" type="java.lang.String">SortAscending</key>
<value id="433" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="434">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="435" type="java.lang.String">SortOrder</key>
<value id="436" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="437">com.j2fe.feeds.activities.ListFiles$Sort</className>
<clazz>com.j2fe.feeds.activities.ListFiles$Sort</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="438" type="java.lang.String">SuccessAction</key>
<value id="439" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="440">com.j2fe.feeds.SuccessAction</className>
<clazz>com.j2fe.feeds.SuccessAction</clazz>
<description id="441">This input is used for success action to be performed on input zip files from ZipInputDirectory. While choosing to MOVE input zip files, please provide ZipMoveDirectory input</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="442" type="java.lang.String">VendorDefinition</key>
<value id="443" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="444">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="445">The vendor definition is used to find the message types and business feeds of the files in the directory. Only files which belong to the different Business Feeds will be processed.
Either the vendor or the business feed has to be provided to the WF.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="446" type="java.lang.String">ZipInputDaysToKeep</key>
<value id="447" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="448">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="449" type="java.lang.String">ZipInputDirectory</key>
<value id="450" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="451">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="452">The directory it searches for .zip files for processing</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="453" type="java.lang.String">ZipInputProcessedDirectory</key>
<value id="454" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="455">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
</parameter>
<permissions id="456" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>true</purgeAtEnd>
<retries>0</retries>
<startNode idref="69"/>
<status>RELEASED</status>
<variables id="457" type="java.util.HashMap">
<entry>
<key id="458" type="java.lang.String">BulkSize</key>
<value id="459" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="460">java.lang.Long</className>
<clazz>java.lang.Long</clazz>
<description id="461">The number of lines in which the input file will be split.</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="462" type="java.lang.String">BusinessFeed</key>
<value id="463" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="464">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="465">MoodysRDSInstrument or MoodysRDSOrganization

The Business Feed to be used for the file processing. Only files which belong to the feed will be picked up from the directory!
Either Business Feed or the Vendor Definition must be provided.</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="466" type="java.lang.String">Counter</key>
<value id="467" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="468">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<persistent>false</persistent>
<value id="469" type="java.lang.Integer">0</value>
</value>
</entry>
<entry>
<key id="470" type="java.lang.String">Directory</key>
<value id="471" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="472">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="473" type="java.lang.String">/users/Mizuho_RDS2</value>
</value>
</entry>
<entry>
<key id="474" type="java.lang.String">FileLoadEvent</key>
<value id="475" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="476">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="477" type="java.lang.String">StandardFileLoad</value>
</value>
</entry>
<entry>
<key id="478" type="java.lang.String">FileSystem</key>
<value id="479" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="480">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="481"/>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="482" type="java.lang.String">FileSystemName</key>
<value id="483" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="484">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="485"/>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="486" type="java.lang.String">InputDirectory</key>
<value id="487" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="488">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="489">The directory it uses to store unzipped files</description>
<persistent>false</persistent>
<value id="490" type="java.lang.String">${gs.bin.path}/../MoodysRDS2/Input</value>
</value>
</entry>
<entry>
<key id="491" type="java.lang.String">IsInstrumentFile</key>
<value id="492" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="493">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<description id="494">Whether to ocnsider input file as an instrument file or an organisation file</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="495" type="java.lang.String">MessageBulkSize</key>
<value id="496" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="497">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<persistent>false</persistent>
<value id="498" type="java.lang.Integer">500</value>
</value>
</entry>
<entry>
<key id="499" type="java.lang.String">MessageType</key>
<value id="500" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="501">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="502">Sets the Message Type to be used for processing a list of files. Processing of the files will be done in sequence (Grouping on file level will not be taken into consideration).</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="503" type="java.lang.String">NrOfFilesParallel</key>
<value id="504" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="505">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<persistent>false</persistent>
<value id="506" type="java.lang.Integer">2</value>
</value>
</entry>
<entry>
<key id="507" type="java.lang.String">OutputDirectory</key>
<value id="508" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="509">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="510">The output directory for generated bulk files.</description>
<persistent>false</persistent>
<value id="511" type="java.lang.String">${gs.bin.path}/../MoodysRDS2/Output</value>
</value>
</entry>
<entry>
<key id="512" type="java.lang.String">OutputProcessedDirectory</key>
<value id="513" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="514">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="515" type="java.lang.String">${gs.bin.path}/../MoodysRDS2/OutputProcessed</value>
</value>
</entry>
<entry>
<key id="516" type="java.lang.String">ParallelBranches</key>
<value id="517" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="518">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="519">The number of files that are processed in parallel, as long as they belong to the same group (see File Definitions at Business Feed).</description>
<persistent>false</persistent>
<value idref="506"/>
</value>
</entry>
<entry>
<key id="520" type="java.lang.String">PatternUnzipped</key>
<value id="521" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="522">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="523">Used to determine which .split files to process cfg*inst* or cfg*org*</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="524" type="java.lang.String">PatternZipped</key>
<value id="525" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="526">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="527" type="java.lang.String">ReDownloadfiles</key>
<value id="528" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="529">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<description id="530">Should redownload files or not</description>
<persistent>false</persistent>
<value id="531" type="java.lang.Boolean">false</value>
</value>
</entry>
<entry>
<key id="532" type="java.lang.String">Recursive</key>
<value id="533" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="534">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<persistent>false</persistent>
<value idref="531"/>
</value>
</entry>
<entry>
<key id="535" type="java.lang.String">SortAscending</key>
<value id="536" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="537">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<persistent>false</persistent>
<value id="538" type="java.lang.Boolean">true</value>
</value>
</entry>
<entry>
<key id="539" type="java.lang.String">SortOrder</key>
<value id="540" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="541">com.j2fe.feeds.activities.ListFiles$Sort</className>
<clazz>com.j2fe.feeds.activities.ListFiles$Sort</clazz>
<persistent>false</persistent>
<value id="542" type="com.j2fe.feeds.activities.ListFiles$Sort">TIME</value>
</value>
</entry>
<entry>
<key id="543" type="java.lang.String">SuccessAction</key>
<value id="544" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="545">com.j2fe.feeds.SuccessAction</className>
<clazz>com.j2fe.feeds.SuccessAction</clazz>
<description id="546">This input is used for success action to be performed on input zip files from ZipInputDirectory. While choosing to MOVE input zip files, please provide ZipMoveDirectory input</description>
<persistent>false</persistent>
<value id="547" type="com.j2fe.feeds.SuccessAction">MOVE</value>
</value>
</entry>
<entry>
<key id="548" type="java.lang.String">VendorDefinition</key>
<value id="549" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="550">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="551">The vendor definition is used to find the message types and business feeds of the files in the directory. Only files which belong to the different Business Feeds will be processed.
Either the vendor or the business feed has to be provided to the WF.</description>
<persistent>false</persistent>
<value id="552" type="java.lang.String">MOODYS</value>
</value>
</entry>
<entry>
<key id="553" type="java.lang.String">ZipInputDaysToKeep</key>
<value id="554" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="555">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="556" type="java.lang.String">90</value>
</value>
</entry>
<entry>
<key id="557" type="java.lang.String">ZipInputDirectory</key>
<value id="558" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="559">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="560">The directory it searches for .zip files for processing</description>
<persistent>false</persistent>
<value id="561" type="java.lang.String">${gs.bin.path}/../MoodysRDS2/InputZipped</value>
</value>
</entry>
<entry>
<key id="562" type="java.lang.String">ZipInputProcessedDirectory</key>
<value id="563" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="564">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="565" type="java.lang.String">${gs.bin.path}/../MoodysRDS2/InputZippedProcessed</value>
</value>
</entry>
</variables>
<version>9</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
