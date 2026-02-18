update ft_t_edmv set end_tms = sysdate() 
where  EXT_DMN_VAL_TXT = 'COF COSI' and efld_data_src_id is  null and intrnl_dmn_val_id in (select intrnl_dmn_val_id from ft_t_idmv where  fld_data_cl_id = 'FIXBASIS');

update ft_t_edmv set end_tms = sysdate() 
where ext_dmn_val_txt = 'RUONIA' and efld_data_src_id is null and intrnl_dmn_val_id in (select intrnl_dmn_val_id from ft_t_idmv where  fld_data_cl_id = 'FIXBASIS');


commit; 