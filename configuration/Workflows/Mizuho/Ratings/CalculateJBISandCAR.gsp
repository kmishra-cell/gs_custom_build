<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.12">
<package-comment/>
<businessobject displayString="23 - GU1154Fixed v4" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>false</alwaysPersist>
<clustered>false</clustered>
<comment id="1">GU1154Fixed v4</comment>
<description id="2"/>
<endNode id="3">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="4"/>
<directJoin>false</directJoin>
<name id="5">Stop</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="6">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="7" type="java.util.HashSet">
<item id="8" type="com.j2fe.workflow.definition.Transition">
<name id="9">goto-next</name>
<source id="10">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="11"/>
<directJoin>false</directJoin>
<name id="12">ISSR-Insert JBIS</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="13">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="14" type="java.util.HashSet">
<item id="15" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="16">database</name>
<stringValue id="17">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="18" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="19">indexedParameters[0]</name>
<stringValue id="20">Issuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="21" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="22">querySQL</name>
<objectValue id="23" type="java.lang.String">insert
	into
	ft_t_isrt ( ISS_RTNG_OID,
	INSTR_ID,
	START_TMS,
	LAST_CHG_USR_ID,
	LAST_CHG_TMS,
	RTNG_CDE,
	RTNG_SYMBOL_TXT,
	RTNG_VALUE_OID,
	RTNG_SET_OID,
	orig_data_prov_id,
	data_stat_typ,
	rtng_eff_tms,
	data_src_id )
select  NEW_OID(), dd.instr_id, now(), 'CalculateJBISandCAR-ISSR', now(), rtvl2.rtng_cde, rtvl2.rtng_cde, rtvl2.rtng_value_oid, 'RTNG000007', 'DERIVED', 'ACTIVE',DATE_TRUNC('day', now()), dd.data_src_id
from
   (select distinct  
      instr_id
      ,rank_num
      ,rank
      ,data_src_id
      ,rank() over (partition by instr_issr_id order by rank desc ) rank2 
   from
      (select * 
      from 
         (select 
            firt.rtng_cde
            ,issu.instr_issr_id
            ,firt.rtng_set_oid
            ,firt.rtng_value_oid
            ,drvl.rank_num
            ,issu.instr_id
	     ,rtng.data_src_id
            ,firt.last_chg_tms
            ,rank() over (partition by issu.instr_id order by drvl.rank_num , firt.last_chg_tms desc, rtng.data_src_id desc) rank
         from ft_t_firt firt, ft_t_frip frip, ft_t_rtvl rtvl, ft_t_rtvl drvl, ft_t_rtng rtng, ft_t_issu issu
         where rtvl.rtng_value_oid = firt.rtng_value_oid 
         and firt.rtng_cde = rtvl.rtng_cde
         and firt.rtng_set_oid = rtvl.rtng_set_oid
         and rtng.rtng_set_oid=firt.rtng_set_oid
         and rtng.start_tms &lt;= now() and (rtng.end_tms is null or rtng.end_tms &gt; now()) 
         and drvl.rtng_cde = rtvl.rtng_cde 
         and trim(drvl.rtng_set_oid) = (case  
            when rtng.data_src_id like 'MOODYS%' then rtng.rtng_set_oid
            when rtng.data_src_id = 'FITCH' then rtng.rtng_set_oid
            when rtng.data_src_id like ('S_P%') then rtng.rtng_set_oid
            when rtng.data_src_id = 'JCR' then rtng.rtng_set_oid
            end)
         and issu.instr_issr_id = ?
         and firt.inst_mnem = frip.inst_mnem
         and frip.instr_id = issu.instr_id
         and coalesce(firt.rtng_purp_typ ,'x') != 'PSTANDRD'
         and firt.rtng_eff_tms &lt;= now() and (firt.sys_eff_end_tms is null or firt.sys_eff_end_tms &gt; now())
         and rtvl.start_tms &lt;= now() and (rtvl.end_tms is null or rtvl.end_tms &gt; now())
         and drvl.start_tms &lt;= now() and (drvl.end_tms is null or drvl.end_tms &gt; now())
         AND EXISTS 
            (SELECT 1 
            FROM FT_T_ISTY ISTY 
            WHERE ISTY.ISS_TYP = ISSU.ISS_TYP 
            AND ISTY.PRNT_ISS_TYP = 'DEBT'
            AND ISTY.START_TMS &lt;=now() AND (ISTY.END_TMS IS NULL OR ISTY.END_TMS &gt; now()))
         and exists 
            (select 1 
            from ft_t_isgp isgp 
            where isgp.instr_id = issu.instr_id 
            and isgp.prt_purp_typ = 'PRTFLIOC' and isgp.prnt_iss_grp_oid != 'ISGR000011' 
            and isgp.start_tms &lt;= now() and (isgp.end_tms is null or isgp.end_tms &gt; now()))
         and firt.data_stat_typ = 'ACTIVE')dd
      where dd.rank in (1,2))tab )dd
      ,ft_t_rtvl rtvl2
   where 1=1 
   and rank2=1
   and rtng_set_oid = 'RTNG000007' 
   and rtvl2.rank_num = dd.rank_num 
   and rtvl2.start_tms &lt;= now() and (rtvl2.end_tms is null or rtvl2.end_tms &gt; now())
   and not exists 
      (select 1 
      from ft_t_isrt isrt 
      where isrt.instr_id = dd.instr_id
      and isrt.rtng_set_oid = 'RTNG000007' 
      and isrt.orig_data_prov_id = 'DERIVED')</objectValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="24" type="java.util.HashSet">
