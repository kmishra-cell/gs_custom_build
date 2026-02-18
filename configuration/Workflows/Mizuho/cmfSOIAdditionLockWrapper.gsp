<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.03">
<package-comment/>
<businessobject displayString="4 - V10" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>true</alwaysPersist>
<clustered>false</clustered>
<comment id="1">V10</comment>
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
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="10"/>
<directJoin>false</directJoin>
<name id="11">log lock success</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="12">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="13" type="java.util.HashSet">
<item id="14" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="15">database</name>
<stringValue id="16">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="17" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="18">indexedParameters[0]</name>
<stringValue id="19">lockJobId</stringValue>
<type>VARIABLE</type>
</item>
<item id="20" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="21">indexedParameters[1]</name>
<stringValue id="22">lockJobId</stringValue>
<type>VARIABLE</type>
</item>
<item id="23" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="24">querySQL</name>
<stringValue id="25">call mhi_sp_eventlog (&#13;
	  'cmfSOIAdditionLock',&#13;
	  'obtained lock for inventory ',&#13;
	  CAST(? AS VARCHAR),&#13;
	  CAST(? AS VARCHAR)&#13;
	);</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="26" type="java.util.HashSet">
<item id="27" type="com.j2fe.workflow.definition.Transition">
<name id="28">nothing-found</name>
<source id="29">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="30"/>
<directJoin>false</directJoin>
<name id="31">check lock 2</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="32">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="33" type="java.util.HashSet">
<item id="34" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="35">database</name>
<stringValue id="36">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="37" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="38">[0]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="39">indexedParameters[0]</name>
<stringValue id="40">lockJobId</stringValue>
<type>VARIABLE</type>
</item>
<item id="41" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="42">indexedParameters[1]</name>
<stringValue id="43">lockJobId</stringValue>
<type>VARIABLE</type>
</item>
<item id="44" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="45">indexedResult</name>
<stringValue id="46">lockstatus</stringValue>
<type>VARIABLE</type>
</item>
<item id="47" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="48">querySQL</name>
<stringValue id="49">select JOB_ID from CMFSOIADDITION_LOCK where KEYS = ? and JOB_ID != ?</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="50" type="java.util.HashSet">
<item id="51" type="com.j2fe.workflow.definition.Transition">
<name id="52">goto-next</name>
<source id="53">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="54"/>
<directJoin>false</directJoin>
<name id="55">wait 5 secs</name>
<nodeHandler>com.j2fe.scheduling.activities.Wait</nodeHandler>
<nodeHandlerClass id="56">com.j2fe.scheduling.activities.Wait</nodeHandlerClass>
<parameters id="57" type="java.util.HashSet">
<item id="58" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="59">secondsToWait</name>
<stringValue id="60">5</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="61" type="java.util.HashSet">
<item id="62" type="com.j2fe.workflow.definition.Transition">
<name id="63">rows-found</name>
<source id="64">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="65"/>
<directJoin>false</directJoin>
<name id="66">check lock</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="67">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="68" type="java.util.HashSet">
<item id="69" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="70">database</name>
<stringValue id="71">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="72" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="73">[0]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="74">indexedParameters[0]</name>
<stringValue id="75">lockJobId</stringValue>
<type>VARIABLE</type>
</item>
<item id="76" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="77">indexedParameters[1]</name>
<stringValue id="78">lockJobId</stringValue>
<type>VARIABLE</type>
</item>
<item id="79" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="80">indexedResult</name>
<stringValue id="81">lockstatus</stringValue>
<type>VARIABLE</type>
</item>
<item id="82" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="83">querySQL</name>
<stringValue id="84">select JOB_ID from CMFSOIADDITION_LOCK where KEYS = ? and JOB_ID = ?</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="85" type="java.util.HashSet">
<item id="86" type="com.j2fe.workflow.definition.Transition">
<name id="87">goto-next</name>
<source id="88">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="89"/>
<directJoin>false</directJoin>
<name id="90">Set db lock</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="91">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="92" type="java.util.HashSet">
<item id="93" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="94">database</name>
<stringValue id="95">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="96" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="97">indexedParameters[0]</name>
<stringValue id="98">lockJobId</stringValue>
<type>VARIABLE</type>
</item>
<item id="99" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="100">indexedParameters[1]</name>
<stringValue id="101">lockJobId</stringValue>
<type>VARIABLE</type>
</item>
<item id="102" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="103">indexedParameters[2]</name>
<stringValue id="104">lockJobId</stringValue>
<type>VARIABLE</type>
</item>
<item id="105" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="106">querySQL</name>
<stringValue id="107">INSERT INTO CMFSOIADDITION_LOCK (keys, job_id, lock_tms)&#13;
    SELECT CAST(? AS VARCHAR), CAST(? AS VARCHAR), sysdate() FROM dual&#13;
    WHERE NOT EXISTS (SELECT 1 FROM CMFSOIADDITION_LOCK WHERE keys = CAST(? AS VARCHAR));</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="108" type="java.util.HashSet">
