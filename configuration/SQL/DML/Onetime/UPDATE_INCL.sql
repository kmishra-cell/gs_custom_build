update ft_t_incl 
set end_tms=sysdate(), last_chg_tms=sysdate(), last_chg_usr_id ='GU-369'
where (indus_cl_set_id, cl_value) in (select indus_cl_set_id, cl_value from ft_t_incl where indus_cl_set_id ='NAICS' and end_tms is null group by indus_cl_set_id, cl_value having count(1)>1)
and last_chg_usr_id like 'GS:DM:MBUS%' 
and end_tms is null;

update ft_t_incl 
set end_tms=null, last_chg_tms=sysdate(), last_chg_usr_id ='GU-369' 
where indus_cl_set_id ='NAICS' 
and cl_value='5132' 
and end_tms is not null 
and prnt_clsf_oid is null;