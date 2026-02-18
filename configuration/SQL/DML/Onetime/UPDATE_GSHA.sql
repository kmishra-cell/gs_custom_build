update FT_T_GSHA set bus_entity_fld_nme ='LAGRAgreementDescription' where gsha_oid ='LAGR000002';

delete from FT_T_GSHA where gsha_oid in ('LAGR000001','LAGR000004');