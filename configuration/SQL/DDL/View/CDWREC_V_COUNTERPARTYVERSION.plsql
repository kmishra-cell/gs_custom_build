
--{$$-STATEMENT-$$}
DROP view IF EXISTS cdwrec_v_counterpartyversion;

--{$$-STATEMENT-$$}
CREATE OR REPLACE VIEW cdwrec_v_counterpartyversion 
AS
SELECT 
    cuid.customer_id AS Customer_Ref,
    MAX(upd1.version) AS latest_published_version,
    publish.last_chg_tms AS latest_published_timestamp
	FROM 
		( SELECT 
			cust.cst_id AS cst_id,
			MAX(pbat.last_chg_tms) AS last_chg_tms
		FROM 
			ft_t_cust cust
		JOIN 
        ft_t_pbat pbat 
        ON pbat.pub_cross_ref_id = cust.cst_id
		WHERE 
			pbat.published_tbl_id = 'CUST'
		GROUP BY 
			cust.cst_id
		) AS publish
JOIN 
    ft_t_cuid cuid 
    ON publish.cst_id = cuid.cst_id 
    AND cuid.cst_id_ctxt_typ = 'CUSTREF'
    AND cuid.end_tms IS NULL 
LEFT JOIN 
    ft_t_upd1 upd1 
    ON TRIM(publish.cst_id) = TRIM(upd1.xref_tbl_row_oid) 
    AND upd1.updated_tmsmp <= publish.last_chg_tms
GROUP BY 
    cuid.customer_id, publish.last_chg_tms;
	
	
