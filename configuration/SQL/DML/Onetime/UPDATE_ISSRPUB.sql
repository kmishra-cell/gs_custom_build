UPDATE FT_T_MDDF SET modl_schema =  '<?xml version="1.0" encoding="UTF-8"?>
<model xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" id="ISSRPUB" xsi:noNamespaceSchemaLocation="../../schemas/Model.xsd">
	<occurrence table="ft_t_issr" id="ISSRPUB" level="1">
		<inputFields>
			<field name="ft_t_issr.company_match_id" dataType="STRING"/>
			<field name="ft_t_issr.data_src_id" dataType="STRING"/>
			<field name="ft_t_issr.data_stat_typ" dataType="STRING"/>
			<field name="ft_t_issr.end_tms" dataType="STRING"/>
			<field name="ft_t_issr.eusd_govt_ind" dataType="STRING"/>
			<field name="ft_t_issr.finsrl_typ" dataType="STRING"/>
			<field name="ft_t_issr.fins_inst_mnem" dataType="STRING"/>
			<field name="ft_t_issr.fiscal_yr_end_typ" dataType="STRING"/>
			<field name="ft_t_issr.fund_srce_typ" dataType="STRING"/>
			<field name="ft_t_issr.govt_agency_filing_ind" dataType="STRING"/>
			<field name="ft_t_issr.instr_issr_id" dataType="STRING"/>
			<field name="ft_t_issr.inst_legal_form_typ" dataType="STRING"/>
			<field name="ft_t_issr.inst_legal_nme" dataType="STRING"/>
			<field name="ft_t_issr.inst_mnem" dataType="STRING"/>
			<field name="ft_t_issr.issr_alph_srch_txt" dataType="STRING"/>
			<field name="ft_t_issr.issr_desc" dataType="STRING"/>
			<field name="ft_t_issr.issr_nme" dataType="STRING"/>
			<field name="ft_t_issr.issr_stat_typ" dataType="STRING"/>
			<field name="ft_t_issr.issr_typ" dataType="STRING"/>
			<field name="ft_t_issr.last_chg_tms" dataType="STRING"/>
			<field name="ft_t_issr.last_chg_usr_id" dataType="STRING"/>
			<field name="ft_t_issr.mult_shr_ind" dataType="STRING"/>
			<field name="ft_t_issr.pref_id_ctxt_typ" dataType="STRING"/>
			<field name="ft_t_issr.pref_issr_id" dataType="STRING"/>
			<field name="ft_t_issr.sec_form_15_ind" dataType="STRING"/>
			<field name="ft_t_issr.start_tms" dataType="STRING"/>
		</inputFields>
		<where activeOnly="false"/>
	</occurrence>
	<occurrence table="ft_t_ircl" id="IRCL" parentId="ISSRPUB" multiple="true">
		<inputFields>
			<field name="ft_t_ircl.clsf_purp_typ" dataType="STRING"/>
			<field name="ft_t_ircl.cl_value" dataType="STRING"/>
			<field name="ft_t_ircl.data_src_id" dataType="STRING"/>
			<field name="ft_t_ircl.data_stat_typ" dataType="STRING"/>
			<field name="ft_t_ircl.end_tms" dataType="STRING"/>
			<field name="ft_t_ircl.instr_issr_id" dataType="STRING"/>
			<field name="ft_t_ircl.issr_clsf_oid" dataType="STRING"/>
			<field name="ft_t_ircl.last_chg_tms" dataType="STRING"/>
			<field name="ft_t_ircl.last_chg_usr_id" dataType="STRING"/>
			<field name="ft_t_ircl.start_tms" dataType="STRING"/>
			<field name="ft_t_ircl.indus_cl_set_id" dataType="STRING"/>
		</inputFields>
		<where>
			<field name="ft_t_ircl.instr_id" dataType="STRING" isNull="true"/>
		</where>
	</occurrence>
	<occurrence table="ft_t_irde" id="IRDE" parentId="ISSRPUB" multiple="true">
		<inputFields>
			<field name="ft_t_irde.data_src_id" dataType="STRING"/>
			<field name="ft_t_irde.data_stat_typ" dataType="STRING"/>
			<field name="ft_t_irde.desc_usage_typ" dataType="STRING"/>
			<field name="ft_t_irde.end_tms" dataType="STRING"/>
			<field name="ft_t_irde.instr_issr_id" dataType="STRING"/>
			<field name="ft_t_irde.irde_oid" dataType="STRING"/>
			<field name="ft_t_irde.issr_desc" dataType="STRING"/>
			<field name="ft_t_irde.issr_nme" dataType="STRING"/>
			<field name="ft_t_irde.last_chg_tms" dataType="STRING"/>
			<field name="ft_t_irde.last_chg_usr_id" dataType="STRING"/>
			<field name="ft_t_irde.nls_cde" dataType="STRING"/>
			<field name="ft_t_irde.start_tms" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_irgu" id="IRGU" parentId="ISSRPUB" multiple="true">
		<inputFields>
			<field name="ft_t_irgu.data_src_id" dataType="STRING"/>
			<field name="ft_t_irgu.data_stat_typ" dataType="STRING"/>
			<field name="ft_t_irgu.end_tms" dataType="STRING"/>
			<field name="ft_t_irgu.gu_cnt" dataType="STRING"/>
			<field name="ft_t_irgu.gu_id" dataType="STRING"/>
			<field name="ft_t_irgu.gu_typ" dataType="STRING"/>
			<field name="ft_t_irgu.instr_issr_id" dataType="STRING"/>
			<field name="ft_t_irgu.issr_gu_desc" dataType="STRING"/>
			<field name="ft_t_irgu.issr_gu_purp_typ" dataType="STRING"/>
			<field name="ft_t_irgu.last_chg_tms" dataType="STRING"/>
			<field name="ft_t_irgu.last_chg_usr_id" dataType="STRING"/>
			<field name="ft_t_irgu.part_camt" dataType="STRING"/>
			<field name="ft_t_irgu.part_cpct" dataType="STRING"/>
			<field name="ft_t_irgu.part_curr_cde" dataType="STRING"/>
			<field name="ft_t_irgu.start_tms" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_irid" id="IRID" parentId="ISSRPUB" multiple="true">
		<inputFields>
			<field name="ft_t_irid.data_src_id" dataType="STRING"/>
			<field name="ft_t_irid.data_stat_typ" dataType="STRING"/>
			<field name="ft_t_irid.end_tms" dataType="STRING"/>
			<field name="ft_t_irid.gu_cnt" dataType="STRING"/>
			<field name="ft_t_irid.gu_id" dataType="STRING"/>
			<field name="ft_t_irid.gu_typ" dataType="STRING"/>
			<field name="ft_t_irid.instr_issr_id" dataType="STRING"/>
			<field name="ft_t_irid.issr_id" dataType="STRING"/>
			<field name="ft_t_irid.issr_id_ctxt_typ" dataType="STRING"/>
			<field name="ft_t_irid.issr_usage_typ" dataType="STRING"/>
			<field name="ft_t_irid.last_chg_tms" dataType="STRING"/>
			<field name="ft_t_irid.last_chg_usr_id" dataType="STRING"/>
			<field name="ft_t_irid.merge_uniq_oid" dataType="STRING"/>
			<field name="ft_t_irid.start_tms" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_fins" id="FINS" parentId="ISSRPUB">
		<inputFields>
			<field name="ft_t_fins.inst_nme" dataType="STRING"/>
			<field name="ft_t_fins.start_tms" dataType="DATETIME"/>
			<field name="ft_t_fins.pref_fins_id" dataType="STRING"/>
			<field name="ft_t_fins.pref_fins_id_ctxt_typ" dataType="STRING"/>
			<field name="ft_t_fins.business_structure_typ" dataType="STRING"/>
		</inputFields>
		<where activeOnly="false"/>
	</occurrence>
	<occurrence table="ft_t_fiid" id="FIID" parentId="FINS" multiple="true">
		<inputFields>
			<field name="ft_t_fiid.fins_id_ctxt_typ" dataType="STRING"/>
			<field name="ft_t_fiid.fins_id" dataType="STRING"/>
			<field name="ft_t_fiid.start_tms" dataType="DATETIME"/>
			<field name="ft_t_fiid.end_tms" dataType="DATETIME"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_figu" id="FIGU" parentId="FINS" multiple="true">
		<inputFields>
			<field name="ft_t_figu.fins_gu_purp_typ" dataType="STRING"/>
			<field name="ft_t_figu.gu_cnt" dataType="NUMBER"/>
			<field name="ft_t_figu.gu_id" dataType="STRING"/>
			<field name="ft_t_figu.gu_typ" dataType="STRING"/>
			<field name="ft_t_figu.start_tms" dataType="DATETIME"/>
			<field name="ft_t_figu.end_tms" dataType="DATETIME"/>
			<field name="ft_t_figu.last_chg_usr_id" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_fide" id="FIDE" parentId="FINS" multiple="true">
		<inputFields>
			<field name="ft_t_fide.inst_nme" dataType="STRING"/>
			<field name="ft_t_fide.start_tms" dataType="DATETIME"/>
			<field name="ft_t_fide.end_tms" dataType="DATETIME"/>
			<field name="ft_t_fide.desc_usage_typ" dataType="STRING"/>
			<field name="ft_t_fide.inst_desc" dataType="STRING"/>
			<field name="ft_t_fide.inst_legal_nme" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_gunt" id="GUNT" parentId="IRGU">
		<inputFields>
			<field name="ft_t_gunt.prnt_gu_cnt" dataType="NUMBER"/>
			<field name="ft_t_gunt.prnt_gu_id" dataType="STRING"/>
			<field name="ft_t_gunt.prnt_gu_typ" dataType="STRING"/>
			<field name="ft_t_gunt.start_tms" dataType="DATETIME"/>
			<field name="ft_t_gunt.stop_pay_ind" dataType="STRING"/>
			<field name="ft_t_gunt.cntry_cde" dataType="STRING"/>
			<field name="ft_t_gunt.cntry_subdiv_cde" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_guid" id="GUID" parentId="GUNT">
		<inputFields>
			<field name="ft_t_guid.gu_id_ctxt_typ" dataType="STRING"/>
			<field name="ft_t_guid.geo_unit_id" dataType="STRING"/>
			<field name="ft_t_guid.start_tms" dataType="DATETIME"/>
		</inputFields>
		<where>
			<field name="ft_t_guid.gu_id_ctxt_typ" dataType="STRING" value="ISO3"/>
		</where>
	</occurrence>
	<occurrence table="ft_t_gunt" id="FGUNT" parentId="FIGU">
		<inputFields>
			<field name="ft_t_gunt.prnt_gu_cnt" dataType="NUMBER"/>
			<field name="ft_t_gunt.prnt_gu_id" dataType="STRING"/>
			<field name="ft_t_gunt.prnt_gu_typ" dataType="STRING"/>
			<field name="ft_t_gunt.start_tms" dataType="DATETIME"/>
			<field name="ft_t_gunt.cntry_cde" dataType="STRING"/>
			<field name="ft_t_gunt.stop_pay_ind" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_guid" id="FGUID" parentId="FGUNT">
		<inputFields>
			<field name="ft_t_guid.gu_id_ctxt_typ" dataType="STRING"/>
			<field name="ft_t_guid.geo_unit_id" dataType="STRING"/>
			<field name="ft_t_guid.start_tms" dataType="DATETIME"/>
		</inputFields>
		<where>
			<field name="ft_t_guid.gu_id_ctxt_typ" dataType="STRING" value="ISO3"/>
		</where>
	</occurrence>
	<occurrence table="ft_t_ficl" id="FICL" parentId="FINS" multiple="true">
		<inputFields>
			<field name="ft_t_ficl.cl_value" dataType="STRING"/>
			<field name="ft_t_ficl.indus_cl_set_id" dataType="STRING"/>
			<field name="ft_t_ficl.start_tms" dataType="DATETIME"/>
			<field name="ft_t_ficl.last_chg_usr_id" dataType="STRING"/>
			<field name="ft_t_ficl.last_chg_tms" dataType="DATETIME"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_fist" id="FIST" parentId="FINS" multiple="true">
		<inputFields>
			<field name="ft_t_fist.data_src_id" dataType="STRING"/>
			<field name="ft_t_fist.data_stat_typ" dataType="STRING"/>
			<field name="ft_t_fist.denom_curr_cde" dataType="STRING"/>
			<field name="ft_t_fist.end_tms" dataType="DATETIME"/>
			<field name="ft_t_fist.last_chg_tms" dataType="DATETIME"/>
			<field name="ft_t_fist.last_chg_usr_id" dataType="STRING"/>
			<field name="ft_t_fist.start_tms" dataType="DATETIME"/>
			<field name="ft_t_fist.stat_val_camt" dataType="NUMBER"/>
			<field name="ft_t_fist.stat_char_val_txt" dataType="STRING"/>
			<field name="ft_t_fist.stat_val_tms" dataType="DATETIME"/>
			<field name="ft_t_fist.stat_val_dte" dataType="DATETIME"/>
			<field name="ft_t_fist.stat_def_id" dataType="STRING"/>
			<field name="ft_t_fist.stat_int_val_num" dataType="NUMBER"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_firt" id="FIRT" parentId="FINS" dbConstraint="FINS_RTNG_MHI" multiple="true">
		<inputFields>
			<field name="ft_t_firt.last_chg_tms" dataType="DATETIME"/>
			<field name="ft_t_firt.last_chg_usr_id" dataType="STRING"/>
			<field name="ft_t_firt.rtng_debt_cl_typ" dataType="STRING"/>
			<field name="ft_t_firt.rtng_direction_txt" dataType="STRING"/>
			<field name="ft_t_firt.rtng_direction_dte" dataType="DATETIME"/>
			<field name="ft_t_firt.rtng_eff_tms" dataType="DATETIME"/>
			<field name="ft_t_firt.rtng_purp_typ" dataType="STRING"/>
			<field name="ft_t_firt.rtng_snrty_typ" dataType="STRING"/>
			<field name="ft_t_firt.rtng_stat_typ" dataType="STRING"/>
			<field name="ft_t_firt.rtng_stat_tms" dataType="DATETIME"/>
			<field name="ft_t_firt.rtng_stat_reas_txt" dataType="STRING"/>
			<field name="ft_t_firt.rtng_cde" dataType="STRING"/>
			<field name="ft_t_firt.rtng_symbol_txt" dataType="STRING"/>
			<field name="ft_t_firt.short_term_rtng_txt" dataType="STRING"/>
			<field name="ft_t_firt.start_tms" dataType="DATETIME"/>
			<field name="ft_t_firt.end_tms" dataType="DATETIME"/>
			<field name="ft_t_firt.sys_eff_end_tms" dataType="DATETIME"/>
			<field name="ft_t_firt.watch_dte" dataType="DATETIME"/>
			<field name="ft_t_firt.watch_exp_dte" dataType="DATETIME"/>
			<field name="ft_t_firt.watch_reas_typ" dataType="STRING"/>
			<field name="ft_t_firt.watch_stat_typ" dataType="STRING"/>
			<field name="ft_t_firt.data_src_id" dataType="STRING"/>
			<field name="ft_t_firt.rtng_curr_typ" dataType="STRING"/>
			<field name="ft_t_firt.rtng_set_oid" dataType="STRING"/>
			<field name="ft_t_firt.rtng_curr_cde" dataType="STRING"/>
			<field name="ft_t_firt.rtng_class_txt" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_rtng" id="RTNG" parentId="FIRT">
		<inputFields>
			<field name="ft_t_rtng.rtng_set_mnem" dataType="STRING"/>
			<field name="ft_t_rtng.rtng_set_nme" dataType="STRING"/>
			<field name="ft_t_rtng.rtng_set_desc" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_ffrl" id="FFRL_IMMEDIATE" parentId="FINS" dbConstraint="FFRLF002" label="ImmediateFFRL">
		<where>
			<field name="ft_t_ffrl.rel_typ" dataType="STRING" value="PARNTCOF"/>
		</where>
	</occurrence>
	<occurrence table="ft_t_fins" id="FINS_IMMEDIATE" parentId="FFRL_IMMEDIATE" dbConstraint="FINSRelation" label="ImmediateParent">
		<inputFields>
			<field name="ft_t_fins.inst_nme" dataType="STRING"/>
			<field name="ft_t_fins.pref_fins_id" dataType="STRING"/>
			<field name="ft_t_fins.pref_fins_id_ctxt_typ" dataType="STRING"/>
			<field name="ft_t_fins.last_chg_usr_id" dataType="STRING"/>
			<field name="ft_t_fins.last_chg_tms" dataType="DATETIME"/>
			<field name="ft_t_fins.inst_desc" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_fiid" id="IMMEFIID" parentId="FINS_IMMEDIATE" dbConstraint="FIIDF001" multiple="true" label="FinancialInstitutionIdentifier">
		<inputFields>
			<field name="ft_t_fiid.data_src_id" dataType="STRING"/>
			<field name="ft_t_fiid.data_stat_typ" dataType="STRING"/>
			<field name="ft_t_fiid.fins_id_ctxt_typ" dataType="STRING"/>
			<field name="ft_t_fiid.fins_id" dataType="STRING"/>
			<field name="ft_t_fiid.gu_typ" dataType="STRING"/>
			<field name="ft_t_fiid.start_tms" dataType="DATETIME"/>
			<field name="ft_t_fiid.gu_id" dataType="STRING"/>
			<field name="ft_t_fiid.gu_cnt" dataType="NUMBER"/>
			<field name="ft_t_fiid.end_tms" dataType="DATETIME"/>
			<field name="ft_t_fiid.inst_symbol_stat_typ" dataType="STRING"/>
			<field name="ft_t_fiid.inst_symbol_stat_tms" dataType="DATETIME"/>
			<field name="ft_t_fiid.inst_usage_typ" dataType="STRING"/>
			<field name="ft_t_fiid.last_chg_tms" dataType="DATETIME"/>
			<field name="ft_t_fiid.last_chg_usr_id" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_fins" id="ULT_P_ISSR" parentId="FINS" dbConstraint="FINSULTPAR_MODEL" label="UltimateParent">
		<inputFields>
			<field name="ft_t_fins.inst_nme" dataType="STRING"/>
			<field name="ft_t_fins.pref_fins_id" dataType="STRING"/>
			<field name="ft_t_fins.pref_fins_id_ctxt_typ" dataType="STRING"/>
			<field name="ft_t_fins.last_chg_tms" dataType="DATETIME"/>
			<field name="ft_t_fins.last_chg_usr_id" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_figu" id="ULT_P_FIGU" parentId="ULT_P_ISSR" label="FinancialInstitutionGeoUnitPrt" multiple="true">
		<inputFields>
			<field name="ft_t_figu.data_src_id" dataType="STRING"/>
			<field name="ft_t_figu.data_stat_typ" dataType="STRING"/>
			<field name="ft_t_figu.fins_gu_desc" dataType="STRING"/>
			<field name="ft_t_figu.fins_gu_purp_typ" dataType="STRING"/>
			<field name="ft_t_figu.gu_cnt" dataType="NUMBER"/>
			<field name="ft_t_figu.gu_id" dataType="STRING"/>
			<field name="ft_t_figu.last_chg_tms" dataType="DATETIME"/>
			<field name="ft_t_figu.last_chg_usr_id" dataType="STRING"/>
			<field name="ft_t_figu.start_tms" dataType="DATETIME"/>
			<field name="ft_t_figu.gu_typ" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_fiid" id="ULT_P_FIID" parentId="ULT_P_ISSR" label="FinancialInstitutionIdentifier" multiple="true">
		<inputFields>
			<field name="ft_t_fiid.data_src_id" dataType="STRING"/>
			<field name="ft_t_fiid.data_stat_typ" dataType="STRING"/>
			<field name="ft_t_fiid.end_tms" dataType="DATETIME"/>
			<field name="ft_t_fiid.fins_id_ctxt_typ" dataType="STRING"/>
			<field name="ft_t_fiid.fins_id" dataType="STRING"/>
			<field name="ft_t_fiid.gu_cnt" dataType="NUMBER"/>
			<field name="ft_t_fiid.gu_id" dataType="STRING"/>
			<field name="ft_t_fiid.gu_typ" dataType="STRING"/>
			<field name="ft_t_fiid.inst_symbol_stat_typ" dataType="STRING"/>
			<field name="ft_t_fiid.inst_symbol_stat_tms" dataType="DATETIME"/>
			<field name="ft_t_fiid.inst_usage_typ" dataType="STRING"/>
			<field name="ft_t_fiid.last_chg_tms" dataType="DATETIME"/>
			<field name="ft_t_fiid.last_chg_usr_id" dataType="STRING"/>
			<field name="ft_t_fiid.start_tms" dataType="DATETIME"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_issr" id="ULTP_ISSR" parentId="ULT_P_ISSR" label="Issuer">
		<inputFields>
			<field name="ft_t_issr.issr_nme" dataType="STRING"/>
			<field name="ft_t_issr.data_src_id" dataType="STRING"/>
			<field name="ft_t_issr.data_stat_typ" dataType="STRING"/>
			<field name="ft_t_issr.issr_desc" dataType="STRING"/>
			<field name="ft_t_issr.inst_legal_nme" dataType="STRING"/>
			<field name="ft_t_issr.last_chg_usr_id" dataType="STRING"/>
			<field name="ft_t_issr.last_chg_tms" dataType="DATETIME"/>
			<field name="ft_t_issr.issr_typ" dataType="STRING"/>
			<field name="ft_t_issr.issr_stat_typ" dataType="STRING"/>
			<field name="ft_t_issr.mult_shr_ind" dataType="STRING"/>
			<field name="ft_t_issr.end_tms" dataType="DATETIME"/>
			<field name="ft_t_issr.start_tms" dataType="DATETIME"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_irid" id="ULTP_IRID" parentId="ULTP_ISSR" label="IssuerIdentifier" multiple="true">
		<inputFields>
			<field name="ft_t_irid.issr_id" dataType="STRING"/>
			<field name="ft_t_irid.issr_id_ctxt_typ" dataType="STRING"/>
			<field name="ft_t_irid.data_stat_typ" dataType="STRING"/>
			<field name="ft_t_irid.data_src_id" dataType="STRING"/>
			<field name="ft_t_irid.issr_usage_typ" dataType="STRING"/>
			<field name="ft_t_irid.last_chg_tms" dataType="DATETIME"/>
			<field name="ft_t_irid.last_chg_usr_id" dataType="STRING"/>
			<field name="ft_t_irid.end_tms" dataType="DATETIME"/>
			<field name="ft_t_irid.start_tms" dataType="DATETIME"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_issr" id="IMMP_ISSR" parentId="FINS_IMMEDIATE" label="Issuer">
		<inputFields>
			<field name="ft_t_issr.data_src_id" dataType="STRING"/>
			<field name="ft_t_issr.data_stat_typ" dataType="STRING"/>
			<field name="ft_t_issr.end_tms" dataType="DATETIME"/>
			<field name="ft_t_issr.inst_legal_nme" dataType="STRING"/>
			<field name="ft_t_issr.issr_desc" dataType="STRING"/>
			<field name="ft_t_issr.issr_nme" dataType="STRING"/>
			<field name="ft_t_issr.issr_stat_typ" dataType="STRING"/>
			<field name="ft_t_issr.issr_typ" dataType="STRING"/>
			<field name="ft_t_issr.last_chg_tms" dataType="DATETIME"/>
			<field name="ft_t_issr.last_chg_usr_id" dataType="STRING"/>
			<field name="ft_t_issr.mult_shr_ind" dataType="STRING"/>
			<field name="ft_t_issr.start_tms" dataType="DATETIME"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_irid" id="IMMP_IRID" parentId="IMMP_ISSR" label="IssuerIdentifier" multiple="true">
		<inputFields>
			<field name="ft_t_irid.issr_id" dataType="STRING"/>
			<field name="ft_t_irid.issr_id_ctxt_typ" dataType="STRING"/>
			<field name="ft_t_irid.data_stat_typ" dataType="STRING"/>
			<field name="ft_t_irid.data_src_id" dataType="STRING"/>
			<field name="ft_t_irid.end_tms" dataType="DATETIME"/>
			<field name="ft_t_irid.issr_usage_typ" dataType="STRING"/>
			<field name="ft_t_irid.last_chg_tms" dataType="DATETIME"/>
			<field name="ft_t_irid.last_chg_usr_id" dataType="STRING"/>
			<field name="ft_t_irid.start_tms" dataType="DATETIME"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_irst" id="IRST" parentId="ISSRPUB" label="Issuer Statistic" multiple="true">
		<inputFields>
			<field name="ft_t_irst.data_src_id" dataType="STRING"/>
			<field name="ft_t_irst.data_stat_typ" dataType="STRING"/>
			<field name="ft_t_irst.end_tms" dataType="DATETIME"/>
			<field name="ft_t_irst.denom_curr_cde" dataType="STRING"/>
			<field name="ft_t_irst.last_chg_tms" dataType="DATETIME"/>
			<field name="ft_t_irst.last_chg_usr_id" dataType="STRING"/>
			<field name="ft_t_irst.start_tms" dataType="DATETIME"/>
			<field name="ft_t_irst.stat_val_camt" dataType="NUMBER"/>
			<field name="ft_t_irst.stat_char_val_txt" dataType="STRING"/>
			<field name="ft_t_irst.stat_val_tms" dataType="DATETIME"/>
			<field name="ft_t_irst.stat_val_dte" dataType="DATETIME"/>
			<field name="ft_t_irst.stat_def_id" dataType="STRING"/>
			<field name="ft_t_irst.stat_int_val_num" dataType="NUMBER"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_irgp" id="IRGP" parentId="ISSRPUB" label="IRGP" multiple="true">
		<inputFields>
			<field name="ft_t_irgp.start_tms" dataType="DATETIME"/>
			<field name="ft_t_irgp.part_camt" dataType="NUMBER"/>
			<field name="ft_t_irgp.part_curr_cde" dataType="STRING"/>
			<field name="ft_t_irgp.part_cpct" dataType="NUMBER"/>
			<field name="ft_t_irgp.prt_purp_typ" dataType="STRING"/>
			<field name="ft_t_irgp.data_src_id" dataType="STRING"/>
			<field name="ft_t_irgp.data_stat_typ" dataType="STRING"/>
			<field name="ft_t_irgp.end_tms" dataType="DATETIME"/>
			<field name="ft_t_irgp.issr_grp_oid" dataType="STRING"/>
			<field name="ft_t_irgp.last_chg_tms" dataType="DATETIME"/>
			<field name="ft_t_irgp.last_chg_usr_id" dataType="STRING"/>
			<field name="ft_t_irgp.prt_desc" dataType="STRING"/>
			<field name="ft_t_irgp.prnt_issr_grp_oid" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_irgr" id="IRGR" parentId="IRGP" label="IRGR" dbConstraint="IRGPF001">
		<inputFields>
			<field name="ft_t_irgr.issr_grp_id" dataType="STRING"/>
			<field name="ft_t_irgr.issr_grp_oid" dataType="STRING"/>
			<field name="ft_t_irgr.grp_nme" dataType="STRING"/>
			<field name="ft_t_irgr.grp_purp_typ" dataType="STRING"/>
			<field name="ft_t_irgr.grp_desc" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_pbat" id="PBAT" parentId="ISSRPUB" label="PBAT" dbConstraint="PBATISSR">
		<inputFields>
			<field name="ft_t_pbat.pub_sq_num" dataType="NUMBER" doNotPublish="true"/>
			<field name="ft_t_pbat.published_tbl_id" dataType="STRING" doNotPublish="true"/>
			<field name="ft_t_pbat.pub_audit_id" dataType="STRING" doNotPublish="true"/>
			<field name="ft_t_pbat.last_chg_tms" dataType="DATETIME"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_upd1" id="UPD1ISSR" parentId="ISSRPUB" label="UPD1ISSR" dbConstraint="UPD1ISSR">
		<inputFields>
			<field name="ft_t_upd1.entity_tbl_typ" dataType="STRING"/>
			<field name="ft_t_upd1.version" dataType="NUMBER"/>
			<field name="ft_t_upd1.updated_tmsmp" dataType="DATETIME"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_upd1" id="UPD1FINS" parentId="FINS" label="UPD1FINS" dbConstraint="UPD1FINS">
		<inputFields>
			<field name="ft_t_upd1.version" dataType="NUMBER"/>
			<field name="ft_t_upd1.updated_tmsmp" dataType="DATETIME"/>
			<field name="ft_t_upd1.entity_tbl_typ" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_incl" id="INCL" parentId="FICL" label="INCL">
		<inputFields>
			<field name="ft_t_incl.level_num" dataType="STRING"/>
		</inputFields>
		<where>
			<field name="ft_t_incl.indus_cl_set_id" dataType="STRING" value="GICS"/>
		</where>
	</occurrence>
	<occurrence table="ft_t_ccrf" id="CCRF" parentId="FINS" label="CrossReferenceForAddress" multiple="true">
		<inputFields>
			<field name="ft_t_ccrf.cntl_cross_ref_oid" dataType="STRING"/>
			<field name="ft_t_ccrf.finr_inst_mnem" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_adtp" id="ADTP" parentId="CCRF" label="Address Type Usage" multiple="true">
		<inputFields>
			<field name="ft_t_adtp.addr_typ" dataType="STRING"/>
			<field name="ft_t_adtp.start_tms" dataType="DATETIME"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_eadr" id="EADR" parentId="ADTP" label="Electronic Address" multiple="true">
		<inputFields>
			<field name="ft_t_eadr.fax_num_id" dataType="STRING"/>
			<field name="ft_t_eadr.phone_num_id" dataType="STRING"/>
			<field name="ft_t_eadr.start_tms" dataType="DATETIME"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_madr" id="MADR" parentId="ADTP" label="Mailing Address" multiple="true">
		<inputFields>
			<field name="ft_t_madr.addr_ln1_txt" dataType="STRING"/>
			<field name="ft_t_madr.addr_ln2_txt" dataType="STRING"/>
			<field name="ft_t_madr.addr_ln3_txt" dataType="STRING"/>
			<field name="ft_t_madr.addr_ln4_txt" dataType="STRING"/>
			<field name="ft_t_madr.cntry_nme" dataType="STRING"/>
			<field name="ft_t_madr.city_nme" dataType="STRING"/>
			<field name="ft_t_madr.postal_cde" dataType="STRING"/>
			<field name="ft_t_madr.start_tms" dataType="DATETIME"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_rtql" id="RTQL" parentId="FIRT" label="Rating Qualifier" multiple="true">
		<inputFields>
			<field name="ft_t_rtql.rtng_qual_txt" dataType="STRING"/>
			<field name="ft_t_rtql.rtng_qual_typ" dataType="STRING"/>
			<field name="ft_t_rtql.rtng_qual_reg_id_ind" dataType="STRING"/>
			<field name="ft_t_rtql.last_chg_tms" dataType="DATETIME"/>
			<field name="ft_t_rtql.last_chg_usr_id" dataType="STRING"/>
			<field name="ft_t_rtql.data_src_id" dataType="STRING"/>
			<field name="ft_t_rtql.data_stat_typ" dataType="STRING"/>
			<field name="ft_t_rtql.start_tms" dataType="DATETIME"/>
		</inputFields>
	</occurrence>
	<relations>
		<table name="FT_T_IRCL">
			<relation relatedTable="FT_T_ISSR" name="DIST_IRCL">
				<fromColumns>
					<column name="INSTR_ISSR_ID"/>
				</fromColumns>
				<toColumns>
					<column name="INSTR_ISSR_ID"/>
				</toColumns>
				<condition>
					<sql>
