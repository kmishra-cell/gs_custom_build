ALTER TABLE FT_T_LAAP ALTER COLUMN LAAN_OID DROP NOT NULL;

update FT_t_CLDF set col_req_ind ='N' where tbl_id ='LAAP' and col_nme ='LAAN_OID';

INSERT INTO ft_t_medo
(medo_oid, meta_tbl_typ, tbl_id, cldf_tbl_id, col_nme, tidx_oid, tbl_index_nme, tbrl_oid, tbl_fgn_key_id, last_chg_tms, last_chg_usr_id, cmnt_txt, created_tms, meta_change_ind, meta_change_stmt_txt, meta_change_applied_tms, meta_change_stat_typ, meta_change_err_dtl_txt)
SELECT 'MEDO====05', 'CLDF', 'LAAP', 'LAAP', 'LAAN_OID', NULL, NULL, NULL, NULL, sysdate(), 'GS:DM', NULL, sysdate(), NULL, 'update FT_t_CLDF set col_req_ind = ''N'' where tbl_id =''LAAP'' and col_nme =''LAAN_OID'';', NULL, NULL, NULL
WHERE NOT EXISTS (SELECT 1 FROM ft_t_medo WHERE meta_tbl_typ ='CLDF' AND tbl_id ='LAAP'AND cldf_tbl_id ='LAAP' AND col_nme='LAAN_OID');

