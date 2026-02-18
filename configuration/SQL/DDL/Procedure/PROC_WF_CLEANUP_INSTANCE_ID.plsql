--{$$-STATEMENT-$$}
CREATE OR REPLACE PROCEDURE proc_wf_cleanup_instance_id(
    p_instance_id VARCHAR,
    OUT o_cleanup_log TEXT
)
LANGUAGE plpgsql
AS $$
DECLARE
    v_wfcl_oid bigint;
    v_instance_id VARCHAR;
    instance_id_arr TEXT[];
    all_instance_id_arr TEXT[] := ARRAY[]::TEXT[];
    v_total_instance_id INTEGER := 0;
    v_count INTEGER;
    v_log_time TEXT := to_char(SYSDATE(), 'YYYY-MM-DD HH24:MI:SS.MS');
    rec RECORD;
BEGIN
    -- Get next sequence value
    SELECT nextval('wfcl_seq') INTO v_wfcl_oid;
    -- Insert initial record in ft_wf_wfcl
    INSERT INTO ft_wf_wfcl(wfcl_oid, process_nme, process_stat_typ, start_tms)
    VALUES (v_wfcl_oid, 'WF CLEANUP', 'STARTED', SYSDATE());
    COMMIT;
    o_cleanup_log := v_log_time || ': Selection query string is:= Select instance_id FROM ft_wf_wfri WHERE instance_id=''' || p_instance_id || '''' || E'\n';
    UPDATE ft_wf_wfcl
    SET last_chg_tms = SYSDATE(),
        last_chg_usr_id = 'GS:WF',
        process_log_data_clob = o_cleanup_log
    WHERE wfcl_oid = v_wfcl_oid;
    COMMIT;
    -- Cursor loop over instances matching p_instance_id
    FOR rec IN 
        EXECUTE format('SELECT instance_id FROM ft_wf_wfri WHERE instance_id = %L', p_instance_id)
    LOOP
        v_instance_id := rec.instance_id;
        -- Recursive query to get all connected instance_id starting from v_instance_id
        WITH RECURSIVE instance_tree AS (
            SELECT instance_id, prnt_instance_id
            FROM ft_wf_wfri
            WHERE instance_id = v_instance_id
            UNION ALL
            SELECT child.instance_id, child.prnt_instance_id
            FROM ft_wf_wfri child
            JOIN instance_tree parent ON parent.instance_id = child.prnt_instance_id
        )
        SELECT array_agg(instance_id ORDER BY instance_id DESC)
        INTO instance_id_arr
        FROM instance_tree;
        -- Add unique instance ids to all_instance_id_arr
        IF instance_id_arr IS NOT NULL THEN
            FOREACH v_instance_id IN ARRAY instance_id_arr LOOP
                IF NOT v_instance_id = ANY(all_instance_id_arr) THEN
                    all_instance_id_arr := array_append(all_instance_id_arr, v_instance_id);
                END IF;
            END LOOP;
        END IF;
    END LOOP;
    v_total_instance_id := array_length(all_instance_id_arr, 1);
    -- Log all instance ids collected
    IF v_total_instance_id IS NOT NULL THEN
        FOR v_count IN 1..v_total_instance_id LOOP
            o_cleanup_log := o_cleanup_log || to_char(v_count) || ' ' || all_instance_id_arr[v_count] || ' ';
        END LOOP;
    END IF;
    UPDATE ft_wf_wfcl
    SET last_chg_tms = SYSDATE(),
        last_chg_usr_id = 'GS:WF',
        process_log_data_clob = o_cleanup_log
    WHERE wfcl_oid = v_wfcl_oid;
    COMMIT;
    IF v_total_instance_id > 0 THEN
        -- Perform deletes and updates for each instance id in all_instance_id_arr
        -- ft_wf_UIWA delete
        FOREACH v_instance_id IN ARRAY all_instance_id_arr LOOP
            EXECUTE 'DELETE FROM ft_wf_uiwa WHERE instance_id = $1' USING v_instance_id;
        END LOOP;
        o_cleanup_log := o_cleanup_log || to_char(SYSDATE(), 'YYYY-MM-DD HH24:MI:SS.MS') || 
                         ': ft_wf_UIWA table ' || FOUND || ' rows get deleted' || E'\n';
        UPDATE ft_wf_wfcl SET last_chg_tms = SYSDATE(), last_chg_usr_id = 'GS:WF', process_log_data_clob = o_cleanup_log WHERE wfcl_oid = v_wfcl_oid;
        COMMIT;
        -- ft_wf_wfrv delete where exists ft_wf_tokn for variable_id and instance_id
        FOREACH v_instance_id IN ARRAY all_instance_id_arr LOOP
            EXECUTE
                'DELETE FROM ft_wf_wfrv t WHERE EXISTS (SELECT 1 FROM ft_wf_tokn WHERE token_id = t.variable_id AND instance_id = $1)'
                USING v_instance_id;
        END LOOP;
        o_cleanup_log := o_cleanup_log || to_char(SYSDATE(), 'YYYY-MM-DD HH24:MI:SS.MS') ||
                         ': ft_wf_wfrv table ' || FOUND || ' rows get deleted' || E'\n';
        UPDATE ft_wf_wfcl SET last_chg_tms = SYSDATE(), last_chg_usr_id = 'GS:WF', process_log_data_clob = o_cleanup_log WHERE wfcl_oid = v_wfcl_oid;
        COMMIT;
        -- ft_wf_wfrv delete by variable_id = instance_id? (Oracle version deletes by instance_id - keep consistent)
        FOREACH v_instance_id IN ARRAY all_instance_id_arr LOOP
            EXECUTE 'DELETE FROM ft_wf_wfrv WHERE variable_id = $1' USING v_instance_id;
        END LOOP;
        o_cleanup_log := o_cleanup_log || to_char(SYSDATE(), 'YYYY-MM-DD HH24:MI:SS.MS') ||
                         ': ft_wf_wfrv table ' || FOUND || ' rows get deleted' || E'\n';
        UPDATE ft_wf_wfcl SET last_chg_tms = SYSDATE(), last_chg_usr_id = 'GS:WF', process_log_data_clob = o_cleanup_log WHERE wfcl_oid = v_wfcl_oid;
        COMMIT;
        -- ft_wf_wfdv delete
        FOREACH v_instance_id IN ARRAY all_instance_id_arr LOOP
            EXECUTE 'DELETE FROM ft_wf_wfdv WHERE instance_id = $1' USING v_instance_id;
        END LOOP;
        o_cleanup_log := o_cleanup_log || to_char(SYSDATE(), 'YYYY-MM-DD HH24:MI:SS.MS') ||
                         ': ft_wf_wfdv table ' || FOUND || ' rows get deleted' || E'\n';
        UPDATE ft_wf_wfcl SET last_chg_tms = SYSDATE(), last_chg_usr_id = 'GS:WF', process_log_data_clob = o_cleanup_log WHERE wfcl_oid = v_wfcl_oid;
        COMMIT;
        -- ft_wf_wfti delete where exists token and instance_id
        FOREACH v_instance_id IN ARRAY all_instance_id_arr LOOP
            EXECUTE
                'DELETE FROM ft_wf_wfti t WHERE EXISTS (SELECT 1 FROM ft_wf_tokn WHERE t.token_id = token_id AND instance_id = $1)'
                USING v_instance_id;
        END LOOP;
        o_cleanup_log := o_cleanup_log || to_char(SYSDATE(), 'YYYY-MM-DD HH24:MI:SS.MS') ||
                         ': ft_wf_wfti table ' || FOUND || ' rows get deleted' || E'\n';
        UPDATE ft_wf_wfcl SET last_chg_tms = SYSDATE(), last_chg_usr_id = 'GS:WF', process_log_data_clob = o_cleanup_log WHERE wfcl_oid = v_wfcl_oid;
        COMMIT;
        -- ft_wf_tktj delete
        FOREACH v_instance_id IN ARRAY all_instance_id_arr LOOP
            EXECUTE
                'DELETE FROM ft_wf_tktj t WHERE EXISTS (SELECT 1 FROM ft_wf_tokn WHERE t.token_id = token_id AND instance_id = $1)'
                USING v_instance_id;
        END LOOP;
        o_cleanup_log := o_cleanup_log || to_char(SYSDATE(), 'YYYY-MM-DD HH24:MI:SS.MS') ||
                         ': ft_wf_tktj table ' || FOUND || ' rows get deleted' || E'\n';
        UPDATE ft_wf_wfcl SET last_chg_tms = SYSDATE(), last_chg_usr_id = 'GS:WF', process_log_data_clob = o_cleanup_log WHERE wfcl_oid = v_wfcl_oid;
        COMMIT;
        -- ft_wf_tktn delete
        FOREACH v_instance_id IN ARRAY all_instance_id_arr LOOP
            EXECUTE
                'DELETE FROM ft_wf_tktn t WHERE EXISTS (SELECT 1 FROM ft_wf_tokn tok WHERE from_token_id = tok.token_id AND tok.instance_id = $1)'
                USING v_instance_id;
        END LOOP;
        o_cleanup_log := o_cleanup_log || to_char(SYSDATE(), 'YYYY-MM-DD HH24:MI:SS.MS') ||
                         ': ft_wf_tktn table ' || FOUND || ' rows get deleted' || E'\n';
        UPDATE ft_wf_wfcl SET last_chg_tms = SYSDATE(), last_chg_usr_id = 'GS:WF', process_log_data_clob = o_cleanup_log WHERE wfcl_oid = v_wfcl_oid;
        COMMIT;
        -- ft_wf_tokn update set prev_token_id and split_token_id to NULL
        FOREACH v_instance_id IN ARRAY all_instance_id_arr LOOP
            EXECUTE
                'UPDATE ft_wf_tokn SET prev_token_id = NULL, split_token_id = NULL WHERE instance_id = $1'
                USING v_instance_id;
        END LOOP;
        o_cleanup_log := o_cleanup_log || to_char(SYSDATE(), 'YYYY-MM-DD HH24:MI:SS.MS') ||
                         ': ft_wf_tokn table ' || FOUND || ' rows updated' || E'\n';
        UPDATE ft_wf_wfcl SET last_chg_tms = SYSDATE(), last_chg_usr_id = 'GS:WF', process_log_data_clob = o_cleanup_log WHERE wfcl_oid = v_wfcl_oid;
        COMMIT;
        -- ft_wf_wfri update set prnt_token_id to NULL
        FOREACH v_instance_id IN ARRAY all_instance_id_arr LOOP
            EXECUTE
                'UPDATE ft_wf_wfri SET prnt_token_id = NULL WHERE instance_id = $1'
                USING v_instance_id;
        END LOOP;
        o_cleanup_log := o_cleanup_log || to_char(SYSDATE(), 'YYYY-MM-DD HH24:MI:SS.MS') ||
                         ': ft_wf_wfri table ' || FOUND || ' rows updated' || E'\n';
        UPDATE ft_wf_wfcl SET last_chg_tms = SYSDATE(), last_chg_usr_id = 'GS:WF', process_log_data_clob = o_cleanup_log WHERE wfcl_oid = v_wfcl_oid;
        COMMIT;
        -- ft_wf_tokn delete by instance_id
        FOREACH v_instance_id IN ARRAY all_instance_id_arr LOOP
            EXECUTE 'DELETE FROM ft_wf_tokn WHERE instance_id = $1' USING v_instance_id;
        END LOOP;
        o_cleanup_log := o_cleanup_log || to_char(SYSDATE(), 'YYYY-MM-DD HH24:MI:SS.MS') ||
                         ': ft_wf_tokn table ' || FOUND || ' rows deleted' || E'\n';
        UPDATE ft_wf_wfcl SET last_chg_tms = SYSDATE(), last_chg_usr_id = 'GS:WF', process_log_data_clob = o_cleanup_log WHERE wfcl_oid = v_wfcl_oid;
        COMMIT;
        -- ft_wf_wfri delete by instance_id
        FOREACH v_instance_id IN ARRAY all_instance_id_arr LOOP
            EXECUTE 'DELETE FROM ft_wf_wfri WHERE instance_id = $1' USING v_instance_id;
        END LOOP;
        o_cleanup_log := o_cleanup_log || to_char(SYSDATE(), 'YYYY-MM-DD HH24:MI:SS.MS') ||
                         ': ft_wf_wfri table ' || FOUND || ' rows deleted' || E'\n';
        
        o_cleanup_log := o_cleanup_log || to_char(SYSDATE(), 'YYYY-MM-DD HH24:MI:SS.MS') || ': Procedure ends successfully.' || E'\n';
        UPDATE ft_wf_wfcl
        SET last_chg_tms = SYSDATE(),
            last_chg_usr_id = 'GS:WF',
            process_log_data_clob = o_cleanup_log,
            end_tms = SYSDATE(),
            process_stat_typ = 'COMPLETED'
        WHERE wfcl_oid = v_wfcl_oid;
        COMMIT;
    ELSE
        o_cleanup_log := o_cleanup_log || to_char(SYSDATE(), 'YYYY-MM-DD HH24:MI:SS.MS') || ': Procedure ends successfully.' || E'\n';
        UPDATE ft_wf_wfcl
        SET last_chg_tms = SYSDATE(),
            last_chg_usr_id = 'GS:WF',
            process_log_data_clob = o_cleanup_log,
            end_tms = SYSDATE(),
            process_stat_typ = 'COMPLETED'
        WHERE wfcl_oid = v_wfcl_oid;
        COMMIT;
    END IF;
EXCEPTION WHEN OTHERS THEN
    o_cleanup_log := o_cleanup_log || to_char(SYSDATE(), 'YYYY-MM-DD HH24:MI:SS.MS') || ': Error occurred during processing ' || SQLERRM || E'\n';
    ROLLBACK;
    UPDATE ft_wf_wfcl
    SET last_chg_tms = SYSDATE(),
        last_chg_usr_id = 'GS:WF',
        process_log_data_clob = o_cleanup_log,
        process_stat_typ = 'FAILED'
    WHERE wfcl_oid = v_wfcl_oid;
    COMMIT;
END;
$$;
/