--{$$-STATEMENT-$$}
DROP VIEW IF EXISTS cdwrec_v_assetversion;

--{$$-STATEMENT-$$}
CREATE OR REPLACE VIEW cdwrec_v_assetversion 
AS
SELECT DISTINCT 
    isid.iss_id AS mizuho_id, 
    publish.iss_grp_id AS soi_name, 
    MAX(upd1.version) AS latest_published_version, 
    publish.last_chg_tms AS latest_published_timestamp
FROM
    (
        SELECT issu.instr_id AS instr_id,
			(
                SELECT r.iss_grp_id 
                FROM ft_t_isgp p
                JOIN ft_t_isgr r ON p.iss_grp_oid = r.iss_grp_oid
                WHERE p.iss_grp_oid IN (SELECT iss_grp_oid FROM ft_t_isgr WHERE iss_grp_id = isgr.iss_grp_id AND end_tms IS NULL )
					AND prnt_iss_grp_oid NOT IN (SELECT iss_grp_oid FROM ft_t_isgr WHERE grp_nme = 'Mizuho Inventory' AND end_tms IS NULL)
            ) AS iss_grp_id,
			MAX(pbat.last_chg_tms) AS last_chg_tms
		FROM 
            ft_t_issu issu 
			JOIN ft_t_pbat pbat ON pbat.pub_cross_ref_id = issu.instr_id AND pbat.published_tbl_id = 'ISSU'
			JOIN ft_t_isgp isgp ON issu.instr_id = isgp.instr_id AND isgp.end_tms IS NULL
            JOIN ft_t_isgr isgr ON isgr.iss_grp_oid IN (SELECT iss_grp_oid FROM ft_t_isgp WHERE prnt_iss_grp_oid IN 
						(SELECT iss_grp_oid FROM ft_t_isgr WHERE grp_nme IN ('MHI Inventory', 'MHEU Inventory') AND end_tms IS NULL)
							AND instr_id IS NULL 
							AND end_tms IS NULL 
							)
				AND isgr.end_tms IS NULL 
				AND isgr.iss_grp_oid = isgp.prnt_iss_grp_oid
	GROUP BY 
            issu.instr_id, isgr.iss_grp_id
		) AS publish
JOIN 
    ft_t_isid isid 
		ON publish.instr_id = isid.instr_id 
		AND isid.id_ctxt_typ = 'MIZUHO' 
		AND isid.end_tms IS NULL
LEFT JOIN 
    ft_t_upd1 upd1 
	ON publish.instr_id = upd1.xref_tbl_row_oid 
	AND upd1.updated_tmsmp <= publish.last_chg_tms
WHERE 
    1 = 1 
GROUP BY 
    isid.iss_id, publish.iss_grp_id, publish.last_chg_tms;
