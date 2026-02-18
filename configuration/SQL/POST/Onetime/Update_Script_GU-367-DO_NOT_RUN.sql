--------- Updating the rtng_eff_tms incrementally for each instrument to handle Unique Constrainst error -----------
WITH duplicates AS (
    SELECT instr_id
    FROM ft_t_isrt
    GROUP BY instr_id, rtng_set_oid, rtng_value_oid, rtng_eff_tms
    HAVING COUNT(*) > 1
),
ranked AS (
    SELECT
        iss_rtng_oid,
        instr_id,
        rtng_eff_tms,
        ROW_NUMBER() OVER (
            PARTITION BY instr_id, rtng_set_oid, rtng_value_oid, rtng_eff_tms
            ORDER BY rtng_eff_tms, iss_rtng_oid
        ) - 1 AS rn
    FROM ft_t_isrt
    WHERE instr_id IN (SELECT instr_id FROM duplicates)
)
UPDATE ft_t_isrt t
SET rtng_eff_tms = t.rtng_eff_tms + (r.rn * interval '1 second')
FROM ranked r
WHERE t.iss_rtng_oid = r.iss_rtng_oid;									

-------------------------- Existing Data Syncup --------------------------

Update FT_T_ISRT set start_tms = rtng_eff_tms, last_chg_usr_id = last_chg_usr_id||' - JIRA_GU-367'
where last_chg_usr_id like 'BBCGCPFD%' and data_src_id in ('MOODYS_RDS','SNPXF_RT') and last_chg_usr_id NOT LIKE '% - JIRA_GU-367%' and sys_eff_end_tms is null and end_tms is null;

Update FT_T_ISRT set start_tms = rtng_eff_tms, last_chg_usr_id = last_chg_usr_id||' - JIRA_GU-367'
where last_chg_usr_id like 'BB%' and orig_data_prov_id  in ('JCR') and last_chg_usr_id NOT LIKE '% - JIRA_GU-367%' and sys_eff_end_tms is null and end_tms is null;
