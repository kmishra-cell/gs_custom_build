-------------------- Updating the Start_tms incrementally for each instrument to handle Unique Constrainst error ----------------------	BBUNIQUE--
WITH duplicates AS (
    SELECT instr_id
    FROM ft_t_isid
    WHERE id_ctxt_typ = 'BBUNIQUE'
    GROUP BY instr_id, iss_id, mkt_oid
    HAVING COUNT(*) > 1
),
ranked AS (
    SELECT
        isid_oid,
        instr_id,
        start_tms,
        ROW_NUMBER() OVER (PARTITION BY instr_id ORDER BY start_tms, isid_oid) - 1 AS rn
    FROM ft_t_isid
    WHERE id_ctxt_typ = 'BBUNIQUE'
      AND instr_id IN (SELECT instr_id FROM duplicates)
)
UPDATE ft_t_isid t
SET start_tms = t.start_tms + (r.rn * interval '1 second')
FROM ranked r
WHERE t.isid_oid = r.isid_oid;											

-------------------- Update Iss_Usage_Typ = NULL for entire universe of (BBUNIQUE) ----------------------
	  
Update ft_t_isid set iss_usage_typ = null, last_chg_usr_id = last_chg_usr_id||' - JIRA_GU-378'		
WHERE id_ctxt_typ IN ('BBUNIQUE')
  AND end_tms IS NULL
  AND iss_usage_typ is NOT null;										
  
-------------------- Updating the Start_tms incrementally for each instrument to handle Unique Constrainst error ---------------------- BBGLOBAL--
WITH duplicates AS (
    SELECT instr_id
    FROM ft_t_isid
    WHERE id_ctxt_typ = 'BBGLOBAL'
    GROUP BY instr_id, iss_id, mkt_oid
    HAVING COUNT(*) > 1
),
ranked AS (
    SELECT
        isid_oid,
        instr_id,
        start_tms,
        ROW_NUMBER() OVER (PARTITION BY instr_id ORDER BY start_tms, isid_oid) - 1 AS rn
    FROM ft_t_isid
    WHERE id_ctxt_typ = 'BBGLOBAL'
      AND instr_id IN (SELECT instr_id FROM duplicates)
)
UPDATE ft_t_isid t
SET start_tms = t.start_tms + (r.rn * interval '1 second')
FROM ranked r
WHERE t.isid_oid = r.isid_oid;											

-------------------- Update Iss_Usage_Typ = NULL for entire universe of (BBGLOBAL) ----------------------
	  
Update ft_t_isid set iss_usage_typ = null, last_chg_usr_id = last_chg_usr_id||' - JIRA_GU-378'		
WHERE id_ctxt_typ IN ('BBGLOBAL')
  AND end_tms IS NULL
  AND iss_usage_typ is NOT null;										

-------------------- Updating the Start_tms incrementally for each instrument to handle Unique Constrainst error ---------------------- SEDOL--
WITH duplicates AS (
    SELECT instr_id
    FROM ft_t_isid
    WHERE id_ctxt_typ = 'SEDOL'
    GROUP BY instr_id, iss_id, mkt_oid
    HAVING COUNT(*) > 1
),
ranked AS (
    SELECT
        isid_oid,
        instr_id,
        start_tms,
        ROW_NUMBER() OVER (PARTITION BY instr_id ORDER BY start_tms, isid_oid) - 1 AS rn
    FROM ft_t_isid
    WHERE id_ctxt_typ = 'SEDOL'
      AND instr_id IN (SELECT instr_id FROM duplicates)
)
UPDATE ft_t_isid t
SET start_tms = t.start_tms + (r.rn * interval '1 second')
FROM ranked r
WHERE t.isid_oid = r.isid_oid;											

-------------------- Update Iss_Usage_Typ = NULL for entire universe of (SEDOL) ----------------------
	  
Update ft_t_isid set iss_usage_typ = null, last_chg_usr_id = last_chg_usr_id||' - JIRA_GU-378'		
WHERE id_ctxt_typ IN ('SEDOL')
  AND end_tms IS NULL
  AND iss_usage_typ is NOT null;										
