<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.07">
<package-comment/>
<businessobject displayString="6 - Multiple load fix" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>true</alwaysPersist>
<clustered>false</clustered>
<comment id="1">Multiple load fix</comment>
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
<name id="8">end-loop</name>
<source id="9">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="10"/>
<directJoin>false</directJoin>
<name id="11">Loop through unprocessed Alacra Response Files</name>
<nodeHandler>com.j2fe.workflow.handler.impl.ForEach</nodeHandler>
<nodeHandlerClass id="12">com.j2fe.workflow.handler.impl.ForEach</nodeHandlerClass>
<parameters id="13" type="java.util.HashSet">
<item id="14" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="15">counter</name>
<stringValue id="16">forLoopCnt</stringValue>
<type>VARIABLE</type>
</item>
<item id="17" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="18">counter</name>
<stringValue id="19">forLoopCnt</stringValue>
<type>VARIABLE</type>
</item>
<item id="20" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="21">input</name>
<stringValue id="22">VREQToProcess</stringValue>
<type>VARIABLE</type>
</item>
<item id="23" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="24">outputObjects[0]["AlacraResponseFileName"]</name>
<stringValue id="25">AlacraResponseFileName</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="26" type="java.util.HashSet">
<item id="27" type="com.j2fe.workflow.definition.Transition">
<name id="28">goto-next</name>
<source id="29">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="30"/>
<directJoin>false</directJoin>
<name id="31">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="32">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="33" type="java.util.HashSet">
<item id="34" type="com.j2fe.workflow.definition.Transition">
<name id="35">goto-next</name>
<source id="36">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="37"/>
<directJoin>false</directJoin>
<name id="38">NOP</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="39">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="40" type="java.util.HashSet">
<item id="41" type="com.j2fe.workflow.definition.Transition">
<name id="42">empty</name>
<source id="43">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="44"/>
<directJoin>false</directJoin>
<name id="45">List Files on Alacra Server</name>
<nodeHandler>com.j2fe.feeds.activities.ListFiles</nodeHandler>
<nodeHandlerClass id="46">com.j2fe.feeds.activities.ListFiles</nodeHandlerClass>
<parameters id="47" type="java.util.HashSet">
<item id="48" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="49">directory</name>
<stringValue id="50">AlacraInboundRemoteDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="51" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="52">fileSystem</name>
<stringValue id="53">filesystem/sftp/Alacra</stringValue>
<type>REFERENCE</type>
</item>
<item id="54" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="55">fileSystemId</name>
<stringValue id="56">filesystem/sftp/Alacra/user</stringValue>
<type>REFERENCE</type>
</item>
<item id="57" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="58">pattern[0]</name>
<stringValue id="59">AlacraResponseFileName</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="60" type="java.util.HashSet">
<item id="61" type="com.j2fe.workflow.definition.Transition">
<name id="62">loop</name>
<source idref="9"/>
<target idref="43"/>
</item>
</sources>
<targets id="63" type="java.util.HashSet">
<item idref="41" type="com.j2fe.workflow.definition.Transition"/>
<item id="64" type="com.j2fe.workflow.definition.Transition">
<name id="65">not-empty</name>
<source idref="43"/>
<target id="66">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="67"/>
<directJoin>false</directJoin>
<name id="68">Bean Shell Script (Standard)</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="69">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="70" type="java.util.HashSet">
<item id="71" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="72">statements</name>
<stringValue id="73">String JOB_INPUT_TXT = "sftp:/" + FilePath +"/" + FileName;&#13;
</stringValue>
<type>CONSTANT</type>
</item>
<item id="74" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="75">variables["FileName"]</name>
<stringValue id="76">AlacraResponseFileName</stringValue>
<type>VARIABLE</type>
</item>
<item id="77" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="78">variables["FilePath"]</name>
<stringValue id="79">AlacraInboundRemoteDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="80" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="81">variables["JOB_INPUT_TXT"]</name>
<stringValue id="82">JOB_INPUT_TXT</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="83" type="java.util.HashSet">
<item idref="64" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="84" type="java.util.HashSet">
<item id="85" type="com.j2fe.workflow.definition.Transition">
<name id="86">goto-next</name>
<source idref="66"/>
<target id="87">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="88"/>
<directJoin>false</directJoin>
<name id="89">Create Job</name>
<nodeHandler>com.j2fe.streetlamp.activities.CreateJob</nodeHandler>
<nodeHandlerClass id="90">com.j2fe.streetlamp.activities.CreateJob</nodeHandlerClass>
<parameters id="91" type="java.util.HashSet">
<item id="92" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="93">configInfo</name>
<stringValue id="94">AlacraInbound</stringValue>
<type>CONSTANT</type>
</item>
<item id="95" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="96">file</name>
<stringValue id="97">JOB_INPUT_TXT</stringValue>
<type>VARIABLE</type>
</item>
<item id="98" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="99">jobId</name>
<stringValue id="100">JobID</stringValue>
<type>VARIABLE</type>
</item>
<item id="101" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="102">parentJobId</name>
<stringValue id="103">ParentJobID</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="104" type="java.util.HashSet">
<item idref="85" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="105" type="java.util.HashSet">
<item id="106" type="com.j2fe.workflow.definition.Transition">
<name id="107">goto-next</name>
<source idref="87"/>
<target id="108">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="109"/>
<directJoin>false</directJoin>
<name id="110">Create Transaction</name>
<nodeHandler>com.j2fe.streetlamp.activities.CreateTransaction</nodeHandler>
<nodeHandlerClass id="111">com.j2fe.streetlamp.activities.CreateTransaction</nodeHandlerClass>
<parameters id="112" type="java.util.HashSet">
<item id="113" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="114">jobId</name>
<stringValue id="115">JobID</stringValue>
<type>VARIABLE</type>
</item>
<item id="116" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="117">originalMessage</name>
<stringValue id="118">OriginalMessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="119" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="120">originalMessageType</name>
<stringValue id="121">OriginalMessageType</stringValue>
<type>VARIABLE</type>
</item>
<item id="122" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="123">transactionId</name>
<stringValue id="124">TransactionID</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="125" type="java.util.HashSet">
<item idref="106" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="126" type="java.util.HashSet">
<item id="127" type="com.j2fe.workflow.definition.Transition">
<name id="128">goto-next</name>
<source idref="108"/>
<target id="129">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="130"/>
<directJoin>false</directJoin>
<name id="131">Copy File To Temp</name>
<nodeHandler>com.j2fe.general.activities.FileOperator</nodeHandler>
<nodeHandlerClass id="132">com.j2fe.general.activities.FileOperator</nodeHandlerClass>
<parameters id="133" type="java.util.HashSet">
<item id="134" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="135">operationToPerform</name>
<stringValue id="136">Copy</stringValue>
<type>CONSTANT</type>
</item>
<item id="137" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="138">sourceDirectory</name>
<stringValue id="139">AlacraInboundRemoteDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="140" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="141">sourceFileName</name>
<stringValue id="142">AlacraResponseFileName</stringValue>
<type>VARIABLE</type>
</item>
<item id="143" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="144">sourceFileSystem</name>
<stringValue id="145">filesystem/sftp/Alacra</stringValue>
<type>REFERENCE</type>
</item>
<item id="146" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="147">targetDirectory</name>
<stringValue id="148">AlacraInboundLocalDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="149" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="150">targetFileName</name>
<stringValue id="151">AlacraResponseFileName</stringValue>
<type>VARIABLE</type>
</item>
<item id="152" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="153">targetFileSystem</name>
<stringValue id="154">filesystem/local</stringValue>
<type>REFERENCE</type>
</item>
</parameters>
<sources id="155" type="java.util.HashSet">
<item idref="127" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="156" type="java.util.HashSet">
<item id="157" type="com.j2fe.workflow.definition.Transition">
<name id="158">goto-next</name>
<source idref="129"/>
<target id="159">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="160"/>
<directJoin>false</directJoin>
<name id="161">List Files</name>
<nodeHandler>com.j2fe.feeds.activities.ListFiles</nodeHandler>
<nodeHandlerClass id="162">com.j2fe.feeds.activities.ListFiles</nodeHandlerClass>
<parameters id="163" type="java.util.HashSet">
<item id="164" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="165">directory</name>
<stringValue id="166">AlacraInboundLocalDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="167" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="168">fileSystem</name>
<stringValue id="169">filesystem/local</stringValue>
<type>REFERENCE</type>
</item>
<item id="170" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="171">list</name>
<stringValue id="172">FileList</stringValue>
<type>VARIABLE</type>
</item>
<item id="173" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="174">pattern[0]</name>
<stringValue id="175">AlacraResponseFileName</stringValue>
<type>VARIABLE</type>
</item>
<item id="176" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="177">uris</name>
<stringValue id="178">URIList</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="179" type="java.util.HashSet">
<item idref="157" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="180" type="java.util.HashSet">
<item id="181" type="com.j2fe.workflow.definition.Transition">
<name id="182">empty</name>
<source idref="159"/>
<target id="183">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="184"/>
<directJoin>false</directJoin>
<name id="185">Command Line</name>
<nodeHandler>com.j2fe.general.activities.CommandLine</nodeHandler>
<nodeHandlerClass id="186">com.j2fe.general.activities.CommandLine</nodeHandlerClass>
<parameters id="187" type="java.util.HashSet">
<item id="188" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="189">commandLine</name>
<stringValue id="190">mv *.out ../processed</stringValue>
<type>CONSTANT</type>
</item>
<item id="191" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="192">directory</name>
<stringValue id="193">AlacraInboundLocalDirectory</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="194" type="java.util.HashSet">
<item idref="181" type="com.j2fe.workflow.definition.Transition"/>
<item id="195" type="com.j2fe.workflow.definition.Transition">
<name id="196">goto-next</name>
<source id="197">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="198"/>
<directJoin>true</directJoin>
<name id="199">Synchronize</name>
<nodeHandler>com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandler>
<nodeHandlerClass id="200">com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandlerClass>
<sources id="201" type="java.util.HashSet">
<item id="202" type="com.j2fe.workflow.definition.Transition">
<name id="203">goto-next</name>
<source id="204">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="205"/>
<directJoin>false</directJoin>
<name id="206">Set VREQ LAST_CHG_USR_ID</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="207">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="208" type="java.util.HashSet">
<item id="209" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="210">database</name>
<stringValue id="211">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="212" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="213">indexedParameters[0]</name>
<stringValue id="214">VND_RQST_OID</stringValue>
<type>VARIABLE</type>
<variablePart id="215">[0]</variablePart>
</item>
<item id="216" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="217">querySQL</name>
<stringValue id="218">update ft_t_vreq set last_chg_usr_id = 'AlacraInbound' where vnd_rqst_oid = ?</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="219" type="java.util.HashSet">
<item id="220" type="com.j2fe.workflow.definition.Transition">
<name id="221">goto-next</name>
<source id="222">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="223"/>
<directJoin>false</directJoin>
<name id="224">Insert FIID Row</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="225">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="226" type="java.util.HashSet">
<item id="227" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="228">database</name>
<stringValue id="229">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="230" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="231">indexedParameters[0]</name>
<stringValue id="232">hibernatingEntity</stringValue>
<type>VARIABLE</type>
</item>
<item id="233" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="234">indexedParameters[1]</name>
<stringValue id="235">InboundAlacraID</stringValue>
<type>VARIABLE</type>
</item>
<item id="236" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="237">indexedParameters[2]</name>
<stringValue id="238">InboundVendorID</stringValue>
<type>VARIABLE</type>
</item>
<item id="239" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="240">indexedParameters[3]</name>
<stringValue id="241">hibernatingEntity</stringValue>
<type>VARIABLE</type>
</item>
<item id="242" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="243">indexedParameters[4]</name>
<stringValue id="244">InboundAlacraID</stringValue>
<type>VARIABLE</type>
</item>
<item id="245" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="246">querySQL</name>
<stringValue id="247">INSERT INTO FT_T_FIID &#13;
(FIID_OID, INST_MNEM, FINS_ID_CTXT_TYP, FINS_ID, INST_USAGE_TYP, START_TMS, LAST_CHG_TMS, LAST_CHG_USR_ID, DATA_STAT_TYP, DATA_SRC_ID) &#13;
select   &#13;
   new_oid()&#13;
   ,?&#13;
   ,'ALACRAID'&#13;
   ,?&#13;
   ,?&#13;
   ,sysdate()&#13;
   ,sysdate()&#13;
   ,'AlacraInbound'&#13;
   ,'ACTIVE'&#13;
   ,'ALACRA' from dual where not exists (select 1 from ft_t_fiid where inst_mnem = ? and fins_id = ?)</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="248" type="java.util.HashSet">
