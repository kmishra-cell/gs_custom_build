update ft_T_issu set iss_actvy_stat_typ ='ACTIVE',LAST_CHG_USR_ID = 'GU-1409' where  iss_actvy_stat_typ ='EXPIRED'
and LAST_CHG_USR_ID = 'BBMOTGNP' and end_tms is null;