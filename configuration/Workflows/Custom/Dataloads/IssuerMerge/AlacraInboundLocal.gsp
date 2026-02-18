<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<goldensource-package version="10.0.0.02">
    <package-comment/>
    <businessobject displayString="6 - V10_FinalTest" type="com.j2fe.workflow.definition.Workflow">
        <com.j2fe.workflow.definition.Workflow id="0">
            <alwaysPersist>true</alwaysPersist>
            <clustered>true</clustered>
            <comment id="1">V10_FinalTest</comment>
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
                            <description idref="3"/>
                            <directJoin>false</directJoin>
                            <name id="10">Close Job</name>
                            <nodeHandler>com.j2fe.streetlamp.activities.CloseJob</nodeHandler>
                            <nodeHandlerClass id="11">com.j2fe.streetlamp.activities.CloseJob</nodeHandlerClass>
                            <parameters id="12" type="java.util.HashSet">
                                <item id="13" type="com.j2fe.workflow.definition.Parameter">
                                    <input>true</input>
                                    <name id="14">jobId</name>
                                    <stringValue id="15">JobID</stringValue>
                                    <type>VARIABLE</type>
                                </item>
                            </parameters>
                            <sources id="16" type="java.util.HashSet">
                                <item id="17" type="com.j2fe.workflow.definition.Transition">
                                    <name id="18">goto-next</name>
                                    <source id="19">
                                        <activation>INVOKE</activation>
                                        <clusteredCall>false</clusteredCall>
                                        <description idref="3"/>
                                        <directJoin>false</directJoin>
                                        <name id="20">Close Transaction</name>
                                        <nodeHandler>com.j2fe.streetlamp.activities.CloseTransaction</nodeHandler>
                                        <nodeHandlerClass id="21">com.j2fe.streetlamp.activities.CloseTransaction</nodeHandlerClass>
                                        <parameters id="22" type="java.util.HashSet">
                                            <item id="23" type="com.j2fe.workflow.definition.Parameter">
                                                <input>true</input>
                                                <name id="24">transactionId</name>
                                                <stringValue id="25">TransactionID</stringValue>
                                                <type>VARIABLE</type>
                                            </item>
                                        </parameters>
                                        <sources id="26" type="java.util.HashSet">
                                            <item id="27" type="com.j2fe.workflow.definition.Transition">
                                                <name id="28">empty</name>
                                                <source id="29">
                                                    <activation>INVOKE</activation>
                                                    <clusteredCall>false</clusteredCall>
                                                    <description idref="3"/>
                                                    <directJoin>false</directJoin>
                                                    <name id="30">List Files</name>
                                                    <nodeHandler>com.j2fe.feeds.activities.ListFiles</nodeHandler>
                                                    <nodeHandlerClass id="31">com.j2fe.feeds.activities.ListFiles</nodeHandlerClass>
                                                    <parameters id="32" type="java.util.HashSet">
                                                        <item id="33" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="34">directory</name>
                                                            <stringValue id="35">AlacraInboundLocalDirectory</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                        <item id="36" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="37">fileSystem</name>
                                                            <stringValue id="38">filesystem/local</stringValue>
                                                            <type>REFERENCE</type>
                                                        </item>
                                                        <item id="39" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>false</input>
                                                            <name id="40">list</name>
                                                            <stringValue id="41">FileList</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                        <item id="42" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="43">pattern[0]</name>
                                                            <stringValue id="44">LocalFileName</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                        <item id="45" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>false</input>
                                                            <name id="46">uris</name>
                                                            <stringValue id="47">URIList</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                    </parameters>
                                                    <sources id="48" type="java.util.HashSet">
                                                        <item id="49" type="com.j2fe.workflow.definition.Transition">
                                                            <name id="50">goto-next</name>
                                                            <source id="51">
                                                                <activation>INVOKE</activation>
                                                                <clusteredCall>false</clusteredCall>
                                                                <description idref="3"/>
                                                                <directJoin>false</directJoin>
                                                                <name id="52">Create Transaction</name>
                                                                <nodeHandler>com.j2fe.streetlamp.activities.CreateTransaction</nodeHandler>
                                                                <nodeHandlerClass id="53">com.j2fe.streetlamp.activities.CreateTransaction</nodeHandlerClass>
                                                                <parameters id="54" type="java.util.HashSet">
                                                                    <item id="55" type="com.j2fe.workflow.definition.Parameter">
                                                                        <input>true</input>
                                                                        <name id="56">jobId</name>
                                                                        <stringValue id="57">JobID</stringValue>
                                                                        <type>VARIABLE</type>
                                                                    </item>
                                                                    <item id="58" type="com.j2fe.workflow.definition.Parameter">
                                                                        <input>false</input>
                                                                        <name id="59">originalMessage</name>
                                                                        <stringValue id="60">OriginalMessage</stringValue>
                                                                        <type>VARIABLE</type>
                                                                    </item>
                                                                    <item id="61" type="com.j2fe.workflow.definition.Parameter">
                                                                        <input>false</input>
                                                                        <name id="62">originalMessageType</name>
                                                                        <stringValue id="63">OriginalMessageType</stringValue>
                                                                        <type>VARIABLE</type>
                                                                    </item>
                                                                    <item id="64" type="com.j2fe.workflow.definition.Parameter">
                                                                        <input>false</input>
                                                                        <name id="65">transactionId</name>
                                                                        <stringValue id="66">TransactionID</stringValue>
                                                                        <type>VARIABLE</type>
                                                                    </item>
                                                                </parameters>
                                                                <sources id="67" type="java.util.HashSet">
                                                                    <item id="68" type="com.j2fe.workflow.definition.Transition">
                                                                        <name id="69">goto-next</name>
                                                                        <source id="70">
                                                                            <activation>INVOKE</activation>
                                                                            <clusteredCall>false</clusteredCall>
                                                                            <description idref="3"/>
                                                                            <directJoin>false</directJoin>
                                                                            <name id="71">Create Job</name>
                                                                            <nodeHandler>com.j2fe.streetlamp.activities.CreateJob</nodeHandler>
                                                                            <nodeHandlerClass id="72">com.j2fe.streetlamp.activities.CreateJob</nodeHandlerClass>
                                                                            <parameters id="73" type="java.util.HashSet">
                                                                                <item id="74" type="com.j2fe.workflow.definition.Parameter">
                                                                                    <input>true</input>
                                                                                    <name id="75">configInfo</name>
                                                                                    <stringValue id="76">AlacraInboundLocal</stringValue>
                                                                                    <type>CONSTANT</type>
                                                                                </item>
                                                                                <item id="77" type="com.j2fe.workflow.definition.Parameter">
                                                                                    <input>true</input>
                                                                                    <name id="78">file</name>
                                                                                    <stringValue id="79">JOB_INPUT_TXT</stringValue>
                                                                                    <type>VARIABLE</type>
                                                                                </item>
                                                                                <item id="80" type="com.j2fe.workflow.definition.Parameter">
                                                                                    <input>false</input>
                                                                                    <name id="81">jobId</name>
                                                                                    <stringValue id="82">JobID</stringValue>
                                                                                    <type>VARIABLE</type>
                                                                                </item>
                                                                                <item id="83" type="com.j2fe.workflow.definition.Parameter">
                                                                                    <input>true</input>
                                                                                    <name id="84">parentJobId</name>
                                                                                    <stringValue id="85">ParentJobID</stringValue>
                                                                                    <type>VARIABLE</type>
                                                                                </item>
                                                                            </parameters>
                                                                            <sources id="86" type="java.util.HashSet">
                                                                                <item id="87" type="com.j2fe.workflow.definition.Transition">
                                                                                    <name id="88">goto-next</name>
                                                                                    <source id="89">
                                                                                        <activation>INVOKE</activation>
                                                                                        <clusteredCall>false</clusteredCall>
                                                                                        <description idref="3"/>
                                                                                        <directJoin>false</directJoin>
                                                                                        <name id="90">Bean Shell Script (Standard)</name>
                                                                                        <nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
                                                                                        <nodeHandlerClass id="91">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
                                                                                        <parameters id="92" type="java.util.HashSet">
                                                                                            <item id="93" type="com.j2fe.workflow.definition.Parameter">
                                                                                                <input>true</input>
                                                                                                <name id="94">statements</name>
                                                                                                <stringValue id="95">String JOB_INPUT_TXT = FilePath + FileName;&#13;
