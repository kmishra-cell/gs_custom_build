-- 1) source: AlacraInbound.schedule.json
INSERT INTO  ft_m_jbcf
(jbcf_oid, job_name, job_desc, job_typ, job_run_day, job_start_time, job_end_time, job_run_freq, exp_run_dur, last_chg_tms, start_tms, end_tms, in_query, pub_query, val_query, result_column, to_mail, info_mail, task_start_check, multi_check, holiday_check, range_check)
SELECT new_oid(), 'AlacraInbound', 'AlacraInbound Job', 'Fileload', 'MON,TUE,WED,THU,FRI', '16:30', '16:45', '1', 5, SYSDATE(), SYSDATE(), NULL,
'select  max(job_id) as job_id,  case when count(*) > 0 then ''AlacraInbound is Loaded OK'' else ''AlacraInbound is not yet Loaded KO''  end as result 
from  ft_t_jblg where  job_config_txt ~ ''.*WrapperAlacraInbound.*''  and job_start_tms::date >= sysdate()::date
AND (job_start_tms::time BETWEEN time ''16:30'' AND time ''16:45'')',
NULL, NULL, 'RESULT', 'gsodmonitoring@thegoldensource.com', 'ODAlerts@thegoldensource.com', 'N', 'N', 'N', 'N'
FROM dual
WHERE NOT EXISTS (SELECT 'x' FROM ft_m_jbcf WHERE job_name = 'AlacraInbound');

-- 2) source: AlacraInboundMonthly.schedule.json
INSERT INTO  ft_m_jbcf
(jbcf_oid, job_name, job_desc, job_typ, job_run_day, job_start_time, job_end_time, job_run_freq, exp_run_dur, last_chg_tms, start_tms, end_tms, in_query, pub_query, val_query, result_column, to_mail, info_mail, task_start_check, multi_check, holiday_check, range_check)
SELECT new_oid(), 'AlacraInboundMonthly', 'AlacraInboundMonthly Job', 'Fileload','MON,TUE,WED,THU,FRI,SAT,SUN', '12:00', '12:15', '1', 5, SYSDATE(), SYSDATE(), NULL,
'select  max(job_id) as job_id, case
        when current_date <> date_trunc(''month'', current_date)::date
            then ''AlacraInboundMonthly - not first day of month - OK''
        when count(*) > 0
            then ''AlacraInboundMonthly is Loaded OK''
        else ''AlacraInboundMonthly is not yet Loaded KO''
    end as result
from  ft_t_jblg where  job_config_txt ~ ''.*WrapperAlacraInbound.*''  and job_start_tms::date >= sysdate()::date and job_stat_typ = ''CLOSED''
AND (job_start_tms::time BETWEEN time ''12:00'' AND time ''12:15'')',
NULL, NULL, 'RESULT', 'gsodmonitoring@thegoldensource.com', 'ODAlerts@thegoldensource.com', 'N', 'N', 'N', 'N'
FROM dual
WHERE NOT EXISTS (SELECT 'x' FROM ft_m_jbcf WHERE job_name = 'AlacraInboundMonthly');

-- 3) source: AlacraOutbound.schedule.json
INSERT INTO  ft_m_jbcf
(jbcf_oid, job_name, job_desc, job_typ, job_run_day, job_start_time, job_end_time, job_run_freq, exp_run_dur, last_chg_tms, start_tms, end_tms, in_query, pub_query, val_query, result_column, to_mail, info_mail, task_start_check, multi_check, holiday_check, range_check)
SELECT new_oid(), 'AlacraOutbound', 'AlacraOutbound Job', 'Fileload', 'MON,TUE,WED,THU,FRI', '07:00', '07:15', '1', 5, SYSDATE(), SYSDATE(), NULL,
'select  max(job_id) as job_id,  case when count(*) > 0 then ''AlacraOutbound is Loaded OK'' else ''AlacraOutbound is not yet Loaded KO''  end as result 
from  ft_t_jblg where  job_config_txt ~ ''.*WrapperAlacraOutbound.*''  and job_start_tms::date >= sysdate()::date and job_stat_typ = ''CLOSED''
AND (job_start_tms::time BETWEEN time ''07:00'' AND time ''07:15'')',
NULL, NULL, 'RESULT', 'gsodmonitoring@thegoldensource.com', 'ODAlerts@thegoldensource.com', 'N', 'N', 'N', 'N'
FROM dual
WHERE NOT EXISTS (SELECT 'x' FROM ft_m_jbcf WHERE job_name = 'AlacraOutbound');

-- 4) source: AlacraOutboundMonthly.schedule.json
INSERT INTO  ft_m_jbcf
(jbcf_oid, job_name, job_desc, job_typ, job_run_day, job_start_time, job_end_time, job_run_freq, exp_run_dur, last_chg_tms, start_tms, end_tms, in_query, pub_query, val_query, result_column, to_mail, info_mail, task_start_check, multi_check, holiday_check, range_check)
SELECT new_oid(), 'AlacraOutboundMonthly', 'AlacraOutboundMonthly Job', 'Fileload', 'MON,TUE,WED,THU,FRI,SAT,SUN', '18:15', '18:35', '1', 10, SYSDATE(), SYSDATE(), NULL,
'select  max(job_id) as job_id,   case
        when CURRENT_DATE <> (date_trunc(''month'', CURRENT_DATE) + interval ''1 month - 1 day'')::date
            then ''AlacraOutboundMonthly - not last day of month - OK''
        when count(*) > 0
            then ''AlacraOutboundMonthly is Loaded OK''
        else ''AlacraOutboundMonthly is not yet Loaded KO''
    end as result 
from  ft_t_jblg where  job_config_txt ~ ''.*WrapperAlacraOutboundMonthly.*''  and job_start_tms::date >= sysdate()::date and job_stat_typ = ''CLOSED''
AND (job_start_tms::time BETWEEN time ''18:15'' AND time ''18:35'')',
NULL, NULL, 'RESULT', 'gsodmonitoring@thegoldensource.com', 'ODAlerts@thegoldensource.com', 'N', 'N', 'N', 'N'
FROM dual
WHERE NOT EXISTS (SELECT 'x' FROM ft_m_jbcf WHERE job_name = 'AlacraOutboundMonthly');

-- 5) source: B3RatingsDerivationWrapper.schedule.json
INSERT INTO  ft_m_jbcf
(jbcf_oid, job_name, job_desc, job_typ, job_run_day, job_start_time, job_end_time, job_run_freq, exp_run_dur, last_chg_tms, start_tms, end_tms, in_query, pub_query, val_query, result_column, to_mail, info_mail, task_start_check, multi_check, holiday_check, range_check)
SELECT new_oid(), 'B3RatingsDerivationWrapper', 'B3RatingsDerivationWrapper Job', 'Fileload', 'MON,TUE,WED,THU,FRI,SAT,SUN', '21:00', '21:30', '1', 25, SYSDATE(), SYSDATE(), NULL,
'select  max(job_id) as job_id,  case when count(*) > 0 then ''B3RatingsDerivation'' || '' is Loaded OK'' else ''B3RatingsDerivation is not yet Loaded KO''  end as result 
from  ft_t_jblg where  job_config_txt ~ ''B3RatingsDerivation''  and job_start_tms::date >= sysdate()::date and job_stat_typ = ''CLOSED''',
NULL, NULL, 'RESULT', 'gsodmonitoring@thegoldensource.com', 'ODAlerts@thegoldensource.com', 'N', 'N', 'N', 'N'
FROM dual
WHERE NOT EXISTS (SELECT 'x' FROM ft_m_jbcf WHERE job_name = 'B3RatingsDerivationWrapper');

-- 6) source: BBBOAsia1.schedule.json
INSERT INTO  ft_m_jbcf
(jbcf_oid, job_name, job_desc, job_typ, job_run_day, job_start_time, job_end_time, job_run_freq, exp_run_dur, last_chg_tms, start_tms, end_tms, in_query, pub_query, val_query, result_column, to_mail, info_mail, task_start_check, multi_check, holiday_check, range_check)
SELECT new_oid(), 'BBBOAsia1', 'BBBOAsia1 Job', 'Fileload', 'SUN,MON,TUE,WED,THU,FRI', '11:00', '11:30', '1', 15, SYSDATE(), SYSDATE(), NULL,
'select  max(job_id) as job_id,  case when count(*) > 0 then reverse(split_part(reverse(max(job_input_txt)),''/'', ''1'')) || '' is Loaded OK'' else ''BBBOAsia1 is not yet Loaded KO''  end as result 
from  ft_t_jblg where  job_input_txt ~ ''.*/gold/GSFTP/files/bloomberg/equity_asia1.dif.gz.*''  and job_start_tms::date >= sysdate()::date and job_stat_typ = ''CLOSED''',
NULL, NULL, 'RESULT', 'gsodmonitoring@thegoldensource.com', 'ODAlerts@thegoldensource.com', 'N', 'N', 'N', 'N'
FROM dual
WHERE NOT EXISTS (SELECT 'x' FROM ft_m_jbcf WHERE job_name = 'BBBOAsia1');

-- 7) source: BBBOAsia1Price.schedule.json
INSERT INTO  ft_m_jbcf
(jbcf_oid, job_name, job_desc, job_typ, job_run_day, job_start_time, job_end_time, job_run_freq, exp_run_dur, last_chg_tms, start_tms, end_tms, in_query, pub_query, val_query, result_column, to_mail, info_mail, task_start_check, multi_check, holiday_check, range_check)
SELECT new_oid(), 'BBBOAsia1Price', 'BBBOAsia1Price Job', 'Fileload', 'SUN,MON,TUE,WED,THU,FRI', '11:30', '12:00', '1', 10, SYSDATE(), SYSDATE(), NULL,
'select  max(job_id) as job_id,  case when count(*) > 0 then reverse(split_part(reverse(max(job_input_txt)),''/'', ''1'')) || '' is Loaded OK'' else ''BBBOAsia1Price is not yet Loaded KO''  end as result 
from  ft_t_jblg where  job_input_txt ~ ''.*/gold/GSFTP/files/bloomberg/equity_asia1.px.gz.*''  and job_start_tms::date >= sysdate()::date and job_stat_typ = ''CLOSED''',
NULL, NULL, 'RESULT', 'gsodmonitoring@thegoldensource.com', 'ODAlerts@thegoldensource.com', 'N', 'N', 'N', 'N'
FROM dual
WHERE NOT EXISTS (SELECT 'x' FROM ft_m_jbcf WHERE job_name = 'BBBOAsia1Price');

-- 8) source: BBBOAsia2.schedule.json
INSERT INTO  ft_m_jbcf
(jbcf_oid, job_name, job_desc, job_typ, job_run_day, job_start_time, job_end_time, job_run_freq, exp_run_dur, last_chg_tms, start_tms, end_tms, in_query, pub_query, val_query, result_column, to_mail, info_mail, task_start_check, multi_check, holiday_check, range_check)
SELECT new_oid(), 'BBBOAsia2', 'BBBOAsia2 Job', 'Fileload', 'SUN,MON,TUE,WED,THU,FRI', '13:00', '13:30', '1', 15, SYSDATE(), SYSDATE(), NULL,
'select  max(job_id) as job_id,  case when count(*) > 0 then reverse(split_part(reverse(max(job_input_txt)),''/'', ''1'')) || '' is Loaded OK'' else ''BBBOAsia2 is not yet Loaded KO''  end as result 
from  ft_t_jblg where  job_input_txt ~ ''.*/gold/GSFTP/files/bloomberg/equity_asia2.dif.gz.*''  and job_start_tms::date >= sysdate()::date and job_stat_typ = ''CLOSED''',
NULL, NULL, 'RESULT', 'gsodmonitoring@thegoldensource.com', 'ODAlerts@thegoldensource.com', 'N', 'N', 'N', 'N'
FROM dual
WHERE NOT EXISTS (SELECT 'x' FROM ft_m_jbcf WHERE job_name = 'BBBOAsia2');

-- 9) source: BBBOAsia2Price.schedule.json
INSERT INTO  ft_m_jbcf
(jbcf_oid, job_name, job_desc, job_typ, job_run_day, job_start_time, job_end_time, job_run_freq, exp_run_dur, last_chg_tms, start_tms, end_tms, in_query, pub_query, val_query, result_column, to_mail, info_mail, task_start_check, multi_check, holiday_check, range_check)
SELECT new_oid(), 'BBBOAsia2Price', 'BBBOAsia2Price Job', 'Fileload', 'SUN,MON,TUE,WED,THU,FRI', '13:30', '14:00', '1', 10, SYSDATE(), SYSDATE(), NULL,
'select  max(job_id) as job_id,  case when count(*) > 0 then reverse(split_part(reverse(max(job_input_txt)),''/'', ''1'')) || '' is Loaded OK'' else ''BBBOAsia2Price is not yet Loaded KO''  end as result 
from  ft_t_jblg where  job_input_txt ~ ''.*/gold/GSFTP/files/bloomberg/equity_asia2.px.gz.*''  and job_start_tms::date >= sysdate()::date and job_stat_typ = ''CLOSED''',
NULL, NULL, 'RESULT', 'gsodmonitoring@thegoldensource.com', 'ODAlerts@thegoldensource.com', 'N', 'N', 'N', 'N'
FROM dual
WHERE NOT EXISTS (SELECT 'x' FROM ft_m_jbcf WHERE job_name = 'BBBOAsia2Price');

-- 10) source: BBCreditRisk.schedule.json
INSERT INTO  ft_m_jbcf
(jbcf_oid, job_name, job_desc, job_typ, job_run_day, job_start_time, job_end_time, job_run_freq, exp_run_dur, last_chg_tms, start_tms, end_tms, in_query, pub_query, val_query, result_column, to_mail, info_mail, task_start_check, multi_check, holiday_check, range_check)
SELECT new_oid(), 'BBCreditRisk', 'BBCreditRisk Job', 'Fileload', 'MON,TUE,WED,THU,FRI,SAT', '04:30', '5:40', '1', 60, SYSDATE(), SYSDATE(), NULL,
'select  max(job_id) as job_id,  case when count(*) > 0 then reverse(split_part(reverse(max(job_input_txt)),''/'', ''1'')) || '' is Loaded OK'' else ''BBCreditRisk is not yet Loaded KO''  end as result 
from  ft_t_jblg where  job_input_txt ~ ''.*/gold/GSFTP/files/bloomberg/credit_risk.dif.gz.*'' and job_stat_typ = ''CLOSED'' and
((job_start_tms::date >= sysdate()::date and (job_start_tms::time BETWEEN time ''00:30'' AND time ''04:30'')) or (job_start_tms::date >= sysdate()::date - interval ''1 day''and (job_start_tms::time BETWEEN time ''22:30'' AND time ''23:59'')))',
NULL, NULL, 'RESULT', 'gsodmonitoring@thegoldensource.com', 'ODAlerts@thegoldensource.com', 'N', 'N', 'N', 'N'
FROM dual
WHERE NOT EXISTS (SELECT 'x' FROM ft_m_jbcf WHERE job_name = 'BBCreditRisk');

-- 11) source: BBCreditRiskRatings.schedule.json
INSERT INTO ft_m_jbcf
(jbcf_oid, job_name, job_desc, job_typ, job_run_day, job_start_time, job_end_time, job_run_freq, exp_run_dur,
 last_chg_tms, start_tms, end_tms, in_query, pub_query, val_query, result_column,
 to_mail, info_mail, task_start_check, multi_check, holiday_check, range_check)
SELECT new_oid(), 'BBCreditRiskRatings', 'BBCreditRiskRatings Job', 'Fileload',
       'MON,TUE,WED,THU,FRI,SAT', '04:30', '5:00', '1', 5, SYSDATE(), SYSDATE(), NULL,
'select max(job_id) as job_id, case when count(*) > 0 then reverse(split_part(reverse(max(job_input_txt)),''/'',''1'')) || '' is Loaded OK''
      else ''BBCreditRiskRatings is not yet Loaded KO'' end as result
 from ft_t_jblg where job_input_txt ~ ''.*/gold/GSFTP/files/bloomberg/creditRiskMultiAgencyRatings.dif.gz.*'' and job_stat_typ = ''CLOSED'' and
((job_start_tms::date >= sysdate()::date and (job_start_tms::time BETWEEN time ''00:30'' AND time ''04:30'')) or (job_start_tms::date >= sysdate()::date - interval ''1 day''and (job_start_tms::time BETWEEN time ''22:30'' AND time ''23:59'')))',
NULL, NULL, 'RESULT',
'gsodmonitoring@thegoldensource.com',
'ODAlerts@thegoldensource.com',
'N','N','N','N'
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM ft_m_jbcf WHERE job_name='BBCreditRiskRatings');

-- 12) source: BBPerSecurityBulkRequest.schedule.json
--INSERT INTO ft_m_jbcf
--(jbcf_oid, job_name, job_desc, job_typ, job_run_day, job_start_time, job_end_time, job_run_freq, exp_run_dur,
-- last_chg_tms, start_tms, end_tms, in_query, pub_query, val_query, result_column,
-- to_mail, info_mail, task_start_check, multi_check, holiday_check, range_check)
--SELECT new_oid(), 'BBPerSecurityBulkRequest', 'BBPerSecurityBulkRequest Job', 'Fileload',
--       'SUN,MON,TUE,WED,THU,FRI', '02:00', '02:00', '1', 5, SYSDATE(), SYSDATE(), NULL,
--'select max(job_id) as job_id, case when count(*) > 0 then reverse(split_part(reverse(max(job_input_txt)),''/'',''1'')) || '' is Loaded OK''
--      else ''BBPerSecurityBulkRequest is not yet Loaded KO'' end as result
-- from ft_t_jblg where job_input_txt ~ ''.*/gold/GSFTP/files/bbg_esb_temp/OS_gs.*.out'' and job_start_tms::date >= sysdate()::date and job_stat_typ = ''CLOSED''',
--NULL, NULL, 'RESULT',
--'gsodmonitoring@thegoldensource.com',
--'ODAlerts@thegoldensource.com',
--'N','N','N','N'
--FROM dual
--WHERE NOT EXISTS (SELECT 1 FROM ft_m_jbcf WHERE job_name='BBPerSecurityBulkRequest');

-- 13) source: BBPerSecurityBulkRequestCorejob.schedule.json
INSERT INTO ft_m_jbcf
(jbcf_oid, job_name, job_desc, job_typ, job_run_day, job_start_time, job_end_time, job_run_freq, exp_run_dur,
 last_chg_tms, start_tms, end_tms, in_query, pub_query, val_query, result_column,
 to_mail, info_mail, task_start_check, multi_check, holiday_check, range_check)
SELECT new_oid(), 'BBPerSecurityBulkRequestCorejob', 'BBPerSecurityBulkRequestCorejob Job', 'Fileload',
       'MON,TUE,WED,THU,FRI', '02:00', '05:30', '1', 150, SYSDATE(), SYSDATE(), NULL,
