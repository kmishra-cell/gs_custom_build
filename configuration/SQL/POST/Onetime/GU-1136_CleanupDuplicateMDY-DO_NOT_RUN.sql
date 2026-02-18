--End date duplicate MDY entries where no corresponding active FIID MDY entries exist
update ft_t_irid 
set end_tms=now()-interval '1 day', last_chg_tms=now(), last_chg_usr_id = last_chg_usr_id||'_GU1136' 
where irid_oid in 
(
select irid_oid from ft_t_irid irid where issr_id_ctxt_typ='MDY' and end_tms is null and issr_id in 
(
select issr_id from ft_t_irid WHERE issr_id_ctxt_typ='MDY' and end_tms is null
group by issr_id having count(1)>1
)
except
select irid_oid from ft_t_irid irid where issr_id_ctxt_typ='MDY' and end_tms is null and issr_id in 
(
select issr_id from ft_t_irid WHERE issr_id_ctxt_typ='MDY' and end_tms is null
group by issr_id having count(1)>1
)
and exists (select 1 from ft_t_fiid fiid, ft_t_issr issr where issr.fins_inst_mnem=fiid.inst_mnem and irid.instr_issr_id=issr.instr_issr_id and fiid.fins_id_ctxt_typ='MDY' and fiid.end_tms is null)
);

--End date duplicate MDY entries where no corresponding active FIID MDY entries exist with same identifier value 
update ft_t_irid set end_tms=now()-interval '1 day', last_chg_tms=now(), last_chg_usr_id = last_chg_usr_id||'_GU1136' 
where irid_oid in 
(
select irid_oid from ft_t_irid irid where issr_id_ctxt_typ='MDY' and end_tms is null and issr_id in 
(
select issr_id from ft_t_irid WHERE issr_id_ctxt_typ='MDY' and end_tms is null
group by issr_id having count(1)>1
)
except
select irid_oid from ft_t_irid irid where issr_id_ctxt_typ='MDY' and end_tms is null and issr_id in 
(
select issr_id from ft_t_irid WHERE issr_id_ctxt_typ='MDY' and end_tms is null
group by issr_id having count(1)>1
)
and exists (select 1 from ft_t_fiid fiid, ft_t_issr issr where issr.fins_inst_mnem=fiid.inst_mnem and irid.instr_issr_id=issr.instr_issr_id 
			and fiid.fins_id_ctxt_typ='MDY' and fiid.fins_id=irid.issr_id and fiid.end_tms is null)
);

--End date duplicate MDY entries where duplicates exist on the same Issuer. Latest MDY entry is kept active.
update ft_t_irid set end_tms=now()-interval '1 day', last_chg_tms=now(), last_chg_usr_id = last_chg_usr_id||'_GU1136' 
where irid_oid in
(
select irid_oid from (
select  irid_oid, instr_issr_id, issr_id, last_chg_tms, row_number() over (partition by instr_issr_id order by last_chg_tms desc) rownum  
from ft_t_irid 
where (instr_issr_id, issr_id) in 
(
select instr_issr_id, issr_id from ft_t_irid WHERE issr_id_ctxt_typ='MDY' and end_tms is null
group by instr_issr_id, issr_id having count(1)>1
)
)tab where rownum=2
);

--End date duplicate MDY entries where LEI is missing for the Issuer
update ft_t_irid set end_tms=now()-interval '1 day', last_chg_tms=now(), last_chg_usr_id = last_chg_usr_id||'_GU1136' 
where irid_oid in
(
select irid_oid from ft_t_irid irid where issr_id_ctxt_typ='MDY' and end_tms is null and issr_id in 
(
select issr_id from ft_t_irid WHERE issr_id_ctxt_typ='MDY' and end_tms is null
group by issr_id having count(1)>1
)
and not exists (select 1 from ft_t_irid where issr_id_ctxt_typ='LEI' and end_tms is null and instr_issr_id=irid.instr_issr_id)
);
