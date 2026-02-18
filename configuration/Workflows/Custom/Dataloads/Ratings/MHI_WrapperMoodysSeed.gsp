<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.03">
<package-comment/>
<businessobject displayString="3 - V-10" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>false</alwaysPersist>
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
<name id="11">INS seed</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="12">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="13" type="java.util.HashSet">
<item id="14" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="15">["BulkSize"]@java/lang/Long@</UITypeHint>
<input>true</input>
<name id="16">input["BulkSize"]</name>
<stringValue id="17">BulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="18" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="19">["BusinessFeed"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="20">input["BusinessFeed"]</name>
<stringValue id="21">BusinessFeed_INS</stringValue>
<type>VARIABLE</type>
</item>
<item id="22" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="23">["Directory"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="24">input["Directory"]</name>
<stringValue id="25">Directory_INS</stringValue>
<type>VARIABLE</type>
</item>
<item id="26" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="27">["FileLoadEvent"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="28">input["FileLoadEvent"]</name>
<stringValue id="29">FileLoadEvent</stringValue>
<type>VARIABLE</type>
</item>
<item id="30" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="31">["FileSystem"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="32">input["FileSystem"]</name>
<stringValue id="33">FileSystem</stringValue>
<type>VARIABLE</type>
</item>
<item id="34" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="35">["FileSystemName"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="36">input["FileSystemName"]</name>
<stringValue id="37">FileSystemName</stringValue>
<type>VARIABLE</type>
</item>
<item id="38" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="39">["InputDirectory"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="40">input["InputDirectory"]</name>
<stringValue id="41">InputDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="42" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="43">["IsInstrumentFile"]@java/lang/Boolean@</UITypeHint>
<input>true</input>
<name id="44">input["IsInstrumentFile"]</name>
<objectValue id="45" type="java.lang.Boolean">true</objectValue>
<type>CONSTANT</type>
</item>
<item id="46" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="47">["MessageBulkSize"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="48">input["MessageBulkSize"]</name>
<stringValue id="49">MessageBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="50" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="51">["MessageType"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="52">input["MessageType"]</name>
<stringValue id="53">MessageType</stringValue>
<type>VARIABLE</type>
</item>
<item id="54" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="55">["NrOfFilesParallel"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="56">input["NrOfFilesParallel"]</name>
<stringValue id="57">NrOfFilesParallel</stringValue>
<type>VARIABLE</type>
</item>
<item id="58" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="59">["OutputDirectory"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="60">input["OutputDirectory"]</name>
<stringValue id="61">OutputDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="62" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="63">["OutputProcessedDirectory"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="64">input["OutputProcessedDirectory"]</name>
<stringValue id="65">OutputProcessedDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="66" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="67">["ParallelBranches"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="68">input["ParallelBranches"]</name>
<stringValue id="69">ParallelBranches</stringValue>
<type>VARIABLE</type>
</item>
<item id="70" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="71">["PatternUnzipped"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="72">input["PatternUnzipped"]</name>
<stringValue id="73">PatternUnzipped_INS</stringValue>
<type>VARIABLE</type>
</item>
<item id="74" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="75">["PatternZipped"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="76">input["PatternZipped"]</name>
<stringValue id="77">PatternZipped_INS</stringValue>
<type>VARIABLE</type>
</item>
<item id="78" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="79">["ReDownloadfiles"]@java/lang/Boolean@</UITypeHint>
<input>true</input>
<name id="80">input["ReDownloadfiles"]</name>
<stringValue id="81">ReDownloadfiles</stringValue>
<type>VARIABLE</type>
</item>
<item id="82" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="83">["Recursive"]@java/lang/Boolean@</UITypeHint>
<input>true</input>
<name id="84">input["Recursive"]</name>
<stringValue id="85">Recursive</stringValue>
<type>VARIABLE</type>
</item>
<item id="86" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="87">["SortAscending"]@java/lang/Boolean@</UITypeHint>
<input>true</input>
<name id="88">input["SortAscending"]</name>
<stringValue id="89">SortAscending</stringValue>
<type>VARIABLE</type>
</item>
<item id="90" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="91">["SortOrder"]@com/j2fe/feeds/activities/ListFiles$Sort@</UITypeHint>
<input>true</input>
<name id="92">input["SortOrder"]</name>
<stringValue id="93">SortOrder</stringValue>
<type>VARIABLE</type>
</item>
<item id="94" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="95">["SuccessAction"]@com/j2fe/feeds/SuccessAction@</UITypeHint>
<input>true</input>
<name id="96">input["SuccessAction"]</name>
<stringValue id="97">SuccessAction</stringValue>
<type>VARIABLE</type>
</item>
<item id="98" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="99">["VendorDefinition"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="100">input["VendorDefinition"]</name>
<stringValue id="101">VendorDefinition</stringValue>
<type>VARIABLE</type>
</item>
<item id="102" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="103">["ZipInputDaysToKeep"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="104">input["ZipInputDaysToKeep"]</name>
<stringValue id="105">ZipInputDaysToKeep</stringValue>
<type>VARIABLE</type>
</item>
<item id="106" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="107">["ZipInputDirectory"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="108">input["ZipInputDirectory"]</name>
<stringValue id="109">ZipInputDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="110" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="111">["ZipInputProcessedDirectory"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="112">input["ZipInputProcessedDirectory"]</name>
<stringValue id="113">ZipInputProcessedDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="114" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="115">name</name>
<stringValue id="116">MHI_WRAPPER_MOODYS</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="117" type="java.util.HashSet">
<item id="118" type="com.j2fe.workflow.definition.Transition">
<name id="119">goto-next</name>
<source id="120">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="121"/>
<directJoin>false</directJoin>
<name id="122">ORG seed</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="123">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="124" type="java.util.HashSet">
<item id="125" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="126">["BulkSize"]@java/lang/Long@</UITypeHint>
<input>true</input>
<name id="127">input["BulkSize"]</name>
<stringValue id="128">BulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="129" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="130">["BusinessFeed"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="131">input["BusinessFeed"]</name>
<stringValue id="132">BusinessFeed_ORG</stringValue>
<type>VARIABLE</type>
</item>
<item id="133" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="134">["Directory"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="135">input["Directory"]</name>
<stringValue id="136">Directory_ORG</stringValue>
<type>VARIABLE</type>
</item>
<item id="137" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="138">["FileLoadEvent"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="139">input["FileLoadEvent"]</name>
<stringValue id="140">FileLoadEvent</stringValue>
<type>VARIABLE</type>
</item>
<item id="141" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="142">["FileSystem"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="143">input["FileSystem"]</name>
<stringValue id="144">FileSystem</stringValue>
<type>VARIABLE</type>
</item>
<item id="145" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="146">["FileSystemName"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="147">input["FileSystemName"]</name>
<stringValue id="148">FileSystemName</stringValue>
<type>VARIABLE</type>
</item>
<item id="149" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="150">["InputDirectory"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="151">input["InputDirectory"]</name>
<stringValue id="152">InputDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="153" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="154">["IsInstrumentFile"]@java/lang/Boolean@</UITypeHint>
<input>true</input>
<name id="155">input["IsInstrumentFile"]</name>
<stringValue id="156">false</stringValue>
<type>CONSTANT</type>
</item>
<item id="157" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="158">["MessageBulkSize"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="159">input["MessageBulkSize"]</name>
<stringValue id="160">MessageBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="161" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="162">["MessageType"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="163">input["MessageType"]</name>
<stringValue id="164">MessageType</stringValue>
<type>VARIABLE</type>
</item>
<item id="165" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="166">["NrOfFilesParallel"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="167">input["NrOfFilesParallel"]</name>
<stringValue id="168">NrOfFilesParallel</stringValue>
<type>VARIABLE</type>
</item>
<item id="169" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="170">["OutputDirectory"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="171">input["OutputDirectory"]</name>
<stringValue id="172">OutputDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="173" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="174">["OutputProcessedDirectory"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="175">input["OutputProcessedDirectory"]</name>
<stringValue id="176">OutputProcessedDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="177" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="178">["ParallelBranches"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="179">input["ParallelBranches"]</name>
<stringValue id="180">ParallelBranches</stringValue>
<type>VARIABLE</type>
</item>
<item id="181" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="182">["PatternUnzipped"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="183">input["PatternUnzipped"]</name>
<stringValue id="184">PatternUnzipped_ORG</stringValue>
<type>VARIABLE</type>
</item>
<item id="185" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="186">["PatternZipped"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="187">input["PatternZipped"]</name>
<stringValue id="188">PatternZipped_ORG</stringValue>
<type>VARIABLE</type>
</item>
<item id="189" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="190">["ReDownloadfiles"]@java/lang/Boolean@</UITypeHint>
<input>true</input>
<name id="191">input["ReDownloadfiles"]</name>
<stringValue id="192">ReDownloadfiles</stringValue>
<type>VARIABLE</type>
</item>
<item id="193" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="194">["Recursive"]@java/lang/Boolean@</UITypeHint>
<input>true</input>
<name id="195">input["Recursive"]</name>
<stringValue id="196">Recursive</stringValue>
<type>VARIABLE</type>
</item>
<item id="197" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="198">["SortAscending"]@java/lang/Boolean@</UITypeHint>
<input>true</input>
<name id="199">input["SortAscending"]</name>
<stringValue id="200">SortAscending</stringValue>
<type>VARIABLE</type>
</item>
<item id="201" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="202">["SortOrder"]@com/j2fe/feeds/activities/ListFiles$Sort@</UITypeHint>
<input>true</input>
<name id="203">input["SortOrder"]</name>
<stringValue id="204">SortOrder</stringValue>
<type>VARIABLE</type>
</item>
<item id="205" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="206">["SuccessAction"]@com/j2fe/feeds/SuccessAction@</UITypeHint>
<input>true</input>
<name id="207">input["SuccessAction"]</name>
<stringValue id="208">SuccessAction</stringValue>
<type>VARIABLE</type>
</item>
<item id="209" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="210">["VendorDefinition"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="211">input["VendorDefinition"]</name>
<stringValue id="212">VendorDefinition</stringValue>
<type>VARIABLE</type>
</item>
<item id="213" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="214">["ZipInputDaysToKeep"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="215">input["ZipInputDaysToKeep"]</name>
<stringValue id="216">ZipInputDaysToKeep</stringValue>
<type>VARIABLE</type>
</item>
<item id="217" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="218">["ZipInputDirectory"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="219">input["ZipInputDirectory"]</name>
<stringValue id="220">ZipInputDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="221" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="222">["ZipInputProcessedDirectory"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="223">input["ZipInputProcessedDirectory"]</name>
<stringValue id="224">ZipInputProcessedDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="225" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="226">name</name>
<stringValue id="227">MHI_WRAPPER_MOODYS</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="228" type="java.util.HashSet">
<item id="229" type="com.j2fe.workflow.definition.Transition">
<name id="230">nothing-found</name>
<source id="231">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="232"/>
<directJoin>false</directJoin>
<name id="233">Is Workflow Running?</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="234">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="235" type="java.util.HashSet">
<item id="236" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="237">database</name>
<stringValue id="238">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="239" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="240">firstColumnsResult</name>
<stringValue id="241">FirstColumnResultList</stringValue>
<type>VARIABLE</type>
</item>
<item id="242" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="243">indexedResult</name>
<stringValue id="244">ResultList</stringValue>
<type>VARIABLE</type>
</item>
<item id="245" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="246">mappedResult</name>
<stringValue id="247">MappedResult</stringValue>
<type>VARIABLE</type>
</item>
<item id="248" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="249">querySQL</name>
<stringValue id="250">select 'x' from dual where 2 &lt;= (&#13;
select count(1)&#13;
from ft_wf_wfdf wfdf, ft_wf_wfri wfri &#13;
where wfdf.workflow_id=wfri.workflow_id &#13;
and wfdf.workflow_nme='MHI_WrapperMoodysSeed'&#13;
and wfri.wf_runtime_stat_typ not in ('FAILED','ROLLBACKED')&#13;
and wfri.workflow_end_tms is null)</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="251" type="java.util.HashSet">
<item id="252" type="com.j2fe.workflow.definition.Transition">
<name id="253">goto-next</name>
<source id="254">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="255"/>
<directJoin>false</directJoin>
<name id="256">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="257">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="258" type="java.util.HashSet"/>
<targets id="259" type="java.util.HashSet">
<item idref="252" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="231"/>
</item>
</sources>
<targets id="260" type="java.util.HashSet">
<item idref="229" type="com.j2fe.workflow.definition.Transition"/>
<item id="261" type="com.j2fe.workflow.definition.Transition">
<name id="262">rows-found</name>
<source idref="231"/>
<target idref="2"/>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="120"/>
</item>
</sources>
<targets id="263" type="java.util.HashSet">
<item idref="118" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="9"/>
</item>
</sources>
<targets id="264" type="java.util.HashSet">
<item idref="7" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="2"/>
</item>
<item idref="261" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="265" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="266">Custom/Dataloads/Ratings</group>
<haltOnError>true</haltOnError>
<lastChangeUser id="267">user1</lastChangeUser>
<lastUpdate id="268">2025-05-18T11:06:55.000+0100</lastUpdate>
<name id="269">MHI_WrapperMoodysSeed</name>
<nodes id="270" type="java.util.HashSet">
<item idref="9" type="com.j2fe.workflow.definition.Node"/>
<item idref="231" type="com.j2fe.workflow.definition.Node"/>
<item idref="120" type="com.j2fe.workflow.definition.Node"/>
<item idref="254" type="com.j2fe.workflow.definition.Node"/>
<item idref="2" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>true</optimize>
<parameter id="271" type="java.util.HashMap">
<entry>
<key id="272" type="java.lang.String">BulkSize</key>
<value id="273" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="274">java.lang.Long</className>
<clazz>java.lang.Long</clazz>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="275" type="java.lang.String">BusinessFeed_INS</key>
<value id="276" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="277">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="278" type="java.lang.String">BusinessFeed_ORG</key>
<value id="279" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="280">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="281" type="java.lang.String">Directory_INS</key>
<value id="282" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="283">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="284" type="java.lang.String">Directory_ORG</key>
<value id="285" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="286">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="287" type="java.lang.String">FileLoadEvent</key>
<value id="288" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="289">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="290" type="java.lang.String">FileSystem</key>
<value id="291" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="292">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="293" type="java.lang.String">FileSystemName</key>
<value id="294" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="295">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="296" type="java.lang.String">InputDirectory</key>
<value id="297" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="298">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="299" type="java.lang.String">MessageBulkSize</key>
<value id="300" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="301">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="302" type="java.lang.String">MessageType</key>
<value id="303" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="304">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="305" type="java.lang.String">NrOfFilesParallel</key>
<value id="306" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="307">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="308" type="java.lang.String">OutputDirectory</key>
<value id="309" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="310">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="311" type="java.lang.String">OutputProcessedDirectory</key>
<value id="312" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="313">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="314" type="java.lang.String">ParallelBranches</key>
<value id="315" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="316">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="317" type="java.lang.String">PatternUnzipped_INS</key>
<value id="318" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="319">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="320" type="java.lang.String">PatternUnzipped_ORG</key>
<value id="321" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="322">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="323" type="java.lang.String">PatternZipped_INS</key>
<value id="324" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="325">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="326" type="java.lang.String">PatternZipped_ORG</key>
<value id="327" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="328">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="329" type="java.lang.String">ReDownloadfiles</key>
<value id="330" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="331">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="332" type="java.lang.String">Recursive</key>
<value id="333" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="334">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="335" type="java.lang.String">SortAscending</key>
<value id="336" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="337">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="338" type="java.lang.String">SortOrder</key>
<value id="339" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="340">com.j2fe.feeds.activities.ListFiles$Sort</className>
<clazz>com.j2fe.feeds.activities.ListFiles$Sort</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="341" type="java.lang.String">SuccessAction</key>
<value id="342" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="343">com.j2fe.feeds.SuccessAction</className>
<clazz>com.j2fe.feeds.SuccessAction</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="344" type="java.lang.String">VendorDefinition</key>
<value id="345" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="346">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="347" type="java.lang.String">ZipInputDaysToKeep</key>
<value id="348" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="349">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="350" type="java.lang.String">ZipInputDirectory</key>
<value id="351" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="352">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="353" type="java.lang.String">ZipInputProcessedDirectory</key>
<value id="354" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="355">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
</parameter>
<permissions id="356" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>true</purgeAtEnd>
<retries>0</retries>
<startNode idref="254"/>
<status>RELEASED</status>
<variables id="357" type="java.util.HashMap">
<entry>
<key id="358" type="java.lang.String">BulkSize</key>
<value id="359" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="360">java.lang.Long</className>
<clazz>java.lang.Long</clazz>
<persistent>false</persistent>
<value id="361" type="java.lang.Integer">99999</value>
</value>
</entry>
<entry>
<key id="362" type="java.lang.String">BusinessFeed_INS</key>
<value id="363" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="364">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="365" type="java.lang.String">MoodysRDSInstrument</value>
</value>
</entry>
<entry>
<key id="366" type="java.lang.String">BusinessFeed_ORG</key>
<value id="367" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="368">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="369" type="java.lang.String">MoodysRDSOrganization</value>
</value>
</entry>
<entry>
<key id="370" type="java.lang.String">Directory_INS</key>
<value id="371" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="372">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="373" type="java.lang.String">/users/Mizuho_RDS2/CFG_Instrument_Current_Rating_baseline_daily</value>
</value>
</entry>
<entry>
<key id="374" type="java.lang.String">Directory_ORG</key>
<value id="375" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="376">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="377" type="java.lang.String">/users/Mizuho_RDS2/CFG_Organization_Current_Rating_baseline_daily</value>
</value>
</entry>
<entry>
<key id="378" type="java.lang.String">FileLoadEvent</key>
<value id="379" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="380">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="381" type="java.lang.String">StandardFileLoadAndPublish</value>
</value>
</entry>
<entry>
<key id="382" type="java.lang.String">FileSystem</key>
<value id="383" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="384">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="385" type="java.lang.String">filesystem/sftp/MoodysRDS2Full</value>
</value>
</entry>
<entry>
<key id="386" type="java.lang.String">FileSystemName</key>
<value id="387" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="388">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="389" type="java.lang.String">filesystem/sftp/MoodysRDS2Full/user</value>
</value>
</entry>
<entry>
<key id="390" type="java.lang.String">InputDirectory</key>
<value id="391" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="392">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="393" type="java.lang.String">${gs.bin.path}/../MoodysRDS2/FullFiles/Input</value>
</value>
</entry>
<entry>
<key id="394" type="java.lang.String">MessageBulkSize</key>
<value id="395" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="396">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<persistent>false</persistent>
<value id="397" type="java.lang.Integer">500</value>
</value>
</entry>
<entry>
<key id="398" type="java.lang.String">MessageType</key>
<value id="399" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="400">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="401" type="java.lang.String">NrOfFilesParallel</key>
<value id="402" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="403">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<persistent>false</persistent>
<value id="404" type="java.lang.Integer">2</value>
</value>
</entry>
<entry>
<key id="405" type="java.lang.String">OutputDirectory</key>
<value id="406" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="407">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="408" type="java.lang.String">${gs.bin.path}/../MoodysRDS2/FullFiles/Output</value>
</value>
</entry>
<entry>
<key id="409" type="java.lang.String">OutputProcessedDirectory</key>
<value id="410" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="411">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="412" type="java.lang.String">${gs.bin.path}/../MoodysRDS2/FullFiles/OutputProcessed</value>
</value>
</entry>
<entry>
<key id="413" type="java.lang.String">ParallelBranches</key>
<value id="414" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="415">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<persistent>false</persistent>
<value idref="404"/>
</value>
</entry>
<entry>
<key id="416" type="java.lang.String">PatternUnzipped_INS</key>
<value id="417" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="418">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="419" type="java.lang.String">*inst*Baseline*</value>
</value>
</entry>
<entry>
<key id="420" type="java.lang.String">PatternUnzipped_ORG</key>
<value id="421" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="422">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="423" type="java.lang.String">*org*Baseline*</value>
</value>
</entry>
<entry>
<key id="424" type="java.lang.String">PatternZipped_INS</key>
<value id="425" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="426">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="427" type="java.lang.String">cfg_inst_current_rating_Utf8_Baseline_Daily*.Zip</value>
</value>
</entry>
<entry>
<key id="428" type="java.lang.String">PatternZipped_ORG</key>
<value id="429" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="430">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="431" type="java.lang.String">cfg_organization_current_rating_Utf8_Baseline_Daily*.Zip</value>
</value>
</entry>
<entry>
<key id="432" type="java.lang.String">ReDownloadfiles</key>
<value id="433" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="434">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<persistent>false</persistent>
<value id="435" type="java.lang.Boolean">false</value>
</value>
</entry>
<entry>
<key id="436" type="java.lang.String">Recursive</key>
<value id="437" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="438">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<persistent>false</persistent>
<value idref="435"/>
</value>
</entry>
<entry>
<key id="439" type="java.lang.String">SortAscending</key>
<value id="440" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="441">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<persistent>false</persistent>
<value id="442" type="java.lang.Boolean">true</value>
</value>
</entry>
<entry>
<key id="443" type="java.lang.String">SortOrder</key>
<value id="444" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="445">com.j2fe.feeds.activities.ListFiles$Sort</className>
<clazz>com.j2fe.feeds.activities.ListFiles$Sort</clazz>
<persistent>false</persistent>
<value id="446" type="java.lang.String">NATURAL</value>
</value>
</entry>
<entry>
<key id="447" type="java.lang.String">SuccessAction</key>
<value id="448" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="449">com.j2fe.feeds.SuccessAction</className>
<clazz>com.j2fe.feeds.SuccessAction</clazz>
<persistent>false</persistent>
<value id="450" type="java.lang.String">MOVE</value>
</value>
</entry>
<entry>
<key id="451" type="java.lang.String">VendorDefinition</key>
<value id="452" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="453">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="454" type="java.lang.String">MOODYS</value>
</value>
</entry>
<entry>
<key id="455" type="java.lang.String">ZipInputDaysToKeep</key>
<value id="456" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="457">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="458" type="java.lang.String">90</value>
</value>
</entry>
<entry>
<key id="459" type="java.lang.String">ZipInputDirectory</key>
<value id="460" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="461">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="462" type="java.lang.String">${gs.bin.path}/../MoodysRDS2/FullFiles/InputZipped</value>
</value>
</entry>
<entry>
<key id="463" type="java.lang.String">ZipInputProcessedDirectory</key>
<value id="464" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="465">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="466" type="java.lang.String">${gs.bin.path}/../MoodysRDS2/FullFiles/InputZippedProcessed</value>
</value>
</entry>
</variables>
<version>3</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
