<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.07">
<package-comment/>
<businessobject displayString="10 - V10-Added_Asynch" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>false</alwaysPersist>
<clustered>true</clustered>
<comment id="1">V10-Added_Asynch</comment>
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
<name id="12">Close Job</name>
<nodeHandler>com.j2fe.streetlamp.activities.CloseJob</nodeHandler>
<nodeHandlerClass id="13">com.j2fe.streetlamp.activities.CloseJob</nodeHandlerClass>
<parameters id="14" type="java.util.HashSet">
<item id="15" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="16">jobId</name>
<stringValue id="17">JobID</stringValue>
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
<name id="23">Close Transaction</name>
<nodeHandler>com.j2fe.streetlamp.activities.CloseTransaction</nodeHandler>
<nodeHandlerClass id="24">com.j2fe.streetlamp.activities.CloseTransaction</nodeHandlerClass>
<parameters id="25" type="java.util.HashSet">
<item id="26" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="27">transactionId</name>
<stringValue id="28">TransactionID</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="29" type="java.util.HashSet">
<item id="30" type="com.j2fe.workflow.definition.Transition">
<name id="31">goto-next</name>
<source id="32">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="33"/>
<directJoin>false</directJoin>
<name id="34">Move File To Processed</name>
<nodeHandler>com.j2fe.general.activities.FileOperator</nodeHandler>
<nodeHandlerClass id="35">com.j2fe.general.activities.FileOperator</nodeHandlerClass>
<parameters id="36" type="java.util.HashSet">
<item id="37" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="38">operationToPerform</name>
<stringValue id="39">Move</stringValue>
<type>CONSTANT</type>
</item>
<item id="40" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="41">sourceDirectory</name>
<stringValue id="42">tempFileDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="43" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="44">sourceFileName</name>
<stringValue id="45">fileName</stringValue>
<type>VARIABLE</type>
</item>
<item id="46" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="47">sourceFileSystem</name>
<stringValue id="48">filesystem/local</stringValue>
<type>REFERENCE</type>
</item>
<item id="49" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="50">targetDirectory</name>
<stringValue id="51">processedFileDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="52" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="53">targetFileName</name>
<stringValue id="54">fileName</stringValue>
<type>VARIABLE</type>
</item>
<item id="55" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="56">targetFileSystem</name>
<stringValue id="57">filesystem/local</stringValue>
<type>REFERENCE</type>
</item>
</parameters>
<sources id="58" type="java.util.HashSet">
<item id="59" type="com.j2fe.workflow.definition.Transition">
<name id="60">empty</name>
<source id="61">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="62"/>
<directJoin>false</directJoin>
<name id="63">List Files</name>
<nodeHandler>com.j2fe.feeds.activities.ListFiles</nodeHandler>
<nodeHandlerClass id="64">com.j2fe.feeds.activities.ListFiles</nodeHandlerClass>
<parameters id="65" type="java.util.HashSet">
<item id="66" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="67">directory</name>
<stringValue id="68">tempFileDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="69" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="70">fileSystem</name>
<stringValue id="71">filesystem/local</stringValue>
<type>REFERENCE</type>
</item>
<item id="72" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="73">fileSystemId</name>
<stringValue id="74">fileName</stringValue>
<type>VARIABLE</type>
</item>
<item id="75" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="76">list</name>
<stringValue id="77">FileList</stringValue>
<type>VARIABLE</type>
</item>
<item id="78" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="79">uris</name>
<stringValue id="80">URIList</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="81" type="java.util.HashSet">
<item id="82" type="com.j2fe.workflow.definition.Transition">
<name id="83">ISSR</name>
<source id="84">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="85"/>
<directJoin>false</directJoin>
<name id="86">Switch Case ISSR/FINS</name>
<nodeHandler>com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandler>
<nodeHandlerClass id="87">com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandlerClass>
<parameters id="88" type="java.util.HashSet">
<item id="89" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="90">caseItem</name>
<stringValue id="91">entityType</stringValue>
<type>VARIABLE</type>
</item>
<item id="92" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="93">defaultItem</name>
<stringValue id="94">ISSR</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="95" type="java.util.HashSet">
<item id="96" type="com.j2fe.workflow.definition.Transition">
<name id="97">goto-next</name>
<source id="98">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="99"/>
<directJoin>false</directJoin>
<name id="100">Copy File To Temp</name>
<nodeHandler>com.j2fe.general.activities.FileOperator</nodeHandler>
<nodeHandlerClass id="101">com.j2fe.general.activities.FileOperator</nodeHandlerClass>
<parameters id="102" type="java.util.HashSet">
<item id="103" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="104">operationToPerform</name>
<stringValue id="105">Copy</stringValue>
<type>CONSTANT</type>
</item>
<item id="106" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="107">sourceDirectory</name>
<stringValue id="108">sourceFileDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="109" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="110">sourceFileName</name>
<stringValue id="111">fileName</stringValue>
<type>VARIABLE</type>
</item>
<item id="112" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="113">sourceFileSystem</name>
<stringValue id="114">filesystem/local</stringValue>
<type>REFERENCE</type>
</item>
<item id="115" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="116">targetDirectory</name>
<stringValue id="117">tempFileDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="118" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="119">targetFileName</name>
<stringValue id="120">fileName</stringValue>
<type>VARIABLE</type>
</item>
<item id="121" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="122">targetFileSystem</name>
<stringValue id="123">filesystem/local</stringValue>
<type>REFERENCE</type>
</item>
</parameters>
<sources id="124" type="java.util.HashSet">
<item id="125" type="com.j2fe.workflow.definition.Transition">
<name id="126">goto-next</name>
<source id="127">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="128"/>
<directJoin>false</directJoin>
<name id="129">Create Transaction</name>
<nodeHandler>com.j2fe.streetlamp.activities.CreateTransaction</nodeHandler>
<nodeHandlerClass id="130">com.j2fe.streetlamp.activities.CreateTransaction</nodeHandlerClass>
<parameters id="131" type="java.util.HashSet">
<item id="132" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="133">jobId</name>
<stringValue id="134">JobID</stringValue>
<type>VARIABLE</type>
</item>
<item id="135" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="136">originalMessage</name>
<stringValue id="137">OriginalMessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="138" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="139">originalMessageType</name>
<stringValue id="140">OriginalMessageType</stringValue>
<type>VARIABLE</type>
</item>
<item id="141" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="142">transactionId</name>
<stringValue id="143">TransactionID</stringValue>
<type>VARIABLE</type>
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
<name id="149">Create Job</name>
<nodeHandler>com.j2fe.streetlamp.activities.CreateJob</nodeHandler>
<nodeHandlerClass id="150">com.j2fe.streetlamp.activities.CreateJob</nodeHandlerClass>
<parameters id="151" type="java.util.HashSet">
<item id="152" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="153">jobId</name>
<stringValue id="154">JobID</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="155" type="java.util.HashSet">
<item id="156" type="com.j2fe.workflow.definition.Transition">
<name id="157">goto-next</name>
<source id="158">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="159"/>
<directJoin>false</directJoin>
<name id="160">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="161">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="162" type="java.util.HashSet"/>
<targets id="163" type="java.util.HashSet">
<item idref="156" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="147"/>
</item>
</sources>
<targets id="164" type="java.util.HashSet">
<item idref="145" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="127"/>
</item>
</sources>
<targets id="165" type="java.util.HashSet">
<item idref="125" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="98"/>
</item>
</sources>
<targets id="166" type="java.util.HashSet">
<item idref="96" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="84"/>
</item>
</sources>
<targets id="167" type="java.util.HashSet">
<item id="168" type="com.j2fe.workflow.definition.Transition">
<name id="169">FINS</name>
<source idref="84"/>
<target id="170">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="171"/>
<directJoin>false</directJoin>
<name id="172">List Files</name>
<nodeHandler>com.j2fe.feeds.activities.ListFiles</nodeHandler>
<nodeHandlerClass id="173">com.j2fe.feeds.activities.ListFiles</nodeHandlerClass>
<parameters id="174" type="java.util.HashSet">
<item id="175" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="176">directory</name>
<stringValue id="177">tempFileDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="178" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="179">fileSystem</name>
<stringValue id="180">filesystem/local</stringValue>
<type>REFERENCE</type>
</item>
<item id="181" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="182">fileSystemId</name>
<stringValue id="183">fileName</stringValue>
<type>VARIABLE</type>
</item>
<item id="184" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="185">list</name>
<stringValue id="186">FileList</stringValue>
<type>VARIABLE</type>
</item>
<item id="187" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="188">uris</name>
<stringValue id="189">URIList</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="190" type="java.util.HashSet">
<item idref="168" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="191" type="java.util.HashSet">
<item id="192" type="com.j2fe.workflow.definition.Transition">
<name id="193">empty</name>
<source idref="170"/>
<target idref="32"/>
</item>
<item id="194" type="com.j2fe.workflow.definition.Transition">
<name id="195">not-empty</name>
<source idref="170"/>
<target id="196">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="197"/>
<directJoin>false</directJoin>
<name id="198">Extract Data From Alacra Feed</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="199">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="200" type="java.util.HashSet">
<item id="201" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="202">statements</name>
<objectValue id="203" type="java.lang.String">import java.io.BufferedReader;&#13;
import java.io.File;&#13;
import java.io.FileReader;&#13;
import java.io.FileWriter;&#13;
import java.io.IOException;&#13;
import java.io.PrintWriter;&#13;
import java.net.URI;&#13;
import java.net.URISyntaxException;&#13;
import java.util.ArrayList;&#13;
import java.util.HashMap;&#13;
import java.util.Iterator;&#13;
import java.util.List;&#13;
import java.util.Map;&#13;
&#13;
&#13;
BufferedReader inputStream = null;&#13;
File inputFile = new File(File.toString());  &#13;
			inputStream = new BufferedReader(new FileReader(inputFile));&#13;
			String line;&#13;
			int indexGSHibernatingid = 0;&#13;
			int indexAlacra_BB_Primary_id =0;&#13;
			int indexAlacra_BB_Secondary_id =0;&#13;
			List instructionList = new ArrayList();&#13;
			String [] splitLine;&#13;
                    // String  secondaryIDEnabled=enableSecondaryID;&#13;
                     &#13;
                     line=inputStream.readLine();&#13;
			splitLine = line.split("\\|");&#13;
			if(splitLine !=null &amp;&amp; !"".equals(splitLine)) {&#13;
				for (int i=0;i&lt;splitLine.length;i++) {&#13;
					if(splitLine[i] != null &amp;&amp; "GS_OID".equalsIgnoreCase(splitLine[i])) {&#13;
						indexGSHibernatingid=i;&#13;
					}&#13;
					if(splitLine[i] != null &amp;&amp; "ALACRA_BBG_ID_PRIM".equalsIgnoreCase(splitLine[i])) {&#13;
						indexAlacra_BB_Primary_id=i;&#13;
					}&#13;
					if(splitLine[i] != null &amp;&amp; "ALACRA_BBG_ID_SEC".equalsIgnoreCase(splitLine[i])) {&#13;
						indexAlacra_BB_Secondary_id=i;&#13;
					}&#13;
&#13;
				} &#13;
			}&#13;