'select max(job_id) as job_id,  CASE  WHEN SUM(CASE WHEN job_stat_typ = ''OPEN'' THEN 1 ELSE 0 END) > 0
            THEN ''BBPerSecurityBulkRequestCorejob is not yet Loaded KO''
        WHEN SUM(CASE WHEN job_stat_typ = ''CLOSED'' THEN 1 ELSE 0 END) > 0
            THEN reverse(split_part(reverse(MAX(job_input_txt)), ''/'', ''1'')) || '' is Loaded OK''
        ELSE ''BBPerSecurityBulkRequestCorejob is not yet Loaded KO'' end as result
 from ft_t_jblg where job_input_txt ~ ''.*/gold/GSFTP/files/bbg_esb_temp/.*gs.*.out'' and job_start_tms::date >= sysdate()::date 
 AND (job_start_tms::time BETWEEN time ''02:00'' AND time ''05:30'') and task_tot_cnt > 10',
NULL, NULL, 'RESULT',
'gsodmonitoring@thegoldensource.com',
'ODAlerts@thegoldensource.com',
'N','N','N','N'
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM ft_m_jbcf WHERE job_name='BBPerSecurityBulkRequestCorejob');

-- 14) source: BBPerSecurityBulkRequestCorp-ASIA.schedule.json
INSERT INTO ft_m_jbcf
(jbcf_oid, job_name, job_desc, job_typ, job_run_day, job_start_time, job_end_time, job_run_freq, exp_run_dur,
 last_chg_tms, start_tms, end_tms, in_query, pub_query, val_query, result_column,
 to_mail, info_mail, task_start_check, multi_check, holiday_check, range_check)
SELECT new_oid(), 'BBPerSecurityBulkRequestCorp-ASIA', 'BBPerSecurityBulkRequestCorp-ASIA Job', 'Fileload',
       'MON,TUE,WED,THU,FRI', '05:30', '06:30', '1', 45, SYSDATE(), SYSDATE(), NULL,
'select max(job_id) as job_id, CASE  WHEN SUM(CASE WHEN job_stat_typ = ''OPEN'' THEN 1 ELSE 0 END) > 0
            THEN ''BBPerSecurityBulkRequestCorp-ASIA is not yet Loaded KO''
        WHEN SUM(CASE WHEN job_stat_typ = ''CLOSED'' THEN 1 ELSE 0 END) > 0
            THEN reverse(split_part(reverse(MAX(job_input_txt)), ''/'', ''1'')) || '' is Loaded OK''
        ELSE ''BBPerSecurityBulkRequestCorp-ASIA is not yet Loaded KO'' end as result
 from ft_t_jblg where job_input_txt ~ ''.*/gold/GSFTP/files/bbg_esb_temp/.*gs.*.out'' and job_start_tms::date >= sysdate()::date 
 AND (job_start_tms::time BETWEEN time ''05:30'' AND time ''08:30'') and task_tot_cnt > 10',
NULL, NULL, 'RESULT',
'gsodmonitoring@thegoldensource.com',
'ODAlerts@thegoldensource.com',
'N','N','N','N'
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM ft_m_jbcf WHERE job_name='BBPerSecurityBulkRequestCorp-ASIA');

-- 15) source: BBPerSecurityBulkRequestCorp-EURO.schedule.json
INSERT INTO ft_m_jbcf
(jbcf_oid, job_name, job_desc, job_typ, job_run_day, job_start_time, job_end_time, job_run_freq, exp_run_dur,
 last_chg_tms, start_tms, end_tms, in_query, pub_query, val_query, result_column,
 to_mail, info_mail, task_start_check, multi_check, holiday_check, range_check)
SELECT new_oid(), 'BBPerSecurityBulkRequestCorp-EURO', 'BBPerSecurityBulkRequestCorp-EURO Job', 'Fileload',
       'MON,TUE,WED,THU,FRI', '08:30', '12:00', '1', 75, SYSDATE(), SYSDATE(), NULL,
'select max(job_id) as job_id, CASE  WHEN SUM(CASE WHEN job_stat_typ = ''OPEN'' THEN 1 ELSE 0 END) > 0
            THEN ''BBPerSecurityBulkRequestCorp-EURO is not yet Loaded KO''
        WHEN SUM(CASE WHEN job_stat_typ = ''CLOSED'' THEN 1 ELSE 0 END) > 0
            THEN reverse(split_part(reverse(MAX(job_input_txt)), ''/'', ''1'')) || '' is Loaded OK''
        ELSE ''BBPerSecurityBulkRequestCorp-EURO is not yet Loaded KO'' end as result
 from ft_t_jblg where job_input_txt ~ ''.*/gold/GSFTP/files/bbg_esb_temp/.*gs.*.out'' and job_start_tms::date >= sysdate()::date 
 AND (job_start_tms::time BETWEEN time ''08:30'' AND time ''12:00'') and task_tot_cnt > 10',
NULL, NULL, 'RESULT',
'gsodmonitoring@thegoldensource.com',
'ODAlerts@thegoldensource.com',
'N','N','N','N'
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM ft_m_jbcf WHERE job_name='BBPerSecurityBulkRequestCorp-EURO');

-- 16) source: BBPerSecurityBulkRequestCorp-NAMR.schedule.json
INSERT INTO ft_m_jbcf
(jbcf_oid, job_name, job_desc, job_typ, job_run_day, job_start_time, job_end_time, job_run_freq, exp_run_dur,
 last_chg_tms, start_tms, end_tms, in_query, pub_query, val_query, result_column,
 to_mail, info_mail, task_start_check, multi_check, holiday_check, range_check)
SELECT new_oid(), 'BBPerSecurityBulkRequestCorp-NAMR', 'BBPerSecurityBulkRequestCorp-NAMR Job', 'Fileload',
       'MON,TUE,WED,THU,FRI', '12:30', '14:00', '1', 60, SYSDATE(), SYSDATE(), NULL,
'select max(job_id) as job_id, CASE  WHEN SUM(CASE WHEN job_stat_typ = ''OPEN'' THEN 1 ELSE 0 END) > 0
            THEN ''BBPerSecurityBulkRequestCorp-NAMR is not yet Loaded KO''
        WHEN SUM(CASE WHEN job_stat_typ = ''CLOSED'' THEN 1 ELSE 0 END) > 0
            THEN reverse(split_part(reverse(MAX(job_input_txt)), ''/'', ''1'')) || '' is Loaded OK''
        ELSE ''BBPerSecurityBulkRequestCorp-NAMR is not yet Loaded KO'' end as result
 from ft_t_jblg where job_input_txt ~ ''.*/gold/GSFTP/files/bbg_esb_temp/.*gs.*.out'' and job_start_tms::date >= sysdate()::date 
 AND (job_start_tms::time BETWEEN time ''12:30'' AND time ''14:00'') and task_tot_cnt > 10',
NULL, NULL, 'RESULT',
'gsodmonitoring@thegoldensource.com',
'ODAlerts@thegoldensource.com',
'N','N','N','N'
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM ft_m_jbcf WHERE job_name='BBPerSecurityBulkRequestCorp-NAMR');

-- 17) source: BBPerSecurityYieldCurve.schedule.json
INSERT INTO ft_m_jbcf
(jbcf_oid, job_name, job_desc, job_typ, job_run_day, job_start_time, job_end_time, job_run_freq, exp_run_dur,
 last_chg_tms, start_tms, end_tms, in_query, pub_query, val_query, result_column,
 to_mail, info_mail, task_start_check, multi_check, holiday_check, range_check)
SELECT new_oid(), 'BBPerSecurityYieldCurve', 'BBPerSecurityYieldCurve Job', 'Fileload',
       'MON,TUE,WED,THU,FRI', '12:00', '12:30', '1', 15, SYSDATE(), SYSDATE(), NULL,
'select max(WFRI.workflow_start_tms)::text as job_id, 
		case when count(*)> 0 
			then '' BBPerSecurityYieldCurve Job is Completed OK''
			else '' BBPerSecurityYieldCurve Job is not yet Completed KO'' end as result
	from FT_WF_WFDF WFDF, FT_WF_WFRI WFRI 
		where WFDF.workflow_id = WFRI.workflow_id 
		and WFDF.workflow_id = (SELECT workflow_id FROM FT_WF_WFDF WHERE workflow_nme = ''BBPerSecurityYieldCurve'' AND workflow_stat_typ = ''RELEASED''
        ORDER BY workflow_ver_num DESC LIMIT 1) and WFRI.wf_runtime_stat_typ = ''DONE''	and WFRI.workflow_start_tms::DATE = SYSDATE()::DATE
		AND (workflow_start_tms::time BETWEEN time ''12:00'' AND time ''12:30'')',   
NULL, NULL, 'RESULT',
'gsodmonitoring@thegoldensource.com',
'ODAlerts@thegoldensource.com',
'N','N','N','N'
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM ft_m_jbcf WHERE job_name='BBPerSecurityYieldCurve');

-- 18) source: CalculateEquityRating.schedule.json
-- Added at the bottom for Every hour run.

-- 19) source: CheckActiveBBRequestJobs.schedule.json
INSERT INTO ft_m_jbcf
(jbcf_oid, job_name, job_desc, job_typ, job_run_day, job_start_time, job_end_time, job_run_freq, exp_run_dur,
 last_chg_tms, start_tms, end_tms, in_query, pub_query, val_query, result_column,
 to_mail, info_mail, task_start_check, multi_check, holiday_check, range_check)
SELECT new_oid(), 'CheckActiveBBRequestJobs', 'CheckActiveBBRequestJobs Job', 'Fileload',
       'MON,TUE,WED,THU,FRI,SAT,SUN', '07:00', '07:15', '1', 5, 
       SYSDATE(), SYSDATE(), NULL,
		'select max(WFRI.workflow_start_tms)::text as job_id, 
		case when count(*)> 0 
			then '' CheckActiveBBRequestJobs Job is Completed OK''
			else '' CheckActiveBBRequestJobs Job is not yet Completed KO'' end as result
	from FT_WF_WFDF WFDF, FT_WF_WFRI WFRI 
		where WFDF.workflow_id = WFRI.workflow_id 
		and WFDF.workflow_id = (SELECT workflow_id FROM FT_WF_WFDF WHERE workflow_nme = ''CheckActiveBBRequestJobs'' AND workflow_stat_typ = ''RELEASED''
        ORDER BY workflow_ver_num DESC LIMIT 1) and WFRI.wf_runtime_stat_typ = ''DONE''	and WFRI.workflow_start_tms::DATE = SYSDATE()::DATE
		AND (workflow_start_tms::time BETWEEN time ''07:00'' AND time ''07:15'')',
NULL, NULL, 'RESULT',
'gsodmonitoring@thegoldensource.com',
'ODAlerts@thegoldensource.com',
'N','N','N','N'
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM ft_m_jbcf WHERE job_name='CheckActiveBBRequestJobs');

-- 20) source: cmfAssetUniverse.schedule.json
-- This Job is not required as per ADITLO

-- 21) source: cmfCounterpartyAll.schedule.json
-- This Job is not required as per ADITLO

-- 22) source: cmfPartyUniverse.schedule.json
-- This Job is not required as per ADITLO


-- 23) source: CreditRiskChecks.schedule.json
INSERT INTO ft_m_jbcf
(jbcf_oid, job_name, job_desc, job_typ, job_run_day, job_start_time, job_end_time,
 job_run_freq, exp_run_dur, last_chg_tms, start_tms, end_tms,
 in_query, pub_query, val_query, result_column,
 to_mail, info_mail, task_start_check, multi_check, holiday_check, range_check)
SELECT new_oid(), 'CreditRiskChecks', 'CreditRiskChecks Job', 'Fileload',
       'MON,TUE,WED,THU,FRI', '07:00', '07:15', '1', 5,
       SYSDATE(), SYSDATE(), NULL,
		'select max(WFRI.workflow_start_tms)::text as job_id, 
		case when count(*)> 0 
			then '' CreditRiskChecks Job is Completed OK''
			else '' CreditRiskChecks Job is not yet Completed KO'' end as result
	from FT_WF_WFDF WFDF, FT_WF_WFRI WFRI 
		where WFDF.workflow_id = WFRI.workflow_id 
		and WFDF.workflow_id = (SELECT workflow_id FROM FT_WF_WFDF WHERE workflow_nme = ''CreditChecks'' AND workflow_stat_typ = ''RELEASED''
        ORDER BY workflow_ver_num DESC LIMIT 1) and WFRI.wf_runtime_stat_typ = ''DONE''	and WFRI.workflow_start_tms::DATE = SYSDATE()::DATE
		AND (workflow_start_tms::time BETWEEN time ''07:00'' AND time ''07:15'')',
NULL, NULL, 'RESULT',
'gsodmonitoring@thegoldensource.com',
'ODAlerts@thegoldensource.com',
'N','N','N','N'
FROM dual
WHERE NOT EXISTS
      (SELECT 1 FROM ft_m_jbcf WHERE job_name='CreditRiskChecks');

-- 25)a source: FitchIssuerRatings.schedule.json
INSERT INTO ft_m_jbcf
(jbcf_oid, job_name, job_desc, job_typ, job_run_day, job_start_time, job_end_time,
 job_run_freq, exp_run_dur, last_chg_tms, start_tms, end_tms,
 in_query, pub_query, val_query, result_column,
 to_mail, info_mail, task_start_check, multi_check, holiday_check, range_check)
SELECT new_oid(), 'FitchIssuerRatings', 'FitchIssuerRatings Job', 'Fileload',
       'MON,TUE,WED,THU,FRI,SAT,SUN', '13:45', '14:15', '1', 15,
       SYSDATE(), SYSDATE(), NULL,
'select max(job_id) as job_id,
        CASE  WHEN SUM(CASE WHEN job_stat_typ = ''OPEN'' THEN 1 ELSE 0 END) > 0
            THEN ''FitchIssuerRatings is not yet Loaded KO''
        WHEN SUM(CASE WHEN job_stat_typ = ''CLOSED'' THEN 1 ELSE 0 END) > 0 
			then reverse(split_part(reverse(max(job_input_txt)), ''/'',''1'')) || '' is Loaded OK''
             else ''FitchIssuerRatings is not yet Loaded KO'' end as result
 from ft_t_jblg where job_input_txt ~ ''.*/RDSIssuerIntradayReport_20.*.iir.zip''
   and job_start_tms::date >= sysdate()::date
	AND (job_start_tms::time BETWEEN time ''08:00'' AND time ''13:45'')',
NULL, NULL, 'RESULT',
'gsodmonitoring@thegoldensource.com',
'ODAlerts@thegoldensource.com',
'N','N','N','N'
FROM dual;
	  
-- 25)b source: FitchIssuerRatings.schedule.json
INSERT INTO ft_m_jbcf
(jbcf_oid, job_name, job_desc, job_typ, job_run_day, job_start_time, job_end_time,
 job_run_freq, exp_run_dur, last_chg_tms, start_tms, end_tms,
 in_query, pub_query, val_query, result_column,
 to_mail, info_mail, task_start_check, multi_check, holiday_check, range_check)
SELECT new_oid(), 'FitchIssuerRatings', 'FitchIssuerRatings Job', 'Fileload',
       'MON,TUE,WED,THU,FRI,SAT,SUN', '18:00', '18:30', '1', 15,
       SYSDATE(), SYSDATE(), NULL,
'select max(job_id) as job_id,
        CASE  WHEN SUM(CASE WHEN job_stat_typ = ''OPEN'' THEN 1 ELSE 0 END) > 0
            THEN ''FitchIssuerRatings is not yet Loaded KO''
        WHEN SUM(CASE WHEN job_stat_typ = ''CLOSED'' THEN 1 ELSE 0 END) > 0 
			then reverse(split_part(reverse(max(job_input_txt)), ''/'',''1'')) || '' is Loaded OK''
             else ''FitchIssuerRatings is not yet Loaded KO'' end as result
 from ft_t_jblg where job_input_txt ~ ''.*/RDSIssuerIntradayReport_20.*.iir.zip''
   and job_start_tms::date >= sysdate()::date
	AND (job_start_tms::time BETWEEN time ''13:45'' AND time ''18:00'')',
NULL, NULL, 'RESULT',
'gsodmonitoring@thegoldensource.com',
'ODAlerts@thegoldensource.com',
'N','N','N','N'
FROM dual;


-- 26) source: FitchIssuerSeed.schedule.json
INSERT INTO ft_m_jbcf
(jbcf_oid, job_name, job_desc, job_typ, job_run_day, job_start_time, job_end_time,
 job_run_freq, exp_run_dur, last_chg_tms, start_tms, end_tms,
 in_query, pub_query, val_query, result_column,
 to_mail, info_mail, task_start_check, multi_check, holiday_check, range_check)
SELECT new_oid(), 'FitchIssuerSeed', 'FitchIssuerSeed Job', 'Fileload',
       'MON,TUE,WED,THU,FRI,SAT,SUN', '04:30', '05:00', '1', 20,
       SYSDATE(), SYSDATE(), NULL,
