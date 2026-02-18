INSERT INTO ft_t_incl
(clsf_oid, indus_cl_set_id, cl_value, level_num, start_tms, end_tms, last_chg_tms, last_chg_usr_id, cl_nme, cl_desc, data_stat_typ, data_src_id)
select new_oid(), 'NACECLSCD', '64.31', 1, current_timestamp, NULL, current_timestamp, 'MHI:CSTM', 'Activities of money market and non-money market investment funds', 'Activities of money market and non-money market investment funds', NULL, 'MHI'
from dual where not exists (select 1 from ft_t_incl where indus_cl_set_id='NACECLSCD' and cl_value='64.31' and end_tms is null);