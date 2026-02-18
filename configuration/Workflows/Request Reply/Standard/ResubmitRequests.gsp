<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.03">
<package-comment/>
<businessobject displayString="14 - V10" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>true</alwaysPersist>
<clustered>true</clustered>
<comment id="1">V10</comment>
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
<name id="16">false</name>
<source id="17">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="18"/>
<directJoin>false</directJoin>
<name id="19">cmfSOIAddition Elements ?</name>
<nodeHandler>com.j2fe.workflow.handler.impl.XPathXorSplit</nodeHandler>
<nodeHandlerClass id="20">com.j2fe.workflow.handler.impl.XPathXorSplit</nodeHandlerClass>
<parameters id="21" type="java.util.HashSet">
<item id="22" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="23">inputText</name>
<stringValue id="24">UnderlyingMessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="25" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="26">xPath</name>
<stringValue id="27">//cmfSOIAddition</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="28" type="java.util.HashSet">
<item id="29" type="com.j2fe.workflow.definition.Transition">
<name id="30">rows-found</name>
<source id="31">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="32"/>
<directJoin>false</directJoin>
<name id="33">CDS Request</name>
<nodeHandler>com.j2fe.general.activities.database.XMLQuery</nodeHandler>
<nodeHandlerClass id="34">com.j2fe.general.activities.database.XMLQuery</nodeHandlerClass>
<parameters id="35" type="java.util.HashSet">
<item id="36" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="37">database</name>
<stringValue id="38">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="39" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="40">mappedParameters["1,6,11"]</name>
<stringValue id="41">underlyerSOIName</stringValue>
<type>VARIABLE</type>
</item>
<item id="42" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="43">mappedParameters["2,3,7,8"]</name>
<stringValue id="44">vRequestTransaction</stringValue>
<type>VARIABLE</type>
</item>
<item id="45" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="46">mappedParameters["4,9"]</name>
<stringValue id="47">vEventJobID</stringValue>
<type>VARIABLE</type>
</item>
<item id="48" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="49">mappedParameters["5,10"]</name>
<stringValue id="50">SoiPurpType</stringValue>
<type>VARIABLE</type>
</item>
<item id="51" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="52">querySQL</name>
<objectValue id="53" type="java.lang.String">WITH security_interest_ids AS (&#13;
    SELECT iss_id,&#13;
           XMLAGG(&#13;
               XMLELEMENT(&#13;
                   NAME "securityOfInterestId",&#13;
                   XMLATTRIBUTES('mizuho:systemOfInterest-id' AS "securityOfInterestIdScheme"),&#13;
                   CAST(? as VARCHAR)&#13;
               )&#13;
           ) AS security_xml&#13;
    FROM (&#13;
        select distinct ticker.iss_id, 'Curncy' as cl_value, (select COALESCE(max(vnd_rqstr_id),'GS') from ft_t_vreq where trn_id = CAST(? as VARCHAR) limit 1) usr_id, isgp.prnt_iss_grp_oid &#13;
from ft_t_riss riss, ft_t_ridf ridf, ft_t_isgp isgp, ft_t_isid ticker&#13;
,(SELECT isid.* FROM ft_t_vreq vreq, ft_t_isid isid where vreq.trn_id=CAST(? as VARCHAR) and replace(vreq.VND_RQST_XREF_ID_CTXT_TYP,'_','')=isid.ID_CTXT_TYP and vreq.VND_RQST_XREF_ID=isid.iss_id AND isid.end_tms IS NULL&#13;
union&#13;
SELECT isid.* FROM ft_t_isid isid where (ID_CTXT_TYP,ISS_ID) in (&#13;
SELECT case when (STRING_TO_ARRAY(event_value, ','))[1] = 'BB_UNIQUE' then 'BBUNIQUE' when (STRING_TO_ARRAY(event_value, ','))[1] = 'BB_GLOBAL' then 'BBGLOBAL' else (STRING_TO_ARRAY(event_value, ','))[1] end&#13;
,(STRING_TO_ARRAY(event_value, ','))[2] id_ctxt_typ_iss_id FROM MHI_TB_EVENTLOG where EVENT_JOB_ID=CAST(? as VARCHAR) and event_desc = 'INSTRUMENT EXISTS'&#13;
) AND end_tms IS NULL) isid_vreq&#13;
where 1=1&#13;
and ticker.ID_CTXT_TYP = 'TICKER'&#13;
and ticker.end_tms is null&#13;
and ticker.instr_id = riss.instr_id&#13;
and riss.end_tms is null&#13;
and riss.RLD_ISS_FEAT_ID = ridf.RLD_ISS_FEAT_ID&#13;
and riss.iss_part_rl_typ ='UNDLYING'&#13;
and ridf.rel_typ = 'CDSREFEN'&#13;
and ridf.end_tms is null&#13;
and ridf.instr_id = isid_vreq.instr_id&#13;
and isgp.instr_id = isid_vreq.instr_id&#13;
and isgp.end_tms is null&#13;
and isgp.prt_purp_typ = CAST(? as VARCHAR)&#13;
and not exists (&#13;
select 1 from ft_t_isgp g&#13;
where 1=1&#13;
and g.end_tms is null&#13;
and ticker.instr_id = g.instr_id&#13;
and g.prnt_iss_grp_oid = (select iss_grp_oid from ft_t_isgr where grp_nme=CAST(? as VARCHAR) AND end_tms IS NULL)&#13;
)&#13;
    ) AS derived_data&#13;
    GROUP BY iss_id&#13;
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
			XMLELEMENT(NAME "yellowKey", cl_value),&#13;
            XMLELEMENT(NAME "sourceSystemId", usr_id),&#13;
            XMLELEMENT(NAME "securityOfInterestIds", security_xml)&#13;
        )&#13;
    )&#13;
)&#13;
FROM (&#13;
    select distinct ticker.iss_id, 'Curncy' as cl_value, (select COALESCE(max(vnd_rqstr_id),'GS') from ft_t_vreq where trn_id = CAST(? as VARCHAR) limit 1) usr_id, isgp.prnt_iss_grp_oid &#13;
from ft_t_riss riss, ft_t_ridf ridf, ft_t_isgp isgp, ft_t_isid ticker&#13;
,(SELECT isid.* FROM ft_t_vreq vreq, ft_t_isid isid where vreq.trn_id=CAST(? as VARCHAR) and replace(vreq.VND_RQST_XREF_ID_CTXT_TYP,'_','')=isid.ID_CTXT_TYP and vreq.VND_RQST_XREF_ID=isid.iss_id AND isid.end_tms IS NULL&#13;
union&#13;
SELECT isid.* FROM ft_t_isid isid where (ID_CTXT_TYP,ISS_ID) in (&#13;
SELECT case when (STRING_TO_ARRAY(event_value, ','))[1] = 'BB_UNIQUE' then 'BBUNIQUE' when (STRING_TO_ARRAY(event_value, ','))[1] = 'BB_GLOBAL' then 'BBGLOBAL' else (STRING_TO_ARRAY(event_value, ','))[1] end&#13;
,(STRING_TO_ARRAY(event_value, ','))[2] id_ctxt_typ_iss_id FROM MHI_TB_EVENTLOG where EVENT_JOB_ID=CAST(? as VARCHAR) and event_desc = 'INSTRUMENT EXISTS'&#13;
) AND end_tms IS NULL) isid_vreq&#13;
where 1=1&#13;
and ticker.ID_CTXT_TYP = 'TICKER'&#13;
and ticker.end_tms is null&#13;
and ticker.instr_id = riss.instr_id&#13;
and riss.end_tms is null&#13;
and riss.RLD_ISS_FEAT_ID = ridf.RLD_ISS_FEAT_ID&#13;
and riss.iss_part_rl_typ ='UNDLYING'&#13;
and ridf.rel_typ = 'CDSREFEN'&#13;
and ridf.end_tms is null&#13;
and ridf.instr_id = isid_vreq.instr_id&#13;
and isgp.instr_id = isid_vreq.instr_id&#13;
and isgp.end_tms is null&#13;
and isgp.prt_purp_typ = CAST(? as VARCHAR)&#13;
and not exists (&#13;
select 1 from ft_t_isgp g&#13;
where 1=1&#13;
and g.end_tms is null&#13;
and ticker.instr_id = g.instr_id&#13;
and g.prnt_iss_grp_oid = (select iss_grp_oid from ft_t_isgr where grp_nme=CAST(? as VARCHAR) AND end_tms IS NULL)&#13;
)&#13;
) AS final_selection&#13;
JOIN security_interest_ids USING (iss_id)</objectValue>
<type>CONSTANT</type>
</item>
<item id="54" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="55">result[0]</name>
<stringValue id="56">UnderlyingMessage</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="57" type="java.util.HashSet">
<item id="58" type="com.j2fe.workflow.definition.Transition">
<name id="59">goto-next</name>
<source id="60">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="61"/>
<directJoin>false</directJoin>
<name id="62">merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="63">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="64" type="java.util.HashSet">
<item id="65" type="com.j2fe.workflow.definition.Transition">
<name id="66">false</name>
<source id="67">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="68"/>
<directJoin>false</directJoin>
<name id="69">cmfSOIAddition Elements ?</name>
<nodeHandler>com.j2fe.workflow.handler.impl.XPathXorSplit</nodeHandler>
<nodeHandlerClass id="70">com.j2fe.workflow.handler.impl.XPathXorSplit</nodeHandlerClass>
<parameters id="71" type="java.util.HashSet">
<item id="72" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="73">inputText</name>
<stringValue id="74">UnderlyingMessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="75" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="76">xPath</name>
<stringValue id="77">//cmfSOIAddition</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="78" type="java.util.HashSet">
<item id="79" type="com.j2fe.workflow.definition.Transition">
<name id="80">rows-found</name>
<source id="81">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="82"/>
<directJoin>false</directJoin>
<name id="83">Generic Underlyers Request</name>
<nodeHandler>com.j2fe.general.activities.database.XMLQuery</nodeHandler>
<nodeHandlerClass id="84">com.j2fe.general.activities.database.XMLQuery</nodeHandlerClass>
<parameters id="85" type="java.util.HashSet">
<item id="86" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="87">database</name>
<stringValue id="88">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="89" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="90">mappedParameters["1,6,11,16,21,26,31"]</name>
<stringValue id="91">underlyerSOIName</stringValue>
<type>VARIABLE</type>
</item>
<item id="92" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="93">mappedParameters["2,3,7,8,12,13,17,18,22,23,27,28"]</name>
<stringValue id="94">vRequestTransaction</stringValue>
<type>VARIABLE</type>
</item>
<item id="95" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="96">mappedParameters["4,9,14,19,24,29"]</name>
<stringValue id="97">vEventJobID</stringValue>
<type>VARIABLE</type>
</item>
<item id="98" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="99">mappedParameters["5,10,15,20,25,30"]</name>
<stringValue id="100">SoiPurpType</stringValue>
<type>VARIABLE</type>
</item>
<item id="101" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="102">querySQL</name>
<objectValue id="103" type="java.lang.String">WITH security_interest_ids AS (&#13;
    SELECT iss_id, id_ctxt_typ,&#13;
           XMLAGG(&#13;
               XMLELEMENT(&#13;
                   NAME "securityOfInterestId",&#13;
                   XMLATTRIBUTES('mizuho:systemOfInterest-id' AS "securityOfInterestIdScheme"),&#13;
                   cast(? as varchar)&#13;
               )&#13;
           ) AS security_xml&#13;
    FROM (&#13;
        select distinct ctd_iss_id iss_id, ctd_id_ctxt_typ id_ctxt_typ,(SELECT COALESCE(MAX(vnd_rqstr_id), 'GS') FROM ft_t_vreq WHERE trn_id = cast(? as varchar) LIMIT 1) usr_id&#13;
from ft_t_rist r, ft_t_isgp p&#13;
,(SELECT isid.* FROM ft_t_vreq vreq, ft_t_isid isid where vreq.trn_id=cast(? as varchar) and replace(vreq.VND_RQST_XREF_ID_CTXT_TYP,'_','') =isid.ID_CTXT_TYP and vreq.VND_RQST_XREF_ID=isid.iss_id AND isid.end_tms IS NULL&#13;
union&#13;
SELECT isid.* FROM ft_t_isid isid where (ID_CTXT_TYP,ISS_ID) in (SELECT case when (STRING_TO_ARRAY(event_value, ','))[1] = 'BB_UNIQUE' then 'BBUNIQUE' when (STRING_TO_ARRAY(event_value, ','))[1] = 'BB_GLOBAL' then 'BBGLOBAL' else (STRING_TO_ARRAY(event_value, ','))[1] end&#13;
,(STRING_TO_ARRAY(event_value, ','))[2] id_ctxt_typ_iss_id FROM MHI_TB_EVENTLOG where EVENT_JOB_ID=cast(? as varchar) and event_desc = 'INSTRUMENT EXISTS') AND end_tms IS NULL) vreq_isid&#13;
where ctd_iss_id is not null&#13;
and r.instr_id = vreq_isid.instr_id&#13;
and vreq_isid.instr_id = p.instr_id&#13;
and prt_purp_typ = cast(? as varchar)&#13;
and p.end_tms is null&#13;
and not exists (&#13;
select 1 from ft_t_isid i, ft_t_isgp g&#13;
where i.end_tms is null&#13;
and g.end_tms is null&#13;
and i.instr_id = g.instr_id&#13;
and i.iss_id = r.ctd_iss_id&#13;
and i.id_ctxt_typ = r.ctd_id_ctxt_typ&#13;
and g.prt_purp_typ = p.prt_purp_typ&#13;
and g.prnt_iss_grp_oid = (select iss_grp_oid from ft_t_isgr where grp_nme=cast(? as varchar) AND end_tms IS NULL)&#13;
)&#13;
UNION&#13;
select distinct stat_char_val_txt, 'BB_UNIQUE',(select COALESCE(max(vnd_rqstr_id),'GS') from ft_t_vreq where trn_id = cast(? as varchar) limit 1) usr_id&#13;
from ft_t_isst s, ft_t_isgp p&#13;
,(SELECT isid.* FROM ft_t_vreq vreq, ft_t_isid isid where vreq.trn_id=cast(? as varchar) and replace(vreq.VND_RQST_XREF_ID_CTXT_TYP,'_','')=isid.ID_CTXT_TYP and vreq.VND_RQST_XREF_ID=isid.iss_id AND isid.end_tms IS NULL&#13;
union&#13;
SELECT isid.* FROM ft_t_isid isid where (ID_CTXT_TYP,ISS_ID) in (SELECT case when (STRING_TO_ARRAY(event_value, ','))[1] = 'BB_UNIQUE' then 'BBUNIQUE' when (STRING_TO_ARRAY(event_value, ','))[1] = 'BB_GLOBAL' then 'BBGLOBAL' else (STRING_TO_ARRAY(event_value, ','))[1] end&#13;
,(STRING_TO_ARRAY(event_value, ','))[2] id_ctxt_typ_iss_id FROM MHI_TB_EVENTLOG where EVENT_JOB_ID=cast(? as varchar) and event_desc = 'INSTRUMENT EXISTS') AND end_tms IS NULL) vreq_isid&#13;
where stat_def_id = 'UNDBBUNQ'&#13;
and s.end_tms is null&#13;
and s.instr_id = vreq_isid.instr_id&#13;
and vreq_isid.instr_id = p.instr_id&#13;
and p.prt_purp_typ = cast(? as varchar)&#13;
and p.end_tms is null&#13;
and not exists (&#13;
select 1 from ft_t_isid i, ft_t_isgp g&#13;
where i.end_tms is null&#13;
and g.end_tms is null&#13;
and i.instr_id = g.instr_id&#13;
and i.iss_id = s.stat_char_val_txt&#13;
and i.id_ctxt_typ = 'BBUNIQUE'&#13;
and g.prt_purp_typ = p.prt_purp_typ&#13;
and g.prnt_iss_grp_oid = (select iss_grp_oid from ft_t_isgr where grp_nme=cast(? as varchar) AND end_tms IS NULL)&#13;
)&#13;
UNION&#13;
SELECT distinct i.iss_id, 'BB_UNIQUE',(select COALESCE(max(vnd_rqstr_id),'GS') from ft_t_vreq where trn_id = cast(? as varchar) limit 1) usr_id&#13;
FROM ft_t_ridf ridf, ft_t_riss riss, ft_t_isgp isgp, ft_t_isid i&#13;
,(SELECT isid.* FROM ft_t_vreq vreq, ft_t_isid isid where vreq.trn_id=cast(? as varchar) and replace(vreq.VND_RQST_XREF_ID_CTXT_TYP,'_','')=isid.ID_CTXT_TYP and vreq.VND_RQST_XREF_ID=isid.iss_id AND isid.end_tms IS NULL&#13;
union&#13;
SELECT isid.* FROM ft_t_isid isid where (ID_CTXT_TYP,ISS_ID) in (SELECT case when (STRING_TO_ARRAY(event_value, ','))[1] = 'BB_UNIQUE' then 'BBUNIQUE' when (STRING_TO_ARRAY(event_value, ','))[1] = 'BB_GLOBAL' then 'BBGLOBAL' else (STRING_TO_ARRAY(event_value, ','))[1] end&#13;
,(STRING_TO_ARRAY(event_value, ','))[2] id_ctxt_typ_iss_id FROM MHI_TB_EVENTLOG where EVENT_JOB_ID=cast(? as varchar) and event_desc = 'INSTRUMENT EXISTS') AND end_tms IS NULL) vreq_isid&#13;
where ridf.instr_id = vreq_isid.instr_id&#13;
and vreq_isid.instr_id = isgp.instr_id&#13;
and isgp.prt_purp_typ = cast(? as varchar)&#13;
and isgp.end_tms is null&#13;
and ridf.RLD_ISS_FEAT_ID = riss.RLD_ISS_FEAT_ID&#13;
AND ridf.end_tms IS NULL&#13;
AND riss.end_tms IS NULL&#13;
and riss.instr_id = i.instr_id&#13;
and i.id_ctxt_typ = 'BBUNIQUE'&#13;
AND i.end_tms IS NULL&#13;
and not exists (&#13;
select 1 from ft_t_isgp g&#13;
where 1=1&#13;
and g.end_tms is null&#13;
and riss.instr_id = g.instr_id&#13;
and g.prnt_iss_grp_oid = (select iss_grp_oid from ft_t_isgr where grp_nme=cast(? as varchar) AND end_tms IS NULL)&#13;
)&#13;
    ) AS derived_data&#13;
    GROUP BY iss_id, id_ctxt_typ&#13;
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
    select distinct ctd_iss_id iss_id, ctd_id_ctxt_typ id_ctxt_typ,(SELECT COALESCE(MAX(vnd_rqstr_id), 'GS') FROM ft_t_vreq WHERE trn_id = cast(? as varchar) LIMIT 1) usr_id&#13;
from ft_t_rist r, ft_t_isgp p&#13;
,(SELECT isid.* FROM ft_t_vreq vreq, ft_t_isid isid where vreq.trn_id=cast(? as varchar) and replace(vreq.VND_RQST_XREF_ID_CTXT_TYP,'_','') =isid.ID_CTXT_TYP and vreq.VND_RQST_XREF_ID=isid.iss_id AND isid.end_tms IS NULL&#13;
union&#13;
SELECT isid.* FROM ft_t_isid isid where (ID_CTXT_TYP,ISS_ID) in (SELECT case when (STRING_TO_ARRAY(event_value, ','))[1] = 'BB_UNIQUE' then 'BBUNIQUE' when (STRING_TO_ARRAY(event_value, ','))[1] = 'BB_GLOBAL' then 'BBGLOBAL' else (STRING_TO_ARRAY(event_value, ','))[1] end&#13;
,(STRING_TO_ARRAY(event_value, ','))[2] id_ctxt_typ_iss_id FROM MHI_TB_EVENTLOG where EVENT_JOB_ID=cast(? as varchar) and event_desc = 'INSTRUMENT EXISTS') AND end_tms IS NULL) vreq_isid&#13;
where ctd_iss_id is not null&#13;
and r.instr_id = vreq_isid.instr_id&#13;
and vreq_isid.instr_id = p.instr_id&#13;
and prt_purp_typ = cast(? as varchar)&#13;
and p.end_tms is null&#13;
and not exists (&#13;
select 1 from ft_t_isid i, ft_t_isgp g&#13;
where i.end_tms is null&#13;
and g.end_tms is null&#13;
and i.instr_id = g.instr_id&#13;
and i.iss_id = r.ctd_iss_id&#13;
and i.id_ctxt_typ = r.ctd_id_ctxt_typ&#13;
and g.prt_purp_typ = p.prt_purp_typ&#13;
and g.prnt_iss_grp_oid = (select iss_grp_oid from ft_t_isgr where grp_nme=cast(? as varchar) AND end_tms IS NULL)&#13;
)&#13;
UNION&#13;
select distinct stat_char_val_txt, 'BB_UNIQUE',(select COALESCE(max(vnd_rqstr_id),'GS') from ft_t_vreq where trn_id = cast(? as varchar) limit 1) usr_id&#13;
from ft_t_isst s, ft_t_isgp p&#13;
,(SELECT isid.* FROM ft_t_vreq vreq, ft_t_isid isid where vreq.trn_id=cast(? as varchar) and replace(vreq.VND_RQST_XREF_ID_CTXT_TYP,'_','')=isid.ID_CTXT_TYP and vreq.VND_RQST_XREF_ID=isid.iss_id AND isid.end_tms IS NULL&#13;
union&#13;
SELECT isid.* FROM ft_t_isid isid where (ID_CTXT_TYP,ISS_ID) in (SELECT case when (STRING_TO_ARRAY(event_value, ','))[1] = 'BB_UNIQUE' then 'BBUNIQUE' when (STRING_TO_ARRAY(event_value, ','))[1] = 'BB_GLOBAL' then 'BBGLOBAL' else (STRING_TO_ARRAY(event_value, ','))[1] end&#13;
,(STRING_TO_ARRAY(event_value, ','))[2] id_ctxt_typ_iss_id FROM MHI_TB_EVENTLOG where EVENT_JOB_ID=cast(? as varchar) and event_desc = 'INSTRUMENT EXISTS') AND end_tms IS NULL) vreq_isid&#13;
where stat_def_id = 'UNDBBUNQ'&#13;
and s.end_tms is null&#13;
and s.instr_id = vreq_isid.instr_id&#13;
and vreq_isid.instr_id = p.instr_id&#13;
and p.prt_purp_typ = cast(? as varchar)&#13;
and p.end_tms is null&#13;
and not exists (&#13;
select 1 from ft_t_isid i, ft_t_isgp g&#13;
where i.end_tms is null&#13;
and g.end_tms is null&#13;
and i.instr_id = g.instr_id&#13;
and i.iss_id = s.stat_char_val_txt&#13;
and i.id_ctxt_typ = 'BBUNIQUE'&#13;
and g.prt_purp_typ = p.prt_purp_typ&#13;
and g.prnt_iss_grp_oid = (select iss_grp_oid from ft_t_isgr where grp_nme=cast(? as varchar) AND end_tms IS NULL)&#13;
)&#13;
UNION&#13;
SELECT distinct i.iss_id, 'BB_UNIQUE',(select COALESCE(max(vnd_rqstr_id),'GS') from ft_t_vreq where trn_id = cast(? as varchar) limit 1) usr_id&#13;
FROM ft_t_ridf ridf, ft_t_riss riss, ft_t_isgp isgp, ft_t_isid i&#13;
,(SELECT isid.* FROM ft_t_vreq vreq, ft_t_isid isid where vreq.trn_id=cast(? as varchar) and replace(vreq.VND_RQST_XREF_ID_CTXT_TYP,'_','')=isid.ID_CTXT_TYP and vreq.VND_RQST_XREF_ID=isid.iss_id AND isid.end_tms IS NULL&#13;
union&#13;
SELECT isid.* FROM ft_t_isid isid where (ID_CTXT_TYP,ISS_ID) in (SELECT case when (STRING_TO_ARRAY(event_value, ','))[1] = 'BB_UNIQUE' then 'BBUNIQUE' when (STRING_TO_ARRAY(event_value, ','))[1] = 'BB_GLOBAL' then 'BBGLOBAL' else (STRING_TO_ARRAY(event_value, ','))[1] end&#13;
,(STRING_TO_ARRAY(event_value, ','))[2] id_ctxt_typ_iss_id FROM MHI_TB_EVENTLOG where EVENT_JOB_ID=cast(? as varchar) and event_desc = 'INSTRUMENT EXISTS') AND end_tms IS NULL) vreq_isid&#13;
where ridf.instr_id = vreq_isid.instr_id&#13;
and vreq_isid.instr_id = isgp.instr_id&#13;
and isgp.prt_purp_typ = cast(? as varchar)&#13;
and isgp.end_tms is null&#13;
and ridf.RLD_ISS_FEAT_ID = riss.RLD_ISS_FEAT_ID&#13;
AND ridf.end_tms IS NULL&#13;
AND riss.end_tms IS NULL&#13;
and riss.instr_id = i.instr_id&#13;
and i.id_ctxt_typ = 'BBUNIQUE'&#13;
AND i.end_tms IS NULL&#13;
and not exists (&#13;
select 1 from ft_t_isgp g&#13;
where 1=1&#13;
and g.end_tms is null&#13;
and riss.instr_id = g.instr_id&#13;
and g.prnt_iss_grp_oid = (select iss_grp_oid from ft_t_isgr where grp_nme=cast(? as varchar) AND end_tms IS NULL)&#13;
)&#13;
) AS final_selection&#13;
JOIN security_interest_ids USING (iss_id, id_ctxt_typ)</objectValue>
<type>CONSTANT</type>
</item>
<item id="104" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="105">result[0]</name>
<stringValue id="106">UnderlyingMessage</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="107" type="java.util.HashSet">
<item id="108" type="com.j2fe.workflow.definition.Transition">
<name id="109">goto-next</name>
<source id="110">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="111"/>
<directJoin>false</directJoin>
<name id="112">Derive Underlying SOI Name</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="113">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="114" type="java.util.HashSet">
<item id="115" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="116">database</name>
<stringValue id="117">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="118" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="119">[0]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="120">firstColumnsResult[0]</name>
<stringValue id="121">underlyerSOIName</stringValue>
<type>VARIABLE</type>
</item>
<item id="122" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="123">indexedParameters[0]</name>
<stringValue id="124">SOIName</stringValue>
<type>VARIABLE</type>
</item>
<item id="125" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="126">querySQL</name>
<stringValue id="127">SELECT ISGR.GRP_NME &#13;
FROM FT_T_ISGR ISGRMAIN,  FT_T_ISGP ISGP, FT_T_ISGR ISGR &#13;
WHERE ISGP.PRNT_ISS_GRP_OID= ISGR.ISS_GRP_OID AND ISGP.END_TMS IS NULL AND ISGR.END_TMS IS NULL &#13;
    AND ISGP.INSTR_ID IS NULL AND ISGP.PRT_PURP_TYP='UNDERLYG' AND ISGP.ISS_GRP_OID = ISGRMAIN.ISS_GRP_OID AND ISGRMAIN.END_TMS IS NULL &#13;
    AND ISGRMAIN.GRP_NME =  ?</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="128" type="java.util.HashSet">
