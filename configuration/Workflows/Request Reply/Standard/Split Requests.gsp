<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<goldensource-package version="10.0.0.02">
    <package-comment/>
    <businessobject displayString="9 - Chnaged_vendorResquest" type="com.j2fe.workflow.definition.Workflow">
        <com.j2fe.workflow.definition.Workflow id="0">
            <alwaysPersist>false</alwaysPersist>
            <clustered>false</clustered>
            <comment id="1">Chnaged_vendorResquest</comment>
            <description id="2">The Split Requests workflow splits the created Requests, sets the Status of the created Vendor Requests to REQUESTING and dependent on the Vendor the Requests should be made to calls the Vendor specific Workflow.</description>
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
                        <name id="9">end-loop</name>
                        <source id="10">
                            <activation>INVOKE</activation>
                            <clusteredCall>false</clusteredCall>
                            <description idref="4"/>
                            <directJoin>false</directJoin>
                            <name id="11">For Loop</name>
                            <nodeHandler>com.j2fe.workflow.handler.impl.ForEach</nodeHandler>
                            <nodeHandlerClass id="12">com.j2fe.workflow.handler.impl.ForEach</nodeHandlerClass>
                            <parameters id="13" type="java.util.HashSet">
                                <item id="14" type="com.j2fe.workflow.definition.Parameter">
                                    <input>true</input>
                                    <name id="15">counter</name>
                                    <stringValue id="16">loopCounter</stringValue>
                                    <type>VARIABLE</type>
                                </item>
                                <item id="17" type="com.j2fe.workflow.definition.Parameter">
                                    <input>false</input>
                                    <name id="18">counter</name>
                                    <stringValue id="19">loopCounter</stringValue>
                                    <type>VARIABLE</type>
                                </item>
                                <item id="20" type="com.j2fe.workflow.definition.Parameter">
                                    <input>true</input>
                                    <name id="21">incrementValue</name>
                                    <stringValue id="22">NoOfFilesToRunInParallel</stringValue>
                                    <type>VARIABLE</type>
                                </item>
                                <item id="23" type="com.j2fe.workflow.definition.Parameter">
                                    <input>true</input>
                                    <name id="24">input</name>
                                    <stringValue id="25">Requests</stringValue>
                                    <type>VARIABLE</type>
                                </item>
                                <item id="26" type="com.j2fe.workflow.definition.Parameter">
                                    <input>false</input>
                                    <name id="27">output</name>
                                    <stringValue id="28">Output</stringValue>
                                    <type>VARIABLE</type>
                                </item>
                                <item id="29" type="com.j2fe.workflow.definition.Parameter">
                                    <input>false</input>
                                    <name id="30">outputObjects</name>
                                    <stringValue id="31">IncrementedObjects</stringValue>
                                    <type>VARIABLE</type>
                                </item>
                                <item id="32" type="com.j2fe.workflow.definition.Parameter">
                                    <input>true</input>
                                    <name id="33">resetOnEnd</name>
                                    <objectValue id="34" type="java.lang.Boolean">true</objectValue>
                                    <type>CONSTANT</type>
                                </item>
                            </parameters>
                            <persistentVariables id="35" type="java.util.HashSet">
                                <item id="36" type="java.lang.String">loopCounter
1100</item>
                            </persistentVariables>
                            <sources id="37" type="java.util.HashSet">
                                <item id="38" type="com.j2fe.workflow.definition.Transition">
                                    <name id="39">goto-next</name>
                                    <source id="40">
                                        <activation>INVOKE</activation>
                                        <clusteredCall>false</clusteredCall>
                                        <description idref="4"/>
                                        <directJoin>false</directJoin>
                                        <name id="41">Merge</name>
                                        <nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
                                        <nodeHandlerClass id="42">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
                                        <sources id="43" type="java.util.HashSet">
                                            <item id="44" type="com.j2fe.workflow.definition.Transition">
                                                <name id="45">goto-next</name>
                                                <source id="46">
                                                    <activation>INVOKE</activation>
                                                    <clusteredCall>false</clusteredCall>
                                                    <description idref="4"/>
                                                    <directJoin>false</directJoin>
                                                    <name id="47">Merge Maps</name>
                                                    <nodeHandler>com.j2fe.translation.activities.MergeMaps</nodeHandler>
                                                    <nodeHandlerClass id="48">com.j2fe.translation.activities.MergeMaps</nodeHandlerClass>
                                                    <parameters id="49" type="java.util.HashSet">
                                                        <item id="50" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="51">inputMap["PricePointEventDefinitionId"]</name>
                                                            <stringValue id="52">PricePointEventDefinitionId</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                        <item id="53" type="com.j2fe.workflow.definition.Parameter">
                                                            <UITypeHint id="54">["ProcessingDate"]@java/lang/Object@</UITypeHint>
                                                            <input>true</input>
                                                            <name id="55">inputMap["ProcessingDate"]</name>
                                                            <stringValue id="56">processingDateString</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                        <item id="57" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="58">outputMap</name>
                                                            <stringValue id="59">MessageMetaData</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                    </parameters>
                                                    <sources id="60" type="java.util.HashSet">
                                                        <item id="61" type="com.j2fe.workflow.definition.Transition">
                                                            <name id="62">goto-next</name>
                                                            <source id="63">
                                                                <activation>INVOKE</activation>
                                                                <clusteredCall>false</clusteredCall>
                                                                <description idref="4"/>
                                                                <directJoin>false</directJoin>
                                                                <name id="64">Bean Shell Script (Standard) #2</name>
                                                                <nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
                                                                <nodeHandlerClass id="65">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
                                                                <parameters id="66" type="java.util.HashSet">
                                                                    <item id="67" type="com.j2fe.workflow.definition.Parameter">
                                                                        <input>true</input>
                                                                        <name id="68">statements</name>
                                                                        <objectValue id="69" type="java.lang.String">import java.text.ParseException;&#13;
