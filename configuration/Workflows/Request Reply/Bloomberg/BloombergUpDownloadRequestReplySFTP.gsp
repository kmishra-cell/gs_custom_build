<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.11">
<package-comment/>
<businessobject displayString="12 - v10 Persisted Variable ForwardedTransactionId" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>false</alwaysPersist>
<clustered>false</clustered>
<comment id="1">v10 Persisted Variable ForwardedTransactionId</comment>
<description id="2">This workflow creates the request file and uploads it to Bloomberg. After having the file uploaded it checks if there is an Error file (UploadFileName.req.err) or a Response file (UploadFileName.out) available within a certain amount of time. If an Error file is available it indicates that an invalid file was uploaded to Bloomberg. In this case the Error reporting workflow is called which sets the status of the Vendor Requests to failed and the workflow finishes. If there is no file found within the configured time also the Error reporting workflow is called and the workflow finishes. If a Response file is found then the BloombergProcessFiles workflow is called.</description>
<endNode id="3">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="4"/>
<directJoin>false</directJoin>
<name id="5">END</name>
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
<name id="12">Close Transaction #1</name>
<nodeHandler>com.j2fe.streetlamp.activities.CloseTransaction</nodeHandler>
<nodeHandlerClass id="13">com.j2fe.streetlamp.activities.CloseTransaction</nodeHandlerClass>
<parameters id="14" type="java.util.HashSet">
<item id="15" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="16">transactionId</name>
<stringValue id="17">ForwardedTransactionID</stringValue>
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
<name id="23">Call Report Error</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="24">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="25" type="java.util.HashSet">
<item id="26" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="27">["ApplicationId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="28">input["ApplicationId"]</name>
<objectValue id="29" type="java.lang.String">VENDOR</objectValue>
<type>CONSTANT</type>
</item>
<item id="30" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="31">["ErrorText"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="32">input["ErrorText"]</name>
<objectValue id="33" type="java.lang.String">Error processing request file. Please check error file on Bloomberg FTP server.</objectValue>
<type>CONSTANT</type>
</item>
<item id="34" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="35">["FileName"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="36">input["FileName"]</name>
<stringValue id="37">ErrorFileName</stringValue>
<type>VARIABLE</type>
</item>
<item id="38" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="39">["NotificationId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="40">input["NotificationId"]</name>
<objectValue id="41" type="java.lang.String">3</objectValue>
<type>CONSTANT</type>
</item>
<item id="42" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="43">["PartId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="44">input["PartId"]</name>
<objectValue id="45" type="java.lang.String">REQREPLY</objectValue>
<type>CONSTANT</type>
</item>
<item id="46" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="47">["TRID"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="48">input["TRID"]</name>
<stringValue id="49">ForwardedTransactionID</stringValue>
<type>VARIABLE</type>
</item>
<item id="50" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="51">["VREQOIDS"]@[Ljava/lang/String;@</UITypeHint>
<input>true</input>
<name id="52">input["VREQOIDS"]</name>
<stringValue id="53">AllRequestOIDs</stringValue>
<type>VARIABLE</type>
</item>
<item id="54" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="55">name</name>
<stringValue id="56">Report Error</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="57" type="java.util.HashSet">
<item id="58" type="com.j2fe.workflow.definition.Transition">
<name id="59">true</name>
<source id="60">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="61"/>
<directJoin>false</directJoin>
<name id="62">Error File available?</name>
<nodeHandler>com.j2fe.general.activities.RegExCondition</nodeHandler>
<nodeHandlerClass id="63">com.j2fe.general.activities.RegExCondition</nodeHandlerClass>
<parameters id="64" type="java.util.HashSet">
<item id="65" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="66">expression</name>
<stringValue id="67">.err</stringValue>
<type>CONSTANT</type>
</item>
<item id="68" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="69">find</name>
<stringValue id="70">true</stringValue>
<type>CONSTANT</type>
</item>
<item id="71" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="72">input</name>
<stringValue id="73">ResponseFiles</stringValue>
<type>VARIABLE</type>
<variablePart id="74">[0].path</variablePart>
</item>
<item id="75" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="76">literal</name>
<stringValue id="77">true</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<persistentVariables id="78" type="java.util.HashSet">
<item id="79" type="java.lang.String">ReplyFileName
0100</item>
<item id="80" type="java.lang.String">loopCounter
0100</item>
<item id="81" type="java.lang.String">FileName
0100</item>
<item id="82" type="java.lang.String">TranslationResult
0100</item>
<item id="83" type="java.lang.String">ErrorFileName
0100</item>
</persistentVariables>
<sources id="84" type="java.util.HashSet">
<item id="85" type="com.j2fe.workflow.definition.Transition">
<name id="86">true</name>
<source id="87">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="88"/>
<directJoin>false</directJoin>
<name id="89">Download Response File</name>
<nodeHandler>com.j2fe.feeds.activities.WaitForFiles</nodeHandler>
<nodeHandlerClass id="90">com.j2fe.feeds.activities.WaitForFiles</nodeHandlerClass>
<parameters id="91" type="java.util.HashSet">
<item id="92" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="93">directory</name>
<stringValue id="94">DownloadDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="95" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="96">fileSystem</name>
<stringValue id="97">filesystem/sftp/bloomberg/persecuritysftp</stringValue>
<type>REFERENCE</type>
</item>
<item id="98" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="99">ftpTimedOut</name>
<stringValue id="100">FTPTimedOut</stringValue>
<type>VARIABLE</type>
</item>
<item id="101" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="102">globPatterns[0]</name>
<stringValue id="103">ReplyFileName</stringValue>
<type>VARIABLE</type>
</item>
<item id="104" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="105">globPatterns[1]</name>
<stringValue id="106">ErrorFileName</stringValue>
<type>VARIABLE</type>
</item>
<item id="107" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="108">isFailOverConnection</name>
<stringValue id="109">false</stringValue>
<type>CONSTANT</type>
</item>
<item id="110" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="111">items</name>
<stringValue id="112">ResponseFiles</stringValue>
<type>VARIABLE</type>
</item>
<item id="113" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="114">scanPeriod</name>
<stringValue id="115">15</stringValue>
<type>CONSTANT</type>
</item>
<item id="116" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="117">timeout</name>
<stringValue id="118">3000</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<persistentVariables id="119" type="java.util.HashSet">
<item id="120" type="java.lang.String">ErrorFileName
1000</item>
<item id="121" type="java.lang.String">ReplyFileName
1000</item>
<item id="122" type="java.lang.String">FileName
1000</item>
<item id="123" type="java.lang.String">TranslationResult
1000</item>
</persistentVariables>
<sources id="124" type="java.util.HashSet">
<item id="125" type="com.j2fe.workflow.definition.Transition">
<name id="126">goto-next</name>
<source id="127">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="128"/>
<directJoin>false</directJoin>
<name id="129">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="130">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="131" type="java.util.HashSet">
<item id="132" type="com.j2fe.workflow.definition.Transition">
<name id="133">loop</name>
<source id="134">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="135"/>
<directJoin>false</directJoin>
<name id="136">Simple For Loop</name>
<nodeHandler>com.j2fe.workflow.handler.impl.SimpleForEach</nodeHandler>
<nodeHandlerClass id="137">com.j2fe.workflow.handler.impl.SimpleForEach</nodeHandlerClass>
<parameters id="138" type="java.util.HashSet">
<item id="139" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="140">counter</name>
<stringValue id="141">loopCounter</stringValue>
<type>VARIABLE</type>
</item>
<item id="142" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="143">counter</name>
<stringValue id="144">loopCounter</stringValue>
<type>VARIABLE</type>
</item>
<item id="145" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="146">incrementValue</name>
<stringValue id="147">300</stringValue>
<type>CONSTANT</type>
</item>
<item id="148" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="149">loopLength</name>
<stringValue id="150">iteration</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="151" type="java.util.HashSet">
<item id="152" type="com.j2fe.workflow.definition.Transition">
<name id="153">goto-next</name>
<source id="154">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="155"/>
<directJoin>false</directJoin>
<name id="156">NOP</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="157">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="158" type="java.util.HashSet">
<item id="159" type="com.j2fe.workflow.definition.Transition">
<name id="160">goto-next</name>
<source id="161">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="162"/>
<directJoin>false</directJoin>
<name id="163">Status -&gt; REQUESTED</name>
<nodeHandler>com.j2fe.feeds.request.UpdateVREQ</nodeHandler>
<nodeHandlerClass id="164">com.j2fe.feeds.request.UpdateVREQ</nodeHandlerClass>
<parameters id="165" type="java.util.HashSet">
<item id="166" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="167">fileName</name>
<stringValue id="168">ReplyFileName</stringValue>
<type>VARIABLE</type>
</item>
<item id="169" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="170">requestOIDs</name>
<stringValue id="171">AllRequestOIDs</stringValue>
<type>VARIABLE</type>
</item>
<item id="172" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="173">status</name>
<stringValue id="174">REQUESTED</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="175" type="java.util.HashSet">
<item id="176" type="com.j2fe.workflow.definition.Transition">
<name id="177">goto-next</name>
<source id="178">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="179"/>
<directJoin>false</directJoin>
<name id="180">Create Download File Names</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="181">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="182" type="java.util.HashSet">
<item id="183" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="184">statements</name>
<stringValue id="185">import java.lang.StringBuilder;

StringBuilder sb = new StringBuilder(FileName);

String responseFileName = sb.toString().replace("req", "out");
String errorFileName = sb.append(".err").toString();
int loopCounter=0;
if(0==maxRetryTime){
maxRetryTime=900;
}
int iteration=maxRetryTime;</stringValue>
<type>CONSTANT</type>
</item>
<item id="186" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="187">variables["FileName"]</name>
<stringValue id="188">FileName</stringValue>
<type>VARIABLE</type>
</item>
<item id="189" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="190">["errorFileName"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="191">variables["errorFileName"]</name>
<stringValue id="192">ErrorFileName</stringValue>
<type>VARIABLE</type>
</item>
<item id="193" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="194">["iteration"]@java/lang/Integer@</UITypeHint>
<input>false</input>
<name id="195">variables["iteration"]</name>
<stringValue id="196">iteration</stringValue>
<type>VARIABLE</type>
</item>
<item id="197" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="198">["loopCounter"]@java/lang/Integer@</UITypeHint>
<input>false</input>
<name id="199">variables["loopCounter"]</name>
<stringValue id="200">loopCounter</stringValue>
<type>VARIABLE</type>
</item>
<item id="201" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="202">["maxRetryTime"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="203">variables["maxRetryTime"]</name>
<stringValue id="204">MaxRetryTime</stringValue>
<type>VARIABLE</type>
</item>
<item id="205" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="206">["responseFileName"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="207">variables["responseFileName"]</name>
<stringValue id="208">ReplyFileName</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="209" type="java.util.HashSet">
<item id="210" type="com.j2fe.workflow.definition.Transition">
<name id="211">goto-next</name>
<source id="212">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="213"/>
<directJoin>false</directJoin>
<name id="214">Upload File</name>
<nodeHandler>com.j2fe.feeds.activities.UploadFile</nodeHandler>
<nodeHandlerClass id="215">com.j2fe.feeds.activities.UploadFile</nodeHandlerClass>
<parameters id="216" type="java.util.HashSet">
<item id="217" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="218">directory</name>
<stringValue id="219">UploadDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="220" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="221">fileName</name>
<stringValue id="222">FilePattern</stringValue>
<type>VARIABLE</type>
</item>
<item id="223" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="224">fileName</name>
<stringValue id="225">FileName</stringValue>
<type>VARIABLE</type>
</item>
<item id="226" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="227">fileSystem</name>
<stringValue id="228">filesystem/local</stringValue>
<type>REFERENCE</type>
</item>
<item id="229" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="230">inputText</name>
<stringValue id="231">ResponseArray</stringValue>
<type>VARIABLE</type>
<variablePart id="232">[0]</variablePart>
</item>
</parameters>
<sources id="233" type="java.util.HashSet">
<item id="234" type="com.j2fe.workflow.definition.Transition">
<name id="235">goto-next</name>
<source id="236">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="237"/>
<directJoin>false</directJoin>
<name id="238">RemoveDuplicateFields</name>
<nodeHandler>com.j2fe.feeds.request.RemoveDuplicateFields</nodeHandler>
<nodeHandlerClass id="239">com.j2fe.feeds.request.RemoveDuplicateFields</nodeHandlerClass>
<parameters id="240" type="java.util.HashSet">
<item id="241" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="242">removeDuplicateFlag</name>
<stringValue id="243">RemoveDuplicateFields</stringValue>
<type>VARIABLE</type>
</item>
<item id="244" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="245">requestArray</name>
<stringValue id="246">TranslationResult</stringValue>
<type>VARIABLE</type>
</item>
<item id="247" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="248">responseArray</name>
<stringValue id="249">ResponseArray</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="250" type="java.util.HashSet">
<item id="251" type="com.j2fe.workflow.definition.Transition">
<name id="252">goto-next</name>
<source id="253">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="254"/>
<directJoin>false</directJoin>
<name id="255">Translation</name>
<nodeHandler>com.j2fe.translation.activities.Translation</nodeHandler>
<nodeHandlerClass id="256">com.j2fe.translation.activities.Translation</nodeHandlerClass>
<parameters id="257" type="java.util.HashSet">
<item id="258" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="259">component</name>
<stringValue id="260">xslt</stringValue>
<type>CONSTANT</type>
</item>
<item id="261" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="262">input</name>
<stringValue id="263">VendorRequestString</stringValue>
<type>VARIABLE</type>
</item>
<item id="264" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="265">mapping</name>
<stringValue id="266">XSLTMappingFile</stringValue>
<type>VARIABLE</type>
</item>
<item id="267" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="268">["Firmname"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="269">metaData["Firmname"]</name>
<stringValue id="270">firmname</stringValue>
<type>VARIABLE</type>
</item>
<item id="271" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="272">plainOutput</name>
<stringValue id="273">TranslationResult</stringValue>
<type>VARIABLE</type>
</item>
<item id="274" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="275">wantedOutputType</name>
<stringValue id="276">Text</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="277" type="java.util.HashSet">
<item id="278" type="com.j2fe.workflow.definition.Transition">
<name id="279">goto-next</name>
<source id="280">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="281"/>
<directJoin>false</directJoin>
<name id="282">Set Firmname</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="283">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="284" type="java.util.HashSet">
<item id="285" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="286">statements</name>
<stringValue id="287">username = key;&#13;
if(key != null &amp;&amp; key.indexOf("@") != -1)&#13;
     username=key.substring(0,key.indexOf("@"));&#13;
</stringValue>
<type>CONSTANT</type>
</item>
<item id="288" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="289">["key"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="290">variables["key"]</name>
<objectValue id="291" type="java.lang.String">dl207481</objectValue>
<type>CONSTANT</type>
</item>
<item id="292" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="293">["username"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="294">variables["username"]</name>
<stringValue id="295">firmname</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="296" type="java.util.HashSet">
<item id="297" type="com.j2fe.workflow.definition.Transition">
<name id="298">goto-next</name>
<source id="299">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="300"/>
<directJoin>false</directJoin>
<name id="301">Create Transaction #1</name>
<nodeHandler>com.j2fe.streetlamp.activities.CreateTransaction</nodeHandler>
<nodeHandlerClass id="302">com.j2fe.streetlamp.activities.CreateTransaction</nodeHandlerClass>
<parameters id="303" type="java.util.HashSet">
<item id="304" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="305">flushImmediate</name>
<stringValue id="306">true</stringValue>
<type>CONSTANT</type>
</item>
<item id="307" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="308">originalTransactionId</name>
<stringValue id="309">RequestTransaction</stringValue>
<type>VARIABLE</type>
</item>
<item id="310" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="311">transactionId</name>
<stringValue id="312">ForwardedTransactionID</stringValue>
<type>VARIABLE</type>
<variablePart id="313"/>
</item>
</parameters>
<persistentVariables id="314" type="java.util.HashSet">
<item id="315" type="java.lang.String">ForwardedTransactionID
1000</item>
</persistentVariables>
<sources id="316" type="java.util.HashSet">
<item id="317" type="com.j2fe.workflow.definition.Transition">
<name id="318">goto-next</name>
<source id="319">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="320"/>
<directJoin>false</directJoin>
<name id="321">START</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="322">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="323" type="java.util.HashSet"/>
<targets id="324" type="java.util.HashSet">
<item idref="317" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="299"/>
</item>
</sources>
<targets id="325" type="java.util.HashSet">
<item idref="297" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="280"/>
</item>
</sources>
<targets id="326" type="java.util.HashSet">
<item idref="278" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="253"/>
</item>
</sources>
<targets id="327" type="java.util.HashSet">
<item idref="251" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="236"/>
</item>
</sources>
<targets id="328" type="java.util.HashSet">
<item idref="234" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="212"/>
</item>
</sources>
<targets id="329" type="java.util.HashSet">
<item idref="210" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="178"/>
</item>
</sources>
<targets id="330" type="java.util.HashSet">
<item idref="176" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="161"/>
</item>
</sources>
<targets id="331" type="java.util.HashSet">
<item idref="159" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="154"/>
</item>
<item id="332" type="com.j2fe.workflow.definition.Transition">
<name id="333">goto-next</name>
<source id="334">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="335"/>
<directJoin>false</directJoin>
<name id="336">Wait</name>
<nodeHandler>com.j2fe.scheduling.activities.Wait</nodeHandler>
<nodeHandlerClass id="337">com.j2fe.scheduling.activities.Wait</nodeHandlerClass>
<parameters id="338" type="java.util.HashSet">
<item id="339" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="340">secondsToWait</name>
<stringValue id="341">300</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<persistentVariables id="342" type="java.util.HashSet">
<item id="343" type="java.lang.String">loopCounter
1000</item>
<item id="344" type="java.lang.String">FTPTimedOut
1000</item>
<item id="345" type="java.lang.String">iteration
1000</item>
</persistentVariables>
<sources id="346" type="java.util.HashSet">
<item id="347" type="com.j2fe.workflow.definition.Transition">
<name id="348">false</name>
<source id="349">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="350"/>
<directJoin>false</directJoin>
<name id="351">Is SFTP Timed Out?</name>
<nodeHandler>com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandler>
<nodeHandlerClass id="352">com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandlerClass>
<parameters id="353" type="java.util.HashSet">
<item id="354" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="355">caseItem</name>
<stringValue id="356">FTPTimedOut</stringValue>
<type>VARIABLE</type>
</item>
<item id="357" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="358">defaultItem</name>
<stringValue id="359">false</stringValue>
<type>CONSTANT</type>
</item>
<item id="360" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="361">nullTransition</name>
<stringValue id="362">false</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="363" type="java.util.HashSet">
<item id="364" type="com.j2fe.workflow.definition.Transition">
<name id="365">false</name>
<source idref="87"/>
<target idref="349"/>
</item>
</sources>
<targets id="366" type="java.util.HashSet">
<item idref="347" type="com.j2fe.workflow.definition.Transition"/>
<item id="367" type="com.j2fe.workflow.definition.Transition">
<name id="368">true</name>
<source idref="349"/>
<target id="369">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="370"/>
<directJoin>false</directJoin>
<name id="371">Call Report Error</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="372">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="373" type="java.util.HashSet">
<item id="374" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="375">["ApplicationId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="376">input["ApplicationId"]</name>
<objectValue id="377" type="java.lang.String">VENDOR</objectValue>
<type>CONSTANT</type>
</item>
<item id="378" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="379">["ErrorText"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="380">input["ErrorText"]</name>
<objectValue id="381" type="java.lang.String">Timeout getting response file from Bloomberg.</objectValue>
<type>CONSTANT</type>
</item>
<item id="382" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="383">["FileName"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="384">input["FileName"]</name>
<stringValue id="385">ReplyFileName</stringValue>
<type>VARIABLE</type>
</item>
<item id="386" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="387">["NotificationId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="388">input["NotificationId"]</name>
<objectValue id="389" type="java.lang.String">2</objectValue>
<type>CONSTANT</type>
</item>
<item id="390" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="391">["PartId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="392">input["PartId"]</name>
<objectValue id="393" type="java.lang.String">REQREPLY</objectValue>
<type>CONSTANT</type>
</item>
<item id="394" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="395">["TRID"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="396">input["TRID"]</name>
<stringValue id="397">ForwardedTransactionID</stringValue>
<type>VARIABLE</type>
</item>
<item id="398" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="399">["VREQOIDS"]@[Ljava/lang/String;@</UITypeHint>
<input>true</input>
<name id="400">input["VREQOIDS"]</name>
<stringValue id="401">AllRequestOIDs</stringValue>
<type>VARIABLE</type>
</item>
<item id="402" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="403">name</name>
<stringValue id="404">Report Error</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<persistentVariables id="405" type="java.util.HashSet">
<item id="406" type="java.lang.String">ReplyFileName
0100</item>
<item id="407" type="java.lang.String">FileName
0100</item>
<item id="408" type="java.lang.String">TranslationResult
0100</item>
<item id="409" type="java.lang.String">ErrorFileName
0100</item>
</persistentVariables>
<sources id="410" type="java.util.HashSet">
<item id="411" type="com.j2fe.workflow.definition.Transition">
<name id="412">goto-next</name>
<source id="413">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="414"/>
<directJoin>false</directJoin>
<name id="415">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="416">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="417" type="java.util.HashSet">
<item id="418" type="com.j2fe.workflow.definition.Transition">
<name id="419">end-loop</name>
<source idref="134"/>
<target idref="413"/>
</item>
</sources>
<targets id="420" type="java.util.HashSet">
<item idref="411" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="369"/>
</item>
<item idref="367" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="421" type="java.util.HashSet">
<item id="422" type="com.j2fe.workflow.definition.Transition">
<name id="423">goto-next</name>
<source idref="369"/>
<target idref="10"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="334"/>
</item>
</sources>
<targets id="424" type="java.util.HashSet">
<item idref="332" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="154"/>
</item>
</sources>
<targets id="425" type="java.util.HashSet">
<item idref="152" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="134"/>
</item>
</sources>
<targets id="426" type="java.util.HashSet">
<item idref="418" type="com.j2fe.workflow.definition.Transition"/>
<item idref="132" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="127"/>
</item>
</sources>
<targets id="427" type="java.util.HashSet">
<item idref="125" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="87"/>
</item>
</sources>
<targets id="428" type="java.util.HashSet">
<item idref="364" type="com.j2fe.workflow.definition.Transition"/>
<item idref="85" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="60"/>
</item>
</sources>
<targets id="429" type="java.util.HashSet">
<item id="430" type="com.j2fe.workflow.definition.Transition">
<name id="431">false</name>
<source idref="60"/>
<target id="432">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="433"/>
<directJoin>false</directJoin>
<name id="434">Processing File</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="435">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="436" type="java.util.HashSet">
<item id="437" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="438">["AllRequestOIDs"]@[Ljava/lang/String;@</UITypeHint>
<input>true</input>
<name id="439">input["AllRequestOIDs"]</name>
<stringValue id="440">AllRequestOIDs</stringValue>
<type>VARIABLE</type>
</item>
<item id="441" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="442">["BusinessFeed"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="443">input["BusinessFeed"]</name>
<stringValue id="444">BusinessFeed</stringValue>
<type>VARIABLE</type>
</item>
<item id="445" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="446">["Parent Job Id"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="447">input["Parent Job Id"]</name>
<stringValue id="448">Parent Job Id</stringValue>
<type>VARIABLE</type>
</item>
<item id="449" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="450">["ProcessFilteredMessages"]@java/lang/Boolean@</UITypeHint>
<input>true</input>
<name id="451">input["ProcessFilteredMessages"]</name>
<stringValue id="452">ProcessFilteredMessages</stringValue>
<type>VARIABLE</type>
</item>
<item id="453" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="454">["ReplyFile"]@java/net/URI@</UITypeHint>
<input>true</input>
<name id="455">input["ReplyFile"]</name>
<stringValue id="456">ResponseFiles</stringValue>
<type>VARIABLE</type>
<variablePart id="457">[0]</variablePart>
</item>
<item id="458" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="459">["RequestTransaction"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="460">input["RequestTransaction"]</name>
<stringValue id="461">ForwardedTransactionID</stringValue>
<type>VARIABLE</type>
</item>
<item id="462" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="463">["VendorRequest"]@org/w3c/dom/Document@</UITypeHint>
<input>true</input>
<name id="464">input["VendorRequest"]</name>
<stringValue id="465">VendorRequestString</stringValue>
<type>VARIABLE</type>
</item>
<item id="466" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="467">["VendorRequestString"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="468">input["VendorRequestString"]</name>
<stringValue id="469">VendorRequestString</stringValue>
<type>VARIABLE</type>
</item>
<item id="470" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="471">name</name>
<stringValue id="472">BloombergProcessFiles</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="473" type="java.util.HashSet">
<item idref="430" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="474" type="java.util.HashSet">
<item id="475" type="com.j2fe.workflow.definition.Transition">
<name id="476">goto-next</name>
<source idref="432"/>
<target idref="10"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item idref="58" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="21"/>
</item>
</sources>
<targets id="477" type="java.util.HashSet">
<item idref="19" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="10"/>
</item>
<item idref="422" type="com.j2fe.workflow.definition.Transition"/>
<item idref="475" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="478" type="java.util.HashSet">
<item idref="8" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="3"/>
</item>
</sources>
<targets id="479" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="480">Request Reply/Bloomberg</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="481">user1</lastChangeUser>
<lastUpdate id="482">2026-02-03T11:34:05.000+0000</lastUpdate>
<name id="483">BloombergUpDownloadRequestReplySFTP</name>
<nodes id="484" type="java.util.HashSet">
<item idref="369" type="com.j2fe.workflow.definition.Node"/>
<item idref="21" type="com.j2fe.workflow.definition.Node"/>
<item idref="10" type="com.j2fe.workflow.definition.Node"/>
<item idref="178" type="com.j2fe.workflow.definition.Node"/>
<item idref="299" type="com.j2fe.workflow.definition.Node"/>
<item idref="87" type="com.j2fe.workflow.definition.Node"/>
<item idref="3" type="com.j2fe.workflow.definition.Node"/>
<item idref="60" type="com.j2fe.workflow.definition.Node"/>
<item idref="349" type="com.j2fe.workflow.definition.Node"/>
<item idref="127" type="com.j2fe.workflow.definition.Node"/>
<item idref="413" type="com.j2fe.workflow.definition.Node"/>
<item idref="154" type="com.j2fe.workflow.definition.Node"/>
<item idref="432" type="com.j2fe.workflow.definition.Node"/>
<item idref="236" type="com.j2fe.workflow.definition.Node"/>
<item idref="319" type="com.j2fe.workflow.definition.Node"/>
<item idref="280" type="com.j2fe.workflow.definition.Node"/>
<item idref="134" type="com.j2fe.workflow.definition.Node"/>
<item idref="161" type="com.j2fe.workflow.definition.Node"/>
<item idref="253" type="com.j2fe.workflow.definition.Node"/>
<item idref="212" type="com.j2fe.workflow.definition.Node"/>
<item idref="334" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>true</optimize>
<parameter id="485" type="java.util.HashMap">
<entry>
<key id="486" type="java.lang.String">AllRequestOIDs</key>
<value id="487" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="488">[Ljava.lang.String;</className>
<clazz>[Ljava.lang.String;</clazz>
<description id="489">The Request OIDs the Request is coping with.</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="490" type="java.lang.String">BusinessFeed</key>
<value id="491" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="492">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="493">The BusinessFeed to use to process the response file.</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="494" type="java.lang.String">DownloadDirectory</key>
<value id="495" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="496">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="497">The directory where the response file is downloaded from.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="498" type="java.lang.String">FilePattern</key>
<value id="499" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="500">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="501">The File pattern to use to create the upload file name.</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="502" type="java.lang.String">MaxRetryTime</key>
<value id="503" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="504">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="505">Maximum time(in seconds) upto which the filesystemwould be scanned for files.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="506" type="java.lang.String">Parent Job Id</key>
<value id="507" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="508">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="509">Parent Job id is used to correlated all the child jobs.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="510" type="java.lang.String">ProcessFilteredMessages</key>
<value id="511" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="512">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<description id="513">Indicates that messages are processed regardless of the result of the Generic Inbound Filter.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="514" type="java.lang.String">RemoveDuplicateFields</key>
<value id="515" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="516">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<description id="517">The flag for Removing duplicate fields in the request file.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="518" type="java.lang.String">RequestTransaction</key>
<value id="519" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="520">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="521">The Parent Transaction created for all the Requests. Used for Error Reporting.</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="522" type="java.lang.String">UploadDirectory</key>
<value id="523" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="524">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="525">The directory where the request file is uploaded to.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="526" type="java.lang.String">VendorRequestString</key>
<value id="527" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="528">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="529">The VendorRequest Message containing all the Requests the Request is coping with.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="530" type="java.lang.String">XSLTMappingFile</key>
<value id="531" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="532">java.net.URI</className>
<clazz>java.net.URI</clazz>
<description id="533">The XSLT Translation File to use to create out of the VendorRequest the upload file.</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
</parameter>
<permissions id="534" type="java.util.HashSet"/>
<priority>0</priority>
<purgeAtEnd>false</purgeAtEnd>
<retries>0</retries>
<startNode idref="319"/>
<status>RELEASED</status>
<variables id="535" type="java.util.HashMap">
<entry>
<key id="536" type="java.lang.String">AllRequestOIDs</key>
<value id="537" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="538">[Ljava.lang.String;</className>
<clazz>[Ljava.lang.String;</clazz>
<description id="539">The Request OIDs the Request is coping with.</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="540" type="java.lang.String">BusinessFeed</key>
<value id="541" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="542">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="543">The BusinessFeed to use to process the response file.</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="544" type="java.lang.String">DownloadDirectory</key>
<value id="545" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="546">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="547">The directory where the response file is downloaded from.</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="548" type="java.lang.String">FilePattern</key>
<value id="549" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="550">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="551">The File pattern to use to create the upload file name.</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="552" type="java.lang.String">MaxRetryTime</key>
<value id="553" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="554">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="555">Maximum time(in seconds) upto which the filesystemwould be scanned for files.</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="556" type="java.lang.String">Parent Job Id</key>
<value id="557" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="558">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="559">Parent Job id is used to correlated all the child jobs.</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="560" type="java.lang.String">ProcessFilteredMessages</key>
<value id="561" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="562">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<description id="563">Indicates that messages are processed regardless of the result of the Generic Inbound Filter.</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="564" type="java.lang.String">RemoveDuplicateFields</key>
<value id="565" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="566">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<description id="567">The flag for Removing duplicate fields in the request file.</description>
<persistent>false</persistent>
<value id="568" type="java.lang.Boolean">true</value>
</value>
</entry>
<entry>
<key id="569" type="java.lang.String">RequestTransaction</key>
<value id="570" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="571">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="572">The Parent Transaction created for all the Requests. Used for Error Reporting.</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="573" type="java.lang.String">UploadDirectory</key>
<value id="574" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="575">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="576">The directory where the request file is uploaded to.</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="577" type="java.lang.String">VendorRequestString</key>
<value id="578" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="579">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="580">The VendorRequest Message containing all the Requests the Request is coping with.</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="581" type="java.lang.String">XSLTMappingFile</key>
<value id="582" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="583">java.net.URI</className>
<clazz>java.net.URI</clazz>
<description id="584">The XSLT Translation File to use to create out of the VendorRequest the upload file.</description>
<persistent>false</persistent>
</value>
</entry>
</variables>
<version>12</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
