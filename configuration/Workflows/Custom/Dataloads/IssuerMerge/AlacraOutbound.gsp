<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.07">
<package-comment/>
<businessobject displayString="11 - TargetDirectory|UTF-8|EOFLine" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>false</alwaysPersist>
<clustered>false</clustered>
<comment id="1">TargetDirectory|UTF-8|EOFLine</comment>
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
<name id="12">Close Transaction</name>
<nodeHandler>com.j2fe.streetlamp.activities.CloseTransaction</nodeHandler>
<nodeHandlerClass id="13">com.j2fe.streetlamp.activities.CloseTransaction</nodeHandlerClass>
<parameters id="14" type="java.util.HashSet">
<item id="15" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="16">transactionId</name>
<stringValue id="17">RequestTransaction</stringValue>
<type>VARIABLE</type>
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
<name id="23">File Operations</name>
<nodeHandler>com.j2fe.general.activities.FileOperator</nodeHandler>
<nodeHandlerClass id="24">com.j2fe.general.activities.FileOperator</nodeHandlerClass>
<parameters id="25" type="java.util.HashSet">
<item id="26" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="27">operationToPerform</name>
<stringValue id="28">Copy</stringValue>
<type>CONSTANT</type>
</item>
<item id="29" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="30">sourceDirectory</name>
<stringValue id="31">AlacraOutboundFileDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="32" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="33">sourceFileName</name>
<stringValue id="34">AlacraRequestFileName</stringValue>
<type>VARIABLE</type>
</item>
<item id="35" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="36">sourceFileSystem</name>
<stringValue id="37">filesystem/local</stringValue>
<type>REFERENCE</type>
</item>
<item id="38" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="39">targetDirectory</name>
<stringValue id="40">/uploads/</stringValue>
<type>CONSTANT</type>
</item>
<item id="41" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="42">targetFileName</name>
<stringValue id="43">AlacraRequestFileName</stringValue>
<type>VARIABLE</type>
</item>
<item id="44" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="45">targetFileSystem</name>
<stringValue id="46">filesystem/sftp/Alacra</stringValue>
<type>REFERENCE</type>
</item>
</parameters>
<sources id="47" type="java.util.HashSet">
<item id="48" type="com.j2fe.workflow.definition.Transition">
<name id="49">goto-next</name>
<source id="50">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="51"/>
<directJoin>false</directJoin>
<name id="52">Remove file header from VREQ</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="53">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="54" type="java.util.HashSet">
<item id="55" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="56">database</name>
<stringValue id="57">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="58" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="59">indexedParameters[0]</name>
<stringValue id="60">AlacraResponseFileName</stringValue>
<type>VARIABLE</type>
</item>
<item id="61" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="62">querySQL</name>
<stringValue id="63">delete from ft_t_vreq&#13;
where vnd_rqst_xref_id is null&#13;
and vnd_resp_file_nme = ?</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="64" type="java.util.HashSet">
<item id="65" type="com.j2fe.workflow.definition.Transition">
<name id="66">end-loop</name>
<source id="67">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="68"/>
<directJoin>false</directJoin>
<name id="69">For Loop to get all rows</name>
<nodeHandler>com.j2fe.workflow.handler.impl.ForEach</nodeHandler>
<nodeHandlerClass id="70">com.j2fe.workflow.handler.impl.ForEach</nodeHandlerClass>
<parameters id="71" type="java.util.HashSet">
<item id="72" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="73">counter</name>
<stringValue id="74">forLoopCnt</stringValue>
<type>VARIABLE</type>
</item>
<item id="75" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="76">counter</name>
<stringValue id="77">forLoopCnt</stringValue>
<type>VARIABLE</type>
</item>
<item id="78" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="79">input</name>
<stringValue id="80">AlacraRequest</stringValue>
<type>VARIABLE</type>
</item>
<item id="81" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="82">outputObjects[0]["AlacraRequestRow"]</name>
<stringValue id="83">AlacraOutboundRow</stringValue>
<type>VARIABLE</type>
</item>
<item id="84" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="85">outputObjects[0]["AlacraVendor"]</name>
<stringValue id="86">AlacraOutboundVendor</stringValue>
<type>VARIABLE</type>
</item>
<item id="87" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="88">outputObjects[0]["AlacraVendorID"]</name>
<stringValue id="89">AlacraOutboundVendorID</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="90" type="java.util.HashSet">
<item id="91" type="com.j2fe.workflow.definition.Transition">
<name id="92">goto-next</name>
<source id="93">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="94"/>
<directJoin>false</directJoin>
<name id="95">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="96">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="97" type="java.util.HashSet">
<item id="98" type="com.j2fe.workflow.definition.Transition">
<name id="99">empty</name>
<source id="100">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="101"/>
<directJoin>false</directJoin>
<name id="102">List Files</name>
<nodeHandler>com.j2fe.feeds.activities.ListFiles</nodeHandler>
<nodeHandlerClass id="103">com.j2fe.feeds.activities.ListFiles</nodeHandlerClass>
<parameters id="104" type="java.util.HashSet">
<item id="105" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="106">directory</name>
<stringValue id="107">AlacraOutboundFileDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="108" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="109">fileSystem</name>
<stringValue id="110">filesystem/local</stringValue>
<type>REFERENCE</type>
</item>
<item id="111" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="112">fileSystemId</name>
<stringValue id="113">filesystem/local/user</stringValue>
<type>REFERENCE</type>
</item>
<item id="114" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="115">pattern[0]</name>
<stringValue id="116">AlacraRequestFileName</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="117" type="java.util.HashSet">
<item id="118" type="com.j2fe.workflow.definition.Transition">
<name id="119">goto-next</name>
<source id="120">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="121"/>
<directJoin>false</directJoin>
<name id="122">Create Response File Name</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="123">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="124" type="java.util.HashSet">
<item id="125" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="126">statements</name>
<stringValue id="127">import java.util.Date;&#13;
&#13;
import java.text.DateFormat;&#13;
&#13;
import java.text.SimpleDateFormat;&#13;
&#13;
DateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");&#13;
&#13;
Date date = new Date();&#13;
&#13;
String FileName = BaseFileName+"_"+ RequestEnv+"_"+ dateFormat.format(date) + ".out";</stringValue>
<type>CONSTANT</type>
</item>
<item id="128" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="129">["BaseFileName"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="130">variables["BaseFileName"]</name>
<stringValue id="131">BaseFileName</stringValue>
<type>VARIABLE</type>
</item>
<item id="132" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="133">variables["FileName"]</name>
<stringValue id="134">AlacraResponseFileName</stringValue>
<type>VARIABLE</type>
</item>
<item id="135" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="136">variables["RequestEnv"]</name>
<stringValue id="137">RequestEnv</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="138" type="java.util.HashSet">
<item id="139" type="com.j2fe.workflow.definition.Transition">
<name id="140">goto-next</name>
<source id="141">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="142"/>
<directJoin>false</directJoin>
<name id="143">Create Request File Name</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="144">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="145" type="java.util.HashSet">
<item id="146" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="147">statements</name>
<stringValue id="148">import java.util.Date;&#13;
&#13;
import java.text.DateFormat;&#13;
&#13;
import java.text.SimpleDateFormat;&#13;
&#13;
DateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");&#13;
&#13;
Date date = new Date();&#13;
&#13;
String FileName = BaseFileName+"_"+ RequestEnv+"_"+ dateFormat.format(date) + ".req";&#13;
</stringValue>
<type>CONSTANT</type>
</item>
<item id="149" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="150">["BaseFileName"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="151">variables["BaseFileName"]</name>
<stringValue id="152">BaseFileName</stringValue>
<type>VARIABLE</type>
</item>
<item id="153" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="154">["FileName"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="155">variables["FileName"]</name>
<stringValue id="156">AlacraRequestFileName</stringValue>
<type>VARIABLE</type>
</item>
<item id="157" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="158">variables["RequestEnv"]</name>
<stringValue id="159">RequestEnv</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="160" type="java.util.HashSet">
<item id="161" type="com.j2fe.workflow.definition.Transition">
<name id="162">goto-next</name>
<source id="163">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="164"/>
<directJoin>false</directJoin>
<name id="165">Database Select (Standard)</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="166">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="167" type="java.util.HashSet">
<item id="168" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="169">database</name>
<stringValue id="170">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="171" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="172">firstColumnsResult[0]</name>
<stringValue id="173">RequestEnv</stringValue>
<type>VARIABLE</type>
</item>
<item id="174" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="175">querySQL</name>
<stringValue id="176">select 'OPLRDDB' from dual</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="177" type="java.util.HashSet">
<item id="178" type="com.j2fe.workflow.definition.Transition">
<name id="179">goto-next</name>
<source id="180">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="181"/>
<directJoin>false</directJoin>
<name id="182">Create Transaction</name>
<nodeHandler>com.j2fe.streetlamp.activities.CreateTransaction</nodeHandler>
<nodeHandlerClass id="183">com.j2fe.streetlamp.activities.CreateTransaction</nodeHandlerClass>
<parameters id="184" type="java.util.HashSet">
<item id="185" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="186">jobId</name>
<stringValue id="187">ParentJobID</stringValue>
<type>VARIABLE</type>
</item>
<item id="188" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="189">transactionId</name>
<stringValue id="190">RequestTransaction</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="191" type="java.util.HashSet">
<item id="192" type="com.j2fe.workflow.definition.Transition">
<name id="193">rows-found</name>
<source id="194">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="195"/>
<directJoin>false</directJoin>
<name id="196">Fetch Rows for Alacra Outbound</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="197">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="198" type="java.util.HashSet">
<item id="199" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="200">database</name>
<stringValue id="201">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="202" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="203">mappedResult</name>
<stringValue id="204">AlacraRequest</stringValue>
<type>VARIABLE</type>
</item>
<item id="205" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="206">querySQL</name>
<objectValue id="207" type="java.lang.String">WITH temp AS (
    SELECT fins.INST_MNEM, fins.inst_nme
    FROM ft_t_fins fins
    WHERE END_TMS IS NULL
      AND NOT EXISTS (
          SELECT 1 
          FROM FT_T_FIID fiid 
          WHERE FINS_ID_CTXT_TYP = 'BBCMPYID' 
            AND END_TMS IS NULL 
            AND fins.INST_MNEM = fiid.INST_MNEM
      )
      AND (
          EXISTS (
              SELECT 1 
              FROM FT_T_FIID fiid 
              WHERE FINS_ID_CTXT_TYP = 'S&amp;P' 
                AND END_TMS IS NULL 
                AND fins.INST_MNEM = fiid.INST_MNEM
          )
          OR EXISTS (
              SELECT 1 
              FROM FT_T_FIID fiid 
              WHERE FINS_ID_CTXT_TYP = 'FITCH' 
                AND END_TMS IS NULL 
                AND fins.INST_MNEM = fiid.INST_MNEM
          )
          OR EXISTS (
              SELECT 1 
              FROM FT_T_FIID fiid 
              WHERE FINS_ID_CTXT_TYP = 'MDY' 
                AND END_TMS IS NULL 
                AND fins.INST_MNEM = fiid.INST_MNEM
          )
      )
),
dupsFins AS (
    SELECT 
        temp.inst_nme AS GS_ENTITY_NAME,
        figu.gu_id AS GS_COUNTRY,
        temp.inst_mnem AS GS_OID,
        fiid.fins_id AS VENDOR_ID,
        fiid.fins_id_ctxt_typ AS VENDOR
    FROM temp
    JOIN ft_t_fiid fiid 
      ON temp.inst_mnem = fiid.inst_mnem
     AND fiid.end_tms IS NULL
     AND fiid.fins_id_ctxt_typ IN ('FITCH', 'MDY', 'S&amp;P')
     AND fiid.inst_mnem NOT IN (
         SELECT inst_mnem 
         FROM ft_t_fiid 
         WHERE fins_id_ctxt_typ = 'ALACRAID' 
           AND end_tms IS NULL 
           AND start_tms &lt; current_timestamp - interval '30 days'
     )
    LEFT JOIN ft_t_figu figu 
      ON temp.inst_mnem = figu.inst_mnem
     AND figu.gu_typ = 'COUNTRY'
     AND fins_gu_purp_typ = 'DOMICILE'
     AND figu.end_tms IS NULL
)
SELECT   'GS_ENTITY_NAME|GS_COUNTRY|GS_OID|VENDOR_ID|VENDOR|ALACRA_ID|ALACRA_NAME|ALACRA_COUNTRY|ALACRA_COUNT|ALACRA_BBG_ID_PRIM|ALACRA_BBG_ID_SEC|ALACRA_LT_LOC_VENDOR_RATING|ALACRA_LT_FGN_VENDOR_RATING' 
        AS "AlacraRequestRow",
    NULL::text AS "AlacraVendor",
    NULL::text AS "AlacraVendorID"
UNION ALL
SELECT 
    TRIM(dupsFins.GS_ENTITY_NAME) || '|' ||
    COALESCE(TRIM(dupsFins.GS_COUNTRY), '') || '|' ||
    COALESCE(TRIM(dupsFins.GS_OID), '') || '|' ||
    COALESCE(TRIM(dupsFins.VENDOR_ID), '') || '|' ||
    COALESCE(TRIM(REPLACE(dupsFins.VENDOR, 'S&amp;P', 'SP')), '') ||
    repeat('|', 8) AS "AlacraRequestRow",
    COALESCE(TRIM(REPLACE(dupsFins.VENDOR, 'S&amp;P', 'SP')), '') AS "AlacraVendor",
    COALESCE(TRIM(dupsFins.VENDOR_ID), '') AS "AlacraVendorID"
FROM dupsFins</objectValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="208" type="java.util.HashSet">
<item id="209" type="com.j2fe.workflow.definition.Transition">
<name id="210">goto-next</name>
<source id="211">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="212"/>
<directJoin>false</directJoin>
<name id="213">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="214">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="215" type="java.util.HashSet"/>
<targets id="216" type="java.util.HashSet">
<item idref="209" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="194"/>
</item>
</sources>
<targets id="217" type="java.util.HashSet">
<item id="218" type="com.j2fe.workflow.definition.Transition">
<name id="219">nothing-found</name>
<source idref="194"/>
<target idref="3"/>
</item>
<item idref="192" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="180"/>
</item>
</sources>
<targets id="220" type="java.util.HashSet">
<item idref="178" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="163"/>
</item>
</sources>
<targets id="221" type="java.util.HashSet">
<item idref="161" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="141"/>
</item>
</sources>
<targets id="222" type="java.util.HashSet">
<item idref="139" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="120"/>
</item>
</sources>
<targets id="223" type="java.util.HashSet">
<item idref="118" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="100"/>
</item>
</sources>
<targets id="224" type="java.util.HashSet">
<item idref="98" type="com.j2fe.workflow.definition.Transition"/>
<item id="225" type="com.j2fe.workflow.definition.Transition">
<name id="226">not-empty</name>
<source idref="100"/>
<target id="227">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="228"/>
<directJoin>false</directJoin>
<name id="229">Delete File</name>
<nodeHandler>com.j2fe.feeds.activities.DeleteFile</nodeHandler>
<nodeHandlerClass id="230">com.j2fe.feeds.activities.DeleteFile</nodeHandlerClass>
<parameters id="231" type="java.util.HashSet">
<item id="232" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="233">directory</name>
<stringValue id="234">AlacraOutboundFileDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="235" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="236">fileName</name>
<stringValue id="237">AlacraRequestFileName</stringValue>
<type>VARIABLE</type>
</item>
<item id="238" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="239">fileSystem</name>
<stringValue id="240">filesystem/local</stringValue>
<type>REFERENCE</type>
</item>
</parameters>
<sources id="241" type="java.util.HashSet">
<item idref="225" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="242" type="java.util.HashSet">
<item id="243" type="com.j2fe.workflow.definition.Transition">
<name id="244">goto-next</name>
<source idref="227"/>
<target idref="93"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="93"/>
</item>
<item idref="243" type="com.j2fe.workflow.definition.Transition"/>
<item id="245" type="com.j2fe.workflow.definition.Transition">
<name id="246">goto-next</name>
<source id="247">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="248"/>
<directJoin>false</directJoin>
<name id="249">Write File</name>
<nodeHandler>com.j2fe.general.activities.File</nodeHandler>
<nodeHandlerClass id="250">com.j2fe.general.activities.File</nodeHandlerClass>
<parameters id="251" type="java.util.HashSet">
<item id="252" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="253">appendEOFLine</name>
<stringValue id="254">true</stringValue>
<type>CONSTANT</type>
</item>
<item id="255" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="256">directory</name>
<stringValue id="257">AlacraOutboundFileDirectory</stringValue>
<type>VARIABLE</type>
</item>
<item id="258" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="259">encoding</name>
<stringValue id="260">UTF-8</stringValue>
<type>CONSTANT</type>
</item>
<item id="261" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="262">fileName</name>
<stringValue id="263">AlacraRequestFileName</stringValue>
<type>VARIABLE</type>
</item>
<item id="264" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="265">text</name>
<stringValue id="266">AlacraOutboundRow</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="267" type="java.util.HashSet">
<item id="268" type="com.j2fe.workflow.definition.Transition">
<name id="269">goto-next</name>
<source id="270">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="271"/>
<directJoin>false</directJoin>
<name id="272">Update Request Status</name>
<nodeHandler>com.j2fe.feeds.request.UpdateVREQ</nodeHandler>
<nodeHandlerClass id="273">com.j2fe.feeds.request.UpdateVREQ</nodeHandlerClass>
<parameters id="274" type="java.util.HashSet">
<item id="275" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="276">fileName</name>
<stringValue id="277">AlacraResponseFileName</stringValue>
<type>VARIABLE</type>
</item>
<item id="278" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="279">requestOIDs</name>
<stringValue id="280">VND_RQST_OID</stringValue>
<type>VARIABLE</type>
</item>
<item id="281" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="282">status</name>
<stringValue id="283">REQUESTED</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="284" type="java.util.HashSet">
<item id="285" type="com.j2fe.workflow.definition.Transition">
<name id="286">goto-next</name>
<source id="287">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="288"/>
<directJoin>false</directJoin>
<name id="289">Create Request Status</name>
<nodeHandler>com.j2fe.feeds.request.CreateVREQ</nodeHandler>
<nodeHandlerClass id="290">com.j2fe.feeds.request.CreateVREQ</nodeHandlerClass>
<parameters id="291" type="java.util.HashSet">
<item id="292" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="293">ctxt</name>
<stringValue id="294">AlacraOutboundVendor</stringValue>
<type>VARIABLE</type>
</item>
<item id="295" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="296">dataSourceType</name>
<stringValue id="297">ALACRA</stringValue>
<type>CONSTANT</type>
</item>
<item id="298" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="299">identifier</name>
<stringValue id="300">AlacraOutboundVendorID</stringValue>
<type>VARIABLE</type>
</item>
<item id="301" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="302">physicalRequest</name>
<stringValue id="303">true</stringValue>
<type>CONSTANT</type>
</item>
<item id="304" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="305">requestType</name>
<stringValue id="306">AlacraIssuer</stringValue>
<type>CONSTANT</type>
</item>
<item id="307" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="308">requestor</name>
<stringValue id="309">IssuerMerge</stringValue>
<type>CONSTANT</type>
</item>
<item id="310" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="311">status</name>
<stringValue id="312">REQUESTING</stringValue>
<type>CONSTANT</type>
</item>
<item id="313" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="314">tableType</name>
<stringValue id="315">FINS</stringValue>
<type>CONSTANT</type>
</item>
<item id="316" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="317">transactionID</name>
<stringValue id="318">RequestTransaction</stringValue>
<type>VARIABLE</type>
</item>
<item id="319" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="320">userId</name>
<stringValue id="321">AlacraOutbound</stringValue>
<type>CONSTANT</type>
</item>
<item id="322" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="323">vendorReqOid</name>
<stringValue id="324">VND_RQST_OID</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="325" type="java.util.HashSet">
<item id="326" type="com.j2fe.workflow.definition.Transition">
<name id="327">loop</name>
<source idref="67"/>
<target idref="287"/>
</item>
</sources>
<targets id="328" type="java.util.HashSet">
<item idref="285" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="270"/>
</item>
</sources>
<targets id="329" type="java.util.HashSet">
<item idref="268" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="247"/>
</item>
</sources>
<targets id="330" type="java.util.HashSet">
<item idref="245" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="93"/>
</item>
</sources>
<targets id="331" type="java.util.HashSet">
<item idref="91" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="67"/>
</item>
</sources>
<targets id="332" type="java.util.HashSet">
<item idref="65" type="com.j2fe.workflow.definition.Transition"/>
<item idref="326" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="50"/>
</item>
</sources>
<targets id="333" type="java.util.HashSet">
<item idref="48" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="21"/>
</item>
</sources>
<targets id="334" type="java.util.HashSet">
<item idref="19" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="10"/>
</item>
</sources>
<targets id="335" type="java.util.HashSet">
<item idref="8" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="3"/>
</item>
<item idref="218" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="336" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="337">Custom/Dataloads/IssuerMerge</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="338">user1</lastChangeUser>
<lastUpdate id="339">2025-12-29T07:29:10.000+0000</lastUpdate>
<name id="340">AlacraOutbound</name>
<nodes id="341" type="java.util.HashSet">
<item idref="10" type="com.j2fe.workflow.definition.Node"/>
<item idref="141" type="com.j2fe.workflow.definition.Node"/>
<item idref="287" type="com.j2fe.workflow.definition.Node"/>
<item idref="120" type="com.j2fe.workflow.definition.Node"/>
<item idref="180" type="com.j2fe.workflow.definition.Node"/>
<item idref="163" type="com.j2fe.workflow.definition.Node"/>
<item idref="227" type="com.j2fe.workflow.definition.Node"/>
<item idref="194" type="com.j2fe.workflow.definition.Node"/>
<item idref="21" type="com.j2fe.workflow.definition.Node"/>
<item idref="67" type="com.j2fe.workflow.definition.Node"/>
<item idref="100" type="com.j2fe.workflow.definition.Node"/>
<item idref="93" type="com.j2fe.workflow.definition.Node"/>
<item idref="50" type="com.j2fe.workflow.definition.Node"/>
<item idref="211" type="com.j2fe.workflow.definition.Node"/>
<item idref="3" type="com.j2fe.workflow.definition.Node"/>
<item idref="270" type="com.j2fe.workflow.definition.Node"/>
<item idref="247" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>true</optimize>
<parameter id="342" type="java.util.HashMap">
<entry>
<key id="343" type="java.lang.String">AlacraOutboundFileDirectory</key>
<value id="344" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="345">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="346"/>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="347" type="java.lang.String">BaseFileName</key>
<value id="348" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="349">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="350" type="java.lang.String">ParentJobID</key>
<value id="351" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="352">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
</parameter>
<permissions id="353" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>false</purgeAtEnd>
<retries>0</retries>
<startNode idref="211"/>
<status>RELEASED</status>
<variables id="354" type="java.util.HashMap">
<entry>
<key id="355" type="java.lang.String">AlacraOutboundFileDirectory</key>
<value id="356" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="357">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="358"/>
<persistent>false</persistent>
<value id="359" type="java.lang.String">/gold/app/AlacraOutbound</value>
</value>
</entry>
<entry>
<key id="360" type="java.lang.String">BaseFileName</key>
<value id="361" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="362">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="363" type="java.lang.String">Alacra_DeDup_File</value>
</value>
</entry>
<entry>
<key id="364" type="java.lang.String">ParentJobID</key>
<value id="365" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="366">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="367" type="java.lang.String">forLoopCnt</key>
<value id="368" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="369">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<persistent>false</persistent>
<value id="370" type="java.lang.Integer">0</value>
</value>
</entry>
</variables>
<version>11</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
