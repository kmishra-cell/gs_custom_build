<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<goldensource-package version="10.0.0.02">
    <package-comment/>
    <businessobject displayString="BBPerSecRequestBuilder" type="com.j2fe.translation.template.QueryDefinition">
        <com.j2fe.translation.template.QueryDefinition id="0">
            <name id="1">BBPerSecRequestBuilder</name>
            <parameters id="2" type="java.util.ArrayList">
                <item id="3" type="com.j2fe.translation.template.QueryParameter">
                    <description id="4">MTN</description>
                    <name id="5">MTN</name>
                    <type>12</type>
                </item>
                <item id="6" type="com.j2fe.translation.template.QueryParameter">
                    <description id="7">BBACK</description>
                    <name id="8">BBACK</name>
                    <type>12</type>
                </item>
                <item id="9" type="com.j2fe.translation.template.QueryParameter">
                    <description id="10">INTEREST</description>
                    <name id="11">INTEREST</name>
                    <type>12</type>
                </item>
                <item id="12" type="com.j2fe.translation.template.QueryParameter">
                    <description id="13">NOBBREQ</description>
                    <name id="14">NOBBREQ</name>
                    <type>12</type>
                </item>
                <item id="15" type="com.j2fe.translation.template.QueryParameter">
                    <description id="16">BATCH_NO</description>
                    <name id="17">BATCH_NO</name>
                    <type>12</type>
                </item>
                <item id="18" type="com.j2fe.translation.template.QueryParameter">
                    <description id="19">INTEREST</description>
                    <name id="20">INTEREST</name>
                    <type>12</type>
                </item>
                <item id="21" type="com.j2fe.translation.template.QueryParameter">
                    <description id="22">INTEREST</description>
                    <name id="23">INTEREST</name>
                    <type>12</type>
                </item>
            </parameters>
            <text id="24">select&#13;
	xmlelement(NAME "VendorRequest",&#13;
	xmlelement(NAME "User",&#13;
	'BBScheduled'),&#13;
	xmlelement(NAME "Requestor",&#13;
	'BBScheduled'),&#13;
	xmlelement(NAME "UserRequestID"),&#13;
	xmlelement(NAME "Universe"),&#13;
	xmlagg(&#13;
            xmlelement(NAME "Request",&#13;
	xmlelement(NAME "DataType",&#13;
	'SECMASTER'),&#13;
	xmlelement(NAME "Vendor",&#13;
	'BB'),&#13;
	xmlelement(NAME "TableType",&#13;
	'ISSU'),&#13;
	xmlelement(NAME "Identifier",&#13;
	iss_id),&#13;
	xmlelement(NAME "IDContext",&#13;
	case&#13;
		when id_ctxt_typ = 'BBUNIQUE' then 'BB_UNIQUE'&#13;
		when id_ctxt_typ = 'BB8CHR' then 'TICKER'&#13;
		else id_ctxt_typ&#13;
	end),&#13;
	case&#13;
		when cl_value is not null then xmlelement(NAME "Param",&#13;
		xmlattributes('MarketSector' as "Key"),&#13;
		cl_value)&#13;
		else null&#13;
	end&#13;
            )&#13;
        )&#13;
        ) as text&#13;
