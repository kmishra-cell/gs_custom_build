<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.07">
<package-comment/>
<businessobject displayString="3 - v10 - priority queue" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>true</alwaysPersist>
<clustered>false</clustered>
<comment id="1">v10 - priority queue</comment>
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
<name id="9">40</name>
<source id="10">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="11"/>
<directJoin>false</directJoin>
<name id="12">Severity</name>
<nodeHandler>com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandler>
<nodeHandlerClass id="13">com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandlerClass>
<parameters id="14" type="java.util.HashSet">
<item id="15" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="16">caseItem</name>
<stringValue id="17">MaxSevCode</stringValue>
<type>VARIABLE</type>
</item>
<item id="18" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="19">defaultItem</name>
<stringValue id="20">10</stringValue>
<type>CONSTANT</type>
</item>
<item id="21" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="22">nullTransition</name>
<stringValue id="23">50</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="24" type="java.util.HashSet">
<item id="25" type="com.j2fe.workflow.definition.Transition">
<name id="26">goto-next</name>
<source id="27">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="28"/>
<directJoin>false</directJoin>
<name id="29">Database Select (Standard)</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="30">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="31" type="java.util.HashSet">
<item id="32" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="33">database</name>
<stringValue id="34">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="35" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="36">firstColumnsResult[0]</name>
<stringValue id="37">MaxSevCode</stringValue>
<type>VARIABLE</type>
</item>
<item id="38" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="39">indexedParameters[0]</name>
<stringValue id="40">TransactionId</stringValue>
<type>VARIABLE</type>
</item>
<item id="41" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="42">querySQL</name>
<stringValue id="43">select crrnt_severity_cde from FT_T_TRID where trn_id = ?</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="44" type="java.util.HashSet">
<item id="45" type="com.j2fe.workflow.definition.Transition">
<name id="46">goto-next</name>
<source id="47">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="48"/>
<directJoin>false</directJoin>
<name id="49">Wait #1</name>
<nodeHandler>com.j2fe.scheduling.activities.Wait</nodeHandler>
<nodeHandlerClass id="50">com.j2fe.scheduling.activities.Wait</nodeHandlerClass>
<parameters id="51" type="java.util.HashSet">
<item id="52" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="53">secondsToWait</name>
<stringValue id="54">5</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="55" type="java.util.HashSet">
<item id="56" type="com.j2fe.workflow.definition.Transition">
<name id="57">goto-next</name>
<source id="58">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="59"/>
<directJoin>false</directJoin>
<name id="60">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="61">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="62" type="java.util.HashSet"/>
<targets id="63" type="java.util.HashSet">
<item idref="56" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="47"/>
</item>
</sources>
<targets id="64" type="java.util.HashSet">
<item idref="45" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="27"/>
</item>
</sources>
<targets id="65" type="java.util.HashSet">
<item idref="25" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="10"/>
</item>
</sources>
<targets id="66" type="java.util.HashSet">
<item id="67" type="com.j2fe.workflow.definition.Transition">
<name id="68">10</name>
<source idref="10"/>
<target id="69">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="70"/>
<directJoin>false</directJoin>
<name id="71">Get InstrId</name>
<nodeHandler>com.j2fe.workflow.handler.impl.ExecuteXPath</nodeHandler>
<nodeHandlerClass id="72">com.j2fe.workflow.handler.impl.ExecuteXPath</nodeHandlerClass>
<parameters id="73" type="java.util.HashSet">
<item id="74" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="75">inputText</name>
<stringValue id="76">Messages</stringValue>
<type>VARIABLE</type>
</item>
<item id="77" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="78">outputValue</name>
<stringValue id="79">instrId</stringValue>
<type>VARIABLE</type>
</item>
<item id="80" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="81">xPath</name>
<stringValue id="82">/STREET_REF/SEGMENT[@TYPE="Issue"]/Issue/INSTRID/@VALUE</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="83" type="java.util.HashSet">
<item idref="67" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="84" type="java.util.HashSet">
<item id="85" type="com.j2fe.workflow.definition.Transition">
<name id="86">goto-next</name>
<source idref="69"/>
<target id="87">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="88"/>
<directJoin>false</directJoin>
<name id="89">Get ISRT OID</name>
<nodeHandler>com.j2fe.workflow.handler.impl.ExecuteXPath</nodeHandler>
<nodeHandlerClass id="90">com.j2fe.workflow.handler.impl.ExecuteXPath</nodeHandlerClass>
<parameters id="91" type="java.util.HashSet">
<item id="92" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="93">inputText</name>
<stringValue id="94">Messages</stringValue>
<type>VARIABLE</type>
</item>
<item id="95" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="96">outputValues</name>
<stringValue id="97">ISRTOidArr</stringValue>
<type>VARIABLE</type>
</item>
<item id="98" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="99">xPath</name>
<stringValue id="100">IsrtXpath</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="101" type="java.util.HashSet">
<item idref="85" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="102" type="java.util.HashSet">
<item id="103" type="com.j2fe.workflow.definition.Transition">
<name id="104">goto-next</name>
<source idref="87"/>
<target id="105">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="106"/>
<directJoin>false</directJoin>
<name id="107">Switch Case</name>
<nodeHandler>com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandler>
<nodeHandlerClass id="108">com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandlerClass>
<parameters id="109" type="java.util.HashSet">
<item id="110" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="111">caseItem</name>
<stringValue id="112">ISRTOidArr</stringValue>
<type>VARIABLE</type>
</item>
<item id="113" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="114">defaultItem</name>
<stringValue id="115">1</stringValue>
<type>CONSTANT</type>
</item>
<item id="116" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="117">nullTransition</name>
<stringValue id="118">NULL</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="119" type="java.util.HashSet">
<item idref="103" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="120" type="java.util.HashSet">
<item id="121" type="com.j2fe.workflow.definition.Transition">
<name id="122">1</name>
<source idref="105"/>
<target id="123">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="124"/>
<directJoin>false</directJoin>
<name id="125">Update Portfolio Recalculate flag to yes</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="126">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="127" type="java.util.HashSet">
<item id="128" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="129">database</name>
<stringValue id="130">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="131" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="132">indexedParameters[0]</name>
<stringValue id="133">instrId</stringValue>
<type>VARIABLE</type>
</item>
<item id="134" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="135">querySQL</name>
<stringValue id="136">update ft_t_isst set stat_char_val_txt = 'Y', last_chg_tms = sysdate(), last_chg_usr_id = 'WF'&#13;
where stat_id = (&#13;
select isst.stat_id from ft_t_issu issu, ft_t_isgp isgp, ft_t_isst isst, ft_t_isgp isgp1 where issu.iss_typ = 'PORT'&#13;
and isgp.instr_id = issu.instr_id&#13;
and isgp.prnt_iss_grp_oid = isgp1.prnt_iss_grp_oid and isgp1.instr_id = ?&#13;
and isgp.prt_purp_typ = 'PRTFLIOP' and isgp1.prt_purp_typ = 'PRTFLIOC'&#13;
and isgp.start_tms &lt;= sysdate() and (isgp.end_tms is null or isgp.end_tms &gt; sysdate())&#13;
and isgp1.start_tms &lt;= sysdate() and (isgp1.end_tms is null or isgp1.end_tms &gt; sysdate())&#13;
and isst.instr_id = issu.instr_id&#13;
and isst.stat_def_id = 'MIZRECAL' and isst.stat_char_val_txt = 'N' &#13;
and isst.start_tms &lt;= sysdate() and (isst.end_tms is null or isst.end_tms &gt; sysdate()))</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="137" type="java.util.HashSet">
<item idref="121" type="com.j2fe.workflow.definition.Transition"/>
<item id="138" type="com.j2fe.workflow.definition.Transition">
<name id="139">1</name>
<source id="140">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="141"/>
<directJoin>false</directJoin>
<name id="142">if found then exit else recalc=Y</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="143">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="144" type="java.util.HashSet">
<item id="145" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="146">statements</name>
<stringValue id="147">if(null == input[0] || "null".equalsIgnoreCase(input[0]) || "".equalsIgnoreCase(input[0]))&#13;
	return 1;&#13;
else&#13;
	return 2;</stringValue>
