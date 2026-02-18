<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.04">
<package-comment/>
<businessobject displayString="16 - v10" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>false</alwaysPersist>
<clustered>true</clustered>
<comment id="1">v10</comment>
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
<name id="9">false</name>
<source id="10">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="11"/>
<directJoin>false</directJoin>
<name id="12">Requests?</name>
<nodeHandler>com.j2fe.workflow.handler.impl.XPathXorSplit</nodeHandler>
<nodeHandlerClass id="13">com.j2fe.workflow.handler.impl.XPathXorSplit</nodeHandlerClass>
<parameters id="14" type="java.util.HashSet">
<item id="15" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="16">inputText</name>
<stringValue id="17">FilteredRequestMessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="18" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="19">xPath</name>
<stringValue id="20">//Request</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="21" type="java.util.HashSet">
<item id="22" type="com.j2fe.workflow.definition.Transition">
<name id="23">goto-next</name>
<source id="24">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="25"/>
<directJoin>false</directJoin>
<name id="26">Build Filtered Request Message</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="27">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="28" type="java.util.HashSet">
<item id="29" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="30">statements</name>
<objectValue id="31" type="java.lang.String">import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.w3c.dom.Node;
import org.w3c.dom.Element;
import org.xml.sax.InputSource;
import java.io.StringReader;
import java.io.StringWriter;

//try {
	
		String [] identifierListArray = identifierList.split(",");
    	
		DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
		DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();	
		InputSource is = new InputSource(new StringReader(requestMessage));
		Document doc = dBuilder.parse(is);
		doc.getDocumentElement().normalize();
		
		NodeList nList = doc.getElementsByTagName("Request");
			
		for (int i = 0; i &lt; identifierListArray.length; i++) {  
		
			for (int j = 0; j &lt; nList.getLength(); j++) {

				Node nNode = nList.item(j);				
				//System.out.println("\nCurrent Element :" + nNode.getNodeName());
				Element eElement = (Element) nNode;						
				//System.out.println("Identifier : " + eElement.getElementsByTagName("Identifier").item(0).getTextContent());
				//System.out.println("identifierListArray : " + identifierListArray[i]);

				if (eElement.getElementsByTagName("Identifier").item(0).getTextContent().equals(identifierListArray[i])) {

					Node parent = eElement.getParentNode();
					parent.removeChild(eElement);
					parent.normalize();					
					//System.out.println("Identifier Match: " + eElement.getElementsByTagName("Identifier").item(0).getTextContent());

				}
			}
		}
  
		//doc.getDocumentElement().normalize(); 
		DOMSource domSource = new DOMSource(doc);
		Transformer transformer = TransformerFactory.newInstance().newTransformer();
		StringWriter sw = new StringWriter();
		StreamResult sr = new StreamResult(sw);
		transformer.transform(domSource, sr);
		//System.out.println(sw.toString());
		String filteredRequestMessage = sw.toString();

		BufferedReader reader = new BufferedReader(new StringReader(filteredRequestMessage));
		StringBuffer result = new StringBuffer();
	       String line;
        	while ( (line = reader.readLine() ) != null)
			result.append(line.trim());
        	filteredRequestMessage = result.toString();
  
