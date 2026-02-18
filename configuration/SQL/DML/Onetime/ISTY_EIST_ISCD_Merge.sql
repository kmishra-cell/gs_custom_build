update ft_t_isty set prnt_iss_typ='DEBT', last_chg_usr_id='MIZUHO', last_chg_tms=sysdate() where iss_typ='ABS';
update ft_t_isty set prnt_iss_typ='DEBT', last_chg_usr_id='MIZUHO', last_chg_tms=sysdate() where iss_typ='BOND';
update ft_t_isty set prnt_iss_typ='DEBT', last_chg_usr_id='MIZUHO', last_chg_tms=sysdate() where iss_typ='CASHSEC';
update ft_t_isty set prnt_iss_typ='DEBT', last_chg_usr_id='MIZUHO', last_chg_tms=sysdate() where iss_typ='CMBS';
update ft_t_isty set prnt_iss_typ='DEBT', last_chg_usr_id='MIZUHO', last_chg_tms=sysdate() where iss_typ='COML PPR';
update ft_t_isty set prnt_iss_typ='DEBT', last_chg_usr_id='MIZUHO', last_chg_tms=sysdate() where iss_typ='CVTBOND';
update ft_t_isty set prnt_iss_typ='EQSHR', last_chg_usr_id='MIZUHO', last_chg_tms=sysdate() where iss_typ='EQSHR';
update ft_t_isty set prnt_iss_typ='DEBT', last_chg_usr_id='MIZUHO', last_chg_tms=sysdate() where iss_typ='FIXDBOND';
update ft_t_isty set prnt_iss_typ='EQSHR', last_chg_usr_id='MIZUHO', last_chg_tms=sysdate() where iss_typ='FUND';
update ft_t_isty set prnt_iss_typ='EQSHR', last_chg_usr_id='MIZUHO', last_chg_tms=sysdate() where iss_typ='HYBRID';
update ft_t_isty set prnt_iss_typ='DEBT', last_chg_usr_id='MIZUHO', last_chg_tms=sysdate() where iss_typ='LOAN';
update ft_t_isty set prnt_iss_typ='EQSHR', last_chg_usr_id='MIZUHO', last_chg_tms=sysdate() where iss_typ='MISC';
update ft_t_isty set prnt_iss_typ='DEBT', last_chg_usr_id='MIZUHO', last_chg_tms=sysdate() where iss_typ='MORTGAGE';
update ft_t_isty set prnt_iss_typ='EQSHR', last_chg_usr_id='MIZUHO', last_chg_tms=sysdate() where iss_typ='PFD';
update ft_t_isty set prnt_iss_typ='EQSHR', last_chg_usr_id='MIZUHO', last_chg_tms=sysdate() where iss_typ='REALESTA';
update ft_t_isty set prnt_iss_typ='EQSHR', last_chg_usr_id='MIZUHO', last_chg_tms=sysdate() where iss_typ='RECEIPTS';
update ft_t_isty set prnt_iss_typ='EQSHR', last_chg_usr_id='MIZUHO', last_chg_tms=sysdate() where iss_typ='RIGHTS';
update ft_t_isty set prnt_iss_typ='DEBT', last_chg_usr_id='MIZUHO', last_chg_tms=sysdate() where iss_typ='TBOND';
update ft_t_isty set prnt_iss_typ='EQSHR', last_chg_usr_id='MIZUHO', last_chg_tms=sysdate() where iss_typ='UNIT';
update ft_t_isty set prnt_iss_typ='EQSHR', last_chg_usr_id='MIZUHO', last_chg_tms=sysdate() where iss_typ='WARRANTS';
update ft_t_isty set prnt_iss_typ='DEBT', last_chg_usr_id='MIZUHO', last_chg_tms=sysdate() where iss_typ='ZERO CPN';

update ft_t_eist set iscd_oid='CDSWP===BB', last_chg_tms=sysdate(), last_chg_usr_id='MIZUHO' where eist_oid='BB=====140';
update ft_t_eist set iscd_oid='CASHSEC===', last_chg_tms=sysdate(), last_chg_usr_id='MIZUHO' where eist_oid='BB====1042';
update ft_t_eist set iscd_oid='FUTURES===', last_chg_tms=sysdate(), last_chg_usr_id='MIZUHO' where eist_oid='BB====1045';
update ft_t_eist set iscd_oid='FINCOMDTY=', last_chg_tms=sysdate(), last_chg_usr_id='MIZUHO' where eist_oid='BB====1046';
update ft_t_eist set iscd_oid='CASHSEC===', last_chg_tms=sysdate(), last_chg_usr_id='MIZUHO' where eist_oid='BB====1058';
update ft_t_eist set iscd_oid='FUTURES===', last_chg_tms=sysdate(), last_chg_usr_id='MIZUHO' where eist_oid='BB====1083';
update ft_t_eist set iscd_oid='INDEX=====', last_chg_tms=sysdate(), last_chg_usr_id='MIZUHO' where eist_oid='CDSINDEX==';

commit;


update ft_t_isty set  iss_typ_clsf_nme = 'MBS' where iss_typ='ABS'; 	
update ft_t_isty set  iss_typ_clsf_nme = 'Futures' where iss_typ='COMFUT'; 	
update ft_t_isty set  iss_typ_clsf_nme = '' where iss_typ='CLO'; 	
update ft_t_isty set  iss_typ_clsf_nme = '' where iss_typ='CMBS'; 	
update ft_t_isty set  iss_typ_clsf_nme = '' where iss_typ='RMBS'; 	


update ft_t_isty set  iss_typ_clsf_nme = 'Bonds' where iss_typ='BOND';
update ft_t_isty set  iss_typ_clsf_nme = 'Bonds' where iss_typ='CASHSEC';
update ft_t_isty set  iss_typ_clsf_nme = 'MBS' where iss_typ='CMBS';
update ft_t_isty set  iss_typ_clsf_nme = 'Bonds' where iss_typ='COML PPR';
update ft_t_isty set  iss_typ_clsf_nme = 'ConvertibleBond'  where iss_typ='CVTBOND';
update ft_t_isty set  iss_typ_clsf_nme = 'Equity'  where iss_typ='EQSHR';
update ft_t_isty set  iss_typ_clsf_nme = 'Bonds'   where iss_typ='FIXDBOND';
update ft_t_isty set  iss_typ_clsf_nme = 'MutualFund'  where iss_typ='FUND';
update ft_t_isty set  iss_typ_clsf_nme = 'Bonds'  where iss_typ='LOAN';
update ft_t_isty set  iss_typ_clsf_nme = 'MBS'  where iss_typ='MORTGAGE';
update ft_t_isty set  iss_typ_clsf_nme = 'Preferred'   where iss_typ='PFD';
update ft_t_isty set  iss_typ_clsf_nme = 'Equity'   where iss_typ='REALESTA';
update ft_t_isty set  iss_typ_clsf_nme = 'Warrants'  where iss_typ='RECEIPTS';
update ft_t_isty set  iss_typ_clsf_nme = 'Warrants'   where iss_typ='RIGHTS';
update ft_t_isty set  iss_typ_clsf_nme = 'Bonds'   where iss_typ='TBOND';
update ft_t_isty set  iss_typ_clsf_nme = 'Equity'  where iss_typ='UNIT';
update ft_t_isty set  iss_typ_clsf_nme = 'Warrants'   where iss_typ='WARRANTS';
update ft_t_isty set  iss_typ_clsf_nme = 'Bonds'   where iss_typ='ZERO CPN';

commit;



