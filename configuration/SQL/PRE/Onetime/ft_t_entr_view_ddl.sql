--
--create ft_t_entr_view -- used for Entitlements
--
CREATE TABLE ft_t_entr_view (
    entr_view_oid     varchar(10)      NOT NULL,
    org_id            varchar(4)       NOT NULL,
    entity_typ        varchar(4)       NOT NULL,
    access_org_id     varchar(4)       NOT NULL,
    start_tms         timestamp(0)     NOT NULL,
    end_tms           timestamp(0),
    last_chg_tms      timestamp(0)     NOT NULL,
    last_chg_usr_id   varchar(256)     NOT NULL
);

CREATE UNIQUE INDEX ft_x_entr_view_u001 ON ft_t_entr_view (org_id, entity_typ, access_org_id, start_tms);

CREATE UNIQUE INDEX ft_t_entr_view_pk ON ft_t_entr_view (entr_view_oid);
