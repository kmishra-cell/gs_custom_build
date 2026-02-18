<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.03">
<package-comment/>
<businessobject displayString="5 - V10" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>true</alwaysPersist>
<clustered>false</clustered>
<comment id="1">V10</comment>
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
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="10"/>
<directJoin>false</directJoin>
<name id="11">log lock success</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="12">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="13" type="java.util.HashSet">
<item id="14" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="15">database</name>
<stringValue id="16">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="17" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="18">indexedParameters[0]</name>
<stringValue id="19">LockSOIName</stringValue>
<type>VARIABLE</type>
</item>
<item id="20" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="21">indexedParameters[1]</name>
<stringValue id="22">lockJobId</stringValue>
<type>VARIABLE</type>
</item>
<item id="23" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="24">querySQL</name>
<stringValue id="25">call mhi_sp_eventlog (&#13;
	  'cmfSOIAdditionLock',&#13;
	  'obtained lock for inventory ',&#13;
	  CAST(? AS VARCHAR),&#13;
	  CAST(? AS VARCHAR)&#13;
	); </stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="26" type="java.util.HashSet">
<item id="27" type="com.j2fe.workflow.definition.Transition">
<name id="28">nothing-found</name>
<source id="29">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="30"/>
<directJoin>false</directJoin>
<name id="31">check lock 2</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="32">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="33" type="java.util.HashSet">
<item id="34" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="35">database</name>
<stringValue id="36">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="37" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="38">[0]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="39">indexedParameters[0]</name>
<stringValue id="40">LockSOIName</stringValue>
<type>VARIABLE</type>
</item>
<item id="41" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="42">indexedParameters[1]</name>
<stringValue id="43">lockJobId</stringValue>
<type>VARIABLE</type>
</item>
<item id="44" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="45">indexedResult</name>
<stringValue id="46">lockstatus</stringValue>
<type>VARIABLE</type>
</item>
<item id="47" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="48">querySQL</name>
<stringValue id="49">select JOB_ID from CMFSOIADDITION_LOCK where KEYS = CAST(? AS VARCHAR) and JOB_ID != CAST(? AS VARCHAR)</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="50" type="java.util.HashSet">
<item id="51" type="com.j2fe.workflow.definition.Transition">
<name id="52">goto-next</name>
<source id="53">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="54"/>
<directJoin>false</directJoin>
<name id="55">wait 5 secs</name>
<nodeHandler>com.j2fe.scheduling.activities.Wait</nodeHandler>
<nodeHandlerClass id="56">com.j2fe.scheduling.activities.Wait</nodeHandlerClass>
<parameters id="57" type="java.util.HashSet">
<item id="58" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="59">secondsToWait</name>
<objectValue id="60" type="java.lang.Integer">5</objectValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="61" type="java.util.HashSet">
<item id="62" type="com.j2fe.workflow.definition.Transition">
<name id="63">rows-found</name>
<source id="64">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="65"/>
<directJoin>false</directJoin>
<name id="66">check lock</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="67">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="68" type="java.util.HashSet">
<item id="69" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="70">database</name>
<stringValue id="71">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="72" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="73">[0]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="74">indexedParameters[0]</name>
<stringValue id="75">LockSOIName</stringValue>
<type>VARIABLE</type>
</item>
<item id="76" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="77">indexedParameters[1]</name>
<stringValue id="78">lockJobId</stringValue>
<type>VARIABLE</type>
</item>
<item id="79" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="80">indexedResult</name>
<stringValue id="81">lockstatus</stringValue>
<type>VARIABLE</type>
</item>
<item id="82" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="83">querySQL</name>
<stringValue id="84">select JOB_ID from CMFSOIADDITION_LOCK where KEYS = CAST(? AS VARCHAR) and JOB_ID = CAST(? AS VARCHAR)</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="85" type="java.util.HashSet">
<item id="86" type="com.j2fe.workflow.definition.Transition">
<name id="87">goto-next</name>
<source id="88">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="89"/>
<directJoin>false</directJoin>
<name id="90">Set db lock</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="91">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="92" type="java.util.HashSet">
<item id="93" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="94">database</name>
<stringValue id="95">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="96" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="97">indexedParameters[0]</name>
<stringValue id="98">LockSOIName</stringValue>
<type>VARIABLE</type>
</item>
<item id="99" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="100">indexedParameters[1]</name>
<stringValue id="101">lockJobId</stringValue>
<type>VARIABLE</type>
</item>
<item id="102" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="103">indexedParameters[2]</name>
<stringValue id="104">LockSOIName</stringValue>
<type>VARIABLE</type>
</item>
<item id="105" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="106">querySQL</name>
<stringValue id="107">insert into CMFSOIADDITION_LOCK (keys,job_id,lock_tms)  &#13;
    select CAST(? AS VARCHAR),CAST(? AS VARCHAR), sysdate() from dual &#13;
    where not exists (select 1 from CMFSOIADDITION_LOCK where keys= CAST(? AS VARCHAR));</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="108" type="java.util.HashSet">
