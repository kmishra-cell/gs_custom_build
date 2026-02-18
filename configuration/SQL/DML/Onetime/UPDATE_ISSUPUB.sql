UPDATE FT_T_MDDF SET modl_schema = '<?xml version="1.0" encoding="UTF-8"?>
<model xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="../../schemas/Model.xsd" id="ISSUPUB">
	<occurrence id="ISSUPUB" table="ft_t_issu">
		<inputFields>
			<field name="ft_t_issu.iss_typ" label="Instrument Type"/>
			<field name="ft_t_issu.denom_curr_cde"/>
			<field name="ft_t_issu.sec_form_typ"/>
			<field name="ft_t_issu.nom_val_unit_camt"/>
			<field name="ft_t_issu.distribution_curr_cde"/>
			<field name="ft_t_issu.iss_tms" label="Instrument Date"/>
			<field name="ft_t_issu.cl_typ"/>
			<field name="ft_t_issu.access_auth_typ" dataType="STRING"/>
			<field name="ft_t_issu.iss_actvy_stat_typ" dataType="STRING"/>
			<field name="ft_t_issu.start_tms" dataType="DATETIME"/>
			<field name="ft_t_issu.pref_iss_nme" dataType="STRING"/>
			<field name="ft_t_issu.pref_iss_desc" dataType="STRING"/>
			<field name="ft_t_issu.avr_exempt_ind" dataType="STRING"/>
			<field name="ft_t_issu.bnch_oid" dataType="STRING"/>
			<field name="ft_t_issu.cnvr_typ" dataType="STRING"/>
			<field name="ft_t_issu.created_data_prov_id" dataType="STRING"/>
			<field name="ft_t_issu.created_redistributor_id" dataType="STRING"/>
			<field name="ft_t_issu.created_tms" dataType="DATETIME"/>
			<field name="ft_t_issu.data_redistributor_id" dataType="STRING"/>
			<field name="ft_t_issu.data_src_id" dataType="STRING"/>
			<field name="ft_t_issu.data_stat_typ" dataType="STRING"/>
			<field name="ft_t_issu.day_settle_qty" dataType="NUMBER"/>
			<field name="ft_t_issu.dec_prec_num" dataType="NUMBER"/>
			<field name="ft_t_issu.dflt_tms" dataType="DATETIME"/>
			<field name="ft_t_issu.dflt_stat_typ" dataType="STRING"/>
			<field name="ft_t_issu.dflt_trdng_stat_typ" dataType="STRING"/>
			<field name="ft_t_issu.dlv_reas_cde" dataType="STRING"/>
			<field name="ft_t_issu.dlv_ind" dataType="STRING"/>
			<field name="ft_t_issu.end_tms" dataType="DATETIME"/>
			<field name="ft_t_issu.euro_cnvr_typ" dataType="STRING"/>
			<field name="ft_t_issu.eist_oid" dataType="STRING"/>
			<field name="ft_t_issu.foreign_custody_ind" dataType="STRING"/>
			<field name="ft_t_issu.govt_supp_ind" dataType="STRING"/>
			<field name="ft_t_issu.illiquidity_ind" dataType="STRING"/>
			<field name="ft_t_issu.inc_bas_typ" dataType="STRING"/>
			<field name="ft_t_issu.indiv_certif_ind" dataType="STRING"/>
			<field name="ft_t_issu.invs_close_dte" dataType="DATETIME"/>
			<field name="ft_t_issu.iss_actvy_stat_tms" dataType="DATETIME"/>
			<field name="ft_t_issu.iss_actvy_stat_reas_typ" dataType="STRING"/>
			<field name="ft_t_issu.iss_alph_srch_txt" dataType="STRING"/>
			<field name="ft_t_issu.iss_obj_typ" dataType="STRING"/>
			<field name="ft_t_issu.iss_rate_txt" dataType="STRING"/>
			<field name="ft_t_issu.iss_tenor_typ" dataType="STRING"/>
			<field name="ft_t_issu.iscd_oid" dataType="STRING"/>
			<field name="ft_t_issu.iss_ut_cqty" dataType="NUMBER"/>
			<field name="ft_t_issu.iss_ut_meas_typ" dataType="STRING"/>
			<field name="ft_t_issu.last_chg_tms" dataType="DATETIME"/>
			<field name="ft_t_issu.last_chg_usr_id" dataType="STRING"/>
			<field name="ft_t_issu.liquid_right_rank_typ" dataType="STRING"/>
			<field name="ft_t_issu.mand_cnvr_ind" dataType="STRING"/>
			<field name="ft_t_issu.mkt_list_typ" dataType="STRING"/>
			<field name="ft_t_issu.mat_exp_tms" dataType="DATETIME"/>
			<field name="ft_t_issu.mat_exp_dte_extn_tms" dataType="DATETIME"/>
			<field name="ft_t_issu.mat_dte_typ" dataType="STRING"/>
			<field name="ft_t_issu.mat_typ" dataType="STRING"/>
			<field name="ft_t_issu.mat_val_lnk_typ" dataType="STRING"/>
			<field name="ft_t_issu.min_net_worth_bal_ind" dataType="STRING"/>
			<field name="ft_t_issu.monitor_restriction_cde" dataType="STRING"/>
			<field name="ft_t_issu.most_favored_lender_ind" dataType="STRING"/>
			<field name="ft_t_issu.prin_notl_ind" dataType="STRING"/>
			<field name="ft_t_issu.not_tradable_ind" dataType="STRING"/>
			<field name="ft_t_issu.orig_data_prov_id" dataType="STRING"/>
			<field name="ft_t_issu.orig_mat_exp_tms" dataType="DATETIME"/>
			<field name="ft_t_issu.part_full_pd_typ" dataType="STRING"/>
			<field name="ft_t_issu.par_value_typ" dataType="STRING"/>
			<field name="ft_t_issu.pref_id_ctxt_typ" dataType="STRING"/>
			<field name="ft_t_issu.pref_iss_id" dataType="STRING"/>
			<field name="ft_t_issu.prc_qt_meth_typ" dataType="STRING"/>
			<field name="ft_t_issu.prc_mltplr_crte" dataType="NUMBER"/>
			<field name="ft_t_issu.prin_bas_typ" dataType="STRING"/>
			<field name="ft_t_issu.rtng_maint_provs_ind" dataType="STRING"/>
			<field name="ft_t_issu.reissue_tms" dataType="DATETIME"/>
			<field name="ft_t_issu.repackaged_sec_ind" dataType="STRING"/>
			<field name="ft_t_issu.sec_lending_elig_ind" dataType="STRING"/>
			<field name="ft_t_issu.series_typ" dataType="STRING"/>
			<field name="ft_t_issu.structured_sec_feat_txt" dataType="STRING"/>
			<field name="ft_t_issu.structured_sec_ind" dataType="STRING"/>
			<field name="ft_t_issu.substitution_clause_ind" dataType="STRING"/>
			<field name="ft_t_issu.tba_elig_typ" dataType="STRING"/>
			<field name="ft_t_issu.trdg_rst_typ" dataType="STRING"/>
			<field name="ft_t_issu.tsfr_rst_ind" dataType="STRING"/>
			<field name="ft_t_issu.typ_earn_for_life_cde" dataType="STRING"/>
			<field name="ft_t_issu.when_issued_ind" dataType="STRING"/>
			<field name="ft_t_issu.wthhld_tax_ind" dataType="STRING"/>
			<field name="ft_t_issu.wthhld_tax_levied_src_ind" dataType="STRING"/>
			<field name="ft_t_issu.instr_id" dataType="STRING"/>
		</inputFields>
		<where activeOnly="false"/>
	</occurrence>
	<occurrence table="ft_t_idmv" id="IDMVISSU" parentId="ISSUPUB" label="PaymentRank" dbConstraint="IDMVISSU">
		<inputFields>
			<field name="ft_t_idmv.intrnl_dmn_val_nme" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_bdch" id="BDCH" parentId="ISSUPUB" multiple="true">
		<inputFields>
			<field name="ft_t_bdch.bond_rtr_meth_typ" dataType="STRING"/>
			<field name="ft_t_bdch.bond_typ" dataType="STRING"/>
			<field name="ft_t_bdch.bus_dy_conv_typ" dataType="STRING"/>
			<field name="ft_t_bdch.dual_curr_ind" dataType="STRING"/>
			<field name="ft_t_bdch.last_chg_tms" dataType="DATETIME"/>
			<field name="ft_t_bdch.start_tms" dataType="DATETIME"/>
			<field name="ft_t_bdch.mn_denom_camt" dataType="NUMBER"/>
			<field name="ft_t_bdch.cpn_typ" dataType="STRING"/>
			<field name="ft_t_bdch.dted_tms" dataType="DATETIME"/>
			<field name="ft_t_bdch.first_cpn_pd_typ" dataType="STRING"/>
			<field name="ft_t_bdch.last_cpn_pd_typ" dataType="STRING"/>
			<field name="ft_t_bdch.eom_due_dte_ind" dataType="STRING"/>
			<field name="ft_t_bdch.call_by_debtor_ind" dataType="STRING"/>
			<field name="ft_t_bdch.call_by_creditor_ind" dataType="STRING"/>
			<field name="ft_t_bdch.iss_factorable_ind" dataType="STRING"/>
			<field name="ft_t_bdch.sinkable_ind" dataType="STRING"/>
			<field name="ft_t_bdch.call_typ" dataType="STRING"/>
			<field name="ft_t_bdch.cvt_issr_hold_typ" dataType="STRING"/>
			<field name="ft_t_bdch.calc_typ" dataType="STRING"/>
			<field name="ft_t_bdch.cr_linked_ind" dataType="STRING"/>
			<field name="ft_t_bdch.specific_cpn_typ" dataType="STRING"/>
			<field name="ft_t_bdch.inflation_protected_ind" dataType="STRING"/>
			<field name="ft_t_bdch.exchangable_ind" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_bdst" id="BDST" parentId="ISSUPUB" multiple="true">
		<inputFields>
			<field name="ft_t_bdst.outst_camt" dataType="NUMBER"/>
			<field name="ft_t_bdst.an_retired_cpct" dataType="NUMBER"/>
			<field name="ft_t_bdst.bond_csh_flow_camt" dataType="NUMBER"/>
			<field name="ft_t_bdst.calc_rec_rdm_camt" dataType="NUMBER"/>
			<field name="ft_t_bdst.call_dte" dataType="DATETIME"/>
			<field name="ft_t_bdst.call_sprd_to_treas_cqty" dataType="NUMBER"/>
			<field name="ft_t_bdst.cbe_yield_to_mat_cpct" dataType="NUMBER"/>
			<field name="ft_t_bdst.cbe_yield_to_worst_cpct" dataType="NUMBER"/>
			<field name="ft_t_bdst.cmpnd_yield_to_mat_cpct" dataType="NUMBER"/>
			<field name="ft_t_bdst.cpn_dte" dataType="DATETIME"/>
			<field name="ft_t_bdst.cpn_crte" dataType="NUMBER"/>
			<field name="ft_t_bdst.cpn_rate_typ" dataType="STRING"/>
			<field name="ft_t_bdst.cr_enhc_camt" dataType="NUMBER"/>
			<field name="ft_t_bdst.cr_event_occurred_ind" dataType="STRING"/>
			<field name="ft_t_bdst.crrnt_in_defer_ind" dataType="STRING"/>
			<field name="ft_t_bdst.crrnt_in_rte_mrgn_crte" dataType="NUMBER"/>
			<field name="ft_t_bdst.crrnt_iss_camt" dataType="NUMBER"/>
			<field name="ft_t_bdst.crrnt_prd_in_crte" dataType="NUMBER"/>
			<field name="ft_t_bdst.data_redistributor_id" dataType="STRING"/>
			<field name="ft_t_bdst.data_src_id" dataType="STRING"/>
			<field name="ft_t_bdst.data_stat_typ" dataType="STRING"/>
			<field name="ft_t_bdst.eff_mat_ytm_dte" dataType="DATETIME"/>
			<field name="ft_t_bdst.eff_mat_ytw_dte" dataType="DATETIME"/>
			<field name="ft_t_bdst.escrow_mat_dte" dataType="DATETIME"/>
			<field name="ft_t_bdst.est_inc_pay_camt" dataType="NUMBER"/>
			<field name="ft_t_bdst.est_pay_camt" dataType="NUMBER"/>
			<field name="ft_t_bdst.est_prin_pay_camt" dataType="NUMBER"/>
			<field name="ft_t_bdst.est_act_rte_diff_ind" dataType="STRING"/>
			<field name="ft_t_bdst.ex_div_cal_typ" dataType="STRING"/>
			<field name="ft_t_bdst.ex_div_dy_qty" dataType="NUMBER"/>
			<field name="ft_t_bdst.xo_rdm_active_ind" dataType="STRING"/>
			<field name="ft_t_bdst.first_py_in_yr_dte" dataType="DATETIME"/>
			<field name="ft_t_bdst.fch_flt_cryst_crte" dataType="NUMBER"/>
			<field name="ft_t_bdst.govt_bd_stat_typ" dataType="STRING"/>
			<field name="ft_t_bdst.hi_lo_sprd_typ" dataType="STRING"/>
			<field name="ft_t_bdst.inc_pay_camt" dataType="NUMBER"/>
			<field name="ft_t_bdst.indx_crte" dataType="NUMBER"/>
			<field name="ft_t_bdst.in_escrow_ind" dataType="STRING"/>
			<field name="ft_t_bdst.in_guarntd_pv_camt" dataType="NUMBER"/>
			<field name="ft_t_bdst.last_chg_tms" dataType="DATETIME"/>
			<field name="ft_t_bdst.installment_pay_crte" dataType="NUMBER"/>
			<field name="ft_t_bdst.last_chg_usr_id" dataType="STRING"/>
			<field name="ft_t_bdst.last_cpn_id" dataType="STRING"/>
			<field name="ft_t_bdst.last_reset_tms" dataType="DATETIME"/>
			<field name="ft_t_bdst.legal_opinion_nme" dataType="STRING"/>
			<field name="ft_t_bdst.nxt_call_dte" dataType="DATETIME"/>
			<field name="ft_t_bdst.nxt_call_cprc" dataType="NUMBER"/>
			<field name="ft_t_bdst.nxt_cptlzn_dte" dataType="DATETIME"/>
			<field name="ft_t_bdst.nxt_cptlzn_camt" dataType="NUMBER"/>
			<field name="ft_t_bdst.next_cond_cpn_reset_dte" dataType="DATETIME"/>
			<field name="ft_t_bdst.nxt_cpn_dte" dataType="DATETIME"/>
			<field name="ft_t_bdst.nxt_cpn_crte" dataType="NUMBER"/>
			<field name="ft_t_bdst.nxt_est_sink_camt" dataType="NUMBER"/>
			<field name="ft_t_bdst.nxt_xo_dte" dataType="DATETIME"/>
			<field name="ft_t_bdst.next_xo_cprc" dataType="NUMBER"/>
			<field name="ft_t_bdst.nxt_fact_dte" dataType="DATETIME"/>
			<field name="ft_t_bdst.nxt_fact_crte" dataType="NUMBER"/>
			<field name="ft_t_bdst.next_in_rte_mrgn_crte" dataType="NUMBER"/>
			<field name="ft_t_bdst.nxt_par_call_dte" dataType="DATETIME"/>
			<field name="ft_t_bdst.nxt_par_call_cprc" dataType="NUMBER"/>
			<field name="ft_t_bdst.nxt_par_put_dte" dataType="DATETIME"/>
			<field name="ft_t_bdst.nxt_par_put_cprc" dataType="NUMBER"/>
			<field name="ft_t_bdst.nxt_prem_call_dte" dataType="DATETIME"/>
			<field name="ft_t_bdst.nxt_prem_call_cprc" dataType="NUMBER"/>
			<field name="ft_t_bdst.nxt_put_dte" dataType="DATETIME"/>
			<field name="ft_t_bdst.nxt_put_cprc" dataType="NUMBER"/>
			<field name="ft_t_bdst.nxt_refix_dte" dataType="DATETIME"/>
			<field name="ft_t_bdst.nxt_rate_fixing_indx_nme" dataType="STRING"/>
			<field name="ft_t_bdst.nxt_rdm_cprc" dataType="NUMBER"/>
			<field name="ft_t_bdst.nxt_refund_dte" dataType="DATETIME"/>
			<field name="ft_t_bdst.nxt_sink_camt" dataType="NUMBER"/>
			<field name="ft_t_bdst.nxt_sink_2_camt" dataType="NUMBER"/>
			<field name="ft_t_bdst.nxt_sink_amt_typ" dataType="STRING"/>
			<field name="ft_t_bdst.nxt_sink_2_amt_typ" dataType="STRING"/>
			<field name="ft_t_bdst.nxt_sink_bas_typ" dataType="STRING"/>
			<field name="ft_t_bdst.nxt_sink_2_bas_typ" dataType="STRING"/>
			<field name="ft_t_bdst.nxt_sink_dte" dataType="DATETIME"/>
			<field name="ft_t_bdst.nxt_sink_cpct" dataType="NUMBER"/>
			<field name="ft_t_bdst.nxt_sink_cprc" dataType="NUMBER"/>
			<field name="ft_t_bdst.nxt_step_dte" dataType="DATETIME"/>
			<field name="ft_t_bdst.nxt_step_crte" dataType="NUMBER"/>
			<field name="ft_t_bdst.nxt_tender_dte" dataType="DATETIME"/>
			<field name="ft_t_bdst.nominal_yield_cpct" dataType="NUMBER"/>
			<field name="ft_t_bdst.non_annual_cpn_crte" dataType="NUMBER"/>
			<field name="ft_t_bdst.nonstd_nxt_sink_camt" dataType="NUMBER"/>
			<field name="ft_t_bdst.nonstd_nxt_sink_dte" dataType="DATETIME"/>
			<field name="ft_t_bdst.nonstd_nxt_sink_cprc" dataType="NUMBER"/>
			<field name="ft_t_bdst.oas_curve_id" dataType="STRING"/>
			<field name="ft_t_bdst.obligation_pref_dte" dataType="DATETIME"/>
			<field name="ft_t_bdst.obligation_pref_ind" dataType="STRING"/>
			<field name="ft_t_bdst.offer_lnk_id" dataType="STRING"/>
			<field name="ft_t_bdst.orig_data_prov_id" dataType="STRING"/>
			<field name="ft_t_bdst.pay_camt" dataType="NUMBER"/>
			<field name="ft_t_bdst.pay_stat_typ" dataType="STRING"/>
			<field name="ft_t_bdst.pay_stat_tms" dataType="DATETIME"/>
			<field name="ft_t_bdst.prev_cpn_dte" dataType="DATETIME"/>
			<field name="ft_t_bdst.prev_cpn_crte" dataType="NUMBER"/>
			<field name="ft_t_bdst.prev_fact_dte" dataType="DATETIME"/>
			<field name="ft_t_bdst.prev_fact_crte" dataType="NUMBER"/>
			<field name="ft_t_bdst.prev_reset_dte" dataType="DATETIME"/>
			<field name="ft_t_bdst.prin_guarntd_pv_camt" dataType="NUMBER"/>
			<field name="ft_t_bdst.prin_pay_camt" dataType="NUMBER"/>
			<field name="ft_t_bdst.put_dte" dataType="DATETIME"/>
			<field name="ft_t_bdst.put_notfcn_bind_stat_typ" dataType="STRING"/>
			<field name="ft_t_bdst.rate_fixing_indx_upd_dte" dataType="DATETIME"/>
			<field name="ft_t_bdst.put_notfcn_wdrwl_dy_cnt" dataType="NUMBER"/>
			<field name="ft_t_bdst.real_first_py_tms" dataType="DATETIME"/>
			<field name="ft_t_bdst.rec_rdm_camt" dataType="NUMBER"/>
			<field name="ft_t_bdst.rec_rdm_dte" dataType="DATETIME"/>
			<field name="ft_t_bdst.rec_rdm_quote_typ" dataType="STRING"/>
			<field name="ft_t_bdst.rec_rdm_cpct" dataType="NUMBER"/>
			<field name="ft_t_bdst.redenom_ind" dataType="STRING"/>
			<field name="ft_t_bdst.rld_bnchmrk_nme" dataType="STRING"/>
			<field name="ft_t_bdst.rev_iss_cprc" dataType="NUMBER"/>
			<field name="ft_t_bdst.secnd_call_dte" dataType="DATETIME"/>
			<field name="ft_t_bdst.secnd_call_cprc" dataType="NUMBER"/>
			<field name="ft_t_bdst.sink_fund_stat_typ" dataType="STRING"/>
			<field name="ft_t_bdst.sink_fund_stat_tms" dataType="DATETIME"/>
			<field name="ft_t_bdst.sink_cpct" dataType="NUMBER"/>
			<field name="ft_t_bdst.sink_cprc" dataType="NUMBER"/>
			<field name="ft_t_bdst.sprd_to_treas_cqty" dataType="NUMBER"/>
			<field name="ft_t_bdst.sprd_to_treas_cmpnd_typ" dataType="STRING"/>
			<field name="ft_t_bdst.sprd_to_treas_dy_bas_desc" dataType="STRING"/>
			<field name="ft_t_bdst.spse_calc_cpn_ind" dataType="STRING"/>
			<field name="ft_t_bdst.stats_curr_cde" dataType="STRING"/>
			<field name="ft_t_bdst.stats_eff_tms" dataType="DATETIME"/>
			<field name="ft_t_bdst.tail_denom_camt" dataType="NUMBER"/>
			<field name="ft_t_bdst.trdng_flat_ind" dataType="STRING"/>
			<field name="ft_t_bdst.volun_sink_camt" dataType="NUMBER"/>
			<field name="ft_t_bdst.wthhld_tax_camt" dataType="NUMBER"/>
			<field name="ft_t_bdst.yield_to_call_cpct" dataType="NUMBER"/>
			<field name="ft_t_bdst.yield_to_mat_cpct" dataType="NUMBER"/>
			<field name="ft_t_bdst.zero_cpn_cnvr_crte" dataType="NUMBER"/>
			<field name="ft_t_bdst.call_cprc" dataType="NUMBER"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_frip" id="FRIP" parentId="ISSUPUB" multiple="true">
		<inputFields>
			<field name="ft_t_frip.csh_stl_days_cnt" dataType="NUMBER"/>
			<field name="ft_t_frip.data_src_id" dataType="STRING"/>
			<field name="ft_t_frip.data_stat_typ" dataType="STRING"/>
			<field name="ft_t_frip.end_tms" dataType="DATETIME"/>
			<field name="ft_t_frip.fins_inst_mnem" dataType="STRING"/>
			<field name="ft_t_frip.finsrl_typ" dataType="STRING"/>
			<field name="ft_t_frip.finsrl_iss_prt_id" dataType="STRING"/>
			<field name="ft_t_frip.inst_city_nme" dataType="STRING"/>
			<field name="ft_t_frip.inst_nme" dataType="STRING"/>
			<field name="ft_t_frip.inst_rl_typ" dataType="STRING"/>
			<field name="ft_t_frip.inst_routing_id" dataType="STRING"/>
			<field name="ft_t_frip.inst_ste_prv_cde" dataType="STRING"/>
			<field name="ft_t_frip.iss_ut_cqty" dataType="NUMBER"/>
			<field name="ft_t_frip.iss_ut_meas_typ" dataType="STRING"/>
			<field name="ft_t_frip.iss_ut_purp_typ" dataType="STRING"/>
			<field name="ft_t_frip.last_chg_tms" dataType="DATETIME"/>
			<field name="ft_t_frip.last_chg_usr_id" dataType="STRING"/>
			<field name="ft_t_frip.prt_purp_typ" dataType="STRING"/>
			<field name="ft_t_frip.part_camt" dataType="NUMBER"/>
			<field name="ft_t_frip.part_curr_cde" dataType="STRING"/>
			<field name="ft_t_frip.part_cpct" dataType="NUMBER"/>
			<field name="ft_t_frip.pay_recv_typ" dataType="STRING"/>
			<field name="ft_t_frip.prim_rel_ind" dataType="STRING"/>
			<field name="ft_t_frip.rel_stat_typ" dataType="STRING"/>
			<field name="ft_t_frip.rel_stat_tms" dataType="DATETIME"/>
			<field name="ft_t_frip.start_tms" dataType="DATETIME"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_iedf" id="EIDF" parentId="ISSUPUB" multiple="true">
		<inputFields>
			<field name="ft_t_iedf.calc_meth_typ" dataType="STRING"/>
			<field name="ft_t_iedf.accrl_dte_deriv_meth_typ" dataType="STRING"/>
			<field name="ft_t_iedf.accrl_fq_qty" dataType="NUMBER"/>
			<field name="ft_t_iedf.accrl_fq_dy_typ" dataType="STRING"/>
			<field name="ft_t_iedf.accrual_fq_desc" dataType="STRING"/>
			<field name="ft_t_iedf.accrl_fq_sp_typ" dataType="STRING"/>
			<field name="ft_t_iedf.anncmnt_prd_sp_typ" dataType="STRING"/>
			<field name="ft_t_iedf.base_cpi_crte" dataType="NUMBER"/>
			<field name="ft_t_iedf.bus_dy_conv_typ" dataType="STRING"/>
			<field name="ft_t_iedf.cmpnd_fq_sp_typ" dataType="STRING"/>
			<field name="ft_t_iedf.cpn_day_cnt_desc" dataType="STRING"/>
			<field name="ft_t_iedf.data_redistributor_id" dataType="STRING"/>
			<field name="ft_t_iedf.data_src_id" dataType="STRING"/>
			<field name="ft_t_iedf.data_stat_typ" dataType="STRING"/>
			<field name="ft_t_iedf.day_cnt_desc" dataType="STRING"/>
			<field name="ft_t_iedf.dayout_proc_ind" dataType="STRING"/>
			<field name="ft_t_iedf.days_mth_bas_typ" dataType="STRING"/>
			<field name="ft_t_iedf.days_mth_cpn_bas_typ" dataType="STRING"/>
			<field name="ft_t_iedf.days_yr_bas_typ" dataType="STRING"/>
			<field name="ft_t_iedf.days_yr_cpn_bas_typ" dataType="STRING"/>
			<field name="ft_t_iedf.end_tms" dataType="DATETIME"/>
			<field name="ft_t_iedf.ev_desc" dataType="STRING"/>
			<field name="ft_t_iedf.ev_typ" dataType="STRING"/>
			<field name="ft_t_iedf.ev_pay_meth_typ" dataType="STRING"/>
			<field name="ft_t_iedf.first_py_tms" dataType="DATETIME"/>
			<field name="ft_t_iedf.frst_pay_reset_tms" dataType="DATETIME"/>
			<field name="ft_t_iedf.frst_rtfx_index_avg_typ" dataType="STRING"/>
			<field name="ft_t_iedf.frst_rtfx_index_sub_typ" dataType="STRING"/>
			<field name="ft_t_iedf.frst_rtfx_index_typ" dataType="STRING"/>
			<field name="ft_t_iedf.frst_rte_reset_tms" dataType="DATETIME"/>
			<field name="ft_t_iedf.fixed_pay_dte_ind" dataType="STRING"/>
			<field name="ft_t_iedf.float_max_camt" dataType="NUMBER"/>
			<field name="ft_t_iedf.float_max_quote_typ" dataType="STRING"/>
			<field name="ft_t_iedf.float_max_unit_typ" dataType="STRING"/>
			<field name="ft_t_iedf.float_min_camt" dataType="NUMBER"/>
			<field name="ft_t_iedf.float_min_quote_typ" dataType="STRING"/>
			<field name="ft_t_iedf.float_min_unit_typ" dataType="STRING"/>
			<field name="ft_t_iedf.flt_bas_pt_cqty" dataType="NUMBER"/>
			<field name="ft_t_iedf.mx_crte" dataType="NUMBER"/>
			<field name="ft_t_iedf.mn_crte" dataType="NUMBER"/>
			<field name="ft_t_iedf.flt_mltplr_crte" dataType="NUMBER"/>
			<field name="ft_t_iedf.flt_rte_cpct" dataType="NUMBER"/>
			<field name="ft_t_iedf.flt_reset_dy_qty" dataType="NUMBER"/>
			<field name="ft_t_iedf.ev_end_prd" dataType="STRING"/>
			<field name="ft_t_iedf.ev_start_prd" dataType="STRING"/>
			<field name="ft_t_iedf.inc_sch_cmplt_ind" dataType="STRING"/>
			<field name="ft_t_iedf.index_rnd_meth_typ" dataType="STRING"/>
			<field name="ft_t_iedf.int_rte_cut_off_day_typ" dataType="STRING"/>
			<field name="ft_t_iedf.inverse_flt_cpct" dataType="NUMBER"/>
			<field name="ft_t_iedf.last_chg_tms" dataType="DATETIME"/>
			<field name="ft_t_iedf.last_chg_usr_id" dataType="STRING"/>
			<field name="ft_t_iedf.last_coupon_tms" dataType="DATETIME"/>
			<field name="ft_t_iedf.last_verif_tms" dataType="DATETIME"/>
			<field name="ft_t_iedf.limit_prd_fq_qty" dataType="NUMBER"/>
			<field name="ft_t_iedf.max_anncmnt_prd_cnt" dataType="NUMBER"/>
			<field name="ft_t_iedf.limit_prd_fq_sp_typ" dataType="STRING"/>
			<field name="ft_t_iedf.mx_chg_crte" dataType="NUMBER"/>
			<field name="ft_t_iedf.min_anncmnt_prd_cnt" dataType="NUMBER"/>
			<field name="ft_t_iedf.mn_indx_chg_crte" dataType="NUMBER"/>
			<field name="ft_t_iedf.mn_chg_crte" dataType="NUMBER"/>
			<field name="ft_t_iedf.certif_drawn_cnt" dataType="NUMBER"/>
			<field name="ft_t_iedf.orig_data_prov_id" dataType="STRING"/>
			<field name="ft_t_iedf.other_rtfx_cond_cde" dataType="STRING"/>
			<field name="ft_t_iedf.py_dte_fq_qty" dataType="NUMBER"/>
			<field name="ft_t_iedf.py_dte_fq_dy_typ" dataType="STRING"/>
			<field name="ft_t_iedf.py_dte_fq_desc" dataType="STRING"/>
			<field name="ft_t_iedf.py_dte_fq_sp_typ" dataType="STRING"/>
			<field name="ft_t_iedf.pay_dte_meth_nme" dataType="STRING"/>
			<field name="ft_t_iedf.pay_day_aj_typ" dataType="STRING"/>
			<field name="ft_t_iedf.pay_day_typ" dataType="STRING"/>
			<field name="ft_t_iedf.pay_per_reset_cnt" dataType="NUMBER"/>
			<field name="ft_t_iedf.penult_cpn_tms" dataType="DATETIME"/>
			<field name="ft_t_iedf.prd_end_aj_bas_typ" dataType="STRING"/>
			<field name="ft_t_iedf.prd_end_dy_aj_qty" dataType="NUMBER"/>
			<field name="ft_t_iedf.prd_end_mth_aj_qty" dataType="NUMBER"/>
			<field name="ft_t_iedf.protect_capital_cde" dataType="STRING"/>
			<field name="ft_t_iedf.protect_div_cde" dataType="STRING"/>
			<field name="ft_t_iedf.rte_determ_typ" dataType="STRING"/>
			<field name="ft_t_iedf.rtfx_aj_crte" dataType="NUMBER"/>
			<field name="ft_t_iedf.rtfx_aj_meth_typ" dataType="STRING"/>
			<field name="ft_t_iedf.rtfx_bas_txt" dataType="STRING"/>
			<field name="ft_t_iedf.rtfx_bas_typ" dataType="STRING"/>
			<field name="ft_t_iedf.rtfx_cal_id" dataType="STRING"/>
			<field name="ft_t_iedf.rtfx_fq_qty" dataType="NUMBER"/>
			<field name="ft_t_iedf.rtfx_fq_dy_typ" dataType="STRING"/>
			<field name="ft_t_iedf.rtfx_fq_sp_typ" dataType="STRING"/>
			<field name="ft_t_iedf.rtfx_fq_dy_cde" dataType="STRING"/>
			<field name="ft_t_iedf.rtfx_index_avg_typ" dataType="STRING"/>
			<field name="ft_t_iedf.rate_fixing_index_nme" dataType="STRING"/>
			<field name="ft_t_iedf.rtfx_index_sub_typ" dataType="STRING"/>
			<field name="ft_t_iedf.rtfx_index_typ" dataType="STRING"/>
			<field name="ft_t_iedf.rtfx_typ" dataType="STRING"/>
			<field name="ft_t_iedf.recdt_aj_bas_typ" dataType="STRING"/>
			<field name="ft_t_iedf.recdt_dy_aj_num" dataType="NUMBER"/>
			<field name="ft_t_iedf.recdt_fq_qty" dataType="NUMBER"/>
			<field name="ft_t_iedf.recdt_fq_dy_typ" dataType="STRING"/>
			<field name="ft_t_iedf.recdt_fq_sp_typ" dataType="STRING"/>
			<field name="ft_t_iedf.recdt_mth_aj_num" dataType="NUMBER"/>
			<field name="ft_t_iedf.rnd_frac_crte" dataType="NUMBER"/>
			<field name="ft_t_iedf.rnd_meth_typ" dataType="STRING"/>
			<field name="ft_t_iedf.settle_dte_deriv_meth_typ" dataType="STRING"/>
			<field name="ft_t_iedf.sprd_direction_typ" dataType="STRING"/>
			<field name="ft_t_iedf.start_tms" dataType="DATETIME"/>
			<field name="ft_t_iedf.var_rte_meth_id" dataType="STRING"/>
			<field name="ft_t_iedf.var_rte_formula_typ" dataType="STRING"/>
			<field name="ft_t_iedf.verif_ind" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_iscl" id="ISCL" parentId="ISSUPUB" multiple="true">
		<inputFields>
			<field name="ft_t_iscl.gu_cnt" dataType="NUMBER"/>
			<field name="ft_t_iscl.gu_id" dataType="STRING"/>
			<field name="ft_t_iscl.gu_typ" dataType="STRING"/>
			<field name="ft_t_iscl.indus_cl_set_id" dataType="STRING"/>
			<field name="ft_t_iscl.iss_clsf_desc" dataType="STRING"/>
			<field name="ft_t_iscl.last_chg_tms" dataType="DATETIME"/>
			<field name="ft_t_iscl.last_chg_usr_id" dataType="STRING"/>
			<field name="ft_t_iscl.nls_cde" dataType="STRING"/>
			<field name="ft_t_iscl.orig_data_prov_id" dataType="STRING"/>
			<field name="ft_t_iscl.start_tms" dataType="DATETIME"/>
			<field name="ft_t_iscl.clsf_purp_typ" dataType="STRING"/>
			<field name="ft_t_iscl.cl_value" dataType="STRING"/>
			<field name="ft_t_iscl.data_redistributor_id" dataType="STRING"/>
			<field name="ft_t_iscl.data_src_id" dataType="STRING"/>
			<field name="ft_t_iscl.data_stat_typ" dataType="STRING"/>
			<field name="ft_t_iscl.end_tms" dataType="DATETIME"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_incl" id="INCL" parentId="ISCL" dbConstraint="ISCLF003">
		<inputFields>
			<field name="ft_t_incl.cl_nme" dataType="STRING"/>
			<field name="ft_t_incl.cl_value" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_incs" id="INCS" parentId="INCL">
		<inputFields>
			<field name="ft_t_incs.clsf_set_mnem" dataType="STRING"/>
			<field name="ft_t_incs.cl_set_nme" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_isll" id="ISLL" parentId="ISSUPUB" multiple="true">
		<inputFields>
			<field name="ft_t_isll.coll_aggr_typ" dataType="STRING"/>
			<field name="ft_t_isll.coll_avg_iss_dte" dataType="DATETIME"/>
			<field name="ft_t_isll.coll_avg_orig_dte" dataType="DATETIME"/>
			<field name="ft_t_isll.coll_exp_typ" dataType="STRING"/>
			<field name="ft_t_isll.coll_grp_desc" dataType="STRING"/>
			<field name="ft_t_isll.coll_grp_id" dataType="STRING"/>
			<field name="ft_t_isll.coll_id" dataType="STRING"/>
			<field name="ft_t_isll.collateral_instr_id" dataType="STRING"/>
			<field name="ft_t_isll.coll_insur_typ" dataType="STRING"/>
			<field name="ft_t_isll.coll_insured_ind" dataType="STRING"/>
			<field name="ft_t_isll.coll_pd_end_tms" dataType="DATETIME"/>
			<field name="ft_t_isll.coll_cpct" dataType="NUMBER"/>
			<field name="ft_t_isll.coll_prov_city_nme" dataType="STRING"/>
			<field name="ft_t_isll.coll_pd_start_tms" dataType="DATETIME"/>
			<field name="ft_t_isll.coll_prov_id" dataType="STRING"/>
			<field name="ft_t_isll.coll_prov_id_ctxt_typ" dataType="STRING"/>
			<field name="ft_t_isll.coll_prov_nme" dataType="STRING"/>
			<field name="ft_t_isll.coll_prov_ste_prv_cde" dataType="STRING"/>
			<field name="ft_t_isll.coll_terms_txt" dataType="STRING"/>
			<field name="ft_t_isll.coll_typ" dataType="STRING"/>
			<field name="ft_t_isll.coll_val_typ" dataType="STRING"/>
			<field name="ft_t_isll.crrnt_bal_camt" dataType="NUMBER"/>
			<field name="ft_t_isll.data_src_id" dataType="STRING"/>
			<field name="ft_t_isll.data_stat_typ" dataType="STRING"/>
			<field name="ft_t_isll.deal_call_dte" dataType="DATETIME"/>
			<field name="ft_t_isll.deal_call_cpct" dataType="NUMBER"/>
			<field name="ft_t_isll.dis_coll_fq_qty" dataType="NUMBER"/>
			<field name="ft_t_isll.dis_coll_fq_dy_typ" dataType="STRING"/>
			<field name="ft_t_isll.dis_coll_fq_sp_typ" dataType="STRING"/>
			<field name="ft_t_isll.end_tms" dataType="DATETIME"/>
			<field name="ft_t_isll.finsrl_iss_prt_id" dataType="STRING"/>
			<field name="ft_t_isll.full_secnd_mrkt_ind" dataType="STRING"/>
			<field name="ft_t_isll.iss_coll_nme" dataType="STRING"/>
			<field name="ft_t_isll.last_chg_tms" dataType="DATETIME"/>
			<field name="ft_t_isll.last_chg_usr_id" dataType="STRING"/>
			<field name="ft_t_isll.last_revw_dte" dataType="DATETIME"/>
			<field name="ft_t_isll.loc_insur_cde" dataType="STRING"/>
			<field name="ft_t_isll.coll_camt" dataType="NUMBER"/>
			<field name="ft_t_isll.nxt_revw_dte" dataType="DATETIME"/>
			<field name="ft_t_isll.cpn_guarntd_qty" dataType="NUMBER"/>
			<field name="ft_t_isll.orig_term_qty" dataType="NUMBER"/>
			<field name="ft_t_isll.pass_thru_net_cpn_crte" dataType="NUMBER"/>
			<field name="ft_t_isll.revw_fq_qty" dataType="NUMBER"/>
			<field name="ft_t_isll.revw_fq_dy_typ" dataType="STRING"/>
			<field name="ft_t_isll.revw_fq_sp_typ" dataType="STRING"/>
			<field name="ft_t_isll.start_tms" dataType="DATETIME"/>
			<field name="ft_t_isll.wag_grs_cpn_crte" dataType="NUMBER"/>
			<field name="ft_t_isll.wag_remain_term_qty" dataType="NUMBER"/>
			<field name="ft_t_isll.wag_age_qty" dataType="NUMBER"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_iscm" id="ISCM" parentId="ISSUPUB" multiple="true">
		<inputFields>
			<field name="ft_t_iscm.cmnt_tms" dataType="DATETIME"/>
			<field name="ft_t_iscm.cmnt_reas_typ" dataType="STRING"/>
			<field name="ft_t_iscm.cmnt_stat_typ" dataType="STRING"/>
			<field name="ft_t_iscm.cmnt_txt" dataType="STRING"/>
			<field name="ft_t_iscm.data_src_id" dataType="STRING"/>
			<field name="ft_t_iscm.end_tms" dataType="DATETIME"/>
			<field name="ft_t_iscm.last_chg_tms" dataType="DATETIME"/>
			<field name="ft_t_iscm.last_chg_usr_id" dataType="STRING"/>
			<field name="ft_t_iscm.ln_num" dataType="NUMBER"/>
			<field name="ft_t_iscm.nls_cde" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_isgu" id="ISGU" parentId="ISSUPUB" multiple="true">
		<inputFields>
			<field name="ft_t_isgu.curr_typ" dataType="STRING"/>
			<field name="ft_t_isgu.data_redistributor_id" dataType="STRING"/>
			<field name="ft_t_isgu.data_src_id" dataType="STRING"/>
			<field name="ft_t_isgu.data_stat_typ" dataType="STRING"/>
			<field name="ft_t_isgu.end_tms" dataType="DATETIME"/>
			<field name="ft_t_isgu.gu_cnt" dataType="NUMBER"/>
			<field name="ft_t_isgu.gu_id" dataType="STRING"/>
			<field name="ft_t_isgu.gu_typ" dataType="STRING"/>
			<field name="ft_t_isgu.iss_gu_desc" dataType="STRING"/>
			<field name="ft_t_isgu.iss_gu_purp_typ" dataType="STRING"/>
			<field name="ft_t_isgu.lnd_area_camt" dataType="NUMBER"/>
			<field name="ft_t_isgu.lnd_area_ut_typ" dataType="STRING"/>
			<field name="ft_t_isgu.last_chg_tms" dataType="DATETIME"/>
			<field name="ft_t_isgu.last_chg_usr_id" dataType="STRING"/>
			<field name="ft_t_isgu.orig_data_prov_id" dataType="STRING"/>
			<field name="ft_t_isgu.part_camt" dataType="NUMBER"/>
			<field name="ft_t_isgu.part_curr_cde" dataType="STRING"/>
			<field name="ft_t_isgu.start_tms" dataType="DATETIME"/>
			<field name="ft_t_isgu.part_cpct" dataType="NUMBER"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_ismc" id="ISMC" parentId="ISSUPUB">
		<inputFields>
			<field name="ft_t_ismc.cap_nominal_camt" dataType="NUMBER"/>
			<field name="ft_t_ismc.cap_sec_cqty" dataType="NUMBER"/>
			<field name="ft_t_ismc.last_chg_tms" dataType="DATETIME"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_issr" id="ISSR" parentId="ISSUPUB" dbConstraint="ISSUF002">
		<inputFields>
			<field name="ft_t_issr.issr_nme" dataType="STRING"/>
			<field name="ft_t_issr.issr_desc" dataType="STRING"/>
			<field name="ft_t_issr.mult_shr_ind" dataType="STRING"/>
			<field name="ft_t_issr.pref_id_ctxt_typ" dataType="STRING"/>
			<field name="ft_t_issr.pref_issr_id" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_irde" id="IRDE" parentId="ISSR" multiple="true">
		<inputFields>
			<field name="ft_t_irde.data_stat_typ" dataType="STRING"/>
			<field name="ft_t_irde.desc_usage_typ" dataType="STRING"/>
			<field name="ft_t_irde.end_tms" dataType="DATETIME"/>
			<field name="ft_t_irde.issr_desc" dataType="STRING"/>
			<field name="ft_t_irde.issr_nme" dataType="STRING"/>
			<field name="ft_t_irde.last_chg_usr_id" dataType="STRING"/>
			<field name="ft_t_irde.last_chg_tms" dataType="DATETIME"/>
			<field name="ft_t_irde.nls_cde" dataType="STRING"/>
			<field name="ft_t_irde.start_tms" dataType="DATETIME"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_isrt" id="ISRT" parentId="ISSUPUB" multiple="true" dbConstraint="ISSU_RTNG_MHI">
		<inputFields>
			<field name="ft_t_isrt.data_redistributor_id" dataType="STRING"/>
			<field name="ft_t_isrt.data_src_id" dataType="STRING"/>
			<field name="ft_t_isrt.data_stat_typ" dataType="STRING"/>
			<field name="ft_t_isrt.end_tms" dataType="DATETIME"/>
			<field name="ft_t_isrt.last_chg_tms" dataType="DATETIME"/>
			<field name="ft_t_isrt.last_chg_usr_id" dataType="STRING"/>
			<field name="ft_t_isrt.last_rtng_revw_dte" dataType="DATETIME"/>
			<field name="ft_t_isrt.last_rtng_revw_usr_id" dataType="STRING"/>
			<field name="ft_t_isrt.mult_rtng_sale_typ" dataType="STRING"/>
			<field name="ft_t_isrt.orig_data_prov_id" dataType="STRING"/>
			<field name="ft_t_isrt.next_rtng_revw_dte" dataType="DATETIME"/>
			<field name="ft_t_isrt.rtng_curr_cde" dataType="STRING"/>
			<field name="ft_t_isrt.rtng_curr_typ" dataType="STRING"/>
			<field name="ft_t_isrt.rtng_debt_cl_typ" dataType="STRING"/>
			<field name="ft_t_isrt.rtng_direction_txt" dataType="STRING"/>
			<field name="ft_t_isrt.rtng_direction_dte" dataType="DATETIME"/>
			<field name="ft_t_isrt.rtng_eff_tms" dataType="DATETIME"/>
			<field name="ft_t_isrt.rtng_id" dataType="STRING"/>
			<field name="ft_t_isrt.rtng_outlook_agency_nme" dataType="STRING"/>
			<field name="ft_t_isrt.rtng_outlook_eff_dte" dataType="DATETIME"/>
			<field name="ft_t_isrt.rtng_outlook_end_dte" dataType="DATETIME"/>
			<field name="ft_t_isrt.rtng_outlook_typ" dataType="STRING"/>
			<field name="ft_t_isrt.rtng_purp_typ" dataType="STRING"/>
			<field name="ft_t_isrt.rtng_snrty_typ" dataType="STRING"/>
			<field name="ft_t_isrt.rtng_stat_typ" dataType="STRING"/>
			<field name="ft_t_isrt.rtng_stat_tms" dataType="DATETIME"/>
			<field name="ft_t_isrt.rtng_stat_reas_txt" dataType="STRING"/>
			<field name="ft_t_isrt.rtng_cde" dataType="STRING"/>
			<field name="ft_t_isrt.rtng_symbol_txt" dataType="STRING"/>
			<field name="ft_t_isrt.rtng_watch_agency_nme" dataType="STRING"/>
			<field name="ft_t_isrt.secnd_mrkt_ind" dataType="STRING"/>
			<field name="ft_t_isrt.start_tms" dataType="DATETIME"/>
			<field name="ft_t_isrt.underly_enhc_sale_typ" dataType="STRING"/>
			<field name="ft_t_isrt.watch_dte" dataType="DATETIME"/>
			<field name="ft_t_isrt.watch_exp_dte" dataType="DATETIME"/>
			<field name="ft_t_isrt.watch_reas_typ" dataType="STRING"/>
			<field name="ft_t_isrt.watch_stat_typ" dataType="STRING"/>
			<field name="ft_t_isrt.sys_eff_end_tms" dataType="DATETIME"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_rgch" id="RGCH" parentId="ISSUPUB" multiple="true">
		<inputFields>
			<field name="ft_t_rgch.acrd_in_dec_prec_num" dataType="NUMBER"/>
			<field name="ft_t_rgch.blue_sky_ind" dataType="STRING"/>
			<field name="ft_t_rgch.cntl_extr_allowed_ind" dataType="STRING"/>
			<field name="ft_t_rgch.data_src_id" dataType="STRING"/>
			<field name="ft_t_rgch.data_stat_typ" dataType="STRING"/>
			<field name="ft_t_rgch.ecb_guarantee_cde" dataType="STRING"/>
			<field name="ft_t_rgch.end_tms" dataType="DATETIME"/>
			<field name="ft_t_rgch.erisa_ind" dataType="STRING"/>
			<field name="ft_t_rgch.eusd_elig_ind" dataType="STRING"/>
			<field name="ft_t_rgch.fund_euro_ucits_ind" dataType="STRING"/>
			<field name="ft_t_rgch.gu_cnt" dataType="NUMBER"/>
			<field name="ft_t_rgch.gu_id" dataType="STRING"/>
			<field name="ft_t_rgch.gu_typ" dataType="STRING"/>
			<field name="ft_t_rgch.hofuri_chg_dte" dataType="DATETIME"/>
			<field name="ft_t_rgch.hofuri_elig_ind" dataType="STRING"/>
			<field name="ft_t_rgch.isma_regulated_ind" dataType="STRING"/>
			<field name="ft_t_rgch.last_chg_tms" dataType="DATETIME"/>
			<field name="ft_t_rgch.last_chg_usr_id" dataType="STRING"/>
			<field name="ft_t_rgch.mifid_regulated_ind" dataType="STRING"/>
			<field name="ft_t_rgch.regs_rule144a_ind" dataType="STRING"/>
			<field name="ft_t_rgch.reg_d_ind" dataType="STRING"/>
			<field name="ft_t_rgch.reg_t_mrgn_sec_ind" dataType="STRING"/>
			<field name="ft_t_rgch.reg_s_ind" dataType="STRING"/>
			<field name="ft_t_rgch.rule_144a_3c7_ind" dataType="STRING"/>
			<field name="ft_t_rgch.rule_144a_disclaimer_ind" dataType="STRING"/>
			<field name="ft_t_rgch.rule_144a_ind" dataType="STRING"/>
			<field name="ft_t_rgch.rule_144a_regist_ind" dataType="STRING"/>
			<field name="ft_t_rgch.rule_3a3_cp_ind" dataType="STRING"/>
			<field name="ft_t_rgch.sec_restrict_typ" dataType="STRING"/>
			<field name="ft_t_rgch.start_tms" dataType="DATETIME"/>
			<field name="ft_t_rgch.tefra_c_ind" dataType="STRING"/>
			<field name="ft_t_rgch.tefra_d_ind" dataType="STRING"/>
			<field name="ft_t_rgch.us_form_1099_typ" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_isst" id="ISST" parentId="ISSUPUB" multiple="true">
		<inputFields>
			<field name="ft_t_isst.data_redistributor_id" dataType="STRING"/>
			<field name="ft_t_isst.data_src_id" dataType="STRING"/>
			<field name="ft_t_isst.data_stat_typ" dataType="STRING"/>
			<field name="ft_t_isst.denom_curr_cde" dataType="STRING"/>
			<field name="ft_t_isst.end_tms" dataType="DATETIME"/>
			<field name="ft_t_isst.last_chg_tms" dataType="DATETIME"/>
			<field name="ft_t_isst.last_chg_usr_id" dataType="STRING"/>
			<field name="ft_t_isst.orig_data_prov_id" dataType="STRING"/>
			<field name="ft_t_isst.start_tms" dataType="DATETIME"/>
			<field name="ft_t_isst.stat_val_camt" dataType="NUMBER"/>
			<field name="ft_t_isst.stat_char_val_txt" dataType="STRING"/>
			<field name="ft_t_isst.stat_val_tms" dataType="DATETIME"/>
			<field name="ft_t_isst.stat_val_dte" dataType="DATETIME"/>
			<field name="ft_t_isst.stat_def_id" dataType="STRING"/>
			<field name="ft_t_isst.stat_int_val_num" dataType="NUMBER"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_isca" id="ISCA" parentId="ISSUPUB" label="Issue Calendar Participant" multiple="true">
		<inputFields>
			<field name="ft_t_isca.cal_prt_desc" dataType="STRING"/>
			<field name="ft_t_isca.cal_purp_typ" dataType="STRING"/>
			<field name="ft_t_isca.cal_id" dataType="STRING"/>
			<field name="ft_t_isca.data_src_id" dataType="STRING"/>
			<field name="ft_t_isca.data_stat_typ" dataType="STRING"/>
			<field name="ft_t_isca.last_chg_tms" dataType="DATETIME"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_pedf" id="PEDF" parentId="ISSUPUB" multiple="true">
		<inputFields>
			<field name="ft_t_pedf.advance_notice_qty" dataType="NUMBER"/>
			<field name="ft_t_pedf.adv_notfcn_stat_typ" dataType="STRING"/>
			<field name="ft_t_pedf.bus_day_conv_typ" dataType="STRING"/>
			<field name="ft_t_pedf.data_src_id" dataType="STRING"/>
			<field name="ft_t_pedf.day_cnt_desc" dataType="STRING"/>
			<field name="ft_t_pedf.data_stat_typ" dataType="STRING"/>
			<field name="ft_t_pedf.days_mth_bas_typ" dataType="STRING"/>
			<field name="ft_t_pedf.days_yr_bas_typ" dataType="STRING"/>
			<field name="ft_t_pedf.drw_bas_typ" dataType="STRING"/>
			<field name="ft_t_pedf.end_tms" dataType="DATETIME"/>
			<field name="ft_t_pedf.event_tms" dataType="DATETIME"/>
			<field name="ft_t_pedf.ev_desc" dataType="STRING"/>
			<field name="ft_t_pedf.ev_settle_meth_typ" dataType="STRING"/>
			<field name="ft_t_pedf.ev_typ" dataType="STRING"/>
			<field name="ft_t_pedf.first_call_cprc" dataType="NUMBER"/>
			<field name="ft_t_pedf.first_py_tms" dataType="DATETIME"/>
			<field name="ft_t_pedf.frst_pay_reset_tms" dataType="DATETIME"/>
			<field name="ft_t_pedf.frst_rte_reset_tms" dataType="DATETIME"/>
			<field name="ft_t_pedf.flt_reset_dy_qty" dataType="NUMBER"/>
			<field name="ft_t_pedf.last_chg_tms" dataType="DATETIME"/>
			<field name="ft_t_pedf.last_chg_usr_id" dataType="STRING"/>
			<field name="ft_t_pedf.last_py_tms" dataType="DATETIME"/>
			<field name="ft_t_pedf.last_verif_tms" dataType="DATETIME"/>
			<field name="ft_t_pedf.mand_opt_typ" dataType="STRING"/>
			<field name="ft_t_pedf.mx_adv_notice_qty" dataType="NUMBER"/>
			<field name="ft_t_pedf.mn_adv_notice_qty" dataType="NUMBER"/>
			<field name="ft_t_pedf.notify_prd_ut_typ" dataType="STRING"/>
			<field name="ft_t_pedf.py_dte_fq_qty" dataType="NUMBER"/>
			<field name="ft_t_pedf.py_dte_fq_dy_typ" dataType="STRING"/>
			<field name="ft_t_pedf.py_dte_fq_desc" dataType="STRING"/>
			<field name="ft_t_pedf.py_dte_fq_sp_typ" dataType="STRING"/>
			<field name="ft_t_pedf.py_dte_fq_dy_cde" dataType="STRING"/>
			<field name="ft_t_pedf.pay_cap_camt" dataType="NUMBER"/>
			<field name="ft_t_pedf.pay_dte_meth_nme" dataType="STRING"/>
			<field name="ft_t_pedf.pay_day_aj_typ" dataType="STRING"/>
			<field name="ft_t_pedf.pay_day_typ" dataType="STRING"/>
			<field name="ft_t_pedf.pay_per_reset_cnt" dataType="NUMBER"/>
			<field name="ft_t_pedf.prd_end_aj_bas_typ" dataType="STRING"/>
			<field name="ft_t_pedf.prd_end_dy_aj_qty" dataType="NUMBER"/>
			<field name="ft_t_pedf.prd_end_mth_aj_qty" dataType="NUMBER"/>
			<field name="ft_t_pedf.prn_sch_cmplt_ind" dataType="STRING"/>
			<field name="ft_t_pedf.rtfx_aj_crte" dataType="NUMBER"/>
			<field name="ft_t_pedf.rte_determ_typ" dataType="STRING"/>
			<field name="ft_t_pedf.rtfx_bas_typ" dataType="STRING"/>
			<field name="ft_t_pedf.rtfx_fq_qty" dataType="NUMBER"/>
			<field name="ft_t_pedf.rtfx_fq_dy_typ" dataType="STRING"/>
			<field name="ft_t_pedf.rtfx_fq_sp_typ" dataType="STRING"/>
			<field name="ft_t_pedf.rate_fixing_index_nme" dataType="STRING"/>
			<field name="ft_t_pedf.rtfx_typ" dataType="STRING"/>
			<field name="ft_t_pedf.recdt_aj_bas_typ" dataType="STRING"/>
			<field name="ft_t_pedf.recdt_dy_aj_num" dataType="NUMBER"/>
			<field name="ft_t_pedf.recdt_fq_qty" dataType="NUMBER"/>
			<field name="ft_t_pedf.recdt_fq_dy_typ" dataType="STRING"/>
			<field name="ft_t_pedf.recdt_fq_sp_typ" dataType="STRING"/>
			<field name="ft_t_pedf.recdt_mth_aj_num" dataType="NUMBER"/>
			<field name="ft_t_pedf.rnd_meth_typ" dataType="STRING"/>
			<field name="ft_t_pedf.row_seq" dataType="NUMBER"/>
			<field name="ft_t_pedf.sched_avail_ind" dataType="STRING"/>
			<field name="ft_t_pedf.sched_lower_camt" dataType="NUMBER"/>
			<field name="ft_t_pedf.sched_upper_camt" dataType="NUMBER"/>
			<field name="ft_t_pedf.settle_dte_deriv_meth_typ" dataType="STRING"/>
			<field name="ft_t_pedf.soft_call_day_typ" dataType="STRING"/>
			<field name="ft_t_pedf.soft_call_parity_ind" dataType="STRING"/>
			<field name="ft_t_pedf.soft_call_qt_meth_typ" dataType="STRING"/>
			<field name="ft_t_pedf.soft_call_trigger_camt" dataType="NUMBER"/>
			<field name="ft_t_pedf.start_tms" dataType="DATETIME"/>
			<field name="ft_t_pedf.tmz_tmz" dataType="STRING"/>
			<field name="ft_t_pedf.drwng_grp_typ" dataType="STRING"/>
			<field name="ft_t_pedf.verif_ind" dataType="STRING"/>
			<field name="ft_t_pedf.wind_dur_qty" dataType="NUMBER"/>
		</inputFields>
		<where activeOnly="false"/>
	</occurrence>
	<occurrence table="ft_t_ridf" id="RIDF" parentId="ISSUPUB" multiple="true">
		<inputFields>
			<field name="ft_t_ridf.rel_typ" dataType="STRING"/>
			<field name="ft_t_ridf.start_tms" dataType="DATETIME"/>
			<field name="ft_t_ridf.last_chg_tms" dataType="DATETIME"/>
			<field name="ft_t_ridf.last_chg_usr_id" dataType="STRING"/>
			<field name="ft_t_ridf.xpd_end_tms" dataType="DATETIME"/>
			<field name="ft_t_ridf.xpd_start_tms" dataType="DATETIME"/>
			<field name="ft_t_ridf.xpd_fq_sp_typ" dataType="STRING"/>
			<field name="ft_t_ridf.cnvr_exer_cprc" dataType="NUMBER"/>
			<field name="ft_t_ridf.tick_sz_camt" dataType="NUMBER"/>
			<field name="ft_t_ridf.tick_val_camt" dataType="NUMBER"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_mkis" id="MKIS" parentId="ISSUPUB" multiple="true" dbConstraint="MKISF001">
		<inputFields>
			<field name="ft_t_mkis.acrd_in_flat_reas_typ" dataType="STRING"/>
			<field name="ft_t_mkis.actively_traded_ind" dataType="STRING"/>
			<field name="ft_t_mkis.daily_end_tme" dataType="DATETIME"/>
			<field name="ft_t_mkis.daily_start_tme" dataType="DATETIME"/>
			<field name="ft_t_mkis.data_stat_typ" dataType="STRING"/>
			<field name="ft_t_mkis.data_src_id" dataType="STRING"/>
			<field name="ft_t_mkis.day_settle_buy_qty" dataType="NUMBER"/>
			<field name="ft_t_mkis.day_settle_sll_qty" dataType="NUMBER"/>
			<field name="ft_t_mkis.delisting_tms" dataType="DATETIME"/>
			<field name="ft_t_mkis.end_tms" dataType="DATETIME"/>
			<field name="ft_t_mkis.first_trdng_tms" dataType="DATETIME"/>
			<field name="ft_t_mkis.fixed_exch_rate_ind" dataType="STRING"/>
			<field name="ft_t_mkis.gu_cnt" dataType="NUMBER"/>
			<field name="ft_t_mkis.gu_id" dataType="STRING"/>
			<field name="ft_t_mkis.gu_typ" dataType="STRING"/>
			<field name="ft_t_mkis.hdg_init_ml_camt" dataType="NUMBER"/>
			<field name="ft_t_mkis.hdg_maint_ml_camt" dataType="NUMBER"/>
			<field name="ft_t_mkis.home_stock_exch_ind" dataType="STRING"/>
			<field name="ft_t_mkis.iss_prc_ut_camt" dataType="NUMBER"/>
			<field name="ft_t_mkis.iss_prc_ut_vol_camt" dataType="NUMBER"/>
			<field name="ft_t_mkis.iss_prc_unit_typ" dataType="STRING"/>
			<field name="ft_t_mkis.issu_quote_stat_cde" dataType="STRING"/>
			<field name="ft_t_mkis.iss_trd_ut_cqty" dataType="NUMBER"/>
			<field name="ft_t_mkis.last_chg_tms" dataType="DATETIME"/>
			<field name="ft_t_mkis.last_chg_usr_id" dataType="STRING"/>
			<field name="ft_t_mkis.last_trdng_tms" dataType="DATETIME"/>
			<field name="ft_t_mkis.listed_ind" dataType="STRING"/>
			<field name="ft_t_mkis.listing_tms" dataType="DATETIME"/>
			<field name="ft_t_mkis.mrgn_sec_ind" dataType="STRING"/>
			<field name="ft_t_mkis.mkt_clsf_cde" dataType="STRING"/>
			<field name="ft_t_mkis.mifid_avail_shr_cqty" dataType="NUMBER"/>
			<field name="ft_t_mkis.mifid_free_flt_shr_cqty" dataType="NUMBER"/>
			<field name="ft_t_mkis.mifid_free_flt_to_cqty" dataType="NUMBER"/>
			<field name="ft_t_mkis.mifid_liquid_shr_cqty" dataType="NUMBER"/>
			<field name="ft_t_mkis.mult_shr_ind" dataType="STRING"/>
			<field name="ft_t_mkis.new_quote_calc_meth_typ" dataType="STRING"/>
			<field name="ft_t_mkis.nasdaq_portal_ind" dataType="STRING"/>
			<field name="ft_t_mkis.new_quote_meth_eff_tms" dataType="DATETIME"/>
			<field name="ft_t_mkis.no_naked_short_sell_ind" dataType="STRING"/>
			<field name="ft_t_mkis.no_short_sell_ind" dataType="STRING"/>
			<field name="ft_t_mkis.norm_mkt_sz_cqty" dataType="NUMBER"/>
			<field name="ft_t_mkis.old_quote_calc_meth_typ" dataType="STRING"/>
			<field name="ft_t_mkis.opt_crs_strike_cprc" dataType="NUMBER"/>
			<field name="ft_t_mkis.opt_elig_ind" dataType="STRING"/>
			<field name="ft_t_mkis.opt_avail_ind" dataType="STRING"/>
			<field name="ft_t_mkis.opol_ind" dataType="STRING"/>
			<field name="ft_t_mkis.parity_price_ind" dataType="STRING"/>
			<field name="ft_t_mkis.pref_iss_id" dataType="STRING"/>
			<field name="ft_t_mkis.pref_iss_ctxt_typ" dataType="STRING"/>
			<field name="ft_t_mkis.pref_prc_typ" dataType="STRING"/>
			<field name="ft_t_mkis.prc_curr_cde" dataType="STRING"/>
			<field name="ft_t_mkis.low_lmt_cprc" dataType="NUMBER"/>
			<field name="ft_t_mkis.up_lmt_cprc" dataType="NUMBER"/>
			<field name="ft_t_mkis.prc_mltplr_crte" dataType="NUMBER"/>
			<field name="ft_t_mkis.prc_partly_pd_camt" dataType="NUMBER"/>
			<field name="ft_t_mkis.prc_ut_meas_typ" dataType="STRING"/>
			<field name="ft_t_mkis.prim_trd_mkt_ind" dataType="STRING"/>
			<field name="ft_t_mkis.rnd_lot_sz_cqty" dataType="NUMBER"/>
			<field name="ft_t_mkis.seasoned_ind" dataType="STRING"/>
			<field name="ft_t_mkis.sec_short_sale_ind" dataType="STRING"/>
			<field name="ft_t_mkis.settle_curr_cde" dataType="STRING"/>
			<field name="ft_t_mkis.stl_cycle_typ" dataType="STRING"/>
			<field name="ft_t_mkis.stl_loc_mnem" dataType="STRING"/>
			<field name="ft_t_mkis.stl_loc_typ" dataType="STRING"/>
			<field name="ft_t_mkis.settle_meth_typ" dataType="STRING"/>
			<field name="ft_t_mkis.space_low_cqty" dataType="NUMBER"/>
			<field name="ft_t_mkis.space_med_cqty" dataType="NUMBER"/>
			<field name="ft_t_mkis.specialist_id" dataType="STRING"/>
			<field name="ft_t_mkis.spec_init_ml_camt" dataType="NUMBER"/>
			<field name="ft_t_mkis.spec_maint_ml_camt" dataType="NUMBER"/>
			<field name="ft_t_mkis.start_tms" dataType="DATETIME"/>
			<field name="ft_t_mkis.trdbot_dy_num" dataType="NUMBER"/>
			<field name="ft_t_mkis.trdbot_dy_typ" dataType="STRING"/>
			<field name="ft_t_mkis.trdbot_strt_num" dataType="NUMBER"/>
			<field name="ft_t_mkis.trd_lot_size_cqty" dataType="NUMBER"/>
			<field name="ft_t_mkis.trd_suspend_prd_end_tms" dataType="DATETIME"/>
			<field name="ft_t_mkis.trd_suspend_prd_start_tms" dataType="DATETIME"/>
			<field name="ft_t_mkis.trdng_curr_cde" dataType="STRING"/>
			<field name="ft_t_mkis.trdng_floor_loc_id" dataType="STRING"/>
			<field name="ft_t_mkis.trdng_stat_typ" dataType="STRING"/>
			<field name="ft_t_mkis.trdng_ut_meas_typ" dataType="STRING"/>
			<field name="ft_t_mkis.mkt_oid" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_uwch" id="UWCH" parentId="ISSUPUB" multiple="true">
		<inputFields>
			<field name="ft_t_uwch.dlv_typ" dataType="STRING"/>
			<field name="ft_t_uwch.first_settle_dte" dataType="DATETIME"/>
			<field name="ft_t_uwch.last_chg_tms" dataType="DATETIME"/>
			<field name="ft_t_uwch.offer_curr_cde" dataType="STRING"/>
			<field name="ft_t_uwch.offer_increment_camt" dataType="NUMBER"/>
			<field name="ft_t_uwch.offer_cprc" dataType="NUMBER"/>
			<field name="ft_t_uwch.offer_cqty" dataType="NUMBER"/>
			<field name="ft_t_uwch.offer_tms" dataType="DATETIME"/>
			<field name="ft_t_uwch.offer_typ" dataType="STRING"/>
			<field name="ft_t_uwch.min_offer_camt" dataType="NUMBER"/>
			<field name="ft_t_uwch.lead_manager_nme" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_ievp" id="EIVP" parentId="EIDF" multiple="true">
		<inputFields>
			<field name="ft_t_ievp.data_src_id" dataType="STRING"/>
			<field name="ft_t_ievp.data_stat_typ" dataType="STRING"/>
			<field name="ft_t_ievp.end_tms" dataType="DATETIME"/>
			<field name="ft_t_ievp.last_chg_tms" dataType="DATETIME"/>
			<field name="ft_t_ievp.last_chg_usr_id" dataType="STRING"/>
			<field name="ft_t_ievp.prt_desc" dataType="STRING"/>
			<field name="ft_t_ievp.prt_purp_typ" dataType="STRING"/>
			<field name="ft_t_ievp.rld_inc_ev_prt_id" dataType="STRING"/>
			<field name="ft_t_ievp.start_tms" dataType="DATETIME"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_ipdf" id="IPDF" parentId="EIVP" multiple="true">
		<inputFields>
			<field name="ft_t_ipdf.data_stat_typ" dataType="STRING"/>
			<field name="ft_t_ipdf.end_tms" dataType="DATETIME"/>
			<field name="ft_t_ipdf.ev_camt" dataType="NUMBER"/>
			<field name="ft_t_ipdf.ev_crte" dataType="NUMBER"/>
			<field name="ft_t_ipdf.ev_rate_bas_typ" dataType="STRING"/>
			<field name="ft_t_ipdf.ev_rate_typ" dataType="STRING"/>
			<field name="ft_t_ipdf.fix_prd_ind" dataType="STRING"/>
			<field name="ft_t_ipdf.ev_instr_id" dataType="STRING"/>
			<field name="ft_t_ipdf.fx_crte" dataType="NUMBER"/>
			<field name="ft_t_ipdf.iss_part_rl_typ" dataType="STRING"/>
			<field name="ft_t_ipdf.last_chg_tms" dataType="DATETIME"/>
			<field name="ft_t_ipdf.last_chg_usr_id" dataType="STRING"/>
			<field name="ft_t_ipdf.non_annual_cpn_crte" dataType="NUMBER"/>
			<field name="ft_t_ipdf.py_dte_fq_dy_cde" dataType="STRING"/>
			<field name="ft_t_ipdf.pay_curr_cde" dataType="STRING"/>
			<field name="ft_t_ipdf.prorated_ind" dataType="STRING"/>
			<field name="ft_t_ipdf.rate_fixing_base_crte" dataType="NUMBER"/>
			<field name="ft_t_ipdf.settle_dte_aj_cnt" dataType="NUMBER"/>
			<field name="ft_t_ipdf.start_tms" dataType="DATETIME"/>
			<field name="ft_t_ipdf.val_days_of_num" dataType="NUMBER"/>
		</inputFields>
		<where activeOnly="false">
			<field name="ft_t_ipdf.end_tms" dataType="DATETIME" isNull="false"/>
		</where>
	</occurrence>
	<occurrence table="ft_t_pecn" id="PECN" parentId="PEDF" multiple="true">
		<inputFields>
			<field name="ft_t_pecn.cond_camt" dataType="NUMBER"/>
			<field name="ft_t_pecn.cond_ref_prd_cnt" dataType="NUMBER"/>
			<field name="ft_t_pecn.cond_prem_cpct" dataType="NUMBER"/>
			<field name="ft_t_pecn.cond_ref_prd_typ" dataType="STRING"/>
			<field name="ft_t_pecn.data_src_id" dataType="STRING"/>
			<field name="ft_t_pecn.data_stat_typ" dataType="STRING"/>
			<field name="ft_t_pecn.end_tms" dataType="DATETIME"/>
			<field name="ft_t_pecn.last_chg_tms" dataType="DATETIME"/>
			<field name="ft_t_pecn.last_chg_usr_id" dataType="STRING"/>
			<field name="ft_t_pecn.mand_opt_typ" dataType="STRING"/>
			<field name="ft_t_pecn.mn_trdng_dy_cnt" dataType="NUMBER"/>
			<field name="ft_t_pecn.prin_ev_cond_desc" dataType="STRING"/>
			<field name="ft_t_pecn.prin_ev_cond_typ" dataType="STRING"/>
			<field name="ft_t_pecn.start_tms" dataType="DATETIME"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_pevp" id="PEVP" parentId="PEDF" multiple="true">
		<inputFields>
			<field name="ft_t_pevp.data_src_id" dataType="STRING"/>
			<field name="ft_t_pevp.data_stat_typ" dataType="STRING"/>
			<field name="ft_t_pevp.end_tms" dataType="DATETIME"/>
			<field name="ft_t_pevp.last_chg_usr_id" dataType="STRING"/>
			<field name="ft_t_pevp.last_chg_tms" dataType="DATETIME"/>
			<field name="ft_t_pevp.mx_adv_notice_qty" dataType="NUMBER"/>
			<field name="ft_t_pevp.mn_adv_notice_qty" dataType="NUMBER"/>
			<field name="ft_t_pevp.prt_desc" dataType="STRING"/>
			<field name="ft_t_pevp.prt_purp_typ" dataType="STRING"/>
			<field name="ft_t_pevp.prin_ev_prt_id" dataType="STRING"/>
			<field name="ft_t_pevp.start_tms" dataType="DATETIME"/>
		</inputFields>
		<where activeOnly="false"/>
	</occurrence>
	<occurrence table="ft_t_ppdf" id="PPDF" parentId="PEVP" multiple="true">
		<inputFields>
			<field name="ft_t_ppdf.call_stat_typ" dataType="STRING"/>
			<field name="ft_t_ppdf.data_src_id" dataType="STRING"/>
			<field name="ft_t_ppdf.data_stat_typ" dataType="STRING"/>
			<field name="ft_t_ppdf.end_tms" dataType="DATETIME"/>
			<field name="ft_t_ppdf.ev_camt" dataType="NUMBER"/>
			<field name="ft_t_ppdf.ev_2_camt" dataType="NUMBER"/>
			<field name="ft_t_ppdf.ev_cprc" dataType="NUMBER"/>
			<field name="ft_t_ppdf.ev_crte" dataType="NUMBER"/>
			<field name="ft_t_ppdf.ev_rate_bas_typ" dataType="STRING"/>
			<field name="ft_t_ppdf.ev_rate_2_bas_typ" dataType="STRING"/>
			<field name="ft_t_ppdf.ev_rate_typ" dataType="STRING"/>
			<field name="ft_t_ppdf.ev_rate_2_typ" dataType="STRING"/>
			<field name="ft_t_ppdf.iss_part_rl_typ" dataType="STRING"/>
			<field name="ft_t_ppdf.fx_crte" dataType="NUMBER"/>
			<field name="ft_t_ppdf.last_chg_tms" dataType="DATETIME"/>
			<field name="ft_t_ppdf.last_chg_usr_id" dataType="STRING"/>
			<field name="ft_t_ppdf.notfcn_pd_end_dte" dataType="DATETIME"/>
			<field name="ft_t_ppdf.notfcn_pd_start_dte" dataType="DATETIME"/>
			<field name="ft_t_ppdf.pay_curr_cde" dataType="STRING"/>
			<field name="ft_t_ppdf.prorated_ind" dataType="STRING"/>
			<field name="ft_t_ppdf.settle_dte_aj_cnt" dataType="NUMBER"/>
			<field name="ft_t_ppdf.start_tms" dataType="DATETIME"/>
			<field name="ft_t_ppdf.val_days_of_num" dataType="NUMBER"/>
		</inputFields>
		<where activeOnly="false"/>
	</occurrence>
	<occurrence table="ft_t_isde" id="ISDE" parentId="ISSUPUB" multiple="true">
		<inputFields>
			<field name="ft_t_isde.data_src_id" dataType="STRING"/>
			<field name="ft_t_isde.data_stat_typ" dataType="STRING"/>
			<field name="ft_t_isde.desc_usage_typ" dataType="STRING"/>
			<field name="ft_t_isde.end_tms" dataType="DATETIME"/>
			<field name="ft_t_isde.iss_nme" dataType="STRING"/>
			<field name="ft_t_isde.iss_desc" dataType="STRING"/>
			<field name="ft_t_isde.start_tms" dataType="DATETIME"/>
			<field name="ft_t_isde.desc_srce_typ" dataType="STRING"/>
			<field name="ft_t_isde.nls_cde" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_riss" id="RISS" parentId="RIDF" multiple="true">
		<inputFields>
			<field name="ft_t_riss.iss_part_rl_typ" dataType="STRING"/>
			<field name="ft_t_riss.part_units_typ" dataType="STRING"/>
			<field name="ft_t_riss.last_chg_tms" dataType="DATETIME"/>
			<field name="ft_t_riss.last_chg_usr_id" dataType="STRING"/>
			<field name="ft_t_riss.ev_part_camt" dataType="NUMBER"/>
			<field name="ft_t_riss.start_tms" dataType="DATETIME"/>
			<field name="ft_t_riss.exer_crte" dataType="NUMBER"/>
			<field name="ft_t_riss.udrly_curr_cde" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_isgp" id="ISGP" parentId="ISSUPUB" multiple="true" dbConstraint="ISGPF002">
		<inputFields>
			<field name="ft_t_isgp.prt_purp_typ" dataType="STRING"/>
			<field name="ft_t_isgp.start_tms" dataType="DATETIME"/>
			<field name="ft_t_isgp.last_chg_tms" dataType="DATETIME"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_isgr" id="ISGR" parentId="ISGP" dbConstraint="ISGPF001">
		<inputFields>
			<field name="ft_t_isgr.start_tms" dataType="DATETIME"/>
			<field name="ft_t_isgr.grp_nme" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_isgp" id="ISGP_2" parentId="ISGR" multiple="true" label="ParentGroupParticipant" dbConstraint="ISGPF003">
		<inputFields>
			<field name="ft_t_isgp.prt_purp_typ" dataType="STRING"/>
			<field name="ft_t_isgp.start_tms" dataType="DATETIME"/>
			<field name="ft_t_isgp.last_chg_tms" dataType="DATETIME"/>
		</inputFields>
		<where>
			<field name="ft_t_isgp.prt_purp_typ" dataType="STRING" value="INTEREST"/>
		</where>
	</occurrence>
	<occurrence table="ft_t_isgr" id="ISGR_2" parentId="ISGP_2" label="ParentGroup" dbConstraint="ISGPF001">
		<inputFields>
			<field name="ft_t_isgr.start_tms" dataType="DATETIME"/>
			<field name="ft_t_isgr.grp_nme" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_finr" id="FINR" parentId="FRIP">
		<inputFields>
			<field name="ft_t_finr.start_tms" dataType="DATETIME"/>
			<field name="ft_t_finr.finsrl_typ" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_fins" id="FINRFINS" parentId="FINR">
		<inputFields>
			<field name="ft_t_fins.inst_nme"/>
			<field name="ft_t_fins.pref_fins_id" dataType="STRING"/>
			<field name="ft_t_fins.pref_fins_id_ctxt_typ" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_gunt" id="GUNT" parentId="ISGU">
		<inputFields>
			<field name="ft_t_gunt.gu_nme" dataType="STRING"/>
			<field name="ft_t_gunt.cntry_cde" dataType="STRING"/>
			<field name="ft_t_gunt.cntry_subdiv_cde" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_guid" id="GUID" parentId="GUNT">
		<inputFields>
			<field name="ft_t_guid.geo_unit_id" dataType="STRING"/>
			<field name="ft_t_guid.gu_id_ctxt_typ" dataType="STRING"/>
		</inputFields>
		<where>
			<field name="ft_t_guid.gu_id_ctxt_typ" dataType="STRING" value="ISO3"/>
		</where>
	</occurrence>
	<occurrence table="ft_t_rtng" id="RTNG" parentId="ISRT">
		<inputFields>
			<field name="ft_t_rtng.rtng_set_mnem" dataType="STRING"/>
			<field name="ft_t_rtng.rtng_set_nme" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_mrkt" id="MKISMRKT" parentId="MKIS">
		<inputFields>
			<field name="ft_t_mrkt.mkt_nme" dataType="STRING"/>
			<field name="ft_t_mrkt.gu_id" dataType="STRING"/>
			<field name="ft_t_mrkt.gu_typ" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_isty" id="ISTY" parentId="ISSUPUB" dbConstraint="ISSUF001">
		<inputFields>
			<field name="ft_t_isty.prnt_iss_typ" dataType="STRING"/>
			<field name="ft_t_isty.iss_typ_nme" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_fins" id="FINS" parentId="ISSR">
		<inputFields>
			<field name="ft_t_fins.inst_nme" dataType="STRING"/>
			<field name="ft_t_fins.pref_fins_id_ctxt_typ" dataType="STRING"/>
			<field name="ft_t_fins.pref_fins_id" dataType="STRING"/>
			<field name="ft_t_fins.start_tms" dataType="DATETIME"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_ircl" id="IRCL" parentId="ISSR" multiple="true" dbConstraint="IRCLF001">
		<inputFields>
			<field name="ft_t_ircl.cl_value" dataType="STRING"/>
			<field name="ft_t_ircl.indus_cl_set_id" dataType="STRING"/>
			<field name="ft_t_ircl.start_tms" dataType="DATETIME"/>
		</inputFields>
		<where>
			<field name="ft_t_ircl.instr_id" dataType="STRING" isNull="true"/>
		</where>
	</occurrence>
	<occurrence table="ft_t_ffrl" id="FFRL" parentId="FINS" dbConstraint="FFRLF002">
		<inputFields>
			<field name="ft_t_ffrl.start_tms" dataType="DATETIME"/>
		</inputFields>
		<where>
			<field name="ft_t_ffrl.rel_typ" dataType="STRING" value="CURRORGN"/>
		</where>
	</occurrence>
	<occurrence table="ft_t_fins" id="FFRLFINS" parentId="FFRL" dbConstraint="FFRLF001">
		<inputFields>
			<field name="ft_t_fins.inst_nme" dataType="STRING"/>
			<field name="ft_t_fins.start_tms" dataType="DATETIME"/>
			<field name="ft_t_fins.pref_fins_id" dataType="STRING"/>
			<field name="ft_t_fins.pref_fins_id_ctxt_typ" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_issu" id="ISSU" parentId="RISS">
		<inputFields>
			<field name="ft_t_issu.pref_iss_desc" dataType="STRING"/>
			<field name="ft_t_issu.pref_iss_id" dataType="STRING"/>
			<field name="ft_t_issu.pref_iss_nme" dataType="STRING"/>
			<field name="ft_t_issu.pref_id_ctxt_typ" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_irst" id="IRST" parentId="ISSR" multiple="true">
		<inputFields>
			<field name="ft_t_irst.start_tms" dataType="DATETIME"/>
			<field name="ft_t_irst.stat_def_id" dataType="STRING"/>
			<field name="ft_t_irst.stat_int_val_num" dataType="NUMBER"/>
			<field name="ft_t_irst.stat_val_dte" dataType="DATETIME"/>
			<field name="ft_t_irst.stat_val_tms" dataType="DATETIME"/>
			<field name="ft_t_irst.stat_char_val_txt" dataType="STRING"/>
			<field name="ft_t_irst.stat_val_camt" dataType="NUMBER"/>
			<field name="ft_t_irst.last_chg_tms" dataType="DATETIME"/>
			<field name="ft_t_irst.last_chg_usr_id" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_figu" id="FIGU" parentId="FINS" multiple="true">
		<inputFields>
			<field name="ft_t_figu.fins_gu_purp_typ" dataType="STRING"/>
			<field name="ft_t_figu.gu_cnt" dataType="NUMBER"/>
			<field name="ft_t_figu.gu_id" dataType="STRING"/>
			<field name="ft_t_figu.gu_typ" dataType="STRING"/>
			<field name="ft_t_figu.start_tms" dataType="DATETIME"/>
			<field name="ft_t_figu.last_chg_tms" dataType="DATETIME"/>
			<field name="ft_t_figu.last_chg_usr_id" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_gunt" id="FGUNT" parentId="FIGU">
		<inputFields>
			<field name="ft_t_gunt.cntry_cde" dataType="STRING"/>
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
	<occurrence table="ft_t_ircl" id="ISSUIRCL" parentId="ISSUPUB" dbConstraint="IRCLF005">
		<inputFields>
			<field name="ft_t_ircl.cl_value" dataType="STRING"/>
			<field name="ft_t_ircl.last_chg_tms" dataType="DATETIME"/>
			<field name="ft_t_ircl.start_tms" dataType="DATETIME"/>
			<field name="ft_t_ircl.indus_cl_set_id" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_eqch" id="EQCH" parentId="ISSUPUB">
		<inputFields>
			<field name="ft_t_eqch.rednm_rnd_meth_typ" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_mixr" id="MIXR" parentId="MKIS" multiple="true" dbConstraint="MIXRF002">
		<inputFields>
			<field name="ft_t_mixr.last_chg_tms" dataType="DATETIME"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_isid" id="ISID" parentId="ISSUPUB" multiple="true" dbConstraint="ISIDNOMKIS">
		<inputFields>
			<field name="ft_t_isid.id_ctxt_typ" dataType="STRING"/>
			<field name="ft_t_isid.iss_id" dataType="STRING"/>
			<field name="ft_t_isid.last_chg_tms" dataType="DATETIME"/>
			<field name="ft_t_isid.start_tms" dataType="DATETIME"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_isid" id="MKISISID" parentId="MKIS" multiple="true" dbConstraint="ISIDMKIS_NoMIXR">
		<inputFields>
			<field name="ft_t_isid.id_ctxt_typ" dataType="STRING"/>
			<field name="ft_t_isid.iss_id" dataType="STRING"/>
			<field name="ft_t_isid.start_tms" dataType="DATETIME"/>
			<field name="ft_t_isid.last_chg_tms" dataType="DATETIME"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_mrkt" id="MRKT" parentId="ISID">
		<inputFields>
			<field name="ft_t_mrkt.mkt_nme" dataType="STRING"/>
			<field name="ft_t_mrkt.gu_id" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_isid" id="MISID" parentId="MIXR" multiple="true" dbConstraint="MIXRF001">
		<inputFields>
			<field name="ft_t_isid.iss_id" dataType="STRING"/>
			<field name="ft_t_isid.id_ctxt_typ" dataType="STRING"/>
			<field name="ft_t_isid.last_chg_tms" dataType="DATETIME"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_mkid" id="MKID" parentId="MKISMRKT" multiple="true">
		<inputFields>
			<field name="ft_t_mkid.mkt_id_ctxt_typ" dataType="STRING"/>
			<field name="ft_t_mkid.mkt_id" dataType="STRING"/>
			<field name="ft_t_mkid.start_tms" dataType="DATETIME"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_rist" id="RIST" parentId="ISSUPUB" dbConstraint="RISTF001">
		<inputFields>
			<field name="ft_t_rist.generic_roll_dte" dataType="DATETIME"/>
			<field name="ft_t_rist.stats_eff_tms" dataType="DATETIME"/>
			<field name="ft_t_rist.last_chg_tms" dataType="DATETIME"/>
			<field name="ft_t_rist.ctd_iss_nme" dataType="STRING"/>
			<field name="ft_t_rist.ctd_id_ctxt_typ" dataType="STRING"/>
			<field name="ft_t_rist.ctd_iss_id" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_fech" id="FECH" parentId="ISSUPUB">
		<inputFields>
			<field name="ft_t_fech.last_dlv_dte" dataType="DATETIME"/>
			<field name="ft_t_fech.last_chg_tms" dataType="DATETIME"/>
			<field name="ft_t_fech.first_notice_dte" dataType="DATETIME"/>
			<field name="ft_t_fech.cntrct_val_camt" dataType="NUMBER"/>
			<field name="ft_t_fech.fut_cntrct_exp_typ" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_isid" id="RISID" parentId="ISSU" label="Identifier" multiple="true" dbConstraint="ISIDF001">
		<inputFields>
			<field name="ft_t_isid.id_ctxt_typ" dataType="STRING"/>
			<field name="ft_t_isid.iss_id" dataType="STRING"/>
			<field name="ft_t_isid.start_tms" dataType="DATETIME"/>
			<field name="ft_t_isid.mkt_oid" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_idmv" id="IDMVIEDF" parentId="EIDF" label="CouponRateFixingMethod" dbConstraint="IDMVIEDF">
		<inputFields>
			<field name="ft_t_idmv.intrnl_dmn_val_nme" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_gncm" id="RECORD_DT" parentId="IPDF" dbConstraint="IPDFGNCMCSTM">
		<where>
			<field name="ft_t_gncm.comm_reas_mnem" dataType="STRING" value="RECRD_DT"/>
		</where>
		<inputFields>
			<field name="ft_t_gncm.created_tms" dataType="DATETIME"/>
			<field name="ft_t_gncm.last_chg_tms" dataType="DATETIME"/>
			<field name="ft_t_gncm.cmnt_txt" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_finr" id="FINSFINR" parentId="FINS" multiple="true">
		<inputFields>
			<field name="ft_t_finr.start_tms" dataType="DATETIME"/>
			<field name="ft_t_finr.finsrl_typ" dataType="STRING"/>
			<field name="ft_t_finr.data_src_id" dataType="STRING"/>
			<field name="ft_t_finr.data_stat_typ" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_irid" id="IRID" parentId="ISSR" multiple="true">
		<inputFields>
			<field name="ft_t_irid.issr_id" dataType="STRING"/>
			<field name="ft_t_irid.issr_id_ctxt_typ" dataType="STRING"/>
			<field name="ft_t_irid.data_stat_typ" dataType="STRING"/>
			<field name="ft_t_irid.end_tms" dataType="DATETIME"/>
			<field name="ft_t_irid.start_tms" dataType="DATETIME"/>
			<field name="ft_t_irid.issr_usage_typ" dataType="STRING"/>
			<field name="ft_t_irid.last_chg_usr_id" dataType="STRING"/>
			<field name="ft_t_irid.last_chg_tms" dataType="DATETIME"/>
			<field name="ft_t_irid.gu_cnt" dataType="NUMBER"/>
			<field name="ft_t_irid.gu_id" dataType="STRING"/>
			<field name="ft_t_irid.gu_typ" dataType="STRING"/>
			<field name="ft_t_irid.data_src_id" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_issr" id="FINSISSR" parentId="FINRFINS" dbConstraint="ISSRF001">
		<inputFields>
			<field name="ft_t_issr.issr_nme" dataType="STRING"/>
			<field name="ft_t_issr.issr_desc" dataType="STRING"/>
			<field name="ft_t_issr.issr_stat_typ" dataType="STRING"/>
			<field name="ft_t_issr.issr_typ" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_irid" id="ISSRIRID" parentId="FINSISSR" multiple="true">
		<inputFields>
			<field name="ft_t_irid.issr_id" dataType="STRING"/>
			<field name="ft_t_irid.issr_id_ctxt_typ" dataType="STRING"/>
			<field name="ft_t_irid.data_src_id" dataType="STRING"/>
			<field name="ft_t_irid.data_stat_typ" dataType="STRING"/>
			<field name="ft_t_irid.issr_usage_typ" dataType="STRING"/>
			<field name="ft_t_irid.last_chg_tms" dataType="DATETIME"/>
			<field name="ft_t_irid.last_chg_usr_id" dataType="STRING"/>
			<field name="ft_t_irid.start_tms" dataType="DATETIME"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_issr" id="ISSUISSR" parentId="ISSU" dbConstraint="ISSUF002">
		<inputFields>
			<field name="ft_t_issr.issr_nme" dataType="STRING"/>
			<field name="ft_t_issr.issr_desc" dataType="STRING"/>
			<field name="ft_t_issr.mult_shr_ind" dataType="STRING"/>
			<field name="ft_t_issr.pref_id_ctxt_typ" dataType="STRING"/>
			<field name="ft_t_issr.pref_issr_id" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_irid" id="ISSUIRID" parentId="ISSUISSR" multiple="true">
		<inputFields>
			<field name="ft_t_irid.issr_id" dataType="STRING"/>
			<field name="ft_t_irid.issr_id_ctxt_typ" dataType="STRING"/>
			<field name="ft_t_irid.data_src_id" dataType="STRING"/>
			<field name="ft_t_irid.data_stat_typ" dataType="STRING"/>
			<field name="ft_t_irid.issr_usage_typ" dataType="STRING"/>
			<field name="ft_t_irid.last_chg_tms" dataType="DATETIME"/>
			<field name="ft_t_irid.last_chg_usr_id" dataType="STRING"/>
			<field name="ft_t_irid.start_tms" dataType="DATETIME"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_issr" id="UISSR" parentId="FFRLFINS" label="ISSR" dbConstraint="ISSRF001">
		<inputFields>
			<field name="ft_t_issr.issr_nme" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_irid" id="UIRID" parentId="UISSR" label="IRID" multiple="true">
		<inputFields>
			<field name="ft_t_irid.issr_id" dataType="STRING"/>
			<field name="ft_t_irid.issr_id_ctxt_typ" dataType="STRING"/>
			<field name="ft_t_irid.end_tms" dataType="DATETIME"/>
			<field name="ft_t_irid.start_tms" dataType="DATETIME"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_ishq" id="ISHQ" parentId="ISSUPUB" multiple="true">
		<inputFields>
			<field name="ft_t_ishq.max_prc_drop_30d_dte" dataType="DATETIME"/>
			<field name="ft_t_ishq.prc_drop_30d_cpct" dataType="NUMBER"/>
			<field name="ft_t_ishq.prc_drop_an_30d_start_dte" dataType="DATETIME"/>
			<field name="ft_t_ishq.oecd_member_country_ind" dataType="STRING"/>
			<field name="ft_t_ishq.oecd_member_crc_typ" dataType="STRING"/>
			<field name="ft_t_ishq.hqla_maj_equity_index_ind" dataType="STRING"/>
			<field name="ft_t_ishq.eu_ast_cl_elig_typ" dataType="STRING"/>
			<field name="ft_t_ishq.bis_ast_cl_elig_typ" dataType="STRING"/>
			<field name="ft_t_ishq.last_chg_tms" dataType="DATETIME"/>
			<field name="ft_t_ishq.japanese_ast_cl_elig_typ" dataType="STRING"/>
			<field name="ft_t_ishq.canadian_ast_cl_elig_typ" dataType="STRING"/>
			<field name="ft_t_ishq.eba_ast_cl_elig_typ" dataType="STRING"/>
			<field name="ft_t_ishq.fr2052a_ast_cl_elig_typ" dataType="STRING"/>
			<field name="ft_t_ishq.aust_ast_cl_elig_typ" dataType="STRING"/>
			<field name="ft_t_ishq.basel_iii_ast_cl_elig_typ" dataType="STRING"/>
			<field name="ft_t_ishq.uk_ast_cl_elig_typ" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_mrkt" id="ISHQMRKT" parentId="ISHQ">
		<inputFields>
			<field name="ft_t_mrkt.mkt_nme" dataType="STRING"/>
			<field name="ft_t_mrkt.gu_id" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_upd1" id="UPD1ISSU" parentId="ISSUPUB" dbConstraint="UPD1ISSU">
		<inputFields>
			<field name="ft_t_upd1.entity_tbl_typ" dataType="STRING"/>
			<field name="ft_t_upd1.version" dataType="NUMBER"/>
			<field name="ft_t_upd1.updated_tmsmp" dataType="DATETIME"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_pbat" id="PBAT" parentId="ISSUPUB" dbConstraint="PBATISSU">
		<inputFields>
			<field name="ft_t_pbat.last_chg_tms" dataType="DATETIME"/>
			<field name="ft_t_pbat.pub_sq_num" dataType="NUMBER" doNotPublish="true"/>
			<field name="ft_t_pbat.published_tbl_id" dataType="STRING" doNotPublish="true"/>
			<field name="ft_t_pbat.pub_audit_id" dataType="STRING" doNotPublish="true"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_upd1" id="UPD1ISSR" parentId="ISSR" dbConstraint="UPD1ISSR">
		<inputFields>
			<field name="ft_t_upd1.entity_tbl_typ" dataType="STRING"/>
			<field name="ft_t_upd1.version" dataType="NUMBER"/>
			<field name="ft_t_upd1.updated_tmsmp" dataType="DATETIME"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_rtop" id="RTOP" parentId="ISRT" label="RatingOpinion" dbConstraint="RTOPISRT_OUTLOOK">
		<inputFields>
			<field name="ft_t_rtop.rtng_opinion_typ" dataType="STRING"/>
			<field name="ft_t_rtop.start_tms" dataType="DATETIME"/>
			<field name="ft_t_rtop.rtng_opinion_txt" dataType="STRING"/>
			<field name="ft_t_rtop.rtng_opinion_stat_typ" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_idmv" id="IDMV" parentId="RTOP" label="Outlook" dbConstraint="IDMVRTOP">
		<inputFields>
			<field name="ft_t_idmv.intrnl_dmn_val_nme" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_lmch" id="LMCH" parentId="ISSUPUB" label="Loan/Mortgage Characteristics" dbConstraint="LMCHF001">
		<inputFields>
			<field name="ft_t_lmch.adjst_fixed_ind" dataType="STRING"/>
			<field name="ft_t_lmch.amort_freq_mth_cnt" dataType="NUMBER"/>
			<field name="ft_t_lmch.amort_prd_mth_cnt" dataType="NUMBER"/>
			<field name="ft_t_lmch.amort_crte" dataType="NUMBER"/>
			<field name="ft_t_lmch.amort_strt_dte" dataType="DATETIME"/>
			<field name="ft_t_lmch.amort_typ" dataType="STRING"/>
			<field name="ft_t_lmch.assumability_typ" dataType="STRING"/>
			<field name="ft_t_lmch.balloon_ind" dataType="STRING"/>
			<field name="ft_t_lmch.base_crte" dataType="NUMBER"/>
			<field name="ft_t_lmch.cap_struc_txt" dataType="STRING"/>
			<field name="ft_t_lmch.class_call_dte" dataType="DATETIME"/>
			<field name="ft_t_lmch.class_call_cpct" dataType="NUMBER"/>
			<field name="ft_t_lmch.cleanup_call_cpct" dataType="NUMBER"/>
			<field name="ft_t_lmch.coll_typ" dataType="STRING"/>
			<field name="ft_t_lmch.cmpnt_typ" dataType="STRING"/>
			<field name="ft_t_lmch.contr_cflow_ind" dataType="STRING"/>
			<field name="ft_t_lmch.cnvr_prd_end_dte" dataType="DATETIME"/>
			<field name="ft_t_lmch.cnvr_prd_start_dte" dataType="DATETIME"/>
			<field name="ft_t_lmch.cntry_of_trst_cde" dataType="STRING"/>
			<field name="ft_t_lmch.cpr_calc_ind" dataType="STRING"/>
			<field name="ft_t_lmch.data_redistributor_id" dataType="STRING"/>
			<field name="ft_t_lmch.data_src_id" dataType="STRING"/>
			<field name="ft_t_lmch.data_stat_typ" dataType="STRING"/>
			<field name="ft_t_lmch.deal_close_dte" dataType="DATETIME"/>
			<field name="ft_t_lmch.deal_typ" dataType="STRING"/>
			<field name="ft_t_lmch.defer_in_allow_ind" dataType="STRING"/>
			<field name="ft_t_lmch.end_tms" dataType="DATETIME"/>
			<field name="ft_t_lmch.first_pay_dte" dataType="DATETIME"/>
			<field name="ft_t_lmch.first_pay_incr_cnt" dataType="NUMBER"/>
			<field name="ft_t_lmch.frac_elig_ind" dataType="STRING"/>
			<field name="ft_t_lmch.harm_reset_pd_txt" dataType="STRING"/>
			<field name="ft_t_lmch.lmtg_oid" dataType="STRING"/>
			<field name="ft_t_lmch.init_rte_reset_pd_len" dataType="NUMBER"/>
			<field name="ft_t_lmch.init_mx_crte" dataType="NUMBER"/>
			<field name="ft_t_lmch.init_mn_crte" dataType="NUMBER"/>
			<field name="ft_t_lmch.int_only_prin_only_ind" dataType="STRING"/>
			<field name="ft_t_lmch.interest_only_pd_ind" dataType="STRING"/>
			<field name="ft_t_lmch.interest_only_pd_len" dataType="NUMBER"/>
			<field name="ft_t_lmch.intrnl_pool_prefix_id" dataType="STRING"/>
			<field name="ft_t_lmch.invest_py_del_dy_cnt" dataType="NUMBER"/>
			<field name="ft_t_lmch.last_chg_tms" dataType="DATETIME"/>
			<field name="ft_t_lmch.last_chg_usr_id" dataType="STRING"/>
			<field name="ft_t_lmch.len_pay_incr_prd_cnt" dataType="NUMBER"/>
			<field name="ft_t_lmch.life_mx_crte" dataType="NUMBER"/>
			<field name="ft_t_lmch.life_mn_crte" dataType="NUMBER"/>
			<field name="ft_t_lmch.lmch_oid" dataType="STRING"/>
			<field name="ft_t_lmch.lmtg_pay_typ" dataType="STRING"/>
			<field name="ft_t_lmch.loan_originator_nme" dataType="STRING"/>
			<field name="ft_t_lmch.loan_originator_typ" dataType="STRING"/>
			<field name="ft_t_lmch.loan_typ" dataType="STRING"/>
			<field name="ft_t_lmch.loc_of_trst_cde" dataType="STRING"/>
			<field name="ft_t_lmch.min_denom_bal_cpct" dataType="NUMBER"/>
			<field name="ft_t_lmch.min_srvc_bas_pt_ind" dataType="STRING"/>
			<field name="ft_t_lmch.mtge_agency_typ" dataType="STRING"/>
			<field name="ft_t_lmch.mtge_avail_fund_cap_ind" dataType="STRING"/>
			<field name="ft_t_lmch.mtge_prin_wind_end_dte" dataType="DATETIME"/>
			<field name="ft_t_lmch.mtge_prin_wind_start_dte" dataType="DATETIME"/>
			<field name="ft_t_lmch.mtge_rte_chg_fq_typ" dataType="STRING"/>
			<field name="ft_t_lmch.mtge_sub_typ" dataType="STRING"/>
			<field name="ft_t_lmch.mtge_tsfr_typ" dataType="STRING"/>
			<field name="ft_t_lmch.mtge_typ" dataType="STRING"/>
			<field name="ft_t_lmch.neg_amort_cap_crte" dataType="NUMBER"/>
			<field name="ft_t_lmch.neg_amort_typ" dataType="STRING"/>
			<field name="ft_t_lmch.orig_data_prov_id" dataType="STRING"/>
			<field name="ft_t_lmch.other_feat_txt" dataType="STRING"/>
			<field name="ft_t_lmch.pac_bond_ind" dataType="STRING"/>
			<field name="ft_t_lmch.passthru_rte_struc_typ" dataType="STRING"/>
			<field name="ft_t_lmch.py_dte_fq_qty" dataType="NUMBER"/>
			<field name="ft_t_lmch.py_dte_fq_dy_typ" dataType="STRING"/>
			<field name="ft_t_lmch.py_dte_fq_sp_typ" dataType="STRING"/>
			<field name="ft_t_lmch.pay_incr_crte" dataType="NUMBER"/>
			<field name="ft_t_lmch.pool_alpha_typ" dataType="STRING"/>
			<field name="ft_t_lmch.pool_compos_typ" dataType="STRING"/>
			<field name="ft_t_lmch.pool_lback_pay_pd_cnt" dataType="NUMBER"/>
			<field name="ft_t_lmch.pool_lback_pd_cnt" dataType="NUMBER"/>
			<field name="ft_t_lmch.pool_id" dataType="STRING"/>
			<field name="ft_t_lmch.pool_prefix_typ" dataType="STRING"/>
			<field name="ft_t_lmch.pool_typ" dataType="STRING"/>
			<field name="ft_t_lmch.pool_typ_desc" dataType="STRING"/>
			<field name="ft_t_lmch.prepay_lockout_prd_cnt" dataType="NUMBER"/>
			<field name="ft_t_lmch.prepay_modl_typ" dataType="STRING"/>
			<field name="ft_t_lmch.prepay_penalty_dflt_typ" dataType="STRING"/>
			<field name="ft_t_lmch.prepay_penalty_pd_cnt" dataType="NUMBER"/>
			<field name="ft_t_lmch.prepay_penalty_typ" dataType="STRING"/>
			<field name="ft_t_lmch.prepay_protect_mtge_ind" dataType="STRING"/>
			<field name="ft_t_lmch.prepay_protect_cpct" dataType="NUMBER"/>
			<field name="ft_t_lmch.prepay_rate_cal_typ" dataType="STRING"/>
			<field name="ft_t_lmch.prepay_rate_cmpnd_fq_typ" dataType="STRING"/>
			<field name="ft_t_lmch.prepay_rate_day_bas_typ" dataType="STRING"/>
			<field name="ft_t_lmch.prepay_rate_func_nme" dataType="STRING"/>
			<field name="ft_t_lmch.prepay_rate_quote_typ" dataType="STRING"/>
			<field name="ft_t_lmch.prepay_rate_unit_typ" dataType="STRING"/>
			<field name="ft_t_lmch.prc_yld_calc_ind" dataType="STRING"/>
			<field name="ft_t_lmch.prcng_spd_typ" dataType="STRING"/>
			<field name="ft_t_lmch.prcng_spd_tms" dataType="DATETIME"/>
			<field name="ft_t_lmch.prop_typ" dataType="STRING"/>
			<field name="ft_t_lmch.psa_calc_ind" dataType="STRING"/>
			<field name="ft_t_lmch.recdt_cal_cde" dataType="STRING"/>
			<field name="ft_t_lmch.recdt_cal_day_cnt" dataType="NUMBER"/>
			<field name="ft_t_lmch.rdm_coll_call_typ" dataType="STRING"/>
			<field name="ft_t_lmch.smmea_stat_typ" dataType="STRING"/>
			<field name="ft_t_lmch.start_tms" dataType="DATETIME"/>
			<field name="ft_t_lmch.subseq_mx_crte" dataType="NUMBER"/>
			<field name="ft_t_lmch.subseq_mn_crte" dataType="NUMBER"/>
			<field name="ft_t_lmch.subseq_reset_pd_cnt" dataType="NUMBER"/>
			<field name="ft_t_lmch.tot_pay_incr_prd_cnt" dataType="NUMBER"/>
			<field name="ft_t_lmch.tranche_id" dataType="STRING"/>
			<field name="ft_t_lmch.tranche_typ" dataType="STRING"/>
			<field name="ft_t_lmch.var_term_ind" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_fiid" id="FIID" parentId="FINRFINS" label="Financial Institution Identifier" multiple="true">
		<inputFields>
			<field name="ft_t_fiid.fins_id_ctxt_typ" dataType="STRING"/>
			<field name="ft_t_fiid.fins_id" dataType="STRING"/>
			<field name="ft_t_fiid.data_src_id" dataType="STRING"/>
			<field name="ft_t_fiid.data_stat_typ" dataType="STRING"/>
			<field name="ft_t_fiid.last_chg_tms" dataType="DATETIME"/>
			<field name="ft_t_fiid.last_chg_usr_id" dataType="STRING"/>
			<field name="ft_t_fiid.inst_usage_typ" dataType="STRING"/>
			<field name="ft_t_fiid.start_tms" dataType="DATETIME"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_fiid" id="FINS_FIID" parentId="FINS" label="Financial Institution Identifier" multiple="true" dbConstraint="FIIDF001">
		<inputFields>
			<field name="ft_t_fiid.data_src_id" dataType="STRING"/>
			<field name="ft_t_fiid.data_stat_typ" dataType="STRING"/>
			<field name="ft_t_fiid.fins_id_ctxt_typ" dataType="STRING"/>
			<field name="ft_t_fiid.fins_id" dataType="STRING"/>
			<field name="ft_t_fiid.inst_usage_typ" dataType="STRING"/>
			<field name="ft_t_fiid.last_chg_tms" dataType="DATETIME"/>
			<field name="ft_t_fiid.last_chg_usr_id" dataType="STRING"/>
			<field name="ft_t_fiid.start_tms" dataType="DATETIME"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_eqst" id="EQST" parentId="ISSUPUB" label="EQST">
		<inputFields>
			<field name="ft_t_eqst.mkt_cptlzn_cqty" dataType="NUMBER"/>
			<field name="ft_t_eqst.mkt_oid" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_gncm" id="EX_DT" parentId="IPDF" dbConstraint="IPDFGNCMCSTM">
		<inputFields>
			<field name="ft_t_gncm.cmnt_txt" dataType="STRING"/>
			<field name="ft_t_gncm.created_tms" dataType="DATETIME"/>
			<field name="ft_t_gncm.comm_reas_mnem" dataType="STRING"/>
			<field name="ft_t_gncm.last_chg_tms" dataType="DATETIME"/>
		</inputFields>
		<where>
			<field name="ft_t_gncm.comm_reas_mnem" dataType="STRING" value="EX_DT"/>
		</where>
	</occurrence>
	<occurrence table="ft_t_gncm" id="ANNOUNCE_DT" parentId="IPDF" dbConstraint="IPDFGNCMCSTM">
		<inputFields>
			<field name="ft_t_gncm.comm_reas_mnem" dataType="STRING"/>
			<field name="ft_t_gncm.created_tms" dataType="DATETIME"/>
			<field name="ft_t_gncm.cmnt_txt" dataType="STRING"/>
			<field name="ft_t_gncm.last_chg_tms" dataType="DATETIME"/>
		</inputFields>
		<where>
			<field name="ft_t_gncm.comm_reas_mnem" dataType="STRING" value="ANNCE_DT"/>
		</where>
	</occurrence>
	<occurrence table="ft_t_gncm" id="ROLE_DT" parentId="IPDF" dbConstraint="IPDFGNCMCSTM">
		<inputFields>
			<field name="ft_t_gncm.comm_reas_mnem" dataType="STRING"/>
			<field name="ft_t_gncm.cmnt_txt" dataType="STRING"/>
			<field name="ft_t_gncm.created_tms" dataType="DATETIME"/>
			<field name="ft_t_gncm.last_chg_tms" dataType="DATETIME"/>
		</inputFields>
		<where>
			<field name="ft_t_gncm.comm_reas_mnem" dataType="STRING" value="ROLL_DT"/>
		</where>
	</occurrence>
	<occurrence table="ft_t_must" id="MKISMUST" parentId="MKIS" label="Market Issue Statistic" dbConstraint="mkismust" multiple="true">
		<inputFields>
			<field name="ft_t_must.start_tms" dataType="DATETIME"/>
			<field name="ft_t_must.last_chg_usr_id" dataType="STRING"/>
			<field name="ft_t_must.last_chg_tms" dataType="DATETIME"/>
			<field name="ft_t_must.end_tms" dataType="DATETIME"/>
			<field name="ft_t_must.stat_val_camt" dataType="NUMBER"/>
			<field name="ft_t_must.stat_char_val_txt" dataType="STRING"/>
			<field name="ft_t_must.stat_val_tms" dataType="DATETIME"/>
			<field name="ft_t_must.stat_val_dte" dataType="DATETIME"/>
			<field name="ft_t_must.stat_def_id" dataType="STRING"/>
			<field name="ft_t_must.stat_int_val_num" dataType="NUMBER"/>
			<field name="ft_t_must.stats_curr_cde" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_stdf" id="MUST_STDF" parentId="MKISMUST" label="StatisticDefinition">
		<inputFields>
			<field name="ft_t_stdf.stat_nme" dataType="STRING"/>
			<field name="ft_t_stdf.stat_def_id" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_rtql" id="RTQL" parentId="ISRT" label="Rating Qualifier" multiple="true">
		<inputFields>
			<field name="ft_t_rtql.data_src_id" dataType="STRING"/>
			<field name="ft_t_rtql.data_stat_typ" dataType="STRING"/>
			<field name="ft_t_rtql.last_chg_tms" dataType="DATETIME"/>
			<field name="ft_t_rtql.last_chg_usr_id" dataType="STRING"/>
			<field name="ft_t_rtql.rtng_qual_txt" dataType="STRING"/>
			<field name="ft_t_rtql.rtng_qual_typ" dataType="STRING"/>
			<field name="ft_t_rtql.rtng_qual_reg_id_ind" dataType="STRING"/>
			<field name="ft_t_rtql.start_tms" dataType="DATETIME"/>
		</inputFields>
	</occurrence>
	<relations>
		<table name="FT_T_IDMV">
			<relation relatedTable="FT_T_ISSU" name="IDMVISSU">
				<fromColumns>
					<column name="INTRNL_DMN_VAL_TXT"/>
				</fromColumns>
				<toColumns>
					<column name="LIQUID_RIGHT_RANK_TYP"/>
				</toColumns>
				<condition>
					<sql>#FROM_TABLE#.fld_id=''00161384''</sql>
				</condition>
			</relation>
		</table>
		<table name="FT_T_IEDF">
			<relation relatedTable="FT_T_ISSU" name="issuiedfinterest">
				<fromColumns>
					<column name="instr_id"/>
				</fromColumns>
				<toColumns>
					<column name="instr_id"/>
				</toColumns>
				<condition>
					<sql>#FROM_TABLE#.ev_typ IN (''INTEREST'')</sql>
				</condition>
			</relation>
		</table>
		<table name="FT_T_ISCL">
			<relation relatedTable="FT_T_ISSU" name="SUBTYPE">
				<fromColumns>
					<column name="INSTR_ID"/>
				</fromColumns>
				<toColumns>
					<column name="INSTR_ID"/>
				</toColumns>
				<condition>
					<sql>#FROM_TABLE#.indus_cl_set_id in (''TKISSTYP'',''BBSECTYP'',''FTISSTYP'',''ASSETCLS'')</sql>
				</condition>
			</relation>
			<relation relatedTable="FT_T_INCL" name="ISCLF003">
				<fromColumns>
					<column name="CLSF_OID"/>
				</fromColumns>
				<toColumns>
					<column name="CLSF_OID"/>
				</toColumns>
			</relation>
		</table>
		<table name="FT_T_ISLL">
			<relation relatedTable="FT_T_ISSU" name="isllissu">
				<fromColumns>
					<column name="instr_id"/>
				</fromColumns>
				<toColumns>
					<column name="instr_id"/>
				</toColumns>
				<condition>
					<sql>#FROM_TABLE#.last_chg_tms in (SELECT max(last_chg_tms) FROM ft_t_isll where instr_id = #TO_TABLE#.instr_id)</sql>
				</condition>
			</relation>
		</table>
		<table name="FT_T_ISGU">
			<relation relatedTable="FT_T_ISSU" name="ISSUISGU">
				<fromColumns>
					<column name="INSTR_ID"/>
				</fromColumns>
				<toColumns>
					<column name="INSTR_ID"/>
				</toColumns>
				<condition>
					<sql>#FROM_TABLE#.gu_typ =''COUNTRY''</sql>
				</condition>
			</relation>
		</table>
		<table name="FT_T_ISRT">
			<relation relatedTable="FT_T_ISSU" name="ISSU_RTNG_MHI">
				<fromColumns>
					<column name="INSTR_ID"/>
				</fromColumns>
				<toColumns>
					<column name="INSTR_ID"/>
				</toColumns>
				<condition>
					<sql>#FROM_TABLE#.SYS_EFF_END_TMS IS NULL</sql>
				</condition>
			</relation>
		</table>
		<table name="FT_T_PEDF">
			<relation relatedTable="FT_T_ISSU" name="pedffactorissu">
				<fromColumns>
					<column name="instr_id"/>
				</fromColumns>
				<toColumns>
					<column name="instr_id"/>
				</toColumns>
				<condition>
					<sql>#FROM_TABLE#.ev_typ IN (''FACTOR'')</sql>
				</condition>
			</relation>
		</table>
		<table name="FT_T_RIDF">
			<relation relatedTable="FT_T_ISSU" name="ridfwarrant">
				<fromColumns>
					<column name="instr_id"/>
				</fromColumns>
				<toColumns>
					<column name="instr_id"/>
				</toColumns>
				<condition>
					<sql>#FROM_TABLE#.rel_typ IN (''WARRANT'',''WRT CALL'',''WRT PUT'')</sql>
				</condition>
			</relation>
		</table>
		<table name="FT_T_IEVP">
			<relation relatedTable="FT_T_IEDF" name="iedfievpestdiv">
				<fromColumns>
					<column name="INC_EV_DEF_ID"/>
				</fromColumns>
				<toColumns>
					<column name="INC_EV_DEF_ID"/>
				</toColumns>
				<condition>
					<sql>#FROM_TABLE#.prt_purp_typ IN (''ESTIMATE'',''DIVIDEND'')</sql>
				</condition>
			</relation>
		</table>
		<table name="FT_T_IPDF">
			<relation relatedTable="FT_T_IEVP" name="ipdfbasecpi">
				<fromColumns>
					<column name="INC_EV_PRT_ID"/>
				</fromColumns>
				<toColumns>
					<column name="INC_EV_PRT_ID"/>
				</toColumns>
				<condition>
					<sql>#FROM_TABLE#.rate_fixing_base_crte is not null and #FROM_TABLE#.start_tms = (select max(start_tms) from ft_t_ipdf where inc_ev_prt_id=#FROM_TABLE#.inc_ev_prt_id and rate_fixing_base_crte is not null)</sql>
				</condition>
			</relation>
		</table>
		<table name="FT_T_PEVP">
			<relation relatedTable="FT_T_PEDF" name="pevpfactorissu">
				<fromColumns>
					<column name="prin_ev_def_id"/>
				</fromColumns>
				<toColumns>
					<column name="prin_ev_def_id"/>
				</toColumns>
				<condition>
					<sql>#FROM_TABLE#.prt_purp_typ IN (''FACTOR'')</sql>
				</condition>
			</relation>
		</table>
		<table name="FT_T_PPDF">
			<relation relatedTable="FT_T_PEVP" name="ppdf_pevp">
				<fromColumns>
					<column name="PRIN_EV_PRT_ID"/>
				</fromColumns>
				<toColumns>
					<column name="PRIN_EV_PRT_ID"/>
				</toColumns>
				<condition>
					<sql>LIMIT 1</sql>
				</condition>
			</relation>
		</table>
		<table name="FT_T_RISS">
			<relation relatedTable="FT_T_RIDF" name="risswarrant">
				<fromColumns>
					<column name="rld_iss_feat_id"/>
				</fromColumns>
				<toColumns>
					<column name="rld_iss_feat_id"/>
				</toColumns>
				<condition>
					<sql>#FROM_TABLE#.iss_part_rl_typ IN (''DELIVER'',''RECEIVE'',''UNDLYING'')</sql>
				</condition>
			</relation>
		</table>
		<table name="FT_T_FRIP">
			<relation relatedTable="FT_T_FINR" name="fripfinr">
				<fromColumns>
					<column name="INST_MNEM"/>
					<column name="FINSRL_TYP"/>
				</fromColumns>
				<toColumns>
					<column name="INST_MNEM"/>
					<column name="FINSRL_TYP"/>
				</toColumns>
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
		<table name="FT_T_RISS">
			<relation relatedTable="FT_T_ISSU">
				<fromColumns>
					<column name="INSTR_ID"/>
				</fromColumns>
				<toColumns>
					<column name="INSTR_ID"/>
				</toColumns>
			</relation>
		</table>
		<table name="FT_T_ISID">
			<relation relatedTable="FT_T_ISSU" name="ISIDNOMKIS">
				<fromColumns>
					<column name="INSTR_ID"/>
				</fromColumns>
				<toColumns>
					<column name="INSTR_ID"/>
				</toColumns>
				<condition>
					<sql>(#FROM_TABLE#.mkt_oid is null or #FROM_TABLE#.mkt_oid not in (select mkt_oid from ft_t_mkis where instr_id = #FROM_TABLE#.instr_id and COALESCE(end_tms, to_date(''2099/12/31'',''YYYY/MM/DD'')) > SYSDATE() ))</sql>
				</condition>
			</relation>
		</table>
		<table name="FT_T_ISID">
			<relation relatedTable="FT_T_MKIS" name="ISIDMKIS_NoMIXR">
				<fromColumns>
					<column name="INSTR_ID"/>
					<column name="MKT_OID"/>
				</fromColumns>
				<toColumns>
					<column name="INSTR_ID"/>
					<column name="MKT_OID"/>
				</toColumns>
				<condition>
					<sql>#FROM_TABLE#.isid_oid not in (select isid_oid from ft_t_mixr where mkt_iss_oid IN ( SELECT mkt_iss_oid FROM ft_t_mkis where instr_id = #FROM_TABLE#.instr_id and COALESCE(end_tms, to_date(''2099/12/31'',''YYYY/MM/DD'')) > SYSDATE() ) and COALESCE(end_tms, to_date(''2099/12/31'',''YYYY/MM/DD'')) > SYSDATE() )</sql>
				</condition>
			</relation>
		</table>
		<table name="FT_T_IDMV">
			<relation relatedTable="FT_T_IEDF" name="IDMVIEDF">
				<fromColumns>
					<column name="INTRNL_DMN_VAL_TXT"/>
				</fromColumns>
				<toColumns>
					<column name="OTHER_RTFX_COND_CDE"/>
				</toColumns>
				<condition>
					<sql>#FROM_TABLE#.fld_id=''00162211''</sql>
				</condition>
			</relation>
		</table>
		<table name="FT_T_GNCM">
			<relation relatedTable="FT_T_IPDF" name="IPDFGNCMCSTM">
				<fromColumns>
					<column name="CROSS_REF_ID"/>
				</fromColumns>
				<toColumns>
					<column name="INC_PAY_DEF_ID"/>
				</toColumns>
				<condition>
					<sql>#FROM_TABLE#.GNCM_TBL_TYP = ''IPDF''</sql>
				</condition>
			</relation>
		</table>
		<table name="FT_T_UPD1">
			<relation relatedTable="FT_T_ISSU" name="UPD1ISSU">
				<fromColumns>
					<column name="XREF_TBL_ROW_OID"/>
				</fromColumns>
				<toColumns>
					<column name="INSTR_ID"/>
				</toColumns>
				<condition>
					<sql>#FROM_TABLE#.entity_tbl_typ=''ISSU'' and #FROM_TABLE#.sequenceno = (select max( sequenceno ) from ft_t_upd1 upma where upma.xref_tbl_row_oid = #FROM_TABLE#.xref_tbl_row_oid )</sql>
				</condition>
			</relation>
		</table>
		<table name="FT_T_PBAT">
			<relation relatedTable="FT_T_ISSU" name="PBATISSU">
				<fromColumns>
					<column name="PUB_CROSS_REF_ID"/>
				</fromColumns>
				<toColumns>
					<column name="INSTR_ID"/>
				</toColumns>
				<condition>
					<sql>#FROM_TABLE#.published_tbl_id=''ISSU''</sql>
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
		<table name="FT_T_RTOP">
			<relation relatedTable="FT_T_ISRT" name="RTOPISRT_OUTLOOK">
				<fromColumns>
					<column name="INSTR_ID"/>
					<column name="RTNG_SET_OID"/>
				</fromColumns>
				<toColumns>
					<column name="INSTR_ID"/>
					<column name="RTNG_SET_OID"/>
				</toColumns>
				<condition>
					<sql>#FROM_TABLE#.SYS_EFF_END_TMS IS NULL and #FROM_TABLE#.RTNG_OPINION_TYP=''OUTLOOK'' and COALESCE(#FROM_TABLE#.RTNG_SEC_INSTR_IND,''Z'') = COALESCE(#TO_TABLE#.RTNG_SEC_INSTR_IND,''Z'')</sql>
				</condition>
			</relation>
		</table>
		<table name="FT_T_IDMV">
			<relation relatedTable="FT_T_RTOP" name="IDMVRTOP">
				<fromColumns>
					<column name="INTRNL_DMN_VAL_TXT"/>
				</fromColumns>
				<toColumns>
					<column name="RTNG_OPINION_STAT_TYP"/>
				</toColumns>
				<condition>
					<sql>#FROM_TABLE#.fld_id=''01851050''</sql>
				</condition>
			</relation>
		</table>
		<table name="FT_T_MUST">
			<relation relatedTable="FT_T_MKIS" name="mkismust">
				<fromColumns>
					<column name="MKT_ISS_OID"/>
				</fromColumns>
				<toColumns>
					<column name="MKT_ISS_OID"/>
				</toColumns>
			</relation>
		</table>
	</relations>
</model>' ,last_chg_tms = SYSDATE() WHERE modl_id = 'ISSUPUB';