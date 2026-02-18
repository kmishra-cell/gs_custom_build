--{$$-STATEMENT-$$}
CREATE OR REPLACE PROCEDURE MHI_insert_update_group_emails(
    p_director_mail VARCHAR DEFAULT NULL,
    p_compliance_office_mail VARCHAR DEFAULT NULL,
    p_credit_office_mail VARCHAR DEFAULT NULL,
    p_front_office_mail VARCHAR DEFAULT NULL,
    p_credit_office_mngmt_mail VARCHAR DEFAULT NULL,
    p_customer_onboarding_mail VARCHAR DEFAULT NULL,
    p_account_officer_mail VARCHAR DEFAULT NULL,
    p_supersupervisor_mail VARCHAR DEFAULT NULL,
    p_allconsumersystem_mail VARCHAR DEFAULT NULL,
    p_gssupport_mail VARCHAR DEFAULT NULL
)
AS 
$body$
DECLARE
    director_mail_count INTEGER;
    compliance_office_mail_count INTEGER;
    credit_office_mail_count INTEGER;
    front_office_mail_count INTEGER;
    credit_office_mngmt_mail_count INTEGER;
    customer_onboarding_mail_count INTEGER;
    account_officer_mail_count INTEGER;
    supersupervisor_mail_count INTEGER;
    allconsumersystem_mail_count INTEGER;
    gssupport_mail_count INTEGER;
    v_new_oid VARCHAR(64);
	v_code INT;
	v_errm VARCHAR(64);
	