&#13;
&#13;
			while ((line = inputStream.readLine()) != null) {&#13;
				splitLine = line.split("\\|");&#13;
				String hibernatingEntityOID=null;&#13;
				String survivingAlacraBBGPrimary=null;&#13;
				String survivingAlacraBBGSecondary=null;&#13;
&#13;
				if(splitLine !=null &amp;&amp; indexGSHibernatingid&lt;splitLine.length) {&#13;
					hibernatingEntityOID=splitLine[indexGSHibernatingid];&#13;
				}&#13;
				if(splitLine !=null &amp;&amp; indexAlacra_BB_Primary_id&lt;splitLine.length) {&#13;
					survivingAlacraBBGPrimary=splitLine[indexAlacra_BB_Primary_id];&#13;
				}&#13;
                 &#13;
&#13;
//                   if(enableSecondaryID) {&#13;
//				if(splitLine !=null &amp;&amp; indexAlacra_BB_Secondary_id&lt;splitLine.length) {&#13;
//					survivingAlacraBBGSecondary=splitLine[indexAlacra_BB_Secondary_id];&#13;
//				}&#13;
//                    }&#13;
&#13;
				if(hibernatingEntityOID != null &amp;&amp; !"".equalsIgnoreCase(hibernatingEntityOID) &amp;&amp; survivingAlacraBBGPrimary != null &amp;&amp; !"".equalsIgnoreCase(survivingAlacraBBGPrimary)) {&#13;
					Map entrymap=new HashMap();&#13;
					entrymap.put("hibernatiingOID", hibernatingEntityOID);&#13;
					entrymap.put("survivingBBCMPYID", survivingAlacraBBGPrimary);&#13;
					instructionList.add(entrymap);&#13;
&#13;
				}&#13;
				if(hibernatingEntityOID != null &amp;&amp; !"".equalsIgnoreCase(hibernatingEntityOID) &amp;&amp; survivingAlacraBBGSecondary != null &amp;&amp; !"".equalsIgnoreCase(survivingAlacraBBGSecondary)) {&#13;
					Map entrymap=new HashMap();&#13;
					entrymap.put("hibernatiingOID", hibernatingEntityOID);&#13;
					entrymap.put("survivingBBCMPYID", survivingAlacraBBGSecondary);&#13;
					instructionList.add(entrymap);&#13;
&#13;
				}&#13;
&#13;
			}</objectValue>
