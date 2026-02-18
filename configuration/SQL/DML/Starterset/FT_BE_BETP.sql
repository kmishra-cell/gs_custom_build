INSERT INTO ft_be_betp
(betp_oid, entity_tbl_id, entity_col_nme, entity_typ, start_tms, gso_nme, end_tms, last_chg_tms, last_chg_usr_id, data_stat_typ)
select 'LAGR000004', 'LAGR', 'AGRMNT_TYP', 'FRENCHBF', SYSDATE(), 'ISDAMasterAgreementsAndCSAAgreement', NULL, SYSDATE(), 'MHI:CSTM', NULL from DUAL where not exists (SELECT 1 from ft_be_betp where betp_oid ='LAGR000004' AND entity_typ='FRENCHBF' AND entity_tbl_id='LAGR');

INSERT INTO ft_be_betp
(betp_oid, entity_tbl_id, entity_col_nme, entity_typ, start_tms, gso_nme, end_tms, last_chg_tms, last_chg_usr_id, data_stat_typ)
select 'LAGR000005', 'LAGR', 'AGRMNT_TYP', 'GERMNRAG', SYSDATE(), 'ISDAMasterAgreementsAndCSAAgreement', NULL, SYSDATE(), 'MHI:CSTM', NULL from DUAL where not exists (SELECT 1 from ft_be_betp where betp_oid ='LAGR000005' AND entity_typ='GERMNRAG' AND entity_tbl_id='LAGR');

INSERT INTO ft_be_betp
(betp_oid, entity_tbl_id, entity_col_nme, entity_typ, start_tms, gso_nme, end_tms, last_chg_tms, last_chg_usr_id, data_stat_typ)
select 'LAGR000006', 'LAGR', 'AGRMNT_TYP', 'ISDA1987', SYSDATE(), 'ISDAMasterAgreementsAndCSAAgreement', NULL, SYSDATE(), 'MHI:CSTM', NULL from DUAL where not exists (SELECT 1 from ft_be_betp where betp_oid ='LAGR000006' AND entity_typ='ISDA1987' AND entity_tbl_id='LAGR');

INSERT INTO ft_be_betp
(betp_oid, entity_tbl_id, entity_col_nme, entity_typ, start_tms, gso_nme, end_tms, last_chg_tms, last_chg_usr_id, data_stat_typ)
select 'LAGR000007', 'LAGR', 'AGRMNT_TYP', 'ISDA1992', SYSDATE(), 'ISDAMasterAgreementsAndCSAAgreement', NULL, SYSDATE(), 'MHI:CSTM', NULL from DUAL where not exists (SELECT 1 from ft_be_betp where betp_oid ='LAGR000007' AND entity_typ='ISDA1992' AND entity_tbl_id='LAGR');

INSERT INTO ft_be_betp
(betp_oid, entity_tbl_id, entity_col_nme, entity_typ, start_tms, gso_nme, end_tms, last_chg_tms, last_chg_usr_id, data_stat_typ)
select 'LAGR000008', 'LAGR', 'AGRMNT_TYP', 'ISDA2002', SYSDATE(), 'ISDAMasterAgreementsAndCSAAgreement', NULL, SYSDATE(), 'MHI:CSTM', NULL from DUAL where not exists (SELECT 1 from ft_be_betp where betp_oid ='LAGR000008' AND entity_typ='ISDA2002' AND entity_tbl_id='LAGR');

INSERT INTO ft_be_betp
(betp_oid, entity_tbl_id, entity_col_nme, entity_typ, start_tms, gso_nme, end_tms, last_chg_tms, last_chg_usr_id, data_stat_typ)
select 'LAGR000009', 'LAGR', 'AGRMNT_TYP', 'AAGMT', SYSDATE(), 'ClearingAgreementsAndGuarantees', NULL, SYSDATE(), 'MHI:CSTM', NULL from DUAL where not exists (SELECT 1 from ft_be_betp where betp_oid ='LAGR000009' AND entity_typ='AAGMT' AND entity_tbl_id='LAGR');

