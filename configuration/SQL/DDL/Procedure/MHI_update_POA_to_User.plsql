--{$$-STATEMENT-$$}
CREATE OR REPLACE PROCEDURE MHI_update_POA_to_User (p_userid VARCHAR)
LANGUAGE plpgsql
AS 
$body$
DECLARE
	v_empl_oid VARCHAR(64);
  	v_cl_value VARCHAR(64);
  	v_clsf_oid  VARCHAR(64);
	V_CODE INTEGER;
	V_ERRM VARCHAR(64);
  	REC RECORD;
	
BEGIN
	  
    RAISE NOTICE 'Proc Start';

    SELECT empl_oid 
    INTO v_empl_oid 
    FROM ft_T_ausr 
    WHERE usr_id = p_userid;   
    
    SELECT  
    	ft_t_incl.cl_value,
    	ft_t_incl.clsf_oid 
    INTO v_cl_value, v_clsf_oid
    FROM ft_t_incl, ft_t_incs 
    WHERE ft_t_incs.indus_cl_set_id = ft_t_incl.indus_cl_set_id 
    AND ft_T_incs.INDUS_CL_SET_ID ='DEPARTME' AND CL_VALUE='Securities Services' AND CL_NME='Other';    
    
  
	FOR REC IN (select cst_id from ft_t_cust where last_chg_usr_id='MIGRATION_CC') 
	LOOP
		  
       UPDATE ft_t_ecur 
       SET empl_oid = v_empl_oid 
       WHERE CST_ID = REC.cst_id
       AND rl_typ='PMHIACOF';

       UPDATE FT_T_CUCL 
       SET CL_VALUE = v_cl_value ,
       CLSF_OID= v_clsf_oid        
       WHERE CST_ID = REC.cst_id 
       AND INDUS_CL_SET_ID='DEPARTME';

	END LOOP;	


		 
	EXCEPTION
	  WHEN OTHERS THEN
		RAISE NOTICE 'Exception';
    	GET STACKED DIAGNOSTICS v_code = RETURNED_SQLSTATE, v_errm = MESSAGE_TEXT;
    	v_errm := LEFT(v_errm, 64);
    	RAISE NOTICE 'ERROR CODE %: %', v_code, v_errm;
	END;
$body$
/