#FROM_TABLE#.issr_clsf_oid in
(
select issr_clsf_oid from
(
select issr_clsf_oid, row_number()
over(partition by instr_issr_id, clsf_oid, cl_value order by clsf_oid, cl_value) cnt
from ft_t_ircl
where (end_tms is null or end_tms > sysdate())
) where cnt=1
)
</sql>
	</condition>
			</relation>
		</table>
		<table name="FT_T_FINS">
			<relation relatedTable="FT_T_ISSR" name="FINSISSR">
				<fromColumns>
					<column name="INST_MNEM"/>
				</fromColumns>
				<toColumns>
					<column name="FINS_INST_MNEM"/>
				</toColumns>
			</relation>
		</table>
		<table name="FT_T_FIRT">
			<relation relatedTable="FT_T_FINS" name="FINS_RTNG_MHI">
				<fromColumns>
					<column name="INST_MNEM"/>
				</fromColumns>
				<toColumns>
					<column name="INST_MNEM"/>
				</toColumns>
				<condition>
					<sql>#FROM_TABLE#.SYS_EFF_END_TMS IS NULL</sql>
				</condition>
			</relation>
		</table>
		<table name="FT_T_FFRL">
			<relation relatedTable="FT_T_FINS" name="FINSRelation">
				<fromColumns>
					<column name="PRNT_INST_MNEM"/>
				</fromColumns>
				<toColumns>
					<column name="INST_MNEM"/>
				</toColumns>
			</relation>
		</table>
		<table name="FT_T_FINS">
			<relation relatedTable="FT_T_FINS" name="FINSULTPAR_MODEL">
					<fromColumns>
					<column name="NLS_CDE"/>
				</fromColumns>
				<toColumns>
					<column name="NLS_CDE"/>
				</toColumns>				
				<condition>
					<sql>#TO_TABLE#.inst_mnem=(select mhi_fins_up(#FROM_TABLE#.inst_mnem))</sql>
				</condition>
			</relation>
		</table>
		<table name="FT_T_PBAT">
			<relation relatedTable="FT_T_ISSR" name="PBATISSR">
				<fromColumns>
					<column name="PUB_CROSS_REF_ID"/>
				</fromColumns>
				<toColumns>
					<column name="INSTR_ISSR_ID"/>
				</toColumns>
				<condition>
					<sql>#FROM_TABLE#.published_tbl_id=''ISSR''</sql>
				</condition>
			</relation>
		</table>
		<table name="FT_T_UPD1">
			<relation relatedTable="FT_T_ISSR" name="UPD1ISSR">
				<fromColumns>
					<column name="XREF_TBL_ROW_OID"/>
				</fromColumns>
				<toColumns>
					<column name="INSTR_ISSR_ID"/>
				</toColumns>
				<condition>
					<sql>#FROM_TABLE#.entity_tbl_typ=''ISSR'' and #FROM_TABLE#.sequenceno = (select max( sequenceno ) from ft_t_upd1 upma where upma.xref_tbl_row_oid = #FROM_TABLE#.xref_tbl_row_oid )</sql>
				</condition>
			</relation>
		</table>
		<table name="FT_T_UPD1">
			<relation relatedTable="FT_T_FINS" name="UPD1FINS">
				<fromColumns>
					<column name="XREF_TBL_ROW_OID"/>
				</fromColumns>
				<toColumns>
					<column name="INST_MNEM"/>
				</toColumns>
				<condition>
					<sql>#FROM_TABLE#.entity_tbl_typ=''FINS'' and #FROM_TABLE#.sequenceno = (select max( sequenceno ) from ft_t_upd1 upma where upma.xref_tbl_row_oid = #FROM_TABLE#.xref_tbl_row_oid )</sql>
				</condition>
			</relation>
		</table>
	</relations>
</model>', last_chg_tms= SYSDATE() WHERE modl_id = 'ISSRPUB';