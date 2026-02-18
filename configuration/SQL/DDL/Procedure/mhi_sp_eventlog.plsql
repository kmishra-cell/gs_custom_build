--{$$-STATEMENT-$$}
CREATE OR REPLACE PROCEDURE mhi_sp_eventlog(p_event_creator character varying, p_event_desc character varying, p_event_value character varying, p_event_job_id character varying DEFAULT 'NA'::character varying, p_event_type character varying DEFAULT 'INFO'::character varying)
 LANGUAGE plpgsql
AS $procedure$
DECLARE
    v_err_msg TEXT;
BEGIN
    -- Insert event log entry
    INSERT INTO mhi_tb_eventlog (event_id, event_creator, event_desc, event_value, event_type, event_tms, event_job_id)
    VALUES (nextval('mhi_sq_eventlog'), LEFT(p_event_creator, 100), LEFT(p_event_desc, 250), LEFT(p_event_value, 4000), LEFT(p_event_type, 25), NOW(), p_event_job_id);

    --COMMIT;

EXCEPTION
    WHEN OTHERS THEN
        -- Capture the error message
        v_err_msg := SQLERRM;
        -- Log the error
        INSERT INTO mhi_tb_eventlog (event_id, event_creator, event_desc, event_value, event_type, event_tms, event_job_id)
        VALUES (nextval('mhi_sq_eventlog'), 'mhi_sp_eventlog', 'mhi_sp_eventlog procedure failed', v_err_msg, 'ERROR', NOW(), p_event_job_id);

        RAISE;

END;
$procedure$;
/