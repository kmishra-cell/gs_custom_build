--{$$-STATEMENT-$$}
CREATE OR REPLACE PROCEDURE mhi_p_wf_delete(p_days INTEGER)
LANGUAGE plpgsql
AS 
$body$
DECLARE
    a TEXT; 
    instance_id_arr TEXT[];
    rec_instance TEXT;
BEGIN
    SELECT ARRAY_AGG(wfri.instance_id)
    INTO instance_id_arr
    FROM ft_wf_wfri wfri
    JOIN ft_wf_wfdf wfdf ON wfri.workflow_id = wfdf.workflow_id
    WHERE (
        (wfri.workflow_start_tms < DATE_TRUNC('day', sysdate()) - INTERVAL '1 day' * p_days AND wfdf.workflow_nme != 'MainONBDWrapper')
        OR
        (wfri.workflow_end_tms < DATE_TRUNC('day', sysdate()) - INTERVAL '1 day' * p_days AND wfdf.workflow_nme = 'MainONBDWrapper')
    )
    AND wfri.prnt_instance_id IS NULL
    AND wfri.instance_id NOT IN (
        WITH RECURSIVE wf_tree AS (
            SELECT ffrl.instance_id, ffrl.prnt_instance_id
            FROM ft_wf_wfri ffrl
            WHERE ffrl.instance_id IN (
                SELECT instance_id FROM ft_wf_uiwa WHERE result_cde IS NULL
            )
            UNION ALL
            SELECT f.instance_id, f.prnt_instance_id
            FROM ft_wf_wfri f
            JOIN wf_tree wt ON f.prnt_instance_id = wt.instance_id
        )
        SELECT instance_id FROM wf_tree
    );

    FOREACH rec_instance IN ARRAY instance_id_arr
    LOOP
        CALL proc_wf_cleanup_instance_id(rec_instance, a);
    END LOOP;

END;
$body$
/
