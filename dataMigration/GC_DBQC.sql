HOST "md %crnt_dirty%\DBQC_REPORT\AFTER\GC"
SET PAGES 40000
SET MARKUP HTML ON
SPOOL %crnt_dirty%\DBQC_REPORT\AFTER\GC\DBQC_%CLIENT%_GC_AFTR_UPG.xls

PROMPT '********************************************************************************************'

PROMPT Metadata Comparison with DDL


PROMPT Start - Schema Name and date
SELECT USER, TO_CHAR(SYSDATE,'YYYYMMDD HH:MI:SS') DATETIME FROM DUAL;

PROMPT Table Count in Schema

SELECT COUNT (*) FROM USER_TABLES;

PROMPT Table Count in Metadata

SELECT COUNT (*) FROM FT_T_TBDF;


PROMPT Table Present in Schema But not in Metadata

SELECT TABLE_NAME
  FROM USER_TABLES
 WHERE     TABLE_NAME NOT LIKE '%TMP%'
       AND TABLE_NAME NOT LIKE '%STATS%'
       AND TABLE_NAME NOT LIKE '%QRTZ%'
       AND TABLE_NAME NOT LIKE 'FTB_%'
       AND TABLE_NAME NOT LIKE 'FT_MAAF%'
       AND TABLE_NAME NOT LIKE 'FT_ERR%'
       AND TABLE_NAME NOT LIKE 'FT_EV%'
       AND TABLE_NAME NOT LIKE '%QRTZ%'
       AND TABLE_NAME NOT LIKE 'FTB_%'
	AND TABLE_NAME NOT LIKE 'FT_D_INFO'
	   AND TABLE_NAME NOT LIKE '%GT158674%'
	   AND TABLE_NAME NOT LIKE 'FT_HIST_%'
       AND (   TABLE_NAME LIKE 'FT_%'
            OR TABLE_NAME LIKE 'OID%'
            OR TABLE_NAME LIKE 'TEMP%')
       AND TABLE_NAME NOT IN ('FT_BAK_MMTL','FT_D_DMID','FT_LOG_MIGR_EXEC','FT_MV_VAII','FT_O_ADEL_870','FT_O_BBCA','FT_O_BBDS','FT_O_BBFP','FT_O_BBPC','FT_O_ELCP','FT_O_ERRL','FT_O_VDCP','FT_STG_META_CRTN_EXCP','FT_T_AUDIT_TBL_LIST','FT_T_CUST_OLD_NEW_OID','FT_T_FIID_GT155106','FT_T_INCL_OLD_NEW_PK','FT_T_IRID_GT155106','FT_T_ISSU_OLD_NEW_PK','FT_T_MKIS_DUMMY_UPDATE','FT_T_MTGD_20190314')    
MINUS
SELECT TBL_DDL_NME
  FROM FT_T_TBDF ;
  
PROMPT Table Present in Metadata But not in Schema
 
SELECT TBL_DDL_NME
  FROM FT_T_TBDF
 WHERE TBL_DDL_NME NOT LIKE '%STATS%' AND TBL_DDL_NME NOT LIKE 'FT_V%'
MINUS
SELECT TABLE_NAME
  FROM USER_TABLES
 WHERE     TABLE_NAME NOT LIKE '%TMP%'
       AND TABLE_NAME NOT LIKE '%STATS%'
       AND TABLE_NAME NOT LIKE '%QRTZ%'
       AND TABLE_NAME NOT LIKE 'FTB_%'
       AND TABLE_NAME NOT LIKE 'FT_MAAF%'
       AND TABLE_NAME NOT LIKE 'FT_ERR%'
       AND TABLE_NAME NOT LIKE 'FT_EV%'
       AND TABLE_NAME NOT LIKE '%QRTZ%'
       AND TABLE_NAME NOT LIKE 'FTB_%'
 	   AND TABLE_NAME NOT LIKE '%GT158674%'
	   AND TABLE_NAME NOT LIKE 'FT_HIST_%'
      AND (   TABLE_NAME LIKE 'FT_%'
            OR TABLE_NAME LIKE 'OID%'
            OR TABLE_NAME LIKE 'TEMP%');


PROMPT Column Present in Schema But not in Metadata

SELECT TABLE_NAME,
       COLUMN_NAME,
       DECODE (
          DATA_TYPE,
          'DATE', DATA_TYPE,
          'XMLTYPE', DATA_TYPE,
          'CLOB', DATA_TYPE,
          'BLOB', DATA_TYPE,
          'TIMESTAMP(6)', DATA_TYPE,
          'NUMBER',    DATA_TYPE
                    || DECODE (
                          DATA_PRECISION,
                          '', '',
                             '('
                          || DATA_PRECISION
                          || DECODE (DATA_SCALE, 0, '', ',' || DATA_SCALE)
                          || ')'),
          DATA_TYPE || '(' || DATA_LENGTH || ')')
          DATA_TYPE
  FROM USER_TAB_COLUMNS M
 WHERE     (   TABLE_NAME LIKE 'FT_%'
            OR TABLE_NAME LIKE 'OID%'
            OR TABLE_NAME LIKE 'TEMP%')
       AND EXISTS
              (SELECT 1
                 FROM USER_OBJECTS A
                WHERE     A.OBJECT_TYPE = 'TABLE'
                      AND A.OBJECT_NAME = M.TABLE_NAME)
       AND TABLE_NAME NOT LIKE '%TMP%'
       AND TABLE_NAME NOT LIKE '%STATS%'
       AND TABLE_NAME NOT LIKE '%QRTZ%'
       AND TABLE_NAME NOT LIKE 'FTB_%'
       AND TABLE_NAME NOT LIKE 'FT_MAAF%'
       AND TABLE_NAME NOT LIKE 'FT_ERR%'
       AND TABLE_NAME NOT LIKE 'FT_EV%'
       AND TABLE_NAME NOT LIKE '%QRTZ%'
	   AND TABLE_NAME NOT LIKE '%GT158674%'
	   AND TABLE_NAME NOT LIKE 'FT_HIST_%'
       AND TABLE_NAME NOT LIKE 'FTB_%'
       AND TABLE_NAME NOT IN
              (SELECT TABLE_NAME
                 FROM USER_TABLES
                WHERE     TABLE_NAME NOT LIKE '%TMP%'
                      AND TABLE_NAME NOT LIKE '%STATS%'
                      AND TABLE_NAME NOT LIKE '%QRTZ%'
                      AND TABLE_NAME NOT LIKE 'FTB_%'
                      AND TABLE_NAME NOT LIKE 'FT_MAAF%'
                      AND TABLE_NAME NOT LIKE 'FT_ERR%'
                      AND TABLE_NAME NOT LIKE 'FT_EV%'
					  AND TABLE_NAME NOT LIKE '%GT158674%'
					  AND TABLE_NAME NOT LIKE 'FT_HIST_%'
                      AND TABLE_NAME NOT LIKE '%QRTZ%'
                      AND TABLE_NAME NOT LIKE 'FTB_%'
                      AND (   TABLE_NAME LIKE 'FT_%'
                           OR TABLE_NAME LIKE 'OID%'
                           OR TABLE_NAME LIKE 'TEMP%')
               MINUS
               SELECT TBL_DDL_NME FROM FT_T_TBDF)
MINUS
SELECT B.TBL_DDL_NME,
       A.COL_NME,
       DECODE (A.DDL_DATA_TYP,
               'INTEGER', 'NUMBER',
               'TIMESTAMP', 'TIMESTAMP(6)',
               A.DDL_DATA_TYP)
          DATA_TYPE 
  FROM FT_T_CLDF A,
       FT_T_TBDF B,
       FT_T_FLDF C,
       FT_T_FCDF D
 WHERE     A.TBL_ID = B.TBL_ID
       AND A.FLD_ID = C.FLD_ID
       AND C.FLD_DATA_CL_ID = D.FLD_DATA_CL_ID
