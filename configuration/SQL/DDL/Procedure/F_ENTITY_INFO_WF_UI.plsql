
--{$$-STATEMENT-$$}
CREATE OR REPLACE PROCEDURE F_ENTITY_INFO_WF_UI (
    p_modl_id              IN   VARCHAR,
    p_main_cross_ref_id     IN   VARCHAR,
    p_main_entity_nme       OUT  VARCHAR,
    p_main_entity_id        OUT  VARCHAR,
    p_main_entity_id_ctxt_typ OUT  VARCHAR
)
LANGUAGE plpgsql
AS
$body$
DECLARE
    v_entity_type VARCHAR(10);
	main_entity RECORD;
BEGIN
    -- Retrieve entity type based on the provided model ID
    SELECT TRIM(MODL_TYP) INTO v_entity_type
    FROM FT_T_MDDF
    WHERE TRIM(MODL_ID) = TRIM(p_modl_id);

    -- Check the entity type and fetch appropriate data
    IF v_entity_type = 'ISSU' THEN
        FOR main_entity IN
            SELECT pref_iss_nme AS main_entity_nme,
                   pref_iss_id AS main_entity_id,
                   pref_id_ctxt_typ AS main_entity_id_ctxt_typ
            FROM ft_t_issu
            WHERE TRIM(ft_t_issu.instr_id) = p_main_cross_ref_id
        LOOP
            p_main_entity_nme := main_entity.main_entity_nme;
            p_main_entity_id := main_entity.main_entity_id;
            p_main_entity_id_ctxt_typ := main_entity.main_entity_id_ctxt_typ;
        END LOOP;

    ELSIF v_entity_type = 'ISPC' THEN
        FOR main_entity IN
            SELECT pref_iss_nme AS main_entity_nme,
                   pref_iss_id AS main_entity_id,
                   pref_id_ctxt_typ AS main_entity_id_ctxt_typ
            FROM ft_t_ispc, ft_t_issu
            WHERE TRIM(ft_t_ispc.instr_id) = ft_t_issu.instr_id
            AND TRIM(ft_t_ispc.iss_prc_id) = p_main_cross_ref_id
        LOOP
            p_main_entity_nme := main_entity.main_entity_nme;
            p_main_entity_id := main_entity.main_entity_id;
            p_main_entity_id_ctxt_typ := main_entity.main_entity_id_ctxt_typ;
        END LOOP;

    ELSIF p_modl_id = 'CUSTCPTY' OR v_entity_type = 'CUST' THEN
        FOR main_entity IN
            SELECT cst_nme AS main_entity_nme,
                   pref_customer_id AS main_entity_id,
                   pref_id_ctxt_typ AS main_entity_id_ctxt_typ
            FROM ft_t_cust
            WHERE TRIM(ft_t_cust.cst_id) = p_main_cross_ref_id
        LOOP
            p_main_entity_nme := main_entity.main_entity_nme;
            p_main_entity_id := main_entity.main_entity_id;
            p_main_entity_id_ctxt_typ := main_entity.main_entity_id_ctxt_typ;
        END LOOP;

    ELSIF p_modl_id = 'CUST0001' OR v_entity_type = 'CUST' THEN
        FOR main_entity IN
            SELECT cst_nme AS main_entity_nme,
                   pref_customer_id AS main_entity_id,
                   pref_id_ctxt_typ AS main_entity_id_ctxt_typ
            FROM ft_t_cust
            WHERE TRIM(ft_t_cust.cst_id) = p_main_cross_ref_id
        LOOP
            p_main_entity_nme := main_entity.main_entity_nme;
            p_main_entity_id := main_entity.main_entity_id;
            p_main_entity_id_ctxt_typ := main_entity.main_entity_id_ctxt_typ;
        END LOOP;

    ELSIF p_modl_id = 'CUSTONBD' OR v_entity_type = 'CUST' THEN
        FOR main_entity IN
            SELECT cst_nme AS main_entity_nme,
                   pref_customer_id AS main_entity_id,
                   pref_id_ctxt_typ AS main_entity_id_ctxt_typ
            FROM ft_t_cust
            WHERE TRIM(ft_t_cust.cst_id) = p_main_cross_ref_id
        LOOP
            p_main_entity_nme := main_entity.main_entity_nme;
            p_main_entity_id := main_entity.main_entity_id;
            p_main_entity_id_ctxt_typ := main_entity.main_entity_id_ctxt_typ;
        END LOOP;

    ELSIF p_modl_id = 'ECMADV' OR v_entity_type = 'CUST' THEN
        FOR main_entity IN
            SELECT cst_nme AS main_entity_nme,
                   pref_customer_id AS main_entity_id,
                   pref_id_ctxt_typ AS main_entity_id_ctxt_typ
            FROM ft_t_cust
            WHERE TRIM(ft_t_cust.cst_id) = p_main_cross_ref_id
        LOOP
            p_main_entity_nme := main_entity.main_entity_nme;
            p_main_entity_id := main_entity.main_entity_id;
            p_main_entity_id_ctxt_typ := main_entity.main_entity_id_ctxt_typ;
        END LOOP;

    ELSIF p_modl_id = 'AGENTLND' OR v_entity_type = 'CUST' THEN
        FOR main_entity IN
            SELECT cst_nme AS main_entity_nme,
                   pref_customer_id AS main_entity_id,
                   pref_id_ctxt_typ AS main_entity_id_ctxt_typ
            FROM ft_t_cust
            WHERE TRIM(ft_t_cust.cst_id) = p_main_cross_ref_id
        LOOP
            p_main_entity_nme := main_entity.main_entity_nme;
            p_main_entity_id := main_entity.main_entity_id;
            p_main_entity_id_ctxt_typ := main_entity.main_entity_id_ctxt_typ;
        END LOOP;

    ELSIF p_modl_id = 'PRIMISSR' OR v_entity_type = 'CUST' THEN
        FOR main_entity IN
            SELECT cst_nme AS main_entity_nme,
                   pref_customer_id AS main_entity_id,
                   pref_id_ctxt_typ AS main_entity_id_ctxt_typ
            FROM ft_t_cust
            WHERE TRIM(ft_t_cust.cst_id) = p_main_cross_ref_id
        LOOP
            p_main_entity_nme := main_entity.main_entity_nme;
            p_main_entity_id := main_entity.main_entity_id;
            p_main_entity_id_ctxt_typ := main_entity.main_entity_id_ctxt_typ;
        END LOOP;

    ELSIF p_modl_id = 'TRID_MDL' THEN
        FOR main_entity IN
            SELECT ft_t_trid.MAIN_ENTITY_NME AS main_entity_nme,
                   ft_t_trid.MAIN_ENTITY_ID AS main_entity_id,
                   ft_t_trid.MAIN_ENTITY_ID_CTXT_TYP AS main_entity_id_ctxt_typ
            FROM ft_t_trid, ft_wf_uiwa
            WHERE TRIM(ft_t_trid.trn_id) = p_main_cross_ref_id
        LOOP
            p_main_entity_nme := main_entity.main_entity_nme;
            p_main_entity_id := main_entity.main_entity_id;
            p_main_entity_id_ctxt_typ := main_entity.main_entity_id_ctxt_typ;
        END LOOP;

    ELSIF p_modl_id = 'VDED0001' THEN
        FOR main_entity IN
            SELECT col_nme AS main_entity_nme
            FROM ft_v_vde1
            WHERE TRIM(ft_v_vde1.trn_id) = p_main_cross_ref_id
        LOOP
            p_main_entity_nme := main_entity.main_entity_nme;
        END LOOP;

    ELSIF v_entity_type = 'ISSR' THEN
        FOR main_entity IN
            SELECT issr_nme AS main_entity_nme,
                   pref_issr_id AS main_entity_id,
                   pref_id_ctxt_typ AS main_entity_id_ctxt_typ
            FROM ft_t_issr
            WHERE TRIM(ft_t_issr.instr_issr_id) = p_main_cross_ref_id
        LOOP
            p_main_entity_nme := main_entity.main_entity_nme;
            p_main_entity_id := main_entity.main_entity_id;
            p_main_entity_id_ctxt_typ := main_entity.main_entity_id_ctxt_typ;
        END LOOP;

    ELSIF v_entity_type = 'MRKT' THEN
        FOR main_entity IN
            SELECT mkt_nme AS main_entity_nme,
                   pref_mkt_id AS main_entity_id,
                   pref_mkt_id_ctxt_typ AS main_entity_id_ctxt_typ
            FROM ft_t_mrkt
            WHERE TRIM(ft_t_mrkt.mkt_oid) = p_main_cross_ref_id
        LOOP
            p_main_entity_nme := main_entity.main_entity_nme;
            p_main_entity_id := main_entity.main_entity_id;
            p_main_entity_id_ctxt_typ := main_entity.main_entity_id_ctxt_typ;
        END LOOP;

    ELSIF v_entity_type = 'FINS' THEN
        FOR main_entity IN
            SELECT inst_nme AS main_entity_nme,
                   pref_fins_id AS main_entity_id,
                   pref_fins_id_ctxt_typ AS main_entity_id_ctxt_typ
            FROM ft_t_fins
            WHERE TRIM(ft_t_fins.inst_mnem) = p_main_cross_ref_id
        LOOP
            p_main_entity_nme := main_entity.main_entity_nme;
            p_main_entity_id := main_entity.main_entity_id;
            p_main_entity_id_ctxt_typ := main_entity.main_entity_id_ctxt_typ;
        END LOOP;
    END IF;
END;
$body$
/