update
	ft_t_begc
set
	config_val_txt = 'from Bonds where <sql>INSTR_ID IN (SELECT INSTR_ID  FROM (select ROW_NUMBER () OVER (ORDER BY INSTR_ID) + 0 as ROWNUM1, INSTR_ID from (SELECT INSTR_ID   FROM  ft_t_issu WHERE 1 = 1 AND ( (ft_t_issu.start_tms IS NULL OR ft_t_issu.start_tms <= LOCALTIMESTAMP(0)) AND (ft_t_issu.end_tms IS NULL OR ft_t_issu.end_tms >= LOCALTIMESTAMP(0)))  AND (UPPER  (ft_t_issu.pref_iss_nme) LIKE UPPER (''searchText%'')) UNION SELECT  INSTR_ID FROM ft_t_issu issu INNER JOIN ft_t_isid isid USING (instr_id) WHERE  1 = 1 AND ( (issu.start_tms IS NULL OR  issu.start_tms <= LOCALTIMESTAMP(0)) AND (issu.end_tms IS NULL OR issu.end_tms >= LOCALTIMESTAMP(0))) AND UPPER (isid.iss_id) LIKE UPPER (''searchText%'') AND ( (isid.start_tms IS NULL OR isid.start_tms <= LOCALTIMESTAMP(0))  AND (isid.end_tms IS NULL OR isid.end_tms >= LOCALTIMESTAMP(0)))) alias1)alias2 WHERE ROWNUM1<=50)</sql>'
where
	config_grp_nme = 'GLOBALSEARCH'
	and begc_oid = 'ISSUSEARCH';
	
commit ;	