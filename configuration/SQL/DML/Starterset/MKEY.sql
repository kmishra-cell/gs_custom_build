INSERT INTO ft_o_mkey
(tbl_id, col_nme, match_key_nme, last_chg_tms, last_chg_usr_id)
select 'IRGR', 'GRP_NME', 'MHI_IRGR', SYSDATE(), 'MHI:CSTM' from DUAL where not exists (SELECT 1 from FT_O_MKEY where match_key_nme='MHI_IRGR' and col_nme='GRP_NME');

INSERT INTO ft_o_mkey
(tbl_id, col_nme, match_key_nme, last_chg_tms, last_chg_usr_id)
select 'IRGR', 'START_TMS', 'MHI_IRGR', SYSDATE(), 'MHI:CSTM' from DUAL where not exists (SELECT 1 from FT_O_MKEY where match_key_nme='MHI_IRGR' and col_nme='START_TMS');


INSERT INTO ft_o_mkey
(tbl_id, col_nme, match_key_nme, last_chg_tms, last_chg_usr_id)
select 'CCRF', 'START_TMS', 'CCRF_MATCH_20', SYSDATE(), 'MHI:CSTM' from DUAL where not exists (SELECT 1 from FT_O_MKEY where match_key_nme='CCRF_MATCH_20' and col_nme='START_TMS');

INSERT INTO ft_o_mkey
(tbl_id, col_nme, match_key_nme, last_chg_tms, last_chg_usr_id)
select 'CCRF', 'CROSS_REF_PURP_TYP', 'CCRF_MATCH_20', SYSDATE(), 'MHI:CSTM' from DUAL where not exists (SELECT 1 from FT_O_MKEY where match_key_nme='CCRF_MATCH_20' and col_nme='CROSS_REF_PURP_TYP');

INSERT INTO ft_o_mkey
(tbl_id, col_nme, match_key_nme, last_chg_tms, last_chg_usr_id)
select 'CCRF', 'LAGR_OID', 'CCRF_MATCH_20', SYSDATE(), 'MHI:CSTM' from DUAL where not exists (SELECT 1 from FT_O_MKEY where match_key_nme='CCRF_MATCH_20' and col_nme='LAGR_OID');

INSERT INTO ft_o_mkey
(tbl_id, col_nme, match_key_nme, last_chg_tms, last_chg_usr_id)
select 'CCRF', 'EMPL_OID', 'CCRF_MATCH_20', SYSDATE(), 'MHI:CSTM' from DUAL where not exists (SELECT 1 from FT_O_MKEY where match_key_nme='CCRF_MATCH_20' and col_nme='EMPL_OID');

INSERT INTO ft_o_mkey
(tbl_id, col_nme, match_key_nme, last_chg_tms, last_chg_usr_id)
select 'CCRF', 'START_TMS', 'CCRF_MATCH_21', SYSDATE(), 'MHI:CSTM' from DUAL where not exists (SELECT 1 from FT_O_MKEY where match_key_nme='CCRF_MATCH_21' and col_nme='START_TMS');

INSERT INTO ft_o_mkey
(tbl_id, col_nme, match_key_nme, last_chg_tms, last_chg_usr_id)
select 'CCRF', 'CROSS_REF_PURP_TYP', 'CCRF_MATCH_21', SYSDATE(), 'MHI:CSTM' from DUAL where not exists (SELECT 1 from FT_O_MKEY where match_key_nme='CCRF_MATCH_21' and col_nme='CROSS_REF_PURP_TYP');

INSERT INTO ft_o_mkey
(tbl_id, col_nme, match_key_nme, last_chg_tms, last_chg_usr_id)
select 'CCRF', 'LAAN_OID', 'CCRF_MATCH_21', SYSDATE(), 'MHI:CSTM' from DUAL where not exists (SELECT 1 from FT_O_MKEY where match_key_nme='CCRF_MATCH_21' and col_nme='LAAN_OID');

INSERT INTO ft_o_mkey
(tbl_id, col_nme, match_key_nme, last_chg_tms, last_chg_usr_id)
select 'CCRF', 'EMPL_OID', 'CCRF_MATCH_21', SYSDATE(), 'MHI:CSTM' from DUAL where not exists (SELECT 1 from FT_O_MKEY where match_key_nme='CCRF_MATCH_21' and col_nme='EMPL_OID');


INSERT INTO ft_o_mkey
(tbl_id, col_nme, match_key_nme, last_chg_tms, last_chg_usr_id)
select 'REG1', 'REG1_OID', 'REG1_MATCH_1', SYSDATE(), 'MHI:CSTM' from DUAL where not exists (SELECT 1 from FT_O_MKEY where match_key_nme='REG1_MATCH_1' and col_nme='REG1_OID');

INSERT INTO ft_o_mkey
(tbl_id, col_nme, match_key_nme, last_chg_tms, last_chg_usr_id)
select 'REG1', 'RGM1_OID', 'REG1_MATCH_1', SYSDATE(), 'MHI:CSTM' from DUAL where not exists (SELECT 1 from FT_O_MKEY where match_key_nme='REG1_MATCH_1' and col_nme='RGM1_OID');

INSERT INTO ft_o_mkey
(tbl_id, col_nme, match_key_nme, last_chg_tms, last_chg_usr_id)
select 'REG1', 'LAAT_OID', 'REG1_MATCH_1', SYSDATE(), 'MHI:CSTM' from DUAL where not exists (SELECT 1 from FT_O_MKEY where match_key_nme='REG1_MATCH_1' and col_nme='LAAT_OID');

INSERT INTO ft_o_mkey
(tbl_id, col_nme, match_key_nme, last_chg_tms, last_chg_usr_id)
select 'REG1', 'START_TMS', 'REG1_MATCH_1', SYSDATE(), 'MHI:CSTM' from DUAL where not exists (SELECT 1 from FT_O_MKEY where match_key_nme='REG1_MATCH_1' and col_nme='START_TMS');
