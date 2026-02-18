HOST "md %crnt_dirty%\DBQC_REPORT\AFTER\GC"
SET PAGES 40000
SET MARKUP HTML ON
SPOOL %crnt_dirty%\DBQC_REPORT\AFTER\GC\DBQC_%CLIENT%_SCHMA_CNT_GC_AFTR_UPG.xls

PROMPT GETTING RECORD COUNT OF TABLES IN SCHEMA
PROMPT **********************************************************************
select table_name,
  to_number(
   extractvalue(
      xmltype(
         dbms_xmlgen.getxml('select /*+ PARALLEL(8) */ count(*) c from '||table_name))
    ,'/ROWSET/ROW/C')) as cnt
from user_tables  where IOT_NAME IS  NULL order by 1;

SPOOL OFF
SET MARKUP HTML OFF
EXIT
