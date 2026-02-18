-------------------- Updating the Start_tms incrementally for each instrument to handle Unique Constrainst error ----------------------

WITH duplicates AS (
    SELECT instr_id
    FROM ft_t_isid
    WHERE id_ctxt_typ = 'BBCMPSEC'
    GROUP BY instr_id, iss_id
    HAVING COUNT(*) > 1
),
ranked AS (
    SELECT
        isid_oid,
        instr_id,
        start_tms,
        ROW_NUMBER() OVER (PARTITION BY instr_id ORDER BY start_tms, isid_oid) - 1 AS rn
    FROM ft_t_isid
    WHERE id_ctxt_typ = 'BBCMPSEC'
      AND instr_id IN (SELECT instr_id FROM duplicates)
)
UPDATE ft_t_isid t
SET start_tms = t.start_tms + (r.rn * interval '1 second')
FROM ranked r
WHERE t.isid_oid = r.isid_oid;											

-------------------- Populating Iss_Usage_Typ for 'BBCMPSEC' ----------------------

-------- BBMKTSCT 'CORP' ----------
UPDATE FT_T_ISID AS cmp
SET 
    iss_usage_typ = uniq.iss_id,
    mkt_oid = NULL,
    last_chg_usr_id = cmp.last_chg_usr_id || '_GU368'
FROM FT_T_ISID AS uniq
WHERE 
    cmp.id_ctxt_typ = 'BBCMPSEC'
    AND cmp.end_tms IS NULL
    AND uniq.id_ctxt_typ = 'BBUNIQUE'
    AND uniq.end_tms IS NULL
    AND uniq.instr_id = cmp.instr_id
    AND EXISTS (
        SELECT 1
        FROM ft_t_iscl cls
        WHERE cls.instr_id = cmp.instr_id
          AND cls.cl_value = 'Corp'
          AND cls.indus_cl_set_id = 'BBMKTSCT'
          AND cls.end_tms IS NULL
    )
    and not exists (select 1  from FT_T_ISID ISID_in where id_ctxt_typ = 'BBUNIQUE' and end_tms is null and ISID_in.instr_id = cmp.instr_id and ISID_in.instr_id in 
    (select instr_id from ft_t_iscl where cl_value='Corp' and indus_cl_set_id='BBMKTSCT' and end_tms is null) 
group by instr_id having count(*)>1);
		
-------- BBMKTSCT 'GOVT' -----------
--update FT_T_ISID ISID_out set mkt_oid = null, last_chg_usr_id = last_chg_usr_id||'_GU368'  
--where id_ctxt_typ ='BBCMPSEC' and end_Tms is null
--and exists (select 1 from ft_t_iscl where cl_value='Govt' and indus_cl_set_id='BBMKTSCT' and end_tms is null and instr_id=ISID_out.instr_id);

-------- BBMKTSCT 'GOVT' ----------
UPDATE FT_T_ISID AS cmp
SET 
    iss_usage_typ = uniq.iss_id,
    mkt_oid = NULL,
    last_chg_usr_id = cmp.last_chg_usr_id || '_GU368'
FROM FT_T_ISID AS uniq
WHERE 
    cmp.id_ctxt_typ = 'BBCMPSEC'
    AND cmp.end_tms IS NULL
    AND uniq.id_ctxt_typ = 'BBUNIQUE'
    AND uniq.end_tms IS NULL
    AND uniq.instr_id = cmp.instr_id
    AND EXISTS (
        SELECT 1
        FROM ft_t_iscl cls
        WHERE cls.instr_id = cmp.instr_id
          AND cls.cl_value = 'Govt'
          AND cls.indus_cl_set_id = 'BBMKTSCT'
          AND cls.end_tms IS NULL
    )
    and not exists (select 1  from FT_T_ISID ISID_in where id_ctxt_typ = 'BBUNIQUE' and end_tms is null and ISID_in.instr_id = cmp.instr_id and ISID_in.instr_id in 
    (select instr_id from ft_t_iscl where cl_value='Govt' and indus_cl_set_id='BBMKTSCT' and end_tms is null) 
group by instr_id having count(*)>1);

-------- BBMKTSCT 'M-MKT' ----------
UPDATE FT_T_ISID AS cmp
SET 
    iss_usage_typ = uniq.iss_id,
    mkt_oid = NULL,
    last_chg_usr_id = cmp.last_chg_usr_id || '_GU368'
FROM FT_T_ISID AS uniq
WHERE 
    cmp.id_ctxt_typ = 'BBCMPSEC'
    AND cmp.end_tms IS NULL
    AND uniq.id_ctxt_typ = 'BBUNIQUE'
    AND uniq.end_tms IS NULL
    AND uniq.instr_id = cmp.instr_id
    AND EXISTS (
        SELECT 1
        FROM ft_t_iscl cls
        WHERE cls.instr_id = cmp.instr_id
          AND cls.cl_value = 'M-Mkt'
          AND cls.indus_cl_set_id = 'BBMKTSCT'
          AND cls.end_tms IS NULL
    )
    and not exists (select 1  from FT_T_ISID ISID_in where id_ctxt_typ = 'BBUNIQUE' and end_tms is null and ISID_in.instr_id = cmp.instr_id and ISID_in.instr_id in 
    (select instr_id from ft_t_iscl where cl_value='M-Mkt' and indus_cl_set_id='BBMKTSCT' and end_tms is null) 
group by instr_id having count(*)>1);



