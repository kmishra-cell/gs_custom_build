<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.07">
<package-comment/>
<businessobject displayString="11 - v10 Parallel Branches" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>false</alwaysPersist>
<clustered>false</clustered>
<comment id="1">v10 Parallel Branches</comment>
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
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="10"/>
<directJoin>false</directJoin>
<name id="11">Add TRN_ID to PBAT</name>
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
<stringValue id="19">transactionId</stringValue>
<type>VARIABLE</type>
</item>
<item id="20" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="21">indexedParameters[1]</name>
<stringValue id="22">auditIdentifier</stringValue>
<type>VARIABLE</type>
</item>
<item id="23" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="24">querySQL</name>
<stringValue id="25">update ft_t_pbat set trn_id = ? where pub_audit_id = ?</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="26" type="java.util.HashSet">
<item id="27" type="com.j2fe.workflow.definition.Transition">
<name id="28">goto-next</name>
<source id="29">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="30"/>
<directJoin>true</directJoin>
<name id="31">Synchronize</name>
<nodeHandler>com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandler>
<nodeHandlerClass id="32">com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandlerClass>
<sources id="33" type="java.util.HashSet">
<item id="34" type="com.j2fe.workflow.definition.Transition">
<name id="35">goto-next</name>
<source id="36">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="37"/>
<directJoin>false</directJoin>
<name id="38">Call Subworkflow</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="39">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="40" type="java.util.HashSet">
<item id="41" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="42">["AuditId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="43">input["AuditId"]</name>
<stringValue id="44">auditIdentifier</stringValue>
<type>VARIABLE</type>
</item>
<item id="45" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="46">["ExtDefs"]@[Ljava/lang/Object;@</UITypeHint>
<input>true</input>
<name id="47">input["ExtDefs"]</name>
<stringValue id="48">extDefsPerBranch</stringValue>
<type>VARIABLE</type>
</item>
<item id="49" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="50">["Handle Extraction Failures"]@com/thegoldensource/subscription/ExceptionHandlingMode@</UITypeHint>
<input>true</input>
<name id="51">input["Handle Extraction Failures"]</name>
<stringValue id="52">Handle Extraction Failures</stringValue>
<type>VARIABLE</type>
</item>
<item id="53" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="54">["JMSDestination"]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="55">input["JMSDestination"]</name>
<stringValue id="56">LegalAgreementQueue</stringValue>
<type>VARIABLE</type>
</item>
<item id="57" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="58">["PublishingBulkSize"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="59">input["PublishingBulkSize"]</name>
<stringValue id="60">PublishingBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="61" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="62">["Threshold for Extraction Failures"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="63">input["Threshold for Extraction Failures"]</name>
<stringValue id="64">Threshold for Extraction Failures</stringValue>
<type>VARIABLE</type>
</item>
<item id="65" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="66">name</name>
<stringValue id="67">MizBulkExtraction</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="68" type="java.util.HashSet">
<item id="69" type="com.j2fe.workflow.definition.Transition">
<name id="70">goto-next</name>
<source id="71">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="72"/>
<directJoin>true</directJoin>
<name id="73">Bulk Items</name>
<nodeHandler>com.j2fe.general.activities.BulkItems</nodeHandler>
<nodeHandlerClass id="74">com.j2fe.general.activities.BulkItems</nodeHandlerClass>
<parameters id="75" type="java.util.HashSet">
<item id="76" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="77">bulk</name>
<stringValue id="78">pubBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="79" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="80">input</name>
<stringValue id="81">extractDefinitions</stringValue>
<type>VARIABLE</type>
</item>
<item id="82" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="83">output</name>
<stringValue id="84">extDefsPerBranch</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="85" type="java.util.HashSet">
<item id="86" type="com.j2fe.workflow.definition.Transition">
<name id="87">goto-next</name>
<source id="88">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="89"/>
<directJoin>false</directJoin>
<name id="90">Bean Shell Script (Standard)</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="91">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="92" type="java.util.HashSet">
<item id="93" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="94">statements</name>
<stringValue id="95">if(NoOfThreads &lt;= 0) {
	NoOfThreads = 1;
}
else if(items &lt; NoOfThreads)
{
NoOfThreads = items;
}
bulkSize = items / NoOfThreads;
if(items % NoOfThreads != 0)
{
bulkSize = bulkSize +1;
}</stringValue>
<type>CONSTANT</type>
</item>
<item id="96" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="97">["NoOfThreads"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="98">variables["NoOfThreads"]</name>
<stringValue id="99">No. Of Parallel Branches</stringValue>
<type>VARIABLE</type>
</item>
<item id="100" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="101">["bulkSize"]@java/lang/Integer@</UITypeHint>
<input>false</input>
<name id="102">variables["bulkSize"]</name>
<stringValue id="103">pubBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="104" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="105">["items"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="106">variables["items"]</name>
<stringValue id="107">extractDefinitions</stringValue>
<type>VARIABLE</type>
<variablePart id="108">length</variablePart>
</item>
</parameters>
<sources id="109" type="java.util.HashSet">
<item id="110" type="com.j2fe.workflow.definition.Transition">
<name id="111">extraction</name>
<source id="112">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="113"/>
<directJoin>false</directJoin>
<name id="114">MHSC Legal Agreement Extraction Log</name>
<nodeHandler>com.thegoldensource.publishing.activity.WriteExtractionLog</nodeHandler>
<nodeHandlerClass id="115">com.thegoldensource.publishing.activity.WriteExtractionLog</nodeHandlerClass>
<parameters id="116" type="java.util.HashSet">
<item id="117" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="118">auditId</name>
<stringValue id="119">auditIdentifier</stringValue>
<type>VARIABLE</type>
</item>
<item id="120" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="121">entityMode</name>
<stringValue id="122">MODEL_ENTITY</stringValue>
<type>CONSTANT</type>
</item>
<item id="123" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="124">eql</name>
<stringValue id="125">PublishQuery</stringValue>
<type>VARIABLE</type>
</item>
<item id="126" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="127">extractDefinitions</name>
<stringValue id="128">extractDefinitions</stringValue>
<type>VARIABLE</type>
</item>
<item id="129" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="130">extractorFactory</name>
<stringValue id="131">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="132" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="133">maxExtractCount</name>
<stringValue id="134">PublishingBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="135" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="136">modelName</name>
<stringValue id="137">LAGR_PUB</stringValue>
<type>CONSTANT</type>
</item>
<item id="138" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="139">queryParameter</name>
<stringValue id="140">queryParameter</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="141" type="java.util.HashSet">
<item id="142" type="com.j2fe.workflow.definition.Transition">
<name id="143">goto-next</name>
<source id="144">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="145"/>
<directJoin>false</directJoin>
<name id="146">MHSC Legal Agreement Publish Query</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="147">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="148" type="java.util.HashSet">
<item id="149" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="150">statements</name>
<stringValue id="151">query = "&lt;sql&gt; lagr_oid in (SELECT lagr_oid FROM (SELECT LAGRPUB.lagr_oid FROM FT_T_LAGR LAGRPUB WHERE ORG_ID = 'MHSC' AND lagr_oid IN (SELECT XREF_TBL_ROW_OID FROM ft_t_msgp WHERE trn_id = '" + trnId +"'";&#13;
query = query + " AND ENTITY_CHG_IND IN ('C','U','D') AND XREF_TBL_TYP='LAGR')) as a)";&#13;
query = query + " AND (end_tms is null or sysdate()::date = end_tms::date)&lt;/sql&gt;"</stringValue>
<type>CONSTANT</type>
</item>
<item id="152" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="153">["query"]@java/lang/Integer@</UITypeHint>
<input>false</input>
<name id="154">variables["query"]</name>
<stringValue id="155">PublishQuery</stringValue>
<type>VARIABLE</type>
</item>
<item id="156" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="157">variables["trnId"]</name>
<stringValue id="158">transactionId</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="159" type="java.util.HashSet">
<item id="160" type="com.j2fe.workflow.definition.Transition">
<name id="161">goto-next</name>
<source id="162">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="163"/>
<directJoin>false</directJoin>
<name id="164">Add TRN_ID to PBAT</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="165">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="166" type="java.util.HashSet">
<item id="167" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="168">database</name>
<stringValue id="169">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="170" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="171">indexedParameters[0]</name>
<stringValue id="172">transactionId</stringValue>
<type>VARIABLE</type>
</item>
<item id="173" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="174">indexedParameters[1]</name>
<stringValue id="175">auditIdentifier</stringValue>
<type>VARIABLE</type>
</item>
<item id="176" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="177">querySQL</name>
<stringValue id="178">update ft_t_pbat set trn_id = ? where pub_audit_id = ?</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="179" type="java.util.HashSet">
<item id="180" type="com.j2fe.workflow.definition.Transition">
<name id="181">goto-next</name>
<source id="182">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="183"/>
<directJoin>true</directJoin>
<name id="184">Synchronize</name>
<nodeHandler>com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandler>
<nodeHandlerClass id="185">com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandlerClass>
<sources id="186" type="java.util.HashSet">
<item id="187" type="com.j2fe.workflow.definition.Transition">
<name id="188">goto-next</name>
<source id="189">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="190"/>
<directJoin>false</directJoin>
<name id="191">Call Subworkflow</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="192">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="193" type="java.util.HashSet">
<item id="194" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="195">["AuditId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="196">input["AuditId"]</name>
<stringValue id="197">auditIdentifier</stringValue>
<type>VARIABLE</type>
</item>
<item id="198" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="199">["ExtDefs"]@[Ljava/lang/Object;@</UITypeHint>
<input>true</input>
<name id="200">input["ExtDefs"]</name>
<stringValue id="201">extDefsPerBranch</stringValue>
<type>VARIABLE</type>
</item>
<item id="202" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="203">["Handle Extraction Failures"]@com/thegoldensource/subscription/ExceptionHandlingMode@</UITypeHint>
<input>true</input>
<name id="204">input["Handle Extraction Failures"]</name>
<stringValue id="205">Handle Extraction Failures</stringValue>
<type>VARIABLE</type>
</item>
<item id="206" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="207">["JMSDestination"]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="208">input["JMSDestination"]</name>
<stringValue id="209">LegalAgreementQueue</stringValue>
<type>VARIABLE</type>
</item>
<item id="210" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="211">["PublishingBulkSize"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="212">input["PublishingBulkSize"]</name>
<stringValue id="213">PublishingBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="214" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="215">["Threshold for Extraction Failures"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="216">input["Threshold for Extraction Failures"]</name>
<stringValue id="217">Threshold for Extraction Failures</stringValue>
<type>VARIABLE</type>
</item>
<item id="218" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="219">name</name>
<stringValue id="220">MizBulkExtraction</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="221" type="java.util.HashSet">
<item id="222" type="com.j2fe.workflow.definition.Transition">
<name id="223">goto-next</name>
<source id="224">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="225"/>
<directJoin>true</directJoin>
<name id="226">Bulk Items</name>
<nodeHandler>com.j2fe.general.activities.BulkItems</nodeHandler>
<nodeHandlerClass id="227">com.j2fe.general.activities.BulkItems</nodeHandlerClass>
<parameters id="228" type="java.util.HashSet">
<item id="229" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="230">bulk</name>
<stringValue id="231">pubBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="232" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="233">input</name>
<stringValue id="234">extractDefinitions</stringValue>
<type>VARIABLE</type>
</item>
<item id="235" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="236">output</name>
<stringValue id="237">extDefsPerBranch</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="238" type="java.util.HashSet">
<item id="239" type="com.j2fe.workflow.definition.Transition">
<name id="240">goto-next</name>
<source id="241">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="242"/>
<directJoin>false</directJoin>
<name id="243">Bean Shell Script (Standard)</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="244">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="245" type="java.util.HashSet">
<item id="246" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="247">statements</name>
<stringValue id="248">if(NoOfThreads &lt;= 0) {
	NoOfThreads = 1;
}
else if(items &lt; NoOfThreads)
{
NoOfThreads = items;
}
bulkSize = items / NoOfThreads;
if(items % NoOfThreads != 0)
{
bulkSize = bulkSize +1;
}</stringValue>
<type>CONSTANT</type>
</item>
<item id="249" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="250">["NoOfThreads"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="251">variables["NoOfThreads"]</name>
<stringValue id="252">No. Of Parallel Branches</stringValue>
<type>VARIABLE</type>
</item>
<item id="253" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="254">["bulkSize"]@java/lang/Integer@</UITypeHint>
<input>false</input>
<name id="255">variables["bulkSize"]</name>
<stringValue id="256">pubBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="257" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="258">["items"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="259">variables["items"]</name>
<stringValue id="260">extractDefinitions</stringValue>
<type>VARIABLE</type>
<variablePart id="261">length</variablePart>
</item>
</parameters>
<sources id="262" type="java.util.HashSet">
<item id="263" type="com.j2fe.workflow.definition.Transition">
<name id="264">extraction</name>
<source id="265">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="266"/>
<directJoin>false</directJoin>
<name id="267">non-MHSC Legal Agreement Extraction Log</name>
<nodeHandler>com.thegoldensource.publishing.activity.WriteExtractionLog</nodeHandler>
<nodeHandlerClass id="268">com.thegoldensource.publishing.activity.WriteExtractionLog</nodeHandlerClass>
<parameters id="269" type="java.util.HashSet">
<item id="270" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="271">auditId</name>
<stringValue id="272">auditIdentifier</stringValue>
<type>VARIABLE</type>
</item>
<item id="273" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="274">entityMode</name>
<stringValue id="275">MODEL_ENTITY</stringValue>
<type>CONSTANT</type>
</item>
<item id="276" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="277">eql</name>
<stringValue id="278">PublishQuery</stringValue>
<type>VARIABLE</type>
</item>
<item id="279" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="280">extractDefinitions</name>
<stringValue id="281">extractDefinitions</stringValue>
<type>VARIABLE</type>
</item>
<item id="282" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="283">extractorFactory</name>
<stringValue id="284">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="285" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="286">maxExtractCount</name>
<stringValue id="287">PublishingBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="288" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="289">modelName</name>
<stringValue id="290">LAGR_PUB</stringValue>
<type>CONSTANT</type>
</item>
<item id="291" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="292">queryParameter</name>
<stringValue id="293">queryParameter</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="294" type="java.util.HashSet">
<item id="295" type="com.j2fe.workflow.definition.Transition">
<name id="296">goto-next</name>
<source id="297">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="298"/>
<directJoin>false</directJoin>
<name id="299">non-MHSC Legal Agreement Publish Query</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="300">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="301" type="java.util.HashSet">
<item id="302" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="303">statements</name>
<stringValue id="304">String query = "&lt;sql&gt; lagr_oid in (SELECT lagr_oid FROM (SELECT LAGRPUB.lagr_oid FROM FT_T_LAGR LAGRPUB WHERE ORG_ID != 'MHSC' AND lagr_oid IN (SELECT XREF_TBL_ROW_OID FROM ft_t_msgp WHERE trn_id = '" + trnId +"'";&#13;
query = query + " AND ENTITY_CHG_IND IN ('C','U','D') AND XREF_TBL_TYP='LAGR')) as a)";&#13;
query = query + " AND (end_tms is null or sysdate()::date = end_tms::date)&lt;/sql&gt;"</stringValue>
<type>CONSTANT</type>
</item>
<item id="305" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="306">["query"]@java/lang/Integer@</UITypeHint>
<input>false</input>
<name id="307">variables["query"]</name>
<stringValue id="308">PublishQuery</stringValue>
<type>VARIABLE</type>
</item>
<item id="309" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="310">variables["trnId"]</name>
<stringValue id="311">transactionId</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="312" type="java.util.HashSet">
<item id="313" type="com.j2fe.workflow.definition.Transition">
<name id="314">goto-next</name>
<source id="315">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="316"/>
<directJoin>false</directJoin>
<name id="317">NOP</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="318">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="319" type="java.util.HashSet">
<item id="320" type="com.j2fe.workflow.definition.Transition">
<name id="321">goto-next</name>
<source id="322">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="323"/>
<directJoin>false</directJoin>
<name id="324">Add TRN_ID to PBAT</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="325">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="326" type="java.util.HashSet">
<item id="327" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="328">database</name>
<stringValue id="329">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="330" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="331">indexedParameters[0]</name>
<stringValue id="332">transactionId</stringValue>
<type>VARIABLE</type>
</item>
<item id="333" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="334">indexedParameters[1]</name>
<stringValue id="335">auditIdentifier</stringValue>
<type>VARIABLE</type>
</item>
<item id="336" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="337">querySQL</name>
<stringValue id="338">update ft_t_pbat set trn_id = ? where pub_audit_id = ?</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="339" type="java.util.HashSet">
<item id="340" type="com.j2fe.workflow.definition.Transition">
<name id="341">goto-next</name>
<source id="342">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="343"/>
<directJoin>true</directJoin>
<name id="344">Synchronize</name>
<nodeHandler>com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandler>
<nodeHandlerClass id="345">com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandlerClass>
<sources id="346" type="java.util.HashSet">
<item id="347" type="com.j2fe.workflow.definition.Transition">
<name id="348">goto-next</name>
<source id="349">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="350"/>
<directJoin>false</directJoin>
<name id="351">Call Subworkflow</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="352">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="353" type="java.util.HashSet">
<item id="354" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="355">["AuditId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="356">input["AuditId"]</name>
<stringValue id="357">auditIdentifier</stringValue>
<type>VARIABLE</type>
</item>
<item id="358" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="359">["ExtDefs"]@[Ljava/lang/Object;@</UITypeHint>
<input>true</input>
<name id="360">input["ExtDefs"]</name>
<stringValue id="361">extDefsPerBranch</stringValue>
<type>VARIABLE</type>
</item>
<item id="362" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="363">["Handle Extraction Failures"]@com/thegoldensource/subscription/ExceptionHandlingMode@</UITypeHint>
<input>true</input>
<name id="364">input["Handle Extraction Failures"]</name>
<stringValue id="365">Handle Extraction Failures</stringValue>
<type>VARIABLE</type>
</item>
<item id="366" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="367">["JMSDestination"]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="368">input["JMSDestination"]</name>
<stringValue id="369">AssetQueue</stringValue>
<type>VARIABLE</type>
</item>
<item id="370" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="371">["PublishingBulkSize"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="372">input["PublishingBulkSize"]</name>
<stringValue id="373">PublishingBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="374" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="375">["Threshold for Extraction Failures"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="376">input["Threshold for Extraction Failures"]</name>
<stringValue id="377">Threshold for Extraction Failures</stringValue>
<type>VARIABLE</type>
</item>
<item id="378" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="379">name</name>
<stringValue id="380">MizBulkExtraction</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="381" type="java.util.HashSet">
<item id="382" type="com.j2fe.workflow.definition.Transition">
<name id="383">goto-next</name>
<source id="384">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="385"/>
<directJoin>true</directJoin>
<name id="386">Bulk Items</name>
<nodeHandler>com.j2fe.general.activities.BulkItems</nodeHandler>
<nodeHandlerClass id="387">com.j2fe.general.activities.BulkItems</nodeHandlerClass>
<parameters id="388" type="java.util.HashSet">
<item id="389" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="390">bulk</name>
<stringValue id="391">pubBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="392" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="393">input</name>
<stringValue id="394">extractDefinitions</stringValue>
<type>VARIABLE</type>
</item>
<item id="395" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="396">output</name>
<stringValue id="397">extDefsPerBranch</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="398" type="java.util.HashSet">
<item id="399" type="com.j2fe.workflow.definition.Transition">
<name id="400">goto-next</name>
<source id="401">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="402"/>
<directJoin>false</directJoin>
<name id="403">Bean Shell Script (Standard)</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="404">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="405" type="java.util.HashSet">
<item id="406" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="407">statements</name>
<stringValue id="408">if(NoOfThreads &lt;= 0) {
	NoOfThreads = 1;
}
else if(items &lt; NoOfThreads)
{
NoOfThreads = items;
}
bulkSize = items / NoOfThreads;
if(items % NoOfThreads != 0)
{
bulkSize = bulkSize +1;
}</stringValue>
<type>CONSTANT</type>
</item>
<item id="409" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="410">["NoOfThreads"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="411">variables["NoOfThreads"]</name>
<stringValue id="412">No. Of Parallel Branches</stringValue>
<type>VARIABLE</type>
</item>
<item id="413" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="414">["bulkSize"]@java/lang/Integer@</UITypeHint>
<input>false</input>
<name id="415">variables["bulkSize"]</name>
<stringValue id="416">pubBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="417" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="418">["items"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="419">variables["items"]</name>
<stringValue id="420">extractDefinitions</stringValue>
<type>VARIABLE</type>
<variablePart id="421">length</variablePart>
</item>
</parameters>
<sources id="422" type="java.util.HashSet">
<item id="423" type="com.j2fe.workflow.definition.Transition">
<name id="424">extraction</name>
<source id="425">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="426"/>
<directJoin>false</directJoin>
<name id="427">Asset Extraction Log</name>
<nodeHandler>com.thegoldensource.publishing.activity.WriteExtractionLog</nodeHandler>
<nodeHandlerClass id="428">com.thegoldensource.publishing.activity.WriteExtractionLog</nodeHandlerClass>
<parameters id="429" type="java.util.HashSet">
<item id="430" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="431">auditId</name>
<stringValue id="432">auditIdentifier</stringValue>
<type>VARIABLE</type>
</item>
<item id="433" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="434">entityMode</name>
<stringValue id="435">MODEL_ENTITY</stringValue>
<type>CONSTANT</type>
</item>
<item id="436" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="437">eql</name>
<stringValue id="438">PublishQuery</stringValue>
<type>VARIABLE</type>
</item>
<item id="439" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="440">extractDefinitions</name>
<stringValue id="441">extractDefinitions</stringValue>
<type>VARIABLE</type>
</item>
<item id="442" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="443">extractorFactory</name>
<stringValue id="444">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="445" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="446">maxExtractCount</name>
<stringValue id="447">PublishingBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="448" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="449">modelName</name>
<stringValue id="450">ISSUPUB</stringValue>
<type>CONSTANT</type>
</item>
<item id="451" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="452">queryParameter</name>
<stringValue id="453">queryParameter</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="454" type="java.util.HashSet">
<item id="455" type="com.j2fe.workflow.definition.Transition">
<name id="456">goto-next</name>
<source id="457">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="458"/>
<directJoin>false</directJoin>
<name id="459">Asset Publish Query</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="460">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="461" type="java.util.HashSet">
<item id="462" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="463">statements</name>
<objectValue id="464" type="java.lang.String">String query="&lt;sql&gt;instr_id IN (SELECT INSTR_ID FROM (SELECT ISSUPUB.INSTR_ID FROM FT_T_ISSU ISSUPUB WHERE ISSUPUB.ISS_TYP not in ('PORT') and instr_id IN";&#13;
query = query + " (SELECT XREF_TBL_ROW_OID FROM ft_t_msgp WHERE trn_id = '" + trnId +"' AND ENTITY_CHG_IND IN ('C','U','N') AND XREF_TBL_TYP ='ISSU')";&#13;
query = query + " UNION";&#13;
query = query + " SELECT ISSUPUB.INSTR_ID FROM FT_T_ISSU ISSUPUB WHERE ISSUPUB.ISS_TYP not in ('PORT') and instr_issr_id IN";&#13;
query = query + " (SELECT XREF_TBL_ROW_OID FROM ft_t_msgp WHERE trn_id = '" + trnId +"' AND ENTITY_CHG_IND IN ('C','U') AND XREF_TBL_TYP ='ISSR')";&#13;
query = query + " AND ISSUPUB.instr_id IN (SELECT instr_id FROM ft_t_isgp WHERE ft_t_isgp.PRT_PURP_TYP = '" + pubSoi +"' AND end_tms IS NULL)";&#13;
query = query + " UNION";&#13;
query = query + " SELECT ISSUPUB.INSTR_ID FROM FT_T_ISSU ISSUPUB WHERE ISSUPUB.ISS_TYP not in ('PORT') and INSTR_ISSR_ID IN (SELECT instr_issr_id from FT_T_ISSR WHERE fins_inst_mnem IN";&#13;
query = query + " (SELECT XREF_TBL_ROW_OID FROM ft_t_msgp WHERE trn_id = '" + trnId +"' AND ENTITY_CHG_IND IN ('C','U') AND XREF_TBL_TYP ='FINS'))";&#13;
query = query + " AND instr_id IN (SELECT instr_id FROM ft_t_isgp WHERE ft_t_isgp.PRT_PURP_TYP = '" + pubSoi +"' AND end_tms IS NULL)";&#13;
query = query + " ) as a ) AND end_tms IS NULL&lt;/sql&gt;";</objectValue>
<type>CONSTANT</type>
</item>
<item id="465" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="466">variables["pubSoi"]</name>
<stringValue id="467">PrtPurpTyp</stringValue>
<type>VARIABLE</type>
</item>
<item id="468" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="469">["query"]@java/lang/Integer@</UITypeHint>
<input>false</input>
<name id="470">variables["query"]</name>
<stringValue id="471">PublishQuery</stringValue>
<type>VARIABLE</type>
</item>
<item id="472" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="473">variables["trnId"]</name>
<stringValue id="474">transactionId</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="475" type="java.util.HashSet">
<item id="476" type="com.j2fe.workflow.definition.Transition">
<name id="477">goto-next</name>
<source id="478">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="479"/>
<directJoin>false</directJoin>
<name id="480">NOP</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="481">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="482" type="java.util.HashSet">
<item id="483" type="com.j2fe.workflow.definition.Transition">
<name id="484">goto-next</name>
<source id="485">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="486"/>
<directJoin>false</directJoin>
<name id="487">Add TRN_ID to PBAT</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="488">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="489" type="java.util.HashSet">
<item id="490" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="491">database</name>
<stringValue id="492">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="493" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="494">indexedParameters[0]</name>
<stringValue id="495">transactionId</stringValue>
<type>VARIABLE</type>
</item>
<item id="496" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="497">indexedParameters[1]</name>
<stringValue id="498">auditIdentifier</stringValue>
<type>VARIABLE</type>
</item>
<item id="499" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="500">querySQL</name>
<stringValue id="501">update ft_t_pbat set trn_id = ? where pub_audit_id = ?</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="502" type="java.util.HashSet">
<item id="503" type="com.j2fe.workflow.definition.Transition">
<name id="504">goto-next</name>
<source id="505">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="506"/>
<directJoin>true</directJoin>
<name id="507">Synchronize</name>
<nodeHandler>com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandler>
<nodeHandlerClass id="508">com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandlerClass>
<sources id="509" type="java.util.HashSet">
<item id="510" type="com.j2fe.workflow.definition.Transition">
<name id="511">goto-next</name>
<source id="512">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="513"/>
<directJoin>false</directJoin>
<name id="514">Call Subworkflow</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="515">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="516" type="java.util.HashSet">
<item id="517" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="518">["AuditId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="519">input["AuditId"]</name>
<stringValue id="520">auditIdentifier</stringValue>
<type>VARIABLE</type>
</item>
<item id="521" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="522">["ExtDefs"]@[Ljava/lang/Object;@</UITypeHint>
<input>true</input>
<name id="523">input["ExtDefs"]</name>
<stringValue id="524">extDefsPerBranch</stringValue>
<type>VARIABLE</type>
</item>
<item id="525" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="526">["Handle Extraction Failures"]@com/thegoldensource/subscription/ExceptionHandlingMode@</UITypeHint>
<input>true</input>
<name id="527">input["Handle Extraction Failures"]</name>
<stringValue id="528">Handle Extraction Failures</stringValue>
<type>VARIABLE</type>
</item>
<item id="529" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="530">["JMSDestination"]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="531">input["JMSDestination"]</name>
<stringValue id="532">PartyQueue</stringValue>
<type>VARIABLE</type>
</item>
<item id="533" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="534">["PublishingBulkSize"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="535">input["PublishingBulkSize"]</name>
<stringValue id="536">PublishingBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="537" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="538">["Threshold for Extraction Failures"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="539">input["Threshold for Extraction Failures"]</name>
<stringValue id="540">Threshold for Extraction Failures</stringValue>
<type>VARIABLE</type>
</item>
<item id="541" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="542">name</name>
<stringValue id="543">MizBulkExtraction</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="544" type="java.util.HashSet">
<item id="545" type="com.j2fe.workflow.definition.Transition">
<name id="546">goto-next</name>
<source id="547">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="548"/>
<directJoin>true</directJoin>
<name id="549">Bulk Items</name>
<nodeHandler>com.j2fe.general.activities.BulkItems</nodeHandler>
<nodeHandlerClass id="550">com.j2fe.general.activities.BulkItems</nodeHandlerClass>
<parameters id="551" type="java.util.HashSet">
<item id="552" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="553">bulk</name>
<stringValue id="554">pubBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="555" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="556">input</name>
<stringValue id="557">extractDefinitions</stringValue>
<type>VARIABLE</type>
</item>
<item id="558" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="559">output</name>
<stringValue id="560">extDefsPerBranch</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="561" type="java.util.HashSet">
<item id="562" type="com.j2fe.workflow.definition.Transition">
<name id="563">goto-next</name>
<source id="564">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="565"/>
<directJoin>false</directJoin>
<name id="566">Bean Shell Script (Standard)</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="567">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="568" type="java.util.HashSet">
<item id="569" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="570">statements</name>
<stringValue id="571">if(NoOfThreads &lt;= 0) {
	NoOfThreads = 1;
}
else if(items &lt; NoOfThreads)
{
NoOfThreads = items;
}
bulkSize = items / NoOfThreads;
if(items % NoOfThreads != 0)
{
bulkSize = bulkSize +1;
}</stringValue>
<type>CONSTANT</type>
</item>
<item id="572" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="573">["NoOfThreads"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="574">variables["NoOfThreads"]</name>
<stringValue id="575">No. Of Parallel Branches</stringValue>
<type>VARIABLE</type>
</item>
<item id="576" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="577">["bulkSize"]@java/lang/Integer@</UITypeHint>
<input>false</input>
<name id="578">variables["bulkSize"]</name>
<stringValue id="579">pubBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="580" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="581">["items"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="582">variables["items"]</name>
<stringValue id="583">extractDefinitions</stringValue>
<type>VARIABLE</type>
<variablePart id="584">length</variablePart>
</item>
</parameters>
<sources id="585" type="java.util.HashSet">
<item id="586" type="com.j2fe.workflow.definition.Transition">
<name id="587">extraction</name>
<source id="588">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="589"/>
<directJoin>false</directJoin>
<name id="590">Party Extraction Log</name>
<nodeHandler>com.thegoldensource.publishing.activity.WriteExtractionLog</nodeHandler>
<nodeHandlerClass id="591">com.thegoldensource.publishing.activity.WriteExtractionLog</nodeHandlerClass>
<parameters id="592" type="java.util.HashSet">
<item id="593" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="594">auditId</name>
<stringValue id="595">auditIdentifier</stringValue>
<type>VARIABLE</type>
</item>
<item id="596" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="597">entityMode</name>
<stringValue id="598">MODEL_ENTITY</stringValue>
<type>CONSTANT</type>
</item>
<item id="599" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="600">eql</name>
<stringValue id="601">PublishQuery</stringValue>
<type>VARIABLE</type>
</item>
<item id="602" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="603">extractDefinitions</name>
<stringValue id="604">extractDefinitions</stringValue>
<type>VARIABLE</type>
</item>
<item id="605" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="606">extractorFactory</name>
<stringValue id="607">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="608" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="609">maxExtractCount</name>
<stringValue id="610">PublishingBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="611" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="612">modelName</name>
<stringValue id="613">ISSRPUB</stringValue>
<type>CONSTANT</type>
</item>
<item id="614" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="615">queryParameter</name>
<stringValue id="616">queryParameter</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="617" type="java.util.HashSet">
<item id="618" type="com.j2fe.workflow.definition.Transition">
<name id="619">goto-next</name>
<source id="620">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="621"/>
<directJoin>false</directJoin>
<name id="622">Party Publish Query</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="623">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="624" type="java.util.HashSet">
<item id="625" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="626">statements</name>
<stringValue id="627">String query = "&lt;sql&gt; instr_issr_id in (SELECT INSTR_ISSR_ID FROM (SELECT ISSRPUB.INSTR_ISSR_ID FROM FT_T_ISSR ISSRPUB WHERE instr_issr_id IN (SELECT XREF_TBL_ROW_OID FROM ft_t_msgp WHERE trn_id = '" + trnId +"'";&#13;
query = query + " AND ENTITY_CHG_IND IN ('C','U') AND XREF_TBL_TYP='ISSR')";&#13;
query = query + " UNION SELECT ISSRPUB.INSTR_ISSR_ID FROM FT_T_ISSR ISSRPUB WHERE fins_inst_mnem IN";&#13;
query = query + " (SELECT XREF_TBL_ROW_OID FROM ft_t_msgp WHERE trn_id = '" + trnId +"' AND ENTITY_CHG_IND IN ('C','U') AND XREF_TBL_TYP='FINS')) as a";&#13;
query = query + " WHERE instr_issr_id IN (SELECT instr_issr_id FROM ft_t_irgp WHERE ft_t_irgp.PRT_PURP_TYP = '" + pubSoi +"' AND end_tms  IS NULL)) AND end_tms IS NULL&lt;/sql&gt;"</stringValue>
<type>CONSTANT</type>
</item>
<item id="628" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="629">variables["pubSoi"]</name>
<stringValue id="630">PrtPurpTyp</stringValue>
<type>VARIABLE</type>
</item>
<item id="631" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="632">["query"]@java/lang/Integer@</UITypeHint>
<input>false</input>
<name id="633">variables["query"]</name>
<stringValue id="634">PublishQuery</stringValue>
<type>VARIABLE</type>
</item>
<item id="635" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="636">variables["trnId"]</name>
<stringValue id="637">transactionId</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="638" type="java.util.HashSet">
<item id="639" type="com.j2fe.workflow.definition.Transition">
<name id="640">goto-next</name>
<source id="641">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="642"/>
<directJoin>false</directJoin>
<name id="643">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="644">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="645" type="java.util.HashSet"/>
<targets id="646" type="java.util.HashSet">
<item idref="639" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="620"/>
</item>
</sources>
<targets id="647" type="java.util.HashSet">
<item idref="618" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="588"/>
</item>
</sources>
<targets id="648" type="java.util.HashSet">
<item idref="586" type="com.j2fe.workflow.definition.Transition"/>
<item id="649" type="com.j2fe.workflow.definition.Transition">
<name id="650">no-extraction</name>
<source idref="588"/>
<target idref="478"/>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="564"/>
</item>
</sources>
<targets id="651" type="java.util.HashSet">
<item idref="562" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="547"/>
</item>
</sources>
<targets id="652" type="java.util.HashSet">
<item idref="545" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDSPLIT</type>
</source>
<target idref="512"/>
</item>
</sources>
<targets id="653" type="java.util.HashSet">
<item idref="510" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="505"/>
</item>
</sources>
<targets id="654" type="java.util.HashSet">
<item idref="503" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDJOIN</type>
</source>
<target idref="485"/>
</item>
</sources>
<targets id="655" type="java.util.HashSet">
<item idref="483" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="478"/>
</item>
<item idref="649" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="656" type="java.util.HashSet">
<item idref="476" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="457"/>
</item>
</sources>
<targets id="657" type="java.util.HashSet">
<item idref="455" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="425"/>
</item>
</sources>
<targets id="658" type="java.util.HashSet">
<item idref="423" type="com.j2fe.workflow.definition.Transition"/>
<item id="659" type="com.j2fe.workflow.definition.Transition">
<name id="660">no-extraction</name>
<source idref="425"/>
<target idref="315"/>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="401"/>
</item>
</sources>
<targets id="661" type="java.util.HashSet">
<item idref="399" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="384"/>
</item>
</sources>
<targets id="662" type="java.util.HashSet">
<item idref="382" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDSPLIT</type>
</source>
<target idref="349"/>
</item>
</sources>
<targets id="663" type="java.util.HashSet">
<item idref="347" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="342"/>
</item>
</sources>
<targets id="664" type="java.util.HashSet">
<item idref="340" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDJOIN</type>
</source>
<target idref="322"/>
</item>
</sources>
<targets id="665" type="java.util.HashSet">
<item idref="320" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="315"/>
</item>
<item idref="659" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="666" type="java.util.HashSet">
<item idref="313" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="297"/>
</item>
</sources>
<targets id="667" type="java.util.HashSet">
<item idref="295" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="265"/>
</item>
</sources>
<targets id="668" type="java.util.HashSet">
<item idref="263" type="com.j2fe.workflow.definition.Transition"/>
<item id="669" type="com.j2fe.workflow.definition.Transition">
<name id="670">no-extraction</name>
<source idref="265"/>
<target idref="144"/>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="241"/>
</item>
</sources>
<targets id="671" type="java.util.HashSet">
<item idref="239" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="224"/>
</item>
</sources>
<targets id="672" type="java.util.HashSet">
<item idref="222" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDSPLIT</type>
</source>
<target idref="189"/>
</item>
</sources>
<targets id="673" type="java.util.HashSet">
<item idref="187" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="182"/>
</item>
</sources>
<targets id="674" type="java.util.HashSet">
<item idref="180" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDJOIN</type>
</source>
<target idref="162"/>
</item>
</sources>
<targets id="675" type="java.util.HashSet">
<item idref="160" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="144"/>
</item>
<item idref="669" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="676" type="java.util.HashSet">
<item idref="142" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="112"/>
</item>
</sources>
<targets id="677" type="java.util.HashSet">
<item idref="110" type="com.j2fe.workflow.definition.Transition"/>
<item id="678" type="com.j2fe.workflow.definition.Transition">
<name id="679">no-extraction</name>
<source idref="112"/>
<target idref="2"/>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="88"/>
</item>
</sources>
<targets id="680" type="java.util.HashSet">
<item idref="86" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="71"/>
</item>
</sources>
<targets id="681" type="java.util.HashSet">
<item idref="69" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDSPLIT</type>
</source>
<target idref="36"/>
</item>
</sources>
<targets id="682" type="java.util.HashSet">
<item idref="34" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="29"/>
</item>
</sources>
<targets id="683" type="java.util.HashSet">
<item idref="27" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDJOIN</type>
</source>
<target idref="9"/>
</item>
</sources>
<targets id="684" type="java.util.HashSet">
<item idref="7" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="2"/>
</item>
<item idref="678" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="685" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="686">Mizuho/Publishing</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="687">user1</lastChangeUser>
<lastUpdate id="688">2025-11-20T00:39:59.000+0000</lastUpdate>
<name id="689">MizPublishForMHSCAsset</name>
<nodes id="690" type="java.util.HashSet">
<item idref="485" type="com.j2fe.workflow.definition.Node"/>
<item idref="322" type="com.j2fe.workflow.definition.Node"/>
<item idref="9" type="com.j2fe.workflow.definition.Node"/>
<item idref="162" type="com.j2fe.workflow.definition.Node"/>
<item idref="425" type="com.j2fe.workflow.definition.Node"/>
<item idref="457" type="com.j2fe.workflow.definition.Node"/>
<item idref="564" type="com.j2fe.workflow.definition.Node"/>
<item idref="88" type="com.j2fe.workflow.definition.Node"/>
<item idref="241" type="com.j2fe.workflow.definition.Node"/>
<item idref="401" type="com.j2fe.workflow.definition.Node"/>
<item idref="224" type="com.j2fe.workflow.definition.Node"/>
<item idref="547" type="com.j2fe.workflow.definition.Node"/>
<item idref="71" type="com.j2fe.workflow.definition.Node"/>
<item idref="384" type="com.j2fe.workflow.definition.Node"/>
<item idref="512" type="com.j2fe.workflow.definition.Node"/>
<item idref="349" type="com.j2fe.workflow.definition.Node"/>
<item idref="36" type="com.j2fe.workflow.definition.Node"/>
<item idref="189" type="com.j2fe.workflow.definition.Node"/>
<item idref="112" type="com.j2fe.workflow.definition.Node"/>
<item idref="144" type="com.j2fe.workflow.definition.Node"/>
<item idref="478" type="com.j2fe.workflow.definition.Node"/>
<item idref="315" type="com.j2fe.workflow.definition.Node"/>
<item idref="588" type="com.j2fe.workflow.definition.Node"/>
<item idref="620" type="com.j2fe.workflow.definition.Node"/>
<item idref="641" type="com.j2fe.workflow.definition.Node"/>
<item idref="2" type="com.j2fe.workflow.definition.Node"/>
<item idref="505" type="com.j2fe.workflow.definition.Node"/>
<item idref="29" type="com.j2fe.workflow.definition.Node"/>
<item idref="342" type="com.j2fe.workflow.definition.Node"/>
<item idref="182" type="com.j2fe.workflow.definition.Node"/>
<item idref="265" type="com.j2fe.workflow.definition.Node"/>
<item idref="297" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>true</optimize>
<parameter id="691" type="java.util.HashMap">
<entry>
<key id="692" type="java.lang.String">AssetQueue</key>
<value id="693" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="694">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="695"/>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="696" type="java.lang.String">Handle Extraction Failures</key>
<value id="697" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="698">com.thegoldensource.subscription.ExceptionHandlingMode</className>
<clazz>com.thegoldensource.subscription.ExceptionHandlingMode</clazz>
<description id="699">This value is used for Exception Handling configuration.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="700" type="java.lang.String">LegalAgreementQueue</key>
<value id="701" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="702">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="703"/>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="704" type="java.lang.String">No. Of Parallel Branches</key>
<value id="705" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="706">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="707">Defines how many parallel branches to be run for publishing.</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="708" type="java.lang.String">PartyQueue</key>
<value id="709" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="710">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="711"/>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="712" type="java.lang.String">PrtPurpTyp</key>
<value id="713" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="714">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="715" type="java.lang.String">PublishingBulkSize</key>
<value id="716" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="717">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="718">Defines how many entities you want to extract in one bulk.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="719" type="java.lang.String">Threshold for Extraction Failures</key>
<value id="720" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="721">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="722">Value for this field should be specified in x/y format, both x and y is numeric. 
Here x is percentage of instruments allowed to fail during extraction and y is minimum sampling size.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="723" type="java.lang.String">transactionId</key>
<value id="724" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="725">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
</parameter>
<permissions id="726" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>false</purgeAtEnd>
<retries>0</retries>
<startNode idref="641"/>
<status>RELEASED</status>
<variables id="727" type="java.util.HashMap">
<entry>
<key id="728" type="java.lang.String">AssetQueue</key>
<value id="729" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="730">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="731"/>
<persistent>false</persistent>
<value id="732" type="java.lang.String">jms/queue/security</value>
</value>
</entry>
<entry>
<key id="733" type="java.lang.String">Handle Extraction Failures</key>
<value id="734" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="735">com.thegoldensource.subscription.ExceptionHandlingMode</className>
<clazz>com.thegoldensource.subscription.ExceptionHandlingMode</clazz>
<description id="736">This value is used for Exception Handling configuration.</description>
<persistent>false</persistent>
<value id="737" type="com.thegoldensource.subscription.ExceptionHandlingMode">DO_NOT_HANDLE</value>
</value>
</entry>
<entry>
<key id="738" type="java.lang.String">LegalAgreementQueue</key>
<value id="739" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="740">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="741"/>
<persistent>false</persistent>
<value id="742" type="java.lang.String">jms/queue/legalAgreement</value>
</value>
</entry>
<entry>
<key id="743" type="java.lang.String">No. Of Parallel Branches</key>
<value id="744" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="745">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="746">Defines how many parallel branches to be run for publishing.</description>
<persistent>false</persistent>
<value id="747" type="java.lang.Integer">5</value>
</value>
</entry>
<entry>
<key id="748" type="java.lang.String">PartyQueue</key>
<value id="749" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="750">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="751"/>
<persistent>false</persistent>
<value id="752" type="java.lang.String">jms/queue/issuer</value>
</value>
</entry>
<entry>
<key id="753" type="java.lang.String">PrtPurpTyp</key>
<value id="754" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="755">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="756" type="java.lang.String">INTEREST</value>
</value>
</entry>
<entry>
<key id="757" type="java.lang.String">PublishingBulkSize</key>
<value id="758" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="759">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="760">Defines how many entities you want to extract in one bulk.</description>
<persistent>false</persistent>
<value id="761" type="java.lang.Integer">100</value>
</value>
</entry>
<entry>
<key id="762" type="java.lang.String">Threshold for Extraction Failures</key>
<value id="763" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="764">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="765">Value for this field should be specified in x/y format, both x and y is numeric. 
Here x is percentage of instruments allowed to fail during extraction and y is minimum sampling size.</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="766" type="java.lang.String">transactionId</key>
<value id="767" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="768">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
</variables>
<version>11</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
