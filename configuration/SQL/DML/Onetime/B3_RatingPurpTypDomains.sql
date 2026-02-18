MERGE INTO ft_t_idmv s
USING (SELECT 'IDMVB30001' intrnl_dmn_val_id FROM dual) e  
ON (e.intrnl_dmn_val_id=s.intrnl_dmn_val_id) 
WHEN matched and fld_data_cl_id IS NOT NULL OR fld_id IS NULL OR fld_id!='00100478' OR mod_rst_ind!='N' OR intrnl_dmn_val_txt!='EBA' OR intrnl_dmn_val_nme!='EBA' OR intrnl_dmn_desc IS NULL OR intrnl_dmn_desc!='EBA' OR data_src_id IS NULL OR data_src_id!='MHI' OR tbl_id IS NOT NULL OR col_nme IS NOT NULL OR qual_val_txt IS NOT NULL OR dmn_val_purp_typ IS NOT NULL OR data_stat_typ IS NOT NULL THEN 
UPDATE SET fld_data_cl_id=NULL,fld_id='00100478', last_chg_tms=SYSDATE(), last_chg_usr_id='MHI:CSTM', mod_rst_ind='N', intrnl_dmn_val_txt='EBA', intrnl_dmn_val_nme='EBA', intrnl_dmn_desc='EBA',  data_src_id='MHI', tbl_id=NULL, col_nme=NULL, qual_val_txt=NULL, dmn_val_purp_typ=NULL, data_stat_typ=NULL
WHEN NOT MATCHED THEN 
INSERT (intrnl_dmn_val_id, fld_data_cl_id, fld_id, last_chg_tms, last_chg_usr_id, mod_rst_ind, intrnl_dmn_val_txt, intrnl_dmn_val_nme, intrnl_dmn_desc, data_src_id, tbl_id, col_nme, qual_val_txt, dmn_val_purp_typ, data_stat_typ)
  VALUES ('IDMVB30001','','00100478',SYSDATE(),'MHI:CSTM','N','EBA','EBA','EBA','MHI','' ,'' ,'' ,'' ,'');

MERGE INTO ft_t_idmv s
USING (SELECT 'IDMVB30002' intrnl_dmn_val_id FROM dual) e  
ON (e.intrnl_dmn_val_id=s.intrnl_dmn_val_id) 
WHEN matched and fld_data_cl_id IS NOT NULL OR fld_id IS NULL OR fld_id!='00100478' OR mod_rst_ind!='N' OR intrnl_dmn_val_txt!='PRA' OR intrnl_dmn_val_nme!='PRA' OR intrnl_dmn_desc IS NULL OR intrnl_dmn_desc!='PRA' OR data_src_id IS NULL OR data_src_id!='MHI' OR tbl_id IS NOT NULL OR col_nme IS NOT NULL OR qual_val_txt IS NOT NULL OR dmn_val_purp_typ IS NOT NULL OR data_stat_typ IS NOT NULL THEN 
UPDATE SET fld_data_cl_id=NULL,fld_id='00100478', last_chg_tms=SYSDATE(), last_chg_usr_id='MHI:CSTM', mod_rst_ind='N', intrnl_dmn_val_txt='PRA', intrnl_dmn_val_nme='PRA', intrnl_dmn_desc='PRA', data_src_id='MHI', tbl_id=NULL, col_nme=NULL, qual_val_txt=NULL, dmn_val_purp_typ=NULL, data_stat_typ=NULL
WHEN NOT MATCHED THEN 
INSERT (intrnl_dmn_val_id, fld_data_cl_id, fld_id, last_chg_tms, last_chg_usr_id, mod_rst_ind, intrnl_dmn_val_txt, intrnl_dmn_val_nme, intrnl_dmn_desc, data_src_id, tbl_id, col_nme, qual_val_txt, dmn_val_purp_typ, data_stat_typ)
  VALUES ('IDMVB30002','','00100478',SYSDATE(),'MHI:CSTM','N','PRA','PRA','PRA','MHI','' ,'' ,'' ,'' ,'');

