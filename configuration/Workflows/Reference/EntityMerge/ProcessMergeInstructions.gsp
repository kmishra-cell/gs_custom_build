<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.12">
<package-comment/>
<businessobject displayString="6 - 8.8.1.07 + CNST Data Correction" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>false</alwaysPersist>
<clustered>false</clustered>
<comment id="1">8.8.1.07 + CNST Data Correction</comment>
<description id="2"/>
<endNode id="3">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="4"/>
<directJoin>false</directJoin>
<name id="5">Stop</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="6">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="7" type="java.util.HashSet">
<item id="8" type="com.j2fe.workflow.definition.Transition">
<name id="9">goto-next</name>
<source id="10">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="11"/>
<directJoin>false</directJoin>
<name id="12">Close Job</name>
<nodeHandler>com.j2fe.streetlamp.activities.CloseJob</nodeHandler>
<nodeHandlerClass id="13">com.j2fe.streetlamp.activities.CloseJob</nodeHandlerClass>
<parameters id="14" type="java.util.HashSet">
<item id="15" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="16">jobId</name>
<stringValue id="17">JobID</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="18" type="java.util.HashSet">
<item id="19" type="com.j2fe.workflow.definition.Transition">
<name id="20">goto-next</name>
<source id="21">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="22"/>
<directJoin>false</directJoin>
<name id="23">Consolidate Job</name>
<nodeHandler>com.j2fe.streetlamp.activities.ConsolidateJob</nodeHandler>
<nodeHandlerClass id="24">com.j2fe.streetlamp.activities.ConsolidateJob</nodeHandlerClass>
<parameters id="25" type="java.util.HashSet">
<item id="26" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="27">jobId</name>
<stringValue id="28">JobID</stringValue>
<type>VARIABLE</type>
</item>
<item id="29" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="30">updateTotalCount</name>
<stringValue id="31">true</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="32" type="java.util.HashSet">
<item id="33" type="com.j2fe.workflow.definition.Transition">
<name id="34">goto-next</name>
<source id="35">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="36"/>
<directJoin>false</directJoin>
<name id="37">Clear TableInfo Cache</name>
<nodeHandler>com.thegoldensource.reference.activity.ClearTableInfoCache</nodeHandler>
<nodeHandlerClass id="38">com.thegoldensource.reference.activity.ClearTableInfoCache</nodeHandlerClass>
<sources id="39" type="java.util.HashSet">
<item id="40" type="com.j2fe.workflow.definition.Transition">
<name id="41">end-loop</name>
<source id="42">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="43"/>
<directJoin>false</directJoin>
<name id="44">For Loop</name>
<nodeHandler>com.j2fe.workflow.handler.impl.ForEach</nodeHandler>
<nodeHandlerClass id="45">com.j2fe.workflow.handler.impl.ForEach</nodeHandlerClass>
<parameters id="46" type="java.util.HashSet">
<item id="47" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="48">counter</name>
<stringValue id="49">Counter</stringValue>
<type>VARIABLE</type>
</item>
<item id="50" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="51">counter</name>
<stringValue id="52">Counter</stringValue>
<type>VARIABLE</type>
<variablePart id="53"/>
</item>
<item id="54" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="55">input</name>
<stringValue id="56">CNSTOidlist</stringValue>
<type>VARIABLE</type>
</item>
<item id="57" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="58">output</name>
<stringValue id="59">Output</stringValue>
<type>VARIABLE</type>
</item>
<item id="60" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="61">resetOnEnd</name>
<stringValue id="62">true</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="63" type="java.util.HashSet">
<item id="64" type="com.j2fe.workflow.definition.Transition">
<name id="65">goto-next</name>
<source id="66">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="67"/>
<directJoin>false</directJoin>
<name id="68">NOP #2</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="69">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="70" type="java.util.HashSet">
<item id="71" type="com.j2fe.workflow.definition.Transition">
<name id="72">goto-next</name>
<source id="73">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="74"/>
<directJoin>false</directJoin>
<name id="75">Initialize Counter</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="76">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="77" type="java.util.HashSet">
<item id="78" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="79">statements</name>
<stringValue id="80">int i=0;</stringValue>
<type>CONSTANT</type>
</item>
<item id="81" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="82">["i"]@java/lang/Integer@</UITypeHint>
<input>false</input>
<name id="83">variables["i"]</name>
<stringValue id="84">Counter</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="85" type="java.util.HashSet">
<item id="86" type="com.j2fe.workflow.definition.Transition">
<name id="87">CNST-Found</name>
<source id="88">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="89"/>
<directJoin>false</directJoin>
<name id="90">Extract Merge Instructions</name>
<nodeHandler>com.thegoldensource.reference.activity.MergeInstructionSelectorActivity</nodeHandler>
<nodeHandlerClass id="91">com.thegoldensource.reference.activity.MergeInstructionSelectorActivity</nodeHandlerClass>
<parameters id="92" type="java.util.HashSet">
<item id="93" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="94">cnstListOid</name>
<stringValue id="95">CNSTOidlist</stringValue>
<type>VARIABLE</type>
</item>
<item id="96" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="97">cnstOid</name>
<stringValue id="98">cnstOid</stringValue>
<type>VARIABLE</type>
</item>
<item id="99" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="100">database</name>
<stringValue id="101">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="102" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="103">entityType</name>
<stringValue id="104">entityType</stringValue>
<type>VARIABLE</type>
</item>
<item id="105" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="106">jblgJobId</name>
<stringValue id="107">JobID</stringValue>
<type>VARIABLE</type>
</item>
<item id="108" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="109">multipleMergeInstruction</name>
<stringValue id="110">multipleMergeInstructions</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="111" type="java.util.HashSet">
<item id="112" type="com.j2fe.workflow.definition.Transition">
<name id="113">goto-next</name>
<source id="114">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="115"/>
<directJoin>false</directJoin>
<name id="116">Create Job</name>
<nodeHandler>com.j2fe.streetlamp.activities.CreateJob</nodeHandler>
<nodeHandlerClass id="117">com.j2fe.streetlamp.activities.CreateJob</nodeHandlerClass>
<parameters id="118" type="java.util.HashSet">
<item id="119" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="120">configInfo</name>
<stringValue id="121">Process Merge Instructions</stringValue>
<type>CONSTANT</type>
</item>
<item id="122" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="123">flushImmediate</name>
<stringValue id="124">true</stringValue>
<type>CONSTANT</type>
</item>
<item id="125" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="126">jobId</name>
<stringValue id="127">JobID</stringValue>
<type>VARIABLE</type>
</item>
<item id="128" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="129">messageType</name>
<stringValue id="130">messageType</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="131" type="java.util.HashSet">
<item id="132" type="com.j2fe.workflow.definition.Transition">
<name id="133">goto-next</name>
<source id="134">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="135"/>
<directJoin>false</directJoin>
<name id="136">CNST Data Correction</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="137">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="138" type="java.util.HashSet">
<item id="139" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="140">database</name>
<stringValue id="141">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="142" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="143">querySQL</name>
<stringValue id="144">UPDATE FT_T_CNST CN 
SET MERGE_STAT_TYP='FAILED', last_chg_tms=now(), PROC_NOTES_TXT='EG-4400 Prevent merging of Bloomberg entities' 
WHERE CN.CNST_OID IN (
SELECT CN2.CNST_OID 
FROM FT_T_CNST CN2, FT_T_ISSR HI, FT_T_ISSR SU
WHERE 1=1
AND CN2.MERGE_STAT_TYP='TO MERGE'
AND CN2.TBL_ID='ISSR'
AND CN2.START_TMS &gt; date_trunc('day',now())::timestamp - interval '1 day'
AND CN2.CONS_CROSS_REF_ID = HI.INSTR_ISSR_ID
AND CN2.surviving_cross_ref_id = SU.INSTR_ISSR_ID
AND HI.DATA_SRC_ID = 'BB'AND SU.DATA_SRC_ID = 'BB')</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="145" type="java.util.HashSet">
<item id="146" type="com.j2fe.workflow.definition.Transition">
<name id="147">goto-next</name>
<source id="148">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="149"/>
<directJoin>false</directJoin>
<name id="150">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="151">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="152" type="java.util.HashSet"/>
<targets id="153" type="java.util.HashSet">
<item idref="146" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="134"/>
</item>
</sources>
<targets id="154" type="java.util.HashSet">
<item idref="132" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="114"/>
</item>
</sources>
<targets id="155" type="java.util.HashSet">
<item idref="112" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="88"/>
</item>
</sources>
<targets id="156" type="java.util.HashSet">
<item idref="86" type="com.j2fe.workflow.definition.Transition"/>
<item id="157" type="com.j2fe.workflow.definition.Transition">
<name id="158">CNST-NotFound</name>
<source idref="88"/>
<target id="159">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="160"/>
<directJoin>false</directJoin>
<name id="161">Set WF status to false</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="162">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="163" type="java.util.HashSet">
<item id="164" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="165">statements</name>
<stringValue id="166">status = false;</stringValue>
<type>CONSTANT</type>
</item>
<item id="167" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="168">["status"]@java/lang/Boolean@</UITypeHint>
<input>true</input>
<name id="169">variables["status"]</name>
<stringValue id="170">WFStatus</stringValue>
<type>VARIABLE</type>
</item>
<item id="171" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="172">["status"]@java/lang/Boolean@</UITypeHint>
<input>false</input>
<name id="173">variables["status"]</name>
<stringValue id="174">WFStatus</stringValue>
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
<target idref="35"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="73"/>
</item>
</sources>
<targets id="179" type="java.util.HashSet">
<item idref="71" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="66"/>
</item>
<item id="180" type="com.j2fe.workflow.definition.Transition">
<name id="181">goto-next</name>
<source id="182">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="183"/>
<directJoin>false</directJoin>
<name id="184">NOP</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="185">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="186" type="java.util.HashSet">
<item id="187" type="com.j2fe.workflow.definition.Transition">
<name id="188">goto-next</name>
<source id="189">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="190"/>
<directJoin>false</directJoin>
<name id="191">Call Subworkflow</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="192">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="193" type="java.util.HashSet">
<item id="194" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="195">["ActiveRecordsOnly"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="196">input["ActiveRecordsOnly"]</name>
<objectValue id="197" type="java.lang.String">false</objectValue>
<type>CONSTANT</type>
</item>
<item id="198" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="199">["CnstOid"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="200">input["CnstOid"]</name>
<stringValue id="201">Output</stringValue>
<type>VARIABLE</type>
</item>
<item id="202" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="203">["IgnoreUpdates"]@java/lang/Boolean@</UITypeHint>
<input>true</input>
<name id="204">input["IgnoreUpdates"]</name>
<stringValue id="205">IgnoreUpdates</stringValue>
<type>VARIABLE</type>
</item>
<item id="206" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="207">["JobId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="208">input["JobId"]</name>
<stringValue id="209">JobID</stringValue>
<type>VARIABLE</type>
</item>
<item id="210" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="211">["MessageType"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="212">input["MessageType"]</name>
<stringValue id="213">messageType</stringValue>
<type>VARIABLE</type>
</item>
<item id="214" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="215">name</name>
<stringValue id="216">EntityMerge</stringValue>
<type>CONSTANT</type>
</item>
<item id="217" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="218">output["Status"]</name>
<stringValue id="219">WFStatus</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="220" type="java.util.HashSet">
<item id="221" type="com.j2fe.workflow.definition.Transition">
<name id="222">loop</name>
<source idref="42"/>
<target idref="189"/>
</item>
</sources>
<targets id="223" type="java.util.HashSet">
<item idref="187" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="182"/>
</item>
</sources>
<targets id="224" type="java.util.HashSet">
<item idref="180" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="66"/>
</item>
</sources>
<targets id="225" type="java.util.HashSet">
<item idref="64" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="42"/>
</item>
</sources>
<targets id="226" type="java.util.HashSet">
<item idref="40" type="com.j2fe.workflow.definition.Transition"/>
<item idref="221" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="35"/>
</item>
<item idref="177" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="227" type="java.util.HashSet">
<item idref="33" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="21"/>
</item>
</sources>
<targets id="228" type="java.util.HashSet">
<item idref="19" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="10"/>
</item>
</sources>
<targets id="229" type="java.util.HashSet">
<item idref="8" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="3"/>
</item>
</sources>
<targets id="230" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="231">Reference/EntityMerge</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="232">user1</lastChangeUser>
<lastUpdate id="233">2025-12-10T12:25:12.000+0000</lastUpdate>
<name id="234">ProcessMergeInstructions</name>
<nodes id="235" type="java.util.HashSet">
<item idref="134" type="com.j2fe.workflow.definition.Node"/>
<item idref="189" type="com.j2fe.workflow.definition.Node"/>
<item idref="35" type="com.j2fe.workflow.definition.Node"/>
<item idref="10" type="com.j2fe.workflow.definition.Node"/>
<item idref="21" type="com.j2fe.workflow.definition.Node"/>
<item idref="114" type="com.j2fe.workflow.definition.Node"/>
<item idref="88" type="com.j2fe.workflow.definition.Node"/>
<item idref="42" type="com.j2fe.workflow.definition.Node"/>
<item idref="73" type="com.j2fe.workflow.definition.Node"/>
<item idref="182" type="com.j2fe.workflow.definition.Node"/>
<item idref="66" type="com.j2fe.workflow.definition.Node"/>
<item idref="159" type="com.j2fe.workflow.definition.Node"/>
<item idref="148" type="com.j2fe.workflow.definition.Node"/>
<item idref="3" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>true</optimize>
<parameter id="236" type="java.util.HashMap">
<entry>
<key id="237" type="java.lang.String">IgnoreUpdates</key>
<value id="238" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="239">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<description id="240">Avoid overwriting of golden copy data by reference entity data only when VSH is enabled.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="241" type="java.lang.String">WFStatus</key>
<value id="242" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="243">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<description id="244">Returns the status of the processing.</description>
<input>false</input>
<output>true</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="245" type="java.lang.String">cnstOid</key>
<value id="246" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="247">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="248">Value is needed only if a particular merge instruction(CNST) needs to be processed, else all the instructions are considered.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="249" type="java.lang.String">entityType</key>
<value id="250" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="251">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="252">The Entity which needs to be considered for merge. e.g: ISSR, ISSU, FINS. All the entities will be considered by default.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="253" type="java.lang.String">messageType</key>
<value id="254" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="255">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="256">Not a user defined parameter.</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="257" type="java.lang.String">multipleMergeInstructions</key>
<value id="258" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="259">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="260">Exceptions on conflict for multiple merge instructions. Possible values: "Ignore","Yes","No". Default:"Yes"</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
</parameter>
<permissions id="261" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>true</purgeAtEnd>
<retries>0</retries>
<startNode idref="148"/>
<status>RELEASED</status>
<variables id="262" type="java.util.HashMap">
<entry>
<key id="263" type="java.lang.String">CNSTOidlist</key>
<value id="264" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="265">java.lang.Object</className>
<clazz>java.lang.Object</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="266" type="java.lang.String">IgnoreUpdates</key>
<value id="267" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="268">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<description id="269">Avoid overwriting of golden copy data by reference entity data only when VSH is enabled.</description>
<persistent>true</persistent>
<value id="270" type="java.lang.Boolean">false</value>
</value>
</entry>
<entry>
<key id="271" type="java.lang.String">JobID</key>
<value id="272" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="273">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="274" type="java.lang.String">WFStatus</key>
<value id="275" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="276">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<description id="277">Returns the status of the processing.</description>
<persistent>false</persistent>
<value id="278" type="java.lang.Boolean">true</value>
</value>
</entry>
<entry>
<key id="279" type="java.lang.String">cnstOid</key>
<value id="280" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="281">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="282">Value is needed only if a particular merge instruction(CNST) needs to be processed, else all the instructions are considered.</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="283" type="java.lang.String">entityType</key>
<value id="284" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="285">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="286">The Entity which needs to be considered for merge. e.g: ISSR, ISSU, FINS. All the entities will be considered by default.</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="287" type="java.lang.String">loopCounter</key>
<value id="288" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="289">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<persistent>false</persistent>
<value id="290" type="java.lang.Integer">0</value>
</value>
</entry>
<entry>
<key id="291" type="java.lang.String">messageType</key>
<value id="292" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="293">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="294">Not a user defined parameter.</description>
<persistent>true</persistent>
<value id="295" type="java.lang.String">MERGEENTITY</value>
</value>
</entry>
<entry>
<key id="296" type="java.lang.String">multipleMergeInstructions</key>
<value id="297" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="298">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="299">Exceptions on conflict for multiple merge instructions. Possible values: "Ignore","Yes","No". Default:"Yes"</description>
<persistent>false</persistent>
<value id="300" type="java.lang.String">Yes</value>
</value>
</entry>
<entry>
<key id="301" type="java.lang.String">oidList</key>
<value id="302" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="303">[Ljava.lang.String;</className>
<clazz>[Ljava.lang.String;</clazz>
<description id="304">cnst oid list</description>
<persistent>false</persistent>
</value>
</entry>
</variables>
<version>6</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
