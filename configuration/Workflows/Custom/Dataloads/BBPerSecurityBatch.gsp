<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.09">
<package-comment/>
<businessobject displayString="43 - V10 Remote Pub call - Yield Curve flag" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>false</alwaysPersist>
<clustered>false</clustered>
<comment id="1">V10 Remote Pub call - Yield Curve flag</comment>
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
<description id="11">Automatically generated</description>
<directJoin>false</directJoin>
<name id="12">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="13">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="14" type="java.util.HashSet">
<item id="15" type="com.j2fe.workflow.definition.Transition">
<name id="16">end-loop</name>
<source id="17">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="18"/>
<directJoin>false</directJoin>
<name id="19">For Loop</name>
<nodeHandler>com.j2fe.workflow.handler.impl.ForEach</nodeHandler>
<nodeHandlerClass id="20">com.j2fe.workflow.handler.impl.ForEach</nodeHandlerClass>
<parameters id="21" type="java.util.HashSet">
<item id="22" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="23">counter</name>
<stringValue id="24">Counter</stringValue>
<type>VARIABLE</type>
</item>
<item id="25" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="26">counter</name>
<stringValue id="27">Counter</stringValue>
<type>VARIABLE</type>
</item>
<item id="28" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="29">input</name>
<stringValue id="30">JobIds</stringValue>
<type>VARIABLE</type>
</item>
<item id="31" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="32">output</name>
<stringValue id="33">jobId</stringValue>
<type>VARIABLE</type>
</item>
<item id="34" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="35">resetOnEnd</name>
<stringValue id="36">true</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="37" type="java.util.HashSet">
<item id="38" type="com.j2fe.workflow.definition.Transition">
<name id="39">ToSplit</name>
<source id="40">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="41">Automatically generated</description>
<directJoin>false</directJoin>
<name id="42">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="43">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="44" type="java.util.HashSet">
<item id="45" type="com.j2fe.workflow.definition.Transition">
<name id="46">goto-next</name>
<source id="47">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="48"/>
<directJoin>false</directJoin>
<name id="49">Raise Event Remote #4</name>
<nodeHandler>com.j2fe.event.RaiseEventRemote</nodeHandler>
<nodeHandlerClass id="50">com.j2fe.event.RaiseEventRemote</nodeHandlerClass>
<parameters id="51" type="java.util.HashSet">
<item id="52" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="53">eventName</name>
<stringValue id="54">MizBulkPublishing_Event</stringValue>
<type>CONSTANT</type>
</item>
<item id="55" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="56">["JobId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="57">parameters["JobId"]</name>
<stringValue id="58">jobId</stringValue>
<type>VARIABLE</type>
</item>
<item id="59" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="60">["No. Of Parallel Branches"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="61">parameters["No. Of Parallel Branches"]</name>
<objectValue id="62" type="java.lang.Integer">5</objectValue>
<type>CONSTANT</type>
</item>
<item id="63" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="64">["PublishSoi"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="65">parameters["PublishSoi"]</name>
<stringValue id="66">SoiPurpType</stringValue>
<type>VARIABLE</type>
</item>
<item id="67" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="68">propertyFileLocation</name>
<stringValue id="69">db://resource/PublishingConfiguration/PublishingConfig.properties</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="70" type="java.util.HashSet">
<item id="71" type="com.j2fe.workflow.definition.Transition">
<name id="72">loop</name>
<source idref="17"/>
<target idref="47"/>
</item>
</sources>
<targets id="73" type="java.util.HashSet">
<item idref="45" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="40"/>
</item>
<item id="74" type="com.j2fe.workflow.definition.Transition">
<name id="75">rows-found</name>
<source id="76">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="77"/>
<directJoin>false</directJoin>
<name id="78">Get JobIds</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="79">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="80" type="java.util.HashSet">
<item id="81" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="82">database</name>
<stringValue id="83">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="84" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="85">firstColumnsResult</name>
<stringValue id="86">JobIds</stringValue>
<type>VARIABLE</type>
</item>
<item id="87" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="88">indexedParameters[0]</name>
<stringValue id="89">RequestTransaction</stringValue>
<type>VARIABLE</type>
</item>
<item id="90" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="91">querySQL</name>
<stringValue id="92">select distinct trid.job_id from ft_t_trid trid, ft_t_vreq vreq where vreq.vnd_rqst_oid = trid.vnd_rqst_oid and vreq.trn_id = ? and trid.crrnt_severity_cde &lt; 50 and vreq.vnd_rqst_xref_tbl_typ = 'ISSU' and trid.job_id is not null</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="93" type="java.util.HashSet">
<item id="94" type="com.j2fe.workflow.definition.Transition">
<name id="95">goto-next</name>
<source id="96">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="97">Automatically generated</description>
<directJoin>false</directJoin>
<name id="98">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="99">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="100" type="java.util.HashSet">
<item id="101" type="com.j2fe.workflow.definition.Transition">
<name id="102">goto-next</name>
<source id="103">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="104"/>
<directJoin>false</directJoin>
<name id="105">Add Curve Members</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="106">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="107" type="java.util.HashSet">
<item id="108" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="109">["JMSTextMessage"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="110">input["JMSTextMessage"]</name>
<stringValue id="111">CurveMessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="112" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="113">["TriggeredByBBPerSecurityBatch"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="114">input["TriggeredByBBPerSecurityBatch"]</name>
<objectValue id="115" type="java.lang.String">Y</objectValue>
<type>CONSTANT</type>
</item>
<item id="116" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="117">["TriggeredByCmfSoiAdditionForUnderlyers"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="118">input["TriggeredByCmfSoiAdditionForUnderlyers"]</name>
<objectValue id="119" type="java.lang.String">N</objectValue>
<type>CONSTANT</type>
</item>
<item id="120" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="121">name</name>
<stringValue id="122">cmfSOIAddition</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<persistentVariables id="123" type="java.util.HashSet">
<item id="124" type="java.lang.String">UndMessageArr
1000</item>
<item id="125" type="java.lang.String">CurveMessageArr
1000</item>
<item id="126" type="java.lang.String">CurveMessage
1000</item>
</persistentVariables>
<sources id="127" type="java.util.HashSet">
<item id="128" type="com.j2fe.workflow.definition.Transition">
<name id="129">goto-next</name>
<source id="130">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="131"/>
<directJoin>false</directJoin>
<name id="132">Bean Shell Script (Standard)</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="133">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="134" type="java.util.HashSet">
<item id="135" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="136">statements</name>
<stringValue id="137">String Message = MessageArr[0];</stringValue>
<type>CONSTANT</type>
</item>
<item id="138" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="139">["Message"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="140">variables["Message"]</name>
<stringValue id="141">CurveMessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="142" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="143">["MessageArr"]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="144">variables["MessageArr"]</name>
<stringValue id="145">CurveMessageArr</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="146" type="java.util.HashSet">
<item id="147" type="com.j2fe.workflow.definition.Transition">
<name id="148">rows-found</name>
<source id="149">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="150"/>
<directJoin>false</directJoin>
<name id="151">Curve Members</name>
<nodeHandler>com.j2fe.general.activities.database.XMLQuery</nodeHandler>
<nodeHandlerClass id="152">com.j2fe.general.activities.database.XMLQuery</nodeHandlerClass>
<parameters id="153" type="java.util.HashSet">
<item id="154" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="155">database</name>
<stringValue id="156">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="157" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="158">mappedParameters["1,2,4,5"]</name>
<stringValue id="159">RequestTransaction</stringValue>
<type>VARIABLE</type>
</item>
<item id="160" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="161">mappedParameters["3,6"]</name>
<stringValue id="162">SoiPurpType</stringValue>
<type>VARIABLE</type>
</item>
<item id="163" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="164">querySQL</name>
<objectValue id="165" type="java.lang.String">WITH security_interest_ids AS (&#13;
    SELECT iss_id, &#13;
           XMLAGG(&#13;
               XMLELEMENT(&#13;
                   NAME "securityOfInterestId",&#13;
                   XMLATTRIBUTES('mizuho:systemOfInterest-id' AS "securityOfInterestIdScheme"),&#13;
                   ( select COALESCE((SELECT ISGR.GRP_NME &#13;
					FROM FT_T_ISGP ISGP, FT_T_ISGR ISGR &#13;
					WHERE ISGP.PRNT_ISS_GRP_OID= ISGR.ISS_GRP_OID AND ISGP.END_TMS IS NULL AND ISGR.END_TMS IS NULL &#13;
					AND ISGP.INSTR_ID IS NULL AND ISGP.PRT_PURP_TYP='UNDERLYG' AND ISGP.ISS_GRP_OID = ISGRMAIN.ISS_GRP_OID), grp_nme )&#13;
					from ft_t_isgr ISGRMAIN where iss_grp_oid = prnt_iss_grp_oid)&#13;
               )&#13;
           ) AS security_xml&#13;
    FROM (&#13;
select iss_id, cl_value, (select distinct vnd_rqstr_id from ft_t_vreq where trn_id = cast(? as varchar)) usr_id, P.PRNT_ISS_GRP_OID&#13;
from ft_t_isid i, ft_t_iscl c, ft_t_riss r, ft_t_ridf d, ft_t_isgp p, ft_t_isgr a&#13;
where i.instr_id = c.instr_id&#13;
and i.ID_CTXT_TYP = 'BB8CHR'&#13;
and c.INDUS_CL_SET_ID = 'BBMKTSCT'&#13;
and c.end_tms is null&#13;
and i.end_tms is null&#13;
and r.end_tms is null&#13;
and d.end_tms is null&#13;
and p.end_tms is null&#13;
and p.prnt_iss_grp_oid=a.iss_grp_oid&#13;
and a.grp_nme not in ('MHSA Inventory')&#13;
and i.instr_id = r.instr_id&#13;
and r.RLD_ISS_FEAT_ID = d.RLD_ISS_FEAT_ID&#13;
and rel_typ = 'COMPSTN'&#13;
and d.instr_id in (select instr_id&#13;
from ft_t_isid where iss_id in (select vnd_rqst_xref_id from ft_t_vreq where trn_id =cast(? as varchar)))&#13;
and d.instr_id = p.instr_id&#13;
and p.prt_purp_typ = cast(? as varchar)&#13;
and not exists (select 'x' from ft_t_isgp g&#13;
where i.instr_id = g.instr_id&#13;
and g.prt_purp_typ = p.prt_purp_typ&#13;
and g.PRNT_ISS_GRP_OID = p.PRNT_ISS_GRP_OID&#13;
and g.end_tms is null&#13;
AND G.PRNT_ISS_GRP_OID = COALESCE(&#13;
(SELECT ISGR.ISS_GRP_OID&#13;
FROM FT_T_ISGP ISGP, FT_T_ISGR ISGR &#13;
WHERE ISGP.PRNT_ISS_GRP_OID= ISGR.ISS_GRP_OID AND ISGP.END_TMS IS NULL AND ISGR.END_TMS IS NULL&#13;
AND ISGP.INSTR_ID IS NULL AND ISGP.PRT_PURP_TYP='UNDERLYG' AND ISGP.ISS_GRP_OID = p.ISS_GRP_OID ), p.ISS_GRP_OID&#13;
)&#13;
)&#13;
    ) AS derived_data&#13;
    GROUP BY iss_id, cl_value, usr_id&#13;
)&#13;
SELECT XMLELEMENT(&#13;
    NAME "cmfSOIAdditionCollection",&#13;
    XMLAGG(&#13;
        XMLELEMENT(&#13;
            NAME "cmfSOIAddition",&#13;
            XMLELEMENT(&#13;
                NAME "instrumentId",&#13;
                XMLATTRIBUTES('mizuho:TICKER' AS "instrumentIdScheme"),&#13;
                iss_id&#13;
            ),&#13;
            XMLELEMENT (NAME "yellowKey", cl_value),&#13;
			XMLELEMENT(NAME "sourceSystemId", usr_id),&#13;
            XMLELEMENT(NAME "securityOfInterestIds", security_xml)&#13;
        )&#13;
    )&#13;
)&#13;
FROM (&#13;
select iss_id, cl_value, (select distinct vnd_rqstr_id from ft_t_vreq where trn_id = cast(? as varchar)) usr_id, P.PRNT_ISS_GRP_OID&#13;
from ft_t_isid i, ft_t_iscl c, ft_t_riss r, ft_t_ridf d, ft_t_isgp p, ft_t_isgr a&#13;
where i.instr_id = c.instr_id&#13;
and i.ID_CTXT_TYP = 'BB8CHR'&#13;
and c.INDUS_CL_SET_ID = 'BBMKTSCT'&#13;
and c.end_tms is null&#13;
and i.end_tms is null&#13;
and r.end_tms is null&#13;
and d.end_tms is null&#13;
and p.end_tms is null&#13;
and p.prnt_iss_grp_oid=a.iss_grp_oid&#13;
and a.grp_nme not in ('MHSA Inventory')&#13;
and i.instr_id = r.instr_id&#13;
and r.RLD_ISS_FEAT_ID = d.RLD_ISS_FEAT_ID&#13;
and rel_typ = 'COMPSTN'&#13;
and d.instr_id in (select instr_id&#13;
from ft_t_isid where iss_id in (select vnd_rqst_xref_id from ft_t_vreq where trn_id =cast(? as varchar)))&#13;
and d.instr_id = p.instr_id&#13;
and p.prt_purp_typ = cast(? as varchar)&#13;
and not exists (select 'x' from ft_t_isgp g&#13;
where i.instr_id = g.instr_id&#13;
and g.prt_purp_typ = p.prt_purp_typ&#13;
and g.PRNT_ISS_GRP_OID = p.PRNT_ISS_GRP_OID&#13;
and g.end_tms is null&#13;
AND G.PRNT_ISS_GRP_OID = COALESCE(&#13;
(SELECT ISGR.ISS_GRP_OID&#13;
FROM FT_T_ISGP ISGP, FT_T_ISGR ISGR &#13;
WHERE ISGP.PRNT_ISS_GRP_OID= ISGR.ISS_GRP_OID AND ISGP.END_TMS IS NULL AND ISGR.END_TMS IS NULL&#13;
AND ISGP.INSTR_ID IS NULL AND ISGP.PRT_PURP_TYP='UNDERLYG' AND ISGP.ISS_GRP_OID = p.ISS_GRP_OID ), p.ISS_GRP_OID&#13;
)&#13;
)&#13;
) AS final_selection&#13;
JOIN security_interest_ids USING (iss_id);</objectValue>
<type>CONSTANT</type>
</item>
<item id="166" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="167">result</name>
<stringValue id="168">CurveMessageArr</stringValue>
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
<name id="178">end-loop</name>
<source id="179">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="180"/>
<directJoin>false</directJoin>
<name id="181">For Loop</name>
<nodeHandler>com.j2fe.workflow.handler.impl.ForEach</nodeHandler>
<nodeHandlerClass id="182">com.j2fe.workflow.handler.impl.ForEach</nodeHandlerClass>
<parameters id="183" type="java.util.HashSet">
<item id="184" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="185">counter</name>
<stringValue id="186">Counter</stringValue>
<type>VARIABLE</type>
</item>
<item id="187" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="188">counter</name>
<stringValue id="189">Counter</stringValue>
<type>VARIABLE</type>
</item>
<item id="190" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="191">input</name>
<stringValue id="192">CDSJobIds</stringValue>
<type>VARIABLE</type>
</item>
<item id="193" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="194">output</name>
<stringValue id="195">jobId</stringValue>
<type>VARIABLE</type>
</item>
<item id="196" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="197">resetOnEnd</name>
<stringValue id="198">true</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="199" type="java.util.HashSet">
<item id="200" type="com.j2fe.workflow.definition.Transition">
<name id="201">ToSplit</name>
<source id="202">
<activation>ASYNCHRONOUS</activation>
<clusteredCall>false</clusteredCall>
<description id="203">Automatically generated</description>
<directJoin>false</directJoin>
<name id="204">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="205">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<persistentVariables id="206" type="java.util.HashSet">
<item id="207" type="java.lang.String">CDSJobIds
1000</item>
<item id="208" type="java.lang.String">CDSMessageArr
1000</item>
</persistentVariables>
<sources id="209" type="java.util.HashSet">
<item id="210" type="com.j2fe.workflow.definition.Transition">
<name id="211">goto-next</name>
<source id="212">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="213"/>
<directJoin>false</directJoin>
<name id="214">Raise Event Remote #3</name>
<nodeHandler>com.j2fe.event.RaiseEventRemote</nodeHandler>
<nodeHandlerClass id="215">com.j2fe.event.RaiseEventRemote</nodeHandlerClass>
<parameters id="216" type="java.util.HashSet">
<item id="217" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="218">eventName</name>
<stringValue id="219">MizBulkPublishing_Event</stringValue>
<type>CONSTANT</type>
</item>
<item id="220" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="221">["JobId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="222">parameters["JobId"]</name>
<stringValue id="223">jobId</stringValue>
<type>VARIABLE</type>
</item>
<item id="224" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="225">["No. Of Parallel Branches"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="226">parameters["No. Of Parallel Branches"]</name>
<objectValue id="227" type="java.lang.Integer">5</objectValue>
<type>CONSTANT</type>
</item>
<item id="228" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="229">["PublishSoi"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="230">parameters["PublishSoi"]</name>
<stringValue id="231">SoiPurpType</stringValue>
<type>VARIABLE</type>
</item>
<item id="232" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="233">propertyFileLocation</name>
<stringValue id="234">db://resource/PublishingConfiguration/PublishingConfig.properties</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="235" type="java.util.HashSet">
<item id="236" type="com.j2fe.workflow.definition.Transition">
<name id="237">loop</name>
<source idref="179"/>
<target idref="212"/>
</item>
</sources>
<targets id="238" type="java.util.HashSet">
<item idref="210" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="202"/>
</item>
<item id="239" type="com.j2fe.workflow.definition.Transition">
<name id="240">rows-found</name>
<source id="241">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="242"/>
<directJoin>false</directJoin>
<name id="243">Get CDS JobIds</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="244">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="245" type="java.util.HashSet">
<item id="246" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="247">database</name>
<stringValue id="248">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="249" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="250">firstColumnsResult</name>
<stringValue id="251">CDSJobIds</stringValue>
<type>VARIABLE</type>
</item>
<item id="252" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="253">indexedParameters[0]</name>
<stringValue id="254">CDSwpRequestTransaction</stringValue>
<type>VARIABLE</type>
</item>
<item id="255" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="256">querySQL</name>
<stringValue id="257">select distinct trid.job_id from ft_t_trid trid, ft_t_vreq vreq where vreq.vnd_rqst_oid = trid.vnd_rqst_oid and vreq.trn_id = cast(? as varchar) and trid.crrnt_severity_cde &lt; 50 and vreq.vnd_rqst_xref_tbl_typ = 'ISSU' and trid.job_id is not null</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="258" type="java.util.HashSet">
<item id="259" type="com.j2fe.workflow.definition.Transition">
<name id="260">goto-next</name>
<source id="261">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="262">Automatically generated</description>
<directJoin>false</directJoin>
<name id="263">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="264">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="265" type="java.util.HashSet">
<item id="266" type="com.j2fe.workflow.definition.Transition">
<name id="267">goto-next</name>
<source id="268">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="269"/>
<directJoin>false</directJoin>
<name id="270">SOIadd CDS Underly</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="271">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="272" type="java.util.HashSet">
<item id="273" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="274">["JMSTextMessage"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="275">input["JMSTextMessage"]</name>
<stringValue id="276">CDSMessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="277" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="278">["PublishAssets"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="279">input["PublishAssets"]</name>
<stringValue id="280">Publish</stringValue>
<type>VARIABLE</type>
</item>
<item id="281" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="282">["TriggeredByBBPerSecurityBatch"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="283">input["TriggeredByBBPerSecurityBatch"]</name>
<objectValue id="284" type="java.lang.String">Y</objectValue>
<type>CONSTANT</type>
</item>
<item id="285" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="286">["TriggeredByCmfSoiAdditionForUnderlyers"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="287">input["TriggeredByCmfSoiAdditionForUnderlyers"]</name>
<objectValue id="288" type="java.lang.String">N</objectValue>
<type>CONSTANT</type>
</item>
<item id="289" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="290">name</name>
<stringValue id="291">cmfSOIAddition</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<persistentVariables id="292" type="java.util.HashSet">
<item id="293" type="java.lang.String">CDSMessage
1000</item>
<item id="294" type="java.lang.String">CDSMessageArr
1000</item>
</persistentVariables>
<sources id="295" type="java.util.HashSet">
<item id="296" type="com.j2fe.workflow.definition.Transition">
<name id="297">goto-next</name>
<source id="298">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="299"/>
<directJoin>false</directJoin>
<name id="300">Bean Shell Script (Standard)</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="301">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="302" type="java.util.HashSet">
<item id="303" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="304">statements</name>
<stringValue id="305">String Message = MessageArr[0];</stringValue>
<type>CONSTANT</type>
</item>
<item id="306" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="307">["Message"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="308">variables["Message"]</name>
<stringValue id="309">CDSMessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="310" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="311">["MessageArr"]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="312">variables["MessageArr"]</name>
<stringValue id="313">CDSMessageArr</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="314" type="java.util.HashSet">
<item id="315" type="com.j2fe.workflow.definition.Transition">
<name id="316">rows-found</name>
<source id="317">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="318"/>
<directJoin>false</directJoin>
<name id="319">CDS Underly CB</name>
<nodeHandler>com.j2fe.general.activities.database.XMLQuery</nodeHandler>
<nodeHandlerClass id="320">com.j2fe.general.activities.database.XMLQuery</nodeHandlerClass>
<parameters id="321" type="java.util.HashSet">
<item id="322" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="323">database</name>
<stringValue id="324">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="325" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="326">mappedParameters["1,4"]</name>
<stringValue id="327">RequestTransaction</stringValue>
<type>VARIABLE</type>
</item>
<item id="328" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="329">mappedParameters["2,3,5,6"]</name>
<stringValue id="330">SoiPurpType</stringValue>
<type>VARIABLE</type>
</item>
<item id="331" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="332">querySQL</name>
<objectValue id="333" type="java.lang.String">WITH security_interest_ids AS (&#13;
    SELECT iss_id, &#13;
           XMLAGG(&#13;
               XMLELEMENT(&#13;
                   NAME "securityOfInterestId",&#13;
                   XMLATTRIBUTES('mizuho:systemOfInterest-id' AS "securityOfInterestIdScheme"),&#13;
                   ( select COALESCE((SELECT ISGR.GRP_NME &#13;
					FROM FT_T_ISGP ISGP, FT_T_ISGR ISGR &#13;
					WHERE ISGP.PRNT_ISS_GRP_OID= ISGR.ISS_GRP_OID AND ISGP.END_TMS IS NULL AND ISGR.END_TMS IS NULL &#13;
					AND ISGP.INSTR_ID IS NULL AND ISGP.PRT_PURP_TYP='UNDERLYG' AND ISGP.ISS_GRP_OID = ISGRMAIN.ISS_GRP_OID), grp_nme )&#13;
					from ft_t_isgr ISGRMAIN where iss_grp_oid = prnt_iss_grp_oid)&#13;
               )&#13;
           ) AS security_xml&#13;
    FROM (&#13;
select distinct s.stat_char_val_txt as iss_id, 'Equity' as cl_value, (select distinct vnd_rqstr_id from ft_t_vreq where trn_id = CAST(? as VARCHAR) ) usr_id, g.prnt_iss_grp_oid&#13;
from ft_t_isst s, ft_t_issu i, ft_t_issu cds, ft_t_ridf ridf, ft_t_riss riss, ft_t_isgp g, ft_t_isgr c&#13;
where 1=1&#13;
and cds.iss_typ='CDSWP' &#13;
and cds.end_tms is null&#13;
and ridf.instr_id = cds.instr_id&#13;
and ridf.rel_typ = 'UNDERLYG'&#13;
and ridf.end_tms is null&#13;
and riss.RLD_ISS_FEAT_ID = ridf.RLD_ISS_FEAT_ID&#13;
and riss.end_tms is null&#13;
and riss.instr_id= i.instr_id&#13;
and i.iss_typ='CVTBOND'&#13;
and i.end_tms is null&#13;
and s.instr_id=i.instr_id&#13;
and s.stat_def_id = 'UNDBBUNQ'&#13;
and s.end_tms is null&#13;
and i.instr_id = g.instr_id&#13;
and g.prnt_iss_grp_oid=c.iss_grp_oid&#13;
and c.grp_nme not in ('MHSA Inventory')&#13;
and g.end_tms is null&#13;
and g.prt_purp_typ = CAST(? as VARCHAR)&#13;
-- equity not in SOI&#13;
and not exists (&#13;
select 1 from ft_t_isid i, ft_t_isgp p&#13;
where i.iss_id = s.stat_char_val_txt&#13;
and i.id_ctxt_typ = 'BBUNIQUE'&#13;
and i.end_tms is null&#13;
and i.instr_id = p.instr_id&#13;
and p.end_tms is null&#13;
and p.prt_purp_typ = CAST(? as VARCHAR)&#13;
and p.prnt_iss_grp_oid = g.prnt_iss_grp_oid&#13;
AND p.PRNT_ISS_GRP_OID = COALESCE(&#13;
(SELECT ISGR.ISS_GRP_OID&#13;
FROM FT_T_ISGP ISGP, FT_T_ISGR ISGR &#13;
WHERE ISGP.PRNT_ISS_GRP_OID= ISGR.ISS_GRP_OID AND ISGP.END_TMS IS NULL AND ISGR.END_TMS IS NULL&#13;
AND ISGP.INSTR_ID IS NULL AND ISGP.PRT_PURP_TYP='UNDERLYG' AND ISGP.ISS_GRP_OID = C.ISS_GRP_OID ), C.ISS_GRP_OID&#13;
)&#13;
)&#13;
    ) AS derived_data&#13;
    GROUP BY iss_id, cl_value, usr_id&#13;
)&#13;
SELECT XMLELEMENT(&#13;
    NAME "cmfSOIAdditionCollection",&#13;
    XMLAGG(&#13;
        XMLELEMENT(&#13;
            NAME "cmfSOIAddition",&#13;
            XMLELEMENT(&#13;
                NAME "instrumentId",&#13;
                XMLATTRIBUTES('mizuho:BB_UNIQUE' AS "instrumentIdScheme"),&#13;
                iss_id&#13;
            ),&#13;
            XMLELEMENT (NAME "yellowKey", cl_value),&#13;
			XMLELEMENT(NAME "sourceSystemId", usr_id),&#13;
            XMLELEMENT(NAME "securityOfInterestIds", security_xml)&#13;
        )&#13;
    )&#13;
)&#13;
FROM (&#13;
select distinct s.stat_char_val_txt as iss_id, 'Equity' as cl_value, (select distinct vnd_rqstr_id from ft_t_vreq where trn_id = CAST(? as VARCHAR) ) usr_id, g.prnt_iss_grp_oid&#13;
from ft_t_isst s, ft_t_issu i, ft_t_issu cds, ft_t_ridf ridf, ft_t_riss riss, ft_t_isgp g, ft_t_isgr c&#13;
where 1=1&#13;
and cds.iss_typ='CDSWP' &#13;
and cds.end_tms is null&#13;
and ridf.instr_id = cds.instr_id&#13;
and ridf.rel_typ = 'UNDERLYG'&#13;
and ridf.end_tms is null&#13;
and riss.RLD_ISS_FEAT_ID = ridf.RLD_ISS_FEAT_ID&#13;
and riss.end_tms is null&#13;
and riss.instr_id= i.instr_id&#13;
and i.iss_typ='CVTBOND'&#13;
and i.end_tms is null&#13;
and s.instr_id=i.instr_id&#13;
and s.stat_def_id = 'UNDBBUNQ'&#13;
and s.end_tms is null&#13;
and i.instr_id = g.instr_id&#13;
and g.prnt_iss_grp_oid=c.iss_grp_oid&#13;
and c.grp_nme not in ('MHSA Inventory')&#13;
and g.end_tms is null&#13;
and g.prt_purp_typ = CAST(? as VARCHAR)&#13;
-- equity not in SOI&#13;
and not exists (&#13;
select 1 from ft_t_isid i, ft_t_isgp p&#13;
where i.iss_id = s.stat_char_val_txt&#13;
and i.id_ctxt_typ = 'BBUNIQUE'&#13;
and i.end_tms is null&#13;
and i.instr_id = p.instr_id&#13;
and p.end_tms is null&#13;
and p.prt_purp_typ = CAST(? as VARCHAR)&#13;
and p.prnt_iss_grp_oid = g.prnt_iss_grp_oid&#13;
AND p.PRNT_ISS_GRP_OID = COALESCE(&#13;
(SELECT ISGR.ISS_GRP_OID&#13;
FROM FT_T_ISGP ISGP, FT_T_ISGR ISGR &#13;
WHERE ISGP.PRNT_ISS_GRP_OID= ISGR.ISS_GRP_OID AND ISGP.END_TMS IS NULL AND ISGR.END_TMS IS NULL&#13;
AND ISGP.INSTR_ID IS NULL AND ISGP.PRT_PURP_TYP='UNDERLYG' AND ISGP.ISS_GRP_OID = C.ISS_GRP_OID ), C.ISS_GRP_OID&#13;
)&#13;
)&#13;
) AS final_selection&#13;
JOIN security_interest_ids USING (iss_id);</objectValue>
<type>CONSTANT</type>
</item>
<item id="334" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="335">result</name>
<stringValue id="336">CDSMessageArr</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="337" type="java.util.HashSet">
<item id="338" type="com.j2fe.workflow.definition.Transition">
<name id="339">goto-next</name>
<source id="340">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="341">Automatically generated</description>
<directJoin>false</directJoin>
<name id="342">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="343">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="344" type="java.util.HashSet">
<item id="345" type="com.j2fe.workflow.definition.Transition">
<name id="346">goto-next</name>
<source id="347">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="348"/>
<directJoin>false</directJoin>
<name id="349">SOIadd CDS Underly</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="350">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="351" type="java.util.HashSet">
<item id="352" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="353">["JMSTextMessage"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="354">input["JMSTextMessage"]</name>
<stringValue id="355">CDSMessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="356" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="357">["PublishAssets"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="358">input["PublishAssets"]</name>
<stringValue id="359">Publish</stringValue>
<type>VARIABLE</type>
</item>
<item id="360" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="361">["TriggeredByBBPerSecurityBatch"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="362">input["TriggeredByBBPerSecurityBatch"]</name>
<objectValue id="363" type="java.lang.String">Y</objectValue>
<type>CONSTANT</type>
</item>
<item id="364" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="365">["TriggeredByCmfSoiAdditionForUnderlyers"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="366">input["TriggeredByCmfSoiAdditionForUnderlyers"]</name>
<objectValue id="367" type="java.lang.String">N</objectValue>
<type>CONSTANT</type>
</item>
<item id="368" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="369">name</name>
<stringValue id="370">cmfSOIAddition</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<persistentVariables id="371" type="java.util.HashSet">
<item id="372" type="java.lang.String">CDSMessage
1000</item>
<item id="373" type="java.lang.String">CDSMessageArr
1000</item>
</persistentVariables>
<sources id="374" type="java.util.HashSet">
<item id="375" type="com.j2fe.workflow.definition.Transition">
<name id="376">goto-next</name>
<source id="377">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="378"/>
<directJoin>false</directJoin>
<name id="379">Bean Shell Script (Standard)</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="380">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="381" type="java.util.HashSet">
<item id="382" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="383">statements</name>
<stringValue id="384">String Message = MessageArr[0];</stringValue>
<type>CONSTANT</type>
</item>
<item id="385" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="386">["Message"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="387">variables["Message"]</name>
<stringValue id="388">CDSMessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="389" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="390">["MessageArr"]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="391">variables["MessageArr"]</name>
<stringValue id="392">CDSMessageArr</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="393" type="java.util.HashSet">
<item id="394" type="com.j2fe.workflow.definition.Transition">
<name id="395">rows-found</name>
<source id="396">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="397"/>
<directJoin>false</directJoin>
<name id="398">CDS Underly</name>
<nodeHandler>com.j2fe.general.activities.database.XMLQuery</nodeHandler>
<nodeHandlerClass id="399">com.j2fe.general.activities.database.XMLQuery</nodeHandlerClass>
<parameters id="400" type="java.util.HashSet">
<item id="401" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="402">database</name>
<stringValue id="403">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="404" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="405">mappedParameters["1,4"]</name>
<stringValue id="406">RequestTransaction</stringValue>
<type>VARIABLE</type>
</item>
<item id="407" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="408">mappedParameters["2,3,5,6"]</name>
<stringValue id="409">SoiPurpType</stringValue>
<type>VARIABLE</type>
</item>
<item id="410" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="411">querySQL</name>
<objectValue id="412" type="java.lang.String">WITH security_interest_ids AS (&#13;
    SELECT iss_id, &#13;
           XMLAGG(&#13;
               XMLELEMENT(&#13;
                   NAME "securityOfInterestId",&#13;
                   XMLATTRIBUTES('mizuho:systemOfInterest-id' AS "securityOfInterestIdScheme"),&#13;
                   ( select COALESCE((SELECT ISGR.GRP_NME &#13;
					FROM FT_T_ISGP ISGP, FT_T_ISGR ISGR &#13;
					WHERE ISGP.PRNT_ISS_GRP_OID= ISGR.ISS_GRP_OID AND ISGP.END_TMS IS NULL AND ISGR.END_TMS IS NULL &#13;
					AND ISGP.INSTR_ID IS NULL AND ISGP.PRT_PURP_TYP='UNDERLYG' AND ISGP.ISS_GRP_OID = ISGRMAIN.ISS_GRP_OID), grp_nme )&#13;
					from ft_t_isgr ISGRMAIN where iss_grp_oid = prnt_iss_grp_oid)&#13;
               )&#13;
           ) AS security_xml&#13;
    FROM (&#13;
select distinct iss_id, 'Corp' as cl_value, (select distinct vnd_rqstr_id from ft_t_vreq where trn_id = cast(? as varchar)) usr_id, p.prnt_iss_grp_oid &#13;
from ft_t_isid i, ft_t_issu u, ft_t_riss r, ft_t_ridf d, ft_t_isgp p, ft_t_isgr c&#13;
where 1=1&#13;
and i.ID_CTXT_TYP = 'ISIN'&#13;
and i.end_tms is null&#13;
and i.instr_id = r.instr_id&#13;
and r.end_tms is null&#13;
and r.RLD_ISS_FEAT_ID = d.RLD_ISS_FEAT_ID&#13;
and rel_typ = 'UNDERLYG'&#13;
and d.end_tms is null&#13;
and d.instr_id = u.instr_id&#13;
and d.instr_id = p.instr_id &#13;
and p.prnt_iss_grp_oid=c.iss_grp_oid&#13;
and c.grp_nme not in ('MHSA Inventory')&#13;
and u.iss_typ='CDSWP' &#13;
and u.end_tms is null&#13;
and p.end_tms is null&#13;
and p.prt_purp_typ = cast(? as varchar)&#13;
and not exists (select 'x' from ft_t_isgp g&#13;
where i.instr_id = g.instr_id&#13;
and g.prt_purp_typ = cast(? as varchar)&#13;
and g.end_tms is null&#13;
AND G.PRNT_ISS_GRP_OID = COALESCE(&#13;
(SELECT ISGR.ISS_GRP_OID&#13;
FROM FT_T_ISGP ISGP, FT_T_ISGR ISGR &#13;
WHERE ISGP.PRNT_ISS_GRP_OID= ISGR.ISS_GRP_OID AND ISGP.END_TMS IS NULL AND ISGR.END_TMS IS NULL&#13;
AND ISGP.INSTR_ID IS NULL AND ISGP.PRT_PURP_TYP='UNDERLYG' AND ISGP.ISS_GRP_OID = C.ISS_GRP_OID ), C.ISS_GRP_OID&#13;
)&#13;
)&#13;
    ) AS derived_data&#13;
    GROUP BY iss_id, cl_value, usr_id&#13;
)&#13;
SELECT XMLELEMENT(&#13;
    NAME "cmfSOIAdditionCollection",&#13;
    XMLAGG(&#13;
        XMLELEMENT(&#13;
            NAME "cmfSOIAddition",&#13;
            XMLELEMENT(&#13;
                NAME "instrumentId",&#13;
                XMLATTRIBUTES('mizuho:ISIN' AS "instrumentIdScheme"),&#13;
                iss_id&#13;
            ),&#13;
            XMLELEMENT(NAME "sourceSystemId", usr_id),&#13;
			XMLELEMENT (NAME "yellowKey", cl_value),&#13;
            XMLELEMENT(NAME "securityOfInterestIds", security_xml)&#13;
        )&#13;
    )&#13;
)&#13;
FROM (&#13;
select distinct iss_id, 'Corp' as cl_value, (select distinct vnd_rqstr_id from ft_t_vreq where trn_id = cast(? as varchar)) usr_id, p.prnt_iss_grp_oid &#13;
from ft_t_isid i, ft_t_issu u, ft_t_riss r, ft_t_ridf d, ft_t_isgp p, ft_t_isgr c&#13;
where 1=1&#13;
and i.ID_CTXT_TYP = 'ISIN'&#13;
and i.end_tms is null&#13;
and i.instr_id = r.instr_id&#13;
and r.end_tms is null&#13;
and r.RLD_ISS_FEAT_ID = d.RLD_ISS_FEAT_ID&#13;
and rel_typ = 'UNDERLYG'&#13;
and d.end_tms is null&#13;
and d.instr_id = u.instr_id&#13;
and d.instr_id = p.instr_id &#13;
and p.prnt_iss_grp_oid=c.iss_grp_oid&#13;
and c.grp_nme not in ('MHSA Inventory')&#13;
and u.iss_typ='CDSWP' &#13;
and u.end_tms is null&#13;
and p.end_tms is null&#13;
and p.prt_purp_typ = cast(? as varchar)&#13;
and not exists (select 'x' from ft_t_isgp g&#13;
where i.instr_id = g.instr_id&#13;
and g.prt_purp_typ = cast(? as varchar)&#13;
and g.end_tms is null&#13;
AND G.PRNT_ISS_GRP_OID = COALESCE(&#13;
(SELECT ISGR.ISS_GRP_OID&#13;
FROM FT_T_ISGP ISGP, FT_T_ISGR ISGR &#13;
WHERE ISGP.PRNT_ISS_GRP_OID= ISGR.ISS_GRP_OID AND ISGP.END_TMS IS NULL AND ISGR.END_TMS IS NULL&#13;
AND ISGP.INSTR_ID IS NULL AND ISGP.PRT_PURP_TYP='UNDERLYG' AND ISGP.ISS_GRP_OID = C.ISS_GRP_OID ), C.ISS_GRP_OID&#13;
)&#13;
)&#13;
) AS final_selection&#13;
JOIN security_interest_ids USING (iss_id);</objectValue>
<type>CONSTANT</type>
</item>
<item id="413" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="414">result</name>
<stringValue id="415">CDSMessageArr</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="416" type="java.util.HashSet">
<item id="417" type="com.j2fe.workflow.definition.Transition">
<name id="418">goto-next</name>
<source id="419">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="420"/>
<directJoin>false</directJoin>
<name id="421">CDS soiAddition</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="422">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="423" type="java.util.HashSet">
<item id="424" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="425">["JMSTextMessage"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="426">input["JMSTextMessage"]</name>
<stringValue id="427">UndMessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="428" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="429">["PublishAssets"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="430">input["PublishAssets"]</name>
<stringValue id="431">Publish</stringValue>
<type>VARIABLE</type>
</item>
<item id="432" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="433">["TriggeredByBBPerSecurityBatch"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="434">input["TriggeredByBBPerSecurityBatch"]</name>
<objectValue id="435" type="java.lang.String">Y</objectValue>
<type>CONSTANT</type>
</item>
<item id="436" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="437">["TriggeredByCmfSoiAdditionForUnderlyers"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="438">input["TriggeredByCmfSoiAdditionForUnderlyers"]</name>
<objectValue id="439" type="java.lang.String">N</objectValue>
<type>CONSTANT</type>
</item>
<item id="440" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="441">name</name>
<stringValue id="442">cmfSOIAddition</stringValue>
<type>CONSTANT</type>
</item>
<item id="443" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="444">["RequestTrid"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="445">output["RequestTrid"]</name>
<stringValue id="446">CDSwpRequestTransaction</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<persistentVariables id="447" type="java.util.HashSet">
<item id="448" type="java.lang.String">UndMessageArr
1000</item>
<item id="449" type="java.lang.String">CDSwpRequestTransaction
1000</item>
<item id="450" type="java.lang.String">UndMessage
1000</item>
</persistentVariables>
<sources id="451" type="java.util.HashSet">
<item id="452" type="com.j2fe.workflow.definition.Transition">
<name id="453">goto-next</name>
<source id="454">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="455"/>
<directJoin>false</directJoin>
<name id="456">Bean Shell Script (Standard)</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="457">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="458" type="java.util.HashSet">
<item id="459" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="460">statements</name>
<stringValue id="461">String Message = MessageArr[0];</stringValue>
<type>CONSTANT</type>
</item>
<item id="462" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="463">["Message"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="464">variables["Message"]</name>
<stringValue id="465">UndMessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="466" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="467">["MessageArr"]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="468">variables["MessageArr"]</name>
<stringValue id="469">UndMessageArr</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="470" type="java.util.HashSet">
<item id="471" type="com.j2fe.workflow.definition.Transition">
<name id="472">rows-found</name>
<source id="473">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="474"/>
<directJoin>false</directJoin>
<name id="475">CDS Request</name>
<nodeHandler>com.j2fe.general.activities.database.XMLQuery</nodeHandler>
<nodeHandlerClass id="476">com.j2fe.general.activities.database.XMLQuery</nodeHandlerClass>
<parameters id="477" type="java.util.HashSet">
<item id="478" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="479">database</name>
<stringValue id="480">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="481" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="482">mappedParameters["1,4"]</name>
<stringValue id="483">RequestTransaction</stringValue>
<type>VARIABLE</type>
</item>
<item id="484" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="485">mappedParameters["2,3,5,6"]</name>
<stringValue id="486">SoiPurpType</stringValue>
<type>VARIABLE</type>
</item>
<item id="487" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="488">querySQL</name>
<objectValue id="489" type="java.lang.String">WITH security_interest_ids AS (&#13;
    SELECT iss_id,&#13;
           XMLAGG(&#13;
               XMLELEMENT(&#13;
                   NAME "securityOfInterestId",&#13;
                   XMLATTRIBUTES('mizuho:systemOfInterest-id' AS "securityOfInterestIdScheme"),&#13;
                   ( select COALESCE((SELECT ISGR.GRP_NME &#13;
					FROM FT_T_ISGP ISGP, FT_T_ISGR ISGR &#13;
					WHERE ISGP.PRNT_ISS_GRP_OID= ISGR.ISS_GRP_OID AND ISGP.END_TMS IS NULL AND ISGR.END_TMS IS NULL &#13;
					AND ISGP.INSTR_ID IS NULL AND ISGP.PRT_PURP_TYP='UNDERLYG' AND ISGP.ISS_GRP_OID = ISGRMAIN.ISS_GRP_OID), grp_nme )&#13;
					from ft_t_isgr ISGRMAIN where iss_grp_oid = prnt_iss_grp_oid)&#13;
               )&#13;
           ) AS security_xml&#13;
    FROM (&#13;
select distinct iss_id, 'Curncy' as cl_value, (select distinct vnd_rqstr_id from ft_t_vreq where trn_id = cast(? as varchar)) usr_id, p.prnt_iss_grp_oid &#13;
from ft_t_isid i, ft_t_riss r, ft_t_ridf d, ft_t_isgp p, ft_t_isgr c&#13;
where 1=1&#13;
and i.ID_CTXT_TYP = 'TICKER' &#13;
and i.end_tms is null&#13;
and i.instr_id = r.instr_id&#13;
and r.end_tms is null&#13;
and r.RLD_ISS_FEAT_ID = d.RLD_ISS_FEAT_ID&#13;
and r.iss_part_rl_typ ='UNDLYING'&#13;
and rel_typ = 'CDSREFEN'&#13;
and d.end_tms is null&#13;
and d.instr_id = p.instr_id &#13;
and p.prnt_iss_grp_oid=c.iss_grp_oid&#13;
and c.grp_nme not in ('MHSA Inventory')&#13;
and p.end_tms is null&#13;
and p.prt_purp_typ = cast(? as varchar)&#13;
and not exists (select 'x' from ft_t_isgp g&#13;
where i.instr_id = g.instr_id&#13;
and g.prt_purp_typ = cast(? as varchar)&#13;
and g.end_tms is null&#13;
AND G.PRNT_ISS_GRP_OID = COALESCE(&#13;
(SELECT ISGR.ISS_GRP_OID&#13;
FROM FT_T_ISGP ISGP, FT_T_ISGR ISGR &#13;
WHERE ISGP.PRNT_ISS_GRP_OID= ISGR.ISS_GRP_OID AND ISGP.END_TMS IS NULL AND ISGR.END_TMS IS NULL&#13;
AND ISGP.INSTR_ID IS NULL AND ISGP.PRT_PURP_TYP='UNDERLYG' AND ISGP.ISS_GRP_OID = C.ISS_GRP_OID ), C.ISS_GRP_OID&#13;
)&#13;
)&#13;
    ) AS derived_data&#13;
    GROUP BY iss_id, cl_value, usr_id&#13;
)&#13;
SELECT XMLELEMENT(&#13;
    NAME "cmfSOIAdditionCollection",&#13;
    XMLAGG(&#13;
        XMLELEMENT(&#13;
            NAME "cmfSOIAddition",&#13;
            XMLELEMENT(&#13;
                NAME "instrumentId",&#13;
                XMLATTRIBUTES('mizuho:TICKER' AS "instrumentIdScheme"),&#13;
                iss_id&#13;
            ),&#13;
			XMLELEMENT (NAME "yellowKey", cl_value),&#13;
            XMLELEMENT(NAME "sourceSystemId", usr_id),&#13;
            XMLELEMENT(NAME "securityOfInterestIds", security_xml)&#13;
        )&#13;
    )&#13;
)&#13;
FROM (&#13;
select distinct iss_id, 'Curncy' as cl_value, (select distinct vnd_rqstr_id from ft_t_vreq where trn_id = cast(? as varchar)) usr_id, p.prnt_iss_grp_oid &#13;
from ft_t_isid i, ft_t_riss r, ft_t_ridf d, ft_t_isgp p, ft_t_isgr c&#13;
where 1=1&#13;
and i.ID_CTXT_TYP = 'TICKER' &#13;
and i.end_tms is null&#13;
and i.instr_id = r.instr_id&#13;
and r.end_tms is null&#13;
and r.RLD_ISS_FEAT_ID = d.RLD_ISS_FEAT_ID&#13;
and r.iss_part_rl_typ ='UNDLYING'&#13;
and rel_typ = 'CDSREFEN'&#13;
and d.end_tms is null&#13;
and d.instr_id = p.instr_id &#13;
and p.prnt_iss_grp_oid=c.iss_grp_oid&#13;
and c.grp_nme not in ('MHSA Inventory')&#13;
and p.end_tms is null&#13;
and p.prt_purp_typ = cast(? as varchar)&#13;
and not exists (select 'x' from ft_t_isgp g&#13;
where i.instr_id = g.instr_id&#13;
and g.prt_purp_typ = cast(? as varchar)&#13;
and g.end_tms is null&#13;
AND G.PRNT_ISS_GRP_OID = COALESCE(&#13;
(SELECT ISGR.ISS_GRP_OID&#13;
FROM FT_T_ISGP ISGP, FT_T_ISGR ISGR &#13;
WHERE ISGP.PRNT_ISS_GRP_OID= ISGR.ISS_GRP_OID AND ISGP.END_TMS IS NULL AND ISGR.END_TMS IS NULL&#13;
AND ISGP.INSTR_ID IS NULL AND ISGP.PRT_PURP_TYP='UNDERLYG' AND ISGP.ISS_GRP_OID = C.ISS_GRP_OID ), C.ISS_GRP_OID&#13;
)&#13;
)&#13;
) AS final_selection&#13;
JOIN security_interest_ids USING (iss_id);</objectValue>
<type>CONSTANT</type>
</item>
<item id="490" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="491">result</name>
<stringValue id="492">UndMessageArr</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="493" type="java.util.HashSet">
<item id="494" type="com.j2fe.workflow.definition.Transition">
<name id="495">goto-next</name>
<source id="496">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="497"/>
<directJoin>false</directJoin>
<name id="498">NOP</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="499">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="500" type="java.util.HashSet">
<item id="501" type="com.j2fe.workflow.definition.Transition">
<name id="502">goto-next</name>
<source id="503">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="504"/>
<directJoin>false</directJoin>
<name id="505">Underlying soiAddition</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="506">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="507" type="java.util.HashSet">
<item id="508" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="509">["JMSTextMessage"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="510">input["JMSTextMessage"]</name>
<stringValue id="511">UndMessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="512" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="513">["PublishAssets"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="514">input["PublishAssets"]</name>
<stringValue id="515">Publish</stringValue>
<type>VARIABLE</type>
</item>
<item id="516" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="517">["TriggeredByBBPerSecurityBatch"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="518">input["TriggeredByBBPerSecurityBatch"]</name>
<objectValue id="519" type="java.lang.String">Y</objectValue>
<type>CONSTANT</type>
</item>
<item id="520" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="521">["TriggeredByCmfSoiAdditionForUnderlyers"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="522">input["TriggeredByCmfSoiAdditionForUnderlyers"]</name>
<objectValue id="523" type="java.lang.String">N</objectValue>
<type>CONSTANT</type>
</item>
<item id="524" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="525">name</name>
<stringValue id="526">cmfSOIAddition</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<persistentVariables id="527" type="java.util.HashSet">
<item id="528" type="java.lang.String">UndMessageArr
1000</item>
<item id="529" type="java.lang.String">UndMessage
1000</item>
</persistentVariables>
<sources id="530" type="java.util.HashSet">
<item id="531" type="com.j2fe.workflow.definition.Transition">
<name id="532">goto-next</name>
<source id="533">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="534"/>
<directJoin>false</directJoin>
<name id="535">Bean Shell Script (Standard)</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="536">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="537" type="java.util.HashSet">
<item id="538" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="539">statements</name>
<stringValue id="540">String Message = MessageArr[0];</stringValue>
<type>CONSTANT</type>
</item>
<item id="541" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="542">["Message"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="543">variables["Message"]</name>
<stringValue id="544">UndMessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="545" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="546">["MessageArr"]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="547">variables["MessageArr"]</name>
<stringValue id="548">UndMessageArr</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="549" type="java.util.HashSet">
<item id="550" type="com.j2fe.workflow.definition.Transition">
<name id="551">rows-found</name>
<source id="552">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="553"/>
<directJoin>false</directJoin>
<name id="554">Underlying Request</name>
<nodeHandler>com.j2fe.general.activities.database.XMLQuery</nodeHandler>
<nodeHandlerClass id="555">com.j2fe.general.activities.database.XMLQuery</nodeHandlerClass>
<parameters id="556" type="java.util.HashSet">
<item id="557" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="558">database</name>
<stringValue id="559">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="560" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="561">mappedParameters["1,3,5,7"]</name>
<stringValue id="562">RequestTransaction</stringValue>
<type>VARIABLE</type>
</item>
<item id="563" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="564">mappedParameters["2,4,6,8"]</name>
<stringValue id="565">SoiPurpType</stringValue>
<type>VARIABLE</type>
</item>
<item id="566" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="567">querySQL</name>
<objectValue id="568" type="java.lang.String">WITH security_interest_ids AS (&#13;
    SELECT iss_id, id_ctxt_typ,&#13;
           XMLAGG(&#13;
               XMLELEMENT(&#13;
                   NAME "securityOfInterestId",&#13;
                   XMLATTRIBUTES('mizuho:systemOfInterest-id' AS "securityOfInterestIdScheme"),&#13;
                   ( select COALESCE((SELECT ISGR.GRP_NME &#13;
					FROM FT_T_ISGP ISGP, FT_T_ISGR ISGR &#13;
					WHERE ISGP.PRNT_ISS_GRP_OID= ISGR.ISS_GRP_OID AND ISGP.END_TMS IS NULL AND ISGR.END_TMS IS NULL &#13;
					AND ISGP.INSTR_ID IS NULL AND ISGP.PRT_PURP_TYP='UNDERLYG' AND ISGP.ISS_GRP_OID = ISGRMAIN.ISS_GRP_OID), grp_nme ) &#13;
					from ft_t_isgr ISGRMAIN where iss_grp_oid = prnt_iss_grp_oid)&#13;
               )&#13;
           ) AS security_xml&#13;
    FROM (&#13;
select distinct ctd_iss_id iss_id, ctd_id_ctxt_typ id_ctxt_typ,(select distinct vnd_rqstr_id from ft_t_vreq where trn_id = cast(? as varchar)) usr_id, prnt_iss_grp_oid&#13;
from ft_t_rist r, ft_t_isgp p, ft_t_isgr c&#13;
where ctd_iss_id is not null&#13;
and r.instr_id = p.instr_id&#13;
and prt_purp_typ = cast(? as varchar)&#13;
and p.end_tms is null&#13;
and p.prnt_iss_grp_oid=c.iss_grp_oid&#13;
and c.grp_nme not in ('MHSA Inventory')&#13;
and not exists (select 1 from ft_t_isid i, ft_t_isgp g&#13;
where i.end_tms is null&#13;
and g.end_tms is null&#13;
and i.instr_id = g.instr_id&#13;
and i.iss_id = r.ctd_iss_id&#13;
and i.id_ctxt_typ = r.ctd_id_ctxt_typ&#13;
and g.prt_purp_typ = p.prt_purp_typ&#13;
AND G.PRNT_ISS_GRP_OID = COALESCE(&#13;
(SELECT ISGR.ISS_GRP_OID&#13;
FROM FT_T_ISGP ISGP, FT_T_ISGR ISGR &#13;
WHERE ISGP.PRNT_ISS_GRP_OID= ISGR.ISS_GRP_OID AND ISGP.END_TMS IS NULL AND ISGR.END_TMS IS NULL&#13;
AND ISGP.INSTR_ID IS NULL AND ISGP.PRT_PURP_TYP='UNDERLYG' AND ISGP.ISS_GRP_OID = C.ISS_GRP_OID ), C.ISS_GRP_OID&#13;
)&#13;
)&#13;
union&#13;
select distinct stat_char_val_txt, 'BB_UNIQUE',(select distinct vnd_rqstr_id from ft_t_vreq where trn_id = cast(? as varchar)) usr_id, prnt_iss_grp_oid&#13;
from ft_t_isst s, ft_t_isgp p, ft_t_isgr c&#13;
where stat_def_id = 'UNDBBUNQ'&#13;
and s.end_tms is null&#13;
and s.instr_id = p.instr_id&#13;
and p.prt_purp_typ = cast(? as varchar)&#13;
and p.end_tms is null&#13;
and p.prnt_iss_grp_oid=c.iss_grp_oid&#13;
and c.grp_nme not in ('MHSA Inventory')&#13;
and not exists (&#13;
select 1 from ft_t_isid i, ft_t_isgp g&#13;
where i.end_tms is null&#13;
and g.end_tms is null&#13;
and i.instr_id = g.instr_id&#13;
and i.iss_id = s.stat_char_val_txt&#13;
and i.id_ctxt_typ = 'BBUNIQUE'&#13;
and g.prt_purp_typ = p.prt_purp_typ&#13;
AND G.PRNT_ISS_GRP_OID = COALESCE(&#13;
(SELECT ISGR.ISS_GRP_OID&#13;
FROM FT_T_ISGP ISGP, FT_T_ISGR ISGR &#13;
WHERE ISGP.PRNT_ISS_GRP_OID= ISGR.ISS_GRP_OID AND ISGP.END_TMS IS NULL AND ISGR.END_TMS IS NULL&#13;
AND ISGP.INSTR_ID IS NULL AND ISGP.PRT_PURP_TYP='UNDERLYG' AND ISGP.ISS_GRP_OID = C.ISS_GRP_OID ), C.ISS_GRP_OID&#13;
)&#13;
)&#13;
    ) AS derived_data&#13;
    GROUP BY iss_id, id_ctxt_typ, usr_id&#13;
)&#13;
SELECT XMLELEMENT(&#13;
    NAME "cmfSOIAdditionCollection",&#13;
    XMLAGG(&#13;
        XMLELEMENT(&#13;
            NAME "cmfSOIAddition",&#13;
            XMLELEMENT(&#13;
                NAME "instrumentId",&#13;
                XMLATTRIBUTES('mizuho:' || id_ctxt_typ AS "instrumentIdScheme"),&#13;
                iss_id&#13;
            ),&#13;
            XMLELEMENT(NAME "sourceSystemId", usr_id),&#13;
            XMLELEMENT(NAME "securityOfInterestIds", security_xml)&#13;
        )&#13;
    )&#13;
)&#13;
FROM (&#13;
    select distinct ctd_iss_id iss_id, ctd_id_ctxt_typ id_ctxt_typ,(select distinct vnd_rqstr_id from ft_t_vreq where trn_id = cast(? as varchar)) usr_id, prnt_iss_grp_oid&#13;
from ft_t_rist r, ft_t_isgp p, ft_t_isgr c&#13;
where ctd_iss_id is not null&#13;
and r.instr_id = p.instr_id&#13;
and prt_purp_typ = cast(? as varchar)&#13;
and p.end_tms is null&#13;
and p.prnt_iss_grp_oid=c.iss_grp_oid&#13;
and c.grp_nme not in ('MHSA Inventory')&#13;
and not exists (select 1 from ft_t_isid i, ft_t_isgp g&#13;
where i.end_tms is null&#13;
and g.end_tms is null&#13;
and i.instr_id = g.instr_id&#13;
and i.iss_id = r.ctd_iss_id&#13;
and i.id_ctxt_typ = r.ctd_id_ctxt_typ&#13;
and g.prt_purp_typ = p.prt_purp_typ&#13;
AND G.PRNT_ISS_GRP_OID = COALESCE(&#13;
(SELECT ISGR.ISS_GRP_OID&#13;
FROM FT_T_ISGP ISGP, FT_T_ISGR ISGR &#13;
WHERE ISGP.PRNT_ISS_GRP_OID= ISGR.ISS_GRP_OID AND ISGP.END_TMS IS NULL AND ISGR.END_TMS IS NULL&#13;
AND ISGP.INSTR_ID IS NULL AND ISGP.PRT_PURP_TYP='UNDERLYG' AND ISGP.ISS_GRP_OID = C.ISS_GRP_OID ), C.ISS_GRP_OID&#13;
)&#13;
)&#13;
union&#13;
select distinct stat_char_val_txt, 'BB_UNIQUE',(select distinct vnd_rqstr_id from ft_t_vreq where trn_id = cast(? as varchar)) usr_id, prnt_iss_grp_oid&#13;
from ft_t_isst s, ft_t_isgp p, ft_t_isgr c&#13;
where stat_def_id = 'UNDBBUNQ'&#13;
and s.end_tms is null&#13;
and s.instr_id = p.instr_id&#13;
and p.prt_purp_typ = cast(? as varchar)&#13;
and p.end_tms is null&#13;
and p.prnt_iss_grp_oid=c.iss_grp_oid&#13;
and c.grp_nme not in ('MHSA Inventory')&#13;
and not exists (&#13;
select 1 from ft_t_isid i, ft_t_isgp g&#13;
where i.end_tms is null&#13;
and g.end_tms is null&#13;
and i.instr_id = g.instr_id&#13;
and i.iss_id = s.stat_char_val_txt&#13;
and i.id_ctxt_typ = 'BBUNIQUE'&#13;
and g.prt_purp_typ = p.prt_purp_typ&#13;
AND G.PRNT_ISS_GRP_OID = COALESCE(&#13;
(SELECT ISGR.ISS_GRP_OID&#13;
FROM FT_T_ISGP ISGP, FT_T_ISGR ISGR &#13;
WHERE ISGP.PRNT_ISS_GRP_OID= ISGR.ISS_GRP_OID AND ISGP.END_TMS IS NULL AND ISGR.END_TMS IS NULL&#13;
AND ISGP.INSTR_ID IS NULL AND ISGP.PRT_PURP_TYP='UNDERLYG' AND ISGP.ISS_GRP_OID = C.ISS_GRP_OID ), C.ISS_GRP_OID&#13;
)&#13;
)&#13;
) AS final_selection&#13;
JOIN security_interest_ids USING (iss_id, id_ctxt_typ);&#13;
</objectValue>
<type>CONSTANT</type>
</item>
<item id="569" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="570">result</name>
<stringValue id="571">UndMessageArr</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="572" type="java.util.HashSet">
<item id="573" type="com.j2fe.workflow.definition.Transition">
<name id="574">goto-next</name>
<source id="575">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="576"/>
<directJoin>false</directJoin>
<name id="577">NOP</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="578">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="579" type="java.util.HashSet">
<item id="580" type="com.j2fe.workflow.definition.Transition">
<name id="581">NULL</name>
<source id="582">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="583"/>
<directJoin>false</directJoin>
<name id="584">Schedules?</name>
<nodeHandler>com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandler>
<nodeHandlerClass id="585">com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandlerClass>
<parameters id="586" type="java.util.HashSet">
<item id="587" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="588">caseItem</name>
<stringValue id="589">Scheduled</stringValue>
<type>VARIABLE</type>
</item>
<item id="590" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="591">defaultItem</name>
<stringValue id="592">NULL</stringValue>
<type>CONSTANT</type>
</item>
<item id="593" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="594">nullTransition</name>
<stringValue id="595">NULL</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="596" type="java.util.HashSet">
<item id="597" type="com.j2fe.workflow.definition.Transition">
<name id="598">goto-next</name>
<source id="599">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="600"/>
<directJoin>false</directJoin>
<name id="601">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="602">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="603" type="java.util.HashSet"/>
<targets id="604" type="java.util.HashSet">
<item idref="597" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="582"/>
</item>
</sources>
<targets id="605" type="java.util.HashSet">
<item id="606" type="com.j2fe.workflow.definition.Transition">
<name id="607">N</name>
<source idref="582"/>
<target id="608">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="609">Prepare Vendor Request #1</name>
<nodeHandler>com.thegoldensource.publishing.activity.PrepareVendorRequest</nodeHandler>
<nodeHandlerClass id="610">com.thegoldensource.publishing.activity.PrepareVendorRequest</nodeHandlerClass>
<parameters id="611" type="java.util.HashSet">
<item id="612" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="613">GSOName</name>
<stringValue id="614">GSOName</stringValue>
<type>VARIABLE</type>
</item>
<item id="615" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="616">IDCRR</name>
<stringValue id="617">IDCRR</stringValue>
<type>VARIABLE</type>
</item>
<item id="618" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="619">dataSource</name>
<stringValue id="620">DataSource</stringValue>
<type>VARIABLE</type>
</item>
<item id="621" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="622">entityXML</name>
<stringValue id="623">EntityObjectAsXML</stringValue>
<type>VARIABLE</type>
</item>
<item id="624" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="625">extractorFactory</name>
<stringValue id="626">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="627" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="628">interactiveDataServiceID</name>
<stringValue id="629">interactiveDataServiceID</stringValue>
<type>VARIABLE</type>
</item>
<item id="630" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="631">interactiveDataUniverseID</name>
<stringValue id="632">interactiveDataUniverseID</stringValue>
<type>VARIABLE</type>
</item>
<item id="633" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="634">requestFile</name>
<stringValue id="635">requestFile</stringValue>
<type>VARIABLE</type>
</item>
<item id="636" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="637">requestString</name>
<stringValue id="638">Message</stringValue>
<type>VARIABLE</type>
<variablePart id="639"/>
</item>
<item id="640" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="641">sourceofData</name>
<stringValue id="642">sourceofData</stringValue>
<type>VARIABLE</type>
</item>
<item id="643" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="644">userId</name>
<stringValue id="645">Current User</stringValue>
<type>VARIABLE</type>
</item>
<item id="646" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="647">userId</name>
<stringValue id="648">userId</stringValue>
<type>VARIABLE</type>
</item>
<item id="649" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="650">vendorChainRequestIndicator</name>
<stringValue id="651">vendorChainRequestIndicator</stringValue>
<type>VARIABLE</type>
</item>
<item id="652" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="653">vendorRequestFormat</name>
<stringValue id="654">vendorRequestFormat</stringValue>
<type>VARIABLE</type>
</item>
<item id="655" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="656">vendorServiceName</name>
<stringValue id="657">vendorServiceName</stringValue>
<type>VARIABLE</type>
</item>
<item id="658" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="659">workflowName</name>
<stringValue id="660">workflow</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="661" type="java.util.HashSet">
<item idref="606" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="662" type="java.util.HashSet">
<item id="663" type="com.j2fe.workflow.definition.Transition">
<name id="664">goto-next</name>
<source idref="608"/>
<target id="665">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="666"/>
<directJoin>false</directJoin>
<name id="667">Bean Shell Script (Standard)</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="668">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="669" type="java.util.HashSet">
<item id="670" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="671">statements</name>
<stringValue id="672">String FTP_PATH="/gold/GSFTP/files/bbg_esb_temp";</stringValue>
<type>CONSTANT</type>
</item>
<item id="673" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="674">["FTP_PATH"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="675">variables["FTP_PATH"]</name>
<stringValue id="676">FTP_PATH</stringValue>
<type>VARIABLE</type>
</item>
<item id="677" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="678">variables["userName"]</name>
<stringValue id="679">BatchDescription</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="680" type="java.util.HashSet">
<item id="681" type="com.j2fe.workflow.definition.Transition">
<name id="682">YC</name>
<source idref="582"/>
<target idref="665"/>
</item>
<item id="683" type="com.j2fe.workflow.definition.Transition">
<name id="684">goto-next</name>
<source id="685">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="686"/>
<directJoin>false</directJoin>
<name id="687">Bean Shell Script (Standard)</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="688">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="689" type="java.util.HashSet">
<item id="690" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="691">statements</name>
<stringValue id="692">String Message = MessageArr[0];</stringValue>
<type>CONSTANT</type>
</item>
<item id="693" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="694">["Message"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="695">variables["Message"]</name>
<stringValue id="696">Message</stringValue>
<type>VARIABLE</type>
</item>
<item id="697" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="698">["MessageArr"]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="699">variables["MessageArr"]</name>
<stringValue id="700">MessageArr</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="701" type="java.util.HashSet">
<item id="702" type="com.j2fe.workflow.definition.Transition">
<name id="703">rows-found</name>
<source id="704">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="705"/>
<directJoin>false</directJoin>
<name id="706">XML Select (Xor Split)</name>
<nodeHandler>com.j2fe.general.activities.database.XMLQuery</nodeHandler>
<nodeHandlerClass id="707">com.j2fe.general.activities.database.XMLQuery</nodeHandlerClass>
<parameters id="708" type="java.util.HashSet">
<item id="709" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="710">database</name>
<stringValue id="711">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="712" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="713">[0]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="714">indexedParameters[0]</name>
<stringValue id="715">MTNSoiName</stringValue>
<type>VARIABLE</type>
</item>
<item id="716" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="717">[1]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="718">indexedParameters[1]</name>
<stringValue id="719">BBBackSoiName</stringValue>
<type>VARIABLE</type>
</item>
<item id="720" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="721">[2]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="722">indexedParameters[2]</name>
<stringValue id="723">SoiPurpType</stringValue>
<type>VARIABLE</type>
</item>
<item id="724" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="725">[3]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="726">indexedParameters[3]</name>
<stringValue id="727">GRP_PURP_TYP_NoBBRequest</stringValue>
<type>VARIABLE</type>
</item>
<item id="728" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="729">[4]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="730">indexedParameters[4]</name>
<stringValue id="731">BatchNumber</stringValue>
<type>VARIABLE</type>
</item>
<item id="732" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="733">[5]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="734">indexedParameters[5]</name>
<stringValue id="735">SoiPurpType</stringValue>
<type>VARIABLE</type>
</item>
<item id="736" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="737">[6]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="738">indexedParameters[6]</name>
<stringValue id="739">SoiPurpType</stringValue>
<type>VARIABLE</type>
</item>
<item id="740" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="741">queryName</name>
<stringValue id="742">BBPerSecRequestBuilder</stringValue>
<type>CONSTANT</type>
</item>
<item id="743" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="744">result</name>
<stringValue id="745">MessageArr</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="746" type="java.util.HashSet">
<item id="747" type="com.j2fe.workflow.definition.Transition">
<name id="748">Y</name>
<source idref="582"/>
<target idref="704"/>
</item>
</sources>
<targets id="749" type="java.util.HashSet">
<item id="750" type="com.j2fe.workflow.definition.Transition">
<name id="751">nothing-found</name>
<source idref="704"/>
<target idref="575"/>
</item>
<item idref="702" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="685"/>
</item>
</sources>
<targets id="752" type="java.util.HashSet">
<item idref="683" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="665"/>
</item>
<item idref="663" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="753" type="java.util.HashSet">
<item id="754" type="com.j2fe.workflow.definition.Transition">
<name id="755">goto-next</name>
<source idref="665"/>
<target id="756">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="757"/>
<directJoin>false</directJoin>
<name id="758">Request Reply</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="759">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="760" type="java.util.HashSet">
<item id="761" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="762">["BBDownloadDirectory"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="763">input["BBDownloadDirectory"]</name>
<stringValue id="764">FTP_PATH</stringValue>
<type>VARIABLE</type>
</item>
<item id="765" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="766">["BBFileSystemType"]@com/j2fe/connector/BBFileSystemType@</UITypeHint>
<input>true</input>
<name id="767">input["BBFileSystemType"]</name>
<objectValue id="768" type="com.j2fe.connector.BBFileSystemType">SFTP</objectValue>
<type>CONSTANT</type>
</item>
<item id="769" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="770">["BBTimeout"]@java/lang/Long@</UITypeHint>
<input>true</input>
<name id="771">input["BBTimeout"]</name>
<objectValue id="772" type="java.lang.Long">5400</objectValue>
<type>CONSTANT</type>
</item>
<item id="773" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="774">["BBUploadDirectory"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="775">input["BBUploadDirectory"]</name>
<stringValue id="776">FTP_PATH</stringValue>
<type>VARIABLE</type>
</item>
<item id="777" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="778">["IDCFormat"]@com/j2fe/connector/IDCFormat@</UITypeHint>
<input>true</input>
<name id="779">input["IDCFormat"]</name>
<objectValue id="780" type="com.j2fe.connector.IDCFormat">SingelRecordLayout</objectValue>
<type>CONSTANT</type>
</item>
<item id="781" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="782">["IDCRR"]@java/lang/Boolean@</UITypeHint>
<input>true</input>
<name id="783">input["IDCRR"]</name>
<objectValue id="784" type="java.lang.Boolean">false</objectValue>
<type>CONSTANT</type>
</item>
<item id="785" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="786">["Message"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="787">input["Message"]</name>
<stringValue id="788">Message</stringValue>
<type>VARIABLE</type>
</item>
<item id="789" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="790">name</name>
<stringValue id="791">Request Reply</stringValue>
<type>CONSTANT</type>
</item>
<item id="792" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="793">["RequestTransaction"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="794">output["RequestTransaction"]</name>
<stringValue id="795">RequestTransaction</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="796" type="java.util.HashSet">
<item idref="754" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="797" type="java.util.HashSet">
<item id="798" type="com.j2fe.workflow.definition.Transition">
<name id="799">goto-next</name>
<source idref="756"/>
<target idref="575"/>
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
<item idref="580" type="com.j2fe.workflow.definition.Transition"/>
<item idref="747" type="com.j2fe.workflow.definition.Transition"/>
<item idref="681" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="575"/>
</item>
<item idref="798" type="com.j2fe.workflow.definition.Transition"/>
<item idref="750" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="800" type="java.util.HashSet">
<item idref="573" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="552"/>
</item>
</sources>
<targets id="801" type="java.util.HashSet">
<item id="802" type="com.j2fe.workflow.definition.Transition">
<name id="803">nothing-found</name>
<source idref="552"/>
<target idref="496"/>
</item>
<item idref="550" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="533"/>
</item>
</sources>
<targets id="804" type="java.util.HashSet">
<item idref="531" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="503"/>
</item>
</sources>
<targets id="805" type="java.util.HashSet">
<item idref="501" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="496"/>
</item>
<item idref="802" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="806" type="java.util.HashSet">
<item idref="494" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="473"/>
</item>
</sources>
<targets id="807" type="java.util.HashSet">
<item id="808" type="com.j2fe.workflow.definition.Transition">
<name id="809">nothing-found</name>
<source idref="473"/>
<target idref="172"/>
</item>
<item idref="471" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="454"/>
</item>
</sources>
<targets id="810" type="java.util.HashSet">
<item idref="452" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="419"/>
</item>
</sources>
<targets id="811" type="java.util.HashSet">
<item idref="417" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="396"/>
</item>
</sources>
<targets id="812" type="java.util.HashSet">
<item id="813" type="com.j2fe.workflow.definition.Transition">
<name id="814">nothing-found</name>
<source idref="396"/>
<target idref="340"/>
</item>
<item idref="394" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="377"/>
</item>
</sources>
<targets id="815" type="java.util.HashSet">
<item idref="375" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="347"/>
</item>
</sources>
<targets id="816" type="java.util.HashSet">
<item idref="345" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="340"/>
</item>
<item idref="813" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="817" type="java.util.HashSet">
<item idref="338" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="317"/>
</item>
</sources>
<targets id="818" type="java.util.HashSet">
<item id="819" type="com.j2fe.workflow.definition.Transition">
<name id="820">nothing-found</name>
<source idref="317"/>
<target idref="261"/>
</item>
<item idref="315" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="298"/>
</item>
</sources>
<targets id="821" type="java.util.HashSet">
<item idref="296" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="268"/>
</item>
</sources>
<targets id="822" type="java.util.HashSet">
<item idref="266" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="261"/>
</item>
<item idref="819" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="823" type="java.util.HashSet">
<item idref="259" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="241"/>
</item>
</sources>
<targets id="824" type="java.util.HashSet">
<item id="825" type="com.j2fe.workflow.definition.Transition">
<name id="826">nothing-found</name>
<source idref="241"/>
<target idref="172"/>
</item>
<item idref="239" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="202"/>
</item>
</sources>
<targets id="827" type="java.util.HashSet">
<item idref="200" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="179"/>
</item>
</sources>
<targets id="828" type="java.util.HashSet">
<item idref="177" type="com.j2fe.workflow.definition.Transition"/>
<item idref="236" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="172"/>
</item>
<item idref="808" type="com.j2fe.workflow.definition.Transition"/>
<item idref="825" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="829" type="java.util.HashSet">
<item idref="170" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="149"/>
</item>
</sources>
<targets id="830" type="java.util.HashSet">
<item id="831" type="com.j2fe.workflow.definition.Transition">
<name id="832">nothing-found</name>
<source idref="149"/>
<target idref="96"/>
</item>
<item idref="147" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="130"/>
</item>
</sources>
<targets id="833" type="java.util.HashSet">
<item idref="128" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="103"/>
</item>
</sources>
<targets id="834" type="java.util.HashSet">
<item idref="101" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="96"/>
</item>
<item idref="831" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="835" type="java.util.HashSet">
<item idref="94" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="76"/>
</item>
</sources>
<targets id="836" type="java.util.HashSet">
<item id="837" type="com.j2fe.workflow.definition.Transition">
<name id="838">nothing-found</name>
<source idref="76"/>
<target id="839">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="840">Automatically generated</description>
<directJoin>false</directJoin>
<name id="841">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="842">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="843" type="java.util.HashSet">
<item idref="837" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="844" type="java.util.HashSet">
<item id="845" type="com.j2fe.workflow.definition.Transition">
<name id="846">goto-next</name>
<source idref="839"/>
<target idref="10"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item idref="74" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="40"/>
</item>
</sources>
<targets id="847" type="java.util.HashSet">
<item idref="38" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="17"/>
</item>
</sources>
<targets id="848" type="java.util.HashSet">
<item idref="15" type="com.j2fe.workflow.definition.Transition"/>
<item idref="71" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="10"/>
</item>
<item idref="845" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="849" type="java.util.HashSet">
<item idref="8" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="3"/>
</item>
</sources>
<targets id="850" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="851">Custom/Dataloads</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="852">user1</lastChangeUser>
<lastUpdate id="853">2025-11-12T14:40:03.000+0000</lastUpdate>
<name id="854">BBPerSecurityBatch</name>
<nodes id="855" type="java.util.HashSet">
<item idref="103" type="com.j2fe.workflow.definition.Node"/>
<item idref="377" type="com.j2fe.workflow.definition.Node"/>
<item idref="130" type="com.j2fe.workflow.definition.Node"/>
<item idref="665" type="com.j2fe.workflow.definition.Node"/>
<item idref="685" type="com.j2fe.workflow.definition.Node"/>
<item idref="454" type="com.j2fe.workflow.definition.Node"/>
<item idref="533" type="com.j2fe.workflow.definition.Node"/>
<item idref="298" type="com.j2fe.workflow.definition.Node"/>
<item idref="473" type="com.j2fe.workflow.definition.Node"/>
<item idref="396" type="com.j2fe.workflow.definition.Node"/>
<item idref="317" type="com.j2fe.workflow.definition.Node"/>
<item idref="419" type="com.j2fe.workflow.definition.Node"/>
<item idref="149" type="com.j2fe.workflow.definition.Node"/>
<item idref="179" type="com.j2fe.workflow.definition.Node"/>
<item idref="17" type="com.j2fe.workflow.definition.Node"/>
<item idref="241" type="com.j2fe.workflow.definition.Node"/>
<item idref="76" type="com.j2fe.workflow.definition.Node"/>
<item idref="202" type="com.j2fe.workflow.definition.Node"/>
<item idref="261" type="com.j2fe.workflow.definition.Node"/>
<item idref="40" type="com.j2fe.workflow.definition.Node"/>
<item idref="96" type="com.j2fe.workflow.definition.Node"/>
<item idref="839" type="com.j2fe.workflow.definition.Node"/>
<item idref="340" type="com.j2fe.workflow.definition.Node"/>
<item idref="10" type="com.j2fe.workflow.definition.Node"/>
<item idref="172" type="com.j2fe.workflow.definition.Node"/>
<item idref="496" type="com.j2fe.workflow.definition.Node"/>
<item idref="575" type="com.j2fe.workflow.definition.Node"/>
<item idref="608" type="com.j2fe.workflow.definition.Node"/>
<item idref="212" type="com.j2fe.workflow.definition.Node"/>
<item idref="47" type="com.j2fe.workflow.definition.Node"/>
<item idref="756" type="com.j2fe.workflow.definition.Node"/>
<item idref="268" type="com.j2fe.workflow.definition.Node"/>
<item idref="347" type="com.j2fe.workflow.definition.Node"/>
<item idref="582" type="com.j2fe.workflow.definition.Node"/>
<item idref="599" type="com.j2fe.workflow.definition.Node"/>
<item idref="3" type="com.j2fe.workflow.definition.Node"/>
<item idref="552" type="com.j2fe.workflow.definition.Node"/>
<item idref="503" type="com.j2fe.workflow.definition.Node"/>
<item idref="704" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>true</optimize>
<parameter id="856" type="java.util.HashMap">
<entry>
<key id="857" type="java.lang.String">BBBackSoiName</key>
<value id="858" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="859">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="860" type="java.lang.String">BatchDescription</key>
<value id="861" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="862">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="863">Identifies the "type" of Scheduled batch that is running</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="864" type="java.lang.String">BatchNumber</key>
<value id="865" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="866">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="867">requests are broken  into different batches to allow balancing of workload</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="868" type="java.lang.String">Current User</key>
<value id="869" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="870">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="871"/>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="872" type="java.lang.String">DataSource</key>
<value id="873" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="874">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="875"/>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="876" type="java.lang.String">EntityObjectAsXML</key>
<value id="877" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="878">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="879"/>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="880" type="java.lang.String">GRP_PURP_TYP_NoBBRequest</key>
<value id="881" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="882">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="883">ISGR.GRP_PURP_TYP to filter out from BB bulk request. Value is NOBBREQ</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="884" type="java.lang.String">GSOName</key>
<value id="885" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="886">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="887"/>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="888" type="java.lang.String">MTNSoiName</key>
<value id="889" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="890">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="891" type="java.lang.String">Message</key>
<value id="892" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="893">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="894" type="java.lang.String">Publish</key>
<value id="895" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="896">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="897" type="java.lang.String">Scheduled</key>
<value id="898" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="899">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="900" type="java.lang.String">SoiPurpType</key>
<value id="901" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="902">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
</parameter>
<permissions id="903" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>false</purgeAtEnd>
<retries>0</retries>
<startNode idref="599"/>
<status>RELEASED</status>
<variables id="904" type="java.util.HashMap">
<entry>
<key id="905" type="java.lang.String">BBBackSoiName</key>
<value id="906" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="907">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="908" type="java.lang.String">BBBACK</value>
</value>
</entry>
<entry>
<key id="909" type="java.lang.String">BatchDescription</key>
<value id="910" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="911">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="912">Identifies the "type" of Scheduled batch that is running</description>
<persistent>false</persistent>
<value id="913" type="java.lang.String">UI</value>
</value>
</entry>
<entry>
<key id="914" type="java.lang.String">BatchNumber</key>
<value id="915" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="916">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="917">requests are broken  into different batches to allow balancing of workload</description>
<persistent>false</persistent>
<value id="918" type="java.lang.String">9</value>
</value>
</entry>
<entry>
<key id="919" type="java.lang.String">Counter</key>
<value id="920" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="921">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<persistent>false</persistent>
<value id="922" type="java.lang.Integer">0</value>
</value>
</entry>
<entry>
<key id="923" type="java.lang.String">Current User</key>
<value id="924" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="925">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="926"/>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="927" type="java.lang.String">DataSource</key>
<value id="928" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="929">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="930"/>
<persistent>false</persistent>
<value id="931" type="java.lang.String">jdbc/GSDM-1</value>
</value>
</entry>
<entry>
<key id="932" type="java.lang.String">EntityObjectAsXML</key>
<value id="933" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="934">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="935"/>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="936" type="java.lang.String">GRP_PURP_TYP_NoBBRequest</key>
<value id="937" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="938">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="939">ISGR.GRP_PURP_TYP to filter out from BB bulk request. Value is NOBBREQ</description>
<persistent>false</persistent>
<value id="940" type="java.lang.String">NOBBREQ</value>
</value>
</entry>
<entry>
<key id="941" type="java.lang.String">GSOName</key>
<value id="942" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="943">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="944"/>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="945" type="java.lang.String">MTNSoiName</key>
<value id="946" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="947">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="948" type="java.lang.String">MTN</value>
</value>
</entry>
<entry>
<key id="949" type="java.lang.String">Message</key>
<value id="950" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="951">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="952" type="java.lang.String">Publish</key>
<value id="953" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="954">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="955" type="java.lang.String">N</value>
</value>
</entry>
<entry>
<key id="956" type="java.lang.String">RequestTransaction</key>
<value id="957" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="958">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="959"/>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="960" type="java.lang.String">Scheduled</key>
<value id="961" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="962">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="963" type="java.lang.String">N</value>
</value>
</entry>
<entry>
<key id="964" type="java.lang.String">SoiPurpType</key>
<value id="965" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="966">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="967" type="java.lang.String">INTEREST</value>
</value>
</entry>
</variables>
<version>43</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
