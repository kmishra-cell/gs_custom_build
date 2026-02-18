<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.03">
<package-comment/>
<businessobject displayString="6 - V10" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>true</alwaysPersist>
<clustered>false</clustered>
<comment id="1">V10</comment>
<endNode id="2">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="3">Stop</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="4">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="5" type="java.util.HashSet">
<item id="6" type="com.j2fe.workflow.definition.Transition">
<name id="7">goto-next</name>
<source id="8">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="9">unlock workflow</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="10">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="11" type="java.util.HashSet">
<item id="12" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="13">["lockJobId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="14">input["lockJobId"]</name>
<stringValue id="15">lockJobId</stringValue>
<type>VARIABLE</type>
</item>
<item id="16" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="17">name</name>
<stringValue id="18">cmfSOIAdditionUnlockWrapper</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="19" type="java.util.HashSet">
<item id="20" type="com.j2fe.workflow.definition.Transition">
<name id="21">goto-next</name>
<source id="22">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="23">After each SOI</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="24">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="25" type="java.util.HashSet">
<item id="26" type="com.j2fe.workflow.definition.Transition">
<name id="27">end-loop</name>
<source id="28">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="29">SOI List loop</name>
<nodeHandler>com.j2fe.workflow.handler.impl.ForEach</nodeHandler>
<nodeHandlerClass id="30">com.j2fe.workflow.handler.impl.ForEach</nodeHandlerClass>
<parameters id="31" type="java.util.HashSet">
<item id="32" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="33">counter</name>
<stringValue id="34">Counter</stringValue>
<type>VARIABLE</type>
</item>
<item id="35" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="36">counter</name>
<stringValue id="37">Counter</stringValue>
<type>VARIABLE</type>
</item>
<item id="38" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="39">input</name>
<stringValue id="40">filteredSoiList</stringValue>
<type>VARIABLE</type>
</item>
<item id="41" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="42">output</name>
<stringValue id="43">thisSOIName</stringValue>
<type>VARIABLE</type>
</item>
<item id="44" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="45">resetOnEnd</name>
<stringValue id="46">true</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="47" type="java.util.HashSet">
<item id="48" type="com.j2fe.workflow.definition.Transition">
<name id="49">goto-next</name>
<source id="50">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="51">NOP</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="52">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="53" type="java.util.HashSet">
<item id="54" type="com.j2fe.workflow.definition.Transition">
<name id="55">goto-next</name>
<source id="56">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="57">Wait  10</name>
<nodeHandler>com.j2fe.scheduling.activities.Wait</nodeHandler>
<nodeHandlerClass id="58">com.j2fe.scheduling.activities.Wait</nodeHandlerClass>
<parameters id="59" type="java.util.HashSet">
<item id="60" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="61">secondsToWait</name>
<objectValue id="62" type="java.lang.Integer">10</objectValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="63" type="java.util.HashSet">
<item id="64" type="com.j2fe.workflow.definition.Transition">
<name id="65">goto-next</name>
<source id="66">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="67">Call Subworkflow</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="68">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="69" type="java.util.HashSet">
<item id="70" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="71">["Filter"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="72">input["Filter"]</name>
<stringValue id="73">Y</stringValue>
<type>CONSTANT</type>
</item>
<item id="74" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="75">["JMSTextMessage"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="76">input["JMSTextMessage"]</name>
<stringValue id="77">fileteredMessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="78" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="79">["PublishAssets"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="80">input["PublishAssets"]</name>
<stringValue id="81">N</stringValue>
<type>CONSTANT</type>
</item>
<item id="82" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="83">["SoiPurpType"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="84">input["SoiPurpType"]</name>
<stringValue id="85">INTEREST</stringValue>
<type>CONSTANT</type>
</item>
<item id="86" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="87">["TriggeredByBBPerSecurityBatch"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="88">input["TriggeredByBBPerSecurityBatch"]</name>
<stringValue id="89">N</stringValue>
<type>CONSTANT</type>
</item>
<item id="90" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="91">["TriggeredByCmfSoiAdditionForUnderlyers"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="92">input["TriggeredByCmfSoiAdditionForUnderlyers"]</name>
<stringValue id="93">N</stringValue>
<type>CONSTANT</type>
</item>
<item id="94" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="95">name</name>
<stringValue id="96">cmfSOIAddition</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="97" type="java.util.HashSet">
<item id="98" type="com.j2fe.workflow.definition.Transition">
<name id="99">goto-next</name>
<source id="100">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="101">filter single SOI</name>
<nodeHandler>com.j2fe.translation.activities.Translation</nodeHandler>
<nodeHandlerClass id="102">com.j2fe.translation.activities.Translation</nodeHandlerClass>
<parameters id="103" type="java.util.HashSet">
<item id="104" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="105">input</name>
<stringValue id="106">JMSTextMessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="107" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="108">mapping</name>
<objectValue id="109" type="java.lang.String">db://resource/xslt/MHI/soiAdditionFilterInventory.xslt</objectValue>
<type>CONSTANT</type>
</item>
<item id="110" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="111">metaData["filterSoiGroup"]</name>
<stringValue id="112">thisSOIName</stringValue>
<type>VARIABLE</type>
</item>
<item id="113" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="114">plainOutput[0]</name>
<stringValue id="115">fileteredMessage</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="116" type="java.util.HashSet">
<item id="117" type="com.j2fe.workflow.definition.Transition">
<name id="118">goto-next</name>
<source id="119">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="120">LogMessage</name>
<nodeHandler>com.j2fe.general.activities.LogMessage</nodeHandler>
<nodeHandlerClass id="121">com.j2fe.general.activities.LogMessage</nodeHandlerClass>
<parameters id="122" type="java.util.HashSet">
<item id="123" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="124">logLevel</name>
<objectValue id="125" type="java.lang.String">ERROR</objectValue>
<type>CONSTANT</type>
</item>
<item id="126" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="127">message</name>
<stringValue id="128">thisSOIName</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="129" type="java.util.HashSet">
<item id="130" type="com.j2fe.workflow.definition.Transition">
<name id="131">loop</name>
<source idref="28"/>
<target idref="119"/>
</item>
</sources>
<targets id="132" type="java.util.HashSet">
<item idref="117" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="100"/>
</item>
</sources>
<targets id="133" type="java.util.HashSet">
<item idref="98" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="66"/>
</item>
</sources>
<targets id="134" type="java.util.HashSet">
<item idref="64" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="56"/>
</item>
</sources>
<targets id="135" type="java.util.HashSet">
<item idref="54" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="50"/>
</item>
<item id="136" type="com.j2fe.workflow.definition.Transition">
<name id="137">goto-next</name>
<source id="138">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="139">get distinct SOI name list</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="140">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="141" type="java.util.HashSet">
<item id="142" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="143">statements</name>
<stringValue id="144">import java.util.ArrayList;&#13;
import java.util.Arrays;&#13;
import java.util.Iterator;&#13;
import java.util.List;&#13;
import org.apache.log4j.Logger;&#13;
import org.apache.log4j.Level;&#13;
//&#13;
// create filteredSoiList containing only the&#13;
// unique inventory names from rawSoiList&#13;
//&#13;
List filteredSoiList = new  ArrayList();&#13;
&#13;
Logger logger = Logger.getLogger(String.class);&#13;
logger.setLevel(Level.ERROR);&#13;
&#13;
for (String s: rawSoiList) {&#13;
  if(!filteredSoiList.contains(s)) {&#13;
    logger.error("add to filteredSoiList: " + s);&#13;
		filteredSoiList.add(s);&#13;
  }&#13;
}&#13;
logger.error("filteredSoiList now contains: " + filteredSoiList);</stringValue>
<type>CONSTANT</type>
</item>
<item id="145" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="146">variables["filteredSoiList"]</name>
<stringValue id="147">filteredSoiList</stringValue>
<type>VARIABLE</type>
</item>
<item id="148" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="149">["rawSoiList"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="150">variables["rawSoiList"]</name>
<stringValue id="151">rawSoiList</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="152" type="java.util.HashSet">
<item id="153" type="com.j2fe.workflow.definition.Transition">
<name id="154">goto-next</name>
<source id="155">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="156">Get SOI Names from message</name>
<nodeHandler>com.j2fe.workflow.handler.impl.ExecuteXPath</nodeHandler>
<nodeHandlerClass id="157">com.j2fe.workflow.handler.impl.ExecuteXPath</nodeHandlerClass>
<parameters id="158" type="java.util.HashSet">
<item id="159" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="160">inputText</name>
<stringValue id="161">JMSTextMessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="162" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="163">outputValues</name>
<stringValue id="164">rawSoiList</stringValue>
<type>VARIABLE</type>
</item>
<item id="165" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="166">xPath</name>
<stringValue id="167">/cmfSOIAdditionCollection/cmfSOIAddition/securityOfInterestIds/securityOfInterestId/text()</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="168" type="java.util.HashSet">
<item id="169" type="com.j2fe.workflow.definition.Transition">
<name id="170">goto-next</name>
<source id="171">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="172">Lock workflow</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="173">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="174" type="java.util.HashSet">
<item id="175" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="176">name</name>
<stringValue id="177">cmfSOIAdditionLockWrapper</stringValue>
<type>CONSTANT</type>
</item>
<item id="178" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="179">["lockJobId"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="180">output["lockJobId"]</name>
<stringValue id="181">lockJobId</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="182" type="java.util.HashSet">
<item id="183" type="com.j2fe.workflow.definition.Transition">
<name id="184">goto-next</name>
<source id="185">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="186">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="187">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="188" type="java.util.HashSet"/>
<targets id="189" type="java.util.HashSet">
<item idref="183" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="171"/>
</item>
</sources>
<targets id="190" type="java.util.HashSet">
<item idref="169" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="155"/>
</item>
</sources>
<targets id="191" type="java.util.HashSet">
<item idref="153" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="138"/>
</item>
</sources>
<targets id="192" type="java.util.HashSet">
<item idref="136" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="50"/>
</item>
</sources>
<targets id="193" type="java.util.HashSet">
<item idref="48" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="28"/>
</item>
</sources>
<targets id="194" type="java.util.HashSet">
<item idref="26" type="com.j2fe.workflow.definition.Transition"/>
<item idref="130" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="22"/>
</item>
</sources>
<targets id="195" type="java.util.HashSet">
<item idref="20" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="8"/>
</item>
</sources>
<targets id="196" type="java.util.HashSet">
<item idref="6" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="2"/>
</item>
</sources>
<targets id="197" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="198">Mizuho</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="199">user1</lastChangeUser>
<lastUpdate id="200">2025-05-28T14:26:29.000+0100</lastUpdate>
<name id="201">cmfSOIAdditionWrapper</name>
<nodes id="202" type="java.util.HashSet">
<item idref="22" type="com.j2fe.workflow.definition.Node"/>
<item idref="66" type="com.j2fe.workflow.definition.Node"/>
<item idref="155" type="com.j2fe.workflow.definition.Node"/>
<item idref="171" type="com.j2fe.workflow.definition.Node"/>
<item idref="119" type="com.j2fe.workflow.definition.Node"/>
<item idref="50" type="com.j2fe.workflow.definition.Node"/>
<item idref="28" type="com.j2fe.workflow.definition.Node"/>
<item idref="185" type="com.j2fe.workflow.definition.Node"/>
<item idref="2" type="com.j2fe.workflow.definition.Node"/>
<item idref="56" type="com.j2fe.workflow.definition.Node"/>
<item idref="100" type="com.j2fe.workflow.definition.Node"/>
<item idref="138" type="com.j2fe.workflow.definition.Node"/>
<item idref="8" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>true</optimize>
<parameter id="203" type="java.util.HashMap">
<entry>
<key id="204" type="java.lang.String">AddToInventoryTrnIDs</key>
<value id="205" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="206">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>false</input>
<output>true</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="207" type="java.lang.String">Filter</key>
<value id="208" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="209">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="210">Run cmfSOIAdditionFilter workflow?
Possible values Y or N</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="211" type="java.lang.String">JMSTextMessage</key>
<value id="212" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="213">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="214">If the JMS message type is Text then this property contains the message.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="215" type="java.lang.String">PublishAssets</key>
<value id="216" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="217">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="218">Do you want to publish the assets? Y/N</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="219" type="java.lang.String">RequestTrid</key>
<value id="220" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="221">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>false</input>
<output>true</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="222" type="java.lang.String">SoiPurpType</key>
<value id="223" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="224">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="225" type="java.lang.String">TriggeredByBBPerSecurityBatch</key>
<value id="226" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="227">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="228" type="java.lang.String">TriggeredByCmfSoiAdditionForUnderlyers</key>
<value id="229" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="230">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
</parameter>
<permissions id="231" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>false</purgeAtEnd>
<retries>0</retries>
<startNode idref="185"/>
<status>RELEASED</status>
<variables id="232" type="java.util.HashMap">
<entry>
<key id="233" type="java.lang.String">AddToInventoryTrnIDs</key>
<value id="234" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="235">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="236" type="java.lang.String">Counter</key>
<value id="237" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="238">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<persistent>false</persistent>
<value id="239" type="java.lang.Integer">0</value>
</value>
</entry>
<entry>
<key id="240" type="java.lang.String">EventJobIDs</key>
<value id="241" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="242">[Ljava.lang.String;</className>
<clazz>[Ljava.lang.String;</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="243" type="java.lang.String">Filter</key>
<value id="244" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="245">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="246">Run cmfSOIAdditionFilter workflow?
Possible values Y or N</description>
<persistent>true</persistent>
<value id="247" type="java.lang.String">Y</value>
</value>
</entry>
<entry>
<key id="248" type="java.lang.String">JMSTextMessage</key>
<value id="249" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="250">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="251">If the JMS message type is Text then this property contains the message.</description>
<persistent>true</persistent>
</value>
</entry>
<entry>
<key id="252" type="java.lang.String">LockSOIName</key>
<value id="253" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="254">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>true</persistent>
<value id="255" type="java.lang.String">cmfSOIAdditionWrapper</value>
</value>
</entry>
<entry>
<key id="256" type="java.lang.String">PublishAssets</key>
<value id="257" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="258">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="259">Do you want to publish the assets? Y/N</description>
<persistent>false</persistent>
<value id="260" type="java.lang.String">N</value>
</value>
</entry>
<entry>
<key id="261" type="java.lang.String">RequestTrid</key>
<value id="262" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="263">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="264" type="java.lang.String">SoiPurpType</key>
<value id="265" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="266">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="267" type="java.lang.String">INTEREST</value>
</value>
</entry>
<entry>
<key id="268" type="java.lang.String">TriggeredByBBPerSecurityBatch</key>
<value id="269" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="270">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>true</persistent>
<value id="271" type="java.lang.String">N</value>
</value>
</entry>
<entry>
<key id="272" type="java.lang.String">TriggeredByCmfSoiAdditionForUnderlyers</key>
<value id="273" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="274">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>true</persistent>
<value id="275" type="java.lang.String">N</value>
</value>
</entry>
<entry>
<key id="276" type="java.lang.String">filterSoiGroup</key>
<value id="277" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="278">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="279">dummy delete when properly filtered</description>
<persistent>false</persistent>
</value>
</entry>
</variables>
<version>6</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