<item id="249" type="com.j2fe.workflow.definition.Transition">
<name id="250">goto-next</name>
<source id="251">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="252"/>
<directJoin>false</directJoin>
<name id="253">Set VREQ Alacra 0000000</name>
<nodeHandler>com.j2fe.feeds.request.UpdateVREQ</nodeHandler>
<nodeHandlerClass id="254">com.j2fe.feeds.request.UpdateVREQ</nodeHandlerClass>
<parameters id="255" type="java.util.HashSet">
<item id="256" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="257">requestOIDs</name>
<stringValue id="258">VND_RQST_OID</stringValue>
<type>VARIABLE</type>
</item>
<item id="259" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="260">status</name>
<stringValue id="261">CLOSED</stringValue>
<type>CONSTANT</type>
</item>
<item id="262" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="263">statusText</name>
<stringValue id="264">No BBCMPYID on Alacra database</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="265" type="java.util.HashSet">
<item id="266" type="com.j2fe.workflow.definition.Transition">
<name id="267">0000000</name>
<source id="268">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="269"/>
<directJoin>false</directJoin>
<name id="270">Is BBCMPYID 0000000</name>
<nodeHandler>com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandler>
<nodeHandlerClass id="271">com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandlerClass>
<parameters id="272" type="java.util.HashSet">
<item id="273" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="274">caseItem</name>
<stringValue id="275">survivingBBCMPYID</stringValue>
<type>VARIABLE</type>
</item>
<item id="276" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="277">defaultItem</name>
<stringValue id="278">OTHERS</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="279" type="java.util.HashSet">
<item id="280" type="com.j2fe.workflow.definition.Transition">
<name id="281">OTHERS</name>
<source id="282">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="283"/>
<directJoin>false</directJoin>
<name id="284">Is Alacra ID 0000000</name>
<nodeHandler>com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandler>
<nodeHandlerClass id="285">com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandlerClass>
<parameters id="286" type="java.util.HashSet">
<item id="287" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="288">caseItem</name>
<stringValue id="289">InboundAlacraID</stringValue>
<type>VARIABLE</type>
</item>
<item id="290" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="291">defaultItem</name>
<stringValue id="292">OTHERS</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<persistentVariables id="293" type="java.util.HashSet">
<item id="294" type="java.lang.String">InboundAlacraID
1000</item>
</persistentVariables>
<sources id="295" type="java.util.HashSet">
<item id="296" type="com.j2fe.workflow.definition.Transition">
<name id="297">goto-next</name>
<source id="298">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="299"/>
<directJoin>false</directJoin>
<name id="300">Fetch specific VREQ row</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="301">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="302" type="java.util.HashSet">
<item id="303" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="304">database</name>
<stringValue id="305">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="306" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="307">firstColumnsResult</name>
<stringValue id="308">VND_RQST_OID</stringValue>
<type>VARIABLE</type>
</item>
<item id="309" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="310">[0]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="311">indexedParameters[0]</name>
<stringValue id="312">AlacraResponseFileName</stringValue>
<type>VARIABLE</type>
</item>
<item id="313" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="314">indexedParameters[1]</name>
<stringValue id="315">InboundVendorID</stringValue>
<type>VARIABLE</type>
</item>
<item id="316" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="317">querySQL</name>
<stringValue id="318">SELECT VND_RQST_OID&#13;
FROM FT_T_VREQ&#13;
WHERE DATA_SRC_ID = 'ALACRA'&#13;
AND VND_RESP_FILE_NME = ?&#13;
AND VND_RQST_XREF_ID = ?&#13;
AND VND_RQST_STAT_TYP = 'REQUESTED'&#13;
LIMIT 1</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<persistentVariables id="319" type="java.util.HashSet">
<item id="320" type="java.lang.String">InboundAlacraID
1000</item>
</persistentVariables>
<sources id="321" type="java.util.HashSet">
<item id="322" type="com.j2fe.workflow.definition.Transition">
<name id="323">goto-next</name>
<source id="324">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="325"/>
<directJoin>false</directJoin>
<name id="326">Bean Shell Script (Standard) #2</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="327">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="328" type="java.util.HashSet">
<item id="329" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="330">statements</name>
<stringValue id="331">String survivingBBCMPYID=(String) entry.get("survivingBBCMPYID");&#13;
String hibernatingOID=(String) entry.get("hibernatingOID");&#13;
String InboundAlacraID=(String) entry.get("InboundAlacraID");&#13;
String InboundVendorID=(String) entry.get("InboundVendorID");&#13;
</stringValue>
<type>CONSTANT</type>
</item>
<item id="332" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="333">variables["InboundAlacraID"]</name>
<stringValue id="334">InboundAlacraID</stringValue>
<type>VARIABLE</type>
</item>
<item id="335" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="336">variables["InboundVendorID"]</name>
<stringValue id="337">InboundVendorID</stringValue>
<type>VARIABLE</type>
</item>
<item id="338" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="339">variables["entry"]</name>
<stringValue id="340">mapEntry</stringValue>
<type>VARIABLE</type>
</item>
<item id="341" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="342">["hibernatingOID"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="343">variables["hibernatingOID"]</name>
<stringValue id="344">hibernatingEntity</stringValue>
<type>VARIABLE</type>
</item>
<item id="345" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="346">["survivingBBCMPYID"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="347">variables["survivingBBCMPYID"]</name>
<stringValue id="348">survivingBBCMPYID</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<persistentVariables id="349" type="java.util.HashSet">
<item id="350" type="java.lang.String">InboundAlacraID
1000</item>
</persistentVariables>
<sources id="351" type="java.util.HashSet">
<item id="352" type="com.j2fe.workflow.definition.Transition">
<name id="353">goto-next</name>
<source id="354">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="355"/>
<directJoin>true</directJoin>
<name id="356">For Each Split</name>
<nodeHandler>com.j2fe.workflow.handler.impl.GenericSplit</nodeHandler>
<nodeHandlerClass id="357">com.j2fe.workflow.handler.impl.GenericSplit</nodeHandlerClass>
<parameters id="358" type="java.util.HashSet">
<item id="359" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="360">input</name>
<stringValue id="361">instructionList</stringValue>
<type>VARIABLE</type>
</item>
<item id="362" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="363">output</name>
<stringValue id="364">mapEntry</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="365" type="java.util.HashSet">
<item id="366" type="com.j2fe.workflow.definition.Transition">
<name id="367">goto-next</name>
<source id="368">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="369"/>
<directJoin>false</directJoin>
<name id="370">Extract Data From Alacra Feed</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="371">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="372" type="java.util.HashSet">
<item id="373" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="374">statements</name>
<objectValue id="375" type="java.lang.String">import java.io.BufferedReader;&#13;
import java.io.File;&#13;
import java.io.FileReader;&#13;
import java.io.FileWriter;&#13;
import java.io.IOException;&#13;
import java.io.PrintWriter;&#13;
import java.net.URI;&#13;
import java.net.URISyntaxException;&#13;
import java.util.ArrayList;&#13;
import java.util.HashMap;&#13;
import java.util.Iterator;&#13;
import java.util.List;&#13;
import java.util.Map;&#13;
&#13;
&#13;
BufferedReader inputStream = null;&#13;
File inputFile = new File(File.toString());  &#13;
			inputStream = new BufferedReader(new FileReader(inputFile));&#13;
			String line;&#13;
			int indexGSHibernatingid = 0;&#13;
			int indexVendorID = 0;&#13;
			int indexAlacraID = 0;&#13;
			int indexAlacra_BB_Primary_id =0;&#13;
			int indexAlacra_BB_Secondary_id =0;&#13;
			List instructionList = new ArrayList();&#13;
			String [] splitLine;&#13;
                    // String  secondaryIDEnabled=enableSecondaryID;&#13;
                     &#13;
                     line=inputStream.readLine();&#13;
			splitLine = line.split("\\|");&#13;
			if(splitLine !=null &amp;&amp; !"".equals(splitLine)) {&#13;
				for (int i=0;i&lt;splitLine.length;i++) {&#13;
					if(splitLine[i] != null &amp;&amp; "GS_OID".equalsIgnoreCase(splitLine[i])) {&#13;
						indexGSHibernatingid=i;&#13;
					}&#13;
					if(splitLine[i] != null &amp;&amp; "VENDOR_ID".equalsIgnoreCase(splitLine[i])) {&#13;
						indexVendorID=i;&#13;
					}&#13;
					if(splitLine[i] != null &amp;&amp; "ALACRA_ID".equalsIgnoreCase(splitLine[i])) {&#13;
						indexAlacraID=i;&#13;
					}&#13;
					if(splitLine[i] != null &amp;&amp; "ALACRA_BBG_ID_PRIM".equalsIgnoreCase(splitLine[i])) {&#13;
						indexAlacra_BB_Primary_id=i;&#13;
					}&#13;
					if(splitLine[i] != null &amp;&amp; "ALACRA_BBG_ID_SEC".equalsIgnoreCase(splitLine[i])) {&#13;
						indexAlacra_BB_Secondary_id=i;&#13;
					}&#13;
&#13;
				} &#13;
			}&#13;
&#13;
&#13;
			while ((line = inputStream.readLine()) != null) {&#13;
				splitLine = line.split("\\|");&#13;
				String hibernatingEntityOID=null;&#13;
				String InboundVendorID=null;&#13;
				String InboundAlacraID=null;&#13;
				String survivingAlacraBBGPrimary=null;&#13;
				String survivingAlacraBBGSecondary=null;&#13;
&#13;
&#13;
				if(splitLine !=null &amp;&amp; indexGSHibernatingid&lt;splitLine.length) {&#13;
					hibernatingEntityOID=splitLine[indexGSHibernatingid];&#13;
				}&#13;
&#13;
				if(splitLine !=null &amp;&amp; indexVendorID&lt;splitLine.length) {&#13;
					InboundVendorID=splitLine[indexVendorID];&#13;
				}&#13;
				if(splitLine !=null &amp;&amp; indexAlacraID&lt;splitLine.length) {&#13;
					InboundAlacraID=splitLine[indexAlacraID];&#13;
				}&#13;
&#13;
				if(splitLine !=null &amp;&amp; indexAlacra_BB_Primary_id&lt;splitLine.length) {&#13;
					survivingAlacraBBGPrimary=splitLine[indexAlacra_BB_Primary_id];&#13;
				}&#13;
                 &#13;
&#13;
//                   if(enableSecondaryID) {&#13;
//				if(splitLine !=null &amp;&amp; indexAlacra_BB_Secondary_id&lt;splitLine.length) {&#13;
//					survivingAlacraBBGSecondary=splitLine[indexAlacra_BB_Secondary_id];&#13;
//				}&#13;
//                    }&#13;
&#13;
				if(hibernatingEntityOID != null &amp;&amp; !"".equalsIgnoreCase(hibernatingEntityOID) &amp;&amp; survivingAlacraBBGPrimary != null &amp;&amp; !"".equalsIgnoreCase(survivingAlacraBBGPrimary)) {&#13;
					Map entrymap=new HashMap();&#13;
					entrymap.put("hibernatingOID", hibernatingEntityOID);&#13;
					entrymap.put("survivingBBCMPYID", survivingAlacraBBGPrimary);&#13;
					entrymap.put("InboundVendorID", InboundVendorID);&#13;
					entrymap.put("InboundAlacraID", InboundAlacraID);&#13;
					instructionList.add(entrymap);&#13;
&#13;
				}&#13;
				if(hibernatingEntityOID != null &amp;&amp; !"".equalsIgnoreCase(hibernatingEntityOID) &amp;&amp; survivingAlacraBBGSecondary != null &amp;&amp; !"".equalsIgnoreCase(survivingAlacraBBGSecondary)) {&#13;
					Map entrymap=new HashMap();&#13;
					entrymap.put("hibernatingOID", hibernatingEntityOID);&#13;
					entrymap.put("survivingBBCMPYID", survivingAlacraBBGSecondary);&#13;
					entrymap.put("InboundVendorID", InboundVendorID);&#13;
					entrymap.put("InboundAlacraID", InboundAlacraID);&#13;
					instructionList.add(entrymap);&#13;
&#13;
				}&#13;
&#13;
			}</objectValue>
<type>CONSTANT</type>
</item>
<item id="376" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="377">variables["File"]</name>
<stringValue id="378">FileList</stringValue>
<type>VARIABLE</type>
<variablePart id="379">[0].name</variablePart>
</item>
<item id="380" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="381">variables["instructionList"]</name>
<stringValue id="382">instructionList</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="383" type="java.util.HashSet">
<item id="384" type="com.j2fe.workflow.definition.Transition">
<name id="385">not-empty</name>
<source idref="159"/>
<target idref="368"/>
</item>
</sources>
<targets id="386" type="java.util.HashSet">
<item idref="366" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="354"/>
</item>
</sources>
<targets id="387" type="java.util.HashSet">
<item idref="352" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDSPLIT</type>
</source>
<target idref="324"/>
</item>
</sources>
<targets id="388" type="java.util.HashSet">
<item idref="322" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="298"/>
</item>
</sources>
<targets id="389" type="java.util.HashSet">
<item idref="296" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="282"/>
</item>
</sources>
<targets id="390" type="java.util.HashSet">
<item id="391" type="com.j2fe.workflow.definition.Transition">
<name id="392">0000000</name>
<source idref="282"/>
<target id="393">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="394"/>
<directJoin>false</directJoin>
<name id="395">Set VREQ Alacra 0000000</name>
<nodeHandler>com.j2fe.feeds.request.UpdateVREQ</nodeHandler>
<nodeHandlerClass id="396">com.j2fe.feeds.request.UpdateVREQ</nodeHandlerClass>
<parameters id="397" type="java.util.HashSet">
<item id="398" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="399">requestOIDs</name>
<stringValue id="400">VND_RQST_OID</stringValue>
<type>VARIABLE</type>
</item>
<item id="401" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="402">status</name>
<stringValue id="403">FAILED</stringValue>
<type>CONSTANT</type>
</item>
<item id="404" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="405">statusText</name>
<stringValue id="406">No match on Alacra database</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="407" type="java.util.HashSet">
<item idref="391" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="408" type="java.util.HashSet">
<item id="409" type="com.j2fe.workflow.definition.Transition">
<name id="410">goto-next</name>
<source idref="393"/>
<target idref="204"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item idref="280" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="268"/>
</item>
</sources>
<targets id="411" type="java.util.HashSet">
<item idref="266" type="com.j2fe.workflow.definition.Transition"/>
<item id="412" type="com.j2fe.workflow.definition.Transition">
<name id="413">OTHERS</name>
<source idref="268"/>
<target id="414">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="415"/>
<directJoin>false</directJoin>
<name id="416">Update VREQ</name>
<nodeHandler>com.j2fe.feeds.request.UpdateVREQ</nodeHandler>
<nodeHandlerClass id="417">com.j2fe.feeds.request.UpdateVREQ</nodeHandlerClass>
<parameters id="418" type="java.util.HashSet">
<item id="419" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="420">requestOIDs</name>
<stringValue id="421">VND_RQST_OID</stringValue>
<type>VARIABLE</type>
</item>
<item id="422" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="423">status</name>
<stringValue id="424">PROCESSING</stringValue>
<type>CONSTANT</type>
</item>
<item id="425" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="426">statusText</name>
<stringValue id="427">InboundAlacraID</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<persistentVariables id="428" type="java.util.HashSet">
<item id="429" type="java.lang.String">InboundAlacraID
1000</item>
</persistentVariables>
<sources id="430" type="java.util.HashSet">
<item idref="412" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="431" type="java.util.HashSet">
<item id="432" type="com.j2fe.workflow.definition.Transition">
<name id="433">goto-next</name>
<source idref="414"/>
<target id="434">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="435"/>
<directJoin>false</directJoin>
<name id="436">Fetch OID for the BBCMPYID</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="437">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="438" type="java.util.HashSet">
<item id="439" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="440">database</name>
<stringValue id="441">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="442" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="443">firstColumnsResult</name>
<stringValue id="444">survivingEntity</stringValue>
<type>VARIABLE</type>
</item>
<item id="445" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="446">indexedParameters[0]</name>
<stringValue id="447">survivingBBCMPYID</stringValue>
<type>VARIABLE</type>
</item>
<item id="448" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="449">querySQL</name>
<stringValue id="450">select INST_MNEM  from ft_t_fiid where FINS_ID=? and DATA_SRC_ID='BB' and END_TMS is null Limit 1</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<persistentVariables id="451" type="java.util.HashSet">
<item id="452" type="java.lang.String">InboundAlacraID
1000</item>
<item id="453" type="java.lang.String">survivingEntity
1000</item>
</persistentVariables>
<sources id="454" type="java.util.HashSet">
<item idref="432" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="455" type="java.util.HashSet">
<item id="456" type="com.j2fe.workflow.definition.Transition">
<name id="457">nothing-found</name>
<source idref="434"/>
<target id="458">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="459"/>
<directJoin>false</directJoin>
<name id="460">Insert FIID Row</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="461">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="462" type="java.util.HashSet">
<item id="463" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="464">database</name>
<stringValue id="465">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="466" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="467">indexedParameters[0]</name>
<stringValue id="468">hibernatingEntity</stringValue>
<type>VARIABLE</type>
</item>
<item id="469" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="470">indexedParameters[1]</name>
<stringValue id="471">InboundAlacraID</stringValue>
<type>VARIABLE</type>
</item>
<item id="472" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="473">indexedParameters[2]</name>
<stringValue id="474">InboundVendorID</stringValue>
<type>VARIABLE</type>
</item>
<item id="475" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="476">indexedParameters[3]</name>
<stringValue id="477">hibernatingEntity</stringValue>
<type>VARIABLE</type>
</item>
<item id="478" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="479">indexedParameters[4]</name>
<stringValue id="480">InboundAlacraID</stringValue>
<type>VARIABLE</type>
</item>
<item id="481" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="482">querySQL</name>
<stringValue id="483">INSERT INTO FT_T_FIID &#13;
(FIID_OID, INST_MNEM, FINS_ID_CTXT_TYP, FINS_ID, INST_USAGE_TYP, START_TMS, LAST_CHG_TMS, LAST_CHG_USR_ID, DATA_STAT_TYP, DATA_SRC_ID) &#13;
select   &#13;
   new_oid()&#13;
   ,?&#13;
   ,'ALACRAID'&#13;
   ,?&#13;
   ,?&#13;
   ,sysdate()&#13;
   ,sysdate()&#13;
   ,'AlacraInbound'&#13;
   ,'ACTIVE'&#13;
   ,'ALACRA' from dual where not exists (select 1 from ft_t_fiid where inst_mnem = ? and fins_id = ?)</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="484" type="java.util.HashSet">
<item idref="456" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="485" type="java.util.HashSet">
<item id="486" type="com.j2fe.workflow.definition.Transition">
<name id="487">goto-next</name>
<source idref="458"/>
<target id="488">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="489"/>
<directJoin>false</directJoin>
<name id="490">Set VREQ no BBCMPYID</name>
<nodeHandler>com.j2fe.feeds.request.UpdateVREQ</nodeHandler>
<nodeHandlerClass id="491">com.j2fe.feeds.request.UpdateVREQ</nodeHandlerClass>
<parameters id="492" type="java.util.HashSet">
<item id="493" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="494">requestOIDs</name>
<stringValue id="495">VND_RQST_OID</stringValue>
<type>VARIABLE</type>
</item>
<item id="496" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="497">status</name>
<stringValue id="498">FAILED</stringValue>
<type>CONSTANT</type>
</item>
<item id="499" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="500">statusText</name>
<stringValue id="501">No FT_T_FIID for surviving BBCMPYID</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="502" type="java.util.HashSet">
<item idref="486" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="503" type="java.util.HashSet">
<item id="504" type="com.j2fe.workflow.definition.Transition">
<name id="505">goto-next</name>
<source idref="488"/>
<target idref="204"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item id="506" type="com.j2fe.workflow.definition.Transition">
<name id="507">rows-found</name>
<source idref="434"/>
<target id="508">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="509"/>
<directJoin>false</directJoin>
<name id="510">Check if CNST entry already exist</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="511">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="512" type="java.util.HashSet">
<item id="513" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="514">database</name>
<stringValue id="515">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="516" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="517">indexedParameters[0]</name>
<stringValue id="518">hibernatingEntity</stringValue>
<type>VARIABLE</type>
</item>
<item id="519" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="520">indexedParameters[1]</name>
<stringValue id="521">survivingEntity</stringValue>
<type>VARIABLE</type>
<variablePart id="522">[0]</variablePart>
</item>
<item id="523" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="524">querySQL</name>
<stringValue id="525">select 1 from ft_t_cnst where TBL_ID='FINS' and CONS_CROSS_REF_ID=? and SURVIVING_CROSS_REF_ID=? and MERGE_STAT_TYP in ('TO MERGE', 'COMPLETE')</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<persistentVariables id="526" type="java.util.HashSet">
<item id="527" type="java.lang.String">InboundAlacraID
1000</item>
<item id="528" type="java.lang.String">survivingEntity
1000</item>
</persistentVariables>
<sources id="529" type="java.util.HashSet">
<item idref="506" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="530" type="java.util.HashSet">
<item id="531" type="com.j2fe.workflow.definition.Transition">
<name id="532">nothing-found</name>
<source idref="508"/>
<target id="533">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="534"/>
<directJoin>false</directJoin>
<name id="535">Insert CNST Row</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="536">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="537" type="java.util.HashSet">
<item id="538" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="539">database</name>
<stringValue id="540">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="541" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="542">indexedParameters[0]</name>
<stringValue id="543">hibernatingEntity</stringValue>
<type>VARIABLE</type>
</item>
<item id="544" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="545">indexedParameters[1]</name>
<stringValue id="546">survivingEntity</stringValue>
<type>VARIABLE</type>
<variablePart id="547">[0]</variablePart>
</item>
<item id="548" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="549">querySQL</name>
<stringValue id="550">Insert into ft_t_cnst (CNST_OID, TBL_ID, CONS_CROSS_REF_ID, HIGHEST_SRC_RANK_NUM, CONS_STAT_TYP, CONS_DATA_SRC_TXT, HIGHEST_DATA_SRC_ID, START_TMS, END_TMS, SURVIVING_CROSS_REF_ID, MERGE_STAT_TYP, LAST_CHG_TMS, LAST_CHG_USR_ID, PROC_NOTES_TXT, USER_CMNT_TXT, MERGE_EXEC_TYP, MERGE_PROC_TYP, PRNT_CNST_OID) values (new_oid(),'FINS',?,1,'NotApplicable', null, null, sysdate(), null,?,'TO MERGE', sysdate(),'AlacraInbound', null, null,'BATCH', null, null)</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<persistentVariables id="551" type="java.util.HashSet">
<item id="552" type="java.lang.String">InboundAlacraID
1000</item>
<item id="553" type="java.lang.String">survivingEntity
1000</item>
</persistentVariables>
<sources id="554" type="java.util.HashSet">
<item idref="531" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="555" type="java.util.HashSet">
<item id="556" type="com.j2fe.workflow.definition.Transition">
<name id="557">goto-next</name>
<source idref="533"/>
<target id="558">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="559"/>
<directJoin>false</directJoin>
<name id="560">Insert FIID Row</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="561">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="562" type="java.util.HashSet">
<item id="563" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="564">database</name>
<stringValue id="565">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="566" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="567">indexedParameters[0]</name>
<stringValue id="568">survivingEntity</stringValue>
<type>VARIABLE</type>
<variablePart id="569">[0]</variablePart>
</item>
<item id="570" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="571">indexedParameters[1]</name>
<stringValue id="572">InboundAlacraID</stringValue>
<type>VARIABLE</type>
</item>
<item id="573" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="574">indexedParameters[2]</name>
<stringValue id="575">InboundVendorID</stringValue>
<type>VARIABLE</type>
</item>
<item id="576" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="577">indexedParameters[3]</name>
<stringValue id="578">survivingEntity</stringValue>
<type>VARIABLE</type>
<variablePart id="579">[0]</variablePart>
</item>
<item id="580" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="581">indexedParameters[4]</name>
<stringValue id="582">InboundAlacraID</stringValue>
<type>VARIABLE</type>
</item>
<item id="583" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="584">querySQL</name>
<stringValue id="585">INSERT INTO FT_T_FIID &#13;
(FIID_OID, INST_MNEM, FINS_ID_CTXT_TYP, FINS_ID, INST_USAGE_TYP, START_TMS, LAST_CHG_TMS, LAST_CHG_USR_ID, DATA_STAT_TYP, DATA_SRC_ID) &#13;
select   &#13;
   new_oid()&#13;
   ,?&#13;
   ,'ALACRAID'&#13;
   ,?&#13;
   ,?&#13;
   ,sysdate()&#13;
   ,sysdate()&#13;
   ,'AlacraInbound'&#13;
   ,'ACTIVE'&#13;
   ,'ALACRA' from dual where not exists (select 1 from ft_t_fiid where inst_mnem = ? and fins_id = ?)</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<persistentVariables id="586" type="java.util.HashSet">
<item id="587" type="java.lang.String">InboundAlacraID
1000</item>
</persistentVariables>
<sources id="588" type="java.util.HashSet">
<item idref="556" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="589" type="java.util.HashSet">
<item id="590" type="com.j2fe.workflow.definition.Transition">
<name id="591">goto-next</name>
<source idref="558"/>
<target id="592">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="593"/>
<directJoin>false</directJoin>
<name id="594">Bean Shell Script (Standard)</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="595">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="596" type="java.util.HashSet">
<item id="597" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="598">statements</name>
<stringValue id="599">String VND_RQST_STAT_TXT = "Matched: Alacra ID " + InboundAlacraID;&#13;
</stringValue>
<type>CONSTANT</type>
</item>
<item id="600" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="601">variables["InboundAlacraID"]</name>
<stringValue id="602">AlacraInboundRemoteDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="603" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="604">variables["VND_RQST_STAT_TXT"]</name>
<stringValue id="605">VND_RQST_STAT_TXT</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<persistentVariables id="606" type="java.util.HashSet">
<item id="607" type="java.lang.String">InboundAlacraID
1000</item>
</persistentVariables>
<sources id="608" type="java.util.HashSet">
<item idref="590" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="609" type="java.util.HashSet">
<item id="610" type="com.j2fe.workflow.definition.Transition">
<name id="611">goto-next</name>
<source idref="592"/>
<target id="612">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="613"/>
<directJoin>false</directJoin>
<name id="614">Update Request Status  #2</name>
<nodeHandler>com.j2fe.feeds.request.UpdateVREQ</nodeHandler>
<nodeHandlerClass id="615">com.j2fe.feeds.request.UpdateVREQ</nodeHandlerClass>
<parameters id="616" type="java.util.HashSet">
<item id="617" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="618">requestOIDs</name>
<stringValue id="619">VND_RQST_OID</stringValue>
<type>VARIABLE</type>
</item>
<item id="620" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="621">status</name>
<stringValue id="622">CLOSED</stringValue>
<type>CONSTANT</type>
</item>
<item id="623" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="624">statusText</name>
<stringValue id="625">VND_RQST_STAT_TXT</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="626" type="java.util.HashSet">
<item idref="610" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="627" type="java.util.HashSet">
<item id="628" type="com.j2fe.workflow.definition.Transition">
<name id="629">goto-next</name>
<source idref="612"/>
<target idref="204"/>
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
<item id="630" type="com.j2fe.workflow.definition.Transition">
<name id="631">rows-found</name>
<source idref="508"/>
<target id="632">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="633"/>
<directJoin>false</directJoin>
<name id="634">Set VREQ CNST already exists</name>
<nodeHandler>com.j2fe.feeds.request.UpdateVREQ</nodeHandler>
<nodeHandlerClass id="635">com.j2fe.feeds.request.UpdateVREQ</nodeHandlerClass>
<parameters id="636" type="java.util.HashSet">
<item id="637" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="638">requestOIDs</name>
<stringValue id="639">VND_RQST_OID</stringValue>
<type>VARIABLE</type>
</item>
<item id="640" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="641">status</name>
<stringValue id="642">FAILED</stringValue>
<type>CONSTANT</type>
</item>
<item id="643" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="644">statusText</name>
<stringValue id="645">FT_T_CNST already exists</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="646" type="java.util.HashSet">
<item idref="630" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="647" type="java.util.HashSet">
<item id="648" type="com.j2fe.workflow.definition.Transition">
<name id="649">goto-next</name>
<source idref="632"/>
<target idref="204"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
</targets>
<type>XORSPLIT</type>
</target>
</item>
</targets>
<type>XORSPLIT</type>
</target>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="251"/>
</item>
</sources>
<targets id="650" type="java.util.HashSet">
<item idref="249" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="222"/>
</item>
</sources>
<targets id="651" type="java.util.HashSet">
<item idref="220" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="204"/>
</item>
<item idref="409" type="com.j2fe.workflow.definition.Transition"/>
<item idref="648" type="com.j2fe.workflow.definition.Transition"/>
<item idref="504" type="com.j2fe.workflow.definition.Transition"/>
<item idref="628" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="652" type="java.util.HashSet">
<item idref="202" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="197"/>
</item>
</sources>
<targets id="653" type="java.util.HashSet">
<item idref="195" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDJOIN</type>
</source>
<target idref="183"/>
</item>
</sources>
<targets id="654" type="java.util.HashSet">
<item id="655" type="com.j2fe.workflow.definition.Transition">
<name id="656">goto-next</name>
<source idref="183"/>
<target id="657">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="658"/>
<directJoin>false</directJoin>
<name id="659">Close Transaction</name>
<nodeHandler>com.j2fe.streetlamp.activities.CloseTransaction</nodeHandler>
<nodeHandlerClass id="660">com.j2fe.streetlamp.activities.CloseTransaction</nodeHandlerClass>
<parameters id="661" type="java.util.HashSet">
<item id="662" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="663">transactionId</name>
<stringValue id="664">TransactionID</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="665" type="java.util.HashSet">
<item idref="655" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="666" type="java.util.HashSet">
<item id="667" type="com.j2fe.workflow.definition.Transition">
<name id="668">goto-next</name>
<source idref="657"/>
<target id="669">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="670"/>
<directJoin>false</directJoin>
<name id="671">Close Job</name>
<nodeHandler>com.j2fe.streetlamp.activities.CloseJob</nodeHandler>
<nodeHandlerClass id="672">com.j2fe.streetlamp.activities.CloseJob</nodeHandlerClass>
<parameters id="673" type="java.util.HashSet">
<item id="674" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="675">jobId</name>
<stringValue id="676">JobID</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="677" type="java.util.HashSet">
<item idref="667" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="678" type="java.util.HashSet">
<item id="679" type="com.j2fe.workflow.definition.Transition">
<name id="680">goto-next</name>
<source idref="669"/>
<target idref="36"/>
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
<item idref="384" type="com.j2fe.workflow.definition.Transition"/>
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
<target idref="36"/>
</item>
<item idref="679" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="681" type="java.util.HashSet">
<item idref="34" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="29"/>
</item>
<item id="682" type="com.j2fe.workflow.definition.Transition">
<name id="683">rows-found</name>
<source id="684">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="685"/>
<directJoin>false</directJoin>
<name id="686">Fetch unprocessed VREQ</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="687">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="688" type="java.util.HashSet">
<item id="689" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="690">database</name>
<stringValue id="691">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="692" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="693">mappedResult</name>
<stringValue id="694">VREQToProcess</stringValue>
<type>VARIABLE</type>
</item>
<item id="695" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="696">querySQL</name>
<stringValue id="697">SELECT DISTINCT 
    VND_RESP_FILE_NME AS "AlacraResponseFileName",
    date_trunc('day', VND_RQST_TMS ) AS "AlacraRequestDate"
FROM FT_T_VREQ
WHERE DATA_SRC_ID = 'ALACRA'
  AND VND_RQST_STAT_TYP = 'REQUESTED'
  AND VND_RESP_FILE_NME LIKE '%.out'
ORDER BY 2</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="698" type="java.util.HashSet">
<item id="699" type="com.j2fe.workflow.definition.Transition">
<name id="700">goto-next</name>
<source id="701">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="702"/>
<directJoin>false</directJoin>
<name id="703">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="704">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="705" type="java.util.HashSet"/>
<targets id="706" type="java.util.HashSet">
<item idref="699" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="684"/>
</item>
</sources>
<targets id="707" type="java.util.HashSet">
<item id="708" type="com.j2fe.workflow.definition.Transition">
<name id="709">nothing-found</name>
<source idref="684"/>
<target idref="2"/>
</item>
<item idref="682" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="29"/>
</item>
</sources>
<targets id="710" type="java.util.HashSet">
<item idref="27" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="9"/>
</item>
</sources>
<targets id="711" type="java.util.HashSet">
<item idref="7" type="com.j2fe.workflow.definition.Transition"/>
<item idref="61" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="2"/>
</item>
<item idref="708" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="712" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="713">Custom/Dataloads/IssuerMerge</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="714">user1</lastChangeUser>
<lastUpdate id="715">2026-02-02T14:04:10.000+0000</lastUpdate>
<name id="716">AlacraInbound</name>
<nodes id="717" type="java.util.HashSet">
<item idref="66" type="com.j2fe.workflow.definition.Node"/>
<item idref="592" type="com.j2fe.workflow.definition.Node"/>
<item idref="324" type="com.j2fe.workflow.definition.Node"/>
<item idref="508" type="com.j2fe.workflow.definition.Node"/>
<item idref="669" type="com.j2fe.workflow.definition.Node"/>
<item idref="657" type="com.j2fe.workflow.definition.Node"/>
<item idref="183" type="com.j2fe.workflow.definition.Node"/>
<item idref="129" type="com.j2fe.workflow.definition.Node"/>
<item idref="87" type="com.j2fe.workflow.definition.Node"/>
<item idref="108" type="com.j2fe.workflow.definition.Node"/>
<item idref="368" type="com.j2fe.workflow.definition.Node"/>
<item idref="434" type="com.j2fe.workflow.definition.Node"/>
<item idref="298" type="com.j2fe.workflow.definition.Node"/>
<item idref="684" type="com.j2fe.workflow.definition.Node"/>
<item idref="354" type="com.j2fe.workflow.definition.Node"/>
<item idref="533" type="com.j2fe.workflow.definition.Node"/>
<item idref="222" type="com.j2fe.workflow.definition.Node"/>
<item idref="558" type="com.j2fe.workflow.definition.Node"/>
<item idref="458" type="com.j2fe.workflow.definition.Node"/>
<item idref="282" type="com.j2fe.workflow.definition.Node"/>
<item idref="268" type="com.j2fe.workflow.definition.Node"/>
<item idref="159" type="com.j2fe.workflow.definition.Node"/>
<item idref="43" type="com.j2fe.workflow.definition.Node"/>
<item idref="9" type="com.j2fe.workflow.definition.Node"/>
<item idref="29" type="com.j2fe.workflow.definition.Node"/>
<item idref="36" type="com.j2fe.workflow.definition.Node"/>
<item idref="251" type="com.j2fe.workflow.definition.Node"/>
<item idref="393" type="com.j2fe.workflow.definition.Node"/>
<item idref="632" type="com.j2fe.workflow.definition.Node"/>
<item idref="204" type="com.j2fe.workflow.definition.Node"/>
<item idref="488" type="com.j2fe.workflow.definition.Node"/>
<item idref="701" type="com.j2fe.workflow.definition.Node"/>
<item idref="2" type="com.j2fe.workflow.definition.Node"/>
<item idref="197" type="com.j2fe.workflow.definition.Node"/>
<item idref="612" type="com.j2fe.workflow.definition.Node"/>
<item idref="414" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>true</optimize>
<parameter id="718" type="java.util.HashMap">
<entry>
<key id="719" type="java.lang.String">AlacraInboundLocalDirectory</key>
<value id="720" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="721">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="722"/>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="723" type="java.lang.String">AlacraInboundProcessedDirectory</key>
<value id="724" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="725">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="726">path of the directory to put the processed file</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="727" type="java.lang.String">AlacraInboundRemoteDirectory</key>
<value id="728" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="729">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="730"/>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="731" type="java.lang.String">BaseFileName</key>
<value id="732" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="733">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="734" type="java.lang.String">File</key>
<value id="735" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="736">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="737" type="java.lang.String">InboundAlacraID</key>
<value id="738" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="739">java.lang.Object</className>
<clazz>java.lang.Object</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="740" type="java.lang.String">ParentJobID</key>
<value id="741" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="742">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="743" type="java.lang.String">entityType</key>
<value id="744" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="745">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="746">The Entity which needs to be considered for merge. e.g ISSR or FINS. By default the value is ISSR.</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="747" type="java.lang.String">outputFileDirectory</key>
<value id="748" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="749">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="750">directory of the file which contains list of OID for which CNST entry is not created.</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="751" type="java.lang.String">outputFileName</key>
<value id="752" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="753">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="754">file which contains list of OID for which CNST entry is not created.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
</parameter>
<permissions id="755" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>false</purgeAtEnd>
<retries>0</retries>
<startNode idref="701"/>
<status>RELEASED</status>
<variables id="756" type="java.util.HashMap">
<entry>
<key id="757" type="java.lang.String">AlacraInboundLocalDirectory</key>
<value id="758" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="759">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="760"/>
<persistent>false</persistent>
<value id="761" type="java.lang.String">/gold/app/AlacraInbound/AlacraInboundLocalDirectory</value>
</value>
</entry>
<entry>
<key id="762" type="java.lang.String">AlacraInboundProcessedDirectory</key>
<value id="763" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="764">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="765">path of the directory to put the processed file</description>
<persistent>false</persistent>
<value id="766" type="java.lang.String">/gold/app/AlacraInbound/AlacraInboundProcessedDirectory</value>
</value>
</entry>
<entry>
<key id="767" type="java.lang.String">AlacraInboundRemoteDirectory</key>
<value id="768" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="769">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="770"/>
<persistent>false</persistent>
<value id="771" type="java.lang.String">/gold/app/AlacraInbound/AlacraInboundRemoteDirectory</value>
</value>
</entry>
<entry>
<key id="772" type="java.lang.String">BaseFileName</key>
<value id="773" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="774">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="775" type="java.lang.String">Alacra_DeDup_File_</value>
</value>
</entry>
<entry>
<key id="776" type="java.lang.String">File</key>
<value id="777" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="778">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="779" type="java.lang.String">InboundAlacraID</key>
<value id="780" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="781">java.lang.Object</className>
<clazz>java.lang.Object</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="782" type="java.lang.String">JobID</key>
<value id="783" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="784">java.lang.Object</className>
<clazz>java.lang.Object</clazz>
<description id="785">jobID of the task</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="786" type="java.lang.String">ParentJobID</key>
<value id="787" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="788">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="789" type="java.lang.String">entityType</key>
<value id="790" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="791">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="792">The Entity which needs to be considered for merge. e.g ISSR or FINS. By default the value is ISSR.</description>
<persistent>false</persistent>
<value id="793" type="java.lang.String">FINS</value>
</value>
</entry>
<entry>
<key id="794" type="java.lang.String">forLoopCnt</key>
<value id="795" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="796">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<persistent>false</persistent>
<value id="797" type="java.lang.Integer">0</value>
</value>
</entry>
<entry>
<key id="798" type="java.lang.String">outputFileDirectory</key>
<value id="799" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="800">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="801">directory of the file which contains list of OID for which CNST entry is not created.</description>
<persistent>false</persistent>
<value id="802" type="java.lang.String">/gold/app/AlacraInbound/outputFileDirectory</value>
</value>
</entry>
<entry>
<key id="803" type="java.lang.String">outputFileName</key>
<value id="804" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="805">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="806">file which contains list of OID for which CNST entry is not created.</description>
<persistent>false</persistent>
</value>
</entry>
</variables>
<version>6</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