<item id="109" type="com.j2fe.workflow.definition.Transition">
<name id="110">nothing-found</name>
<source id="111">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="112"/>
<directJoin>false</directJoin>
<name id="113">pre-lock check</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="114">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="115" type="java.util.HashSet">
<item id="116" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="117">database</name>
<stringValue id="118">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="119" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="120">[0]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="121">indexedParameters[0]</name>
<stringValue id="122">lockJobId</stringValue>
<type>VARIABLE</type>
</item>
<item id="123" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="124">indexedParameters[1]</name>
<stringValue id="125">lockJobId</stringValue>
<type>VARIABLE</type>
</item>
<item id="126" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="127">indexedResult</name>
<stringValue id="128">lockstatus</stringValue>
<type>VARIABLE</type>
</item>
<item id="129" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="130">querySQL</name>
<stringValue id="131">select JOB_ID from CMFSOIADDITION_LOCK where KEYS = ? and JOB_ID != ?</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="132" type="java.util.HashSet">
<item id="133" type="com.j2fe.workflow.definition.Transition">
<name id="134">goto-next</name>
<source id="135">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="136"/>
<directJoin>false</directJoin>
<name id="137">log request lock</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="138">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="139" type="java.util.HashSet">
<item id="140" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="141">database</name>
<stringValue id="142">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="143" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="144">indexedParameters[0]</name>
<stringValue id="145">lockJobId</stringValue>
<type>VARIABLE</type>
</item>
<item id="146" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="147">indexedParameters[1]</name>
<stringValue id="148">lockJobId</stringValue>
<type>VARIABLE</type>
</item>
<item id="149" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="150">querySQL</name>
<stringValue id="151">call mhi_sp_eventlog (&#13;
	  'cmfSOIAdditionLock',&#13;
	  'request lock for inventory ',&#13;
	  CAST(? AS VARCHAR),&#13;
	  CAST(? AS VARCHAR)&#13;
	); &#13;
</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="152" type="java.util.HashSet">
<item id="153" type="com.j2fe.workflow.definition.Transition">
<name id="154">goto-next</name>
<source id="155">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="156"/>
<directJoin>false</directJoin>
<name id="157">lock try repeat</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="158">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="159" type="java.util.HashSet">
<item id="160" type="com.j2fe.workflow.definition.Transition">
<name id="161">goto-next</name>
<source id="162">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="163"/>
<directJoin>false</directJoin>
<name id="164">Get Lock JOB ID</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="165">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="166" type="java.util.HashSet">
<item id="167" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="168">database</name>
<stringValue id="169">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="170" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="171">firstColumnsResult[0]</name>
<stringValue id="172">lockJobId</stringValue>
<type>VARIABLE</type>
</item>
<item id="173" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="174">querySQL</name>
<stringValue id="175">SELECT new_oid() FROM dual</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="176" type="java.util.HashSet">
<item id="177" type="com.j2fe.workflow.definition.Transition">
<name id="178">goto-next</name>
<source id="179">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="180"/>
<directJoin>false</directJoin>
<name id="181">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="182">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="183" type="java.util.HashSet"/>
<targets id="184" type="java.util.HashSet">
<item idref="177" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="162"/>
</item>
</sources>
<targets id="185" type="java.util.HashSet">
<item idref="160" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="155"/>
</item>
<item id="186" type="com.j2fe.workflow.definition.Transition">
<name id="187">goto-next</name>
<source id="188">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="189"/>
<directJoin>false</directJoin>
<name id="190">Wait 31 secs</name>
<nodeHandler>com.j2fe.scheduling.activities.Wait</nodeHandler>
<nodeHandlerClass id="191">com.j2fe.scheduling.activities.Wait</nodeHandlerClass>
<parameters id="192" type="java.util.HashSet">
<item id="193" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="194">secondsToWait</name>
<stringValue id="195">31</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="196" type="java.util.HashSet">
<item id="197" type="com.j2fe.workflow.definition.Transition">
<name id="198">goto-next</name>
<source id="199">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="200"/>
<directJoin>false</directJoin>
<name id="201">log lock failure</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="202">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="203" type="java.util.HashSet">
<item id="204" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="205">database</name>
<stringValue id="206">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="207" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="208">indexedParameters[0]</name>
<stringValue id="209">lockJobId</stringValue>
<type>VARIABLE</type>
</item>
<item id="210" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="211">indexedParameters[1]</name>
<stringValue id="212">lockJobId</stringValue>
<type>VARIABLE</type>
</item>
<item id="213" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="214">querySQL</name>
<stringValue id="215">call mhi_sp_eventlog (&#13;
	  'cmfSOIAdditionLock',&#13;
	  'waiting to obtain lock for inventory ',&#13;
	  CAST(? AS VARCHAR),&#13;
	  CAST(? AS VARCHAR)&#13;
	);</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="216" type="java.util.HashSet">
