--Archive table FT_T_UPD1 (audit table for entity updates)

-- reserve
-- 1. created less than two weeks
-- OR
-- 2. the last record for an entity
--

create table ft_t_upd1_backup as select * from ft_t_upd1;

select count(1) from ft_t_upd1;  
select count(1) from ft_t_upd1_backup;  

--create index ft_t_upd1_backup_I001 on ft_t_upd1_backup (entity_tbl_typ, xref_tbl_row_oid, sequenceno);

CREATE INDEX ft_t_upd1_backup_i001 ON ft_t_upd1_backup USING btree (entity_tbl_typ, xref_tbl_row_oid, sequenceno);
CREATE INDEX ft_t_upd1_backup_p001 ON ft_t_upd1_backup USING btree (xref_tbl_row_oid);

truncate table ft_t_upd1;

--select current_date

insert into ft_t_upd1 
(
--select upd1.* from ft_t_upd1_backup upd1
--where upd1.updated_tmsmp > current_date - 15    
--union
select upd1.* from ft_t_upd1_backup upd1
inner join (select xref_tbl_row_oid, max(sequenceno) as sequenceno from ft_t_upd1_backup group by xref_tbl_row_oid) latestversion 
on  upd1.xref_tbl_row_oid = latestversion.xref_tbl_row_oid 
and upd1.sequenceno = latestversion.sequenceno 
except 
select upd1.* from ft_t_upd1_backup upd1
where entity_tbl_typ ='FINS'
);

-- insert DUMMY
insert into ft_t_upd1 select * from ft_t_upd1_backup where entity_tbl_typ='DMMY';


-- rebuild index
REINDEX INDEX ft_x_upd1_i001;
REINDEX INDEX ft_x_upd1_p001;

-- check: No rows should be found
select ENTITY_TBL_TYP, XREF_TBL_ROW_OID from ft_t_upd1 group by ENTITY_TBL_TYP, XREF_TBL_ROW_OID
except 
select ENTITY_TBL_TYP, XREF_TBL_ROW_OID from ft_t_upd1_backup group by ENTITY_TBL_TYP, XREF_TBL_ROW_OID;

--only FINS entries to be found
select ENTITY_TBL_TYP, XREF_TBL_ROW_OID from ft_t_upd1_backup group by ENTITY_TBL_TYP, XREF_TBL_ROW_OID
except 
select ENTITY_TBL_TYP, XREF_TBL_ROW_OID from ft_t_upd1 group by ENTITY_TBL_TYP, XREF_TBL_ROW_OID;

