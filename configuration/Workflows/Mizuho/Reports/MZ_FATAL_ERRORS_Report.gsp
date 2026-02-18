<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.07">
<package-comment/>
<businessobject displayString="28 - V10_QuerryCorrected v2 lst_notfcn_tms" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>false</alwaysPersist>
<clustered>false</clustered>
<comment id="1">V10_QuerryCorrected v2 lst_notfcn_tms</comment>
<endNode id="2">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="3"/>
<directJoin>false</directJoin>
<name id="4">Stop</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="5">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="6" type="java.util.HashSet">
<item id="7" type="com.j2fe.workflow.definition.Transition">
<name id="8">goto-next</name>
<source id="9">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="10"/>
<directJoin>false</directJoin>
<name id="11">Error</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="12">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="13" type="java.util.HashSet">
<item id="14" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="15">["Attachment"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="16">input["Attachment"]</name>
<objectValue id="17" type="java.lang.String">FATAL_ERRORS_Asset_not_published_from_GS_</objectValue>
<type>CONSTANT</type>
</item>
<item id="18" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="19">["CopyIn"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="20">input["CopyIn"]</name>
<stringValue id="21">CopyIn</stringValue>
<type>VARIABLE</type>
</item>
<item id="22" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="23">["EmailText"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="24">input["EmailText"]</name>
<objectValue id="25" type="java.lang.String">The reported assets or their latest update have not been published by GoldenSource, please investigate.</objectValue>
<type>CONSTANT</type>
</item>
<item id="26" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="27">["NoteText"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="28">input["NoteText"]</name>
<objectValue id="29" type="java.lang.String">"N.B. This is an automated e-mail. Please do not respond to this e-mail as this mailbox is not monitored. If you have questions about this message, please contact Global IT Apps &amp; Services Team (pur_in_gitcas@mizuho-sc.com)."</objectValue>
<type>CONSTANT</type>
</item>
<item id="30" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="31">["Recipients"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="32">input["Recipients"]</name>
<stringValue id="33">Recipients</stringValue>
<type>VARIABLE</type>
</item>
<item id="34" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="35">["Subject"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="36">input["Subject"]</name>
<objectValue id="37" type="java.lang.String">FATAL ERRORS - while processing PM assets in the last 24 hours</objectValue>
<type>CONSTANT</type>
</item>
<item id="38" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="39">["sqlSelect"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="40">input["sqlSelect"]</name>
<objectValue id="41" type="java.lang.String">select '"Transaction Id","Entity Name","ID Type","ID Value","Entity Type","Notification Time","Notification text","Suggestion Text","SOI Name","Table Name","Fields","Details"', 1 ordernum FROM DUAL
union all          
SELECT DISTINCT concat('"' , sub2.trn_id , '","' , sub2.main_entity_nme , '","' , sub2.main_entity_id_ctxt_typ , '","' , sub2.main_entity_id , '","' , trim(sub2.main_entity_typ) , '","' , sub2.notfcn_crte_tms , '","' , sub2.char_val_txt , '","' , sub2.suggest_long_txt , '","' , soi.SOI_Groups , '","' , COALESCE(sub2.Table_names, 'NA') , '","' , COALESCE(sub2.Fields, 'NA') , '","' , COALESCE(sub2.Details, 'NA') , '"'), 2 AS ordernum
FROM
(
    SELECT sub1.*, isid.instr_id, tblname.table_names, fields.Fields, details.Details
    FROM
    (
        SELECT trid.trn_id, trid.main_entity_nme, trid.main_entity_id_ctxt_typ, trid.main_entity_id,
               trim(trid.main_entity_typ) AS main_entity_typ, ntel.lst_notfcn_tms as notfcn_crte_tms , ntel.char_val_txt, ntrs.suggest_long_txt
        FROM ft_t_trid trid
        JOIN (SELECT last_chg_trn_id, lst_notfcn_tms, parm_val_txt, char_val_txt, appl_id, part_id, notfcn_id, notfcn_stat_typ 
				FROM (
				    SELECT last_chg_trn_id, lst_notfcn_tms, parm_val_txt, char_val_txt, appl_id, part_id, notfcn_id, notfcn_stat_typ,
	  	 		        ROW_NUMBER() OVER (PARTITION BY last_chg_trn_id ORDER BY lst_notfcn_tms DESC) AS rn
    				FROM ft_t_ntel
    				WHERE 1=1 
    				and msg_severity_cde=50
    				and notfcn_stat_typ='OPEN'
    				) sq1
				WHERE rn = 1) ntel 
		ON trid.trn_id = ntel.last_chg_trn_id
        JOIN ft_t_ntrs ntrs ON ntel.appl_id = ntrs.appl_id
                          AND ntel.part_id = ntrs.part_id
                          AND ntel.notfcn_id = ntrs.notfcn_id        
        WHERE trid.input_msg_typ = 'PMASSET'
          AND trid.created_tms &gt; now() - INTERVAL '1 day'
          AND trid.crrnt_severity_cde = 50
          and ntel.notfcn_stat_typ='OPEN'
        union 
        select trid.trn_id, trid.main_entity_nme, trid.main_entity_id_ctxt_typ, trid.main_entity_id,
               trim(trid.main_entity_typ) AS main_entity_typ, msgv.notfcn_crte_tms as notfcn_crte_tms, ntrs.suggest_long_txt, ntrs.suggest_long_txt
        from ft_t_trid trid
        join (SELECT trn_id, notfcn_crte_tms, appl_id, part_id, notfcn_id, msg_stat_typ 
				FROM (
    					SELECT trn_id, notfcn_crte_tms, appl_id, part_id, notfcn_id, msg_stat_typ 
    					,ROW_NUMBER() OVER (PARTITION BY trn_id ORDER BY notfcn_crte_tms DESC) AS rn
					    FROM ft_t_msgv
    					WHERE msg_severity_cde=50
					    and msg_stat_typ='OPEN'
					  ) sq2
				WHERE rn = 1) msgv 
		on trid.trn_id = msgv.trn_id
        join ft_t_ntrs ntrs ON msgv.appl_id = ntrs.appl_id
                          and msgv.part_id = ntrs.part_id
                          and msgv.notfcn_id = ntrs.notfcn_id
        where trid.input_msg_typ = 'PMASSET'
          AND trid.created_tms &gt; now() - INTERVAL '1 day'
          AND trid.crrnt_severity_cde = 50
          and msgv.msg_stat_typ = 'OPEN'
          and not exists (select 1 from ft_t_ntel where last_chg_trn_id=trid.trn_id and notfcn_stat_typ='OPEN')
    ) sub1
    LEFT JOIN (SELECT * FROM ft_t_isid WHERE id_ctxt_typ = 'PRODUCTOID' AND end_tms IS NULL) isid
      ON sub1.main_entity_id = isid.iss_id
    LEFT JOIN (
        SELECT trn_id,
               string_agg(char_val_txt, ';' ORDER BY trn_id, char_val_txt) AS Table_Names
        FROM (SELECT DISTINCT trn_id, char_val_txt FROM ft_t_ntel
              WHERE parm_val_txt = 'TableName' AND lst_notfcn_tms &gt; now() - INTERVAL '1 day'
              and notfcn_stat_typ='OPEN') t			
        GROUP BY trn_id
    ) tblname ON sub1.trn_id = tblname.trn_id
    LEFT JOIN (
        SELECT trn_id,
               string_agg(char_val_txt, ';' ORDER BY trn_id, char_val_txt) AS Fields
        FROM (SELECT DISTINCT trn_id, char_val_txt FROM ft_t_ntel
              WHERE parm_val_txt = 'Fields' AND lst_notfcn_tms &gt; now() - INTERVAL '1 day'
              and notfcn_stat_typ='OPEN') f			
        GROUP BY trn_id
    ) fields ON sub1.trn_id = fields.trn_id
    LEFT JOIN (
        SELECT trn_id,
               string_agg(char_val_txt, ';' ORDER BY trn_id, char_val_txt) AS Details
        FROM (SELECT DISTINCT trn_id, char_val_txt FROM ft_t_ntel
              WHERE  lst_notfcn_tms &gt; now() - INTERVAL '1 day'
              and notfcn_stat_typ='OPEN') d			
        GROUP BY trn_id
    ) details ON sub1.trn_id = details.trn_id
) sub2
LEFT JOIN (
    SELECT univ.instr_id,
           string_agg(univ.grp_nme, ';' ORDER BY instr_id, grp_nme) AS SOI_Groups
    FROM (
        SELECT isgp.instr_id, isgr.grp_nme
        FROM ft_t_isgp isgp
        JOIN ft_t_isgr isgr ON isgp.prnt_iss_grp_oid = isgr.iss_grp_oid
        WHERE isgp.end_tms IS NULL
          AND isgr.grp_nme LIKE 'M%'
    ) univ
    GROUP BY univ.instr_id
) soi ON sub2.instr_id = soi.instr_id
ORDER BY ordernum, 1</objectValue>
<type>CONSTANT</type>
</item>
<item id="42" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="43">name</name>
<stringValue id="44">EmailExcelReport</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="45" type="java.util.HashSet">
<item id="46" type="com.j2fe.workflow.definition.Transition">
<name id="47">rows-found</name>
<source id="48">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="49"/>
<directJoin>false</directJoin>
<name id="50">Database Select (Xor Split)</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="51">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="52" type="java.util.HashSet">
<item id="53" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="54">database</name>
<stringValue id="55">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="56" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="57">querySQL</name>
<objectValue id="58" type="java.lang.String">SELECT DISTINCT concat('"' , sub2.trn_id , '","' , sub2.main_entity_nme , '","' , sub2.main_entity_id_ctxt_typ , '","' , sub2.main_entity_id , '","' , trim(sub2.main_entity_typ) , '","' , sub2.notfcn_crte_tms , '","' , sub2.char_val_txt , '","' , sub2.suggest_long_txt , '","' , soi.SOI_Groups , '","' , COALESCE(sub2.Table_names, 'NA') , '","' , COALESCE(sub2.Fields, 'NA') , '","' , COALESCE(sub2.Details, 'NA') , '"'), 2 AS ordernum
FROM
(
    SELECT sub1.*, isid.instr_id, tblname.table_names, fields.Fields, details.Details
    FROM
    (
        SELECT trid.trn_id, trid.main_entity_nme, trid.main_entity_id_ctxt_typ, trid.main_entity_id,
               trim(trid.main_entity_typ) AS main_entity_typ, ntel.notfcn_crte_tms, ntel.char_val_txt, ntrs.suggest_long_txt
        FROM ft_t_trid trid
        JOIN (SELECT last_chg_trn_id, notfcn_crte_tms, parm_val_txt, char_val_txt, appl_id, part_id, notfcn_id, notfcn_stat_typ 
				FROM (
				    SELECT last_chg_trn_id, notfcn_crte_tms, parm_val_txt, char_val_txt, appl_id, part_id, notfcn_id, notfcn_stat_typ,
	  	 		        ROW_NUMBER() OVER (PARTITION BY last_chg_trn_id ORDER BY notfcn_crte_tms DESC) AS rn
    				FROM ft_t_ntel
    				WHERE 1=1 
    				and msg_severity_cde=50
    				and notfcn_stat_typ='OPEN'
    				) sq1
				WHERE rn = 1) ntel 
		ON trid.trn_id = ntel.last_chg_trn_id
        JOIN ft_t_ntrs ntrs ON ntel.appl_id = ntrs.appl_id
                          AND ntel.part_id = ntrs.part_id
                          AND ntel.notfcn_id = ntrs.notfcn_id        
        WHERE trid.input_msg_typ = 'PMASSET'
          AND trid.created_tms &gt; now() - INTERVAL '1 day'
          AND trid.crrnt_severity_cde = 50
          and ntel.notfcn_stat_typ='OPEN'
        union 
        select trid.trn_id, trid.main_entity_nme, trid.main_entity_id_ctxt_typ, trid.main_entity_id,
               trim(trid.main_entity_typ) AS main_entity_typ, msgv.notfcn_crte_tms, ntrs.suggest_long_txt, ntrs.suggest_long_txt
        from ft_t_trid trid
        join (SELECT trn_id, notfcn_crte_tms, appl_id, part_id, notfcn_id, msg_stat_typ 
				FROM (
    					SELECT trn_id, notfcn_crte_tms, appl_id, part_id, notfcn_id, msg_stat_typ 
    					,ROW_NUMBER() OVER (PARTITION BY trn_id ORDER BY notfcn_crte_tms DESC) AS rn
					    FROM ft_t_msgv
    					WHERE msg_severity_cde=50
					    and msg_stat_typ='OPEN'
					  ) sq2
				WHERE rn = 1) msgv 
		on trid.trn_id = msgv.trn_id
        join ft_t_ntrs ntrs ON msgv.appl_id = ntrs.appl_id
                          and msgv.part_id = ntrs.part_id
                          and msgv.notfcn_id = ntrs.notfcn_id
        where trid.input_msg_typ = 'PMASSET'
          AND trid.created_tms &gt; now() - INTERVAL '1 day'
          AND trid.crrnt_severity_cde = 50
          and msgv.msg_stat_typ = 'OPEN'
          and not exists (select 1 from ft_t_ntel where last_chg_trn_id=trid.trn_id and notfcn_stat_typ='OPEN')
    ) sub1
    LEFT JOIN (SELECT * FROM ft_t_isid WHERE id_ctxt_typ = 'PRODUCTOID' AND end_tms IS NULL) isid
      ON sub1.main_entity_id = isid.iss_id
    LEFT JOIN (
        SELECT trn_id,
               string_agg(char_val_txt, ';' ORDER BY trn_id, char_val_txt) AS Table_Names
        FROM (SELECT DISTINCT trn_id, char_val_txt FROM ft_t_ntel
              WHERE parm_val_txt = 'TableName' AND NOTFCN_CRTE_TMS &gt; now() - INTERVAL '1 day'
              and notfcn_stat_typ='OPEN') t			
        GROUP BY trn_id
    ) tblname ON sub1.trn_id = tblname.trn_id
    LEFT JOIN (
        SELECT trn_id,
               string_agg(char_val_txt, ';' ORDER BY trn_id, char_val_txt) AS Fields
        FROM (SELECT DISTINCT trn_id, char_val_txt FROM ft_t_ntel
              WHERE parm_val_txt = 'Fields' AND NOTFCN_CRTE_TMS &gt; now() - INTERVAL '1 day'
              and notfcn_stat_typ='OPEN') f			
        GROUP BY trn_id
    ) fields ON sub1.trn_id = fields.trn_id
    LEFT JOIN (
        SELECT trn_id,
               string_agg(char_val_txt, ';' ORDER BY trn_id, char_val_txt) AS Details
        FROM (SELECT DISTINCT trn_id, char_val_txt FROM ft_t_ntel
              WHERE  NOTFCN_CRTE_TMS &gt; now() - INTERVAL '1 day'
              and notfcn_stat_typ='OPEN') d			
        GROUP BY trn_id
    ) details ON sub1.trn_id = details.trn_id
) sub2
LEFT JOIN (
    SELECT univ.instr_id,
           string_agg(univ.grp_nme, ';' ORDER BY instr_id, grp_nme) AS SOI_Groups
    FROM (
        SELECT isgp.instr_id, isgr.grp_nme
        FROM ft_t_isgp isgp
        JOIN ft_t_isgr isgr ON isgp.prnt_iss_grp_oid = isgr.iss_grp_oid
        WHERE isgp.end_tms IS NULL
          AND isgr.grp_nme LIKE 'M%'
    ) univ
    GROUP BY univ.instr_id
) soi ON sub2.instr_id = soi.instr_id
ORDER BY ordernum, 1</objectValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="59" type="java.util.HashSet">
<item id="60" type="com.j2fe.workflow.definition.Transition">
<name id="61">goto-next</name>
<source id="62">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="63"/>
<directJoin>false</directJoin>
<name id="64">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="65">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="66" type="java.util.HashSet"/>
<targets id="67" type="java.util.HashSet">
<item idref="60" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="48"/>
</item>
</sources>
<targets id="68" type="java.util.HashSet">
<item id="69" type="com.j2fe.workflow.definition.Transition">
<name id="70">nothing-found</name>
<source idref="48"/>
<target id="71">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="72"/>
<directJoin>false</directJoin>
<name id="73">No Error</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="74">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="75" type="java.util.HashSet">
<item id="76" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="77">["Attachment"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="78">input["Attachment"]</name>
<objectValue id="79" type="java.lang.String">FATAL_ERRORS_Asset_not_published_from_GS_</objectValue>
<type>CONSTANT</type>
</item>
<item id="80" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="81">["CopyIn"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="82">input["CopyIn"]</name>
<stringValue id="83">CopyIn</stringValue>
<type>VARIABLE</type>
</item>
<item id="84" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="85">["EmailText"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="86">input["EmailText"]</name>
<objectValue id="87" type="java.lang.String">NO FATAL Errors while processing asset in the last 24 hours. No need for investigation.</objectValue>
<type>CONSTANT</type>
</item>
<item id="88" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="89">["NoteText"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="90">input["NoteText"]</name>
<objectValue id="91" type="java.lang.String">"N.B. This is an automated e-mail. Please do not respond to this e-mail as this mailbox is not monitored. If you have questions about this message, please contact Global IT Apps &amp; Services Team (pur_in_gitcas@mizuho-sc.com)."</objectValue>
<type>CONSTANT</type>
</item>
<item id="92" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="93">["Recipients"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="94">input["Recipients"]</name>
<stringValue id="95">Recipients</stringValue>
<type>VARIABLE</type>
</item>
<item id="96" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="97">["Subject"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="98">input["Subject"]</name>
<objectValue id="99" type="java.lang.String">NO FATAL Errors while processing asset in the last 24 hours</objectValue>
<type>CONSTANT</type>
</item>
<item id="100" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="101">["sqlSelect"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="102">input["sqlSelect"]</name>
<objectValue id="103" type="java.lang.String">select '"Transaction Id","Entity Name","ID Type","ID Value","Entity Type","Notification Time","Notification text","Suggestion Text","SOI Name","Table Name","Fields","Details"', 1 ordernum FROM DUAL
union all          
SELECT DISTINCT concat('"' , sub2.trn_id , '","' , sub2.main_entity_nme , '","' , sub2.main_entity_id_ctxt_typ , '","' , sub2.main_entity_id , '","' , trim(sub2.main_entity_typ) , '","' , sub2.notfcn_crte_tms , '","' , sub2.char_val_txt , '","' , sub2.suggest_long_txt , '","' , soi.SOI_Groups , '","' , COALESCE(sub2.Table_names, 'NA') , '","' , COALESCE(sub2.Fields, 'NA') , '","' , COALESCE(sub2.Details, 'NA') , '"'), 2 AS ordernum
FROM
(
    SELECT sub1.*, isid.instr_id, tblname.table_names, fields.Fields, details.Details
    FROM
    (
        SELECT trid.trn_id, trid.main_entity_nme, trid.main_entity_id_ctxt_typ, trid.main_entity_id,
               trim(trid.main_entity_typ) AS main_entity_typ, ntel.lst_notfcn_tms as notfcn_crte_tms , ntel.char_val_txt, ntrs.suggest_long_txt
        FROM ft_t_trid trid
        JOIN (SELECT last_chg_trn_id, lst_notfcn_tms, parm_val_txt, char_val_txt, appl_id, part_id, notfcn_id, notfcn_stat_typ 
				FROM (
				    SELECT last_chg_trn_id, lst_notfcn_tms, parm_val_txt, char_val_txt, appl_id, part_id, notfcn_id, notfcn_stat_typ,
	  	 		        ROW_NUMBER() OVER (PARTITION BY last_chg_trn_id ORDER BY lst_notfcn_tms DESC) AS rn
    				FROM ft_t_ntel
    				WHERE 1=1 
    				and msg_severity_cde=50
    				and notfcn_stat_typ='OPEN'
    				) sq1
				WHERE rn = 1) ntel 
		ON trid.trn_id = ntel.last_chg_trn_id
        JOIN ft_t_ntrs ntrs ON ntel.appl_id = ntrs.appl_id
                          AND ntel.part_id = ntrs.part_id
                          AND ntel.notfcn_id = ntrs.notfcn_id        
        WHERE trid.input_msg_typ = 'PMASSET'
          AND trid.created_tms &gt; now() - INTERVAL '1 day'
          AND trid.crrnt_severity_cde = 50
          and ntel.notfcn_stat_typ='OPEN'
        union 
        select trid.trn_id, trid.main_entity_nme, trid.main_entity_id_ctxt_typ, trid.main_entity_id,
               trim(trid.main_entity_typ) AS main_entity_typ, msgv.notfcn_crte_tms as notfcn_crte_tms, ntrs.suggest_long_txt, ntrs.suggest_long_txt
        from ft_t_trid trid
        join (SELECT trn_id, notfcn_crte_tms, appl_id, part_id, notfcn_id, msg_stat_typ 
				FROM (
    					SELECT trn_id, notfcn_crte_tms, appl_id, part_id, notfcn_id, msg_stat_typ 
    					,ROW_NUMBER() OVER (PARTITION BY trn_id ORDER BY notfcn_crte_tms DESC) AS rn
					    FROM ft_t_msgv
    					WHERE msg_severity_cde=50
					    and msg_stat_typ='OPEN'
					  ) sq2
				WHERE rn = 1) msgv 
		on trid.trn_id = msgv.trn_id
        join ft_t_ntrs ntrs ON msgv.appl_id = ntrs.appl_id
                          and msgv.part_id = ntrs.part_id
                          and msgv.notfcn_id = ntrs.notfcn_id
        where trid.input_msg_typ = 'PMASSET'
          AND trid.created_tms &gt; now() - INTERVAL '1 day'
          AND trid.crrnt_severity_cde = 50
          and msgv.msg_stat_typ = 'OPEN'
          and not exists (select 1 from ft_t_ntel where last_chg_trn_id=trid.trn_id and notfcn_stat_typ='OPEN')
    ) sub1
    LEFT JOIN (SELECT * FROM ft_t_isid WHERE id_ctxt_typ = 'PRODUCTOID' AND end_tms IS NULL) isid
      ON sub1.main_entity_id = isid.iss_id
    LEFT JOIN (
        SELECT trn_id,
               string_agg(char_val_txt, ';' ORDER BY trn_id, char_val_txt) AS Table_Names
        FROM (SELECT DISTINCT trn_id, char_val_txt FROM ft_t_ntel
              WHERE parm_val_txt = 'TableName' AND lst_notfcn_tms &gt; now() - INTERVAL '1 day'
              and notfcn_stat_typ='OPEN') t			
        GROUP BY trn_id
    ) tblname ON sub1.trn_id = tblname.trn_id
    LEFT JOIN (
        SELECT trn_id,
               string_agg(char_val_txt, ';' ORDER BY trn_id, char_val_txt) AS Fields
        FROM (SELECT DISTINCT trn_id, char_val_txt FROM ft_t_ntel
              WHERE parm_val_txt = 'Fields' AND lst_notfcn_tms &gt; now() - INTERVAL '1 day'
              and notfcn_stat_typ='OPEN') f			
        GROUP BY trn_id
    ) fields ON sub1.trn_id = fields.trn_id
    LEFT JOIN (
        SELECT trn_id,
               string_agg(char_val_txt, ';' ORDER BY trn_id, char_val_txt) AS Details
        FROM (SELECT DISTINCT trn_id, char_val_txt FROM ft_t_ntel
              WHERE  lst_notfcn_tms &gt; now() - INTERVAL '1 day'
              and notfcn_stat_typ='OPEN') d			
        GROUP BY trn_id
    ) details ON sub1.trn_id = details.trn_id
) sub2
LEFT JOIN (
    SELECT univ.instr_id,
           string_agg(univ.grp_nme, ';' ORDER BY instr_id, grp_nme) AS SOI_Groups
    FROM (
        SELECT isgp.instr_id, isgr.grp_nme
        FROM ft_t_isgp isgp
        JOIN ft_t_isgr isgr ON isgp.prnt_iss_grp_oid = isgr.iss_grp_oid
        WHERE isgp.end_tms IS NULL
          AND isgr.grp_nme LIKE 'M%'
    ) univ
    GROUP BY univ.instr_id
) soi ON sub2.instr_id = soi.instr_id
ORDER BY ordernum, 1</objectValue>
<type>CONSTANT</type>
</item>
<item id="104" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="105">name</name>
<stringValue id="106">EmailExcelReport</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="107" type="java.util.HashSet">
<item idref="69" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="108" type="java.util.HashSet">
<item id="109" type="com.j2fe.workflow.definition.Transition">
<name id="110">goto-next</name>
<source idref="71"/>
<target idref="2"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item idref="46" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="9"/>
</item>
</sources>
<targets id="111" type="java.util.HashSet">
<item idref="7" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="2"/>
</item>
<item idref="109" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="112" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="113">Mizuho/Reports</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="114">user1</lastChangeUser>
<lastUpdate id="115">2025-12-03T11:14:15.000+0000</lastUpdate>
<name id="116">MZ_FATAL_ERRORS_Report</name>
<nodes id="117" type="java.util.HashSet">
<item idref="48" type="com.j2fe.workflow.definition.Node"/>
<item idref="9" type="com.j2fe.workflow.definition.Node"/>
<item idref="71" type="com.j2fe.workflow.definition.Node"/>
<item idref="62" type="com.j2fe.workflow.definition.Node"/>
<item idref="2" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>true</optimize>
<parameter id="118" type="java.util.HashMap">
<entry>
<key id="119" type="java.lang.String">CopyIn</key>
<value id="120" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="121">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="122">Multiple addresses separated by ;</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="123" type="java.lang.String">Recipients</key>
<value id="124" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="125">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="126">Multiple addresses separated by ;</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
</parameter>
<permissions id="127" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>false</purgeAtEnd>
<retries>0</retries>
<startNode idref="62"/>
<status>RELEASED</status>
<variables id="128" type="java.util.HashMap">
<entry>
<key id="129" type="java.lang.String">CopyIn</key>
<value id="130" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="131">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="132">Multiple addresses separated by ;</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="133" type="java.lang.String">Recipients</key>
<value id="134" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="135">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="136">Multiple addresses separated by ;</description>
<persistent>false</persistent>
</value>
</entry>
</variables>
<version>28</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
