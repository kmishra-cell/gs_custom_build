INSERT INTO ft_t_begc (begc_oid, config_typ, config_val_txt, config_grp_nme, last_chg_tms, last_chg_usr_id) select new_oid(), 'Issuer', '{"entityName":"Issuer","entityType":"Issuer","disableMultiEdit":false,"srchActions":["EXPORT","CONFIGURE_TEMPLATE","EXTRACTION_CRITERIA","SAVE_FILTER","CHANGE_DENSITY","SELECTALL_ENTITIES","SAVE_SEARCH_STATE","OPEN_DETAILS"],"editActions":["SAVE_CHANGES","EXPORT","RELOAD_ENTITY","PRINT","HIDE_EMPTY_FIELDS"],"tableActions":[],"deleteActions":[],"setupEntities":[],"searchColorField":[],"commentsActions":[],"actionConfiguration":{},"comments":{},"autoRefreshInterval":null}', 'ACTIONS', sysdate(), 'MHI:CSTM' from dual where not exists (select 1 from ft_t_begc where config_typ='Issuer' and config_grp_nme='ACTIONS');


INSERT INTO ft_t_begc (begc_oid, config_typ, config_val_txt, config_grp_nme, last_chg_tms, last_chg_usr_id) select new_oid(), 'FinancialInstitution', '{"entityName":"FinancialInstitution","entityType":null,"disableMultiEdit":false,"srchActions":["IMPORT_IN_EXCEL","SELECTALL_ENTITIES","CONFIGURE_TEMPLATE","SAVE_FILTER","SAVE_SEARCH_STATE","EXPORT","EXTRACTION_CRITERIA","CHANGE_DENSITY","NEW_ENTITY","EDIT_IN_EXCEL","OPEN_DETAILS"],"editActions":["ADD_TO_FAVOURITE","HIDE_EMPTY_FIELDS","RELOAD_ENTITY","LOCK_ENTITY","PRINT","SAVE_CHANGES","DELETE_ENTITY","CREATE_CLONE","SAVE_AS_DRAFT","EXPORT"],"tableActions":[],"deleteActions":[],"setupEntities":[],"searchColorField":[],"commentsActions":[],"actionConfiguration":{},"comments":{},"autoRefreshInterval":null}', 'ACTIONS', sysdate(), 'MHI:CSTM' from dual where not exists (select 1 from ft_t_begc where config_typ='FinancialInstitution' and config_grp_nme='ACTIONS');




INSERT INTO ft_t_begc (begc_oid, config_typ, config_val_txt, config_grp_nme, last_chg_tms, last_chg_usr_id) SELECT new_oid(),'MiscOperations',
'{"entityName":"MiscOperations","entityType":"MiscOperations","disableMultiEdit":false,"srchActions":[],"editActions":["RELOAD_ENTITY"],"tableActions":[],"deleteActions":[],"setupEntities":[],"searchColorField":[],"commentsActions":[],"actionConfiguration":{},"comments":{},"autoRefreshInterval":null}','ACTIONS', sysdate(), 'MHI:CSTM' FROM dual WHERE NOT EXISTS (SELECT 1 FROM ft_t_begc WHERE config_typ = 'MiscOperations' 
AND config_grp_nme = 'ACTIONS');


commit;