<type>CONSTANT</type>
</item>
<item id="148" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="149">variables["input"]</name>
<stringValue id="150">checkPortChange</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="151" type="java.util.HashSet">
<item id="152" type="com.j2fe.workflow.definition.Transition">
<name id="153">goto-next</name>
<source id="154">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="155"/>
<directJoin>false</directJoin>
<name id="156">Execute Function to check if same portfolio found</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="157">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="158" type="java.util.HashSet">
<item id="159" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="160">database</name>
<stringValue id="161">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="162" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="163">firstColumnsResult</name>
<stringValue id="164">checkPortChange</stringValue>
<type>VARIABLE</type>
</item>
<item id="165" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="166">indexedParameters[0]</name>
<stringValue id="167">instrId</stringValue>
<type>VARIABLE</type>
</item>
<item id="168" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="169">indexedParameters[1]</name>
<stringValue id="170">portId</stringValue>
<type>VARIABLE</type>
<variablePart id="171">[0]</variablePart>
</item>
<item id="172" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="173">querySQL</name>
<stringValue id="174">SELECT GETRECALCFLAF( ? , ? ) FROM DUAL</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="175" type="java.util.HashSet">
<item id="176" type="com.j2fe.workflow.definition.Transition">
<name id="177">rows-found</name>
<source id="178">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="179"/>
<directJoin>false</directJoin>
<name id="180">Get Portfolio Instrument</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="181">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="182" type="java.util.HashSet">
<item id="183" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="184">database</name>
<stringValue id="185">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="186" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="187">firstColumnsResult</name>
<stringValue id="188">portId</stringValue>
<type>VARIABLE</type>
</item>
<item id="189" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="190">indexedParameters[0]</name>
<stringValue id="191">instrId</stringValue>
<type>VARIABLE</type>
</item>
<item id="192" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="193">querySQL</name>
<stringValue id="194">select p.instr_id from ft_t_isgp p, ft_t_isgp cl where p.prnt_iss_grp_oid = cl.prnt_iss_grp_oid&#13;
and p.prt_purp_typ = 'PRTFLIOP' and cl.prt_purp_typ = 'PRTFLIOC' and cl.instr_id = ?&#13;
and p.start_tms &lt;= sysdate() and (p.end_tms is null or p.end_tms &gt; sysdate())&#13;
and cl.start_tms &lt;= sysdate() and (cl.end_tms is null or cl.end_tms &gt; sysdate())</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="195" type="java.util.HashSet">
<item id="196" type="com.j2fe.workflow.definition.Transition">
<name id="197">NULL</name>
<source idref="105"/>
<target idref="178"/>
</item>
</sources>
<targets id="198" type="java.util.HashSet">
<item id="199" type="com.j2fe.workflow.definition.Transition">
<name id="200">nothing-found</name>
<source idref="178"/>
<target id="201">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="202">Automatically generated</description>
<directJoin>false</directJoin>
<name id="203">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="204">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="205" type="java.util.HashSet">
<item id="206" type="com.j2fe.workflow.definition.Transition">
<name id="207">2</name>
<source idref="140"/>
<target idref="201"/>
</item>
<item id="208" type="com.j2fe.workflow.definition.Transition">
<name id="209">goto-next</name>
<source idref="123"/>
<target idref="201"/>
</item>
<item idref="199" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="210" type="java.util.HashSet">
<item id="211" type="com.j2fe.workflow.definition.Transition">
<name id="212">ToSplit</name>
<source idref="201"/>
<target id="213">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="214"/>
<directJoin>false</directJoin>
<name id="215">Database Select (Xor Split)</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="216">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="217" type="java.util.HashSet">
<item id="218" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="219">database</name>
<stringValue id="220">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="221" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="222">firstColumnsResult</name>
<stringValue id="223">pubInstrId</stringValue>
<type>VARIABLE</type>
</item>
<item id="224" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="225">indexedParameters[0]</name>
<stringValue id="226">TransactionId</stringValue>
<type>VARIABLE</type>
</item>
<item id="227" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="228">querySQL</name>
<stringValue id="229">select msgp.xref_tbl_row_oid from ft_t_msgp msgp, ft_t_trid trid where msgp.trn_id = trid.trn_id &#13;
and trid.trn_id =  ?&#13;
and msgp.xref_tbl_typ = 'ISSU' and msgp.entity_chg_ind in ('C','U')&#13;
and msgp.xref_tbl_row_oid is not null &#13;
and trid.crrnt_severity_cde &lt; 40</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="230" type="java.util.HashSet">
<item idref="211" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="231" type="java.util.HashSet">
<item id="232" type="com.j2fe.workflow.definition.Transition">
<name id="233">nothing-found</name>
<source idref="213"/>
<target id="234">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="235">Automatically generated</description>
<directJoin>false</directJoin>
<name id="236">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="237">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="238" type="java.util.HashSet">
<item id="239" type="com.j2fe.workflow.definition.Transition">
<name id="240">goto-next</name>
<source id="241">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="242"/>
<directJoin>false</directJoin>
<name id="243">Raise Event Remote #2</name>
<nodeHandler>com.j2fe.event.RaiseEventRemote</nodeHandler>
<nodeHandlerClass id="244">com.j2fe.event.RaiseEventRemote</nodeHandlerClass>
<parameters id="245" type="java.util.HashSet">
<item id="246" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="247">eventName</name>
<stringValue id="248">CSTMPublishingtoFileMIZEvent</stringValue>
<type>CONSTANT</type>
</item>
<item id="249" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="250">["EntityId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="251">parameters["EntityId"]</name>
<stringValue id="252">pubInstrId</stringValue>
<type>VARIABLE</type>
<variablePart id="253">[0]</variablePart>
</item>
<item id="254" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="255">["IssueQueue"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="256">parameters["IssueQueue"]</name>
<stringValue id="257">IssueQueue</stringValue>
<type>VARIABLE</type>
</item>
<item id="258" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="259">["ModelID"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="260">parameters["ModelID"]</name>
<stringValue id="261">ModelId</stringValue>
<type>VARIABLE</type>
</item>
<item id="262" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="263">propertyFileLocation</name>
<stringValue id="264">db://resource/PublishingConfiguration/PublishingConfig.properties</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="265" type="java.util.HashSet">
<item id="266" type="com.j2fe.workflow.definition.Transition">
<name id="267">rows-found</name>
<source idref="213"/>
<target idref="241"/>
</item>
</sources>
<targets id="268" type="java.util.HashSet">
<item idref="239" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="234"/>
</item>
<item idref="232" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="269" type="java.util.HashSet">
<item id="270" type="com.j2fe.workflow.definition.Transition">
<name id="271">ToSplit</name>
<source idref="234"/>
<target id="272">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="273"/>
<directJoin>false</directJoin>
<name id="274">Get User</name>
<nodeHandler>com.j2fe.workflow.handler.impl.ExecuteXPath</nodeHandler>
<nodeHandlerClass id="275">com.j2fe.workflow.handler.impl.ExecuteXPath</nodeHandlerClass>
<parameters id="276" type="java.util.HashSet">
<item id="277" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="278">inputText</name>
<stringValue id="279">Messages</stringValue>
<type>VARIABLE</type>
</item>
<item id="280" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="281">outputValue</name>
<stringValue id="282">UserName</stringValue>
<type>VARIABLE</type>
</item>
<item id="283" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="284">xPath</name>
<stringValue id="285">/STREET_REF/HEADER/USERID/@VALUE</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="286" type="java.util.HashSet">
<item idref="270" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="287" type="java.util.HashSet">
<item id="288" type="com.j2fe.workflow.definition.Transition">
<name id="289">goto-next</name>
<source idref="272"/>
<target id="290">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="291"/>
<directJoin>false</directJoin>
<name id="292">Build MHI/MHEU SQL Select UP</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="293">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="294" type="java.util.HashSet">
<item id="295" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="296">statements</name>
<objectValue id="297" type="java.lang.String">String sqlSelect = "SELECT '&lt;!DOCTYPE STREET_REF SYSTEM \"fti://repository/dtd/STREET_REF\"&gt;' || xmlelement(NAME \"STREET_REF\",xmlattributes( 'GUEST' AS \"USERID\"), ";&#13;
sqlSelect = sqlSelect  + "xmlelement(NAME \"HEADER\", xmlelement(NAME \"USERID\", xmlattributes( '"  + userName + "' AS \"VALUE\")), xmlelement(NAME \"MAIN_ENTITY_TBL_TYP\", xmlattributes( 'ISSR' AS \"VALUE\"))),";&#13;
sqlSelect = sqlSelect  + "xmlelement(NAME \"SEGMENT\", xmlattributes( 'Issuer' AS \"TYPE\", 'REFERENCE' AS \"ACTION\"), ";&#13;
sqlSelect = sqlSelect  + "xmlelement(NAME \"Issuer\", xmlelement(NAME \"INSTRISSRID\", xmlattributes( RTRIM((select instr_issr_id from ft_t_issr ur where end_tms is null and fins_inst_mnem = mhi_fins_up(ft_t_issr.fins_inst_mnem))) AS \"VALUE\")))), ";&#13;
sqlSelect = sqlSelect  + "xmlelement(NAME \"SEGMENT\", xmlattributes( 'ISSRIssuerGroupParticipant' AS \"TYPE\", 'UNKNOWN' AS \"ACTION\"), xmlelement(NAME \"ISSRIssuerGroupParticipant\", ";&#13;
sqlSelect = sqlSelect  + "xmlelement(NAME \"PRNTISSRGRPOID\", xmlattributes( 'IRGR000006' AS \"VALUE\")), xmlelement(NAME \"PRTPURPTYP\", xmlattributes( 'INTEREST' AS \"VALUE\"))";&#13;
sqlSelect = sqlSelect  + "))) FROM ft_t_issr ft_t_issr ";&#13;
sqlSelect = sqlSelect  + "WHERE ( ft_t_issr.END_TMS IS NULL OR ft_t_issr.END_TMS &gt; sysdate() ) ";&#13;
sqlSelect = sqlSelect  + "and instr_issr_id not in (select instr_issr_id from ft_t_irgp where end_tms is null and prnt_issr_grp_oid = 'IRGR000006') ";&#13;
sqlSelect = sqlSelect  + "and instr_issr_id in (select instr_issr_id from ft_t_issu where end_tms is null and instr_id = '" + instrId + "' and instr_id in (select instr_id from ft_t_isgp ";&#13;
sqlSelect = sqlSelect  + "where prt_purp_typ = 'INTEREST' ";&#13;
sqlSelect = sqlSelect  + "and prnt_iss_grp_oid in (select iss_grp_oid from ft_t_isgr where end_tms is null and org_id in ('MHI','MHEU')) ";&#13;
sqlSelect = sqlSelect  + "and end_tms is null))";</objectValue>
<type>CONSTANT</type>
</item>
<item id="298" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="299">variables["instrId"]</name>
<stringValue id="300">instrId</stringValue>
<type>VARIABLE</type>
</item>
<item id="301" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="302">variables["sqlSelect"]</name>
<stringValue id="303">sqlSelect</stringValue>
<type>VARIABLE</type>
</item>
<item id="304" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="305">variables["userName"]</name>
<stringValue id="306">UserName</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="307" type="java.util.HashSet">
<item idref="288" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="308" type="java.util.HashSet">
<item id="309" type="com.j2fe.workflow.definition.Transition">
<name id="310">goto-next</name>
<source idref="290"/>
<target id="311">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="312"/>
<directJoin>false</directJoin>
<name id="313">Add MHI/MHEU UP to IOI</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="314">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="315" type="java.util.HashSet">
<item id="316" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="317">["sqlSelect"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="318">input["sqlSelect"]</name>
<stringValue id="319">sqlSelect</stringValue>
<type>VARIABLE</type>
</item>
<item id="320" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="321">name</name>
<stringValue id="322">RealMessageProcessing</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="323" type="java.util.HashSet">
<item idref="309" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="324" type="java.util.HashSet">
<item id="325" type="com.j2fe.workflow.definition.Transition">
<name id="326">goto-next</name>
<source idref="311"/>
<target id="327">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="328"/>
<directJoin>false</directJoin>
<name id="329">Build MHI / MHEU SQL Select</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="330">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="331" type="java.util.HashSet">
<item id="332" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="333">statements</name>
<objectValue id="334" type="java.lang.String">String sqlSelect = "SELECT '&lt;!DOCTYPE STREET_REF SYSTEM \"fti://repository/dtd/STREET_REF\"&gt;' || xmlelement(NAME \"STREET_REF\",xmlattributes( 'GUEST' AS \"USERID\"), ";&#13;
sqlSelect = sqlSelect  + "xmlelement(NAME \"HEADER\", xmlelement(NAME \"USERID\", xmlattributes( '"  + userName + "' AS \"VALUE\")), xmlelement(NAME \"MAIN_ENTITY_TBL_TYP\", xmlattributes( 'ISSR' AS \"VALUE\"))),";&#13;
sqlSelect = sqlSelect  + "xmlelement(NAME \"SEGMENT\", xmlattributes( 'Issuer' AS \"TYPE\", 'REFERENCE' AS \"ACTION\"), ";&#13;
sqlSelect = sqlSelect  + "xmlelement(NAME \"Issuer\", xmlelement(NAME \"INSTRISSRID\", xmlattributes( RTRIM(ft_t_issr.instr_issr_id) AS \"VALUE\")))), ";&#13;
sqlSelect = sqlSelect  + "xmlelement(NAME \"SEGMENT\", xmlattributes( 'ISSRIssuerGroupParticipant' AS \"TYPE\", 'UNKNOWN' AS \"ACTION\"), xmlelement(NAME \"ISSRIssuerGroupParticipant\", ";&#13;
sqlSelect = sqlSelect  + "xmlelement(NAME \"PRNTISSRGRPOID\", xmlattributes( 'IRGR000006' AS \"VALUE\")), xmlelement(NAME \"PRTPURPTYP\", xmlattributes( 'INTEREST' AS \"VALUE\"))";&#13;
sqlSelect = sqlSelect  + "))) FROM ft_t_issr ft_t_issr ";&#13;
sqlSelect = sqlSelect  + "WHERE ( ft_t_issr.END_TMS IS NULL OR ft_t_issr.END_TMS &gt; sysdate() ) ";&#13;
sqlSelect = sqlSelect  + "and instr_issr_id not in (select instr_issr_id from ft_t_irgp where end_tms is null and prnt_issr_grp_oid = 'IRGR000006') ";&#13;
sqlSelect = sqlSelect  + "and instr_issr_id in (select instr_issr_id from ft_t_issu where end_tms is null and instr_id = '" + instrId + "' and instr_id in (select instr_id from ft_t_isgp ";&#13;
sqlSelect = sqlSelect  + "where prt_purp_typ = 'INTEREST' and prnt_iss_grp_oid in (select iss_grp_oid from ft_t_isgr where end_tms is null and org_id in ('MHI','MHEU')) ";&#13;
sqlSelect = sqlSelect  + "and end_tms is null))";</objectValue>
<type>CONSTANT</type>
</item>
<item id="335" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="336">variables["instrId"]</name>
<stringValue id="337">instrId</stringValue>
<type>VARIABLE</type>
</item>
<item id="338" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="339">variables["sqlSelect"]</name>
<stringValue id="340">sqlSelect</stringValue>
<type>VARIABLE</type>
</item>
<item id="341" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="342">variables["userName"]</name>
<stringValue id="343">UserName</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="344" type="java.util.HashSet">
<item idref="325" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="345" type="java.util.HashSet">
<item id="346" type="com.j2fe.workflow.definition.Transition">
<name id="347">goto-next</name>
<source idref="327"/>
<target id="348">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="349"/>
<directJoin>false</directJoin>
<name id="350">Add Issuer to IOI</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="351">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="352" type="java.util.HashSet">
<item id="353" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="354">["sqlSelect"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="355">input["sqlSelect"]</name>
<stringValue id="356">sqlSelect</stringValue>
<type>VARIABLE</type>
</item>
<item id="357" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="358">name</name>
<stringValue id="359">RealMessageProcessing</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="360" type="java.util.HashSet">
<item idref="346" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="361" type="java.util.HashSet">
<item id="362" type="com.j2fe.workflow.definition.Transition">
<name id="363">goto-next</name>
<source idref="348"/>
<target id="364">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="365"/>
<directJoin>false</directJoin>
<name id="366">Build MHSS SQL Select UP</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="367">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="368" type="java.util.HashSet">
<item id="369" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="370">statements</name>
<objectValue id="371" type="java.lang.String">String sqlSelect = "SELECT '&lt;!DOCTYPE STREET_REF SYSTEM \"fti://repository/dtd/STREET_REF\"&gt;' || xmlelement(NAME \"STREET_REF\",xmlAttributes( 'GUEST' AS \"USERID\"), ";&#13;
sqlSelect = sqlSelect  + "xmlelement(NAME \"HEADER\", xmlelement(NAME \"USERID\", xmlAttributes( '"  + userName + "' AS \"VALUE\")), xmlelement(NAME \"MAIN_ENTITY_TBL_TYP\", xmlAttributes( 'ISSR' AS \"VALUE\"))),";&#13;
sqlSelect = sqlSelect  + "xmlelement(NAME \"SEGMENT\", xmlAttributes( 'Issuer' AS \"TYPE\", 'REFERENCE' AS \"ACTION\"), ";&#13;
sqlSelect = sqlSelect  + "xmlelement(NAME \"Issuer\", xmlelement(NAME \"INSTRISSRID\", xmlAttributes( RTRIM((select instr_issr_id from ft_t_issr ur where end_tms is null and fins_inst_mnem = mhi_fins_up(ft_t_issr.fins_inst_mnem))) AS \"VALUE\")))), ";&#13;
sqlSelect = sqlSelect  + "xmlelement(NAME \"SEGMENT\", xmlAttributes( 'ISSRIssuerGroupParticipant' AS \"TYPE\", 'UNKNOWN' AS \"ACTION\"), xmlelement(NAME \"ISSRIssuerGroupParticipant\", ";&#13;
sqlSelect = sqlSelect  + "xmlelement(NAME \"PRNTISSRGRPOID\", xmlAttributes( 'IRGR000016' AS \"VALUE\")), xmlelement(NAME \"PRTPURPTYP\", xmlAttributes( 'INTEREST' AS \"VALUE\"))";&#13;
sqlSelect = sqlSelect  + "))) FROM ft_t_issr ft_t_issr ";&#13;
sqlSelect = sqlSelect  + "WHERE ( ft_t_issr.END_TMS IS NULL OR ft_t_issr.END_TMS &gt; sysdate() ) ";&#13;
sqlSelect = sqlSelect  + "and instr_issr_id not in (select instr_issr_id from ft_t_irgp where end_tms is null and prnt_issr_grp_oid = 'IRGR000016') ";&#13;
sqlSelect = sqlSelect  + "and instr_issr_id in (select instr_issr_id from ft_t_issu where end_tms is null and instr_id = '" + instrId + "' and instr_id in (select instr_id from ft_t_isgp ";&#13;
sqlSelect = sqlSelect  + "where prt_purp_typ = 'INTEREST' ";&#13;
sqlSelect = sqlSelect  + "and prnt_iss_grp_oid in (select iss_grp_oid from ft_t_isgr where end_tms is null and org_id in ('MHISS')) ";&#13;
sqlSelect = sqlSelect  + "and end_tms is null))";</objectValue>
<type>CONSTANT</type>
</item>
<item id="372" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="373">variables["instrId"]</name>
<stringValue id="374">instrId</stringValue>
<type>VARIABLE</type>
</item>
<item id="375" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="376">variables["sqlSelect"]</name>
<stringValue id="377">sqlSelect</stringValue>
<type>VARIABLE</type>
</item>
<item id="378" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="379">variables["userName"]</name>
<stringValue id="380">UserName</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="381" type="java.util.HashSet">
<item idref="362" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="382" type="java.util.HashSet">
<item id="383" type="com.j2fe.workflow.definition.Transition">
<name id="384">goto-next</name>
<source idref="364"/>
<target id="385">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="386"/>
<directJoin>false</directJoin>
<name id="387">Add MHSS UP to IOI</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="388">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="389" type="java.util.HashSet">
<item id="390" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="391">["sqlSelect"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="392">input["sqlSelect"]</name>
<stringValue id="393">sqlSelect</stringValue>
<type>VARIABLE</type>
</item>
<item id="394" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="395">name</name>
<stringValue id="396">RealMessageProcessing</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="397" type="java.util.HashSet">
<item idref="383" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="398" type="java.util.HashSet">
<item id="399" type="com.j2fe.workflow.definition.Transition">
<name id="400">goto-next</name>
<source idref="385"/>
<target id="401">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="402"/>
<directJoin>false</directJoin>
<name id="403">Build MHSS SQL Select</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="404">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="405" type="java.util.HashSet">
<item id="406" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="407">statements</name>
<objectValue id="408" type="java.lang.String">String sqlSelect = "SELECT '&lt;!DOCTYPE STREET_REF SYSTEM \"fti://repository/dtd/STREET_REF\"&gt;' || xmlelement(NAME \"STREET_REF\",xmlattributes( 'GUEST' AS \"USERID\"), ";&#13;
sqlSelect = sqlSelect  + "xmlelement(NAME \"HEADER\", xmlelement(NAME \"USERID\", xmlattributes( '"  + userName + "' AS \"VALUE\")), xmlelement(NAME \"MAIN_ENTITY_TBL_TYP\", xmlattributes( 'ISSR' AS \"VALUE\"))),";&#13;
sqlSelect = sqlSelect  + "xmlelement(NAME \"SEGMENT\", xmlattributes( 'Issuer' AS \"TYPE\", 'REFERENCE' AS \"ACTION\"), ";&#13;
sqlSelect = sqlSelect  + "xmlelement(NAME \"Issuer\", xmlelement(NAME \"INSTRISSRID\", xmlattributes( RTRIM(ft_t_issr.instr_issr_id) AS \"VALUE\")))), ";&#13;
sqlSelect = sqlSelect  + "xmlelement(NAME \"SEGMENT\", xmlattributes( 'ISSRIssuerGroupParticipant' AS \"TYPE\", 'UNKNOWN' AS \"ACTION\"), xmlelement(NAME \"ISSRIssuerGroupParticipant\", ";&#13;
sqlSelect = sqlSelect  + "xmlelement(NAME \"PRNTISSRGRPOID\", xmlattributes( 'IRGR000016' AS \"VALUE\")), xmlelement(NAME \"PRTPURPTYP\", xmlattributes( 'INTEREST' AS \"VALUE\"))";&#13;
sqlSelect = sqlSelect  + "))) FROM ft_t_issr ft_t_issr ";&#13;
sqlSelect = sqlSelect  + "WHERE ( ft_t_issr.END_TMS IS NULL OR ft_t_issr.END_TMS &gt; sysdate() ) ";&#13;
sqlSelect = sqlSelect  + "and instr_issr_id not in (select instr_issr_id from ft_t_irgp where end_tms is null and prnt_issr_grp_oid = 'IRGR000016') ";&#13;
sqlSelect = sqlSelect  + "and instr_issr_id in (select instr_issr_id from ft_t_issu where end_tms is null and instr_id = '" + instrId + "' and instr_id in (select instr_id from ft_t_isgp ";&#13;
sqlSelect = sqlSelect  + "where prt_purp_typ = 'INTEREST' and prnt_iss_grp_oid in (select iss_grp_oid from ft_t_isgr where end_tms is null and org_id in ('MHSS')) ";&#13;
sqlSelect = sqlSelect  + "and end_tms is null))";</objectValue>
<type>CONSTANT</type>
</item>
<item id="409" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="410">variables["instrId"]</name>
<stringValue id="411">instrId</stringValue>
<type>VARIABLE</type>
</item>
<item id="412" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="413">variables["sqlSelect"]</name>
<stringValue id="414">sqlSelect</stringValue>
<type>VARIABLE</type>
</item>
<item id="415" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="416">variables["userName"]</name>
<stringValue id="417">UserName</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="418" type="java.util.HashSet">
<item idref="399" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="419" type="java.util.HashSet">
<item id="420" type="com.j2fe.workflow.definition.Transition">
<name id="421">goto-next</name>
<source idref="401"/>
<target id="422">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="423"/>
<directJoin>false</directJoin>
<name id="424">Add Issuer to IOI</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="425">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="426" type="java.util.HashSet">
<item id="427" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="428">["sqlSelect"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="429">input["sqlSelect"]</name>
<stringValue id="430">sqlSelect</stringValue>
<type>VARIABLE</type>
</item>
<item id="431" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="432">name</name>
<stringValue id="433">RealMessageProcessing</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="434" type="java.util.HashSet">
<item idref="420" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="435" type="java.util.HashSet">
<item id="436" type="com.j2fe.workflow.definition.Transition">
<name id="437">goto-next</name>
<source idref="422"/>
<target id="438">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="439"/>
<directJoin>false</directJoin>
<name id="440">Build MHBK SQL Select UP</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="441">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="442" type="java.util.HashSet">
<item id="443" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="444">statements</name>
<objectValue id="445" type="java.lang.String">String sqlSelect = "SELECT '&lt;!DOCTYPE STREET_REF SYSTEM \"fti://repository/dtd/STREET_REF\"&gt;' || xmlelement(NAME \"STREET_REF\",xmlattributes( 'GUEST' AS \"USERID\"), ";&#13;
sqlSelect = sqlSelect  + "xmlelement(NAME \"HEADER\", xmlelement(NAME \"USERID\", xmlattributes( '"  + userName + "' AS \"VALUE\")), xmlelement(NAME \"MAIN_ENTITY_TBL_TYP\", xmlattributes( 'ISSR' AS \"VALUE\"))),";&#13;
sqlSelect = sqlSelect  + "xmlelement(NAME \"SEGMENT\", xmlattributes( 'Issuer' AS \"TYPE\", 'REFERENCE' AS \"ACTION\"), ";&#13;
sqlSelect = sqlSelect  + "xmlelement(NAME \"Issuer\", xmlelement(NAME \"INSTRISSRID\", xmlattributes( RTRIM((select instr_issr_id from ft_t_issr ur where end_tms is null and fins_inst_mnem = mhi_fins_up(ft_t_issr.fins_inst_mnem))) AS \"VALUE\")))), ";&#13;
sqlSelect = sqlSelect  + "xmlelement(NAME \"SEGMENT\", xmlattributes( 'ISSRIssuerGroupParticipant' AS \"TYPE\", 'UNKNOWN' AS \"ACTION\"), xmlelement(NAME \"ISSRIssuerGroupParticipant\", ";&#13;
sqlSelect = sqlSelect  + "xmlelement(NAME \"PRNTISSRGRPOID\", xmlattributes( 'IRGR000026' AS \"VALUE\")), xmlelement(NAME \"PRTPURPTYP\", xmlattributes( 'INTEREST' AS \"VALUE\"))";&#13;
sqlSelect = sqlSelect  + "))) FROM ft_t_issr ft_t_issr ";&#13;
sqlSelect = sqlSelect  + "WHERE ( ft_t_issr.END_TMS IS NULL OR ft_t_issr.END_TMS &gt; sysdate() ) ";&#13;
sqlSelect = sqlSelect  + "and instr_issr_id not in (select instr_issr_id from ft_t_irgp where end_tms is null and prnt_issr_grp_oid = 'IRGR000026') ";&#13;
sqlSelect = sqlSelect  + "and instr_issr_id in (select instr_issr_id from ft_t_issu where end_tms is null and instr_id = '" + instrId + "' and instr_id in (select instr_id from ft_t_isgp ";&#13;
sqlSelect = sqlSelect  + "where prt_purp_typ = 'INTEREST' ";&#13;
sqlSelect = sqlSelect  + "and prnt_iss_grp_oid in (select iss_grp_oid from ft_t_isgr where end_tms is null and org_id in ('MHBK')) ";&#13;
sqlSelect = sqlSelect  + "and end_tms is null))";</objectValue>
<type>CONSTANT</type>
</item>
<item id="446" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="447">variables["instrId"]</name>
<stringValue id="448">instrId</stringValue>
<type>VARIABLE</type>
</item>
<item id="449" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="450">variables["sqlSelect"]</name>
<stringValue id="451">sqlSelect</stringValue>
<type>VARIABLE</type>
</item>
<item id="452" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="453">variables["userName"]</name>
<stringValue id="454">UserName</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="455" type="java.util.HashSet">
<item idref="436" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="456" type="java.util.HashSet">
<item id="457" type="com.j2fe.workflow.definition.Transition">
<name id="458">goto-next</name>
<source idref="438"/>
<target id="459">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="460"/>
<directJoin>false</directJoin>
<name id="461">Add MHBK UP to IOI</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="462">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="463" type="java.util.HashSet">
<item id="464" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="465">["sqlSelect"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="466">input["sqlSelect"]</name>
<stringValue id="467">sqlSelect</stringValue>
<type>VARIABLE</type>
</item>
<item id="468" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="469">name</name>
<stringValue id="470">RealMessageProcessing</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="471" type="java.util.HashSet">
<item idref="457" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="472" type="java.util.HashSet">
<item id="473" type="com.j2fe.workflow.definition.Transition">
<name id="474">goto-next</name>
<source idref="459"/>
<target id="475">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="476"/>
<directJoin>false</directJoin>
<name id="477">Build MHBK SQL Select</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="478">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="479" type="java.util.HashSet">
<item id="480" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="481">statements</name>
<objectValue id="482" type="java.lang.String">String sqlSelect = "SELECT '&lt;!DOCTYPE STREET_REF SYSTEM \"fti://repository/dtd/STREET_REF\"&gt;' || xmlelement(NAME \"STREET_REF\",xmlattributes( 'GUEST' AS \"USERID\"), ";&#13;
sqlSelect = sqlSelect  + "xmlelement(NAME \"HEADER\", xmlelement(NAME \"USERID\", xmlattributes( '"  + userName + "' AS \"VALUE\")), xmlelement(NAME \"MAIN_ENTITY_TBL_TYP\", xmlattributes( 'ISSR' AS \"VALUE\"))),";&#13;
sqlSelect = sqlSelect  + "xmlelement(NAME \"SEGMENT\", xmlattributes( 'Issuer' AS \"TYPE\", 'REFERENCE' AS \"ACTION\"), ";&#13;
sqlSelect = sqlSelect  + "xmlelement(NAME \"Issuer\", xmlelement(NAME \"INSTRISSRID\", xmlattributes( RTRIM(ft_t_issr.instr_issr_id) AS \"VALUE\")))), ";&#13;
sqlSelect = sqlSelect  + "xmlelement(NAME \"SEGMENT\", xmlattributes( 'ISSRIssuerGroupParticipant' AS \"TYPE\", 'UNKNOWN' AS \"ACTION\"), xmlelement(NAME \"ISSRIssuerGroupParticipant\", ";&#13;
sqlSelect = sqlSelect  + "xmlelement(NAME \"PRNTISSRGRPOID\", xmlattributes( 'IRGR000026' AS \"VALUE\")), xmlelement(NAME \"PRTPURPTYP\", xmlattributes( 'INTEREST' AS \"VALUE\"))";&#13;
sqlSelect = sqlSelect  + "))) FROM ft_t_issr ft_t_issr ";&#13;
sqlSelect = sqlSelect  + "WHERE ( ft_t_issr.END_TMS IS NULL OR ft_t_issr.END_TMS &gt; sysdate() ) ";&#13;
sqlSelect = sqlSelect  + "and instr_issr_id not in (select instr_issr_id from ft_t_irgp where end_tms is null and prnt_issr_grp_oid = 'IRGR000026') ";&#13;
sqlSelect = sqlSelect  + "and instr_issr_id in (select instr_issr_id from ft_t_issu where end_tms is null and instr_id = '" + instrId + "' and instr_id in (select instr_id from ft_t_isgp ";&#13;
sqlSelect = sqlSelect  + "where prt_purp_typ = 'INTEREST' and prnt_iss_grp_oid in (select iss_grp_oid from ft_t_isgr where end_tms is null and org_id in ('MHBK')) ";&#13;
sqlSelect = sqlSelect  + "and end_tms is null))";</objectValue>
<type>CONSTANT</type>
</item>
<item id="483" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="484">variables["instrId"]</name>
<stringValue id="485">instrId</stringValue>
<type>VARIABLE</type>
</item>
<item id="486" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="487">variables["sqlSelect"]</name>
<stringValue id="488">sqlSelect</stringValue>
<type>VARIABLE</type>
</item>
<item id="489" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="490">variables["userName"]</name>
<stringValue id="491">UserName</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="492" type="java.util.HashSet">
<item idref="473" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="493" type="java.util.HashSet">
<item id="494" type="com.j2fe.workflow.definition.Transition">
<name id="495">goto-next</name>
<source idref="475"/>
<target id="496">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="497"/>
<directJoin>false</directJoin>
<name id="498">Add MHBK to IOI</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="499">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="500" type="java.util.HashSet">
<item id="501" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="502">["sqlSelect"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="503">input["sqlSelect"]</name>
<stringValue id="504">sqlSelect</stringValue>
<type>VARIABLE</type>
</item>
<item id="505" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="506">name</name>
<stringValue id="507">RealMessageProcessing</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="508" type="java.util.HashSet">
<item idref="494" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="509" type="java.util.HashSet">
<item id="510" type="com.j2fe.workflow.definition.Transition">
<name id="511">goto-next</name>
<source idref="496"/>
<target id="512">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="513"/>
<directJoin>false</directJoin>
<name id="514">Build MBE SQL Select UP</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="515">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="516" type="java.util.HashSet">
<item id="517" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="518">statements</name>
<objectValue id="519" type="java.lang.String">String sqlSelect = "SELECT '&lt;!DOCTYPE STREET_REF SYSTEM \"fti://repository/dtd/STREET_REF\"&gt;' || xmlelement(NAME \"STREET_REF\",xmlattributes( 'GUEST' AS \"USERID\"), ";&#13;
sqlSelect = sqlSelect  + "xmlelement(NAME \"HEADER\", xmlelement(NAME \"USERID\", xmlattributes( '"  + userName + "' AS \"VALUE\")), xmlelement(NAME \"MAIN_ENTITY_TBL_TYP\", xmlattributes( 'ISSR' AS \"VALUE\"))),";&#13;
sqlSelect = sqlSelect  + "xmlelement(NAME \"SEGMENT\", xmlattributes( 'Issuer' AS \"TYPE\", 'REFERENCE' AS \"ACTION\"), ";&#13;
sqlSelect = sqlSelect  + "xmlelement(NAME \"Issuer\", xmlelement(NAME \"INSTRISSRID\", xmlattributes( RTRIM((select instr_issr_id from ft_t_issr ur where end_tms is null and fins_inst_mnem = mhi_fins_up(ft_t_issr.fins_inst_mnem))) AS \"VALUE\")))), ";&#13;
sqlSelect = sqlSelect  + "xmlelement(NAME \"SEGMENT\", xmlattributes( 'ISSRIssuerGroupParticipant' AS \"TYPE\", 'UNKNOWN' AS \"ACTION\"), xmlelement(NAME \"ISSRIssuerGroupParticipant\", ";&#13;
sqlSelect = sqlSelect  + "xmlelement(NAME \"PRNTISSRGRPOID\", xmlattributes( 'IRGR000036' AS \"VALUE\")), xmlelement(NAME \"PRTPURPTYP\", xmlattributes( 'INTEREST' AS \"VALUE\"))";&#13;
sqlSelect = sqlSelect  + "))) FROM ft_t_issr ft_t_issr ";&#13;
sqlSelect = sqlSelect  + "WHERE ( ft_t_issr.END_TMS IS NULL OR ft_t_issr.END_TMS &gt; sysdate() ) ";&#13;
sqlSelect = sqlSelect  + "and instr_issr_id not in (select instr_issr_id from ft_t_irgp where end_tms is null and prnt_issr_grp_oid = 'IRGR000036') ";&#13;
sqlSelect = sqlSelect  + "and instr_issr_id in (select instr_issr_id from ft_t_issu where end_tms is null and instr_id = '" + instrId + "' and instr_id in (select instr_id from ft_t_isgp ";&#13;
sqlSelect = sqlSelect  + "where prt_purp_typ = 'INTEREST' ";&#13;
sqlSelect = sqlSelect  + "and prnt_iss_grp_oid in (select iss_grp_oid from ft_t_isgr where end_tms is null and org_id in ('MBE')) ";&#13;
sqlSelect = sqlSelect  + "and end_tms is null))";</objectValue>
<type>CONSTANT</type>
</item>
<item id="520" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="521">variables["instrId"]</name>
<stringValue id="522">instrId</stringValue>
<type>VARIABLE</type>
</item>
<item id="523" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="524">variables["sqlSelect"]</name>
<stringValue id="525">sqlSelect</stringValue>
<type>VARIABLE</type>
</item>
<item id="526" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="527">variables["userName"]</name>
<stringValue id="528">UserName</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="529" type="java.util.HashSet">
<item idref="510" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="530" type="java.util.HashSet">
<item id="531" type="com.j2fe.workflow.definition.Transition">
<name id="532">goto-next</name>
<source idref="512"/>
<target id="533">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="534"/>
<directJoin>false</directJoin>
<name id="535">Add MBE UP to IOI</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="536">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="537" type="java.util.HashSet">
<item id="538" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="539">["sqlSelect"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="540">input["sqlSelect"]</name>
<stringValue id="541">sqlSelect</stringValue>
<type>VARIABLE</type>
</item>
<item id="542" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="543">name</name>
<stringValue id="544">RealMessageProcessing</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="545" type="java.util.HashSet">
<item idref="531" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="546" type="java.util.HashSet">
<item id="547" type="com.j2fe.workflow.definition.Transition">
<name id="548">goto-next</name>
<source idref="533"/>
<target id="549">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="550"/>
<directJoin>false</directJoin>
<name id="551">Build MBE SQL Select</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="552">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="553" type="java.util.HashSet">
<item id="554" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="555">statements</name>
<objectValue id="556" type="java.lang.String">String sqlSelect = "SELECT '&lt;!DOCTYPE STREET_REF SYSTEM \"fti://repository/dtd/STREET_REF\"&gt;' || xmlelement(NAME \"STREET_REF\",xmlattributes( 'GUEST' AS \"USERID\"), ";&#13;
sqlSelect = sqlSelect  + "xmlelement(NAME \"HEADER\", xmlelement(NAME \"USERID\", xmlattributes( '"  + userName + "' AS \"VALUE\")), xmlelement(NAME \"MAIN_ENTITY_TBL_TYP\", xmlattributes( 'ISSR' AS \"VALUE\"))),";&#13;
sqlSelect = sqlSelect  + "xmlelement(NAME \"SEGMENT\", xmlattributes( 'Issuer' AS \"TYPE\", 'REFERENCE' AS \"ACTION\"), ";&#13;
sqlSelect = sqlSelect  + "xmlelement(NAME \"Issuer\", xmlelement(NAME \"INSTRISSRID\", xmlattributes( RTRIM(ft_t_issr.instr_issr_id) AS \"VALUE\")))), ";&#13;
sqlSelect = sqlSelect  + "xmlelement(NAME \"SEGMENT\", xmlattributes( 'ISSRIssuerGroupParticipant' AS \"TYPE\", 'UNKNOWN' AS \"ACTION\"), xmlelement(NAME \"ISSRIssuerGroupParticipant\", ";&#13;
sqlSelect = sqlSelect  + "xmlelement(NAME \"PRNTISSRGRPOID\", xmlattributes( 'IRGR000036' AS \"VALUE\")), xmlelement(NAME \"PRTPURPTYP\", xmlattributes( 'INTEREST' AS \"VALUE\"))";&#13;
sqlSelect = sqlSelect  + "))) FROM ft_t_issr ft_t_issr ";&#13;
sqlSelect = sqlSelect  + "WHERE ( ft_t_issr.END_TMS IS NULL OR ft_t_issr.END_TMS &gt; sysdate() ) ";&#13;
sqlSelect = sqlSelect  + "and instr_issr_id not in (select instr_issr_id from ft_t_irgp where end_tms is null and prnt_issr_grp_oid = 'IRGR000036') ";&#13;
sqlSelect = sqlSelect  + "and instr_issr_id in (select instr_issr_id from ft_t_issu where end_tms is null and instr_id = '" + instrId + "' and instr_id in (select instr_id from ft_t_isgp ";&#13;
sqlSelect = sqlSelect  + "where prt_purp_typ = 'INTEREST' and prnt_iss_grp_oid in (select iss_grp_oid from ft_t_isgr where end_tms is null and org_id in ('MBE')) ";&#13;
sqlSelect = sqlSelect  + "and end_tms is null))";</objectValue>
<type>CONSTANT</type>
</item>
<item id="557" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="558">variables["instrId"]</name>
<stringValue id="559">instrId</stringValue>
<type>VARIABLE</type>
</item>
<item id="560" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="561">variables["sqlSelect"]</name>
<stringValue id="562">sqlSelect</stringValue>
<type>VARIABLE</type>
</item>
<item id="563" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="564">variables["userName"]</name>
<stringValue id="565">UserName</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="566" type="java.util.HashSet">
<item idref="547" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="567" type="java.util.HashSet">
<item id="568" type="com.j2fe.workflow.definition.Transition">
<name id="569">goto-next</name>
<source idref="549"/>
<target id="570">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="571"/>
<directJoin>false</directJoin>
<name id="572">Add MBE to IOI</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="573">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="574" type="java.util.HashSet">
<item id="575" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="576">["sqlSelect"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="577">input["sqlSelect"]</name>
<stringValue id="578">sqlSelect</stringValue>
<type>VARIABLE</type>
</item>
<item id="579" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="580">name</name>
<stringValue id="581">RealMessageProcessing</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="582" type="java.util.HashSet">
<item idref="568" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="583" type="java.util.HashSet">
<item id="584" type="com.j2fe.workflow.definition.Transition">
<name id="585">goto-next</name>
<source idref="570"/>
<target id="586">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="587"/>
<directJoin>false</directJoin>
<name id="588">get gtor not in MHI/MHEU IOI</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="589">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="590" type="java.util.HashSet">
<item id="591" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="592">database</name>
<stringValue id="593">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="594" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="595">firstColumnsResult</name>
<stringValue id="596">GtorId</stringValue>
<type>VARIABLE</type>
</item>
<item id="597" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="598">[0]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="599">indexedParameters[0]</name>
<stringValue id="600">instrId</stringValue>
<type>VARIABLE</type>
</item>
<item id="601" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="602">querySQL</name>
<stringValue id="603">select instr_issr_id from ft_t_issr where FINS_INST_MNEM in (&#13;
  select INST_MNEM from FT_T_FINR where (END_TMS is null or END_TMS &gt; sysdate()) and INST_MNEM in (&#13;
    select INST_MNEM from ft_t_frip where (END_TMS is null or END_TMS &gt; sysdate()) and PRT_PURP_TYP = 'GUARANTR'  and INSTR_ID = ? &#13;
      and INSTR_ID in (select instr_id from FT_T_ISGP where END_TMS is null and PRNT_ISS_GRP_OID in (select iss_grp_oid from ft_t_isgr where end_tms is null and org_id in ('MHI','MHEU'))&#13;
      and PRNT_ISS_GRP_OID in (select ISS_GRP_OID from ft_t_isgr where GRP_PURP_TYP = 'INTEREST'))))&#13;
and INSTR_ISSR_ID not in (select INSTR_ISSR_ID from ft_t_irgp where PRNT_ISSR_GRP_OID = 'IRGR000006' and PRT_PURP_TYP = 'INTEREST' and END_TMS is null)</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<persistentVariables id="604" type="java.util.HashSet">
<item id="605" type="java.lang.String">GtorId
1000</item>
</persistentVariables>
<sources id="606" type="java.util.HashSet">
<item idref="584" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="607" type="java.util.HashSet">
<item id="608" type="com.j2fe.workflow.definition.Transition">
<name id="609">nothing-found</name>
<source idref="586"/>
<target id="610">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="611">Automatically generated</description>
<directJoin>false</directJoin>
<name id="612">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="613">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="614" type="java.util.HashSet">
<item id="615" type="com.j2fe.workflow.definition.Transition">
<name id="616">goto-next</name>
<source id="617">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="618"/>
<directJoin>false</directJoin>
<name id="619">Add MHI/MHEU Guarantor to IOI</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="620">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="621" type="java.util.HashSet">
<item id="622" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="623">["sqlSelect"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="624">input["sqlSelect"]</name>
<stringValue id="625">sqlGtorSelect</stringValue>
<type>VARIABLE</type>
</item>
<item id="626" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="627">name</name>
<stringValue id="628">RealMessageProcessing</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<persistentVariables id="629" type="java.util.HashSet">
<item id="630" type="java.lang.String">GtorId
1000</item>
</persistentVariables>
<sources id="631" type="java.util.HashSet">
<item id="632" type="com.j2fe.workflow.definition.Transition">
<name id="633">goto-next</name>
<source id="634">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="635"/>
<directJoin>false</directJoin>
<name id="636">Build SQL Select GTOR MHI/MHEU</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="637">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="638" type="java.util.HashSet">
<item id="639" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="640">statements</name>
<objectValue id="641" type="java.lang.String">String sqlGtorSelect = "SELECT '&lt;!DOCTYPE STREET_REF SYSTEM \"fti://repository/dtd/STREET_REF\"&gt;' || xmlelement(NAME \"STREET_REF\",xmlattributes( 'GUEST' AS \"USERID\"), ";&#13;
sqlGtorSelect = sqlGtorSelect  + "xmlelement(NAME \"HEADER\", xmlelement(NAME \"USERID\", xmlattributes( '"  + userName + "' AS \"VALUE\")), xmlelement(NAME \"MAIN_ENTITY_TBL_TYP\", xmlattributes( 'ISSR' AS \"VALUE\"))),";&#13;
sqlGtorSelect = sqlGtorSelect  + "xmlelement(NAME \"SEGMENT\", xmlattributes( 'Issuer' AS \"TYPE\", 'REFERENCE' AS \"ACTION\"), ";&#13;
sqlGtorSelect = sqlGtorSelect  + "xmlelement(NAME \"Issuer\", xmlelement(NAME \"INSTRISSRID\", xmlattributes( RTRIM(ft_t_issr.instr_issr_id) AS \"VALUE\")))), ";&#13;
sqlGtorSelect = sqlGtorSelect  + "xmlelement(NAME \"SEGMENT\", xmlattributes( 'ISSRIssuerGroupParticipant' AS \"TYPE\", 'UNKNOWN' AS \"ACTION\"), xmlelement(NAME \"ISSRIssuerGroupParticipant\", ";&#13;
sqlGtorSelect = sqlGtorSelect  + "xmlelement(NAME \"PRNTISSRGRPOID\", xmlattributes( 'IRGR000006' AS \"VALUE\")), xmlelement(NAME \"PRTPURPTYP\", xmlattributes( 'INTEREST' AS \"VALUE\"))";&#13;
sqlGtorSelect = sqlGtorSelect  + "))) FROM ft_t_issr where FINS_INST_MNEM in (";&#13;
sqlGtorSelect = sqlGtorSelect  + "  select INST_MNEM from FT_T_FINR where (END_TMS is null or END_TMS &gt; SYSDATE()) and INST_MNEM in (";&#13;
sqlGtorSelect = sqlGtorSelect  + "    select INST_MNEM from ft_t_frip where (END_TMS is null or END_TMS &gt; SYSDATE()) and PRT_PURP_TYP = 'GUARANTR'  and INSTR_ID = '" + instrId + "'))";&#13;
sqlGtorSelect = sqlGtorSelect  + "and INSTR_ISSR_ID not in (select INSTR_ISSR_ID from ft_t_irgp where PRNT_ISSR_GRP_OID = 'IRGR000006' and PRT_PURP_TYP = 'INTEREST' and END_TMS is null)";</objectValue>
<type>CONSTANT</type>
</item>
<item id="642" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="643">variables["instrId"]</name>
<stringValue id="644">instrId</stringValue>
<type>VARIABLE</type>
</item>
<item id="645" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="646">variables["sqlGtorSelect"]</name>
<stringValue id="647">sqlGtorSelect</stringValue>
<type>VARIABLE</type>
</item>
<item id="648" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="649">variables["userName"]</name>
<stringValue id="650">UserName</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<persistentVariables id="651" type="java.util.HashSet">
<item id="652" type="java.lang.String">GtorId
1000</item>
</persistentVariables>
<sources id="653" type="java.util.HashSet">
<item id="654" type="com.j2fe.workflow.definition.Transition">
<name id="655">rows-found</name>
<source idref="586"/>
<target idref="634"/>
</item>
</sources>
<targets id="656" type="java.util.HashSet">
<item idref="632" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="617"/>
</item>
</sources>
<targets id="657" type="java.util.HashSet">
<item idref="615" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="610"/>
</item>
<item idref="608" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="658" type="java.util.HashSet">
<item id="659" type="com.j2fe.workflow.definition.Transition">
<name id="660">ToSplit</name>
<source idref="610"/>
<target id="661">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="662"/>
<directJoin>false</directJoin>
<name id="663">get gtor not in MHSS IOI</name>
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
<stringValue id="671">GtorId</stringValue>
<type>VARIABLE</type>
</item>
<item id="672" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="673">[0]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="674">indexedParameters[0]</name>
<stringValue id="675">instrId</stringValue>
<type>VARIABLE</type>
</item>
<item id="676" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="677">querySQL</name>
<stringValue id="678">select instr_issr_id from ft_t_issr where FINS_INST_MNEM in (&#13;
  select INST_MNEM from FT_T_FINR where (END_TMS is null or END_TMS &gt; sysdate()) and INST_MNEM in (&#13;
    select INST_MNEM from ft_t_frip where (END_TMS is null or END_TMS &gt; sysdate()) and PRT_PURP_TYP = 'GUARANTR'  and INSTR_ID = ? &#13;
      and INSTR_ID in (select instr_id from FT_T_ISGP where END_TMS is null and PRNT_ISS_GRP_OID in (select iss_grp_oid from ft_t_isgr where end_tms is null and org_id in ('MHSS'))&#13;
      and PRNT_ISS_GRP_OID in (select ISS_GRP_OID from ft_t_isgr where GRP_PURP_TYP = 'INTEREST'))))&#13;
and INSTR_ISSR_ID not in (select INSTR_ISSR_ID from ft_t_irgp where PRNT_ISSR_GRP_OID = 'IRGR000016' and PRT_PURP_TYP = 'INTEREST' and END_TMS is null)</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="679" type="java.util.HashSet">
<item idref="659" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="680" type="java.util.HashSet">
<item id="681" type="com.j2fe.workflow.definition.Transition">
<name id="682">nothing-found</name>
<source idref="661"/>
<target id="683">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="684">Automatically generated</description>
<directJoin>false</directJoin>
<name id="685">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="686">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="687" type="java.util.HashSet">
<item id="688" type="com.j2fe.workflow.definition.Transition">
<name id="689">goto-next</name>
<source id="690">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="691"/>
<directJoin>false</directJoin>
<name id="692">Add MHSS Guarantor to IOI</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="693">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="694" type="java.util.HashSet">
<item id="695" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="696">["sqlSelect"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="697">input["sqlSelect"]</name>
<stringValue id="698">sqlGtorSelect</stringValue>
<type>VARIABLE</type>
</item>
<item id="699" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="700">name</name>
<stringValue id="701">RealMessageProcessing</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="702" type="java.util.HashSet">
<item id="703" type="com.j2fe.workflow.definition.Transition">
<name id="704">goto-next</name>
<source id="705">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="706"/>
<directJoin>false</directJoin>
<name id="707">Build SQL Select GTOR MHSS</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="708">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="709" type="java.util.HashSet">
<item id="710" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="711">statements</name>
<objectValue id="712" type="java.lang.String">String sqlGtorSelect = "SELECT '&lt;!DOCTYPE STREET_REF SYSTEM \"fti://repository/dtd/STREET_REF\"&gt;' || XMLElement(NAME \"STREET_REF\",XMLAttributes( 'GUEST' AS \"USERID\"), ";&#13;
sqlGtorSelect = sqlGtorSelect  + "XMLElement(NAME \"HEADER\", XMLElement(NAME \"USERID\", XMLAttributes( '"  + userName + "' AS \"VALUE\")), XMLElement(NAME \"MAIN_ENTITY_TBL_TYP\", XMLAttributes( 'ISSR' AS \"VALUE\"))),";&#13;
sqlGtorSelect = sqlGtorSelect  + "XMLElement(NAME \"SEGMENT\", XMLAttributes( 'Issuer' AS \"TYPE\", 'REFERENCE' AS \"ACTION\"), ";&#13;
sqlGtorSelect = sqlGtorSelect  + "XMLElement(NAME \"Issuer\", XMLElement(NAME \"INSTRISSRID\", XMLAttributes( RTRIM(ft_t_issr.instr_issr_id) AS \"VALUE\")))), ";&#13;
sqlGtorSelect = sqlGtorSelect  + "XMLElement(NAME \"SEGMENT\", XMLAttributes( 'ISSRIssuerGroupParticipant' AS \"TYPE\", 'UNKNOWN' AS \"ACTION\"), XMLElement(NAME \"ISSRIssuerGroupParticipant\", ";&#13;
sqlGtorSelect = sqlGtorSelect  + "XMLElement(NAME \"PRNTISSRGRPOID\", XMLAttributes( 'IRGR000016' AS \"VALUE\")), XMLElement(NAME \"PRTPURPTYP\", XMLAttributes( 'INTEREST' AS \"VALUE\"))";&#13;
sqlGtorSelect = sqlGtorSelect  + "))) FROM ft_t_issr where FINS_INST_MNEM in (";&#13;
sqlGtorSelect = sqlGtorSelect  + "  select INST_MNEM from FT_T_FINR where (END_TMS is null or END_TMS &gt; SYSDATE()) and INST_MNEM in (";&#13;
sqlGtorSelect = sqlGtorSelect  + "    select INST_MNEM from ft_t_frip where (END_TMS is null or END_TMS &gt; SYSDATE()) and PRT_PURP_TYP = 'GUARANTR'  and INSTR_ID = '" + instrId + "'))";&#13;
sqlGtorSelect = sqlGtorSelect  + "and INSTR_ISSR_ID not in (select INSTR_ISSR_ID from ft_t_irgp where PRNT_ISSR_GRP_OID = 'IRGR000016' and PRT_PURP_TYP = 'INTEREST' and END_TMS is null)";</objectValue>
<type>CONSTANT</type>
</item>
<item id="713" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="714">variables["instrId"]</name>
<stringValue id="715">instrId</stringValue>
<type>VARIABLE</type>
</item>
<item id="716" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="717">variables["sqlGtorSelect"]</name>
<stringValue id="718">sqlGtorSelect</stringValue>
<type>VARIABLE</type>
</item>
<item id="719" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="720">variables["userName"]</name>
<stringValue id="721">UserName</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="722" type="java.util.HashSet">
<item id="723" type="com.j2fe.workflow.definition.Transition">
<name id="724">rows-found</name>
<source idref="661"/>
<target idref="705"/>
</item>
</sources>
<targets id="725" type="java.util.HashSet">
<item idref="703" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="690"/>
</item>
</sources>
<targets id="726" type="java.util.HashSet">
<item idref="688" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="683"/>
</item>
<item idref="681" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="727" type="java.util.HashSet">
<item id="728" type="com.j2fe.workflow.definition.Transition">
<name id="729">ToSplit</name>
<source idref="683"/>
<target id="730">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="731"/>
<directJoin>false</directJoin>
<name id="732">get gtor not in MHBK IOI</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="733">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="734" type="java.util.HashSet">
<item id="735" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="736">database</name>
<stringValue id="737">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="738" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="739">firstColumnsResult</name>
<stringValue id="740">GtorId</stringValue>
<type>VARIABLE</type>
</item>
<item id="741" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="742">[0]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="743">indexedParameters[0]</name>
<stringValue id="744">instrId</stringValue>
<type>VARIABLE</type>
</item>
<item id="745" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="746">querySQL</name>
<stringValue id="747">select instr_issr_id from ft_t_issr where FINS_INST_MNEM in (&#13;
  select INST_MNEM from FT_T_FINR where (END_TMS is null or END_TMS &gt; sysdate()) and INST_MNEM in (&#13;
    select INST_MNEM from ft_t_frip where (END_TMS is null or END_TMS &gt; sysdate()) and PRT_PURP_TYP = 'GUARANTR'  and INSTR_ID = ? &#13;
      and INSTR_ID in (select instr_id from FT_T_ISGP where END_TMS is null and PRNT_ISS_GRP_OID in (select iss_grp_oid from ft_t_isgr where end_tms is null and org_id in ('MHBK'))&#13;
      and PRNT_ISS_GRP_OID in (select ISS_GRP_OID from ft_t_isgr where GRP_PURP_TYP = 'INTEREST'))))&#13;
and INSTR_ISSR_ID not in (select INSTR_ISSR_ID from ft_t_irgp where PRNT_ISSR_GRP_OID = 'IRGR000026' and PRT_PURP_TYP = 'INTEREST' and END_TMS is null)</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="748" type="java.util.HashSet">
<item idref="728" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="749" type="java.util.HashSet">
<item id="750" type="com.j2fe.workflow.definition.Transition">
<name id="751">nothing-found</name>
<source idref="730"/>
<target id="752">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="753">Automatically generated</description>
<directJoin>false</directJoin>
<name id="754">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="755">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="756" type="java.util.HashSet">
<item id="757" type="com.j2fe.workflow.definition.Transition">
<name id="758">goto-next</name>
<source id="759">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="760"/>
<directJoin>false</directJoin>
<name id="761">Add MHBK Guarantor to IOI</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="762">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="763" type="java.util.HashSet">
<item id="764" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="765">["sqlSelect"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="766">input["sqlSelect"]</name>
<stringValue id="767">sqlGtorSelect</stringValue>
<type>VARIABLE</type>
</item>
<item id="768" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="769">name</name>
<stringValue id="770">RealMessageProcessing</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="771" type="java.util.HashSet">
<item id="772" type="com.j2fe.workflow.definition.Transition">
<name id="773">goto-next</name>
<source id="774">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="775"/>
<directJoin>false</directJoin>
<name id="776">Build SQL Select GTOR MHI/MHEU</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="777">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="778" type="java.util.HashSet">
<item id="779" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="780">statements</name>
<objectValue id="781" type="java.lang.String">String sqlGtorSelect = "SELECT '&lt;!DOCTYPE STREET_REF SYSTEM \"fti://repository/dtd/STREET_REF\"&gt;' || XMLElement(NAME \"STREET_REF\",XMLAttributes( 'GUEST' AS \"USERID\"), ";&#13;
sqlGtorSelect = sqlGtorSelect  + "XMLElement(NAME \"HEADER\", XMLElement(NAME \"USERID\", XMLAttributes( '"  + userName + "' AS \"VALUE\")), XMLElement(NAME \"MAIN_ENTITY_TBL_TYP\", XMLAttributes( 'ISSR' AS \"VALUE\"))),";&#13;
sqlGtorSelect = sqlGtorSelect  + "XMLElement(NAME \"SEGMENT\", XMLAttributes( 'Issuer' AS \"TYPE\", 'REFERENCE' AS \"ACTION\"), ";&#13;
sqlGtorSelect = sqlGtorSelect  + "XMLElement(NAME \"Issuer\", XMLElement(NAME \"INSTRISSRID\", XMLAttributes( RTRIM(ft_t_issr.instr_issr_id) AS \"VALUE\")))), ";&#13;
sqlGtorSelect = sqlGtorSelect  + "XMLElement(NAME \"SEGMENT\", XMLAttributes( 'ISSRIssuerGroupParticipant' AS \"TYPE\", 'UNKNOWN' AS \"ACTION\"), XMLElement(NAME \"ISSRIssuerGroupParticipant\", ";&#13;
sqlGtorSelect = sqlGtorSelect  + "XMLElement(NAME \"PRNTISSRGRPOID\", XMLAttributes( 'IRGR000026' AS \"VALUE\")), XMLElement(NAME \"PRTPURPTYP\", XMLAttributes( 'INTEREST' AS \"VALUE\"))";&#13;
sqlGtorSelect = sqlGtorSelect  + "))) FROM ft_t_issr where FINS_INST_MNEM in (";&#13;
sqlGtorSelect = sqlGtorSelect  + "  select INST_MNEM from FT_T_FINR where (END_TMS is null or END_TMS &gt; SYSDATE()) and INST_MNEM in (";&#13;
sqlGtorSelect = sqlGtorSelect  + "    select INST_MNEM from ft_t_frip where (END_TMS is null or END_TMS &gt; SYSDATE()) and PRT_PURP_TYP = 'GUARANTR'  and INSTR_ID = '" + instrId + "'))";&#13;
sqlGtorSelect = sqlGtorSelect  + "and INSTR_ISSR_ID not in (select INSTR_ISSR_ID from ft_t_irgp where PRNT_ISSR_GRP_OID = 'IRGR000026' and PRT_PURP_TYP = 'INTEREST' and END_TMS is null)";</objectValue>
<type>CONSTANT</type>
</item>
<item id="782" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="783">variables["instrId"]</name>
<stringValue id="784">instrId</stringValue>
<type>VARIABLE</type>
</item>
<item id="785" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="786">variables["sqlGtorSelect"]</name>
<stringValue id="787">sqlGtorSelect</stringValue>
<type>VARIABLE</type>
</item>
<item id="788" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="789">variables["userName"]</name>
<stringValue id="790">UserName</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="791" type="java.util.HashSet">
<item id="792" type="com.j2fe.workflow.definition.Transition">
<name id="793">rows-found</name>
<source idref="730"/>
<target idref="774"/>
</item>
</sources>
<targets id="794" type="java.util.HashSet">
<item idref="772" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="759"/>
</item>
</sources>
<targets id="795" type="java.util.HashSet">
<item idref="757" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="752"/>
</item>
<item idref="750" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="796" type="java.util.HashSet">
<item id="797" type="com.j2fe.workflow.definition.Transition">
<name id="798">goto-next</name>
<source idref="752"/>
<target id="799">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="800"/>
<directJoin>false</directJoin>
<name id="801">get gtor not in MBE IOI</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="802">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="803" type="java.util.HashSet">
<item id="804" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="805">database</name>
<stringValue id="806">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="807" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="808">firstColumnsResult</name>
<stringValue id="809">GtorId</stringValue>
<type>VARIABLE</type>
</item>
<item id="810" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="811">[0]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="812">indexedParameters[0]</name>
<stringValue id="813">instrId</stringValue>
<type>VARIABLE</type>
</item>
<item id="814" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="815">querySQL</name>
<stringValue id="816">select instr_issr_id from ft_t_issr where FINS_INST_MNEM in (&#13;
  select INST_MNEM from FT_T_FINR where (END_TMS is null or END_TMS &gt; sysdate()) and INST_MNEM in (&#13;
    select INST_MNEM from ft_t_frip where (END_TMS is null or END_TMS &gt; sysdate()) and PRT_PURP_TYP = 'GUARANTR'  and INSTR_ID = ? &#13;
      and INSTR_ID in (select instr_id from FT_T_ISGP where END_TMS is null and PRNT_ISS_GRP_OID in (select iss_grp_oid from ft_t_isgr where end_tms is null and org_id in ('MBE'))&#13;
      and PRNT_ISS_GRP_OID in (select ISS_GRP_OID from ft_t_isgr where GRP_PURP_TYP = 'INTEREST'))))&#13;
and INSTR_ISSR_ID not in (select INSTR_ISSR_ID from ft_t_irgp where PRNT_ISSR_GRP_OID = 'IRGR000036' and PRT_PURP_TYP = 'INTEREST' and END_TMS is null)</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="817" type="java.util.HashSet">
<item idref="797" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="818" type="java.util.HashSet">
<item id="819" type="com.j2fe.workflow.definition.Transition">
<name id="820">nothing-found</name>
<source idref="799"/>
<target id="821">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="822">Automatically generated</description>
<directJoin>false</directJoin>
<name id="823">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="824">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="825" type="java.util.HashSet">
<item id="826" type="com.j2fe.workflow.definition.Transition">
<name id="827">goto-next</name>
<source id="828">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="829"/>
<directJoin>false</directJoin>
<name id="830">Add MBE Guarantor to IOI</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="831">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="832" type="java.util.HashSet">
<item id="833" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="834">["sqlSelect"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="835">input["sqlSelect"]</name>
<stringValue id="836">sqlGtorSelect</stringValue>
<type>VARIABLE</type>
</item>
<item id="837" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="838">name</name>
<stringValue id="839">RealMessageProcessing</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="840" type="java.util.HashSet">
<item id="841" type="com.j2fe.workflow.definition.Transition">
<name id="842">goto-next</name>
<source id="843">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="844"/>
<directJoin>false</directJoin>
<name id="845">Build SQL Select GTOR MHI/MHEU</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="846">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="847" type="java.util.HashSet">
<item id="848" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="849">statements</name>
<objectValue id="850" type="java.lang.String">String sqlGtorSelect = "SELECT '&lt;!DOCTYPE STREET_REF SYSTEM \"fti://repository/dtd/STREET_REF\"&gt;' || XMLElement(NAME \"STREET_REF\",XMLAttributes( 'GUEST' AS \"USERID\"), ";&#13;
sqlGtorSelect = sqlGtorSelect  + "XMLElement(NAME \"HEADER\", XMLElement(NAME \"USERID\", XMLAttributes( '"  + userName + "' AS \"VALUE\")), XMLElement(NAME \"MAIN_ENTITY_TBL_TYP\", XMLAttributes( 'ISSR' AS \"VALUE\"))),";&#13;
sqlGtorSelect = sqlGtorSelect  + "XMLElement(NAME \"SEGMENT\", XMLAttributes( 'Issuer' AS \"TYPE\", 'REFERENCE' AS \"ACTION\"), ";&#13;
sqlGtorSelect = sqlGtorSelect  + "XMLElement(NAME \"Issuer\", XMLElement(NAME \"INSTRISSRID\", XMLAttributes( RTRIM(ft_t_issr.instr_issr_id) AS \"VALUE\")))), ";&#13;
sqlGtorSelect = sqlGtorSelect  + "XMLElement(NAME \"SEGMENT\", XMLAttributes( 'ISSRIssuerGroupParticipant' AS \"TYPE\", 'UNKNOWN' AS \"ACTION\"), XMLElement(NAME \"ISSRIssuerGroupParticipant\", ";&#13;
sqlGtorSelect = sqlGtorSelect  + "XMLElement(NAME \"PRNTISSRGRPOID\", XMLAttributes( 'IRGR000036' AS \"VALUE\")), XMLElement(NAME \"PRTPURPTYP\", XMLAttributes( 'INTEREST' AS \"VALUE\"))";&#13;
sqlGtorSelect = sqlGtorSelect  + "))) FROM ft_t_issr where FINS_INST_MNEM in (";&#13;
sqlGtorSelect = sqlGtorSelect  + "  select INST_MNEM from FT_T_FINR where (END_TMS is null or END_TMS &gt; SYSDATE()) and INST_MNEM in (";&#13;
sqlGtorSelect = sqlGtorSelect  + "    select INST_MNEM from ft_t_frip where (END_TMS is null or END_TMS &gt; SYSDATE()) and PRT_PURP_TYP = 'GUARANTR'  and INSTR_ID = '" + instrId + "'))";&#13;
sqlGtorSelect = sqlGtorSelect  + "and INSTR_ISSR_ID not in (select INSTR_ISSR_ID from ft_t_irgp where PRNT_ISSR_GRP_OID = 'IRGR000036' and PRT_PURP_TYP = 'INTEREST' and END_TMS is null)";</objectValue>
<type>CONSTANT</type>
</item>
<item id="851" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="852">variables["instrId"]</name>
<stringValue id="853">instrId</stringValue>
<type>VARIABLE</type>
</item>
<item id="854" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="855">variables["sqlGtorSelect"]</name>
<stringValue id="856">sqlGtorSelect</stringValue>
<type>VARIABLE</type>
</item>
<item id="857" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="858">variables["userName"]</name>
<stringValue id="859">UserName</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="860" type="java.util.HashSet">
<item id="861" type="com.j2fe.workflow.definition.Transition">
<name id="862">rows-found</name>
<source idref="799"/>
<target idref="843"/>
</item>
</sources>
<targets id="863" type="java.util.HashSet">
<item idref="841" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="828"/>
</item>
</sources>
<targets id="864" type="java.util.HashSet">
<item idref="826" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="821"/>
</item>
<item idref="819" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="865" type="java.util.HashSet">
<item id="866" type="com.j2fe.workflow.definition.Transition">
<name id="867">goto-next</name>
<source idref="821"/>
<target id="868">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="869"/>
<directJoin>false</directJoin>
<name id="870">get UP gtor not in MHI/MHEU IOI</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="871">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="872" type="java.util.HashSet">
<item id="873" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="874">database</name>
<stringValue id="875">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="876" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="877">firstColumnsResult</name>
<stringValue id="878">GtorId</stringValue>
<type>VARIABLE</type>
</item>
<item id="879" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="880">[0]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="881">indexedParameters[0]</name>
<stringValue id="882">instrId</stringValue>
<type>VARIABLE</type>
</item>
<item id="883" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="884">querySQL</name>
<stringValue id="885">select instr_issr_id from ft_t_issr where FINS_INST_MNEM in (&#13;
  select INST_MNEM from FT_T_FINR where (END_TMS is null or END_TMS &gt; sysdate()) and INST_MNEM in (&#13;
    select mhi_fins_up(INST_MNEM) from ft_t_frip where (END_TMS is null or END_TMS &gt; sysdate()) and PRT_PURP_TYP = 'GUARANTR'  and INSTR_ID = ? &#13;
      and INSTR_ID in (select instr_id from FT_T_ISGP where END_TMS is null and PRNT_ISS_GRP_OID in (select iss_grp_oid from ft_t_isgr where end_tms is null and org_id in ('MHI','MHEU'))&#13;
      and PRNT_ISS_GRP_OID in (select ISS_GRP_OID from ft_t_isgr where GRP_PURP_TYP = 'INTEREST'))))&#13;
and INSTR_ISSR_ID not in (select INSTR_ISSR_ID from ft_t_irgp where PRNT_ISSR_GRP_OID = 'IRGR000006' and PRT_PURP_TYP = 'INTEREST' and END_TMS is null)</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="886" type="java.util.HashSet">
<item idref="866" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="887" type="java.util.HashSet">
<item id="888" type="com.j2fe.workflow.definition.Transition">
<name id="889">nothing-found</name>
<source idref="868"/>
<target id="890">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="891">Automatically generated</description>
<directJoin>false</directJoin>
<name id="892">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="893">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="894" type="java.util.HashSet">
<item id="895" type="com.j2fe.workflow.definition.Transition">
<name id="896">goto-next</name>
<source id="897">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="898"/>
<directJoin>false</directJoin>
<name id="899">Add UP MHI/MHEU Guarantor to IOI</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="900">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="901" type="java.util.HashSet">
<item id="902" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="903">["sqlSelect"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="904">input["sqlSelect"]</name>
<stringValue id="905">sqlGtorSelect</stringValue>
<type>VARIABLE</type>
</item>
<item id="906" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="907">name</name>
<stringValue id="908">RealMessageProcessing</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="909" type="java.util.HashSet">
<item id="910" type="com.j2fe.workflow.definition.Transition">
<name id="911">goto-next</name>
<source id="912">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="913"/>
<directJoin>false</directJoin>
<name id="914">Build SQL Select UP GTOR MHI/MHEU</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="915">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="916" type="java.util.HashSet">
<item id="917" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="918">statements</name>
<objectValue id="919" type="java.lang.String">String sqlGtorSelect = "SELECT '&lt;!DOCTYPE STREET_REF SYSTEM \"fti://repository/dtd/STREET_REF\"&gt;' || XMLElement(NAME \"STREET_REF\",XMLAttributes( 'GUEST' AS \"USERID\"), ";&#13;
sqlGtorSelect = sqlGtorSelect  + "XMLElement(NAME \"HEADER\", XMLElement(NAME \"USERID\", XMLAttributes( '"  + userName + "' AS \"VALUE\")), XMLElement(NAME \"MAIN_ENTITY_TBL_TYP\", XMLAttributes( 'ISSR' AS \"VALUE\"))),";&#13;
sqlGtorSelect = sqlGtorSelect  + "XMLElement(NAME \"SEGMENT\", XMLAttributes( 'Issuer' AS \"TYPE\", 'REFERENCE' AS \"ACTION\"), ";&#13;
sqlGtorSelect = sqlGtorSelect  + "XMLElement(NAME \"Issuer\", XMLElement(NAME \"INSTRISSRID\", XMLAttributes( RTRIM(ft_t_issr.instr_issr_id) AS \"VALUE\")))), ";&#13;
sqlGtorSelect = sqlGtorSelect  + "XMLElement(NAME \"SEGMENT\", XMLAttributes( 'ISSRIssuerGroupParticipant' AS \"TYPE\", 'UNKNOWN' AS \"ACTION\"), XMLElement(NAME \"ISSRIssuerGroupParticipant\", ";&#13;
sqlGtorSelect = sqlGtorSelect  + "XMLElement(NAME \"PRNTISSRGRPOID\", XMLAttributes( 'IRGR000006' AS \"VALUE\")), XMLElement(NAME \"PRTPURPTYP\", XMLAttributes( 'INTEREST' AS \"VALUE\"))";&#13;
sqlGtorSelect = sqlGtorSelect  + "))) FROM ft_t_issr where FINS_INST_MNEM in (";&#13;
sqlGtorSelect = sqlGtorSelect  + "  select mhi_fins_up(INST_MNEM) from FT_T_FINR where (END_TMS is null or END_TMS &gt; SYSDATE()) and INST_MNEM in (";&#13;
sqlGtorSelect = sqlGtorSelect  + "    select INST_MNEM from ft_t_frip where (END_TMS is null or END_TMS &gt; SYSDATE()) and PRT_PURP_TYP = 'GUARANTR'  and INSTR_ID = '" + instrId + "'))";&#13;
sqlGtorSelect = sqlGtorSelect  + "and INSTR_ISSR_ID not in (select INSTR_ISSR_ID from ft_t_irgp where PRNT_ISSR_GRP_OID = 'IRGR000006' and PRT_PURP_TYP = 'INTEREST' and END_TMS is null)";</objectValue>
<type>CONSTANT</type>
</item>
<item id="920" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="921">variables["instrId"]</name>
<stringValue id="922">instrId</stringValue>
<type>VARIABLE</type>
</item>
<item id="923" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="924">variables["sqlGtorSelect"]</name>
<stringValue id="925">sqlGtorSelect</stringValue>
<type>VARIABLE</type>
</item>
<item id="926" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="927">variables["userName"]</name>
<stringValue id="928">UserName</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="929" type="java.util.HashSet">
<item id="930" type="com.j2fe.workflow.definition.Transition">
<name id="931">rows-found</name>
<source idref="868"/>
<target idref="912"/>
</item>
</sources>
<targets id="932" type="java.util.HashSet">
<item idref="910" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="897"/>
</item>
</sources>
<targets id="933" type="java.util.HashSet">
<item idref="895" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="890"/>
</item>
<item idref="888" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="934" type="java.util.HashSet">
<item id="935" type="com.j2fe.workflow.definition.Transition">
<name id="936">ToSplit</name>
<source idref="890"/>
<target id="937">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="938"/>
<directJoin>false</directJoin>
<name id="939">get UP gtor not in MHSS IOI</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="940">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="941" type="java.util.HashSet">
<item id="942" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="943">database</name>
<stringValue id="944">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="945" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="946">firstColumnsResult</name>
<stringValue id="947">GtorId</stringValue>
<type>VARIABLE</type>
</item>
<item id="948" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="949">[0]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="950">indexedParameters[0]</name>
<stringValue id="951">instrId</stringValue>
<type>VARIABLE</type>
</item>
<item id="952" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="953">querySQL</name>
<stringValue id="954">select instr_issr_id from ft_t_issr where FINS_INST_MNEM in (&#13;
  select INST_MNEM from FT_T_FINR where (END_TMS is null or END_TMS &gt; sysdate()) and INST_MNEM in (&#13;
    select mhi_fins_up(INST_MNEM) from ft_t_frip where (END_TMS is null or END_TMS &gt; sysdate()) and PRT_PURP_TYP = 'GUARANTR'  and INSTR_ID = ? &#13;
      and INSTR_ID in (select instr_id from FT_T_ISGP where END_TMS is null and PRNT_ISS_GRP_OID in (select iss_grp_oid from ft_t_isgr where end_tms is null and org_id in ('MHSS'))&#13;
      and PRNT_ISS_GRP_OID in (select ISS_GRP_OID from ft_t_isgr where GRP_PURP_TYP = 'INTEREST'))))&#13;
and INSTR_ISSR_ID not in (select INSTR_ISSR_ID from ft_t_irgp where PRNT_ISSR_GRP_OID = 'IRGR000016' and PRT_PURP_TYP = 'INTEREST' and END_TMS is null)</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="955" type="java.util.HashSet">
<item idref="935" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="956" type="java.util.HashSet">
<item id="957" type="com.j2fe.workflow.definition.Transition">
<name id="958">nothing-found</name>
<source idref="937"/>
<target id="959">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="960">Automatically generated</description>
<directJoin>false</directJoin>
<name id="961">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="962">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="963" type="java.util.HashSet">
<item id="964" type="com.j2fe.workflow.definition.Transition">
<name id="965">goto-next</name>
<source id="966">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="967"/>
<directJoin>false</directJoin>
<name id="968">Add UP MHSS Guarantor to IOI</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="969">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="970" type="java.util.HashSet">
<item id="971" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="972">["sqlSelect"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="973">input["sqlSelect"]</name>
<stringValue id="974">sqlGtorSelect</stringValue>
<type>VARIABLE</type>
</item>
<item id="975" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="976">name</name>
<stringValue id="977">RealMessageProcessing</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="978" type="java.util.HashSet">
<item id="979" type="com.j2fe.workflow.definition.Transition">
<name id="980">goto-next</name>
<source id="981">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="982"/>
<directJoin>false</directJoin>
<name id="983">Build SQL Select UP GTOR MHSS</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="984">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="985" type="java.util.HashSet">
<item id="986" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="987">statements</name>
<objectValue id="988" type="java.lang.String">String sqlGtorSelect = "SELECT '&lt;!DOCTYPE STREET_REF SYSTEM \"fti://repository/dtd/STREET_REF\"&gt;' || xmlelement(NAME \"STREET_REF\",xmlattributes( 'GUEST' AS \"USERID\"), ";&#13;
sqlGtorSelect = sqlGtorSelect  + "xmlelement(NAME \"HEADER\", xmlelement(NAME \"USERID\", xmlattributes( '"  + userName + "' AS \"VALUE\")), xmlelement(NAME \"MAIN_ENTITY_TBL_TYP\", xmlattributes( 'ISSR' AS \"VALUE\"))),";&#13;
sqlGtorSelect = sqlGtorSelect  + "xmlelement(NAME \"SEGMENT\", xmlattributes( 'Issuer' AS \"TYPE\", 'REFERENCE' AS \"ACTION\"), ";&#13;
sqlGtorSelect = sqlGtorSelect  + "xmlelement(NAME \"Issuer\", xmlelement(NAME \"INSTRISSRID\", xmlattributes( RTRIM(ft_t_issr.instr_issr_id) AS \"VALUE\")))), ";&#13;
sqlGtorSelect = sqlGtorSelect  + "xmlelement(NAME \"SEGMENT\", xmlattributes( 'ISSRIssuerGroupParticipant' AS \"TYPE\", 'UNKNOWN' AS \"ACTION\"), xmlelement(NAME \"ISSRIssuerGroupParticipant\", ";&#13;
sqlGtorSelect = sqlGtorSelect  + "xmlelement(NAME \"PRNTISSRGRPOID\", xmlattributes( 'IRGR000016' AS \"VALUE\")), xmlelement(NAME \"PRTPURPTYP\", xmlattributes( 'INTEREST' AS \"VALUE\"))";&#13;
sqlGtorSelect = sqlGtorSelect  + "))) FROM ft_t_issr where FINS_INST_MNEM in (";&#13;
sqlGtorSelect = sqlGtorSelect  + "  select mhi_fins_up(INST_MNEM) from FT_T_FINR where (END_TMS is null or END_TMS &gt; SYSDATE()) and INST_MNEM in (";&#13;
sqlGtorSelect = sqlGtorSelect  + "    select INST_MNEM from ft_t_frip where (END_TMS is null or END_TMS &gt; SYSDATE()) and PRT_PURP_TYP = 'GUARANTR'  and INSTR_ID = '" + instrId + "'))";&#13;
sqlGtorSelect = sqlGtorSelect  + "and INSTR_ISSR_ID not in (select INSTR_ISSR_ID from ft_t_irgp where PRNT_ISSR_GRP_OID = 'IRGR000016' and PRT_PURP_TYP = 'INTEREST' and END_TMS is null)";</objectValue>
<type>CONSTANT</type>
</item>
<item id="989" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="990">variables["instrId"]</name>
<stringValue id="991">instrId</stringValue>
<type>VARIABLE</type>
</item>
<item id="992" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="993">variables["sqlGtorSelect"]</name>
<stringValue id="994">sqlGtorSelect</stringValue>
<type>VARIABLE</type>
</item>
<item id="995" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="996">variables["userName"]</name>
<stringValue id="997">UserName</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="998" type="java.util.HashSet">
<item id="999" type="com.j2fe.workflow.definition.Transition">
<name id="1000">rows-found</name>
<source idref="937"/>
<target idref="981"/>
</item>
</sources>
<targets id="1001" type="java.util.HashSet">
<item idref="979" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="966"/>
</item>
</sources>
<targets id="1002" type="java.util.HashSet">
<item idref="964" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="959"/>
</item>
<item idref="957" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1003" type="java.util.HashSet">
<item id="1004" type="com.j2fe.workflow.definition.Transition">
<name id="1005">goto-next</name>
<source idref="959"/>
<target id="1006">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="1007"/>
<directJoin>false</directJoin>
<name id="1008">get UP gtor not in MHBK IOI</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="1009">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="1010" type="java.util.HashSet">
<item id="1011" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1012">database</name>
<stringValue id="1013">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="1014" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="1015">firstColumnsResult</name>
<stringValue id="1016">GtorId</stringValue>
<type>VARIABLE</type>
</item>
<item id="1017" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="1018">[0]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="1019">indexedParameters[0]</name>
<stringValue id="1020">instrId</stringValue>
<type>VARIABLE</type>
</item>
<item id="1021" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1022">querySQL</name>
<stringValue id="1023">select instr_issr_id from ft_t_issr where FINS_INST_MNEM in (&#13;
  select INST_MNEM from FT_T_FINR where (END_TMS is null or END_TMS &gt; sysdate()) and INST_MNEM in (&#13;
    select mhi_fins_up(INST_MNEM) from ft_t_frip where (END_TMS is null or END_TMS &gt; sysdate()) and PRT_PURP_TYP = 'GUARANTR'  and INSTR_ID = ? &#13;
      and INSTR_ID in (select instr_id from FT_T_ISGP where END_TMS is null and PRNT_ISS_GRP_OID in (select iss_grp_oid from ft_t_isgr where end_tms is null and org_id in ('MHBK'))&#13;
      and PRNT_ISS_GRP_OID in (select ISS_GRP_OID from ft_t_isgr where GRP_PURP_TYP = 'INTEREST'))))&#13;
and INSTR_ISSR_ID not in (select INSTR_ISSR_ID from ft_t_irgp where PRNT_ISSR_GRP_OID = 'IRGR000026' and PRT_PURP_TYP = 'INTEREST' and END_TMS is null)</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1024" type="java.util.HashSet">
<item idref="1004" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1025" type="java.util.HashSet">
<item id="1026" type="com.j2fe.workflow.definition.Transition">
<name id="1027">nothing-found</name>
<source idref="1006"/>
<target id="1028">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="1029">Automatically generated</description>
<directJoin>false</directJoin>
<name id="1030">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="1031">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="1032" type="java.util.HashSet">
<item id="1033" type="com.j2fe.workflow.definition.Transition">
<name id="1034">goto-next</name>
<source id="1035">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="1036"/>
<directJoin>false</directJoin>
<name id="1037">Add UP MHBK Guarantor to IOI</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="1038">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="1039" type="java.util.HashSet">
<item id="1040" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="1041">["sqlSelect"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="1042">input["sqlSelect"]</name>
<stringValue id="1043">sqlGtorSelect</stringValue>
<type>VARIABLE</type>
</item>
<item id="1044" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1045">name</name>
<stringValue id="1046">RealMessageProcessing</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1047" type="java.util.HashSet">
<item id="1048" type="com.j2fe.workflow.definition.Transition">
<name id="1049">goto-next</name>
<source id="1050">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="1051"/>
<directJoin>false</directJoin>
<name id="1052">Build SQL Select UP GTOR MHBK</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="1053">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="1054" type="java.util.HashSet">
<item id="1055" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1056">statements</name>
<objectValue id="1057" type="java.lang.String">String sqlGtorSelect = "SELECT '&lt;!DOCTYPE STREET_REF SYSTEM \"fti://repository/dtd/STREET_REF\"&gt;' || xmlelement(NAME \"STREET_REF\",xmlattributes( 'GUEST' AS \"USERID\"), ";&#13;
sqlGtorSelect = sqlGtorSelect  + "xmlelement(NAME \"HEADER\", xmlelement(NAME \"USERID\", xmlattributes( '"  + userName + "' AS \"VALUE\")), xmlelement(NAME \"MAIN_ENTITY_TBL_TYP\", xmlattributes( 'ISSR' AS \"VALUE\"))),";&#13;
sqlGtorSelect = sqlGtorSelect  + "xmlelement(NAME \"SEGMENT\", xmlattributes( 'Issuer' AS \"TYPE\", 'REFERENCE' AS \"ACTION\"), ";&#13;
sqlGtorSelect = sqlGtorSelect  + "xmlelement(NAME \"Issuer\", xmlelement(NAME \"INSTRISSRID\", xmlattributes( RTRIM(ft_t_issr.instr_issr_id) AS \"VALUE\")))), ";&#13;
sqlGtorSelect = sqlGtorSelect  + "xmlelement(NAME \"SEGMENT\", xmlattributes( 'ISSRIssuerGroupParticipant' AS \"TYPE\", 'UNKNOWN' AS \"ACTION\"), xmlelement(NAME \"ISSRIssuerGroupParticipant\", ";&#13;
sqlGtorSelect = sqlGtorSelect  + "xmlelement(NAME \"PRNTISSRGRPOID\", xmlattributes( 'IRGR000026' AS \"VALUE\")), xmlelement(NAME \"PRTPURPTYP\", xmlattributes( 'INTEREST' AS \"VALUE\"))";&#13;
sqlGtorSelect = sqlGtorSelect  + "))) FROM ft_t_issr where FINS_INST_MNEM in (";&#13;
sqlGtorSelect = sqlGtorSelect  + "  select mhi_fins_up(INST_MNEM) from FT_T_FINR where (END_TMS is null or END_TMS &gt; SYSDATE()) and INST_MNEM in (";&#13;
sqlGtorSelect = sqlGtorSelect  + "    select INST_MNEM from ft_t_frip where (END_TMS is null or END_TMS &gt; SYSDATE()) and PRT_PURP_TYP = 'GUARANTR'  and INSTR_ID = '" + instrId + "'))";&#13;
sqlGtorSelect = sqlGtorSelect  + "and INSTR_ISSR_ID not in (select INSTR_ISSR_ID from ft_t_irgp where PRNT_ISSR_GRP_OID = 'IRGR000026' and PRT_PURP_TYP = 'INTEREST' and END_TMS is null)";</objectValue>
<type>CONSTANT</type>
</item>
<item id="1058" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1059">variables["instrId"]</name>
<stringValue id="1060">instrId</stringValue>
<type>VARIABLE</type>
</item>
<item id="1061" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="1062">variables["sqlGtorSelect"]</name>
<stringValue id="1063">sqlGtorSelect</stringValue>
<type>VARIABLE</type>
</item>
<item id="1064" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1065">variables["userName"]</name>
<stringValue id="1066">UserName</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="1067" type="java.util.HashSet">
<item id="1068" type="com.j2fe.workflow.definition.Transition">
<name id="1069">rows-found</name>
<source idref="1006"/>
<target idref="1050"/>
</item>
</sources>
<targets id="1070" type="java.util.HashSet">
<item idref="1048" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="1035"/>
</item>
</sources>
<targets id="1071" type="java.util.HashSet">
<item idref="1033" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="1028"/>
</item>
<item idref="1026" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1072" type="java.util.HashSet">
<item id="1073" type="com.j2fe.workflow.definition.Transition">
<name id="1074">goto-next</name>
<source idref="1028"/>
<target id="1075">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="1076"/>
<directJoin>false</directJoin>
<name id="1077">get UP gtor not in MBE IOI</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="1078">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="1079" type="java.util.HashSet">
<item id="1080" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1081">database</name>
<stringValue id="1082">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="1083" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="1084">firstColumnsResult</name>
<stringValue id="1085">GtorId</stringValue>
<type>VARIABLE</type>
</item>
<item id="1086" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="1087">[0]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="1088">indexedParameters[0]</name>
<stringValue id="1089">instrId</stringValue>
<type>VARIABLE</type>
</item>
<item id="1090" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1091">querySQL</name>
<stringValue id="1092">select instr_issr_id from ft_t_issr where FINS_INST_MNEM in (&#13;
  select INST_MNEM from FT_T_FINR where (END_TMS is null or END_TMS &gt; sysdate()) and INST_MNEM in (&#13;
    select mhi_fins_up(INST_MNEM) from ft_t_frip where (END_TMS is null or END_TMS &gt; sysdate()) and PRT_PURP_TYP = 'GUARANTR'  and INSTR_ID = ? &#13;
      and INSTR_ID in (select instr_id from FT_T_ISGP where END_TMS is null and PRNT_ISS_GRP_OID in (select iss_grp_oid from ft_t_isgr where end_tms is null and org_id in ('MBE'))&#13;
      and PRNT_ISS_GRP_OID in (select ISS_GRP_OID from ft_t_isgr where GRP_PURP_TYP = 'INTEREST'))))&#13;
and INSTR_ISSR_ID not in (select INSTR_ISSR_ID from ft_t_irgp where PRNT_ISSR_GRP_OID = 'IRGR000036' and PRT_PURP_TYP = 'INTEREST' and END_TMS is null)</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1093" type="java.util.HashSet">
<item idref="1073" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1094" type="java.util.HashSet">
<item id="1095" type="com.j2fe.workflow.definition.Transition">
<name id="1096">nothing-found</name>
<source idref="1075"/>
<target id="1097">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="1098">Automatically generated</description>
<directJoin>false</directJoin>
<name id="1099">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="1100">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="1101" type="java.util.HashSet">
<item id="1102" type="com.j2fe.workflow.definition.Transition">
<name id="1103">goto-next</name>
<source id="1104">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="1105"/>
<directJoin>false</directJoin>
<name id="1106">Add UP MBE Guarantor to IOI</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="1107">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="1108" type="java.util.HashSet">
<item id="1109" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="1110">["sqlSelect"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="1111">input["sqlSelect"]</name>
<stringValue id="1112">sqlGtorSelect</stringValue>
<type>VARIABLE</type>
</item>
<item id="1113" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1114">name</name>
<stringValue id="1115">RealMessageProcessing</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="1116" type="java.util.HashSet">
<item id="1117" type="com.j2fe.workflow.definition.Transition">
<name id="1118">goto-next</name>
<source id="1119">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="1120"/>
<directJoin>false</directJoin>
<name id="1121">Build SQL Select UP GTOR MBE</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="1122">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="1123" type="java.util.HashSet">
<item id="1124" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1125">statements</name>
<objectValue id="1126" type="java.lang.String">String sqlGtorSelect = "SELECT '&lt;!DOCTYPE STREET_REF SYSTEM \"fti://repository/dtd/STREET_REF\"&gt;' || xmlelement(NAME \"STREET_REF\",xmlattributes( 'GUEST' AS \"USERID\"), ";&#13;
sqlGtorSelect = sqlGtorSelect  + "xmlelement(NAME \"HEADER\", xmlelement(NAME \"USERID\", xmlattributes( '"  + userName + "' AS \"VALUE\")), xmlelement(NAME \"MAIN_ENTITY_TBL_TYP\", xmlattributes( 'ISSR' AS \"VALUE\"))),";&#13;
sqlGtorSelect = sqlGtorSelect  + "xmlelement(NAME \"SEGMENT\", xmlattributes( 'Issuer' AS \"TYPE\", 'REFERENCE' AS \"ACTION\"), ";&#13;
sqlGtorSelect = sqlGtorSelect  + "xmlelement(NAME \"Issuer\", xmlelement(NAME \"INSTRISSRID\", xmlattributes( RTRIM(ft_t_issr.instr_issr_id) AS \"VALUE\")))), ";&#13;
sqlGtorSelect = sqlGtorSelect  + "xmlelement(NAME \"SEGMENT\", xmlattributes( 'ISSRIssuerGroupParticipant' AS \"TYPE\", 'UNKNOWN' AS \"ACTION\"), xmlelement(NAME \"ISSRIssuerGroupParticipant\", ";&#13;
sqlGtorSelect = sqlGtorSelect  + "xmlelement(NAME \"PRNTISSRGRPOID\", xmlattributes( 'IRGR000036' AS \"VALUE\")), xmlelement(NAME \"PRTPURPTYP\", xmlattributes( 'INTEREST' AS \"VALUE\"))";&#13;
sqlGtorSelect = sqlGtorSelect  + "))) FROM ft_t_issr where FINS_INST_MNEM in (";&#13;
sqlGtorSelect = sqlGtorSelect  + "  select mhi_fins_up(INST_MNEM) from FT_T_FINR where (END_TMS is null or END_TMS &gt; SYSDATE()) and INST_MNEM in (";&#13;
sqlGtorSelect = sqlGtorSelect  + "    select INST_MNEM from ft_t_frip where (END_TMS is null or END_TMS &gt; SYSDATE()) and PRT_PURP_TYP = 'GUARANTR'  and INSTR_ID = '" + instrId + "'))";&#13;
sqlGtorSelect = sqlGtorSelect  + "and INSTR_ISSR_ID not in (select INSTR_ISSR_ID from ft_t_irgp where PRNT_ISSR_GRP_OID = 'IRGR000036' and PRT_PURP_TYP = 'INTEREST' and END_TMS is null)";</objectValue>
<type>CONSTANT</type>
</item>
<item id="1127" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1128">variables["instrId"]</name>
<stringValue id="1129">instrId</stringValue>
<type>VARIABLE</type>
</item>
<item id="1130" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="1131">variables["sqlGtorSelect"]</name>
<stringValue id="1132">sqlGtorSelect</stringValue>
<type>VARIABLE</type>
</item>
<item id="1133" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="1134">variables["userName"]</name>
<stringValue id="1135">UserName</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="1136" type="java.util.HashSet">
<item id="1137" type="com.j2fe.workflow.definition.Transition">
<name id="1138">rows-found</name>
<source idref="1075"/>
<target idref="1119"/>
</item>
</sources>
<targets id="1139" type="java.util.HashSet">
<item idref="1117" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="1104"/>
</item>
</sources>
<targets id="1140" type="java.util.HashSet">
<item idref="1102" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="1097"/>
</item>
<item idref="1095" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1141" type="java.util.HashSet">
<item id="1142" type="com.j2fe.workflow.definition.Transition">
<name id="1143">goto-next</name>
<source idref="1097"/>
<target idref="3"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item idref="1137" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</target>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item idref="1068" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</target>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item idref="999" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</target>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item idref="930" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</target>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item idref="861" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</target>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item idref="792" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</target>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item idref="723" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</target>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item idref="654" type="com.j2fe.workflow.definition.Transition"/>
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
<item idref="266" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</target>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item idref="176" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="154"/>
</item>
</sources>
<targets id="1144" type="java.util.HashSet">
<item idref="152" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="140"/>
</item>
</sources>
<targets id="1145" type="java.util.HashSet">
<item idref="138" type="com.j2fe.workflow.definition.Transition"/>
<item idref="206" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="123"/>
</item>
</sources>
<targets id="1146" type="java.util.HashSet">
<item idref="208" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item idref="196" type="com.j2fe.workflow.definition.Transition"/>
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
<item idref="8" type="com.j2fe.workflow.definition.Transition"/>
<item id="1147" type="com.j2fe.workflow.definition.Transition">
<name id="1148">50</name>
<source idref="10"/>
<target idref="3"/>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="3"/>
</item>
<item idref="1147" type="com.j2fe.workflow.definition.Transition"/>
<item idref="1142" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="1149" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="1150">Mizuho</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="1151">user1</lastChangeUser>
<lastUpdate id="1152">2025-11-06T18:00:17.000+0000</lastUpdate>
<name id="1153">WrapperWorkstationInstrumentSub</name>
<nodes id="1154" type="java.util.HashSet">
<item idref="348" type="com.j2fe.workflow.definition.Node"/>
<item idref="422" type="com.j2fe.workflow.definition.Node"/>
<item idref="828" type="com.j2fe.workflow.definition.Node"/>
<item idref="533" type="com.j2fe.workflow.definition.Node"/>
<item idref="570" type="com.j2fe.workflow.definition.Node"/>
<item idref="759" type="com.j2fe.workflow.definition.Node"/>
<item idref="459" type="com.j2fe.workflow.definition.Node"/>
<item idref="496" type="com.j2fe.workflow.definition.Node"/>
<item idref="617" type="com.j2fe.workflow.definition.Node"/>
<item idref="311" type="com.j2fe.workflow.definition.Node"/>
<item idref="690" type="com.j2fe.workflow.definition.Node"/>
<item idref="385" type="com.j2fe.workflow.definition.Node"/>
<item idref="1104" type="com.j2fe.workflow.definition.Node"/>
<item idref="1035" type="com.j2fe.workflow.definition.Node"/>
<item idref="897" type="com.j2fe.workflow.definition.Node"/>
<item idref="966" type="com.j2fe.workflow.definition.Node"/>
<item idref="549" type="com.j2fe.workflow.definition.Node"/>
<item idref="512" type="com.j2fe.workflow.definition.Node"/>
<item idref="475" type="com.j2fe.workflow.definition.Node"/>
<item idref="438" type="com.j2fe.workflow.definition.Node"/>
<item idref="327" type="com.j2fe.workflow.definition.Node"/>
<item idref="290" type="com.j2fe.workflow.definition.Node"/>
<item idref="401" type="com.j2fe.workflow.definition.Node"/>
<item idref="364" type="com.j2fe.workflow.definition.Node"/>
<item idref="843" type="com.j2fe.workflow.definition.Node"/>
<item idref="634" type="com.j2fe.workflow.definition.Node"/>
<item idref="774" type="com.j2fe.workflow.definition.Node"/>
<item idref="705" type="com.j2fe.workflow.definition.Node"/>
<item idref="1119" type="com.j2fe.workflow.definition.Node"/>
<item idref="1050" type="com.j2fe.workflow.definition.Node"/>
<item idref="912" type="com.j2fe.workflow.definition.Node"/>
<item idref="981" type="com.j2fe.workflow.definition.Node"/>
<item idref="27" type="com.j2fe.workflow.definition.Node"/>
<item idref="213" type="com.j2fe.workflow.definition.Node"/>
<item idref="154" type="com.j2fe.workflow.definition.Node"/>
<item idref="87" type="com.j2fe.workflow.definition.Node"/>
<item idref="69" type="com.j2fe.workflow.definition.Node"/>
<item idref="178" type="com.j2fe.workflow.definition.Node"/>
<item idref="272" type="com.j2fe.workflow.definition.Node"/>
<item idref="234" type="com.j2fe.workflow.definition.Node"/>
<item idref="890" type="com.j2fe.workflow.definition.Node"/>
<item idref="1097" type="com.j2fe.workflow.definition.Node"/>
<item idref="683" type="com.j2fe.workflow.definition.Node"/>
<item idref="610" type="com.j2fe.workflow.definition.Node"/>
<item idref="1028" type="com.j2fe.workflow.definition.Node"/>
<item idref="821" type="com.j2fe.workflow.definition.Node"/>
<item idref="201" type="com.j2fe.workflow.definition.Node"/>
<item idref="752" type="com.j2fe.workflow.definition.Node"/>
<item idref="959" type="com.j2fe.workflow.definition.Node"/>
<item idref="241" type="com.j2fe.workflow.definition.Node"/>
<item idref="10" type="com.j2fe.workflow.definition.Node"/>
<item idref="58" type="com.j2fe.workflow.definition.Node"/>
<item idref="3" type="com.j2fe.workflow.definition.Node"/>
<item idref="105" type="com.j2fe.workflow.definition.Node"/>
<item idref="123" type="com.j2fe.workflow.definition.Node"/>
<item idref="47" type="com.j2fe.workflow.definition.Node"/>
<item idref="1075" type="com.j2fe.workflow.definition.Node"/>
<item idref="1006" type="com.j2fe.workflow.definition.Node"/>
<item idref="868" type="com.j2fe.workflow.definition.Node"/>
<item idref="937" type="com.j2fe.workflow.definition.Node"/>
<item idref="799" type="com.j2fe.workflow.definition.Node"/>
<item idref="730" type="com.j2fe.workflow.definition.Node"/>
<item idref="586" type="com.j2fe.workflow.definition.Node"/>
<item idref="661" type="com.j2fe.workflow.definition.Node"/>
<item idref="140" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>false</optimize>
<parameter id="1155" type="java.util.HashMap">
<entry>
<key id="1156" type="java.lang.String">IsrtXpath</key>
<value id="1157" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="1158">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="1159" type="java.lang.String">IssueQueue</key>
<value id="1160" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="1161">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="1162"/>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="1163" type="java.lang.String">Messages</key>
<value id="1164" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="1165">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="1166"/>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="1167" type="java.lang.String">ModelId</key>
<value id="1168" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="1169">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="1170">			</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="1171" type="java.lang.String">Result</key>
<value id="1172" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="1173">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="1174"/>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="1175" type="java.lang.String">TransactionId</key>
<value id="1176" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="1177">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="1178"/>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
</parameter>
<permissions id="1179" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>false</purgeAtEnd>
<retries>0</retries>
<startNode idref="58"/>
<status>RELEASED</status>
<variables id="1180" type="java.util.HashMap">
<entry>
<key id="1181" type="java.lang.String">ISRTOidArr</key>
<value id="1182" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="1183">[Ljava.lang.String;</className>
<clazz>[Ljava.lang.String;</clazz>
<persistent>true</persistent>
</value>
</entry>
<entry>
<key id="1184" type="java.lang.String">IsrtXpath</key>
<value id="1185" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="1186">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="1187" type="java.lang.String">/STREET_REF/SEGMENT[@TYPE="IssueRating"]/IssueRating/ISSRTNGOID/@VALUE</value>
</value>
</entry>
<entry>
<key id="1188" type="java.lang.String">IssueQueue</key>
<value id="1189" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="1190">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="1191"/>
<persistent>false</persistent>
<value id="1192" type="java.lang.String">jms/queue/securityPriority</value>
</value>
</entry>
<entry>
<key id="1193" type="java.lang.String">Messages</key>
<value id="1194" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="1195">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="1196"/>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="1197" type="java.lang.String">ModelId</key>
<value id="1198" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="1199">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="1200">			</description>
<persistent>false</persistent>
<value id="1201" type="java.lang.String">ISSUPUB</value>
</value>
</entry>
<entry>
<key id="1202" type="java.lang.String">Result</key>
<value id="1203" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="1204">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="1205"/>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="1206" type="java.lang.String">TransactionId</key>
<value id="1207" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="1208">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="1209"/>
<persistent>false</persistent>
</value>
</entry>
</variables>
<version>3</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
