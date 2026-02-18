UPDATE FT_T_MDDF SET modl_schema = '<?xml version="1.0" encoding="UTF-8"?>
<model xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="../../schemas/Model.xsd" id="GUNT_PUB">
	<occurrence id="GUNT_PUB" table="ft_t_gunt" level="1">
		<where activeOnly="false"/>
		<inputFields>
			<field name="ft_t_gunt.prnt_gu_cnt" level="1"/>
			<field name="ft_t_gunt.prnt_gu_id" level="1"/>
			<field name="ft_t_gunt.prnt_gu_typ" level="1"/>
			<field name="ft_t_gunt.start_tms" level="1"/>
			<field name="ft_t_gunt.stop_pay_ind" level="1"/>
			<field name="ft_t_gunt.gu_cnt" dataType="NUMBER"/>
			<field name="ft_t_gunt.gu_id" dataType="STRING"/>
			<field name="ft_t_gunt.gu_typ" dataType="STRING"/>
			<field name="ft_t_gunt.cross_ref_id" dataType="STRING"/>
			<field name="ft_t_gunt.data_stat_typ" dataType="STRING"/>
			<field name="ft_t_gunt.gu_desc" dataType="STRING"/>
			<field name="ft_t_gunt.gu_nme" dataType="STRING"/>
			<field name="ft_t_gunt.last_chg_tms" dataType="DATETIME"/>
			<field name="ft_t_gunt.pref_curr_cde" dataType="STRING"/>
			<field name="ft_t_gunt.end_tms" dataType="DATETIME"/>
			<field name="ft_t_gunt.last_chg_usr_id" dataType="STRING"/>
			<field name="ft_t_gunt.data_src_id" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_guid" id="GUID" parentId="GUNT_PUB" label="GeounitIdentifiers" multiple="true" dbConstraint="GUIDF001">
		<inputFields>
			<field name="ft_t_guid.gu_id_ctxt_typ" dataType="STRING"/>
			<field name="ft_t_guid.geo_unit_id" dataType="STRING"/>
			<field name="ft_t_guid.start_tms" dataType="DATETIME"/>
			<field name="ft_t_guid.last_chg_tms" dataType="DATETIME"/>
			<field name="ft_t_guid.last_chg_usr_id" dataType="STRING"/>
			<field name="ft_t_guid.end_tms" dataType="DATETIME"/>
			<field name="ft_t_guid.data_src_id" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_gure" id="GURE" parentId="GUNT_PUB" label="GeounitRelationship" dbConstraint="GUREF002">
		<where activeOnly="false"/>
		<inputFields>
			<field name="ft_t_gure.gu_rel_typ" dataType="STRING"/>
			<field name="ft_t_gure.start_tms" dataType="DATETIME"/>
			<field name="ft_t_gure.gu_rel_desc" dataType="STRING"/>
			<field name="ft_t_gure.last_chg_tms" dataType="DATETIME"/>
			<field name="ft_t_gure.end_tms" dataType="DATETIME"/>
			<field name="ft_t_gure.gu1_cnt" dataType="NUMBER"/>
			<field name="ft_t_gure.gu1_id" dataType="STRING"/>
			<field name="ft_t_gure.gu1_typ" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_gunt" id="GUNT2" parentId="GURE" label="ParentGeounit" dbConstraint="GUREF001">
		<inputFields>
			<field name="ft_t_gunt.gu_desc" dataType="STRING"/>
			<field name="ft_t_gunt.gu_cnt" dataType="NUMBER"/>
			<field name="ft_t_gunt.gu_id" dataType="STRING"/>
			<field name="ft_t_gunt.gu_nme" dataType="STRING"/>
			<field name="ft_t_gunt.gu_typ" dataType="STRING"/>
			<field name="ft_t_gunt.start_tms" dataType="DATETIME"/>
			<field name="ft_t_gunt.last_chg_tms" dataType="DATETIME"/>
			<field name="ft_t_gunt.last_chg_usr_id" dataType="STRING"/>
			<field name="ft_t_gunt.data_src_id" dataType="STRING"/>
			<field name="ft_t_gunt.end_tms" dataType="DATETIME"/>
			<field name="ft_t_gunt.prnt_gu_cnt" dataType="NUMBER"/>
			<field name="ft_t_gunt.prnt_gu_id" dataType="STRING"/>
			<field name="ft_t_gunt.prnt_gu_typ" dataType="STRING"/>
			<field name="ft_t_gunt.stop_pay_ind" dataType="STRING" doNotPublish="true"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_gugp" id="GUGP" parentId="GUNT_PUB" label="GeounitGroupParticipant" multiple="true">
		<where activeOnly="false"/>
		<inputFields>
			<field name="ft_t_gugp.prt_desc" dataType="STRING"/>
			<field name="ft_t_gugp.prt_purp_typ" dataType="STRING"/>
			<field name="ft_t_gugp.start_tms" dataType="DATETIME"/>
			<field name="ft_t_gugp.last_chg_tms" dataType="DATETIME"/>
			<field name="ft_t_gugp.end_tms" dataType="DATETIME"/>
			<field name="ft_t_gugp.data_src_id" dataType="STRING"/>
			<field name="ft_t_gugp.last_chg_usr_id" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_gugr" id="GUGR" parentId="GUGP" label="GeounitGroup" dbConstraint="GUGPF001">
		<inputFields>
			<field name="ft_t_gugr.gu_cnt" dataType="NUMBER"/>
			<field name="ft_t_gugr.gu_id" dataType="STRING"/>
			<field name="ft_t_gugr.gu_typ" dataType="STRING"/>
			<field name="ft_t_gugr.start_tms" dataType="DATETIME"/>
			<field name="ft_t_gugr.grp_nme" dataType="STRING"/>
			<field name="ft_t_gugr.grp_purp_typ" dataType="STRING"/>
			<field name="ft_t_gugr.last_chg_tms" dataType="DATETIME"/>
			<field name="ft_t_gugr.grp_desc" dataType="STRING"/>
			<field name="ft_t_gugr.end_tms" dataType="DATETIME"/>
			<field name="ft_t_gugr.last_chg_usr_id" dataType="STRING"/>
			<field name="ft_t_gugr.data_src_id" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_guid" id="GUID2" parentId="GUNT2" label="GUID" dbConstraint="GUIDF001">
		<inputFields>
			<field name="ft_t_guid.data_src_id" dataType="STRING"/>
			<field name="ft_t_guid.end_tms" dataType="DATETIME"/>
			<field name="ft_t_guid.gu_id_ctxt_typ" dataType="STRING"/>
			<field name="ft_t_guid.geo_unit_id" dataType="STRING"/>
			<field name="ft_t_guid.last_chg_tms" dataType="DATETIME"/>
			<field name="ft_t_guid.last_chg_usr_id" dataType="STRING"/>
			<field name="ft_t_guid.start_tms" dataType="DATETIME"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_pbat" id="PBAT" parentId="GUNT_PUB" label="PBAT" dbConstraint="PBATGUNT">
		<inputFields>
			<field name="ft_t_pbat.last_chg_tms" dataType="DATETIME" label="published_tms"/>
			<field name="ft_t_pbat.last_chg_usr_id" dataType="STRING"/>
			<field name="ft_t_pbat.pub_sq_num" dataType="NUMBER"/>
			<field name="ft_t_pbat.published_tbl_id" dataType="STRING"/>
			<field name="ft_t_pbat.pub_audit_id" dataType="STRING"/>
		</inputFields>
	</occurrence>
	<relations>
		<table name="FT_T_PBAT">
			<relation relatedTable="FT_T_GUNT" name="PBATGUNT">
				<fromColumns>
					<column name="PUB_CROSS_REF_ID"/>
				</fromColumns>
				<toColumns>
					<column name="GUNT_OID"/>
				</toColumns>
				<condition>
					<sql>#FROM_TABLE#.published_tbl_id=''GUNT''</sql>
				</condition>
			</relation>
		</table>
		<table name="FT_T_PBAT">
			<relation relatedTable="FT_T_GUNT" name="PBATGUNT">
				<fromColumns>
					<column name="PUB_CROSS_REF_ID"/>
				</fromColumns>
				<toColumns>
					<column name="GUNT_OID"/>
				</toColumns>				
			</relation>
		</table>
	</relations>
</model>', last_chg_tms= SYSDATE() WHERE modl_id ='GUNT_PUB';