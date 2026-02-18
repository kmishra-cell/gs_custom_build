update ft_t_begc set config_grp_nme='GLOBALSEARCH_1' where config_typ in  
(
'Account ID Context Use',
'Employee',
'Executed Trade',
'Financial Market',
'Account',
'Customer',
'Corporate Actions',
'Party',
'Product'
);

update ft_t_uimc set prnt_uimc_oid=(select uimc_oid from ft_t_uimc where link_nme ='Security Master' and config_typ ='TAB' and  last_chg_usr_id = 'CLIENT') where link_nme ='Enterprise' and config_typ ='PAGE';

delete from ft_t_uimc where link_nme='PSET-Subcustodian Master' and last_chg_usr_id='CLIENT';
delete from ft_t_uimc where link_nme='New Accounts Group' and last_chg_usr_id='CLIENT';
delete from ft_t_uimc where link_nme='Job Definition' and last_chg_usr_id='CLIENT';
delete from ft_t_uimc where link_nme='Vendor Mnemonic' and last_chg_usr_id='CLIENT';
delete from ft_t_uimc where link_nme='Vendor Data Compare Details' and last_chg_usr_id='CLIENT';
delete from ft_t_uimc where link_nme='Traceability' and last_chg_usr_id='CLIENT';
delete from ft_t_uimc where link_nme='Benchmarks and Indices' and last_chg_usr_id='CLIENT';
delete from ft_t_uimc where link_nme='Trade' and last_chg_usr_id='CLIENT';
delete from ft_t_uimc where link_nme='Subscriber' and last_chg_usr_id='CLIENT';
delete from ft_t_uimc where link_nme='Tax Withholding' and last_chg_usr_id='CLIENT';
delete from ft_t_uimc where link_nme='CA Declaration' and last_chg_usr_id='CLIENT';
delete from ft_t_uimc where link_nme='Benchmark Type' and last_chg_usr_id='CLIENT';
delete from ft_t_uimc where link_nme='CA Merge' and last_chg_usr_id='CLIENT';
delete from ft_t_uimc where link_nme='DQ Dashboard' and last_chg_usr_id='CLIENT';
delete from ft_t_uimc where link_nme='Publishing Log' and last_chg_usr_id='CLIENT';
delete from ft_t_uimc where link_nme='Vendor Feed Layout' and last_chg_usr_id='CLIENT';
delete from ft_t_uimc where link_nme='Subdivision' and last_chg_usr_id='CLIENT';
delete from ft_t_uimc where link_nme='Property Type' and last_chg_usr_id='CLIENT';
delete from ft_t_uimc where link_nme='Account Instruction Details' and last_chg_usr_id='CLIENT';
delete from ft_t_uimc where link_nme='Change Approvals' and last_chg_usr_id='CLIENT';
delete from ft_t_uimc where link_nme='CA Type' and last_chg_usr_id='CLIENT';
delete from ft_t_uimc where link_nme='Historical Trend' and last_chg_usr_id='CLIENT';
delete from ft_t_uimc where link_nme='Publishing Profile' and last_chg_usr_id='CLIENT';
delete from ft_t_uimc where link_nme='Universe Maintenance' and last_chg_usr_id='CLIENT';
delete from ft_t_uimc where link_nme='Discrete Schedule' and last_chg_usr_id='CLIENT';
delete from ft_t_uimc where link_nme='Institution Hierarchy' and last_chg_usr_id='CLIENT';
delete from ft_t_uimc where link_nme='Subscription Log' and last_chg_usr_id='CLIENT';
delete from ft_t_uimc where link_nme='Consolidated Change Approvals' and last_chg_usr_id='CLIENT';
delete from ft_t_uimc where link_nme='Data Quality Rule Execution Details' and last_chg_usr_id='CLIENT';
delete from ft_t_uimc where link_nme='Staged Vendor Data' and last_chg_usr_id='CLIENT';
delete from ft_t_uimc where link_nme='Upcoming Events' and last_chg_usr_id='CLIENT';
delete from ft_t_uimc where link_nme='Swift Outbound Message' and last_chg_usr_id='CLIENT';
delete from ft_t_uimc where link_nme='Data Quality Run Log' and last_chg_usr_id='CLIENT';
delete from ft_t_uimc where link_nme='Mortgage Pool Prefix' and last_chg_usr_id='CLIENT';
delete from ft_t_uimc where link_nme='Institution Legal Form' and last_chg_usr_id='CLIENT';
delete from ft_t_uimc where link_nme='Instruction Criteria' and last_chg_usr_id='CLIENT';
delete from ft_t_uimc where link_nme='Mortgage Aggregation' and last_chg_usr_id='CLIENT';
delete from ft_t_uimc where link_nme='Mortgage Aggregation History' and last_chg_usr_id='CLIENT';
delete from ft_t_uimc where link_nme='Schedule' and last_chg_usr_id='CLIENT';
delete from ft_t_uimc where link_nme='Schedule Activity' and last_chg_usr_id='CLIENT';
delete from ft_t_uimc where link_nme='Schedule Assignment' and last_chg_usr_id='CLIENT';
delete from ft_t_uimc where link_nme='Ledger Group' and last_chg_usr_id='CLIENT';
delete from ft_t_uimc where link_nme='Ledger Group Assignment' and last_chg_usr_id='CLIENT';
delete from ft_t_uimc where link_nme='Data Quality' and last_chg_usr_id='CLIENT';
delete from ft_t_uimc where link_nme='Data Staging' and last_chg_usr_id='CLIENT';
delete from ft_t_uimc where link_nme='Corporate Action Notification' and last_chg_usr_id='CLIENT';
delete from ft_t_uimc where link_nme='Corporate Actions' and last_chg_usr_id='CLIENT';
delete from ft_t_uimc where link_nme='Property' and last_chg_usr_id='CLIENT';
delete from ft_t_uimc where link_nme='Enterprise' and last_chg_usr_id='CLIENT';
delete from ft_t_uimc where link_nme='Entity Master' and last_chg_usr_id='CLIENT';