BEGIN
    RAISE NOTICE 'Proc Start';
  
    SELECT COUNT(*) INTO director_mail_count FROM ft_t_eadr WHERE eadr_val_num = p_director_mail 
	AND id_ctxt_typ = 'FO_DIR-EMAIL'
    AND end_tms IS NULL;

    IF director_mail_count > 0 THEN
        UPDATE ft_t_eadr
        SET eadr_val_num = p_director_mail
        WHERE id_ctxt_typ = 'FO_DIR-EMAIL';
    ELSE
        
		SELECT new_oid() INTO v_new_oid;
        INSERT INTO ft_t_eadr (
            elec_addr_id, mail_addr_id, cntry_phone_cde, area_phone_cde, phone_num_id, phone_num_ext_id,
            loc_typ, voice_ind, fax_ind, start_tms, end_tms, id_ctxt_typ, last_chg_tms, last_chg_usr_id,
            eadr_val_num, dial_instruc_txt, web_nme, long_elec_addr_txt, transit_routing_id, bank_acct_id,
            bank_acct_prime_nme, bank_acct_secnd_nme, bank_acct_typ, ach_prenote_dte, data_stat_typ, data_src_id,
            fax_num_id, mobile_num_id, e_mail_addr_txt, alt_e_mail_addr_txt
        ) VALUES (v_new_oid, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, sysdate(), NULL, 'FO_DIR-EMAIL',sysdate(), 'WF', p_director_mail, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
            NULL, NULL, NULL, NULL);
    END IF;



    SELECT COUNT(*) INTO compliance_office_mail_count
    FROM ft_t_eadr
    WHERE eadr_val_num = p_compliance_office_mail
      AND id_ctxt_typ = 'COMP-EMAIL'
      AND end_tms IS NULL;

    IF compliance_office_mail_count > 0 THEN
        UPDATE ft_t_eadr
        SET eadr_val_num = p_compliance_office_mail
        WHERE id_ctxt_typ = 'COMP-EMAIL';
    ELSE
    
        SELECT new_oid() INTO v_new_oid;
        INSERT INTO ft_t_eadr (
            elec_addr_id, mail_addr_id, cntry_phone_cde, area_phone_cde, phone_num_id, phone_num_ext_id,
            loc_typ, voice_ind, fax_ind, start_tms, end_tms, id_ctxt_typ, last_chg_tms, last_chg_usr_id,
            eadr_val_num, dial_instruc_txt, web_nme, long_elec_addr_txt, transit_routing_id, bank_acct_id,
            bank_acct_prime_nme, bank_acct_secnd_nme, bank_acct_typ, ach_prenote_dte, data_stat_typ, data_src_id,
            fax_num_id, mobile_num_id, e_mail_addr_txt, alt_e_mail_addr_txt
        ) VALUES (
            v_new_oid, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, sysdate(), NULL, 'COMP-EMAIL',
            sysdate(), 'WF', p_compliance_office_mail, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
            NULL, NULL, NULL, NULL
        );
    END IF;

 
 
    SELECT COUNT(*) INTO credit_office_mail_count
    FROM ft_t_eadr
    WHERE eadr_val_num = p_credit_office_mail
      AND id_ctxt_typ = 'CR-EMAIL'
      AND end_tms IS NULL;

    IF credit_office_mail_count > 0 THEN
        UPDATE ft_t_eadr
        SET eadr_val_num = p_credit_office_mail
        WHERE id_ctxt_typ = 'CR-EMAIL';
    ELSE
	  
        SELECT new_oid() INTO v_new_oid;
        INSERT INTO ft_t_eadr (
            elec_addr_id, mail_addr_id, cntry_phone_cde, area_phone_cde, phone_num_id, phone_num_ext_id,
            loc_typ, voice_ind, fax_ind, start_tms, end_tms, id_ctxt_typ, last_chg_tms, last_chg_usr_id,
            eadr_val_num, dial_instruc_txt, web_nme, long_elec_addr_txt, transit_routing_id, bank_acct_id,
            bank_acct_prime_nme, bank_acct_secnd_nme, bank_acct_typ, ach_prenote_dte, data_stat_typ, data_src_id,
            fax_num_id, mobile_num_id, e_mail_addr_txt, alt_e_mail_addr_txt
        ) VALUES (
            v_new_oid, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, sysdate(), NULL, 'CR-EMAIL',
            sysdate(), 'WF', p_credit_office_mail, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
            NULL, NULL, NULL, NULL
        );
    END IF;



    SELECT COUNT(*) INTO front_office_mail_count
    FROM ft_t_eadr
    WHERE eadr_val_num = p_front_office_mail
      AND id_ctxt_typ = 'FO-EMAIL'
      AND end_tms IS NULL;

    IF front_office_mail_count > 0 THEN
        UPDATE ft_t_eadr
        SET eadr_val_num = p_front_office_mail
        WHERE id_ctxt_typ = 'FO-EMAIL';
    ELSE
       
        SELECT new_oid() INTO v_new_oid;
        INSERT INTO ft_t_eadr (
            elec_addr_id, mail_addr_id, cntry_phone_cde, area_phone_cde, phone_num_id, phone_num_ext_id,
            loc_typ, voice_ind, fax_ind, start_tms, end_tms, id_ctxt_typ, last_chg_tms, last_chg_usr_id,
            eadr_val_num, dial_instruc_txt, web_nme, long_elec_addr_txt, transit_routing_id, bank_acct_id,
            bank_acct_prime_nme, bank_acct_secnd_nme, bank_acct_typ, ach_prenote_dte, data_stat_typ, data_src_id,
            fax_num_id, mobile_num_id, e_mail_addr_txt, alt_e_mail_addr_txt
        ) VALUES (v_new_oid, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, sysdate(), NULL, 'FO-EMAIL',
            sysdate(), 'WF', p_front_office_mail, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
            NULL, NULL, NULL, NULL
        );
    END IF;



    SELECT COUNT(*) INTO credit_office_mngmt_mail_count
    FROM ft_t_eadr
    WHERE eadr_val_num = p_credit_office_mngmt_mail
      AND id_ctxt_typ = 'CR_MGMT-EMAIL'
      AND end_tms IS NULL;

    IF credit_office_mngmt_mail_count > 0 THEN
        UPDATE ft_t_eadr
        SET eadr_val_num = p_credit_office_mngmt_mail
        WHERE id_ctxt_typ = 'CR_MGMT-EMAIL';
    ELSE
        		
        SELECT new_oid() INTO v_new_oid;
        INSERT INTO ft_t_eadr (
            elec_addr_id, mail_addr_id, cntry_phone_cde, area_phone_cde, phone_num_id, phone_num_ext_id,
            loc_typ, voice_ind, fax_ind, start_tms, end_tms, id_ctxt_typ, last_chg_tms, last_chg_usr_id,
            eadr_val_num, dial_instruc_txt, web_nme, long_elec_addr_txt, transit_routing_id, bank_acct_id,
            bank_acct_prime_nme, bank_acct_secnd_nme, bank_acct_typ, ach_prenote_dte, data_stat_typ, data_src_id,
            fax_num_id, mobile_num_id, e_mail_addr_txt, alt_e_mail_addr_txt
        ) VALUES (
            v_new_oid, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, sysdate(), NULL, 'CR_MGMT-EMAIL',
            sysdate(), 'WF', p_credit_office_mngmt_mail, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
            NULL, NULL, NULL, NULL
        );
    END IF;

    
	
    SELECT COUNT(*) INTO customer_onboarding_mail_count
    FROM ft_t_eadr
    WHERE eadr_val_num = p_customer_onboarding_mail
      AND id_ctxt_typ = 'COB-EMAIL'
      AND end_tms IS NULL;

    IF customer_onboarding_mail_count > 0 THEN
        UPDATE ft_t_eadr
        SET eadr_val_num = p_customer_onboarding_mail
        WHERE id_ctxt_typ = 'COB-EMAIL';
    ELSE
        
        SELECT new_oid() INTO v_new_oid;
        INSERT INTO ft_t_eadr (
            elec_addr_id, mail_addr_id, cntry_phone_cde, area_phone_cde, phone_num_id, phone_num_ext_id,
            loc_typ, voice_ind, fax_ind, start_tms, end_tms, id_ctxt_typ, last_chg_tms, last_chg_usr_id,
            eadr_val_num, dial_instruc_txt, web_nme, long_elec_addr_txt, transit_routing_id, bank_acct_id,
            bank_acct_prime_nme, bank_acct_secnd_nme, bank_acct_typ, ach_prenote_dte, data_stat_typ, data_src_id,
            fax_num_id, mobile_num_id, e_mail_addr_txt, alt_e_mail_addr_txt
        ) VALUES (
            v_new_oid, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, sysdate(), NULL, 'COB-EMAIL',
            sysdate(), 'WF', p_customer_onboarding_mail, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
            NULL, NULL, NULL, NULL
        );
    END IF;

    
    
	
	 SELECT COUNT(*) INTO account_officer_mail_count
    FROM ft_t_eadr
    WHERE eadr_val_num = p_account_officer_mail
      AND id_ctxt_typ = 'FO_PAO-EMAIL'
      AND end_tms IS NULL;

    IF account_officer_mail_count > 0 THEN
        UPDATE ft_t_eadr
        SET eadr_val_num = p_account_officer_mail
        WHERE id_ctxt_typ = 'FO_PAO-EMAIL';
    ELSE
        
        SELECT new_oid() INTO v_new_oid;
        INSERT INTO ft_t_eadr (
            elec_addr_id, mail_addr_id, cntry_phone_cde, area_phone_cde, phone_num_id, phone_num_ext_id,
            loc_typ, voice_ind, fax_ind, start_tms, end_tms, id_ctxt_typ, last_chg_tms, last_chg_usr_id,
            eadr_val_num, dial_instruc_txt, web_nme, long_elec_addr_txt, transit_routing_id, bank_acct_id,
            bank_acct_prime_nme, bank_acct_secnd_nme, bank_acct_typ, ach_prenote_dte, data_stat_typ, data_src_id,
            fax_num_id, mobile_num_id, e_mail_addr_txt, alt_e_mail_addr_txt
        ) VALUES (
            v_new_oid, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, sysdate(), NULL, 'FO_PAO-EMAIL',
            sysdate(), 'WF', p_account_officer_mail, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
            NULL, NULL, NULL, NULL
        );
    END IF;
	
	

	SELECT COUNT(*) INTO supersupervisor_mail_count
    FROM ft_t_eadr
    WHERE eadr_val_num = p_supersupervisor_mail
      AND id_ctxt_typ = 'COB_SUPER-EMAIL'
      AND end_tms IS NULL;

    IF supersupervisor_mail_count > 0 THEN
        UPDATE ft_t_eadr
        SET eadr_val_num = p_supersupervisor_mail
        WHERE id_ctxt_typ = 'COB_SUPER-EMAIL';
    ELSE
        
        SELECT new_oid() INTO v_new_oid;
        INSERT INTO ft_t_eadr (
            elec_addr_id, mail_addr_id, cntry_phone_cde, area_phone_cde, phone_num_id, phone_num_ext_id,
            loc_typ, voice_ind, fax_ind, start_tms, end_tms, id_ctxt_typ, last_chg_tms, last_chg_usr_id,
            eadr_val_num, dial_instruc_txt, web_nme, long_elec_addr_txt, transit_routing_id, bank_acct_id,
            bank_acct_prime_nme, bank_acct_secnd_nme, bank_acct_typ, ach_prenote_dte, data_stat_typ, data_src_id,
            fax_num_id, mobile_num_id, e_mail_addr_txt, alt_e_mail_addr_txt
        ) VALUES (
            v_new_oid, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, sysdate(), NULL, 'COB_SUPER-EMAIL',
            sysdate(), 'WF', p_supersupervisor_mail, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
            NULL, NULL, NULL, NULL
        );
    END IF;
	
	
	SELECT COUNT(*) INTO allconsumersystem_mail_count
    FROM ft_t_eadr
    WHERE eadr_val_num = p_allconsumersystem_mail
      AND id_ctxt_typ = 'ALL-EMAIL'
      AND end_tms IS NULL;

    IF allconsumersystem_mail_count > 0 THEN
        UPDATE ft_t_eadr
        SET eadr_val_num = p_allconsumersystem_mail
        WHERE id_ctxt_typ = 'ALL-EMAIL';
    ELSE
        
        SELECT new_oid() INTO v_new_oid;
        INSERT INTO ft_t_eadr (
            elec_addr_id, mail_addr_id, cntry_phone_cde, area_phone_cde, phone_num_id, phone_num_ext_id,
            loc_typ, voice_ind, fax_ind, start_tms, end_tms, id_ctxt_typ, last_chg_tms, last_chg_usr_id,
            eadr_val_num, dial_instruc_txt, web_nme, long_elec_addr_txt, transit_routing_id, bank_acct_id,
            bank_acct_prime_nme, bank_acct_secnd_nme, bank_acct_typ, ach_prenote_dte, data_stat_typ, data_src_id,
            fax_num_id, mobile_num_id, e_mail_addr_txt, alt_e_mail_addr_txt
        ) VALUES (
            v_new_oid, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, sysdate(), NULL, 'ALL-EMAIL',
            sysdate(), 'WF', p_allconsumersystem_mail, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
            NULL, NULL, NULL, NULL
        );
    END IF;
	
		SELECT COUNT(*) INTO gssupport_mail_count
    FROM ft_t_eadr
    WHERE eadr_val_num = p_gssupport_mail
      AND id_ctxt_typ = 'GS_SUPPORT-EMAIL'
      AND end_tms IS NULL;

    IF gssupport_mail_count > 0 THEN
        UPDATE ft_t_eadr
        SET eadr_val_num = p_gssupport_mail
        WHERE id_ctxt_typ = 'GS_SUPPORT-EMAIL';
    ELSE
        
        SELECT new_oid() INTO v_new_oid;
        INSERT INTO ft_t_eadr (
            elec_addr_id, mail_addr_id, cntry_phone_cde, area_phone_cde, phone_num_id, phone_num_ext_id,
            loc_typ, voice_ind, fax_ind, start_tms, end_tms, id_ctxt_typ, last_chg_tms, last_chg_usr_id,
            eadr_val_num, dial_instruc_txt, web_nme, long_elec_addr_txt, transit_routing_id, bank_acct_id,
            bank_acct_prime_nme, bank_acct_secnd_nme, bank_acct_typ, ach_prenote_dte, data_stat_typ, data_src_id,
            fax_num_id, mobile_num_id, e_mail_addr_txt, alt_e_mail_addr_txt
        ) VALUES (
            v_new_oid, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, sysdate(), NULL, 'GS_SUPPORT-EMAIL',
            sysdate(), 'WF', p_gssupport_mail, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
            NULL, NULL, NULL, NULL
        );
	   
END IF; 
  	
EXCEPTION
        WHEN OTHERS THEN
			RAISE NOTICE 'Exception';
			 v_code := SQLSTATE;
             v_errm := LEFT(SQLERRM, 64);
            RAISE NOTICE 'ERROR CODE: %, ERROR MESSAGE: %', v_code, v_errm;		            
end ;
$body$
LANGUAGE plpgsql ;
/          