</stringValue>
                                                                                                <type>CONSTANT</type>
                                                                                            </item>
                                                                                            <item id="96" type="com.j2fe.workflow.definition.Parameter">
                                                                                                <input>true</input>
                                                                                                <name id="97">variables["FileName"]</name>
                                                                                                <stringValue id="98">LocalFileName</stringValue>
                                                                                                <type>VARIABLE</type>
                                                                                            </item>
                                                                                            <item id="99" type="com.j2fe.workflow.definition.Parameter">
                                                                                                <input>true</input>
                                                                                                <name id="100">variables["FilePath"]</name>
                                                                                                <stringValue id="101">AlacraInboundLocalDirectory</stringValue>
                                                                                                <type>VARIABLE</type>
                                                                                            </item>
                                                                                            <item id="102" type="com.j2fe.workflow.definition.Parameter">
                                                                                                <input>false</input>
                                                                                                <name id="103">variables["JOB_INPUT_TXT"]</name>
                                                                                                <stringValue id="104">JOB_INPUT_TXT</stringValue>
                                                                                                <type>VARIABLE</type>
                                                                                            </item>
                                                                                        </parameters>
                                                                                        <sources id="105" type="java.util.HashSet">
                                                                                            <item id="106" type="com.j2fe.workflow.definition.Transition">
                                                                                                <name id="107">goto-next</name>
                                                                                                <source id="108">
                                                                                                    <activation>INVOKE</activation>
                                                                                                    <clusteredCall>false</clusteredCall>
                                                                                                    <description idref="3"/>
                                                                                                    <directJoin>false</directJoin>
                                                                                                    <name id="109">Start</name>
                                                                                                    <nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
                                                                                                    <nodeHandlerClass id="110">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
                                                                                                    <sources id="111" type="java.util.HashSet"/>
                                                                                                    <targets id="112" type="java.util.HashSet">
                                                                                                        <item idref="106" type="com.j2fe.workflow.definition.Transition"/>
                                                                                                    </targets>
                                                                                                    <type>START</type>
                                                                                                </source>
                                                                                                <target idref="89"/>
                                                                                            </item>
                                                                                        </sources>
                                                                                        <targets id="113" type="java.util.HashSet">
                                                                                            <item idref="87" type="com.j2fe.workflow.definition.Transition"/>
                                                                                        </targets>
                                                                                        <type>ACTIVITY</type>
                                                                                    </source>
                                                                                    <target idref="70"/>
                                                                                </item>
                                                                            </sources>
                                                                            <targets id="114" type="java.util.HashSet">
                                                                                <item idref="68" type="com.j2fe.workflow.definition.Transition"/>
                                                                            </targets>
                                                                            <type>ACTIVITY</type>
                                                                        </source>
                                                                        <target idref="51"/>
                                                                    </item>
                                                                </sources>
                                                                <targets id="115" type="java.util.HashSet">
                                                                    <item idref="49" type="com.j2fe.workflow.definition.Transition"/>
                                                                </targets>
                                                                <type>ACTIVITY</type>
                                                            </source>
                                                            <target idref="29"/>
                                                        </item>
                                                    </sources>
                                                    <targets id="116" type="java.util.HashSet">
                                                        <item idref="27" type="com.j2fe.workflow.definition.Transition"/>
                                                        <item id="117" type="com.j2fe.workflow.definition.Transition">
                                                            <name id="118">not-empty</name>
                                                            <source idref="29"/>
                                                            <target id="119">
                                                                <activation>INVOKE</activation>
                                                                <clusteredCall>false</clusteredCall>
                                                                <description idref="3"/>
                                                                <directJoin>false</directJoin>
                                                                <name id="120">Extract Data From Alacra Feed</name>
                                                                <nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
                                                                <nodeHandlerClass id="121">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
                                                                <parameters id="122" type="java.util.HashSet">
                                                                    <item id="123" type="com.j2fe.workflow.definition.Parameter">
                                                                        <input>true</input>
                                                                        <name id="124">statements</name>
                                                                        <objectValue id="125" type="java.lang.String">import java.io.BufferedReader;&#13;
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
			int indexVendorID = 0;&#13;
			int indexAlacraID = 0;&#13;
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
					if(splitLine[i] != null &amp;&amp; "VENDOR_ID".equalsIgnoreCase(splitLine[i])) {&#13;
						indexVendorID=i;&#13;
					}&#13;
					if(splitLine[i] != null &amp;&amp; "ALACRA_ID".equalsIgnoreCase(splitLine[i])) {&#13;
						indexAlacraID=i;&#13;
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
				String InboundVendorID=null;&#13;
				String InboundAlacraID=null;&#13;
				String survivingAlacraBBGPrimary=null;&#13;
				String survivingAlacraBBGSecondary=null;&#13;
&#13;
&#13;
				if(splitLine !=null &amp;&amp; indexGSHibernatingid&lt;splitLine.length) {&#13;
					hibernatingEntityOID=splitLine[indexGSHibernatingid];&#13;
				}&#13;
&#13;
				if(splitLine !=null &amp;&amp; indexVendorID&lt;splitLine.length) {&#13;
					InboundVendorID=splitLine[indexVendorID];&#13;
				}&#13;
				if(splitLine !=null &amp;&amp; indexAlacraID&lt;splitLine.length) {&#13;
					InboundAlacraID=splitLine[indexAlacraID];&#13;
				}&#13;
&#13;
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
					entrymap.put("hibernatingOID", hibernatingEntityOID);&#13;
					entrymap.put("survivingBBCMPYID", survivingAlacraBBGPrimary);&#13;
					entrymap.put("InboundVendorID", InboundVendorID);&#13;
					entrymap.put("InboundAlacraID", InboundAlacraID);&#13;
					instructionList.add(entrymap);&#13;
&#13;
				}&#13;
				if(hibernatingEntityOID != null &amp;&amp; !"".equalsIgnoreCase(hibernatingEntityOID) &amp;&amp; survivingAlacraBBGSecondary != null &amp;&amp; !"".equalsIgnoreCase(survivingAlacraBBGSecondary)) {&#13;
					Map entrymap=new HashMap();&#13;
					entrymap.put("hibernatingOID", hibernatingEntityOID);&#13;
					entrymap.put("survivingBBCMPYID", survivingAlacraBBGSecondary);&#13;
					entrymap.put("InboundVendorID", InboundVendorID);&#13;
					entrymap.put("InboundAlacraID", InboundAlacraID);&#13;
					instructionList.add(entrymap);&#13;
&#13;
				}&#13;
&#13;
			}</objectValue>
                                                                        <type>CONSTANT</type>
                                                                    </item>
                                                                    <item id="126" type="com.j2fe.workflow.definition.Parameter">
                                                                        <input>true</input>
                                                                        <name id="127">variables["File"]</name>
                                                                        <stringValue id="128">FileList</stringValue>
                                                                        <type>VARIABLE</type>
                                                                        <variablePart id="129">[0].name</variablePart>
                                                                    </item>
                                                                    <item id="130" type="com.j2fe.workflow.definition.Parameter">
                                                                        <input>false</input>
                                                                        <name id="131">variables["instructionList"]</name>
                                                                        <stringValue id="132">instructionList</stringValue>
                                                                        <type>VARIABLE</type>
                                                                    </item>
                                                                </parameters>
                                                                <sources id="133" type="java.util.HashSet">
                                                                    <item idref="117" type="com.j2fe.workflow.definition.Transition"/>
                                                                </sources>
                                                                <targets id="134" type="java.util.HashSet">
                                                                    <item id="135" type="com.j2fe.workflow.definition.Transition">
                                                                        <name id="136">goto-next</name>
                                                                        <source idref="119"/>
                                                                        <target id="137">
                                                                            <activation>INVOKE</activation>
                                                                            <clusteredCall>false</clusteredCall>
                                                                            <description idref="3"/>
                                                                            <directJoin>true</directJoin>
                                                                            <name id="138">For Each Split</name>
                                                                            <nodeHandler>com.j2fe.workflow.handler.impl.GenericSplit</nodeHandler>
                                                                            <nodeHandlerClass id="139">com.j2fe.workflow.handler.impl.GenericSplit</nodeHandlerClass>
                                                                            <parameters id="140" type="java.util.HashSet">
                                                                                <item id="141" type="com.j2fe.workflow.definition.Parameter">
                                                                                    <input>true</input>
                                                                                    <name id="142">input</name>
                                                                                    <stringValue id="143">instructionList</stringValue>
                                                                                    <type>VARIABLE</type>
                                                                                </item>
                                                                                <item id="144" type="com.j2fe.workflow.definition.Parameter">
                                                                                    <input>false</input>
                                                                                    <name id="145">output</name>
                                                                                    <stringValue id="146">mapEntry</stringValue>
                                                                                    <type>VARIABLE</type>
                                                                                </item>
                                                                            </parameters>
                                                                            <sources id="147" type="java.util.HashSet">
                                                                                <item idref="135" type="com.j2fe.workflow.definition.Transition"/>
                                                                            </sources>
                                                                            <targets id="148" type="java.util.HashSet">
                                                                                <item id="149" type="com.j2fe.workflow.definition.Transition">
                                                                                    <name id="150">goto-next</name>
                                                                                    <source idref="137"/>
                                                                                    <target id="151">
                                                                                        <activation>INVOKE</activation>
                                                                                        <clusteredCall>false</clusteredCall>
                                                                                        <description idref="3"/>
                                                                                        <directJoin>false</directJoin>
                                                                                        <name id="152">Bean Shell Script (Standard) #2</name>
                                                                                        <nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
                                                                                        <nodeHandlerClass id="153">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
                                                                                        <parameters id="154" type="java.util.HashSet">
                                                                                            <item id="155" type="com.j2fe.workflow.definition.Parameter">
                                                                                                <input>true</input>
                                                                                                <name id="156">statements</name>
                                                                                                <stringValue id="157">String survivingBBCMPYID=(String) entry.get("survivingBBCMPYID");&#13;
