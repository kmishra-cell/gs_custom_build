<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.12">
<package-comment/>
<businessobject displayString="10 - v10 EnvNme" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>false</alwaysPersist>
<clustered>false</clustered>
<comment id="1">v10 EnvNme</comment>
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
<name id="9">end-loop</name>
<source id="10">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="11"/>
<directJoin>false</directJoin>
<name id="12">Loop through unprocessed Alacra Response Files</name>
<nodeHandler>com.j2fe.workflow.handler.impl.ForEach</nodeHandler>
<nodeHandlerClass id="13">com.j2fe.workflow.handler.impl.ForEach</nodeHandlerClass>
<parameters id="14" type="java.util.HashSet">
<item id="15" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="16">counter</name>
<stringValue id="17">forLoopCnt</stringValue>
<type>VARIABLE</type>
</item>
<item id="18" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="19">counter</name>
<stringValue id="20">forLoopCnt</stringValue>
<type>VARIABLE</type>
</item>
<item id="21" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="22">input</name>
<stringValue id="23">VREQToProcess</stringValue>
<type>VARIABLE</type>
</item>
<item id="24" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="25">outputObjects[0]["AlacraResponseFileName"]</name>
<stringValue id="26">AlacraResponseFileName</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="27" type="java.util.HashSet">
<item id="28" type="com.j2fe.workflow.definition.Transition">
<name id="29">goto-next</name>
<source id="30">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="31"/>
<directJoin>false</directJoin>
<name id="32">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="33">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="34" type="java.util.HashSet">
<item id="35" type="com.j2fe.workflow.definition.Transition">
<name id="36">goto-next</name>
<source id="37">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="38"/>
<directJoin>false</directJoin>
<name id="39">NOP</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="40">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="41" type="java.util.HashSet">
<item id="42" type="com.j2fe.workflow.definition.Transition">
<name id="43">empty</name>
<source id="44">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="45"/>
<directJoin>false</directJoin>
<name id="46">List Files on Alacra Server</name>
<nodeHandler>com.j2fe.feeds.activities.ListFiles</nodeHandler>
<nodeHandlerClass id="47">com.j2fe.feeds.activities.ListFiles</nodeHandlerClass>
<parameters id="48" type="java.util.HashSet">
<item id="49" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="50">directory</name>
<stringValue id="51">AlacraInboundRemoteDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="52" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="53">fileSystem</name>
<stringValue id="54">filesystem/sftp/Alacra</stringValue>
<type>REFERENCE</type>
</item>
<item id="55" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="56">fileSystemId</name>
<stringValue id="57">filesystem/sftp/Alacra/user</stringValue>
<type>REFERENCE</type>
</item>
<item id="58" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="59">pattern[0]</name>
<stringValue id="60">AlacraResponseFileName</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="61" type="java.util.HashSet">
<item id="62" type="com.j2fe.workflow.definition.Transition">
<name id="63">loop</name>
<source idref="10"/>
<target idref="44"/>
</item>
</sources>
<targets id="64" type="java.util.HashSet">
<item idref="42" type="com.j2fe.workflow.definition.Transition"/>
<item id="65" type="com.j2fe.workflow.definition.Transition">
<name id="66">not-empty</name>
<source idref="44"/>
<target id="67">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="68"/>
<directJoin>false</directJoin>
<name id="69">Bean Shell Script (Standard)</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="70">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="71" type="java.util.HashSet">
<item id="72" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="73">statements</name>
<stringValue id="74">String JOB_INPUT_TXT = "sftp:/" + FilePath +"/" + FileName;&#13;
</stringValue>
<type>CONSTANT</type>
</item>
<item id="75" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="76">variables["FileName"]</name>
<stringValue id="77">AlacraResponseFileName</stringValue>
<type>VARIABLE</type>
</item>
<item id="78" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="79">variables["FilePath"]</name>
<stringValue id="80">AlacraInboundRemoteDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="81" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="82">variables["JOB_INPUT_TXT"]</name>
<stringValue id="83">JOB_INPUT_TXT</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="84" type="java.util.HashSet">
<item idref="65" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="85" type="java.util.HashSet">
<item id="86" type="com.j2fe.workflow.definition.Transition">
<name id="87">goto-next</name>
<source idref="67"/>
<target id="88">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="89"/>
<directJoin>false</directJoin>
<name id="90">Create Job</name>
<nodeHandler>com.j2fe.streetlamp.activities.CreateJob</nodeHandler>
<nodeHandlerClass id="91">com.j2fe.streetlamp.activities.CreateJob</nodeHandlerClass>
<parameters id="92" type="java.util.HashSet">
<item id="93" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="94">configInfo</name>
<stringValue id="95">AlacraInbound</stringValue>
<type>CONSTANT</type>
</item>
<item id="96" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="97">file</name>
<stringValue id="98">JOB_INPUT_TXT</stringValue>
<type>VARIABLE</type>
</item>
<item id="99" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="100">jobId</name>
<stringValue id="101">JobID</stringValue>
<type>VARIABLE</type>
</item>
<item id="102" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="103">parentJobId</name>
<stringValue id="104">ParentJobID</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="105" type="java.util.HashSet">
<item idref="86" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="106" type="java.util.HashSet">
<item id="107" type="com.j2fe.workflow.definition.Transition">
<name id="108">goto-next</name>
<source idref="88"/>
<target id="109">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="110"/>
<directJoin>false</directJoin>
<name id="111">Create Transaction</name>
<nodeHandler>com.j2fe.streetlamp.activities.CreateTransaction</nodeHandler>
<nodeHandlerClass id="112">com.j2fe.streetlamp.activities.CreateTransaction</nodeHandlerClass>
<parameters id="113" type="java.util.HashSet">
<item id="114" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="115">jobId</name>
<stringValue id="116">JobID</stringValue>
<type>VARIABLE</type>
</item>
<item id="117" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="118">originalMessage</name>
<stringValue id="119">OriginalMessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="120" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="121">originalMessageType</name>
<stringValue id="122">OriginalMessageType</stringValue>
<type>VARIABLE</type>
</item>
<item id="123" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="124">transactionId</name>
<stringValue id="125">TransactionID</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="126" type="java.util.HashSet">
<item idref="107" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="127" type="java.util.HashSet">
<item id="128" type="com.j2fe.workflow.definition.Transition">
<name id="129">goto-next</name>
<source idref="109"/>
<target id="130">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="131"/>
<directJoin>false</directJoin>
<name id="132">Copy File To Temp</name>
<nodeHandler>com.j2fe.general.activities.FileOperator</nodeHandler>
<nodeHandlerClass id="133">com.j2fe.general.activities.FileOperator</nodeHandlerClass>
<parameters id="134" type="java.util.HashSet">
<item id="135" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="136">operationToPerform</name>
<stringValue id="137">Copy</stringValue>
<type>CONSTANT</type>
</item>
<item id="138" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="139">sourceDirectory</name>
<stringValue id="140">AlacraInboundRemoteDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="141" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="142">sourceFileName</name>
<stringValue id="143">AlacraResponseFileName</stringValue>
<type>VARIABLE</type>
</item>
<item id="144" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="145">sourceFileSystem</name>
<stringValue id="146">filesystem/sftp/Alacra</stringValue>
<type>REFERENCE</type>
</item>
<item id="147" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="148">targetDirectory</name>
<stringValue id="149">AlacraInboundLocalDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="150" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="151">targetFileName</name>
<stringValue id="152">AlacraResponseFileName</stringValue>
<type>VARIABLE</type>
</item>
<item id="153" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="154">targetFileSystem</name>
<stringValue id="155">filesystem/local</stringValue>
<type>REFERENCE</type>
</item>
</parameters>
<sources id="156" type="java.util.HashSet">
<item idref="128" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="157" type="java.util.HashSet">
<item id="158" type="com.j2fe.workflow.definition.Transition">
<name id="159">goto-next</name>
<source idref="130"/>
<target id="160">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="161"/>
<directJoin>false</directJoin>
<name id="162">List Files</name>
<nodeHandler>com.j2fe.feeds.activities.ListFiles</nodeHandler>
<nodeHandlerClass id="163">com.j2fe.feeds.activities.ListFiles</nodeHandlerClass>
<parameters id="164" type="java.util.HashSet">
<item id="165" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="166">directory</name>
<stringValue id="167">AlacraInboundLocalDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="168" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="169">fileSystem</name>
<stringValue id="170">filesystem/local</stringValue>
<type>REFERENCE</type>
</item>
<item id="171" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="172">fileSystemId</name>
<stringValue id="173">AlacraResponseFileName</stringValue>
<type>VARIABLE</type>
</item>
<item id="174" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="175">list</name>
<stringValue id="176">FileList</stringValue>
<type>VARIABLE</type>
</item>
<item id="177" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="178">uris</name>
<stringValue id="179">URIList</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="180" type="java.util.HashSet">
<item idref="158" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="181" type="java.util.HashSet">
<item id="182" type="com.j2fe.workflow.definition.Transition">
<name id="183">empty</name>
<source idref="160"/>
<target id="184">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="185"/>
<directJoin>false</directJoin>
<name id="186">Close Transaction</name>
<nodeHandler>com.j2fe.streetlamp.activities.CloseTransaction</nodeHandler>
<nodeHandlerClass id="187">com.j2fe.streetlamp.activities.CloseTransaction</nodeHandlerClass>
<parameters id="188" type="java.util.HashSet">
<item id="189" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="190">transactionId</name>
<stringValue id="191">TransactionID</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="192" type="java.util.HashSet">
<item idref="182" type="com.j2fe.workflow.definition.Transition"/>
<item id="193" type="com.j2fe.workflow.definition.Transition">
<name id="194">goto-next</name>
<source id="195">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="196"/>
<directJoin>false</directJoin>
<name id="197">Move File To Processed</name>
<nodeHandler>com.j2fe.general.activities.FileOperator</nodeHandler>
<nodeHandlerClass id="198">com.j2fe.general.activities.FileOperator</nodeHandlerClass>
<parameters id="199" type="java.util.HashSet">
<item id="200" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="201">operationToPerform</name>
<stringValue id="202">Move</stringValue>
<type>CONSTANT</type>
</item>
<item id="203" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="204">sourceDirectory</name>
<stringValue id="205">AlacraInboundLocalDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="206" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="207">sourceFileName</name>
<stringValue id="208">AlacraResponseFileName</stringValue>
<type>VARIABLE</type>
</item>
<item id="209" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="210">sourceFileSystem</name>
<stringValue id="211">filesystem/local</stringValue>
<type>REFERENCE</type>
</item>
<item id="212" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="213">targetDirectory</name>
<stringValue id="214">AlacraInboundProcessedDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="215" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="216">targetFileName</name>
<stringValue id="217">AlacraResponseFileName</stringValue>
<type>VARIABLE</type>
</item>
<item id="218" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="219">targetFileSystem</name>
<stringValue id="220">filesystem/local</stringValue>
<type>REFERENCE</type>
</item>
</parameters>
<sources id="221" type="java.util.HashSet">
<item id="222" type="com.j2fe.workflow.definition.Transition">
<name id="223">goto-next</name>
<source id="224">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="225"/>
<directJoin>false</directJoin>
<name id="226">Set VREQ LAST_CHG_USR_ID</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="227">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="228" type="java.util.HashSet">
<item id="229" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="230">database</name>
<stringValue id="231">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="232" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="233">indexedParameters[0]</name>
<stringValue id="234">VND_RQST_OID</stringValue>
<type>VARIABLE</type>
<variablePart id="235">[0]</variablePart>
</item>
<item id="236" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="237">querySQL</name>
<stringValue id="238">update ft_t_vreq set last_chg_usr_id = 'AlacraInboundMonthly' where vnd_rqst_oid = ?</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="239" type="java.util.HashSet">
<item id="240" type="com.j2fe.workflow.definition.Transition">
<name id="241">goto-next</name>
<source id="242">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="243"/>
<directJoin>false</directJoin>
<name id="244">Update Request Status  #2</name>
<nodeHandler>com.j2fe.feeds.request.UpdateVREQ</nodeHandler>
<nodeHandlerClass id="245">com.j2fe.feeds.request.UpdateVREQ</nodeHandlerClass>
<parameters id="246" type="java.util.HashSet">
<item id="247" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="248">requestOIDs</name>
<stringValue id="249">VND_RQST_OID</stringValue>
<type>VARIABLE</type>
</item>
<item id="250" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="251">status</name>
<stringValue id="252">CLOSED</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="253" type="java.util.HashSet">
<item id="254" type="com.j2fe.workflow.definition.Transition">
<name id="255">goto-next</name>
<source id="256">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="257"/>
<directJoin>false</directJoin>
<name id="258">Fetch specific VREQ row</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="259">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="260" type="java.util.HashSet">
<item id="261" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="262">database</name>
<stringValue id="263">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="264" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="265">firstColumnsResult</name>
<stringValue id="266">VND_RQST_OID</stringValue>
<type>VARIABLE</type>
</item>
<item id="267" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="268">[0]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="269">indexedParameters[0]</name>
<stringValue id="270">AlacraResponseFileName</stringValue>
<type>VARIABLE</type>
</item>
<item id="271" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="272">querySQL</name>
<stringValue id="273">SELECT VND_RQST_OID&#13;
FROM FT_T_VREQ&#13;
WHERE DATA_SRC_ID = 'ALACRA'&#13;
AND VND_RESP_FILE_NME = ?&#13;
AND VND_RQST_STAT_TYP = 'REQUESTED'&#13;
LIMIT 1</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="274" type="java.util.HashSet">
<item id="275" type="com.j2fe.workflow.definition.Transition">
<name id="276">not-empty</name>
<source idref="160"/>
<target idref="256"/>
</item>
</sources>
<targets id="277" type="java.util.HashSet">
<item idref="254" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="242"/>
</item>
</sources>
<targets id="278" type="java.util.HashSet">
<item idref="240" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="224"/>
</item>
</sources>
<targets id="279" type="java.util.HashSet">
<item idref="222" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="195"/>
</item>
</sources>
<targets id="280" type="java.util.HashSet">
<item idref="193" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="184"/>
</item>
</sources>
<targets id="281" type="java.util.HashSet">
<item id="282" type="com.j2fe.workflow.definition.Transition">
<name id="283">goto-next</name>
<source idref="184"/>
<target id="284">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="285"/>
<directJoin>false</directJoin>
<name id="286">Close Job</name>
<nodeHandler>com.j2fe.streetlamp.activities.CloseJob</nodeHandler>
<nodeHandlerClass id="287">com.j2fe.streetlamp.activities.CloseJob</nodeHandlerClass>
<parameters id="288" type="java.util.HashSet">
<item id="289" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="290">jobId</name>
<stringValue id="291">JobID</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="292" type="java.util.HashSet">
<item idref="282" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="293" type="java.util.HashSet">
<item id="294" type="com.j2fe.workflow.definition.Transition">
<name id="295">goto-next</name>
<source idref="284"/>
<target idref="37"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item idref="275" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
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
<target idref="37"/>
</item>
<item idref="294" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="296" type="java.util.HashSet">
<item idref="35" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="30"/>
</item>
<item id="297" type="com.j2fe.workflow.definition.Transition">
<name id="298">rows-found</name>
<source id="299">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="300"/>
<directJoin>false</directJoin>
<name id="301">Fetch unprocessed VREQ</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="302">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="303" type="java.util.HashSet">
<item id="304" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="305">database</name>
<stringValue id="306">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="307" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="308">mappedResult</name>
<stringValue id="309">VREQToProcess</stringValue>
<type>VARIABLE</type>
</item>
<item id="310" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="311">querySQL</name>
<stringValue id="312">SELECT DISTINCT VND_RESP_FILE_NME AS "AlacraResponseFileName",     VND_RQST_TMS AS "AlacraRequestDate" FROM FT_T_VREQ   WHERE DATA_SRC_ID = 'ALACRA'   AND VND_RQST_STAT_TYP = 'REQUESTED'   AND VND_RESP_FILE_NME LIKE '%.oum' ORDER BY VND_RQST_TMS</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="313" type="java.util.HashSet">
<item id="314" type="com.j2fe.workflow.definition.Transition">
<name id="315">goto-next</name>
<source id="316">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="317"/>
<directJoin>false</directJoin>
<name id="318">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="319">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="320" type="java.util.HashSet"/>
<targets id="321" type="java.util.HashSet">
<item idref="314" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="299"/>
</item>
</sources>
<targets id="322" type="java.util.HashSet">
<item id="323" type="com.j2fe.workflow.definition.Transition">
<name id="324">nothing-found</name>
<source idref="299"/>
<target idref="3"/>
</item>
<item idref="297" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="30"/>
</item>
</sources>
<targets id="325" type="java.util.HashSet">
<item idref="28" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="10"/>
</item>
</sources>
<targets id="326" type="java.util.HashSet">
<item idref="8" type="com.j2fe.workflow.definition.Transition"/>
<item idref="62" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="3"/>
</item>
<item idref="323" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="327" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="328">Custom/Dataloads/IssuerMerge</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="329">user1</lastChangeUser>
<lastUpdate id="330">2025-11-19T21:27:08.000+0000</lastUpdate>
<name id="331">AlacraInboundMonthly</name>
<nodes id="332" type="java.util.HashSet">
<item idref="67" type="com.j2fe.workflow.definition.Node"/>
<item idref="284" type="com.j2fe.workflow.definition.Node"/>
<item idref="184" type="com.j2fe.workflow.definition.Node"/>
<item idref="130" type="com.j2fe.workflow.definition.Node"/>
<item idref="88" type="com.j2fe.workflow.definition.Node"/>
<item idref="109" type="com.j2fe.workflow.definition.Node"/>
<item idref="256" type="com.j2fe.workflow.definition.Node"/>
<item idref="299" type="com.j2fe.workflow.definition.Node"/>
<item idref="160" type="com.j2fe.workflow.definition.Node"/>
<item idref="44" type="com.j2fe.workflow.definition.Node"/>
<item idref="10" type="com.j2fe.workflow.definition.Node"/>
<item idref="30" type="com.j2fe.workflow.definition.Node"/>
<item idref="195" type="com.j2fe.workflow.definition.Node"/>
<item idref="37" type="com.j2fe.workflow.definition.Node"/>
<item idref="224" type="com.j2fe.workflow.definition.Node"/>
<item idref="316" type="com.j2fe.workflow.definition.Node"/>
<item idref="3" type="com.j2fe.workflow.definition.Node"/>
<item idref="242" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>true</optimize>
<parameter id="333" type="java.util.HashMap">
<entry>
<key id="334" type="java.lang.String">AlacraInboundLocalDirectory</key>
<value id="335" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="336">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="337" type="java.lang.String">AlacraInboundProcessedDirectory</key>
<value id="338" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="339">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="340">path of the directory to put the processed file</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="341" type="java.lang.String">AlacraInboundRemoteDirectory</key>
<value id="342" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="343">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="344" type="java.lang.String">BaseFileName</key>
<value id="345" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="346">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="347" type="java.lang.String">File</key>
<value id="348" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="349">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="350" type="java.lang.String">InboundAlacraID</key>
<value id="351" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="352">java.lang.Object</className>
<clazz>java.lang.Object</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="353" type="java.lang.String">ParentJobID</key>
<value id="354" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="355">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="356" type="java.lang.String">entityType</key>
<value id="357" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="358">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="359">The Entity which needs to be considered for merge. e.g ISSR or FINS. By default the value is ISSR.</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="360" type="java.lang.String">outputFileDirectory</key>
<value id="361" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="362">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="363">directory of the file which contains list of OID for which CNST entry is not created.</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="364" type="java.lang.String">outputFileName</key>
<value id="365" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="366">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="367">file which contains list of OID for which CNST entry is not created.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
</parameter>
<permissions id="368" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>true</purgeAtEnd>
<retries>0</retries>
<startNode idref="316"/>
<status>RELEASED</status>
<variables id="369" type="java.util.HashMap">
<entry>
<key id="370" type="java.lang.String">AlacraInboundLocalDirectory</key>
<value id="371" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="372">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="373" type="java.lang.String">AlacraInboundProcessedDirectory</key>
<value id="374" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="375">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="376">path of the directory to put the processed file</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="377" type="java.lang.String">AlacraInboundRemoteDirectory</key>
<value id="378" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="379">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="380" type="java.lang.String">downloads</value>
</value>
</entry>
<entry>
<key id="381" type="java.lang.String">BaseFileName</key>
<value id="382" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="383">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="384" type="java.lang.String">Alacra_DeDup_File_</value>
</value>
</entry>
<entry>
<key id="385" type="java.lang.String">File</key>
<value id="386" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="387">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="388" type="java.lang.String">InboundAlacraID</key>
<value id="389" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="390">java.lang.Object</className>
<clazz>java.lang.Object</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="391" type="java.lang.String">JobID</key>
<value id="392" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="393">java.lang.Object</className>
<clazz>java.lang.Object</clazz>
<description id="394">jobID of the task</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="395" type="java.lang.String">ParentJobID</key>
<value id="396" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="397">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="398" type="java.lang.String">entityType</key>
<value id="399" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="400">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="401">The Entity which needs to be considered for merge. e.g ISSR or FINS. By default the value is ISSR.</description>
<persistent>false</persistent>
<value id="402" type="java.lang.String">FINS</value>
</value>
</entry>
<entry>
<key id="403" type="java.lang.String">forLoopCnt</key>
<value id="404" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="405">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<persistent>false</persistent>
<value id="406" type="java.lang.Integer">0</value>
</value>
</entry>
<entry>
<key id="407" type="java.lang.String">outputFileDirectory</key>
<value id="408" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="409">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="410">directory of the file which contains list of OID for which CNST entry is not created.</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="411" type="java.lang.String">outputFileName</key>
<value id="412" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="413">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="414">file which contains list of OID for which CNST entry is not created.</description>
<persistent>false</persistent>
</value>
</entry>
</variables>
<version>10</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