import java.text.SimpleDateFormat;&#13;
import org.apache.log4j.Logger;&#13;
import java.util.Date;&#13;
&#13;
&#13;
&#13;
&#13;
Logger logger = Logger.getLogger(String.class);&#13;
&#13;
String processingDateString =null;&#13;
&#13;
if(processingDate== null)&#13;
{&#13;
	if(messageMetaData !=null)&#13;
	processingDateString  = messageMetaData.get("ProcessingDate");&#13;
}&#13;
if(processingDate!= null)&#13;
{&#13;
	try&#13;
	{&#13;
		processingDateString  = new SimpleDateFormat("MM-dd-yyyy hh:mm:ss a").format(processingDate);&#13;
	}&#13;
	catch (ParseException e) &#13;
   	 {&#13;
        	logger.error(e.getMessage());&#13;
    	}&#13;
}&#13;
&#13;
if(messageMetaData==null  )&#13;
{&#13;
	messageMetaData= new HashMap(); &#13;
}&#13;
&#13;
logger.debug("BBUploadDirectory" + bbUploadDirectory + "BBDownloadDirectory" + bbDownloadDirectory + "BBResponseTimeout" + bbResponseTimeout +&#13;
 "StoreRequestFileonLocal"+ storeRequestFileonLocal + "StoreRequestFileLocalDirectory" + storeRequestFileLocalDirectory + &#13;
 "RequestTransaction" + requestTransaction + "RemoveDuplicateFieldsFlag" + removeDuplicateFieldsFlag +&#13;
 "ProcessFilteredMessages" + processFilteredMessages + "JobDefinitionId" + jobDefinitionId +&#13;
 "ExcludeFields" + excludeFields + "IsConnectionFailOver" + isConnectionFailOver&#13;
+ "ParticipantPurposeType" +participantPurposeType + "MaxRetryTime" + maxRetryTime );&#13;
&#13;
&#13;
int loopCounter =0;</objectValue>
                                                                        <type>CONSTANT</type>
                                                                    </item>
                                                                    <item id="70" type="com.j2fe.workflow.definition.Parameter">
                                                                        <input>true</input>
                                                                        <name id="71">variables["bbDownloadDirectory"]</name>
                                                                        <stringValue id="72">BBDownloadDirectory</stringValue>
                                                                        <type>VARIABLE</type>
                                                                    </item>
                                                                    <item id="73" type="com.j2fe.workflow.definition.Parameter">
                                                                        <input>true</input>
                                                                        <name id="74">variables["bbResponseTimeout"]</name>
                                                                        <stringValue id="75">BBResponseTimeout</stringValue>
                                                                        <type>VARIABLE</type>
                                                                    </item>
                                                                    <item id="76" type="com.j2fe.workflow.definition.Parameter">
                                                                        <input>true</input>
                                                                        <name id="77">variables["bbUploadDirectory"]</name>
                                                                        <stringValue id="78">BBUploadDirectory</stringValue>
                                                                        <type>VARIABLE</type>
                                                                    </item>
                                                                    <item id="79" type="com.j2fe.workflow.definition.Parameter">
                                                                        <input>true</input>
                                                                        <name id="80">variables["excludeFields"]</name>
                                                                        <stringValue id="81">ExcludeFields</stringValue>
                                                                        <type>VARIABLE</type>
                                                                    </item>
                                                                    <item id="82" type="com.j2fe.workflow.definition.Parameter">
                                                                        <input>true</input>
                                                                        <name id="83">variables["isConnectionFailOver"]</name>
                                                                        <stringValue id="84">IsConnectionFailOver</stringValue>
                                                                        <type>VARIABLE</type>
                                                                    </item>
                                                                    <item id="85" type="com.j2fe.workflow.definition.Parameter">
                                                                        <input>true</input>
                                                                        <name id="86">variables["jobDefinitionId"]</name>
                                                                        <stringValue id="87">JobDefinitionId</stringValue>
                                                                        <type>VARIABLE</type>
                                                                    </item>
                                                                    <item id="88" type="com.j2fe.workflow.definition.Parameter">
                                                                        <input>false</input>
                                                                        <name id="89">variables["loopCounter"]</name>
                                                                        <stringValue id="90">loopCounter</stringValue>
                                                                        <type>VARIABLE</type>
                                                                    </item>
                                                                    <item id="91" type="com.j2fe.workflow.definition.Parameter">
                                                                        <input>true</input>
                                                                        <name id="92">variables["maxRetryTime"]</name>
                                                                        <stringValue id="93">MaxRetryTime</stringValue>
                                                                        <type>VARIABLE</type>
                                                                    </item>
                                                                    <item id="94" type="com.j2fe.workflow.definition.Parameter">
                                                                        <input>true</input>
                                                                        <name id="95">variables["messageMetaData"]</name>
                                                                        <stringValue id="96">MessageMetaData</stringValue>
                                                                        <type>VARIABLE</type>
                                                                    </item>
                                                                    <item id="97" type="com.j2fe.workflow.definition.Parameter">
                                                                        <input>false</input>
                                                                        <name id="98">variables["messageMetaData"]</name>
                                                                        <stringValue id="99">MessageMetaData</stringValue>
                                                                        <type>VARIABLE</type>
                                                                    </item>
                                                                    <item id="100" type="com.j2fe.workflow.definition.Parameter">
                                                                        <input>true</input>
                                                                        <name id="101">variables["participantPurposeType"]</name>
                                                                        <stringValue id="102">ParticipantPurposeType</stringValue>
                                                                        <type>VARIABLE</type>
                                                                    </item>
                                                                    <item id="103" type="com.j2fe.workflow.definition.Parameter">
                                                                        <input>true</input>
                                                                        <name id="104">variables["processFilteredMessages"]</name>
                                                                        <stringValue id="105">ProcessFilteredMessages</stringValue>
                                                                        <type>VARIABLE</type>
                                                                    </item>
                                                                    <item id="106" type="com.j2fe.workflow.definition.Parameter">
                                                                        <UITypeHint id="107">["processingDate"]@java/lang/Object@</UITypeHint>
                                                                        <input>true</input>
                                                                        <name id="108">variables["processingDate"]</name>
                                                                        <stringValue id="109">ProcessingDate</stringValue>
                                                                        <type>VARIABLE</type>
                                                                    </item>
                                                                    <item id="110" type="com.j2fe.workflow.definition.Parameter">
                                                                        <input>false</input>
                                                                        <name id="111">variables["processingDateString"]</name>
                                                                        <stringValue id="112">processingDateString</stringValue>
                                                                        <type>VARIABLE</type>
                                                                    </item>
                                                                    <item id="113" type="com.j2fe.workflow.definition.Parameter">
                                                                        <input>true</input>
                                                                        <name id="114">variables["removeDuplicateFieldsFlag"]</name>
                                                                        <stringValue id="115">RemoveDuplicateFieldsFlag</stringValue>
                                                                        <type>VARIABLE</type>
                                                                    </item>
                                                                    <item id="116" type="com.j2fe.workflow.definition.Parameter">
                                                                        <input>true</input>
                                                                        <name id="117">variables["requestTransaction"]</name>
                                                                        <stringValue id="118">RequestTransaction</stringValue>
                                                                        <type>VARIABLE</type>
                                                                    </item>
                                                                    <item id="119" type="com.j2fe.workflow.definition.Parameter">
                                                                        <input>true</input>
                                                                        <name id="120">variables["storeRequestFileLocalDirectory"]</name>
                                                                        <stringValue id="121">StoreRequestFileLocalDirectory</stringValue>
                                                                        <type>VARIABLE</type>
                                                                    </item>
                                                                    <item id="122" type="com.j2fe.workflow.definition.Parameter">
                                                                        <input>true</input>
                                                                        <name id="123">variables["storeRequestFileonLocal"]</name>
                                                                        <stringValue id="124">StoreRequestFileonLocal</stringValue>
                                                                        <type>VARIABLE</type>
                                                                    </item>
                                                                </parameters>
                                                                <sources id="125" type="java.util.HashSet">
                                                                    <item id="126" type="com.j2fe.workflow.definition.Transition">
                                                                        <name id="127">goto-next</name>
                                                                        <source id="128">
                                                                            <activation>INVOKE</activation>
                                                                            <clusteredCall>false</clusteredCall>
                                                                            <description idref="4"/>
                                                                            <directJoin>false</directJoin>
                                                                            <name id="129">Start</name>
                                                                            <nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
                                                                            <nodeHandlerClass id="130">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
                                                                            <sources id="131" type="java.util.HashSet"/>
                                                                            <targets id="132" type="java.util.HashSet">
                                                                                <item idref="126" type="com.j2fe.workflow.definition.Transition"/>
                                                                            </targets>
                                                                            <type>START</type>
                                                                        </source>
                                                                        <target idref="63"/>
                                                                    </item>
                                                                </sources>
                                                                <targets id="133" type="java.util.HashSet">
                                                                    <item idref="61" type="com.j2fe.workflow.definition.Transition"/>
                                                                </targets>
                                                                <type>ACTIVITY</type>
                                                            </source>
                                                            <target idref="46"/>
                                                        </item>
                                                    </sources>
                                                    <targets id="134" type="java.util.HashSet">
                                                        <item idref="44" type="com.j2fe.workflow.definition.Transition"/>
                                                    </targets>
                                                    <type>ACTIVITY</type>
                                                </source>
                                                <target idref="40"/>
                                            </item>
                                            <item id="135" type="com.j2fe.workflow.definition.Transition">
                                                <name id="136">goto-next</name>
                                                <source id="137">
                                                    <activation>ASYNCHRONOUS</activation>
                                                    <clusteredCall>false</clusteredCall>
                                                    <description idref="4"/>
                                                    <directJoin>true</directJoin>
                                                    <name id="138">Split Requests - Join</name>
                                                    <nodeHandler>com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandler>
                                                    <nodeHandlerClass id="139">com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandlerClass>
                                                    <sources id="140" type="java.util.HashSet">
                                                        <item id="141" type="com.j2fe.workflow.definition.Transition">
                                                            <name id="142">goto-next</name>
                                                            <source id="143">
                                                                <activation>INVOKE</activation>
                                                                <clusteredCall>false</clusteredCall>
                                                                <description idref="4"/>
                                                                <directJoin>false</directJoin>
                                                                <name id="144">BB SCHEDULED</name>
                                                                <nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
                                                                <nodeHandlerClass id="145">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
                                                                <parameters id="146" type="java.util.HashSet">
                                                                    <item id="147" type="com.j2fe.workflow.definition.Parameter">
                                                                        <UITypeHint id="148">["AllRequestOIDs"]@[Ljava/lang/String;@</UITypeHint>
                                                                        <input>true</input>
                                                                        <name id="149">input["AllRequestOIDs"]</name>
                                                                        <stringValue id="150">RequestContent</stringValue>
                                                                        <type>VARIABLE</type>
                                                                        <variablePart id="151">oids</variablePart>
                                                                    </item>
                                                                    <item id="152" type="com.j2fe.workflow.definition.Parameter">
                                                                        <UITypeHint id="153">["BusinessFeed"]@java/lang/String@</UITypeHint>
                                                                        <input>true</input>
                                                                        <name id="154">input["BusinessFeed"]</name>
                                                                        <stringValue id="155">RequestContent</stringValue>
                                                                        <type>VARIABLE</type>
                                                                        <variablePart id="156">businessFeed</variablePart>
                                                                    </item>
                                                                    <item id="157" type="com.j2fe.workflow.definition.Parameter">
                                                                        <UITypeHint id="158">["DownloadDirectory"]@java/lang/String@</UITypeHint>
                                                                        <input>true</input>
                                                                        <name id="159">input["DownloadDirectory"]</name>
                                                                        <stringValue id="160">BBDownloadDirectory</stringValue>
                                                                        <type>VARIABLE</type>
                                                                    </item>
                                                                    <item id="161" type="com.j2fe.workflow.definition.Parameter">
                                                                        <UITypeHint id="162">["FilePattern"]@java/lang/String@</UITypeHint>
                                                                        <input>true</input>
                                                                        <name id="163">input["FilePattern"]</name>
                                                                        <stringValue id="164">RequestContent</stringValue>
                                                                        <type>VARIABLE</type>
                                                                        <variablePart id="165">filePattern</variablePart>
                                                                    </item>
                                                                    <item id="166" type="com.j2fe.workflow.definition.Parameter">
                                                                        <UITypeHint id="167">["FileSystemName"]@java/lang/String@</UITypeHint>
                                                                        <input>true</input>
                                                                        <name id="168">input["FileSystemName"]</name>
                                                                        <stringValue id="169">FileSystemName</stringValue>
                                                                        <type>VARIABLE</type>
                                                                    </item>
                                                                    <item id="170" type="com.j2fe.workflow.definition.Parameter">
                                                                        <UITypeHint id="171">["MaxRetryTime"]@java/lang/Integer@</UITypeHint>
                                                                        <input>true</input>
                                                                        <name id="172">input["MaxRetryTime"]</name>
                                                                        <stringValue id="173">MaxRetryTime</stringValue>
                                                                        <type>VARIABLE</type>
                                                                    </item>
                                                                    <item id="174" type="com.j2fe.workflow.definition.Parameter">
                                                                        <UITypeHint id="175">["MessageMetaData"]@java/util/Map@</UITypeHint>
                                                                        <input>true</input>
                                                                        <name id="176">input["MessageMetaData"]</name>
                                                                        <stringValue id="177">MessageMetaData</stringValue>
                                                                        <type>VARIABLE</type>
                                                                    </item>
                                                                    <item id="178" type="com.j2fe.workflow.definition.Parameter">
                                                                        <UITypeHint id="179">["Parent Job Id"]@java/lang/String@</UITypeHint>
                                                                        <input>true</input>
                                                                        <name id="180">input["Parent Job Id"]</name>
                                                                        <stringValue id="181">Parent Job Id</stringValue>
                                                                        <type>VARIABLE</type>
                                                                    </item>
                                                                    <item id="182" type="com.j2fe.workflow.definition.Parameter">
                                                                        <UITypeHint id="183">["PricePointEventDefinitionId"]@java/lang/String@</UITypeHint>
                                                                        <input>true</input>
                                                                        <name id="184">input["PricePointEventDefinitionId"]</name>
                                                                        <stringValue id="185">PricePointEventDefinitionId</stringValue>
                                                                        <type>VARIABLE</type>
                                                                    </item>
                                                                    <item id="186" type="com.j2fe.workflow.definition.Parameter">
                                                                        <UITypeHint id="187">["ProcessResFile"]@java/lang/Boolean@</UITypeHint>
                                                                        <input>true</input>
                                                                        <name id="188">input["ProcessResFile"]</name>
                                                                        <stringValue id="189">ProcessResFile</stringValue>
                                                                        <type>VARIABLE</type>
                                                                    </item>
                                                                    <item id="190" type="com.j2fe.workflow.definition.Parameter">
                                                                        <UITypeHint id="191">["ProcessResponseFileImmediately"]@java/lang/Boolean@</UITypeHint>
                                                                        <input>true</input>
                                                                        <name id="192">input["ProcessResponseFileImmediately"]</name>
                                                                        <stringValue id="193">ProcessResponseFileImmediately</stringValue>
                                                                        <type>VARIABLE</type>
                                                                    </item>
                                                                    <item id="194" type="com.j2fe.workflow.definition.Parameter">
                                                                        <UITypeHint id="195">["RequestTransaction"]@java/lang/String@</UITypeHint>
                                                                        <input>true</input>
                                                                        <name id="196">input["RequestTransaction"]</name>
                                                                        <stringValue id="197">RequestTransaction</stringValue>
                                                                        <type>VARIABLE</type>
                                                                    </item>
                                                                    <item id="198" type="com.j2fe.workflow.definition.Parameter">
                                                                        <UITypeHint id="199">["ResponseFileName"]@java/lang/String@</UITypeHint>
                                                                        <input>true</input>
                                                                        <name id="200">input["ResponseFileName"]</name>
                                                                        <stringValue id="201">BBResponseFileName</stringValue>
                                                                        <type>VARIABLE</type>
                                                                    </item>
                                                                    <item id="202" type="com.j2fe.workflow.definition.Parameter">
                                                                        <UITypeHint id="203">["StoreRequestFileLocalDirectory"]@java/lang/String@</UITypeHint>
                                                                        <input>true</input>
                                                                        <name id="204">input["StoreRequestFileLocalDirectory"]</name>
                                                                        <stringValue id="205">StoreRequestFileLocalDirectory</stringValue>
                                                                        <type>VARIABLE</type>
                                                                    </item>
                                                                    <item id="206" type="com.j2fe.workflow.definition.Parameter">
                                                                        <UITypeHint id="207">["StoreRequestFileonLocal"]@java/lang/Boolean@</UITypeHint>
                                                                        <input>true</input>
                                                                        <name id="208">input["StoreRequestFileonLocal"]</name>
                                                                        <stringValue id="209">StoreRequestFileonLocal</stringValue>
                                                                        <type>VARIABLE</type>
                                                                    </item>
                                                                    <item id="210" type="com.j2fe.workflow.definition.Parameter">
                                                                        <UITypeHint id="211">["UploadDirectory"]@java/lang/String@</UITypeHint>
                                                                        <input>true</input>
                                                                        <name id="212">input["UploadDirectory"]</name>
                                                                        <stringValue id="213">BBUploadDirectory</stringValue>
                                                                        <type>VARIABLE</type>
                                                                    </item>
                                                                    <item id="214" type="com.j2fe.workflow.definition.Parameter">
                                                                        <UITypeHint id="215">["VendorRequestString"]@java/lang/String@</UITypeHint>
                                                                        <input>true</input>
                                                                        <name id="216">input["VendorRequestString"]</name>
                                                                        <stringValue id="217">RequestContent</stringValue>
                                                                        <type>VARIABLE</type>
                                                                        <variablePart id="218">requestXmlString</variablePart>
                                                                    </item>
                                                                    <item id="219" type="com.j2fe.workflow.definition.Parameter">
                                                                        <UITypeHint id="220">["XSLTMappingFile"]@java/net/URI@</UITypeHint>
                                                                        <input>true</input>
                                                                        <name id="221">input["XSLTMappingFile"]</name>
                                                                        <stringValue id="222">RequestContent</stringValue>
                                                                        <type>VARIABLE</type>
                                                                        <variablePart id="223">templateURI</variablePart>
                                                                    </item>
                                                                    <item id="224" type="com.j2fe.workflow.definition.Parameter">
                                                                        <UITypeHint id="225">["processResponseFileWithTimeStamp"]@java/lang/Boolean@</UITypeHint>
                                                                        <input>true</input>
                                                                        <name id="226">input["processResponseFileWithTimeStamp"]</name>
                                                                        <stringValue id="227">processResponseFileWithTimeStamp</stringValue>
                                                                        <type>VARIABLE</type>
                                                                    </item>
                                                                    <item id="228" type="com.j2fe.workflow.definition.Parameter">
                                                                        <input>true</input>
                                                                        <name id="229">name</name>
                                                                        <stringValue id="230">BloombergUploadScheduledSFTP</stringValue>
                                                                        <type>CONSTANT</type>
                                                                    </item>
                                                                </parameters>
                                                                <sources id="231" type="java.util.HashSet">
                                                                    <item id="232" type="com.j2fe.workflow.definition.Transition">
                                                                        <name id="233">goto-next</name>
                                                                        <source id="234">
                                                                            <activation>INVOKE</activation>
                                                                            <clusteredCall>false</clusteredCall>
                                                                            <description idref="4"/>
                                                                            <directJoin>false</directJoin>
                                                                            <name id="235">Request Action -&gt; REQUEST-SCHEDULED</name>
                                                                            <nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
                                                                            <nodeHandlerClass id="236">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
                                                                            <parameters id="237" type="java.util.HashSet">
                                                                                <item id="238" type="com.j2fe.workflow.definition.Parameter">
                                                                                    <input>true</input>
                                                                                    <name id="239">database</name>
                                                                                    <stringValue id="240">jdbc/GSDM-1</stringValue>
                                                                                    <type>REFERENCE</type>
                                                                                </item>
                                                                                <item id="241" type="com.j2fe.workflow.definition.Parameter">
                                                                                    <UITypeHint id="242">[0]@java/lang/String@</UITypeHint>
                                                                                    <input>true</input>
                                                                                    <name id="243">indexedParameters[0]</name>
                                                                                    <stringValue id="244">REQUEST-SCHEDULED</stringValue>
                                                                                    <type>CONSTANT</type>
                                                                                </item>
                                                                                <item id="245" type="com.j2fe.workflow.definition.Parameter">
                                                                                    <input>true</input>
                                                                                    <name id="246">indexedParameters[1]</name>
                                                                                    <stringValue id="247">RequestTransaction</stringValue>
                                                                                    <type>VARIABLE</type>
                                                                                </item>
                                                                                <item id="248" type="com.j2fe.workflow.definition.Parameter">
                                                                                    <input>true</input>
                                                                                    <name id="249">querySQL</name>
                                                                                    <stringValue id="250">UPDATE FT_T_VREQ SET  VND_RQST_ACTION_TYP = ? WHERE TRN_ID = ?</stringValue>
                                                                                    <type>CONSTANT</type>
                                                                                </item>
                                                                            </parameters>
                                                                            <sources id="251" type="java.util.HashSet">
                                                                                <item id="252" type="com.j2fe.workflow.definition.Transition">
                                                                                    <name id="253">BBSCHEDULED</name>
                                                                                    <source id="254">
                                                                                        <activation>INVOKE</activation>
                                                                                        <clusteredCall>false</clusteredCall>
                                                                                        <description idref="4"/>
                                                                                        <directJoin>false</directJoin>
                                                                                        <name id="255">Switch Case</name>
                                                                                        <nodeHandler>com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandler>
                                                                                        <nodeHandlerClass id="256">com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandlerClass>
                                                                                        <parameters id="257" type="java.util.HashSet">
                                                                                            <item id="258" type="com.j2fe.workflow.definition.Parameter">
                                                                                                <input>true</input>
                                                                                                <name id="259">caseInsensitive</name>
                                                                                                <objectValue idref="34"/>
                                                                                                <type>CONSTANT</type>
                                                                                            </item>
                                                                                            <item id="260" type="com.j2fe.workflow.definition.Parameter">
                                                                                                <input>true</input>
                                                                                                <name id="261">caseItem</name>
                                                                                                <stringValue id="262">RequestContent</stringValue>
                                                                                                <type>VARIABLE</type>
                                                                                                <variablePart id="263">dataSource</variablePart>
                                                                                            </item>
                                                                                            <item id="264" type="com.j2fe.workflow.definition.Parameter">
                                                                                                <input>true</input>
                                                                                                <name id="265">defaultItem</name>
                                                                                                <stringValue id="266">default</stringValue>
                                                                                                <type>CONSTANT</type>
                                                                                            </item>
                                                                                            <item id="267" type="com.j2fe.workflow.definition.Parameter">
                                                                                                <input>true</input>
                                                                                                <name id="268">nullTransition</name>
                                                                                                <stringValue id="269">default</stringValue>
                                                                                                <type>CONSTANT</type>
                                                                                            </item>
                                                                                        </parameters>
                                                                                        <sources id="270" type="java.util.HashSet">
                                                                                            <item id="271" type="com.j2fe.workflow.definition.Transition">
                                                                                                <name id="272">goto-next</name>
                                                                                                <source id="273">
                                                                                                    <activation>ASYNCHRONOUS</activation>
                                                                                                    <clusteredCall>false</clusteredCall>
                                                                                                    <description idref="4"/>
                                                                                                    <directJoin>true</directJoin>
                                                                                                    <name id="274">Split Requests</name>
                                                                                                    <nodeHandler>com.j2fe.workflow.handler.impl.GenericSplit</nodeHandler>
                                                                                                    <nodeHandlerClass id="275">com.j2fe.workflow.handler.impl.GenericSplit</nodeHandlerClass>
                                                                                                    <parameters id="276" type="java.util.HashSet">
                                                                                                        <item id="277" type="com.j2fe.workflow.definition.Parameter">
                                                                                                            <input>true</input>
                                                                                                            <name id="278">input</name>
                                                                                                            <stringValue id="279">IncrementedObjects</stringValue>
                                                                                                            <type>VARIABLE</type>
                                                                                                        </item>
                                                                                                        <item id="280" type="com.j2fe.workflow.definition.Parameter">
                                                                                                            <input>false</input>
                                                                                                            <name id="281">output</name>
                                                                                                            <stringValue id="282">RequestContent</stringValue>
                                                                                                            <type>VARIABLE</type>
                                                                                                        </item>
                                                                                                    </parameters>
                                                                                                    <persistentVariables id="283" type="java.util.HashSet">
                                                                                                        <item id="284" type="java.lang.String">IncrementedObjects
0100</item>
                                                                                                        <item id="285" type="java.lang.String">RequestContent
1000</item>
                                                                                                    </persistentVariables>
                                                                                                    <sources id="286" type="java.util.HashSet">
                                                                                                        <item id="287" type="com.j2fe.workflow.definition.Transition">
                                                                                                            <name id="288">loop</name>
                                                                                                            <source idref="10"/>
                                                                                                            <target idref="273"/>
                                                                                                        </item>
                                                                                                    </sources>
                                                                                                    <targets id="289" type="java.util.HashSet">
                                                                                                        <item idref="271" type="com.j2fe.workflow.definition.Transition"/>
                                                                                                    </targets>
                                                                                                    <type>ANDSPLIT</type>
                                                                                                </source>
                                                                                                <target idref="254"/>
                                                                                            </item>
                                                                                        </sources>
                                                                                        <targets id="290" type="java.util.HashSet">
                                                                                            <item idref="252" type="com.j2fe.workflow.definition.Transition"/>
                                                                                            <item id="291" type="com.j2fe.workflow.definition.Transition">
                                                                                                <name id="292">REUTERSSCHEDULED</name>
                                                                                                <source idref="254"/>
                                                                                                <target id="293">
                                                                                                    <activation>INVOKE</activation>
                                                                                                    <clusteredCall>false</clusteredCall>
                                                                                                    <description idref="4"/>
                                                                                                    <directJoin>false</directJoin>
                                                                                                    <name id="294">Request Action -&gt; REQUEST-SCHEDULED</name>
                                                                                                    <nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
                                                                                                    <nodeHandlerClass id="295">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
                                                                                                    <parameters id="296" type="java.util.HashSet">
                                                                                                        <item id="297" type="com.j2fe.workflow.definition.Parameter">
                                                                                                            <input>true</input>
                                                                                                            <name id="298">database</name>
                                                                                                            <stringValue id="299">jdbc/GSDM-1</stringValue>
                                                                                                            <type>REFERENCE</type>
                                                                                                        </item>
                                                                                                        <item id="300" type="com.j2fe.workflow.definition.Parameter">
                                                                                                            <UITypeHint id="301">[0]@java/lang/String@</UITypeHint>
                                                                                                            <input>true</input>
                                                                                                            <name id="302">indexedParameters[0]</name>
                                                                                                            <stringValue id="303">REQUEST-SCHEDULED</stringValue>
                                                                                                            <type>CONSTANT</type>
                                                                                                        </item>
                                                                                                        <item id="304" type="com.j2fe.workflow.definition.Parameter">
                                                                                                            <input>true</input>
                                                                                                            <name id="305">indexedParameters[1]</name>
                                                                                                            <stringValue id="306">RequestTransaction</stringValue>
                                                                                                            <type>VARIABLE</type>
                                                                                                        </item>
                                                                                                        <item id="307" type="com.j2fe.workflow.definition.Parameter">
                                                                                                            <input>true</input>
                                                                                                            <name id="308">querySQL</name>
                                                                                                            <stringValue id="309">UPDATE FT_T_VREQ SET  VND_RQST_ACTION_TYP = ? WHERE TRN_ID = ?</stringValue>
                                                                                                            <type>CONSTANT</type>
                                                                                                        </item>
                                                                                                    </parameters>
                                                                                                    <sources id="310" type="java.util.HashSet">
                                                                                                        <item idref="291" type="com.j2fe.workflow.definition.Transition"/>
                                                                                                    </sources>
                                                                                                    <targets id="311" type="java.util.HashSet">
                                                                                                        <item id="312" type="com.j2fe.workflow.definition.Transition">
                                                                                                            <name id="313">goto-next</name>
                                                                                                            <source idref="293"/>
                                                                                                            <target id="314">
                                                                                                                <activation>INVOKE</activation>
                                                                                                                <clusteredCall>false</clusteredCall>
                                                                                                                <description idref="4"/>
                                                                                                                <directJoin>false</directJoin>
                                                                                                                <name id="315">REUTERS SCHEDULED</name>
                                                                                                                <nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
                                                                                                                <nodeHandlerClass id="316">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
                                                                                                                <parameters id="317" type="java.util.HashSet">
                                                                                                                    <item id="318" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                        <UITypeHint id="319">["AllRequestOIDs"]@[Ljava/lang/String;@</UITypeHint>
                                                                                                                        <input>true</input>
                                                                                                                        <name id="320">input["AllRequestOIDs"]</name>
                                                                                                                        <stringValue id="321">RequestContent</stringValue>
                                                                                                                        <type>VARIABLE</type>
                                                                                                                        <variablePart id="322">oids</variablePart>
                                                                                                                    </item>
                                                                                                                    <item id="323" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                        <UITypeHint id="324">["BusinessFeed"]@java/lang/String@</UITypeHint>
                                                                                                                        <input>true</input>
                                                                                                                        <name id="325">input["BusinessFeed"]</name>
                                                                                                                        <stringValue id="326">RequestContent</stringValue>
                                                                                                                        <type>VARIABLE</type>
                                                                                                                        <variablePart id="327">businessFeed</variablePart>
                                                                                                                    </item>
                                                                                                                    <item id="328" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                        <UITypeHint id="329">["DownloadDirectory"]@java/lang/String@</UITypeHint>
                                                                                                                        <input>true</input>
                                                                                                                        <name id="330">input["DownloadDirectory"]</name>
                                                                                                                        <stringValue id="331">ReutersDSSDownloadDirectory</stringValue>
                                                                                                                        <type>VARIABLE</type>
                                                                                                                    </item>
                                                                                                                    <item id="332" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                        <UITypeHint id="333">["FilePattern"]@java/lang/String@</UITypeHint>
                                                                                                                        <input>true</input>
                                                                                                                        <name id="334">input["FilePattern"]</name>
                                                                                                                        <stringValue id="335">RequestContent</stringValue>
                                                                                                                        <type>VARIABLE</type>
                                                                                                                        <variablePart id="336">filePattern</variablePart>
                                                                                                                    </item>
                                                                                                                    <item id="337" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                        <UITypeHint id="338">["FileSystemName"]@java/lang/String@</UITypeHint>
                                                                                                                        <input>true</input>
                                                                                                                        <name id="339">input["FileSystemName"]</name>
                                                                                                                        <stringValue id="340">FileSystemName</stringValue>
                                                                                                                        <type>VARIABLE</type>
                                                                                                                    </item>
                                                                                                                    <item id="341" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                        <UITypeHint id="342">["InputListName"]@java/lang/String@</UITypeHint>
                                                                                                                        <input>true</input>
                                                                                                                        <name id="343">input["InputListName"]</name>
                                                                                                                        <stringValue id="344">ReutersDSSInputListName</stringValue>
                                                                                                                        <type>VARIABLE</type>
                                                                                                                    </item>
                                                                                                                    <item id="345" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                        <UITypeHint id="346">["JobDefinitionId"]@java/lang/String@</UITypeHint>
                                                                                                                        <input>true</input>
                                                                                                                        <name id="347">input["JobDefinitionId"]</name>
                                                                                                                        <stringValue id="348">JobDefinitionId</stringValue>
                                                                                                                        <type>VARIABLE</type>
                                                                                                                    </item>
                                                                                                                    <item id="349" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                        <UITypeHint id="350">["MessageMetaData"]@java/util/Map@</UITypeHint>
                                                                                                                        <input>true</input>
                                                                                                                        <name id="351">input["MessageMetaData"]</name>
                                                                                                                        <stringValue id="352">MessageMetaData</stringValue>
                                                                                                                        <type>VARIABLE</type>
                                                                                                                    </item>
                                                                                                                    <item id="353" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                        <UITypeHint id="354">["Parent Job Id"]@java/lang/String@</UITypeHint>
                                                                                                                        <input>true</input>
                                                                                                                        <name id="355">input["Parent Job Id"]</name>
                                                                                                                        <stringValue id="356">Parent Job Id</stringValue>
                                                                                                                        <type>VARIABLE</type>
                                                                                                                    </item>
                                                                                                                    <item id="357" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                        <UITypeHint id="358">["PricePointEventDefinitionId"]@java/lang/String@</UITypeHint>
                                                                                                                        <input>true</input>
                                                                                                                        <name id="359">input["PricePointEventDefinitionId"]</name>
                                                                                                                        <stringValue id="360">PricePointEventDefinitionId</stringValue>
                                                                                                                        <type>VARIABLE</type>
                                                                                                                    </item>
                                                                                                                    <item id="361" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                        <UITypeHint id="362">["RTTimeout"]@java/lang/Long@</UITypeHint>
                                                                                                                        <input>true</input>
                                                                                                                        <name id="363">input["RTTimeout"]</name>
                                                                                                                        <stringValue id="364">RTTimeout</stringValue>
                                                                                                                        <type>VARIABLE</type>
                                                                                                                    </item>
                                                                                                                    <item id="365" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                        <UITypeHint id="366">["ReportTemplateName"]@java/lang/String@</UITypeHint>
                                                                                                                        <input>true</input>
                                                                                                                        <name id="367">input["ReportTemplateName"]</name>
                                                                                                                        <stringValue id="368">ReutersDSSReportTemplateName</stringValue>
                                                                                                                        <type>VARIABLE</type>
                                                                                                                    </item>
                                                                                                                    <item id="369" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                        <UITypeHint id="370">["RequestTransaction"]@java/lang/String@</UITypeHint>
                                                                                                                        <input>true</input>
                                                                                                                        <name id="371">input["RequestTransaction"]</name>
                                                                                                                        <stringValue id="372">RequestTransaction</stringValue>
                                                                                                                        <type>VARIABLE</type>
                                                                                                                    </item>
                                                                                                                    <item id="373" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                        <UITypeHint id="374">["ResponseFileName"]@java/lang/String@</UITypeHint>
                                                                                                                        <input>true</input>
                                                                                                                        <name id="375">input["ResponseFileName"]</name>
                                                                                                                        <stringValue id="376">ReutersResponseFileName</stringValue>
                                                                                                                        <type>VARIABLE</type>
                                                                                                                    </item>
                                                                                                                    <item id="377" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                        <UITypeHint id="378">["RicMaintenanceMessageType"]@java/lang/String@</UITypeHint>
                                                                                                                        <input>true</input>
                                                                                                                        <name id="379">input["RicMaintenanceMessageType"]</name>
                                                                                                                        <stringValue id="380">ReutersDSSRicMaintenanceMessageType</stringValue>
                                                                                                                        <type>VARIABLE</type>
                                                                                                                        <variablePart id="381">name</variablePart>
                                                                                                                    </item>
                                                                                                                    <item id="382" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                        <UITypeHint id="383">["ScheduleName"]@java/lang/String@</UITypeHint>
                                                                                                                        <input>true</input>
                                                                                                                        <name id="384">input["ScheduleName"]</name>
                                                                                                                        <stringValue id="385">ReutersDSSScheduleName</stringValue>
                                                                                                                        <type>VARIABLE</type>
                                                                                                                    </item>
                                                                                                                    <item id="386" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                        <UITypeHint id="387">["StoreRequestFileLocalDirectory"]@java/lang/String@</UITypeHint>
                                                                                                                        <input>true</input>
                                                                                                                        <name id="388">input["StoreRequestFileLocalDirectory"]</name>
                                                                                                                        <stringValue id="389">StoreRequestFileLocalDirectory</stringValue>
                                                                                                                        <type>VARIABLE</type>
                                                                                                                    </item>
                                                                                                                    <item id="390" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                        <UITypeHint id="391">["StoreRequestFileonLocal"]@java/lang/Boolean@</UITypeHint>
                                                                                                                        <input>true</input>
                                                                                                                        <name id="392">input["StoreRequestFileonLocal"]</name>
                                                                                                                        <stringValue id="393">StoreRequestFileonLocal</stringValue>
                                                                                                                        <type>VARIABLE</type>
                                                                                                                    </item>
                                                                                                                    <item id="394" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                        <UITypeHint id="395">["UploadDirectory"]@java/lang/String@</UITypeHint>
                                                                                                                        <input>true</input>
                                                                                                                        <name id="396">input["UploadDirectory"]</name>
                                                                                                                        <stringValue id="397">ReutersDSSUploadDirectory</stringValue>
                                                                                                                        <type>VARIABLE</type>
                                                                                                                    </item>
                                                                                                                    <item id="398" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                        <UITypeHint id="399">["VendorRequestString"]@java/lang/String@</UITypeHint>
                                                                                                                        <input>true</input>
                                                                                                                        <name id="400">input["VendorRequestString"]</name>
                                                                                                                        <stringValue id="401">RequestContent</stringValue>
                                                                                                                        <type>VARIABLE</type>
                                                                                                                        <variablePart id="402">requestXmlString</variablePart>
                                                                                                                    </item>
                                                                                                                    <item id="403" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                        <UITypeHint id="404">["XSLTMappingFile"]@java/net/URI@</UITypeHint>
                                                                                                                        <input>true</input>
                                                                                                                        <name id="405">input["XSLTMappingFile"]</name>
                                                                                                                        <stringValue id="406">RequestContent</stringValue>
                                                                                                                        <type>VARIABLE</type>
                                                                                                                        <variablePart id="407">templateURI</variablePart>
                                                                                                                    </item>
                                                                                                                    <item id="408" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                        <input>true</input>
                                                                                                                        <name id="409">name</name>
                                                                                                                        <stringValue id="410">ReutersUploadScheduledSFTP</stringValue>
                                                                                                                        <type>CONSTANT</type>
                                                                                                                    </item>
                                                                                                                </parameters>
                                                                                                                <sources id="411" type="java.util.HashSet">
                                                                                                                    <item idref="312" type="com.j2fe.workflow.definition.Transition"/>
                                                                                                                </sources>
                                                                                                                <targets id="412" type="java.util.HashSet">
                                                                                                                    <item id="413" type="com.j2fe.workflow.definition.Transition">
                                                                                                                        <name id="414">goto-next</name>
                                                                                                                        <source idref="314"/>
                                                                                                                        <target idref="137"/>
                                                                                                                    </item>
                                                                                                                </targets>
                                                                                                                <type>ACTIVITY</type>
                                                                                                            </target>
                                                                                                        </item>
                                                                                                    </targets>
                                                                                                    <type>ACTIVITY</type>
                                                                                                </target>
                                                                                            </item>
                                                                                            <item id="415" type="com.j2fe.workflow.definition.Transition">
                                                                                                <name id="416">default</name>
                                                                                                <source idref="254"/>
                                                                                                <target id="417">
                                                                                                    <activation>INVOKE</activation>
                                                                                                    <clusteredCall>false</clusteredCall>
                                                                                                    <description idref="4"/>
                                                                                                    <directJoin>false</directJoin>
                                                                                                    <name id="418">Status -&gt; REQUESTING</name>
                                                                                                    <nodeHandler>com.j2fe.feeds.request.UpdateVREQ</nodeHandler>
                                                                                                    <nodeHandlerClass id="419">com.j2fe.feeds.request.UpdateVREQ</nodeHandlerClass>
                                                                                                    <parameters id="420" type="java.util.HashSet">
                                                                                                        <item id="421" type="com.j2fe.workflow.definition.Parameter">
                                                                                                            <input>true</input>
                                                                                                            <name id="422">requestOIDs</name>
                                                                                                            <stringValue id="423">RequestContent</stringValue>
                                                                                                            <type>VARIABLE</type>
                                                                                                            <variablePart id="424">oids</variablePart>
                                                                                                        </item>
                                                                                                        <item id="425" type="com.j2fe.workflow.definition.Parameter">
                                                                                                            <input>true</input>
                                                                                                            <name id="426">status</name>
                                                                                                            <stringValue id="427">REQUESTING</stringValue>
                                                                                                            <type>CONSTANT</type>
                                                                                                        </item>
                                                                                                    </parameters>
                                                                                                    <sources id="428" type="java.util.HashSet">
                                                                                                        <item idref="415" type="com.j2fe.workflow.definition.Transition"/>
                                                                                                    </sources>
                                                                                                    <targets id="429" type="java.util.HashSet">
                                                                                                        <item id="430" type="com.j2fe.workflow.definition.Transition">
                                                                                                            <name id="431">goto-next</name>
                                                                                                            <source idref="417"/>
                                                                                                            <target id="432">
                                                                                                                <activation>INVOKE</activation>
                                                                                                                <clusteredCall>false</clusteredCall>
                                                                                                                <description idref="4"/>
                                                                                                                <directJoin>false</directJoin>
                                                                                                                <name id="433">Switch Case</name>
                                                                                                                <nodeHandler>com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandler>
                                                                                                                <nodeHandlerClass id="434">com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandlerClass>
                                                                                                                <parameters id="435" type="java.util.HashSet">
                                                                                                                    <item id="436" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                        <input>true</input>
                                                                                                                        <name id="437">caseInsensitive</name>
                                                                                                                        <stringValue id="438">true</stringValue>
                                                                                                                        <type>CONSTANT</type>
                                                                                                                    </item>
                                                                                                                    <item id="439" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                        <input>true</input>
                                                                                                                        <name id="440">caseItem</name>
                                                                                                                        <stringValue id="441">RequestContent</stringValue>
                                                                                                                        <type>VARIABLE</type>
                                                                                                                        <variablePart id="442">dataSource</variablePart>
                                                                                                                    </item>
                                                                                                                    <item id="443" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                        <input>true</input>
                                                                                                                        <name id="444">defaultItem</name>
                                                                                                                        <stringValue id="445">Vendor not supported</stringValue>
                                                                                                                        <type>CONSTANT</type>
                                                                                                                    </item>
                                                                                                                </parameters>
                                                                                                                <sources id="446" type="java.util.HashSet">
                                                                                                                    <item idref="430" type="com.j2fe.workflow.definition.Transition"/>
                                                                                                                </sources>
                                                                                                                <targets id="447" type="java.util.HashSet">
                                                                                                                    <item id="448" type="com.j2fe.workflow.definition.Transition">
                                                                                                                        <name id="449">BB</name>
                                                                                                                        <source idref="432"/>
                                                                                                                        <target id="450">
                                                                                                                            <activation>INVOKE</activation>
                                                                                                                            <clusteredCall>false</clusteredCall>
                                                                                                                            <description idref="4"/>
                                                                                                                            <directJoin>false</directJoin>
                                                                                                                            <name id="451">Bloomberg Request</name>
                                                                                                                            <nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
                                                                                                                            <nodeHandlerClass id="452">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
                                                                                                                            <parameters id="453" type="java.util.HashSet">
                                                                                                                                <item id="454" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="455">["AllRequestOIDs"]@[Ljava/lang/String;@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="456">input["AllRequestOIDs"]</name>
                                                                                                                                    <stringValue id="457">RequestContent</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                    <variablePart id="458">oids</variablePart>
                                                                                                                                </item>
                                                                                                                                <item id="459" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="460">["BusinessFeed"]@java/lang/String@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="461">input["BusinessFeed"]</name>
                                                                                                                                    <stringValue id="462">RequestContent</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                    <variablePart id="463">businessFeed</variablePart>
                                                                                                                                </item>
                                                                                                                                <item id="464" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="465">["BvalScanTime"]@java/lang/Integer@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="466">input["BvalScanTime"]</name>
                                                                                                                                    <stringValue id="467">BvalScanTime</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="468" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="469">["BvalTimeout"]@java/lang/Integer@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="470">input["BvalTimeout"]</name>
                                                                                                                                    <stringValue id="471">BvalTimeout</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="472" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="473">["DownloadDirectory"]@java/lang/String@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="474">input["DownloadDirectory"]</name>
                                                                                                                                    <stringValue id="475">BBDownloadDirectory</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="476" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="477">["ExcludeFields"]@java/lang/String@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="478">input["ExcludeFields"]</name>
                                                                                                                                    <stringValue id="479">ExcludeFields</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="480" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="481">["FilePattern"]@java/lang/String@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="482">input["FilePattern"]</name>
                                                                                                                                    <stringValue id="483">RequestContent</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                    <variablePart id="484">filePattern</variablePart>
                                                                                                                                </item>
                                                                                                                                <item id="485" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="486">["FileSystemName"]@java/lang/String@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="487">input["FileSystemName"]</name>
                                                                                                                                    <stringValue id="488">FileSystemName</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="489" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="490">["IsConnectionFailOver"]@java/lang/Boolean@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="491">input["IsConnectionFailOver"]</name>
                                                                                                                                    <stringValue id="492">IsConnectionFailOver</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="493" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="494">["JobDefinitionId"]@java/lang/String@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="495">input["JobDefinitionId"]</name>
                                                                                                                                    <stringValue id="496">JobDefinitionId</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="497" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="498">["MaxRetryTime"]@java/lang/Integer@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="499">input["MaxRetryTime"]</name>
                                                                                                                                    <stringValue id="500">MaxRetryTime</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="501" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="502">["MessageMetaData"]@java/util/Map@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="503">input["MessageMetaData"]</name>
                                                                                                                                    <stringValue id="504">MessageMetaData</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="505" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="506">["Parent Job Id"]@java/lang/String@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="507">input["Parent Job Id"]</name>
                                                                                                                                    <stringValue id="508">Parent Job Id</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="509" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="510">["ParticipantPurposeType"]@java/lang/String@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="511">input["ParticipantPurposeType"]</name>
                                                                                                                                    <stringValue id="512">ParticipantPurposeType</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="513" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="514">["PreserveSpacesInBBIdentifier"]@java/lang/Boolean@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="515">input["PreserveSpacesInBBIdentifier"]</name>
                                                                                                                                    <stringValue id="516">PreserveSpacesInBBIdentifier</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="517" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="518">["PricePointEventDefinitionId"]@java/lang/String@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="519">input["PricePointEventDefinitionId"]</name>
                                                                                                                                    <stringValue id="520">PricePointEventDefinitionId</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="521" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="522">["ProcessFilteredMessages"]@java/lang/Boolean@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="523">input["ProcessFilteredMessages"]</name>
                                                                                                                                    <stringValue id="524">ProcessFilteredMessages</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="525" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="526">["RemoveDuplicateFields"]@java/lang/Boolean@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="527">input["RemoveDuplicateFields"]</name>
                                                                                                                                    <stringValue id="528">RemoveDuplicateFieldsFlag</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="529" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="530">["RequestTransaction"]@java/lang/String@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="531">input["RequestTransaction"]</name>
                                                                                                                                    <stringValue id="532">RequestTransaction</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="533" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="534">["StoreRequestFileLocalDirectory"]@java/lang/String@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="535">input["StoreRequestFileLocalDirectory"]</name>
                                                                                                                                    <stringValue id="536">StoreRequestFileLocalDirectory</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="537" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="538">["StoreRequestFileonLocal"]@java/lang/Boolean@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="539">input["StoreRequestFileonLocal"]</name>
                                                                                                                                    <stringValue id="540">StoreRequestFileonLocal</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="541" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="542">["UploadDirectory"]@java/lang/String@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="543">input["UploadDirectory"]</name>
                                                                                                                                    <stringValue id="544">BBUploadDirectory</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="545" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="546">["VendorRequestString"]@java/lang/String@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="547">input["VendorRequestString"]</name>
                                                                                                                                    <stringValue id="548">RequestContent</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                    <variablePart id="549">requestXmlString</variablePart>
                                                                                                                                </item>
                                                                                                                                <item id="550" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="551">["XSLTMappingFile"]@java/net/URI@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="552">input["XSLTMappingFile"]</name>
                                                                                                                                    <stringValue id="553">RequestContent</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                    <variablePart id="554">templateURI</variablePart>
                                                                                                                                </item>
                                                                                                                                <item id="555" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="556">["isHistoryRequest"]@java/lang/Boolean@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="557">input["isHistoryRequest"]</name>
                                                                                                                                    <stringValue id="558">isHistoryRequest</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="559" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="560">["isUIMessage"]@java/lang/Boolean@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="561">input["isUIMessage"]</name>
                                                                                                                                    <stringValue id="562">isUIMessage</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="563" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="564">name</name>
                                                                                                                                    <stringValue id="565">BBForward</stringValue>
                                                                                                                                    <type>CONSTANT</type>
                                                                                                                                </item>
                                                                                                                            </parameters>
                                                                                                                            <sources id="566" type="java.util.HashSet">
                                                                                                                                <item idref="448" type="com.j2fe.workflow.definition.Transition"/>
                                                                                                                            </sources>
                                                                                                                            <targets id="567" type="java.util.HashSet">
                                                                                                                                <item id="568" type="com.j2fe.workflow.definition.Transition">
                                                                                                                                    <name id="569">goto-next</name>
                                                                                                                                    <source idref="450"/>
                                                                                                                                    <target idref="137"/>
                                                                                                                                </item>
                                                                                                                            </targets>
                                                                                                                            <type>ACTIVITY</type>
                                                                                                                        </target>
                                                                                                                    </item>
                                                                                                                    <item id="570" type="com.j2fe.workflow.definition.Transition">
                                                                                                                        <name id="571">BB_GETCOMPANY</name>
                                                                                                                        <source idref="432"/>
                                                                                                                        <target id="572">
                                                                                                                            <activation>INVOKE</activation>
                                                                                                                            <clusteredCall>false</clusteredCall>
                                                                                                                            <description idref="4"/>
                                                                                                                            <directJoin>false</directJoin>
                                                                                                                            <name id="573">BB_GetCompany Request</name>
                                                                                                                            <nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
                                                                                                                            <nodeHandlerClass id="574">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
                                                                                                                            <parameters id="575" type="java.util.HashSet">
                                                                                                                                <item id="576" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="577">["AllRequestOIDs"]@[Ljava/lang/String;@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="578">input["AllRequestOIDs"]</name>
                                                                                                                                    <stringValue id="579">RequestContent</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                    <variablePart id="580">oids</variablePart>
                                                                                                                                </item>
                                                                                                                                <item id="581" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="582">["BusinessFeed"]@java/lang/String@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="583">input["BusinessFeed"]</name>
                                                                                                                                    <stringValue id="584">RequestContent</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                    <variablePart id="585">businessFeed</variablePart>
                                                                                                                                </item>
                                                                                                                                <item id="586" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="587">["BvalScanTime"]@java/lang/Integer@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="588">input["BvalScanTime"]</name>
                                                                                                                                    <stringValue id="589">BvalScanTime</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="590" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="591">["BvalTimeout"]@java/lang/Integer@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="592">input["BvalTimeout"]</name>
                                                                                                                                    <stringValue id="593">BBResponseTimeout</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="594" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="595">["DownloadDirectory"]@java/lang/String@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="596">input["DownloadDirectory"]</name>
                                                                                                                                    <stringValue id="597">BBDownloadDirectory</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="598" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="599">["ExcludeFields"]@java/lang/String@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="600">input["ExcludeFields"]</name>
                                                                                                                                    <stringValue id="601">ExcludeFields</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="602" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="603">["FilePattern"]@java/lang/String@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="604">input["FilePattern"]</name>
                                                                                                                                    <stringValue id="605">RequestContent</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                    <variablePart id="606">filePattern</variablePart>
                                                                                                                                </item>
                                                                                                                                <item id="607" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="608">["IsConnectionFailOver"]@java/lang/Boolean@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="609">input["IsConnectionFailOver"]</name>
                                                                                                                                    <stringValue id="610">IsConnectionFailOver</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="611" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="612">["JobDefinitionId"]@java/lang/String@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="613">input["JobDefinitionId"]</name>
                                                                                                                                    <stringValue id="614">JobDefinitionId</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="615" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="616">["MaxRetryTime"]@java/lang/Integer@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="617">input["MaxRetryTime"]</name>
                                                                                                                                    <stringValue id="618">MaxRetryTime</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="619" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="620">["MessageMetaData"]@java/util/Map@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="621">input["MessageMetaData"]</name>
                                                                                                                                    <stringValue id="622">MessageMetaData</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="623" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="624">["Parent Job Id"]@java/lang/String@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="625">input["Parent Job Id"]</name>
                                                                                                                                    <stringValue id="626">Parent Job Id</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="627" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="628">["ParticipantPurposeType"]@java/lang/String@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="629">input["ParticipantPurposeType"]</name>
                                                                                                                                    <stringValue id="630">ParticipantPurposeType</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="631" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="632">["PreserveSpacesInBBIdentifier"]@java/lang/Boolean@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="633">input["PreserveSpacesInBBIdentifier"]</name>
                                                                                                                                    <stringValue id="634">PreserveSpacesInBBIdentifier</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="635" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="636">["PricePointEventDefinitionId"]@java/lang/String@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="637">input["PricePointEventDefinitionId"]</name>
                                                                                                                                    <stringValue id="638">PricePointEventDefinitionId</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="639" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="640">["ProcessFilteredMessages"]@java/lang/Boolean@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="641">input["ProcessFilteredMessages"]</name>
                                                                                                                                    <stringValue id="642">ProcessFilteredMessages</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="643" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="644">["RemoveDuplicateFields"]@java/lang/Boolean@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="645">input["RemoveDuplicateFields"]</name>
                                                                                                                                    <stringValue id="646">RemoveDuplicateFieldsFlag</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="647" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="648">["RequestTransaction"]@java/lang/String@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="649">input["RequestTransaction"]</name>
                                                                                                                                    <stringValue id="650">RequestTransaction</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="651" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="652">["ScheduleBvalResponseTask"]@java/lang/Boolean@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="653">input["ScheduleBvalResponseTask"]</name>
                                                                                                                                    <stringValue id="654">ScheduleBvalResponseTask</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="655" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="656">["StoreRequestFileLocalDirectory"]@java/lang/String@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="657">input["StoreRequestFileLocalDirectory"]</name>
                                                                                                                                    <stringValue id="658">StoreRequestFileLocalDirectory</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="659" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="660">["StoreRequestFileonLocal"]@java/lang/Boolean@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="661">input["StoreRequestFileonLocal"]</name>
                                                                                                                                    <stringValue id="662">StoreRequestFileonLocal</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="663" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="664">["UploadDirectory"]@java/lang/String@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="665">input["UploadDirectory"]</name>
                                                                                                                                    <stringValue id="666">BBUploadDirectory</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="667" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="668">["VendorRequestString"]@java/lang/String@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="669">input["VendorRequestString"]</name>
                                                                                                                                    <stringValue id="670">RequestContent</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                    <variablePart id="671">requestXmlString</variablePart>
                                                                                                                                </item>
                                                                                                                                <item id="672" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="673">["XSLTMappingFile"]@java/net/URI@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="674">input["XSLTMappingFile"]</name>
                                                                                                                                    <stringValue id="675">RequestContent</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                    <variablePart id="676">templateURI</variablePart>
                                                                                                                                </item>
                                                                                                                                <item id="677" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="678">["isHistoryRequest"]@java/lang/Boolean@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="679">input["isHistoryRequest"]</name>
                                                                                                                                    <stringValue id="680">isHistoryRequest</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="681" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="682">["isUIMessage"]@java/lang/Boolean@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="683">input["isUIMessage"]</name>
                                                                                                                                    <stringValue id="684">isUIMessage</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="685" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="686">name</name>
                                                                                                                                    <stringValue id="687">BBEntityForward</stringValue>
                                                                                                                                    <type>CONSTANT</type>
                                                                                                                                </item>
                                                                                                                            </parameters>
                                                                                                                            <sources id="688" type="java.util.HashSet">
                                                                                                                                <item idref="570" type="com.j2fe.workflow.definition.Transition"/>
                                                                                                                            </sources>
                                                                                                                            <targets id="689" type="java.util.HashSet">
                                                                                                                                <item id="690" type="com.j2fe.workflow.definition.Transition">
                                                                                                                                    <name id="691">goto-next</name>
                                                                                                                                    <source idref="572"/>
                                                                                                                                    <target idref="137"/>
                                                                                                                                </item>
                                                                                                                            </targets>
                                                                                                                            <type>ACTIVITY</type>
                                                                                                                        </target>
                                                                                                                    </item>
                                                                                                                    <item id="692" type="com.j2fe.workflow.definition.Transition">
                                                                                                                        <name id="693">D&amp;B</name>
                                                                                                                        <source idref="432"/>
                                                                                                                        <target id="694">
                                                                                                                            <activation>INVOKE</activation>
                                                                                                                            <clusteredCall>false</clusteredCall>
                                                                                                                            <description idref="4"/>
                                                                                                                            <directJoin>false</directJoin>
                                                                                                                            <name id="695">DnB Request</name>
                                                                                                                            <nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
                                                                                                                            <nodeHandlerClass id="696">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
                                                                                                                            <parameters id="697" type="java.util.HashSet">
                                                                                                                                <item id="698" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="699">event</name>
                                                                                                                                    <stringValue id="700">DnB Online</stringValue>
                                                                                                                                    <type>CONSTANT</type>
                                                                                                                                </item>
                                                                                                                                <item id="701" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="702">["Parent Job Id"]@java/lang/String@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="703">input["Parent Job Id"]</name>
                                                                                                                                    <stringValue id="704">Parent Job Id</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="705" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="706">["ProcessFilteredMessages"]@java/lang/Boolean@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="707">input["ProcessFilteredMessages"]</name>
                                                                                                                                    <stringValue id="708">ProcessFilteredMessages</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="709" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="710">["RequestOIDs"]@[Ljava/lang/String;@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="711">input["RequestOIDs"]</name>
                                                                                                                                    <stringValue id="712">RequestContent</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                    <variablePart id="713">oids</variablePart>
                                                                                                                                </item>
                                                                                                                                <item id="714" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="715">["RequestTransaction"]@java/lang/String@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="716">input["RequestTransaction"]</name>
                                                                                                                                    <stringValue id="717">RequestTransaction</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="718" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="719">name</name>
                                                                                                                                    <stringValue id="720">DnB Online Request</stringValue>
                                                                                                                                    <type>CONSTANT</type>
                                                                                                                                </item>
                                                                                                                            </parameters>
                                                                                                                            <sources id="721" type="java.util.HashSet">
                                                                                                                                <item idref="692" type="com.j2fe.workflow.definition.Transition"/>
                                                                                                                            </sources>
                                                                                                                            <targets id="722" type="java.util.HashSet">
                                                                                                                                <item id="723" type="com.j2fe.workflow.definition.Transition">
                                                                                                                                    <name id="724">goto-next</name>
                                                                                                                                    <source idref="694"/>
                                                                                                                                    <target idref="137"/>
                                                                                                                                </item>
                                                                                                                            </targets>
                                                                                                                            <type>ACTIVITY</type>
                                                                                                                        </target>
                                                                                                                    </item>
                                                                                                                    <item id="725" type="com.j2fe.workflow.definition.Transition">
                                                                                                                        <name id="726">IDC</name>
                                                                                                                        <source idref="432"/>
                                                                                                                        <target id="727">
                                                                                                                            <activation>INVOKE</activation>
                                                                                                                            <clusteredCall>false</clusteredCall>
                                                                                                                            <description idref="4"/>
                                                                                                                            <directJoin>false</directJoin>
                                                                                                                            <name id="728">Interactive Data Request</name>
                                                                                                                            <nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
                                                                                                                            <nodeHandlerClass id="729">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
                                                                                                                            <parameters id="730" type="java.util.HashSet">
                                                                                                                                <item id="731" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="732">["AllRequestOIDs"]@[Ljava/lang/String;@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="733">input["AllRequestOIDs"]</name>
                                                                                                                                    <stringValue id="734">RequestContent</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                    <variablePart id="735">oids</variablePart>
                                                                                                                                </item>
                                                                                                                                <item id="736" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="737">["BusinessFeed"]@java/lang/String@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="738">input["BusinessFeed"]</name>
                                                                                                                                    <stringValue id="739">RequestContent</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                    <variablePart id="740">businessFeed</variablePart>
                                                                                                                                </item>
                                                                                                                                <item id="741" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="742">["DownloadDirectory"]@java/lang/String@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="743">input["DownloadDirectory"]</name>
                                                                                                                                    <stringValue id="744">IDCDownloadDirectory</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="745" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="746">["FilePattern"]@java/lang/String@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="747">input["FilePattern"]</name>
                                                                                                                                    <stringValue id="748">RequestContent</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                    <variablePart id="749">filePattern</variablePart>
                                                                                                                                </item>
                                                                                                                                <item id="750" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="751">["IDCFilesystemType"]@com/j2fe/connector/BBFileSystemType@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="752">input["IDCFilesystemType"]</name>
                                                                                                                                    <stringValue id="753">IDCFilesystemType</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="754" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="755">["IDCFormat"]@com/j2fe/connector/IDCFormat@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="756">input["IDCFormat"]</name>
                                                                                                                                    <stringValue id="757">IDCFormat</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="758" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="759">["IDCIterations"]@java/lang/Integer@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="760">input["IDCIterations"]</name>
                                                                                                                                    <stringValue id="761">IDCIterations</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="762" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="763">["IDCRR"]@java/lang/Boolean@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="764">input["IDCRR"]</name>
                                                                                                                                    <stringValue id="765">IDCRR</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="766" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="767">["JobDefinitionId"]@java/lang/String@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="768">input["JobDefinitionId"]</name>
                                                                                                                                    <stringValue id="769">JobDefinitionId</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="770" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="771">["MessageMetaData"]@java/util/Map@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="772">input["MessageMetaData"]</name>
                                                                                                                                    <stringValue id="773">MessageMetaData</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="774" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="775">["Parent Job Id"]@java/lang/String@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="776">input["Parent Job Id"]</name>
                                                                                                                                    <stringValue id="777">Parent Job Id</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="778" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="779">["PricePointEventDefinitionId"]@java/lang/String@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="780">input["PricePointEventDefinitionId"]</name>
                                                                                                                                    <stringValue id="781">PricePointEventDefinitionId</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="782" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="783">["RequestTransaction"]@java/lang/String@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="784">input["RequestTransaction"]</name>
                                                                                                                                    <stringValue id="785">RequestTransaction</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="786" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="787">["ServiceId"]@java/lang/String@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="788">input["ServiceId"]</name>
                                                                                                                                    <stringValue id="789">InteractiveDataServiceID</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="790" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="791">["SortedListofRequestIdentifiers"]@java/lang/Object@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="792">input["SortedListofRequestIdentifiers"]</name>
                                                                                                                                    <stringValue id="793">RequestContent</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                    <variablePart id="794">identifierOidList</variablePart>
                                                                                                                                </item>
                                                                                                                                <item id="795" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="796">["UniverseId"]@java/lang/String@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="797">input["UniverseId"]</name>
                                                                                                                                    <stringValue id="798">InteractiveDataUniverseID</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="799" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="800">["UploadDirectory"]@java/lang/String@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="801">input["UploadDirectory"]</name>
                                                                                                                                    <stringValue id="802">InteractiveDataUploadDirectory</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="803" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="804">["VendorRequestString"]@java/lang/String@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="805">input["VendorRequestString"]</name>
                                                                                                                                    <stringValue id="806">RequestContent</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                    <variablePart id="807">requestXmlString</variablePart>
                                                                                                                                </item>
                                                                                                                                <item id="808" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="809">["XSLTMappingFile"]@java/net/URI@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="810">input["XSLTMappingFile"]</name>
                                                                                                                                    <stringValue id="811">RequestContent</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                    <variablePart id="812">templateURI</variablePart>
                                                                                                                                </item>
                                                                                                                                <item id="813" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="814">name</name>
                                                                                                                                    <stringValue id="815">IDCRequest</stringValue>
                                                                                                                                    <type>CONSTANT</type>
                                                                                                                                </item>
                                                                                                                            </parameters>
                                                                                                                            <sources id="816" type="java.util.HashSet">
                                                                                                                                <item idref="725" type="com.j2fe.workflow.definition.Transition"/>
                                                                                                                            </sources>
                                                                                                                            <targets id="817" type="java.util.HashSet">
                                                                                                                                <item id="818" type="com.j2fe.workflow.definition.Transition">
                                                                                                                                    <name id="819">goto-next</name>
                                                                                                                                    <source idref="727"/>
                                                                                                                                    <target idref="137"/>
                                                                                                                                </item>
                                                                                                                            </targets>
                                                                                                                            <type>ACTIVITY</type>
                                                                                                                        </target>
                                                                                                                    </item>
                                                                                                                    <item id="820" type="com.j2fe.workflow.definition.Transition">
                                                                                                                        <name id="821">REUTERS</name>
                                                                                                                        <source idref="432"/>
                                                                                                                        <target id="822">
                                                                                                                            <activation>INVOKE</activation>
                                                                                                                            <clusteredCall>false</clusteredCall>
                                                                                                                            <description idref="4"/>
                                                                                                                            <directJoin>false</directJoin>
                                                                                                                            <name id="823">Reuters Request</name>
                                                                                                                            <nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
                                                                                                                            <nodeHandlerClass id="824">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
                                                                                                                            <parameters id="825" type="java.util.HashSet">
                                                                                                                                <item id="826" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="827">["AllRequestOIDs"]@[Ljava/lang/String;@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="828">input["AllRequestOIDs"]</name>
                                                                                                                                    <stringValue id="829">RequestContent</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                    <variablePart id="830">oids</variablePart>
                                                                                                                                </item>
                                                                                                                                <item id="831" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="832">["BusinessFeed"]@java/lang/String@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="833">input["BusinessFeed"]</name>
                                                                                                                                    <stringValue id="834">RequestContent</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                    <variablePart id="835">businessFeed</variablePart>
                                                                                                                                </item>
                                                                                                                                <item id="836" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="837">["DownloadDirectory"]@java/lang/String@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="838">input["DownloadDirectory"]</name>
                                                                                                                                    <stringValue id="839">ReutersDSSDownloadDirectory</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="840" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="841">["FilePattern"]@java/lang/String@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="842">input["FilePattern"]</name>
                                                                                                                                    <stringValue id="843">RequestContent</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                    <variablePart id="844">filePattern</variablePart>
                                                                                                                                </item>
                                                                                                                                <item id="845" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="846">["FileSystemName"]@java/lang/String@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="847">input["FileSystemName"]</name>
                                                                                                                                    <stringValue id="848">FileSystemName</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="849" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="850">["InputListName"]@java/lang/String@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="851">input["InputListName"]</name>
                                                                                                                                    <stringValue id="852">ReutersDSSInputListName</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="853" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="854">["JobDefinitionId"]@java/lang/String@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="855">input["JobDefinitionId"]</name>
                                                                                                                                    <stringValue id="856">JobDefinitionId</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="857" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="858">["MessageMetaData"]@java/util/Map@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="859">input["MessageMetaData"]</name>
                                                                                                                                    <stringValue id="860">MessageMetaData</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="861" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="862">["Parent Job Id"]@java/lang/String@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="863">input["Parent Job Id"]</name>
                                                                                                                                    <stringValue id="864">Parent Job Id</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="865" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="866">["PricePointEventDefinitionId"]@java/lang/String@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="867">input["PricePointEventDefinitionId"]</name>
                                                                                                                                    <stringValue id="868">PricePointEventDefinitionId</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="869" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="870">["ProcessFilteredMessages"]@java/lang/Boolean@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="871">input["ProcessFilteredMessages"]</name>
                                                                                                                                    <stringValue id="872">ProcessFilteredMessages</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="873" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="874">["ProcessingDate"]@java/util/Date@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="875">input["ProcessingDate"]</name>
                                                                                                                                    <stringValue id="876">ProcessingDate</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="877" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="878">["RTTimeout"]@java/lang/Long@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="879">input["RTTimeout"]</name>
                                                                                                                                    <stringValue id="880">RTTimeout</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="881" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="882">["ReportTemplateName"]@java/lang/String@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="883">input["ReportTemplateName"]</name>
                                                                                                                                    <stringValue id="884">ReutersDSSReportTemplateName</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="885" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="886">["RequestTransaction"]@java/lang/String@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="887">input["RequestTransaction"]</name>
                                                                                                                                    <stringValue id="888">RequestTransaction</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="889" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="890">["ReteursFileSystemType"]@com/j2fe/connector/ReutersFileSystemType@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="891">input["ReteursFileSystemType"]</name>
                                                                                                                                    <stringValue id="892">ReteursFileSystemType</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="893" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="894">["RicMaintenanceMessageType"]@java/lang/String@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="895">input["RicMaintenanceMessageType"]</name>
                                                                                                                                    <stringValue id="896">ReutersDSSRicMaintenanceMessageType</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                    <variablePart id="897">name</variablePart>
                                                                                                                                </item>
                                                                                                                                <item id="898" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="899">["ScheduleName"]@java/lang/String@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="900">input["ScheduleName"]</name>
                                                                                                                                    <stringValue id="901">ReutersDSSScheduleName</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="902" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="903">["StoreRequestFileLocalDirectory"]@java/lang/String@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="904">input["StoreRequestFileLocalDirectory"]</name>
                                                                                                                                    <stringValue id="905">StoreRequestFileLocalDirectory</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="906" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="907">["StoreRequestFileonLocal"]@java/lang/Boolean@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="908">input["StoreRequestFileonLocal"]</name>
                                                                                                                                    <stringValue id="909">StoreRequestFileonLocal</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="910" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="911">["UploadDirectory"]@java/lang/String@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="912">input["UploadDirectory"]</name>
                                                                                                                                    <stringValue id="913">ReutersDSSUploadDirectory</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="914" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="915">["VendorRequestString"]@java/lang/String@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="916">input["VendorRequestString"]</name>
                                                                                                                                    <stringValue id="917">RequestContent</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                    <variablePart id="918">requestXmlString</variablePart>
                                                                                                                                </item>
                                                                                                                                <item id="919" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="920">["XSLTMappingFile"]@java/net/URI@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="921">input["XSLTMappingFile"]</name>
                                                                                                                                    <stringValue id="922">RequestContent</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                    <variablePart id="923">templateURI</variablePart>
                                                                                                                                </item>
                                                                                                                                <item id="924" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="925">["isHistoryRequest"]@java/lang/Boolean@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="926">input["isHistoryRequest"]</name>
                                                                                                                                    <stringValue id="927">isHistoryRequest</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="928" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="929">name</name>
                                                                                                                                    <stringValue id="930">ReutersForward</stringValue>
                                                                                                                                    <type>CONSTANT</type>
                                                                                                                                </item>
                                                                                                                            </parameters>
                                                                                                                            <sources id="931" type="java.util.HashSet">
                                                                                                                                <item idref="820" type="com.j2fe.workflow.definition.Transition"/>
                                                                                                                            </sources>
                                                                                                                            <targets id="932" type="java.util.HashSet">
                                                                                                                                <item id="933" type="com.j2fe.workflow.definition.Transition">
                                                                                                                                    <name id="934">goto-next</name>
                                                                                                                                    <source idref="822"/>
                                                                                                                                    <target idref="137"/>
                                                                                                                                </item>
                                                                                                                            </targets>
                                                                                                                            <type>ACTIVITY</type>
                                                                                                                        </target>
                                                                                                                    </item>
                                                                                                                    <item id="935" type="com.j2fe.workflow.definition.Transition">
                                                                                                                        <name id="936">TELEKURS</name>
                                                                                                                        <source idref="432"/>
                                                                                                                        <target id="937">
                                                                                                                            <activation>INVOKE</activation>
                                                                                                                            <clusteredCall>false</clusteredCall>
                                                                                                                            <description idref="4"/>
                                                                                                                            <directJoin>false</directJoin>
                                                                                                                            <name id="938">Telekurs Request</name>
                                                                                                                            <nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
                                                                                                                            <nodeHandlerClass id="939">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
                                                                                                                            <parameters id="940" type="java.util.HashSet">
                                                                                                                                <item id="941" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="942">["AllRequestOIDs"]@[Ljava/lang/String;@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="943">input["AllRequestOIDs"]</name>
                                                                                                                                    <stringValue id="944">RequestContent</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                    <variablePart id="945">oids</variablePart>
                                                                                                                                </item>
                                                                                                                                <item id="946" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="947">["FilePattern"]@java/lang/String@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="948">input["FilePattern"]</name>
                                                                                                                                    <stringValue id="949">RequestContent</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                    <variablePart id="950">filePattern</variablePart>
                                                                                                                                </item>
                                                                                                                                <item id="951" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="952">["TelekursFilesystemType"]@com/j2fe/connector/BBFileSystemType@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="953">input["TelekursFilesystemType"]</name>
                                                                                                                                    <stringValue id="954">TelekursFilesystemType</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="955" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="956">["TelekursUploadDirectory"]@java/lang/String@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="957">input["TelekursUploadDirectory"]</name>
                                                                                                                                    <stringValue id="958">TelekursUploadDirectory</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="959" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="960">["VendorRequestString"]@java/lang/String@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="961">input["VendorRequestString"]</name>
                                                                                                                                    <stringValue id="962">RequestContent</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                    <variablePart id="963">requestXmlString</variablePart>
                                                                                                                                </item>
                                                                                                                                <item id="964" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="965">["XSLTMappingFile"]@java/lang/String@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="966">input["XSLTMappingFile"]</name>
                                                                                                                                    <stringValue id="967">RequestContent</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                    <variablePart id="968">templateURI</variablePart>
                                                                                                                                </item>
                                                                                                                                <item id="969" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="970">name</name>
                                                                                                                                    <stringValue id="971">Telekurs Request</stringValue>
                                                                                                                                    <type>CONSTANT</type>
                                                                                                                                </item>
                                                                                                                            </parameters>
                                                                                                                            <sources id="972" type="java.util.HashSet">
                                                                                                                                <item idref="935" type="com.j2fe.workflow.definition.Transition"/>
                                                                                                                            </sources>
                                                                                                                            <targets id="973" type="java.util.HashSet">
                                                                                                                                <item id="974" type="com.j2fe.workflow.definition.Transition">
                                                                                                                                    <name id="975">goto-next</name>
                                                                                                                                    <source idref="937"/>
                                                                                                                                    <target idref="137"/>
                                                                                                                                </item>
                                                                                                                            </targets>
                                                                                                                            <type>ACTIVITY</type>
                                                                                                                        </target>
                                                                                                                    </item>
                                                                                                                    <item id="976" type="com.j2fe.workflow.definition.Transition">
                                                                                                                        <name id="977">Vendor not supported</name>
                                                                                                                        <source idref="432"/>
                                                                                                                        <target id="978">
                                                                                                                            <activation>INVOKE</activation>
                                                                                                                            <clusteredCall>false</clusteredCall>
                                                                                                                            <description idref="4"/>
                                                                                                                            <directJoin>false</directJoin>
                                                                                                                            <name id="979">Status -&gt; FAILED</name>
                                                                                                                            <nodeHandler>com.j2fe.feeds.request.UpdateVREQ</nodeHandler>
                                                                                                                            <nodeHandlerClass id="980">com.j2fe.feeds.request.UpdateVREQ</nodeHandlerClass>
                                                                                                                            <parameters id="981" type="java.util.HashSet">
                                                                                                                                <item id="982" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="983">requestOIDs</name>
                                                                                                                                    <stringValue id="984">RequestContent</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                    <variablePart id="985">oids</variablePart>
                                                                                                                                </item>
                                                                                                                                <item id="986" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="987">status</name>
                                                                                                                                    <stringValue id="988">FAILED</stringValue>
                                                                                                                                    <type>CONSTANT</type>
                                                                                                                                </item>
                                                                                                                                <item id="989" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="990">statusText</name>
                                                                                                                                    <stringValue id="991">Vendor not supported.</stringValue>
                                                                                                                                    <type>CONSTANT</type>
                                                                                                                                </item>
                                                                                                                            </parameters>
                                                                                                                            <sources id="992" type="java.util.HashSet">
                                                                                                                                <item idref="976" type="com.j2fe.workflow.definition.Transition"/>
                                                                                                                            </sources>
                                                                                                                            <targets id="993" type="java.util.HashSet">
                                                                                                                                <item id="994" type="com.j2fe.workflow.definition.Transition">
                                                                                                                                    <name id="995">goto-next</name>
                                                                                                                                    <source idref="978"/>
                                                                                                                                    <target idref="137"/>
                                                                                                                                </item>
                                                                                                                            </targets>
                                                                                                                            <type>ACTIVITY</type>
                                                                                                                        </target>
                                                                                                                    </item>
                                                                                                                    <item id="996" type="com.j2fe.workflow.definition.Transition">
                                                                                                                        <name id="997">WM</name>
                                                                                                                        <source idref="432"/>
                                                                                                                        <target id="998">
                                                                                                                            <activation>INVOKE</activation>
                                                                                                                            <clusteredCall>false</clusteredCall>
                                                                                                                            <description idref="4"/>
                                                                                                                            <directJoin>false</directJoin>
                                                                                                                            <name id="999">Call WM</name>
                                                                                                                            <nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
                                                                                                                            <nodeHandlerClass id="1000">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
                                                                                                                            <parameters id="1001" type="java.util.HashSet">
                                                                                                                                <item id="1002" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="1003">["RequestContent"]@[Lcom/j2fe/connector/RequestContent;@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="1004">input["RequestContent"]</name>
                                                                                                                                    <stringValue id="1005">RequestContent</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="1006" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="1007">["RequestTransaction"]@java/lang/String@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="1008">input["RequestTransaction"]</name>
                                                                                                                                    <stringValue id="1009">RequestTransaction</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="1010" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="1011">["WMFeedId"]@java/lang/String@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="1012">input["WMFeedId"]</name>
                                                                                                                                    <stringValue id="1013">RequestContent</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                    <variablePart id="1014">feedId</variablePart>
                                                                                                                                </item>
                                                                                                                                <item id="1015" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <UITypeHint id="1016">["WMUploadDirectory"]@java/lang/String@</UITypeHint>
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="1017">input["WMUploadDirectory"]</name>
                                                                                                                                    <stringValue id="1018">WMUploadDirectory</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="1019" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="1020">name</name>
                                                                                                                                    <stringValue id="1021">WMWrapper</stringValue>
                                                                                                                                    <type>CONSTANT</type>
                                                                                                                                </item>
                                                                                                                            </parameters>
                                                                                                                            <sources id="1022" type="java.util.HashSet">
                                                                                                                                <item idref="996" type="com.j2fe.workflow.definition.Transition"/>
                                                                                                                            </sources>
                                                                                                                            <targets id="1023" type="java.util.HashSet">
                                                                                                                                <item id="1024" type="com.j2fe.workflow.definition.Transition">
                                                                                                                                    <name id="1025">goto-next</name>
                                                                                                                                    <source idref="998"/>
                                                                                                                                    <target idref="137"/>
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
                                                                                    <target idref="234"/>
                                                                                </item>
                                                                            </sources>
                                                                            <targets id="1026" type="java.util.HashSet">
                                                                                <item idref="232" type="com.j2fe.workflow.definition.Transition"/>
                                                                            </targets>
                                                                            <type>ACTIVITY</type>
                                                                        </source>
                                                                        <target idref="143"/>
                                                                    </item>
                                                                </sources>
                                                                <targets id="1027" type="java.util.HashSet">
                                                                    <item idref="141" type="com.j2fe.workflow.definition.Transition"/>
                                                                </targets>
                                                                <type>ACTIVITY</type>
                                                            </source>
                                                            <target idref="137"/>
                                                        </item>
                                                        <item idref="690" type="com.j2fe.workflow.definition.Transition"/>
                                                        <item idref="568" type="com.j2fe.workflow.definition.Transition"/>
                                                        <item idref="1024" type="com.j2fe.workflow.definition.Transition"/>
                                                        <item idref="723" type="com.j2fe.workflow.definition.Transition"/>
                                                        <item idref="818" type="com.j2fe.workflow.definition.Transition"/>
                                                        <item idref="413" type="com.j2fe.workflow.definition.Transition"/>
                                                        <item idref="933" type="com.j2fe.workflow.definition.Transition"/>
                                                        <item idref="994" type="com.j2fe.workflow.definition.Transition"/>
                                                        <item idref="974" type="com.j2fe.workflow.definition.Transition"/>
                                                    </sources>
                                                    <targets id="1028" type="java.util.HashSet">
                                                        <item idref="135" type="com.j2fe.workflow.definition.Transition"/>
                                                    </targets>
                                                    <type>ANDJOIN</type>
                                                </source>
                                                <target idref="40"/>
                                            </item>
                                        </sources>
                                        <targets id="1029" type="java.util.HashSet">
                                            <item idref="38" type="com.j2fe.workflow.definition.Transition"/>
                                        </targets>
                                        <type>ACTIVITY</type>
                                    </source>
                                    <target idref="10"/>
                                </item>
                            </sources>
                            <targets id="1030" type="java.util.HashSet">
                                <item idref="8" type="com.j2fe.workflow.definition.Transition"/>
                                <item idref="287" type="com.j2fe.workflow.definition.Transition"/>
                            </targets>
                            <type>XORSPLIT</type>
                        </source>
                        <target idref="3"/>
                    </item>
                </sources>
                <targets id="1031" type="java.util.HashSet"/>
                <type>END</type>
            </endNode>
            <forcePurgeAtEnd>false</forcePurgeAtEnd>
            <group id="1032">Request Reply/Standard</group>
            <haltOnError>false</haltOnError>
            <lastChangeUser id="1033">user1</lastChangeUser>
            <lastUpdate id="1034">2025-06-19T12:01:04.000+0000</lastUpdate>
            <name id="1035">Split Requests</name>
            <nodes id="1036" type="java.util.HashSet">
                <item idref="143" type="com.j2fe.workflow.definition.Node"/>
                <item idref="572" type="com.j2fe.workflow.definition.Node"/>
                <item idref="63" type="com.j2fe.workflow.definition.Node"/>
                <item idref="450" type="com.j2fe.workflow.definition.Node"/>
                <item idref="998" type="com.j2fe.workflow.definition.Node"/>
                <item idref="694" type="com.j2fe.workflow.definition.Node"/>
                <item idref="10" type="com.j2fe.workflow.definition.Node"/>
                <item idref="727" type="com.j2fe.workflow.definition.Node"/>
                <item idref="40" type="com.j2fe.workflow.definition.Node"/>
                <item idref="46" type="com.j2fe.workflow.definition.Node"/>
                <item idref="314" type="com.j2fe.workflow.definition.Node"/>
                <item idref="234" type="com.j2fe.workflow.definition.Node"/>
                <item idref="293" type="com.j2fe.workflow.definition.Node"/>
                <item idref="822" type="com.j2fe.workflow.definition.Node"/>
                <item idref="273" type="com.j2fe.workflow.definition.Node"/>
                <item idref="137" type="com.j2fe.workflow.definition.Node"/>
                <item idref="128" type="com.j2fe.workflow.definition.Node"/>
                <item idref="978" type="com.j2fe.workflow.definition.Node"/>
                <item idref="417" type="com.j2fe.workflow.definition.Node"/>
                <item idref="3" type="com.j2fe.workflow.definition.Node"/>
                <item idref="254" type="com.j2fe.workflow.definition.Node"/>
                <item idref="432" type="com.j2fe.workflow.definition.Node"/>
                <item idref="937" type="com.j2fe.workflow.definition.Node"/>
            </nodes>
            <optimize>true</optimize>
            <parameter id="1037" type="java.util.HashMap">
                <entry>
                    <key id="1038" type="java.lang.String">BBDownloadDirectory</key>
                    <value id="1039" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="1040">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description id="1041">The directory where BB response files are downloaded from.</description>
                        <input>true</input>
                        <output>false</output>
                        <required>false</required>
                    </value>
                </entry>
                <entry>
                    <key id="1042" type="java.lang.String">BBResponseFileName</key>
                    <value id="1043" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="1044">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description id="1045">Response File Name For Scheduled Request</description>
                        <input>true</input>
                        <output>false</output>
                        <required>false</required>
                    </value>
                </entry>
                <entry>
                    <key id="1046" type="java.lang.String">BBResponseTimeout</key>
                    <value id="1047" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="1048">java.lang.Long</className>
                        <clazz>java.lang.Long</clazz>
                        <description id="1049">The Timeout for downloading the response file from BB.</description>
                        <input>true</input>
                        <output>false</output>
                        <required>false</required>
                    </value>
                </entry>
                <entry>
                    <key id="1050" type="java.lang.String">BBUploadDirectory</key>
                    <value id="1051" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="1052">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description id="1053">The directory where BB requests are uploaded to.</description>
                        <input>true</input>
                        <output>false</output>
                        <required>false</required>
                    </value>
                </entry>
                <entry>
                    <key id="1054" type="java.lang.String">BvalScanTime</key>
                    <value id="1055" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="1056">java.lang.Integer</className>
                        <clazz>java.lang.Integer</clazz>
                        <input>true</input>
                        <output>false</output>
                        <required>false</required>
                    </value>
                </entry>
                <entry>
                    <key id="1057" type="java.lang.String">BvalTimeout</key>
                    <value id="1058" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="1059">java.lang.Integer</className>
                        <clazz>java.lang.Integer</clazz>
                        <input>true</input>
                        <output>false</output>
                        <required>false</required>
                    </value>
                </entry>
                <entry>
                    <key id="1060" type="java.lang.String">DnBProduct</key>
                    <value id="1061" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="1062">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description id="1063">The DnBProduct to be used. Can be used to override the default DnBProduct configured in the Assembly.</description>
                        <input>true</input>
                        <output>false</output>
                        <required>false</required>
                    </value>
                </entry>
                <entry>
                    <key id="1064" type="java.lang.String">ExcludeFields</key>
                    <value id="1065" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="1066">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <input>true</input>
                        <output>false</output>
                        <required>false</required>
                    </value>
                </entry>
                <entry>
                    <key id="1067" type="java.lang.String">FileSystemName</key>
                    <value id="1068" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="1069">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description id="1070">Provides multiple license support</description>
                        <input>true</input>
                        <output>false</output>
                        <required>false</required>
                    </value>
                </entry>
                <entry>
                    <key id="1071" type="java.lang.String">IDCDownloadDirectory</key>
                    <value id="1072" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="1073">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description id="1074">The download directory of IDC.</description>
                        <input>true</input>
                        <output>false</output>
                        <required>false</required>
                    </value>
                </entry>
                <entry>
                    <key id="1075" type="java.lang.String">IDCFilesystemType</key>
                    <value id="1076" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="1077">com.j2fe.connector.BBFileSystemType</className>
                        <clazz>com.j2fe.connector.BBFileSystemType</clazz>
                        <description id="1078">Filesystem to connect with FTP or SFTP</description>
                        <input>true</input>
                        <output>false</output>
                        <required>false</required>
                    </value>
                </entry>
                <entry>
                    <key id="1079" type="java.lang.String">IDCFormat</key>
                    <value id="1080" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="1081">com.j2fe.connector.IDCFormat</className>
                        <clazz>com.j2fe.connector.IDCFormat</clazz>
                        <description id="1082">The Layout format for IDC.</description>
                        <input>true</input>
                        <output>false</output>
                        <required>true</required>
                    </value>
                </entry>
                <entry>
                    <key id="1083" type="java.lang.String">IDCIterations</key>
                    <value id="1084" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="1085">java.lang.Integer</className>
                        <clazz>java.lang.Integer</clazz>
                        <description id="1086">The maximum number of iterations List Files should make for IDC. For each iteration the List Files will scan the IDC upload directory and wait for 5 seconds before going through the next iteration if the upload directory is not empty.</description>
                        <input>true</input>
                        <output>false</output>
                        <required>false</required>
                    </value>
                </entry>
                <entry>
                    <key id="1087" type="java.lang.String">IDCRR</key>
                    <value id="1088" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="1089">java.lang.Boolean</className>
                        <clazz>java.lang.Boolean</clazz>
                        <description id="1090">Variable to determine delivery mechanism to request. 'False' for Ad-hoc and 'True' for Request/Response.</description>
                        <input>true</input>
                        <output>false</output>
                        <required>true</required>
                    </value>
                </entry>
                <entry>
                    <key id="1091" type="java.lang.String">InteractiveDataFileSuffix</key>
                    <value id="1092" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="1093">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description id="1094">The suffix to append to the files when uploading them to the IDC FTP server.</description>
                        <input>true</input>
                        <output>false</output>
                        <required>false</required>
                    </value>
                </entry>
                <entry>
                    <key id="1095" type="java.lang.String">InteractiveDataServiceID</key>
                    <value id="1096" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="1097">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description id="1098">The Service Id of the Universe to be used (required if an immediate response is needed)</description>
                        <input>true</input>
                        <output>false</output>
                        <required>false</required>
                    </value>
                </entry>
                <entry>
                    <key id="1099" type="java.lang.String">InteractiveDataUniverseID</key>
                    <value id="1100" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="1101">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description id="1102">The Universe that should be maintained.</description>
                        <input>true</input>
                        <output>false</output>
                        <required>false</required>
                    </value>
                </entry>
                <entry>
                    <key id="1103" type="java.lang.String">InteractiveDataUploadDirectory</key>
                    <value id="1104" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="1105">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <input>true</input>
                        <output>false</output>
                        <required>false</required>
                    </value>
                </entry>
                <entry>
                    <key id="1106" type="java.lang.String">IsConnectionFailOver</key>
                    <value id="1107" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="1108">java.lang.Boolean</className>
                        <clazz>java.lang.Boolean</clazz>
                        <description id="1109">Has Primary Connection failed?</description>
                        <input>true</input>
                        <output>false</output>
                        <required>false</required>
                    </value>
                </entry>
                <entry>
                    <key id="1110" type="java.lang.String">JobDefinitionId</key>
                    <value id="1111" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="1112">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description id="1113">Job Definition ID from FT_T_JBDF table to pick up job defination.</description>
                        <input>true</input>
                        <output>false</output>
                        <required>false</required>
                    </value>
                </entry>
                <entry>
                    <key id="1114" type="java.lang.String">MaxRetryTime</key>
                    <value id="1115" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="1116">java.lang.Integer</className>
                        <clazz>java.lang.Integer</clazz>
                        <description id="1117">Maximum time(in seconds) upto which the filesystemwould be scanned for files.</description>
                        <input>true</input>
                        <output>false</output>
                        <required>false</required>
                    </value>
                </entry>
                <entry>
                    <key id="1118" type="java.lang.String">MessageMetaData</key>
                    <value id="1119" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="1120">java.util.Map</className>
                        <clazz>java.util.Map</clazz>
                        <description id="1121">MessageMetaData</description>
                        <input>true</input>
                        <output>false</output>
                        <required>false</required>
                    </value>
                </entry>
                <entry>
                    <key id="1122" type="java.lang.String">NoOfFilesToRunInParallel</key>
                    <value id="1123" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="1124">java.lang.Integer</className>
                        <clazz>java.lang.Integer</clazz>
                        <description id="1125">The number of files to run in parallel.</description>
                        <input>true</input>
                        <output>false</output>
                        <required>false</required>
                    </value>
                </entry>
                <entry>
                    <key id="1126" type="java.lang.String">Parent Job Id</key>
                    <value id="1127" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="1128">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description id="1129">Parent Job id is used to correlated all the child jobs.</description>
                        <input>true</input>
                        <output>false</output>
                        <required>false</required>
                    </value>
                </entry>
                <entry>
                    <key id="1130" type="java.lang.String">ParticipantPurposeType</key>
                    <value id="1131" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="1132">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <input>true</input>
                        <output>false</output>
                        <required>false</required>
                    </value>
                </entry>
                <entry>
                    <key id="1133" type="java.lang.String">PreserveSpacesInBBIdentifier</key>
                    <value id="1134" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="1135">java.lang.Boolean</className>
                        <clazz>java.lang.Boolean</clazz>
                        <description id="1136">PreserveSpacesInBBIdentifier</description>
                        <input>true</input>
                        <output>false</output>
                        <required>false</required>
                    </value>
                </entry>
                <entry>
                    <key id="1137" type="java.lang.String">PricePointEventDefinitionId</key>
                    <value id="1138" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="1139">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description id="1140">Price Point Event ID from FT_T_PPEF table to pick up prices for given Price Point.</description>
                        <input>true</input>
                        <output>false</output>
                        <required>false</required>
                    </value>
                </entry>
                <entry>
                    <key id="1141" type="java.lang.String">ProcessFilteredMessages</key>
                    <value id="1142" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="1143">java.lang.Boolean</className>
                        <clazz>java.lang.Boolean</clazz>
                        <description id="1144">Indicates that messages are processed regardless of the result of the Generic Inbound Filter.</description>
                        <input>true</input>
                        <output>false</output>
                        <required>false</required>
                    </value>
                </entry>
                <entry>
                    <key id="1145" type="java.lang.String">ProcessResFile</key>
                    <value id="1146" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="1147">java.lang.Boolean</className>
                        <clazz>java.lang.Boolean</clazz>
                        <description id="1148">Flag to check whether to process Response file immediately.</description>
                        <input>true</input>
                        <output>false</output>
                        <required>false</required>
                    </value>
                </entry>
                <entry>
                    <key id="1149" type="java.lang.String">ProcessResponseFileImmediately</key>
                    <value id="1150" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="1151">java.lang.Boolean</className>
                        <clazz>java.lang.Boolean</clazz>
                        <description id="1152">Flag is set if user wants to process BB Scheduled File immediately.</description>
                        <input>true</input>
                        <output>false</output>
                        <required>false</required>
                    </value>
                </entry>
                <entry>
                    <key id="1153" type="java.lang.String">ProcessingDate</key>
                    <value id="1154" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="1155">java.util.Date</className>
                        <clazz>java.util.Date</clazz>
                        <description id="1156">ProcessingDate</description>
                        <input>true</input>
                        <output>false</output>
                        <required>false</required>
                    </value>
                </entry>
                <entry>
                    <key id="1157" type="java.lang.String">RTTimeout</key>
                    <value id="1158" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="1159">java.lang.Long</className>
                        <clazz>java.lang.Long</clazz>
                        <description id="1160">The Timeout for downloading the response file from Reuters.</description>
                        <input>true</input>
                        <output>false</output>
                        <required>false</required>
                    </value>
                </entry>
                <entry>
                    <key id="1161" type="java.lang.String">RemoveDuplicateFieldsFlag</key>
                    <value id="1162" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="1163">java.lang.Boolean</className>
                        <clazz>java.lang.Boolean</clazz>
                        <description id="1164">If this is false the RemoveDuplicateFields activity will be disabled.</description>
                        <input>true</input>
                        <output>false</output>
                        <required>false</required>
                    </value>
                </entry>
                <entry>
                    <key id="1165" type="java.lang.String">RequestTransaction</key>
                    <value id="1166" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="1167">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description id="1168">The Parent Transaction created for all the Requests.</description>
                        <input>true</input>
                        <output>false</output>
                        <required>true</required>
                    </value>
                </entry>
                <entry>
                    <key id="1169" type="java.lang.String">Requests</key>
                    <value id="1170" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="1171">[Ljava.lang.Object;</className>
                        <clazz>[Ljava.lang.Object;</clazz>
                        <description id="1172">The Vendor Requests that should be executed.</description>
                        <input>true</input>
                        <output>false</output>
                        <required>true</required>
                    </value>
                </entry>
                <entry>
                    <key id="1173" type="java.lang.String">ReteursFileSystemType</key>
                    <value id="1174" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="1175">com.j2fe.connector.ReutersFileSystemType</className>
                        <clazz>com.j2fe.connector.ReutersFileSystemType</clazz>
                        <input>true</input>
                        <output>false</output>
                        <required>false</required>
                    </value>
                </entry>
                <entry>
                    <key id="1176" type="java.lang.String">ReutersDSSDownloadDirectory</key>
                    <value id="1177" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="1178">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description id="1179">The directory where Reuters Datascope Select response files are downloaded from.</description>
                        <input>true</input>
                        <output>false</output>
                        <required>false</required>
                    </value>
                </entry>
                <entry>
                    <key id="1180" type="java.lang.String">ReutersDSSInputListName</key>
                    <value id="1181" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="1182">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description id="1183">The Reuters Datascope Select Input List Name to use. If not set, it is defaulted to the Request Type Name.</description>
                        <input>true</input>
                        <output>false</output>
                        <required>false</required>
                    </value>
                </entry>
                <entry>
                    <key id="1184" type="java.lang.String">ReutersDSSReportTemplateName</key>
                    <value id="1185" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="1186">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description id="1187">The Reuters Datascope Select Report Templae Name to use. If not set, it is defaulted to the Request Type Name.</description>
                        <input>true</input>
                        <output>false</output>
                        <required>false</required>
                    </value>
                </entry>
                <entry>
                    <key id="1188" type="java.lang.String">ReutersDSSRicMaintenanceMessageType</key>
                    <value id="1189" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="1190">com.j2fe.processing.MessageType</className>
                        <clazz>com.j2fe.processing.MessageType</clazz>
                        <description id="1191">If this value is set it indicates that RicMaintenance files should be processed and that this Message Type is used to process the files.</description>
                        <input>true</input>
                        <logicalType id="1192">com.j2fe.processing.MessageType</logicalType>
                        <output>false</output>
                        <required>false</required>
                    </value>
                </entry>
                <entry>
                    <key id="1193" type="java.lang.String">ReutersDSSScheduleName</key>
                    <value id="1194" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="1195">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description id="1196">The Reuters Datascope Select Schedule Name to use. If not set, it is defaulted to the Request Type Name.</description>
                        <input>true</input>
                        <output>false</output>
                        <required>false</required>
                    </value>
                </entry>
                <entry>
                    <key id="1197" type="java.lang.String">ReutersDSSUploadDirectory</key>
                    <value id="1198" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="1199">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description id="1200">The directory where Reuters Datascope Select requests are uploaded to.</description>
                        <input>true</input>
                        <output>false</output>
                        <required>false</required>
                    </value>
                </entry>
                <entry>
                    <key id="1201" type="java.lang.String">ReutersResponseFileName</key>
                    <value id="1202" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="1203">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description id="1204">Reuters Response File Name For Scheduled Request</description>
                        <input>true</input>
                        <output>false</output>
                        <required>false</required>
                    </value>
                </entry>
                <entry>
                    <key id="1205" type="java.lang.String">ScheduleBvalResponseTask</key>
                    <value id="1206" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="1207">java.lang.Boolean</className>
                        <clazz>java.lang.Boolean</clazz>
                        <input>true</input>
                        <output>false</output>
                        <required>false</required>
                    </value>
                </entry>
                <entry>
                    <key id="1208" type="java.lang.String">StoreRequestFileLocalDirectory</key>
                    <value id="1209" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="1210">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description id="1211">Directory to store RequestFile on local</description>
                        <input>true</input>
                        <output>false</output>
                        <required>false</required>
                    </value>
                </entry>
                <entry>
                    <key id="1212" type="java.lang.String">StoreRequestFileonLocal</key>
                    <value id="1213" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="1214">java.lang.Boolean</className>
                        <clazz>java.lang.Boolean</clazz>
                        <description id="1215">Indicates whether request file has to be stored in local</description>
                        <input>true</input>
                        <output>false</output>
                        <required>false</required>
                    </value>
                </entry>
                <entry>
                    <key id="1216" type="java.lang.String">TelekursFilesystemType</key>
                    <value id="1217" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="1218">com.j2fe.connector.BBFileSystemType</className>
                        <clazz>com.j2fe.connector.BBFileSystemType</clazz>
                        <description id="1219">Filesystem to connect with FTP or SFTP</description>
                        <input>true</input>
                        <output>false</output>
                        <required>false</required>
                    </value>
                </entry>
                <entry>
                    <key id="1220" type="java.lang.String">TelekursUploadDirectory</key>
                    <value id="1221" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="1222">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description id="1223">Directory where request file will be updated</description>
                        <input>true</input>
                        <output>false</output>
                        <required>false</required>
                    </value>
                </entry>
                <entry>
                    <key id="1224" type="java.lang.String">WMUploadDirectory</key>
                    <value id="1225" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="1226">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description id="1227">WM Upload Directory</description>
                        <input>true</input>
                        <output>false</output>
                        <required>false</required>
                    </value>
                </entry>
                <entry>
                    <key id="1228" type="java.lang.String">isHistoryRequest</key>
                    <value id="1229" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="1230">java.lang.Boolean</className>
                        <clazz>java.lang.Boolean</clazz>
                        <description id="1231">isHistoryRequest</description>
                        <input>true</input>
                        <output>false</output>
                        <required>false</required>
                    </value>
                </entry>
                <entry>
                    <key id="1232" type="java.lang.String">isUIMessage</key>
                    <value id="1233" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="1234">java.lang.Boolean</className>
                        <clazz>java.lang.Boolean</clazz>
                        <description id="1235">isUIMessagec</description>
                        <input>true</input>
                        <output>false</output>
                        <required>false</required>
                    </value>
                </entry>
                <entry>
                    <key id="1236" type="java.lang.String">processResponseFileWithTimeStamp</key>
                    <value id="1237" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="1238">java.lang.Boolean</className>
                        <clazz>java.lang.Boolean</clazz>
                        <description id="1239">The boolean value indicates whether to process Response File with TimeStamp.</description>
                        <input>true</input>
                        <output>false</output>
                        <required>false</required>
                    </value>
                </entry>
            </parameter>
            <permissions id="1240" type="java.util.HashSet"/>
            <priority>50</priority>
            <purgeAtEnd>true</purgeAtEnd>
            <retries>0</retries>
            <startNode idref="128"/>
            <status>RELEASED</status>
            <variables id="1241" type="java.util.HashMap">
                <entry>
                    <key id="1242" type="java.lang.String">BBDownloadDirectory</key>
                    <value id="1243" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="1244">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description id="1245">The directory where BB response files are downloaded from.</description>
                        <persistent>false</persistent>
                    </value>
                </entry>
                <entry>
                    <key id="1246" type="java.lang.String">BBResponseFileName</key>
                    <value id="1247" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="1248">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description id="1249">Response File Name For Scheduled Request</description>
                        <persistent>false</persistent>
                    </value>
                </entry>
                <entry>
                    <key id="1250" type="java.lang.String">BBResponseTimeout</key>
                    <value id="1251" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="1252">java.lang.Long</className>
                        <clazz>java.lang.Long</clazz>
                        <description id="1253">The Timeout for downloading the response file from BB.</description>
                        <persistent>false</persistent>
                        <value id="1254" type="java.lang.Integer">3000</value>
                    </value>
                </entry>
                <entry>
                    <key id="1255" type="java.lang.String">BBUploadDirectory</key>
                    <value id="1256" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="1257">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description id="1258">The directory where BB requests are uploaded to.</description>
                        <persistent>false</persistent>
                    </value>
                </entry>
                <entry>
                    <key id="1259" type="java.lang.String">BvalScanTime</key>
                    <value id="1260" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="1261">java.lang.Integer</className>
                        <clazz>java.lang.Integer</clazz>
                        <persistent>false</persistent>
                    </value>
                </entry>
                <entry>
                    <key id="1262" type="java.lang.String">BvalTimeout</key>
                    <value id="1263" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="1264">java.lang.Integer</className>
                        <clazz>java.lang.Integer</clazz>
                        <persistent>false</persistent>
                    </value>
                </entry>
                <entry>
                    <key id="1265" type="java.lang.String">DnBProduct</key>
                    <value id="1266" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="1267">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description id="1268">The DnBProduct to be used. Can be used to override the default DnBProduct configured in the Assembly.</description>
                        <persistent>false</persistent>
                    </value>
                </entry>
                <entry>
                    <key id="1269" type="java.lang.String">ExcludeFields</key>
                    <value id="1270" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="1271">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <persistent>false</persistent>
                    </value>
                </entry>
                <entry>
                    <key id="1272" type="java.lang.String">FileSystemName</key>
                    <value id="1273" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="1274">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description id="1275">Provides multiple license support</description>
                        <persistent>false</persistent>
                    </value>
                </entry>
                <entry>
                    <key id="1276" type="java.lang.String">IDCDownloadDirectory</key>
                    <value id="1277" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="1278">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description id="1279">The download directory of IDC.</description>
                        <persistent>false</persistent>
                        <value id="1280" type="java.lang.String">/</value>
                    </value>
                </entry>
                <entry>
                    <key id="1281" type="java.lang.String">IDCFilesystemType</key>
                    <value id="1282" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="1283">com.j2fe.connector.BBFileSystemType</className>
                        <clazz>com.j2fe.connector.BBFileSystemType</clazz>
                        <description id="1284">Filesystem to connect with FTP or SFTP</description>
                        <persistent>false</persistent>
                        <value id="1285" type="java.lang.String">SFTP</value>
                    </value>
                </entry>
                <entry>
                    <key id="1286" type="java.lang.String">IDCFormat</key>
                    <value id="1287" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="1288">com.j2fe.connector.IDCFormat</className>
                        <clazz>com.j2fe.connector.IDCFormat</clazz>
                        <description id="1289">The Layout format for IDC.</description>
                        <persistent>false</persistent>
                        <value id="1290" type="java.lang.String">SingelRecordLayout</value>
                    </value>
                </entry>
                <entry>
                    <key id="1291" type="java.lang.String">IDCIterations</key>
                    <value id="1292" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="1293">java.lang.Integer</className>
                        <clazz>java.lang.Integer</clazz>
                        <description id="1294">The maximum number of iterations List Files should make for IDC. For each iteration the List Files will scan the IDC upload directory and wait for 5 seconds before going through the next iteration if the upload directory is not empty.</description>
                        <persistent>false</persistent>
                        <value id="1295" type="java.lang.Integer">60</value>
                    </value>
                </entry>
                <entry>
                    <key id="1296" type="java.lang.String">IDCRR</key>
                    <value id="1297" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="1298">java.lang.Boolean</className>
                        <clazz>java.lang.Boolean</clazz>
                        <description id="1299">Variable to determine delivery mechanism to request. 'False' for Ad-hoc and 'True' for Request/Response.</description>
                        <persistent>false</persistent>
                        <value id="1300" type="java.lang.Boolean">false</value>
                    </value>
                </entry>
                <entry>
                    <key id="1301" type="java.lang.String">InteractiveDataFileSuffix</key>
                    <value id="1302" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="1303">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description id="1304">The suffix to append to the files when uploading them to the IDC FTP server.</description>
                        <persistent>false</persistent>
                    </value>
                </entry>
                <entry>
                    <key id="1305" type="java.lang.String">InteractiveDataServiceID</key>
                    <value id="1306" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="1307">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description id="1308">The Service Id of the Universe to be used (required if an immediate response is needed)</description>
                        <persistent>false</persistent>
                    </value>
                </entry>
                <entry>
                    <key id="1309" type="java.lang.String">InteractiveDataUniverseID</key>
                    <value id="1310" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="1311">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description id="1312">The Universe that should be maintained.</description>
                        <persistent>false</persistent>
                    </value>
                </entry>
                <entry>
                    <key id="1313" type="java.lang.String">InteractiveDataUploadDirectory</key>
                    <value id="1314" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="1315">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <persistent>false</persistent>
                    </value>
                </entry>
                <entry>
                    <key id="1316" type="java.lang.String">IsConnectionFailOver</key>
                    <value id="1317" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="1318">java.lang.Boolean</className>
                        <clazz>java.lang.Boolean</clazz>
                        <description id="1319">Has Primary Connection failed?</description>
                        <persistent>false</persistent>
                        <value idref="1300"/>
                    </value>
                </entry>
                <entry>
                    <key id="1320" type="java.lang.String">JobDefinitionId</key>
                    <value id="1321" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="1322">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description id="1323">Job Definition ID from FT_T_JBDF table to pick up job defination.</description>
                        <persistent>false</persistent>
                    </value>
                </entry>
                <entry>
                    <key id="1324" type="java.lang.String">MaxRetryTime</key>
                    <value id="1325" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="1326">java.lang.Integer</className>
                        <clazz>java.lang.Integer</clazz>
                        <description id="1327">Maximum time(in seconds) upto which the filesystemwould be scanned for files.</description>
                        <persistent>false</persistent>
                        <value id="1328" type="java.lang.Integer">900</value>
                    </value>
                </entry>
                <entry>
                    <key id="1329" type="java.lang.String">MessageMetaData</key>
                    <value id="1330" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="1331">java.util.Map</className>
                        <clazz>java.util.Map</clazz>
                        <description id="1332">MessageMetaData</description>
                        <persistent>false</persistent>
                    </value>
                </entry>
                <entry>
                    <key id="1333" type="java.lang.String">NoOfFilesToRunInParallel</key>
                    <value id="1334" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="1335">java.lang.Integer</className>
                        <clazz>java.lang.Integer</clazz>
                        <description id="1336">The number of files to run in parallel.</description>
                        <persistent>false</persistent>
                        <value id="1337" type="java.lang.Integer">2</value>
                    </value>
                </entry>
                <entry>
                    <key id="1338" type="java.lang.String">Parent Job Id</key>
                    <value id="1339" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="1340">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description id="1341">Parent Job id is used to correlated all the child jobs.</description>
                        <persistent>false</persistent>
                    </value>
                </entry>
                <entry>
                    <key id="1342" type="java.lang.String">ParticipantPurposeType</key>
                    <value id="1343" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="1344">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <persistent>false</persistent>
                        <value id="1345" type="java.lang.String">REQUEST</value>
                    </value>
                </entry>
                <entry>
                    <key id="1346" type="java.lang.String">PreserveSpacesInBBIdentifier</key>
                    <value id="1347" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="1348">java.lang.Boolean</className>
                        <clazz>java.lang.Boolean</clazz>
                        <description id="1349">PreserveSpacesInBBIdentifier</description>
                        <persistent>false</persistent>
                    </value>
                </entry>
                <entry>
                    <key id="1350" type="java.lang.String">PricePointEventDefinitionId</key>
                    <value id="1351" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="1352">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description id="1353">Price Point Event ID from FT_T_PPEF table to pick up prices for given Price Point.</description>
                        <persistent>false</persistent>
                    </value>
                </entry>
                <entry>
                    <key id="1354" type="java.lang.String">ProcessFilteredMessages</key>
                    <value id="1355" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="1356">java.lang.Boolean</className>
                        <clazz>java.lang.Boolean</clazz>
                        <description id="1357">Indicates that messages are processed regardless of the result of the Generic Inbound Filter.</description>
                        <persistent>false</persistent>
                    </value>
                </entry>
                <entry>
                    <key id="1358" type="java.lang.String">ProcessResFile</key>
                    <value id="1359" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="1360">java.lang.Boolean</className>
                        <clazz>java.lang.Boolean</clazz>
                        <description id="1361">Flag to check whether to process Response file immediately.</description>
                        <persistent>false</persistent>
                        <value idref="1300"/>
                    </value>
                </entry>
                <entry>
                    <key id="1362" type="java.lang.String">ProcessResponseFileImmediately</key>
                    <value id="1363" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="1364">java.lang.Boolean</className>
                        <clazz>java.lang.Boolean</clazz>
                        <description id="1365">Flag is set if user wants to process BB Scheduled File immediately.</description>
                        <persistent>false</persistent>
                        <value idref="34"/>
                    </value>
                </entry>
                <entry>
                    <key id="1366" type="java.lang.String">ProcessingDate</key>
                    <value id="1367" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="1368">java.util.Date</className>
                        <clazz>java.util.Date</clazz>
                        <description id="1369">ProcessingDate</description>
                        <persistent>false</persistent>
                    </value>
                </entry>
                <entry>
                    <key id="1370" type="java.lang.String">RTTimeout</key>
                    <value id="1371" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="1372">java.lang.Long</className>
                        <clazz>java.lang.Long</clazz>
                        <description id="1373">The Timeout for downloading the response file from Reuters.</description>
                        <persistent>false</persistent>
                        <value id="1374" type="java.lang.Integer">3000</value>
                    </value>
                </entry>
                <entry>
                    <key id="1375" type="java.lang.String">RemoveDuplicateFieldsFlag</key>
                    <value id="1376" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="1377">java.lang.Boolean</className>
                        <clazz>java.lang.Boolean</clazz>
                        <description id="1378">If this is false the RemoveDuplicateFields activity will be disabled.</description>
                        <persistent>false</persistent>
                        <value idref="34"/>
                    </value>
                </entry>
                <entry>
                    <key id="1379" type="java.lang.String">RequestTransaction</key>
                    <value id="1380" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="1381">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description id="1382">The Parent Transaction created for all the Requests.</description>
                        <persistent>false</persistent>
                    </value>
                </entry>
                <entry>
                    <key id="1383" type="java.lang.String">Requests</key>
                    <value id="1384" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="1385">[Ljava.lang.Object;</className>
                        <clazz>[Ljava.lang.Object;</clazz>
                        <description id="1386">The Vendor Requests that should be executed.</description>
                        <persistent>false</persistent>
                    </value>
                </entry>
                <entry>
                    <key id="1387" type="java.lang.String">ReteursFileSystemType</key>
                    <value id="1388" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="1389">com.j2fe.connector.ReutersFileSystemType</className>
                        <clazz>com.j2fe.connector.ReutersFileSystemType</clazz>
                        <persistent>false</persistent>
                        <value id="1390" type="java.lang.String">SFTP</value>
                    </value>
                </entry>
                <entry>
                    <key id="1391" type="java.lang.String">ReutersDSSDownloadDirectory</key>
                    <value id="1392" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="1393">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description id="1394">The directory where Reuters Datascope Select response files are downloaded from.</description>
                        <persistent>false</persistent>
                    </value>
                </entry>
                <entry>
                    <key id="1395" type="java.lang.String">ReutersDSSInputListName</key>
                    <value id="1396" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="1397">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description id="1398">The Reuters Datascope Select Input List Name to use. If not set, it is defaulted to the Request Type Name.</description>
                        <persistent>false</persistent>
                    </value>
                </entry>
                <entry>
                    <key id="1399" type="java.lang.String">ReutersDSSReportTemplateName</key>
                    <value id="1400" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="1401">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description id="1402">The Reuters Datascope Select Report Templae Name to use. If not set, it is defaulted to the Request Type Name.</description>
                        <persistent>false</persistent>
                    </value>
                </entry>
                <entry>
                    <key id="1403" type="java.lang.String">ReutersDSSRicMaintenanceMessageType</key>
                    <value id="1404" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="1405">com.j2fe.processing.MessageType</className>
                        <clazz>com.j2fe.processing.MessageType</clazz>
                        <description id="1406">If this value is set it indicates that RicMaintenance files should be processed and that this Message Type is used to process the files.</description>
                        <persistent>false</persistent>
                    </value>
                </entry>
                <entry>
                    <key id="1407" type="java.lang.String">ReutersDSSScheduleName</key>
                    <value id="1408" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="1409">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description id="1410">The Reuters Datascope Select Schedule Name to use. If not set, it is defaulted to the Request Type Name.</description>
                        <persistent>false</persistent>
                    </value>
                </entry>
                <entry>
                    <key id="1411" type="java.lang.String">ReutersDSSUploadDirectory</key>
                    <value id="1412" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="1413">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description id="1414">The directory where Reuters Datascope Select requests are uploaded to.</description>
                        <persistent>false</persistent>
                    </value>
                </entry>
                <entry>
                    <key id="1415" type="java.lang.String">ReutersResponseFileName</key>
                    <value id="1416" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="1417">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description id="1418">Reuters Response File Name For Scheduled Request</description>
                        <persistent>false</persistent>
                    </value>
                </entry>
                <entry>
                    <key id="1419" type="java.lang.String">ScheduleBvalResponseTask</key>
                    <value id="1420" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="1421">java.lang.Boolean</className>
                        <clazz>java.lang.Boolean</clazz>
                        <persistent>false</persistent>
                        <value idref="34"/>
                    </value>
                </entry>
                <entry>
                    <key id="1422" type="java.lang.String">StoreRequestFileLocalDirectory</key>
                    <value id="1423" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="1424">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description id="1425">Directory to store RequestFile on local</description>
                        <persistent>false</persistent>
                    </value>
                </entry>
                <entry>
                    <key id="1426" type="java.lang.String">StoreRequestFileonLocal</key>
                    <value id="1427" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="1428">java.lang.Boolean</className>
                        <clazz>java.lang.Boolean</clazz>
                        <description id="1429">Indicates whether request file has to be stored in local</description>
                        <persistent>false</persistent>
                        <value idref="1300"/>
                    </value>
                </entry>
                <entry>
                    <key id="1430" type="java.lang.String">TelekursFilesystemType</key>
                    <value id="1431" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="1432">com.j2fe.connector.BBFileSystemType</className>
                        <clazz>com.j2fe.connector.BBFileSystemType</clazz>
                        <description id="1433">Filesystem to connect with FTP or SFTP</description>
                        <persistent>false</persistent>
                        <value id="1434" type="java.lang.String">SFTP</value>
                    </value>
                </entry>
                <entry>
                    <key id="1435" type="java.lang.String">TelekursUploadDirectory</key>
                    <value id="1436" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="1437">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description id="1438">Directory where request file will be updated</description>
                        <persistent>false</persistent>
                        <value id="1439" type="java.lang.String">/vdfs-selection</value>
                    </value>
                </entry>
                <entry>
                    <key id="1440" type="java.lang.String">WMUploadDirectory</key>
                    <value id="1441" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="1442">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description id="1443">WM Upload Directory</description>
                        <persistent>false</persistent>
                        <value id="1444" type="java.lang.String">/data</value>
                    </value>
                </entry>
                <entry>
                    <key id="1445" type="java.lang.String">counter</key>
                    <value id="1446" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="1447">java.lang.Integer</className>
                        <clazz>java.lang.Integer</clazz>
                        <description id="1448">Loop Counter</description>
                        <persistent>false</persistent>
                        <value id="1449" type="java.lang.Integer">0</value>
                    </value>
                </entry>
                <entry>
                    <key id="1450" type="java.lang.String">isHistoryRequest</key>
                    <value id="1451" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="1452">java.lang.Boolean</className>
                        <clazz>java.lang.Boolean</clazz>
                        <description id="1453">isHistoryRequest</description>
                        <persistent>false</persistent>
                        <value idref="1300"/>
                    </value>
                </entry>
                <entry>
                    <key id="1454" type="java.lang.String">isUIMessage</key>
                    <value id="1455" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="1456">java.lang.Boolean</className>
                        <clazz>java.lang.Boolean</clazz>
                        <description id="1457">isUIMessagec</description>
                        <persistent>false</persistent>
                        <value idref="1300"/>
                    </value>
                </entry>
                <entry>
                    <key id="1458" type="java.lang.String">processResponseFileWithTimeStamp</key>
                    <value id="1459" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="1460">java.lang.Boolean</className>
                        <clazz>java.lang.Boolean</clazz>
                        <description id="1461">The boolean value indicates whether to process Response File with TimeStamp.</description>
                        <persistent>false</persistent>
                        <value idref="1300"/>
                    </value>
                </entry>
            </variables>
            <version>9</version>
        </com.j2fe.workflow.definition.Workflow>
    </businessobject>
</goldensource-package>