<item id="109" type="com.j2fe.workflow.definition.Transition">
<name id="110">nothing-found</name>
<source id="111">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="112"/>
<directJoin>false</directJoin>
<name id="113">pre-lock check</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="114">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="115" type="java.util.HashSet">
<item id="116" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="117">database</name>
<stringValue id="118">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="119" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="120">[0]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="121">indexedParameters[0]</name>
<stringValue id="122">LockSOIName</stringValue>
<type>VARIABLE</type>
</item>
<item id="123" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="124">indexedParameters[1]</name>
<stringValue id="125">lockJobId</stringValue>
<type>VARIABLE</type>
</item>
<item id="126" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="127">indexedResult</name>
<stringValue id="128">lockstatus</stringValue>
<type>VARIABLE</type>
</item>
<item id="129" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="130">querySQL</name>
<stringValue id="131">select JOB_ID from CMFSOIADDITION_LOCK where KEYS = CAST(? AS VARCHAR) and JOB_ID != CAST(? AS VARCHAR)</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="132" type="java.util.HashSet">
<item id="133" type="com.j2fe.workflow.definition.Transition">
<name id="134">goto-next</name>
<source id="135">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="136"/>
<directJoin>false</directJoin>
<name id="137">log request lock</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="138">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="139" type="java.util.HashSet">
<item id="140" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="141">database</name>
<stringValue id="142">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="143" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="144">indexedParameters[0]</name>
<stringValue id="145">LockSOIName</stringValue>
<type>VARIABLE</type>
</item>
<item id="146" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="147">indexedParameters[1]</name>
<stringValue id="148">lockJobId</stringValue>
<type>VARIABLE</type>
</item>
<item id="149" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="150">querySQL</name>
<stringValue id="151">call mhi_sp_eventlog (&#13;
	  'cmfSOIAdditionLock',&#13;
	  'request lock for inventory ',&#13;
	  CAST(? AS VARCHAR),&#13;
	  CAST(? AS VARCHAR)&#13;
	); </stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="152" type="java.util.HashSet">
<item id="153" type="com.j2fe.workflow.definition.Transition">
<name id="154">goto-next</name>
<source id="155">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="156"/>
<directJoin>false</directJoin>
<name id="157">lock try repeat</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="158">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="159" type="java.util.HashSet">
<item id="160" type="com.j2fe.workflow.definition.Transition">
<name id="161">goto-next</name>
<source id="162">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="163"/>
<directJoin>false</directJoin>
<name id="164">Translate SOI Name for Lock</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="165">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="166" type="java.util.HashSet">
<item id="167" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="168">statements</name>
<stringValue id="169">import java.util.ArrayList;&#13;
import java.util.Arrays;&#13;
import org.apache.log4j.Logger;&#13;
&#13;
		Logger logger = Logger.getLogger("cmfSOIAddition");&#13;
&#13;
		System.out.println("input: ETFInventoryCount: " + ETFInventoryCount);&#13;
		System.out.println("input:                  SOIName: " + SOIName);&#13;
		System.out.println("input:            ETFSOIName: " + ETFSOIName);&#13;
		String LockSoiName;&#13;
		if (ETFInventoryCount == null || ETFInventoryCount.isEmpty() || ETFInventoryCount.equals("0")) {		&#13;
			LockSoiName = SOIName;&#13;
			System.out.println("Using default SOI Name");		&#13;
		}&#13;
		else {&#13;
			LockSoiName = ETFSOIName;&#13;
			System.out.println("Using MHI ETF Basket Inventory SOI Name:" + ETFSOIName);		&#13;
		}&#13;
		System.out.println("output: LockSoiName is: " + LockSoiName);&#13;
		logger.info("******cmfSOIAddition Workflow Lock SOI Name is " + LockSoiName);&#13;
		return LockSoiName;</stringValue>