'select max(job_id) as job_id,
        case  when EXTRACT(day FROM CURRENT_DATE) <> 2
            then ''FitchIssuerSeed - not 2nd day of month - OK''
		when count(*) > 0 then reverse(split_part(reverse(max(job_input_txt)), ''/'',''1'')) || '' is Loaded OK''
             else ''FitchIssuerSeed is not yet Loaded KO'' end as result
 from ft_t_jblg where job_input_txt ~ ''.*20.*.mir.zip''
   and job_start_tms::date >= sysdate()::date and job_stat_typ = ''CLOSED''',
NULL, NULL, 'RESULT',
'gsodmonitoring@thegoldensource.com',
'ODAlerts@thegoldensource.com',
'N','N','N','N'
FROM dual
WHERE NOT EXISTS
      (SELECT 1 FROM ft_m_jbcf WHERE job_name='FitchIssuerSeed');


-- 27)a source: FitchSecurityRatings.schedule.json
INSERT INTO ft_m_jbcf
(jbcf_oid, job_name, job_desc, job_typ, job_run_day, job_start_time, job_end_time,
 job_run_freq, exp_run_dur, last_chg_tms, start_tms, end_tms,
 in_query, pub_query, val_query, result_column,
 to_mail, info_mail, task_start_check, multi_check, holiday_check, range_check)
SELECT new_oid(), 'FitchSecurityRatings', 'FitchSecurityRatings Job', 'Fileload',
       'MON,TUE,WED,THU,FRI,SAT,SUN', '13:45', '14:15', '1', 15,
       SYSDATE(), SYSDATE(), NULL,
'select max(job_id) as job_id,
        CASE  WHEN SUM(CASE WHEN job_stat_typ = ''OPEN'' THEN 1 ELSE 0 END) > 0
            THEN ''FitchSecurityRatings is not yet Loaded KO''
        WHEN SUM(CASE WHEN job_stat_typ = ''CLOSED'' THEN 1 ELSE 0 END) > 0 
			then reverse(split_part(reverse(max(job_input_txt)), ''/'',''1'')) || '' is Loaded OK''
             else ''FitchSecurityRatings is not yet Loaded KO'' end as result
 from ft_t_jblg where job_input_txt ~ ''.*/RDSIssueIntradayReport_.*.iis.zip''
   and job_start_tms::date >= sysdate()::date
   	AND (job_start_tms::time BETWEEN time ''07:30'' AND time ''13:45'')',
NULL, NULL, 'RESULT',
'gsodmonitoring@thegoldensource.com',
'ODAlerts@thegoldensource.com',
'N','N','N','N'
FROM dual;


-- 27)b source: FitchSecurityRatings.schedule.json
INSERT INTO ft_m_jbcf
(jbcf_oid, job_name, job_desc, job_typ, job_run_day, job_start_time, job_end_time,
 job_run_freq, exp_run_dur, last_chg_tms, start_tms, end_tms,
 in_query, pub_query, val_query, result_column,
 to_mail, info_mail, task_start_check, multi_check, holiday_check, range_check)
SELECT new_oid(), 'FitchSecurityRatings', 'FitchSecurityRatings Job', 'Fileload',
       'MON,TUE,WED,THU,FRI,SAT,SUN', '18:30', '19:00', '1', 15,
       SYSDATE(), SYSDATE(), NULL,
'select max(job_id) as job_id,
        CASE  WHEN SUM(CASE WHEN job_stat_typ = ''OPEN'' THEN 1 ELSE 0 END) > 0
            THEN ''FitchSecurityRatings is not yet Loaded KO''
        WHEN SUM(CASE WHEN job_stat_typ = ''CLOSED'' THEN 1 ELSE 0 END) > 0 
			then reverse(split_part(reverse(max(job_input_txt)), ''/'',''1'')) || '' is Loaded OK''
             else ''FitchSecurityRatings is not yet Loaded KO'' end as result
 from ft_t_jblg where job_input_txt ~ ''.*/RDSIssueIntradayReport_.*.iis.zip''
   and job_start_tms::date >= sysdate()::date
   	AND (job_start_tms::time BETWEEN time ''13:45'' AND time ''18:30'')',
NULL, NULL, 'RESULT',
'gsodmonitoring@thegoldensource.com',
'ODAlerts@thegoldensource.com',
'N','N','N','N'
FROM dual;


-- 28) source: FitchSecuritySeed.schedule.json
INSERT INTO ft_m_jbcf
(jbcf_oid, job_name, job_desc, job_typ, job_run_day, job_start_time, job_end_time,
 job_run_freq, exp_run_dur, last_chg_tms, start_tms, end_tms,
 in_query, pub_query, val_query, result_column,
 to_mail, info_mail, task_start_check, multi_check, holiday_check, range_check)
SELECT new_oid(), 'FitchSecuritySeed', 'FitchSecuritySeed Job', 'Fileload',
       'MON,TUE,WED,THU,FRI,SAT,SUN', '05:00', '06:00', '1', 20,
       SYSDATE(), SYSDATE(), NULL,
'select max(job_id) as job_id,
        case  when EXTRACT(day FROM CURRENT_DATE) <> 2
            then ''FitchSecuritySeed - not 2nd day of month - OK''
		when count(*) > 0 then reverse(split_part(reverse(max(job_input_txt)), ''/'',''1'')) || '' is Loaded OK''
             else ''FitchSecuritySeed is not yet Loaded KO'' end as result
 from ft_t_jblg where job_input_txt ~ ''.*20.*.mis.zip''
   and job_start_tms::date >= sysdate()::date and job_stat_typ = ''CLOSED''',
NULL, NULL, 'RESULT',
'gsodmonitoring@thegoldensource.com',
'ODAlerts@thegoldensource.com',
'N','N','N','N'
FROM dual
WHERE NOT EXISTS
      (SELECT 1 FROM ft_m_jbcf WHERE job_name='FitchSecuritySeed');


-- 29) source: FRTBIssuerReport.schedule.json
INSERT INTO ft_m_jbcf
(jbcf_oid, job_name, job_desc, job_typ, job_run_day, job_start_time, job_end_time,
 job_run_freq, exp_run_dur, last_chg_tms, start_tms, end_tms,
 in_query, pub_query, val_query, result_column,
 to_mail, info_mail, task_start_check, multi_check, holiday_check, range_check)
SELECT new_oid(), 'FRTBIssuerReport', 'FRTBIssuerReport Job', 'Fileload',
       'MON,TUE,WED,THU,FRI', '16:00', '16:15', '1', 5,
       SYSDATE(), SYSDATE(), NULL,
		'select max(WFRI.workflow_start_tms)::text as job_id, 
		case when count(*)> 0 
			then '' FRTBIssuerReport Job is Completed OK''
			else '' FRTBIssuerReport Job is not yet Completed KO'' end as result
	from FT_WF_WFDF WFDF, FT_WF_WFRI WFRI 
		where WFDF.workflow_id = WFRI.workflow_id 
		and WFDF.workflow_id = (SELECT workflow_id FROM FT_WF_WFDF WHERE workflow_nme = ''FRTBReport'' AND workflow_stat_typ = ''RELEASED''
        ORDER BY workflow_ver_num DESC LIMIT 1) and WFRI.wf_runtime_stat_typ = ''DONE''	and WFRI.workflow_start_tms::DATE = SYSDATE()::DATE
		AND (workflow_start_tms::time BETWEEN time ''16:00'' AND time ''16:15'')',
NULL, NULL, 'RESULT',
'gsodmonitoring@thegoldensource.com',
'ODAlerts@thegoldensource.com',
'N','N','N','N'
FROM dual
WHERE NOT EXISTS
      (SELECT 1 FROM ft_m_jbcf WHERE job_name='FRTBIssuerReport');


-- 30) source: IsdaMonthly.schedule.json
INSERT INTO ft_m_jbcf
(jbcf_oid, job_name, job_desc, job_typ, job_run_day, job_start_time, job_end_time,
 job_run_freq, exp_run_dur, last_chg_tms, start_tms, end_tms,
 in_query, pub_query, val_query, result_column,
 to_mail, info_mail, task_start_check, multi_check, holiday_check, range_check)
SELECT new_oid(), 'IsdaMonthly', 'IsdaMonthly Job', 'Fileload',
       'MON,TUE,WED,THU,FRI,SAT,SUN', '07:00', '07:15', '1', 5,
       SYSDATE(), SYSDATE(), NULL,
		'select max(WFRI.workflow_start_tms)::text as job_id, 
		case  when current_date <> date_trunc(''month'', current_date)::date
            then ''IsdaMonthly - not first day of month - OK''	
		when count(*)> 0 
			then '' IsdaMonthly Job is Completed OK''
			else '' IsdaMonthly Job is not yet Completed KO'' end as result
	from FT_WF_WFDF WFDF, FT_WF_WFRI WFRI 
		where WFDF.workflow_id = WFRI.workflow_id 
		and WFDF.workflow_id = (SELECT workflow_id FROM FT_WF_WFDF WHERE workflow_nme = ''IsdaMonthly'' AND workflow_stat_typ = ''RELEASED''
        ORDER BY workflow_ver_num DESC LIMIT 1) and WFRI.wf_runtime_stat_typ = ''DONE''	and WFRI.workflow_start_tms::DATE = SYSDATE()::DATE
		AND (workflow_start_tms::time BETWEEN time ''07:00'' AND time ''07:15'')',
NULL, NULL, 'RESULT',
'gsodmonitoring@thegoldensource.com',
'ODAlerts@thegoldensource.com',
'N','N','N','N'
FROM dual
WHERE NOT EXISTS
      (SELECT 1 FROM ft_m_jbcf WHERE job_name='IsdaMonthly');

-- 31) source: IssuerMergeInstructionsSchedule.schedule.json
-- This Job is not required as per ADITLO

-- 32) source: MHSA_ListingReport.schedule.json
INSERT INTO ft_m_jbcf
( jbcf_oid, job_name, job_desc, job_typ, job_run_day, job_start_time, job_end_time,
  job_run_freq, exp_run_dur, last_chg_tms, start_tms, end_tms,
  in_query, pub_query, val_query, result_column,
  to_mail, info_mail, task_start_check, multi_check, holiday_check, range_check )
SELECT new_oid(), 'MHSA_ListingReport', 'MHSA_ListingReport Job', 'Fileload',
       'MON,TUE,WED,THU,FRI', '13:30', '13:45', '1', 5,
       SYSDATE(), SYSDATE(), NULL,
		'select max(WFRI.workflow_start_tms)::text as job_id, 
		case when count(*)> 0 
			then '' MHSA_ListingReport Job is Completed OK''
			else '' MHSA_ListingReport Job is not yet Completed KO'' end as result
	from FT_WF_WFDF WFDF, FT_WF_WFRI WFRI 
		where WFDF.workflow_id = WFRI.workflow_id 
		and WFDF.workflow_id = (SELECT workflow_id FROM FT_WF_WFDF WHERE workflow_nme = ''MHSA_Report'' AND workflow_stat_typ = ''RELEASED''
        ORDER BY workflow_ver_num DESC LIMIT 1) and WFRI.wf_runtime_stat_typ = ''DONE''	and WFRI.workflow_start_tms::DATE = SYSDATE()::DATE
		AND (workflow_start_tms::time BETWEEN time ''13:30'' AND time ''13:45'')',
NULL, NULL, 'RESULT',
'gsodmonitoring@thegoldensource.com',
'ODAlerts@thegoldensource.com',
'N','N','N','N'
FROM dual
WHERE NOT EXISTS (
      SELECT 1 FROM ft_m_jbcf WHERE job_name='MHSA_ListingReport'
);


-- 33)a source: MoodysInstrumentRatings.schedule.json
INSERT INTO ft_m_jbcf
( jbcf_oid, job_name, job_desc, job_typ, job_run_day, job_start_time, job_end_time,
  job_run_freq, exp_run_dur, last_chg_tms, start_tms, end_tms,
  in_query, pub_query, val_query, result_column,
  to_mail, info_mail, task_start_check, multi_check, holiday_check, range_check )
SELECT new_oid(), 'MoodysInstrumentRatings', 'MoodysInstrumentRatings morning Job', 'Fileload',
       'MON,TUE,WED,THU,FRI,SAT', '05:00', '05:45', '1', 30,
       SYSDATE(), SYSDATE(), NULL,
'select max(job_id) as job_id,
        case when count(*) > 0
             then reverse(split_part(reverse(max(job_input_txt)), ''/'',''1'')) || '' is Loaded OK''
             else ''MoodysInstrumentRatings is not yet Loaded KO'' end as result
 from ft_t_jblg
 where job_input_txt ~ ''.*/gold/GSFTP/files/MoodysRDS2/Output/cfg_inst_current_rating_Utf8_12Hour_Delta.*.split''
   and job_start_tms::date >= sysdate()::date AND (job_start_tms::time BETWEEN time ''05:00'' AND time ''05:45'')
 and job_stat_typ = ''CLOSED''',
NULL, NULL, 'RESULT',
'gsodmonitoring@thegoldensource.com',
'ODAlerts@thegoldensource.com',
'N','N','N','N'
FROM dual
;

-- 33)b source: MoodysInstrumentRatings.schedule.json
INSERT INTO ft_m_jbcf
( jbcf_oid, job_name, job_desc, job_typ, job_run_day, job_start_time, job_end_time,
  job_run_freq, exp_run_dur, last_chg_tms, start_tms, end_tms,
  in_query, pub_query, val_query, result_column,
  to_mail, info_mail, task_start_check, multi_check, holiday_check, range_check )
SELECT new_oid(), 'MoodysInstrumentRatings', 'MoodysInstrumentRatings evening Job', 'Fileload',
       'MON,TUE,WED,THU,FRI,SAT', '14:00', '14:45', '1', 30,
       SYSDATE(), SYSDATE(), NULL,
'select max(job_id) as job_id,
        case when count(*) > 0
             then reverse(split_part(reverse(max(job_input_txt)), ''/'',''1'')) || '' is Loaded OK''
             else ''MoodysInstrumentRatings is not yet Loaded KO'' end as result
 from ft_t_jblg
 where job_input_txt ~ ''.*/gold/GSFTP/files/MoodysRDS2/Output/cfg_inst_current_rating_Utf8_12Hour_Delta.*.split''
   and job_start_tms::date >= sysdate()::date AND (job_start_tms::time BETWEEN time ''14:00'' AND time ''14:45'')
 and job_stat_typ = ''CLOSED''',
NULL, NULL, 'RESULT',
'gsodmonitoring@thegoldensource.com',
'ODAlerts@thegoldensource.com',
'N','N','N','N'
FROM dual
;

-- 34)a source: MoodysOrganizationRatings.schedule.json
INSERT INTO ft_m_jbcf
( jbcf_oid, job_name, job_desc, job_typ, job_run_day, job_start_time, job_end_time,
  job_run_freq, exp_run_dur, last_chg_tms, start_tms, end_tms,
  in_query, pub_query, val_query, result_column,
  to_mail, info_mail, task_start_check, multi_check, holiday_check, range_check )
SELECT new_oid(), 'MoodysOrganizationRatings', 'MoodysOrganizationRatings morning Job', 'Fileload',
       'MON,TUE,WED,THU,FRI,SAT', '04:00', '04:45', '1', 30,
       SYSDATE(), SYSDATE(), NULL,
'select max(job_id) as job_id,
        case when count(*) > 0
             then reverse(split_part(reverse(max(job_input_txt)), ''/'',''1'')) || '' is Loaded OK''
             else ''MoodysOrganizationRatings is not yet Loaded KO'' end as result
 from ft_t_jblg
 where job_input_txt ~ ''.*/gold/GSFTP/files/MoodysRDS2/Output/cfg_organization_current_rating_Utf8_12Hour_Delta.*.split''
   and job_start_tms::date >= sysdate()::date AND (job_start_tms::time BETWEEN time ''04:00'' AND time ''04:45'')
 and job_stat_typ = ''CLOSED''',
NULL, NULL, 'RESULT',
'gsodmonitoring@thegoldensource.com',
'ODAlerts@thegoldensource.com',
'N','N','N','N'
FROM dual
;

-- 34)b source: MoodysOrganizationRatings.schedule.json
INSERT INTO ft_m_jbcf
( jbcf_oid, job_name, job_desc, job_typ, job_run_day, job_start_time, job_end_time,
  job_run_freq, exp_run_dur, last_chg_tms, start_tms, end_tms,
  in_query, pub_query, val_query, result_column,
  to_mail, info_mail, task_start_check, multi_check, holiday_check, range_check )
SELECT new_oid(), 'MoodysOrganizationRating', 'MoodysOrganizationRatings evening Job', 'Fileload',
       'MON,TUE,WED,THU,FRI,SAT', '13:00', '13:45', '1', 30,
       SYSDATE(), SYSDATE(), NULL,
'select max(job_id) as job_id,
        case when count(*) > 0
             then reverse(split_part(reverse(max(job_input_txt)), ''/'',''1'')) || '' is Loaded OK''
             else ''MoodysOrganizationRatings is not yet Loaded KO'' end as result
 from ft_t_jblg
 where job_input_txt ~ ''.*/gold/GSFTP/files/MoodysRDS2/Output/cfg_organization_current_rating_Utf8_12Hour_Delta.*.split''
   and job_start_tms::date >= sysdate()::date AND (job_start_tms::time BETWEEN time ''13:00'' AND time ''13:45'')
 and job_stat_typ = ''CLOSED''',
NULL, NULL, 'RESULT',
'gsodmonitoring@thegoldensource.com',
'ODAlerts@thegoldensource.com',
'N','N','N','N'
FROM dual
;


-- 35) source: MoodysOrganizationRatingsAdhocDailyFull.schedule.json
-- This Job is not required as per ADITLO


-- 36) source: MZ_24_ASSET_LOCK_SCH.schedule.json
INSERT INTO ft_m_jbcf
( jbcf_oid, job_name, job_desc, job_typ, job_run_day, job_start_time, job_end_time,
  job_run_freq, exp_run_dur, last_chg_tms, start_tms, end_tms,
  in_query, pub_query, val_query, result_column,
  to_mail, info_mail, task_start_check, multi_check, holiday_check, range_check )
SELECT new_oid(), 'MZ_24_ASSET_LOCK_SCH', 'MZ_24_ASSET_LOCK_SCH Job', 'Fileload',
       'MON,TUE,WED,THU,FRI,SAT,SUN', '07:00', '07:15', '1', 5,
       SYSDATE(), SYSDATE(), NULL,
		'select max(WFRI.workflow_start_tms)::text as job_id, 
		case when count(*)> 0 
			then '' MZ_24_ASSET_LOCK_SCH Job is Completed OK''
			else '' MZ_24_ASSET_LOCK_SCH Job is not yet Completed KO'' end as result
	from FT_WF_WFDF WFDF, FT_WF_WFRI WFRI 
		where WFDF.workflow_id = WFRI.workflow_id 
		and WFDF.workflow_id = (SELECT workflow_id FROM FT_WF_WFDF WHERE workflow_nme = ''MZ_24_Asset_Lock_Report'' AND workflow_stat_typ = ''RELEASED''
        ORDER BY workflow_ver_num DESC LIMIT 1) and WFRI.wf_runtime_stat_typ = ''DONE''	and WFRI.workflow_start_tms::DATE = SYSDATE()::DATE
		AND (workflow_start_tms::time BETWEEN time ''07:00'' AND time ''07:15'')',
NULL, NULL, 'RESULT',
'gsodmonitoring@thegoldensource.com',
'ODAlerts@thegoldensource.com',
'N','N','N','N'
FROM dual
WHERE NOT EXISTS (
      SELECT 1 FROM ft_m_jbcf WHERE job_name='MZ_24_ASSET_LOCK_SCH'
);


-- 37) source: MZ_ALL_ASSET_LOCK_SCH.schedule.json
INSERT INTO ft_m_jbcf
( jbcf_oid, job_name, job_desc, job_typ, job_run_day, job_start_time, job_end_time,
  job_run_freq, exp_run_dur, last_chg_tms, start_tms, end_tms,
  in_query, pub_query, val_query, result_column,
  to_mail, info_mail, task_start_check, multi_check, holiday_check, range_check )
SELECT new_oid(), 'MZ_ALL_ASSET_LOCK_SCH', 'MZ_ALL_ASSET_LOCK_SCH Job', 'Fileload',
       'MON,TUE,WED,THU,FRI', '07:00', '07:15', '1', 5,
       SYSDATE(), SYSDATE(), NULL,
		'select max(WFRI.workflow_start_tms)::text as job_id, 
		case when count(*)> 0 
			then '' MZ_ALL_ASSET_LOCK_SCH Job is Completed OK''
			else '' MZ_ALL_ASSET_LOCK_SCH Job is not yet Completed KO'' end as result
	from FT_WF_WFDF WFDF, FT_WF_WFRI WFRI 
		where WFDF.workflow_id = WFRI.workflow_id 
		and WFDF.workflow_id = (SELECT workflow_id FROM FT_WF_WFDF WHERE workflow_nme = ''MZ_All_Asset_Lock_Report'' AND workflow_stat_typ = ''RELEASED''
        ORDER BY workflow_ver_num DESC LIMIT 1) and WFRI.wf_runtime_stat_typ = ''DONE''	and WFRI.workflow_start_tms::DATE = SYSDATE()::DATE
		AND (workflow_start_tms::time BETWEEN time ''07:00'' AND time ''07:15'')',
