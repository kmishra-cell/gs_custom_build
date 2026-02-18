<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.07">
<package-comment/>
<businessobject displayString="8 - TargetDirectory|UTF-8|EOFLine|removedOrderBy" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>false</alwaysPersist>
<clustered>false</clustered>
<comment id="1">TargetDirectory|UTF-8|EOFLine|removedOrderBy</comment>
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
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="10"/>
<directJoin>false</directJoin>
<name id="11">Close Transaction</name>
<nodeHandler>com.j2fe.streetlamp.activities.CloseTransaction</nodeHandler>
<nodeHandlerClass id="12">com.j2fe.streetlamp.activities.CloseTransaction</nodeHandlerClass>
<parameters id="13" type="java.util.HashSet">
<item id="14" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="15">transactionId</name>
<stringValue id="16">RequestTransaction</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="17" type="java.util.HashSet">
<item id="18" type="com.j2fe.workflow.definition.Transition">
<name id="19">goto-next</name>
<source id="20">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="21"/>
<directJoin>false</directJoin>
<name id="22">File Operations</name>
<nodeHandler>com.j2fe.general.activities.FileOperator</nodeHandler>
<nodeHandlerClass id="23">com.j2fe.general.activities.FileOperator</nodeHandlerClass>
<parameters id="24" type="java.util.HashSet">
<item id="25" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="26">operationToPerform</name>
<stringValue id="27">Copy</stringValue>
<type>CONSTANT</type>
</item>
<item id="28" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="29">sourceDirectory</name>
<stringValue id="30">AlacraOutboundFileDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="31" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="32">sourceFileName</name>
<stringValue id="33">AlacraRequestFileName</stringValue>
<type>VARIABLE</type>
</item>
<item id="34" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="35">sourceFileSystem</name>
<stringValue id="36">filesystem/local</stringValue>
<type>REFERENCE</type>
</item>
<item id="37" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="38">targetDirectory</name>
<stringValue id="39">/uploads/</stringValue>
<type>CONSTANT</type>
</item>
<item id="40" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="41">targetFileName</name>
<stringValue id="42">AlacraRequestFileName</stringValue>
<type>VARIABLE</type>
</item>
<item id="43" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="44">targetFileSystem</name>
<stringValue id="45">filesystem/sftp/Alacra</stringValue>
<type>REFERENCE</type>
</item>
</parameters>
<sources id="46" type="java.util.HashSet">
<item id="47" type="com.j2fe.workflow.definition.Transition">
<name id="48">goto-next</name>
<source id="49">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="50"/>
<directJoin>false</directJoin>
<name id="51">Update Request Status</name>
<nodeHandler>com.j2fe.feeds.request.UpdateVREQ</nodeHandler>
<nodeHandlerClass id="52">com.j2fe.feeds.request.UpdateVREQ</nodeHandlerClass>
<parameters id="53" type="java.util.HashSet">
<item id="54" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="55">fileName</name>
<stringValue id="56">AlacraResponseFileName</stringValue>
<type>VARIABLE</type>
</item>
<item id="57" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="58">requestOIDs</name>
<stringValue id="59">VND_RQST_OID</stringValue>
<type>VARIABLE</type>
</item>
<item id="60" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="61">status</name>
<stringValue id="62">REQUESTED</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="63" type="java.util.HashSet">
<item id="64" type="com.j2fe.workflow.definition.Transition">
<name id="65">goto-next</name>
<source id="66">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="67"/>
<directJoin>false</directJoin>
<name id="68">Create Request Status</name>
<nodeHandler>com.j2fe.feeds.request.CreateVREQ</nodeHandler>
<nodeHandlerClass id="69">com.j2fe.feeds.request.CreateVREQ</nodeHandlerClass>
<parameters id="70" type="java.util.HashSet">
<item id="71" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="72">dataSourceType</name>
<stringValue id="73">ALACRA</stringValue>
<type>CONSTANT</type>
</item>
<item id="74" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="75">identifier</name>
<stringValue id="76">AlacraOutboundVendorID</stringValue>
<type>VARIABLE</type>
</item>
<item id="77" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="78">physicalRequest</name>
<stringValue id="79">true</stringValue>
<type>CONSTANT</type>
</item>
<item id="80" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="81">requestType</name>
<stringValue id="82">AlacraMonthly</stringValue>
<type>CONSTANT</type>
</item>
<item id="83" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="84">requestor</name>
<stringValue id="85">IssuerRec</stringValue>
<type>CONSTANT</type>
</item>
<item id="86" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="87">status</name>
<stringValue id="88">REQUESTING</stringValue>
<type>CONSTANT</type>
</item>
<item id="89" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="90">tableType</name>
<stringValue id="91">FINS</stringValue>
<type>CONSTANT</type>
</item>
<item id="92" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="93">transactionID</name>
<stringValue id="94">RequestTransaction</stringValue>
<type>VARIABLE</type>
</item>
<item id="95" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="96">userId</name>
<stringValue id="97">AlacraOutboundMonthly</stringValue>
<type>CONSTANT</type>
</item>
<item id="98" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="99">vendorReqOid</name>
<stringValue id="100">VND_RQST_OID</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="101" type="java.util.HashSet">
<item id="102" type="com.j2fe.workflow.definition.Transition">
<name id="103">end-loop</name>
<source id="104">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="105"/>
<directJoin>false</directJoin>
<name id="106">For Loop to get all rows</name>
<nodeHandler>com.j2fe.workflow.handler.impl.ForEach</nodeHandler>
<nodeHandlerClass id="107">com.j2fe.workflow.handler.impl.ForEach</nodeHandlerClass>
<parameters id="108" type="java.util.HashSet">
<item id="109" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="110">counter</name>
<stringValue id="111">forLoopCnt</stringValue>
<type>VARIABLE</type>
</item>
<item id="112" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="113">counter</name>
<stringValue id="114">forLoopCnt</stringValue>
<type>VARIABLE</type>
</item>
<item id="115" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="116">input</name>
<stringValue id="117">AlacraRequest</stringValue>
<type>VARIABLE</type>
</item>
<item id="118" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="119">outputObjects[0]["AlacraRequestRow"]</name>
<stringValue id="120">AlacraOutboundRow</stringValue>
<type>VARIABLE</type>
</item>
<item id="121" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="122">outputObjects[0]["AlacraVendor"]</name>
<stringValue id="123">AlacraOutboundVendor</stringValue>
<type>VARIABLE</type>
</item>
<item id="124" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="125">outputObjects[0]["AlacraVendorID"]</name>
<stringValue id="126">AlacraOutboundVendorID</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="127" type="java.util.HashSet">
<item id="128" type="com.j2fe.workflow.definition.Transition">
<name id="129">goto-next</name>
<source id="130">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="131"/>
<directJoin>false</directJoin>
<name id="132">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="133">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="134" type="java.util.HashSet">
<item id="135" type="com.j2fe.workflow.definition.Transition">
<name id="136">empty</name>
<source id="137">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="138"/>
<directJoin>false</directJoin>
<name id="139">List Files</name>
<nodeHandler>com.j2fe.feeds.activities.ListFiles</nodeHandler>
<nodeHandlerClass id="140">com.j2fe.feeds.activities.ListFiles</nodeHandlerClass>
<parameters id="141" type="java.util.HashSet">
<item id="142" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="143">directory</name>
<stringValue id="144">AlacraOutboundFileDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="145" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="146">fileSystem</name>
<stringValue id="147">filesystem/local</stringValue>
<type>REFERENCE</type>
</item>
<item id="148" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="149">fileSystemId</name>
<stringValue id="150">filesystem/local/user</stringValue>
<type>REFERENCE</type>
</item>
<item id="151" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="152">pattern[0]</name>
<stringValue id="153">AlacraRequestFileName</stringValue>
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
<name id="159">Create Response File Name</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="160">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="161" type="java.util.HashSet">
<item id="162" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="163">statements</name>
<stringValue id="164">import java.util.Date;

