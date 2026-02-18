--------- PHASE 1&2 ----------
DELETE FROM FT_WF_APEV WHERE appl_event_nme IN ('Moodys Process', 'S&P Process', 'Fitch Process', 'BBBO Process');

--------- PHASE 3 ----------
DELETE FROM FT_WF_APEV WHERE appl_event_nme IN ('MZ_ASOF_DATE_Report Event');