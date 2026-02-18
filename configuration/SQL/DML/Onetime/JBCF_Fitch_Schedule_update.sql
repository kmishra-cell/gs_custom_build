UPDATE ft_m_jbcf SET job_run_day = 'MON,TUE,WED,THU,FRI' where job_name like '%Fitch%Ratings%' and end_tms is null;
Commit;