String hibernatingOID=(String) entry.get("hibernatingOID");&#13;
String InboundAlacraID=(String) entry.get("InboundAlacraID");&#13;
String InboundVendorID=(String) entry.get("InboundVendorID");&#13;
</stringValue>
                                                                                                <type>CONSTANT</type>
                                                                                            </item>
                                                                                            <item id="158" type="com.j2fe.workflow.definition.Parameter">
                                                                                                <input>false</input>
                                                                                                <name id="159">variables["InboundAlacraID"]</name>
                                                                                                <stringValue id="160">InboundAlacraID</stringValue>
                                                                                                <type>VARIABLE</type>
                                                                                            </item>
                                                                                            <item id="161" type="com.j2fe.workflow.definition.Parameter">
                                                                                                <input>false</input>
                                                                                                <name id="162">variables["InboundVendorID"]</name>
                                                                                                <stringValue id="163">InboundVendorID</stringValue>
                                                                                                <type>VARIABLE</type>
                                                                                            </item>
                                                                                            <item id="164" type="com.j2fe.workflow.definition.Parameter">
                                                                                                <input>true</input>
                                                                                                <name id="165">variables["entry"]</name>
                                                                                                <stringValue id="166">mapEntry</stringValue>
                                                                                                <type>VARIABLE</type>
                                                                                            </item>
                                                                                            <item id="167" type="com.j2fe.workflow.definition.Parameter">
                                                                                                <UITypeHint id="168">["hibernatingOID"]@java/lang/String@</UITypeHint>
                                                                                                <input>false</input>
                                                                                                <name id="169">variables["hibernatingOID"]</name>
                                                                                                <stringValue id="170">hibernatingEntity</stringValue>
                                                                                                <type>VARIABLE</type>
                                                                                            </item>
                                                                                            <item id="171" type="com.j2fe.workflow.definition.Parameter">
                                                                                                <UITypeHint id="172">["survivingBBCMPYID"]@java/lang/String@</UITypeHint>
                                                                                                <input>false</input>
                                                                                                <name id="173">variables["survivingBBCMPYID"]</name>
                                                                                                <stringValue id="174">survivingBBCMPYID</stringValue>
                                                                                                <type>VARIABLE</type>
                                                                                            </item>
                                                                                        </parameters>
                                                                                        <persistentVariables id="175" type="java.util.HashSet">
                                                                                            <item id="176" type="java.lang.String">InboundAlacraID
1000</item>
                                                                                        </persistentVariables>
                                                                                        <sources id="177" type="java.util.HashSet">
                                                                                            <item idref="149" type="com.j2fe.workflow.definition.Transition"/>
                                                                                        </sources>
                                                                                        <targets id="178" type="java.util.HashSet">
                                                                                            <item id="179" type="com.j2fe.workflow.definition.Transition">
                                                                                                <name id="180">goto-next</name>
                                                                                                <source idref="151"/>
                                                                                                <target id="181">
                                                                                                    <activation>INVOKE</activation>
                                                                                                    <clusteredCall>false</clusteredCall>
                                                                                                    <description idref="3"/>
                                                                                                    <directJoin>false</directJoin>
                                                                                                    <name id="182">Is Alacra ID 0000000</name>
                                                                                                    <nodeHandler>com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandler>
                                                                                                    <nodeHandlerClass id="183">com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandlerClass>
                                                                                                    <parameters id="184" type="java.util.HashSet">
                                                                                                        <item id="185" type="com.j2fe.workflow.definition.Parameter">
                                                                                                            <input>true</input>
                                                                                                            <name id="186">caseItem</name>
                                                                                                            <stringValue id="187">InboundAlacraID</stringValue>
                                                                                                            <type>VARIABLE</type>
                                                                                                        </item>
                                                                                                        <item id="188" type="com.j2fe.workflow.definition.Parameter">
                                                                                                            <input>true</input>
                                                                                                            <name id="189">defaultItem</name>
                                                                                                            <stringValue id="190">OTHERS</stringValue>
                                                                                                            <type>CONSTANT</type>
                                                                                                        </item>
                                                                                                    </parameters>
                                                                                                    <persistentVariables id="191" type="java.util.HashSet">
                                                                                                        <item id="192" type="java.lang.String">InboundAlacraID
1000</item>
                                                                                                    </persistentVariables>
                                                                                                    <sources id="193" type="java.util.HashSet">
                                                                                                        <item idref="179" type="com.j2fe.workflow.definition.Transition"/>
                                                                                                    </sources>
                                                                                                    <targets id="194" type="java.util.HashSet">
                                                                                                        <item id="195" type="com.j2fe.workflow.definition.Transition">
                                                                                                            <name id="196">0000000</name>
                                                                                                            <source idref="181"/>
                                                                                                            <target id="197">
                                                                                                                <activation>INVOKE</activation>
                                                                                                                <clusteredCall>false</clusteredCall>
                                                                                                                <description idref="3"/>
                                                                                                                <directJoin>false</directJoin>
                                                                                                                <name id="198">Bean Shell Script (Standard)</name>
                                                                                                                <nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
                                                                                                                <nodeHandlerClass id="199">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
                                                                                                                <parameters id="200" type="java.util.HashSet">
                                                                                                                    <item id="201" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                        <input>true</input>
                                                                                                                        <name id="202">statements</name>
                                                                                                                        <stringValue id="203">import java.util.Date;&#13;
&#13;
import java.text.DateFormat;&#13;
&#13;
import java.text.SimpleDateFormat;&#13;
&#13;
DateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");&#13;
&#13;
Date date = new Date();&#13;
&#13;
String FileName = LocalFileName+"_"+ dateFormat.format(date) + ".unmatched";</stringValue>
                                                                                                                        <type>CONSTANT</type>
                                                                                                                    </item>
                                                                                                                    <item id="204" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                        <input>false</input>
                                                                                                                        <name id="205">variables["FileName"]</name>
                                                                                                                        <stringValue id="206">LocalUnmatchedFileName</stringValue>
                                                                                                                        <type>VARIABLE</type>
                                                                                                                    </item>
                                                                                                                    <item id="207" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                        <UITypeHint id="208">["LocalFileName"]@java/lang/String@</UITypeHint>
                                                                                                                        <input>true</input>
                                                                                                                        <name id="209">variables["LocalFileName"]</name>
                                                                                                                        <stringValue id="210">LocalFileName</stringValue>
                                                                                                                        <type>VARIABLE</type>
                                                                                                                    </item>
                                                                                                                </parameters>
                                                                                                                <sources id="211" type="java.util.HashSet">
                                                                                                                    <item idref="195" type="com.j2fe.workflow.definition.Transition"/>
                                                                                                                    <item id="212" type="com.j2fe.workflow.definition.Transition">
                                                                                                                        <name id="213">goto-next</name>
                                                                                                                        <source id="214">
                                                                                                                            <activation>INVOKE</activation>
                                                                                                                            <clusteredCall>false</clusteredCall>
                                                                                                                            <description idref="3"/>
                                                                                                                            <directJoin>false</directJoin>
                                                                                                                            <name id="215">Insert FIID Row</name>
                                                                                                                            <nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
                                                                                                                            <nodeHandlerClass id="216">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
                                                                                                                            <parameters id="217" type="java.util.HashSet">
                                                                                                                                <item id="218" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="219">database</name>
                                                                                                                                    <stringValue id="220">jdbc/GSDM-1</stringValue>
                                                                                                                                    <type>REFERENCE</type>
                                                                                                                                </item>
                                                                                                                                <item id="221" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="222">indexedParameters[0]</name>
                                                                                                                                    <stringValue id="223">hibernatingEntity</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="224" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="225">indexedParameters[1]</name>
                                                                                                                                    <stringValue id="226">InboundAlacraID</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="227" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="228">indexedParameters[2]</name>
                                                                                                                                    <stringValue id="229">InboundVendorID</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="230" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="231">indexedParameters[3]</name>
                                                                                                                                    <stringValue id="232">hibernatingEntity</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="233" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="234">indexedParameters[4]</name>
                                                                                                                                    <stringValue id="235">InboundAlacraID</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="236" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="237">querySQL</name>
                                                                                                                                    <stringValue id="238">INSERT INTO FT_T_FIID &#13;