INSERT INTO ft_be_betp
(betp_oid, entity_tbl_id, entity_col_nme, entity_typ, start_tms, gso_nme, end_tms, last_chg_tms, last_chg_usr_id, data_stat_typ)
select 'LAGR000010', 'LAGR', 'AGRMNT_TYP', 'CLBRAG', SYSDATE(), 'ClearingAgreementsAndGuarantees', NULL, SYSDATE(), 'MHI:CSTM', NULL from DUAL where not exists (SELECT 1 from ft_be_betp where betp_oid ='LAGR000010' AND entity_typ='CLBRAG' AND entity_tbl_id='LAGR');

INSERT INTO ft_be_betp
(betp_oid, entity_tbl_id, entity_col_nme, entity_typ, start_tms, gso_nme, end_tms, last_chg_tms, last_chg_usr_id, data_stat_typ)
select 'LAGR000011', 'LAGR', 'AGRMNT_TYP', 'CAGMT', SYSDATE(), 'ClearingAgreementsAndGuarantees', NULL, SYSDATE(), 'MHI:CSTM', NULL from DUAL where not exists (SELECT 1 from ft_be_betp where betp_oid ='LAGR000011' AND entity_typ='CAGMT' AND entity_tbl_id='LAGR');

INSERT INTO ft_be_betp
(betp_oid, entity_tbl_id, entity_col_nme, entity_typ, start_tms, gso_nme, end_tms, last_chg_tms, last_chg_usr_id, data_stat_typ)
select 'LAGR000012', 'LAGR', 'AGRMNT_TYP', 'ISDACDEA', SYSDATE(), 'ClearingAgreementsAndGuarantees', NULL, SYSDATE(), 'MHI:CSTM', NULL from DUAL where not exists (SELECT 1 from ft_be_betp where betp_oid ='LAGR000012' AND entity_typ='ISDACDEA' AND entity_tbl_id='LAGR');

INSERT INTO ft_be_betp
(betp_oid, entity_tbl_id, entity_col_nme, entity_typ, start_tms, gso_nme, end_tms, last_chg_tms, last_chg_usr_id, data_stat_typ)
select 'LAGR000013', 'LAGR', 'AGRMNT_TYP', 'ISDECDEA', SYSDATE(), 'ClearingAgreementsAndGuarantees', NULL, SYSDATE(), 'MHI:CSTM', NULL from DUAL where not exists (SELECT 1 from ft_be_betp where betp_oid ='LAGR000013' AND entity_typ='ISDECDEA' AND entity_tbl_id='LAGR');

INSERT INTO ft_be_betp
(betp_oid, entity_tbl_id, entity_col_nme, entity_typ, start_tms, gso_nme, end_tms, last_chg_tms, last_chg_usr_id, data_stat_typ)
select 'LAGR000014', 'LAGR', 'AGRMNT_TYP', 'TERMOB', SYSDATE(), 'ClearingAgreementsAndGuarantees', NULL, SYSDATE(), 'MHI:CSTM', NULL from DUAL where not exists (SELECT 1 from ft_be_betp where betp_oid ='LAGR000014' AND entity_typ='TERMOB' AND entity_tbl_id='LAGR');

INSERT INTO ft_be_betp
(betp_oid, entity_tbl_id, entity_col_nme, entity_typ, start_tms, gso_nme, end_tms, last_chg_tms, last_chg_usr_id, data_stat_typ)
select 'LAGR000015', 'LAGR', 'AGRMNT_TYP', 'NEWDOC', SYSDATE(), 'RepoAndSecLendingAgreements', NULL, SYSDATE(), 'MHI:CSTM', NULL from DUAL where not exists (SELECT 1 from ft_be_betp where betp_oid ='LAGR000015' AND entity_typ='NEWDOC' AND entity_tbl_id='LAGR');

INSERT INTO ft_be_betp
(betp_oid, entity_tbl_id, entity_col_nme, entity_typ, start_tms, gso_nme, end_tms, last_chg_tms, last_chg_usr_id, data_stat_typ)
select 'LAGR000016', 'LAGR', 'AGRMNT_TYP', 'CCPCLEAR', SYSDATE(), 'RepoAndSecLendingAgreements', NULL, SYSDATE(), 'MHI:CSTM', NULL from DUAL where not exists (SELECT 1 from ft_be_betp where betp_oid ='LAGR000016' AND entity_typ='CCPCLEAR' AND entity_tbl_id='LAGR');

