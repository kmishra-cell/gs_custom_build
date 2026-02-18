UPDATE FT_T_MDDF SET modl_schema = '<?xml version="1.0" encoding="UTF-8"?>
<model xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="../../schemas/Model.xsd" id="LAGR_PUB">
	<occurrence id="LAGR_PUB" table="ft_t_lagr" label="LegalAgreement">
		<inputFields>
			<field name="ft_t_lagr.agrmnt_amend_dte" dataType="DATETIME"/>
			<field name="ft_t_lagr.agrmnt_amend_dte" dataType="DATETIME"/>
			<field name="ft_t_lagr.agrmnt_desc" dataType="STRING"/>
			<field name="ft_t_lagr.agrmnt_loc_txt" dataType="STRING"/>
			<field name="ft_t_lagr.agrmnt_sign_dte" dataType="DATETIME"/>
			<field name="ft_t_lagr.agrmnt_stat_tms" dataType="DATETIME"/>
			<field name="ft_t_lagr.agrmnt_amend_desc" dataType="STRING"/>
			<field name="ft_t_lagr.agrmnt_aprvl_dte" dataType="DATETIME"/>
			<field name="ft_t_lagr.agrmnt_cmnt_txt" dataType="STRING"/>
			<field name="ft_t_lagr.agrmnt_negotn_instruc_dte" dataType="DATETIME"/>
			<field name="ft_t_lagr.agrmnt_termintn_dte" dataType="DATETIME"/>
			<field name="ft_t_lagr.agrmnt_version_id" dataType="NUMBER"/>
			<field name="ft_t_lagr.legal_opinion_ind" dataType="STRING"/>
			<field name="ft_t_lagr.ev_dflt_curr_cde" dataType="STRING"/>
			<field name="ft_t_lagr.org_id" dataType="STRING"/>
			<field name="ft_t_lagr.agrmnt_purp_typ" dataType="STRING"/>
			<field name="ft_t_lagr.prnt_lagr_oid" dataType="STRING"/>
			<field name="ft_t_lagr.agrmnt_stat_typ" dataType="STRING"/>
			<field name="ft_t_lagr.agrmnt_typ" dataType="STRING"/>
			<field name="ft_t_lagr.leg_juris_nme" dataType="STRING"/>
			<field name="ft_t_lagr.leg_agrmnt_id" dataType="STRING"/>
			<field name="ft_t_lagr.agrmnt_curr_cde" dataType="STRING"/>
			<field name="ft_t_lagr.end_tms" dataType="DATETIME"/>
		</inputFields>
		<where activeOnly="false"/>
	</occurrence>
	<occurrence table="ft_t_laid" id="LAGRLAID" parentId="LAGR_PUB" label="LegalIdentifier">
		<inputFields>
			<field name="ft_t_laid.start_tms" dataType="DATETIME"/>
			<field name="ft_t_laid.legal_agrmnt_id" dataType="STRING"/>
			<field name="ft_t_laid.lagr_id_ctxt_typ" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_afd1" id="LAGRAFD1MHIWK" parentId="LAGR_PUB" multiple="true" label="MHIFreqWeekly">
		<inputFields>
			<field name="ft_t_afd1.freq_dy_mnth_typ" dataType="STRING"/>
			<field name="ft_t_afd1.freq_dy_week_typ" dataType="STRING"/>
			<field name="ft_t_afd1.freq_mnth_ord_typ" dataType="STRING"/>
			<field name="ft_t_afd1.start_tms" dataType="DATETIME"/>
		</inputFields>
		<where>
			<field name="ft_t_afd1.rl_typ" dataType="STRING" value="MHIWK"/>
		</where>
	</occurrence>
	<occurrence table="ft_t_afd1" id="LAGRAFD1MHIMN" parentId="LAGR_PUB" multiple="true" label="MHIFreqMonth">
		<inputFields>
			<field name="ft_t_afd1.freq_dy_mnth_typ" dataType="STRING"/>
			<field name="ft_t_afd1.freq_dy_week_typ" dataType="STRING"/>
			<field name="ft_t_afd1.freq_mnth_ord_typ" dataType="STRING"/>
			<field name="ft_t_afd1.start_tms" dataType="DATETIME"/>
		</inputFields>
		<where>
			<field name="ft_t_afd1.rl_typ" dataType="STRING" value="MHIMN"/>
		</where>
	</occurrence>
	<occurrence table="ft_t_afd1" id="LAGRAFD1MHIRMN" parentId="LAGR_PUB" multiple="true" label="MHIFreqRecMonth">
		<inputFields>
			<field name="ft_t_afd1.freq_dy_mnth_typ" dataType="STRING"/>
			<field name="ft_t_afd1.freq_dy_week_typ" dataType="STRING"/>
			<field name="ft_t_afd1.freq_mnth_ord_typ" dataType="STRING"/>
			<field name="ft_t_afd1.start_tms" dataType="DATETIME"/>
		</inputFields>
		<where>
			<field name="ft_t_afd1.rl_typ" dataType="STRING" value="MHIRMN"/>
		</where>
	</occurrence>
	<occurrence table="ft_t_clm1" id="LAGRCLM1" parentId="LAGR_PUB" label="CollateralManagement">
		<inputFields>
			<field name="ft_t_clm1.col_disp_ind" dataType="STRING"/>
			<field name="ft_t_clm1.start_tms" dataType="DATETIME"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_laan" id="LAGRLAAN" parentId="LAGR_PUB" label="AgreementAnnexuresCSA" multiple="true">
		<inputFields>
			<field name="ft_t_laan.annex_sign_dte" dataType="DATETIME"/>
			<field name="ft_t_laan.bi_lateral_ind" dataType="STRING"/>
			<field name="ft_t_laan.annex_curr_cde" dataType="STRING"/>
			<field name="ft_t_laan.annex_ammend_dte" dataType="DATETIME"/>
			<field name="ft_t_laan.annex_id" dataType="NUMBER"/>
			<field name="ft_t_laan.annex_termintn_dte" dataType="DATETIME"/>
			<field name="ft_t_laan.annex_mgt_loc_typ" dataType="STRING"/>
			<field name="ft_t_laan.annex_negotn_instruc_dte" dataType="DATETIME"/>
			<field name="ft_t_laan.annex_aprvl_dte" dataType="DATETIME"/>
			<field name="ft_t_laan.annex_amend_desc" dataType="STRING"/>
			<field name="ft_t_laan.start_tms" dataType="DATETIME"/>
			<field name="ft_t_laan.annex_typ" dataType="STRING"/>
			<field name="ft_t_laan.annex_stat_typ" dataType="STRING"/>
			<field name="ft_t_laan.annex_eff_dte" dataType="DATETIME"/>
			<field name="ft_t_laan.annex_modl_typ" dataType="STRING"/>
		</inputFields>
		<where>
			<field name="ft_t_laan.annex_modl_typ" dataType="STRING" value="CSA"/>
		</where>
	</occurrence>
	<occurrence table="ft_t_laap" id="LAGRLAANLAAP" parentId="LAGRLAAN" label="AgreementAnnexuresCSACollateralDetails">
		<inputFields>
			<field name="ft_t_laap.coll_dispute_ind" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_idmv" id="LAANIDMVANNEX_TYP" parentId="LAGRLAAN" label="CreditSupportType" dbConstraint="LAANIDMVANNEXTYP">
		<inputFields>
			<field name="ft_t_idmv.intrnl_dmn_val_nme" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_idmv" id="LAANIDMVANNEX_STAT_TYP" parentId="LAGRLAAN" label="AnnexStatus" dbConstraint="LAANIDMVANNEXSTATTYP">
		<inputFields>
			<field name="ft_t_idmv.intrnl_dmn_val_nme" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_laan" id="LAGRLAANVM" parentId="LAGR_PUB" label="AgreementAnnexuresVM">
		<where>
			<field name="ft_t_laan.annex_modl_typ" dataType="STRING" value="VM"/>
		</where>
		<inputFields>
			<field name="ft_t_laan.annex_aprvl_dte" dataType="DATETIME"/>
			<field name="ft_t_laan.annex_negotn_instruc_dte" dataType="DATETIME"/>
			<field name="ft_t_laan.annex_stat_typ" dataType="STRING"/>
			<field name="ft_t_laan.annex_termintn_dte" dataType="DATETIME"/>
			<field name="ft_t_laan.annex_curr_cde" dataType="STRING"/>
			<field name="ft_t_laan.annex_sign_dte" dataType="DATETIME"/>
			<field name="ft_t_laan.annex_typ" dataType="STRING"/>
			<field name="ft_t_laan.annex_eff_dte" dataType="DATETIME"/>
			<field name="ft_t_laan.start_tms" dataType="DATETIME"/>
			<field name="ft_t_laan.annex_modl_typ" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_laap" id="LAGRLAANVMLAAP" parentId="LAGRLAANVM" label="AgreementAnnexuresVMCollateralDetails">
		<inputFields>
			<field name="ft_t_laap.coll_dispute_ind" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_laan" id="LAGRLAANIMD" parentId="LAGR_PUB" label="AgreementAnnexuresIMD">
		<inputFields>
			<field name="ft_t_laan.annex_aprvl_dte" dataType="DATETIME"/>
			<field name="ft_t_laan.annex_negotn_instruc_dte" dataType="DATETIME"/>
			<field name="ft_t_laan.annex_stat_typ" dataType="STRING"/>
			<field name="ft_t_laan.annex_termintn_dte" dataType="DATETIME"/>
			<field name="ft_t_laan.annex_ammend_dte" dataType="DATETIME"/>
			<field name="ft_t_laan.annex_curr_cde" dataType="STRING"/>
			<field name="ft_t_laan.annex_sign_dte" dataType="DATETIME"/>
			<field name="ft_t_laan.annex_eff_dte" dataType="DATETIME"/>
			<field name="ft_t_laan.annex_typ" dataType="STRING"/>
			<field name="ft_t_laan.start_tms" dataType="DATETIME"/>
			<field name="ft_t_laan.annex_modl_typ" dataType="STRING"/>
		</inputFields>
		<where>
			<field name="ft_t_laan.annex_modl_typ" dataType="STRING" value="IM"/>
		</where>
	</occurrence>
	<occurrence table="ft_t_laap" id="LAGRLAANIMDLAAP" parentId="LAGRLAANIMD" label="AgreementAnnexuresIMDCollateralDetails">
		<inputFields>
			<field name="ft_t_laap.coll_dispute_ind" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_flar" id="FLARMHI" parentId="LAGR_PUB" label="FinancialInstitutionMHIAgreement" dbConstraint="flarf002">
		<inputFields>
			<field name="ft_t_flar.auto_termin_ev_appls_ind" dataType="STRING"/>
			<field name="ft_t_flar.ed_ate_appls_ind" dataType="STRING"/>
			<field name="ft_t_flar.thshld_cpct" dataType="NUMBER"/>
			<field name="ft_t_flar.thshld_curr_cde" dataType="STRING"/>
			<field name="ft_t_flar.thshld_accel_camt" dataType="NUMBER"/>
			<field name="ft_t_flar.rl_desc" dataType="STRING"/>
			<field name="ft_t_flar.start_tms" dataType="DATETIME"/>
			<field name="ft_t_flar.thshld_oper_typ" dataType="STRING"/>
			<field name="ft_t_flar.thshld_comp_typ" dataType="STRING"/>
			<field name="ft_t_flar.dflt_strn_cmnt_txt" dataType="STRING"/>
			<field name="ft_t_flar.agncy_tran_applies_ind" dataType="STRING"/>
			<field name="ft_t_flar.prncpl_tran_applies_ind" dataType="STRING"/>
		</inputFields>
		<where>
			<field name="ft_t_flar.rl_typ" dataType="STRING" value="MIZUHO"/>
		</where>
	</occurrence>
	<occurrence table="ft_t_flar" id="FLARCPTY" parentId="LAGR_PUB" label="FinancialInstitutionCPTYAgreement" dbConstraint="flarf002">
		<inputFields>
			<field name="ft_t_flar.auto_termin_ev_appls_ind" dataType="STRING"/>
			<field name="ft_t_flar.cem_applies_ind" dataType="STRING"/>
			<field name="ft_t_flar.ed_ate_appls_ind" dataType="STRING"/>
			<field name="ft_t_flar.thshld_cpct" dataType="NUMBER"/>
			<field name="ft_t_flar.thshld_curr_cde" dataType="STRING"/>
			<field name="ft_t_flar.thshld_accel_camt" dataType="NUMBER"/>
			<field name="ft_t_flar.rl_desc" dataType="STRING"/>
			<field name="ft_t_flar.start_tms" dataType="DATETIME"/>
			<field name="ft_t_flar.thshld_oper_typ" dataType="STRING"/>
			<field name="ft_t_flar.thshld_comp_typ" dataType="STRING"/>
		</inputFields>
		<where>
			<field name="ft_t_flar.rl_typ" dataType="STRING" value="CPTY"/>
		</where>
	</occurrence>
	<occurrence table="ft_t_laap" id="MHIFLARLAAP" parentId="FLARMHI" label="AnnexureParticipantsMHI">
		<inputFields>
			<field name="ft_t_laap.interest_adj_typ" dataType="STRING"/>
			<field name="ft_t_laap.interest_tsfr_typ" dataType="STRING"/>
			<field name="ft_t_laap.ev_dflt_curr_cde" dataType="STRING"/>
			<field name="ft_t_laap.early_term_pay_curr_cde" dataType="STRING"/>
			<field name="ft_t_laap.independent_coll_camt" dataType="NUMBER"/>
			<field name="ft_t_laap.start_tms" dataType="DATETIME"/>
			<field name="ft_t_laap.thshld_meth_txt" dataType="STRING"/>
			<field name="ft_t_laap.thshld_meth_stat_tms" dataType="DATETIME" label="Independent Amount Status Date/Time"/>
			<field name="ft_t_laap.annex_prt_modl_typ" dataType="STRING"/>
		</inputFields>
		<where>
			<field name="ft_t_laap.annex_prt_modl_typ" dataType="STRING" value="CSA"/>
		</where>
	</occurrence>
	<occurrence table="ft_t_laap" id="CPTYFLARLAAP" parentId="FLARCPTY" label="AnnexureParticipantsCPTY">
		<inputFields>
			<field name="ft_t_laap.interest_adj_typ" dataType="STRING"/>
			<field name="ft_t_laap.interest_tsfr_typ" dataType="STRING"/>
			<field name="ft_t_laap.ev_dflt_curr_cde" dataType="STRING"/>
			<field name="ft_t_laap.early_term_pay_curr_cde" dataType="STRING"/>
			<field name="ft_t_laap.annex_prt_curr_cde" dataType="STRING"/>
			<field name="ft_t_laap.governing_law_cntry_cde" dataType="STRING"/>
			<field name="ft_t_laap.independent_coll_camt" dataType="NUMBER"/>
			<field name="ft_t_laap.start_tms" dataType="DATETIME"/>
			<field name="ft_t_laap.thshld_meth_txt" dataType="STRING"/>
			<field name="ft_t_laap.thshld_meth_stat_tms" dataType="DATETIME" label="Independent Amount Status Date/Time"/>
			<field name="ft_t_laap.annex_prt_modl_typ" dataType="STRING"/>
		</inputFields>
		<where>
			<field name="ft_t_laap.annex_prt_modl_typ" dataType="STRING" value="CSA"/>
		</where>
	</occurrence>
	<occurrence table="ft_t_laip" id="AGRMNTLAIP" parentId="FLARCPTY" label="AgreementInvolvedParty">
		<inputFields>
			<field name="ft_t_laip.netting_desc" dataType="STRING"/>
			<field name="ft_t_laip.netting_applies_ind" dataType="STRING"/>
			<field name="ft_t_laip.netting_typ" dataType="STRING"/>
			<field name="ft_t_laip.start_tms" dataType="DATETIME"/>
		</inputFields>
		<where>
			<field name="ft_t_laip.agrmnt_invl_party_typ" dataType="STRING" value="CPTY"/>
		</where>
	</occurrence>
	<occurrence table="ft_t_laat" id="FLARLAATMHI" parentId="MHIFLARLAAP" label="AgreementThresholdMHI">
		<inputFields>
			<field name="ft_t_laat.min_tsfr_camt" dataType="NUMBER"/>
			<field name="ft_t_laat.ret_rnd_camt" dataType="NUMBER"/>
			<field name="ft_t_laat.thshld_camt" dataType="NUMBER"/>
			<field name="ft_t_laat.start_tms" dataType="DATETIME"/>
			<field name="ft_t_laat.thshld_val_fq_sp_typ" dataType="STRING"/>
			<field name="ft_t_laat.min_tsfr_meth_txt" dataType="STRING"/>
			<field name="ft_t_laat.thshld_meth_txt" dataType="STRING"/>
			<field name="ft_t_laat.thshld_stat_tms" dataType="DATETIME" label="Threshold Amount Status Date/Time"/>
			<field name="ft_t_laat.mta_stat_tms" dataType="DATETIME" label="MTA Status Date/Time"/>
			<field name="ft_t_laat.thshld_calc_curr_cde" dataType="STRING"/>
			<field name="ft_t_laat.thshld_curr_cde" dataType="STRING"/>
			<field name="ft_t_laat.dlv_rnd_meth_typ" dataType="STRING"/>
			<field name="ft_t_laat.ret_rnd_meth_txt" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_idmv" id="LAATIDMVMHITHSHLD_VAL_FQ_SP_TYP" parentId="FLARLAATMHI" label="THSHLDVALFQSPTYP" dbConstraint="LAATIDMVTHSHLDVALFQSPTYP">
		<inputFields>
			<field name="ft_t_idmv.intrnl_dmn_val_nme" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_laat" id="FLARLAATCPTY" parentId="CPTYFLARLAAP" label="AgreementThresholdCPTY">
		<inputFields>
			<field name="ft_t_laat.ret_rnd_camt" dataType="NUMBER"/>
			<field name="ft_t_laat.min_tsfr_camt" dataType="NUMBER"/>
			<field name="ft_t_laat.thshld_camt" dataType="NUMBER"/>
			<field name="ft_t_laat.start_tms" dataType="DATETIME"/>
			<field name="ft_t_laat.min_tsfr_meth_txt" dataType="STRING"/>
			<field name="ft_t_laat.thshld_meth_txt" dataType="STRING"/>
			<field name="ft_t_laat.mta_stat_tms" dataType="DATETIME" label="MTA Status Date/Time"/>
			<field name="ft_t_laat.thshld_stat_tms" dataType="DATETIME" label="Threshold Amount Status Date/Time"/>
			<field name="ft_t_laat.thshld_calc_curr_cde" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_fins" id="FINSFLARLAATCPTY" parentId="CPTYFLARLAAP" label="MHIFinancialInstitution">
		<inputFields>
			<field name="ft_t_fins.inst_desc" dataType="STRING"/>
			<field name="ft_t_fins.inst_nme" dataType="STRING"/>
			<field name="ft_t_fins.inst_stat_typ" dataType="STRING"/>
			<field name="ft_t_fins.inst_typ" dataType="STRING"/>
			<field name="ft_t_fins.pref_curr_cde" dataType="STRING"/>
			<field name="ft_t_fins.pref_fins_id" dataType="STRING"/>
			<field name="ft_t_fins.pref_fins_id_ctxt_typ" dataType="STRING"/>
			<field name="ft_t_fins.pref_iss_ctxt_typ" dataType="STRING"/>
			<field name="ft_t_fins.start_tms" dataType="DATETIME"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_issr" id="ISSRFINSFLARLAATCPTY" parentId="FINSFLARLAATCPTY" label="Issuer">
		<inputFields>
			<field name="ft_t_issr.start_tms" dataType="DATETIME"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_irid" id="IRIDISSRFINSFLARLAATCPTY" parentId="ISSRFINSFLARLAATCPTY" label="IssuerIdentifier">
		<inputFields>
			<field name="ft_t_irid.issr_id" dataType="STRING"/>
			<field name="ft_t_irid.issr_id_ctxt_typ" dataType="STRING"/>
			<field name="ft_t_irid.start_tms" dataType="DATETIME"/>
		</inputFields>
		<where>
			<field name="ft_t_irid.issr_id_ctxt_typ" dataType="STRING" value="CLIENTREF"/>
		</where>
	</occurrence>
	<occurrence table="ft_t_rtg1" id="LAATRTG1MHIMTA" parentId="FLARLAATMHI" multiple="true" label="RatingTriggerMinimumTransferAmountMHI">
		<inputFields>
			<field name="ft_t_rtg1.rtng_cde" dataType="STRING"/>
			<field name="ft_t_rtg1.rtng_srce_typ" dataType="STRING"/>
			<field name="ft_t_rtg1.rtng_camt" dataType="NUMBER"/>
			<field name="ft_t_rtg1.start_tms" dataType="DATETIME"/>
			<field name="ft_t_rtg1.data_stat_typ" dataType="STRING"/>
			<field name="ft_t_rtg1.min_rtng_cde" dataType="STRING"/>
		</inputFields>
		<where>
			<field name="ft_t_rtg1.rtng_grid_purp_typ" dataType="STRING" value="MTA"/>
		</where>
	</occurrence>
	<occurrence table="ft_t_rtg1" id="LAATRTG1MHITHSHLD" parentId="FLARLAATMHI" multiple="true" label="RatingTriggerThresholdMHI">
		<inputFields>
			<field name="ft_t_rtg1.rtng_cde" dataType="STRING"/>
			<field name="ft_t_rtg1.rtng_camt" dataType="NUMBER"/>
			<field name="ft_t_rtg1.rtng_srce_typ" dataType="STRING"/>
			<field name="ft_t_rtg1.data_stat_typ" dataType="STRING"/>
			<field name="ft_t_rtg1.start_tms" dataType="DATETIME"/>
			<field name="ft_t_rtg1.min_rtng_cde" dataType="STRING"/>
		</inputFields>
		<where>
			<field name="ft_t_rtg1.rtng_grid_purp_typ" dataType="STRING" value="THSHLD"/>
		</where>
	</occurrence>
	<occurrence table="ft_t_rtg1" id="LAAPRTG1MHIINDPTAMT" parentId="MHIFLARLAAP" multiple="true" label="RatingTriggerIndependentAmountMHI">
		<inputFields>
			<field name="ft_t_rtg1.rtng_cde" dataType="STRING"/>
			<field name="ft_t_rtg1.rtng_camt" dataType="NUMBER"/>
			<field name="ft_t_rtg1.rtng_srce_typ" dataType="STRING"/>
			<field name="ft_t_rtg1.data_stat_typ" dataType="STRING"/>
			<field name="ft_t_rtg1.start_tms" dataType="DATETIME"/>
			<field name="ft_t_rtg1.min_rtng_cde" dataType="STRING"/>
		</inputFields>
		<where>
			<field name="ft_t_rtg1.rtng_grid_purp_typ" dataType="STRING" value="INDPTAMT"/>
		</where>
	</occurrence>
	<occurrence table="ft_t_rtg1" id="LAAPRTG1CPTYINDPTAMT" parentId="CPTYFLARLAAP" multiple="true" label="RatingTriggerIndependentAmountCPTY">
		<inputFields>
			<field name="ft_t_rtg1.rtng_cde" dataType="STRING"/>
			<field name="ft_t_rtg1.rtng_camt" dataType="NUMBER"/>
			<field name="ft_t_rtg1.rtng_srce_typ" dataType="STRING"/>
			<field name="ft_t_rtg1.data_stat_typ" dataType="STRING"/>
			<field name="ft_t_rtg1.start_tms" dataType="DATETIME"/>
			<field name="ft_t_rtg1.min_rtng_cde" dataType="STRING"/>
		</inputFields>
		<where>
			<field name="ft_t_rtg1.rtng_grid_purp_typ" dataType="STRING" value="INDPTAMT"/>
		</where>
	</occurrence>
	<occurrence table="ft_t_rtg1" id="LAATRTG1CPTYMTA" parentId="FLARLAATCPTY" multiple="true" label="RatingTriggerMinimumTransferAmountCPTY">
		<inputFields>
			<field name="ft_t_rtg1.rtng_cde" dataType="STRING"/>
			<field name="ft_t_rtg1.rtng_camt" dataType="NUMBER"/>
			<field name="ft_t_rtg1.rtng_srce_typ" dataType="STRING"/>
			<field name="ft_t_rtg1.start_tms" dataType="DATETIME"/>
			<field name="ft_t_rtg1.data_stat_typ" dataType="STRING"/>
			<field name="ft_t_rtg1.min_rtng_cde" dataType="STRING"/>
		</inputFields>
		<where>
			<field name="ft_t_rtg1.rtng_grid_purp_typ" dataType="STRING" value="MTA"/>
		</where>
	</occurrence>
	<occurrence table="ft_t_rtg1" id="LAATRTG1CPTYTHSHLD" parentId="FLARLAATCPTY" multiple="true" label="RatingTriggerThresholdCPTY">
		<inputFields>
			<field name="ft_t_rtg1.rtng_cde" dataType="STRING"/>
			<field name="ft_t_rtg1.rtng_camt" dataType="NUMBER"/>
			<field name="ft_t_rtg1.rtng_srce_typ" dataType="STRING"/>
			<field name="ft_t_rtg1.data_stat_typ" dataType="STRING"/>
			<field name="ft_t_rtg1.start_tms" dataType="DATETIME"/>
			<field name="ft_t_rtg1.min_rtng_cde" dataType="STRING"/>
		</inputFields>
		<where>
			<field name="ft_t_rtg1.rtng_grid_purp_typ" dataType="STRING" value="THSHLD"/>
		</where>
	</occurrence>
	<occurrence table="ft_t_gncm" id="GNCMLAAPMHIINDPTAMT" parentId="MHIFLARLAAP" label="IndependentAmountDescMHI" dbConstraint="LAAPGNCMCSTM">
		<where>
			<field name="ft_t_gncm.comm_reas_mnem" dataType="STRING" value="INDPTAMT"/>
		</where>
		<inputFields>
			<field name="ft_t_gncm.cmnt_txt" dataType="STRING"/>
			<field name="ft_t_gncm.created_tms" dataType="DATETIME"/>
			<field name="ft_t_gncm.gncm_tbl_typ" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_gncm" id="GNCMLAATMHIMTA" parentId="FLARLAATMHI" label="MinimumTransferAmountDescMHI" dbConstraint="LAATGNCMCSTM">
		<where>
			<field name="ft_t_gncm.comm_reas_mnem" dataType="STRING" value="MTA"/>
		</where>
		<inputFields>
			<field name="ft_t_gncm.cmnt_txt" dataType="STRING"/>
			<field name="ft_t_gncm.created_tms" dataType="DATETIME"/>
			<field name="ft_t_gncm.gncm_tbl_typ" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_gncm" id="GNCMLAATMHITHSHLD" parentId="FLARLAATMHI" label="ThresholdAmountDescMHI" dbConstraint="LAATGNCMCSTM">
		<inputFields>
			<field name="ft_t_gncm.cmnt_txt" dataType="STRING"/>
			<field name="ft_t_gncm.gncm_tbl_typ" dataType="STRING"/>
			<field name="ft_t_gncm.created_tms" dataType="DATETIME"/>
		</inputFields>
		<where>
			<field name="ft_t_gncm.comm_reas_mnem" dataType="STRING" value="THSHLD"/>
		</where>
	</occurrence>
	<occurrence table="ft_t_gncm" id="GNCMLAAPCPTYINDPTAMT" parentId="CPTYFLARLAAP" label="IndependentAmountDescCPTY" dbConstraint="LAAPGNCMCSTM">
		<where>
			<field name="ft_t_gncm.comm_reas_mnem" dataType="STRING" value="INDPTAMT"/>
		</where>
		<inputFields>
			<field name="ft_t_gncm.cmnt_txt" dataType="STRING"/>
			<field name="ft_t_gncm.created_tms" dataType="DATETIME"/>
			<field name="ft_t_gncm.gncm_tbl_typ" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_gncm" id="GNCMLAATCPTYMTA" parentId="FLARLAATCPTY" label="MinimumTransferAmountDescCPTY" dbConstraint="LAATGNCMCSTM">
		<inputFields>
			<field name="ft_t_gncm.cmnt_txt" dataType="STRING"/>
			<field name="ft_t_gncm.created_tms" dataType="DATETIME"/>
			<field name="ft_t_gncm.gncm_tbl_typ" dataType="STRING"/>
		</inputFields>
		<where>
			<field name="ft_t_gncm.comm_reas_mnem" dataType="STRING" value="MTA"/>
		</where>
	</occurrence>
	<occurrence table="ft_t_gncm" id="GNCMLAATCPTYTHSHLD" parentId="FLARLAATCPTY" label="ThresholdAmountDescCPTY" dbConstraint="LAATGNCMCSTM">
		<where>
			<field name="ft_t_gncm.comm_reas_mnem" dataType="STRING" value="THSHLD"/>
		</where>
		<inputFields>
			<field name="ft_t_gncm.cmnt_txt" dataType="STRING"/>
			<field name="ft_t_gncm.created_tms" dataType="DATETIME"/>
			<field name="ft_t_gncm.gncm_tbl_typ" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_gncm" id="GNCMLAATMHIASPCTMTA" parentId="FLARLAATMHI" label="MinimumTransferAmountAspectMHI" dbConstraint="LAATGNCMCSTM">
		<where>
			<field name="ft_t_gncm.comm_reas_mnem" dataType="STRING" value="ASPCTMTA"/>
		</where>
		<inputFields>
			<field name="ft_t_gncm.cmnt_txt" dataType="STRING"/>
			<field name="ft_t_gncm.created_tms" dataType="DATETIME"/>
			<field name="ft_t_gncm.gncm_tbl_typ" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_gncm" id="GNCMLAATMHIASPCTTLD" parentId="FLARLAATMHI" label="ThresholdAmountAspectMHI" dbConstraint="LAATGNCMCSTM">
		<where>
			<field name="ft_t_gncm.comm_reas_mnem" dataType="STRING" value="ASPCTTLD"/>
		</where>
		<inputFields>
			<field name="ft_t_gncm.cmnt_txt" dataType="STRING"/>
			<field name="ft_t_gncm.created_tms" dataType="DATETIME"/>
			<field name="ft_t_gncm.gncm_tbl_typ" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_gncm" id="GNCMLAATCPTYASPCTMTA" parentId="FLARLAATCPTY" label="MinimumTransferAmountAspectCPTY" dbConstraint="LAATGNCMCSTM">
		<where>
			<field name="ft_t_gncm.comm_reas_mnem" dataType="STRING" value="ASPCTMTA"/>
		</where>
		<inputFields>
			<field name="ft_t_gncm.cmnt_txt" dataType="STRING"/>
			<field name="ft_t_gncm.created_tms" dataType="DATETIME"/>
			<field name="ft_t_gncm.gncm_tbl_typ" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_gncm" id="GNCMLAATCPTYASPCTTLD" parentId="FLARLAATCPTY" label="ThresholdAmountAspectCPTY" dbConstraint="LAATGNCMCSTM">
		<inputFields>
			<field name="ft_t_gncm.cmnt_txt" dataType="STRING"/>
			<field name="ft_t_gncm.gncm_tbl_typ" dataType="STRING"/>
			<field name="ft_t_gncm.created_tms" dataType="DATETIME"/>
		</inputFields>
		<where>
			<field name="ft_t_gncm.comm_reas_mnem" dataType="STRING" value="ASPCTTLD"/>
		</where>
	</occurrence>
	<occurrence table="ft_t_gncm" id="GNCMLAAPMHIASPCTICA" parentId="MHIFLARLAAP" label="IndependentAmountAspectMHI" dbConstraint="LAAPGNCMCSTM">
		<where>
			<field name="ft_t_gncm.comm_reas_mnem" dataType="STRING" value="ASPCTICA"/>
		</where>
		<inputFields>
			<field name="ft_t_gncm.cmnt_txt" dataType="STRING"/>
			<field name="ft_t_gncm.created_tms" dataType="DATETIME"/>
			<field name="ft_t_gncm.gncm_tbl_typ" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_gncm" id="GNCMLAAPCPTYASPCTICA" parentId="CPTYFLARLAAP" label="IndependentAmountAspectCPTY" dbConstraint="LAAPGNCMCSTM">
		<where>
			<field name="ft_t_gncm.comm_reas_mnem" dataType="STRING" value="ASPCTICA"/>
		</where>
		<inputFields>
			<field name="ft_t_gncm.cmnt_txt" dataType="STRING"/>
			<field name="ft_t_gncm.created_tms" dataType="DATETIME"/>
			<field name="ft_t_gncm.gncm_tbl_typ" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_lacv" id="FLARLACVMHIINSCOPE" parentId="FLARMHI" multiple="true" label="InScopeProductsMHI">
		<inputFields>
			<field name="ft_t_lacv.dlr_br_nme" dataType="STRING"/>
			<field name="ft_t_lacv.data_stat_typ" dataType="STRING"/>
			<field name="ft_t_lacv.start_tms" dataType="DATETIME"/>
			<field name="ft_t_lacv.cust_prod_nme" dataType="STRING"/>
		</inputFields>
		<where>
			<field name="ft_t_lacv.cvg_purp_typ" dataType="STRING" value="INSCOPE"/>
		</where>
	</occurrence>
	<occurrence table="ft_t_idmv" id="LACVIDMVMHICUST_PROD_NME" parentId="FLARLACVMHIINSCOPE" label="CUSTPRODNME" dbConstraint="LACVIDMVCUSTPRODNME">
		<inputFields>
			<field name="ft_t_idmv.intrnl_dmn_val_nme" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_lacv" id="FLARLACVCPTY" parentId="FLARCPTY" multiple="true" label="InScopeProductsCPTY">
		<inputFields>
			<field name="ft_t_lacv.dlr_br_nme" dataType="STRING"/>
			<field name="ft_t_lacv.data_stat_typ" dataType="STRING"/>
			<field name="ft_t_lacv.start_tms" dataType="DATETIME"/>
			<field name="ft_t_lacv.cust_prod_nme" dataType="STRING"/>
		</inputFields>
		<where>
			<field name="ft_t_lacv.cvg_purp_typ" dataType="STRING" value="INSCOPE"/>
		</where>
	</occurrence>
	<occurrence table="ft_t_idmv" id="LACVIDMVCPTYCUST_PROD_NME" parentId="FLARLACVCPTY" label="CUSTPRODNME" dbConstraint="LACVIDMVCUSTPRODNME">
		<inputFields>
			<field name="ft_t_idmv.intrnl_dmn_val_nme" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_lacd" id="LAAPLACDCURRENCY" parentId="CPTYFLARLAAP" multiple="true" label="CollateralCashDetails">
		<inputFields>
			<field name="ft_t_lacd.coll_curr_cde" dataType="STRING"/>
			<field name="ft_t_lacd.haircut_cpct" dataType="NUMBER"/>
			<field name="ft_t_lacd.coll_ticker_id" dataType="STRING"/>
			<field name="ft_t_lacd.data_stat_typ" dataType="STRING"/>
			<field name="ft_t_lacd.start_tms" dataType="DATETIME"/>
		</inputFields>
		<where>
			<field name="ft_t_lacd.iss_typ" dataType="STRING" value="CURRENCY"/>
		</where>
	</occurrence>
	<occurrence table="ft_t_lest" id="LESTLAAPLACDINTRCRTE" parentId="LAAPLACDCURRENCY" label="InterestDetails">
		<inputFields>
			<field name="ft_t_lest.stat_char_val_txt" dataType="STRING"/>
		</inputFields>
		<where>
			<field name="ft_t_lest.stat_def_id" dataType="STRING" value="INTRCRTE"/>
		</where>
	</occurrence>
	<occurrence table="ft_t_lest" id="LESTLAAPLACDCOLLSDTC" parentId="LAAPLACDCURRENCY" label="CollateralSettlementDateDetails">
		<inputFields>
			<field name="ft_t_lest.stat_char_val_txt" dataType="STRING"/>
		</inputFields>
		<where>
			<field name="ft_t_lest.stat_def_id" dataType="STRING" value="COLLSDTC"/>
		</where>
	</occurrence>
	<occurrence table="ft_t_lest" id="LESTLAAPLACDCOLLVDTC" parentId="LAAPLACDCURRENCY" label="CollateralValueDateOffsetDetails">
		<inputFields>
			<field name="ft_t_lest.stat_char_val_txt" dataType="STRING"/>
		</inputFields>
		<where>
			<field name="ft_t_lest.stat_def_id" dataType="STRING" value="COLLVDTC"/>
		</where>
	</occurrence>
	<occurrence table="ft_t_lest" id="LESTLAAPLACDCCALLHOL" parentId="LAAPLACDCURRENCY" label="CollateralCallActionHolDetails">
		<inputFields>
			<field name="ft_t_lest.stat_char_val_txt" dataType="STRING"/>
		</inputFields>
		<where>
			<field name="ft_t_lest.stat_def_id" dataType="STRING" value="CCALLHOL"/>
		</where>
	</occurrence>
	<occurrence table="ft_t_lacd" id="LAAPLACDBOND" parentId="CPTYFLARLAAP" multiple="true" label="CollateralBondDetails">
		<inputFields>
			<field name="ft_t_lacd.haircut_cpct" dataType="NUMBER"/>
			<field name="ft_t_lacd.coll_ticker_id" dataType="STRING"/>
			<field name="ft_t_lacd.data_stat_typ" dataType="STRING"/>
			<field name="ft_t_lacd.start_tms" dataType="DATETIME"/>
			<field name="ft_t_lacd.maturity_rule_txt" dataType="STRING"/>
			<field name="ft_t_lacd.maturity_rule_max_txt" dataType="STRING"/>
		</inputFields>
		<where>
			<field name="ft_t_lacd.iss_typ" dataType="STRING" value="BOND"/>
		</where>
	</occurrence>
	<occurrence table="ft_t_gunt" id="GUNTLACDBOND" parentId="LAAPLACDBOND" label="CollateralBondDetailsGeographicUnit">
		<inputFields>
			<field name="ft_t_gunt.gu_nme" dataType="STRING"/>
		</inputFields>
		<where>
			<field name="ft_t_gunt.prnt_gu_typ" dataType="STRING" value="COUNTRY"/>
		</where>
	</occurrence>
	<occurrence table="ft_t_fins" id="FLARFINSCPTY" parentId="FLARCPTY" label="CounterpartyFinancialInstitution" dbConstraint="flarf001">
		<inputFields>
			<field name="ft_t_fins.inst_desc" dataType="STRING"/>
			<field name="ft_t_fins.inst_nme" dataType="STRING"/>
			<field name="ft_t_fins.inst_stat_typ" dataType="STRING"/>
			<field name="ft_t_fins.inst_typ" dataType="STRING"/>
			<field name="ft_t_fins.pref_fins_id" dataType="STRING"/>
			<field name="ft_t_fins.pref_fins_id_ctxt_typ" dataType="STRING"/>
			<field name="ft_t_fins.pref_iss_ctxt_typ" dataType="STRING"/>
			<field name="ft_t_fins.start_tms" dataType="DATETIME"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_fiid" id="FIIDFINSCPTY" parentId="FLARFINSCPTY" multiple="true" label="FinancialInstitutionIdentifierCPTY" dbConstraint="fiidf001">
		<inputFields>
			<field name="ft_t_fiid.fins_id_ctxt_typ" dataType="STRING"/>
			<field name="ft_t_fiid.fins_id" dataType="STRING"/>
			<field name="ft_t_fiid.inst_usage_typ" dataType="STRING"/>
			<field name="ft_t_fiid.start_tms" dataType="DATETIME"/>
		</inputFields>
		<where>
			<field name="ft_t_fiid.fins_id_ctxt_typ" dataType="STRING" value="BBCMPYID"/>
		</where>
	</occurrence>
	<occurrence table="ft_t_issr" id="ISSRFINSCPTY" parentId="FLARFINSCPTY" label="Issuer" dbConstraint="issrf001">
		<inputFields>
			<field name="ft_t_issr.start_tms" dataType="DATETIME"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_irid" id="IRIDISSRCPTY" parentId="ISSRFINSCPTY" label="IssuerIdentifier">
		<inputFields>
			<field name="ft_t_irid.issr_id" dataType="STRING"/>
			<field name="ft_t_irid.issr_id_ctxt_typ" dataType="STRING"/>
			<field name="ft_t_irid.start_tms" dataType="DATETIME"/>
		</inputFields>
		<where>
			<field name="ft_t_irid.issr_id_ctxt_typ" dataType="STRING" value="CLIENTREF"/>
		</where>
	</occurrence>
	<occurrence table="ft_t_lacv" id="LAANLACVCSA" parentId="LAGRLAAN" label="AnnexureCoverageCSA" multiple="true">
		<inputFields>
			<field name="ft_t_lacv.start_tms" dataType="DATETIME"/>
			<field name="ft_t_lacv.cust_prod_nme" dataType="STRING"/>
		</inputFields>
		<where>
			<field name="ft_t_lacv.cvg_purp_typ" dataType="STRING" value="INSCOPEC"/>
		</where>
	</occurrence>
	<occurrence table="ft_t_idmv" id="LAANIDMVANNEX_TYPVM" parentId="LAGRLAANVM" label="VMCSAType" dbConstraint="LAANIDMVANNEXTYP">
		<inputFields>
			<field name="ft_t_idmv.intrnl_dmn_val_nme" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_idmv" id="LAANIMDVANNEX_STAT_TYPVM" parentId="LAGRLAANVM" label="VMCSAStatus" dbConstraint="LAANIDMVANNEXSTATTYP">
		<inputFields>
			<field name="ft_t_idmv.intrnl_dmn_val_nme" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_lacv" id="LAANLACVVM" parentId="LAGRLAANVM" label="AnnexureCoverageVM" multiple="true">
		<inputFields>
			<field name="ft_t_lacv.cust_prod_nme" dataType="STRING"/>
			<field name="ft_t_lacv.start_tms" dataType="DATETIME"/>
		</inputFields>
		<where>
			<field name="ft_t_lacv.cvg_purp_typ" dataType="STRING" value="INSCOPEV"/>
		</where>
	</occurrence>
	<occurrence table="ft_t_idmv" id="LAANIDMVANNEX_TYPIMD" parentId="LAGRLAANIMD" label="IMDType" dbConstraint="LAANIDMVANNEXTYP">
		<inputFields>
			<field name="ft_t_idmv.intrnl_dmn_val_nme" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_idmv" id="LAANIDMVANNEX_STAT_TYPIMD" parentId="LAGRLAANIMD" label="IMDStatus" dbConstraint="LAANIDMVANNEXSTATTYP">
		<inputFields>
			<field name="ft_t_idmv.intrnl_dmn_val_nme" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_laap" id="MHIFLARLAAPVM" parentId="FLARMHI" label="AnnexureParticipantsMHIVM">
		<where>
			<field name="ft_t_laap.annex_prt_modl_typ" dataType="STRING" value="VM"/>
		</where>
		<inputFields>
			<field name="ft_t_laap.interest_adj_typ" dataType="STRING"/>
			<field name="ft_t_laap.interest_tsfr_typ" dataType="STRING"/>
			<field name="ft_t_laap.start_tms" dataType="DATETIME"/>
			<field name="ft_t_laap.annex_prt_modl_typ" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_laap" id="MHIFLARLAAPIMD" parentId="FLARMHI" label="AnnexureParticipantsMHIIMD">
		<where>
			<field name="ft_t_laap.annex_prt_modl_typ" dataType="STRING" value="IM"/>
		</where>
		<inputFields>
			<field name="ft_t_laap.inst_mnem" dataType="STRING"/>
			<field name="ft_t_laap.ev_dflt_curr_cde" dataType="STRING"/>
			<field name="ft_t_laap.early_term_pay_curr_cde" dataType="STRING"/>
			<field name="ft_t_laap.annex_prt_curr_cde" dataType="STRING"/>
			<field name="ft_t_laap.start_tms" dataType="DATETIME"/>
			<field name="ft_t_laap.annex_prt_modl_typ" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_lacd" id="LAAPLACDVM" parentId="MHIFLARLAAPVM" label="AnnexureCollateralDetailsVM" multiple="true">
		<inputFields>
			<field name="ft_t_lacd.adj_pct_val_cpct" dataType="NUMBER"/>
			<field name="ft_t_lacd.coll_curr_cde" dataType="STRING"/>
			<field name="ft_t_lacd.coll_desc" dataType="STRING"/>
			<field name="ft_t_lacd.haircut_cpct" dataType="NUMBER"/>
			<field name="ft_t_lacd.start_tms" dataType="DATETIME"/>
			<field name="ft_t_lacd.margin_call_notfcn_tme" dataType="DATETIME"/>
			<field name="ft_t_lacd.coll_call_notfcn_tmz" dataType="STRING"/>
			<field name="ft_t_lacd.coll_call_fq_dy_typ" dataType="STRING"/>
			<field name="ft_t_lacd.coll_call_fq_sp_typ" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_laat" id="FLARLAATMHIVM" parentId="MHIFLARLAAPVM" label="AgreementThresholdMHIVM">
		<inputFields>
			<field name="ft_t_laat.start_tms" dataType="DATETIME"/>
			<field name="ft_t_laat.thshld_val_fq_sp_typ" dataType="STRING"/>
			<field name="ft_t_laat.ret_rnd_camt" dataType="NUMBER"/>
			<field name="ft_t_laat.min_tsfr_camt" dataType="NUMBER"/>
			<field name="ft_t_laat.thshld_rnd_val_camt" dataType="NUMBER"/>
			<field name="ft_t_laat.thshld_camt" dataType="NUMBER"/>
			<field name="ft_t_laat.dlv_rnd_meth_typ" dataType="STRING"/>
			<field name="ft_t_laat.ret_rnd_meth_txt" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_laat" id="FLARLAATMHIIMD" parentId="MHIFLARLAAPIMD" label="AgreementThresholdMHIIMD">
		<inputFields>
			<field name="ft_t_laat.start_tms" dataType="DATETIME"/>
			<field name="ft_t_laat.min_tsfr_camt" dataType="NUMBER"/>
			<field name="ft_t_laat.thshld_calc_curr_cde" dataType="STRING"/>
			<field name="ft_t_laat.ret_rnd_camt" dataType="NUMBER"/>
			<field name="ft_t_laat.thshld_meth_txt" dataType="STRING"/>
			<field name="ft_t_laat.thshld_camt" dataType="NUMBER"/>
			<field name="ft_t_laat.thshld_curr_cde" dataType="STRING"/>
			<field name="ft_t_laat.dlv_rnd_meth_typ" dataType="STRING"/>
			<field name="ft_t_laat.ret_rnd_meth_txt" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_fins" id="FINSFLARLAATMHIIMD" parentId="MHIFLARLAAPIMD" label="MHIFinancialInstitution">
		<inputFields>
			<field name="ft_t_fins.inst_desc" dataType="STRING"/>
			<field name="ft_t_fins.inst_nme" dataType="STRING"/>
			<field name="ft_t_fins.inst_stat_typ" dataType="STRING"/>
			<field name="ft_t_fins.inst_typ" dataType="STRING"/>
			<field name="ft_t_fins.pref_curr_cde" dataType="STRING"/>
			<field name="ft_t_fins.pref_fins_id" dataType="STRING"/>
			<field name="ft_t_fins.pref_fins_id_ctxt_typ" dataType="STRING"/>
			<field name="ft_t_fins.pref_iss_ctxt_typ" dataType="STRING"/>
			<field name="ft_t_fins.start_tms" dataType="DATETIME"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_issr" id="ISSRFINSFLARLAATMHIIMD" parentId="FINSFLARLAATMHIIMD" label="Issuer">
		<inputFields>
			<field name="ft_t_issr.start_tms" dataType="DATETIME"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_irid" id="IRIDISSRFINSFLARLAATMHIIMD" parentId="ISSRFINSFLARLAATMHIIMD" label="IssuerIdentifier">
		<inputFields>
			<field name="ft_t_irid.issr_id" dataType="STRING"/>
			<field name="ft_t_irid.issr_id_ctxt_typ" dataType="STRING"/>
			<field name="ft_t_irid.start_tms" dataType="DATETIME"/>
		</inputFields>
		<where>
			<field name="ft_t_irid.issr_id_ctxt_typ" dataType="STRING" value="CLIENTREF"/>
		</where>
	</occurrence>
	<occurrence table="ft_t_reg1" id="LAATREG1MHI" parentId="FLARLAATMHIIMD" label="RegulatoryMHI" multiple="true">
		<inputFields>
			<field name="ft_t_reg1.start_tms" dataType="DATETIME"/>
			<field name="ft_t_reg1.simm_exception" dataType="STRING"/>
			<field name="ft_t_reg1.exp_desc" dataType="STRING"/>
			<field name="ft_t_reg1.retro_exception" dataType="STRING"/>
			<field name="ft_t_reg1.retro_date" dataType="DATETIME"/>
			<field name="ft_t_reg1.reg1_oid" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_rgm1" id="REG1RGM1MHI" parentId="LAATREG1MHI" label="RegulatoryRegimeMHI">
		<inputFields>
			<field name="ft_t_rgm1.regime_nme" dataType="STRING"/>
			<field name="ft_t_rgm1.start_tms" dataType="DATETIME"/>
			<field name="ft_t_rgm1.notes" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_cvt1" id="RGM1CVT1MHI" parentId="REG1RGM1MHI" label="CoveredTransactionsMHI" multiple="true">
		<inputFields>
			<field name="ft_t_cvt1.start_tms" dataType="DATETIME"/>
			<field name="ft_t_cvt1.vm_ind" dataType="STRING"/>
			<field name="ft_t_cvt1.tran_typ" dataType="STRING"/>
			<field name="ft_t_cvt1.cvrd_ind" dataType="STRING"/>
			<field name="ft_t_cvt1.im_ind" dataType="STRING"/>
			<field name="ft_t_cvt1.eff_tms" dataType="DATETIME"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_reg1" id="LAATREG1CPTY" parentId="FLARLAATCPTYIMD" label="RegulatoryCPTY" multiple="true">
		<inputFields>
			<field name="ft_t_reg1.start_tms" dataType="DATETIME"/>
			<field name="ft_t_reg1.simm_exception" dataType="STRING"/>
			<field name="ft_t_reg1.exp_desc" dataType="STRING"/>
			<field name="ft_t_reg1.retro_exception" dataType="STRING"/>
			<field name="ft_t_reg1.retro_date" dataType="DATETIME"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_rgm1" id="REG1RGM1CPTY" parentId="LAATREG1CPTY" label="RegulatoryRegimeCPTY">
		<inputFields>
			<field name="ft_t_rgm1.start_tms" dataType="DATETIME"/>
			<field name="ft_t_rgm1.regime_nme" dataType="STRING"/>
			<field name="ft_t_rgm1.notes" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_cvt1" id="RGM1CVT1CPTY" parentId="REG1RGM1CPTY" label="CoveredTransactionsCPTY" multiple="true">
		<inputFields>
			<field name="ft_t_cvt1.start_tms" dataType="DATETIME"/>
			<field name="ft_t_cvt1.vm_ind" dataType="STRING"/>
			<field name="ft_t_cvt1.tran_typ" dataType="STRING"/>
			<field name="ft_t_cvt1.cvrd_ind" dataType="STRING"/>
			<field name="ft_t_cvt1.im_ind" dataType="STRING"/>
			<field name="ft_t_cvt1.eff_tms" dataType="DATETIME"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_laap" id="CPTYFLARLAAPVM" parentId="FLARCPTY" label="AnnexureParticipantsCPTYVM">
		<where>
			<field name="ft_t_laap.annex_prt_modl_typ" dataType="STRING" value="VM"/>
		</where>
		<inputFields>
			<field name="ft_t_laap.start_tms" dataType="DATETIME"/>
			<field name="ft_t_laap.annex_prt_modl_typ" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_laap" id="CPTYFLARLAAPIMD" parentId="FLARCPTY" label="AnnexureParticipantsCPTYIMD">
		<where>
			<field name="ft_t_laap.annex_prt_modl_typ" dataType="STRING" value="IM"/>
		</where>
		<inputFields>
			<field name="ft_t_laap.inst_mnem" dataType="STRING"/>
			<field name="ft_t_laap.ev_dflt_curr_cde" dataType="STRING"/>
			<field name="ft_t_laap.start_tms" dataType="DATETIME"/>
			<field name="ft_t_laap.annex_prt_modl_typ" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_laat" id="FLARLAATCPTYVM" parentId="CPTYFLARLAAPVM" label="AgreementThresholdCPTYVM">
		<inputFields>
			<field name="ft_t_laat.start_tms" dataType="DATETIME"/>
			<field name="ft_t_laat.min_tsfr_camt" dataType="NUMBER"/>
			<field name="ft_t_laat.thshld_camt" dataType="NUMBER"/>
		</inputFields>
		<where>
    </where>
	</occurrence>
	<occurrence table="ft_t_laat" id="FLARLAATCPTYIMD" parentId="CPTYFLARLAAPIMD" label="AgreementThresholdCPTYIMD">
		<inputFields>
			<field name="ft_t_laat.start_tms" dataType="DATETIME"/>
			<field name="ft_t_laat.thshld_calc_curr_cde" dataType="STRING"/>
			<field name="ft_t_laat.min_tsfr_camt" dataType="NUMBER"/>
			<field name="ft_t_laat.thshld_camt" dataType="NUMBER"/>
			<field name="ft_t_laat.thshld_curr_cde" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_fins" id="FLARLAATFINSCPTYIMD" parentId="CPTYFLARLAAPIMD" label="MHIFinancialInstitution">
		<inputFields>
			<field name="ft_t_fins.inst_desc" dataType="STRING"/>
			<field name="ft_t_fins.inst_nme" dataType="STRING"/>
			<field name="ft_t_fins.inst_stat_typ" dataType="STRING"/>
			<field name="ft_t_fins.inst_typ" dataType="STRING"/>
			<field name="ft_t_fins.pref_curr_cde" dataType="STRING"/>
			<field name="ft_t_fins.pref_fins_id" dataType="STRING"/>
			<field name="ft_t_fins.pref_fins_id_ctxt_typ" dataType="STRING"/>
			<field name="ft_t_fins.pref_iss_ctxt_typ" dataType="STRING"/>
			<field name="ft_t_fins.start_tms" dataType="DATETIME"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_issr" id="FLARLAATISSRFINSCPTY" parentId="FLARLAATFINSCPTYIMD" label="Issuer">
		<inputFields>
			<field name="ft_t_issr.start_tms" dataType="DATETIME"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_irid" id="IRIDFLARLAATISSRFINSCPTY" parentId="FLARLAATISSRFINSCPTY" label="IssuerIdentifier">
		<inputFields>
			<field name="ft_t_irid.issr_id" dataType="STRING"/>
			<field name="ft_t_irid.issr_id_ctxt_typ" dataType="STRING"/>
			<field name="ft_t_irid.start_tms" dataType="DATETIME"/>
		</inputFields>
		<where>
			<field name="ft_t_irid.issr_id_ctxt_typ" dataType="STRING" value="CLIENTREF"/>
		</where>
	</occurrence>
	<occurrence table="ft_t_idmv" id="LACVIDMVVM" parentId="LAANLACVVM" label="CoveredTransactionsVM" dbConstraint="LACVIDMVCUSTPRODNME">
		<inputFields>
			<field name="ft_t_idmv.intrnl_dmn_val_nme" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_idmv" id="LACVIDMVCSA" parentId="LAANLACVCSA" label="CoveredTransactionsCSAMHI" dbConstraint="LACVIDMVCUSTPRODNME">
		<inputFields>
			<field name="ft_t_idmv.intrnl_dmn_val_nme" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_idmv" id="CVT1IDMVIMDMHI" parentId="RGM1CVT1MHI" label="CoveredTransactionsIMDMHI" dbConstraint="CVT1IDMVTRANTYP">
		<inputFields>
			<field name="ft_t_idmv.intrnl_dmn_val_nme" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_idmv" id="IDMVCVT1IMDCPTY" parentId="RGM1CVT1CPTY" label="CoveredTransactionsIMDMHI" dbConstraint="CVT1IDMVTRANTYP">
		<inputFields>
			<field name="ft_t_idmv.intrnl_dmn_val_nme" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_upd1" id="UPD1LAGR" parentId="LAGR_PUB" dbConstraint="UPD1LAGR">
		<inputFields>
			<field name="ft_t_upd1.entity_tbl_typ" dataType="STRING"/>
			<field name="ft_t_upd1.updated_tmsmp" dataType="DATETIME"/>
			<field name="ft_t_upd1.version" dataType="NUMBER"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_pbat" id="PBAT" parentId="LAGR_PUB" dbConstraint="PBATLAGR">
		<inputFields>
			<field name="ft_t_pbat.pub_sq_num" dataType="NUMBER" doNotPublish="true"/>
			<field name="ft_t_pbat.published_tbl_id" dataType="STRING" doNotPublish="true"/>
			<field name="ft_t_pbat.pub_audit_id" dataType="STRING" doNotPublish="true"/>
			<field name="ft_t_pbat.last_chg_tms" dataType="DATETIME"/>
			<field name="ft_t_pbat.pub_cross_ref_id" dataType="STRING" doNotPublish="true"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_flar" id="Triparty" parentId="LAGR_PUB" label="Triparty" multiple="true">
		<inputFields>
			<field name="ft_t_flar.rl_typ" dataType="STRING"/>
			<field name="ft_t_flar.start_tms" dataType="DATETIME"/>
			<field name="ft_t_flar.inst_mnem" dataType="STRING"/>
		</inputFields>
		<where>
			<field name="ft_t_flar.rl_typ" dataType="STRING" value="TRI"/>
		</where>
	</occurrence>
	<occurrence table="ft_t_fins" id="TripartyFins" parentId="Triparty" label="TripartyFins">
		<inputFields>
			<field name="ft_t_fins.inst_nme" dataType="STRING"/>
			<field name="ft_t_fins.start_tms" dataType="DATETIME"/>
			<field name="ft_t_fins.inst_legal_nme" dataType="STRING"/>
			<field name="ft_t_fins.inst_desc" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_gncm" id="GeneralComments" parentId="LAGR_PUB" label="GeneralComments" multiple="true" dbConstraint="LAGRGNCMCSTM">
		<inputFields>
			<field name="ft_t_gncm.cmnt_txt" dataType="STRING"/>
			<field name="ft_t_gncm.comm_reas_mnem" dataType="STRING"/>
			<field name="ft_t_gncm.ln_num" dataType="NUMBER"/>
			<field name="ft_t_gncm.gncm_tbl_typ" dataType="STRING"/>
			<field name="ft_t_gncm.cmnt_stat_typ" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_laan" id="LAGRLAANREPO" parentId="LAGR_PUB" label="AgreementAnnexuresREPO" multiple="true">
		<inputFields>
			<field name="ft_t_laan.annex_modl_typ" dataType="STRING"/>
			<field name="ft_t_laan.annex_amend_desc" dataType="STRING"/>
			<field name="ft_t_laan.annex_ammend_dte" dataType="DATETIME"/>
			<field name="ft_t_laan.annex_aprvl_dte" dataType="DATETIME"/>
			<field name="ft_t_laan.annex_curr_cde" dataType="STRING"/>
			<field name="ft_t_laan.annex_eff_dte" dataType="DATETIME"/>
			<field name="ft_t_laan.annex_negotn_instruc_dte" dataType="DATETIME"/>
			<field name="ft_t_laan.annex_mgt_loc_typ" dataType="STRING"/>
			<field name="ft_t_laan.annex_sign_dte" dataType="DATETIME"/>
			<field name="ft_t_laan.annex_stat_typ" dataType="STRING"/>
			<field name="ft_t_laan.annex_termintn_dte" dataType="DATETIME"/>
			<field name="ft_t_laan.annex_typ" dataType="STRING"/>
			<field name="ft_t_laan.annex_id" dataType="NUMBER"/>
			<field name="ft_t_laan.start_tms" dataType="DATETIME"/>
		</inputFields>
		<where>
			<field name="ft_t_laan.annex_modl_typ" dataType="STRING" value="REPO"/>
		</where>
	</occurrence>
	<occurrence table="ft_t_laap" id="LAGRLAANREPOLAAP" parentId="LAGRLAANREPO" label="AgreementAnnexuresREPOCollateralDetails">
		<inputFields>
			<field name="ft_t_laap.coll_dispute_ind" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_issr" id="ISSRFINSTRI" parentId="TripartyFins" label="Issuer" dbConstraint="issrf001">
		<inputFields>
			<field name="ft_t_issr.start_tms" dataType="DATETIME"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_irid" id="IRIDISSRTRI" parentId="ISSRFINSTRI" label="IssuerIdentifier">
		<inputFields>
			<field name="ft_t_irid.issr_id" dataType="STRING"/>
			<field name="ft_t_irid.issr_id_ctxt_typ" dataType="STRING"/>
			<field name="ft_t_irid.start_tms" dataType="DATETIME"/>
		</inputFields>
		<where>
			<field name="ft_t_irid.issr_id_ctxt_typ" dataType="STRING" value="CLIENTREF"/>
		</where>
	</occurrence>
	<occurrence table="ft_t_flar" id="FLAR" parentId="LAGR_PUB" label="FinsLegalAgreementRoles" multiple="true" dbConstraint="flarf002">
		<inputFields>
			<field name="ft_t_flar.rl_typ" dataType="STRING"/>
			<field name="ft_t_flar.start_tms" dataType="DATETIME"/>
			<field name="ft_t_flar.end_tms" dataType="STRING"/>
			<field name="ft_t_flar.inst_mnem" dataType="STRING"/>
			<field name="ft_t_flar.data_stat_typ" dataType="STRING"/>
			<field name="ft_t_flar.data_src_id" dataType="STRING"/>
			<field name="ft_t_flar.thshld_accel_camt" dataType="STRING"/>
			<field name="ft_t_flar.agncy_tran_applies_ind" dataType="STRING"/>
			<field name="ft_t_flar.last_chg_usr_id" dataType="STRING"/>
			<field name="ft_t_flar.last_chg_tms" dataType="STRING"/>
			<field name="ft_t_flar.end_tms" dataType="STRING"/>
			<field name="ft_t_flar.prncpl_tran_applies_ind" dataType="STRING"/>
		</inputFields>
		<where activeOnly="false"/>
	</occurrence>
	<occurrence table="ft_t_fins" id="FLARFins" parentId="FLAR" label="FLARFins" dbConstraint="flarf001">
		<inputFields>
			<field name="ft_t_fins.inst_nme" dataType="STRING"/>
			<field name="ft_t_fins.start_tms" dataType="DATETIME"/>
			<field name="ft_t_fins.inst_legal_nme" dataType="STRING"/>
			<field name="ft_t_fins.inst_desc" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_issr" id="ISSRFINSFLAR" parentId="FLARFins" label="Issuer" dbConstraint="issrf001">
		<inputFields>
			<field name="ft_t_issr.start_tms" dataType="DATETIME"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_irid" id="IRIDISSRFLAR" parentId="ISSRFINSFLAR" label="IssuerIdentifier">
		<inputFields>
			<field name="ft_t_irid.issr_id" dataType="STRING"/>
			<field name="ft_t_irid.issr_id_ctxt_typ" dataType="STRING"/>
			<field name="ft_t_irid.start_tms" dataType="DATETIME"/>
		</inputFields>
		<where>
			<field name="ft_t_irid.issr_id_ctxt_typ" dataType="STRING" value="CLIENTREF"/>
		</where>
	</occurrence>
	<occurrence table="ft_t_fiid" id="FinancialInstitutionIdentifier" parentId="FLARFins" multiple="true" label="FinancialInstitutionIdentifier" dbConstraint="fiidf001">
		<inputFields>
			<field name="ft_t_fiid.fins_id_ctxt_typ" dataType="STRING"/>
			<field name="ft_t_fiid.fins_id" dataType="STRING"/>
			<field name="ft_t_fiid.start_tms" dataType="DATETIME"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_lacd" id="MHIFLARLAAPLCD" parentId="MHIFLARLAAP" label="AnnexureCollateralDetails">
		<inputFields>
			<field name="ft_t_lacd.coll_call_fq_dy_typ" dataType="STRING"/>
			<field name="ft_t_lacd.coll_call_fq_sp_typ" dataType="STRING"/>
			<field name="ft_t_lacd.margin_call_notfcn_tme" dataType="DATETIME"/>
			<field name="ft_t_lacd.coll_call_notfcn_tmz" dataType="STRING"/>
			<field name="ft_t_lacd.start_tms" dataType="DATETIME"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_laac" id="MHIFLARLAAPLAAC" parentId="MHIFLARLAAP" label="AnnexureCalendars" multiple="true">
		<inputFields>
			<field name="ft_t_laac.cal_id" dataType="STRING"/>
			<field name="ft_t_laac.cal_purp_typ" dataType="STRING"/>
			<field name="ft_t_laac.start_tms" dataType="DATETIME"/>
			<field name="ft_t_laac.end_tms" dataType="DATETIME"/>
		</inputFields>
		<defaultFields/>
		<where>
			<field name="ft_t_laac.laap_oid" dataType="STRING" srcOccurrence="MHIFLARLAAP" valueOf="ft_t_laap.laap_oid"/>
		</where>
	</occurrence>
	<occurrence table="ft_t_laac" id="MHIFLARLAAPLAACVM" parentId="MHIFLARLAAPVM" label="AnnexureCalendarsVM" multiple="true">
		<inputFields>
			<field name="ft_t_laac.cal_id" dataType="STRING"/>
			<field name="ft_t_laac.cal_purp_typ" dataType="STRING"/>
			<field name="ft_t_laac.end_tms" dataType="DATETIME"/>
			<field name="ft_t_laac.start_tms" dataType="DATETIME"/>
		</inputFields>
		<where>
			<field name="ft_t_laac.laac_oid" dataType="STRING" srcOccurrence="MHIFLARLAAPVM" valueOf="ft_t_laap.laap_oid"/>
		</where>
	</occurrence>
	<occurrence table="ft_t_laac" id="MHIFLARLAAPLAACIMD" parentId="MHIFLARLAAPIMD" label="AnnexureCalendarsIMD" multiple="true">
		<inputFields>
			<field name="ft_t_laac.cal_id" dataType="STRING"/>
			<field name="ft_t_laac.cal_purp_typ" dataType="STRING"/>
			<field name="ft_t_laac.start_tms" dataType="DATETIME"/>
			<field name="ft_t_laac.end_tms" dataType="DATETIME"/>
		</inputFields>
		<where>
			<field name="ft_t_laac.laap_oid" dataType="STRING" srcOccurrence="MHIFLARLAAPIMD" valueOf="ft_t_laap.laap_oid"/>
		</where>
	</occurrence>
	<occurrence table="ft_t_lacd" id="MHIFLARLAAPLACDIMD" parentId="MHIFLARLAAPIMD" label="AnnexureCollateralDetailsIMD">
		<inputFields>
			<field name="ft_t_lacd.coll_call_fq_sp_typ" dataType="STRING"/>
			<field name="ft_t_lacd.margin_call_notfcn_tme" dataType="DATETIME"/>
			<field name="ft_t_lacd.coll_call_notfcn_tmz" dataType="STRING"/>
			<field name="ft_t_lacd.coll_call_fq_dy_typ" dataType="STRING"/>
			<field name="ft_t_lacd.start_tms" dataType="DATETIME"/>
		</inputFields>
	</occurrence>
	<relations>
		<table name="FT_T_IDMV">
			<relation relatedTable="FT_T_LAAN" name="LAANIDMVANNEXTYP">
				<fromColumns>
					<column name="INTRNL_DMN_VAL_TXT"/>
				</fromColumns>
				<toColumns>
					<column name="ANNEX_TYP"/>
				</toColumns>
				<condition>
					<sql>#FROM_TABLE#.FLD_ID =''01841414''</sql>
				</condition>
			</relation>
		</table>
		<table name="FT_T_IDMV">
			<relation relatedTable="FT_T_LAAN" name="LAANIDMVANNEXSTATTYP">
				<fromColumns>
					<column name="INTRNL_DMN_VAL_TXT"/>
				</fromColumns>
				<toColumns>
					<column name="ANNEX_STAT_TYP"/>
				</toColumns>
				<condition>
					<sql>#FROM_TABLE#.FLD_ID =''01871507''</sql>
				</condition>
			</relation>
		</table>
		<table name="FT_T_IDMV">
			<relation relatedTable="FT_T_LAAT" name="LAATIDMVTHSHLDVALFQSPTYP">
				<fromColumns>
					<column name="INTRNL_DMN_VAL_TXT"/>
				</fromColumns>
				<toColumns>
					<column name="THSHLD_VAL_FQ_SP_TYP"/>
				</toColumns>
				<condition>
					<sql>#FROM_TABLE#.FLD_ID =''01841462''</sql>
				</condition>
			</relation>
		</table>
		<table name="FT_T_GNCM">
			<relation relatedTable="FT_T_LAAP" name="LAAPGNCMCSTM">
				<fromColumns>
					<column name="CROSS_REF_ID"/>
				</fromColumns>
				<toColumns>
					<column name="LAAP_OID"/>
				</toColumns>
				<condition>
					<sql>#FROM_TABLE#.GNCM_TBL_TYP = ''LAAP''</sql>
				</condition>
			</relation>
		</table>
		<table name="FT_T_GNCM">
			<relation relatedTable="FT_T_LAAT" name="LAATGNCMCSTM">
				<fromColumns>
					<column name="CROSS_REF_ID"/>
				</fromColumns>
				<toColumns>
					<column name="LAAT_OID"/>
				</toColumns>
				<condition>
					<sql>#FROM_TABLE#.GNCM_TBL_TYP = ''LAAT''</sql>
				</condition>
			</relation>
		</table>
		<table name="FT_T_IDMV">
			<relation relatedTable="FT_T_LACV" name="LACVIDMVCUSTPRODNME">
				<fromColumns>
					<column name="INTRNL_DMN_VAL_TXT"/>
				</fromColumns>
				<toColumns>
					<column name="CUST_PROD_NME"/>
				</toColumns>
				<condition>
					<sql>#FROM_TABLE#.FLD_ID =''01871520''</sql>
				</condition>
			</relation>
		</table>
		<table name="FT_T_IDMV">
			<relation relatedTable="FT_T_CVT1" name="CVT1IDMVTRANTYP">
				<fromColumns>
					<column name="INTRNL_DMN_VAL_TXT"/>
				</fromColumns>
				<toColumns>
					<column name="TRAN_TYP"/>
				</toColumns>
				<condition>
					<sql>#FROM_TABLE#.FLD_ID =''01871520''</sql>
				</condition>
			</relation>
		</table>
		<table name="FT_T_UPD1">
			<relation relatedTable="FT_T_LAGR" name="UPD1LAGR">
				<fromColumns>
					<column name="XREF_TBL_ROW_OID"/>
				</fromColumns>
				<toColumns>
					<column name="CROSS_REF_ID"/>
				</toColumns>
				<condition>
					<sql>#FROM_TABLE#.entity_tbl_typ=''LAGR'' and #FROM_TABLE#.sequenceno = (select max( sequenceno ) from ft_t_upd1 upma where upma.xref_tbl_row_oid = #FROM_TABLE#.xref_tbl_row_oid )</sql>
				</condition>
			</relation>
		</table>
		<table name="FT_T_PBAT">
			<relation relatedTable="FT_T_LAGR" name="PBATLAGR">
				<fromColumns>
					<column name="PUB_CROSS_REF_ID"/>
				</fromColumns>
				<toColumns>
					<column name="LAGR_OID"/>
				</toColumns>
				<condition>
					<sql>#FROM_TABLE#.published_tbl_id=''LAGR'' AND #FROM_TABLE#.last_chg_tms = ( select max(pbat.last_chg_tms) from ft_t_pbat pbat where pbat.pub_cross_ref_id = #FROM_TABLE#.pub_cross_ref_id )</sql>
				</condition>
			</relation>
		</table>
		<table name="FT_T_GNCM">
			<relation relatedTable="FT_T_LAGR" name="LAGRGNCMCSTM">
				<fromColumns>
					<column name="CROSS_REF_ID"/>
				</fromColumns>
				<toColumns>
					<column name="LAGR_OID"/>
				</toColumns>
				<condition>
					<sql>#FROM_TABLE#.GNCM_TBL_TYP = ''LAGR''</sql>
				</condition>
			</relation>
		</table>
	</relations>
</model>', last_chg_tms= SYSDATE() WHERE modl_id = 'LAGR_PUB';