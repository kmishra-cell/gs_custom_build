INSERT INTO ft_o_mshr
(mshr_oid, screen_hier_nme, screen_hier_typ, screen_hier_actions_txt, screen_hier_desc, last_chg_usr_id, last_chg_tms, data_stat_typ, config_val_clob, leaf_in_right_pane_ind, additional_sql, screen_hier_actions_clob)
select 'S4tAm>zyW1', 'FinancialInstitution-ChildtoParent', 'NESTEDGRID', NULL, '', 'user1', sysdate(), NULL, '{}', 'N', NULL, NULL from dual 
where not exists (SELECT 1 from ft_o_mshr where mshr_oid = 'S4tAm>zyW1' and screen_hier_nme = 'FinancialInstitution-ChildtoParent');

INSERT INTO ft_o_mshr
(mshr_oid, screen_hier_nme, screen_hier_typ, screen_hier_actions_txt, screen_hier_desc, last_chg_usr_id, last_chg_tms, data_stat_typ, config_val_clob, leaf_in_right_pane_ind, additional_sql, screen_hier_actions_clob)
select 'S4t3m>zyW1', 'FinancialInstitution-ParenttoChild', 'NESTEDGRID', NULL, '', 'user1', sysdate(), NULL, '{}', 'N', NULL, NULL  from dual 
where not exists (SELECT 1 from ft_o_mshr where mshr_oid = 'S4t3m>zyW1' and screen_hier_nme = 'FinancialInstitution-ParenttoChild');



INSERT INTO ft_o_mshl
(mshl_oid, mshr_oid, prnt_mshl_oid, screen_hier_level_num, rld_data_grp_nme, rld_bus_entity_fld_nme, filter_val_txt, recursive_level_ind, entity_display_nme, screen_hier_level_desc, last_chg_usr_id, last_chg_tms, data_stat_typ, bus_entity_data_nme, screen_hier_level_typ, config_val_clob, inverse_level_ind, additional_sql, uist_oid, rld_data_grp_path_txt, rld_busent_fld_path_txt)
select 'S4t9m>zyW1', 'S4tAm>zyW1', NULL, NULL, NULL, NULL, NULL, 'Y', 'obsolete', NULL, 'user1', sysdate(), NULL, 'FinancialInstitution', NULL, '{"hideHeaders":false,"filterable":true,"showCount":true,"selectAll":false,"childExtractionQuery":"select prnt_inst_mnem  from ft_t_ffrl where rel_typ in (\u0027MHIPARNT\u0027, \u0027PARNTCOF\u0027) and inst_mnem !\u003d prnt_inst_mnem and inst_mnem  \u003d ? and end_tms is null","nextLevelChildExtractionQuery":"","actions":["OPEN_DETAILS"]}', 'N', '<sql>inst_mnem in (select inst_mnem from ft_t_ffrl  WHERE REL_TYP  in (''MHIPARNT'', ''PARNTCOF'')       AND PRNT_INST_MNEM != INST_MNEM AND (END_TMS IS NULL OR END_TMS > current_timestamp(0)))</sql>
 ', NULL, NULL, NULL from dual
where not exists (SELECT 1 from ft_o_mshl where mshl_oid = 'S4t9m>zyW1');
 
 
INSERT INTO ft_o_mshl
(mshl_oid, mshr_oid, prnt_mshl_oid, screen_hier_level_num, rld_data_grp_nme, rld_bus_entity_fld_nme, filter_val_txt, recursive_level_ind, entity_display_nme, screen_hier_level_desc, last_chg_usr_id, last_chg_tms, data_stat_typ, bus_entity_data_nme, screen_hier_level_typ, config_val_clob, inverse_level_ind, additional_sql, uist_oid, rld_data_grp_path_txt, rld_busent_fld_path_txt)
select 'S4t2m>zyW1', 'S4t3m>zyW1', NULL, NULL, NULL, NULL, NULL, 'Y', 'obsolete', NULL, 'user1', sysdate(), NULL, 'FinancialInstitution', NULL, '{"hideHeaders":false,"filterable":true,"showCount":true,"selectAll":false,"childExtractionQuery":"select inst_mnem  from ft_t_ffrl where rel_typ in (\u0027MHIPARNT\u0027, \u0027PARNTCOF\u0027) and inst_mnem !\u003d prnt_inst_mnem and prnt_inst_mnem  \u003d ? and end_tms is null","nextLevelChildExtractionQuery":"","actions":["OPEN_DETAILS"]}', 'N', '<sql>inst_mnem in (select inst_mnem from ft_t_ffrl  WHERE REL_TYP  in (''MHIPARNT'', ''PARNTCOF'')       AND PRNT_INST_MNEM = INST_MNEM AND (END_TMS IS NULL OR END_TMS > current_timestamp(0)))</sql>
 ', NULL, NULL, NULL from dual
where not exists (SELECT 1 from ft_o_mshl where mshl_oid = 'S4t2m>zyW1');