INSERT INTO ft_be_betp
(betp_oid, entity_tbl_id, entity_col_nme, entity_typ, start_tms, gso_nme, end_tms, last_chg_tms, last_chg_usr_id, data_stat_typ)
select 'LAGR000017', 'LAGR', 'AGRMNT_TYP', 'EMA2001', SYSDATE(), 'RepoAndSecLendingAgreements', NULL, SYSDATE(), 'MHI:CSTM', NULL from DUAL where not exists (SELECT 1 from ft_be_betp where betp_oid ='LAGR000017' AND entity_typ='EMA2001' AND entity_tbl_id='LAGR');

INSERT INTO ft_be_betp
(betp_oid, entity_tbl_id, entity_col_nme, entity_typ, start_tms, gso_nme, end_tms, last_chg_tms, last_chg_usr_id, data_stat_typ)
select 'LAGR000018', 'LAGR', 'AGRMNT_TYP', 'EMA2004', SYSDATE(), 'RepoAndSecLendingAgreements', NULL, SYSDATE(), 'MHI:CSTM', NULL from DUAL where not exists (SELECT 1 from ft_be_betp where betp_oid ='LAGR000018' AND entity_typ='EMA2004' AND entity_tbl_id='LAGR');

INSERT INTO ft_be_betp
(betp_oid, entity_tbl_id, entity_col_nme, entity_typ, start_tms, gso_nme, end_tms, last_chg_tms, last_chg_usr_id, data_stat_typ)
select 'LAGR000019', 'LAGR', 'AGRMNT_TYP', 'GENSAKI', SYSDATE(), 'RepoAndSecLendingAgreements', NULL, SYSDATE(), 'MHI:CSTM', NULL from DUAL where not exists (SELECT 1 from ft_be_betp where betp_oid ='LAGR000019' AND entity_typ='GENSAKI' AND entity_tbl_id='LAGR');

INSERT INTO ft_be_betp
(betp_oid, entity_tbl_id, entity_col_nme, entity_typ, start_tms, gso_nme, end_tms, last_chg_tms, last_chg_usr_id, data_stat_typ)
select 'LAGR000020', 'LAGR', 'AGRMNT_TYP', 'MAFT', SYSDATE(), 'RepoAndSecLendingAgreements', NULL, SYSDATE(), 'MHI:CSTM', NULL from DUAL where not exists (SELECT 1 from ft_be_betp where betp_oid ='LAGR000020' AND entity_typ='MAFT' AND entity_tbl_id='LAGR');

INSERT INTO ft_be_betp
(betp_oid, entity_tbl_id, entity_col_nme, entity_typ, start_tms, gso_nme, end_tms, last_chg_tms, last_chg_usr_id, data_stat_typ)
select 'LAGR000021', 'LAGR', 'AGRMNT_TYP', 'MRA', SYSDATE(), 'RepoAndSecLendingAgreements', NULL, SYSDATE(), 'MHI:CSTM', NULL from DUAL where not exists (SELECT 1 from ft_be_betp where betp_oid ='LAGR000021' AND entity_typ='MRA' AND entity_tbl_id='LAGR');

INSERT INTO ft_be_betp
(betp_oid, entity_tbl_id, entity_col_nme, entity_typ, start_tms, gso_nme, end_tms, last_chg_tms, last_chg_usr_id, data_stat_typ)
select 'LAGR000022', 'LAGR', 'AGRMNT_TYP', 'NSBAREP', SYSDATE(), 'RepoAndSecLendingAgreements', NULL, SYSDATE(), 'MHI:CSTM', NULL from DUAL where not exists (SELECT 1 from ft_be_betp where betp_oid ='LAGR000022' AND entity_typ='NSBAREP' AND entity_tbl_id='LAGR');

INSERT INTO ft_be_betp
(betp_oid, entity_tbl_id, entity_col_nme, entity_typ, start_tms, gso_nme, end_tms, last_chg_tms, last_chg_usr_id, data_stat_typ)
select 'LAGR000023', 'LAGR', 'AGRMNT_TYP', 'PSA1987', SYSDATE(), 'RepoAndSecLendingAgreements', NULL, SYSDATE(), 'MHI:CSTM', NULL from DUAL where not exists (SELECT 1 from ft_be_betp where betp_oid ='LAGR000023' AND entity_typ='PSA1987' AND entity_tbl_id='LAGR');