(FIID_OID, INST_MNEM, FINS_ID_CTXT_TYP, FINS_ID, INST_USAGE_TYP, START_TMS, LAST_CHG_TMS, LAST_CHG_USR_ID, DATA_STAT_TYP, DATA_SRC_ID) &#13;
select   &#13;
   new_oid()&#13;
   ,?&#13;
   ,'ALACRAID'&#13;
   ,?&#13;
   ,?&#13;
   ,sysdate()&#13;
   ,sysdate()&#13;
   ,'AlacraInbound'&#13;
   ,'ACTIVE'&#13;
   ,'ALACRA' from dual where not exists (select 1 from ft_t_fiid where inst_mnem = ? and fins_id = ?)</stringValue>
                                                                                                                                    <type>CONSTANT</type>
                                                                                                                                </item>
                                                                                                                            </parameters>
                                                                                                                            <sources id="239" type="java.util.HashSet">
                                                                                                                                <item id="240" type="com.j2fe.workflow.definition.Transition">
                                                                                                                                    <name id="241">nothing-found</name>
                                                                                                                                    <source id="242">
                                                                                                                                        <activation>INVOKE</activation>
                                                                                                                                        <clusteredCall>false</clusteredCall>
                                                                                                                                        <description idref="3"/>
                                                                                                                                        <directJoin>false</directJoin>
                                                                                                                                        <name id="243">Fetch OID for the BBCMPYID</name>
                                                                                                                                        <nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
                                                                                                                                        <nodeHandlerClass id="244">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
                                                                                                                                        <parameters id="245" type="java.util.HashSet">
                                                                                                                                            <item id="246" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                                <input>true</input>
                                                                                                                                                <name id="247">database</name>
                                                                                                                                                <stringValue id="248">jdbc/GSDM-1</stringValue>
                                                                                                                                                <type>REFERENCE</type>
                                                                                                                                            </item>
                                                                                                                                            <item id="249" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                                <input>false</input>
                                                                                                                                                <name id="250">firstColumnsResult</name>
                                                                                                                                                <stringValue id="251">survivingEntity</stringValue>
                                                                                                                                                <type>VARIABLE</type>
                                                                                                                                            </item>
                                                                                                                                            <item id="252" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                                <input>true</input>
                                                                                                                                                <name id="253">indexedParameters[0]</name>
                                                                                                                                                <stringValue id="254">survivingBBCMPYID</stringValue>
                                                                                                                                                <type>VARIABLE</type>
                                                                                                                                            </item>
                                                                                                                                            <item id="255" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                                <input>true</input>
                                                                                                                                                <name id="256">querySQL</name>
                                                                                                                                                <stringValue id="257">select INST_MNEM  from ft_t_fiid where FINS_ID=? and DATA_SRC_ID='BB' and END_TMS is null Limit 1</stringValue>
                                                                                                                                                <type>CONSTANT</type>
                                                                                                                                            </item>
                                                                                                                                        </parameters>
                                                                                                                                        <persistentVariables id="258" type="java.util.HashSet">
                                                                                                                                            <item id="259" type="java.lang.String">InboundAlacraID
1000</item>
                                                                                                                                            <item id="260" type="java.lang.String">survivingEntity
1000</item>
                                                                                                                                        </persistentVariables>
                                                                                                                                        <sources id="261" type="java.util.HashSet">
                                                                                                                                            <item id="262" type="com.j2fe.workflow.definition.Transition">
                                                                                                                                                <name id="263">OTHERS</name>
                                                                                                                                                <source id="264">
                                                                                                                                                    <activation>INVOKE</activation>
                                                                                                                                                    <clusteredCall>false</clusteredCall>
                                                                                                                                                    <description idref="3"/>
                                                                                                                                                    <directJoin>false</directJoin>
                                                                                                                                                    <name id="265">Is BBCMPYID 0000000</name>
                                                                                                                                                    <nodeHandler>com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandler>
                                                                                                                                                    <nodeHandlerClass id="266">com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandlerClass>
                                                                                                                                                    <parameters id="267" type="java.util.HashSet">
                                                                                                                                                        <item id="268" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                                            <input>true</input>
                                                                                                                                                            <name id="269">caseItem</name>
                                                                                                                                                            <stringValue id="270">survivingBBCMPYID</stringValue>
                                                                                                                                                            <type>VARIABLE</type>
                                                                                                                                                        </item>
                                                                                                                                                        <item id="271" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                                            <input>true</input>
                                                                                                                                                            <name id="272">defaultItem</name>
                                                                                                                                                            <stringValue id="273">OTHERS</stringValue>
                                                                                                                                                            <type>CONSTANT</type>
                                                                                                                                                        </item>
                                                                                                                                                    </parameters>
                                                                                                                                                    <sources id="274" type="java.util.HashSet">
                                                                                                                                                        <item id="275" type="com.j2fe.workflow.definition.Transition">
                                                                                                                                                            <name id="276">OTHERS</name>
                                                                                                                                                            <source idref="181"/>
                                                                                                                                                            <target idref="264"/>
                                                                                                                                                        </item>
                                                                                                                                                    </sources>
                                                                                                                                                    <targets id="277" type="java.util.HashSet">
                                                                                                                                                        <item id="278" type="com.j2fe.workflow.definition.Transition">
                                                                                                                                                            <name id="279">0000000</name>
                                                                                                                                                            <source idref="264"/>
                                                                                                                                                            <target id="280">
                                                                                                                                                                <activation>INVOKE</activation>
                                                                                                                                                                <clusteredCall>false</clusteredCall>
                                                                                                                                                                <description idref="3"/>
                                                                                                                                                                <directJoin>false</directJoin>
                                                                                                                                                                <name id="281">Insert FIID Row</name>
                                                                                                                                                                <nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
                                                                                                                                                                <nodeHandlerClass id="282">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
                                                                                                                                                                <parameters id="283" type="java.util.HashSet">
                                                                                                                                                                    <item id="284" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                                                        <input>true</input>
                                                                                                                                                                        <name id="285">database</name>
                                                                                                                                                                        <stringValue id="286">jdbc/GSDM-1</stringValue>
                                                                                                                                                                        <type>REFERENCE</type>
                                                                                                                                                                    </item>
                                                                                                                                                                    <item id="287" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                                                        <input>true</input>
                                                                                                                                                                        <name id="288">indexedParameters[0]</name>
                                                                                                                                                                        <stringValue id="289">hibernatingEntity</stringValue>
                                                                                                                                                                        <type>VARIABLE</type>
                                                                                                                                                                    </item>
                                                                                                                                                                    <item id="290" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                                                        <input>true</input>
                                                                                                                                                                        <name id="291">indexedParameters[1]</name>
                                                                                                                                                                        <stringValue id="292">InboundAlacraID</stringValue>
                                                                                                                                                                        <type>VARIABLE</type>
                                                                                                                                                                    </item>
                                                                                                                                                                    <item id="293" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                                                        <input>true</input>
                                                                                                                                                                        <name id="294">indexedParameters[2]</name>
                                                                                                                                                                        <stringValue id="295">InboundVendorID</stringValue>
                                                                                                                                                                        <type>VARIABLE</type>
                                                                                                                                                                    </item>
                                                                                                                                                                    <item id="296" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                                                        <input>true</input>
                                                                                                                                                                        <name id="297">indexedParameters[3]</name>
                                                                                                                                                                        <stringValue id="298">hibernatingEntity</stringValue>
                                                                                                                                                                        <type>VARIABLE</type>
                                                                                                                                                                    </item>
                                                                                                                                                                    <item id="299" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                                                        <input>true</input>
                                                                                                                                                                        <name id="300">indexedParameters[4]</name>
                                                                                                                                                                        <stringValue id="301">InboundAlacraID</stringValue>
                                                                                                                                                                        <type>VARIABLE</type>
                                                                                                                                                                    </item>
                                                                                                                                                                    <item id="302" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                                                        <input>true</input>
                                                                                                                                                                        <name id="303">querySQL</name>
                                                                                                                                                                        <stringValue id="304">INSERT INTO FT_T_FIID &#13;
