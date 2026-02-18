update ft_t_xcfg 
set last_chg_tms =sysdate(), xml_config_clob =  
'<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE vsh SYSTEM "VSH.dtd">
<vsh process_unknown_vendor="low" update_empty_field="low_equal" update_equal_rank="true" update_high_ranked_source="yes">
	<occurrence table="ft_t_issu">
		<vendorSource>
			<source vendor="BB" rank="10"/>
			<source vendor="PMDB" rank="15"/>
			<source vendor="MTN" rank="20"/>
			<source vendor="RDW" rank="30"/>
			<source vendor="PM" rank="40"/>
		</vendorSource>
		<occurrenceFields>
			<field name="ft_t_issu.series_typ" dataType="STRING">
				<vendorSource>
					<source vendor="MTN" weight="100" rank="10"/>
					<source vendor="BB" weight="10" rank="20"/>
					<source vendor="PMDB" weight="10" rank="25"/>
					<source vendor="RDW" weight="10" rank="30"/>
				</vendorSource>
			</field>
			<field name="ft_t_issu.iss_actvy_stat_typ" dataType="STRING">
				<vendorSource>
					<source vendor="PM" weight="100" rank="10"/>
					<source vendor="PMDB" weight="100" rank="10"/>
					<source vendor="BB" weight="10" rank="20"/>
					<source vendor="RDW" weight="10" rank="30"/>
				</vendorSource>
			</field>
			<field name="ft_t_issu.pref_iss_nme" dataType="STRING">
				<vendorSource>
					<source vendor="PMDB" weight="100" rank="10"/>
					<source vendor="BB" weight="10" rank="20"/>
					<source vendor="MTN" weight="10" rank="30"/>
					<source vendor="RDW" weight="10" rank="40"/>
					<source vendor="PM" weight="10" rank="50"/>
				</vendorSource>
			</field>
			<field name="ft_t_issu.mat_exp_tms" dataType="DATETIME">
				<vendorSource>
					<source vendor="PMDB" weight="100" rank="10"/>
					<source vendor="BB" weight="10" rank="20"/>
					<source vendor="MTN" weight="10" rank="30"/>
					<source vendor="RDW" weight="10" rank="40"/>
					<source vendor="PM" weight="10" rank="50"/>
				</vendorSource>
			</field>
			<field name="ft_t_issu.iss_tms" dataType="DATETIME">
				<vendorSource>
					<source vendor="PMDB" weight="100" rank="10"/>
					<source vendor="BB" weight="10" rank="20"/>
					<source vendor="MTN" weight="10" rank="30"/>
					<source vendor="RDW" weight="10" rank="40"/>
					<source vendor="PM" weight="10" rank="50"/>
				</vendorSource>
			</field>
			<field name="ft_t_issu.denom_curr_cde" dataType="STRING">
				<vendorSource>
					<source vendor="PMDB" weight="100" rank="10"/>
					<source vendor="BB" weight="10" rank="20"/>
					<source vendor="MTN" weight="10" rank="30"/>
					<source vendor="RDW" weight="10" rank="40"/>
					<source vendor="PM" weight="10" rank="50"/>
				</vendorSource>
			</field>
		</occurrenceFields>
	</occurrence>
	<occurrence table="ft_t_bdch">
		<vendorSource>
			<source vendor="BB" rank="10"/>
			<source vendor="PMDB" rank="15"/>
			<source vendor="MTN" rank="20"/>
			<source vendor="RDW" rank="30"/>
			<source vendor="FITCH" rank="30"/>
			<source vendor="MOODYS_RDS" rank="30"/>
			<source vendor="S&amp;P" rank="30"/>
			<source vendor="PM" rank="40"/>
		</vendorSource>
		<occurrenceFields>
			<field name="ft_t_bdch.bond_rtr_meth_typ" dataType="STRING">
				<vendorSource>
					<source vendor="MTN" weight="100" rank="10"/>
					<source vendor="BB" weight="10" rank="20"/>
					<source vendor="PMDB" weight="10" rank="15"/>
					<source vendor="RDW" weight="10" rank="30"/>
					<source vendor="FITCH" weight="10" rank="30"/>
					<source vendor="MOODYS_RDS" weight="10" rank="30"/>
					<source vendor="S&amp;P" weight="10" rank="30"/>
					<source vendor="PM" weight="10" rank="40"/>
				</vendorSource>
			</field>
			<field name="ft_t_bdch.cpn_typ" dataType="STRING">
				<vendorSource>
					<source vendor="BB" weight="100" rank="10"/>
					<source vendor="PMDB" weight="10" rank="20"/>
					<source vendor="MTN" weight="10" rank="30"/>
					<source vendor="RDW" weight="10" rank="40"/>
					<source vendor="FITCH" weight="10" rank="40"/>
					<source vendor="MOODYS_RDS" weight="10" rank="40"/>
					<source vendor="S&amp;P" weight="10" rank="40"/>
					<source vendor="PM" weight="10" rank="50"/>
				</vendorSource>
			</field>
			<field name="ft_t_bdch.dted_tms" dataType="DATETIME">
				<vendorSource>
					<source vendor="PMDB" weight="100" rank="10"/>
					<source vendor="BB" weight="10" rank="20"/>
					<source vendor="MTN" weight="10" rank="30"/>
					<source vendor="RDW" weight="10" rank="40"/>
					<source vendor="FITCH" weight="10" rank="40"/>
					<source vendor="MOODYS_RDS" weight="10" rank="40"/>
					<source vendor="S&amp;P" weight="10" rank="40"/>
					<source vendor="PM" weight="10" rank="50"/>
				</vendorSource>
			</field>
		</occurrenceFields>
	</occurrence>
	<occurrence table="ft_t_uwch">
		<vendorSource>
			<source vendor="BB" rank="10"/>
			<source vendor="PMDB" rank="15"/>
			<source vendor="MTN" rank="20"/>
			<source vendor="RDW" rank="30"/>
			<source vendor="PM" rank="40"/>
		</vendorSource>
		<occurrenceFields>
			<field name="ft_t_uwch.offer_curr_cde" dataType="STRING">
				<vendorSource>
					<source vendor="PMDB" weight="100" rank="10"/>
					<source vendor="BB" weight="10" rank="20"/>
					<source vendor="MTN" weight="10" rank="30"/>
					<source vendor="RDW" weight="10" rank="40"/>
					<source vendor="PM" weight="10" rank="50"/>
				</vendorSource>
			</field>
		</occurrenceFields>
	</occurrence>
	<occurrence table="ft_t_isst">
		<vendorSource>
			<source vendor="MTN" rank="10"/>
			<source vendor="BB" rank="20"/>
			<source vendor="RDW" rank="30"/>
		</vendorSource>
		<where>
			<field value="URIDASHI" name="ft_t_isst.stat_def_id" dataType="STRING"/>
		</where>
	</occurrence>
	<occurrence table="ft_t_irid">
		<vendorSource>
			<source vendor="RDW" rank="10"/>
			<source vendor="BB" rank="20"/>
		</vendorSource>
		<where>
			<field value="CLIENTREF" name="ft_t_irid.issr_id_ctxt_typ" dataType="STRING"/>
		</where>
	</occurrence>
	<occurrence table="ft_t_isid">
		<option id="ISIN">
			<vendorSource>
				<source rank="5" vendor="PMDB"/>
				<source rank="15" vendor="BB"/>
			</vendorSource>
			<where>
				<field value="ISIN" name="ft_t_isid.id_ctxt_typ" dataType="STRING"/>
			</where>
		</option>
		<option id="SECREF">	
			<vendorSource>
				<source rank="10" vendor="RDW"/>
				<source rank="20" vendor="BB"/>
			</vendorSource>
				<where>
				<field value="SECREF" name="ft_t_isid.id_ctxt_typ" dataType="STRING"/>
			</where>
		</option>
	</occurrence>
	<occurrence table="ft_t_isrt">
		<vendorSource>
			<source vendor="FITCH" rank="10"/>
			<source vendor="MOODYS RDS" rank="10"/>
			<source vendor="S&amp;P" rank="10"/>
			<source vendor="BB" rank="20"/>
			<source vendor="RDW" rank="30"/>
		</vendorSource>
	</occurrence>
	<occurrence table="ft_t_firt">
		<vendorSource>
			<source vendor="MHI" rank="10"/>
			<source vendor="MOODY" rank="10"/>
			<source vendor="SAP" rank="10"/>
			<source vendor="FITCH" rank="10"/>
			<source vendor="JCR" rank="10"/>
			<source vendor="MOODYS RDS" rank="10"/>
			<source vendor="S&amp;P" rank="10"/>
			<source vendor="BB" rank="20"/>
			<source vendor="RDW" rank="30"/>
		</vendorSource>
	</occurrence>
	<occurrence table="ft_t_pedf">
		<vendorSource>
			<source vendor="MTN" rank="10"/>
			<source vendor="BB" rank="20"/>
			<source vendor="RDW" rank="30"/>
			<source vendor="PM" rank="40"/>
		</vendorSource>
	</occurrence>
	<occurrence table="ft_t_pevp">
		<vendorSource>
			<source vendor="MTN" rank="10"/>
			<source vendor="BB" rank="20"/>
			<source vendor="RDW" rank="30"/>
			<source vendor="PM" rank="40"/>
		</vendorSource>
	</occurrence>
	<occurrence table="ft_t_ppdf">
		<vendorSource>
			<source vendor="MTN" rank="10"/>
			<source vendor="BB" rank="20"/>
			<source vendor="RDW" rank="30"/>
			<source vendor="PM" rank="40"/>
		</vendorSource>
	</occurrence>
	<occurrence table="ft_t_gncm">
		<vendorSource>
			<source vendor="ICE" rank="10"/>
			<source vendor="BB" rank="20"/>
		</vendorSource>
		<where>
			<field value="RECRD_DT" name="ft_t_gcnm.comm_reas_mnem" dataType="STRING"/>
		</where>
	</occurrence>
	<occurrence table="all">
		<vendorSource>
			<source vendor="BB" rank="10"/>
			<source vendor="PMDB" rank="15"/>
			<source vendor="MTN" rank="20"/>
			<source vendor="RDW" rank="30"/>
			<source vendor="PM" rank="40"/>
		</vendorSource>
	</occurrence>
</vsh>'
where xml_config_mnem ='VSH';