<item id="129" type="com.j2fe.workflow.definition.Transition">
<name id="130">goto-next</name>
<source id="131">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="132"/>
<directJoin>false</directJoin>
<name id="133">Derive Underlying SOI Name</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="134">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="135" type="java.util.HashSet">
<item id="136" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="137">statements</name>
<objectValue id="138" type="java.lang.String">String underlyerSOIName = "NULL";&#13;
&#13;
if ( soiName.equals("MHI MX Inventory") || soiName.equals("MHI Curve Inventory") || soiName.equals("MHI Distressed Assets Inventory") || soiName.equals("MHI Manual Inventory") ) {&#13;
	underlyerSOIName = "MHI Underlying Asset Inventory";&#13;
} else if ( soiName.equals("MHEU MX Inventory") || soiName.equals("MHEU Curve Inventory") || soiName.equals("MHEU Distressed Assets Inventory") || soiName.equals("MHEU Manual Inventory") ) {&#13;
	underlyerSOIName = "MHEU Underlying Asset Inventory";&#13;
} else if ( soiName.equals("MHSS MX Inventory") || soiName.equals("MHSS Curve Inventory") || soiName.equals("MHSS Distressed Assets Inventory") || soiName.equals("MHSS Manual Inventory") ) {&#13;
	underlyerSOIName = "MHSS Underlying Asset Inventory";&#13;
} else if ( soiName.equals("MHBK MX Inventory") || soiName.equals("MHBK Curve Inventory") || soiName.equals("MHBK Distressed Assets Inventory") || soiName.equals("MHBK Manual Inventory") ) {&#13;
	underlyerSOIName = "MHBK Underlying Asset Inventory";&#13;
} else if ( soiName.equals("MBE MX Inventory") || soiName.equals("MBE Curve Inventory") || soiName.equals("MBE Distressed Assets Inventory") || soiName.equals("MBE Manual Inventory") ) {&#13;
	underlyerSOIName = "MBE Underlying Asset Inventory";&#13;
}</objectValue>
<type>CONSTANT</type>
</item>
<item id="139" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="140">variables["soiName"]</name>
<stringValue id="141">SOIName</stringValue>
<type>VARIABLE</type>
</item>
<item id="142" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="143">variables["underlyerSOIName"]</name>
<stringValue id="144">oldunderlyerSOIName</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="145" type="java.util.HashSet">
<item id="146" type="com.j2fe.workflow.definition.Transition">
<name id="147">goto-next</name>
<source id="148">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="149"/>
<directJoin>false</directJoin>
<name id="150">Initialize Global Variables</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="151">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="152" type="java.util.HashSet">
<item id="153" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="154">statements</name>
<stringValue id="155">if ((vEventJobID == null) || ("".equals(vEventJobID))) {&#13;
	vEventJobID = "NULL";&#13;
}&#13;
&#13;
if ((vRqstTrnID == null) || ("".equals(vRqstTrnID))) {&#13;
	vRqstTrnID = "NULL";&#13;
}&#13;
&#13;
</stringValue>
<type>CONSTANT</type>
</item>
<item id="156" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="157">variables["vEventJobID"]</name>
<stringValue id="158">EventJobID</stringValue>
<type>VARIABLE</type>
</item>
<item id="159" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="160">variables["vEventJobID"]</name>
<stringValue id="161">vEventJobID</stringValue>
<type>VARIABLE</type>
</item>
<item id="162" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="163">variables["vRqstTrnID"]</name>
<stringValue id="164">RequestTransaction</stringValue>
<type>VARIABLE</type>
</item>
<item id="165" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="166">variables["vRqstTrnID"]</name>
<stringValue id="167">vRequestTransaction</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="168" type="java.util.HashSet">
<item id="169" type="com.j2fe.workflow.definition.Transition">
<name id="170">goto-next</name>
<source id="171">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="172"/>
<directJoin>false</directJoin>
<name id="173">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="174">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="175" type="java.util.HashSet"/>
<targets id="176" type="java.util.HashSet">
<item idref="169" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="148"/>
</item>
</sources>
<targets id="177" type="java.util.HashSet">
<item idref="146" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="131"/>
</item>
</sources>
<targets id="178" type="java.util.HashSet">
<item idref="129" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="110"/>
</item>
</sources>
<targets id="179" type="java.util.HashSet">
<item idref="108" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="81"/>
</item>
</sources>
<targets id="180" type="java.util.HashSet">
<item id="181" type="com.j2fe.workflow.definition.Transition">
<name id="182">nothing-found</name>
<source idref="81"/>
<target idref="60"/>
</item>
<item idref="79" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="67"/>
</item>
</sources>
<targets id="183" type="java.util.HashSet">
<item idref="65" type="com.j2fe.workflow.definition.Transition"/>
<item id="184" type="com.j2fe.workflow.definition.Transition">
<name id="185">true</name>
<source idref="67"/>
<target id="186">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="187"/>
<directJoin>false</directJoin>
<name id="188">Underlying soiAddition</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="189">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="190" type="java.util.HashSet">
<item id="191" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="192">["JMSTextMessage"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="193">input["JMSTextMessage"]</name>
<stringValue id="194">UnderlyingMessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="195" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="196">["TriggeredByBBPerSecurityBatch"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="197">input["TriggeredByBBPerSecurityBatch"]</name>
<stringValue id="198">N</stringValue>
<type>CONSTANT</type>
</item>
<item id="199" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="200">["TriggeredByCmfSoiAdditionForUnderlyers"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="201">input["TriggeredByCmfSoiAdditionForUnderlyers"]</name>
<stringValue id="202">Y</stringValue>
<type>CONSTANT</type>
</item>
<item id="203" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="204">name</name>
<stringValue id="205">cmfSOIAddition</stringValue>
<type>CONSTANT</type>
</item>
<item id="206" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="207">["RequestTrid"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="208">output["RequestTrid"]</name>
<stringValue id="209">UnderlyersRequestTransaction</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<persistentVariables id="210" type="java.util.HashSet">
<item id="211" type="java.lang.String">UnderlyingMessage
1000</item>
<item id="212" type="java.lang.String">underlyerSOIName
1000</item>
</persistentVariables>
<sources id="213" type="java.util.HashSet">
<item idref="184" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="214" type="java.util.HashSet">
<item id="215" type="com.j2fe.workflow.definition.Transition">
<name id="216">goto-next</name>
<source idref="186"/>
<target idref="60"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="60"/>
</item>
<item idref="215" type="com.j2fe.workflow.definition.Transition"/>
<item idref="181" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="217" type="java.util.HashSet">
<item idref="58" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="31"/>
</item>
</sources>
<targets id="218" type="java.util.HashSet">
<item id="219" type="com.j2fe.workflow.definition.Transition">
<name id="220">nothing-found</name>
<source idref="31"/>
<target idref="10"/>
</item>
<item idref="29" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="17"/>
</item>
</sources>
<targets id="221" type="java.util.HashSet">
<item idref="15" type="com.j2fe.workflow.definition.Transition"/>
<item id="222" type="com.j2fe.workflow.definition.Transition">
<name id="223">true</name>
<source idref="17"/>
<target id="224">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="225"/>
<directJoin>false</directJoin>
<name id="226">CDS soiAddition</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="227">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="228" type="java.util.HashSet">
<item id="229" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="230">["JMSTextMessage"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="231">input["JMSTextMessage"]</name>
<stringValue id="232">UnderlyingMessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="233" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="234">["PublishAssets"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="235">input["PublishAssets"]</name>
<stringValue id="236">N</stringValue>
<type>CONSTANT</type>
</item>
<item id="237" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="238">["SoiPurpType"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="239">input["SoiPurpType"]</name>
<stringValue id="240">SoiPurpType</stringValue>
<type>VARIABLE</type>
</item>
<item id="241" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="242">["TriggeredByBBPerSecurityBatch"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="243">input["TriggeredByBBPerSecurityBatch"]</name>
<stringValue id="244">N</stringValue>
<type>CONSTANT</type>
</item>
<item id="245" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="246">["TriggeredByCmfSoiAdditionForUnderlyers"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="247">input["TriggeredByCmfSoiAdditionForUnderlyers"]</name>
<stringValue id="248">Y</stringValue>
<type>CONSTANT</type>
</item>
<item id="249" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="250">name</name>
<stringValue id="251">cmfSOIAddition</stringValue>
<type>CONSTANT</type>
</item>
<item id="252" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="253">["RequestTrid"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="254">output["RequestTrid"]</name>
<stringValue id="255">CDSwpRequestTransaction</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<persistentVariables id="256" type="java.util.HashSet">
<item id="257" type="java.lang.String">CDSwpRequestTransaction
1000</item>
<item id="258" type="java.lang.String">UnderlyingMessage
1000</item>
</persistentVariables>
<sources id="259" type="java.util.HashSet">
<item idref="222" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="260" type="java.util.HashSet">
<item id="261" type="com.j2fe.workflow.definition.Transition">
<name id="262">goto-next</name>
<source idref="224"/>
<target id="263">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="264"/>
<directJoin>false</directJoin>
<name id="265">CDS Underly</name>
<nodeHandler>com.j2fe.general.activities.database.XMLQuery</nodeHandler>
<nodeHandlerClass id="266">com.j2fe.general.activities.database.XMLQuery</nodeHandlerClass>
<parameters id="267" type="java.util.HashSet">
<item id="268" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="269">database</name>
<stringValue id="270">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="271" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="272">mappedParameters["1,6,11"]</name>
<stringValue id="273">underlyerSOIName</stringValue>
<type>VARIABLE</type>
</item>
<item id="274" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="275">mappedParameters["2,3,7,8"]</name>
<stringValue id="276">CDSwpRequestTransaction</stringValue>
<type>VARIABLE</type>
</item>
<item id="277" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="278">mappedParameters["4,9"]</name>
<stringValue id="279">vEventJobID</stringValue>
<type>VARIABLE</type>
</item>
<item id="280" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="281">mappedParameters["5,10"]</name>
<stringValue id="282">SoiPurpType</stringValue>
<type>VARIABLE</type>
</item>
<item id="283" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="284">querySQL</name>
<objectValue id="285" type="java.lang.String">WITH security_interest_ids AS (&#13;
--------------------------------------------------------------------&#13;
-- Fetch ISIN id for ISSU which underlys CDS but not in Underly SOI&#13;
-- This part is to set up CDS Index with completed underlyers &#13;
-- Request TRN_ID &lt;- CDS's &#13;
--------------------------------------------------------------------&#13;
    SELECT iss_id,&#13;
           XMLAGG(&#13;
               XMLELEMENT(&#13;
                   NAME "securityOfInterestId",&#13;
                   XMLATTRIBUTES('mizuho:systemOfInterest-id' AS "securityOfInterestIdScheme"),&#13;
                   CAST(? as VARCHAR)&#13;
               )&#13;
           ) AS security_xml&#13;
    FROM (&#13;
        select distinct bondisid.iss_id as iss_id, 'Corp' as cl_value, (select COALESCE(max(vnd_rqstr_id),'GS') from ft_t_vreq where trn_id = CAST(? as VARCHAR) limit 1) usr_id, p.prnt_iss_grp_oid &#13;
from ft_t_issu u, ft_t_riss r, ft_t_ridf d, ft_t_isgp p, ft_t_isid bondisid&#13;
,(SELECT isid.* FROM ft_t_vreq vreq, ft_t_isid isid where vreq.trn_id=CAST(? as VARCHAR) and replace(vreq.VND_RQST_XREF_ID_CTXT_TYP,'_','')=isid.ID_CTXT_TYP and vreq.VND_RQST_XREF_ID=isid.iss_id AND isid.end_tms IS NULL&#13;
union&#13;
SELECT isid.* FROM ft_t_isid isid where (ID_CTXT_TYP,ISS_ID) in (SELECT case when (STRING_TO_ARRAY(event_value, ','))[1] = 'BB_UNIQUE' then 'BBUNIQUE' when (STRING_TO_ARRAY(event_value, ','))[1] = 'BB_GLOBAL' then 'BBGLOBAL' else (STRING_TO_ARRAY(event_value, ','))[1] end&#13;
,(STRING_TO_ARRAY(event_value, ','))[2] id_ctxt_typ_iss_id FROM MHI_TB_EVENTLOG where EVENT_JOB_ID=CAST(? as VARCHAR) and event_desc = 'INSTRUMENT EXISTS') AND end_tms IS NULL) i&#13;
where 1=1&#13;
-- Requested asset is CDSWP&#13;
and i.instr_id = u.instr_id&#13;
and u.iss_typ='CDSWP' and u.end_tms is null&#13;
-- CDSWP is in SOI&#13;
and i.instr_id = p.instr_id&#13;
and p.prt_purp_typ = CAST(? as VARCHAR)&#13;
and p.end_tms is null&#13;
-- Underly bond is linked to CDSWP&#13;
and bondisid.ID_CTXT_TYP = 'ISIN' and bondisid.end_tms is null&#13;
and bondisid.instr_id = r.instr_id and r.end_tms is null&#13;
and r.RLD_ISS_FEAT_ID = d.RLD_ISS_FEAT_ID&#13;
and d.rel_typ = 'UNDERLYG' and d.end_tms is null&#13;
and d.instr_id = i.instr_id&#13;
-- Underly bond is not in SOI&#13;
and not exists (select 1 from ft_t_isgp g&#13;
where 1=1 and g.end_tms is null&#13;
and bondisid.instr_id = g.instr_id&#13;
and g.prnt_iss_grp_oid = (select iss_grp_oid from ft_t_isgr where grp_nme=CAST(? as VARCHAR) AND end_tms IS NULL)&#13;
)&#13;
    ) AS derived_data&#13;
    GROUP BY iss_id&#13;
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
			XMLELEMENT(NAME "yellowKey", cl_value),&#13;
            XMLELEMENT(NAME "securityOfInterestIds", security_xml)&#13;
        )&#13;
    )&#13;
)&#13;
FROM (&#13;
   select distinct bondisid.iss_id as iss_id, 'Corp' as cl_value, (select COALESCE(max(vnd_rqstr_id),'GS') from ft_t_vreq where trn_id = CAST(? as VARCHAR) limit 1) usr_id, p.prnt_iss_grp_oid &#13;
from ft_t_issu u, ft_t_riss r, ft_t_ridf d, ft_t_isgp p, ft_t_isid bondisid&#13;
,(SELECT isid.* FROM ft_t_vreq vreq, ft_t_isid isid where vreq.trn_id=CAST(? as VARCHAR) and replace(vreq.VND_RQST_XREF_ID_CTXT_TYP,'_','')=isid.ID_CTXT_TYP and vreq.VND_RQST_XREF_ID=isid.iss_id AND isid.end_tms IS NULL&#13;
union&#13;
SELECT isid.* FROM ft_t_isid isid where (ID_CTXT_TYP,ISS_ID) in (SELECT case when (STRING_TO_ARRAY(event_value, ','))[1] = 'BB_UNIQUE' then 'BBUNIQUE' when (STRING_TO_ARRAY(event_value, ','))[1] = 'BB_GLOBAL' then 'BBGLOBAL' else (STRING_TO_ARRAY(event_value, ','))[1] end&#13;
,(STRING_TO_ARRAY(event_value, ','))[2] id_ctxt_typ_iss_id FROM MHI_TB_EVENTLOG where EVENT_JOB_ID=CAST(? as VARCHAR) and event_desc = 'INSTRUMENT EXISTS') AND end_tms IS NULL) i&#13;
where 1=1&#13;
-- Requested asset is CDSWP&#13;
and i.instr_id = u.instr_id&#13;
and u.iss_typ='CDSWP' and u.end_tms is null&#13;
-- CDSWP is in SOI&#13;
and i.instr_id = p.instr_id&#13;
and p.prt_purp_typ = CAST(? as VARCHAR)&#13;
and p.end_tms is null&#13;
-- Underly bond is linked to CDSWP&#13;
and bondisid.ID_CTXT_TYP = 'ISIN' and bondisid.end_tms is null&#13;
and bondisid.instr_id = r.instr_id and r.end_tms is null&#13;
and r.RLD_ISS_FEAT_ID = d.RLD_ISS_FEAT_ID&#13;
and d.rel_typ = 'UNDERLYG' and d.end_tms is null&#13;
and d.instr_id = i.instr_id&#13;
-- Underly bond is not in SOI&#13;
and not exists (select 1 from ft_t_isgp g&#13;
where 1=1 and g.end_tms is null&#13;
and bondisid.instr_id = g.instr_id&#13;
and g.prnt_iss_grp_oid = (select iss_grp_oid from ft_t_isgr where grp_nme=CAST(? as VARCHAR) AND end_tms IS NULL)&#13;
)&#13;
) AS final_selection&#13;
JOIN security_interest_ids USING (iss_id)</objectValue>
<type>CONSTANT</type>
</item>
<item id="286" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="287">result[0]</name>
<stringValue id="288">CDSMessage</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="289" type="java.util.HashSet">
<item idref="261" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="290" type="java.util.HashSet">
<item id="291" type="com.j2fe.workflow.definition.Transition">
<name id="292">nothing-found</name>
<source idref="263"/>
<target id="293">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="294">Automatically generated</description>
<directJoin>false</directJoin>
<name id="295">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="296">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="297" type="java.util.HashSet">
<item id="298" type="com.j2fe.workflow.definition.Transition">
<name id="299">false</name>
<source id="300">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="301"/>
<directJoin>false</directJoin>
<name id="302">cmfSOIAddition Elements ?</name>
<nodeHandler>com.j2fe.workflow.handler.impl.XPathXorSplit</nodeHandler>
<nodeHandlerClass id="303">com.j2fe.workflow.handler.impl.XPathXorSplit</nodeHandlerClass>
<parameters id="304" type="java.util.HashSet">
<item id="305" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="306">inputText</name>
<stringValue id="307">CDSMessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="308" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="309">xPath</name>
<stringValue id="310">//cmfSOIAddition</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="311" type="java.util.HashSet">
<item id="312" type="com.j2fe.workflow.definition.Transition">
<name id="313">rows-found</name>
<source idref="263"/>
<target idref="300"/>
</item>
</sources>
<targets id="314" type="java.util.HashSet">
<item idref="298" type="com.j2fe.workflow.definition.Transition"/>
<item id="315" type="com.j2fe.workflow.definition.Transition">
<name id="316">true</name>
<source idref="300"/>
<target id="317">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="318"/>
<directJoin>false</directJoin>
<name id="319">SOIadd CDS Underly</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="320">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="321" type="java.util.HashSet">
<item id="322" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="323">["JMSTextMessage"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="324">input["JMSTextMessage"]</name>
<stringValue id="325">CDSMessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="326" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="327">["TriggeredByBBPerSecurityBatch"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="328">input["TriggeredByBBPerSecurityBatch"]</name>
<stringValue id="329">N</stringValue>
<type>CONSTANT</type>
</item>
<item id="330" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="331">["TriggeredByCmfSoiAdditionForUnderlyers"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="332">input["TriggeredByCmfSoiAdditionForUnderlyers"]</name>
<stringValue id="333">Y</stringValue>
<type>CONSTANT</type>
</item>
<item id="334" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="335">name</name>
<stringValue id="336">cmfSOIAddition</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<persistentVariables id="337" type="java.util.HashSet">
<item id="338" type="java.lang.String">CDSMessage
1000</item>
</persistentVariables>
<sources id="339" type="java.util.HashSet">
<item idref="315" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="340" type="java.util.HashSet">
<item id="341" type="com.j2fe.workflow.definition.Transition">
<name id="342">goto-next</name>
<source idref="317"/>
<target idref="293"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="293"/>
</item>
<item idref="341" type="com.j2fe.workflow.definition.Transition"/>
<item idref="291" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="343" type="java.util.HashSet">
<item id="344" type="com.j2fe.workflow.definition.Transition">
<name id="345">goto-next</name>
<source idref="293"/>
<target id="346">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="347"/>
<directJoin>false</directJoin>
<name id="348">CDS Underly CB</name>
<nodeHandler>com.j2fe.general.activities.database.XMLQuery</nodeHandler>
<nodeHandlerClass id="349">com.j2fe.general.activities.database.XMLQuery</nodeHandlerClass>
<parameters id="350" type="java.util.HashSet">
<item id="351" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="352">database</name>
<stringValue id="353">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="354" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="355">mappedParameters["1,6,11"]</name>
<stringValue id="356">underlyerSOIName</stringValue>
<type>VARIABLE</type>
</item>
<item id="357" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="358">mappedParameters["2,3,7,8"]</name>
<stringValue id="359">CDSwpRequestTransaction</stringValue>
<type>VARIABLE</type>
</item>
<item id="360" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="361">mappedParameters["4,9"]</name>
<stringValue id="362">vEventJobID</stringValue>
<type>VARIABLE</type>
</item>
<item id="363" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="364">mappedParameters["5,10"]</name>
<stringValue id="365">SoiPurpType</stringValue>
<type>VARIABLE</type>
</item>
<item id="366" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="367">querySQL</name>
<objectValue id="368" type="java.lang.String">WITH security_interest_ids AS (&#13;
--------------------------------------------------------------------&#13;
-- Fetch Equity --&gt; CB  --&gt;  CDSWP  --&gt;  CDS Index&#13;
-- If the equity not in Underlying SOI&#13;
-- This part is to set up CDS Index with completed underlyers &#13;
-- Request TRN_ID &lt;- CDS's &#13;
--------------------------------------------------------------------&#13;
    SELECT iss_id,&#13;
           XMLAGG(&#13;
               XMLELEMENT(&#13;
                   NAME "securityOfInterestId",&#13;
                   XMLATTRIBUTES('mizuho:systemOfInterest-id' AS "securityOfInterestIdScheme"),&#13;
                   CAST(? as VARCHAR)&#13;
               )&#13;
           ) AS security_xml&#13;
    FROM (&#13;
        select distinct s.stat_char_val_txt as iss_id, 'Equity' as cl_value, (select COALESCE(max(vnd_rqstr_id),'GS') from ft_t_vreq where trn_id = CAST(? as VARCHAR) limit 1) usr_id, g.prnt_iss_grp_oid&#13;
from ft_t_isst s, ft_t_issu i, ft_t_ridf ridf, ft_t_riss riss, ft_t_isgp g&#13;
,(SELECT isid.* FROM ft_t_vreq vreq, ft_t_isid isid where vreq.trn_id=CAST(? as VARCHAR) and replace(vreq.VND_RQST_XREF_ID_CTXT_TYP,'_','')=isid.ID_CTXT_TYP and vreq.VND_RQST_XREF_ID=isid.iss_id AND isid.end_tms IS NULL&#13;
union&#13;
SELECT isid.* FROM ft_t_isid isid where (ID_CTXT_TYP,ISS_ID) in (SELECT case when (STRING_TO_ARRAY(event_value, ','))[1] = 'BB_UNIQUE' then 'BBUNIQUE' when (STRING_TO_ARRAY(event_value, ','))[1] = 'BB_GLOBAL' then 'BBGLOBAL' else (STRING_TO_ARRAY(event_value, ','))[1] end&#13;
,(STRING_TO_ARRAY(event_value, ','))[2] id_ctxt_typ_iss_id FROM MHI_TB_EVENTLOG where EVENT_JOB_ID=CAST(? as VARCHAR) and event_desc = 'INSTRUMENT EXISTS') AND end_tms IS NULL) vreq_isid&#13;
where 1=1&#13;
-- CDSWP is requested&#13;
and ridf.instr_id = vreq_isid.instr_id&#13;
and ridf.rel_typ = 'UNDERLYG' and ridf.end_tms is null&#13;
and riss.RLD_ISS_FEAT_ID = ridf.RLD_ISS_FEAT_ID&#13;
and riss.end_tms is null&#13;
and riss.instr_id= i.instr_id&#13;
and i.iss_typ='CVTBOND'&#13;
and i.end_tms is null&#13;
-- CDSWP is in INTEREST SOI&#13;
and g.instr_id = vreq_isid.instr_id&#13;
and g.end_tms is null&#13;
and g.prt_purp_typ = CAST(? as VARCHAR)&#13;
-- CB has BBuniqueID of Equity&#13;
and s.instr_id=i.instr_id&#13;
and s.stat_def_id = 'UNDBBUNQ' and s.end_tms is null&#13;
-- Equity is not in Asset Underlying SOI&#13;
and not exists (&#13;
select 1 from ft_t_isid i, ft_t_isgp p&#13;
where i.iss_id = s.stat_char_val_txt&#13;
and i.id_ctxt_typ = 'BBUNIQUE' and i.end_tms is null&#13;
and i.instr_id = p.instr_id&#13;
and p.end_tms is null&#13;
and p.prnt_iss_grp_oid = (select iss_grp_oid from ft_t_isgr where grp_nme=CAST(? as VARCHAR) AND end_tms IS NULL)&#13;
)&#13;
    ) AS derived_data&#13;
    GROUP BY iss_id&#13;
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
			XMLELEMENT(NAME "yellowKey", cl_value),&#13;
			XMLELEMENT(NAME "sourceSystemId", usr_id),	&#13;
            XMLELEMENT(NAME "securityOfInterestIds", security_xml)&#13;
        )&#13;
    )&#13;
)&#13;
FROM (&#13;
      select distinct s.stat_char_val_txt as iss_id, 'Equity' as cl_value, (select COALESCE(max(vnd_rqstr_id),'GS') from ft_t_vreq where trn_id = CAST(? as VARCHAR) limit 1) usr_id, g.prnt_iss_grp_oid&#13;
from ft_t_isst s, ft_t_issu i, ft_t_ridf ridf, ft_t_riss riss, ft_t_isgp g&#13;
,(SELECT isid.* FROM ft_t_vreq vreq, ft_t_isid isid where vreq.trn_id=CAST(? as VARCHAR) and replace(vreq.VND_RQST_XREF_ID_CTXT_TYP,'_','')=isid.ID_CTXT_TYP and vreq.VND_RQST_XREF_ID=isid.iss_id AND isid.end_tms IS NULL&#13;
union&#13;
SELECT isid.* FROM ft_t_isid isid where (ID_CTXT_TYP,ISS_ID) in (SELECT case when (STRING_TO_ARRAY(event_value, ','))[1] = 'BB_UNIQUE' then 'BBUNIQUE' when (STRING_TO_ARRAY(event_value, ','))[1] = 'BB_GLOBAL' then 'BBGLOBAL' else (STRING_TO_ARRAY(event_value, ','))[1] end&#13;
,(STRING_TO_ARRAY(event_value, ','))[2] id_ctxt_typ_iss_id FROM MHI_TB_EVENTLOG where EVENT_JOB_ID=CAST(? as VARCHAR) and event_desc = 'INSTRUMENT EXISTS') AND end_tms IS NULL) vreq_isid&#13;
where 1=1&#13;
-- CDSWP is requested&#13;
and ridf.instr_id = vreq_isid.instr_id&#13;
and ridf.rel_typ = 'UNDERLYG' and ridf.end_tms is null&#13;
and riss.RLD_ISS_FEAT_ID = ridf.RLD_ISS_FEAT_ID&#13;
and riss.end_tms is null&#13;
and riss.instr_id= i.instr_id&#13;
and i.iss_typ='CVTBOND'&#13;
and i.end_tms is null&#13;
-- CDSWP is in INTEREST SOI&#13;
and g.instr_id = vreq_isid.instr_id&#13;
and g.end_tms is null&#13;
and g.prt_purp_typ = CAST(? as VARCHAR)&#13;
-- CB has BBuniqueID of Equity&#13;
and s.instr_id=i.instr_id&#13;
and s.stat_def_id = 'UNDBBUNQ' and s.end_tms is null&#13;
-- Equity is not in Asset Underlying SOI&#13;
and not exists (&#13;
select 1 from ft_t_isid i, ft_t_isgp p&#13;
where i.iss_id = s.stat_char_val_txt&#13;
and i.id_ctxt_typ = 'BBUNIQUE' and i.end_tms is null&#13;
and i.instr_id = p.instr_id&#13;
and p.end_tms is null&#13;
and p.prnt_iss_grp_oid = (select iss_grp_oid from ft_t_isgr where grp_nme=CAST(? as VARCHAR) AND end_tms IS NULL)&#13;
)&#13;
) AS final_selection&#13;
JOIN security_interest_ids USING (iss_id)</objectValue>
<type>CONSTANT</type>
</item>
<item id="369" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="370">result[0]</name>
<stringValue id="371">EquityMessage</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="372" type="java.util.HashSet">
<item idref="344" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="373" type="java.util.HashSet">
<item id="374" type="com.j2fe.workflow.definition.Transition">
<name id="375">nothing-found</name>
<source idref="346"/>
<target id="376">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="377">Automatically generated</description>
<directJoin>false</directJoin>
<name id="378">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="379">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="380" type="java.util.HashSet">
<item id="381" type="com.j2fe.workflow.definition.Transition">
<name id="382">false</name>
<source id="383">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="384"/>
<directJoin>false</directJoin>
<name id="385">cmfSOIAddition Elements ?</name>
<nodeHandler>com.j2fe.workflow.handler.impl.XPathXorSplit</nodeHandler>
<nodeHandlerClass id="386">com.j2fe.workflow.handler.impl.XPathXorSplit</nodeHandlerClass>
<parameters id="387" type="java.util.HashSet">
<item id="388" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="389">inputText</name>
<stringValue id="390">EquityMessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="391" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="392">xPath</name>
<stringValue id="393">//cmfSOIAddition</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="394" type="java.util.HashSet">
<item id="395" type="com.j2fe.workflow.definition.Transition">
<name id="396">rows-found</name>
<source idref="346"/>
<target idref="383"/>
</item>
</sources>
<targets id="397" type="java.util.HashSet">
<item idref="381" type="com.j2fe.workflow.definition.Transition"/>
<item id="398" type="com.j2fe.workflow.definition.Transition">
<name id="399">true</name>
<source idref="383"/>
<target id="400">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="401"/>
<directJoin>false</directJoin>
<name id="402">SOIadd CDS Underly</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="403">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="404" type="java.util.HashSet">
<item id="405" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="406">["JMSTextMessage"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="407">input["JMSTextMessage"]</name>
<stringValue id="408">EquityMessage</stringValue>
<type>VARIABLE</type>
</item>
<item id="409" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="410">["TriggeredByBBPerSecurityBatch"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="411">input["TriggeredByBBPerSecurityBatch"]</name>
<stringValue id="412">N</stringValue>
<type>CONSTANT</type>
</item>
<item id="413" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="414">["TriggeredByCmfSoiAdditionForUnderlyers"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="415">input["TriggeredByCmfSoiAdditionForUnderlyers"]</name>
<stringValue id="416">Y</stringValue>
<type>CONSTANT</type>
</item>
<item id="417" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="418">name</name>
<stringValue id="419">cmfSOIAddition</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<persistentVariables id="420" type="java.util.HashSet">
<item id="421" type="java.lang.String">CDSMessage
1000</item>
</persistentVariables>
<sources id="422" type="java.util.HashSet">
<item idref="398" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="423" type="java.util.HashSet">
<item id="424" type="com.j2fe.workflow.definition.Transition">
<name id="425">goto-next</name>
<source idref="400"/>
<target idref="376"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="376"/>
</item>
<item idref="424" type="com.j2fe.workflow.definition.Transition"/>
<item idref="374" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="426" type="java.util.HashSet">
<item id="427" type="com.j2fe.workflow.definition.Transition">
<name id="428">goto-next</name>
<source idref="376"/>
<target idref="10"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item idref="395" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</target>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item idref="312" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</target>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="10"/>
</item>
<item idref="427" type="com.j2fe.workflow.definition.Transition"/>
<item idref="219" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="429" type="java.util.HashSet">
<item idref="8" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="3"/>
</item>
</sources>
<targets id="430" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="431">Mizuho</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="432">user1</lastChangeUser>
<lastUpdate id="433">2025-07-04T05:03:09.000+0100</lastUpdate>
<name id="434">cmfSOIAdditionForUnderlyers</name>
<nodes id="435" type="java.util.HashSet">
<item idref="31" type="com.j2fe.workflow.definition.Node"/>
<item idref="263" type="com.j2fe.workflow.definition.Node"/>
<item idref="346" type="com.j2fe.workflow.definition.Node"/>
<item idref="224" type="com.j2fe.workflow.definition.Node"/>
<item idref="131" type="com.j2fe.workflow.definition.Node"/>
<item idref="110" type="com.j2fe.workflow.definition.Node"/>
<item idref="81" type="com.j2fe.workflow.definition.Node"/>
<item idref="148" type="com.j2fe.workflow.definition.Node"/>
<item idref="376" type="com.j2fe.workflow.definition.Node"/>
<item idref="10" type="com.j2fe.workflow.definition.Node"/>
<item idref="293" type="com.j2fe.workflow.definition.Node"/>
<item idref="400" type="com.j2fe.workflow.definition.Node"/>
<item idref="317" type="com.j2fe.workflow.definition.Node"/>
<item idref="171" type="com.j2fe.workflow.definition.Node"/>
<item idref="3" type="com.j2fe.workflow.definition.Node"/>
<item idref="186" type="com.j2fe.workflow.definition.Node"/>
<item idref="17" type="com.j2fe.workflow.definition.Node"/>
<item idref="383" type="com.j2fe.workflow.definition.Node"/>
<item idref="67" type="com.j2fe.workflow.definition.Node"/>
<item idref="300" type="com.j2fe.workflow.definition.Node"/>
<item idref="60" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>true</optimize>
<parameter id="436" type="java.util.HashMap">
<entry>
<key id="437" type="java.lang.String">EventJobID</key>
<value id="438" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="439">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="440" type="java.lang.String">RequestTransaction</key>
<value id="441" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="442">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="443" type="java.lang.String">SOIName</key>
<value id="444" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="445">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
</parameter>
<permissions id="446" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>false</purgeAtEnd>
<retries>0</retries>
<startNode idref="171"/>
<status>RELEASED</status>
<variables id="447" type="java.util.HashMap">
<entry>
<key id="448" type="java.lang.String">Counter</key>
<value id="449" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="450">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<persistent>false</persistent>
<value id="451" type="java.lang.Integer">0</value>
</value>
</entry>
<entry>
<key id="452" type="java.lang.String">EventJobID</key>
<value id="453" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="454">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="455" type="java.lang.String">Indexed Parameters</key>
<value id="456" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="457">[Ljava.lang.Object;</className>
<clazz>[Ljava.lang.Object;</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="458" type="java.lang.String">RequestTransaction</key>
<value id="459" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="460">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="461" type="java.lang.String">SOIName</key>
<value id="462" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="463">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>true</persistent>
</value>
</entry>
<entry>
<key id="464" type="java.lang.String">SoiPurpType</key>
<value id="465" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="466">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>true</persistent>
<value id="467" type="java.lang.String">INTEREST</value>
</value>
</entry>
<entry>
<key id="468" type="java.lang.String">UnderlyersRequestTransaction</key>
<value id="469" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="470">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="471" type="java.lang.String">vEventJobID</key>
<value id="472" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="473">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="474" type="java.lang.String">vRequestTransaction</key>
<value id="475" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="476">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
</variables>
<version>14</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