<type>CONSTANT</type>
</item>
<item id="170" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="171">["ETFInventoryCount"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="172">variables["ETFInventoryCount"]</name>
<stringValue id="173">ETFInventoryCount</stringValue>
<type>VARIABLE</type>
</item>
<item id="174" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="175">["ETFSOIName"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="176">variables["ETFSOIName"]</name>
<stringValue id="177">ETFSOIName</stringValue>
<type>VARIABLE</type>
</item>
<item id="178" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="179">["LockSoiName"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="180">variables["LockSoiName"]</name>
<stringValue id="181">LockSOIName</stringValue>
<type>VARIABLE</type>
</item>
<item id="182" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="183">["SOIName"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="184">variables["SOIName"]</name>
<stringValue id="185">SOIName</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="186" type="java.util.HashSet">
<item id="187" type="com.j2fe.workflow.definition.Transition">
<name id="188">goto-next</name>
<source id="189">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="190"/>
<directJoin>false</directJoin>
<name id="191">Get MHI ETF Basket Inventory Count</name>
<nodeHandler>com.j2fe.workflow.handler.impl.ExecuteXPath</nodeHandler>
<nodeHandlerClass id="192">com.j2fe.workflow.handler.impl.ExecuteXPath</nodeHandlerClass>
<parameters id="193" type="java.util.HashSet">
<item id="194" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="195">inputText</name>
<stringValue id="196">JMSTextMessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="197" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="198">outputValue</name>
<stringValue id="199">ETFInventoryCount</stringValue>
<type>VARIABLE</type>
</item>
<item id="200" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="201">xPath</name>
<stringValue id="202">SOICountXpath</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="203" type="java.util.HashSet">
<item id="204" type="com.j2fe.workflow.definition.Transition">
<name id="205">goto-next</name>
<source id="206">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="207"/>
<directJoin>false</directJoin>
<name id="208">Build count for ETF SOI</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="209">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="210" type="java.util.HashSet">
<item id="211" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="212">statements</name>
<stringValue id="213">import java.util.ArrayList;&#13;
import java.util.Arrays;&#13;
&#13;
&#13;
		System.out.println("input:            ETFSOIName: " + ETFSOIName);&#13;
		String SoiCountXpath = "count(/cmfSOIAdditionCollection/cmfSOIAddition/securityOfInterestIds[securityOfInterestId='" + ETFSOIName + "'])";&#13;
		return SoiCountXpath;</stringValue>
<type>CONSTANT</type>
</item>
<item id="214" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="215">["ETFSOIName"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="216">variables["ETFSOIName"]</name>
<stringValue id="217">ETFSOIName</stringValue>
<type>VARIABLE</type>
</item>
<item id="218" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="219">["SoiCountXpath"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="220">variables["SoiCountXpath"]</name>
<stringValue id="221">SOICountXpath</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="222" type="java.util.HashSet">
<item id="223" type="com.j2fe.workflow.definition.Transition">
<name id="224">goto-next</name>
<source id="225">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="226"/>
<directJoin>false</directJoin>
<name id="227">Get Lock JOB ID</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="228">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="229" type="java.util.HashSet">
<item id="230" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="231">database</name>
<stringValue id="232">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="233" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="234">firstColumnsResult[0]</name>
<stringValue id="235">lockJobId</stringValue>
<type>VARIABLE</type>
</item>
<item id="236" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="237">querySQL</name>
<stringValue id="238">SELECT new_oid() FROM dual</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="239" type="java.util.HashSet">
<item id="240" type="com.j2fe.workflow.definition.Transition">
<name id="241">goto-next</name>
<source id="242">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="243"/>
<directJoin>false</directJoin>
<name id="244">Get SOI Name</name>
<nodeHandler>com.j2fe.workflow.handler.impl.ExecuteXPath</nodeHandler>
<nodeHandlerClass id="245">com.j2fe.workflow.handler.impl.ExecuteXPath</nodeHandlerClass>
<parameters id="246" type="java.util.HashSet">
<item id="247" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="248">inputText</name>
<stringValue id="249">JMSTextMessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="250" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="251">outputValue</name>
<stringValue id="252">SOIName</stringValue>
<type>VARIABLE</type>
</item>
<item id="253" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="254">xPath</name>
<stringValue id="255">/cmfSOIAdditionCollection/cmfSOIAddition[1]/securityOfInterestIds/securityOfInterestId</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="256" type="java.util.HashSet">
<item id="257" type="com.j2fe.workflow.definition.Transition">
<name id="258">goto-next</name>
<source id="259">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="260"/>
<directJoin>false</directJoin>
<name id="261">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="262">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="263" type="java.util.HashSet"/>
<targets id="264" type="java.util.HashSet">
<item idref="257" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="242"/>
</item>
</sources>
<targets id="265" type="java.util.HashSet">
<item idref="240" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="225"/>
</item>
</sources>
<targets id="266" type="java.util.HashSet">
<item idref="223" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="206"/>
</item>
</sources>
<targets id="267" type="java.util.HashSet">
<item idref="204" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="189"/>
</item>
</sources>
<targets id="268" type="java.util.HashSet">
<item idref="187" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="162"/>
</item>
</sources>
<targets id="269" type="java.util.HashSet">
<item idref="160" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="155"/>
</item>
<item id="270" type="com.j2fe.workflow.definition.Transition">
<name id="271">goto-next</name>
<source id="272">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="273"/>
<directJoin>false</directJoin>
<name id="274">Wait 31 secs</name>
<nodeHandler>com.j2fe.scheduling.activities.Wait</nodeHandler>
<nodeHandlerClass id="275">com.j2fe.scheduling.activities.Wait</nodeHandlerClass>
<parameters id="276" type="java.util.HashSet">
<item id="277" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="278">secondsToWait</name>
<objectValue id="279" type="java.lang.Integer">31</objectValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="280" type="java.util.HashSet">
<item id="281" type="com.j2fe.workflow.definition.Transition">
<name id="282">goto-next</name>
<source id="283">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="284"/>
<directJoin>false</directJoin>
<name id="285">log lock failure</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="286">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="287" type="java.util.HashSet">
<item id="288" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="289">database</name>
<stringValue id="290">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="291" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="292">indexedParameters[0]</name>
<stringValue id="293">LockSOIName</stringValue>
<type>VARIABLE</type>
</item>
<item id="294" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="295">indexedParameters[1]</name>
<stringValue id="296">lockJobId</stringValue>
<type>VARIABLE</type>
</item>
<item id="297" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="298">querySQL</name>
<stringValue id="299">call mhi_sp_eventlog (&#13;
	  'cmfSOIAdditionLock',&#13;
	  'waiting to obtain lock for inventory ',&#13;
	  CAST(? AS VARCHAR),&#13;
	  CAST(? AS VARCHAR)&#13;
	);</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="300" type="java.util.HashSet">
<item id="301" type="com.j2fe.workflow.definition.Transition">
<name id="302">goto-next</name>
<source id="303">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="304"/>
<directJoin>false</directJoin>
<name id="305">reset db lock</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="306">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="307" type="java.util.HashSet">
<item id="308" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="309">database</name>
<stringValue id="310">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="311" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="312">indexedParameters[0]</name>
<stringValue id="313">LockSOIName</stringValue>
<type>VARIABLE</type>
</item>
<item id="314" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="315">indexedParameters[1]</name>
<stringValue id="316">lockJobId</stringValue>
<type>VARIABLE</type>
</item>
<item id="317" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="318">querySQL</name>
<stringValue id="319">delete CMFSOIADDITION_LOCK where KEYS = CAST(? AS VARCHAR) and JOB_ID = CAST(? AS VARCHAR);</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="320" type="java.util.HashSet">
<item id="321" type="com.j2fe.workflow.definition.Transition">
<name id="322">rows-found</name>
<source idref="29"/>
<target idref="303"/>
</item>
</sources>
<targets id="323" type="java.util.HashSet">
<item idref="301" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="283"/>
</item>
<item id="324" type="com.j2fe.workflow.definition.Transition">
<name id="325">nothing-found</name>
<source idref="64"/>
<target idref="283"/>
</item>
<item id="326" type="com.j2fe.workflow.definition.Transition">
<name id="327">rows-found</name>
<source idref="111"/>
<target idref="283"/>
</item>
</sources>
<targets id="328" type="java.util.HashSet">
<item idref="281" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="272"/>
</item>
</sources>
<targets id="329" type="java.util.HashSet">
<item idref="270" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="155"/>
</item>
</sources>
<targets id="330" type="java.util.HashSet">
<item idref="153" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="135"/>
</item>
</sources>
<targets id="331" type="java.util.HashSet">
<item idref="133" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="111"/>
</item>
</sources>
<targets id="332" type="java.util.HashSet">
<item idref="109" type="com.j2fe.workflow.definition.Transition"/>
<item idref="326" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="88"/>
</item>
</sources>
<targets id="333" type="java.util.HashSet">
<item idref="86" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="64"/>
</item>
</sources>
<targets id="334" type="java.util.HashSet">
<item idref="324" type="com.j2fe.workflow.definition.Transition"/>
<item idref="62" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="53"/>
</item>
</sources>
<targets id="335" type="java.util.HashSet">
<item idref="51" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="29"/>
</item>
</sources>
<targets id="336" type="java.util.HashSet">
<item idref="27" type="com.j2fe.workflow.definition.Transition"/>
<item idref="321" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="9"/>
</item>
</sources>
<targets id="337" type="java.util.HashSet">
<item idref="7" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="2"/>
</item>
</sources>
<targets id="338" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="339">Mizuho</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="340">user1</lastChangeUser>
<lastUpdate id="341">2025-07-04T05:49:07.000+0100</lastUpdate>
<name id="342">cmfSOIAdditionLock</name>
<nodes id="343" type="java.util.HashSet">
<item idref="206" type="com.j2fe.workflow.definition.Node"/>
<item idref="225" type="com.j2fe.workflow.definition.Node"/>
<item idref="189" type="com.j2fe.workflow.definition.Node"/>
<item idref="242" type="com.j2fe.workflow.definition.Node"/>
<item idref="88" type="com.j2fe.workflow.definition.Node"/>
<item idref="259" type="com.j2fe.workflow.definition.Node"/>
<item idref="2" type="com.j2fe.workflow.definition.Node"/>
<item idref="162" type="com.j2fe.workflow.definition.Node"/>
<item idref="272" type="com.j2fe.workflow.definition.Node"/>
<item idref="64" type="com.j2fe.workflow.definition.Node"/>
<item idref="29" type="com.j2fe.workflow.definition.Node"/>
<item idref="155" type="com.j2fe.workflow.definition.Node"/>
<item idref="283" type="com.j2fe.workflow.definition.Node"/>
<item idref="9" type="com.j2fe.workflow.definition.Node"/>
<item idref="135" type="com.j2fe.workflow.definition.Node"/>
<item idref="111" type="com.j2fe.workflow.definition.Node"/>
<item idref="303" type="com.j2fe.workflow.definition.Node"/>
<item idref="53" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>false</optimize>
<parameter id="344" type="java.util.HashMap">
<entry>
<key id="345" type="java.lang.String">JMSTextMessage</key>
<value id="346" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="347">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="348">XML message containing SOI Additions</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="349" type="java.lang.String">LockSOIName</key>
<value id="350" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="351">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="352">The SOI Name used for controlling the lock on soi Additions</description>
<input>false</input>
<output>true</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="353" type="java.lang.String">lockJobId</key>
<value id="354" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="355">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>false</input>
<output>true</output>
<required>false</required>
</value>
</entry>
</parameter>
<permissions id="356" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>false</purgeAtEnd>
<retries>0</retries>
<startNode idref="259"/>
<status>RELEASED</status>
<variables id="357" type="java.util.HashMap">
<entry>
<key id="358" type="java.lang.String">ETFSOIName</key>
<value id="359" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="360">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>true</persistent>
<value id="361" type="java.lang.String">MHI ETF Basket Inventory</value>
</value>
</entry>
<entry>
<key id="362" type="java.lang.String">JMSTextMessage</key>
<value id="363" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="364">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="365">XML message containing SOI Additions</description>
<persistent>true</persistent>
</value>
</entry>
<entry>
<key id="366" type="java.lang.String">LockSOIName</key>
<value id="367" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="368">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="369">The SOI Name used for controlling the lock on soi Additions</description>
<persistent>true</persistent>
</value>
</entry>
<entry>
<key id="370" type="java.lang.String">lockJobId</key>
<value id="371" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="372">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>true</persistent>
</value>
</entry>
</variables>
<version>5</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