(FIID_OID, INST_MNEM, FINS_ID_CTXT_TYP, FINS_ID, INST_USAGE_TYP, START_TMS, LAST_CHG_TMS, LAST_CHG_USR_ID, DATA_STAT_TYP, DATA_SRC_ID) &#13;
select   &#13;
   new_oid()&#13;
   ,?&#13;
   ,'ALACRAID'&#13;
   ,?&#13;
   ,?&#13;
   ,sysdate()&#13;
   ,sysdate()&#13;
   ,'AlacraInboundLocal'&#13;
   ,'ACTIVE'&#13;
   ,'ALACRA' from dual where not exists (select 1 from ft_t_fiid where inst_mnem = ? and fins_id = ?)</stringValue>
                                                                                                                                                                        <type>CONSTANT</type>
                                                                                                                                                                    </item>
                                                                                                                                                                </parameters>
                                                                                                                                                                <sources id="305" type="java.util.HashSet">
                                                                                                                                                                    <item idref="278" type="com.j2fe.workflow.definition.Transition"/>
                                                                                                                                                                </sources>
                                                                                                                                                                <targets id="306" type="java.util.HashSet">
                                                                                                                                                                    <item id="307" type="com.j2fe.workflow.definition.Transition">
                                                                                                                                                                        <name id="308">goto-next</name>
                                                                                                                                                                        <source idref="280"/>
                                                                                                                                                                        <target id="309">
                                                                                                                                                                            <activation>INVOKE</activation>
                                                                                                                                                                            <clusteredCall>false</clusteredCall>
                                                                                                                                                                            <description idref="3"/>
                                                                                                                                                                            <directJoin>true</directJoin>
                                                                                                                                                                            <name id="310">Synchronize</name>
                                                                                                                                                                            <nodeHandler>com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandler>
                                                                                                                                                                            <nodeHandlerClass id="311">com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandlerClass>
                                                                                                                                                                            <sources id="312" type="java.util.HashSet">
                                                                                                                                                                                <item idref="307" type="com.j2fe.workflow.definition.Transition"/>
                                                                                                                                                                                <item id="313" type="com.j2fe.workflow.definition.Transition">
                                                                                                                                                                                    <name id="314">goto-next</name>
                                                                                                                                                                                    <source id="315">
                                                                                                                                                                                        <activation>INVOKE</activation>
                                                                                                                                                                                        <clusteredCall>false</clusteredCall>
                                                                                                                                                                                        <description idref="3"/>
                                                                                                                                                                                        <directJoin>false</directJoin>
                                                                                                                                                                                        <name id="316">Insert FIID Row</name>
                                                                                                                                                                                        <nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
                                                                                                                                                                                        <nodeHandlerClass id="317">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
                                                                                                                                                                                        <parameters id="318" type="java.util.HashSet">
                                                                                                                                                                                            <item id="319" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                                                                                <input>true</input>
                                                                                                                                                                                                <name id="320">database</name>
                                                                                                                                                                                                <stringValue id="321">jdbc/GSDM-1</stringValue>
                                                                                                                                                                                                <type>REFERENCE</type>
                                                                                                                                                                                            </item>
                                                                                                                                                                                            <item id="322" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                                                                                <input>true</input>
                                                                                                                                                                                                <name id="323">indexedParameters[0]</name>
                                                                                                                                                                                                <stringValue id="324">survivingEntity</stringValue>
                                                                                                                                                                                                <type>VARIABLE</type>
                                                                                                                                                                                                <variablePart id="325">[0]</variablePart>
                                                                                                                                                                                            </item>
                                                                                                                                                                                            <item id="326" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                                                                                <input>true</input>
                                                                                                                                                                                                <name id="327">indexedParameters[1]</name>
                                                                                                                                                                                                <stringValue id="328">InboundAlacraID</stringValue>
                                                                                                                                                                                                <type>VARIABLE</type>
                                                                                                                                                                                            </item>
                                                                                                                                                                                            <item id="329" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                                                                                <input>true</input>
                                                                                                                                                                                                <name id="330">indexedParameters[2]</name>
                                                                                                                                                                                                <stringValue id="331">InboundVendorID</stringValue>
                                                                                                                                                                                                <type>VARIABLE</type>
                                                                                                                                                                                            </item>
                                                                                                                                                                                            <item id="332" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                                                                                <input>true</input>
                                                                                                                                                                                                <name id="333">indexedParameters[3]</name>
                                                                                                                                                                                                <stringValue id="334">survivingEntity</stringValue>
                                                                                                                                                                                                <type>VARIABLE</type>
                                                                                                                                                                                                <variablePart id="335">[0]</variablePart>
                                                                                                                                                                                            </item>
                                                                                                                                                                                            <item id="336" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                                                                                <input>true</input>
                                                                                                                                                                                                <name id="337">indexedParameters[4]</name>
                                                                                                                                                                                                <stringValue id="338">InboundAlacraID</stringValue>
                                                                                                                                                                                                <type>VARIABLE</type>
                                                                                                                                                                                            </item>
                                                                                                                                                                                            <item id="339" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                                                                                <input>true</input>
                                                                                                                                                                                                <name id="340">querySQL</name>
                                                                                                                                                                                                <stringValue id="341">INSERT INTO FT_T_FIID &#13;
(FIID_OID, INST_MNEM, FINS_ID_CTXT_TYP, FINS_ID, INST_USAGE_TYP, START_TMS, LAST_CHG_TMS, LAST_CHG_USR_ID, DATA_STAT_TYP, DATA_SRC_ID) &#13;
select   &#13;
   new_oid()&#13;
   ,?&#13;
   ,'ALACRAID'&#13;
   ,?&#13;
   ,?&#13;
   ,sysdate()&#13;
   ,sysdate()&#13;
   ,'AlacraInboundLocal'&#13;
   ,'ACTIVE'&#13;
   ,'ALACRA' from dual where not exists (select 1 from ft_t_fiid where inst_mnem = ? and fins_id = ?)</stringValue>
                                                                                                                                                                                                <type>CONSTANT</type>
                                                                                                                                                                                            </item>
                                                                                                                                                                                        </parameters>
                                                                                                                                                                                        <persistentVariables id="342" type="java.util.HashSet">
                                                                                                                                                                                            <item id="343" type="java.lang.String">InboundAlacraID
1000</item>
                                                                                                                                                                                            <item id="344" type="java.lang.String">survivingEntity
