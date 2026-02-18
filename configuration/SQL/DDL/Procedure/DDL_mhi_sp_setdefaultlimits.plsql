--{$$-STATEMENT-$$}
CREATE OR REPLACE PROCEDURE mhi_sp_setdefaultlimits(p_cst_id TEXT)
LANGUAGE plpgsql
AS $body$
DECLARE
    v_err_msg varchar(4000);
    v_date TIMESTAMP;
    v_limit_desc varchar(100) := 'Risk Committee Approval Not Required';
    v_limit_curr_cde varchar(3) := 'GBP';
    v_risk_lvl_num INTEGER := 2;
    v_limit_camt INTEGER := 0;
    v_limit_typ varchar(50) := 'PEAEXPLI';
    v_limit_stat_typ varchar(50) := 'Approved';
    rec RECORD;
BEGIN
    SELECT sysdate() INTO v_date FROM dual;

    FOR rec IN
        SELECT prod_id, prpu_oid, cst_id, start_tms, end_tms, last_chg_usr_id
        FROM ft_t_prpu
        WHERE TRIM(cst_id) = TRIM(p_cst_id)
    LOOP
        BEGIN
            v_date := v_date + INTERVAL '1 second';

            IF rec.end_tms IS NULL THEN
                PERFORM mhi_sp_eventlog(
                    'mhi_sp_setdefaultlimits',
                    'mhi_sp_setdefaultlimits',
                    'INSERT --- CST_ID=' || rec.cst_id || ' - PRPU_OID=' || rec.prpu_oid || ' - v_date=' || v_date
                );

                INSERT INTO ft_t_inlm (
                    inlm_oid, limit_camt, prod_id, prpu_oid, cst_id,
                    risk_lvl_num, limit_curr_cde, start_tms, limit_eff_tms,
                    limit_desc, limit_typ, limit_stat_typ, last_chg_tms, last_chg_usr_id
                )
                SELECT 
                    new_oid, 
                    v_limit_camt,
                    rec.prod_id,
                    rec.prpu_oid,
                    rec.cst_id,
                    v_risk_lvl_num,
                    v_limit_curr_cde,
                    rec.start_tms,
                    v_date,
                    v_limit_desc,
                    v_limit_typ,
                    v_limit_stat_typ,
                    sysdate(),
                    rec.last_chg_usr_id
                FROM dual
                WHERE NOT EXISTS (
                    SELECT 1
                    FROM ft_t_inlm
                    WHERE TRIM(prpu_oid) = TRIM(rec.prpu_oid)
                      AND TRIM(cst_id) = TRIM(rec.cst_id)
                      AND end_tms IS NULL
                );
            ELSE
                PERFORM mhi_sp_eventlog(
                    'mhi_sp_setdefaultlimits',
                    'mhi_sp_setdefaultlimits',
                    'UPDATE --- CST_ID=' || rec.cst_id || ' - PRPU_OID=' || rec.prpu_oid || ' - v_date=' || v_date
                );

                UPDATE ft_t_inlm
                SET end_tms = rec.end_tms,
                    last_chg_usr_id = rec.last_chg_usr_id,
                    last_chg_tms = sysdate()
                WHERE TRIM(prpu_oid) = TRIM(rec.prpu_oid)
                  AND TRIM(cst_id) = TRIM(rec.cst_id)
                  AND end_tms IS NULL;
            END IF;
        EXCEPTION WHEN OTHERS THEN
            v_err_msg := SUBSTRING(SQLERRM FROM 1 FOR 3500);
            PERFORM mhi_sp_eventlog(
                'mhi_sp_setdefaultlimits',
                'mhi_sp_setdefaultlimits',
                v_err_msg || ' --- CST_ID=' || rec.cst_id || ' - PRPU_OID=' || rec.prpu_oid || ' - v_date=' || v_date
            );
        END;
    END LOOP;
 COMMIT;   
EXCEPTION WHEN OTHERS THEN
    RAISE;
END;
$body$
/