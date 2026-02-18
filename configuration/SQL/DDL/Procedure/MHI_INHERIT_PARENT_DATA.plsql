--{$$-STATEMENT-$$}
CREATE OR REPLACE procedure MHI_inherit_parent_data(p_cst_id CHAR)
LANGUAGE plpgsql
AS
$body$
DECLARE
    ccrl_count           INTEGER;
    p_parent_cst_id      CHAR(12);
    child_cdoc_oid       CHAR(10);
    child_cdoc_match_count INTEGER;
    v_new_oid            VARCHAR(64);
    V_CODE               INTEGER;
    V_ERRM               VARCHAR(64);
    REC RECORD;
    REC5 RECORD;
    REC4 RECORD;
BEGIN
    RAISE NOTICE 'Proc Start';
	
    SELECT count(*) INTO ccrl_count FROM ft_t_ccrl 
	WHERE 
		prnt_Cst_id = p_cst_id AND rl_typ = 'PARENTO' AND cst_id IS NOT NULL;
		
    IF ccrl_count > 0 THEN
        SELECT cst_id INTO p_parent_cst_id FROM ft_t_ccrl 
        WHERE prnt_Cst_id = p_cst_id AND rl_typ = 'PARENTO' AND cst_id IS NOT NULL;
    END IF;


	RAISE NOTICE 'p_cst_id is: %, and p_parent_cst_id is: %', p_cst_id, p_parent_cst_id;


    FOR REC IN 
        (SELECT * FROM ft_t_cdoc WHERE cst_id = p_parent_cst_id AND end_tms IS NULL) 
    LOOP
        RAISE NOTICE 'Doc_oid is: %', REC.DOC_OID;

        SELECT COUNT(*) INTO child_cdoc_match_count FROM ft_t_cdoc 
        WHERE 
			cst_id = p_cst_id AND 
			doc_oid = REC.DOC_OID AND 
			end_tms IS NULL;

        IF child_cdoc_match_count > 0 THEN          
            SELECT CDOC_OID INTO child_cdoc_oid FROM ft_t_cdoc 
			WHERE cst_id = p_cst_id 
				AND doc_oid = REC.DOC_OID 
				AND end_tms IS NULL;


            FOR REC5 IN 
                (SELECT * FROM FT_T_CDCH WHERE CDOC_OID = REC.CDOC_OID AND end_tms IS NULL) 
            LOOP
                RAISE NOTICE 'REC 5 Created. CDOC_OID is: %', child_cdoc_oid;
				
				
				BEGIN
                    RAISE NOTICE 'Image ID is: %', REC5.DOC_IMAGE_ID;
             
                    INSERT INTO FT_T_CDCH
                    VALUES (new_oid(), child_cdoc_oid, sysdate(), NULL, REC5.DOC_IMAGE_ID, sysdate(), 'WF', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
                EXCEPTION
                    WHEN OTHERS THEN
                        V_CODE := SQLSTATE;
                        V_ERRM := LEFT(SQLERRM, 64);
                        RAISE NOTICE 'ERROR CODE: %, ERROR MESSAGE: %', v_code, v_errm;
                END;
            END LOOP;

        ELSE
            RAISE NOTICE 'Entered Else. p_cst_id is: %, and ParentDocOid is: %', p_cst_id, REC.DOC_OID;


            BEGIN
                SELECT new_oid() INTO v_new_oid;
                RAISE NOTICE 'NEW_OID is: %', v_new_oid;
            EXCEPTION
                WHEN OTHERS THEN
                    V_CODE := SQLSTATE;
                    V_ERRM := LEFT(SQLERRM, 64);
                    RAISE NOTICE 'ERROR CODE: %, ERROR MESSAGE: %', v_code, v_errm;
            END;

          
            BEGIN
                INSERT INTO FT_T_CDOC(CDOC_OID, DOC_OID, CST_ID, CST_DOC_TBL_TYP, CST_DOC_PURP_TYP, START_TMS, LAST_CHG_TMS, LAST_CHG_USR_ID) 
                VALUES (v_new_oid, REC.DOC_OID, p_cst_id, 'CUST', 'KYC', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'WF');
            EXCEPTION
                WHEN OTHERS THEN
                    V_CODE := SQLSTATE;
                     V_ERRM := LEFT(SQLERRM, 64);
                   RAISE NOTICE 'ERROR CODE: %, ERROR MESSAGE: %', v_code, v_errm;
            END;

           
            FOR REC4 IN 
                (SELECT * 
                 FROM FT_T_CDCH 
                 WHERE CDOC_OID = REC.CDOC_OID 
                   AND end_tms IS NULL) 
            LOOP
                RAISE NOTICE 'REC 4 Created';

                BEGIN
                    RAISE NOTICE 'Doc_oid: %', REC4.DOC_IMAGE_ID;
                    INSERT INTO FT_T_CDCH
                    VALUES (new_oid(), v_new_oid, CURRENT_TIMESTAMP, NULL, REC4.DOC_IMAGE_ID, CURRENT_TIMESTAMP, 'WF', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
                EXCEPTION
                    WHEN OTHERS THEN
                        V_CODE := SQLSTATE;
                        V_ERRM := LEFT(SQLERRM, 64);
                       RAISE NOTICE 'ERROR CODE: %, ERROR MESSAGE: %', v_code, v_errm;
                END;
            END LOOP;
        END IF;
    END LOOP;

EXCEPTION
    WHEN OTHERS THEN
        RAISE NOTICE 'Exception occurred';
        V_CODE := SQLSTATE;
        V_ERRM := SUBSTRING(SQLERRM FROM 1 FOR 64);
        RAISE NOTICE 'ERROR CODE: %, %', V_CODE, V_ERRM;
END;
$body$
/
