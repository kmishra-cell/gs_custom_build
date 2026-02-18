<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.04">
<package-comment/>
<businessobject displayString="26 - V-10 Raise remote event for publishing" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>false</alwaysPersist>
<clustered>true</clustered>
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
<name id="12">FilteredRequestMessage</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="13">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="14" type="java.util.HashSet">
<item id="15" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="16">statements</name>
<stringValue id="17">String filteredRequestMessage=requestMessage;</stringValue>
<type>CONSTANT</type>
</item>
<item id="18" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="19">["filteredRequestMessage"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="20">variables["filteredRequestMessage"]</name>
<stringValue id="21">FilteredRequestMessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="22" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="23">["requestMessage"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="24">variables["requestMessage"]</name>
<stringValue id="25">RequestMessage</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="26" type="java.util.HashSet">
<item id="27" type="com.j2fe.workflow.definition.Transition">
<name id="28">false</name>
<source id="29">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="30"/>
<directJoin>false</directJoin>
<name id="31">Requests?</name>
<nodeHandler>com.j2fe.workflow.handler.impl.XPathXorSplit</nodeHandler>
<nodeHandlerClass id="32">com.j2fe.workflow.handler.impl.XPathXorSplit</nodeHandlerClass>
<parameters id="33" type="java.util.HashSet">
<item id="34" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="35">inputText</name>
<stringValue id="36">RequestMessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="37" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="38">xPath</name>
<stringValue id="39">//Request</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="40" type="java.util.HashSet">
<item id="41" type="com.j2fe.workflow.definition.Transition">
<name id="42">goto-next</name>
<source id="43">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="44"/>
<directJoin>false</directJoin>
<name id="45">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="46">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="47" type="java.util.HashSet"/>
<targets id="48" type="java.util.HashSet">
<item idref="41" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="29"/>
</item>
</sources>
<targets id="49" type="java.util.HashSet">
<item idref="27" type="com.j2fe.workflow.definition.Transition"/>
<item id="50" type="com.j2fe.workflow.definition.Transition">
<name id="51">true</name>
<source idref="29"/>
<target id="52">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="53"/>
<directJoin>false</directJoin>
<name id="54">Get SOI Name</name>
<nodeHandler>com.j2fe.workflow.handler.impl.ExecuteXPath</nodeHandler>
<nodeHandlerClass id="55">com.j2fe.workflow.handler.impl.ExecuteXPath</nodeHandlerClass>
<parameters id="56" type="java.util.HashSet">
<item id="57" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="58">inputText</name>
<stringValue id="59">RequestMessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="60" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="61">outputValue</name>
<stringValue id="62">SOIName</stringValue>
<type>VARIABLE</type>
</item>
<item id="63" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="64">xPath</name>
<stringValue id="65">/VendorRequest/Request[1]/Param[@Key="SOI1"]</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="66" type="java.util.HashSet">
<item idref="50" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="67" type="java.util.HashSet">
<item id="68" type="com.j2fe.workflow.definition.Transition">
<name id="69">goto-next</name>
<source idref="52"/>
<target id="70">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="71"/>
<directJoin>false</directJoin>
<name id="72">Triggered by BBPerSecurity Batch?</name>
<nodeHandler>com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandler>
<nodeHandlerClass id="73">com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandlerClass>
<parameters id="74" type="java.util.HashSet">
<item id="75" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="76">caseInsensitive</name>
<stringValue id="77">true</stringValue>
<type>CONSTANT</type>
</item>
<item id="78" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="79">caseItem</name>
<stringValue id="80">TriggeredByBBPerSecurityBatch</stringValue>
<type>VARIABLE</type>
</item>
<item id="81" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="82">defaultItem</name>
<stringValue id="83">Y</stringValue>
<type>CONSTANT</type>
</item>
<item id="84" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="85">nullTransition</name>
<stringValue id="86">Y</stringValue>
<type>CONSTANT</type>
</item>
<item id="87" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="88">trimSpaces</name>
<stringValue id="89">true</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="90" type="java.util.HashSet">
<item idref="68" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="91" type="java.util.HashSet">
<item id="92" type="com.j2fe.workflow.definition.Transition">
<name id="93">N</name>
<source idref="70"/>
<target id="94">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="95"/>
<directJoin>false</directJoin>
<name id="96">Build RequestData xml</name>
<nodeHandler>com.j2fe.translation.activities.Translation</nodeHandler>
<nodeHandlerClass id="97">com.j2fe.translation.activities.Translation</nodeHandlerClass>
<parameters id="98" type="java.util.HashSet">
<item id="99" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="100">input</name>
<stringValue id="101">RequestMessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="102" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="103">mapping</name>
<stringValue id="104">db://resource/xslt/MHI/mizExtractRequestData.xslt</stringValue>
<type>CONSTANT</type>
</item>
<item id="105" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="106">plainOutput</name>
<stringValue id="107">RequestDataXml</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="108" type="java.util.HashSet">
<item idref="92" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="109" type="java.util.HashSet">
<item id="110" type="com.j2fe.workflow.definition.Transition">
<name id="111">goto-next</name>
<source idref="94"/>
<target id="112">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="113"/>
<directJoin>false</directJoin>
<name id="114">Extract RequestData</name>
<nodeHandler>com.j2fe.workflow.handler.impl.ExecuteXPath</nodeHandler>
<nodeHandlerClass id="115">com.j2fe.workflow.handler.impl.ExecuteXPath</nodeHandlerClass>
<parameters id="116" type="java.util.HashSet">
<item id="117" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="118">inputText</name>
<stringValue id="119">RequestDataXml</stringValue>
<type>VARIABLE</type>
<variablePart id="120">[0]</variablePart>
</item>
<item id="121" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="122">outputValues</name>
<stringValue id="123">RequestDataList</stringValue>
<type>VARIABLE</type>
</item>
<item id="124" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="125">xPath</name>
<stringValue id="126">GetRequestDataXPath</stringValue>
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
<name id="132">BBPerSec - Build RequestData xml</name>
<nodeHandler>com.j2fe.translation.activities.Translation</nodeHandler>
<nodeHandlerClass id="133">com.j2fe.translation.activities.Translation</nodeHandlerClass>
<parameters id="134" type="java.util.HashSet">
<item id="135" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="136">input</name>
<stringValue id="137">RequestMessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="138" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="139">mapping</name>
<stringValue id="140">db://resource/xslt/MHI/mizExtractRequestData_BBPerSec.xslt</stringValue>
<type>CONSTANT</type>
</item>
<item id="141" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="142">plainOutput</name>
<stringValue id="143">RequestDataXml</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="144" type="java.util.HashSet">
<item id="145" type="com.j2fe.workflow.definition.Transition">
<name id="146">Y</name>
<source idref="70"/>
<target idref="130"/>
</item>
</sources>
<targets id="147" type="java.util.HashSet">
<item idref="128" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="112"/>
</item>
<item idref="110" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="148" type="java.util.HashSet">
<item id="149" type="com.j2fe.workflow.definition.Transition">
<name id="150">goto-next</name>
<source idref="112"/>
<target id="151">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="152"/>
<directJoin>false</directJoin>
<name id="153">Get Event JOB ID</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="154">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="155" type="java.util.HashSet">
<item id="156" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="157">database</name>
<stringValue id="158">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="159" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="160">firstColumnsResult[0]</name>
<stringValue id="161">eventJobId</stringValue>
<type>VARIABLE</type>
</item>
<item id="162" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="163">querySQL</name>
<stringValue id="164">SELECT new_oid() FROM dual</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="165" type="java.util.HashSet">
<item idref="149" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="166" type="java.util.HashSet">
<item id="167" type="com.j2fe.workflow.definition.Transition">
<name id="168">goto-next</name>
<source idref="151"/>
<target id="169">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="170"/>
<directJoin>false</directJoin>
<name id="171">Initialize IgnoreIdentifierList</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="172">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="173" type="java.util.HashSet">
<item id="174" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="175">statements</name>
<stringValue id="176">String IgnoreIdentifierList="";</stringValue>
<type>CONSTANT</type>
</item>
<item id="177" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="178">variables["IgnoreIdentifierList"]</name>
<stringValue id="179">IgnoreIdentifierList</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="180" type="java.util.HashSet">
<item idref="167" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="181" type="java.util.HashSet">
<item id="182" type="com.j2fe.workflow.definition.Transition">
<name id="183">goto-next</name>
<source idref="169"/>
<target id="184">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="185"/>
<directJoin>false</directJoin>
<name id="186">merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="187">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="188" type="java.util.HashSet">
<item idref="182" type="com.j2fe.workflow.definition.Transition"/>
<item id="189" type="com.j2fe.workflow.definition.Transition">
<name id="190">goto-next</name>
<source id="191">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="192"/>
<directJoin>false</directJoin>
<name id="193">merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="194">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="195" type="java.util.HashSet">
<item id="196" type="com.j2fe.workflow.definition.Transition">
<name id="197">N</name>
<source id="198">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="199"/>
<directJoin>false</directJoin>
<name id="200">CaptureEventLogs?</name>
<nodeHandler>com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandler>
<nodeHandlerClass id="201">com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandlerClass>
<parameters id="202" type="java.util.HashSet">
<item id="203" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="204">caseInsensitive</name>
<stringValue id="205">true</stringValue>
<type>CONSTANT</type>
</item>
<item id="206" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="207">caseItem</name>
<stringValue id="208">CaptureEventLogs</stringValue>
<type>VARIABLE</type>
</item>
<item id="209" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="210">defaultItem</name>
<stringValue id="211">Y</stringValue>
<type>CONSTANT</type>
</item>
<item id="212" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="213">nullTransition</name>
<stringValue id="214">Y</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="215" type="java.util.HashSet">
<item id="216" type="com.j2fe.workflow.definition.Transition">
<name id="217">nothing-found</name>
<source id="218">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="219"/>
<directJoin>false</directJoin>
<name id="220">Instrument Exists?</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="221">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="222" type="java.util.HashSet">
<item id="223" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="224">database</name>
<stringValue id="225">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="226" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="227">mappedResult</name>
<stringValue id="228">RequestDataMappedResult</stringValue>
<type>VARIABLE</type>
</item>
<item id="229" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="230">querySQL</name>
<stringValue id="231">instrExistsQuery</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="232" type="java.util.HashSet">
<item id="233" type="com.j2fe.workflow.definition.Transition">
<name id="234">goto-next</name>
<source id="235">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="236"/>
<directJoin>false</directJoin>
<name id="237">build Instrument Exists Query</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="238">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="239" type="java.util.HashSet">
<item id="240" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="241">statements</name>
<stringValue id="242">query = "select INSTR_ID ";
query = query + ",(STRING_TO_ARRAY('"+ rqstData +"', ','))[3] AS VND_RQSTR_ID ";
query = query + ",(STRING_TO_ARRAY('"+ rqstData +"', ','))[4] AS GRP_NME ";
query = query + ",(STRING_TO_ARRAY('"+ rqstData +"', ','))[8] AS PARAM_KEY ";
query = query + ", ISS_ID ";
query = query + ",(STRING_TO_ARRAY('"+ rqstData +"', ','))[1] AS ID_CTXT_TYP ";
query = query + "from ft_t_isid isid ";
query = query + "where CASE WHEN isid.id_ctxt_typ = 'BB8CHR' THEN 'TICKER' WHEN isid.id_ctxt_typ = 'BBUNIQUE' THEN 'BB_UNIQUE' WHEN isid.id_ctxt_typ = 'BBGLOBAL' THEN 'BB_GLOBAL' ELSE isid.id_ctxt_typ END = (STRING_TO_ARRAY('"+ rqstData +"', ','))[1] ";
query = query + "and isid.iss_id = (STRING_TO_ARRAY('"+ rqstData +"', ','))[2] ";
query = query + "and isid.end_tms is null "; 
query = query + "and exists (select 1 from ft_t_isgp where instr_id=isid.instr_id and prt_purp_typ in ('BBBACK','INTEREST') and end_tms is null) ";
query = query + "limit 1 ";</stringValue>
<type>CONSTANT</type>
</item>
<item id="243" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="244">variables["query"]</name>
<stringValue id="245">instrExistsQuery</stringValue>
<type>VARIABLE</type>
</item>
<item id="246" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="247">variables["rqstData"]</name>
<stringValue id="248">RequestData</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="249" type="java.util.HashSet">
<item id="250" type="com.j2fe.workflow.definition.Transition">
<name id="251">loop</name>
<source id="252">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="253"/>
<directJoin>false</directJoin>
<name id="254">For Loop</name>
<nodeHandler>com.j2fe.workflow.handler.impl.ForEach</nodeHandler>
<nodeHandlerClass id="255">com.j2fe.workflow.handler.impl.ForEach</nodeHandlerClass>
<parameters id="256" type="java.util.HashSet">
<item id="257" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="258">counter</name>
<stringValue id="259">LoopCounter</stringValue>
<type>VARIABLE</type>
</item>
<item id="260" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="261">counter</name>
<stringValue id="262">LoopCounter</stringValue>
<type>VARIABLE</type>
</item>
<item id="263" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="264">input</name>
<stringValue id="265">RequestDataList</stringValue>
<type>VARIABLE</type>
</item>
<item id="266" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="267">output</name>
<stringValue id="268">RequestData</stringValue>
<type>VARIABLE</type>
</item>
<item id="269" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="270">outputObjects</name>
<stringValue id="271">IncrementedObjects</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="272" type="java.util.HashSet">
<item id="273" type="com.j2fe.workflow.definition.Transition">
<name id="274">goto-next</name>
<source idref="184"/>
<target idref="252"/>
</item>
</sources>
<targets id="275" type="java.util.HashSet">
<item id="276" type="com.j2fe.workflow.definition.Transition">
<name id="277">end-loop</name>
<source idref="252"/>
<target id="278">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="279"/>
<directJoin>false</directJoin>
<name id="280">Build Filtered Request Message</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="281">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="282" type="java.util.HashSet">
<item id="283" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="284">statements</name>
<objectValue id="285" type="java.lang.String">import javax.xml.parsers.DocumentBuilderFactory;&#13;
import javax.xml.parsers.DocumentBuilder;&#13;
import javax.xml.transform.Transformer;&#13;
import javax.xml.transform.TransformerFactory;&#13;
import javax.xml.transform.dom.DOMSource;&#13;
import javax.xml.transform.stream.StreamResult;&#13;
import org.w3c.dom.Document;&#13;
import org.w3c.dom.NodeList;&#13;
import org.w3c.dom.Node;&#13;
import org.w3c.dom.Element;&#13;
import org.xml.sax.InputSource;&#13;
import java.io.StringReader;&#13;
import java.io.StringWriter;&#13;
&#13;
//try {&#13;
	&#13;
		String [] identifierListArray = identifierList.split(",");&#13;
    	&#13;
		DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();&#13;
		DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();	&#13;
		InputSource is = new InputSource(new StringReader(requestMessage));&#13;
		Document doc = dBuilder.parse(is);&#13;
		doc.getDocumentElement().normalize();&#13;
		&#13;
		NodeList nList = doc.getElementsByTagName("Request");&#13;
			&#13;
		for (int i = 0; i &lt; identifierListArray.length; i++) {  &#13;
		&#13;
			for (int j = 0; j &lt; nList.getLength(); j++) {&#13;
&#13;
				Node nNode = nList.item(j);				&#13;
				//System.out.println("\nCurrent Element :" + nNode.getNodeName());&#13;
				Element eElement = (Element) nNode;						&#13;
				//System.out.println("Identifier : " + eElement.getElementsByTagName("Identifier").item(0).getTextContent());&#13;
				//System.out.println("identifierListArray : " + identifierListArray[i]);&#13;
&#13;
				if (eElement.getElementsByTagName("Identifier").item(0).getTextContent().equals(identifierListArray[i])) {&#13;
&#13;
					Node parent = eElement.getParentNode();&#13;
					parent.removeChild(eElement);&#13;
					parent.normalize();					&#13;
					//System.out.println("Identifier Match: " + eElement.getElementsByTagName("Identifier").item(0).getTextContent());&#13;
&#13;
				}&#13;
			}&#13;
		}&#13;
  &#13;
		//doc.getDocumentElement().normalize(); &#13;
		DOMSource domSource = new DOMSource(doc);&#13;
		Transformer transformer = TransformerFactory.newInstance().newTransformer();&#13;
		StringWriter sw = new StringWriter();&#13;
		StreamResult sr = new StreamResult(sw);&#13;
		transformer.transform(domSource, sr);&#13;
		//System.out.println(sw.toString());&#13;
		String filteredRequestMessage = sw.toString();&#13;
&#13;
		BufferedReader reader = new BufferedReader(new StringReader(filteredRequestMessage));&#13;
		StringBuffer result = new StringBuffer();&#13;
	       String line;&#13;
        	while ( (line = reader.readLine() ) != null)&#13;
			result.append(line.trim());&#13;
        	filteredRequestMessage = result.toString();&#13;
  &#13;
//    } catch (Exception e) {&#13;
//		e.printStackTrace();&#13;
//    }</objectValue>
<type>CONSTANT</type>
</item>
<item id="286" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="287">variables["filteredRequestMessage"]</name>
<stringValue id="288">FilteredRequestMessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="289" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="290">variables["identifierList"]</name>
<stringValue id="291">IgnoreIdentifierList</stringValue>
<type>VARIABLE</type>
</item>
<item id="292" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="293">variables["requestMessage"]</name>
<stringValue id="294">RequestMessage</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="295" type="java.util.HashSet">
<item idref="276" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="296" type="java.util.HashSet">
<item id="297" type="com.j2fe.workflow.definition.Transition">
<name id="298">goto-next</name>
<source idref="278"/>
<target id="299">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="300"/>
<directJoin>false</directJoin>
<name id="301">Add To Inventory</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="302">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="303" type="java.util.HashSet">
<item id="304" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="305">["EventJobId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="306">input["EventJobId"]</name>
<stringValue id="307">eventJobId</stringValue>
<type>VARIABLE</type>
</item>
<item id="308" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="309">["OverridePublishingCheck"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="310">input["OverridePublishingCheck"]</name>
<stringValue id="311">OverridePublishingCheck</stringValue>
<type>VARIABLE</type>
</item>
<item id="312" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="313">["PublishAssets"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="314">input["PublishAssets"]</name>
<objectValue id="315" type="java.lang.String">N</objectValue>
<type>CONSTANT</type>
</item>
<item id="316" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="317">["TriggeredByBBPerSecurityBatch"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="318">input["TriggeredByBBPerSecurityBatch"]</name>
<stringValue id="319">TriggeredByBBPerSecurityBatch</stringValue>
<type>VARIABLE</type>
</item>
<item id="320" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="321">["TriggeredByCmfSOIAdditionFilter"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="322">input["TriggeredByCmfSOIAdditionFilter"]</name>
<objectValue id="323" type="java.lang.String">Y</objectValue>
<type>CONSTANT</type>
</item>
<item id="324" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="325">name</name>
<stringValue id="326">AddToInventoryAndPublish</stringValue>
<type>CONSTANT</type>
</item>
<item id="327" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="328">["TransactionIDList"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="329">output["TransactionIDList"]</name>
<stringValue id="330">AddToInventoryTrnIDs</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<persistentVariables id="331" type="java.util.HashSet">
<item id="332" type="java.lang.String">IncrementedObjects
1000</item>
<item id="333" type="java.lang.String">RequestDataList
1000</item>
<item id="334" type="java.lang.String">eventJobId
1000</item>
<item id="335" type="java.lang.String">RequestData
1000</item>
<item id="336" type="java.lang.String">RequestDataXml
1000</item>
<item id="337" type="java.lang.String">AddToInventoryTrnIDs
1000</item>
<item id="338" type="java.lang.String">SOIName
1000</item>
</persistentVariables>
<sources id="339" type="java.util.HashSet">
<item idref="297" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="340" type="java.util.HashSet">
<item id="341" type="com.j2fe.workflow.definition.Transition">
<name id="342">goto-next</name>
<source idref="299"/>
<target id="343">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="344"/>
<directJoin>false</directJoin>
<name id="345">cmfSOIAdditionForUnderlyers</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="346">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="347" type="java.util.HashSet">
<item id="348" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="349">["EventJobID"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="350">input["EventJobID"]</name>
<stringValue id="351">eventJobId</stringValue>
<type>VARIABLE</type>
</item>
<item id="352" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="353">["SOIName"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="354">input["SOIName"]</name>
<stringValue id="355">SOIName</stringValue>
<type>VARIABLE</type>
</item>
<item id="356" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="357">["SoiPurpType"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="358">input["SoiPurpType"]</name>
<stringValue id="359">SoiPurpType</stringValue>
<type>VARIABLE</type>
</item>
<item id="360" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="361">name</name>
<stringValue id="362">cmfSOIAdditionForUnderlyers</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="363" type="java.util.HashSet">
<item idref="341" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="364" type="java.util.HashSet">
<item id="365" type="com.j2fe.workflow.definition.Transition">
<name id="366">goto-next</name>
<source idref="343"/>
<target id="367">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="368"/>
<directJoin>false</directJoin>
<name id="369">Build TRNID Array</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="370">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="371" type="java.util.HashSet">
<item id="372" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="373">statements</name>
<stringValue id="374">String trnIds = csvTrnIDs;
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
<item id="375" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="376">["csvTrnIDs"]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="377">variables["csvTrnIDs"]</name>
<stringValue id="378">AddToInventoryTrnIDs</stringValue>
<type>VARIABLE</type>
</item>
<item id="379" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="380">variables["trnIDArrayIsNull"]</name>
<stringValue id="381">trnIDArrayIsNull</stringValue>
<type>VARIABLE</type>
</item>
<item id="382" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="383">variables["trnIdArray"]</name>
<stringValue id="384">trnIDArray</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="385" type="java.util.HashSet">
<item idref="365" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="386" type="java.util.HashSet">
<item id="387" type="com.j2fe.workflow.definition.Transition">
<name id="388">goto-next</name>
<source idref="367"/>
<target id="389">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="390"/>
<directJoin>false</directJoin>
<name id="391">TRD ID Array is Null?</name>
<nodeHandler>com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandler>
<nodeHandlerClass id="392">com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandlerClass>
<parameters id="393" type="java.util.HashSet">
<item id="394" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="395">caseItem</name>
<stringValue id="396">trnIDArrayIsNull</stringValue>
<type>VARIABLE</type>
</item>
<item id="397" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="398">defaultItem</name>
<stringValue id="399">Y</stringValue>
<type>CONSTANT</type>
</item>
<item id="400" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="401">nullTransition</name>
<stringValue id="402">Y</stringValue>
<type>CONSTANT</type>
</item>
<item id="403" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="404">trimSpaces</name>
<stringValue id="405">true</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="406" type="java.util.HashSet">
<item idref="387" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="407" type="java.util.HashSet">
<item id="408" type="com.j2fe.workflow.definition.Transition">
<name id="409">N</name>
<source idref="389"/>
<target id="410">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="411">Automatically generated</description>
<directJoin>false</directJoin>
<name id="412">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="413">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="414" type="java.util.HashSet">
<item idref="408" type="com.j2fe.workflow.definition.Transition"/>
<item id="415" type="com.j2fe.workflow.definition.Transition">
<name id="416">goto-next</name>
<source id="417">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="418"/>
<directJoin>false</directJoin>
<name id="419">Raise Event Remote #1</name>
<nodeHandler>com.j2fe.event.RaiseEventRemote</nodeHandler>
<nodeHandlerClass id="420">com.j2fe.event.RaiseEventRemote</nodeHandlerClass>
<parameters id="421" type="java.util.HashSet">
<item id="422" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="423">eventName</name>
<stringValue id="424">MizPublishForTxn_Event</stringValue>
<type>CONSTANT</type>
</item>
<item id="425" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="426">["No. Of Parallel Branches"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="427">parameters["No. Of Parallel Branches"]</name>
<objectValue id="428" type="java.lang.Integer">5</objectValue>
<type>CONSTANT</type>
</item>
<item id="429" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="430">["transactionId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="431">parameters["transactionId"]</name>
<stringValue id="432">vTrnID</stringValue>
<type>VARIABLE</type>
</item>
<item id="433" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="434">propertyFileLocation</name>
<stringValue id="435">db://resource/PublishingConfiguration/PublishingConfig.properties</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="436" type="java.util.HashSet">
<item id="437" type="com.j2fe.workflow.definition.Transition">
<name id="438">loop</name>
<source id="439">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="440"/>
<directJoin>false</directJoin>
<name id="441">For Loop</name>
<nodeHandler>com.j2fe.workflow.handler.impl.ForEach</nodeHandler>
<nodeHandlerClass id="442">com.j2fe.workflow.handler.impl.ForEach</nodeHandlerClass>
<parameters id="443" type="java.util.HashSet">
<item id="444" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="445">counter</name>
<stringValue id="446">LoopCounter2</stringValue>
<type>VARIABLE</type>
</item>
<item id="447" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="448">counter</name>
<stringValue id="449">LoopCounter2</stringValue>
<type>VARIABLE</type>
</item>
<item id="450" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="451">input</name>
<stringValue id="452">trnIDArray</stringValue>
<type>VARIABLE</type>
</item>
<item id="453" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="454">output</name>
<stringValue id="455">vTrnID</stringValue>
<type>VARIABLE</type>
</item>
<item id="456" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="457">resetOnEnd</name>
<stringValue id="458">true</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="459" type="java.util.HashSet">
<item id="460" type="com.j2fe.workflow.definition.Transition">
<name id="461">ToSplit</name>
<source idref="410"/>
<target idref="439"/>
</item>
</sources>
<targets id="462" type="java.util.HashSet">
<item id="463" type="com.j2fe.workflow.definition.Transition">
<name id="464">end-loop</name>
<source idref="439"/>
<target id="465">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="466">Automatically generated</description>
<directJoin>false</directJoin>
<name id="467">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="468">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="469" type="java.util.HashSet">
<item idref="463" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="470" type="java.util.HashSet">
<item id="471" type="com.j2fe.workflow.definition.Transition">
<name id="472">goto-next</name>
<source idref="465"/>
<target id="473">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="474"/>
<directJoin>false</directJoin>
<name id="475">merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="476">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="477" type="java.util.HashSet">
<item id="478" type="com.j2fe.workflow.definition.Transition">
<name id="479">Y</name>
<source idref="389"/>
<target idref="473"/>
</item>
<item idref="471" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="480" type="java.util.HashSet">
<item id="481" type="com.j2fe.workflow.definition.Transition">
<name id="482">goto-next</name>
<source idref="473"/>
<target idref="3"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item idref="437" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="417"/>
</item>
</sources>
<targets id="483" type="java.util.HashSet">
<item idref="415" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="410"/>
</item>
</sources>
<targets id="484" type="java.util.HashSet">
<item idref="460" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item idref="478" type="com.j2fe.workflow.definition.Transition"/>
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
<item idref="250" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="235"/>
</item>
</sources>
<targets id="485" type="java.util.HashSet">
<item idref="233" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="218"/>
</item>
</sources>
<targets id="486" type="java.util.HashSet">
<item idref="216" type="com.j2fe.workflow.definition.Transition"/>
<item id="487" type="com.j2fe.workflow.definition.Transition">
<name id="488">rows-found</name>
<source idref="218"/>
<target id="489">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="490"/>
<directJoin>false</directJoin>
<name id="491">build Identifier Ignore List</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="492">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="493" type="java.util.HashSet">
<item id="494" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="495">statements</name>
<stringValue id="496">if (ignoreIdentifierList != null &amp;&amp; !ignoreIdentifierList.isEmpty()) &#13;
{&#13;
	ignoreIdentifierList = ignoreIdentifierList +","+ (requestData.substring(requestData.indexOf(",")+1)).substring(0,(requestData.substring(requestData.indexOf(",")+1)).indexOf(","));&#13;
}&#13;
else&#13;
{&#13;
	ignoreIdentifierList = (requestData.substring(requestData.indexOf(",")+1)).substring(0,(requestData.substring(requestData.indexOf(",")+1)).indexOf(","));&#13;
}</stringValue>
<type>CONSTANT</type>
</item>
<item id="497" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="498">variables["ignoreIdentifierList"]</name>
<stringValue id="499">IgnoreIdentifierList</stringValue>
<type>VARIABLE</type>
</item>
<item id="500" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="501">variables["ignoreIdentifierList"]</name>
<stringValue id="502">IgnoreIdentifierList</stringValue>
<type>VARIABLE</type>
</item>
<item id="503" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="504">variables["requestData"]</name>
<stringValue id="505">RequestData</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="506" type="java.util.HashSet">
<item idref="487" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="507" type="java.util.HashSet">
<item id="508" type="com.j2fe.workflow.definition.Transition">
<name id="509">goto-next</name>
<source idref="489"/>
<target id="510">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="511"/>
<directJoin>false</directJoin>
<name id="512">CaptureEventLogs?</name>
<nodeHandler>com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandler>
<nodeHandlerClass id="513">com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandlerClass>
<parameters id="514" type="java.util.HashSet">
<item id="515" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="516">caseInsensitive</name>
<stringValue id="517">true</stringValue>
<type>CONSTANT</type>
</item>
<item id="518" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="519">caseItem</name>
<stringValue id="520">CaptureEventLogs</stringValue>
<type>VARIABLE</type>
</item>
<item id="521" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="522">defaultItem</name>
<stringValue id="523">Y</stringValue>
<type>CONSTANT</type>
</item>
<item id="524" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="525">nullTransition</name>
<stringValue id="526">Y</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="527" type="java.util.HashSet">
<item idref="508" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="528" type="java.util.HashSet">
<item id="529" type="com.j2fe.workflow.definition.Transition">
<name id="530">N</name>
<source idref="510"/>
<target id="531">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="532"/>
<directJoin>false</directJoin>
<name id="533">NOP </name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="534">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="535" type="java.util.HashSet">
<item idref="529" type="com.j2fe.workflow.definition.Transition"/>
<item id="536" type="com.j2fe.workflow.definition.Transition">
<name id="537">goto-next</name>
<source id="538">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="539"/>
<directJoin>false</directJoin>
<name id="540">Event Logs</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="541">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="542" type="java.util.HashSet">
<item id="543" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="544">database</name>
<stringValue id="545">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="546" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="547">indexedParameters[0]</name>
<stringValue id="548">event_desc</stringValue>
<type>VARIABLE</type>
</item>
<item id="549" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="550">indexedParameters[1]</name>
<stringValue id="551">eventJobId</stringValue>
<type>VARIABLE</type>
</item>
<item id="552" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="553">querySQL</name>
<stringValue id="554">call mhi_sp_eventlog (&#13;
	  'cmfSOIAdditionFilter Workflow',&#13;
	  'INSTRUMENT EXISTS',&#13;
	  ? ,&#13;
	  ?&#13;
	); &#13;
</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="555" type="java.util.HashSet">
<item id="556" type="com.j2fe.workflow.definition.Transition">
<name id="557">goto-next</name>
<source id="558">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="559"/>
<directJoin>false</directJoin>
<name id="560">remove yellow key text</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="561">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="562" type="java.util.HashSet">
<item id="563" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="564">statements</name>
<stringValue id="565">if ( !(event_desc.endsWith(","))) {&#13;
	event_desc = event_desc.substring(0,event_desc.lastIndexOf(',') + 1);&#13;
}</stringValue>
<type>CONSTANT</type>
</item>
<item id="566" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="567">["event_desc"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="568">variables["event_desc"]</name>
<stringValue id="569">RequestData</stringValue>
<type>VARIABLE</type>
</item>
<item id="570" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="571">["event_desc"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="572">variables["event_desc"]</name>
<stringValue id="573">event_desc</stringValue>
<type>VARIABLE</type>
<variablePart id="574"/>
</item>
</parameters>
<sources id="575" type="java.util.HashSet">
<item id="576" type="com.j2fe.workflow.definition.Transition">
<name id="577">Y</name>
<source idref="510"/>
<target idref="558"/>
</item>
</sources>
<targets id="578" type="java.util.HashSet">
<item idref="556" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="538"/>
</item>
</sources>
<targets id="579" type="java.util.HashSet">
<item idref="536" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="531"/>
</item>
<item id="580" type="com.j2fe.workflow.definition.Transition">
<name id="581">goto-next</name>
<source id="582">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="583"/>
<directJoin>false</directJoin>
<name id="584">Event Logs</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="585">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="586" type="java.util.HashSet">
<item id="587" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="588">database</name>
<stringValue id="589">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="590" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="591">indexedParameters[0]</name>
<stringValue id="592">event_desc</stringValue>
<type>VARIABLE</type>
</item>
<item id="593" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="594">indexedParameters[1]</name>
<stringValue id="595">eventJobId</stringValue>
<type>VARIABLE</type>
</item>
<item id="596" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="597">querySQL</name>
<stringValue id="598">call mhi_sp_eventlog (&#13;
  'cmfSOIAdditionFilter Workflow',&#13;
  'INSTRUMENT NOT EXISTS',&#13;
  ? ,&#13;
  ?&#13;
); &#13;
&#13;
</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="599" type="java.util.HashSet">
<item id="600" type="com.j2fe.workflow.definition.Transition">
<name id="601">goto-next</name>
<source id="602">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="603"/>
<directJoin>false</directJoin>
<name id="604">remove yellow key text</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="605">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="606" type="java.util.HashSet">
<item id="607" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="608">statements</name>
<stringValue id="609">if ( !(event_desc.endsWith(","))) {&#13;
	event_desc = event_desc.substring(0,event_desc.lastIndexOf(',') + 1);&#13;
}</stringValue>
<type>CONSTANT</type>
</item>
<item id="610" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="611">["event_desc"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="612">variables["event_desc"]</name>
<stringValue id="613">RequestData</stringValue>
<type>VARIABLE</type>
</item>
<item id="614" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="615">["event_desc"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="616">variables["event_desc"]</name>
<stringValue id="617">event_desc</stringValue>
<type>VARIABLE</type>
<variablePart id="618"/>
</item>
</parameters>
<sources id="619" type="java.util.HashSet">
<item id="620" type="com.j2fe.workflow.definition.Transition">
<name id="621">Y</name>
<source idref="198"/>
<target idref="602"/>
</item>
</sources>
<targets id="622" type="java.util.HashSet">
<item idref="600" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="582"/>
</item>
</sources>
<targets id="623" type="java.util.HashSet">
<item idref="580" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="531"/>
</item>
</sources>
<targets id="624" type="java.util.HashSet">
<item id="625" type="com.j2fe.workflow.definition.Transition">
<name id="626">goto-next</name>
<source idref="531"/>
<target idref="191"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item idref="576" type="com.j2fe.workflow.definition.Transition"/>
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
<target idref="198"/>
</item>
</sources>
<targets id="627" type="java.util.HashSet">
<item idref="196" type="com.j2fe.workflow.definition.Transition"/>
<item idref="620" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="191"/>
</item>
<item idref="625" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="628" type="java.util.HashSet">
<item idref="189" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="184"/>
</item>
</sources>
<targets id="629" type="java.util.HashSet">
<item idref="273" type="com.j2fe.workflow.definition.Transition"/>
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
<item idref="145" type="com.j2fe.workflow.definition.Transition"/>
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
<target idref="10"/>
</item>
</sources>
<targets id="630" type="java.util.HashSet">
<item idref="8" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="3"/>
</item>
<item idref="481" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="631" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="632">Mizuho</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="633">user1</lastChangeUser>
<lastUpdate id="634">2025-10-18T06:25:42.000+0100</lastUpdate>
<name id="635">cmfSOIAdditionFilter</name>
<nodes id="636" type="java.util.HashSet">
<item idref="299" type="com.j2fe.workflow.definition.Node"/>
<item idref="130" type="com.j2fe.workflow.definition.Node"/>
<item idref="278" type="com.j2fe.workflow.definition.Node"/>
<item idref="94" type="com.j2fe.workflow.definition.Node"/>
<item idref="367" type="com.j2fe.workflow.definition.Node"/>
<item idref="198" type="com.j2fe.workflow.definition.Node"/>
<item idref="510" type="com.j2fe.workflow.definition.Node"/>
<item idref="582" type="com.j2fe.workflow.definition.Node"/>
<item idref="538" type="com.j2fe.workflow.definition.Node"/>
<item idref="112" type="com.j2fe.workflow.definition.Node"/>
<item idref="10" type="com.j2fe.workflow.definition.Node"/>
<item idref="439" type="com.j2fe.workflow.definition.Node"/>
<item idref="252" type="com.j2fe.workflow.definition.Node"/>
<item idref="151" type="com.j2fe.workflow.definition.Node"/>
<item idref="52" type="com.j2fe.workflow.definition.Node"/>
<item idref="169" type="com.j2fe.workflow.definition.Node"/>
<item idref="218" type="com.j2fe.workflow.definition.Node"/>
<item idref="410" type="com.j2fe.workflow.definition.Node"/>
<item idref="465" type="com.j2fe.workflow.definition.Node"/>
<item idref="531" type="com.j2fe.workflow.definition.Node"/>
<item idref="417" type="com.j2fe.workflow.definition.Node"/>
<item idref="29" type="com.j2fe.workflow.definition.Node"/>
<item idref="43" type="com.j2fe.workflow.definition.Node"/>
<item idref="3" type="com.j2fe.workflow.definition.Node"/>
<item idref="389" type="com.j2fe.workflow.definition.Node"/>
<item idref="70" type="com.j2fe.workflow.definition.Node"/>
<item idref="489" type="com.j2fe.workflow.definition.Node"/>
<item idref="235" type="com.j2fe.workflow.definition.Node"/>
<item idref="343" type="com.j2fe.workflow.definition.Node"/>
<item idref="184" type="com.j2fe.workflow.definition.Node"/>
<item idref="191" type="com.j2fe.workflow.definition.Node"/>
<item idref="473" type="com.j2fe.workflow.definition.Node"/>
<item idref="558" type="com.j2fe.workflow.definition.Node"/>
<item idref="602" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>true</optimize>
<parameter id="637" type="java.util.HashMap">
<entry>
<key id="638" type="java.lang.String">CaptureEventLogs</key>
<value id="639" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="640">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="641" type="java.lang.String">FilteredRequestMessage</key>
<value id="642" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="643">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>false</input>
<output>true</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="644" type="java.lang.String">GetRequestDataXPath</key>
<value id="645" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="646">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="647" type="java.lang.String">OverridePublishingCheck</key>
<value id="648" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="649">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="650">Publish Entities even though there is No Change&#13;
Possible values Y or N</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="651" type="java.lang.String">PublishAssets</key>
<value id="652" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="653">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="654" type="java.lang.String">RequestMessage</key>
<value id="655" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="656">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="657" type="java.lang.String">TriggeredByBBPerSecurityBatch</key>
<value id="658" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="659">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
</parameter>
<permissions id="660" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>false</purgeAtEnd>
<retries>0</retries>
<startNode idref="43"/>
<status>RELEASED</status>
<variables id="661" type="java.util.HashMap">
<entry>
<key id="662" type="java.lang.String">CaptureEventLogs</key>
<value id="663" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="664">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>true</persistent>
<value id="665" type="java.lang.String">Y</value>
</value>
</entry>
<entry>
<key id="666" type="java.lang.String">FilteredRequestMessage</key>
<value id="667" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="668">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>true</persistent>
</value>
</entry>
<entry>
<key id="669" type="java.lang.String">GetRequestDataXPath</key>
<value id="670" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="671">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>true</persistent>
<value id="672" type="java.lang.String">//RequestData/text()</value>
</value>
</entry>
<entry>
<key id="673" type="java.lang.String">IgnoreIdentifierList</key>
<value id="674" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="675">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="676" type="java.lang.String">LoopCounter</key>
<value id="677" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="678">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<persistent>false</persistent>
<value id="679" type="java.lang.Integer">0</value>
</value>
</entry>
<entry>
<key id="680" type="java.lang.String">LoopCounter2</key>
<value id="681" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="682">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<persistent>false</persistent>
<value idref="679"/>
</value>
</entry>
<entry>
<key id="683" type="java.lang.String">OverridePublishingCheck</key>
<value id="684" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="685">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="686">Publish Entities even though there is No Change&#13;
Possible values Y or N</description>
<persistent>true</persistent>
<value id="687" type="java.lang.String">N</value>
</value>
</entry>
<entry>
<key id="688" type="java.lang.String">PublishAssets</key>
<value id="689" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="690">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>true</persistent>
<value id="691" type="java.lang.String">Y</value>
</value>
</entry>
<entry>
<key id="692" type="java.lang.String">RequestMessage</key>
<value id="693" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="694">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>true</persistent>
</value>
</entry>
<entry>
<key id="695" type="java.lang.String">TriggeredByBBPerSecurityBatch</key>
<value id="696" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="697">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>true</persistent>
<value id="698" type="java.lang.String">N</value>
</value>
</entry>
</variables>
<version>26</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
