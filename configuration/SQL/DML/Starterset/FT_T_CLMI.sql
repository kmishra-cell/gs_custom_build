INSERT INTO ft_t_clmi
(clmi_oid, src_tbl_id, src_col_nme, trgt_tbl_id, trgt_col_nme, pgm_data_typ, last_chg_tms, last_chg_usr_id, mapping_purp_typ, virtual_mapping_ind)
select 'LAGRLAV103', 'LAGR', 'LAGR_OID', 'LAV1', 'LAGR_OID', 'STRING', SYSDATE(), 'MHICSTM', NULL, NULL from DUAL where not exists (SELECT 1 from FT_T_CLMI where clmi_oid ='LAGRLAV103' AND trgt_tbl_id ='LAV1' AND trgt_col_nme='LAGR_OID');


INSERT INTO ft_t_clmi
(clmi_oid, src_tbl_id, src_col_nme, trgt_tbl_id, trgt_col_nme, pgm_data_typ, last_chg_tms, last_chg_usr_id, mapping_purp_typ, virtual_mapping_ind)
select 'LAGRCCRF03', 'LAGR', 'LAGR_OID', 'CCRF', 'LAGR_OID', 'STRING', SYSDATE(), 'MHICSTM', NULL, NULL from DUAL where not exists (SELECT 1 from FT_T_CLMI where clmi_oid ='LAGRCCRF03' AND trgt_tbl_id ='CCRF' AND trgt_col_nme='LAGR_OID');

INSERT INTO ft_t_clmi
(clmi_oid, src_tbl_id, src_col_nme, trgt_tbl_id, trgt_col_nme, pgm_data_typ, last_chg_tms, last_chg_usr_id, mapping_purp_typ, virtual_mapping_ind)
select 'LAAPLACC01', 'LAAP', 'LAAP_OID', 'LAAC', 'LAAP_OID', 'STRING', SYSDATE(), 'MHICSTM', NULL, NULL from DUAL where not exists (SELECT 1 from FT_T_CLMI where clmi_oid ='LAAPLACC01' AND trgt_tbl_id ='LAAC' AND trgt_col_nme='LAAP_OID');
