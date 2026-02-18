--{$$-STATEMENT-$$}
CREATE OR REPLACE PROCEDURE MHI_update_prpu(p_cst_id VARCHAR)
LANGUAGE plpgsql
AS 
$BODY$
DECLARE
  n_prod_count Integer; 
  REC RECORD;
  v_prpu_oid   varchar(64); 
  V_CODE       Integer; 
  V_ERRM       varchar(64); 
BEGIN
  
	RAISE NOTICE 'Proc Start';
  
	SELECT COUNT(*)
	INTO n_prod_count 
	FROM ft_t_inlm 
	WHERE Cst_id = p_cst_id 
		AND end_tms IS NULL 
		AND prpu_oid IS NULL;

	IF (n_prod_count > 0) THEN
		FOR REC IN (
				SELECT *
				FROM ft_t_inlm
				WHERE Cst_id  = p_cst_id
					AND end_tms  IS NULL
					AND prpu_oid IS NULL
			) LOOP
			BEGIN
				SELECT prpu_oid
				INTO v_prpu_oid
				FROM ft_t_prpu
				WHERE cst_id = p_cst_id
					AND prod_id  = REC.prod_id
					AND end_tms IS NULL 
					LIMIT 1;
			
				UPDATE ft_t_inlm SET prpu_oid = v_prpu_oid WHERE INLM_OID = REC.INLM_OID;
      
			EXCEPTION WHEN OTHERS THEN
				GET STACKED DIAGNOSTICS v_code = RETURNED_SQLSTATE, v_errm = MESSAGE_TEXT;
                	v_errm := LEFT(v_errm, 64);
                RAISE NOTICE 'ERROR CODE %: %', v_code, v_errm;
			END;
		END LOOP;
	END IF;

EXCEPTION
	WHEN OTHERS THEN
		RAISE NOTICE 'Exception';
    	GET STACKED DIAGNOSTICS v_code = RETURNED_SQLSTATE, v_errm = MESSAGE_TEXT;
    	v_errm := LEFT(v_errm, 64);
    	RAISE NOTICE 'ERROR CODE %: %', v_code, v_errm;
	END;
$BODY$
/