INSERT INTO ft_o_mshf
(mshf_oid, mshl_oid, bus_entity_fld_nme, fld_sq_num, prt_desc, last_chg_usr_id, last_chg_tms, data_stat_typ, filterable_ind, sortable_ind, bus_enttity_fld_path_txt, hidden_ind)
select 'S4t4m>zyW1', 'S4t9m>zyW1', 'obsolete', 0, NULL, 'user1', sysdate(), NULL, NULL, NULL, 'FinancialInstitution.FinancialInstitutionDetails.FinancialInstitutionName', NULL from dual
where not exists (SELECT 1 from ft_o_mshf where mshf_oid = 'S4t4m>zyW1' and bus_enttity_fld_path_txt = 'FinancialInstitution.FinancialInstitutionDetails.FinancialInstitutionName');


INSERT INTO ft_o_mshf
(mshf_oid, mshl_oid, bus_entity_fld_nme, fld_sq_num, prt_desc, last_chg_usr_id, last_chg_tms, data_stat_typ, filterable_ind, sortable_ind, bus_enttity_fld_path_txt, hidden_ind)
select 'S4t5m>zyW1', 'S4t9m>zyW1', 'obsolete', 1, NULL, 'user1', sysdate(), NULL, NULL, NULL, 'FinancialInstitution.FinancialInstitutionDetails.InstitutionDescription', NULL from dual
where not exists (SELECT 1 from ft_o_mshf where mshf_oid = 'S4t5m>zyW1' and bus_enttity_fld_path_txt = 'FinancialInstitution.FinancialInstitutionDetails.InstitutionDescription');


INSERT INTO ft_o_mshf
(mshf_oid, mshl_oid, bus_entity_fld_nme, fld_sq_num, prt_desc, last_chg_usr_id, last_chg_tms, data_stat_typ, filterable_ind, sortable_ind, bus_enttity_fld_path_txt, hidden_ind)
select 'S4t6m>zyW1', 'S4t9m>zyW1', 'obsolete', 2, NULL, 'user1', sysdate(), NULL, NULL, NULL, 'FinancialInstitution.FinancialInstitutionDetails.InstitutionType', NULL from dual
where not exists (SELECT 1 from ft_o_mshf where mshf_oid = 'S4t6m>zyW1' and bus_enttity_fld_path_txt = 'FinancialInstitution.FinancialInstitutionDetails.InstitutionType'); 


INSERT INTO ft_o_mshf
(mshf_oid, mshl_oid, bus_entity_fld_nme, fld_sq_num, prt_desc, last_chg_usr_id, last_chg_tms, data_stat_typ, filterable_ind, sortable_ind, bus_enttity_fld_path_txt, hidden_ind)
select 'S4t7m>zyW1', 'S4t9m>zyW1', 'obsolete', 3, NULL, 'user1', sysdate(), NULL, NULL, NULL, 'FinancialInstitution.FinancialInstitutionDetails.PreferredIdentifierName', NULL from DUAL
where not exists (SELECT 1 from ft_o_mshf where mshf_oid = 'S4t7m>zyW1' and bus_enttity_fld_path_txt = 'FinancialInstitution.FinancialInstitutionDetails.PreferredIdentifierName'); 


INSERT INTO ft_o_mshf
(mshf_oid, mshl_oid, bus_entity_fld_nme, fld_sq_num, prt_desc, last_chg_usr_id, last_chg_tms, data_stat_typ, filterable_ind, sortable_ind, bus_enttity_fld_path_txt, hidden_ind)
select 'S4t8m>zyW1', 'S4t9m>zyW1', 'obsolete', 4, NULL, 'user1', sysdate(), NULL, NULL, NULL, 'FinancialInstitution.FinancialInstitutionDetails.PreferredIdentifierValue', NULL from dual 
where not exists (SELECT 1 from ft_o_mshf where mshf_oid = 'S4t8m>zyW1' and bus_enttity_fld_path_txt = 'FinancialInstitution.FinancialInstitutionDetails.PreferredIdentifierValue'); 


INSERT INTO ft_o_mshf
(mshf_oid, mshl_oid, bus_entity_fld_nme, fld_sq_num, prt_desc, last_chg_usr_id, last_chg_tms, data_stat_typ, filterable_ind, sortable_ind, bus_enttity_fld_path_txt, hidden_ind)
select 'S4tIm>zyW1', 'S4t2m>zyW1', 'obsolete', 1, NULL, 'user1', sysdate(), NULL, NULL, NULL, 'FinancialInstitution.FinancialInstitutionDetails.InstitutionType', NULL from dual
where not exists (SELECT 1 from ft_o_mshf where mshf_oid = 'S4tIm>zyW1' and bus_enttity_fld_path_txt = 'FinancialInstitution.FinancialInstitutionDetails.InstitutionType'); 



