<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.12">
<package-comment/>
<businessobject displayString="16 - v10 Raise remote events + Domestic Bond check" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>true</alwaysPersist>
<clustered>false</clustered>
<comment id="1">v10 Raise remote events + Domestic Bond check</comment>
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
<name id="9">Y</name>
<source id="10">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="11"/>
<directJoin>false</directJoin>
<name id="12">Switch Case</name>
<nodeHandler>com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandler>
<nodeHandlerClass id="13">com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandlerClass>
<parameters id="14" type="java.util.HashSet">
<item id="15" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="16">caseItem</name>
<stringValue id="17">MigrationMode</stringValue>
<type>VARIABLE</type>
</item>
<item id="18" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="19">trimSpaces</name>
<stringValue id="20">true</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="21" type="java.util.HashSet">
<item id="22" type="com.j2fe.workflow.definition.Transition">
<name id="23">goto-next</name>
<source id="24">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="25"/>
<directJoin>false</directJoin>
<name id="26">Command Line</name>
<nodeHandler>com.j2fe.general.activities.CommandLine</nodeHandler>
<nodeHandlerClass id="27">com.j2fe.general.activities.CommandLine</nodeHandlerClass>
<parameters id="28" type="java.util.HashSet">
<item id="29" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="30">commandLine</name>
<stringValue id="31">command</stringValue>
<type>VARIABLE</type>
</item>
<item id="32" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="33">waitForEnd</name>
<stringValue id="34">true</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="35" type="java.util.HashSet">
<item id="36" type="com.j2fe.workflow.definition.Transition">
<name id="37">goto-next</name>
<source id="38">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="39"/>
<directJoin>false</directJoin>
<name id="40">Bean Shell Script (Standard) #2</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="41">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="42" type="java.util.HashSet">
<item id="43" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="44">statements</name>
<stringValue id="45">String command ="mv "+ inputpath + filename+" "+outputpath;</stringValue>
<type>CONSTANT</type>
</item>
<item id="46" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="47">variables["command"]</name>
<stringValue id="48">command</stringValue>
<type>VARIABLE</type>
</item>
<item id="49" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="50">variables["filename"]</name>
<stringValue id="51">filename</stringValue>
<type>VARIABLE</type>
</item>
<item id="52" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="53">["inputpath"]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="54">variables["inputpath"]</name>
<stringValue id="55">input</stringValue>
<type>VARIABLE</type>
</item>
<item id="56" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="57">variables["outputpath"]</name>
<stringValue id="58">output</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<persistentVariables id="59" type="java.util.HashSet">
<item id="60" type="java.lang.String">command
1000</item>
</persistentVariables>
<sources id="61" type="java.util.HashSet">
<item id="62" type="com.j2fe.workflow.definition.Transition">
<name id="63">goto-next</name>
<source id="64">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="65"/>
<directJoin>false</directJoin>
<name id="66">Close Job</name>
<nodeHandler>com.j2fe.streetlamp.activities.CloseJob</nodeHandler>
<nodeHandlerClass id="67">com.j2fe.streetlamp.activities.CloseJob</nodeHandlerClass>
<parameters id="68" type="java.util.HashSet">
<item id="69" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="70">jobId</name>
<stringValue id="71">JobID</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="72" type="java.util.HashSet">
<item id="73" type="com.j2fe.workflow.definition.Transition">
<name id="74">goto-next</name>
<source id="75">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="76"/>
<directJoin>false</directJoin>
<name id="77">Consolidate Job</name>
<nodeHandler>com.j2fe.streetlamp.activities.ConsolidateJob</nodeHandler>
<nodeHandlerClass id="78">com.j2fe.streetlamp.activities.ConsolidateJob</nodeHandlerClass>
<parameters id="79" type="java.util.HashSet">
<item id="80" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="81">jobId</name>
<stringValue id="82">JobID</stringValue>
<type>VARIABLE</type>
</item>
<item id="83" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="84">numberOfTridsToUdate</name>
<stringValue id="85">1</stringValue>
<type>CONSTANT</type>
</item>
<item id="86" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="87">updateTotalCount</name>
<stringValue id="88">true</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="89" type="java.util.HashSet">
<item id="90" type="com.j2fe.workflow.definition.Transition">
<name id="91">goto-next</name>
<source id="92">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="93"/>
<directJoin>false</directJoin>
<name id="94">Close Transaction</name>
<nodeHandler>com.j2fe.streetlamp.activities.CloseTransaction</nodeHandler>
<nodeHandlerClass id="95">com.j2fe.streetlamp.activities.CloseTransaction</nodeHandlerClass>
<parameters id="96" type="java.util.HashSet">
<item id="97" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="98">transactionId</name>
<stringValue id="99">TransactionID</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="100" type="java.util.HashSet">
<item id="101" type="com.j2fe.workflow.definition.Transition">
<name id="102">goto-next</name>
<source id="103">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="104"/>
<directJoin>false</directJoin>
<name id="105">Process File</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="106">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="107" type="java.util.HashSet">
<item id="108" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="109">["Message"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="110">input["Message"]</name>
<stringValue id="111">JMSTextMessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="112" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="113">["MessageType"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="114">input["MessageType"]</name>
<stringValue id="115">MessageType</stringValue>
<type>VARIABLE</type>
</item>
<item id="116" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="117">["TransactionId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="118">input["TransactionId"]</name>
<stringValue id="119">TransactionID</stringValue>
<type>VARIABLE</type>
</item>
<item id="120" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="121">name</name>
<stringValue id="122">Basic Message Processing</stringValue>
<type>CONSTANT</type>
</item>
<item id="123" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="124">["JobId"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="125">output["JobId"]</name>
<stringValue id="126">Job Id</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="127" type="java.util.HashSet">
<item id="128" type="com.j2fe.workflow.definition.Transition">
<name id="129">goto-next</name>
<source id="130">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="131"/>
<directJoin>false</directJoin>
<name id="132">Create Transaction</name>
<nodeHandler>com.j2fe.streetlamp.activities.CreateTransaction</nodeHandler>
<nodeHandlerClass id="133">com.j2fe.streetlamp.activities.CreateTransaction</nodeHandlerClass>
<parameters id="134" type="java.util.HashSet">
<item id="135" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="136">jobId</name>
<stringValue id="137">JobID</stringValue>
<type>VARIABLE</type>
</item>
<item id="138" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="139">messageType</name>
<stringValue id="140">MessageType</stringValue>
<type>VARIABLE</type>
</item>
<item id="141" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="142">originalMessage</name>
<stringValue id="143">OriginalMessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="144" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="145">originalMessageType</name>
<stringValue id="146">OriginalMessageType</stringValue>
<type>VARIABLE</type>
</item>
<item id="147" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="148">transactionId</name>
<stringValue id="149">TransactionID</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<persistentVariables id="150" type="java.util.HashSet">
<item id="151" type="java.lang.String">MessageKey
0010</item>
<item id="152" type="java.lang.String">TransactionID
1000</item>
<item id="153" type="java.lang.String">JobID
1000</item>
</persistentVariables>
<sources id="154" type="java.util.HashSet">
<item id="155" type="com.j2fe.workflow.definition.Transition">
<name id="156">goto-next</name>
<source id="157">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="158"/>
<directJoin>false</directJoin>
<name id="159">Create Job</name>
<nodeHandler>com.j2fe.streetlamp.activities.CreateJob</nodeHandler>
<nodeHandlerClass id="160">com.j2fe.streetlamp.activities.CreateJob</nodeHandlerClass>
<parameters id="161" type="java.util.HashSet">
<item id="162" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="163">file</name>
<stringValue id="164">inputPath</stringValue>
<type>VARIABLE</type>
</item>
<item id="165" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="166">jobId</name>
<stringValue id="167">JobID</stringValue>
<type>VARIABLE</type>
</item>
<item id="168" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="169">messageType</name>
<stringValue id="170">MessageType</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="171" type="java.util.HashSet">
<item id="172" type="com.j2fe.workflow.definition.Transition">
<name id="173">goto-next</name>
<source id="174">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="175"/>
<directJoin>false</directJoin>
<name id="176">Bean Shell Script (Standard) #2</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="177">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="178" type="java.util.HashSet">
<item id="179" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="180">statements</name>
<stringValue id="181">String inputPath=inputpath+filename;</stringValue>
<type>CONSTANT</type>
</item>
<item id="182" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="183">variables["filename"]</name>
<stringValue id="184">filename</stringValue>
<type>VARIABLE</type>
</item>
<item id="185" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="186">variables["inputPath"]</name>
<stringValue id="187">inputPath</stringValue>
<type>VARIABLE</type>
</item>
<item id="188" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="189">["inputpath"]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="190">variables["inputpath"]</name>
<stringValue id="191">input</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="192" type="java.util.HashSet">
<item id="193" type="com.j2fe.workflow.definition.Transition">
<name id="194">goto-next</name>
<source id="195">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="196"/>
<directJoin>false</directJoin>
<name id="197">write file</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="198">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="199" type="java.util.HashSet">
<item id="200" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="201">["BaseName"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="202">input["BaseName"]</name>
<stringValue id="203">BaseName</stringValue>
<type>VARIABLE</type>
</item>
<item id="204" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="205">["DestinationFTP"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="206">input["DestinationFTP"]</name>
<stringValue id="207">input</stringValue>
<type>VARIABLE</type>
</item>
<item id="208" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="209">["inputMgs"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="210">input["inputMgs"]</name>
<stringValue id="211">JMSTextMessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="212" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="213">name</name>
<stringValue id="214">WriteFile</stringValue>
<type>CONSTANT</type>
</item>
<item id="215" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="216">["filename"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="217">output["filename"]</name>
<stringValue id="218">filename</stringValue>
<type>VARIABLE</type>
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
<name id="224">Bean Shell Script (Standard) #2</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="225">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="226" type="java.util.HashSet">
<item id="227" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="228">statements</name>
<stringValue id="229">String gsbinpath=System.getProperty("gs.bin.path");&#13;
String gsbinpathin=gsbinpath+inpath;&#13;
String gsbinpathout=gsbinpath+outpath;</stringValue>
<type>CONSTANT</type>
</item>
<item id="230" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="231">variables["gsbinpathin"]</name>
<stringValue id="232">input</stringValue>
<type>VARIABLE</type>
</item>
<item id="233" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="234">variables["gsbinpathout"]</name>
<stringValue id="235">output</stringValue>
<type>VARIABLE</type>
</item>
<item id="236" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="237">["inpath"]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="238">variables["inpath"]</name>
<stringValue id="239">input</stringValue>
<type>VARIABLE</type>
</item>
<item id="240" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="241">variables["outpath"]</name>
<stringValue id="242">output</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="243" type="java.util.HashSet">
<item id="244" type="com.j2fe.workflow.definition.Transition">
<name id="245">goto-next</name>
<source id="246">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="247"/>
<directJoin>false</directJoin>
<name id="248">Get PRODUCT OID</name>
<nodeHandler>com.j2fe.workflow.handler.impl.ExecuteXPath</nodeHandler>
<nodeHandlerClass id="249">com.j2fe.workflow.handler.impl.ExecuteXPath</nodeHandlerClass>
<parameters id="250" type="java.util.HashSet">
<item id="251" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="252">inputText</name>
<stringValue id="253">JMSTextMessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="254" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="255">outputValue</name>
<stringValue id="256">MessageKey</stringValue>
<type>VARIABLE</type>
</item>
<item id="257" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="258">xPath</name>
<stringValue id="259">/cmfAsset/validatedAsset/identifiers/identifier[@TYPE='PRODUCTOID']/text()</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="260" type="java.util.HashSet">
<item id="261" type="com.j2fe.workflow.definition.Transition">
<name id="262">goto-next</name>
<source id="263">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="264"/>
<directJoin>false</directJoin>
<name id="265">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="266">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="267" type="java.util.HashSet"/>
<targets id="268" type="java.util.HashSet">
<item idref="261" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="246"/>
</item>
</sources>
<targets id="269" type="java.util.HashSet">
<item idref="244" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="222"/>
</item>
</sources>
<targets id="270" type="java.util.HashSet">
<item idref="220" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="195"/>
</item>
</sources>
<targets id="271" type="java.util.HashSet">
<item idref="193" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="174"/>
</item>
</sources>
<targets id="272" type="java.util.HashSet">
<item idref="172" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="157"/>
</item>
</sources>
<targets id="273" type="java.util.HashSet">
<item idref="155" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="130"/>
</item>
</sources>
<targets id="274" type="java.util.HashSet">
<item idref="128" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="103"/>
</item>
</sources>
<targets id="275" type="java.util.HashSet">
<item idref="101" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="92"/>
</item>
</sources>
<targets id="276" type="java.util.HashSet">
<item idref="90" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="75"/>
</item>
</sources>
<targets id="277" type="java.util.HashSet">
<item idref="73" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="64"/>
</item>
</sources>
<targets id="278" type="java.util.HashSet">
<item idref="62" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="38"/>
</item>
</sources>
<targets id="279" type="java.util.HashSet">
<item idref="36" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="24"/>
</item>
</sources>
<targets id="280" type="java.util.HashSet">
<item idref="22" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="10"/>
</item>
</sources>
<targets id="281" type="java.util.HashSet">
<item id="282" type="com.j2fe.workflow.definition.Transition">
<name id="283">N</name>
<source idref="10"/>
<target id="284">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="285"/>
<directJoin>false</directJoin>
<name id="286">Get TRN_ID</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="287">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="288" type="java.util.HashSet">
<item id="289" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="290">database</name>
<stringValue id="291">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="292" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="293">firstColumnsResult[0]</name>
<stringValue id="294">trid</stringValue>
<type>VARIABLE</type>
</item>
<item id="295" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="296">indexedParameters[0]</name>
<stringValue id="297">JobID</stringValue>
<type>VARIABLE</type>
</item>
<item id="298" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="299">querySQL</name>
<stringValue id="300">GetTridQuery</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="301" type="java.util.HashSet">
<item idref="282" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="302" type="java.util.HashSet">
<item id="303" type="com.j2fe.workflow.definition.Transition">
<name id="304">nothing-found</name>
<source idref="284"/>
<target idref="3"/>
</item>
<item id="305" type="com.j2fe.workflow.definition.Transition">
<name id="306">rows-found</name>
<source idref="284"/>
<target id="307">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="308"/>
<directJoin>false</directJoin>
<name id="309">Get ISIN</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="310">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="311" type="java.util.HashSet">
<item id="312" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="313">database</name>
<stringValue id="314">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="315" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="316">firstColumnsResult[0]</name>
<stringValue id="317">idFromDB</stringValue>
<type>VARIABLE</type>
</item>
<item id="318" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="319">indexedParameters[0]</name>
<stringValue id="320">trid</stringValue>
<type>VARIABLE</type>
</item>
<item id="321" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="322">querySQL</name>
<objectValue id="323" type="java.lang.String">select distinct(isid.iss_id)
from 
    ft_t_isid isid,
    ft_t_msgp msgp
where msgp.trn_id=cast(? as varchar)
and msgp.xref_tbl_typ='ISSU'
and msgp.PROC_MSG_STAT_CDE &lt; 50
and isid.instr_id=msgp.xref_tbl_row_oid
and isid.id_ctxt_typ='ISIN'
/*Added to SOI: isgr.grp_purp_typ -  MHSC PDM Inventory has 'NOBBREQ', Nozomi inventory and other SOI groups have 'INTEREST'*/
and exists
( select 1 from ft_t_isgp isgp, ft_t_isgr isgr 
   where isid.instr_id = isgp.instr_id 
     and isgp.end_tms is null 
     and isgp.start_tms &gt;= date_trunc('day',now())::timestamp
     and isgp.prt_purp_typ ='INTEREST'
     and isgp.prnt_iss_grp_oid = isgr.iss_grp_oid 
     and isgr.end_tms is null
     and isgr.grp_purp_typ ='INTEREST' )
/*The asset was not in SOI before today */     
and not exists 
( select 1 from ft_t_isgp isgp, ft_t_isgr isgr 
   where isid.instr_id = isgp.instr_id 
     and isgp.end_tms is null 
     and isgp.start_tms &lt; date_trunc('day',now())::timestamp
     and isgp.prt_purp_typ ='INTEREST'
     and isgp.prnt_iss_grp_oid = isgr.iss_grp_oid 
     and isgr.end_tms is null
     and isgr.grp_purp_typ ='INTEREST' ) 
/* Asset is not a Domestic Bond */
and not exists
( select 1 from ft_t_iscl iscl
where isid.instr_id = iscl.instr_id
and iscl.indus_cl_set_id = 'MHSCBDCL'
and iscl.cl_value = 'DMB'
and iscl.end_tms is null
)</objectValue>
<type>CONSTANT</type>
</item>
</parameters>
<persistentVariables id="324" type="java.util.HashSet">
<item id="325" type="java.lang.String">trid
1000</item>
</persistentVariables>
<sources id="326" type="java.util.HashSet">
<item idref="305" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="327" type="java.util.HashSet">
<item id="328" type="com.j2fe.workflow.definition.Transition">
<name id="329">nothing-found</name>
<source idref="307"/>
<target id="330">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="331"/>
<directJoin>false</directJoin>
<name id="332">Remote Event Publishing</name>
<nodeHandler>com.j2fe.event.RaiseEventRemote</nodeHandler>
<nodeHandlerClass id="333">com.j2fe.event.RaiseEventRemote</nodeHandlerClass>
<parameters id="334" type="java.util.HashSet">
<item id="335" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="336">eventName</name>
<stringValue id="337">MizPublishForTxn_Event</stringValue>
<type>CONSTANT</type>
</item>
<item id="338" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="339">["transactionId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="340">parameters["transactionId"]</name>
<stringValue id="341">trid</stringValue>
<type>VARIABLE</type>
</item>
<item id="342" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="343">propertyFileLocation</name>
<stringValue id="344">db://resource/PublishingConfiguration/PublishingConfig.properties</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="345" type="java.util.HashSet">
<item id="346" type="com.j2fe.workflow.definition.Transition">
<name id="347">goto-next</name>
<source id="348">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="349"/>
<directJoin>false</directJoin>
<name id="350">Request Reply</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="351">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="352" type="java.util.HashSet">
<item id="353" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="354">["IDCFormat"]@com/j2fe/connector/IDCFormat@</UITypeHint>
<input>true</input>
<name id="355">input["IDCFormat"]</name>
<objectValue id="356" type="com.j2fe.connector.IDCFormat">SingelRecordLayout</objectValue>
<type>CONSTANT</type>
</item>
<item id="357" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="358">["IDCRR"]@java/lang/Boolean@</UITypeHint>
<input>true</input>
<name id="359">input["IDCRR"]</name>
<objectValue id="360" type="java.lang.Boolean">false</objectValue>
<type>CONSTANT</type>
</item>
<item id="361" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="362">["Message"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="363">input["Message"]</name>
<stringValue id="364">reqMessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="365" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="366">name</name>
<stringValue id="367">Request Reply</stringValue>
<type>CONSTANT</type>
</item>
<item id="368" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="369">["RequestTransaction"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="370">output["RequestTransaction"]</name>
<stringValue id="371">RequestTrid</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="372" type="java.util.HashSet">
<item id="373" type="com.j2fe.workflow.definition.Transition">
<name id="374">goto-next</name>
<source id="375">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="376"/>
<directJoin>false</directJoin>
<name id="377">Replace String</name>
<nodeHandler>com.j2fe.general.activities.ReplaceString</nodeHandler>
<nodeHandlerClass id="378">com.j2fe.general.activities.ReplaceString</nodeHandlerClass>
<parameters id="379" type="java.util.HashSet">
<item id="380" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="381">inputString</name>
<stringValue id="382">&lt;VendorRequest&gt;&#13;
	&lt;User&gt;PM&lt;/User&gt;&#13;
	&lt;Requestor&gt;PM&lt;/Requestor&gt;&#13;
	&lt;Request&gt;&#13;
		&lt;DataType&gt;SECMASTER&lt;/DataType&gt;&#13;
		&lt;Vendor&gt;BB&lt;/Vendor&gt;&#13;
		&lt;TableType&gt;ISSU&lt;/TableType&gt;&#13;
		&lt;Identifier&gt;ID_VALUE&lt;/Identifier&gt;&#13;
		&lt;IDContext&gt;ISIN&lt;/IDContext&gt;&#13;
	&lt;/Request&gt;&#13;
&lt;/VendorRequest&gt;</stringValue>
<type>CONSTANT</type>
</item>
<item id="383" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="384">outputString</name>
<stringValue id="385">reqMessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="386" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="387">replaceString</name>
<stringValue id="388">idFromDB</stringValue>
<type>VARIABLE</type>
</item>
<item id="389" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="390">searchString</name>
<stringValue id="391">ID_VALUE</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="392" type="java.util.HashSet">
<item id="393" type="com.j2fe.workflow.definition.Transition">
<name id="394">rows-found</name>
<source idref="307"/>
<target idref="375"/>
</item>
</sources>
<targets id="395" type="java.util.HashSet">
<item idref="373" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="348"/>
</item>
</sources>
<targets id="396" type="java.util.HashSet">
<item idref="346" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="330"/>
</item>
<item idref="328" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="397" type="java.util.HashSet">
<item id="398" type="com.j2fe.workflow.definition.Transition">
<name id="399">goto-next</name>
<source idref="330"/>
<target idref="3"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item idref="393" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</target>
</item>
</targets>
<type>XORSPLIT</type>
</target>
</item>
<item idref="8" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="3"/>
</item>
<item idref="398" type="com.j2fe.workflow.definition.Transition"/>
<item idref="303" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="400" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="401">Mizuho</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="402">user1</lastChangeUser>
<lastUpdate id="403">2025-12-12T17:50:34.000+0000</lastUpdate>
<name id="404">ConsumeMhscMessage</name>
<nodes id="405" type="java.util.HashSet">
<item idref="174" type="com.j2fe.workflow.definition.Node"/>
<item idref="222" type="com.j2fe.workflow.definition.Node"/>
<item idref="38" type="com.j2fe.workflow.definition.Node"/>
<item idref="64" type="com.j2fe.workflow.definition.Node"/>
<item idref="92" type="com.j2fe.workflow.definition.Node"/>
<item idref="24" type="com.j2fe.workflow.definition.Node"/>
<item idref="75" type="com.j2fe.workflow.definition.Node"/>
<item idref="157" type="com.j2fe.workflow.definition.Node"/>
<item idref="130" type="com.j2fe.workflow.definition.Node"/>
<item idref="307" type="com.j2fe.workflow.definition.Node"/>
<item idref="246" type="com.j2fe.workflow.definition.Node"/>
<item idref="284" type="com.j2fe.workflow.definition.Node"/>
<item idref="103" type="com.j2fe.workflow.definition.Node"/>
<item idref="330" type="com.j2fe.workflow.definition.Node"/>
<item idref="375" type="com.j2fe.workflow.definition.Node"/>
<item idref="348" type="com.j2fe.workflow.definition.Node"/>
<item idref="263" type="com.j2fe.workflow.definition.Node"/>
<item idref="3" type="com.j2fe.workflow.definition.Node"/>
<item idref="10" type="com.j2fe.workflow.definition.Node"/>
<item idref="195" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>true</optimize>
<parameter id="406" type="java.util.HashMap">
<entry>
<key id="407" type="java.lang.String">BaseName</key>
<value id="408" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="409">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="410" type="java.lang.String">CallSOIAddition</key>
<value id="411" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="412">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="413">Y to process cmfSOIAddition or N</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="414" type="java.lang.String">GetTridQuery</key>
<value id="415" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="416">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="417" type="java.lang.String">JMSTextMessage</key>
<value id="418" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="419">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="420">If the JMS message type is Text then this property contains the message.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="421" type="java.lang.String">MessageType</key>
<value id="422" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="423">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="424" type="java.lang.String">MigrationMode</key>
<value id="425" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="426">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="427" type="java.lang.String">SoiPurpType</key>
<value id="428" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="429">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="430">cmfSOIAddition input parameter</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="431" type="java.lang.String">filename</key>
<value id="432" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="433">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="434" type="java.lang.String">input</key>
<value id="435" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="436">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="437" type="java.lang.String">output</key>
<value id="438" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="439">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
</parameter>
<permissions id="440" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>false</purgeAtEnd>
<retries>0</retries>
<startNode idref="263"/>
<status>RELEASED</status>
<variables id="441" type="java.util.HashMap">
<entry>
<key id="442" type="java.lang.String">BaseName</key>
<value id="443" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="444">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="445" type="java.lang.String">PM</value>
</value>
</entry>
<entry>
<key id="446" type="java.lang.String">CallSOIAddition</key>
<value id="447" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="448">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="449">Y to process cmfSOIAddition or N</description>
<persistent>false</persistent>
<value id="450" type="java.lang.String">N</value>
</value>
</entry>
<entry>
<key id="451" type="java.lang.String">GetTridQuery</key>
<value id="452" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="453">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="454" type="java.lang.String">select trn_id from fT_t_trid where job_id = ?</value>
</value>
</entry>
<entry>
<key id="455" type="java.lang.String">JMSTextMessage</key>
<value id="456" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="457">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="458">If the JMS message type is Text then this property contains the message.</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="459" type="java.lang.String">MessageKeyIndex</key>
<value id="460" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="461">java.lang.Long</className>
<clazz>java.lang.Long</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="462" type="java.lang.String">MessageType</key>
<value id="463" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="464">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>true</persistent>
<value id="465" type="java.lang.String">PMASSET</value>
</value>
</entry>
<entry>
<key id="466" type="java.lang.String">MigrationMode</key>
<value id="467" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="468">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="469" type="java.lang.String">N</value>
</value>
</entry>
<entry>
<key id="470" type="java.lang.String">SoiPurpType</key>
<value id="471" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="472">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="473">cmfSOIAddition input parameter</description>
<persistent>false</persistent>
<value id="474" type="java.lang.String">INTEREST</value>
</value>
</entry>
<entry>
<key id="475" type="java.lang.String">filename</key>
<value id="476" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="477">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="478" type="java.lang.String">input</key>
<value id="479" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="480">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="481" type="java.lang.String">/../GS-QueueMsg/MHSC/input/</value>
</value>
</entry>
<entry>
<key id="482" type="java.lang.String">output</key>
<value id="483" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="484">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="485" type="java.lang.String">/../GS-QueueMsg/MHSC/output/</value>
</value>
</entry>
<entry>
<key id="486" type="java.lang.String">user_id</key>
<value id="487" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="488">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="489">Set to LAST_CHG_USR_ID</description>
<persistent>true</persistent>
<value id="490" type="java.lang.String">PMASSET</value>
</value>
</entry>
</variables>
<version>16</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
