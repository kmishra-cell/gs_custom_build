<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.07">
<package-comment/>
<businessobject displayString="10 - 8.4.1.1 - EG-5937" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>false</alwaysPersist>
<clustered>false</clustered>
<comment id="1">8.4.1.1 - EG-5937</comment>
<endNode id="2">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="3">END</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="4">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="5" type="java.util.HashSet">
<item id="6" type="com.j2fe.workflow.definition.Transition">
<name id="7">goto-next</name>
<source id="8">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="9">Trigger Message Publishing Events</name>
<nodeHandler>com.j2fe.tp.activities.TriggerPublishing</nodeHandler>
<nodeHandlerClass id="10">com.j2fe.tp.activities.TriggerPublishing</nodeHandlerClass>
<parameters id="11" type="java.util.HashSet">
<item id="12" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="13">inputMessage</name>
<stringValue id="14">messageArray</stringValue>
<type>VARIABLE</type>
<variablePart id="15">[0]</variablePart>
</item>
<item id="16" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="17">internalPublishingEvent</name>
<stringValue id="18">InternalPublishingEvent</stringValue>
<type>VARIABLE</type>
</item>
<item id="19" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="20">messageType</name>
<stringValue id="21">MessageType</stringValue>
<type>VARIABLE</type>
</item>
<item id="22" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="23">processedMessages</name>
<stringValue id="24">Processed</stringValue>
<type>VARIABLE</type>
</item>
<item id="25" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="26">severity</name>
<stringValue id="27">Severity</stringValue>
<type>VARIABLE</type>
</item>
<item id="28" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="29">transactionId</name>
<stringValue id="30">TransactionId</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="31" type="java.util.HashSet">
<item id="32" type="com.j2fe.workflow.definition.Transition">
<name id="33">goto-next</name>
<source id="34">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="35">Close Transaction</name>
<nodeHandler>com.j2fe.streetlamp.activities.CloseTransaction</nodeHandler>
<nodeHandlerClass id="36">com.j2fe.streetlamp.activities.CloseTransaction</nodeHandlerClass>
<parameters id="37" type="java.util.HashSet">
<item id="38" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="39">maxSeverity</name>
<stringValue id="40">Severity</stringValue>
<type>VARIABLE</type>
</item>
<item id="41" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="42">messageType</name>
<stringValue id="43">MessageType</stringValue>
<type>VARIABLE</type>
</item>
<item id="44" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="45">transactionId</name>
<stringValue id="46">TransactionId</stringValue>
<type>VARIABLE</type>
</item>
<item id="47" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="48">transactionMetaData</name>
<stringValue id="49">firstMessageMetaData</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="50" type="java.util.HashSet">
<item id="51" type="com.j2fe.workflow.definition.Transition">
<name id="52">goto-next</name>
<source id="53">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="54">Process  Transaction</name>
<nodeHandler>com.j2fe.tp.activities.ProcessTransaction</nodeHandler>
<nodeHandlerClass id="55">com.j2fe.tp.activities.ProcessTransaction</nodeHandlerClass>
<parameters id="56" type="java.util.HashSet">
<item id="57" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="58">engineResource</name>
<stringValue id="59">engine/TPS-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="60" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="61">messageMetaData</name>
<stringValue id="62">MessageMetaData</stringValue>
<type>VARIABLE</type>
</item>
<item id="63" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="64">messageType</name>
<stringValue id="65">MessageType</stringValue>
<type>VARIABLE</type>
</item>
<item id="66" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="67">processed</name>
<stringValue id="68">Processed</stringValue>
<type>VARIABLE</type>
</item>
<item id="69" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="70">textInput</name>
<stringValue id="71">TranslatedMessages</stringValue>
<type>VARIABLE</type>
</item>
<item id="72" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="73">transactionId</name>
<stringValue id="74">TransactionId</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="75" type="java.util.HashSet">
<item id="76" type="com.j2fe.workflow.definition.Transition">
<name id="77">false</name>
<source id="78">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="79">Switch Case</name>
<nodeHandler>com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandler>
<nodeHandlerClass id="80">com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandlerClass>
<parameters id="81" type="java.util.HashSet">
<item id="82" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="83">caseItem</name>
<stringValue id="84">IsWorkstationMessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="85" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="86">nullTransition</name>
<stringValue id="87">false</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="88" type="java.util.HashSet">
<item id="89" type="com.j2fe.workflow.definition.Transition">
<name id="90">end-loop</name>
<source id="91">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="92">For Loop</name>
<nodeHandler>com.j2fe.workflow.handler.impl.ForEach</nodeHandler>
<nodeHandlerClass id="93">com.j2fe.workflow.handler.impl.ForEach</nodeHandlerClass>
<parameters id="94" type="java.util.HashSet">
<item id="95" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="96">counter</name>
<stringValue id="97">counter</stringValue>
<type>VARIABLE</type>
</item>
<item id="98" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="99">counter</name>
<stringValue id="100">counter</stringValue>
<type>VARIABLE</type>
</item>
<item id="101" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="102">input</name>
<stringValue id="103">messageArray</stringValue>
<type>VARIABLE</type>
</item>
<item id="104" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="105">output</name>
<stringValue id="106">Output</stringValue>
<type>VARIABLE</type>
</item>
<item id="107" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="108">outputObjects</name>
<stringValue id="109">IncrementedObjects</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="110" type="java.util.HashSet">
<item id="111" type="com.j2fe.workflow.definition.Transition">
<name id="112">ToSplit</name>
<source id="113">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="114">Automatically generated</description>
<directJoin>false</directJoin>
<name id="115">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="116">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="117" type="java.util.HashSet">
<item id="118" type="com.j2fe.workflow.definition.Transition">
<name id="119">goto-next</name>
<source id="120">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="121">Bean Shell Script (Standard)</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="122">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="123" type="java.util.HashSet">
<item id="124" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="125">statements</name>
<stringValue id="126">tempMessages=new ArrayList() ;