ORDER BY 1, 2, 3;

PROMPT Column Present in Metadata But not in Schema

SELECT B.TBL_DDL_NME,
       A.COL_NME,
       DECODE (A.DDL_DATA_TYP,
               'INTEGER', 'NUMBER',
               'TIMESTAMP', 'TIMESTAMP(6)',
               A.DDL_DATA_TYP)
          DATA_TYPE 
  FROM FT_T_CLDF A,
       FT_T_TBDF B,
       FT_T_FLDF C,
       FT_T_FCDF D
 WHERE     A.TBL_ID = B.TBL_ID
       AND A.FLD_ID = C.FLD_ID
       AND C.FLD_DATA_CL_ID = D.FLD_DATA_CL_ID
       AND B.TBL_DDL_NME NOT LIKE 'FT_V%'
       AND B.TBL_DDL_NME NOT LIKE '%STATS%'
       AND NVL (A.VIRTUAL_COL_IND, 'N') = 'N'
MINUS
SELECT TABLE_NAME,
       COLUMN_NAME,
       DECODE (
          DATA_TYPE,
          'DATE', DATA_TYPE,
          'XMLTYPE', DATA_TYPE,
          'CLOB', DATA_TYPE,
          'BLOB', DATA_TYPE,
          'TIMESTAMP(6)', DATA_TYPE,
          'NUMBER',    DATA_TYPE
                    || DECODE (
                          DATA_PRECISION,
                          '', '',
                             '('
                          || DATA_PRECISION
                          || DECODE (DATA_SCALE, 0, '', ',' || DATA_SCALE)
                          || ')'),
          DATA_TYPE || '(' || DATA_LENGTH || ')')
          DATA_TYPE 
  FROM USER_TAB_COLUMNS M
 WHERE     (   TABLE_NAME LIKE 'FT_%'
            OR TABLE_NAME LIKE 'OID%'
            OR TABLE_NAME LIKE 'TEMP%')
       AND EXISTS
              (SELECT 1
                 FROM USER_OBJECTS A
                WHERE     A.OBJECT_TYPE = 'TABLE'
                      AND A.OBJECT_NAME = M.TABLE_NAME)
       AND TABLE_NAME NOT LIKE '%TMP%'
       AND TABLE_NAME NOT LIKE '%STATS%'
       AND TABLE_NAME NOT LIKE '%QRTZ%'
       AND TABLE_NAME NOT LIKE 'FTB_%'
       AND TABLE_NAME NOT LIKE 'FT_MAAF%'
       AND TABLE_NAME NOT LIKE 'FT_ERR%'
       AND TABLE_NAME NOT LIKE 'FT_EV%'
       AND TABLE_NAME NOT LIKE '%QRTZ%'
	   AND TABLE_NAME NOT LIKE '%GT158674%'
	   AND TABLE_NAME NOT LIKE 'FT_HIST_%'
       AND TABLE_NAME NOT LIKE 'FTB_%'
       AND TABLE_NAME NOT IN
              (SELECT TABLE_NAME
                 FROM USER_TABLES
                WHERE     TABLE_NAME NOT LIKE '%TMP%'
                      AND TABLE_NAME NOT LIKE '%STATS%'
                      AND TABLE_NAME NOT LIKE '%QRTZ%'
                      AND TABLE_NAME NOT LIKE 'FTB_%'
                      AND TABLE_NAME NOT LIKE 'FT_MAAF%'
                      AND TABLE_NAME NOT LIKE 'FT_ERR%'
                      AND TABLE_NAME NOT LIKE 'FT_EV%'
                      AND TABLE_NAME NOT LIKE '%QRTZ%'
                      AND TABLE_NAME NOT LIKE 'FTB_%'
                      AND (   TABLE_NAME LIKE 'FT_%'
                           OR TABLE_NAME LIKE 'OID%'
                           OR TABLE_NAME LIKE 'TEMP%')
               MINUS
               SELECT TBL_DDL_NME FROM FT_T_TBDF)
ORDER BY 1, 2, 3;

