<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<goldensource-package version="8.4.1.286">
<package-comment/>
<businessobject displayString="MHEU_CnctdPersonDtlsAccuity" type="com.j2fe.translation.template.QueryDefinition">
<com.j2fe.translation.template.QueryDefinition id="0">
<name id="1">MHEU_CnctdPersonDtlsAccuity</name>
<parameters id="2" type="java.util.ArrayList"/>
<text id="3">select &#13;
'"' || empl.pref_employee_id -- "Customer Reference",&#13;
|| '"|"' || stratref.customer_id -- "Related client reference",&#13;
|| '"|"' || empl.emp_nme -- "Full client Name",&#13;
|| '"|"' || decode(empl.emp_off_titl_txt,'INDIVIDUAL','Individual','ENTITY','Entity') -- "Client Entity Type",&#13;
|| '"|' || PASSPORTID.employee_id --"National ID Number",&#13;
|| '|' || empl.empl_start_dte --"Date of Birth",&#13;
|| '|' || cuch.birth_loc_txt -- "Place of Birth",&#13;
|| '|' || empl.emp_loc_txt -- "Nationality",&#13;
|| '|"' || 'N/A' --"City of Residence",&#13;
|| '"|"' || (select idmv.intrnl_dmn_val_txt cntryNme  from fT_T_idmv idmv where idmv.fld_data_cl_id ='COUNTRY' and idmv.intrnl_dmn_val_txt= empl.emp_cntry_cde and rownum=1) -- "Country of Residence",&#13;
|| '"|' || '"N/A"' -- "Country of Incorporation "&#13;
from &#13;
ft_T_cust cust , &#13;
(select cst_id, customer_id from ft_T_cuid cuid where cuid.end_tms is null and cuid.cst_id_ctxt_typ='STRATREF') STRATREF,&#13;
(select emid.empl_oid, emid.employee_id from ft_T_emid emid where emid.end_tms is null and emid.emp_id_ctxt_typ='PASSPORTID') PASSPORTID,&#13;
FT_T_ecur ECUR, &#13;
FT_T_EMPL EMPL, &#13;
FT_T_CUCH CUCH&#13;
where &#13;
    cust.cst_id=  ecur.cst_id &#13;
and ecur.empl_oid = empl.empl_oid&#13;
and empl.empl_oid = PASSPORTID.empl_oid(+)&#13;
--and ecur.rl_typ ='BENOWNRO' /*Commented out as no longer a valid representation of Connected Persons APPSUP-44510*/&#13;
and ecur.rl_typ not in ('PMHIACOF', 'SMHIACOF','ACCTMGR') and ecur.end_tms is null&#13;
and cust.cst_id = stratref.cst_id(+) &#13;
and empl.empl_oid = cuch.empl_oid (+)&#13;
and cust.end_tms is null and cust.cst_stat_typ IN( 'ACTIVE', 'CUCLINIT') /*included Customer Status 'CUCLINIT' APPSUP-44510*/&#13;
and empl.empl_oid is not null&#13;
and exists (select 1 from FT_T_CUGP cugp where cugp.END_TMS is null and cugp.CST_ID = cust.CST_ID and cugp.PRNT_CST_GRP_OID = 'CUGRMH0002')&#13;</text>
</com.j2fe.translation.template.QueryDefinition>
</businessobject>
</goldensource-package>
