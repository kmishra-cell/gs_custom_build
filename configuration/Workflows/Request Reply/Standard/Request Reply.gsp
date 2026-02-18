<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.07">
<package-comment/>
<businessobject displayString="18 - V10_TestFinal_02" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>false</alwaysPersist>
<clustered>false</clustered>
<comment id="1">V10_TestFinal_02</comment>
<description id="2">The Request Reply workflow is the main entry point for all Request Reply driven scenarios. It gets a Request Message as input, prepares the Request(s) and starts the vendor specific processing.</description>
<endNode id="3">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="4">END</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="5">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="6" type="java.util.HashSet">
<item id="7" type="com.j2fe.workflow.definition.Transition">
<name id="8">goto-next</name>
<source id="9">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="10">Close Transaction</name>
<nodeHandler>com.j2fe.streetlamp.activities.CloseTransaction</nodeHandler>
<nodeHandlerClass id="11">com.j2fe.streetlamp.activities.CloseTransaction</nodeHandlerClass>
<parameters id="12" type="java.util.HashSet">
<item id="13" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="14">submittedMessage</name>
<stringValue id="15">Message</stringValue>
<type>VARIABLE</type>
</item>
<item id="16" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="17">transactionId</name>
<stringValue id="18">RequestTransaction</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="19" type="java.util.HashSet">
<item id="20" type="com.j2fe.workflow.definition.Transition">
<name id="21">goto-next</name>
<source id="22">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="23">Report Notification</name>
<nodeHandler>com.j2fe.streetlamp.activities.ReportNotification</nodeHandler>
<nodeHandlerClass id="24">com.j2fe.streetlamp.activities.ReportNotification</nodeHandlerClass>
<parameters id="25" type="java.util.HashSet">
<item id="26" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="27">applicationId</name>
<stringValue id="28">VENDOR</stringValue>
<type>CONSTANT</type>
</item>
<item id="29" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="30">flushImmediate</name>
<stringValue id="31">true</stringValue>
<type>CONSTANT</type>
</item>
<item id="32" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="33">notificationId</name>
<stringValue id="34">9</stringValue>
<type>CONSTANT</type>
</item>
<item id="35" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="36">partId</name>
<stringValue id="37">REQREPLY</stringValue>
<type>CONSTANT</type>
</item>
<item id="38" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="39">transactionId</name>
<stringValue id="40">RequestTransaction</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="41" type="java.util.HashSet">
<item id="42" type="com.j2fe.workflow.definition.Transition">
<name id="43">false</name>
<source id="44">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="45">Switch Case</name>
<nodeHandler>com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandler>
<nodeHandlerClass id="46">com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandlerClass>
<parameters id="47" type="java.util.HashSet">
<item id="48" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="49">caseItem</name>
<stringValue id="50">IsIDCCountExceeded</stringValue>
<type>VARIABLE</type>
</item>
<item id="51" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="52">defaultItem</name>
<stringValue id="53">false</stringValue>
<type>CONSTANT</type>
</item>
<item id="54" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="55">nullTransition</name>
<stringValue id="56">false</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="57" type="java.util.HashSet">
<item id="58" type="com.j2fe.workflow.definition.Transition">
<name id="59">empty</name>
<source id="60">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="61">Prepare Requests</name>
<nodeHandler>com.j2fe.feeds.request.PrepareRequests</nodeHandler>
<nodeHandlerClass id="62">com.j2fe.feeds.request.PrepareRequests</nodeHandlerClass>
<parameters id="63" type="java.util.HashSet">
<item id="64" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="65">dataSource</name>
<stringValue id="66">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="67" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="68">dataType</name>
<stringValue id="69">DefaultDataType</stringValue>
<type>VARIABLE</type>
</item>
<item id="70" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="71">followUpRequestMessage</name>
<stringValue id="72">FollowUpRequestMessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="73" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="74">idContextTypeChkReqd</name>
<stringValue id="75">IDContextTypeChkReqd</stringValue>
<type>VARIABLE</type>
</item>
<item id="76" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="77">idcCountExceeded</name>
<stringValue id="78">IsIDCCountExceeded</stringValue>
<type>VARIABLE</type>
</item>
<item id="79" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="80">idcRR</name>
<stringValue id="81">IDCRR</stringValue>
<type>VARIABLE</type>
</item>
<item id="82" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="83">maxRequests</name>
<stringValue id="84">MaxRequestsPerFile</stringValue>
<type>VARIABLE</type>
</item>
<item id="85" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="86">queryByMarketSectorFirst</name>
<stringValue id="87">QueryByMarketSectorFirst</stringValue>
<type>VARIABLE</type>
</item>
<item id="88" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="89">requestMessage</name>
<stringValue id="90">Message</stringValue>
<type>VARIABLE</type>
</item>
<item id="91" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="92">requestMessages</name>
<stringValue id="93">Requests</stringValue>
<type>VARIABLE</type>
</item>
<item id="94" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="95">transactionID</name>
<stringValue id="96">RequestTransaction</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="97" type="java.util.HashSet">
<item id="98" type="com.j2fe.workflow.definition.Transition">
<name id="99">goto-next</name>
<source id="100">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="101">Create Request Transaction</name>
<nodeHandler>com.j2fe.streetlamp.activities.CreateTransaction</nodeHandler>
<nodeHandlerClass id="102">com.j2fe.streetlamp.activities.CreateTransaction</nodeHandlerClass>
<parameters id="103" type="java.util.HashSet">
<item id="104" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="105">flushImmediate</name>
<stringValue id="106">true</stringValue>
<type>CONSTANT</type>
</item>
<item id="107" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="108">jobId</name>
<stringValue id="109">ParentJobID</stringValue>
<type>VARIABLE</type>
</item>
<item id="110" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="111">transactionId</name>
<stringValue id="112">RequestTransaction</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="113" type="java.util.HashSet">
<item id="114" type="com.j2fe.workflow.definition.Transition">
<name id="115">goto-next</name>
<source id="116">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="117">START</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="118">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="119" type="java.util.HashSet"/>
<targets id="120" type="java.util.HashSet">
<item idref="114" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="100"/>
</item>
</sources>
<targets id="121" type="java.util.HashSet">
<item idref="98" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="60"/>
</item>
</sources>
<targets id="122" type="java.util.HashSet">
<item idref="58" type="com.j2fe.workflow.definition.Transition"/>
<item id="123" type="com.j2fe.workflow.definition.Transition">
<name id="124">not-empty</name>
<source idref="60"/>
<target id="125">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="126">Switch Case</name>
<nodeHandler>com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandler>
<nodeHandlerClass id="127">com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandlerClass>
<parameters id="128" type="java.util.HashSet">
<item id="129" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="130">caseItem</name>
<stringValue id="131">IsIDCCountExceeded</stringValue>
<type>VARIABLE</type>
</item>
<item id="132" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="133">defaultItem</name>
<stringValue id="134">false</stringValue>
<type>CONSTANT</type>
</item>
<item id="135" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="136">nullTransition</name>
<stringValue id="137">false</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="138" type="java.util.HashSet">
<item idref="123" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="139" type="java.util.HashSet">
<item id="140" type="com.j2fe.workflow.definition.Transition">
<name id="141">false</name>
<source idref="125"/>
<target id="142">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="143">Split Requests</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="144">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="145" type="java.util.HashSet">
<item id="146" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="147">["BBDownloadDirectory"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="148">input["BBDownloadDirectory"]</name>
<stringValue id="149">BBDownloadDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="150" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="151">["BBFileSystemType"]@com/j2fe/connector/BBFileSystemType@</UITypeHint>
<input>true</input>
<name id="152">input["BBFileSystemType"]</name>
<stringValue id="153">BBFileSystemType</stringValue>
<type>VARIABLE</type>
</item>
<item id="154" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="155">["BBResponseTimeout"]@java/lang/Long@</UITypeHint>
<input>true</input>
<name id="156">input["BBResponseTimeout"]</name>
<stringValue id="157">BBTimeout</stringValue>
<type>VARIABLE</type>
</item>
<item id="158" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="159">["BBUploadDirectory"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="160">input["BBUploadDirectory"]</name>
<stringValue id="161">BBUploadDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="162" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="163">["DnBProduct"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="164">input["DnBProduct"]</name>
<stringValue id="165">DnBProduct</stringValue>
<type>VARIABLE</type>
</item>
<item id="166" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="167">["IDCDownloadDirectory"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="168">input["IDCDownloadDirectory"]</name>
<stringValue id="169">IDCDownloadDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="170" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="171">["IDCFormat"]@com/j2fe/connector/IDCFormat@</UITypeHint>
<input>true</input>
<name id="172">input["IDCFormat"]</name>
<stringValue id="173">IDCFormat</stringValue>
<type>VARIABLE</type>
</item>
<item id="174" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="175">["IDCIterations"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="176">input["IDCIterations"]</name>
<stringValue id="177">IDCIterations</stringValue>
<type>VARIABLE</type>
</item>
<item id="178" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="179">["IDCRR"]@java/lang/Boolean@</UITypeHint>
<input>true</input>
<name id="180">input["IDCRR"]</name>
<stringValue id="181">IDCRR</stringValue>
<type>VARIABLE</type>
</item>
<item id="182" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="183">["InteractiveDataFileSuffix"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="184">input["InteractiveDataFileSuffix"]</name>
<stringValue id="185">InteractiveDataFileSuffix</stringValue>
<type>VARIABLE</type>
</item>
<item id="186" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="187">["InteractiveDataServiceID"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="188">input["InteractiveDataServiceID"]</name>
<stringValue id="189">InteractiveDataServiceID</stringValue>
<type>VARIABLE</type>
</item>
<item id="190" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="191">["InteractiveDataUniverseID"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="192">input["InteractiveDataUniverseID"]</name>
<stringValue id="193">InteractiveDataUniverseID</stringValue>
<type>VARIABLE</type>
</item>
<item id="194" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="195">["InteractiveDataUploadDirectory"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="196">input["InteractiveDataUploadDirectory"]</name>
<stringValue id="197">InteractiveDataUploadDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="198" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="199">["MaxRetryTime"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="200">input["MaxRetryTime"]</name>
<stringValue id="201">MaxRetryTime</stringValue>
<type>VARIABLE</type>
</item>
<item id="202" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="203">["Parent Job Id"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="204">input["Parent Job Id"]</name>
<stringValue id="205">ParentJobID</stringValue>
<type>VARIABLE</type>
</item>
<item id="206" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="207">["ProcessFilteredMessages"]@java/lang/Boolean@</UITypeHint>
<input>true</input>
<name id="208">input["ProcessFilteredMessages"]</name>
<stringValue id="209">ProcessFilteredMessages</stringValue>
<type>VARIABLE</type>
</item>
<item id="210" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="211">["RemoveDuplicateFieldsFlag"]@java/lang/Boolean@</UITypeHint>
<input>true</input>
<name id="212">input["RemoveDuplicateFieldsFlag"]</name>
<stringValue id="213">RemoveDuplicateFields</stringValue>
<type>VARIABLE</type>
</item>
<item id="214" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="215">["RequestTransaction"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="216">input["RequestTransaction"]</name>
<stringValue id="217">RequestTransaction</stringValue>
<type>VARIABLE</type>
</item>
<item id="218" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="219">["Requests"]@[Ljava/lang/Object;@</UITypeHint>
<input>true</input>
<name id="220">input["Requests"]</name>
<stringValue id="221">Requests</stringValue>
<type>VARIABLE</type>
</item>
<item id="222" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="223">["ReutersDSSDownloadDirectory"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="224">input["ReutersDSSDownloadDirectory"]</name>
<stringValue id="225">ReutersDSSDownloadDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="226" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="227">["ReutersDSSInputListName"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="228">input["ReutersDSSInputListName"]</name>
<stringValue id="229">ReutersDSSInputListName</stringValue>
<type>VARIABLE</type>
</item>
<item id="230" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="231">["ReutersDSSReportTemplateName"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="232">input["ReutersDSSReportTemplateName"]</name>
<stringValue id="233">ReutersDSSReportTemplateName</stringValue>
<type>VARIABLE</type>
</item>
<item id="234" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="235">["ReutersDSSRicMaintenanceMessageType"]@com/j2fe/processing/MessageType@</UITypeHint>
<input>true</input>
<name id="236">input["ReutersDSSRicMaintenanceMessageType"]</name>
<stringValue id="237">ReutersDSSRicMaintenanceMessageType</stringValue>
<type>VARIABLE</type>
</item>
<item id="238" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="239">["ReutersDSSScheduleName"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="240">input["ReutersDSSScheduleName"]</name>
<stringValue id="241">ReutersDSSScheduleName</stringValue>
<type>VARIABLE</type>
</item>
<item id="242" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="243">["ReutersDSSUploadDirectory"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="244">input["ReutersDSSUploadDirectory"]</name>
<stringValue id="245">ReutersDSSUploadDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="246" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="247">name</name>
<stringValue id="248">Split Requests</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="249" type="java.util.HashSet">
<item idref="140" type="com.j2fe.workflow.definition.Transition"/>
<item id="250" type="com.j2fe.workflow.definition.Transition">
<name id="251">goto-next</name>
<source id="252">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="253">Report Notification</name>
<nodeHandler>com.j2fe.streetlamp.activities.ReportNotification</nodeHandler>
<nodeHandlerClass id="254">com.j2fe.streetlamp.activities.ReportNotification</nodeHandlerClass>
<parameters id="255" type="java.util.HashSet">
<item id="256" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="257">applicationId</name>
<stringValue id="258">VENDOR</stringValue>
<type>CONSTANT</type>
</item>
<item id="259" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="260">flushImmediate</name>
<stringValue id="261">true</stringValue>
<type>CONSTANT</type>
</item>
<item id="262" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="263">notificationId</name>
<stringValue id="264">9</stringValue>
<type>CONSTANT</type>
</item>
<item id="265" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="266">partId</name>
<stringValue id="267">REQREPLY</stringValue>
<type>CONSTANT</type>
</item>
<item id="268" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="269">transactionId</name>
<stringValue id="270">RequestTransaction</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="271" type="java.util.HashSet">
<item id="272" type="com.j2fe.workflow.definition.Transition">
<name id="273">true</name>
<source idref="125"/>
<target idref="252"/>
</item>
</sources>
<targets id="274" type="java.util.HashSet">
<item idref="250" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="142"/>
</item>
</sources>
<targets id="275" type="java.util.HashSet">
<item id="276" type="com.j2fe.workflow.definition.Transition">
<name id="277">goto-next</name>
<source idref="142"/>
<target id="278">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="279">Check Follow Up Request Necessary</name>
<nodeHandler>com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandler>
<nodeHandlerClass id="280">com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandlerClass>
<parameters id="281" type="java.util.HashSet">
<item id="282" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="283">caseItem</name>
<stringValue id="284">FollowUpRequestMessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="285" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="286">defaultItem</name>
<stringValue id="287">true</stringValue>
<type>CONSTANT</type>
</item>
<item id="288" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="289">nullTransition</name>
<stringValue id="290">false</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="291" type="java.util.HashSet">
<item idref="276" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="292" type="java.util.HashSet">
<item id="293" type="com.j2fe.workflow.definition.Transition">
<name id="294">false</name>
<source idref="278"/>
<target id="295">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="296">Automatically generated</description>
<directJoin>false</directJoin>
<name id="297">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="298">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="299" type="java.util.HashSet">
<item idref="293" type="com.j2fe.workflow.definition.Transition"/>
<item id="300" type="com.j2fe.workflow.definition.Transition">
<name id="301">goto-next</name>
<source id="302">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="303">Automatically generated</description>
<directJoin>false</directJoin>
<name id="304">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="305">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="306" type="java.util.HashSet">
<item id="307" type="com.j2fe.workflow.definition.Transition">
<name id="308">empty</name>
<source id="309">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="310">Prepare FollowUp Requests</name>
<nodeHandler>com.j2fe.feeds.request.PrepareRequests</nodeHandler>
<nodeHandlerClass id="311">com.j2fe.feeds.request.PrepareRequests</nodeHandlerClass>
<parameters id="312" type="java.util.HashSet">
<item id="313" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="314">dataSource</name>
<stringValue id="315">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="316" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="317">maxRequests</name>
<stringValue id="318">MaxRequestsPerFile</stringValue>
<type>VARIABLE</type>
</item>
<item id="319" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="320">queryByMarketSectorFirst</name>
<stringValue id="321">QueryByMarketSectorFirst</stringValue>
<type>VARIABLE</type>
</item>
<item id="322" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="323">requestMessage</name>
<stringValue id="324">FollowUpRequestMessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="325" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="326">requestMessages</name>
<stringValue id="327">FollowUpRequests</stringValue>
<type>VARIABLE</type>
</item>
<item id="328" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="329">transactionID</name>
<stringValue id="330">RequestTransaction</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="331" type="java.util.HashSet">
<item id="332" type="com.j2fe.workflow.definition.Transition">
<name id="333">true</name>
<source idref="278"/>
<target idref="309"/>
</item>
</sources>
<targets id="334" type="java.util.HashSet">
<item idref="307" type="com.j2fe.workflow.definition.Transition"/>
<item id="335" type="com.j2fe.workflow.definition.Transition">
<name id="336">not-empty</name>
<source idref="309"/>
<target id="337">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="338">Split Follow Up Requests</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="339">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="340" type="java.util.HashSet">
<item id="341" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="342">["BBDownloadDirectory"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="343">input["BBDownloadDirectory"]</name>
<stringValue id="344">BBDownloadDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="345" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="346">["BBFileSystemType"]@com/j2fe/connector/BBFileSystemType@</UITypeHint>
<input>true</input>
<name id="347">input["BBFileSystemType"]</name>
<stringValue id="348">BBFileSystemType</stringValue>
<type>VARIABLE</type>
</item>
<item id="349" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="350">["BBResponseTimeout"]@java/lang/Long@</UITypeHint>
<input>true</input>
<name id="351">input["BBResponseTimeout"]</name>
<stringValue id="352">BBTimeout</stringValue>
<type>VARIABLE</type>
</item>
<item id="353" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="354">["BBUploadDirectory"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="355">input["BBUploadDirectory"]</name>
<stringValue id="356">BBUploadDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="357" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="358">["DnBProduct"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="359">input["DnBProduct"]</name>
<stringValue id="360">DnBProduct</stringValue>
<type>VARIABLE</type>
</item>
<item id="361" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="362">["InteractiveDataFileSuffix"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="363">input["InteractiveDataFileSuffix"]</name>
<stringValue id="364">InteractiveDataFileSuffix</stringValue>
<type>VARIABLE</type>
</item>
<item id="365" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="366">["InteractiveDataServiceID"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="367">input["InteractiveDataServiceID"]</name>
<stringValue id="368">InteractiveDataServiceID</stringValue>
<type>VARIABLE</type>
</item>
<item id="369" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="370">["InteractiveDataUniverseID"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="371">input["InteractiveDataUniverseID"]</name>
<stringValue id="372">InteractiveDataUniverseID</stringValue>
<type>VARIABLE</type>
</item>
<item id="373" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="374">["MaxRetryTime"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="375">input["MaxRetryTime"]</name>
<stringValue id="376">MaxRetryTime</stringValue>
<type>VARIABLE</type>
</item>
<item id="377" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="378">["Parent Job Id"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="379">input["Parent Job Id"]</name>
<stringValue id="380">ParentJobID</stringValue>
<type>VARIABLE</type>
</item>
<item id="381" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="382">["RequestTransaction"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="383">input["RequestTransaction"]</name>
<stringValue id="384">RequestTransaction</stringValue>
<type>VARIABLE</type>
</item>
<item id="385" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="386">["Requests"]@[Ljava/lang/Object;@</UITypeHint>
<input>true</input>
<name id="387">input["Requests"]</name>
<stringValue id="388">FollowUpRequests</stringValue>
<type>VARIABLE</type>
</item>
<item id="389" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="390">["ReutersDSSDownloadDirectory"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="391">input["ReutersDSSDownloadDirectory"]</name>
<stringValue id="392">ReutersDSSDownloadDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="393" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="394">["ReutersDSSInputListName"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="395">input["ReutersDSSInputListName"]</name>
<stringValue id="396">ReutersDSSInputListName</stringValue>
<type>VARIABLE</type>
</item>
<item id="397" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="398">["ReutersDSSReportTemplateName"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="399">input["ReutersDSSReportTemplateName"]</name>
<stringValue id="400">ReutersDSSReportTemplateName</stringValue>
<type>VARIABLE</type>
</item>
<item id="401" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="402">["ReutersDSSRicMaintenanceMessageType"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="403">input["ReutersDSSRicMaintenanceMessageType"]</name>
<stringValue id="404">ReutersDSSRicMaintenanceMessageType</stringValue>
<type>VARIABLE</type>
</item>
<item id="405" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="406">["ReutersDSSScheduleName"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="407">input["ReutersDSSScheduleName"]</name>
<stringValue id="408">ReutersDSSScheduleName</stringValue>
<type>VARIABLE</type>
</item>
<item id="409" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="410">["ReutersDSSUploadDirectory"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="411">input["ReutersDSSUploadDirectory"]</name>
<stringValue id="412">ReutersDSSUploadDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="413" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="414">name</name>
<stringValue id="415">Split Requests</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="416" type="java.util.HashSet">
<item idref="335" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="417" type="java.util.HashSet">
<item id="418" type="com.j2fe.workflow.definition.Transition">
<name id="419">goto-next</name>
<source idref="337"/>
<target idref="302"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="302"/>
</item>
<item idref="418" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="420" type="java.util.HashSet">
<item idref="300" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="295"/>
</item>
<item id="421" type="com.j2fe.workflow.definition.Transition">
<name id="422">true</name>
<source idref="44"/>
<target idref="295"/>
</item>
</sources>
<targets id="423" type="java.util.HashSet">
<item id="424" type="com.j2fe.workflow.definition.Transition">
<name id="425">ToSplit</name>
<source idref="295"/>
<target id="426">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="427">Database Select (Xor Split)</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="428">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="429" type="java.util.HashSet">
<item id="430" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="431">database</name>
<stringValue id="432">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="433" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="434">indexedParameters</name>
<stringValue id="435">RequestTransaction</stringValue>
<type>VARIABLE</type>
</item>
<item id="436" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="437">querySQL</name>
<stringValue id="438">SELECT DATA_SRC_ID FROM FT_T_VREQ WHERE TRN_ID=? AND DATA_SRC_ID='D&amp;B'</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="439" type="java.util.HashSet">
<item idref="424" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="440" type="java.util.HashSet">
<item id="441" type="com.j2fe.workflow.definition.Transition">
<name id="442">nothing-found</name>
<source idref="426"/>
<target id="443">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="444">Call Clean Up workflow</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="445">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="446" type="java.util.HashSet">
<item id="447" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="448">["RequestTransaction"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="449">input["RequestTransaction"]</name>
<stringValue id="450">RequestTransaction</stringValue>
<type>VARIABLE</type>
</item>
<item id="451" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="452">["RequestType"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="453">input["RequestType"]</name>
<objectValue id="454" type="java.lang.String">TKDelete</objectValue>
<type>CONSTANT</type>
</item>
<item id="455" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="456">name</name>
<stringValue id="457">Clean Up</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="458" type="java.util.HashSet">
<item idref="441" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="459" type="java.util.HashSet">
<item id="460" type="com.j2fe.workflow.definition.Transition">
<name id="461">goto-next</name>
<source idref="443"/>
<target id="462">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="463">Update Transaction</name>
<nodeHandler>com.j2fe.streetlamp.activities.UpdateTransaction</nodeHandler>
<nodeHandlerClass id="464">com.j2fe.streetlamp.activities.UpdateTransaction</nodeHandlerClass>
<parameters id="465" type="java.util.HashSet">
<item id="466" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="467">colName</name>
<stringValue id="468">appl_prod_typ</stringValue>
<type>CONSTANT</type>
</item>
<item id="469" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="470">colValue</name>
<stringValue id="471">SECURITIESANDPROD</stringValue>
<type>CONSTANT</type>
</item>
<item id="472" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="473">errMsg</name>
<stringValue id="474">ErrorMessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="475" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="476">transactionId</name>
<stringValue id="477">RequestTransaction</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="478" type="java.util.HashSet">
<item idref="460" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="479" type="java.util.HashSet">
<item id="480" type="com.j2fe.workflow.definition.Transition">
<name id="481">false</name>
<source idref="462"/>
<target id="482">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="483">Throw Error  #2</name>
<nodeHandler>com.j2fe.workflow.handler.impl.ThrowError</nodeHandler>
<nodeHandlerClass id="484">com.j2fe.workflow.handler.impl.ThrowError</nodeHandlerClass>
<parameters id="485" type="java.util.HashSet">
<item id="486" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="487">message</name>
<stringValue id="488">ErrorMessage</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="489" type="java.util.HashSet">
<item idref="480" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="490" type="java.util.HashSet">
<item id="491" type="com.j2fe.workflow.definition.Transition">
<name id="492">goto-next</name>
<source idref="482"/>
<target idref="9"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item id="493" type="com.j2fe.workflow.definition.Transition">
<name id="494">true</name>
<source idref="462"/>
<target idref="9"/>
</item>
</targets>
<type>XORSPLIT</type>
</target>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item id="495" type="com.j2fe.workflow.definition.Transition">
<name id="496">rows-found</name>
<source idref="426"/>
<target id="497">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="498">Update Transaction</name>
<nodeHandler>com.j2fe.streetlamp.activities.UpdateTransaction</nodeHandler>
<nodeHandlerClass id="499">com.j2fe.streetlamp.activities.UpdateTransaction</nodeHandlerClass>
<parameters id="500" type="java.util.HashSet">
<item id="501" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="502">colName</name>
<stringValue id="503">appl_prod_typ</stringValue>
<type>CONSTANT</type>
</item>
<item id="504" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="505">colValue</name>
<stringValue id="506">CUSTOMERANDCTPTY</stringValue>
<type>CONSTANT</type>
</item>
<item id="507" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="508">errMsg</name>
<stringValue id="509">ErrorMessageDnB</stringValue>
<type>VARIABLE</type>
</item>
<item id="510" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="511">transactionId</name>
<stringValue id="512">RequestTransaction</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="513" type="java.util.HashSet">
<item idref="495" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="514" type="java.util.HashSet">
<item id="515" type="com.j2fe.workflow.definition.Transition">
<name id="516">false</name>
<source idref="497"/>
<target id="517">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="518">Throw Error</name>
<nodeHandler>com.j2fe.workflow.handler.impl.ThrowError</nodeHandler>
<nodeHandlerClass id="519">com.j2fe.workflow.handler.impl.ThrowError</nodeHandlerClass>
<parameters id="520" type="java.util.HashSet">
<item id="521" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="522">message</name>
<stringValue id="523">ErrorMessageDnB</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="524" type="java.util.HashSet">
<item idref="515" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="525" type="java.util.HashSet">
<item id="526" type="com.j2fe.workflow.definition.Transition">
<name id="527">true</name>
<source idref="517"/>
<target idref="9"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item id="528" type="com.j2fe.workflow.definition.Transition">
<name id="529">true</name>
<source idref="497"/>
<target idref="9"/>
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
<item idref="332" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</target>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item idref="272" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</target>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="44"/>
</item>
</sources>
<targets id="530" type="java.util.HashSet">
<item idref="42" type="com.j2fe.workflow.definition.Transition"/>
<item idref="421" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="22"/>
</item>
</sources>
<targets id="531" type="java.util.HashSet">
<item idref="20" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="9"/>
</item>
<item idref="491" type="com.j2fe.workflow.definition.Transition"/>
<item idref="526" type="com.j2fe.workflow.definition.Transition"/>
<item idref="528" type="com.j2fe.workflow.definition.Transition"/>
<item idref="493" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="532" type="java.util.HashSet">
<item idref="7" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="3"/>
</item>
</sources>
<targets id="533" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="534">Request Reply/Standard</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="535">user1</lastChangeUser>
<lastUpdate id="536">2025-09-19T17:01:28.000+0100</lastUpdate>
<name id="537">Request Reply</name>
<nodes id="538" type="java.util.HashSet">
<item idref="443" type="com.j2fe.workflow.definition.Node"/>
<item idref="278" type="com.j2fe.workflow.definition.Node"/>
<item idref="9" type="com.j2fe.workflow.definition.Node"/>
<item idref="100" type="com.j2fe.workflow.definition.Node"/>
<item idref="426" type="com.j2fe.workflow.definition.Node"/>
<item idref="3" type="com.j2fe.workflow.definition.Node"/>
<item idref="295" type="com.j2fe.workflow.definition.Node"/>
<item idref="302" type="com.j2fe.workflow.definition.Node"/>
<item idref="309" type="com.j2fe.workflow.definition.Node"/>
<item idref="60" type="com.j2fe.workflow.definition.Node"/>
<item idref="252" type="com.j2fe.workflow.definition.Node"/>
<item idref="22" type="com.j2fe.workflow.definition.Node"/>
<item idref="116" type="com.j2fe.workflow.definition.Node"/>
<item idref="337" type="com.j2fe.workflow.definition.Node"/>
<item idref="142" type="com.j2fe.workflow.definition.Node"/>
<item idref="44" type="com.j2fe.workflow.definition.Node"/>
<item idref="125" type="com.j2fe.workflow.definition.Node"/>
<item idref="517" type="com.j2fe.workflow.definition.Node"/>
<item idref="482" type="com.j2fe.workflow.definition.Node"/>
<item idref="462" type="com.j2fe.workflow.definition.Node"/>
<item idref="497" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>true</optimize>
<parameter id="539" type="java.util.HashMap">
<entry>
<key id="540" type="java.lang.String">BBDownloadDirectory</key>
<value id="541" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="542">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="543">The directory where BB response files are downloaded from.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="544" type="java.lang.String">BBFileSystemType</key>
<value id="545" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="546">com.j2fe.connector.BBFileSystemType</className>
<clazz>com.j2fe.connector.BBFileSystemType</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="547" type="java.lang.String">BBTimeout</key>
<value id="548" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="549">java.lang.Long</className>
<clazz>java.lang.Long</clazz>
<description id="550">The Timeout for downloading the response file from BB.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="551" type="java.lang.String">BBUploadDirectory</key>
<value id="552" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="553">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="554">The directory where BB requests are uploaded to.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="555" type="java.lang.String">DefaultDataType</key>
<value id="556" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="557">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="558">The default data type used to determine the Request Type when no or no unique Request Type can be determined.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="559" type="java.lang.String">DnBProduct</key>
<value id="560" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="561">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="562">The DnBProduct to be used. Can be used to override the default DnBProduct configured in the Assembly.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="563" type="java.lang.String">IDCDownloadDirectory</key>
<value id="564" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="565">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="566">Download directory for IDC.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="567" type="java.lang.String">IDCFormat</key>
<value id="568" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="569">com.j2fe.connector.IDCFormat</className>
<clazz>com.j2fe.connector.IDCFormat</clazz>
<description id="570">The Layout format for IDC.</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="571" type="java.lang.String">IDCIterations</key>
<value id="572" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="573">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="574">The maximum number of iterations List Files should make for IDC. For each iteration the List Files will scan the IDC upload directory and wait for 5 seconds before going through the next iteration if the upload directory is not empty.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="575" type="java.lang.String">IDCRR</key>
<value id="576" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="577">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<description id="578">Variable to determine delivery mechanism to request. 'False' for Ad-hoc and 'True' for Request/Response.</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="579" type="java.lang.String">IDContextTypeChkReqd</key>
<value id="580" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="581">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<description id="582">It determines whether ID Context Type is checked to get a distinct Instrument for determining External Issue Type of an Issue for Bloomberg.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="583" type="java.lang.String">InteractiveDataFileSuffix</key>
<value id="584" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="585">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="586">The suffix to append to the files when uploading them to the IDC FTP server.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="587" type="java.lang.String">InteractiveDataServiceID</key>
<value id="588" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="589">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="590">The Service Id of the Universe to be used (required if an immediate response is needed)</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="591" type="java.lang.String">InteractiveDataUniverseID</key>
<value id="592" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="593">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="594">The Universe that should be maintained.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="595" type="java.lang.String">InteractiveDataUploadDirectory</key>
<value id="596" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="597">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="598">The directory where IDC requests are uploaded to.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="599" type="java.lang.String">MaxRequestsPerFile</key>
<value id="600" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="601">java.lang.Long</className>
<clazz>java.lang.Long</clazz>
<description id="602">The maximum number of requests per file. (e.g. Bloomberg supports a max of 20.000 Requests in a file, Telekurs a max. of 500)</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="603" type="java.lang.String">MaxRetryTime</key>
<value id="604" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="605">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="606">Maximum time (in seconds) upto which the filesystem would be scanned for files.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="607" type="java.lang.String">Message</key>
<value id="608" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="609">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="610">The Vendor Request XML message.</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="611" type="java.lang.String">ParentJobID</key>
<value id="612" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="613">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="614">Parent Job id is used to correlated all the child jobs.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="615" type="java.lang.String">ProcessFilteredMessages</key>
<value id="616" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="617">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<description id="618">Indicates that messages are processed regardless of the result of the Generic Inbound Filter.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="619" type="java.lang.String">QueryByMarketSectorFirst</key>
<value id="620" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="621">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<description id="622">If set to False, will always try to find out ReqType using InstrumentId and ExternalIss Typ, and if not found then only will try find out by Market Sector. (False for MnG).
Default is true.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="623" type="java.lang.String">RemoveDuplicateFields</key>
<value id="624" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="625">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<description id="626">If this is false the RemoveDuplicateFields activity will be disabled.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="627" type="java.lang.String">RequestTransaction</key>
<value id="628" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="629">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="630">The Parent Transaction created for all the Requests.</description>
<input>false</input>
<output>true</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="631" type="java.lang.String">ReutersDSSDownloadDirectory</key>
<value id="632" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="633">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="634">The directory where Reuters Datascope Select response files are downloaded from.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="635" type="java.lang.String">ReutersDSSInputListName</key>
<value id="636" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="637">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="638">The Reuters Datascope Select Input List Name to use. If not set, it is defaulted to the Request Type Name.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="639" type="java.lang.String">ReutersDSSReportTemplateName</key>
<value id="640" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="641">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="642">The Reuters Datascope Select Report Templae Name to use. If not set, it is defaulted to the Request Type Name.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="643" type="java.lang.String">ReutersDSSRicMaintenanceMessageType</key>
<value id="644" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="645">com.j2fe.processing.MessageType</className>
<clazz>com.j2fe.processing.MessageType</clazz>
<description id="646">If this value is set it indicates that RicMaintenance files should be processed and that this Message Type is used to process the files.</description>
<input>true</input>
<logicalType id="647">com.j2fe.processing.MessageType</logicalType>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="648" type="java.lang.String">ReutersDSSScheduleName</key>
<value id="649" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="650">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="651">The Reuters Datascope Select Schedule Name to use. If not set, it is defaulted to the Request Type Name.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="652" type="java.lang.String">ReutersDSSUploadDirectory</key>
<value id="653" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="654">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="655">The directory where Reuters Datascope Select requests are uploaded to.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
</parameter>
<permissions id="656" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>true</purgeAtEnd>
<retries>3</retries>
<startNode idref="116"/>
<status>RELEASED</status>
<variables id="657" type="java.util.HashMap">
<entry>
<key id="658" type="java.lang.String">BBDownloadDirectory</key>
<value id="659" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="660">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="661">The directory where BB response files are downloaded from.</description>
<persistent>false</persistent>
<value id="662" type="java.lang.String">/gold/GSFTP/files/bbg_esb_temp</value>
</value>
</entry>
<entry>
<key id="663" type="java.lang.String">BBFileSystemType</key>
<value id="664" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="665">com.j2fe.connector.BBFileSystemType</className>
<clazz>com.j2fe.connector.BBFileSystemType</clazz>
<persistent>false</persistent>
<value id="666" type="com.j2fe.connector.BBFileSystemType">SFTP</value>
</value>
</entry>
<entry>
<key id="667" type="java.lang.String">BBTimeout</key>
<value id="668" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="669">java.lang.Long</className>
<clazz>java.lang.Long</clazz>
<description id="670">The Timeout for downloading the response file from BB.</description>
<persistent>false</persistent>
<value id="671" type="java.lang.Long">3000</value>
</value>
</entry>
<entry>
<key id="672" type="java.lang.String">BBUploadDirectory</key>
<value id="673" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="674">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="675">The directory where BB requests are uploaded to.</description>
<persistent>false</persistent>
<value id="676" type="java.lang.String">/gold/GSFTP/files/bbg_esb_temp</value>
</value>
</entry>
<entry>
<key id="677" type="java.lang.String">DefaultDataType</key>
<value id="678" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="679">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="680">The default data type used to determine the Request Type when no or no unique Request Type can be determined.</description>
<persistent>false</persistent>
<value id="681" type="java.lang.String">BASIC</value>
</value>
</entry>
<entry>
<key id="682" type="java.lang.String">DnBProduct</key>
<value id="683" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="684">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="685">The DnBProduct to be used. Can be used to override the default DnBProduct configured in the Assembly.</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="686" type="java.lang.String">IDCDownloadDirectory</key>
<value id="687" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="688">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="689">Download directory for IDC.</description>
<persistent>false</persistent>
<value id="690" type="java.lang.String">/</value>
</value>
</entry>
<entry>
<key id="691" type="java.lang.String">IDCFormat</key>
<value id="692" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="693">com.j2fe.connector.IDCFormat</className>
<clazz>com.j2fe.connector.IDCFormat</clazz>
<description id="694">The Layout format for IDC.</description>
<persistent>false</persistent>
<value id="695" type="com.j2fe.connector.IDCFormat">SingelRecordLayout</value>
</value>
</entry>
<entry>
<key id="696" type="java.lang.String">IDCIterations</key>
<value id="697" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="698">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="699">The maximum number of iterations List Files should make for IDC. For each iteration the List Files will scan the IDC upload directory and wait for 5 seconds before going through the next iteration if the upload directory is not empty.</description>
<persistent>false</persistent>
<value id="700" type="java.lang.Integer">60</value>
</value>
</entry>
<entry>
<key id="701" type="java.lang.String">IDCRR</key>
<value id="702" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="703">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<description id="704">Variable to determine delivery mechanism to request. 'False' for Ad-hoc and 'True' for Request/Response.</description>
<persistent>false</persistent>
<value id="705" type="java.lang.Boolean">false</value>
</value>
</entry>
<entry>
<key id="706" type="java.lang.String">IDContextTypeChkReqd</key>
<value id="707" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="708">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<description id="709">It determines whether ID Context Type is checked to get a distinct Instrument for determining External Issue Type of an Issue for Bloomberg.</description>
<persistent>false</persistent>
<value id="710" type="java.lang.Boolean">true</value>
</value>
</entry>
<entry>
<key id="711" type="java.lang.String">InteractiveDataFileSuffix</key>
<value id="712" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="713">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="714">The suffix to append to the files when uploading them to the IDC FTP server.</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="715" type="java.lang.String">InteractiveDataServiceID</key>
<value id="716" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="717">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="718">The Service Id of the Universe to be used (required if an immediate response is needed)</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="719" type="java.lang.String">InteractiveDataUniverseID</key>
<value id="720" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="721">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="722">The Universe that should be maintained.</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="723" type="java.lang.String">InteractiveDataUploadDirectory</key>
<value id="724" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="725">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="726">The directory where IDC requests are uploaded to.</description>
<persistent>false</persistent>
<value id="727" type="java.lang.String">/</value>
</value>
</entry>
<entry>
<key id="728" type="java.lang.String">MaxRequestsPerFile</key>
<value id="729" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="730">java.lang.Long</className>
<clazz>java.lang.Long</clazz>
<description id="731">The maximum number of requests per file. (e.g. Bloomberg supports a max of 20.000 Requests in a file, Telekurs a max. of 500)</description>
<persistent>false</persistent>
<value id="732" type="java.lang.Long">500</value>
</value>
</entry>
<entry>
<key id="733" type="java.lang.String">MaxRetryTime</key>
<value id="734" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="735">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="736">Maximum time (in seconds) upto which the filesystem would be scanned for files.</description>
<persistent>false</persistent>
<value id="737" type="java.lang.Integer">900</value>
</value>
</entry>
<entry>
<key id="738" type="java.lang.String">Message</key>
<value id="739" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="740">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="741">The Vendor Request XML message.</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="742" type="java.lang.String">ParentJobID</key>
<value id="743" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="744">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="745">Parent Job id is used to correlated all the child jobs.</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="746" type="java.lang.String">ProcessFilteredMessages</key>
<value id="747" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="748">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<description id="749">Indicates that messages are processed regardless of the result of the Generic Inbound Filter.</description>
<persistent>false</persistent>
<value idref="705"/>
</value>
</entry>
<entry>
<key id="750" type="java.lang.String">QueryByMarketSectorFirst</key>
<value id="751" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="752">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<description id="753">If set to False, will always try to find out ReqType using InstrumentId and ExternalIss Typ, and if not found then only will try find out by Market Sector. (False for MnG).
Default is true.</description>
<persistent>false</persistent>
<value idref="705"/>
</value>
</entry>
<entry>
<key id="754" type="java.lang.String">RemoveDuplicateFields</key>
<value id="755" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="756">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<description id="757">If this is false the RemoveDuplicateFields activity will be disabled.</description>
<persistent>false</persistent>
<value idref="710"/>
</value>
</entry>
<entry>
<key id="758" type="java.lang.String">RequestTransaction</key>
<value id="759" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="760">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="761">The Parent Transaction created for all the Requests.</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="762" type="java.lang.String">ReutersDSSDownloadDirectory</key>
<value id="763" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="764">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="765">The directory where Reuters Datascope Select response files are downloaded from.</description>
<persistent>false</persistent>
<value id="766" type="java.lang.String">/reports</value>
</value>
</entry>
<entry>
<key id="767" type="java.lang.String">ReutersDSSInputListName</key>
<value id="768" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="769">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="770">The Reuters Datascope Select Input List Name to use. If not set, it is defaulted to the Request Type Name.</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="771" type="java.lang.String">ReutersDSSReportTemplateName</key>
<value id="772" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="773">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="774">The Reuters Datascope Select Report Templae Name to use. If not set, it is defaulted to the Request Type Name.</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="775" type="java.lang.String">ReutersDSSRicMaintenanceMessageType</key>
<value id="776" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="777">com.j2fe.processing.MessageType</className>
<clazz>com.j2fe.processing.MessageType</clazz>
<description id="778">If this value is set it indicates that RicMaintenance files should be processed and that this Message Type is used to process the files.</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="779" type="java.lang.String">ReutersDSSScheduleName</key>
<value id="780" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="781">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="782">The Reuters Datascope Select Schedule Name to use. If not set, it is defaulted to the Request Type Name.</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="783" type="java.lang.String">ReutersDSSUploadDirectory</key>
<value id="784" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="785">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="786">The directory where Reuters Datascope Select requests are uploaded to.</description>
<persistent>false</persistent>
<value id="787" type="java.lang.String">/incoming</value>
</value>
</entry>
</variables>
<version>18</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
