update ft_t_idmv set data_stat_typ = 'ACTIVE' , last_chg_tms = sysdate() where 
fld_id = '00162148' and tbl_id = 'FIID' and  intrnl_dmn_val_txt = 'ACTIVE';

update ft_t_idmv set data_stat_typ = 'ACTIVE' , last_chg_tms = sysdate() where 
fld_id = '00162148' and tbl_id = 'FIID' and  intrnl_dmn_val_txt = 'DELETED';

update ft_t_idmv set data_stat_typ = 'ACTIVE' , last_chg_tms = sysdate() where 
fld_id = '00162148' and tbl_id = 'FIID' and  intrnl_dmn_val_txt = 'DISABLED';

update ft_t_idmv set data_stat_typ = 'ACTIVE' , last_chg_tms = sysdate() where 
fld_id = '00162148' and tbl_id = 'FIID' and  intrnl_dmn_val_txt = 'OTHER';

update ft_t_idmv set data_stat_typ = 'ACTIVE' , last_chg_tms = sysdate() where 
fld_id = '00162148' and tbl_id = 'FIID' and  intrnl_dmn_val_txt = 'REACTIVATED';

update ft_t_idmv set data_stat_typ = 'ACTIVE' , last_chg_tms = sysdate() where 
fld_id = '00162148' and tbl_id = 'FIID' and  intrnl_dmn_val_txt = 'RESERVED';

update ft_t_idmv set data_stat_typ = 'ACTIVE' , last_chg_tms = sysdate() where 
fld_id = '00162148' and tbl_id = 'FIID' and  intrnl_dmn_val_txt = 'UPDATED';


commit;