NULL, NULL, 'RESULT',
'gsodmonitoring@thegoldensource.com',
'ODAlerts@thegoldensource.com',
'N','N','N','N'
FROM dual
WHERE NOT EXISTS (
      SELECT 1 FROM ft_m_jbcf WHERE job_name='MZ_ALL_ASSET_LOCK_SCH'
);


-- 38) source: MZ_ASOF_DATE_Report.schedule.json
INSERT INTO ft_m_jbcf
( jbcf_oid, job_name, job_desc, job_typ, job_run_day, job_start_time, job_end_time,
  job_run_freq, exp_run_dur, last_chg_tms, start_tms, end_tms,
  in_query, pub_query, val_query, result_column,
  to_mail, info_mail, task_start_check, multi_check, holiday_check, range_check )
SELECT new_oid(), 'MZ_ASOF_DATE_Report', 'MZ_ASOF_DATE_Report Job', 'Fileload',
      'MON,TUE,WED,THU,FRI', '07:00', '07:15', '1', 5,
       SYSDATE(), SYSDATE(), NULL,
		'select max(WFRI.workflow_start_tms)::text as job_id, 
		case when count(*)> 0 
			then '' MZ_ASOF_DATE_Report Job is Completed OK''
			else '' MZ_ASOF_DATE_Report Job is not yet Completed KO'' end as result
	from FT_WF_WFDF WFDF, FT_WF_WFRI WFRI 
		where WFDF.workflow_id = WFRI.workflow_id 
		and WFDF.workflow_id = (SELECT workflow_id FROM FT_WF_WFDF WHERE workflow_nme = ''MZ_ASOF_Dates_Report'' AND workflow_stat_typ = ''RELEASED''
        ORDER BY workflow_ver_num DESC LIMIT 1) and WFRI.wf_runtime_stat_typ = ''DONE''	and WFRI.workflow_start_tms::DATE = SYSDATE()::DATE
		AND (workflow_start_tms::time BETWEEN time ''07:00'' AND time ''07:15'')',
NULL, NULL, 'RESULT',
'gsodmonitoring@thegoldensource.com',
'ODAlerts@thegoldensource.com',
'N','N','N','N'
FROM dual
WHERE NOT EXISTS (
      SELECT 1 FROM ft_m_jbcf WHERE job_name='MZ_ASOF_DATE_Report'
);


-- 39) source: MZ_FATAL_ERRORS_SCH.schedule.json
INSERT INTO ft_m_jbcf
( jbcf_oid, job_name, job_desc, job_typ, job_run_day, job_start_time, job_end_time,
  job_run_freq, exp_run_dur, last_chg_tms, start_tms, end_tms,
  in_query, pub_query, val_query, result_column,
  to_mail, info_mail, task_start_check, multi_check, holiday_check, range_check )
SELECT new_oid(), 'MZ_FATAL_ERRORS_SCH', 'MZ_FATAL_ERRORS_SCH Job', 'Fileload',
       'MON,TUE,WED,THU,FRI,SAT,SUN', '05:00', '05:15', '1', 5,
       SYSDATE(), SYSDATE(), NULL,
		'select max(WFRI.workflow_start_tms)::text as job_id, 
		case when count(*)> 0 
			then '' MZ_FATAL_ERRORS_SCH Job is Completed OK''
			else '' MZ_FATAL_ERRORS_SCH Job is not yet Completed KO'' end as result
	from FT_WF_WFDF WFDF, FT_WF_WFRI WFRI 
		where WFDF.workflow_id = WFRI.workflow_id 
		and WFDF.workflow_id = (SELECT workflow_id FROM FT_WF_WFDF WHERE workflow_nme = ''MZ_FATAL_ERRORS_Report'' AND workflow_stat_typ = ''RELEASED''
        ORDER BY workflow_ver_num DESC LIMIT 1) and WFRI.wf_runtime_stat_typ = ''DONE''	and WFRI.workflow_start_tms::DATE = SYSDATE()::DATE
		AND (workflow_start_tms::time BETWEEN time ''05:00'' AND time ''05:15'')',
NULL, NULL, 'RESULT',
'gsodmonitoring@thegoldensource.com',
'ODAlerts@thegoldensource.com',
'N','N','N','N'
FROM dual
WHERE NOT EXISTS (
      SELECT 1 FROM ft_m_jbcf WHERE job_name='MZ_FATAL_ERRORS_SCH'
);


-- 40) source: MZ_FENERGO_ID_rep_SCH.schedule.json
-- This Job is not required as per ADITLO

-- 41) MZ_Issuer_Ratings_Report
INSERT INTO ft_m_jbcf
( jbcf_oid, job_name, job_desc, job_typ, job_run_day, job_start_time, job_end_time,
  job_run_freq, exp_run_dur, last_chg_tms, start_tms, end_tms,
  in_query, pub_query, val_query, result_column,
  to_mail, info_mail, task_start_check, multi_check, holiday_check, range_check )
SELECT new_oid(), 'MZ_Issuer_Ratings_Report', 'MZ_Issuer_Ratings_Report Job', 'Fileload',
       'MON', '00:01', '00:15', '1', 5,
       SYSDATE(), SYSDATE(), NULL,
		'select max(WFRI.workflow_start_tms)::text as job_id, 
		case when count(*)> 0 
			then '' MZ_Issuer_Ratings_Report Job is Completed OK''
			else '' MZ_Issuer_Ratings_Report Job is not yet Completed KO'' end as result
	from FT_WF_WFDF WFDF, FT_WF_WFRI WFRI 
		where WFDF.workflow_id = WFRI.workflow_id 
		and WFDF.workflow_id = (SELECT workflow_id FROM FT_WF_WFDF WHERE workflow_nme = ''MZ_Internal_Ratings_Report'' AND workflow_stat_typ = ''RELEASED''
        ORDER BY workflow_ver_num DESC LIMIT 1) and WFRI.wf_runtime_stat_typ = ''DONE''	and WFRI.workflow_start_tms::DATE = SYSDATE()::DATE
		AND (workflow_start_tms::time BETWEEN time ''00:01'' AND time ''00:15'')',
 NULL, NULL, 'RESULT',
 'gsodmonitoring@thegoldensource.com',
 'ODAlerts@thegoldensource.com',
 'N','N','N','N'
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM ft_m_jbcf WHERE job_name='MZ_Issuer_Ratings_Report');


-- 42) MZ_MTN_ISIN_Change_Report
INSERT INTO ft_m_jbcf
( jbcf_oid, job_name, job_desc, job_typ, job_run_day, job_start_time, job_end_time,
  job_run_freq, exp_run_dur, last_chg_tms, start_tms, end_tms,
  in_query, pub_query, val_query, result_column,
  to_mail, info_mail, task_start_check, multi_check, holiday_check, range_check )
SELECT new_oid(), 'MZ_MTN_ISIN_Change_Report', 'MZ_MTN_ISIN_Change_Report Job', 'Fileload',
       'MON,TUE,WED,THU,FRI,SAT,SUN', '17:00', '17:15', '1', 5,
       SYSDATE(), SYSDATE(), NULL,
		'select max(WFRI.workflow_start_tms)::text as job_id, 
		case when count(*)> 0 
			then '' MZ_MTN_ISIN_Change_Report Job is Completed OK''
			else '' MZ_MTN_ISIN_Change_Report Job is not yet Completed KO'' end as result
	from FT_WF_WFDF WFDF, FT_WF_WFRI WFRI 
		where WFDF.workflow_id = WFRI.workflow_id 
		and WFDF.workflow_id = (SELECT workflow_id FROM FT_WF_WFDF WHERE workflow_nme = ''MZ_MTN_ISIN_Change_Report'' AND workflow_stat_typ = ''RELEASED''
        ORDER BY workflow_ver_num DESC LIMIT 1) and WFRI.wf_runtime_stat_typ = ''DONE''	and WFRI.workflow_start_tms::DATE = SYSDATE()::DATE
		AND (workflow_start_tms::time BETWEEN time ''17:00'' AND time ''17:15'')',
 NULL, NULL, 'RESULT',
 'gsodmonitoring@thegoldensource.com',
 'ODAlerts@thegoldensource.com',
 'N','N','N','N'
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM ft_m_jbcf WHERE job_name='MZ_MTN_ISIN_Change_Report');


-- 43) MZ_MULTI_PROD_OID_SCH
INSERT INTO ft_m_jbcf
( jbcf_oid, job_name, job_desc, job_typ, job_run_day, job_start_time, job_end_time,
  job_run_freq, exp_run_dur, last_chg_tms, start_tms, end_tms,
  in_query, pub_query, val_query, result_column,
  to_mail, info_mail, task_start_check, multi_check, holiday_check, range_check )
SELECT new_oid(), 'MZ_MULTI_PROD_OID_SCH', 'MZ_MULTI_PROD_OID_SCH Job', 'Fileload',
       'MON,TUE,WED,THU,FRI,SAT,SUN', '06:00', '06:15', '1', 5,
       SYSDATE(), SYSDATE(), NULL,
'select max(WFRI.workflow_start_tms)::text as job_id, 
		case when count(*)> 0 
			then '' MZ_MULTI_PROD_OID_SCH Job is Completed OK''
			else '' MZ_MULTI_PROD_OID_SCH Job is not yet Completed KO'' end as result
	from FT_WF_WFDF WFDF, FT_WF_WFRI WFRI 
		where WFDF.workflow_id = WFRI.workflow_id 
		and WFDF.workflow_id = (SELECT workflow_id FROM FT_WF_WFDF WHERE workflow_nme = ''MZ_MULTI_PRODUCTOID_Report'' AND workflow_stat_typ = ''RELEASED''
        ORDER BY workflow_ver_num DESC LIMIT 1) and WFRI.wf_runtime_stat_typ = ''DONE''	and WFRI.workflow_start_tms::DATE = SYSDATE()::DATE
		AND (workflow_start_tms::time BETWEEN time ''06:00'' AND time ''06:15'')',
 NULL, NULL, 'RESULT',
 'gsodmonitoring@thegoldensource.com',
 'ODAlerts@thegoldensource.com',
 'N','N','N','N'
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM ft_m_jbcf WHERE job_name='MZ_MULTI_PROD_OID_SCH');


-- 44)a MZ_PM_asset_Failed_SCH
INSERT INTO ft_m_jbcf
SELECT new_oid(), 'MZ_PM_asset_Failed_SCH', 'MZ_PM_asset_Failed_SCH Job', 'Fileload',
       'MON,TUE,WED,THU,FRI,SAT,SUN', '06:00', '06:15', '1', 5,
       SYSDATE(), SYSDATE(), NULL,
'select max(WFRI.workflow_start_tms)::text as job_id, 
		case when count(*)> 0 
			then '' MZ_PM_asset_Failed_SCH 6AM Job is Completed OK''
			else '' MZ_PM_asset_Failed_SCH 6AM Job is not yet Completed KO'' end as result
	from FT_WF_WFDF WFDF, FT_WF_WFRI WFRI 
		where WFDF.workflow_id = WFRI.workflow_id 
		and WFDF.workflow_id = (SELECT workflow_id FROM FT_WF_WFDF WHERE workflow_nme = ''PM_Asset_failed_Report'' AND workflow_stat_typ = ''RELEASED''
        ORDER BY workflow_ver_num DESC LIMIT 1) and WFRI.wf_runtime_stat_typ = ''DONE''	and WFRI.workflow_start_tms::DATE = SYSDATE()::DATE
		AND (workflow_start_tms::time BETWEEN time ''06:00'' AND time ''06:15'')',
 NULL, NULL, 'RESULT',
 'gsodmonitoring@thegoldensource.com',
 'ODAlerts@thegoldensource.com',
 'N','N','N','N'
FROM dual
;


-- 44)b MZ_PM_asset_Failed_SCH
INSERT INTO ft_m_jbcf
SELECT new_oid(), 'MZ_PM_asset_Failed_SCH', 'MZ_PM_asset_Failed_SCH Job', 'Fileload',
       'MON,TUE,WED,THU,FRI,SAT,SUN', '09:00', '09:15', '1', 5,
       SYSDATE(), SYSDATE(), NULL,
'select max(WFRI.workflow_start_tms)::text as job_id, 
		case when count(*)> 0 
			then '' MZ_PM_asset_Failed_SCH 9AM Job is Completed OK''
			else '' MZ_PM_asset_Failed_SCH 9AM Job is not yet Completed KO'' end as result
	from FT_WF_WFDF WFDF, FT_WF_WFRI WFRI 
		where WFDF.workflow_id = WFRI.workflow_id 
		and WFDF.workflow_id = (SELECT workflow_id FROM FT_WF_WFDF WHERE workflow_nme = ''PM_Asset_failed_Report'' AND workflow_stat_typ = ''RELEASED''
        ORDER BY workflow_ver_num DESC LIMIT 1) and WFRI.wf_runtime_stat_typ = ''DONE''	and WFRI.workflow_start_tms::DATE = SYSDATE()::DATE
		AND (workflow_start_tms::time BETWEEN time ''09:00'' AND time ''09:15'')',
 NULL, NULL, 'RESULT',
 'gsodmonitoring@thegoldensource.com',
 'ODAlerts@thegoldensource.com',
 'N','N','N','N'
FROM dual
;


-- 45) MZ_PortfolioDifferenceReport
INSERT INTO ft_m_jbcf
SELECT new_oid(), 'MZ_PortfolioDifferenceReport', 'MZ_PortfolioDifferenceReport Job', 'Fileload',
       'MON,TUE,WED,THU,FRI', '06:00', '06:15', '1', 5,
       SYSDATE(), SYSDATE(), NULL,
'select max(WFRI.workflow_start_tms)::text as job_id, 
		case when count(*)> 0 
			then '' MZ_PortfolioDifferenceReport Job is Completed OK''
			else '' MZ_PortfolioDifferenceReport Job is not yet Completed KO'' end as result
	from FT_WF_WFDF WFDF, FT_WF_WFRI WFRI 
		where WFDF.workflow_id = WFRI.workflow_id 
		and WFDF.workflow_id = (SELECT workflow_id FROM FT_WF_WFDF WHERE workflow_nme = ''MZ_PortfolioDifferenceReport'' AND workflow_stat_typ = ''RELEASED''
        ORDER BY workflow_ver_num DESC LIMIT 1) and WFRI.wf_runtime_stat_typ = ''DONE''	and WFRI.workflow_start_tms::DATE = SYSDATE()::DATE
		AND (workflow_start_tms::time BETWEEN time ''06:00'' AND time ''06:15'')',
 NULL, NULL, 'RESULT',
 'gsodmonitoring@thegoldensource.com',
 'ODAlerts@thegoldensource.com',
 'N','N','N','N'
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM ft_m_jbcf WHERE job_name='MZ_PortfolioDifferenceReport');


-- 46) MZ_TEMP_ISSR_SCH
INSERT INTO ft_m_jbcf
SELECT new_oid(), 'MZ_TEMP_ISSR_SCH', 'MZ_TEMP_ISSR_SCH Job', 'Fileload',
       'MON,TUE,WED,THU,FRI,SAT,SUN', '06:00', '06:15', '1', 5,
       SYSDATE(), SYSDATE(), NULL,
'select max(WFRI.workflow_start_tms)::text as job_id, 
		case when count(*)> 0 
			then '' MZ_TEMP_ISSR_SCH Job is Completed OK''
			else '' MZ_TEMP_ISSR_SCH Job is not yet Completed KO'' end as result
	from FT_WF_WFDF WFDF, FT_WF_WFRI WFRI 
		where WFDF.workflow_id = WFRI.workflow_id 
		and WFDF.workflow_id = (SELECT workflow_id FROM FT_WF_WFDF WHERE workflow_nme = ''MZ_TEMP_ISSR_MATCH_Report'' AND workflow_stat_typ = ''RELEASED''
        ORDER BY workflow_ver_num DESC LIMIT 1) and WFRI.wf_runtime_stat_typ = ''DONE''	and WFRI.workflow_start_tms::DATE = SYSDATE()::DATE
		AND (workflow_start_tms::time BETWEEN time ''06:00'' AND time ''06:15'')',
 NULL, NULL, 'RESULT',
 'gsodmonitoring@thegoldensource.com',
 'ODAlerts@thegoldensource.com',
 'N','N','N','N'
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM ft_m_jbcf WHERE job_name='MZ_TEMP_ISSR_SCH');


-- 47) NewISINChange
INSERT INTO ft_m_jbcf
SELECT new_oid(), 'NewISINChange', 'NewISINChange Job', 'Fileload',
       'MON,TUE,WED,THU,FRI', '13:30', '13:45', '1', 5,
       SYSDATE(), SYSDATE(), NULL,
'select max(WFRI.workflow_start_tms)::text as job_id, 
		case when count(*)> 0 
			then '' NewISINChange Job is Completed OK''
			else '' NewISINChange Job is not yet Completed KO'' end as result
	from FT_WF_WFDF WFDF, FT_WF_WFRI WFRI 
		where WFDF.workflow_id = WFRI.workflow_id 
		and WFDF.workflow_id = (SELECT workflow_id FROM FT_WF_WFDF WHERE workflow_nme = ''ISINChange'' AND workflow_stat_typ = ''RELEASED''
        ORDER BY workflow_ver_num DESC LIMIT 1) and WFRI.wf_runtime_stat_typ = ''DONE''	and WFRI.workflow_start_tms::DATE = SYSDATE()::DATE
		AND (workflow_start_tms::time BETWEEN time ''13:30'' AND time ''13:45'')',
 NULL, NULL, 'RESULT',
 'gsodmonitoring@thegoldensource.com',
 'ODAlerts@thegoldensource.com',
 'N','N','N','N'
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM ft_m_jbcf WHERE job_name='NewISINChange');


-- 48) ProcessDirFileMHI_HQLA
-- Added at the bottom for Every hour run


-- 49) ProcessDirFileMTN_EMD
-- This Alert is not required as per ADITLO


-- 50) RecalculatePortfolio
-- Added at bottom

-- 51) ScheduleBulkMerge
INSERT INTO ft_m_jbcf
SELECT new_oid(), 'ScheduleBulkMerge', 'ScheduleBulkMerge Job', 'Fileload',
       'MON,TUE,WED,THU,FRI,SAT,SUN', '17:00', '17:30', '1', 15,
       SYSDATE(), SYSDATE(), NULL,