<item id="25" type="com.j2fe.workflow.definition.Transition">
<name id="26">goto-next</name>
<source id="27">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="28"/>
<directJoin>false</directJoin>
<name id="29">ISSR-Insert CAR</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="30">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="31" type="java.util.HashSet">
<item id="32" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="33">database</name>
<stringValue id="34">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="35" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="36">indexedParameters[0]</name>
<stringValue id="37">Issuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="38" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="39">querySQL</name>
<objectValue id="40" type="java.lang.String">insert into ft_t_isrt (ISS_RTNG_OID, INSTR_ID, START_TMS, LAST_CHG_USR_ID, LAST_CHG_TMS, RTNG_CDE, RTNG_SYMBOL_TXT, RTNG_VALUE_OID, RTNG_SET_OID, orig_data_prov_id, data_stat_typ, rtng_eff_tms, data_src_id)&#13;
select new_oid(), dd.instr_id, now(), 'CalculateJBISandCAR-ISSR', now(), rtvl2.rtng_cde, rtvl2.rtng_cde, rtvl2.rtng_value_oid, 'RTNG000008', 'DERIVED', 'ACTIVE',DATE_TRUNC('day', now()), dd.data_src_id&#13;
from &#13;
   (select distinct  &#13;
      --RDD-268 start&#13;
      --irrt.instr_issr_id&#13;
      issu.instr_issr_id&#13;
      --RDD-268 end&#13;
      ,drvl.rank_num&#13;
      ,issu.instr_id&#13;
      ,rtng.data_src_id&#13;
      ,rank() over (partition by issu.instr_id order by drvl.rank_num desc, firt.last_chg_tms desc, rtng.data_src_id desc) rank&#13;
   --RDD-268 start&#13;
   --from ft_t_irrt irrt, ft_t_rtvl rtvl, ft_t_rtvl drvl, ft_t_rtng rtng,ft_t_issu issu&#13;
   from ft_t_frip frip, ft_t_firt firt, ft_t_rtvl rtvl, ft_t_rtvl drvl, ft_t_rtng rtng, ft_t_issu issu&#13;
   --RDD-268 end&#13;
   where rtvl.rtng_value_oid = firt.rtng_value_oid &#13;
   and firt.rtng_cde = rtvl.rtng_cde&#13;
   and firt.rtng_set_oid = rtvl.rtng_set_oid&#13;
   and rtng.rtng_set_oid=firt.rtng_set_oid&#13;
   and rtng.start_tms &lt;= now() and (rtng.end_tms is null or rtng.end_tms &gt; now()) &#13;
   and drvl.rtng_cde = rtvl.rtng_cde &#13;
   and trim(drvl.rtng_set_oid) = (case  &#13;
      when rtng.data_src_id like 'MOODYS%' then rtng.rtng_set_oid&#13;
      when rtng.data_src_id = 'FITCH' then rtng.rtng_set_oid&#13;
      when rtng.data_src_id like ('S_P%') then rtng.rtng_set_oid&#13;
      when rtng.data_src_id = 'JCR' then rtng.rtng_set_oid&#13;
      end)&#13;
   --RDD-268 start&#13;
   --and irrt.instr_issr_id = 'J&gt;w%w&gt;gjG1'&#13;
   --and irrt.instr_issr_id = issu.instr_issr_id&#13;
   and issu.instr_issr_id = ?&#13;
   and firt.inst_mnem = frip.inst_mnem&#13;
   and frip.instr_id = issu.instr_id&#13;
   --RDD-268 end&#13;
   and coalesce(firt.rtng_purp_typ ,'x') != 'PSTANDRD'&#13;
   and issu.start_tms &lt;= now() and (issu.end_tms is null or issu.end_tms &gt; now())&#13;
   and firt.rtng_eff_tms &lt;= now() and (firt.sys_eff_end_tms is null or firt.sys_eff_end_tms &gt; now())&#13;
   and rtvl.start_tms &lt;= now() and (rtvl.end_tms is null or rtvl.end_tms &gt; now())&#13;
   and drvl.start_tms &lt;= now() and (drvl.end_tms is null or drvl.end_tms &gt; now())&#13;
   AND EXISTS &#13;
      (SELECT 1 &#13;
      FROM FT_T_ISTY ISTY &#13;
      WHERE ISTY.ISS_TYP = ISSU.ISS_TYP &#13;
      AND ISTY.PRNT_ISS_TYP = 'DEBT'&#13;
      AND ISTY.START_TMS &lt;=now() AND (ISTY.END_TMS IS NULL OR ISTY.END_TMS &gt; now()))&#13;
   and exists &#13;
      (select 1 &#13;
      from ft_t_isgp isgp &#13;
      where isgp.instr_id = issu.instr_id &#13;
      and isgp.prt_purp_typ = 'PRTFLIOC' and isgp.prnt_iss_grp_oid != 'ISGR000011' &#13;
      and isgp.start_tms &lt;= now() and (isgp.end_tms is null or isgp.end_tms &gt; now()))&#13;
   and firt.data_stat_typ = 'ACTIVE')dd&#13;
   ,ft_t_rtvl rtvl2&#13;
