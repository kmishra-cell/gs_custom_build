UPDATE ft_t_begc
SET config_val_txt='{"entityName":"FinancialInstitution","entityType":null,"disableMultiEdit":false,"srchActions":["IMPORT_IN_EXCEL","SELECTALL_ENTITIES","CONFIGURE_TEMPLATE","SAVE_FILTER","SAVE_SEARCH_STATE","EXPORT","EXTRACTION_CRITERIA","CHANGE_DENSITY","NEW_ENTITY","EDIT_IN_EXCEL","OPEN_DETAILS"],"editActions":["ADD_TO_FAVOURITE","HIDE_EMPTY_FIELDS","RELOAD_ENTITY","LOCK_ENTITY","PRINT","SAVE_CHANGES","DELETE_ENTITY","CREATE_CLONE","SAVE_AS_DRAFT","EXPORT"],"tableActions":[],"deleteActions":[],"setupEntities":[],"searchColorField":[],"commentsActions":[],"actionConfiguration":{},"comments":{},"defaultExtractionCriteria":"Current Active","autoRefreshInterval":null}', last_chg_tms= sysdate() ,last_chg_usr_id='MHI:CSTM'
WHERE config_typ='FinancialInstitution' AND config_grp_nme='ACTIONS' ;


commit;