-- DROP FUNCTION gc_own.gsgetidentifier();

CREATE OR REPLACE FUNCTION gsgetidentifier()
 RETURNS character varying
 LANGUAGE plpgsql
AS $function$  DECLARE
SEQNO NUMERIC;
p_oid varchar(100000);
err_num      varchar(100000);
err_msg      varchar(100000);
BEGIN
SELECT nextval('internal_iss_id_seq') INTO SEQNO;
p_oid:= SEQNO;
RETURN p_oid;
EXCEPTION WHEN OTHERS
THEN
err_num := SQLSTATE;
err_msg := SUBSTR(SQLERRM,1,100);
RAISE NOTICE 'Trapped Error: %', err_msg;
RETURN err_msg;
END;$function$
;