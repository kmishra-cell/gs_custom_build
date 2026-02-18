--{$$-STATEMENT-$$}
CREATE OR REPLACE FUNCTION mhi_persec_group(inmktsct VARCHAR, infiregion VARCHAR)
  RETURNS CHAR 
 LANGUAGE plpgsql
 SECURITY DEFINER
AS $function$
DECLARE
  result CHAR;
BEGIN
  IF inmktsct = 'Corp' AND infiregion = 'ASIA' THEN
    result := '1';
  ELSIF inmktsct = 'Corp' AND infiregion = 'EURO' THEN
    result := '2';
  ELSIF inmktsct = 'Corp' AND infiregion = 'NAMR' THEN
    result := '3';
  ELSE
    result := '9';
  END IF;

  RETURN result;
END;
$function$;
/