insert into ft_cfg_vfmt (vnd_file_nme, mstp_oid, row_seq_num, bsfd_oid, vnd_file_grp_num)
select '*gs*.out' vnd_file_nme,mstp.mstp_oid, coalesce(vfmt.max_seq_num+1,0) new_seq_num, coalesce(vfmt.bsfd_oid,bsfd.bsfd_oid) new_bsfd_oid, 1
--bsfd.bsfd_oid, bsfd.bf_nme ,mstp.msg_typ_nme, mstp.mstp_oid,'*gs*.out' vnd_file_nme, coalesce(vfmt.bsfd_oid,bsfd.bsfd_oid) new_bsfd_oid,coalesce(vfmt.max_seq_num+1,0) new_seq_num 
from ft_cfg_bsfd bsfd 
inner join ft_t_mstp mstp on mstp.bsfd_oid=bsfd.bsfd_oid
left join (select bsfd_oid, max(row_seq_num) max_seq_num from ft_cfg_vfmt group by bsfd_oid) vfmt
on vfmt.bsfd_oid=bsfd.bsfd_oid
where bsfd.bf_nme like 'Bloomberg%' 
and mstp.msg_typ_nme in ('BBCurrency','BBGlobalEquity','BBPreferreds','BBGlobalWarrants','BBCreditRisk','BBMortgagePools','BBMortgageNonPool','BBGlobalCommodityFutures','BBGeneric','BBIndexPricing','BBXT_HQLA')
and not exists (select 1 from ft_cfg_vfmt where bsfd_oid=bsfd.bsfd_oid and mstp_oid=mstp.mstp_oid and vnd_file_nme = '*gs*.out');