<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.07">
<package-comment/>
<businessobject displayString="21 - V10 With_Local_Filesystem" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>false</alwaysPersist>
<clustered>true</clustered>
<comment id="1">V10 With_Local_Filesystem</comment>
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
<name id="8">empty</name>
<source id="9">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="10"/>
<directJoin>false</directJoin>
<name id="11">List Files</name>
<nodeHandler>com.j2fe.feeds.activities.ListFiles</nodeHandler>
<nodeHandlerClass id="12">com.j2fe.feeds.activities.ListFiles</nodeHandlerClass>
<parameters id="13" type="java.util.HashSet">
<item id="14" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="15">dataSourceFilter</name>
<stringValue id="16">VendorDefinition</stringValue>
<type>VARIABLE</type>
</item>
<item id="17" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="18">directory</name>
<stringValue id="19">Directory</stringValue>
<type>VARIABLE</type>
</item>
<item id="20" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="21">fileSystem</name>
<stringValue id="22">filesystem/local</stringValue>
<type>REFERENCE</type>
</item>
<item id="23" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="24">list</name>
<stringValue id="25">FileList</stringValue>
<type>VARIABLE</type>
</item>
<item id="26" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="27">pattern</name>
<stringValue id="28">FilePattern</stringValue>
<type>VARIABLE</type>
</item>
<item id="29" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="30">recursive</name>
<stringValue id="31">false</stringValue>
<type>CONSTANT</type>
</item>
<item id="32" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="33">sort</name>
<stringValue id="34">SortOrder</stringValue>
<type>VARIABLE</type>
</item>
<item id="35" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="36">sortAscending</name>
<stringValue id="37">SortAscending</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="38" type="java.util.HashSet">
<item id="39" type="com.j2fe.workflow.definition.Transition">
<name id="40">goto-next</name>
<source id="41">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="42"/>
<directJoin>false</directJoin>
<name id="43">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="44">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="45" type="java.util.HashSet"/>
<targets id="46" type="java.util.HashSet">
<item idref="39" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="9"/>
</item>
</sources>
<targets id="47" type="java.util.HashSet">
<item idref="7" type="com.j2fe.workflow.definition.Transition"/>
<item id="48" type="com.j2fe.workflow.definition.Transition">
<name id="49">not-empty</name>
<source idref="9"/>
<target id="50">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="51">Automatically generated</description>
<directJoin>false</directJoin>
<name id="52">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="53">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="54" type="java.util.HashSet">
<item id="55" type="com.j2fe.workflow.definition.Transition">
<name id="56">goto-next</name>
<source id="57">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="58"/>
<directJoin>false</directJoin>
<name id="59">NOP</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="60">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="61" type="java.util.HashSet">
<item id="62" type="com.j2fe.workflow.definition.Transition">
<name id="63">false</name>
<source id="64">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="65"/>
<directJoin>false</directJoin>
<name id="66">ReDownloadfiles ?</name>
<nodeHandler>com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandler>
<nodeHandlerClass id="67">com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandlerClass>
<parameters id="68" type="java.util.HashSet">
<item id="69" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="70">caseItem</name>
<stringValue id="71">ReDownloadfiles</stringValue>
<type>VARIABLE</type>
</item>
<item id="72" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="73">defaultItem</name>
<stringValue id="74">false</stringValue>
<type>CONSTANT</type>
</item>
<item id="75" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="76">nullTransition</name>
<stringValue id="77">false</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="78" type="java.util.HashSet">
<item id="79" type="com.j2fe.workflow.definition.Transition">
<name id="80">false</name>
<source id="81">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="82"/>
<directJoin>false</directJoin>
<name id="83">Is New File?</name>
<nodeHandler>com.j2fe.feeds.activities.CheckRestart</nodeHandler>
<nodeHandlerClass id="84">com.j2fe.feeds.activities.CheckRestart</nodeHandlerClass>
<parameters id="85" type="java.util.HashSet">
<item id="86" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="87">file</name>
<stringValue id="88">File</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="89" type="java.util.HashSet">
<item id="90" type="com.j2fe.workflow.definition.Transition">
<name id="91">loop</name>
<source id="92">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="93"/>
<directJoin>false</directJoin>
<name id="94">For Each File</name>
<nodeHandler>com.j2fe.workflow.handler.impl.ForEach</nodeHandler>
<nodeHandlerClass id="95">com.j2fe.workflow.handler.impl.ForEach</nodeHandlerClass>
<parameters id="96" type="java.util.HashSet">
<item id="97" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="98">counter</name>
<stringValue id="99">Counter</stringValue>
<type>VARIABLE</type>
</item>
<item id="100" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="101">counter</name>
<stringValue id="102">Counter</stringValue>
<type>VARIABLE</type>
</item>
<item id="103" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="104">input</name>
<stringValue id="105">FileList</stringValue>
<type>VARIABLE</type>
</item>
<item id="106" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="107">output</name>
<stringValue id="108">File</stringValue>
<type>VARIABLE</type>
</item>
<item id="109" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="110">@java/io/File@.name</UITypeHint>
<input>false</input>
<name id="111">output.name</name>
<stringValue id="112">Filename</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="113" type="java.util.HashSet">
<item id="114" type="com.j2fe.workflow.definition.Transition">
<name id="115">ToSplit</name>
<source idref="50"/>
<target idref="92"/>
</item>
</sources>
<targets id="116" type="java.util.HashSet">
<item id="117" type="com.j2fe.workflow.definition.Transition">
<name id="118">end-loop</name>
<source idref="92"/>
<target idref="2"/>
</item>
<item idref="90" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="81"/>
</item>
</sources>
<targets id="119" type="java.util.HashSet">
<item idref="79" type="com.j2fe.workflow.definition.Transition"/>
<item id="120" type="com.j2fe.workflow.definition.Transition">
<name id="121">true</name>
<source idref="81"/>
<target id="122">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="123">Automatically generated</description>
<directJoin>false</directJoin>
<name id="124">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="125">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="126" type="java.util.HashSet">
<item idref="120" type="com.j2fe.workflow.definition.Transition"/>
<item id="127" type="com.j2fe.workflow.definition.Transition">
<name id="128">true</name>
<source idref="64"/>
<target idref="122"/>
</item>
</sources>
<targets id="129" type="java.util.HashSet">
<item id="130" type="com.j2fe.workflow.definition.Transition">
<name id="131">ToSplit</name>
<source idref="122"/>
<target id="132">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="133"/>
<directJoin>false</directJoin>
<name id="134">Open file</name>
<nodeHandler>com.j2fe.feeds.activities.ReadFile</nodeHandler>
<nodeHandlerClass id="135">com.j2fe.feeds.activities.ReadFile</nodeHandlerClass>
<parameters id="136" type="java.util.HashSet">
<item id="137" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="138">businessFeed</name>
<stringValue id="139">SMHolidayCalendar</stringValue>
<type>CONSTANT</type>
</item>
<item id="140" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="141">file</name>
<stringValue id="142">File</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="143" type="java.util.HashSet">
<item idref="130" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="144" type="java.util.HashSet">
<item id="145" type="com.j2fe.workflow.definition.Transition">
<name id="146">goto-next</name>
<source idref="132"/>
<target id="147">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="148"/>
<directJoin>false</directJoin>
<name id="149">unzip</name>
<nodeHandler>com.j2fe.general.activities.CommandLine</nodeHandler>
<nodeHandlerClass id="150">com.j2fe.general.activities.CommandLine</nodeHandlerClass>
<parameters id="151" type="java.util.HashSet">
<item id="152" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="153">commandLine</name>
<stringValue id="154">unzip IBJIM_20*.ZIP</stringValue>
<type>CONSTANT</type>
</item>
<item id="155" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="156">directory</name>
<stringValue id="157">downloadDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="158" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="159">["downloaddirectory"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="160">environment["downloaddirectory"]</name>
<stringValue id="161">downloadDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="162" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="163">environment["filename"]</name>
<stringValue id="164">Filename</stringValue>
<type>VARIABLE</type>
</item>
<item id="165" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="166">waitForEnd</name>
<stringValue id="167">true</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="168" type="java.util.HashSet">
<item idref="145" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="169" type="java.util.HashSet">
<item id="170" type="com.j2fe.workflow.definition.Transition">
<name id="171">goto-next</name>
<source idref="147"/>
<target id="172">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="173"/>
<directJoin>false</directJoin>
<name id="174">End File</name>
<nodeHandler>com.j2fe.feeds.activities.EndFile</nodeHandler>
<nodeHandlerClass id="175">com.j2fe.feeds.activities.EndFile</nodeHandlerClass>
<parameters id="176" type="java.util.HashSet">
<item id="177" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="178">file</name>
<stringValue id="179">File</stringValue>
<type>VARIABLE</type>
</item>
<item id="180" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="181">successAction</name>
<stringValue id="182">SucessAction</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="183" type="java.util.HashSet">
<item idref="170" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="184" type="java.util.HashSet">
<item id="185" type="com.j2fe.workflow.definition.Transition">
<name id="186">goto-next</name>
<source idref="172"/>
<target id="187">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="188"/>
<directJoin>false</directJoin>
<name id="189">Load CODES.CSV</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="190">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="191" type="java.util.HashSet">
<item id="192" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="193">["BusinessFeed"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="194">input["BusinessFeed"]</name>
<objectValue id="195" type="java.lang.String">SMHolidayCodes</objectValue>
<type>CONSTANT</type>
</item>
<item id="196" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="197">["Directory"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="198">input["Directory"]</name>
<stringValue id="199">downloadDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="200" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="201">["FilePatterns"]@[Ljava/lang/String;@[0]</UITypeHint>
<input>true</input>
<name id="202">input["FilePatterns"][0]</name>
<objectValue id="203" type="java.lang.String">codes.csv</objectValue>
<type>CONSTANT</type>
</item>
<item id="204" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="205">["MessageBulkSize"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="206">input["MessageBulkSize"]</name>
<objectValue id="207" type="java.lang.Integer">1000</objectValue>
<type>CONSTANT</type>
</item>
<item id="208" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="209">["ReProcessProcessedFiles"]@java/lang/Boolean@</UITypeHint>
<input>true</input>
<name id="210">input["ReProcessProcessedFiles"]</name>
<objectValue id="211" type="java.lang.Boolean">true</objectValue>
<type>CONSTANT</type>
</item>
<item id="212" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="213">["SuccessAction"]@com/j2fe/feeds/SuccessAction@</UITypeHint>
<input>true</input>
<name id="214">input["SuccessAction"]</name>
<objectValue id="215" type="com.j2fe.feeds.SuccessAction">DELETE</objectValue>
<type>CONSTANT</type>
</item>
<item id="216" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="217">name</name>
<stringValue id="218">Process Files in Directory</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="219" type="java.util.HashSet">
<item idref="185" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="220" type="java.util.HashSet">
<item id="221" type="com.j2fe.workflow.definition.Transition">
<name id="222">goto-next</name>
<source idref="187"/>
<target id="223">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="224"/>
<directJoin>false</directJoin>
<name id="225">Load CHANGES.CSV</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="226">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="227" type="java.util.HashSet">
<item id="228" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="229">["BusinessFeed"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="230">input["BusinessFeed"]</name>
<objectValue id="231" type="java.lang.String">SMChanges</objectValue>
<type>CONSTANT</type>
</item>
<item id="232" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="233">["Directory"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="234">input["Directory"]</name>
<stringValue id="235">downloadDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="236" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="237">["FilePatterns"]@[Ljava/lang/String;@[0]</UITypeHint>
<input>true</input>
<name id="238">input["FilePatterns"][0]</name>
<objectValue id="239" type="java.lang.String">Changes.csv</objectValue>
<type>CONSTANT</type>
</item>
<item id="240" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="241">["MessageBulkSize"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="242">input["MessageBulkSize"]</name>
<objectValue id="243" type="java.lang.Integer">1000</objectValue>
<type>CONSTANT</type>
</item>
<item id="244" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="245">["ReProcessProcessedFiles"]@java/lang/Boolean@</UITypeHint>
<input>true</input>
<name id="246">input["ReProcessProcessedFiles"]</name>
<objectValue id="247" type="java.lang.Boolean">true</objectValue>
<type>CONSTANT</type>
</item>
<item id="248" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="249">["SuccessAction"]@com/j2fe/feeds/SuccessAction@</UITypeHint>
<input>true</input>
<name id="250">input["SuccessAction"]</name>
<objectValue idref="215"/>
<type>CONSTANT</type>
</item>
<item id="251" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="252">name</name>
<stringValue id="253">Process Files in Directory</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="254" type="java.util.HashSet">
<item idref="221" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="255" type="java.util.HashSet">
<item id="256" type="com.j2fe.workflow.definition.Transition">
<name id="257">goto-next</name>
<source idref="223"/>
<target id="258">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="259"/>
<directJoin>false</directJoin>
<name id="260">Load IBJIM.CSV</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="261">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="262" type="java.util.HashSet">
<item id="263" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="264">["BusinessFeed"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="265">input["BusinessFeed"]</name>
<objectValue id="266" type="java.lang.String">SMHolidayCalendar</objectValue>
<type>CONSTANT</type>
</item>
<item id="267" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="268">["Directory"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="269">input["Directory"]</name>
<stringValue id="270">downloadDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="271" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="272">["FilePatterns"]@[Ljava/lang/String;@[0]</UITypeHint>
<input>true</input>
<name id="273">input["FilePatterns"][0]</name>
<objectValue id="274" type="java.lang.String">IBJIM.CSV</objectValue>
<type>CONSTANT</type>
</item>
<item id="275" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="276">["FilePatterns"]@[Ljava/lang/String;@[1]</UITypeHint>
<input>true</input>
<name id="277">input["FilePatterns"][1]</name>
<objectValue id="278" type="java.lang.String">ibjim.csv</objectValue>
<type>CONSTANT</type>
</item>
<item id="279" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="280">["MessageBulkSize"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="281">input["MessageBulkSize"]</name>
<objectValue id="282" type="java.lang.Integer">1000</objectValue>
<type>CONSTANT</type>
</item>
<item id="283" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="284">["ReProcessProcessedFiles"]@java/lang/Boolean@</UITypeHint>
<input>true</input>
<name id="285">input["ReProcessProcessedFiles"]</name>
<objectValue id="286" type="java.lang.Boolean">true</objectValue>
<type>CONSTANT</type>
</item>
<item id="287" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="288">["SuccessAction"]@com/j2fe/feeds/SuccessAction@</UITypeHint>
<input>true</input>
<name id="289">input["SuccessAction"]</name>
<objectValue idref="215"/>
<type>CONSTANT</type>
</item>
<item id="290" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="291">name</name>
<stringValue id="292">Process Files in Directory</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="293" type="java.util.HashSet">
<item idref="256" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="294" type="java.util.HashSet">
<item id="295" type="com.j2fe.workflow.definition.Transition">
<name id="296">goto-next</name>
<source idref="258"/>
<target id="297">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="298"/>
<directJoin>false</directJoin>
<name id="299">Move ZIP file</name>
<nodeHandler>com.j2fe.general.activities.CommandLine</nodeHandler>
<nodeHandlerClass id="300">com.j2fe.general.activities.CommandLine</nodeHandlerClass>
<parameters id="301" type="java.util.HashSet">
<item id="302" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="303">commandLine</name>
<stringValue id="304">mv IBJIM_20*.ZIP ./done</stringValue>
<type>CONSTANT</type>
</item>
<item id="305" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="306">directory</name>
<stringValue id="307">downloadDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="308" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="309">waitForEnd</name>
<stringValue id="310">true</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="311" type="java.util.HashSet">
<item idref="295" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="312" type="java.util.HashSet">
<item id="313" type="com.j2fe.workflow.definition.Transition">
<name id="314">goto-next</name>
<source idref="297"/>
<target id="315">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="316"/>
<directJoin>false</directJoin>
<name id="317">Remove residual files</name>
<nodeHandler>com.j2fe.general.activities.CommandLine</nodeHandler>
<nodeHandlerClass id="318">com.j2fe.general.activities.CommandLine</nodeHandlerClass>
<parameters id="319" type="java.util.HashSet">
<item id="320" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="321">commandLine</name>
<stringValue id="322">rm -f *.doc *.csv</stringValue>
<type>CONSTANT</type>
</item>
<item id="323" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="324">directory</name>
<stringValue id="325">downloadDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="326" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="327">waitForEnd</name>
<stringValue id="328">true</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="329" type="java.util.HashSet">
<item idref="313" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="330" type="java.util.HashSet">
<item id="331" type="com.j2fe.workflow.definition.Transition">
<name id="332">goto-next</name>
<source idref="315"/>
<target idref="57"/>
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
<type>ACTIVITY</type>
</target>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="64"/>
</item>
</sources>
<targets id="333" type="java.util.HashSet">
<item idref="62" type="com.j2fe.workflow.definition.Transition"/>
<item idref="127" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="57"/>
</item>
<item idref="331" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="334" type="java.util.HashSet">
<item idref="55" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="50"/>
</item>
<item idref="48" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="335" type="java.util.HashSet">
<item idref="114" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</target>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="2"/>
</item>
<item idref="117" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="336" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="337">Custom/Dataloads</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="338">user1</lastChangeUser>
<lastUpdate id="339">2025-10-15T22:25:52.000+0100</lastUpdate>
<name id="340">SwapsMonitor</name>
<nodes id="341" type="java.util.HashSet">
<item idref="172" type="com.j2fe.workflow.definition.Node"/>
<item idref="92" type="com.j2fe.workflow.definition.Node"/>
<item idref="81" type="com.j2fe.workflow.definition.Node"/>
<item idref="9" type="com.j2fe.workflow.definition.Node"/>
<item idref="223" type="com.j2fe.workflow.definition.Node"/>
<item idref="187" type="com.j2fe.workflow.definition.Node"/>
<item idref="258" type="com.j2fe.workflow.definition.Node"/>
<item idref="50" type="com.j2fe.workflow.definition.Node"/>
<item idref="122" type="com.j2fe.workflow.definition.Node"/>
<item idref="297" type="com.j2fe.workflow.definition.Node"/>
<item idref="57" type="com.j2fe.workflow.definition.Node"/>
<item idref="132" type="com.j2fe.workflow.definition.Node"/>
<item idref="64" type="com.j2fe.workflow.definition.Node"/>
<item idref="315" type="com.j2fe.workflow.definition.Node"/>
<item idref="41" type="com.j2fe.workflow.definition.Node"/>
<item idref="2" type="com.j2fe.workflow.definition.Node"/>
<item idref="147" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>true</optimize>
<parameter id="342" type="java.util.HashMap">
<entry>
<key id="343" type="java.lang.String">BusinessFeed</key>
<value id="344" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="345">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="346" type="java.lang.String">Directory</key>
<value id="347" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="348">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="349"/>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="350" type="java.lang.String">FileDate</key>
<value id="351" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="352">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>false</input>
<output>true</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="353" type="java.lang.String">FilePattern</key>
<value id="354" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="355">[Ljava.lang.String;</className>
<clazz>[Ljava.lang.String;</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="356" type="java.lang.String">ReDownloadfiles</key>
<value id="357" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="358">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<description id="359">Should redownload files or not</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="360" type="java.lang.String">SortAscending</key>
<value id="361" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="362">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="363" type="java.lang.String">SortOrder</key>
<value id="364" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="365">com.j2fe.feeds.activities.ListFiles$Sort</className>
<clazz>com.j2fe.feeds.activities.ListFiles$Sort</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="366" type="java.lang.String">SucessAction</key>
<value id="367" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="368">com.j2fe.feeds.SuccessAction</className>
<clazz>com.j2fe.feeds.SuccessAction</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="369" type="java.lang.String">VendorDefinition</key>
<value id="370" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="371">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="372" type="java.lang.String">downloadDirectory</key>
<value id="373" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="374">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="375">Directory where Swaps files will be downloaded</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
</parameter>
<permissions id="376" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>true</purgeAtEnd>
<retries>0</retries>
<startNode idref="41"/>
<status>RELEASED</status>
<variables id="377" type="java.util.HashMap">
<entry>
<key id="378" type="java.lang.String">BusinessFeed</key>
<value id="379" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="380">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="381" type="java.lang.String">Counter</key>
<value id="382" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="383">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<persistent>false</persistent>
<value id="384" type="java.lang.Integer">0</value>
</value>
</entry>
<entry>
<key id="385" type="java.lang.String">Directory</key>
<value id="386" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="387">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="388"/>
<persistent>false</persistent>
<value id="389" type="java.lang.String">/gold/GSFTP/files/swapsMonitor</value>
</value>
</entry>
<entry>
<key id="390" type="java.lang.String">FileDate</key>
<value id="391" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="392">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="393" type="java.lang.String">FilePattern</key>
<value id="394" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="395">[Ljava.lang.String;</className>
<clazz>[Ljava.lang.String;</clazz>
<persistent>false</persistent>
<value id="396" type="java.lang.String">IBJIM_*.ZIP</value>
</value>
</entry>
<entry>
<key id="397" type="java.lang.String">ReDownloadfiles</key>
<value id="398" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="399">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<description id="400">Should redownload files or not</description>
<persistent>false</persistent>
<value id="401" type="java.lang.Boolean">false</value>
</value>
</entry>
<entry>
<key id="402" type="java.lang.String">SortAscending</key>
<value id="403" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="404">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<persistent>false</persistent>
<value id="405" type="java.lang.Boolean">true</value>
</value>
</entry>
<entry>
<key id="406" type="java.lang.String">SortOrder</key>
<value id="407" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="408">com.j2fe.feeds.activities.ListFiles$Sort</className>
<clazz>com.j2fe.feeds.activities.ListFiles$Sort</clazz>
<persistent>false</persistent>
<value id="409" type="com.j2fe.feeds.activities.ListFiles$Sort">TIME</value>
</value>
</entry>
<entry>
<key id="410" type="java.lang.String">SucessAction</key>
<value id="411" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="412">com.j2fe.feeds.SuccessAction</className>
<clazz>com.j2fe.feeds.SuccessAction</clazz>
<persistent>false</persistent>
<value id="413" type="com.j2fe.feeds.SuccessAction">LEAVE</value>
</value>
</entry>
<entry>
<key id="414" type="java.lang.String">VendorDefinition</key>
<value id="415" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="416">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="417" type="java.lang.String">SMONITOR</value>
</value>
</entry>
<entry>
<key id="418" type="java.lang.String">downloadDirectory</key>
<value id="419" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="420">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="421">Directory where Swaps files will be downloaded</description>
<persistent>false</persistent>
<value id="422" type="java.lang.String">/gold/GSFTP/files/swapsMonitor</value>
</value>
</entry>
</variables>
<version>21</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