PROMPT Column Present in SCHEMA VS Metadata 
  SELECT *
    FROM (SELECT SCH.TABLE_NAME SCHEMA_TABLE_NAME,
                 SCH.COLUMN_NAME SCHEMA_COLUMN_NAME,
                 SCH.DATA_TYPE SCHEMA_DATA_TYPE,
                 DECODE (
                    SCH.COL_REQ_IND,
                    'Y', 'Y',
                    'N', NVL (
                            (SELECT 'Y'
                               FROM USER_CONS_COLUMNS
                              WHERE     TABLE_NAME = SCH.TABLE_NAME
                                    AND COLUMN_NAME = SCH.COLUMN_NAME
                                    AND CONSTRAINT_NAME LIKE 'SYS%'),
                            'N'))
                    AS SCHEMA_COL_REQ_IND,
                 --SCH.COL_REQ_IND AS SCHEMA_COL_REQ_IND,
                 META.TBL_DDL_NME META_TABLE_NAME,
                 META.COL_NME META_COLUMN_NAME,
                 META.DATA_TYPE META_DATA_TYPE,
                 META.COL_REQ_IND META_COL_REQ_IND
            FROM (SELECT TABLE_NAME,
                         COLUMN_NAME,
                         DECODE (
                            DATA_TYPE,
                            'DATE', DATA_TYPE,
                            'XMLTYPE', DATA_TYPE,
                            'CLOB', DATA_TYPE,
                            'BLOB', DATA_TYPE,
                            'TIMESTAMP(6)', DATA_TYPE,
                            'NUMBER',    DATA_TYPE
                                      || DECODE (
                                            DATA_PRECISION,
                                            '', '',
                                               '('
                                            || DATA_PRECISION
                                            || DECODE (DATA_SCALE,
                                                       0, '',
                                                       ',' || DATA_SCALE)
                                            || ')'),
                            DATA_TYPE || '(' || DATA_LENGTH || ')')
                            DATA_TYPE,
                         DECODE (NULLABLE,  'Y', 'N',  'N', 'Y') COL_REQ_IND
                    FROM USER_TAB_COLUMNS M
                   WHERE     (   TABLE_NAME LIKE 'FT_%'
                              OR TABLE_NAME LIKE 'OID%'
                              OR TABLE_NAME LIKE 'TEMP%')
                         AND EXISTS
                                (SELECT 1
                                   FROM USER_OBJECTS A
                                  WHERE     A.OBJECT_TYPE = 'TABLE'
                                        AND A.OBJECT_NAME = M.TABLE_NAME)
                         AND TABLE_NAME NOT LIKE '%TMP%'
                         AND TABLE_NAME NOT LIKE '%STATS%'
                         AND TABLE_NAME NOT LIKE '%QRTZ%'
                         AND TABLE_NAME NOT LIKE 'FTB_%'
                         AND TABLE_NAME NOT LIKE 'FT_MAAF%'
                         AND TABLE_NAME NOT LIKE 'FT_ERR%'
                         AND TABLE_NAME NOT LIKE 'FT_EV%'
                         AND TABLE_NAME NOT LIKE '%GT158674%'
                         AND TABLE_NAME NOT LIKE 'FT_HIST_%'
                         AND TABLE_NAME NOT LIKE '%QRTZ%'
                         AND TABLE_NAME NOT LIKE 'FTB_%'
                         AND TABLE_NAME NOT IN
                                (SELECT TABLE_NAME
                                   FROM USER_TABLES
                                  WHERE     TABLE_NAME NOT LIKE '%TMP%'
                                        AND TABLE_NAME NOT LIKE '%STATS%'
                                        AND TABLE_NAME NOT LIKE '%QRTZ%'
                                        AND TABLE_NAME NOT LIKE 'FTB_%'
                                        AND TABLE_NAME NOT LIKE 'FT_MAAF%'
                                        AND TABLE_NAME NOT LIKE 'FT_ERR%'
                                        AND TABLE_NAME NOT LIKE 'FT_EV%'
                                        AND TABLE_NAME NOT LIKE '%QRTZ%'
                                        AND TABLE_NAME NOT LIKE '%GT158674%'
                                        AND TABLE_NAME NOT LIKE 'FT_HIST_%'
                                        AND TABLE_NAME NOT LIKE 'FTB_%'
                                        AND (   TABLE_NAME LIKE 'FT_%'
                                             OR TABLE_NAME LIKE 'OID%'
                                             OR TABLE_NAME LIKE 'TEMP%')
                                 MINUS
                                 SELECT TBL_DDL_NME FROM FT_T_TBDF)
                  MINUS
                  SELECT B.TBL_DDL_NME,
                         A.COL_NME,
                         DECODE (A.DDL_DATA_TYP,
                                 'INTEGER', 'NUMBER',
                                 'TIMESTAMP', 'TIMESTAMP(6)',
                                 A.DDL_DATA_TYP)
                            DATA_TYPE,
                         COL_REQ_IND
                    FROM FT_T_CLDF A,
                         FT_T_TBDF B,
                         FT_T_FLDF C,
                         FT_T_FCDF D
                   WHERE     A.TBL_ID = B.TBL_ID
                         AND A.FLD_ID = C.FLD_ID
                         AND C.FLD_DATA_CL_ID = D.FLD_DATA_CL_ID) SCH
                 FULL OUTER JOIN
                 (SELECT B.TBL_DDL_NME,
                         A.COL_NME,
                         DECODE (A.DDL_DATA_TYP,
                                 'INTEGER', 'NUMBER',
                                 'TIMESTAMP', 'TIMESTAMP(6)',
                                 A.DDL_DATA_TYP)
                            DATA_TYPE,
                         COL_REQ_IND
                    FROM FT_T_CLDF A,
                         FT_T_TBDF B,
                         FT_T_FLDF C,
                         FT_T_FCDF D
                   WHERE     A.TBL_ID = B.TBL_ID
                         AND A.FLD_ID = C.FLD_ID
                         AND C.FLD_DATA_CL_ID = D.FLD_DATA_CL_ID
                         AND B.TBL_DDL_NME NOT LIKE 'FT_V%'
                         AND B.TBL_DDL_NME NOT LIKE '%STATS%'
                         AND NVL (A.VIRTUAL_COL_IND, 'N') = 'N'
                  MINUS
                  SELECT TABLE_NAME,
                         COLUMN_NAME,
                         DECODE (
                            DATA_TYPE,
                            'DATE', DATA_TYPE,
                            'XMLTYPE', DATA_TYPE,
                            'CLOB', DATA_TYPE,
                            'BLOB', DATA_TYPE,
                            'TIMESTAMP(6)', DATA_TYPE,
                            'NUMBER',    DATA_TYPE
                                      || DECODE (
                                            DATA_PRECISION,
                                            '', '',
                                               '('
                                            || DATA_PRECISION
                                            || DECODE (DATA_SCALE,
                                                       0, '',
                                                       ',' || DATA_SCALE)
                                            || ')'),
                            DATA_TYPE || '(' || DATA_LENGTH || ')')
                            DATA_TYPE,
                         DECODE (NULLABLE,  'Y', 'N',  'N', 'Y') COL_REQ_IND
                    FROM USER_TAB_COLUMNS M
                   WHERE     (   TABLE_NAME LIKE 'FT_%'
                              OR TABLE_NAME LIKE 'OID%'
                              OR TABLE_NAME LIKE 'TEMP%')
                         AND EXISTS
                                (SELECT 1
                                   FROM USER_OBJECTS A
                                  WHERE     A.OBJECT_TYPE = 'TABLE'
                                        AND A.OBJECT_NAME = M.TABLE_NAME)
                         AND TABLE_NAME NOT LIKE '%TMP%'
                         AND TABLE_NAME NOT LIKE '%STATS%'
                         AND TABLE_NAME NOT LIKE '%QRTZ%'
                         AND TABLE_NAME NOT LIKE 'FTB_%'
                         AND TABLE_NAME NOT LIKE 'FT_MAAF%'
                         AND TABLE_NAME NOT LIKE 'FT_ERR%'
                         AND TABLE_NAME NOT LIKE 'FT_EV%'
                         AND TABLE_NAME NOT LIKE '%QRTZ%'
                         AND TABLE_NAME NOT LIKE '%GT158674%'
                         AND TABLE_NAME NOT LIKE 'FT_HIST_%'
                         AND TABLE_NAME NOT LIKE 'FTB_%'
                         AND TABLE_NAME NOT IN
                                (SELECT TABLE_NAME
                                   FROM USER_TABLES
                                  WHERE     TABLE_NAME NOT LIKE '%TMP%'
                                        AND TABLE_NAME NOT LIKE '%STATS%'
                                        AND TABLE_NAME NOT LIKE '%QRTZ%'
                                        AND TABLE_NAME NOT LIKE 'FTB_%'
                                        AND TABLE_NAME NOT LIKE 'FT_MAAF%'
                                        AND TABLE_NAME NOT LIKE 'FT_ERR%'
                                        AND TABLE_NAME NOT LIKE 'FT_EV%'
                                        AND TABLE_NAME NOT LIKE '%QRTZ%'
                                        AND TABLE_NAME NOT LIKE '%GT158674%'
                                        AND TABLE_NAME NOT LIKE 'FT_HIST_%'
                                        AND TABLE_NAME NOT LIKE 'FTB_%'
                                        AND (   TABLE_NAME LIKE 'FT_%'
                                             OR TABLE_NAME LIKE 'OID%'
                                             OR TABLE_NAME LIKE 'TEMP%')
                                 MINUS
                                 SELECT TBL_DDL_NME FROM FT_T_TBDF)) META
                    ON     SCH.TABLE_NAME = META.TBL_DDL_NME
                       AND SCH.COLUMN_NAME = META.COL_NME)
   WHERE (   NVL (SCHEMA_DATA_TYPE, 'XXX') != NVL (META_DATA_TYPE, 'XXX')
          OR NVL (SCHEMA_COL_REQ_IND, 'X') != NVL (META_COL_REQ_IND, 'X'))
ORDER BY 1,
         2,
         3,
         4;
 

PROMPT Unique Indexes Present in Schema But not in Metadata

