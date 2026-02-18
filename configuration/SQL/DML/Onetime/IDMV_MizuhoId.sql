INSERT INTO ft_t_idmv
(intrnl_dmn_val_id, fld_data_cl_id, fld_id, appl_id, last_chg_tms, last_chg_usr_id, mod_rst_ind, intrnl_dmn_val_nme, intrnl_dmn_val_txt, intrnl_dmn_desc, tbl_id, col_nme, ds_id, qual_fld_id, qual_val_txt, dmn_set_id, meta_src_id, data_stat_typ, org_id, dmn_val_purp_typ, data_src_id)
SELECT 'IDMVMIZID', NULL, '00004450', NULL, sysdate(), 'MHI:CSTM', 'N', 'Mizuho ID', 'MIZUHO', 'SecRef', 'ISSU', 'PREF_ID_CTXT_TYP', NULL, NULL, NULL, NULL, NULL, 'ACTIVE', NULL, 'MHI', 'MHI'
WHERE NOT EXISTS (SELECT 1 FROM ft_t_idmv WHERE intrnl_dmn_val_id = 'IDMVMIZID' AND fld_id = '00004450' AND intrnl_dmn_val_nme = 'Mizuho ID');

INSERT INTO ft_t_idmv
(intrnl_dmn_val_id, fld_data_cl_id, fld_id, appl_id, last_chg_tms, last_chg_usr_id, mod_rst_ind, intrnl_dmn_val_nme, intrnl_dmn_val_txt, intrnl_dmn_desc, tbl_id, col_nme, ds_id, qual_fld_id, qual_val_txt, dmn_set_id, meta_src_id, data_stat_typ, org_id, dmn_val_purp_typ, data_src_id) 
SELECT 'IDMV201230', NULL, '00004040', NULL, sysdate(), 'MHI:CSTM', 'N', 'ENT1', 'ENT1', 'ENT1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ACTIVE', NULL, NULL, 'MHI' WHERE NOT EXISTS (SELECT 1 FROM ft_t_idmv WHERE intrnl_dmn_val_id = 'IDMV201230' AND fld_id = '00004040' AND intrnl_dmn_val_nme = 'ENT1');

INSERT INTO ft_t_idmv
(intrnl_dmn_val_id, fld_data_cl_id, fld_id, appl_id, last_chg_tms, last_chg_usr_id, mod_rst_ind, intrnl_dmn_val_nme, intrnl_dmn_val_txt, intrnl_dmn_desc, tbl_id, col_nme, ds_id, qual_fld_id, qual_val_txt, dmn_set_id, meta_src_id, data_stat_typ, org_id, dmn_val_purp_typ, data_src_id) 
SELECT 'IDMV201231', NULL, '00004040', NULL, sysdate(), 'MHI:CSTM', 'N', 'MHI', 'MHI', 'MHI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ACTIVE', NULL, NULL, 'MHI' WHERE NOT EXISTS (SELECT 1 FROM ft_t_idmv WHERE intrnl_dmn_val_id = 'IDMV201231' AND fld_id = '00004040' AND intrnl_dmn_val_nme = 'MHI');

INSERT INTO ft_t_idmv
(intrnl_dmn_val_id, fld_data_cl_id, fld_id, appl_id, last_chg_tms, last_chg_usr_id, mod_rst_ind, intrnl_dmn_val_nme, intrnl_dmn_val_txt, intrnl_dmn_desc, tbl_id, col_nme, ds_id, qual_fld_id, qual_val_txt, dmn_set_id, meta_src_id, data_stat_typ, org_id, dmn_val_purp_typ, data_src_id) 
SELECT 'IDMV201232', NULL, '00004040', NULL, sysdate(), 'MHI:CSTM', 'N', 'MBE', 'MBE', 'MBE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ACTIVE', NULL, NULL, 'MHI' WHERE NOT EXISTS (SELECT 1 FROM ft_t_idmv WHERE intrnl_dmn_val_id = 'IDMV201232' AND fld_id = '00004040' AND intrnl_dmn_val_nme = 'MBE');

INSERT INTO ft_t_idmv
(intrnl_dmn_val_id, fld_data_cl_id, fld_id, appl_id, last_chg_tms, last_chg_usr_id, mod_rst_ind, intrnl_dmn_val_nme, intrnl_dmn_val_txt, intrnl_dmn_desc, tbl_id, col_nme, ds_id, qual_fld_id, qual_val_txt, dmn_set_id, meta_src_id, data_stat_typ, org_id, dmn_val_purp_typ, data_src_id) 
SELECT 'IDMV201233', NULL, '00004040', NULL, sysdate(), 'MHI:CSTM', 'N', 'MHSS', 'MHSS', 'MHSS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ACTIVE', NULL, NULL, 'MHI' WHERE NOT EXISTS (SELECT 1 FROM ft_t_idmv WHERE intrnl_dmn_val_id = 'IDMV201233' AND fld_id = '00004040' AND intrnl_dmn_val_nme = 'MHSS');