'select max(job_id) as job_id,
        case when count(*) > 0
            then ''ScheduleBulkMerge is Processed OK''
            else ''ScheduleBulkMerge is not yet Processed KO'' end as result
 from ft_t_jblg
 where job_config_txt ~ ''Process Merge Instructions''
   and job_start_tms::date >= sysdate()::date and job_stat_typ = ''CLOSED''',
 NULL,NULL,'RESULT',
 'gsodmonitoring@thegoldensource.com',
 'ODAlerts@thegoldensource.com',
 'N','N','N','N'
FROM dual
WHERE NOT EXISTS ( SELECT 1 FROM ft_m_jbcf WHERE job_name='ScheduleBulkMerge');

-- 53) SnPRatingsChangesV4
INSERT INTO ft_m_jbcf
SELECT new_oid(), 'SnPRatingsChangesV4', 'SnPRatingsChangesV4 Job', 'Fileload',
       'MON,TUE,WED,THU,FRI,SAT,SUN', '06:00', '07:00', '1', 15,
       SYSDATE(), SYSDATE(), NULL,
'select max(job_id) as job_id,
        case when count(*) > 0
            then reverse(split_part(reverse(max(job_input_txt)),''/'',''1'')) || '' is Loaded OK''
            else ''SnPRatingsChangesV4 is not yet Loaded KO'' end as result
 from ft_t_jblg
 where job_input_txt ~ ''.*/gold/GSFTP/files/sandp/v4/Delta/.*/sp.*..*'' and job_msg_typ ~ ''SP_XF_GR_.*''
   and job_start_tms::date >= sysdate()::date and job_stat_typ = ''CLOSED''',
 NULL,NULL,'RESULT',
 'gsodmonitoring@thegoldensource.com',
 'ODAlerts@thegoldensource.com',
 'N','N','N','N'
FROM dual
WHERE NOT EXISTS ( SELECT 1 FROM ft_m_jbcf WHERE job_name='SnPRatingsChangesV4');

-- 55) SnPSeedV4
INSERT INTO ft_m_jbcf
SELECT new_oid(), 'SnPSeedV4', 'SnPSeedV4 Job', 'Fileload',
       'SUN', '12:30', '15:30', '1', 135,
       SYSDATE(), SYSDATE(), NULL,
'select max(job_id) as job_id,
        case when count(*) > 0
            then reverse(split_part(reverse(max(job_input_txt)),''/'',''1'')) || '' is Loaded OK''
            else ''SnPSeedV4 is not yet Loaded KO'' end as result
 from ft_t_jblg
 where job_input_txt ~ ''.*/gold/GSFTP/files/sandp/v4/FullFiles/.*/sp.*..*'' and job_msg_typ ~ ''SP_XF_GR_.*''
   and job_start_tms::date >= sysdate()::date and job_stat_typ = ''CLOSED''',
 NULL,NULL,'RESULT',
 'gsodmonitoring@thegoldensource.com',
 'ODAlerts@thegoldensource.com',
 'N','N','N','N'
FROM dual
WHERE NOT EXISTS ( SELECT 1 FROM ft_m_jbcf WHERE job_name='SnPSeedV4');


-- 56)a SOIAdditionException
INSERT INTO ft_m_jbcf
SELECT new_oid(), 'SOIAdditionException', 'SOIAdditionException 9AM Job', 'Fileload',
       'MON,TUE,WED,THU,FRI', '09:00', '09:15', '1', 5,
       SYSDATE(), SYSDATE(), NULL,
'select max(WFRI.workflow_start_tms)::text as job_id, 
		case when count(*)> 0 
			then '' SOIAdditionException 9AM Job is Completed OK''
			else '' SOIAdditionException 9AM Job is not yet Completed KO'' end as result
	from FT_WF_WFDF WFDF, FT_WF_WFRI WFRI 
		where WFDF.workflow_id = WFRI.workflow_id 
		and WFDF.workflow_id = (SELECT workflow_id FROM FT_WF_WFDF WHERE workflow_nme = ''SOIException'' AND workflow_stat_typ = ''RELEASED''
        ORDER BY workflow_ver_num DESC LIMIT 1) and WFRI.wf_runtime_stat_typ = ''DONE''	and WFRI.workflow_start_tms::DATE = SYSDATE()::DATE
		AND (workflow_start_tms::time BETWEEN time ''09:00'' AND time ''09:15'') ',
 NULL,NULL,'RESULT',
 'gsodmonitoring@thegoldensource.com',
 'ODAlerts@thegoldensource.com',
 'N','N','N','N'
FROM dual
;


-- 56)b SOIAdditionException
INSERT INTO ft_m_jbcf
SELECT new_oid(), 'SOIAdditionException', 'SOIAdditionException 12PM Job', 'Fileload',
       'MON,TUE,WED,THU,FRI', '12:00', '12:15', '1', 5,
       SYSDATE(), SYSDATE(), NULL,
'select max(WFRI.workflow_start_tms)::text as job_id, 
		case when count(*)> 0 
			then '' SOIAdditionException 12PM Job is Completed OK''
			else '' SOIAdditionException 12PM Job is not yet Completed KO'' end as result
	from FT_WF_WFDF WFDF, FT_WF_WFRI WFRI 
		where WFDF.workflow_id = WFRI.workflow_id 
		and WFDF.workflow_id = (SELECT workflow_id FROM FT_WF_WFDF WHERE workflow_nme = ''SOIException'' AND workflow_stat_typ = ''RELEASED''
        ORDER BY workflow_ver_num DESC LIMIT 1) and WFRI.wf_runtime_stat_typ = ''DONE''	and WFRI.workflow_start_tms::DATE = SYSDATE()::DATE
		AND (workflow_start_tms::time BETWEEN time ''12:00'' AND time ''12:15'') ',
 NULL,NULL,'RESULT',
 'gsodmonitoring@thegoldensource.com',
 'ODAlerts@thegoldensource.com',
 'N','N','N','N'
FROM dual
;


-- 56)c SOIAdditionException
INSERT INTO ft_m_jbcf
SELECT new_oid(), 'SOIAdditionException', 'SOIAdditionException 3PM Job', 'Fileload',
       'MON,TUE,WED,THU,FRI', '15:00', '15:15', '1', 5,
       SYSDATE(), SYSDATE(), NULL,
'select max(WFRI.workflow_start_tms)::text as job_id, 
		case when count(*)> 0 
			then '' SOIAdditionException 3PM Job is Completed OK''
			else '' SOIAdditionException 3PM Job is not yet Completed KO'' end as result
	from FT_WF_WFDF WFDF, FT_WF_WFRI WFRI 
		where WFDF.workflow_id = WFRI.workflow_id 
		and WFDF.workflow_id = (SELECT workflow_id FROM FT_WF_WFDF WHERE workflow_nme = ''SOIException'' AND workflow_stat_typ = ''RELEASED''
        ORDER BY workflow_ver_num DESC LIMIT 1) and WFRI.wf_runtime_stat_typ = ''DONE''	and WFRI.workflow_start_tms::DATE = SYSDATE()::DATE
		AND (workflow_start_tms::time BETWEEN time ''15:00'' AND time ''15:15'') ',
 NULL,NULL,'RESULT',
 'gsodmonitoring@thegoldensource.com',
 'ODAlerts@thegoldensource.com',
 'N','N','N','N'
FROM dual
;


-- 56)d SOIAdditionException
INSERT INTO ft_m_jbcf
SELECT new_oid(), 'SOIAdditionException', 'SOIAdditionException 5PM Job', 'Fileload',
       'MON,TUE,WED,THU,FRI', '17:00', '17:15', '1', 5,
       SYSDATE(), SYSDATE(), NULL,
'select max(WFRI.workflow_start_tms)::text as job_id, 
		case when count(*)> 0 
			then '' SOIAdditionException 5PM Job is Completed OK''
			else '' SOIAdditionException 5PM Job is not yet Completed KO'' end as result
	from FT_WF_WFDF WFDF, FT_WF_WFRI WFRI 
		where WFDF.workflow_id = WFRI.workflow_id 
		and WFDF.workflow_id = (SELECT workflow_id FROM FT_WF_WFDF WHERE workflow_nme = ''SOIException'' AND workflow_stat_typ = ''RELEASED''
        ORDER BY workflow_ver_num DESC LIMIT 1) and WFRI.wf_runtime_stat_typ = ''DONE''	and WFRI.workflow_start_tms::DATE = SYSDATE()::DATE
		AND (workflow_start_tms::time BETWEEN time ''17:00'' AND time ''17:15'') ',
 NULL,NULL,'RESULT',
 'gsodmonitoring@thegoldensource.com',
 'ODAlerts@thegoldensource.com',
 'N','N','N','N'
FROM dual
;


-- 57) SwapsMonitor
INSERT INTO ft_m_jbcf
SELECT new_oid(), 'SwapsMonitor', 'SwapsMonitor Job', 'Fileload',
       'MON,TUE,WED,THU,FRI,SAT,SUN', '22:00', '23:00', '1', 45,
       SYSDATE(), SYSDATE(), NULL,
'select max(job_id) as job_id,
        case when count(*) > 0
            then ''SwapsMonitor is Loaded OK''
            else ''SwapsMonitor is not Loaded in the last 15 days KO'' end as result
 from ft_t_jblg
 where job_input_txt ~ ''.*/swaps.*'' 
   and job_start_tms::date >= sysdate()::date - interval ''15 day'' and job_stat_typ = ''CLOSED''',
 NULL,NULL,'RESULT',
 'gsodmonitoring@thegoldensource.com',
 'ODAlerts@thegoldensource.com',
 'N','N','N','N'
FROM dual
WHERE NOT EXISTS ( SELECT 1 FROM ft_m_jbcf WHERE job_name='SwapsMonitor');


-- 58)a UltimateParentUpdatePublish
INSERT INTO ft_m_jbcf
SELECT new_oid(), 'UltimateParentUpdatePublish', 'UltimateParentUpdatePublish Job', 'Fileload',
       'MON,TUE,WED,THU,FRI,SAT,SUN', '14:15', '14:45', '1', 10,
       SYSDATE(), SYSDATE(), NULL,   
'select max(WFRI.workflow_start_tms)::text as job_id, 
		case when count(*)> 0 
			then '' UltimateParentUpdatePublish Job is Completed OK''
			else '' UltimateParentUpdatePublish Job is not yet Completed KO'' end as result
	from FT_WF_WFDF WFDF, FT_WF_WFRI WFRI 
		where WFDF.workflow_id = WFRI.workflow_id 
		and WFDF.workflow_id = (SELECT workflow_id FROM FT_WF_WFDF WHERE workflow_nme = ''MizPublishForUP'' AND workflow_stat_typ = ''RELEASED''
        ORDER BY workflow_ver_num DESC LIMIT 1) and WFRI.wf_runtime_stat_typ = ''DONE''	and WFRI.workflow_start_tms::DATE = SYSDATE()::DATE
		AND (workflow_start_tms::time BETWEEN time ''00:15'' AND time ''14:15'')',
 NULL,NULL,'RESULT',
 'gsodmonitoring@thegoldensource.com',
 'ODAlerts@thegoldensource.com',
 'N','N','N','N'
FROM dual;


-- 58)b UltimateParentUpdatePublish
INSERT INTO ft_m_jbcf
SELECT new_oid(), 'UltimateParentUpdatePublish', 'UltimateParentUpdatePublish Job', 'Fileload',
       'MON,TUE,WED,THU,FRI,SAT,SUN', '23:15', '23:45', '1', 10,
       SYSDATE(), SYSDATE(), NULL,   
'select max(WFRI.workflow_start_tms)::text as job_id, 
		case when count(*)> 0 
			then '' UltimateParentUpdatePublish Job is Completed OK''
			else '' UltimateParentUpdatePublish Job is not yet Completed KO'' end as result
	from FT_WF_WFDF WFDF, FT_WF_WFRI WFRI 
		where WFDF.workflow_id = WFRI.workflow_id 
		and WFDF.workflow_id = (SELECT workflow_id FROM FT_WF_WFDF WHERE workflow_nme = ''MizPublishForUP'' AND workflow_stat_typ = ''RELEASED''
        ORDER BY workflow_ver_num DESC LIMIT 1) and WFRI.wf_runtime_stat_typ = ''DONE''	and WFRI.workflow_start_tms::DATE = SYSDATE()::DATE
		AND (workflow_start_tms::time BETWEEN time ''14:15'' AND time ''23:15'')',
 NULL,NULL,'RESULT',
 'gsodmonitoring@thegoldensource.com',
 'ODAlerts@thegoldensource.com',
 'N','N','N','N'
FROM dual;



-- 59) MZ_BBUpdatesReport
INSERT INTO ft_m_jbcf
SELECT new_oid(), 'MZ_BBUpdatesReport', 'MZ_BBUpdatesReport Job', 'Fileload',
       'TUE,WED,THU,FRI', '07:00', '07:15', '1', 5,
       SYSDATE(), SYSDATE(), NULL,
'select max(WFRI.workflow_start_tms)::text as job_id, 
		case when count(*)> 0 
			then '' MZ_BBUpdatesReport Job is Completed OK''
			else '' MZ_BBUpdatesReport Job is not yet Completed KO'' end as result
	from FT_WF_WFDF WFDF, FT_WF_WFRI WFRI 
		where WFDF.workflow_id = WFRI.workflow_id 
		and WFDF.workflow_id = (SELECT workflow_id FROM FT_WF_WFDF WHERE workflow_nme = ''MZ_BBUpdatesReport'' AND workflow_stat_typ = ''RELEASED''
        ORDER BY workflow_ver_num DESC LIMIT 1) and WFRI.wf_runtime_stat_typ = ''DONE''	and WFRI.workflow_start_tms::DATE = SYSDATE()::DATE
		AND (workflow_start_tms::time BETWEEN time ''07:00'' AND time ''07:15'') ',
 NULL, NULL, 'RESULT',
 'gsodmonitoring@thegoldensource.com',
 'ODAlerts@thegoldensource.com',
 'N','N','N','N'
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM ft_m_jbcf WHERE job_name='MZ_BBUpdatesReport');

-- 60) MZ_BBUpdatesReport_WKEND
INSERT INTO ft_m_jbcf
SELECT new_oid(), 'MZ_BBUpdatesReport_WKEND', 'MZ_BBUpdatesReport_WKEND Job', 'Fileload',
       'MON', '07:00', '07:15', '1', 5,
       SYSDATE(), SYSDATE(), NULL,
'select max(WFRI.workflow_start_tms)::text as job_id, 
		case when count(*)> 0 
			then '' MZ_BBUpdatesReport_WKEND Job is Completed OK''
			else '' MZ_BBUpdatesReport_WKEND Job is not yet Completed KO'' end as result
	from FT_WF_WFDF WFDF, FT_WF_WFRI WFRI 
		where WFDF.workflow_id = WFRI.workflow_id 
		and WFDF.workflow_id = (SELECT workflow_id FROM FT_WF_WFDF WHERE workflow_nme = ''MZ_BBUpdatesReport'' AND workflow_stat_typ = ''RELEASED''
        ORDER BY workflow_ver_num DESC LIMIT 1) and WFRI.wf_runtime_stat_typ = ''DONE''	and WFRI.workflow_start_tms::DATE = SYSDATE()::DATE
		AND (workflow_start_tms::time BETWEEN time ''07:00'' AND time ''07:15'') ',
 NULL, NULL, 'RESULT',
 'gsodmonitoring@thegoldensource.com',
 'ODAlerts@thegoldensource.com',
 'N','N','N','N'
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM ft_m_jbcf WHERE job_name='MZ_BBUpdatesReport_WKEND');

-- 61) MZ_BoEUpdatesReport
INSERT INTO ft_m_jbcf
SELECT new_oid(), 'MZ_BoEUpdatesReport', 'MZ_BoEUpdatesReport Job', 'Fileload',
       'TUE,WED,THU,FRI', '06:45', '07:00', '1', 5,
       SYSDATE(), SYSDATE(), NULL,
'select max(WFRI.workflow_start_tms)::text as job_id, 
		case when count(*)> 0 
			then '' MZ_BoEUpdatesReport Job is Completed OK''
			else '' MZ_BoEUpdatesReport Job is not yet Completed KO'' end as result
	from FT_WF_WFDF WFDF, FT_WF_WFRI WFRI 
		where WFDF.workflow_id = WFRI.workflow_id 
		and WFDF.workflow_id = (SELECT workflow_id FROM FT_WF_WFDF WHERE workflow_nme = ''MZ_BoEUpdatesReport'' AND workflow_stat_typ = ''RELEASED''
        ORDER BY workflow_ver_num DESC LIMIT 1) and WFRI.wf_runtime_stat_typ = ''DONE''	and WFRI.workflow_start_tms::DATE = SYSDATE()::DATE
		AND (workflow_start_tms::time BETWEEN time ''06:45'' AND time ''07:00'') ',
 NULL, NULL, 'RESULT',
 'gsodmonitoring@thegoldensource.com',
 'ODAlerts@thegoldensource.com',
 'N','N','N','N'
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM ft_m_jbcf WHERE job_name='MZ_BoEUpdatesReport');

-- 62) MZ_BoEUpdatesReport_WKEND
INSERT INTO ft_m_jbcf
SELECT new_oid(), 'MZ_BoEUpdatesReport_WKEND', 'MZ_BoEUpdatesReport_WKEND Job', 'Fileload',
       'MON', '06:45', '07:00', '1', 5,
       SYSDATE(), SYSDATE(), NULL,
'select max(WFRI.workflow_start_tms)::text as job_id, 
		case when count(*)> 0 
			then '' MZ_BoEUpdatesReport_WKEND Job is Completed OK''
			else '' MZ_BoEUpdatesReport_WKEND Job is not yet Completed KO'' end as result
	from FT_WF_WFDF WFDF, FT_WF_WFRI WFRI 
		where WFDF.workflow_id = WFRI.workflow_id 
		and WFDF.workflow_id = (SELECT workflow_id FROM FT_WF_WFDF WHERE workflow_nme = ''MZ_BoEUpdatesReport'' AND workflow_stat_typ = ''RELEASED''
        ORDER BY workflow_ver_num DESC LIMIT 1) and WFRI.wf_runtime_stat_typ = ''DONE''	and WFRI.workflow_start_tms::DATE = SYSDATE()::DATE
		AND (workflow_start_tms::time BETWEEN time ''06:45'' AND time ''07:00'') ',
 NULL, NULL, 'RESULT',
 'gsodmonitoring@thegoldensource.com',
 'ODAlerts@thegoldensource.com',
 'N','N','N','N'
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM ft_m_jbcf WHERE job_name='MZ_BoEUpdatesReport_WKEND');

-- 63) RepoLendingMonthlyInstructed
INSERT INTO ft_m_jbcf
SELECT new_oid(), 'RepoLendingMonthlyInstructed', 'RepoLendingMonthlyInstructed Job', 'Fileload',
       'MON,TUE,WED,THU,FRI,SAT,SUN', '07:00', '07:15', '1', 5,
       SYSDATE(), SYSDATE(), NULL,