1000</item>
                                                                                                                                                                                        </persistentVariables>
                                                                                                                                                                                        <sources id="345" type="java.util.HashSet">
                                                                                                                                                                                            <item id="346" type="com.j2fe.workflow.definition.Transition">
                                                                                                                                                                                                <name id="347">goto-next</name>
                                                                                                                                                                                                <source id="348">
                                                                                                                                                                                                    <activation>INVOKE</activation>
                                                                                                                                                                                                    <clusteredCall>false</clusteredCall>
                                                                                                                                                                                                    <description idref="3"/>
                                                                                                                                                                                                    <directJoin>false</directJoin>
                                                                                                                                                                                                    <name id="349">Insert CNST Row</name>
                                                                                                                                                                                                    <nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
                                                                                                                                                                                                    <nodeHandlerClass id="350">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
                                                                                                                                                                                                    <parameters id="351" type="java.util.HashSet">
                                                                                                                                                                                                        <item id="352" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                                                                                            <input>true</input>
                                                                                                                                                                                                            <name id="353">database</name>
                                                                                                                                                                                                            <stringValue id="354">jdbc/GSDM-1</stringValue>
                                                                                                                                                                                                            <type>REFERENCE</type>
                                                                                                                                                                                                        </item>
                                                                                                                                                                                                        <item id="355" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                                                                                            <input>true</input>
                                                                                                                                                                                                            <name id="356">indexedParameters[0]</name>
                                                                                                                                                                                                            <stringValue id="357">hibernatingEntity</stringValue>
                                                                                                                                                                                                            <type>VARIABLE</type>
                                                                                                                                                                                                        </item>
                                                                                                                                                                                                        <item id="358" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                                                                                            <input>true</input>
                                                                                                                                                                                                            <name id="359">indexedParameters[1]</name>
                                                                                                                                                                                                            <stringValue id="360">survivingEntity</stringValue>
                                                                                                                                                                                                            <type>VARIABLE</type>
                                                                                                                                                                                                            <variablePart id="361">[0]</variablePart>
                                                                                                                                                                                                        </item>
                                                                                                                                                                                                        <item id="362" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                                                                                            <input>true</input>
                                                                                                                                                                                                            <name id="363">querySQL</name>
                                                                                                                                                                                                            <stringValue id="364">Insert into ft_t_cnst (CNST_OID, TBL_ID, CONS_CROSS_REF_ID, HIGHEST_SRC_RANK_NUM, CONS_STAT_TYP, CONS_DATA_SRC_TXT, HIGHEST_DATA_SRC_ID, 
START_TMS, END_TMS, SURVIVING_CROSS_REF_ID, MERGE_STAT_TYP, LAST_CHG_TMS, LAST_CHG_USR_ID, PROC_NOTES_TXT, USER_CMNT_TXT, MERGE_EXEC_TYP, MERGE_PROC_TYP, PRNT_CNST_OID) 
select new_oid(),'FINS',?,1,'NotApplicable', null, null, sysdate(), null,?,'TO MERGE', sysdate(),'AlacraInboundLocal', null, null,'BATCH', null, null 
from dual where not exists(
select 1 from ft_t_cnst where TBL_ID='FINS' and CONS_CROSS_REF_ID=? and SURVIVING_CROSS_REF_ID=?)</stringValue>
                                                                                                                                                                                                            <type>CONSTANT</type>
                                                                                                                                                                                                        </item>
                                                                                                                                                                                                    </parameters>
                                                                                                                                                                                                    <persistentVariables id="365" type="java.util.HashSet">
                                                                                                                                                                                                        <item id="366" type="java.lang.String">InboundAlacraID
1000</item>
                                                                                                                                                                                                        <item id="367" type="java.lang.String">survivingEntity
1000</item>
                                                                                                                                                                                                    </persistentVariables>
                                                                                                                                                                                                    <sources id="368" type="java.util.HashSet">
                                                                                                                                                                                                        <item id="369" type="com.j2fe.workflow.definition.Transition">
                                                                                                                                                                                                            <name id="370">nothing-found</name>
                                                                                                                                                                                                            <source id="371">
                                                                                                                                                                                                                <activation>INVOKE</activation>
                                                                                                                                                                                                                <clusteredCall>false</clusteredCall>
                                                                                                                                                                                                                <description idref="3"/>
                                                                                                                                                                                                                <directJoin>false</directJoin>
                                                                                                                                                                                                                <name id="372">Check if CNST entry already exist</name>
                                                                                                                                                                                                                <nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
                                                                                                                                                                                                                <nodeHandlerClass id="373">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
                                                                                                                                                                                                                <parameters id="374" type="java.util.HashSet">
                                                                                                                                                                                                                    <item id="375" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                                                                                                        <input>true</input>
                                                                                                                                                                                                                        <name id="376">database</name>
                                                                                                                                                                                                                        <stringValue id="377">jdbc/GSDM-1</stringValue>
                                                                                                                                                                                                                        <type>REFERENCE</type>
                                                                                                                                                                                                                    </item>
                                                                                                                                                                                                                    <item id="378" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                                                                                                        <input>true</input>
                                                                                                                                                                                                                        <name id="379">indexedParameters[0]</name>
                                                                                                                                                                                                                        <stringValue id="380">hibernatingEntity</stringValue>
                                                                                                                                                                                                                        <type>VARIABLE</type>
                                                                                                                                                                                                                    </item>
                                                                                                                                                                                                                    <item id="381" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                                                                                                        <input>true</input>
                                                                                                                                                                                                                        <name id="382">indexedParameters[1]</name>
                                                                                                                                                                                                                        <stringValue id="383">survivingEntity</stringValue>
                                                                                                                                                                                                                        <type>VARIABLE</type>
                                                                                                                                                                                                                        <variablePart id="384">[0]</variablePart>
                                                                                                                                                                                                                    </item>
                                                                                                                                                                                                                    <item id="385" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                                                                                                        <input>true</input>
                                                                                                                                                                                                                        <name id="386">querySQL</name>
                                                                                                                                                                                                                        <stringValue id="387">select 1 from ft_t_cnst where TBL_ID='FINS' and CONS_CROSS_REF_ID=? and SURVIVING_CROSS_REF_ID=?</stringValue>
                                                                                                                                                                                                                        <type>CONSTANT</type>
                                                                                                                                                                                                                    </item>
                                                                                                                                                                                                                </parameters>
                                                                                                                                                                                                                <persistentVariables id="388" type="java.util.HashSet">
                                                                                                                                                                                                                    <item id="389" type="java.lang.String">InboundAlacraID
1000</item>
                                                                                                                                                                                                                    <item id="390" type="java.lang.String">survivingEntity
1000</item>
                                                                                                                                                                                                                </persistentVariables>
                                                                                                                                                                                                                <sources id="391" type="java.util.HashSet">
                                                                                                                                                                                                                    <item id="392" type="com.j2fe.workflow.definition.Transition">
                                                                                                                                                                                                                        <name id="393">rows-found</name>
                                                                                                                                                                                                                        <source idref="242"/>
                                                                                                                                                                                                                        <target idref="371"/>
                                                                                                                                                                                                                    </item>
                                                                                                                                                                                                                </sources>
                                                                                                                                                                                                                <targets id="394" type="java.util.HashSet">
                                                                                                                                                                                                                    <item idref="369" type="com.j2fe.workflow.definition.Transition"/>
                                                                                                                                                                                                                    <item id="395" type="com.j2fe.workflow.definition.Transition">
                                                                                                                                                                                                                        <name id="396">rows-found</name>
                                                                                                                                                                                                                        <source idref="371"/>
                                                                                                                                                                                                                        <target idref="309"/>
                                                                                                                                                                                                                    </item>
                                                                                                                                                                                                                </targets>
                                                                                                                                                                                                                <type>XORSPLIT</type>
                                                                                                                                                                                                            </source>
                                                                                                                                                                                                            <target idref="348"/>
                                                                                                                                                                                                        </item>
                                                                                                                                                                                                    </sources>
                                                                                                                                                                                                    <targets id="397" type="java.util.HashSet">
                                                                                                                                                                                                        <item idref="346" type="com.j2fe.workflow.definition.Transition"/>
                                                                                                                                                                                                    </targets>
                                                                                                                                                                                                    <type>ACTIVITY</type>
                                                                                                                                                                                                </source>
                                                                                                                                                                                                <target idref="315"/>
                                                                                                                                                                                            </item>
                                                                                                                                                                                        </sources>
                                                                                                                                                                                        <targets id="398" type="java.util.HashSet">
                                                                                                                                                                                            <item idref="313" type="com.j2fe.workflow.definition.Transition"/>
                                                                                                                                                                                        </targets>
                                                                                                                                                                                        <type>ACTIVITY</type>
                                                                                                                                                                                    </source>
                                                                                                                                                                                    <target idref="309"/>
                                                                                                                                                                                </item>
                                                                                                                                                                                <item id="399" type="com.j2fe.workflow.definition.Transition">
                                                                                                                                                                                    <name id="400">goto-next</name>
                                                                                                                                                                                    <source id="401">
                                                                                                                                                                                        <activation>INVOKE</activation>
                                                                                                                                                                                        <clusteredCall>false</clusteredCall>
                                                                                                                                                                                        <description idref="3"/>
                                                                                                                                                                                        <directJoin>false</directJoin>
                                                                                                                                                                                        <name id="402">Write Unmatched OID</name>
                                                                                                                                                                                        <nodeHandler>com.j2fe.general.activities.File</nodeHandler>
                                                                                                                                                                                        <nodeHandlerClass id="403">com.j2fe.general.activities.File</nodeHandlerClass>
                                                                                                                                                                                        <parameters id="404" type="java.util.HashSet">
                                                                                                                                                                                            <item id="405" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                                                                                <input>true</input>
                                                                                                                                                                                                <name id="406">append</name>
                                                                                                                                                                                                <stringValue id="407">true</stringValue>
                                                                                                                                                                                                <type>CONSTANT</type>
                                                                                                                                                                                            </item>
                                                                                                                                                                                            <item id="408" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                                                                                <input>true</input>
                                                                                                                                                                                                <name id="409">directory</name>
                                                                                                                                                                                                <stringValue id="410">outputFileDirectory</stringValue>
                                                                                                                                                                                                <type>VARIABLE</type>
                                                                                                                                                                                            </item>
                                                                                                                                                                                            <item id="411" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                                                                                <input>true</input>
                                                                                                                                                                                                <name id="412">fileName</name>
                                                                                                                                                                                                <stringValue id="413">LocalUnmatchedFileName</stringValue>
                                                                                                                                                                                                <type>VARIABLE</type>
                                                                                                                                                                                            </item>
                                                                                                                                                                                            <item id="414" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                                                                                <input>true</input>
                                                                                                                                                                                                <name id="415">text</name>
                                                                                                                                                                                                <stringValue id="416">hibernatingEntity</stringValue>
                                                                                                                                                                                                <type>VARIABLE</type>
                                                                                                                                                                                            </item>
                                                                                                                                                                                        </parameters>
                                                                                                                                                                                        <persistentVariables id="417" type="java.util.HashSet">
                                                                                                                                                                                            <item id="418" type="java.lang.String">InboundAlacraID