INSERT INTO ft_be_betp
(betp_oid, entity_tbl_id, entity_col_nme, entity_typ, start_tms, gso_nme, end_tms, last_chg_tms, last_chg_usr_id, data_stat_typ)
select 'LAGR000024', 'LAGR', 'AGRMNT_TYP', 'PSA1996', SYSDATE(), 'RepoAndSecLendingAgreements', NULL, SYSDATE(), 'MHI:CSTM', NULL from DUAL where not exists (SELECT 1 from ft_be_betp where betp_oid ='LAGR000024' AND entity_typ='PSA1996' AND entity_tbl_id='LAGR');

INSERT INTO ft_be_betp
(betp_oid, entity_tbl_id, entity_col_nme, entity_typ, start_tms, gso_nme, end_tms, last_chg_tms, last_chg_usr_id, data_stat_typ)
select 'LAGR000025', 'LAGR', 'AGRMNT_TYP', 'PSAISMA1992', SYSDATE(), 'RepoAndSecLendingAgreements', NULL, SYSDATE(), 'MHI:CSTM', NULL from DUAL where not exists (SELECT 1 from ft_be_betp where betp_oid ='LAGR000025' AND entity_typ='PSAISMA1992' AND entity_tbl_id='LAGR');

INSERT INTO ft_be_betp
(betp_oid, entity_tbl_id, entity_col_nme, entity_typ, start_tms, gso_nme, end_tms, last_chg_tms, last_chg_usr_id, data_stat_typ)
select 'LAGR000026', 'LAGR', 'AGRMNT_TYP', 'PSAISMA1995', SYSDATE(), 'RepoAndSecLendingAgreements', NULL, SYSDATE(), 'MHI:CSTM', NULL from DUAL where not exists (SELECT 1 from ft_be_betp where betp_oid ='LAGR000026' AND entity_typ='PSAISMA1995' AND entity_tbl_id='LAGR');

INSERT INTO ft_be_betp
(betp_oid, entity_tbl_id, entity_col_nme, entity_typ, start_tms, gso_nme, end_tms, last_chg_tms, last_chg_usr_id, data_stat_typ)
select 'LAGR000027', 'LAGR', 'AGRMNT_TYP', 'RAGA', SYSDATE(), 'RepoAndSecLendingAgreements', NULL, SYSDATE(), 'MHI:CSTM', NULL from DUAL where not exists (SELECT 1 from ft_be_betp where betp_oid ='LAGR000027' AND entity_typ='RAGA' AND entity_tbl_id='LAGR');

INSERT INTO ft_be_betp
(betp_oid, entity_tbl_id, entity_col_nme, entity_typ, start_tms, gso_nme, end_tms, last_chg_tms, last_chg_usr_id, data_stat_typ)
select 'LAGR000028', 'LAGR', 'AGRMNT_TYP', 'AFTB', SYSDATE(), 'RepoAndSecLendingAgreements', NULL, SYSDATE(), 'MHI:CSTM', NULL from DUAL where not exists (SELECT 1 from ft_be_betp where betp_oid ='LAGR000028' AND entity_typ='AFTB' AND entity_tbl_id='LAGR');

INSERT INTO ft_be_betp
(betp_oid, entity_tbl_id, entity_col_nme, entity_typ, start_tms, gso_nme, end_tms, last_chg_tms, last_chg_usr_id, data_stat_typ)
select 'LAGR000029', 'LAGR', 'AGRMNT_TYP', 'TBMAISMA2000', SYSDATE(), 'RepoAndSecLendingAgreements', NULL, SYSDATE(), 'MHI:CSTM', NULL from DUAL where not exists (SELECT 1 from ft_be_betp where betp_oid ='LAGR000029' AND entity_typ='TBMAISMA2000' AND entity_tbl_id='LAGR');

INSERT INTO ft_be_betp
(betp_oid, entity_tbl_id, entity_col_nme, entity_typ, start_tms, gso_nme, end_tms, last_chg_tms, last_chg_usr_id, data_stat_typ)
select 'LAGR000030', 'LAGR', 'AGRMNT_TYP', 'TBMAISMA2011', SYSDATE(), 'RepoAndSecLendingAgreements', NULL, SYSDATE(), 'MHI:CSTM', NULL from DUAL where not exists (SELECT 1 from ft_be_betp where betp_oid ='LAGR000030' AND entity_typ='TBMAISMA2011' AND entity_tbl_id='LAGR');

