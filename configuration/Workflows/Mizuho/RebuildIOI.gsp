<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.04">
<package-comment/>
<businessobject displayString="8 - V-10 Raise remote events" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>true</alwaysPersist>
<clustered>true</clustered>
<comment id="1">V-10 Raise remote events</comment>
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
<name id="9">log job finish</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="10">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="11" type="java.util.HashSet">
<item id="12" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="13">database</name>
<stringValue id="14">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="15" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="16">querySQL</name>
<stringValue id="17">begin &#13;
 mhi_sp_eventlog (&#13;
	 'RebuildIOI Workflow',&#13;
	 'workflow ending',&#13;
	'N/A'); &#13;
end;</stringValue>
<type>CONSTANT</type>
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
<name id="23">XML publish end dated issuers</name>
<nodeHandler>com.j2fe.event.RaiseEventRemote</nodeHandler>
<nodeHandlerClass id="24">com.j2fe.event.RaiseEventRemote</nodeHandlerClass>
<parameters id="25" type="java.util.HashSet">
<item id="26" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="27">eventName</name>
<stringValue id="28">PublishUsingXML</stringValue>
<type>CONSTANT</type>
</item>
<item id="29" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="30">["JobXML"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="31">parameters["JobXML"]</name>
<objectValue id="32" type="java.lang.String">&lt;?xml version="1.0" encoding="UTF-8"?&gt;&lt;root&gt; &lt;job modelId="ISSRPUB" destinationJMS="jms/queue/issuer"&gt; &lt;sql&gt;INSTR_ISSR_ID IN (SELECT DISTINCT INSTR_ISSR_ID FROM FT_T_IOI1 WHERE DELETE_FROM_IOI = 'Y'  AND INSTR_ISSR_ID != 'CONTROL')&lt;/sql&gt; &lt;/job&gt;&lt;/root&gt;</objectValue>
<type>CONSTANT</type>
</item>
<item id="33" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="34">propertyFileLocation</name>
<stringValue id="35">db://resource/PublishingConfiguration/PublishingConfig.properties</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="36" type="java.util.HashSet">
<item id="37" type="com.j2fe.workflow.definition.Transition">
<name id="38">goto-next</name>
<source id="39">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<directJoin>true</directJoin>
<name id="40">Synchronize</name>
<nodeHandler>com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandler>
<nodeHandlerClass id="41">com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandlerClass>
<sources id="42" type="java.util.HashSet">
<item id="43" type="com.j2fe.workflow.definition.Transition">
<name id="44">end-loop</name>
<source id="45">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="46">Loop each old issuer</name>
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
<stringValue id="57">BulkOldIssuers</stringValue>
<type>VARIABLE</type>
</item>
<item id="58" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="59">output</name>
<stringValue id="60">oldIssuer</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="61" type="java.util.HashSet">
<item id="62" type="com.j2fe.workflow.definition.Transition">
<name id="63">ToSplit</name>
<source id="64">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="65">Automatically generated</description>
<directJoin>false</directJoin>
<name id="66">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="67">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="68" type="java.util.HashSet">
<item id="69" type="com.j2fe.workflow.definition.Transition">
<name id="70">goto-next</name>
<source id="71">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="72">Bean Shell Script (Standard)</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="73">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="74" type="java.util.HashSet">
<item id="75" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="76">statements</name>
<stringValue id="77">int loopCounter =0;</stringValue>
<type>CONSTANT</type>
</item>
<item id="78" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="79">variables["loopCounter"]</name>
<stringValue id="80">LoopCounter</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="81" type="java.util.HashSet">
<item id="82" type="com.j2fe.workflow.definition.Transition">
<name id="83">goto-next</name>
<source id="84">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>true</directJoin>
<name id="85">Bulk delete IOI</name>
<nodeHandler>com.j2fe.general.activities.BulkItems</nodeHandler>
<nodeHandlerClass id="86">com.j2fe.general.activities.BulkItems</nodeHandlerClass>
<parameters id="87" type="java.util.HashSet">
<item id="88" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="89">bulk</name>
<stringValue id="90">BulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="91" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="92">input</name>
<stringValue id="93">oldIssuers</stringValue>
<type>VARIABLE</type>
</item>
<item id="94" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="95">output</name>
<stringValue id="96">BulkOldIssuers</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="97" type="java.util.HashSet">
<item id="98" type="com.j2fe.workflow.definition.Transition">
<name id="99">rows-found</name>
<source id="100">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="101">Issuers to remove from IOI</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="102">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="103" type="java.util.HashSet">
<item id="104" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="105">database</name>
<stringValue id="106">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="107" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="108">firstColumnsResult</name>
<stringValue id="109">oldIssuers</stringValue>
<type>VARIABLE</type>
</item>
<item id="110" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="111">querySQL</name>
<stringValue id="112">select INSTR_ISSR_ID from FT_T_IOI1 where UPDATED='N' and DELETE_FROM_IOI = 'Y'  AND INSTR_ISSR_ID != 'CONTROL'</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="113" type="java.util.HashSet">
<item id="114" type="com.j2fe.workflow.definition.Transition">
<name id="115">ToSplit</name>
<source id="116">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="117">Automatically generated</description>
<directJoin>false</directJoin>
<name id="118">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="119">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="120" type="java.util.HashSet">
<item id="121" type="com.j2fe.workflow.definition.Transition">
<name id="122">goto-next</name>
<source id="123">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<directJoin>true</directJoin>
<name id="124">Synchronize</name>
<nodeHandler>com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandler>
<nodeHandlerClass id="125">com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandlerClass>
<sources id="126" type="java.util.HashSet">
<item id="127" type="com.j2fe.workflow.definition.Transition">
<name id="128">end-loop</name>
<source id="129">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="130">Loop each locked issuer</name>
<nodeHandler>com.j2fe.workflow.handler.impl.ForEach</nodeHandler>
<nodeHandlerClass id="131">com.j2fe.workflow.handler.impl.ForEach</nodeHandlerClass>
<parameters id="132" type="java.util.HashSet">
<item id="133" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="134">counter</name>
<stringValue id="135">LoopCounter</stringValue>
<type>VARIABLE</type>
</item>
<item id="136" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="137">counter</name>
<stringValue id="138">LoopCounter</stringValue>
<type>VARIABLE</type>
</item>
<item id="139" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="140">input</name>
<stringValue id="141">BulkLockedIssuers</stringValue>
<type>VARIABLE</type>
</item>
<item id="142" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="143">output</name>
<stringValue id="144">lockedIssuer</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="145" type="java.util.HashSet">
<item id="146" type="com.j2fe.workflow.definition.Transition">
<name id="147">ToSplit</name>
<source id="148">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="149">Automatically generated</description>
<directJoin>false</directJoin>
<name id="150">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="151">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="152" type="java.util.HashSet">
<item id="153" type="com.j2fe.workflow.definition.Transition">
<name id="154">goto-next</name>
<source id="155">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="156">Bean Shell Script (Standard)</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="157">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="158" type="java.util.HashSet">
<item id="159" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="160">statements</name>
<stringValue id="161">int loopCounter =0;</stringValue>
<type>CONSTANT</type>
</item>
<item id="162" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="163">variables["loopCounter"]</name>
<stringValue id="164">LoopCounter</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="165" type="java.util.HashSet">
<item id="166" type="com.j2fe.workflow.definition.Transition">
<name id="167">goto-next</name>
<source id="168">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>true</directJoin>
<name id="169">Bulk update locked issuers</name>
<nodeHandler>com.j2fe.general.activities.BulkItems</nodeHandler>
<nodeHandlerClass id="170">com.j2fe.general.activities.BulkItems</nodeHandlerClass>
<parameters id="171" type="java.util.HashSet">
<item id="172" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="173">bulk</name>
<stringValue id="174">BulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="175" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="176">input</name>
<stringValue id="177">lockedIssuers</stringValue>
<type>VARIABLE</type>
</item>
<item id="178" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="179">output</name>
<stringValue id="180">BulkLockedIssuers</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="181" type="java.util.HashSet">
<item id="182" type="com.j2fe.workflow.definition.Transition">
<name id="183">rows-found</name>
<source id="184">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="185">Check for locks</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="186">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="187" type="java.util.HashSet">
<item id="188" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="189">database</name>
<stringValue id="190">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="191" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="192">firstColumnsResult</name>
<stringValue id="193">lockedIssuers</stringValue>
<type>VARIABLE</type>
</item>
<item id="194" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="195">querySQL</name>
<stringValue id="196">select INSTR_ISSR_ID from FT_T_IOI1 where UPDATED='N' and DELETE_FROM_IOI = 'Y'  AND INSTR_ISSR_ID != 'CONTROL'&#13;
and INSTR_ISSR_ID in (select OVR_REF_OID from ft_t_ovrc where tbl_id = 'IRGP' and END_TMS is null)</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="197" type="java.util.HashSet">
<item id="198" type="com.j2fe.workflow.definition.Transition">
<name id="199">goto-next</name>
<source id="200">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="201">Flag Issuers to remove from IOI</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="202">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="203" type="java.util.HashSet">
<item id="204" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="205">database</name>
<stringValue id="206">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="207" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="208">querySQL</name>
<stringValue id="209">UPDATE FT_T_IOI1 SET DELETE_FROM_IOI='Y'&#13;
WHERE ASSET_SOI = 'N' AND GTOR='N' AND CUST='N' AND ASSET_RUP='N' AND GTOR_RUP='N' AND CUST_RUP='N' AND CUST_IP='N' AND FENERGO='N' AND FENERGO_IP='N' AND FENERGO_RUP='N' and LAGR_FLAR = 'N' and LAGR_FLAR_RUP = 'N' and INSTR_ISSR_ID != 'CONTROL'</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="210" type="java.util.HashSet">
<item id="211" type="com.j2fe.workflow.definition.Transition">
<name id="212">ToSplit</name>
<source id="213">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="214">Automatically generated</description>
<directJoin>false</directJoin>
<name id="215">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="216">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="217" type="java.util.HashSet">
<item id="218" type="com.j2fe.workflow.definition.Transition">
<name id="219">goto-next</name>
<source id="220">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<directJoin>true</directJoin>
<name id="221">Synchronize</name>
<nodeHandler>com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandler>
<nodeHandlerClass id="222">com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandlerClass>
<sources id="223" type="java.util.HashSet">
<item id="224" type="com.j2fe.workflow.definition.Transition">
<name id="225">end-loop</name>
<source id="226">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="227">Loop each new issuer</name>
<nodeHandler>com.j2fe.workflow.handler.impl.ForEach</nodeHandler>
<nodeHandlerClass id="228">com.j2fe.workflow.handler.impl.ForEach</nodeHandlerClass>
<parameters id="229" type="java.util.HashSet">
<item id="230" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="231">counter</name>
<stringValue id="232">LoopCounter</stringValue>
<type>VARIABLE</type>
</item>
<item id="233" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="234">counter</name>
<stringValue id="235">LoopCounter</stringValue>
<type>VARIABLE</type>
</item>
<item id="236" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="237">input</name>
<stringValue id="238">newNonRUPIssuers</stringValue>
<type>VARIABLE</type>
</item>
<item id="239" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="240">output</name>
<stringValue id="241">nonRUPIssuer</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="242" type="java.util.HashSet">
<item id="243" type="com.j2fe.workflow.definition.Transition">
<name id="244">ToSplit</name>
<source id="245">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="246">Automatically generated</description>
<directJoin>false</directJoin>
<name id="247">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="248">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="249" type="java.util.HashSet">
<item id="250" type="com.j2fe.workflow.definition.Transition">
<name id="251">goto-next</name>
<source id="252">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="253">Bean Shell Script (Standard)</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="254">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="255" type="java.util.HashSet">
<item id="256" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="257">statements</name>
<stringValue id="258">int loopCounter =0;</stringValue>
<type>CONSTANT</type>
</item>
<item id="259" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="260">variables["loopCounter"]</name>
<stringValue id="261">LoopCounter</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="262" type="java.util.HashSet">
<item id="263" type="com.j2fe.workflow.definition.Transition">
<name id="264">goto-next</name>
<source id="265">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>true</directJoin>
<name id="266">Bulk newIssuers</name>
<nodeHandler>com.j2fe.general.activities.BulkItems</nodeHandler>
<nodeHandlerClass id="267">com.j2fe.general.activities.BulkItems</nodeHandlerClass>
<parameters id="268" type="java.util.HashSet">
<item id="269" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="270">bulk</name>
<stringValue id="271">BulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="272" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="273">input</name>
<stringValue id="274">newNonRUPIssuers</stringValue>
<type>VARIABLE</type>
</item>
<item id="275" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="276">output</name>
<stringValue id="277">BulknonRUPIssuers</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="278" type="java.util.HashSet">
<item id="279" type="com.j2fe.workflow.definition.Transition">
<name id="280">rows-found</name>
<source id="281">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="282">Issuers to Add to IOI</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="283">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="284" type="java.util.HashSet">
<item id="285" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="286">database</name>
<stringValue id="287">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="288" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="289">firstColumnsResult</name>
<stringValue id="290">newNonRUPIssuers</stringValue>
<type>VARIABLE</type>
</item>
<item id="291" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="292">querySQL</name>
<stringValue id="293">select INSTR_ISSR_ID from FT_T_IOI1 where UPDATED='N' and NEW_IOI_MEMBER = 'Y' AND INSTR_ISSR_ID != 'CONTROL'</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="294" type="java.util.HashSet">
<item id="295" type="com.j2fe.workflow.definition.Transition">
<name id="296">ToSplit</name>
<source id="297">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="298">Automatically generated</description>
<directJoin>false</directJoin>
<name id="299">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="300">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="301" type="java.util.HashSet">
<item id="302" type="com.j2fe.workflow.definition.Transition">
<name id="303">goto-next</name>
<source id="304">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<directJoin>true</directJoin>
<name id="305">Synchronize</name>
<nodeHandler>com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandler>
<nodeHandlerClass id="306">com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandlerClass>
<sources id="307" type="java.util.HashSet">
<item id="308" type="com.j2fe.workflow.definition.Transition">
<name id="309">end-loop</name>
<source id="310">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="311">Loop each new issuer</name>
<nodeHandler>com.j2fe.workflow.handler.impl.ForEach</nodeHandler>
<nodeHandlerClass id="312">com.j2fe.workflow.handler.impl.ForEach</nodeHandlerClass>
<parameters id="313" type="java.util.HashSet">
<item id="314" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="315">counter</name>
<stringValue id="316">LoopCounter</stringValue>
<type>VARIABLE</type>
</item>
<item id="317" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="318">counter</name>
<stringValue id="319">LoopCounter</stringValue>
<type>VARIABLE</type>
</item>
<item id="320" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="321">input</name>
<stringValue id="322">BulkNewIssuers</stringValue>
<type>VARIABLE</type>
</item>
<item id="323" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="324">output</name>
<stringValue id="325">newIssuer</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="326" type="java.util.HashSet">
<item id="327" type="com.j2fe.workflow.definition.Transition">
<name id="328">ToSplit</name>
<source id="329">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="330">Automatically generated</description>
<directJoin>false</directJoin>
<name id="331">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="332">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="333" type="java.util.HashSet">
<item id="334" type="com.j2fe.workflow.definition.Transition">
<name id="335">goto-next</name>
<source id="336">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="337">Bean Shell Script (Standard)</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="338">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="339" type="java.util.HashSet">
<item id="340" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="341">statements</name>
<stringValue id="342">int loopCounter =0;</stringValue>
<type>CONSTANT</type>
</item>
<item id="343" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="344">variables["loopCounter"]</name>
<stringValue id="345">LoopCounter</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="346" type="java.util.HashSet">
<item id="347" type="com.j2fe.workflow.definition.Transition">
<name id="348">goto-next</name>
<source id="349">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>true</directJoin>
<name id="350">Bulk RUP newIssuers</name>
<nodeHandler>com.j2fe.general.activities.BulkItems</nodeHandler>
<nodeHandlerClass id="351">com.j2fe.general.activities.BulkItems</nodeHandlerClass>
<parameters id="352" type="java.util.HashSet">
<item id="353" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="354">bulk</name>
<stringValue id="355">BulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="356" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="357">input</name>
<stringValue id="358">newIssuers</stringValue>
<type>VARIABLE</type>
</item>
<item id="359" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="360">output</name>
<stringValue id="361">BulkNewIssuers</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="362" type="java.util.HashSet">
<item id="363" type="com.j2fe.workflow.definition.Transition">
<name id="364">rows-found</name>
<source id="365">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="366">RUP Issuers to Add to IOI</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="367">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="368" type="java.util.HashSet">
<item id="369" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="370">database</name>
<stringValue id="371">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="372" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="373">firstColumnsResult</name>
<stringValue id="374">newIssuers</stringValue>
<type>VARIABLE</type>
</item>
<item id="375" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="376">querySQL</name>
<stringValue id="377">select INSTR_ISSR_ID from FT_T_IOI1 where UPDATED='N' and NEW_IOI_MEMBER = 'Y' and (ASSET_RUP='Y' or GTOR_RUP='Y' or CUST_RUP='Y' or FENERGO_RUP = 'Y' or LAGR_FLAR_RUP = 'Y') AND INSTR_ISSR_ID != 'CONTROL'</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="378" type="java.util.HashSet">
<item id="379" type="com.j2fe.workflow.definition.Transition">
<name id="380">goto-next</name>
<source id="381">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="382">Create Request Transaction</name>
<nodeHandler>com.j2fe.streetlamp.activities.CreateTransaction</nodeHandler>
<nodeHandlerClass id="383">com.j2fe.streetlamp.activities.CreateTransaction</nodeHandlerClass>
<parameters id="384" type="java.util.HashSet">
<item id="385" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="386">flushImmediate</name>
<stringValue id="387">true</stringValue>
<type>CONSTANT</type>
</item>
<item id="388" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="389">jobId</name>
<stringValue id="390">ParentJobID</stringValue>
<type>VARIABLE</type>
</item>
<item id="391" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="392">transactionId</name>
<stringValue id="393">RequestTransaction</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="394" type="java.util.HashSet">
<item id="395" type="com.j2fe.workflow.definition.Transition">
<name id="396">goto-next</name>
<source id="397">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="398">LAGR_FLAR_RUP</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="399">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="400" type="java.util.HashSet">
<item id="401" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="402">database</name>
<stringValue id="403">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="404" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="405">querySQL</name>
<stringValue id="406">MERGE INTO FT_T_IOI1 s&#13;
USING (select distinct issr.instr_issr_id&#13;
from FT_T_FLAR flar&#13;
inner join FT_T_ISSR issr on mhi_fins_up(flar.inst_mnem) = issr.fins_inst_mnem and issr.end_tms is null&#13;
inner join FT_T_LAGR lagr on flar.leg_agrmnt_id = lagr.leg_agrmnt_id and lagr.AGRMNT_TERMINTN_DTE is null and lagr.AGRMNT_STAT_TYP not in ('SUPERSEDED', 'TERMNTED')&#13;
where flar.end_tms is null and lagr.ORG_ID in ('MHI','MHEU')) e&#13;
  ON (e.INSTR_ISSR_ID = s.INSTR_ISSR_ID)&#13;
WHEN MATCHED THEN&#13;
  UPDATE set LAGR_FLAR = 'Y'&#13;
    WHERE LAGR_FLAR != 'Y'&#13;
WHEN NOT MATCHED THEN&#13;
  INSERT (INSTR_ISSR_ID, UPDATING, UPDATED, ASSET_SOI, GTOR, CUST, ASSET_RUP, GTOR_RUP, CUST_RUP, NEW_IOI_MEMBER, CUST_IP, FENERGO, FENERGO_IP, FENERGO_RUP, LAGR_FLAR, LAGR_FLAR_RUP)&#13;
  VALUES ( e.INSTR_ISSR_ID, 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'Y','N','N','N','N', 'N', 'Y')</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="407" type="java.util.HashSet">
<item id="408" type="com.j2fe.workflow.definition.Transition">
<name id="409">rows-found</name>
<source id="410">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="411">Add LAGR_FLAR_RUP Issuers?</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="412">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="413" type="java.util.HashSet">
<item id="414" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="415">database</name>
<stringValue id="416">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="417" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="418">firstColumnsResult</name>
<stringValue id="419">newNonRUPIssuers</stringValue>
<type>VARIABLE</type>
</item>
<item id="420" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="421">querySQL</name>
<stringValue id="422">select 1 from FT_T_IOI1 where INSTR_ISSR_ID = 'CONTROL' and LAGR_FLAR_RUP ='Y'</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="423" type="java.util.HashSet">
<item id="424" type="com.j2fe.workflow.definition.Transition">
<name id="425">ToSplit</name>
<source id="426">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="427">Automatically generated</description>
<directJoin>false</directJoin>
<name id="428">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="429">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="430" type="java.util.HashSet">
<item id="431" type="com.j2fe.workflow.definition.Transition">
<name id="432">goto-next</name>
<source id="433">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="434">LAGR_FLAR</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="435">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="436" type="java.util.HashSet">
<item id="437" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="438">database</name>
<stringValue id="439">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="440" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="441">querySQL</name>
<stringValue id="442">MERGE INTO FT_T_IOI1 s&#13;
USING (select&#13;
 distinct issr.instr_issr_id&#13;
from FT_T_FLAR flar&#13;
inner join FT_T_ISSR issr on flar.inst_mnem = issr.fins_inst_mnem and issr.end_tms is null&#13;
inner join FT_T_LAGR lagr on flar.leg_agrmnt_id = lagr.leg_agrmnt_id and lagr.AGRMNT_TERMINTN_DTE is null and lagr.AGRMNT_STAT_TYP not in ('SUPERSEDED', 'TERMNTED')&#13;
where flar.end_tms is null and lagr.ORG_ID in ('MHI','MHEU')) e&#13;
  ON (e.INSTR_ISSR_ID = s.INSTR_ISSR_ID)&#13;
WHEN MATCHED THEN&#13;
  UPDATE set LAGR_FLAR = 'Y'&#13;
    WHERE LAGR_FLAR != 'Y'&#13;
WHEN NOT MATCHED THEN&#13;
  INSERT (INSTR_ISSR_ID, UPDATING, UPDATED, ASSET_SOI, GTOR, CUST, ASSET_RUP, GTOR_RUP, CUST_RUP, NEW_IOI_MEMBER, CUST_IP, FENERGO, FENERGO_IP, FENERGO_RUP, LAGR_FLAR, LAGR_FLAR_RUP)&#13;
  VALUES ( e.INSTR_ISSR_ID, 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'Y','N','N','N','N', 'Y', 'N')</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="443" type="java.util.HashSet">
<item id="444" type="com.j2fe.workflow.definition.Transition">
<name id="445">rows-found</name>
<source id="446">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="447">Add LAGR_FLAR Issuers?</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="448">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="449" type="java.util.HashSet">
<item id="450" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="451">database</name>
<stringValue id="452">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="453" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="454">firstColumnsResult</name>
<stringValue id="455">newNonRUPIssuers</stringValue>
<type>VARIABLE</type>
</item>
<item id="456" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="457">querySQL</name>
<stringValue id="458">select 1 from FT_T_IOI1 where INSTR_ISSR_ID = 'CONTROL' and LAGR_FLAR ='Y'</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="459" type="java.util.HashSet">
<item id="460" type="com.j2fe.workflow.definition.Transition">
<name id="461">ToSplit</name>
<source id="462">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="463">Automatically generated</description>
<directJoin>false</directJoin>
<name id="464">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="465">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="466" type="java.util.HashSet">
<item id="467" type="com.j2fe.workflow.definition.Transition">
<name id="468">goto-next</name>
<source id="469">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="470">FENERGO RUP</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="471">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="472" type="java.util.HashSet">
<item id="473" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="474">database</name>
<stringValue id="475">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="476" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="477">querySQL</name>
<stringValue id="478">MERGE INTO FT_T_IOI1 s&#13;
USING (select distinct(INSTR_ISSR_ID) from FT_T_ISSR where END_TMS IS NULL AND FINS_INST_MNEM in (select MHI_FINS_UP(INST_MNEM) from ft_t_fiid where FINS_ID_CTXT_TYP = 'FENERGOID'&#13;
          AND END_TMS IS NULL AND (INST_SYMBOL_STAT_TYP = 'ACTIVE' OR (INST_SYMBOL_STAT_TYP = 'INACTIVE' and INST_SYMBOL_STAT_TMS &gt;= trunc(sysdate - 35))))) e&#13;
  ON (e.INSTR_ISSR_ID = s.INSTR_ISSR_ID)&#13;
WHEN MATCHED THEN&#13;
  UPDATE set FENERGO_RUP = 'Y'&#13;
    WHERE FENERGO_RUP != 'Y'&#13;
WHEN NOT MATCHED THEN&#13;
  INSERT (INSTR_ISSR_ID, UPDATING, UPDATED, ASSET_SOI, GTOR, CUST, ASSET_RUP, GTOR_RUP, CUST_RUP, NEW_IOI_MEMBER, CUST_IP, FENERGO, FENERGO_IP, FENERGO_RUP, LAGR_FLAR, LAGR_FLAR_RUP)&#13;
  VALUES ( e.INSTR_ISSR_ID, 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'Y','N','N','N','Y', 'N','N')</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="479" type="java.util.HashSet">
<item id="480" type="com.j2fe.workflow.definition.Transition">
<name id="481">rows-found</name>
<source id="482">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="483">Add FENERGO RUP Issuers?</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="484">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="485" type="java.util.HashSet">
<item id="486" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="487">database</name>
<stringValue id="488">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="489" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="490">firstColumnsResult</name>
<stringValue id="491">newNonRUPIssuers</stringValue>
<type>VARIABLE</type>
</item>
<item id="492" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="493">querySQL</name>
<stringValue id="494">select 1 from FT_T_IOI1 where INSTR_ISSR_ID = 'CONTROL' and FENERGO_RUP ='Y'</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="495" type="java.util.HashSet">
<item id="496" type="com.j2fe.workflow.definition.Transition">
<name id="497">ToSplit</name>
<source id="498">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="499">Automatically generated</description>
<directJoin>false</directJoin>
<name id="500">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="501">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="502" type="java.util.HashSet">
<item id="503" type="com.j2fe.workflow.definition.Transition">
<name id="504">goto-next</name>
<source id="505">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="506">FENERGO IP</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="507">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="508" type="java.util.HashSet">
<item id="509" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="510">database</name>
<stringValue id="511">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="512" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="513">querySQL</name>
<stringValue id="514">MERGE INTO FT_T_IOI1 s&#13;
USING (select distinct(INSTR_ISSR_ID) from FT_T_ISSR where END_TMS IS NULL AND FINS_INST_MNEM in &#13;
(select PRNT_INST_MNEM FROM FT_T_FFRL where END_TMS IS NULL AND REL_TYP = 'PARNTCOF' AND INST_MNEM IN (&#13;
(select INST_MNEM from ft_t_fiid where FINS_ID_CTXT_TYP = 'FENERGOID' AND END_TMS IS NULL&#13;
AND (INST_SYMBOL_STAT_TYP = 'ACTIVE' OR (INST_SYMBOL_STAT_TYP = 'INACTIVE' AND INST_SYMBOL_STAT_TMS &gt;= trunc(sysdate - 35))))))) e&#13;
  ON (e.INSTR_ISSR_ID = s.INSTR_ISSR_ID)&#13;
WHEN MATCHED THEN&#13;
  UPDATE set FENERGO_IP = 'Y'&#13;
    WHERE FENERGO_IP != 'Y'&#13;
WHEN NOT MATCHED THEN&#13;
  INSERT (INSTR_ISSR_ID, UPDATING, UPDATED, ASSET_SOI, GTOR, CUST, ASSET_RUP, GTOR_RUP, CUST_RUP, NEW_IOI_MEMBER, CUST_IP, FENERGO, FENERGO_IP, FENERGO_RUP, LAGR_FLAR, LAGR_FLAR_RUP)&#13;
  VALUES ( e.INSTR_ISSR_ID, 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'Y','N','N','Y','N', 'N', 'N')</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="515" type="java.util.HashSet">
<item id="516" type="com.j2fe.workflow.definition.Transition">
<name id="517">rows-found</name>
<source id="518">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="519">Add FENERGO IP Issuers?</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="520">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="521" type="java.util.HashSet">
<item id="522" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="523">database</name>
<stringValue id="524">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="525" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="526">firstColumnsResult</name>
<stringValue id="527">newNonRUPIssuers</stringValue>
<type>VARIABLE</type>
</item>
<item id="528" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="529">querySQL</name>
<stringValue id="530">select 1 from FT_T_IOI1 where INSTR_ISSR_ID = 'CONTROL' and FENERGO_IP ='Y'</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="531" type="java.util.HashSet">
<item id="532" type="com.j2fe.workflow.definition.Transition">
<name id="533">ToSplit</name>
<source id="534">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="535">Automatically generated</description>
<directJoin>false</directJoin>
<name id="536">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="537">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="538" type="java.util.HashSet">
<item id="539" type="com.j2fe.workflow.definition.Transition">
<name id="540">goto-next</name>
<source id="541">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="542">FENERGO</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="543">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="544" type="java.util.HashSet">
<item id="545" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="546">database</name>
<stringValue id="547">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="548" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="549">querySQL</name>
<stringValue id="550">MERGE INTO FT_T_IOI1 s&#13;
USING (select distinct(INSTR_ISSR_ID) from FT_T_ISSR where END_TMS IS NULL AND FINS_INST_MNEM in (select INST_MNEM from ft_t_fiid where FINS_ID_CTXT_TYP = 'FENERGOID'&#13;
          AND END_TMS IS NULL AND (INST_SYMBOL_STAT_TYP = 'ACTIVE' OR (INST_SYMBOL_STAT_TYP = 'INACTIVE' AND INST_SYMBOL_STAT_TMS &gt;= trunc(sysdate - 35))))) e&#13;
  ON (e.INSTR_ISSR_ID = s.INSTR_ISSR_ID)&#13;
WHEN MATCHED THEN&#13;
  UPDATE set FENERGO = 'Y'&#13;
    WHERE FENERGO != 'Y'&#13;
WHEN NOT MATCHED THEN&#13;
  INSERT (INSTR_ISSR_ID, UPDATING, UPDATED, ASSET_SOI, GTOR, CUST, ASSET_RUP, GTOR_RUP, CUST_RUP, NEW_IOI_MEMBER, CUST_IP, FENERGO, FENERGO_IP, FENERGO_RUP, LAGR_FLAR, LAGR_FLAR_RUP)&#13;
  VALUES ( e.INSTR_ISSR_ID, 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'Y','N','Y','N','N', 'N', 'N')</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="551" type="java.util.HashSet">
<item id="552" type="com.j2fe.workflow.definition.Transition">
<name id="553">rows-found</name>
<source id="554">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="555">Add FENERGO Issuers?</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="556">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="557" type="java.util.HashSet">
<item id="558" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="559">database</name>
<stringValue id="560">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="561" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="562">firstColumnsResult</name>
<stringValue id="563">newNonRUPIssuers</stringValue>
<type>VARIABLE</type>
</item>
<item id="564" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="565">querySQL</name>
<stringValue id="566">select 1 from FT_T_IOI1 where INSTR_ISSR_ID = 'CONTROL' and FENERGO ='Y'</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="567" type="java.util.HashSet">
<item id="568" type="com.j2fe.workflow.definition.Transition">
<name id="569">ToSplit</name>
<source id="570">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="571">Automatically generated</description>
<directJoin>false</directJoin>
<name id="572">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="573">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="574" type="java.util.HashSet">
<item id="575" type="com.j2fe.workflow.definition.Transition">
<name id="576">goto-next</name>
<source id="577">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="578">CUST IPS</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="579">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="580" type="java.util.HashSet">
<item id="581" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="582">database</name>
<stringValue id="583">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="584" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="585">querySQL</name>
<objectValue id="586" type="java.lang.String">MERGE INTO FT_T_IOI1 s&#13;
USING (select distinct(INSTR_ISSR_ID) from FT_T_ISSR where END_TMS IS NULL AND FINS_INST_MNEM in &#13;
(select PRNT_INST_MNEM FROM FT_T_FFRL where END_TMS IS NULL AND REL_TYP = 'PARNTCOF' AND INST_MNEM IN (&#13;
(SELECT FINS_INST_MNEM FROM FT_T_ISSR WHERE END_TMS IS NULL AND FINS_INST_MNEM IN&#13;
   (SELECT INST_MNEM FROM FT_T_CUST WHERE END_TMS IS NULL&#13;
    and CST_ID in (select CST_ID FROM FT_T_CSST WHERE STAT_DEF_ID = 'CLOSDATE' AND END_TMS IS NULL)&#13;
    and (CST_STAT_TYP IN ('ACTIVE',  'PENDING') OR CST_ID IN&#13;
    (SELECT CST_ID FROM FT_T_CSST WHERE STAT_DEF_ID = 'CLOSDATE' AND END_TMS IS NULL AND STAT_VAL_DTE &gt; SYSDATE-35))))))) e&#13;
  ON (e.INSTR_ISSR_ID = s.INSTR_ISSR_ID)&#13;
WHEN MATCHED THEN&#13;
  UPDATE set CUST_IP = 'Y'&#13;
    WHERE CUST_IP != 'Y'&#13;
WHEN NOT MATCHED THEN&#13;
  INSERT (INSTR_ISSR_ID, UPDATING, UPDATED, ASSET_SOI, GTOR, CUST, ASSET_RUP, GTOR_RUP, CUST_RUP, NEW_IOI_MEMBER, CUST_IP, FENERGO, FENERGO_IP, FENERGO_RUP, LAGR_FLAR, LAGR_FLAR_RUP)&#13;
  VALUES ( e.INSTR_ISSR_ID, 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'Y','Y','N','N','N', 'N', 'N')</objectValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="587" type="java.util.HashSet">
<item id="588" type="com.j2fe.workflow.definition.Transition">
<name id="589">rows-found</name>
<source id="590">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="591">Add CUST IP Issuers?</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="592">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="593" type="java.util.HashSet">
<item id="594" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="595">database</name>
<stringValue id="596">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="597" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="598">firstColumnsResult</name>
<stringValue id="599">newNonRUPIssuers</stringValue>
<type>VARIABLE</type>
</item>
<item id="600" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="601">querySQL</name>
<stringValue id="602">select 1 from FT_T_IOI1 where INSTR_ISSR_ID = 'CONTROL' and CUST_IP ='Y'</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="603" type="java.util.HashSet">
<item id="604" type="com.j2fe.workflow.definition.Transition">
<name id="605">ToSplit</name>
<source id="606">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="607">Automatically generated</description>
<directJoin>false</directJoin>
<name id="608">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="609">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="610" type="java.util.HashSet">
<item id="611" type="com.j2fe.workflow.definition.Transition">
<name id="612">goto-next</name>
<source id="613">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="614">CUST RUPS</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="615">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="616" type="java.util.HashSet">
<item id="617" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="618">database</name>
<stringValue id="619">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="620" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="621">querySQL</name>
<objectValue id="622" type="java.lang.String">MERGE INTO FT_T_IOI1 s&#13;
USING (select distinct INSTR_ISSR_ID from ft_t_issr where END_TMS IS NULL AND FINS_INST_MNEM in&#13;
  (select MHI_FINS_UP(fins_inst_mnem) from ft_t_issr where END_TMS IS NULL AND instr_issr_id in&#13;
   (SELECT INSTR_ISSR_ID FROM FT_T_ISSR WHERE END_TMS IS NULL AND FINS_INST_MNEM IN&#13;
   (SELECT INST_MNEM FROM FT_T_CUST WHERE END_TMS IS NULL&#13;
    and CST_ID in (select CST_ID FROM FT_T_CSST WHERE STAT_DEF_ID = 'CLOSDATE' AND END_TMS IS NULL)&#13;
    and (CST_STAT_TYP IN ('ACTIVE',  'PENDING') OR CST_ID IN&#13;
    (SELECT CST_ID FROM FT_T_CSST WHERE STAT_DEF_ID = 'CLOSDATE' AND END_TMS IS NULL AND STAT_VAL_DTE &gt; SYSDATE-35)))))) e&#13;
  ON (e.INSTR_ISSR_ID = s.INSTR_ISSR_ID)&#13;
WHEN MATCHED THEN&#13;
  UPDATE set CUST_RUP = 'Y'&#13;
    WHERE CUST_RUP != 'Y'&#13;
WHEN NOT MATCHED THEN&#13;
  INSERT (INSTR_ISSR_ID, UPDATING, UPDATED, ASSET_SOI, GTOR, CUST, ASSET_RUP, GTOR_RUP, CUST_RUP, NEW_IOI_MEMBER, CUST_IP, FENERGO, FENERGO_IP, FENERGO_RUP, LAGR_FLAR, LAGR_FLAR_RUP)&#13;
  VALUES ( e.INSTR_ISSR_ID, 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'Y', 'Y','N','N','N','N', 'N', 'N')</objectValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="623" type="java.util.HashSet">
<item id="624" type="com.j2fe.workflow.definition.Transition">
<name id="625">rows-found</name>
<source id="626">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="627">Add CUST RUP Issuers?</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="628">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="629" type="java.util.HashSet">
<item id="630" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="631">database</name>
<stringValue id="632">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="633" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="634">firstColumnsResult</name>
<stringValue id="635">newNonRUPIssuers</stringValue>
<type>VARIABLE</type>
</item>
<item id="636" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="637">querySQL</name>
<stringValue id="638">select 1 from FT_T_IOI1 where INSTR_ISSR_ID = 'CONTROL' and CUST_RUP ='Y'</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="639" type="java.util.HashSet">
<item id="640" type="com.j2fe.workflow.definition.Transition">
<name id="641">ToSplit</name>
<source id="642">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="643">Automatically generated</description>
<directJoin>false</directJoin>
<name id="644">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="645">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="646" type="java.util.HashSet">
<item id="647" type="com.j2fe.workflow.definition.Transition">
<name id="648">goto-next</name>
<source id="649">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="650">GTOR RUPS</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="651">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="652" type="java.util.HashSet">
<item id="653" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="654">database</name>
<stringValue id="655">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="656" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="657">querySQL</name>
<objectValue id="658" type="java.lang.String">MERGE INTO FT_T_IOI1 s&#13;
USING (select distinct INSTR_ISSR_ID from ft_t_issr where END_TMS IS NULL AND FINS_INST_MNEM in&#13;
  (select MHI_FINS_UP(fins_inst_mnem) from ft_t_issr where END_TMS IS NULL AND instr_issr_id in&#13;
    (SELECT INSTR_ISSR_ID FROM FT_T_ISSR WHERE END_TMS IS NULL AND FINS_INST_MNEM IN&#13;
      (SELECT DISTINCT INST_MNEM FROM FT_T_FRIP WHERE FINSRL_TYP = 'GUARNTOR' AND END_TMS IS NULL AND INSTR_ID IN&#13;
          (SELECT INSTR_ID FROM FT_T_ISSU WHERE END_TMS IS NULL AND INSTR_ID IN &#13;
            (SELECT INSTR_ID FROM FT_T_ISGP WHERE END_TMS IS NULL AND  FT_T_ISGP.PRNT_ISS_GRP_OID NOT IN ( 'ISGR000013','ISGR000714','ISGR000715')&#13;
            and PRNT_ISS_GRP_OID IN (select ISS_GRP_OID from FT_T_ISGR where ORG_ID IN ('MHI','MHEU'))&#13;
            AND FT_T_ISGP.PRT_PURP_TYP = 'INTEREST')))))) e&#13;
  ON (e.INSTR_ISSR_ID = s.INSTR_ISSR_ID)&#13;
WHEN MATCHED THEN&#13;
  UPDATE set GTOR_RUP = 'Y'&#13;
    WHERE GTOR_RUP != 'Y'&#13;
WHEN NOT MATCHED THEN&#13;
  INSERT (INSTR_ISSR_ID, UPDATING, UPDATED, ASSET_SOI, GTOR, CUST, ASSET_RUP, GTOR_RUP, CUST_RUP, NEW_IOI_MEMBER, CUST_IP, FENERGO, FENERGO_IP, FENERGO_RUP, LAGR_FLAR, LAGR_FLAR_RUP)&#13;
  VALUES ( e.INSTR_ISSR_ID, 'N', 'N', 'N', 'N', 'N', 'N', 'Y', 'N', 'Y','N','N','N','N', 'N', 'N')</objectValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="659" type="java.util.HashSet">
<item id="660" type="com.j2fe.workflow.definition.Transition">
<name id="661">rows-found</name>
<source id="662">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="663">Add GTOR RUP Issuers?</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="664">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="665" type="java.util.HashSet">
<item id="666" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="667">database</name>
<stringValue id="668">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="669" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="670">firstColumnsResult</name>
<stringValue id="671">newNonRUPIssuers</stringValue>
<type>VARIABLE</type>
</item>
<item id="672" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="673">querySQL</name>
<stringValue id="674">select 1 from FT_T_IOI1 where INSTR_ISSR_ID = 'CONTROL' and GTOR_RUP ='Y'</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="675" type="java.util.HashSet">
<item id="676" type="com.j2fe.workflow.definition.Transition">
<name id="677">ToSplit</name>
<source id="678">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="679">Automatically generated</description>
<directJoin>false</directJoin>
<name id="680">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="681">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="682" type="java.util.HashSet">
<item id="683" type="com.j2fe.workflow.definition.Transition">
<name id="684">goto-next</name>
<source id="685">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="686">SOI Asset RUPS</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="687">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="688" type="java.util.HashSet">
<item id="689" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="690">database</name>
<stringValue id="691">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="692" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="693">querySQL</name>
<stringValue id="694">MERGE INTO FT_T_IOI1 S&#13;
USING (SELECT DISTINCT INSTR_ISSR_ID FROM FT_T_ISSR WHERE END_TMS IS NULL AND FINS_INST_MNEM IN (&#13;
  SELECT MHI_FINS_UP(FINS_INST_MNEM) FROM FT_T_ISSR WHERE END_TMS IS NULL AND INSTR_ISSR_ID IN (&#13;
    SELECT INSTR_ISSR_ID FROM FT_T_ISSU WHERE END_TMS IS NULL AND INSTR_ID IN (&#13;
      SELECT INSTR_ID FROM FT_T_ISGP WHERE END_TMS IS NULL AND  FT_T_ISGP.PRNT_ISS_GRP_OID NOT IN ( 'ISGR000013','ISGR000714','ISGR000715')&#13;
      and PRNT_ISS_GRP_OID IN (select ISS_GRP_OID from FT_T_ISGR where ORG_ID IN ('MHI','MHEU'))&#13;
      AND FT_T_ISGP.PRT_PURP_TYP = 'INTEREST')))) E&#13;
  ON (E.INSTR_ISSR_ID = S.INSTR_ISSR_ID)&#13;
WHEN MATCHED THEN&#13;
  UPDATE SET ASSET_RUP = 'Y'&#13;
    WHERE ASSET_RUP != 'Y'&#13;
WHEN NOT MATCHED THEN&#13;
  INSERT (INSTR_ISSR_ID, UPDATING, UPDATED, ASSET_SOI, GTOR, CUST, ASSET_RUP, GTOR_RUP, CUST_RUP, NEW_IOI_MEMBER, CUST_IP, FENERGO, FENERGO_IP, FENERGO_RUP, LAGR_FLAR, LAGR_FLAR_RUP)&#13;
  VALUES ( E.INSTR_ISSR_ID, 'N', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'Y','N','N','N','N', 'N', 'N')</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="695" type="java.util.HashSet">
<item id="696" type="com.j2fe.workflow.definition.Transition">
<name id="697">rows-found</name>
<source id="698">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="699">Add ASSET_RUP Issuers?</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="700">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="701" type="java.util.HashSet">
<item id="702" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="703">database</name>
<stringValue id="704">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="705" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="706">firstColumnsResult</name>
<stringValue id="707">newNonRUPIssuers</stringValue>
<type>VARIABLE</type>
</item>
<item id="708" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="709">querySQL</name>
<stringValue id="710">select 1 from FT_T_IOI1 where INSTR_ISSR_ID = 'CONTROL' and ASSET_RUP ='Y'</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="711" type="java.util.HashSet">
<item id="712" type="com.j2fe.workflow.definition.Transition">
<name id="713">ToSplit</name>
<source id="714">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="715">Automatically generated</description>
<directJoin>false</directJoin>
<name id="716">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="717">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="718" type="java.util.HashSet">
<item id="719" type="com.j2fe.workflow.definition.Transition">
<name id="720">goto-next</name>
<source id="721">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="722">CUST Issuers</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="723">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="724" type="java.util.HashSet">
<item id="725" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="726">database</name>
<stringValue id="727">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="728" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="729">querySQL</name>
<stringValue id="730">MERGE INTO FT_T_IOI1 s&#13;
USING (SELECT DISTINCT INSTR_ISSR_ID FROM FT_T_ISSR WHERE END_TMS IS NULL AND FINS_INST_MNEM IN (&#13;
	SELECT INST_MNEM FROM FT_T_CUST WHERE END_TMS IS NULL&#13;
    and CST_ID in (select CST_ID FROM FT_T_CSST WHERE STAT_DEF_ID = 'CLOSDATE' AND END_TMS IS NULL)&#13;
    and (CST_STAT_TYP IN ('ACTIVE', 'PENDING') OR CST_ID IN (&#13;
		SELECT CST_ID FROM FT_T_CSST WHERE STAT_DEF_ID = 'CLOSDATE' AND END_TMS IS NULL AND STAT_VAL_DTE &gt; SYSDATE-35)))) e&#13;
  ON (e.INSTR_ISSR_ID = s.INSTR_ISSR_ID)&#13;
WHEN MATCHED THEN&#13;
  UPDATE set CUST = 'Y'&#13;
    WHERE CUST != 'Y'&#13;
WHEN NOT MATCHED THEN&#13;
  INSERT (INSTR_ISSR_ID, UPDATING, UPDATED, ASSET_SOI, GTOR, CUST, ASSET_RUP, GTOR_RUP, CUST_RUP, NEW_IOI_MEMBER, CUST_IP, FENERGO, FENERGO_IP, FENERGO_RUP, LAGR_FLAR, LAGR_FLAR_RUP)&#13;
  VALUES ( e.INSTR_ISSR_ID, 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N', 'Y','N','N','N','N', 'N', 'N')</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="731" type="java.util.HashSet">
<item id="732" type="com.j2fe.workflow.definition.Transition">
<name id="733">rows-found</name>
<source id="734">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="735">Add CUST Issuers?</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="736">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="737" type="java.util.HashSet">
<item id="738" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="739">database</name>
<stringValue id="740">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="741" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="742">firstColumnsResult</name>
<stringValue id="743">newNonRUPIssuers</stringValue>
<type>VARIABLE</type>
</item>
<item id="744" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="745">querySQL</name>
<stringValue id="746">select 1 from FT_T_IOI1 where INSTR_ISSR_ID = 'CONTROL' and CUST ='Y'</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="747" type="java.util.HashSet">
<item id="748" type="com.j2fe.workflow.definition.Transition">
<name id="749">ToSplit</name>
<source id="750">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="751">Automatically generated</description>
<directJoin>false</directJoin>
<name id="752">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="753">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="754" type="java.util.HashSet">
<item id="755" type="com.j2fe.workflow.definition.Transition">
<name id="756">goto-next</name>
<source id="757">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="758">GTOR Issuers</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="759">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="760" type="java.util.HashSet">
<item id="761" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="762">database</name>
<stringValue id="763">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="764" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="765">querySQL</name>
<objectValue id="766" type="java.lang.String">MERGE INTO FT_T_IOI1 s&#13;
USING (SELECT DISTINCT INSTR_ISSR_ID FROM FT_T_ISSR WHERE END_TMS IS NULL AND FINS_INST_MNEM IN (&#13;
         SELECT DISTINCT INST_MNEM FROM FT_T_FRIP WHERE FINSRL_TYP = 'GUARNTOR' AND END_TMS IS NULL AND INSTR_ID IN (&#13;
           SELECT DISTINCT INSTR_ID FROM FT_T_ISSU WHERE END_TMS IS NULL AND INSTR_ID IN (&#13;
					    SELECT DISTINCT INSTR_ID FROM FT_T_ISGP WHERE END_TMS IS NULL AND  FT_T_ISGP.PRNT_ISS_GRP_OID NOT IN ( 'ISGR000013','ISGR000714','ISGR000715')&#13;
              and PRNT_ISS_GRP_OID IN (select ISS_GRP_OID from FT_T_ISGR where ORG_ID IN ('MHI','MHEU'))&#13;
              AND FT_T_ISGP.PRT_PURP_TYP = 'INTEREST')))) e&#13;
  ON (e.INSTR_ISSR_ID = s.INSTR_ISSR_ID)&#13;
WHEN MATCHED THEN&#13;
  UPDATE set GTOR = 'Y'&#13;
    WHERE GTOR != 'Y'&#13;
WHEN NOT MATCHED THEN&#13;
  INSERT (INSTR_ISSR_ID, UPDATING, UPDATED, ASSET_SOI, GTOR, CUST, ASSET_RUP, GTOR_RUP, CUST_RUP, NEW_IOI_MEMBER, CUST_IP, FENERGO, FENERGO_IP, FENERGO_RUP, LAGR_FLAR, LAGR_FLAR_RUP)&#13;
  VALUES ( e.INSTR_ISSR_ID, 'N', 'N', 'N', 'Y', 'N', 'N', 'N', 'N', 'Y','N','N','N','N','N','N')</objectValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="767" type="java.util.HashSet">
<item id="768" type="com.j2fe.workflow.definition.Transition">
<name id="769">rows-found</name>
<source id="770">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="771">Add GTOR Issuers?</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="772">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="773" type="java.util.HashSet">
<item id="774" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="775">database</name>
<stringValue id="776">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="777" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="778">firstColumnsResult</name>
<stringValue id="779">newNonRUPIssuers</stringValue>
<type>VARIABLE</type>
</item>
<item id="780" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="781">querySQL</name>
<stringValue id="782">select 1 from FT_T_IOI1 where INSTR_ISSR_ID = 'CONTROL' and GTOR ='Y'</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="783" type="java.util.HashSet">
<item id="784" type="com.j2fe.workflow.definition.Transition">
<name id="785">ToSplit</name>
<source id="786">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="787">Automatically generated</description>
<directJoin>false</directJoin>
<name id="788">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="789">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="790" type="java.util.HashSet">
<item id="791" type="com.j2fe.workflow.definition.Transition">
<name id="792">goto-next</name>
<source id="793">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="794">SOI Issuers</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="795">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="796" type="java.util.HashSet">
<item id="797" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="798">database</name>
<stringValue id="799">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="800" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="801">querySQL</name>
<stringValue id="802">MERGE INTO FT_T_IOI1 s&#13;
USING (SELECT DISTINCT INSTR_ISSR_ID from FT_T_IOI1 where INSTR_ISSR_ID IN (SELECT DISTINCT INSTR_ISSR_ID FROM FT_T_ISSU WHERE INSTR_ID IN&#13;
        (SELECT DISTINCT INSTR_ID FROM FT_T_ISGP WHERE END_TMS IS NULL AND FT_T_ISGP.PRNT_ISS_GRP_OID NOT IN ( 'ISGR000013','ISGR000714','ISGR000715') &#13;
        and PRNT_ISS_GRP_OID IN (select ISS_GRP_OID from FT_T_ISGR where ORG_ID IN ('MHI','MHEU'))&#13;
        AND FT_T_ISGP.PRT_PURP_TYP = 'INTEREST'))) e&#13;
  ON (e.INSTR_ISSR_ID = s.INSTR_ISSR_ID)&#13;
WHEN MATCHED THEN&#13;
  UPDATE set ASSET_SOI = 'Y'&#13;
    WHERE ASSET_SOI != 'Y'&#13;
WHEN NOT MATCHED THEN&#13;
  INSERT (INSTR_ISSR_ID, UPDATING, UPDATED, ASSET_SOI, GTOR, CUST, ASSET_RUP, GTOR_RUP, CUST_RUP, NEW_IOI_MEMBER, CUST_IP, FENERGO, FENERGO_IP, FENERGO_RUP, LAGR_FLAR, LAGR_FLAR_RUP)&#13;
  VALUES ( e.INSTR_ISSR_ID, 'N', 'N', 'Y', 'N', 'N', 'N', 'N', 'N', 'Y','N','N','N','N','N','N')</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="803" type="java.util.HashSet">
<item id="804" type="com.j2fe.workflow.definition.Transition">
<name id="805">rows-found</name>
<source id="806">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="807">Add SOI Issuers?</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="808">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="809" type="java.util.HashSet">
<item id="810" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="811">database</name>
<stringValue id="812">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="813" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="814">firstColumnsResult</name>
<stringValue id="815">newNonRUPIssuers</stringValue>
<type>VARIABLE</type>
</item>
<item id="816" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="817">querySQL</name>
<stringValue id="818">select 1 from FT_T_IOI1 where INSTR_ISSR_ID = 'CONTROL' and ASSET_SOI ='Y'</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="819" type="java.util.HashSet">
<item id="820" type="com.j2fe.workflow.definition.Transition">
<name id="821">goto-next</name>
<source id="822">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="823">Pop IOI1 with existing issuers</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="824">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="825" type="java.util.HashSet">
<item id="826" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="827">database</name>
<stringValue id="828">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="829" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="830">querySQL</name>
<stringValue id="831">INSERT INTO FT_T_IOI1 (INSTR_ISSR_ID,UPDATING, UPDATED, ASSET_SOI, GTOR, CUST, ASSET_RUP, GTOR_RUP, CUST_RUP, CUST_IP, FENERGO, FENERGO_IP, FENERGO_RUP, LAGR_FLAR, LAGR_FLAR_RUP, NEW_IOI_MEMBER, DELETE_FROM_IOI)&#13;
SELECT INSTR_ISSR_ID, 'N' UPDATING, 'N' UPDATED, 'N' ASSET_SOI, 'N' GTOR, 'N' CUST, 'N' ASSET_RUP, 'N' GTOR_RUP, 'N' CUST_RUP, 'N' CUST_IP, 'N' FENERGO, 'N' FENERGO_IP, 'N' FENERGO_RUP, 'N' LAGR_FLAR, 'N' LAGR_FLAR_RUP, 'N' NEW_IOI_MEMBER, 'N' DELETE_FROM_IOI  &#13;
FROM FT_T_IRGP WHERE END_TMS IS NULL and PRNT_ISSR_GRP_OID = 'IRGR000006'</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="832" type="java.util.HashSet">
<item id="833" type="com.j2fe.workflow.definition.Transition">
<name id="834">goto-next</name>
<source id="835">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="836">Empty IOI Table</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="837">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="838" type="java.util.HashSet">
<item id="839" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="840">database</name>
<stringValue id="841">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="842" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="843">querySQL</name>
<stringValue id="844">DELETE FT_T_IOI1 where INSTR_ISSR_ID != 'CONTROL'</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="845" type="java.util.HashSet">
<item id="846" type="com.j2fe.workflow.definition.Transition">
<name id="847">goto-next</name>
<source id="848">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="849">log job start</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="850">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="851" type="java.util.HashSet">
<item id="852" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="853">database</name>
<stringValue id="854">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="855" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="856">querySQL</name>
<stringValue id="857">begin &#13;
 mhi_sp_eventlog (&#13;
	 'RebuildIOI Workflow',&#13;
	 'workflow starting',&#13;
	'N/A'); &#13;
end;</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="858" type="java.util.HashSet">
<item id="859" type="com.j2fe.workflow.definition.Transition">
<name id="860">goto-next</name>
<source id="861">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="862">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="863">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="864" type="java.util.HashSet"/>
<targets id="865" type="java.util.HashSet">
<item idref="859" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="848"/>
</item>
</sources>
<targets id="866" type="java.util.HashSet">
<item idref="846" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="835"/>
</item>
</sources>
<targets id="867" type="java.util.HashSet">
<item idref="833" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="822"/>
</item>
</sources>
<targets id="868" type="java.util.HashSet">
<item idref="820" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="806"/>
</item>
</sources>
<targets id="869" type="java.util.HashSet">
<item id="870" type="com.j2fe.workflow.definition.Transition">
<name id="871">nothing-found</name>
<source idref="806"/>
<target idref="786"/>
</item>
<item idref="804" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="793"/>
</item>
</sources>
<targets id="872" type="java.util.HashSet">
<item idref="791" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="786"/>
</item>
<item idref="870" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="873" type="java.util.HashSet">
<item idref="784" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="770"/>
</item>
</sources>
<targets id="874" type="java.util.HashSet">
<item id="875" type="com.j2fe.workflow.definition.Transition">
<name id="876">nothing-found</name>
<source idref="770"/>
<target idref="750"/>
</item>
<item idref="768" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="757"/>
</item>
</sources>
<targets id="877" type="java.util.HashSet">
<item idref="755" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="750"/>
</item>
<item idref="875" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="878" type="java.util.HashSet">
<item idref="748" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="734"/>
</item>
</sources>
<targets id="879" type="java.util.HashSet">
<item id="880" type="com.j2fe.workflow.definition.Transition">
<name id="881">nothing-found</name>
<source idref="734"/>
<target idref="714"/>
</item>
<item idref="732" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="721"/>
</item>
</sources>
<targets id="882" type="java.util.HashSet">
<item idref="719" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="714"/>
</item>
<item idref="880" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="883" type="java.util.HashSet">
<item idref="712" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="698"/>
</item>
</sources>
<targets id="884" type="java.util.HashSet">
<item id="885" type="com.j2fe.workflow.definition.Transition">
<name id="886">nothing-found</name>
<source idref="698"/>
<target idref="678"/>
</item>
<item idref="696" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="685"/>
</item>
</sources>
<targets id="887" type="java.util.HashSet">
<item idref="683" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="678"/>
</item>
<item idref="885" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="888" type="java.util.HashSet">
<item idref="676" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="662"/>
</item>
</sources>
<targets id="889" type="java.util.HashSet">
<item id="890" type="com.j2fe.workflow.definition.Transition">
<name id="891">nothing-found</name>
<source idref="662"/>
<target idref="642"/>
</item>
<item idref="660" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="649"/>
</item>
</sources>
<targets id="892" type="java.util.HashSet">
<item idref="647" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="642"/>
</item>
<item idref="890" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="893" type="java.util.HashSet">
<item idref="640" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="626"/>
</item>
</sources>
<targets id="894" type="java.util.HashSet">
<item id="895" type="com.j2fe.workflow.definition.Transition">
<name id="896">nothing-found</name>
<source idref="626"/>
<target idref="606"/>
</item>
<item idref="624" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="613"/>
</item>
</sources>
<targets id="897" type="java.util.HashSet">
<item idref="611" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="606"/>
</item>
<item idref="895" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="898" type="java.util.HashSet">
<item idref="604" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="590"/>
</item>
</sources>
<targets id="899" type="java.util.HashSet">
<item id="900" type="com.j2fe.workflow.definition.Transition">
<name id="901">nothing-found</name>
<source idref="590"/>
<target idref="570"/>
</item>
<item idref="588" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="577"/>
</item>
</sources>
<targets id="902" type="java.util.HashSet">
<item idref="575" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="570"/>
</item>
<item idref="900" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="903" type="java.util.HashSet">
<item idref="568" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="554"/>
</item>
</sources>
<targets id="904" type="java.util.HashSet">
<item id="905" type="com.j2fe.workflow.definition.Transition">
<name id="906">nothing-found</name>
<source idref="554"/>
<target idref="534"/>
</item>
<item idref="552" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="541"/>
</item>
</sources>
<targets id="907" type="java.util.HashSet">
<item idref="539" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="534"/>
</item>
<item idref="905" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="908" type="java.util.HashSet">
<item idref="532" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="518"/>
</item>
</sources>
<targets id="909" type="java.util.HashSet">
<item id="910" type="com.j2fe.workflow.definition.Transition">
<name id="911">nothing-found</name>
<source idref="518"/>
<target idref="498"/>
</item>
<item idref="516" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="505"/>
</item>
</sources>
<targets id="912" type="java.util.HashSet">
<item idref="503" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="498"/>
</item>
<item idref="910" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="913" type="java.util.HashSet">
<item idref="496" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="482"/>
</item>
</sources>
<targets id="914" type="java.util.HashSet">
<item id="915" type="com.j2fe.workflow.definition.Transition">
<name id="916">nothing-found</name>
<source idref="482"/>
<target idref="462"/>
</item>
<item idref="480" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="469"/>
</item>
</sources>
<targets id="917" type="java.util.HashSet">
<item idref="467" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="462"/>
</item>
<item idref="915" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="918" type="java.util.HashSet">
<item idref="460" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="446"/>
</item>
</sources>
<targets id="919" type="java.util.HashSet">
<item id="920" type="com.j2fe.workflow.definition.Transition">
<name id="921">nothing-found</name>
<source idref="446"/>
<target idref="426"/>
</item>
<item idref="444" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="433"/>
</item>
</sources>
<targets id="922" type="java.util.HashSet">
<item idref="431" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="426"/>
</item>
<item idref="920" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="923" type="java.util.HashSet">
<item idref="424" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="410"/>
</item>
</sources>
<targets id="924" type="java.util.HashSet">
<item id="925" type="com.j2fe.workflow.definition.Transition">
<name id="926">nothing-found</name>
<source idref="410"/>
<target idref="381"/>
</item>
<item idref="408" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="397"/>
</item>
</sources>
<targets id="927" type="java.util.HashSet">
<item idref="395" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="381"/>
</item>
<item idref="925" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="928" type="java.util.HashSet">
<item idref="379" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="365"/>
</item>
</sources>
<targets id="929" type="java.util.HashSet">
<item id="930" type="com.j2fe.workflow.definition.Transition">
<name id="931">nothing-found</name>
<source idref="365"/>
<target idref="297"/>
</item>
<item idref="363" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="349"/>
</item>
</sources>
<targets id="932" type="java.util.HashSet">
<item idref="347" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDSPLIT</type>
</source>
<target idref="336"/>
</item>
</sources>
<targets id="933" type="java.util.HashSet">
<item idref="334" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="329"/>
</item>
<item id="934" type="com.j2fe.workflow.definition.Transition">
<name id="935">goto-next</name>
<source id="936">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="937">UPDATE IOI1</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="938">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="939" type="java.util.HashSet">
<item id="940" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="941">database</name>
<stringValue id="942">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="943" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="944">indexedParameters[0]</name>
<stringValue id="945">newIssuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="946" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="947">querySQL</name>
<stringValue id="948">UPDATE FT_T_IOI1 SET UPDATING='N', UPDATED='Y' WHERE INSTR_ISSR_ID = ?</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="949" type="java.util.HashSet">
<item id="950" type="com.j2fe.workflow.definition.Transition">
<name id="951">goto-next</name>
<source id="952">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="953">log updated issuer</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="954">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="955" type="java.util.HashSet">
<item id="956" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="957">database</name>
<stringValue id="958">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="959" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="960">indexedParameters[0]</name>
<stringValue id="961">newIssuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="962" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="963">querySQL</name>
<stringValue id="964">begin &#13;
 mhi_sp_eventlog (&#13;
	 'RebuildIOI Workflow',&#13;
	 'flagged isuer as updated',&#13;
	?); &#13;
end;</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="965" type="java.util.HashSet">
<item id="966" type="com.j2fe.workflow.definition.Transition">
<name id="967">goto-next</name>
<source id="968">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="969">IOI REAL message</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="970">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="971" type="java.util.HashSet">
<item id="972" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="973">["BulkSize"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="974">input["BulkSize"]</name>
<stringValue id="975">BulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="976" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="977">["PublishFlag"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="978">input["PublishFlag"]</name>
<objectValue id="979" type="java.lang.String">Y</objectValue>
<type>CONSTANT</type>
</item>
<item id="980" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="981">["sqlSelect"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="982">input["sqlSelect"]</name>
<stringValue id="983">ioiAddMSg</stringValue>
<type>VARIABLE</type>
</item>
<item id="984" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="985">name</name>
<stringValue id="986">RealMessageProcessing</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="987" type="java.util.HashSet">
<item id="988" type="com.j2fe.workflow.definition.Transition">
<name id="989">goto-next</name>
<source id="990">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="991">IOI REAL Query</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="992">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="993" type="java.util.HashSet">
<item id="994" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="995">statements</name>
<objectValue id="996" type="java.lang.String">query = "SELECT distinct '&lt;!DOCTYPE STREET_REF SYSTEM \"fti://repository/dtd/STREET_REF\"&gt;' || ";&#13;
query = query + "XMLElement(NAME \"STREET_REF\",XMLAttributes( 'GUEST' AS \"USERID\"), ";&#13;
query = query + "XMLElement(NAME \"HEADER\", ";&#13;
query = query + "XMLElement(NAME \"MAIN_ENTITY_ID\", XMLAttributes( RTRIM((select pref_issr_id from ft_t_issr where INSTR_ISSR_ID = '" + newIssuer + "')) AS \"VALUE\")), ";&#13;
query = query + "XMLElement(NAME \"MAIN_ENTITY_ID_CTXT_TYP\",XMLAttributes( RTRIM((select pref_id_ctxt_typ from ft_t_issr where INSTR_ISSR_ID = '" + newIssuer +"')) AS \"VALUE\")), ";&#13;
query = query + "XMLElement(NAME \"MAIN_ENTITY_TBL_TYP\",XMLAttributes('ISSR' AS \"VALUE\"))), ";&#13;
query = query + "XMLElement(NAME \"SEGMENT\", XMLAttributes( 'Issuer' AS \"TYPE\", 'REFERENCE' AS \"ACTION\"), ";&#13;
query = query + "XMLElement(NAME \"Issuer\", XMLElement(NAME \"INSTRISSRID\", ";&#13;
query = query + "XMLAttributes( RTRIM('" + newIssuer + "') AS \"VALUE\")), ";&#13;
query = query + "XMLElement(NAME \"LASTCHGUSRID\",XMLAttributes('rebuildIOI' AS \"VALUE\")))), ";&#13;
query = query + "XMLElement(NAME \"SEGMENT\", XMLAttributes( 'ISSRIssuerGroupParticipant' AS \"TYPE\", 'UNKNOWN' AS \"ACTION\"), XMLElement(NAME \"ISSRIssuerGroupParticipant\",  ";&#13;
query = query + "XMLElement(NAME \"PRNTISSRGRPOID\", XMLAttributes( 'IRGR000006' AS \"VALUE\")), XMLElement(NAME \"PRTPURPTYP\", XMLAttributes( 'INTEREST' AS \"VALUE\")) ";&#13;
query = query + ")))";&#13;
query = query + "FROM DUAL";&#13;
</objectValue>
<type>CONSTANT</type>
</item>
<item id="997" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="998">["newIssuer"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="999">variables["newIssuer"]</name>
<stringValue id="1000">newIssuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="1001" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="1002">["query"]@java/lang/Integer@</UITypeHint>
<input>false</input>
<name id="1003">variables["query"]</name>
<stringValue id="1004">ioiAddMSg</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="1005" type="java.util.HashSet">
<item id="1006" type="com.j2fe.workflow.definition.Transition">
<name id="1007">goto-next</name>
<source id="1008">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="1009">log add issuer</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="1010">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="1011" type="java.util.HashSet">
<item id="1012" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1013">database</name>
<stringValue id="1014">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="1015" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1016">indexedParameters[0]</name>
<stringValue id="1017">newIssuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="1018" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1019">querySQL</name>
<stringValue id="1020">begin &#13;
 mhi_sp_eventlog (&#13;
	 'RebuildIOI Workflow',&#13;
	 'RUP add to IOI',&#13;
	?); &#13;
end;</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1021" type="java.util.HashSet">
<item id="1022" type="com.j2fe.workflow.definition.Transition">
<name id="1023">goto-next</name>
<source id="1024">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="1025">Identify Issuer to add to IOI</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="1026">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="1027" type="java.util.HashSet">
<item id="1028" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1029">database</name>
<stringValue id="1030">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="1031" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1032">indexedParameters[0]</name>
<stringValue id="1033">newIssuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="1034" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1035">querySQL</name>
<stringValue id="1036">UPDATE FT_T_IOI1 SET UPDATING='Y' WHERE INSTR_ISSR_ID = ?</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1037" type="java.util.HashSet">
<item id="1038" type="com.j2fe.workflow.definition.Transition">
<name id="1039">loop</name>
<source idref="310"/>
<target idref="1024"/>
</item>
</sources>
<targets id="1040" type="java.util.HashSet">
<item idref="1022" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="1008"/>
</item>
</sources>
<targets id="1041" type="java.util.HashSet">
<item idref="1006" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="990"/>
</item>
</sources>
<targets id="1042" type="java.util.HashSet">
<item idref="988" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="968"/>
</item>
</sources>
<targets id="1043" type="java.util.HashSet">
<item idref="966" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="952"/>
</item>
</sources>
<targets id="1044" type="java.util.HashSet">
<item idref="950" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="936"/>
</item>
</sources>
<targets id="1045" type="java.util.HashSet">
<item idref="934" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="329"/>
</item>
</sources>
<targets id="1046" type="java.util.HashSet">
<item idref="327" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="310"/>
</item>
</sources>
<targets id="1047" type="java.util.HashSet">
<item idref="308" type="com.j2fe.workflow.definition.Transition"/>
<item idref="1038" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="304"/>
</item>
</sources>
<targets id="1048" type="java.util.HashSet">
<item idref="302" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDJOIN</type>
</source>
<target idref="297"/>
</item>
<item idref="930" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1049" type="java.util.HashSet">
<item idref="295" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="281"/>
</item>
</sources>
<targets id="1050" type="java.util.HashSet">
<item id="1051" type="com.j2fe.workflow.definition.Transition">
<name id="1052">nothing-found</name>
<source idref="281"/>
<target idref="213"/>
</item>
<item idref="279" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="265"/>
</item>
</sources>
<targets id="1053" type="java.util.HashSet">
<item idref="263" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDSPLIT</type>
</source>
<target idref="252"/>
</item>
</sources>
<targets id="1054" type="java.util.HashSet">
<item idref="250" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="245"/>
</item>
<item id="1055" type="com.j2fe.workflow.definition.Transition">
<name id="1056">goto-next</name>
<source id="1057">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="1058">UPDATE IOI1</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="1059">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="1060" type="java.util.HashSet">
<item id="1061" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1062">database</name>
<stringValue id="1063">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="1064" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1065">indexedParameters[0]</name>
<stringValue id="1066">nonRUPIssuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="1067" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1068">querySQL</name>
<stringValue id="1069">UPDATE FT_T_IOI1 SET UPDATING='N', UPDATED='Y' WHERE INSTR_ISSR_ID = ?</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1070" type="java.util.HashSet">
<item id="1071" type="com.j2fe.workflow.definition.Transition">
<name id="1072">goto-next</name>
<source id="1073">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="1074">IOI REAL message</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="1075">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="1076" type="java.util.HashSet">
<item id="1077" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="1078">["BulkSize"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="1079">input["BulkSize"]</name>
<stringValue id="1080">BulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="1081" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="1082">["PublishFlag"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="1083">input["PublishFlag"]</name>
<objectValue id="1084" type="java.lang.String">Y</objectValue>
<type>CONSTANT</type>
</item>
<item id="1085" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="1086">["sqlSelect"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="1087">input["sqlSelect"]</name>
<stringValue id="1088">ioiAddMSg</stringValue>
<type>VARIABLE</type>
</item>
<item id="1089" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1090">name</name>
<stringValue id="1091">RealMessageProcessing</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1092" type="java.util.HashSet">
<item id="1093" type="com.j2fe.workflow.definition.Transition">
<name id="1094">goto-next</name>
<source id="1095">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="1096">IOI REAL Query</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="1097">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="1098" type="java.util.HashSet">
<item id="1099" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1100">statements</name>
<objectValue id="1101" type="java.lang.String">query = "SELECT distinct '&lt;!DOCTYPE STREET_REF SYSTEM \"fti://repository/dtd/STREET_REF\"&gt;' || ";&#13;
query = query + "XMLElement(NAME \"STREET_REF\",XMLAttributes( 'GUEST' AS \"USERID\"), ";&#13;
query = query + "XMLElement(NAME \"HEADER\", ";&#13;
query = query + "XMLElement(NAME \"MAIN_ENTITY_ID\", XMLAttributes( RTRIM((select pref_issr_id from ft_t_issr where INSTR_ISSR_ID = '" + newIssuer + "')) AS \"VALUE\")), ";&#13;
query = query + "XMLElement(NAME \"MAIN_ENTITY_ID_CTXT_TYP\",XMLAttributes( RTRIM((select pref_id_ctxt_typ from ft_t_issr where INSTR_ISSR_ID = '" + newIssuer +"')) AS \"VALUE\")), ";&#13;
query = query + "XMLElement(NAME \"MAIN_ENTITY_TBL_TYP\",XMLAttributes('ISSR' AS \"VALUE\"))), ";&#13;
query = query + "XMLElement(NAME \"SEGMENT\", XMLAttributes( 'Issuer' AS \"TYPE\", 'REFERENCE' AS \"ACTION\"), ";&#13;
query = query + "XMLElement(NAME \"Issuer\", XMLElement(NAME \"INSTRISSRID\", ";&#13;
query = query + "XMLAttributes( RTRIM('" + newIssuer + "') AS \"VALUE\")), ";&#13;
query = query + "XMLElement(NAME \"LASTCHGUSRID\",XMLAttributes('rebuildIOI' AS \"VALUE\")))), ";&#13;
query = query + "XMLElement(NAME \"SEGMENT\", XMLAttributes( 'ISSRIssuerGroupParticipant' AS \"TYPE\", 'UNKNOWN' AS \"ACTION\"), XMLElement(NAME \"ISSRIssuerGroupParticipant\",  ";&#13;
query = query + "XMLElement(NAME \"PRNTISSRGRPOID\", XMLAttributes( 'IRGR000006' AS \"VALUE\")), XMLElement(NAME \"PRTPURPTYP\", XMLAttributes( 'INTEREST' AS \"VALUE\")) ";&#13;
query = query + ")))";&#13;
query = query + "FROM DUAL";&#13;
</objectValue>
<type>CONSTANT</type>
</item>
<item id="1102" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="1103">["newIssuer"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="1104">variables["newIssuer"]</name>
<stringValue id="1105">nonRUPIssuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="1106" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="1107">["query"]@java/lang/Integer@</UITypeHint>
<input>false</input>
<name id="1108">variables["query"]</name>
<stringValue id="1109">ioiAddMSg</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="1110" type="java.util.HashSet">
<item id="1111" type="com.j2fe.workflow.definition.Transition">
<name id="1112">goto-next</name>
<source id="1113">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="1114">log add issuer</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="1115">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="1116" type="java.util.HashSet">
<item id="1117" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1118">database</name>
<stringValue id="1119">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="1120" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1121">indexedParameters[0]</name>
<stringValue id="1122">nonRUPIssuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="1123" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1124">querySQL</name>
<stringValue id="1125">begin &#13;
 mhi_sp_eventlog (&#13;
	 'RebuildIOI Workflow',&#13;
	 'Non-RUP add to IOI',&#13;
	?); &#13;
end;</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1126" type="java.util.HashSet">
<item id="1127" type="com.j2fe.workflow.definition.Transition">
<name id="1128">goto-next</name>
<source id="1129">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="1130">Identify Issuer to add to IOI</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="1131">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="1132" type="java.util.HashSet">
<item id="1133" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1134">database</name>
<stringValue id="1135">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="1136" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1137">indexedParameters[0]</name>
<stringValue id="1138">nonRUPIssuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="1139" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1140">querySQL</name>
<stringValue id="1141">UPDATE FT_T_IOI1 SET UPDATING='Y' WHERE INSTR_ISSR_ID = ?</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1142" type="java.util.HashSet">
<item id="1143" type="com.j2fe.workflow.definition.Transition">
<name id="1144">loop</name>
<source idref="226"/>
<target idref="1129"/>
</item>
</sources>
<targets id="1145" type="java.util.HashSet">
<item idref="1127" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="1113"/>
</item>
</sources>
<targets id="1146" type="java.util.HashSet">
<item idref="1111" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="1095"/>
</item>
</sources>
<targets id="1147" type="java.util.HashSet">
<item idref="1093" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="1073"/>
</item>
</sources>
<targets id="1148" type="java.util.HashSet">
<item idref="1071" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="1057"/>
</item>
</sources>
<targets id="1149" type="java.util.HashSet">
<item idref="1055" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="245"/>
</item>
</sources>
<targets id="1150" type="java.util.HashSet">
<item idref="243" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="226"/>
</item>
</sources>
<targets id="1151" type="java.util.HashSet">
<item idref="224" type="com.j2fe.workflow.definition.Transition"/>
<item idref="1143" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="220"/>
</item>
</sources>
<targets id="1152" type="java.util.HashSet">
<item idref="218" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDJOIN</type>
</source>
<target idref="213"/>
</item>
<item idref="1051" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1153" type="java.util.HashSet">
<item idref="211" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="200"/>
</item>
</sources>
<targets id="1154" type="java.util.HashSet">
<item idref="198" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="184"/>
</item>
</sources>
<targets id="1155" type="java.util.HashSet">
<item id="1156" type="com.j2fe.workflow.definition.Transition">
<name id="1157">nothing-found</name>
<source idref="184"/>
<target idref="116"/>
</item>
<item idref="182" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="168"/>
</item>
</sources>
<targets id="1158" type="java.util.HashSet">
<item idref="166" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDSPLIT</type>
</source>
<target idref="155"/>
</item>
</sources>
<targets id="1159" type="java.util.HashSet">
<item idref="153" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="148"/>
</item>
<item id="1160" type="com.j2fe.workflow.definition.Transition">
<name id="1161">goto-next</name>
<source id="1162">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="1163">NOP  #3</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="1164">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="1165" type="java.util.HashSet">
<item id="1166" type="com.j2fe.workflow.definition.Transition">
<name id="1167">goto-next</name>
<source id="1168">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="1169">UPDATE IOI1</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="1170">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="1171" type="java.util.HashSet">
<item id="1172" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1173">database</name>
<stringValue id="1174">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="1175" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1176">indexedParameters[0]</name>
<stringValue id="1177">lockedIssuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="1178" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1179">querySQL</name>
<stringValue id="1180">UPDATE FT_T_IOI1 SET UPDATING='N', UPDATED='Y', DELETE_FROM_IOI = 'N'&#13;
WHERE INSTR_ISSR_ID = ?</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1181" type="java.util.HashSet">
<item id="1182" type="com.j2fe.workflow.definition.Transition">
<name id="1183">goto-next</name>
<source id="1184">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="1185">log retain issuer</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="1186">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="1187" type="java.util.HashSet">
<item id="1188" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1189">database</name>
<stringValue id="1190">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="1191" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1192">indexedParameters[0]</name>
<stringValue id="1193">lockedIssuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="1194" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1195">querySQL</name>
<stringValue id="1196">begin &#13;
 mhi_sp_eventlog (&#13;
	 'RebuildIOI Workflow',&#13;
	 'retain as Issuer has a lock',&#13;
	?); &#13;
end;</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1197" type="java.util.HashSet">
<item id="1198" type="com.j2fe.workflow.definition.Transition">
<name id="1199">goto-next</name>
<source id="1200">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="1201">Identify Issuer to flag as locked</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="1202">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="1203" type="java.util.HashSet">
<item id="1204" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1205">database</name>
<stringValue id="1206">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="1207" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1208">indexedParameters[0]</name>
<stringValue id="1209">lockedIssuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="1210" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1211">querySQL</name>
<stringValue id="1212">UPDATE FT_T_IOI1 SET UPDATING='Y' WHERE INSTR_ISSR_ID = ?</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1213" type="java.util.HashSet">
<item id="1214" type="com.j2fe.workflow.definition.Transition">
<name id="1215">loop</name>
<source idref="129"/>
<target idref="1200"/>
</item>
</sources>
<targets id="1216" type="java.util.HashSet">
<item idref="1198" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="1184"/>
</item>
</sources>
<targets id="1217" type="java.util.HashSet">
<item idref="1182" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="1168"/>
</item>
</sources>
<targets id="1218" type="java.util.HashSet">
<item idref="1166" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="1162"/>
</item>
</sources>
<targets id="1219" type="java.util.HashSet">
<item idref="1160" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="148"/>
</item>
</sources>
<targets id="1220" type="java.util.HashSet">
<item idref="146" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="129"/>
</item>
</sources>
<targets id="1221" type="java.util.HashSet">
<item idref="127" type="com.j2fe.workflow.definition.Transition"/>
<item idref="1214" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="123"/>
</item>
</sources>
<targets id="1222" type="java.util.HashSet">
<item idref="121" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDJOIN</type>
</source>
<target idref="116"/>
</item>
<item idref="1156" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1223" type="java.util.HashSet">
<item idref="114" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="100"/>
</item>
</sources>
<targets id="1224" type="java.util.HashSet">
<item id="1225" type="com.j2fe.workflow.definition.Transition">
<name id="1226">nothing-found</name>
<source idref="100"/>
<target idref="8"/>
</item>
<item idref="98" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="84"/>
</item>
</sources>
<targets id="1227" type="java.util.HashSet">
<item idref="82" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDSPLIT</type>
</source>
<target idref="71"/>
</item>
</sources>
<targets id="1228" type="java.util.HashSet">
<item idref="69" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="64"/>
</item>
<item id="1229" type="com.j2fe.workflow.definition.Transition">
<name id="1230">goto-next</name>
<source id="1231">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="1232">UPDATE IOI1</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="1233">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="1234" type="java.util.HashSet">
<item id="1235" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1236">database</name>
<stringValue id="1237">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="1238" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1239">indexedParameters[0]</name>
<stringValue id="1240">oldIssuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="1241" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1242">querySQL</name>
<stringValue id="1243">UPDATE FT_T_IOI1 SET UPDATING='N', UPDATED='Y'&#13;
WHERE INSTR_ISSR_ID = ?</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1244" type="java.util.HashSet">
<item id="1245" type="com.j2fe.workflow.definition.Transition">
<name id="1246">goto-next</name>
<source id="1247">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="1248">END DATE IRGP</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="1249">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="1250" type="java.util.HashSet">
<item id="1251" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1252">database</name>
<stringValue id="1253">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="1254" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1255">indexedParameters[0]</name>
<stringValue id="1256">oldIssuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="1257" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1258">querySQL</name>
<stringValue id="1259">UPDATE FT_T_IRGP SET END_TMS = TRUNC(SYSDATE), LAST_CHG_TMS=SYSDATE, LAST_CHG_USR_ID = 'RebuildIOI'&#13;
WHERE INSTR_ISSR_ID = ? AND END_TMS IS NULL and PRNT_ISSR_GRP_OID in (select ISSR_GRP_OID from FT_T_IRGR where grp_nme = 'MHI Inventory')</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1260" type="java.util.HashSet">
<item id="1261" type="com.j2fe.workflow.definition.Transition">
<name id="1262">goto-next</name>
<source id="1263">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="1264">log remove issuer</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="1265">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="1266" type="java.util.HashSet">
<item id="1267" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1268">database</name>
<stringValue id="1269">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="1270" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1271">indexedParameters[0]</name>
<stringValue id="1272">oldIssuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="1273" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1274">querySQL</name>
<stringValue id="1275">begin &#13;
 mhi_sp_eventlog (&#13;
	 'RebuildIOI Workflow',&#13;
	 'remove from IOI',&#13;
	?); &#13;
end;</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1276" type="java.util.HashSet">
<item id="1277" type="com.j2fe.workflow.definition.Transition">
<name id="1278">goto-next</name>
<source id="1279">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="1280">Identify Issuer to remove from IOI</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="1281">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="1282" type="java.util.HashSet">
<item id="1283" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1284">database</name>
<stringValue id="1285">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="1286" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1287">indexedParameters[0]</name>
<stringValue id="1288">newIssuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="1289" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1290">querySQL</name>
<stringValue id="1291">UPDATE FT_T_IOI1 SET UPDATING='Y' WHERE INSTR_ISSR_ID = ?</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1292" type="java.util.HashSet">
<item id="1293" type="com.j2fe.workflow.definition.Transition">
<name id="1294">loop</name>
<source idref="45"/>
<target idref="1279"/>
</item>
</sources>
<targets id="1295" type="java.util.HashSet">
<item idref="1277" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="1263"/>
</item>
</sources>
<targets id="1296" type="java.util.HashSet">
<item idref="1261" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="1247"/>
</item>
</sources>
<targets id="1297" type="java.util.HashSet">
<item idref="1245" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="1231"/>
</item>
</sources>
<targets id="1298" type="java.util.HashSet">
<item idref="1229" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="64"/>
</item>
</sources>
<targets id="1299" type="java.util.HashSet">
<item idref="62" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="45"/>
</item>
</sources>
<targets id="1300" type="java.util.HashSet">
<item idref="43" type="com.j2fe.workflow.definition.Transition"/>
<item idref="1293" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="39"/>
</item>
</sources>
<targets id="1301" type="java.util.HashSet">
<item idref="37" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDJOIN</type>
</source>
<target idref="21"/>
</item>
</sources>
<targets id="1302" type="java.util.HashSet">
<item idref="19" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="8"/>
</item>
<item idref="1225" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1303" type="java.util.HashSet">
<item idref="6" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="2"/>
</item>
</sources>
<targets id="1304" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="1305">Mizuho</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="1306">user1</lastChangeUser>
<lastUpdate id="1307">2025-10-19T02:15:16.000+0100</lastUpdate>
<name id="1308">RebuildIOI</name>
<nodes id="1309" type="java.util.HashSet">
<item idref="698" type="com.j2fe.workflow.definition.Node"/>
<item idref="590" type="com.j2fe.workflow.definition.Node"/>
<item idref="734" type="com.j2fe.workflow.definition.Node"/>
<item idref="626" type="com.j2fe.workflow.definition.Node"/>
<item idref="518" type="com.j2fe.workflow.definition.Node"/>
<item idref="554" type="com.j2fe.workflow.definition.Node"/>
<item idref="482" type="com.j2fe.workflow.definition.Node"/>
<item idref="770" type="com.j2fe.workflow.definition.Node"/>
<item idref="662" type="com.j2fe.workflow.definition.Node"/>
<item idref="446" type="com.j2fe.workflow.definition.Node"/>
<item idref="410" type="com.j2fe.workflow.definition.Node"/>
<item idref="806" type="com.j2fe.workflow.definition.Node"/>
<item idref="252" type="com.j2fe.workflow.definition.Node"/>
<item idref="155" type="com.j2fe.workflow.definition.Node"/>
<item idref="336" type="com.j2fe.workflow.definition.Node"/>
<item idref="71" type="com.j2fe.workflow.definition.Node"/>
<item idref="349" type="com.j2fe.workflow.definition.Node"/>
<item idref="84" type="com.j2fe.workflow.definition.Node"/>
<item idref="265" type="com.j2fe.workflow.definition.Node"/>
<item idref="168" type="com.j2fe.workflow.definition.Node"/>
<item idref="577" type="com.j2fe.workflow.definition.Node"/>
<item idref="721" type="com.j2fe.workflow.definition.Node"/>
<item idref="613" type="com.j2fe.workflow.definition.Node"/>
<item idref="184" type="com.j2fe.workflow.definition.Node"/>
<item idref="381" type="com.j2fe.workflow.definition.Node"/>
<item idref="1247" type="com.j2fe.workflow.definition.Node"/>
<item idref="835" type="com.j2fe.workflow.definition.Node"/>
<item idref="541" type="com.j2fe.workflow.definition.Node"/>
<item idref="505" type="com.j2fe.workflow.definition.Node"/>
<item idref="469" type="com.j2fe.workflow.definition.Node"/>
<item idref="200" type="com.j2fe.workflow.definition.Node"/>
<item idref="757" type="com.j2fe.workflow.definition.Node"/>
<item idref="649" type="com.j2fe.workflow.definition.Node"/>
<item idref="990" type="com.j2fe.workflow.definition.Node"/>
<item idref="1095" type="com.j2fe.workflow.definition.Node"/>
<item idref="968" type="com.j2fe.workflow.definition.Node"/>
<item idref="1073" type="com.j2fe.workflow.definition.Node"/>
<item idref="1024" type="com.j2fe.workflow.definition.Node"/>
<item idref="1129" type="com.j2fe.workflow.definition.Node"/>
<item idref="1200" type="com.j2fe.workflow.definition.Node"/>
<item idref="1279" type="com.j2fe.workflow.definition.Node"/>
<item idref="281" type="com.j2fe.workflow.definition.Node"/>
<item idref="100" type="com.j2fe.workflow.definition.Node"/>
<item idref="433" type="com.j2fe.workflow.definition.Node"/>
<item idref="397" type="com.j2fe.workflow.definition.Node"/>
<item idref="129" type="com.j2fe.workflow.definition.Node"/>
<item idref="310" type="com.j2fe.workflow.definition.Node"/>
<item idref="226" type="com.j2fe.workflow.definition.Node"/>
<item idref="45" type="com.j2fe.workflow.definition.Node"/>
<item idref="213" type="com.j2fe.workflow.definition.Node"/>
<item idref="678" type="com.j2fe.workflow.definition.Node"/>
<item idref="534" type="com.j2fe.workflow.definition.Node"/>
<item idref="245" type="com.j2fe.workflow.definition.Node"/>
<item idref="786" type="com.j2fe.workflow.definition.Node"/>
<item idref="750" type="com.j2fe.workflow.definition.Node"/>
<item idref="498" type="com.j2fe.workflow.definition.Node"/>
<item idref="297" type="com.j2fe.workflow.definition.Node"/>
<item idref="426" type="com.j2fe.workflow.definition.Node"/>
<item idref="642" type="com.j2fe.workflow.definition.Node"/>
<item idref="148" type="com.j2fe.workflow.definition.Node"/>
<item idref="714" type="com.j2fe.workflow.definition.Node"/>
<item idref="606" type="com.j2fe.workflow.definition.Node"/>
<item idref="462" type="com.j2fe.workflow.definition.Node"/>
<item idref="570" type="com.j2fe.workflow.definition.Node"/>
<item idref="329" type="com.j2fe.workflow.definition.Node"/>
<item idref="116" type="com.j2fe.workflow.definition.Node"/>
<item idref="64" type="com.j2fe.workflow.definition.Node"/>
<item idref="1162" type="com.j2fe.workflow.definition.Node"/>
<item idref="822" type="com.j2fe.workflow.definition.Node"/>
<item idref="365" type="com.j2fe.workflow.definition.Node"/>
<item idref="685" type="com.j2fe.workflow.definition.Node"/>
<item idref="793" type="com.j2fe.workflow.definition.Node"/>
<item idref="861" type="com.j2fe.workflow.definition.Node"/>
<item idref="2" type="com.j2fe.workflow.definition.Node"/>
<item idref="123" type="com.j2fe.workflow.definition.Node"/>
<item idref="220" type="com.j2fe.workflow.definition.Node"/>
<item idref="304" type="com.j2fe.workflow.definition.Node"/>
<item idref="39" type="com.j2fe.workflow.definition.Node"/>
<item idref="1168" type="com.j2fe.workflow.definition.Node"/>
<item idref="1057" type="com.j2fe.workflow.definition.Node"/>
<item idref="936" type="com.j2fe.workflow.definition.Node"/>
<item idref="1231" type="com.j2fe.workflow.definition.Node"/>
<item idref="21" type="com.j2fe.workflow.definition.Node"/>
<item idref="1113" type="com.j2fe.workflow.definition.Node"/>
<item idref="1008" type="com.j2fe.workflow.definition.Node"/>
<item idref="8" type="com.j2fe.workflow.definition.Node"/>
<item idref="848" type="com.j2fe.workflow.definition.Node"/>
<item idref="1263" type="com.j2fe.workflow.definition.Node"/>
<item idref="1184" type="com.j2fe.workflow.definition.Node"/>
<item idref="952" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>false</optimize>
<parameter id="1310" type="java.util.HashMap">
<entry>
<key id="1311" type="java.lang.String">BulkSize</key>
<value id="1312" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="1313">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
</parameter>
<permissions id="1314" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>false</purgeAtEnd>
<retries>0</retries>
<startNode idref="861"/>
<status>RELEASED</status>
<variables id="1315" type="java.util.HashMap">
<entry>
<key id="1316" type="java.lang.String">BulkSize</key>
<value id="1317" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="1318">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<persistent>false</persistent>
<value id="1319" type="java.lang.Integer">1</value>
</value>
</entry>
</variables>
<version>8</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