SELECT T1.INDEX_NAME, T1.TABLE_NAME
  FROM USER_INDEXES T1
 WHERE     (   TABLE_NAME LIKE 'FT_%'
            OR TABLE_NAME LIKE 'OID%'
            OR TABLE_NAME LIKE 'TEMP%')
       AND TABLE_NAME NOT IN ('FT_O_RTHA_TL', 'FT_O_TIMELINE')
       AND EXISTS
              (SELECT 1
                 FROM USER_OBJECTS A
                WHERE     a.OBJECT_TYPE = 'TABLE'
                      AND A.OBJECT_NAME = T1.TABLE_NAME)
       AND INDEX_NAME NOT LIKE ('SYS%$%')
       AND UNIQUENESS = 'UNIQUE'
       AND TABLE_NAME NOT LIKE '%TMP%'
       AND TABLE_NAME NOT LIKE '%STATS%'
       AND TABLE_NAME NOT LIKE '%QRTZ%'
       AND TABLE_NAME NOT LIKE 'FTB_%'
       AND TABLE_NAME NOT LIKE 'FT_MAAF%'
       AND TABLE_NAME NOT LIKE 'FT_ERR%'
       AND TABLE_NAME NOT LIKE 'FT_EV%'
       AND TABLE_NAME NOT LIKE '%QRTZ%'
	   AND TABLE_NAME NOT LIKE '%GT158674%'
	   AND TABLE_NAME NOT LIKE 'FT_HIST_%'
       AND TABLE_NAME NOT LIKE 'FTB_%'
       AND TABLE_NAME NOT IN
	          (SELECT TABLE_NAME
                 FROM USER_TABLES
                WHERE     TABLE_NAME NOT LIKE '%TMP%'
                      AND TABLE_NAME NOT LIKE '%STATS%'
                      AND TABLE_NAME NOT LIKE '%QRTZ%'
                      AND TABLE_NAME NOT LIKE 'FTB_%'
                      AND TABLE_NAME NOT LIKE 'FT_MAAF%'
                      AND TABLE_NAME NOT LIKE 'FT_ERR%'
                      AND TABLE_NAME NOT LIKE 'FT_EV%'
                      AND TABLE_NAME NOT LIKE '%QRTZ%'
					  AND TABLE_NAME NOT LIKE '%GT158674%'
	                 AND TABLE_NAME NOT LIKE 'FT_HIST_%'
                     AND TABLE_NAME NOT LIKE 'FTB_%'
                      AND (   TABLE_NAME LIKE 'FT_%'
                           OR TABLE_NAME LIKE 'OID%'
                           OR TABLE_NAME LIKE 'TEMP%')
               MINUS
               SELECT TBL_DDL_NME FROM FT_T_TBDF)
MINUS
SELECT T1.TBL_INDEX_NME, T2.TBL_DDL_NME
  FROM FT_T_TIDX T1, FT_T_TBDF T2
 WHERE T1.TBL_ID = T2.TBL_ID AND T1.TBL_INDEX_TYP IN ('P', 'U')
ORDER BY 1, 2;


PROMPT Unique Indexes Present in Metadata But not in Schema

SELECT TBL_INDEX_NME,TBL_DDL_NME, DECODE (TBL_INDEX_NME,'FT_X_DGDP_U001','VALID','NEED TO CHECK') DBQC_STATUS
FROM (
SELECT T1.TBL_INDEX_NME, T2.TBL_DDL_NME
  FROM FT_T_TIDX T1, FT_T_TBDF T2
 WHERE     T1.TBL_ID = T2.TBL_ID
       AND T2.TBL_DDL_NME NOT LIKE '%STATS%'
       AND T1.TBL_INDEX_TYP IN ('P', 'U')
       AND T2.TBL_DDL_NME NOT LIKE 'FT_V%'
MINUS
SELECT T1.INDEX_NAME, T1.TABLE_NAME
  FROM USER_INDEXES T1
 WHERE     (   TABLE_NAME LIKE 'FT_%'
            OR TABLE_NAME LIKE 'OID%'
            OR TABLE_NAME LIKE 'TEMP%')
       AND TABLE_NAME NOT IN ('FT_O_RTHA_TL', 'FT_O_TIMELINE')
       AND EXISTS
              (SELECT 1
                 FROM USER_OBJECTS A
                WHERE     a.OBJECT_TYPE = 'TABLE'
                      AND A.OBJECT_NAME = T1.TABLE_NAME)
       AND INDEX_NAME NOT LIKE ('SYS%$%')
       AND UNIQUENESS = 'UNIQUE'
       AND TABLE_NAME NOT LIKE '%TMP%'
       AND TABLE_NAME NOT LIKE '%STATS%'
       AND TABLE_NAME NOT LIKE '%QRTZ%'
       AND TABLE_NAME NOT LIKE 'FTB_%'
       AND TABLE_NAME NOT LIKE 'FT_MAAF%'
       AND TABLE_NAME NOT LIKE 'FT_ERR%'
       AND TABLE_NAME NOT LIKE 'FT_EV%'
       AND TABLE_NAME NOT LIKE '%QRTZ%'
       AND TABLE_NAME NOT LIKE 'FTB_%'
	   AND TABLE_NAME NOT LIKE '%GT158674%'
	   AND TABLE_NAME NOT LIKE 'FT_HIST_%'
       AND TABLE_NAME NOT IN
              (SELECT TABLE_NAME
                 FROM USER_TABLES
                WHERE     TABLE_NAME NOT LIKE '%TMP%'
                      AND TABLE_NAME NOT LIKE '%STATS%'
                      AND TABLE_NAME NOT LIKE '%QRTZ%'
                      AND TABLE_NAME NOT LIKE 'FTB_%'
                      AND TABLE_NAME NOT LIKE 'FT_MAAF%'
                      AND TABLE_NAME NOT LIKE 'FT_ERR%'
                      AND TABLE_NAME NOT LIKE 'FT_EV%'
					  AND TABLE_NAME NOT LIKE '%GT158674%'
	                  AND TABLE_NAME NOT LIKE 'FT_HIST_%'
                      AND TABLE_NAME NOT LIKE '%QRTZ%'
                      AND TABLE_NAME NOT LIKE 'FTB_%'
                      AND (   TABLE_NAME LIKE 'FT_%'
                           OR TABLE_NAME LIKE 'OID%'
                           OR TABLE_NAME LIKE 'TEMP%')
               MINUS
               SELECT TBL_DDL_NME FROM FT_T_TBDF))
ORDER BY 1, 2;


PROMPT Non-Unique Indexes Present in Schema But not in Metadata

SELECT INDEX_NAME TBL_INDEX_NME, TABLE_NAME TBL_DDL_NME, DECODE (INDEX_NAME,'FT_X_DGDP_U001','VALID','NEED TO CHECK') DBQC_STATUS
FROM (
SELECT T1.INDEX_NAME, T1.TABLE_NAME
  FROM USER_INDEXES T1
 WHERE     (   TABLE_NAME LIKE 'FT_%'
            OR TABLE_NAME LIKE 'OID%'
            OR TABLE_NAME LIKE 'TEMP%')
       AND TABLE_NAME NOT IN ('FT_O_RTHA_TL', 'FT_O_TIMELINE')
       AND EXISTS
              (SELECT 1
                 FROM USER_OBJECTS A
                WHERE     a.OBJECT_TYPE = 'TABLE'
                      AND A.OBJECT_NAME = T1.TABLE_NAME)
       AND INDEX_NAME NOT LIKE ('SYS%$%')
       AND INDEX_NAME NOT IN ('FT_X_FIID_I002','FT_X_IRID_I002','FT_X_AOIL_I004') -- These FIID and IRID are function based index, AOIL manually added but not having details
	   AND UNIQUENESS = 'NONUNIQUE'
       AND TABLE_NAME NOT LIKE '%TMP%'
       AND TABLE_NAME NOT LIKE '%STATS%'
       AND TABLE_NAME NOT LIKE '%QRTZ%'
       AND TABLE_NAME NOT LIKE 'FTB_%'
       AND TABLE_NAME NOT LIKE 'FT_MAAF%'
       AND TABLE_NAME NOT LIKE 'FT_ERR%'
       AND TABLE_NAME NOT LIKE 'FT_EV%'
	   AND TABLE_NAME NOT LIKE '%GT158674%'
	   AND TABLE_NAME NOT LIKE 'FT_HIST_%'
       AND TABLE_NAME NOT LIKE '%QRTZ%'
       AND TABLE_NAME NOT LIKE 'FTB_%'
       AND TABLE_NAME NOT IN
              (SELECT TABLE_NAME
                 FROM USER_TABLES
                WHERE     TABLE_NAME NOT LIKE '%TMP%'
                      AND TABLE_NAME NOT LIKE '%STATS%'
                      AND TABLE_NAME NOT LIKE '%QRTZ%'
                      AND TABLE_NAME NOT LIKE 'FTB_%'
                      AND TABLE_NAME NOT LIKE 'FT_MAAF%'
                      AND TABLE_NAME NOT LIKE 'FT_ERR%'
                      AND TABLE_NAME NOT LIKE 'FT_EV%'
                      AND TABLE_NAME NOT LIKE '%QRTZ%'
					  AND TABLE_NAME NOT LIKE '%GT158674%'
	                  AND TABLE_NAME NOT LIKE 'FT_HIST_%'
                      AND TABLE_NAME NOT LIKE 'FTB_%'
                      AND (   TABLE_NAME LIKE 'FT_%'
                           OR TABLE_NAME LIKE 'OID%'
                           OR TABLE_NAME LIKE 'TEMP%')
               MINUS
               SELECT TBL_DDL_NME FROM FT_T_TBDF)
MINUS
SELECT T1.TBL_INDEX_NME, T2.TBL_DDL_NME
  FROM FT_T_TIDX T1, FT_T_TBDF T2
 WHERE T1.TBL_ID = T2.TBL_ID AND T1.TBL_INDEX_TYP IN ('I'))