'select max(WFRI.workflow_start_tms)::text as job_id, 
		case when current_date <> date_trunc(''month'', current_date)::date
            then ''RepoLendingMonthlyInstructed - not first day of month - OK''			
		when count(*)> 0 
			then '' RepoLendingMonthlyInstructed Job is Completed OK''
			else '' RepoLendingMonthlyInstructed Job is not yet Completed KO'' end as result
	from FT_WF_WFDF WFDF, FT_WF_WFRI WFRI 
		where WFDF.workflow_id = WFRI.workflow_id 
		and WFDF.workflow_id = (SELECT workflow_id FROM FT_WF_WFDF WHERE workflow_nme = ''RepoLendingMonthlyInstructed'' AND workflow_stat_typ = ''RELEASED''
        ORDER BY workflow_ver_num DESC LIMIT 1) and WFRI.wf_runtime_stat_typ = ''DONE''	and WFRI.workflow_start_tms::DATE = SYSDATE()::DATE
		AND (workflow_start_tms::time BETWEEN time ''07:00'' AND time ''07:15'')',
 NULL, NULL, 'RESULT',
 'gsodmonitoring@thegoldensource.com',
 'ODAlerts@thegoldensource.com',
 'N','N','N','N'
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM ft_m_jbcf WHERE job_name='RepoLendingMonthlyInstructed');

-- 64) RepoLendingMonthlyOutstanding
INSERT INTO ft_m_jbcf
SELECT new_oid(), 'RepoLendingMonthlyOutstanding', 'RepoLendingMonthlyOutstanding Job', 'Fileload',
       'MON,TUE,WED,THU,FRI,SAT,SUN', '07:00', '07:15', '1', 5,
       SYSDATE(), SYSDATE(), NULL,
'select max(WFRI.workflow_start_tms)::text as job_id, 
		case when current_date <> date_trunc(''month'', current_date)::date
            then ''RepoLendingMonthlyOutstanding - not first day of month - OK''			
		when count(*)> 0 
			then '' RepoLendingMonthlyOutstanding Job is Completed OK''
			else '' RepoLendingMonthlyOutstanding Job is not yet Completed KO'' end as result
	from FT_WF_WFDF WFDF, FT_WF_WFRI WFRI 
		where WFDF.workflow_id = WFRI.workflow_id 
		and WFDF.workflow_id = (SELECT workflow_id FROM FT_WF_WFDF WHERE workflow_nme = ''RepoLendingMonthlyOutstanding'' AND workflow_stat_typ = ''RELEASED''
        ORDER BY workflow_ver_num DESC LIMIT 1) and WFRI.wf_runtime_stat_typ = ''DONE''	and WFRI.workflow_start_tms::DATE = SYSDATE()::DATE
		AND (workflow_start_tms::time BETWEEN time ''07:00'' AND time ''07:15'')',
 NULL, NULL, 'RESULT',
 'gsodmonitoring@thegoldensource.com',
 'ODAlerts@thegoldensource.com',
 'N','N','N','N'
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM ft_m_jbcf WHERE job_name='RepoLendingMonthlyOutstanding');



-- 50) RecalculatePortfolio
INSERT INTO ft_m_jbcf
SELECT new_oid(), 'RecalculatePortfolio', 'RecalculatePortfolio Job', 'Fileload',
       'MON,TUE,WED,THU,FRI,SAT,SUN', '08:30', '09:00', '1', 15,
       SYSDATE(), SYSDATE(), NULL,
'select max(WFRI.workflow_start_tms)::text as job_id, 
		case when count(*)> 0 
			then '' RecalculatePortfolio Job is Completed OK''
			else '' RecalculatePortfolio Job is not yet Completed KO'' end as result
	from FT_WF_WFDF WFDF, FT_WF_WFRI WFRI 
		where WFDF.workflow_id = WFRI.workflow_id 
		and WFDF.workflow_id = (SELECT workflow_id FROM FT_WF_WFDF WHERE workflow_nme = ''RecalculatePortfolio'' AND workflow_stat_typ = ''RELEASED''
        ORDER BY workflow_ver_num DESC LIMIT 1) and WFRI.wf_runtime_stat_typ = ''DONE''	and WFRI.workflow_start_tms::DATE = SYSDATE()::DATE
		AND (workflow_start_tms::time BETWEEN time ''08:30'' AND time ''09:00'') ',
 NULL, NULL, 'RESULT',
 'gsodmonitoring@thegoldensource.com',
 'ODAlerts@thegoldensource.com',
 'N','N','N','N'
FROM dual
;

-- 50) RecalculatePortfolio
INSERT INTO ft_m_jbcf
SELECT new_oid(), 'RecalculatePortfolio', 'RecalculatePortfolio Job', 'Fileload',
       'MON,TUE,WED,THU,FRI,SAT,SUN', '09:30', '10:00', '1', 15,
       SYSDATE(), SYSDATE(), NULL,
'select max(WFRI.workflow_start_tms)::text as job_id, 
		case when count(*)> 0 
			then '' RecalculatePortfolio Job is Completed OK''
			else '' RecalculatePortfolio Job is not yet Completed KO'' end as result
	from FT_WF_WFDF WFDF, FT_WF_WFRI WFRI 
		where WFDF.workflow_id = WFRI.workflow_id 
		and WFDF.workflow_id = (SELECT workflow_id FROM FT_WF_WFDF WHERE workflow_nme = ''RecalculatePortfolio'' AND workflow_stat_typ = ''RELEASED''
        ORDER BY workflow_ver_num DESC LIMIT 1) and WFRI.wf_runtime_stat_typ = ''DONE''	and WFRI.workflow_start_tms::DATE = SYSDATE()::DATE
		AND (workflow_start_tms::time BETWEEN time ''09:30'' AND time ''10:00'') ',
 NULL, NULL, 'RESULT',
 'gsodmonitoring@thegoldensource.com',
 'ODAlerts@thegoldensource.com',
 'N','N','N','N'
FROM dual
;

-- 50) RecalculatePortfolio
INSERT INTO ft_m_jbcf
SELECT new_oid(), 'RecalculatePortfolio', 'RecalculatePortfolio Job', 'Fileload',
       'MON,TUE,WED,THU,FRI,SAT,SUN', '10:30', '11:00', '1', 15,
       SYSDATE(), SYSDATE(), NULL,
'select max(WFRI.workflow_start_tms)::text as job_id, 
		case when count(*)> 0 
			then '' RecalculatePortfolio Job is Completed OK''
			else '' RecalculatePortfolio Job is not yet Completed KO'' end as result
	from FT_WF_WFDF WFDF, FT_WF_WFRI WFRI 
		where WFDF.workflow_id = WFRI.workflow_id 
		and WFDF.workflow_id = (SELECT workflow_id FROM FT_WF_WFDF WHERE workflow_nme = ''RecalculatePortfolio'' AND workflow_stat_typ = ''RELEASED''
        ORDER BY workflow_ver_num DESC LIMIT 1) and WFRI.wf_runtime_stat_typ = ''DONE''	and WFRI.workflow_start_tms::DATE = SYSDATE()::DATE
		AND (workflow_start_tms::time BETWEEN time ''10:30'' AND time ''11:00'') ',
 NULL, NULL, 'RESULT',
 'gsodmonitoring@thegoldensource.com',
 'ODAlerts@thegoldensource.com',
 'N','N','N','N'
FROM dual
;

-- 50) RecalculatePortfolio
INSERT INTO ft_m_jbcf
SELECT new_oid(), 'RecalculatePortfolio', 'RecalculatePortfolio Job', 'Fileload',
       'MON,TUE,WED,THU,FRI,SAT,SUN', '11:30', '12:00', '1', 15,
       SYSDATE(), SYSDATE(), NULL,
'select max(WFRI.workflow_start_tms)::text as job_id, 
		case when count(*)> 0 
			then '' RecalculatePortfolio Job is Completed OK''
			else '' RecalculatePortfolio Job is not yet Completed KO'' end as result
	from FT_WF_WFDF WFDF, FT_WF_WFRI WFRI 
		where WFDF.workflow_id = WFRI.workflow_id 
		and WFDF.workflow_id = (SELECT workflow_id FROM FT_WF_WFDF WHERE workflow_nme = ''RecalculatePortfolio'' AND workflow_stat_typ = ''RELEASED''
        ORDER BY workflow_ver_num DESC LIMIT 1) and WFRI.wf_runtime_stat_typ = ''DONE''	and WFRI.workflow_start_tms::DATE = SYSDATE()::DATE
		AND (workflow_start_tms::time BETWEEN time ''11:30'' AND time ''12:00'') ',
 NULL, NULL, 'RESULT',
 'gsodmonitoring@thegoldensource.com',
 'ODAlerts@thegoldensource.com',
 'N','N','N','N'
FROM dual
;

-- 50) RecalculatePortfolio
INSERT INTO ft_m_jbcf
SELECT new_oid(), 'RecalculatePortfolio', 'RecalculatePortfolio Job', 'Fileload',
       'MON,TUE,WED,THU,FRI,SAT,SUN', '12:30', '13:00', '1', 15,
       SYSDATE(), SYSDATE(), NULL,
'select max(WFRI.workflow_start_tms)::text as job_id, 
		case when count(*)> 0 
			then '' RecalculatePortfolio Job is Completed OK''
			else '' RecalculatePortfolio Job is not yet Completed KO'' end as result
	from FT_WF_WFDF WFDF, FT_WF_WFRI WFRI 
		where WFDF.workflow_id = WFRI.workflow_id 
		and WFDF.workflow_id = (SELECT workflow_id FROM FT_WF_WFDF WHERE workflow_nme = ''RecalculatePortfolio'' AND workflow_stat_typ = ''RELEASED''
        ORDER BY workflow_ver_num DESC LIMIT 1) and WFRI.wf_runtime_stat_typ = ''DONE''	and WFRI.workflow_start_tms::DATE = SYSDATE()::DATE
		AND (workflow_start_tms::time BETWEEN time ''12:30'' AND time ''13:00'') ',
 NULL, NULL, 'RESULT',
 'gsodmonitoring@thegoldensource.com',
 'ODAlerts@thegoldensource.com',
 'N','N','N','N'
FROM dual
;

-- 50) RecalculatePortfolio
INSERT INTO ft_m_jbcf
SELECT new_oid(), 'RecalculatePortfolio', 'RecalculatePortfolio Job', 'Fileload',
       'MON,TUE,WED,THU,FRI,SAT,SUN', '13:30', '14:00', '1', 15,
       SYSDATE(), SYSDATE(), NULL,
'select max(WFRI.workflow_start_tms)::text as job_id, 
		case when count(*)> 0 
			then '' RecalculatePortfolio Job is Completed OK''
			else '' RecalculatePortfolio Job is not yet Completed KO'' end as result
	from FT_WF_WFDF WFDF, FT_WF_WFRI WFRI 
		where WFDF.workflow_id = WFRI.workflow_id 
		and WFDF.workflow_id = (SELECT workflow_id FROM FT_WF_WFDF WHERE workflow_nme = ''RecalculatePortfolio'' AND workflow_stat_typ = ''RELEASED''
        ORDER BY workflow_ver_num DESC LIMIT 1) and WFRI.wf_runtime_stat_typ = ''DONE''	and WFRI.workflow_start_tms::DATE = SYSDATE()::DATE
		AND (workflow_start_tms::time BETWEEN time ''13:30'' AND time ''14:00'') ',
 NULL, NULL, 'RESULT',
 'gsodmonitoring@thegoldensource.com',
 'ODAlerts@thegoldensource.com',
 'N','N','N','N'
FROM dual
;

-- 50) RecalculatePortfolio
INSERT INTO ft_m_jbcf
SELECT new_oid(), 'RecalculatePortfolio', 'RecalculatePortfolio Job', 'Fileload',
       'MON,TUE,WED,THU,FRI,SAT,SUN', '14:30', '15:00', '1', 15,
       SYSDATE(), SYSDATE(), NULL,
'select max(WFRI.workflow_start_tms)::text as job_id, 
		case when count(*)> 0 
			then '' RecalculatePortfolio Job is Completed OK''
			else '' RecalculatePortfolio Job is not yet Completed KO'' end as result
	from FT_WF_WFDF WFDF, FT_WF_WFRI WFRI 
		where WFDF.workflow_id = WFRI.workflow_id 
		and WFDF.workflow_id = (SELECT workflow_id FROM FT_WF_WFDF WHERE workflow_nme = ''RecalculatePortfolio'' AND workflow_stat_typ = ''RELEASED''
        ORDER BY workflow_ver_num DESC LIMIT 1) and WFRI.wf_runtime_stat_typ = ''DONE''	and WFRI.workflow_start_tms::DATE = SYSDATE()::DATE
		AND (workflow_start_tms::time BETWEEN time ''14:30'' AND time ''15:00'') ',
 NULL, NULL, 'RESULT',
 'gsodmonitoring@thegoldensource.com',
 'ODAlerts@thegoldensource.com',
 'N','N','N','N'
FROM dual
;

-- 50) RecalculatePortfolio
INSERT INTO ft_m_jbcf
SELECT new_oid(), 'RecalculatePortfolio', 'RecalculatePortfolio Job', 'Fileload',
       'MON,TUE,WED,THU,FRI,SAT,SUN', '15:30', '16:00', '1', 15,
       SYSDATE(), SYSDATE(), NULL,
'select max(WFRI.workflow_start_tms)::text as job_id, 
		case when count(*)> 0 
			then '' RecalculatePortfolio Job is Completed OK''
			else '' RecalculatePortfolio Job is not yet Completed KO'' end as result
	from FT_WF_WFDF WFDF, FT_WF_WFRI WFRI 
		where WFDF.workflow_id = WFRI.workflow_id 
		and WFDF.workflow_id = (SELECT workflow_id FROM FT_WF_WFDF WHERE workflow_nme = ''RecalculatePortfolio'' AND workflow_stat_typ = ''RELEASED''
        ORDER BY workflow_ver_num DESC LIMIT 1) and WFRI.wf_runtime_stat_typ = ''DONE''	and WFRI.workflow_start_tms::DATE = SYSDATE()::DATE
		AND (workflow_start_tms::time BETWEEN time ''15:30'' AND time ''16:00'') ',
 NULL, NULL, 'RESULT',
 'gsodmonitoring@thegoldensource.com',
 'ODAlerts@thegoldensource.com',
 'N','N','N','N'
FROM dual
;

-- 50) RecalculatePortfolio
INSERT INTO ft_m_jbcf
SELECT new_oid(), 'RecalculatePortfolio', 'RecalculatePortfolio Job', 'Fileload',
       'MON,TUE,WED,THU,FRI,SAT,SUN', '16:30', '17:00', '1', 15,
       SYSDATE(), SYSDATE(), NULL,
'select max(WFRI.workflow_start_tms)::text as job_id, 
		case when count(*)> 0 
			then '' RecalculatePortfolio Job is Completed OK''
			else '' RecalculatePortfolio Job is not yet Completed KO'' end as result
	from FT_WF_WFDF WFDF, FT_WF_WFRI WFRI 
		where WFDF.workflow_id = WFRI.workflow_id 
		and WFDF.workflow_id = (SELECT workflow_id FROM FT_WF_WFDF WHERE workflow_nme = ''RecalculatePortfolio'' AND workflow_stat_typ = ''RELEASED''
        ORDER BY workflow_ver_num DESC LIMIT 1) and WFRI.wf_runtime_stat_typ = ''DONE''	and WFRI.workflow_start_tms::DATE = SYSDATE()::DATE
		AND (workflow_start_tms::time BETWEEN time ''16:30'' AND time ''17:00'') ',
 NULL, NULL, 'RESULT',
 'gsodmonitoring@thegoldensource.com',
 'ODAlerts@thegoldensource.com',
 'N','N','N','N'
FROM dual
;

-- 50) RecalculatePortfolio
INSERT INTO ft_m_jbcf
SELECT new_oid(), 'RecalculatePortfolio', 'RecalculatePortfolio Job', 'Fileload',
       'MON,TUE,WED,THU,FRI,SAT,SUN', '17:30', '18:00', '1', 15,
       SYSDATE(), SYSDATE(), NULL,
'select max(WFRI.workflow_start_tms)::text as job_id, 
		case when count(*)> 0 
			then '' RecalculatePortfolio Job is Completed OK''
			else '' RecalculatePortfolio Job is not yet Completed KO'' end as result
	from FT_WF_WFDF WFDF, FT_WF_WFRI WFRI 
		where WFDF.workflow_id = WFRI.workflow_id 
		and WFDF.workflow_id = (SELECT workflow_id FROM FT_WF_WFDF WHERE workflow_nme = ''RecalculatePortfolio'' AND workflow_stat_typ = ''RELEASED''
        ORDER BY workflow_ver_num DESC LIMIT 1) and WFRI.wf_runtime_stat_typ = ''DONE''	and WFRI.workflow_start_tms::DATE = SYSDATE()::DATE
		AND (workflow_start_tms::time BETWEEN time ''17:30'' AND time ''18:00'') ',
 NULL, NULL, 'RESULT',
 'gsodmonitoring@thegoldensource.com',
 'ODAlerts@thegoldensource.com',
 'N','N','N','N'
FROM dual
;

-- 50) RecalculatePortfolio
INSERT INTO ft_m_jbcf
SELECT new_oid(), 'RecalculatePortfolio', 'RecalculatePortfolio Job', 'Fileload',
       'MON,TUE,WED,THU,FRI,SAT,SUN', '18:30', '19:00', '1', 15,
       SYSDATE(), SYSDATE(), NULL,
'select max(WFRI.workflow_start_tms)::text as job_id, 
		case when count(*)> 0 
			then '' RecalculatePortfolio Job is Completed OK''
			else '' RecalculatePortfolio Job is not yet Completed KO'' end as result
	from FT_WF_WFDF WFDF, FT_WF_WFRI WFRI 
		where WFDF.workflow_id = WFRI.workflow_id 
		and WFDF.workflow_id = (SELECT workflow_id FROM FT_WF_WFDF WHERE workflow_nme = ''RecalculatePortfolio'' AND workflow_stat_typ = ''RELEASED''
        ORDER BY workflow_ver_num DESC LIMIT 1) and WFRI.wf_runtime_stat_typ = ''DONE''	and WFRI.workflow_start_tms::DATE = SYSDATE()::DATE
		AND (workflow_start_tms::time BETWEEN time ''18:30'' AND time ''19:00'') ',
 NULL, NULL, 'RESULT',
 'gsodmonitoring@thegoldensource.com',
 'ODAlerts@thegoldensource.com',
 'N','N','N','N'
FROM dual
;

-- 50) RecalculatePortfolio
INSERT INTO ft_m_jbcf
SELECT new_oid(), 'RecalculatePortfolio', 'RecalculatePortfolio Job', 'Fileload',
       'MON,TUE,WED,THU,FRI,SAT,SUN', '19:30', '20:00', '1', 15,
       SYSDATE(), SYSDATE(), NULL,