import java.text.DateFormat;

import java.text.SimpleDateFormat;

DateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");

Date date = new Date();

String FileName = BaseFileName+"_"+ RequestEnv+"_"+ dateFormat.format(date) + ".oum";</stringValue>
<type>CONSTANT</type>
</item>
<item id="165" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="166">["BaseFileName"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="167">variables["BaseFileName"]</name>
<stringValue id="168">BaseFileName</stringValue>
<type>VARIABLE</type>
</item>
<item id="169" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="170">variables["FileName"]</name>
<stringValue id="171">AlacraResponseFileName</stringValue>
<type>VARIABLE</type>
</item>
<item id="172" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="173">variables["RequestEnv"]</name>
<stringValue id="174">RequestEnv</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="175" type="java.util.HashSet">
<item id="176" type="com.j2fe.workflow.definition.Transition">
<name id="177">goto-next</name>
<source id="178">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="179"/>
<directJoin>false</directJoin>
<name id="180">Create Request File Name</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="181">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="182" type="java.util.HashSet">
<item id="183" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="184">statements</name>
<stringValue id="185">import java.util.Date;

import java.text.DateFormat;

import java.text.SimpleDateFormat;

DateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");

Date date = new Date();

String FileName = BaseFileName+"_"+ RequestEnv+"_"+ dateFormat.format(date) + ".rem";
</stringValue>
<type>CONSTANT</type>
</item>
<item id="186" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="187">["BaseFileName"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="188">variables["BaseFileName"]</name>
<stringValue id="189">BaseFileName</stringValue>
<type>VARIABLE</type>
</item>
<item id="190" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="191">["FileName"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="192">variables["FileName"]</name>
<stringValue id="193">AlacraRequestFileName</stringValue>
<type>VARIABLE</type>
</item>
<item id="194" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="195">variables["RequestEnv"]</name>
<stringValue id="196">RequestEnv</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="197" type="java.util.HashSet">
<item id="198" type="com.j2fe.workflow.definition.Transition">
<name id="199">goto-next</name>
<source id="200">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="201"/>
<directJoin>false</directJoin>
<name id="202">Database Select (Standard)</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="203">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="204" type="java.util.HashSet">
<item id="205" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="206">database</name>
<stringValue id="207">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="208" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="209">firstColumnsResult[0]</name>
<stringValue id="210">RequestEnv</stringValue>
<type>VARIABLE</type>
</item>
<item id="211" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="212">querySQL</name>
<stringValue id="213">select 'OPLRDDB' from dual</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="214" type="java.util.HashSet">
<item id="215" type="com.j2fe.workflow.definition.Transition">
<name id="216">goto-next</name>
<source id="217">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="218"/>
<directJoin>false</directJoin>
<name id="219">Create Transaction</name>
<nodeHandler>com.j2fe.streetlamp.activities.CreateTransaction</nodeHandler>
<nodeHandlerClass id="220">com.j2fe.streetlamp.activities.CreateTransaction</nodeHandlerClass>
<parameters id="221" type="java.util.HashSet">
<item id="222" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="223">jobId</name>
<stringValue id="224">ParentJobID</stringValue>
<type>VARIABLE</type>
</item>
<item id="225" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="226">transactionId</name>
<stringValue id="227">RequestTransaction</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="228" type="java.util.HashSet">
<item id="229" type="com.j2fe.workflow.definition.Transition">
<name id="230">rows-found</name>
<source id="231">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="232"/>
<directJoin>false</directJoin>
<name id="233">Fetch Rows for Alacra Outbound</name>
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
<input>false</input>
<name id="240">mappedResult</name>
<stringValue id="241">AlacraRequest</stringValue>
<type>VARIABLE</type>
</item>
<item id="242" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="243">querySQL</name>
<objectValue id="244" type="java.lang.String">WITH temp AS (
    SELECT fins.inst_mnem, fins.inst_nme
    FROM ft_t_fins fins
    WHERE fins.end_tms IS NULL
      AND EXISTS (
          SELECT 1
          FROM ft_t_fiid fiid
          WHERE fiid.fins_id_ctxt_typ = 'BBCMPYID'
            AND fiid.end_tms IS NULL
            AND fins.inst_mnem = fiid.inst_mnem
      )
      AND fins.inst_mnem IN (
          SELECT fins_inst_mnem
          FROM ft_t_issr
          WHERE end_tms IS NULL
            AND instr_issr_id IN (
                SELECT instr_issr_id
                FROM ft_t_irgp
                WHERE end_tms IS NULL
                  AND prt_purp_typ = 'INTEREST'
            )
      )
),
dupsFins AS (
    SELECT
        temp.inst_nme AS gs_entity_name,
        figu.gu_id AS gs_country,
        temp.inst_mnem AS gs_oid,
        fiid.fins_id AS alacra_bbg_id_prim,
        fiid.fins_id_ctxt_typ AS vendor
    FROM temp
    JOIN ft_t_fiid fiid
      ON temp.inst_mnem = fiid.inst_mnem
     AND fiid.end_tms IS NULL
     AND fiid.fins_id_ctxt_typ = 'BBCMPYID'
    LEFT JOIN ft_t_figu figu
      ON temp.inst_mnem = figu.inst_mnem
     AND figu.gu_typ = 'COUNTRY'
     AND fins_gu_purp_typ = 'DOMICILE'
     AND figu.end_tms IS NULL
)
SELECT 
    'GS_ENTITY_NAME|GS_COUNTRY|GS_OID|VENDOR_ID|VENDOR|ALACRA_ID|ALACRA_NAME|ALACRA_COUNTRY|ALACRA_COUNT|ALACRA_BBG_ID_PRIM|ALACRA_BBG_ID_SEC|ALACRA_LT_LOC_VENDOR_RATING|ALACRA_LT_FGN_VENDOR_RATING'
        AS "AlacraRequestRow",
    NULL::text AS "AlacraVendor",
    NULL::text AS "AlacraVendorID"
UNION ALL
SELECT 
    TRIM(gs_entity_name) || '|' ||
    COALESCE(TRIM(gs_country), '') || '|' ||
    TRIM(gs_oid) || '|||||||' ||
    COALESCE(TRIM(alacra_bbg_id_prim), '') || '|||' AS "AlacraRequestRow",
    TRIM(REPLACE(vendor, 'S&amp;P', 'SP')) AS "AlacraVendor",
    COALESCE(TRIM(alacra_bbg_id_prim), '') AS "AlacraVendorID"
FROM dupsFins
WHERE gs_entity_name IS NOT NULL</objectValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="245" type="java.util.HashSet">
<item id="246" type="com.j2fe.workflow.definition.Transition">
<name id="247">goto-next</name>
<source id="248">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="249"/>
<directJoin>false</directJoin>
<name id="250">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="251">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="252" type="java.util.HashSet"/>
<targets id="253" type="java.util.HashSet">
<item idref="246" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="231"/>
</item>
</sources>
<targets id="254" type="java.util.HashSet">
<item id="255" type="com.j2fe.workflow.definition.Transition">
<name id="256">nothing-found</name>
<source idref="231"/>
<target idref="2"/>
</item>
<item idref="229" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="217"/>
</item>
</sources>
<targets id="257" type="java.util.HashSet">
<item idref="215" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="200"/>
</item>
</sources>
<targets id="258" type="java.util.HashSet">
<item idref="198" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="178"/>
</item>
</sources>
<targets id="259" type="java.util.HashSet">
<item idref="176" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="157"/>
</item>
</sources>
<targets id="260" type="java.util.HashSet">
<item idref="155" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="137"/>
</item>
</sources>
<targets id="261" type="java.util.HashSet">
<item idref="135" type="com.j2fe.workflow.definition.Transition"/>
<item id="262" type="com.j2fe.workflow.definition.Transition">
<name id="263">not-empty</name>
<source idref="137"/>
<target id="264">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="265"/>
<directJoin>false</directJoin>
<name id="266">Delete File</name>
<nodeHandler>com.j2fe.feeds.activities.DeleteFile</nodeHandler>
<nodeHandlerClass id="267">com.j2fe.feeds.activities.DeleteFile</nodeHandlerClass>
<parameters id="268" type="java.util.HashSet">
<item id="269" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="270">directory</name>
<stringValue id="271">AlacraOutboundFileDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="272" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="273">fileName</name>
<stringValue id="274">AlacraRequestFileName</stringValue>
<type>VARIABLE</type>
</item>
<item id="275" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="276">fileSystem</name>
<stringValue id="277">filesystem/local</stringValue>
<type>REFERENCE</type>
</item>
</parameters>
<sources id="278" type="java.util.HashSet">
<item idref="262" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="279" type="java.util.HashSet">
<item id="280" type="com.j2fe.workflow.definition.Transition">
<name id="281">goto-next</name>
<source idref="264"/>
<target idref="130"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="130"/>
</item>
<item idref="280" type="com.j2fe.workflow.definition.Transition"/>
<item id="282" type="com.j2fe.workflow.definition.Transition">
<name id="283">goto-next</name>
<source id="284">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="285"/>
<directJoin>false</directJoin>
<name id="286">Write File</name>
<nodeHandler>com.j2fe.general.activities.File</nodeHandler>
<nodeHandlerClass id="287">com.j2fe.general.activities.File</nodeHandlerClass>
<parameters id="288" type="java.util.HashSet">
<item id="289" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="290">appendEOFLine</name>
<stringValue id="291">true</stringValue>
<type>CONSTANT</type>
</item>
<item id="292" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="293">directory</name>
<stringValue id="294">AlacraOutboundFileDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="295" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="296">encoding</name>
<stringValue id="297">UTF-8</stringValue>
<type>CONSTANT</type>
</item>
<item id="298" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="299">fileName</name>
<stringValue id="300">AlacraRequestFileName</stringValue>
<type>VARIABLE</type>
</item>
<item id="301" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="302">text</name>
<stringValue id="303">AlacraOutboundRow</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="304" type="java.util.HashSet">
<item id="305" type="com.j2fe.workflow.definition.Transition">
<name id="306">loop</name>
<source idref="104"/>
<target idref="284"/>
</item>
</sources>
<targets id="307" type="java.util.HashSet">
<item idref="282" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="130"/>
</item>
</sources>
<targets id="308" type="java.util.HashSet">
<item idref="128" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="104"/>
</item>
</sources>
<targets id="309" type="java.util.HashSet">
<item idref="102" type="com.j2fe.workflow.definition.Transition"/>
<item idref="305" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="66"/>
</item>
</sources>
<targets id="310" type="java.util.HashSet">
<item idref="64" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="49"/>
</item>
</sources>
<targets id="311" type="java.util.HashSet">
<item idref="47" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="20"/>
</item>
</sources>
<targets id="312" type="java.util.HashSet">
<item idref="18" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="9"/>
</item>
</sources>
<targets id="313" type="java.util.HashSet">
<item idref="7" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="2"/>
</item>
<item idref="255" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="314" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="315">Custom/Dataloads/IssuerMerge</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="316">user1</lastChangeUser>
<lastUpdate id="317">2026-01-02T13:27:36.000+0000</lastUpdate>
<name id="318">AlacraOutboundMonthly</name>
<nodes id="319" type="java.util.HashSet">
<item idref="9" type="com.j2fe.workflow.definition.Node"/>
<item idref="178" type="com.j2fe.workflow.definition.Node"/>
<item idref="66" type="com.j2fe.workflow.definition.Node"/>
<item idref="157" type="com.j2fe.workflow.definition.Node"/>
<item idref="217" type="com.j2fe.workflow.definition.Node"/>
<item idref="200" type="com.j2fe.workflow.definition.Node"/>
<item idref="264" type="com.j2fe.workflow.definition.Node"/>
<item idref="231" type="com.j2fe.workflow.definition.Node"/>
<item idref="20" type="com.j2fe.workflow.definition.Node"/>
<item idref="104" type="com.j2fe.workflow.definition.Node"/>
<item idref="137" type="com.j2fe.workflow.definition.Node"/>
<item idref="130" type="com.j2fe.workflow.definition.Node"/>
<item idref="248" type="com.j2fe.workflow.definition.Node"/>
<item idref="2" type="com.j2fe.workflow.definition.Node"/>
<item idref="49" type="com.j2fe.workflow.definition.Node"/>
<item idref="284" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>true</optimize>
<parameter id="320" type="java.util.HashMap">
<entry>
<key id="321" type="java.lang.String">AlacraOutboundFileDirectory</key>
<value id="322" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="323">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="324"/>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="325" type="java.lang.String">BaseFileName</key>
<value id="326" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="327">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="328" type="java.lang.String">ParentJobID</key>
<value id="329" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="330">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
</parameter>
<permissions id="331" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>false</purgeAtEnd>
<retries>0</retries>
<startNode idref="248"/>
<status>RELEASED</status>
<variables id="332" type="java.util.HashMap">
<entry>
<key id="333" type="java.lang.String">AlacraOutboundFileDirectory</key>
<value id="334" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="335">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="336"/>
<persistent>false</persistent>
<value id="337" type="java.lang.String">/gold/app/AlacraOutboundMonthly</value>
</value>
</entry>
<entry>
<key id="338" type="java.lang.String">BaseFileName</key>
<value id="339" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="340">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="341" type="java.lang.String">Alacra_DeDup_File</value>
</value>
</entry>
<entry>
<key id="342" type="java.lang.String">ParentJobID</key>
<value id="343" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="344">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="345" type="java.lang.String">forLoopCnt</key>
<value id="346" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="347">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<persistent>false</persistent>
<value id="348" type="java.lang.Integer">0</value>
</value>
</entry>
</variables>
<version>8</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