<type>CONSTANT</type>
</item>
<item id="204" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="205">variables["File"]</name>
<stringValue id="206">FileList</stringValue>
<type>VARIABLE</type>
<variablePart id="207">[0].name</variablePart>
</item>
<item id="208" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="209">variables["instructionList"]</name>
<stringValue id="210">instructionList</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="211" type="java.util.HashSet">
<item idref="194" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="212" type="java.util.HashSet">
<item id="213" type="com.j2fe.workflow.definition.Transition">
<name id="214">goto-next</name>
<source idref="196"/>
<target id="215">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="216"/>
<directJoin>true</directJoin>
<name id="217">For Each Split</name>
<nodeHandler>com.j2fe.workflow.handler.impl.GenericSplit</nodeHandler>
<nodeHandlerClass id="218">com.j2fe.workflow.handler.impl.GenericSplit</nodeHandlerClass>
<parameters id="219" type="java.util.HashSet">
<item id="220" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="221">input</name>
<stringValue id="222">instructionList</stringValue>
<type>VARIABLE</type>
</item>
<item id="223" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="224">output</name>
<stringValue id="225">mapEntry</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="226" type="java.util.HashSet">
<item idref="213" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="227" type="java.util.HashSet">
<item id="228" type="com.j2fe.workflow.definition.Transition">
<name id="229">goto-next</name>
<source idref="215"/>
<target id="230">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="231"/>
<directJoin>false</directJoin>
<name id="232">Bean Shell Script (Standard) #2</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="233">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="234" type="java.util.HashSet">
<item id="235" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="236">statements</name>
<stringValue id="237">String survivingBBCMPYID=(String) entry.get("survivingBBCMPYID");&#13;
        	String hibernatiingOID=(String) entry.get("hibernatiingOID");</stringValue>