ORDER BY 1, 2;

PROMPT Non-Unique Indexes Present in Metadata But not in Schema

SELECT T1.TBL_INDEX_NME, T2.TBL_DDL_NME
  FROM FT_T_TIDX T1, FT_T_TBDF T2
 WHERE     T1.TBL_ID = T2.TBL_ID
       AND T1.TBL_INDEX_TYP IN ('I')
       AND T1.TBL_INDEX_NME NOT IN
              ('FT_X_TRID_I002', 'FT_X_TRID_I004', 'FT_X_TRID_I006')
MINUS
SELECT T1.INDEX_NAME, T1.TABLE_NAME
  FROM USER_INDEXES T1
 WHERE     (   TABLE_NAME LIKE 'FT_%'
            OR TABLE_NAME LIKE 'OID%'
            OR TABLE_NAME LIKE 'TEMP%')
       AND TABLE_NAME NOT IN ('FT_O_RTHA_TL', 'FT_O_TIMELINE')
       AND EXISTS
              (SELECT 1
                 FROM USER_OBJECTS A
                WHERE     a.OBJECT_TYPE = 'TABLE'
                      AND A.OBJECT_NAME = T1.TABLE_NAME)
       AND INDEX_NAME NOT LIKE ('SYS%$%')
       AND UNIQUENESS = 'NONUNIQUE'
       AND TABLE_NAME NOT LIKE '%TMP%'
       AND TABLE_NAME NOT LIKE '%STATS%'
       AND TABLE_NAME NOT LIKE '%QRTZ%'
       AND TABLE_NAME NOT LIKE 'FTB_%'
       AND TABLE_NAME NOT LIKE 'FT_MAAF%'
       AND TABLE_NAME NOT LIKE 'FT_ERR%'
       AND TABLE_NAME NOT LIKE 'FT_EV%'
	   AND TABLE_NAME NOT LIKE '%GT158674%'
	   AND TABLE_NAME NOT LIKE 'FT_HIST_%'
       AND TABLE_NAME NOT LIKE '%QRTZ%'
       AND TABLE_NAME NOT LIKE 'FTB_%'
       AND TABLE_NAME NOT IN
              (SELECT TABLE_NAME
                 FROM USER_TABLES
                WHERE     TABLE_NAME NOT LIKE '%TMP%'
                      AND TABLE_NAME NOT LIKE '%STATS%'
                      AND TABLE_NAME NOT LIKE '%QRTZ%'
                      AND TABLE_NAME NOT LIKE 'FTB_%'
                      AND TABLE_NAME NOT LIKE 'FT_MAAF%'
                      AND TABLE_NAME NOT LIKE 'FT_ERR%'
                      AND TABLE_NAME NOT LIKE 'FT_EV%'
                      AND TABLE_NAME NOT LIKE '%QRTZ%'
					  AND TABLE_NAME NOT LIKE '%GT158674%'
	                  AND TABLE_NAME NOT LIKE 'FT_HIST_%'
                     AND TABLE_NAME NOT LIKE 'FTB_%'
                      AND (   TABLE_NAME LIKE 'FT_%'
                           OR TABLE_NAME LIKE 'OID%'
                           OR TABLE_NAME LIKE 'TEMP%')
               MINUS
               SELECT TBL_DDL_NME FROM FT_T_TBDF)
ORDER BY 1, 2;


PROMPT Index with Columns sequence Present in Schema But not in Metadata


SELECT *
  FROM (  SELECT T1.TABLE_NAME,
                 T2.INDEX_NAME,
                 T2.COLUMN_NAME,
                 T2.COLUMN_POSITION
            FROM USER_INDEXES T1, USER_IND_COLUMNS T2
           WHERE     T1.INDEX_NAME = T2.INDEX_NAME
                 AND T1.TABLE_NAME = T2.TABLE_NAME
				 AND T1.INDEX_NAME NOT IN ('FT_X_FIID_I002','FT_X_IRID_I002','FT_X_AOIL_I004') -- These FIID and IRID are function based index, AOIL manually added but not having details
				 AND (   T1.TABLE_NAME LIKE 'FT_%'
                      OR T1.TABLE_NAME LIKE 'OID%'
                      OR T1.TABLE_NAME LIKE 'TEMP%')
                 AND T1.TABLE_NAME NOT LIKE '%TMP%'
                 AND T1.TABLE_NAME NOT LIKE '%STATS%'
                 AND T1.TABLE_NAME NOT LIKE '%QRTZ%'
                 AND T1.TABLE_NAME NOT LIKE 'FTB_%'
                 AND T1.TABLE_NAME NOT LIKE 'FT_MAAF%'
                 AND T1.TABLE_NAME NOT LIKE 'FT_ERR%'
                 AND T1.TABLE_NAME NOT LIKE 'FT_EV%'
                 AND T1.TABLE_NAME NOT LIKE '%QRTZ%'
				 AND T1.TABLE_NAME NOT LIKE '%GT158674%'
	             AND T1.TABLE_NAME NOT LIKE 'FT_HIST_%'
                 AND T1.TABLE_NAME NOT LIKE 'FTB_%'
                 AND T1.TABLE_NAME NOT IN
                        (SELECT TABLE_NAME
                           FROM USER_TABLES
                          WHERE     TABLE_NAME NOT LIKE '%TMP%'
                                AND TABLE_NAME NOT LIKE '%STATS%'
                                AND TABLE_NAME NOT LIKE '%QRTZ%'
                                AND TABLE_NAME NOT LIKE 'FTB_%'
                                AND TABLE_NAME NOT LIKE 'FT_MAAF%'
                                AND TABLE_NAME NOT LIKE 'FT_ERR%'
                                AND TABLE_NAME NOT LIKE 'FT_EV%'
                                AND TABLE_NAME NOT LIKE '%QRTZ%'
							    AND TABLE_NAME NOT LIKE '%GT158674%'
							    AND TABLE_NAME NOT LIKE 'FT_HIST_%'
                                AND TABLE_NAME NOT LIKE 'FTB_%'
                                AND (   TABLE_NAME LIKE 'FT_%'
                                     OR T1.TABLE_NAME LIKE 'OID%'
                                     OR T1.TABLE_NAME LIKE 'TEMP%')
                         MINUS
                         SELECT TBL_DDL_NME FROM FT_T_TBDF)
                 AND EXISTS
                        (SELECT 1
                           FROM USER_OBJECTS A
                          WHERE     a.OBJECT_TYPE = 'TABLE'
                                AND A.OBJECT_NAME = T1.TABLE_NAME
                                AND T2.COLUMN_NAME NOT LIKE 'SYS%$%')
        ORDER BY T2.INDEX_NAME, T2.COLUMN_POSITION)
