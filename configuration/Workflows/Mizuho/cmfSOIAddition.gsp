<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.04">
<package-comment/>
<businessobject displayString="44 - V-10 Raise remote event for publishing" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>true</alwaysPersist>
<clustered>false</clustered>
<comment id="1">V-10 Raise remote event for publishing</comment>
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
<name id="12">NOP</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="13">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="14" type="java.util.HashSet">
<item id="15" type="com.j2fe.workflow.definition.Transition">
<name id="16">ToSplit</name>
<source id="17">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="18">Automatically generated</description>
<directJoin>false</directJoin>
<name id="19">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="20">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="21" type="java.util.HashSet">
<item id="22" type="com.j2fe.workflow.definition.Transition">
<name id="23">false</name>
<source id="24">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="25"/>
<directJoin>false</directJoin>
<name id="26">Request?</name>
<nodeHandler>com.j2fe.workflow.handler.impl.XPathXorSplit</nodeHandler>
<nodeHandlerClass id="27">com.j2fe.workflow.handler.impl.XPathXorSplit</nodeHandlerClass>
<parameters id="28" type="java.util.HashSet">
<item id="29" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="30">inputText</name>
<stringValue id="31">FilteredRequestMessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="32" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="33">xPath</name>
<stringValue id="34">//Request</stringValue>
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
<name id="40">cmfSOIAdditionFilter</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="41">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="42" type="java.util.HashSet">
<item id="43" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="44">["GetRequestDataXPath"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="45">input["GetRequestDataXPath"]</name>
<objectValue id="46" type="java.lang.String">//RequestData/text()</objectValue>
<type>CONSTANT</type>
</item>
<item id="47" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="48">["PublishAssets"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="49">input["PublishAssets"]</name>
<stringValue id="50">PublishAssets</stringValue>
<type>VARIABLE</type>
</item>
<item id="51" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="52">["RequestMessage"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="53">input["RequestMessage"]</name>
<stringValue id="54">requestMessage</stringValue>
<type>VARIABLE</type>
<variablePart id="55">output[0].textData</variablePart>
</item>
<item id="56" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="57">["TriggeredByBBPerSecurityBatch"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="58">input["TriggeredByBBPerSecurityBatch"]</name>
<stringValue id="59">TriggeredByBBPerSecurityBatch</stringValue>
<type>VARIABLE</type>
</item>
<item id="60" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="61">name</name>
<stringValue id="62">cmfSOIAdditionFilter</stringValue>
<type>CONSTANT</type>
</item>
<item id="63" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="64">["FilteredRequestMessage"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="65">output["FilteredRequestMessage"]</name>
<stringValue id="66">FilteredRequestMessage</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<persistentVariables id="67" type="java.util.HashSet">
<item id="68" type="java.lang.String">requestMessage
1000</item>
</persistentVariables>
<sources id="69" type="java.util.HashSet">
<item id="70" type="com.j2fe.workflow.definition.Transition">
<name id="71">Y</name>
<source id="72">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="73"/>
<directJoin>false</directJoin>
<name id="74">Filter?</name>
<nodeHandler>com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandler>
<nodeHandlerClass id="75">com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandlerClass>
<parameters id="76" type="java.util.HashSet">
<item id="77" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="78">caseInsensitive</name>
<stringValue id="79">true</stringValue>
<type>CONSTANT</type>
</item>
<item id="80" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="81">caseItem</name>
<stringValue id="82">Filter</stringValue>
<type>VARIABLE</type>
</item>
<item id="83" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="84">defaultItem</name>
<stringValue id="85">Y</stringValue>
<type>CONSTANT</type>
</item>
<item id="86" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="87">nullTransition</name>
<stringValue id="88">Y</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="89" type="java.util.HashSet">
<item id="90" type="com.j2fe.workflow.definition.Transition">
<name id="91">goto-next</name>
<source id="92">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="93"/>
<directJoin>false</directJoin>
<name id="94">Log soi Count</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="95">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="96" type="java.util.HashSet">
<item id="97" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="98">database</name>
<stringValue id="99">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="100" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="101">indexedParameters[0]</name>
<stringValue id="102">vSOICount</stringValue>
<type>VARIABLE</type>
</item>
<item id="103" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="104">querySQL</name>
<stringValue id="105">call mhi_sp_eventlog (&#13;
	  'cmfSOIAddition',&#13;
	  'Instrument Count',&#13;
	  ?&#13;
	); </stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<persistentVariables id="106" type="java.util.HashSet">
<item id="107" type="java.lang.String">soiCount
1000</item>
</persistentVariables>
<sources id="108" type="java.util.HashSet">
<item id="109" type="com.j2fe.workflow.definition.Transition">
<name id="110">goto-next</name>
<source id="111">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="112"/>
<directJoin>false</directJoin>
<name id="113">Convert soiCount to String</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="114">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="115" type="java.util.HashSet">
<item id="116" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="117">statements</name>
<stringValue id="118">String vSOICount = String.valueOf(soiCount);</stringValue>
<type>CONSTANT</type>
</item>
<item id="119" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="120">variables["soiCount"]</name>
<stringValue id="121">soiCount</stringValue>
<type>VARIABLE</type>
</item>
<item id="122" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="123">["vSOICount"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="124">variables["vSOICount"]</name>
<stringValue id="125">vSOICount</stringValue>
<type>VARIABLE</type>
<variablePart id="126"/>
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
<name id="132">Get soi Count</name>
<nodeHandler>com.j2fe.workflow.handler.impl.ExecuteXPath</nodeHandler>
<nodeHandlerClass id="133">com.j2fe.workflow.handler.impl.ExecuteXPath</nodeHandlerClass>
<parameters id="134" type="java.util.HashSet">
<item id="135" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="136">inputText</name>
<stringValue id="137">reformattedMessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="138" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="139">outputValue</name>
<stringValue id="140">soiCount</stringValue>
<type>VARIABLE</type>
</item>
<item id="141" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="142">xPath</name>
<stringValue id="143">count(/cmfSOIAdditionCollection/cmfSOIAddition)</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="144" type="java.util.HashSet">
<item id="145" type="com.j2fe.workflow.definition.Transition">
<name id="146">goto-next</name>
<source id="147">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="148"/>
<directJoin>false</directJoin>
<name id="149">Translation (Standard)</name>
<nodeHandler>com.j2fe.translation.activities.Translation</nodeHandler>
<nodeHandlerClass id="150">com.j2fe.translation.activities.Translation</nodeHandlerClass>
<parameters id="151" type="java.util.HashSet">
<item id="152" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="153">input</name>
<stringValue id="154">reformattedMessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="155" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="156">mapping</name>
<stringValue id="157">db://resource/xslt/MHI/cmfSoiAddition.xslt</stringValue>
<type>CONSTANT</type>
</item>
<item id="158" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="159">output</name>
<stringValue id="160">requestMessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="161" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="162">wantedOutputType</name>
<stringValue id="163">XML</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="164" type="java.util.HashSet">
<item id="165" type="com.j2fe.workflow.definition.Transition">
<name id="166">goto-next</name>
<source id="167">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="168"/>
<directJoin>false</directJoin>
<name id="169">refactor cmfSOIAddition</name>
<nodeHandler>com.j2fe.translation.activities.Translation</nodeHandler>
<nodeHandlerClass id="170">com.j2fe.translation.activities.Translation</nodeHandlerClass>
<parameters id="171" type="java.util.HashSet">
<item id="172" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="173">input</name>
<stringValue id="174">JMSTextMessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="175" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="176">mapping</name>
<stringValue id="177">db://resource/xslt/MHI/MizReformatcmfAdditionMessage.xslt</stringValue>
<type>CONSTANT</type>
</item>
<item id="178" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="179">plainOutput[0]</name>
<stringValue id="180">reformattedMessage</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="181" type="java.util.HashSet">
<item id="182" type="com.j2fe.workflow.definition.Transition">
<name id="183">valid</name>
<source id="184">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="185"/>
<directJoin>false</directJoin>
<name id="186">XML Validation</name>
<nodeHandler>com.j2fe.workflow.handler.impl.XMLValidation</nodeHandler>
<nodeHandlerClass id="187">com.j2fe.workflow.handler.impl.XMLValidation</nodeHandlerClass>
<parameters id="188" type="java.util.HashSet">
<item id="189" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="190">fullValidation</name>
<stringValue id="191">false</stringValue>
<type>CONSTANT</type>
</item>
<item id="192" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="193">xmlFileAsString</name>
<stringValue id="194">JMSTextMessage</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="195" type="java.util.HashSet">
<item id="196" type="com.j2fe.workflow.definition.Transition">
<name id="197">goto-next</name>
<source id="198">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="199"/>
<directJoin>false</directJoin>
<name id="200">Get SOI Name</name>
<nodeHandler>com.j2fe.workflow.handler.impl.ExecuteXPath</nodeHandler>
<nodeHandlerClass id="201">com.j2fe.workflow.handler.impl.ExecuteXPath</nodeHandlerClass>
<parameters id="202" type="java.util.HashSet">
<item id="203" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="204">inputText</name>
<stringValue id="205">JMSTextMessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="206" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="207">outputValue</name>
<stringValue id="208">SOIName</stringValue>
<type>VARIABLE</type>
</item>
<item id="209" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="210">xPath</name>
<stringValue id="211">/cmfSOIAdditionCollection/cmfSOIAddition[1]/securityOfInterestIds/securityOfInterestId</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="212" type="java.util.HashSet">
<item id="213" type="com.j2fe.workflow.definition.Transition">
<name id="214">goto-next</name>
<source id="215">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="216"/>
<directJoin>false</directJoin>
<name id="217">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="218">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="219" type="java.util.HashSet"/>
<targets id="220" type="java.util.HashSet">
<item idref="213" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="198"/>
</item>
</sources>
<targets id="221" type="java.util.HashSet">
<item idref="196" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="184"/>
</item>
</sources>
<targets id="222" type="java.util.HashSet">
<item id="223" type="com.j2fe.workflow.definition.Transition">
<name id="224">not-valid</name>
<source idref="184"/>
<target id="225">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="226"/>
<directJoin>false</directJoin>
<name id="227">Get env</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="228">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="229" type="java.util.HashSet">
<item id="230" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="231">database</name>
<stringValue id="232">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="233" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="234">firstColumnsResult[0]</name>
<stringValue id="235">env</stringValue>
<type>VARIABLE</type>
</item>
<item id="236" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="237">querySQL</name>
<stringValue id="238">SELECT '[' || 
    CASE current_database()
        WHEN 'Replace with Prod DB name' THEN 'PRD'
        WHEN 'Replace with UAT DB name' THEN 'UAT'
        ELSE 
            CASE 
                WHEN POSITION('.' IN current_database()) &gt; 0 
                THEN SUBSTRING(current_database() FROM 1 FOR POSITION('.' IN current_database()) - 1) 
                ELSE current_database()
            END
    END || 
    ']: Invalid cmfSOIAddition Message sent to GoldenSource' AS env</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="239" type="java.util.HashSet">
<item idref="223" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="240" type="java.util.HashSet">
<item id="241" type="com.j2fe.workflow.definition.Transition">
<name id="242">goto-next</name>
<source idref="225"/>
<target id="243">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="244"/>
<directJoin>false</directJoin>
<name id="245">Email MW - Invalid message</name>
<nodeHandler>com.j2fe.general.activities.EMAIL</nodeHandler>
<nodeHandlerClass id="246">com.j2fe.general.activities.EMAIL</nodeHandlerClass>
<parameters id="247" type="java.util.HashSet">
<item id="248" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="249">attachmentsName[0]</name>
<objectValue id="250" type="java.lang.String">cmfSOIAddition.xml</objectValue>
<type>CONSTANT</type>
</item>
<item id="251" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="252">attachments[0]</name>
<stringValue id="253">JMSTextMessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="254" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="255">emailText</name>
<stringValue id="256">Middleware Team,

The attached cmfSOIAddition message was sent to GoldenSource from Middleware and is invalid. Please investigate and resolve.

This is an automated message from the GoldenSource application. Do not reply to this email</stringValue>
<type>CONSTANT</type>
</item>
<item id="257" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="258">from</name>
<stringValue id="259">SWDL-MHI-GoldenSource-Support@uk.mizuho-sc.com</stringValue>
<type>CONSTANT</type>
</item>
<item id="260" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="261">recipients</name>
<stringValue id="262">MiddlewareSupport@uk.mizuho-sc.com</stringValue>
<type>CONSTANT</type>
</item>
<item id="263" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="264">session</name>
<stringValue id="265">email/session</stringValue>
<type>REFERENCE</type>
</item>
<item id="266" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="267">subject</name>
<stringValue id="268">env</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="269" type="java.util.HashSet">
<item idref="241" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="270" type="java.util.HashSet">
<item id="271" type="com.j2fe.workflow.definition.Transition">
<name id="272">goto-next</name>
<source idref="243"/>
<target idref="10"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item idref="182" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="167"/>
</item>
</sources>
<targets id="273" type="java.util.HashSet">
<item idref="165" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="147"/>
</item>
</sources>
<targets id="274" type="java.util.HashSet">
<item idref="145" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="130"/>
</item>
</sources>
<targets id="275" type="java.util.HashSet">
<item idref="128" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="111"/>
</item>
</sources>
<targets id="276" type="java.util.HashSet">
<item idref="109" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="92"/>
</item>
</sources>
<targets id="277" type="java.util.HashSet">
<item idref="90" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="72"/>
</item>
</sources>
<targets id="278" type="java.util.HashSet">
<item id="279" type="com.j2fe.workflow.definition.Transition">
<name id="280">N</name>
<source idref="72"/>
<target id="281">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="282"/>
<directJoin>false</directJoin>
<name id="283">Bean Shell Script (Standard)</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="284">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="285" type="java.util.HashSet">
<item id="286" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="287">statements</name>
<stringValue id="288">String FTP_PATH="/gold/GSFTP/files/bbg_esb_temp";</stringValue>
<type>CONSTANT</type>
</item>
<item id="289" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="290">["FTP_PATH"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="291">variables["FTP_PATH"]</name>
<stringValue id="292">FTP_PATH</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="293" type="java.util.HashSet">
<item idref="279" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="294" type="java.util.HashSet">
<item id="295" type="com.j2fe.workflow.definition.Transition">
<name id="296">goto-next</name>
<source idref="281"/>
<target id="297">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="298"/>
<directJoin>false</directJoin>
<name id="299">Request Reply</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="300">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="301" type="java.util.HashSet">
<item id="302" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="303">["BBDownloadDirectory"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="304">input["BBDownloadDirectory"]</name>
<stringValue id="305">FTP_PATH</stringValue>
<type>VARIABLE</type>
</item>
<item id="306" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="307">["BBUploadDirectory"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="308">input["BBUploadDirectory"]</name>
<stringValue id="309">FTP_PATH</stringValue>
<type>VARIABLE</type>
</item>
<item id="310" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="311">["IDCFormat"]@com/j2fe/connector/IDCFormat@</UITypeHint>
<input>true</input>
<name id="312">input["IDCFormat"]</name>
<objectValue id="313" type="com.j2fe.connector.IDCFormat">SingelRecordLayout</objectValue>
<type>CONSTANT</type>
</item>
<item id="314" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="315">["IDCRR"]@java/lang/Boolean@</UITypeHint>
<input>true</input>
<name id="316">input["IDCRR"]</name>
<objectValue id="317" type="java.lang.Boolean">false</objectValue>
<type>CONSTANT</type>
</item>
<item id="318" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="319">["Message"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="320">input["Message"]</name>
<stringValue id="321">requestMessage</stringValue>
<type>VARIABLE</type>
<variablePart id="322">output[0].textData</variablePart>
</item>
<item id="323" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="324">name</name>
<stringValue id="325">Request Reply</stringValue>
<type>CONSTANT</type>
</item>
<item id="326" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="327">["RequestTransaction"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="328">output["RequestTransaction"]</name>
<stringValue id="329">RequestTrid</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<persistentVariables id="330" type="java.util.HashSet">
<item id="331" type="java.lang.String">requestMessage
1000</item>
</persistentVariables>
<sources id="332" type="java.util.HashSet">
<item idref="295" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="333" type="java.util.HashSet">
<item id="334" type="com.j2fe.workflow.definition.Transition">
<name id="335">goto-next</name>
<source idref="297"/>
<target id="336">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="337"/>
<directJoin>false</directJoin>
<name id="338">merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="339">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="340" type="java.util.HashSet">
<item idref="334" type="com.j2fe.workflow.definition.Transition"/>
<item id="341" type="com.j2fe.workflow.definition.Transition">
<name id="342">goto-next</name>
<source id="343">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="344"/>
<directJoin>false</directJoin>
<name id="345">Request Reply</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="346">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="347" type="java.util.HashSet">
<item id="348" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="349">["BBDownloadDirectory"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="350">input["BBDownloadDirectory"]</name>
<stringValue id="351">FTP_PATH</stringValue>
<type>VARIABLE</type>
</item>
<item id="352" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="353">["BBUploadDirectory"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="354">input["BBUploadDirectory"]</name>
<stringValue id="355">FTP_PATH</stringValue>
<type>VARIABLE</type>
</item>
<item id="356" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="357">["IDCFormat"]@com/j2fe/connector/IDCFormat@</UITypeHint>
<input>true</input>
<name id="358">input["IDCFormat"]</name>
<objectValue idref="313"/>
<type>CONSTANT</type>
</item>
<item id="359" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="360">["IDCRR"]@java/lang/Boolean@</UITypeHint>
<input>true</input>
<name id="361">input["IDCRR"]</name>
<objectValue id="362" type="java.lang.Boolean">false</objectValue>
<type>CONSTANT</type>
</item>
<item id="363" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="364">["Message"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="365">input["Message"]</name>
<stringValue id="366">FilteredRequestMessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="367" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="368">name</name>
<stringValue id="369">Request Reply</stringValue>
<type>CONSTANT</type>
</item>
<item id="370" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="371">["RequestTransaction"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="372">output["RequestTransaction"]</name>
<stringValue id="373">RequestTrid</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="374" type="java.util.HashSet">
<item id="375" type="com.j2fe.workflow.definition.Transition">
<name id="376">goto-next</name>
<source id="377">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="378"/>
<directJoin>false</directJoin>
<name id="379">Bean Shell Script (Standard)</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="380">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="381" type="java.util.HashSet">
<item id="382" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="383">statements</name>
<stringValue id="384">String FTP_PATH="/gold/GSFTP/files/bbg_esb_temp";</stringValue>
<type>CONSTANT</type>
</item>
<item id="385" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="386">["FTP_PATH"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="387">variables["FTP_PATH"]</name>
<stringValue id="388">FTP_PATH</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="389" type="java.util.HashSet">
<item id="390" type="com.j2fe.workflow.definition.Transition">
<name id="391">true</name>
<source idref="24"/>
<target idref="377"/>
</item>
</sources>
<targets id="392" type="java.util.HashSet">
<item idref="375" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="343"/>
</item>
</sources>
<targets id="393" type="java.util.HashSet">
<item idref="341" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="336"/>
</item>
</sources>
<targets id="394" type="java.util.HashSet">
<item id="395" type="com.j2fe.workflow.definition.Transition">
<name id="396">goto-next</name>
<source idref="336"/>
<target id="397">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="398"/>
<directJoin>false</directJoin>
<name id="399">AddToInventoryAndPublish</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="400">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="401" type="java.util.HashSet">
<item id="402" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="403">["PublishAssets"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="404">input["PublishAssets"]</name>
<stringValue id="405">PublishAssets</stringValue>
<type>VARIABLE</type>
</item>
<item id="406" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="407">["RequestTrid"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="408">input["RequestTrid"]</name>
<stringValue id="409">RequestTrid</stringValue>
<type>VARIABLE</type>
</item>
<item id="410" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="411">["TriggeredByCmfSOIAdditionFilter"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="412">input["TriggeredByCmfSOIAdditionFilter"]</name>
<objectValue id="413" type="java.lang.String">N</objectValue>
<type>CONSTANT</type>
</item>
<item id="414" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="415">name</name>
<stringValue id="416">AddToInventoryAndPublish</stringValue>
<type>CONSTANT</type>
</item>
<item id="417" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="418">output["TransactionIDList"]</name>
<stringValue id="419">AddToInventoryTrnIDs</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="420" type="java.util.HashSet">
<item idref="395" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="421" type="java.util.HashSet">
<item id="422" type="com.j2fe.workflow.definition.Transition">
<name id="423">goto-next</name>
<source idref="397"/>
<target id="424">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="425"/>
<directJoin>false</directJoin>
<name id="426">Triggered by cmfSOIAdditionForUnderlyers?</name>
<nodeHandler>com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandler>
<nodeHandlerClass id="427">com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandlerClass>
<parameters id="428" type="java.util.HashSet">
<item id="429" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="430">caseInsensitive</name>
<stringValue id="431">true</stringValue>
<type>CONSTANT</type>
</item>
<item id="432" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="433">caseItem</name>
<stringValue id="434">TriggeredByCmfSoiAdditionForUnderlyers</stringValue>
<type>VARIABLE</type>
</item>
<item id="435" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="436">defaultItem</name>
<stringValue id="437">Y</stringValue>
<type>CONSTANT</type>
</item>
<item id="438" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="439">nullTransition</name>
<stringValue id="440">Y</stringValue>
<type>CONSTANT</type>
</item>
<item id="441" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="442">trimSpaces</name>
<stringValue id="443">true</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="444" type="java.util.HashSet">
<item idref="422" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="445" type="java.util.HashSet">
<item id="446" type="com.j2fe.workflow.definition.Transition">
<name id="447">N</name>
<source idref="424"/>
<target id="448">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="449"/>
<directJoin>false</directJoin>
<name id="450">Triggered by BBPerSecurity Batch?</name>
<nodeHandler>com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandler>
<nodeHandlerClass id="451">com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandlerClass>
<parameters id="452" type="java.util.HashSet">
<item id="453" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="454">caseInsensitive</name>
<stringValue id="455">true</stringValue>
<type>CONSTANT</type>
</item>
<item id="456" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="457">caseItem</name>
<stringValue id="458">TriggeredByBBPerSecurityBatch</stringValue>
<type>VARIABLE</type>
</item>
<item id="459" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="460">defaultItem</name>
<stringValue id="461">Y</stringValue>
<type>CONSTANT</type>
</item>
<item id="462" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="463">nullTransition</name>
<stringValue id="464">Y</stringValue>
<type>CONSTANT</type>
</item>
<item id="465" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="466">trimSpaces</name>
<stringValue id="467">true</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="468" type="java.util.HashSet">
<item idref="446" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="469" type="java.util.HashSet">
<item id="470" type="com.j2fe.workflow.definition.Transition">
<name id="471">N</name>
<source idref="448"/>
<target id="472">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="473"/>
<directJoin>false</directJoin>
<name id="474">cmfSOIAdditionForUnderlyers</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="475">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="476" type="java.util.HashSet">
<item id="477" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="478">["RequestTransaction"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="479">input["RequestTransaction"]</name>
<stringValue id="480">RequestTrid</stringValue>
<type>VARIABLE</type>
</item>
<item id="481" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="482">["SOIName"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="483">input["SOIName"]</name>
<stringValue id="484">SOIName</stringValue>
<type>VARIABLE</type>
</item>
<item id="485" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="486">["SoiPurpType"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="487">input["SoiPurpType"]</name>
<stringValue id="488">SoiPurpType</stringValue>
<type>VARIABLE</type>
</item>
<item id="489" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="490">name</name>
<stringValue id="491">cmfSOIAdditionForUnderlyers</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="492" type="java.util.HashSet">
<item idref="470" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="493" type="java.util.HashSet">
<item id="494" type="com.j2fe.workflow.definition.Transition">
<name id="495">goto-next</name>
<source idref="472"/>
<target id="496">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="497"/>
<directJoin>false</directJoin>
<name id="498">merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="499">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="500" type="java.util.HashSet">
<item id="501" type="com.j2fe.workflow.definition.Transition">
<name id="502">Y</name>
<source idref="448"/>
<target idref="496"/>
</item>
<item id="503" type="com.j2fe.workflow.definition.Transition">
<name id="504">Y</name>
<source idref="424"/>
<target idref="496"/>
</item>
<item idref="494" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="505" type="java.util.HashSet">
<item id="506" type="com.j2fe.workflow.definition.Transition">
<name id="507">goto-next</name>
<source idref="496"/>
<target id="508">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="509"/>
<directJoin>false</directJoin>
<name id="510">Build TRNID Array</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="511">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="512" type="java.util.HashSet">
<item id="513" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="514">statements</name>
<stringValue id="515">String trnIds = csvTrnIDs;
String trnIDArrayIsNull = "N";

String[] trnIdArray = new String[0];

if (trnIds == null || "".equals(trnIds))
	{
		trnIDArrayIsNull = "Y";
	}
else
	{
		trnIdArray = trnIds.split(",");
	}
</stringValue>
<type>CONSTANT</type>
</item>
<item id="516" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="517">["csvTrnIDs"]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="518">variables["csvTrnIDs"]</name>
<stringValue id="519">AddToInventoryTrnIDs</stringValue>
<type>VARIABLE</type>
</item>
<item id="520" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="521">variables["trnIDArrayIsNull"]</name>
<stringValue id="522">trnIDArrayIsNull</stringValue>
<type>VARIABLE</type>
</item>
<item id="523" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="524">variables["trnIdArray"]</name>
<stringValue id="525">trnIDArray</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="526" type="java.util.HashSet">
<item idref="506" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="527" type="java.util.HashSet">
<item id="528" type="com.j2fe.workflow.definition.Transition">
<name id="529">goto-next</name>
<source idref="508"/>
<target id="530">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="531"/>
<directJoin>false</directJoin>
<name id="532">trnIDArray is Null?</name>
<nodeHandler>com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandler>
<nodeHandlerClass id="533">com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandlerClass>
<parameters id="534" type="java.util.HashSet">
<item id="535" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="536">caseItem</name>
<stringValue id="537">trnIDArrayIsNull</stringValue>
<type>VARIABLE</type>
</item>
<item id="538" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="539">defaultItem</name>
<stringValue id="540">Y</stringValue>
<type>CONSTANT</type>
</item>
<item id="541" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="542">nullTransition</name>
<stringValue id="543">Y</stringValue>
<type>CONSTANT</type>
</item>
<item id="544" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="545">trimSpaces</name>
<stringValue id="546">true</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="547" type="java.util.HashSet">
<item idref="528" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="548" type="java.util.HashSet">
<item id="549" type="com.j2fe.workflow.definition.Transition">
<name id="550">N</name>
<source idref="530"/>
<target id="551">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="552">Automatically generated</description>
<directJoin>false</directJoin>
<name id="553">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="554">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="555" type="java.util.HashSet">
<item idref="549" type="com.j2fe.workflow.definition.Transition"/>
<item id="556" type="com.j2fe.workflow.definition.Transition">
<name id="557">goto-next</name>
<source id="558">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="559"/>
<directJoin>false</directJoin>
<name id="560">Remote Event #Publishing</name>
<nodeHandler>com.j2fe.event.RaiseEventRemote</nodeHandler>
<nodeHandlerClass id="561">com.j2fe.event.RaiseEventRemote</nodeHandlerClass>
<parameters id="562" type="java.util.HashSet">
<item id="563" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="564">eventName</name>
<stringValue id="565">MizPublishForTxn_Event</stringValue>
<type>CONSTANT</type>
</item>
<item id="566" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="567">["No. Of Parallel Branches"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="568">parameters["No. Of Parallel Branches"]</name>
<objectValue id="569" type="java.lang.Integer">5</objectValue>
<type>CONSTANT</type>
</item>
<item id="570" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="571">["transactionId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="572">parameters["transactionId"]</name>
<stringValue id="573">vTrnID</stringValue>
<type>VARIABLE</type>
</item>
<item id="574" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="575">propertyFileLocation</name>
<stringValue id="576">db://resource/PublishingConfiguration/PublishingConfig.properties</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="577" type="java.util.HashSet">
<item id="578" type="com.j2fe.workflow.definition.Transition">
<name id="579">loop</name>
<source id="580">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="581"/>
<directJoin>false</directJoin>
<name id="582">For Loop</name>
<nodeHandler>com.j2fe.workflow.handler.impl.ForEach</nodeHandler>
<nodeHandlerClass id="583">com.j2fe.workflow.handler.impl.ForEach</nodeHandlerClass>
<parameters id="584" type="java.util.HashSet">
<item id="585" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="586">counter</name>
<stringValue id="587">Counter</stringValue>
<type>VARIABLE</type>
</item>
<item id="588" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="589">counter</name>
<stringValue id="590">Counter</stringValue>
<type>VARIABLE</type>
</item>
<item id="591" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="592">input</name>
<stringValue id="593">trnIDArray</stringValue>
<type>VARIABLE</type>
</item>
<item id="594" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="595">output</name>
<stringValue id="596">vTrnID</stringValue>
<type>VARIABLE</type>
</item>
<item id="597" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="598">resetOnEnd</name>
<stringValue id="599">true</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="600" type="java.util.HashSet">
<item id="601" type="com.j2fe.workflow.definition.Transition">
<name id="602">ToSplit</name>
<source idref="551"/>
<target idref="580"/>
</item>
</sources>
<targets id="603" type="java.util.HashSet">
<item id="604" type="com.j2fe.workflow.definition.Transition">
<name id="605">end-loop</name>
<source idref="580"/>
<target id="606">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="607">Automatically generated</description>
<directJoin>false</directJoin>
<name id="608">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="609">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="610" type="java.util.HashSet">
<item idref="604" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="611" type="java.util.HashSet">
<item id="612" type="com.j2fe.workflow.definition.Transition">
<name id="613">goto-next</name>
<source idref="606"/>
<target id="614">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="615"/>
<directJoin>false</directJoin>
<name id="616">merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="617">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="618" type="java.util.HashSet">
<item id="619" type="com.j2fe.workflow.definition.Transition">
<name id="620">Y</name>
<source idref="530"/>
<target idref="614"/>
</item>
<item idref="612" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="621" type="java.util.HashSet">
<item id="622" type="com.j2fe.workflow.definition.Transition">
<name id="623">goto-next</name>
<source idref="614"/>
<target idref="17"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item idref="578" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="558"/>
</item>
</sources>
<targets id="624" type="java.util.HashSet">
<item idref="556" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="551"/>
</item>
</sources>
<targets id="625" type="java.util.HashSet">
<item idref="601" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item idref="619" type="com.j2fe.workflow.definition.Transition"/>
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
<item idref="501" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</target>
</item>
<item idref="503" type="com.j2fe.workflow.definition.Transition"/>
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
<item idref="70" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="38"/>
</item>
</sources>
<targets id="626" type="java.util.HashSet">
<item idref="36" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="24"/>
</item>
</sources>
<targets id="627" type="java.util.HashSet">
<item idref="22" type="com.j2fe.workflow.definition.Transition"/>
<item idref="390" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="17"/>
</item>
<item idref="622" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="628" type="java.util.HashSet">
<item idref="15" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="10"/>
</item>
<item idref="271" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="629" type="java.util.HashSet">
<item idref="8" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="3"/>
</item>
</sources>
<targets id="630" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="631">Mizuho</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="632">user1</lastChangeUser>
<lastUpdate id="633">2025-10-18T06:21:57.000+0100</lastUpdate>
<name id="634">cmfSOIAddition</name>
<nodes id="635" type="java.util.HashSet">
<item idref="397" type="com.j2fe.workflow.definition.Node"/>
<item idref="281" type="com.j2fe.workflow.definition.Node"/>
<item idref="377" type="com.j2fe.workflow.definition.Node"/>
<item idref="508" type="com.j2fe.workflow.definition.Node"/>
<item idref="111" type="com.j2fe.workflow.definition.Node"/>
<item idref="243" type="com.j2fe.workflow.definition.Node"/>
<item idref="72" type="com.j2fe.workflow.definition.Node"/>
<item idref="580" type="com.j2fe.workflow.definition.Node"/>
<item idref="198" type="com.j2fe.workflow.definition.Node"/>
<item idref="225" type="com.j2fe.workflow.definition.Node"/>
<item idref="130" type="com.j2fe.workflow.definition.Node"/>
<item idref="92" type="com.j2fe.workflow.definition.Node"/>
<item idref="17" type="com.j2fe.workflow.definition.Node"/>
<item idref="551" type="com.j2fe.workflow.definition.Node"/>
<item idref="606" type="com.j2fe.workflow.definition.Node"/>
<item idref="10" type="com.j2fe.workflow.definition.Node"/>
<item idref="558" type="com.j2fe.workflow.definition.Node"/>
<item idref="343" type="com.j2fe.workflow.definition.Node"/>
<item idref="297" type="com.j2fe.workflow.definition.Node"/>
<item idref="24" type="com.j2fe.workflow.definition.Node"/>
<item idref="215" type="com.j2fe.workflow.definition.Node"/>
<item idref="3" type="com.j2fe.workflow.definition.Node"/>
<item idref="147" type="com.j2fe.workflow.definition.Node"/>
<item idref="448" type="com.j2fe.workflow.definition.Node"/>
<item idref="424" type="com.j2fe.workflow.definition.Node"/>
<item idref="184" type="com.j2fe.workflow.definition.Node"/>
<item idref="38" type="com.j2fe.workflow.definition.Node"/>
<item idref="472" type="com.j2fe.workflow.definition.Node"/>
<item idref="496" type="com.j2fe.workflow.definition.Node"/>
<item idref="614" type="com.j2fe.workflow.definition.Node"/>
<item idref="336" type="com.j2fe.workflow.definition.Node"/>
<item idref="167" type="com.j2fe.workflow.definition.Node"/>
<item idref="530" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>true</optimize>
<parameter id="636" type="java.util.HashMap">
<entry>
<key id="637" type="java.lang.String">AddToInventoryTrnIDs</key>
<value id="638" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="639">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>false</input>
<output>true</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="640" type="java.lang.String">Filter</key>
<value id="641" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="642">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="643">Run cmfSOIAdditionFilter workflow?
Possible values Y or N</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="644" type="java.lang.String">JMSTextMessage</key>
<value id="645" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="646">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="647">If the JMS message type is Text then this property contains the message.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="648" type="java.lang.String">PublishAssets</key>
<value id="649" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="650">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="651">Do you want to publish the assets? Y/N</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="652" type="java.lang.String">RequestTrid</key>
<value id="653" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="654">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>false</input>
<output>true</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="655" type="java.lang.String">SoiPurpType</key>
<value id="656" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="657">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="658" type="java.lang.String">TriggeredByBBPerSecurityBatch</key>
<value id="659" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="660">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="661" type="java.lang.String">TriggeredByCmfSoiAdditionForUnderlyers</key>
<value id="662" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="663">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
</parameter>
<permissions id="664" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>false</purgeAtEnd>
<retries>0</retries>
<startNode idref="215"/>
<status>RELEASED</status>
<variables id="665" type="java.util.HashMap">
<entry>
<key id="666" type="java.lang.String">AddToInventoryTrnIDs</key>
<value id="667" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="668">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="669" type="java.lang.String">Counter</key>
<value id="670" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="671">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<persistent>false</persistent>
<value id="672" type="java.lang.Integer">0</value>
</value>
</entry>
<entry>
<key id="673" type="java.lang.String">ETFSOIName</key>
<value id="674" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="675">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>true</persistent>
<value id="676" type="java.lang.String">MHI ETF Basket Inventory</value>
</value>
</entry>
<entry>
<key id="677" type="java.lang.String">EventJobIDs</key>
<value id="678" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="679">[Ljava.lang.String;</className>
<clazz>[Ljava.lang.String;</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="680" type="java.lang.String">Filter</key>
<value id="681" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="682">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="683">Run cmfSOIAdditionFilter workflow?
Possible values Y or N</description>
<persistent>true</persistent>
<value id="684" type="java.lang.String">Y</value>
</value>
</entry>
<entry>
<key id="685" type="java.lang.String">JMSTextMessage</key>
<value id="686" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="687">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="688">If the JMS message type is Text then this property contains the message.</description>
<persistent>true</persistent>
</value>
</entry>
<entry>
<key id="689" type="java.lang.String">LockSOIName</key>
<value id="690" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="691">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>true</persistent>
</value>
</entry>
<entry>
<key id="692" type="java.lang.String">PublishAssets</key>
<value id="693" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="694">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="695">Do you want to publish the assets? Y/N</description>
<persistent>false</persistent>
<value id="696" type="java.lang.String">N</value>
</value>
</entry>
<entry>
<key id="697" type="java.lang.String">RequestTrid</key>
<value id="698" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="699">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="700" type="java.lang.String">SoiPurpType</key>
<value id="701" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="702">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="703" type="java.lang.String">INTEREST</value>
</value>
</entry>
<entry>
<key id="704" type="java.lang.String">TriggeredByBBPerSecurityBatch</key>
<value id="705" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="706">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>true</persistent>
<value id="707" type="java.lang.String">N</value>
</value>
</entry>
<entry>
<key id="708" type="java.lang.String">TriggeredByCmfSoiAdditionForUnderlyers</key>
<value id="709" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="710">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>true</persistent>
<value id="711" type="java.lang.String">N</value>
</value>
</entry>
</variables>
<version>44</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
