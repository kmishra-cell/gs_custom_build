--{$$-STATEMENT-$$}
CREATE OR REPLACE FUNCTION mhi_listing_id()
RETURNS TEXT AS $$
DECLARE
    seq_id BIGINT;
BEGIN
    SELECT nextval('internal_iss_id_seq') INTO seq_id;
    RETURN seq_id::TEXT;
END;
$$ LANGUAGE plpgsql;
/