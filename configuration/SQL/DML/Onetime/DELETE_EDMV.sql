---------------------- Removing EDMV Short first and Long first from DB loaded from DAS -----------------

delete from FT_T_EDMV where intrnl_dmn_val_id in (select intrnl_dmn_val_id from ft_t_idmv where fld_id = '00181573') 
and data_src_id = 'BB' 
and last_chg_usr_id  like 'GS%' 
and ext_dmn_val_txt in ('Short First','Long First');