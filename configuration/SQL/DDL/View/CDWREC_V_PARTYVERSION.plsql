
--{$$-STATEMENT-$$}
DROP view IF EXISTS cdwrec_v_partyversion;

--{$$-STATEMENT-$$}
CREATE OR REPLACE VIEW cdwrec_v_partyversion AS
SELECT 
    irid.issr_id AS Issuer_Client_Ref,
    MAX(upd1.version) AS latest_published_version,
    publish.last_chg_tms AS latest_published_timestamp
	FROM 
		(SELECT 
			issr.instr_issr_id AS instr_issr_id,
			MAX(pbat.last_chg_tms) AS last_chg_tms
			FROM ft_t_issr issr 
				JOIN ft_t_pbat pbat ON pbat.pub_cross_ref_id = issr.instr_issr_id
			WHERE 
				pbat.published_tbl_id = 'ISSR'
				AND EXISTS (SELECT 1 FROM ft_t_irgp irgp  WHERE issr.instr_issr_id = irgp.instr_issr_id 
					AND irgp.end_tms IS NULL)
    GROUP BY 
	issr.instr_issr_id ) AS publish
JOIN 
    ft_t_irid irid 
    ON publish.instr_issr_id = irid.instr_issr_id 
    AND irid.issr_id_ctxt_typ = 'CLIENTREF'
    AND irid.end_tms IS NULL
LEFT JOIN 
    ft_t_upd1 upd1 
    ON publish.instr_issr_id = upd1.xref_tbl_row_oid 
    AND upd1.updated_tmsmp <= publish.last_chg_tms
GROUP BY 
    irid.issr_id, publish.last_chg_tms;
	
	