//    } catch (Exception e) {
//		e.printStackTrace();
//    }</objectValue>
<type>CONSTANT</type>
</item>
<item id="32" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="33">variables["filteredRequestMessage"]</name>
<stringValue id="34">FilteredRequestMessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="35" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="36">variables["identifierList"]</name>
<stringValue id="37">IgnoreIdentifierList</stringValue>
<type>VARIABLE</type>
</item>
<item id="38" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="39">variables["requestMessage"]</name>
<stringValue id="40">RequestMessage</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="41" type="java.util.HashSet">
<item id="42" type="com.j2fe.workflow.definition.Transition">
<name id="43">end-loop</name>
<source id="44">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="45"/>
<directJoin>false</directJoin>
<name id="46">For Loop</name>
<nodeHandler>com.j2fe.workflow.handler.impl.ForEach</nodeHandler>
<nodeHandlerClass id="47">com.j2fe.workflow.handler.impl.ForEach</nodeHandlerClass>
<parameters id="48" type="java.util.HashSet">
<item id="49" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="50">counter</name>
<stringValue id="51">LoopCounter</stringValue>
<type>VARIABLE</type>
</item>
<item id="52" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="53">counter</name>
<stringValue id="54">LoopCounter</stringValue>
<type>VARIABLE</type>
</item>
<item id="55" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="56">input</name>
<stringValue id="57">RequestDataList</stringValue>
<type>VARIABLE</type>
</item>
<item id="58" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="59">output</name>
<stringValue id="60">RequestData</stringValue>
<type>VARIABLE</type>
</item>
<item id="61" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="62">outputObjects</name>
<stringValue id="63">IncrementedObjects</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="64" type="java.util.HashSet">
<item id="65" type="com.j2fe.workflow.definition.Transition">
<name id="66">goto-next</name>
<source id="67">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="68"/>
<directJoin>false</directJoin>
<name id="69">merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="70">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="71" type="java.util.HashSet">
<item id="72" type="com.j2fe.workflow.definition.Transition">
<name id="73">goto-next</name>
<source id="74">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="75"/>
<directJoin>false</directJoin>
<name id="76">Initialize IgnoreIdentifierList</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="77">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="78" type="java.util.HashSet">
<item id="79" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="80">statements</name>
<stringValue id="81">String IgnoreIdentifierList="";</stringValue>
<type>CONSTANT</type>
</item>
<item id="82" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="83">variables["IgnoreIdentifierList"]</name>
<stringValue id="84">IgnoreIdentifierList</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="85" type="java.util.HashSet">
<item id="86" type="com.j2fe.workflow.definition.Transition">
<name id="87">goto-next</name>
<source id="88">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="89"/>
<directJoin>false</directJoin>
<name id="90">Get Event JOB ID</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="91">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="92" type="java.util.HashSet">
<item id="93" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="94">database</name>
<stringValue id="95">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="96" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="97">firstColumnsResult[0]</name>
<stringValue id="98">eventJobId</stringValue>
<type>VARIABLE</type>
</item>
<item id="99" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="100">querySQL</name>
<stringValue id="101">SELECT new_oid() FROM dual</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="102" type="java.util.HashSet">
<item id="103" type="com.j2fe.workflow.definition.Transition">
<name id="104">goto-next</name>
<source id="105">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="106"/>
<directJoin>false</directJoin>
<name id="107">Extract RequestData</name>
<nodeHandler>com.j2fe.workflow.handler.impl.ExecuteXPath</nodeHandler>
<nodeHandlerClass id="108">com.j2fe.workflow.handler.impl.ExecuteXPath</nodeHandlerClass>
<parameters id="109" type="java.util.HashSet">
<item id="110" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="111">inputText</name>
<stringValue id="112">RequestDataXml</stringValue>
<type>VARIABLE</type>
<variablePart id="113">[0]</variablePart>
</item>
<item id="114" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="115">outputValues</name>
<stringValue id="116">RequestDataList</stringValue>
<type>VARIABLE</type>
</item>
<item id="117" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="118">xPath</name>
<stringValue id="119">GetRequestDataXPath</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="120" type="java.util.HashSet">
<item id="121" type="com.j2fe.workflow.definition.Transition">
<name id="122">goto-next</name>
<source id="123">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="124"/>
<directJoin>false</directJoin>
<name id="125">Build RequestData xml</name>
<nodeHandler>com.j2fe.translation.activities.Translation</nodeHandler>
<nodeHandlerClass id="126">com.j2fe.translation.activities.Translation</nodeHandlerClass>
<parameters id="127" type="java.util.HashSet">
<item id="128" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="129">input</name>
<stringValue id="130">RequestMessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="131" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="132">mapping</name>
<stringValue id="133">db://resource/xslt/MHI/mizExtractRequestDataSoiStatement.xslt</stringValue>
<type>CONSTANT</type>
</item>
<item id="134" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="135">plainOutput</name>
<stringValue id="136">RequestDataXml</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="137" type="java.util.HashSet">
<item id="138" type="com.j2fe.workflow.definition.Transition">
<name id="139">goto-next</name>
<source id="140">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="141"/>
<directJoin>false</directJoin>
<name id="142">Translate IDContextType in Request Message</name>
<nodeHandler>com.j2fe.translation.activities.Translation</nodeHandler>
<nodeHandlerClass id="143">com.j2fe.translation.activities.Translation</nodeHandlerClass>
<parameters id="144" type="java.util.HashSet">
<item id="145" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="146">input</name>
<stringValue id="147">RequestMessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="148" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="149">mapping</name>
<stringValue id="150">db://resource/xslt/MHI/translateIDContextType.xslt</stringValue>
<type>CONSTANT</type>
</item>
<item id="151" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="152">output.output[0].textData</name>
<stringValue id="153">RequestMessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="154" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="155">wantedOutputType</name>
<stringValue id="156">XML</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="157" type="java.util.HashSet">
<item id="158" type="com.j2fe.workflow.definition.Transition">
<name id="159">true</name>
<source id="160">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="161"/>
<directJoin>false</directJoin>
<name id="162">Requests?</name>
<nodeHandler>com.j2fe.workflow.handler.impl.XPathXorSplit</nodeHandler>
<nodeHandlerClass id="163">com.j2fe.workflow.handler.impl.XPathXorSplit</nodeHandlerClass>
<parameters id="164" type="java.util.HashSet">
<item id="165" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="166">inputText</name>
<stringValue id="167">RequestMessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="168" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="169">xPath</name>
<stringValue id="170">//Request</stringValue>
<type>CONSTANT</type>
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
<name id="176">Build Request Message</name>
<nodeHandler>com.j2fe.translation.activities.Translation</nodeHandler>
<nodeHandlerClass id="177">com.j2fe.translation.activities.Translation</nodeHandlerClass>
<parameters id="178" type="java.util.HashSet">
<item id="179" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="180">input</name>
<stringValue id="181">SoiStatementMessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="182" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="183">mapping</name>
<stringValue id="184">db://resource/xslt/MHI/cmfSoiStatement.xslt</stringValue>
<type>CONSTANT</type>
</item>
<item id="185" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="186">output.output[0].textData</name>
<stringValue id="187">RequestMessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="188" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="189">wantedOutputType</name>
<stringValue id="190">XML</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="191" type="java.util.HashSet">
<item id="192" type="com.j2fe.workflow.definition.Transition">
<name id="193">nothing-found</name>
<source id="194">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="195"/>
<directJoin>false</directJoin>
<name id="196">Exclude BBG Requests?</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="197">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="198" type="java.util.HashSet">
<item id="199" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="200">database</name>
<stringValue id="201">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="202" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="203">indexedParameters[0]</name>
<stringValue id="204">SoiName</stringValue>
<type>VARIABLE</type>
</item>
<item id="205" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="206">querySQL</name>
<stringValue id="207">SELECT * FROM ft_t_isgr where 1=1 and grp_nme=CAST(? AS VARCHAR) and grp_purp_typ='INTRESTX' and end_tms IS NULL</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="208" type="java.util.HashSet">
<item id="209" type="com.j2fe.workflow.definition.Transition">
<name id="210">goto-next</name>
<source id="211">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="212"/>
<directJoin>false</directJoin>
<name id="213">Get SOI Name</name>
<nodeHandler>com.j2fe.workflow.handler.impl.ExecuteXPath</nodeHandler>
<nodeHandlerClass id="214">com.j2fe.workflow.handler.impl.ExecuteXPath</nodeHandlerClass>
<parameters id="215" type="java.util.HashSet">
<item id="216" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="217">inputText</name>
<stringValue id="218">SoiStatementMessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="219" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="220">outputValue</name>
<stringValue id="221">SoiName</stringValue>
<type>VARIABLE</type>
</item>
<item id="222" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="223">xPath</name>
<stringValue id="224">GetSoiDomainXPath</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="225" type="java.util.HashSet">
<item id="226" type="com.j2fe.workflow.definition.Transition">
<name id="227">goto-next</name>
<source id="228">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="229"/>
<directJoin>false</directJoin>
<name id="230">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="231">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="232" type="java.util.HashSet"/>
<targets id="233" type="java.util.HashSet">
<item idref="226" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="211"/>
</item>
</sources>
<targets id="234" type="java.util.HashSet">
<item idref="209" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="194"/>
</item>
</sources>
<targets id="235" type="java.util.HashSet">
<item idref="192" type="com.j2fe.workflow.definition.Transition"/>
<item id="236" type="com.j2fe.workflow.definition.Transition">
<name id="237">rows-found</name>
<source idref="194"/>
<target idref="3"/>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="174"/>
</item>
</sources>
<targets id="238" type="java.util.HashSet">
<item idref="172" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="160"/>
</item>
</sources>
<targets id="239" type="java.util.HashSet">
<item id="240" type="com.j2fe.workflow.definition.Transition">
<name id="241">false</name>
<source idref="160"/>
<target id="242">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="243"/>
<directJoin>false</directJoin>
<name id="244">FilteredRequestMessage</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="245">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="246" type="java.util.HashSet">
<item id="247" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="248">statements</name>
<stringValue id="249">String filteredRequestMessage=requestMessage;</stringValue>
<type>CONSTANT</type>
</item>
<item id="250" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="251">["filteredRequestMessage"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="252">variables["filteredRequestMessage"]</name>
<stringValue id="253">FilteredRequestMessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="254" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="255">["requestMessage"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="256">variables["requestMessage"]</name>
<stringValue id="257">RequestMessage</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="258" type="java.util.HashSet">
<item idref="240" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="259" type="java.util.HashSet">
<item id="260" type="com.j2fe.workflow.definition.Transition">
<name id="261">goto-next</name>
<source idref="242"/>
<target idref="3"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item idref="158" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="140"/>
</item>
</sources>
<targets id="262" type="java.util.HashSet">
<item idref="138" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="123"/>
</item>
</sources>
<targets id="263" type="java.util.HashSet">
<item idref="121" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="105"/>
</item>
</sources>
<targets id="264" type="java.util.HashSet">
<item idref="103" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="88"/>
</item>
</sources>
<targets id="265" type="java.util.HashSet">
<item idref="86" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="74"/>
</item>
</sources>
<targets id="266" type="java.util.HashSet">
<item idref="72" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="67"/>
</item>
<item id="267" type="com.j2fe.workflow.definition.Transition">
<name id="268">goto-next</name>
<source id="269">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="270"/>
<directJoin>false</directJoin>
<name id="271">merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="272">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="273" type="java.util.HashSet">
<item id="274" type="com.j2fe.workflow.definition.Transition">
<name id="275">N</name>
<source id="276">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="277"/>
<directJoin>false</directJoin>
<name id="278">CaptureEventLogs?</name>
<nodeHandler>com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandler>
<nodeHandlerClass id="279">com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandlerClass>
<parameters id="280" type="java.util.HashSet">
<item id="281" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="282">caseInsensitive</name>
<stringValue id="283">true</stringValue>
<type>CONSTANT</type>
</item>
<item id="284" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="285">caseItem</name>
<stringValue id="286">CaptureEventLogs</stringValue>
<type>VARIABLE</type>
</item>
<item id="287" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="288">defaultItem</name>
<stringValue id="289">Y</stringValue>
<type>CONSTANT</type>
</item>
<item id="290" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="291">nullTransition</name>
<stringValue id="292">Y</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="293" type="java.util.HashSet">
<item id="294" type="com.j2fe.workflow.definition.Transition">
<name id="295">nothing-found</name>
<source id="296">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="297"/>
<directJoin>false</directJoin>
<name id="298">Instrument Exists?</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="299">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="300" type="java.util.HashSet">
<item id="301" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="302">database</name>
<stringValue id="303">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="304" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="305">mappedResult</name>
<stringValue id="306">RequestDataMappedResult</stringValue>
<type>VARIABLE</type>
</item>
<item id="307" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="308">querySQL</name>
<stringValue id="309">instrExistsQuery</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="310" type="java.util.HashSet">
<item id="311" type="com.j2fe.workflow.definition.Transition">
<name id="312">goto-next</name>
<source id="313">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="314"/>
<directJoin>false</directJoin>
<name id="315">build Instrument Exists Query</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="316">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="317" type="java.util.HashSet">
<item id="318" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="319">statements</name>
<stringValue id="320">query = "select INSTR_ID ";
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
<item id="321" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="322">variables["query"]</name>
<stringValue id="323">instrExistsQuery</stringValue>
<type>VARIABLE</type>
</item>
<item id="324" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="325">variables["rqstData"]</name>
<stringValue id="326">RequestData</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="327" type="java.util.HashSet">
<item id="328" type="com.j2fe.workflow.definition.Transition">
<name id="329">loop</name>
<source idref="44"/>
<target idref="313"/>
</item>
</sources>
<targets id="330" type="java.util.HashSet">
<item idref="311" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="296"/>
</item>
</sources>
<targets id="331" type="java.util.HashSet">
<item idref="294" type="com.j2fe.workflow.definition.Transition"/>
<item id="332" type="com.j2fe.workflow.definition.Transition">
<name id="333">rows-found</name>
<source idref="296"/>
<target id="334">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="335"/>
<directJoin>false</directJoin>
<name id="336">build Identifier Ignore List</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="337">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="338" type="java.util.HashSet">
<item id="339" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="340">statements</name>
<stringValue id="341">if (ignoreIdentifierList != null &amp;&amp; !ignoreIdentifierList.isEmpty()) 
{
	ignoreIdentifierList = ignoreIdentifierList +","+ (requestData.substring(requestData.indexOf(",")+1)).substring(0,(requestData.substring(requestData.indexOf(",")+1)).indexOf(","));
}
else
{
	ignoreIdentifierList = (requestData.substring(requestData.indexOf(",")+1)).substring(0,(requestData.substring(requestData.indexOf(",")+1)).indexOf(","));
}</stringValue>
<type>CONSTANT</type>
</item>
<item id="342" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="343">variables["ignoreIdentifierList"]</name>
<stringValue id="344">IgnoreIdentifierList</stringValue>
<type>VARIABLE</type>
</item>
<item id="345" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="346">variables["ignoreIdentifierList"]</name>
<stringValue id="347">IgnoreIdentifierList</stringValue>
<type>VARIABLE</type>
</item>
<item id="348" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="349">variables["requestData"]</name>
<stringValue id="350">RequestData</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="351" type="java.util.HashSet">
<item idref="332" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="352" type="java.util.HashSet">
<item id="353" type="com.j2fe.workflow.definition.Transition">
<name id="354">goto-next</name>
<source idref="334"/>
<target id="355">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="356"/>
<directJoin>false</directJoin>
<name id="357">CaptureEventLogs?</name>
<nodeHandler>com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandler>
<nodeHandlerClass id="358">com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandlerClass>
<parameters id="359" type="java.util.HashSet">
<item id="360" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="361">caseInsensitive</name>
<stringValue id="362">true</stringValue>
<type>CONSTANT</type>
</item>
<item id="363" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="364">caseItem</name>
<stringValue id="365">CaptureEventLogs</stringValue>
<type>VARIABLE</type>
</item>
<item id="366" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="367">defaultItem</name>
<stringValue id="368">Y</stringValue>
<type>CONSTANT</type>
</item>
<item id="369" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="370">nullTransition</name>
<stringValue id="371">Y</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="372" type="java.util.HashSet">
<item idref="353" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="373" type="java.util.HashSet">
<item id="374" type="com.j2fe.workflow.definition.Transition">
<name id="375">N</name>
<source idref="355"/>
<target idref="269"/>
</item>
<item id="376" type="com.j2fe.workflow.definition.Transition">
<name id="377">Y</name>
<source idref="355"/>
<target id="378">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="379"/>
<directJoin>false</directJoin>
<name id="380">Event Logs</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="381">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="382" type="java.util.HashSet">
<item id="383" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="384">database</name>
<stringValue id="385">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="386" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="387">indexedParameters[0]</name>
<stringValue id="388">RequestData</stringValue>
<type>VARIABLE</type>
</item>
<item id="389" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="390">indexedParameters[1]</name>
<stringValue id="391">eventJobId</stringValue>
<type>VARIABLE</type>
</item>
<item id="392" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="393">querySQL</name>
<stringValue id="394">call mhi_sp_eventlog (&#13;
	  'cmfSOIStatementBBGRequest Workflow',&#13;
	  'INSTRUMENT EXISTS',&#13;
	  CAST(? AS VARCHAR) ,&#13;
	  CAST(? AS VARCHAR)&#13;
	);</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="395" type="java.util.HashSet">
<item idref="376" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="396" type="java.util.HashSet">
<item id="397" type="com.j2fe.workflow.definition.Transition">
<name id="398">goto-next</name>
<source idref="378"/>
<target idref="269"/>
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
</targets>
<type>XORSPLIT</type>
</source>
<target idref="276"/>
</item>
</sources>
<targets id="399" type="java.util.HashSet">
<item idref="274" type="com.j2fe.workflow.definition.Transition"/>
<item id="400" type="com.j2fe.workflow.definition.Transition">
<name id="401">Y</name>
<source idref="276"/>
<target id="402">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="403"/>
<directJoin>false</directJoin>
<name id="404">Event Logs</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="405">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="406" type="java.util.HashSet">
<item id="407" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="408">database</name>
<stringValue id="409">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="410" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="411">indexedParameters[0]</name>
<stringValue id="412">RequestData</stringValue>
<type>VARIABLE</type>
</item>
<item id="413" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="414">indexedParameters[1]</name>
<stringValue id="415">eventJobId</stringValue>
<type>VARIABLE</type>
</item>
<item id="416" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="417">querySQL</name>
<stringValue id="418">call mhi_sp_eventlog (&#13;
  'cmfSOIStatementBBGRequest Workflow',&#13;
  'INSTRUMENT NOT EXISTS',&#13;
  CAST(? AS VARCHAR),&#13;
  CAST(? AS VARCHAR));</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="419" type="java.util.HashSet">
<item idref="400" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="420" type="java.util.HashSet">
<item id="421" type="com.j2fe.workflow.definition.Transition">
<name id="422">goto-next</name>
<source idref="402"/>
<target idref="269"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="269"/>
</item>
<item idref="374" type="com.j2fe.workflow.definition.Transition"/>
<item idref="397" type="com.j2fe.workflow.definition.Transition"/>
<item idref="421" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="423" type="java.util.HashSet">
<item idref="267" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="67"/>
</item>
</sources>
<targets id="424" type="java.util.HashSet">
<item idref="65" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="44"/>
</item>
</sources>
<targets id="425" type="java.util.HashSet">
<item idref="42" type="com.j2fe.workflow.definition.Transition"/>
<item idref="328" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="24"/>
</item>
</sources>
<targets id="426" type="java.util.HashSet">
<item idref="22" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="10"/>
</item>
</sources>
<targets id="427" type="java.util.HashSet">
<item idref="8" type="com.j2fe.workflow.definition.Transition"/>
<item id="428" type="com.j2fe.workflow.definition.Transition">
<name id="429">true</name>
<source idref="10"/>
<target id="430">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="431"/>
<directJoin>false</directJoin>
<name id="432">Bean Shell Script (Standard)</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="433">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="434" type="java.util.HashSet">
<item id="435" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="436">statements</name>
<stringValue id="437">String FTP_PATH="/gold/GSFTP/files/bbg_esb_temp";</stringValue>
<type>CONSTANT</type>
</item>
<item id="438" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="439">["FTP_PATH"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="440">variables["FTP_PATH"]</name>
<stringValue id="441">FTP_PATH</stringValue>
<type>VARIABLE</type>
</item>
<item id="442" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="443">variables["userName"]</name>
<stringValue id="444">CaptureEventLogs</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="445" type="java.util.HashSet">
<item idref="428" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="446" type="java.util.HashSet">
<item id="447" type="com.j2fe.workflow.definition.Transition">
<name id="448">goto-next</name>
<source idref="430"/>
<target id="449">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="450"/>
<directJoin>false</directJoin>
<name id="451">Request Reply</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="452">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="453" type="java.util.HashSet">
<item id="454" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="455">["BBDownloadDirectory"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="456">input["BBDownloadDirectory"]</name>
<stringValue id="457">FTP_PATH</stringValue>
<type>VARIABLE</type>
</item>
<item id="458" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="459">["BBFileSystemType"]@com/j2fe/connector/BBFileSystemType@</UITypeHint>
<input>true</input>
<name id="460">input["BBFileSystemType"]</name>
<objectValue id="461" type="com.j2fe.connector.BBFileSystemType">SFTP</objectValue>
<type>CONSTANT</type>
</item>
<item id="462" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="463">["BBTimeout"]@java/lang/Long@</UITypeHint>
<input>true</input>
<name id="464">input["BBTimeout"]</name>
<objectValue id="465" type="java.lang.Long">5400</objectValue>
<type>CONSTANT</type>
</item>
<item id="466" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="467">["BBUploadDirectory"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="468">input["BBUploadDirectory"]</name>
<stringValue id="469">FTP_PATH</stringValue>
<type>VARIABLE</type>
</item>
<item id="470" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="471">["IDCFormat"]@com/j2fe/connector/IDCFormat@</UITypeHint>
<input>true</input>
<name id="472">input["IDCFormat"]</name>
<objectValue id="473" type="com.j2fe.connector.IDCFormat">SingelRecordLayout</objectValue>
<type>CONSTANT</type>
</item>
<item id="474" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="475">["IDCRR"]@java/lang/Boolean@</UITypeHint>
<input>true</input>
<name id="476">input["IDCRR"]</name>
<objectValue id="477" type="java.lang.Boolean">false</objectValue>
<type>CONSTANT</type>
</item>
<item id="478" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="479">["Message"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="480">input["Message"]</name>
<stringValue id="481">FilteredRequestMessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="482" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="483">name</name>
<stringValue id="484">Request Reply</stringValue>
<type>CONSTANT</type>
</item>
<item id="485" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="486">["RequestTransaction"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="487">output["RequestTransaction"]</name>
<stringValue id="488">RequestTransaction</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="489" type="java.util.HashSet">
<item idref="447" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="490" type="java.util.HashSet">
<item id="491" type="com.j2fe.workflow.definition.Transition">
<name id="492">goto-next</name>
<source idref="449"/>
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
</targets>
<type>XORSPLIT</type>
</source>
<target idref="3"/>
</item>
<item idref="260" type="com.j2fe.workflow.definition.Transition"/>
<item idref="491" type="com.j2fe.workflow.definition.Transition"/>
<item idref="236" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="493" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="494">Mizuho</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="495">user1</lastChangeUser>
<lastUpdate id="496">2025-10-06T23:31:11.000+0100</lastUpdate>
<name id="497">cmfSOIStatementBBGRequest</name>
<nodes id="498" type="java.util.HashSet">
<item idref="430" type="com.j2fe.workflow.definition.Node"/>
<item idref="24" type="com.j2fe.workflow.definition.Node"/>
<item idref="174" type="com.j2fe.workflow.definition.Node"/>
<item idref="123" type="com.j2fe.workflow.definition.Node"/>
<item idref="355" type="com.j2fe.workflow.definition.Node"/>
<item idref="276" type="com.j2fe.workflow.definition.Node"/>
<item idref="378" type="com.j2fe.workflow.definition.Node"/>
<item idref="402" type="com.j2fe.workflow.definition.Node"/>
<item idref="194" type="com.j2fe.workflow.definition.Node"/>
<item idref="105" type="com.j2fe.workflow.definition.Node"/>
<item idref="242" type="com.j2fe.workflow.definition.Node"/>
<item idref="44" type="com.j2fe.workflow.definition.Node"/>
<item idref="88" type="com.j2fe.workflow.definition.Node"/>
<item idref="211" type="com.j2fe.workflow.definition.Node"/>
<item idref="74" type="com.j2fe.workflow.definition.Node"/>
<item idref="296" type="com.j2fe.workflow.definition.Node"/>
<item idref="449" type="com.j2fe.workflow.definition.Node"/>
<item idref="10" type="com.j2fe.workflow.definition.Node"/>
<item idref="160" type="com.j2fe.workflow.definition.Node"/>
<item idref="228" type="com.j2fe.workflow.definition.Node"/>
<item idref="3" type="com.j2fe.workflow.definition.Node"/>
<item idref="140" type="com.j2fe.workflow.definition.Node"/>
<item idref="334" type="com.j2fe.workflow.definition.Node"/>
<item idref="313" type="com.j2fe.workflow.definition.Node"/>
<item idref="67" type="com.j2fe.workflow.definition.Node"/>
<item idref="269" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>true</optimize>
<parameter id="499" type="java.util.HashMap">
<entry>
<key id="500" type="java.lang.String">CaptureEventLogs</key>
<value id="501" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="502">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="503" type="java.lang.String">FilteredRequestMessage</key>
<value id="504" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="505">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>false</input>
<output>true</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="506" type="java.lang.String">GetRequestDataXPath</key>
<value id="507" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="508">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="509" type="java.lang.String">GetSoiDomainXPath</key>
<value id="510" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="511">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="512" type="java.lang.String">SoiStatementMessage</key>
<value id="513" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="514">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
</parameter>
<permissions id="515" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>false</purgeAtEnd>
<retries>0</retries>
<startNode idref="228"/>
<status>RELEASED</status>
<variables id="516" type="java.util.HashMap">
<entry>
<key id="517" type="java.lang.String">CaptureEventLogs</key>
<value id="518" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="519">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>true</persistent>
<value id="520" type="java.lang.String">Y</value>
</value>
</entry>
<entry>
<key id="521" type="java.lang.String">FilteredRequestMessage</key>
<value id="522" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="523">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>true</persistent>
</value>
</entry>
<entry>
<key id="524" type="java.lang.String">GetRequestDataXPath</key>
<value id="525" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="526">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>true</persistent>
<value id="527" type="java.lang.String">//RequestData/text()</value>
</value>
</entry>
<entry>
<key id="528" type="java.lang.String">GetSoiDomainXPath</key>
<value id="529" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="530">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>true</persistent>
<value id="531" type="java.lang.String">/cmfSOIStatement/soiDomain</value>
</value>
</entry>
<entry>
<key id="532" type="java.lang.String">IgnoreIdentifierList</key>
<value id="533" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="534">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="535" type="java.lang.String">LoopCounter</key>
<value id="536" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="537">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<persistent>false</persistent>
<value id="538" type="java.lang.Integer">0</value>
</value>
</entry>
<entry>
<key id="539" type="java.lang.String">SoiStatementMessage</key>
<value id="540" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="541">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
</variables>
<version>16</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
