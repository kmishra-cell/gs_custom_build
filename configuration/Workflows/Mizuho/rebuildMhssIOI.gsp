<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.04">
<package-comment/>
<businessobject displayString="15 - V-10 Raise remote events" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>true</alwaysPersist>
<clustered>true</clustered>
<comment id="1">V-10 Raise remote events</comment>
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
<name id="12">log job finish</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="13">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="14" type="java.util.HashSet">
<item id="15" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="16">database</name>
<stringValue id="17">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="18" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="19">querySQL</name>
<stringValue id="20">call&#13;
 mhi_sp_eventlog (&#13;
	 'RebuildMhssIOI Workflow',&#13;
	 'workflow ending',&#13;
	'N/A'); </stringValue>
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
<name id="26">XML publish end dated issuers</name>
<nodeHandler>com.j2fe.event.RaiseEventRemote</nodeHandler>
<nodeHandlerClass id="27">com.j2fe.event.RaiseEventRemote</nodeHandlerClass>
<parameters id="28" type="java.util.HashSet">
<item id="29" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="30">eventName</name>
<stringValue id="31">PublishUsingXML</stringValue>
<type>CONSTANT</type>
</item>
<item id="32" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="33">["JobXML"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="34">parameters["JobXML"]</name>
<objectValue id="35" type="java.lang.String">&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;root&gt;
 &lt;job modelId="ISSRPUB" destinationJMS="jms/queue/issuer"&gt;
 &lt;sql&gt;INSTR_ISSR_ID IN (SELECT DISTINCT INSTR_ISSR_ID FROM FT_T_IOI_MHSS WHERE DELETE_FROM_IOI = 'Y'  AND INSTR_ISSR_ID != 'CONTROL')&lt;/sql&gt;
 &lt;/job&gt;
&lt;/root&gt;</objectValue>
<type>CONSTANT</type>
</item>
<item id="36" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="37">propertyFileLocation</name>
<stringValue id="38">db://resource/PublishingConfiguration/PublishingConfig.properties</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="39" type="java.util.HashSet">
<item id="40" type="com.j2fe.workflow.definition.Transition">
<name id="41">goto-next</name>
<source id="42">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="43"/>
<directJoin>true</directJoin>
<name id="44">Synchronize</name>
<nodeHandler>com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandler>
<nodeHandlerClass id="45">com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandlerClass>
<sources id="46" type="java.util.HashSet">
<item id="47" type="com.j2fe.workflow.definition.Transition">
<name id="48">end-loop</name>
<source id="49">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="50"/>
<directJoin>false</directJoin>
<name id="51">Loop each old issuer</name>
<nodeHandler>com.j2fe.workflow.handler.impl.ForEach</nodeHandler>
<nodeHandlerClass id="52">com.j2fe.workflow.handler.impl.ForEach</nodeHandlerClass>
<parameters id="53" type="java.util.HashSet">
<item id="54" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="55">counter</name>
<stringValue id="56">LoopCounter</stringValue>
<type>VARIABLE</type>
</item>
<item id="57" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="58">counter</name>
<stringValue id="59">LoopCounter</stringValue>
<type>VARIABLE</type>
</item>
<item id="60" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="61">input</name>
<stringValue id="62">BulkOldIssuers</stringValue>
<type>VARIABLE</type>
</item>
<item id="63" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="64">output</name>
<stringValue id="65">oldIssuer</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="66" type="java.util.HashSet">
<item id="67" type="com.j2fe.workflow.definition.Transition">
<name id="68">ToSplit</name>
<source id="69">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="70">Automatically generated</description>
<directJoin>false</directJoin>
<name id="71">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="72">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="73" type="java.util.HashSet">
<item id="74" type="com.j2fe.workflow.definition.Transition">
<name id="75">goto-next</name>
<source id="76">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="77"/>
<directJoin>false</directJoin>
<name id="78">Bean Shell Script (Standard)</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="79">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="80" type="java.util.HashSet">
<item id="81" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="82">statements</name>
<stringValue id="83">int loopCounter =0;</stringValue>
<type>CONSTANT</type>
</item>
<item id="84" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="85">variables["loopCounter"]</name>
<stringValue id="86">LoopCounter</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="87" type="java.util.HashSet">
<item id="88" type="com.j2fe.workflow.definition.Transition">
<name id="89">goto-next</name>
<source id="90">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="91"/>
<directJoin>true</directJoin>
<name id="92">Bulk delete IOI</name>
<nodeHandler>com.j2fe.general.activities.BulkItems</nodeHandler>
<nodeHandlerClass id="93">com.j2fe.general.activities.BulkItems</nodeHandlerClass>
<parameters id="94" type="java.util.HashSet">
<item id="95" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="96">bulk</name>
<stringValue id="97">BulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="98" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="99">input</name>
<stringValue id="100">oldIssuers</stringValue>
<type>VARIABLE</type>
</item>
<item id="101" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="102">output</name>
<stringValue id="103">BulkOldIssuers</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="104" type="java.util.HashSet">
<item id="105" type="com.j2fe.workflow.definition.Transition">
<name id="106">goto-next</name>
<source id="107">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="108"/>
<directJoin>false</directJoin>
<name id="109">log remove issuers from IOI</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="110">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="111" type="java.util.HashSet">
<item id="112" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="113">database</name>
<stringValue id="114">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="115" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="116">querySQL</name>
<stringValue id="117">call 
mhi_sp_eventlog (
	 'RebuildMhssIOI Workflow',
	 'remove issuers from IOI',
	'N/A'); </stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="118" type="java.util.HashSet">
<item id="119" type="com.j2fe.workflow.definition.Transition">
<name id="120">rows-found</name>
<source id="121">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="122"/>
<directJoin>false</directJoin>
<name id="123">Issuers to remove from IOI</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="124">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="125" type="java.util.HashSet">
<item id="126" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="127">database</name>
<stringValue id="128">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="129" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="130">firstColumnsResult</name>
<stringValue id="131">oldIssuers</stringValue>
<type>VARIABLE</type>
</item>
<item id="132" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="133">querySQL</name>
<stringValue id="134">select INSTR_ISSR_ID from FT_T_IOI_MHSS where UPDATED='N' and DELETE_FROM_IOI = 'Y'  AND INSTR_ISSR_ID != 'CONTROL'</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="135" type="java.util.HashSet">
<item id="136" type="com.j2fe.workflow.definition.Transition">
<name id="137">ToSplit</name>
<source id="138">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="139">Automatically generated</description>
<directJoin>false</directJoin>
<name id="140">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="141">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="142" type="java.util.HashSet">
<item id="143" type="com.j2fe.workflow.definition.Transition">
<name id="144">goto-next</name>
<source id="145">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="146"/>
<directJoin>true</directJoin>
<name id="147">Synchronize</name>
<nodeHandler>com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandler>
<nodeHandlerClass id="148">com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandlerClass>
<sources id="149" type="java.util.HashSet">
<item id="150" type="com.j2fe.workflow.definition.Transition">
<name id="151">end-loop</name>
<source id="152">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="153"/>
<directJoin>false</directJoin>
<name id="154">Loop each locked issuer</name>
<nodeHandler>com.j2fe.workflow.handler.impl.ForEach</nodeHandler>
<nodeHandlerClass id="155">com.j2fe.workflow.handler.impl.ForEach</nodeHandlerClass>
<parameters id="156" type="java.util.HashSet">
<item id="157" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="158">counter</name>
<stringValue id="159">LoopCounter</stringValue>
<type>VARIABLE</type>
</item>
<item id="160" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="161">counter</name>
<stringValue id="162">LoopCounter</stringValue>
<type>VARIABLE</type>
</item>
<item id="163" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="164">input</name>
<stringValue id="165">BulkLockedIssuers</stringValue>
<type>VARIABLE</type>
</item>
<item id="166" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="167">output</name>
<stringValue id="168">lockedIssuer</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="169" type="java.util.HashSet">
<item id="170" type="com.j2fe.workflow.definition.Transition">
<name id="171">ToSplit</name>
<source id="172">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="173">Automatically generated</description>
<directJoin>false</directJoin>
<name id="174">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="175">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="176" type="java.util.HashSet">
<item id="177" type="com.j2fe.workflow.definition.Transition">
<name id="178">goto-next</name>
<source id="179">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="180"/>
<directJoin>false</directJoin>
<name id="181">Bean Shell Script (Standard)</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="182">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="183" type="java.util.HashSet">
<item id="184" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="185">statements</name>
<stringValue id="186">int loopCounter =0;</stringValue>
<type>CONSTANT</type>
</item>
<item id="187" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="188">variables["loopCounter"]</name>
<stringValue id="189">LoopCounter</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="190" type="java.util.HashSet">
<item id="191" type="com.j2fe.workflow.definition.Transition">
<name id="192">goto-next</name>
<source id="193">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="194"/>
<directJoin>true</directJoin>
<name id="195">Bulk update locked issuers</name>
<nodeHandler>com.j2fe.general.activities.BulkItems</nodeHandler>
<nodeHandlerClass id="196">com.j2fe.general.activities.BulkItems</nodeHandlerClass>
<parameters id="197" type="java.util.HashSet">
<item id="198" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="199">bulk</name>
<stringValue id="200">BulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="201" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="202">input</name>
<stringValue id="203">lockedIssuers</stringValue>
<type>VARIABLE</type>
</item>
<item id="204" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="205">output</name>
<stringValue id="206">BulkLockedIssuers</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="207" type="java.util.HashSet">
<item id="208" type="com.j2fe.workflow.definition.Transition">
<name id="209">rows-found</name>
<source id="210">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="211"/>
<directJoin>false</directJoin>
<name id="212">Check for locks</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="213">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="214" type="java.util.HashSet">
<item id="215" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="216">database</name>
<stringValue id="217">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="218" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="219">firstColumnsResult</name>
<stringValue id="220">lockedIssuers</stringValue>
<type>VARIABLE</type>
</item>
<item id="221" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="222">querySQL</name>
<stringValue id="223">select INSTR_ISSR_ID from FT_T_IOI_MHSS where UPDATED='N' and DELETE_FROM_IOI = 'Y'  AND INSTR_ISSR_ID != 'CONTROL'
and INSTR_ISSR_ID in (select OVR_REF_OID from ft_t_ovrc where tbl_id = 'IRGP' and END_TMS is null)</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="224" type="java.util.HashSet">
<item id="225" type="com.j2fe.workflow.definition.Transition">
<name id="226">goto-next</name>
<source id="227">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="228"/>
<directJoin>false</directJoin>
<name id="229">Flag Issuers to remove from IOI</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="230">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="231" type="java.util.HashSet">
<item id="232" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="233">database</name>
<stringValue id="234">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="235" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="236">querySQL</name>
<stringValue id="237">UPDATE FT_T_IOI_MHSS SET DELETE_FROM_IOI='Y'
WHERE ASSET_SOI = 'N' AND GTOR='N' AND CUST='N' AND ASSET_RUP='N' AND GTOR_RUP='N' AND CUST_RUP='N' AND CUST_IP='N' and LAGR_FLAR = 'N' and LAGR_FLAR_RUP = 'N' and INSTR_ISSR_ID != 'CONTROL'</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="238" type="java.util.HashSet">
<item id="239" type="com.j2fe.workflow.definition.Transition">
<name id="240">goto-next</name>
<source id="241">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="242"/>
<directJoin>false</directJoin>
<name id="243">log check for locks</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="244">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="245" type="java.util.HashSet">
<item id="246" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="247">database</name>
<stringValue id="248">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="249" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="250">querySQL</name>
<stringValue id="251">call&#13;
 mhi_sp_eventlog (&#13;
	 'RebuildMhssIOI Workflow',&#13;
	 'check for locks',&#13;
	'N/A'); </stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="252" type="java.util.HashSet">
<item id="253" type="com.j2fe.workflow.definition.Transition">
<name id="254">ToSplit</name>
<source id="255">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="256">Automatically generated</description>
<directJoin>false</directJoin>
<name id="257">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="258">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="259" type="java.util.HashSet">
<item id="260" type="com.j2fe.workflow.definition.Transition">
<name id="261">goto-next</name>
<source id="262">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="263"/>
<directJoin>true</directJoin>
<name id="264">Synchronize</name>
<nodeHandler>com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandler>
<nodeHandlerClass id="265">com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandlerClass>
<sources id="266" type="java.util.HashSet">
<item id="267" type="com.j2fe.workflow.definition.Transition">
<name id="268">end-loop</name>
<source id="269">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="270"/>
<directJoin>false</directJoin>
<name id="271">Loop each new issuer</name>
<nodeHandler>com.j2fe.workflow.handler.impl.ForEach</nodeHandler>
<nodeHandlerClass id="272">com.j2fe.workflow.handler.impl.ForEach</nodeHandlerClass>
<parameters id="273" type="java.util.HashSet">
<item id="274" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="275">counter</name>
<stringValue id="276">LoopCounter</stringValue>
<type>VARIABLE</type>
</item>
<item id="277" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="278">counter</name>
<stringValue id="279">LoopCounter</stringValue>
<type>VARIABLE</type>
</item>
<item id="280" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="281">input</name>
<stringValue id="282">newNonRUPIssuers</stringValue>
<type>VARIABLE</type>
</item>
<item id="283" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="284">output</name>
<stringValue id="285">nonRUPIssuer</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="286" type="java.util.HashSet">
<item id="287" type="com.j2fe.workflow.definition.Transition">
<name id="288">ToSplit</name>
<source id="289">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="290">Automatically generated</description>
<directJoin>false</directJoin>
<name id="291">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="292">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="293" type="java.util.HashSet">
<item id="294" type="com.j2fe.workflow.definition.Transition">
<name id="295">goto-next</name>
<source id="296">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="297"/>
<directJoin>false</directJoin>
<name id="298">Bean Shell Script (Standard)</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="299">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="300" type="java.util.HashSet">
<item id="301" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="302">statements</name>
<stringValue id="303">int loopCounter =0;</stringValue>
<type>CONSTANT</type>
</item>
<item id="304" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="305">variables["loopCounter"]</name>
<stringValue id="306">LoopCounter</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="307" type="java.util.HashSet">
<item id="308" type="com.j2fe.workflow.definition.Transition">
<name id="309">goto-next</name>
<source id="310">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="311"/>
<directJoin>true</directJoin>
<name id="312">Bulk newIssuers</name>
<nodeHandler>com.j2fe.general.activities.BulkItems</nodeHandler>
<nodeHandlerClass id="313">com.j2fe.general.activities.BulkItems</nodeHandlerClass>
<parameters id="314" type="java.util.HashSet">
<item id="315" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="316">bulk</name>
<stringValue id="317">BulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="318" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="319">input</name>
<stringValue id="320">newNonRUPIssuers</stringValue>
<type>VARIABLE</type>
</item>
<item id="321" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="322">output</name>
<stringValue id="323">BulknonRUPIssuers</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="324" type="java.util.HashSet">
<item id="325" type="com.j2fe.workflow.definition.Transition">
<name id="326">goto-next</name>
<source id="327">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="328"/>
<directJoin>false</directJoin>
<name id="329">log add issuers to IOI</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="330">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="331" type="java.util.HashSet">
<item id="332" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="333">database</name>
<stringValue id="334">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="335" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="336">querySQL</name>
<stringValue id="337">call&#13;
 mhi_sp_eventlog (&#13;
	 'RebuildMhssIOI Workflow',&#13;
	 'add Issuers to IOI',&#13;
	'N/A'); &#13;
</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="338" type="java.util.HashSet">
<item id="339" type="com.j2fe.workflow.definition.Transition">
<name id="340">rows-found</name>
<source id="341">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="342"/>
<directJoin>false</directJoin>
<name id="343">Issuers to Add to IOI</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="344">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="345" type="java.util.HashSet">
<item id="346" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="347">database</name>
<stringValue id="348">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="349" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="350">firstColumnsResult</name>
<stringValue id="351">newNonRUPIssuers</stringValue>
<type>VARIABLE</type>
</item>
<item id="352" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="353">querySQL</name>
<stringValue id="354">select INSTR_ISSR_ID from FT_T_IOI_MHSS where UPDATED='N' and NEW_IOI_MEMBER = 'Y' AND INSTR_ISSR_ID != 'CONTROL'</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="355" type="java.util.HashSet">
<item id="356" type="com.j2fe.workflow.definition.Transition">
<name id="357">ToSplit</name>
<source id="358">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="359">Automatically generated</description>
<directJoin>false</directJoin>
<name id="360">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="361">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="362" type="java.util.HashSet">
<item id="363" type="com.j2fe.workflow.definition.Transition">
<name id="364">goto-next</name>
<source id="365">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="366"/>
<directJoin>true</directJoin>
<name id="367">Synchronize</name>
<nodeHandler>com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandler>
<nodeHandlerClass id="368">com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandlerClass>
<sources id="369" type="java.util.HashSet">
<item id="370" type="com.j2fe.workflow.definition.Transition">
<name id="371">end-loop</name>
<source id="372">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="373"/>
<directJoin>false</directJoin>
<name id="374">Loop each new issuer</name>
<nodeHandler>com.j2fe.workflow.handler.impl.ForEach</nodeHandler>
<nodeHandlerClass id="375">com.j2fe.workflow.handler.impl.ForEach</nodeHandlerClass>
<parameters id="376" type="java.util.HashSet">
<item id="377" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="378">counter</name>
<stringValue id="379">LoopCounter</stringValue>
<type>VARIABLE</type>
</item>
<item id="380" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="381">counter</name>
<stringValue id="382">LoopCounter</stringValue>
<type>VARIABLE</type>
</item>
<item id="383" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="384">input</name>
<stringValue id="385">BulkNewIssuers</stringValue>
<type>VARIABLE</type>
</item>
<item id="386" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="387">output</name>
<stringValue id="388">newIssuer</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="389" type="java.util.HashSet">
<item id="390" type="com.j2fe.workflow.definition.Transition">
<name id="391">ToSplit</name>
<source id="392">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="393">Automatically generated</description>
<directJoin>false</directJoin>
<name id="394">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="395">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="396" type="java.util.HashSet">
<item id="397" type="com.j2fe.workflow.definition.Transition">
<name id="398">goto-next</name>
<source id="399">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="400"/>
<directJoin>false</directJoin>
<name id="401">Bean Shell Script (Standard)</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="402">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="403" type="java.util.HashSet">
<item id="404" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="405">statements</name>
<stringValue id="406">int loopCounter =0;</stringValue>
<type>CONSTANT</type>
</item>
<item id="407" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="408">variables["loopCounter"]</name>
<stringValue id="409">LoopCounter</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="410" type="java.util.HashSet">
<item id="411" type="com.j2fe.workflow.definition.Transition">
<name id="412">goto-next</name>
<source id="413">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="414"/>
<directJoin>true</directJoin>
<name id="415">Bulk RUP newIssuers</name>
<nodeHandler>com.j2fe.general.activities.BulkItems</nodeHandler>
<nodeHandlerClass id="416">com.j2fe.general.activities.BulkItems</nodeHandlerClass>
<parameters id="417" type="java.util.HashSet">
<item id="418" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="419">bulk</name>
<stringValue id="420">BulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="421" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="422">input</name>
<stringValue id="423">newIssuers</stringValue>
<type>VARIABLE</type>
</item>
<item id="424" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="425">output</name>
<stringValue id="426">BulkNewIssuers</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="427" type="java.util.HashSet">
<item id="428" type="com.j2fe.workflow.definition.Transition">
<name id="429">goto-next</name>
<source id="430">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="431"/>
<directJoin>false</directJoin>
<name id="432">log add rup issuers to IOI</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="433">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="434" type="java.util.HashSet">
<item id="435" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="436">database</name>
<stringValue id="437">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="438" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="439">querySQL</name>
<stringValue id="440">call&#13;
 mhi_sp_eventlog (&#13;
	 'RebuildMhssIOI Workflow',&#13;
	 'add RUP Issuers to IOI',&#13;
	'N/A'); </stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="441" type="java.util.HashSet">
<item id="442" type="com.j2fe.workflow.definition.Transition">
<name id="443">rows-found</name>
<source id="444">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="445"/>
<directJoin>false</directJoin>
<name id="446">RUP Issuers to Add to IOI</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="447">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="448" type="java.util.HashSet">
<item id="449" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="450">database</name>
<stringValue id="451">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="452" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="453">firstColumnsResult</name>
<stringValue id="454">newIssuers</stringValue>
<type>VARIABLE</type>
</item>
<item id="455" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="456">querySQL</name>
<stringValue id="457">select INSTR_ISSR_ID from FT_T_IOI_MHSS where UPDATED='N' and NEW_IOI_MEMBER = 'Y' and (ASSET_RUP='Y' or GTOR_RUP='Y' or CUST_RUP='Y' or LAGR_FLAR_RUP = 'Y') AND INSTR_ISSR_ID != 'CONTROL'</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="458" type="java.util.HashSet">
<item id="459" type="com.j2fe.workflow.definition.Transition">
<name id="460">goto-next</name>
<source id="461">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="462"/>
<directJoin>false</directJoin>
<name id="463">Create Request Transaction</name>
<nodeHandler>com.j2fe.streetlamp.activities.CreateTransaction</nodeHandler>
<nodeHandlerClass id="464">com.j2fe.streetlamp.activities.CreateTransaction</nodeHandlerClass>
<parameters id="465" type="java.util.HashSet">
<item id="466" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="467">flushImmediate</name>
<stringValue id="468">true</stringValue>
<type>CONSTANT</type>
</item>
<item id="469" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="470">jobId</name>
<stringValue id="471">ParentJobID</stringValue>
<type>VARIABLE</type>
</item>
<item id="472" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="473">transactionId</name>
<stringValue id="474">RequestTransaction</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="475" type="java.util.HashSet">
<item id="476" type="com.j2fe.workflow.definition.Transition">
<name id="477">goto-next</name>
<source id="478">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="479"/>
<directJoin>false</directJoin>
<name id="480">LAGR_FLAR_RUP</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="481">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="482" type="java.util.HashSet">
<item id="483" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="484">database</name>
<stringValue id="485">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="486" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="487">querySQL</name>
<stringValue id="488">WITH source_data AS (
  SELECT DISTINCT issr.INSTR_ISSR_ID
  FROM FT_T_FLAR flar
  INNER JOIN FT_T_ISSR issr
    ON (SELECT MHI_FINS_UP(flar.inst_mnem)) = issr.fins_inst_mnem
   AND issr.end_tms IS NULL
  INNER JOIN FT_T_LAGR lagr
    ON flar.leg_agrmnt_id = lagr.leg_agrmnt_id
   AND lagr.agrmnt_termintn_dte IS NULL
   AND lagr.agrmnt_stat_typ NOT IN ('SUPERSEDED', 'TERMNTED')
  WHERE flar.end_tms IS NULL
    AND lagr.ORG_ID = 'MHSS'
)
INSERT INTO FT_T_IOI_MHSS (
  INSTR_ISSR_ID, UPDATING, UPDATED, ASSET_SOI,
  GTOR, CUST, ASSET_RUP, GTOR_RUP, CUST_RUP,
  NEW_IOI_MEMBER, CUST_IP, LAGR_FLAR, LAGR_FLAR_RUP
)
SELECT 
  s.INSTR_ISSR_ID, 'N', 'N', 'N',
  'N', 'N', 'N', 'N', 'N',
  'Y', 'N', 'N', 'Y'
FROM source_data s
ON CONFLICT (INSTR_ISSR_ID)
DO UPDATE SET
  LAGR_FLAR = EXCLUDED.LAGR_FLAR
WHERE FT_T_IOI_MHSS.LAGR_FLAR IS DISTINCT FROM 'Y';</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="489" type="java.util.HashSet">
<item id="490" type="com.j2fe.workflow.definition.Transition">
<name id="491">goto-next</name>
<source id="492">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="493"/>
<directJoin>false</directJoin>
<name id="494">log add lagr flar rup issuers</name>
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
<name id="501">querySQL</name>
<stringValue id="502">call mhi_sp_eventlog (&#13;
	 'RebuildMhssIOI Workflow',&#13;
	 'add LAGR FLAR RUP Issuers',&#13;
	'N/A'); </stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="503" type="java.util.HashSet">
<item id="504" type="com.j2fe.workflow.definition.Transition">
<name id="505">rows-found</name>
<source id="506">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="507"/>
<directJoin>false</directJoin>
<name id="508">Add LAGR_FLAR_RUP Issuers?</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="509">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="510" type="java.util.HashSet">
<item id="511" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="512">database</name>
<stringValue id="513">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="514" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="515">firstColumnsResult</name>
<stringValue id="516">newNonRUPIssuers</stringValue>
<type>VARIABLE</type>
</item>
<item id="517" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="518">querySQL</name>
<stringValue id="519">select 1 from FT_T_IOI_MHSS where INSTR_ISSR_ID = 'CONTROL' and LAGR_FLAR_RUP ='Y'</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="520" type="java.util.HashSet">
<item id="521" type="com.j2fe.workflow.definition.Transition">
<name id="522">ToSplit</name>
<source id="523">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="524">Automatically generated</description>
<directJoin>false</directJoin>
<name id="525">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="526">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="527" type="java.util.HashSet">
<item id="528" type="com.j2fe.workflow.definition.Transition">
<name id="529">goto-next</name>
<source id="530">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="531"/>
<directJoin>false</directJoin>
<name id="532">LAGR_FLAR</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="533">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="534" type="java.util.HashSet">
<item id="535" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="536">database</name>
<stringValue id="537">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="538" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="539">querySQL</name>
<stringValue id="540">WITH source_data AS (&#13;
  SELECT DISTINCT issr.INSTR_ISSR_ID&#13;
  FROM FT_T_FLAR flar&#13;
  INNER JOIN FT_T_ISSR issr &#13;
    ON flar.inst_mnem = issr.fins_inst_mnem&#13;
   AND issr.end_tms IS NULL&#13;
  INNER JOIN FT_T_LAGR lagr &#13;
    ON flar.leg_agrmnt_id = lagr.leg_agrmnt_id&#13;
   AND lagr.agrmnt_termintn_dte IS NULL&#13;
   AND lagr.agrmnt_stat_typ NOT IN ('SUPERSEDED', 'TERMNTED')&#13;
  WHERE flar.end_tms IS NULL&#13;
    AND lagr.ORG_ID = 'MHSS'&#13;
)&#13;
INSERT INTO FT_T_IOI_MHSS (&#13;
  INSTR_ISSR_ID, UPDATING, UPDATED, ASSET_SOI,&#13;
  GTOR, CUST, ASSET_RUP, GTOR_RUP, CUST_RUP,&#13;
  NEW_IOI_MEMBER, CUST_IP, LAGR_FLAR, LAGR_FLAR_RUP&#13;
)&#13;
SELECT &#13;
  s.INSTR_ISSR_ID, 'N', 'N', 'N',&#13;
  'N', 'N', 'N', 'N', 'N',&#13;
  'Y', 'N', 'Y', 'N'&#13;
FROM source_data s&#13;
ON CONFLICT (INSTR_ISSR_ID)&#13;
DO UPDATE SET&#13;
  LAGR_FLAR = EXCLUDED.LAGR_FLAR&#13;
WHERE FT_T_IOI_MHSS.LAGR_FLAR IS DISTINCT FROM 'Y';</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="541" type="java.util.HashSet">
<item id="542" type="com.j2fe.workflow.definition.Transition">
<name id="543">goto-next</name>
<source id="544">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="545"/>
<directJoin>false</directJoin>
<name id="546">log add lagr flar issuers</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="547">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="548" type="java.util.HashSet">
<item id="549" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="550">database</name>
<stringValue id="551">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="552" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="553">querySQL</name>
<stringValue id="554">call&#13;
 mhi_sp_eventlog (&#13;
	 'RebuildMhssIOI Workflow',&#13;
	 'add LAGR FLAR Issuers',&#13;
	'N/A'); </stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="555" type="java.util.HashSet">
<item id="556" type="com.j2fe.workflow.definition.Transition">
<name id="557">rows-found</name>
<source id="558">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="559"/>
<directJoin>false</directJoin>
<name id="560">Add LAGR_FLAR Issuers?</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="561">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="562" type="java.util.HashSet">
<item id="563" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="564">database</name>
<stringValue id="565">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="566" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="567">firstColumnsResult</name>
<stringValue id="568">newNonRUPIssuers</stringValue>
<type>VARIABLE</type>
</item>
<item id="569" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="570">querySQL</name>
<stringValue id="571">select 1 from FT_T_IOI_MHSS where INSTR_ISSR_ID = 'CONTROL' and LAGR_FLAR ='Y'</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="572" type="java.util.HashSet">
<item id="573" type="com.j2fe.workflow.definition.Transition">
<name id="574">ToSplit</name>
<source id="575">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="576">Automatically generated</description>
<directJoin>false</directJoin>
<name id="577">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="578">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="579" type="java.util.HashSet">
<item id="580" type="com.j2fe.workflow.definition.Transition">
<name id="581">goto-next</name>
<source id="582">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="583"/>
<directJoin>false</directJoin>
<name id="584">CUST IPS</name>
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
<name id="591">querySQL</name>
<objectValue id="592" type="java.lang.String">WITH source_data AS (&#13;
  SELECT DISTINCT issr.INSTR_ISSR_ID&#13;
  FROM FT_T_ISSR issr&#13;
  WHERE issr.END_TMS IS NULL&#13;
    AND issr.FINS_INST_MNEM IN (&#13;
      SELECT ffrl.PRNT_INST_MNEM&#13;
      FROM FT_T_FFRL ffrl&#13;
      WHERE ffrl.END_TMS IS NULL&#13;
        AND ffrl.REL_TYP = 'PARNTCOF'&#13;
        AND ffrl.INST_MNEM IN (&#13;
          SELECT fiid.INST_MNEM&#13;
          FROM ft_t_fiid fiid&#13;
          WHERE fiid.FINS_ID_CTXT_TYP = 'SMREF'&#13;
            AND fiid.END_TMS IS NULL&#13;
            AND (&#13;
              fiid.INST_SYMBOL_STAT_TYP = 'ACTIVE' OR&#13;
              (&#13;
                fiid.INST_SYMBOL_STAT_TYP = 'INACTIVE'&#13;
                AND fiid.INST_SYMBOL_STAT_TMS &gt;= CURRENT_DATE - INTERVAL '35 days'&#13;
              )&#13;
            )&#13;
        )&#13;
    )&#13;
)&#13;
INSERT INTO FT_T_IOI_MHSS (&#13;
  INSTR_ISSR_ID, UPDATING, UPDATED, ASSET_SOI,&#13;
  GTOR, CUST, ASSET_RUP, GTOR_RUP, CUST_RUP,&#13;
  NEW_IOI_MEMBER, CUST_IP, LAGR_FLAR, LAGR_FLAR_RUP&#13;
)&#13;
SELECT&#13;
  s.INSTR_ISSR_ID, 'N', 'N', 'N',&#13;
  'N', 'N', 'N', 'N', 'N',&#13;
  'Y', 'Y', 'N', 'N'&#13;
FROM source_data s&#13;
ON CONFLICT (INSTR_ISSR_ID)&#13;
DO UPDATE SET&#13;
  CUST_IP = EXCLUDED.CUST_IP&#13;
WHERE FT_T_IOI_MHSS.CUST_IP IS DISTINCT FROM 'Y';</objectValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="593" type="java.util.HashSet">
<item id="594" type="com.j2fe.workflow.definition.Transition">
<name id="595">goto-next</name>
<source id="596">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="597"/>
<directJoin>false</directJoin>
<name id="598">log add cust ip issuers</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="599">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="600" type="java.util.HashSet">
<item id="601" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="602">database</name>
<stringValue id="603">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="604" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="605">querySQL</name>
<stringValue id="606">call&#13;
 mhi_sp_eventlog (&#13;
	 'RebuildMhssIOI Workflow',&#13;
	 'add CUST IP Issuers',&#13;
	'N/A'); </stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="607" type="java.util.HashSet">
<item id="608" type="com.j2fe.workflow.definition.Transition">
<name id="609">rows-found</name>
<source id="610">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="611"/>
<directJoin>false</directJoin>
<name id="612">Add MHSS CUST IP Issuers?</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="613">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="614" type="java.util.HashSet">
<item id="615" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="616">database</name>
<stringValue id="617">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="618" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="619">firstColumnsResult</name>
<stringValue id="620">newNonRUPIssuers</stringValue>
<type>VARIABLE</type>
</item>
<item id="621" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="622">querySQL</name>
<stringValue id="623">select 1 from FT_T_IOI_MHSS where INSTR_ISSR_ID = 'CONTROL' and CUST_IP ='Y'</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="624" type="java.util.HashSet">
<item id="625" type="com.j2fe.workflow.definition.Transition">
<name id="626">ToSplit</name>
<source id="627">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="628">Automatically generated</description>
<directJoin>false</directJoin>
<name id="629">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="630">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="631" type="java.util.HashSet">
<item id="632" type="com.j2fe.workflow.definition.Transition">
<name id="633">goto-next</name>
<source id="634">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="635"/>
<directJoin>false</directJoin>
<name id="636">CUST RUPS</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="637">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="638" type="java.util.HashSet">
<item id="639" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="640">database</name>
<stringValue id="641">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="642" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="643">querySQL</name>
<stringValue id="644">WITH source_data AS (&#13;
  SELECT DISTINCT issr.INSTR_ISSR_ID&#13;
  FROM FT_T_ISSR issr&#13;
  WHERE issr.END_TMS IS NULL&#13;
    AND issr.FINS_INST_MNEM IN (&#13;
      SELECT MHI_FINS_UP(fiid.INST_MNEM)&#13;
      FROM ft_t_fiid fiid&#13;
      WHERE fiid.FINS_ID_CTXT_TYP = 'SMREF'&#13;
        AND fiid.END_TMS IS NULL&#13;
        AND (&#13;
          fiid.INST_SYMBOL_STAT_TYP = 'ACTIVE'&#13;
          OR (&#13;
            fiid.INST_SYMBOL_STAT_TYP = 'INACTIVE'&#13;
            AND fiid.INST_SYMBOL_STAT_TMS &gt;= CURRENT_DATE - INTERVAL '35 days'&#13;
          )&#13;
        )&#13;
    )&#13;
)&#13;
INSERT INTO FT_T_IOI_MHSS (&#13;
  INSTR_ISSR_ID, UPDATING, UPDATED, ASSET_SOI,&#13;
  GTOR, CUST, ASSET_RUP, GTOR_RUP, CUST_RUP,&#13;
  NEW_IOI_MEMBER, CUST_IP, LAGR_FLAR, LAGR_FLAR_RUP&#13;
)&#13;
SELECT&#13;
  s.INSTR_ISSR_ID, 'N', 'N', 'N',&#13;
  'N', 'N', 'N', 'N', 'Y',&#13;
  'Y', 'N', 'N', 'N'&#13;
FROM source_data s&#13;
ON CONFLICT (INSTR_ISSR_ID)&#13;
DO UPDATE SET&#13;
  CUST_RUP = EXCLUDED.CUST_RUP&#13;
WHERE FT_T_IOI_MHSS.CUST_RUP IS DISTINCT FROM 'Y';</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="645" type="java.util.HashSet">
<item id="646" type="com.j2fe.workflow.definition.Transition">
<name id="647">goto-next</name>
<source id="648">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="649"/>
<directJoin>false</directJoin>
<name id="650">log add cust rup issuers</name>
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
<stringValue id="658">call&#13;
 mhi_sp_eventlog (&#13;
	 'RebuildMhssIOI Workflow',&#13;
	 'add CUST RUP Issuers',&#13;
	'N/A'); </stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="659" type="java.util.HashSet">
<item id="660" type="com.j2fe.workflow.definition.Transition">
<name id="661">rows-found</name>
<source id="662">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="663"/>
<directJoin>false</directJoin>
<name id="664">Add MHSS CUST RUP Issuers?</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="665">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="666" type="java.util.HashSet">
<item id="667" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="668">database</name>
<stringValue id="669">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="670" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="671">firstColumnsResult</name>
<stringValue id="672">newNonRUPIssuers</stringValue>
<type>VARIABLE</type>
</item>
<item id="673" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="674">querySQL</name>
<stringValue id="675">select 1 from FT_T_IOI_MHSS where INSTR_ISSR_ID = 'CONTROL' and CUST_RUP ='Y'</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="676" type="java.util.HashSet">
<item id="677" type="com.j2fe.workflow.definition.Transition">
<name id="678">ToSplit</name>
<source id="679">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="680">Automatically generated</description>
<directJoin>false</directJoin>
<name id="681">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="682">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="683" type="java.util.HashSet">
<item id="684" type="com.j2fe.workflow.definition.Transition">
<name id="685">goto-next</name>
<source id="686">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="687"/>
<directJoin>false</directJoin>
<name id="688">GTOR RUPS</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="689">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="690" type="java.util.HashSet">
<item id="691" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="692">database</name>
<stringValue id="693">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="694" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="695">querySQL</name>
<objectValue id="696" type="java.lang.String">WITH source_data AS (&#13;
  SELECT DISTINCT issr.INSTR_ISSR_ID&#13;
  FROM ft_t_issr issr&#13;
  WHERE issr.END_TMS IS NULL&#13;
    AND issr.FINS_INST_MNEM IN (&#13;
      SELECT MHI_FINS_UP(sub_issr.fins_inst_mnem)&#13;
      FROM ft_t_issr sub_issr&#13;
      WHERE sub_issr.END_TMS IS NULL&#13;
        AND sub_issr.INSTR_ISSR_ID IN (&#13;
          SELECT issr_inner.INSTR_ISSR_ID&#13;
          FROM FT_T_ISSR issr_inner&#13;
          WHERE issr_inner.END_TMS IS NULL&#13;
            AND issr_inner.FINS_INST_MNEM IN (&#13;
              SELECT frip.INST_MNEM&#13;
              FROM FT_T_FRIP frip&#13;
              WHERE frip.FINSRL_TYP = 'GUARNTOR'&#13;
                AND frip.END_TMS IS NULL&#13;
                AND frip.INSTR_ID IN (&#13;
                  SELECT issu.INSTR_ID&#13;
                  FROM FT_T_ISSU issu&#13;
                  WHERE issu.END_TMS IS NULL&#13;
                    AND issu.INSTR_ID IN (&#13;
                      SELECT gp.INSTR_ID&#13;
                      FROM FT_T_ISGP gp&#13;
                      WHERE gp.END_TMS IS NULL&#13;
                        AND gp.PRNT_ISS_GRP_OID IN (&#13;
                          SELECT gr.ISS_GRP_OID&#13;
                          FROM FT_T_ISGR gr&#13;
                          WHERE gr.ORG_ID = 'MHSS'&#13;
                        )&#13;
                    )&#13;
                )&#13;
            )&#13;
        )&#13;
    )&#13;
)&#13;
INSERT INTO FT_T_IOI_MHSS (&#13;
  INSTR_ISSR_ID, UPDATING, UPDATED, ASSET_SOI,&#13;
  GTOR, CUST, ASSET_RUP, GTOR_RUP, CUST_RUP,&#13;
  NEW_IOI_MEMBER, CUST_IP, LAGR_FLAR, LAGR_FLAR_RUP&#13;
)&#13;
SELECT &#13;
  s.INSTR_ISSR_ID, 'N', 'N', 'N',&#13;
  'N', 'N', 'N', 'Y', 'N',&#13;
  'Y', 'N', 'N', 'N'&#13;
FROM source_data s&#13;
ON CONFLICT (INSTR_ISSR_ID)&#13;
DO UPDATE SET&#13;
  GTOR_RUP = EXCLUDED.GTOR_RUP&#13;
WHERE FT_T_IOI_MHSS.GTOR_RUP IS DISTINCT FROM 'Y';</objectValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="697" type="java.util.HashSet">
<item id="698" type="com.j2fe.workflow.definition.Transition">
<name id="699">goto-next</name>
<source id="700">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="701"/>
<directJoin>false</directJoin>
<name id="702">log add gtor rup issuers</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="703">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="704" type="java.util.HashSet">
<item id="705" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="706">database</name>
<stringValue id="707">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="708" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="709">querySQL</name>
<stringValue id="710">call&#13;
 mhi_sp_eventlog (&#13;
	 'RebuildMhssIOI Workflow',&#13;
	 'add GTOR RUP Issuers',&#13;
	'N/A'); </stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="711" type="java.util.HashSet">
<item id="712" type="com.j2fe.workflow.definition.Transition">
<name id="713">rows-found</name>
<source id="714">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="715"/>
<directJoin>false</directJoin>
<name id="716">Add GTOR RUP Issuers?</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="717">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="718" type="java.util.HashSet">
<item id="719" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="720">database</name>
<stringValue id="721">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="722" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="723">firstColumnsResult</name>
<stringValue id="724">newNonRUPIssuers</stringValue>
<type>VARIABLE</type>
</item>
<item id="725" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="726">querySQL</name>
<stringValue id="727">select 1 from FT_T_IOI_MHSS where INSTR_ISSR_ID = 'CONTROL' and GTOR_RUP ='Y'</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="728" type="java.util.HashSet">
<item id="729" type="com.j2fe.workflow.definition.Transition">
<name id="730">ToSplit</name>
<source id="731">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="732">Automatically generated</description>
<directJoin>false</directJoin>
<name id="733">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="734">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="735" type="java.util.HashSet">
<item id="736" type="com.j2fe.workflow.definition.Transition">
<name id="737">goto-next</name>
<source id="738">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="739"/>
<directJoin>false</directJoin>
<name id="740">SOI Asset RUPS</name>
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
<input>true</input>
<name id="747">querySQL</name>
<objectValue id="748" type="java.lang.String">WITH source_data AS (&#13;
  SELECT DISTINCT issr.INSTR_ISSR_ID&#13;
  FROM FT_T_ISSR issr&#13;
  WHERE issr.END_TMS IS NULL&#13;
    AND issr.FINS_INST_MNEM IN (&#13;
      SELECT MHI_FINS_UP(sub_issr.FINS_INST_MNEM)&#13;
      FROM FT_T_ISSR sub_issr&#13;
      WHERE sub_issr.END_TMS IS NULL&#13;
        AND sub_issr.INSTR_ISSR_ID IN (&#13;
          SELECT issu.INSTR_ISSR_ID&#13;
          FROM FT_T_ISSU issu&#13;
          WHERE issu.END_TMS IS NULL&#13;
            AND issu.INSTR_ID IN (&#13;
              SELECT gp.INSTR_ID&#13;
              FROM FT_T_ISGP gp&#13;
              WHERE gp.END_TMS IS NULL&#13;
                AND gp.PRNT_ISS_GRP_OID IN (&#13;
                  SELECT gr.ISS_GRP_OID&#13;
                  FROM FT_T_ISGR gr&#13;
                  WHERE gr.ORG_ID = 'MHSS'&#13;
                )&#13;
            )&#13;
        )&#13;
    )&#13;
)&#13;
INSERT INTO FT_T_IOI_MHSS (&#13;
  INSTR_ISSR_ID, UPDATING, UPDATED, ASSET_SOI,&#13;
  GTOR, CUST, ASSET_RUP, GTOR_RUP, CUST_RUP,&#13;
  NEW_IOI_MEMBER, CUST_IP, LAGR_FLAR, LAGR_FLAR_RUP&#13;
)&#13;
SELECT &#13;
  s.INSTR_ISSR_ID, 'N', 'N', 'N',&#13;
  'N', 'N', 'Y', 'N', 'N',&#13;
  'Y', 'N', 'N', 'N'&#13;
FROM source_data s&#13;
ON CONFLICT (INSTR_ISSR_ID)&#13;
DO UPDATE SET&#13;
  ASSET_RUP = EXCLUDED.ASSET_RUP&#13;
WHERE FT_T_IOI_MHSS.ASSET_RUP IS DISTINCT FROM 'Y';</objectValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="749" type="java.util.HashSet">
<item id="750" type="com.j2fe.workflow.definition.Transition">
<name id="751">goto-next</name>
<source id="752">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="753"/>
<directJoin>false</directJoin>
<name id="754">log add asset rup issuers</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="755">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="756" type="java.util.HashSet">
<item id="757" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="758">database</name>
<stringValue id="759">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="760" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="761">querySQL</name>
<stringValue id="762">call&#13;
 mhi_sp_eventlog (&#13;
	 'RebuildMhssIOI Workflow',&#13;
	 'add asset RUP Issuers',&#13;
	'N/A'); &#13;
</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="763" type="java.util.HashSet">
<item id="764" type="com.j2fe.workflow.definition.Transition">
<name id="765">rows-found</name>
<source id="766">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="767"/>
<directJoin>false</directJoin>
<name id="768">Add ASSET_RUP Issuers?</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="769">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="770" type="java.util.HashSet">
<item id="771" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="772">database</name>
<stringValue id="773">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="774" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="775">firstColumnsResult</name>
<stringValue id="776">newNonRUPIssuers</stringValue>
<type>VARIABLE</type>
</item>
<item id="777" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="778">querySQL</name>
<stringValue id="779">select 1 from FT_T_IOI_MHSS where INSTR_ISSR_ID = 'CONTROL' and ASSET_RUP ='Y'</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="780" type="java.util.HashSet">
<item id="781" type="com.j2fe.workflow.definition.Transition">
<name id="782">ToSplit</name>
<source id="783">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="784">Automatically generated</description>
<directJoin>false</directJoin>
<name id="785">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="786">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="787" type="java.util.HashSet">
<item id="788" type="com.j2fe.workflow.definition.Transition">
<name id="789">goto-next</name>
<source id="790">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="791"/>
<directJoin>false</directJoin>
<name id="792">MHSSCUSTREF CUST Issuers</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="793">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="794" type="java.util.HashSet">
<item id="795" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="796">database</name>
<stringValue id="797">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="798" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="799">querySQL</name>
<stringValue id="800">WITH source_data AS (&#13;
  SELECT DISTINCT issr.INSTR_ISSR_ID&#13;
  FROM FT_T_ISSR issr&#13;
  WHERE issr.END_TMS IS NULL&#13;
    AND issr.FINS_INST_MNEM IN (&#13;
      SELECT fiid.INST_MNEM&#13;
      FROM ft_t_fiid fiid&#13;
      WHERE fiid.FINS_ID_CTXT_TYP = 'SMREF'&#13;
        AND fiid.END_TMS IS NULL&#13;
        AND (&#13;
          fiid.INST_SYMBOL_STAT_TYP = 'ACTIVE' OR&#13;
          (&#13;
            fiid.INST_SYMBOL_STAT_TYP = 'INACTIVE' AND&#13;
            fiid.INST_SYMBOL_STAT_TMS &gt;= CURRENT_DATE - INTERVAL '35 days'&#13;
          )&#13;
        )&#13;
    )&#13;
)&#13;
INSERT INTO FT_T_IOI_MHSS (&#13;
  INSTR_ISSR_ID, UPDATING, UPDATED, ASSET_SOI,&#13;
  GTOR, CUST, ASSET_RUP, GTOR_RUP, CUST_RUP,&#13;
  NEW_IOI_MEMBER, CUST_IP, LAGR_FLAR, LAGR_FLAR_RUP&#13;
)&#13;
SELECT &#13;
  s.INSTR_ISSR_ID, 'N', 'N', 'N',&#13;
  'N', 'Y', 'N', 'N', 'N',&#13;
  'Y', 'N', 'N', 'N'&#13;
FROM source_data s&#13;
ON CONFLICT (INSTR_ISSR_ID)&#13;
DO UPDATE SET&#13;
  CUST = EXCLUDED.CUST&#13;
WHERE FT_T_IOI_MHSS.CUST IS DISTINCT FROM 'Y';</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="801" type="java.util.HashSet">
<item id="802" type="com.j2fe.workflow.definition.Transition">
<name id="803">goto-next</name>
<source id="804">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="805"/>
<directJoin>false</directJoin>
<name id="806">log add cust issuers</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="807">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="808" type="java.util.HashSet">
<item id="809" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="810">database</name>
<stringValue id="811">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="812" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="813">querySQL</name>
<stringValue id="814">call&#13;
 mhi_sp_eventlog (&#13;
	 'RebuildMhssIOI Workflow',&#13;
	 'add CUST Issuers',&#13;
	'N/A'); &#13;
</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="815" type="java.util.HashSet">
<item id="816" type="com.j2fe.workflow.definition.Transition">
<name id="817">rows-found</name>
<source id="818">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="819"/>
<directJoin>false</directJoin>
<name id="820">Add MHSS CUST Issuers?</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="821">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="822" type="java.util.HashSet">
<item id="823" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="824">database</name>
<stringValue id="825">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="826" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="827">firstColumnsResult</name>
<stringValue id="828">newNonRUPIssuers</stringValue>
<type>VARIABLE</type>
</item>
<item id="829" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="830">querySQL</name>
<stringValue id="831">select 1 from FT_T_IOI_MHSS where INSTR_ISSR_ID = 'CONTROL' and CUST ='Y'</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="832" type="java.util.HashSet">
<item id="833" type="com.j2fe.workflow.definition.Transition">
<name id="834">ToSplit</name>
<source id="835">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="836">Automatically generated</description>
<directJoin>false</directJoin>
<name id="837">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="838">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="839" type="java.util.HashSet">
<item id="840" type="com.j2fe.workflow.definition.Transition">
<name id="841">goto-next</name>
<source id="842">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="843"/>
<directJoin>false</directJoin>
<name id="844">GTOR Issuers</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="845">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="846" type="java.util.HashSet">
<item id="847" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="848">database</name>
<stringValue id="849">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="850" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="851">querySQL</name>
<objectValue id="852" type="java.lang.String">WITH source_data AS (&#13;
  SELECT DISTINCT issr.INSTR_ISSR_ID&#13;
  FROM FT_T_ISSR issr&#13;
  WHERE issr.END_TMS IS NULL&#13;
    AND issr.FINS_INST_MNEM IN (&#13;
      SELECT frip.INST_MNEM&#13;
      FROM FT_T_FRIP frip&#13;
      WHERE frip.FINSRL_TYP = 'GUARNTOR'&#13;
        AND frip.END_TMS IS NULL&#13;
        AND frip.INSTR_ID IN (&#13;
          SELECT issu.INSTR_ID&#13;
          FROM FT_T_ISSU issu&#13;
          WHERE issu.END_TMS IS NULL&#13;
            AND issu.INSTR_ID IN (&#13;
              SELECT gp.INSTR_ID&#13;
              FROM FT_T_ISGP gp&#13;
              WHERE gp.END_TMS IS NULL&#13;
                AND gp.PRNT_ISS_GRP_OID IN (&#13;
                  SELECT isgr.ISS_GRP_OID&#13;
                  FROM FT_T_ISGR isgr&#13;
                  WHERE isgr.ORG_ID = 'MHSS'&#13;
                )&#13;
            )&#13;
        )&#13;
    )&#13;
)&#13;
INSERT INTO FT_T_IOI_MHSS (&#13;
  INSTR_ISSR_ID, UPDATING, UPDATED, ASSET_SOI,&#13;
  GTOR, CUST, ASSET_RUP, GTOR_RUP, CUST_RUP,&#13;
  NEW_IOI_MEMBER, CUST_IP, LAGR_FLAR, LAGR_FLAR_RUP&#13;
)&#13;
SELECT &#13;
  s.INSTR_ISSR_ID, 'N', 'N', 'N',&#13;
  'Y', 'N', 'N', 'N', 'N',&#13;
  'Y', 'N', 'N', 'N'&#13;
FROM source_data s&#13;
ON CONFLICT (INSTR_ISSR_ID)&#13;
DO UPDATE SET&#13;
  GTOR = EXCLUDED.GTOR&#13;
WHERE FT_T_IOI_MHSS.GTOR IS DISTINCT FROM 'Y';</objectValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="853" type="java.util.HashSet">
<item id="854" type="com.j2fe.workflow.definition.Transition">
<name id="855">goto-next</name>
<source id="856">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="857"/>
<directJoin>false</directJoin>
<name id="858">log add gtor issuers</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="859">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="860" type="java.util.HashSet">
<item id="861" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="862">database</name>
<stringValue id="863">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="864" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="865">querySQL</name>
<stringValue id="866">call&#13;
 mhi_sp_eventlog (&#13;
	 'RebuildMhssIOI Workflow',&#13;
	 'add GTOR Issuers',&#13;
	'N/A'); &#13;
</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="867" type="java.util.HashSet">
<item id="868" type="com.j2fe.workflow.definition.Transition">
<name id="869">rows-found</name>
<source id="870">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="871"/>
<directJoin>false</directJoin>
<name id="872">Add GTOR Issuers?</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="873">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="874" type="java.util.HashSet">
<item id="875" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="876">database</name>
<stringValue id="877">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="878" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="879">firstColumnsResult</name>
<stringValue id="880">newNonRUPIssuers</stringValue>
<type>VARIABLE</type>
</item>
<item id="881" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="882">querySQL</name>
<stringValue id="883">select 1 from FT_T_IOI_MHSS where INSTR_ISSR_ID = 'CONTROL' and GTOR ='Y'</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="884" type="java.util.HashSet">
<item id="885" type="com.j2fe.workflow.definition.Transition">
<name id="886">ToSplit</name>
<source id="887">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="888">Automatically generated</description>
<directJoin>false</directJoin>
<name id="889">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="890">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="891" type="java.util.HashSet">
<item id="892" type="com.j2fe.workflow.definition.Transition">
<name id="893">goto-next</name>
<source id="894">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="895"/>
<directJoin>false</directJoin>
<name id="896">SOI Issuers</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="897">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="898" type="java.util.HashSet">
<item id="899" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="900">database</name>
<stringValue id="901">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="902" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="903">querySQL</name>
<stringValue id="904">WITH source_data AS (&#13;
  SELECT DISTINCT issu.INSTR_ISSR_ID&#13;
  FROM FT_T_ISSU issu&#13;
  WHERE issu.INSTR_ID IN (&#13;
    SELECT gp.INSTR_ID&#13;
    FROM FT_T_ISGP gp&#13;
    WHERE gp.END_TMS IS NULL&#13;
      AND gp.PRNT_ISS_GRP_OID IN (&#13;
        SELECT isgr.ISS_GRP_OID&#13;
        FROM FT_T_ISGR isgr&#13;
        WHERE isgr.ORG_ID = 'MHSS'&#13;
      )&#13;
  )&#13;
)&#13;
INSERT INTO FT_T_IOI_MHSS (&#13;
  INSTR_ISSR_ID, UPDATING, UPDATED, ASSET_SOI,&#13;
  GTOR, CUST, ASSET_RUP, GTOR_RUP, CUST_RUP,&#13;
  NEW_IOI_MEMBER, CUST_IP, LAGR_FLAR, LAGR_FLAR_RUP&#13;
)&#13;
SELECT &#13;
  s.INSTR_ISSR_ID, 'N', 'N', 'Y',&#13;
  'N', 'N', 'N', 'N', 'N',&#13;
  'Y', 'N', 'N', 'N'&#13;
FROM source_data s&#13;
ON CONFLICT (INSTR_ISSR_ID)&#13;
DO UPDATE SET&#13;
  ASSET_SOI = EXCLUDED.ASSET_SOI&#13;
WHERE FT_T_IOI_MHSS.ASSET_SOI IS DISTINCT FROM 'Y';</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="905" type="java.util.HashSet">
<item id="906" type="com.j2fe.workflow.definition.Transition">
<name id="907">goto-next</name>
<source id="908">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="909"/>
<directJoin>false</directJoin>
<name id="910">log add soi issuers</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="911">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="912" type="java.util.HashSet">
<item id="913" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="914">database</name>
<stringValue id="915">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="916" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="917">querySQL</name>
<stringValue id="918">call&#13;
 mhi_sp_eventlog (&#13;
	 'RebuildMhssIOI Workflow',&#13;
	 'add SOI Issuers',&#13;
	'N/A'); &#13;
</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="919" type="java.util.HashSet">
<item id="920" type="com.j2fe.workflow.definition.Transition">
<name id="921">rows-found</name>
<source id="922">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="923"/>
<directJoin>false</directJoin>
<name id="924">Add SOI Issuers?</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="925">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="926" type="java.util.HashSet">
<item id="927" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="928">database</name>
<stringValue id="929">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="930" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="931">firstColumnsResult</name>
<stringValue id="932">newNonRUPIssuers</stringValue>
<type>VARIABLE</type>
</item>
<item id="933" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="934">querySQL</name>
<stringValue id="935">select 1 from FT_T_IOI_MHSS where INSTR_ISSR_ID = 'CONTROL' and ASSET_SOI ='Y'</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="936" type="java.util.HashSet">
<item id="937" type="com.j2fe.workflow.definition.Transition">
<name id="938">goto-next</name>
<source id="939">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="940"/>
<directJoin>false</directJoin>
<name id="941">Pop IOI_MHSS with existing issuers</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="942">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="943" type="java.util.HashSet">
<item id="944" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="945">database</name>
<stringValue id="946">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="947" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="948">querySQL</name>
<stringValue id="949">INSERT INTO FT_T_IOI_MHSS (INSTR_ISSR_ID,UPDATING, UPDATED, ASSET_SOI, GTOR, CUST, ASSET_RUP, GTOR_RUP, CUST_RUP, CUST_IP, LAGR_FLAR, LAGR_FLAR_RUP, NEW_IOI_MEMBER, DELETE_FROM_IOI)&#13;
SELECT DISTINCT INSTR_ISSR_ID, 'N' UPDATING, 'N' UPDATED, 'N' ASSET_SOI, 'N' GTOR, 'N' CUST, 'N' ASSET_RUP, 'N' GTOR_RUP, 'N' CUST_RUP, 'N' CUST_IP, 'N' LAGR_FLAR, 'N' LAGR_FLAR_RUP, 'N' NEW_IOI_MEMBER, 'N' DELETE_FROM_IOI  &#13;
FROM FT_T_IRGP WHERE END_TMS IS NULL and PRNT_ISSR_GRP_OID = 'IRGR000016'</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="950" type="java.util.HashSet">
<item id="951" type="com.j2fe.workflow.definition.Transition">
<name id="952">goto-next</name>
<source id="953">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="954"/>
<directJoin>false</directJoin>
<name id="955">Empty IOI_MHSS Table</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="956">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="957" type="java.util.HashSet">
<item id="958" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="959">database</name>
<stringValue id="960">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="961" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="962">querySQL</name>
<stringValue id="963">DELETE FROM FT_T_IOI_MHSS where INSTR_ISSR_ID != 'CONTROL'</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="964" type="java.util.HashSet">
<item id="965" type="com.j2fe.workflow.definition.Transition">
<name id="966">goto-next</name>
<source id="967">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="968"/>
<directJoin>false</directJoin>
<name id="969">log job start</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="970">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="971" type="java.util.HashSet">
<item id="972" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="973">database</name>
<stringValue id="974">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="975" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="976">querySQL</name>
<stringValue id="977">call&#13;
 mhi_sp_eventlog (&#13;
	 'RebuildMhssIOI Workflow',&#13;
	 'workflow starting',&#13;
	'N/A'); &#13;
</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="978" type="java.util.HashSet">
<item id="979" type="com.j2fe.workflow.definition.Transition">
<name id="980">goto-next</name>
<source id="981">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="982"/>
<directJoin>false</directJoin>
<name id="983">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="984">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="985" type="java.util.HashSet"/>
<targets id="986" type="java.util.HashSet">
<item idref="979" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="967"/>
</item>
</sources>
<targets id="987" type="java.util.HashSet">
<item idref="965" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="953"/>
</item>
</sources>
<targets id="988" type="java.util.HashSet">
<item idref="951" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="939"/>
</item>
</sources>
<targets id="989" type="java.util.HashSet">
<item idref="937" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="922"/>
</item>
</sources>
<targets id="990" type="java.util.HashSet">
<item id="991" type="com.j2fe.workflow.definition.Transition">
<name id="992">nothing-found</name>
<source idref="922"/>
<target id="993">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="994"/>
<directJoin>false</directJoin>
<name id="995">log skip soi issuers</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="996">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="997" type="java.util.HashSet">
<item id="998" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="999">database</name>
<stringValue id="1000">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="1001" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1002">querySQL</name>
<stringValue id="1003">call&#13;
 mhi_sp_eventlog (&#13;
	 'RebuildMhssIOI Workflow',&#13;
	 'skip SOI Issuers',&#13;
	'N/A'); &#13;
</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1004" type="java.util.HashSet">
<item idref="991" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1005" type="java.util.HashSet">
<item id="1006" type="com.j2fe.workflow.definition.Transition">
<name id="1007">goto-next</name>
<source idref="993"/>
<target idref="887"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item idref="920" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="908"/>
</item>
</sources>
<targets id="1008" type="java.util.HashSet">
<item idref="906" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="894"/>
</item>
</sources>
<targets id="1009" type="java.util.HashSet">
<item idref="892" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="887"/>
</item>
<item idref="1006" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1010" type="java.util.HashSet">
<item idref="885" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="870"/>
</item>
</sources>
<targets id="1011" type="java.util.HashSet">
<item id="1012" type="com.j2fe.workflow.definition.Transition">
<name id="1013">nothing-found</name>
<source idref="870"/>
<target id="1014">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="1015"/>
<directJoin>false</directJoin>
<name id="1016">log skip gtor issuers</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="1017">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="1018" type="java.util.HashSet">
<item id="1019" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1020">database</name>
<stringValue id="1021">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="1022" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1023">querySQL</name>
<stringValue id="1024">call&#13;
 mhi_sp_eventlog (&#13;
	 'RebuildMhssIOI Workflow',&#13;
	 'skip GTOR Issuers',&#13;
	'N/A'); &#13;
</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1025" type="java.util.HashSet">
<item idref="1012" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1026" type="java.util.HashSet">
<item id="1027" type="com.j2fe.workflow.definition.Transition">
<name id="1028">goto-next</name>
<source idref="1014"/>
<target idref="835"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item idref="868" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="856"/>
</item>
</sources>
<targets id="1029" type="java.util.HashSet">
<item idref="854" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="842"/>
</item>
</sources>
<targets id="1030" type="java.util.HashSet">
<item idref="840" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="835"/>
</item>
<item idref="1027" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1031" type="java.util.HashSet">
<item idref="833" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="818"/>
</item>
</sources>
<targets id="1032" type="java.util.HashSet">
<item id="1033" type="com.j2fe.workflow.definition.Transition">
<name id="1034">nothing-found</name>
<source idref="818"/>
<target id="1035">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="1036"/>
<directJoin>false</directJoin>
<name id="1037">log skip cust issuers</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="1038">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="1039" type="java.util.HashSet">
<item id="1040" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1041">database</name>
<stringValue id="1042">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="1043" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1044">querySQL</name>
<stringValue id="1045">call&#13;
 mhi_sp_eventlog (&#13;
	 'RebuildMhssIOI Workflow',&#13;
	 'skip CUST Issuers',&#13;
	'N/A'); &#13;
</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1046" type="java.util.HashSet">
<item idref="1033" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1047" type="java.util.HashSet">
<item id="1048" type="com.j2fe.workflow.definition.Transition">
<name id="1049">goto-next</name>
<source idref="1035"/>
<target idref="783"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item idref="816" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="804"/>
</item>
</sources>
<targets id="1050" type="java.util.HashSet">
<item idref="802" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="790"/>
</item>
</sources>
<targets id="1051" type="java.util.HashSet">
<item idref="788" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="783"/>
</item>
<item idref="1048" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1052" type="java.util.HashSet">
<item idref="781" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="766"/>
</item>
</sources>
<targets id="1053" type="java.util.HashSet">
<item id="1054" type="com.j2fe.workflow.definition.Transition">
<name id="1055">nothing-found</name>
<source idref="766"/>
<target id="1056">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="1057"/>
<directJoin>false</directJoin>
<name id="1058">log skip asset rup issuers</name>
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
<name id="1065">querySQL</name>
<stringValue id="1066">call&#13;
 mhi_sp_eventlog (&#13;
	 'RebuildMhssIOI Workflow',&#13;
	 'skip asset RUP Issuers',&#13;
	'N/A'); </stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1067" type="java.util.HashSet">
<item idref="1054" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1068" type="java.util.HashSet">
<item id="1069" type="com.j2fe.workflow.definition.Transition">
<name id="1070">goto-next</name>
<source idref="1056"/>
<target idref="731"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item idref="764" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="752"/>
</item>
</sources>
<targets id="1071" type="java.util.HashSet">
<item idref="750" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="738"/>
</item>
</sources>
<targets id="1072" type="java.util.HashSet">
<item idref="736" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="731"/>
</item>
<item idref="1069" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1073" type="java.util.HashSet">
<item idref="729" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="714"/>
</item>
</sources>
<targets id="1074" type="java.util.HashSet">
<item id="1075" type="com.j2fe.workflow.definition.Transition">
<name id="1076">nothing-found</name>
<source idref="714"/>
<target id="1077">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="1078"/>
<directJoin>false</directJoin>
<name id="1079">log skip gtor rup issuers</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="1080">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="1081" type="java.util.HashSet">
<item id="1082" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1083">database</name>
<stringValue id="1084">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="1085" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1086">querySQL</name>
<stringValue id="1087">call&#13;
 mhi_sp_eventlog (&#13;
	 'RebuildMhssIOI Workflow',&#13;
	 'skip GTOR RUP Issuers',&#13;
	'N/A'); </stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1088" type="java.util.HashSet">
<item idref="1075" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1089" type="java.util.HashSet">
<item id="1090" type="com.j2fe.workflow.definition.Transition">
<name id="1091">goto-next</name>
<source idref="1077"/>
<target idref="679"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item idref="712" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="700"/>
</item>
</sources>
<targets id="1092" type="java.util.HashSet">
<item idref="698" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="686"/>
</item>
</sources>
<targets id="1093" type="java.util.HashSet">
<item idref="684" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="679"/>
</item>
<item idref="1090" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1094" type="java.util.HashSet">
<item idref="677" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="662"/>
</item>
</sources>
<targets id="1095" type="java.util.HashSet">
<item id="1096" type="com.j2fe.workflow.definition.Transition">
<name id="1097">nothing-found</name>
<source idref="662"/>
<target id="1098">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="1099"/>
<directJoin>false</directJoin>
<name id="1100">log skip cust rup issuers</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="1101">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="1102" type="java.util.HashSet">
<item id="1103" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1104">database</name>
<stringValue id="1105">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="1106" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1107">querySQL</name>
<stringValue id="1108">call&#13;
 mhi_sp_eventlog (&#13;
	 'RebuildMhssIOI Workflow',&#13;
	 'skip CUST RUP Issuers',&#13;
	'N/A');</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1109" type="java.util.HashSet">
<item idref="1096" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1110" type="java.util.HashSet">
<item id="1111" type="com.j2fe.workflow.definition.Transition">
<name id="1112">goto-next</name>
<source idref="1098"/>
<target idref="627"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item idref="660" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="648"/>
</item>
</sources>
<targets id="1113" type="java.util.HashSet">
<item idref="646" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="634"/>
</item>
</sources>
<targets id="1114" type="java.util.HashSet">
<item idref="632" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="627"/>
</item>
<item idref="1111" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1115" type="java.util.HashSet">
<item idref="625" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="610"/>
</item>
</sources>
<targets id="1116" type="java.util.HashSet">
<item id="1117" type="com.j2fe.workflow.definition.Transition">
<name id="1118">nothing-found</name>
<source idref="610"/>
<target id="1119">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="1120"/>
<directJoin>false</directJoin>
<name id="1121">log skip cust ip issuers</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="1122">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="1123" type="java.util.HashSet">
<item id="1124" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1125">database</name>
<stringValue id="1126">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="1127" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1128">querySQL</name>
<stringValue id="1129">call&#13;
 mhi_sp_eventlog (&#13;
	 'RebuildMhssIOI Workflow',&#13;
	 'skip CUST IP Issuers',&#13;
	'N/A'); </stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1130" type="java.util.HashSet">
<item idref="1117" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1131" type="java.util.HashSet">
<item id="1132" type="com.j2fe.workflow.definition.Transition">
<name id="1133">goto-next</name>
<source idref="1119"/>
<target idref="575"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item idref="608" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="596"/>
</item>
</sources>
<targets id="1134" type="java.util.HashSet">
<item idref="594" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="582"/>
</item>
</sources>
<targets id="1135" type="java.util.HashSet">
<item idref="580" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="575"/>
</item>
<item idref="1132" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1136" type="java.util.HashSet">
<item idref="573" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="558"/>
</item>
</sources>
<targets id="1137" type="java.util.HashSet">
<item id="1138" type="com.j2fe.workflow.definition.Transition">
<name id="1139">nothing-found</name>
<source idref="558"/>
<target id="1140">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="1141"/>
<directJoin>false</directJoin>
<name id="1142">log skip lagr flar issuers</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="1143">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="1144" type="java.util.HashSet">
<item id="1145" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1146">database</name>
<stringValue id="1147">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="1148" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1149">querySQL</name>
<stringValue id="1150">call&#13;
 mhi_sp_eventlog (&#13;
	 'RebuildMhssIOI Workflow',&#13;
	 'skip LAGR FLAR Issuers',&#13;
	'N/A'); </stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1151" type="java.util.HashSet">
<item idref="1138" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1152" type="java.util.HashSet">
<item id="1153" type="com.j2fe.workflow.definition.Transition">
<name id="1154">goto-next</name>
<source idref="1140"/>
<target idref="523"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item idref="556" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="544"/>
</item>
</sources>
<targets id="1155" type="java.util.HashSet">
<item idref="542" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="530"/>
</item>
</sources>
<targets id="1156" type="java.util.HashSet">
<item idref="528" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="523"/>
</item>
<item idref="1153" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1157" type="java.util.HashSet">
<item idref="521" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="506"/>
</item>
</sources>
<targets id="1158" type="java.util.HashSet">
<item id="1159" type="com.j2fe.workflow.definition.Transition">
<name id="1160">nothing-found</name>
<source idref="506"/>
<target id="1161">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="1162"/>
<directJoin>false</directJoin>
<name id="1163">log skip lagr flar rup issuers</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="1164">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="1165" type="java.util.HashSet">
<item id="1166" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1167">database</name>
<stringValue id="1168">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="1169" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1170">querySQL</name>
<stringValue id="1171">call&#13;
 mhi_sp_eventlog (&#13;
	 'RebuildMhssIOI Workflow',&#13;
	 'skip LAGR FLAR RUP Issuers',&#13;
	'N/A'); </stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1172" type="java.util.HashSet">
<item idref="1159" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1173" type="java.util.HashSet">
<item id="1174" type="com.j2fe.workflow.definition.Transition">
<name id="1175">goto-next</name>
<source idref="1161"/>
<target idref="461"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item idref="504" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="492"/>
</item>
</sources>
<targets id="1176" type="java.util.HashSet">
<item idref="490" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="478"/>
</item>
</sources>
<targets id="1177" type="java.util.HashSet">
<item idref="476" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="461"/>
</item>
<item idref="1174" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1178" type="java.util.HashSet">
<item idref="459" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="444"/>
</item>
</sources>
<targets id="1179" type="java.util.HashSet">
<item id="1180" type="com.j2fe.workflow.definition.Transition">
<name id="1181">nothing-found</name>
<source idref="444"/>
<target idref="358"/>
</item>
<item idref="442" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="430"/>
</item>
</sources>
<targets id="1182" type="java.util.HashSet">
<item idref="428" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="413"/>
</item>
</sources>
<targets id="1183" type="java.util.HashSet">
<item idref="411" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDSPLIT</type>
</source>
<target idref="399"/>
</item>
</sources>
<targets id="1184" type="java.util.HashSet">
<item idref="397" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="392"/>
</item>
<item id="1185" type="com.j2fe.workflow.definition.Transition">
<name id="1186">goto-next</name>
<source id="1187">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="1188"/>
<directJoin>false</directJoin>
<name id="1189">UPDATE IOI_MHSS</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="1190">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="1191" type="java.util.HashSet">
<item id="1192" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1193">database</name>
<stringValue id="1194">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="1195" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1196">indexedParameters[0]</name>
<stringValue id="1197">newIssuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="1198" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1199">querySQL</name>
<stringValue id="1200">UPDATE FT_T_IOI_MHSS SET UPDATING='N', UPDATED='Y' WHERE INSTR_ISSR_ID = ?</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1201" type="java.util.HashSet">
<item id="1202" type="com.j2fe.workflow.definition.Transition">
<name id="1203">goto-next</name>
<source id="1204">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="1205"/>
<directJoin>false</directJoin>
<name id="1206">log updated issuer</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="1207">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="1208" type="java.util.HashSet">
<item id="1209" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1210">database</name>
<stringValue id="1211">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="1212" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1213">indexedParameters[0]</name>
<stringValue id="1214">newIssuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="1215" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1216">querySQL</name>
<stringValue id="1217">call&#13;
 mhi_sp_eventlog (&#13;
	 'RebuildIOI Workflow',&#13;
	 'flagged isuer as updated',&#13;
	?); </stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1218" type="java.util.HashSet">
<item id="1219" type="com.j2fe.workflow.definition.Transition">
<name id="1220">goto-next</name>
<source id="1221">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="1222"/>
<directJoin>false</directJoin>
<name id="1223">IOI REAL message</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="1224">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="1225" type="java.util.HashSet">
<item id="1226" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="1227">["BulkSize"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="1228">input["BulkSize"]</name>
<stringValue id="1229">BulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="1230" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="1231">["PublishFlag"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="1232">input["PublishFlag"]</name>
<objectValue id="1233" type="java.lang.String">Y</objectValue>
<type>CONSTANT</type>
</item>
<item id="1234" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="1235">["sqlSelect"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="1236">input["sqlSelect"]</name>
<stringValue id="1237">ioiAddMSg</stringValue>
<type>VARIABLE</type>
</item>
<item id="1238" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1239">name</name>
<stringValue id="1240">RealMessageProcessing</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1241" type="java.util.HashSet">
<item id="1242" type="com.j2fe.workflow.definition.Transition">
<name id="1243">goto-next</name>
<source id="1244">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="1245"/>
<directJoin>false</directJoin>
<name id="1246">IOI REAL Query</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="1247">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="1248" type="java.util.HashSet">
<item id="1249" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1250">statements</name>
<objectValue id="1251" type="java.lang.String">query = "SELECT distinct '&lt;!DOCTYPE STREET_REF SYSTEM \"fti://repository/dtd/STREET_REF\"&gt;' || ";&#13;
query = query + "XMLElement(NAME \"STREET_REF\",XMLAttributes( 'GUEST' AS \"USERID\"), ";&#13;
query = query + "XMLElement(NAME \"HEADER\", ";&#13;
query = query + "XMLElement(NAME \"MAIN_ENTITY_ID\", XMLAttributes( RTRIM((select pref_issr_id from ft_t_issr where INSTR_ISSR_ID = '" + newIssuer + "')) AS \"VALUE\")), ";&#13;
query = query + "XMLElement(NAME \"MAIN_ENTITY_ID_CTXT_TYP\",XMLAttributes( RTRIM((select pref_id_ctxt_typ from ft_t_issr where INSTR_ISSR_ID = '" + newIssuer +"')) AS \"VALUE\")), ";&#13;
query = query + "XMLElement(NAME \"MAIN_ENTITY_TBL_TYP\",XMLAttributes('ISSR' AS \"VALUE\"))), ";&#13;
query = query + "XMLElement(NAME \"SEGMENT\", XMLAttributes( 'Issuer' AS \"TYPE\", 'REFERENCE' AS \"ACTION\"), ";&#13;
query = query + "XMLElement(NAME \"Issuer\", XMLElement(NAME \"INSTRISSRID\", ";&#13;
query = query + "XMLAttributes( RTRIM('" + newIssuer + "') AS \"VALUE\")), ";&#13;
query = query + "XMLElement(NAME \"LASTCHGUSRID\",XMLAttributes('rebuildMhssIOI' AS \"VALUE\")))), ";&#13;
query = query + "XMLElement(NAME \"SEGMENT\", XMLAttributes( 'ISSRIssuerGroupParticipant' AS \"TYPE\", 'UNKNOWN' AS \"ACTION\"), XMLElement(NAME \"ISSRIssuerGroupParticipant\",  ";&#13;
query = query + "XMLElement(NAME \"PRNTISSRGRPOID\", XMLAttributes( 'IRGR000016' AS \"VALUE\")), XMLElement(NAME \"PRTPURPTYP\", XMLAttributes( 'INTEREST' AS \"VALUE\")) ";&#13;
query = query + ")))";&#13;
query = query + "FROM DUAL";&#13;
</objectValue>
<type>CONSTANT</type>
</item>
<item id="1252" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="1253">["newIssuer"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="1254">variables["newIssuer"]</name>
<stringValue id="1255">newIssuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="1256" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="1257">["query"]@java/lang/Integer@</UITypeHint>
<input>false</input>
<name id="1258">variables["query"]</name>
<stringValue id="1259">ioiAddMSg</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="1260" type="java.util.HashSet">
<item id="1261" type="com.j2fe.workflow.definition.Transition">
<name id="1262">goto-next</name>
<source id="1263">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="1264"/>
<directJoin>false</directJoin>
<name id="1265">log add issuer</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="1266">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="1267" type="java.util.HashSet">
<item id="1268" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1269">database</name>
<stringValue id="1270">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="1271" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1272">indexedParameters[0]</name>
<stringValue id="1273">newIssuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="1274" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1275">querySQL</name>
<stringValue id="1276">call&#13;
 mhi_sp_eventlog (&#13;
	 'RebuildMhssIOI Workflow',&#13;
	 'RUP add to MHSS IOI',&#13;
	?); </stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1277" type="java.util.HashSet">
<item id="1278" type="com.j2fe.workflow.definition.Transition">
<name id="1279">goto-next</name>
<source id="1280">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="1281"/>
<directJoin>false</directJoin>
<name id="1282">Identify Issuer to add to IOI</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="1283">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="1284" type="java.util.HashSet">
<item id="1285" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1286">database</name>
<stringValue id="1287">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="1288" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1289">indexedParameters[0]</name>
<stringValue id="1290">newIssuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="1291" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1292">querySQL</name>
<stringValue id="1293">UPDATE FT_T_IOI_MHSS SET UPDATING='Y' WHERE INSTR_ISSR_ID = CAST(? AS VARCHAR)</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1294" type="java.util.HashSet">
<item id="1295" type="com.j2fe.workflow.definition.Transition">
<name id="1296">loop</name>
<source idref="372"/>
<target idref="1280"/>
</item>
</sources>
<targets id="1297" type="java.util.HashSet">
<item idref="1278" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="1263"/>
</item>
</sources>
<targets id="1298" type="java.util.HashSet">
<item idref="1261" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="1244"/>
</item>
</sources>
<targets id="1299" type="java.util.HashSet">
<item idref="1242" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="1221"/>
</item>
</sources>
<targets id="1300" type="java.util.HashSet">
<item idref="1219" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="1204"/>
</item>
</sources>
<targets id="1301" type="java.util.HashSet">
<item idref="1202" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="1187"/>
</item>
</sources>
<targets id="1302" type="java.util.HashSet">
<item idref="1185" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="392"/>
</item>
</sources>
<targets id="1303" type="java.util.HashSet">
<item idref="390" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="372"/>
</item>
</sources>
<targets id="1304" type="java.util.HashSet">
<item idref="370" type="com.j2fe.workflow.definition.Transition"/>
<item idref="1295" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="365"/>
</item>
</sources>
<targets id="1305" type="java.util.HashSet">
<item idref="363" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDJOIN</type>
</source>
<target idref="358"/>
</item>
<item idref="1180" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1306" type="java.util.HashSet">
<item idref="356" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="341"/>
</item>
</sources>
<targets id="1307" type="java.util.HashSet">
<item id="1308" type="com.j2fe.workflow.definition.Transition">
<name id="1309">nothing-found</name>
<source idref="341"/>
<target idref="255"/>
</item>
<item idref="339" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="327"/>
</item>
</sources>
<targets id="1310" type="java.util.HashSet">
<item idref="325" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="310"/>
</item>
</sources>
<targets id="1311" type="java.util.HashSet">
<item idref="308" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDSPLIT</type>
</source>
<target idref="296"/>
</item>
</sources>
<targets id="1312" type="java.util.HashSet">
<item idref="294" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="289"/>
</item>
<item id="1313" type="com.j2fe.workflow.definition.Transition">
<name id="1314">goto-next</name>
<source id="1315">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="1316"/>
<directJoin>false</directJoin>
<name id="1317">UPDATE IOI_MHSS</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="1318">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="1319" type="java.util.HashSet">
<item id="1320" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1321">database</name>
<stringValue id="1322">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="1323" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1324">indexedParameters[0]</name>
<stringValue id="1325">nonRUPIssuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="1326" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1327">querySQL</name>
<stringValue id="1328">UPDATE FT_T_IOI_MHSS SET UPDATING='N', UPDATED='Y' WHERE INSTR_ISSR_ID = CAST(? AS VARCHAR)</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1329" type="java.util.HashSet">
<item id="1330" type="com.j2fe.workflow.definition.Transition">
<name id="1331">goto-next</name>
<source id="1332">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="1333"/>
<directJoin>false</directJoin>
<name id="1334">IOI REAL message</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="1335">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="1336" type="java.util.HashSet">
<item id="1337" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="1338">["BulkSize"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="1339">input["BulkSize"]</name>
<stringValue id="1340">BulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="1341" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="1342">["PublishFlag"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="1343">input["PublishFlag"]</name>
<objectValue id="1344" type="java.lang.String">Y</objectValue>
<type>CONSTANT</type>
</item>
<item id="1345" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="1346">["sqlSelect"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="1347">input["sqlSelect"]</name>
<stringValue id="1348">ioiAddMSg</stringValue>
<type>VARIABLE</type>
</item>
<item id="1349" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1350">name</name>
<stringValue id="1351">RealMessageProcessing</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1352" type="java.util.HashSet">
<item id="1353" type="com.j2fe.workflow.definition.Transition">
<name id="1354">goto-next</name>
<source id="1355">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="1356"/>
<directJoin>false</directJoin>
<name id="1357">IOI REAL Query</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="1358">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="1359" type="java.util.HashSet">
<item id="1360" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1361">statements</name>
<objectValue id="1362" type="java.lang.String">query = "SELECT distinct '&lt;!DOCTYPE STREET_REF SYSTEM \"fti://repository/dtd/STREET_REF\"&gt;' || ";
query = query + "XMLElement(NAME \"STREET_REF\",XMLAttributes( 'GUEST' AS \"USERID\"), ";
query = query + "XMLElement(NAME \"HEADER\", ";
query = query + "XMLElement(NAME \"MAIN_ENTITY_ID\", XMLAttributes( RTRIM((select pref_issr_id from ft_t_issr where INSTR_ISSR_ID = '" + newIssuer + "')) AS \"VALUE\")), ";
query = query + "XMLElement(NAME \"MAIN_ENTITY_ID_CTXT_TYP\",XMLAttributes( RTRIM((select pref_id_ctxt_typ from ft_t_issr where INSTR_ISSR_ID = '" + newIssuer +"')) AS \"VALUE\")), ";
query = query + "XMLElement(NAME \"MAIN_ENTITY_TBL_TYP\",XMLAttributes('ISSR' AS \"VALUE\"))), ";
query = query + "XMLElement(NAME \"SEGMENT\", XMLAttributes( 'Issuer' AS \"TYPE\", 'REFERENCE' AS \"ACTION\"), ";
query = query + "XMLElement(NAME \"Issuer\", XMLElement(NAME \"INSTRISSRID\", ";
query = query + "XMLAttributes( RTRIM('" + newIssuer + "') AS \"VALUE\")), ";
query = query + "XMLElement(NAME \"LASTCHGUSRID\",XMLAttributes('rebuildMhssIOI' AS \"VALUE\")))), ";
query = query + "XMLElement(NAME \"SEGMENT\", XMLAttributes( 'ISSRIssuerGroupParticipant' AS \"TYPE\", 'UNKNOWN' AS \"ACTION\"), XMLElement(NAME \"ISSRIssuerGroupParticipant\",  ";
query = query + "XMLElement(NAME \"PRNTISSRGRPOID\", XMLAttributes( 'IRGR000016' AS \"VALUE\")), XMLElement(NAME \"PRTPURPTYP\", XMLAttributes( 'INTEREST' AS \"VALUE\")) ";
query = query + ")))";
query = query + "FROM DUAL";
</objectValue>
<type>CONSTANT</type>
</item>
<item id="1363" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="1364">["newIssuer"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="1365">variables["newIssuer"]</name>
<stringValue id="1366">nonRUPIssuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="1367" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="1368">["query"]@java/lang/Integer@</UITypeHint>
<input>false</input>
<name id="1369">variables["query"]</name>
<stringValue id="1370">ioiAddMSg</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="1371" type="java.util.HashSet">
<item id="1372" type="com.j2fe.workflow.definition.Transition">
<name id="1373">goto-next</name>
<source id="1374">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="1375"/>
<directJoin>false</directJoin>
<name id="1376">log add issuer</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="1377">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="1378" type="java.util.HashSet">
<item id="1379" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1380">database</name>
<stringValue id="1381">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="1382" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1383">indexedParameters[0]</name>
<stringValue id="1384">nonRUPIssuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="1385" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1386">querySQL</name>
<stringValue id="1387">call&#13;
 mhi_sp_eventlog (&#13;
	 'RebuildMhssIOI Workflow',&#13;
	 'Non-RUP add to MHSS IOI',&#13;
	?); </stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1388" type="java.util.HashSet">
<item id="1389" type="com.j2fe.workflow.definition.Transition">
<name id="1390">goto-next</name>
<source id="1391">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="1392"/>
<directJoin>false</directJoin>
<name id="1393">Identify Issuer to add to IOI</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="1394">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="1395" type="java.util.HashSet">
<item id="1396" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1397">database</name>
<stringValue id="1398">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="1399" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1400">indexedParameters[0]</name>
<stringValue id="1401">nonRUPIssuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="1402" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1403">querySQL</name>
<stringValue id="1404">UPDATE FT_T_IOI_MHSS SET UPDATING='Y' WHERE INSTR_ISSR_ID = CAST(? AS VARCHAR)</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1405" type="java.util.HashSet">
<item id="1406" type="com.j2fe.workflow.definition.Transition">
<name id="1407">loop</name>
<source idref="269"/>
<target idref="1391"/>
</item>
</sources>
<targets id="1408" type="java.util.HashSet">
<item idref="1389" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="1374"/>
</item>
</sources>
<targets id="1409" type="java.util.HashSet">
<item idref="1372" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="1355"/>
</item>
</sources>
<targets id="1410" type="java.util.HashSet">
<item idref="1353" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="1332"/>
</item>
</sources>
<targets id="1411" type="java.util.HashSet">
<item idref="1330" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="1315"/>
</item>
</sources>
<targets id="1412" type="java.util.HashSet">
<item idref="1313" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="289"/>
</item>
</sources>
<targets id="1413" type="java.util.HashSet">
<item idref="287" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="269"/>
</item>
</sources>
<targets id="1414" type="java.util.HashSet">
<item idref="267" type="com.j2fe.workflow.definition.Transition"/>
<item idref="1406" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="262"/>
</item>
</sources>
<targets id="1415" type="java.util.HashSet">
<item idref="260" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDJOIN</type>
</source>
<target idref="255"/>
</item>
<item idref="1308" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1416" type="java.util.HashSet">
<item idref="253" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="241"/>
</item>
</sources>
<targets id="1417" type="java.util.HashSet">
<item idref="239" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="227"/>
</item>
</sources>
<targets id="1418" type="java.util.HashSet">
<item idref="225" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="210"/>
</item>
</sources>
<targets id="1419" type="java.util.HashSet">
<item id="1420" type="com.j2fe.workflow.definition.Transition">
<name id="1421">nothing-found</name>
<source idref="210"/>
<target idref="138"/>
</item>
<item idref="208" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="193"/>
</item>
</sources>
<targets id="1422" type="java.util.HashSet">
<item idref="191" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDSPLIT</type>
</source>
<target idref="179"/>
</item>
</sources>
<targets id="1423" type="java.util.HashSet">
<item idref="177" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="172"/>
</item>
<item id="1424" type="com.j2fe.workflow.definition.Transition">
<name id="1425">goto-next</name>
<source id="1426">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="1427"/>
<directJoin>false</directJoin>
<name id="1428">NOP  #3</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="1429">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="1430" type="java.util.HashSet">
<item id="1431" type="com.j2fe.workflow.definition.Transition">
<name id="1432">goto-next</name>
<source id="1433">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="1434"/>
<directJoin>false</directJoin>
<name id="1435">UPDATE IOI_MHSS</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="1436">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="1437" type="java.util.HashSet">
<item id="1438" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1439">database</name>
<stringValue id="1440">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="1441" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1442">indexedParameters[0]</name>
<stringValue id="1443">lockedIssuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="1444" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1445">querySQL</name>
<stringValue id="1446">UPDATE FT_T_IOI_MHSS SET UPDATING='N', UPDATED='Y', DELETE_FROM_IOI = 'N'&#13;
WHERE INSTR_ISSR_ID = CAST(? AS VARCHAR)</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1447" type="java.util.HashSet">
<item id="1448" type="com.j2fe.workflow.definition.Transition">
<name id="1449">goto-next</name>
<source id="1450">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="1451"/>
<directJoin>false</directJoin>
<name id="1452">log retain issuer</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="1453">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="1454" type="java.util.HashSet">
<item id="1455" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1456">database</name>
<stringValue id="1457">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="1458" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1459">indexedParameters[0]</name>
<stringValue id="1460">lockedIssuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="1461" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1462">querySQL</name>
<stringValue id="1463">call&#13;
 mhi_sp_eventlog (&#13;
	 'RebuildMhssIOI Workflow',&#13;
	 'retain as Issuer has a lock',&#13;
	?); </stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1464" type="java.util.HashSet">
<item id="1465" type="com.j2fe.workflow.definition.Transition">
<name id="1466">goto-next</name>
<source id="1467">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="1468"/>
<directJoin>false</directJoin>
<name id="1469">Identify Issuer to flag as locked</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="1470">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="1471" type="java.util.HashSet">
<item id="1472" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1473">database</name>
<stringValue id="1474">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="1475" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1476">indexedParameters[0]</name>
<stringValue id="1477">lockedIssuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="1478" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1479">querySQL</name>
<stringValue id="1480">UPDATE FT_T_IOI_MHSS SET UPDATING='Y' WHERE INSTR_ISSR_ID = CAST(? AS VARCHAR)</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1481" type="java.util.HashSet">
<item id="1482" type="com.j2fe.workflow.definition.Transition">
<name id="1483">loop</name>
<source idref="152"/>
<target idref="1467"/>
</item>
</sources>
<targets id="1484" type="java.util.HashSet">
<item idref="1465" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="1450"/>
</item>
</sources>
<targets id="1485" type="java.util.HashSet">
<item idref="1448" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="1433"/>
</item>
</sources>
<targets id="1486" type="java.util.HashSet">
<item idref="1431" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="1426"/>
</item>
</sources>
<targets id="1487" type="java.util.HashSet">
<item idref="1424" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="172"/>
</item>
</sources>
<targets id="1488" type="java.util.HashSet">
<item idref="170" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="152"/>
</item>
</sources>
<targets id="1489" type="java.util.HashSet">
<item idref="150" type="com.j2fe.workflow.definition.Transition"/>
<item idref="1482" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="145"/>
</item>
</sources>
<targets id="1490" type="java.util.HashSet">
<item idref="143" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDJOIN</type>
</source>
<target idref="138"/>
</item>
<item idref="1420" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1491" type="java.util.HashSet">
<item idref="136" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="121"/>
</item>
</sources>
<targets id="1492" type="java.util.HashSet">
<item id="1493" type="com.j2fe.workflow.definition.Transition">
<name id="1494">nothing-found</name>
<source idref="121"/>
<target idref="10"/>
</item>
<item idref="119" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="107"/>
</item>
</sources>
<targets id="1495" type="java.util.HashSet">
<item idref="105" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="90"/>
</item>
</sources>
<targets id="1496" type="java.util.HashSet">
<item idref="88" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDSPLIT</type>
</source>
<target idref="76"/>
</item>
</sources>
<targets id="1497" type="java.util.HashSet">
<item idref="74" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="69"/>
</item>
<item id="1498" type="com.j2fe.workflow.definition.Transition">
<name id="1499">goto-next</name>
<source id="1500">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="1501"/>
<directJoin>false</directJoin>
<name id="1502">UPDATE IOI_MHSS</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="1503">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="1504" type="java.util.HashSet">
<item id="1505" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1506">database</name>
<stringValue id="1507">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="1508" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1509">indexedParameters[0]</name>
<stringValue id="1510">oldIssuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="1511" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1512">querySQL</name>
<stringValue id="1513">UPDATE FT_T_IOI_MHSS SET UPDATING='N', UPDATED='Y'&#13;
WHERE INSTR_ISSR_ID = CAST(? AS VARCHAR)</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1514" type="java.util.HashSet">
<item id="1515" type="com.j2fe.workflow.definition.Transition">
<name id="1516">goto-next</name>
<source id="1517">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="1518"/>
<directJoin>false</directJoin>
<name id="1519">END DATE IRGP</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="1520">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="1521" type="java.util.HashSet">
<item id="1522" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1523">database</name>
<stringValue id="1524">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="1525" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1526">indexedParameters[0]</name>
<stringValue id="1527">oldIssuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="1528" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1529">querySQL</name>
<stringValue id="1530">UPDATE FT_T_IRGP SET END_TMS = CURRENT_DATE, LAST_CHG_TMS=SYSDATE(), LAST_CHG_USR_ID = 'RebuildMhssIOI'
WHERE INSTR_ISSR_ID = CAST(? AS VARCHAR) AND END_TMS IS NULL and PRNT_ISSR_GRP_OID in (select ISSR_GRP_OID from FT_T_IRGR where grp_nme = 'MHSS Inventory')</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1531" type="java.util.HashSet">
<item id="1532" type="com.j2fe.workflow.definition.Transition">
<name id="1533">goto-next</name>
<source id="1534">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="1535"/>
<directJoin>false</directJoin>
<name id="1536">log remove issuer</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="1537">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="1538" type="java.util.HashSet">
<item id="1539" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1540">database</name>
<stringValue id="1541">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="1542" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1543">indexedParameters[0]</name>
<stringValue id="1544">oldIssuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="1545" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1546">querySQL</name>
<stringValue id="1547">call&#13;
 mhi_sp_eventlog (&#13;
	 'RebuildMhssIOI Workflow',&#13;
	 'remove from MHSS IOI',&#13;
	?); </stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1548" type="java.util.HashSet">
<item id="1549" type="com.j2fe.workflow.definition.Transition">
<name id="1550">goto-next</name>
<source id="1551">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<description id="1552"/>
<directJoin>false</directJoin>
<name id="1553">Identify Issuer to remove from IOI</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="1554">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="1555" type="java.util.HashSet">
<item id="1556" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1557">database</name>
<stringValue id="1558">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="1559" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1560">indexedParameters[0]</name>
<stringValue id="1561">newIssuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="1562" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1563">querySQL</name>
<stringValue id="1564">UPDATE FT_T_IOI_MHSS SET UPDATING='Y' WHERE INSTR_ISSR_ID = CAST(? AS VARCHAR)</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1565" type="java.util.HashSet">
<item id="1566" type="com.j2fe.workflow.definition.Transition">
<name id="1567">loop</name>
<source idref="49"/>
<target idref="1551"/>
</item>
</sources>
<targets id="1568" type="java.util.HashSet">
<item idref="1549" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="1534"/>
</item>
</sources>
<targets id="1569" type="java.util.HashSet">
<item idref="1532" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="1517"/>
</item>
</sources>
<targets id="1570" type="java.util.HashSet">
<item idref="1515" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="1500"/>
</item>
</sources>
<targets id="1571" type="java.util.HashSet">
<item idref="1498" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="69"/>
</item>
</sources>
<targets id="1572" type="java.util.HashSet">
<item idref="67" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="49"/>
</item>
</sources>
<targets id="1573" type="java.util.HashSet">
<item idref="47" type="com.j2fe.workflow.definition.Transition"/>
<item idref="1566" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="42"/>
</item>
</sources>
<targets id="1574" type="java.util.HashSet">
<item idref="40" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDJOIN</type>
</source>
<target idref="24"/>
</item>
</sources>
<targets id="1575" type="java.util.HashSet">
<item idref="22" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="10"/>
</item>
<item idref="1493" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1576" type="java.util.HashSet">
<item idref="8" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="3"/>
</item>
</sources>
<targets id="1577" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="1578">Mizuho</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="1579">user1</lastChangeUser>
<lastUpdate id="1580">2025-10-19T06:01:03.000+0100</lastUpdate>
<name id="1581">rebuildMhssIOI</name>
<nodes id="1582" type="java.util.HashSet">
<item idref="766" type="com.j2fe.workflow.definition.Node"/>
<item idref="870" type="com.j2fe.workflow.definition.Node"/>
<item idref="714" type="com.j2fe.workflow.definition.Node"/>
<item idref="558" type="com.j2fe.workflow.definition.Node"/>
<item idref="506" type="com.j2fe.workflow.definition.Node"/>
<item idref="610" type="com.j2fe.workflow.definition.Node"/>
<item idref="818" type="com.j2fe.workflow.definition.Node"/>
<item idref="662" type="com.j2fe.workflow.definition.Node"/>
<item idref="922" type="com.j2fe.workflow.definition.Node"/>
<item idref="179" type="com.j2fe.workflow.definition.Node"/>
<item idref="399" type="com.j2fe.workflow.definition.Node"/>
<item idref="296" type="com.j2fe.workflow.definition.Node"/>
<item idref="76" type="com.j2fe.workflow.definition.Node"/>
<item idref="413" type="com.j2fe.workflow.definition.Node"/>
<item idref="90" type="com.j2fe.workflow.definition.Node"/>
<item idref="310" type="com.j2fe.workflow.definition.Node"/>
<item idref="193" type="com.j2fe.workflow.definition.Node"/>
<item idref="582" type="com.j2fe.workflow.definition.Node"/>
<item idref="634" type="com.j2fe.workflow.definition.Node"/>
<item idref="210" type="com.j2fe.workflow.definition.Node"/>
<item idref="461" type="com.j2fe.workflow.definition.Node"/>
<item idref="1517" type="com.j2fe.workflow.definition.Node"/>
<item idref="953" type="com.j2fe.workflow.definition.Node"/>
<item idref="227" type="com.j2fe.workflow.definition.Node"/>
<item idref="842" type="com.j2fe.workflow.definition.Node"/>
<item idref="686" type="com.j2fe.workflow.definition.Node"/>
<item idref="1355" type="com.j2fe.workflow.definition.Node"/>
<item idref="1244" type="com.j2fe.workflow.definition.Node"/>
<item idref="1221" type="com.j2fe.workflow.definition.Node"/>
<item idref="1332" type="com.j2fe.workflow.definition.Node"/>
<item idref="1280" type="com.j2fe.workflow.definition.Node"/>
<item idref="1391" type="com.j2fe.workflow.definition.Node"/>
<item idref="1467" type="com.j2fe.workflow.definition.Node"/>
<item idref="1551" type="com.j2fe.workflow.definition.Node"/>
<item idref="341" type="com.j2fe.workflow.definition.Node"/>
<item idref="121" type="com.j2fe.workflow.definition.Node"/>
<item idref="530" type="com.j2fe.workflow.definition.Node"/>
<item idref="478" type="com.j2fe.workflow.definition.Node"/>
<item idref="152" type="com.j2fe.workflow.definition.Node"/>
<item idref="269" type="com.j2fe.workflow.definition.Node"/>
<item idref="372" type="com.j2fe.workflow.definition.Node"/>
<item idref="49" type="com.j2fe.workflow.definition.Node"/>
<item idref="790" type="com.j2fe.workflow.definition.Node"/>
<item idref="392" type="com.j2fe.workflow.definition.Node"/>
<item idref="887" type="com.j2fe.workflow.definition.Node"/>
<item idref="523" type="com.j2fe.workflow.definition.Node"/>
<item idref="172" type="com.j2fe.workflow.definition.Node"/>
<item idref="358" type="com.j2fe.workflow.definition.Node"/>
<item idref="138" type="com.j2fe.workflow.definition.Node"/>
<item idref="835" type="com.j2fe.workflow.definition.Node"/>
<item idref="255" type="com.j2fe.workflow.definition.Node"/>
<item idref="731" type="com.j2fe.workflow.definition.Node"/>
<item idref="289" type="com.j2fe.workflow.definition.Node"/>
<item idref="575" type="com.j2fe.workflow.definition.Node"/>
<item idref="627" type="com.j2fe.workflow.definition.Node"/>
<item idref="783" type="com.j2fe.workflow.definition.Node"/>
<item idref="679" type="com.j2fe.workflow.definition.Node"/>
<item idref="69" type="com.j2fe.workflow.definition.Node"/>
<item idref="1426" type="com.j2fe.workflow.definition.Node"/>
<item idref="939" type="com.j2fe.workflow.definition.Node"/>
<item idref="444" type="com.j2fe.workflow.definition.Node"/>
<item idref="738" type="com.j2fe.workflow.definition.Node"/>
<item idref="894" type="com.j2fe.workflow.definition.Node"/>
<item idref="981" type="com.j2fe.workflow.definition.Node"/>
<item idref="3" type="com.j2fe.workflow.definition.Node"/>
<item idref="42" type="com.j2fe.workflow.definition.Node"/>
<item idref="262" type="com.j2fe.workflow.definition.Node"/>
<item idref="365" type="com.j2fe.workflow.definition.Node"/>
<item idref="145" type="com.j2fe.workflow.definition.Node"/>
<item idref="1500" type="com.j2fe.workflow.definition.Node"/>
<item idref="1433" type="com.j2fe.workflow.definition.Node"/>
<item idref="1187" type="com.j2fe.workflow.definition.Node"/>
<item idref="1315" type="com.j2fe.workflow.definition.Node"/>
<item idref="24" type="com.j2fe.workflow.definition.Node"/>
<item idref="752" type="com.j2fe.workflow.definition.Node"/>
<item idref="596" type="com.j2fe.workflow.definition.Node"/>
<item idref="804" type="com.j2fe.workflow.definition.Node"/>
<item idref="648" type="com.j2fe.workflow.definition.Node"/>
<item idref="856" type="com.j2fe.workflow.definition.Node"/>
<item idref="700" type="com.j2fe.workflow.definition.Node"/>
<item idref="1263" type="com.j2fe.workflow.definition.Node"/>
<item idref="1374" type="com.j2fe.workflow.definition.Node"/>
<item idref="327" type="com.j2fe.workflow.definition.Node"/>
<item idref="544" type="com.j2fe.workflow.definition.Node"/>
<item idref="492" type="com.j2fe.workflow.definition.Node"/>
<item idref="430" type="com.j2fe.workflow.definition.Node"/>
<item idref="908" type="com.j2fe.workflow.definition.Node"/>
<item idref="241" type="com.j2fe.workflow.definition.Node"/>
<item idref="10" type="com.j2fe.workflow.definition.Node"/>
<item idref="967" type="com.j2fe.workflow.definition.Node"/>
<item idref="1534" type="com.j2fe.workflow.definition.Node"/>
<item idref="107" type="com.j2fe.workflow.definition.Node"/>
<item idref="1450" type="com.j2fe.workflow.definition.Node"/>
<item idref="1056" type="com.j2fe.workflow.definition.Node"/>
<item idref="1119" type="com.j2fe.workflow.definition.Node"/>
<item idref="1035" type="com.j2fe.workflow.definition.Node"/>
<item idref="1098" type="com.j2fe.workflow.definition.Node"/>
<item idref="1014" type="com.j2fe.workflow.definition.Node"/>
<item idref="1077" type="com.j2fe.workflow.definition.Node"/>
<item idref="1140" type="com.j2fe.workflow.definition.Node"/>
<item idref="1161" type="com.j2fe.workflow.definition.Node"/>
<item idref="993" type="com.j2fe.workflow.definition.Node"/>
<item idref="1204" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>false</optimize>
<parameter id="1583" type="java.util.HashMap">
<entry>
<key id="1584" type="java.lang.String">BulkSize</key>
<value id="1585" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="1586">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
</parameter>
<permissions id="1587" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>false</purgeAtEnd>
<retries>0</retries>
<startNode idref="981"/>
<status>RELEASED</status>
<variables id="1588" type="java.util.HashMap">
<entry>
<key id="1589" type="java.lang.String">BulkSize</key>
<value id="1590" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="1591">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<persistent>false</persistent>
<value id="1592" type="java.lang.Integer">1</value>
</value>
</entry>
</variables>
<version>15</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