MINUS
SELECT *
  FROM (  SELECT T3.TBL_DDL_NME,
                 T1.TBL_INDEX_NME,
                 T2.COL_NME,
                 T2.COL_SQ_NUM
            FROM FT_T_TIDX T1, FT_T_TIDC T2, FT_T_TBDF T3
           WHERE T1.TBL_ID = T3.TBL_ID AND T1.TIDX_OID = T2.TIDX_OID
        ORDER BY T1.TBL_INDEX_NME, T2.COL_SQ_NUM)
ORDER BY 1, 2, 4;


PROMPT Index with Columns sequence Present in Metadata But not in Schema


SELECT *
  FROM (  SELECT T3.TBL_DDL_NME,
                 T1.TBL_INDEX_NME,
                 T2.COL_NME,
                 T2.COL_SQ_NUM
            FROM FT_T_TIDX T1, FT_T_TIDC T2, FT_T_TBDF T3
           WHERE     T1.TBL_ID = T3.TBL_ID
                 AND T1.TIDX_OID = T2.TIDX_OID
                 AND T2.SORT_SEQ_TYP IS NULL
                 AND T3.TBL_DDL_NME NOT LIKE 'FT_V%'
                 AND T3.TBL_DDL_NME NOT LIKE '%STATS%'
                 AND T1.TBL_INDEX_NME NOT IN
                        (SELECT INDEX_NAME
                           FROM USER_INDEXES
                          WHERE INDEX_TYPE = 'FUNCTION-BASED NORMAL')
        ORDER BY T1.TBL_INDEX_NME, T2.COL_SQ_NUM)
MINUS
SELECT *
  FROM (  SELECT T1.TABLE_NAME,
                 T2.INDEX_NAME,
                 T2.COLUMN_NAME,
                 T2.COLUMN_POSITION
            FROM USER_INDEXES T1, USER_IND_COLUMNS T2
           WHERE     T1.INDEX_NAME = T2.INDEX_NAME
                 AND T1.TABLE_NAME = T2.TABLE_NAME
                 AND (   T1.TABLE_NAME LIKE 'FT_%'
                      OR T1.TABLE_NAME LIKE 'OID%'
                      OR T1.TABLE_NAME LIKE 'TEMP%')
                 AND T1.TABLE_NAME NOT LIKE '%TMP%'
                 AND T1.TABLE_NAME NOT LIKE '%STATS%'
                 AND T1.TABLE_NAME NOT LIKE '%QRTZ%'
                 AND T1.TABLE_NAME NOT LIKE 'FTB_%'
                 AND T1.TABLE_NAME NOT LIKE 'FT_MAAF%'
                 AND T1.TABLE_NAME NOT LIKE 'FT_ERR%'
				 AND T1.TABLE_NAME NOT LIKE '%GT158674%'
				 AND T1.TABLE_NAME NOT LIKE 'FT_HIST_%'
                AND T1.TABLE_NAME NOT LIKE 'FT_EV%'
                 AND T1.TABLE_NAME NOT LIKE '%QRTZ%'
                 AND T1.TABLE_NAME NOT LIKE 'FTB_%'
                 AND T1.TABLE_NAME NOT IN
                        (SELECT TABLE_NAME
                           FROM USER_TABLES
                          WHERE     TABLE_NAME NOT LIKE '%TMP%'
                                AND TABLE_NAME NOT LIKE '%STATS%'
                                AND TABLE_NAME NOT LIKE '%QRTZ%'
                                AND TABLE_NAME NOT LIKE 'FTB_%'
                                AND TABLE_NAME NOT LIKE 'FT_MAAF%'
                                AND TABLE_NAME NOT LIKE 'FT_ERR%'
								AND TABLE_NAME NOT LIKE '%GT158674%'
								AND TABLE_NAME NOT LIKE 'FT_HIST_%'
                                AND TABLE_NAME NOT LIKE 'FT_EV%'
                                AND TABLE_NAME NOT LIKE '%QRTZ%'
                                AND TABLE_NAME NOT LIKE 'FTB_%'
                                AND (   TABLE_NAME LIKE 'FT_%'
                                     OR T1.TABLE_NAME LIKE 'OID%'
                                     OR T1.TABLE_NAME LIKE 'TEMP%')
                         MINUS
                         SELECT TBL_DDL_NME FROM FT_T_TBDF)
                 AND EXISTS
                        (SELECT 1
                           FROM USER_OBJECTS A
                          WHERE     a.OBJECT_TYPE = 'TABLE'
                                AND A.OBJECT_NAME = T1.TABLE_NAME
                                AND T2.COLUMN_NAME NOT LIKE 'SYS%$%')
        ORDER BY T2.INDEX_NAME, T2.COLUMN_POSITION)
ORDER BY 1, 2, 4;