INSERT INTO ft_t_idmv
(intrnl_dmn_val_id, fld_data_cl_id, fld_id, appl_id, last_chg_tms, last_chg_usr_id, mod_rst_ind, intrnl_dmn_val_nme, intrnl_dmn_val_txt, intrnl_dmn_desc, tbl_id, col_nme, ds_id, qual_fld_id, qual_val_txt, dmn_set_id, meta_src_id, data_stat_typ, org_id, dmn_val_purp_typ, data_src_id) 
SELECT 'IDMV201234', NULL, '00004040', NULL, sysdate(), 'MHI:CSTM', 'N', 'MHSC', 'MHSC', 'MHSC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ACTIVE', NULL, NULL, 'MHI' WHERE NOT EXISTS (SELECT 1 FROM ft_t_idmv WHERE intrnl_dmn_val_id = 'IDMV201234' AND fld_id = '00004040' AND intrnl_dmn_val_nme = 'MHSC');

INSERT INTO ft_t_idmv
(intrnl_dmn_val_id, fld_data_cl_id, fld_id, appl_id, last_chg_tms, last_chg_usr_id, mod_rst_ind, intrnl_dmn_val_nme, intrnl_dmn_val_txt, intrnl_dmn_desc, tbl_id, col_nme, ds_id, qual_fld_id, qual_val_txt, dmn_set_id, meta_src_id, data_stat_typ, org_id, dmn_val_purp_typ, data_src_id) 
SELECT 'IDMV201235', NULL, '00004040', NULL, sysdate(), 'MHI:CSTM', 'N', 'MHSA', 'MHSA', 'MHSA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ACTIVE', NULL, NULL, 'MHI' WHERE NOT EXISTS (SELECT 1 FROM ft_t_idmv WHERE intrnl_dmn_val_id = 'IDMV201235' AND fld_id = '00004040' AND intrnl_dmn_val_nme = 'MHSA');

INSERT INTO ft_t_idmv
(intrnl_dmn_val_id, fld_data_cl_id, fld_id, appl_id, last_chg_tms, last_chg_usr_id, mod_rst_ind, intrnl_dmn_val_nme, intrnl_dmn_val_txt, intrnl_dmn_desc, tbl_id, col_nme, ds_id, qual_fld_id, qual_val_txt, dmn_set_id, meta_src_id, data_stat_typ, org_id, dmn_val_purp_typ, data_src_id) 
SELECT 'IDMV201236', NULL, '00004040', NULL, sysdate(), 'MHI:CSTM', 'N', 'MHEU', 'MHEU', 'MHEU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ACTIVE', NULL, NULL, 'MHI' WHERE NOT EXISTS (SELECT 1 FROM ft_t_idmv WHERE intrnl_dmn_val_id = 'IDMV201236' AND fld_id = '00004040' AND intrnl_dmn_val_nme = 'MHEU');


INSERT INTO ft_t_idmv
(intrnl_dmn_val_id, fld_data_cl_id, fld_id, appl_id, last_chg_tms, last_chg_usr_id, mod_rst_ind, intrnl_dmn_val_nme, intrnl_dmn_val_txt, intrnl_dmn_desc, tbl_id, col_nme, ds_id, qual_fld_id, qual_val_txt, dmn_set_id, meta_src_id, data_stat_typ, org_id, dmn_val_purp_typ, data_src_id)
select 'IDMVMHILIS', NULL, '00004450', NULL, sysdate(), 'MHI:CSTM', 'N', 'MHI Listing ID', 'MHILIST', 'MHI Listing ID', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ACTIVE',NULL, 'MKTINTID', 'MHI' FROM dual
WHERE NOT EXISTS (select 1 FROM ft_t_idmv  where intrnl_dmn_val_id = 'IDMVMHILIS' and fld_id = '00004450' and intrnl_dmn_val_nme ='MHI Listing ID');