<item id="217" type="com.j2fe.workflow.definition.Transition">
<name id="218">goto-next</name>
<source id="219">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="220"/>
<directJoin>false</directJoin>
<name id="221">reset db lock</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="222">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="223" type="java.util.HashSet">
<item id="224" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="225">database</name>
<stringValue id="226">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="227" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="228">indexedParameters[0]</name>
<stringValue id="229">lockJobId</stringValue>
<type>VARIABLE</type>
</item>
<item id="230" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="231">indexedParameters[1]</name>
<stringValue id="232">lockJobId</stringValue>
<type>VARIABLE</type>
</item>
<item id="233" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="234">querySQL</name>
<stringValue id="235">delete from CMFSOIADDITION_LOCK where KEYS = CAST(? AS VARCHAR) and JOB_ID = CAST(? AS VARCHAR);</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="236" type="java.util.HashSet">
<item id="237" type="com.j2fe.workflow.definition.Transition">
<name id="238">rows-found</name>
<source idref="29"/>
<target idref="219"/>
</item>
</sources>
<targets id="239" type="java.util.HashSet">
<item idref="217" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="199"/>
</item>
<item id="240" type="com.j2fe.workflow.definition.Transition">
<name id="241">nothing-found</name>
<source idref="64"/>
<target idref="199"/>
</item>
<item id="242" type="com.j2fe.workflow.definition.Transition">
<name id="243">rows-found</name>
<source idref="111"/>
<target idref="199"/>
</item>
</sources>
<targets id="244" type="java.util.HashSet">
<item idref="197" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="188"/>
</item>
</sources>
<targets id="245" type="java.util.HashSet">
<item idref="186" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="155"/>
</item>
</sources>
<targets id="246" type="java.util.HashSet">
<item idref="153" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="135"/>
</item>
</sources>
<targets id="247" type="java.util.HashSet">
<item idref="133" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="111"/>
</item>
</sources>
<targets id="248" type="java.util.HashSet">
<item idref="109" type="com.j2fe.workflow.definition.Transition"/>
<item idref="242" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="88"/>
</item>
</sources>
<targets id="249" type="java.util.HashSet">
<item idref="86" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="64"/>
</item>
</sources>
<targets id="250" type="java.util.HashSet">
<item idref="240" type="com.j2fe.workflow.definition.Transition"/>
<item idref="62" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="53"/>
</item>
</sources>
<targets id="251" type="java.util.HashSet">
<item idref="51" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="29"/>
</item>
</sources>
<targets id="252" type="java.util.HashSet">
<item idref="27" type="com.j2fe.workflow.definition.Transition"/>
<item idref="237" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="9"/>
</item>
</sources>
<targets id="253" type="java.util.HashSet">
<item idref="7" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="2"/>
</item>
</sources>
<targets id="254" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="255">Mizuho</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="256">user1</lastChangeUser>
<lastUpdate id="257">2025-07-04T05:27:08.000+0100</lastUpdate>
<name id="258">cmfSOIAdditionLockWrapper</name>
<nodes id="259" type="java.util.HashSet">
<item idref="162" type="com.j2fe.workflow.definition.Node"/>
<item idref="88" type="com.j2fe.workflow.definition.Node"/>
<item idref="179" type="com.j2fe.workflow.definition.Node"/>
<item idref="2" type="com.j2fe.workflow.definition.Node"/>
<item idref="188" type="com.j2fe.workflow.definition.Node"/>
<item idref="64" type="com.j2fe.workflow.definition.Node"/>
<item idref="29" type="com.j2fe.workflow.definition.Node"/>
<item idref="155" type="com.j2fe.workflow.definition.Node"/>
<item idref="199" type="com.j2fe.workflow.definition.Node"/>
<item idref="9" type="com.j2fe.workflow.definition.Node"/>
<item idref="135" type="com.j2fe.workflow.definition.Node"/>
<item idref="111" type="com.j2fe.workflow.definition.Node"/>
<item idref="219" type="com.j2fe.workflow.definition.Node"/>
<item idref="53" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>false</optimize>
<parameter id="260" type="java.util.HashMap">
<entry>
<key id="261" type="java.lang.String">lockJobId</key>
<value id="262" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="263">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>false</input>
<output>true</output>
<required>false</required>
</value>
</entry>
</parameter>
<permissions id="264" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>false</purgeAtEnd>
<retries>0</retries>
<startNode idref="179"/>
<status>RELEASED</status>
<variables id="265" type="java.util.HashMap">
<entry>
<key id="266" type="java.lang.String">lockJobId</key>
<value id="267" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="268">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>true</persistent>
</value>
</entry>
</variables>
<version>4</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
