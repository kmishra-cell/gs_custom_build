update ft_cfg_vfmt 
set mstp_oid = (select mstp_oid from ft_cfg_mstp where msg_typ_nme='SP_XF_GR_SecurityRatings')  
where bsfd_oid = (select bsfd_oid from ft_cfg_bsfd where bf_nme ='S&P_XF_GR_Security_Ratings');

update ft_cfg_vfmt 
set mstp_oid = (select mstp_oid from ft_cfg_mstp where msg_typ_nme='SP_XF_GR_EntityRatings')  
where bsfd_oid = (select bsfd_oid from ft_cfg_bsfd where bf_nme ='S&P_XF_GR_Entity_Ratings');

update ft_cfg_mstp 
set mapping_uri = 'db://resource/mapping/standard&poors/SP_XF_GR_SecurityRatings.omdx' 
where mstp_oid = (select mstp_oid from ft_cfg_mstp where msg_typ_nme='SP_XF_GR_SecurityRatings');

update ft_cfg_mstp 
set mapping_uri = 'db://resource/mapping/standard&poors/SP_XF_GR_EntityRatings.omdx' 
where mstp_oid = (select mstp_oid from ft_cfg_mstp where msg_typ_nme='SP_XF_GR_EntityRatings');

insert into ft_cfg_msmd (mstp_oid, meta_key_txt, meta_val_txt)
select mstp_oid, 'CaseSensitiveInputFields', 'false'  
from ft_cfg_msmd msmd 
where msmd.mstp_oid = (select mstp_oid from ft_cfg_mstp where msg_typ_nme='FitchRDS_IssuerRatings')  
and not exists (select 1 from ft_cfg_msmd where mstp_oid = msmd.mstp_oid and meta_key_txt='CaseSensitiveInputFields');

insert into ft_cfg_msmd (mstp_oid, meta_key_txt, meta_val_txt)
select mstp_oid, 'CaseSensitiveInputFields', 'false'  
from ft_cfg_msmd msmd 
where msmd.mstp_oid = (select mstp_oid from ft_cfg_mstp where msg_typ_nme='FitchRDS_IssueRatings')  
and not exists (select 1 from ft_cfg_msmd where mstp_oid = msmd.mstp_oid and meta_key_txt='CaseSensitiveInputFields');