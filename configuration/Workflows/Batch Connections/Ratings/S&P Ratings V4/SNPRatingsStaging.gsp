<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.09">
<package-comment/>
<businessobject displayString="3 - parentjobid" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>false</alwaysPersist>
<clustered>true</clustered>
<comment id="1">parentjobid</comment>
<endNode id="2">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="3">Stop</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="4">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="5" type="java.util.HashSet">
<item id="6" type="com.j2fe.workflow.definition.Transition">
<name id="7">error</name>
<source id="8">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="9">STP Task Executor</name>
<nodeHandler>com.j2fe.feeds.activities.STPTaskExecutor</nodeHandler>
<nodeHandlerClass id="10">com.j2fe.feeds.activities.STPTaskExecutor</nodeHandlerClass>
<parameters id="11" type="java.util.HashSet">
<item id="12" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="13">action</name>
<stringValue id="14">LOAD</stringValue>
<type>CONSTANT</type>
</item>
<item id="15" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="16">metaData</name>
<stringValue id="17">Metadata</stringValue>
<type>VARIABLE</type>
</item>
<item id="18" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="19">metaData</name>
<stringValue id="20">Metadata</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="21" type="java.util.HashSet">
<item id="22" type="com.j2fe.workflow.definition.Transition">
<name id="23">success</name>
<source id="24">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="25">STP Task Executor</name>
<nodeHandler>com.j2fe.feeds.activities.STPTaskExecutor</nodeHandler>
<nodeHandlerClass id="26">com.j2fe.feeds.activities.STPTaskExecutor</nodeHandlerClass>
<parameters id="27" type="java.util.HashSet">
<item id="28" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="29">action</name>
<stringValue id="30">PREPARE</stringValue>
<type>CONSTANT</type>
</item>
<item id="31" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="32">exception</name>
<stringValue id="33">Exception</stringValue>
<type>VARIABLE</type>
</item>
<item id="34" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="35">metaData</name>
<stringValue id="36">Metadata</stringValue>
<type>VARIABLE</type>
</item>
<item id="37" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="38">metaData</name>
<stringValue id="39">Metadata</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="40" type="java.util.HashSet">
<item id="41" type="com.j2fe.workflow.definition.Transition">
<name id="42">goto-next</name>
<source id="43">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="44">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="45">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="46" type="java.util.HashSet"/>
<targets id="47" type="java.util.HashSet">
<item idref="41" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="24"/>
</item>
</sources>
<targets id="48" type="java.util.HashSet">
<item id="49" type="com.j2fe.workflow.definition.Transition">
<name id="50">error</name>
<source idref="24"/>
<target idref="2"/>
</item>
<item idref="22" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="8"/>
</item>
</sources>
<targets id="51" type="java.util.HashSet">
<item idref="6" type="com.j2fe.workflow.definition.Transition"/>
<item id="52" type="com.j2fe.workflow.definition.Transition">
<name id="53">success</name>
<source idref="8"/>
<target id="54">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="55">Bean Shell Script (Xor Split)</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="56">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="57" type="java.util.HashSet">
<item id="58" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="59">statements</name>
<objectValue id="60" type="java.lang.String">import com.j2fe.feeds.SuccessAction;&#13;
import com.j2fe.feeds.stp.STPFeedParameters;&#13;
&#13;
int sbulk = (int)meta.get(STPFeedParameters.STAGING_BULK_SIZE);&#13;
int sparallel = (int)meta.get(STPFeedParameters.STAGING_FILES_IN_PARALLEL);&#13;
int parallel = (int)meta.get(STPFeedParameters.PARALLEL_BRANCHES);&#13;
boolean mvi = (boolean)meta.get(STPFeedParameters.MOVE_INPUT_FILES);&#13;
boolean mvs = (boolean)meta.get(STPFeedParameters.MOVE_STAGING_FILES);&#13;
String inmdir = (String)meta.get(STPFeedParameters.INPUT_MOVE_DIRECTORY);&#13;
String smdir = (String)meta.get(STPFeedParameters.STAGING_MOVE_DIRECTORY);&#13;
String sbf = (String)meta.get(STPFeedParameters.BUSINESS_FEED_SECURITY_STAGING);&#13;
String ebf = (String)meta.get(STPFeedParameters.BUSINESS_FEED_ENTITY_STAGING);&#13;
String stageout=(String)meta.get(STPFeedParameters.STAGE_DIRECTORY);&#13;
String zip=(String)meta.get(STPFeedParameters.INPUT_DIRECTORY);&#13;
SuccessAction suc=SuccessAction.LEAVE;&#13;
boolean reprocess = (boolean)meta.get(STPFeedParameters.REPROCESSPROCESSEDFILE);&#13;
&#13;
&#13;
if(mvi&amp;&amp;mvs)&#13;
{&#13;
suc=SuccessAction.MOVE;&#13;
return "move";&#13;
}&#13;
else return "leave";</objectValue>
<type>CONSTANT</type>
</item>
<item id="61" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="62">["ebf"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="63">variables["ebf"]</name>
<stringValue id="64">EntityBusinessFeed</stringValue>
<type>VARIABLE</type>
</item>
<item id="65" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="66">["inmdir"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="67">variables["inmdir"]</name>
<stringValue id="68">InputMoveDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="69" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="70">variables["meta"]</name>
<stringValue id="71">Metadata</stringValue>
<type>VARIABLE</type>
</item>
<item id="72" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="73">["mvi"]@java/lang/Boolean@</UITypeHint>
<input>false</input>
<name id="74">variables["mvi"]</name>
<stringValue id="75">MoveInputFiles</stringValue>
<type>VARIABLE</type>
</item>
<item id="76" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="77">["mvs"]@java/lang/Boolean@</UITypeHint>
<input>false</input>
<name id="78">variables["mvs"]</name>
<stringValue id="79">MoveStagingFiles</stringValue>
<type>VARIABLE</type>
</item>
<item id="80" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="81">["parallel"]@java/lang/Integer@</UITypeHint>
<input>false</input>
<name id="82">variables["parallel"]</name>
<stringValue id="83">parallel</stringValue>
<type>VARIABLE</type>
</item>
<item id="84" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="85">variables["reprocess"]</name>
<stringValue id="86">ReprocessProcessedFiles</stringValue>
<type>VARIABLE</type>
</item>
<item id="87" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="88">["sbf"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="89">variables["sbf"]</name>
<stringValue id="90">SecurityBusinessFeed</stringValue>
<type>VARIABLE</type>
</item>
<item id="91" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="92">["sbulk"]@java/lang/Integer@</UITypeHint>
<input>false</input>
<name id="93">variables["sbulk"]</name>
<stringValue id="94">BulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="95" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="96">["smdir"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="97">variables["smdir"]</name>
<stringValue id="98">StagingMoveDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="99" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="100">["sparallel"]@java/lang/Integer@</UITypeHint>
<input>false</input>
<name id="101">variables["sparallel"]</name>
<stringValue id="102">FilesInParallel</stringValue>
<type>VARIABLE</type>
</item>
<item id="103" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="104">["stageout"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="105">variables["stageout"]</name>
<stringValue id="106">StageOutputDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="107" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="108">["suc"]@com/j2fe/feeds/SuccessAction@</UITypeHint>
<input>false</input>
<name id="109">variables["suc"]</name>
<stringValue id="110">SuccessAction</stringValue>
<type>VARIABLE</type>
</item>
<item id="111" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="112">["zip"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="113">variables["zip"]</name>
<stringValue id="114">ZipInputDirectory</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="115" type="java.util.HashSet">
<item idref="52" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="116" type="java.util.HashSet">
<item id="117" type="com.j2fe.workflow.definition.Transition">
<name id="118">leave</name>
<source idref="54"/>
<target id="119">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="120">Automatically generated</description>
<directJoin>false</directJoin>
<name id="121">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="122">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="123" type="java.util.HashSet">
<item id="124" type="com.j2fe.workflow.definition.Transition">
<name id="125">goto-next</name>
<source id="126">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="127">Move Zip Files</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="128">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="129" type="java.util.HashSet">
<item id="130" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="131">["FilePatterns"]@[Ljava/lang/String;@[0]</UITypeHint>
<input>true</input>
<name id="132">input["FilePatterns"][0]</name>
<objectValue id="133" type="java.lang.String">*.zip</objectValue>
<type>CONSTANT</type>
</item>
<item id="134" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="135">["SourceDirectories"]@[Ljava/lang/String;@[0]</UITypeHint>
<input>true</input>
<name id="136">input["SourceDirectories"][0]</name>
<stringValue id="137">ZipInputDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="138" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="139">["SuccessAction"]@com/j2fe/feeds/SuccessAction@</UITypeHint>
<input>true</input>
<name id="140">input["SuccessAction"]</name>
<objectValue id="141" type="com.j2fe.feeds.SuccessAction">MOVE</objectValue>
<type>CONSTANT</type>
</item>
<item id="142" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="143">["TargetDirectory"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="144">input["TargetDirectory"]</name>
<stringValue id="145">InputMoveDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="146" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="147">name</name>
<stringValue id="148">SNPRatingsMoveFiles</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="149" type="java.util.HashSet">
<item id="150" type="com.j2fe.workflow.definition.Transition">
<name id="151">move</name>
<source idref="54"/>
<target idref="126"/>
</item>
</sources>
<targets id="152" type="java.util.HashSet">
<item idref="124" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="119"/>
</item>
<item idref="117" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="153" type="java.util.HashSet">
<item id="154" type="com.j2fe.workflow.definition.Transition">
<name id="155">ToSplit</name>
<source idref="119"/>
<target id="156">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="157">Load Staging Files</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="158">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="159" type="java.util.HashSet">
<item id="160" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="161">["BulkSize"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="162">input["BulkSize"]</name>
<stringValue id="163">BulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="164" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="165">["EntityBusinessFeed"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="166">input["EntityBusinessFeed"]</name>
<stringValue id="167">EntityBusinessFeed</stringValue>
<type>VARIABLE</type>
</item>
<item id="168" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="169">["FilesInParallel"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="170">input["FilesInParallel"]</name>
<stringValue id="171">FilesInParallel</stringValue>
<type>VARIABLE</type>
</item>
<item id="172" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="173">["InputDirectory"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="174">input["InputDirectory"]</name>
<stringValue id="175">StageOutputDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="176" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="177">["OutputDirectory"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="178">input["OutputDirectory"]</name>
<stringValue id="179">StagingMoveDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="180" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="181">["ParallelBranches"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="182">input["ParallelBranches"]</name>
<stringValue id="183">ParallelBranches</stringValue>
<type>VARIABLE</type>
</item>
<item id="184" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="185">["ParentJobId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="186">input["ParentJobId"]</name>
<stringValue id="187">ParentJobId</stringValue>
<type>VARIABLE</type>
</item>
<item id="188" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="189">["RatingsType"]@com/j2fe/connector/RatingsType@</UITypeHint>
<input>true</input>
<name id="190">input["RatingsType"]</name>
<stringValue id="191">RatingsType</stringValue>
<type>VARIABLE</type>
</item>
<item id="192" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="193">["Reprocessprocessedfiles"]@java/lang/Boolean@</UITypeHint>
<input>true</input>
<name id="194">input["Reprocessprocessedfiles"]</name>
<stringValue id="195">ReprocessProcessedFiles</stringValue>
<type>VARIABLE</type>
</item>
<item id="196" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="197">["SecurityBusinessFeed"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="198">input["SecurityBusinessFeed"]</name>
<stringValue id="199">SecurityBusinessFeed</stringValue>
<type>VARIABLE</type>
</item>
<item id="200" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="201">["SuccessAction"]@com/j2fe/feeds/SuccessAction@</UITypeHint>
<input>true</input>
<name id="202">input["SuccessAction"]</name>
<stringValue id="203">SuccessAction</stringValue>
<type>VARIABLE</type>
</item>
<item id="204" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="205">name</name>
<stringValue id="206">SnPRatingsStageLoad</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="207" type="java.util.HashSet">
<item idref="154" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="208" type="java.util.HashSet">
<item id="209" type="com.j2fe.workflow.definition.Transition">
<name id="210">goto-next</name>
<source idref="156"/>
<target id="211">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="212">NOP</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="213">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="214" type="java.util.HashSet">
<item idref="209" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="215" type="java.util.HashSet">
<item id="216" type="com.j2fe.workflow.definition.Transition">
<name id="217">goto-next</name>
<source idref="211"/>
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
<item idref="150" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</target>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="2"/>
</item>
<item idref="49" type="com.j2fe.workflow.definition.Transition"/>
<item idref="216" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="218" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="219">Batch Connections/Ratings/S&amp;P Ratings V4</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="220">user1</lastChangeUser>
<lastUpdate id="221">2025-09-11T11:05:04.000+0100</lastUpdate>
<name id="222">SNPRatingsStaging</name>
<nodes id="223" type="java.util.HashSet">
<item idref="54" type="com.j2fe.workflow.definition.Node"/>
<item idref="156" type="com.j2fe.workflow.definition.Node"/>
<item idref="119" type="com.j2fe.workflow.definition.Node"/>
<item idref="126" type="com.j2fe.workflow.definition.Node"/>
<item idref="211" type="com.j2fe.workflow.definition.Node"/>
<item idref="24" type="com.j2fe.workflow.definition.Node"/>
<item idref="8" type="com.j2fe.workflow.definition.Node"/>
<item idref="43" type="com.j2fe.workflow.definition.Node"/>
<item idref="2" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>true</optimize>
<parameter id="224" type="java.util.HashMap">
<entry>
<key id="225" type="java.lang.String">EntityBusinessFeed</key>
<value id="226" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="227">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="228" type="java.lang.String">Exception</key>
<value id="229" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="230">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>false</input>
<output>true</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="231" type="java.lang.String">Metadata</key>
<value id="232" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="233">java.lang.Object</className>
<clazz>java.lang.Object</clazz>
<input>true</input>
<output>true</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="234" type="java.lang.String">MoveInputFiles</key>
<value id="235" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="236">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="237" type="java.lang.String">MoveStagingFiles</key>
<value id="238" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="239">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="240" type="java.lang.String">ParentJobId</key>
<value id="241" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="242">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="243"/>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="244" type="java.lang.String">RatingsType</key>
<value id="245" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="246">com.j2fe.connector.RatingsType</className>
<clazz>com.j2fe.connector.RatingsType</clazz>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="247" type="java.lang.String">SecurityBusinessFeed</key>
<value id="248" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="249">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
</parameter>
<permissions id="250" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>true</purgeAtEnd>
<retries>0</retries>
<startNode idref="43"/>
<status>RELEASED</status>
<variables id="251" type="java.util.HashMap">
<entry>
<key id="252" type="java.lang.String">BulkSize</key>
<value id="253" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="254">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="255" type="java.lang.String">EntityBusinessFeed</key>
<value id="256" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="257">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="258" type="java.lang.String">Exception</key>
<value id="259" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="260">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="261" type="java.lang.String">FilesInParallel</key>
<value id="262" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="263">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="264" type="java.lang.String">InputMoveDirectory</key>
<value id="265" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="266">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="267" type="java.lang.String">Metadata</key>
<value id="268" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="269">java.lang.Object</className>
<clazz>java.lang.Object</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="270" type="java.lang.String">MoveInputFiles</key>
<value id="271" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="272">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="273" type="java.lang.String">MoveStagingFiles</key>
<value id="274" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="275">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="276" type="java.lang.String">ParallelBranches</key>
<value id="277" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="278">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<persistent>false</persistent>
<value id="279" type="java.lang.Integer">2</value>
</value>
</entry>
<entry>
<key id="280" type="java.lang.String">ParentJobId</key>
<value id="281" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="282">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="283"/>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="284" type="java.lang.String">RatingsType</key>
<value id="285" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="286">com.j2fe.connector.RatingsType</className>
<clazz>com.j2fe.connector.RatingsType</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="287" type="java.lang.String">ReprocessProcessedFiles</key>
<value id="288" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="289">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<persistent>false</persistent>
<value id="290" type="java.lang.Boolean">false</value>
</value>
</entry>
<entry>
<key id="291" type="java.lang.String">SecurityBusinessFeed</key>
<value id="292" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="293">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="294" type="java.lang.String">StageOutputDirectory</key>
<value id="295" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="296">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="297" type="java.lang.String">StagingMoveDirectory</key>
<value id="298" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="299">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="300" type="java.lang.String">SuccessAction</key>
<value id="301" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="302">com.j2fe.feeds.SuccessAction</className>
<clazz>com.j2fe.feeds.SuccessAction</clazz>
<persistent>false</persistent>
</value>
</entry>
</variables>
<version>3</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
