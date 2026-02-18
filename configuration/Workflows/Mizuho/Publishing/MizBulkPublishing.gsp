<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.07">
<package-comment/>
<businessobject displayString="24 - v10 JMSQTest - Issuer pub fix - Parallel Branches" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>false</alwaysPersist>
<clustered>false</clustered>
<comment id="1">v10 JMSQTest - Issuer pub fix - Parallel Branches</comment>
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
<name id="12">NOP</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="13">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="14" type="java.util.HashSet">
<item id="15" type="com.j2fe.workflow.definition.Transition">
<name id="16">goto-next</name>
<source id="17">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="18"/>
<directJoin>true</directJoin>
<name id="19">Synchronize</name>
<nodeHandler>com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandler>
<nodeHandlerClass id="20">com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandlerClass>
<sources id="21" type="java.util.HashSet">
<item id="22" type="com.j2fe.workflow.definition.Transition">
<name id="23">goto-next</name>
<source id="24">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="25"/>
<directJoin>false</directJoin>
<name id="26">Call Subworkflow</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="27">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="28" type="java.util.HashSet">
<item id="29" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="30">["AuditId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="31">input["AuditId"]</name>
<stringValue id="32">auditIdentifier</stringValue>
<type>VARIABLE</type>
</item>
<item id="33" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="34">["ExtDefs"]@[Ljava/lang/Object;@</UITypeHint>
<input>true</input>
<name id="35">input["ExtDefs"]</name>
<stringValue id="36">extDefsPerBranch</stringValue>
<type>VARIABLE</type>
</item>
<item id="37" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="38">["Handle Extraction Failures"]@com/thegoldensource/subscription/ExceptionHandlingMode@</UITypeHint>
<input>true</input>
<name id="39">input["Handle Extraction Failures"]</name>
<stringValue id="40">Handle Extraction Failures</stringValue>
<type>VARIABLE</type>
</item>
<item id="41" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="42">["JMSDestination"]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="43">input["JMSDestination"]</name>
<stringValue id="44">JMSDestinationSecurity</stringValue>
<type>VARIABLE</type>
</item>
<item id="45" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="46">["PublishingBulkSize"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="47">input["PublishingBulkSize"]</name>
<stringValue id="48">PublishingBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="49" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="50">["Threshold for Extraction Failures"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="51">input["Threshold for Extraction Failures"]</name>
<stringValue id="52">Threshold for Extraction Failures</stringValue>
<type>VARIABLE</type>
</item>
<item id="53" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="54">name</name>
<stringValue id="55">MizBulkExtraction</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="56" type="java.util.HashSet">
<item id="57" type="com.j2fe.workflow.definition.Transition">
<name id="58">goto-next</name>
<source id="59">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="60"/>
<directJoin>true</directJoin>
<name id="61">Bulk Items</name>
<nodeHandler>com.j2fe.general.activities.BulkItems</nodeHandler>
<nodeHandlerClass id="62">com.j2fe.general.activities.BulkItems</nodeHandlerClass>
<parameters id="63" type="java.util.HashSet">
<item id="64" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="65">bulk</name>
<stringValue id="66">pubBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="67" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="68">input</name>
<stringValue id="69">extractDefinitions</stringValue>
<type>VARIABLE</type>
</item>
<item id="70" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="71">output</name>
<stringValue id="72">extDefsPerBranch</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
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
<stringValue id="83">if(NoOfThreads &lt;= 0) {&#13;
	NoOfThreads = 1;&#13;
}&#13;
else if(items &lt; NoOfThreads)&#13;
{&#13;
NoOfThreads = items;&#13;
}&#13;
bulkSize = items / NoOfThreads;&#13;
if(items % NoOfThreads != 0)&#13;
{&#13;
bulkSize = bulkSize +1;&#13;
}</stringValue>
<type>CONSTANT</type>
</item>
<item id="84" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="85">["NoOfThreads"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="86">variables["NoOfThreads"]</name>
<stringValue id="87">No. Of Parallel Branches</stringValue>
<type>VARIABLE</type>
</item>
<item id="88" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="89">["bulkSize"]@java/lang/Integer@</UITypeHint>
<input>false</input>
<name id="90">variables["bulkSize"]</name>
<stringValue id="91">pubBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="92" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="93">["items"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="94">variables["items"]</name>
<stringValue id="95">extractDefinitions</stringValue>
<type>VARIABLE</type>
<variablePart id="96">length</variablePart>
</item>
</parameters>
<sources id="97" type="java.util.HashSet">
<item id="98" type="com.j2fe.workflow.definition.Transition">
<name id="99">extraction</name>
<source id="100">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="101"/>
<directJoin>false</directJoin>
<name id="102">Asset Extraction Log</name>
<nodeHandler>com.thegoldensource.publishing.activity.WriteExtractionLog</nodeHandler>
<nodeHandlerClass id="103">com.thegoldensource.publishing.activity.WriteExtractionLog</nodeHandlerClass>
<parameters id="104" type="java.util.HashSet">
<item id="105" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="106">auditId</name>
<stringValue id="107">auditIdentifier</stringValue>
<type>VARIABLE</type>
</item>
<item id="108" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="109">entityMode</name>
<stringValue id="110">MODEL_ENTITY</stringValue>
<type>CONSTANT</type>
</item>
<item id="111" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="112">eql</name>
<stringValue id="113">PublishQuery</stringValue>
<type>VARIABLE</type>
</item>
<item id="114" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="115">extractDefinitions</name>
<stringValue id="116">extractDefinitions</stringValue>
<type>VARIABLE</type>
</item>
<item id="117" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="118">extractorFactory</name>
<stringValue id="119">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="120" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="121">maxExtractCount</name>
<stringValue id="122">PublishingBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="123" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="124">modelName</name>
<stringValue id="125">ISSUPUB</stringValue>
<type>CONSTANT</type>
</item>
<item id="126" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="127">queryParameter</name>
<stringValue id="128">queryParameter</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="129" type="java.util.HashSet">
<item id="130" type="com.j2fe.workflow.definition.Transition">
<name id="131">goto-next</name>
<source id="132">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="133"/>
<directJoin>false</directJoin>
<name id="134">Asset Publish Query</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="135">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="136" type="java.util.HashSet">
<item id="137" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="138">statements</name>
<stringValue id="139">String query="&lt;sql&gt;instr_id in (SELECT ft_t_isgp.instr_id FROM ft_t_isgp, ft_t_issu WHERE FT_T_ISSU.INSTR_ID = FT_T_ISGP.INSTR_ID and ft_t_isgp.PRT_PURP_TYP  = '" + pubSoi +"' AND ft_t_isgp.end_tms IS NULL";
query = query + " intersect SELECT DISTINCT XREF_TBL_ROW_OID FROM ft_t_msgp msgp, ft_t_trid trid WHERE msgp.trn_id=  trid.trn_id AND trid.job_id  = '" + jobId +"' AND XREF_TBL_TYP='ISSU'";

if(allassets.equals("Y")) {
query = query + " AND ENTITY_CHG_IND IN ('C','U','N')";
} else {
query = query + " AND ENTITY_CHG_IND IN ('C','U')";
}

query = query + ")&lt;/sql&gt;"</stringValue>
<type>CONSTANT</type>
</item>
<item id="140" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="141">["allassets"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="142">variables["allassets"]</name>
<stringValue id="143">AllAssets</stringValue>
<type>VARIABLE</type>
</item>
<item id="144" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="145">variables["jobId"]</name>
<stringValue id="146">JobId</stringValue>
<type>VARIABLE</type>
</item>
<item id="147" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="148">variables["pubSoi"]</name>
<stringValue id="149">PublishSoi</stringValue>
<type>VARIABLE</type>
</item>
<item id="150" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="151">["query"]@java/lang/Integer@</UITypeHint>
<input>false</input>
<name id="152">variables["query"]</name>
<stringValue id="153">PublishQuery</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="154" type="java.util.HashSet">
<item id="155" type="com.j2fe.workflow.definition.Transition">
<name id="156">goto-next</name>
<source id="157">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="158"/>
<directJoin>false</directJoin>
<name id="159">NOP</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="160">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="161" type="java.util.HashSet">
<item id="162" type="com.j2fe.workflow.definition.Transition">
<name id="163">goto-next</name>
<source id="164">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="165"/>
<directJoin>true</directJoin>
<name id="166">Synchronize</name>
<nodeHandler>com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandler>
<nodeHandlerClass id="167">com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandlerClass>
<sources id="168" type="java.util.HashSet">
<item id="169" type="com.j2fe.workflow.definition.Transition">
<name id="170">goto-next</name>
<source id="171">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="172"/>
<directJoin>false</directJoin>
<name id="173">Call Subworkflow</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="174">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="175" type="java.util.HashSet">
<item id="176" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="177">["AuditId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="178">input["AuditId"]</name>
<stringValue id="179">auditIdentifier</stringValue>
<type>VARIABLE</type>
</item>
<item id="180" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="181">["ExtDefs"]@[Ljava/lang/Object;@</UITypeHint>
<input>true</input>
<name id="182">input["ExtDefs"]</name>
<stringValue id="183">extDefsPerBranch</stringValue>
<type>VARIABLE</type>
</item>
<item id="184" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="185">["Handle Extraction Failures"]@com/thegoldensource/subscription/ExceptionHandlingMode@</UITypeHint>
<input>true</input>
<name id="186">input["Handle Extraction Failures"]</name>
<stringValue id="187">Handle Extraction Failures</stringValue>
<type>VARIABLE</type>
</item>
<item id="188" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="189">["JMSDestination"]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="190">input["JMSDestination"]</name>
<stringValue id="191">JMSDestinationIssuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="192" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="193">["PublishingBulkSize"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="194">input["PublishingBulkSize"]</name>
<stringValue id="195">PublishingBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="196" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="197">["Threshold for Extraction Failures"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="198">input["Threshold for Extraction Failures"]</name>
<stringValue id="199">Threshold for Extraction Failures</stringValue>
<type>VARIABLE</type>
</item>
<item id="200" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="201">name</name>
<stringValue id="202">MizBulkExtraction</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="203" type="java.util.HashSet">
<item id="204" type="com.j2fe.workflow.definition.Transition">
<name id="205">goto-next</name>
<source id="206">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="207"/>
<directJoin>true</directJoin>
<name id="208">Bulk Items</name>
<nodeHandler>com.j2fe.general.activities.BulkItems</nodeHandler>
<nodeHandlerClass id="209">com.j2fe.general.activities.BulkItems</nodeHandlerClass>
<parameters id="210" type="java.util.HashSet">
<item id="211" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="212">bulk</name>
<stringValue id="213">pubBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="214" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="215">input</name>
<stringValue id="216">extractDefinitions</stringValue>
<type>VARIABLE</type>
</item>
<item id="217" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="218">output</name>
<stringValue id="219">extDefsPerBranch</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="220" type="java.util.HashSet">
<item id="221" type="com.j2fe.workflow.definition.Transition">
<name id="222">goto-next</name>
<source id="223">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="224"/>
<directJoin>false</directJoin>
<name id="225">Bean Shell Script (Standard)</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="226">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="227" type="java.util.HashSet">
<item id="228" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="229">statements</name>
<stringValue id="230">if(NoOfThreads &lt;= 0) {&#13;
	NoOfThreads = 1;&#13;
}&#13;
else if(items &lt; NoOfThreads)&#13;
{&#13;
NoOfThreads = items;&#13;
}&#13;
bulkSize = items / NoOfThreads;&#13;
if(items % NoOfThreads != 0)&#13;
{&#13;
bulkSize = bulkSize +1;&#13;
}</stringValue>
<type>CONSTANT</type>
</item>
<item id="231" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="232">["NoOfThreads"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="233">variables["NoOfThreads"]</name>
<stringValue id="234">No. Of Parallel Branches</stringValue>
<type>VARIABLE</type>
</item>
<item id="235" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="236">["bulkSize"]@java/lang/Integer@</UITypeHint>
<input>false</input>
<name id="237">variables["bulkSize"]</name>
<stringValue id="238">pubBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="239" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="240">["items"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="241">variables["items"]</name>
<stringValue id="242">extractDefinitions</stringValue>
<type>VARIABLE</type>
<variablePart id="243">length</variablePart>
</item>
</parameters>
<sources id="244" type="java.util.HashSet">
<item id="245" type="com.j2fe.workflow.definition.Transition">
<name id="246">extraction</name>
<source id="247">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="248"/>
<directJoin>false</directJoin>
<name id="249">Party Extraction Log</name>
<nodeHandler>com.thegoldensource.publishing.activity.WriteExtractionLog</nodeHandler>
<nodeHandlerClass id="250">com.thegoldensource.publishing.activity.WriteExtractionLog</nodeHandlerClass>
<parameters id="251" type="java.util.HashSet">
<item id="252" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="253">auditId</name>
<stringValue id="254">auditIdentifier</stringValue>
<type>VARIABLE</type>
</item>
<item id="255" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="256">entityMode</name>
<stringValue id="257">MODEL_ENTITY</stringValue>
<type>CONSTANT</type>
</item>
<item id="258" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="259">eql</name>
<stringValue id="260">PublishQuery</stringValue>
<type>VARIABLE</type>
</item>
<item id="261" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="262">extractDefinitions</name>
<stringValue id="263">extractDefinitions</stringValue>
<type>VARIABLE</type>
</item>
<item id="264" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="265">extractorFactory</name>
<stringValue id="266">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="267" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="268">maxExtractCount</name>
<stringValue id="269">PublishingBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="270" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="271">modelName</name>
<stringValue id="272">ISSRPUB</stringValue>
<type>CONSTANT</type>
</item>
<item id="273" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="274">queryParameter</name>
<stringValue id="275">queryParameter</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="276" type="java.util.HashSet">
<item id="277" type="com.j2fe.workflow.definition.Transition">
<name id="278">goto-next</name>
<source id="279">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="280"/>
<directJoin>false</directJoin>
<name id="281">Party Publish Query</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="282">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="283" type="java.util.HashSet">
<item id="284" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="285">statements</name>
<stringValue id="286">String query = "&lt;sql&gt; instr_issr_id in (SELECT c.INSTR_ISSR_ID FROM ";
query = query + "(SELECT  ISSRPUB.INSTR_ISSR_ID FROM ft_t_msgp msgp, ft_t_trid trid, FT_T_ISSR ISSRPUB WHERE ISSRPUB.instr_issr_id=msgp.XREF_TBL_ROW_OID and msgp.trn_id = trid.trn_id  AND ENTITY_CHG_IND IN ('C','U') AND XREF_TBL_TYP='ISSR' and trid.job_id='" + jobId +"'";
query = query + " UNION SELECT  ISSRPUB.INSTR_ISSR_ID FROM FT_T_ISSR ISSRPUB,";
query = query + " (SELECT XREF_TBL_ROW_OID FROM ft_t_msgp msgp, ft_t_trid trid  WHERE trid.trn_id= msgp.trn_id AND ENTITY_CHG_IND IN ('C','U') AND XREF_TBL_TYP='FINS' and trid.job_id='" + jobId +"' ) b WHERE ISSRPUB.fins_inst_mnem = b.XREF_TBL_ROW_OID )";
query = query + " c,FT_T_irgp irgp WHERE c.instr_issr_id = irgp.instr_issr_id AND irgp.PRT_PURP_TYP = '" + pubSoi +"' AND end_tms IS NULL)&lt;/sql&gt;"</stringValue>
<type>CONSTANT</type>
</item>
<item id="287" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="288">variables["jobId"]</name>
<stringValue id="289">JobId</stringValue>
<type>VARIABLE</type>
</item>
<item id="290" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="291">variables["pubSoi"]</name>
<stringValue id="292">PublishSoi</stringValue>
<type>VARIABLE</type>
</item>
<item id="293" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="294">["query"]@java/lang/Integer@</UITypeHint>
<input>false</input>
<name id="295">variables["query"]</name>
<stringValue id="296">PublishQuery</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="297" type="java.util.HashSet">
<item id="298" type="com.j2fe.workflow.definition.Transition">
<name id="299">goto-next</name>
<source id="300">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="301"/>
<directJoin>false</directJoin>
<name id="302">NOP</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="303">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="304" type="java.util.HashSet">
<item id="305" type="com.j2fe.workflow.definition.Transition">
<name id="306">goto-next</name>
<source id="307">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="308"/>
<directJoin>false</directJoin>
<name id="309">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="310">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="311" type="java.util.HashSet"/>
<targets id="312" type="java.util.HashSet">
<item idref="305" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="300"/>
</item>
</sources>
<targets id="313" type="java.util.HashSet">
<item idref="298" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="279"/>
</item>
</sources>
<targets id="314" type="java.util.HashSet">
<item idref="277" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="247"/>
</item>
</sources>
<targets id="315" type="java.util.HashSet">
<item idref="245" type="com.j2fe.workflow.definition.Transition"/>
<item id="316" type="com.j2fe.workflow.definition.Transition">
<name id="317">no-extraction</name>
<source idref="247"/>
<target idref="157"/>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="223"/>
</item>
</sources>
<targets id="318" type="java.util.HashSet">
<item idref="221" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="206"/>
</item>
</sources>
<targets id="319" type="java.util.HashSet">
<item idref="204" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDSPLIT</type>
</source>
<target idref="171"/>
</item>
</sources>
<targets id="320" type="java.util.HashSet">
<item idref="169" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="164"/>
</item>
</sources>
<targets id="321" type="java.util.HashSet">
<item idref="162" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDJOIN</type>
</source>
<target idref="157"/>
</item>
<item idref="316" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="322" type="java.util.HashSet">
<item idref="155" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="132"/>
</item>
</sources>
<targets id="323" type="java.util.HashSet">
<item idref="130" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="100"/>
</item>
</sources>
<targets id="324" type="java.util.HashSet">
<item idref="98" type="com.j2fe.workflow.definition.Transition"/>
<item id="325" type="com.j2fe.workflow.definition.Transition">
<name id="326">no-extraction</name>
<source idref="100"/>
<target idref="10"/>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="76"/>
</item>
</sources>
<targets id="327" type="java.util.HashSet">
<item idref="74" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="59"/>
</item>
</sources>
<targets id="328" type="java.util.HashSet">
<item idref="57" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDSPLIT</type>
</source>
<target idref="24"/>
</item>
</sources>
<targets id="329" type="java.util.HashSet">
<item idref="22" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="17"/>
</item>
</sources>
<targets id="330" type="java.util.HashSet">
<item idref="15" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDJOIN</type>
</source>
<target idref="10"/>
</item>
<item idref="325" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="331" type="java.util.HashSet">
<item idref="8" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="3"/>
</item>
</sources>
<targets id="332" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="333">Mizuho/Publishing</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="334">user1</lastChangeUser>
<lastUpdate id="335">2025-11-20T00:14:54.000+0000</lastUpdate>
<name id="336">MizBulkPublishing</name>
<nodes id="337" type="java.util.HashSet">
<item idref="100" type="com.j2fe.workflow.definition.Node"/>
<item idref="132" type="com.j2fe.workflow.definition.Node"/>
<item idref="76" type="com.j2fe.workflow.definition.Node"/>
<item idref="223" type="com.j2fe.workflow.definition.Node"/>
<item idref="206" type="com.j2fe.workflow.definition.Node"/>
<item idref="59" type="com.j2fe.workflow.definition.Node"/>
<item idref="24" type="com.j2fe.workflow.definition.Node"/>
<item idref="171" type="com.j2fe.workflow.definition.Node"/>
<item idref="10" type="com.j2fe.workflow.definition.Node"/>
<item idref="157" type="com.j2fe.workflow.definition.Node"/>
<item idref="300" type="com.j2fe.workflow.definition.Node"/>
<item idref="247" type="com.j2fe.workflow.definition.Node"/>
<item idref="279" type="com.j2fe.workflow.definition.Node"/>
<item idref="307" type="com.j2fe.workflow.definition.Node"/>
<item idref="3" type="com.j2fe.workflow.definition.Node"/>
<item idref="164" type="com.j2fe.workflow.definition.Node"/>
<item idref="17" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>true</optimize>
<parameter id="338" type="java.util.HashMap">
<entry>
<key id="339" type="java.lang.String">AllAssets</key>
<value id="340" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="341">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="342">Do you want to publish all assets, even if not updated? - Y/N</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="343" type="java.lang.String">Handle Extraction Failures</key>
<value id="344" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="345">com.thegoldensource.subscription.ExceptionHandlingMode</className>
<clazz>com.thegoldensource.subscription.ExceptionHandlingMode</clazz>
<description id="346">This value is used for Exception Handling configuration.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="347" type="java.lang.String">JMSDestinationIssuer</key>
<value id="348" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="349">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="350"/>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="351" type="java.lang.String">JMSDestinationSecurity</key>
<value id="352" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="353">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="354"/>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="355" type="java.lang.String">JobId</key>
<value id="356" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="357">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="358"/>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="359" type="java.lang.String">No. Of Parallel Branches</key>
<value id="360" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="361">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="362">Defines how many parallel branches to be run for publishing.</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="363" type="java.lang.String">PublishSoi</key>
<value id="364" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="365">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="366" type="java.lang.String">PublishingBulkSize</key>
<value id="367" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="368">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="369">Defines how many entities you want to extract in one bulk.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="370" type="java.lang.String">Threshold for Extraction Failures</key>
<value id="371" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="372">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="373">Value for this field should be specified in x/y format, both x and y is numeric. 
Here x is percentage of instruments allowed to fail during extraction and y is minimum sampling size.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
</parameter>
<permissions id="374" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>false</purgeAtEnd>
<retries>0</retries>
<startNode idref="307"/>
<status>RELEASED</status>
<variables id="375" type="java.util.HashMap">
<entry>
<key id="376" type="java.lang.String">AllAssets</key>
<value id="377" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="378">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="379">Do you want to publish all assets, even if not updated? - Y/N</description>
<persistent>false</persistent>
<value id="380" type="java.lang.String">N</value>
</value>
</entry>
<entry>
<key id="381" type="java.lang.String">Handle Extraction Failures</key>
<value id="382" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="383">com.thegoldensource.subscription.ExceptionHandlingMode</className>
<clazz>com.thegoldensource.subscription.ExceptionHandlingMode</clazz>
<description id="384">This value is used for Exception Handling configuration.</description>
<persistent>false</persistent>
<value id="385" type="com.thegoldensource.subscription.ExceptionHandlingMode">DO_NOT_HANDLE</value>
</value>
</entry>
<entry>
<key id="386" type="java.lang.String">JMSDestinationIssuer</key>
<value id="387" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="388">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="389"/>
<persistent>false</persistent>
<value id="390" type="java.lang.String">jms/queue/issuer</value>
</value>
</entry>
<entry>
<key id="391" type="java.lang.String">JMSDestinationSecurity</key>
<value id="392" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="393">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="394"/>
<persistent>false</persistent>
<value id="395" type="java.lang.String">jms/queue/security</value>
</value>
</entry>
<entry>
<key id="396" type="java.lang.String">JobId</key>
<value id="397" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="398">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="399"/>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="400" type="java.lang.String">No. Of Parallel Branches</key>
<value id="401" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="402">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="403">Defines how many parallel branches to be run for publishing.</description>
<persistent>false</persistent>
<value id="404" type="java.lang.Integer">5</value>
</value>
</entry>
<entry>
<key id="405" type="java.lang.String">PublishSoi</key>
<value id="406" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="407">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="408" type="java.lang.String">INTEREST</value>
</value>
</entry>
<entry>
<key id="409" type="java.lang.String">PublishingBulkSize</key>
<value id="410" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="411">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="412">Defines how many entities you want to extract in one bulk.</description>
<persistent>false</persistent>
<value id="413" type="java.lang.Integer">100</value>
</value>
</entry>
<entry>
<key id="414" type="java.lang.String">Threshold for Extraction Failures</key>
<value id="415" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="416">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="417">Value for this field should be specified in x/y format, both x and y is numeric. 
Here x is percentage of instruments allowed to fail during extraction and y is minimum sampling size.</description>
<persistent>false</persistent>
</value>
</entry>
</variables>
<version>24</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