1000</item>
                                                                                                                                                                                        </persistentVariables>
                                                                                                                                                                                        <sources id="419" type="java.util.HashSet">
                                                                                                                                                                                            <item id="420" type="com.j2fe.workflow.definition.Transition">
                                                                                                                                                                                                <name id="421">goto-next</name>
                                                                                                                                                                                                <source idref="197"/>
                                                                                                                                                                                                <target idref="401"/>
                                                                                                                                                                                            </item>
                                                                                                                                                                                        </sources>
                                                                                                                                                                                        <targets id="422" type="java.util.HashSet">
                                                                                                                                                                                            <item idref="399" type="com.j2fe.workflow.definition.Transition"/>
                                                                                                                                                                                        </targets>
                                                                                                                                                                                        <type>ACTIVITY</type>
                                                                                                                                                                                    </source>
                                                                                                                                                                                    <target idref="309"/>
                                                                                                                                                                                </item>
                                                                                                                                                                                <item idref="395" type="com.j2fe.workflow.definition.Transition"/>
                                                                                                                                                                            </sources>
                                                                                                                                                                            <targets id="423" type="java.util.HashSet">
                                                                                                                                                                                <item id="424" type="com.j2fe.workflow.definition.Transition">
                                                                                                                                                                                    <name id="425">goto-next</name>
                                                                                                                                                                                    <source idref="309"/>
                                                                                                                                                                                    <target id="426">
                                                                                                                                                                                        <activation>INVOKE</activation>
                                                                                                                                                                                        <clusteredCall>false</clusteredCall>
                                                                                                                                                                                        <description idref="3"/>
                                                                                                                                                                                        <directJoin>false</directJoin>
                                                                                                                                                                                        <name id="427">Move File To Processed</name>
                                                                                                                                                                                        <nodeHandler>com.j2fe.general.activities.FileOperator</nodeHandler>
                                                                                                                                                                                        <nodeHandlerClass id="428">com.j2fe.general.activities.FileOperator</nodeHandlerClass>
                                                                                                                                                                                        <parameters id="429" type="java.util.HashSet">
                                                                                                                                                                                            <item id="430" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                                                                                <input>true</input>
                                                                                                                                                                                                <name id="431">operationToPerform</name>
                                                                                                                                                                                                <stringValue id="432">Move</stringValue>
                                                                                                                                                                                                <type>CONSTANT</type>
                                                                                                                                                                                            </item>
                                                                                                                                                                                            <item id="433" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                                                                                <input>true</input>
                                                                                                                                                                                                <name id="434">sourceDirectory</name>
                                                                                                                                                                                                <stringValue id="435">AlacraInboundLocalDirectory</stringValue>
                                                                                                                                                                                                <type>VARIABLE</type>
                                                                                                                                                                                            </item>
                                                                                                                                                                                            <item id="436" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                                                                                <input>true</input>
                                                                                                                                                                                                <name id="437">sourceFileName</name>
                                                                                                                                                                                                <stringValue id="438">LocalFileName</stringValue>
                                                                                                                                                                                                <type>VARIABLE</type>
                                                                                                                                                                                            </item>
                                                                                                                                                                                            <item id="439" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                                                                                <input>true</input>
                                                                                                                                                                                                <name id="440">sourceFileSystem</name>
                                                                                                                                                                                                <stringValue id="441">filesystem/local</stringValue>
                                                                                                                                                                                                <type>REFERENCE</type>
                                                                                                                                                                                            </item>
                                                                                                                                                                                            <item id="442" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                                                                                <input>true</input>
                                                                                                                                                                                                <name id="443">targetDirectory</name>
                                                                                                                                                                                                <stringValue id="444">AlacraInboundProcessedDirectory</stringValue>
                                                                                                                                                                                                <type>VARIABLE</type>
                                                                                                                                                                                            </item>
                                                                                                                                                                                            <item id="445" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                                                                                <input>true</input>
                                                                                                                                                                                                <name id="446">targetFileName</name>
                                                                                                                                                                                                <stringValue id="447">AlacraResponseFileName</stringValue>
                                                                                                                                                                                                <type>VARIABLE</type>
                                                                                                                                                                                            </item>
                                                                                                                                                                                            <item id="448" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                                                                                <input>true</input>
                                                                                                                                                                                                <name id="449">targetFileSystem</name>
                                                                                                                                                                                                <stringValue id="450">filesystem/local</stringValue>
                                                                                                                                                                                                <type>REFERENCE</type>
                                                                                                                                                                                            </item>
                                                                                                                                                                                        </parameters>
                                                                                                                                                                                        <sources id="451" type="java.util.HashSet">
                                                                                                                                                                                            <item idref="424" type="com.j2fe.workflow.definition.Transition"/>
                                                                                                                                                                                        </sources>
                                                                                                                                                                                        <targets id="452" type="java.util.HashSet">
                                                                                                                                                                                            <item id="453" type="com.j2fe.workflow.definition.Transition">
                                                                                                                                                                                                <name id="454">goto-next</name>
                                                                                                                                                                                                <source idref="426"/>
                                                                                                                                                                                                <target idref="19"/>
                                                                                                                                                                                            </item>
                                                                                                                                                                                        </targets>
                                                                                                                                                                                        <type>ACTIVITY</type>
                                                                                                                                                                                    </target>
                                                                                                                                                                                </item>
                                                                                                                                                                            </targets>
                                                                                                                                                                            <type>ANDJOIN</type>
                                                                                                                                                                        </target>
                                                                                                                                                                    </item>
                                                                                                                                                                </targets>
                                                                                                                                                                <type>ACTIVITY</type>
                                                                                                                                                            </target>
                                                                                                                                                        </item>
                                                                                                                                                        <item idref="262" type="com.j2fe.workflow.definition.Transition"/>
                                                                                                                                                    </targets>
                                                                                                                                                    <type>XORSPLIT</type>
                                                                                                                                                </source>
                                                                                                                                                <target idref="242"/>
                                                                                                                                            </item>
                                                                                                                                        </sources>
                                                                                                                                        <targets id="455" type="java.util.HashSet">
                                                                                                                                            <item idref="240" type="com.j2fe.workflow.definition.Transition"/>
                                                                                                                                            <item idref="392" type="com.j2fe.workflow.definition.Transition"/>
                                                                                                                                        </targets>
                                                                                                                                        <type>XORSPLIT</type>
                                                                                                                                    </source>
                                                                                                                                    <target idref="214"/>
                                                                                                                                </item>
                                                                                                                            </sources>
                                                                                                                            <targets id="456" type="java.util.HashSet">
                                                                                                                                <item idref="212" type="com.j2fe.workflow.definition.Transition"/>
                                                                                                                            </targets>
                                                                                                                            <type>ACTIVITY</type>
                                                                                                                        </source>
                                                                                                                        <target idref="197"/>
                                                                                                                    </item>
                                                                                                                </sources>
                                                                                                                <targets id="457" type="java.util.HashSet">
                                                                                                                    <item idref="420" type="com.j2fe.workflow.definition.Transition"/>
                                                                                                                </targets>
                                                                                                                <type>ACTIVITY</type>
                                                                                                            </target>
                                                                                                        </item>
                                                                                                        <item idref="275" type="com.j2fe.workflow.definition.Transition"/>
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
                                                <target idref="19"/>
                                            </item>
                                            <item idref="453" type="com.j2fe.workflow.definition.Transition"/>
                                        </sources>
                                        <targets id="458" type="java.util.HashSet">
                                            <item idref="17" type="com.j2fe.workflow.definition.Transition"/>
                                        </targets>
                                        <type>ACTIVITY</type>
                                    </source>
                                    <target idref="9"/>
                                </item>
                            </sources>
                            <targets id="459" type="java.util.HashSet">
                                <item idref="7" type="com.j2fe.workflow.definition.Transition"/>
                            </targets>
                            <type>ACTIVITY</type>
                        </source>
                        <target idref="2"/>
                    </item>
                </sources>
                <targets id="460" type="java.util.HashSet"/>
                <type>END</type>
            </endNode>
            <forcePurgeAtEnd>false</forcePurgeAtEnd>
            <group id="461">Custom/Dataloads/IssuerMerge</group>
            <haltOnError>false</haltOnError>
            <lastChangeUser id="462">user1</lastChangeUser>
            <lastUpdate id="463">2025-07-04T11:00:48.000+0000</lastUpdate>
            <name id="464">AlacraInboundLocal</name>
            <nodes id="465" type="java.util.HashSet">
                <item idref="89" type="com.j2fe.workflow.definition.Node"/>
                <item idref="197" type="com.j2fe.workflow.definition.Node"/>
                <item idref="151" type="com.j2fe.workflow.definition.Node"/>
                <item idref="371" type="com.j2fe.workflow.definition.Node"/>
                <item idref="9" type="com.j2fe.workflow.definition.Node"/>
                <item idref="19" type="com.j2fe.workflow.definition.Node"/>
                <item idref="70" type="com.j2fe.workflow.definition.Node"/>
                <item idref="51" type="com.j2fe.workflow.definition.Node"/>
                <item idref="119" type="com.j2fe.workflow.definition.Node"/>
                <item idref="242" type="com.j2fe.workflow.definition.Node"/>
                <item idref="137" type="com.j2fe.workflow.definition.Node"/>
                <item idref="348" type="com.j2fe.workflow.definition.Node"/>
                <item idref="214" type="com.j2fe.workflow.definition.Node"/>
                <item idref="315" type="com.j2fe.workflow.definition.Node"/>
                <item idref="280" type="com.j2fe.workflow.definition.Node"/>
                <item idref="181" type="com.j2fe.workflow.definition.Node"/>
                <item idref="264" type="com.j2fe.workflow.definition.Node"/>
                <item idref="29" type="com.j2fe.workflow.definition.Node"/>
                <item idref="426" type="com.j2fe.workflow.definition.Node"/>
                <item idref="108" type="com.j2fe.workflow.definition.Node"/>
                <item idref="2" type="com.j2fe.workflow.definition.Node"/>
                <item idref="309" type="com.j2fe.workflow.definition.Node"/>
                <item idref="401" type="com.j2fe.workflow.definition.Node"/>
            </nodes>
            <optimize>true</optimize>
            <parameter id="466" type="java.util.HashMap">
                <entry>
                    <key id="467" type="java.lang.String">AlacraInboundLocalDirectory</key>
                    <value id="468" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="469">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description idref="3"/>
                        <input>true</input>
                        <output>false</output>
                        <required>true</required>
                    </value>
                </entry>
                <entry>
                    <key id="470" type="java.lang.String">AlacraInboundProcessedDirectory</key>
                    <value id="471" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="472">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description id="473">path of the directory to put the processed file</description>
                        <input>true</input>
                        <output>false</output>
                        <required>true</required>
                    </value>
                </entry>
                <entry>
                    <key id="474" type="java.lang.String">LocalFileName</key>
                    <value id="475" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="476">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <input>true</input>
                        <output>false</output>
                        <required>true</required>
                    </value>
                </entry>
                <entry>
                    <key id="477" type="java.lang.String">ParentJobID</key>
                    <value id="478" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="479">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <input>true</input>
                        <output>false</output>
                        <required>true</required>
                    </value>
                </entry>
                <entry>
                    <key id="480" type="java.lang.String">entityType</key>
                    <value id="481" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="482">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description id="483">The Entity which needs to be considered for merge. e.g ISSR or FINS. By default the value is ISSR.</description>
                        <input>true</input>
                        <output>false</output>
                        <required>true</required>
                    </value>
                </entry>
                <entry>
                    <key id="484" type="java.lang.String">outputFileDirectory</key>
                    <value id="485" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="486">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description id="487">directory of the file which contains list of OID for which CNST entry is not created.</description>
                        <input>true</input>
                        <output>false</output>
                        <required>true</required>
                    </value>
                </entry>
                <entry>
                    <key id="488" type="java.lang.String">outputFileName</key>
                    <value id="489" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="490">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description id="491">file which contains list of OID for which CNST entry is not created.</description>
                        <input>true</input>
                        <output>false</output>
                        <required>false</required>
                    </value>
                </entry>
            </parameter>
            <permissions id="492" type="java.util.HashSet"/>
            <priority>50</priority>
            <purgeAtEnd>false</purgeAtEnd>
            <retries>0</retries>
            <startNode idref="108"/>
            <status>RELEASED</status>
            <variables id="493" type="java.util.HashMap">
                <entry>
                    <key id="494" type="java.lang.String">AlacraInboundLocalDirectory</key>
                    <value id="495" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="496">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description idref="3"/>
                        <persistent>false</persistent>
                        <value id="497" type="java.lang.String">/gold/app/AlacraInboundLocal/AlacraInboundLocalDirectory</value>
                    </value>
                </entry>
                <entry>
                    <key id="498" type="java.lang.String">AlacraInboundProcessedDirectory</key>
                    <value id="499" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="500">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description id="501">path of the directory to put the processed file</description>
                        <persistent>false</persistent>
                        <value id="502" type="java.lang.String">/gold/app/AlacraInboundLocal/AlacraInboundProcessedDirectory</value>
                    </value>
                </entry>
                <entry>
                    <key id="503" type="java.lang.String">JobID</key>
                    <value id="504" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="505">java.lang.Object</className>
                        <clazz>java.lang.Object</clazz>
                        <description id="506">jobID of the task</description>
                        <persistent>false</persistent>
                    </value>
                </entry>
                <entry>
                    <key id="507" type="java.lang.String">LocalFileName</key>
                    <value id="508" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="509">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <persistent>false</persistent>
                    </value>
                </entry>
                <entry>
                    <key id="510" type="java.lang.String">ParentJobID</key>
                    <value id="511" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="512">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <persistent>false</persistent>
                    </value>
                </entry>
                <entry>
                    <key id="513" type="java.lang.String">entityType</key>
                    <value id="514" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="515">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description id="516">The Entity which needs to be considered for merge. e.g ISSR or FINS. By default the value is ISSR.</description>
                        <persistent>false</persistent>
                        <value id="517" type="java.lang.String">FINS</value>
                    </value>
                </entry>
                <entry>
                    <key id="518" type="java.lang.String">outputFileDirectory</key>
                    <value id="519" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="520">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description id="521">directory of the file which contains list of OID for which CNST entry is not created.</description>
                        <persistent>false</persistent>
                        <value id="522" type="java.lang.String">/gold/app/AlacraInboundLocal/outputFileDirectory</value>
                    </value>
                </entry>
                <entry>
                    <key id="523" type="java.lang.String">outputFileName</key>
                    <value id="524" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="525">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description id="526">file which contains list of OID for which CNST entry is not created.</description>
                        <persistent>false</persistent>
                    </value>
                </entry>
            </variables>
            <version>6</version>
        </com.j2fe.workflow.definition.Workflow>
    </businessobject>
</goldensource-package>