PROMPT Index with Columns sequence Present in SCHEMA VS Metadata  


  SELECT SCH.TABLE_NAME SCHEMA_TABLE_NAME,
         SCH.INDEX_NAME SCHEMA_INDEX_NAME,
         SCH.COLUMN_NAME SCHEMA_COLUMN_NAME,
         SCH.COLUMN_POSITION SCHEMA_COLUMN_POSITION,
         META.TBL_DDL_NME META_TABLE_NAME,
         META.TBL_INDEX_NME META_INDEX_NAME,
         META.COL_NME META_COLUMN_NAME,
         META.COL_SQ_NUM META_COLUMN_POSITION
    FROM (SELECT *
            FROM (  SELECT T1.TABLE_NAME,
                           T2.INDEX_NAME,
                           T2.COLUMN_NAME,
                           T2.COLUMN_POSITION
                      FROM USER_INDEXES T1, USER_IND_COLUMNS T2
                     WHERE     T1.INDEX_NAME = T2.INDEX_NAME
                           AND T1.TABLE_NAME = T2.TABLE_NAME
                             AND T1.INDEX_NAME NOT IN ('FT_X_FIID_I002','FT_X_IRID_I002','FT_X_AOIL_I004') -- These FIID and IRID are function based index, AOIL manually added but not having details
							AND (   T1.TABLE_NAME LIKE 'FT_%'
                                OR T1.TABLE_NAME LIKE 'OID%'
                                OR T1.TABLE_NAME LIKE 'TEMP%')
                           AND T1.TABLE_NAME NOT LIKE '%TMP%'
                           AND T1.TABLE_NAME NOT LIKE '%STATS%'
                           AND T1.TABLE_NAME NOT LIKE '%QRTZ%'
                           AND T1.TABLE_NAME NOT LIKE 'FTB_%'
                           AND T1.TABLE_NAME NOT LIKE 'FT_MAAF%'
                           AND T1.TABLE_NAME NOT LIKE 'FT_ERR%'
                           AND T1.TABLE_NAME NOT LIKE 'FT_EV%'
							AND T1.TABLE_NAME NOT LIKE '%GT158674%'
							AND T1.TABLE_NAME NOT LIKE 'FT_HIST_%'
                          AND T1.TABLE_NAME NOT LIKE '%QRTZ%'
                           AND T1.TABLE_NAME NOT LIKE 'FTB_%'
                           AND T1.TABLE_NAME NOT IN
                                  (SELECT TABLE_NAME
                                     FROM USER_TABLES
                                    WHERE     TABLE_NAME NOT LIKE '%TMP%'
                                          AND TABLE_NAME NOT LIKE '%STATS%'
                                          AND TABLE_NAME NOT LIKE '%QRTZ%'
                                          AND TABLE_NAME NOT LIKE 'FTB_%'
                                          AND TABLE_NAME NOT LIKE 'FT_MAAF%'
                                          AND TABLE_NAME NOT LIKE 'FT_ERR%'
                                          AND TABLE_NAME NOT LIKE 'FT_EV%'
                                          AND TABLE_NAME NOT LIKE '%QRTZ%'
											AND TABLE_NAME NOT LIKE '%GT158674%'
											AND TABLE_NAME NOT LIKE 'FT_HIST_%'
                                         AND TABLE_NAME NOT LIKE 'FTB_%'
                                          AND (   TABLE_NAME LIKE 'FT_%'
                                               OR T1.TABLE_NAME LIKE 'OID%'
                                               OR T1.TABLE_NAME LIKE 'TEMP%')
                                   MINUS
                                   SELECT TBL_DDL_NME FROM FT_T_TBDF)
                           AND EXISTS
                                  (SELECT 1
                                     FROM USER_OBJECTS A
                                    WHERE     A.OBJECT_TYPE = 'TABLE'
                                          AND A.OBJECT_NAME = T1.TABLE_NAME
                                          AND T2.COLUMN_NAME NOT LIKE 'SYS%$%')
                  ORDER BY T2.INDEX_NAME, T2.COLUMN_POSITION)
          MINUS
          SELECT *
            FROM (  SELECT T3.TBL_DDL_NME,
                           T1.TBL_INDEX_NME,
                           T2.COL_NME,
                           T2.COL_SQ_NUM
                      FROM FT_T_TIDX T1, FT_T_TIDC T2, FT_T_TBDF T3
                     WHERE T1.TBL_ID = T3.TBL_ID AND T1.TIDX_OID = T2.TIDX_OID
                  ORDER BY T1.TBL_INDEX_NME, T2.COL_SQ_NUM)) SCH
         FULL OUTER JOIN
         (SELECT *
            FROM (  SELECT T3.TBL_DDL_NME,
                           T1.TBL_INDEX_NME,
                           T2.COL_NME,
                           T2.COL_SQ_NUM
                      FROM FT_T_TIDX T1, FT_T_TIDC T2, FT_T_TBDF T3
                     WHERE     T1.TBL_ID = T3.TBL_ID
                           AND T1.TIDX_OID = T2.TIDX_OID
                           AND T2.SORT_SEQ_TYP IS NULL
                           AND T3.TBL_DDL_NME NOT LIKE 'FT_V%'
                           AND T3.TBL_DDL_NME NOT LIKE '%STATS%'
                           AND T1.TBL_INDEX_NME NOT IN
                                  (SELECT INDEX_NAME
                                     FROM USER_INDEXES
                                    WHERE INDEX_TYPE = 'FUNCTION-BASED NORMAL')
                  ORDER BY T1.TBL_INDEX_NME, T2.COL_SQ_NUM)
          MINUS
          SELECT *
            FROM (  SELECT T1.TABLE_NAME,
                           T2.INDEX_NAME,
                           T2.COLUMN_NAME,
                           T2.COLUMN_POSITION
                      FROM USER_INDEXES T1, USER_IND_COLUMNS T2
                     WHERE     T1.INDEX_NAME = T2.INDEX_NAME
                           AND T1.TABLE_NAME = T2.TABLE_NAME
                           AND (   T1.TABLE_NAME LIKE 'FT_%'
                                OR T1.TABLE_NAME LIKE 'OID%'
                                OR T1.TABLE_NAME LIKE 'TEMP%')
                           AND T1.TABLE_NAME NOT LIKE '%TMP%'
                           AND T1.TABLE_NAME NOT LIKE '%STATS%'
                           AND T1.TABLE_NAME NOT LIKE '%QRTZ%'
                           AND T1.TABLE_NAME NOT LIKE 'FTB_%'
                           AND T1.TABLE_NAME NOT LIKE 'FT_MAAF%'
                           AND T1.TABLE_NAME NOT LIKE 'FT_ERR%'
							AND T1.TABLE_NAME NOT LIKE '%GT158674%'
							AND T1.TABLE_NAME NOT LIKE 'FT_HIST_%'
                           AND T1.TABLE_NAME NOT LIKE 'FT_EV%'
                           AND T1.TABLE_NAME NOT LIKE '%QRTZ%'
                           AND T1.TABLE_NAME NOT LIKE 'FTB_%'
                           AND T1.TABLE_NAME NOT IN
                                  (SELECT TABLE_NAME
                                     FROM USER_TABLES
                                    WHERE     TABLE_NAME NOT LIKE '%TMP%'
                                          AND TABLE_NAME NOT LIKE '%STATS%'
                                          AND TABLE_NAME NOT LIKE '%QRTZ%'
                                          AND TABLE_NAME NOT LIKE 'FTB_%'
                                          AND TABLE_NAME NOT LIKE 'FT_MAAF%'
                                          AND TABLE_NAME NOT LIKE 'FT_ERR%'
                                          AND TABLE_NAME NOT LIKE 'FT_EV%'
										  AND TABLE_NAME NOT LIKE '%GT158674%'
										  AND TABLE_NAME NOT LIKE 'FT_HIST_%'
                                          AND TABLE_NAME NOT LIKE '%QRTZ%'
                                          AND TABLE_NAME NOT LIKE 'FTB_%'
                                          AND (   TABLE_NAME LIKE 'FT_%'
                                               OR T1.TABLE_NAME LIKE 'OID%'
                                               OR T1.TABLE_NAME LIKE 'TEMP%')
                                   MINUS
                                   SELECT TBL_DDL_NME FROM FT_T_TBDF)
                           AND EXISTS
                                  (SELECT 1
                                     FROM USER_OBJECTS A
                                    WHERE     A.OBJECT_TYPE = 'TABLE'
                                          AND A.OBJECT_NAME = T1.TABLE_NAME
                                          AND T2.COLUMN_NAME NOT LIKE 'SYS%$%')
                  ORDER BY T2.INDEX_NAME, T2.COLUMN_POSITION)) META
            ON     SCH.TABLE_NAME = META.TBL_DDL_NME
               AND SCH.INDEX_NAME = META.TBL_INDEX_NME
               AND SCH.COLUMN_POSITION = META.COL_SQ_NUM
ORDER BY 1,
         2,
         3,
         4;
    

PROMPT Constraints Present in Schema But not in Metadata

