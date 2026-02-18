<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.09">
<package-comment/>
<businessobject displayString="23 - Added 0th element in remote node" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>true</alwaysPersist>
<clustered>false</clustered>
<comment id="1">Added 0th element in remote node</comment>
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
<name id="29">Select Severity Code</name>
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
<name id="49">Call Workstation W/F</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="50">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="51" type="java.util.HashSet">
<item id="52" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="53">["IsWorkstationMessage"]@java/lang/Boolean@</UITypeHint>
<input>true</input>
<name id="54">input["IsWorkstationMessage"]</name>
<objectValue id="55" type="java.lang.Boolean">true</objectValue>
<type>CONSTANT</type>
</item>
<item id="56" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="57">["MessageType"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="58">input["MessageType"]</name>
<objectValue id="59" type="java.lang.String">SD</objectValue>
<type>CONSTANT</type>
</item>
<item id="60" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="61">["Messages"]@[Ljava/lang/String;@</UITypeHint>
<input>true</input>
<name id="62">input["Messages"]</name>
<stringValue id="63">Messages</stringValue>
<type>VARIABLE</type>
<variablePart id="64">[0]</variablePart>
</item>
<item id="65" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="66">name</name>
<stringValue id="67">Workstation Workflow</stringValue>
<type>CONSTANT</type>
</item>
<item id="68" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="69">output["Result"]</name>
<stringValue id="70">Result</stringValue>
<type>VARIABLE</type>
</item>
<item id="71" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="72">output["TransactionId"]</name>
<stringValue id="73">TransactionId</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="74" type="java.util.HashSet">
<item id="75" type="com.j2fe.workflow.definition.Transition">
<name id="76">goto-next</name>
<source id="77">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="78"/>
<directJoin>false</directJoin>
<name id="79">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="80">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="81" type="java.util.HashSet"/>
<targets id="82" type="java.util.HashSet">
<item idref="75" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="47"/>
</item>
</sources>
<targets id="83" type="java.util.HashSet">
<item idref="45" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="27"/>
</item>
</sources>
<targets id="84" type="java.util.HashSet">
<item idref="25" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="10"/>
</item>
</sources>
<targets id="85" type="java.util.HashSet">
<item id="86" type="com.j2fe.workflow.definition.Transition">
<name id="87">10</name>
<source idref="10"/>
<target id="88">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="89"/>
<directJoin>false</directJoin>
<name id="90">Get InstrIssrId</name>
<nodeHandler>com.j2fe.workflow.handler.impl.ExecuteXPath</nodeHandler>
<nodeHandlerClass id="91">com.j2fe.workflow.handler.impl.ExecuteXPath</nodeHandlerClass>
<parameters id="92" type="java.util.HashSet">
<item id="93" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="94">inputText</name>
<stringValue id="95">Messages</stringValue>
<type>VARIABLE</type>
<variablePart id="96">[0]</variablePart>
</item>
<item id="97" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="98">outputValues</name>
<stringValue id="99">instrIssrId</stringValue>
<type>VARIABLE</type>
</item>
<item id="100" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="101">xPath</name>
<stringValue id="102">/STREET_REF/SEGMENT[@TYPE="Issuer"]/Issuer/INSTRISSRID/@VALUE</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="103" type="java.util.HashSet">
<item idref="86" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="104" type="java.util.HashSet">
<item id="105" type="com.j2fe.workflow.definition.Transition">
<name id="106">goto-next</name>
<source idref="88"/>
<target id="107">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="108"/>
<directJoin>false</directJoin>
<name id="109">Get ISRT OID</name>
<nodeHandler>com.j2fe.workflow.handler.impl.ExecuteXPath</nodeHandler>
<nodeHandlerClass id="110">com.j2fe.workflow.handler.impl.ExecuteXPath</nodeHandlerClass>
<parameters id="111" type="java.util.HashSet">
<item id="112" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="113">inputText</name>
<stringValue id="114">Messages</stringValue>
<type>VARIABLE</type>
<variablePart id="115">[0]</variablePart>
</item>
<item id="116" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="117">outputValues</name>
<stringValue id="118">IRRTOidArr</stringValue>
<type>VARIABLE</type>
</item>
<item id="119" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="120">xPath</name>
<stringValue id="121">IrrtXpath</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="122" type="java.util.HashSet">
<item idref="105" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="123" type="java.util.HashSet">
<item id="124" type="com.j2fe.workflow.definition.Transition">
<name id="125">goto-next</name>
<source idref="107"/>
<target id="126">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="127"/>
<directJoin>false</directJoin>
<name id="128">Switch Case</name>
<nodeHandler>com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandler>
<nodeHandlerClass id="129">com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandlerClass>
<parameters id="130" type="java.util.HashSet">
<item id="131" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="132">caseItem</name>
<stringValue id="133">IRRTOidArr</stringValue>
<type>VARIABLE</type>
</item>
<item id="134" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="135">defaultItem</name>
<stringValue id="136">1</stringValue>
<type>CONSTANT</type>
</item>
<item id="137" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="138">nullTransition</name>
<stringValue id="139">NULL</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="140" type="java.util.HashSet">
<item idref="124" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="141" type="java.util.HashSet">
<item id="142" type="com.j2fe.workflow.definition.Transition">
<name id="143">1</name>
<source idref="126"/>
<target id="144">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="145"/>
<directJoin>false</directJoin>
<name id="146">Get User</name>
<nodeHandler>com.j2fe.workflow.handler.impl.ExecuteXPath</nodeHandler>
<nodeHandlerClass id="147">com.j2fe.workflow.handler.impl.ExecuteXPath</nodeHandlerClass>
<parameters id="148" type="java.util.HashSet">
<item id="149" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="150">inputText</name>
<stringValue id="151">Messages</stringValue>
<type>VARIABLE</type>
<variablePart id="152">[0]</variablePart>
</item>
<item id="153" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="154">outputValue</name>
<stringValue id="155">UserName</stringValue>
<type>VARIABLE</type>
</item>
<item id="156" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="157">xPath</name>
<stringValue id="158">/STREET_REF/HEADER/USERID/@VALUE</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="159" type="java.util.HashSet">
<item idref="142" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="160" type="java.util.HashSet">
<item id="161" type="com.j2fe.workflow.definition.Transition">
<name id="162">goto-next</name>
<source idref="144"/>
<target id="163">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="164"/>
<directJoin>false</directJoin>
<name id="165">Get Model</name>
<nodeHandler>com.j2fe.workflow.handler.impl.ExecuteXPath</nodeHandler>
<nodeHandlerClass id="166">com.j2fe.workflow.handler.impl.ExecuteXPath</nodeHandlerClass>
<parameters id="167" type="java.util.HashSet">
<item id="168" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="169">inputText</name>
<stringValue id="170">Messages</stringValue>
<type>VARIABLE</type>
<variablePart id="171">[0]</variablePart>
</item>
<item id="172" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="173">outputValue</name>
<stringValue id="174">CurrentModelId</stringValue>
<type>VARIABLE</type>
</item>
<item id="175" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="176">xPath</name>
<stringValue id="177">/STREET_REF/HEADER/MODEL/MODLID/@VALUE</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="178" type="java.util.HashSet">
<item idref="161" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="179" type="java.util.HashSet">
<item id="180" type="com.j2fe.workflow.definition.Transition">
<name id="181">goto-next</name>
<source idref="163"/>
<target id="182">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="183"/>
<directJoin>false</directJoin>
<name id="184">Select Internal Rating query</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="185">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="186" type="java.util.HashSet">
<item id="187" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="188">statements</name>
<stringValue id="189">String sqlQuery = "select issr_rtng_oid from ft_t_irrt where rtng_set_oid in "+InternalRatings+" and issr_rtng_oid in (";&#13;
String sqlQueryA = "UPDATE FT_T_IRRT SET DATA_STAT_TYP='"+ApproveStatus+"', last_chg_tms = sysdate(), last_chg_usr_id = '"+UserName+"' where ISSR_RTNG_OID in (";&#13;
&#13;
int i=0;&#13;
for(i=0; i&lt;IsrtOids.length; i++)&#13;
{&#13;
	if(i==0)&#13;
	{&#13;
		sqlQuery = sqlQuery + "'"+IsrtOids[i]+"'";&#13;
		sqlQueryA = sqlQueryA + "'"+IsrtOids[i]+"'";&#13;
	}else&#13;
	{&#13;
		sqlQuery = sqlQuery + ", '"+IsrtOids[i]+"'";&#13;
		sqlQueryA = sqlQueryA + ", '"+IsrtOids[i]+"'";&#13;
	}&#13;
}&#13;
&#13;
&#13;
sqlQuery = sqlQuery + ")";&#13;
sqlQueryA = sqlQueryA + ")";</stringValue>
<type>CONSTANT</type>
</item>
<item id="190" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="191">["ApproveStatus"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="192">variables["ApproveStatus"]</name>
<stringValue id="193">ApproveStatus</stringValue>
<type>VARIABLE</type>
</item>
<item id="194" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="195">["InternalRatings"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="196">variables["InternalRatings"]</name>
<stringValue id="197">InternalRatings</stringValue>
<type>VARIABLE</type>
</item>
<item id="198" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="199">["IsrtOids"]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="200">variables["IsrtOids"]</name>
<stringValue id="201">IRRTOidArr</stringValue>
<type>VARIABLE</type>
</item>
<item id="202" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="203">["UserName"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="204">variables["UserName"]</name>
<stringValue id="205">UserName</stringValue>
<type>VARIABLE</type>
</item>
<item id="206" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="207">variables["sqlQuery"]</name>
<stringValue id="208">sqlQuery</stringValue>
<type>VARIABLE</type>
</item>
<item id="209" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="210">variables["sqlQueryA"]</name>
<stringValue id="211">sqlQueryA</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="212" type="java.util.HashSet">
<item idref="180" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="213" type="java.util.HashSet">
<item id="214" type="com.j2fe.workflow.definition.Transition">
<name id="215">goto-next</name>
<source idref="182"/>
<target id="216">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="217"/>
<directJoin>false</directJoin>
<name id="218">Update IRRT with A</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="219">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="220" type="java.util.HashSet">
<item id="221" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="222">database</name>
<stringValue id="223">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="224" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="225">querySQL</name>
<stringValue id="226">sqlQueryA</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="227" type="java.util.HashSet">
<item idref="214" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="228" type="java.util.HashSet">
<item id="229" type="com.j2fe.workflow.definition.Transition">
<name id="230">goto-next</name>
<source idref="216"/>
<target id="231">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="232"/>
<directJoin>false</directJoin>
<name id="233">Check for ModelEnable</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="234">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="235" type="java.util.HashSet">
<item id="236" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="237">database</name>
<stringValue id="238">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="239" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="240">indexedParameters[0]</name>
<stringValue id="241">CurrentModelId</stringValue>
<type>VARIABLE</type>
</item>
<item id="242" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="243">indexedParameters[1]</name>
<stringValue id="244">UserName</stringValue>
<type>VARIABLE</type>
</item>
<item id="245" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="246">querySQL</name>
<stringValue id="247">select ausr.usr_id, srpp.sec_prof_val_txt from ft_t_sprf sprf, ft_t_srpp srpp, ft_t_srle srle, ft_t_aurp aurp, ft_t_ausr ausr &#13;
where trim(sprf.sec_prof_nme) = ?&#13;
and sprf.sec_prof_num = 9999&#13;
and sprf.sprf_oid = srpp.sprf_oid&#13;
and srle.srle_oid = srpp.srle_oid&#13;
and srle.srle_oid = aurp.srle_oid&#13;
and ausr.ausr_oid = aurp.ausr_oid&#13;
and ausr.start_tms &lt; sysdate() and (ausr.end_tms is null or ausr.end_tms&gt;sysdate())&#13;
and srle.start_tms &lt; sysdate() and (srle.end_tms is null or srle.end_tms&gt;sysdate())&#13;
and sprf.start_tms &lt; sysdate() and (sprf.end_tms is null or sprf.end_tms&gt;sysdate())&#13;
and srpp.start_tms &lt; sysdate() and (srpp.end_tms is null or srpp.end_tms&gt;sysdate())&#13;
and aurp.start_tms &lt; sysdate() and (aurp.end_tms is null or aurp.end_tms&gt;sysdate())&#13;
and ausr.usr_id = ?</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="248" type="java.util.HashSet">
<item idref="229" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="249" type="java.util.HashSet">
<item id="250" type="com.j2fe.workflow.definition.Transition">
<name id="251">nothing-found</name>
<source idref="231"/>
<target id="252">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="253">Automatically generated</description>
<directJoin>false</directJoin>
<name id="254">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="255">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="256" type="java.util.HashSet">
<item id="257" type="com.j2fe.workflow.definition.Transition">
<name id="258">NULL</name>
<source idref="126"/>
<target idref="252"/>
</item>
<item idref="250" type="com.j2fe.workflow.definition.Transition"/>
<item id="259" type="com.j2fe.workflow.definition.Transition">
<name id="260">nothing-found</name>
<source id="261">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="262"/>
<directJoin>false</directJoin>
<name id="263">Select Internal Ratings OID</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="264">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="265" type="java.util.HashSet">
<item id="266" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="267">database</name>
<stringValue id="268">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="269" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="270">firstColumnsResult</name>
<stringValue id="271">IRRTOidArrInt</stringValue>
<type>VARIABLE</type>
</item>
<item id="272" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="273">querySQL</name>
<stringValue id="274">sqlQuery</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="275" type="java.util.HashSet">
<item id="276" type="com.j2fe.workflow.definition.Transition">
<name id="277">rows-found</name>
<source idref="231"/>
<target idref="261"/>
</item>
</sources>
<targets id="278" type="java.util.HashSet">
<item idref="259" type="com.j2fe.workflow.definition.Transition"/>
<item id="279" type="com.j2fe.workflow.definition.Transition">
<name id="280">rows-found</name>
<source idref="261"/>
<target id="281">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="282"/>
<directJoin>false</directJoin>
<name id="283">Update InternalRatings Status</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="284">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="285" type="java.util.HashSet">
<item id="286" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="287">statements</name>
<stringValue id="288">String sqlQueryP = "UPDATE FT_T_IRRT SET DATA_STAT_TYP='" + Pendingstatus + "', last_chg_tms = sysdate(), last_chg_usr_id = '" + UserName + "' WHERE ISSR_RTNG_OID IN (";&#13;
String sqlQueryA = "UPDATE FT_T_IRRT SET DATA_STAT_TYP='" + ApproveStatus + "', last_chg_tms = sysdate(), last_chg_usr_id = '" + UserName + "' WHERE ISSR_RTNG_OID IN (";&#13;
String sqlQueryR = "UPDATE FT_T_IRRT SET DATA_STAT_TYP='" + RejectStatus + "', last_chg_tms = sysdate(), last_chg_usr_id = '" + UserName + "' WHERE ISSR_RTNG_OID IN (";&#13;
&#13;
for(int i = 0; i &lt; IsrtOids.length; i++) {&#13;
    if(i &gt; 0) {&#13;
        sqlQueryP += ", ";&#13;
        sqlQueryA += ", ";&#13;
        sqlQueryR += ", ";&#13;
    }&#13;
    sqlQueryP += "'" + IsrtOids[i] + "'";&#13;
    sqlQueryA += "'" + IsrtOids[i] + "'";&#13;
    sqlQueryR += "'" + IsrtOids[i] + "'";&#13;
}&#13;
&#13;
sqlQueryP += ")";&#13;
sqlQueryA += ")";&#13;
sqlQueryR += ")";</stringValue>
<type>CONSTANT</type>
</item>
<item id="289" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="290">["ApproveStatus"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="291">variables["ApproveStatus"]</name>
<stringValue id="292">ApproveStatus</stringValue>
<type>VARIABLE</type>
</item>
<item id="293" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="294">["IsrtOids"]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="295">variables["IsrtOids"]</name>
<stringValue id="296">IRRTOidArrInt</stringValue>
<type>VARIABLE</type>
</item>
<item id="297" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="298">["Pendingstatus"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="299">variables["Pendingstatus"]</name>
<stringValue id="300">Pendingstatus</stringValue>
<type>VARIABLE</type>
</item>
<item id="301" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="302">["RejectStatus"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="303">variables["RejectStatus"]</name>
<stringValue id="304">RejectStatus</stringValue>
<type>VARIABLE</type>
</item>
<item id="305" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="306">["UserName"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="307">variables["UserName"]</name>
<stringValue id="308">UserName</stringValue>
<type>VARIABLE</type>
</item>
<item id="309" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="310">variables["sqlQueryA"]</name>
<stringValue id="311">sqlQueryA</stringValue>
<type>VARIABLE</type>
</item>
<item id="312" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="313">["sqlQueryP"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="314">variables["sqlQueryP"]</name>
<stringValue id="315">sqlQueryP</stringValue>
<type>VARIABLE</type>
</item>
<item id="316" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="317">variables["sqlQueryR"]</name>
<stringValue id="318">sqlQueryR</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="319" type="java.util.HashSet">
<item idref="279" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="320" type="java.util.HashSet">
<item id="321" type="com.j2fe.workflow.definition.Transition">
<name id="322">goto-next</name>
<source idref="281"/>
<target id="323">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="324"/>
<directJoin>false</directJoin>
<name id="325">Update IRRT with P</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="326">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="327" type="java.util.HashSet">
<item id="328" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="329">database</name>
<stringValue id="330">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="331" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="332">querySQL</name>
<stringValue id="333">sqlQueryP</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="334" type="java.util.HashSet">
<item idref="321" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="335" type="java.util.HashSet">
<item id="336" type="com.j2fe.workflow.definition.Transition">
<name id="337">goto-next</name>
<source idref="323"/>
<target id="338">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="339"/>
<directJoin>false</directJoin>
<name id="340">Get IssuerName</name>
<nodeHandler>com.j2fe.workflow.handler.impl.ExecuteXPath</nodeHandler>
<nodeHandlerClass id="341">com.j2fe.workflow.handler.impl.ExecuteXPath</nodeHandlerClass>
<parameters id="342" type="java.util.HashSet">
<item id="343" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="344">inputText</name>
<stringValue id="345">Messages</stringValue>
<type>VARIABLE</type>
<variablePart id="346">[0]</variablePart>
</item>
<item id="347" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="348">outputValue</name>
<stringValue id="349">IssueName</stringValue>
<type>VARIABLE</type>
</item>
<item id="350" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="351">xPath</name>
<stringValue id="352">IssuerNameXpath</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="353" type="java.util.HashSet">
<item idref="336" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="354" type="java.util.HashSet">
<item id="355" type="com.j2fe.workflow.definition.Transition">
<name id="356">goto-next</name>
<source idref="338"/>
<target id="357">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="358"/>
<directJoin>false</directJoin>
<name id="359">Approval</name>
<nodeHandler>com.j2fe.event.RaiseEvent</nodeHandler>
<nodeHandlerClass id="360">com.j2fe.event.RaiseEvent</nodeHandlerClass>
<parameters id="361" type="java.util.HashSet">
<item id="362" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="363">eventName</name>
<stringValue id="364">AmendIssuer</stringValue>
<type>CONSTANT</type>
</item>
<item id="365" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="366">["DestinationFTP"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="367">parameters["DestinationFTP"]</name>
<stringValue id="368">DestinationFTP</stringValue>
<type>VARIABLE</type>
</item>
<item id="369" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="370">["IssuerName"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="371">parameters["IssuerName"]</name>
<stringValue id="372">IssueName</stringValue>
<type>VARIABLE</type>
</item>
<item id="373" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="374">["MainCrossRefId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="375">parameters["MainCrossRefId"]</name>
<stringValue id="376">instrIssrId</stringValue>
<type>VARIABLE</type>
<variablePart id="377">[0]</variablePart>
</item>
<item id="378" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="379">["ModelId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="380">parameters["ModelId"]</name>
<stringValue id="381">CurrentModelId</stringValue>
<type>VARIABLE</type>
</item>
<item id="382" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="383">["PubModelId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="384">parameters["PubModelId"]</name>
<stringValue id="385">ModelId</stringValue>
<type>VARIABLE</type>
</item>
<item id="386" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="387">["UserName"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="388">parameters["UserName"]</name>
<stringValue id="389">UserName</stringValue>
<type>VARIABLE</type>
</item>
<item id="390" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="391">["sqlQueryA"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="392">parameters["sqlQueryA"]</name>
<stringValue id="393">sqlQueryA</stringValue>
<type>VARIABLE</type>
</item>
<item id="394" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="395">["sqlQueryR"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="396">parameters["sqlQueryR"]</name>
<stringValue id="397">sqlQueryR</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="398" type="java.util.HashSet">
<item idref="355" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="399" type="java.util.HashSet">
<item id="400" type="com.j2fe.workflow.definition.Transition">
<name id="401">goto-next</name>
<source idref="357"/>
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
<target idref="252"/>
</item>
</sources>
<targets id="402" type="java.util.HashSet">
<item id="403" type="com.j2fe.workflow.definition.Transition">
<name id="404">ToSplit</name>
<source idref="252"/>
<target id="405">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="406"/>
<directJoin>false</directJoin>
<name id="407">Database Select (Xor Split)</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="408">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="409" type="java.util.HashSet">
<item id="410" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="411">database</name>
<stringValue id="412">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="413" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="414">firstColumnsResult</name>
<stringValue id="415">instrIssrId</stringValue>
<type>VARIABLE</type>
</item>
<item id="416" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="417">indexedParameters[0]</name>
<stringValue id="418">TransactionId</stringValue>
<type>VARIABLE</type>
</item>
<item id="419" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="420">querySQL</name>
<stringValue id="421">select msgp.xref_tbl_row_oid from ft_t_msgp msgp, ft_t_trid trid where msgp.trn_id = trid.trn_id &#13;
and trid.trn_id =  ?&#13;
and msgp.xref_tbl_typ = 'ISSR' and msgp.entity_chg_ind in ('C','U','D')&#13;
and msgp.xref_tbl_row_oid is not null &#13;
and trid.crrnt_severity_cde &lt; 40</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="422" type="java.util.HashSet">
<item idref="403" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="423" type="java.util.HashSet">
<item id="424" type="com.j2fe.workflow.definition.Transition">
<name id="425">nothing-found</name>
<source idref="405"/>
<target idref="3"/>
</item>
<item id="426" type="com.j2fe.workflow.definition.Transition">
<name id="427">rows-found</name>
<source idref="405"/>
<target id="428">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="429"/>
<directJoin>false</directJoin>
<name id="430">Derive Equity Rating from Issuer</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="431">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="432" type="java.util.HashSet">
<item id="433" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="434">["DestinationFTP"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="435">input["DestinationFTP"]</name>
<stringValue id="436">DestinationFTP</stringValue>
<type>VARIABLE</type>
</item>
<item id="437" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="438">["FileNameXpath"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="439">input["FileNameXpath"]</name>
<stringValue id="440">FileNameXpathIssue</stringValue>
<type>VARIABLE</type>
</item>
<item id="441" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="442">["Issuer"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="443">input["Issuer"]</name>
<stringValue id="444">instrIssrId</stringValue>
<type>VARIABLE</type>
<variablePart id="445">[0]</variablePart>
</item>
<item id="446" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="447">["ModelId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="448">input["ModelId"]</name>
<stringValue id="449">ModelIdIssue</stringValue>
<type>VARIABLE</type>
</item>
<item id="450" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="451">name</name>
<stringValue id="452">CalculateDeriveRatingEquity</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="453" type="java.util.HashSet">
<item idref="426" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="454" type="java.util.HashSet">
<item id="455" type="com.j2fe.workflow.definition.Transition">
<name id="456">goto-next</name>
<source idref="428"/>
<target id="457">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="458"/>
<directJoin>false</directJoin>
<name id="459">Raise Event Remote #1</name>
<nodeHandler>com.j2fe.event.RaiseEventRemote</nodeHandler>
<nodeHandlerClass id="460">com.j2fe.event.RaiseEventRemote</nodeHandlerClass>
<parameters id="461" type="java.util.HashSet">
<item id="462" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="463">eventName</name>
<stringValue id="464">CSTMPublishingtoFileMIZEvent</stringValue>
<type>CONSTANT</type>
</item>
<item id="465" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="466">["DestinationFTP"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="467">parameters["DestinationFTP"]</name>
<stringValue id="468">DestinationFTP</stringValue>
<type>VARIABLE</type>
</item>
<item id="469" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="470">["EntityId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="471">parameters["EntityId"]</name>
<stringValue id="472">instrIssrId</stringValue>
<type>VARIABLE</type>
<variablePart id="473">[0]</variablePart>
</item>
<item id="474" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="475">["FileNameXpath"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="476">parameters["FileNameXpath"]</name>
<stringValue id="477">FileNameXpath</stringValue>
<type>VARIABLE</type>
</item>
<item id="478" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="479">["ModelID"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="480">parameters["ModelID"]</name>
<stringValue id="481">ModelId</stringValue>
<type>VARIABLE</type>
</item>
<item id="482" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="483">propertyFileLocation</name>
<stringValue id="484">db://resource/PublishingConfiguration/PublishingConfig.properties</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="485" type="java.util.HashSet">
<item idref="455" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="486" type="java.util.HashSet">
<item id="487" type="com.j2fe.workflow.definition.Transition">
<name id="488">goto-next</name>
<source idref="457"/>
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
</target>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item idref="276" type="com.j2fe.workflow.definition.Transition"/>
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
<item idref="257" type="com.j2fe.workflow.definition.Transition"/>
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
<item id="489" type="com.j2fe.workflow.definition.Transition">
<name id="490">50</name>
<source idref="10"/>
<target idref="3"/>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="3"/>
</item>
<item idref="489" type="com.j2fe.workflow.definition.Transition"/>
<item idref="400" type="com.j2fe.workflow.definition.Transition"/>
<item idref="487" type="com.j2fe.workflow.definition.Transition"/>
<item idref="424" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="491" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="492">Mizuho</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="493">user1</lastChangeUser>
<lastUpdate id="494">2025-10-11T10:06:51.000+0100</lastUpdate>
<name id="495">WrapperWorkstationIssuer</name>
<nodes id="496" type="java.util.HashSet">
<item idref="357" type="com.j2fe.workflow.definition.Node"/>
<item idref="47" type="com.j2fe.workflow.definition.Node"/>
<item idref="231" type="com.j2fe.workflow.definition.Node"/>
<item idref="405" type="com.j2fe.workflow.definition.Node"/>
<item idref="428" type="com.j2fe.workflow.definition.Node"/>
<item idref="107" type="com.j2fe.workflow.definition.Node"/>
<item idref="88" type="com.j2fe.workflow.definition.Node"/>
<item idref="338" type="com.j2fe.workflow.definition.Node"/>
<item idref="163" type="com.j2fe.workflow.definition.Node"/>
<item idref="144" type="com.j2fe.workflow.definition.Node"/>
<item idref="252" type="com.j2fe.workflow.definition.Node"/>
<item idref="457" type="com.j2fe.workflow.definition.Node"/>
<item idref="182" type="com.j2fe.workflow.definition.Node"/>
<item idref="261" type="com.j2fe.workflow.definition.Node"/>
<item idref="27" type="com.j2fe.workflow.definition.Node"/>
<item idref="10" type="com.j2fe.workflow.definition.Node"/>
<item idref="77" type="com.j2fe.workflow.definition.Node"/>
<item idref="3" type="com.j2fe.workflow.definition.Node"/>
<item idref="126" type="com.j2fe.workflow.definition.Node"/>
<item idref="216" type="com.j2fe.workflow.definition.Node"/>
<item idref="323" type="com.j2fe.workflow.definition.Node"/>
<item idref="281" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>false</optimize>
<parameter id="497" type="java.util.HashMap">
<entry>
<key id="498" type="java.lang.String">ApproveStatus</key>
<value id="499" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="500">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="501" type="java.lang.String">CurrentModelId</key>
<value id="502" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="503">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="504" type="java.lang.String">DestinationFTP</key>
<value id="505" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="506">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="507" type="java.lang.String">FileNameXpath</key>
<value id="508" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="509">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="510" type="java.lang.String">FileNameXpathIssue</key>
<value id="511" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="512">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="513" type="java.lang.String">InternalRatings</key>
<value id="514" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="515">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="516">Provide internal rating in sql format as ('RATING1','RATING2')</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="517" type="java.lang.String">IrrtXpath</key>
<value id="518" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="519">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="520" type="java.lang.String">IssuerNameXpath</key>
<value id="521" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="522">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="523" type="java.lang.String">Messages</key>
<value id="524" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="525">[Ljava.lang.String;</className>
<clazz>[Ljava.lang.String;</clazz>
<description id="526"/>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="527" type="java.lang.String">ModelId</key>
<value id="528" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="529">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="530">			</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="531" type="java.lang.String">ModelIdIssue</key>
<value id="532" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="533">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="534" type="java.lang.String">Pendingstatus</key>
<value id="535" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="536">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="537" type="java.lang.String">RejectStatus</key>
<value id="538" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="539">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="540" type="java.lang.String">Result</key>
<value id="541" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="542">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>false</input>
<output>true</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="543" type="java.lang.String">TransactionId</key>
<value id="544" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="545">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>false</input>
<output>true</output>
<required>false</required>
</value>
</entry>
</parameter>
<permissions id="546" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>false</purgeAtEnd>
<retries>0</retries>
<startNode idref="77"/>
<status>RELEASED</status>
<variables id="547" type="java.util.HashMap">
<entry>
<key id="548" type="java.lang.String">ApproveStatus</key>
<value id="549" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="550">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="551" type="java.lang.String">ACTIVE</value>
</value>
</entry>
<entry>
<key id="552" type="java.lang.String">CurrentModelId</key>
<value id="553" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="554">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="555" type="java.lang.String">DestinationFTP</key>
<value id="556" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="557">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="558" type="java.lang.String">FileNameXpath</key>
<value id="559" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="560">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="561" type="java.lang.String">/ISSRPUB/pref_issr_id</value>
</value>
</entry>
<entry>
<key id="562" type="java.lang.String">FileNameXpathIssue</key>
<value id="563" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="564">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="565" type="java.lang.String">/ISSUPUB/pref_iss_id</value>
</value>
</entry>
<entry>
<key id="566" type="java.lang.String">IRRTOidArr</key>
<value id="567" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="568">[Ljava.lang.String;</className>
<clazz>[Ljava.lang.String;</clazz>
<persistent>true</persistent>
</value>
</entry>
<entry>
<key id="569" type="java.lang.String">IRRTOidArrInt</key>
<value id="570" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="571">[Ljava.lang.Object;</className>
<clazz>[Ljava.lang.Object;</clazz>
<persistent>true</persistent>
</value>
</entry>
<entry>
<key id="572" type="java.lang.String">InternalRatings</key>
<value id="573" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="574">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="575">Provide internal rating in sql format as ('RATING1','RATING2')</description>
<persistent>false</persistent>
<value id="576" type="java.lang.String">('MIZRTNG7')</value>
</value>
</entry>
<entry>
<key id="577" type="java.lang.String">IrrtXpath</key>
<value id="578" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="579">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="580" type="java.lang.String">/STREET_REF/SEGMENT[@TYPE="IssuerRating"]/IssuerRating/ISSRRTNGOID/@VALUE</value>
</value>
</entry>
<entry>
<key id="581" type="java.lang.String">IssuerNameXpath</key>
<value id="582" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="583">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="584" type="java.lang.String">/STREET_REF/HEADER/MAIN_ENTITY_NME/@VALUE</value>
</value>
</entry>
<entry>
<key id="585" type="java.lang.String">Messages</key>
<value id="586" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="587">[Ljava.lang.String;</className>
<clazz>[Ljava.lang.String;</clazz>
<description id="588"/>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="589" type="java.lang.String">ModelId</key>
<value id="590" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="591">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="592">			</description>
<persistent>false</persistent>
<value id="593" type="java.lang.String">ISSRPUB</value>
</value>
</entry>
<entry>
<key id="594" type="java.lang.String">ModelIdIssue</key>
<value id="595" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="596">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="597" type="java.lang.String">ISSUPUB</value>
</value>
</entry>
<entry>
<key id="598" type="java.lang.String">Pendingstatus</key>
<value id="599" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="600">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>true</persistent>
<value id="601" type="java.lang.String">UNVERIFIED</value>
</value>
</entry>
<entry>
<key id="602" type="java.lang.String">RejectStatus</key>
<value id="603" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="604">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="605" type="java.lang.String">INVALID</value>
</value>
</entry>
<entry>
<key id="606" type="java.lang.String">Result</key>
<value id="607" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="608">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="609" type="java.lang.String">TransactionId</key>
<value id="610" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="611">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="612" type="java.lang.String">XpathNewIssuer</key>
<value id="613" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="614">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>true</persistent>
<value id="615" type="java.lang.String">/STREET_REF/SEGMENT[@TYPE="Issuer"]/@ACTION</value>
</value>
</entry>
<entry>
<key id="616" type="java.lang.String">instrIssrId</key>
<value id="617" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="618">[Ljava.lang.Object;</className>
<clazz>[Ljava.lang.Object;</clazz>
<persistent>true</persistent>
</value>
</entry>
<entry>
<key id="619" type="java.lang.String">sqlQueryA</key>
<value id="620" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="621">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>true</persistent>
</value>
</entry>
<entry>
<key id="622" type="java.lang.String">sqlQueryP</key>
<value id="623" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="624">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>true</persistent>
</value>
</entry>
<entry>
<key id="625" type="java.lang.String">sqlQueryR</key>
<value id="626" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="627">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>true</persistent>
</value>
</entry>
</variables>
<version>23</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
