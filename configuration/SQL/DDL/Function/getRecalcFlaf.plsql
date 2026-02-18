-- DROP FUNCTION gc_own.getrecalcflaf(varchar, bpchar);

create or replace
function getrecalcflaf(instrid text,
portfolioid CHAR)
returns text language plpgsql as
$$
declare
    found text;

begin
    select
	port.instr_id
    into
	found
from
	(
	select
		issu.instr_id,
		coalesce((
		select
			coll_typ
		from
			ft_t_isll
		where
			instr_id = issu.instr_id
			and coll_typ = 'Subordinated'
			and start_tms <= current_timestamp
			and (end_tms is null
				or end_tms > current_timestamp)
		limit 1
            ),
		'NULL') as subordinated,
		coalesce((
		select
			fins.inst_mnem
		from
			ft_t_fins fins
		where
			exists (
			select
				1
			from
				ft_t_finr
			where
				finsrl_typ = 'GUARNTOR'
				and inst_mnem = fins.inst_mnem
				and start_tms <= current_timestamp
				and (end_tms is null
					or end_tms > current_timestamp)
                )
			and exists (
			select
				1
			from
				ft_t_frip
			where
				inst_mnem = fins.inst_mnem
				and instr_id = issu.instr_id
				and start_tms <= current_timestamp
				and (end_tms is null
					or end_tms > current_timestamp)
                )
			and start_tms <= current_timestamp
			and (end_tms is null
				or end_tms > current_timestamp)
		limit 1
            ),
		'NULL') as guarantor,
		coalesce((
		select
			coll_typ
		from
			ft_t_isll
		where
			instr_id = issu.instr_id
			and coll_typ = 'Secured'
			and start_tms <= current_timestamp
			and (end_tms is null
				or end_tms > current_timestamp)
		limit 1
            ),
		'NULL') as secured,
		coalesce((
		select
			cl_value
		from
			ft_t_iscl
		where
			instr_id = issu.instr_id
			and indus_cl_set_id = 'MIZUNIQE'
			and start_tms <= current_timestamp
			and (end_tms is null
				or end_tms > current_timestamp)
		limit 1
            ),
		'NULL') as uniqu,
		coalesce((
		select
			isgp.prnt_iss_grp_oid
		from
			ft_t_isgp isgp
		join ft_t_isgr isgr on
			isgp.prnt_iss_grp_oid = isgr.iss_grp_oid
		where
			isgp.instr_id = issu.instr_id
			and grp_nme = 'FCY'
			and isgp.start_tms <= current_timestamp
			and (isgp.end_tms is null
				or isgp.end_tms > current_timestamp)
			and isgr.start_tms <= current_timestamp
			and (isgr.end_tms is null
				or isgr.end_tms > current_timestamp)
		limit 1
            ),
		'NULL') as fcy,
		issu.pref_iss_nme,
		coalesce(issu.series_typ,
		'NULL') as iseries,
		coalesce((
		select
			coll_grp_desc
		from
			ft_t_isll
		where
			instr_id = issu.instr_id
			and coll_typ = 'Mortgage Backed'
			and coll_grp_desc is not null
			and start_tms <= current_timestamp
			and (end_tms is null
				or end_tms > current_timestamp)
		limit 1
            ),
		'NULL') as igroup
	from
		ft_t_issu issu
	where
		issu.instr_id = portfolioid
		and issu.iss_typ = 'PORT'
		and issu.start_tms <= current_timestamp
		and (issu.end_tms is null
			or issu.end_tms > current_timestamp)
    ) port,
	(
	select
		issu.instr_id,
		coalesce((
		select
			distinct coll_typ
		from
			ft_t_isll
		where
			instr_id = issu.instr_id
			and coll_typ = 'Subordinated'
			and start_tms <= current_timestamp
			and (end_tms is null
				or end_tms > current_timestamp)
		limit 1
            ),
		'NULL') as subordinated,
		coalesce((
		select
			fins.inst_mnem
		from
			ft_t_fins fins
		where
			exists (
			select
				1
			from
				ft_t_finr
			where
				finsrl_typ = 'GUARNTOR'
				and inst_mnem = fins.inst_mnem
				and start_tms <= current_timestamp
				and (end_tms is null
					or end_tms > current_timestamp)
                )
			and exists (
			select
				1
			from
				ft_t_frip
			where
				finsrl_typ = 'GUARNTOR'
				and inst_mnem = fins.inst_mnem
				and instr_id = issu.instr_id
				and start_tms <= current_timestamp
				and (end_tms is null
					or end_tms > current_timestamp)
                )
			and start_tms <= current_timestamp
			and (end_tms is null
				or end_tms > current_timestamp)
		limit 1
            ),
		'NULL') as guarantor,
		coalesce((
		select
			distinct coll_typ
		from
			ft_t_isll
		where
			instr_id = issu.instr_id
			and coll_typ = 'Secured'
			and start_tms <= current_timestamp
			and (end_tms is null
				or end_tms > current_timestamp)
		limit 1
            ),
		'NULL') as secured,
		coalesce((
		select
			cl_value
		from
			ft_t_iscl
		where
			instr_id = issu.instr_id
			and indus_cl_set_id = 'MIZUNIQE'
			and start_tms <= current_timestamp
			and (end_tms is null
				or end_tms > current_timestamp)
		limit 1
            ),
		'NULL') as uniqu,
		coalesce((
		select
			isgp.prnt_iss_grp_oid
		from
			ft_t_isgp isgp
		join ft_t_isgr isgr on
			isgp.prnt_iss_grp_oid = isgr.iss_grp_oid
		where
			isgp.instr_id = issu.instr_id
			and grp_nme = 'FCY'
			and isgp.start_tms <= current_timestamp
			and (isgp.end_tms is null
				or isgp.end_tms > current_timestamp)
			and isgr.start_tms <= current_timestamp
			and (isgr.end_tms is null
				or isgr.end_tms > current_timestamp)
		limit 1
            ),
		'NULL') as fcy,
		issu.pref_iss_nme,
		case
			when (
			select
				COUNT(*)
			from
				ft_t_isll
			where
				end_tms is null
				and instr_id = issu.instr_id
				and coll_typ in ('Asset Backed', 'Mortgage Backed')
                ) = 0 then 'NULL'
			else coalesce(issu.series_typ,
			'NULL')
		end as iseries,
		coalesce((
		select
			distinct coll_grp_desc
		from
			ft_t_isll
		where
			instr_id = issu.instr_id
			and coll_typ = 'Mortgage Backed'
			and coll_grp_desc is not null
			and start_tms <= current_timestamp
			and (end_tms is null
				or end_tms > current_timestamp)
		limit 1
            ),
		'NULL') as igroup
	from
		ft_t_issu issu
	where
		issu.instr_id = instrid
		and issu.start_tms <= current_timestamp
		and (issu.end_tms is null
			or issu.end_tms > current_timestamp)
    ) issu1
where
	issu1.secured = port.secured
	and issu1.igroup = port.igroup
	and issu1.iseries = port.iseries
	and issu1.guarantor = port.guarantor
	and issu1.fcy = port.fcy
	and issu1.uniqu = port.uniqu
limit 1;
return found;
end;
$$;