SELECT *
  FROM (  SELECT T1.TABLE_NAME,
                 T1.CONSTRAINT_NAME,
                 T2.COLUMN_NAME,
                 T2.POSITION
            FROM USER_CONSTRAINTS T1, USER_CONS_COLUMNS T2
           WHERE     T1.CONSTRAINT_NAME = T2.CONSTRAINT_NAME
		 AND T1.CONSTRAINT_NAME NOT LIKE '%_CHK_01'
		 AND T1.CONSTRAINT_NAME NOT IN ('FT_X_ISPH_U001','VFSD_J001')
                 AND EXISTS
                        (SELECT 1
                           FROM USER_OBJECTS A
                          WHERE     a.OBJECT_TYPE = 'TABLE'
                                AND A.OBJECT_NAME = T1.TABLE_NAME)
                 AND T1.TABLE_NAME = T2.TABLE_NAME
                 AND (   T1.TABLE_NAME LIKE 'FT_%'
                      OR T1.TABLE_NAME LIKE 'OID%'
                      OR T1.TABLE_NAME LIKE 'TEMP%')
                 AND T1.TABLE_NAME NOT LIKE '%TMP%'
                 AND T1.TABLE_NAME NOT LIKE '%STATS%'
                 AND T1.TABLE_NAME NOT LIKE '%QRTZ%'
                 AND T1.TABLE_NAME NOT LIKE 'FTB_%'
                 AND T1.TABLE_NAME NOT LIKE 'FT_MAAF%'
                 AND T1.TABLE_NAME NOT LIKE 'FT_ERR%'
				AND T1.TABLE_NAME NOT LIKE '%GT158674%'
				AND T1.TABLE_NAME NOT LIKE 'FT_HIST_%'
                AND T1.TABLE_NAME NOT LIKE 'FT_EV%'
                 AND T1.TABLE_NAME NOT LIKE '%QRTZ%'
                 AND T1.TABLE_NAME NOT LIKE 'FTB_%'
                 AND T1.TABLE_NAME NOT IN
                        (SELECT TABLE_NAME
                           FROM USER_TABLES
                          WHERE     TABLE_NAME NOT LIKE '%TMP%'
                                AND TABLE_NAME NOT LIKE '%STATS%'
                                AND TABLE_NAME NOT LIKE '%QRTZ%'
                                AND TABLE_NAME NOT LIKE 'FTB_%'
                                AND TABLE_NAME NOT LIKE 'FT_MAAF%'
                                AND TABLE_NAME NOT LIKE 'FT_ERR%'
                                AND TABLE_NAME NOT LIKE 'FT_EV%'
								AND TABLE_NAME NOT LIKE '%GT158674%'
								AND TABLE_NAME NOT LIKE 'FT_HIST_%'
                                AND TABLE_NAME NOT LIKE '%QRTZ%'
                                AND TABLE_NAME NOT LIKE 'FTB_%'
                                AND (   T1.TABLE_NAME LIKE 'FT_%'
                                     OR T1.TABLE_NAME LIKE 'OID%'
                                     OR T1.TABLE_NAME LIKE 'TEMP%')
                         MINUS
                         SELECT TBL_DDL_NME FROM FT_T_TBDF)
                 AND T1.CONSTRAINT_NAME NOT LIKE ('SYS_%')
        ORDER BY T1.CONSTRAINT_NAME, T2.POSITION)
MINUS
SELECT *
  FROM (  SELECT *
            FROM (SELECT T3.TBL_DDL_NME,
                         T1.TBL_FGN_KEY_ID,
                         T2.COL_NME,
                         T2.COL_SQ_NUM
                    FROM FT_T_TBRL T1, FT_T_TBRN T2, FT_T_TBDF T3
                   WHERE T3.TBL_ID = T1.TBL_ID AND T1.TBRL_OID = T2.TBRL_OID
                  UNION
                  SELECT T3.TBL_DDL_NME,
                         T1.TBL_INDEX_NME TBL_FGN_KEY_ID,
                         T2.COL_NME,
                         T2.COL_SQ_NUM
                    FROM FT_T_TIDX T1, FT_T_TIDC T2, FT_T_TBDF T3
                   WHERE     T3.TBL_ID = T1.TBL_ID
                         AND T1.TIDX_OID = T2.TIDX_OID
                         AND TBL_INDEX_TYP = 'P')
        ORDER BY TBL_FGN_KEY_ID, COL_SQ_NUM);


PROMPT Constraints Present in Metadata But not in Schema

SELECT *
  FROM (  SELECT *
            FROM (SELECT T3.TBL_DDL_NME,
                         T1.TBL_FGN_KEY_ID,
                         T2.COL_NME,
                         T2.COL_SQ_NUM
                    FROM FT_T_TBRL T1, FT_T_TBRN T2, FT_T_TBDF T3
                   WHERE     T3.TBL_ID = T1.TBL_ID
                         AND T1.TBRL_OID = T2.TBRL_OID
                         AND T1.LOGL_ONLY_IND != 'Y'
                         AND T3.TBL_DDL_NME NOT LIKE 'FT_V%'
                  UNION
                  SELECT T3.TBL_DDL_NME,
                         T1.TBL_INDEX_NME TBL_FGN_KEY_ID,
                         T2.COL_NME,
                         T2.COL_SQ_NUM
                    FROM FT_T_TIDX T1, FT_T_TIDC T2, FT_T_TBDF T3
                   WHERE     T3.TBL_ID = T1.TBL_ID
                         AND T1.TIDX_OID = T2.TIDX_OID
			 AND T1.TBL_INDEX_NME  NOT IN ('FT_T_ISPH_PK')
                         AND T3.TBL_DDL_NME NOT LIKE 'FT_V%'
                         AND TBL_INDEX_TYP = 'P')
        ORDER BY TBL_FGN_KEY_ID, COL_SQ_NUM)
MINUS
SELECT *
  FROM (  SELECT T1.TABLE_NAME,
                 T1.CONSTRAINT_NAME,
                 T2.COLUMN_NAME,
                 T2.POSITION
            FROM USER_CONSTRAINTS T1, USER_CONS_COLUMNS T2
           WHERE     T1.CONSTRAINT_NAME = T2.CONSTRAINT_NAME
                 AND EXISTS
                        (SELECT 1
                           FROM USER_OBJECTS A
                          WHERE     a.OBJECT_TYPE = 'TABLE'
                                AND A.OBJECT_NAME = T1.TABLE_NAME)
                 AND T1.TABLE_NAME = T2.TABLE_NAME
                 AND (   T1.TABLE_NAME LIKE 'FT_%'
                      OR T1.TABLE_NAME LIKE 'OID%'
                      OR T1.TABLE_NAME LIKE 'TEMP%')
                 AND T1.TABLE_NAME NOT LIKE '%TMP%'
                 AND T1.TABLE_NAME NOT LIKE '%STATS%'
                 AND T1.TABLE_NAME NOT LIKE '%QRTZ%'
                 AND T1.TABLE_NAME NOT LIKE 'FTB_%'
			  	 AND T1.TABLE_NAME NOT LIKE '%GT158674%'
				 AND T1.TABLE_NAME NOT LIKE 'FT_HIST_%'
                 AND T1.TABLE_NAME NOT LIKE 'FT_MAAF%'
                 AND T1.TABLE_NAME NOT LIKE 'FT_ERR%'
                 AND T1.TABLE_NAME NOT LIKE 'FT_EV%'
                 AND T1.TABLE_NAME NOT LIKE '%QRTZ%'
                 AND T1.TABLE_NAME NOT LIKE 'FTB_%'
                 AND T1.TABLE_NAME NOT IN
                        (SELECT TABLE_NAME
                           FROM USER_TABLES
                          WHERE     TABLE_NAME NOT LIKE '%TMP%'
                                AND TABLE_NAME NOT LIKE '%STATS%'
                                AND TABLE_NAME NOT LIKE '%QRTZ%'
                                AND TABLE_NAME NOT LIKE 'FTB_%'
                                AND TABLE_NAME NOT LIKE 'FT_MAAF%'
								AND TABLE_NAME NOT LIKE '%GT158674%'
								AND TABLE_NAME NOT LIKE 'FT_HIST_%'
                               AND TABLE_NAME NOT LIKE 'FT_ERR%'
                                AND TABLE_NAME NOT LIKE 'FT_EV%'
                                AND TABLE_NAME NOT LIKE '%QRTZ%'
                                AND TABLE_NAME NOT LIKE 'FTB_%'
                                AND (   T1.TABLE_NAME LIKE 'FT_%'
                                     OR T1.TABLE_NAME LIKE 'OID%'
                                     OR T1.TABLE_NAME LIKE 'TEMP%')
                         MINUS
                         SELECT TBL_DDL_NME FROM FT_T_TBDF)
                 AND T1.CONSTRAINT_NAME NOT LIKE ('SYS_%')
        ORDER BY T1.CONSTRAINT_NAME, T2.POSITION);



PROMPT End - Schema Name and date		 
SELECT USER, TO_CHAR(SYSDATE,'YYYYMMDD HH:MI:SS') DATETIME FROM DUAL;



SPOOL OFF
SET MARKUP HTML OFF
EXIT