'select max(WFRI.workflow_start_tms)::text as job_id, 
		case when count(*)> 0 
			then '' RecalculatePortfolio Job is Completed OK''
			else '' RecalculatePortfolio Job is not yet Completed KO'' end as result
	from FT_WF_WFDF WFDF, FT_WF_WFRI WFRI 
		where WFDF.workflow_id = WFRI.workflow_id 
		and WFDF.workflow_id = (SELECT workflow_id FROM FT_WF_WFDF WHERE workflow_nme = ''RecalculatePortfolio'' AND workflow_stat_typ = ''RELEASED''
        ORDER BY workflow_ver_num DESC LIMIT 1) and WFRI.wf_runtime_stat_typ = ''DONE''	and WFRI.workflow_start_tms::DATE = SYSDATE()::DATE
		AND (workflow_start_tms::time BETWEEN time ''19:30'' AND time ''20:00'') ',
 NULL, NULL, 'RESULT',
 'gsodmonitoring@thegoldensource.com',
 'ODAlerts@thegoldensource.com',
 'N','N','N','N'
FROM dual
;

-- 50) RecalculatePortfolio
INSERT INTO ft_m_jbcf
SELECT new_oid(), 'RecalculatePortfolio', 'RecalculatePortfolio Job', 'Fileload',
       'MON,TUE,WED,THU,FRI,SAT,SUN', '20:30', '21:00', '1', 15,
       SYSDATE(), SYSDATE(), NULL,
'select max(WFRI.workflow_start_tms)::text as job_id, 
		case when count(*)> 0 
			then '' RecalculatePortfolio Job is Completed OK''
			else '' RecalculatePortfolio Job is not yet Completed KO'' end as result
	from FT_WF_WFDF WFDF, FT_WF_WFRI WFRI 
		where WFDF.workflow_id = WFRI.workflow_id 
		and WFDF.workflow_id = (SELECT workflow_id FROM FT_WF_WFDF WHERE workflow_nme = ''RecalculatePortfolio'' AND workflow_stat_typ = ''RELEASED''
        ORDER BY workflow_ver_num DESC LIMIT 1) and WFRI.wf_runtime_stat_typ = ''DONE''	and WFRI.workflow_start_tms::DATE = SYSDATE()::DATE
		AND (workflow_start_tms::time BETWEEN time ''20:30'' AND time ''21:00'') ',
 NULL, NULL, 'RESULT',
 'gsodmonitoring@thegoldensource.com',
 'ODAlerts@thegoldensource.com',
 'N','N','N','N'
FROM dual
;


INSERT INTO ft_m_jbcf
(jbcf_oid, job_name, job_desc, job_typ, job_run_day, job_start_time, job_end_time, job_run_freq, exp_run_dur,
 last_chg_tms, start_tms, end_tms, in_query, pub_query, val_query, result_column,
 to_mail, info_mail, task_start_check, multi_check, holiday_check, range_check)
SELECT new_oid(), 'CalculateEquityRating', 'CalculateEquityRating Job', 'Fileload',
       'MON,TUE,WED,THU,FRI,SAT,SUN', '10:00', '10:30', '1', 15, 
       SYSDATE(), SYSDATE(), NULL,
		'select max(WFRI.workflow_start_tms)::text as job_id, 
		case when count(*)> 0 
			then '' CalculateEquityRating Job is Completed OK''
			else '' CalculateEquityRating Job is not yet Completed KO'' end as result
	from FT_WF_WFDF WFDF, FT_WF_WFRI WFRI 
		where WFDF.workflow_id = WFRI.workflow_id 
		and WFDF.workflow_id = (SELECT workflow_id FROM FT_WF_WFDF WHERE workflow_nme = ''ScheduledCalculateEquityRating'' AND workflow_stat_typ = ''RELEASED''
        ORDER BY workflow_ver_num DESC LIMIT 1) and WFRI.wf_runtime_stat_typ = ''DONE''	and WFRI.workflow_start_tms::DATE = SYSDATE()::DATE
		AND (workflow_start_tms::time BETWEEN time ''10:00'' AND time ''10:30'')',
NULL, NULL, 'RESULT',
'gsodmonitoring@thegoldensource.com',
'ODAlerts@thegoldensource.com',
'N','N','N','N'
FROM dual;


INSERT INTO ft_m_jbcf
(jbcf_oid, job_name, job_desc, job_typ, job_run_day, job_start_time, job_end_time, job_run_freq, exp_run_dur,
 last_chg_tms, start_tms, end_tms, in_query, pub_query, val_query, result_column,
 to_mail, info_mail, task_start_check, multi_check, holiday_check, range_check)
SELECT new_oid(), 'CalculateEquityRating', 'CalculateEquityRating Job', 'Fileload',
       'MON,TUE,WED,THU,FRI,SAT,SUN', '11:00', '11:30', '1', 15, 
       SYSDATE(), SYSDATE(), NULL,
		'select max(WFRI.workflow_start_tms)::text as job_id, 
		case when count(*)> 0 
			then '' CalculateEquityRating Job is Completed OK''
			else '' CalculateEquityRating Job is not yet Completed KO'' end as result
	from FT_WF_WFDF WFDF, FT_WF_WFRI WFRI 
		where WFDF.workflow_id = WFRI.workflow_id 
		and WFDF.workflow_id = (SELECT workflow_id FROM FT_WF_WFDF WHERE workflow_nme = ''ScheduledCalculateEquityRating'' AND workflow_stat_typ = ''RELEASED''
        ORDER BY workflow_ver_num DESC LIMIT 1) and WFRI.wf_runtime_stat_typ = ''DONE''	and WFRI.workflow_start_tms::DATE = SYSDATE()::DATE
		AND (workflow_start_tms::time BETWEEN time ''11:00'' AND time ''11:30'')',
NULL, NULL, 'RESULT',
'gsodmonitoring@thegoldensource.com',
'ODAlerts@thegoldensource.com',
'N','N','N','N'
FROM dual;


INSERT INTO ft_m_jbcf
(jbcf_oid, job_name, job_desc, job_typ, job_run_day, job_start_time, job_end_time, job_run_freq, exp_run_dur,
 last_chg_tms, start_tms, end_tms, in_query, pub_query, val_query, result_column,
 to_mail, info_mail, task_start_check, multi_check, holiday_check, range_check)
SELECT new_oid(), 'CalculateEquityRating', 'CalculateEquityRating Job', 'Fileload',
       'MON,TUE,WED,THU,FRI,SAT,SUN', '12:00', '12:30', '1', 15, 
       SYSDATE(), SYSDATE(), NULL,
		'select max(WFRI.workflow_start_tms)::text as job_id, 
		case when count(*)> 0 
			then '' CalculateEquityRating Job is Completed OK''
			else '' CalculateEquityRating Job is not yet Completed KO'' end as result
	from FT_WF_WFDF WFDF, FT_WF_WFRI WFRI 
		where WFDF.workflow_id = WFRI.workflow_id 
		and WFDF.workflow_id = (SELECT workflow_id FROM FT_WF_WFDF WHERE workflow_nme = ''ScheduledCalculateEquityRating'' AND workflow_stat_typ = ''RELEASED''
        ORDER BY workflow_ver_num DESC LIMIT 1) and WFRI.wf_runtime_stat_typ = ''DONE''	and WFRI.workflow_start_tms::DATE = SYSDATE()::DATE
		AND (workflow_start_tms::time BETWEEN time ''12:00'' AND time ''12:30'')',
NULL, NULL, 'RESULT',
'gsodmonitoring@thegoldensource.com',
'ODAlerts@thegoldensource.com',
'N','N','N','N'
FROM dual;


INSERT INTO ft_m_jbcf
(jbcf_oid, job_name, job_desc, job_typ, job_run_day, job_start_time, job_end_time, job_run_freq, exp_run_dur,
 last_chg_tms, start_tms, end_tms, in_query, pub_query, val_query, result_column,
 to_mail, info_mail, task_start_check, multi_check, holiday_check, range_check)
SELECT new_oid(), 'CalculateEquityRating', 'CalculateEquityRating Job', 'Fileload',
       'MON,TUE,WED,THU,FRI,SAT,SUN', '13:00', '13:30', '1', 15, 
       SYSDATE(), SYSDATE(), NULL,
		'select max(WFRI.workflow_start_tms)::text as job_id, 
		case when count(*)> 0 
			then '' CalculateEquityRating Job is Completed OK''
			else '' CalculateEquityRating Job is not yet Completed KO'' end as result
	from FT_WF_WFDF WFDF, FT_WF_WFRI WFRI 
		where WFDF.workflow_id = WFRI.workflow_id 
		and WFDF.workflow_id = (SELECT workflow_id FROM FT_WF_WFDF WHERE workflow_nme = ''ScheduledCalculateEquityRating'' AND workflow_stat_typ = ''RELEASED''
        ORDER BY workflow_ver_num DESC LIMIT 1) and WFRI.wf_runtime_stat_typ = ''DONE''	and WFRI.workflow_start_tms::DATE = SYSDATE()::DATE
		AND (workflow_start_tms::time BETWEEN time ''13:00'' AND time ''13:30'')',
NULL, NULL, 'RESULT',
'gsodmonitoring@thegoldensource.com',
'ODAlerts@thegoldensource.com',
'N','N','N','N'
FROM dual;


INSERT INTO ft_m_jbcf
(jbcf_oid, job_name, job_desc, job_typ, job_run_day, job_start_time, job_end_time, job_run_freq, exp_run_dur,
 last_chg_tms, start_tms, end_tms, in_query, pub_query, val_query, result_column,
 to_mail, info_mail, task_start_check, multi_check, holiday_check, range_check)
SELECT new_oid(), 'CalculateEquityRating', 'CalculateEquityRating Job', 'Fileload',
       'MON,TUE,WED,THU,FRI,SAT,SUN', '14:00', '14:30', '1', 15, 
       SYSDATE(), SYSDATE(), NULL,
		'select max(WFRI.workflow_start_tms)::text as job_id, 
		case when count(*)> 0 
			then '' CalculateEquityRating Job is Completed OK''
			else '' CalculateEquityRating Job is not yet Completed KO'' end as result
	from FT_WF_WFDF WFDF, FT_WF_WFRI WFRI 
		where WFDF.workflow_id = WFRI.workflow_id 
		and WFDF.workflow_id = (SELECT workflow_id FROM FT_WF_WFDF WHERE workflow_nme = ''ScheduledCalculateEquityRating'' AND workflow_stat_typ = ''RELEASED''
        ORDER BY workflow_ver_num DESC LIMIT 1) and WFRI.wf_runtime_stat_typ = ''DONE''	and WFRI.workflow_start_tms::DATE = SYSDATE()::DATE
		AND (workflow_start_tms::time BETWEEN time ''14:00'' AND time ''14:30'')',
NULL, NULL, 'RESULT',
'gsodmonitoring@thegoldensource.com',
'ODAlerts@thegoldensource.com',
'N','N','N','N'
FROM dual;


INSERT INTO ft_m_jbcf
(jbcf_oid, job_name, job_desc, job_typ, job_run_day, job_start_time, job_end_time, job_run_freq, exp_run_dur,
 last_chg_tms, start_tms, end_tms, in_query, pub_query, val_query, result_column,
 to_mail, info_mail, task_start_check, multi_check, holiday_check, range_check)
SELECT new_oid(), 'CalculateEquityRating', 'CalculateEquityRating Job', 'Fileload',
       'MON,TUE,WED,THU,FRI,SAT,SUN', '15:00', '15:30', '1', 15, 
       SYSDATE(), SYSDATE(), NULL,
		'select max(WFRI.workflow_start_tms)::text as job_id, 
		case when count(*)> 0 
			then '' CalculateEquityRating Job is Completed OK''
			else '' CalculateEquityRating Job is not yet Completed KO'' end as result
	from FT_WF_WFDF WFDF, FT_WF_WFRI WFRI 
		where WFDF.workflow_id = WFRI.workflow_id 
		and WFDF.workflow_id = (SELECT workflow_id FROM FT_WF_WFDF WHERE workflow_nme = ''ScheduledCalculateEquityRating'' AND workflow_stat_typ = ''RELEASED''
        ORDER BY workflow_ver_num DESC LIMIT 1) and WFRI.wf_runtime_stat_typ = ''DONE''	and WFRI.workflow_start_tms::DATE = SYSDATE()::DATE
		AND (workflow_start_tms::time BETWEEN time ''15:00'' AND time ''15:30'')',
NULL, NULL, 'RESULT',
'gsodmonitoring@thegoldensource.com',
'ODAlerts@thegoldensource.com',
'N','N','N','N'
FROM dual;


INSERT INTO ft_m_jbcf
(jbcf_oid, job_name, job_desc, job_typ, job_run_day, job_start_time, job_end_time, job_run_freq, exp_run_dur,
 last_chg_tms, start_tms, end_tms, in_query, pub_query, val_query, result_column,
 to_mail, info_mail, task_start_check, multi_check, holiday_check, range_check)
SELECT new_oid(), 'CalculateEquityRating', 'CalculateEquityRating Job', 'Fileload',
       'MON,TUE,WED,THU,FRI,SAT,SUN', '16:00', '16:30', '1', 15, 
       SYSDATE(), SYSDATE(), NULL,
		'select max(WFRI.workflow_start_tms)::text as job_id, 
		case when count(*)> 0 
			then '' CalculateEquityRating Job is Completed OK''
			else '' CalculateEquityRating Job is not yet Completed KO'' end as result
	from FT_WF_WFDF WFDF, FT_WF_WFRI WFRI 
		where WFDF.workflow_id = WFRI.workflow_id 
		and WFDF.workflow_id = (SELECT workflow_id FROM FT_WF_WFDF WHERE workflow_nme = ''ScheduledCalculateEquityRating'' AND workflow_stat_typ = ''RELEASED''
        ORDER BY workflow_ver_num DESC LIMIT 1) and WFRI.wf_runtime_stat_typ = ''DONE''	and WFRI.workflow_start_tms::DATE = SYSDATE()::DATE
		AND (workflow_start_tms::time BETWEEN time ''16:00'' AND time ''16:30'')',
NULL, NULL, 'RESULT',
'gsodmonitoring@thegoldensource.com',
'ODAlerts@thegoldensource.com',
'N','N','N','N'
FROM dual;


INSERT INTO ft_m_jbcf
(jbcf_oid, job_name, job_desc, job_typ, job_run_day, job_start_time, job_end_time, job_run_freq, exp_run_dur,
 last_chg_tms, start_tms, end_tms, in_query, pub_query, val_query, result_column,
 to_mail, info_mail, task_start_check, multi_check, holiday_check, range_check)
SELECT new_oid(), 'CalculateEquityRating', 'CalculateEquityRating Job', 'Fileload',
       'MON,TUE,WED,THU,FRI,SAT,SUN', '17:00', '17:30', '1', 15, 
       SYSDATE(), SYSDATE(), NULL,
		'select max(WFRI.workflow_start_tms)::text as job_id, 
		case when count(*)> 0 
			then '' CalculateEquityRating Job is Completed OK''
			else '' CalculateEquityRating Job is not yet Completed KO'' end as result
	from FT_WF_WFDF WFDF, FT_WF_WFRI WFRI 
		where WFDF.workflow_id = WFRI.workflow_id 
		and WFDF.workflow_id = (SELECT workflow_id FROM FT_WF_WFDF WHERE workflow_nme = ''ScheduledCalculateEquityRating'' AND workflow_stat_typ = ''RELEASED''
        ORDER BY workflow_ver_num DESC LIMIT 1) and WFRI.wf_runtime_stat_typ = ''DONE''	and WFRI.workflow_start_tms::DATE = SYSDATE()::DATE
		AND (workflow_start_tms::time BETWEEN time ''17:00'' AND time ''17:30'')',
NULL, NULL, 'RESULT',
'gsodmonitoring@thegoldensource.com',
'ODAlerts@thegoldensource.com',
'N','N','N','N'
FROM dual;


INSERT INTO ft_m_jbcf
(jbcf_oid, job_name, job_desc, job_typ, job_run_day, job_start_time, job_end_time, job_run_freq, exp_run_dur,
 last_chg_tms, start_tms, end_tms, in_query, pub_query, val_query, result_column,
 to_mail, info_mail, task_start_check, multi_check, holiday_check, range_check)
SELECT new_oid(), 'CalculateEquityRating', 'CalculateEquityRating Job', 'Fileload',
       'MON,TUE,WED,THU,FRI,SAT,SUN', '18:00', '18:30', '1', 15, 
       SYSDATE(), SYSDATE(), NULL,
		'select max(WFRI.workflow_start_tms)::text as job_id, 
		case when count(*)> 0 
			then '' CalculateEquityRating Job is Completed OK''
			else '' CalculateEquityRating Job is not yet Completed KO'' end as result
	from FT_WF_WFDF WFDF, FT_WF_WFRI WFRI 
		where WFDF.workflow_id = WFRI.workflow_id 
		and WFDF.workflow_id = (SELECT workflow_id FROM FT_WF_WFDF WHERE workflow_nme = ''ScheduledCalculateEquityRating'' AND workflow_stat_typ = ''RELEASED''
        ORDER BY workflow_ver_num DESC LIMIT 1) and WFRI.wf_runtime_stat_typ = ''DONE''	and WFRI.workflow_start_tms::DATE = SYSDATE()::DATE
		AND (workflow_start_tms::time BETWEEN time ''18:00'' AND time ''18:30'')',
NULL, NULL, 'RESULT',
'gsodmonitoring@thegoldensource.com',
'ODAlerts@thegoldensource.com',
'N','N','N','N'
FROM dual;


INSERT INTO ft_m_jbcf
(jbcf_oid, job_name, job_desc, job_typ, job_run_day, job_start_time, job_end_time, job_run_freq, exp_run_dur,
 last_chg_tms, start_tms, end_tms, in_query, pub_query, val_query, result_column,
 to_mail, info_mail, task_start_check, multi_check, holiday_check, range_check)
SELECT new_oid(), 'CalculateEquityRating', 'CalculateEquityRating Job', 'Fileload',
       'MON,TUE,WED,THU,FRI,SAT,SUN', '19:00', '19:30', '1', 15, 
       SYSDATE(), SYSDATE(), NULL,
		'select max(WFRI.workflow_start_tms)::text as job_id, 
		case when count(*)> 0 
			then '' CalculateEquityRating Job is Completed OK''
			else '' CalculateEquityRating Job is not yet Completed KO'' end as result
	from FT_WF_WFDF WFDF, FT_WF_WFRI WFRI 
		where WFDF.workflow_id = WFRI.workflow_id 
		and WFDF.workflow_id = (SELECT workflow_id FROM FT_WF_WFDF WHERE workflow_nme = ''ScheduledCalculateEquityRating'' AND workflow_stat_typ = ''RELEASED''
        ORDER BY workflow_ver_num DESC LIMIT 1) and WFRI.wf_runtime_stat_typ = ''DONE''	and WFRI.workflow_start_tms::DATE = SYSDATE()::DATE
		AND (workflow_start_tms::time BETWEEN time ''19:00'' AND time ''19:30'')',
NULL, NULL, 'RESULT',
'gsodmonitoring@thegoldensource.com',
'ODAlerts@thegoldensource.com',
'N','N','N','N'
FROM dual;


INSERT INTO ft_m_jbcf
(jbcf_oid, job_name, job_desc, job_typ, job_run_day, job_start_time, job_end_time, job_run_freq, exp_run_dur,
 last_chg_tms, start_tms, end_tms, in_query, pub_query, val_query, result_column,
 to_mail, info_mail, task_start_check, multi_check, holiday_check, range_check)
