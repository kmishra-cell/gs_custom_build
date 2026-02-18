<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.03">
<package-comment/>
<businessobject displayString="5 - V-10" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>false</alwaysPersist>
<clustered>true</clustered>
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
<name id="15">directory</name>
<stringValue id="16">InputDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="17" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="18">fileSystem</name>
<stringValue id="19">filesystem/local</stringValue>
<type>REFERENCE</type>
</item>
<item id="20" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="21">list</name>
<stringValue id="22">FileList</stringValue>
<type>VARIABLE</type>
</item>
<item id="23" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="24">pattern</name>
<stringValue id="25">Pattern</stringValue>
<type>VARIABLE</type>
</item>
<item id="26" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="27">uris</name>
<stringValue id="28">URIList</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="29" type="java.util.HashSet">
<item id="30" type="com.j2fe.workflow.definition.Transition">
<name id="31">true</name>
<source id="32">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="33"/>
<directJoin>false</directJoin>
<name id="34">Unzip Zip Input Files</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="35">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="36" type="java.util.HashSet">
<item id="37" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="38">statements</name>
<objectValue id="39" type="java.lang.String">import java.io.File;&#13;
import java.io.FileNotFoundException;&#13;
import java.io.IOException;&#13;
import org.apache.commons.io.FilenameUtils;&#13;
import org.apache.commons.lang.StringUtils;&#13;
import org.apache.log4j.Logger;&#13;
import com.j2fe.feeds.activities.RatingVariables;&#13;
&#13;
Logger logger = Logger.getLogger(String.class);&#13;
File inputDir = new File(zipInputDirectory);&#13;
try {&#13;
	if(inputDir.exists()){&#13;
       File[] zipFiles = inputDir.listFiles();         &#13;
       	for (int i = 0; i &lt; zipFiles.length; i++) {&#13;
			File zipFile = zipFiles[i];&#13;
              	String fileNameExtension = FilenameUtils.getExtension(zipFile.getName());&#13;
              	 if(fileNameExtension.equalsIgnoreCase("zip")){&#13;
              	    RatingVariables.unzip(zipFile.getPath(), destinationDirectory, null, appendTimeStamp);&#13;
              	  }&#13;
         	}&#13;
         } else {&#13;
                throw new FileNotFoundException("File not Found " + inputDir.getPath()+ File.separator +inputDir.getName());&#13;
         }&#13;
	   return true;&#13;
}&#13;
catch (FileNotFoundException e) {&#13;
	logger.error("Input Directory does not exist: " + inputDir.getPath()+ File.separator +inputDir.getName() + "Message: " + e.getMessage());&#13;
	return false;&#13;
}&#13;
	catch (IOException e) {&#13;
	logger.error("IO Exception occured: " + e.getMessage());&#13;
	return false;&#13;
}</objectValue>
<type>CONSTANT</type>
</item>
<item id="40" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="41">["appendTimeStamp"]@java/lang/Boolean@</UITypeHint>
<input>true</input>
<name id="42">variables["appendTimeStamp"]</name>
<objectValue id="43" type="java.lang.Boolean">false</objectValue>
<type>CONSTANT</type>
</item>
<item id="44" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="45">["destinationDirectory"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="46">variables["destinationDirectory"]</name>
<stringValue id="47">InputDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="48" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="49">["zipInputDirectory"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="50">variables["zipInputDirectory"]</name>
<stringValue id="51">ZipInputDirectory</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="52" type="java.util.HashSet">
<item id="53" type="com.j2fe.workflow.definition.Transition">
<name id="54">goto-next</name>
<source id="55">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="56"/>
<directJoin>false</directJoin>
<name id="57">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="58">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="59" type="java.util.HashSet"/>
<targets id="60" type="java.util.HashSet">
<item idref="53" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="32"/>
</item>
</sources>
<targets id="61" type="java.util.HashSet">
<item id="62" type="com.j2fe.workflow.definition.Transition">
<name id="63">false</name>
<source idref="32"/>
<target idref="2"/>
</item>
<item idref="30" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="9"/>
</item>
</sources>
<targets id="64" type="java.util.HashSet">
<item idref="7" type="com.j2fe.workflow.definition.Transition"/>
<item id="65" type="com.j2fe.workflow.definition.Transition">
<name id="66">not-empty</name>
<source idref="9"/>
<target id="67">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="68"/>
<directJoin>true</directJoin>
<name id="69">For Each Split</name>
<nodeHandler>com.j2fe.workflow.handler.impl.GenericSplit</nodeHandler>
<nodeHandlerClass id="70">com.j2fe.workflow.handler.impl.GenericSplit</nodeHandlerClass>
<parameters id="71" type="java.util.HashSet">
<item id="72" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="73">input</name>
<stringValue id="74">URIList</stringValue>
<type>VARIABLE</type>
</item>
<item id="75" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="76">output</name>
<stringValue id="77">Output</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="78" type="java.util.HashSet">
<item idref="65" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="79" type="java.util.HashSet">
<item id="80" type="com.j2fe.workflow.definition.Transition">
<name id="81">goto-next</name>
<source idref="67"/>
<target id="82">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="83"/>
<directJoin>false</directJoin>
<name id="84">MOODYS Bulk Split</name>
<nodeHandler>com.j2fe.feeds.activities.BulkSplitMoodysFile</nodeHandler>
<nodeHandlerClass id="85">com.j2fe.feeds.activities.BulkSplitMoodysFile</nodeHandlerClass>
<parameters id="86" type="java.util.HashSet">
<item id="87" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="88">bulkSize</name>
<stringValue id="89">BulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="90" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="91">directory</name>
<stringValue id="92">OutputDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="93" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="94">file</name>
<stringValue id="95">Output</stringValue>
<type>VARIABLE</type>
</item>
<item id="96" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="97">isInstrumentFile</name>
<stringValue id="98">IsInstrumentFile</stringValue>
<type>VARIABLE</type>
</item>
<item id="99" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="100">uriList</name>
<stringValue id="101">SplitFilesURIList</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="102" type="java.util.HashSet">
<item idref="80" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="103" type="java.util.HashSet">
<item id="104" type="com.j2fe.workflow.definition.Transition">
<name id="105">error</name>
<source idref="82"/>
<target id="106">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="107"/>
<directJoin>true</directJoin>
<name id="108">Synchronize</name>
<nodeHandler>com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandler>
<nodeHandlerClass id="109">com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandlerClass>
<sources id="110" type="java.util.HashSet">
<item idref="104" type="com.j2fe.workflow.definition.Transition"/>
<item id="111" type="com.j2fe.workflow.definition.Transition">
<name id="112">goto-next</name>
<source id="113">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="114"/>
<directJoin>false</directJoin>
<name id="115">NOP</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="116">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="117" type="java.util.HashSet">
<item id="118" type="com.j2fe.workflow.definition.Transition">
<name id="119">success</name>
<source idref="82"/>
<target idref="113"/>
</item>
</sources>
<targets id="120" type="java.util.HashSet">
<item idref="111" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="106"/>
</item>
</sources>
<targets id="121" type="java.util.HashSet">
<item id="122" type="com.j2fe.workflow.definition.Transition">
<name id="123">goto-next</name>
<source idref="106"/>
<target id="124">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="125"/>
<directJoin>false</directJoin>
<name id="126">Call Process Files In Directory</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="127">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="128" type="java.util.HashSet">
<item id="129" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="130">["BusinessFeed"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="131">input["BusinessFeed"]</name>
<stringValue id="132">BusinessFeed</stringValue>
<type>VARIABLE</type>
</item>
<item id="133" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="134">["Directory"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="135">input["Directory"]</name>
<stringValue id="136">OutputDirectory</stringValue>
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
<UITypeHint id="142">["FilePatterns"]@[Ljava/lang/String;@[0]</UITypeHint>
<input>true</input>
<name id="143">input["FilePatterns"][0]</name>
<stringValue id="144">*.split</stringValue>
<type>CONSTANT</type>
</item>
<item id="145" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="146">["IncludeFilePatternNBusinessFeed"]@java/lang/Boolean@</UITypeHint>
<input>true</input>
<name id="147">input["IncludeFilePatternNBusinessFeed"]</name>
<objectValue id="148" type="java.lang.Boolean">true</objectValue>
<type>CONSTANT</type>
</item>
<item id="149" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="150">["LastRunInterval"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="151">input["LastRunInterval"]</name>
<stringValue id="152">24</stringValue>
<type>CONSTANT</type>
</item>
<item id="153" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="154">["MessageBulkSize"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="155">input["MessageBulkSize"]</name>
<stringValue id="156">MessageBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="157" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="158">["MessageProcessingEvent"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="159">input["MessageProcessingEvent"]</name>
<stringValue id="160">ProcessFeedMessage</stringValue>
<type>CONSTANT</type>
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
<stringValue id="168">NoOfParallelFiles</stringValue>
<type>VARIABLE</type>
</item>
<item id="169" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="170">["OutputDirectory"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="171">input["OutputDirectory"]</name>
<stringValue id="172">MoveOutputDirectory</stringValue>
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
<UITypeHint id="178">["ReProcessProcessedFiles"]@java/lang/Boolean@</UITypeHint>
<input>true</input>
<name id="179">input["ReProcessProcessedFiles"]</name>
<objectValue id="180" type="java.lang.Boolean">false</objectValue>
<type>CONSTANT</type>
</item>
<item id="181" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="182">["Recursive"]@java/lang/Boolean@</UITypeHint>
<input>true</input>
<name id="183">input["Recursive"]</name>
<objectValue id="184" type="java.lang.Boolean">false</objectValue>
<type>CONSTANT</type>
</item>
<item id="185" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="186">["SortAscending"]@java/lang/Boolean@</UITypeHint>
<input>true</input>
<name id="187">input["SortAscending"]</name>
<objectValue id="188" type="java.lang.Boolean">true</objectValue>
<type>CONSTANT</type>
</item>
<item id="189" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="190">["SortedFileDirectory"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="191">input["SortedFileDirectory"]</name>
<stringValue id="192">OutputDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="193" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="194">["SuccessAction"]@com/j2fe/feeds/SuccessAction@</UITypeHint>
<input>true</input>
<name id="195">input["SuccessAction"]</name>
<stringValue id="196">SuccessAction</stringValue>
<type>VARIABLE</type>
</item>
<item id="197" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="198">["VendorDefinition"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="199">input["VendorDefinition"]</name>
<stringValue id="200">VendorDefinition</stringValue>
<type>VARIABLE</type>
</item>
<item id="201" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="202">name</name>
<stringValue id="203">Process Files in Directory</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="204" type="java.util.HashSet">
<item idref="122" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="205" type="java.util.HashSet">
<item id="206" type="com.j2fe.workflow.definition.Transition">
<name id="207">goto-next</name>
<source idref="124"/>
<target idref="2"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
</targets>
<type>ANDJOIN</type>
</target>
</item>
<item idref="118" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</target>
</item>
</targets>
<type>ANDSPLIT</type>
</target>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="2"/>
</item>
<item idref="62" type="com.j2fe.workflow.definition.Transition"/>
<item idref="206" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="208" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="209">Batch Connections/Ratings</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="210">user1</lastChangeUser>
<lastUpdate id="211">2025-05-29T08:20:53.000+0100</lastUpdate>
<name id="212">RATINGS_MOODYS</name>
<nodes id="213" type="java.util.HashSet">
<item idref="124" type="com.j2fe.workflow.definition.Node"/>
<item idref="67" type="com.j2fe.workflow.definition.Node"/>
<item idref="9" type="com.j2fe.workflow.definition.Node"/>
<item idref="82" type="com.j2fe.workflow.definition.Node"/>
<item idref="113" type="com.j2fe.workflow.definition.Node"/>
<item idref="55" type="com.j2fe.workflow.definition.Node"/>
<item idref="2" type="com.j2fe.workflow.definition.Node"/>
<item idref="106" type="com.j2fe.workflow.definition.Node"/>
<item idref="32" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>true</optimize>
<parameter id="214" type="java.util.HashMap">
<entry>
<key id="215" type="java.lang.String">BulkSize</key>
<value id="216" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="217">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="218">The number of lines in which the input file will be split.</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="219" type="java.lang.String">BusinessFeed</key>
<value id="220" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="221">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="222">The Business Feed to be used for the file processing. Only files which belong to the feed will be picked up from the directory!&#13;
Either Business Feed or the Vendor Definition must be provided.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="223" type="java.lang.String">FileLoadEvent</key>
<value id="224" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="225">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="226" type="java.lang.String">InputDirectory</key>
<value id="227" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="228">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="229">The directory it uses to store unzipped files</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="230" type="java.lang.String">IsInstrumentFile</key>
<value id="231" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="232">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<description id="233">Whether to consider input file as an instrument file or an organisation file.</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="234" type="java.lang.String">MessageBulkSize</key>
<value id="235" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="236">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="237">The number of messages which sould be processed in parallel.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="238" type="java.lang.String">MessageType</key>
<value id="239" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="240">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="241">Sets the Message Type to be used for processing a list of files. Processing of the files will be done in sequence (Grouping on file level will not be taken into consideration).</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="242" type="java.lang.String">MoveOutputDirectory</key>
<value id="243" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="244">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="245">Only if SuccessAction is Move processed files will be moved to this directory</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="246" type="java.lang.String">NoOfParallelFiles</key>
<value id="247" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="248">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="249">The number of files that are processed in parallel, as long as they belong to the same group (see File Definitions at Business Feed).</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="250" type="java.lang.String">OutputDirectory</key>
<value id="251" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="252">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="253">The output directory for generated files.</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="254" type="java.lang.String">ParallelBranches</key>
<value id="255" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="256">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="257">The number of files that are processed in parallel, as long as they belong to the same group (see File Definitions at Business Feed).</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="258" type="java.lang.String">Pattern</key>
<value id="259" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="260">[Ljava.lang.String;</className>
<clazz>[Ljava.lang.String;</clazz>
<description id="261">In addition to the file patterns defined at Business Feed level, more restrictive File Patterns can be specified.&#13;
NOTE: If there is no file pattern specified at Business Feed level, the default will be all files ('*').</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="262" type="java.lang.String">SuccessAction</key>
<value id="263" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="264">com.j2fe.feeds.SuccessAction</className>
<clazz>com.j2fe.feeds.SuccessAction</clazz>
<description id="265">What should be done with the split files. MOVE or LEAVE(No Action) or DELETE.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="266" type="java.lang.String">VendorDefinition</key>
<value id="267" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="268">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="269">The vendor definition is used to find the message types and business feeds of the files in the directory. Only files which belong to the different Business Feeds will be processed.&#13;
Either the vendor or the business feed has to be provided to the WF.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="270" type="java.lang.String">ZipInputDirectory</key>
<value id="271" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="272">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="273">The directory it searches for .zip files for processing</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
</parameter>
<permissions id="274" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>true</purgeAtEnd>
<retries>0</retries>
<startNode idref="55"/>
<status>RELEASED</status>
<variables id="275" type="java.util.HashMap">
<entry>
<key id="276" type="java.lang.String">BulkSize</key>
<value id="277" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="278">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="279">The number of lines in which the input file will be split.</description>
<persistent>false</persistent>
<value id="280" type="java.lang.Integer">25000</value>
</value>
</entry>
<entry>
<key id="281" type="java.lang.String">BusinessFeed</key>
<value id="282" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="283">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="284">The Business Feed to be used for the file processing. Only files which belong to the feed will be picked up from the directory!&#13;
Either Business Feed or the Vendor Definition must be provided.</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="285" type="java.lang.String">Counter</key>
<value id="286" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="287">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="288">Integer value used internally for looping</description>
<persistent>false</persistent>
<value id="289" type="java.lang.Integer">0</value>
</value>
</entry>
<entry>
<key id="290" type="java.lang.String">FileLoadEvent</key>
<value id="291" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="292">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="293" type="java.lang.String">StandardFileLoad</value>
</value>
</entry>
<entry>
<key id="294" type="java.lang.String">InputDirectory</key>
<value id="295" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="296">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="297">The directory it uses to store unzipped files</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="298" type="java.lang.String">IsInstrumentFile</key>
<value id="299" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="300">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<description id="301">Whether to consider input file as an instrument file or an organisation file.</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="302" type="java.lang.String">MessageBulkSize</key>
<value id="303" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="304">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="305">The number of messages which sould be processed in parallel.</description>
<persistent>false</persistent>
<value id="306" type="java.lang.Integer">500</value>
</value>
</entry>
<entry>
<key id="307" type="java.lang.String">MessageType</key>
<value id="308" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="309">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="310">Sets the Message Type to be used for processing a list of files. Processing of the files will be done in sequence (Grouping on file level will not be taken into consideration).</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="311" type="java.lang.String">MoveOutputDirectory</key>
<value id="312" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="313">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="314">Only if SuccessAction is Move processed files will be moved to this directory</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="315" type="java.lang.String">NoOfParallelFiles</key>
<value id="316" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="317">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="318">The number of files that are processed in parallel, as long as they belong to the same group (see File Definitions at Business Feed).</description>
<persistent>false</persistent>
<value id="319" type="java.lang.String">2</value>
</value>
</entry>
<entry>
<key id="320" type="java.lang.String">OutputDirectory</key>
<value id="321" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="322">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="323">The output directory for generated files.</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="324" type="java.lang.String">ParallelBranches</key>
<value id="325" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="326">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="327">The number of files that are processed in parallel, as long as they belong to the same group (see File Definitions at Business Feed).</description>
<persistent>false</persistent>
<value id="328" type="java.lang.Integer">2</value>
</value>
</entry>
<entry>
<key id="329" type="java.lang.String">Pattern</key>
<value id="330" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="331">[Ljava.lang.String;</className>
<clazz>[Ljava.lang.String;</clazz>
<description id="332">In addition to the file patterns defined at Business Feed level, more restrictive File Patterns can be specified.&#13;
NOTE: If there is no file pattern specified at Business Feed level, the default will be all files ('*').</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="333" type="java.lang.String">SuccessAction</key>
<value id="334" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="335">com.j2fe.feeds.SuccessAction</className>
<clazz>com.j2fe.feeds.SuccessAction</clazz>
<description id="336">What should be done with the split files. MOVE or LEAVE(No Action) or DELETE.</description>
<persistent>false</persistent>
<value id="337" type="java.lang.String">DELETE</value>
</value>
</entry>
<entry>
<key id="338" type="java.lang.String">VendorDefinition</key>
<value id="339" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="340">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="341">The vendor definition is used to find the message types and business feeds of the files in the directory. Only files which belong to the different Business Feeds will be processed.&#13;
Either the vendor or the business feed has to be provided to the WF.</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="342" type="java.lang.String">ZipInputDirectory</key>
<value id="343" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="344">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="345">The directory it searches for .zip files for processing</description>
<persistent>false</persistent>
</value>
</entry>
</variables>
<version>5</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
