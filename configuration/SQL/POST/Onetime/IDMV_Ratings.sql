INSERT INTO ft_t_idmv
(intrnl_dmn_val_id, fld_data_cl_id, fld_id, appl_id, last_chg_tms, last_chg_usr_id, mod_rst_ind, intrnl_dmn_val_nme, intrnl_dmn_val_txt, intrnl_dmn_desc, tbl_id, col_nme, ds_id, qual_fld_id, qual_val_txt, dmn_set_id, meta_src_id, data_stat_typ, org_id, dmn_val_purp_typ, data_src_id)
VALUES('AVs7w)jrG1', NULL, '01851086', NULL, sysdate(), 'GS:FD:DAS', 'C', 'FITCH Issuer to LEI', 'FITCHISSUERLEI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'FITCH');


INSERT INTO ft_t_idmv
(intrnl_dmn_val_id, fld_data_cl_id, fld_id, appl_id, last_chg_tms, last_chg_usr_id, mod_rst_ind, intrnl_dmn_val_nme, intrnl_dmn_val_txt, intrnl_dmn_desc, tbl_id, col_nme, ds_id, qual_fld_id, qual_val_txt, dmn_set_id, meta_src_id, data_stat_typ, org_id, dmn_val_purp_typ, data_src_id)
VALUES('DVs?u(jrG1', NULL, '01851086', NULL, sysdate(), 'GS:FD:DAS', 'N', 'MOODYS Issuer to LEI', 'MOODYSISSUERLEI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ACTIVE', NULL, NULL, 'MOODYS_RDS');


INSERT INTO ft_t_idmv
(intrnl_dmn_val_id, fld_data_cl_id, fld_id, appl_id, last_chg_tms, last_chg_usr_id, mod_rst_ind, intrnl_dmn_val_nme, intrnl_dmn_val_txt, intrnl_dmn_desc, tbl_id, col_nme, ds_id, qual_fld_id, qual_val_txt, dmn_set_id, meta_src_id, data_stat_typ, org_id, dmn_val_purp_typ, data_src_id)
VALUES('HUs2$)jrG1', NULL, '00182497', NULL, sysdate(), 'GS:FD:DAS', 'C', 'UK ENDORSEMENT INDICATOR', 'UK ENDORSEMENT INDICATOR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ACTIVE', NULL, NULL, 'MOODYS_RDS');


INSERT INTO ft_t_edmv
(edmv_oid, intrnl_dmn_val_id, data_src_id, efld_data_src_id, ext_fld_id, nls_cde, last_chg_tms, last_chg_usr_id, data_stat_typ, ext_dmn_val_txt, ext_dmn_val_nme, ext_dmn_val_desc, start_tms, end_tms)
VALUES('=000018200', 'CONFTH04', 'FITCH', NULL, NULL, 'ENGLISH', sysdate(), 'GS:FD:DAS', 'ACTIVE', '4', '4', NULL, sysdate(), NULL);


INSERT INTO ft_t_edmv
(edmv_oid, intrnl_dmn_val_id, data_src_id, efld_data_src_id, ext_fld_id, nls_cde, last_chg_tms, last_chg_usr_id, data_stat_typ, ext_dmn_val_txt, ext_dmn_val_nme, ext_dmn_val_desc, start_tms, end_tms)
VALUES('=000018201', 'CONFTH14', 'FITCH', NULL, NULL, 'ENGLISH', sysdate(), 'GS:FD:DAS', 'ACTIVE', '20', '20', NULL, sysdate(), NULL);

INSERT INTO ft_t_edmv
(edmv_oid, intrnl_dmn_val_id, data_src_id, efld_data_src_id, ext_fld_id, nls_cde, last_chg_tms, last_chg_usr_id, data_stat_typ, ext_dmn_val_txt, ext_dmn_val_nme, ext_dmn_val_desc, start_tms, end_tms)
VALUES('=000018202', 'CONFTH16', 'FITCH', NULL, NULL, 'ENGLISH', sysdate(), 'GS:FD:DAS', 'ACTIVE', '22', '22', NULL, sysdate(), NULL);

INSERT INTO ft_t_edmv
(edmv_oid, intrnl_dmn_val_id, data_src_id, efld_data_src_id, ext_fld_id, nls_cde, last_chg_tms, last_chg_usr_id, data_stat_typ, ext_dmn_val_txt, ext_dmn_val_nme, ext_dmn_val_desc, start_tms, end_tms)
VALUES('=000018203', 'ID28162181', 'FITCH', NULL, NULL, 'ENGLISH', sysdate(), 'GS:FD:DAS', 'ACTIVE', '28', '28', NULL, sysdate(), NULL);



INSERT INTO ft_t_rtng
(rtng_set_oid, rtng_set_tbl_typ, rtng_set_mnem, rtng_tenor_mnem, rtng_set_curr_cde, start_tms, end_tms, last_chg_tms, last_chg_usr_id, rtng_set_typ, rtng_set_nme, rtng_set_desc, data_stat_typ, data_src_id, inst_mnem, finsrl_typ, gu_id, gu_typ, gu_cnt, rtng_set_scale_typ, finr_oid, gunt_oid)
VALUES('fywOy)PmG1', 'FINS', 'VIABLRTG', 'ST', NULL, '2025-06-02 00:00:00.000', NULL, '2025-07-03 17:14:58.000', 'GSFD_RAS', 'RATING', 'Viability Rating', 'Viability ratings represent intrinsic creditworthiness of an issuer', 'ACTIVE', 'FITCH', 'h&wPs<PmG1', 'RTAGENCY', NULL, NULL, NULL, NULL, NULL, NULL);

