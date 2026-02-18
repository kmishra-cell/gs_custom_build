<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.03">
<package-comment/>
<businessobject displayString="SOIMaintenanceUnderlyersList" type="com.j2fe.translation.template.QueryDefinition">
<com.j2fe.translation.template.QueryDefinition id="0">
<description id="1">Build dynamic list of Underlyers. For each asset across all parent groups Extract related issues defined by RIDF/RISS tables</description>
<name id="2">SOIMaintenanceUnderlyersList</name>
<parameters id="3" type="java.util.ArrayList">
<item id="4" type="com.j2fe.translation.template.QueryParameter">
<description id="5">Underlyer SOI Group Name</description>
<name id="6">Underlyer SOI Group Name</name>
<type>12</type>
</item>
<item id="7" type="com.j2fe.translation.template.QueryParameter">
<description id="8">Parent MHI/MHEU SOI Group Name</description>
<name id="9">Parent MHI/MHEU SOI Group Name</name>
<type>12</type>
</item>
</parameters>
<text id="10">select  XMLELEMENT(NAME "cmfSOIStatement",&#13;
XMLELEMENT(NAME "sourceSystemId",'GS'),&#13;
XMLELEMENT(NAME "soiDomain",CAST(? as VARCHAR)),&#13;
XMLELEMENT(NAME "instruments",&#13;
XMLAGG (&#13;
        XMLELEMENT(NAME "instrument",&#13;
        XMLELEMENT (NAME "instrumentId", xmlattributes('mizuho:'||id_ctxt_typ as "instrumentIdScheme"), iss_id))&#13;
        ) &#13;
))&#13;
from (select distinct isid.instr_id, isid.iss_id, isid.id_ctxt_typ&#13;
, rank() over (PARTITION by isid.instr_id order by case when isid.id_ctxt_typ='BB8CHR' then 'TICKER' else isid.id_ctxt_typ end  ) rank&#13;
from ft_t_isid isid&#13;
where id_ctxt_typ in ('BBUNIQUE','ISIN','BB8CHR')&#13;
and isid.start_tms &lt;= sysdate() and (isid.end_tms is null or isid.end_tms &gt; sysdate())&#13;
and exists (SELECT 1 FROM ft_t_isgp isgp_main, ft_t_ridf ridf, ft_t_riss riss&#13;
where 1=1 and isgp_main.prnt_iss_grp_oid in ( SELECT isgp.iss_grp_oid FROM ft_t_isgp isgp, ft_t_isgr isgr &#13;
                                    where 1=1 and isgr.grp_nme=CAST(? as VARCHAR) and isgr.iss_grp_oid=isgp.prnt_iss_grp_oid and isgp.instr_id is null and isgp.end_tms is null and isgr.end_tms is null )&#13;
and isgp_main.instr_id=ridf.instr_id&#13;
and isgp_main.start_tms &lt;= sysdate() and (isgp_main.end_tms is null or isgp_main.end_tms &gt; sysdate())&#13;
and ridf.rld_iss_feat_id=riss.rld_iss_feat_id&#13;
and riss.ISS_PART_RL_TYP in ('UNDLYING','DELIVER') &#13;
AND ridf.end_tms IS NULL&#13;
AND riss.end_tms IS NULL&#13;
and riss.instr_id=isid.instr_id)&#13;
) as main where rank=1</text>
</com.j2fe.translation.template.QueryDefinition>
</businessobject>
</goldensource-package>
