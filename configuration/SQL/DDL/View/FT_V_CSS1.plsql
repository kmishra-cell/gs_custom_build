
--{$$-STATEMENT-$$}
DROP view IF EXISTS FT_V_CSS1;

--{$$-STATEMENT-$$}
CREATE OR REPLACE VIEW FT_V_CSS1 
AS 
    SELECT csst.cst_id, 
           csst.stat_id,
           csst.stat_def_id, 
           csst.stat_val_tms, 
           csst.stat_val_dte,
           CASE WHEN csst.stat_char_val_txt = 'Other -' THEN csst.stat_char_val_txt || ' ' || cucm.cmnt_txt  
				ELSE csst.stat_char_val_txt 
				END AS stat_char_val_txt,
           csst.stat_int_val_num, 
           csst.denom_curr_cde, 
           csst.stat_val_camt,
           csst.start_tms, 
           csst.end_tms, 
           csst.data_stat_typ, 
           csst.last_chg_tms
FROM 
	ft_t_csst csst
LEFT JOIN 
	ft_t_cucm cucm 
		ON csst.cst_id = cucm.cst_id 
        AND cucm.cmnt_reas_typ = 'LEGALSTAOTHER'
        AND cucm.end_tms IS NULL
        AND csst.end_tms IS NULL;


