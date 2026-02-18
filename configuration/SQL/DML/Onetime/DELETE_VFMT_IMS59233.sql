
delete from FT_CFG_VFMT where vnd_file_nme !='spRatingData*.entity' and bsfd_oid='++7I0ziGgX2HG0JU';
update FT_CFG_VFMT set vnd_file_grp_num=1,row_seq_num=0 where vnd_file_nme ='spRatingData*.entity' and bsfd_oid='++7I0ziGgX2HG0JU';
 
delete from FT_CFG_VFMT where vnd_file_nme !='spRatingData*.security' and bsfd_oid='++7I0ziGgX2HG0JW';
update FT_CFG_VFMT set vnd_file_grp_num=1,row_seq_num=0 where vnd_file_nme ='spRatingData*.security' and bsfd_oid='++7I0ziGgX2HG0JW';
 