/*
Note: 'resultMessages' represents the global workflow parameter that should contain the final array of messages which needs to be passed to the engine after the loop
*/

if(resultMessages != null)
{
	for(int k=0; k &lt; resultMessages.length; k++)
	{
		tempMessages.add(resultMessages[k]);
	}
}

/*
Note: 'translatedMessage' is the array of the messages returned by the translator activity above
*/

for(int i=0; i &lt; translatedMessage.length; i++)
{
	 tempMessages.add(translatedMessage[i]);
     
}
//taking the firstmessage metadata
 if(loopcounter==1)
{
      	firstMsgMetadata=msgMetadata;
}

int mylength = tempMessages.toArray().length;

String[] tempMessagesArray = new String[mylength];

for(int j=0; j &lt; mylength; j++)
{	

   tempMessagesArray[j] = tempMessages.toArray()[j];

}</stringValue>
<type>CONSTANT</type>
</item>
<item id="127" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="128">variables["firstMsgMetadata"]</name>
<stringValue id="129">firstMessageMetaData</stringValue>
<type>VARIABLE</type>
</item>
<item id="130" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="131">variables["firstMsgMetadata"]</name>
<stringValue id="132">firstMessageMetaData</stringValue>
<type>VARIABLE</type>
</item>
<item id="133" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="134">variables["loopcounter"]</name>
<stringValue id="135">counter</stringValue>
<type>VARIABLE</type>
</item>
<item id="136" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="137">variables["msgMetadata"]</name>
<stringValue id="138">Outputmsg</stringValue>
<type>VARIABLE</type>
<variablePart id="139">metaData</variablePart>
</item>
<item id="140" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="141">variables["resultMessages"]</name>
<stringValue id="142">TranslatedMessages</stringValue>
<type>VARIABLE</type>
</item>
<item id="143" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="144">["tempMessagesArray"]@java/lang/Object@</UITypeHint>
<input>false</input>
<name id="145">variables["tempMessagesArray"]</name>
<stringValue id="146">TranslatedMessages</stringValue>
<type>VARIABLE</type>
</item>
<item id="147" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="148">variables["translatedMessage"]</name>
<stringValue id="149">PlainOutput</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="150" type="java.util.HashSet">
<item id="151" type="com.j2fe.workflow.definition.Transition">
<name id="152">goto-next</name>
<source id="153">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="154">Translation (Standard)</name>
<nodeHandler>com.j2fe.translation.activities.Translation</nodeHandler>
<nodeHandlerClass id="155">com.j2fe.translation.activities.Translation</nodeHandlerClass>
<parameters id="156" type="java.util.HashSet">
<item id="157" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="158">MSFDBSelect</name>
<stringValue id="159">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="160" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="161">input</name>
<stringValue id="162">Output</stringValue>
<type>VARIABLE</type>
</item>
<item id="163" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="164">messageType</name>
<stringValue id="165">MessageType</stringValue>
<type>VARIABLE</type>
</item>
<item id="166" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="167">metaData</name>
<stringValue id="168">MessageMetaData</stringValue>
<type>VARIABLE</type>
</item>
<item id="169" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="170">output</name>
<stringValue id="171">Outputmsg</stringValue>
<type>VARIABLE</type>
</item>
<item id="172" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="173">plainOutput</name>
<stringValue id="174">PlainOutput</stringValue>
<type>VARIABLE</type>
</item>
<item id="175" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="176">transactionId</name>
<stringValue id="177">TransactionId</stringValue>
<type>VARIABLE</type>
</item>
<item id="178" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="179">translatedTimestamp</name>
<stringValue id="180">TranslationTimestamp</stringValue>
<type>VARIABLE</type>
</item>
<item id="181" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="182">wantedOutputType</name>
<objectValue id="183" type="java.lang.String">Text</objectValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="184" type="java.util.HashSet">
<item id="185" type="com.j2fe.workflow.definition.Transition">
<name id="186">loop</name>
<source idref="91"/>
<target idref="153"/>
</item>
</sources>
<targets id="187" type="java.util.HashSet">
<item idref="151" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="120"/>
</item>
</sources>
<targets id="188" type="java.util.HashSet">
<item idref="118" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="113"/>
</item>
<item id="189" type="com.j2fe.workflow.definition.Transition">
<name id="190">true</name>
<source id="191">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="192">isArray of messages</name>
<nodeHandler>com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandler>
<nodeHandlerClass id="193">com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandlerClass>
<parameters id="194" type="java.util.HashSet">
<item id="195" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="196">caseItem</name>
<stringValue id="197">messageArray</stringValue>
<type>VARIABLE</type>
</item>
<item id="198" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="199">defaultItem</name>
<stringValue id="200">true</stringValue>
<type>CONSTANT</type>
</item>
<item id="201" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="202">nullTransition</name>
<stringValue id="203">false</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="204" type="java.util.HashSet">
<item id="205" type="com.j2fe.workflow.definition.Transition">
<name id="206">go-to-translation</name>
<source id="207">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="208">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="209">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="210" type="java.util.HashSet"/>
<targets id="211" type="java.util.HashSet">
<item idref="205" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="191"/>
</item>
</sources>
<targets id="212" type="java.util.HashSet">
<item id="213" type="com.j2fe.workflow.definition.Transition">
<name id="214">false</name>
<source idref="191"/>
<target id="215">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="216">Translate Message</name>
<nodeHandler>com.j2fe.translation.activities.Translation</nodeHandler>
<nodeHandlerClass id="217">com.j2fe.translation.activities.Translation</nodeHandlerClass>
<parameters id="218" type="java.util.HashSet">
<item id="219" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="220">MSFDBSelect</name>
<stringValue id="221">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="222" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="223">input</name>
<stringValue id="224">Message</stringValue>
<type>VARIABLE</type>
</item>
<item id="225" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="226">messageType</name>
<stringValue id="227">MessageType</stringValue>
<type>VARIABLE</type>
</item>
<item id="228" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="229">metaData</name>
<stringValue id="230">MessageMetaData</stringValue>
<type>VARIABLE</type>
</item>
<item id="231" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="232">output</name>
<stringValue id="233">PublishingTranslatedOutput</stringValue>
<type>VARIABLE</type>
</item>
<item id="234" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="235">plainOutput</name>
<stringValue id="236">Translated</stringValue>
<type>VARIABLE</type>
</item>
<item id="237" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="238">transactionId</name>
<stringValue id="239">TransactionId</stringValue>
<type>VARIABLE</type>
</item>
<item id="240" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="241">translatedTimestamp</name>
<stringValue id="242">TranslatedTimestamp</stringValue>
<type>VARIABLE</type>
</item>
<item id="243" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="244">wantedOutputType</name>
<stringValue id="245">Binary</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="246" type="java.util.HashSet">
<item idref="213" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="247" type="java.util.HashSet">
<item id="248" type="com.j2fe.workflow.definition.Transition">
<name id="249">empty</name>
<source idref="215"/>
<target id="250">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="251">Close Transaction</name>
<nodeHandler>com.j2fe.streetlamp.activities.CloseTransaction</nodeHandler>
<nodeHandlerClass id="252">com.j2fe.streetlamp.activities.CloseTransaction</nodeHandlerClass>
<parameters id="253" type="java.util.HashSet">
<item id="254" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="255">filtered</name>
<stringValue id="256">false</stringValue>
<type>CONSTANT</type>
</item>
<item id="257" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="258">formattedMessages</name>
<stringValue id="259">Translated</stringValue>
<type>VARIABLE</type>
</item>
<item id="260" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="261">maxSeverity</name>
<stringValue id="262">Severity</stringValue>
<type>VARIABLE</type>
</item>
<item id="263" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="264">messageType</name>
<stringValue id="265">MessageType</stringValue>
<type>VARIABLE</type>
</item>
<item id="266" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="267">submittedMessage</name>
<stringValue id="268">Message</stringValue>
<type>VARIABLE</type>
</item>
<item id="269" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="270">transactionId</name>
<stringValue id="271">TransactionId</stringValue>
<type>VARIABLE</type>
</item>
<item id="272" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="273">transactionMetaData</name>
<stringValue id="274">PublishingTranslatedOutput</stringValue>
<type>VARIABLE</type>
<variablePart id="275">metaData</variablePart>
</item>
<item id="276" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="277">translatedTimestamp</name>
<stringValue id="278">TranslatedTimestamp</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="279" type="java.util.HashSet">
<item idref="248" type="com.j2fe.workflow.definition.Transition"/>
<item id="280" type="com.j2fe.workflow.definition.Transition">
<name id="281">goto-next</name>
<source id="282">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="283">Process Message</name>
<nodeHandler>com.j2fe.tp.activities.ProcessTransaction</nodeHandler>
<nodeHandlerClass id="284">com.j2fe.tp.activities.ProcessTransaction</nodeHandlerClass>
<parameters id="285" type="java.util.HashSet">
<item id="286" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="287">engineResource</name>
<stringValue id="288">engine/TPS-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="289" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="290">inputFromTranslation</name>
<stringValue id="291">PublishingTranslatedOutput</stringValue>
<type>VARIABLE</type>
</item>
<item id="292" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="293">messageMetaData</name>
<stringValue id="294">MessageMetaData</stringValue>
<type>VARIABLE</type>
</item>
<item id="295" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="296">messageType</name>
<stringValue id="297">MessageType</stringValue>
<type>VARIABLE</type>
</item>
<item id="298" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="299">processed</name>
<stringValue id="300">Processed</stringValue>
<type>VARIABLE</type>
</item>
<item id="301" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="302">transactionId</name>
<stringValue id="303">TransactionId</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="304" type="java.util.HashSet">
<item id="305" type="com.j2fe.workflow.definition.Transition">
<name id="306">false</name>
<source id="307">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="308">Switch Case</name>
<nodeHandler>com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandler>
<nodeHandlerClass id="309">com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandlerClass>
<parameters id="310" type="java.util.HashSet">
<item id="311" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="312">caseItem</name>
<stringValue id="313">IsWorkstationMessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="314" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="315">nullTransition</name>
<stringValue id="316">false</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="317" type="java.util.HashSet">
<item id="318" type="com.j2fe.workflow.definition.Transition">
<name id="319">ToSplit</name>
<source id="320">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="321">Automatically generated</description>
<directJoin>false</directJoin>
<name id="322">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="323">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="324" type="java.util.HashSet">
<item id="325" type="com.j2fe.workflow.definition.Transition">
<name id="326">false</name>
<source id="327">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="328">Filter Message?</name>
<nodeHandler>com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandler>
<nodeHandlerClass id="329">com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandlerClass>
<parameters id="330" type="java.util.HashSet">
<item id="331" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="332">caseItem</name>
<stringValue id="333">PublishingTranslatedOutput</stringValue>
<type>VARIABLE</type>
<variablePart id="334">filteredFromGSDM</variablePart>
</item>
<item id="335" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="336">defaultItem</name>
<stringValue id="337">false</stringValue>
<type>CONSTANT</type>
</item>
<item id="338" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="339">nullTransition</name>
<stringValue id="340">false</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="341" type="java.util.HashSet">
<item id="342" type="com.j2fe.workflow.definition.Transition">
<name id="343">goto-next</name>
<source id="344">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="345">Call Store Vendor Data</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="346">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="347" type="java.util.HashSet">
<item id="348" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="349">["Message"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="350">input["Message"]</name>
<stringValue id="351">Message</stringValue>
<type>VARIABLE</type>
</item>
<item id="352" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="353">["MessageType"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="354">input["MessageType"]</name>
<stringValue id="355">MessageType</stringValue>
<type>VARIABLE</type>
</item>
<item id="356" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="357">["ProcessFilteredMessages"]@java/lang/Boolean@</UITypeHint>
<input>true</input>
<name id="358">input["ProcessFilteredMessages"]</name>
<stringValue id="359">ProcessFilteredMessages</stringValue>
<type>VARIABLE</type>
</item>
<item id="360" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="361">["PublishingTranslatedOutput"]@com/j2fe/translation/Result@</UITypeHint>
<input>true</input>
<name id="362">input["PublishingTranslatedOutput"]</name>
<stringValue id="363">PublishingTranslatedOutput</stringValue>
<type>VARIABLE</type>
</item>
<item id="364" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="365">["SaveVendorDataType"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="366">input["SaveVendorDataType"]</name>
<stringValue id="367">MessageMetaData</stringValue>
<type>VARIABLE</type>
<variablePart id="368">["SaveVendorDataType"]</variablePart>
</item>
<item id="369" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="370">["TransactionId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="371">input["TransactionId"]</name>
<stringValue id="372">TransactionId</stringValue>
<type>VARIABLE</type>
</item>
<item id="373" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="374">name</name>
<stringValue id="375">Store Vendor Data</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="376" type="java.util.HashSet">
<item id="377" type="com.j2fe.workflow.definition.Transition">
<name id="378">not-empty</name>
<source idref="215"/>
<target idref="344"/>
</item>
</sources>
<targets id="379" type="java.util.HashSet">
<item idref="342" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="327"/>
</item>
</sources>
<targets id="380" type="java.util.HashSet">
<item idref="325" type="com.j2fe.workflow.definition.Transition"/>
<item id="381" type="com.j2fe.workflow.definition.Transition">
<name id="382">true</name>
<source idref="327"/>
<target id="383">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="384">Override Filter?</name>
<nodeHandler>com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandler>
<nodeHandlerClass id="385">com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandlerClass>
<parameters id="386" type="java.util.HashSet">
<item id="387" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="388">caseItem</name>
<stringValue id="389">ProcessFilteredMessages</stringValue>
<type>VARIABLE</type>
</item>
<item id="390" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="391">defaultItem</name>
<stringValue id="392">false</stringValue>
<type>CONSTANT</type>
</item>
<item id="393" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="394">nullTransition</name>
<stringValue id="395">false</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="396" type="java.util.HashSet">
<item idref="381" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="397" type="java.util.HashSet">
<item id="398" type="com.j2fe.workflow.definition.Transition">
<name id="399">false</name>
<source idref="383"/>
<target id="400">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="401">Close Filtered Transaction</name>
<nodeHandler>com.j2fe.streetlamp.activities.CloseTransaction</nodeHandler>
<nodeHandlerClass id="402">com.j2fe.streetlamp.activities.CloseTransaction</nodeHandlerClass>
<parameters id="403" type="java.util.HashSet">
<item id="404" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="405">filtered</name>
<objectValue id="406" type="java.lang.Boolean">true</objectValue>
<type>CONSTANT</type>
</item>
<item id="407" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="408">formattedMessages</name>
<stringValue id="409">Translated</stringValue>
<type>VARIABLE</type>
</item>
<item id="410" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="411">maxSeverity</name>
<stringValue id="412">Severity</stringValue>
<type>VARIABLE</type>
</item>
<item id="413" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="414">messageType</name>
<stringValue id="415">MessageType</stringValue>
<type>VARIABLE</type>
</item>
<item id="416" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="417">submittedMessage</name>
<stringValue id="418">Message</stringValue>
<type>VARIABLE</type>
</item>
<item id="419" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="420">transactionId</name>
<stringValue id="421">TransactionId</stringValue>
<type>VARIABLE</type>
</item>
<item id="422" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="423">transactionMetaData</name>
<stringValue id="424">PublishingTranslatedOutput</stringValue>
<type>VARIABLE</type>
<variablePart id="425">metaData</variablePart>
</item>
<item id="426" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="427">translatedTimestamp</name>
<stringValue id="428">TranslatedTimestamp</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="429" type="java.util.HashSet">
<item idref="398" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="430" type="java.util.HashSet">
<item id="431" type="com.j2fe.workflow.definition.Transition">
<name id="432">goto-next</name>
<source idref="400"/>
<target id="433">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="434">Trigger Publishing Events #2</name>
<nodeHandler>com.j2fe.tp.activities.TriggerPublishing</nodeHandler>
<nodeHandlerClass id="435">com.j2fe.tp.activities.TriggerPublishing</nodeHandlerClass>
<parameters id="436" type="java.util.HashSet">
<item id="437" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="438">inputMessage</name>
<stringValue id="439">Message</stringValue>
<type>VARIABLE</type>
</item>
<item id="440" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="441">internalPublishingEvent</name>
<stringValue id="442">InternalPublishingEvent</stringValue>
<type>VARIABLE</type>
</item>
<item id="443" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="444">messageType</name>
<stringValue id="445">MessageType</stringValue>
<type>VARIABLE</type>
</item>
<item id="446" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="447">processedMessages</name>
<stringValue id="448">Processed</stringValue>
<type>VARIABLE</type>
</item>
<item id="449" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="450">severity</name>
<stringValue id="451">Severity</stringValue>
<type>VARIABLE</type>
</item>
<item id="452" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="453">transactionId</name>
<stringValue id="454">TransactionId</stringValue>
<type>VARIABLE</type>
</item>
<item id="455" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="456">translatedMessages</name>
<stringValue id="457">PublishingTranslatedOutput</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="458" type="java.util.HashSet">
<item idref="431" type="com.j2fe.workflow.definition.Transition"/>
<item id="459" type="com.j2fe.workflow.definition.Transition">
<name id="460">goto-next</name>
<source idref="250"/>
<target idref="433"/>
</item>
</sources>
<targets id="461" type="java.util.HashSet">
<item id="462" type="com.j2fe.workflow.definition.Transition">
<name id="463">goto-next</name>
<source idref="433"/>
<target idref="2"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item id="464" type="com.j2fe.workflow.definition.Transition">
<name id="465">true</name>
<source idref="383"/>
<target idref="320"/>
</item>
</targets>
<type>XORSPLIT</type>
</target>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="320"/>
</item>
<item idref="464" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="466" type="java.util.HashSet">
<item idref="318" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="307"/>
</item>
</sources>
<targets id="467" type="java.util.HashSet">
<item idref="305" type="com.j2fe.workflow.definition.Transition"/>
<item id="468" type="com.j2fe.workflow.definition.Transition">
<name id="469">true</name>
<source idref="307"/>
<target id="470">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="471">Process UI Message</name>
<nodeHandler>com.j2fe.tp.activities.ProcessTransaction</nodeHandler>
<nodeHandlerClass id="472">com.j2fe.tp.activities.ProcessTransaction</nodeHandlerClass>
<parameters id="473" type="java.util.HashSet">
<item id="474" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="475">engineResource</name>
<stringValue id="476">engine/TPS-UI</stringValue>
<type>REFERENCE</type>
</item>
<item id="477" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="478">inputFromTranslation</name>
<stringValue id="479">PublishingTranslatedOutput</stringValue>
<type>VARIABLE</type>
</item>
<item id="480" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="481">messageMetaData</name>
<stringValue id="482">MessageMetaData</stringValue>
<type>VARIABLE</type>
</item>
<item id="483" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="484">messageType</name>
<stringValue id="485">MessageType</stringValue>
<type>VARIABLE</type>
</item>
<item id="486" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="487">transactionId</name>
<stringValue id="488">TransactionId</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="489" type="java.util.HashSet">
<item idref="468" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="490" type="java.util.HashSet">
<item id="491" type="com.j2fe.workflow.definition.Transition">
<name id="492">goto-next</name>
<source idref="470"/>
<target idref="250"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="282"/>
</item>
</sources>
<targets id="493" type="java.util.HashSet">
<item idref="280" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="250"/>
</item>
<item idref="491" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="494" type="java.util.HashSet">
<item idref="459" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item idref="377" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</target>
</item>
<item idref="189" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="113"/>
</item>
</sources>
<targets id="495" type="java.util.HashSet">
<item idref="111" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="91"/>
</item>
</sources>
<targets id="496" type="java.util.HashSet">
<item idref="89" type="com.j2fe.workflow.definition.Transition"/>
<item idref="185" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="78"/>
</item>
</sources>
<targets id="497" type="java.util.HashSet">
<item idref="76" type="com.j2fe.workflow.definition.Transition"/>
<item id="498" type="com.j2fe.workflow.definition.Transition">
<name id="499">true</name>
<source idref="78"/>
<target id="500">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="501">Process Transaction UI</name>
<nodeHandler>com.j2fe.tp.activities.ProcessTransaction</nodeHandler>
<nodeHandlerClass id="502">com.j2fe.tp.activities.ProcessTransaction</nodeHandlerClass>
<parameters id="503" type="java.util.HashSet">
<item id="504" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="505">engineResource</name>
<stringValue id="506">engine/TPS-UI</stringValue>
<type>REFERENCE</type>
</item>
<item id="507" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="508">messageMetaData</name>
<stringValue id="509">MessageMetaData</stringValue>
<type>VARIABLE</type>
</item>
<item id="510" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="511">messageType</name>
<stringValue id="512">MessageType</stringValue>
<type>VARIABLE</type>
</item>
<item id="513" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="514">textInput</name>
<stringValue id="515">TranslatedMessages</stringValue>
<type>VARIABLE</type>
</item>
<item id="516" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="517">transactionId</name>
<stringValue id="518">TransactionId</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="519" type="java.util.HashSet">
<item idref="498" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="520" type="java.util.HashSet">
<item id="521" type="com.j2fe.workflow.definition.Transition">
<name id="522">goto-next</name>
<source idref="500"/>
<target idref="34"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="53"/>
</item>
</sources>
<targets id="523" type="java.util.HashSet">
<item idref="51" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="34"/>
</item>
<item idref="521" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="524" type="java.util.HashSet">
<item idref="32" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="8"/>
</item>
</sources>
<targets id="525" type="java.util.HashSet">
<item idref="6" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="2"/>
</item>
<item idref="462" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="526" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="527">Standard</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="528">user1</lastChangeUser>
<lastUpdate id="529">2019-06-08T08:35:45.000+0100</lastUpdate>
<name id="530">Basic Message Processing</name>
<nodes id="531" type="java.util.HashSet">
<item idref="120" type="com.j2fe.workflow.definition.Node"/>
<item idref="344" type="com.j2fe.workflow.definition.Node"/>
<item idref="400" type="com.j2fe.workflow.definition.Node"/>
<item idref="34" type="com.j2fe.workflow.definition.Node"/>
<item idref="250" type="com.j2fe.workflow.definition.Node"/>
<item idref="2" type="com.j2fe.workflow.definition.Node"/>
<item idref="327" type="com.j2fe.workflow.definition.Node"/>
<item idref="91" type="com.j2fe.workflow.definition.Node"/>
<item idref="113" type="com.j2fe.workflow.definition.Node"/>
<item idref="320" type="com.j2fe.workflow.definition.Node"/>
<item idref="383" type="com.j2fe.workflow.definition.Node"/>
<item idref="53" type="com.j2fe.workflow.definition.Node"/>
<item idref="282" type="com.j2fe.workflow.definition.Node"/>
<item idref="500" type="com.j2fe.workflow.definition.Node"/>
<item idref="470" type="com.j2fe.workflow.definition.Node"/>
<item idref="207" type="com.j2fe.workflow.definition.Node"/>
<item idref="307" type="com.j2fe.workflow.definition.Node"/>
<item idref="78" type="com.j2fe.workflow.definition.Node"/>
<item idref="215" type="com.j2fe.workflow.definition.Node"/>
<item idref="153" type="com.j2fe.workflow.definition.Node"/>
<item idref="8" type="com.j2fe.workflow.definition.Node"/>
<item idref="433" type="com.j2fe.workflow.definition.Node"/>
<item idref="191" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>true</optimize>
<parameter id="532" type="java.util.HashMap">
<entry>
<key id="533" type="java.lang.String">InternalPublishingEvent</key>
<value id="534" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="535">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="536">Location of the property file containing the connection details of server on which publishing application is deployed.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="537" type="java.lang.String">IsWorkstationMessage</key>
<value id="538" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="539">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="540" type="java.lang.String">Message</key>
<value id="541" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="542">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="543" type="java.lang.String">MessageMetaData</key>
<value id="544" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="545">java.util.Map</className>
<clazz>java.util.Map</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="546" type="java.lang.String">MessageType</key>
<value id="547" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="548">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="549" type="java.lang.String">ProcessFilteredMessages</key>
<value id="550" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="551">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="552" type="java.lang.String">Severity</key>
<value id="553" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="554">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<input>false</input>
<output>true</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="555" type="java.lang.String">TransactionId</key>
<value id="556" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="557">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="558" type="java.lang.String">messageArray</key>
<value id="559" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="560">[Ljava.lang.String;</className>
<clazz>[Ljava.lang.String;</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
</parameter>
<permissions id="561" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>true</purgeAtEnd>
<retries>1</retries>
<startNode idref="207"/>
<status>RELEASED</status>
<variables id="562" type="java.util.HashMap">
<entry>
<key id="563" type="java.lang.String">InternalPublishingEvent</key>
<value id="564" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="565">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="566">Location of the property file containing the connection details of server on which publishing application is deployed.</description>
<persistent>false</persistent>
<value id="567" type="java.lang.String">InternalMessagePublishingEvent</value>
</value>
</entry>
<entry>
<key id="568" type="java.lang.String">IsWorkstationMessage</key>
<value id="569" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="570">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<persistent>false</persistent>
<value id="571" type="java.lang.Boolean">false</value>
</value>
</entry>
<entry>
<key id="572" type="java.lang.String">Message</key>
<value id="573" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="574">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="575" type="java.lang.String">MessageMetaData</key>
<value id="576" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="577">java.util.Map</className>
<clazz>java.util.Map</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="578" type="java.lang.String">MessageType</key>
<value id="579" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="580">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="581" type="java.lang.String">ProcessFilteredMessages</key>
<value id="582" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="583">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<persistent>false</persistent>
<value idref="571"/>
</value>
</entry>
<entry>
<key id="584" type="java.lang.String">Processed</key>
<value id="585" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="586">[[B</className>
<clazz>[[B</clazz>
<description id="587">The Processed Messages</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="588" type="java.lang.String">Severity</key>
<value id="589" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="590">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<persistent>false</persistent>
<value id="591" type="java.lang.Integer">0</value>
</value>
</entry>
<entry>
<key id="592" type="java.lang.String">TransactionId</key>
<value id="593" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="594">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="595" type="java.lang.String">TranslatedMessages</key>
<value id="596" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="597">[Ljava.lang.Object;</className>
<clazz>[Ljava.lang.Object;</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="598" type="java.lang.String">counter</key>
<value id="599" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="600">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<persistent>true</persistent>
<value idref="591"/>
</value>
</entry>
<entry>
<key id="601" type="java.lang.String">firstMessageMetaData</key>
<value id="602" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="603">java.lang.Object</className>
<clazz>java.lang.Object</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="604" type="java.lang.String">messageArray</key>
<value id="605" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="606">[Ljava.lang.String;</className>
<clazz>[Ljava.lang.String;</clazz>
<persistent>false</persistent>
</value>
</entry>
</variables>
<version>10</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