INSERT INTO ft_o_mshf
(mshf_oid, mshl_oid, bus_entity_fld_nme, fld_sq_num, prt_desc, last_chg_usr_id, last_chg_tms, data_stat_typ, filterable_ind, sortable_ind, bus_enttity_fld_path_txt, hidden_ind)
select 'S4tLm>zyW1', 'S4t2m>zyW1', 'obsolete', 4, NULL, 'user1', sysdate(), NULL, NULL, NULL, 'FinancialInstitution.FinancialInstitutionDetails.InstitutionDescription', NULL from dual 
where not exists (SELECT 1 from ft_o_mshf where mshf_oid = 'S4tLm>zyW1' and bus_enttity_fld_path_txt = 'FinancialInstitution.FinancialInstitutionDetails.InstitutionDescription'); 


INSERT INTO ft_o_mshf
(mshf_oid, mshl_oid, bus_entity_fld_nme, fld_sq_num, prt_desc, last_chg_usr_id, last_chg_tms, data_stat_typ, filterable_ind, sortable_ind, bus_enttity_fld_path_txt, hidden_ind)
select 'S4tNm>zyW1', 'S4t2m>zyW1', 'obsolete', 6, NULL, 'user1', sysdate(), NULL, NULL, NULL, 'FinancialInstitution.LEIDetails.LEI', NULL from dual 
where not exists (SELECT 1 from ft_o_mshf where mshf_oid = 'S4tNm>zyW1' and bus_enttity_fld_path_txt = 'FinancialInstitution.LEIDetails.LEI'); 



INSERT INTO ft_o_mshf
(mshf_oid, mshl_oid, bus_entity_fld_nme, fld_sq_num, prt_desc, last_chg_usr_id, last_chg_tms, data_stat_typ, filterable_ind, sortable_ind, bus_enttity_fld_path_txt, hidden_ind)
select 'S4tKm>zyW1', 'S4t2m>zyW1', 'obsolete', 3, NULL, 'user1', sysdate(), NULL, NULL, NULL, 'FinancialInstitution.FinancialInstitutionDetails.PreferredIdentifierValue', NULL from dual 
where not exists (SELECT 1 from ft_o_mshf where mshf_oid = 'S4tKm>zyW1' and bus_enttity_fld_path_txt = 'FinancialInstitution.FinancialInstitutionDetails.PreferredIdentifierValue'); 


INSERT INTO ft_o_mshf
(mshf_oid, mshl_oid, bus_entity_fld_nme, fld_sq_num, prt_desc, last_chg_usr_id, last_chg_tms, data_stat_typ, filterable_ind, sortable_ind, bus_enttity_fld_path_txt, hidden_ind)
select 'S4tMm>zyW1', 'S4t2m>zyW1', 'obsolete', 5, NULL, 'user1', sysdate(), NULL, NULL, NULL, 'FinancialInstitution.FinancialInstitutionDetails.ParentCompanyOf.FinancialInstitution.FinancialInstitutionIdentifiers.BBCompanyID', NULL from dual 
where not exists (SELECT 1 from ft_o_mshf where mshf_oid = 'S4tMm>zyW1' and bus_enttity_fld_path_txt = 'FinancialInstitution.FinancialInstitutionDetails.ParentCompanyOf.FinancialInstitution.FinancialInstitutionIdentifiers.BBCompanyID'); 


INSERT INTO ft_o_mshf
(mshf_oid, mshl_oid, bus_entity_fld_nme, fld_sq_num, prt_desc, last_chg_usr_id, last_chg_tms, data_stat_typ, filterable_ind, sortable_ind, bus_enttity_fld_path_txt, hidden_ind)
select 'S4tHm>zyW1', 'S4t2m>zyW1', 'obsolete', 0, NULL, 'user1', sysdate(), NULL, NULL, NULL, 'FinancialInstitution.FinancialInstitutionDetails.FinancialInstitutionName', NULL from dual
where not exists (SELECT 1 from ft_o_mshf where mshf_oid = 'S4tHm>zyW1' and bus_enttity_fld_path_txt = 'FinancialInstitution.FinancialInstitutionDetails.FinancialInstitutionName'); 


INSERT INTO ft_o_mshf
(mshf_oid, mshl_oid, bus_entity_fld_nme, fld_sq_num, prt_desc, last_chg_usr_id, last_chg_tms, data_stat_typ, filterable_ind, sortable_ind, bus_enttity_fld_path_txt, hidden_ind)
select 'S4tJm>zyW1', 'S4t2m>zyW1', 'obsolete', 2, NULL, 'user1', sysdate(), NULL, NULL, NULL, 'FinancialInstitution.FinancialInstitutionDetails.PreferredIdentifierName', NULL from dual
where not exists (SELECT 1 from ft_o_mshf where mshf_oid = 'S4tJm>zyW1' and bus_enttity_fld_path_txt = 'FinancialInstitution.FinancialInstitutionDetails.PreferredIdentifierName');  





commit; 