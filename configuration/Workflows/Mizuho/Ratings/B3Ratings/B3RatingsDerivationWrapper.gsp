<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.07">
<package-comment/>
<businessobject displayString="6 - GU-313" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>false</alwaysPersist>
<clustered>true</clustered>
<comment id="1">GU-313</comment>
<endNode id="2">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="3">Stop</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="4">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="5" type="java.util.HashSet">
<item id="6" type="com.j2fe.workflow.definition.Transition">
<name id="7">goto-next</name>
<source id="8">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="9">Close Job</name>
<nodeHandler>com.j2fe.streetlamp.activities.CloseJob</nodeHandler>
<nodeHandlerClass id="10">com.j2fe.streetlamp.activities.CloseJob</nodeHandlerClass>
<parameters id="11" type="java.util.HashSet">
<item id="12" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="13">jobId</name>
<stringValue id="14">ParentJobId</stringValue>
<type>VARIABLE</type>
</item>
<item id="15" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="16">skipConsolidateJob</name>
<stringValue id="17">true</stringValue>
<type>CONSTANT</type>
</item>
<item id="18" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="19">skipSeverityL3</name>
<stringValue id="20">true</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="21" type="java.util.HashSet">
<item id="22" type="com.j2fe.workflow.definition.Transition">
<name id="23">goto-next</name>
<source id="24">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="25">Consolidate Job</name>
<nodeHandler>com.j2fe.streetlamp.activities.ConsolidateJob</nodeHandler>
<nodeHandlerClass id="26">com.j2fe.streetlamp.activities.ConsolidateJob</nodeHandlerClass>
<parameters id="27" type="java.util.HashSet">
<item id="28" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="29">consolidateChildren</name>
<stringValue id="30">false</stringValue>
<type>CONSTANT</type>
</item>
<item id="31" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="32">jobId</name>
<stringValue id="33">ParentJobId</stringValue>
<type>VARIABLE</type>
</item>
<item id="34" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="35">updateTotalCount</name>
<stringValue id="36">true</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="37" type="java.util.HashSet">
<item id="38" type="com.j2fe.workflow.definition.Transition">
<name id="39">ToSplit</name>
<source id="40">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="41">Automatically generated</description>
<directJoin>false</directJoin>
<name id="42">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="43">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="44" type="java.util.HashSet">
<item id="45" type="com.j2fe.workflow.definition.Transition">
<name id="46">end-loop</name>
<source id="47">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="48">For Loop</name>
<nodeHandler>com.j2fe.workflow.handler.impl.ForEach</nodeHandler>
<nodeHandlerClass id="49">com.j2fe.workflow.handler.impl.ForEach</nodeHandlerClass>
<parameters id="50" type="java.util.HashSet">
<item id="51" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="52">counter</name>
<stringValue id="53">forLoopCnt</stringValue>
<type>VARIABLE</type>
</item>
<item id="54" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="55">counter</name>
<stringValue id="56">forLoopCnt</stringValue>
<type>VARIABLE</type>
</item>
<item id="57" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="58">input</name>
<stringValue id="59">InstMnemList</stringValue>
<type>VARIABLE</type>
</item>
<item id="60" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="61">output</name>
<stringValue id="62">instMnemSingle</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="63" type="java.util.HashSet">
<item id="64" type="com.j2fe.workflow.definition.Transition">
<name id="65">ToSplit</name>
<source id="66">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="67">Automatically generated</description>
<directJoin>false</directJoin>
<name id="68">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="69">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="70" type="java.util.HashSet">
<item id="71" type="com.j2fe.workflow.definition.Transition">
<name id="72">goto-next</name>
<source id="73">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="74">Reset recal flag</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="75">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="76" type="java.util.HashSet">
<item id="77" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="78">database</name>
<stringValue id="79">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="80" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="81">[0]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="82">indexedParameters[0]</name>
<stringValue id="83">instMnemSingle</stringValue>
<type>VARIABLE</type>
</item>
<item id="84" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="85">querySQL</name>
<stringValue id="86">UPDATE FT_T_FIST SET STAT_CHAR_VAL_TXT ='N', LAST_CHG_TMS = SYSDATE(), LAST_CHG_USR_ID = 'B3RatingDeriveWF' WHERE STAT_DEF_ID ='B3RECALF' AND END_TMS IS NULL AND INST_MNEM = ?</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="87" type="java.util.HashSet">
<item id="88" type="com.j2fe.workflow.definition.Transition">
<name id="89">goto-next</name>
<source id="90">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="91">Asset without Vnd Rtng</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="92">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="93" type="java.util.HashSet">
<item id="94" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="95">["ParallelBranches"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="96">input["ParallelBranches"]</name>
<stringValue id="97">ParallelBranches</stringValue>
<type>VARIABLE</type>
</item>
<item id="98" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="99">["instMnem"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="100">input["instMnem"]</name>
<stringValue id="101">instMnemSingle</stringValue>
<type>VARIABLE</type>
</item>
<item id="102" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="103">["jobId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="104">input["jobId"]</name>
<stringValue id="105">ParentJobId</stringValue>
<type>VARIABLE</type>
</item>
<item id="106" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="107">name</name>
<stringValue id="108">B3RatingsDerivationAssetWithoutVndrRtng</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="109" type="java.util.HashSet">
<item id="110" type="com.j2fe.workflow.definition.Transition">
<name id="111">goto-next</name>
<source id="112">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="113">Asset with Vnd Rng</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="114">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="115" type="java.util.HashSet">
<item id="116" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="117">["ParallelBranches"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="118">input["ParallelBranches"]</name>
<stringValue id="119">ParallelBranches</stringValue>
<type>VARIABLE</type>
</item>
<item id="120" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="121">["instMnem"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="122">input["instMnem"]</name>
<stringValue id="123">instMnemSingle</stringValue>
<type>VARIABLE</type>
</item>
<item id="124" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="125">["jobId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="126">input["jobId"]</name>
<stringValue id="127">ParentJobId</stringValue>
<type>VARIABLE</type>
</item>
<item id="128" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="129">name</name>
<stringValue id="130">B3RatingsDerivationAssetWithVndrRtng</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="131" type="java.util.HashSet">
<item id="132" type="com.j2fe.workflow.definition.Transition">
<name id="133">goto-next</name>
<source id="134">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="135">Issuers B3 Rtng</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="136">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="137" type="java.util.HashSet">
<item id="138" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="139">["ParallelBranches"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="140">input["ParallelBranches"]</name>
<stringValue id="141">ParallelBranches</stringValue>
<type>VARIABLE</type>
</item>
<item id="142" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="143">["instMnem"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="144">input["instMnem"]</name>
<stringValue id="145">instMnemSingle</stringValue>
<type>VARIABLE</type>
</item>
<item id="146" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="147">["jobId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="148">input["jobId"]</name>
<stringValue id="149">ParentJobId</stringValue>
<type>VARIABLE</type>
</item>
<item id="150" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="151">name</name>
<stringValue id="152">B3RatingsDerivationIssuers</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="153" type="java.util.HashSet">
<item id="154" type="com.j2fe.workflow.definition.Transition">
<name id="155">loop</name>
<source idref="47"/>
<target idref="134"/>
</item>
</sources>
<targets id="156" type="java.util.HashSet">
<item idref="132" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="112"/>
</item>
</sources>
<targets id="157" type="java.util.HashSet">
<item idref="110" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="90"/>
</item>
</sources>
<targets id="158" type="java.util.HashSet">
<item idref="88" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="73"/>
</item>
</sources>
<targets id="159" type="java.util.HashSet">
<item idref="71" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="66"/>
</item>
<item id="160" type="com.j2fe.workflow.definition.Transition">
<name id="161">rows-found</name>
<source id="162">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="163">Get FINS to RECALC</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="164">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="165" type="java.util.HashSet">
<item id="166" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="167">database</name>
<stringValue id="168">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="169" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="170">firstColumnsResult</name>
<stringValue id="171">InstMnemList</stringValue>
<type>VARIABLE</type>
</item>
<item id="172" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="173">querySQL</name>
<stringValue id="174">-- Union All to ensure Institution as country's rating calculation is done first and then other institutions per requirement.

 SELECT DISTINCT INST_MNEM FROM FT_T_FIST FIST WHERE STAT_DEF_ID = 'B3RECALF' AND(END_TMS IS NULL OR END_TMS &gt; SYSDATE()) AND STAT_CHAR_VAL_TXT = 'Y'
 AND EXISTS (SELECT 1 FROM FT_T_FICL FICL WHERE FICL.INST_MNEM = FIST.INST_MNEM AND FICL.END_TMS IS NULL AND FICL.INDUS_CL_SET_ID = 'INSTCNTR')
 UNION ALL
 SELECT DISTINCT INST_MNEM FROM FT_T_FIST FIST WHERE STAT_DEF_ID = 'B3RECALF' AND(END_TMS IS NULL OR END_TMS &gt; SYSDATE()) AND STAT_CHAR_VAL_TXT = 'Y'
 AND NOT EXISTS (SELECT 1 FROM FT_T_FICL FICL WHERE FICL.INST_MNEM = FIST.INST_MNEM AND FICL.END_TMS IS NULL AND FICL.INDUS_CL_SET_ID = 'INSTCNTR')</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="175" type="java.util.HashSet">
<item id="176" type="com.j2fe.workflow.definition.Transition">
<name id="177">goto-next</name>
<source id="178">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="179">Set Recal flg</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="180">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="181" type="java.util.HashSet">
<item id="182" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="183">["ParentJobId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="184">input["ParentJobId"]</name>
<stringValue id="185">ParentJobId</stringValue>
<type>VARIABLE</type>
</item>
<item id="186" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="187">name</name>
<stringValue id="188">B3RatingsRecalFlagSetterWrapper</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="189" type="java.util.HashSet">
<item id="190" type="com.j2fe.workflow.definition.Transition">
<name id="191">goto-next</name>
<source id="192">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="193">Create Parent Job</name>
<nodeHandler>com.j2fe.streetlamp.activities.CreateJob</nodeHandler>
<nodeHandlerClass id="194">com.j2fe.streetlamp.activities.CreateJob</nodeHandlerClass>
<parameters id="195" type="java.util.HashSet">
<item id="196" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="197">configInfo</name>
<stringValue id="198">B3RatingsDerivation</stringValue>
<type>CONSTANT</type>
</item>
<item id="199" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="200">jobId</name>
<stringValue id="201">ParentJobId</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="202" type="java.util.HashSet">
<item id="203" type="com.j2fe.workflow.definition.Transition">
<name id="204">goto-next</name>
<source id="205">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="206">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="207">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="208" type="java.util.HashSet"/>
<targets id="209" type="java.util.HashSet">
<item idref="203" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="192"/>
</item>
</sources>
<targets id="210" type="java.util.HashSet">
<item idref="190" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="178"/>
</item>
</sources>
<targets id="211" type="java.util.HashSet">
<item idref="176" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="162"/>
</item>
</sources>
<targets id="212" type="java.util.HashSet">
<item id="213" type="com.j2fe.workflow.definition.Transition">
<name id="214">nothing-found</name>
<source idref="162"/>
<target id="215">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="216">No updates required</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="217">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="218" type="java.util.HashSet">
<item idref="213" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="219" type="java.util.HashSet">
<item id="220" type="com.j2fe.workflow.definition.Transition">
<name id="221">goto-next</name>
<source idref="215"/>
<target idref="24"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item idref="160" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="66"/>
</item>
</sources>
<targets id="222" type="java.util.HashSet">
<item idref="64" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="47"/>
</item>
</sources>
<targets id="223" type="java.util.HashSet">
<item idref="45" type="com.j2fe.workflow.definition.Transition"/>
<item idref="154" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="40"/>
</item>
</sources>
<targets id="224" type="java.util.HashSet">
<item idref="38" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="24"/>
</item>
<item idref="220" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="225" type="java.util.HashSet">
<item idref="22" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="8"/>
</item>
</sources>
<targets id="226" type="java.util.HashSet">
<item idref="6" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="2"/>
</item>
</sources>
<targets id="227" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="228">Mizuho/Ratings/B3Ratings</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="229">user1</lastChangeUser>
<lastUpdate id="230">2025-09-11T07:46:12.000+0100</lastUpdate>
<name id="231">B3RatingsDerivationWrapper</name>
<nodes id="232" type="java.util.HashSet">
<item idref="112" type="com.j2fe.workflow.definition.Node"/>
<item idref="90" type="com.j2fe.workflow.definition.Node"/>
<item idref="8" type="com.j2fe.workflow.definition.Node"/>
<item idref="24" type="com.j2fe.workflow.definition.Node"/>
<item idref="192" type="com.j2fe.workflow.definition.Node"/>
<item idref="47" type="com.j2fe.workflow.definition.Node"/>
<item idref="162" type="com.j2fe.workflow.definition.Node"/>
<item idref="134" type="com.j2fe.workflow.definition.Node"/>
<item idref="40" type="com.j2fe.workflow.definition.Node"/>
<item idref="66" type="com.j2fe.workflow.definition.Node"/>
<item idref="215" type="com.j2fe.workflow.definition.Node"/>
<item idref="73" type="com.j2fe.workflow.definition.Node"/>
<item idref="178" type="com.j2fe.workflow.definition.Node"/>
<item idref="205" type="com.j2fe.workflow.definition.Node"/>
<item idref="2" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>true</optimize>
<parameter id="233" type="java.util.HashMap">
<entry>
<key id="234" type="java.lang.String">ParallelBranches</key>
<value id="235" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="236">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
</parameter>
<permissions id="237" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>true</purgeAtEnd>
<retries>0</retries>
<startNode idref="205"/>
<status>RELEASED</status>
<variables id="238" type="java.util.HashMap">
<entry>
<key id="239" type="java.lang.String">BulkSize</key>
<value id="240" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="241">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="242">the number of institutions to process in parallet</description>
<persistent>false</persistent>
<value id="243" type="java.lang.Integer">500</value>
</value>
</entry>
<entry>
<key id="244" type="java.lang.String">ParallelBranches</key>
<value id="245" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="246">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<persistent>false</persistent>
<value id="247" type="java.lang.Integer">2</value>
</value>
</entry>
<entry>
<key id="248" type="java.lang.String">forLoopCnt</key>
<value id="249" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="250">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<persistent>false</persistent>
<value id="251" type="java.lang.Integer">0</value>
</value>
</entry>
</variables>
<version>6</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
