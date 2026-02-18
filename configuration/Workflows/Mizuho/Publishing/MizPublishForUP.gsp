<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.07">
<package-comment/>
<businessobject displayString="9 - RemotePubAddedV10" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>false</alwaysPersist>
<clustered>false</clustered>
<comment id="1">RemotePubAddedV10</comment>
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
<name id="16">goto-next</name>
<source id="17">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="18"/>
<directJoin>false</directJoin>
<name id="19">Issuer delete from UP_CHILDREN</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="20">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="21" type="java.util.HashSet">
<item id="22" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="23">database</name>
<stringValue id="24">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="25" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="26">[0]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="27">indexedParameters[0]</name>
<stringValue id="28">JobNum</stringValue>
<type>VARIABLE</type>
</item>
<item id="29" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="30">querySQL</name>
<stringValue id="31">delete from UP_CHILDREN where entity_type = 'ISSR' and job_num = ?</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="32" type="java.util.HashSet">
<item id="33" type="com.j2fe.workflow.definition.Transition">
<name id="34">goto-next</name>
<source id="35">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="36"/>
<directJoin>true</directJoin>
<name id="37">Synchronize</name>
<nodeHandler>com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandler>
<nodeHandlerClass id="38">com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandlerClass>
<sources id="39" type="java.util.HashSet">
<item id="40" type="com.j2fe.workflow.definition.Transition">
<name id="41">goto-next</name>
<source id="42">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="43"/>
<directJoin>false</directJoin>
<name id="44">Raise Event Remote #1</name>
<nodeHandler>com.j2fe.event.RaiseEventRemote</nodeHandler>
<nodeHandlerClass id="45">com.j2fe.event.RaiseEventRemote</nodeHandlerClass>
<parameters id="46" type="java.util.HashSet">
<item id="47" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="48">eventName</name>
<stringValue id="49">MizBulkExtraction_Event</stringValue>
<type>CONSTANT</type>
</item>
<item id="50" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="51">["AuditId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="52">parameters["AuditId"]</name>
<stringValue id="53">auditIdentifier</stringValue>
<type>VARIABLE</type>
</item>
<item id="54" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="55">["ExtDefs"]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="56">parameters["ExtDefs"]</name>
<stringValue id="57">extDefsPerBranch</stringValue>
<type>VARIABLE</type>
</item>
<item id="58" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="59">["JMSDestination"]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="60">parameters["JMSDestination"]</name>
<stringValue id="61">PartQueue</stringValue>
<type>VARIABLE</type>
</item>
<item id="62" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="63">["PublishingBulkSize"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="64">parameters["PublishingBulkSize"]</name>
<stringValue id="65">PublishingBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="66" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="67">propertyFileLocation</name>
<stringValue id="68">db://resource/PublishingConfiguration/PublishingConfig.properties</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="69" type="java.util.HashSet">
<item id="70" type="com.j2fe.workflow.definition.Transition">
<name id="71">goto-next</name>
<source id="72">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="73"/>
<directJoin>true</directJoin>
<name id="74">Bulk Items</name>
<nodeHandler>com.j2fe.general.activities.BulkItems</nodeHandler>
<nodeHandlerClass id="75">com.j2fe.general.activities.BulkItems</nodeHandlerClass>
<parameters id="76" type="java.util.HashSet">
<item id="77" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="78">bulk</name>
<stringValue id="79">pubBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="80" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="81">input</name>
<stringValue id="82">extractDefinitions</stringValue>
<type>VARIABLE</type>
</item>
<item id="83" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="84">output</name>
<stringValue id="85">extDefsPerBranch</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="86" type="java.util.HashSet">
<item id="87" type="com.j2fe.workflow.definition.Transition">
<name id="88">goto-next</name>
<source id="89">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="90"/>
<directJoin>false</directJoin>
<name id="91">Bean Shell Script (Standard)</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="92">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="93" type="java.util.HashSet">
<item id="94" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="95">statements</name>
<stringValue id="96">if(NoOfThreads &lt;= 0) {&#13;
	NoOfThreads = 1;&#13;
}&#13;
else if(items &lt; NoOfThreads)&#13;
{&#13;
NoOfThreads = items;&#13;
}&#13;
bulkSize = items / NoOfThreads;&#13;
if(items % NoOfThreads != 0)&#13;
{&#13;
bulkSize = bulkSize +1;&#13;
}</stringValue>
<type>CONSTANT</type>
</item>
<item id="97" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="98">["NoOfThreads"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="99">variables["NoOfThreads"]</name>
<stringValue id="100">No. Of Parallel Branches</stringValue>
<type>VARIABLE</type>
</item>
<item id="101" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="102">["bulkSize"]@java/lang/Integer@</UITypeHint>
<input>false</input>
<name id="103">variables["bulkSize"]</name>
<stringValue id="104">pubBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="105" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="106">["items"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="107">variables["items"]</name>
<stringValue id="108">extractDefinitions</stringValue>
<type>VARIABLE</type>
<variablePart id="109">length</variablePart>
</item>
</parameters>
<sources id="110" type="java.util.HashSet">
<item id="111" type="com.j2fe.workflow.definition.Transition">
<name id="112">extraction</name>
<source id="113">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="114"/>
<directJoin>false</directJoin>
<name id="115">Party Extraction Log</name>
<nodeHandler>com.thegoldensource.publishing.activity.WriteExtractionLog</nodeHandler>
<nodeHandlerClass id="116">com.thegoldensource.publishing.activity.WriteExtractionLog</nodeHandlerClass>
<parameters id="117" type="java.util.HashSet">
<item id="118" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="119">auditId</name>
<stringValue id="120">auditIdentifier</stringValue>
<type>VARIABLE</type>
</item>
<item id="121" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="122">entityMode</name>
<stringValue id="123">MODEL_ENTITY</stringValue>
<type>CONSTANT</type>
</item>
<item id="124" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="125">eql</name>
<stringValue id="126">PublishQuery</stringValue>
<type>VARIABLE</type>
</item>
<item id="127" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="128">extractDefinitions</name>
<stringValue id="129">extractDefinitions</stringValue>
<type>VARIABLE</type>
</item>
<item id="130" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="131">extractorFactory</name>
<stringValue id="132">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="133" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="134">maxExtractCount</name>
<stringValue id="135">PublishingBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="136" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="137">modelName</name>
<stringValue id="138">ISSRPUB</stringValue>
<type>CONSTANT</type>
</item>
<item id="139" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="140">queryParameter</name>
<stringValue id="141">queryParameter</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="142" type="java.util.HashSet">
<item id="143" type="com.j2fe.workflow.definition.Transition">
<name id="144">goto-next</name>
<source id="145">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="146"/>
<directJoin>false</directJoin>
<name id="147">Party Publish Query</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="148">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="149" type="java.util.HashSet">
<item id="150" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="151">statements</name>
<stringValue id="152">query = "&lt;sql&gt;instr_issr_id in (select cross_ref_id from UP_CHILDREN where entity_type = 'ISSR' and job_num = '"+JobNum+"')&lt;/sql&gt;"&#13;
</stringValue>
<type>CONSTANT</type>
</item>
<item id="153" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="154">variables["JobNum"]</name>
<stringValue id="155">JobNum</stringValue>
<type>VARIABLE</type>
</item>
<item id="156" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="157">["query"]@java/lang/Integer@</UITypeHint>
<input>false</input>
<name id="158">variables["query"]</name>
<stringValue id="159">PublishQuery</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="160" type="java.util.HashSet">
<item id="161" type="com.j2fe.workflow.definition.Transition">
<name id="162">goto-next</name>
<source id="163">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="164"/>
<directJoin>false</directJoin>
<name id="165">Database Statement (Standard)</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="166">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="167" type="java.util.HashSet">
<item id="168" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="169">database</name>
<stringValue id="170">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="171" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="172">indexedParameters[0]</name>
<stringValue id="173">JobNum</stringValue>
<type>VARIABLE</type>
</item>
<item id="174" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="175">querySQL</name>
<stringValue id="176">update UP_CHILDREN set job_num = ? where job_num is null</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="177" type="java.util.HashSet">
<item id="178" type="com.j2fe.workflow.definition.Transition">
<name id="179">goto-next</name>
<source id="180">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="181"/>
<directJoin>false</directJoin>
<name id="182">Database Select (Standard)</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="183">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="184" type="java.util.HashSet">
<item id="185" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="186">database</name>
<stringValue id="187">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="188" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="189">firstColumnsResult[0]</name>
<stringValue id="190">JobNum</stringValue>
<type>VARIABLE</type>
</item>
<item id="191" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="192">querySQL</name>
<stringValue id="193">SELECT new_oid() FROM DUAL</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="194" type="java.util.HashSet">
<item id="195" type="com.j2fe.workflow.definition.Transition">
<name id="196">ToSplit</name>
<source id="197">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="198">Automatically generated</description>
<directJoin>false</directJoin>
<name id="199">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="200">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="201" type="java.util.HashSet">
<item id="202" type="com.j2fe.workflow.definition.Transition">
<name id="203">end-loop</name>
<source id="204">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="205"/>
<directJoin>false</directJoin>
<name id="206">For Loop</name>
<nodeHandler>com.j2fe.workflow.handler.impl.ForEach</nodeHandler>
<nodeHandlerClass id="207">com.j2fe.workflow.handler.impl.ForEach</nodeHandlerClass>
<parameters id="208" type="java.util.HashSet">
<item id="209" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="210">counter</name>
<stringValue id="211">UPInstMnemCounter</stringValue>
<type>VARIABLE</type>
</item>
<item id="212" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="213">counter</name>
<stringValue id="214">UPInstMnemCounter</stringValue>
<type>VARIABLE</type>
</item>
<item id="215" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="216">incrementValue</name>
<stringValue id="217">1</stringValue>
<type>CONSTANT</type>
</item>
<item id="218" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="219">input</name>
<stringValue id="220">UpInstMnemArr</stringValue>
<type>VARIABLE</type>
</item>
<item id="221" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="222">output</name>
<stringValue id="223">UpInstMnem</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="224" type="java.util.HashSet">
<item id="225" type="com.j2fe.workflow.definition.Transition">
<name id="226">ToSplit</name>
<source id="227">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="228">Automatically generated</description>
<directJoin>false</directJoin>
<name id="229">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="230">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="231" type="java.util.HashSet">
<item id="232" type="com.j2fe.workflow.definition.Transition">
<name id="233">goto-next</name>
<source id="234">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="235">Automatically generated</description>
<directJoin>false</directJoin>
<name id="236">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="237">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="238" type="java.util.HashSet">
<item id="239" type="com.j2fe.workflow.definition.Transition">
<name id="240">ToSplit</name>
<source id="241">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="242">Automatically generated</description>
<directJoin>false</directJoin>
<name id="243">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="244">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="245" type="java.util.HashSet">
<item id="246" type="com.j2fe.workflow.definition.Transition">
<name id="247">goto-next</name>
<source id="248">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="249">Automatically generated</description>
<directJoin>false</directJoin>
<name id="250">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="251">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="252" type="java.util.HashSet">
<item id="253" type="com.j2fe.workflow.definition.Transition">
<name id="254">end-loop</name>
<source id="255">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="256"/>
<directJoin>false</directJoin>
<name id="257">Issrs For Loop</name>
<nodeHandler>com.j2fe.workflow.handler.impl.ForEach</nodeHandler>
<nodeHandlerClass id="258">com.j2fe.workflow.handler.impl.ForEach</nodeHandlerClass>
<parameters id="259" type="java.util.HashSet">
<item id="260" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="261">counter</name>
<stringValue id="262">ChildIssrArrayCounter</stringValue>
<type>VARIABLE</type>
</item>
<item id="263" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="264">counter</name>
<stringValue id="265">ChildIssrArrayCounter</stringValue>
<type>VARIABLE</type>
</item>
<item id="266" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="267">incrementValue</name>
<stringValue id="268">1</stringValue>
<type>CONSTANT</type>
</item>
<item id="269" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="270">input</name>
<stringValue id="271">ChildIssrsArray</stringValue>
<type>VARIABLE</type>
</item>
<item id="272" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="273">output</name>
<stringValue id="274">ChildIssr</stringValue>
<type>VARIABLE</type>
</item>
<item id="275" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="276">resetOnEnd</name>
<stringValue id="277">true</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="278" type="java.util.HashSet">
<item id="279" type="com.j2fe.workflow.definition.Transition">
<name id="280">goto-next</name>
<source id="281">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="282">Automatically generated</description>
<directJoin>false</directJoin>
<name id="283">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="284">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="285" type="java.util.HashSet">
<item id="286" type="com.j2fe.workflow.definition.Transition">
<name id="287">goto-next</name>
<source id="288">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="289"/>
<directJoin>false</directJoin>
<name id="290">Database Statement (Standard) #2</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="291">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="292" type="java.util.HashSet">
<item id="293" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="294">database</name>
<stringValue id="295">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="296" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="297">["1,3"]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="298">mappedParameters["1,3"]</name>
<stringValue id="299">UpInstMnem</stringValue>
<type>VARIABLE</type>
</item>
<item id="300" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="301">mappedParameters["2,4"]</name>
<stringValue id="302">ChildIssr</stringValue>
<type>VARIABLE</type>
</item>
<item id="303" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="304">querySQL</name>
<stringValue id="305">INSERT INTO up_children SELECT new_oid(),NULL,null, sysdate(),?, ?,'ISSR' FROM dual WHERE NOT EXISTS (SELECT * FROM UP_CHILDREN WHERE prnt_inst_mnem = ? AND cross_ref_id = ?)</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="306" type="java.util.HashSet">
<item id="307" type="com.j2fe.workflow.definition.Transition">
<name id="308">loop</name>
<source idref="255"/>
<target idref="288"/>
</item>
</sources>
<targets id="309" type="java.util.HashSet">
<item idref="286" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="281"/>
</item>
<item id="310" type="com.j2fe.workflow.definition.Transition">
<name id="311">rows-found</name>
<source id="312">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="313"/>
<directJoin>false</directJoin>
<name id="314">Select linked ISSRs</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="315">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="316" type="java.util.HashSet">
<item id="317" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="318">database</name>
<stringValue id="319">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="320" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="321">firstColumnsResult</name>
<stringValue id="322">ChildIssrsArray</stringValue>
<type>VARIABLE</type>
</item>
<item id="323" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="324">indexedParameters[0]</name>
<stringValue id="325">UpInstMnem</stringValue>
<type>VARIABLE</type>
</item>
<item id="326" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="327">indexedParameters[1]</name>
<stringValue id="328">UpInstMnem</stringValue>
<type>VARIABLE</type>
</item>
<item id="329" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="330">querySQL</name>
<objectValue id="331" type="java.lang.String">WITH RECURSIVE
r_parntcof (inst_mnem, prnt_inst_mnem, path) AS (
  -- Non-recursive term
  SELECT
      ffrl.inst_mnem::text,
      ffrl.prnt_inst_mnem::text,
      ARRAY[ffrl.inst_mnem::text]::text[]
  FROM ft_t_ffrl ffrl
  WHERE ffrl.prnt_inst_mnem IN (?)
    AND ffrl.rel_typ IN ('PARNTCOF')
    AND ffrl.end_tms IS NULL
  UNION ALL
  -- Recursive term
  SELECT
      c.inst_mnem::text,
      c.prnt_inst_mnem::text,
      p.path || c.inst_mnem::text
  FROM ft_t_ffrl c
  JOIN r_parntcof p
    ON c.prnt_inst_mnem = p.inst_mnem
  WHERE c.rel_typ IN ('PARNTCOF')
    AND c.end_tms IS NULL
    AND NOT (c.inst_mnem::text = ANY(p.path))  -- NOCYCLE
),
r_mhiparnt (inst_mnem, prnt_inst_mnem, path) AS (
  -- Non-recursive term
  SELECT
      ffrl.inst_mnem::text,
      ffrl.prnt_inst_mnem::text,
      ARRAY[ffrl.inst_mnem::text]::text[]
  FROM ft_t_ffrl ffrl
  WHERE ffrl.prnt_inst_mnem IN (?)
    AND ffrl.rel_typ IN ('MHIPARNT')
    AND ffrl.end_tms IS NULL
  UNION ALL
  -- Recursive term
  SELECT
      c.inst_mnem::text,
      c.prnt_inst_mnem::text,
      p.path || c.inst_mnem::text
  FROM ft_t_ffrl c
  JOIN r_mhiparnt p
    ON c.prnt_inst_mnem = p.inst_mnem
  WHERE c.rel_typ IN ('MHIPARNT')
    AND c.end_tms IS NULL
    AND NOT (c.inst_mnem::text = ANY(p.path))  -- NOCYCLE
),
hier_inst AS (
  SELECT inst_mnem FROM r_parntcof
  UNION
  SELECT inst_mnem FROM r_mhiparnt
),
eligible_inst AS (
  SELECT DISTINCT ffrl.inst_mnem
  FROM ft_t_ffrl ffrl
  JOIN hier_inst h
    ON h.inst_mnem = ffrl.inst_mnem::text
  JOIN ft_t_fins fins1
    ON fins1.inst_mnem = ffrl.inst_mnem
   AND fins1.end_tms IS NULL
  LEFT JOIN ft_t_fiid se
    ON se.inst_mnem = ffrl.inst_mnem
   AND se.fins_id_ctxt_typ = 'SECOREFE'
   AND se.end_tms IS NULL
  LEFT JOIN ft_t_issr issr
    ON ffrl.inst_mnem = issr.fins_inst_mnem
  LEFT JOIN ft_t_irgp irgp
    ON issr.instr_issr_id = irgp.instr_issr_id
   AND irgp.prnt_issr_grp_oid = 'IRGR000006'
   AND irgp.end_tms IS NULL
  WHERE ffrl.end_tms IS NULL
)
SELECT DISTINCT i1.instr_issr_id
FROM ft_t_issr AS i1
JOIN ft_t_irgp AS g
  ON i1.instr_issr_id = g.instr_issr_id
WHERE g.prt_purp_typ = 'INTEREST'
  AND i1.end_tms IS NULL
  AND g.end_tms IS NULL
  AND i1.fins_inst_mnem IN (SELECT inst_mnem FROM eligible_inst)
</objectValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="332" type="java.util.HashSet">
<item id="333" type="com.j2fe.workflow.definition.Transition">
<name id="334">loop</name>
<source idref="204"/>
<target idref="312"/>
</item>
</sources>
<targets id="335" type="java.util.HashSet">
<item id="336" type="com.j2fe.workflow.definition.Transition">
<name id="337">nothing-found</name>
<source idref="312"/>
<target idref="241"/>
</item>
<item idref="310" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="281"/>
</item>
</sources>
<targets id="338" type="java.util.HashSet">
<item idref="279" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="255"/>
</item>
</sources>
<targets id="339" type="java.util.HashSet">
<item idref="253" type="com.j2fe.workflow.definition.Transition"/>
<item idref="307" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="248"/>
</item>
</sources>
<targets id="340" type="java.util.HashSet">
<item idref="246" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="241"/>
</item>
<item idref="336" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="341" type="java.util.HashSet">
<item idref="239" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="234"/>
</item>
</sources>
<targets id="342" type="java.util.HashSet">
<item idref="232" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="227"/>
</item>
<item id="343" type="com.j2fe.workflow.definition.Transition">
<name id="344">rows-found</name>
<source id="345">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="346"/>
<directJoin>false</directJoin>
<name id="347">Database Select (Xor Split)</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="348">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="349" type="java.util.HashSet">
<item id="350" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="351">database</name>
<stringValue id="352">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="353" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="354">firstColumnsResult</name>
<stringValue id="355">UpInstMnemArr</stringValue>
<type>VARIABLE</type>
</item>
<item id="356" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="357">[0]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="358">indexedParameters[0]</name>
<stringValue id="359">GoBackNumHours</stringValue>
<type>VARIABLE</type>
</item>
<item id="360" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="361">indexedParameters[1]</name>
<stringValue id="362">GoBackNumHours</stringValue>
<type>VARIABLE</type>
</item>
<item id="363" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="364">querySQL</name>
<stringValue id="365">SELECT DISTINCT finsup 
FROM (
    SELECT xref_tbl_row_oid 
    FROM ft_t_upd1 
    WHERE entity_tbl_typ = 'FINS' 
      AND updated_tmsmp &gt; now() - make_interval(hours =&gt; ?)
) AS upd_fins,
(
    SELECT MHI_FINS_UP(xref_tbl_row_oid) AS finsup 
    FROM (
        SELECT DISTINCT xref_tbl_row_oid 
        FROM ft_t_upd1 
        WHERE entity_tbl_typ = 'FINS' 
          AND updated_tmsmp &gt; now() - make_interval(hours =&gt; ?)
    ) AS fins_input
) AS upd_finsup
WHERE upd_fins.xref_tbl_row_oid = upd_finsup.finsup</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="366" type="java.util.HashSet">
<item id="367" type="com.j2fe.workflow.definition.Transition">
<name id="368">goto-next</name>
<source id="369">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="370"/>
<directJoin>false</directJoin>
<name id="371">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="372">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="373" type="java.util.HashSet"/>
<targets id="374" type="java.util.HashSet">
<item idref="367" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="345"/>
</item>
</sources>
<targets id="375" type="java.util.HashSet">
<item id="376" type="com.j2fe.workflow.definition.Transition">
<name id="377">nothing-found</name>
<source idref="345"/>
<target idref="197"/>
</item>
<item idref="343" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="227"/>
</item>
</sources>
<targets id="378" type="java.util.HashSet">
<item idref="225" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="204"/>
</item>
</sources>
<targets id="379" type="java.util.HashSet">
<item idref="202" type="com.j2fe.workflow.definition.Transition"/>
<item idref="333" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="197"/>
</item>
<item idref="376" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="380" type="java.util.HashSet">
<item idref="195" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="180"/>
</item>
</sources>
<targets id="381" type="java.util.HashSet">
<item idref="178" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="163"/>
</item>
</sources>
<targets id="382" type="java.util.HashSet">
<item idref="161" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="145"/>
</item>
</sources>
<targets id="383" type="java.util.HashSet">
<item idref="143" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="113"/>
</item>
</sources>
<targets id="384" type="java.util.HashSet">
<item idref="111" type="com.j2fe.workflow.definition.Transition"/>
<item id="385" type="com.j2fe.workflow.definition.Transition">
<name id="386">no-extraction</name>
<source idref="113"/>
<target idref="10"/>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="89"/>
</item>
</sources>
<targets id="387" type="java.util.HashSet">
<item idref="87" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="72"/>
</item>
</sources>
<targets id="388" type="java.util.HashSet">
<item idref="70" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDSPLIT</type>
</source>
<target idref="42"/>
</item>
</sources>
<targets id="389" type="java.util.HashSet">
<item idref="40" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="35"/>
</item>
</sources>
<targets id="390" type="java.util.HashSet">
<item idref="33" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDJOIN</type>
</source>
<target idref="17"/>
</item>
</sources>
<targets id="391" type="java.util.HashSet">
<item idref="15" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="10"/>
</item>
<item idref="385" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="392" type="java.util.HashSet">
<item idref="8" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="3"/>
</item>
</sources>
<targets id="393" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="394">Mizuho/Publishing</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="395">user1</lastChangeUser>
<lastUpdate id="396">2025-12-16T14:13:43.000+0000</lastUpdate>
<name id="397">MizPublishForUP</name>
<nodes id="398" type="java.util.HashSet">
<item idref="89" type="com.j2fe.workflow.definition.Node"/>
<item idref="72" type="com.j2fe.workflow.definition.Node"/>
<item idref="180" type="com.j2fe.workflow.definition.Node"/>
<item idref="345" type="com.j2fe.workflow.definition.Node"/>
<item idref="163" type="com.j2fe.workflow.definition.Node"/>
<item idref="288" type="com.j2fe.workflow.definition.Node"/>
<item idref="204" type="com.j2fe.workflow.definition.Node"/>
<item idref="255" type="com.j2fe.workflow.definition.Node"/>
<item idref="17" type="com.j2fe.workflow.definition.Node"/>
<item idref="227" type="com.j2fe.workflow.definition.Node"/>
<item idref="241" type="com.j2fe.workflow.definition.Node"/>
<item idref="234" type="com.j2fe.workflow.definition.Node"/>
<item idref="281" type="com.j2fe.workflow.definition.Node"/>
<item idref="248" type="com.j2fe.workflow.definition.Node"/>
<item idref="197" type="com.j2fe.workflow.definition.Node"/>
<item idref="10" type="com.j2fe.workflow.definition.Node"/>
<item idref="113" type="com.j2fe.workflow.definition.Node"/>
<item idref="145" type="com.j2fe.workflow.definition.Node"/>
<item idref="42" type="com.j2fe.workflow.definition.Node"/>
<item idref="312" type="com.j2fe.workflow.definition.Node"/>
<item idref="369" type="com.j2fe.workflow.definition.Node"/>
<item idref="3" type="com.j2fe.workflow.definition.Node"/>
<item idref="35" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>true</optimize>
<parameter id="399" type="java.util.HashMap">
<entry>
<key id="400" type="java.lang.String">GoBackNumHours</key>
<value id="401" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="402">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="403">How many hours to check back on UPD1 - default is 1, which is one hour  (expressed as 1/24 in the sql query).</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="404" type="java.lang.String">No. Of Parallel Branches</key>
<value id="405" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="406">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="407"/>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="408" type="java.lang.String">PartQueue</key>
<value id="409" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="410">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="411"/>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="412" type="java.lang.String">PublishingBulkSize</key>
<value id="413" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="414">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
</parameter>
<permissions id="415" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>false</purgeAtEnd>
<retries>0</retries>
<startNode idref="369"/>
<status>RELEASED</status>
<variables id="416" type="java.util.HashMap">
<entry>
<key id="417" type="java.lang.String">ChildCustomersArrayCounter</key>
<value id="418" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="419">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<persistent>false</persistent>
<value id="420" type="java.lang.Integer">0</value>
</value>
</entry>
<entry>
<key id="421" type="java.lang.String">ChildIssrArrayCounter</key>
<value id="422" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="423">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<persistent>false</persistent>
<value idref="420"/>
</value>
</entry>
<entry>
<key id="424" type="java.lang.String">GoBackNumHours</key>
<value id="425" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="426">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="427">How many hours to check back on UPD1 - default is 1, which is one hour  (expressed as 1/24 in the sql query).</description>
<persistent>false</persistent>
<value id="428" type="java.lang.Integer">1</value>
</value>
</entry>
<entry>
<key id="429" type="java.lang.String">Indexed Parameters</key>
<value id="430" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="431">java.lang.Object</className>
<clazz>java.lang.Object</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="432" type="java.lang.String">JobNum</key>
<value id="433" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="434">java.lang.Object</className>
<clazz>java.lang.Object</clazz>
<persistent>true</persistent>
</value>
</entry>
<entry>
<key id="435" type="java.lang.String">Mapped Parameters</key>
<value id="436" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="437">java.util.Map</className>
<clazz>java.util.Map</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="438" type="java.lang.String">No. Of Parallel Branches</key>
<value id="439" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="440">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="441"/>
<persistent>false</persistent>
<value id="442" type="java.lang.Integer">5</value>
</value>
</entry>
<entry>
<key id="443" type="java.lang.String">PartQueue</key>
<value id="444" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="445">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="446"/>
<persistent>false</persistent>
<value id="447" type="java.lang.String">jms/queue/issuer</value>
</value>
</entry>
<entry>
<key id="448" type="java.lang.String">PublishingBulkSize</key>
<value id="449" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="450">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<persistent>false</persistent>
<value id="451" type="java.lang.Integer">100</value>
</value>
</entry>
<entry>
<key id="452" type="java.lang.String">UPInstMnemCounter</key>
<value id="453" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="454">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<persistent>false</persistent>
<value idref="420"/>
</value>
</entry>
</variables>
<version>9</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