INSERT INTO ft_be_betp
(betp_oid, entity_tbl_id, entity_col_nme, entity_typ, start_tms, gso_nme, end_tms, last_chg_tms, last_chg_usr_id, data_stat_typ)
select 'LAGR000031', 'LAGR', 'AGRMNT_TYP', 'TFA', SYSDATE(), 'RepoAndSecLendingAgreements', NULL, SYSDATE(), 'MHI:CSTM', NULL from DUAL where not exists (SELECT 1 from ft_be_betp where betp_oid ='LAGR000031' AND entity_typ='TFA' AND entity_tbl_id='LAGR');

INSERT INTO ft_be_betp
(betp_oid, entity_tbl_id, entity_col_nme, entity_typ, start_tms, gso_nme, end_tms, last_chg_tms, last_chg_usr_id, data_stat_typ)
select 'LAGR000032', 'LAGR', 'AGRMNT_TYP', 'GMSLA2000', SYSDATE(), 'RepoAndSecLendingAgreements', NULL, SYSDATE(), 'MHI:CSTM', NULL from DUAL where not exists (SELECT 1 from ft_be_betp where betp_oid ='LAGR000032' AND entity_typ='GMSLA2000' AND entity_tbl_id='LAGR');

INSERT INTO ft_be_betp
(betp_oid, entity_tbl_id, entity_col_nme, entity_typ, start_tms, gso_nme, end_tms, last_chg_tms, last_chg_usr_id, data_stat_typ)
select 'LAGR000033', 'LAGR', 'AGRMNT_TYP', 'GMSLA2010', SYSDATE(), 'RepoAndSecLendingAgreements', NULL, SYSDATE(), 'MHI:CSTM', NULL from DUAL where not exists (SELECT 1 from ft_be_betp where betp_oid ='LAGR000033' AND entity_typ='GMSLA2010' AND entity_tbl_id='LAGR');

INSERT INTO ft_be_betp
(betp_oid, entity_tbl_id, entity_col_nme, entity_typ, start_tms, gso_nme, end_tms, last_chg_tms, last_chg_usr_id, data_stat_typ)
select 'LAGR000034', 'LAGR', 'AGRMNT_TYP', 'MEFISLA1996', SYSDATE(), 'RepoAndSecLendingAgreements', NULL, SYSDATE(), 'MHI:CSTM', NULL from DUAL where not exists (SELECT 1 from ft_be_betp where betp_oid ='LAGR000034' AND entity_typ='MEFISLA1996' AND entity_tbl_id='LAGR');

INSERT INTO ft_be_betp
(betp_oid, entity_tbl_id, entity_col_nme, entity_typ, start_tms, gso_nme, end_tms, last_chg_tms, last_chg_usr_id, data_stat_typ)
select 'LAGR000035', 'LAGR', 'AGRMNT_TYP', 'MGSLA1996', SYSDATE(), 'RepoAndSecLendingAgreements', NULL, SYSDATE(), 'MHI:CSTM', NULL from DUAL where not exists (SELECT 1 from ft_be_betp where betp_oid ='LAGR000035' AND entity_typ='MGSLA1996' AND entity_tbl_id='LAGR');

INSERT INTO ft_be_betp
(betp_oid, entity_tbl_id, entity_col_nme, entity_typ, start_tms, gso_nme, end_tms, last_chg_tms, last_chg_usr_id, data_stat_typ)
select 'LAGR000036', 'LAGR', 'AGRMNT_TYP', 'NSBASEC', SYSDATE(), 'RepoAndSecLendingAgreements', NULL, SYSDATE(), 'MHI:CSTM', NULL from DUAL where not exists (SELECT 1 from ft_be_betp where betp_oid ='LAGR000036' AND entity_typ='NSBASEC' AND entity_tbl_id='LAGR');

INSERT INTO ft_be_betp
(betp_oid, entity_tbl_id, entity_col_nme, entity_typ, start_tms, gso_nme, end_tms, last_chg_tms, last_chg_usr_id, data_stat_typ)
select 'LAGR000037', 'LAGR', 'AGRMNT_TYP', 'OSLA1995', SYSDATE(), 'RepoAndSecLendingAgreements', NULL, SYSDATE(), 'MHI:CSTM', NULL from DUAL where not exists (SELECT 1 from ft_be_betp where betp_oid ='LAGR000037' AND entity_typ='OSLA1995' AND entity_tbl_id='LAGR');
