--******************************************
--******* INSERT SCRIPT FOR TABLE MHI1 *****
--******************************************
--******************************************
--******* INSERT SCRIPT FOR TABLE MHI1 *****
--******************************************
DELETE FROM FT_T_XSTO WHERE TBL_ID = 'MHI1';
DELETE FROM FT_T_XELM WHERE TBL_ID = 'MHI1';
DELETE FROM FT_T_XSEG WHERE SEGMENT_DESC = 'MHI1';
DELETE FROM FT_T_CLMI WHERE TRGT_TBL_ID = 'MHI1';
DELETE FROM FT_T_ETDF WHERE TBL_SYNM_ID = 'MHI1';
DELETE FROM FT_T_TIDC WHERE TBL_ID = 'MHI1';
DELETE FROM FT_T_TIDX WHERE TBL_ID = 'MHI1';
DELETE FROM FT_T_CLDF WHERE TBL_ID = 'MHI1';
delete from fT_T_fldf where FLD_ID like 'MHI1%';
DELETE FROM FT_T_TBDF WHERE TBL_ID = 'MHI1';




INSERT INTO ft_t_tbdf
(tbl_id, last_chg_tms, last_chg_usr_id, data_modl_ver_id, tbl_nme, tbl_desc, last_cmp_tms, tbl_ddl_nme, tbl_clsf_typ, tbl_prop_to_nme, tbl_subject_area_nme, tbl_prin_app_nme, tbl_owner_nme, tbl_data_owner_nme, tbl_data_typ, tbl_data_upd_rule_typ, tbl_obsolete_ind, vddb_shared_tbl_ind, prodctn_first_install_typ, prodctn_upd_typ, tbl_view_nme, data_modl_id, tbl_cmnt_txt, est_tbl_size_ind, logging_ind, oracle_init_trans_num, oracle_pct_free_num, dw_standalone_ind, cdc_enabled_ind, audit_enabled_ind, staging_enabled_ind, non_relational_typ, lock_occur_ind, bi_temporal_ind, car_enabled_ind)
VALUES('MHI1', NOW(), 'MHI:CSTM', '8.4.1.1', 'MhiOperations', 'Dummy view for MHI Operations.', NULL, 'FT_V_MHI1', 'X', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


INSERT INTO gc_own.ft_t_fldf
(fld_id, last_chg_tms, last_chg_usr_id, fld_data_cl_id, fld_tag_typ, prnt_fld_id, fld_dflt_meth_nme, fld_edit_meth_nme, ddl_nme, fill_char, just_typ, ctl_tot_elig_ind, fld_used_by_typ, dmn_tbl_typ, fld_dflt_val_txt, fld_nme, fld_desc, dspy_data_typ, dspy_int_num, dspy_dec_num, dspy_caption_txt, mn_val_camt, mx_val_camt, fld_dflt_camt)
VALUES('MHI1001U', NOW(), 'MHI:CSTM', 'OID', NULL, NULL, NULL, NULL, 'MHI1_OID', NULL, NULL, NULL, 'T', NULL, NULL, 'MHI1_OID', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);



INSERT INTO ft_t_cldf
(tbl_id, col_nme, fld_id, prnt_tbl_id, prnt_col_nme, col_req_ind, ddl_data_typ, col_sq_num, last_chg_tms, last_chg_usr_id, native_col_ind, logl_nme, col_desc, ddl_base_data_typ, ddl_data_len, ddl_data_prec_num, ddl_data_scale_num, ddl_data_dflt_txt, col_view_nme, oracle_lob_txt, db2_lob_txt, info_typ_nme, col_obsolete_ind, col_cmnt_txt, dspy_caption_txt, dmn_set_id, edmv_used_ind, virtual_col_ind)
VALUES('MHI1', 'CMNT_TXT', '00104307', NULL, NULL, 'N', 'VARCHAR(4000)', 50, NOW(), 'GS:MSYS', 'Y', 'Comment Text', 'This field contains the comment text in the language specified by the related NLS Code Definition occurrence.', 'VARCHAR', 4000, NULL, NULL, NULL, NULL, NULL, NULL, 'COMMENT_TEXT', NULL, NULL, NULL, NULL, NULL, NULL);


INSERT INTO ft_t_cldf
(tbl_id, col_nme, fld_id, prnt_tbl_id, prnt_col_nme, col_req_ind, ddl_data_typ, col_sq_num, last_chg_tms, last_chg_usr_id, native_col_ind, logl_nme, col_desc, ddl_base_data_typ, ddl_data_len, ddl_data_prec_num, ddl_data_scale_num, ddl_data_dflt_txt, col_view_nme, oracle_lob_txt, db2_lob_txt, info_typ_nme, col_obsolete_ind, col_cmnt_txt, dspy_caption_txt, dmn_set_id, edmv_used_ind, virtual_col_ind)
VALUES('MHI1', 'MHI1_OID', 'MHI1001U', NULL, NULL, 'N', 'VARCHAR(10)', 1, NOW(), 'MHI:CSTM', NULL, 'MHI1_OID', NULL, 'VARCHAR', 10, NULL, NULL, NULL, NULL, NULL, NULL, 'OBJECT_IDENTIFIER', NULL, NULL, NULL, NULL, NULL, NULL);


INSERT INTO ft_t_cldf
(tbl_id, col_nme, fld_id, prnt_tbl_id, prnt_col_nme, col_req_ind, ddl_data_typ, col_sq_num, last_chg_tms, last_chg_usr_id, native_col_ind, logl_nme, col_desc, ddl_base_data_typ, ddl_data_len, ddl_data_prec_num, ddl_data_scale_num, ddl_data_dflt_txt, col_view_nme, oracle_lob_txt, db2_lob_txt, info_typ_nme, col_obsolete_ind, col_cmnt_txt, dspy_caption_txt, dmn_set_id, edmv_used_ind, virtual_col_ind)
VALUES('MHI1', 'MKT_OID', '00101628', NULL, NULL, 'N', 'VARCHAR(10)', 3, NOW(), 'MHI:CSTM', NULL, 'Financial Market OID', 'This field uniquely identifies an occurrence of the Financial Market table. This value is typically programmatically generated.', 'VARCHAR', 10, NULL, NULL, NULL, NULL, NULL, NULL, 'OBJECT_IDENTIFIER', NULL, NULL, NULL, NULL, NULL, NULL);


INSERT INTO ft_t_cldf
(tbl_id, col_nme, fld_id, prnt_tbl_id, prnt_col_nme, col_req_ind, ddl_data_typ, col_sq_num, last_chg_tms, last_chg_usr_id, native_col_ind, logl_nme, col_desc, ddl_base_data_typ, ddl_data_len, ddl_data_prec_num, ddl_data_scale_num, ddl_data_dflt_txt, col_view_nme, oracle_lob_txt, db2_lob_txt, info_typ_nme, col_obsolete_ind, col_cmnt_txt, dspy_caption_txt, dmn_set_id, edmv_used_ind, virtual_col_ind)
VALUES('MHI1', 'ORG_ID', '00004040', NULL, NULL, 'N', 'VARCHAR(4)', 4, NOW(), 'MHI:CSTM', NULL, 'Organization ID', 'The Organization ID field uniquely identifies an enterprise.', 'VARCHAR', 4, NULL, NULL, NULL, NULL, NULL, NULL, 'ORGANIZATIONAL_IDENTIFIER', NULL, NULL, NULL, NULL, NULL, NULL);


INSERT INTO ft_t_cldf
(tbl_id, col_nme, fld_id, prnt_tbl_id, prnt_col_nme, col_req_ind, ddl_data_typ, col_sq_num, last_chg_tms, last_chg_usr_id, native_col_ind, logl_nme, col_desc, ddl_base_data_typ, ddl_data_len, ddl_data_prec_num, ddl_data_scale_num, ddl_data_dflt_txt, col_view_nme, oracle_lob_txt, db2_lob_txt, info_typ_nme, col_obsolete_ind, col_cmnt_txt, dspy_caption_txt, dmn_set_id, edmv_used_ind, virtual_col_ind)
VALUES('MHI1', 'PRNT_ISS_GRP_OID', '00068419', NULL, NULL, 'N', 'VARCHAR(10)', 2, NOW(), 'MHI:CSTM', NULL, 'Parent Issue Group OID', 'This field acts as a surrogate key for this table.  This field  value is normally created via an algorithm that guarantees a unique value.', 'VARCHAR', 10, NULL, NULL, NULL, NULL, NULL, NULL, 'OBJECT_IDENTIFIER', NULL, NULL, NULL, NULL, NULL, NULL);


INSERT INTO gc_own.ft_t_tidx
(tidx_oid, tbl_id, tbl_index_nme, tbl_index_typ, last_chg_tms, last_chg_usr_id, tbl_index_partition_typ, oracle_init_trans_num, reverse_index_ind, bitmap_index_ind)
VALUES('MHI1P001==', 'MHI1', 'FT_V_MHI1_PK', 'P', NOW(), 'MHI:CSTM', NULL, NULL, NULL, NULL);


INSERT INTO gc_own.ft_t_tidc
(tidc_oid, tidx_oid, tbl_id, col_nme, col_sq_num, sort_seq_typ, last_chg_tms, last_chg_usr_id, col_expr_txt)
VALUES('MHI1P00101', 'MHI1P001==', 'MHI1', 'MHI1_OID', 1, NULL, NOW(), 'MHI:CSTM', NULL);


commit;