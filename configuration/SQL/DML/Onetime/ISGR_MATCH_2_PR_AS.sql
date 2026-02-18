INSERT INTO ft_o_mkey
(tbl_id, col_nme, match_key_nme, last_chg_tms, last_chg_usr_id)
SELECT 'ISGR', 'GRP_NME', 'ISGR_MATCH_2_PR_AS', sysdate(), 'MHI:CSTM'
FROM dual
WHERE NOT EXISTS (
    SELECT 1 
    FROM ft_o_mkey 
    WHERE match_key_nme = 'ISGR_MATCH_2_PR_AS' 
      AND col_nme = 'GRP_NME'
);


INSERT INTO ft_o_mkey
(tbl_id, col_nme, match_key_nme, last_chg_tms, last_chg_usr_id)
SELECT 'ISGR', 'ORG_ID', 'ISGR_MATCH_2_PR_AS', sysdate(), 'MHI:CSTM'
FROM dual
WHERE NOT EXISTS (
    SELECT 1 
    FROM ft_o_mkey 
    WHERE match_key_nme = 'ISGR_MATCH_2_PR_AS' 
      AND col_nme = 'ORG_ID'
);