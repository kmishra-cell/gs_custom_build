<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.09">
<package-comment/>
<businessobject displayString="9 - Nulls Handled" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>false</alwaysPersist>
<clustered>true</clustered>
<comment id="1">Nulls Handled</comment>
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
<name id="8">ABORT</name>
<source id="9">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="10"/>
<directJoin>false</directJoin>
<name id="11">Check WF Status</name>
<nodeHandler>com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandler>
<nodeHandlerClass id="12">com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandlerClass>
<parameters id="13" type="java.util.HashSet">
<item id="14" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="15">caseItem</name>
<stringValue id="16">wfStatusCheck</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="17" type="java.util.HashSet">
<item id="18" type="com.j2fe.workflow.definition.Transition">
<name id="19">goto-next</name>
<source id="20">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="21"/>
<directJoin>false</directJoin>
<name id="22">Prepare WF Stats</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="23">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="24" type="java.util.HashSet">
<item id="25" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="26">statements</name>
<stringValue id="27">String Status = wfStatus;
int ThreshWfk = (threshWfk != null) ? threshWfk : 0;
int Instances = (wfCount != null) ? wfCount : 0;
String result = "PROCESS";
 
if (Status != null) {
    if (Status.equals("PENDING")) {
        if (Instances &lt; ThreshWfk) {
            result = "PROCESS";
        } else {
            result = "ABORT";
        }
    } else {
        if (Status.equals("PROCESS")) {
            result = "PROCESS";
        } else {
            result = "ABORT";
        }
    }
} else {
    result = "PROCESS";
}</stringValue>
<type>CONSTANT</type>
</item>
<item id="28" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="29">["result"]@java/lang/Integer@</UITypeHint>
<input>false</input>
<name id="30">variables["result"]</name>
<stringValue id="31">wfStatusCheck</stringValue>
<type>VARIABLE</type>
</item>
<item id="32" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="33">["threshWfk"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="34">variables["threshWfk"]</name>
<stringValue id="35">ThresholdNumberOfWFInstances</stringValue>
<type>VARIABLE</type>
</item>
<item id="36" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="37">["wfCount"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="38">variables["wfCount"]</name>
<stringValue id="39">workflow_cnt</stringValue>
<type>VARIABLE</type>
</item>
<item id="40" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="41">["wfStatus"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="42">variables["wfStatus"]</name>
<stringValue id="43">workflow_stat</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="44" type="java.util.HashSet">
<item id="45" type="com.j2fe.workflow.definition.Transition">
<name id="46">goto-next</name>
<source id="47">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="48"/>
<directJoin>false</directJoin>
<name id="49">Get WF Stats</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="50">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="51" type="java.util.HashSet">
<item id="52" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="53">database</name>
<stringValue id="54">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="55" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="56">indexedParameters[0]</name>
<stringValue id="57">ThresholdProcessingTime</stringValue>
<type>VARIABLE</type>
</item>
<item id="58" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="59">[0]["INSTANCES"]@java/lang/Object@</UITypeHint>
<input>false</input>
<name id="60">mappedResult[0]["INSTANCES"]</name>
<stringValue id="61">workflow_cnt</stringValue>
<type>VARIABLE</type>
</item>
<item id="62" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="63">mappedResult[0]["STATUS"]</name>
<stringValue id="64">workflow_stat</stringValue>
<type>VARIABLE</type>
</item>
<item id="65" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="66">mappedResult[0]["WORKFLOW_NME"]</name>
<stringValue id="67">workflow_nme</stringValue>
<type>VARIABLE</type>
</item>
<item id="68" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="69">querySQL</name>
<stringValue id="70"> SELECT wfdf.workflow_nme, COUNT(1) AS "INSTANCES", CASE WHEN ((COUNT(1) = 1 OR COUNT(1) = 0) AND MIN(workflow_start_tms) &gt; sysdate() - make_interval(mins =&gt; 30)) THEN 'PROCESS' WHEN (COUNT(1) &gt; 1 AND MIN(workflow_start_tms) &lt; sysdate() - make_interval(hours =&gt; ?::int)) THEN 'PENDING' ELSE 'ABORT' END AS "STATUS" FROM ft_wf_wfdf wfdf JOIN ft_wf_wfri wfri ON wfdf.workflow_id = wfri.workflow_id WHERE wfdf.workflow_nme = 'MHI_WRAPPER_SNP_V4'   AND wfri.WF_RUNTIME_STAT_TYP = 'STARTED' GROUP BY wfdf.workflow_nme</stringValue>
<type>CONSTANT</type>
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
<name id="76">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="77">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="78" type="java.util.HashSet"/>
<targets id="79" type="java.util.HashSet">
<item idref="72" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="47"/>
</item>
</sources>
<targets id="80" type="java.util.HashSet">
<item idref="45" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="20"/>
</item>
</sources>
<targets id="81" type="java.util.HashSet">
<item idref="18" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="9"/>
</item>
</sources>
<targets id="82" type="java.util.HashSet">
<item idref="7" type="com.j2fe.workflow.definition.Transition"/>
<item id="83" type="com.j2fe.workflow.definition.Transition">
<name id="84">PROCESS</name>
<source idref="9"/>
<target id="85">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="86"/>
<directJoin>false</directJoin>
<name id="87">build arrays</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="88">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="89" type="java.util.HashSet">
<item id="90" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="91">statements</name>
<stringValue id="92">String directories = Directories;&#13;
String filePatterns = FilePatterns;&#13;
String bulkPatterns = BulkFilePatterns;&#13;
String[] dirArray = directories.split(",");&#13;
String[] filePatternArray = filePatterns.split(",");&#13;
String[] bulkPatternArray = bulkPatterns.split(",");</stringValue>
<type>CONSTANT</type>
</item>
<item id="93" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="94">["BulkFilePatterns"]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="95">variables["BulkFilePatterns"]</name>
<stringValue id="96">BulkFilePatterns</stringValue>
<type>VARIABLE</type>
</item>
<item id="97" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="98">variables["Directories"]</name>
<stringValue id="99">VendorDirectories</stringValue>
<type>VARIABLE</type>
</item>
<item id="100" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="101">variables["FilePatterns"]</name>
<stringValue id="102">DownloadFilePatterns</stringValue>
<type>VARIABLE</type>
</item>
<item id="103" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="104">variables["bulkPatternArray"]</name>
<stringValue id="105">BulkPatternArray</stringValue>
<type>VARIABLE</type>
</item>
<item id="106" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="107">variables["dirArray"]</name>
<stringValue id="108">DirectoryArray</stringValue>
<type>VARIABLE</type>
</item>
<item id="109" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="110">variables["filePatternArray"]</name>
<stringValue id="111">FilePatternArray</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="112" type="java.util.HashSet">
<item idref="83" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="113" type="java.util.HashSet">
<item id="114" type="com.j2fe.workflow.definition.Transition">
<name id="115">goto-next</name>
<source idref="85"/>
<target id="116">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="117"/>
<directJoin>false</directJoin>
<name id="118">SNPRatingsParent</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="119">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="120" type="java.util.HashSet">
<item id="121" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="122">["BulkFilePatterns"]@[Ljava/lang/String;@</UITypeHint>
<input>true</input>
<name id="123">input["BulkFilePatterns"]</name>
<stringValue id="124">BulkPatternArray</stringValue>
<type>VARIABLE</type>
</item>
<item id="125" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="126">["BulkRange"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="127">input["BulkRange"]</name>
<stringValue id="128">BulkRange</stringValue>
<type>VARIABLE</type>
</item>
<item id="129" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="130">["BulkSize"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="131">input["BulkSize"]</name>
<stringValue id="132">BulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="133" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="134">["FileLoadEvent"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="135">input["FileLoadEvent"]</name>
<stringValue id="136">FileLoadEvent</stringValue>
<type>VARIABLE</type>
</item>
<item id="137" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="138">["FilePatterns"]@[Ljava/lang/String;@</UITypeHint>
<input>true</input>
<name id="139">input["FilePatterns"]</name>
<stringValue id="140">FilePatternArray</stringValue>
<type>VARIABLE</type>
</item>
<item id="141" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="142">["InputDirectory"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="143">input["InputDirectory"]</name>
<stringValue id="144">InputDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="145" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="146">["IsFullFile"]@java/lang/Boolean@</UITypeHint>
<input>true</input>
<name id="147">input["IsFullFile"]</name>
<stringValue id="148">IsFullFile</stringValue>
<type>VARIABLE</type>
</item>
<item id="149" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="150">["MessageBulkSize"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="151">input["MessageBulkSize"]</name>
<stringValue id="152">MessageBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="153" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="154">["MoveDirectory"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="155">input["MoveDirectory"]</name>
<stringValue id="156">MoveDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="157" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="158">["MoveFiles"]@java/lang/Boolean@</UITypeHint>
<input>true</input>
<name id="159">input["MoveFiles"]</name>
<stringValue id="160">MoveFiles</stringValue>
<type>VARIABLE</type>
</item>
<item id="161" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="162">["NrOfFilesParallel"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="163">input["NrOfFilesParallel"]</name>
<stringValue id="164">NrOfFilesParallel</stringValue>
<type>VARIABLE</type>
</item>
<item id="165" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="166">["NrOfStagingFilesParallel"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="167">input["NrOfStagingFilesParallel"]</name>
<stringValue id="168">NrOfStagingFilesParallel</stringValue>
<type>VARIABLE</type>
</item>
<item id="169" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="170">["OutputDirectory"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="171">input["OutputDirectory"]</name>
<stringValue id="172">BulkOutputDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="173" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="174">["ParallelBranches"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="175">input["ParallelBranches"]</name>
<stringValue id="176">ParallelBranches</stringValue>
<type>VARIABLE</type>
</item>
<item id="177" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="178">["RatingsType"]@com/j2fe/connector/RatingsType@</UITypeHint>
<input>true</input>
<name id="179">input["RatingsType"]</name>
<stringValue id="180">RatingsType</stringValue>
<type>VARIABLE</type>
</item>
<item id="181" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="182">["ReProcessProcessedFiles"]@java/lang/Boolean@</UITypeHint>
<input>true</input>
<name id="183">input["ReProcessProcessedFiles"]</name>
<stringValue id="184">ReProcessProcessedFiles</stringValue>
<type>VARIABLE</type>
</item>
<item id="185" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="186">["StagingBulkSize"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="187">input["StagingBulkSize"]</name>
<stringValue id="188">StagingBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="189" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="190">["VendorDefinition"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="191">input["VendorDefinition"]</name>
<stringValue id="192">VendorDefinition</stringValue>
<type>VARIABLE</type>
</item>
<item id="193" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="194">["VendorDirectories"]@[Ljava/lang/String;@</UITypeHint>
<input>true</input>
<name id="195">input["VendorDirectories"]</name>
<stringValue id="196">DirectoryArray</stringValue>
<type>VARIABLE</type>
</item>
<item id="197" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="198">name</name>
<stringValue id="199">SNPRatingsParent</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="200" type="java.util.HashSet">
<item idref="114" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="201" type="java.util.HashSet">
<item id="202" type="com.j2fe.workflow.definition.Transition">
<name id="203">goto-next</name>
<source idref="116"/>
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
<type>XORSPLIT</type>
</source>
<target idref="2"/>
</item>
<item idref="202" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="204" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="205">Custom/Dataloads/Ratings</group>
<haltOnError>true</haltOnError>
<lastChangeUser id="206">user1</lastChangeUser>
<lastUpdate id="207">2025-09-12T12:34:50.000+0100</lastUpdate>
<name id="208">MHI_WRAPPER_SNP_V4</name>
<nodes id="209" type="java.util.HashSet">
<item idref="9" type="com.j2fe.workflow.definition.Node"/>
<item idref="47" type="com.j2fe.workflow.definition.Node"/>
<item idref="20" type="com.j2fe.workflow.definition.Node"/>
<item idref="116" type="com.j2fe.workflow.definition.Node"/>
<item idref="74" type="com.j2fe.workflow.definition.Node"/>
<item idref="2" type="com.j2fe.workflow.definition.Node"/>
<item idref="85" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>true</optimize>
<parameter id="210" type="java.util.HashMap">
<entry>
<key id="211" type="java.lang.String">BulkFilePatterns</key>
<value id="212" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="213">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="214" type="java.lang.String">BulkOutputDirectory</key>
<value id="215" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="216">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="217">The output directory for generated bulk files.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="218" type="java.lang.String">BulkRange</key>
<value id="219" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="220">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="221">Number of bulks need to be processed in parallel during bulking phase.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="222" type="java.lang.String">BulkSize</key>
<value id="223" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="224">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="225" type="java.lang.String">DownloadFilePatterns</key>
<value id="226" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="227">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="228" type="java.lang.String">FileLoadEvent</key>
<value id="229" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="230">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="231" type="java.lang.String">InputDirectory</key>
<value id="232" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="233">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="234">The directory it uses to store unzipped files</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="235" type="java.lang.String">IsFullFile</key>
<value id="236" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="237">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="238" type="java.lang.String">MessageBulkSize</key>
<value id="239" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="240">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="241" type="java.lang.String">MoveDirectory</key>
<value id="242" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="243">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="244" type="java.lang.String">MoveFiles</key>
<value id="245" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="246">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="247" type="java.lang.String">NrOfFilesParallel</key>
<value id="248" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="249">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="250">Number of files to be loaded in parallel</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="251" type="java.lang.String">NrOfStagingFilesParallel</key>
<value id="252" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="253">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="254">Number of staging files processed in parallel</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="255" type="java.lang.String">ParallelBranches</key>
<value id="256" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="257">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="258">The number of files that are processed in parallel, as long as they belong to the same group (see File Definitions at Business Feed).</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="259" type="java.lang.String">RatingsType</key>
<value id="260" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="261">com.j2fe.connector.RatingsType</className>
<clazz>com.j2fe.connector.RatingsType</clazz>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="262" type="java.lang.String">ReProcessProcessedFiles</key>
<value id="263" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="264">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="265" type="java.lang.String">StagingBulkSize</key>
<value id="266" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="267">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="268">The number of messages from a file which are processed in parallel.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="269" type="java.lang.String">ThresholdNumberOfWFInstances</key>
<value id="270" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="271">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="272">Threshold Number Of WF Instances that can run in parallel</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="273" type="java.lang.String">ThresholdProcessingTime</key>
<value id="274" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="275">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="276">Threshold Processing Time in hours</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="277" type="java.lang.String">VendorDefinition</key>
<value id="278" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="279">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="280">The vendor definition is used to find the message types and business feeds of the files in the directory. Only files which belong to the different Business Feeds will be processed.
Either the vendor or the business feed has to be provided to the WF.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="281" type="java.lang.String">VendorDirectories</key>
<value id="282" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="283">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
</parameter>
<permissions id="284" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>true</purgeAtEnd>
<retries>0</retries>
<startNode idref="74"/>
<status>RELEASED</status>
<variables id="285" type="java.util.HashMap">
<entry>
<key id="286" type="java.lang.String">BulkFilePatterns</key>
<value id="287" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="288">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="289" type="java.lang.String">spRatingData20*</value>
</value>
</entry>
<entry>
<key id="290" type="java.lang.String">BulkOutputDirectory</key>
<value id="291" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="292">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="293">The output directory for generated bulk files.</description>
<persistent>false</persistent>
<value id="294" type="java.lang.String">${gs.bin.path}/../sandp/v4/output</value>
</value>
</entry>
<entry>
<key id="295" type="java.lang.String">BulkRange</key>
<value id="296" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="297">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="298">Number of bulks need to be processed in parallel during bulking phase.</description>
<persistent>false</persistent>
<value id="299" type="java.lang.Integer">10</value>
</value>
</entry>
<entry>
<key id="300" type="java.lang.String">BulkSize</key>
<value id="301" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="302">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<persistent>false</persistent>
<value id="303" type="java.lang.Integer">20000</value>
</value>
</entry>
<entry>
<key id="304" type="java.lang.String">DownloadFilePatterns</key>
<value id="305" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="306">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="307" type="java.lang.String">FileLoadEvent</key>
<value id="308" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="309">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="310" type="java.lang.String">StandardFileLoadAndPublish</value>
</value>
</entry>
<entry>
<key id="311" type="java.lang.String">InputDirectory</key>
<value id="312" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="313">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="314">The directory it uses to store unzipped files</description>
<persistent>false</persistent>
<value id="315" type="java.lang.String">${gs.bin.path}/../sandp/v4/input</value>
</value>
</entry>
<entry>
<key id="316" type="java.lang.String">IsFullFile</key>
<value id="317" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="318">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<persistent>false</persistent>
<value id="319" type="java.lang.Boolean">false</value>
</value>
</entry>
<entry>
<key id="320" type="java.lang.String">MessageBulkSize</key>
<value id="321" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="322">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<persistent>false</persistent>
<value id="323" type="java.lang.Integer">500</value>
</value>
</entry>
<entry>
<key id="324" type="java.lang.String">MoveDirectory</key>
<value id="325" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="326">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="327" type="java.lang.String">${gs.bin.path}/../sandp/v4/done</value>
</value>
</entry>
<entry>
<key id="328" type="java.lang.String">MoveFiles</key>
<value id="329" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="330">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<persistent>false</persistent>
<value idref="319"/>
</value>
</entry>
<entry>
<key id="331" type="java.lang.String">NrOfFilesParallel</key>
<value id="332" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="333">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="334">Number of files to be loaded in parallel</description>
<persistent>false</persistent>
<value id="335" type="java.lang.Integer">2</value>
</value>
</entry>
<entry>
<key id="336" type="java.lang.String">NrOfStagingFilesParallel</key>
<value id="337" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="338">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="339">Number of staging files processed in parallel</description>
<persistent>false</persistent>
<value id="340" type="java.lang.Integer">7</value>
</value>
</entry>
<entry>
<key id="341" type="java.lang.String">ParallelBranches</key>
<value id="342" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="343">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="344">The number of files that are processed in parallel, as long as they belong to the same group (see File Definitions at Business Feed).</description>
<persistent>false</persistent>
<value idref="335"/>
</value>
</entry>
<entry>
<key id="345" type="java.lang.String">RatingsType</key>
<value id="346" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="347">com.j2fe.connector.RatingsType</className>
<clazz>com.j2fe.connector.RatingsType</clazz>
<persistent>false</persistent>
<value id="348" type="com.j2fe.connector.RatingsType">ALL</value>
</value>
</entry>
<entry>
<key id="349" type="java.lang.String">ReProcessProcessedFiles</key>
<value id="350" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="351">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<persistent>false</persistent>
<value idref="319"/>
</value>
</entry>
<entry>
<key id="352" type="java.lang.String">StagingBulkSize</key>
<value id="353" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="354">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="355">The number of messages from a file which are processed in parallel.</description>
<persistent>false</persistent>
<value id="356" type="java.lang.Integer">500</value>
</value>
</entry>
<entry>
<key id="357" type="java.lang.String">ThresholdNumberOfWFInstances</key>
<value id="358" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="359">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="360">Threshold Number Of WF Instances that can run in parallel</description>
<persistent>false</persistent>
<value id="361" type="java.lang.Integer">1</value>
</value>
</entry>
<entry>
<key id="362" type="java.lang.String">ThresholdProcessingTime</key>
<value id="363" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="364">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="365">Threshold Processing Time in hours</description>
<persistent>false</persistent>
<value id="366" type="java.lang.String">24</value>
</value>
</entry>
<entry>
<key id="367" type="java.lang.String">VendorDefinition</key>
<value id="368" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="369">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="370">The vendor definition is used to find the message types and business feeds of the files in the directory. Only files which belong to the different Business Feeds will be processed.
Either the vendor or the business feed has to be provided to the WF.</description>
<persistent>false</persistent>
<value id="371" type="java.lang.String">S&amp;P</value>
</value>
</entry>
<entry>
<key id="372" type="java.lang.String">VendorDirectories</key>
<value id="373" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="374">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="375" type="java.lang.String">/Products/RXSPGRatingsGISFCurrentSpan,/Products/RXSPGRatingsReference</value>
</value>
</entry>
</variables>
<version>9</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
