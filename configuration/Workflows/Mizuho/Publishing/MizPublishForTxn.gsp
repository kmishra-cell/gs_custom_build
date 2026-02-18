<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.07">
<package-comment/>
<businessobject displayString="23 - Persisted PubAuditid varible" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>false</alwaysPersist>
<clustered>false</clustered>
<comment id="1">Persisted PubAuditid varible</comment>
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
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="11"/>
<directJoin>false</directJoin>
<name id="12">Add TRN_ID to PBAT</name>
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
<name id="19">indexedParameters[0]</name>
<stringValue id="20">transactionId</stringValue>
<type>VARIABLE</type>
</item>
<item id="21" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="22">indexedParameters[1]</name>
<stringValue id="23">auditIdentifier</stringValue>
<type>VARIABLE</type>
</item>
<item id="24" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="25">querySQL</name>
<stringValue id="26">update ft_t_pbat set trn_id = ? where pub_audit_id = ?</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<persistentVariables id="27" type="java.util.HashSet">
<item id="28" type="java.lang.String">auditIdentifier
1000</item>
</persistentVariables>
<sources id="29" type="java.util.HashSet">
<item id="30" type="com.j2fe.workflow.definition.Transition">
<name id="31">goto-next</name>
<source id="32">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="33"/>
<directJoin>true</directJoin>
<name id="34">Synchronize</name>
<nodeHandler>com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandler>
<nodeHandlerClass id="35">com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandlerClass>
<persistentVariables id="36" type="java.util.HashSet">
<item id="37" type="java.lang.String">auditIdentifier
1000</item>
</persistentVariables>
<sources id="38" type="java.util.HashSet">
<item id="39" type="com.j2fe.workflow.definition.Transition">
<name id="40">goto-next</name>
<source id="41">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="42"/>
<directJoin>false</directJoin>
<name id="43">Call Subworkflow</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="44">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="45" type="java.util.HashSet">
<item id="46" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="47">["AuditId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="48">input["AuditId"]</name>
<stringValue id="49">auditIdentifier</stringValue>
<type>VARIABLE</type>
</item>
<item id="50" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="51">["ExtDefs"]@[Ljava/lang/Object;@</UITypeHint>
<input>true</input>
<name id="52">input["ExtDefs"]</name>
<stringValue id="53">extDefsPerBranch</stringValue>
<type>VARIABLE</type>
</item>
<item id="54" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="55">["Handle Extraction Failures"]@com/thegoldensource/subscription/ExceptionHandlingMode@</UITypeHint>
<input>true</input>
<name id="56">input["Handle Extraction Failures"]</name>
<stringValue id="57">Handle Extraction Failures</stringValue>
<type>VARIABLE</type>
</item>
<item id="58" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="59">["JMSDestination"]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="60">input["JMSDestination"]</name>
<stringValue id="61">LegalAgreementQueue</stringValue>
<type>VARIABLE</type>
</item>
<item id="62" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="63">["PublishingBulkSize"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="64">input["PublishingBulkSize"]</name>
<stringValue id="65">PublishingBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="66" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="67">["Threshold for Extraction Failures"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="68">input["Threshold for Extraction Failures"]</name>
<stringValue id="69">Threshold for Extraction Failures</stringValue>
<type>VARIABLE</type>
</item>
<item id="70" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="71">name</name>
<stringValue id="72">MizBulkExtraction</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<persistentVariables id="73" type="java.util.HashSet">
<item id="74" type="java.lang.String">auditIdentifier
1000</item>
</persistentVariables>
<sources id="75" type="java.util.HashSet">
<item id="76" type="com.j2fe.workflow.definition.Transition">
<name id="77">goto-next</name>
<source id="78">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="79"/>
<directJoin>true</directJoin>
<name id="80">Bulk Items</name>
<nodeHandler>com.j2fe.general.activities.BulkItems</nodeHandler>
<nodeHandlerClass id="81">com.j2fe.general.activities.BulkItems</nodeHandlerClass>
<parameters id="82" type="java.util.HashSet">
<item id="83" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="84">bulk</name>
<stringValue id="85">pubBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="86" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="87">input</name>
<stringValue id="88">extractDefinitions</stringValue>
<type>VARIABLE</type>
</item>
<item id="89" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="90">output</name>
<stringValue id="91">extDefsPerBranch</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<persistentVariables id="92" type="java.util.HashSet">
<item id="93" type="java.lang.String">auditIdentifier
1000</item>
</persistentVariables>
<sources id="94" type="java.util.HashSet">
<item id="95" type="com.j2fe.workflow.definition.Transition">
<name id="96">goto-next</name>
<source id="97">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="98"/>
<directJoin>false</directJoin>
<name id="99">Bean Shell Script (Standard)</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="100">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="101" type="java.util.HashSet">
<item id="102" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="103">statements</name>
<stringValue id="104">if(NoOfThreads &lt;= 0) {&#13;
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
<item id="105" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="106">["NoOfThreads"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="107">variables["NoOfThreads"]</name>
<stringValue id="108">No. Of Parallel Branches</stringValue>
<type>VARIABLE</type>
</item>
<item id="109" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="110">["bulkSize"]@java/lang/Integer@</UITypeHint>
<input>false</input>
<name id="111">variables["bulkSize"]</name>
<stringValue id="112">pubBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="113" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="114">["items"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="115">variables["items"]</name>
<stringValue id="116">extractDefinitions</stringValue>
<type>VARIABLE</type>
<variablePart id="117">length</variablePart>
</item>
</parameters>
<persistentVariables id="118" type="java.util.HashSet">
<item id="119" type="java.lang.String">auditIdentifier
1000</item>
</persistentVariables>
<sources id="120" type="java.util.HashSet">
<item id="121" type="com.j2fe.workflow.definition.Transition">
<name id="122">extraction</name>
<source id="123">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="124"/>
<directJoin>false</directJoin>
<name id="125">MHSC Legal Agreement Extraction Log</name>
<nodeHandler>com.thegoldensource.publishing.activity.WriteExtractionLog</nodeHandler>
<nodeHandlerClass id="126">com.thegoldensource.publishing.activity.WriteExtractionLog</nodeHandlerClass>
<parameters id="127" type="java.util.HashSet">
<item id="128" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="129">auditId</name>
<stringValue id="130">auditIdentifier</stringValue>
<type>VARIABLE</type>
</item>
<item id="131" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="132">entityMode</name>
<stringValue id="133">MODEL_ENTITY</stringValue>
<type>CONSTANT</type>
</item>
<item id="134" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="135">eql</name>
<stringValue id="136">PublishQuery</stringValue>
<type>VARIABLE</type>
</item>
<item id="137" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="138">extractDefinitions</name>
<stringValue id="139">extractDefinitions</stringValue>
<type>VARIABLE</type>
</item>
<item id="140" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="141">extractorFactory</name>
<stringValue id="142">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="143" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="144">maxExtractCount</name>
<stringValue id="145">PublishingBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="146" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="147">modelName</name>
<stringValue id="148">LAGR_PUB</stringValue>
<type>CONSTANT</type>
</item>
<item id="149" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="150">queryParameter</name>
<stringValue id="151">queryParameter</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<persistentVariables id="152" type="java.util.HashSet">
<item id="153" type="java.lang.String">auditIdentifier
1000</item>
</persistentVariables>
<sources id="154" type="java.util.HashSet">
<item id="155" type="com.j2fe.workflow.definition.Transition">
<name id="156">goto-next</name>
<source id="157">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="158"/>
<directJoin>false</directJoin>
<name id="159">MHSC Legal Agreement Publish Query</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="160">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="161" type="java.util.HashSet">
<item id="162" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="163">statements</name>
<stringValue id="164">String query = "&lt;sql&gt; lagr_oid IN (";&#13;
query += "SELECT lagr_oid FROM (";&#13;
query += "SELECT LAGRPUB.lagr_oid FROM FT_T_LAGR LAGRPUB ";&#13;
query += "WHERE ORG_ID = 'MHSC' AND lagr_oid IN (";&#13;
query += "SELECT XREF_TBL_ROW_OID FROM ft_t_msgp ";&#13;
query += "WHERE trn_id = '" + trnId + "' ";&#13;
query += "AND ENTITY_CHG_IND IN ('C','U','D') ";&#13;
query += "AND XREF_TBL_TYP = 'LAGR')";&#13;
query += ") AS lagr_filtered ";&#13;
query += "WHERE (end_tms IS NULL OR DATE(sysdate()) = DATE(end_tms))";&#13;
query += ") AND (end_tms IS NULL OR DATE(sysdate()) = DATE(end_tms))&lt;/sql&gt;";</stringValue>
<type>CONSTANT</type>
</item>
<item id="165" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="166">["query"]@java/lang/Integer@</UITypeHint>
<input>false</input>
<name id="167">variables["query"]</name>
<stringValue id="168">PublishQuery</stringValue>
<type>VARIABLE</type>
</item>
<item id="169" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="170">variables["trnId"]</name>
<stringValue id="171">transactionId</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="172" type="java.util.HashSet">
<item id="173" type="com.j2fe.workflow.definition.Transition">
<name id="174">goto-next</name>
<source id="175">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="176"/>
<directJoin>false</directJoin>
<name id="177">Add TRN_ID to PBAT</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="178">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="179" type="java.util.HashSet">
<item id="180" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="181">database</name>
<stringValue id="182">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="183" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="184">indexedParameters[0]</name>
<stringValue id="185">transactionId</stringValue>
<type>VARIABLE</type>
</item>
<item id="186" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="187">indexedParameters[1]</name>
<stringValue id="188">auditIdentifier</stringValue>
<type>VARIABLE</type>
</item>
<item id="189" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="190">querySQL</name>
<stringValue id="191">update ft_t_pbat set trn_id = ? where pub_audit_id = ?</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<persistentVariables id="192" type="java.util.HashSet">
<item id="193" type="java.lang.String">auditIdentifier
1000</item>
</persistentVariables>
<sources id="194" type="java.util.HashSet">
<item id="195" type="com.j2fe.workflow.definition.Transition">
<name id="196">goto-next</name>
<source id="197">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="198"/>
<directJoin>true</directJoin>
<name id="199">Synchronize</name>
<nodeHandler>com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandler>
<nodeHandlerClass id="200">com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandlerClass>
<persistentVariables id="201" type="java.util.HashSet">
<item id="202" type="java.lang.String">auditIdentifier
1000</item>
</persistentVariables>
<sources id="203" type="java.util.HashSet">
<item id="204" type="com.j2fe.workflow.definition.Transition">
<name id="205">goto-next</name>
<source id="206">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="207"/>
<directJoin>false</directJoin>
<name id="208">Call Subworkflow</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="209">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="210" type="java.util.HashSet">
<item id="211" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="212">["AuditId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="213">input["AuditId"]</name>
<stringValue id="214">auditIdentifier</stringValue>
<type>VARIABLE</type>
</item>
<item id="215" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="216">["ExtDefs"]@[Ljava/lang/Object;@</UITypeHint>
<input>true</input>
<name id="217">input["ExtDefs"]</name>
<stringValue id="218">extDefsPerBranch</stringValue>
<type>VARIABLE</type>
</item>
<item id="219" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="220">["Handle Extraction Failures"]@com/thegoldensource/subscription/ExceptionHandlingMode@</UITypeHint>
<input>true</input>
<name id="221">input["Handle Extraction Failures"]</name>
<stringValue id="222">Handle Extraction Failures</stringValue>
<type>VARIABLE</type>
</item>
<item id="223" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="224">["JMSDestination"]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="225">input["JMSDestination"]</name>
<stringValue id="226">LegalAgreementQueue</stringValue>
<type>VARIABLE</type>
</item>
<item id="227" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="228">["PublishingBulkSize"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="229">input["PublishingBulkSize"]</name>
<stringValue id="230">PublishingBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="231" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="232">["Threshold for Extraction Failures"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="233">input["Threshold for Extraction Failures"]</name>
<stringValue id="234">Threshold for Extraction Failures</stringValue>
<type>VARIABLE</type>
</item>
<item id="235" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="236">name</name>
<stringValue id="237">MizBulkExtraction</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<persistentVariables id="238" type="java.util.HashSet">
<item id="239" type="java.lang.String">auditIdentifier
1000</item>
</persistentVariables>
<sources id="240" type="java.util.HashSet">
<item id="241" type="com.j2fe.workflow.definition.Transition">
<name id="242">goto-next</name>
<source id="243">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="244"/>
<directJoin>true</directJoin>
<name id="245">Bulk Items</name>
<nodeHandler>com.j2fe.general.activities.BulkItems</nodeHandler>
<nodeHandlerClass id="246">com.j2fe.general.activities.BulkItems</nodeHandlerClass>
<parameters id="247" type="java.util.HashSet">
<item id="248" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="249">bulk</name>
<stringValue id="250">pubBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="251" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="252">input</name>
<stringValue id="253">extractDefinitions</stringValue>
<type>VARIABLE</type>
</item>
<item id="254" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="255">output</name>
<stringValue id="256">extDefsPerBranch</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<persistentVariables id="257" type="java.util.HashSet">
<item id="258" type="java.lang.String">auditIdentifier
1000</item>
</persistentVariables>
<sources id="259" type="java.util.HashSet">
<item id="260" type="com.j2fe.workflow.definition.Transition">
<name id="261">goto-next</name>
<source id="262">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="263"/>
<directJoin>false</directJoin>
<name id="264">Bean Shell Script (Standard)</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="265">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="266" type="java.util.HashSet">
<item id="267" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="268">statements</name>
<stringValue id="269">if(NoOfThreads &lt;= 0) {&#13;
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
<item id="270" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="271">["NoOfThreads"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="272">variables["NoOfThreads"]</name>
<stringValue id="273">No. Of Parallel Branches</stringValue>
<type>VARIABLE</type>
</item>
<item id="274" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="275">["bulkSize"]@java/lang/Integer@</UITypeHint>
<input>false</input>
<name id="276">variables["bulkSize"]</name>
<stringValue id="277">pubBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="278" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="279">["items"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="280">variables["items"]</name>
<stringValue id="281">extractDefinitions</stringValue>
<type>VARIABLE</type>
<variablePart id="282">length</variablePart>
</item>
</parameters>
<persistentVariables id="283" type="java.util.HashSet">
<item id="284" type="java.lang.String">auditIdentifier
1000</item>
</persistentVariables>
<sources id="285" type="java.util.HashSet">
<item id="286" type="com.j2fe.workflow.definition.Transition">
<name id="287">extraction</name>
<source id="288">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="289"/>
<directJoin>false</directJoin>
<name id="290">non-MHSC Legal Agreement Extraction Log</name>
<nodeHandler>com.thegoldensource.publishing.activity.WriteExtractionLog</nodeHandler>
<nodeHandlerClass id="291">com.thegoldensource.publishing.activity.WriteExtractionLog</nodeHandlerClass>
<parameters id="292" type="java.util.HashSet">
<item id="293" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="294">auditId</name>
<stringValue id="295">auditIdentifier</stringValue>
<type>VARIABLE</type>
</item>
<item id="296" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="297">entityMode</name>
<stringValue id="298">MODEL_ENTITY</stringValue>
<type>CONSTANT</type>
</item>
<item id="299" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="300">eql</name>
<stringValue id="301">PublishQuery</stringValue>
<type>VARIABLE</type>
</item>
<item id="302" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="303">extractDefinitions</name>
<stringValue id="304">extractDefinitions</stringValue>
<type>VARIABLE</type>
</item>
<item id="305" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="306">extractorFactory</name>
<stringValue id="307">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="308" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="309">maxExtractCount</name>
<stringValue id="310">PublishingBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="311" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="312">modelName</name>
<stringValue id="313">LAGR_PUB</stringValue>
<type>CONSTANT</type>
</item>
<item id="314" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="315">queryParameter</name>
<stringValue id="316">queryParameter</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<persistentVariables id="317" type="java.util.HashSet">
<item id="318" type="java.lang.String">auditIdentifier
1000</item>
</persistentVariables>
<sources id="319" type="java.util.HashSet">
<item id="320" type="com.j2fe.workflow.definition.Transition">
<name id="321">goto-next</name>
<source id="322">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="323"/>
<directJoin>false</directJoin>
<name id="324">non-MHSC Legal Agreement Publish Query</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="325">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="326" type="java.util.HashSet">
<item id="327" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="328">statements</name>
<stringValue id="329">String query = "&lt;sql&gt; lagr_oid IN (";
query += "SELECT lagr_oid FROM (";
query += "SELECT LAGRPUB.lagr_oid FROM FT_T_LAGR LAGRPUB ";
query += "WHERE ORG_ID != 'MHSC' AND lagr_oid IN (";
query += "SELECT XREF_TBL_ROW_OID FROM ft_t_msgp ";
query += "WHERE trn_id = '" + trnId + "' ";
query += "AND ENTITY_CHG_IND IN ('C','U','D') AND XREF_TBL_TYP = 'LAGR')";
query += ") AS lagr_filtered ";
query += "WHERE (end_tms IS NULL OR DATE(sysdate()) = DATE(end_tms))";
query += ") AND (end_tms IS NULL OR DATE(sysdate()) = DATE(end_tms))&lt;/sql&gt;";</stringValue>
<type>CONSTANT</type>
</item>
<item id="330" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="331">["query"]@java/lang/Integer@</UITypeHint>
<input>false</input>
<name id="332">variables["query"]</name>
<stringValue id="333">PublishQuery</stringValue>
<type>VARIABLE</type>
</item>
<item id="334" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="335">variables["trnId"]</name>
<stringValue id="336">transactionId</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<persistentVariables id="337" type="java.util.HashSet">
<item id="338" type="java.lang.String">auditIdentifier
0000</item>
</persistentVariables>
<sources id="339" type="java.util.HashSet">
<item id="340" type="com.j2fe.workflow.definition.Transition">
<name id="341">goto-next</name>
<source id="342">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="343"/>
<directJoin>false</directJoin>
<name id="344">NOP</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="345">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="346" type="java.util.HashSet">
<item id="347" type="com.j2fe.workflow.definition.Transition">
<name id="348">goto-next</name>
<source id="349">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="350"/>
<directJoin>false</directJoin>
<name id="351">Add TRN_ID to PBAT</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="352">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="353" type="java.util.HashSet">
<item id="354" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="355">database</name>
<stringValue id="356">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="357" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="358">indexedParameters[0]</name>
<stringValue id="359">transactionId</stringValue>
<type>VARIABLE</type>
</item>
<item id="360" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="361">indexedParameters[1]</name>
<stringValue id="362">auditIdentifier</stringValue>
<type>VARIABLE</type>
</item>
<item id="363" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="364">querySQL</name>
<stringValue id="365">update ft_t_pbat set trn_id = ? where pub_audit_id = ?</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<persistentVariables id="366" type="java.util.HashSet">
<item id="367" type="java.lang.String">auditIdentifier
1000</item>
</persistentVariables>
<sources id="368" type="java.util.HashSet">
<item id="369" type="com.j2fe.workflow.definition.Transition">
<name id="370">goto-next</name>
<source id="371">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="372"/>
<directJoin>true</directJoin>
<name id="373">Synchronize</name>
<nodeHandler>com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandler>
<nodeHandlerClass id="374">com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandlerClass>
<persistentVariables id="375" type="java.util.HashSet">
<item id="376" type="java.lang.String">auditIdentifier
1000</item>
</persistentVariables>
<sources id="377" type="java.util.HashSet">
<item id="378" type="com.j2fe.workflow.definition.Transition">
<name id="379">goto-next</name>
<source id="380">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="381"/>
<directJoin>false</directJoin>
<name id="382">Call Subworkflow</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="383">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="384" type="java.util.HashSet">
<item id="385" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="386">["AuditId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="387">input["AuditId"]</name>
<stringValue id="388">auditIdentifier</stringValue>
<type>VARIABLE</type>
</item>
<item id="389" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="390">["ExtDefs"]@[Ljava/lang/Object;@</UITypeHint>
<input>true</input>
<name id="391">input["ExtDefs"]</name>
<stringValue id="392">extDefsPerBranch</stringValue>
<type>VARIABLE</type>
</item>
<item id="393" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="394">["Handle Extraction Failures"]@com/thegoldensource/subscription/ExceptionHandlingMode@</UITypeHint>
<input>true</input>
<name id="395">input["Handle Extraction Failures"]</name>
<stringValue id="396">Handle Extraction Failures</stringValue>
<type>VARIABLE</type>
</item>
<item id="397" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="398">["JMSDestination"]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="399">input["JMSDestination"]</name>
<stringValue id="400">AssetQueue</stringValue>
<type>VARIABLE</type>
</item>
<item id="401" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="402">["PublishingBulkSize"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="403">input["PublishingBulkSize"]</name>
<stringValue id="404">PublishingBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="405" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="406">["Threshold for Extraction Failures"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="407">input["Threshold for Extraction Failures"]</name>
<stringValue id="408">Threshold for Extraction Failures</stringValue>
<type>VARIABLE</type>
</item>
<item id="409" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="410">name</name>
<stringValue id="411">MizBulkExtraction</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<persistentVariables id="412" type="java.util.HashSet">
<item id="413" type="java.lang.String">auditIdentifier
1000</item>
</persistentVariables>
<sources id="414" type="java.util.HashSet">
<item id="415" type="com.j2fe.workflow.definition.Transition">
<name id="416">goto-next</name>
<source id="417">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="418"/>
<directJoin>true</directJoin>
<name id="419">Bulk Items</name>
<nodeHandler>com.j2fe.general.activities.BulkItems</nodeHandler>
<nodeHandlerClass id="420">com.j2fe.general.activities.BulkItems</nodeHandlerClass>
<parameters id="421" type="java.util.HashSet">
<item id="422" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="423">bulk</name>
<stringValue id="424">pubBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="425" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="426">input</name>
<stringValue id="427">extractDefinitions</stringValue>
<type>VARIABLE</type>
</item>
<item id="428" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="429">output</name>
<stringValue id="430">extDefsPerBranch</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<persistentVariables id="431" type="java.util.HashSet">
<item id="432" type="java.lang.String">auditIdentifier
1000</item>
</persistentVariables>
<sources id="433" type="java.util.HashSet">
<item id="434" type="com.j2fe.workflow.definition.Transition">
<name id="435">goto-next</name>
<source id="436">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="437"/>
<directJoin>false</directJoin>
<name id="438">Bean Shell Script (Standard)</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="439">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="440" type="java.util.HashSet">
<item id="441" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="442">statements</name>
<stringValue id="443">if(NoOfThreads &lt;= 0) {
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
<item id="444" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="445">["NoOfThreads"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="446">variables["NoOfThreads"]</name>
<stringValue id="447">No. Of Parallel Branches</stringValue>
<type>VARIABLE</type>
</item>
<item id="448" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="449">["bulkSize"]@java/lang/Integer@</UITypeHint>
<input>false</input>
<name id="450">variables["bulkSize"]</name>
<stringValue id="451">pubBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="452" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="453">["items"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="454">variables["items"]</name>
<stringValue id="455">extractDefinitions</stringValue>
<type>VARIABLE</type>
<variablePart id="456">length</variablePart>
</item>
</parameters>
<persistentVariables id="457" type="java.util.HashSet">
<item id="458" type="java.lang.String">auditIdentifier
1000</item>
</persistentVariables>
<sources id="459" type="java.util.HashSet">
<item id="460" type="com.j2fe.workflow.definition.Transition">
<name id="461">extraction</name>
<source id="462">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="463"/>
<directJoin>false</directJoin>
<name id="464">Asset Extraction Log</name>
<nodeHandler>com.thegoldensource.publishing.activity.WriteExtractionLog</nodeHandler>
<nodeHandlerClass id="465">com.thegoldensource.publishing.activity.WriteExtractionLog</nodeHandlerClass>
<parameters id="466" type="java.util.HashSet">
<item id="467" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="468">auditId</name>
<stringValue id="469">auditIdentifier</stringValue>
<type>VARIABLE</type>
</item>
<item id="470" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="471">entityMode</name>
<stringValue id="472">MODEL_ENTITY</stringValue>
<type>CONSTANT</type>
</item>
<item id="473" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="474">eql</name>
<stringValue id="475">PublishQuery</stringValue>
<type>VARIABLE</type>
</item>
<item id="476" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="477">extractDefinitions</name>
<stringValue id="478">extractDefinitions</stringValue>
<type>VARIABLE</type>
</item>
<item id="479" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="480">extractorFactory</name>
<stringValue id="481">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="482" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="483">maxExtractCount</name>
<stringValue id="484">PublishingBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="485" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="486">modelName</name>
<stringValue id="487">ISSUPUB</stringValue>
<type>CONSTANT</type>
</item>
<item id="488" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="489">queryParameter</name>
<stringValue id="490">queryParameter</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<persistentVariables id="491" type="java.util.HashSet">
<item id="492" type="java.lang.String">auditIdentifier
1000</item>
</persistentVariables>
<sources id="493" type="java.util.HashSet">
<item id="494" type="com.j2fe.workflow.definition.Transition">
<name id="495">goto-next</name>
<source id="496">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="497"/>
<directJoin>false</directJoin>
<name id="498">Asset Publish Query</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="499">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="500" type="java.util.HashSet">
<item id="501" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="502">statements</name>
<objectValue id="503" type="java.lang.String">String query = "&lt;sql&gt;instr_id IN (SELECT INSTR_ID FROM (";&#13;
query += "SELECT ISSUPUB.INSTR_ID FROM FT_T_ISSU ISSUPUB ";&#13;
query += "WHERE ISSUPUB.ISS_TYP NOT IN ('PORT', 'MISC') AND instr_id IN (";&#13;
query += "SELECT XREF_TBL_ROW_OID FROM ft_t_msgp ";&#13;
query += "WHERE trn_id = '" + trnId + "' AND ENTITY_CHG_IND IN ('C','U') AND XREF_TBL_TYP = 'ISSU') ";&#13;
&#13;
query += "UNION ";&#13;
&#13;
query += "SELECT ISSUPUB.INSTR_ID FROM FT_T_ISSU ISSUPUB ";&#13;
query += "WHERE ISSUPUB.ISS_TYP NOT IN ('PORT', 'MISC') AND instr_issr_id IN (";&#13;
query += "SELECT XREF_TBL_ROW_OID FROM ft_t_msgp ";&#13;
query += "WHERE trn_id = '" + trnId + "' AND ENTITY_CHG_IND IN ('C','U') AND XREF_TBL_TYP = 'ISSR') ";&#13;
&#13;
query += "UNION ";&#13;
&#13;
query += "SELECT ISSUPUB.INSTR_ID FROM FT_T_ISSU ISSUPUB ";&#13;
query += "WHERE ISSUPUB.ISS_TYP NOT IN ('PORT', 'MISC') AND instr_issr_id IN (";&#13;
query += "SELECT instr_issr_id FROM FT_T_ISSR ";&#13;
query += "WHERE fins_inst_mnem IN (";&#13;
query += "SELECT XREF_TBL_ROW_OID FROM ft_t_msgp ";&#13;
query += "WHERE trn_id = '" + trnId + "' AND ENTITY_CHG_IND IN ('C','U') AND XREF_TBL_TYP = 'FINS'))";&#13;
query += ") AS combined_instr ";&#13;
&#13;
query += "WHERE INSTR_ID IN (";&#13;
query += "SELECT instr_id FROM ft_t_isgp ";&#13;
query += "WHERE PRT_PURP_TYP = '" + pubSoi + "' AND end_tms IS NULL)";&#13;
query += ") AND end_tms IS NULL&lt;/sql&gt;";&#13;
</objectValue>
<type>CONSTANT</type>
</item>
<item id="504" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="505">variables["pubSoi"]</name>
<stringValue id="506">PrtPurpTyp</stringValue>
<type>VARIABLE</type>
</item>
<item id="507" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="508">["query"]@java/lang/Integer@</UITypeHint>
<input>false</input>
<name id="509">variables["query"]</name>
<stringValue id="510">PublishQuery</stringValue>
<type>VARIABLE</type>
</item>
<item id="511" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="512">variables["trnId"]</name>
<stringValue id="513">transactionId</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="514" type="java.util.HashSet">
<item id="515" type="com.j2fe.workflow.definition.Transition">
<name id="516">goto-next</name>
<source id="517">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="518"/>
<directJoin>false</directJoin>
<name id="519">NOP</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="520">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="521" type="java.util.HashSet">
<item id="522" type="com.j2fe.workflow.definition.Transition">
<name id="523">goto-next</name>
<source id="524">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="525"/>
<directJoin>false</directJoin>
<name id="526">Add TRN_ID to PBAT</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="527">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="528" type="java.util.HashSet">
<item id="529" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="530">database</name>
<stringValue id="531">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="532" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="533">indexedParameters[0]</name>
<stringValue id="534">transactionId</stringValue>
<type>VARIABLE</type>
</item>
<item id="535" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="536">indexedParameters[1]</name>
<stringValue id="537">auditIdentifier</stringValue>
<type>VARIABLE</type>
</item>
<item id="538" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="539">querySQL</name>
<stringValue id="540">update ft_t_pbat set trn_id = ? where pub_audit_id = ?</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<persistentVariables id="541" type="java.util.HashSet">
<item id="542" type="java.lang.String">auditIdentifier
1000</item>
</persistentVariables>
<sources id="543" type="java.util.HashSet">
<item id="544" type="com.j2fe.workflow.definition.Transition">
<name id="545">goto-next</name>
<source id="546">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="547"/>
<directJoin>true</directJoin>
<name id="548">Synchronize</name>
<nodeHandler>com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandler>
<nodeHandlerClass id="549">com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandlerClass>
<persistentVariables id="550" type="java.util.HashSet">
<item id="551" type="java.lang.String">auditIdentifier
1000</item>
</persistentVariables>
<sources id="552" type="java.util.HashSet">
<item id="553" type="com.j2fe.workflow.definition.Transition">
<name id="554">goto-next</name>
<source id="555">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="556"/>
<directJoin>false</directJoin>
<name id="557">Call Subworkflow</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="558">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="559" type="java.util.HashSet">
<item id="560" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="561">["AuditId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="562">input["AuditId"]</name>
<stringValue id="563">auditIdentifier</stringValue>
<type>VARIABLE</type>
</item>
<item id="564" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="565">["ExtDefs"]@[Ljava/lang/Object;@</UITypeHint>
<input>true</input>
<name id="566">input["ExtDefs"]</name>
<stringValue id="567">extDefsPerBranch</stringValue>
<type>VARIABLE</type>
</item>
<item id="568" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="569">["Handle Extraction Failures"]@com/thegoldensource/subscription/ExceptionHandlingMode@</UITypeHint>
<input>true</input>
<name id="570">input["Handle Extraction Failures"]</name>
<stringValue id="571">Handle Extraction Failures</stringValue>
<type>VARIABLE</type>
</item>
<item id="572" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="573">["JMSDestination"]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="574">input["JMSDestination"]</name>
<stringValue id="575">PartyQueue</stringValue>
<type>VARIABLE</type>
</item>
<item id="576" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="577">["PublishingBulkSize"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="578">input["PublishingBulkSize"]</name>
<stringValue id="579">PublishingBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="580" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="581">["Threshold for Extraction Failures"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="582">input["Threshold for Extraction Failures"]</name>
<stringValue id="583">Threshold for Extraction Failures</stringValue>
<type>VARIABLE</type>
</item>
<item id="584" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="585">name</name>
<stringValue id="586">MizBulkExtraction</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<persistentVariables id="587" type="java.util.HashSet">
<item id="588" type="java.lang.String">auditIdentifier
1000</item>
</persistentVariables>
<sources id="589" type="java.util.HashSet">
<item id="590" type="com.j2fe.workflow.definition.Transition">
<name id="591">goto-next</name>
<source id="592">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="593"/>
<directJoin>true</directJoin>
<name id="594">Bulk Items</name>
<nodeHandler>com.j2fe.general.activities.BulkItems</nodeHandler>
<nodeHandlerClass id="595">com.j2fe.general.activities.BulkItems</nodeHandlerClass>
<parameters id="596" type="java.util.HashSet">
<item id="597" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="598">bulk</name>
<stringValue id="599">pubBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="600" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="601">input</name>
<stringValue id="602">extractDefinitions</stringValue>
<type>VARIABLE</type>
</item>
<item id="603" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="604">output</name>
<stringValue id="605">extDefsPerBranch</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<persistentVariables id="606" type="java.util.HashSet">
<item id="607" type="java.lang.String">auditIdentifier
1000</item>
</persistentVariables>
<sources id="608" type="java.util.HashSet">
<item id="609" type="com.j2fe.workflow.definition.Transition">
<name id="610">goto-next</name>
<source id="611">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="612"/>
<directJoin>false</directJoin>
<name id="613">Bean Shell Script (Standard)</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="614">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="615" type="java.util.HashSet">
<item id="616" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="617">statements</name>
<stringValue id="618">if(NoOfThreads &lt;= 0) {
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
<item id="619" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="620">["NoOfThreads"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="621">variables["NoOfThreads"]</name>
<stringValue id="622">No. Of Parallel Branches</stringValue>
<type>VARIABLE</type>
</item>
<item id="623" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="624">["bulkSize"]@java/lang/Integer@</UITypeHint>
<input>false</input>
<name id="625">variables["bulkSize"]</name>
<stringValue id="626">pubBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="627" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="628">["items"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="629">variables["items"]</name>
<stringValue id="630">extractDefinitions</stringValue>
<type>VARIABLE</type>
<variablePart id="631">length</variablePart>
</item>
</parameters>
<persistentVariables id="632" type="java.util.HashSet">
<item id="633" type="java.lang.String">auditIdentifier
1000</item>
</persistentVariables>
<sources id="634" type="java.util.HashSet">
<item id="635" type="com.j2fe.workflow.definition.Transition">
<name id="636">extraction</name>
<source id="637">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="638"/>
<directJoin>false</directJoin>
<name id="639">Party Extraction Log</name>
<nodeHandler>com.thegoldensource.publishing.activity.WriteExtractionLog</nodeHandler>
<nodeHandlerClass id="640">com.thegoldensource.publishing.activity.WriteExtractionLog</nodeHandlerClass>
<parameters id="641" type="java.util.HashSet">
<item id="642" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="643">auditId</name>
<stringValue id="644">auditIdentifier</stringValue>
<type>VARIABLE</type>
</item>
<item id="645" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="646">entityMode</name>
<stringValue id="647">MODEL_ENTITY</stringValue>
<type>CONSTANT</type>
</item>
<item id="648" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="649">eql</name>
<stringValue id="650">PublishQuery</stringValue>
<type>VARIABLE</type>
</item>
<item id="651" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="652">extractDefinitions</name>
<stringValue id="653">extractDefinitions</stringValue>
<type>VARIABLE</type>
</item>
<item id="654" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="655">extractorFactory</name>
<stringValue id="656">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="657" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="658">maxExtractCount</name>
<stringValue id="659">PublishingBulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="660" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="661">modelName</name>
<stringValue id="662">ISSRPUB</stringValue>
<type>CONSTANT</type>
</item>
<item id="663" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="664">queryParameter</name>
<stringValue id="665">queryParameter</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<persistentVariables id="666" type="java.util.HashSet">
<item id="667" type="java.lang.String">auditIdentifier
1000</item>
</persistentVariables>
<sources id="668" type="java.util.HashSet">
<item id="669" type="com.j2fe.workflow.definition.Transition">
<name id="670">goto-next</name>
<source id="671">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="672"/>
<directJoin>false</directJoin>
<name id="673">Party Publish Query</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="674">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="675" type="java.util.HashSet">
<item id="676" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="677">statements</name>
<stringValue id="678">query = "&lt;sql&gt; instr_issr_id in (SELECT INSTR_ISSR_ID FROM (SELECT ISSRPUB.INSTR_ISSR_ID FROM FT_T_ISSR ISSRPUB WHERE instr_issr_id IN (SELECT XREF_TBL_ROW_OID FROM ft_t_msgp WHERE trn_id = '" + trnId +"'";&#13;
query = query + " AND ENTITY_CHG_IND IN ('C','U') AND XREF_TBL_TYP='ISSR')";&#13;
query = query + " UNION SELECT ISSRPUB.INSTR_ISSR_ID FROM FT_T_ISSR ISSRPUB WHERE fins_inst_mnem IN";&#13;
query = query + " (SELECT XREF_TBL_ROW_OID FROM ft_t_msgp WHERE trn_id = '" + trnId +"' AND ENTITY_CHG_IND IN ('C','U') AND XREF_TBL_TYP='FINS')) as union_subquery";&#13;
query = query + " WHERE instr_issr_id IN (SELECT instr_issr_id FROM ft_t_irgp WHERE ft_t_irgp.PRT_PURP_TYP = '" + pubSoi +"' AND end_tms  IS NULL)) AND end_tms IS NULL&lt;/sql&gt;"</stringValue>
<type>CONSTANT</type>
</item>
<item id="679" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="680">variables["pubSoi"]</name>
<stringValue id="681">PrtPurpTyp</stringValue>
<type>VARIABLE</type>
</item>
<item id="682" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="683">["query"]@java/lang/Integer@</UITypeHint>
<input>false</input>
<name id="684">variables["query"]</name>
<stringValue id="685">PublishQuery</stringValue>
<type>VARIABLE</type>
</item>
<item id="686" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="687">variables["trnId"]</name>
<stringValue id="688">transactionId</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="689" type="java.util.HashSet">
<item id="690" type="com.j2fe.workflow.definition.Transition">
<name id="691">goto-next</name>
<source id="692">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="693"/>
<directJoin>false</directJoin>
<name id="694">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="695">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="696" type="java.util.HashSet"/>
<targets id="697" type="java.util.HashSet">
<item idref="690" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="671"/>
</item>
</sources>
<targets id="698" type="java.util.HashSet">
<item idref="669" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="637"/>
</item>
</sources>
<targets id="699" type="java.util.HashSet">
<item idref="635" type="com.j2fe.workflow.definition.Transition"/>
<item id="700" type="com.j2fe.workflow.definition.Transition">
<name id="701">no-extraction</name>
<source idref="637"/>
<target idref="517"/>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="611"/>
</item>
</sources>
<targets id="702" type="java.util.HashSet">
<item idref="609" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="592"/>
</item>
</sources>
<targets id="703" type="java.util.HashSet">
<item idref="590" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDSPLIT</type>
</source>
<target idref="555"/>
</item>
</sources>
<targets id="704" type="java.util.HashSet">
<item idref="553" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="546"/>
</item>
</sources>
<targets id="705" type="java.util.HashSet">
<item idref="544" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDJOIN</type>
</source>
<target idref="524"/>
</item>
</sources>
<targets id="706" type="java.util.HashSet">
<item idref="522" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="517"/>
</item>
<item idref="700" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="707" type="java.util.HashSet">
<item idref="515" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="496"/>
</item>
</sources>
<targets id="708" type="java.util.HashSet">
<item idref="494" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="462"/>
</item>
</sources>
<targets id="709" type="java.util.HashSet">
<item idref="460" type="com.j2fe.workflow.definition.Transition"/>
<item id="710" type="com.j2fe.workflow.definition.Transition">
<name id="711">no-extraction</name>
<source idref="462"/>
<target idref="342"/>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="436"/>
</item>
</sources>
<targets id="712" type="java.util.HashSet">
<item idref="434" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="417"/>
</item>
</sources>
<targets id="713" type="java.util.HashSet">
<item idref="415" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDSPLIT</type>
</source>
<target idref="380"/>
</item>
</sources>
<targets id="714" type="java.util.HashSet">
<item idref="378" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="371"/>
</item>
</sources>
<targets id="715" type="java.util.HashSet">
<item idref="369" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDJOIN</type>
</source>
<target idref="349"/>
</item>
</sources>
<targets id="716" type="java.util.HashSet">
<item idref="347" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="342"/>
</item>
<item idref="710" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="717" type="java.util.HashSet">
<item idref="340" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="322"/>
</item>
</sources>
<targets id="718" type="java.util.HashSet">
<item idref="320" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="288"/>
</item>
</sources>
<targets id="719" type="java.util.HashSet">
<item idref="286" type="com.j2fe.workflow.definition.Transition"/>
<item id="720" type="com.j2fe.workflow.definition.Transition">
<name id="721">no-extraction</name>
<source idref="288"/>
<target idref="157"/>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="262"/>
</item>
</sources>
<targets id="722" type="java.util.HashSet">
<item idref="260" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="243"/>
</item>
</sources>
<targets id="723" type="java.util.HashSet">
<item idref="241" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDSPLIT</type>
</source>
<target idref="206"/>
</item>
</sources>
<targets id="724" type="java.util.HashSet">
<item idref="204" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="197"/>
</item>
</sources>
<targets id="725" type="java.util.HashSet">
<item idref="195" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDJOIN</type>
</source>
<target idref="175"/>
</item>
</sources>
<targets id="726" type="java.util.HashSet">
<item idref="173" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="157"/>
</item>
<item idref="720" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="727" type="java.util.HashSet">
<item idref="155" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="123"/>
</item>
</sources>
<targets id="728" type="java.util.HashSet">
<item idref="121" type="com.j2fe.workflow.definition.Transition"/>
<item id="729" type="com.j2fe.workflow.definition.Transition">
<name id="730">no-extraction</name>
<source idref="123"/>
<target idref="3"/>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="97"/>
</item>
</sources>
<targets id="731" type="java.util.HashSet">
<item idref="95" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="78"/>
</item>
</sources>
<targets id="732" type="java.util.HashSet">
<item idref="76" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDSPLIT</type>
</source>
<target idref="41"/>
</item>
</sources>
<targets id="733" type="java.util.HashSet">
<item idref="39" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="32"/>
</item>
</sources>
<targets id="734" type="java.util.HashSet">
<item idref="30" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ANDJOIN</type>
</source>
<target idref="10"/>
</item>
</sources>
<targets id="735" type="java.util.HashSet">
<item idref="8" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="3"/>
</item>
<item idref="729" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="736" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="737">Mizuho/Publishing</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="738">user1</lastChangeUser>
<lastUpdate id="739">2025-12-04T17:00:56.000+0000</lastUpdate>
<name id="740">MizPublishForTxn</name>
<nodes id="741" type="java.util.HashSet">
<item idref="524" type="com.j2fe.workflow.definition.Node"/>
<item idref="349" type="com.j2fe.workflow.definition.Node"/>
<item idref="175" type="com.j2fe.workflow.definition.Node"/>
<item idref="10" type="com.j2fe.workflow.definition.Node"/>
<item idref="462" type="com.j2fe.workflow.definition.Node"/>
<item idref="496" type="com.j2fe.workflow.definition.Node"/>
<item idref="97" type="com.j2fe.workflow.definition.Node"/>
<item idref="611" type="com.j2fe.workflow.definition.Node"/>
<item idref="436" type="com.j2fe.workflow.definition.Node"/>
<item idref="262" type="com.j2fe.workflow.definition.Node"/>
<item idref="417" type="com.j2fe.workflow.definition.Node"/>
<item idref="78" type="com.j2fe.workflow.definition.Node"/>
<item idref="592" type="com.j2fe.workflow.definition.Node"/>
<item idref="243" type="com.j2fe.workflow.definition.Node"/>
<item idref="555" type="com.j2fe.workflow.definition.Node"/>
<item idref="206" type="com.j2fe.workflow.definition.Node"/>
<item idref="41" type="com.j2fe.workflow.definition.Node"/>
<item idref="380" type="com.j2fe.workflow.definition.Node"/>
<item idref="123" type="com.j2fe.workflow.definition.Node"/>
<item idref="157" type="com.j2fe.workflow.definition.Node"/>
<item idref="342" type="com.j2fe.workflow.definition.Node"/>
<item idref="517" type="com.j2fe.workflow.definition.Node"/>
<item idref="637" type="com.j2fe.workflow.definition.Node"/>
<item idref="671" type="com.j2fe.workflow.definition.Node"/>
<item idref="692" type="com.j2fe.workflow.definition.Node"/>
<item idref="3" type="com.j2fe.workflow.definition.Node"/>
<item idref="32" type="com.j2fe.workflow.definition.Node"/>
<item idref="546" type="com.j2fe.workflow.definition.Node"/>
<item idref="197" type="com.j2fe.workflow.definition.Node"/>
<item idref="371" type="com.j2fe.workflow.definition.Node"/>
<item idref="288" type="com.j2fe.workflow.definition.Node"/>
<item idref="322" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>true</optimize>
<parameter id="742" type="java.util.HashMap">
<entry>
<key id="743" type="java.lang.String">AssetQueue</key>
<value id="744" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="745">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="746"/>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="747" type="java.lang.String">Handle Extraction Failures</key>
<value id="748" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="749">com.thegoldensource.subscription.ExceptionHandlingMode</className>
<clazz>com.thegoldensource.subscription.ExceptionHandlingMode</clazz>
<description id="750">This value is used for Exception Handling configuration.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="751" type="java.lang.String">LegalAgreementQueue</key>
<value id="752" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="753">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="754"/>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="755" type="java.lang.String">No. Of Parallel Branches</key>
<value id="756" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="757">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="758">Defines how many parallel branches to be run for publishing.</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="759" type="java.lang.String">PartyQueue</key>
<value id="760" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="761">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="762"/>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="763" type="java.lang.String">PrtPurpTyp</key>
<value id="764" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="765">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="766" type="java.lang.String">PublishingBulkSize</key>
<value id="767" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="768">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="769">Defines how many entities you want to extract in one bulk.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="770" type="java.lang.String">Threshold for Extraction Failures</key>
<value id="771" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="772">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="773">Value for this field should be specified in x/y format, both x and y is numeric. 
Here x is percentage of instruments allowed to fail during extraction and y is minimum sampling size.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="774" type="java.lang.String">transactionId</key>
<value id="775" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="776">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
</parameter>
<permissions id="777" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>false</purgeAtEnd>
<retries>0</retries>
<startNode idref="692"/>
<status>RELEASED</status>
<variables id="778" type="java.util.HashMap">
<entry>
<key id="779" type="java.lang.String">AssetQueue</key>
<value id="780" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="781">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="782"/>
<persistent>false</persistent>
<value id="783" type="java.lang.String">jms/queue/security</value>
</value>
</entry>
<entry>
<key id="784" type="java.lang.String">Handle Extraction Failures</key>
<value id="785" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="786">com.thegoldensource.subscription.ExceptionHandlingMode</className>
<clazz>com.thegoldensource.subscription.ExceptionHandlingMode</clazz>
<description id="787">This value is used for Exception Handling configuration.</description>
<persistent>false</persistent>
<value id="788" type="com.thegoldensource.subscription.ExceptionHandlingMode">DO_NOT_HANDLE</value>
</value>
</entry>
<entry>
<key id="789" type="java.lang.String">LegalAgreementQueue</key>
<value id="790" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="791">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="792"/>
<persistent>false</persistent>
<value id="793" type="java.lang.String">jms/queue/legalAgreement</value>
</value>
</entry>
<entry>
<key id="794" type="java.lang.String">No. Of Parallel Branches</key>
<value id="795" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="796">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="797">Defines how many parallel branches to be run for publishing.</description>
<persistent>false</persistent>
<value id="798" type="java.lang.Integer">5</value>
</value>
</entry>
<entry>
<key id="799" type="java.lang.String">PartyQueue</key>
<value id="800" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="801">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="802"/>
<persistent>false</persistent>
<value id="803" type="java.lang.String">jms/queue/issuer</value>
</value>
</entry>
<entry>
<key id="804" type="java.lang.String">PrtPurpTyp</key>
<value id="805" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="806">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="807" type="java.lang.String">INTEREST</value>
</value>
</entry>
<entry>
<key id="808" type="java.lang.String">PublishingBulkSize</key>
<value id="809" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="810">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<description id="811">Defines how many entities you want to extract in one bulk.</description>
<persistent>false</persistent>
<value id="812" type="java.lang.Integer">100</value>
</value>
</entry>
<entry>
<key id="813" type="java.lang.String">Threshold for Extraction Failures</key>
<value id="814" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="815">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="816">Value for this field should be specified in x/y format, both x and y is numeric. 
Here x is percentage of instruments allowed to fail during extraction and y is minimum sampling size.</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="817" type="java.lang.String">transactionId</key>
<value id="818" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="819">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
</variables>
<version>23</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
