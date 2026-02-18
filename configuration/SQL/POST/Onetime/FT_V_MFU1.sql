CREATE OR REPLACE VIEW FT_V_MFU1 AS
    SELECT
        inst_mnem as MFU1_INST_MNEM, pref_fins_id_ctxt_typ as MFU1_PREFFINSIDCTXTTYP , pref_fins_id as MFU1_PREFFINSID , inst_nme,
        mhi_fins_up(inst_mnem) AS PRNT_INSTMNEM,
        null as PRNT_PREFFINSID,
        null as PRNT_PREFFINSIDCTXTTYP
    FROM
        ft_t_fins f ;
 
GRANT SELECT ON FT_V_MFU1 TO gc_app;