<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.07">
<package-comment/>
<businessobject displayString="13 - 10.0.0.08" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>false</alwaysPersist>
<clustered>true</clustered>
<comment id="1">10.0.0.08</comment>
<description id="2">This workflow creates a job id for the file and splits the file into messages (according to the Bulk Size). The workflow then tries to correlate the single messages to the Requests that have been made. If a response and a request could be correlated then the Bloomberg Keystream Messages workflow is called. If there are response messages having an Error Code not equal to 0 (which indicates an error form Bloomberg), then the Report Error workflow is called which sets the affected Request to FAILED. After the file was processed for all the Requests that do not have a status of CLOSED or FAILED the Error Reporting workflow is called which sets their status to FAILED because then no response for the Requests was found in the response file from Bloomberg. After this the Job and the File are closed and the workflow finishes.</description>
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
<name id="12">Call Report Error</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="13">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="14" type="java.util.HashSet">
<item id="15" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="16">["ApplicationId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="17">input["ApplicationId"]</name>
<objectValue id="18" type="java.lang.String">VENDOR</objectValue>
<type>CONSTANT</type>
</item>
<item id="19" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="20">["ErrorText"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="21">input["ErrorText"]</name>
<stringValue id="22">Exception</stringValue>
<type>VARIABLE</type>
</item>
<item id="23" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="24">["NotificationId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="25">input["NotificationId"]</name>
<objectValue id="26" type="java.lang.String">8</objectValue>
<type>CONSTANT</type>
</item>
<item id="27" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="28">["PartId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="29">input["PartId"]</name>
<objectValue id="30" type="java.lang.String">REQREPLY</objectValue>
<type>CONSTANT</type>
</item>
<item id="31" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="32">["TRID"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="33">input["TRID"]</name>
<stringValue id="34">RequestTransaction</stringValue>
<type>VARIABLE</type>
</item>
<item id="35" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="36">["VREQOIDS"]@[Ljava/lang/String;@</UITypeHint>
<input>true</input>
<name id="37">input["VREQOIDS"]</name>
<stringValue id="38">AllRequestOIDs</stringValue>
<type>VARIABLE</type>
</item>
<item id="39" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="40">name</name>
<stringValue id="41">Report Error</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="42" type="java.util.HashSet">
<item id="43" type="com.j2fe.workflow.definition.Transition">
<name id="44">error</name>
<source id="45">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="46"/>
<directJoin>false</directJoin>
<name id="47">Open File</name>
<nodeHandler>com.j2fe.feeds.activities.ReadFile</nodeHandler>
<nodeHandlerClass id="48">com.j2fe.feeds.activities.ReadFile</nodeHandlerClass>
<parameters id="49" type="java.util.HashSet">
<item id="50" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="51">businessFeed</name>
<stringValue id="52">BusinessFeed</stringValue>
<type>VARIABLE</type>
</item>
<item id="53" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="54">businessFeed</name>
<stringValue id="55">BusinessFeed</stringValue>
<type>VARIABLE</type>
</item>
<item id="56" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="57">exception</name>
<stringValue id="58">Exception</stringValue>
<type>VARIABLE</type>
</item>
<item id="59" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="60">file</name>
<stringValue id="61">ReplyFile</stringValue>
<type>VARIABLE</type>
</item>
<item id="62" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="63">fileConnection</name>
<stringValue id="64">FileStatusObject</stringValue>
<type>VARIABLE</type>
</item>
<item id="65" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="66">grouping</name>
<stringValue id="67">GroupingEnabled</stringValue>
<type>VARIABLE</type>
</item>
<item id="68" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="69">jobId</name>
<stringValue id="70">JobID</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<persistentVariables id="71" type="java.util.HashSet">
<item id="72" type="java.lang.String">FileStatusObject
1000</item>
</persistentVariables>
<sources id="73" type="java.util.HashSet">
<item id="74" type="com.j2fe.workflow.definition.Transition">
<name id="75">goto-next</name>
<source id="76">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="77"/>
<directJoin>false</directJoin>
<name id="78">Bean Shell Script (Standard) #3</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="79">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="80" type="java.util.HashSet">
<item id="81" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="82">statements</name>
<stringValue id="83">import org.apache.log4j.Logger;
Logger logger = Logger.getLogger(String.class);

logger.debug("MessageMetaData " +messageMetaData + "ProcessFilteredMessages :" + processFilteredMessages + "RequestTransaction" +requestTransaction + "PricePointEventDefinitionId" + PricePointEventDefinitionId + "FailedCounter" + FailedCounter + "AllRequestOIDs" + AllRequestOIDs  + "BulkSize" + BulkSize);
</stringValue>
<type>CONSTANT</type>
</item>
<item id="84" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="85">variables["AllRequestOIDs"]</name>
<stringValue id="86">AllRequestOIDs</stringValue>
<type>VARIABLE</type>
</item>
<item id="87" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="88">variables["BulkSize"]</name>
<stringValue id="89">BulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="90" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="91">variables["PricePointEventDefinitionId"]</name>
<stringValue id="92">PricePointEventDefinitionId</stringValue>
<type>VARIABLE</type>
</item>
<item id="93" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="94">variables["messageMetaData"]</name>
<stringValue id="95">MessageMetaData</stringValue>
<type>VARIABLE</type>
</item>
<item id="96" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="97">["processFilteredMessages"]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="98">variables["processFilteredMessages"]</name>
<stringValue id="99">ProcessFilteredMessages</stringValue>
<type>VARIABLE</type>
</item>
<item id="100" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="101">variables["requestTransaction"]</name>
<stringValue id="102">RequestTransaction</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="103" type="java.util.HashSet">
<item id="104" type="com.j2fe.workflow.definition.Transition">
<name id="105">goto-next</name>
<source id="106">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="107"/>
<directJoin>false</directJoin>
<name id="108">Create Job</name>
<nodeHandler>com.j2fe.streetlamp.activities.CreateJob</nodeHandler>
<nodeHandlerClass id="109">com.j2fe.streetlamp.activities.CreateJob</nodeHandlerClass>
<parameters id="110" type="java.util.HashSet">
<item id="111" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="112">configInfo</name>
<stringValue id="113">Bloomberg Reply File</stringValue>
<type>CONSTANT</type>
</item>
<item id="114" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="115">file</name>
<stringValue id="116">ReplyFile</stringValue>
<type>VARIABLE</type>
</item>
<item id="117" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="118">flushImmediate</name>
<stringValue id="119">true</stringValue>
<type>CONSTANT</type>
</item>
<item id="120" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="121">jobDefinitionId</name>
<stringValue id="122">JobDefinitionId</stringValue>
<type>VARIABLE</type>
</item>
<item id="123" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="124">jobId</name>
<stringValue id="125">JobID</stringValue>
<type>VARIABLE</type>
</item>
<item id="126" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="127">parentJobId</name>
<stringValue id="128">Parent Job Id</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="129" type="java.util.HashSet"/>
<targets id="130" type="java.util.HashSet">
<item idref="104" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="76"/>
</item>
</sources>
<targets id="131" type="java.util.HashSet">
<item idref="74" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="45"/>
</item>
</sources>
<targets id="132" type="java.util.HashSet">
<item idref="43" type="com.j2fe.workflow.definition.Transition"/>
<item id="133" type="com.j2fe.workflow.definition.Transition">
<name id="134">success</name>
<source idref="45"/>
<target id="135">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="136"/>
<directJoin>false</directJoin>
<name id="137">PPED</name>
<nodeHandler>com.j2fe.general.activities.IsNull</nodeHandler>
<nodeHandlerClass id="138">com.j2fe.general.activities.IsNull</nodeHandlerClass>
<parameters id="139" type="java.util.HashSet">
<item id="140" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="141">input</name>
<stringValue id="142">PricePointEventDefinitionId</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="143" type="java.util.HashSet">
<item idref="133" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="144" type="java.util.HashSet">
<item id="145" type="com.j2fe.workflow.definition.Transition">
<name id="146">false</name>
<source idref="135"/>
<target id="147">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="148"/>
<directJoin>false</directJoin>
<name id="149">check DB</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="150">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="151" type="java.util.HashSet">
<item id="152" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="153">statements</name>
<stringValue id="154">import com.j2fe.querybuilder.DBPropertyLoader;

String db = DBPropertyLoader.dbName;
if(db.equals("PostgreSQL"))
{
return "PostgreSQL";
}
else if(db.equals("oracle"))
{
return "oracle";
}</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="155" type="java.util.HashSet">
<item idref="145" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="156" type="java.util.HashSet">
<item id="157" type="com.j2fe.workflow.definition.Transition">
<name id="158">PostgreSQL</name>
<source idref="147"/>
<target id="159">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="160"/>
<directJoin>false</directJoin>
<name id="161">query creation</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="162">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="163" type="java.util.HashSet">
<item id="164" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="165">statements</name>
<stringValue id="166">String dollar="$$";
String comma=";";
String s1="'";

String query ="do "+ dollar+
		" DECLARE"+
		" PPED_OID_PARAM VARCHAR(1000)"+comma+
		" JOB_ID_PARAM VARCHAR(1000)"+comma+
		" begin" +
		" PPED_OID_PARAM:="+s1+ PPED_OID +s1+comma+
		" JOB_ID_PARAM:="+s1+ JOB_ID+s1+comma+
		" IF(PPED_OID_PARAM is not null) then"+
		  " Insert into FT_O_PPJB(PPED_OID, JOB_ID) Values ("+s1+PPED_OID+s1 +","+s1+ JOB_ID+s1 +")"+comma+
		" end if"+comma+
		" end"+comma+" "+
		 dollar;</stringValue>
<type>CONSTANT</type>
</item>
<item id="167" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="168">variables["JOB_ID"]</name>
<stringValue id="169">JobID</stringValue>
<type>VARIABLE</type>
</item>
<item id="170" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="171">["PPED_OID"]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="172">variables["PPED_OID"]</name>
<stringValue id="173">PricePointEventDefinitionId</stringValue>
<type>VARIABLE</type>
</item>
<item id="174" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="175">variables["query"]</name>
<stringValue id="176">query</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="177" type="java.util.HashSet">
<item idref="157" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="178" type="java.util.HashSet">
<item id="179" type="com.j2fe.workflow.definition.Transition">
<name id="180">goto-next</name>
<source idref="159"/>
<target id="181">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="182"/>
<directJoin>false</directJoin>
<name id="183">Populate PPJB</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="184">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="185" type="java.util.HashSet">
<item id="186" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="187">database</name>
<stringValue id="188">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="189" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="190">querySQL</name>
<stringValue id="191">query</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="192" type="java.util.HashSet">
<item idref="179" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="193" type="java.util.HashSet">
<item id="194" type="com.j2fe.workflow.definition.Transition">
<name id="195">goto-next</name>
<source idref="181"/>
<target id="196">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="197"/>
<directJoin>false</directJoin>
<name id="198">Merge Point</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="199">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="200" type="java.util.HashSet">
<item id="201" type="com.j2fe.workflow.definition.Transition">
<name id="202">goto-next</name>
<source id="203">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="204"/>
<directJoin>false</directJoin>
<name id="205">Consolidate Job</name>
<nodeHandler>com.j2fe.streetlamp.activities.ConsolidateJob</nodeHandler>
<nodeHandlerClass id="206">com.j2fe.streetlamp.activities.ConsolidateJob</nodeHandlerClass>
<parameters id="207" type="java.util.HashSet">
<item id="208" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="209">jobId</name>
<stringValue id="210">JobID</stringValue>
<type>VARIABLE</type>
</item>
<item id="211" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="212">updateTotalCount</name>
<stringValue id="213">true</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="214" type="java.util.HashSet">
<item id="215" type="com.j2fe.workflow.definition.Transition">
<name id="216">end-loop</name>
<source id="217">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="218"/>
<directJoin>false</directJoin>
<name id="219">For Loop</name>
<nodeHandler>com.j2fe.workflow.handler.impl.ForEach</nodeHandler>
<nodeHandlerClass id="220">com.j2fe.workflow.handler.impl.ForEach</nodeHandlerClass>
<parameters id="221" type="java.util.HashSet">
<item id="222" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="223">counter</name>
<stringValue id="224">FailedCounter</stringValue>
<type>VARIABLE</type>
</item>
<item id="225" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="226">counter</name>
<stringValue id="227">FailedCounter</stringValue>
<type>VARIABLE</type>
</item>
<item id="228" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="229">input</name>
<stringValue id="230">FailedMessages</stringValue>
<type>VARIABLE</type>
</item>
<item id="231" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="232">output</name>
<stringValue id="233">FailedMessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="234" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="235">resetOnEnd</name>
<stringValue id="236">true</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="237" type="java.util.HashSet">
<item id="238" type="com.j2fe.workflow.definition.Transition">
<name id="239">ToSplit</name>
<source id="240">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="241">Automatically generated</description>
<directJoin>false</directJoin>
<name id="242">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="243">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="244" type="java.util.HashSet">
<item id="245" type="com.j2fe.workflow.definition.Transition">
<name id="246">goto-next</name>
<source id="247">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="248"/>
<directJoin>false</directJoin>
<name id="249">Close Transaction</name>
<nodeHandler>com.j2fe.streetlamp.activities.CloseTransaction</nodeHandler>
<nodeHandlerClass id="250">com.j2fe.streetlamp.activities.CloseTransaction</nodeHandlerClass>
<parameters id="251" type="java.util.HashSet">
<item id="252" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="253">filtered</name>
<stringValue id="254">false</stringValue>
<type>CONSTANT</type>
</item>
<item id="255" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="256">maxSeverity</name>
<stringValue id="257">Severity</stringValue>
<type>VARIABLE</type>
</item>
<item id="258" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="259">messageType</name>
<stringValue id="260">FailedMessage</stringValue>
<type>VARIABLE</type>
<variablePart id="261">properties.messageType</variablePart>
</item>
<item id="262" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="263">submittedMessage</name>
<stringValue id="264">FailedMessage</stringValue>
<type>VARIABLE</type>
<variablePart id="265">message</variablePart>
</item>
<item id="266" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="267">transactionId</name>
<stringValue id="268">failedTRID</stringValue>
<type>VARIABLE</type>
</item>
<item id="269" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="270">translatedTimestamp</name>
<stringValue id="271">TranslatedTimestamp</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="272" type="java.util.HashSet">
<item id="273" type="com.j2fe.workflow.definition.Transition">
<name id="274">goto-next</name>
<source id="275">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="276"/>
<directJoin>false</directJoin>
<name id="277">Call Report Error</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="278">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="279" type="java.util.HashSet">
<item id="280" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="281">["ApplicationId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="282">input["ApplicationId"]</name>
<objectValue id="283" type="java.lang.String">VENDOR</objectValue>
<type>CONSTANT</type>
</item>
<item id="284" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="285">["ErrorText"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="286">input["ErrorText"]</name>
<stringValue id="287">FailedMessage</stringValue>
<type>VARIABLE</type>
<variablePart id="288">properties.custom["ErrorMessage"]</variablePart>
</item>
<item id="289" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="290">["NotificationId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="291">input["NotificationId"]</name>
<objectValue id="292" type="java.lang.String">6</objectValue>
<type>CONSTANT</type>
</item>
<item id="293" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="294">["ParameterValues"]@java/util/Map@["ERRORTEXT"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="295">input["ParameterValues"]["ERRORTEXT"]</name>
<stringValue id="296">FailedMessage</stringValue>
<type>VARIABLE</type>
<variablePart id="297">properties.custom["ErrorMessage"]</variablePart>
</item>
<item id="298" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="299">["PartId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="300">input["PartId"]</name>
<objectValue id="301" type="java.lang.String">REQREPLY</objectValue>
<type>CONSTANT</type>
</item>
<item id="302" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="303">["Status"]@com/j2fe/connector/RequestStatus@</UITypeHint>
<input>true</input>
<name id="304">input["Status"]</name>
<stringValue id="305">FailedMessage</stringValue>
<type>VARIABLE</type>
<variablePart id="306">properties.custom["Status"]</variablePart>
</item>
<item id="307" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="308">["TRID"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="309">input["TRID"]</name>
<stringValue id="310">RequestTransaction</stringValue>
<type>VARIABLE</type>
</item>
<item id="311" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="312">["UpdateFailedRequests"]@java/lang/Boolean@</UITypeHint>
<input>true</input>
<name id="313">input["UpdateFailedRequests"]</name>
<objectValue id="314" type="java.lang.Boolean">true</objectValue>
<type>CONSTANT</type>
</item>
<item id="315" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="316">["VREQOIDS"]@[Ljava/lang/String;@</UITypeHint>
<input>true</input>
<name id="317">input["VREQOIDS"]</name>
<stringValue id="318">FailedMessage</stringValue>
<type>VARIABLE</type>
<variablePart id="319">properties.custom["OIDs"]</variablePart>
</item>
<item id="320" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="321">name</name>
<stringValue id="322">Report Error</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="323" type="java.util.HashSet">
<item id="324" type="com.j2fe.workflow.definition.Transition">
<name id="325">None</name>
<source id="326">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="327"/>
<directJoin>false</directJoin>
<name id="328">Store Vendor Data?</name>
<nodeHandler>com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandler>
<nodeHandlerClass id="329">com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandlerClass>
<parameters id="330" type="java.util.HashSet">
<item id="331" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="332">caseItem</name>
<stringValue id="333">Messages</stringValue>
<type>VARIABLE</type>
</item>
<item id="334" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="335">defaultItem</name>
<stringValue id="336">None</stringValue>
<type>CONSTANT</type>
</item>
<item id="337" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="338">nullTransition</name>
<stringValue id="339">None</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="340" type="java.util.HashSet">
<item id="341" type="com.j2fe.workflow.definition.Transition">
<name id="342">goto-next</name>
<source id="343">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="344"/>
<directJoin>false</directJoin>
<name id="345">Create Message</name>
<nodeHandler>com.j2fe.feeds.activities.CreateMessage</nodeHandler>
<nodeHandlerClass id="346">com.j2fe.feeds.activities.CreateMessage</nodeHandlerClass>
<parameters id="347" type="java.util.HashSet">
<item id="348" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="349">intputMessage</name>
<stringValue id="350">FailedMessage</stringValue>
<type>VARIABLE</type>
<variablePart id="351">message</variablePart>
</item>
<item id="352" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="353">message</name>
<stringValue id="354">internalFailedMessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="355" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="356">messageType</name>
<stringValue id="357">FailedMessage</stringValue>
<type>VARIABLE</type>
<variablePart id="358">properties.messageType</variablePart>
</item>
<item id="359" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="360">transactionId</name>
<stringValue id="361">failedTRID</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="362" type="java.util.HashSet">
<item id="363" type="com.j2fe.workflow.definition.Transition">
<name id="364">goto-next</name>
<source id="365">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="366"/>
<directJoin>false</directJoin>
<name id="367">Create Transaction</name>
<nodeHandler>com.j2fe.streetlamp.activities.CreateTransaction</nodeHandler>
<nodeHandlerClass id="368">com.j2fe.streetlamp.activities.CreateTransaction</nodeHandlerClass>
<parameters id="369" type="java.util.HashSet">
<item id="370" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="371">flushImmediate</name>
<stringValue id="372">false</stringValue>
<type>CONSTANT</type>
</item>
<item id="373" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="374">jobId</name>
<stringValue id="375">JobID</stringValue>
<type>VARIABLE</type>
</item>
<item id="376" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="377">messageType</name>
<stringValue id="378">FailedMessage</stringValue>
<type>VARIABLE</type>
<variablePart id="379">properties.messageType</variablePart>
</item>
<item id="380" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="381">recordNumber</name>
<stringValue id="382">FailedMessage</stringValue>
<type>VARIABLE</type>
<variablePart id="383">properties.jobIndex</variablePart>
</item>
<item id="384" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="385">transactionId</name>
<stringValue id="386">failedTRID</stringValue>
<type>VARIABLE</type>
</item>
<item id="387" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="388">vreqOID</name>
<stringValue id="389">FailedMessage</stringValue>
<type>VARIABLE</type>
<variablePart id="390">properties.custom["OID"]</variablePart>
</item>
</parameters>
<sources id="391" type="java.util.HashSet">
<item id="392" type="com.j2fe.workflow.definition.Transition">
<name id="393">loop</name>
<source idref="217"/>
<target idref="365"/>
</item>
</sources>
<targets id="394" type="java.util.HashSet">
<item idref="363" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="343"/>
</item>
</sources>
<targets id="395" type="java.util.HashSet">
<item idref="341" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="326"/>
</item>
</sources>
<targets id="396" type="java.util.HashSet">
<item id="397" type="com.j2fe.workflow.definition.Transition">
<name id="398">All</name>
<source idref="326"/>
<target id="399">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="400">Automatically generated</description>
<directJoin>false</directJoin>
<name id="401">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="402">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="403" type="java.util.HashSet">
<item idref="397" type="com.j2fe.workflow.definition.Transition"/>
<item id="404" type="com.j2fe.workflow.definition.Transition">
<name id="405">InputMessage</name>
<source idref="326"/>
<target idref="399"/>
</item>
<item id="406" type="com.j2fe.workflow.definition.Transition">
<name id="407">StructuredMessage</name>
<source idref="326"/>
<target idref="399"/>
</item>
</sources>
<targets id="408" type="java.util.HashSet">
<item id="409" type="com.j2fe.workflow.definition.Transition">
<name id="410">ToSplit</name>
<source idref="399"/>
<target id="411">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="412"/>
<directJoin>false</directJoin>
<name id="413">Store Vendor Data</name>
<nodeHandler>com.j2fe.general.activities.database.StoreVendorData</nodeHandler>
<nodeHandlerClass id="414">com.j2fe.general.activities.database.StoreVendorData</nodeHandlerClass>
<parameters id="415" type="java.util.HashSet">
<item id="416" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="417">database</name>
<stringValue id="418">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="419" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="420">inputMessage</name>
<stringValue id="421">FailedMessage</stringValue>
<type>VARIABLE</type>
<variablePart id="422">message</variablePart>
</item>
<item id="423" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="424">messageType</name>
<stringValue id="425">FailedMessage</stringValue>
<type>VARIABLE</type>
<variablePart id="426">properties.messageType</variablePart>
</item>
<item id="427" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="428">stageRecord</name>
<stringValue id="429">StageRecord</stringValue>
<type>VARIABLE</type>
</item>
<item id="430" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="431">trnId</name>
<stringValue id="432">failedTRID</stringValue>
<type>VARIABLE</type>
</item>
<item id="433" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="434">trnId</name>
<stringValue id="435">TransactionId</stringValue>
<type>VARIABLE</type>
</item>
<item id="436" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="437">vfsdOid</name>
<stringValue id="438">Messages</stringValue>
<type>VARIABLE</type>
<variablePart id="439">[0].properties.custom["VendorFeedStageId"]</variablePart>
</item>
</parameters>
<sources id="440" type="java.util.HashSet">
<item idref="409" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="441" type="java.util.HashSet">
<item id="442" type="com.j2fe.workflow.definition.Transition">
<name id="443">insert</name>
<source idref="411"/>
<target idref="275"/>
</item>
<item id="444" type="com.j2fe.workflow.definition.Transition">
<name id="445">insert-staging-elasticsearch</name>
<source idref="411"/>
<target idref="275"/>
</item>
<item id="446" type="com.j2fe.workflow.definition.Transition">
<name id="447">no-action</name>
<source idref="411"/>
<target idref="275"/>
</item>
<item id="448" type="com.j2fe.workflow.definition.Transition">
<name id="449">update</name>
<source idref="411"/>
<target idref="275"/>
</item>
</targets>
<type>XORSPLIT</type>
</target>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item idref="404" type="com.j2fe.workflow.definition.Transition"/>
<item idref="324" type="com.j2fe.workflow.definition.Transition"/>
<item idref="406" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="275"/>
</item>
<item idref="442" type="com.j2fe.workflow.definition.Transition"/>
<item idref="444" type="com.j2fe.workflow.definition.Transition"/>
<item idref="446" type="com.j2fe.workflow.definition.Transition"/>
<item idref="448" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="450" type="java.util.HashSet">
<item idref="273" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="247"/>
</item>
</sources>
<targets id="451" type="java.util.HashSet">
<item idref="245" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="240"/>
</item>
<item id="452" type="com.j2fe.workflow.definition.Transition">
<name id="453">goto-next</name>
<source id="454">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="455"/>
<directJoin>false</directJoin>
<name id="456">Failed Counter</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="457">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="458" type="java.util.HashSet">
<item id="459" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="460">statements</name>
<stringValue id="461">int failedCounter = 0;</stringValue>
<type>CONSTANT</type>
</item>
<item id="462" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="463">["failedCounter"]@java/lang/Integer@</UITypeHint>
<input>false</input>
<name id="464">variables["failedCounter"]</name>
<stringValue id="465">FailedCounter</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="466" type="java.util.HashSet">
<item id="467" type="com.j2fe.workflow.definition.Transition">
<name id="468">report error</name>
<source id="469">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="470"/>
<directJoin>false</directJoin>
<name id="471">Failed Messages?</name>
<nodeHandler>com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandler>
<nodeHandlerClass id="472">com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandlerClass>
<parameters id="473" type="java.util.HashSet">
<item id="474" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="475">caseItem</name>
<stringValue id="476">FailedMessages</stringValue>
<type>VARIABLE</type>
<variablePart id="477">length</variablePart>
</item>
<item id="478" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="479">defaultItem</name>
<stringValue id="480">report error</stringValue>
<type>CONSTANT</type>
</item>
<item id="481" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="482">nullTransition</name>
<stringValue id="483">false</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="484" type="java.util.HashSet">
<item id="485" type="com.j2fe.workflow.definition.Transition">
<name id="486">ToSplit</name>
<source id="487">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="488">Automatically generated</description>
<directJoin>false</directJoin>
<name id="489">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="490">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="491" type="java.util.HashSet">
<item id="492" type="com.j2fe.workflow.definition.Transition">
<name id="493">ToSplit</name>
<source id="494">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="495">Automatically generated</description>
<directJoin>false</directJoin>
<name id="496">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="497">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<persistentVariables id="498" type="java.util.HashSet">
<item id="499" type="java.lang.String">FailedMessages
0100</item>
<item id="500" type="java.lang.String">ResponseMessages
0100</item>
</persistentVariables>
<sources id="501" type="java.util.HashSet">
<item id="502" type="com.j2fe.workflow.definition.Transition">
<name id="503">empty</name>
<source id="504">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="505"/>
<directJoin>false</directJoin>
<name id="506">Correlate Bloomberg Response</name>
<nodeHandler>com.j2fe.feeds.request.CorrelateBloombergResponse</nodeHandler>
<nodeHandlerClass id="507">com.j2fe.feeds.request.CorrelateBloombergResponse</nodeHandlerClass>
<parameters id="508" type="java.util.HashSet">
<item id="509" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="510">failedMessages</name>
<stringValue id="511">FailedMessages</stringValue>
<type>VARIABLE</type>
</item>
<item id="512" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="513">fileConnection</name>
<stringValue id="514">FileStatusObject</stringValue>
<type>VARIABLE</type>
</item>
<item id="515" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="516">messages</name>
<stringValue id="517">Messages</stringValue>
<type>VARIABLE</type>
</item>
<item id="518" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="519">messages</name>
<stringValue id="520">ResponseMessages</stringValue>
<type>VARIABLE</type>
</item>
<item id="521" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="522">msfKeyConnectionFactory</name>
<stringValue id="523">msf/KeyGenerator</stringValue>
<type>REFERENCE</type>
</item>
<item id="524" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="525">preserveSpacesInIdentifier</name>
<stringValue id="526">PreserveSpacesInBBIdentifier</stringValue>
<type>VARIABLE</type>
</item>
<item id="527" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="528">requestMessageString</name>
<stringValue id="529">VendorRequestString</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<persistentVariables id="530" type="java.util.HashSet">
<item id="531" type="java.lang.String">FileStatusObject
0100</item>
<item id="532" type="java.lang.String">FailedMessages
1000</item>
</persistentVariables>
<sources id="533" type="java.util.HashSet">
<item id="534" type="com.j2fe.workflow.definition.Transition">
<name id="535">ToSplit</name>
<source id="536">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="537">Automatically generated</description>
<directJoin>false</directJoin>
<name id="538">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="539">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="540" type="java.util.HashSet">
<item id="541" type="com.j2fe.workflow.definition.Transition">
<name id="542">has-messages</name>
<source id="543">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="544"/>
<directJoin>false</directJoin>
<name id="545">File Split</name>
<nodeHandler>com.j2fe.feeds.activities.FileSplitCondition</nodeHandler>
<nodeHandlerClass id="546">com.j2fe.feeds.activities.FileSplitCondition</nodeHandlerClass>
<parameters id="547" type="java.util.HashSet">
<item id="548" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="549">bulk</name>
<stringValue id="550">BulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="551" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="552">businessFeed</name>
<stringValue id="553">BusinessFeed</stringValue>
<type>VARIABLE</type>
</item>
<item id="554" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="555">createTransactions</name>
<stringValue id="556">false</stringValue>
<type>CONSTANT</type>
</item>
<item id="557" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="558">fileConnection</name>
<stringValue id="559">FileStatusObject</stringValue>
<type>VARIABLE</type>
</item>
<item id="560" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="561">grouping</name>
<stringValue id="562">false</stringValue>
<type>CONSTANT</type>
</item>
<item id="563" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="564">messages</name>
<stringValue id="565">Messages</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<persistentVariables id="566" type="java.util.HashSet">
<item id="567" type="java.lang.String">FileStatusObject
1000</item>
</persistentVariables>
<sources id="568" type="java.util.HashSet">
<item id="569" type="com.j2fe.workflow.definition.Transition">
<name id="570">goto-next</name>
<source idref="196"/>
<target idref="543"/>
</item>
</sources>
<targets id="571" type="java.util.HashSet">
<item id="572" type="com.j2fe.workflow.definition.Transition">
<name id="573">end-of-file</name>
<source idref="543"/>
<target id="574">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="575"/>
<directJoin>false</directJoin>
<name id="576">Get Vedor RequestType</name>
<nodeHandler>com.j2fe.workflow.handler.impl.ExecuteXPath</nodeHandler>
<nodeHandlerClass id="577">com.j2fe.workflow.handler.impl.ExecuteXPath</nodeHandlerClass>
<parameters id="578" type="java.util.HashSet">
<item id="579" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="580">inputText</name>
<stringValue id="581">VendorRequestString</stringValue>
<type>VARIABLE</type>
</item>
<item id="582" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="583">outputValue</name>
<stringValue id="584">Result</stringValue>
<type>VARIABLE</type>
</item>
<item id="585" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="586">xPath</name>
<stringValue id="587">VendorRequest/Request/RequestType</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="588" type="java.util.HashSet">
<item idref="572" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="589" type="java.util.HashSet">
<item id="590" type="com.j2fe.workflow.definition.Transition">
<name id="591">goto-next</name>
<source idref="574"/>
<target id="592">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="593"/>
<directJoin>false</directJoin>
<name id="594">Get MsgType</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="595">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="596" type="java.util.HashSet">
<item id="597" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="598">database</name>
<stringValue id="599">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="600" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="601">[0]@java/lang/Object@</UITypeHint>
<input>false</input>
<name id="602">firstColumnsResult[0]</name>
<stringValue id="603">messageType</stringValue>
<type>VARIABLE</type>
<variablePart id="604">[0]</variablePart>
</item>
<item id="605" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="606">[0]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="607">indexedParameters[0]</name>
<stringValue id="608">Result</stringValue>
<type>VARIABLE</type>
</item>
<item id="609" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="610">querySQL</name>
<stringValue id="611">select msg_typ_nme from FT_T_MSTP where mstp_oid in (select mstp_oid from FT_T_VRTY where vnd_rqst_typ = ?)</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="612" type="java.util.HashSet">
<item idref="590" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="613" type="java.util.HashSet">
<item id="614" type="com.j2fe.workflow.definition.Transition">
<name id="615">goto-next</name>
<source idref="592"/>
<target id="616">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="617"/>
<directJoin>false</directJoin>
<name id="618">Call Report Error</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="619">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="620" type="java.util.HashSet">
<item id="621" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="622">["ApplicationId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="623">input["ApplicationId"]</name>
<objectValue id="624" type="java.lang.String">VENDOR</objectValue>
<type>CONSTANT</type>
</item>
<item id="625" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="626">["ErrorText"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="627">input["ErrorText"]</name>
<objectValue id="628" type="java.lang.String">No response found in the BB response file.</objectValue>
<type>CONSTANT</type>
</item>
<item id="629" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="630">["NotificationId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="631">input["NotificationId"]</name>
<objectValue id="632" type="java.lang.String">8</objectValue>
<type>CONSTANT</type>
</item>
<item id="633" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="634">["PartId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="635">input["PartId"]</name>
<objectValue id="636" type="java.lang.String">REQREPLY</objectValue>
<type>CONSTANT</type>
</item>
<item id="637" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="638">["TRID"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="639">input["TRID"]</name>
<stringValue id="640">RequestTransaction</stringValue>
<type>VARIABLE</type>
</item>
<item id="641" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="642">["VREQOIDS"]@[Ljava/lang/String;@</UITypeHint>
<input>true</input>
<name id="643">input["VREQOIDS"]</name>
<stringValue id="644">AllRequestOIDs</stringValue>
<type>VARIABLE</type>
</item>
<item id="645" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="646">name</name>
<stringValue id="647">Report Error</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<persistentVariables id="648" type="java.util.HashSet">
<item id="649" type="java.lang.String">FileStatusObject
1100</item>
<item id="650" type="java.lang.String">Messages
0100</item>
<item id="651" type="java.lang.String">JobID
1000</item>
</persistentVariables>
<sources id="652" type="java.util.HashSet">
<item idref="614" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="653" type="java.util.HashSet">
<item id="654" type="com.j2fe.workflow.definition.Transition">
<name id="655">goto-next</name>
<source idref="616"/>
<target id="656">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="657"/>
<directJoin>false</directJoin>
<name id="658">Check PPED</name>
<nodeHandler>com.j2fe.general.activities.IsNull</nodeHandler>
<nodeHandlerClass id="659">com.j2fe.general.activities.IsNull</nodeHandlerClass>
<parameters id="660" type="java.util.HashSet">
<item id="661" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="662">input</name>
<stringValue id="663">PricePointEventDefinitionId</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="664" type="java.util.HashSet">
<item idref="654" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="665" type="java.util.HashSet">
<item id="666" type="com.j2fe.workflow.definition.Transition">
<name id="667">false</name>
<source idref="656"/>
<target id="668">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="669"/>
<directJoin>false</directJoin>
<name id="670">check DB</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="671">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="672" type="java.util.HashSet">
<item id="673" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="674">statements</name>
<stringValue id="675">import com.j2fe.querybuilder.DBPropertyLoader;

String db = DBPropertyLoader.dbName;
if(db.equals("PostgreSQL"))
{
return "PostgreSQL";
}
else if(db.equals("oracle"))
{
return "oracle";
}</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="676" type="java.util.HashSet">
<item idref="666" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="677" type="java.util.HashSet">
<item id="678" type="com.j2fe.workflow.definition.Transition">
<name id="679">PostgreSQL</name>
<source idref="668"/>
<target id="680">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="681"/>
<directJoin>false</directJoin>
<name id="682">query creation</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="683">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="684" type="java.util.HashSet">
<item id="685" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="686">statements</name>
<stringValue id="687">String dollar="$$";
String comma=";";
String s1="'";

String query ="do "+ dollar+
		" DECLARE"+
		" PPED_OID_PARAM VARCHAR(1000)"+comma+
		" JOB_ID_PARAM VARCHAR(1000)"+comma+
		" begin" +
		" PPED_OID_PARAM:="+s1+PPED_OID+s1+comma+
		" JOB_ID_PARAM:="+s1+ JOB_ID+s1+comma+
		" IF(PPED_OID_PARAM is not null) then"+
		  " delete from FT_O_PPJB where PPED_OID= "+s1+PPED_OID+s1 +"and JOB_ID="+s1+ JOB_ID+s1 +comma+
		" end if"+comma+
		" end"+comma+" "+
		 dollar;</stringValue>
<type>CONSTANT</type>
</item>
<item id="688" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="689">variables["JOB_ID"]</name>
<stringValue id="690">JobID</stringValue>
<type>VARIABLE</type>
</item>
<item id="691" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="692">["PPED_OID"]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="693">variables["PPED_OID"]</name>
<stringValue id="694">PricePointEventDefinitionId</stringValue>
<type>VARIABLE</type>
</item>
<item id="695" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="696">variables["query"]</name>
<stringValue id="697">query1</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="698" type="java.util.HashSet">
<item idref="678" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="699" type="java.util.HashSet">
<item id="700" type="com.j2fe.workflow.definition.Transition">
<name id="701">goto-next</name>
<source idref="680"/>
<target id="702">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="703"/>
<directJoin>false</directJoin>
<name id="704">Clear PPJB</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="705">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="706" type="java.util.HashSet">
<item id="707" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="708">database</name>
<stringValue id="709">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="710" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="711">querySQL</name>
<stringValue id="712">query1</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="713" type="java.util.HashSet">
<item idref="700" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="714" type="java.util.HashSet">
<item id="715" type="com.j2fe.workflow.definition.Transition">
<name id="716">goto-next</name>
<source idref="702"/>
<target id="717">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="718"/>
<directJoin>false</directJoin>
<name id="719">NOP</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="720">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="721" type="java.util.HashSet">
<item idref="715" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="722" type="java.util.HashSet">
<item id="723" type="com.j2fe.workflow.definition.Transition">
<name id="724">goto-next</name>
<source idref="717"/>
<target id="725">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="726"/>
<directJoin>false</directJoin>
<name id="727">Close Job</name>
<nodeHandler>com.j2fe.streetlamp.activities.CloseJob</nodeHandler>
<nodeHandlerClass id="728">com.j2fe.streetlamp.activities.CloseJob</nodeHandlerClass>
<parameters id="729" type="java.util.HashSet">
<item id="730" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="731">jobId</name>
<stringValue id="732">JobID</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<persistentVariables id="733" type="java.util.HashSet">
<item id="734" type="java.lang.String">JobID
0100</item>
</persistentVariables>
<sources id="735" type="java.util.HashSet">
<item id="736" type="com.j2fe.workflow.definition.Transition">
<name id="737">goto-next</name>
<source id="738">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="739"/>
<directJoin>false</directJoin>
<name id="740">Clear PPJB</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="741">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="742" type="java.util.HashSet">
<item id="743" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="744">database</name>
<stringValue id="745">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="746" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="747">[0]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="748">indexedParameters[0]</name>
<stringValue id="749">PricePointEventDefinitionId</stringValue>
<type>VARIABLE</type>
</item>
<item id="750" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="751">[1]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="752">indexedParameters[1]</name>
<stringValue id="753">JobID</stringValue>
<type>VARIABLE</type>
</item>
<item id="754" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="755">querySQL</name>
<stringValue id="756">DECLARE
PPED_OID_PARAM VARCHAR2(1000);
JOB_ID_PARAM VARCHAR2(1000);
begin
PPED_OID_PARAM:=?;
JOB_ID_PARAM:=?;
IF(PPED_OID_PARAM is not null) then
 delete from FT_O_PPJB where PPED_OID=PPED_OID_PARAM and JOB_ID=JOB_ID_PARAM;
end if;
end;</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="757" type="java.util.HashSet">
<item id="758" type="com.j2fe.workflow.definition.Transition">
<name id="759">oracle</name>
<source idref="668"/>
<target idref="738"/>
</item>
</sources>
<targets id="760" type="java.util.HashSet">
<item idref="736" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="725"/>
</item>
<item idref="723" type="com.j2fe.workflow.definition.Transition"/>
<item id="761" type="com.j2fe.workflow.definition.Transition">
<name id="762">true</name>
<source idref="656"/>
<target idref="725"/>
</item>
</sources>
<targets id="763" type="java.util.HashSet">
<item id="764" type="com.j2fe.workflow.definition.Transition">
<name id="765">goto-next</name>
<source idref="725"/>
<target id="766">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="767"/>
<directJoin>false</directJoin>
<name id="768">Close File</name>
<nodeHandler>com.j2fe.feeds.activities.EndFile</nodeHandler>
<nodeHandlerClass id="769">com.j2fe.feeds.activities.EndFile</nodeHandlerClass>
<parameters id="770" type="java.util.HashSet">
<item id="771" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="772">file</name>
<stringValue id="773">ReplyFile</stringValue>
<type>VARIABLE</type>
</item>
<item id="774" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="775">successAction</name>
<stringValue id="776">LEAVE</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="777" type="java.util.HashSet">
<item idref="764" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="778" type="java.util.HashSet">
<item id="779" type="com.j2fe.workflow.definition.Transition">
<name id="780">goto-next</name>
<source idref="766"/>
<target id="781">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="782"/>
<directJoin>false</directJoin>
<name id="783">Is Null </name>
<nodeHandler>com.j2fe.general.activities.IsNull</nodeHandler>
<nodeHandlerClass id="784">com.j2fe.general.activities.IsNull</nodeHandlerClass>
<parameters id="785" type="java.util.HashSet">
<item id="786" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="787">input</name>
<stringValue id="788">messageType</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="789" type="java.util.HashSet">
<item idref="779" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="790" type="java.util.HashSet">
<item id="791" type="com.j2fe.workflow.definition.Transition">
<name id="792">false</name>
<source idref="781"/>
<target id="793">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="794"/>
<directJoin>false</directJoin>
<name id="795">Check and Load Bulk file</name>
<nodeHandler>com.j2fe.event.RaiseEvent</nodeHandler>
<nodeHandlerClass id="796">com.j2fe.event.RaiseEvent</nodeHandlerClass>
<parameters id="797" type="java.util.HashSet">
<item id="798" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="799">eventName</name>
<stringValue id="800">BBLoadBulkFile</stringValue>
<type>CONSTANT</type>
</item>
<item id="801" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="802">["FileMetaData"]@java/util/Map@</UITypeHint>
<input>true</input>
<name id="803">parameters["FileMetaData"]</name>
<stringValue id="804">FileStatusObject</stringValue>
<type>VARIABLE</type>
<variablePart id="805">fileMetaData</variablePart>
</item>
<item id="806" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="807">["MessageType"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="808">parameters["MessageType"]</name>
<stringValue id="809">messageType</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="810" type="java.util.HashSet">
<item idref="791" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="811" type="java.util.HashSet">
<item id="812" type="com.j2fe.workflow.definition.Transition">
<name id="813">goto-next</name>
<source idref="793"/>
<target idref="3"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item id="814" type="com.j2fe.workflow.definition.Transition">
<name id="815">true</name>
<source idref="781"/>
<target idref="3"/>
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
<item idref="758" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</target>
</item>
<item idref="761" type="com.j2fe.workflow.definition.Transition"/>
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
<item idref="541" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="536"/>
</item>
</sources>
<targets id="816" type="java.util.HashSet">
<item idref="534" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="504"/>
</item>
</sources>
<targets id="817" type="java.util.HashSet">
<item idref="502" type="com.j2fe.workflow.definition.Transition"/>
<item id="818" type="com.j2fe.workflow.definition.Transition">
<name id="819">not-empty</name>
<source idref="504"/>
<target id="820">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="821"/>
<directJoin>true</directJoin>
<name id="822">Generic Split</name>
<nodeHandler>com.j2fe.workflow.handler.impl.GenericSplit</nodeHandler>
<nodeHandlerClass id="823">com.j2fe.workflow.handler.impl.GenericSplit</nodeHandlerClass>
<parameters id="824" type="java.util.HashSet">
<item id="825" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="826">input</name>
<stringValue id="827">ResponseMessages</stringValue>
<type>VARIABLE</type>
</item>
<item id="828" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="829">output</name>
<stringValue id="830">Message</stringValue>
<type>VARIABLE</type>
</item>
<item id="831" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="832"/>
<input>false</input>
<name id="833">output.properties.messageKey</name>
<stringValue id="834">MessageKey</stringValue>
<type>VARIABLE</type>
<variablePart id="835">properties.messageKey</variablePart>
</item>
</parameters>
<persistentVariables id="836" type="java.util.HashSet">
<item id="837" type="java.lang.String">Message
1000</item>
<item id="838" type="java.lang.String">FailedMessages
1000</item>
<item id="839" type="java.lang.String">JobID
1000</item>
<item id="840" type="java.lang.String">ResponseMessages
0100</item>
</persistentVariables>
<sources id="841" type="java.util.HashSet">
<item idref="818" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="842" type="java.util.HashSet">
<item id="843" type="com.j2fe.workflow.definition.Transition">
<name id="844">goto-next</name>
<source idref="820"/>
<target id="845">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="846"/>
<directJoin>false</directJoin>
<name id="847">Create Transaction</name>
<nodeHandler>com.j2fe.streetlamp.activities.CreateTransaction</nodeHandler>
<nodeHandlerClass id="848">com.j2fe.streetlamp.activities.CreateTransaction</nodeHandlerClass>
<parameters id="849" type="java.util.HashSet">
<item id="850" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="851">flushImmediate</name>
<stringValue id="852">false</stringValue>
<type>CONSTANT</type>
</item>
<item id="853" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="854">jobId</name>
<stringValue id="855">JobID</stringValue>
<type>VARIABLE</type>
</item>
<item id="856" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="857">messageType</name>
<stringValue id="858">Message</stringValue>
<type>VARIABLE</type>
<variablePart id="859">properties.messageType</variablePart>
</item>
<item id="860" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="861">recordNumber</name>
<stringValue id="862">Message</stringValue>
<type>VARIABLE</type>
<variablePart id="863">properties.jobIndex</variablePart>
</item>
<item id="864" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="865">transactionId</name>
<stringValue id="866">TRID</stringValue>
<type>VARIABLE</type>
</item>
<item id="867" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="868">vreqOID</name>
<stringValue id="869">Message</stringValue>
<type>VARIABLE</type>
<variablePart id="870">properties.custom["OID"]</variablePart>
</item>
</parameters>
<sources id="871" type="java.util.HashSet">
<item idref="843" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="872" type="java.util.HashSet">
<item id="873" type="com.j2fe.workflow.definition.Transition">
<name id="874">goto-next</name>
<source idref="845"/>
<target id="875">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="876"/>
<directJoin>false</directJoin>
<name id="877">Create Message</name>
<nodeHandler>com.j2fe.feeds.activities.CreateMessage</nodeHandler>
<nodeHandlerClass id="878">com.j2fe.feeds.activities.CreateMessage</nodeHandlerClass>
<parameters id="879" type="java.util.HashSet">
<item id="880" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="881">intputMessage</name>
<stringValue id="882">Message</stringValue>
<type>VARIABLE</type>
<variablePart id="883">message</variablePart>
</item>
<item id="884" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="885">message</name>
<stringValue id="886">internalMessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="887" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="888">messageType</name>
<stringValue id="889">Message</stringValue>
<type>VARIABLE</type>
<variablePart id="890">properties.messageType</variablePart>
</item>
<item id="891" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="892">transactionId</name>
<stringValue id="893">TRID</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="894" type="java.util.HashSet">
<item idref="873" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="895" type="java.util.HashSet">
<item id="896" type="com.j2fe.workflow.definition.Transition">
<name id="897">goto-next</name>
<source idref="875"/>
<target id="898">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="899"/>
<directJoin>false</directJoin>
<name id="900">Merge Maps</name>
<nodeHandler>com.j2fe.translation.activities.MergeMaps</nodeHandler>
<nodeHandlerClass id="901">com.j2fe.translation.activities.MergeMaps</nodeHandlerClass>
<parameters id="902" type="java.util.HashSet">
<item id="903" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="904">inputMap</name>
<stringValue id="905">MessageMetaData</stringValue>
<type>VARIABLE</type>
</item>
<item id="906" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="907">outputMap</name>
<stringValue id="908">internalMessage</stringValue>
<type>VARIABLE</type>
<variablePart id="909">properties.custom</variablePart>
</item>
</parameters>
<sources id="910" type="java.util.HashSet">
<item idref="896" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="911" type="java.util.HashSet">
<item id="912" type="com.j2fe.workflow.definition.Transition">
<name id="913">goto-next</name>
<source idref="898"/>
<target id="914">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="915"/>
<directJoin>false</directJoin>
<name id="916">Store Vendor Data?</name>
<nodeHandler>com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandler>
<nodeHandlerClass id="917">com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandlerClass>
<parameters id="918" type="java.util.HashSet">
<item id="919" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="920">caseItem</name>
<stringValue id="921">internalMessage</stringValue>
<type>VARIABLE</type>
<variablePart id="922">properties.custom["SaveVendorDataType"]</variablePart>
</item>
<item id="923" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="924">defaultItem</name>
<stringValue id="925">default</stringValue>
<type>CONSTANT</type>
</item>
<item id="926" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="927">nullTransition</name>
<stringValue id="928">default</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="929" type="java.util.HashSet">
<item idref="912" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="930" type="java.util.HashSet">
<item id="931" type="com.j2fe.workflow.definition.Transition">
<name id="932">All</name>
<source idref="914"/>
<target id="933">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="934">Automatically generated</description>
<directJoin>false</directJoin>
<name id="935">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="936">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="937" type="java.util.HashSet">
<item idref="931" type="com.j2fe.workflow.definition.Transition"/>
<item id="938" type="com.j2fe.workflow.definition.Transition">
<name id="939">Staging</name>
<source idref="914"/>
<target idref="933"/>
</item>
</sources>
<targets id="940" type="java.util.HashSet">
<item id="941" type="com.j2fe.workflow.definition.Transition">
<name id="942">ToSplit</name>
<source idref="933"/>
<target id="943">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="944"/>
<directJoin>false</directJoin>
<name id="945">Bean Shell Script (Standard)</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="946">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="947" type="java.util.HashSet">
<item id="948" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="949">statements</name>
<stringValue id="950">import com.j2fe.transport.Message;

Message[] transformToStageMessage = {internalMessage};</stringValue>
<type>CONSTANT</type>
</item>
<item id="951" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="952">variables["internalMessage"]</name>
<stringValue id="953">internalMessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="954" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="955">variables["transformToStageMessage"]</name>
<stringValue id="956">transformToStageMessages</stringValue>
<type>VARIABLE</type>
<variablePart id="957"/>
</item>
</parameters>
<sources id="958" type="java.util.HashSet">
<item idref="941" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="959" type="java.util.HashSet">
<item id="960" type="com.j2fe.workflow.definition.Transition">
<name id="961">goto-next</name>
<source idref="943"/>
<target id="962">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="963"/>
<directJoin>false</directJoin>
<name id="964">Transform to Stage Record</name>
<nodeHandler>com.thegoldensource.staging.activity.TransformMessageToStageRecord</nodeHandler>
<nodeHandlerClass id="965">com.thegoldensource.staging.activity.TransformMessageToStageRecord</nodeHandlerClass>
<parameters id="966" type="java.util.HashSet">
<item id="967" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="968">factory</name>
<stringValue id="969">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="970" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="971">messages</name>
<stringValue id="972">transformToStageMessages</stringValue>
<type>VARIABLE</type>
</item>
<item id="973" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="974">oids</name>
<stringValue id="975">GeneratedOIDsforeachmessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="976" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="977">stageRecords</name>
<stringValue id="978">StageRecords</stringValue>
<type>VARIABLE</type>
</item>
<item id="979" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="980">structuredMessages</name>
<stringValue id="981">StructuredMessages</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="982" type="java.util.HashSet">
<item idref="960" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="983" type="java.util.HashSet">
<item id="984" type="com.j2fe.workflow.definition.Transition">
<name id="985">found Entities</name>
<source idref="962"/>
<target id="986">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="987"/>
<directJoin>false</directJoin>
<name id="988">Write Staged Record to Database </name>
<nodeHandler>com.thegoldensource.staging.activity.WriteStagedRecordToDatabase</nodeHandler>
<nodeHandlerClass id="989">com.thegoldensource.staging.activity.WriteStagedRecordToDatabase</nodeHandlerClass>
<parameters id="990" type="java.util.HashSet">
<item id="991" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="992">dataSource</name>
<stringValue id="993">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="994" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="995">extractorFactory</name>
<stringValue id="996">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="997" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="998">stageRecords</name>
<stringValue id="999">StageRecords</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="1000" type="java.util.HashSet">
<item idref="984" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1001" type="java.util.HashSet">
<item id="1002" type="com.j2fe.workflow.definition.Transition">
<name id="1003">goto-next</name>
<source idref="986"/>
<target id="1004">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="1005">Automatically generated</description>
<directJoin>false</directJoin>
<name id="1006">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="1007">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="1008" type="java.util.HashSet">
<item id="1009" type="com.j2fe.workflow.definition.Transition">
<name id="1010">default</name>
<source idref="914"/>
<target idref="1004"/>
</item>
<item idref="1002" type="com.j2fe.workflow.definition.Transition"/>
<item id="1011" type="com.j2fe.workflow.definition.Transition">
<name id="1012">no Entities</name>
<source idref="962"/>
<target idref="1004"/>
</item>
</sources>
<targets id="1013" type="java.util.HashSet">
<item id="1014" type="com.j2fe.workflow.definition.Transition">
<name id="1015">ToSplit</name>
<source idref="1004"/>
<target id="1016">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="1017"/>
<directJoin>false</directJoin>
<name id="1018">Translate Message</name>
<nodeHandler>com.j2fe.translation.activities.Translation</nodeHandler>
<nodeHandlerClass id="1019">com.j2fe.translation.activities.Translation</nodeHandlerClass>
<parameters id="1020" type="java.util.HashSet">
<item id="1021" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1022">MSFDBSelect</name>
<stringValue id="1023">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="1024" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1025">input</name>
<stringValue id="1026">Message</stringValue>
<type>VARIABLE</type>
<variablePart id="1027">message</variablePart>
</item>
<item id="1028" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1029">messageType</name>
<stringValue id="1030">Message</stringValue>
<type>VARIABLE</type>
<variablePart id="1031">properties.messageType</variablePart>
</item>
<item id="1032" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1033">metaData</name>
<stringValue id="1034">internalMessage</stringValue>
<type>VARIABLE</type>
<variablePart id="1035">properties.custom</variablePart>
</item>
<item id="1036" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="1037">output</name>
<stringValue id="1038">PublishingTranslatedOutput</stringValue>
<type>VARIABLE</type>
</item>
<item id="1039" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="1040">plainOutput</name>
<stringValue id="1041">Translated</stringValue>
<type>VARIABLE</type>
</item>
<item id="1042" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1043">transactionId</name>
<stringValue id="1044">TRID</stringValue>
<type>VARIABLE</type>
</item>
<item id="1045" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="1046">translatedTimestamp</name>
<stringValue id="1047">TranslatedTimestamp</stringValue>
<type>VARIABLE</type>
</item>
<item id="1048" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1049">wantedOutputType</name>
<stringValue id="1050">Binary</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1051" type="java.util.HashSet">
<item idref="1014" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1052" type="java.util.HashSet">
<item id="1053" type="com.j2fe.workflow.definition.Transition">
<name id="1054">empty</name>
<source idref="1016"/>
<target id="1055">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="1056"/>
<directJoin>false</directJoin>
<name id="1057">Store Vendor Data?</name>
<nodeHandler>com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandler>
<nodeHandlerClass id="1058">com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandlerClass>
<parameters id="1059" type="java.util.HashSet">
<item id="1060" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1061">caseItem</name>
<stringValue id="1062">internalMessage</stringValue>
<type>VARIABLE</type>
<variablePart id="1063">properties.custom["SaveVendorDataType"]</variablePart>
</item>
<item id="1064" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1065">defaultItem</name>
<stringValue id="1066">None</stringValue>
<type>CONSTANT</type>
</item>
<item id="1067" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1068">nullTransition</name>
<stringValue id="1069">None</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1070" type="java.util.HashSet">
<item idref="1053" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1071" type="java.util.HashSet">
<item id="1072" type="com.j2fe.workflow.definition.Transition">
<name id="1073">All</name>
<source idref="1055"/>
<target id="1074">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="1075">Automatically generated</description>
<directJoin>false</directJoin>
<name id="1076">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="1077">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="1078" type="java.util.HashSet">
<item idref="1072" type="com.j2fe.workflow.definition.Transition"/>
<item id="1079" type="com.j2fe.workflow.definition.Transition">
<name id="1080">InputMessage</name>
<source idref="1055"/>
<target idref="1074"/>
</item>
<item id="1081" type="com.j2fe.workflow.definition.Transition">
<name id="1082">Staging</name>
<source idref="1055"/>
<target idref="1074"/>
</item>
<item id="1083" type="com.j2fe.workflow.definition.Transition">
<name id="1084">StructuredMessage</name>
<source idref="1055"/>
<target idref="1074"/>
</item>
</sources>
<targets id="1085" type="java.util.HashSet">
<item id="1086" type="com.j2fe.workflow.definition.Transition">
<name id="1087">goto-next</name>
<source idref="1074"/>
<target id="1088">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="1089"/>
<directJoin>false</directJoin>
<name id="1090">Store Vendor Data</name>
<nodeHandler>com.j2fe.general.activities.database.StoreVendorData</nodeHandler>
<nodeHandlerClass id="1091">com.j2fe.general.activities.database.StoreVendorData</nodeHandlerClass>
<parameters id="1092" type="java.util.HashSet">
<item id="1093" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1094">database</name>
<stringValue id="1095">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="1096" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1097">inputMessage</name>
<stringValue id="1098">Message</stringValue>
<type>VARIABLE</type>
<variablePart id="1099">message</variablePart>
</item>
<item id="1100" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1101">messageType</name>
<stringValue id="1102">Message</stringValue>
<type>VARIABLE</type>
<variablePart id="1103">properties.messageType</variablePart>
</item>
<item id="1104" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="1105">stageRecord</name>
<stringValue id="1106">StageRecord</stringValue>
<type>VARIABLE</type>
</item>
<item id="1107" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1108">trnId</name>
<stringValue id="1109">TRID</stringValue>
<type>VARIABLE</type>
</item>
<item id="1110" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="1111">trnId</name>
<stringValue id="1112">TransactionId</stringValue>
<type>VARIABLE</type>
</item>
<item id="1113" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1114">vfsdOid</name>
<stringValue id="1115">Message</stringValue>
<type>VARIABLE</type>
<variablePart id="1116">properties.custom["VendorFeedStageId"]</variablePart>
</item>
</parameters>
<sources id="1117" type="java.util.HashSet">
<item idref="1086" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1118" type="java.util.HashSet">
<item id="1119" type="com.j2fe.workflow.definition.Transition">
<name id="1120">insert</name>
<source idref="1088"/>
<target id="1121">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="1122">Automatically generated</description>
<directJoin>false</directJoin>
<name id="1123">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="1124">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="1125" type="java.util.HashSet">
<item idref="1119" type="com.j2fe.workflow.definition.Transition"/>
<item id="1126" type="com.j2fe.workflow.definition.Transition">
<name id="1127">insert-staging-elasticsearch</name>
<source idref="1088"/>
<target idref="1121"/>
</item>
<item id="1128" type="com.j2fe.workflow.definition.Transition">
<name id="1129">no-action</name>
<source idref="1088"/>
<target idref="1121"/>
</item>
<item id="1130" type="com.j2fe.workflow.definition.Transition">
<name id="1131">update</name>
<source idref="1088"/>
<target idref="1121"/>
</item>
</sources>
<targets id="1132" type="java.util.HashSet">
<item id="1133" type="com.j2fe.workflow.definition.Transition">
<name id="1134">goto-next</name>
<source idref="1121"/>
<target id="1135">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="1136"/>
<directJoin>false</directJoin>
<name id="1137">Close Transaction</name>
<nodeHandler>com.j2fe.streetlamp.activities.CloseTransaction</nodeHandler>
<nodeHandlerClass id="1138">com.j2fe.streetlamp.activities.CloseTransaction</nodeHandlerClass>
<parameters id="1139" type="java.util.HashSet">
<item id="1140" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1141">filtered</name>
<stringValue id="1142">false</stringValue>
<type>CONSTANT</type>
</item>
<item id="1143" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1144">formattedMessages</name>
<stringValue id="1145">Translated</stringValue>
<type>VARIABLE</type>
</item>
<item id="1146" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="1147">maxSeverity</name>
<stringValue id="1148">Severity</stringValue>
<type>VARIABLE</type>
</item>
<item id="1149" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1150">messageType</name>
<stringValue id="1151">Message</stringValue>
<type>VARIABLE</type>
<variablePart id="1152">properties.messageType</variablePart>
</item>
<item id="1153" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1154">submittedMessage</name>
<stringValue id="1155">Message</stringValue>
<type>VARIABLE</type>
<variablePart id="1156">message</variablePart>
</item>
<item id="1157" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1158">transactionId</name>
<stringValue id="1159">TRID</stringValue>
<type>VARIABLE</type>
</item>
<item id="1160" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1161">transactionMetaData</name>
<stringValue id="1162">PublishingTranslatedOutput</stringValue>
<type>VARIABLE</type>
<variablePart id="1163">metaData</variablePart>
</item>
<item id="1164" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1165">translatedTimestamp</name>
<stringValue id="1166">TranslatedTimestamp</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="1167" type="java.util.HashSet">
<item id="1168" type="com.j2fe.workflow.definition.Transition">
<name id="1169">50</name>
<source id="1170">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="1171"/>
<directJoin>false</directJoin>
<name id="1172">Is Fatal ?</name>
<nodeHandler>com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandler>
<nodeHandlerClass id="1173">com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandlerClass>
<parameters id="1174" type="java.util.HashSet">
<item id="1175" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1176">caseItem</name>
<stringValue id="1177">Severity</stringValue>
<type>VARIABLE</type>
</item>
<item id="1178" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1179">defaultItem</name>
<stringValue id="1180">10</stringValue>
<type>CONSTANT</type>
</item>
<item id="1181" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1182">nullTransition</name>
<stringValue id="1183">10</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1184" type="java.util.HashSet">
<item id="1185" type="com.j2fe.workflow.definition.Transition">
<name id="1186">ToSplit</name>
<source id="1187">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="1188">Automatically generated</description>
<directJoin>false</directJoin>
<name id="1189">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="1190">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="1191" type="java.util.HashSet">
<item id="1192" type="com.j2fe.workflow.definition.Transition">
<name id="1193">None</name>
<source id="1194">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="1195"/>
<directJoin>false</directJoin>
<name id="1196">Store Vendor Data?</name>
<nodeHandler>com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandler>
<nodeHandlerClass id="1197">com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandlerClass>
<parameters id="1198" type="java.util.HashSet">
<item id="1199" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1200">caseItem</name>
<stringValue id="1201">internalMessage</stringValue>
<type>VARIABLE</type>
<variablePart id="1202">properties.custom["SaveVendorDataType"]</variablePart>
</item>
<item id="1203" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1204">defaultItem</name>
<stringValue id="1205">None</stringValue>
<type>CONSTANT</type>
</item>
<item id="1206" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1207">nullTransition</name>
<stringValue id="1208">None</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1209" type="java.util.HashSet">
<item id="1210" type="com.j2fe.workflow.definition.Transition">
<name id="1211">ToSplit</name>
<source id="1212">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="1213">Automatically generated</description>
<directJoin>false</directJoin>
<name id="1214">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="1215">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="1216" type="java.util.HashSet">
<item id="1217" type="com.j2fe.workflow.definition.Transition">
<name id="1218">ToSplit</name>
<source id="1219">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="1220">Automatically generated</description>
<directJoin>false</directJoin>
<name id="1221">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="1222">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="1223" type="java.util.HashSet">
<item id="1224" type="com.j2fe.workflow.definition.Transition">
<name id="1225">error</name>
<source id="1226">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="1227"/>
<directJoin>false</directJoin>
<name id="1228">Process Message</name>
<nodeHandler>com.j2fe.tp.activities.ProcessTransaction</nodeHandler>
<nodeHandlerClass id="1229">com.j2fe.tp.activities.ProcessTransaction</nodeHandlerClass>
<parameters id="1230" type="java.util.HashSet">
<item id="1231" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1232">engineResource</name>
<stringValue id="1233">PrimaryGCEngine</stringValue>
<type>VARIABLE</type>
</item>
<item id="1234" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1235">inputFromTranslation</name>
<stringValue id="1236">PublishingTranslatedOutput</stringValue>
<type>VARIABLE</type>
</item>
<item id="1237" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1238">messageMetaData</name>
<stringValue id="1239">internalMessage</stringValue>
<type>VARIABLE</type>
<variablePart id="1240">properties.custom</variablePart>
</item>
<item id="1241" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1242">messageType</name>
<stringValue id="1243">Message</stringValue>
<type>VARIABLE</type>
<variablePart id="1244">properties.messageType</variablePart>
</item>
<item id="1245" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="1246">processed</name>
<stringValue id="1247">Processed</stringValue>
<type>VARIABLE</type>
</item>
<item id="1248" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="1249">processedEntityInfo</name>
<stringValue id="1250">ProcessedEntityInformations</stringValue>
<type>VARIABLE</type>
</item>
<item id="1251" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="1252">severity</name>
<stringValue id="1253">Severity</stringValue>
<type>VARIABLE</type>
</item>
<item id="1254" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1255">transactionId</name>
<stringValue id="1256">TRID</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="1257" type="java.util.HashSet">
<item id="1258" type="com.j2fe.workflow.definition.Transition">
<name id="1259">ToSplit</name>
<source id="1260">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="1261">Automatically generated</description>
<directJoin>false</directJoin>
<name id="1262">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="1263">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="1264" type="java.util.HashSet">
<item id="1265" type="com.j2fe.workflow.definition.Transition">
<name id="1266">false</name>
<source id="1267">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="1268"/>
<directJoin>false</directJoin>
<name id="1269">Filter Message?</name>
<nodeHandler>com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandler>
<nodeHandlerClass id="1270">com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandlerClass>
<parameters id="1271" type="java.util.HashSet">
<item id="1272" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1273">caseItem</name>
<stringValue id="1274">PublishingTranslatedOutput</stringValue>
<type>VARIABLE</type>
<variablePart id="1275">filteredFromGSDM</variablePart>
</item>
<item id="1276" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1277">defaultItem</name>
<stringValue id="1278">false</stringValue>
<type>CONSTANT</type>
</item>
<item id="1279" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1280">nullTransition</name>
<stringValue id="1281">false</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1282" type="java.util.HashSet">
<item id="1283" type="com.j2fe.workflow.definition.Transition">
<name id="1284">not-empty</name>
<source idref="1016"/>
<target idref="1267"/>
</item>
</sources>
<targets id="1285" type="java.util.HashSet">
<item idref="1265" type="com.j2fe.workflow.definition.Transition"/>
<item id="1286" type="com.j2fe.workflow.definition.Transition">
<name id="1287">true</name>
<source idref="1267"/>
<target id="1288">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="1289"/>
<directJoin>false</directJoin>
<name id="1290">Override Filter?</name>
<nodeHandler>com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandler>
<nodeHandlerClass id="1291">com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandlerClass>
<parameters id="1292" type="java.util.HashSet">
<item id="1293" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1294">caseItem</name>
<stringValue id="1295">ProcessFilteredMessages</stringValue>
<type>VARIABLE</type>
</item>
<item id="1296" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1297">defaultItem</name>
<stringValue id="1298">false</stringValue>
<type>CONSTANT</type>
</item>
<item id="1299" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1300">nullTransition</name>
<stringValue id="1301">false</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1302" type="java.util.HashSet">
<item idref="1286" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1303" type="java.util.HashSet">
<item id="1304" type="com.j2fe.workflow.definition.Transition">
<name id="1305">false</name>
<source idref="1288"/>
<target id="1306">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="1307"/>
<directJoin>false</directJoin>
<name id="1308">Close Filtered Transaction</name>
<nodeHandler>com.j2fe.streetlamp.activities.CloseTransaction</nodeHandler>
<nodeHandlerClass id="1309">com.j2fe.streetlamp.activities.CloseTransaction</nodeHandlerClass>
<parameters id="1310" type="java.util.HashSet">
<item id="1311" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1312">filtered</name>
<stringValue id="1313">true</stringValue>
<type>CONSTANT</type>
</item>
<item id="1314" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1315">formattedMessages</name>
<stringValue id="1316">Translated</stringValue>
<type>VARIABLE</type>
</item>
<item id="1317" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="1318">maxSeverity</name>
<stringValue id="1319">Severity</stringValue>
<type>VARIABLE</type>
</item>
<item id="1320" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1321">messageType</name>
<stringValue id="1322">Message</stringValue>
<type>VARIABLE</type>
<variablePart id="1323">properties.messageType</variablePart>
</item>
<item id="1324" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1325">submittedMessage</name>
<stringValue id="1326">Message</stringValue>
<type>VARIABLE</type>
<variablePart id="1327">message</variablePart>
</item>
<item id="1328" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1329">transactionId</name>
<stringValue id="1330">TRID</stringValue>
<type>VARIABLE</type>
</item>
<item id="1331" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1332">transactionMetaData</name>
<stringValue id="1333">PublishingTranslatedOutput</stringValue>
<type>VARIABLE</type>
<variablePart id="1334">metaData</variablePart>
</item>
<item id="1335" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1336">translatedTimestamp</name>
<stringValue id="1337">TranslatedTimestamp</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="1338" type="java.util.HashSet">
<item idref="1304" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1339" type="java.util.HashSet">
<item id="1340" type="com.j2fe.workflow.definition.Transition">
<name id="1341">goto-next</name>
<source idref="1306"/>
<target idref="1212"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item id="1342" type="com.j2fe.workflow.definition.Transition">
<name id="1343">true</name>
<source idref="1288"/>
<target idref="1260"/>
</item>
</targets>
<type>XORSPLIT</type>
</target>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="1260"/>
</item>
<item idref="1342" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1344" type="java.util.HashSet">
<item idref="1258" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="1226"/>
</item>
</sources>
<targets id="1345" type="java.util.HashSet">
<item idref="1224" type="com.j2fe.workflow.definition.Transition"/>
<item id="1346" type="com.j2fe.workflow.definition.Transition">
<name id="1347">fatal</name>
<source idref="1226"/>
<target idref="1219"/>
</item>
<item id="1348" type="com.j2fe.workflow.definition.Transition">
<name id="1349">success</name>
<source idref="1226"/>
<target idref="1219"/>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="1219"/>
</item>
<item idref="1346" type="com.j2fe.workflow.definition.Transition"/>
<item idref="1348" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1350" type="java.util.HashSet">
<item idref="1217" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="1212"/>
</item>
<item idref="1340" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1351" type="java.util.HashSet">
<item idref="1210" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="1194"/>
</item>
</sources>
<targets id="1352" type="java.util.HashSet">
<item id="1353" type="com.j2fe.workflow.definition.Transition">
<name id="1354">All</name>
<source idref="1194"/>
<target id="1355">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="1356">Automatically generated</description>
<directJoin>false</directJoin>
<name id="1357">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="1358">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="1359" type="java.util.HashSet">
<item idref="1353" type="com.j2fe.workflow.definition.Transition"/>
<item id="1360" type="com.j2fe.workflow.definition.Transition">
<name id="1361">InputMessage</name>
<source idref="1194"/>
<target idref="1355"/>
</item>
<item id="1362" type="com.j2fe.workflow.definition.Transition">
<name id="1363">Staging</name>
<source idref="1194"/>
<target idref="1355"/>
</item>
<item id="1364" type="com.j2fe.workflow.definition.Transition">
<name id="1365">StructuredMessage</name>
<source idref="1194"/>
<target idref="1355"/>
</item>
</sources>
<targets id="1366" type="java.util.HashSet">
<item id="1367" type="com.j2fe.workflow.definition.Transition">
<name id="1368">goto-next</name>
<source idref="1355"/>
<target id="1369">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="1370"/>
<directJoin>false</directJoin>
<name id="1371">Filter from VDS?</name>
<nodeHandler>com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandler>
<nodeHandlerClass id="1372">com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandlerClass>
<parameters id="1373" type="java.util.HashSet">
<item id="1374" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1375">caseItem</name>
<stringValue id="1376">PublishingTranslatedOutput</stringValue>
<type>VARIABLE</type>
<variablePart id="1377">filteredFromVDS</variablePart>
</item>
<item id="1378" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1379">defaultItem</name>
<stringValue id="1380">false</stringValue>
<type>CONSTANT</type>
</item>
<item id="1381" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1382">nullTransition</name>
<stringValue id="1383">false</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1384" type="java.util.HashSet">
<item idref="1367" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1385" type="java.util.HashSet">
<item id="1386" type="com.j2fe.workflow.definition.Transition">
<name id="1387">false</name>
<source idref="1369"/>
<target id="1388">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="1389"/>
<directJoin>false</directJoin>
<name id="1390">Store Vendor Data</name>
<nodeHandler>com.j2fe.general.activities.database.StoreVendorData</nodeHandler>
<nodeHandlerClass id="1391">com.j2fe.general.activities.database.StoreVendorData</nodeHandlerClass>
<parameters id="1392" type="java.util.HashSet">
<item id="1393" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1394">database</name>
<stringValue id="1395">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="1396" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1397">inputMessage</name>
<stringValue id="1398">Message</stringValue>
<type>VARIABLE</type>
<variablePart id="1399">message</variablePart>
</item>
<item id="1400" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1401">messageType</name>
<stringValue id="1402">Message</stringValue>
<type>VARIABLE</type>
<variablePart id="1403">properties.messageType</variablePart>
</item>
<item id="1404" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1405">recordIdentifier</name>
<stringValue id="1406">PublishingTranslatedOutput</stringValue>
<type>VARIABLE</type>
<variablePart id="1407">vendorRecordId</variablePart>
</item>
<item id="1408" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="1409">stageRecord</name>
<stringValue id="1410">StageRecord</stringValue>
<type>VARIABLE</type>
<variablePart id="1411"/>
</item>
<item id="1412" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1413">structuredMessage</name>
<stringValue id="1414">PublishingTranslatedOutput</stringValue>
<type>VARIABLE</type>
<variablePart id="1415">structuredMessage</variablePart>
</item>
<item id="1416" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1417">trnId</name>
<stringValue id="1418">TRID</stringValue>
<type>VARIABLE</type>
</item>
<item id="1419" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="1420">trnId</name>
<stringValue id="1421">TransactionId</stringValue>
<type>VARIABLE</type>
</item>
<item id="1422" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1423">vfsdOid</name>
<stringValue id="1424">Message</stringValue>
<type>VARIABLE</type>
<variablePart id="1425">properties.custom["VendorFeedStageId"]</variablePart>
</item>
</parameters>
<sources id="1426" type="java.util.HashSet">
<item idref="1386" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1427" type="java.util.HashSet">
<item id="1428" type="com.j2fe.workflow.definition.Transition">
<name id="1429">insert</name>
<source idref="1388"/>
<target id="1430">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="1431">Automatically generated</description>
<directJoin>false</directJoin>
<name id="1432">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="1433">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="1434" type="java.util.HashSet">
<item idref="1428" type="com.j2fe.workflow.definition.Transition"/>
<item id="1435" type="com.j2fe.workflow.definition.Transition">
<name id="1436">insert-staging-elasticsearch</name>
<source idref="1388"/>
<target idref="1430"/>
</item>
<item id="1437" type="com.j2fe.workflow.definition.Transition">
<name id="1438">no-action</name>
<source idref="1388"/>
<target idref="1430"/>
</item>
<item id="1439" type="com.j2fe.workflow.definition.Transition">
<name id="1440">update</name>
<source idref="1388"/>
<target idref="1430"/>
</item>
</sources>
<targets id="1441" type="java.util.HashSet">
<item id="1442" type="com.j2fe.workflow.definition.Transition">
<name id="1443">ToSplit</name>
<source idref="1430"/>
<target idref="1187"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item idref="1435" type="com.j2fe.workflow.definition.Transition"/>
<item idref="1437" type="com.j2fe.workflow.definition.Transition"/>
<item idref="1439" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</target>
</item>
<item id="1444" type="com.j2fe.workflow.definition.Transition">
<name id="1445">true</name>
<source idref="1369"/>
<target id="1446">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="1447"/>
<directJoin>false</directJoin>
<name id="1448">Update Transaction</name>
<nodeHandler>com.j2fe.streetlamp.activities.UpdateTransaction</nodeHandler>
<nodeHandlerClass id="1449">com.j2fe.streetlamp.activities.UpdateTransaction</nodeHandlerClass>
<parameters id="1450" type="java.util.HashSet">
<item id="1451" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1452">colName</name>
<stringValue id="1453">TRN_USR_STAT_TYP</stringValue>
<type>CONSTANT</type>
</item>
<item id="1454" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1455">colValue</name>
<stringValue id="1456">FILTERED</stringValue>
<type>CONSTANT</type>
</item>
<item id="1457" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1458">transactionId</name>
<stringValue id="1459">transactionId</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="1460" type="java.util.HashSet">
<item idref="1444" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1461" type="java.util.HashSet">
<item id="1462" type="com.j2fe.workflow.definition.Transition">
<name id="1463">false</name>
<source idref="1446"/>
<target idref="1187"/>
</item>
<item id="1464" type="com.j2fe.workflow.definition.Transition">
<name id="1465">true</name>
<source idref="1446"/>
<target idref="1187"/>
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
<item idref="1360" type="com.j2fe.workflow.definition.Transition"/>
<item idref="1192" type="com.j2fe.workflow.definition.Transition"/>
<item idref="1362" type="com.j2fe.workflow.definition.Transition"/>
<item idref="1364" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="1187"/>
</item>
<item idref="1442" type="com.j2fe.workflow.definition.Transition"/>
<item idref="1462" type="com.j2fe.workflow.definition.Transition"/>
<item idref="1464" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1466" type="java.util.HashSet">
<item idref="1185" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="1170"/>
</item>
</sources>
<targets id="1467" type="java.util.HashSet">
<item id="1468" type="com.j2fe.workflow.definition.Transition">
<name id="1469">10</name>
<source idref="1170"/>
<target id="1470">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="1471"/>
<directJoin>false</directJoin>
<name id="1472">Check VDDB Forwarding</name>
<nodeHandler>com.j2fe.general.activities.database.CheckVDDBForwarding</nodeHandler>
<nodeHandlerClass id="1473">com.j2fe.general.activities.database.CheckVDDBForwarding</nodeHandlerClass>
<parameters id="1474" type="java.util.HashSet">
<item id="1475" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1476">messageType</name>
<stringValue id="1477">Message</stringValue>
<type>VARIABLE</type>
<variablePart id="1478">properties.messageType</variablePart>
</item>
</parameters>
<sources id="1479" type="java.util.HashSet">
<item idref="1468" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1480" type="java.util.HashSet">
<item id="1481" type="com.j2fe.workflow.definition.Transition">
<name id="1482">false</name>
<source idref="1470"/>
<target idref="1135"/>
</item>
<item id="1483" type="com.j2fe.workflow.definition.Transition">
<name id="1484">true</name>
<source idref="1470"/>
<target id="1485">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="1486"/>
<directJoin>false</directJoin>
<name id="1487">Process VDDB Message</name>
<nodeHandler>com.j2fe.tp.activities.ProcessTransaction</nodeHandler>
<nodeHandlerClass id="1488">com.j2fe.tp.activities.ProcessTransaction</nodeHandlerClass>
<parameters id="1489" type="java.util.HashSet">
<item id="1490" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1491">engineResource</name>
<stringValue id="1492">PrimaryVDDBEngine</stringValue>
<type>VARIABLE</type>
</item>
<item id="1493" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1494">input</name>
<stringValue id="1495">Translated</stringValue>
<type>VARIABLE</type>
</item>
<item id="1496" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1497">inputFromTranslation</name>
<stringValue id="1498">PublishingTranslatedOutput</stringValue>
<type>VARIABLE</type>
</item>
<item id="1499" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1500">messageMetaData</name>
<stringValue id="1501">internalMessage</stringValue>
<type>VARIABLE</type>
<variablePart id="1502">properties.custom</variablePart>
</item>
<item id="1503" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1504">messageType</name>
<stringValue id="1505">Message</stringValue>
<type>VARIABLE</type>
<variablePart id="1506">properties.messageType</variablePart>
</item>
<item id="1507" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="1508">severity</name>
<stringValue id="1509">VDDBSeverity</stringValue>
<type>VARIABLE</type>
</item>
<item id="1510" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1511">transactionId</name>
<stringValue id="1512">TRID</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="1513" type="java.util.HashSet">
<item idref="1483" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1514" type="java.util.HashSet">
<item id="1515" type="com.j2fe.workflow.definition.Transition">
<name id="1516">error</name>
<source idref="1485"/>
<target id="1517">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="1518">Automatically generated</description>
<directJoin>false</directJoin>
<name id="1519">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="1520">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="1521" type="java.util.HashSet">
<item idref="1515" type="com.j2fe.workflow.definition.Transition"/>
<item id="1522" type="com.j2fe.workflow.definition.Transition">
<name id="1523">success</name>
<source idref="1485"/>
<target idref="1517"/>
</item>
</sources>
<targets id="1524" type="java.util.HashSet">
<item id="1525" type="com.j2fe.workflow.definition.Transition">
<name id="1526">ToSplit</name>
<source idref="1517"/>
<target id="1527">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="1528"/>
<directJoin>false</directJoin>
<name id="1529">Don't write ALIDs for Workstation messages</name>
<nodeHandler>com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandler>
<nodeHandlerClass id="1530">com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandlerClass>
<parameters id="1531" type="java.util.HashSet">
<item id="1532" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1533">caseItem</name>
<stringValue id="1534">Message</stringValue>
<type>VARIABLE</type>
<variablePart id="1535">properties.messageType</variablePart>
</item>
</parameters>
<sources id="1536" type="java.util.HashSet">
<item idref="1525" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1537" type="java.util.HashSet">
<item id="1538" type="com.j2fe.workflow.definition.Transition">
<name id="1539">REAL</name>
<source idref="1527"/>
<target idref="1135"/>
</item>
<item id="1540" type="com.j2fe.workflow.definition.Transition">
<name id="1541">SD</name>
<source idref="1527"/>
<target idref="1135"/>
</item>
<item id="1542" type="com.j2fe.workflow.definition.Transition">
<name id="1543">default</name>
<source idref="1527"/>
<target id="1544">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="1545"/>
<directJoin>false</directJoin>
<name id="1546">Write Alternate IDs</name>
<nodeHandler>com.j2fe.tp.activities.WriteAlternateIds</nodeHandler>
<nodeHandlerClass id="1547">com.j2fe.tp.activities.WriteAlternateIds</nodeHandlerClass>
<parameters id="1548" type="java.util.HashSet">
<item id="1549" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1550">GSDM</name>
<stringValue id="1551">jdbc/VDDB-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="1552" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1553">transactionId</name>
<stringValue id="1554">TRID</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="1555" type="java.util.HashSet">
<item idref="1542" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1556" type="java.util.HashSet">
<item id="1557" type="com.j2fe.workflow.definition.Transition">
<name id="1558">goto-next</name>
<source idref="1544"/>
<target idref="1135"/>
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
<type>ACTIVITY</type>
</target>
</item>
<item id="1559" type="com.j2fe.workflow.definition.Transition">
<name id="1560">fatal</name>
<source idref="1485"/>
<target idref="1135"/>
</item>
<item idref="1522" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</target>
</item>
</targets>
<type>XORSPLIT</type>
</target>
</item>
<item idref="1168" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="1135"/>
</item>
<item id="1561" type="com.j2fe.workflow.definition.Transition">
<name id="1562">None</name>
<source idref="1055"/>
<target idref="1135"/>
</item>
<item idref="1538" type="com.j2fe.workflow.definition.Transition"/>
<item idref="1540" type="com.j2fe.workflow.definition.Transition"/>
<item idref="1481" type="com.j2fe.workflow.definition.Transition"/>
<item idref="1559" type="com.j2fe.workflow.definition.Transition"/>
<item idref="1133" type="com.j2fe.workflow.definition.Transition"/>
<item idref="1557" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1563" type="java.util.HashSet">
<item id="1564" type="com.j2fe.workflow.definition.Transition">
<name id="1565">goto-next</name>
<source idref="1135"/>
<target id="1566">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="1567">Automatically generated</description>
<directJoin>false</directJoin>
<name id="1568">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="1569">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="1570" type="java.util.HashSet">
<item idref="1564" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1571" type="java.util.HashSet">
<item id="1572" type="com.j2fe.workflow.definition.Transition">
<name id="1573">goto-next</name>
<source idref="1566"/>
<target id="1574">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="1575"/>
<directJoin>false</directJoin>
<name id="1576">Trigger Publishing Events #2</name>
<nodeHandler>com.j2fe.tp.activities.TriggerPublishing</nodeHandler>
<nodeHandlerClass id="1577">com.j2fe.tp.activities.TriggerPublishing</nodeHandlerClass>
<parameters id="1578" type="java.util.HashSet">
<item id="1579" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1580">inputMessage</name>
<stringValue id="1581">Message</stringValue>
<type>VARIABLE</type>
<variablePart id="1582">message</variablePart>
</item>
<item id="1583" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1584">internalPublishingEvent</name>
<stringValue id="1585">InternalMessagePublishingEvent</stringValue>
<type>CONSTANT</type>
</item>
<item id="1586" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1587">messageType</name>
<stringValue id="1588">Message</stringValue>
<type>VARIABLE</type>
<variablePart id="1589">properties.messageType</variablePart>
</item>
<item id="1590" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1591">processedMessages</name>
<stringValue id="1592">Processed</stringValue>
<type>VARIABLE</type>
</item>
<item id="1593" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1594">severity</name>
<stringValue id="1595">Severity</stringValue>
<type>VARIABLE</type>
</item>
<item id="1596" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1597">transactionId</name>
<stringValue id="1598">TRID</stringValue>
<type>VARIABLE</type>
</item>
<item id="1599" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1600">translatedMessages</name>
<stringValue id="1601">PublishingTranslatedOutput</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="1602" type="java.util.HashSet">
<item idref="1572" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1603" type="java.util.HashSet">
<item id="1604" type="com.j2fe.workflow.definition.Transition">
<name id="1605">goto-next</name>
<source idref="1574"/>
<target id="1606">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="1607"/>
<directJoin>false</directJoin>
<name id="1608">Check Processing Status</name>
<nodeHandler>com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandler>
<nodeHandlerClass id="1609">com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandlerClass>
<parameters id="1610" type="java.util.HashSet">
<item id="1611" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1612">caseItem</name>
<stringValue id="1613">Severity</stringValue>
<type>VARIABLE</type>
</item>
<item id="1614" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1615">defaultItem</name>
<stringValue id="1616">success</stringValue>
<type>CONSTANT</type>
</item>
<item id="1617" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1618">nullTransition</name>
<stringValue id="1619">success</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1620" type="java.util.HashSet">
<item idref="1604" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1621" type="java.util.HashSet">
<item id="1622" type="com.j2fe.workflow.definition.Transition">
<name id="1623">40</name>
<source idref="1606"/>
<target id="1624">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="1625">Automatically generated</description>
<directJoin>false</directJoin>
<name id="1626">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="1627">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="1628" type="java.util.HashSet">
<item idref="1622" type="com.j2fe.workflow.definition.Transition"/>
<item id="1629" type="com.j2fe.workflow.definition.Transition">
<name id="1630">success</name>
<source idref="1606"/>
<target idref="1624"/>
</item>
</sources>
<targets id="1631" type="java.util.HashSet">
<item id="1632" type="com.j2fe.workflow.definition.Transition">
<name id="1633">ToSplit</name>
<source idref="1624"/>
<target id="1634">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="1635"/>
<directJoin>false</directJoin>
<name id="1636">Database Select (Xor Split)</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="1637">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="1638" type="java.util.HashSet">
<item id="1639" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1640">database</name>
<stringValue id="1641">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="1642" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="1643">firstColumnsResult</name>
<stringValue id="1644">SourceIDs</stringValue>
<type>VARIABLE</type>
</item>
<item id="1645" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1646">querySQL</name>
<stringValue id="1647">SELECT SOURCE_ID FROM FT_T_CPDF</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1648" type="java.util.HashSet">
<item idref="1632" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1649" type="java.util.HashSet">
<item id="1650" type="com.j2fe.workflow.definition.Transition">
<name id="1651">nothing-found</name>
<source idref="1634"/>
<target id="1652">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="1653"/>
<directJoin>false</directJoin>
<name id="1654">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="1655">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="1656" type="java.util.HashSet">
<item id="1657" type="com.j2fe.workflow.definition.Transition">
<name id="1658">end-loop</name>
<source id="1659">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="1660"/>
<directJoin>false</directJoin>
<name id="1661">For Loop</name>
<nodeHandler>com.j2fe.workflow.handler.impl.ForEach</nodeHandler>
<nodeHandlerClass id="1662">com.j2fe.workflow.handler.impl.ForEach</nodeHandlerClass>
<parameters id="1663" type="java.util.HashSet">
<item id="1664" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1665">counter</name>
<stringValue id="1666">universeLoopCounter</stringValue>
<type>VARIABLE</type>
</item>
<item id="1667" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="1668">counter</name>
<stringValue id="1669">universeLoopCounter</stringValue>
<type>VARIABLE</type>
</item>
<item id="1670" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1671">input</name>
<stringValue id="1672">universeArray</stringValue>
<type>VARIABLE</type>
</item>
<item id="1673" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="1674">output</name>
<stringValue id="1675">UniverseSingle</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="1676" type="java.util.HashSet">
<item id="1677" type="com.j2fe.workflow.definition.Transition">
<name id="1678">ToSplit</name>
<source id="1679">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="1680">Automatically generated</description>
<directJoin>false</directJoin>
<name id="1681">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="1682">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="1683" type="java.util.HashSet">
<item id="1684" type="com.j2fe.workflow.definition.Transition">
<name id="1685">goto-next</name>
<source id="1686">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="1687"/>
<directJoin>false</directJoin>
<name id="1688">Bean Shell Script (Standard) #2</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="1689">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="1690" type="java.util.HashSet">
<item id="1691" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1692">statements</name>
<stringValue id="1693">String[] universeArray = null;

universeArray=universe.split("\\,");
int universeLoopCounter = 0;</stringValue>
<type>CONSTANT</type>
</item>
<item id="1694" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="1695">["universe"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="1696">variables["universe"]</name>
<stringValue id="1697">RequestParameters</stringValue>
<type>VARIABLE</type>
<variablePart id="1698">["Universe"]</variablePart>
</item>
<item id="1699" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="1700">variables["universeArray"]</name>
<stringValue id="1701">universeArray</stringValue>
<type>VARIABLE</type>
</item>
<item id="1702" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="1703">["universeLoopCounter"]@java/lang/Integer@</UITypeHint>
<input>false</input>
<name id="1704">variables["universeLoopCounter"]</name>
<stringValue id="1705">universeLoopCounter</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="1706" type="java.util.HashSet">
<item id="1707" type="com.j2fe.workflow.definition.Transition">
<name id="1708">true</name>
<source id="1709">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="1710"/>
<directJoin>false</directJoin>
<name id="1711">Universe Available?</name>
<nodeHandler>com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandler>
<nodeHandlerClass id="1712">com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandlerClass>
<parameters id="1713" type="java.util.HashSet">
<item id="1714" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1715">caseItem</name>
<stringValue id="1716">RequestParameters</stringValue>
<type>VARIABLE</type>
<variablePart id="1717">["Universe"]</variablePart>
</item>
<item id="1718" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1719">defaultItem</name>
<stringValue id="1720">true</stringValue>
<type>CONSTANT</type>
</item>
<item id="1721" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1722">nullTransition</name>
<stringValue id="1723">false</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1724" type="java.util.HashSet">
<item id="1725" type="com.j2fe.workflow.definition.Transition">
<name id="1726">goto-next</name>
<source id="1727">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="1728"/>
<directJoin>false</directJoin>
<name id="1729">Load Vendor Request</name>
<nodeHandler>com.j2fe.feeds.request.LoadRequestType</nodeHandler>
<nodeHandlerClass id="1730">com.j2fe.feeds.request.LoadRequestType</nodeHandlerClass>
<parameters id="1731" type="java.util.HashSet">
<item id="1732" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="1733">context</name>
<stringValue id="1734">IDContextType</stringValue>
<type>VARIABLE</type>
</item>
<item id="1735" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="1736">dataSource</name>
<stringValue id="1737">Vendor</stringValue>
<type>VARIABLE</type>
</item>
<item id="1738" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="1739">identifier</name>
<stringValue id="1740">Identifier</stringValue>
<type>VARIABLE</type>
</item>
<item id="1741" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1742">requestOID</name>
<stringValue id="1743">Message</stringValue>
<type>VARIABLE</type>
<variablePart id="1744">properties.custom["OID"]</variablePart>
</item>
<item id="1745" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="1746">requestParameters</name>
<stringValue id="1747">RequestParameters</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="1748" type="java.util.HashSet">
<item id="1749" type="com.j2fe.workflow.definition.Transition">
<name id="1750">rows-found</name>
<source idref="1634"/>
<target idref="1727"/>
</item>
</sources>
<targets id="1751" type="java.util.HashSet">
<item idref="1725" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="1709"/>
</item>
</sources>
<targets id="1752" type="java.util.HashSet">
<item id="1753" type="com.j2fe.workflow.definition.Transition">
<name id="1754">false</name>
<source idref="1709"/>
<target idref="1652"/>
</item>
<item idref="1707" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="1686"/>
</item>
</sources>
<targets id="1755" type="java.util.HashSet">
<item idref="1684" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="1679"/>
</item>
<item id="1756" type="com.j2fe.workflow.definition.Transition">
<name id="1757">goto-next</name>
<source id="1758">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="1759"/>
<directJoin>false</directJoin>
<name id="1760">Trigger Publishing Events</name>
<nodeHandler>com.j2fe.tp.activities.TriggerPublishing</nodeHandler>
<nodeHandlerClass id="1761">com.j2fe.tp.activities.TriggerPublishing</nodeHandlerClass>
<parameters id="1762" type="java.util.HashSet">
<item id="1763" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1764">inputMessage</name>
<stringValue id="1765">UniverseMessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="1766" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1767">internalPublishingEvent</name>
<stringValue id="1768">InternalMessagePublishingEvent</stringValue>
<type>CONSTANT</type>
</item>
<item id="1769" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1770">messageType</name>
<stringValue id="1771">Universe Maintenance</stringValue>
<type>CONSTANT</type>
</item>
<item id="1772" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1773">processedMessages</name>
<stringValue id="1774">ProcessedUniverse</stringValue>
<type>VARIABLE</type>
</item>
<item id="1775" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1776">severity</name>
<stringValue id="1777">SeverityUniverse</stringValue>
<type>VARIABLE</type>
</item>
<item id="1778" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1779">transactionId</name>
<stringValue id="1780">TransactionID</stringValue>
<type>VARIABLE</type>
</item>
<item id="1781" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1782">translatedMessages</name>
<stringValue id="1783">PublishingTranslatedOutputUniverse</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="1784" type="java.util.HashSet">
<item id="1785" type="com.j2fe.workflow.definition.Transition">
<name id="1786">goto-next</name>
<source id="1787">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="1788"/>
<directJoin>false</directJoin>
<name id="1789">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="1790">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="1791" type="java.util.HashSet">
<item id="1792" type="com.j2fe.workflow.definition.Transition">
<name id="1793">goto-next</name>
<source id="1794">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="1795"/>
<directJoin>false</directJoin>
<name id="1796">Close Filtered Transaction</name>
<nodeHandler>com.j2fe.streetlamp.activities.CloseTransaction</nodeHandler>
<nodeHandlerClass id="1797">com.j2fe.streetlamp.activities.CloseTransaction</nodeHandlerClass>
<parameters id="1798" type="java.util.HashSet">
<item id="1799" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1800">filtered</name>
<stringValue id="1801">true</stringValue>
<type>CONSTANT</type>
</item>
<item id="1802" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1803">formattedMessages</name>
<stringValue id="1804">TranslatedUniverse</stringValue>
<type>VARIABLE</type>
</item>
<item id="1805" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="1806">maxSeverity</name>
<stringValue id="1807">SeverityUniverse</stringValue>
<type>VARIABLE</type>
</item>
<item id="1808" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1809">messageType</name>
<stringValue id="1810">Universe Maintenance</stringValue>
<type>CONSTANT</type>
</item>
<item id="1811" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1812">submittedMessage</name>
<stringValue id="1813">UniverseMessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="1814" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1815">transactionId</name>
<stringValue id="1816">TransactionID</stringValue>
<type>VARIABLE</type>
</item>
<item id="1817" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1818">transactionMetaData</name>
<stringValue id="1819">PublishingTranslatedOutputUniverse</stringValue>
<type>VARIABLE</type>
</item>
<item id="1820" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1821">translatedTimestamp</name>
<stringValue id="1822">TranslatedTimestampUniverse</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="1823" type="java.util.HashSet">
<item id="1824" type="com.j2fe.workflow.definition.Transition">
<name id="1825">true</name>
<source id="1826">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="1827"/>
<directJoin>false</directJoin>
<name id="1828">Fliter Message?</name>
<nodeHandler>com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandler>
<nodeHandlerClass id="1829">com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandlerClass>
<parameters id="1830" type="java.util.HashSet">
<item id="1831" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1832">caseItem</name>
<stringValue id="1833">PublishingTranslatedOutputUniverse</stringValue>
<type>VARIABLE</type>
<variablePart id="1834">filteredFromGSDM</variablePart>
</item>
<item id="1835" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1836">defaultItem</name>
<stringValue id="1837">false</stringValue>
<type>CONSTANT</type>
</item>
<item id="1838" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1839">nullTransition</name>
<stringValue id="1840">false</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1841" type="java.util.HashSet">
<item id="1842" type="com.j2fe.workflow.definition.Transition">
<name id="1843">not-empty</name>
<source id="1844">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="1845"/>
<directJoin>false</directJoin>
<name id="1846">Translate Message</name>
<nodeHandler>com.j2fe.translation.activities.Translation</nodeHandler>
<nodeHandlerClass id="1847">com.j2fe.translation.activities.Translation</nodeHandlerClass>
<parameters id="1848" type="java.util.HashSet">
<item id="1849" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1850">MSFDBSelect</name>
<stringValue id="1851">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="1852" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1853">input</name>
<stringValue id="1854">UniverseMessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="1855" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1856">messageType</name>
<stringValue id="1857">Universe Maintenance</stringValue>
<type>CONSTANT</type>
</item>
<item id="1858" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="1859">output</name>
<stringValue id="1860">PublishingTranslatedOutputUniverse</stringValue>
<type>VARIABLE</type>
</item>
<item id="1861" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="1862">plainOutput</name>
<stringValue id="1863">TranslatedUniverse</stringValue>
<type>VARIABLE</type>
</item>
<item id="1864" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1865">transactionId</name>
<stringValue id="1866">TransactionID</stringValue>
<type>VARIABLE</type>
</item>
<item id="1867" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="1868">translatedTimestamp</name>
<stringValue id="1869">TranslatedTimestampUniverse</stringValue>
<type>VARIABLE</type>
</item>
<item id="1870" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1871">wantedOutputType</name>
<stringValue id="1872">Binary</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1873" type="java.util.HashSet">
<item id="1874" type="com.j2fe.workflow.definition.Transition">
<name id="1875">goto-next</name>
<source id="1876">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="1877"/>
<directJoin>false</directJoin>
<name id="1878">Create Transaction</name>
<nodeHandler>com.j2fe.streetlamp.activities.CreateTransaction</nodeHandler>
<nodeHandlerClass id="1879">com.j2fe.streetlamp.activities.CreateTransaction</nodeHandlerClass>
<parameters id="1880" type="java.util.HashSet">
<item id="1881" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1882">correlationId</name>
<stringValue id="1883">TRID</stringValue>
<type>VARIABLE</type>
</item>
<item id="1884" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1885">jobId</name>
<stringValue id="1886">JobID</stringValue>
<type>VARIABLE</type>
</item>
<item id="1887" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1888">messageType</name>
<stringValue id="1889">Universe Maintenance</stringValue>
<type>CONSTANT</type>
</item>
<item id="1890" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1891">recordNumber</name>
<stringValue id="1892">Message</stringValue>
<type>VARIABLE</type>
<variablePart id="1893">properties.jobIndex</variablePart>
</item>
<item id="1894" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="1895">transactionId</name>
<stringValue id="1896">TransactionID</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="1897" type="java.util.HashSet">
<item id="1898" type="com.j2fe.workflow.definition.Transition">
<name id="1899">goto-next</name>
<source id="1900">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="1901"/>
<directJoin>false</directJoin>
<name id="1902">Create Universe Maintenance Message</name>
<nodeHandler>com.j2fe.feeds.su.CreateUniverseMaintenanceMessage</nodeHandler>
<nodeHandlerClass id="1903">com.j2fe.feeds.su.CreateUniverseMaintenanceMessage</nodeHandlerClass>
<parameters id="1904" type="java.util.HashSet">
<item id="1905" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1906">instrumentIDs</name>
<stringValue id="1907">InstumentIDs</stringValue>
<type>VARIABLE</type>
</item>
<item id="1908" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="1909">message</name>
<stringValue id="1910">UniverseMessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="1911" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1912">purposeType</name>
<stringValue id="1913">REQUEST</stringValue>
<type>CONSTANT</type>
</item>
<item id="1914" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1915">universeID</name>
<stringValue id="1916">UniverseSingle</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="1917" type="java.util.HashSet">
<item id="1918" type="com.j2fe.workflow.definition.Transition">
<name id="1919">rows-found</name>
<source id="1920">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="1921"/>
<directJoin>false</directJoin>
<name id="1922">Get InstrumentIDs</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="1923">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="1924" type="java.util.HashSet">
<item id="1925" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1926">database</name>
<stringValue id="1927">jdbc/ExceptionManagement</stringValue>
<type>REFERENCE</type>
</item>
<item id="1928" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="1929">firstColumnsResult</name>
<stringValue id="1930">InstumentIDs</stringValue>
<type>VARIABLE</type>
</item>
<item id="1931" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="1932">[0]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="1933">indexedParameters[0]</name>
<stringValue id="1934">TRID</stringValue>
<type>VARIABLE</type>
</item>
<item id="1935" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="1936">[1]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="1937">indexedParameters[1]</name>
<stringValue id="1938">SourceIDs</stringValue>
<type>VARIABLE</type>
<variablePart id="1939">[0]</variablePart>
</item>
<item id="1940" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1941">querySQL</name>
<stringValue id="1942">SELECT XREF_TBL_ROW_OID FROM FT_T_MSGP WHERE XREF_TBL_TYP = 'ISSU' and TRN_ID = ? AND SOURCE_ID = ?</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1943" type="java.util.HashSet">
<item id="1944" type="com.j2fe.workflow.definition.Transition">
<name id="1945">loop</name>
<source idref="1659"/>
<target idref="1920"/>
</item>
</sources>
<targets id="1946" type="java.util.HashSet">
<item id="1947" type="com.j2fe.workflow.definition.Transition">
<name id="1948">nothing-found</name>
<source idref="1920"/>
<target idref="1652"/>
</item>
<item idref="1918" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="1900"/>
</item>
</sources>
<targets id="1949" type="java.util.HashSet">
<item idref="1898" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="1876"/>
</item>
</sources>
<targets id="1950" type="java.util.HashSet">
<item idref="1874" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="1844"/>
</item>
</sources>
<targets id="1951" type="java.util.HashSet">
<item id="1952" type="com.j2fe.workflow.definition.Transition">
<name id="1953">empty</name>
<source idref="1844"/>
<target id="1954">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="1955"/>
<directJoin>false</directJoin>
<name id="1956">Close Transaction</name>
<nodeHandler>com.j2fe.streetlamp.activities.CloseTransaction</nodeHandler>
<nodeHandlerClass id="1957">com.j2fe.streetlamp.activities.CloseTransaction</nodeHandlerClass>
<parameters id="1958" type="java.util.HashSet">
<item id="1959" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1960">filtered</name>
<stringValue id="1961">false</stringValue>
<type>CONSTANT</type>
</item>
<item id="1962" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1963">formattedMessages</name>
<stringValue id="1964">TranslatedUniverse</stringValue>
<type>VARIABLE</type>
</item>
<item id="1965" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="1966">maxSeverity</name>
<stringValue id="1967">SeverityUniverse</stringValue>
<type>VARIABLE</type>
</item>
<item id="1968" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1969">messageType</name>
<stringValue id="1970">Universe Maintenance</stringValue>
<type>CONSTANT</type>
</item>
<item id="1971" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1972">submittedMessage</name>
<stringValue id="1973">UniverseMessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="1974" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1975">transactionId</name>
<stringValue id="1976">TransactionID</stringValue>
<type>VARIABLE</type>
</item>
<item id="1977" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1978">transactionMetaData</name>
<stringValue id="1979">PublishingTranslatedOutputUniverse</stringValue>
<type>VARIABLE</type>
<variablePart id="1980">metaData</variablePart>
</item>
<item id="1981" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1982">translatedTimestamp</name>
<stringValue id="1983">TranslatedTimestampUniverse</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="1984" type="java.util.HashSet">
<item idref="1952" type="com.j2fe.workflow.definition.Transition"/>
<item id="1985" type="com.j2fe.workflow.definition.Transition">
<name id="1986">goto-next</name>
<source id="1987">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="1988"/>
<directJoin>false</directJoin>
<name id="1989">Process Message</name>
<nodeHandler>com.j2fe.tp.activities.ProcessTransaction</nodeHandler>
<nodeHandlerClass id="1990">com.j2fe.tp.activities.ProcessTransaction</nodeHandlerClass>
<parameters id="1991" type="java.util.HashSet">
<item id="1992" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1993">engineResource</name>
<stringValue id="1994">PrimaryGCEngine</stringValue>
<type>VARIABLE</type>
</item>
<item id="1995" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1996">inputFromTranslation</name>
<stringValue id="1997">PublishingTranslatedOutputUniverse</stringValue>
<type>VARIABLE</type>
</item>
<item id="1998" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1999">messageType</name>
<stringValue id="2000">Universe Maintenance</stringValue>
<type>CONSTANT</type>
</item>
<item id="2001" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="2002">processed</name>
<stringValue id="2003">ProcessedUniverse</stringValue>
<type>VARIABLE</type>
</item>
<item id="2004" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="2005">transactionId</name>
<stringValue id="2006">TransactionID</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="2007" type="java.util.HashSet">
<item id="2008" type="com.j2fe.workflow.definition.Transition">
<name id="2009">false</name>
<source idref="1826"/>
<target idref="1987"/>
</item>
</sources>
<targets id="2010" type="java.util.HashSet">
<item idref="1985" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="1954"/>
</item>
</sources>
<targets id="2011" type="java.util.HashSet">
<item id="2012" type="com.j2fe.workflow.definition.Transition">
<name id="2013">goto-next</name>
<source idref="1954"/>
<target idref="1787"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item idref="1842" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="1826"/>
</item>
</sources>
<targets id="2014" type="java.util.HashSet">
<item idref="2008" type="com.j2fe.workflow.definition.Transition"/>
<item idref="1824" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="1794"/>
</item>
</sources>
<targets id="2015" type="java.util.HashSet">
<item idref="1792" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="1787"/>
</item>
<item idref="2012" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="2016" type="java.util.HashSet">
<item idref="1785" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="1758"/>
</item>
</sources>
<targets id="2017" type="java.util.HashSet">
<item idref="1756" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="1679"/>
</item>
</sources>
<targets id="2018" type="java.util.HashSet">
<item idref="1677" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="1659"/>
</item>
</sources>
<targets id="2019" type="java.util.HashSet">
<item idref="1657" type="com.j2fe.workflow.definition.Transition"/>
<item idref="1944" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="1652"/>
</item>
<item idref="1753" type="com.j2fe.workflow.definition.Transition"/>
<item idref="1650" type="com.j2fe.workflow.definition.Transition"/>
<item idref="1947" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="2020" type="java.util.HashSet">
<item id="2021" type="com.j2fe.workflow.definition.Transition">
<name id="2022">goto-next</name>
<source idref="1652"/>
<target id="2023">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="2024"/>
<directJoin>false</directJoin>
<name id="2025">Status -&gt; CLOSED</name>
<nodeHandler>com.j2fe.feeds.request.UpdateVREQ</nodeHandler>
<nodeHandlerClass id="2026">com.j2fe.feeds.request.UpdateVREQ</nodeHandlerClass>
<parameters id="2027" type="java.util.HashSet">
<item id="2028" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="2029">requestOIDs[0]</name>
<stringValue id="2030">Message</stringValue>
<type>VARIABLE</type>
<variablePart id="2031">properties.custom["OID"]</variablePart>
</item>
<item id="2032" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="2033">status</name>
<stringValue id="2034">CLOSED</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="2035" type="java.util.HashSet">
<item idref="2021" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="2036" type="java.util.HashSet">
<item id="2037" type="com.j2fe.workflow.definition.Transition">
<name id="2038">goto-next</name>
<source idref="2023"/>
<target id="2039">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="2040"/>
<directJoin>true</directJoin>
<name id="2041">Synchronize</name>
<nodeHandler>com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandler>
<nodeHandlerClass id="2042">com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandlerClass>
<sources id="2043" type="java.util.HashSet">
<item id="2044" type="com.j2fe.workflow.definition.Transition">
<name id="2045">goto-next</name>
<source id="2046">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="2047"/>
<directJoin>false</directJoin>
<name id="2048">Report Error</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="2049">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="2050" type="java.util.HashSet">
<item id="2051" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="2052">["ApplicationId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="2053">input["ApplicationId"]</name>
<objectValue id="2054" type="java.lang.String">VENDOR</objectValue>
<type>CONSTANT</type>
</item>
<item id="2055" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="2056">["ErrorText"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="2057">input["ErrorText"]</name>
<objectValue id="2058" type="java.lang.String">Processing messages in the engine failed.</objectValue>
<type>CONSTANT</type>
</item>
<item id="2059" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="2060">["NotificationId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="2061">input["NotificationId"]</name>
<objectValue id="2062" type="java.lang.String">7</objectValue>
<type>CONSTANT</type>
</item>
<item id="2063" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="2064">["PartId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="2065">input["PartId"]</name>
<objectValue id="2066" type="java.lang.String">REQREPLY</objectValue>
<type>CONSTANT</type>
</item>
<item id="2067" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="2068">["Status"]@com/j2fe/connector/RequestStatus@</UITypeHint>
<input>true</input>
<name id="2069">input["Status"]</name>
<objectValue id="2070" type="com.j2fe.connector.RequestStatus">FAILED</objectValue>
<type>CONSTANT</type>
</item>
<item id="2071" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="2072">["TRID"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="2073">input["TRID"]</name>
<stringValue id="2074">TRID</stringValue>
<type>VARIABLE</type>
</item>
<item id="2075" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="2076">["VREQOIDS"]@[Ljava/lang/String;@[0]</UITypeHint>
<input>true</input>
<name id="2077">input["VREQOIDS"][0]</name>
<stringValue id="2078">Message</stringValue>
<type>VARIABLE</type>
<variablePart id="2079">properties.custom["OID"]</variablePart>
</item>
<item id="2080" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="2081">name</name>
<stringValue id="2082">Report Error</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="2083" type="java.util.HashSet">
<item id="2084" type="com.j2fe.workflow.definition.Transition">
<name id="2085">50</name>
<source idref="1606"/>
<target idref="2046"/>
</item>
</sources>
<targets id="2086" type="java.util.HashSet">
<item idref="2044" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="2039"/>
</item>
<item idref="2037" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="2087" type="java.util.HashSet">
<item id="2088" type="com.j2fe.workflow.definition.Transition">
<name id="2089">goto-next</name>
<source idref="2039"/>
<target idref="487"/>
</item>
</targets>
<type>ANDJOIN</type>
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
<item idref="1749" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</target>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item idref="2084" type="com.j2fe.workflow.definition.Transition"/>
<item idref="1629" type="com.j2fe.workflow.definition.Transition"/>
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
<item idref="1126" type="com.j2fe.workflow.definition.Transition"/>
<item idref="1128" type="com.j2fe.workflow.definition.Transition"/>
<item idref="1130" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</target>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item idref="1079" type="com.j2fe.workflow.definition.Transition"/>
<item idref="1561" type="com.j2fe.workflow.definition.Transition"/>
<item idref="1081" type="com.j2fe.workflow.definition.Transition"/>
<item idref="1083" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</target>
</item>
<item idref="1283" type="com.j2fe.workflow.definition.Transition"/>
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
<item idref="1011" type="com.j2fe.workflow.definition.Transition"/>
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
<item idref="938" type="com.j2fe.workflow.definition.Transition"/>
<item idref="1009" type="com.j2fe.workflow.definition.Transition"/>
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
<type>ANDSPLIT</type>
</target>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="494"/>
</item>
</sources>
<targets id="2090" type="java.util.HashSet">
<item idref="492" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="487"/>
</item>
<item idref="2088" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="2091" type="java.util.HashSet">
<item idref="485" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="469"/>
</item>
</sources>
<targets id="2092" type="java.util.HashSet">
<item id="2093" type="com.j2fe.workflow.definition.Transition">
<name id="2094">false</name>
<source idref="469"/>
<target idref="203"/>
</item>
<item idref="467" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="454"/>
</item>
</sources>
<targets id="2095" type="java.util.HashSet">
<item idref="452" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="240"/>
</item>
</sources>
<targets id="2096" type="java.util.HashSet">
<item idref="238" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="217"/>
</item>
</sources>
<targets id="2097" type="java.util.HashSet">
<item idref="215" type="com.j2fe.workflow.definition.Transition"/>
<item idref="392" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="203"/>
</item>
<item idref="2093" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="2098" type="java.util.HashSet">
<item idref="201" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="196"/>
</item>
<item idref="194" type="com.j2fe.workflow.definition.Transition"/>
<item id="2099" type="com.j2fe.workflow.definition.Transition">
<name id="2100">goto-next</name>
<source id="2101">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="2102"/>
<directJoin>false</directJoin>
<name id="2103">Populate PPJB</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="2104">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="2105" type="java.util.HashSet">
<item id="2106" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="2107">database</name>
<stringValue id="2108">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="2109" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="2110">[0]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="2111">indexedParameters[0]</name>
<stringValue id="2112">PricePointEventDefinitionId</stringValue>
<type>VARIABLE</type>
</item>
<item id="2113" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="2114">[1]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="2115">indexedParameters[1]</name>
<stringValue id="2116">JobID</stringValue>
<type>VARIABLE</type>
</item>
<item id="2117" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="2118">querySQL</name>
<stringValue id="2119">DECLARE
PPED_OID_PARAM VARCHAR2(1000);
JOB_ID_PARAM VARCHAR2(1000);
begin
PPED_OID_PARAM:=?;
JOB_ID_PARAM:=?;
IF(PPED_OID_PARAM is not null) then
  Insert into FT_O_PPJB(PPED_OID, JOB_ID) Values (PPED_OID_PARAM, JOB_ID_PARAM);
end if;
end;</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="2120" type="java.util.HashSet">
<item id="2121" type="com.j2fe.workflow.definition.Transition">
<name id="2122">oracle</name>
<source idref="147"/>
<target idref="2101"/>
</item>
</sources>
<targets id="2123" type="java.util.HashSet">
<item idref="2099" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="196"/>
</item>
<item id="2124" type="com.j2fe.workflow.definition.Transition">
<name id="2125">true</name>
<source idref="135"/>
<target idref="196"/>
</item>
</sources>
<targets id="2126" type="java.util.HashSet">
<item idref="569" type="com.j2fe.workflow.definition.Transition"/>
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
<item idref="2121" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</target>
</item>
<item idref="2124" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</target>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="10"/>
</item>
</sources>
<targets id="2127" type="java.util.HashSet">
<item idref="8" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="3"/>
</item>
<item idref="812" type="com.j2fe.workflow.definition.Transition"/>
<item idref="814" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="2128" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="2129">Request Reply/Bloomberg</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="2130">gc_own</lastChangeUser>
<lastUpdate id="2131">2025-10-31T13:51:28.000+0000</lastUpdate>
<name id="2132">BloombergProcessFiles</name>
<nodes id="2133" type="java.util.HashSet">
<item idref="943" type="com.j2fe.workflow.definition.Node"/>
<item idref="1686" type="com.j2fe.workflow.definition.Node"/>
<item idref="76" type="com.j2fe.workflow.definition.Node"/>
<item idref="616" type="com.j2fe.workflow.definition.Node"/>
<item idref="275" type="com.j2fe.workflow.definition.Node"/>
<item idref="10" type="com.j2fe.workflow.definition.Node"/>
<item idref="656" type="com.j2fe.workflow.definition.Node"/>
<item idref="1606" type="com.j2fe.workflow.definition.Node"/>
<item idref="1470" type="com.j2fe.workflow.definition.Node"/>
<item idref="793" type="com.j2fe.workflow.definition.Node"/>
<item idref="702" type="com.j2fe.workflow.definition.Node"/>
<item idref="738" type="com.j2fe.workflow.definition.Node"/>
<item idref="766" type="com.j2fe.workflow.definition.Node"/>
<item idref="1306" type="com.j2fe.workflow.definition.Node"/>
<item idref="1794" type="com.j2fe.workflow.definition.Node"/>
<item idref="725" type="com.j2fe.workflow.definition.Node"/>
<item idref="1954" type="com.j2fe.workflow.definition.Node"/>
<item idref="247" type="com.j2fe.workflow.definition.Node"/>
<item idref="1135" type="com.j2fe.workflow.definition.Node"/>
<item idref="203" type="com.j2fe.workflow.definition.Node"/>
<item idref="504" type="com.j2fe.workflow.definition.Node"/>
<item idref="106" type="com.j2fe.workflow.definition.Node"/>
<item idref="343" type="com.j2fe.workflow.definition.Node"/>
<item idref="875" type="com.j2fe.workflow.definition.Node"/>
<item idref="365" type="com.j2fe.workflow.definition.Node"/>
<item idref="845" type="com.j2fe.workflow.definition.Node"/>
<item idref="1876" type="com.j2fe.workflow.definition.Node"/>
<item idref="1900" type="com.j2fe.workflow.definition.Node"/>
<item idref="1634" type="com.j2fe.workflow.definition.Node"/>
<item idref="1527" type="com.j2fe.workflow.definition.Node"/>
<item idref="3" type="com.j2fe.workflow.definition.Node"/>
<item idref="454" type="com.j2fe.workflow.definition.Node"/>
<item idref="469" type="com.j2fe.workflow.definition.Node"/>
<item idref="543" type="com.j2fe.workflow.definition.Node"/>
<item idref="1267" type="com.j2fe.workflow.definition.Node"/>
<item idref="1369" type="com.j2fe.workflow.definition.Node"/>
<item idref="1826" type="com.j2fe.workflow.definition.Node"/>
<item idref="217" type="com.j2fe.workflow.definition.Node"/>
<item idref="1659" type="com.j2fe.workflow.definition.Node"/>
<item idref="820" type="com.j2fe.workflow.definition.Node"/>
<item idref="1920" type="com.j2fe.workflow.definition.Node"/>
<item idref="592" type="com.j2fe.workflow.definition.Node"/>
<item idref="574" type="com.j2fe.workflow.definition.Node"/>
<item idref="1170" type="com.j2fe.workflow.definition.Node"/>
<item idref="781" type="com.j2fe.workflow.definition.Node"/>
<item idref="1727" type="com.j2fe.workflow.definition.Node"/>
<item idref="487" type="com.j2fe.workflow.definition.Node"/>
<item idref="1566" type="com.j2fe.workflow.definition.Node"/>
<item idref="1212" type="com.j2fe.workflow.definition.Node"/>
<item idref="536" type="com.j2fe.workflow.definition.Node"/>
<item idref="1074" type="com.j2fe.workflow.definition.Node"/>
<item idref="1260" type="com.j2fe.workflow.definition.Node"/>
<item idref="1219" type="com.j2fe.workflow.definition.Node"/>
<item idref="1624" type="com.j2fe.workflow.definition.Node"/>
<item idref="240" type="com.j2fe.workflow.definition.Node"/>
<item idref="1121" type="com.j2fe.workflow.definition.Node"/>
<item idref="1187" type="com.j2fe.workflow.definition.Node"/>
<item idref="1652" type="com.j2fe.workflow.definition.Node"/>
<item idref="1679" type="com.j2fe.workflow.definition.Node"/>
<item idref="1355" type="com.j2fe.workflow.definition.Node"/>
<item idref="494" type="com.j2fe.workflow.definition.Node"/>
<item idref="933" type="com.j2fe.workflow.definition.Node"/>
<item idref="1430" type="com.j2fe.workflow.definition.Node"/>
<item idref="1787" type="com.j2fe.workflow.definition.Node"/>
<item idref="1517" type="com.j2fe.workflow.definition.Node"/>
<item idref="1004" type="com.j2fe.workflow.definition.Node"/>
<item idref="399" type="com.j2fe.workflow.definition.Node"/>
<item idref="898" type="com.j2fe.workflow.definition.Node"/>
<item idref="196" type="com.j2fe.workflow.definition.Node"/>
<item idref="717" type="com.j2fe.workflow.definition.Node"/>
<item idref="45" type="com.j2fe.workflow.definition.Node"/>
<item idref="1288" type="com.j2fe.workflow.definition.Node"/>
<item idref="135" type="com.j2fe.workflow.definition.Node"/>
<item idref="2101" type="com.j2fe.workflow.definition.Node"/>
<item idref="181" type="com.j2fe.workflow.definition.Node"/>
<item idref="1226" type="com.j2fe.workflow.definition.Node"/>
<item idref="1987" type="com.j2fe.workflow.definition.Node"/>
<item idref="1485" type="com.j2fe.workflow.definition.Node"/>
<item idref="2046" type="com.j2fe.workflow.definition.Node"/>
<item idref="2023" type="com.j2fe.workflow.definition.Node"/>
<item idref="1388" type="com.j2fe.workflow.definition.Node"/>
<item idref="411" type="com.j2fe.workflow.definition.Node"/>
<item idref="1088" type="com.j2fe.workflow.definition.Node"/>
<item idref="1055" type="com.j2fe.workflow.definition.Node"/>
<item idref="326" type="com.j2fe.workflow.definition.Node"/>
<item idref="1194" type="com.j2fe.workflow.definition.Node"/>
<item idref="914" type="com.j2fe.workflow.definition.Node"/>
<item idref="2039" type="com.j2fe.workflow.definition.Node"/>
<item idref="962" type="com.j2fe.workflow.definition.Node"/>
<item idref="1844" type="com.j2fe.workflow.definition.Node"/>
<item idref="1016" type="com.j2fe.workflow.definition.Node"/>
<item idref="1758" type="com.j2fe.workflow.definition.Node"/>
<item idref="1574" type="com.j2fe.workflow.definition.Node"/>
<item idref="1709" type="com.j2fe.workflow.definition.Node"/>
<item idref="1446" type="com.j2fe.workflow.definition.Node"/>
<item idref="1544" type="com.j2fe.workflow.definition.Node"/>
<item idref="986" type="com.j2fe.workflow.definition.Node"/>
<item idref="147" type="com.j2fe.workflow.definition.Node"/>
<item idref="668" type="com.j2fe.workflow.definition.Node"/>
<item idref="159" type="com.j2fe.workflow.definition.Node"/>
<item idref="680" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>true</optimize>
<parameter id="2134" type="java.util.HashMap">
<entry>
<key id="2135" type="java.lang.String">AllRequestOIDs</key>
<value id="2136" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="2137">[Ljava.lang.String;</className>
<clazz>[Ljava.lang.String;</clazz>
<description id="2138">The Request OIDs the Request is coping with.</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="2139" type="java.lang.String">BulkSize</key>
<value id="2140" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="2141">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="2142">The BulkSize to use for File Splitting.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="2143" type="java.lang.String">BusinessFeed</key>
<value id="2144" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="2145">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="2146">The BusinessFeed to use to process the file.</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="2147" type="java.lang.String">JobDefinitionId</key>
<value id="2148" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="2149">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="2150">JobDefinitionId from FT_T_JBDF table to pick up job defination.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="2151" type="java.lang.String">MessageMetaData</key>
<value id="2152" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="2153">java.util.Map</className>
<clazz>java.util.Map</clazz>
<description id="2154">MessageMetaData</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="2155" type="java.lang.String">Parent Job Id</key>
<value id="2156" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="2157">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="2158">Parent Job id is used to correlated all the child jobs.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="2159" type="java.lang.String">ParticipantPurposeType</key>
<value id="2160" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="2161">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="2162" type="java.lang.String">PreserveSpacesInBBIdentifier</key>
<value id="2163" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="2164">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<description id="2165">PreserveSpacesInBBIdentifier</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="2166" type="java.lang.String">PricePointEventDefinitionId</key>
<value id="2167" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="2168">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="2169">Price Point Event ID from FT_T_PPEF table to pick up prices for given Price Point.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="2170" type="java.lang.String">PrimaryGCEngine</key>
<value id="2171" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="2172">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="2173"/>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="2174" type="java.lang.String">PrimaryUIEngine</key>
<value id="2175" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="2176">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="2177"/>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="2178" type="java.lang.String">PrimaryVDDBEngine</key>
<value id="2179" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="2180">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="2181"/>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="2182" type="java.lang.String">ProcessFilteredMessages</key>
<value id="2183" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="2184">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<description id="2185">Indicates that messages are processed regardless of the result of the Generic Inbound Filter.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="2186" type="java.lang.String">ReplyFile</key>
<value id="2187" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="2188">java.net.URI</className>
<clazz>java.net.URI</clazz>
<description id="2189">The file to process.</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="2190" type="java.lang.String">RequestTransaction</key>
<value id="2191" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="2192">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="2193">The Parent Transaction created for all the Requests. Used for Error Reporting.</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="2194" type="java.lang.String">VendorRequestString</key>
<value id="2195" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="2196">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="2197">VendorRequestString</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
</parameter>
<permissions id="2198" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>false</purgeAtEnd>
<retries>0</retries>
<startNode idref="106"/>
<status>RELEASED</status>
<variables id="2199" type="java.util.HashMap">
<entry>
<key id="2200" type="java.lang.String">AllRequestOIDs</key>
<value id="2201" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="2202">[Ljava.lang.String;</className>
<clazz>[Ljava.lang.String;</clazz>
<description id="2203">The Request OIDs the Request is coping with.</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="2204" type="java.lang.String">BulkSize</key>
<value id="2205" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="2206">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="2207">The BulkSize to use for File Splitting.</description>
<persistent>false</persistent>
<value id="2208" type="java.lang.Integer">500</value>
</value>
</entry>
<entry>
<key id="2209" type="java.lang.String">BusinessFeed</key>
<value id="2210" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="2211">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="2212">The BusinessFeed to use to process the file.</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="2213" type="java.lang.String">JobDefinitionId</key>
<value id="2214" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="2215">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="2216">JobDefinitionId from FT_T_JBDF table to pick up job defination.</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="2217" type="java.lang.String">JobID</key>
<value id="2218" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="2219">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="2220" type="java.lang.String">MessageMetaData</key>
<value id="2221" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="2222">java.util.Map</className>
<clazz>java.util.Map</clazz>
<description id="2223">MessageMetaData</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="2224" type="java.lang.String">Parent Job Id</key>
<value id="2225" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="2226">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="2227">Parent Job id is used to correlated all the child jobs.</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="2228" type="java.lang.String">ParticipantPurposeType</key>
<value id="2229" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="2230">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="2231" type="java.lang.String">PreserveSpacesInBBIdentifier</key>
<value id="2232" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="2233">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<description id="2234">PreserveSpacesInBBIdentifier</description>
<persistent>false</persistent>
<value id="2235" type="java.lang.Boolean">false</value>
</value>
</entry>
<entry>
<key id="2236" type="java.lang.String">PricePointEventDefinitionId</key>
<value id="2237" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="2238">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="2239">Price Point Event ID from FT_T_PPEF table to pick up prices for given Price Point.</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="2240" type="java.lang.String">PrimaryGCEngine</key>
<value id="2241" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="2242">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="2243"/>
<persistent>false</persistent>
<value id="2244" type="java.lang.String">engine/TPS-1</value>
</value>
</entry>
<entry>
<key id="2245" type="java.lang.String">PrimaryUIEngine</key>
<value id="2246" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="2247">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="2248"/>
<persistent>false</persistent>
<value id="2249" type="java.lang.String">engine/TPS-UI</value>
</value>
</entry>
<entry>
<key id="2250" type="java.lang.String">PrimaryVDDBEngine</key>
<value id="2251" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="2252">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="2253"/>
<persistent>false</persistent>
<value id="2254" type="java.lang.String">engine/TPS-VDDB</value>
</value>
</entry>
<entry>
<key id="2255" type="java.lang.String">ProcessFilteredMessages</key>
<value id="2256" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="2257">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<description id="2258">Indicates that messages are processed regardless of the result of the Generic Inbound Filter.</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="2259" type="java.lang.String">ReplyFile</key>
<value id="2260" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="2261">java.net.URI</className>
<clazz>java.net.URI</clazz>
<description id="2262">The file to process.</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="2263" type="java.lang.String">RequestTransaction</key>
<value id="2264" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="2265">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="2266">The Parent Transaction created for all the Requests. Used for Error Reporting.</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="2267" type="java.lang.String">VendorRequestString</key>
<value id="2268" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="2269">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="2270">VendorRequestString</description>
<persistent>false</persistent>
</value>
</entry>
</variables>
<version>13</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