INSERT INTO ft_t_idmv
(intrnl_dmn_val_id, fld_data_cl_id, fld_id, appl_id, last_chg_tms, last_chg_usr_id, mod_rst_ind, intrnl_dmn_val_nme, intrnl_dmn_val_txt, intrnl_dmn_desc, tbl_id, col_nme, ds_id, qual_fld_id, qual_val_txt, dmn_set_id, meta_src_id, data_stat_typ, org_id, dmn_val_purp_typ, data_src_id)
 select 'IDMVGTCODE', NULL, '00004450', NULL, sysdate(), 'MHI:CSTM', 'N', 'GTCode', 'GTCode', 'MHSC ProductMaster Issue Identifier', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ACTIVE', NULL, 'INTLVLID', 'MHI' FROM dual WHERE NOT EXISTS (select 1 FROM ft_t_idmv  where intrnl_dmn_val_id = 'IDMVGTCODE' and fld_id = '00004450' and intrnl_dmn_val_nme = 'GTCode');


INSERT INTO ft_t_idmv
(intrnl_dmn_val_id, fld_data_cl_id, fld_id, appl_id, last_chg_tms, last_chg_usr_id, mod_rst_ind, intrnl_dmn_val_nme, intrnl_dmn_val_txt, intrnl_dmn_desc, tbl_id, col_nme, ds_id, qual_fld_id, qual_val_txt, dmn_set_id, meta_src_id, data_stat_typ, org_id, dmn_val_purp_typ, data_src_id)
 select 'IDMVMDYDBT', NULL, '00004450', NULL, sysdate(), 'MHI:CSTM', 'N', 'Moodys Debt Number', 'MDYDBTNO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ACTIVE', NULL, 'INTLVLID', 'MHI' FROM dual WHERE NOT EXISTS (select 1 FROM ft_t_idmv  where intrnl_dmn_val_id = 'IDMVMDYDBT' and fld_id = '00004450' and intrnl_dmn_val_nme = 'Moodys Debt Number');
 
 
 INSERT INTO ft_t_idmv
(intrnl_dmn_val_id, fld_data_cl_id, fld_id, appl_id, last_chg_tms, last_chg_usr_id, mod_rst_ind, intrnl_dmn_val_nme, intrnl_dmn_val_txt, intrnl_dmn_desc, tbl_id, col_nme, ds_id, qual_fld_id, qual_val_txt, dmn_set_id, meta_src_id, data_stat_typ, org_id, dmn_val_purp_typ, data_src_id)
 select 'IDMVISINSU', NULL, '00004450', NULL,sysdate(), 'MHI:CSTM', 'N', 'ISINSUB Identifier', 'ISINSUB', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ACTIVE', NULL, 'INTLVLID', 'MHI' FROM dual WHERE NOT EXISTS (select 1 FROM ft_t_idmv  where intrnl_dmn_val_id = 'IDMVISINSU' and fld_id = '00004450' and intrnl_dmn_val_nme = 'ISINSUB Identifier');
 
  INSERT INTO ft_t_idmv
(intrnl_dmn_val_id, fld_data_cl_id, fld_id, appl_id, last_chg_tms, last_chg_usr_id, mod_rst_ind, intrnl_dmn_val_nme, intrnl_dmn_val_txt, intrnl_dmn_desc, tbl_id, col_nme, ds_id, qual_fld_id, qual_val_txt, dmn_set_id, meta_src_id, data_stat_typ, org_id, dmn_val_purp_typ, data_src_id)
 select 'IDMVALTISN', NULL, '00004450', NULL, sysdate(), 'MHI:CSTM', 'N', 'ALT INSTRUMENT ID', 'ALTINSID', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ACTIVE', NULL, 'INTLVLID', 'MHI' FROM dual WHERE NOT EXISTS (select 1 FROM ft_t_idmv  where intrnl_dmn_val_id = 'IDMVALTISN' and fld_id = '00004450' and intrnl_dmn_val_nme = 'ALT INSTRUMENT ID');
 
   INSERT INTO ft_t_idmv
(intrnl_dmn_val_id, fld_data_cl_id, fld_id, appl_id, last_chg_tms, last_chg_usr_id, mod_rst_ind, intrnl_dmn_val_nme, intrnl_dmn_val_txt, intrnl_dmn_desc, tbl_id, col_nme, ds_id, qual_fld_id, qual_val_txt, dmn_set_id, meta_src_id, data_stat_typ, org_id, dmn_val_purp_typ, data_src_id)
 select 'IDMVFITC', NULL, '00004450', NULL, sysdate(), 'MHI:CSTM', 'N', 'Fitch Issuer ID', 'FITCH', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ACTIVE', NULL, 'INTLVLID', 'MHI' FROM dual WHERE NOT EXISTS (select 1 FROM ft_t_idmv  where intrnl_dmn_val_id = 'IDMVFITC' and fld_id = '00004450' and intrnl_dmn_val_nme = 'Fitch Issuer ID');

commit;