SELECT new_oid(), 'CalculateEquityRating', 'CalculateEquityRating Job', 'Fileload',
       'MON,TUE,WED,THU,FRI,SAT,SUN', '20:00', '20:30', '1', 15, 
       SYSDATE(), SYSDATE(), NULL,
		'select max(WFRI.workflow_start_tms)::text as job_id, 
		case when count(*)> 0 
			then '' CalculateEquityRating Job is Completed OK''
			else '' CalculateEquityRating Job is not yet Completed KO'' end as result
	from FT_WF_WFDF WFDF, FT_WF_WFRI WFRI 
		where WFDF.workflow_id = WFRI.workflow_id 
		and WFDF.workflow_id = (SELECT workflow_id FROM FT_WF_WFDF WHERE workflow_nme = ''ScheduledCalculateEquityRating'' AND workflow_stat_typ = ''RELEASED''
        ORDER BY workflow_ver_num DESC LIMIT 1) and WFRI.wf_runtime_stat_typ = ''DONE''	and WFRI.workflow_start_tms::DATE = SYSDATE()::DATE
		AND (workflow_start_tms::time BETWEEN time ''20:00'' AND time ''20:30'')',
NULL, NULL, 'RESULT',
'gsodmonitoring@thegoldensource.com',
'ODAlerts@thegoldensource.com',
'N','N','N','N'
FROM dual;



-- 48)a ProcessDirFileMHI_HQLA
INSERT INTO ft_m_jbcf
SELECT new_oid(), 'ProcessDirFileMHI_HQLA', 'ProcessDirFileMHI_HQLA Job', 'Fileload',
       'MON,TUE,WED,THU,FRI', '03:30','03:45', '1', 5,
       SYSDATE(), SYSDATE(), NULL,
'select max(WFRI.workflow_start_tms)::text as job_id, 
		case when count(*)> 0 
			then '' ProcessDirFileMHI_HQLA Job is Completed OK''
			else '' ProcessDirFileMHI_HQLA Job is not yet Completed KO'' end as result
	from FT_WF_WFDF WFDF, FT_WF_WFRI WFRI 
		where WFDF.workflow_id = WFRI.workflow_id 
		and WFDF.workflow_id = (SELECT workflow_id FROM FT_WF_WFDF WHERE workflow_nme = ''Process Files in Directory'' AND workflow_stat_typ = ''RELEASED''
        ORDER BY workflow_ver_num DESC LIMIT 1) and WFRI.wf_runtime_stat_typ = ''DONE''	and WFRI.workflow_start_tms::DATE = SYSDATE()::DATE
		AND (workflow_start_tms::time BETWEEN time ''03:30'' AND time ''03:45'') ',
 NULL, NULL, 'RESULT',
 'gsodmonitoring@thegoldensource.com',
 'ODAlerts@thegoldensource.com',
 'N','N','N','N'
FROM dual
;

-- 48)a ProcessDirFileMHI_HQLA
INSERT INTO ft_m_jbcf
SELECT new_oid(), 'ProcessDirFileMHI_HQLA', 'ProcessDirFileMHI_HQLA Job', 'Fileload',
       'MON,TUE,WED,THU,FRI', '04:30','04:45', '1', 5,
       SYSDATE(), SYSDATE(), NULL,
'select max(WFRI.workflow_start_tms)::text as job_id, 
		case when count(*)> 0 
			then '' ProcessDirFileMHI_HQLA Job is Completed OK''
			else '' ProcessDirFileMHI_HQLA Job is not yet Completed KO'' end as result
	from FT_WF_WFDF WFDF, FT_WF_WFRI WFRI 
		where WFDF.workflow_id = WFRI.workflow_id 
		and WFDF.workflow_id = (SELECT workflow_id FROM FT_WF_WFDF WHERE workflow_nme = ''Process Files in Directory'' AND workflow_stat_typ = ''RELEASED''
        ORDER BY workflow_ver_num DESC LIMIT 1) and WFRI.wf_runtime_stat_typ = ''DONE''	and WFRI.workflow_start_tms::DATE = SYSDATE()::DATE
		AND (workflow_start_tms::time BETWEEN time ''04:30'' AND time ''04:45'') ',
 NULL, NULL, 'RESULT',
 'gsodmonitoring@thegoldensource.com',
 'ODAlerts@thegoldensource.com',
 'N','N','N','N'
FROM dual
;

-- 48)a ProcessDirFileMHI_HQLA
INSERT INTO ft_m_jbcf
SELECT new_oid(), 'ProcessDirFileMHI_HQLA', 'ProcessDirFileMHI_HQLA Job', 'Fileload',
       'MON,TUE,WED,THU,FRI', '05:30','05:45', '1', 5,
       SYSDATE(), SYSDATE(), NULL,
'select max(WFRI.workflow_start_tms)::text as job_id, 
		case when count(*)> 0 
			then '' ProcessDirFileMHI_HQLA Job is Completed OK''
			else '' ProcessDirFileMHI_HQLA Job is not yet Completed KO'' end as result
	from FT_WF_WFDF WFDF, FT_WF_WFRI WFRI 
		where WFDF.workflow_id = WFRI.workflow_id 
		and WFDF.workflow_id = (SELECT workflow_id FROM FT_WF_WFDF WHERE workflow_nme = ''Process Files in Directory'' AND workflow_stat_typ = ''RELEASED''
        ORDER BY workflow_ver_num DESC LIMIT 1) and WFRI.wf_runtime_stat_typ = ''DONE''	and WFRI.workflow_start_tms::DATE = SYSDATE()::DATE
		AND (workflow_start_tms::time BETWEEN time ''05:30'' AND time ''05:45'') ',
 NULL, NULL, 'RESULT',
 'gsodmonitoring@thegoldensource.com',
 'ODAlerts@thegoldensource.com',
 'N','N','N','N'
FROM dual
;

-- 48)a ProcessDirFileMHI_HQLA
INSERT INTO ft_m_jbcf
SELECT new_oid(), 'ProcessDirFileMHI_HQLA', 'ProcessDirFileMHI_HQLA Job', 'Fileload',
       'MON,TUE,WED,THU,FRI', '06:30','06:45', '1', 5,
       SYSDATE(), SYSDATE(), NULL,
'select max(WFRI.workflow_start_tms)::text as job_id, 
		case when count(*)> 0 
			then '' ProcessDirFileMHI_HQLA Job is Completed OK''
			else '' ProcessDirFileMHI_HQLA Job is not yet Completed KO'' end as result
	from FT_WF_WFDF WFDF, FT_WF_WFRI WFRI 
		where WFDF.workflow_id = WFRI.workflow_id 
		and WFDF.workflow_id = (SELECT workflow_id FROM FT_WF_WFDF WHERE workflow_nme = ''Process Files in Directory'' AND workflow_stat_typ = ''RELEASED''
        ORDER BY workflow_ver_num DESC LIMIT 1) and WFRI.wf_runtime_stat_typ = ''DONE''	and WFRI.workflow_start_tms::DATE = SYSDATE()::DATE
		AND (workflow_start_tms::time BETWEEN time ''06:30'' AND time ''06:45'') ',
 NULL, NULL, 'RESULT',
 'gsodmonitoring@thegoldensource.com',
 'ODAlerts@thegoldensource.com',
 'N','N','N','N'
FROM dual
;



-- 48)b ProcessDirFileMHI_HQLA
INSERT INTO ft_m_jbcf
SELECT new_oid(), 'ProcessDirFileMHI_HQLA', 'ProcessDirFileMHI_HQLA Job', 'Fileload',
       'MON,TUE,WED,THU,FRI', '18:30','18:45', '1', 5,
       SYSDATE(), SYSDATE(), NULL,
'select max(WFRI.workflow_start_tms)::text as job_id, 
		case when count(*)> 0 
			then '' ProcessDirFileMHI_HQLA Job is Completed OK''
			else '' ProcessDirFileMHI_HQLA Job is not yet Completed KO'' end as result
	from FT_WF_WFDF WFDF, FT_WF_WFRI WFRI 
		where WFDF.workflow_id = WFRI.workflow_id 
		and WFDF.workflow_id = (SELECT workflow_id FROM FT_WF_WFDF WHERE workflow_nme = ''Process Files in Directory'' AND workflow_stat_typ = ''RELEASED''
        ORDER BY workflow_ver_num DESC LIMIT 1) and WFRI.wf_runtime_stat_typ = ''DONE''	and WFRI.workflow_start_tms::DATE = SYSDATE()::DATE
		AND (workflow_start_tms::time BETWEEN time ''18:30'' AND time ''18:45'') ',
 NULL, NULL, 'RESULT',
 'gsodmonitoring@thegoldensource.com',
 'ODAlerts@thegoldensource.com',
 'N','N','N','N'
FROM dual
;

-- 48)b ProcessDirFileMHI_HQLA
INSERT INTO ft_m_jbcf
SELECT new_oid(), 'ProcessDirFileMHI_HQLA', 'ProcessDirFileMHI_HQLA Job', 'Fileload',
       'MON,TUE,WED,THU,FRI', '19:30','19:45', '1', 5,
       SYSDATE(), SYSDATE(), NULL,
'select max(WFRI.workflow_start_tms)::text as job_id, 
		case when count(*)> 0 
			then '' ProcessDirFileMHI_HQLA Job is Completed OK''
			else '' ProcessDirFileMHI_HQLA Job is not yet Completed KO'' end as result
	from FT_WF_WFDF WFDF, FT_WF_WFRI WFRI 
		where WFDF.workflow_id = WFRI.workflow_id 
		and WFDF.workflow_id = (SELECT workflow_id FROM FT_WF_WFDF WHERE workflow_nme = ''Process Files in Directory'' AND workflow_stat_typ = ''RELEASED''
        ORDER BY workflow_ver_num DESC LIMIT 1) and WFRI.wf_runtime_stat_typ = ''DONE''	and WFRI.workflow_start_tms::DATE = SYSDATE()::DATE
		AND (workflow_start_tms::time BETWEEN time ''19:30'' AND time ''19:45'') ',
 NULL, NULL, 'RESULT',
 'gsodmonitoring@thegoldensource.com',
 'ODAlerts@thegoldensource.com',
 'N','N','N','N'
FROM dual
;

-- 48)b ProcessDirFileMHI_HQLA
INSERT INTO ft_m_jbcf
SELECT new_oid(), 'ProcessDirFileMHI_HQLA', 'ProcessDirFileMHI_HQLA Job', 'Fileload',
       'MON,TUE,WED,THU,FRI', '20:30','20:45', '1', 5,
       SYSDATE(), SYSDATE(), NULL,
'select max(WFRI.workflow_start_tms)::text as job_id, 
		case when count(*)> 0 
			then '' ProcessDirFileMHI_HQLA Job is Completed OK''
			else '' ProcessDirFileMHI_HQLA Job is not yet Completed KO'' end as result
	from FT_WF_WFDF WFDF, FT_WF_WFRI WFRI 
		where WFDF.workflow_id = WFRI.workflow_id 
		and WFDF.workflow_id = (SELECT workflow_id FROM FT_WF_WFDF WHERE workflow_nme = ''Process Files in Directory'' AND workflow_stat_typ = ''RELEASED''
        ORDER BY workflow_ver_num DESC LIMIT 1) and WFRI.wf_runtime_stat_typ = ''DONE''	and WFRI.workflow_start_tms::DATE = SYSDATE()::DATE
		AND (workflow_start_tms::time BETWEEN time ''20:30'' AND time ''20:45'') ',
 NULL, NULL, 'RESULT',
 'gsodmonitoring@thegoldensource.com',
 'ODAlerts@thegoldensource.com',
 'N','N','N','N'
FROM dual
;

-- 48)b ProcessDirFileMHI_HQLA
INSERT INTO ft_m_jbcf
SELECT new_oid(), 'ProcessDirFileMHI_HQLA', 'ProcessDirFileMHI_HQLA Job', 'Fileload',
       'MON,TUE,WED,THU,FRI', '21:30','21:45', '1', 5,
       SYSDATE(), SYSDATE(), NULL,
'select max(WFRI.workflow_start_tms)::text as job_id, 
		case when count(*)> 0 
			then '' ProcessDirFileMHI_HQLA Job is Completed OK''
			else '' ProcessDirFileMHI_HQLA Job is not yet Completed KO'' end as result
	from FT_WF_WFDF WFDF, FT_WF_WFRI WFRI 
		where WFDF.workflow_id = WFRI.workflow_id 
		and WFDF.workflow_id = (SELECT workflow_id FROM FT_WF_WFDF WHERE workflow_nme = ''Process Files in Directory'' AND workflow_stat_typ = ''RELEASED''
        ORDER BY workflow_ver_num DESC LIMIT 1) and WFRI.wf_runtime_stat_typ = ''DONE''	and WFRI.workflow_start_tms::DATE = SYSDATE()::DATE
		AND (workflow_start_tms::time BETWEEN time ''21:30'' AND time ''21:45'') ',
 NULL, NULL, 'RESULT',
 'gsodmonitoring@thegoldensource.com',
 'ODAlerts@thegoldensource.com',
 'N','N','N','N'
FROM dual;
COMMIT;

------------------------- Alerts for Publishing WF's --------------------------

-- 15)a MizBulkExtraction
INSERT INTO ft_m_jbcf
SELECT new_oid(), 'MizBulkExtraction', 'MizBulkExtraction Publishing WF', 'Fileload',
       'MON,TUE,WED,THU,FRI,SAT,SUN', '14:15', '14:45', '1', 10,
       SYSDATE(), SYSDATE(), NULL,   
'select max(WFRI.workflow_start_tms)::text as job_id, 
		case when count(*)> 0 
			then '' MizBulkExtraction Publishing WF is Completed OK''
			else '' MizBulkExtraction Publishing WF is not yet Completed KO'' end as result
	from FT_WF_WFDF WFDF, FT_WF_WFRI WFRI 
		where WFDF.workflow_id = WFRI.workflow_id 
		and WFDF.workflow_id = (SELECT workflow_id FROM FT_WF_WFDF WHERE workflow_nme = ''MizBulkExtraction'' AND workflow_stat_typ = ''RELEASED''
        ORDER BY workflow_ver_num DESC LIMIT 1) and WFRI.wf_runtime_stat_typ = ''DONE''	and WFRI.workflow_start_tms::DATE = SYSDATE()::DATE
		AND (workflow_start_tms::time BETWEEN time ''00:15'' AND time ''14:15'')',
 NULL,NULL,'RESULT',
 'gsodmonitoring@thegoldensource.com',
 'ODAlerts@thegoldensource.com',
 'N','N','N','N'
FROM dual;


-- 15)b MizBulkExtraction
INSERT INTO ft_m_jbcf
SELECT new_oid(), 'MizBulkExtraction', 'MizBulkExtraction Publishing WF', 'Fileload',
       'MON,TUE,WED,THU,FRI,SAT,SUN', '23:15', '23:45', '1', 10,
       SYSDATE(), SYSDATE(), NULL,   
'select max(WFRI.workflow_start_tms)::text as job_id, 
		case when count(*)> 0 
			then '' MizBulkExtraction Publishing WF is Completed OK''
			else '' MizBulkExtraction Publishing WF is not yet Completed KO'' end as result
	from FT_WF_WFDF WFDF, FT_WF_WFRI WFRI 
		where WFDF.workflow_id = WFRI.workflow_id 
		and WFDF.workflow_id = (SELECT workflow_id FROM FT_WF_WFDF WHERE workflow_nme = ''MizBulkExtraction'' AND workflow_stat_typ = ''RELEASED''
        ORDER BY workflow_ver_num DESC LIMIT 1) and WFRI.wf_runtime_stat_typ = ''DONE''	and WFRI.workflow_start_tms::DATE = SYSDATE()::DATE
		AND (workflow_start_tms::time BETWEEN time ''14:15'' AND time ''23:15'')',
 NULL,NULL,'RESULT',
 'gsodmonitoring@thegoldensource.com',
 'ODAlerts@thegoldensource.com',
 'N','N','N','N'
FROM dual;


-- 16)a MizPublishForTxn
INSERT INTO ft_m_jbcf
SELECT new_oid(), 'MizPublishForTxn', 'MizPublishForTxn Publishing WF', 'Fileload',
       'MON,TUE,WED,THU,FRI,SAT,SUN', '14:15', '14:45', '1', 10,
       SYSDATE(), SYSDATE(), NULL,   
'select max(WFRI.workflow_start_tms)::text as job_id, 
		case when count(*)> 0 
			then '' MizPublishForTxn Publishing WF is Completed OK''
			else '' MizPublishForTxn Publishing WF is not yet Completed KO'' end as result
	from FT_WF_WFDF WFDF, FT_WF_WFRI WFRI 
		where WFDF.workflow_id = WFRI.workflow_id 
		and WFDF.workflow_id = (SELECT workflow_id FROM FT_WF_WFDF WHERE workflow_nme = ''MizPublishForTxn'' AND workflow_stat_typ = ''RELEASED''
        ORDER BY workflow_ver_num DESC LIMIT 1) and WFRI.wf_runtime_stat_typ = ''DONE''	and WFRI.workflow_start_tms::DATE = SYSDATE()::DATE
		AND (workflow_start_tms::time BETWEEN time ''00:15'' AND time ''14:15'')',
 NULL,NULL,'RESULT',
 'gsodmonitoring@thegoldensource.com',
 'ODAlerts@thegoldensource.com',
 'N','N','N','N'
FROM dual;


-- 16)b MizPublishForTxn			-- check for PBAT and PBDP check
INSERT INTO ft_m_jbcf
SELECT new_oid(), 'MizPublishForTxn', 'MizPublishForTxn Publishing WF', 'Fileload',
       'MON,TUE,WED,THU,FRI,SAT,SUN', '23:15', '23:45', '1', 10,
       SYSDATE(), SYSDATE(), NULL,   
'select max(WFRI.workflow_start_tms)::text as job_id, 
		case when count(*)> 0 
			then '' MizPublishForTxn Publishing WF is Completed OK''
			else '' MizPublishForTxn Publishing WF is not yet Completed KO'' end as result
	from FT_WF_WFDF WFDF, FT_WF_WFRI WFRI 
		where WFDF.workflow_id = WFRI.workflow_id 
		and WFDF.workflow_id = (SELECT workflow_id FROM FT_WF_WFDF WHERE workflow_nme = ''MizPublishForTxn'' AND workflow_stat_typ = ''RELEASED''
        ORDER BY workflow_ver_num DESC LIMIT 1) and WFRI.wf_runtime_stat_typ = ''DONE''	and WFRI.workflow_start_tms::DATE = SYSDATE()::DATE
		AND (workflow_start_tms::time BETWEEN time ''14:15'' AND time ''23:15'')',
 NULL,NULL,'RESULT',
 'gsodmonitoring@thegoldensource.com',
 'ODAlerts@thegoldensource.com',
 'N','N','N','N'
FROM dual;
COMMIT;