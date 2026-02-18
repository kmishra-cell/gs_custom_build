--{$$-STATEMENT-$$}
DO $$
BEGIN    
    IF NOT EXISTS (
		SELECT 1 FROM pg_sequences WHERE sequencename = 'account_id') 
	THEN
        RAISE NOTICE 'Creating sequence account_id';
        EXECUTE 'CREATE SEQUENCE account_id 
                 MINVALUE 1 
                 MAXVALUE 9223372036854775807 
                 INCREMENT BY 1 
                 START WITH 1 
                 CYCLE';  
    ELSE
        RAISE NOTICE 'Sequence account_id already exists';
    END IF;
END $$;