where rank=1&#13;
and rtng_set_oid = 'RTNG000008' &#13;
and rtvl2.rank_num = dd.rank_num  &#13;
and rtvl2.start_tms &lt;= now() and (rtvl2.end_tms is null or rtvl2.end_tms &gt; now())&#13;
and not exists &#13;
   (select 1 &#13;
   from ft_t_isrt isrt &#13;
   where isrt.instr_id = dd.instr_id&#13;
   and isrt.rtng_set_oid = 'RTNG000008' &#13;
   and isrt.orig_data_prov_id = 'DERIVED')</objectValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="41" type="java.util.HashSet">
<item id="42" type="com.j2fe.workflow.definition.Transition">
<name id="43">goto-next</name>
<source id="44">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="45"/>
<directJoin>false</directJoin>
<name id="46">Insert JBIS from Issue</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="47">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="48" type="java.util.HashSet">
<item id="49" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="50">database</name>
<stringValue id="51">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="52" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="53">indexedParameters[0]</name>
<stringValue id="54">Issuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="55" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="56">querySQL</name>
<objectValue id="57" type="java.lang.String">insert into ft_t_isrt (ISS_RTNG_OID, INSTR_ID, START_TMS, LAST_CHG_USR_ID, LAST_CHG_TMS, RTNG_CDE, RTNG_SYMBOL_TXT, RTNG_VALUE_OID, RTNG_SET_OID, orig_data_prov_id, data_stat_typ, rtng_eff_tms, data_src_id)
select  new_oid(), dd.instr_id, now(), 'CalculateJBISandCAR-ISSU', now(), rtvl2.rtng_cde, rtvl2.rtng_cde, rtvl2.rtng_value_oid, 'RTNG000007', 'DERIVED', 'ACTIVE',(DATE_TRUNC('day', now())), dd.data_src_id
from(
select distinct rtng_cde, instr_id, rank_num, data_src_id, rank() over (
partition by instr_id order by rank desc) rank2 from
(select * from (select isrt.rtng_cde, min(isrt.last_chg_tms) last_chg_tms, isrt.rtng_set_oid, isrt.rtng_value_oid, isrt.orig_data_prov_id, isrt.instr_id, rtvl.rank_num,rtng.data_src_id,
rank() over (
partition by isrt.instr_id
order by
rtvl.rank_num, min(isrt.last_chg_tms), rtng.data_src_id desc) rank
from ft_t_isrt isrt, ft_t_issu issu, ft_t_rtvl drtvl,ft_t_rtng rtng,
ft_t_rtvl rtvl where rtvl.rtng_cde = isrt.rtng_cde
and rtng.rtng_set_oid=isrt.rtng_set_oid
and rtng.start_tms &lt;= now() and (rtng.end_tms is null or rtng.end_tms &gt; now()) 
and isrt.rtng_value_oid = drtvl.rtng_value_oid
and trim(rtvl.rtng_set_oid) = (
case when rtng.data_src_id like 'MOODYS%' then rtng.rtng_set_oid
        when rtng.data_src_id = 'FITCH' then rtng.rtng_set_oid
        when rtng.data_src_id like ('S_P%') then rtng.rtng_set_oid
        when rtng.data_src_id = 'JCR' then rtng.rtng_set_oid
end)
and issu.instr_issr_id = ?
and isrt.instr_id = issu.instr_id
and issu.start_tms &lt;= now() and (issu.end_tms is null or issu.end_tms &gt; now())
and now() between isrt.rtng_eff_tms and coalesce(isrt.sys_eff_end_tms, now()+ INTERVAL '1 day')
AND EXISTS (SELECT 1 FROM FT_T_ISTY ISTY WHERE ISTY.ISS_TYP = ISSU.ISS_TYP AND ISTY.PRNT_ISS_TYP = 'DEBT'
AND ISTY.START_TMS &lt;=now() AND (ISTY.END_TMS IS NULL OR ISTY.END_TMS &gt; now()))
and isrt.data_src_id is not null
and exists (select 1 from ft_t_isgp isgp where isgp.instr_id = issu.instr_id and isgp.prt_purp_typ = 'PRTFLIOC' and isgp.prnt_iss_grp_oid != 'ISGR000011' 
and isgp.start_tms &lt;= now() and (isgp.end_tms is null or isgp.end_tms &gt; now()))
and coalesce(isrt.orig_data_prov_id,'x') not in ( 'DERIVED')
and coalesce(isrt.rtng_purp_typ,'x') != 'PSTANDRD'
and isrt.data_stat_typ != 'INACTIVE'
group by isrt.rtng_cde, isrt.rtng_set_oid, isrt.rtng_value_oid, isrt.orig_data_prov_id, isrt.instr_id, rtvl.rank_num,rtng.data_src_id)dd where 
dd.rank in (1,2))aa)dd, ft_t_rtvl rtvl2
where rank2=1
and rtng_set_oid = 'RTNG000007' and rtvl2.rank_num = dd.rank_num  and rtvl2.start_tms &lt;= now() and (rtvl2.end_tms is null or rtvl2.end_tms &gt; now())
and not exists (select 1 from ft_t_isrt isrt where isrt.instr_id = dd.instr_id
and isrt.rtng_set_oid = 'RTNG000007' and isrt.orig_data_prov_id = 'DERIVED'
and (isrt.sys_eff_end_tms is null or isrt.sys_eff_end_tms &gt; now()))</objectValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="58" type="java.util.HashSet">
<item id="59" type="com.j2fe.workflow.definition.Transition">
<name id="60">goto-next</name>
<source id="61">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="62"/>
<directJoin>false</directJoin>
<name id="63">Delete Existing JBIS</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="64">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="65" type="java.util.HashSet">
<item id="66" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="67">database</name>
<stringValue id="68">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="69" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="70">indexedParameters[0]</name>
<stringValue id="71">Issuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="72" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="73">querySQL</name>
<objectValue id="74" type="java.lang.String">DELETE  FROM ft_t_isrt o
WHERE o.rtng_set_oid = 'RTNG000007'
  AND o.instr_id IN (
    SELECT cr.instr_id
    FROM (
      SELECT dd.instr_id,
             (
               SELECT i.rtng_cde
               FROM ft_t_isrt i
               WHERE i.instr_id = dd.instr_id
                 AND i.rtng_set_oid = 'RTNG000007'
                 AND i.start_tms &lt;= now()
                 AND (i.end_tms IS NULL OR i.end_tms &gt; now())
               ORDER BY i.last_chg_tms DESC  
               LIMIT 1
             ) AS current_rating,
             rtvl2.rtng_cde
      FROM (
        SELECT DISTINCT rtng_cde,
                        instr_id,
                        rank_num,
                        data_src_id,
                        RANK() OVER (PARTITION BY instr_id ORDER BY rank DESC) AS rank2
        FROM (
          SELECT isrt.rtng_cde,
                 MIN(isrt.last_chg_tms) AS last_chg_tms,
                 isrt.rtng_set_oid,
                 isrt.rtng_value_oid,
                 isrt.orig_data_prov_id,
                 isrt.instr_id,
                 rtvl.rank_num,
                 rtng.data_src_id,
                 RANK() OVER (
                   PARTITION BY isrt.instr_id
                   ORDER BY rtvl.rank_num, MIN(isrt.last_chg_tms), rtng.data_src_id DESC
                 ) AS rank
          FROM ft_t_isrt isrt
          JOIN ft_t_issu issu ON isrt.instr_id = issu.instr_id
          JOIN ft_t_rtvl drtvl ON isrt.rtng_value_oid = drtvl.rtng_value_oid
          JOIN ft_t_rtng rtng ON rtng.rtng_set_oid = isrt.rtng_set_oid
          JOIN ft_t_rtvl rtvl ON rtvl.rtng_cde = isrt.rtng_cde
          WHERE rtng.start_tms &lt;= now()
            AND (rtng.end_tms IS NULL OR rtng.end_tms &gt; now())
            AND issu.instr_issr_id = ?
            AND issu.start_tms &lt;= now()
            AND (issu.end_tms IS NULL OR issu.end_tms &gt; now())
            AND now() BETWEEN isrt.rtng_eff_tms AND COALESCE(isrt.sys_eff_end_tms, now() + INTERVAL '1 day')
            AND EXISTS (
              SELECT 1 FROM ft_t_isty isty
              WHERE isty.iss_typ = issu.iss_typ
                AND isty.prnt_iss_typ = 'DEBT'
                AND isty.start_tms &lt;= now()
                AND (isty.end_tms IS NULL OR isty.end_tms &gt; now())
            )
            AND isrt.data_src_id IS NOT NULL
            AND EXISTS (
              SELECT 1 FROM ft_t_isgp isgp
              WHERE isgp.instr_id = issu.instr_id
                AND isgp.prt_purp_typ = 'PRTFLIOC'
                AND isgp.prnt_iss_grp_oid != 'ISGR000011'
                AND isgp.start_tms &lt;= now()
                AND (isgp.end_tms IS NULL OR isgp.end_tms &gt; now())
            )
            AND COALESCE(isrt.orig_data_prov_id, 'x') NOT IN ('DERIVED')
            AND COALESCE(isrt.rtng_purp_typ, 'x') != 'PSTANDRD'
            AND isrt.data_stat_typ != 'INACTIVE'
          GROUP BY isrt.rtng_cde,
                   isrt.rtng_set_oid,
                   isrt.rtng_value_oid,
                   isrt.orig_data_prov_id,
                   isrt.instr_id,
                   rtvl.rank_num,
                   rtng.data_src_id
        ) dd
        WHERE dd.rank IN (1, 2)
      ) dd
      JOIN ft_t_rtvl rtvl2 ON rtvl2.rank_num = dd.rank_num
      WHERE rank2 = 1
        AND rtng_set_oid = 'RTNG000007'
        AND rtvl2.start_tms &lt;= now()
        AND (rtvl2.end_tms IS NULL OR rtvl2.end_tms &gt; now())
    ) cr
    WHERE cr.current_rating IS NULL OR cr.current_rating != cr.rtng_cde
  )</objectValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="75" type="java.util.HashSet">
