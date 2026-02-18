--{$$-STATEMENT-$$}
DROP view IF EXISTS cdwrec_v_partyversion;

--{$$-STATEMENT-$$}
CREATE OR REPLACE VIEW mz_vw_newproductreport AS
SELECT DISTINCT
    customer_name,
    custref_id,
    stratus_ref,
    organisation,
    product_alias,
    prod_taxonomy_ref,
    prod_taxonomy,
    cust_branch AS customer_branch,
    legal_agreements,
    pao_name AS principal_account_officer,
    linked_institution,
    institution_clientref,
    institution_bbg_company_id,
    customer_active_from_date,
    cugp_start_tms,
    reopen_date,
    product_assigned_date
FROM (
    SELECT
        cust_prod.inst_mnem,
        cust_prod.cst_id,
        cust_prod.customer_name,
        cust_prod.custref_id,
        cust_prod.stratus_ref,
        cust_prod.organisation,
        cust_prod.customer_active_from_date,
        cust_prod.cugp_start_tms,
        cust_prod.reopen_date,
        cust_prod.product_assigned_date,
        cust_prod.product_alias,
        cust_prod.prod_taxonomy_ref,
        cust_prod.prod_taxonomy,
        cust_prod.cust_branch,
        cust_prod.pao_name,
        cust_prod.linked_institution,
        cust_prod.institution_clientref,
        cust_prod.institution_bbg_company_id,
        STRING_AGG(lagr.legal_agrmnt_id, ' | ' ORDER BY lagr.legal_agrmnt_id) AS legal_agreements
    FROM (
        SELECT
            inst_mnem,
            cst_id,
            customer_name,
            custref_id,
            stratus_ref,
            organisation,
            MAX(customer_active_from_date) AS customer_active_from_date,
            MAX(cugp_start_tms) AS cugp_start_tms,
            MAX(reopen_date) AS reopen_date,
            MAX(product_assigned_date) AS product_assigned_date,
            STRING_AGG(prod_alias, ' | ' ORDER BY prod_alias) AS product_alias,
            STRING_AGG(prod_taxonomy_ref, ' | ' ORDER BY prod_taxonomy_ref) AS prod_taxonomy_ref,
            STRING_AGG(prod_taxonomy, ' | ' ORDER BY prod_taxonomy) AS prod_taxonomy,
            cust_branch,
            pao_name,
            linked_institution,
            institution_clientref,
            institution_bbg_company_id
        FROM (
            SELECT DISTINCT
                cust.inst_mnem,
                cust.cst_id,
                cust.cst_nme AS customer_name,
                cuid_cref.customer_id AS custref_id,
                cuid_sref.customer_id AS stratus_ref,
                cust.cst_stat_tms AS customer_active_from_date,
                cugr.org_id AS organisation,
                cugp.start_tms AS cugp_start_tms,
                prod.prod_desc AS prod_alias,
                prod.prod_id AS prod_taxonomy_ref,
                CASE
                    WHEN (
                        (SELECT intrnl_dmn_val_nme
                         FROM ft_t_idmv
                         WHERE fld_id = (SELECT fld_id FROM ft_t_fldf WHERE ddl_nme = 'PRODLN_CL_TYP')
                           AND rtrim(intrnl_dmn_val_txt) = rtrim(plne.prodln_cl_typ))
                        || ':' || plne.prodln_nme || ':' || prod.prod_nme || ':' ||
                        (SELECT intrnl_dmn_val_nme
                         FROM ft_t_idmv
                         WHERE fld_id = (SELECT fld_id FROM ft_t_fldf WHERE ddl_nme = 'PROD_SUB_TYP')
                           AND rtrim(intrnl_dmn_val_txt) = rtrim(prod.prod_sub_typ))
                    ) = ':::'
                    THEN NULL
                    ELSE (
                        (SELECT intrnl_dmn_val_nme
                         FROM ft_t_idmv
                         WHERE fld_id = (SELECT fld_id FROM ft_t_fldf WHERE ddl_nme = 'PRODLN_CL_TYP')
                           AND rtrim(intrnl_dmn_val_txt) = rtrim(plne.prodln_cl_typ))
                        || ':' || plne.prodln_nme || ':' || prod.prod_nme || ':' ||
                        (SELECT intrnl_dmn_val_nme
                         FROM ft_t_idmv
                         WHERE fld_id = (SELECT fld_id FROM ft_t_fldf WHERE ddl_nme = 'PROD_SUB_TYP')
                           AND rtrim(intrnl_dmn_val_txt) = rtrim(prod.prod_sub_typ))
                    )
                END AS prod_taxonomy,
                csst_branch.stat_char_val_txt AS cust_branch,
                empl.emp_first_nme || ' ' || empl.emp_last_nme AS pao_name,
                fins.inst_nme AS linked_institution,
                irid_cref.issr_id AS institution_clientref,
                fiid_bbcid.fins_id AS institution_bbg_company_id,
                csst_reopdate.stat_val_dte AS reopen_date,
                prpu.pr_dte AS product_assigned_date
            FROM ft_t_cust cust
            LEFT JOIN (
                SELECT cst_id, stat_def_id, stat_val_dte
                FROM ft_t_csst
                WHERE stat_def_id = 'REOPDATE'
                  AND stat_val_dte IS NOT NULL
                  AND end_tms IS NULL
            ) csst_reopdate ON csst_reopdate.cst_id = cust.cst_id
            LEFT JOIN (
                SELECT cst_id, stat_def_id, stat_char_val_txt
                FROM ft_t_csst
                WHERE stat_def_id = 'CUSTLOC'
                  AND stat_char_val_txt IS NOT NULL
                  AND end_tms IS NULL
            ) csst_branch ON csst_branch.cst_id = cust.cst_id
            LEFT JOIN ft_t_cuid cuid_cref
                ON cust.cst_id = cuid_cref.cst_id
               AND cuid_cref.end_tms IS NULL
               AND cuid_cref.cst_id_ctxt_typ = 'CUSTREF'
            LEFT JOIN ft_t_cuid cuid_sref
                ON cust.cst_id = cuid_sref.cst_id
               AND cuid_sref.end_tms IS NULL
               AND cuid_sref.cst_id_ctxt_typ = 'STRATREF'
            LEFT JOIN ft_t_cugp cugp
                ON cugp.cst_id = cust.cst_id
               AND cugp.end_tms IS NULL
            LEFT JOIN ft_t_cugr cugr
                ON cugp.prnt_cst_grp_oid = cugr.cst_grp_oid
               AND cugr.end_tms IS NULL
            LEFT JOIN ft_t_ecur ecur
                ON ecur.cst_id = cust.cst_id
               AND ecur.rl_typ = 'PMHIACOF'
               AND ecur.end_tms IS NULL
            LEFT JOIN ft_t_empl empl
                ON empl.empl_oid = ecur.empl_oid
               AND empl.end_tms IS NULL
               AND empl.org_id = cugr.org_id
            INNER JOIN ft_t_prpu prpu
                ON prpu.cst_id = cust.cst_id
               AND prpu.end_tms IS NULL
               AND prpu.pr_dte > cust.cst_stat_tms
            LEFT JOIN ft_t_prod prod
                ON prod.prod_id = prpu.prod_id
               AND prod.org_id = prpu.prod_org_id
               AND prod.end_tms IS NULL
               AND prpu.prod_org_id = cugr.org_id
            LEFT JOIN ft_t_prlp prlp
                ON prlp.prod_id = prod.prod_id
               AND prlp.prod_org_id = prod.org_id
               AND prlp.end_tms IS NULL
            LEFT JOIN ft_t_plne plne
                ON plne.prodln_id = prlp.prnt_prodln_id
               AND plne.org_id = prlp.prnt_prodln_org_id
               AND plne.end_tms IS NULL
            LEFT JOIN ft_t_fins fins
                ON fins.inst_mnem = cust.inst_mnem
               AND fins.end_tms IS NULL
            LEFT JOIN ft_t_fiid fiid_bbcid
                ON fiid_bbcid.inst_mnem = fins.inst_mnem
               AND fiid_bbcid.end_tms IS NULL
               AND fiid_bbcid.fins_id_ctxt_typ = 'BBCMPYID'
            LEFT JOIN (
                SELECT issr.instr_issr_id, issr.fins_inst_mnem, irid.issr_id
                FROM ft_t_issr issr
                JOIN ft_t_irid irid
                  ON issr.instr_issr_id = irid.instr_issr_id
                WHERE irid.issr_id_ctxt_typ = 'CLIENTREF'
                  AND irid.end_tms IS NULL
            ) irid_cref
                ON irid_cref.fins_inst_mnem = fins.inst_mnem
            WHERE cust.cst_stat_typ NOT IN ('PROSPECT', 'CLOSED', 'PENDING')
              AND cust.end_tms IS NULL
              AND empl.emp_first_nme IS NOT NULL
        ) sub
        GROUP BY inst_mnem, cst_id, customer_name, custref_id, stratus_ref,
                 organisation, cust_branch, pao_name, linked_institution,
                 institution_clientref, institution_bbg_company_id
    ) cust_prod
    LEFT JOIN (
        SELECT lagr.agrmnt_stat_typ, flar.inst_mnem, lacv.dlr_br_nme, laid.legal_agrmnt_id
        FROM ft_t_lagr lagr
        JOIN ft_t_flar flar
          ON lagr.lagr_oid = flar.leg_agrmnt_id
         AND flar.end_tms IS NULL
         AND flar.rl_typ = 'CPTY'
        JOIN ft_t_lacv lacv
          ON flar.flar_oid = lacv.flar_oid
         AND lacv.cvg_purp_typ = 'INSCOPE'
         AND lacv.end_tms IS NULL
        JOIN ft_t_laid laid
          ON lagr.lagr_oid = laid.lagr_oid
         AND laid.lagr_id_ctxt_typ = 'LEGREF'
         AND laid.end_tms IS NULL
    ) lagr
      ON lagr.inst_mnem = cust_prod.inst_mnem
     AND EXISTS (
         SELECT 1
         FROM ft_t_csst
         WHERE stat_def_id = 'CUSTLOC'
           AND stat_char_val_txt IS NOT NULL
           AND end_tms IS NULL
           AND cst_id = cust_prod.cst_id
           AND stat_char_val_txt = lagr.dlr_br_nme
     )
    GROUP BY cust_prod.inst_mnem, cust_prod.cst_id, cust_prod.customer_name,
             cust_prod.custref_id, cust_prod.stratus_ref, cust_prod.organisation,
             cust_prod.customer_active_from_date, cust_prod.cugp_start_tms,
             cust_prod.reopen_date, cust_prod.product_assigned_date,
             cust_prod.product_alias, cust_prod.prod_taxonomy_ref,
             cust_prod.prod_taxonomy, cust_prod.cust_branch, cust_prod.pao_name,
             cust_prod.linked_institution, cust_prod.institution_clientref,
             cust_prod.institution_bbg_company_id
) final;

