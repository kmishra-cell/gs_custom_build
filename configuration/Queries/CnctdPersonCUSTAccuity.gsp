<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<goldensource-package version="8.4.1.286">
<package-comment/>
<businessobject displayString="CnctdPersonCUSTAccuity" type="com.j2fe.translation.template.QueryDefinition">
<com.j2fe.translation.template.QueryDefinition id="0">
<name id="1">CnctdPersonCUSTAccuity</name>
<parameters id="2" type="java.util.ArrayList"/>
<text id="3">select &#13;
	'"' || custref.customer_id -- "Customer Reference",&#13;
|| '"|"' || stratref.customer_id -- "Related client reference",&#13;
|| '"|"' || cust.cst_nme -- "Full client Name",&#13;
|| '"|"' || 'Entity' -- "Client Entity Type",&#13;
|| '"|' || 'N/A' --"National ID Number",&#13;
|| '|' || 'N/A' --"Date of Birth",&#13;
|| '|' || 'N/A' -- "Place of Birth",&#13;
|| '|' || 'N/A' -- "Nationality",&#13;
|| '|"' || NVL( (select madr.city_nme &#13;
		from fT_T_ccrf ccrf, ft_t_adtp adtp, ft_T_madr madr &#13;
		where ccrf.cntl_cross_ref_oid = adtp.cntl_cross_ref_oid and adtp.mail_addr_id = madr.mail_addr_id and ccrf.cst_id is not null and adtp.addr_typ='BUSINES2'&#13;
		and ccrf.end_tms is null  and adtp.end_tms is null and madr.end_tms is null &#13;
		and ccrf.cst_id = cust.cst_id and rownum=1) ,&#13;
		(select madr.city_nme&#13;
		from fT_T_ccrf ccrf, ft_t_adtp adtp, ft_T_madr madr &#13;
		where ccrf.cntl_cross_ref_oid = adtp.cntl_cross_ref_oid and adtp.mail_addr_id = madr.mail_addr_id and ccrf.cst_id is not null and adtp.addr_typ='BUSINES1'&#13;
		and ccrf.end_tms is null  and adtp.end_tms is null and madr.end_tms is null &#13;
		and ccrf.cst_id = cust.cst_id  and rownum=1) ) --"City of Residence",&#13;
|| '"|"' ||NVL( (select idmv.intrnl_dmn_val_txt cntryNme &#13;
		from fT_T_ccrf ccrf, ft_t_adtp adtp, ft_T_madr madr, fT_T_IDMV IDMV &#13;
		where ccrf.cntl_cross_ref_oid = adtp.cntl_cross_ref_oid and adtp.mail_addr_id = madr.mail_addr_id and ccrf.cst_id is not null and adtp.addr_typ='BUSINES2'&#13;
		and idmv.fld_data_cl_id ='COUNTRY' and idmv.intrnl_dmn_val_txt= madr.cntry_cde and ccrf.end_tms is null  and adtp.end_tms is null and madr.end_tms is null &#13;
		and ccrf.cst_id = cust.cst_id and rownum=1 ) ,&#13;
		(select idmv.intrnl_dmn_val_txt cntryNme &#13;
		from fT_T_ccrf ccrf, ft_t_adtp adtp, ft_T_madr madr, fT_T_IDMV IDMV &#13;
		where ccrf.cntl_cross_ref_oid = adtp.cntl_cross_ref_oid and adtp.mail_addr_id = madr.mail_addr_id and ccrf.cst_id is not null and adtp.addr_typ='BUSINES1'&#13;
		and idmv.fld_data_cl_id ='COUNTRY' and idmv.intrnl_dmn_val_txt= madr.cntry_cde and ccrf.end_tms is null  and adtp.end_tms is null and madr.end_tms is null &#13;
		and ccrf.cst_id = cust.cst_id  and rownum=1) ) -- "Country of Residence",&#13;
|| '"|"' || cntryIncorp.gunme -- "Country of Incorporation "&#13;
|| '"'&#13;
from &#13;
ft_T_cust cust , &#13;
(select cst_id, customer_id from ft_T_cuid cuid where cuid.end_tms is null and cuid.cst_id_ctxt_typ='CUSTREF') CUSTREF,&#13;
(select cst_id, customer_id from ft_T_cuid cuid where cuid.end_tms is null and cuid.cst_id_ctxt_typ='STRATREF') STRATREF,&#13;
(select gunt.prnt_gu_id as gunme, cugu.cst_id as cstid from ft_t_cugu cugu, ft_T_gunt gunt where cugu.end_tms is null and cugu.cst_gu_purp_typ='INCORP' and gunt.prnt_gu_id = cugu.gu_id and gunt.prnt_gu_typ = cugu.gu_typ and gunt.prnt_gu_cnt = cugu.gu_cnt and gunt.end_tms is null) cntryIncorp&#13;
where &#13;
    cust.cst_id=  custref.cst_id &#13;
and cust.cst_id=  stratref.cst_id(+) &#13;
and cust.cst_id = cntryincorp.cstid(+)&#13;
and cust.end_tms is null and cust.cst_stat_typ in ( 'ACTIVE', 'CUCLINIT')  /*included Customer Status 'CUCLINIT' APPSUP-44510*/&#13;
and exists (select 1 from FT_T_CUGP cugp where cugp.END_TMS is null and cugp.CST_ID = cust.CST_ID and cugp.PRNT_CST_GRP_OID = 'CUGRMH0001')&#13;
/*and exists (&#13;
select 1 from fT_T_ecur ecur, ft_t_empl empl where ecur.empl_oid = empl.empl_oid and ecur.rl_typ ='BENOWNRO' and ecur.end_tms is null and ecur.cst_id = cust.cst_id)&#13;
*/&#13;
</text>
</com.j2fe.translation.template.QueryDefinition>
</businessobject>
</goldensource-package>