<item id="76" type="com.j2fe.workflow.definition.Transition">
<name id="77">goto-next</name>
<source id="78">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="79"/>
<directJoin>false</directJoin>
<name id="80">Insert CAR from Issue</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="81">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="82" type="java.util.HashSet">
<item id="83" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="84">database</name>
<stringValue id="85">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="86" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="87">indexedParameters[0]</name>
<stringValue id="88">Issuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="89" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="90">querySQL</name>
<objectValue id="91" type="java.lang.String">insert into ft_t_isrt (ISS_RTNG_OID, INSTR_ID, START_TMS, LAST_CHG_USR_ID, LAST_CHG_TMS, RTNG_CDE, RTNG_SYMBOL_TXT, RTNG_VALUE_OID, RTNG_SET_OID, orig_data_prov_id, data_stat_typ, rtng_eff_tms, data_src_id)
select new_oid(), dd.instr_id, now(), 'CalculateJBISandCAR-ISSU', now(), rtvl2.rtng_cde, rtvl2.rtng_cde, rtvl2.rtng_value_oid, 'RTNG000008', 'DERIVED', 'ACTIVE',(DATE_TRUNC('day', now())), dd.data_src_id
from 
(
select distinct isrt.instr_id, rtvl.rank_num,rtng.data_src_id,
rank() over (
partition by isrt.instr_id
order by
rtvl.rank_num desc, isrt.last_chg_tms desc, isrt.data_src_id desc) rank
from ft_t_isrt isrt, ft_t_issu issu, ft_t_rtvl drtvl,ft_t_rtng rtng,
ft_t_rtvl rtvl where rtvl.rtng_cde = isrt.rtng_cde
and rtng.rtng_set_oid=isrt.rtng_set_oid
and rtng.start_tms &lt;= now() and (rtng.end_tms is null or rtng.end_tms &gt; now()) 
and isrt.rtng_value_oid = drtvl.rtng_value_oid
and trim(rtvl.rtng_set_oid) = (
case when rtng.data_src_id like 'MOODYS%' then rtng.rtng_set_oid
        when rtng.data_src_id = 'FITCH' then rtng.rtng_set_oid
        when rtng.data_src_id like ('S_P%') then rtng.rtng_set_oid
        when rtng.data_src_id = 'JCR' then rtng.rtng_set_oid
end) 
and issu.instr_issr_id = ?
and isrt.instr_id = issu.instr_id
and issu.start_tms &lt;= now() and (issu.end_tms is null or issu.end_tms &gt; now())
and now() between isrt.rtng_eff_tms and coalesce(isrt.sys_eff_end_tms, now()+ Interval '1 day')
AND EXISTS (SELECT 1 FROM FT_T_ISTY ISTY WHERE ISTY.ISS_TYP = ISSU.ISS_TYP AND ISTY.PRNT_ISS_TYP = 'DEBT'
AND ISTY.START_TMS &lt;=now() AND (ISTY.END_TMS IS NULL OR ISTY.END_TMS &gt; now()))
and isrt.data_src_id is not null
and exists (select 1 from ft_t_isgp isgp where isgp.instr_id = issu.instr_id and isgp.prt_purp_typ = 'PRTFLIOC' and isgp.prnt_iss_grp_oid != 'ISGR000011' 
and isgp.start_tms &lt;= now() and (isgp.end_tms is null or isgp.end_tms &gt; now()))
and coalesce(isrt.orig_data_prov_id,'x') not in ( 'DERIVED')
and coalesce(isrt.rtng_purp_typ,'x') != 'PSTANDRD'
and isrt.data_stat_typ != 'INACTIVE')dd
, ft_t_rtvl rtvl2
where rank=1 
and rtng_set_oid = 'RTNG000008' and rtvl2.rank_num = dd.rank_num  and rtvl2.start_tms &lt;= now() and (rtvl2.end_tms is null or rtvl2.end_tms &gt; now())
and not exists (select 1 from ft_t_isrt isrt where isrt.instr_id = dd.instr_id
and isrt.rtng_set_oid = 'RTNG000008' and isrt.orig_data_prov_id = 'DERIVED'
and (isrt.sys_eff_end_tms is null or isrt.sys_eff_end_tms &gt; now()))</objectValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="92" type="java.util.HashSet">
<item id="93" type="com.j2fe.workflow.definition.Transition">
<name id="94">goto-next</name>
<source id="95">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="96"/>
<directJoin>false</directJoin>
<name id="97">Delete Existing CAR</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="98">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="99" type="java.util.HashSet">
<item id="100" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="101">database</name>
<stringValue id="102">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="103" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="104">indexedParameters[0]</name>
<stringValue id="105">Issuer</stringValue>
<type>VARIABLE</type>
</item>
<item id="106" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="107">querySQL</name>
<objectValue id="108" type="java.lang.String">delete from ft_t_isrt o where&#13;
o.RTNG_SET_OID = 'RTNG000008' and&#13;
o.instr_id in &#13;
(select cr.instr_id from (&#13;
select dd.instr_id,&#13;
(select i.rtng_cde from FT_T_ISRT i where i.instr_id  = dd.instr_id and i.RTNG_SET_OID  = 'RTNG000008'&#13;
  and i.start_tms &lt;= now() and (i.end_tms is null or i.end_tms &gt; now()) limit 1) current_rating, &#13;
rtvl2.rtng_cde&#13;
from &#13;
(&#13;
select distinct isrt.instr_id, rtvl.rank_num,rtng.data_src_id,&#13;
rank() over (&#13;
partition by isrt.instr_id&#13;
order by&#13;
rtvl.rank_num desc, isrt.last_chg_tms desc, isrt.data_src_id desc) rank&#13;
from ft_t_isrt isrt, ft_t_issu issu, ft_t_rtvl drtvl,ft_t_rtng rtng,&#13;
ft_t_rtvl rtvl where rtvl.rtng_cde = isrt.rtng_cde&#13;
and rtng.rtng_set_oid=isrt.rtng_set_oid&#13;
and rtng.start_tms &lt;= now() and (rtng.end_tms is null or rtng.end_tms &gt; now()) &#13;
and isrt.rtng_value_oid = drtvl.rtng_value_oid&#13;
and trim(rtvl.rtng_set_oid) = (&#13;
case when rtng.data_src_id like 'MOODYS%' then rtng.rtng_set_oid&#13;
        when rtng.data_src_id = 'FITCH' then rtng.rtng_set_oid&#13;
        when rtng.data_src_id like ('S_P%') then rtng.rtng_set_oid&#13;
        when rtng.data_src_id = 'JCR' then rtng.rtng_set_oid&#13;
end) &#13;
and issu.instr_issr_id = ?&#13;
and isrt.instr_id = issu.instr_id&#13;
and issu.start_tms &lt;= now() and (issu.end_tms is null or issu.end_tms &gt; now())&#13;
and now() between isrt.rtng_eff_tms and coalesce(isrt.sys_eff_end_tms, now()+ interval '1 day')&#13;
AND EXISTS (SELECT 1 FROM FT_T_ISTY ISTY WHERE ISTY.ISS_TYP = ISSU.ISS_TYP AND ISTY.PRNT_ISS_TYP = 'DEBT'&#13;
AND ISTY.START_TMS &lt;=now() AND (ISTY.END_TMS IS NULL OR ISTY.END_TMS &gt; now()))&#13;
and isrt.data_src_id is not null&#13;
and exists (select 1 from ft_t_isgp isgp where isgp.instr_id = issu.instr_id and isgp.prt_purp_typ = 'PRTFLIOC' and isgp.prnt_iss_grp_oid != 'ISGR000011' &#13;
and isgp.start_tms &lt;= now() and (isgp.end_tms is null or isgp.end_tms &gt; now()))&#13;
and coalesce(isrt.orig_data_prov_id,'x') not in ( 'DERIVED')&#13;
and coalesce(isrt.rtng_purp_typ,'x') != 'PSTANDRD'&#13;
and isrt.data_stat_typ != 'INACTIVE')dd&#13;
, ft_t_rtvl rtvl2&#13;
where rank=1 &#13;
and rtng_set_oid = 'RTNG000008' and rtvl2.rank_num = dd.rank_num  and rtvl2.start_tms &lt;= now() and (rtvl2.end_tms is null or rtvl2.end_tms &gt; now())&#13;
) cr&#13;
where cr.current_rating != cr.rtng_cde or cr.current_rating is null)</objectValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="109" type="java.util.HashSet">
<item id="110" type="com.j2fe.workflow.definition.Transition">
<name id="111">goto-next</name>
<source id="112">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="113"/>
<directJoin>false</directJoin>
<name id="114">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="115">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="116" type="java.util.HashSet"/>
<targets id="117" type="java.util.HashSet">
<item idref="110" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="95"/>
</item>
</sources>
<targets id="118" type="java.util.HashSet">
<item idref="93" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="78"/>
</item>
</sources>
<targets id="119" type="java.util.HashSet">
<item idref="76" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="61"/>
</item>
</sources>
<targets id="120" type="java.util.HashSet">
<item idref="59" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="44"/>
</item>
</sources>
<targets id="121" type="java.util.HashSet">
<item idref="42" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="27"/>
</item>
</sources>
<targets id="122" type="java.util.HashSet">
<item idref="25" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="10"/>
</item>
</sources>
<targets id="123" type="java.util.HashSet">
<item idref="8" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="3"/>
</item>
</sources>
<targets id="124" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="125">Mizuho/Ratings</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="126">user1</lastChangeUser>
<lastUpdate id="127">2025-11-19T22:36:39.000+0000</lastUpdate>
<name id="128">CalculateJBISandCAR</name>
<nodes id="129" type="java.util.HashSet">
<item idref="95" type="com.j2fe.workflow.definition.Node"/>
<item idref="61" type="com.j2fe.workflow.definition.Node"/>
<item idref="27" type="com.j2fe.workflow.definition.Node"/>
<item idref="10" type="com.j2fe.workflow.definition.Node"/>
<item idref="78" type="com.j2fe.workflow.definition.Node"/>
<item idref="44" type="com.j2fe.workflow.definition.Node"/>
<item idref="112" type="com.j2fe.workflow.definition.Node"/>
<item idref="3" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>true</optimize>
<parameter id="130" type="java.util.HashMap">
<entry>
<key id="131" type="java.lang.String">Issuer</key>
<value id="132" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="133">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
</parameter>
<permissions id="134" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>false</purgeAtEnd>
<retries>0</retries>
<startNode idref="112"/>
<status>RELEASED</status>
<variables id="135" type="java.util.HashMap">
<entry>
<key id="136" type="java.lang.String">Issuer</key>
<value id="137" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="138">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
</variables>
<version>23</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
