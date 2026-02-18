<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.04">
<package-comment/>
<businessobject displayString="6 - 8.8.1.13 - v10" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>false</alwaysPersist>
<clustered>false</clustered>
<comment id="1">8.8.1.13 - v10</comment>
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
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="10"/>
<directJoin>false</directJoin>
<name id="11">Close Transaction</name>
<nodeHandler>com.j2fe.streetlamp.activities.CloseTransaction</nodeHandler>
<nodeHandlerClass id="12">com.j2fe.streetlamp.activities.CloseTransaction</nodeHandlerClass>
<parameters id="13" type="java.util.HashSet">
<item id="14" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="15">transactionId</name>
<stringValue id="16">TransactionID</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="17" type="java.util.HashSet">
<item id="18" type="com.j2fe.workflow.definition.Transition">
<name id="19">CNST-NotExists</name>
<source id="20">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="21"/>
<directJoin>false</directJoin>
<name id="22">Create related entity merge instruction in CNST</name>
<nodeHandler>com.thegoldensource.reference.activity.CreateRelatedEntityMergeInstruction</nodeHandler>
<nodeHandlerClass id="23">com.thegoldensource.reference.activity.CreateRelatedEntityMergeInstruction</nodeHandlerClass>
<parameters id="24" type="java.util.HashSet">
<item id="25" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="26">cnstOid</name>
<stringValue id="27">CnstOid</stringValue>
<type>VARIABLE</type>
</item>
<item id="28" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="29">database</name>
<stringValue id="30">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="31" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="32">listCnstOid</name>
<stringValue id="33">Listofcnstoidofthemergeentityandtherelatedentities</stringValue>
<type>VARIABLE</type>
</item>
<item id="34" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="35">transactionId</name>
<stringValue id="36">TransactionID</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="37" type="java.util.HashSet">
<item id="38" type="com.j2fe.workflow.definition.Transition">
<name id="39">goto-next</name>
<source id="40">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="41"/>
<directJoin>false</directJoin>
<name id="42">Create Transaction</name>
<nodeHandler>com.j2fe.streetlamp.activities.CreateTransaction</nodeHandler>
<nodeHandlerClass id="43">com.j2fe.streetlamp.activities.CreateTransaction</nodeHandlerClass>
<parameters id="44" type="java.util.HashSet">
<item id="45" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="46">jobId</name>
<stringValue id="47">JobId</stringValue>
<type>VARIABLE</type>
</item>
<item id="48" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="49">messageType</name>
<stringValue id="50">MessageType</stringValue>
<type>VARIABLE</type>
</item>
<item id="51" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="52">transactionId</name>
<stringValue id="53">TransactionID</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="54" type="java.util.HashSet">
<item id="55" type="com.j2fe.workflow.definition.Transition">
<name id="56">goto-next</name>
<source id="57">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="58"/>
<directJoin>false</directJoin>
<name id="59">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="60">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="61" type="java.util.HashSet"/>
<targets id="62" type="java.util.HashSet">
<item idref="55" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="40"/>
</item>
</sources>
<targets id="63" type="java.util.HashSet">
<item idref="38" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="20"/>
</item>
</sources>
<targets id="64" type="java.util.HashSet">
<item idref="18" type="com.j2fe.workflow.definition.Transition"/>
<item id="65" type="com.j2fe.workflow.definition.Transition">
<name id="66">CNST-exists</name>
<source idref="20"/>
<target id="67">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="68"/>
<directJoin>false</directJoin>
<name id="69">Initialization Script</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="70">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="71" type="java.util.HashSet">
<item id="72" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="73">statements</name>
<stringValue id="74">Integer messageCount = 0;&#13;
Integer relatedEntityCounter = 0;</stringValue>
<type>CONSTANT</type>
</item>
<item id="75" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="76">["messageCount"]@java/lang/Integer@</UITypeHint>
<input>false</input>
<name id="77">variables["messageCount"]</name>
<stringValue id="78">messageCount</stringValue>
<type>VARIABLE</type>
</item>
<item id="79" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="80">["relatedEntityCounter"]@java/lang/Integer@</UITypeHint>
<input>false</input>
<name id="81">variables["relatedEntityCounter"]</name>
<stringValue id="82">relatedEntityCounter</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<persistentVariables id="83" type="java.util.HashSet">
<item id="84" type="java.lang.String">messagesToProcess
1000</item>
</persistentVariables>
<sources id="85" type="java.util.HashSet">
<item idref="65" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="86" type="java.util.HashSet">
<item id="87" type="com.j2fe.workflow.definition.Transition">
<name id="88">goto-next</name>
<source idref="67"/>
<target id="89">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="90">Automatically generated</description>
<directJoin>false</directJoin>
<name id="91">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="92">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="93" type="java.util.HashSet">
<item idref="87" type="com.j2fe.workflow.definition.Transition"/>
<item id="94" type="com.j2fe.workflow.definition.Transition">
<name id="95">goto-next</name>
<source id="96">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="97"/>
<directJoin>false</directJoin>
<name id="98">Put message in array</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="99">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="100" type="java.util.HashSet">
<item id="101" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="102">statements</name>
<stringValue id="103">System.out.println(" Merge Message: " + Message1 );&#13;
if(messagesToUpdate == null)&#13;
{&#13;
    messagesToUpdate = new String[1];&#13;
}&#13;
else&#13;
{&#13;
 output2 = new String[messagesToUpdate.length + 1];&#13;
 System.arraycopy(messagesToUpdate,0,output2,0,messagesToUpdate.length);&#13;
 messagesToUpdate = output2;&#13;
}&#13;
lst = new LinkedList();&#13;
lst.add(Message1);&#13;
System.arraycopy(lst.toArray(),0,messagesToUpdate,counter,1);&#13;
counter++;</stringValue>
<type>CONSTANT</type>
</item>
<item id="104" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="105">["Message1"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="106">variables["Message1"]</name>
<stringValue id="107">XMLStringMessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="108" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="109">["counter"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="110">variables["counter"]</name>
<stringValue id="111">messageCount</stringValue>
<type>VARIABLE</type>
</item>
<item id="112" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="113">["counter"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="114">variables["counter"]</name>
<stringValue id="115">messageCount</stringValue>
<type>VARIABLE</type>
</item>
<item id="116" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="117">variables["messagesToUpdate"]</name>
<stringValue id="118">messagesToProcess</stringValue>
<type>VARIABLE</type>
</item>
<item id="119" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="120">variables["messagesToUpdate"]</name>
<stringValue id="121">messagesToProcess</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="122" type="java.util.HashSet">
<item id="123" type="com.j2fe.workflow.definition.Transition">
<name id="124">Formed</name>
<source id="125">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="126"/>
<directJoin>false</directJoin>
<name id="127">Convert Message Object to XML String</name>
<nodeHandler>com.thegoldensource.reference.activity.ConvertMessageObjToXMLString</nodeHandler>
<nodeHandlerClass id="128">com.thegoldensource.reference.activity.ConvertMessageObjToXMLString</nodeHandlerClass>
<parameters id="129" type="java.util.HashSet">
<item id="130" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="131">errorText</name>
<stringValue id="132">ErrorText</stringValue>
<type>VARIABLE</type>
</item>
<item id="133" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="134">ignoreUpdate</name>
<stringValue id="135">IgnoreUpdates</stringValue>
<type>VARIABLE</type>
</item>
<item id="136" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="137">messageObjToConvert</name>
<stringValue id="138">Mergemessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="139" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="140">processingType</name>
<stringValue id="141">MERGE</stringValue>
<type>CONSTANT</type>
</item>
<item id="142" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="143">strMessage</name>
<stringValue id="144">XMLStringMessage</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="145" type="java.util.HashSet">
<item id="146" type="com.j2fe.workflow.definition.Transition">
<name id="147">Merge Message Formed</name>
<source id="148">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="149"/>
<directJoin>false</directJoin>
<name id="150">Create Merge message</name>
<nodeHandler>com.thegoldensource.reference.activity.UpdateMessageForMergeActivity</nodeHandler>
<nodeHandlerClass id="151">com.thegoldensource.reference.activity.UpdateMessageForMergeActivity</nodeHandlerClass>
<parameters id="152" type="java.util.HashSet">
<item id="153" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="154">cnstOid</name>
<stringValue id="155">Output</stringValue>
<type>VARIABLE</type>
</item>
<item id="156" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="157">entityTyp</name>
<stringValue id="158">EntityType</stringValue>
<type>VARIABLE</type>
</item>
<item id="159" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="160">errorText</name>
<stringValue id="161">ErrorText</stringValue>
<type>VARIABLE</type>
</item>
<item id="162" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="163">extractedMessage</name>
<stringValue id="164">Messageobject</stringValue>
<type>VARIABLE</type>
</item>
<item id="165" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="166">gcDatabase</name>
<stringValue id="167">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="168" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="169">mapEntityPKVal</name>
<stringValue id="170">MapofSurvivingentityPkandvalue</stringValue>
<type>VARIABLE</type>
</item>
<item id="171" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="172">mergeMessage</name>
<stringValue id="173">Mergemessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="174" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="175">surCrossRefId</name>
<stringValue id="176">SurvivingCrossRefId</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="177" type="java.util.HashSet">
<item id="178" type="com.j2fe.workflow.definition.Transition">
<name id="179">Message-Formed</name>
<source id="180">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="181"/>
<directJoin>false</directJoin>
<name id="182">Extract Message</name>
<nodeHandler>com.thegoldensource.reference.activity.ExtractMergeMessage</nodeHandler>
<nodeHandlerClass id="183">com.thegoldensource.reference.activity.ExtractMergeMessage</nodeHandlerClass>
<parameters id="184" type="java.util.HashSet">
<item id="185" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="186">activeOnly</name>
<stringValue id="187">ActiveRecordsOnly</stringValue>
<type>VARIABLE</type>
</item>
<item id="188" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="189">database</name>
<stringValue id="190">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="191" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="192">entityType</name>
<stringValue id="193">EntityType</stringValue>
<type>VARIABLE</type>
</item>
<item id="194" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="195">errorText</name>
<stringValue id="196">ErrorText</stringValue>
<type>VARIABLE</type>
</item>
<item id="197" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="198">jblgJobId</name>
<stringValue id="199">JobId</stringValue>
<type>VARIABLE</type>
</item>
<item id="200" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="201">mapEntityPk</name>
<stringValue id="202">MapofHibernatingentityPkandvalue</stringValue>
<type>VARIABLE</type>
</item>
<item id="203" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="204">message</name>
<stringValue id="205">Messageobject</stringValue>
<type>VARIABLE</type>
</item>
<item id="206" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="207">processingType</name>
<stringValue id="208">MERGE</stringValue>
<type>CONSTANT</type>
</item>
<item id="209" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="210">transactionId</name>
<stringValue id="211">TransactionID</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="212" type="java.util.HashSet">
<item id="213" type="com.j2fe.workflow.definition.Transition">
<name id="214">Entity-exists</name>
<source id="215">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="216"/>
<directJoin>false</directJoin>
<name id="217">Merge Instruction Details #2</name>
<nodeHandler>com.thegoldensource.reference.activity.MergeInstructionDetails</nodeHandler>
<nodeHandlerClass id="218">com.thegoldensource.reference.activity.MergeInstructionDetails</nodeHandlerClass>
<parameters id="219" type="java.util.HashSet">
<item id="220" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="221">cnstOid</name>
<stringValue id="222">Output</stringValue>
<type>VARIABLE</type>
</item>
<item id="223" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="224">database</name>
<stringValue id="225">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="226" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="227">entityType</name>
<stringValue id="228">EntityType</stringValue>
<type>VARIABLE</type>
</item>
<item id="229" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="230">errorText</name>
<stringValue id="231">ErrorText</stringValue>
<type>VARIABLE</type>
</item>
<item id="232" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="233">mapHibernatingPk</name>
<stringValue id="234">MapofHibernatingentityPkandvalue</stringValue>
<type>VARIABLE</type>
</item>
<item id="235" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="236">mapSurvivingPk</name>
<stringValue id="237">MapofSurvivingentityPkandvalue</stringValue>
<type>VARIABLE</type>
</item>
<item id="238" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="239">surCrossRefId</name>
<stringValue id="240">SurvivingCrossRefId</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="241" type="java.util.HashSet">
<item id="242" type="com.j2fe.workflow.definition.Transition">
<name id="243">loop</name>
<source id="244">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="245"/>
<directJoin>false</directJoin>
<name id="246">For Loop</name>
<nodeHandler>com.j2fe.workflow.handler.impl.ForEach</nodeHandler>
<nodeHandlerClass id="247">com.j2fe.workflow.handler.impl.ForEach</nodeHandlerClass>
<parameters id="248" type="java.util.HashSet">
<item id="249" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="250">counter</name>
<stringValue id="251">relatedEntityCounter</stringValue>
<type>VARIABLE</type>
</item>
<item id="252" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="253">counter</name>
<stringValue id="254">relatedEntityCounter</stringValue>
<type>VARIABLE</type>
</item>
<item id="255" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="256">input</name>
<stringValue id="257">Listofcnstoidofthemergeentityandtherelatedentities</stringValue>
<type>VARIABLE</type>
</item>
<item id="258" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="259">output</name>
<stringValue id="260">Output</stringValue>
<type>VARIABLE</type>
</item>
<item id="261" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="262">resetOnEnd</name>
<objectValue id="263" type="java.lang.Boolean">true</objectValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="264" type="java.util.HashSet">
<item id="265" type="com.j2fe.workflow.definition.Transition">
<name id="266">ToSplit</name>
<source idref="89"/>
<target idref="244"/>
</item>
</sources>
<targets id="267" type="java.util.HashSet">
<item id="268" type="com.j2fe.workflow.definition.Transition">
<name id="269">end-loop</name>
<source idref="244"/>
<target id="270">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="271"/>
<directJoin>false</directJoin>
<name id="272">GC engine</name>
<nodeHandler>com.j2fe.tp.activities.ProcessTransaction</nodeHandler>
<nodeHandlerClass id="273">com.j2fe.tp.activities.ProcessTransaction</nodeHandlerClass>
<parameters id="274" type="java.util.HashSet">
<item id="275" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="276">engineResource</name>
<stringValue id="277">engine/TPS-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="278" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="279">messageType</name>
<stringValue id="280">MessageType</stringValue>
<type>VARIABLE</type>
</item>
<item id="281" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="282">processed</name>
<stringValue id="283">ProcessedMessages</stringValue>
<type>VARIABLE</type>
</item>
<item id="284" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="285">severity</name>
<stringValue id="286">Severity</stringValue>
<type>VARIABLE</type>
</item>
<item id="287" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="288">textInput</name>
<stringValue id="289">messagesToProcess</stringValue>
<type>VARIABLE</type>
</item>
<item id="290" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="291">transactionId</name>
<stringValue id="292">TransactionID</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="293" type="java.util.HashSet">
<item idref="268" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="294" type="java.util.HashSet">
<item id="295" type="com.j2fe.workflow.definition.Transition">
<name id="296">error</name>
<source idref="270"/>
<target id="297">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="298">Automatically generated</description>
<directJoin>false</directJoin>
<name id="299">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="300">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="301" type="java.util.HashSet">
<item id="302" type="com.j2fe.workflow.definition.Transition">
<name id="303">ToSplit</name>
<source id="304">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="305">Automatically generated</description>
<directJoin>false</directJoin>
<name id="306">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="307">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="308" type="java.util.HashSet">
<item id="309" type="com.j2fe.workflow.definition.Transition">
<name id="310">goto-next</name>
<source id="311">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="312"/>
<directJoin>false</directJoin>
<name id="313">Referenced fields Realigner</name>
<nodeHandler>com.thegoldensource.reference.activity.ReferenceRealignerActivity</nodeHandler>
<nodeHandlerClass id="314">com.thegoldensource.reference.activity.ReferenceRealignerActivity</nodeHandlerClass>
<parameters id="315" type="java.util.HashSet">
<item id="316" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="317">entityType</name>
<stringValue id="318">EntityType</stringValue>
<type>VARIABLE</type>
</item>
<item id="319" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="320">gcDatabase</name>
<stringValue id="321">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="322" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="323">hibPK</name>
<stringValue id="324">MapofHibernatingentityPkandvalue</stringValue>
<type>VARIABLE</type>
</item>
<item id="325" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="326">surPK</name>
<stringValue id="327">MapofSurvivingentityPkandvalue</stringValue>
<type>VARIABLE</type>
</item>
<item id="328" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="329">transactionId</name>
<stringValue id="330">TransactionID</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="331" type="java.util.HashSet">
<item id="332" type="com.j2fe.workflow.definition.Transition">
<name id="333">Entity-NotExists</name>
<source id="334">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="335"/>
<directJoin>false</directJoin>
<name id="336">Merge Instruction Details</name>
<nodeHandler>com.thegoldensource.reference.activity.MergeInstructionDetails</nodeHandler>
<nodeHandlerClass id="337">com.thegoldensource.reference.activity.MergeInstructionDetails</nodeHandlerClass>
<parameters id="338" type="java.util.HashSet">
<item id="339" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="340">cnstOid</name>
<stringValue id="341">OutputCnstOid</stringValue>
<type>VARIABLE</type>
</item>
<item id="342" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="343">database</name>
<stringValue id="344">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="345" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="346">entityType</name>
<stringValue id="347">EntityType</stringValue>
<type>VARIABLE</type>
</item>
<item id="348" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="349">errorText</name>
<stringValue id="350">ErrorText</stringValue>
<type>VARIABLE</type>
</item>
<item id="351" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="352">mapHibernatingPk</name>
<stringValue id="353">MapofHibernatingentityPkandvalue</stringValue>
<type>VARIABLE</type>
</item>
<item id="354" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="355">mapSurvivingPk</name>
<stringValue id="356">MapofSurvivingentityPkandvalue</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="357" type="java.util.HashSet">
<item id="358" type="com.j2fe.workflow.definition.Transition">
<name id="359">loop</name>
<source id="360">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="361"/>
<directJoin>false</directJoin>
<name id="362">For Loop #2</name>
<nodeHandler>com.j2fe.workflow.handler.impl.ForEach</nodeHandler>
<nodeHandlerClass id="363">com.j2fe.workflow.handler.impl.ForEach</nodeHandlerClass>
<parameters id="364" type="java.util.HashSet">
<item id="365" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="366">counter</name>
<stringValue id="367">relatedEntityCounter</stringValue>
<type>VARIABLE</type>
</item>
<item id="368" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="369">counter</name>
<stringValue id="370">relatedEntityCounter</stringValue>
<type>VARIABLE</type>
</item>
<item id="371" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="372">input</name>
<stringValue id="373">Listofcnstoidofthemergeentityandtherelatedentities</stringValue>
<type>VARIABLE</type>
</item>
<item id="374" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="375">output</name>
<stringValue id="376">OutputCnstOid</stringValue>
<type>VARIABLE</type>
</item>
<item id="377" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="378">resetOnEnd</name>
<objectValue id="379" type="java.lang.Boolean">true</objectValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="380" type="java.util.HashSet">
<item id="381" type="com.j2fe.workflow.definition.Transition">
<name id="382">ToSplit</name>
<source idref="297"/>
<target idref="360"/>
</item>
</sources>
<targets id="383" type="java.util.HashSet">
<item id="384" type="com.j2fe.workflow.definition.Transition">
<name id="385">end-loop</name>
<source idref="360"/>
<target id="386">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="387">Automatically generated</description>
<directJoin>false</directJoin>
<name id="388">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="389">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="390" type="java.util.HashSet">
<item id="391" type="com.j2fe.workflow.definition.Transition">
<name id="392">Entity-exists</name>
<source idref="334"/>
<target idref="386"/>
</item>
<item idref="384" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="393" type="java.util.HashSet">
<item id="394" type="com.j2fe.workflow.definition.Transition">
<name id="395">ToSplit</name>
<source idref="386"/>
<target id="396">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="397"/>
<directJoin>false</directJoin>
<name id="398">Check "forward to vddb" flag</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="399">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="400" type="java.util.HashSet">
<item id="401" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="402">database</name>
<stringValue id="403">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="404" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="405">[0]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="406">indexedParameters[0]</name>
<stringValue id="407">MessageType</stringValue>
<type>VARIABLE</type>
</item>
<item id="408" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="409">querySQL</name>
<stringValue id="410">select 1 from FT_CFG_MSTP where msg_typ_nme = ? and VDDB_PROPAGATION_IND = 'Y'</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="411" type="java.util.HashSet">
<item idref="394" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="412" type="java.util.HashSet">
<item id="413" type="com.j2fe.workflow.definition.Transition">
<name id="414">nothing-found</name>
<source idref="396"/>
<target id="415">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="416"/>
<directJoin>false</directJoin>
<name id="417">UpdateCNST as sucess</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="418">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="419" type="java.util.HashSet">
<item id="420" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="421">database</name>
<stringValue id="422">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="423" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="424">[0]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="425">indexedParameters[0]</name>
<stringValue id="426">TransactionID</stringValue>
<type>VARIABLE</type>
</item>
<item id="427" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="428">[1]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="429">indexedParameters[1]</name>
<stringValue id="430">CnstOid</stringValue>
<type>VARIABLE</type>
</item>
<item id="431" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="432">[2]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="433">indexedParameters[2]</name>
<stringValue id="434">CnstOid</stringValue>
<type>VARIABLE</type>
</item>
<item id="435" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="436">querySQL</name>
<stringValue id="437">UPDATE FT_T_CNST SET MERGE_STAT_TYP = 'COMPLETE',  LAST_CHG_USR_ID='MERGE', LAST_CHG_TMS=current_timestamp, PROC_NOTES_TXT='Processing complete.' || ' Transaction ID : ' || ?  WHERE CNST_OID=? OR PRNT_CNST_OID = ?</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="438" type="java.util.HashSet">
<item idref="413" type="com.j2fe.workflow.definition.Transition"/>
<item id="439" type="com.j2fe.workflow.definition.Transition">
<name id="440">success</name>
<source id="441">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="442"/>
<directJoin>false</directJoin>
<name id="443">VDDB Engine</name>
<nodeHandler>com.j2fe.tp.activities.ProcessTransaction</nodeHandler>
<nodeHandlerClass id="444">com.j2fe.tp.activities.ProcessTransaction</nodeHandlerClass>
<parameters id="445" type="java.util.HashSet">
<item id="446" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="447">engineResource</name>
<stringValue id="448">engine/TPS-VDDB</stringValue>
<type>REFERENCE</type>
</item>
<item id="449" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="450">messageType</name>
<stringValue id="451">MessageType</stringValue>
<type>VARIABLE</type>
</item>
<item id="452" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="453">processed</name>
<stringValue id="454">ProcessedMessages</stringValue>
<type>VARIABLE</type>
</item>
<item id="455" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="456">severity</name>
<stringValue id="457">Severity</stringValue>
<type>VARIABLE</type>
</item>
<item id="458" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="459">textInput</name>
<stringValue id="460">messagesToProcess</stringValue>
<type>VARIABLE</type>
</item>
<item id="461" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="462">transactionId</name>
<stringValue id="463">TransactionID</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="464" type="java.util.HashSet">
<item id="465" type="com.j2fe.workflow.definition.Transition">
<name id="466">rows-found</name>
<source idref="396"/>
<target idref="441"/>
</item>
</sources>
<targets id="467" type="java.util.HashSet">
<item id="468" type="com.j2fe.workflow.definition.Transition">
<name id="469">error</name>
<source idref="441"/>
<target id="470">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="471"/>
<directJoin>false</directJoin>
<name id="472">UpdateCNST as VDDB failed</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="473">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="474" type="java.util.HashSet">
<item id="475" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="476">database</name>
<stringValue id="477">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="478" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="479">[0]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="480">indexedParameters[0]</name>
<stringValue id="481">TransactionID</stringValue>
<type>VARIABLE</type>
</item>
<item id="482" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="483">[1]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="484">indexedParameters[1]</name>
<stringValue id="485">CnstOid</stringValue>
<type>VARIABLE</type>
</item>
<item id="486" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="487">[2]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="488">indexedParameters[2]</name>
<stringValue id="489">CnstOid</stringValue>
<type>VARIABLE</type>
</item>
<item id="490" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="491">querySQL</name>
<stringValue id="492">UPDATE FT_T_CNST SET MERGE_STAT_TYP = 'COMPLETE',  LAST_CHG_USR_ID='MERGE', LAST_CHG_TMS=current_timestamp, PROC_NOTES_TXT='Processing complete in GC but ALID realignment failed in VDDB.' || ' Transaction ID : ' || ?  WHERE CNST_OID=? OR PRNT_CNST_OID = ?</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="493" type="java.util.HashSet">
<item idref="468" type="com.j2fe.workflow.definition.Transition"/>
<item id="494" type="com.j2fe.workflow.definition.Transition">
<name id="495">fatal</name>
<source idref="441"/>
<target idref="470"/>
</item>
</sources>
<targets id="496" type="java.util.HashSet">
<item id="497" type="com.j2fe.workflow.definition.Transition">
<name id="498">goto-next</name>
<source idref="470"/>
<target id="499">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="500"/>
<directJoin>false</directJoin>
<name id="501">Update PENM</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="502">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="503" type="java.util.HashSet">
<item id="504" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="505">database</name>
<stringValue id="506">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="507" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="508">[0]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="509">indexedParameters[0]</name>
<stringValue id="510">CnstOid</stringValue>
<type>VARIABLE</type>
</item>
<item id="511" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="512">querySQL</name>
<stringValue id="513">UPDATE FT_T_PENM penm SET ENTITY_MATCH_STAT_TYP='COMPLETE',  LAST_CHG_USR_ID='MERGE', LAST_CHG_TMS=current_timestamp WHERE CNST_OID = ? AND exists(&#13;
select 1 from&#13;
(select (case when ENTITY_MATCH_STAT_TYP is null then 'abc' else ENTITY_MATCH_STAT_TYP end) typ from ft_t_penm p where &#13;
p.cnst_oid = penm.cnst_oid)in1 where typ != 'USER REJECT') </stringValue>
<type>CONSTANT</type>
</item>
<item id="514" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="515">rowCount</name>
<stringValue id="516">RowCount</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="517" type="java.util.HashSet">
<item idref="497" type="com.j2fe.workflow.definition.Transition"/>
<item id="518" type="com.j2fe.workflow.definition.Transition">
<name id="519">goto-next</name>
<source idref="415"/>
<target idref="499"/>
</item>
</sources>
<targets id="520" type="java.util.HashSet">
<item id="521" type="com.j2fe.workflow.definition.Transition">
<name id="522">goto-next</name>
<source idref="499"/>
<target idref="9"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item idref="494" type="com.j2fe.workflow.definition.Transition"/>
<item idref="439" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="415"/>
</item>
</sources>
<targets id="523" type="java.util.HashSet">
<item idref="518" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item idref="465" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</target>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item idref="358" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="334"/>
</item>
</sources>
<targets id="524" type="java.util.HashSet">
<item idref="332" type="com.j2fe.workflow.definition.Transition"/>
<item idref="391" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="311"/>
</item>
</sources>
<targets id="525" type="java.util.HashSet">
<item idref="309" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="304"/>
</item>
</sources>
<targets id="526" type="java.util.HashSet">
<item idref="302" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="297"/>
</item>
<item idref="295" type="com.j2fe.workflow.definition.Transition"/>
<item id="527" type="com.j2fe.workflow.definition.Transition">
<name id="528">success</name>
<source idref="270"/>
<target idref="297"/>
</item>
</sources>
<targets id="529" type="java.util.HashSet">
<item idref="381" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item id="530" type="com.j2fe.workflow.definition.Transition">
<name id="531">fatal</name>
<source idref="270"/>
<target id="532">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="533"/>
<directJoin>false</directJoin>
<name id="534">UpdateCNST as FAILED</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="535">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="536" type="java.util.HashSet">
<item id="537" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="538">database</name>
<stringValue id="539">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="540" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="541">[0]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="542">indexedParameters[0]</name>
<stringValue id="543">TransactionID</stringValue>
<type>VARIABLE</type>
</item>
<item id="544" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="545">[1]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="546">indexedParameters[1]</name>
<stringValue id="547">CnstOid</stringValue>
<type>VARIABLE</type>
</item>
<item id="548" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="549">querySQL</name>
<stringValue id="550">UPDATE FT_T_CNST SET MERGE_STAT_TYP='FAILED', LAST_CHG_USR_ID='MERGE', LAST_CHG_TMS=current_timestamp, PROC_NOTES_TXT='Message processing failed.' || 'Transaction ID : ' || ?  WHERE CNST_OID=?</stringValue>
<type>CONSTANT</type>
</item>
<item id="551" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="552">rowCount</name>
<stringValue id="553">RowCount</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="554" type="java.util.HashSet">
<item idref="530" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="555" type="java.util.HashSet">
<item id="556" type="com.j2fe.workflow.definition.Transition">
<name id="557">goto-next</name>
<source idref="532"/>
<target id="558">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="559"/>
<directJoin>false</directJoin>
<name id="560">Delete Related CNST</name>
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
<UITypeHint id="567">[0]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="568">indexedParameters[0]</name>
<stringValue id="569">CnstOid</stringValue>
<type>VARIABLE</type>
</item>
<item id="570" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="571">querySQL</name>
<stringValue id="572">DELETE FROM FT_T_CNST WHERE PRNT_CNST_OID = ?</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="573" type="java.util.HashSet">
<item idref="556" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="574" type="java.util.HashSet">
<item id="575" type="com.j2fe.workflow.definition.Transition">
<name id="576">goto-next</name>
<source idref="558"/>
<target id="577">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="578"/>
<directJoin>false</directJoin>
<name id="579">Update PENM</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="580">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="581" type="java.util.HashSet">
<item id="582" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="583">database</name>
<stringValue id="584">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="585" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="586">[0]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="587">indexedParameters[0]</name>
<stringValue id="588">CnstOid</stringValue>
<type>VARIABLE</type>
</item>
<item id="589" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="590">querySQL</name>
<stringValue id="591">UPDATE FT_T_PENM SET ENTITY_MATCH_STAT_TYP='FAILED',  LAST_CHG_USR_ID='MERGE', LAST_CHG_TMS=current_timestamp WHERE CNST_OID=? AND COALESCE(ENTITY_MATCH_STAT_TYP, 'abc') != 'USER REJECT'</stringValue>
<type>CONSTANT</type>
</item>
<item id="592" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="593">rowCount</name>
<stringValue id="594">RowCount</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="595" type="java.util.HashSet">
<item idref="575" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="596" type="java.util.HashSet">
<item id="597" type="com.j2fe.workflow.definition.Transition">
<name id="598">goto-next</name>
<source idref="577"/>
<target id="599">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="600"/>
<directJoin>false</directJoin>
<name id="601">Bean Shell Script #2</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="602">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="603" type="java.util.HashSet">
<item id="604" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="605">statements</name>
<stringValue id="606">workflowStatus = false;</stringValue>
<type>CONSTANT</type>
</item>
<item id="607" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="608">["workflowStatus"]@java/lang/Boolean@</UITypeHint>
<input>true</input>
<name id="609">variables["workflowStatus"]</name>
<stringValue id="610">Status</stringValue>
<type>VARIABLE</type>
</item>
<item id="611" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="612">["workflowStatus"]@java/lang/Boolean@</UITypeHint>
<input>false</input>
<name id="613">variables["workflowStatus"]</name>
<stringValue id="614">Status</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="615" type="java.util.HashSet">
<item idref="597" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="616" type="java.util.HashSet">
<item id="617" type="com.j2fe.workflow.definition.Transition">
<name id="618">goto-next</name>
<source idref="599"/>
<target idref="9"/>
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
<item idref="527" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</target>
</item>
<item idref="242" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="215"/>
</item>
</sources>
<targets id="619" type="java.util.HashSet">
<item id="620" type="com.j2fe.workflow.definition.Transition">
<name id="621">Entity-NotExists</name>
<source idref="215"/>
<target id="622">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="623"/>
<directJoin>false</directJoin>
<name id="624">UpdateCNST as FAILED</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="625">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="626" type="java.util.HashSet">
<item id="627" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="628">database</name>
<stringValue id="629">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="630" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="631">[1]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="632">indexedParameters[1]</name>
<stringValue id="633">CnstOid</stringValue>
<type>VARIABLE</type>
</item>
<item id="634" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="635">querySQL</name>
<stringValue id="636">UPDATE FT_T_CNST SET MERGE_STAT_TYP='FAILED', LAST_CHG_USR_ID='MERGE', LAST_CHG_TMS=current_timestamp, PROC_NOTES_TXT=?  WHERE CNST_OID=?</stringValue>
<type>CONSTANT</type>
</item>
<item id="637" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="638">rowCount</name>
<stringValue id="639">RowCount</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="640" type="java.util.HashSet">
<item idref="620" type="com.j2fe.workflow.definition.Transition"/>
<item id="641" type="com.j2fe.workflow.definition.Transition">
<name id="642">Merge Message Not Formed</name>
<source idref="148"/>
<target idref="622"/>
</item>
<item id="643" type="com.j2fe.workflow.definition.Transition">
<name id="644">Message-NotFormed</name>
<source idref="180"/>
<target idref="622"/>
</item>
<item id="645" type="com.j2fe.workflow.definition.Transition">
<name id="646">Not Formed</name>
<source idref="125"/>
<target idref="622"/>
</item>
</sources>
<targets id="647" type="java.util.HashSet">
<item id="648" type="com.j2fe.workflow.definition.Transition">
<name id="649">goto-next</name>
<source idref="622"/>
<target id="650">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="651"/>
<directJoin>false</directJoin>
<name id="652">Delete Related CNST</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="653">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="654" type="java.util.HashSet">
<item id="655" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="656">database</name>
<stringValue id="657">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="658" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="659">[0]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="660">indexedParameters[0]</name>
<stringValue id="661">CnstOid</stringValue>
<type>VARIABLE</type>
</item>
<item id="662" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="663">querySQL</name>
<stringValue id="664">DELETE FROM FT_T_CNST WHERE PRNT_CNST_OID = ?</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="665" type="java.util.HashSet">
<item idref="648" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="666" type="java.util.HashSet">
<item id="667" type="com.j2fe.workflow.definition.Transition">
<name id="668">goto-next</name>
<source idref="650"/>
<target id="669">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="670"/>
<directJoin>false</directJoin>
<name id="671">Update PENM</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="672">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="673" type="java.util.HashSet">
<item id="674" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="675">database</name>
<stringValue id="676">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="677" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="678">[0]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="679">indexedParameters[0]</name>
<stringValue id="680">CnstOid</stringValue>
<type>VARIABLE</type>
</item>
<item id="681" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="682">querySQL</name>
<stringValue id="683">UPDATE FT_T_PENM penm SET ENTITY_MATCH_STAT_TYP='FAILED',  LAST_CHG_USR_ID='MERGE',&#13;
LAST_CHG_TMS=current_timestamp &#13;
WHERE CNST_OID = ? and exists(&#13;
select 1 from&#13;
(select (case when ENTITY_MATCH_STAT_TYP is null then 'abc' else ENTITY_MATCH_STAT_TYP end) typ from ft_t_penm p where &#13;
p.cnst_oid = penm.cnst_oid)in1 where typ != 'USER REJECT') &#13;
</stringValue>
<type>CONSTANT</type>
</item>
<item id="684" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="685">rowCount</name>
<stringValue id="686">RowCount</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="687" type="java.util.HashSet">
<item idref="667" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="688" type="java.util.HashSet">
<item id="689" type="com.j2fe.workflow.definition.Transition">
<name id="690">goto-next</name>
<source idref="669"/>
<target id="691">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="692"/>
<directJoin>false</directJoin>
<name id="693">Bean Shell Script</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="694">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="695" type="java.util.HashSet">
<item id="696" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="697">statements</name>
<stringValue id="698">workflowStatus = false;</stringValue>
<type>CONSTANT</type>
</item>
<item id="699" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="700">["workflowStatus"]@java/lang/Boolean@</UITypeHint>
<input>true</input>
<name id="701">variables["workflowStatus"]</name>
<stringValue id="702">Status</stringValue>
<type>VARIABLE</type>
</item>
<item id="703" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="704">["workflowStatus"]@java/lang/Boolean@</UITypeHint>
<input>false</input>
<name id="705">variables["workflowStatus"]</name>
<stringValue id="706">Status</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="707" type="java.util.HashSet">
<item idref="689" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="708" type="java.util.HashSet">
<item id="709" type="com.j2fe.workflow.definition.Transition">
<name id="710">goto-next</name>
<source idref="691"/>
<target idref="9"/>
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
<item idref="213" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="180"/>
</item>
</sources>
<targets id="711" type="java.util.HashSet">
<item idref="178" type="com.j2fe.workflow.definition.Transition"/>
<item idref="643" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="148"/>
</item>
</sources>
<targets id="712" type="java.util.HashSet">
<item idref="146" type="com.j2fe.workflow.definition.Transition"/>
<item idref="641" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="125"/>
</item>
</sources>
<targets id="713" type="java.util.HashSet">
<item idref="123" type="com.j2fe.workflow.definition.Transition"/>
<item idref="645" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="96"/>
</item>
</sources>
<targets id="714" type="java.util.HashSet">
<item idref="94" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="89"/>
</item>
</sources>
<targets id="715" type="java.util.HashSet">
<item idref="265" type="com.j2fe.workflow.definition.Transition"/>
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
<target idref="9"/>
</item>
<item idref="709" type="com.j2fe.workflow.definition.Transition"/>
<item idref="617" type="com.j2fe.workflow.definition.Transition"/>
<item idref="521" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="716" type="java.util.HashSet">
<item idref="7" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="2"/>
</item>
</sources>
<targets id="717" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="718">Reference/EntityMerge</group>
<haltOnError>true</haltOnError>
<lastChangeUser id="719">user1</lastChangeUser>
<lastUpdate id="720">2025-09-13T08:10:58.000+0100</lastUpdate>
<name id="721">EntityMerge</name>
<nodes id="722" type="java.util.HashSet">
<item idref="691" type="com.j2fe.workflow.definition.Node"/>
<item idref="599" type="com.j2fe.workflow.definition.Node"/>
<item idref="396" type="com.j2fe.workflow.definition.Node"/>
<item idref="9" type="com.j2fe.workflow.definition.Node"/>
<item idref="125" type="com.j2fe.workflow.definition.Node"/>
<item idref="148" type="com.j2fe.workflow.definition.Node"/>
<item idref="40" type="com.j2fe.workflow.definition.Node"/>
<item idref="20" type="com.j2fe.workflow.definition.Node"/>
<item idref="558" type="com.j2fe.workflow.definition.Node"/>
<item idref="650" type="com.j2fe.workflow.definition.Node"/>
<item idref="180" type="com.j2fe.workflow.definition.Node"/>
<item idref="244" type="com.j2fe.workflow.definition.Node"/>
<item idref="360" type="com.j2fe.workflow.definition.Node"/>
<item idref="270" type="com.j2fe.workflow.definition.Node"/>
<item idref="67" type="com.j2fe.workflow.definition.Node"/>
<item idref="89" type="com.j2fe.workflow.definition.Node"/>
<item idref="304" type="com.j2fe.workflow.definition.Node"/>
<item idref="386" type="com.j2fe.workflow.definition.Node"/>
<item idref="297" type="com.j2fe.workflow.definition.Node"/>
<item idref="334" type="com.j2fe.workflow.definition.Node"/>
<item idref="215" type="com.j2fe.workflow.definition.Node"/>
<item idref="96" type="com.j2fe.workflow.definition.Node"/>
<item idref="311" type="com.j2fe.workflow.definition.Node"/>
<item idref="57" type="com.j2fe.workflow.definition.Node"/>
<item idref="2" type="com.j2fe.workflow.definition.Node"/>
<item idref="499" type="com.j2fe.workflow.definition.Node"/>
<item idref="577" type="com.j2fe.workflow.definition.Node"/>
<item idref="669" type="com.j2fe.workflow.definition.Node"/>
<item idref="532" type="com.j2fe.workflow.definition.Node"/>
<item idref="622" type="com.j2fe.workflow.definition.Node"/>
<item idref="470" type="com.j2fe.workflow.definition.Node"/>
<item idref="415" type="com.j2fe.workflow.definition.Node"/>
<item idref="441" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>true</optimize>
<parameter id="723" type="java.util.HashMap">
<entry>
<key id="724" type="java.lang.String">ActiveRecordsOnly</key>
<value id="725" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="726">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="727">Indicates that data extractor should pick only active records</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="728" type="java.lang.String">CnstOid</key>
<value id="729" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="730">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="731" type="java.lang.String">IgnoreUpdates</key>
<value id="732" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="733">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<description id="734">Avoid overwriting of golden copy data by reference entity data only when VSH is enabled.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="735" type="java.lang.String">JobId</key>
<value id="736" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="737">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="738" type="java.lang.String">MessageType</key>
<value id="739" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="740">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="741" type="java.lang.String">Status</key>
<value id="742" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="743">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<description id="744">Gives the status of the workflow, false if the merge failed else true</description>
<input>false</input>
<output>true</output>
<required>false</required>
</value>
</entry>
</parameter>
<permissions id="745" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>true</purgeAtEnd>
<retries>0</retries>
<startNode idref="57"/>
<status>RELEASED</status>
<variables id="746" type="java.util.HashMap">
<entry>
<key id="747" type="java.lang.String">ActiveRecordsOnly</key>
<value id="748" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="749">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="750">Indicates that data extractor should pick only active records</description>
<persistent>false</persistent>
<value id="751" type="java.lang.String">False</value>
</value>
</entry>
<entry>
<key id="752" type="java.lang.String">CnstOid</key>
<value id="753" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="754">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="755" type="java.lang.String">IgnoreUpdates</key>
<value id="756" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="757">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<description id="758">Avoid overwriting of golden copy data by reference entity data only when VSH is enabled.</description>
<persistent>false</persistent>
<value id="759" type="java.lang.Boolean">false</value>
</value>
</entry>
<entry>
<key id="760" type="java.lang.String">JobId</key>
<value id="761" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="762">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="763" type="java.lang.String">MessageType</key>
<value id="764" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="765">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="766" type="java.lang.String">MERGEENTITY</value>
</value>
</entry>
<entry>
<key id="767" type="java.lang.String">Status</key>
<value id="768" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="769">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<description id="770">Gives the status of the workflow, false if the merge failed else true</description>
<persistent>false</persistent>
<value id="771" type="java.lang.Boolean">true</value>
</value>
</entry>
<entry>
<key id="772" type="java.lang.String">messagesToProcess</key>
<value id="773" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="774">[Ljava.lang.String;</className>
<clazz>[Ljava.lang.String;</clazz>
<persistent>false</persistent>
</value>
</entry>
</variables>
<version>6</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