<type>CONSTANT</type>
</item>
<item id="238" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="239">variables["entry"]</name>
<stringValue id="240">mapEntry</stringValue>
<type>VARIABLE</type>
</item>
<item id="241" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="242">["hibernatiingOID"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="243">variables["hibernatiingOID"]</name>
<stringValue id="244">hibernatiingEntity</stringValue>
<type>VARIABLE</type>
</item>
<item id="245" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="246">["survivingBBCMPYID"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="247">variables["survivingBBCMPYID"]</name>
<stringValue id="248">survivingBBCMPYID</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="249" type="java.util.HashSet">
<item idref="228" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="250" type="java.util.HashSet">
<item id="251" type="com.j2fe.workflow.definition.Transition">
<name id="252">goto-next</name>
<source idref="230"/>
<target id="253">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="254"/>
<directJoin>false</directJoin>
<name id="255">Fetch OID for the BBCMPYID</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="256">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="257" type="java.util.HashSet">
<item id="258" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="259">database</name>
<stringValue id="260">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="261" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="262">firstColumnsResult</name>
<stringValue id="263">survivingEntity</stringValue>
<type>VARIABLE</type>
</item>
<item id="264" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="265">indexedParameters[0]</name>
<stringValue id="266">survivingBBCMPYID</stringValue>
<type>VARIABLE</type>
</item>
<item id="267" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="268">querySQL</name>
<stringValue id="269">select INST_MNEM  from ft_t_fiid where FINS_ID=? and DATA_SRC_ID='BB' and END_TMS is null limit 1</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="270" type="java.util.HashSet">
<item idref="251" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="271" type="java.util.HashSet">
<item id="272" type="com.j2fe.workflow.definition.Transition">
<name id="273">nothing-found</name>
<source idref="253"/>
<target id="274">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="275"/>
<directJoin>false</directJoin>
<name id="276">Write Unmatched OID</name>
<nodeHandler>com.j2fe.general.activities.File</nodeHandler>
<nodeHandlerClass id="277">com.j2fe.general.activities.File</nodeHandlerClass>
<parameters id="278" type="java.util.HashSet">
<item id="279" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="280">append</name>
<stringValue id="281">true</stringValue>
<type>CONSTANT</type>
</item>
<item id="282" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="283">directory</name>
<stringValue id="284">outputFileDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="285" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="286">fileName</name>
<stringValue id="287">outputFileName</stringValue>
<type>VARIABLE</type>
</item>
<item id="288" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="289">text</name>
<stringValue id="290">hibernatiingEntity</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="291" type="java.util.HashSet">
<item idref="272" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="292" type="java.util.HashSet">
<item id="293" type="com.j2fe.workflow.definition.Transition">
<name id="294">goto-next</name>
<source idref="274"/>
<target id="295">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="296"/>
<directJoin>false</directJoin>
<name id="297">NOP  #2</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="298">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="299" type="java.util.HashSet">
<item idref="293" type="com.j2fe.workflow.definition.Transition"/>
<item id="300" type="com.j2fe.workflow.definition.Transition">
<name id="301">rows-found</name>
<source id="302">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="303"/>
<directJoin>false</directJoin>
<name id="304">Check if CNST entry already exist</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="305">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="306" type="java.util.HashSet">
<item id="307" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="308">database</name>
<stringValue id="309">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="310" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="311">indexedParameters[0]</name>
<stringValue id="312">hibernatiingEntity</stringValue>
<type>VARIABLE</type>
</item>
<item id="313" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="314">indexedParameters[1]</name>
<stringValue id="315">survivingEntity</stringValue>
<type>VARIABLE</type>
<variablePart id="316">[0]</variablePart>
</item>
<item id="317" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="318">querySQL</name>
<stringValue id="319">select 1 from ft_t_cnst where TBL_ID='FINS' and CONS_CROSS_REF_ID=? and SURVIVING_CROSS_REF_ID=?</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="320" type="java.util.HashSet">
<item id="321" type="com.j2fe.workflow.definition.Transition">
<name id="322">rows-found</name>
<source idref="253"/>
<target idref="302"/>
</item>
</sources>
<targets id="323" type="java.util.HashSet">
<item id="324" type="com.j2fe.workflow.definition.Transition">
<name id="325">nothing-found</name>
<source idref="302"/>
<target id="326">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="327"/>
<directJoin>false</directJoin>
<name id="328">Insert CNST Row</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="329">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="330" type="java.util.HashSet">
<item id="331" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="332">database</name>
<stringValue id="333">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="334" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="335">indexedParameters[0]</name>
<stringValue id="336">hibernatiingEntity</stringValue>
<type>VARIABLE</type>
</item>
<item id="337" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="338">indexedParameters[1]</name>
<stringValue id="339">survivingEntity</stringValue>
<type>VARIABLE</type>
<variablePart id="340">[0]</variablePart>
</item>
<item id="341" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="342">querySQL</name>
<stringValue id="343">Insert into ft_t_cnst (CNST_OID, TBL_ID, CONS_CROSS_REF_ID, HIGHEST_SRC_RANK_NUM, CONS_STAT_TYP, CONS_DATA_SRC_TXT, HIGHEST_DATA_SRC_ID, START_TMS, END_TMS, SURVIVING_CROSS_REF_ID, MERGE_STAT_TYP, LAST_CHG_TMS, LAST_CHG_USR_ID, PROC_NOTES_TXT, USER_CMNT_TXT, MERGE_EXEC_TYP, MERGE_PROC_TYP, PRNT_CNST_OID) values (new_oid(),'FINS',?,1,'NotApplicable', null, null, current_timestamp, null,?,'TO MERGE', current_timestamp,'MERGE', null, null,'BATCH','IssuerMergeInstructions', null)</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="344" type="java.util.HashSet">
<item idref="324" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="345" type="java.util.HashSet">
<item id="346" type="com.j2fe.workflow.definition.Transition">
<name id="347">goto-next</name>
<source idref="326"/>
<target id="348">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="349"/>
<directJoin>true</directJoin>
<name id="350">Synchronize</name>
<nodeHandler>com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandler>
<nodeHandlerClass id="351">com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandlerClass>
<sources id="352" type="java.util.HashSet">
<item idref="346" type="com.j2fe.workflow.definition.Transition"/>
<item id="353" type="com.j2fe.workflow.definition.Transition">
<name id="354">goto-next</name>
<source idref="295"/>
<target idref="348"/>
</item>
</sources>
<targets id="355" type="java.util.HashSet">
<item id="356" type="com.j2fe.workflow.definition.Transition">
<name id="357">goto-next</name>
<source idref="348"/>
<target idref="32"/>
</item>
</targets>
<type>ANDJOIN</type>
</target>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item idref="300" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="295"/>
</item>
</sources>
<targets id="358" type="java.util.HashSet">
<item idref="353" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</target>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item idref="321" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
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
<type>ACTIVITY</type>
</target>
</item>
</targets>
<type>XORSPLIT</type>
</target>
</item>
<item idref="82" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="61"/>
</item>
</sources>
<targets id="359" type="java.util.HashSet">
<item idref="59" type="com.j2fe.workflow.definition.Transition"/>
<item id="360" type="com.j2fe.workflow.definition.Transition">
<name id="361">not-empty</name>
<source idref="61"/>
<target id="362">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="363"/>
<directJoin>false</directJoin>
<name id="364">Extract Data From Alacra Feed</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="365">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="366" type="java.util.HashSet">
<item id="367" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="368">statements</name>
<objectValue id="369" type="java.lang.String">import java.io.BufferedReader;&#13;
import java.io.File;&#13;
import java.io.FileReader;&#13;
import java.io.FileWriter;&#13;
import java.io.IOException;&#13;
import java.io.PrintWriter;&#13;
import java.net.URI;&#13;
import java.net.URISyntaxException;&#13;
import java.util.ArrayList;&#13;
import java.util.HashMap;&#13;
import java.util.Iterator;&#13;
import java.util.List;&#13;
import java.util.Map;&#13;
&#13;
&#13;
BufferedReader inputStream = null;&#13;
File inputFile = new File(File.toString());  &#13;
			inputStream = new BufferedReader(new FileReader(inputFile));&#13;
			String line;&#13;
			int indexGSHibernatingid = 0;&#13;
			int indexAlacra_BB_Primary_id =0;&#13;
			int indexAlacra_BB_Secondary_id =0;&#13;
			List instructionList = new ArrayList();&#13;
			String [] splitLine;&#13;
&#13;
			line=inputStream.readLine();&#13;
			splitLine = line.split("\\|");&#13;
			if(splitLine !=null &amp;&amp; !"".equals(splitLine)) {&#13;
				for (int i=0;i&lt;splitLine.length;i++) {&#13;
					if(splitLine[i] != null &amp;&amp; "GS_OID".equalsIgnoreCase(splitLine[i])) {&#13;
						indexGSHibernatingid=i;&#13;
					}&#13;
					if(splitLine[i] != null &amp;&amp; "ALACRA_BBG_ID_PRIM".equalsIgnoreCase(splitLine[i])) {&#13;
						indexAlacra_BB_Primary_id=i;&#13;
					}&#13;
					if(splitLine[i] != null &amp;&amp; "ALACRA_BBG_ID_SEC".equalsIgnoreCase(splitLine[i])) {&#13;
						indexAlacra_BB_Secondary_id=i;&#13;
					}&#13;
&#13;
				} &#13;
			}&#13;
&#13;
&#13;
			while ((line = inputStream.readLine()) != null) {&#13;
				splitLine = line.split("\\|");&#13;
				String hibernatingEntityOID=null;&#13;
				String survivingAlacraBBGPrimary=null;&#13;
				String survivingAlacraBBGSecondary=null;&#13;
&#13;
				if(splitLine !=null &amp;&amp; indexGSHibernatingid&lt;splitLine.length) {&#13;
					hibernatingEntityOID=splitLine[indexGSHibernatingid];&#13;
				}&#13;
				if(splitLine !=null &amp;&amp; indexAlacra_BB_Primary_id&lt;splitLine.length) {&#13;
					survivingAlacraBBGPrimary=splitLine[indexAlacra_BB_Primary_id];&#13;
				}&#13;
                     //  if(enableSecondaryID) {&#13;
				//if(splitLine !=null &amp;&amp; indexAlacra_BB_Secondary_id&lt;splitLine.length) {&#13;
				//	survivingAlacraBBGSecondary=splitLine[indexAlacra_BB_Secondary_id];&#13;
			//	}&#13;
//}&#13;
				if(hibernatingEntityOID != null &amp;&amp; !"".equalsIgnoreCase(hibernatingEntityOID) &amp;&amp; survivingAlacraBBGPrimary != null &amp;&amp; !"".equalsIgnoreCase(survivingAlacraBBGPrimary)) {&#13;
					Map entrymap=new HashMap();&#13;
					entrymap.put("hibernatiingOID", hibernatingEntityOID);&#13;
					entrymap.put("survivingBBCMPYID", survivingAlacraBBGPrimary);&#13;
					instructionList.add(entrymap);&#13;
&#13;
				}&#13;
				if(hibernatingEntityOID != null &amp;&amp; !"".equalsIgnoreCase(hibernatingEntityOID) &amp;&amp; survivingAlacraBBGSecondary != null &amp;&amp; !"".equalsIgnoreCase(survivingAlacraBBGSecondary)) {&#13;
					Map entrymap=new HashMap();&#13;
					entrymap.put("hibernatiingOID", hibernatingEntityOID);&#13;
					entrymap.put("survivingBBCMPYID", survivingAlacraBBGSecondary);&#13;
					instructionList.add(entrymap);&#13;
&#13;
				}&#13;
&#13;
			}</objectValue>
<type>CONSTANT</type>
</item>
<item id="370" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="371">variables["File"]</name>
<stringValue id="372">FileList</stringValue>
<type>VARIABLE</type>
<variablePart id="373">[0].name</variablePart>
</item>
<item id="374" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="375">variables["instructionList"]</name>
<stringValue id="376">instructionList</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="377" type="java.util.HashSet">
<item idref="360" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="378" type="java.util.HashSet">
<item id="379" type="com.j2fe.workflow.definition.Transition">
<name id="380">goto-next</name>
<source idref="362"/>
<target id="381">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="382"/>
<directJoin>true</directJoin>
<name id="383">For Each Split</name>
<nodeHandler>com.j2fe.workflow.handler.impl.GenericSplit</nodeHandler>
<nodeHandlerClass id="384">com.j2fe.workflow.handler.impl.GenericSplit</nodeHandlerClass>
<parameters id="385" type="java.util.HashSet">
<item id="386" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="387">input</name>
<stringValue id="388">instructionList</stringValue>
<type>VARIABLE</type>
</item>
<item id="389" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="390">output</name>
<stringValue id="391">mapEntry</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="392" type="java.util.HashSet">
<item idref="379" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="393" type="java.util.HashSet">
<item id="394" type="com.j2fe.workflow.definition.Transition">
<name id="395">goto-next</name>
<source idref="381"/>
<target id="396">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="397"/>
<directJoin>false</directJoin>
<name id="398">Bean Shell Script (Standard) #2</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="399">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="400" type="java.util.HashSet">
<item id="401" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="402">statements</name>
<stringValue id="403">String survivingBBCMPYID=(String) entry.get("survivingBBCMPYID");
        	String hibernatiingOID=(String) entry.get("hibernatiingOID");</stringValue>
<type>CONSTANT</type>
</item>
<item id="404" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="405">variables["entry"]</name>
<stringValue id="406">mapEntry</stringValue>
<type>VARIABLE</type>
</item>
<item id="407" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="408">["hibernatiingOID"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="409">variables["hibernatiingOID"]</name>
<stringValue id="410">hibernatiingEntity</stringValue>
<type>VARIABLE</type>
</item>
<item id="411" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="412">["survivingBBCMPYID"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="413">variables["survivingBBCMPYID"]</name>
<stringValue id="414">survivingBBCMPYID</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="415" type="java.util.HashSet">
<item idref="394" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="416" type="java.util.HashSet">
<item id="417" type="com.j2fe.workflow.definition.Transition">
<name id="418">goto-next</name>
<source idref="396"/>
<target id="419">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="420"/>
<directJoin>false</directJoin>
<name id="421">Fetch OID for the BBCMPYID</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="422">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="423" type="java.util.HashSet">
<item id="424" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="425">database</name>
<stringValue id="426">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="427" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="428">firstColumnsResult</name>
<stringValue id="429">survivingEntity</stringValue>
<type>VARIABLE</type>
</item>
<item id="430" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="431">indexedParameters[0]</name>
<stringValue id="432">survivingBBCMPYID</stringValue>
<type>VARIABLE</type>
</item>
<item id="433" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="434">querySQL</name>
<stringValue id="435">select  INSTR_ISSR_ID  from ft_t_irid where ISSR_ID=? and DATA_SRC_ID='BB' and END_TMS is null limit 1</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="436" type="java.util.HashSet">
<item idref="417" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="437" type="java.util.HashSet">
<item id="438" type="com.j2fe.workflow.definition.Transition">
<name id="439">nothing-found</name>
<source idref="419"/>
<target id="440">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="441"/>
<directJoin>false</directJoin>
<name id="442">Write Unmatched OID</name>
<nodeHandler>com.j2fe.general.activities.File</nodeHandler>
<nodeHandlerClass id="443">com.j2fe.general.activities.File</nodeHandlerClass>
<parameters id="444" type="java.util.HashSet">
<item id="445" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="446">append</name>
<stringValue id="447">true</stringValue>
<type>CONSTANT</type>
</item>
<item id="448" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="449">directory</name>
<stringValue id="450">outputFileDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="451" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="452">fileName</name>
<stringValue id="453">outputFileName</stringValue>
<type>VARIABLE</type>
</item>
<item id="454" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="455">text</name>
<stringValue id="456">hibernatiingEntity</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="457" type="java.util.HashSet">
<item idref="438" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="458" type="java.util.HashSet">
<item id="459" type="com.j2fe.workflow.definition.Transition">
<name id="460">goto-next</name>
<source idref="440"/>
<target id="461">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="462"/>
<directJoin>false</directJoin>
<name id="463">NOP</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="464">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="465" type="java.util.HashSet">
<item idref="459" type="com.j2fe.workflow.definition.Transition"/>
<item id="466" type="com.j2fe.workflow.definition.Transition">
<name id="467">rows-found</name>
<source id="468">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="469"/>
<directJoin>false</directJoin>
<name id="470">Check if CNST entry already exist</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="471">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="472" type="java.util.HashSet">
<item id="473" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="474">database</name>
<stringValue id="475">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="476" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="477">indexedParameters[0]</name>
<stringValue id="478">hibernatiingEntity</stringValue>
<type>VARIABLE</type>
</item>
<item id="479" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="480">indexedParameters[1]</name>
<stringValue id="481">survivingEntity</stringValue>
<type>VARIABLE</type>
<variablePart id="482">[0]</variablePart>
</item>
<item id="483" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="484">querySQL</name>
<stringValue id="485">select 1 from ft_t_cnst where TBL_ID='ISSR' and CONS_CROSS_REF_ID=? and SURVIVING_CROSS_REF_ID=?</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="486" type="java.util.HashSet">
<item id="487" type="com.j2fe.workflow.definition.Transition">
<name id="488">rows-found</name>
<source idref="419"/>
<target idref="468"/>
</item>
</sources>
<targets id="489" type="java.util.HashSet">
<item id="490" type="com.j2fe.workflow.definition.Transition">
<name id="491">nothing-found</name>
<source idref="468"/>
<target id="492">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="493"/>
<directJoin>false</directJoin>
<name id="494">Insert CNST Row</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="495">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="496" type="java.util.HashSet">
<item id="497" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="498">database</name>
<stringValue id="499">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="500" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="501">indexedParameters[0]</name>
<stringValue id="502">hibernatiingEntity</stringValue>
<type>VARIABLE</type>
</item>
<item id="503" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="504">indexedParameters[1]</name>
<stringValue id="505">survivingEntity</stringValue>
<type>VARIABLE</type>
<variablePart id="506">[0]</variablePart>
</item>
<item id="507" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="508">querySQL</name>
<stringValue id="509">Insert into ft_t_cnst (CNST_OID, TBL_ID, CONS_CROSS_REF_ID, HIGHEST_SRC_RANK_NUM, CONS_STAT_TYP, CONS_DATA_SRC_TXT, HIGHEST_DATA_SRC_ID, START_TMS, END_TMS, SURVIVING_CROSS_REF_ID, MERGE_STAT_TYP, LAST_CHG_TMS, LAST_CHG_USR_ID, PROC_NOTES_TXT, USER_CMNT_TXT, MERGE_EXEC_TYP, MERGE_PROC_TYP, PRNT_CNST_OID) values (new_oid(),'ISSR',?,1,'NotApplicable', null, null, current_timestamp, null,?,'TO MERGE', current_timestamp,'MERGE', null, null,'BATCH', 'IssuerMergeInstructions', null)</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="510" type="java.util.HashSet">
<item idref="490" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="511" type="java.util.HashSet">
<item id="512" type="com.j2fe.workflow.definition.Transition">
<name id="513">goto-next</name>
<source idref="492"/>
<target id="514">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="515"/>
<directJoin>true</directJoin>
<name id="516">Synchronize</name>
<nodeHandler>com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandler>
<nodeHandlerClass id="517">com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandlerClass>
<sources id="518" type="java.util.HashSet">
<item idref="512" type="com.j2fe.workflow.definition.Transition"/>
<item id="519" type="com.j2fe.workflow.definition.Transition">
<name id="520">goto-next</name>
<source idref="461"/>
<target idref="514"/>
</item>
</sources>
<targets id="521" type="java.util.HashSet">
<item id="522" type="com.j2fe.workflow.definition.Transition">
<name id="523">goto-next</name>
<source idref="514"/>
<target idref="32"/>
</item>
</targets>
<type>ANDJOIN</type>
</target>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item idref="466" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="461"/>
</item>
</sources>
<targets id="524" type="java.util.HashSet">
<item idref="519" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</target>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item idref="487" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
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
<type>ACTIVITY</type>
</target>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="32"/>
</item>
<item idref="192" type="com.j2fe.workflow.definition.Transition"/>
<item idref="522" type="com.j2fe.workflow.definition.Transition"/>
<item idref="356" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="525" type="java.util.HashSet">
<item idref="30" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="21"/>
</item>
</sources>
<targets id="526" type="java.util.HashSet">
<item idref="19" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="10"/>
</item>
</sources>
<targets id="527" type="java.util.HashSet">
<item idref="8" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="3"/>
</item>
</sources>
<targets id="528" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="529">Custom/Dataloads/IssuerMerge</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="530">user1</lastChangeUser>
<lastUpdate id="531">2025-12-01T16:09:38.000+0000</lastUpdate>
<name id="532">IssuerMergeInstructions</name>
<nodes id="533" type="java.util.HashSet">
<item idref="396" type="com.j2fe.workflow.definition.Node"/>
<item idref="230" type="com.j2fe.workflow.definition.Node"/>
<item idref="302" type="com.j2fe.workflow.definition.Node"/>
<item idref="468" type="com.j2fe.workflow.definition.Node"/>
<item idref="10" type="com.j2fe.workflow.definition.Node"/>
<item idref="21" type="com.j2fe.workflow.definition.Node"/>
<item idref="98" type="com.j2fe.workflow.definition.Node"/>
<item idref="147" type="com.j2fe.workflow.definition.Node"/>
<item idref="127" type="com.j2fe.workflow.definition.Node"/>
<item idref="362" type="com.j2fe.workflow.definition.Node"/>
<item idref="196" type="com.j2fe.workflow.definition.Node"/>
<item idref="419" type="com.j2fe.workflow.definition.Node"/>
<item idref="253" type="com.j2fe.workflow.definition.Node"/>
<item idref="215" type="com.j2fe.workflow.definition.Node"/>
<item idref="381" type="com.j2fe.workflow.definition.Node"/>
<item idref="492" type="com.j2fe.workflow.definition.Node"/>
<item idref="326" type="com.j2fe.workflow.definition.Node"/>
<item idref="61" type="com.j2fe.workflow.definition.Node"/>
<item idref="170" type="com.j2fe.workflow.definition.Node"/>
<item idref="32" type="com.j2fe.workflow.definition.Node"/>
<item idref="461" type="com.j2fe.workflow.definition.Node"/>
<item idref="295" type="com.j2fe.workflow.definition.Node"/>
<item idref="158" type="com.j2fe.workflow.definition.Node"/>
<item idref="3" type="com.j2fe.workflow.definition.Node"/>
<item idref="84" type="com.j2fe.workflow.definition.Node"/>
<item idref="514" type="com.j2fe.workflow.definition.Node"/>
<item idref="348" type="com.j2fe.workflow.definition.Node"/>
<item idref="440" type="com.j2fe.workflow.definition.Node"/>
<item idref="274" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>true</optimize>
<parameter id="534" type="java.util.HashMap">
<entry>
<key id="535" type="java.lang.String">File</key>
<value id="536" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="537">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="538" type="java.lang.String">entityType</key>
<value id="539" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="540">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="541">The Entity which needs to be considered for merge. e.g ISSR or FINS. By default the value is ISSR.</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="542" type="java.lang.String">fileName</key>
<value id="543" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="544">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="545">path and file name of the file that needs to be processed.</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="546" type="java.lang.String">outputFileDirectory</key>
<value id="547" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="548">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="549">directory of the file which contains list of OID for which CNST entry is not created.</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="550" type="java.lang.String">outputFileName</key>
<value id="551" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="552">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="553">file which contains list of OID for which CNST entry is not created.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="554" type="java.lang.String">processedFileDirectory</key>
<value id="555" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="556">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="557">path of the directory to put the processed file</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="558" type="java.lang.String">sourceFileDirectory</key>
<value id="559" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="560">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="561">directory of the input file to be processed</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="562" type="java.lang.String">tempFileDirectory</key>
<value id="563" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="564">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="565">path to move the file to a temp directory</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
</parameter>
<permissions id="566" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>false</purgeAtEnd>
<retries>0</retries>
<startNode idref="158"/>
<status>RELEASED</status>
<variables id="567" type="java.util.HashMap">
<entry>
<key id="568" type="java.lang.String">File</key>
<value id="569" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="570">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="571" type="java.lang.String">JobID</key>
<value id="572" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="573">java.lang.Object</className>
<clazz>java.lang.Object</clazz>
<description id="574">jobID of the task</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="575" type="java.lang.String">entityType</key>
<value id="576" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="577">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="578">The Entity which needs to be considered for merge. e.g ISSR or FINS. By default the value is ISSR.</description>
<persistent>false</persistent>
<value id="579" type="java.lang.String">ISSR</value>
</value>
</entry>
<entry>
<key id="580" type="java.lang.String">fileName</key>
<value id="581" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="582">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="583">path and file name of the file that needs to be processed.</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="584" type="java.lang.String">outputFileDirectory</key>
<value id="585" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="586">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="587">directory of the file which contains list of OID for which CNST entry is not created.</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="588" type="java.lang.String">outputFileName</key>
<value id="589" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="590">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="591">file which contains list of OID for which CNST entry is not created.</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="592" type="java.lang.String">processedFileDirectory</key>
<value id="593" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="594">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="595">path of the directory to put the processed file</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="596" type="java.lang.String">sourceFileDirectory</key>
<value id="597" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="598">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="599">directory of the input file to be processed</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="600" type="java.lang.String">tempFileDirectory</key>
<value id="601" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="602">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="603">path to move the file to a temp directory</description>
<persistent>false</persistent>
</value>
</entry>
</variables>
<version>10</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