from&#13;
	(&#13;
	select&#13;
		distinct &#13;
        isid.instr_id,&#13;
		isid.iss_id,&#13;
		isid.id_ctxt_typ,&#13;
		iscl.cl_value,&#13;
		rank() over (&#13;
            partition by isid.instr_id&#13;
	order by&#13;
		case&#13;
			when isid.id_ctxt_typ = 'BB8CHR' then 'TICKER'&#13;
			else isid.id_ctxt_typ&#13;
		end&#13;
        ) as rank&#13;
	from&#13;
		ft_t_isid isid&#13;
	left join ft_t_iscl iscl &#13;
    on&#13;
		isid.instr_id = iscl.instr_id&#13;
		and iscl.indus_cl_set_id = 'BBMKTSCT'&#13;
		and iscl.start_tms &lt;= sysdate()&#13;
		and (iscl.end_tms is null&#13;
			or iscl.end_tms &gt; sysdate())&#13;
	where&#13;
		id_ctxt_typ in ('BBUNIQUE', 'ISIN', 'BB8CHR')&#13;
		and isid.start_tms &lt;= sysdate()&#13;
		and (isid.end_tms is null&#13;
			or isid.end_tms &gt; sysdate())&#13;
		and not exists (&#13;
		select&#13;
			1&#13;
		from&#13;
			ft_t_isgp mt&#13;
		where&#13;
			mt.instr_id = isid.instr_id&#13;
			and mt.prt_purp_typ = ?&#13;
			and mt.start_tms &lt;= sysdate()&#13;
			and (mt.end_tms is null&#13;
				or mt.end_tms &gt; sysdate())&#13;
        )&#13;
		and&#13;
        not exists (&#13;
		select&#13;
			1&#13;
		from&#13;
			ft_t_isgp bb&#13;
		where&#13;
			bb.instr_id = isid.instr_id&#13;
			and bb.prt_purp_typ = ?&#13;
			and bb.start_tms &lt;= sysdate()&#13;
			and (bb.end_tms is null&#13;
				or bb.end_tms &gt; sysdate())&#13;
        )&#13;
		and&#13;
        exists (&#13;
		select&#13;
			1&#13;
		from&#13;
			ft_t_isgp inv&#13;
		where&#13;
			inv.instr_id = isid.instr_id&#13;
			and inv.prt_purp_typ = ?&#13;
			and not exists (&#13;
			select&#13;
				1&#13;
			from&#13;
				ft_t_isgr isgr&#13;
			where&#13;
				isgr.iss_grp_oid = inv.prnt_iss_grp_oid&#13;
				and isgr.end_tms is null&#13;
				and isgr.grp_purp_typ = ?&#13;
            )&#13;
			and inv.start_tms &lt;= sysdate()&#13;
			and (inv.end_tms is null&#13;
				or inv.end_tms &gt; sysdate())&#13;
        )&#13;
		and&#13;
			MHI_PERSEC_GROUP(&#13;
            (&#13;
			select&#13;
				cl_value&#13;
			from&#13;
				ft_t_iscl&#13;
			where&#13;
				instr_id = isid.instr_id&#13;
				and indus_cl_set_id = 'BBMKTSCT'&#13;
				and clsf_purp_typ = 'INDCLASS'&#13;
				and end_tms is null&#13;
			limit 1),&#13;
			(&#13;
			select&#13;
				cl_value&#13;
			from&#13;
				ft_t_iscl&#13;
			where&#13;
				instr_id = isid.instr_id&#13;
				and indus_cl_set_id = 'BBFIREGN'&#13;
				and clsf_purp_typ = 'INDCLASS'&#13;
				and end_tms is null&#13;
			limit 1)&#13;
        ) = ?&#13;
		and not exists (&#13;
		select&#13;
			'1'&#13;
		from&#13;
			ft_t_iscl dmb&#13;
		where&#13;
			isid.instr_id = dmb.instr_id&#13;
			and dmb.indus_cl_set_id = 'MHSCBDCL'&#13;
			and dmb.cl_value = 'DMB'&#13;
			and dmb.end_tms is null&#13;
			and exists (&#13;
			select&#13;
				'1'&#13;
			from&#13;
				ft_t_isgp isgp&#13;
			where&#13;
				isgp.INSTR_ID = isid.INSTR_ID&#13;
				and isgp.PRNT_ISS_GRP_OID in (&#13;
				select&#13;
					ISS_GRP_OID&#13;
				from&#13;
					FT_T_ISGR&#13;
				where&#13;
					grp_nme = 'MHSC Nozomi Inventory')&#13;
				and isgp.end_tms is null&#13;
				and isgp.prt_purp_typ = ?)&#13;
			and not exists (&#13;
			select&#13;
				'1'&#13;
			from&#13;
				ft_t_isgp isgp&#13;
			where&#13;
				isgp.INSTR_ID = isid.instr_id&#13;
				and isgp.PRNT_ISS_GRP_OID in (&#13;
				select&#13;
					ISS_GRP_OID&#13;
				from&#13;
					ft_t_isgr&#13;
				where&#13;
					org_id is not null&#13;
					and org_id != 'MHSC')&#13;
				and isgp.end_tms is null&#13;
				and isgp.prt_purp_typ = ?))&#13;
) as subquery&#13;
where&#13;
	rank = 1;</text>
        </com.j2fe.translation.template.QueryDefinition>
    </businessobject>
</goldensource-package>
