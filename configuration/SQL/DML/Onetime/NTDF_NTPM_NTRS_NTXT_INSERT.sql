Insert into FT_T_NTDF (APPL_ID, PART_ID, NOTFCN_ID, DFLT_SEVERITY_CDE, LAST_CHG_TMS, LAST_CHG_USR_ID, RSOLUT_TYP, EXCP_TYP)
 Select 'STRDATA', 'JAVARULE', 50010, 50, current_timestamp, 'MHI:CSTM', 'INVESTGT', 'FINSALREADYLNKED' 
 from Dual where not exists (Select 1 from FT_T_NTDF where notfcn_id = 50010 and appl_id = 'STRDATA' and part_id = 'JAVARULE');
 
Insert into FT_T_NTPM (APPL_ID, PART_ID, NOTFCN_ID, PARM_NME, LAST_CHG_TMS, LAST_CHG_USR_ID, PARM_DESC)
 Select 'STRDATA', 'JAVARULE',  50010, 'FINSISSR', Current_timestamp, 'MHI:CSTM', 'FINSISSR' 
 from Dual where not exists (Select 1 from FT_T_NTPM where notfcn_id = 50010 and appl_id = 'STRDATA' and part_id = 'JAVARULE' and parm_nme = 'FINSISSR');
 
Insert into FT_T_NTRS (APPL_ID, PART_ID, NOTFCN_ID, USR_CAT_TYP, NLS_CDE, LAST_CHG_TMS, LAST_CHG_USR_ID, SUGGEST_LONG_TXT, SUGGEST_EXTND_TXT)
 Select 'STRDATA', 'JAVARULE',  50010, 'DEFAULT', 'ENGLISH', current_timestamp, 'MHI:CSTM', 'Fins already linked with other Issuer', 
 'Fins already linked with other Issuer' 
 from Dual where not exists (Select 1 from FT_T_NTRS where notfcn_id = 50010 and appl_id = 'STRDATA' and part_id = 'JAVARULE');

Insert into FT_T_NTXT (APPL_ID, PART_ID, NOTFCN_ID, USR_CAT_TYP, NLS_CDE, LAST_CHG_TMS, LAST_CHG_USR_ID, NOTFCN_SHORT_TXT, NOTFCN_LONG_TXT, NOTFCN_EXTND_TXT)
 SELECT 'STRDATA', 'JAVARULE',  50010, 'DEFAULT', 'ENGLISH', CURRENT_TIMESTAMP, 'MHI:CSTM', 'Fins already linked with other Issuer', 
 'Fins already linked with other Issuer', 'Fins already linked with other Issuer' 
 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM FT_T_NTXT WHERE NOTFCN_ID = 50010 AND APPL_ID = 'STRDATA' AND PART_ID = 'JAVARULE');
