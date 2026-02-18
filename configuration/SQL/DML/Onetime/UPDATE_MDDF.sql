UPDATE FT_T_MDDF SET modl_schema = '<?xml version="1.0" encoding="UTF-8"?>
<model xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="../../schemas/Model.xsd" id="ADRGDR" extends="EQUITY" headerInfoXPath="concat(%modelPath:BASEISSU:ft_t_issu.pref_iss_nme%,'' - '',%modelPath:BASEISSU:ft_t_issu.pref_id_ctxt_typ% ,''-'',%modelPath:BASEISSU:ft_t_issu.pref_iss_id%)" minLevelToEnableChangeApproval="2">  
  <occurrence extends="BASEISSU" id="BASEISSU" table="ft_t_issu" level="1" label="Issue Description/Issue Details"> 
    <inputFields> 
      <field name="ft_t_issu.iss_tms" label="Instrument Date"/>  
    <field name="ft_t_issu.end_tms"/><field name="ft_t_issu.when_issued_ind" label="When Issued"/><field name="ft_t_issu.iss_actvy_stat_typ" label="Instrument Status" level="1"/><field name="ft_t_issu.iss_typ" label="Instrument Type" level="1"/><field name="ft_t_issu.nom_val_unit_camt" label="Par Value"/><field name="ft_t_issu.start_tms"/><field name="ft_t_issu.distribution_curr_cde" label="Settlement Currency"/><field name="ft_t_issu.denom_curr_cde" label="Par Value Currency" level="2"/><field name="ft_t_issu.instr_issr_id" level="2"/><field name="ft_t_eqst.stats_curr_cde"/><field name="ft_t_issu.sec_form_typ"/><field name="ft_t_issu.cl_typ"/></inputFields>    
  <validationRules> 
      <!--<rule id="ID_CONTEXT_TYPE" pageName="SpeedScreen">
				<xPath value="boolean((count(%modelPath:ISID_Global%[isid.id_ctxt_typ[@status != ''deleted'' or string-length(@status) = 0]=/root/issue/issu.pref_id_ctxt_typ]) > 0) or /root/issue/@status=''new'')"/>				
        <errorMessage value="Preferred Id Context Type needs to be same or present in the Issue Identifiers Screen."/>        
			</rule>-->  
      <rule id="ValidationISID"> 
        <xPath value="boolean((count(/root/issueidentifiers/identifier[@status!=''deleted'' or string-length(@status)=0]) > 0)  or (/root/issue[@status!=''new'' or  string-length(@status)=0]))"/>  
        <errorMessage value="At least one Instrument Level Identifier has to be entered."/> 
      </rule>  
      <rule id="ValidationISID_ACTIVITYSTATUS"> 
        <xPath value="boolean((count(/root/issueidentifiers/identifier[@status!=''deleted'' or string-length(@status)=0]) > 0 or string(/root/issue/issu.iss_actvy_stat_typ)=''INACTIVE'')  or (/root/issue[@status=''new'' or  string-length(@status)!=0]))"/>  
        <errorMessage value="User has either to mark the Issue activity status(Instrument Status)  as inactive or have at least one identifier active."/> 
      </rule>  
      <rule id="EQST_Dividend" pageName="Dividends"> 
        <xPath value="boolean(string-length(%modelPath:BASEISSU:ft_t_eqst.stats_curr_cde%) = 0 or (/root/issue/ft_t_eqst.stats_curr_cde[not(@status)]) or (string-length(%modelPath:BASEISSU:ft_t_eqst.stats_curr_cde%) > 0 and ( string-length(%modelPath:EQST:ft_t_eqst.grs_dps_12m_crte%) > 0 or  string-length(%modelPath:EQST:ft_t_eqst.div_ex_today_ind%) > 0 or string-length(%modelPath:EQST:ft_t_eqst.split_ratio_crte%) > 0 or string-length(%modelPath:EQST:ft_t_eqst.split_tms%) > 0 or string-length(%modelPath:EQST:ft_t_eqst.net_dps_12m_crte%) > 0 ) ) )"/>  
        <errorMessage value="At least Dividend Per Share 12 Month (Gross) or Dividend Per Share 12 Month (Net) or Currently Ex-Dividend or Equity Split Ratio or Equity Split Date has to be entered."/> 
      </rule> 
    <rule id="MultiplePrimaryMarkets" pageName="Market"> 
        <xPath value="boolean(count(%modelPath:MKISDEFBISSU%[(string-length(mkis.end_tms) = 0) and (mkis.prim_trd_mkt_ind = ''Y'')]) < 2)"/>  
        <errorMessage value="There should not be multiple primary markets for a single issue."/> 
      </rule></validationRules><defaultFields> 
      <field name="ft_t_issu.access_auth_typ" dataType="STRING" value="PUBLIC"/>  
      <field name="ft_t_issu.iss_actvy_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_issu.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
    </defaultFields></occurrence> 
  <occurrence table="ft_t_ridf" id="RIDF" parentId="BASEISSU" label="Related Issue Definition"> 
    <defaultFields> 
      <field name="ft_t_ridf.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_ridf.rel_typ" dataType="STRING" value="CERTDPST"/> 
    </where> 
  </occurrence>  
  <occurrence table="ft_t_rist" id="RIST" parentId="BASEISSU" label="Related Issue Statistics"> 
    <defaultFields> 
      <field name="ft_t_rist.stats_eff_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_rist.adr_shr_crte" label="Depository Receipt Per Share"/> 
      <field name="ft_t_rist.shr_adr_crte" label="Shares per Depository Receipt"/>
    </inputFields> 
  </occurrence>  
  <occurrence table="ft_t_riss" id="RISS" parentId="RIDF" label="Related Issue"> 
    <inputFields> 
      <field name="ft_t_riss.ev_part_camt" label="Shares per Depository Receipt"/>  
      <field name="ft_t_riss.instr_id" label="Underlying Instrument Name"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_riss.part_units_typ" dataType="STRING" value="ALL"/> 
    </defaultFields>  
    <where>
      <field name="ft_t_riss.iss_part_rl_typ" dataType="STRING" value="UNDLYING"/>
    </where>
  </occurrence> 
  <!-- added to hide futures characteristics screen -->	
  <presentation> 
    <until level="100"> 
	  <override class="fech" rendered="false"/> 
	  <override class="epst" rendered="false"/> 
    <override class="fech" rendered="false"/></until> 
  </presentation> 
<occurrence table="ft_t_isst" id="ISST_EQOPTYN" parentId="BASEISSU" label="Issue Statistics" autoDelete="false"> 
    <where> 
      <field name="ft_t_isst.stat_def_id" dataType="STRING" value="EQOPTYN"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_isst.stat_def_id" dataType="STRING" valueOf="ft_t_stdf.stat_def_id"> 
        <where> 
          <field name="ft_t_stdf.stat_def_id" dataType="STRING" value="EQOPTYN"/> 
        </where> 
      </field>  
      <field name="ft_t_isst.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_isst.stat_char_val_txt" label="Listed Options"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_isst" id="ISST_MICLOCEX" parentId="BASEISSU" label="Issue Statistics" autoDelete="false"> 
    <where> 
      <field name="ft_t_isst.stat_def_id" dataType="STRING" value="MICLOCEX"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_isst.stat_def_id" dataType="STRING" valueOf="ft_t_stdf.stat_def_id"> 
        <where> 
          <field name="ft_t_stdf.stat_def_id" dataType="STRING" value="MICLOCEX"/> 
        </where> 
      </field>  
      <field name="ft_t_isst.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_isst.stat_char_val_txt" label="MIC"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_isst" id="ISST_PREEURCR" parentId="BASEISSU" label="Issue Statistics" autoDelete="false"> 
    <defaultFields> 
      <field name="ft_t_isst.stat_def_id" dataType="STRING" valueOf="ft_t_stdf.stat_def_id"> 
        <where> 
          <field name="ft_t_stdf.stat_def_id" dataType="STRING" value="PREEURCR"/> 
        </where> 
      </field>  
      <field name="ft_t_isst.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_isst.stat_def_id" dataType="STRING" value="PREEURCR"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_isst.stat_char_val_txt" label="Pre Redenomination Currency"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_isst" id="ISST_PSTEURCR" parentId="BASEISSU" label="Issue Statistics" autoDelete="false"> 
    <where> 
      <field name="ft_t_isst.stat_def_id" dataType="STRING" value="PSTEURCR"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_isst.stat_def_id" dataType="STRING" valueOf="ft_t_stdf.stat_def_id"> 
        <where> 
          <field name="ft_t_stdf.stat_def_id" dataType="STRING" value="PSTEURCR"/> 
        </where> 
      </field>  
      <field name="ft_t_isst.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_isst.stat_char_val_txt" label="Post Redenomination Currency"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_isst" id="ISST_PREEURPR" parentId="BASEISSU" label="Issue Statistics" autoDelete="false"> 
    <where> 
      <field name="ft_t_isst.stat_def_id" dataType="STRING" value="PREEURPR"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_isst.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_isst.stat_def_id" dataType="STRING" valueOf="ft_t_stdf.stat_def_id"> 
        <where> 
          <field name="ft_t_stdf.stat_def_id" dataType="STRING" value="PREEURPR"/> 
        </where> 
      </field> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_isst.stat_val_camt" label="Pre Euro Redenom Par Amount"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_isst" id="ISST_POSEURPR" parentId="BASEISSU" label="Issue Statistics" autoDelete="false"> 
    <where> 
      <field name="ft_t_isst.stat_def_id" dataType="STRING" value="POSEURPR"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_isst.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_isst.stat_def_id" dataType="STRING" valueOf="ft_t_stdf.stat_def_id"> 
        <where> 
          <field name="ft_t_stdf.stat_def_id" dataType="STRING" value="POSEURPR"/> 
        </where> 
      </field> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_isst.stat_val_camt" label="Post  Euro Redenom Par Amount"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_isst" id="ISST_SHROUTOT" parentId="BASEISSU" label="Issue Statistics" autoDelete="false"> 
    <where> 
      <field name="ft_t_isst.stat_def_id" dataType="STRING" value="SHROUTOT"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_isst.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_isst.stat_def_id" dataType="STRING" valueOf="ft_t_stdf.stat_def_id"> 
        <where> 
          <field name="ft_t_stdf.stat_def_id" dataType="STRING" value="SHROUTOT"/> 
        </where> 
      </field> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_isst.stat_val_camt" label="Shares outstanding-All Classes"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_eqch" id="EQCH" parentId="BASEISSU" label="Equity Characteristics" autoDelete="false"> 
    <inputFields> 
      <field name="ft_t_eqch.rednm_tms"/>  
      <field name="ft_t_eqch.rednm_meth_typ"/>  
      <field name="ft_t_eqch.rednm_rnd_meth_typ"/>  
      <field name="ft_t_eqch.div_fq_qty"/>  
      <field name="ft_t_eqch.div_fq_dy_typ"/>  
      <field name="ft_t_eqch.div_fq_sp_typ" label="Frequency"/>  
      <field name="ft_t_eqch.annual_dividend_curr_cde" label="Nominal Currency"/>  
      <field name="ft_t_eqch.div_rights_typ" label="Dividend Rights"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_eqst" id="EQST" parentId="BASEISSU" label="Equity Statistics" multiple="false" autoCreate="false" autoDelete="false"> 
    <where> 
      <field name="ft_t_eqst.stats_curr_cde" dataType="STRING" srcOccurrence="BASEISSU" valueOf="ft_t_eqst.stats_curr_cde"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_eqst.stats_eff_tms" valueOf="ft_t_issu.start_tms" srcOccurrence="BASEISSU" dataType="DATETIME"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_eqst.voting_rights_crte"/>  
      <field name="ft_t_eqst.shr_outst_cqty" label="Shares Outstanding"/>  
      <field name="ft_t_eqst.div_ex_today_ind" label="Currently Ex-Dividend"/>  
      <field name="ft_t_eqst.split_tms" label="Equity Split Date"/>  
      <field name="ft_t_eqst.split_ratio_crte" label="Equity Split Ratio"/>  
      <field name="ft_t_eqst.grs_dps_12m_crte" label="Dividend Per Share 12 Month (Gross)"/>  
      <field name="ft_t_eqst.net_dps_12m_crte" label="Dividend Per Share 12 Month (Net)"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_eqst" id="EQST_TABLE" parentId="BASEISSU" label="Equity Statistics" multiple="true"> 
    <inputFields> 
      <field name="ft_t_eqst.div_paid_tms" label="Pay Date"/>  
      <field name="ft_t_eqst.last_div_paid_typ" label="Dividend Type"/>  
      <field name="ft_t_eqst.grs_dps_crte" label="Div Per Share (Gross)"/>  
      <field name="ft_t_eqst.franked_div_cpct" label="Tax Credit"/>  
      <field name="ft_t_eqst.net_dps_crte" label="Div Per Share (Net)"/>  
      <field name="ft_t_eqst.div_declared_tms" label="Announcement Date"/>  
      <field name="ft_t_eqst.div_rcdt_tms" label="Record Date"/>  
      <field name="ft_t_eqst.div_ex_tms" label="Ex-Dividend Date"/>  
      <field name="ft_t_eqst.data_stat_typ" label="Additional Circumstances"/>  
      <field name="ft_t_eqst.mkt_oid" label="Market Name"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_eqst.stats_eff_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_isid" id="ISID_MIC_PUB" parentId="MIXRBISSU" label="Issue Identifier" dbConstraint="MIXRISIDPUB"> 
    <where> 
      <field name="ft_t_isid.id_ctxt_typ" dataType="STRING" value="MIC"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_isid.iss_id" label="MIC"/> 
    </inputFields>  
    <defaultFields>   
      <field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_isid.mkt_oid" dataType="STRING" srcOccurrence="MKISDEFBISSU" valueOf="ft_t_mkis.mkt_oid"/> 
    </defaultFields> 
  </occurrence><occurrence extends="MKISPMBISSU" table="ft_t_mkis" id="MKISPMBISSU" parentId="BASEISSU" multiple="false" label="Market Details"> 
    <inputFields> 
      <field name="ft_t_mkis.mkt_oid" label="Primary Exchange Name"/>  
      <field name="ft_t_mkis.norm_mkt_sz_cqty" label="Quote Lot Size"/>  
      <field name="ft_t_mkis.trdng_stat_typ" label="Market Status"/>  
      <field name="ft_t_mkis.actively_traded_ind"/> 
    <field name="ft_t_mkis.iss_prc_ut_camt"/><field name="ft_t_mkis.rnd_lot_sz_cqty"/><field name="ft_t_mkis.trdng_curr_cde"/></inputFields> 
  <validationRules> 
      <rule id="Warning" messageType="WARNING"> 
        <xPath value="boolean(string-length(%modelPath:MKISPMBISSU:ft_t_mkis.end_tms%)= 0 or string-length(%modelPath:MKISPMBISSU:ft_t_mkis.end_tms%) < ''SYSDATE()'')"/>  
        <errorMessage value="Primary Market is end dated"/> 
      </rule> 
    </validationRules><where> 
      <field name="ft_t_mkis.prim_trd_mkt_ind" dataType="STRING" value="Y"/> 
    </where><defaultFields> 
      <!--<field name="ft_t_mkis.trdng_stat_typ" dataType="STRING" value="ACTIVE"/>  
      -->  
      <field name="ft_t_mkis.prc_ut_meas_typ" dataType="STRING" value="NOMINAL"/>  
      <!--<field name="ft_t_mkis.mkt_iss_oid" dataType="STRING" valueOfFunction="OID" uiOnly="true"/> 
      --> 
    </defaultFields></occurrence><occurrence extends="MIXR_PRIM" table="ft_t_mixr" id="MIXR_PRIM" parentId="MKISPMBISSU" label=" Market Issue Cross Reference ((Primary)" dbConstraint="MKISMIXR"><defaultFields> 
      <field name="ft_t_mixr.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
      <field name="ft_t_mixr.trdng_stat_typ" dataType="STRING" srcOccurrence="MKISPMBISSU" valueOf="ft_t_mkis.trdng_stat_typ"/> 
    </defaultFields></occurrence><occurrence extends="MKISDEFBISSU" table="ft_t_mkis" id="MKISDEFBISSU" parentId="BASEISSU" autoCreate="false" multiple="true"> 
    <inputFields> 
      <field name="ft_t_mkis.trdng_stat_typ" label="Market Status"/>  
      <field name="ft_t_mkis.actively_traded_ind"/>  
      <field name="ft_t_mkis.norm_mkt_sz_cqty" label="Quote Lot Size"/>  
      <field name="ft_t_mkis.mrgn_sec_ind" label="Marginable"/>  
      <field name="ft_t_mkis.settle_curr_cde"/>  
      <field name="ft_t_mkis.trd_lot_size_cqty"/>  
      <field name="ft_t_mkis.prim_trd_mkt_ind" label="Primary Exchange"/>  
      <field name="ft_t_mkis.prc_curr_cde" label="Quotation Currency"/>  
      <field name="ft_t_mkis.mkt_oid" label="Exchange Name"/> 
    <field name="ft_t_mkis.trdng_curr_cde"/><field name="ft_t_mkis.iss_prc_ut_camt"/><field name="ft_t_mkis.rnd_lot_sz_cqty"/><field name="ft_t_mkis.gu_id" label="Trading Country"/><field name="ft_t_mkis.opol_ind"/></inputFields>  
    <!--<defaultFields>
			<field name="ft_t_mkis.prim_trd_mkt_ind" dataType="STRING" value="N"/>
		</defaultFields>--> 
  <defaultFields>   
      <!--<field name="ft_t_mkis.trdng_stat_typ" value="ACTIVE" dataType="STRING"/>  
      -->  
      <field name="ft_t_mkis.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_mkis.last_chg_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_mkis.last_chg_usr_id" dataType="STRING" valueOfFunction="APPUSER"/> 
    </defaultFields></occurrence><occurrence extends="MIXRBISSU" table="ft_t_mixr" id="MIXRBISSU" parentId="MKISDEFBISSU" multiple="true" dbConstraint="MKISMIXR"><defaultFields> 
      <field name="ft_t_mixr.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>         
      <field name="ft_t_mixr.trdng_stat_typ" dataType="STRING" srcOccurrence="MKISDEFBISSU" valueOf="ft_t_mkis.trdng_stat_typ"/>  
      <field name="ft_t_mixr.last_chg_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_mixr.last_chg_usr_id" dataType="STRING" valueOfFunction="APPUSER"/> 
    </defaultFields><inputFields> 
      <field name="ft_t_mixr.end_tms"/> 
    </inputFields></occurrence><occurrence table="ft_t_isst" id="ISST_EQYSHOUT" parentId="BASEISSU" label="Issue Statistics" autoDelete="false"> 
    <where activeOnly="false"> 
      <field name="ft_t_isst.stat_def_id" dataType="STRING" value="EQYSHOUT"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_isst.stat_val_dte" label="Shares Outstanding Date"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isst.start_tms" valueOf="ft_t_issu.start_tms" srcOccurrence="BASEISSU" dataType="DATETIME"/>  
      <field name="ft_t_isst.stat_def_id" dataType="STRING" valueOf="ft_t_stdf.stat_def_id"> 
        <where> 
          <field name="ft_t_stdf.stat_def_id" dataType="STRING" value="EQYSHOUT"/> 
        </where> 
      </field> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_isst" id="ISST_EQFFPCT" parentId="BASEISSU" label="Issue Statistics" autoDelete="false"> 
    <where activeOnly="false"> 
      <field name="ft_t_isst.stat_def_id" dataType="STRING" value="EQFFPCT"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_isst.stat_val_camt" label="Free Float Amount"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isst.start_tms" valueOf="ft_t_issu.start_tms" srcOccurrence="BASEISSU" dataType="DATETIME"/>  
      <field name="ft_t_isst.stat_def_id" dataType="STRING" valueOf="ft_t_stdf.stat_def_id"> 
        <where> 
          <field name="ft_t_stdf.stat_def_id" dataType="STRING" value="EQFFPCT"/> 
        </where> 
      </field> 
    </defaultFields> 
  </occurrence><occurrence extends="RGCHBISSU" autoDelete="false" table="ft_t_rgch" id="RGCHBISSU" parentId="BASEISSU" label="Regulatory Information"> 
    <inputFields> 
      <field name="ft_t_rgch.regs_rule144a_ind" label="144A"/>  
      <field name="ft_t_rgch.reg_s_ind" label="Regulation S"/>  
      <field name="ft_t_rgch.gu_id" label="Regulatory Country"/> 
    <field name="ft_t_rgch.gu_cnt"/><field name="ft_t_rgch.gu_typ"/><field name="ft_t_rgch.isma_regulated_ind"/><field name="ft_t_rgch.rule_144a_ind"/></inputFields> 
  <defaultFields> 
      <field name="ft_t_rgch.start_tms" dataType="DATETIME" srcOccurrence="BASEISSU" valueOf="ft_t_issu.start_tms"/> 
    </defaultFields></occurrence><occurrence table="ft_t_uwch" id="UWCH" parentId="BASEISSU" label="Underwriting Characteristics"> 
    <defaultFields> 
      <field name="ft_t_uwch.offer_num" dataType="NUMBER" value="1"/>  
      <!--      <field name="ft_t_uwch.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>--> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_uwch.pvt_plcmnt_ind" label="Private Placement"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_iscm" id="ISCM_TRAGENT" parentId="BASEISSU" label="Issue Comments"> 
    <where> 
      <field name="ft_t_iscm.cmnt_reas_typ" dataType="STRING" value="TRAGENT"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_iscm.cmnt_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_iscm.ln_num" dataType="NUMBER" value="1"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_iscm.cmnt_txt" label="Transfer Agent"/> 
    </inputFields> 
  </occurrence><occurrence extends="ISCMBISSU" label="Issue Comments" table="ft_t_iscm" id="ISCMBISSU" parentId="BASEISSU"> 
    <inputFields> 
      <field name="ft_t_iscm.cmnt_txt"/>  
      <field name="ft_t_iscm.cmnt_tms" label="Date"/> 
    </inputFields> 
  <where> 
      <field name="ft_t_iscm.cmnt_reas_typ" dataType="STRING" value="COMMENT"/> 
    </where><defaultFields> 
      <field name="ft_t_iscm.cmnt_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_iscm.ln_num" dataType="NUMBER" value="1"/> 
    </defaultFields></occurrence><occurrence table="ft_t_isst" id="ISST_DTCELGBL" parentId="BASEISSU" label="Issue Statistics" autoDelete="false"> 
    <where> 
      <field name="ft_t_isst.stat_def_id" dataType="STRING" value="DTCELGBL"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_isst.stat_char_val_txt" label="DTC Eligible"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isst.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_isst.stat_def_id" dataType="STRING" valueOf="ft_t_stdf.stat_def_id"> 
        <where> 
          <field name="ft_t_stdf.stat_def_id" dataType="STRING" value="DTCELGBL"/> 
        </where> 
      </field> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_isst" id="ISST_DTCREGRD" parentId="BASEISSU" label="Issue Statistics" autoDelete="false"> 
    <where> 
      <field name="ft_t_isst.stat_def_id" dataType="STRING" value="DTCREGRD"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_isst.stat_char_val_txt" label="DTC Registered"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isst.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_isst.stat_def_id" dataType="STRING" valueOf="ft_t_stdf.stat_def_id"> 
        <where> 
          <field name="ft_t_stdf.stat_def_id" dataType="STRING" value="DTCREGRD"/> 
        </where> 
      </field> 
    </defaultFields> 
  </occurrence><occurrence extends="ISDEBISSU" table="ft_t_isde" id="ISDEBISSU" parentId="BASEISSU" label="Issue Description" level="1"> 
    <inputFields> 
      <field name="ft_t_isde.iss_nme" label="Instrument Name" level="1"/>  
      <field name="ft_t_isde.iss_desc" label="Instrument Description"/> 
    <field name="ft_t_isde.start_tms"/></inputFields> 
  <where> 
      <field name="ft_t_isde.desc_usage_typ" dataType="STRING" value="PRIMARY"/> 
    </where><defaultFields> 
      <field name="ft_t_isde.desc_srce_typ" dataType="STRING" value="INHOUSE"/>  
      <field name="ft_t_isde.nls_cde" dataType="STRING" value="ENGLISH"/>  
      <field name="ft_t_isde.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields></occurrence><occurrence extends="IEDF_DIV_or_INT" table="ft_t_iedf" id="IEDF_DIV_or_INT" parentId="BASEISSU" label="Income Event Definition(Dividend/Interest)"> 
    <where> 
      <field name="ft_t_iedf.ev_typ" dataType="STRING" value="DIVIDEND"/> 
    </where> 
  <defaultFields> 
      <field name="ft_t_iedf.verif_ind" dataType="STRING" value="Y"/>  
      <field name="ft_t_iedf.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields><inputFields> 
      <field name="ft_t_iedf.first_py_tms" label="First Payment Date"/>  
      <field name="ft_t_iedf.days_mth_bas_typ"/>  
      <field name="ft_t_iedf.days_yr_bas_typ"/>  
      <field name="ft_t_iedf.calc_meth_typ" label="Calculation Method"/>  
      <field name="ft_t_iedf.py_dte_fq_qty" label="Payable Date Frequency"/>  
      <field name="ft_t_iedf.py_dte_fq_dy_typ"/>  
      <field name="ft_t_iedf.py_dte_fq_sp_typ"/>  
      <field name="ft_t_iedf.start_tms"/>  
      <field name="ft_t_iedf.end_tms"/> 
    </inputFields></occurrence><occurrence extends="IPDF_DIV_or_INT" autoDelete="true" table="ft_t_ipdf" id="IPDF_DIV_or_INT" parentId="IEVP_DIV_or_INT" multiple="true" label="Income Payment Definition(Dividend/Interest)"> 
    <inputFields> 
      <field name="ft_t_ipdf.start_tms"/>  
      <field name="ft_t_ipdf.ev_crte" label="Forecast Amount"/>  
      <field name="ft_t_ipdf.ev_rate_bas_typ" label="Forecast Measure"/> 
    <field name="ft_t_ipdf.ev_rate_typ"/><field name="ft_t_ipdf.iss_part_rl_typ"/><field name="ft_t_ipdf.pay_curr_cde"/><field name="ft_t_ipdf.end_tms"/></inputFields>  
    <defaultFields> 
      <field name="ft_t_ipdf.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <validationRules> 
      <rule id="IPDF_FIELDS"> 
        <xPath value="boolean((string-length(%modelPath:IPDF_DIV_or_INT:ft_t_ipdf.iss_part_rl_typ%) > 0 and string-length(%modelPath:IPDF_DIV_or_INT:ft_t_ipdf.ev_rate_typ%) > 0 and string-length(%modelPath:IPDF_DIV_or_INT:ft_t_ipdf.ev_rate_bas_typ%) > 0) or (string-length(%modelPath:IPDF_DIV_or_INT:ft_t_ipdf.ev_crte%) = 0 and string-length(%modelPath:IPDF_DIV_or_INT:ft_t_ipdf.iss_part_rl_typ%) = 0 and string-length(%modelPath:IPDF_DIV_or_INT:ft_t_ipdf.ev_rate_typ%) = 0 and string-length(%modelPath:IPDF_DIV_or_INT:ft_t_ipdf.ev_rate_bas_typ%) = 0) )"/>  
        <errorMessage value="Forecast Measure, Issue Participation Role and Event Rate Type must be entered if any of the following field is populated: Forecast Measure, Issue Participation Role, Event Rate Type or Forecast Amount  "/> 
      </rule> 
    </validationRules> 
  </occurrence><occurrence table="ft_t_gncm" id="GNCM" parentId="IPDF_DIV_or_INT" label="General Comments"> 
    <defaultFields> 
      <field name="ft_t_gncm.ln_num" dataType="NUMBER" value="1"/>  
      <field name="ft_t_gncm.created_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_gncm.gncm_tbl_typ" dataType="STRING" value="IPDF"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_gncm.comm_reas_mnem" dataType="STRING" value="COMMENT"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_gncm.cmnt_txt" label="Forecast Assumption"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_itxt" id="ITXT" parentId="BASEISSU" label="Issue Tax Statistics"> 
    <inputFields> 
      <field name="ft_t_itxt.gu_cnt"/>  
      <field name="ft_t_itxt.gu_id" label="Tax Jurisdiction"/>  
      <field name="ft_t_itxt.gu_typ"/>  
      <field name="ft_t_itxt.tax_year_typ"/>  
      <field name="ft_t_itxt.percent_income_cpct" label="Dividend Tax Rate"/> 
    </inputFields>  
    <validationRules> 
      <rule id="ITXT_NOT_NULL_FIELDS"> 
        <xPath value="boolean((string-length(%modelPath:ITXT:ft_t_itxt.tax_year_typ%)  > 0 and string-length(%modelPath:ITXT:ft_t_itxt.gu_id%)  > 0 ) or (string-length(%modelPath:ITXT:ft_t_itxt.percent_income_cpct%) = 0 and string-length(%modelPath:ITXT:ft_t_itxt.tax_year_typ%) = 0 and string-length(%modelPath:ITXT:ft_t_itxt.gu_id%) = 0 )  )"/>  
        <errorMessage value="Tax Jurisdiction and Tax Year Type must be entered if any of the following fields is populated: Tax Jurisdiction, Percent Income or Tax Year Type"/> 
      </rule> 
    </validationRules> 
  </occurrence><occurrence table="ft_t_ismc" id="ISMC_PRNT" parentId="BASEISSU" autoDelete="false"> 
    <where> 
      <field name="ft_t_ismc.capital_typ" value="OUTSTAND" dataType="string"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_ismc.cap_chg_eff_tms"/>  
      <field name="ft_t_ismc.cap_sec_cqty"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_isde" id="ISDE_VENDOR" parentId="BASEISSU" label="Issue Description"> 
    <defaultFields> 
      <field name="ft_t_isde.nls_cde" dataType="STRING" value="ENGLISH"/>  
      <field name="ft_t_isde.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_isde.iss_nme" label="Instrument Name"/>  
      <field name="ft_t_isde.start_tms"/>  
      <field name="ft_t_isde.iss_desc" label="Instrument Description"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_isde.desc_srce_typ" dataType="STRING" value="VENDOR"/> 
    </where> 
  </occurrence><occurrence table="ft_t_isid" id="ISID_Iss_level" parentId="BASEISSU" label="Issue Identifiers" multiple="true" dbConstraint="ISSUISID"> 
    <inputFields> 
      <field name="ft_t_isid.iss_id" label="Identifier Value"/>  
      <field name="ft_t_isid.id_ctxt_typ" label="Identifier Type"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <validationRules> 
      <rule id="ISINMarket"> 
        <xPath value="boolean(not(%modelPath:ISID_Iss_level:ft_t_isid.id_ctxt_typ% =''ISIN'' and not(string-length(%modelPath:ISID_Iss_level:ft_t_isid.mkt_oid%) = 0)))"/>  
        <errorMessage value="ISIN identifier cannot have market."/> 
      </rule>  
      <!--<rule id="ISSUTXTTYPNOTSUPPORTED" messageType="WARNING"> 
	   <xPath value="boolean(not(%modelPath:ISID_Iss_level%/intlvlid_supported=''0''))"/>
          <errorMessageXPath value="concat(%modelPath:ISID_Iss_level:ft_t_isid.id_ctxt_typ%,'' is no longer supported as a valid Instrument Level Identifier. Please take necessary action.'')"/>
		 </rule>--> 
    </validationRules> 
  </occurrence><occurrence table="ft_t_isid" id="ISID_MKT_Iss_level_PUB" parentId="BASEISSU" label="Global Market Identifiers pub" multiple="true" dbConstraint="MRKTISIDPUB"> 
    <!-- <where> 
      <field name="ft_t_isid.mkt_oid" dataType="STRING" isNull="false"/> 
    </where> -->  
    <inputFields> 
      <field name="ft_t_isid.iss_id" label="Identifier Value"/>  
      <field name="ft_t_isid.id_ctxt_typ" label="Identifier Type"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <validationRules> 
      <rule id="ISINMarket"> 
        <xPath value="boolean(not(%modelPath:ISID_MKT_Iss_level_PUB:ft_t_isid.id_ctxt_typ% =''ISIN'' and not(string-length(%modelPath:ISID_MKT_Iss_level_PUB:ft_t_isid.mkt_oid%) = 0)))"/>  
        <errorMessage value="ISIN identifier cannot have market."/> 
      </rule> 
    </validationRules> 
  </occurrence><occurrence table="ft_t_isid" id="ISIDBISIN" parentId="BASEISSU" label="Identifiers"> 
    <inputFields> 
      <field name="ft_t_isid.iss_id"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_isid.id_ctxt_typ" dataType="STRING" value="ISIN"/> 
    </where> 
  </occurrence><occurrence table="ft_t_isid" id="ISIDBINH" parentId="BASEISSU" label="Identifiers"> 
    <inputFields> 
      <field name="ft_t_isid.iss_id"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_isid.id_ctxt_typ" dataType="STRING" value="INHOUSE"/> 
    </where> 
  </occurrence><occurrence table="ft_t_isid" id="ISIDBCUS" parentId="BASEISSU" label="Identifiers"> 
    <inputFields> 
      <field name="ft_t_isid.iss_id"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_isid.id_ctxt_typ" dataType="STRING" value="CUSIP"/> 
    </where> 
  </occurrence><occurrence table="ft_t_isid" id="ISIDBCOM" parentId="BASEISSU" label="Identifiers"> 
    <inputFields> 
      <field name="ft_t_isid.iss_id"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_isid.id_ctxt_typ" dataType="STRING" value="COMMON"/> 
    </where> 
  </occurrence><occurrence table="ft_t_isid" id="ISIDVAL" parentId="BASEISSU" label="Identifiers"> 
    <inputFields> 
      <field name="ft_t_isid.iss_id"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_isid.id_ctxt_typ" dataType="STRING" value="VALOREN"/> 
    </where> 
  </occurrence><occurrence table="ft_t_iscl" id="ISCL_INSUBTYP" parentId="BASEISSU" label="Issue Classification" dbConstraint="SUBTYPE" multiple="false"> 
    <where> 
      <field name="ft_t_iscl.clsf_purp_typ" dataType="STRING" value="INSUBTYP"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_iscl.cl_value" label="Instrument Sub-Type"/>  
      <field name="ft_t_iscl.indus_cl_set_id"/>  
      <field name="ft_t_iscl.clsf_oid"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_iscl.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_fnch" id="FNCH_ALL" parentId="BASEISSU" label="Fund Characteristics"> 
    <defaultFields> 
      <!--<field name="ft_t_fnch.chars_eff_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>-->
    </defaultFields> 
  </occurrence><occurrence table="ft_t_isrt" id="ISRTBISSU" parentId="BASEISSU" multiple="true" label="Rating"> 
    <inputFields> 
      <field name="ft_t_isrt.rtng_curr_typ"/>  
      <field name="ft_t_isrt.rtng_purp_typ"/>  
      <field name="ft_t_isrt.rtng_set_oid"/>  
      <field name="ft_t_isrt.rtng_cde"/>  
      <field name="ft_t_isrt.start_tms"/>  
      <field name="ft_t_isrt.rtng_eff_tms"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isrt.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>      
    </defaultFields> 
  </occurrence><occurrence table="ft_t_isid" id="ISID_TIC_PM_PUB" parentId="MIXR_PRIM" label="Issue Identifier-Ticker" dbConstraint="MIXRISIDPUB"> 
    <where> 
      <field name="ft_t_isid.id_ctxt_typ" dataType="STRING" value="TICKER"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_isid.iss_id" label="Primary Ticker"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isid.isid_oid" dataType="STRING" srcOccurrence="MIXR_PRIM" valueOf="ft_t_mixr.isid_oid"/>  
      <field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_isid.mkt_oid" dataType="STRING" srcOccurrence="MKISPMBISSU" valueOf="ft_t_mkis.mkt_oid"/>  
      <field name="ft_t_isid.instr_id" dataType="STRING" srcOccurrence="BASEISSU" valueOf="ft_t_issu.instr_id"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_isxr" id="BISSU_ISXR_ISID" parentId="LISTISID_BISSU" multiple="true" autoDelete="false"> 
    <where> 
      <field name="ft_t_isxr.isid_oid" dataType="STRING" srcOccurrence="LISTISID_BISSU" valueOf="ft_t_isid.isid_oid"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_isxr.last_chg_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_isxr.last_chg_usr_id" dataType="STRING" valueOfFunction="APPUSER"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_isxr.isxr_rel_purp_typ"/>  
      <field name="ft_t_isxr.start_tms"/>  
      <field name="ft_t_isxr.end_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_must" id="MUST_MICOPOL" parentId="MKISDEFBISSU" autoDelete="false"> 
    <where> 
      <field name="ft_t_must.stat_def_id" dataType="STRING" value="MICOPOL"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_must.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_must.stat_char_val_txt" label="OPOL"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_must" id="MUST_CDREXCH" parentId="MKISDEFBISSU" autoDelete="false"> 
    <where> 
      <field name="ft_t_must.stat_def_id" dataType="STRING" value="CDREXCH"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_must.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_must.stat_char_val_txt" label="Exchange Calendar"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_ispc" id="ISPCBISSU" parentId="BASEISSU" label="Issue Price Details"> 
    <inputFields> 
      <field name="ft_t_ispc.prc_typ"/>  
      <field name="ft_t_ispc.prc_srce_typ"/>  
      <field name="ft_t_ispc.prc_tms"/>  
      <field name="ft_t_ispc.unit_cprc"/>  
      <field name="ft_t_ispc.prc_curr_cde"/> 
    </inputFields>  
    <defaultFields> 
      <!--      <field name="ft_t_ispc.prc_curr_cde" dataType="STRING" srcOccurrence="BASEISSU" valueOf="ft_t_issu.denom_curr_cde"/>  -->  
      <field name="ft_t_ispc.prc_qt_meth_typ" dataType="STRING" value="1"/>  
      <field name="ft_t_ispc.prc_valid_typ" dataType="STRING" value="VALID"/>  
      <field name="ft_t_ispc.prcng_meth_typ" dataType="STRING" value="1"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_ievp" id="IEVP_DIV_or_INT" parentId="IEDF_DIV_or_INT" label="Income Event Participant(Dividend/Interest)"> 
    <defaultFields> 
      <field name="ft_t_ievp.prt_purp_typ" dataType="STRING" value="PMTDTLS"/>  
      <field name="ft_t_ievp.start_tms" dataType="DATETIME" srcOccurrence="IEDF_DIV_or_INT" valueOf="ft_t_iedf.start_tms"/> 
    </defaultFields>  
    <!--<validationRules>
			<rule id="Unique_IPDF">
				<xPath value="is-unique(%modelPath:IPDF_DIV_or_INT%, &quot;concat(ipdf.pay_curr_cde, substring((ipdf.start_tms), 1, 10))&quot;)"/>
				<errorMessage value="Payment currency and Start Date/Time combination should be unique in Income Payments of Dividend/Interest Section"/>				
			</rule>
		</validationRules>--> 
  </occurrence><occurrence table="ft_t_pedf" id="PEDF_CALL_or_SINK" parentId="BASEISSU" label="Principal Event Definition(Call/Sink)" autoDelete="false"> 
    <inputFields> 
      <field name="ft_t_pedf.days_mth_bas_typ"/>  
      <field name="ft_t_pedf.days_yr_bas_typ"/>  
      <field name="ft_t_pedf.end_tms"/>  
      <field name="ft_t_pedf.first_py_tms" label="First Payment Date"/>  
      <field name="ft_t_pedf.py_dte_fq_qty" label="Payable Date Frequency"/>  
      <field name="ft_t_pedf.py_dte_fq_dy_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_sp_typ"/>  
      <field name="ft_t_pedf.start_tms"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_pedf.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_pedf.verif_ind" dataType="STRING" value="Y"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_pevp" id="PEVP_CALL_or_SINK" parentId="PEDF_CALL_or_SINK" label="Principal Event Participant(Call/Sink)" autoDelete="false"> 
    <defaultFields> 
      <field name="ft_t_pevp.start_tms" dataType="DATETIME" srcOccurrence="PEDF_CALL_or_SINK" valueOf="ft_t_pedf.start_tms" keepInSync="true"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_pevp.prt_purp_typ" dataType="STRING" value="SNKFDRED"/> 
    </where>  
    <validationRules> 
      <rule id="Unique_PPDF_Call_or_Sink"> 
        <xPath value="is-unique(%modelPath:PPDF_CALL_or_SINK%, &quot;concat(ppdf.pay_curr_cde,substring((ppdf.start_tms), 1, 10))&quot;)"/>  
        <!--        <xPath value="is-unique(%modelPath:PPDF_CALL_or_SINK%,&quot;substring((ppdf.start_tms), 1,10)&quot;)"/>  -->  
        <errorMessage value="Payment currency and Start Date/Time combination should be unique in Principal Payments of Call/Sink Section"/> 
      </rule> 
    </validationRules> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_CALL_or_SINK" parentId="PEVP_CALL_or_SINK" multiple="true" label="Principal Payment Definition(Call/Sink)" autoDelete="false"> 
    <inputFields> 
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.start_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/> 
    </inputFields>  
    <defaultFields/> 
  </occurrence><occurrence table="ft_t_pedf" id="PEDF_PUT_or_FACTOR" parentId="BASEISSU" label="Principal Event Defitnition(Put/Factor)" autoDelete="false"> 
    <inputFields> 
      <field name="ft_t_pedf.days_mth_bas_typ"/>  
      <field name="ft_t_pedf.days_yr_bas_typ"/>  
      <field name="ft_t_pedf.end_tms"/>  
      <field name="ft_t_pedf.first_py_tms" label="First Payment Date"/>  
      <field name="ft_t_pedf.py_dte_fq_dy_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_sp_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_qty" label="Payable Date Frequency"/>  
      <field name="ft_t_pedf.start_tms"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_pedf.verif_ind" dataType="STRING" value="Y"/>  
      <!--<field name="ft_t_pedf.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>--> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_PUT_or_FACTOR" parentId="PEVP_PUT_or_FACTOR" multiple="true" label="Principal Payment Definition(Factor)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_pedf" id="PEDF_PUT" parentId="BASEISSU" label="Principal Event Defitnition(Put)" autoDelete="false"> 
    <inputFields> 
      <field name="ft_t_pedf.days_mth_bas_typ"/>  
      <field name="ft_t_pedf.days_yr_bas_typ"/>  
      <field name="ft_t_pedf.end_tms"/>  
      <field name="ft_t_pedf.first_py_tms" label="First Payment Date"/>  
      <field name="ft_t_pedf.py_dte_fq_dy_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_sp_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_qty" label="Payable Date Frequency"/>  
      <field name="ft_t_pedf.start_tms"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_pedf.verif_ind" dataType="STRING" value="Y"/>  
      <!--<field name="ft_t_pedf.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>--> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_PUT" parentId="PEVP_PUT" multiple="true" label="Principal Payment Definition(Put)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_NEXTPUT" parentId="PEVP_NEXTPUT" multiple="true" label="Principal Payment Definition(NextPut)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_NXTPARPT" parentId="PEVP_NXTPARPT" multiple="true" label="Principal Payment Definition(NxtParpt)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_PUTPROV" parentId="PEVP_PUTPROV" multiple="true" label="Principal Payment Definition(PutProv)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_PUTSCHED" parentId="PEVP_PUTSCHED" multiple="true" label="Principal Payment Definition(PutSched)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_pedf" id="PEDF_CALLABLE" parentId="BASEISSU" label="Principal Event Defitnition(Call)" autoDelete="false"> 
    <inputFields> 
      <field name="ft_t_pedf.days_mth_bas_typ"/>  
      <field name="ft_t_pedf.days_yr_bas_typ"/>  
      <field name="ft_t_pedf.end_tms"/>  
      <field name="ft_t_pedf.first_py_tms" label="First Payment Date"/>  
      <field name="ft_t_pedf.py_dte_fq_dy_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_sp_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_qty" label="Payable Date Frequency"/>  
      <field name="ft_t_pedf.start_tms"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_pedf.verif_ind" dataType="STRING" value="Y"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_CALLABLE" parentId="PEVP_CALLABLE" multiple="true" label="Principal Payment Definition(Callable)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_pedf" id="PEDF_CALLED" parentId="BASEISSU" label="Principal Event Defitnition(Call)" autoDelete="false"> 
    <inputFields> 
      <field name="ft_t_pedf.days_mth_bas_typ"/>  
      <field name="ft_t_pedf.days_yr_bas_typ"/>  
      <field name="ft_t_pedf.end_tms"/>  
      <field name="ft_t_pedf.first_py_tms" label="First Payment Date"/>  
      <field name="ft_t_pedf.py_dte_fq_dy_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_sp_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_qty" label="Payable Date Frequency"/>  
      <field name="ft_t_pedf.start_tms"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_pedf.verif_ind" dataType="STRING" value="Y"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_CALLED" parentId="PEVP_CALLED" multiple="true" label="Principal Payment Definition(Called)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_pedf" id="PEDF_CALATPAR" parentId="BASEISSU" label="Principal Event Defitnition(Call)" autoDelete="false"> 
    <inputFields> 
      <field name="ft_t_pedf.days_mth_bas_typ"/>  
      <field name="ft_t_pedf.days_yr_bas_typ"/>  
      <field name="ft_t_pedf.end_tms"/>  
      <field name="ft_t_pedf.first_py_tms" label="First Payment Date"/>  
      <field name="ft_t_pedf.py_dte_fq_dy_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_sp_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_qty" label="Payable Date Frequency"/>  
      <field name="ft_t_pedf.start_tms"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_pedf.verif_ind" dataType="STRING" value="Y"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_CALATPAR" parentId="PEVP_CALATPAR" multiple="true" label="Principal Payment Definition(Calatpar)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_pedf" id="PEDF_CALATPRE" parentId="BASEISSU" label="Principal Event Defitnition(Call)" autoDelete="false"> 
    <inputFields> 
      <field name="ft_t_pedf.days_mth_bas_typ"/>  
      <field name="ft_t_pedf.days_yr_bas_typ"/>  
      <field name="ft_t_pedf.end_tms"/>  
      <field name="ft_t_pedf.first_py_tms" label="First Payment Date"/>  
      <field name="ft_t_pedf.py_dte_fq_dy_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_sp_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_qty" label="Payable Date Frequency"/>  
      <field name="ft_t_pedf.start_tms"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_pedf.verif_ind" dataType="STRING" value="Y"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_CALATPRE" parentId="PEVP_CALATPRE" multiple="true" label="Principal Payment Definition(Calatpre)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_isgp" id="ISGP_UNIV" parentId="BASEISSU" label="Issue Group Participant" multiple="true" dbConstraint="isgpuniv"> 
    <defaultFields> 
      <field name="ft_t_isgp.prt_purp_typ" dataType="STRING" value="MANUAL"/>  
      <field name="ft_t_isgp.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_isgp.prnt_iss_grp_oid"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_cucn" id="CUCN" parentId="BASEISSU"> 
    <defaultFields> 
      <field name="ft_t_cucn.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_cucf" id="CUCF" parentId="CUCN"> 
    <defaultFields> 
      <field name="ft_t_cucf.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_cucf.instr_id" dataType="STRING" valueOfXPath="/root/issue/issu.instr_id"/> 
    </defaultFields> 
  </occurrence><relations><table name="FT_T_RIDF"><relation relatedTable="FT_T_ISSU" name="ridfwarrant">
            <fromColumns>
                <column name="instr_id"/>
            </fromColumns>
            <toColumns>
                <column name="instr_id"/>
            </toColumns>
            <condition>
                <sql>#FROM_TABLE#.rel_typ IN (''WARRANT'',''WRT CALL'',''WRT PUT'')</sql>
            </condition>
        </relation></table><table name="FT_T_RIST"><relation relatedTable="FT_T_ISSU" name="CTD_INSTR">
			<fromColumns>
				<column name="CTD_INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
		</relation></table><table name="FT_T_RISS"><relation relatedTable="FT_T_RIDF" name="risswarrant">
            <fromColumns>
                <column name="rld_iss_feat_id"/>
            </fromColumns>
            <toColumns>
                <column name="rld_iss_feat_id"/>
            </toColumns>
            <condition>
                <sql>#FROM_TABLE#.iss_part_rl_typ IN (''DELIVER'',''RECEIVE'',''UNDLYING'')</sql>
            </condition>
        </relation></table><table name="FT_T_ISID"><relation relatedTable="FT_T_ISSU" name="ISSUISID">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<condition>
					<sql>not exists (select 1 from ft_t_mixr mixr where (mixr.end_tms is null or mixr.end_tms  > SYSDATE()) and #FROM_TABLE#.ISID_OID=mixr.isid_oid) and #FROM_TABLE#.MKT_OID is null</sql>
				</condition>
		</relation></table><table name="FT_T_MIXR"><relation relatedTable="FT_T_ISID" name="MIXRISID">
			<fromColumns>
				<column name="ISID_OID"/>
			</fromColumns>
			<toColumns>
				<column name="ISID_OID"/>
			</toColumns>
			<condition>
        <sql>exists (select 1 from FT_T_MIXR mixr where (mixr.end_tms IS NULL or mixr.end_tms  > p_asOfDate) and #TO_TABLE#.ISID_OID=mixr.isid_oid)</sql>
			</condition>
		</relation></table><table name="FT_T_MIXR"><relation relatedTable="FT_T_ISID" name="MIXRISIDPUB">
			<fromColumns>
				<column name="ISID_OID"/>
			</fromColumns>
			<toColumns>
				<column name="ISID_OID"/>
			</toColumns>
			<condition>				
				<sql>exists (select 1 from FT_T_MIXR mixr where (mixr.end_tms IS NULL or mixr.end_tms  > SYSDATE()) and #TO_TABLE#.ISID_OID=mixr.isid_oid)</sql>				
			</condition>
		</relation></table><table name="FT_T_MKIS"><relation relatedTable="FT_T_ISSU" name="ISSUMKIS">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<condition>
				<sql>(#FROM_TABLE#.prim_trd_mkt_ind=''Y'' or (select count(*) from ft_t_mkis where ft_t_mkis.instr_id=#TO_TABLE#.instr_id and (ft_t_mkis.end_tms is null or ft_t_mkis.end_tms  >= SYSDATE()))=1)</sql>
			</condition>
		</relation></table><table name="FT_T_MIXR"><relation relatedTable="FT_T_MKIS" name="MKISMIXR">
			<fromColumns>
				<column name="MKT_ISS_OID"/>
			</fromColumns>
			<toColumns>
				<column name="MKT_ISS_OID"/>
			</toColumns>
		</relation></table><table name="FT_T_IEDF"><relation relatedTable="FT_T_ISSU" name="issuiedfinterest">
            <fromColumns>
                <column name="instr_id"/>
            </fromColumns>
            <toColumns>
                <column name="instr_id"/>
            </toColumns>
            <condition>
                <sql>#FROM_TABLE#.ev_typ IN (''INTEREST'')</sql>
            </condition>
        </relation></table><table name="FT_T_IPDF"><relation relatedTable="FT_T_IEVP" name="ipdfbasecpi">
            <fromColumns>
                <column name="INC_EV_PRT_ID"/>
            </fromColumns>
            <toColumns>
                <column name="INC_EV_PRT_ID"/>
            </toColumns>
            <condition>
                <sql>#FROM_TABLE#.rate_fixing_base_crte is not null and #FROM_TABLE#.start_tms = (select max(start_tms) from ft_t_ipdf where inc_ev_prt_id=#FROM_TABLE#.inc_ev_prt_id and rate_fixing_base_crte is not null)</sql>
            </condition>
        </relation></table><table name="FT_T_GNCM"><relation relatedTable="FT_T_IPDF" name="IPDFGNCMCSTM">
      <fromColumns>
        <column name="CROSS_REF_ID"/>
      </fromColumns>
      <toColumns>
        <column name="INC_PAY_DEF_ID"/>
      </toColumns>
      <condition>
        <sql>#FROM_TABLE#.GNCM_TBL_TYP = ''IPDF''</sql>
      </condition>
    </relation></table><table name="FT_T_ISID"><relation relatedTable="FT_T_ISSU" name="MRKTISID">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<condition>
				<sql>not exists (select 1 from ft_t_mixr mixr where (mixr.end_tms is null or mixr.end_tms  > SYSDATE()) and #FROM_TABLE#.ISID_OID=mixr.isid_oid) and #FROM_TABLE#.MKT_OID is not null</sql>
		</condition>
		</relation></table><table name="FT_T_ISID"><relation relatedTable="FT_T_ISSU" name="MRKTISIDPUB">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<condition>			
				<sql>not exists (select 1 from ft_t_mixr mixr where (mixr.end_tms is null or mixr.end_tms  > SYSDATE()) and #FROM_TABLE#.ISID_OID=mixr.isid_oid) and #FROM_TABLE#.MKT_OID is not null</sql>			
			</condition>
		</relation></table><table name="FT_T_ISCL"><relation relatedTable="FT_T_ISSU" name="SUBTYPE">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<condition>
				<sql>#FROM_TABLE#.indus_cl_set_id in (''TKISSTYP'',''BBSECTYP'',''FTISSTYP'',''ASSETCLS'')</sql>
			</condition>
		</relation></table><table name="FT_T_ISCL"><relation relatedTable="FT_T_ISSU" name="SUBTYPE">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<condition>
				<sql>#FROM_TABLE#.indus_cl_set_id in (''TKISSTYP'',''BBSECTYP'',''FTISSTYP'',''ASSETCLS'')</sql>
			</condition>
		</relation></table><table name="FT_T_ISLL"><relation relatedTable="FT_T_ISSU" name="isllissu">
            <fromColumns>
                <column name="instr_id"/>
            </fromColumns>
            <toColumns>
                <column name="instr_id"/>
            </toColumns>
            <condition>
                <sql>#FROM_TABLE#.last_chg_tms in (SELECT max(last_chg_tms) FROM ft_t_isll where instr_id = #TO_TABLE#.instr_id)</sql>
            </condition>
        </relation></table><table name="FT_T_RIST"><relation relatedTable="FT_T_ISSU" name="RIST_INSTR">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
		</relation></table><table name="FT_T_LMST"><relation relatedTable="FT_T_ISSU" name="latestlmst">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<condition>
				<sql>#FROM_TABLE#.last_chg_tms = (SELECT MAX (last_chg_tms) FROM ft_t_lmst WHERE ft_t_lmst.instr_id = #TO_TABLE#.instr_id)</sql>
			</condition>
		</relation></table><table name="FT_T_ISGU"><relation relatedTable="FT_T_ISSU" name="ISSUISGU">
            <fromColumns>
                <column name="INSTR_ID"/>
            </fromColumns>
            <toColumns>
                <column name="INSTR_ID"/>
            </toColumns>
            <condition>
                <sql>#FROM_TABLE#.gu_typ =''COUNTRY''</sql>
            </condition>
        </relation></table><table name="FT_T_AISR"><relation relatedTable="FT_T_ISSU" name="MyAccountIssueRole">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<condition>
				<sql>#FROM_TABLE#.ACCT_ISSU_RL_TYP is not null</sql>
			</condition>
		</relation></table><table name="FT_T_AISR"><relation relatedTable="FT_T_ISSU" name="MyIssueAccountRole">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<!--Commented as AISR.ISSU_ACCT_RL_TYP has been removed (GT 37778)-->
			<!--<condition>
        <sql>#FROM_TABLE#.ISSU_ACCT_RL_TYP is not null</sql>
      </condition>-->
		</relation></table><table name="FT_T_ISRT"><relation relatedTable="FT_T_ISSU" name="RTNG_HIST" checkService="RATING_SERVICE">
			<condition>
				<sql>#FROM_TABLE#.SYS_EFF_END_TMS IS NULL AND (#FROM_TABLE#.INSTR_ID) = (#TO_TABLE#.INSTR_ID)</sql>
			</condition>
		</relation></table><table name="FT_T_MKIS"><relation relatedTable="FT_T_ISPC" name="LATESTPRICE">
			<fromColumns>
				<column name="INSTR_ID"/>
				<column name="MKT_OID"/>
				<column name="PRC_CURR_CDE"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
				<column name="MKT_OID"/>
				<column name="PRC_CURR_CDE"/>
			</toColumns>
			<condition>
				<sql>#TO_TABLE#.prc_tms = 
             (select max(prc_tms)
                from ft_t_ispc maxprc
               where maxprc.instr_id = #TO_TABLE#.instr_id
                 and maxprc.mkt_oid = #TO_TABLE#.mkt_oid
                 and maxprc.prc_curr_cde = #TO_TABLE#.prc_curr_cde)</sql>
			</condition>
		</relation></table><table name="FT_T_MUST"><relation relatedTable="FT_T_MKIS" name="mkismust">
            <fromColumns>
                <column name="MKT_ISS_OID"/>
            </fromColumns>
            <toColumns>
                <column name="MKT_ISS_OID"/>
            </toColumns>
        </relation></table><table name="FT_T_ISPC"><relation name="latestclosingprice" relatedTable="FT_T_ISSU">
            <fromColumns>
                <column name="INSTR_ID"/>
            </fromColumns>
            <toColumns>
                <column name="INSTR_ID"/>
            </toColumns>
            <condition>
                <sql>(#FROM_TABLE#.last_chg_tms
                      , #FROM_TABLE#.prc_tms
                      , COALESCE (#FROM_TABLE#.data_src_id, ''999'')
                      , #FROM_TABLE#.prc_srce_typ
                      , #FROM_TABLE#.prc_typ
                      || COALESCE (TRIM (#FROM_TABLE#.addnl_prc_qual_typ), ''999'')) IN
                            (  SELECT   MAX (last_chg_tms)
                                        , MAX (prc_tms)
                                        , COALESCE (data_src_id, ''999'')
                                        , prc_srce_typ
                                        , prc_typ
                                        || COALESCE (TRIM (addnl_prc_qual_typ), ''999'')
                                 FROM   ft_t_ispc ispc1
                                WHERE   instr_id = #FROM_TABLE#.instr_id
                                AND trim(prc_typ) || trim(addnl_prc_qual_typ) IN (''BID2171'',''ASKED2124'',''ASKED1'',''0031'',''0033'',''ASKED3'')      
                             GROUP BY   prc_tms,
                                        data_src_id,
                                        prc_srce_typ,
                                        prc_typ,
                                        addnl_prc_qual_typ,
                                        prc_qt_meth_typ)</sql>
            </condition>
        </relation></table><table name="FT_T_IEVP"><relation relatedTable="FT_T_IEDF" name="iedfievpestdiv">
            <fromColumns>
                <column name="INC_EV_DEF_ID"/>
            </fromColumns>
            <toColumns>
                <column name="INC_EV_DEF_ID"/>
            </toColumns>
            <condition>
                <sql>#FROM_TABLE#.prt_purp_typ IN (''ESTIMATE'',''DIVIDEND'')</sql>
            </condition>
        </relation></table><table name="FT_T_PEDF"><relation relatedTable="FT_T_ISSU" name="pedffactorissu">
            <fromColumns>
                <column name="instr_id"/>
            </fromColumns>
            <toColumns>
                <column name="instr_id"/>
            </toColumns>
            <condition>
                <sql>#FROM_TABLE#.ev_typ IN (''FACTOR'')</sql>
            </condition>
        </relation></table><table name="FT_T_PEVP"><relation relatedTable="FT_T_PEDF" name="pevpfactorissu">
            <fromColumns>
                <column name="prin_ev_def_id"/>
            </fromColumns>
            <toColumns>
                <column name="prin_ev_def_id"/>
            </toColumns>
            <condition>
                <sql>#FROM_TABLE#.prt_purp_typ IN (''FACTOR'')</sql>
            </condition>
        </relation></table><table name="FT_T_PPDF"><relation relatedTable="FT_T_PEVP" name="ppdf_pevp">
            <fromColumns>
                <column name="PRIN_EV_PRT_ID"/>
            </fromColumns>
            <toColumns>
                <column name="PRIN_EV_PRT_ID"/>
            </toColumns>
            <condition>
                <sql>ROWNUM=1</sql>
            </condition>
        </relation></table><table name="FT_T_IRCL"><relation relatedTable="FT_T_ISSU" name="IRCL_ISSU">
			<fromColumns>
				<column name="INSTR_ISSR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ISSR_ID"/>
			</toColumns>
			<condition>
				<sql>(#FROM_TABLE#.instr_id = #TO_TABLE#.instr_id or #FROM_TABLE#.instr_id is null)</sql> 
			</condition>
		</relation></table><table name="FT_T_ISGP"><relation relatedTable="FT_T_ISSU" name="isgpuniv">
			<fromColumns>
				<column name="instr_id"/>
			</fromColumns>
			<toColumns>
				<column name="instr_id"/>
			</toColumns>
			<condition>
				<sql>TRIM(#FROM_TABLE#.PRNT_ISS_GRP_OID) in (SELECT TRIM(ISS_GRP_OID) FROM FT_T_ISGR WHERE GRP_PURP_TYP=''UNIVERSE'')</sql>
			</condition>
		</relation></table></relations></model>' WHERE modl_id ='ADRGDR' AND modl_typ = 'ISSU';
		
UPDATE FT_T_MDDF SET modl_schema ='<?xml version="1.0" encoding="UTF-8"?>
<model xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" headerInfoXPath="concat(''Collateralized Mortgage Obligations/Asset Backed Securities - '',/root/issue/issuetype-issuf001/isty.iss_typ_nme,'' / '',/root/issue/issuer-issuf002/issr.issr_nme,'' / '',/root/issue/issu.pref_iss_id,'' / '',/root/issue/issu.pref_iss_nme)" id="ASSTBSEC" extends="BASEDEBT" xsi:noNamespaceSchemaLocation="../../schemas/Model.xsd" minLevelToEnableChangeApproval="2">  
  <occurrence table="ft_t_issu" extends="BASEISSU" id="BASEISSU" level="1" label="Issue Description/Issue Details"> 
    <inputFields> 
      <field name="ft_t_issu.series_typ"/> 
    <field name="ft_t_issu.mat_exp_tms" level="2"/><field name="ft_t_issu.iss_typ" level="1" label="Instrument Type"/><field name="ft_t_issu.denom_curr_cde" level="2"/><field name="ft_t_issu.sec_form_typ"/><field name="ft_t_issu.instr_issr_id"/><field name="ft_t_issu.nom_val_unit_camt"/><field name="ft_t_issu.distribution_curr_cde"/><field name="ft_t_issu.iss_tms" label="Instrument Date"/><field name="ft_t_issu.cl_typ"/></inputFields> 
  <validationRules> 
      <rule id="ValidationISID"> 
        <xPath value="boolean((count(/root/issueidentifiers/identifier[@status!=''deleted'' or string-length(@status)=0]) >0)  or (/root/issue[@status!=''new'' or  string-length(@status)=0]))"/>  
        <errorMessage value="At least one Instrument Level Identifier has to be entered."/> 
      </rule>  
      <rule id="ValidationISID_ACTIVITYSTATUS"> 
        <xPath value="boolean((count(/root/issueidentifiers/identifier[@status!=''deleted'' or string-length(@status)=0]) >0 or string(/root/issue/issu.iss_actvy_stat_typ)=''INACTIVE'')  or (/root/issue[@status=''new'' or  string-length(@status)!=0]))"/>  
        <errorMessage value="User has either to mark the Issue activity status(Instrument Status)  as inactive or have at least one identifier active."/> 
      </rule>  
      <rule id="FIRSTCPDT_LT_NXTCPDT"> 
        <xPath value="boolean((%modelPath:IEDFBDEBT:ft_t_iedf.first_py_tms%  < = %modelPath:BDSTBDEBT:ft_t_bdst.nxt_cpn_dte%) or (string-length(%modelPath:IEDFBDEBT:ft_t_iedf.first_py_tms%)=0 or string-length(%modelPath:BDSTBDEBT:ft_t_bdst.nxt_cpn_dte%)=0))"/>  
        <errorMessage value="First Coupon Date Should be Less than or equal to  Next Coupon Date"/> 
      </rule>  
      <rule id="DATEDTMS_LT_MATTMS"> 
        <xPath value="boolean((%modelPath:BDCHBDEBT:ft_t_bdch.dted_tms%  <  %modelPath:BASEISSU:ft_t_issu.mat_exp_tms%) or (string-length(%modelPath:BDCHBDEBT:ft_t_bdch.dted_tms%)=0 or string-length(%modelPath:BASEISSU:ft_t_issu.mat_exp_tms%)=0))"/>  
        <errorMessage value="Dated date should be less than Maturity date"/> 
      </rule> 
    <rule id="MultiplePrimaryMarkets" pageName="Market"> 
        <xPath value="boolean(count(%modelPath:MKISDEFBISSU%[(string-length(mkis.end_tms) = 0) and (mkis.prim_trd_mkt_ind = ''Y'')])  <  2)"/>  
        <errorMessage value="There should not be multiple primary markets for a single issue."/> 
      </rule></validationRules><defaultFields> 
      <field name="ft_t_issu.access_auth_typ" dataType="STRING" value="PUBLIC"/>  
      <field name="ft_t_issu.iss_actvy_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_issu.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
    </defaultFields></occurrence>  
  <occurrence extends="IEDFBDEBT" table="ft_t_iedf" id="IEDFBDEBT" parentId="BASEISSU" level="3" label="Coupon Details/Spread Details"> 
    <inputFields> 
      <field name="ft_t_iedf.frst_rte_reset_tms"/>  
      <field name="ft_t_iedf.mx_crte"/>  
      <field name="ft_t_iedf.mn_crte"/>  
      <field name="ft_t_iedf.flt_mltplr_crte"/>  
      <field name="ft_t_iedf.prd_end_dy_aj_qty"/> 
    <field name="ft_t_iedf.days_yr_bas_typ" level="3"/><field name="ft_t_iedf.days_mth_bas_typ" level="3"/><field name="ft_t_iedf.rtfx_fq_sp_typ"/><field name="ft_t_iedf.rtfx_fq_qty"/><field name="ft_t_iedf.rtfx_fq_dy_typ"/><field name="ft_t_iedf.flt_bas_pt_cqty"/><field name="ft_t_iedf.first_py_tms"/><field name="ft_t_iedf.py_dte_fq_qty"/><field name="ft_t_iedf.py_dte_fq_dy_typ"/><field name="ft_t_iedf.py_dte_fq_sp_typ"/></inputFields> 
  <where> 
      <field name="ft_t_iedf.ev_typ" dataType="STRING" value="INTEREST"/> 
    </where><defaultFields> 
      <field name="ft_t_iedf.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_iedf.verif_ind" dataType="STRING" value="N"/> 
    </defaultFields></occurrence>  
  <occurrence table="ft_t_lmch" id="LMCHBDEBT" parentId="BASEISSU" label="LMCHBDEBT"> 
    <inputFields> 
      <field name="ft_t_lmch.deal_typ"/>  
      <field name="ft_t_lmch.mtge_typ"/>  
      <field name="ft_t_lmch.amort_typ"/>  
      <field name="ft_t_lmch.prepay_modl_typ"/>  
      <field name="ft_t_lmch.tranche_typ"/>  
      <field name="ft_t_lmch.cleanup_call_cpct"/> 
    </inputFields> 
  </occurrence>  
  <occurrence table="ft_t_lmst" id="LMSTBDEBT" parentId="BASEISSU" label="LMSTBDEBT"> 
    <inputFields> 
      <!--<field name="ft_t_lmst.orig_prin_camt"/>  -->
      <field name="ft_t_lmst.prin_dist_camt"/>  
      <field name="ft_t_lmst.warm_mth_qty"/>  
      <field name="ft_t_lmst.calc_wala_cqty"/>  
      <field name="ft_t_lmst.est_accrl_crte"/>  
      <field name="ft_t_lmst.loan_age_qty"/>  
      <field name="ft_t_lmst.loan_mrgn_crte"/>  
      <field name="ft_t_lmst.wag_crte"/>  
      <field name="ft_t_lmst.fact_in_pay_camt"/>  
      <field name="ft_t_lmst.fact_prin_pay_camt"/>  
      <field name="ft_t_lmst.fact_prd_end_dte"/>  
      <field name="ft_t_lmst.fact_prd_strt_dte"/>  
      <field name="ft_t_lmst.amort_wam_cqty"/>  
      <field name="ft_t_lmst.pool_psa_crte"/>  
      <field name="ft_t_lmst.calc_wag_camt"/>  
      <field name="ft_t_lmst.wal_cqty"/>  
      <field name="ft_t_lmst.crrnt_factor_dte"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_lmst.stats_curr_cde" dataType="STRING" srcOccurrence="BASEISSU" valueOf="ft_t_issu.denom_curr_cde"/>  
      <field name="ft_t_lmst.stats_eff_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields> 
  </occurrence>  
  <occurrence table="ft_t_isll" id="ISLLBDEBT" parentId="BASEISSU" label="Collateral Type" multiple="false"> 
    <inputFields> 
      <field name="ft_t_isll.coll_typ"/>  
      <field name="ft_t_isll.start_tms"/>  
      <field name="ft_t_isll.coll_grp_desc"/>  
      <!--<field name="ft_t_isll.iss_coll_nme"/>--> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isll.iss_coll_nme" valueOf="ft_t_isll.coll_typ" srcOccurrence="ISLLBDEBT" dataType="STRING"/>  
      <field name="ft_t_isll.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields> 
  </occurrence>  
  <occurrence extends="BDCHBDEBT" table="ft_t_bdch" id="BDCHBDEBT" parentId="BASEISSU" label="Issue Details/Coupon Details" level="3"><inputFields> 
      <field name="ft_t_bdch.mn_denom_camt" level="3"/>  
      <field name="ft_t_bdch.call_typ"/>  
      <field name="ft_t_bdch.put_typ"/>  
      <field name="ft_t_bdch.cpn_typ"/>  
      <field name="ft_t_bdch.dted_tms"/>  
      <field name="ft_t_bdch.in_pay_typ"/>  
      <field name="ft_t_bdch.sink_fund_typ"/>  
      <field name="ft_t_bdch.yld_calc_typ"/> 
    </inputFields></occurrence>  
  <!--Added by Sameer for Prepayment Section-->  
  <occurrence table="ft_t_pedf" id="PEDFASSET" parentId="BASEISSU" autoDelete="false"> 
    <where> 
      <field name="ft_t_pedf.ev_typ" dataType="STRING" value="FACTOR"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_pedf.verif_ind" dataType="STRING" value="N"/>  
      <field name="ft_t_pedf.start_tms" valueOfFunction="CURRTMS" dataType="DATETIME"/> 
    </defaultFields> 
  </occurrence>  
  <occurrence table="ft_t_iscm" id="ISCMORIGBDEBT" parentId="BASEISSU" autoDelete="false" label="Issue Details"> 
    <inputFields> 
      <field name="ft_t_iscm.cmnt_txt"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_iscm.ln_num" dataType="NUMBER" value="1"/>  
      <field name="ft_t_iscm.cmnt_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_iscm.cmnt_reas_typ" dataType="STRING" value="BBMTGSERV"/> 
    </where> 
  </occurrence>  
  <occurrence table="ft_t_pevp" id="PEVPASSET" parentId="PEDFASSET" autoDelete="false"> 
    <defaultFields> 
      <field name="ft_t_pevp.start_tms" dataType="DATETIME" srcOccurrence="PEDFASSET" valueOf="ft_t_pedf.start_tms"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_pevp.prt_purp_typ" dataType="STRING" value="FACTOR"/> 
    </where> 
  </occurrence>  
  <occurrence table="ft_t_ppdf" id="PPDFASSET" parentId="PEVPASSET" label="Prepayment Details" autoDelete="false"> 
    <defaultFields> 
      <field name="ft_t_ppdf.start_tms" dataType="DATETIME" srcOccurrence="PEDFASSET" valueOf="ft_t_pedf.start_tms"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_instr_id" label="Prepayment Currency"/>  
      <field name="ft_t_ppdf.start_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_ppdf.ev_rate_bas_typ" dataType="STRING" value="PAR VAL"/>  
      <field name="ft_t_ppdf.ev_rate_typ" dataType="STRING" value="FACTOR"/>  
      <field name="ft_t_ppdf.iss_part_rl_typ" dataType="STRING" value="RECEIVE"/> 
    </where> 
  </occurrence>  
  <occurrence extends="UWCHBDEBT" table="ft_t_uwch" id="UWCHBDEBT" parentId="BASEISSU" label="Issue Details" autoDelete="false"> 
    <inputFields> 
      <field name="ft_t_uwch.offer_increment_camt"/>  
      <field name="ft_t_uwch.offer_cprc"/> 
    <field name="ft_t_uwch.offer_camt"/><field name="ft_t_uwch.first_settle_dte"/></inputFields> 
  <where> 
      <field name="ft_t_uwch.offer_num" dataType="NUMBER" value="1"/> 
    </where><defaultFields> 
      <field name="ft_t_uwch.offer_curr_cde" dataType="STRING" srcOccurrence="BASEISSU" valueOf="ft_t_issu.denom_curr_cde"/>  
      <field name="ft_t_uwch.offer_tms" dataType="DATETIME" srcOccurrence="UWCHBDEBT" valueOf="ft_t_uwch.anncmnt_dte"/> 
    </defaultFields></occurrence>  
  <occurrence table="ft_t_uwst" id="UWSTBDEBT" parentId="UWCHBDEBT" label="UNDERSTAT" autoDelete="false"> 
    <defaultFields> 
      <field name="ft_t_uwst.stats_eff_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_uwst.orig_wac_camt"/>  
      <field name="ft_t_uwst.orig_wam_qty"/>  
      <field name="ft_t_uwst.orig_wal_cqty"/> 
    </inputFields> 
  </occurrence>  
  <occurrence extends="BDSTBDEBT" table="ft_t_bdst" id="BDSTBDEBT" parentId="BASEISSU" label="Issue Details/Coupon Details"> 
    <inputFields> 
      <field name="ft_t_bdst.nxt_call_dte"/>  
      <field name="ft_t_bdst.last_reset_tms"/>  
      <field name="ft_t_bdst.nxt_refix_dte"/> 
    <field name="ft_t_bdst.outst_camt"/><field name="ft_t_bdst.prev_cpn_dte"/><field name="ft_t_bdst.nxt_cpn_dte"/><field name="ft_t_bdst.cpn_crte"/><field name="ft_t_bdst.stats_eff_tms"/><field name="ft_t_bdst.crrnt_iss_camt"/></inputFields> 
  <where> 
      <field name="ft_t_bdst.latest_bdst" dataType="STRING" value="Y"/> 
    </where><defaultFields> 
      <field name="ft_t_bdst.stats_eff_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_bdst.real_first_py_tms" dataType="DATETIME" srcOccurrence="IEDFBDEBT" valueOf="ft_t_iedf.first_py_tms" keepInSync="true"/> 
    </defaultFields></occurrence>  
  <occurrence extends="ISRTBISSU" table="ft_t_isrt" id="ISRTBISSU" parentId="BASEISSU" multiple="true" label="Rating"> 
    <inputFields> 
      <field name="ft_t_isrt.data_src_id"/> 
    <field name="ft_t_isrt.rtng_curr_typ"/><field name="ft_t_isrt.rtng_purp_typ"/><field name="ft_t_isrt.rtng_set_oid"/><field name="ft_t_isrt.rtng_cde"/><field name="ft_t_isrt.start_tms"/><field name="ft_t_isrt.rtng_eff_tms"/></inputFields> 
  <defaultFields> 
      <field name="ft_t_isrt.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>       
    </defaultFields></occurrence>  
  <occurrence table="ft_t_isst" id="ISST_MTGPDOFF" parentId="BASEISSU" label="Instrument Status" autoDelete="true"> 
    <defaultFields> 
      <field name="ft_t_isst.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_isst.stat_def_id" dataType="STRING" valueOf="ft_t_stdf.stat_def_id"> 
        <where> 
          <field name="ft_t_stdf.stat_def_id" dataType="STRING" value="MTGPDOFF"/> 
        </where> 
      </field> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_isst.stat_char_val_txt"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_isst.stat_def_id" dataType="STRING" value="MTGPDOFF"/> 
    </where> 
  </occurrence>  
  <occurrence table="ft_t_isst" id="ISST_BBMTGTST" parentId="BASEISSU" label="Trustee" autoDelete="true"> 
    <defaultFields> 
      <field name="ft_t_isst.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_isst.stat_def_id" dataType="STRING" valueOf="ft_t_stdf.stat_def_id"> 
        <where> 
          <field name="ft_t_stdf.stat_def_id" dataType="STRING" value="BBMTGTST"/> 
        </where> 
      </field> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_isst.stat_char_val_txt"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_isst.stat_def_id" dataType="STRING" value="BBMTGTST"/> 
    </where> 
  </occurrence>  
  <occurrence table="ft_t_isst" id="ISST_BBMTGSRV" parentId="BASEISSU" label="Servicer" autoDelete="true"> 
    <defaultFields> 
      <field name="ft_t_isst.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_isst.stat_def_id" dataType="STRING" valueOf="ft_t_stdf.stat_def_id"> 
        <where> 
          <field name="ft_t_stdf.stat_def_id" dataType="STRING" value="BBMTGSRV"/> 
        </where> 
      </field> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_isst.stat_char_val_txt"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_isst.stat_def_id" dataType="STRING" value="BBMTGSRV"/> 
    </where> 
  </occurrence>  
  <occurrence table="ft_t_isst" id="ISST_MTGCLNME" parentId="BASEISSU" label="Tranche Class" autoDelete="true"> 
    <defaultFields> 
      <field name="ft_t_isst.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_isst.stat_def_id" dataType="STRING" valueOf="ft_t_stdf.stat_def_id"> 
        <where> 
          <field name="ft_t_stdf.stat_def_id" dataType="STRING" value="MTGCLNME"/> 
        </where> 
      </field> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_isst.stat_char_val_txt"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_isst.stat_def_id" dataType="STRING" value="MTGCLNME"/> 
    </where> 
  </occurrence>  
  <!--<occurrence table="ft_t_isst" id="ISST_MTGFTRDT" parentId="BASEISSU" label="Factor Date" autoDelete="true">
    <defaultFields>
      <field name="ft_t_isst.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>
      <field name="ft_t_isst.stat_def_id" dataType="STRING" valueOf="ft_t_stdf.stat_def_id">
        <where>
          <field name="ft_t_stdf.stat_def_id" dataType="STRING" value="MTGFTRDT"/>
        </where>
      </field>
    </defaultFields>
    <inputFields>
      <field name="ft_t_isst.stat_val_dte"/>
    </inputFields>
    <where>
      <field name="ft_t_isst.stat_def_id" dataType="STRING" value="MTGFTRDT"/>
    </where>
  </occurrence>-->  
  <occurrence table="ft_t_lmst" id="LMST_FACTOR" parentId="BASEISSU" label="Factor Date" dbConstraint="latestlmst"> 
    <defaultFields> 
      <field name="ft_t_lmst.stats_eff_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_lmst.crrnt_factor_dte"/> 
    </inputFields> 
  </occurrence>  
  <occurrence table="ft_t_isst" id="ISST_CPNASFDT" parentId="BASEISSU" label="ISST_CPNASFDT" autoDelete="true"> 
    <defaultFields> 
      <field name="ft_t_isst.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_isst.stat_def_id" dataType="STRING" valueOf="ft_t_stdf.stat_def_id"> 
        <where> 
          <field name="ft_t_stdf.stat_def_id" dataType="STRING" value="CPNASFDT"/> 
        </where> 
      </field> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_isst.stat_val_dte"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_isst.stat_def_id" dataType="STRING" value="CPNASFDT"/> 
    </where> 
  </occurrence>  
  <occurrence table="ft_t_irst" id="IRST_BBTICKER" parentId="ISSR" label="Ticker" dbConstraint="irstf002"> 
    <defaultFields> 
      <field name="ft_t_irst.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_irst.stat_char_val_txt"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_irst.stat_def_id" dataType="STRING" value="BBTICKER"/> 
    </where> 
  </occurrence>  
  <occurrence table="ft_t_isst" id="ISST_MTGWALMT" parentId="BASEISSU" label="Current Average Life" autoDelete="true"> 
    <defaultFields> 
      <field name="ft_t_isst.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_isst.stat_def_id" dataType="STRING" valueOf="ft_t_stdf.stat_def_id"> 
        <where> 
          <field name="ft_t_stdf.stat_def_id" dataType="STRING" value="MTGWALMT"/> 
        </where> 
      </field> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_isst.stat_val_camt"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_isst.stat_def_id" dataType="STRING" value="MTGWALMT"/> 
    </where> 
  </occurrence>  
  <!--Added the below occurences since Exchange level Summary has been added for COVTBOND-->  
  <occurrence extends="MKISPMBISSU" table="ft_t_mkis" id="MKISPMBISSU" parentId="BASEISSU" multiple="false" label="Market Details"> 
    <inputFields> 
      <field name="ft_t_mkis.mkt_oid" label="Primary Exchange Name"/>  
      <field name="ft_t_mkis.norm_mkt_sz_cqty" label="Quote Lot Size"/>  
      <field name="ft_t_mkis.trdng_stat_typ" label="Market Status"/>  
      <field name="ft_t_mkis.actively_traded_ind"/> 
    <field name="ft_t_mkis.iss_prc_ut_camt"/><field name="ft_t_mkis.rnd_lot_sz_cqty"/><field name="ft_t_mkis.trdng_curr_cde"/></inputFields> 
  <validationRules> 
      <rule id="Warning" messageType="WARNING"> 
        <xPath value="boolean(string-length(%modelPath:MKISPMBISSU:ft_t_mkis.end_tms%)= 0 or string-length(%modelPath:MKISPMBISSU:ft_t_mkis.end_tms%) <  ''SYSDATE()'')"/>  
        <errorMessage value="Primary Market is end dated"/> 
      </rule> 
    </validationRules><where> 
      <field name="ft_t_mkis.prim_trd_mkt_ind" dataType="STRING" value="Y"/> 
    </where><defaultFields> 
      <!--<field name="ft_t_mkis.trdng_stat_typ" dataType="STRING" value="ACTIVE"/>  
      -->  
      <field name="ft_t_mkis.prc_ut_meas_typ" dataType="STRING" value="NOMINAL"/>  
      <!--<field name="ft_t_mkis.mkt_iss_oid" dataType="STRING" valueOfFunction="OID" uiOnly="true"/> 
      --> 
    </defaultFields></occurrence>  
  <occurrence extends="MIXR_PRIM" table="ft_t_mixr" id="MIXR_PRIM" parentId="MKISPMBISSU" label=" Market Issue Cross Reference ((Primary)" dbConstraint="MKISMIXR"><defaultFields> 
      <field name="ft_t_mixr.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
      <field name="ft_t_mixr.trdng_stat_typ" dataType="STRING" srcOccurrence="MKISPMBISSU" valueOf="ft_t_mkis.trdng_stat_typ"/> 
    </defaultFields></occurrence>  
  <occurrence extends="MKISDEFBISSU" table="ft_t_mkis" id="MKISDEFBISSU" parentId="BASEISSU" autoCreate="false" multiple="true"> 
    <inputFields> 
      <field name="ft_t_mkis.trdng_stat_typ" label="Market Status"/>  
      <field name="ft_t_mkis.actively_traded_ind"/>  
      <field name="ft_t_mkis.norm_mkt_sz_cqty" label="Quote Lot Size"/>  
      <field name="ft_t_mkis.mrgn_sec_ind" label="Marginable"/>  
      <field name="ft_t_mkis.settle_curr_cde"/>  
      <field name="ft_t_mkis.trd_lot_size_cqty"/>  
      <field name="ft_t_mkis.prim_trd_mkt_ind" label="Primary Exchange"/>  
      <field name="ft_t_mkis.prc_curr_cde" label="Quotation Currency"/>  
      <field name="ft_t_mkis.mkt_oid" label="Exchange Name"/> 
    <field name="ft_t_mkis.trdng_curr_cde"/><field name="ft_t_mkis.iss_prc_ut_camt"/><field name="ft_t_mkis.rnd_lot_sz_cqty"/><field name="ft_t_mkis.gu_id" label="Trading Country"/><field name="ft_t_mkis.opol_ind"/></inputFields>  
    <!--<defaultFields>
			<field name="ft_t_mkis.prim_trd_mkt_ind" dataType="STRING" value="N"/>
		</defaultFields>--> 
  <defaultFields>         
      <!--<field name="ft_t_mkis.trdng_stat_typ" value="ACTIVE" dataType="STRING"/>  
      -->  
      <field name="ft_t_mkis.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_mkis.last_chg_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_mkis.last_chg_usr_id" dataType="STRING" valueOfFunction="APPUSER"/> 
    </defaultFields></occurrence>  
  <occurrence extends="MIXRBISSU" table="ft_t_mixr" id="MIXRBISSU" parentId="MKISDEFBISSU" multiple="true" dbConstraint="MKISMIXR"><defaultFields> 
      <field name="ft_t_mixr.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>          
      <field name="ft_t_mixr.trdng_stat_typ" dataType="STRING" srcOccurrence="MKISDEFBISSU" valueOf="ft_t_mkis.trdng_stat_typ"/>  
      <field name="ft_t_mixr.last_chg_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_mixr.last_chg_usr_id" dataType="STRING" valueOfFunction="APPUSER"/> 
    </defaultFields><inputFields> 
      <field name="ft_t_mixr.end_tms"/> 
    </inputFields></occurrence>  
  <presentation> 
    <until level="100"> 
      <override class="codf" rendered="false"/>  
      <override class="eqch" rendered="false"/>  
      <override class="mnch" rendered="false"/>  
      <override class="fnch" rendered="false"/>  
      <override class="ench" rendered="false"/> 
    </until> 
  </presentation> 
<occurrence table="ft_t_isgu" id="ISGUBDEBT" parentId="BASEISSU" label="Issue Details"> 
    <inputFields> 
      <field name="ft_t_isgu.gu_cnt"/>  
      <field name="ft_t_isgu.gu_id"/>  
      <field name="ft_t_isgu.gu_typ"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isgu.start_tms" dataType="DATETIME" srcOccurrence="BASEISSU" valueOf="ft_t_issu.start_tms"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_isgu.iss_gu_purp_typ" dataType="STRING" value="DOMICILE"/> 
    </where> 
  </occurrence><occurrence table="ft_t_isst" id="ISSTBDEBT" parentId="BASEISSU" label="Issue Details" autoDelete="true"> 
    <defaultFields> 
      <field name="ft_t_isst.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_isst.stat_def_id" dataType="STRING" valueOf="ft_t_stdf.stat_def_id"> 
        <where> 
          <field name="ft_t_stdf.stat_def_id" dataType="STRING" value="CTRYGUAR"/> 
        </where> 
      </field> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_isst.stat_char_val_txt"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_isst.stat_def_id" dataType="STRING" value="CTRYGUAR"/> 
    </where> 
  </occurrence><occurrence table="ft_t_iscm" id="ISCMGUARBDEBT" parentId="BASEISSU" label="Issue Details"> 
    <defaultFields> 
      <field name="ft_t_iscm.ln_num" dataType="NUMBER" value="1"/>  
      <field name="ft_t_iscm.cmnt_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_iscm.cmnt_txt"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_iscm.cmnt_reas_typ" dataType="STRING" value="GUARNTOR"/> 
    </where> 
  </occurrence><occurrence table="ft_t_iscm" id="ISCMLEADBDEBT" parentId="BASEISSU" label="Issue Details"> 
    <inputFields> 
      <field name="ft_t_iscm.cmnt_txt"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_iscm.ln_num" dataType="NUMBER" value="1"/>  
      <field name="ft_t_iscm.cmnt_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_iscm.cmnt_reas_typ" dataType="STRING" value="LEADMGR"/> 
    </where> 
  </occurrence><occurrence table="ft_t_ievp" id="IEVPBDEBT" parentId="IEDFBDEBT" label="Income Event Participant"> 
    <defaultFields> 
      <field name="ft_t_ievp.start_tms" dataType="DATETIME" srcOccurrence="IEDFBDEBT" valueOf="ft_t_iedf.start_tms" keepInSync="true"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_pedf" id="PEDFBDEBT" parentId="BASEISSU" autoDelete="false"> 
    <where> 
      <field name="ft_t_pedf.ev_typ" dataType="STRING" value="REDEMPT"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_pedf.verif_ind" dataType="STRING" value="N"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_pedf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_pevp" id="PEVPBDEBT" parentId="PEDFBDEBT" autoDelete="false"> 
    <defaultFields> 
      <field name="ft_t_pevp.start_tms" dataType="DATETIME" srcOccurrence="PEDFBDEBT" valueOf="ft_t_pedf.start_tms" keepInSync="true"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_pevp.prt_purp_typ" dataType="STRING" value="REDEMPT"/> 
    </where> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDFBDEBT" parentId="PEVPBDEBT" label="Redemption" autoDelete="false"> 
    <defaultFields> 
      <!--<field name="ft_t_ppdf.start_tms" dataType="DATETIME" srcOccurrence="PEDFBDEBT" valueOf="ft_t_pedf.start_tms" keepInSync="true"/>-->  
      <field name="ft_t_ppdf.prin_pay_def_id" dataType="STRING" valueOfFunction="OID"/>  
      <field name="ft_t_ppdf.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_instr_id" label="Redemption Currency"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms" dataType="DATETIME"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_ppdf.ev_rate_bas_typ" dataType="STRING" value="PAR VAL"/>  
      <field name="ft_t_ppdf.ev_rate_typ" dataType="STRING" value="PERCENT"/>  
      <field name="ft_t_ppdf.iss_part_rl_typ" dataType="STRING" value="RECEIVE"/> 
    </where> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDFBDEBT_AMT" parentId="PEVPBDEBT" label="Redemption" autoDelete="false"> 
    <defaultFields> 
      <field name="ft_t_ppdf.prin_pay_def_id" dataType="STRING" valueOfFunction="OID"/>  
      <field name="ft_t_ppdf.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <!--<field name="ft_t_ppdf.ev_instr_id" dataType="STRING" srcOccurrence="PPDFBDEBT" valueOf="ft_t_ppdf.ev_instr_id"/>-->  
      <!--<field name="ft_t_ppdf.pay_curr_cde" dataType="STRING" srcOccurrence="PPDFBDEBT" valueOf="ft_t_ppdf.pay_curr_cde" keepInSync="true"/>--> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.ev_instr_id" label="Redemption Currency"/>  
      <field name="ft_t_ppdf.ev_crte" dataType="NUMBER"/>  
      <field name="ft_t_ppdf.start_tms" dataType="DATETIME"/>
    </inputFields>  
    <where> 
      <field name="ft_t_ppdf.ev_rate_bas_typ" dataType="STRING" value="PAR VAL"/>  
      <field name="ft_t_ppdf.ev_rate_typ" dataType="STRING" value="AMOUNT"/>  
      <field name="ft_t_ppdf.iss_part_rl_typ" dataType="STRING" value="RECEIVE"/> 
    </where> 
  </occurrence><occurrence table="ft_t_ismc" id="ISMC_PRNT" parentId="BASEISSU" autoDelete="false"> 
    <where activeOnly="true"> 
      <field name="ft_t_ismc.capital_typ" value="OUTSTAND" dataType="STRING"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_ismc.cap_chg_eff_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_isll" id="ISLL_SUB" parentId="BASEISSU"> 
    <inputFields> 
      <field name="ft_t_isll.iss_coll_nme" dataType="STRING"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_isll.coll_typ" dataType="STRING" value="Subordinated"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_isll.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_isll" id="ISLL_SEC" parentId="BASEISSU"> 
    <inputFields> 
      <field name="ft_t_isll.iss_coll_nme" dataType="STRING"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_isll.coll_typ" dataType="STRING" value="Secured"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_isll.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_isll" id="ISLL_GRP_MBS" parentId="BASEISSU"> 
    <inputFields> 
      <field name="ft_t_isll.coll_grp_desc" dataType="STRING"/>  
      <field name="ft_t_isll.iss_coll_nme" dataType="STRING"/>  
      <field name="ft_t_isll.coll_typ" dataType="STRING"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_isll.coll_typ" dataType="STRING" value="Mortgage Backed"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_isll.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_isll" id="ISLL_GRP_ABS" parentId="BASEISSU"> 
    <inputFields> 
      <field name="ft_t_isll.coll_grp_desc" dataType="STRING"/>  
      <field name="ft_t_isll.iss_coll_nme" dataType="STRING"/>  
      <field name="ft_t_isll.coll_typ" dataType="STRING"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_isll.coll_typ" dataType="STRING" value="Asset Backed"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_isll.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_iscl" id="ISCL_MIZUNIQE" parentId="BASEISSU" label="Uniqueness"> 
    <inputFields> 
      <field name="ft_t_iscl.cl_value" dataType="STRING"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_iscl.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_iscl.indus_cl_set_id" dataType="STRING" value="MIZUNIQE"/> 
    </where> 
  </occurrence><occurrence table="ft_t_frip" id="FRIP_CSTM" parentId="BASEISSU"> 
    <where> 
      <field name="ft_t_frip.finsrl_typ" dataType="STRING" value="GUARNTOR"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_frip.prt_purp_typ" dataType="STRING" value="GUARANTR"/>  
      <field name="ft_t_frip.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_frip.inst_mnem" dataType="STRING"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_isgp" id="ISGP_CSTM" parentId="BASEISSU" dbConstraint="isgpf002"> 
    <where> 
      <field name="ft_t_isgp.prt_purp_typ" dataType="STRING" value="ISIDGRP"/>  
      <field name="ft_t_isgp.prnt_iss_grp_oid" dataType="STRING" valueOf="ft_t_isgr.iss_grp_oid"> 
        <where> 
          <field name="ft_t_isgr.grp_nme" value="FCY" dataType="STRING"/> 
        </where> 
      </field> 
    </where>  
    <defaultFields> 
       
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_isgp.instr_id" dataType="STRING"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_ridf" id="RIDF_CSTM" parentId="BASEISSU"> 
    <where> 
      <field name="ft_t_ridf.rel_typ" dataType="STRING" value="CreditLinked"/> 
    </where>  
    <defaultFields>       
      <field name="ft_t_ridf.rel_desc" dataType="STRING" value="CreditLinked"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_riss" id="RISS_CSTM" parentId="RIDF_CSTM"> 
    <defaultFields> 
      <field name="ft_t_riss.part_units_typ" dataType="STRING" value="ALL"/>  
      <field name="ft_t_riss.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_riss.iss_part_rl_typ" dataType="STRING" value="UNDLYING"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_riss.instr_id" dataType="STRING"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_isde" id="ISDEBISSU" parentId="BASEISSU" label="Issue Description" level="1"> 
    <defaultFields> 
      <field name="ft_t_isde.desc_srce_typ" dataType="STRING" value="INHOUSE"/>  
      <field name="ft_t_isde.nls_cde" dataType="STRING" value="ENGLISH"/>  
      <field name="ft_t_isde.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_isde.iss_nme" label="Instrument Name" level="1"/>  
      <field name="ft_t_isde.start_tms"/>  
      <field name="ft_t_isde.iss_desc" label="Instrument Description"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_isde.desc_usage_typ" dataType="STRING" value="PRIMARY"/> 
    </where> 
  </occurrence><occurrence table="ft_t_isde" id="ISDE_VENDOR" parentId="BASEISSU" label="Issue Description"> 
    <defaultFields> 
      <field name="ft_t_isde.nls_cde" dataType="STRING" value="ENGLISH"/>  
      <field name="ft_t_isde.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_isde.iss_nme" label="Instrument Name"/>  
      <field name="ft_t_isde.start_tms"/>  
      <field name="ft_t_isde.iss_desc" label="Instrument Description"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_isde.desc_srce_typ" dataType="STRING" value="VENDOR"/> 
    </where> 
  </occurrence><occurrence table="ft_t_isid" id="ISID_Iss_level" parentId="BASEISSU" label="Issue Identifiers" multiple="true" dbConstraint="ISSUISID"> 
    <inputFields> 
      <field name="ft_t_isid.iss_id" label="Identifier Value"/>  
      <field name="ft_t_isid.id_ctxt_typ" label="Identifier Type"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <validationRules> 
      <rule id="ISINMarket"> 
        <xPath value="boolean(not(%modelPath:ISID_Iss_level:ft_t_isid.id_ctxt_typ% =''ISIN'' and not(string-length(%modelPath:ISID_Iss_level:ft_t_isid.mkt_oid%) = 0)))"/>  
        <errorMessage value="ISIN identifier cannot have market."/> 
      </rule>  
      <!--<rule id="ISSUTXTTYPNOTSUPPORTED" messageType="WARNING"> 
	   <xPath value="boolean(not(%modelPath:ISID_Iss_level%/intlvlid_supported=''0''))"/>
          <errorMessageXPath value="concat(%modelPath:ISID_Iss_level:ft_t_isid.id_ctxt_typ%,'' is no longer supported as a valid Instrument Level Identifier. Please take necessary action.'')"/>
		 </rule>--> 
    </validationRules> 
  </occurrence><occurrence table="ft_t_isid" id="ISID_MKT_Iss_level_PUB" parentId="BASEISSU" label="Global Market Identifiers pub" multiple="true" dbConstraint="MRKTISIDPUB"> 
    <!-- <where> 
      <field name="ft_t_isid.mkt_oid" dataType="STRING" isNull="false"/> 
    </where> -->  
    <inputFields> 
      <field name="ft_t_isid.iss_id" label="Identifier Value"/>  
      <field name="ft_t_isid.id_ctxt_typ" label="Identifier Type"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <validationRules> 
      <rule id="ISINMarket"> 
        <xPath value="boolean(not(%modelPath:ISID_MKT_Iss_level_PUB:ft_t_isid.id_ctxt_typ% =''ISIN'' and not(string-length(%modelPath:ISID_MKT_Iss_level_PUB:ft_t_isid.mkt_oid%) = 0)))"/>  
        <errorMessage value="ISIN identifier cannot have market."/> 
      </rule> 
    </validationRules> 
  </occurrence><occurrence table="ft_t_isid" id="ISIDBISIN" parentId="BASEISSU" label="Identifiers"> 
    <inputFields> 
      <field name="ft_t_isid.iss_id"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_isid.id_ctxt_typ" dataType="STRING" value="ISIN"/> 
    </where> 
  </occurrence><occurrence table="ft_t_isid" id="ISIDBINH" parentId="BASEISSU" label="Identifiers"> 
    <inputFields> 
      <field name="ft_t_isid.iss_id"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_isid.id_ctxt_typ" dataType="STRING" value="INHOUSE"/> 
    </where> 
  </occurrence><occurrence table="ft_t_isid" id="ISIDBCUS" parentId="BASEISSU" label="Identifiers"> 
    <inputFields> 
      <field name="ft_t_isid.iss_id"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_isid.id_ctxt_typ" dataType="STRING" value="CUSIP"/> 
    </where> 
  </occurrence><occurrence table="ft_t_isid" id="ISIDBCOM" parentId="BASEISSU" label="Identifiers"> 
    <inputFields> 
      <field name="ft_t_isid.iss_id"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_isid.id_ctxt_typ" dataType="STRING" value="COMMON"/> 
    </where> 
  </occurrence><occurrence table="ft_t_isid" id="ISIDVAL" parentId="BASEISSU" label="Identifiers"> 
    <inputFields> 
      <field name="ft_t_isid.iss_id"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_isid.id_ctxt_typ" dataType="STRING" value="VALOREN"/> 
    </where> 
  </occurrence><occurrence table="ft_t_iscl" id="ISCL_INSUBTYP" parentId="BASEISSU" label="Issue Classification" dbConstraint="SUBTYPE" multiple="false"> 
    <where> 
      <field name="ft_t_iscl.clsf_purp_typ" dataType="STRING" value="INSUBTYP"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_iscl.cl_value" label="Instrument Sub-Type"/>  
      <field name="ft_t_iscl.indus_cl_set_id"/>  
      <field name="ft_t_iscl.clsf_oid"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_iscl.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_fnch" id="FNCH_ALL" parentId="BASEISSU" label="Fund Characteristics"> 
    <defaultFields> 
      <!--<field name="ft_t_fnch.chars_eff_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>-->        
    </defaultFields> 
  </occurrence><occurrence table="ft_t_iscm" id="ISCMBISSU" parentId="BASEISSU" label="Comments"> 
    <defaultFields> 
      <field name="ft_t_iscm.cmnt_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_iscm.ln_num" dataType="NUMBER" value="1"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_iscm.cmnt_txt"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_iscm.cmnt_reas_typ" dataType="STRING" value="COMMENT"/> 
    </where> 
  </occurrence><occurrence table="ft_t_rgch" id="RGCHBISSU" parentId="BASEISSU" label="Regulatory Information"> 
    <inputFields> 
      <field name="ft_t_rgch.gu_id"/>  
      <field name="ft_t_rgch.gu_cnt"/>  
      <field name="ft_t_rgch.gu_typ"/>  
      <field name="ft_t_rgch.isma_regulated_ind"/>  
      <field name="ft_t_rgch.rule_144a_ind"/>  
      <field name="ft_t_rgch.reg_s_ind"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_rgch.start_tms" dataType="DATETIME" srcOccurrence="BASEISSU" valueOf="ft_t_issu.start_tms"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_isid" id="ISID_TIC_PM_PUB" parentId="MIXR_PRIM" label="Issue Identifier-Ticker" dbConstraint="MIXRISIDPUB"> 
    <where> 
      <field name="ft_t_isid.id_ctxt_typ" dataType="STRING" value="TICKER"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_isid.iss_id" label="Primary Ticker"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isid.isid_oid" dataType="STRING" srcOccurrence="MIXR_PRIM" valueOf="ft_t_mixr.isid_oid"/>  
      <field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_isid.mkt_oid" dataType="STRING" srcOccurrence="MKISPMBISSU" valueOf="ft_t_mkis.mkt_oid"/>  
      <field name="ft_t_isid.instr_id" dataType="STRING" srcOccurrence="BASEISSU" valueOf="ft_t_issu.instr_id"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_isxr" id="BISSU_ISXR_ISID" parentId="LISTISID_BISSU" multiple="true" autoDelete="false"> 
    <where> 
      <field name="ft_t_isxr.isid_oid" dataType="STRING" srcOccurrence="LISTISID_BISSU" valueOf="ft_t_isid.isid_oid"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_isxr.last_chg_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_isxr.last_chg_usr_id" dataType="STRING" valueOfFunction="APPUSER"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_isxr.isxr_rel_purp_typ"/>  
      <field name="ft_t_isxr.start_tms"/>  
      <field name="ft_t_isxr.end_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_must" id="MUST_MICOPOL" parentId="MKISDEFBISSU" autoDelete="false"> 
    <where> 
      <field name="ft_t_must.stat_def_id" dataType="STRING" value="MICOPOL"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_must.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_must.stat_char_val_txt" label="OPOL"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_must" id="MUST_CDREXCH" parentId="MKISDEFBISSU" autoDelete="false"> 
    <where> 
      <field name="ft_t_must.stat_def_id" dataType="STRING" value="CDREXCH"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_must.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_must.stat_char_val_txt" label="Exchange Calendar"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_ispc" id="ISPCBISSU" parentId="BASEISSU" label="Issue Price Details"> 
    <inputFields> 
      <field name="ft_t_ispc.prc_typ"/>  
      <field name="ft_t_ispc.prc_srce_typ"/>  
      <field name="ft_t_ispc.prc_tms"/>  
      <field name="ft_t_ispc.unit_cprc"/>  
      <field name="ft_t_ispc.prc_curr_cde"/> 
    </inputFields>  
    <defaultFields> 
      <!--      <field name="ft_t_ispc.prc_curr_cde" dataType="STRING" srcOccurrence="BASEISSU" valueOf="ft_t_issu.denom_curr_cde"/>  -->  
      <field name="ft_t_ispc.prc_qt_meth_typ" dataType="STRING" value="1"/>  
      <field name="ft_t_ispc.prc_valid_typ" dataType="STRING" value="VALID"/>  
      <field name="ft_t_ispc.prcng_meth_typ" dataType="STRING" value="1"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_ievp" id="IEVP_DIV_or_INT" parentId="IEDF_DIV_or_INT" label="Income Event Participant(Dividend/Interest)"> 
    <defaultFields> 
      <field name="ft_t_ievp.prt_purp_typ" dataType="STRING" value="PMTDTLS"/>  
      <field name="ft_t_ievp.start_tms" dataType="DATETIME" srcOccurrence="IEDF_DIV_or_INT" valueOf="ft_t_iedf.start_tms"/> 
    </defaultFields>  
    <!--<validationRules>
			<rule id="Unique_IPDF">
				<xPath value="is-unique(%modelPath:IPDF_DIV_or_INT%, &quot;concat(ipdf.pay_curr_cde, substring((ipdf.start_tms), 1, 10))&quot;)"/>
				<errorMessage value="Payment currency and Start Date/Time combination should be unique in Income Payments of Dividend/Interest Section"/>			
			</rule>
		</validationRules>--> 
  </occurrence><occurrence table="ft_t_ipdf" id="IPDF_DIV_or_INT" parentId="IEVP_DIV_or_INT" multiple="true" label="Income Payment Definition(Dividend/Interest)"> 
    <inputFields> 
      <field name="ft_t_ipdf.start_tms"/>  
      <field name="ft_t_ipdf.ev_rate_typ"/>  
      <field name="ft_t_ipdf.ev_crte"/>  
      <field name="ft_t_ipdf.iss_part_rl_typ"/>  
      <field name="ft_t_ipdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ipdf.pay_curr_cde"/>  
      <field name="ft_t_ipdf.end_tms"/> 
    </inputFields>  
    <defaultFields/> 
  </occurrence><occurrence table="ft_t_pevp" id="PEVP_CALL_or_SINK" parentId="PEDF_CALL_or_SINK" label="Principal Event Participant(Call/Sink)" autoDelete="false"> 
    <defaultFields> 
      <field name="ft_t_pevp.start_tms" dataType="DATETIME" srcOccurrence="PEDF_CALL_or_SINK" valueOf="ft_t_pedf.start_tms" keepInSync="true"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_pevp.prt_purp_typ" dataType="STRING" value="SNKFDRED"/> 
    </where>  
    <validationRules> 
      <rule id="Unique_PPDF_Call_or_Sink"> 
        <xPath value="is-unique(%modelPath:PPDF_CALL_or_SINK%, &quot;concat(ppdf.pay_curr_cde,substring((ppdf.start_tms), 1, 10))&quot;)"/>  
        <!--        <xPath value="is-unique(%modelPath:PPDF_CALL_or_SINK%,&quot;substring((ppdf.start_tms), 1,10)&quot;)"/>  -->  
        <errorMessage value="Payment currency and Start Date/Time combination should be unique in Principal Payments of Call/Sink Section"/> 
      </rule> 
    </validationRules> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_CALL_or_SINK" parentId="PEVP_CALL_or_SINK" multiple="true" label="Principal Payment Definition(Call/Sink)" autoDelete="false"> 
    <inputFields> 
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.start_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/> 
    </inputFields>  
    <defaultFields/> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_PUT_or_FACTOR" parentId="PEVP_PUT_or_FACTOR" multiple="true" label="Principal Payment Definition(Factor)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_PUT" parentId="PEVP_PUT" multiple="true" label="Principal Payment Definition(Put)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_NEXTPUT" parentId="PEVP_NEXTPUT" multiple="true" label="Principal Payment Definition(NextPut)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_NXTPARPT" parentId="PEVP_NXTPARPT" multiple="true" label="Principal Payment Definition(NxtParpt)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_PUTPROV" parentId="PEVP_PUTPROV" multiple="true" label="Principal Payment Definition(PutProv)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_PUTSCHED" parentId="PEVP_PUTSCHED" multiple="true" label="Principal Payment Definition(PutSched)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_CALLABLE" parentId="PEVP_CALLABLE" multiple="true" label="Principal Payment Definition(Callable)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_CALLED" parentId="PEVP_CALLED" multiple="true" label="Principal Payment Definition(Called)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_CALATPAR" parentId="PEVP_CALATPAR" multiple="true" label="Principal Payment Definition(Calatpar)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_CALATPRE" parentId="PEVP_CALATPRE" multiple="true" label="Principal Payment Definition(Calatpre)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_isgp" id="ISGP_UNIV" parentId="BASEISSU" label="Issue Group Participant" multiple="true" dbConstraint="isgpuniv"> 
    <defaultFields> 
      <field name="ft_t_isgp.prt_purp_typ" dataType="STRING" value="MANUAL"/>  
      <field name="ft_t_isgp.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_isgp.prnt_iss_grp_oid"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_cucn" id="CUCN" parentId="BASEISSU"> 
    <defaultFields> 
      <field name="ft_t_cucn.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_cucf" id="CUCF" parentId="CUCN"> 
    <defaultFields> 
      <field name="ft_t_cucf.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_cucf.instr_id" dataType="STRING" valueOfXPath="/root/issue/issu.instr_id"/> 
    </defaultFields> 
  </occurrence><relations><table name="FT_T_IEDF"><relation relatedTable="FT_T_ISSU" name="issuiedfinterest">
            <fromColumns>
                <column name="instr_id"/>
            </fromColumns>
            <toColumns>
                <column name="instr_id"/>
            </toColumns>
            <condition>
                <sql>#FROM_TABLE#.ev_typ IN (''INTEREST'')</sql>
            </condition>
        </relation></table><table name="FT_T_LMST"><relation relatedTable="FT_T_ISSU" name="latestlmst">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<condition>
				<sql>#FROM_TABLE#.last_chg_tms = (SELECT MAX (last_chg_tms) FROM ft_t_lmst WHERE ft_t_lmst.instr_id = #TO_TABLE#.instr_id)</sql>
			</condition>
		</relation></table><table name="FT_T_ISLL"><relation relatedTable="FT_T_ISSU" name="isllissu">
            <fromColumns>
                <column name="instr_id"/>
            </fromColumns>
            <toColumns>
                <column name="instr_id"/>
            </toColumns>
            <condition>
                <sql>#FROM_TABLE#.last_chg_tms in (SELECT max(last_chg_tms) FROM ft_t_isll where instr_id = #TO_TABLE#.instr_id)</sql>
            </condition>
        </relation></table><table name="FT_T_PEDF"><relation relatedTable="FT_T_ISSU" name="pedffactorissu">
            <fromColumns>
                <column name="instr_id"/>
            </fromColumns>
            <toColumns>
                <column name="instr_id"/>
            </toColumns>
            <condition>
                <sql>#FROM_TABLE#.ev_typ IN (''FACTOR'')</sql>
            </condition>
        </relation></table><table name="FT_T_PEVP"><relation relatedTable="FT_T_PEDF" name="pevpfactorissu">
            <fromColumns>
                <column name="prin_ev_def_id"/>
            </fromColumns>
            <toColumns>
                <column name="prin_ev_def_id"/>
            </toColumns>
            <condition>
                <sql>#FROM_TABLE#.prt_purp_typ IN (''FACTOR'')</sql>
            </condition>
        </relation></table><table name="FT_T_PPDF"><relation relatedTable="FT_T_PEVP" name="ppdf_pevp">
            <fromColumns>
                <column name="PRIN_EV_PRT_ID"/>
            </fromColumns>
            <toColumns>
                <column name="PRIN_EV_PRT_ID"/>
            </toColumns>
            <condition>
                <sql>ROWNUM=1</sql>
            </condition>
        </relation></table><table name="FT_T_ISRT"><relation relatedTable="FT_T_ISSU" name="RTNG_HIST" checkService="RATING_SERVICE">
			<condition>
				<sql>#FROM_TABLE#.SYS_EFF_END_TMS IS NULL AND (#FROM_TABLE#.INSTR_ID) = (#TO_TABLE#.INSTR_ID)</sql>
			</condition>
		</relation></table><table name="FT_T_MKIS"><relation relatedTable="FT_T_ISSU" name="ISSUMKIS">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<condition>
				<sql>(#FROM_TABLE#.prim_trd_mkt_ind=''Y'' or (select count(*) from ft_t_mkis where ft_t_mkis.instr_id=#TO_TABLE#.instr_id and (ft_t_mkis.end_tms is null or ft_t_mkis.end_tms  >= SYSDATE()))=1)</sql>
			</condition>
		</relation></table><table name="FT_T_MIXR"><relation relatedTable="FT_T_MKIS" name="MKISMIXR">
			<fromColumns>
				<column name="MKT_ISS_OID"/>
			</fromColumns>
			<toColumns>
				<column name="MKT_ISS_OID"/>
			</toColumns>
		</relation></table><table name="FT_T_ISGU"><relation relatedTable="FT_T_ISSU" name="ISSUISGU">
            <fromColumns>
                <column name="INSTR_ID"/>
            </fromColumns>
            <toColumns>
                <column name="INSTR_ID"/>
            </toColumns>
            <condition>
                <sql>#FROM_TABLE#.gu_typ =''COUNTRY''</sql>
            </condition>
        </relation></table><table name="FT_T_IEVP"><relation relatedTable="FT_T_IEDF" name="iedfievpestdiv">
            <fromColumns>
                <column name="INC_EV_DEF_ID"/>
            </fromColumns>
            <toColumns>
                <column name="INC_EV_DEF_ID"/>
            </toColumns>
            <condition>
                <sql>#FROM_TABLE#.prt_purp_typ IN (''ESTIMATE'',''DIVIDEND'')</sql>
            </condition>
        </relation></table><table name="FT_T_ISCL"><relation relatedTable="FT_T_ISSU" name="SUBTYPE">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<condition>
				<sql>#FROM_TABLE#.indus_cl_set_id in (''TKISSTYP'',''BBSECTYP'',''FTISSTYP'',''ASSETCLS'')</sql>
			</condition>
		</relation></table><table name="FT_T_RIDF"><relation relatedTable="FT_T_ISSU" name="ridfwarrant">
            <fromColumns>
                <column name="instr_id"/>
            </fromColumns>
            <toColumns>
                <column name="instr_id"/>
            </toColumns>
            <condition>
                <sql>#FROM_TABLE#.rel_typ IN (''WARRANT'',''WRT CALL'',''WRT PUT'')</sql>
            </condition>
        </relation></table><table name="FT_T_RISS"><relation relatedTable="FT_T_RIDF" name="risswarrant">
            <fromColumns>
                <column name="rld_iss_feat_id"/>
            </fromColumns>
            <toColumns>
                <column name="rld_iss_feat_id"/>
            </toColumns>
            <condition>
                <sql>#FROM_TABLE#.iss_part_rl_typ IN (''DELIVER'',''RECEIVE'',''UNDLYING'')</sql>
            </condition>
        </relation></table><table name="FT_T_ISID"><relation relatedTable="FT_T_ISSU" name="ISSUISID">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<condition>
					<sql>not exists (select 1 from ft_t_mixr mixr where (mixr.end_tms is null or mixr.end_tms  > SYSDATE()) and #FROM_TABLE#.ISID_OID=mixr.isid_oid) and #FROM_TABLE#.MKT_OID is null</sql>
				</condition>
		</relation></table><table name="FT_T_ISID"><relation relatedTable="FT_T_ISSU" name="MRKTISID">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<condition>
				<sql>not exists (select 1 from ft_t_mixr mixr where (mixr.end_tms is null or mixr.end_tms  > SYSDATE()) and #FROM_TABLE#.ISID_OID=mixr.isid_oid) and #FROM_TABLE#.MKT_OID is not null</sql>
		</condition>
		</relation></table><table name="FT_T_ISID"><relation relatedTable="FT_T_ISSU" name="MRKTISIDPUB">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<condition>			
				<sql>not exists (select 1 from ft_t_mixr mixr where (mixr.end_tms is null or mixr.end_tms  > SYSDATE()) and #FROM_TABLE#.ISID_OID=mixr.isid_oid) and #FROM_TABLE#.MKT_OID is not null</sql>			
			</condition>
		</relation></table><table name="FT_T_ISCL"><relation relatedTable="FT_T_ISSU" name="SUBTYPE">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<condition>
				<sql>#FROM_TABLE#.indus_cl_set_id in (''TKISSTYP'',''BBSECTYP'',''FTISSTYP'',''ASSETCLS'')</sql>
			</condition>
		</relation></table><table name="FT_T_RIST"><relation relatedTable="FT_T_ISSU" name="RIST_INSTR">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
		</relation></table><table name="FT_T_AISR"><relation relatedTable="FT_T_ISSU" name="MyAccountIssueRole">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<condition>
				<sql>#FROM_TABLE#.ACCT_ISSU_RL_TYP is not null</sql>
			</condition>
		</relation></table><table name="FT_T_AISR"><relation relatedTable="FT_T_ISSU" name="MyIssueAccountRole">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<!--Commented as AISR.ISSU_ACCT_RL_TYP has been removed (GT 37778)-->
			<!--<condition>
        <sql>#FROM_TABLE#.ISSU_ACCT_RL_TYP is not null</sql>
      </condition>-->
		</relation></table><table name="FT_T_MIXR"><relation relatedTable="FT_T_ISID" name="MIXRISID">
			<fromColumns>
				<column name="ISID_OID"/>
			</fromColumns>
			<toColumns>
				<column name="ISID_OID"/>
			</toColumns>
			<condition>
        <sql>exists (select 1 from FT_T_MIXR mixr where (mixr.end_tms IS NULL or mixr.end_tms  > p_asOfDate) and #TO_TABLE#.ISID_OID=mixr.isid_oid)</sql>
			</condition>
		</relation></table><table name="FT_T_MIXR"><relation relatedTable="FT_T_ISID" name="MIXRISIDPUB">
			<fromColumns>
				<column name="ISID_OID"/>
			</fromColumns>
			<toColumns>
				<column name="ISID_OID"/>
			</toColumns>
			<condition>				
				<sql>exists (select 1 from FT_T_MIXR mixr where (mixr.end_tms IS NULL or mixr.end_tms  > SYSDATE()) and #TO_TABLE#.ISID_OID=mixr.isid_oid)</sql>				
			</condition>
		</relation></table><table name="FT_T_MKIS"><relation relatedTable="FT_T_ISPC" name="LATESTPRICE">
			<fromColumns>
				<column name="INSTR_ID"/>
				<column name="MKT_OID"/>
				<column name="PRC_CURR_CDE"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
				<column name="MKT_OID"/>
				<column name="PRC_CURR_CDE"/>
			</toColumns>
			<condition>
				<sql>#TO_TABLE#.prc_tms = 
             (select max(prc_tms)
                from ft_t_ispc maxprc
               where maxprc.instr_id = #TO_TABLE#.instr_id
                 and maxprc.mkt_oid = #TO_TABLE#.mkt_oid
                 and maxprc.prc_curr_cde = #TO_TABLE#.prc_curr_cde)</sql>
			</condition>
		</relation></table><table name="FT_T_MUST"><relation relatedTable="FT_T_MKIS" name="mkismust">
            <fromColumns>
                <column name="MKT_ISS_OID"/>
            </fromColumns>
            <toColumns>
                <column name="MKT_ISS_OID"/>
            </toColumns>
        </relation></table><table name="FT_T_ISPC"><relation name="latestclosingprice" relatedTable="FT_T_ISSU">
            <fromColumns>
                <column name="INSTR_ID"/>
            </fromColumns>
            <toColumns>
                <column name="INSTR_ID"/>
            </toColumns>
            <condition>
                <sql>(#FROM_TABLE#.last_chg_tms
                      , #FROM_TABLE#.prc_tms
                      , COALESCE (#FROM_TABLE#.data_src_id, ''999'')
                      , #FROM_TABLE#.prc_srce_typ
                      , #FROM_TABLE#.prc_typ
                      || COALESCE (TRIM (#FROM_TABLE#.addnl_prc_qual_typ), ''999'')) IN
                            (  SELECT   MAX (last_chg_tms)
                                        , MAX (prc_tms)
                                        , COALESCE (data_src_id, ''999'')
                                        , prc_srce_typ
                                        , prc_typ
                                        || COALESCE (TRIM (addnl_prc_qual_typ), ''999'')
                                 FROM   ft_t_ispc ispc1
                                WHERE   instr_id = #FROM_TABLE#.instr_id
                                AND trim(prc_typ) || trim(addnl_prc_qual_typ) IN (''BID2171'',''ASKED2124'',''ASKED1'',''0031'',''0033'',''ASKED3'')      
                             GROUP BY   prc_tms,
                                        data_src_id,
                                        prc_srce_typ,
                                        prc_typ,
                                        addnl_prc_qual_typ,
                                        prc_qt_meth_typ)</sql>
            </condition>
        </relation></table><table name="FT_T_IPDF"><relation relatedTable="FT_T_IEVP" name="ipdfbasecpi">
            <fromColumns>
                <column name="INC_EV_PRT_ID"/>
            </fromColumns>
            <toColumns>
                <column name="INC_EV_PRT_ID"/>
            </toColumns>
            <condition>
                <sql>#FROM_TABLE#.rate_fixing_base_crte is not null and #FROM_TABLE#.start_tms = (select max(start_tms) from ft_t_ipdf where inc_ev_prt_id=#FROM_TABLE#.inc_ev_prt_id and rate_fixing_base_crte is not null)</sql>
            </condition>
        </relation></table><table name="FT_T_IRCL"><relation relatedTable="FT_T_ISSU" name="IRCL_ISSU">
			<fromColumns>
				<column name="INSTR_ISSR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ISSR_ID"/>
			</toColumns>
			<condition>
				<sql>(#FROM_TABLE#.instr_id = #TO_TABLE#.instr_id or #FROM_TABLE#.instr_id is null)</sql> 
			</condition>
		</relation></table><table name="FT_T_ISGP"><relation relatedTable="FT_T_ISSU" name="isgpuniv">
			<fromColumns>
				<column name="instr_id"/>
			</fromColumns>
			<toColumns>
				<column name="instr_id"/>
			</toColumns>
			<condition>
				<sql>TRIM(#FROM_TABLE#.PRNT_ISS_GRP_OID) in (SELECT TRIM(ISS_GRP_OID) FROM FT_T_ISGR WHERE GRP_PURP_TYP=''UNIVERSE'')</sql>
			</condition>
		</relation></table></relations></model>' WHERE modl_id ='ASSTBSEC' AND modl_typ = 'ISSU';
		
UPDATE FT_T_MDDF SET modl_schema ='<?xml version="1.0" encoding="UTF-8"?>
<model xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="../../schemas/Model.xsd" id="EQUITY" extends="BASEISSU" headerInfoXPath="concat(%modelPath:BASEISSU:ft_t_issu.pref_iss_nme%,'' - '',%modelPath:BASEISSU:ft_t_issu.pref_id_ctxt_typ% ,''-'',%modelPath:BASEISSU:ft_t_issu.pref_iss_id%)" minLevelToEnableChangeApproval="2">  
  <occurrence extends="BASEISSU" id="BASEISSU" table="ft_t_issu" level="1" label="Issue Description/Issue Details"> 
    <inputFields> 
      <field name="ft_t_issu.end_tms"/>  
      <field name="ft_t_issu.when_issued_ind" label="When Issued"/>  
      <field name="ft_t_issu.iss_actvy_stat_typ" label="Instrument Status" level="1"/>  
      <field name="ft_t_issu.iss_typ" label="Instrument Type" level="1"/>  
      <field name="ft_t_issu.nom_val_unit_camt" label="Par Value"/>  
      <field name="ft_t_issu.start_tms"/>  
      <field name="ft_t_issu.distribution_curr_cde" label="Settlement Currency"/>  
      <field name="ft_t_issu.denom_curr_cde" label="Par Value Currency" level="2"/>  
      <field name="ft_t_issu.instr_issr_id" level="2"/>  
      <!-- This is a dummy field name "ft_t_eqst.stats_curr_cde" which we have used in occurrence EQST-->
      <field name="ft_t_eqst.stats_curr_cde"/> 
    <field name="ft_t_issu.sec_form_typ"/><field name="ft_t_issu.iss_tms" label="Instrument Date"/><field name="ft_t_issu.cl_typ"/></inputFields>  
    <validationRules> 
      <!--<rule id="ID_CONTEXT_TYPE" pageName="SpeedScreen">
				<xPath value="boolean((count(%modelPath:ISID_Global%[isid.id_ctxt_typ[@status != ''deleted'' or string-length(@status) = 0]=/root/issue/issu.pref_id_ctxt_typ])  > 0) or /root/issue/@status=''new'')"/>				
        <errorMessage value="Preferred Id Context Type needs to be same or present in the Issue Identifiers Screen."/>        
			</rule>-->  
      <rule id="ValidationISID"> 
        <xPath value="boolean((count(/root/issueidentifiers/identifier[@status!=''deleted'' or string-length(@status)=0]) >0)  or (/root/issue[@status!=''new'' or  string-length(@status)=0]))"/>  
        <errorMessage value="At least one Instrument Level Identifier has to be entered."/> 
      </rule>  
      <rule id="ValidationISID_ACTIVITYSTATUS"> 
        <xPath value="boolean((count(/root/issueidentifiers/identifier[@status!=''deleted'' or string-length(@status)=0]) >0 or string(/root/issue/issu.iss_actvy_stat_typ)=''INACTIVE'')  or (/root/issue[@status=''new'' or  string-length(@status)!=0]))"/>  
        <errorMessage value="User has either to mark the Issue activity status(Instrument Status)  as inactive or have at least one identifier active."/> 
      </rule>  
      <rule id="EQST_Dividend" pageName="Dividends"> 
        <xPath value="boolean(string-length(%modelPath:BASEISSU:ft_t_eqst.stats_curr_cde%) = 0 or (/root/issue/ft_t_eqst.stats_curr_cde[not(@status)]) or (string-length(%modelPath:BASEISSU:ft_t_eqst.stats_curr_cde%)  > 0 and ( string-length(%modelPath:EQST:ft_t_eqst.grs_dps_12m_crte%)  > 0 or  string-length(%modelPath:EQST:ft_t_eqst.div_ex_today_ind%)  > 0 or string-length(%modelPath:EQST:ft_t_eqst.split_ratio_crte%)  > 0 or string-length(%modelPath:EQST:ft_t_eqst.split_tms%)  > 0 or string-length(%modelPath:EQST:ft_t_eqst.net_dps_12m_crte%)  > 0 ) ) )"/>  
        <errorMessage value="At least Dividend Per Share 12 Month (Gross) or Dividend Per Share 12 Month (Net) or Currently Ex-Dividend or Equity Split Ratio or Equity Split Date has to be entered."/> 
      </rule> 
    <rule id="MultiplePrimaryMarkets" pageName="Market"> 
        <xPath value="boolean(count(%modelPath:MKISDEFBISSU%[(string-length(mkis.end_tms) = 0) and (mkis.prim_trd_mkt_ind = ''Y'')])  <  2)"/>  
        <errorMessage value="There should not be multiple primary markets for a single issue."/> 
      </rule></validationRules> 
  <defaultFields> 
      <field name="ft_t_issu.access_auth_typ" dataType="STRING" value="PUBLIC"/>  
      <field name="ft_t_issu.iss_actvy_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_issu.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>     
    </defaultFields></occurrence>  
  <!--ISID_Global occurrence is created because in earlier in the validation ISID_Iss_level was used where there was 
      a ''where'' clause mentioned for condition mkt_oid is null.So ,it will get only that records where mkt_oid is null
      Hence whenever user will try to add a market to the existing identifier then the validation ID_CONTEXT_TYPE would return false 
      which in turn fire the validation on the screen.For that purpose a new ISID_Global identifier is created without any
      parameters.For GT # 38622 -->    
  <occurrence table="ft_t_isst" id="ISST_EQOPTYN" parentId="BASEISSU" label="Issue Statistics" autoDelete="false"> 
    <where> 
      <field name="ft_t_isst.stat_def_id" dataType="STRING" value="EQOPTYN"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_isst.stat_def_id" dataType="STRING" valueOf="ft_t_stdf.stat_def_id"> 
        <where> 
          <field name="ft_t_stdf.stat_def_id" dataType="STRING" value="EQOPTYN"/> 
        </where> 
      </field>  
      <field name="ft_t_isst.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_isst.stat_char_val_txt" label="Listed Options"/> 
    </inputFields> 
  </occurrence>  
  <occurrence table="ft_t_isst" id="ISST_MICLOCEX" parentId="BASEISSU" label="Issue Statistics" autoDelete="false"> 
    <where> 
      <field name="ft_t_isst.stat_def_id" dataType="STRING" value="MICLOCEX"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_isst.stat_def_id" dataType="STRING" valueOf="ft_t_stdf.stat_def_id"> 
        <where> 
          <field name="ft_t_stdf.stat_def_id" dataType="STRING" value="MICLOCEX"/> 
        </where> 
      </field>  
      <field name="ft_t_isst.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_isst.stat_char_val_txt" label="MIC"/> 
    </inputFields> 
  </occurrence>  
  <occurrence table="ft_t_isst" id="ISST_PREEURCR" parentId="BASEISSU" label="Issue Statistics" autoDelete="false"> 
    <defaultFields> 
      <field name="ft_t_isst.stat_def_id" dataType="STRING" valueOf="ft_t_stdf.stat_def_id"> 
        <where> 
          <field name="ft_t_stdf.stat_def_id" dataType="STRING" value="PREEURCR"/> 
        </where> 
      </field>  
      <field name="ft_t_isst.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_isst.stat_def_id" dataType="STRING" value="PREEURCR"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_isst.stat_char_val_txt" label="Pre Redenomination Currency"/> 
    </inputFields> 
  </occurrence>  
  <occurrence table="ft_t_isst" id="ISST_PSTEURCR" parentId="BASEISSU" label="Issue Statistics" autoDelete="false"> 
    <where> 
      <field name="ft_t_isst.stat_def_id" dataType="STRING" value="PSTEURCR"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_isst.stat_def_id" dataType="STRING" valueOf="ft_t_stdf.stat_def_id"> 
        <where> 
          <field name="ft_t_stdf.stat_def_id" dataType="STRING" value="PSTEURCR"/> 
        </where> 
      </field>  
      <field name="ft_t_isst.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_isst.stat_char_val_txt" label="Post Redenomination Currency"/> 
    </inputFields> 
  </occurrence>  
  <occurrence table="ft_t_isst" id="ISST_PREEURPR" parentId="BASEISSU" label="Issue Statistics" autoDelete="false"> 
    <where> 
      <field name="ft_t_isst.stat_def_id" dataType="STRING" value="PREEURPR"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_isst.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_isst.stat_def_id" dataType="STRING" valueOf="ft_t_stdf.stat_def_id"> 
        <where> 
          <field name="ft_t_stdf.stat_def_id" dataType="STRING" value="PREEURPR"/> 
        </where> 
      </field> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_isst.stat_val_camt" label="Pre Euro Redenom Par Amount"/> 
    </inputFields> 
  </occurrence>  
  <occurrence table="ft_t_isst" id="ISST_POSEURPR" parentId="BASEISSU" label="Issue Statistics" autoDelete="false"> 
    <where> 
      <field name="ft_t_isst.stat_def_id" dataType="STRING" value="POSEURPR"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_isst.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_isst.stat_def_id" dataType="STRING" valueOf="ft_t_stdf.stat_def_id"> 
        <where> 
          <field name="ft_t_stdf.stat_def_id" dataType="STRING" value="POSEURPR"/> 
        </where> 
      </field> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_isst.stat_val_camt" label="Post  Euro Redenom Par Amount"/> 
    </inputFields> 
  </occurrence>  
  <occurrence table="ft_t_isst" id="ISST_SHROUTOT" parentId="BASEISSU" label="Issue Statistics" autoDelete="false"> 
    <where> 
      <field name="ft_t_isst.stat_def_id" dataType="STRING" value="SHROUTOT"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_isst.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_isst.stat_def_id" dataType="STRING" valueOf="ft_t_stdf.stat_def_id"> 
        <where> 
          <field name="ft_t_stdf.stat_def_id" dataType="STRING" value="SHROUTOT"/> 
        </where> 
      </field> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_isst.stat_val_camt" label="Shares outstanding-All Classes"/> 
    </inputFields> 
  </occurrence>  
  <occurrence table="ft_t_eqch" id="EQCH" parentId="BASEISSU" label="Equity Characteristics" autoDelete="false"> 
    <inputFields> 
      <field name="ft_t_eqch.rednm_tms"/>  
      <field name="ft_t_eqch.rednm_meth_typ"/>  
      <field name="ft_t_eqch.rednm_rnd_meth_typ"/>  
      <field name="ft_t_eqch.div_fq_qty"/>  
      <field name="ft_t_eqch.div_fq_dy_typ"/>  
      <field name="ft_t_eqch.div_fq_sp_typ" label="Frequency"/>  
      <field name="ft_t_eqch.annual_dividend_curr_cde" label="Nominal Currency"/>  
      <field name="ft_t_eqch.div_rights_typ" label="Dividend Rights"/> 
    </inputFields> 
  </occurrence>  
  <occurrence table="ft_t_eqst" id="EQST" parentId="BASEISSU" label="Equity Statistics" multiple="false" autoCreate="false" autoDelete="false"> 
    <where> 
      <field name="ft_t_eqst.stats_curr_cde" dataType="STRING" srcOccurrence="BASEISSU" valueOf="ft_t_eqst.stats_curr_cde"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_eqst.stats_eff_tms" valueOf="ft_t_issu.start_tms" srcOccurrence="BASEISSU" dataType="DATETIME"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_eqst.voting_rights_crte"/>  
      <field name="ft_t_eqst.shr_outst_cqty" label="Shares Outstanding"/>  
      <field name="ft_t_eqst.div_ex_today_ind" label="Currently Ex-Dividend"/>  
      <field name="ft_t_eqst.split_tms" label="Equity Split Date"/>  
      <field name="ft_t_eqst.split_ratio_crte" label="Equity Split Ratio"/>  
      <field name="ft_t_eqst.grs_dps_12m_crte" label="Dividend Per Share 12 Month (Gross)"/>  
      <field name="ft_t_eqst.net_dps_12m_crte" label="Dividend Per Share 12 Month (Net)"/> 
    </inputFields> 
  </occurrence>  
  <occurrence table="ft_t_eqst" id="EQST_TABLE" parentId="BASEISSU" label="Equity Statistics" multiple="true"> 
    <inputFields> 
      <field name="ft_t_eqst.div_paid_tms" label="Pay Date"/>  
      <field name="ft_t_eqst.last_div_paid_typ" label="Dividend Type"/>  
      <field name="ft_t_eqst.grs_dps_crte" label="Div Per Share (Gross)"/>  
      <field name="ft_t_eqst.franked_div_cpct" label="Tax Credit"/>  
      <field name="ft_t_eqst.net_dps_crte" label="Div Per Share (Net)"/>  
      <field name="ft_t_eqst.div_declared_tms" label="Announcement Date"/>  
      <field name="ft_t_eqst.div_rcdt_tms" label="Record Date"/>  
      <field name="ft_t_eqst.div_ex_tms" label="Ex-Dividend Date"/>  
      <field name="ft_t_eqst.data_stat_typ" label="Additional Circumstances"/>  
      <field name="ft_t_eqst.mkt_oid" label="Market Name"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_eqst.stats_eff_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields> 
  </occurrence>  
  <!--<occurrence table="ft_t_isid" id="ISID_RIC" parentId="MIXRBISSU" label="Issue Identifier" dbConstraint="MIXRISID">
		<where>
			<field name="ft_t_isid.id_ctxt_typ" dataType="STRING" value="RIC"/>
		</where>
		<inputFields>
			<field name="ft_t_isid.iss_id" label="RIC"/>
		</inputFields>
		<defaultFields>
			<field name="ft_t_isid.instr_id" valueOf="ft_t_issu.instr_id" srcOccurrence="BASEISSU" uiOnly="true" dataType="STRING"/>
			<field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>
			<field name="ft_t_isid.mkt_oid" dataType="STRING" srcOccurrence="MKISDEFBISSU" valueOf="ft_t_mkis.mkt_oid"/>
		</defaultFields>
	</occurrence>-->   
  <occurrence table="ft_t_isid" id="ISID_MIC_PUB" parentId="MIXRBISSU" label="Issue Identifier" dbConstraint="MIXRISIDPUB"> 
    <where> 
      <field name="ft_t_isid.id_ctxt_typ" dataType="STRING" value="MIC"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_isid.iss_id" label="MIC"/> 
    </inputFields>  
    <defaultFields>      
      <field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_isid.mkt_oid" dataType="STRING" srcOccurrence="MKISDEFBISSU" valueOf="ft_t_mkis.mkt_oid"/> 
    </defaultFields> 
  </occurrence>  
  <!--<occurrence table="ft_t_isid" id="ISID_TIC_EX" parentId="MIXRBISSU" label="Issue Identifier" dbConstraint="MIXRISID">
		<where>
			<field name="ft_t_isid.id_ctxt_typ" dataType="STRING" value="TICKER"/>
		</where>
		<defaultFields>
			<field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>
			<field name="ft_t_isid.mkt_oid" dataType="STRING" srcOccurrence="MKISDEFBISSU" valueOf="ft_t_mkis.mkt_oid"/>
		</defaultFields>
		<inputFields>
			<field name="ft_t_isid.iss_id" label="Bloomberg Ticker"/>
		</inputFields>
	</occurrence>-->  
  <occurrence extends="MKISPMBISSU" table="ft_t_mkis" id="MKISPMBISSU" parentId="BASEISSU" multiple="false" label="Market Details"> 
    <inputFields> 
      <field name="ft_t_mkis.mkt_oid" label="Primary Exchange Name"/>  
      <field name="ft_t_mkis.norm_mkt_sz_cqty" label="Quote Lot Size"/>  
      <field name="ft_t_mkis.trdng_stat_typ" label="Market Status"/>  
      <field name="ft_t_mkis.actively_traded_ind"/> 
    <field name="ft_t_mkis.iss_prc_ut_camt"/><field name="ft_t_mkis.rnd_lot_sz_cqty"/><field name="ft_t_mkis.trdng_curr_cde"/></inputFields> 
  <validationRules> 
      <rule id="Warning" messageType="WARNING"> 
        <xPath value="boolean(string-length(%modelPath:MKISPMBISSU:ft_t_mkis.end_tms%)= 0 or string-length(%modelPath:MKISPMBISSU:ft_t_mkis.end_tms%) <  ''SYSDATE()'')"/>  
        <errorMessage value="Primary Market is end dated"/> 
      </rule> 
    </validationRules><where> 
      <field name="ft_t_mkis.prim_trd_mkt_ind" dataType="STRING" value="Y"/> 
    </where><defaultFields> 
      <!--<field name="ft_t_mkis.trdng_stat_typ" dataType="STRING" value="ACTIVE"/>  
      -->  
      <field name="ft_t_mkis.prc_ut_meas_typ" dataType="STRING" value="NOMINAL"/>  
      <!--<field name="ft_t_mkis.mkt_iss_oid" dataType="STRING" valueOfFunction="OID" uiOnly="true"/> 
      --> 
    </defaultFields></occurrence>  
  <occurrence extends="MIXR_PRIM" table="ft_t_mixr" id="MIXR_PRIM" parentId="MKISPMBISSU" label=" Market Issue Cross Reference ((Primary)" dbConstraint="MKISMIXR"><defaultFields> 
      <field name="ft_t_mixr.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>    
      <field name="ft_t_mixr.trdng_stat_typ" dataType="STRING" srcOccurrence="MKISPMBISSU" valueOf="ft_t_mkis.trdng_stat_typ"/> 
    </defaultFields></occurrence>  
  <occurrence extends="MKISDEFBISSU" table="ft_t_mkis" id="MKISDEFBISSU" parentId="BASEISSU" autoCreate="false" multiple="true"> 
    <inputFields> 
      <field name="ft_t_mkis.trdng_stat_typ" label="Market Status"/>  
      <field name="ft_t_mkis.actively_traded_ind"/>  
      <field name="ft_t_mkis.norm_mkt_sz_cqty" label="Quote Lot Size"/>  
      <field name="ft_t_mkis.mrgn_sec_ind" label="Marginable"/>  
      <field name="ft_t_mkis.settle_curr_cde"/>  
      <field name="ft_t_mkis.trd_lot_size_cqty"/>  
      <field name="ft_t_mkis.prim_trd_mkt_ind" label="Primary Exchange"/>  
      <field name="ft_t_mkis.prc_curr_cde" label="Quotation Currency"/>  
      <field name="ft_t_mkis.mkt_oid" label="Exchange Name"/> 
    <field name="ft_t_mkis.trdng_curr_cde"/><field name="ft_t_mkis.iss_prc_ut_camt"/><field name="ft_t_mkis.rnd_lot_sz_cqty"/><field name="ft_t_mkis.gu_id" label="Trading Country"/><field name="ft_t_mkis.opol_ind"/></inputFields>  
    <!--<defaultFields>
			<field name="ft_t_mkis.prim_trd_mkt_ind" dataType="STRING" value="N"/>
		</defaultFields>--> 
  <defaultFields>       
      <!--<field name="ft_t_mkis.trdng_stat_typ" value="ACTIVE" dataType="STRING"/>  
      -->  
      <field name="ft_t_mkis.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_mkis.last_chg_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_mkis.last_chg_usr_id" dataType="STRING" valueOfFunction="APPUSER"/> 
    </defaultFields></occurrence>  
  <occurrence extends="MIXRBISSU" table="ft_t_mixr" id="MIXRBISSU" parentId="MKISDEFBISSU" multiple="true" dbConstraint="MKISMIXR"><defaultFields> 
      <field name="ft_t_mixr.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>   
      <field name="ft_t_mixr.trdng_stat_typ" dataType="STRING" srcOccurrence="MKISDEFBISSU" valueOf="ft_t_mkis.trdng_stat_typ"/>  
      <field name="ft_t_mixr.last_chg_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_mixr.last_chg_usr_id" dataType="STRING" valueOfFunction="APPUSER"/> 
    </defaultFields><inputFields> 
      <field name="ft_t_mixr.end_tms"/> 
    </inputFields></occurrence>  
  <occurrence table="ft_t_isst" id="ISST_EQYSHOUT" parentId="BASEISSU" label="Issue Statistics" autoDelete="false"> 
    <where activeOnly="false"> 
      <field name="ft_t_isst.stat_def_id" dataType="STRING" value="EQYSHOUT"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_isst.stat_val_dte" label="Shares Outstanding Date"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isst.start_tms" valueOf="ft_t_issu.start_tms" srcOccurrence="BASEISSU" dataType="DATETIME"/>  
      <field name="ft_t_isst.stat_def_id" dataType="STRING" valueOf="ft_t_stdf.stat_def_id"> 
        <where> 
          <field name="ft_t_stdf.stat_def_id" dataType="STRING" value="EQYSHOUT"/> 
        </where> 
      </field> 
    </defaultFields> 
  </occurrence>  
  <occurrence table="ft_t_isst" id="ISST_EQFFPCT" parentId="BASEISSU" label="Issue Statistics" autoDelete="false"> 
    <where activeOnly="false"> 
      <field name="ft_t_isst.stat_def_id" dataType="STRING" value="EQFFPCT"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_isst.stat_val_camt" label="Free Float Amount"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isst.start_tms" valueOf="ft_t_issu.start_tms" srcOccurrence="BASEISSU" dataType="DATETIME"/>  
      <field name="ft_t_isst.stat_def_id" dataType="STRING" valueOf="ft_t_stdf.stat_def_id"> 
        <where> 
          <field name="ft_t_stdf.stat_def_id" dataType="STRING" value="EQFFPCT"/> 
        </where> 
      </field> 
    </defaultFields> 
  </occurrence>  
  <occurrence extends="RGCHBISSU" autoDelete="false" table="ft_t_rgch" id="RGCHBISSU" parentId="BASEISSU" label="Regulatory Information"> 
    <inputFields> 
      <field name="ft_t_rgch.regs_rule144a_ind" label="144A"/>  
      <field name="ft_t_rgch.reg_s_ind" label="Regulation S"/>  
      <field name="ft_t_rgch.gu_id" label="Regulatory Country"/> 
    <field name="ft_t_rgch.gu_cnt"/><field name="ft_t_rgch.gu_typ"/><field name="ft_t_rgch.isma_regulated_ind"/><field name="ft_t_rgch.rule_144a_ind"/></inputFields> 
  <defaultFields> 
      <field name="ft_t_rgch.start_tms" dataType="DATETIME" srcOccurrence="BASEISSU" valueOf="ft_t_issu.start_tms"/> 
    </defaultFields></occurrence>  
  <occurrence table="ft_t_uwch" id="UWCH" parentId="BASEISSU" label="Underwriting Characteristics"> 
    <defaultFields> 
      <field name="ft_t_uwch.offer_num" dataType="NUMBER" value="1"/>  
      <!--      <field name="ft_t_uwch.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>--> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_uwch.pvt_plcmnt_ind" label="Private Placement"/> 
    </inputFields> 
  </occurrence>  
  <occurrence table="ft_t_iscm" id="ISCM_TRAGENT" parentId="BASEISSU" label="Issue Comments"> 
    <where> 
      <field name="ft_t_iscm.cmnt_reas_typ" dataType="STRING" value="TRAGENT"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_iscm.cmnt_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_iscm.ln_num" dataType="NUMBER" value="1"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_iscm.cmnt_txt" label="Transfer Agent"/> 
    </inputFields> 
  </occurrence>  
  <occurrence extends="ISCMBISSU" label="Issue Comments" table="ft_t_iscm" id="ISCMBISSU" parentId="BASEISSU"> 
    <inputFields> 
      <field name="ft_t_iscm.cmnt_txt"/>  
      <field name="ft_t_iscm.cmnt_tms" label="Date"/> 
    </inputFields> 
  <where> 
      <field name="ft_t_iscm.cmnt_reas_typ" dataType="STRING" value="COMMENT"/> 
    </where><defaultFields> 
      <field name="ft_t_iscm.cmnt_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_iscm.ln_num" dataType="NUMBER" value="1"/> 
    </defaultFields></occurrence>  
  <!--<occurrence table="ft_t_mixr" id="MIXR_PRIM" parentId="MKISPMBISSU" label=" Market Issue Cross Reference ((Primary)" dbConstraint="MKISMIXR">
		<defaultFields>
			<field name="ft_t_mixr.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>
			<field name="ft_t_mixr.end_tms" dataType="DATETIME" srcOccurrence="MKISPMBISSU" valueOf="ft_t_mkis.end_tms" uiOnly="true"/>
			<field name="ft_t_mixr.mkt_iss_oid" dataType="STRING" srcOccurrence="MKISPMBISSU" valueOf="ft_t_mkis.mkt_iss_oid" keepInSync="true" uiOnly="true"/>
			<field name="ft_t_mixr.trdng_stat_typ" dataType="STRING" srcOccurrence="MKISPMBISSU" valueOf="ft_t_mkis.trdng_stat_typ"/>
		</defaultFields>
	</occurrence>
	<occurrence table="ft_t_isid" id="ISID_TIC_PM" parentId="MIXR_PRIM" label="Issue Identifier-Ticker" dbConstraint="MIXRISID">
		<where>
			<field name="ft_t_isid.id_ctxt_typ" dataType="STRING" value="TICKER"/>
		</where>
		<inputFields>
			<field name="ft_t_isid.iss_id" label="Primary Ticker"/>
		</inputFields>
		<defaultFields>
			<field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>
			<field name="ft_t_isid.mkt_oid" dataType="STRING" srcOccurrence="MKISPMBISSU" valueOf="ft_t_mkis.mkt_oid"/>
			<field name="ft_t_isid.instr_id" dataType="STRING" srcOccurrence="BASEISSU" valueOf="ft_t_issu.instr_id"/>
		</defaultFields>
	</occurrence>
	-->  
  <!--  <occurrence table="ft_t_ircl" id="IRCL" parentId="ISSR" dbConstraint="irclf001" multiple="true" uiOnly="true"> -->  
  <!--    <inputFields> -->  
  <!--      <field name="ft_t_ircl.cl_value"/>  -->  
  <!--      <field name="ft_t_ircl.indus_cl_set_id"/>  -->  
  <!--      <field name="ft_t_ircl.clsf_oid"/> -->  
  <!--    </inputFields>  -->  
  <!--    <defaultFields> -->  
  <!--      <field name="ft_t_ircl.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> -->  
  <!--    </defaultFields>  -->  
  <!--    <where> -->  
  <!--      <field name="ft_t_ircl.clsf_purp_typ" dataType="STRING" value="INDCLASS"/> -->  
  <!--    </where> -->  
  <!--  </occurrence>  --> 
  <!--  <occurrence table="ft_t_issr" id="ISSR" parentId="BASEISSU" dbConstraint="issuf002" autoDelete="false" uiOnly="true"> -->  
  <!--    <inputFields> -->  
  <!--      <field name="ft_t_issr.mult_shr_ind" label="Multiple Classes"/> -->  
  <!--    </inputFields> -->  
  <!--  </occurrence>  -->  
  <occurrence table="ft_t_isst" id="ISST_DTCELGBL" parentId="BASEISSU" label="Issue Statistics" autoDelete="false"> 
    <where> 
      <field name="ft_t_isst.stat_def_id" dataType="STRING" value="DTCELGBL"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_isst.stat_char_val_txt" label="DTC Eligible"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isst.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_isst.stat_def_id" dataType="STRING" valueOf="ft_t_stdf.stat_def_id"> 
        <where> 
          <field name="ft_t_stdf.stat_def_id" dataType="STRING" value="DTCELGBL"/> 
        </where> 
      </field> 
    </defaultFields> 
  </occurrence>  
  <occurrence table="ft_t_isst" id="ISST_DTCREGRD" parentId="BASEISSU" label="Issue Statistics" autoDelete="false"> 
    <where> 
      <field name="ft_t_isst.stat_def_id" dataType="STRING" value="DTCREGRD"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_isst.stat_char_val_txt" label="DTC Registered"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isst.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_isst.stat_def_id" dataType="STRING" valueOf="ft_t_stdf.stat_def_id"> 
        <where> 
          <field name="ft_t_stdf.stat_def_id" dataType="STRING" value="DTCREGRD"/> 
        </where> 
      </field> 
    </defaultFields> 
  </occurrence>  
  <occurrence extends="ISDEBISSU" table="ft_t_isde" id="ISDEBISSU" parentId="BASEISSU" label="Issue Description" level="1"> 
    <inputFields> 
      <field name="ft_t_isde.iss_nme" label="Instrument Name" level="1"/>  
      <field name="ft_t_isde.iss_desc" label="Instrument Description"/> 
    <field name="ft_t_isde.start_tms"/></inputFields> 
  <where> 
      <field name="ft_t_isde.desc_usage_typ" dataType="STRING" value="PRIMARY"/> 
    </where><defaultFields> 
      <field name="ft_t_isde.desc_srce_typ" dataType="STRING" value="INHOUSE"/>  
      <field name="ft_t_isde.nls_cde" dataType="STRING" value="ENGLISH"/>  
      <field name="ft_t_isde.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields></occurrence>  
  <occurrence extends="IEDF_DIV_or_INT" table="ft_t_iedf" id="IEDF_DIV_or_INT" parentId="BASEISSU" label="Income Event Definition(Dividend/Interest)"> 
    <where> 
      <field name="ft_t_iedf.ev_typ" dataType="STRING" value="DIVIDEND"/> 
    </where> 
  <defaultFields> 
      <field name="ft_t_iedf.verif_ind" dataType="STRING" value="Y"/>  
      <field name="ft_t_iedf.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields><inputFields> 
      <field name="ft_t_iedf.first_py_tms" label="First Payment Date"/>  
      <field name="ft_t_iedf.days_mth_bas_typ"/>  
      <field name="ft_t_iedf.days_yr_bas_typ"/>  
      <field name="ft_t_iedf.calc_meth_typ" label="Calculation Method"/>  
      <field name="ft_t_iedf.py_dte_fq_qty" label="Payable Date Frequency"/>  
      <field name="ft_t_iedf.py_dte_fq_dy_typ"/>  
      <field name="ft_t_iedf.py_dte_fq_sp_typ"/>  
      <field name="ft_t_iedf.start_tms"/>  
      <field name="ft_t_iedf.end_tms"/> 
    </inputFields></occurrence>  
  <occurrence extends="IPDF_DIV_or_INT" autoDelete="true" table="ft_t_ipdf" id="IPDF_DIV_or_INT" parentId="IEVP_DIV_or_INT" multiple="true" label="Income Payment Definition(Dividend/Interest)"> 
    <inputFields> 
      <field name="ft_t_ipdf.start_tms"/>  
      <field name="ft_t_ipdf.ev_crte" label="Forecast Amount"/>  
      <field name="ft_t_ipdf.ev_rate_bas_typ" label="Forecast Measure"/> 
    <field name="ft_t_ipdf.ev_rate_typ"/><field name="ft_t_ipdf.iss_part_rl_typ"/><field name="ft_t_ipdf.pay_curr_cde"/><field name="ft_t_ipdf.end_tms"/></inputFields>  
    <defaultFields> 
      <field name="ft_t_ipdf.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <validationRules> 
      <rule id="IPDF_FIELDS"> 
        <xPath value="boolean((string-length(%modelPath:IPDF_DIV_or_INT:ft_t_ipdf.iss_part_rl_typ%)  > 0 and string-length(%modelPath:IPDF_DIV_or_INT:ft_t_ipdf.ev_rate_typ%)  > 0 and string-length(%modelPath:IPDF_DIV_or_INT:ft_t_ipdf.ev_rate_bas_typ%)  > 0) or (string-length(%modelPath:IPDF_DIV_or_INT:ft_t_ipdf.ev_crte%) = 0 and string-length(%modelPath:IPDF_DIV_or_INT:ft_t_ipdf.iss_part_rl_typ%) = 0 and string-length(%modelPath:IPDF_DIV_or_INT:ft_t_ipdf.ev_rate_typ%) = 0 and string-length(%modelPath:IPDF_DIV_or_INT:ft_t_ipdf.ev_rate_bas_typ%) = 0) )"/>  
        <errorMessage value="Forecast Measure, Issue Participation Role and Event Rate Type must be entered if any of the following field is populated: Forecast Measure, Issue Participation Role, Event Rate Type or Forecast Amount  "/> 
      </rule> 
    </validationRules> 
  </occurrence>  
  <occurrence table="ft_t_gncm" id="GNCM" parentId="IPDF_DIV_or_INT" label="General Comments"> 
    <defaultFields> 
      <field name="ft_t_gncm.ln_num" dataType="NUMBER" value="1"/>  
      <field name="ft_t_gncm.created_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_gncm.gncm_tbl_typ" dataType="STRING" value="IPDF"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_gncm.comm_reas_mnem" dataType="STRING" value="COMMENT"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_gncm.cmnt_txt" label="Forecast Assumption"/> 
    </inputFields> 
  </occurrence>  
  <!-- Removed the autoDelete parameter because new Issue Tax Statistics was not created-->  
  <!-- Removed defaulting of ft_t_itxt.stats_eff_tms to avoid generating duplicate entries during vendor data load. -->  
  <occurrence table="ft_t_itxt" id="ITXT" parentId="BASEISSU" label="Issue Tax Statistics"> 
    <inputFields> 
      <field name="ft_t_itxt.gu_cnt"/>  
      <field name="ft_t_itxt.gu_id" label="Tax Jurisdiction"/>  
      <field name="ft_t_itxt.gu_typ"/>  
      <field name="ft_t_itxt.tax_year_typ"/>  
      <field name="ft_t_itxt.percent_income_cpct" label="Dividend Tax Rate"/> 
    </inputFields>  
    <validationRules> 
      <rule id="ITXT_NOT_NULL_FIELDS"> 
        <xPath value="boolean((string-length(%modelPath:ITXT:ft_t_itxt.tax_year_typ%)  > 0 and string-length(%modelPath:ITXT:ft_t_itxt.gu_id%)  > 0 ) or (string-length(%modelPath:ITXT:ft_t_itxt.percent_income_cpct%) = 0 and string-length(%modelPath:ITXT:ft_t_itxt.tax_year_typ%) = 0 and string-length(%modelPath:ITXT:ft_t_itxt.gu_id%) = 0 )  )"/>  
        <errorMessage value="Tax Jurisdiction and Tax Year Type must be entered if any of the following fields is populated: Tax Jurisdiction, Percent Income or Tax Year Type"/> 
      </rule> 
    </validationRules> 
  </occurrence>    
  <!--as per Ted''s document-->  
  <occurrence table="ft_t_ismc" id="ISMC_PRNT" parentId="BASEISSU" autoDelete="false"> 
    <where> 
      <field name="ft_t_ismc.capital_typ" value="OUTSTAND" dataType="string"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_ismc.cap_chg_eff_tms"/>  
      <field name="ft_t_ismc.cap_sec_cqty"/> 
    </inputFields> 
  </occurrence>  
  <!--as per Ted''s document-->  
  <!--  <occurrence extends="ISCLBISSU" level="4" uiOnly="true">-->  
  <!--    <inputFields>-->  
  <!--      <field name="ft_t_iscl.cl_value" level="4"/>-->  
  <!--    </inputFields>-->  
  <!--  </occurrence>-->  
  <!-- added to hide futures characteristics screen -->  
  <presentation> 
    <until level="100"> 
      <override class="fech" rendered="false"/> 
    </until> 
  </presentation> 
<occurrence table="ft_t_isde" id="ISDE_VENDOR" parentId="BASEISSU" label="Issue Description"> 
    <defaultFields> 
      <field name="ft_t_isde.nls_cde" dataType="STRING" value="ENGLISH"/>  
      <field name="ft_t_isde.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_isde.iss_nme" label="Instrument Name"/>  
      <field name="ft_t_isde.start_tms"/>  
      <field name="ft_t_isde.iss_desc" label="Instrument Description"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_isde.desc_srce_typ" dataType="STRING" value="VENDOR"/> 
    </where> 
  </occurrence><occurrence table="ft_t_isid" id="ISID_Iss_level" parentId="BASEISSU" label="Issue Identifiers" multiple="true" dbConstraint="ISSUISID"> 
    <inputFields> 
      <field name="ft_t_isid.iss_id" label="Identifier Value"/>  
      <field name="ft_t_isid.id_ctxt_typ" label="Identifier Type"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <validationRules> 
      <rule id="ISINMarket"> 
        <xPath value="boolean(not(%modelPath:ISID_Iss_level:ft_t_isid.id_ctxt_typ% =''ISIN'' and not(string-length(%modelPath:ISID_Iss_level:ft_t_isid.mkt_oid%) = 0)))"/>  
        <errorMessage value="ISIN identifier cannot have market."/> 
      </rule>  
      <!--<rule id="ISSUTXTTYPNOTSUPPORTED" messageType="WARNING"> 
	   <xPath value="boolean(not(%modelPath:ISID_Iss_level%/intlvlid_supported=''0''))"/>
          <errorMessageXPath value="concat(%modelPath:ISID_Iss_level:ft_t_isid.id_ctxt_typ%,'' is no longer supported as a valid Instrument Level Identifier. Please take necessary action.'')"/>
		 </rule>--> 
    </validationRules> 
  </occurrence><occurrence table="ft_t_isid" id="ISID_MKT_Iss_level_PUB" parentId="BASEISSU" label="Global Market Identifiers pub" multiple="true" dbConstraint="MRKTISIDPUB"> 
    <!-- <where> 
      <field name="ft_t_isid.mkt_oid" dataType="STRING" isNull="false"/> 
    </where> -->  
    <inputFields> 
      <field name="ft_t_isid.iss_id" label="Identifier Value"/>  
      <field name="ft_t_isid.id_ctxt_typ" label="Identifier Type"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <validationRules> 
      <rule id="ISINMarket"> 
        <xPath value="boolean(not(%modelPath:ISID_MKT_Iss_level_PUB:ft_t_isid.id_ctxt_typ% =''ISIN'' and not(string-length(%modelPath:ISID_MKT_Iss_level_PUB:ft_t_isid.mkt_oid%) = 0)))"/>  
        <errorMessage value="ISIN identifier cannot have market."/> 
      </rule> 
    </validationRules> 
  </occurrence><occurrence table="ft_t_isid" id="ISIDBISIN" parentId="BASEISSU" label="Identifiers"> 
    <inputFields> 
      <field name="ft_t_isid.iss_id"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_isid.id_ctxt_typ" dataType="STRING" value="ISIN"/> 
    </where> 
  </occurrence><occurrence table="ft_t_isid" id="ISIDBINH" parentId="BASEISSU" label="Identifiers"> 
    <inputFields> 
      <field name="ft_t_isid.iss_id"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_isid.id_ctxt_typ" dataType="STRING" value="INHOUSE"/> 
    </where> 
  </occurrence><occurrence table="ft_t_isid" id="ISIDBCUS" parentId="BASEISSU" label="Identifiers"> 
    <inputFields> 
      <field name="ft_t_isid.iss_id"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_isid.id_ctxt_typ" dataType="STRING" value="CUSIP"/> 
    </where> 
  </occurrence><occurrence table="ft_t_isid" id="ISIDBCOM" parentId="BASEISSU" label="Identifiers"> 
    <inputFields> 
      <field name="ft_t_isid.iss_id"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_isid.id_ctxt_typ" dataType="STRING" value="COMMON"/> 
    </where> 
  </occurrence><occurrence table="ft_t_isid" id="ISIDVAL" parentId="BASEISSU" label="Identifiers"> 
    <inputFields> 
      <field name="ft_t_isid.iss_id"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_isid.id_ctxt_typ" dataType="STRING" value="VALOREN"/> 
    </where> 
  </occurrence><occurrence table="ft_t_iscl" id="ISCL_INSUBTYP" parentId="BASEISSU" label="Issue Classification" dbConstraint="SUBTYPE" multiple="false"> 
    <where> 
      <field name="ft_t_iscl.clsf_purp_typ" dataType="STRING" value="INSUBTYP"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_iscl.cl_value" label="Instrument Sub-Type"/>  
      <field name="ft_t_iscl.indus_cl_set_id"/>  
      <field name="ft_t_iscl.clsf_oid"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_iscl.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_fnch" id="FNCH_ALL" parentId="BASEISSU" label="Fund Characteristics"> 
    <defaultFields> 
      <!--<field name="ft_t_fnch.chars_eff_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>-->        
    </defaultFields> 
  </occurrence><occurrence table="ft_t_isrt" id="ISRTBISSU" parentId="BASEISSU" multiple="true" label="Rating"> 
    <inputFields> 
      <field name="ft_t_isrt.rtng_curr_typ"/>  
      <field name="ft_t_isrt.rtng_purp_typ"/>  
      <field name="ft_t_isrt.rtng_set_oid"/>  
      <field name="ft_t_isrt.rtng_cde"/>  
      <field name="ft_t_isrt.start_tms"/>  
      <field name="ft_t_isrt.rtng_eff_tms"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isrt.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>     
    </defaultFields> 
  </occurrence><occurrence table="ft_t_isid" id="ISID_TIC_PM_PUB" parentId="MIXR_PRIM" label="Issue Identifier-Ticker" dbConstraint="MIXRISIDPUB"> 
    <where> 
      <field name="ft_t_isid.id_ctxt_typ" dataType="STRING" value="TICKER"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_isid.iss_id" label="Primary Ticker"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isid.isid_oid" dataType="STRING" srcOccurrence="MIXR_PRIM" valueOf="ft_t_mixr.isid_oid"/>  
      <field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_isid.mkt_oid" dataType="STRING" srcOccurrence="MKISPMBISSU" valueOf="ft_t_mkis.mkt_oid"/>  
      <field name="ft_t_isid.instr_id" dataType="STRING" srcOccurrence="BASEISSU" valueOf="ft_t_issu.instr_id"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_isxr" id="BISSU_ISXR_ISID" parentId="LISTISID_BISSU" multiple="true" autoDelete="false"> 
    <where> 
      <field name="ft_t_isxr.isid_oid" dataType="STRING" srcOccurrence="LISTISID_BISSU" valueOf="ft_t_isid.isid_oid"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_isxr.last_chg_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_isxr.last_chg_usr_id" dataType="STRING" valueOfFunction="APPUSER"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_isxr.isxr_rel_purp_typ"/>  
      <field name="ft_t_isxr.start_tms"/>  
      <field name="ft_t_isxr.end_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_must" id="MUST_MICOPOL" parentId="MKISDEFBISSU" autoDelete="false"> 
    <where> 
      <field name="ft_t_must.stat_def_id" dataType="STRING" value="MICOPOL"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_must.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_must.stat_char_val_txt" label="OPOL"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_must" id="MUST_CDREXCH" parentId="MKISDEFBISSU" autoDelete="false"> 
    <where> 
      <field name="ft_t_must.stat_def_id" dataType="STRING" value="CDREXCH"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_must.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_must.stat_char_val_txt" label="Exchange Calendar"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_ispc" id="ISPCBISSU" parentId="BASEISSU" label="Issue Price Details"> 
    <inputFields> 
      <field name="ft_t_ispc.prc_typ"/>  
      <field name="ft_t_ispc.prc_srce_typ"/>  
      <field name="ft_t_ispc.prc_tms"/>  
      <field name="ft_t_ispc.unit_cprc"/>  
      <field name="ft_t_ispc.prc_curr_cde"/> 
    </inputFields>  
    <defaultFields> 
      <!--      <field name="ft_t_ispc.prc_curr_cde" dataType="STRING" srcOccurrence="BASEISSU" valueOf="ft_t_issu.denom_curr_cde"/>  -->  
      <field name="ft_t_ispc.prc_qt_meth_typ" dataType="STRING" value="1"/>  
      <field name="ft_t_ispc.prc_valid_typ" dataType="STRING" value="VALID"/>  
      <field name="ft_t_ispc.prcng_meth_typ" dataType="STRING" value="1"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_ievp" id="IEVP_DIV_or_INT" parentId="IEDF_DIV_or_INT" label="Income Event Participant(Dividend/Interest)"> 
    <defaultFields> 
      <field name="ft_t_ievp.prt_purp_typ" dataType="STRING" value="PMTDTLS"/>  
      <field name="ft_t_ievp.start_tms" dataType="DATETIME" srcOccurrence="IEDF_DIV_or_INT" valueOf="ft_t_iedf.start_tms"/> 
    </defaultFields>  
    <!--<validationRules>
			<rule id="Unique_IPDF">
				<xPath value="is-unique(%modelPath:IPDF_DIV_or_INT%, &quot;concat(ipdf.pay_curr_cde, substring((ipdf.start_tms), 1, 10))&quot;)"/>
				<errorMessage value="Payment currency and Start Date/Time combination should be unique in Income Payments of Dividend/Interest Section"/>		
			</rule>
		</validationRules>--> 
  </occurrence><occurrence table="ft_t_pedf" id="PEDF_CALL_or_SINK" parentId="BASEISSU" label="Principal Event Definition(Call/Sink)" autoDelete="false"> 
    <inputFields> 
      <field name="ft_t_pedf.days_mth_bas_typ"/>  
      <field name="ft_t_pedf.days_yr_bas_typ"/>  
      <field name="ft_t_pedf.end_tms"/>  
      <field name="ft_t_pedf.first_py_tms" label="First Payment Date"/>  
      <field name="ft_t_pedf.py_dte_fq_qty" label="Payable Date Frequency"/>  
      <field name="ft_t_pedf.py_dte_fq_dy_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_sp_typ"/>  
      <field name="ft_t_pedf.start_tms"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_pedf.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_pedf.verif_ind" dataType="STRING" value="Y"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_pevp" id="PEVP_CALL_or_SINK" parentId="PEDF_CALL_or_SINK" label="Principal Event Participant(Call/Sink)" autoDelete="false"> 
    <defaultFields> 
      <field name="ft_t_pevp.start_tms" dataType="DATETIME" srcOccurrence="PEDF_CALL_or_SINK" valueOf="ft_t_pedf.start_tms" keepInSync="true"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_pevp.prt_purp_typ" dataType="STRING" value="SNKFDRED"/> 
    </where>  
    <validationRules> 
      <rule id="Unique_PPDF_Call_or_Sink"> 
        <xPath value="is-unique(%modelPath:PPDF_CALL_or_SINK%, &quot;concat(ppdf.pay_curr_cde,substring((ppdf.start_tms), 1, 10))&quot;)"/>  
        <!--        <xPath value="is-unique(%modelPath:PPDF_CALL_or_SINK%,&quot;substring((ppdf.start_tms), 1,10)&quot;)"/>  -->  
        <errorMessage value="Payment currency and Start Date/Time combination should be unique in Principal Payments of Call/Sink Section"/> 
      </rule> 
    </validationRules> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_CALL_or_SINK" parentId="PEVP_CALL_or_SINK" multiple="true" label="Principal Payment Definition(Call/Sink)" autoDelete="false"> 
    <inputFields> 
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.start_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/> 
    </inputFields>  
    <defaultFields/> 
  </occurrence><occurrence table="ft_t_pedf" id="PEDF_PUT_or_FACTOR" parentId="BASEISSU" label="Principal Event Defitnition(Put/Factor)" autoDelete="false"> 
    <inputFields> 
      <field name="ft_t_pedf.days_mth_bas_typ"/>  
      <field name="ft_t_pedf.days_yr_bas_typ"/>  
      <field name="ft_t_pedf.end_tms"/>  
      <field name="ft_t_pedf.first_py_tms" label="First Payment Date"/>  
      <field name="ft_t_pedf.py_dte_fq_dy_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_sp_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_qty" label="Payable Date Frequency"/>  
      <field name="ft_t_pedf.start_tms"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_pedf.verif_ind" dataType="STRING" value="Y"/>  
      <!--<field name="ft_t_pedf.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>--> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_PUT_or_FACTOR" parentId="PEVP_PUT_or_FACTOR" multiple="true" label="Principal Payment Definition(Factor)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_pedf" id="PEDF_PUT" parentId="BASEISSU" label="Principal Event Defitnition(Put)" autoDelete="false"> 
    <inputFields> 
      <field name="ft_t_pedf.days_mth_bas_typ"/>  
      <field name="ft_t_pedf.days_yr_bas_typ"/>  
      <field name="ft_t_pedf.end_tms"/>  
      <field name="ft_t_pedf.first_py_tms" label="First Payment Date"/>  
      <field name="ft_t_pedf.py_dte_fq_dy_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_sp_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_qty" label="Payable Date Frequency"/>  
      <field name="ft_t_pedf.start_tms"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_pedf.verif_ind" dataType="STRING" value="Y"/>  
      <!--<field name="ft_t_pedf.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>--> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_PUT" parentId="PEVP_PUT" multiple="true" label="Principal Payment Definition(Put)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_NEXTPUT" parentId="PEVP_NEXTPUT" multiple="true" label="Principal Payment Definition(NextPut)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_NXTPARPT" parentId="PEVP_NXTPARPT" multiple="true" label="Principal Payment Definition(NxtParpt)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_PUTPROV" parentId="PEVP_PUTPROV" multiple="true" label="Principal Payment Definition(PutProv)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_PUTSCHED" parentId="PEVP_PUTSCHED" multiple="true" label="Principal Payment Definition(PutSched)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_pedf" id="PEDF_CALLABLE" parentId="BASEISSU" label="Principal Event Defitnition(Call)" autoDelete="false"> 
    <inputFields> 
      <field name="ft_t_pedf.days_mth_bas_typ"/>  
      <field name="ft_t_pedf.days_yr_bas_typ"/>  
      <field name="ft_t_pedf.end_tms"/>  
      <field name="ft_t_pedf.first_py_tms" label="First Payment Date"/>  
      <field name="ft_t_pedf.py_dte_fq_dy_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_sp_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_qty" label="Payable Date Frequency"/>  
      <field name="ft_t_pedf.start_tms"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_pedf.verif_ind" dataType="STRING" value="Y"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_CALLABLE" parentId="PEVP_CALLABLE" multiple="true" label="Principal Payment Definition(Callable)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_pedf" id="PEDF_CALLED" parentId="BASEISSU" label="Principal Event Defitnition(Call)" autoDelete="false"> 
    <inputFields> 
      <field name="ft_t_pedf.days_mth_bas_typ"/>  
      <field name="ft_t_pedf.days_yr_bas_typ"/>  
      <field name="ft_t_pedf.end_tms"/>  
      <field name="ft_t_pedf.first_py_tms" label="First Payment Date"/>  
      <field name="ft_t_pedf.py_dte_fq_dy_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_sp_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_qty" label="Payable Date Frequency"/>  
      <field name="ft_t_pedf.start_tms"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_pedf.verif_ind" dataType="STRING" value="Y"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_CALLED" parentId="PEVP_CALLED" multiple="true" label="Principal Payment Definition(Called)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_pedf" id="PEDF_CALATPAR" parentId="BASEISSU" label="Principal Event Defitnition(Call)" autoDelete="false"> 
    <inputFields> 
      <field name="ft_t_pedf.days_mth_bas_typ"/>  
      <field name="ft_t_pedf.days_yr_bas_typ"/>  
      <field name="ft_t_pedf.end_tms"/>  
      <field name="ft_t_pedf.first_py_tms" label="First Payment Date"/>  
      <field name="ft_t_pedf.py_dte_fq_dy_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_sp_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_qty" label="Payable Date Frequency"/>  
      <field name="ft_t_pedf.start_tms"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_pedf.verif_ind" dataType="STRING" value="Y"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_CALATPAR" parentId="PEVP_CALATPAR" multiple="true" label="Principal Payment Definition(Calatpar)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_pedf" id="PEDF_CALATPRE" parentId="BASEISSU" label="Principal Event Defitnition(Call)" autoDelete="false"> 
    <inputFields> 
      <field name="ft_t_pedf.days_mth_bas_typ"/>  
      <field name="ft_t_pedf.days_yr_bas_typ"/>  
      <field name="ft_t_pedf.end_tms"/>  
      <field name="ft_t_pedf.first_py_tms" label="First Payment Date"/>  
      <field name="ft_t_pedf.py_dte_fq_dy_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_sp_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_qty" label="Payable Date Frequency"/>  
      <field name="ft_t_pedf.start_tms"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_pedf.verif_ind" dataType="STRING" value="Y"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_CALATPRE" parentId="PEVP_CALATPRE" multiple="true" label="Principal Payment Definition(Calatpre)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_isgp" id="ISGP_UNIV" parentId="BASEISSU" label="Issue Group Participant" multiple="true" dbConstraint="isgpuniv"> 
    <defaultFields> 
      <field name="ft_t_isgp.prt_purp_typ" dataType="STRING" value="MANUAL"/>  
      <field name="ft_t_isgp.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_isgp.prnt_iss_grp_oid"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_cucn" id="CUCN" parentId="BASEISSU"> 
    <defaultFields> 
      <field name="ft_t_cucn.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_cucf" id="CUCF" parentId="CUCN"> 
    <defaultFields> 
      <field name="ft_t_cucf.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_cucf.instr_id" dataType="STRING" valueOfXPath="/root/issue/issu.instr_id"/> 
    </defaultFields> 
  </occurrence><relations><table name="FT_T_ISID"><relation relatedTable="FT_T_ISSU" name="ISSUISID">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<condition>
					<sql>not exists (select 1 from ft_t_mixr mixr where (mixr.end_tms is null or mixr.end_tms  > SYSDATE()) and #FROM_TABLE#.ISID_OID=mixr.isid_oid) and #FROM_TABLE#.MKT_OID is null</sql>
				</condition>
		</relation></table><table name="FT_T_MIXR"><relation relatedTable="FT_T_ISID" name="MIXRISID">
			<fromColumns>
				<column name="ISID_OID"/>
			</fromColumns>
			<toColumns>
				<column name="ISID_OID"/>
			</toColumns>
			<condition>
        <sql>exists (select 1 from FT_T_MIXR mixr where (mixr.end_tms IS NULL or mixr.end_tms  > p_asOfDate) and #TO_TABLE#.ISID_OID=mixr.isid_oid)</sql>
			</condition>
		</relation></table><table name="FT_T_MIXR"><relation relatedTable="FT_T_ISID" name="MIXRISIDPUB">
			<fromColumns>
				<column name="ISID_OID"/>
			</fromColumns>
			<toColumns>
				<column name="ISID_OID"/>
			</toColumns>
			<condition>				
				<sql>exists (select 1 from FT_T_MIXR mixr where (mixr.end_tms IS NULL or mixr.end_tms  > SYSDATE()) and #TO_TABLE#.ISID_OID=mixr.isid_oid)</sql>				
			</condition>
		</relation></table><table name="FT_T_MKIS"><relation relatedTable="FT_T_ISSU" name="ISSUMKIS">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<condition>
				<sql>(#FROM_TABLE#.prim_trd_mkt_ind=''Y'' or (select count(*) from ft_t_mkis where ft_t_mkis.instr_id=#TO_TABLE#.instr_id and (ft_t_mkis.end_tms is null or ft_t_mkis.end_tms  >= SYSDATE()))=1)</sql>
			</condition>
		</relation></table><table name="FT_T_MIXR"><relation relatedTable="FT_T_MKIS" name="MKISMIXR">
			<fromColumns>
				<column name="MKT_ISS_OID"/>
			</fromColumns>
			<toColumns>
				<column name="MKT_ISS_OID"/>
			</toColumns>
		</relation></table><table name="FT_T_IEDF"><relation relatedTable="FT_T_ISSU" name="issuiedfinterest">
            <fromColumns>
                <column name="instr_id"/>
            </fromColumns>
            <toColumns>
                <column name="instr_id"/>
            </toColumns>
            <condition>
                <sql>#FROM_TABLE#.ev_typ IN (''INTEREST'')</sql>
            </condition>
        </relation></table><table name="FT_T_IPDF"><relation relatedTable="FT_T_IEVP" name="ipdfbasecpi">
            <fromColumns>
                <column name="INC_EV_PRT_ID"/>
            </fromColumns>
            <toColumns>
                <column name="INC_EV_PRT_ID"/>
            </toColumns>
            <condition>
                <sql>#FROM_TABLE#.rate_fixing_base_crte is not null and #FROM_TABLE#.start_tms = (select max(start_tms) from ft_t_ipdf where inc_ev_prt_id=#FROM_TABLE#.inc_ev_prt_id and rate_fixing_base_crte is not null)</sql>
            </condition>
        </relation></table><table name="FT_T_GNCM"><relation relatedTable="FT_T_IPDF" name="IPDFGNCMCSTM">
      <fromColumns>
        <column name="CROSS_REF_ID"/>
      </fromColumns>
      <toColumns>
        <column name="INC_PAY_DEF_ID"/>
      </toColumns>
      <condition>
        <sql>#FROM_TABLE#.GNCM_TBL_TYP = ''IPDF''</sql>
      </condition>
    </relation></table><table name="FT_T_ISID"><relation relatedTable="FT_T_ISSU" name="MRKTISID">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<condition>
				<sql>not exists (select 1 from ft_t_mixr mixr where (mixr.end_tms is null or mixr.end_tms  > SYSDATE()) and #FROM_TABLE#.ISID_OID=mixr.isid_oid) and #FROM_TABLE#.MKT_OID is not null</sql>
		</condition>
		</relation></table><table name="FT_T_ISID"><relation relatedTable="FT_T_ISSU" name="MRKTISIDPUB">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<condition>			
				<sql>not exists (select 1 from ft_t_mixr mixr where (mixr.end_tms is null or mixr.end_tms  > SYSDATE()) and #FROM_TABLE#.ISID_OID=mixr.isid_oid) and #FROM_TABLE#.MKT_OID is not null</sql>			
			</condition>
		</relation></table><table name="FT_T_ISCL"><relation relatedTable="FT_T_ISSU" name="SUBTYPE">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<condition>
				<sql>#FROM_TABLE#.indus_cl_set_id in (''TKISSTYP'',''BBSECTYP'',''FTISSTYP'',''ASSETCLS'')</sql>
			</condition>
		</relation></table><table name="FT_T_ISCL"><relation relatedTable="FT_T_ISSU" name="SUBTYPE">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<condition>
				<sql>#FROM_TABLE#.indus_cl_set_id in (''TKISSTYP'',''BBSECTYP'',''FTISSTYP'',''ASSETCLS'')</sql>
			</condition>
		</relation></table><table name="FT_T_ISLL"><relation relatedTable="FT_T_ISSU" name="isllissu">
            <fromColumns>
                <column name="instr_id"/>
            </fromColumns>
            <toColumns>
                <column name="instr_id"/>
            </toColumns>
            <condition>
                <sql>#FROM_TABLE#.last_chg_tms in (SELECT max(last_chg_tms) FROM ft_t_isll where instr_id = #TO_TABLE#.instr_id)</sql>
            </condition>
        </relation></table><table name="FT_T_RIST"><relation relatedTable="FT_T_ISSU" name="RIST_INSTR">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
		</relation></table><table name="FT_T_LMST"><relation relatedTable="FT_T_ISSU" name="latestlmst">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<condition>
				<sql>#FROM_TABLE#.last_chg_tms = (SELECT MAX (last_chg_tms) FROM ft_t_lmst WHERE ft_t_lmst.instr_id = #TO_TABLE#.instr_id)</sql>
			</condition>
		</relation></table><table name="FT_T_ISGU"><relation relatedTable="FT_T_ISSU" name="ISSUISGU">
            <fromColumns>
                <column name="INSTR_ID"/>
            </fromColumns>
            <toColumns>
                <column name="INSTR_ID"/>
            </toColumns>
            <condition>
                <sql>#FROM_TABLE#.gu_typ =''COUNTRY''</sql>
            </condition>
        </relation></table><table name="FT_T_AISR"><relation relatedTable="FT_T_ISSU" name="MyAccountIssueRole">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<condition>
				<sql>#FROM_TABLE#.ACCT_ISSU_RL_TYP is not null</sql>
			</condition>
		</relation></table><table name="FT_T_AISR"><relation relatedTable="FT_T_ISSU" name="MyIssueAccountRole">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<!--Commented as AISR.ISSU_ACCT_RL_TYP has been removed (GT 37778)-->
			<!--<condition>
        <sql>#FROM_TABLE#.ISSU_ACCT_RL_TYP is not null</sql>
      </condition>-->
		</relation></table><table name="FT_T_ISRT"><relation relatedTable="FT_T_ISSU" name="RTNG_HIST" checkService="RATING_SERVICE">
			<condition>
				<sql>#FROM_TABLE#.SYS_EFF_END_TMS IS NULL AND (#FROM_TABLE#.INSTR_ID) = (#TO_TABLE#.INSTR_ID)</sql>
			</condition>
		</relation></table><table name="FT_T_MKIS"><relation relatedTable="FT_T_ISPC" name="LATESTPRICE">
			<fromColumns>
				<column name="INSTR_ID"/>
				<column name="MKT_OID"/>
				<column name="PRC_CURR_CDE"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
				<column name="MKT_OID"/>
				<column name="PRC_CURR_CDE"/>
			</toColumns>
			<condition>
				<sql>#TO_TABLE#.prc_tms = 
             (select max(prc_tms)
                from ft_t_ispc maxprc
               where maxprc.instr_id = #TO_TABLE#.instr_id
                 and maxprc.mkt_oid = #TO_TABLE#.mkt_oid
                 and maxprc.prc_curr_cde = #TO_TABLE#.prc_curr_cde)</sql>
			</condition>
		</relation></table><table name="FT_T_MUST"><relation relatedTable="FT_T_MKIS" name="mkismust">
            <fromColumns>
                <column name="MKT_ISS_OID"/>
            </fromColumns>
            <toColumns>
                <column name="MKT_ISS_OID"/>
            </toColumns>
        </relation></table><table name="FT_T_ISPC"><relation name="latestclosingprice" relatedTable="FT_T_ISSU">
            <fromColumns>
                <column name="INSTR_ID"/>
            </fromColumns>
            <toColumns>
                <column name="INSTR_ID"/>
            </toColumns>
            <condition>
                <sql>(#FROM_TABLE#.last_chg_tms
                      , #FROM_TABLE#.prc_tms
                      , COALESCE (#FROM_TABLE#.data_src_id, ''999'')
                      , #FROM_TABLE#.prc_srce_typ
                      , #FROM_TABLE#.prc_typ
                      || COALESCE (TRIM (#FROM_TABLE#.addnl_prc_qual_typ), ''999'')) IN
                            (  SELECT   MAX (last_chg_tms)
                                        , MAX (prc_tms)
                                        , COALESCE (data_src_id, ''999'')
                                        , prc_srce_typ
                                        , prc_typ
                                        || COALESCE (TRIM (addnl_prc_qual_typ), ''999'')
                                 FROM   ft_t_ispc ispc1
                                WHERE   instr_id = #FROM_TABLE#.instr_id
                                AND trim(prc_typ) || trim(addnl_prc_qual_typ) IN (''BID2171'',''ASKED2124'',''ASKED1'',''0031'',''0033'',''ASKED3'')      
                             GROUP BY   prc_tms,
                                        data_src_id,
                                        prc_srce_typ,
                                        prc_typ,
                                        addnl_prc_qual_typ,
                                        prc_qt_meth_typ)</sql>
            </condition>
        </relation></table><table name="FT_T_IEVP"><relation relatedTable="FT_T_IEDF" name="iedfievpestdiv">
            <fromColumns>
                <column name="INC_EV_DEF_ID"/>
            </fromColumns>
            <toColumns>
                <column name="INC_EV_DEF_ID"/>
            </toColumns>
            <condition>
                <sql>#FROM_TABLE#.prt_purp_typ IN (''ESTIMATE'',''DIVIDEND'')</sql>
            </condition>
        </relation></table><table name="FT_T_PEDF"><relation relatedTable="FT_T_ISSU" name="pedffactorissu">
            <fromColumns>
                <column name="instr_id"/>
            </fromColumns>
            <toColumns>
                <column name="instr_id"/>
            </toColumns>
            <condition>
                <sql>#FROM_TABLE#.ev_typ IN (''FACTOR'')</sql>
            </condition>
        </relation></table><table name="FT_T_PEVP"><relation relatedTable="FT_T_PEDF" name="pevpfactorissu">
            <fromColumns>
                <column name="prin_ev_def_id"/>
            </fromColumns>
            <toColumns>
                <column name="prin_ev_def_id"/>
            </toColumns>
            <condition>
                <sql>#FROM_TABLE#.prt_purp_typ IN (''FACTOR'')</sql>
            </condition>
        </relation></table><table name="FT_T_PPDF"><relation relatedTable="FT_T_PEVP" name="ppdf_pevp">
            <fromColumns>
                <column name="PRIN_EV_PRT_ID"/>
            </fromColumns>
            <toColumns>
                <column name="PRIN_EV_PRT_ID"/>
            </toColumns>
            <condition>
                <sql>ROWNUM=1</sql>
            </condition>
        </relation></table><table name="FT_T_IRCL"><relation relatedTable="FT_T_ISSU" name="IRCL_ISSU">
			<fromColumns>
				<column name="INSTR_ISSR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ISSR_ID"/>
			</toColumns>
			<condition>
				<sql>(#FROM_TABLE#.instr_id = #TO_TABLE#.instr_id or #FROM_TABLE#.instr_id is null)</sql> 
			</condition>
		</relation></table><table name="FT_T_ISGP"><relation relatedTable="FT_T_ISSU" name="isgpuniv">
			<fromColumns>
				<column name="instr_id"/>
			</fromColumns>
			<toColumns>
				<column name="instr_id"/>
			</toColumns>
			<condition>
				<sql>TRIM(#FROM_TABLE#.PRNT_ISS_GRP_OID) in (SELECT TRIM(ISS_GRP_OID) FROM FT_T_ISGR WHERE GRP_PURP_TYP=''UNIVERSE'')</sql>
			</condition>
		</relation></table></relations></model>' WHERE modl_id ='EQUITY' AND modl_typ = 'ISSU';
		
UPDATE FT_T_MDDF SET modl_schema ='<?xml version="1.0" encoding="UTF-8"?>
<model xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" id="FINS0001" headerInfoXPath="concat(''Financial Institution - '',/root/fins/fins.inst_nme)" xsi:noNamespaceSchemaLocation="../../schemas/Model.xsd">  
  <occurrence table="ft_t_fins" id="FINS_1" level="1"> 
    <inputFields> 
      <field name="ft_t_fins.assoc_inst_mnem"/>  
      <field name="ft_t_fins.org_id"/>  
      <field name="ft_t_fins.fiscal_yr_end_typ"/>  
      <field name="ft_t_fins.business_start_yr_typ"/>  
      <field name="ft_t_fins.pref_fins_id_ctxt_typ"/>  
      <field name="ft_t_fins.start_tms" level="1"/>  
      <field name="ft_t_fins.end_tms"/>  
      <field name="ft_t_fins.inst_nme"/>  
      <field name="ft_t_fins.inst_desc"/>  
      <field name="ft_t_fins.bal_sheet_curr_cde"/>  
      <field name="ft_t_fins.business_structure_typ"/>  
      <field name="ft_t_fins.cmrcl_regist_delete_dte"/>  
      <field name="ft_t_fins.cmrcl_regist_entry_dte"/>  
      <field name="ft_t_fins.data_stat_typ"/>  
      <field name="ft_t_fins.delete_reas_typ"/>  
      <field name="ft_t_fins.import_export_agent_typ"/>  
      <field name="ft_t_fins.inst_founding_dte"/>  
      <field name="ft_t_fins.inst_legal_form_typ"/>  
      <field name="ft_t_fins.inst_stat_typ"/>  
      <field name="ft_t_fins.inst_typ"/>  
      <field name="ft_t_fins.mail_dlvblty_typ"/>  
      <field name="ft_t_fins.nls_cde"/>  
      <field name="ft_t_fins.pref_fins_id"/>  
      <field name="ft_t_fins.public_corp_ind"/>  
      <field name="ft_t_fins.subsidiary_ind"/>  
      <field name="ft_t_fins.company_match_id"/>  
      <field name="ft_t_fins.fund_srce_typ"/>  
      <field name="ft_t_fins.lei_legal_form_txt"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_fins.start_tms" valueOfFunction="CURRTMS" dataType="DATETIME"/>  
      <field name="ft_t_fins.inst_mnem" valueOfFunction="OID" dataType="STRING"/>  
      <field name="ft_t_fins.inst_nme" dataType="STRING" srcOccurrence="FIDE_1" valueOf="ft_t_fide.inst_nme"/>  
      <field name="ft_t_fins.inst_desc" dataType="STRING" srcOccurrence="FIDE_1" valueOf="ft_t_fide.inst_desc"/>  
      <!--<field name="ft_t_fins.pref_fins_id" valueOf="ft_t_fiid.fins_id" srcOccurrence="FIID_PREF" dataType="STRING" uiOnly="true"/>  
      <field name="ft_t_fins.pref_fins_id_ctxt_typ" valueOf="ft_t_fiid.fins_id_ctxt_typ" srcOccurrence="FIID_PREF" dataType="STRING" uiOnly="true"/>--> 
    </defaultFields>  
    <validationRules> 
      <rule id="ValidationMKID"> 
        <xPath value="boolean((count(/root/finsidentifiers/finsidentifier[@status!=''deleted'' or string-length(@status)=0]) >0)  or (/root/fins[@status!=''new'' or  string-length(@status)=0]))"/>  
        <errorMessage value="At least one Financial Institution Identifier has to be entered."/> 
      </rule>  
      <rule id="ADDRESS_PURPOSE_1"> 
        <xPath value="boolean(    (string(%modelPath:ADPU_2:ft_t_adpu.addr_purp_typ%) != string(%modelPath:ADPU_5:ft_t_adpu.addr_purp_typ%)) or (string-length(%modelPath:ADPU_2:ft_t_adpu.addr_purp_typ%)=0 and string-length(%modelPath:ADPU_5:ft_t_adpu.addr_purp_typ%)=0)    )"/>  
        <errorMessage value="Address purpose field cannot have the same values for different sections"/> 
      </rule>  
      <rule id="ADDRESS_PURPOSE_2"> 
        <xPath value="boolean(    (string(%modelPath:ADPU_3:ft_t_adpu.addr_purp_typ%) != string(%modelPath:ADPU_4:ft_t_adpu.addr_purp_typ%)) or (string-length(%modelPath:ADPU_3:ft_t_adpu.addr_purp_typ%)=0 and string-length(%modelPath:ADPU_4:ft_t_adpu.addr_purp_typ%)=0)    )"/>  
        <errorMessage value="Address purpose field cannot have the same values for different sections"/> 
      </rule>  
      <rule id="ADDRESS_PURPOSE_3"> 
        <xPath value="boolean(    (string(%modelPath:ADPU_2:ft_t_adpu.addr_purp_typ%) != string(%modelPath:ADPU_3:ft_t_adpu.addr_purp_typ%)) or (string-length(%modelPath:ADPU_2:ft_t_adpu.addr_purp_typ%)=0 and string-length(%modelPath:ADPU_3:ft_t_adpu.addr_purp_typ%)=0)    )"/>  
        <errorMessage value="Address purpose field cannot have the same values for different sections"/> 
      </rule>  
      <rule id="ADDRESS_PURPOSE_4"> 
        <xPath value="boolean(    (string(%modelPath:ADPU_2:ft_t_adpu.addr_purp_typ%) != string(%modelPath:ADPU_4:ft_t_adpu.addr_purp_typ%)) or (string-length(%modelPath:ADPU_2:ft_t_adpu.addr_purp_typ%)=0 and string-length(%modelPath:ADPU_4:ft_t_adpu.addr_purp_typ%)=0)    )"/>  
        <errorMessage value="Address purpose field cannot have the same values for different sections"/> 
      </rule>  
      <rule id="ADDRESS_PURPOSE_5"> 
        <xPath value="boolean(    (string(%modelPath:ADPU_5:ft_t_adpu.addr_purp_typ%) != string(%modelPath:ADPU_3:ft_t_adpu.addr_purp_typ%)) or (string-length(%modelPath:ADPU_5:ft_t_adpu.addr_purp_typ%)=0 and string-length(%modelPath:ADPU_3:ft_t_adpu.addr_purp_typ%)=0)    )"/>  
        <errorMessage value="Address purpose field cannot have the same values for different sections"/> 
      </rule>  
      <rule id="ADDRESS_PURPOSE_6"> 
        <xPath value="boolean(    (string(%modelPath:ADPU_5:ft_t_adpu.addr_purp_typ%) != string(%modelPath:ADPU_4:ft_t_adpu.addr_purp_typ%)) or (string-length(%modelPath:ADPU_5:ft_t_adpu.addr_purp_typ%)=0 and string-length(%modelPath:ADPU_4:ft_t_adpu.addr_purp_typ%)=0)     )"/>  
        <errorMessage value="Address purpose field cannot have the same values for different sections"/> 
      </rule>  
      <rule id="Multiple_Internal_Ratings"> 
        <xPath value="count(%modelPath:FIRT_1%[firt.rtng_set_oid = ''MIZRTNG7'' and string-length(firt.end_tms) = 0])  <  2"/>  
        <errorMessage value="You cannot have more than one Internal Party rating"/> 
      </rule> 
    </validationRules> 
  </occurrence>  
  <!--	<occurrence table="ft_t_gncm" id="GNCM_1" parentId="FINS_1" multiple="true">
		<where>
			<field name="ft_t_gncm.gncm_tbl_typ" value="FINS" dataType="STRING"/>
		</where>
		<defaultFields>
			<field name="ft_t_gncm.created_tms" valueOfFunction="CURRTMS" dataType="DATETIME"/>	
			<field name="ft_t_gncm.ln_num" value="1" dataType="NUMBER"/>
		</defaultFields>
		<inputFields>
			<field name="ft_t_gncm.cmnt_txt" level="1"/>
			<field name="ft_t_gncm.nls_cde"/>
			<field name="ft_t_gncm.comm_reas_mnem"/>
		</inputFields>
	</occurrence> -->  
  <occurrence table="ft_t_cost" id="COST_1" parentId="FINS_1"> 
    <defaultFields> 
      <field name="ft_t_cost.stats_eff_tms" valueOfFunction="CURRTMS" dataType="DATETIME"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_cost.stats_eff_tms"/>  
      <field name="ft_t_cost.stats_curr_cde"/>  
      <field name="ft_t_cost.emp_cqty"/>  
      <field name="ft_t_cost.emp_qty_typ"/>  
      <field name="ft_t_cost.ceo_nme"/>  
      <field name="ft_t_cost.ceo_titl_txt"/>  
      <field name="ft_t_cost.annual_sales_typ"/>  
      <field name="ft_t_cost.fincl_stmnt_dte"/>  
      <field name="ft_t_cost.report_review_dte"/> 
    </inputFields> 
  </occurrence>  
  <occurrence table="ft_t_ccrf" id="CCRF_1" parentId="FINS_1"> 
    <defaultFields> 
      <field name="ft_t_ccrf.start_tms" valueOfFunction="CURRTMS" dataType="DATETIME"/>  
      <field name="ft_t_ccrf.fins_inst_mnem" valueOf="ft_t_fins.inst_mnem" srcOccurrence="FINS_1" dataType="STRING"/>  
      <field name="ft_t_ccrf.cross_ref_purp_typ" value="FINS" dataType="STRING"/> 
    </defaultFields> 
  </occurrence>  
  <!-- Address occurrences -->  
  <occurrence table="ft_t_adtp" id="ADTP_1" parentId="CCRF_1" autoCreate="false" multiple="true"> 
    <defaultFields> 
      <field name="ft_t_adtp.start_tms" valueOfFunction="CURRTMS" dataType="DATETIME"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_adtp.addr_typ"/> 
    </inputFields>  
    <!-- This rule will check for duplicate records of ADST within ADTP -->  
    <validationRules> 
      <rule id="Unique_ADTP_ADST"> 
        <xPath value="is-unique(%modelPath:ADST_1%, ''concat(adst.addr_typ_id, adst.stat_def_id, adst.denom_curr_cde)'')"/>  
        <errorMessage value="Statistic Name and Denominated Currency combination should be unique in Address Type Usage Statistics screen"/> 
      </rule> 
    </validationRules> 
  </occurrence>  
  <occurrence table="ft_t_adtp" id="ADTP_2" parentId="CCRF_1"> 
    <where activeOnly="false"> 
      <field name="ft_t_adtp.addr_typ" value="MAILING" dataType="STRING"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_adtp.start_tms" valueOfFunction="CURRTMS" dataType="DATETIME"/> 
    </defaultFields> 
  </occurrence>  
  <occurrence table="ft_t_adtp" id="ADTP_3" parentId="CCRF_1"> 
    <where activeOnly="false"> 
      <field name="ft_t_adtp.addr_typ" value="PHONENO" dataType="STRING"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_adtp.start_tms" valueOfFunction="CURRTMS" dataType="DATETIME"/> 
    </defaultFields> 
  </occurrence>  
  <occurrence table="ft_t_adtp" id="ADTP_4" parentId="CCRF_1"> 
    <where activeOnly="false"> 
      <field name="ft_t_adtp.addr_typ" value="FAXTLXNO" dataType="STRING"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_adtp.start_tms" valueOfFunction="CURRTMS" dataType="DATETIME"/> 
    </defaultFields> 
  </occurrence>  
  <occurrence table="ft_t_adtp" id="ADTP_5" parentId="CCRF_1"> 
    <where activeOnly="false"> 
      <field name="ft_t_adtp.addr_typ" value="REGISTER" dataType="STRING"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_adtp.start_tms" valueOfFunction="CURRTMS" dataType="DATETIME"/> 
    </defaultFields> 
  </occurrence>  
  <occurrence table="ft_t_eadr" id="EADR_1" parentId="ADTP_1" autoCreate="false" multiple="false"> 
    <defaultFields> 
      <field name="ft_t_eadr.start_tms" valueOf="ft_t_fins.start_tms" srcOccurrence="FINS_1" dataType="DATETIME"/>  
      <field name="ft_t_eadr.end_tms" valueOf="ft_t_fins.end_tms" srcOccurrence="FINS_1" dataType="DATETIME"/>  
      <field name="ft_t_eadr.id_ctxt_typ" valueOf="ft_t_fins.pref_fins_id_ctxt_typ" dataType="STRING"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_eadr.cntry_phone_cde"/>  
      <field name="ft_t_eadr.area_phone_cde"/>  
      <field name="ft_t_eadr.phone_num_id"/>  
      <field name="ft_t_eadr.phone_num_ext_id"/> 
	  <field name="ft_t_eadr.voice_ind"/>  
      <field name="ft_t_eadr.fax_ind"/> 
      <field name="ft_t_eadr.id_ctxt_typ"/>  
      <field name="ft_t_eadr.eadr_val_num"/>  
      <field name="ft_t_eadr.dial_instruc_txt"/>  
      <field name="ft_t_eadr.web_nme"/>  
      <field name="ft_t_eadr.long_elec_addr_txt"/>  
      <field name="ft_t_eadr.end_tms"/>  
      <field name="ft_t_eadr.start_tms"/>  
      <field name="ft_t_eadr.fax_num_id"/>  
      <field name="ft_t_eadr.e_mail_addr_txt"/> 
    </inputFields> 
  </occurrence>  
  <occurrence table="ft_t_eadr" id="EADR_2" parentId="ADTP_3" autoCreate="false" multiple="false"> 
    <defaultFields> 
      <field name="ft_t_eadr.start_tms" valueOf="ft_t_fins.start_tms" srcOccurrence="FINS_1" dataType="DATETIME"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_eadr.cntry_phone_cde"/>  
      <field name="ft_t_eadr.area_phone_cde"/>  
      <field name="ft_t_eadr.phone_num_id"/>  
      <field name="ft_t_eadr.phone_num_ext_id"/> 
	  <field name="ft_t_eadr.voice_ind"/>  
      <field name="ft_t_eadr.fax_ind"/> 
      <field name="ft_t_eadr.id_ctxt_typ"/>  
      <field name="ft_t_eadr.eadr_val_num"/>  
      <field name="ft_t_eadr.web_nme"/> 
    </inputFields> 
  </occurrence>  
  <occurrence table="ft_t_eadr" id="EADR_3" parentId="ADTP_4" autoCreate="false" multiple="false"> 
    <defaultFields> 
      <field name="ft_t_eadr.start_tms" valueOf="ft_t_fins.start_tms" srcOccurrence="FINS_1" dataType="DATETIME"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_eadr.cntry_phone_cde"/>  
      <field name="ft_t_eadr.area_phone_cde"/>  
      <field name="ft_t_eadr.phone_num_id"/>  
      <field name="ft_t_eadr.phone_num_ext_id"/> 
	  <field name="ft_t_eadr.voice_ind"/>  
      <field name="ft_t_eadr.fax_ind"/> 
      <field name="ft_t_eadr.id_ctxt_typ"/>  
      <field name="ft_t_eadr.eadr_val_num"/>  
      <field name="ft_t_eadr.web_nme"/> 
    </inputFields> 
  </occurrence>  
  <occurrence table="ft_t_madr" id="MADR_1" parentId="ADTP_1" autoCreate="false" multiple="false"> 
    <defaultFields> 
      <field name="ft_t_madr.start_tms" valueOf="ft_t_fins.start_tms" srcOccurrence="FINS_1" dataType="DATETIME"/>  
      <field name="ft_t_madr.start_tms" valueOf="ft_t_fins.end_tms" srcOccurrence="FINS_1" dataType="DATETIME"/>  
      <field name="ft_t_madr.nls_cde" value="ENGLISH" dataType="STRING"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_madr.nls_cde"/>  
      <field name="ft_t_madr.attention_txt"/>  
      <field name="ft_t_madr.addr_locale_typ"/>  
      <field name="ft_t_madr.addr_ln1_txt"/>  
      <field name="ft_t_madr.addr_ln2_txt"/>  
      <field name="ft_t_madr.addr_ln3_txt"/>  
      <field name="ft_t_madr.addr_ln4_txt"/>  
      <field name="ft_t_madr.city_cde"/>  
      <field name="ft_t_madr.city_cde_typ"/>  
      <field name="ft_t_madr.township_nme"/>  
      <field name="ft_t_madr.cnty_cde"/>  
      <field name="ft_t_madr.cnty_cde_typ"/>  
      <field name="ft_t_madr.cnty_nme"/>  
      <field name="ft_t_madr.city_nme"/>  
      <field name="ft_t_madr.ste_prv_cde"/>  
      <field name="ft_t_madr.ste_prv_nme"/>  
      <field name="ft_t_madr.cntry_cde"/>  
      <field name="ft_t_madr.cntry_nme"/>  
      <field name="ft_t_madr.postal_cde"/>  
      <field name="ft_t_madr.registered_addr_ind"/>  
      <field name="ft_t_madr.continent_cde"/>  
      <field name="ft_t_madr.vanity_city_nme"/>  
      <field name="ft_t_madr.neighborhood_nme"/>  
      <field name="ft_t_madr.cntry_subdiv_cde"/>  
      <field name="ft_t_madr.end_tms"/>  
      <field name="ft_t_madr.start_tms"/> 
    </inputFields> 
  </occurrence>  
  <occurrence table="ft_t_madc" id="MADC_1" parentId="MADR_1" autoCreate="false" multiple="false"> 
    <defaultFields> 
      <field name="ft_t_madc.start_tms" valueOfFunction="CURRTMS" dataType="DATETIME"/>  
      <field name="ft_t_madc.mail_addr_id" valueOf="ft_t_madr.mail_addr_id" srcOccurrence="MADR_1" dataType="STRING"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_madc.house_num_typ"/>  
      <field name="ft_t_madc.street_nme"/>  
      <field name="ft_t_madc.street_typ"/>  
      <field name="ft_t_madc.prefix_street_dir_typ"/>  
      <field name="ft_t_madc.suffix_street_dir_typ"/>  
      <field name="ft_t_madc.route_nme"/>  
      <field name="ft_t_madc.route_num_typ"/>  
      <field name="ft_t_madc.box_nme"/>  
      <field name="ft_t_madc.box_num_typ"/>  
      <field name="ft_t_madc.box_typ"/>  
      <field name="ft_t_madc.complex_nme"/>  
      <field name="ft_t_madc.complex_typ"/>  
      <field name="ft_t_madc.dwelling_nme"/>  
      <field name="ft_t_madc.dwelling_typ"/>  
      <field name="ft_t_madc.dwelling_num_typ"/>  
      <field name="ft_t_madc.official_city_nme"/>  
      <field name="ft_t_madc.parser_city_cde"/>  
      <field name="ft_t_madc.usps_dlv_point_cde"/>  
      <field name="ft_t_madc.usps_dlv_point_code_cde"/>  
      <field name="ft_t_madc.usps_post_office_cde"/>  
      <field name="ft_t_madc.usps_carrier_route_typ"/>  
      <field name="ft_t_madc.usps_dlv_addr_txt"/>  
      <field name="ft_t_madc.usps_zip_plus_4_cde"/>  
      <field name="ft_t_madc.start_tms"/>  
      <field name="ft_t_madc.end_tms"/> 
    </inputFields> 
  </occurrence>  
  <occurrence table="ft_t_madr" id="MADR_2" parentId="ADTP_2" autoCreate="false" multiple="false"> 
    <defaultFields> 
      <field name="ft_t_madr.start_tms" valueOfFunction="CURRTMS" dataType="DATETIME"/> 
    </defaultFields>  
    <inputFields> 
      <!--field name="ft_t_madr.addr_attention_txt"/-->  
      <field name="ft_t_madr.addr_locale_typ"/>  
      <field name="ft_t_madr.addr_ln1_txt"/>  
      <field name="ft_t_madr.addr_ln2_txt"/>  
      <field name="ft_t_madr.addr_ln3_txt"/>  
      <field name="ft_t_madr.addr_ln4_txt"/>  
      <field name="ft_t_madr.township_nme"/>  
      <field name="ft_t_madr.city_nme"/>  
      <field name="ft_t_madr.city_cde"/>  
      <field name="ft_t_madr.city_cde_typ"/>  
      <field name="ft_t_madr.cnty_nme"/>  
      <field name="ft_t_madr.cnty_cde"/>  
      <field name="ft_t_madr.cnty_cde_typ"/>  
      <field name="ft_t_madr.ste_prv_cde"/>  
      <field name="ft_t_madr.postal_cde"/>  
      <field name="ft_t_madr.cntry_cde"/>  
      <field name="ft_t_madr.registered_addr_ind"/>  
      <field name="ft_t_madr.continent_cde"/>  
      <field name="ft_t_madr.cntry_subdiv_cde"/> 
    </inputFields> 
  </occurrence>  
  <occurrence table="ft_t_madr" id="MADR_3" parentId="ADTP_5" autoCreate="false" multiple="false"> 
    <defaultFields> 
      <field name="ft_t_madr.start_tms" valueOfFunction="CURRTMS" dataType="DATETIME"/> 
    </defaultFields>  
    <inputFields> 
      <!--field name="ft_t_madr.addr_attention_txt"/-->  
      <field name="ft_t_madr.addr_locale_typ"/>  
      <field name="ft_t_madr.addr_ln1_txt"/>  
      <field name="ft_t_madr.addr_ln2_txt"/>  
      <field name="ft_t_madr.addr_ln3_txt"/>  
      <field name="ft_t_madr.addr_ln4_txt"/>  
      <field name="ft_t_madr.township_nme"/>  
      <field name="ft_t_madr.city_nme"/>  
      <field name="ft_t_madr.city_cde"/>  
      <field name="ft_t_madr.city_cde_typ"/>  
      <field name="ft_t_madr.cnty_nme"/>  
      <field name="ft_t_madr.cnty_cde"/>  
      <field name="ft_t_madr.cnty_cde_typ"/>  
      <field name="ft_t_madr.ste_prv_cde"/>  
      <field name="ft_t_madr.postal_cde"/>  
      <field name="ft_t_madr.cntry_cde"/>  
      <field name="ft_t_madr.registered_addr_ind"/>  
      <field name="ft_t_madr.continent_cde"/>  
      <field name="ft_t_madr.cntry_subdiv_cde"/> 
    </inputFields> 
  </occurrence>  
  <occurrence table="ft_t_eapr" id="EAPR_1" parentId="EADR_1" autoCreate="false" multiple="false"> 
    <defaultFields> 
      <field name="ft_t_eapr.start_tms" valueOfFunction="CURRTMS" dataType="DATETIME"/>  
      <field name="ft_t_eapr.cntl_cross_ref_oid" valueOf="ft_t_adtp.cntl_cross_ref_oid" srcOccurrence="ADTP_1" dataType="STRING"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_eapr.pref_rank_ind"/> 
    </inputFields> 
  </occurrence>  
  <occurrence table="ft_t_adpu" id="ADPU_1" parentId="ADTP_1" autoCreate="false" multiple="false"> 
    <defaultFields> 
      <field name="ft_t_adpu.start_tms" valueOfFunction="CURRTMS" dataType="DATETIME"/>  
      <field name="ft_t_adpu.addr_purp_id" dataType="STRING" valueOfFunction="OID"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_adpu.addr_purp_typ"/>  
      <field name="ft_t_adpu.addr_purp_desc"/> 
    </inputFields> 
  </occurrence>  
  <occurrence table="ft_t_adpu" id="ADPU_2" parentId="ADTP_2" autoCreate="false" multiple="false"> 
    <defaultFields> 
      <field name="ft_t_adpu.start_tms" valueOfFunction="CURRTMS" dataType="DATETIME"/>  
      <field name="ft_t_adpu.addr_purp_id" dataType="STRING" valueOfFunction="OID"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_adpu.addr_purp_typ"/>  
      <field name="ft_t_adpu.addr_purp_desc"/> 
    </inputFields> 
  </occurrence>  
  <occurrence table="ft_t_adpu" id="ADPU_3" parentId="ADTP_3" autoCreate="false" multiple="false"> 
    <defaultFields> 
      <field name="ft_t_adpu.start_tms" valueOfFunction="CURRTMS" dataType="DATETIME"/>  
      <field name="ft_t_adpu.addr_purp_id" dataType="STRING" valueOfFunction="OID"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_adpu.addr_purp_typ"/>  
      <field name="ft_t_adpu.addr_purp_desc"/> 
    </inputFields> 
  </occurrence>  
  <occurrence table="ft_t_adpu" id="ADPU_4" parentId="ADTP_4" autoCreate="false" multiple="false"> 
    <defaultFields> 
      <field name="ft_t_adpu.start_tms" valueOfFunction="CURRTMS" dataType="DATETIME"/>  
      <field name="ft_t_adpu.addr_purp_id" dataType="STRING" valueOfFunction="OID"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_adpu.addr_purp_typ"/>  
      <field name="ft_t_adpu.addr_purp_desc"/> 
    </inputFields> 
  </occurrence>  
  <occurrence table="ft_t_adpu" id="ADPU_5" parentId="ADTP_5" autoCreate="false" multiple="false"> 
    <defaultFields> 
      <field name="ft_t_adpu.start_tms" valueOfFunction="CURRTMS" dataType="DATETIME"/>  
      <field name="ft_t_adpu.addr_purp_id" dataType="STRING" valueOfFunction="OID"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_adpu.addr_purp_typ"/>  
      <field name="ft_t_adpu.addr_purp_desc"/> 
    </inputFields> 
  </occurrence>  
  <occurrence table="ft_t_addu" id="ADDU_EADR" parentId="EADR_1" autoCreate="false" multiple="false"> 
    <defaultFields> 
      <field name="ft_t_addu.start_tms" valueOfFunction="CURRTMS" dataType="DATETIME"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_addu.prd_start_dy_typ"/>  
      <field name="ft_t_addu.prd_end_dy_typ"/> 
    </inputFields> 
  </occurrence>  
  <occurrence table="ft_t_addu" id="ADDU_MADR" parentId="MADR_1" autoCreate="false" multiple="false"> 
    <defaultFields> 
      <field name="ft_t_addu.start_tms" valueOfFunction="CURRTMS" dataType="DATETIME"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_addu.prd_start_dy_typ"/>  
      <field name="ft_t_addu.prd_end_dy_typ"/> 
    </inputFields> 
  </occurrence>  
  <!--Riten-->  
  <occurrence table="ft_t_fide" id="FIDE_1" parentId="FINS_1"> 
    <defaultFields> 
      <field name="ft_t_fide.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_fide.desc_usage_typ" dataType="STRING" value="PRIMARY"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_fide.inst_nme"/>  
      <field name="ft_t_fide.inst_desc"/> 
    </inputFields> 
  </occurrence>  
  <!--Riten-->  
  <occurrence table="ft_t_firt" id="FIRT_1" parentId="FINS_1" level="3"> 
    <inputFields> 
      <field name="ft_t_firt.rtng_set_oid" level="3"/>  
      <field name="ft_t_firt.rtng_value_oid" level="3"/>  
      <field name="ft_t_firt.start_tms" level="3"/>  
      <field name="ft_t_firt.rtng_debt_cl_typ"/>  
      <field name="ft_t_firt.rtng_cde"/>  
      <field name="ft_t_firt.end_tms"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_firt.start_tms" valueOfFunction="CURRTMS" dataType="DATETIME"/>  
      <field name="ft_t_firt.rtng_eff_tms" valueOfFunction="CURRTMS" dataType="DATETIME"/> 
    </defaultFields> 
  </occurrence>  
  <!--Added By Ankit for 732 changes-->  
  <occurrence table="ft_t_adst" id="ADST_1" parentId="ADTP_1" label="Address Type Usage Statistic"> 
    <defaultFields> 
      <field name="ft_t_adst.start_tms" valueOfFunction="CURRTMS" dataType="DATETIME"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_adst.denom_curr_cde"/>  
      <field name="ft_t_adst.stat_def_id"/>  
      <field name="ft_t_adst.stat_val_dte"/>  
      <field name="ft_t_adst.stat_val_tms"/>  
      <field name="ft_t_adst.stat_val_camt"/>  
      <field name="ft_t_adst.stat_int_val_num"/>  
      <field name="ft_t_adst.stat_char_val_txt"/> 
    </inputFields> 
  </occurrence>  
  <!--Ankit End-->  
  <!-- occurrence for fidc -->    
  <!-- occurrence for fidh -->  
  <occurrence table="ft_t_fidh" id="FIDH_1" parentId="FIDC_1" multiple="true"> 
    <defaultFields> 
      <field name="ft_t_fidh.fidh_oid" dataType="STRING" valueOfFunction="OID"/>  
      <!--<field name="ft_t_fidh.fidc_oid" valueOf="ft_t_fidc.fidc_oid" srcOccurrence="FIDC_1" dataType="STRING"/> --> 
    </defaultFields> 
  </occurrence>  
  <occurrence table="ft_t_ffrl" id="FFRL" parentId="FINS_1" label="Financial Institution Relation" dbConstraint="FINSRelation"> 
    <defaultFields> 
      <field name="ft_t_ffrl.rel_typ" dataType="STRING" value="PARNTCOF"/>  
      <field name="ft_t_ffrl.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_ffrl.inst_mnem" valueOf="ft_t_fins.inst_mnem" srcOccurrence="FINS_1" dataType="STRING"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_ffrl.prnt_inst_mnem"/> 
    </inputFields> 
  </occurrence>  
  <occurrence table="ft_t_ffrl" id="FFRL_1" parentId="FINS_1" label="Financial Institution Relation CURRORGN" dbConstraint="FINSRelation"> 
    <defaultFields> 
      <field name="ft_t_ffrl.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_ffrl.inst_mnem" valueOf="ft_t_fins.inst_mnem" srcOccurrence="FINS_1" dataType="STRING"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_ffrl.prnt_inst_mnem"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_ffrl.rel_typ" dataType="STRING" value="CURRORGN"/> 
    </where> 
  </occurrence> 
<relations><table name="FT_T_FIRT"><relation relatedTable="FT_T_FINS" name="FINS_RTNG_HIST" checkService="RATING_SERVICE">
			<condition>
				<sql>#FROM_TABLE#.SYS_EFF_END_TMS IS NULL AND (#FROM_TABLE#.INST_MNEM) = (#TO_TABLE#.INST_MNEM)</sql>
			</condition>
		</relation></table><table name="FT_T_FFRL"><relation relatedTable="FT_T_FINS" name="FINSRelation">
			<fromColumns>
				<column name="PRNT_INST_MNEM"/>
			</fromColumns>
			<toColumns>
				<column name="INST_MNEM"/>
			</toColumns>
		</relation></table></relations></model>' WHERE modl_id ='FINS0001' AND modl_typ = 'FINS';		

UPDATE FT_T_MDDF SET modl_schema = '<?xml version="1.0" encoding="UTF-8"?>
<!--<model xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="../../schemas/Model.xsd" >--><model xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" headerInfoXPath="concat(%modelPath:BASEISSU:ft_t_issu.pref_iss_nme%,'' - '',%modelPath:BASEISSU:ft_t_issu.pref_id_ctxt_typ% ,''-'',%modelPath:BASEISSU:ft_t_issu.pref_iss_id%)" id="FIXED" extends="BONDMRKT" xsi:noNamespaceSchemaLocation="../../schemas/Model.xsd" minLevelToEnableChangeApproval="2">  
  <occurrence table="ft_t_issu" extends="BASEISSU" id="BASEISSU" level="1" label="Issue Description/Issue Details"><validationRules> 
      <rule id="ValidationISID"> 
        <xPath value="boolean((count(/root/issueidentifiers/identifier[@status!=''deleted'' or string-length(@status)=0]) >0)  or (/root/issue[@status!=''new'' or  string-length(@status)=0]))"/>  
        <errorMessage value="At least one Instrument Level Identifier has to be entered."/> 
      </rule>  
      <rule id="ValidationISID_ACTIVITYSTATUS"> 
        <xPath value="boolean((count(/root/issueidentifiers/identifier[@status!=''deleted'' or string-length(@status)=0]) >0 or string(/root/issue/issu.iss_actvy_stat_typ)=''INACTIVE'')  or (/root/issue[@status=''new'' or  string-length(@status)!=0]))"/>  
        <errorMessage value="User has either to mark the Issue activity status(Instrument Status)  as inactive or have at least one identifier active."/> 
      </rule>  
      <rule id="FIRSTCPDT_LT_NXTCPDT"> 
        <xPath value="boolean((%modelPath:IEDFBDEBT:ft_t_iedf.first_py_tms%  < = %modelPath:BDSTBDEBT:ft_t_bdst.nxt_cpn_dte%) or (string-length(%modelPath:IEDFBDEBT:ft_t_iedf.first_py_tms%)=0 or string-length(%modelPath:BDSTBDEBT:ft_t_bdst.nxt_cpn_dte%)=0))"/>  
        <errorMessage value="First Coupon Date Should be Less than or equal to  Next Coupon Date"/> 
      </rule>  
      <rule id="DATEDTMS_LT_MATTMS"> 
        <xPath value="boolean((%modelPath:BDCHBDEBT:ft_t_bdch.dted_tms%  <  %modelPath:BASEISSU:ft_t_issu.mat_exp_tms%) or (string-length(%modelPath:BDCHBDEBT:ft_t_bdch.dted_tms%)=0 or string-length(%modelPath:BASEISSU:ft_t_issu.mat_exp_tms%)=0))"/>  
        <errorMessage value="Dated date should be less than Maturity date"/> 
      </rule> 
    <rule id="MultiplePrimaryMarkets" pageName="Market"> 
        <xPath value="boolean(count(%modelPath:MKISDEFBISSU%[(string-length(mkis.end_tms) = 0) and (mkis.prim_trd_mkt_ind = ''Y'')])  <  2)"/>  
        <errorMessage value="There should not be multiple primary markets for a single issue."/> 
      </rule></validationRules><defaultFields> 
      <field name="ft_t_issu.access_auth_typ" dataType="STRING" value="PUBLIC"/>  
      <field name="ft_t_issu.iss_actvy_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_issu.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
    </defaultFields><inputFields> 
      <field name="ft_t_issu.series_typ"/> 
    <field name="ft_t_issu.mat_exp_tms" level="2"/><field name="ft_t_issu.iss_typ" level="1" label="Instrument Type"/><field name="ft_t_issu.denom_curr_cde" level="2"/><field name="ft_t_issu.sec_form_typ"/><field name="ft_t_issu.instr_issr_id"/><field name="ft_t_issu.nom_val_unit_camt"/><field name="ft_t_issu.distribution_curr_cde"/><field name="ft_t_issu.iss_tms" label="Instrument Date"/><field name="ft_t_issu.cl_typ"/></inputFields></occurrence>  
  <!--Moved from the basedebt model because this field is no longer used in the Assetbsec or MBS models-->  
  <occurrence extends="IEDFBDEBT" level="3" table="ft_t_iedf" id="IEDFBDEBT" parentId="BASEISSU" label="Coupon Details/Spread Details"> 
    <inputFields> 
      <field name="ft_t_iedf.penult_cpn_tms" level="3"/>  
      <field name="ft_t_iedf.mx_crte"/>  
      <field name="ft_t_iedf.mn_crte"/>  
      <field name="ft_t_iedf.flt_mltplr_crte"/>  
      <field name="ft_t_iedf.rtfx_bas_typ"/> 
      <field name="ft_t_iedf.rtfx_bas_txt"/>
    <field name="ft_t_iedf.days_yr_bas_typ" level="3"/><field name="ft_t_iedf.days_mth_bas_typ" level="3"/><field name="ft_t_iedf.rtfx_fq_sp_typ"/><field name="ft_t_iedf.rtfx_fq_qty"/><field name="ft_t_iedf.rtfx_fq_dy_typ"/><field name="ft_t_iedf.flt_bas_pt_cqty"/><field name="ft_t_iedf.first_py_tms"/><field name="ft_t_iedf.py_dte_fq_qty"/><field name="ft_t_iedf.py_dte_fq_dy_typ"/><field name="ft_t_iedf.py_dte_fq_sp_typ"/></inputFields> 
  <where> 
      <field name="ft_t_iedf.ev_typ" dataType="STRING" value="INTEREST"/> 
    </where><defaultFields> 
      <field name="ft_t_iedf.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_iedf.verif_ind" dataType="STRING" value="N"/> 
    </defaultFields></occurrence>  
  <occurrence extends="BDSTBDEBT" table="ft_t_bdst" id="BDSTBDEBT" parentId="BASEISSU" label="Issue Details/Coupon Details"> 
    <inputFields> 
      <field name="ft_t_bdst.last_reset_tms"/>  
      <field name="ft_t_bdst.nxt_refix_dte"/> 
    <field name="ft_t_bdst.outst_camt"/><field name="ft_t_bdst.prev_cpn_dte"/><field name="ft_t_bdst.nxt_cpn_dte"/><field name="ft_t_bdst.cpn_crte"/><field name="ft_t_bdst.stats_eff_tms"/><field name="ft_t_bdst.crrnt_iss_camt"/></inputFields> 
  <where> 
      <field name="ft_t_bdst.latest_bdst" dataType="STRING" value="Y"/> 
    </where><defaultFields> 
      <field name="ft_t_bdst.stats_eff_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_bdst.real_first_py_tms" dataType="DATETIME" srcOccurrence="IEDFBDEBT" valueOf="ft_t_iedf.first_py_tms" keepInSync="true"/> 
    </defaultFields></occurrence>  
  <occurrence extends="MKISDEFBISSU" table="ft_t_mkis" id="MKISDEFBISSU" parentId="BASEISSU" autoCreate="false" multiple="true"> 
    <inputFields> 
      <field name="ft_t_mkis.trdng_stat_typ" label="Market Status"/>  
      <field name="ft_t_mkis.actively_traded_ind"/>  
      <field name="ft_t_mkis.norm_mkt_sz_cqty" label="Quote Lot Size"/>  
      <field name="ft_t_mkis.mrgn_sec_ind" label="Marginable"/>  
      <field name="ft_t_mkis.settle_curr_cde"/>  
      <field name="ft_t_mkis.trd_lot_size_cqty"/>  
      <field name="ft_t_mkis.prim_trd_mkt_ind" label="Primary Exchange"/>  
      <field name="ft_t_mkis.prc_curr_cde" label="Quotation Currency"/>  
      <field name="ft_t_mkis.mkt_oid" label="Exchange Name"/> 
    <field name="ft_t_mkis.trdng_curr_cde"/><field name="ft_t_mkis.iss_prc_ut_camt"/><field name="ft_t_mkis.rnd_lot_sz_cqty"/><field name="ft_t_mkis.gu_id" label="Trading Country"/><field name="ft_t_mkis.opol_ind"/></inputFields>  
    <!--<defaultFields>
			<field name="ft_t_mkis.prim_trd_mkt_ind" dataType="STRING" value="N"/>
		</defaultFields>--> 
  <defaultFields>      
      <!--<field name="ft_t_mkis.trdng_stat_typ" value="ACTIVE" dataType="STRING"/>  
      -->  
      <field name="ft_t_mkis.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_mkis.last_chg_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_mkis.last_chg_usr_id" dataType="STRING" valueOfFunction="APPUSER"/> 
    </defaultFields></occurrence>  
  <occurrence extends="MIXRBISSU" table="ft_t_mixr" id="MIXRBISSU" parentId="MKISDEFBISSU" multiple="true" dbConstraint="MKISMIXR"><defaultFields> 
      <field name="ft_t_mixr.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>      
      <field name="ft_t_mixr.trdng_stat_typ" dataType="STRING" srcOccurrence="MKISDEFBISSU" valueOf="ft_t_mkis.trdng_stat_typ"/>  
      <field name="ft_t_mixr.last_chg_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_mixr.last_chg_usr_id" dataType="STRING" valueOfFunction="APPUSER"/> 
    </defaultFields><inputFields> 
      <field name="ft_t_mixr.end_tms"/> 
    </inputFields></occurrence>  
  <presentation> 
    <until level="100"> 
      <override class="codf" rendered="false"/>  
      <override class="eqch" rendered="false"/>  
      <!--<override class="mnch" rendered="false"/>-->  
      <override class="fnch" rendered="false"/>  
      <override class="ench" rendered="false"/>  
      <override class="fech" rendered="false"/>  
      <override class="epst" rendered="false"/> 
    </until> 
  </presentation> 
<occurrence extends="BDCHBDEBT" table="ft_t_bdch" id="BDCHBDEBT" parentId="BASEISSU" label="Issue Details/Coupon Details" level="3"> 
    <inputFields> 
      <field name="ft_t_bdch.bond_rtr_meth_typ"/>  
      <field name="ft_t_bdch.calc_typ" level="3"/> 
    <field name="ft_t_bdch.mn_denom_camt" level="3"/><field name="ft_t_bdch.call_typ"/><field name="ft_t_bdch.put_typ"/><field name="ft_t_bdch.cpn_typ"/><field name="ft_t_bdch.dted_tms"/><field name="ft_t_bdch.in_pay_typ"/><field name="ft_t_bdch.sink_fund_typ"/><field name="ft_t_bdch.yld_calc_typ"/></inputFields> 
  </occurrence><occurrence table="ft_t_isst" id="ISSTRCDTEBONDMRKT" parentId="BASEISSU" label="Coupon Details" autoDelete="true"> 
    <defaultFields> 
      <field name="ft_t_isst.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
      <field name="ft_t_isst.stat_def_id" dataType="STRING" valueOf="ft_t_stdf.stat_def_id">
        <where>
          <field name="ft_t_stdf.stat_def_id" dataType="STRING" value="GILEXDDT"/>
        </where>
      </field>
    </defaultFields>  
    <where> 
      <field name="ft_t_isst.stat_def_id" dataType="STRING" value="GILEXDDT"/> 
    </where>  
    <inputFields> 
      <!--<field name="ft_t_isst.stat_char_val_txt"/>  -->
      <field name="ft_t_isst.stat_val_dte"/> 
    </inputFields> 
  </occurrence><occurrence extends="ISMC_PRNT" level="3" table="ft_t_ismc" id="ISMC_PRNT" parentId="BASEISSU" autoDelete="false">  
    <inputFields> 
      <field name="ft_t_ismc.cap_nominal_camt" level="3"/> 
	<field name="ft_t_ismc.cap_chg_eff_tms"/></inputFields> 
  <where activeOnly="true"> 
      <field name="ft_t_ismc.capital_typ" value="OUTSTAND" dataType="STRING"/> 
    </where></occurrence><occurrence table="ft_t_uwch" id="UWCHBDEBT" parentId="BASEISSU" label="Issue Details" autoDelete="false"> 
    <defaultFields> 
      <field name="ft_t_uwch.offer_curr_cde" dataType="STRING" srcOccurrence="BASEISSU" valueOf="ft_t_issu.denom_curr_cde"/>  
      <field name="ft_t_uwch.offer_tms" dataType="DATETIME" srcOccurrence="UWCHBDEBT" valueOf="ft_t_uwch.anncmnt_dte"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_uwch.offer_camt"/>  
      <field name="ft_t_uwch.first_settle_dte"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_uwch.offer_num" dataType="NUMBER" value="1"/> 
    </where> 
  </occurrence><occurrence table="ft_t_isgu" id="ISGUBDEBT" parentId="BASEISSU" label="Issue Details"> 
    <inputFields> 
      <field name="ft_t_isgu.gu_cnt"/>  
      <field name="ft_t_isgu.gu_id"/>  
      <field name="ft_t_isgu.gu_typ"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isgu.start_tms" dataType="DATETIME" srcOccurrence="BASEISSU" valueOf="ft_t_issu.start_tms"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_isgu.iss_gu_purp_typ" dataType="STRING" value="DOMICILE"/> 
    </where> 
  </occurrence><occurrence table="ft_t_isst" id="ISSTBDEBT" parentId="BASEISSU" label="Issue Details" autoDelete="true"> 
    <defaultFields> 
      <field name="ft_t_isst.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_isst.stat_def_id" dataType="STRING" valueOf="ft_t_stdf.stat_def_id"> 
        <where> 
          <field name="ft_t_stdf.stat_def_id" dataType="STRING" value="CTRYGUAR"/> 
        </where> 
      </field> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_isst.stat_char_val_txt"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_isst.stat_def_id" dataType="STRING" value="CTRYGUAR"/> 
    </where> 
  </occurrence><occurrence table="ft_t_iscm" id="ISCMGUARBDEBT" parentId="BASEISSU" label="Issue Details"> 
    <defaultFields> 
      <field name="ft_t_iscm.ln_num" dataType="NUMBER" value="1"/>  
      <field name="ft_t_iscm.cmnt_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_iscm.cmnt_txt"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_iscm.cmnt_reas_typ" dataType="STRING" value="GUARNTOR"/> 
    </where> 
  </occurrence><occurrence table="ft_t_iscm" id="ISCMLEADBDEBT" parentId="BASEISSU" label="Issue Details"> 
    <inputFields> 
      <field name="ft_t_iscm.cmnt_txt"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_iscm.ln_num" dataType="NUMBER" value="1"/>  
      <field name="ft_t_iscm.cmnt_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_iscm.cmnt_reas_typ" dataType="STRING" value="LEADMGR"/> 
    </where> 
  </occurrence><occurrence table="ft_t_ievp" id="IEVPBDEBT" parentId="IEDFBDEBT" label="Income Event Participant"> 
    <defaultFields> 
      <field name="ft_t_ievp.start_tms" dataType="DATETIME" srcOccurrence="IEDFBDEBT" valueOf="ft_t_iedf.start_tms" keepInSync="true"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_pedf" id="PEDFBDEBT" parentId="BASEISSU" autoDelete="false"> 
    <where> 
      <field name="ft_t_pedf.ev_typ" dataType="STRING" value="REDEMPT"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_pedf.verif_ind" dataType="STRING" value="N"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_pedf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_pevp" id="PEVPBDEBT" parentId="PEDFBDEBT" autoDelete="false"> 
    <defaultFields> 
      <field name="ft_t_pevp.start_tms" dataType="DATETIME" srcOccurrence="PEDFBDEBT" valueOf="ft_t_pedf.start_tms" keepInSync="true"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_pevp.prt_purp_typ" dataType="STRING" value="REDEMPT"/> 
    </where> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDFBDEBT" parentId="PEVPBDEBT" label="Redemption" autoDelete="false"> 
    <defaultFields> 
      <!--<field name="ft_t_ppdf.start_tms" dataType="DATETIME" srcOccurrence="PEDFBDEBT" valueOf="ft_t_pedf.start_tms" keepInSync="true"/>-->  
      <field name="ft_t_ppdf.prin_pay_def_id" dataType="STRING" valueOfFunction="OID"/>  
      <field name="ft_t_ppdf.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_instr_id" label="Redemption Currency"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms" dataType="DATETIME"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_ppdf.ev_rate_bas_typ" dataType="STRING" value="PAR VAL"/>  
      <field name="ft_t_ppdf.ev_rate_typ" dataType="STRING" value="PERCENT"/>  
      <field name="ft_t_ppdf.iss_part_rl_typ" dataType="STRING" value="RECEIVE"/> 
    </where> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDFBDEBT_AMT" parentId="PEVPBDEBT" label="Redemption" autoDelete="false"> 
    <defaultFields> 
      <field name="ft_t_ppdf.prin_pay_def_id" dataType="STRING" valueOfFunction="OID"/>  
      <field name="ft_t_ppdf.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <!--<field name="ft_t_ppdf.ev_instr_id" dataType="STRING" srcOccurrence="PPDFBDEBT" valueOf="ft_t_ppdf.ev_instr_id"/>-->  
      <!--<field name="ft_t_ppdf.pay_curr_cde" dataType="STRING" srcOccurrence="PPDFBDEBT" valueOf="ft_t_ppdf.pay_curr_cde" keepInSync="true"/>--> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.ev_instr_id" label="Redemption Currency"/>  
      <field name="ft_t_ppdf.ev_crte" dataType="NUMBER"/>  
      <field name="ft_t_ppdf.start_tms" dataType="DATETIME"/>
    </inputFields>  
    <where> 
      <field name="ft_t_ppdf.ev_rate_bas_typ" dataType="STRING" value="PAR VAL"/>  
      <field name="ft_t_ppdf.ev_rate_typ" dataType="STRING" value="AMOUNT"/>  
      <field name="ft_t_ppdf.iss_part_rl_typ" dataType="STRING" value="RECEIVE"/> 
    </where> 
  </occurrence><occurrence table="ft_t_isll" id="ISLL_SUB" parentId="BASEISSU"> 
    <inputFields> 
      <field name="ft_t_isll.iss_coll_nme" dataType="STRING"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_isll.coll_typ" dataType="STRING" value="Subordinated"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_isll.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_isll" id="ISLL_SEC" parentId="BASEISSU"> 
    <inputFields> 
      <field name="ft_t_isll.iss_coll_nme" dataType="STRING"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_isll.coll_typ" dataType="STRING" value="Secured"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_isll.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_isll" id="ISLL_GRP_MBS" parentId="BASEISSU"> 
    <inputFields> 
      <field name="ft_t_isll.coll_grp_desc" dataType="STRING"/>  
      <field name="ft_t_isll.iss_coll_nme" dataType="STRING"/>  
      <field name="ft_t_isll.coll_typ" dataType="STRING"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_isll.coll_typ" dataType="STRING" value="Mortgage Backed"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_isll.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_isll" id="ISLL_GRP_ABS" parentId="BASEISSU"> 
    <inputFields> 
      <field name="ft_t_isll.coll_grp_desc" dataType="STRING"/>  
      <field name="ft_t_isll.iss_coll_nme" dataType="STRING"/>  
      <field name="ft_t_isll.coll_typ" dataType="STRING"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_isll.coll_typ" dataType="STRING" value="Asset Backed"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_isll.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_iscl" id="ISCL_MIZUNIQE" parentId="BASEISSU" label="Uniqueness"> 
    <inputFields> 
      <field name="ft_t_iscl.cl_value" dataType="STRING"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_iscl.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_iscl.indus_cl_set_id" dataType="STRING" value="MIZUNIQE"/> 
    </where> 
  </occurrence><occurrence table="ft_t_frip" id="FRIP_CSTM" parentId="BASEISSU"> 
    <where> 
      <field name="ft_t_frip.finsrl_typ" dataType="STRING" value="GUARNTOR"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_frip.prt_purp_typ" dataType="STRING" value="GUARANTR"/>  
      <field name="ft_t_frip.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_frip.inst_mnem" dataType="STRING"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_isgp" id="ISGP_CSTM" parentId="BASEISSU" dbConstraint="isgpf002"> 
    <where> 
      <field name="ft_t_isgp.prt_purp_typ" dataType="STRING" value="ISIDGRP"/>  
      <field name="ft_t_isgp.prnt_iss_grp_oid" dataType="STRING" valueOf="ft_t_isgr.iss_grp_oid"> 
        <where> 
          <field name="ft_t_isgr.grp_nme" value="FCY" dataType="STRING"/> 
        </where> 
      </field> 
    </where>  
    <defaultFields>     
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_isgp.instr_id" dataType="STRING"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_ridf" id="RIDF_CSTM" parentId="BASEISSU"> 
    <where> 
      <field name="ft_t_ridf.rel_typ" dataType="STRING" value="CreditLinked"/> 
    </where>  
    <defaultFields>     
      <field name="ft_t_ridf.rel_desc" dataType="STRING" value="CreditLinked"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_riss" id="RISS_CSTM" parentId="RIDF_CSTM"> 
    <defaultFields> 
      <field name="ft_t_riss.part_units_typ" dataType="STRING" value="ALL"/>  
      <field name="ft_t_riss.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_riss.iss_part_rl_typ" dataType="STRING" value="UNDLYING"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_riss.instr_id" dataType="STRING"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_isde" id="ISDEBISSU" parentId="BASEISSU" label="Issue Description" level="1"> 
    <defaultFields> 
      <field name="ft_t_isde.desc_srce_typ" dataType="STRING" value="INHOUSE"/>  
      <field name="ft_t_isde.nls_cde" dataType="STRING" value="ENGLISH"/>  
      <field name="ft_t_isde.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_isde.iss_nme" label="Instrument Name" level="1"/>  
      <field name="ft_t_isde.start_tms"/>  
      <field name="ft_t_isde.iss_desc" label="Instrument Description"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_isde.desc_usage_typ" dataType="STRING" value="PRIMARY"/> 
    </where> 
  </occurrence><occurrence table="ft_t_isde" id="ISDE_VENDOR" parentId="BASEISSU" label="Issue Description"> 
    <defaultFields> 
      <field name="ft_t_isde.nls_cde" dataType="STRING" value="ENGLISH"/>  
      <field name="ft_t_isde.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_isde.iss_nme" label="Instrument Name"/>  
      <field name="ft_t_isde.start_tms"/>  
      <field name="ft_t_isde.iss_desc" label="Instrument Description"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_isde.desc_srce_typ" dataType="STRING" value="VENDOR"/> 
    </where> 
  </occurrence><occurrence table="ft_t_isid" id="ISID_Iss_level" parentId="BASEISSU" label="Issue Identifiers" multiple="true" dbConstraint="ISSUISID"> 
    <inputFields> 
      <field name="ft_t_isid.iss_id" label="Identifier Value"/>  
      <field name="ft_t_isid.id_ctxt_typ" label="Identifier Type"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <validationRules> 
      <rule id="ISINMarket"> 
        <xPath value="boolean(not(%modelPath:ISID_Iss_level:ft_t_isid.id_ctxt_typ% =''ISIN'' and not(string-length(%modelPath:ISID_Iss_level:ft_t_isid.mkt_oid%) = 0)))"/>  
        <errorMessage value="ISIN identifier cannot have market."/> 
      </rule>  
      <!--<rule id="ISSUTXTTYPNOTSUPPORTED" messageType="WARNING"> 
	   <xPath value="boolean(not(%modelPath:ISID_Iss_level%/intlvlid_supported=''0''))"/>
          <errorMessageXPath value="concat(%modelPath:ISID_Iss_level:ft_t_isid.id_ctxt_typ%,'' is no longer supported as a valid Instrument Level Identifier. Please take necessary action.'')"/>
		 </rule>--> 
    </validationRules> 
  </occurrence><occurrence table="ft_t_isid" id="ISID_MKT_Iss_level_PUB" parentId="BASEISSU" label="Global Market Identifiers pub" multiple="true" dbConstraint="MRKTISIDPUB"> 
    <!-- <where> 
      <field name="ft_t_isid.mkt_oid" dataType="STRING" isNull="false"/> 
    </where> -->  
    <inputFields> 
      <field name="ft_t_isid.iss_id" label="Identifier Value"/>  
      <field name="ft_t_isid.id_ctxt_typ" label="Identifier Type"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <validationRules> 
      <rule id="ISINMarket"> 
        <xPath value="boolean(not(%modelPath:ISID_MKT_Iss_level_PUB:ft_t_isid.id_ctxt_typ% =''ISIN'' and not(string-length(%modelPath:ISID_MKT_Iss_level_PUB:ft_t_isid.mkt_oid%) = 0)))"/>  
        <errorMessage value="ISIN identifier cannot have market."/> 
      </rule> 
    </validationRules> 
  </occurrence><occurrence table="ft_t_isid" id="ISIDBISIN" parentId="BASEISSU" label="Identifiers"> 
    <inputFields> 
      <field name="ft_t_isid.iss_id"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_isid.id_ctxt_typ" dataType="STRING" value="ISIN"/> 
    </where> 
  </occurrence><occurrence table="ft_t_isid" id="ISIDBINH" parentId="BASEISSU" label="Identifiers"> 
    <inputFields> 
      <field name="ft_t_isid.iss_id"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_isid.id_ctxt_typ" dataType="STRING" value="INHOUSE"/> 
    </where> 
  </occurrence><occurrence table="ft_t_isid" id="ISIDBCUS" parentId="BASEISSU" label="Identifiers"> 
    <inputFields> 
      <field name="ft_t_isid.iss_id"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_isid.id_ctxt_typ" dataType="STRING" value="CUSIP"/> 
    </where> 
  </occurrence><occurrence table="ft_t_isid" id="ISIDBCOM" parentId="BASEISSU" label="Identifiers"> 
    <inputFields> 
      <field name="ft_t_isid.iss_id"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_isid.id_ctxt_typ" dataType="STRING" value="COMMON"/> 
    </where> 
  </occurrence><occurrence table="ft_t_isid" id="ISIDVAL" parentId="BASEISSU" label="Identifiers"> 
    <inputFields> 
      <field name="ft_t_isid.iss_id"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_isid.id_ctxt_typ" dataType="STRING" value="VALOREN"/> 
    </where> 
  </occurrence><occurrence table="ft_t_iscl" id="ISCL_INSUBTYP" parentId="BASEISSU" label="Issue Classification" dbConstraint="SUBTYPE" multiple="false"> 
    <where> 
      <field name="ft_t_iscl.clsf_purp_typ" dataType="STRING" value="INSUBTYP"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_iscl.cl_value" label="Instrument Sub-Type"/>  
      <field name="ft_t_iscl.indus_cl_set_id"/>  
      <field name="ft_t_iscl.clsf_oid"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_iscl.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_fnch" id="FNCH_ALL" parentId="BASEISSU" label="Fund Characteristics"> 
    <defaultFields> 
      <!--<field name="ft_t_fnch.chars_eff_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>-->        
    </defaultFields> 
  </occurrence><occurrence table="ft_t_iscm" id="ISCMBISSU" parentId="BASEISSU" label="Comments"> 
    <defaultFields> 
      <field name="ft_t_iscm.cmnt_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_iscm.ln_num" dataType="NUMBER" value="1"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_iscm.cmnt_txt"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_iscm.cmnt_reas_typ" dataType="STRING" value="COMMENT"/> 
    </where> 
  </occurrence><occurrence table="ft_t_isrt" id="ISRTBISSU" parentId="BASEISSU" multiple="true" label="Rating"> 
    <inputFields> 
      <field name="ft_t_isrt.rtng_curr_typ"/>  
      <field name="ft_t_isrt.rtng_purp_typ"/>  
      <field name="ft_t_isrt.rtng_set_oid"/>  
      <field name="ft_t_isrt.rtng_cde"/>  
      <field name="ft_t_isrt.start_tms"/>  
      <field name="ft_t_isrt.rtng_eff_tms"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isrt.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>     
    </defaultFields> 
  </occurrence><occurrence table="ft_t_rgch" id="RGCHBISSU" parentId="BASEISSU" label="Regulatory Information"> 
    <inputFields> 
      <field name="ft_t_rgch.gu_id"/>  
      <field name="ft_t_rgch.gu_cnt"/>  
      <field name="ft_t_rgch.gu_typ"/>  
      <field name="ft_t_rgch.isma_regulated_ind"/>  
      <field name="ft_t_rgch.rule_144a_ind"/>  
      <field name="ft_t_rgch.reg_s_ind"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_rgch.start_tms" dataType="DATETIME" srcOccurrence="BASEISSU" valueOf="ft_t_issu.start_tms"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_mkis" id="MKISPMBISSU" parentId="BASEISSU" multiple="false" label="Market Details"> 
    <inputFields> 
      <field name="ft_t_mkis.mkt_oid"/>  
      <field name="ft_t_mkis.iss_prc_ut_camt"/>  
      <field name="ft_t_mkis.rnd_lot_sz_cqty"/>  
      <field name="ft_t_mkis.trdng_curr_cde"/>  
      <field name="ft_t_mkis.trdng_stat_typ"/> 
    </inputFields>  
    <defaultFields> 
      <!--<field name="ft_t_mkis.trdng_stat_typ" dataType="STRING" value="ACTIVE"/>  
      -->  
      <field name="ft_t_mkis.prc_ut_meas_typ" dataType="STRING" value="NOMINAL"/>  
      <!--<field name="ft_t_mkis.mkt_iss_oid" dataType="STRING" valueOfFunction="OID" uiOnly="true"/> 
      --> 
    </defaultFields>  
    <where> 
      <field name="ft_t_mkis.prim_trd_mkt_ind" dataType="STRING" value="Y"/> 
    </where>  
    <validationRules> 
      <rule id="Warning" messageType="WARNING"> 
        <xPath value="boolean(string-length(%modelPath:MKISPMBISSU:ft_t_mkis.end_tms%)= 0 or string-length(%modelPath:MKISPMBISSU:ft_t_mkis.end_tms%) <  SYSDATE())"/>  
        <errorMessage value="Primary Market is end dated"/> 
      </rule> 
    </validationRules> 
  </occurrence><occurrence table="ft_t_mixr" id="MIXR_PRIM" parentId="MKISPMBISSU" label=" Market Issue Cross Reference ((Primary)" dbConstraint="MKISMIXR"> 
    <defaultFields> 
      <field name="ft_t_mixr.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>   
      <field name="ft_t_mixr.trdng_stat_typ" dataType="STRING" srcOccurrence="MKISPMBISSU" valueOf="ft_t_mkis.trdng_stat_typ"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_isid" id="ISID_TIC_PM_PUB" parentId="MIXR_PRIM" label="Issue Identifier-Ticker" dbConstraint="MIXRISIDPUB"> 
    <where> 
      <field name="ft_t_isid.id_ctxt_typ" dataType="STRING" value="TICKER"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_isid.iss_id" label="Primary Ticker"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isid.isid_oid" dataType="STRING" srcOccurrence="MIXR_PRIM" valueOf="ft_t_mixr.isid_oid"/>  
      <field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_isid.mkt_oid" dataType="STRING" srcOccurrence="MKISPMBISSU" valueOf="ft_t_mkis.mkt_oid"/>  
      <field name="ft_t_isid.instr_id" dataType="STRING" srcOccurrence="BASEISSU" valueOf="ft_t_issu.instr_id"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_isxr" id="BISSU_ISXR_ISID" parentId="LISTISID_BISSU" multiple="true" autoDelete="false"> 
    <where> 
      <field name="ft_t_isxr.isid_oid" dataType="STRING" srcOccurrence="LISTISID_BISSU" valueOf="ft_t_isid.isid_oid"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_isxr.last_chg_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_isxr.last_chg_usr_id" dataType="STRING" valueOfFunction="APPUSER"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_isxr.isxr_rel_purp_typ"/>  
      <field name="ft_t_isxr.start_tms"/>  
      <field name="ft_t_isxr.end_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_must" id="MUST_MICOPOL" parentId="MKISDEFBISSU" autoDelete="false"> 
    <where> 
      <field name="ft_t_must.stat_def_id" dataType="STRING" value="MICOPOL"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_must.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_must.stat_char_val_txt" label="OPOL"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_must" id="MUST_CDREXCH" parentId="MKISDEFBISSU" autoDelete="false"> 
    <where> 
      <field name="ft_t_must.stat_def_id" dataType="STRING" value="CDREXCH"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_must.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_must.stat_char_val_txt" label="Exchange Calendar"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_ispc" id="ISPCBISSU" parentId="BASEISSU" label="Issue Price Details"> 
    <inputFields> 
      <field name="ft_t_ispc.prc_typ"/>  
      <field name="ft_t_ispc.prc_srce_typ"/>  
      <field name="ft_t_ispc.prc_tms"/>  
      <field name="ft_t_ispc.unit_cprc"/>  
      <field name="ft_t_ispc.prc_curr_cde"/> 
    </inputFields>  
    <defaultFields> 
      <!--      <field name="ft_t_ispc.prc_curr_cde" dataType="STRING" srcOccurrence="BASEISSU" valueOf="ft_t_issu.denom_curr_cde"/>  -->  
      <field name="ft_t_ispc.prc_qt_meth_typ" dataType="STRING" value="1"/>  
      <field name="ft_t_ispc.prc_valid_typ" dataType="STRING" value="VALID"/>  
      <field name="ft_t_ispc.prcng_meth_typ" dataType="STRING" value="1"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_ievp" id="IEVP_DIV_or_INT" parentId="IEDF_DIV_or_INT" label="Income Event Participant(Dividend/Interest)"> 
    <defaultFields> 
      <field name="ft_t_ievp.prt_purp_typ" dataType="STRING" value="PMTDTLS"/>  
      <field name="ft_t_ievp.start_tms" dataType="DATETIME" srcOccurrence="IEDF_DIV_or_INT" valueOf="ft_t_iedf.start_tms"/> 
    </defaultFields>  
    <!--<validationRules>
			<rule id="Unique_IPDF">
				<xPath value="is-unique(%modelPath:IPDF_DIV_or_INT%, &quot;concat(ipdf.pay_curr_cde, substring((ipdf.start_tms), 1, 10))&quot;)"/>
				<errorMessage value="Payment currency and Start Date/Time combination should be unique in Income Payments of Dividend/Interest Section"/>		
			</rule>
		</validationRules>--> 
  </occurrence><occurrence table="ft_t_ipdf" id="IPDF_DIV_or_INT" parentId="IEVP_DIV_or_INT" multiple="true" label="Income Payment Definition(Dividend/Interest)"> 
    <inputFields> 
      <field name="ft_t_ipdf.start_tms"/>  
      <field name="ft_t_ipdf.ev_rate_typ"/>  
      <field name="ft_t_ipdf.ev_crte"/>  
      <field name="ft_t_ipdf.iss_part_rl_typ"/>  
      <field name="ft_t_ipdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ipdf.pay_curr_cde"/>  
      <field name="ft_t_ipdf.end_tms"/> 
    </inputFields>  
    <defaultFields/> 
  </occurrence><occurrence table="ft_t_pevp" id="PEVP_CALL_or_SINK" parentId="PEDF_CALL_or_SINK" label="Principal Event Participant(Call/Sink)" autoDelete="false"> 
    <defaultFields> 
      <field name="ft_t_pevp.start_tms" dataType="DATETIME" srcOccurrence="PEDF_CALL_or_SINK" valueOf="ft_t_pedf.start_tms" keepInSync="true"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_pevp.prt_purp_typ" dataType="STRING" value="SNKFDRED"/> 
    </where>  
    <validationRules> 
      <rule id="Unique_PPDF_Call_or_Sink"> 
        <xPath value="is-unique(%modelPath:PPDF_CALL_or_SINK%, &quot;concat(ppdf.pay_curr_cde,substring((ppdf.start_tms), 1, 10))&quot;)"/>  
        <!--        <xPath value="is-unique(%modelPath:PPDF_CALL_or_SINK%,&quot;substring((ppdf.start_tms), 1,10)&quot;)"/>  -->  
        <errorMessage value="Payment currency and Start Date/Time combination should be unique in Principal Payments of Call/Sink Section"/> 
      </rule> 
    </validationRules> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_CALL_or_SINK" parentId="PEVP_CALL_or_SINK" multiple="true" label="Principal Payment Definition(Call/Sink)" autoDelete="false"> 
    <inputFields> 
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.start_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/> 
    </inputFields>  
    <defaultFields/> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_PUT_or_FACTOR" parentId="PEVP_PUT_or_FACTOR" multiple="true" label="Principal Payment Definition(Factor)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_PUT" parentId="PEVP_PUT" multiple="true" label="Principal Payment Definition(Put)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_NEXTPUT" parentId="PEVP_NEXTPUT" multiple="true" label="Principal Payment Definition(NextPut)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_NXTPARPT" parentId="PEVP_NXTPARPT" multiple="true" label="Principal Payment Definition(NxtParpt)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_PUTPROV" parentId="PEVP_PUTPROV" multiple="true" label="Principal Payment Definition(PutProv)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_PUTSCHED" parentId="PEVP_PUTSCHED" multiple="true" label="Principal Payment Definition(PutSched)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_CALLABLE" parentId="PEVP_CALLABLE" multiple="true" label="Principal Payment Definition(Callable)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_CALLED" parentId="PEVP_CALLED" multiple="true" label="Principal Payment Definition(Called)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_CALATPAR" parentId="PEVP_CALATPAR" multiple="true" label="Principal Payment Definition(Calatpar)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_CALATPRE" parentId="PEVP_CALATPRE" multiple="true" label="Principal Payment Definition(Calatpre)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_isgp" id="ISGP_UNIV" parentId="BASEISSU" label="Issue Group Participant" multiple="true" dbConstraint="isgpuniv"> 
    <defaultFields> 
      <field name="ft_t_isgp.prt_purp_typ" dataType="STRING" value="MANUAL"/>  
      <field name="ft_t_isgp.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_isgp.prnt_iss_grp_oid"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_cucn" id="CUCN" parentId="BASEISSU"> 
    <defaultFields> 
      <field name="ft_t_cucn.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_cucf" id="CUCF" parentId="CUCN"> 
    <defaultFields> 
      <field name="ft_t_cucf.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_cucf.instr_id" dataType="STRING" valueOfXPath="/root/issue/issu.instr_id"/> 
    </defaultFields> 
  </occurrence><relations><table name="FT_T_IEDF"><relation relatedTable="FT_T_ISSU" name="issuiedfinterest">
            <fromColumns>
                <column name="instr_id"/>
            </fromColumns>
            <toColumns>
                <column name="instr_id"/>
            </toColumns>
            <condition>
                <sql>#FROM_TABLE#.ev_typ IN (''INTEREST'')</sql>
            </condition>
        </relation></table><table name="FT_T_MKIS"><relation relatedTable="FT_T_ISSU" name="ISSUMKIS">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<condition>
				<sql>(#FROM_TABLE#.prim_trd_mkt_ind=''Y'' or (select count(*) from ft_t_mkis where ft_t_mkis.instr_id=#TO_TABLE#.instr_id and (ft_t_mkis.end_tms is null or ft_t_mkis.end_tms  >= SYSDATE()))=1)</sql>
			</condition>
		</relation></table><table name="FT_T_MIXR"><relation relatedTable="FT_T_MKIS" name="MKISMIXR">
			<fromColumns>
				<column name="MKT_ISS_OID"/>
			</fromColumns>
			<toColumns>
				<column name="MKT_ISS_OID"/>
			</toColumns>
		</relation></table><table name="FT_T_ISGU"><relation relatedTable="FT_T_ISSU" name="ISSUISGU">
            <fromColumns>
                <column name="INSTR_ID"/>
            </fromColumns>
            <toColumns>
                <column name="INSTR_ID"/>
            </toColumns>
            <condition>
                <sql>#FROM_TABLE#.gu_typ =''COUNTRY''</sql>
            </condition>
        </relation></table><table name="FT_T_IEVP"><relation relatedTable="FT_T_IEDF" name="iedfievpestdiv">
            <fromColumns>
                <column name="INC_EV_DEF_ID"/>
            </fromColumns>
            <toColumns>
                <column name="INC_EV_DEF_ID"/>
            </toColumns>
            <condition>
                <sql>#FROM_TABLE#.prt_purp_typ IN (''ESTIMATE'',''DIVIDEND'')</sql>
            </condition>
        </relation></table><table name="FT_T_PEDF"><relation relatedTable="FT_T_ISSU" name="pedffactorissu">
            <fromColumns>
                <column name="instr_id"/>
            </fromColumns>
            <toColumns>
                <column name="instr_id"/>
            </toColumns>
            <condition>
                <sql>#FROM_TABLE#.ev_typ IN (''FACTOR'')</sql>
            </condition>
        </relation></table><table name="FT_T_PEVP"><relation relatedTable="FT_T_PEDF" name="pevpfactorissu">
            <fromColumns>
                <column name="prin_ev_def_id"/>
            </fromColumns>
            <toColumns>
                <column name="prin_ev_def_id"/>
            </toColumns>
            <condition>
                <sql>#FROM_TABLE#.prt_purp_typ IN (''FACTOR'')</sql>
            </condition>
        </relation></table><table name="FT_T_PPDF"><relation relatedTable="FT_T_PEVP" name="ppdf_pevp">
            <fromColumns>
                <column name="PRIN_EV_PRT_ID"/>
            </fromColumns>
            <toColumns>
                <column name="PRIN_EV_PRT_ID"/>
            </toColumns>
            <condition>
                <sql>ROWNUM=1</sql>
            </condition>
        </relation></table><table name="FT_T_ISLL"><relation relatedTable="FT_T_ISSU" name="isllissu">
            <fromColumns>
                <column name="instr_id"/>
            </fromColumns>
            <toColumns>
                <column name="instr_id"/>
            </toColumns>
            <condition>
                <sql>#FROM_TABLE#.last_chg_tms in (SELECT max(last_chg_tms) FROM ft_t_isll where instr_id = #TO_TABLE#.instr_id)</sql>
            </condition>
        </relation></table><table name="FT_T_ISCL"><relation relatedTable="FT_T_ISSU" name="SUBTYPE">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<condition>
				<sql>#FROM_TABLE#.indus_cl_set_id in (''TKISSTYP'',''BBSECTYP'',''FTISSTYP'',''ASSETCLS'')</sql>
			</condition>
		</relation></table><table name="FT_T_RIDF"><relation relatedTable="FT_T_ISSU" name="ridfwarrant">
            <fromColumns>
                <column name="instr_id"/>
            </fromColumns>
            <toColumns>
                <column name="instr_id"/>
            </toColumns>
            <condition>
                <sql>#FROM_TABLE#.rel_typ IN (''WARRANT'',''WRT CALL'',''WRT PUT'')</sql>
            </condition>
        </relation></table><table name="FT_T_RISS"><relation relatedTable="FT_T_RIDF" name="risswarrant">
            <fromColumns>
                <column name="rld_iss_feat_id"/>
            </fromColumns>
            <toColumns>
                <column name="rld_iss_feat_id"/>
            </toColumns>
            <condition>
                <sql>#FROM_TABLE#.iss_part_rl_typ IN (''DELIVER'',''RECEIVE'',''UNDLYING'')</sql>
            </condition>
        </relation></table><table name="FT_T_ISID"><relation relatedTable="FT_T_ISSU" name="ISSUISID">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<condition>
					<sql>not exists (select 1 from ft_t_mixr mixr where (mixr.end_tms is null or mixr.end_tms  > SYSDATE()) and #FROM_TABLE#.ISID_OID=mixr.isid_oid) and #FROM_TABLE#.MKT_OID is null</sql>
				</condition>
		</relation></table><table name="FT_T_ISID"><relation relatedTable="FT_T_ISSU" name="MRKTISID">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<condition>
				<sql>not exists (select 1 from ft_t_mixr mixr where (mixr.end_tms is null or mixr.end_tms  > SYSDATE()) and #FROM_TABLE#.ISID_OID=mixr.isid_oid) and #FROM_TABLE#.MKT_OID is not null</sql>
		</condition>
		</relation></table><table name="FT_T_ISID"><relation relatedTable="FT_T_ISSU" name="MRKTISIDPUB">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<condition>			
				<sql>not exists (select 1 from ft_t_mixr mixr where (mixr.end_tms is null or mixr.end_tms  > SYSDATE()) and #FROM_TABLE#.ISID_OID=mixr.isid_oid) and #FROM_TABLE#.MKT_OID is not null</sql>			
			</condition>
		</relation></table><table name="FT_T_ISCL"><relation relatedTable="FT_T_ISSU" name="SUBTYPE">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<condition>
				<sql>#FROM_TABLE#.indus_cl_set_id in (''TKISSTYP'',''BBSECTYP'',''FTISSTYP'',''ASSETCLS'')</sql>
			</condition>
		</relation></table><table name="FT_T_RIST"><relation relatedTable="FT_T_ISSU" name="RIST_INSTR">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
		</relation></table><table name="FT_T_LMST"><relation relatedTable="FT_T_ISSU" name="latestlmst">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<condition>
				<sql>#FROM_TABLE#.last_chg_tms = (SELECT MAX (last_chg_tms) FROM ft_t_lmst WHERE ft_t_lmst.instr_id = #TO_TABLE#.instr_id)</sql>
			</condition>
		</relation></table><table name="FT_T_AISR"><relation relatedTable="FT_T_ISSU" name="MyAccountIssueRole">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<condition>
				<sql>#FROM_TABLE#.ACCT_ISSU_RL_TYP is not null</sql>
			</condition>
		</relation></table><table name="FT_T_AISR"><relation relatedTable="FT_T_ISSU" name="MyIssueAccountRole">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<!--Commented as AISR.ISSU_ACCT_RL_TYP has been removed (GT 37778)-->
			<!--<condition>
        <sql>#FROM_TABLE#.ISSU_ACCT_RL_TYP is not null</sql>
      </condition>-->
		</relation></table><table name="FT_T_ISRT"><relation relatedTable="FT_T_ISSU" name="RTNG_HIST" checkService="RATING_SERVICE">
			<condition>
				<sql>#FROM_TABLE#.SYS_EFF_END_TMS IS NULL AND (#FROM_TABLE#.INSTR_ID) = (#TO_TABLE#.INSTR_ID)</sql>
			</condition>
		</relation></table><table name="FT_T_MIXR"><relation relatedTable="FT_T_ISID" name="MIXRISID">
			<fromColumns>
				<column name="ISID_OID"/>
			</fromColumns>
			<toColumns>
				<column name="ISID_OID"/>
			</toColumns>
			<condition>
        <sql>exists (select 1 from FT_T_MIXR mixr where (mixr.end_tms IS NULL or mixr.end_tms  > p_asOfDate) and #TO_TABLE#.ISID_OID=mixr.isid_oid)</sql>
			</condition>
		</relation></table><table name="FT_T_MIXR"><relation relatedTable="FT_T_ISID" name="MIXRISIDPUB">
			<fromColumns>
				<column name="ISID_OID"/>
			</fromColumns>
			<toColumns>
				<column name="ISID_OID"/>
			</toColumns>
			<condition>				
				<sql>exists (select 1 from FT_T_MIXR mixr where (mixr.end_tms IS NULL or mixr.end_tms  > SYSDATE()) and #TO_TABLE#.ISID_OID=mixr.isid_oid)</sql>				
			</condition>
		</relation></table><table name="FT_T_MKIS"><relation relatedTable="FT_T_ISPC" name="LATESTPRICE">
			<fromColumns>
				<column name="INSTR_ID"/>
				<column name="MKT_OID"/>
				<column name="PRC_CURR_CDE"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
				<column name="MKT_OID"/>
				<column name="PRC_CURR_CDE"/>
			</toColumns>
			<condition>
				<sql>#TO_TABLE#.prc_tms = 
             (select max(prc_tms)
                from ft_t_ispc maxprc
               where maxprc.instr_id = #TO_TABLE#.instr_id
                 and maxprc.mkt_oid = #TO_TABLE#.mkt_oid
                 and maxprc.prc_curr_cde = #TO_TABLE#.prc_curr_cde)</sql>
			</condition>
		</relation></table><table name="FT_T_MUST"><relation relatedTable="FT_T_MKIS" name="mkismust">
            <fromColumns>
                <column name="MKT_ISS_OID"/>
            </fromColumns>
            <toColumns>
                <column name="MKT_ISS_OID"/>
            </toColumns>
        </relation></table><table name="FT_T_ISPC"><relation name="latestclosingprice" relatedTable="FT_T_ISSU">
            <fromColumns>
                <column name="INSTR_ID"/>
            </fromColumns>
            <toColumns>
                <column name="INSTR_ID"/>
            </toColumns>
            <condition>
                <sql>(#FROM_TABLE#.last_chg_tms
                      , #FROM_TABLE#.prc_tms
                      , COALESCE (#FROM_TABLE#.data_src_id, ''999'')
                      , #FROM_TABLE#.prc_srce_typ
                      , #FROM_TABLE#.prc_typ
                      || COALESCE (TRIM (#FROM_TABLE#.addnl_prc_qual_typ), ''999'')) IN
                            (  SELECT   MAX (last_chg_tms)
                                        , MAX (prc_tms)
                                        , COALESCE (data_src_id, ''999'')
                                        , prc_srce_typ
                                        , prc_typ
                                        || COALESCE (TRIM (addnl_prc_qual_typ), ''999'')
                                 FROM   ft_t_ispc ispc1
                                WHERE   instr_id = #FROM_TABLE#.instr_id
                                AND trim(prc_typ) || trim(addnl_prc_qual_typ) IN (''BID2171'',''ASKED2124'',''ASKED1'',''0031'',''0033'',''ASKED3'')      
                             GROUP BY   prc_tms,
                                        data_src_id,
                                        prc_srce_typ,
                                        prc_typ,
                                        addnl_prc_qual_typ,
                                        prc_qt_meth_typ)</sql>
            </condition>
        </relation></table><table name="FT_T_IPDF"><relation relatedTable="FT_T_IEVP" name="ipdfbasecpi">
            <fromColumns>
                <column name="INC_EV_PRT_ID"/>
            </fromColumns>
            <toColumns>
                <column name="INC_EV_PRT_ID"/>
            </toColumns>
            <condition>
                <sql>#FROM_TABLE#.rate_fixing_base_crte is not null and #FROM_TABLE#.start_tms = (select max(start_tms) from ft_t_ipdf where inc_ev_prt_id=#FROM_TABLE#.inc_ev_prt_id and rate_fixing_base_crte is not null)</sql>
            </condition>
        </relation></table><table name="FT_T_IRCL"><relation relatedTable="FT_T_ISSU" name="IRCL_ISSU">
			<fromColumns>
				<column name="INSTR_ISSR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ISSR_ID"/>
			</toColumns>
			<condition>
				<sql>(#FROM_TABLE#.instr_id = #TO_TABLE#.instr_id or #FROM_TABLE#.instr_id is null)</sql> 
			</condition>
		</relation></table><table name="FT_T_ISGP"><relation relatedTable="FT_T_ISSU" name="isgpuniv">
			<fromColumns>
				<column name="instr_id"/>
			</fromColumns>
			<toColumns>
				<column name="instr_id"/>
			</toColumns>
			<condition>
				<sql>TRIM(#FROM_TABLE#.PRNT_ISS_GRP_OID) in (SELECT TRIM(ISS_GRP_OID) FROM FT_T_ISGR WHERE GRP_PURP_TYP=''UNIVERSE'')</sql>
			</condition>
		</relation></table></relations></model>' WHERE modl_id ='FIXED' AND modl_typ = 'ISSU';		

UPDATE FT_T_MDDF SET modl_schema =  '<?xml version="1.0" encoding="UTF-8"?>
<model xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" headerInfoXPath="concat(%modelPath:BASEISSU:ft_t_issu.pref_iss_nme%,'' - '',%modelPath:BASEISSU:ft_t_issu.pref_id_ctxt_typ% ,''-'',%modelPath:BASEISSU:ft_t_issu.pref_iss_id%)" id="FUTURES" extends="BDERIVAT" xsi:noNamespaceSchemaLocation="../../schemas/Model.xsd" minLevelToEnableChangeApproval="2">
	<occurrence extends="BASEISSU" id="BASEISSU" table="ft_t_issu" level="1" label="Issue Description/Issue Details">
		<validationRules>
			<rule id="Validation_Issue Details">
				<xPath value="boolean((%modelPath:BASEISSU:ft_t_issu.iss_tms%  <  %modelPath:BASEISSU:ft_t_issu.mat_exp_tms%) or (string-length(%modelPath:BASEISSU:ft_t_issu.iss_tms%)=0 or string-length(%modelPath:BASEISSU:ft_t_issu.mat_exp_tms%)=0))"/>
				<errorMessage value="Contract Start Date should be less than Contract Maturity date"/>
			</rule>
			<rule id="ValidationISID">
				<xPath value="boolean((count(/root/issueidentifiers/identifier[@status!=''deleted'' or string-length(@status)=0]) >0)  or (/root/issue[@status!=''new'' or  string-length(@status)=0]))"/>

				<errorMessage value="At least one Instrument Level Identifier has to be entered."/>
			</rule>
			<rule id="ValidationISID_ACTIVITYSTATUS">
				<xPath value="boolean((count(/root/issueidentifiers/identifier[@status!=''deleted'' or string-length(@status)=0]) >0 or string(/root/issue/issu.iss_actvy_stat_typ)=''INACTIVE'')  or (/root/issue[@status=''new'' or  string-length(@status)!=0]))"/>

				<errorMessage value="User has either to mark the Issue activity status(Instrument Status)  as inactive or have at least one identifier active."/>
			</rule>
		<rule id="MultiplePrimaryMarkets" pageName="Market"> 
        <xPath value="boolean(count(%modelPath:MKISDEFBISSU%[(string-length(mkis.end_tms) = 0) and (mkis.prim_trd_mkt_ind = ''Y'')])  <  2)"/>  
        <errorMessage value="There should not be multiple primary markets for a single issue."/> 
      </rule></validationRules>
		<inputFields>
			<field name="ft_t_issu.iss_typ" label="Derivative Type" level="1"/>
			<field name="ft_t_issu.iss_ut_cqty"/>
			<field name="ft_t_issu.iss_tms" label="Instrument Date"/>
		<field name="ft_t_issu.denom_curr_cde" label="Currency" level="2"/><field name="ft_t_issu.sec_form_typ"/><field name="ft_t_issu.instr_issr_id"/><field name="ft_t_issu.nom_val_unit_camt"/><field name="ft_t_issu.distribution_curr_cde"/><field name="ft_t_issu.cl_typ"/></inputFields>
	<defaultFields> 
      <field name="ft_t_issu.access_auth_typ" dataType="STRING" value="PUBLIC"/>  
      <field name="ft_t_issu.iss_actvy_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_issu.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>   
    </defaultFields></occurrence>
	<occurrence table="ft_t_ridf" id="RIDF_UND" parentId="BASEISSU" label="Contract Details" autoDelete="false">
		<where>
			<field name="ft_t_ridf.rel_typ" dataType="STRING" value="UNDERLYG"/>
		</where>
		<defaultFields>
			<field name="ft_t_ridf.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>
			<field name="ft_t_ridf.xpd_start_tms" dataType="DATETIME" srcOccurrence="BASEISSU" valueOf="ft_t_issu.iss_tms" keepInSync="true"/>
			<field name="ft_t_ridf.xpd_end_tms" dataType="DATETIME" srcOccurrence="BASEISSU" valueOf="ft_t_issu.mat_exp_tms" keepInSync="true"/>
		</defaultFields>
		<inputFields>
			<field name="ft_t_ridf.tick_sz_camt"/>
			<field name="ft_t_ridf.tick_val_camt"/>
		</inputFields>
		<!--<validationRules> 
      <rule id="VALIDATION_Exercise_Period"> 
        <xPath value="(%modelPath:RIDF_UND:ft_t_ridf.xpd_start_tms%  <  %modelPath:RIDF_UND:ft_t_ridf.xpd_end_tms%) or (string-length(%modelPath:RIDF_UND:ft_t_ridf.xpd_start_tms%)  > 0 and string-length(%modelPath:RIDF_UND:ft_t_ridf.xpd_end_tms%) = 0) or (string-length(%modelPath:RIDF_UND:ft_t_ridf.xpd_start_tms%) = 0 and string-length(%modelPath:RIDF_UND:ft_t_ridf.xpd_end_tms%) = 0) or (string-length(%modelPath:RIDF_UND:ft_t_ridf.xpd_start_tms%) = 0 and string-length(%modelPath:RIDF_UND:ft_t_ridf.xpd_end_tms%)  > 0) or (%modelPath:RIDF_UND:ft_t_ridf.xpd_start_tms% = %modelPath:RIDF_UND:ft_t_ridf.xpd_end_tms%)"/>  
        <errorMessage value="Exercise Period Start Date must be earlier than the Exercise Period End Date."/> 
      </rule> 
    </validationRules> 
  -->
	</occurrence>
	<!--	Added the Occurrence RIDF_ALL so that the Validation condition can be checked for all records -->
	<!--	other than the one that is being defaulted in RIDF_UND occurrence -->
	<occurrence table="ft_t_ridf" id="RIDF_ALL" parentId="BASEISSU" label="Contract Details">
		<defaultFields>
			<field name="ft_t_ridf.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>
		</defaultFields>
		<where>
		</where>
		<validationRules>
			<rule id="Validation_Exercise_Period_All">
				<xPath value="boolean((%modelPath:RIDF_ALL:ft_t_ridf.xpd_start_tms%  < = %modelPath:RIDF_ALL:ft_t_ridf.xpd_end_tms%) or (string-length(%modelPath:RIDF_ALL:ft_t_ridf.xpd_start_tms%)=0 or string-length(%modelPath:RIDF_ALL:ft_t_ridf.xpd_end_tms%)=0))"/>
				<errorMessage value="Exercise Start Date should be less than Exercise End Date"/>
			</rule>
		</validationRules>
	</occurrence>
	<occurrence table="ft_t_riss" id="RISS_UND" parentId="RIDF_UND" label="Underlying Details">
		<defaultFields>
			<field name="ft_t_riss.part_units_typ" dataType="STRING" value="ALL"/>
			<field name="ft_t_riss.ev_amt_typ" dataType="STRING" value="UNIT"/>
			<field name="ft_t_riss.ev_bas_prt_camt" dataType="NUMBER" value="1"/>
		</defaultFields>
		<where>
			<field name="ft_t_riss.iss_part_rl_typ" dataType="STRING" value="UNDLYING"/>
		</where>
		<inputFields>
			<field name="ft_t_riss.instr_id"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_fech" id="FECH" parentId="BASEISSU" level="2" label="Contract Details/Trading Details" autoDelete="false">
		<inputFields>
			<field name="ft_t_fech.cntrct_val_camt" level="2"/>
			<field name="ft_t_fech.first_notice_dte"/>
			<field name="ft_t_fech.first_dlv_dte"/>
			<field name="ft_t_fech.last_dlv_dte"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_rist" id="RIST" parentId="BASEISSU" label="Contract Details/Cheapest to Deliver">
		<defaultFields>
			<field name="ft_t_rist.stats_eff_tms" valueOf="ft_t_issu.start_tms" srcOccurrence="BASEISSU" dataType="DATETIME"/>
		</defaultFields>
		<inputFields>
			<field name="ft_t_rist.open_in_cqty"/>
			<field name="ft_t_rist.ctd_id_ctxt_typ"/>
			<field name="ft_t_rist.ctd_iss_nme"/>
			<field name="ft_t_rist.ctd_iss_id"/>
			<field name="ft_t_rist.ctd_instr_id"/>
		</inputFields>
	</occurrence>
	<!--  <occurrence table="ft_t_isid" id="ISIDRIC" parentId="BASEISSU">-->
	<!--   <occurrence table="ft_t_isid" id="ISIDBB" parentId="BASEISSU"> -->
	<presentation>
		<until level="100">
			<override class="codf" rendered="false"/>
			<override class="eqch" rendered="false"/>
			<override class="mnch" rendered="false"/>
			<override class="lmch" rendered="false"/>
			<override class="fnch" rendered="false"/>
			<override class="ench" rendered="false"/>
			<override class="epst" rendered="false"/>
		</until>
	</presentation>
<occurrence table="ft_t_opch" id="OPCH" parentId="BASEISSU" label="Option Characteristics"> 
    <inputFields> 
      <field name="ft_t_opch.call_put_typ"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_isgu" id="ISGU_RISK" parentId="BASEISSU" label="Country of Risk"> 
    <inputFields> 
      <field name="ft_t_isgu.gu_cnt"/>  
      <field name="ft_t_isgu.gu_id"/>  
      <field name="ft_t_isgu.gu_typ"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isgu.start_tms" valueOf="ft_t_issu.start_tms" srcOccurrence="BASEISSU" dataType="DATETIME"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_isgu.iss_gu_purp_typ" dataType="STRING" value="RISK"/> 
    </where> 
  </occurrence><occurrence table="ft_t_isgu" id="ISGU_TRDG" parentId="BASEISSU" label="Country of Trading"> 
    <where> 
      <field name="ft_t_isgu.iss_gu_purp_typ" dataType="STRING" value="TRADING"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_isgu.start_tms" valueOf="ft_t_issu.start_tms" srcOccurrence="BASEISSU" dataType="DATETIME"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_isgu.gu_cnt"/>  
      <field name="ft_t_isgu.gu_id"/>  
      <field name="ft_t_isgu.gu_typ"/> 
    </inputFields> 
  </occurrence><occurrence extends="ISDEBISSU" table="ft_t_isde" id="ISDEBISSU" parentId="BASEISSU" label="Issue Description" level="1"><where> 
      <field name="ft_t_isde.desc_usage_typ" dataType="STRING" value="PRIMARY"/> 
    </where><defaultFields> 
      <field name="ft_t_isde.desc_srce_typ" dataType="STRING" value="INHOUSE"/>  
      <field name="ft_t_isde.nls_cde" dataType="STRING" value="ENGLISH"/>  
      <field name="ft_t_isde.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields><inputFields> 
      <field name="ft_t_isde.iss_nme" label="Instrument Name" level="1"/>  
      <field name="ft_t_isde.start_tms"/>  
      <field name="ft_t_isde.iss_desc" label="Instrument Description"/> 
    </inputFields></occurrence><occurrence extends="PEDF_CALL_or_SINK" label="Principal Event Definition - Callable" autoDelete="false" table="ft_t_pedf" id="PEDF_CALL_or_SINK" parentId="BASEISSU"> 
    <where> 
      <field name="ft_t_pedf.ev_typ" dataType="STRING" value="CALLABLE"/> 
    </where> 
  <defaultFields> 
      <field name="ft_t_pedf.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_pedf.verif_ind" dataType="STRING" value="Y"/> 
    </defaultFields><inputFields> 
      <field name="ft_t_pedf.days_mth_bas_typ"/>  
      <field name="ft_t_pedf.days_yr_bas_typ"/>  
      <field name="ft_t_pedf.end_tms"/>  
      <field name="ft_t_pedf.first_py_tms" label="First Payment Date"/>  
      <field name="ft_t_pedf.py_dte_fq_qty" label="Payable Date Frequency"/>  
      <field name="ft_t_pedf.py_dte_fq_dy_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_sp_typ"/>  
      <field name="ft_t_pedf.start_tms"/> 
    </inputFields></occurrence><occurrence extends="PEDF_PUT_or_FACTOR" label="Principal Event Definition - Put" autoDelete="false" table="ft_t_pedf" id="PEDF_PUT_or_FACTOR" parentId="BASEISSU"> 
    <where> 
      <field name="ft_t_pedf.ev_typ" dataType="STRING" value="PUT"/> 
    </where> 
  <defaultFields> 
      <field name="ft_t_pedf.verif_ind" dataType="STRING" value="Y"/>  
      <!--<field name="ft_t_pedf.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>--> 
    </defaultFields><inputFields> 
      <field name="ft_t_pedf.days_mth_bas_typ"/>  
      <field name="ft_t_pedf.days_yr_bas_typ"/>  
      <field name="ft_t_pedf.end_tms"/>  
      <field name="ft_t_pedf.first_py_tms" label="First Payment Date"/>  
      <field name="ft_t_pedf.py_dte_fq_dy_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_sp_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_qty" label="Payable Date Frequency"/>  
      <field name="ft_t_pedf.start_tms"/> 
    </inputFields></occurrence><occurrence extends="MKISDEFBISSU" table="ft_t_mkis" id="MKISDEFBISSU" parentId="BASEISSU" autoCreate="false" multiple="true"> 
    <inputFields> 
      <field name="ft_t_mkis.trdng_stat_typ" label="Market Status"/>  
      <field name="ft_t_mkis.actively_traded_ind"/>  
      <field name="ft_t_mkis.norm_mkt_sz_cqty" label="Quote Lot Size"/>  
      <field name="ft_t_mkis.mrgn_sec_ind" label="Marginable"/>  
      <field name="ft_t_mkis.settle_curr_cde"/>  
      <field name="ft_t_mkis.trd_lot_size_cqty"/>  
      <field name="ft_t_mkis.prim_trd_mkt_ind" label="Primary Exchange"/>  
      <field name="ft_t_mkis.prc_curr_cde" label="Quotation Currency"/>  
      <field name="ft_t_mkis.mkt_oid" label="Exchange Name"/>  
      <field name="ft_t_mkis.trdng_ut_meas_typ"/>  
      <field name="ft_t_mkis.first_trdng_tms"/>  
      <field name="ft_t_mkis.last_trdng_tms"/>  
      <field name="ft_t_mkis.settle_meth_typ"/> 
    <field name="ft_t_mkis.trdng_curr_cde"/><field name="ft_t_mkis.iss_prc_ut_camt"/><field name="ft_t_mkis.rnd_lot_sz_cqty"/><field name="ft_t_mkis.gu_id" label="Trading Country"/><field name="ft_t_mkis.opol_ind"/></inputFields>  
    <!--<defaultFields>
      <field name="ft_t_mkis.prim_trd_mkt_ind" dataType="STRING" value="N"/>
    </defaultFields>-->  
    <!-- remove for GT 94712<validationRules> 
      <rule id="Listing_ID_Validation"> 
        <xPath value="boolean(string-length(%modelPath:LISTISID_BISSU:ft_t_isid.iss_id%)  > 0 )"/>  
        <errorMessage value="At least one Exchange Level Identifier has to be entered for every Market 123"/> 
      </rule> 
    </validationRules>--> 
  <defaultFields> 
        
      <!--<field name="ft_t_mkis.trdng_stat_typ" value="ACTIVE" dataType="STRING"/>  
      -->  
      <field name="ft_t_mkis.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_mkis.last_chg_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_mkis.last_chg_usr_id" dataType="STRING" valueOfFunction="APPUSER"/> 
    </defaultFields></occurrence><occurrence extends="MIXRBISSU" table="ft_t_mixr" id="MIXRBISSU" parentId="MKISDEFBISSU" multiple="true" dbConstraint="MKISMIXR"><defaultFields> 
      <field name="ft_t_mixr.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
        
      <field name="ft_t_mixr.trdng_stat_typ" dataType="STRING" srcOccurrence="MKISDEFBISSU" valueOf="ft_t_mkis.trdng_stat_typ"/>  
      <field name="ft_t_mixr.last_chg_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_mixr.last_chg_usr_id" dataType="STRING" valueOfFunction="APPUSER"/> 
    </defaultFields><inputFields> 
      <field name="ft_t_mixr.end_tms"/> 
    </inputFields></occurrence><occurrence table="ft_t_isde" id="ISDE_VENDOR" parentId="BASEISSU" label="Issue Description"> 
    <defaultFields> 
      <field name="ft_t_isde.nls_cde" dataType="STRING" value="ENGLISH"/>  
      <field name="ft_t_isde.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_isde.iss_nme" label="Instrument Name"/>  
      <field name="ft_t_isde.start_tms"/>  
      <field name="ft_t_isde.iss_desc" label="Instrument Description"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_isde.desc_srce_typ" dataType="STRING" value="VENDOR"/> 
    </where> 
  </occurrence><occurrence table="ft_t_isid" id="ISID_Iss_level" parentId="BASEISSU" label="Issue Identifiers" multiple="true" dbConstraint="ISSUISID"> 
    <inputFields> 
      <field name="ft_t_isid.iss_id" label="Identifier Value"/>  
      <field name="ft_t_isid.id_ctxt_typ" label="Identifier Type"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <validationRules> 
      <rule id="ISINMarket"> 
        <xPath value="boolean(not(%modelPath:ISID_Iss_level:ft_t_isid.id_ctxt_typ% =''ISIN'' and not(string-length(%modelPath:ISID_Iss_level:ft_t_isid.mkt_oid%) = 0)))"/>  
        <errorMessage value="ISIN identifier cannot have market."/> 
      </rule>  
      <!--<rule id="ISSUTXTTYPNOTSUPPORTED" messageType="WARNING"> 
	   <xPath value="boolean(not(%modelPath:ISID_Iss_level%/intlvlid_supported=''0''))"/>
          <errorMessageXPath value="concat(%modelPath:ISID_Iss_level:ft_t_isid.id_ctxt_typ%,'' is no longer supported as a valid Instrument Level Identifier. Please take necessary action.'')"/>
		 </rule>--> 
    </validationRules> 
  </occurrence><occurrence table="ft_t_isid" id="ISID_MKT_Iss_level_PUB" parentId="BASEISSU" label="Global Market Identifiers pub" multiple="true" dbConstraint="MRKTISIDPUB"> 
    <!-- <where> 
      <field name="ft_t_isid.mkt_oid" dataType="STRING" isNull="false"/> 
    </where> -->  
    <inputFields> 
      <field name="ft_t_isid.iss_id" label="Identifier Value"/>  
      <field name="ft_t_isid.id_ctxt_typ" label="Identifier Type"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <validationRules> 
      <rule id="ISINMarket"> 
        <xPath value="boolean(not(%modelPath:ISID_MKT_Iss_level_PUB:ft_t_isid.id_ctxt_typ% =''ISIN'' and not(string-length(%modelPath:ISID_MKT_Iss_level_PUB:ft_t_isid.mkt_oid%) = 0)))"/>  
        <errorMessage value="ISIN identifier cannot have market."/> 
      </rule> 
    </validationRules> 
  </occurrence><occurrence table="ft_t_isid" id="ISIDBISIN" parentId="BASEISSU" label="Identifiers"> 
    <inputFields> 
      <field name="ft_t_isid.iss_id"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_isid.id_ctxt_typ" dataType="STRING" value="ISIN"/> 
    </where> 
  </occurrence><occurrence table="ft_t_isid" id="ISIDBINH" parentId="BASEISSU" label="Identifiers"> 
    <inputFields> 
      <field name="ft_t_isid.iss_id"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_isid.id_ctxt_typ" dataType="STRING" value="INHOUSE"/> 
    </where> 
  </occurrence><occurrence table="ft_t_isid" id="ISIDBCUS" parentId="BASEISSU" label="Identifiers"> 
    <inputFields> 
      <field name="ft_t_isid.iss_id"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_isid.id_ctxt_typ" dataType="STRING" value="CUSIP"/> 
    </where> 
  </occurrence><occurrence table="ft_t_isid" id="ISIDBCOM" parentId="BASEISSU" label="Identifiers"> 
    <inputFields> 
      <field name="ft_t_isid.iss_id"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_isid.id_ctxt_typ" dataType="STRING" value="COMMON"/> 
    </where> 
  </occurrence><occurrence table="ft_t_isid" id="ISIDVAL" parentId="BASEISSU" label="Identifiers"> 
    <inputFields> 
      <field name="ft_t_isid.iss_id"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_isid.id_ctxt_typ" dataType="STRING" value="VALOREN"/> 
    </where> 
  </occurrence><occurrence table="ft_t_iscl" id="ISCL_INSUBTYP" parentId="BASEISSU" label="Issue Classification" dbConstraint="SUBTYPE" multiple="false"> 
    <where> 
      <field name="ft_t_iscl.clsf_purp_typ" dataType="STRING" value="INSUBTYP"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_iscl.cl_value" label="Instrument Sub-Type"/>  
      <field name="ft_t_iscl.indus_cl_set_id"/>  
      <field name="ft_t_iscl.clsf_oid"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_iscl.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_fnch" id="FNCH_ALL" parentId="BASEISSU" label="Fund Characteristics"> 
    <defaultFields> 
      <!--<field name="ft_t_fnch.chars_eff_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>-->  
       
    </defaultFields> 
  </occurrence><occurrence table="ft_t_iscm" id="ISCMBISSU" parentId="BASEISSU" label="Comments"> 
    <defaultFields> 
      <field name="ft_t_iscm.cmnt_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_iscm.ln_num" dataType="NUMBER" value="1"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_iscm.cmnt_txt"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_iscm.cmnt_reas_typ" dataType="STRING" value="COMMENT"/> 
    </where> 
  </occurrence><occurrence table="ft_t_isrt" id="ISRTBISSU" parentId="BASEISSU" multiple="true" label="Rating"> 
    <inputFields> 
      <field name="ft_t_isrt.rtng_curr_typ"/>  
      <field name="ft_t_isrt.rtng_purp_typ"/>  
      <field name="ft_t_isrt.rtng_set_oid"/>  
      <field name="ft_t_isrt.rtng_cde"/>  
      <field name="ft_t_isrt.start_tms"/>  
      <field name="ft_t_isrt.rtng_eff_tms"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isrt.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>   
    </defaultFields> 
  </occurrence><occurrence table="ft_t_rgch" id="RGCHBISSU" parentId="BASEISSU" label="Regulatory Information"> 
    <inputFields> 
      <field name="ft_t_rgch.gu_id"/>  
      <field name="ft_t_rgch.gu_cnt"/>  
      <field name="ft_t_rgch.gu_typ"/>  
      <field name="ft_t_rgch.isma_regulated_ind"/>  
      <field name="ft_t_rgch.rule_144a_ind"/>  
      <field name="ft_t_rgch.reg_s_ind"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_rgch.start_tms" dataType="DATETIME" srcOccurrence="BASEISSU" valueOf="ft_t_issu.start_tms"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_mkis" id="MKISPMBISSU" parentId="BASEISSU" multiple="false" label="Market Details"> 
    <inputFields> 
      <field name="ft_t_mkis.mkt_oid"/>  
      <field name="ft_t_mkis.iss_prc_ut_camt"/>  
      <field name="ft_t_mkis.rnd_lot_sz_cqty"/>  
      <field name="ft_t_mkis.trdng_curr_cde"/>  
      <field name="ft_t_mkis.trdng_stat_typ"/> 
    </inputFields>  
    <defaultFields> 
      <!--<field name="ft_t_mkis.trdng_stat_typ" dataType="STRING" value="ACTIVE"/>  
      -->  
      <field name="ft_t_mkis.prc_ut_meas_typ" dataType="STRING" value="NOMINAL"/>  
      <!--<field name="ft_t_mkis.mkt_iss_oid" dataType="STRING" valueOfFunction="OID" uiOnly="true"/> 
      --> 
    </defaultFields>  
    <where> 
      <field name="ft_t_mkis.prim_trd_mkt_ind" dataType="STRING" value="Y"/> 
    </where>  
    <validationRules> 
      <rule id="Warning" messageType="WARNING"> 
        <xPath value="boolean(string-length(%modelPath:MKISPMBISSU:ft_t_mkis.end_tms%)= 0 or string-length(%modelPath:MKISPMBISSU:ft_t_mkis.end_tms%) <  SYSDATE())"/>  
        <errorMessage value="Primary Market is end dated"/> 
      </rule> 
    </validationRules> 
  </occurrence><occurrence table="ft_t_mixr" id="MIXR_PRIM" parentId="MKISPMBISSU" label=" Market Issue Cross Reference ((Primary)" dbConstraint="MKISMIXR"> 
    <defaultFields> 
      <field name="ft_t_mixr.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_mixr.trdng_stat_typ" dataType="STRING" srcOccurrence="MKISPMBISSU" valueOf="ft_t_mkis.trdng_stat_typ"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_isid" id="ISID_TIC_PM_PUB" parentId="MIXR_PRIM" label="Issue Identifier-Ticker" dbConstraint="MIXRISIDPUB"> 
    <where> 
      <field name="ft_t_isid.id_ctxt_typ" dataType="STRING" value="TICKER"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_isid.iss_id" label="Primary Ticker"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isid.isid_oid" dataType="STRING" srcOccurrence="MIXR_PRIM" valueOf="ft_t_mixr.isid_oid"/>  
      <field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_isid.mkt_oid" dataType="STRING" srcOccurrence="MKISPMBISSU" valueOf="ft_t_mkis.mkt_oid"/>  
      <field name="ft_t_isid.instr_id" dataType="STRING" srcOccurrence="BASEISSU" valueOf="ft_t_issu.instr_id"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_isxr" id="BISSU_ISXR_ISID" parentId="LISTISID_BISSU" multiple="true" autoDelete="false"> 
    <where> 
      <field name="ft_t_isxr.isid_oid" dataType="STRING" srcOccurrence="LISTISID_BISSU" valueOf="ft_t_isid.isid_oid"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_isxr.last_chg_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_isxr.last_chg_usr_id" dataType="STRING" valueOfFunction="APPUSER"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_isxr.isxr_rel_purp_typ"/>  
      <field name="ft_t_isxr.start_tms"/>  
      <field name="ft_t_isxr.end_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_must" id="MUST_MICOPOL" parentId="MKISDEFBISSU" autoDelete="false"> 
    <where> 
      <field name="ft_t_must.stat_def_id" dataType="STRING" value="MICOPOL"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_must.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_must.stat_char_val_txt" label="OPOL"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_must" id="MUST_CDREXCH" parentId="MKISDEFBISSU" autoDelete="false"> 
    <where> 
      <field name="ft_t_must.stat_def_id" dataType="STRING" value="CDREXCH"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_must.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_must.stat_char_val_txt" label="Exchange Calendar"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_ispc" id="ISPCBISSU" parentId="BASEISSU" label="Issue Price Details"> 
    <inputFields> 
      <field name="ft_t_ispc.prc_typ"/>  
      <field name="ft_t_ispc.prc_srce_typ"/>  
      <field name="ft_t_ispc.prc_tms"/>  
      <field name="ft_t_ispc.unit_cprc"/>  
      <field name="ft_t_ispc.prc_curr_cde"/> 
    </inputFields>  
    <defaultFields> 
      <!--      <field name="ft_t_ispc.prc_curr_cde" dataType="STRING" srcOccurrence="BASEISSU" valueOf="ft_t_issu.denom_curr_cde"/>  -->  
      <field name="ft_t_ispc.prc_qt_meth_typ" dataType="STRING" value="1"/>  
      <field name="ft_t_ispc.prc_valid_typ" dataType="STRING" value="VALID"/>  
      <field name="ft_t_ispc.prcng_meth_typ" dataType="STRING" value="1"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_iedf" id="IEDF_DIV_or_INT" parentId="BASEISSU" label="Income Event Definition(Dividend/Interest)"> 
    <defaultFields> 
      <field name="ft_t_iedf.verif_ind" dataType="STRING" value="Y"/>  
      <field name="ft_t_iedf.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_iedf.first_py_tms" label="First Payment Date"/>  
      <field name="ft_t_iedf.days_mth_bas_typ"/>  
      <field name="ft_t_iedf.days_yr_bas_typ"/>  
      <field name="ft_t_iedf.calc_meth_typ" label="Calculation Method"/>  
      <field name="ft_t_iedf.py_dte_fq_qty" label="Payable Date Frequency"/>  
      <field name="ft_t_iedf.py_dte_fq_dy_typ"/>  
      <field name="ft_t_iedf.py_dte_fq_sp_typ"/>  
      <field name="ft_t_iedf.start_tms"/>  
      <field name="ft_t_iedf.end_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_ievp" id="IEVP_DIV_or_INT" parentId="IEDF_DIV_or_INT" label="Income Event Participant(Dividend/Interest)"> 
    <defaultFields> 
      <field name="ft_t_ievp.prt_purp_typ" dataType="STRING" value="PMTDTLS"/>  
      <field name="ft_t_ievp.start_tms" dataType="DATETIME" srcOccurrence="IEDF_DIV_or_INT" valueOf="ft_t_iedf.start_tms"/> 
    </defaultFields>  
    <!--<validationRules>
			<rule id="Unique_IPDF">
				<xPath value="is-unique(%modelPath:IPDF_DIV_or_INT%, &quot;concat(ipdf.pay_curr_cde, substring((ipdf.start_tms), 1, 10))&quot;)"/>
				<errorMessage value="Payment currency and Start Date/Time combination should be unique in Income Payments of Dividend/Interest Section"/>
				
			</rule>
		</validationRules>--> 
  </occurrence><occurrence table="ft_t_ipdf" id="IPDF_DIV_or_INT" parentId="IEVP_DIV_or_INT" multiple="true" label="Income Payment Definition(Dividend/Interest)"> 
    <inputFields> 
      <field name="ft_t_ipdf.start_tms"/>  
      <field name="ft_t_ipdf.ev_rate_typ"/>  
      <field name="ft_t_ipdf.ev_crte"/>  
      <field name="ft_t_ipdf.iss_part_rl_typ"/>  
      <field name="ft_t_ipdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ipdf.pay_curr_cde"/>  
      <field name="ft_t_ipdf.end_tms"/> 
    </inputFields>  
    <defaultFields/> 
  </occurrence><occurrence table="ft_t_pevp" id="PEVP_CALL_or_SINK" parentId="PEDF_CALL_or_SINK" label="Principal Event Participant(Call/Sink)" autoDelete="false"> 
    <defaultFields> 
      <field name="ft_t_pevp.start_tms" dataType="DATETIME" srcOccurrence="PEDF_CALL_or_SINK" valueOf="ft_t_pedf.start_tms" keepInSync="true"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_pevp.prt_purp_typ" dataType="STRING" value="SNKFDRED"/> 
    </where>  
    <validationRules> 
      <rule id="Unique_PPDF_Call_or_Sink"> 
        <xPath value="is-unique(%modelPath:PPDF_CALL_or_SINK%, &quot;concat(ppdf.pay_curr_cde,substring((ppdf.start_tms), 1, 10))&quot;)"/>  
        <!--        <xPath value="is-unique(%modelPath:PPDF_CALL_or_SINK%,&quot;substring((ppdf.start_tms), 1,10)&quot;)"/>  -->  
        <errorMessage value="Payment currency and Start Date/Time combination should be unique in Principal Payments of Call/Sink Section"/> 
      </rule> 
    </validationRules> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_CALL_or_SINK" parentId="PEVP_CALL_or_SINK" multiple="true" label="Principal Payment Definition(Call/Sink)" autoDelete="false"> 
    <inputFields> 
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.start_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/> 
    </inputFields>  
    <defaultFields/> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_PUT_or_FACTOR" parentId="PEVP_PUT_or_FACTOR" multiple="true" label="Principal Payment Definition(Factor)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_pedf" id="PEDF_PUT" parentId="BASEISSU" label="Principal Event Defitnition(Put)" autoDelete="false"> 
    <inputFields> 
      <field name="ft_t_pedf.days_mth_bas_typ"/>  
      <field name="ft_t_pedf.days_yr_bas_typ"/>  
      <field name="ft_t_pedf.end_tms"/>  
      <field name="ft_t_pedf.first_py_tms" label="First Payment Date"/>  
      <field name="ft_t_pedf.py_dte_fq_dy_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_sp_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_qty" label="Payable Date Frequency"/>  
      <field name="ft_t_pedf.start_tms"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_pedf.verif_ind" dataType="STRING" value="Y"/>  
      <!--<field name="ft_t_pedf.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>--> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_PUT" parentId="PEVP_PUT" multiple="true" label="Principal Payment Definition(Put)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_NEXTPUT" parentId="PEVP_NEXTPUT" multiple="true" label="Principal Payment Definition(NextPut)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_NXTPARPT" parentId="PEVP_NXTPARPT" multiple="true" label="Principal Payment Definition(NxtParpt)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_PUTPROV" parentId="PEVP_PUTPROV" multiple="true" label="Principal Payment Definition(PutProv)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_PUTSCHED" parentId="PEVP_PUTSCHED" multiple="true" label="Principal Payment Definition(PutSched)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_pedf" id="PEDF_CALLABLE" parentId="BASEISSU" label="Principal Event Defitnition(Call)" autoDelete="false"> 
    <inputFields> 
      <field name="ft_t_pedf.days_mth_bas_typ"/>  
      <field name="ft_t_pedf.days_yr_bas_typ"/>  
      <field name="ft_t_pedf.end_tms"/>  
      <field name="ft_t_pedf.first_py_tms" label="First Payment Date"/>  
      <field name="ft_t_pedf.py_dte_fq_dy_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_sp_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_qty" label="Payable Date Frequency"/>  
      <field name="ft_t_pedf.start_tms"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_pedf.verif_ind" dataType="STRING" value="Y"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_CALLABLE" parentId="PEVP_CALLABLE" multiple="true" label="Principal Payment Definition(Callable)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_pedf" id="PEDF_CALLED" parentId="BASEISSU" label="Principal Event Defitnition(Call)" autoDelete="false"> 
    <inputFields> 
      <field name="ft_t_pedf.days_mth_bas_typ"/>  
      <field name="ft_t_pedf.days_yr_bas_typ"/>  
      <field name="ft_t_pedf.end_tms"/>  
      <field name="ft_t_pedf.first_py_tms" label="First Payment Date"/>  
      <field name="ft_t_pedf.py_dte_fq_dy_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_sp_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_qty" label="Payable Date Frequency"/>  
      <field name="ft_t_pedf.start_tms"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_pedf.verif_ind" dataType="STRING" value="Y"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_CALLED" parentId="PEVP_CALLED" multiple="true" label="Principal Payment Definition(Called)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_pedf" id="PEDF_CALATPAR" parentId="BASEISSU" label="Principal Event Defitnition(Call)" autoDelete="false"> 
    <inputFields> 
      <field name="ft_t_pedf.days_mth_bas_typ"/>  
      <field name="ft_t_pedf.days_yr_bas_typ"/>  
      <field name="ft_t_pedf.end_tms"/>  
      <field name="ft_t_pedf.first_py_tms" label="First Payment Date"/>  
      <field name="ft_t_pedf.py_dte_fq_dy_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_sp_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_qty" label="Payable Date Frequency"/>  
      <field name="ft_t_pedf.start_tms"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_pedf.verif_ind" dataType="STRING" value="Y"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_CALATPAR" parentId="PEVP_CALATPAR" multiple="true" label="Principal Payment Definition(Calatpar)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_pedf" id="PEDF_CALATPRE" parentId="BASEISSU" label="Principal Event Defitnition(Call)" autoDelete="false"> 
    <inputFields> 
      <field name="ft_t_pedf.days_mth_bas_typ"/>  
      <field name="ft_t_pedf.days_yr_bas_typ"/>  
      <field name="ft_t_pedf.end_tms"/>  
      <field name="ft_t_pedf.first_py_tms" label="First Payment Date"/>  
      <field name="ft_t_pedf.py_dte_fq_dy_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_sp_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_qty" label="Payable Date Frequency"/>  
      <field name="ft_t_pedf.start_tms"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_pedf.verif_ind" dataType="STRING" value="Y"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_CALATPRE" parentId="PEVP_CALATPRE" multiple="true" label="Principal Payment Definition(Calatpre)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_isgp" id="ISGP_UNIV" parentId="BASEISSU" label="Issue Group Participant" multiple="true" dbConstraint="isgpuniv"> 
    <defaultFields> 
      <field name="ft_t_isgp.prt_purp_typ" dataType="STRING" value="MANUAL"/>  
      <field name="ft_t_isgp.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_isgp.prnt_iss_grp_oid"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_cucn" id="CUCN" parentId="BASEISSU"> 
    <defaultFields> 
      <field name="ft_t_cucn.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_cucf" id="CUCF" parentId="CUCN"> 
    <defaultFields> 
      <field name="ft_t_cucf.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_cucf.instr_id" dataType="STRING" valueOfXPath="/root/issue/issu.instr_id"/> 
    </defaultFields> 
  </occurrence><relations><table name="FT_T_RIDF"><relation relatedTable="FT_T_ISSU" name="ridfwarrant">
            <fromColumns>
                <column name="instr_id"/>
            </fromColumns>
            <toColumns>
                <column name="instr_id"/>
            </toColumns>
            <condition>
                <sql>#FROM_TABLE#.rel_typ IN (''WARRANT'',''WRT CALL'',''WRT PUT'')</sql>
            </condition>
        </relation></table><table name="FT_T_RISS"><relation relatedTable="FT_T_RIDF" name="risswarrant">
            <fromColumns>
                <column name="rld_iss_feat_id"/>
            </fromColumns>
            <toColumns>
                <column name="rld_iss_feat_id"/>
            </toColumns>
            <condition>
                <sql>#FROM_TABLE#.iss_part_rl_typ IN (''DELIVER'',''RECEIVE'',''UNDLYING'')</sql>
            </condition>
        </relation></table><table name="FT_T_RIST"><relation relatedTable="FT_T_ISSU" name="CTD_INSTR">
			<fromColumns>
				<column name="CTD_INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
		</relation></table><table name="FT_T_ISGU"><relation relatedTable="FT_T_ISSU" name="ISSUISGU">
            <fromColumns>
                <column name="INSTR_ID"/>
            </fromColumns>
            <toColumns>
                <column name="INSTR_ID"/>
            </toColumns>
            <condition>
                <sql>#FROM_TABLE#.gu_typ =''COUNTRY''</sql>
            </condition>
        </relation></table><table name="FT_T_PEDF"><relation relatedTable="FT_T_ISSU" name="pedffactorissu">
            <fromColumns>
                <column name="instr_id"/>
            </fromColumns>
            <toColumns>
                <column name="instr_id"/>
            </toColumns>
            <condition>
                <sql>#FROM_TABLE#.ev_typ IN (''FACTOR'')</sql>
            </condition>
        </relation></table><table name="FT_T_MKIS"><relation relatedTable="FT_T_ISSU" name="ISSUMKIS">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<condition>
				<sql>(#FROM_TABLE#.prim_trd_mkt_ind=''Y'' or (select count(*) from ft_t_mkis where ft_t_mkis.instr_id=#TO_TABLE#.instr_id and (ft_t_mkis.end_tms is null or ft_t_mkis.end_tms  >= SYSDATE()))=1)</sql>
			</condition>
		</relation></table><table name="FT_T_MIXR"><relation relatedTable="FT_T_MKIS" name="MKISMIXR">
			<fromColumns>
				<column name="MKT_ISS_OID"/>
			</fromColumns>
			<toColumns>
				<column name="MKT_ISS_OID"/>
			</toColumns>
		</relation></table><table name="FT_T_ISID"><relation relatedTable="FT_T_ISSU" name="ISSUISID">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<condition>
					<sql>not exists (select 1 from ft_t_mixr mixr where (mixr.end_tms is null or mixr.end_tms  > SYSDATE()) and #FROM_TABLE#.ISID_OID=mixr.isid_oid) and #FROM_TABLE#.MKT_OID is null</sql>
				</condition>
		</relation></table><table name="FT_T_ISID"><relation relatedTable="FT_T_ISSU" name="MRKTISID">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<condition>
				<sql>not exists (select 1 from ft_t_mixr mixr where (mixr.end_tms is null or mixr.end_tms  > SYSDATE()) and #FROM_TABLE#.ISID_OID=mixr.isid_oid) and #FROM_TABLE#.MKT_OID is not null</sql>
		</condition>
		</relation></table><table name="FT_T_ISID"><relation relatedTable="FT_T_ISSU" name="MRKTISIDPUB">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<condition>			
				<sql>not exists (select 1 from ft_t_mixr mixr where (mixr.end_tms is null or mixr.end_tms  > SYSDATE()) and #FROM_TABLE#.ISID_OID=mixr.isid_oid) and #FROM_TABLE#.MKT_OID is not null</sql>			
			</condition>
		</relation></table><table name="FT_T_ISCL"><relation relatedTable="FT_T_ISSU" name="SUBTYPE">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<condition>
				<sql>#FROM_TABLE#.indus_cl_set_id in (''TKISSTYP'',''BBSECTYP'',''FTISSTYP'',''ASSETCLS'')</sql>
			</condition>
		</relation></table><table name="FT_T_ISCL"><relation relatedTable="FT_T_ISSU" name="SUBTYPE">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<condition>
				<sql>#FROM_TABLE#.indus_cl_set_id in (''TKISSTYP'',''BBSECTYP'',''FTISSTYP'',''ASSETCLS'')</sql>
			</condition>
		</relation></table><table name="FT_T_ISLL"><relation relatedTable="FT_T_ISSU" name="isllissu">
            <fromColumns>
                <column name="instr_id"/>
            </fromColumns>
            <toColumns>
                <column name="instr_id"/>
            </toColumns>
            <condition>
                <sql>#FROM_TABLE#.last_chg_tms in (SELECT max(last_chg_tms) FROM ft_t_isll where instr_id = #TO_TABLE#.instr_id)</sql>
            </condition>
        </relation></table><table name="FT_T_RIST"><relation relatedTable="FT_T_ISSU" name="RIST_INSTR">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
		</relation></table><table name="FT_T_LMST"><relation relatedTable="FT_T_ISSU" name="latestlmst">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<condition>
				<sql>#FROM_TABLE#.last_chg_tms = (SELECT MAX (last_chg_tms) FROM ft_t_lmst WHERE ft_t_lmst.instr_id = #TO_TABLE#.instr_id)</sql>
			</condition>
		</relation></table><table name="FT_T_AISR"><relation relatedTable="FT_T_ISSU" name="MyAccountIssueRole">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<condition>
				<sql>#FROM_TABLE#.ACCT_ISSU_RL_TYP is not null</sql>
			</condition>
		</relation></table><table name="FT_T_AISR"><relation relatedTable="FT_T_ISSU" name="MyIssueAccountRole">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<!--Commented as AISR.ISSU_ACCT_RL_TYP has been removed (GT 37778)-->
			<!--<condition>
        <sql>#FROM_TABLE#.ISSU_ACCT_RL_TYP is not null</sql>
      </condition>-->
		</relation></table><table name="FT_T_ISRT"><relation relatedTable="FT_T_ISSU" name="RTNG_HIST" checkService="RATING_SERVICE">
			<condition>
				<sql>#FROM_TABLE#.SYS_EFF_END_TMS IS NULL AND (#FROM_TABLE#.INSTR_ID) = (#TO_TABLE#.INSTR_ID)</sql>
			</condition>
		</relation></table><table name="FT_T_MIXR"><relation relatedTable="FT_T_ISID" name="MIXRISID">
			<fromColumns>
				<column name="ISID_OID"/>
			</fromColumns>
			<toColumns>
				<column name="ISID_OID"/>
			</toColumns>
			<condition>
        <sql>exists (select 1 from FT_T_MIXR mixr where (mixr.end_tms IS NULL or mixr.end_tms  > p_asOfDate) and #TO_TABLE#.ISID_OID=mixr.isid_oid)</sql>
			</condition>
		</relation></table><table name="FT_T_MIXR"><relation relatedTable="FT_T_ISID" name="MIXRISIDPUB">
			<fromColumns>
				<column name="ISID_OID"/>
			</fromColumns>
			<toColumns>
				<column name="ISID_OID"/>
			</toColumns>
			<condition>				
				<sql>exists (select 1 from FT_T_MIXR mixr where (mixr.end_tms IS NULL or mixr.end_tms  > SYSDATE()) and #TO_TABLE#.ISID_OID=mixr.isid_oid)</sql>				
			</condition>
		</relation></table><table name="FT_T_MKIS"><relation relatedTable="FT_T_ISPC" name="LATESTPRICE">
			<fromColumns>
				<column name="INSTR_ID"/>
				<column name="MKT_OID"/>
				<column name="PRC_CURR_CDE"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
				<column name="MKT_OID"/>
				<column name="PRC_CURR_CDE"/>
			</toColumns>
			<condition>
				<sql>#TO_TABLE#.prc_tms = 
             (select max(prc_tms)
                from ft_t_ispc maxprc
               where maxprc.instr_id = #TO_TABLE#.instr_id
                 and maxprc.mkt_oid = #TO_TABLE#.mkt_oid
                 and maxprc.prc_curr_cde = #TO_TABLE#.prc_curr_cde)</sql>
			</condition>
		</relation></table><table name="FT_T_MUST"><relation relatedTable="FT_T_MKIS" name="mkismust">
            <fromColumns>
                <column name="MKT_ISS_OID"/>
            </fromColumns>
            <toColumns>
                <column name="MKT_ISS_OID"/>
            </toColumns>
        </relation></table><table name="FT_T_ISPC"><relation name="latestclosingprice" relatedTable="FT_T_ISSU">
            <fromColumns>
                <column name="INSTR_ID"/>
            </fromColumns>
            <toColumns>
                <column name="INSTR_ID"/>
            </toColumns>
            <condition>
                <sql>(#FROM_TABLE#.last_chg_tms
                      , #FROM_TABLE#.prc_tms
                      , COALESCE (#FROM_TABLE#.data_src_id, ''999'')
                      , #FROM_TABLE#.prc_srce_typ
                      , #FROM_TABLE#.prc_typ
                      || COALESCE (TRIM (#FROM_TABLE#.addnl_prc_qual_typ), ''999'')) IN
                            (  SELECT   MAX (last_chg_tms)
                                        , MAX (prc_tms)
                                        , COALESCE (data_src_id, ''999'')
                                        , prc_srce_typ
                                        , prc_typ
                                        || COALESCE (TRIM (addnl_prc_qual_typ), ''999'')
                                 FROM   ft_t_ispc ispc1
                                WHERE   instr_id = #FROM_TABLE#.instr_id
                                AND trim(prc_typ) || trim(addnl_prc_qual_typ) IN (''BID2171'',''ASKED2124'',''ASKED1'',''0031'',''0033'',''ASKED3'')      
                             GROUP BY   prc_tms,
                                        data_src_id,
                                        prc_srce_typ,
                                        prc_typ,
                                        addnl_prc_qual_typ,
                                        prc_qt_meth_typ)</sql>
            </condition>
        </relation></table><table name="FT_T_IEDF"><relation relatedTable="FT_T_ISSU" name="issuiedfinterest">
            <fromColumns>
                <column name="instr_id"/>
            </fromColumns>
            <toColumns>
                <column name="instr_id"/>
            </toColumns>
            <condition>
                <sql>#FROM_TABLE#.ev_typ IN (''INTEREST'')</sql>
            </condition>
        </relation></table><table name="FT_T_IEVP"><relation relatedTable="FT_T_IEDF" name="iedfievpestdiv">
            <fromColumns>
                <column name="INC_EV_DEF_ID"/>
            </fromColumns>
            <toColumns>
                <column name="INC_EV_DEF_ID"/>
            </toColumns>
            <condition>
                <sql>#FROM_TABLE#.prt_purp_typ IN (''ESTIMATE'',''DIVIDEND'')</sql>
            </condition>
        </relation></table><table name="FT_T_IPDF"><relation relatedTable="FT_T_IEVP" name="ipdfbasecpi">
            <fromColumns>
                <column name="INC_EV_PRT_ID"/>
            </fromColumns>
            <toColumns>
                <column name="INC_EV_PRT_ID"/>
            </toColumns>
            <condition>
                <sql>#FROM_TABLE#.rate_fixing_base_crte is not null and #FROM_TABLE#.start_tms = (select max(start_tms) from ft_t_ipdf where inc_ev_prt_id=#FROM_TABLE#.inc_ev_prt_id and rate_fixing_base_crte is not null)</sql>
            </condition>
        </relation></table><table name="FT_T_PEVP"><relation relatedTable="FT_T_PEDF" name="pevpfactorissu">
            <fromColumns>
                <column name="prin_ev_def_id"/>
            </fromColumns>
            <toColumns>
                <column name="prin_ev_def_id"/>
            </toColumns>
            <condition>
                <sql>#FROM_TABLE#.prt_purp_typ IN (''FACTOR'')</sql>
            </condition>
        </relation></table><table name="FT_T_PPDF"><relation relatedTable="FT_T_PEVP" name="ppdf_pevp">
            <fromColumns>
                <column name="PRIN_EV_PRT_ID"/>
            </fromColumns>
            <toColumns>
                <column name="PRIN_EV_PRT_ID"/>
            </toColumns>
            <condition>
                <sql>ROWNUM=1</sql>
            </condition>
        </relation></table><table name="FT_T_IRCL"><relation relatedTable="FT_T_ISSU" name="IRCL_ISSU">
			<fromColumns>
				<column name="INSTR_ISSR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ISSR_ID"/>
			</toColumns>
			<condition>
				<sql>(#FROM_TABLE#.instr_id = #TO_TABLE#.instr_id or #FROM_TABLE#.instr_id is null)</sql> 
			</condition>
		</relation></table><table name="FT_T_ISGP"><relation relatedTable="FT_T_ISSU" name="isgpuniv">
			<fromColumns>
				<column name="instr_id"/>
			</fromColumns>
			<toColumns>
				<column name="instr_id"/>
			</toColumns>
			<condition>
				<sql>TRIM(#FROM_TABLE#.PRNT_ISS_GRP_OID) in (SELECT TRIM(ISS_GRP_OID) FROM FT_T_ISGR WHERE GRP_PURP_TYP=''UNIVERSE'')</sql>
			</condition>
		</relation></table></relations></model>' WHERE modl_id ='FUTURES' AND modl_typ = 'ISSU';		

UPDATE FT_T_MDDF SET modl_schema ='<?xml version="1.0" encoding="UTF-8"?>
<model xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" id="GUGR0001" headerInfoXPath="concat(''Geographic Unit Group Name - '',/root/geounitgroup/gugr.grp_nme)" xsi:noNamespaceSchemaLocation="../../schemas/Model.xsd">
<relations/></model>' WHERE modl_id ='GUGR0001' AND modl_typ = 'GUGR';		


UPDATE FT_T_MDDF SET modl_schema = '<?xml version="1.0" encoding="UTF-8"?>
<model xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" id="ISSR0001" xsi:noNamespaceSchemaLocation="../../schemas/Model.xsd" headerInfoXPath="concat(''Issuer - '',/root/issuer/issr.issr_typ,'' / '',/root/issuer/issueridentifiers/issueridentifier/irid.issr_id,'' / '',/root/issuer/issr.issr_nme)">  
  <occurrence table="ft_t_issr" id="ISSR_1" level="1"> 
    <defaultFields> 
      <field name="ft_t_issr.start_tms" valueOfFunction="CURRTMS" dataType="DATETIME"/>  
      <field name="ft_t_issr.issr_nme" dataType="STRING" srcOccurrence="IRDE_1" valueOf="ft_t_irde.issr_nme"/>  
      <field name="ft_t_issr.issr_desc" dataType="STRING" srcOccurrence="IRDE_1" valueOf="ft_t_irde.issr_desc"/>  
      <field name="ft_t_issr.pref_issr_id" valueOf="ft_t_irid.issr_id" srcOccurrence="IRID_PRNT"/>  
      <field name="ft_t_issr.pref_id_ctxt_typ" valueOf="ft_t_irid.issr_id_ctxt_typ" srcOccurrence="IRID_PRNT"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_issr.issr_typ" label="Issuer Type"/>  
      <field name="ft_t_issr.issr_nme"/>  
      <field name="ft_t_issr.issr_desc"/>  
      <field name="ft_t_issr.issr_alph_srch_txt"/>  
      <field name="ft_t_issr.fins_inst_mnem"/>  
      <field name="ft_t_issr.fiscal_yr_end_typ"/>  
      <field name="ft_t_issr.mult_shr_ind"/>  
      <field name="ft_t_issr.data_stat_typ"/>  
      <field name="ft_t_issr.data_src_id"/>  
      <field name="ft_t_issr.end_tms"/>  
      <field name="ft_t_issr.start_tms"/>  
      <field name="ft_t_issr.company_match_id"/>  
      <field name="ft_t_issr.pref_issr_id"/>  
      <field name="ft_t_issr.pref_id_ctxt_typ"/>  
      <field name="ft_t_issr.fund_srce_typ"/> 
      <field name="ft_t_issr.supranational_org_ind"/>       
    </inputFields>  
    <!-- <validationRules>
      <rule id="Validation">
        <xPath value="boolean(string-length(%modelPath:ISSR_1:ft_t_issr.issr_nme%)  > 0 and  string-length(%modelPath:ISSR_1:ft_t_issr.pref_issr_id%)  > 0)"/>
        <errorMessage value="Please set Issuer Name and Preferred Issuer ID using Set Preferred Name/ID/Context Section"/>
      </rule>
      <rule id="Validation">
        <xPath value="boolean(not(count(%modelPath:IRID_PRNT%[irid.issr_id_ctxt_typ = /root/issuer/issr.pref_id_ctxt_typ and irid.issr_id=/root/issuer/issr.pref_issr_id][@status=''deleted''])  > 0))"/>
        <errorMessage value="Cannot delete this identifier as it has been set as Preferred. To delete this first change Preferred Identifier."/>
      </rule>
      <rule id="Validation">
        <xPath value="boolean(not(count(%modelPath:IRDE_1%[irde.issr_nme = /root/issuer/issr.issr_nme]) = 0) or (string-length(%modelPath:IRDE_1:ft_t_irde.issr_nme%) = 0))"/>
        <errorMessage value="Cannot modify Issuer Name as it has been set as Preferred. If you want to change this then please click ''Set Pref. as'' button before save changes."/>
      </rule>
      <rule id="Validation">
        <xPath value="boolean(not(count(%modelPath:IRID_PRNT%[irid.issr_id_ctxt_typ = /root/issuer/issr.pref_id_ctxt_typ and irid.issr_id=/root/issuer/issr.pref_issr_id]) = 0) or (string-length(%modelPath:IRID_PRNT:ft_t_irid.issr_id%) = 0))"/>
        <errorMessage value="Cannot modify this identifier as it has been set as Preferred. If you want to change this then please click ''Set Pref. as'' button before save changes."/>
      </rule>
    </validationRules>--> 
  </occurrence>  
  <occurrence table="ft_t_irrt" id="IRRT_1" parentId="ISSR_1" level="3"> 
    <inputFields> 
      <field name="ft_t_irrt.rtng_set_oid" level="3"/>  
      <field name="ft_t_irrt.rtng_value_oid" level="3"/>  
      <field name="ft_t_irrt.start_tms" level="3"/>  
      <field name="ft_t_irrt.rtng_cde"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_irrt.start_tms" valueOf="ft_t_issr.start_tms" srcOccurrence="ISSR_1" dataType="DATETIME"/>  
      <!--  Custom Code Starts Here  -->  
      <field name="ft_t_irrt.issr_rtng_oid" dataType="STRING" valueOfFunction="OID"/>  
      <field name="ft_t_irrt.data_src_id" dataType="STRING" value="INTRNL"/>
      <!--  Custom Code Ends Here  --> 
    </defaultFields> 
  </occurrence>  
  <occurrence table="ft_t_irde" id="IRDE_1" parentId="ISSR_1"> 
    <where> 
      <field name="ft_t_irde.desc_usage_typ" dataType="STRING" value="PRIMARY"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_irde.nls_cde" dataType="STRING" value="ENGLISH"/>  
      <field name="ft_t_irde.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <!--<field name="ft_t_irde.issr_nme" dataType="STRING" valueOf="ft_t_issr.issr_nme" srcOccurrence="ISSR_1"/>
      <field name="ft_t_irde.issr_desc" dataType="STRING" valueOf="ft_t_issr.issr_desc" srcOccurrence="ISSR_1"/>--> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_irde.issr_nme"/>  
      <field name="ft_t_irde.issr_desc"/> 
    </inputFields> 
  </occurrence>  
  <!--validation for if pref record deleted from IRID table -->  
  <occurrence table="ft_t_irgu" id="IRGU_1" parentId="ISSR_1"> 
    <defaultFields> 
      <field name="ft_t_irgu.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields> 
  </occurrence>   
  <!-- Copied from FINR -->  
  <occurrence table="ft_t_ccrf" id="CCRF_1" parentId="ISSR_1"> 
    <defaultFields> 
      <field name="ft_t_ccrf.start_tms" valueOfFunction="CURRTMS" dataType="DATETIME"/>  
      <field name="ft_t_ccrf.fins_inst_mnem" valueOf="ft_t_issr.inst_mnem" srcOccurrence="ISSR_1" dataType="STRING"/>  
      <field name="ft_t_ccrf.cross_ref_purp_typ" value="ADDRESS" dataType="STRING"/>  
      <field name="ft_t_ccrf.cntl_cross_ref_oid" dataType="STRING" valueOfFunction="OID"/> 
    </defaultFields> 
  </occurrence>  
  <!-- Address occurrences -->  
  <occurrence table="ft_t_adtp" id="ADTP_1" parentId="CCRF_1" autoCreate="false" multiple="true"> 
    <defaultFields> 
      <field name="ft_t_adtp.start_tms" valueOfFunction="CURRTMS" dataType="DATETIME"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_adtp.addr_typ"/> 
    </inputFields>  
    <!-- This rule will check for duplicate records of ADST within ADTP -->  
    <validationRules> 
      <rule id="Unique_ADTP_ADST"> 
        <xPath value="is-unique(%modelPath:ADST_1%, ''concat(adst.addr_typ_id, adst.stat_def_id, adst.denom_curr_cde)'')"/>  
        <errorMessage value="Statistic Name and Denominated Currency combination should be unique in Address Type Usage Statistics screen"/> 
      </rule> 
    </validationRules> 
  </occurrence>  
  <occurrence table="ft_t_adtp" id="ADTP_2" autoDelete="false" parentId="CCRF_1"> 
    <where activeOnly="false"> 
      <field name="ft_t_adtp.addr_typ" value="MAILING" dataType="STRING"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_adtp.start_tms" valueOfFunction="CURRTMS" dataType="DATETIME"/> 
    </defaultFields> 
  </occurrence>  
  <occurrence table="ft_t_adtp" id="ADTP_3" autoDelete="false" parentId="CCRF_1"> 
    <where activeOnly="false"> 
      <field name="ft_t_adtp.addr_typ" value="PHONENO" dataType="STRING"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_adtp.start_tms" valueOfFunction="CURRTMS" dataType="DATETIME"/> 
    </defaultFields> 
  </occurrence>  
  <occurrence table="ft_t_adtp" id="ADTP_4" autoDelete="false" parentId="CCRF_1"> 
    <where activeOnly="false"> 
      <field name="ft_t_adtp.addr_typ" value="FAXTLXNO" dataType="STRING"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_adtp.start_tms" valueOfFunction="CURRTMS" dataType="DATETIME"/> 
    </defaultFields> 
  </occurrence>  
  <occurrence table="ft_t_adtp" id="ADTP_5" autoDelete="false" parentId="CCRF_1"> 
    <where activeOnly="false"> 
      <field name="ft_t_adtp.addr_typ" value="REGISTER" dataType="STRING"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_adtp.start_tms" valueOfFunction="CURRTMS" dataType="DATETIME"/> 
    </defaultFields> 
  </occurrence>  
  <occurrence table="ft_t_eadr" id="EADR_1" parentId="ADTP_1" autoCreate="false" multiple="false"> 
    <defaultFields> 
      <field name="ft_t_eadr.start_tms" valueOf="ft_t_issr.start_tms" srcOccurrence="ISSR_1" dataType="DATETIME"/>  
      <field name="ft_t_eadr.end_tms" valueOf="ft_t_issr.end_tms" srcOccurrence="ISSR_1" dataType="DATETIME"/>  
      <field name="ft_t_eadr.id_ctxt_typ" valueOf="ft_t_fins.pref_fins_id_ctxt_typ" dataType="STRING"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_eadr.cntry_phone_cde"/>  
      <field name="ft_t_eadr.area_phone_cde"/>  
      <field name="ft_t_eadr.phone_num_id"/>  
      <field name="ft_t_eadr.phone_num_ext_id"/> 
	  <field name="ft_t_eadr.voice_ind"/>  
      <field name="ft_t_eadr.fax_ind"/>
      <field name="ft_t_eadr.id_ctxt_typ"/>  
      <field name="ft_t_eadr.eadr_val_num"/>  
      <field name="ft_t_eadr.dial_instruc_txt"/>  
      <field name="ft_t_eadr.web_nme"/>  
      <field name="ft_t_eadr.long_elec_addr_txt"/>  
      <field name="ft_t_eadr.end_tms"/>  
      <field name="ft_t_eadr.start_tms"/>  
      <field name="ft_t_eadr.fax_num_id"/>  
      <field name="ft_t_eadr.e_mail_addr_txt"/> 
    </inputFields> 
  </occurrence>  
  <occurrence table="ft_t_eadr" id="EADR_2" parentId="ADTP_3" autoCreate="false" multiple="false"> 
    <defaultFields> 
      <field name="ft_t_eadr.start_tms" valueOf="ft_t_issr.start_tms" srcOccurrence="ISSR_1" dataType="DATETIME"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_eadr.cntry_phone_cde"/>  
      <field name="ft_t_eadr.area_phone_cde"/>  
      <field name="ft_t_eadr.phone_num_id"/>  
      <field name="ft_t_eadr.phone_num_ext_id"/> 
	  <field name="ft_t_eadr.voice_ind"/>  
      <field name="ft_t_eadr.fax_ind"/>
      <field name="ft_t_eadr.id_ctxt_typ"/>  
      <field name="ft_t_eadr.eadr_val_num"/>  
      <field name="ft_t_eadr.web_nme"/> 
    </inputFields> 
  </occurrence>  
  <occurrence table="ft_t_eadr" id="EADR_3" parentId="ADTP_4" autoCreate="false" multiple="false"> 
    <defaultFields> 
      <field name="ft_t_eadr.start_tms" valueOf="ft_t_issr.start_tms" srcOccurrence="ISSR_1" dataType="DATETIME"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_eadr.cntry_phone_cde"/>  
      <field name="ft_t_eadr.area_phone_cde"/>  
      <field name="ft_t_eadr.phone_num_id"/>  
      <field name="ft_t_eadr.phone_num_ext_id"/> 
	  <field name="ft_t_eadr.voice_ind"/>  
      <field name="ft_t_eadr.fax_ind"/>
      <field name="ft_t_eadr.id_ctxt_typ"/>  
      <field name="ft_t_eadr.eadr_val_num"/>  
      <field name="ft_t_eadr.web_nme"/> 
    </inputFields> 
  </occurrence>  
  <occurrence table="ft_t_madr" id="MADR_1" parentId="ADTP_1" autoCreate="false" multiple="false"> 
    <defaultFields> 
      <field name="ft_t_madr.start_tms" valueOf="ft_t_issr.start_tms" srcOccurrence="ISSR_1" dataType="DATETIME"/>  
      <field name="ft_t_madr.start_tms" valueOf="ft_t_issr.end_tms" srcOccurrence="ISSR_1" dataType="DATETIME"/>  
      <field name="ft_t_madr.nls_cde" value="ENGLISH" dataType="STRING"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_madr.nls_cde"/>  
      <field name="ft_t_madr.attention_txt"/>  
      <field name="ft_t_madr.addr_locale_typ"/>  
      <field name="ft_t_madr.addr_ln1_txt"/>  
      <field name="ft_t_madr.addr_ln2_txt"/>  
      <field name="ft_t_madr.addr_ln3_txt"/>  
      <field name="ft_t_madr.addr_ln4_txt"/>  
      <field name="ft_t_madr.city_cde"/>  
      <field name="ft_t_madr.city_cde_typ"/>  
      <field name="ft_t_madr.township_nme"/>  
      <field name="ft_t_madr.cnty_cde"/>  
      <field name="ft_t_madr.cnty_cde_typ"/>  
      <field name="ft_t_madr.cnty_nme"/>  
      <field name="ft_t_madr.city_nme"/>  
      <field name="ft_t_madr.ste_prv_cde"/>  
      <field name="ft_t_madr.ste_prv_nme"/>  
      <field name="ft_t_madr.cntry_cde"/>  
      <field name="ft_t_madr.postal_cde"/>  
      <field name="ft_t_madr.registered_addr_ind"/>  
      <field name="ft_t_madr.continent_cde"/>  
      <field name="ft_t_madr.vanity_city_nme"/>  
      <field name="ft_t_madr.neighborhood_nme"/>  
      <field name="ft_t_madr.cntry_subdiv_cde"/>  
      <field name="ft_t_madr.end_tms"/>  
      <field name="ft_t_madr.start_tms"/>  
      <field name="ft_t_madr.cntry_nme"/> 
    </inputFields> 
  </occurrence>  
  <occurrence table="ft_t_madc" id="MADC_1" parentId="MADR_1" autoCreate="false" multiple="false"> 
    <defaultFields> 
      <field name="ft_t_madc.start_tms" valueOfFunction="CURRTMS" dataType="DATETIME"/>  
      <field name="ft_t_madc.mail_addr_id" valueOf="ft_t_madr.mail_addr_id" srcOccurrence="MADR_1" dataType="STRING"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_madc.house_num_typ"/>  
      <field name="ft_t_madc.street_nme"/>  
      <field name="ft_t_madc.street_typ"/>  
      <field name="ft_t_madc.prefix_street_dir_typ"/>  
      <field name="ft_t_madc.suffix_street_dir_typ"/>  
      <field name="ft_t_madc.route_nme"/>  
      <field name="ft_t_madc.route_num_typ"/>  
      <field name="ft_t_madc.box_nme"/>  
      <field name="ft_t_madc.box_num_typ"/>  
      <field name="ft_t_madc.box_typ"/>  
      <field name="ft_t_madc.complex_nme"/>  
      <field name="ft_t_madc.complex_typ"/>  
      <field name="ft_t_madc.dwelling_nme"/>  
      <field name="ft_t_madc.dwelling_typ"/>  
      <field name="ft_t_madc.dwelling_num_typ"/>  
      <field name="ft_t_madc.official_city_nme"/>  
      <field name="ft_t_madc.parser_city_cde"/>  
      <field name="ft_t_madc.usps_dlv_point_cde"/>  
      <field name="ft_t_madc.usps_dlv_point_code_cde"/>  
      <field name="ft_t_madc.usps_post_office_cde"/>  
      <field name="ft_t_madc.usps_carrier_route_typ"/>  
      <field name="ft_t_madc.usps_dlv_addr_txt"/>  
      <field name="ft_t_madc.usps_zip_plus_4_cde"/>  
      <field name="ft_t_madc.start_tms"/>  
      <field name="ft_t_madc.end_tms"/> 
    </inputFields> 
  </occurrence>  
  <occurrence table="ft_t_madr" id="MADR_2" parentId="ADTP_2" autoCreate="false" multiple="false"> 
    <defaultFields> 
      <field name="ft_t_madr.start_tms" valueOfFunction="CURRTMS" dataType="DATETIME"/> 
    </defaultFields>  
    <inputFields> 
      <!--field name="ft_t_madr.addr_attention_txt"/-->  
      <field name="ft_t_madr.addr_locale_typ"/>  
      <field name="ft_t_madr.addr_ln1_txt"/>  
      <field name="ft_t_madr.addr_ln2_txt"/>  
      <field name="ft_t_madr.addr_ln3_txt"/>  
      <field name="ft_t_madr.addr_ln4_txt"/>  
      <field name="ft_t_madr.township_nme"/>  
      <field name="ft_t_madr.city_nme"/>  
      <field name="ft_t_madr.city_cde"/>  
      <field name="ft_t_madr.city_cde_typ"/>  
      <field name="ft_t_madr.cnty_nme"/>  
      <field name="ft_t_madr.cnty_cde"/>  
      <field name="ft_t_madr.cnty_cde_typ"/>  
      <field name="ft_t_madr.ste_prv_cde"/>  
      <field name="ft_t_madr.postal_cde"/>  
      <field name="ft_t_madr.cntry_cde"/>  
      <field name="ft_t_madr.registered_addr_ind"/>  
      <field name="ft_t_madr.continent_cde"/>  
      <field name="ft_t_madr.cntry_subdiv_cde"/> 
    </inputFields> 
  </occurrence>  
  <occurrence table="ft_t_madr" id="MADR_3" parentId="ADTP_5" autoCreate="false" multiple="false"> 
    <defaultFields> 
      <field name="ft_t_madr.start_tms" valueOfFunction="CURRTMS" dataType="DATETIME"/> 
    </defaultFields>  
    <inputFields> 
      <!--field name="ft_t_madr.addr_attention_txt"/-->  
      <field name="ft_t_madr.addr_locale_typ"/>  
      <field name="ft_t_madr.addr_ln1_txt"/>  
      <field name="ft_t_madr.addr_ln2_txt"/>  
      <field name="ft_t_madr.addr_ln3_txt"/>  
      <field name="ft_t_madr.addr_ln4_txt"/>  
      <field name="ft_t_madr.township_nme"/>  
      <field name="ft_t_madr.city_nme"/>  
      <field name="ft_t_madr.city_cde"/>  
      <field name="ft_t_madr.city_cde_typ"/>  
      <field name="ft_t_madr.cnty_nme"/>  
      <field name="ft_t_madr.cnty_cde"/>  
      <field name="ft_t_madr.cnty_cde_typ"/>  
      <field name="ft_t_madr.ste_prv_cde"/>  
      <field name="ft_t_madr.postal_cde"/>  
      <field name="ft_t_madr.cntry_cde"/>  
      <field name="ft_t_madr.registered_addr_ind"/>  
      <field name="ft_t_madr.continent_cde"/>  
      <field name="ft_t_madr.cntry_subdiv_cde"/> 
    </inputFields> 
  </occurrence>  
  <occurrence table="ft_t_eapr" id="EAPR_1" parentId="EADR_1" autoCreate="false" multiple="false"> 
    <defaultFields> 
      <field name="ft_t_eapr.start_tms" valueOfFunction="CURRTMS" dataType="DATETIME"/>  
      <field name="ft_t_eapr.cntl_cross_ref_oid" valueOf="ft_t_adtp.cntl_cross_ref_oid" srcOccurrence="ADTP_1" dataType="STRING"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_eapr.pref_rank_ind"/> 
    </inputFields> 
  </occurrence>  
  <occurrence table="ft_t_adpu" id="ADPU_1" parentId="ADTP_1" autoCreate="false" multiple="false"> 
    <defaultFields> 
      <field name="ft_t_adpu.start_tms" valueOfFunction="CURRTMS" dataType="DATETIME"/>  
      <field name="ft_t_adpu.addr_purp_id" dataType="STRING" valueOfFunction="OID"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_adpu.addr_purp_typ"/>  
      <field name="ft_t_adpu.addr_purp_desc"/> 
    </inputFields> 
  </occurrence>  
  <occurrence table="ft_t_adpu" id="ADPU_2" parentId="ADTP_2" autoCreate="false" multiple="false"> 
    <defaultFields> 
      <field name="ft_t_adpu.start_tms" valueOfFunction="CURRTMS" dataType="DATETIME"/>  
      <field name="ft_t_adpu.addr_purp_id" dataType="STRING" valueOfFunction="OID"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_adpu.addr_purp_typ"/>  
      <field name="ft_t_adpu.addr_purp_desc"/> 
    </inputFields> 
  </occurrence>  
  <occurrence table="ft_t_adpu" id="ADPU_3" parentId="ADTP_3" autoCreate="false" multiple="false"> 
    <defaultFields> 
      <field name="ft_t_adpu.start_tms" valueOfFunction="CURRTMS" dataType="DATETIME"/>  
      <field name="ft_t_adpu.addr_purp_id" dataType="STRING" valueOfFunction="OID"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_adpu.addr_purp_typ"/>  
      <field name="ft_t_adpu.addr_purp_desc"/> 
    </inputFields> 
  </occurrence>  
  <occurrence table="ft_t_adpu" id="ADPU_4" parentId="ADTP_4" autoCreate="false" multiple="false"> 
    <defaultFields> 
      <field name="ft_t_adpu.start_tms" valueOfFunction="CURRTMS" dataType="DATETIME"/>  
      <field name="ft_t_adpu.addr_purp_id" dataType="STRING" valueOfFunction="OID"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_adpu.addr_purp_typ"/>  
      <field name="ft_t_adpu.addr_purp_desc"/> 
    </inputFields> 
  </occurrence>  
  <occurrence table="ft_t_adpu" id="ADPU_5" parentId="ADTP_5" autoCreate="false" multiple="false"> 
    <defaultFields> 
      <field name="ft_t_adpu.start_tms" valueOfFunction="CURRTMS" dataType="DATETIME"/>  
      <field name="ft_t_adpu.addr_purp_id" dataType="STRING" valueOfFunction="OID"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_adpu.addr_purp_typ"/>  
      <field name="ft_t_adpu.addr_purp_desc"/> 
    </inputFields> 
  </occurrence>  
  <occurrence table="ft_t_addu" id="ADDU_EADR" parentId="EADR_1" autoCreate="false" multiple="false"> 
    <defaultFields> 
      <field name="ft_t_addu.start_tms" valueOfFunction="CURRTMS" dataType="DATETIME"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_addu.prd_start_dy_typ"/>  
      <field name="ft_t_addu.prd_end_dy_typ"/> 
    </inputFields> 
  </occurrence>  
  <occurrence table="ft_t_addu" id="ADDU_MADR" parentId="MADR_1" autoCreate="false" multiple="false"> 
    <defaultFields> 
      <field name="ft_t_addu.start_tms" valueOfFunction="CURRTMS" dataType="DATETIME"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_addu.prd_start_dy_typ"/>  
      <field name="ft_t_addu.prd_end_dy_typ"/> 
    </inputFields> 
  </occurrence>  
  <occurrence table="ft_t_adst" id="ADST_1" parentId="ADTP_1" label="Address Type Usage Statistic"> 
    <defaultFields> 
      <field name="ft_t_adst.start_tms" valueOfFunction="CURRTMS" dataType="DATETIME"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_adst.denom_curr_cde"/>  
      <field name="ft_t_adst.stat_def_id"/>  
      <field name="ft_t_adst.stat_val_dte"/>  
      <field name="ft_t_adst.stat_val_tms"/>  
      <field name="ft_t_adst.stat_val_camt"/>  
      <field name="ft_t_adst.stat_int_val_num"/>  
      <field name="ft_t_adst.stat_char_val_txt"/> 
    </inputFields> 
  </occurrence>  
  <!--  -->  
  <!--validation for if pref record deleted from IRID table end-->  
  <occurrence table="ft_t_crcr" id="CRCR" parentId="CCRF_1" label="CRCR" dbConstraint="CCRFCRCRISSR"> 
    <inputFields> 
      <field name="ft_t_crcr.rl_typ" dataType="STRING"/>  
      <field name="ft_t_crcr.start_tms" dataType="DATETIME"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_crcr.rld_cross_ref_oid" dataType="STRING" srcOccurrence="CCRF_1" valueOf="ft_t_ccrf.cntl_cross_ref_oid"/>  
      <field name="ft_t_crcr.cntl_cross_ref_oid" dataType="STRING" srcOccurrence="CCRF_2" valueOf="ft_t_ccrf.cntl_cross_ref_oid"/>  
      <field name="ft_t_crcr.rl_typ" dataType="STRING"/> 
    </defaultFields> 
  </occurrence>  
  <occurrence table="ft_t_ccrf" id="CCRF_2" parentId="CRCR" label="CCRF_2" dbConstraint="CCRFCRCRCNTC"> 
    <defaultFields> 
      <field name="ft_t_ccrf.cntl_cross_ref_oid" dataType="STRING" valueOfFunction="OID"/> 
    </defaultFields> 
  </occurrence>  
  <occurrence table="ft_t_ircl" id="IRCLFTCA" parentId="ISSR_1" label="FATCA Classifications" multiple="true" autoCreate="false" dbConstraint="ISSRFTCA"> 
    <defaultFields>
      <field name="ft_t_ircl.indus_cl_set_id" dataType="STRING" value="FATCA"/>
    </defaultFields>
  </occurrence> 
<relations><table name="FT_T_IRRT"><relation relatedTable="FT_T_ISSR" name="IRRT_RTNG_HIST" checkService="RATING_SERVICE">
			<condition>
				<sql>#FROM_TABLE#.SYS_EFF_END_TMS IS NULL AND (#FROM_TABLE#.INSTR_ISSR_ID) = (#TO_TABLE#.INSTR_ISSR_ID)</sql>
			</condition>
		</relation></table><table name="FT_T_CRCR"><relation relatedTable="FT_T_CCRF" name="CCRFCRCRISSR">
          <fromColumns>
            <column name="RLD_CROSS_REF_OID"/>
          </fromColumns>
          <toColumns>
            <column name="CNTL_CROSS_REF_OID"/>
          </toColumns>
        </relation></table><table name="FT_T_CRCR"><relation relatedTable="FT_T_CCRF" name="CCRFCRCRCNTC">
			<fromColumns>
				<column name="CNTL_CROSS_REF_OID"/>
			</fromColumns>
			<toColumns>
				<column name="CNTL_CROSS_REF_OID"/>
			</toColumns>
		</relation></table><table name="FT_T_IRCL"><relation relatedTable="FT_T_ISSR" name="ISSRFTCA">
      <fromColumns>
        <column name="INSTR_ISSR_ID"/>
      </fromColumns>
      <toColumns>
        <column name="INSTR_ISSR_ID"/>
      </toColumns>
      <condition>
        <sql>#FROM_TABLE#.INDUS_CL_SET_ID = ''FATCA''</sql>
      </condition>
    </relation></table><table name="FT_T_IRCL"><relation relatedTable="FT_T_ISSR" name="DIST_IRCL">
			<fromColumns>
				<column name="INSTR_ISSR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ISSR_ID"/>
			</toColumns>
			<condition>
				<sql>
				#FROM_TABLE#.issr_clsf_oid in
				(
					select issr_clsf_oid from 
					(
						select issr_clsf_oid, row_number()
						over(partition by instr_issr_id, clsf_oid, cl_value order by clsf_oid, cl_value) cnt
						from ft_t_ircl 
						where (end_tms is null or end_tms  > SYSDATE())
					) where cnt=1
				)
				</sql> 
			</condition>
		</relation></table><table name="FT_T_IRCL"><relation relatedTable="FT_T_IRCL" name="IRCL_IRCL">
			<fromColumns>
				<column name="INSTR_ISSR_ID"/>
				<column name="clsf_oid"/>
				<column name="cl_value"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ISSR_ID"/>
				<column name="clsf_oid"/>
				<column name="cl_value"/>
			</toColumns>
		</relation></table></relations></model>' WHERE modl_id ='ISSR0001' AND modl_typ = 'ISSR';	

UPDATE FT_T_MDDF SET modl_schema ='<?xml version="1.0" encoding="UTF-8"?>
<model xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" id="ISSU0001" extends="BASEISSU" headerInfoXPath="concat(%modelPath:BASEISSU:ft_t_issu.pref_iss_nme%,'' - '',%modelPath:BASEISSU:ft_t_issu.pref_id_ctxt_typ% ,''-'',%modelPath:BASEISSU:ft_t_issu.pref_iss_id%)" xsi:noNamespaceSchemaLocation="../../schemas/Model.xsd" minLevelToEnableChangeApproval="2">  
  <!--<model xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="../../schemas/Model.xsd" >-->  
  <occurrence extends="BASEISSU" id="BASEISSU" table="ft_t_issu" level="1" label="Issue Description/Issue Details"> 
    <validationRules> 
      <rule id="ValidationISID"> 
        <xPath value="boolean((count(/root/issueidentifiers/identifier[@status!=''deleted'' or string-length(@status)=0]) >0)  or (/root/issue[@status!=''new'' or  string-length(@status)=0]))"/>  
        <errorMessage value="At least one Instrument Level Identifier has to be entered."/> 
      </rule>  
      <rule id="ValidationISID_ACTIVITYSTATUS"> 
        <xPath value="boolean((count(/root/issueidentifiers/identifier[@status!=''deleted'' or string-length(@status)=0]) >0 or string(/root/issue/issu.iss_actvy_stat_typ)=''INACTIVE'')  or (/root/issue[@status=''new'' or  string-length(@status)!=0]))"/>  
        <errorMessage value="User has either to mark the Issue activity status(Instrument Status)  as inactive or have at least one identifier active."/> 
      </rule> 
    <rule id="MultiplePrimaryMarkets" pageName="Market"> 
        <xPath value="boolean(count(%modelPath:MKISDEFBISSU%[(string-length(mkis.end_tms) = 0) and (mkis.prim_trd_mkt_ind = ''Y'')])  <  2)"/>  
        <errorMessage value="There should not be multiple primary markets for a single issue."/> 
      </rule></validationRules> 
  <defaultFields> 
      <field name="ft_t_issu.access_auth_typ" dataType="STRING" value="PUBLIC"/>  
      <field name="ft_t_issu.iss_actvy_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_issu.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>   
    </defaultFields><inputFields> 
      <field name="ft_t_issu.iss_typ" level="1" label="Instrument Type"/>  
      <field name="ft_t_issu.denom_curr_cde" level="2"/>  
      <field name="ft_t_issu.sec_form_typ"/>  
      <!--<field name="ft_t_issu.pref_id_ctxt_typ"/>-->  
      <field name="ft_t_issu.instr_issr_id"/>  
      <field name="ft_t_issu.nom_val_unit_camt"/>  
      <!--<field name="ft_t_issu.pref_iss_nme" label="Instrument Name"/>
			<field name="ft_t_issu.pref_iss_id"/>-->  
      <field name="ft_t_issu.distribution_curr_cde"/>  
      <field name="ft_t_issu.iss_tms" label="Instrument Date"/>  
      <field name="ft_t_issu.cl_typ"/> 
    </inputFields></occurrence>  
  <occurrence extends="MKISDEFBISSU" table="ft_t_mkis" id="MKISDEFBISSU" parentId="BASEISSU" autoCreate="false" multiple="true"> 
    <inputFields> 
      <field name="ft_t_mkis.trdng_stat_typ" label="Market Status"/>  
      <field name="ft_t_mkis.actively_traded_ind"/>  
      <field name="ft_t_mkis.norm_mkt_sz_cqty" label="Quote Lot Size"/>  
      <field name="ft_t_mkis.mrgn_sec_ind" label="Marginable"/>  
      <field name="ft_t_mkis.settle_curr_cde"/>  
      <field name="ft_t_mkis.trd_lot_size_cqty"/>  
      <field name="ft_t_mkis.prim_trd_mkt_ind" label="Primary Exchange"/>  
      <field name="ft_t_mkis.prc_curr_cde" label="Quotation Currency"/>  
      <field name="ft_t_mkis.mkt_oid" label="Exchange Name"/>  
      <field name="ft_t_mkis.opol_ind"/> 
    <field name="ft_t_mkis.trdng_curr_cde"/><field name="ft_t_mkis.iss_prc_ut_camt"/><field name="ft_t_mkis.rnd_lot_sz_cqty"/><field name="ft_t_mkis.gu_id" label="Trading Country"/></inputFields>  
    <!--<defaultFields>
			<field name="ft_t_mkis.prim_trd_mkt_ind" dataType="STRING" value="N"/>
		</defaultFields>--> 
  <defaultFields>        
      <!--<field name="ft_t_mkis.trdng_stat_typ" value="ACTIVE" dataType="STRING"/>  
      -->  
      <field name="ft_t_mkis.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_mkis.last_chg_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_mkis.last_chg_usr_id" dataType="STRING" valueOfFunction="APPUSER"/> 
    </defaultFields></occurrence>  
  <occurrence extends="MIXRBISSU" table="ft_t_mixr" id="MIXRBISSU" parentId="MKISDEFBISSU" multiple="true" dbConstraint="MKISMIXR"><defaultFields> 
      <field name="ft_t_mixr.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>        
      <field name="ft_t_mixr.trdng_stat_typ" dataType="STRING" srcOccurrence="MKISDEFBISSU" valueOf="ft_t_mkis.trdng_stat_typ"/>  
      <field name="ft_t_mixr.last_chg_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_mixr.last_chg_usr_id" dataType="STRING" valueOfFunction="APPUSER"/> 
    </defaultFields><inputFields> 
      <field name="ft_t_mixr.end_tms"/> 
    </inputFields></occurrence> 
<occurrence table="ft_t_isde" id="ISDEBISSU" parentId="BASEISSU" label="Issue Description" level="1"> 
    <defaultFields> 
      <field name="ft_t_isde.desc_srce_typ" dataType="STRING" value="INHOUSE"/>  
      <field name="ft_t_isde.nls_cde" dataType="STRING" value="ENGLISH"/>  
      <field name="ft_t_isde.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_isde.iss_nme" label="Instrument Name" level="1"/>  
      <field name="ft_t_isde.start_tms"/>  
      <field name="ft_t_isde.iss_desc" label="Instrument Description"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_isde.desc_usage_typ" dataType="STRING" value="PRIMARY"/> 
    </where> 
  </occurrence><occurrence table="ft_t_isde" id="ISDE_VENDOR" parentId="BASEISSU" label="Issue Description"> 
    <defaultFields> 
      <field name="ft_t_isde.nls_cde" dataType="STRING" value="ENGLISH"/>  
      <field name="ft_t_isde.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_isde.iss_nme" label="Instrument Name"/>  
      <field name="ft_t_isde.start_tms"/>  
      <field name="ft_t_isde.iss_desc" label="Instrument Description"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_isde.desc_srce_typ" dataType="STRING" value="VENDOR"/> 
    </where> 
  </occurrence><occurrence table="ft_t_isid" id="ISID_Iss_level" parentId="BASEISSU" label="Issue Identifiers" multiple="true" dbConstraint="ISSUISID"> 
    <inputFields> 
      <field name="ft_t_isid.iss_id" label="Identifier Value"/>  
      <field name="ft_t_isid.id_ctxt_typ" label="Identifier Type"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <validationRules> 
      <rule id="ISINMarket"> 
        <xPath value="boolean(not(%modelPath:ISID_Iss_level:ft_t_isid.id_ctxt_typ% =''ISIN'' and not(string-length(%modelPath:ISID_Iss_level:ft_t_isid.mkt_oid%) = 0)))"/>  
        <errorMessage value="ISIN identifier cannot have market."/> 
      </rule>  
      <!--<rule id="ISSUTXTTYPNOTSUPPORTED" messageType="WARNING"> 
	   <xPath value="boolean(not(%modelPath:ISID_Iss_level%/intlvlid_supported=''0''))"/>
          <errorMessageXPath value="concat(%modelPath:ISID_Iss_level:ft_t_isid.id_ctxt_typ%,'' is no longer supported as a valid Instrument Level Identifier. Please take necessary action.'')"/>
		 </rule>--> 
    </validationRules> 
  </occurrence><occurrence table="ft_t_isid" id="ISID_MKT_Iss_level_PUB" parentId="BASEISSU" label="Global Market Identifiers pub" multiple="true" dbConstraint="MRKTISIDPUB"> 
    <!-- <where> 
      <field name="ft_t_isid.mkt_oid" dataType="STRING" isNull="false"/> 
    </where> -->  
    <inputFields> 
      <field name="ft_t_isid.iss_id" label="Identifier Value"/>  
      <field name="ft_t_isid.id_ctxt_typ" label="Identifier Type"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <validationRules> 
      <rule id="ISINMarket"> 
        <xPath value="boolean(not(%modelPath:ISID_MKT_Iss_level_PUB:ft_t_isid.id_ctxt_typ% =''ISIN'' and not(string-length(%modelPath:ISID_MKT_Iss_level_PUB:ft_t_isid.mkt_oid%) = 0)))"/>  
        <errorMessage value="ISIN identifier cannot have market."/> 
      </rule> 
    </validationRules> 
  </occurrence><occurrence table="ft_t_isid" id="ISIDBISIN" parentId="BASEISSU" label="Identifiers"> 
    <inputFields> 
      <field name="ft_t_isid.iss_id"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_isid.id_ctxt_typ" dataType="STRING" value="ISIN"/> 
    </where> 
  </occurrence><occurrence table="ft_t_isid" id="ISIDBINH" parentId="BASEISSU" label="Identifiers"> 
    <inputFields> 
      <field name="ft_t_isid.iss_id"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_isid.id_ctxt_typ" dataType="STRING" value="INHOUSE"/> 
    </where> 
  </occurrence><occurrence table="ft_t_isid" id="ISIDBCUS" parentId="BASEISSU" label="Identifiers"> 
    <inputFields> 
      <field name="ft_t_isid.iss_id"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_isid.id_ctxt_typ" dataType="STRING" value="CUSIP"/> 
    </where> 
  </occurrence><occurrence table="ft_t_isid" id="ISIDBCOM" parentId="BASEISSU" label="Identifiers"> 
    <inputFields> 
      <field name="ft_t_isid.iss_id"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_isid.id_ctxt_typ" dataType="STRING" value="COMMON"/> 
    </where> 
  </occurrence><occurrence table="ft_t_isid" id="ISIDVAL" parentId="BASEISSU" label="Identifiers"> 
    <inputFields> 
      <field name="ft_t_isid.iss_id"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_isid.id_ctxt_typ" dataType="STRING" value="VALOREN"/> 
    </where> 
  </occurrence><occurrence table="ft_t_iscl" id="ISCL_INSUBTYP" parentId="BASEISSU" label="Issue Classification" dbConstraint="SUBTYPE" multiple="false"> 
    <where> 
      <field name="ft_t_iscl.clsf_purp_typ" dataType="STRING" value="INSUBTYP"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_iscl.cl_value" label="Instrument Sub-Type"/>  
      <field name="ft_t_iscl.indus_cl_set_id"/>  
      <field name="ft_t_iscl.clsf_oid"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_iscl.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_fnch" id="FNCH_ALL" parentId="BASEISSU" label="Fund Characteristics"> 
    <defaultFields> 
      <!--<field name="ft_t_fnch.chars_eff_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>-->     
    </defaultFields> 
  </occurrence><occurrence table="ft_t_iscm" id="ISCMBISSU" parentId="BASEISSU" label="Comments"> 
    <defaultFields> 
      <field name="ft_t_iscm.cmnt_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_iscm.ln_num" dataType="NUMBER" value="1"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_iscm.cmnt_txt"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_iscm.cmnt_reas_typ" dataType="STRING" value="COMMENT"/> 
    </where> 
  </occurrence><occurrence table="ft_t_isrt" id="ISRTBISSU" parentId="BASEISSU" multiple="true" label="Rating"> 
    <inputFields> 
      <field name="ft_t_isrt.rtng_curr_typ"/>  
      <field name="ft_t_isrt.rtng_purp_typ"/>  
      <field name="ft_t_isrt.rtng_set_oid"/>  
      <field name="ft_t_isrt.rtng_cde"/>  
      <field name="ft_t_isrt.start_tms"/>  
      <field name="ft_t_isrt.rtng_eff_tms"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isrt.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>    
    </defaultFields> 
  </occurrence><occurrence table="ft_t_rgch" id="RGCHBISSU" parentId="BASEISSU" label="Regulatory Information"> 
    <inputFields> 
      <field name="ft_t_rgch.gu_id"/>  
      <field name="ft_t_rgch.gu_cnt"/>  
      <field name="ft_t_rgch.gu_typ"/>  
      <field name="ft_t_rgch.isma_regulated_ind"/>  
      <field name="ft_t_rgch.rule_144a_ind"/>  
      <field name="ft_t_rgch.reg_s_ind"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_rgch.start_tms" dataType="DATETIME" srcOccurrence="BASEISSU" valueOf="ft_t_issu.start_tms"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_mkis" id="MKISPMBISSU" parentId="BASEISSU" multiple="false" label="Market Details"> 
    <inputFields> 
      <field name="ft_t_mkis.mkt_oid"/>  
      <field name="ft_t_mkis.iss_prc_ut_camt"/>  
      <field name="ft_t_mkis.rnd_lot_sz_cqty"/>  
      <field name="ft_t_mkis.trdng_curr_cde"/>  
      <field name="ft_t_mkis.trdng_stat_typ"/> 
    </inputFields>  
    <defaultFields> 
      <!--<field name="ft_t_mkis.trdng_stat_typ" dataType="STRING" value="ACTIVE"/>  
      -->  
      <field name="ft_t_mkis.prc_ut_meas_typ" dataType="STRING" value="NOMINAL"/>  
      <!--<field name="ft_t_mkis.mkt_iss_oid" dataType="STRING" valueOfFunction="OID" uiOnly="true"/> 
      --> 
    </defaultFields>  
    <where> 
      <field name="ft_t_mkis.prim_trd_mkt_ind" dataType="STRING" value="Y"/> 
    </where>  
    <validationRules> 
      <rule id="Warning" messageType="WARNING"> 
        <xPath value="boolean(string-length(%modelPath:MKISPMBISSU:ft_t_mkis.end_tms%)= 0 or string-length(%modelPath:MKISPMBISSU:ft_t_mkis.end_tms%) <  SYSDATE())"/>  
        <errorMessage value="Primary Market is end dated"/> 
      </rule> 
    </validationRules> 
  </occurrence><occurrence table="ft_t_mixr" id="MIXR_PRIM" parentId="MKISPMBISSU" label=" Market Issue Cross Reference ((Primary)" dbConstraint="MKISMIXR"> 
    <defaultFields> 
      <field name="ft_t_mixr.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
      <field name="ft_t_mixr.trdng_stat_typ" dataType="STRING" srcOccurrence="MKISPMBISSU" valueOf="ft_t_mkis.trdng_stat_typ"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_isid" id="ISID_TIC_PM_PUB" parentId="MIXR_PRIM" label="Issue Identifier-Ticker" dbConstraint="MIXRISIDPUB"> 
    <where> 
      <field name="ft_t_isid.id_ctxt_typ" dataType="STRING" value="TICKER"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_isid.iss_id" label="Primary Ticker"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isid.isid_oid" dataType="STRING" srcOccurrence="MIXR_PRIM" valueOf="ft_t_mixr.isid_oid"/>  
      <field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_isid.mkt_oid" dataType="STRING" srcOccurrence="MKISPMBISSU" valueOf="ft_t_mkis.mkt_oid"/>  
      <field name="ft_t_isid.instr_id" dataType="STRING" srcOccurrence="BASEISSU" valueOf="ft_t_issu.instr_id"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_isxr" id="BISSU_ISXR_ISID" parentId="LISTISID_BISSU" multiple="true" autoDelete="false"> 
    <where> 
      <field name="ft_t_isxr.isid_oid" dataType="STRING" srcOccurrence="LISTISID_BISSU" valueOf="ft_t_isid.isid_oid"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_isxr.last_chg_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_isxr.last_chg_usr_id" dataType="STRING" valueOfFunction="APPUSER"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_isxr.isxr_rel_purp_typ"/>  
      <field name="ft_t_isxr.start_tms"/>  
      <field name="ft_t_isxr.end_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_must" id="MUST_MICOPOL" parentId="MKISDEFBISSU" autoDelete="false"> 
    <where> 
      <field name="ft_t_must.stat_def_id" dataType="STRING" value="MICOPOL"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_must.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_must.stat_char_val_txt" label="OPOL"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_must" id="MUST_CDREXCH" parentId="MKISDEFBISSU" autoDelete="false"> 
    <where> 
      <field name="ft_t_must.stat_def_id" dataType="STRING" value="CDREXCH"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_must.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_must.stat_char_val_txt" label="Exchange Calendar"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_ispc" id="ISPCBISSU" parentId="BASEISSU" label="Issue Price Details"> 
    <inputFields> 
      <field name="ft_t_ispc.prc_typ"/>  
      <field name="ft_t_ispc.prc_srce_typ"/>  
      <field name="ft_t_ispc.prc_tms"/>  
      <field name="ft_t_ispc.unit_cprc"/>  
      <field name="ft_t_ispc.prc_curr_cde"/> 
    </inputFields>  
    <defaultFields> 
      <!--      <field name="ft_t_ispc.prc_curr_cde" dataType="STRING" srcOccurrence="BASEISSU" valueOf="ft_t_issu.denom_curr_cde"/>  -->  
      <field name="ft_t_ispc.prc_qt_meth_typ" dataType="STRING" value="1"/>  
      <field name="ft_t_ispc.prc_valid_typ" dataType="STRING" value="VALID"/>  
      <field name="ft_t_ispc.prcng_meth_typ" dataType="STRING" value="1"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_iedf" id="IEDF_DIV_or_INT" parentId="BASEISSU" label="Income Event Definition(Dividend/Interest)"> 
    <defaultFields> 
      <field name="ft_t_iedf.verif_ind" dataType="STRING" value="Y"/>  
      <field name="ft_t_iedf.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_iedf.first_py_tms" label="First Payment Date"/>  
      <field name="ft_t_iedf.days_mth_bas_typ"/>  
      <field name="ft_t_iedf.days_yr_bas_typ"/>  
      <field name="ft_t_iedf.calc_meth_typ" label="Calculation Method"/>  
      <field name="ft_t_iedf.py_dte_fq_qty" label="Payable Date Frequency"/>  
      <field name="ft_t_iedf.py_dte_fq_dy_typ"/>  
      <field name="ft_t_iedf.py_dte_fq_sp_typ"/>  
      <field name="ft_t_iedf.start_tms"/>  
      <field name="ft_t_iedf.end_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_ievp" id="IEVP_DIV_or_INT" parentId="IEDF_DIV_or_INT" label="Income Event Participant(Dividend/Interest)"> 
    <defaultFields> 
      <field name="ft_t_ievp.prt_purp_typ" dataType="STRING" value="PMTDTLS"/>  
      <field name="ft_t_ievp.start_tms" dataType="DATETIME" srcOccurrence="IEDF_DIV_or_INT" valueOf="ft_t_iedf.start_tms"/> 
    </defaultFields>  
    <!--<validationRules>
			<rule id="Unique_IPDF">
				<xPath value="is-unique(%modelPath:IPDF_DIV_or_INT%, &quot;concat(ipdf.pay_curr_cde, substring((ipdf.start_tms), 1, 10))&quot;)"/>
				<errorMessage value="Payment currency and Start Date/Time combination should be unique in Income Payments of Dividend/Interest Section"/>	
			</rule>
		</validationRules>--> 
  </occurrence><occurrence table="ft_t_ipdf" id="IPDF_DIV_or_INT" parentId="IEVP_DIV_or_INT" multiple="true" label="Income Payment Definition(Dividend/Interest)"> 
    <inputFields> 
      <field name="ft_t_ipdf.start_tms"/>  
      <field name="ft_t_ipdf.ev_rate_typ"/>  
      <field name="ft_t_ipdf.ev_crte"/>  
      <field name="ft_t_ipdf.iss_part_rl_typ"/>  
      <field name="ft_t_ipdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ipdf.pay_curr_cde"/>  
      <field name="ft_t_ipdf.end_tms"/> 
    </inputFields>  
    <defaultFields/> 
  </occurrence><occurrence table="ft_t_pedf" id="PEDF_CALL_or_SINK" parentId="BASEISSU" label="Principal Event Definition(Call/Sink)" autoDelete="false"> 
    <inputFields> 
      <field name="ft_t_pedf.days_mth_bas_typ"/>  
      <field name="ft_t_pedf.days_yr_bas_typ"/>  
      <field name="ft_t_pedf.end_tms"/>  
      <field name="ft_t_pedf.first_py_tms" label="First Payment Date"/>  
      <field name="ft_t_pedf.py_dte_fq_qty" label="Payable Date Frequency"/>  
      <field name="ft_t_pedf.py_dte_fq_dy_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_sp_typ"/>  
      <field name="ft_t_pedf.start_tms"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_pedf.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_pedf.verif_ind" dataType="STRING" value="Y"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_pevp" id="PEVP_CALL_or_SINK" parentId="PEDF_CALL_or_SINK" label="Principal Event Participant(Call/Sink)" autoDelete="false"> 
    <defaultFields> 
      <field name="ft_t_pevp.start_tms" dataType="DATETIME" srcOccurrence="PEDF_CALL_or_SINK" valueOf="ft_t_pedf.start_tms" keepInSync="true"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_pevp.prt_purp_typ" dataType="STRING" value="SNKFDRED"/> 
    </where>  
    <validationRules> 
      <rule id="Unique_PPDF_Call_or_Sink"> 
        <xPath value="is-unique(%modelPath:PPDF_CALL_or_SINK%, &quot;concat(ppdf.pay_curr_cde,substring((ppdf.start_tms), 1, 10))&quot;)"/>  
        <!--        <xPath value="is-unique(%modelPath:PPDF_CALL_or_SINK%,&quot;substring((ppdf.start_tms), 1,10)&quot;)"/>  -->  
        <errorMessage value="Payment currency and Start Date/Time combination should be unique in Principal Payments of Call/Sink Section"/> 
      </rule> 
    </validationRules> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_CALL_or_SINK" parentId="PEVP_CALL_or_SINK" multiple="true" label="Principal Payment Definition(Call/Sink)" autoDelete="false"> 
    <inputFields> 
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.start_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/> 
    </inputFields>  
    <defaultFields/> 
  </occurrence><occurrence table="ft_t_pedf" id="PEDF_PUT_or_FACTOR" parentId="BASEISSU" label="Principal Event Defitnition(Put/Factor)" autoDelete="false"> 
    <inputFields> 
      <field name="ft_t_pedf.days_mth_bas_typ"/>  
      <field name="ft_t_pedf.days_yr_bas_typ"/>  
      <field name="ft_t_pedf.end_tms"/>  
      <field name="ft_t_pedf.first_py_tms" label="First Payment Date"/>  
      <field name="ft_t_pedf.py_dte_fq_dy_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_sp_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_qty" label="Payable Date Frequency"/>  
      <field name="ft_t_pedf.start_tms"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_pedf.verif_ind" dataType="STRING" value="Y"/>  
      <!--<field name="ft_t_pedf.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>--> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_PUT_or_FACTOR" parentId="PEVP_PUT_or_FACTOR" multiple="true" label="Principal Payment Definition(Factor)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_pedf" id="PEDF_PUT" parentId="BASEISSU" label="Principal Event Defitnition(Put)" autoDelete="false"> 
    <inputFields> 
      <field name="ft_t_pedf.days_mth_bas_typ"/>  
      <field name="ft_t_pedf.days_yr_bas_typ"/>  
      <field name="ft_t_pedf.end_tms"/>  
      <field name="ft_t_pedf.first_py_tms" label="First Payment Date"/>  
      <field name="ft_t_pedf.py_dte_fq_dy_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_sp_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_qty" label="Payable Date Frequency"/>  
      <field name="ft_t_pedf.start_tms"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_pedf.verif_ind" dataType="STRING" value="Y"/>  
      <!--<field name="ft_t_pedf.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>--> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_PUT" parentId="PEVP_PUT" multiple="true" label="Principal Payment Definition(Put)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_NEXTPUT" parentId="PEVP_NEXTPUT" multiple="true" label="Principal Payment Definition(NextPut)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_NXTPARPT" parentId="PEVP_NXTPARPT" multiple="true" label="Principal Payment Definition(NxtParpt)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_PUTPROV" parentId="PEVP_PUTPROV" multiple="true" label="Principal Payment Definition(PutProv)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_PUTSCHED" parentId="PEVP_PUTSCHED" multiple="true" label="Principal Payment Definition(PutSched)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_pedf" id="PEDF_CALLABLE" parentId="BASEISSU" label="Principal Event Defitnition(Call)" autoDelete="false"> 
    <inputFields> 
      <field name="ft_t_pedf.days_mth_bas_typ"/>  
      <field name="ft_t_pedf.days_yr_bas_typ"/>  
      <field name="ft_t_pedf.end_tms"/>  
      <field name="ft_t_pedf.first_py_tms" label="First Payment Date"/>  
      <field name="ft_t_pedf.py_dte_fq_dy_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_sp_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_qty" label="Payable Date Frequency"/>  
      <field name="ft_t_pedf.start_tms"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_pedf.verif_ind" dataType="STRING" value="Y"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_CALLABLE" parentId="PEVP_CALLABLE" multiple="true" label="Principal Payment Definition(Callable)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_pedf" id="PEDF_CALLED" parentId="BASEISSU" label="Principal Event Defitnition(Call)" autoDelete="false"> 
    <inputFields> 
      <field name="ft_t_pedf.days_mth_bas_typ"/>  
      <field name="ft_t_pedf.days_yr_bas_typ"/>  
      <field name="ft_t_pedf.end_tms"/>  
      <field name="ft_t_pedf.first_py_tms" label="First Payment Date"/>  
      <field name="ft_t_pedf.py_dte_fq_dy_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_sp_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_qty" label="Payable Date Frequency"/>  
      <field name="ft_t_pedf.start_tms"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_pedf.verif_ind" dataType="STRING" value="Y"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_CALLED" parentId="PEVP_CALLED" multiple="true" label="Principal Payment Definition(Called)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_pedf" id="PEDF_CALATPAR" parentId="BASEISSU" label="Principal Event Defitnition(Call)" autoDelete="false"> 
    <inputFields> 
      <field name="ft_t_pedf.days_mth_bas_typ"/>  
      <field name="ft_t_pedf.days_yr_bas_typ"/>  
      <field name="ft_t_pedf.end_tms"/>  
      <field name="ft_t_pedf.first_py_tms" label="First Payment Date"/>  
      <field name="ft_t_pedf.py_dte_fq_dy_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_sp_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_qty" label="Payable Date Frequency"/>  
      <field name="ft_t_pedf.start_tms"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_pedf.verif_ind" dataType="STRING" value="Y"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_CALATPAR" parentId="PEVP_CALATPAR" multiple="true" label="Principal Payment Definition(Calatpar)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_pedf" id="PEDF_CALATPRE" parentId="BASEISSU" label="Principal Event Defitnition(Call)" autoDelete="false"> 
    <inputFields> 
      <field name="ft_t_pedf.days_mth_bas_typ"/>  
      <field name="ft_t_pedf.days_yr_bas_typ"/>  
      <field name="ft_t_pedf.end_tms"/>  
      <field name="ft_t_pedf.first_py_tms" label="First Payment Date"/>  
      <field name="ft_t_pedf.py_dte_fq_dy_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_sp_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_qty" label="Payable Date Frequency"/>  
      <field name="ft_t_pedf.start_tms"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_pedf.verif_ind" dataType="STRING" value="Y"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_CALATPRE" parentId="PEVP_CALATPRE" multiple="true" label="Principal Payment Definition(Calatpre)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_isgp" id="ISGP_UNIV" parentId="BASEISSU" label="Issue Group Participant" multiple="true" dbConstraint="isgpuniv"> 
    <defaultFields> 
      <field name="ft_t_isgp.prt_purp_typ" dataType="STRING" value="MANUAL"/>  
      <field name="ft_t_isgp.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_isgp.prnt_iss_grp_oid"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_cucn" id="CUCN" parentId="BASEISSU"> 
    <defaultFields> 
      <field name="ft_t_cucn.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_cucf" id="CUCF" parentId="CUCN"> 
    <defaultFields> 
      <field name="ft_t_cucf.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_cucf.instr_id" dataType="STRING" valueOfXPath="/root/issue/issu.instr_id"/> 
    </defaultFields> 
  </occurrence><relations><table name="FT_T_MKIS"><relation relatedTable="FT_T_ISSU" name="ISSUMKIS">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<condition>
				<sql>(#FROM_TABLE#.prim_trd_mkt_ind=''Y'' or (select count(*) from ft_t_mkis where ft_t_mkis.instr_id=#TO_TABLE#.instr_id and (ft_t_mkis.end_tms is null or ft_t_mkis.end_tms  >= SYSDATE()))=1)</sql>
			</condition>
		</relation></table><table name="FT_T_MIXR"><relation relatedTable="FT_T_MKIS" name="MKISMIXR">
			<fromColumns>
				<column name="MKT_ISS_OID"/>
			</fromColumns>
			<toColumns>
				<column name="MKT_ISS_OID"/>
			</toColumns>
		</relation></table><table name="FT_T_ISID"><relation relatedTable="FT_T_ISSU" name="ISSUISID">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<condition>
					<sql>not exists (select 1 from ft_t_mixr mixr where (mixr.end_tms is null or mixr.end_tms  > SYSDATE()) and #FROM_TABLE#.ISID_OID=mixr.isid_oid) and #FROM_TABLE#.MKT_OID is null</sql>
				</condition>
		</relation></table><table name="FT_T_ISID"><relation relatedTable="FT_T_ISSU" name="MRKTISID">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<condition>
				<sql>not exists (select 1 from ft_t_mixr mixr where (mixr.end_tms is null or mixr.end_tms  > SYSDATE()) and #FROM_TABLE#.ISID_OID=mixr.isid_oid) and #FROM_TABLE#.MKT_OID is not null</sql>
		</condition>
		</relation></table><table name="FT_T_ISID"><relation relatedTable="FT_T_ISSU" name="MRKTISIDPUB">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<condition>			
				<sql>not exists (select 1 from ft_t_mixr mixr where (mixr.end_tms is null or mixr.end_tms  > SYSDATE()) and #FROM_TABLE#.ISID_OID=mixr.isid_oid) and #FROM_TABLE#.MKT_OID is not null</sql>			
			</condition>
		</relation></table><table name="FT_T_ISCL"><relation relatedTable="FT_T_ISSU" name="SUBTYPE">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<condition>
				<sql>#FROM_TABLE#.indus_cl_set_id in (''TKISSTYP'',''BBSECTYP'',''FTISSTYP'',''ASSETCLS'')</sql>
			</condition>
		</relation></table><table name="FT_T_ISCL"><relation relatedTable="FT_T_ISSU" name="SUBTYPE">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<condition>
				<sql>#FROM_TABLE#.indus_cl_set_id in (''TKISSTYP'',''BBSECTYP'',''FTISSTYP'',''ASSETCLS'')</sql>
			</condition>
		</relation></table><table name="FT_T_ISLL"><relation relatedTable="FT_T_ISSU" name="isllissu">
            <fromColumns>
                <column name="instr_id"/>
            </fromColumns>
            <toColumns>
                <column name="instr_id"/>
            </toColumns>
            <condition>
                <sql>#FROM_TABLE#.last_chg_tms in (SELECT max(last_chg_tms) FROM ft_t_isll where instr_id = #TO_TABLE#.instr_id)</sql>
            </condition>
        </relation></table><table name="FT_T_RIST"><relation relatedTable="FT_T_ISSU" name="RIST_INSTR">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
		</relation></table><table name="FT_T_LMST"><relation relatedTable="FT_T_ISSU" name="latestlmst">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<condition>
				<sql>#FROM_TABLE#.last_chg_tms = (SELECT MAX (last_chg_tms) FROM ft_t_lmst WHERE ft_t_lmst.instr_id = #TO_TABLE#.instr_id)</sql>
			</condition>
		</relation></table><table name="FT_T_ISGU"><relation relatedTable="FT_T_ISSU" name="ISSUISGU">
            <fromColumns>
                <column name="INSTR_ID"/>
            </fromColumns>
            <toColumns>
                <column name="INSTR_ID"/>
            </toColumns>
            <condition>
                <sql>#FROM_TABLE#.gu_typ =''COUNTRY''</sql>
            </condition>
        </relation></table><table name="FT_T_AISR"><relation relatedTable="FT_T_ISSU" name="MyAccountIssueRole">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<condition>
				<sql>#FROM_TABLE#.ACCT_ISSU_RL_TYP is not null</sql>
			</condition>
		</relation></table><table name="FT_T_AISR"><relation relatedTable="FT_T_ISSU" name="MyIssueAccountRole">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<!--Commented as AISR.ISSU_ACCT_RL_TYP has been removed (GT 37778)-->
			<!--<condition>
        <sql>#FROM_TABLE#.ISSU_ACCT_RL_TYP is not null</sql>
      </condition>-->
		</relation></table><table name="FT_T_ISRT"><relation relatedTable="FT_T_ISSU" name="RTNG_HIST" checkService="RATING_SERVICE">
			<condition>
				<sql>#FROM_TABLE#.SYS_EFF_END_TMS IS NULL AND (#FROM_TABLE#.INSTR_ID) = (#TO_TABLE#.INSTR_ID)</sql>
			</condition>
		</relation></table><table name="FT_T_MIXR"><relation relatedTable="FT_T_ISID" name="MIXRISID">
			<fromColumns>
				<column name="ISID_OID"/>
			</fromColumns>
			<toColumns>
				<column name="ISID_OID"/>
			</toColumns>
			<condition>
        <sql>exists (select 1 from FT_T_MIXR mixr where (mixr.end_tms IS NULL or mixr.end_tms  > p_asOfDate) and #TO_TABLE#.ISID_OID=mixr.isid_oid)</sql>
			</condition>
		</relation></table><table name="FT_T_MIXR"><relation relatedTable="FT_T_ISID" name="MIXRISIDPUB">
			<fromColumns>
				<column name="ISID_OID"/>
			</fromColumns>
			<toColumns>
				<column name="ISID_OID"/>
			</toColumns>
			<condition>				
				<sql>exists (select 1 from FT_T_MIXR mixr where (mixr.end_tms IS NULL or mixr.end_tms  > SYSDATE()) and #TO_TABLE#.ISID_OID=mixr.isid_oid)</sql>				
			</condition>
		</relation></table><table name="FT_T_MKIS"><relation relatedTable="FT_T_ISPC" name="LATESTPRICE">
			<fromColumns>
				<column name="INSTR_ID"/>
				<column name="MKT_OID"/>
				<column name="PRC_CURR_CDE"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
				<column name="MKT_OID"/>
				<column name="PRC_CURR_CDE"/>
			</toColumns>
			<condition>
				<sql>#TO_TABLE#.prc_tms = 
             (select max(prc_tms)
                from ft_t_ispc maxprc
               where maxprc.instr_id = #TO_TABLE#.instr_id
                 and maxprc.mkt_oid = #TO_TABLE#.mkt_oid
                 and maxprc.prc_curr_cde = #TO_TABLE#.prc_curr_cde)</sql>
			</condition>
		</relation></table><table name="FT_T_MUST"><relation relatedTable="FT_T_MKIS" name="mkismust">
            <fromColumns>
                <column name="MKT_ISS_OID"/>
            </fromColumns>
            <toColumns>
                <column name="MKT_ISS_OID"/>
            </toColumns>
        </relation></table><table name="FT_T_ISPC"><relation name="latestclosingprice" relatedTable="FT_T_ISSU">
            <fromColumns>
                <column name="INSTR_ID"/>
            </fromColumns>
            <toColumns>
                <column name="INSTR_ID"/>
            </toColumns>
            <condition>
                <sql>(#FROM_TABLE#.last_chg_tms
                      , #FROM_TABLE#.prc_tms
                      , COALESCE (#FROM_TABLE#.data_src_id, ''999'')
                      , #FROM_TABLE#.prc_srce_typ
                      , #FROM_TABLE#.prc_typ
                      || COALESCE (TRIM (#FROM_TABLE#.addnl_prc_qual_typ), ''999'')) IN
                            (  SELECT   MAX (last_chg_tms)
                                        , MAX (prc_tms)
                                        , COALESCE (data_src_id, ''999'')
                                        , prc_srce_typ
                                        , prc_typ
                                        || COALESCE (TRIM (addnl_prc_qual_typ), ''999'')
                                 FROM   ft_t_ispc ispc1
                                WHERE   instr_id = #FROM_TABLE#.instr_id
                                AND trim(prc_typ) || trim(addnl_prc_qual_typ) IN (''BID2171'',''ASKED2124'',''ASKED1'',''0031'',''0033'',''ASKED3'')      
                             GROUP BY   prc_tms,
                                        data_src_id,
                                        prc_srce_typ,
                                        prc_typ,
                                        addnl_prc_qual_typ,
                                        prc_qt_meth_typ)</sql>
            </condition>
        </relation></table><table name="FT_T_IEDF"><relation relatedTable="FT_T_ISSU" name="issuiedfinterest">
            <fromColumns>
                <column name="instr_id"/>
            </fromColumns>
            <toColumns>
                <column name="instr_id"/>
            </toColumns>
            <condition>
                <sql>#FROM_TABLE#.ev_typ IN (''INTEREST'')</sql>
            </condition>
        </relation></table><table name="FT_T_IEVP"><relation relatedTable="FT_T_IEDF" name="iedfievpestdiv">
            <fromColumns>
                <column name="INC_EV_DEF_ID"/>
            </fromColumns>
            <toColumns>
                <column name="INC_EV_DEF_ID"/>
            </toColumns>
            <condition>
                <sql>#FROM_TABLE#.prt_purp_typ IN (''ESTIMATE'',''DIVIDEND'')</sql>
            </condition>
        </relation></table><table name="FT_T_IPDF"><relation relatedTable="FT_T_IEVP" name="ipdfbasecpi">
            <fromColumns>
                <column name="INC_EV_PRT_ID"/>
            </fromColumns>
            <toColumns>
                <column name="INC_EV_PRT_ID"/>
            </toColumns>
            <condition>
                <sql>#FROM_TABLE#.rate_fixing_base_crte is not null and #FROM_TABLE#.start_tms = (select max(start_tms) from ft_t_ipdf where inc_ev_prt_id=#FROM_TABLE#.inc_ev_prt_id and rate_fixing_base_crte is not null)</sql>
            </condition>
        </relation></table><table name="FT_T_PEDF"><relation relatedTable="FT_T_ISSU" name="pedffactorissu">
            <fromColumns>
                <column name="instr_id"/>
            </fromColumns>
            <toColumns>
                <column name="instr_id"/>
            </toColumns>
            <condition>
                <sql>#FROM_TABLE#.ev_typ IN (''FACTOR'')</sql>
            </condition>
        </relation></table><table name="FT_T_PEVP"><relation relatedTable="FT_T_PEDF" name="pevpfactorissu">
            <fromColumns>
                <column name="prin_ev_def_id"/>
            </fromColumns>
            <toColumns>
                <column name="prin_ev_def_id"/>
            </toColumns>
            <condition>
                <sql>#FROM_TABLE#.prt_purp_typ IN (''FACTOR'')</sql>
            </condition>
        </relation></table><table name="FT_T_PPDF"><relation relatedTable="FT_T_PEVP" name="ppdf_pevp">
            <fromColumns>
                <column name="PRIN_EV_PRT_ID"/>
            </fromColumns>
            <toColumns>
                <column name="PRIN_EV_PRT_ID"/>
            </toColumns>
            <condition>
                <sql>ROWNUM=1</sql>
            </condition>
        </relation></table><table name="FT_T_IRCL"><relation relatedTable="FT_T_ISSU" name="IRCL_ISSU">
			<fromColumns>
				<column name="INSTR_ISSR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ISSR_ID"/>
			</toColumns>
			<condition>
				<sql>(#FROM_TABLE#.instr_id = #TO_TABLE#.instr_id or #FROM_TABLE#.instr_id is null)</sql> 
			</condition>
		</relation></table><table name="FT_T_ISGP"><relation relatedTable="FT_T_ISSU" name="isgpuniv">
			<fromColumns>
				<column name="instr_id"/>
			</fromColumns>
			<toColumns>
				<column name="instr_id"/>
			</toColumns>
			<condition>
				<sql>TRIM(#FROM_TABLE#.PRNT_ISS_GRP_OID) in (SELECT TRIM(ISS_GRP_OID) FROM FT_T_ISGR WHERE GRP_PURP_TYP=''UNIVERSE'')</sql>
			</condition>
		</relation></table></relations></model>' WHERE modl_id ='ISSU0001' AND modl_typ = 'ISSU';


UPDATE FT_T_MDDF SET modl_schema ='<?xml version="1.0" encoding="UTF-8"?>
<model xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="../../schemas/Model.xsd" id="LAGRCEA" headerInfoXPath="concat(''Legal Agreement - '',/root/lagr.agrmnt_desc)">  
  <occurrence id="LAGRCEA" table="ft_t_lagr"> 
    <inputFields> 
      <field name="ft_t_lagr.agrmnt_typ" dataType="STRING"/>  
      <field name="ft_t_lagr.agrmnt_amend_dte" dataType="DATETIME"/>  
      <field name="ft_t_lagr.agrmnt_desc" dataType="STRING"/>  
      <field name="ft_t_lagr.agrmnt_loc_txt" dataType="STRING"/>  
      <field name="ft_t_lagr.agrmnt_sign_dte" dataType="DATETIME"/>  
      <field name="ft_t_lagr.agrmnt_stat_typ" dataType="STRING"/>  
      <field name="ft_t_lagr.agrmnt_amend_desc" dataType="STRING"/>  
      <field name="ft_t_lagr.agrmnt_aprvl_dte" dataType="DATETIME"/>  
      <field name="ft_t_lagr.agrmnt_cmnt_txt" dataType="STRING"/>  
      <field name="ft_t_lagr.agrmnt_negotn_instruc_dte" dataType="DATETIME" label="agrmnt_instrcn_dte"/>  
      <field name="ft_t_lagr.agrmnt_termintn_dte" dataType="DATETIME"/>  
      <field name="ft_t_lagr.agrmnt_version_id" dataType="NUMBER" label="agrmnt_version"/>  
      <field name="ft_t_lagr.ev_dflt_curr_cde" dataType="STRING"/>  
      <field name="ft_t_lagr.leg_juris_nme" dataType="STRING"/>  
      <field name="ft_t_lagr.legal_opinion_ind" dataType="STRING"/>
      <field name="ft_t_lagr.org_id" dataType="STRING"/>  
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_lagr.agrmnt_purp_typ" dataType="STRING" value="LGAGTCEA"/>  
      <field name="ft_t_lagr.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_lagr.created_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_lagr.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_lagr.leg_agrmnt_id" dataType="STRING" valueOfFunction="OID"/>  
    </defaultFields>  
    <validationRules> 
      <rule id="Agreement_signed" pageName="MHILAGR_SpeedScreen"> 
        <xPath value="not(boolean(string(/root[lagr.agrmnt_stat_typ[string(@status)=''modified'' and string(@original)=''SIGNED'' ]]/lagr.agrmnt_stat_typ/text())=''INNEGTION''))"/>  
        <errorMessage value="Clearing Execution Agreement Status can not be changed from &quot;Signed&quot; to &quot;In Negotiation&quot;"/> 
      </rule>  
      <rule id="Agreement_signed1" pageName="MHILAGR_SpeedScreen"> 
        <xPath value="not(boolean(string(/root[lagr.agrmnt_stat_typ[string(@status)=''modified'' and string(@original)=''SIGNED'' ]]/lagr.agrmnt_stat_typ/text())=''NEGONHLD''))"/>  
        <errorMessage value="Clearing Execution Agreement Status can not be changed from &quot;Signed&quot; to &quot;Negotiation On Hold&quot;"/> 
      </rule>  
      <rule id="CounterpartyBranch"> 
        <xPath value="not(count(/root/FinancialInstitutionAgreementRoles/FinancialInstitutionAgreementRole[flar.rl_typ=''CPTY'']/FTTLACVs/FTTLACV/lacv.dlr_br_nme)=0 and /root/lagr.agrmnt_stat_typ=''SIGNED'')"/>  
        <errorMessage value="Counterparty branch is not populated but legal agreement is ''Signed''. Please populate counterparty branch location."/> 
      </rule>  
      <rule id="MizuhoBranch"> 
        <xPath value="not(count(/root/FinancialInstitutionAgreementRoles/FinancialInstitutionAgreementRole[flar.rl_typ=''MIZUHO'']/FTTLACVs/FTTLACV/lacv.dlr_br_nme)=0 and /root/lagr.agrmnt_stat_typ=''SIGNED'')"/>  
        <errorMessage value="Mizuho branch is not populated but legal agreement is ''Signed''. Please populate counterparty branch location."/> 
      </rule> 
    </validationRules> 
  </occurrence>  
  <occurrence table="ft_t_flar" id="FLARMHI" parentId="LAGRCEA" autoCreate="true"> 
    <defaultFields> 
      <field name="ft_t_flar.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_flar.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
    </defaultFields>  
    <where> 
      <field name="ft_t_flar.rl_typ" dataType="STRING" value="MIZUHO"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_flar.rl_desc" dataType="STRING"/> 
      <field name="ft_t_flar.inst_mnem" dataType="STRING"/> 
    </inputFields> 
  </occurrence>  
  <occurrence table="ft_t_flar" id="FLARCPTY" parentId="LAGRCEA"> 
    <defaultFields> 
      <field name="ft_t_flar.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_flar.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_flar.inst_mnem" dataType="STRING"/>  
      <field name="ft_t_flar.rl_desc" dataType="STRING"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_flar.rl_typ" dataType="STRING" value="CPTY"/> 
    </where> 
  </occurrence>  
  <occurrence table="ft_t_gncm" id="LAGRGNCMINSTRUCT" parentId="LAGRCEA" dbConstraint="LAGRGNCMCSTM"> 
    <where> 
      <field name="ft_t_gncm.comm_reas_mnem" dataType="STRING" value="INSTRUCT"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_gncm.cmnt_txt" dataType="STRING"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_gncm.created_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_gncm.gncm_tbl_typ" dataType="STRING" value="LAGR"/>  
      <field name="ft_t_gncm.ln_num" dataType="NUMBER" value="1"/> 
    </defaultFields> 
  </occurrence>  
  <occurrence table="ft_t_gncm" id="LAGRGNCMINTRLGAL" parentId="LAGRCEA" dbConstraint="LAGRGNCMCSTM"> 
    <defaultFields> 
      <field name="ft_t_gncm.ln_num" dataType="NUMBER" value="1"/>  
      <field name="ft_t_gncm.gncm_tbl_typ" dataType="STRING" value="LAGR"/>  
      <field name="ft_t_gncm.created_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_gncm.cmnt_txt" dataType="STRING"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_gncm.comm_reas_mnem" dataType="STRING" value="INTRLGAL"/> 
    </where> 
  </occurrence>  
  <occurrence table="ft_t_gncm" id="LAGRGNCMTERMINTN" parentId="LAGRCEA" dbConstraint="LAGRGNCMCSTM"> 
    <defaultFields> 
      <field name="ft_t_gncm.ln_num" dataType="NUMBER" value="1"/>  
      <field name="ft_t_gncm.gncm_tbl_typ" dataType="STRING" value="LAGR"/>  
      <field name="ft_t_gncm.created_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_gncm.cmnt_txt" dataType="STRING"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_gncm.comm_reas_mnem" dataType="STRING" value="TERMINTN"/> 
    </where> 
  </occurrence>  
  <occurrence table="ft_t_gncm" id="LAGRGNCMTERMLGAL" parentId="LAGRCEA" dbConstraint="LAGRGNCMCSTM"> 
    <defaultFields> 
      <field name="ft_t_gncm.ln_num" dataType="NUMBER" value="1"/>  
      <field name="ft_t_gncm.gncm_tbl_typ" dataType="STRING" value="LAGR"/>  
      <field name="ft_t_gncm.created_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_gncm.cmnt_txt" dataType="STRING"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_gncm.comm_reas_mnem" dataType="STRING" value="TERMLGAL"/> 
    </where> 
  </occurrence>  
  <occurrence table="ft_t_gncm" id="LAGRGNCMTERMDEPT" parentId="LAGRCEA" dbConstraint="LAGRGNCMCSTM"> 
    <where> 
      <field name="ft_t_gncm.comm_reas_mnem" dataType="STRING" value="TERMDEPT"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_gncm.cmnt_txt" dataType="STRING"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_gncm.created_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_gncm.gncm_tbl_typ" dataType="STRING" value="LAGR"/>  
      <field name="ft_t_gncm.ln_num" dataType="NUMBER" value="1"/> 
    </defaultFields> 
  </occurrence>  
  <occurrence table="ft_t_gncm" id="LAGRGNCMINTRDEPT" parentId="LAGRCEA" dbConstraint="LAGRGNCMCSTM"> 
    <defaultFields> 
      <field name="ft_t_gncm.ln_num" dataType="NUMBER" value="1"/>  
      <field name="ft_t_gncm.gncm_tbl_typ" dataType="STRING" value="LAGR"/>  
      <field name="ft_t_gncm.created_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_gncm.cmnt_txt" dataType="STRING"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_gncm.comm_reas_mnem" dataType="STRING" value="INTRDEPT"/> 
    </where> 
  </occurrence>  
  <occurrence table="ft_t_lav1" id="LAGRLAV1" parentId="LAGRCEA" multiple="true" dbConstraint="ft_t_lav1_f002"> 
    <defaultFields> 
      <field name="ft_t_lav1.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_lav1.lav1_oid" dataType="STRING" valueOfFunction="OID"/>  
      <field name="ft_t_lav1.data_stat_typ" dataType="STRING" value="ACTIVE"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_lav1.doc_link" dataType="STRING"/>  
      <field name="ft_t_lav1.amend_desc" dataType="STRING"/>  
      <field name="ft_t_lav1.ver_amend_dte" dataType="DATETIME"/>  
      <field name="ft_t_lav1.version_no" dataType="NUMBER"/> 
    </inputFields> 
  </occurrence>  
  <occurrence table="ft_t_ccrf" id="LAGRCCRFADTP" parentId="LAGRCEA" dbConstraint="ccrff024"> 
    <where> 
      <field name="ft_t_ccrf.cross_ref_purp_typ" dataType="STRING" value="ADTP"/> 
    </where>  
    <defaultFields> 
        
      <field name="ft_t_ccrf.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields> 
  </occurrence>  
  <occurrence table="ft_t_empl" id="EMPLCCRFCPTY" parentId="LAGRCCRFADTP" dbConstraint="ccrff008"> 
    <defaultFields> 
      <field name="ft_t_empl.org_id" dataType="STRING" value="ENT1"/>  
      <field name="ft_t_empl.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_empl.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_empl.empl_oid" dataType="STRING" valueOfFunction="OID"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_empl.emp_nme" dataType="STRING" label="Contact Name"/>  
      <field name="ft_t_empl.emp_dept_nme" dataType="STRING" label="Contact Department"/>  
      <field name="ft_t_empl.emp_cntry_cde" dataType="STRING" label="Contact Country"/> 
    </inputFields> 
  </occurrence>  
  <occurrence table="ft_t_adtp" id="ADTPEMPLCPTY" parentId="EMPLCCRFCPTY"> 
    <defaultFields> 
      <field name="ft_t_adtp.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_adtp.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_adtp.addr_typ" dataType="STRING" value="LEGAL"/>  
    </defaultFields> 
  </occurrence>  
  <occurrence table="ft_t_eadr" id="EADRADTPCPTY" parentId="ADTPEMPLCPTY"> 
    <defaultFields> 
      <field name="ft_t_eadr.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_eadr.elec_addr_id" dataType="STRING" valueOfFunction="OID"/>  
      <field name="ft_t_eadr.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_eadr.fax_num_id" dataType="STRING"/>  
      <field name="ft_t_eadr.phone_num_id" dataType="STRING"/>  
      <field name="ft_t_eadr.eadr_val_num" dataType="STRING" label="E-Mail Id"/> 
    </inputFields> 
  </occurrence>  
  <occurrence table="ft_t_madr" id="MADRADTPCPTY" parentId="ADTPEMPLCPTY"> 
    <inputFields> 
      <field name="ft_t_madr.addr_ln1_txt" dataType="STRING"/>  
      <field name="ft_t_madr.addr_ln2_txt" dataType="STRING"/>  
      <field name="ft_t_madr.city_nme" dataType="STRING" label="City Name"/>  
      <field name="ft_t_madr.postal_cde" dataType="STRING"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_madr.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_madr.mail_addr_id" dataType="STRING" valueOfFunction="OID"/>  
      <field name="ft_t_madr.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields> 
  </occurrence>  
  <occurrence table="ft_t_lacv" id="FLARLACVMHIINSCOPE" parentId="FLARMHI" multiple="true" dbConstraint="ft_t_lacv_f001"> 
    <inputFields> 
      <field name="ft_t_lacv.dlr_br_nme" dataType="STRING" label="brnch_nme"/>  
     <!-- <field name="ft_t_lacv.prod_id" dataType="STRING"/>  -->
      <field name="ft_t_lacv.cust_prod_nme" dataType="STRING"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_lacv.cvg_purp_typ" dataType="STRING" value="INSCOPE"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_lacv.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_lacv.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_lacv.cust_prod_nme" dataType="STRING" value="ALL"/> 
    </defaultFields> 
  </occurrence>  
  <occurrence table="ft_t_lacv" id="FLARLACVCPTY" parentId="FLARCPTY" multiple="true" dbConstraint="ft_t_lacv_f001"> 
    <defaultFields> 
      <field name="ft_t_lacv.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_lacv.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>
      <field name="ft_t_lacv.dlr_br_nme" dataType="STRING" srcOccurrence="FLARLACVMHIINSCOPE" valueOf="ft_t_lacv.dlr_br_nme"/>
      <field name="ft_t_lacv.cust_prod_nme" dataType="STRING" value="ALL"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_lacv.dlr_br_nme" dataType="STRING" label="brnch_nme"/>  
     <!-- <field name="ft_t_lacv.prod_id" dataType="STRING"/>  -->
      <field name="ft_t_lacv.cust_prod_nme" dataType="STRING"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_lacv.cvg_purp_typ" dataType="STRING" value="INSCOPE"/> 
    </where> 
  </occurrence>  
  <occurrence table="ft_t_gncm" id="LAGRGNCMOTSCPPRD" parentId="LAGRCEA" dbConstraint="LAGRGNCMCSTM" multiple="true"> 
    <defaultFields> 
      <field name="ft_t_gncm.ln_num" dataType="NUMBER" value="1"/>  
      <field name="ft_t_gncm.gncm_tbl_typ" dataType="STRING" value="LAGR"/>  
      <field name="ft_t_gncm.created_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_gncm.cmnt_txt" dataType="STRING"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_gncm.comm_reas_mnem" dataType="STRING" value="OTSCPPRD"/> 
    </where> 
  </occurrence>  
  <!-- Non ISDA Platforms BEGIN -->  
  <occurrence table="ft_t_flar" id="FLARPLATFORM" parentId="LAGRCEA" multiple="true"> 
    <defaultFields> 
      <field name="ft_t_flar.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_flar.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_flar.inst_mnem" dataType="STRING"/>  
      <field name="ft_t_flar.rtng_agency_inst_mnem" dataType="STRING"/>  
      <field name="ft_t_flar.rl_desc" dataType="STRING"/>  
      <field name="ft_t_flar.suppl_term_cond_txt" dataType="STRING"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_flar.rl_typ" dataType="STRING" value="PLATFORM"/> 
    </where> 
  </occurrence>  
  <occurrence table="ft_t_flar" id="FLARREFENTY" parentId="LAGRCEA" multiple="true"> 
    <defaultFields> 
      <field name="ft_t_flar.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_flar.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_flar.inst_mnem" dataType="STRING"/>  
      <field name="ft_t_flar.rl_desc" dataType="STRING"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_flar.rl_typ" dataType="STRING" value="REFENTY"/> 
    </where> 
  </occurrence>  
  <occurrence table="ft_t_laap" id="FLARPLATFORMLAAPIM" parentId="FLARPLATFORM" label="AnnexureParticipantPlatformIM" autoCreate="false"> 
    <inputFields> 
      <field name="ft_t_laap.annex_prt_curr_cde" dataType="STRING"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_laap.laan_oid" dataType="STRING" srcOccurrence="LAGRLAANPLATFORMIM" valueOf="ft_t_laan.laan_oid" keepInSync="true"/>  
      <field name="ft_t_laap.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_laap.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_laap.annex_prt_modl_typ" dataType="STRING" value="IM"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_laap.annex_prt_modl_typ" dataType="STRING" value="IM"/> 
    </where> 
  </occurrence>  
  <occurrence table="ft_t_gncm" id="FLARPLATFORMLAAPIMTYPEGNCM" parentId="FLARPLATFORMLAAPIM" label="PlatformIMTypeComments" dbConstraint="LAAPGNCMCSTM"> 
    <inputFields> 
      <field name="ft_t_gncm.cmnt_txt" dataType="STRING"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_gncm.gncm_tbl_typ" dataType="STRING" value="LAAP"/>  
      <field name="ft_t_gncm.ln_num" dataType="NUMBER" value="1"/>  
      <field name="ft_t_gncm.created_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_gncm.comm_reas_mnem" dataType="STRING" value="IMTYPE"/> 
    </where> 
  </occurrence>  
  <occurrence table="ft_t_laap" id="FLARPLATFORMLAAPVM" parentId="FLARPLATFORM" label="AnnexureParticipantPlatformVM" autoCreate="false"> 
    <inputFields> 
      <field name="ft_t_laap.annex_prt_curr_cde" dataType="STRING"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_laap.laan_oid" dataType="STRING" srcOccurrence="LAGRLAANPLATFORMVM" valueOf="ft_t_laan.laan_oid" keepInSync="true"/>  
      <field name="ft_t_laap.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_laap.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_laap.annex_prt_modl_typ" dataType="STRING" value="VM"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_laap.annex_prt_modl_typ" dataType="STRING" value="VM"/> 
    </where> 
  </occurrence>  
  <occurrence table="ft_t_gncm" id="FLARPLATFORMLAAPVMTYPEGNCM" parentId="FLARPLATFORMLAAPVM" label="PlatformVMTypeComments" dbConstraint="LAAPGNCMCSTM"> 
    <inputFields> 
      <field name="ft_t_gncm.cmnt_txt" dataType="STRING"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_gncm.gncm_tbl_typ" dataType="STRING" value="LAAP"/>  
      <field name="ft_t_gncm.ln_num" dataType="NUMBER" value="1"/> 
      <field name="ft_t_gncm.created_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_gncm.comm_reas_mnem" dataType="STRING" value="VMTYPE"/> 
    </where> 
  </occurrence>  
  <!-- Required for Non-ISDA dummy LAAN entries -->  
  <occurrence table="ft_t_laan" id="LAGRLAANPLATFORMIM" parentId="LAGRCEA" label="AgreementAnnexurePlatformIM" autoCreate="true"> 
    <defaultFields> 
      <field name="ft_t_laan.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_laan.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_laan.laan_oid" dataType="STRING" valueOfFunction="OID"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_laan.annex_typ" dataType="STRING" value="PLATFORMIM"/>  
      <field name="ft_t_laan.annex_modl_typ" dataType="STRING" value="DUMMYIM"/> 
    </where> 
  </occurrence>  
  <occurrence table="ft_t_laan" id="LAGRLAANPLATFORMVM" parentId="LAGRCEA" label="AgreementAnnexurePlatformVM" autoCreate="true"> 
    <defaultFields> 
      <field name="ft_t_laan.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_laan.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_laan.laan_oid" dataType="STRING" valueOfFunction="OID"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_laan.annex_typ" dataType="STRING" value="PLATFORMVM"/>  
      <field name="ft_t_laan.annex_modl_typ" dataType="STRING" value="DUMMYVM"/> 
    </where> 
  </occurrence>  
  <!--End of  Required for Non-ISDA dummy LAAN entries -->  
  <occurrence table="ft_t_lacd" id="FLARPLATFORMLAAPIMLACDCURRENCY" parentId="FLARPLATFORMLAAPIM" multiple="true"> 
    <defaultFields> 
      <field name="ft_t_lacd.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_lacd.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_lacd.coll_curr_cde" dataType="STRING"/>  
      <field name="ft_t_lacd.haircut_cpct" dataType="NUMBER"/>  
      <field name="ft_t_lacd.adj_pct_val_cpct" dataType="NUMBER"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_lacd.iss_typ" dataType="STRING" value="CURRENCY"/> 
    </where> 
  </occurrence>  
  <occurrence table="ft_t_lacd" id="FLARPLATFORMLAAPVMLACDCURRENCY" parentId="FLARPLATFORMLAAPVM" multiple="true"> 
    <defaultFields> 
      <field name="ft_t_lacd.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_lacd.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_lacd.coll_curr_cde" dataType="STRING"/>  
      <field name="ft_t_lacd.haircut_cpct" dataType="NUMBER"/>  
      <field name="ft_t_lacd.adj_pct_val_cpct" dataType="NUMBER"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_lacd.iss_typ" dataType="STRING" value="CURRENCY"/> 
    </where> 
  </occurrence>  
  <occurrence table="ft_t_laat" id="FLARPLATFORMLAAPIMLAATMHI" parentId="FLARPLATFORMLAAPIM"> 
    <defaultFields> 
      <field name="ft_t_laat.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_laat.min_tsfr_camt" dataType="NUMBER"/>  
      <field name="ft_t_laat.thshld_camt" dataType="NUMBER"/>  
      <field name="ft_t_laat.thshld_curr_cde" dataType="STRING" label="thshld_curr"/>  
      <field name="ft_t_laat.thshld_val_fq_sp_typ" dataType="STRING"/> 
    </inputFields>  
    <where> 
    <!-- <field name="ft_t_laat.annex_modl_typ" dataType="STRING" value="IM"/> moved into laap.ANNEX_PRT_MODL_TYP -->
     <!--  <field name="ft_t_laat.rl_typ" dataType="STRING" value="MIZUHO"/> -->
    </where> 
  </occurrence>  
  <occurrence table="ft_t_laat" id="FLARPLATFORMLAAPIMLAATCPTY" parentId="FLARPLATFORMLAAPIM"> 
    <defaultFields> 
      <field name="ft_t_laat.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_laat.min_tsfr_camt" dataType="NUMBER"/>  
      <field name="ft_t_laat.thshld_camt" dataType="NUMBER"/>  
      <field name="ft_t_laat.thshld_curr_cde" dataType="STRING" label="thshld_curr"/>  
      <field name="ft_t_laat.thshld_val_fq_sp_typ" dataType="STRING"/> 
    </inputFields>  
    <where> 
      <!-- <field name="ft_t_laat.annex_modl_typ" dataType="STRING" value="IM"/> moved into laap.ANNEX_PRT_MODL_TYP -->
    <!--   <field name="ft_t_laat.rl_typ" dataType="STRING" value="CPTY"/> -->
    </where> 
  </occurrence>  
  <occurrence table="ft_t_laat" id="FLARPLATFORMLAAPIMLAATIA" parentId="FLARPLATFORMLAAPIM"> 
    <defaultFields> 
      <field name="ft_t_laat.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_laat.min_tsfr_camt" dataType="NUMBER"/> 
    </inputFields>  
    <where> 
      <!-- <field name="ft_t_laat.annex_modl_typ" dataType="STRING" value="IM"/> moved into laap.ANNEX_PRT_MODL_TYP --> 
        <!--<field name="ft_t_laat.rl_typ" dataType="STRING" value="IA"/> -->
    </where> 
  </occurrence>  
  <occurrence table="ft_t_laat" id="FLARPLATFORMLAAPVMLAATIA" parentId="FLARPLATFORMLAAPVM"> 
    <defaultFields> 
      <field name="ft_t_laat.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
       
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_laat.min_tsfr_camt" dataType="NUMBER"/> 
    </inputFields>  
    <where> 
     <!-- <field name="ft_t_laat.annex_modl_typ" dataType="STRING" value="VM"/> moved into laap.ANNEX_PRT_MODL_TYP --> 
     <!--  <field name="ft_t_laat.rl_typ" dataType="STRING" value="IA"/> -->
    </where> 
  </occurrence>  
  <occurrence table="ft_t_laat" id="FLARPLATFORMLAAPVMLAATMHI" parentId="FLARPLATFORMLAAPVM"> 
    <defaultFields> 
      <field name="ft_t_laat.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>        
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_laat.min_tsfr_camt" dataType="NUMBER"/>  
      <field name="ft_t_laat.thshld_camt" dataType="NUMBER"/>  
      <field name="ft_t_laat.thshld_curr_cde" dataType="STRING" label="thshld_curr"/>  
      <field name="ft_t_laat.thshld_val_fq_sp_typ" dataType="STRING"/> 
    </inputFields>  
    <where> 
     <!-- <field name="ft_t_laat.annex_modl_typ" dataType="STRING" value="VM"/> moved into laap.ANNEX_PRT_MODL_TYP --> 
     <!--  <field name="ft_t_laat.rl_typ" dataType="STRING" value="MIZUHO"/> --> 
    </where> 
  </occurrence>  
  <occurrence table="ft_t_laat" id="FLARPLATFORMLAAPVMLAATCPTY" parentId="FLARPLATFORMLAAPVM"> 
    <defaultFields> 
      <field name="ft_t_laat.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>         
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_laat.min_tsfr_camt" dataType="NUMBER"/>  
      <field name="ft_t_laat.thshld_camt" dataType="NUMBER"/>  
      <field name="ft_t_laat.thshld_curr_cde" dataType="STRING" label="thshld_curr"/>  
      <field name="ft_t_laat.thshld_val_fq_sp_typ" dataType="STRING"/> 
    </inputFields>  
    <where> 
      <!-- <field name="ft_t_laat.annex_modl_typ" dataType="STRING" value="VM"/> moved into laap.ANNEX_PRT_MODL_TYP --> 
     <!--  <field name="ft_t_laat.rl_typ" dataType="STRING" value="CPTY"/> -->
    </where> 
  </occurrence>  
  <!-- Non ISDA Platforms END  -->  
  <!-- Non ISDA Guaranteed Parties BEGIN -->  
  <occurrence table="ft_t_flar" id="FLARGUARPARTY" parentId="LAGRCEA" multiple="true"> 
    <defaultFields> 
      <field name="ft_t_flar.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_flar.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_flar.inst_mnem" dataType="STRING"/>  
      <field name="ft_t_flar.rtng_agency_inst_mnem" dataType="STRING"/>  
      <field name="ft_t_flar.rl_desc" dataType="STRING"/>  
      <field name="ft_t_flar.suppl_term_cond_txt" dataType="STRING"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_flar.rl_typ" dataType="STRING" value="GUARPRTY"/> 
    </where> 
  </occurrence>  
  <occurrence table="ft_t_laap" id="FLARGUARPARTYLAAPIM" parentId="FLARGUARPARTY" label="AnnexureParticipantGuarPartyIM" autoCreate="false"> 
    <inputFields> 
      <field name="ft_t_laap.annex_prt_curr_cde" dataType="STRING"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_laap.laan_oid" dataType="STRING" srcOccurrence="LAGRLAANGUARPARTYIM" valueOf="ft_t_laan.laan_oid" keepInSync="true"/>  
      <field name="ft_t_laap.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_laap.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_laap.annex_prt_modl_typ" dataType="STRING" value="IM"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_laap.annex_prt_modl_typ" dataType="STRING" value="IM"/> 
    </where> 
  </occurrence>  
  <occurrence table="ft_t_gncm" id="FLARGUARPARTYLAAPIMTYPEGNCM" parentId="FLARGUARPARTYLAAPIM" label="GuarPartyIMTypeComments" dbConstraint="LAAPGNCMCSTM"> 
    <inputFields> 
      <field name="ft_t_gncm.cmnt_txt" dataType="STRING"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_gncm.gncm_tbl_typ" dataType="STRING" value="LAAP"/>  
      <field name="ft_t_gncm.ln_num" dataType="NUMBER" value="1"/>  
      <field name="ft_t_gncm.created_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_gncm.comm_reas_mnem" dataType="STRING" value="IMTYPE"/> 
    </where> 
  </occurrence>  
  <occurrence table="ft_t_laap" id="FLARGUARPARTYLAAPVM" parentId="FLARGUARPARTY" label="AnnexureParticipantGuarPartyVM" autoCreate="false"> 
    <inputFields> 
      <field name="ft_t_laap.annex_prt_curr_cde" dataType="STRING"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_laap.laan_oid" dataType="STRING" srcOccurrence="LAGRLAANGUARPARTYVM" valueOf="ft_t_laan.laan_oid" keepInSync="true"/>  
      <field name="ft_t_laap.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_laap.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_laap.annex_prt_modl_typ" dataType="STRING" value="VM"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_laap.annex_prt_modl_typ" dataType="STRING" value="VM"/> 
    </where> 
  </occurrence>  
  <occurrence table="ft_t_gncm" id="FLARGUARPARTYLAAPVMTYPEGNCM" parentId="FLARGUARPARTYLAAPVM" label="GuarPartyVMTypeComments" dbConstraint="LAAPGNCMCSTM"> 
    <inputFields> 
      <field name="ft_t_gncm.cmnt_txt" dataType="STRING"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_gncm.gncm_tbl_typ" dataType="STRING" value="LAAP"/>  
      <field name="ft_t_gncm.ln_num" dataType="NUMBER" value="1"/>  
      <field name="ft_t_gncm.created_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_gncm.comm_reas_mnem" dataType="STRING" value="VMTYPE"/> 
    </where> 
  </occurrence>  
  <occurrence table="ft_t_laat" id="FLARGUARPARTYLAAPVMLAATCPTY" parentId="FLARGUARPARTYLAAPVM"> 
    <defaultFields> 
      <field name="ft_t_laat.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>     
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_laat.min_tsfr_camt" dataType="NUMBER"/>  
      <field name="ft_t_laat.thshld_camt" dataType="NUMBER"/>  
      <field name="ft_t_laat.thshld_curr_cde" dataType="STRING" label="thshld_curr"/>  
      <field name="ft_t_laat.thshld_val_fq_sp_typ" dataType="STRING"/> 
    </inputFields>  
    <where> 
      <!-- <field name="ft_t_laat.annex_modl_typ" dataType="STRING" value="VM"/> moved into laap.ANNEX_PRT_MODL_TYP -->
    <!--  <field name="ft_t_laat.rl_typ" dataType="STRING" value="CPTY"/> -->
    </where> 
  </occurrence>  
  <occurrence table="ft_t_laat" id="FLARGUARPARTYLAAPVMLAATIA" parentId="FLARGUARPARTYLAAPVM"> 
    <defaultFields> 
      <field name="ft_t_laat.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
       
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_laat.min_tsfr_camt" dataType="NUMBER"/> 
    </inputFields>  
    <where> 
     <!-- <field name="ft_t_laat.annex_modl_typ" dataType="STRING" value="VM"/> moved into laap.ANNEX_PRT_MODL_TYP -->  
     <!-- <field name="ft_t_laat.rl_typ" dataType="STRING" value="IA"/> --> 
    </where> 
  </occurrence>  
  <!-- Required for Non-ISDA dummy LAAN entries -->  
  <occurrence table="ft_t_laan" id="LAGRLAANGUARPARTYIM" parentId="LAGRCEA" label="AgreementAnnexureGuarPartyIM" autoCreate="true"> 
    <defaultFields> 
      <field name="ft_t_laan.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_laan.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_laan.laan_oid" dataType="STRING" valueOfFunction="OID"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_laan.annex_typ" dataType="STRING" value="GUARPARTYIM"/>  
      <field name="ft_t_laan.annex_modl_typ" dataType="STRING" value="DUMMYIM"/> 
    </where> 
  </occurrence>  
  <occurrence table="ft_t_laan" id="LAGRLAANGUARPARTYVM" parentId="LAGRCEA" label="AgreementAnnexureGuarPartyVM" autoCreate="true"> 
    <defaultFields> 
      <field name="ft_t_laan.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_laan.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_laan.laan_oid" dataType="STRING" valueOfFunction="OID"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_laan.annex_typ" dataType="STRING" value="GUARPARTYVM"/>  
      <field name="ft_t_laan.annex_modl_typ" dataType="STRING" value="DUMMYVM"/> 
    </where> 
  </occurrence>  
  <!--End of  Required for Non-ISDA dummy LAAN entries -->  
  <occurrence table="ft_t_lacd" id="FLARGUARPARTYLAAPIMLACDCURRENCY" parentId="FLARGUARPARTYLAAPIM" multiple="true"> 
    <defaultFields> 
      <field name="ft_t_lacd.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_lacd.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_lacd.coll_curr_cde" dataType="STRING"/>  
      <field name="ft_t_lacd.haircut_cpct" dataType="NUMBER"/>  
      <field name="ft_t_lacd.adj_pct_val_cpct" dataType="NUMBER"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_lacd.iss_typ" dataType="STRING" value="CURRENCY"/> 
    </where> 
  </occurrence>  
  <occurrence table="ft_t_lacd" id="FLARGUARPARTYLAAPVMLACDCURRENCY" parentId="FLARGUARPARTYLAAPVM" multiple="true"> 
    <defaultFields> 
      <field name="ft_t_lacd.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_lacd.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_lacd.coll_curr_cde" dataType="STRING"/>  
      <field name="ft_t_lacd.haircut_cpct" dataType="NUMBER"/>  
      <field name="ft_t_lacd.adj_pct_val_cpct" dataType="NUMBER"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_lacd.iss_typ" dataType="STRING" value="CURRENCY"/> 
    </where> 
  </occurrence>  
  <occurrence table="ft_t_laat" id="FLARGUARPARTYLAAPIMLAATMHI" parentId="FLARGUARPARTYLAAPIM"> 
    <defaultFields> 
      <field name="ft_t_laat.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>    
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_laat.min_tsfr_camt" dataType="NUMBER"/>  
      <field name="ft_t_laat.thshld_camt" dataType="NUMBER"/>  
      <field name="ft_t_laat.thshld_curr_cde" dataType="STRING" label="thshld_curr"/>  
      <field name="ft_t_laat.thshld_val_fq_sp_typ" dataType="STRING"/> 
    </inputFields>  
    <where> 
      <!-- <field name="ft_t_laat.annex_modl_typ" dataType="STRING" value="IM"/> moved into laap.ANNEX_PRT_MODL_TYP -->
      <!-- <field name="ft_t_laat.rl_typ" dataType="STRING" value="MIZUHO"/> -->
    </where> 
  </occurrence>  
  <occurrence table="ft_t_laat" id="FLARGUARPARTYLAAPIMLAATCPTY" parentId="FLARGUARPARTYLAAPIM"> 
    <defaultFields> 
      <field name="ft_t_laat.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>   
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_laat.min_tsfr_camt" dataType="NUMBER"/>  
      <field name="ft_t_laat.thshld_camt" dataType="NUMBER"/>  
      <field name="ft_t_laat.thshld_curr_cde" dataType="STRING" label="thshld_curr"/>  
      <field name="ft_t_laat.thshld_val_fq_sp_typ" dataType="STRING"/> 
    </inputFields>  
    <where> 
     <!-- <field name="ft_t_laat.annex_modl_typ" dataType="STRING" value="IM"/> moved into laap.ANNEX_PRT_MODL_TYP -->
    <!--   <field name="ft_t_laat.rl_typ" dataType="STRING" value="CPTY"/> -->
    </where> 
  </occurrence>  
  <occurrence table="ft_t_laat" id="FLARGUARPARTYLAAPIMLAATIA" parentId="FLARGUARPARTYLAAPIM"> 
    <defaultFields> 
      <field name="ft_t_laat.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>      
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_laat.min_tsfr_camt" dataType="NUMBER"/> 
    </inputFields>  
    <where> 
     <!-- <field name="ft_t_laat.annex_modl_typ" dataType="STRING" value="IM"/> moved into laap.ANNEX_PRT_MODL_TYP --> 
     <!--  <field name="ft_t_laat.rl_typ" dataType="STRING" value="IA"/> -->
    </where> 
  </occurrence>  
  <occurrence table="ft_t_laat" id="FLARGUARPARTYLAAPVMLAATMHI" parentId="FLARGUARPARTYLAAPVM"> 
    <defaultFields> 
      <field name="ft_t_laat.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_laat.min_tsfr_camt" dataType="NUMBER"/>  
      <field name="ft_t_laat.thshld_camt" dataType="NUMBER"/>  
      <field name="ft_t_laat.thshld_curr_cde" dataType="STRING" label="thshld_curr"/>  
      <field name="ft_t_laat.thshld_val_fq_sp_typ" dataType="STRING"/> 
    </inputFields>  
    <where> 
      <!-- <field name="ft_t_laat.annex_modl_typ" dataType="STRING" value="VM"/> moved into laap.ANNEX_PRT_MODL_TYP --> 
      <!-- <field name="ft_t_laat.rl_typ" dataType="STRING" value="MIZUHO"/> -->
    </where> 
  </occurrence>  
  <occurrence table="ft_t_gncm" id="FLARPLATFORMLAAPIMGNCM" parentId="FLARPLATFORMLAAPIM" label="PlatformIMComments" dbConstraint="LAAPGNCMCSTM"> 
    <inputFields> 
      <field name="ft_t_gncm.cmnt_txt" dataType="STRING"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_gncm.gncm_tbl_typ" dataType="STRING" value="LAAP"/>  
      <field name="ft_t_gncm.ln_num" dataType="NUMBER" value="1"/>   
      <field name="ft_t_gncm.created_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>
     <where>
      <field name="ft_t_gncm.comm_reas_mnem" dataType="STRING" value="NISDAINF"/> 
     </where> 
  </occurrence>  
  <occurrence table="ft_t_gncm" id="FLARPLATFORMLAAPVMGNCM" parentId="FLARPLATFORMLAAPVM" label="PlatformVMComments" dbConstraint="LAAPGNCMCSTM"> 
    <inputFields> 
      <field name="ft_t_gncm.cmnt_txt" dataType="STRING"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_gncm.gncm_tbl_typ" dataType="STRING" value="LAAP"/>  
      <field name="ft_t_gncm.ln_num" dataType="NUMBER" value="1"/>    
      <field name="ft_t_gncm.created_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>
    <where>
      <field name="ft_t_gncm.comm_reas_mnem" dataType="STRING" value="NISDAINF"/>
    </where> 
  </occurrence>  
  <occurrence table="ft_t_gncm" id="FLARPLATFORMLAAPIMLAATIAGNCM" parentId="FLARPLATFORMLAAPIMLAATIA" label="PlatformIMIAComments" dbConstraint="LAATGNCMCSTM"> 
    <inputFields> 
      <field name="ft_t_gncm.cmnt_txt" dataType="STRING"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_gncm.gncm_tbl_typ" dataType="STRING" value="LAAT"/>  
      <field name="ft_t_gncm.ln_num" dataType="NUMBER" value="1"/>  
      <field name="ft_t_gncm.comm_reas_mnem" dataType="STRING" value="IADESC"/>  
      <field name="ft_t_gncm.created_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields> 
  </occurrence>  
  <occurrence table="ft_t_gncm" id="FLARPLATFORMLAAPVMLAATIAGNCM" parentId="FLARPLATFORMLAAPVMLAATIA" label="PlatformVMIAComments" dbConstraint="LAATGNCMCSTM"> 
    <inputFields> 
      <field name="ft_t_gncm.cmnt_txt" dataType="STRING"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_gncm.gncm_tbl_typ" dataType="STRING" value="LAAT"/>  
      <field name="ft_t_gncm.ln_num" dataType="NUMBER" value="1"/>  
      <field name="ft_t_gncm.comm_reas_mnem" dataType="STRING" value="IADESC"/>  
      <field name="ft_t_gncm.created_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields> 
  </occurrence>  
  <occurrence table="ft_t_gncm" id="FLARGUARPARTYLAAPIMGNCM" parentId="FLARGUARPARTYLAAPIM" label="GuarPartyIMComments" dbConstraint="LAAPGNCMCSTM"> 
    <inputFields> 
      <field name="ft_t_gncm.cmnt_txt" dataType="STRING"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_gncm.gncm_tbl_typ" dataType="STRING" value="LAAP"/>  
      <field name="ft_t_gncm.ln_num" dataType="NUMBER" value="1"/>     
      <field name="ft_t_gncm.created_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>
    <where>
      <field name="ft_t_gncm.comm_reas_mnem" dataType="STRING" value="NISDAINF"/> 
    </where> 
  </occurrence>  
  <occurrence table="ft_t_gncm" id="FLARGUARPARTYLAAPVMGNCM" parentId="FLARGUARPARTYLAAPVM" label="GuarPartyVMComments" dbConstraint="LAAPGNCMCSTM"> 
    <inputFields> 
      <field name="ft_t_gncm.cmnt_txt" dataType="STRING"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_gncm.gncm_tbl_typ" dataType="STRING" value="LAAP"/>  
      <field name="ft_t_gncm.ln_num" dataType="NUMBER" value="1"/>   
      <field name="ft_t_gncm.created_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>
    <where>
      <field name="ft_t_gncm.comm_reas_mnem" dataType="STRING" value="NISDAINF"/> 
    </where> 
  </occurrence>  
  <occurrence table="ft_t_gncm" id="FLARGUARPARTYLAAPIMLAATGNCMIA" parentId="FLARGUARPARTYLAAPIMLAATIA" label="GuarPartyIMIAComments" dbConstraint="LAATGNCMCSTM"> 
    <inputFields> 
      <field name="ft_t_gncm.cmnt_txt" dataType="STRING"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_gncm.gncm_tbl_typ" dataType="STRING" value="LAAT"/>  
      <field name="ft_t_gncm.ln_num" dataType="NUMBER" value="1"/>  
      <field name="ft_t_gncm.comm_reas_mnem" dataType="STRING" value="IADESC"/>  
      <field name="ft_t_gncm.created_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields> 
  </occurrence>  
  <occurrence table="ft_t_gncm" id="FLARGUARPARTYLAAPVMLAATGNCMIA" parentId="FLARGUARPARTYLAAPVMLAATIA" label="GuarPartyVMIAComments" dbConstraint="LAATGNCMCSTM"> 
    <inputFields> 
      <field name="ft_t_gncm.cmnt_txt" dataType="STRING"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_gncm.gncm_tbl_typ" dataType="STRING" value="LAAT"/>  
      <field name="ft_t_gncm.ln_num" dataType="NUMBER" value="1"/>  
      <field name="ft_t_gncm.comm_reas_mnem" dataType="STRING" value="IADESC"/>  
      <field name="ft_t_gncm.created_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields> 
  </occurrence>  
  <occurrence table="ft_t_ccrf" id="LAGRCCRFINSTRUCT" parentId="LAGRCEA" dbConstraint="ccrff024" autoCreate="false"> 
    <defaultFields> 
      <field name="ft_t_ccrf.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_ccrf.cross_ref_purp_typ" dataType="STRING" value="INSTRUCT"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_ccrf.empl_oid" dataType="STRING"/> 
    </inputFields> 
  </occurrence>  
  <occurrence table="ft_t_ccrf" id="LAGRCCRFINTRLGAL" parentId="LAGRCEA" dbConstraint="ccrff024" autoCreate="false"> 
    <defaultFields> 
      <field name="ft_t_ccrf.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_ccrf.cross_ref_purp_typ" dataType="STRING" value="INTRLGAL"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_ccrf.empl_oid" dataType="STRING"/> 
    </inputFields> 
  </occurrence>  
  <occurrence table="ft_t_ccrf" id="LAGRCCRFTERMINTN" parentId="LAGRCEA" dbConstraint="ccrff024" autoCreate="false"> 
    <defaultFields> 
      <field name="ft_t_ccrf.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_ccrf.cross_ref_purp_typ" dataType="STRING" value="TERMINTN"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_ccrf.empl_oid" dataType="STRING"/> 
    </inputFields> 
  </occurrence>  
  <occurrence table="ft_t_ccrf" id="LAGRCCRFTERMLGAL" parentId="LAGRCEA" dbConstraint="ccrff024" autoCreate="false"> 
    <defaultFields> 
      <field name="ft_t_ccrf.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_ccrf.empl_oid" dataType="STRING"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_ccrf.cross_ref_purp_typ" dataType="STRING" value="TERMLGAL"/> 
    </where> 
  </occurrence> 
<relations><table name="FT_T_GNCM"><relation relatedTable="FT_T_LAGR" name="LAGRGNCMCSTM">
      <fromColumns>
        <column name="CROSS_REF_ID"/>
      </fromColumns>
      <toColumns>
        <column name="LEG_AGRMNT_ID"/>
      </toColumns>
      <condition>
        <sql>#FROM_TABLE#.GNCM_TBL_TYP = ''LAGR''</sql>
      </condition>
    </relation></table><table name="FT_T_GNCM"><relation relatedTable="FT_T_LAAP" name="LAAPGNCMCSTM">
      <fromColumns>
        <column name="CROSS_REF_ID"/>
      </fromColumns>
      <toColumns>
        <column name="LAAP_OID"/>
      </toColumns>
      <condition>
        <sql>#FROM_TABLE#.GNCM_TBL_TYP = ''LAAP''</sql>
      </condition>
    </relation></table><table name="FT_T_GNCM"><relation relatedTable="FT_T_LAAT" name="LAATGNCMCSTM">
      <fromColumns>
        <column name="CROSS_REF_ID"/>
      </fromColumns>
      <toColumns>
        <column name="LAAT_OID"/>
      </toColumns>
      <condition>
        <sql>#FROM_TABLE#.GNCM_TBL_TYP = ''LAAT''</sql>
      </condition>
    </relation></table></relations></model>' WHERE modl_id ='LAGRCEA' AND modl_typ = 'MHILAGR';						

UPDATE FT_T_MDDF SET modl_schema ='<?xml version="1.0" encoding="UTF-8"?>
<model xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="../../schemas/Model.xsd" id="LAGRREPO" headerInfoXPath="concat(''Legal Agreement - '',/root/lagr.agrmnt_desc)">  
  <occurrence id="LAGRREPO" table="ft_t_lagr"> 
    <inputFields> 
      <field name="ft_t_lagr.agrmnt_typ" dataType="STRING"/>  
      <field name="ft_t_lagr.agrmnt_amend_dte" dataType="DATETIME"/>  
      <field name="ft_t_lagr.agrmnt_desc" dataType="STRING"/>  
      <field name="ft_t_lagr.agrmnt_loc_txt" dataType="STRING"/>  
      <field name="ft_t_lagr.agrmnt_sign_dte" dataType="DATETIME"/>  
      <field name="ft_t_lagr.agrmnt_stat_typ" dataType="STRING"/>  
      <field name="ft_t_lagr.agrmnt_amend_desc" dataType="STRING"/>  
      <field name="ft_t_lagr.agrmnt_aprvl_dte" dataType="DATETIME"/>  
      <field name="ft_t_lagr.agrmnt_cmnt_txt" dataType="STRING"/>  
      <field name="ft_t_lagr.agrmnt_negotn_instruc_dte" dataType="DATETIME" label="agrmnt_instrcn_dte"/>  
      <field name="ft_t_lagr.agrmnt_termintn_dte" dataType="DATETIME"/>  
      <field name="ft_t_lagr.agrmnt_version_id" dataType="NUMBER" label="agrmnt_version"/>  
      <field name="ft_t_lagr.ev_dflt_curr_cde" dataType="STRING"/>  
      <field name="ft_t_lagr.leg_juris_nme" dataType="STRING"/>  
      <field name="ft_t_lagr.legal_opinion_ind" dataType="STRING"/>  
      <field name="ft_t_lagr.agrmnt_curr_cde" dataType="STRING"/>  
      <field name="ft_t_lagr.org_id" dataType="STRING"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_lagr.agrmnt_purp_typ" dataType="STRING" value="LGAGTREPO"/>  
      <field name="ft_t_lagr.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_lagr.created_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_lagr.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_lagr.leg_agrmnt_id" dataType="STRING" valueOfFunction="OID"/>   
      <field name="ft_t_lagr.leg_juris_nme" dataType="STRING" value="ENGLISH"/>  
      <field name="ft_t_lagr.legal_opinion_ind" dataType="STRING" value="Y"/> 
    </defaultFields>  
    <validationRules> 
      <rule id="Agreement_signed" pageName="MHILAGR_SpeedScreen"> 
        <xPath value="not(boolean(string(/root[lagr.agrmnt_stat_typ[string(@status)=''modified'' and string(@original)=''SIGNED'' ]]/lagr.agrmnt_stat_typ/text())=''INNEGTION''))"/>  
        <errorMessage value="Agreement Status can not be changed from &quot;Signed&quot; to &quot;In Negotiation&quot;"/> 
      </rule>  
      <rule id="Agreement_signed1" pageName="MHILAGR_SpeedScreen"> 
        <xPath value="not(boolean(string(/root[lagr.agrmnt_stat_typ[string(@status)=''modified'' and string(@original)=''SIGNED'' ]]/lagr.agrmnt_stat_typ/text())=''NEGONHLD''))"/>  
        <errorMessage value="Agreement Status can not be changed from &quot;Signed&quot; to &quot;Negotiation On Hold&quot;"/> 
      </rule>  
      <rule id="RepoTerminateDate"> 
        <xPath value="boolean((./lagr.agrmnt_stat_typ=''TERMNTED'' and string(./lagr.agrmnt_termintn_dte)) or (./lagr.agrmnt_stat_typ!=''TERMNTED'' and not(string(./lagr.agrmnt_termintn_dte))))"/>  
        <errorMessage value="Agreement Status and Date of Termination need to both be populated if agreement is to be terminated. Please rectify"/> 
      </rule>  
      <rule id="RepoCounterpartyBranch"> 
        <xPath value="not(count(/root/FinancialInstitutionAgreementRoles/FinancialInstitutionAgreementRole[flar.rl_typ=''CPTY'']/FTTLACVs/FTTLACV/lacv.dlr_br_nme)=0 and /root/lagr.agrmnt_stat_typ=''SIGNED'')"/>  
        <errorMessage value="Counterparty branch is not populated but legal agreement is ''Signed''. Please populate counterparty branch location."/> 
      </rule> 
    </validationRules> 
  </occurrence>  
  <occurrence table="ft_t_flar" id="FLARMHI" parentId="LAGRREPO" autoCreate="true" multiple="false"> 
    <inputFields> 
      <field name="ft_t_flar.auto_termin_ev_appls_ind" dataType="STRING"/>  
      <field name="ft_t_flar.cem_applies_ind" dataType="STRING"/>  
      <field name="ft_t_flar.ed_ate_appls_ind" dataType="STRING"/>  
      <field name="ft_t_flar.thshld_cpct" dataType="NUMBER"/>  
      <field name="ft_t_flar.thshld_comp_typ" dataType="STRING"/>  
      <field name="ft_t_flar.thshld_curr_cde" dataType="STRING"/>  
      <field name="ft_t_flar.thshld_oper_typ" dataType="STRING"/>  
      <field name="ft_t_flar.thshld_accel_camt" dataType="NUMBER"/>  
      <field name="ft_t_flar.dflt_strn_cmnt_txt" dataType="STRING"/>  
      <field name="ft_t_flar.agncy_tran_applies_ind" dataType="STRING"/>  
      <field name="ft_t_flar.prncpl_tran_applies_ind" dataType="STRING"/>  
      <field name="ft_t_flar.inst_mnem" dataType="STRING"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_flar.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_flar.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_flar.rl_typ" dataType="STRING" value="MIZUHO"/> 
    </where> 
  </occurrence>  
  <occurrence table="ft_t_flar" id="FLARCPTY" parentId="LAGRREPO"> 
    <defaultFields> 
      <field name="ft_t_flar.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_flar.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_flar.inst_mnem" dataType="STRING"/>  
      <field name="ft_t_flar.rl_desc" dataType="STRING"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_flar.rl_typ" dataType="STRING" value="CPTY"/> 
    </where> 
  </occurrence>  
  <occurrence table="ft_t_gncm" id="LAGRGNCMINSTRUCT" parentId="LAGRREPO" dbConstraint="LAGRGNCMCSTM"> 
    <where> 
      <field name="ft_t_gncm.comm_reas_mnem" dataType="STRING" value="INSTRUCT"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_gncm.cmnt_txt" dataType="STRING"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_gncm.created_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_gncm.gncm_tbl_typ" dataType="STRING" value="LAGR"/>  
      <field name="ft_t_gncm.ln_num" dataType="NUMBER" value="1"/> 
    </defaultFields> 
  </occurrence>  
  <occurrence table="ft_t_flar" id="FLARTRI" multiple="true" parentId="LAGRREPO"> 
    <defaultFields> 
      <field name="ft_t_flar.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_flar.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_flar.inst_mnem" dataType="STRING"/>  
      <field name="ft_t_flar.rl_desc" dataType="STRING"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_flar.rl_typ" dataType="STRING" value="TRI"/> 
    </where> 
  </occurrence>  
  <occurrence table="ft_t_gncm" id="LAGRGNCMINTRLGAL" parentId="LAGRREPO" dbConstraint="LAGRGNCMCSTM"> 
    <defaultFields> 
      <field name="ft_t_gncm.ln_num" dataType="NUMBER" value="1"/>  
      <field name="ft_t_gncm.gncm_tbl_typ" dataType="STRING" value="LAGR"/>  
      <field name="ft_t_gncm.created_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_gncm.cmnt_txt" dataType="STRING"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_gncm.comm_reas_mnem" dataType="STRING" value="INTRLGAL"/> 
    </where> 
  </occurrence>  
  <occurrence table="ft_t_gncm" id="LAGRGNCMTERMINTN" parentId="LAGRREPO" dbConstraint="LAGRGNCMCSTM"> 
    <defaultFields> 
      <field name="ft_t_gncm.ln_num" dataType="NUMBER" value="1"/>  
      <field name="ft_t_gncm.gncm_tbl_typ" dataType="STRING" value="LAGR"/>  
      <field name="ft_t_gncm.created_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_gncm.cmnt_txt" dataType="STRING"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_gncm.comm_reas_mnem" dataType="STRING" value="TERMINTN"/> 
    </where> 
  </occurrence>  
  <occurrence table="ft_t_gncm" id="LAGRGNCMTERMLGAL" parentId="LAGRREPO" dbConstraint="LAGRGNCMCSTM"> 
    <defaultFields> 
      <field name="ft_t_gncm.ln_num" dataType="NUMBER" value="1"/>  
      <field name="ft_t_gncm.gncm_tbl_typ" dataType="STRING" value="LAGR"/>  
      <field name="ft_t_gncm.created_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_gncm.cmnt_txt" dataType="STRING"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_gncm.comm_reas_mnem" dataType="STRING" value="TERMLGAL"/> 
    </where> 
  </occurrence>  
  <occurrence table="ft_t_gncm" id="LAGRGNCMTERMDEPT" parentId="LAGRREPO" dbConstraint="LAGRGNCMCSTM"> 
    <where> 
      <field name="ft_t_gncm.comm_reas_mnem" dataType="STRING" value="TERMDEPT"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_gncm.cmnt_txt" dataType="STRING"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_gncm.created_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_gncm.gncm_tbl_typ" dataType="STRING" value="LAGR"/>  
      <field name="ft_t_gncm.ln_num" dataType="NUMBER" value="1"/> 
    </defaultFields> 
  </occurrence>  
  <occurrence table="ft_t_gncm" id="LAGRGNCMINTRDEPT" parentId="LAGRREPO" dbConstraint="LAGRGNCMCSTM"> 
    <defaultFields> 
      <field name="ft_t_gncm.ln_num" dataType="NUMBER" value="1"/>  
      <field name="ft_t_gncm.gncm_tbl_typ" dataType="STRING" value="LAGR"/>  
      <field name="ft_t_gncm.created_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_gncm.cmnt_txt" dataType="STRING"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_gncm.comm_reas_mnem" dataType="STRING" value="INTRDEPT"/> 
    </where> 
  </occurrence>  
  <occurrence table="ft_t_lav1" id="LAGRLAV1" parentId="LAGRREPO" multiple="true" dbConstraint="ft_t_lav1_f002"> 
    <defaultFields> 
      <field name="ft_t_lav1.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_lav1.lav1_oid" dataType="STRING" valueOfFunction="OID"/>  
      <field name="ft_t_lav1.data_stat_typ" dataType="STRING" value="ACTIVE"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_lav1.doc_link" dataType="STRING"/>  
      <field name="ft_t_lav1.amend_desc" dataType="STRING"/>  
      <field name="ft_t_lav1.ver_amend_dte" dataType="DATETIME"/>  
      <field name="ft_t_lav1.version_no" dataType="NUMBER"/>  
      <field name="ft_t_lav1.instruc_release_tms" dataType="DATETIME"/>  
      <field name="ft_t_lav1.agrmnt_stat_typ" dataType="STRING"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_lav1.flar_oid" dataType="STRING" isNull="true"/> 
    </where> 
  </occurrence>  
  <occurrence table="ft_t_lav1" id="LAGRLAVTRIP" parentId="FLARTRI" multiple="true" dbConstraint="ft_t_lav1_f003"> 
    <defaultFields> 
      <field name="ft_t_lav1.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_lav1.lav1_oid" dataType="STRING" valueOfFunction="OID"/>  
      <field name="ft_t_lav1.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_lav1.version_no" valueOfFunction="NEXTLINENUMBER" dataType="NUMBER"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_lav1.doc_link" dataType="STRING"/>  
      <field name="ft_t_lav1.amend_desc" dataType="STRING"/>  
      <field name="ft_t_lav1.ver_amend_dte" dataType="DATETIME"/>  
      <field name="ft_t_lav1.instruc_release_tms" dataType="DATETIME"/>  
      <field name="ft_t_lav1.flar_oid" dataType="STRING"/>  
      <field name="ft_t_lav1.sign_dte" dataType="DATETIME"/> 
    </inputFields> 
  </occurrence>  
  <occurrence table="ft_t_ccrf" id="LAGRCCRFADTP" parentId="LAGRREPO" dbConstraint="ccrff024"> 
    <where> 
      <field name="ft_t_ccrf.cross_ref_purp_typ" dataType="STRING" value="ADTP"/> 
    </where>  
    <defaultFields>       
      <field name="ft_t_ccrf.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields> 
  </occurrence>  
  <occurrence table="ft_t_empl" id="EMPLCCRFCPTY" parentId="LAGRCCRFADTP" dbConstraint="ccrff008"> 
    <defaultFields> 
      <field name="ft_t_empl.org_id" dataType="STRING" value="ENT1"/>  
      <field name="ft_t_empl.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_empl.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_empl.empl_oid" dataType="STRING" valueOfFunction="OID"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_empl.emp_nme" dataType="STRING" label="Contact Name"/>  
      <field name="ft_t_empl.emp_dept_nme" dataType="STRING" label="Contact Department"/>  
      <field name="ft_t_empl.emp_cntry_cde" dataType="STRING" label="Contact Country"/> 
    </inputFields> 
  </occurrence>  
  <occurrence table="ft_t_adtp" id="ADTPEMPLCPTY" parentId="EMPLCCRFCPTY"> 
    <defaultFields> 
      <field name="ft_t_adtp.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_adtp.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_adtp.addr_typ" dataType="STRING" value="LEGAL"/>    
    </defaultFields> 
  </occurrence>  
  <occurrence table="ft_t_eadr" id="EADRADTPCPTY" parentId="ADTPEMPLCPTY"> 
    <defaultFields> 
      <field name="ft_t_eadr.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_eadr.elec_addr_id" dataType="STRING" valueOfFunction="OID"/>  
      <field name="ft_t_eadr.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_eadr.fax_num_id" dataType="STRING"/>  
      <field name="ft_t_eadr.phone_num_id" dataType="STRING"/>  
      <field name="ft_t_eadr.eadr_val_num" dataType="STRING" label="E-Mail Id"/> 
    </inputFields> 
  </occurrence>  
  <occurrence table="ft_t_madr" id="MADRADTPCPTY" parentId="ADTPEMPLCPTY"> 
    <inputFields> 
      <field name="ft_t_madr.addr_ln1_txt" dataType="STRING"/>  
      <field name="ft_t_madr.addr_ln2_txt" dataType="STRING"/>  
      <field name="ft_t_madr.city_nme" dataType="STRING" label="City Name"/>  
      <field name="ft_t_madr.postal_cde" dataType="STRING"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_madr.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_madr.mail_addr_id" dataType="STRING" valueOfFunction="OID"/>  
      <field name="ft_t_madr.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields> 
  </occurrence>  
  <occurrence table="ft_t_lacv" id="FLARLACVMHIINSCOPE" parentId="FLARMHI" multiple="false" dbConstraint="ft_t_lacv_f001" autoCreate="true"> 
    <defaultFields> 
      <field name="ft_t_lacv.lacv_oid" dataType="STRING" valueOfFunction="OID"/>  
      <field name="ft_t_lacv.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_lacv.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_lacv.cust_prod_nme" dataType="STRING" value="ALL"/> 
    </defaultFields>  
    <inputFields> 
     <!-- <field name="ft_t_lacv.prod_id" dataType="STRING"/>  -->
      <field name="ft_t_lacv.cust_prod_nme" dataType="STRING"/>  
      <field name="ft_t_lacv.dlr_br_nme" dataType="STRING" label="brnch_nme"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_lacv.cvg_purp_typ" dataType="STRING" value="INSCOPE"/> 
    </where> 
  </occurrence>  
  <occurrence table="ft_t_lacv" id="FLARLACVCPTY" parentId="FLARCPTY" multiple="true" dbConstraint="ft_t_lacv_f001"> 
    <defaultFields> 
      <field name="ft_t_lacv.lacv_oid" dataType="STRING" valueOfFunction="OID"/>  
      <field name="ft_t_lacv.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_lacv.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_lacv.dlr_br_nme" dataType="STRING" srcOccurrence="FLARLACVMHIINSCOPE" valueOf="ft_t_lacv.dlr_br_nme"/>  
      <field name="ft_t_lacv.cust_prod_nme" dataType="STRING" value="ALL"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_lacv.dlr_br_nme" dataType="STRING" label="brnch_nme"/>  
     <!-- <field name="ft_t_lacv.prod_id" dataType="STRING"/>  -->
      <field name="ft_t_lacv.cust_prod_nme" dataType="STRING"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_lacv.cvg_purp_typ" dataType="STRING" value="INSCOPE"/> 
    </where> 
  </occurrence>  
  <occurrence table="ft_t_gncm" id="LAGRGNCMOTSCPPRD" parentId="LAGRREPO" dbConstraint="LAGRGNCMCSTM" multiple="true"> 
    <defaultFields> 
      <field name="ft_t_gncm.ln_num" dataType="NUMBER" value="1"/>  
      <field name="ft_t_gncm.gncm_tbl_typ" dataType="STRING" value="LAGR"/>  
      <field name="ft_t_gncm.created_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_gncm.cmnt_txt" dataType="STRING"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_gncm.comm_reas_mnem" dataType="STRING" value="OTSCPPRD"/> 
    </where> 
  </occurrence>  
  <occurrence table="ft_t_laan" id="LAGRLAAN" parentId="LAGRREPO" label="AgreementAnnexures" multiple="true" autoCreate="false"> 
    <defaultFields> 
      <field name="ft_t_laan.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_laan.data_stat_typ" dataType="STRING" value="ACTIVE"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_laan.annex_typ" dataType="STRING"/>  
      <field name="ft_t_laan.annex_sign_dte" dataType="DATETIME"/>  
      <field name="ft_t_laan.bi_lateral_ind" dataType="STRING"/>  
      <field name="ft_t_laan.annex_curr_cde" dataType="STRING"/>  
      <field name="ft_t_laan.annex_ammend_dte" dataType="DATETIME"/>  
      <field name="ft_t_laan.annex_id" dataType="NUMBER" label="annex_version"/>  
      <field name="ft_t_laan.annex_termintn_dte" dataType="DATETIME"/>  
      <field name="ft_t_laan.annex_stat_typ" dataType="STRING"/>  
      <field name="ft_t_laan.annex_negotn_instruc_dte" dataType="DATETIME" label="annex_instrcn_dte"/>  
      <field name="ft_t_laan.annex_aprvl_dte" dataType="DATETIME"/>  
      <field name="ft_t_laan.annex_amend_desc" dataType="STRING"/>  
  <!--  <field name="ft_t_laan.col_disp_ind" dataType="STRING"/> -->
    </inputFields>  
    <where> 
      <field name="ft_t_laan.annex_modl_typ" dataType="STRING" value="REPO"/> 
    </where> 
  </occurrence>  
  <occurrence table="ft_t_gncm" id="LAGRGNCMCRSPTYDF" parentId="LAGRREPO" dbConstraint="LAGRGNCMCSTM" autoCreate="false"> 
    <where> 
      <field name="ft_t_gncm.comm_reas_mnem" dataType="STRING" value="CRSPTYDF"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_gncm.cmnt_txt" dataType="STRING"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_gncm.created_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_gncm.gncm_tbl_typ" dataType="STRING" value="LAGR"/>  
      <field name="ft_t_gncm.ln_num" dataType="NUMBER" value="1"/> 
    </defaultFields> 
  </occurrence>  
  <occurrence table="ft_t_gncm" id="LAGRGNCMSETOFFPR" parentId="LAGRREPO" dbConstraint="LAGRGNCMCSTM" autoCreate="false"> 
    <where> 
      <field name="ft_t_gncm.comm_reas_mnem" dataType="STRING" value="SETOFFPR"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_gncm.cmnt_txt" dataType="STRING"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_gncm.created_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_gncm.gncm_tbl_typ" dataType="STRING" value="LAGR"/>  
      <field name="ft_t_gncm.ln_num" dataType="NUMBER" value="1"/> 
    </defaultFields> 
  </occurrence>  
  <occurrence table="ft_t_gncm" id="LAGRGNCMMULTI" parentId="LAGRREPO" dbConstraint="LAGRGNCMCSTM" autoCreate="false"> 
    <where> 
      <field name="ft_t_gncm.comm_reas_mnem" dataType="STRING" value="MULTI"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_gncm.cmnt_txt" dataType="STRING"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_gncm.created_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_gncm.gncm_tbl_typ" dataType="STRING" value="LAGR"/>  
      <field name="ft_t_gncm.ln_num" dataType="NUMBER" value="1"/> 
    </defaultFields> 
  </occurrence>  
  <occurrence table="ft_t_ccrf" id="LAGRCCRFINSTRUCT" parentId="LAGRREPO" dbConstraint="ccrff024" autoCreate="false"> 
    <defaultFields> 
      <field name="ft_t_ccrf.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_ccrf.cross_ref_purp_typ" dataType="STRING" value="INSTRUCT"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_ccrf.empl_oid" dataType="STRING"/> 
    </inputFields> 
  </occurrence>  
  <occurrence table="ft_t_ccrf" id="LAGRCCRFINTRLGAL" parentId="LAGRREPO" dbConstraint="ccrff024" autoCreate="false"> 
    <defaultFields> 
      <field name="ft_t_ccrf.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_ccrf.cross_ref_purp_typ" dataType="STRING" value="INTRLGAL"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_ccrf.empl_oid" dataType="STRING"/> 
    </inputFields> 
  </occurrence>  
  <occurrence table="ft_t_ccrf" id="LAGRCCRFTERMINTN" parentId="LAGRREPO" dbConstraint="ccrff024" autoCreate="false"> 
    <defaultFields> 
      <field name="ft_t_ccrf.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_ccrf.cross_ref_purp_typ" dataType="STRING" value="TERMINTN"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_ccrf.empl_oid" dataType="STRING"/> 
    </inputFields> 
  </occurrence>  
  <occurrence table="ft_t_ccrf" id="LAGRCCRFTERMLGAL" parentId="LAGRREPO" dbConstraint="ccrff024" autoCreate="false"> 
    <defaultFields> 
      <field name="ft_t_ccrf.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_ccrf.empl_oid" dataType="STRING"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_ccrf.cross_ref_purp_typ" dataType="STRING" value="TERMLGAL"/> 
    </where> 
  </occurrence>  
  <occurrence table="ft_t_gncm" id="LAGRGNCMCADUNDEFINED" parentId="LAGRREPO" dbConstraint="LAGRGNCMCSTM" autoCreate="false"> 
    <where> 
      <field name="ft_t_gncm.comm_reas_mnem" dataType="STRING" value="CADUNDEF"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_gncm.cmnt_txt" dataType="STRING"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_gncm.created_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_gncm.gncm_tbl_typ" dataType="STRING" value="LAGR"/>  
      <field name="ft_t_gncm.ln_num" dataType="NUMBER" value="1"/> 
    </defaultFields> 
  </occurrence>  
  <occurrence table="ft_t_flar" id="FLARPRINCOVD" multiple="true" parentId="LAGRREPO"> 
    <defaultFields> 
      <field name="ft_t_flar.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_flar.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_flar.inst_mnem" dataType="STRING"/>  
      <field name="ft_t_flar.data_stat_typ" dataType="STRING"/>  
      <field name="ft_t_flar.data_src_id" dataType="STRING"/>  
      <field name="ft_t_flar.thshld_accel_camt" dataType="STRING"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_flar.rl_typ" dataType="STRING" value="PRINCOVD"/> 
    </where> 
  </occurrence> 
<relations><table name="FT_T_GNCM"><relation relatedTable="FT_T_LAGR" name="LAGRGNCMCSTM">
      <fromColumns>
        <column name="CROSS_REF_ID"/>
      </fromColumns>
      <toColumns>
        <column name="LEG_AGRMNT_ID"/>
      </toColumns>
      <condition>
        <sql>#FROM_TABLE#.GNCM_TBL_TYP = ''LAGR''</sql>
      </condition>
    </relation></table></relations></model>' WHERE modl_id ='LAGRREPO' AND modl_typ = 'MHILAGR';	



UPDATE FT_T_MDDF SET modl_schema ='<?xml version="1.0" encoding="UTF-8"?>
<model xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="../../schemas/Model.xsd" id="MHILAGR" headerInfoXPath="concat(''Legal Agreement - '',/root/lagr.agrmnt_desc)">  
  <occurrence id="MHILAGR" table="ft_t_lagr" autoCreate="false"> 
    <inputFields> 
      <field name="ft_t_lagr.agrmnt_typ" dataType="STRING"/>  
      <field name="ft_t_lagr.agrmnt_amend_dte" dataType="DATETIME"/>  
      <field name="ft_t_lagr.agrmnt_desc" dataType="STRING"/>  
      <field name="ft_t_lagr.agrmnt_loc_txt" dataType="STRING"/>  
      <field name="ft_t_lagr.agrmnt_sign_dte" dataType="DATETIME"/>  
      <field name="ft_t_lagr.agrmnt_stat_typ" dataType="STRING"/>  
      <field name="ft_t_lagr.agrmnt_stat_tms" dataType="DATETIME"/>  
      <field name="ft_t_lagr.agrmnt_amend_desc" dataType="STRING"/>  
      <field name="ft_t_lagr.agrmnt_aprvl_dte" dataType="DATETIME"/>  
      <field name="ft_t_lagr.agrmnt_cmnt_txt" dataType="STRING"/>  
      <field name="ft_t_lagr.agrmnt_negotn_instruc_dte" dataType="DATETIME" label="agrmnt_instrcn_dte"/>  
      <field name="ft_t_lagr.agrmnt_termintn_dte" dataType="DATETIME"/>  
      <field name="ft_t_lagr.agrmnt_version_id" dataType="NUMBER" label="agrmnt_version"/>  
      <field name="ft_t_lagr.leg_juris_nme" dataType="STRING"/>  
      <field name="ft_t_lagr.legal_opinion_ind" dataType="STRING"/>  
      <field name="ft_t_lagr.ev_dflt_curr_cde" dataType="STRING"/>  
      <field name="ft_t_lagr.org_id" dataType="STRING"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_lagr.created_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_lagr.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_lagr.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_lagr.doc_eff_dte_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_lagr.agrmnt_purp_typ" dataType="STRING" value="LEGAGRMT"/>        
      <field name="ft_t_lagr.legal_opinion_ind" dataType="STRING" value="Y"/> 
    </defaultFields>  
    <validationRules> 
      <!--<rule id="Maturity_band_To_range" pageName="MHILAGR_SpeedScreen"> 
        <xPath value="count(/root/FinancialInstitutionAgreementRoles/FinancialInstitutionAgreementRole[string(@status)!=''deleted'' and flar.rl_typ=''CPTY'']/FLARLAAPs/FLARLAAP/FTTLACDs/FTTLACD[string(@status)!=''deleted'' and lacd.iss_typ=''BOND'' and string-length(lacd.maturity_rule_max_txt)=0]) < =0 "/>  
        <errorMessage value="&quot;Maturity Band To&quot; field can not be left blank. Please use and/or 99 to indicate the outer bound."/> 
      </rule>-->  
      <rule id="Agreement_signed" pageName="MHILAGR_SpeedScreen"> 
        <xPath value="not(boolean(string(/root[lagr.agrmnt_stat_typ[string(@status)=''modified'' and string(@original)=''SIGNED'' ]]/lagr.agrmnt_stat_typ/text())=''INNEGTION''))"/>  
        <errorMessage value="Master agreement status can not be changed from &quot;Signed&quot; to &quot;In Negotiation&quot;"/> 
      </rule>  
      <rule id="Agreement_signed1" pageName="MHILAGR_SpeedScreen"> 
        <xPath value="not(boolean(string(/root[lagr.agrmnt_stat_typ[string(@status)=''modified'' and string(@original)=''SIGNED'' ]]/lagr.agrmnt_stat_typ/text())=''NEGONHLD''))"/>  
        <errorMessage value="Master agreement status can not be changed from &quot;Signed&quot; to &quot;Negotiation On Hold&quot;"/> 
      </rule>  
      <rule id="ISDATerminateDate"> 
        <xPath value="boolean((./lagr.agrmnt_stat_typ=''TERMNTED'' and string(./lagr.agrmnt_termintn_dte)) or (./lagr.agrmnt_stat_typ!=''TERMNTED'' and not(string(./lagr.agrmnt_termintn_dte))))"/>  
        <errorMessage value="Master Agreement Status not Terminated but Date of Termination is populated. Please rectify"/> 
      </rule> 
    </validationRules> 
  </occurrence>  
  <occurrence table="ft_t_laan" id="LAGRLAAN" parentId="MHILAGR" label="AgreementAnnexures" autoCreate="false"> 
    <defaultFields> 
      <field name="ft_t_laan.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_laan.data_stat_typ" dataType="STRING" value="ACTIVE"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_laan.annex_typ" dataType="STRING"/>  
      <field name="ft_t_laan.annex_sign_dte" dataType="DATETIME"/>  
      <field name="ft_t_laan.bi_lateral_ind" dataType="STRING"/>  
      <field name="ft_t_laan.annex_curr_cde" dataType="STRING"/>  
      <field name="ft_t_laan.annex_ammend_dte" dataType="DATETIME" label="annex_version"/>  
      <field name="ft_t_laan.annex_id" dataType="NUMBER"/>  
      <field name="ft_t_laan.annex_termintn_dte" dataType="DATETIME"/>  
      <field name="ft_t_laan.annex_stat_typ" dataType="STRING"/>  
      <field name="ft_t_laan.annex_negotn_instruc_dte" dataType="DATETIME" label="annex_instrcn_dte"/>  
      <field name="ft_t_laan.annex_aprvl_dte" dataType="DATETIME"/>  
      <field name="ft_t_laan.annex_amend_desc" dataType="STRING"/>  
      <!--  <field name="ft_t_laan.col_disp_ind" dataType="STRING"/> -->  
      <field name="ft_t_laan.end_tms" dataType="DATETIME"/>  
      <field name="ft_t_laan.last_chg_tms" dataType="DATETIME"/>  
      <field name="ft_t_laan.last_chg_usr_id" dataType="STRING"/>  
      <field name="ft_t_laan.start_tms" dataType="DATETIME"/>  
      <field name="ft_t_laan.data_stat_typ" dataType="STRING"/>  
      <field name="ft_t_laan.data_src_id" dataType="STRING"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_laan.annex_modl_typ" dataType="STRING" value="CSA"/> 
    </where> 
  </occurrence>  
  <occurrence table="ft_t_flar" id="FLARMHI" parentId="MHILAGR"> 
    <inputFields> 
      <field name="ft_t_flar.auto_termin_ev_appls_ind" dataType="STRING"/>  
      <field name="ft_t_flar.cem_applies_ind" dataType="STRING"/>  
      <field name="ft_t_flar.ed_ate_appls_ind" dataType="STRING"/>  
      <field name="ft_t_flar.thshld_cpct" dataType="NUMBER"/>  
      <field name="ft_t_flar.thshld_comp_typ" dataType="STRING"/>  
      <field name="ft_t_flar.thshld_curr_cde" dataType="STRING"/>  
      <field name="ft_t_flar.thshld_oper_typ" dataType="STRING"/>  
      <field name="ft_t_flar.thshld_accel_camt" dataType="NUMBER"/>  
      <field name="ft_t_flar.inst_mnem" dataType="STRING"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_flar.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_flar.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_flar.rl_typ" dataType="STRING" value="MIZUHO"/> 
    </where> 
  </occurrence>  
  <occurrence table="ft_t_flar" id="FLARCPTY" parentId="MHILAGR"> 
    <inputFields> 
      <field name="ft_t_flar.auto_termin_ev_appls_ind" dataType="STRING"/>  
      <field name="ft_t_flar.cem_applies_ind" dataType="STRING"/>  
      <field name="ft_t_flar.ed_ate_appls_ind" dataType="STRING"/>  
      <field name="ft_t_flar.thshld_cpct" dataType="NUMBER"/>  
      <field name="ft_t_flar.thshld_comp_typ" dataType="STRING"/>  
      <field name="ft_t_flar.thshld_curr_cde" dataType="STRING"/>  
      <field name="ft_t_flar.thshld_oper_typ" dataType="STRING"/>  
      <field name="ft_t_flar.thshld_accel_camt" dataType="NUMBER"/>  
      <field name="ft_t_flar.inst_mnem" dataType="STRING"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_flar.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_flar.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_flar.rl_typ" dataType="STRING" value="CPTY"/> 
    </where> 
  </occurrence>  
  <occurrence table="ft_t_ccrf" id="LAGRCCRFINSTRUCT" parentId="MHILAGR" dbConstraint="ccrff024" autoCreate="false"> 
    <defaultFields> 
      <field name="ft_t_ccrf.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_ccrf.cross_ref_purp_typ" dataType="STRING" value="INSTRUCT"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_ccrf.empl_oid" dataType="STRING"/> 
    </inputFields> 
  </occurrence>  
  <!--<occurrence table="ft_t_ccrf" id="LAANCCRFINSTRUCT" parentId="LAGRLAAN"> 
    <where> 
      <field name="ft_t_ccrf.cross_ref_purp_typ" dataType="STRING" value="INSTRUCT"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_ccrf.cntl_cross_ref_oid" dataType="STRING" valueOfFunction="OID"/>  
      <field name="ft_t_ccrf.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_ccrf.empl_oid" dataType="STRING"/> 
    </inputFields> 
  </occurrence>  
  <occurrence table="ft_t_ccrf" id="LAANCCRFINTRLGAL" parentId="LAGRLAAN"> 
    <defaultFields> 
      <field name="ft_t_ccrf.cntl_cross_ref_oid" dataType="STRING" valueOfFunction="OID"/>  
      <field name="ft_t_ccrf.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_ccrf.cross_ref_purp_typ" dataType="STRING" value="INTRLGAL"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_ccrf.empl_oid" dataType="STRING"/> 
    </inputFields> 
  </occurrence>  
  -->  
  <occurrence table="ft_t_ccrf" id="LAGRCCRFINTRLGAL" parentId="MHILAGR" dbConstraint="ccrff024" autoCreate="false"> 
    <defaultFields> 
      <field name="ft_t_ccrf.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_ccrf.cross_ref_purp_typ" dataType="STRING" value="INTRLGAL"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_ccrf.empl_oid" dataType="STRING"/> 
    </inputFields> 
  </occurrence>  
  <occurrence table="ft_t_laap" id="MHIFLARLAAP" parentId="FLARMHI" label="AnnexureParticipantsMHI" autoCreate="false"> 
    <defaultFields> 
      <field name="ft_t_laap.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_laap.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_laap.laan_oid" dataType="STRING" srcOccurrence="LAGRLAAN" valueOf="ft_t_laan.laan_oid" keepInSync="true"/>        
      <field name="ft_t_laap.laap_oid" dataType="STRING" valueOfFunction="OID"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_laap.independent_coll_camt" dataType="NUMBER"/>  
      <field name="ft_t_laap.governing_law_cntry_cde" dataType="STRING"/>  
      <field name="ft_t_laap.annex_prt_curr_cde" dataType="STRING"/>  
      <field name="ft_t_laap.last_chg_tms" dataType="DATETIME"/>  
      <field name="ft_t_laap.thshld_meth_txt" dataType="STRING" label="independent_meth_txt"/>  
      <field name="ft_t_laap.thshld_meth_stat_tms" dataType="DATETIME" label="independant_stat_tms"/>  
      <field name="ft_t_laap.laap_oid" dataType="STRING"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_laap.annex_prt_modl_typ" dataType="STRING" value="CSA"/> 
    </where> 
  </occurrence>  
  <occurrence table="ft_t_laap" id="CPTYFLARLAAP" parentId="FLARCPTY" label="AnnexureParticipantsCPTY" autoCreate="false"> 
    <defaultFields> 
      <field name="ft_t_laap.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_laap.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_laap.laan_oid" dataType="STRING" srcOccurrence="LAGRLAAN" valueOf="ft_t_laan.laan_oid" keepInSync="true"/>  
       
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_laap.annex_prt_curr_cde" dataType="STRING"/>  
      <field name="ft_t_laap.governing_law_cntry_cde" dataType="STRING"/>  
      <field name="ft_t_laap.independent_coll_camt" dataType="NUMBER"/>  
      <field name="ft_t_laap.last_chg_tms" dataType="DATETIME"/>  
      <field name="ft_t_laap.thshld_meth_txt" dataType="STRING" label="independent_meth_txt"/>  
      <field name="ft_t_laap.thshld_meth_stat_tms" dataType="DATETIME" label="independant_stat_tms"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_laap.annex_prt_modl_typ" dataType="STRING" value="CSA"/> 
    </where> 
  </occurrence>  
  <occurrence table="ft_t_ccrf" id="LAGRCCRFTERMINTN" parentId="MHILAGR" dbConstraint="ccrff024" autoCreate="false"> 
    <defaultFields> 
      <field name="ft_t_ccrf.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_ccrf.cross_ref_purp_typ" dataType="STRING" value="TERMINTN"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_ccrf.empl_oid" dataType="STRING"/> 
    </inputFields> 
  </occurrence>  
  <occurrence table="ft_t_ccrf" id="LAGRCCRFTERMLGAL" parentId="MHILAGR" dbConstraint="ccrff024" autoCreate="false"> 
    <defaultFields> 
      <field name="ft_t_ccrf.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_ccrf.empl_oid" dataType="STRING"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_ccrf.cross_ref_purp_typ" dataType="STRING" value="TERMLGAL"/> 
    </where> 
  </occurrence>  
  <occurrence table="ft_t_ccrf" id="LAANCCRFTERMINTN" parentId="LAGRLAAN"> 
    <defaultFields> 
      <field name="ft_t_ccrf.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_ccrf.cross_ref_purp_typ" dataType="STRING" value="TERMINTN"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_ccrf.empl_oid" dataType="STRING"/> 
    </inputFields> 
  </occurrence>  
  <occurrence table="ft_t_ccrf" id="LAANCCRFTERMLGAL" parentId="LAGRLAAN"> 
    <defaultFields> 
      <field name="ft_t_ccrf.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_ccrf.cross_ref_purp_typ" dataType="STRING" value="TERMLGAL"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_ccrf.empl_oid" dataType="STRING"/> 
    </inputFields> 
  </occurrence>  
  <occurrence table="ft_t_laip" id="AGRMNTLAIP" parentId="FLARCPTY"> 
    <defaultFields> 
      <field name="ft_t_laip.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_laip.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_laip.netting_desc" dataType="STRING"/>  
      <field name="ft_t_laip.netting_typ" dataType="STRING" label="trn_py_netting"/>  
      <field name="ft_t_laip.netting_applies_ind" dataType="STRING"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_laip.agrmnt_invl_party_typ" dataType="STRING" value="CPTY"/> 
    </where> 
  </occurrence>  
  <occurrence table="ft_t_gncm" id="GNCMMHISC5A5" parentId="FLARMHI" dbConstraint="FLARGNCMCSTM"> 
    <where> 
      <field name="ft_t_gncm.comm_reas_mnem" dataType="STRING" value="SECTN5A5"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_gncm.cmnt_txt" dataType="STRING"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_gncm.created_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_gncm.gncm_tbl_typ" dataType="STRING" value="FLAR"/>  
      <field name="ft_t_gncm.ln_num" dataType="NUMBER" value="1"/> 
    </defaultFields> 
  </occurrence>  
  <occurrence table="ft_t_gncm" id="GNCMMHISC5A6" parentId="FLARMHI" dbConstraint="FLARGNCMCSTM"> 
    <where> 
      <field name="ft_t_gncm.comm_reas_mnem" dataType="STRING" value="SECTN5A6"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_gncm.cmnt_txt" dataType="STRING"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_gncm.created_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_gncm.gncm_tbl_typ" dataType="STRING" value="FLAR"/>  
      <field name="ft_t_gncm.ln_num" dataType="NUMBER" value="1"/> 
    </defaultFields> 
  </occurrence>  
  <occurrence table="ft_t_gncm" id="GNCMMHISC5A7" parentId="FLARMHI" dbConstraint="FLARGNCMCSTM"> 
    <where> 
      <field name="ft_t_gncm.comm_reas_mnem" dataType="STRING" value="SECTN5A7"/>  
      <field name="ft_t_gncm.ln_num" dataType="NUMBER" value="1"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_gncm.cmnt_txt" dataType="STRING"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_gncm.created_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_gncm.gncm_tbl_typ" dataType="STRING" value="FLAR"/> 
    </defaultFields> 
  </occurrence>  
  <occurrence table="ft_t_gncm" id="GNCMMHISC5B4" parentId="FLARMHI" dbConstraint="FLARGNCMCSTM"> 
    <defaultFields> 
      <field name="ft_t_gncm.ln_num" dataType="NUMBER" value="1"/>  
      <field name="ft_t_gncm.gncm_tbl_typ" dataType="STRING" value="FLAR"/>  
      <field name="ft_t_gncm.created_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_gncm.cmnt_txt" dataType="STRING"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_gncm.comm_reas_mnem" dataType="STRING" value="SECTN5B4"/> 
    </where> 
  </occurrence>  
  <occurrence table="ft_t_gncm" id="GNCMCPTYSC5A5" parentId="FLARCPTY" dbConstraint="FLARGNCMCSTM"> 
    <where> 
      <field name="ft_t_gncm.comm_reas_mnem" dataType="STRING" value="SECTN5A5"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_gncm.cmnt_txt" dataType="STRING"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_gncm.created_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_gncm.gncm_tbl_typ" dataType="STRING" value="FLAR"/>  
      <field name="ft_t_gncm.ln_num" dataType="NUMBER" value="1"/> 
    </defaultFields> 
  </occurrence>  
  <occurrence table="ft_t_gncm" id="GNCMCPTYSC5A6" parentId="FLARCPTY" dbConstraint="FLARGNCMCSTM"> 
    <defaultFields> 
      <field name="ft_t_gncm.ln_num" dataType="NUMBER" value="1"/>  
      <field name="ft_t_gncm.gncm_tbl_typ" dataType="STRING" value="FLAR"/>  
      <field name="ft_t_gncm.created_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_gncm.comm_reas_mnem" dataType="STRING" value="SECTN5A6"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_gncm.cmnt_txt" dataType="STRING"/> 
    </inputFields> 
  </occurrence>  
  <occurrence table="ft_t_gncm" id="GNCMCPTYSC5A7" parentId="FLARCPTY" dbConstraint="FLARGNCMCSTM"> 
    <where> 
      <field name="ft_t_gncm.comm_reas_mnem" dataType="STRING" value="SECTN5A7"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_gncm.cmnt_txt" dataType="STRING"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_gncm.created_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_gncm.gncm_tbl_typ" dataType="STRING" value="FLAR"/>  
      <field name="ft_t_gncm.ln_num" dataType="NUMBER" value="1"/> 
    </defaultFields> 
  </occurrence>  
  <occurrence table="ft_t_gncm" id="GNCMCPTYSC5B4" parentId="FLARCPTY" dbConstraint="FLARGNCMCSTM"> 
    <defaultFields> 
      <field name="ft_t_gncm.ln_num" dataType="NUMBER" value="1"/>  
      <field name="ft_t_gncm.gncm_tbl_typ" dataType="STRING" value="FLAR"/>  
      <field name="ft_t_gncm.created_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_gncm.comm_reas_mnem" dataType="STRING" value="SECTN5B4"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_gncm.cmnt_txt" dataType="STRING"/> 
    </inputFields> 
  </occurrence>  
  <occurrence table="ft_t_lacd" id="FLARMHILACD" parentId="FLARMHI" autoDelete="true"> 
    <defaultFields> 
      <field name="ft_t_lacd.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_lacd.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_lacd.flar_oid" dataType="STRING" srcOccurrence="FLARMHI" valueOf="ft_t_flar.flar_oid"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_lacd.guarantor_inst_mnem" dataType="STRING"/> 
    </inputFields> 
  </occurrence>  
  <occurrence table="ft_t_lacd" id="FLARCPTYLACD" parentId="FLARCPTY" autoDelete="true"> 
    <defaultFields> 
      <field name="ft_t_lacd.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_lacd.data_stat_typ" dataType="STRING" value="ACTIVE"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_lacd.guarantor_inst_mnem" dataType="STRING"/> 
    </inputFields> 
  </occurrence>  
  <occurrence table="ft_t_gncm" id="GNCMMHICSDOCLNK" parentId="FLARMHI" dbConstraint="FLARGNCMCSTM"> 
    <where> 
      <field name="ft_t_gncm.comm_reas_mnem" dataType="STRING" value="CSDOCLNK"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_gncm.cmnt_txt" dataType="STRING"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_gncm.created_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_gncm.gncm_tbl_typ" dataType="STRING" value="FLAR"/>  
      <field name="ft_t_gncm.ln_num" dataType="NUMBER" value="1"/> 
    </defaultFields> 
  </occurrence>  
  <occurrence table="ft_t_gncm" id="GNCMMHICSDOCDT" parentId="FLARMHI" dbConstraint="FLARGNCMCSTM"> 
    <defaultFields> 
      <field name="ft_t_gncm.ln_num" dataType="NUMBER" value="1"/>  
      <field name="ft_t_gncm.gncm_tbl_typ" dataType="STRING" value="FLAR"/>  
      <field name="ft_t_gncm.created_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_gncm.comm_reas_mnem" dataType="STRING" value="CSDOCDT"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_gncm.cmnt_txt" dataType="STRING"/> 
    </inputFields> 
  </occurrence>  
  <occurrence table="ft_t_gncm" id="GNCMCPTYCSDOCLNK" parentId="FLARCPTY" dbConstraint="FLARGNCMCSTM"> 
    <where> 
      <field name="ft_t_gncm.comm_reas_mnem" dataType="STRING" value="CSDOCLNK"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_gncm.cmnt_txt" dataType="STRING"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_gncm.created_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_gncm.gncm_tbl_typ" dataType="STRING" value="FLAR"/>  
      <field name="ft_t_gncm.ln_num" dataType="NUMBER" value="1"/> 
    </defaultFields> 
  </occurrence>  
  <occurrence table="ft_t_gncm" id="GNCMCPTYCSDOCDT" parentId="FLARCPTY" dbConstraint="FLARGNCMCSTM"> 
    <defaultFields> 
      <field name="ft_t_gncm.ln_num" dataType="NUMBER" value="1"/>  
      <field name="ft_t_gncm.gncm_tbl_typ" dataType="STRING" value="FLAR"/>  
      <field name="ft_t_gncm.created_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_gncm.comm_reas_mnem" dataType="STRING" value="CSDOCDT"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_gncm.cmnt_txt" dataType="STRING"/> 
    </inputFields> 
  </occurrence>  
  <occurrence table="ft_t_gncm" id="GNCMMHIATEVENT" parentId="FLARMHI" dbConstraint="FLARGNCMCSTM"> 
    <defaultFields> 
      <field name="ft_t_gncm.ln_num" dataType="NUMBER" value="1"/>  
      <field name="ft_t_gncm.gncm_tbl_typ" dataType="STRING" value="FLAR"/>  
      <field name="ft_t_gncm.created_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_gncm.cmnt_txt" dataType="STRING"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_gncm.comm_reas_mnem" dataType="STRING" value="ATEVENT"/> 
    </where> 
  </occurrence>  
  <occurrence table="ft_t_gncm" id="GNCMCPTYATEVENT" parentId="FLARCPTY" dbConstraint="FLARGNCMCSTM"> 
    <where> 
      <field name="ft_t_gncm.comm_reas_mnem" dataType="STRING" value="ATEVENT"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_gncm.cmnt_txt" dataType="STRING"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_gncm.created_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_gncm.gncm_tbl_typ" dataType="STRING" value="FLAR"/>  
      <field name="ft_t_gncm.ln_num" dataType="NUMBER" value="1"/> 
    </defaultFields> 
  </occurrence>  
  <occurrence table="ft_t_gncm" id="GNCMCPTYCEMDESC" parentId="FLARCPTY" dbConstraint="FLARGNCMCSTM"> 
    <defaultFields> 
      <field name="ft_t_gncm.ln_num" dataType="NUMBER" value="1"/>  
      <field name="ft_t_gncm.gncm_tbl_typ" dataType="STRING" value="FLAR"/>  
      <field name="ft_t_gncm.created_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_gncm.cmnt_txt" dataType="STRING"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_gncm.comm_reas_mnem" dataType="STRING" value="CEMDESC"/> 
    </where> 
  </occurrence>  
  <occurrence table="ft_t_gncm" id="GNCMMHICEMDESC" parentId="FLARMHI" dbConstraint="FLARGNCMCSTM"> 
    <where> 
      <field name="ft_t_gncm.comm_reas_mnem" dataType="STRING" value="CEMDESC"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_gncm.cmnt_txt" dataType="STRING"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_gncm.created_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_gncm.gncm_tbl_typ" dataType="STRING" value="FLAR"/>  
      <field name="ft_t_gncm.ln_num" dataType="NUMBER" value="1"/> 
    </defaultFields> 
  </occurrence>  
  <occurrence table="ft_t_laat" id="FLARLAATMHI" parentId="MHIFLARLAAP" autoCreate="true"> 
    <defaultFields> 
      <field name="ft_t_laat.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
      <field name="ft_t_laat.dlv_rnd_meth_typ" dataType="STRING" value="Up"/>  
      <field name="ft_t_laat.ret_rnd_meth_txt" dataType="STRING" value="Down"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_laat.min_tsfr_camt" dataType="NUMBER"/>  
      <field name="ft_t_laat.ret_rnd_camt" dataType="NUMBER"/>  
      <field name="ft_t_laat.thshld_camt" dataType="NUMBER"/>  
      <field name="ft_t_laat.thshld_val_fq_sp_typ" dataType="STRING"/>  
      <field name="ft_t_laat.last_chg_tms" dataType="DATETIME"/>  
      <field name="ft_t_laat.min_tsfr_meth_txt" dataType="STRING"/>  
      <field name="ft_t_laat.thshld_meth_txt" dataType="STRING"/>  
      <field name="ft_t_laat.mta_stat_tms" dataType="DATETIME"/>  
      <field name="ft_t_laat.thshld_stat_tms" dataType="DATETIME"/>  
      <field name="ft_t_laat.dlv_rnd_meth_typ" dataType="STRING"/>  
      <field name="ft_t_laat.ret_rnd_meth_txt" dataType="STRING"/> 
    </inputFields>  
    <where> 
    <!--  <field name="ft_t_laat.annex_modl_typ" dataType="STRING" value="CSA"/> -->
    </where> 
  </occurrence>  
  <occurrence table="ft_t_laat" id="FLARLAATCPTY" parentId="CPTYFLARLAAP"> 
    <defaultFields> 
      <field name="ft_t_laat.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_laat.thshld_meth_txt" dataType="STRING" value="Fixed Amount"/>      
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_laat.ret_rnd_camt" dataType="NUMBER"/>  
      <field name="ft_t_laat.min_tsfr_camt" dataType="NUMBER"/>  
      <field name="ft_t_laat.thshld_camt" dataType="NUMBER"/>  
      <field name="ft_t_laat.thshld_val_fq_sp_typ" dataType="STRING"/>  
      <field name="ft_t_laat.last_chg_tms" dataType="DATETIME"/>  
      <field name="ft_t_laat.min_tsfr_meth_txt" dataType="STRING"/>  
      <field name="ft_t_laat.thshld_meth_txt" dataType="STRING"/>  
      <field name="ft_t_laat.mta_stat_tms" dataType="DATETIME"/>  
      <field name="ft_t_laat.thshld_stat_tms" dataType="DATETIME"/> 
    </inputFields>  
    <where> 
    <!--  <field name="ft_t_laat.annex_modl_typ" dataType="STRING" value="CSA"/> -->
    </where> 
  </occurrence>  
  <occurrence table="ft_t_rtg1" id="LAATRTG1MHIMTA" parentId="FLARLAATMHI" multiple="true"> 
    <inputFields> 
      <field name="ft_t_rtg1.rtng_cde" dataType="STRING"/>  
      <field name="ft_t_rtg1.rtng_srce_typ" dataType="STRING"/>  
      <field name="ft_t_rtg1.rtng_camt" dataType="NUMBER"/>  
      <field name="ft_t_rtg1.min_rtng_cde" dataType="STRING"/>  
      <field name="ft_t_rtg1.min_rtng_cde_rank" dataType="NUMBER"/>  
      <field name="ft_t_rtg1.rtng_cde_rank" dataType="NUMBER"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_rtg1.rtng_grid_purp_typ" dataType="STRING" value="MTA"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_rtg1.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_rtg1.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_rtg1.rtng_cde" dataType="STRING"/>  
      <field name="ft_t_rtg1.rtng_cde_rank" dataType="NUMBER"/> 
    </defaultFields> 
  </occurrence>  
  <occurrence table="ft_t_rtg1" id="LAATRTG1MHITHSHLD" parentId="FLARLAATMHI" multiple="true"> 
    <inputFields> 
      <field name="ft_t_rtg1.rtng_cde" dataType="STRING"/>  
      <field name="ft_t_rtg1.rtng_camt" dataType="NUMBER"/>  
      <field name="ft_t_rtg1.rtng_srce_typ" dataType="STRING"/>  
      <field name="ft_t_rtg1.min_rtng_cde" dataType="STRING"/>  
      <field name="ft_t_rtg1.min_rtng_cde_rank" dataType="NUMBER"/>  
      <field name="ft_t_rtg1.rtng_cde_rank" dataType="NUMBER"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_rtg1.rtng_grid_purp_typ" dataType="STRING" value="THSHLD"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_rtg1.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_rtg1.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_rtg1.rtng_cde_rank" dataType="NUMBER"/>  
      <field name="ft_t_rtg1.rtng_cde" dataType="STRING"/> 
    </defaultFields> 
  </occurrence>  
  <occurrence table="ft_t_rtg1" id="LAAPRTG1MHIINDPTAMT" parentId="MHIFLARLAAP" multiple="true"> 
    <inputFields> 
      <field name="ft_t_rtg1.rtng_cde" dataType="STRING"/>  
      <field name="ft_t_rtg1.rtng_camt" dataType="NUMBER"/>  
      <field name="ft_t_rtg1.rtng_srce_typ" dataType="STRING"/>  
      <field name="ft_t_rtg1.min_rtng_cde" dataType="STRING"/>  
      <field name="ft_t_rtg1.min_rtng_cde_rank" dataType="NUMBER"/>  
      <field name="ft_t_rtg1.rtng_cde_rank" dataType="NUMBER"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_rtg1.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_rtg1.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_rtg1.rtng_cde_rank" dataType="NUMBER"/>  
      <field name="ft_t_rtg1.rtng_cde" dataType="STRING"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_rtg1.rtng_grid_purp_typ" dataType="STRING" value="INDPTAMT"/> 
    </where> 
  </occurrence>  
  <occurrence table="ft_t_rtg1" id="LAAPRTG1CPTYINDPTAMT" parentId="CPTYFLARLAAP" multiple="true"> 
    <inputFields> 
      <field name="ft_t_rtg1.rtng_cde" dataType="STRING"/>  
      <field name="ft_t_rtg1.rtng_camt" dataType="NUMBER"/>  
      <field name="ft_t_rtg1.rtng_srce_typ" dataType="STRING"/>  
      <field name="ft_t_rtg1.min_rtng_cde" dataType="STRING"/>  
      <field name="ft_t_rtg1.min_rtng_cde_rank" dataType="NUMBER"/>  
      <field name="ft_t_rtg1.rtng_cde_rank" dataType="NUMBER"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_rtg1.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_rtg1.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_rtg1.rtng_cde_rank" dataType="NUMBER"/>  
      <field name="ft_t_rtg1.rtng_cde" dataType="STRING"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_rtg1.rtng_grid_purp_typ" dataType="STRING" value="INDPTAMT"/> 
    </where> 
  </occurrence>  
  <occurrence table="ft_t_rtg1" id="LAATRTG1CPTYMTA" parentId="FLARLAATCPTY" multiple="true"> 
    <inputFields> 
      <field name="ft_t_rtg1.rtng_cde" dataType="STRING"/>  
      <field name="ft_t_rtg1.rtng_camt" dataType="NUMBER"/>  
      <field name="ft_t_rtg1.rtng_srce_typ" dataType="STRING"/>  
      <field name="ft_t_rtg1.min_rtng_cde" dataType="STRING"/>  
      <field name="ft_t_rtg1.min_rtng_cde_rank" dataType="NUMBER"/>  
      <field name="ft_t_rtg1.rtng_cde_rank" dataType="NUMBER"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_rtg1.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_rtg1.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_rtg1.rtng_cde" dataType="STRING"/>  
      <field name="ft_t_rtg1.rtng_cde_rank" dataType="NUMBER"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_rtg1.rtng_grid_purp_typ" dataType="STRING" value="MTA"/> 
    </where> 
  </occurrence>  
  <occurrence table="ft_t_rtg1" id="LAATRTG1CPTYTHSHLD" parentId="FLARLAATCPTY" multiple="true"> 
    <defaultFields> 
      <field name="ft_t_rtg1.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_rtg1.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_rtg1.rtng_cde_rank" dataType="NUMBER"/>  
      <field name="ft_t_rtg1.rtng_cde" dataType="STRING"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_rtg1.rtng_cde" dataType="STRING"/>  
      <field name="ft_t_rtg1.rtng_camt" dataType="NUMBER"/>  
      <field name="ft_t_rtg1.rtng_srce_typ" dataType="STRING"/>  
      <field name="ft_t_rtg1.min_rtng_cde" dataType="STRING"/>  
      <field name="ft_t_rtg1.min_rtng_cde_rank" dataType="NUMBER"/>  
      <field name="ft_t_rtg1.rtng_cde_rank" dataType="NUMBER"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_rtg1.rtng_grid_purp_typ" dataType="STRING" value="THSHLD"/> 
    </where> 
  </occurrence>  
  <occurrence table="ft_t_gncm" id="GNCMLAAPMHIINDPTAMT" parentId="MHIFLARLAAP" dbConstraint="LAAPGNCMCSTM"> 
    <where> 
      <field name="ft_t_gncm.comm_reas_mnem" dataType="STRING" value="INDPTAMT"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_gncm.cmnt_txt" dataType="STRING"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_gncm.created_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_gncm.gncm_tbl_typ" dataType="STRING" value="LAAP"/>  
      <field name="ft_t_gncm.ln_num" dataType="NUMBER" value="1"/> 
    </defaultFields> 
  </occurrence>  
  <occurrence table="ft_t_gncm" id="GNCMLAATMHIMTA" parentId="FLARLAATMHI" dbConstraint="LAATGNCMCSTM"> 
    <where> 
      <field name="ft_t_gncm.comm_reas_mnem" dataType="STRING" value="MTA"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_gncm.cmnt_txt" dataType="STRING"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_gncm.created_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_gncm.gncm_tbl_typ" dataType="STRING" value="LAAT"/>  
      <field name="ft_t_gncm.ln_num" dataType="NUMBER" value="1"/> 
    </defaultFields> 
  </occurrence>  
  <occurrence table="ft_t_gncm" id="GNCMLAATMHITHSHLD" parentId="FLARLAATMHI" dbConstraint="LAATGNCMCSTM"> 
    <defaultFields> 
      <field name="ft_t_gncm.ln_num" dataType="NUMBER" value="1"/>  
      <field name="ft_t_gncm.gncm_tbl_typ" dataType="STRING" value="LAAT"/>  
      <field name="ft_t_gncm.created_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_gncm.cmnt_txt" dataType="STRING"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_gncm.comm_reas_mnem" dataType="STRING" value="THSHLD"/> 
    </where> 
  </occurrence>  
  <occurrence table="ft_t_gncm" id="GNCMLAAPCPTYINDPTAMT" parentId="CPTYFLARLAAP" dbConstraint="LAAPGNCMCSTM"> 
    <where> 
      <field name="ft_t_gncm.comm_reas_mnem" dataType="STRING" value="INDPTAMT"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_gncm.cmnt_txt" dataType="STRING"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_gncm.created_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_gncm.gncm_tbl_typ" dataType="STRING" value="LAAP"/>  
      <field name="ft_t_gncm.ln_num" dataType="NUMBER" value="1"/> 
    </defaultFields> 
  </occurrence>  
  <occurrence table="ft_t_gncm" id="GNCMLAATCPTYMTA" parentId="FLARLAATCPTY" dbConstraint="LAATGNCMCSTM"> 
    <defaultFields> 
      <field name="ft_t_gncm.created_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_gncm.gncm_tbl_typ" dataType="STRING" value="LAAT"/>  
      <field name="ft_t_gncm.ln_num" dataType="NUMBER" value="1"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_gncm.cmnt_txt" dataType="STRING"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_gncm.comm_reas_mnem" dataType="STRING" value="MTA"/> 
    </where> 
  </occurrence>  
  <occurrence table="ft_t_gncm" id="GNCMLAATCPTYTHSHLD" parentId="FLARLAATCPTY" dbConstraint="LAATGNCMCSTM"> 
    <where> 
      <field name="ft_t_gncm.comm_reas_mnem" dataType="STRING" value="THSHLD"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_gncm.cmnt_txt" dataType="STRING"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_gncm.created_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_gncm.gncm_tbl_typ" dataType="STRING" value="LAAT"/>  
      <field name="ft_t_gncm.ln_num" dataType="NUMBER" value="1"/> 
    </defaultFields> 
  </occurrence>  
  <occurrence table="ft_t_gncm" id="GNCMLAANANXLOGIC" parentId="LAGRLAAN" dbConstraint="LAANGNCMCSTM" multiple="true"> 
    <where> 
      <field name="ft_t_gncm.comm_reas_mnem" dataType="STRING" value="ANXLOGIC"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_gncm.cmnt_txt" dataType="STRING"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_gncm.created_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_gncm.gncm_tbl_typ" dataType="STRING" value="LAAN"/>  
      <field name="ft_t_gncm.ln_num" dataType="NUMBER" value="1"/> 
    </defaultFields> 
  </occurrence>  
  <occurrence table="ft_t_gncm" id="GNCMLAATMHIASPCTMTA" parentId="FLARLAATMHI" dbConstraint="LAATGNCMCSTM"> 
    <where> 
      <field name="ft_t_gncm.comm_reas_mnem" dataType="STRING" value="ASPCTMTA"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_gncm.cmnt_txt" dataType="STRING"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_gncm.created_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_gncm.gncm_tbl_typ" dataType="STRING" value="LAAT"/>  
      <field name="ft_t_gncm.ln_num" dataType="NUMBER" value="1"/> 
    </defaultFields> 
  </occurrence>  
  <occurrence table="ft_t_gncm" id="GNCMLAATMHIASPCTTLD" parentId="FLARLAATMHI" dbConstraint="LAATGNCMCSTM"> 
    <where> 
      <field name="ft_t_gncm.comm_reas_mnem" dataType="STRING" value="ASPCTTLD"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_gncm.cmnt_txt" dataType="STRING"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_gncm.created_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_gncm.gncm_tbl_typ" dataType="STRING" value="LAAT"/>  
      <field name="ft_t_gncm.ln_num" dataType="NUMBER" value="1"/> 
    </defaultFields> 
  </occurrence>  
  <occurrence table="ft_t_gncm" id="GNCMLAATCPTYASPCTMTA" parentId="FLARLAATCPTY" dbConstraint="LAATGNCMCSTM"> 
    <where> 
      <field name="ft_t_gncm.comm_reas_mnem" dataType="STRING" value="ASPCTMTA"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_gncm.cmnt_txt" dataType="STRING"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_gncm.created_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_gncm.gncm_tbl_typ" dataType="STRING" value="LAAT"/>  
      <field name="ft_t_gncm.ln_num" dataType="NUMBER" value="1"/> 
    </defaultFields> 
  </occurrence>  
  <occurrence table="ft_t_gncm" id="GNCMLAATCPTYASPCTTLD" parentId="FLARLAATCPTY" dbConstraint="LAATGNCMCSTM"> 
    <defaultFields> 
      <field name="ft_t_gncm.ln_num" dataType="NUMBER" value="1"/>  
      <field name="ft_t_gncm.gncm_tbl_typ" dataType="STRING" value="LAAT"/>  
      <field name="ft_t_gncm.created_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_gncm.cmnt_txt" dataType="STRING"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_gncm.comm_reas_mnem" dataType="STRING" value="ASPCTTLD"/> 
    </where> 
  </occurrence>  
  <occurrence table="ft_t_gncm" id="GNCMLAAPMHIASPCTICA" parentId="MHIFLARLAAP" dbConstraint="LAAPGNCMCSTM"> 
    <where> 
      <field name="ft_t_gncm.comm_reas_mnem" dataType="STRING" value="ASPCTICA"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_gncm.cmnt_txt" dataType="STRING"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_gncm.created_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_gncm.gncm_tbl_typ" dataType="STRING" value="LAAP"/>  
      <field name="ft_t_gncm.ln_num" dataType="NUMBER" value="1"/> 
    </defaultFields> 
  </occurrence>  
  <occurrence table="ft_t_gncm" id="GNCMLAAPCPTYASPCTICA" parentId="CPTYFLARLAAP" dbConstraint="LAAPGNCMCSTM"> 
    <where> 
      <field name="ft_t_gncm.comm_reas_mnem" dataType="STRING" value="ASPCTICA"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_gncm.cmnt_txt" dataType="STRING"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_gncm.created_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_gncm.gncm_tbl_typ" dataType="STRING" value="LAAP"/>  
      <field name="ft_t_gncm.ln_num" dataType="NUMBER" value="1"/> 
    </defaultFields> 
  </occurrence>  
  <occurrence table="ft_t_lacv" id="FLARLACVMHIINSCOPE" parentId="FLARMHI" multiple="true" dbConstraint="ft_t_lacv_f001"> 
    <inputFields> 
      <field name="ft_t_lacv.dlr_br_nme" dataType="STRING" label="brnch_nme"/>  
     <!-- <field name="ft_t_lacv.prod_id" dataType="STRING"/>  -->
      <field name="ft_t_lacv.cust_prod_nme" dataType="STRING"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_lacv.cvg_purp_typ" dataType="STRING" value="INSCOPE"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_lacv.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_lacv.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_lacv.cust_prod_nme" dataType="STRING" value="ALL"/> 
    </defaultFields> 
  </occurrence>  
  <occurrence table="ft_t_lacv" id="FLARLACVCPTY" parentId="FLARCPTY" multiple="true" dbConstraint="ft_t_lacv_f001"> 
    <defaultFields> 
      <field name="ft_t_lacv.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_lacv.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_lacv.dlr_br_nme" dataType="STRING" srcOccurrence="FLARLACVMHIINSCOPE" valueOf="ft_t_lacv.dlr_br_nme"/>  
      <field name="ft_t_lacv.cust_prod_nme" dataType="STRING" value="ALL"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_lacv.dlr_br_nme" dataType="STRING" label="brnch_nme"/>  
     <!-- <field name="ft_t_lacv.prod_id" dataType="STRING"/>  -->
      <field name="ft_t_lacv.cust_prod_nme" dataType="STRING"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_lacv.cvg_purp_typ" dataType="STRING" value="INSCOPE"/> 
    </where> 
  </occurrence>  
  <occurrence table="ft_t_lacd" id="LAAPLACDCURRENCY" parentId="CPTYFLARLAAP" multiple="true"> 
    <defaultFields> 
      <field name="ft_t_lacd.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_lacd.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_lacd.coll_curr_cde" dataType="STRING"/>  
      <field name="ft_t_lacd.haircut_cpct" dataType="NUMBER"/>  
     <!-- <field name="ft_t_lacd.intrst_crte" dataType="NUMBER"/>  -->
      <field name="ft_t_lacd.coll_ticker_id" dataType="STRING" label="ticker_cde"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_lacd.iss_typ" dataType="STRING" value="CURRENCY"/> 
    </where> 
  </occurrence>  
  <occurrence table="ft_t_lacd" id="LAAPLACDBOND" parentId="CPTYFLARLAAP" multiple="true"> 
    <defaultFields> 
      <field name="ft_t_lacd.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_lacd.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_lacd.haircut_cpct" dataType="NUMBER"/>  
      <field name="ft_t_lacd.maturity_rule_txt" dataType="STRING"/>  
      <field name="ft_t_lacd.coll_ticker_id" dataType="STRING" label="ticker_cde"/>  
    <!--  <field name="ft_t_lacd.issr_cde" dataType="STRING"/> -->
      <field name="ft_t_lacd.maturity_rule_max_txt" dataType="STRING" label="maturity_rule_txt_max"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_lacd.iss_typ" dataType="STRING" value="BOND"/> 
    </where> 
  </occurrence>  
  <occurrence table="ft_t_gunt" id="GUNTLACDBOND" parentId="LAAPLACDBOND" multiple="true">
  <inputFields>
  <field name="ft_t_gunt.gu_nme" dataType="STRING" label="issr_cde"/>
  </inputFields> 
  <where> 
      <field name="ft_t_gunt.prnt_gu_typ" dataType="STRING" value="COUNTRY"/> 
  </where> 
  </occurrence>
  <!--<occurrence table="ft_t_gncm" id="LAANGNCMTERMINTN" parentId="LAGRLAAN" dbConstraint="LAANGNCMCSTM"> 
    <defaultFields> 
      <field name="ft_t_gncm.gncm_tbl_typ" dataType="STRING" value="LAAN"/>  
      <field name="ft_t_gncm.created_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_gncm.ln_num" dataType="NUMBER" value="1"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_gncm.cmnt_txt" dataType="STRING"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_gncm.comm_reas_mnem" dataType="STRING" value="TERMINTN"/> 
    </where> 
  </occurrence>  
  <occurrence table="ft_t_gncm" id="LAANGNCMTERMLGAL" parentId="LAGRLAAN" dbConstraint="LAANGNCMCSTM"> 
    <defaultFields> 
      <field name="ft_t_gncm.ln_num" dataType="NUMBER" value="1"/>  
      <field name="ft_t_gncm.gncm_tbl_typ" dataType="STRING" value="LAAN"/>  
      <field name="ft_t_gncm.created_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_gncm.cmnt_txt" dataType="STRING"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_gncm.comm_reas_mnem" dataType="STRING" value="TERMLGAL"/> 
    </where> 
  </occurrence> 
  -->  
  <!-- <occurrence table="ft_t_ccta" id="CCTACUSTCPTY" parentId="FINSCUSTCPTY"> 
    <where> 
      <field name="ft_t_ccta.contct_rl_typ" dataType="STRING" value="LEGAL"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_ccta.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_ccta.empl_oid" dataType="STRING" srcOccurrence="EMPLCCTACPTY" valueOf="ft_t_empl.empl_oid" uiOnly="true" alwaysDefault="true"/>  
      <field name="ft_t_ccta.elec_addr_id" dataType="STRING" srcOccurrence="EADRADTPCPTY" valueOf="ft_t_eadr.elec_addr_id" uiOnly="true" alwaysDefault="true"/> 
    </defaultFields> 
  </occurrence>  
  <occurrence table="ft_t_empl" id="EMPLCCTACPTY" parentId="CCTACUSTCPTY"> 
    <defaultFields> 
      <field name="ft_t_empl.org_id" dataType="STRING" value="ENT1"/>  
      <field name="ft_t_empl.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_empl.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_empl.empl_oid" dataType="STRING" valueOfFunction="OID"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_empl.emp_nme" dataType="STRING"/>  
      <field name="ft_t_empl.emp_dept_nme" dataType="STRING"/>  
      <field name="ft_t_empl.emp_cntry_cde" dataType="STRING"/> 
    </inputFields> 
  </occurrence>  
  <occurrence table="ft_t_adtp" id="ADTPEMPLCPTY" parentId="EMPLCCTACPTY"> 
    <defaultFields> 
      <field name="ft_t_adtp.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_adtp.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_adtp.addr_typ" dataType="STRING" value="LEGAL"/>  
      <field name="ft_t_adtp.elec_addr_id" dataType="STRING" srcOccurrence="EADRADTPCPTY" valueOf="ft_t_eadr.elec_addr_id" uiOnly="true" alwaysDefault="true"/>  
      <field name="ft_t_adtp.mail_addr_id" dataType="STRING" srcOccurrence="MADRADTPCPTY" valueOf="ft_t_madr.mail_addr_id" uiOnly="true" alwaysDefault="true"/> 
    </defaultFields> 
  </occurrence>  
  <occurrence table="ft_t_eadr" id="EADRADTPCPTY" parentId="ADTPEMPLCPTY"> 
    <defaultFields> 
      <field name="ft_t_eadr.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_eadr.elec_addr_id" dataType="STRING" valueOfFunction="OID"/>  
      <field name="ft_t_eadr.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_eadr.fax_num_id" dataType="STRING"/>  
      <field name="ft_t_eadr.phone_num_id" dataType="STRING"/>  
      <field name="ft_t_eadr.eadr_val_num" dataType="STRING"/> 
    </inputFields> 
  </occurrence>  
  <occurrence table="ft_t_madr" id="MADRADTPCPTY" parentId="ADTPEMPLCPTY"> 
    <inputFields> 
      <field name="ft_t_madr.addr_ln1_txt" dataType="STRING"/>  
      <field name="ft_t_madr.addr_ln2_txt" dataType="STRING"/>  
      <field name="ft_t_madr.city_nme" dataType="STRING"/>  
      <field name="ft_t_madr.postal_cde" dataType="STRING"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_madr.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_madr.mail_addr_id" dataType="STRING" valueOfFunction="OID"/>  
      <field name="ft_t_madr.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields> 
  </occurrence>  -->  
  <!-- <occurrence table="ft_t_clar" id="CLARCPTY" parentId="MHILAGR"> 
    <defaultFields> 
      <field name="ft_t_clar.cst_id" dataType="STRING" valueOfXPath="/root/FinancialInstitutionAgreementRoles/FinancialInstitutionAgreementRole[flar.rl_typ=''CPTY'']/FinancialInstitution/Customer/cust.cst_id" keepInSync="true" uiOnly="true"/>  
      <field name="ft_t_clar.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_clar.data_stat_typ" dataType="STRING" value="ACTIVE"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_clar.rl_typ" dataType="STRING" value="CPTY"/> 
    </where> 
  </occurrence>  
  <occurrence table="ft_t_cust" id="CUSTCLARCPTY" parentId="CLARCPTY"> 
    <defaultFields> 
      <field name="ft_t_cust.cst_id" dataType="STRING" valueOfXPath="/root/FinancialInstitutionAgreementRoles/FinancialInstitutionAgreementRole[flar.rl_typ=''CPTY'']/FinancialInstitution/Customer/cust.cst_id" keepInSync="true" uiOnly="true"/> 
    </defaultFields> 
  </occurrence>  
  <occurrence table="ft_t_ccta" id="CCTACUSTCPTY" parentId="CUSTCLARCPTY"> 
    <where> 
      <field name="ft_t_ccta.contct_rl_typ" dataType="STRING" value="LEGAL"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_ccta.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_ccta.empl_oid" dataType="STRING" srcOccurrence="EMPLCCTACPTY" valueOf="ft_t_empl.empl_oid" uiOnly="true" alwaysDefault="true"/>  
      <field name="ft_t_ccta.elec_addr_id" dataType="STRING" srcOccurrence="EADRADTPCPTY" valueOf="ft_t_eadr.elec_addr_id" uiOnly="true" alwaysDefault="true"/> 
    </defaultFields> 
  </occurrence>  
  <occurrence table="ft_t_empl" id="EMPLCCTACPTY" parentId="CCTACUSTCPTY"> 
    <defaultFields> 
      <field name="ft_t_empl.org_id" dataType="STRING" value="ENT1"/>  
      <field name="ft_t_empl.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_empl.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_empl.empl_oid" dataType="STRING" valueOfFunction="OID"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_empl.emp_nme" dataType="STRING" label="Contact Name"/>  
      <field name="ft_t_empl.emp_dept_nme" dataType="STRING" label="Contact Department"/>  
      <field name="ft_t_empl.emp_cntry_cde" dataType="STRING" label="Contact Country"/> 
    </inputFields> 
  </occurrence>  
  <occurrence table="ft_t_adtp" id="ADTPEMPLCPTY" parentId="EMPLCCTACPTY"> 
    <defaultFields> 
      <field name="ft_t_adtp.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_adtp.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_adtp.addr_typ" dataType="STRING" value="LEGAL"/>  
      <field name="ft_t_adtp.elec_addr_id" dataType="STRING" srcOccurrence="EADRADTPCPTY" valueOf="ft_t_eadr.elec_addr_id" uiOnly="true" alwaysDefault="true"/>  
      <field name="ft_t_adtp.mail_addr_id" dataType="STRING" srcOccurrence="MADRADTPCPTY" valueOf="ft_t_madr.mail_addr_id" uiOnly="true" alwaysDefault="true"/> 
    </defaultFields> 
  </occurrence>  
  <occurrence table="ft_t_eadr" id="EADRADTPCPTY" parentId="ADTPEMPLCPTY"> 
    <defaultFields> 
      <field name="ft_t_eadr.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_eadr.elec_addr_id" dataType="STRING" valueOfFunction="OID"/>  
      <field name="ft_t_eadr.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_eadr.fax_num_id" dataType="STRING"/>  
      <field name="ft_t_eadr.phone_num_id" dataType="STRING"/>  
      <field name="ft_t_eadr.eadr_val_num" dataType="STRING" label="E-Mail Id"/> 
    </inputFields> 
  </occurrence>  
  <occurrence table="ft_t_madr" id="MADRADTPCPTY" parentId="ADTPEMPLCPTY"> 
    <inputFields> 
      <field name="ft_t_madr.addr_ln1_txt" dataType="STRING"/>  
      <field name="ft_t_madr.addr_ln2_txt" dataType="STRING"/>  
      <field name="ft_t_madr.city_nme" dataType="STRING" label="City Name"/>  
      <field name="ft_t_madr.postal_cde" dataType="STRING"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_madr.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_madr.mail_addr_id" dataType="STRING" valueOfFunction="OID"/>  
      <field name="ft_t_madr.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields> 
  </occurrence> -->  
  <occurrence table="ft_t_gncm" id="LAGRGNCMTERMDEPT" parentId="MHILAGR" dbConstraint="LAGRGNCMCSTM" autoCreate="false"> 
    <where> 
      <field name="ft_t_gncm.comm_reas_mnem" dataType="STRING" value="TERMDEPT"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_gncm.cmnt_txt" dataType="STRING"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_gncm.created_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_gncm.gncm_tbl_typ" dataType="STRING" value="LAGR"/>  
      <field name="ft_t_gncm.ln_num" dataType="NUMBER" value="1"/> 
    </defaultFields> 
  </occurrence>  
  <occurrence table="ft_t_gncm" id="LAGRGNCMINTRDEPT" parentId="MHILAGR" dbConstraint="LAGRGNCMCSTM" autoCreate="false"> 
    <defaultFields> 
      <field name="ft_t_gncm.ln_num" dataType="NUMBER" value="1"/>  
      <field name="ft_t_gncm.gncm_tbl_typ" dataType="STRING" value="LAGR"/>  
      <field name="ft_t_gncm.created_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_gncm.cmnt_txt" dataType="STRING"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_gncm.comm_reas_mnem" dataType="STRING" value="INTRDEPT"/> 
    </where> 
  </occurrence>  
  <occurrence table="ft_t_gncm" id="LAANGNCMTERMDEPT" parentId="LAGRLAAN" dbConstraint="LAANGNCMCSTM"> 
    <where> 
      <field name="ft_t_gncm.comm_reas_mnem" dataType="STRING" value="TERMDEPT"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_gncm.cmnt_txt" dataType="STRING"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_gncm.created_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_gncm.gncm_tbl_typ" dataType="STRING" value="LAAN"/>  
      <field name="ft_t_gncm.ln_num" dataType="NUMBER" value="1"/> 
    </defaultFields> 
  </occurrence>  
  <occurrence table="ft_t_lav1" id="LAGRLAV1" parentId="MHILAGR" multiple="true" dbConstraint="ft_t_lav1_f002"> 
    <defaultFields> 
      <field name="ft_t_lav1.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_lav1.data_stat_typ" dataType="STRING" value="ACTIVE"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_lav1.doc_link" dataType="STRING"/>  
      <field name="ft_t_lav1.amend_desc" dataType="STRING"/>  
      <field name="ft_t_lav1.ver_amend_dte" dataType="DATETIME"/>  
      <field name="ft_t_lav1.version_no" dataType="NUMBER"/>  
      <field name="ft_t_lav1.instruc_release_tms" dataType="DATETIME"/> 
    </inputFields> 
  </occurrence>  
  <occurrence table="ft_t_lav1" id="LAANLAV1" parentId="LAGRLAAN" multiple="true" dbConstraint="ft_t_lav1_f001"> 
    <inputFields> 
      <field name="ft_t_lav1.doc_link" dataType="STRING"/>  
      <field name="ft_t_lav1.amend_desc" dataType="STRING"/>  
      <field name="ft_t_lav1.ver_amend_dte" dataType="DATETIME"/>  
      <field name="ft_t_lav1.version_no" dataType="NUMBER"/>  
      <field name="ft_t_lav1.instruc_release_tms" dataType="DATETIME"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_lav1.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_lav1.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields> 
  </occurrence>  
  <occurrence table="ft_t_ccrf" id="LAGRCCRFADTP" parentId="MHILAGR" dbConstraint="ccrff024" autoCreate="false"> 
    <where> 
      <field name="ft_t_ccrf.cross_ref_purp_typ" dataType="STRING" value="ADTP"/> 
    </where>  
    <defaultFields>    
      <field name="ft_t_ccrf.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields> 
  </occurrence>  
  <occurrence table="ft_t_empl" id="EMPLCCRFCPTY" parentId="LAGRCCRFADTP" dbConstraint="ccrff008"> 
    <defaultFields> 
      <field name="ft_t_empl.org_id" dataType="STRING" value="ENT1"/>  
      <field name="ft_t_empl.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_empl.data_stat_typ" dataType="STRING" value="ACTIVE"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_empl.emp_nme" dataType="STRING" label="Contact Name"/>  
      <field name="ft_t_empl.emp_dept_nme" dataType="STRING" label="Contact Department"/>  
      <field name="ft_t_empl.emp_cntry_cde" dataType="STRING" label="Contact Country"/> 
    </inputFields> 
  </occurrence>  
  <occurrence table="ft_t_adtp" id="ADTPEMPLCPTY" parentId="EMPLCCRFCPTY"> 
    <defaultFields> 
      <field name="ft_t_adtp.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_adtp.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_adtp.addr_typ" dataType="STRING" value="LEGAL"/>
    </defaultFields> 
  </occurrence>  
  <occurrence table="ft_t_eadr" id="EADRADTPCPTY" parentId="ADTPEMPLCPTY"> 
    <defaultFields> 
      <field name="ft_t_eadr.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_eadr.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_eadr.fax_num_id" dataType="STRING"/>  
      <field name="ft_t_eadr.phone_num_id" dataType="STRING"/>  
      <field name="ft_t_eadr.eadr_val_num" dataType="STRING" label="E-Mail Id"/> 
    </inputFields> 
  </occurrence>  
  <occurrence table="ft_t_madr" id="MADRADTPCPTY" parentId="ADTPEMPLCPTY"> 
    <inputFields> 
      <field name="ft_t_madr.addr_ln1_txt" dataType="STRING"/>  
      <field name="ft_t_madr.addr_ln2_txt" dataType="STRING"/>  
      <field name="ft_t_madr.city_nme" dataType="STRING" label="City Name"/>  
      <field name="ft_t_madr.postal_cde" dataType="STRING"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_madr.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_madr.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields> 
  </occurrence>  
  <occurrence table="ft_t_afd1" id="LAGRAFD1MHIWK" parentId="MHILAGR" multiple="true"> 
    <defaultFields> 
      <field name="ft_t_afd1.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_afd1.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_afd1.freq_dy_mnth_typ" dataType="STRING"/>  
      <field name="ft_t_afd1.freq_dy_week_typ" dataType="STRING"/>  
      <field name="ft_t_afd1.freq_mnth_ord_typ" dataType="STRING"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_afd1.rl_typ" dataType="STRING" value="MHIWK"/> 
    </where> 
  </occurrence>  
  <occurrence table="ft_t_afd1" id="LAGRAFD1MHIMN" parentId="MHILAGR" multiple="true"> 
    <defaultFields> 
      <field name="ft_t_afd1.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_afd1.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_afd1.freq_dy_mnth_typ" dataType="STRING"/>  
      <field name="ft_t_afd1.freq_dy_week_typ" dataType="STRING"/>  
      <field name="ft_t_afd1.freq_mnth_ord_typ" dataType="STRING"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_afd1.rl_typ" dataType="STRING" value="MHIMN"/> 
    </where> 
  </occurrence>  
  <occurrence table="ft_t_afd1" id="LAGRAFD1MHIRMN" parentId="MHILAGR" multiple="true"> 
    <defaultFields> 
      <field name="ft_t_afd1.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_afd1.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_afd1.freq_dy_mnth_typ" dataType="STRING"/>  
      <field name="ft_t_afd1.freq_dy_week_typ" dataType="STRING"/>  
      <field name="ft_t_afd1.freq_mnth_ord_typ" dataType="STRING"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_afd1.rl_typ" dataType="STRING" value="MHIRMN"/> 
    </where> 
  </occurrence>  
  <occurrence table="ft_t_afd1" id="LAGRAFD1CPTYWK" parentId="MHILAGR" multiple="true"> 
    <defaultFields> 
      <field name="ft_t_afd1.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_afd1.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_afd1.freq_sp_typ" dataType="STRING" srcOccurrence="FLARLAATCPTY" valueOf="ft_t_laat.thshld_val_fq_sp_typ" keepInSync="true"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_afd1.freq_dy_mnth_typ" dataType="STRING"/>  
      <field name="ft_t_afd1.freq_dy_week_typ" dataType="STRING"/>  
      <field name="ft_t_afd1.freq_mnth_ord_typ" dataType="STRING"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_afd1.rl_typ" dataType="STRING" value="CPTYWK"/> 
    </where> 
  </occurrence>  
  <occurrence table="ft_t_afd1" id="LAGRAFD1CPTYMN" parentId="MHILAGR" multiple="true"> 
    <defaultFields> 
      <field name="ft_t_afd1.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_afd1.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_afd1.freq_sp_typ" dataType="STRING" srcOccurrence="FLARLAATCPTY" valueOf="ft_t_laat.thshld_val_fq_sp_typ" keepInSync="true"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_afd1.freq_dy_mnth_typ" dataType="STRING"/>  
      <field name="ft_t_afd1.freq_dy_week_typ" dataType="STRING"/>  
      <field name="ft_t_afd1.freq_mnth_ord_typ" dataType="STRING"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_afd1.rl_typ" dataType="STRING" value="CPTYMN"/> 
    </where> 
  </occurrence>  
  <occurrence table="ft_t_afd1" id="LAGRAFD1CPTYRMN" parentId="MHILAGR" multiple="true"> 
    <defaultFields> 
      <field name="ft_t_afd1.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_afd1.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_afd1.freq_sp_typ" dataType="STRING" srcOccurrence="FLARLAATCPTY" valueOf="ft_t_laat.thshld_val_fq_sp_typ" keepInSync="true"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_afd1.freq_dy_mnth_typ" dataType="STRING"/>  
      <field name="ft_t_afd1.freq_dy_week_typ" dataType="STRING"/>  
      <field name="ft_t_afd1.freq_mnth_ord_typ" dataType="STRING"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_afd1.rl_typ" dataType="STRING" value="CPTYRMN"/> 
    </where> 
  </occurrence>  
  <!--  
  <occurrence table="ft_t_clm1" id="LAGRCLM1" parentId="MHILAGR" label="Collateral Management"> 
    <inputFields> 
      <field name="ft_t_clm1.cpty_independent_camt" dataType="NUMBER"/>  
      <field name="ft_t_clm1.col_disp_ind" dataType="STRING"/>  
      <field name="ft_t_clm1.cpty_min_tsfr_camt" dataType="NUMBER"/>  
      <field name="ft_t_clm1.cpty_thshld_camt" dataType="NUMBER"/>  
      <field name="ft_t_clm1.mhi_min_tsfr_camt" dataType="NUMBER"/>  
      <field name="ft_t_clm1.mhi_independent_camt" dataType="NUMBER"/>  
      <field name="ft_t_clm1.mhi_thshld_camt" dataType="NUMBER"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_clm1.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_clm1.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_clm1.clm1_oid" dataType="STRING" valueOfFunction="OID"/> 
    </defaultFields> 
  </occurrence>  
  -->  
  <occurrence table="ft_t_laan" id="LAGRLAANVM" parentId="MHILAGR" label="AgreementAnnexureVM" autoCreate="false"> 
    <defaultFields> 
      <field name="ft_t_laan.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_laan.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_laan.annex_typ" dataType="STRING"/>  
      <field name="ft_t_laan.annex_stat_typ" dataType="STRING"/>  
      <field name="ft_t_laan.annex_sign_dte" dataType="DATETIME"/>  
      <field name="ft_t_laan.annex_aprvl_dte" dataType="DATETIME"/>  
      <field name="ft_t_laan.annex_negotn_instruc_dte" dataType="DATETIME" label="annex_instrcn_dte"/>  
      <field name="ft_t_laan.annex_curr_cde" dataType="STRING"/>  
      <field name="ft_t_laan.annex_termintn_dte" dataType="DATETIME"/>  
      <field name="ft_t_laan.annex_eff_dte" dataType="STRING"/>  
      <!--  <field name="ft_t_laan.col_disp_ind" dataType="STRING"/> -->  
      <field name="ft_t_laan.last_chg_usr_id" dataType="STRING"/>  
      <field name="ft_t_laan.last_chg_tms" dataType="DATETIME"/>  
      <field name="ft_t_laan.end_tms" dataType="DATETIME"/>  
      <field name="ft_t_laan.start_tms" dataType="DATETIME"/>  
      <field name="ft_t_laan.data_src_id" dataType="STRING"/>  
      <field name="ft_t_laan.data_stat_typ" dataType="STRING"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_laan.annex_modl_typ" dataType="STRING" value="VM"/> 
    </where>  
    <validationRules> 
      <rule id="VMTerminateDate"> 
        <xPath value="boolean((./laan.annex_stat_typ=''TERMNTED'' and string(./laan.annex_termintn_dte)) or (./laan.annex_stat_typ!=''TERMNTED'' and not(string(./laan.annex_termintn_dte))))"/>  
        <errorMessage value="VM CSA Status not Terminated but Date of Termination is populated. Please rectify"/> 
      </rule> 
    </validationRules> 
  </occurrence>  
  <occurrence table="ft_t_laap" id="MHIFLARLAAPVM" parentId="FLARMHI" label="AnnexureParticipantMHIVM"> 
    <inputFields> 
	  <field name="ft_t_laap.interest_adj_typ" dataType="STRING"/>
	  <field name="ft_t_laap.interest_tsfr_typ" dataType="STRING"/>
      <field name="ft_t_laap.governing_law_cntry_cde" dataType="STRING"/>  
      <field name="ft_t_laap.laap_oid" dataType="STRING"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_laap.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_laap.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_laap.laan_oid" dataType="STRING" srcOccurrence="LAGRLAANVM" valueOf="ft_t_laan.laan_oid" keepInSync="true"/>  
      <field name="ft_t_laap.laap_oid" dataType="STRING" valueOfFunction="OID"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_laap.annex_prt_modl_typ" dataType="STRING" value="VM"/> 
    </where>  
    <!-- <validationRules> 
      <rule id="EligibleCashRequired"> 
        <xPath value="count(%modelPath:LACDLAAPVM%)  > 0 or not(%modelPath:LAGRLAANVM:ft_t_laan.annex_stat_typ%=''SIGNED'')"/>  
        <errorMessage value="Please add Eligible Cash to the Variation Margin CSA Addendum"/> 
      </rule> 
    </validationRules>  --> 
  </occurrence>  
  <occurrence table="ft_t_ccrf" id="LAANCCRFTERMINTNVM" parentId="LAGRLAANVM"> 
    <defaultFields> 
      <field name="ft_t_ccrf.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_ccrf.cross_ref_purp_typ" dataType="STRING" value="TERMINTN"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_ccrf.empl_oid" dataType="STRING"/> 
    </inputFields> 
  </occurrence>  
  <occurrence table="ft_t_ccrf" id="LAANCCRFTERMLGALVM" parentId="LAGRLAANVM"> 
    <defaultFields> 
      <field name="ft_t_ccrf.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_ccrf.cross_ref_purp_typ" dataType="STRING" value="TERMLGAL"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_ccrf.empl_oid" dataType="STRING"/> 
    </inputFields> 
  </occurrence>  
  <occurrence table="ft_t_gncm" id="LAANGNCMTERMDEPTVM" parentId="LAGRLAANVM" dbConstraint="LAANGNCMCSTM"> 
    <where> 
      <field name="ft_t_gncm.comm_reas_mnem" dataType="STRING" value="TERMDEPT"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_gncm.cmnt_txt" dataType="STRING"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_gncm.created_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_gncm.gncm_tbl_typ" dataType="STRING" value="LAAN"/>  
      <field name="ft_t_gncm.ln_num" dataType="NUMBER" value="1"/> 
    </defaultFields> 
  </occurrence>  
  <occurrence table="ft_t_laan" id="LAGRLAANIMD" parentId="MHILAGR" label="AgreementAnnexureIMD" autoCreate="false"> 
    <defaultFields> 
      <field name="ft_t_laan.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_laan.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_laan.annex_aprvl_dte" dataType="DATETIME"/>  
      <field name="ft_t_laan.annex_negotn_instruc_dte" dataType="DATETIME" label="annex_instrcn_dte"/>  
      <field name="ft_t_laan.annex_stat_typ" dataType="STRING"/>  
      <field name="ft_t_laan.annex_termintn_dte" dataType="DATETIME"/>  
      <field name="ft_t_laan.annex_curr_cde" dataType="STRING"/>  
      <field name="ft_t_laan.annex_sign_dte" dataType="DATETIME"/>  
      <field name="ft_t_laan.annex_typ" dataType="STRING"/>  
      <field name="ft_t_laan.annex_eff_dte" dataType="DATETIME"/>  
      <field name="ft_t_laan.last_chg_usr_id" dataType="STRING"/>  
      <field name="ft_t_laan.last_chg_tms" dataType="DATETIME"/>  
      <field name="ft_t_laan.end_tms" dataType="DATETIME"/>  
      <field name="ft_t_laan.start_tms" dataType="DATETIME"/>  
      <field name="ft_t_laan.data_stat_typ" dataType="STRING"/>  
      <field name="ft_t_laan.data_src_id" dataType="STRING"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_laan.annex_modl_typ" dataType="STRING" value="IM"/> 
    </where>  
    <validationRules> 
      <rule id="RegimeMHIRequired"> 
        <xPath value="count(%modelPath:LAATREG1IMDMHI%)  > 0 or ./laan.annex_stat_typ!=''SIGNED''"/>  
        <errorMessage value="Please add Regulatory Regime for MHI to the IM Document Addendum"/> 
      </rule>  
      <rule id="RegimeCPTYRequired"> 
        <xPath value="count(%modelPath:LAATREG1IMDCPTY%)  > 0 or ./laan.annex_stat_typ!=''SIGNED''"/>  
        <errorMessage value="Please add Regulatory Regime for CPTY to the IM Document Addendum"/> 
      </rule>  
      <rule id="IMDTerminateDate"> 
        <xPath value="boolean((./laan.annex_stat_typ=''TERMNTED'' and string(./laan.annex_termintn_dte)) or (./laan.annex_stat_typ!=''TERMNTED'' and not(string(./laan.annex_termintn_dte))))"/>  
        <errorMessage value="IMD Status not Terminated but Date of Termination is populated. Please rectify"/> 
      </rule> 
    </validationRules> 
  </occurrence>  
  <occurrence table="ft_t_laap" id="MHILARLAAPIMD" parentId="FLARMHI" label="AnnexureParticipantMHIIMD" autoCreate="false"> 
    <defaultFields> 
      <field name="ft_t_laap.laan_oid" dataType="STRING" srcOccurrence="LAGRLAANIMD" valueOf="ft_t_laan.laan_oid" keepInSync="true"/>  
      <field name="ft_t_laap.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_laap.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_laap.laap_oid" dataType="STRING" valueOfFunction="OID"/> 
    </defaultFields>  
    <inputFields> 
	  <field name="ft_t_laap.inst_mnem" dataType="STRING"/>
	  <field name="ft_t_laap.ev_dflt_curr_cde" dataType="STRING"/>
	  <field name="ft_t_laap.early_term_pay_curr_cde" dataType="STRING"/>
      <field name="ft_t_laap.governing_law_cntry_cde" dataType="STRING"/>  
      <field name="ft_t_laap.annex_prt_curr_cde" dataType="STRING"/>  
      <field name="ft_t_laap.laap_oid" dataType="STRING"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_laap.annex_prt_modl_typ" dataType="STRING" value="IM"/> 
    </where> 
  </occurrence>  
  <occurrence table="ft_t_ccrf" id="LAANCCRFTERMINTNIMD" parentId="LAGRLAANIMD"> 
    <defaultFields> 
      <field name="ft_t_ccrf.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_ccrf.cross_ref_purp_typ" dataType="STRING" value="TERMINTN"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_ccrf.empl_oid" dataType="STRING"/> 
    </inputFields> 
  </occurrence>  
  <occurrence table="ft_t_ccrf" id="LAANCCRFTERMLGALIMD" parentId="LAGRLAANIMD"> 
    <defaultFields> 
      <field name="ft_t_ccrf.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_ccrf.cross_ref_purp_typ" dataType="STRING" value="TERMLGAL"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_ccrf.empl_oid" dataType="STRING"/> 
    </inputFields> 
  </occurrence>  
  <occurrence table="ft_t_gncm" id="LAANGNCMTERMDEPTIMD" parentId="LAGRLAANIMD" dbConstraint="LAANGNCMCSTM"> 
    <where> 
      <field name="ft_t_gncm.comm_reas_mnem" dataType="STRING" value="TERMDEPT"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_gncm.cmnt_txt" dataType="STRING"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_gncm.created_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_gncm.gncm_tbl_typ" dataType="STRING" value="LAAN"/>  
      <field name="ft_t_gncm.ln_num" dataType="NUMBER" value="1"/> 
    </defaultFields> 
  </occurrence>  
  <occurrence table="ft_t_lacv" id="LAANLACVCSA" parentId="LAGRLAAN" multiple="true" label="AnnexureCoverageOldVM" dbConstraint="ft_t_lacv_f005"> 
    <inputFields> 
      <field name="ft_t_lacv.cust_prod_nme" dataType="STRING"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_lacv.cvg_purp_typ" dataType="STRING" value="INSCOPEC"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_lacv.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_lacv.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields> 
  </occurrence>  
  <occurrence table="ft_t_lacv" id="LAANLACVVM" parentId="LAGRLAANVM" label="AnnexureCoverageNewVM" dbConstraint="ft_t_lacv_f005" multiple="true"> 
    <defaultFields> 
      <field name="ft_t_lacv.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_lacv.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_lacv.cust_prod_nme" dataType="STRING"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_lacv.cvg_purp_typ" dataType="STRING" value="INSCOPEV"/> 
    </where> 
  </occurrence>  
  <occurrence table="ft_t_lacd" id="LACDLAAPVM" parentId="MHIFLARLAAPVM" label="AnnexureCollateralDetailsVM" multiple="true" autoCreate="true"> 
    <inputFields> 
      <field name="ft_t_lacd.haircut_cpct" dataType="NUMBER"/>  
      <field name="ft_t_lacd.coll_curr_cde" dataType="STRING"/>  
      <field name="ft_t_lacd.adj_pct_val_cpct" dataType="NUMBER"/>  
      <field name="ft_t_lacd.coll_call_fq_sp_typ" dataType="STRING"/>  
      <field name="ft_t_lacd.coll_call_notfcn_tme" dataType="DATETIME"/>  
      <field name="ft_t_lacd.coll_call_notfcn_tmz" dataType="STRING"/>  
      <field name="ft_t_lacd.lacd_oid" dataType="STRING"/>  
      <!--  <field name="ft_t_lacd.coll_settle_dte_of_cnt" dataType="NUMBER"/>  --> 
       <!--  <field name="ft_t_lacd.coll_val_dte_of_cnt" dataType="NUMBER"/>  -->
      <field name="ft_t_lacd.coll_call_fq_dy_typ" dataType="STRING"/>  
     <!--    <field name="ft_t_lacd.coll_call_action_if_hol" dataType="STRING"/> -->
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_lacd.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_lacd.adj_pct_val_cpct" dataType="NUMBER" value="100"/>  
      <field name="ft_t_lacd.haircut_cpct" dataType="NUMBER" value="0"/>  
      <field name="ft_t_lacd.coll_curr_cde" dataType="STRING" srcOccurrence="LAGRLAANVM" valueOf="ft_t_laan.annex_curr_cde"/>  
      <field name="ft_t_lacd.coll_call_fq_sp_typ" dataType="STRING" value="D"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_lacd.coll_desc" dataType="STRING" value="Cash"/> 
    </where> 
  </occurrence>  
  <occurrence table="ft_t_laat" id="LAATFLARVMMHI" parentId="MHIFLARLAAPVM" label="LAATVM" autoCreate="true"> 
    <inputFields> 
     <!-- <field name="ft_t_laat.int_adj_ind" dataType="STRING"/>  -->
    <!--  <field name="ft_t_laat.int_tsfr_ind" dataType="STRING"/>  -->
      <field name="ft_t_laat.min_tsfr_camt" dataType="NUMBER"/>  
      <field name="ft_t_laat.ret_rnd_camt" dataType="NUMBER"/>  
      <field name="ft_t_laat.thshld_val_fq_sp_typ" dataType="STRING"/>  
      <field name="ft_t_laat.thshld_camt" dataType="NUMBER"/>  
      <field name="ft_t_laat.dlv_rnd_meth_typ" dataType="STRING"/>  
      <field name="ft_t_laat.ret_rnd_meth_txt" dataType="STRING"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_laat.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_laat.thshld_camt" dataType="NUMBER" value="0"/>  
      <field name="ft_t_laat.thshld_val_fq_sp_typ" dataType="STRING" value="DY"/>  
      <field name="ft_t_laat.dlv_rnd_meth_typ" dataType="STRING" value="Up"/>  
      <field name="ft_t_laat.ret_rnd_meth_txt" dataType="STRING" value="Down"/>      
    </defaultFields>  
    <where> 
     <!--  <field name="ft_t_laat.annex_modl_typ" dataType="STRING" value="VM"/> -->
    </where> 
  </occurrence>  
  <occurrence table="ft_t_laap" id="CPTYFLARLAAPVM" parentId="FLARCPTY" label="AnnexureParticipantCPTYVM" autoCreate="false"> 
    <defaultFields> 
      <field name="ft_t_laap.laan_oid" dataType="STRING" srcOccurrence="LAGRLAANVM" valueOf="ft_t_laan.laan_oid" keepInSync="true"/>  
      <field name="ft_t_laap.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_laap.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_laap.annex_prt_modl_typ" dataType="STRING" value="VM"/> 
    </where> 
  </occurrence>  
  <occurrence table="ft_t_laat" id="LAATFLARVMCPTY" parentId="CPTYFLARLAAPVM" label="LAATVMCPTY"> 
    <inputFields> 
      <field name="ft_t_laat.min_tsfr_camt" dataType="NUMBER"/>  
      <field name="ft_t_laat.thshld_camt" dataType="NUMBER"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_laat.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_laat.thshld_camt" dataType="NUMBER" value="0"/> 
    </defaultFields>  
    <where> 
    <!--  <field name="ft_t_laat.annex_modl_typ" dataType="STRING" value="VM"/> -->
    </where> 
  </occurrence>  
  <occurrence table="ft_t_lav1" id="LAANLAV1VM" parentId="LAGRLAANVM" label="AnnexureVMVersion" dbConstraint="ft_t_lav1_f001"> 
    <inputFields> 
      <field name="ft_t_lav1.amend_desc" dataType="STRING"/>  
      <field name="ft_t_lav1.doc_link" dataType="STRING"/>  
      <field name="ft_t_lav1.ver_amend_dte" dataType="DATETIME"/>  
      <field name="ft_t_lav1.version_no" dataType="NUMBER"/>  
      <field name="ft_t_lav1.instruc_release_tms" dataType="DATETIME"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_lav1.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields> 
  </occurrence>  
  <occurrence table="ft_t_laat" id="LAATFLARIMDMHI" parentId="MHILARLAAPIMD" label="LAATIMD" autoCreate="true"> 
    <where> 
     <!--  <field name="ft_t_laat.annex_modl_typ" dataType="STRING" value="IM"/> -->
    </where>  
    <inputFields> 
      <!--<field name="ft_t_laat.inst_mnem" dataType="STRING"/> -->
    <!--  <field name="ft_t_laat.early_ter_curr" dataType="STRING"/> -->
    <!--  <field name="ft_t_laat.eod_ter_curr" dataType="STRING"/> -->
      <field name="ft_t_laat.thshld_calc_curr_cde" dataType="STRING" label="calc_curr"/>  
      <field name="ft_t_laat.min_tsfr_camt" dataType="NUMBER"/>  
      <field name="ft_t_laat.thshld_camt" dataType="NUMBER"/>  
      <field name="ft_t_laat.ret_rnd_camt" dataType="NUMBER"/>  
      <field name="ft_t_laat.thshld_curr_cde" dataType="STRING" label="thshld_curr"/>  
      <field name="ft_t_laat.dlv_rnd_meth_typ" dataType="STRING"/>  
      <field name="ft_t_laat.ret_rnd_meth_txt" dataType="STRING"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_laat.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_laat.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_laat.dlv_rnd_meth_typ" dataType="STRING" value="Up"/>  
      <field name="ft_t_laat.ret_rnd_meth_txt" dataType="STRING" value="Down"/> 
    </defaultFields> 
  </occurrence>  
  <occurrence table="ft_t_reg1" id="LAATREG1IMDMHI" parentId="LAATFLARIMDMHI" label="RegulatoryRegimeIMD"> 
    <defaultFields> 
      <field name="ft_t_reg1.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_reg1.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_reg1.simm_exception" dataType="STRING" value="Not Applicable"/>  
      <field name="ft_t_reg1.retro_exception" dataType="STRING" value="Not Applicable"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_reg1.retro_date" dataType="DATETIME"/>  
      <field name="ft_t_reg1.retro_exception" dataType="STRING"/>  
      <field name="ft_t_reg1.exp_desc" dataType="STRING"/>  
      <field name="ft_t_reg1.simm_exception" dataType="STRING"/>  
      <field name="ft_t_reg1.rgm1_oid" dataType="STRING"/> 
    </inputFields> 
  </occurrence>  
  <occurrence table="ft_t_laap" id="CPTYFLARLAAPIMD" parentId="FLARCPTY" label="AnnexureParticipantCPTYIMD" autoCreate="false"> 
    <defaultFields> 
      <field name="ft_t_laap.laan_oid" dataType="STRING" srcOccurrence="LAGRLAANIMD" valueOf="ft_t_laan.laan_oid" keepInSync="true"/>  
      <field name="ft_t_laap.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_laap.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_laap.annex_prt_modl_typ" dataType="STRING" value="IM"/> 
    </where> 
	<inputFields> 
	<field name="ft_t_laap.inst_mnem" dataType="STRING"/>
	<field name="ft_t_laap.ev_dflt_curr_cde" dataType="STRING"/>
	</inputFields> 
  </occurrence>  
  <occurrence table="ft_t_laat" id="LAATFLARIMDCPTY" parentId="CPTYFLARLAAPIMD" label="LAATIMD"> 
    <inputFields> 
        <!-- <field name="ft_t_laat.inst_mnem" dataType="STRING"/>  -->
    <!--  <field name="ft_t_laat.eod_ter_curr" dataType="STRING"/>  -->
      <field name="ft_t_laat.min_tsfr_camt" dataType="NUMBER"/>  
      <field name="ft_t_laat.thshld_calc_curr_cde" dataType="STRING" label="calc_curr"/>  
      <field name="ft_t_laat.thshld_camt" dataType="NUMBER"/>  
      <field name="ft_t_laat.thshld_curr_cde" dataType="STRING" label="thshld_curr"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_laat.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_laat.data_stat_typ" dataType="STRING" value="ACTIVE"/> 
    </defaultFields>  
    <where> 
     <!--  <field name="ft_t_laat.annex_modl_typ" dataType="STRING" value="IM"/> -->
    </where> 
  </occurrence>  
  <occurrence table="ft_t_reg1" id="LAATREG1IMDCPTY" parentId="LAATFLARIMDCPTY" label="RegulatoryRegimeIMD"> 
    <defaultFields> 
      <field name="ft_t_reg1.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_reg1.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_reg1.simm_exception" dataType="STRING" value="Not Applicable"/>  
      <field name="ft_t_reg1.retro_exception" dataType="STRING" value="Not Applicable"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_reg1.rgm1_oid" dataType="STRING"/>  
      <field name="ft_t_reg1.retro_date" dataType="DATETIME"/>  
      <field name="ft_t_reg1.retro_exception" dataType="STRING"/>  
      <field name="ft_t_reg1.exp_desc" dataType="STRING"/>  
      <field name="ft_t_reg1.simm_exception" dataType="STRING"/> 
    </inputFields> 
  </occurrence>  
  <occurrence table="ft_t_lav1" id="LAANLAV1IMD" parentId="LAGRLAANIMD" label="AnnexureIMDVersion" dbConstraint="ft_t_lav1_f001"> 
    <inputFields> 
      <field name="ft_t_lav1.version_no" dataType="NUMBER"/>  
      <field name="ft_t_lav1.ver_amend_dte" dataType="DATETIME"/>  
      <field name="ft_t_lav1.doc_link" dataType="STRING"/>  
      <field name="ft_t_lav1.amend_desc" dataType="STRING"/>  
      <field name="ft_t_lav1.instruc_release_tms" dataType="DATETIME"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_lav1.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_lav1.data_stat_typ" dataType="STRING" value="ACTIVE"/> 
    </defaultFields> 
  </occurrence>  
  <!--<occurrence table="ft_t_clm1" id="LAANCLM1CSA" parentId="LAGRLAAN" label="CollateralDisputeCSA"> 
    <inputFields> 
      <field name="ft_t_clm1.col_disp_ind" dataType="STRING"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_clm1.clm1_oid" dataType="STRING" valueOfFunction="OID"/>  
      <field name="ft_t_clm1.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_clm1.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_clm1.laan_oid" dataType="STRING" valueOfXPath="/root/FTTLAANs/FTTLAAN[laan.annex_modl_typ=''CSA'']/laan.laan_oid" keepInSync="true" uiOnly="true"/> 
    </defaultFields> 
  </occurrence>  
<occurrence table="ft_t_clm1" id="LAANCLM1VM" parentId="LAGRLAANVM" label="CollateralDisputeVM"> 
    <defaultFields> 
      <field name="ft_t_clm1.laan_oid" dataType="STRING" valueOfXPath="/root/FTTLAANs/FTTLAAN[laan.annex_modl_typ=''CSA'']/laan.laan_oid" keepInSync="true" uiOnly="true"/>  
      <field name="ft_t_clm1.clm1_oid" dataType="STRING" valueOfFunction="OID"/>  
      <field name="ft_t_clm1.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_clm1.col_disp_ind" dataType="STRING"/> 
    </inputFields> 
  </occurrence> 
    -->  
  <occurrence table="ft_t_laac" id="MHIFLARLAAPLAACVM" parentId="MHIFLARLAAPVM" label="CalendarParticipant"> 
    <inputFields> 
      <field name="ft_t_laac.cal_id" dataType="STRING"/>  
      <field name="ft_t_laac.cal_purp_typ" dataType="STRING"/>  
      <field name="ft_t_laac.start_tms" dataType="DATETIME"/>  
      <field name="ft_t_laac.laac_oid" dataType="STRING"/>  
      <field name="ft_t_laac.laap_oid" dataType="STRING"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_laac.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_laac.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_laac.laap_oid" dataType="STRING" srcOccurrence="MHIFLARLAAPVM" valueOf="ft_t_laap.laap_oid"/> 
    </defaultFields>  
    <!-- SPT removed where clause (in line with working LACD below) -->  
    <!--<where> 
      <field name="ft_t_laac.laap_oid" dataType="STRING" srcOccurrence="MHIFLARLAAPVM" valueOf="ft_t_laap.laap_oid"/> 
    </where> 
  --> 
  </occurrence>  
  <occurrence table="ft_t_lacd" id="LACDIMD" parentId="MHILARLAAPIMD" label="AnnexureCollateralDetailsIMD" autoCreate="true"> 
    <inputFields> 
      <field name="ft_t_lacd.coll_call_notfcn_tme" dataType="DATETIME"/>  
      <field name="ft_t_lacd.coll_call_notfcn_tmz" dataType="STRING"/>  
      <field name="ft_t_lacd.coll_call_fq_sp_typ" dataType="STRING"/>  
      <field name="ft_t_lacd.lacd_oid" dataType="STRING"/>  
      <field name="ft_t_lacd.coll_call_fq_dy_typ" dataType="STRING"/>  
      <!--  <field name="ft_t_lacd.coll_settle_dte_of_cnt" dataType="NUMBER"/>  --> 
       <!--  <field name="ft_t_lacd.coll_val_dte_of_cnt" dataType="NUMBER"/>  -->
      <field name="ft_t_lacd.guarantor_inst_mnem" dataType="STRING"/>  
     <!--    <field name="ft_t_lacd.coll_call_action_if_hol" dataType="STRING"/> -->
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_lacd.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_lacd.coll_call_fq_sp_typ" dataType="STRING" value="D"/> 
    </defaultFields> 
  </occurrence>  
  <occurrence table="ft_t_laac" id="MHIFLARLAAPLAAC" parentId="MHIFLARLAAP" label="Calendar Participant"> 
    <inputFields> 
      <field name="ft_t_laac.cal_id" dataType="STRING"/>  
      <field name="ft_t_laac.cal_purp_typ" dataType="STRING"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_laac.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_laac.laac_oid" dataType="STRING" valueOfFunction="OID"/>  
      <field name="ft_t_laac.laap_oid" dataType="STRING" srcOccurrence="MHIFLARLAAP" valueOf="ft_t_laap.laap_oid"/> 
    </defaultFields>  
    <!-- SPT removed where clause (in line with working LACD below) -->  
    <!--<where> 
      <field name="ft_t_laac.laap_oid" dataType="STRING" srcOccurrence="MHIFLARLAAP" valueOf="ft_t_laap.laap_oid"/> 
    </where> 
  --> 
  </occurrence>  
  <occurrence table="ft_t_laac" id="MHIFLARLAAPLAACIMD" parentId="MHILARLAAPIMD" label="Calendar Participant"> 
    <inputFields> 
      <field name="ft_t_laac.cal_id" dataType="STRING"/>  
      <field name="ft_t_laac.cal_purp_typ" dataType="STRING"/>  
      <field name="ft_t_laac.laap_oid" dataType="STRING"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_laac.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_laac.laap_oid" dataType="STRING" srcOccurrence="MHILARLAAPIMD" valueOf="ft_t_laap.laap_oid"/>  
      <field name="ft_t_laac.laac_oid" dataType="STRING" valueOfFunction="OID"/> 
    </defaultFields>  
    <!-- SPT removed where clause (in line with working LACD below) -->  
    <!--<where> 
      <field name="ft_t_laac.laap_oid" dataType="STRING" srcOccurrence="MHILARLAAPIMD" valueOf="ft_t_laap.laap_oid"/> 
    </where> 
  --> 
  </occurrence>  
  <occurrence table="ft_t_lacd" id="MHIFLARLAAPLACD" parentId="MHIFLARLAAP" label="AnnexureCollateralDetailsCSA" autoCreate="true"> 
    <inputFields> 
      <field name="ft_t_lacd.coll_call_fq_sp_typ" dataType="STRING"/>  
      <field name="ft_t_lacd.coll_call_notfcn_tme" dataType="DATETIME"/>  
      <field name="ft_t_lacd.coll_call_notfcn_tmz" dataType="STRING"/>  
     <!--    <field name="ft_t_lacd.coll_call_action_if_hol" dataType="STRING"/> -->
      <field name="ft_t_lacd.coll_call_fq_dy_typ" dataType="STRING"/>  
      <!--  <field name="ft_t_lacd.coll_settle_dte_of_cnt" dataType="NUMBER"/>  -->
      <!--  <field name="ft_t_lacd.coll_val_dte_of_cnt" dataType="NUMBER"/>  -->
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_lacd.flar_oid" dataType="STRING" srcOccurrence="MHIFLARLAAP" valueOf="ft_t_laap.flar_oid"/>  
      <field name="ft_t_lacd.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_lacd.data_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_lacd.coll_call_fq_sp_typ" dataType="STRING" value="D"/> 
    </defaultFields> 
  </occurrence> 
<relations><table name="FT_T_GNCM"><relation relatedTable="FT_T_FLAR" name="FLARGNCMCSTM">
      <fromColumns>
        <column name="CROSS_REF_ID"/>
      </fromColumns>
      <toColumns>
        <column name="FLAR_OID"/>
      </toColumns>
      <condition>
        <sql>#FROM_TABLE#.GNCM_TBL_TYP = ''FLAR''</sql>
      </condition>
    </relation></table><table name="FT_T_GNCM"><relation relatedTable="FT_T_LAAP" name="LAAPGNCMCSTM">
      <fromColumns>
        <column name="CROSS_REF_ID"/>
      </fromColumns>
      <toColumns>
        <column name="LAAP_OID"/>
      </toColumns>
      <condition>
        <sql>#FROM_TABLE#.GNCM_TBL_TYP = ''LAAP''</sql>
      </condition>
    </relation></table><table name="FT_T_GNCM"><relation relatedTable="FT_T_LAAT" name="LAATGNCMCSTM">
      <fromColumns>
        <column name="CROSS_REF_ID"/>
      </fromColumns>
      <toColumns>
        <column name="LAAT_OID"/>
      </toColumns>
      <condition>
        <sql>#FROM_TABLE#.GNCM_TBL_TYP = ''LAAT''</sql>
      </condition>
    </relation></table><table name="FT_T_GNCM"><relation relatedTable="FT_T_LAAN" name="LAANGNCMCSTM">
      <fromColumns>
        <column name="CROSS_REF_ID"/>
      </fromColumns>
      <toColumns>
        <column name="LAAN_OID"/>
      </toColumns>
      <condition>
        <sql>#FROM_TABLE#.GNCM_TBL_TYP = ''LAAN''</sql>
      </condition>
    </relation></table><table name="FT_T_GNCM"><relation relatedTable="FT_T_LAGR" name="LAGRGNCMCSTM">
      <fromColumns>
        <column name="CROSS_REF_ID"/>
      </fromColumns>
      <toColumns>
        <column name="LEG_AGRMNT_ID"/>
      </toColumns>
      <condition>
        <sql>#FROM_TABLE#.GNCM_TBL_TYP = ''LAGR''</sql>
      </condition>
    </relation></table></relations></model>' WHERE modl_id ='MHILAGR' AND modl_typ = 'MHILAGR';
	
UPDATE FT_T_MDDF SET modl_schema ='<?xml version="1.0" encoding="UTF-8"?>
<model xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" headerInfoXPath="concat(%modelPath:BASEISSU:ft_t_issu.pref_iss_nme%,'' - '',%modelPath:BASEISSU:ft_t_issu.pref_id_ctxt_typ% ,''-'',%modelPath:BASEISSU:ft_t_issu.pref_iss_id%)" id="MUNIS" extends="BONDMRKT" xsi:noNamespaceSchemaLocation="../../schemas/Model.xsd" minLevelToEnableChangeApproval="2">  
  <!--<model xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="../../schemas/Model.xsd" >  -->  
  <occurrence table="ft_t_issu" extends="BASEISSU" id="BASEISSU" level="1" label="Issue Description/Issue Details"><validationRules> 
      <rule id="ValidationISID"> 
        <xPath value="boolean((count(/root/issueidentifiers/identifier[@status!=''deleted'' or string-length(@status)=0]) >0)  or (/root/issue[@status!=''new'' or  string-length(@status)=0]))"/>  
        <errorMessage value="At least one Instrument Level Identifier has to be entered."/> 
      </rule>  
      <rule id="ValidationISID_ACTIVITYSTATUS"> 
        <xPath value="boolean((count(/root/issueidentifiers/identifier[@status!=''deleted'' or string-length(@status)=0]) >0 or string(/root/issue/issu.iss_actvy_stat_typ)=''INACTIVE'')  or (/root/issue[@status=''new'' or  string-length(@status)!=0]))"/>  
        <errorMessage value="User has either to mark the Issue activity status(Instrument Status)  as inactive or have at least one identifier active."/> 
      </rule>  
      <rule id="FIRSTCPDT_LT_NXTCPDT"> 
        <xPath value="boolean((%modelPath:IEDFBDEBT:ft_t_iedf.first_py_tms%  < = %modelPath:BDSTBDEBT:ft_t_bdst.nxt_cpn_dte%) or (string-length(%modelPath:IEDFBDEBT:ft_t_iedf.first_py_tms%)=0 or string-length(%modelPath:BDSTBDEBT:ft_t_bdst.nxt_cpn_dte%)=0))"/>  
        <errorMessage value="First Coupon Date Should be Less than or equal to  Next Coupon Date"/> 
      </rule>  
      <rule id="DATEDTMS_LT_MATTMS"> 
        <xPath value="boolean((%modelPath:BDCHBDEBT:ft_t_bdch.dted_tms%  <  %modelPath:BASEISSU:ft_t_issu.mat_exp_tms%) or (string-length(%modelPath:BDCHBDEBT:ft_t_bdch.dted_tms%)=0 or string-length(%modelPath:BASEISSU:ft_t_issu.mat_exp_tms%)=0))"/>  
        <errorMessage value="Dated date should be less than Maturity date"/> 
      </rule> 
    <rule id="MultiplePrimaryMarkets" pageName="Market"> 
        <xPath value="boolean(count(%modelPath:MKISDEFBISSU%[(string-length(mkis.end_tms) = 0) and (mkis.prim_trd_mkt_ind = ''Y'')])  <  2)"/>  
        <errorMessage value="There should not be multiple primary markets for a single issue."/> 
      </rule></validationRules><defaultFields> 
      <field name="ft_t_issu.access_auth_typ" dataType="STRING" value="PUBLIC"/>  
      <field name="ft_t_issu.iss_actvy_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_issu.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>
    </defaultFields><inputFields> 
      <field name="ft_t_issu.series_typ"/> 
    <field name="ft_t_issu.mat_exp_tms" level="2"/><field name="ft_t_issu.iss_typ" level="1" label="Instrument Type"/><field name="ft_t_issu.denom_curr_cde" level="2"/><field name="ft_t_issu.sec_form_typ"/><field name="ft_t_issu.instr_issr_id"/><field name="ft_t_issu.nom_val_unit_camt"/><field name="ft_t_issu.distribution_curr_cde"/><field name="ft_t_issu.iss_tms" label="Instrument Date"/><field name="ft_t_issu.cl_typ"/></inputFields></occurrence>  
  <occurrence extends="BDCHBDEBT" table="ft_t_bdch" id="BDCHBDEBT" parentId="BASEISSU" label="Issue Details/Coupon Details" level="3"> 
    <inputFields> 
      <field name="ft_t_bdch.muni_note_ind"/>  
      <field name="ft_t_bdch.sink_fund_typ"/>  
      <field name="ft_t_bdch.sink_fund_rdm_typ"/> 
    <field name="ft_t_bdch.bond_rtr_meth_typ"/><field name="ft_t_bdch.calc_typ" level="3"/><field name="ft_t_bdch.mn_denom_camt" level="3"/><field name="ft_t_bdch.call_typ"/><field name="ft_t_bdch.put_typ"/><field name="ft_t_bdch.cpn_typ"/><field name="ft_t_bdch.dted_tms"/><field name="ft_t_bdch.in_pay_typ"/><field name="ft_t_bdch.yld_calc_typ"/></inputFields> 
  </occurrence>  
  <occurrence table="ft_t_isll" id="ISLLMUNIS" parentId="BASEISSU" label="Issue Details" multiple="false"> 
    <defaultFields> 
      <field name="ft_t_isll.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_isll.iss_coll_nme" dataType="STRING" valueOf="ft_T_isll.coll_typ" srcOccurrence="ISLLMUNIS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_isll.coll_typ"/> 
    </inputFields> 
  </occurrence>  
  <occurrence extends="UWCHBDEBT" label="Issue Details/Muni Details" table="ft_t_uwch" id="UWCHBDEBT" parentId="BASEISSU" autoDelete="false"> 
    <inputFields> 
      <field name="ft_t_uwch.offer_increment_camt"/>  
      <field name="ft_t_uwch.min_offer_camt"/>  
      <field name="ft_t_uwch.offer_acrd_int_from_tms"/>  
      <field name="ft_t_uwch.mat_sz_camt"/>  
      <field name="ft_t_uwch.offer_typ"/> 
    <field name="ft_t_uwch.offer_camt"/><field name="ft_t_uwch.first_settle_dte"/></inputFields> 
  <where> 
      <field name="ft_t_uwch.offer_num" dataType="NUMBER" value="1"/> 
    </where><defaultFields> 
      <field name="ft_t_uwch.offer_curr_cde" dataType="STRING" srcOccurrence="BASEISSU" valueOf="ft_t_issu.denom_curr_cde"/>  
      <field name="ft_t_uwch.offer_tms" dataType="DATETIME" srcOccurrence="UWCHBDEBT" valueOf="ft_t_uwch.anncmnt_dte"/> 
    </defaultFields></occurrence>  
  <occurrence table="ft_t_iscm" id="ISCMTRUSTEE" parentId="BASEISSU" label="Muni Details"> 
    <inputFields> 
      <field name="ft_t_iscm.cmnt_txt"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_iscm.ln_num" dataType="NUMBER" value="1"/>  
      <field name="ft_t_iscm.cmnt_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_iscm.cmnt_reas_typ" dataType="STRING" value="TRUSTEE"/> 
    </where> 
  </occurrence>  
  <occurrence table="ft_t_iscm" id="ISCMPAYAGNT" parentId="BASEISSU" label="Muni Details"> 
    <defaultFields> 
      <field name="ft_t_iscm.ln_num" dataType="NUMBER" value="1"/>  
      <field name="ft_t_iscm.cmnt_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_iscm.cmnt_txt"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_iscm.cmnt_reas_typ" dataType="STRING" value="PAYAGENT"/> 
    </where> 
  </occurrence>  
  <occurrence table="ft_t_isst" id="ISSTADJUST" parentId="BASEISSU" label="Coupon Details" autoDelete="true"> 
    <inputFields> 
      <field name="ft_t_isst.stat_char_val_txt"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isst.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_isst.stat_def_id" dataType="STRING" valueOf="ft_t_stdf.stat_def_id"> 
        <where> 
          <field name="ft_t_stdf.stat_def_id" dataType="STRING" value="ADJUST"/> 
        </where> 
      </field> 
    </defaultFields>  
    <where> 
      <field name="ft_t_isst.stat_def_id" dataType="STRING" value="ADJUST"/> 
    </where> 
  </occurrence>  
  <occurrence table="ft_t_isst" id="ISSTFLOATER" parentId="BASEISSU" label="Coupon Details" autoDelete="true"> 
    <inputFields> 
      <field name="ft_t_isst.stat_char_val_txt"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isst.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_isst.stat_def_id" dataType="STRING" valueOf="ft_t_stdf.stat_def_id"> 
        <where> 
          <field name="ft_t_stdf.stat_def_id" dataType="STRING" value="FLOATER"/> 
        </where> 
      </field> 
    </defaultFields>  
    <where> 
      <field name="ft_t_isst.stat_def_id" dataType="STRING" value="FLOATER"/> 
    </where> 
  </occurrence>  
  <occurrence table="ft_t_mnch" id="MNCHMUNIS" parentId="BASEISSU" label="Muni Characteristics"> 
    <inputFields> 
      <field name="ft_t_mnch.mand_put_ind"/>  
      <field name="ft_t_mnch.pre_rfnd_dte"/>  
      <field name="ft_t_mnch.rfnd_stat_ind"/> 
    </inputFields> 
  </occurrence>  
  <occurrence table="ft_t_mnes" id="MNESMUNIS" parentId="MNCHMUNIS" label="Muni Escrow"> 
    <where> 
      <field name="ft_t_mnes.escrow_num" dataType="NUMBER" value="1"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_mnes.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_mnes.escrow_cpct"/>  
      <field name="ft_t_mnes.escrow_typ"/> 
    </inputFields> 
  </occurrence>  
  <occurrence table="ft_t_mnpu" id="MNPUMUNIS" parentId="MNCHMUNIS" label="Muni Purpose"> 
    <inputFields> 
      <field name="ft_t_mnpu.muni_purp_typ"/>  
      <field name="ft_t_mnpu.muni_purp_cpct"/> 
    </inputFields>  
    <defaultFields/>  
    <where> 
      <field name="ft_t_mnpu.muni_purp_num" dataType="NUMBER" value="1"/> 
    </where> 
  </occurrence>  
  <occurrence extends="BDSTBDEBT" table="ft_t_bdst" id="BDSTBDEBT" parentId="BASEISSU" label="Issue Details/Coupon Details"> 
    <inputFields> 
      <field name="ft_t_bdst.escrow_mat_dte"/> 
    <field name="ft_t_bdst.outst_camt"/><field name="ft_t_bdst.prev_cpn_dte"/><field name="ft_t_bdst.nxt_cpn_dte"/><field name="ft_t_bdst.cpn_crte"/><field name="ft_t_bdst.stats_eff_tms"/><field name="ft_t_bdst.crrnt_iss_camt"/></inputFields> 
  <where> 
      <field name="ft_t_bdst.latest_bdst" dataType="STRING" value="Y"/> 
    </where><defaultFields> 
      <field name="ft_t_bdst.stats_eff_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_bdst.real_first_py_tms" dataType="DATETIME" srcOccurrence="IEDFBDEBT" valueOf="ft_t_iedf.first_py_tms" keepInSync="true"/> 
    </defaultFields></occurrence>  
  <occurrence table="ft_t_uwst" id="UWSTMUNIS" parentId="UWCHBDEBT"> 
    <inputFields> 
      <field name="ft_t_uwst.orig_yld_cpct"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_uwst.stats_eff_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_uwst.stats_curr_cde" dataType="STRING" valueOf="ft_t_issu.denom_curr_cde" srcOccurrence="BASEISSU"/> 
    </defaultFields> 
  </occurrence>  
  <!--Moved from the basedebt model because this field is no longer used in the Assetbsec or MBS models-->  
  <occurrence extends="IEDFBDEBT" level="3" table="ft_t_iedf" id="IEDFBDEBT" parentId="BASEISSU" label="Coupon Details/Spread Details"> 
    <inputFields> 
      <field name="ft_t_iedf.penult_cpn_tms" level="3"/> 
    <field name="ft_t_iedf.days_yr_bas_typ" level="3"/><field name="ft_t_iedf.days_mth_bas_typ" level="3"/><field name="ft_t_iedf.rtfx_fq_sp_typ"/><field name="ft_t_iedf.rtfx_fq_qty"/><field name="ft_t_iedf.rtfx_fq_dy_typ"/><field name="ft_t_iedf.flt_bas_pt_cqty"/><field name="ft_t_iedf.first_py_tms"/><field name="ft_t_iedf.py_dte_fq_qty"/><field name="ft_t_iedf.py_dte_fq_dy_typ"/><field name="ft_t_iedf.py_dte_fq_sp_typ"/></inputFields> 
  <where> 
      <field name="ft_t_iedf.ev_typ" dataType="STRING" value="INTEREST"/> 
    </where><defaultFields> 
      <field name="ft_t_iedf.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_iedf.verif_ind" dataType="STRING" value="N"/> 
    </defaultFields></occurrence>  
  <!--Added the below occurences since Exchange level Summary has been added for COVTBOND-->  
  <occurrence extends="MKISPMBISSU" table="ft_t_mkis" id="MKISPMBISSU" parentId="BASEISSU" multiple="false" label="Market Details"> 
    <inputFields> 
      <field name="ft_t_mkis.mkt_oid" label="Primary Exchange Name"/>  
      <field name="ft_t_mkis.norm_mkt_sz_cqty" label="Quote Lot Size"/>  
      <field name="ft_t_mkis.trdng_stat_typ" label="Market Status"/> 
      <field name="ft_t_mkis.actively_traded_ind"/>
    <field name="ft_t_mkis.iss_prc_ut_camt"/><field name="ft_t_mkis.rnd_lot_sz_cqty"/><field name="ft_t_mkis.trdng_curr_cde"/></inputFields> 
  <validationRules> 
      <rule id="Warning" messageType="WARNING"> 
        <xPath value="boolean(string-length(%modelPath:MKISPMBISSU:ft_t_mkis.end_tms%)= 0 or string-length(%modelPath:MKISPMBISSU:ft_t_mkis.end_tms%) <  SYSDATE())"/>  
        <errorMessage value="Primary Market is end dated"/> 
      </rule> 
    </validationRules><where> 
      <field name="ft_t_mkis.prim_trd_mkt_ind" dataType="STRING" value="Y"/> 
    </where><defaultFields> 
      <!--<field name="ft_t_mkis.trdng_stat_typ" dataType="STRING" value="ACTIVE"/>  
      -->  
      <field name="ft_t_mkis.prc_ut_meas_typ" dataType="STRING" value="NOMINAL"/>  
      <!--<field name="ft_t_mkis.mkt_iss_oid" dataType="STRING" valueOfFunction="OID" uiOnly="true"/> 
      --> 
    </defaultFields></occurrence>  
  <occurrence extends="MIXR_PRIM" table="ft_t_mixr" id="MIXR_PRIM" parentId="MKISPMBISSU" label=" Market Issue Cross Reference ((Primary)" dbConstraint="MKISMIXR"><defaultFields> 
      <field name="ft_t_mixr.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
      <field name="ft_t_mixr.trdng_stat_typ" dataType="STRING" srcOccurrence="MKISPMBISSU" valueOf="ft_t_mkis.trdng_stat_typ"/> 
    </defaultFields></occurrence>  
  <occurrence extends="MKISDEFBISSU" table="ft_t_mkis" id="MKISDEFBISSU" parentId="BASEISSU" autoCreate="false" multiple="true"> 
    <inputFields> 
      <field name="ft_t_mkis.trdng_stat_typ" label="Market Status"/>  
      <field name="ft_t_mkis.actively_traded_ind"/>
      <field name="ft_t_mkis.norm_mkt_sz_cqty" label="Quote Lot Size"/>  
      <field name="ft_t_mkis.mrgn_sec_ind" label="Marginable"/>  
      <field name="ft_t_mkis.settle_curr_cde"/>  
      <field name="ft_t_mkis.trd_lot_size_cqty"/>  
      <field name="ft_t_mkis.prim_trd_mkt_ind" label="Primary Exchange"/>  
      <field name="ft_t_mkis.prc_curr_cde" label="Quotation Currency"/>  
      <field name="ft_t_mkis.mkt_oid" label="Exchange Name"/> 
    <field name="ft_t_mkis.trdng_curr_cde"/><field name="ft_t_mkis.iss_prc_ut_camt"/><field name="ft_t_mkis.rnd_lot_sz_cqty"/><field name="ft_t_mkis.gu_id" label="Trading Country"/><field name="ft_t_mkis.opol_ind"/></inputFields>  
    <!--<defaultFields>
			<field name="ft_t_mkis.prim_trd_mkt_ind" dataType="STRING" value="N"/>
		</defaultFields>--> 
  <defaultFields> 
        
      <!--<field name="ft_t_mkis.trdng_stat_typ" value="ACTIVE" dataType="STRING"/>  
      -->  
      <field name="ft_t_mkis.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_mkis.last_chg_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_mkis.last_chg_usr_id" dataType="STRING" valueOfFunction="APPUSER"/> 
    </defaultFields></occurrence>  
  <occurrence extends="MIXRBISSU" table="ft_t_mixr" id="MIXRBISSU" parentId="MKISDEFBISSU" multiple="true" dbConstraint="MKISMIXR"><defaultFields> 
      <field name="ft_t_mixr.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
        
      <field name="ft_t_mixr.trdng_stat_typ" dataType="STRING" srcOccurrence="MKISDEFBISSU" valueOf="ft_t_mkis.trdng_stat_typ"/>  
      <field name="ft_t_mixr.last_chg_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_mixr.last_chg_usr_id" dataType="STRING" valueOfFunction="APPUSER"/> 
    </defaultFields><inputFields> 
      <field name="ft_t_mixr.end_tms"/> 
    </inputFields></occurrence>  
  <presentation> 
    <until level="100"> 
      <override class="codf" rendered="false"/>  
      <override class="eqch" rendered="false"/>  
      <override class="fnch" rendered="false"/>  
      <override class="ench" rendered="false"/>  
      <override class="fech" rendered="false"/>  
      <override class="epst" rendered="false"/> 
    </until> 
  </presentation> 
<occurrence table="ft_t_isst" id="ISSTRCDTEBONDMRKT" parentId="BASEISSU" label="Coupon Details" autoDelete="true"> 
    <defaultFields> 
      <field name="ft_t_isst.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
      <field name="ft_t_isst.stat_def_id" dataType="STRING" valueOf="ft_t_stdf.stat_def_id">
        <where>
          <field name="ft_t_stdf.stat_def_id" dataType="STRING" value="GILEXDDT"/>
        </where>
      </field>
    </defaultFields>  
    <where> 
      <field name="ft_t_isst.stat_def_id" dataType="STRING" value="GILEXDDT"/> 
    </where>  
    <inputFields> 
      <!--<field name="ft_t_isst.stat_char_val_txt"/>  -->
      <field name="ft_t_isst.stat_val_dte"/> 
    </inputFields> 
  </occurrence><occurrence extends="ISMC_PRNT" level="3" table="ft_t_ismc" id="ISMC_PRNT" parentId="BASEISSU" autoDelete="false">  
    <inputFields> 
      <field name="ft_t_ismc.cap_nominal_camt" level="3"/> 
	<field name="ft_t_ismc.cap_chg_eff_tms"/></inputFields> 
  <where activeOnly="true"> 
      <field name="ft_t_ismc.capital_typ" value="OUTSTAND" dataType="STRING"/> 
    </where></occurrence><occurrence table="ft_t_isgu" id="ISGUBDEBT" parentId="BASEISSU" label="Issue Details"> 
    <inputFields> 
      <field name="ft_t_isgu.gu_cnt"/>  
      <field name="ft_t_isgu.gu_id"/>  
      <field name="ft_t_isgu.gu_typ"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isgu.start_tms" dataType="DATETIME" srcOccurrence="BASEISSU" valueOf="ft_t_issu.start_tms"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_isgu.iss_gu_purp_typ" dataType="STRING" value="DOMICILE"/> 
    </where> 
  </occurrence><occurrence table="ft_t_isst" id="ISSTBDEBT" parentId="BASEISSU" label="Issue Details" autoDelete="true"> 
    <defaultFields> 
      <field name="ft_t_isst.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_isst.stat_def_id" dataType="STRING" valueOf="ft_t_stdf.stat_def_id"> 
        <where> 
          <field name="ft_t_stdf.stat_def_id" dataType="STRING" value="CTRYGUAR"/> 
        </where> 
      </field> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_isst.stat_char_val_txt"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_isst.stat_def_id" dataType="STRING" value="CTRYGUAR"/> 
    </where> 
  </occurrence><occurrence table="ft_t_iscm" id="ISCMGUARBDEBT" parentId="BASEISSU" label="Issue Details"> 
    <defaultFields> 
      <field name="ft_t_iscm.ln_num" dataType="NUMBER" value="1"/>  
      <field name="ft_t_iscm.cmnt_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_iscm.cmnt_txt"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_iscm.cmnt_reas_typ" dataType="STRING" value="GUARNTOR"/> 
    </where> 
  </occurrence><occurrence table="ft_t_iscm" id="ISCMLEADBDEBT" parentId="BASEISSU" label="Issue Details"> 
    <inputFields> 
      <field name="ft_t_iscm.cmnt_txt"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_iscm.ln_num" dataType="NUMBER" value="1"/>  
      <field name="ft_t_iscm.cmnt_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_iscm.cmnt_reas_typ" dataType="STRING" value="LEADMGR"/> 
    </where> 
  </occurrence><occurrence table="ft_t_ievp" id="IEVPBDEBT" parentId="IEDFBDEBT" label="Income Event Participant"> 
    <defaultFields> 
      <field name="ft_t_ievp.start_tms" dataType="DATETIME" srcOccurrence="IEDFBDEBT" valueOf="ft_t_iedf.start_tms" keepInSync="true"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_pedf" id="PEDFBDEBT" parentId="BASEISSU" autoDelete="false"> 
    <where> 
      <field name="ft_t_pedf.ev_typ" dataType="STRING" value="REDEMPT"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_pedf.verif_ind" dataType="STRING" value="N"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_pedf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_pevp" id="PEVPBDEBT" parentId="PEDFBDEBT" autoDelete="false"> 
    <defaultFields> 
      <field name="ft_t_pevp.start_tms" dataType="DATETIME" srcOccurrence="PEDFBDEBT" valueOf="ft_t_pedf.start_tms" keepInSync="true"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_pevp.prt_purp_typ" dataType="STRING" value="REDEMPT"/> 
    </where> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDFBDEBT" parentId="PEVPBDEBT" label="Redemption" autoDelete="false"> 
    <defaultFields> 
      <!--<field name="ft_t_ppdf.start_tms" dataType="DATETIME" srcOccurrence="PEDFBDEBT" valueOf="ft_t_pedf.start_tms" keepInSync="true"/>-->  
      <field name="ft_t_ppdf.prin_pay_def_id" dataType="STRING" valueOfFunction="OID"/>  
      <field name="ft_t_ppdf.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_instr_id" label="Redemption Currency"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms" dataType="DATETIME"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_ppdf.ev_rate_bas_typ" dataType="STRING" value="PAR VAL"/>  
      <field name="ft_t_ppdf.ev_rate_typ" dataType="STRING" value="PERCENT"/>  
      <field name="ft_t_ppdf.iss_part_rl_typ" dataType="STRING" value="RECEIVE"/> 
    </where> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDFBDEBT_AMT" parentId="PEVPBDEBT" label="Redemption" autoDelete="false"> 
    <defaultFields> 
      <field name="ft_t_ppdf.prin_pay_def_id" dataType="STRING" valueOfFunction="OID"/>  
      <field name="ft_t_ppdf.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <!--<field name="ft_t_ppdf.ev_instr_id" dataType="STRING" srcOccurrence="PPDFBDEBT" valueOf="ft_t_ppdf.ev_instr_id"/>-->  
      <!--<field name="ft_t_ppdf.pay_curr_cde" dataType="STRING" srcOccurrence="PPDFBDEBT" valueOf="ft_t_ppdf.pay_curr_cde" keepInSync="true"/>--> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.ev_instr_id" label="Redemption Currency"/>  
      <field name="ft_t_ppdf.ev_crte" dataType="NUMBER"/>  
      <field name="ft_t_ppdf.start_tms" dataType="DATETIME"/>
    </inputFields>  
    <where> 
      <field name="ft_t_ppdf.ev_rate_bas_typ" dataType="STRING" value="PAR VAL"/>  
      <field name="ft_t_ppdf.ev_rate_typ" dataType="STRING" value="AMOUNT"/>  
      <field name="ft_t_ppdf.iss_part_rl_typ" dataType="STRING" value="RECEIVE"/> 
    </where> 
  </occurrence><occurrence table="ft_t_isll" id="ISLL_SUB" parentId="BASEISSU"> 
    <inputFields> 
      <field name="ft_t_isll.iss_coll_nme" dataType="STRING"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_isll.coll_typ" dataType="STRING" value="Subordinated"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_isll.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_isll" id="ISLL_SEC" parentId="BASEISSU"> 
    <inputFields> 
      <field name="ft_t_isll.iss_coll_nme" dataType="STRING"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_isll.coll_typ" dataType="STRING" value="Secured"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_isll.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_isll" id="ISLL_GRP_MBS" parentId="BASEISSU"> 
    <inputFields> 
      <field name="ft_t_isll.coll_grp_desc" dataType="STRING"/>  
      <field name="ft_t_isll.iss_coll_nme" dataType="STRING"/>  
      <field name="ft_t_isll.coll_typ" dataType="STRING"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_isll.coll_typ" dataType="STRING" value="Mortgage Backed"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_isll.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_isll" id="ISLL_GRP_ABS" parentId="BASEISSU"> 
    <inputFields> 
      <field name="ft_t_isll.coll_grp_desc" dataType="STRING"/>  
      <field name="ft_t_isll.iss_coll_nme" dataType="STRING"/>  
      <field name="ft_t_isll.coll_typ" dataType="STRING"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_isll.coll_typ" dataType="STRING" value="Asset Backed"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_isll.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_iscl" id="ISCL_MIZUNIQE" parentId="BASEISSU" label="Uniqueness"> 
    <inputFields> 
      <field name="ft_t_iscl.cl_value" dataType="STRING"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_iscl.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_iscl.indus_cl_set_id" dataType="STRING" value="MIZUNIQE"/> 
    </where> 
  </occurrence><occurrence table="ft_t_frip" id="FRIP_CSTM" parentId="BASEISSU"> 
    <where> 
      <field name="ft_t_frip.finsrl_typ" dataType="STRING" value="GUARNTOR"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_frip.prt_purp_typ" dataType="STRING" value="GUARANTR"/>  
      <field name="ft_t_frip.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_frip.inst_mnem" dataType="STRING"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_isgp" id="ISGP_CSTM" parentId="BASEISSU" dbConstraint="isgpf002"> 
    <where> 
      <field name="ft_t_isgp.prt_purp_typ" dataType="STRING" value="ISIDGRP"/>  
      <field name="ft_t_isgp.prnt_iss_grp_oid" dataType="STRING" valueOf="ft_t_isgr.iss_grp_oid"> 
        <where> 
          <field name="ft_t_isgr.grp_nme" value="FCY" dataType="STRING"/> 
        </where> 
      </field> 
    </where>  
    <defaultFields>   
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_isgp.instr_id" dataType="STRING"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_ridf" id="RIDF_CSTM" parentId="BASEISSU"> 
    <where> 
      <field name="ft_t_ridf.rel_typ" dataType="STRING" value="CreditLinked"/> 
    </where>  
    <defaultFields>   
      <field name="ft_t_ridf.rel_desc" dataType="STRING" value="CreditLinked"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_riss" id="RISS_CSTM" parentId="RIDF_CSTM"> 
    <defaultFields> 
      <field name="ft_t_riss.part_units_typ" dataType="STRING" value="ALL"/>  
      <field name="ft_t_riss.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_riss.iss_part_rl_typ" dataType="STRING" value="UNDLYING"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_riss.instr_id" dataType="STRING"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_isde" id="ISDEBISSU" parentId="BASEISSU" label="Issue Description" level="1"> 
    <defaultFields> 
      <field name="ft_t_isde.desc_srce_typ" dataType="STRING" value="INHOUSE"/>  
      <field name="ft_t_isde.nls_cde" dataType="STRING" value="ENGLISH"/>  
      <field name="ft_t_isde.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_isde.iss_nme" label="Instrument Name" level="1"/>  
      <field name="ft_t_isde.start_tms"/>  
      <field name="ft_t_isde.iss_desc" label="Instrument Description"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_isde.desc_usage_typ" dataType="STRING" value="PRIMARY"/> 
    </where> 
  </occurrence><occurrence table="ft_t_isde" id="ISDE_VENDOR" parentId="BASEISSU" label="Issue Description"> 
    <defaultFields> 
      <field name="ft_t_isde.nls_cde" dataType="STRING" value="ENGLISH"/>  
      <field name="ft_t_isde.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_isde.iss_nme" label="Instrument Name"/>  
      <field name="ft_t_isde.start_tms"/>  
      <field name="ft_t_isde.iss_desc" label="Instrument Description"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_isde.desc_srce_typ" dataType="STRING" value="VENDOR"/> 
    </where> 
  </occurrence><occurrence table="ft_t_isid" id="ISID_Iss_level" parentId="BASEISSU" label="Issue Identifiers" multiple="true" dbConstraint="ISSUISID"> 
    <inputFields> 
      <field name="ft_t_isid.iss_id" label="Identifier Value"/>  
      <field name="ft_t_isid.id_ctxt_typ" label="Identifier Type"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <validationRules> 
      <rule id="ISINMarket"> 
        <xPath value="boolean(not(%modelPath:ISID_Iss_level:ft_t_isid.id_ctxt_typ% =''ISIN'' and not(string-length(%modelPath:ISID_Iss_level:ft_t_isid.mkt_oid%) = 0)))"/>  
        <errorMessage value="ISIN identifier cannot have market."/> 
      </rule>  
      <!--<rule id="ISSUTXTTYPNOTSUPPORTED" messageType="WARNING"> 
	   <xPath value="boolean(not(%modelPath:ISID_Iss_level%/intlvlid_supported=''0''))"/>
          <errorMessageXPath value="concat(%modelPath:ISID_Iss_level:ft_t_isid.id_ctxt_typ%,'' is no longer supported as a valid Instrument Level Identifier. Please take necessary action.'')"/>
		 </rule>--> 
    </validationRules> 
  </occurrence><occurrence table="ft_t_isid" id="ISID_MKT_Iss_level_PUB" parentId="BASEISSU" label="Global Market Identifiers pub" multiple="true" dbConstraint="MRKTISIDPUB"> 
    <!-- <where> 
      <field name="ft_t_isid.mkt_oid" dataType="STRING" isNull="false"/> 
    </where> -->  
    <inputFields> 
      <field name="ft_t_isid.iss_id" label="Identifier Value"/>  
      <field name="ft_t_isid.id_ctxt_typ" label="Identifier Type"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <validationRules> 
      <rule id="ISINMarket"> 
        <xPath value="boolean(not(%modelPath:ISID_MKT_Iss_level_PUB:ft_t_isid.id_ctxt_typ% =''ISIN'' and not(string-length(%modelPath:ISID_MKT_Iss_level_PUB:ft_t_isid.mkt_oid%) = 0)))"/>  
        <errorMessage value="ISIN identifier cannot have market."/> 
      </rule> 
    </validationRules> 
  </occurrence><occurrence table="ft_t_isid" id="ISIDBISIN" parentId="BASEISSU" label="Identifiers"> 
    <inputFields> 
      <field name="ft_t_isid.iss_id"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_isid.id_ctxt_typ" dataType="STRING" value="ISIN"/> 
    </where> 
  </occurrence><occurrence table="ft_t_isid" id="ISIDBINH" parentId="BASEISSU" label="Identifiers"> 
    <inputFields> 
      <field name="ft_t_isid.iss_id"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_isid.id_ctxt_typ" dataType="STRING" value="INHOUSE"/> 
    </where> 
  </occurrence><occurrence table="ft_t_isid" id="ISIDBCUS" parentId="BASEISSU" label="Identifiers"> 
    <inputFields> 
      <field name="ft_t_isid.iss_id"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_isid.id_ctxt_typ" dataType="STRING" value="CUSIP"/> 
    </where> 
  </occurrence><occurrence table="ft_t_isid" id="ISIDBCOM" parentId="BASEISSU" label="Identifiers"> 
    <inputFields> 
      <field name="ft_t_isid.iss_id"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_isid.id_ctxt_typ" dataType="STRING" value="COMMON"/> 
    </where> 
  </occurrence><occurrence table="ft_t_isid" id="ISIDVAL" parentId="BASEISSU" label="Identifiers"> 
    <inputFields> 
      <field name="ft_t_isid.iss_id"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_isid.id_ctxt_typ" dataType="STRING" value="VALOREN"/> 
    </where> 
  </occurrence><occurrence table="ft_t_iscl" id="ISCL_INSUBTYP" parentId="BASEISSU" label="Issue Classification" dbConstraint="SUBTYPE" multiple="false"> 
    <where> 
      <field name="ft_t_iscl.clsf_purp_typ" dataType="STRING" value="INSUBTYP"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_iscl.cl_value" label="Instrument Sub-Type"/>  
      <field name="ft_t_iscl.indus_cl_set_id"/>  
      <field name="ft_t_iscl.clsf_oid"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_iscl.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_fnch" id="FNCH_ALL" parentId="BASEISSU" label="Fund Characteristics"> 
    <defaultFields> 
      <!--<field name="ft_t_fnch.chars_eff_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>-->    
    </defaultFields> 
  </occurrence><occurrence table="ft_t_iscm" id="ISCMBISSU" parentId="BASEISSU" label="Comments"> 
    <defaultFields> 
      <field name="ft_t_iscm.cmnt_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_iscm.ln_num" dataType="NUMBER" value="1"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_iscm.cmnt_txt"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_iscm.cmnt_reas_typ" dataType="STRING" value="COMMENT"/> 
    </where> 
  </occurrence><occurrence table="ft_t_isrt" id="ISRTBISSU" parentId="BASEISSU" multiple="true" label="Rating"> 
    <inputFields> 
      <field name="ft_t_isrt.rtng_curr_typ"/>  
      <field name="ft_t_isrt.rtng_purp_typ"/>  
      <field name="ft_t_isrt.rtng_set_oid"/>  
      <field name="ft_t_isrt.rtng_cde"/>  
      <field name="ft_t_isrt.start_tms"/>  
      <field name="ft_t_isrt.rtng_eff_tms"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isrt.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>      
    </defaultFields> 
  </occurrence><occurrence table="ft_t_rgch" id="RGCHBISSU" parentId="BASEISSU" label="Regulatory Information"> 
    <inputFields> 
      <field name="ft_t_rgch.gu_id"/>  
      <field name="ft_t_rgch.gu_cnt"/>  
      <field name="ft_t_rgch.gu_typ"/>  
      <field name="ft_t_rgch.isma_regulated_ind"/>  
      <field name="ft_t_rgch.rule_144a_ind"/>  
      <field name="ft_t_rgch.reg_s_ind"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_rgch.start_tms" dataType="DATETIME" srcOccurrence="BASEISSU" valueOf="ft_t_issu.start_tms"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_isid" id="ISID_TIC_PM_PUB" parentId="MIXR_PRIM" label="Issue Identifier-Ticker" dbConstraint="MIXRISIDPUB"> 
    <where> 
      <field name="ft_t_isid.id_ctxt_typ" dataType="STRING" value="TICKER"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_isid.iss_id" label="Primary Ticker"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isid.isid_oid" dataType="STRING" srcOccurrence="MIXR_PRIM" valueOf="ft_t_mixr.isid_oid"/>  
      <field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_isid.mkt_oid" dataType="STRING" srcOccurrence="MKISPMBISSU" valueOf="ft_t_mkis.mkt_oid"/>  
      <field name="ft_t_isid.instr_id" dataType="STRING" srcOccurrence="BASEISSU" valueOf="ft_t_issu.instr_id"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_isxr" id="BISSU_ISXR_ISID" parentId="LISTISID_BISSU" multiple="true" autoDelete="false"> 
    <where> 
      <field name="ft_t_isxr.isid_oid" dataType="STRING" srcOccurrence="LISTISID_BISSU" valueOf="ft_t_isid.isid_oid"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_isxr.last_chg_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_isxr.last_chg_usr_id" dataType="STRING" valueOfFunction="APPUSER"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_isxr.isxr_rel_purp_typ"/>  
      <field name="ft_t_isxr.start_tms"/>  
      <field name="ft_t_isxr.end_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_must" id="MUST_MICOPOL" parentId="MKISDEFBISSU" autoDelete="false"> 
    <where> 
      <field name="ft_t_must.stat_def_id" dataType="STRING" value="MICOPOL"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_must.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_must.stat_char_val_txt" label="OPOL"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_must" id="MUST_CDREXCH" parentId="MKISDEFBISSU" autoDelete="false"> 
    <where> 
      <field name="ft_t_must.stat_def_id" dataType="STRING" value="CDREXCH"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_must.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_must.stat_char_val_txt" label="Exchange Calendar"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_ispc" id="ISPCBISSU" parentId="BASEISSU" label="Issue Price Details"> 
    <inputFields> 
      <field name="ft_t_ispc.prc_typ"/>  
      <field name="ft_t_ispc.prc_srce_typ"/>  
      <field name="ft_t_ispc.prc_tms"/>  
      <field name="ft_t_ispc.unit_cprc"/>  
      <field name="ft_t_ispc.prc_curr_cde"/> 
    </inputFields>  
    <defaultFields> 
      <!--      <field name="ft_t_ispc.prc_curr_cde" dataType="STRING" srcOccurrence="BASEISSU" valueOf="ft_t_issu.denom_curr_cde"/>  -->  
      <field name="ft_t_ispc.prc_qt_meth_typ" dataType="STRING" value="1"/>  
      <field name="ft_t_ispc.prc_valid_typ" dataType="STRING" value="VALID"/>  
      <field name="ft_t_ispc.prcng_meth_typ" dataType="STRING" value="1"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_ievp" id="IEVP_DIV_or_INT" parentId="IEDF_DIV_or_INT" label="Income Event Participant(Dividend/Interest)"> 
    <defaultFields> 
      <field name="ft_t_ievp.prt_purp_typ" dataType="STRING" value="PMTDTLS"/>  
      <field name="ft_t_ievp.start_tms" dataType="DATETIME" srcOccurrence="IEDF_DIV_or_INT" valueOf="ft_t_iedf.start_tms"/> 
    </defaultFields>  
    <!--<validationRules>
			<rule id="Unique_IPDF">
				<xPath value="is-unique(%modelPath:IPDF_DIV_or_INT%, &quot;concat(ipdf.pay_curr_cde, substring((ipdf.start_tms), 1, 10))&quot;)"/>
				<errorMessage value="Payment currency and Start Date/Time combination should be unique in Income Payments of Dividend/Interest Section"/>	
			</rule>
		</validationRules>--> 
  </occurrence><occurrence table="ft_t_ipdf" id="IPDF_DIV_or_INT" parentId="IEVP_DIV_or_INT" multiple="true" label="Income Payment Definition(Dividend/Interest)"> 
    <inputFields> 
      <field name="ft_t_ipdf.start_tms"/>  
      <field name="ft_t_ipdf.ev_rate_typ"/>  
      <field name="ft_t_ipdf.ev_crte"/>  
      <field name="ft_t_ipdf.iss_part_rl_typ"/>  
      <field name="ft_t_ipdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ipdf.pay_curr_cde"/>  
      <field name="ft_t_ipdf.end_tms"/> 
    </inputFields>  
    <defaultFields/> 
  </occurrence><occurrence table="ft_t_pevp" id="PEVP_CALL_or_SINK" parentId="PEDF_CALL_or_SINK" label="Principal Event Participant(Call/Sink)" autoDelete="false"> 
    <defaultFields> 
      <field name="ft_t_pevp.start_tms" dataType="DATETIME" srcOccurrence="PEDF_CALL_or_SINK" valueOf="ft_t_pedf.start_tms" keepInSync="true"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_pevp.prt_purp_typ" dataType="STRING" value="SNKFDRED"/> 
    </where>  
    <validationRules> 
      <rule id="Unique_PPDF_Call_or_Sink"> 
        <xPath value="is-unique(%modelPath:PPDF_CALL_or_SINK%, &quot;concat(ppdf.pay_curr_cde,substring((ppdf.start_tms), 1, 10))&quot;)"/>  
        <!--        <xPath value="is-unique(%modelPath:PPDF_CALL_or_SINK%,&quot;substring((ppdf.start_tms), 1,10)&quot;)"/>  -->  
        <errorMessage value="Payment currency and Start Date/Time combination should be unique in Principal Payments of Call/Sink Section"/> 
      </rule> 
    </validationRules> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_CALL_or_SINK" parentId="PEVP_CALL_or_SINK" multiple="true" label="Principal Payment Definition(Call/Sink)" autoDelete="false"> 
    <inputFields> 
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.start_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/> 
    </inputFields>  
    <defaultFields/> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_PUT_or_FACTOR" parentId="PEVP_PUT_or_FACTOR" multiple="true" label="Principal Payment Definition(Factor)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_PUT" parentId="PEVP_PUT" multiple="true" label="Principal Payment Definition(Put)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_NEXTPUT" parentId="PEVP_NEXTPUT" multiple="true" label="Principal Payment Definition(NextPut)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_NXTPARPT" parentId="PEVP_NXTPARPT" multiple="true" label="Principal Payment Definition(NxtParpt)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_PUTPROV" parentId="PEVP_PUTPROV" multiple="true" label="Principal Payment Definition(PutProv)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_PUTSCHED" parentId="PEVP_PUTSCHED" multiple="true" label="Principal Payment Definition(PutSched)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_CALLABLE" parentId="PEVP_CALLABLE" multiple="true" label="Principal Payment Definition(Callable)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_CALLED" parentId="PEVP_CALLED" multiple="true" label="Principal Payment Definition(Called)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_CALATPAR" parentId="PEVP_CALATPAR" multiple="true" label="Principal Payment Definition(Calatpar)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_CALATPRE" parentId="PEVP_CALATPRE" multiple="true" label="Principal Payment Definition(Calatpre)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_isgp" id="ISGP_UNIV" parentId="BASEISSU" label="Issue Group Participant" multiple="true" dbConstraint="isgpuniv"> 
    <defaultFields> 
      <field name="ft_t_isgp.prt_purp_typ" dataType="STRING" value="MANUAL"/>  
      <field name="ft_t_isgp.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_isgp.prnt_iss_grp_oid"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_cucn" id="CUCN" parentId="BASEISSU"> 
    <defaultFields> 
      <field name="ft_t_cucn.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_cucf" id="CUCF" parentId="CUCN"> 
    <defaultFields> 
      <field name="ft_t_cucf.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_cucf.instr_id" dataType="STRING" valueOfXPath="/root/issue/issu.instr_id"/> 
    </defaultFields> 
  </occurrence><relations><table name="FT_T_ISLL"><relation relatedTable="FT_T_ISSU" name="isllissu">
            <fromColumns>
                <column name="instr_id"/>
            </fromColumns>
            <toColumns>
                <column name="instr_id"/>
            </toColumns>
            <condition>
                <sql>#FROM_TABLE#.last_chg_tms in (SELECT max(last_chg_tms) FROM ft_t_isll where instr_id = #TO_TABLE#.instr_id)</sql>
            </condition>
        </relation></table><table name="FT_T_IEDF"><relation relatedTable="FT_T_ISSU" name="issuiedfinterest">
            <fromColumns>
                <column name="instr_id"/>
            </fromColumns>
            <toColumns>
                <column name="instr_id"/>
            </toColumns>
            <condition>
                <sql>#FROM_TABLE#.ev_typ IN (''INTEREST'')</sql>
            </condition>
        </relation></table><table name="FT_T_MKIS"><relation relatedTable="FT_T_ISSU" name="ISSUMKIS">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<condition>
				<sql>(#FROM_TABLE#.prim_trd_mkt_ind=''Y'' or (select count(*) from ft_t_mkis where ft_t_mkis.instr_id=#TO_TABLE#.instr_id and (ft_t_mkis.end_tms is null or ft_t_mkis.end_tms  >= SYSDATE()))=1)</sql>
			</condition>
		</relation></table><table name="FT_T_MIXR"><relation relatedTable="FT_T_MKIS" name="MKISMIXR">
			<fromColumns>
				<column name="MKT_ISS_OID"/>
			</fromColumns>
			<toColumns>
				<column name="MKT_ISS_OID"/>
			</toColumns>
		</relation></table><table name="FT_T_ISGU"><relation relatedTable="FT_T_ISSU" name="ISSUISGU">
            <fromColumns>
                <column name="INSTR_ID"/>
            </fromColumns>
            <toColumns>
                <column name="INSTR_ID"/>
            </toColumns>
            <condition>
                <sql>#FROM_TABLE#.gu_typ =''COUNTRY''</sql>
            </condition>
        </relation></table><table name="FT_T_IEVP"><relation relatedTable="FT_T_IEDF" name="iedfievpestdiv">
            <fromColumns>
                <column name="INC_EV_DEF_ID"/>
            </fromColumns>
            <toColumns>
                <column name="INC_EV_DEF_ID"/>
            </toColumns>
            <condition>
                <sql>#FROM_TABLE#.prt_purp_typ IN (''ESTIMATE'',''DIVIDEND'')</sql>
            </condition>
        </relation></table><table name="FT_T_PEDF"><relation relatedTable="FT_T_ISSU" name="pedffactorissu">
            <fromColumns>
                <column name="instr_id"/>
            </fromColumns>
            <toColumns>
                <column name="instr_id"/>
            </toColumns>
            <condition>
                <sql>#FROM_TABLE#.ev_typ IN (''FACTOR'')</sql>
            </condition>
        </relation></table><table name="FT_T_PEVP"><relation relatedTable="FT_T_PEDF" name="pevpfactorissu">
            <fromColumns>
                <column name="prin_ev_def_id"/>
            </fromColumns>
            <toColumns>
                <column name="prin_ev_def_id"/>
            </toColumns>
            <condition>
                <sql>#FROM_TABLE#.prt_purp_typ IN (''FACTOR'')</sql>
            </condition>
        </relation></table><table name="FT_T_PPDF"><relation relatedTable="FT_T_PEVP" name="ppdf_pevp">
            <fromColumns>
                <column name="PRIN_EV_PRT_ID"/>
            </fromColumns>
            <toColumns>
                <column name="PRIN_EV_PRT_ID"/>
            </toColumns>
            <condition>
                <sql>ROWNUM=1</sql>
            </condition>
        </relation></table><table name="FT_T_ISCL"><relation relatedTable="FT_T_ISSU" name="SUBTYPE">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<condition>
				<sql>#FROM_TABLE#.indus_cl_set_id in (''TKISSTYP'',''BBSECTYP'',''FTISSTYP'',''ASSETCLS'')</sql>
			</condition>
		</relation></table><table name="FT_T_RIDF"><relation relatedTable="FT_T_ISSU" name="ridfwarrant">
            <fromColumns>
                <column name="instr_id"/>
            </fromColumns>
            <toColumns>
                <column name="instr_id"/>
            </toColumns>
            <condition>
                <sql>#FROM_TABLE#.rel_typ IN (''WARRANT'',''WRT CALL'',''WRT PUT'')</sql>
            </condition>
        </relation></table><table name="FT_T_RISS"><relation relatedTable="FT_T_RIDF" name="risswarrant">
            <fromColumns>
                <column name="rld_iss_feat_id"/>
            </fromColumns>
            <toColumns>
                <column name="rld_iss_feat_id"/>
            </toColumns>
            <condition>
                <sql>#FROM_TABLE#.iss_part_rl_typ IN (''DELIVER'',''RECEIVE'',''UNDLYING'')</sql>
            </condition>
        </relation></table><table name="FT_T_ISID"><relation relatedTable="FT_T_ISSU" name="ISSUISID">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<condition>
					<sql>not exists (select 1 from ft_t_mixr mixr where (mixr.end_tms is null or mixr.end_tms  > SYSDATE()) and #FROM_TABLE#.ISID_OID=mixr.isid_oid) and #FROM_TABLE#.MKT_OID is null</sql>
				</condition>
		</relation></table><table name="FT_T_ISID"><relation relatedTable="FT_T_ISSU" name="MRKTISID">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<condition>
				<sql>not exists (select 1 from ft_t_mixr mixr where (mixr.end_tms is null or mixr.end_tms  > SYSDATE()) and #FROM_TABLE#.ISID_OID=mixr.isid_oid) and #FROM_TABLE#.MKT_OID is not null</sql>
		</condition>
		</relation></table><table name="FT_T_ISID"><relation relatedTable="FT_T_ISSU" name="MRKTISIDPUB">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<condition>			
				<sql>not exists (select 1 from ft_t_mixr mixr where (mixr.end_tms is null or mixr.end_tms  > SYSDATE()) and #FROM_TABLE#.ISID_OID=mixr.isid_oid) and #FROM_TABLE#.MKT_OID is not null</sql>			
			</condition>
		</relation></table><table name="FT_T_ISCL"><relation relatedTable="FT_T_ISSU" name="SUBTYPE">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<condition>
				<sql>#FROM_TABLE#.indus_cl_set_id in (''TKISSTYP'',''BBSECTYP'',''FTISSTYP'',''ASSETCLS'')</sql>
			</condition>
		</relation></table><table name="FT_T_RIST"><relation relatedTable="FT_T_ISSU" name="RIST_INSTR">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
		</relation></table><table name="FT_T_LMST"><relation relatedTable="FT_T_ISSU" name="latestlmst">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<condition>
				<sql>#FROM_TABLE#.last_chg_tms = (SELECT MAX (last_chg_tms) FROM ft_t_lmst WHERE ft_t_lmst.instr_id = #TO_TABLE#.instr_id)</sql>
			</condition>
		</relation></table><table name="FT_T_AISR"><relation relatedTable="FT_T_ISSU" name="MyAccountIssueRole">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<condition>
				<sql>#FROM_TABLE#.ACCT_ISSU_RL_TYP is not null</sql>
			</condition>
		</relation></table><table name="FT_T_AISR"><relation relatedTable="FT_T_ISSU" name="MyIssueAccountRole">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<!--Commented as AISR.ISSU_ACCT_RL_TYP has been removed (GT 37778)-->
			<!--<condition>
        <sql>#FROM_TABLE#.ISSU_ACCT_RL_TYP is not null</sql>
      </condition>-->
		</relation></table><table name="FT_T_ISRT"><relation relatedTable="FT_T_ISSU" name="RTNG_HIST" checkService="RATING_SERVICE">
			<condition>
				<sql>#FROM_TABLE#.SYS_EFF_END_TMS IS NULL AND (#FROM_TABLE#.INSTR_ID) = (#TO_TABLE#.INSTR_ID)</sql>
			</condition>
		</relation></table><table name="FT_T_MIXR"><relation relatedTable="FT_T_ISID" name="MIXRISID">
			<fromColumns>
				<column name="ISID_OID"/>
			</fromColumns>
			<toColumns>
				<column name="ISID_OID"/>
			</toColumns>
			<condition>
        <sql>exists (select 1 from FT_T_MIXR mixr where (mixr.end_tms IS NULL or mixr.end_tms  > p_asOfDate) and #TO_TABLE#.ISID_OID=mixr.isid_oid)</sql>
			</condition>
		</relation></table><table name="FT_T_MIXR"><relation relatedTable="FT_T_ISID" name="MIXRISIDPUB">
			<fromColumns>
				<column name="ISID_OID"/>
			</fromColumns>
			<toColumns>
				<column name="ISID_OID"/>
			</toColumns>
			<condition>				
				<sql>exists (select 1 from FT_T_MIXR mixr where (mixr.end_tms IS NULL or mixr.end_tms  > SYSDATE()) and #TO_TABLE#.ISID_OID=mixr.isid_oid)</sql>				
			</condition>
		</relation></table><table name="FT_T_MKIS"><relation relatedTable="FT_T_ISPC" name="LATESTPRICE">
			<fromColumns>
				<column name="INSTR_ID"/>
				<column name="MKT_OID"/>
				<column name="PRC_CURR_CDE"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
				<column name="MKT_OID"/>
				<column name="PRC_CURR_CDE"/>
			</toColumns>
			<condition>
				<sql>#TO_TABLE#.prc_tms = 
             (select max(prc_tms)
                from ft_t_ispc maxprc
               where maxprc.instr_id = #TO_TABLE#.instr_id
                 and maxprc.mkt_oid = #TO_TABLE#.mkt_oid
                 and maxprc.prc_curr_cde = #TO_TABLE#.prc_curr_cde)</sql>
			</condition>
		</relation></table><table name="FT_T_MUST"><relation relatedTable="FT_T_MKIS" name="mkismust">
            <fromColumns>
                <column name="MKT_ISS_OID"/>
            </fromColumns>
            <toColumns>
                <column name="MKT_ISS_OID"/>
            </toColumns>
        </relation></table><table name="FT_T_ISPC"><relation name="latestclosingprice" relatedTable="FT_T_ISSU">
            <fromColumns>
                <column name="INSTR_ID"/>
            </fromColumns>
            <toColumns>
                <column name="INSTR_ID"/>
            </toColumns>
            <condition>
                <sql>(#FROM_TABLE#.last_chg_tms
                      , #FROM_TABLE#.prc_tms
                      , COALESCE (#FROM_TABLE#.data_src_id, ''999'')
                      , #FROM_TABLE#.prc_srce_typ
                      , #FROM_TABLE#.prc_typ
                      || COALESCE (TRIM (#FROM_TABLE#.addnl_prc_qual_typ), ''999'')) IN
                            (  SELECT   MAX (last_chg_tms)
                                        , MAX (prc_tms)
                                        , COALESCE (data_src_id, ''999'')
                                        , prc_srce_typ
                                        , prc_typ
                                        || COALESCE (TRIM (addnl_prc_qual_typ), ''999'')
                                 FROM   ft_t_ispc ispc1
                                WHERE   instr_id = #FROM_TABLE#.instr_id
                                AND trim(prc_typ) || trim(addnl_prc_qual_typ) IN (''BID2171'',''ASKED2124'',''ASKED1'',''0031'',''0033'',''ASKED3'')      
                             GROUP BY   prc_tms,
                                        data_src_id,
                                        prc_srce_typ,
                                        prc_typ,
                                        addnl_prc_qual_typ,
                                        prc_qt_meth_typ)</sql>
            </condition>
        </relation></table><table name="FT_T_IPDF"><relation relatedTable="FT_T_IEVP" name="ipdfbasecpi">
            <fromColumns>
                <column name="INC_EV_PRT_ID"/>
            </fromColumns>
            <toColumns>
                <column name="INC_EV_PRT_ID"/>
            </toColumns>
            <condition>
                <sql>#FROM_TABLE#.rate_fixing_base_crte is not null and #FROM_TABLE#.start_tms = (select max(start_tms) from ft_t_ipdf where inc_ev_prt_id=#FROM_TABLE#.inc_ev_prt_id and rate_fixing_base_crte is not null)</sql>
            </condition>
        </relation></table><table name="FT_T_IRCL"><relation relatedTable="FT_T_ISSU" name="IRCL_ISSU">
			<fromColumns>
				<column name="INSTR_ISSR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ISSR_ID"/>
			</toColumns>
			<condition>
				<sql>(#FROM_TABLE#.instr_id = #TO_TABLE#.instr_id or #FROM_TABLE#.instr_id is null)</sql> 
			</condition>
		</relation></table><table name="FT_T_ISGP"><relation relatedTable="FT_T_ISSU" name="isgpuniv">
			<fromColumns>
				<column name="instr_id"/>
			</fromColumns>
			<toColumns>
				<column name="instr_id"/>
			</toColumns>
			<condition>
				<sql>TRIM(#FROM_TABLE#.PRNT_ISS_GRP_OID) in (SELECT TRIM(ISS_GRP_OID) FROM FT_T_ISGR WHERE GRP_PURP_TYP=''UNIVERSE'')</sql>
			</condition>
		</relation></table></relations></model>' WHERE modl_id ='MUNIS' AND modl_typ = 'ISSU';	

UPDATE FT_T_MDDF SET modl_schema ='<?xml version="1.0" encoding="UTF-8"?>
<model xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" headerInfoXPath="concat(%modelPath:BASEISSU:ft_t_issu.pref_iss_nme%,'' - '',%modelPath:BASEISSU:ft_t_issu.pref_id_ctxt_typ% ,''-'',%modelPath:BASEISSU:ft_t_issu.pref_iss_id%)" id="OPTIONS" extends="BDERIVAT" xsi:noNamespaceSchemaLocation="../../schemas/Model.xsd" minLevelToEnableChangeApproval="2">
	<!--<model xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="../../schemas/Model.xsd" >  -->
	<occurrence extends="BASEISSU" id="BASEISSU" table="ft_t_issu" level="1" label="Issue Description/Issue Details">
		<validationRules>
			<rule id="Validation_Issue Details">
				<xPath value="boolean((%modelPath:BASEISSU:ft_t_issu.iss_tms%  <  %modelPath:BASEISSU:ft_t_issu.mat_exp_tms%) or (string-length(%modelPath:BASEISSU:ft_t_issu.iss_tms%)=0 or string-length(%modelPath:BASEISSU:ft_t_issu.mat_exp_tms%)=0))"/>
				<errorMessage value="Issue Date should be less than Option Expiry Date"/>
			</rule>
			<rule id="ValidationISID">
				<xPath value="boolean((count(/root/issueidentifiers/identifier[@status!=''deleted'' or string-length(@status)=0]) >0)  or (/root/issue[@status!=''new'' or  string-length(@status)=0]))"/>

				<errorMessage value="At least one Instrument Level Identifier has to be entered."/>
			</rule>
			<rule id="ValidationISID_ACTIVITYSTATUS">
				<xPath value="boolean((count(/root/issueidentifiers/identifier[@status!=''deleted'' or string-length(@status)=0]) >0 or string(/root/issue/issu.iss_actvy_stat_typ)=''INACTIVE'')  or (/root/issue[@status=''new'' or  string-length(@status)!=0]))"/>

				<errorMessage value="User has either to mark the Issue activity status(Instrument Status)  as inactive or have at least one identifier active."/>
			</rule>
		<rule id="MultiplePrimaryMarkets" pageName="Market"> 
        <xPath value="boolean(count(%modelPath:MKISDEFBISSU%[(string-length(mkis.end_tms) = 0) and (mkis.prim_trd_mkt_ind = ''Y'')])  <  2)"/>  
        <errorMessage value="There should not be multiple primary markets for a single issue."/> 
      </rule></validationRules>
		<inputFields>
			<field name="ft_t_issu.mat_exp_tms" label="Option Expiry Date"/>
		<field name="ft_t_issu.denom_curr_cde" label="Currency" level="2"/><field name="ft_t_issu.iss_typ" level="1" label="Instrument Type"/><field name="ft_t_issu.sec_form_typ"/><field name="ft_t_issu.instr_issr_id"/><field name="ft_t_issu.nom_val_unit_camt"/><field name="ft_t_issu.distribution_curr_cde"/><field name="ft_t_issu.iss_tms" label="Instrument Date"/><field name="ft_t_issu.cl_typ"/></inputFields>
	<defaultFields> 
      <field name="ft_t_issu.access_auth_typ" dataType="STRING" value="PUBLIC"/>  
      <field name="ft_t_issu.iss_actvy_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_issu.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>
    </defaultFields></occurrence>
	<occurrence table="ft_t_ridf" id="RIDF_UND" parentId="BASEISSU" label="Contract Details" autoDelete="false">
		<defaultFields>
			<field name="ft_t_ridf.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>
			<field name="ft_t_ridf.xpd_start_tms" dataType="DATETIME" srcOccurrence="BASEISSU" valueOf="ft_t_issu.iss_tms" keepInSync="true"/>
			<field name="ft_t_ridf.xpd_end_tms" dataType="DATETIME" srcOccurrence="BASEISSU" valueOf="ft_t_issu.mat_exp_tms" keepInSync="true"/>
		</defaultFields>
		<where>
			<field name="ft_t_ridf.rel_typ" dataType="STRING" value="UNDERLYG"/>
		</where>
		<validationRules>
			<rule id="Validation_Exercise_Period">
				<xPath value="boolean((%modelPath:RIDF_UND:ft_t_ridf.xpd_start_tms%  < = %modelPath:RIDF_UND:ft_t_ridf.xpd_end_tms%) or (string-length(%modelPath:RIDF_UND:ft_t_ridf.xpd_start_tms%)=0 or string-length(%modelPath:RIDF_UND:ft_t_ridf.xpd_end_tms%)=0))"/>
				<errorMessage value="Exercise Start Date should be less than Exercise End date"/>
			</rule>
		</validationRules>
	</occurrence>
	<!--	Added the Occurrence RIDF_ALL so that the Validation condition can be checked for all records -->
	<!--	other than the one that is being defaulted in RIDF_UND occurrence -->
	<occurrence table="ft_t_ridf" id="RIDF_ALL" parentId="BASEISSU" label="Contract Details">
		<defaultFields>
			<field name="ft_t_ridf.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>
		</defaultFields>
		<where>
		</where>
		<validationRules>
			<rule id="Validation_Exercise_Period_All">
				<xPath value="boolean((%modelPath:RIDF_ALL:ft_t_ridf.xpd_start_tms%  < = %modelPath:RIDF_ALL:ft_t_ridf.xpd_end_tms%) or (string-length(%modelPath:RIDF_ALL:ft_t_ridf.xpd_start_tms%)=0 or string-length(%modelPath:RIDF_ALL:ft_t_ridf.xpd_end_tms%)=0))"/>
				<errorMessage value="Exercise Start Date should be less than Exercise End Date"/>
			</rule>
		</validationRules>
	</occurrence>
	<occurrence table="ft_t_riss" id="RISS_UND" parentId="RIDF_UND">
		<defaultFields>
			<field name="ft_t_riss.ev_amt_typ" dataType="STRING" value="UNIT"/>
			<field name="ft_t_riss.ev_bas_prt_camt" dataType="NUMBER" value="1"/>
			<field name="ft_t_riss.part_units_typ" dataType="STRING" value="ALL"/>
		</defaultFields>
		<inputFields>
			<field name="ft_t_riss.instr_id"/>
		</inputFields>
		<where>
			<field name="ft_t_riss.iss_part_rl_typ" dataType="STRING" value="UNDLYING"/>
		</where>
	</occurrence>
	<occurrence extends="OPCH" label="Issue Details/Contract Details" table="ft_t_opch" id="OPCH" parentId="BASEISSU">
		<inputFields>
			<field name="ft_t_opch.option_typ"/>
			<field name="ft_t_opch.exer_typ"/>
			<field name="ft_t_opch.call_put_typ" label="Put/Call"/>
			<field name="ft_t_opch.strke_cprc" label="Contract Rate"/>
		</inputFields>
	</occurrence>
	<!--<occurrence extends="ISID_TIC_EX" label="Trading Ticker">
		<validationRules>
			<rule id="Iss_Usage_req" messageType="WARNING">
				<xPath value="(string-length(%modelPath:ISID_TIC_EX:ft_t_isid.iss_usage_typ%)!= 0) "/>
				<errorMessage value="Issue Usage has to be entered for Trading Ticker"/>
			</rule>
		</validationRules>
	</occurrence>-->
	<occurrence extends="MKISPMBISSU" table="ft_t_mkis" id="MKISPMBISSU" parentId="BASEISSU" multiple="false" label="Market Details">
		<inputFields>
			<field name="ft_t_mkis.prc_mltplr_crte"/>
		<field name="ft_t_mkis.mkt_oid"/><field name="ft_t_mkis.iss_prc_ut_camt"/><field name="ft_t_mkis.rnd_lot_sz_cqty"/><field name="ft_t_mkis.trdng_curr_cde"/><field name="ft_t_mkis.trdng_stat_typ"/></inputFields>
	<validationRules> 
      <rule id="Warning" messageType="WARNING"> 
        <xPath value="boolean(string-length(%modelPath:MKISPMBISSU:ft_t_mkis.end_tms%)= 0 or string-length(%modelPath:MKISPMBISSU:ft_t_mkis.end_tms%) <  SYSDATE())"/>  
        <errorMessage value="Primary Market is end dated"/> 
      </rule> 
    </validationRules><where> 
      <field name="ft_t_mkis.prim_trd_mkt_ind" dataType="STRING" value="Y"/> 
    </where><defaultFields> 
      <!--<field name="ft_t_mkis.trdng_stat_typ" dataType="STRING" value="ACTIVE"/>  
      -->  
      <field name="ft_t_mkis.prc_ut_meas_typ" dataType="STRING" value="NOMINAL"/>  
      <!--<field name="ft_t_mkis.mkt_iss_oid" dataType="STRING" valueOfFunction="OID" uiOnly="true"/> 
      --> 
    </defaultFields></occurrence>
	<occurrence extends="MIXR_PRIM" table="ft_t_mixr" id="MIXR_PRIM" parentId="MKISPMBISSU" label=" Market Issue Cross Reference ((Primary)" dbConstraint="MKISMIXR"><defaultFields> 
      <field name="ft_t_mixr.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_mixr.trdng_stat_typ" dataType="STRING" srcOccurrence="MKISPMBISSU" valueOf="ft_t_mkis.trdng_stat_typ"/> 
    </defaultFields></occurrence>
	<!--<occurrence table="ft_t_isid" id="ISIDOBBUNQ" parentId="BASEISSU" label="Identifiers">
    <inputFields>
      <field name="ft_t_isid.iss_id" label="BB Unique"/>
    </inputFields>
    <defaultFields>
      <field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>
    </defaultFields>
    <where>
      <field name="ft_t_isid.id_ctxt_typ" dataType="STRING" value="BBUNIQUE"/>
    </where>
  </occurrence>-->
	<presentation>
		<until level="100">
			<override class="codf" rendered="false"/>
			<override class="mnch" rendered="false"/>
			<override class="lmch" rendered="false"/>
			<override class="fnch" rendered="false"/>
			<override class="ench" rendered="false"/>
			<override class="fech" rendered="false"/>
			<override class="epst" rendered="false"/>
		</until>
	</presentation>
<occurrence table="ft_t_isgu" id="ISGU_RISK" parentId="BASEISSU" label="Country of Risk"> 
    <inputFields> 
      <field name="ft_t_isgu.gu_cnt"/>  
      <field name="ft_t_isgu.gu_id"/>  
      <field name="ft_t_isgu.gu_typ"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isgu.start_tms" valueOf="ft_t_issu.start_tms" srcOccurrence="BASEISSU" dataType="DATETIME"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_isgu.iss_gu_purp_typ" dataType="STRING" value="RISK"/> 
    </where> 
  </occurrence><occurrence table="ft_t_isgu" id="ISGU_TRDG" parentId="BASEISSU" label="Country of Trading"> 
    <where> 
      <field name="ft_t_isgu.iss_gu_purp_typ" dataType="STRING" value="TRADING"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_isgu.start_tms" valueOf="ft_t_issu.start_tms" srcOccurrence="BASEISSU" dataType="DATETIME"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_isgu.gu_cnt"/>  
      <field name="ft_t_isgu.gu_id"/>  
      <field name="ft_t_isgu.gu_typ"/> 
    </inputFields> 
  </occurrence><occurrence extends="ISDEBISSU" table="ft_t_isde" id="ISDEBISSU" parentId="BASEISSU" label="Issue Description" level="1"><where> 
      <field name="ft_t_isde.desc_usage_typ" dataType="STRING" value="PRIMARY"/> 
    </where><defaultFields> 
      <field name="ft_t_isde.desc_srce_typ" dataType="STRING" value="INHOUSE"/>  
      <field name="ft_t_isde.nls_cde" dataType="STRING" value="ENGLISH"/>  
      <field name="ft_t_isde.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields><inputFields> 
      <field name="ft_t_isde.iss_nme" label="Instrument Name" level="1"/>  
      <field name="ft_t_isde.start_tms"/>  
      <field name="ft_t_isde.iss_desc" label="Instrument Description"/> 
    </inputFields></occurrence><occurrence extends="PEDF_CALL_or_SINK" label="Principal Event Definition - Callable" autoDelete="false" table="ft_t_pedf" id="PEDF_CALL_or_SINK" parentId="BASEISSU"> 
    <where> 
      <field name="ft_t_pedf.ev_typ" dataType="STRING" value="CALLABLE"/> 
    </where> 
  <defaultFields> 
      <field name="ft_t_pedf.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_pedf.verif_ind" dataType="STRING" value="Y"/> 
    </defaultFields><inputFields> 
      <field name="ft_t_pedf.days_mth_bas_typ"/>  
      <field name="ft_t_pedf.days_yr_bas_typ"/>  
      <field name="ft_t_pedf.end_tms"/>  
      <field name="ft_t_pedf.first_py_tms" label="First Payment Date"/>  
      <field name="ft_t_pedf.py_dte_fq_qty" label="Payable Date Frequency"/>  
      <field name="ft_t_pedf.py_dte_fq_dy_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_sp_typ"/>  
      <field name="ft_t_pedf.start_tms"/> 
    </inputFields></occurrence><occurrence extends="PEDF_PUT_or_FACTOR" label="Principal Event Definition - Put" autoDelete="false" table="ft_t_pedf" id="PEDF_PUT_or_FACTOR" parentId="BASEISSU"> 
    <where> 
      <field name="ft_t_pedf.ev_typ" dataType="STRING" value="PUT"/> 
    </where> 
  <defaultFields> 
      <field name="ft_t_pedf.verif_ind" dataType="STRING" value="Y"/>  
      <!--<field name="ft_t_pedf.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>--> 
    </defaultFields><inputFields> 
      <field name="ft_t_pedf.days_mth_bas_typ"/>  
      <field name="ft_t_pedf.days_yr_bas_typ"/>  
      <field name="ft_t_pedf.end_tms"/>  
      <field name="ft_t_pedf.first_py_tms" label="First Payment Date"/>  
      <field name="ft_t_pedf.py_dte_fq_dy_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_sp_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_qty" label="Payable Date Frequency"/>  
      <field name="ft_t_pedf.start_tms"/> 
    </inputFields></occurrence><occurrence extends="MKISDEFBISSU" table="ft_t_mkis" id="MKISDEFBISSU" parentId="BASEISSU" autoCreate="false" multiple="true"> 
    <inputFields> 
      <field name="ft_t_mkis.trdng_stat_typ" label="Market Status"/>  
      <field name="ft_t_mkis.actively_traded_ind"/>  
      <field name="ft_t_mkis.norm_mkt_sz_cqty" label="Quote Lot Size"/>  
      <field name="ft_t_mkis.mrgn_sec_ind" label="Marginable"/>  
      <field name="ft_t_mkis.settle_curr_cde"/>  
      <field name="ft_t_mkis.trd_lot_size_cqty"/>  
      <field name="ft_t_mkis.prim_trd_mkt_ind" label="Primary Exchange"/>  
      <field name="ft_t_mkis.prc_curr_cde" label="Quotation Currency"/>  
      <field name="ft_t_mkis.mkt_oid" label="Exchange Name"/>  
      <field name="ft_t_mkis.trdng_ut_meas_typ"/>  
      <field name="ft_t_mkis.first_trdng_tms"/>  
      <field name="ft_t_mkis.last_trdng_tms"/>  
      <field name="ft_t_mkis.settle_meth_typ"/> 
    <field name="ft_t_mkis.trdng_curr_cde"/><field name="ft_t_mkis.iss_prc_ut_camt"/><field name="ft_t_mkis.rnd_lot_sz_cqty"/><field name="ft_t_mkis.gu_id" label="Trading Country"/><field name="ft_t_mkis.opol_ind"/></inputFields>  
    <!--<defaultFields>
      <field name="ft_t_mkis.prim_trd_mkt_ind" dataType="STRING" value="N"/>
    </defaultFields>-->  
    <!-- remove for GT 94712<validationRules> 
      <rule id="Listing_ID_Validation"> 
        <xPath value="boolean(string-length(%modelPath:LISTISID_BISSU:ft_t_isid.iss_id%)  > 0 )"/>  
        <errorMessage value="At least one Exchange Level Identifier has to be entered for every Market 123"/> 
      </rule> 
    </validationRules>--> 
  <defaultFields>     
      <!--<field name="ft_t_mkis.trdng_stat_typ" value="ACTIVE" dataType="STRING"/>  
      -->  
      <field name="ft_t_mkis.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_mkis.last_chg_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_mkis.last_chg_usr_id" dataType="STRING" valueOfFunction="APPUSER"/> 
    </defaultFields></occurrence><occurrence extends="MIXRBISSU" table="ft_t_mixr" id="MIXRBISSU" parentId="MKISDEFBISSU" multiple="true" dbConstraint="MKISMIXR"><defaultFields> 
      <field name="ft_t_mixr.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>         
      <field name="ft_t_mixr.trdng_stat_typ" dataType="STRING" srcOccurrence="MKISDEFBISSU" valueOf="ft_t_mkis.trdng_stat_typ"/>  
      <field name="ft_t_mixr.last_chg_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_mixr.last_chg_usr_id" dataType="STRING" valueOfFunction="APPUSER"/> 
    </defaultFields><inputFields> 
      <field name="ft_t_mixr.end_tms"/> 
    </inputFields></occurrence><occurrence table="ft_t_isde" id="ISDE_VENDOR" parentId="BASEISSU" label="Issue Description"> 
    <defaultFields> 
      <field name="ft_t_isde.nls_cde" dataType="STRING" value="ENGLISH"/>  
      <field name="ft_t_isde.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_isde.iss_nme" label="Instrument Name"/>  
      <field name="ft_t_isde.start_tms"/>  
      <field name="ft_t_isde.iss_desc" label="Instrument Description"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_isde.desc_srce_typ" dataType="STRING" value="VENDOR"/> 
    </where> 
  </occurrence><occurrence table="ft_t_isid" id="ISID_Iss_level" parentId="BASEISSU" label="Issue Identifiers" multiple="true" dbConstraint="ISSUISID"> 
    <inputFields> 
      <field name="ft_t_isid.iss_id" label="Identifier Value"/>  
      <field name="ft_t_isid.id_ctxt_typ" label="Identifier Type"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <validationRules> 
      <rule id="ISINMarket"> 
        <xPath value="boolean(not(%modelPath:ISID_Iss_level:ft_t_isid.id_ctxt_typ% =''ISIN'' and not(string-length(%modelPath:ISID_Iss_level:ft_t_isid.mkt_oid%) = 0)))"/>  
        <errorMessage value="ISIN identifier cannot have market."/> 
      </rule>  
      <!--<rule id="ISSUTXTTYPNOTSUPPORTED" messageType="WARNING"> 
	   <xPath value="boolean(not(%modelPath:ISID_Iss_level%/intlvlid_supported=''0''))"/>
          <errorMessageXPath value="concat(%modelPath:ISID_Iss_level:ft_t_isid.id_ctxt_typ%,'' is no longer supported as a valid Instrument Level Identifier. Please take necessary action.'')"/>
		 </rule>--> 
    </validationRules> 
  </occurrence><occurrence table="ft_t_isid" id="ISID_MKT_Iss_level_PUB" parentId="BASEISSU" label="Global Market Identifiers pub" multiple="true" dbConstraint="MRKTISIDPUB"> 
    <!-- <where> 
      <field name="ft_t_isid.mkt_oid" dataType="STRING" isNull="false"/> 
    </where> -->  
    <inputFields> 
      <field name="ft_t_isid.iss_id" label="Identifier Value"/>  
      <field name="ft_t_isid.id_ctxt_typ" label="Identifier Type"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <validationRules> 
      <rule id="ISINMarket"> 
        <xPath value="boolean(not(%modelPath:ISID_MKT_Iss_level_PUB:ft_t_isid.id_ctxt_typ% =''ISIN'' and not(string-length(%modelPath:ISID_MKT_Iss_level_PUB:ft_t_isid.mkt_oid%) = 0)))"/>  
        <errorMessage value="ISIN identifier cannot have market."/> 
      </rule> 
    </validationRules> 
  </occurrence><occurrence table="ft_t_isid" id="ISIDBISIN" parentId="BASEISSU" label="Identifiers"> 
    <inputFields> 
      <field name="ft_t_isid.iss_id"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_isid.id_ctxt_typ" dataType="STRING" value="ISIN"/> 
    </where> 
  </occurrence><occurrence table="ft_t_isid" id="ISIDBINH" parentId="BASEISSU" label="Identifiers"> 
    <inputFields> 
      <field name="ft_t_isid.iss_id"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_isid.id_ctxt_typ" dataType="STRING" value="INHOUSE"/> 
    </where> 
  </occurrence><occurrence table="ft_t_isid" id="ISIDBCUS" parentId="BASEISSU" label="Identifiers"> 
    <inputFields> 
      <field name="ft_t_isid.iss_id"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_isid.id_ctxt_typ" dataType="STRING" value="CUSIP"/> 
    </where> 
  </occurrence><occurrence table="ft_t_isid" id="ISIDBCOM" parentId="BASEISSU" label="Identifiers"> 
    <inputFields> 
      <field name="ft_t_isid.iss_id"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_isid.id_ctxt_typ" dataType="STRING" value="COMMON"/> 
    </where> 
  </occurrence><occurrence table="ft_t_isid" id="ISIDVAL" parentId="BASEISSU" label="Identifiers"> 
    <inputFields> 
      <field name="ft_t_isid.iss_id"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_isid.id_ctxt_typ" dataType="STRING" value="VALOREN"/> 
    </where> 
  </occurrence><occurrence table="ft_t_iscl" id="ISCL_INSUBTYP" parentId="BASEISSU" label="Issue Classification" dbConstraint="SUBTYPE" multiple="false"> 
    <where> 
      <field name="ft_t_iscl.clsf_purp_typ" dataType="STRING" value="INSUBTYP"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_iscl.cl_value" label="Instrument Sub-Type"/>  
      <field name="ft_t_iscl.indus_cl_set_id"/>  
      <field name="ft_t_iscl.clsf_oid"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_iscl.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_fnch" id="FNCH_ALL" parentId="BASEISSU" label="Fund Characteristics"> 
    <defaultFields> 
      <!--<field name="ft_t_fnch.chars_eff_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>-->    
    </defaultFields> 
  </occurrence><occurrence table="ft_t_iscm" id="ISCMBISSU" parentId="BASEISSU" label="Comments"> 
    <defaultFields> 
      <field name="ft_t_iscm.cmnt_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_iscm.ln_num" dataType="NUMBER" value="1"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_iscm.cmnt_txt"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_iscm.cmnt_reas_typ" dataType="STRING" value="COMMENT"/> 
    </where> 
  </occurrence><occurrence table="ft_t_isrt" id="ISRTBISSU" parentId="BASEISSU" multiple="true" label="Rating"> 
    <inputFields> 
      <field name="ft_t_isrt.rtng_curr_typ"/>  
      <field name="ft_t_isrt.rtng_purp_typ"/>  
      <field name="ft_t_isrt.rtng_set_oid"/>  
      <field name="ft_t_isrt.rtng_cde"/>  
      <field name="ft_t_isrt.start_tms"/>  
      <field name="ft_t_isrt.rtng_eff_tms"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isrt.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>        
    </defaultFields> 
  </occurrence><occurrence table="ft_t_rgch" id="RGCHBISSU" parentId="BASEISSU" label="Regulatory Information"> 
    <inputFields> 
      <field name="ft_t_rgch.gu_id"/>  
      <field name="ft_t_rgch.gu_cnt"/>  
      <field name="ft_t_rgch.gu_typ"/>  
      <field name="ft_t_rgch.isma_regulated_ind"/>  
      <field name="ft_t_rgch.rule_144a_ind"/>  
      <field name="ft_t_rgch.reg_s_ind"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_rgch.start_tms" dataType="DATETIME" srcOccurrence="BASEISSU" valueOf="ft_t_issu.start_tms"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_isid" id="ISID_TIC_PM_PUB" parentId="MIXR_PRIM" label="Issue Identifier-Ticker" dbConstraint="MIXRISIDPUB"> 
    <where> 
      <field name="ft_t_isid.id_ctxt_typ" dataType="STRING" value="TICKER"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_isid.iss_id" label="Primary Ticker"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isid.isid_oid" dataType="STRING" srcOccurrence="MIXR_PRIM" valueOf="ft_t_mixr.isid_oid"/>  
      <field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_isid.mkt_oid" dataType="STRING" srcOccurrence="MKISPMBISSU" valueOf="ft_t_mkis.mkt_oid"/>  
      <field name="ft_t_isid.instr_id" dataType="STRING" srcOccurrence="BASEISSU" valueOf="ft_t_issu.instr_id"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_isxr" id="BISSU_ISXR_ISID" parentId="LISTISID_BISSU" multiple="true" autoDelete="false"> 
    <where> 
      <field name="ft_t_isxr.isid_oid" dataType="STRING" srcOccurrence="LISTISID_BISSU" valueOf="ft_t_isid.isid_oid"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_isxr.last_chg_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_isxr.last_chg_usr_id" dataType="STRING" valueOfFunction="APPUSER"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_isxr.isxr_rel_purp_typ"/>  
      <field name="ft_t_isxr.start_tms"/>  
      <field name="ft_t_isxr.end_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_must" id="MUST_MICOPOL" parentId="MKISDEFBISSU" autoDelete="false"> 
    <where> 
      <field name="ft_t_must.stat_def_id" dataType="STRING" value="MICOPOL"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_must.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_must.stat_char_val_txt" label="OPOL"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_must" id="MUST_CDREXCH" parentId="MKISDEFBISSU" autoDelete="false"> 
    <where> 
      <field name="ft_t_must.stat_def_id" dataType="STRING" value="CDREXCH"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_must.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_must.stat_char_val_txt" label="Exchange Calendar"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_ispc" id="ISPCBISSU" parentId="BASEISSU" label="Issue Price Details"> 
    <inputFields> 
      <field name="ft_t_ispc.prc_typ"/>  
      <field name="ft_t_ispc.prc_srce_typ"/>  
      <field name="ft_t_ispc.prc_tms"/>  
      <field name="ft_t_ispc.unit_cprc"/>  
      <field name="ft_t_ispc.prc_curr_cde"/> 
    </inputFields>  
    <defaultFields> 
      <!--      <field name="ft_t_ispc.prc_curr_cde" dataType="STRING" srcOccurrence="BASEISSU" valueOf="ft_t_issu.denom_curr_cde"/>  -->  
      <field name="ft_t_ispc.prc_qt_meth_typ" dataType="STRING" value="1"/>  
      <field name="ft_t_ispc.prc_valid_typ" dataType="STRING" value="VALID"/>  
      <field name="ft_t_ispc.prcng_meth_typ" dataType="STRING" value="1"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_iedf" id="IEDF_DIV_or_INT" parentId="BASEISSU" label="Income Event Definition(Dividend/Interest)"> 
    <defaultFields> 
      <field name="ft_t_iedf.verif_ind" dataType="STRING" value="Y"/>  
      <field name="ft_t_iedf.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_iedf.first_py_tms" label="First Payment Date"/>  
      <field name="ft_t_iedf.days_mth_bas_typ"/>  
      <field name="ft_t_iedf.days_yr_bas_typ"/>  
      <field name="ft_t_iedf.calc_meth_typ" label="Calculation Method"/>  
      <field name="ft_t_iedf.py_dte_fq_qty" label="Payable Date Frequency"/>  
      <field name="ft_t_iedf.py_dte_fq_dy_typ"/>  
      <field name="ft_t_iedf.py_dte_fq_sp_typ"/>  
      <field name="ft_t_iedf.start_tms"/>  
      <field name="ft_t_iedf.end_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_ievp" id="IEVP_DIV_or_INT" parentId="IEDF_DIV_or_INT" label="Income Event Participant(Dividend/Interest)"> 
    <defaultFields> 
      <field name="ft_t_ievp.prt_purp_typ" dataType="STRING" value="PMTDTLS"/>  
      <field name="ft_t_ievp.start_tms" dataType="DATETIME" srcOccurrence="IEDF_DIV_or_INT" valueOf="ft_t_iedf.start_tms"/> 
    </defaultFields>  
    <!--<validationRules>
			<rule id="Unique_IPDF">
				<xPath value="is-unique(%modelPath:IPDF_DIV_or_INT%, &quot;concat(ipdf.pay_curr_cde, substring((ipdf.start_tms), 1, 10))&quot;)"/>
				<errorMessage value="Payment currency and Start Date/Time combination should be unique in Income Payments of Dividend/Interest Section"/>	
			</rule>
		</validationRules>--> 
  </occurrence><occurrence table="ft_t_ipdf" id="IPDF_DIV_or_INT" parentId="IEVP_DIV_or_INT" multiple="true" label="Income Payment Definition(Dividend/Interest)"> 
    <inputFields> 
      <field name="ft_t_ipdf.start_tms"/>  
      <field name="ft_t_ipdf.ev_rate_typ"/>  
      <field name="ft_t_ipdf.ev_crte"/>  
      <field name="ft_t_ipdf.iss_part_rl_typ"/>  
      <field name="ft_t_ipdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ipdf.pay_curr_cde"/>  
      <field name="ft_t_ipdf.end_tms"/> 
    </inputFields>  
    <defaultFields/> 
  </occurrence><occurrence table="ft_t_pevp" id="PEVP_CALL_or_SINK" parentId="PEDF_CALL_or_SINK" label="Principal Event Participant(Call/Sink)" autoDelete="false"> 
    <defaultFields> 
      <field name="ft_t_pevp.start_tms" dataType="DATETIME" srcOccurrence="PEDF_CALL_or_SINK" valueOf="ft_t_pedf.start_tms" keepInSync="true"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_pevp.prt_purp_typ" dataType="STRING" value="SNKFDRED"/> 
    </where>  
    <validationRules> 
      <rule id="Unique_PPDF_Call_or_Sink"> 
        <xPath value="is-unique(%modelPath:PPDF_CALL_or_SINK%, &quot;concat(ppdf.pay_curr_cde,substring((ppdf.start_tms), 1, 10))&quot;)"/>  
        <!--        <xPath value="is-unique(%modelPath:PPDF_CALL_or_SINK%,&quot;substring((ppdf.start_tms), 1,10)&quot;)"/>  -->  
        <errorMessage value="Payment currency and Start Date/Time combination should be unique in Principal Payments of Call/Sink Section"/> 
      </rule> 
    </validationRules> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_CALL_or_SINK" parentId="PEVP_CALL_or_SINK" multiple="true" label="Principal Payment Definition(Call/Sink)" autoDelete="false"> 
    <inputFields> 
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.start_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/> 
    </inputFields>  
    <defaultFields/> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_PUT_or_FACTOR" parentId="PEVP_PUT_or_FACTOR" multiple="true" label="Principal Payment Definition(Factor)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_pedf" id="PEDF_PUT" parentId="BASEISSU" label="Principal Event Defitnition(Put)" autoDelete="false"> 
    <inputFields> 
      <field name="ft_t_pedf.days_mth_bas_typ"/>  
      <field name="ft_t_pedf.days_yr_bas_typ"/>  
      <field name="ft_t_pedf.end_tms"/>  
      <field name="ft_t_pedf.first_py_tms" label="First Payment Date"/>  
      <field name="ft_t_pedf.py_dte_fq_dy_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_sp_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_qty" label="Payable Date Frequency"/>  
      <field name="ft_t_pedf.start_tms"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_pedf.verif_ind" dataType="STRING" value="Y"/>  
      <!--<field name="ft_t_pedf.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>--> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_PUT" parentId="PEVP_PUT" multiple="true" label="Principal Payment Definition(Put)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_NEXTPUT" parentId="PEVP_NEXTPUT" multiple="true" label="Principal Payment Definition(NextPut)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_NXTPARPT" parentId="PEVP_NXTPARPT" multiple="true" label="Principal Payment Definition(NxtParpt)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_PUTPROV" parentId="PEVP_PUTPROV" multiple="true" label="Principal Payment Definition(PutProv)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_PUTSCHED" parentId="PEVP_PUTSCHED" multiple="true" label="Principal Payment Definition(PutSched)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_pedf" id="PEDF_CALLABLE" parentId="BASEISSU" label="Principal Event Defitnition(Call)" autoDelete="false"> 
    <inputFields> 
      <field name="ft_t_pedf.days_mth_bas_typ"/>  
      <field name="ft_t_pedf.days_yr_bas_typ"/>  
      <field name="ft_t_pedf.end_tms"/>  
      <field name="ft_t_pedf.first_py_tms" label="First Payment Date"/>  
      <field name="ft_t_pedf.py_dte_fq_dy_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_sp_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_qty" label="Payable Date Frequency"/>  
      <field name="ft_t_pedf.start_tms"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_pedf.verif_ind" dataType="STRING" value="Y"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_CALLABLE" parentId="PEVP_CALLABLE" multiple="true" label="Principal Payment Definition(Callable)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_pedf" id="PEDF_CALLED" parentId="BASEISSU" label="Principal Event Defitnition(Call)" autoDelete="false"> 
    <inputFields> 
      <field name="ft_t_pedf.days_mth_bas_typ"/>  
      <field name="ft_t_pedf.days_yr_bas_typ"/>  
      <field name="ft_t_pedf.end_tms"/>  
      <field name="ft_t_pedf.first_py_tms" label="First Payment Date"/>  
      <field name="ft_t_pedf.py_dte_fq_dy_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_sp_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_qty" label="Payable Date Frequency"/>  
      <field name="ft_t_pedf.start_tms"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_pedf.verif_ind" dataType="STRING" value="Y"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_CALLED" parentId="PEVP_CALLED" multiple="true" label="Principal Payment Definition(Called)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_pedf" id="PEDF_CALATPAR" parentId="BASEISSU" label="Principal Event Defitnition(Call)" autoDelete="false"> 
    <inputFields> 
      <field name="ft_t_pedf.days_mth_bas_typ"/>  
      <field name="ft_t_pedf.days_yr_bas_typ"/>  
      <field name="ft_t_pedf.end_tms"/>  
      <field name="ft_t_pedf.first_py_tms" label="First Payment Date"/>  
      <field name="ft_t_pedf.py_dte_fq_dy_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_sp_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_qty" label="Payable Date Frequency"/>  
      <field name="ft_t_pedf.start_tms"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_pedf.verif_ind" dataType="STRING" value="Y"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_CALATPAR" parentId="PEVP_CALATPAR" multiple="true" label="Principal Payment Definition(Calatpar)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_pedf" id="PEDF_CALATPRE" parentId="BASEISSU" label="Principal Event Defitnition(Call)" autoDelete="false"> 
    <inputFields> 
      <field name="ft_t_pedf.days_mth_bas_typ"/>  
      <field name="ft_t_pedf.days_yr_bas_typ"/>  
      <field name="ft_t_pedf.end_tms"/>  
      <field name="ft_t_pedf.first_py_tms" label="First Payment Date"/>  
      <field name="ft_t_pedf.py_dte_fq_dy_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_sp_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_qty" label="Payable Date Frequency"/>  
      <field name="ft_t_pedf.start_tms"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_pedf.verif_ind" dataType="STRING" value="Y"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_CALATPRE" parentId="PEVP_CALATPRE" multiple="true" label="Principal Payment Definition(Calatpre)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_isgp" id="ISGP_UNIV" parentId="BASEISSU" label="Issue Group Participant" multiple="true" dbConstraint="isgpuniv"> 
    <defaultFields> 
      <field name="ft_t_isgp.prt_purp_typ" dataType="STRING" value="MANUAL"/>  
      <field name="ft_t_isgp.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_isgp.prnt_iss_grp_oid"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_cucn" id="CUCN" parentId="BASEISSU"> 
    <defaultFields> 
      <field name="ft_t_cucn.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_cucf" id="CUCF" parentId="CUCN"> 
    <defaultFields> 
      <field name="ft_t_cucf.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_cucf.instr_id" dataType="STRING" valueOfXPath="/root/issue/issu.instr_id"/> 
    </defaultFields> 
  </occurrence><relations><table name="FT_T_RIDF"><relation relatedTable="FT_T_ISSU" name="ridfwarrant">
            <fromColumns>
                <column name="instr_id"/>
            </fromColumns>
            <toColumns>
                <column name="instr_id"/>
            </toColumns>
            <condition>
                <sql>#FROM_TABLE#.rel_typ IN (''WARRANT'',''WRT CALL'',''WRT PUT'')</sql>
            </condition>
        </relation></table><table name="FT_T_RISS"><relation relatedTable="FT_T_RIDF" name="risswarrant">
            <fromColumns>
                <column name="rld_iss_feat_id"/>
            </fromColumns>
            <toColumns>
                <column name="rld_iss_feat_id"/>
            </toColumns>
            <condition>
                <sql>#FROM_TABLE#.iss_part_rl_typ IN (''DELIVER'',''RECEIVE'',''UNDLYING'')</sql>
            </condition>
        </relation></table><table name="FT_T_MIXR"><relation relatedTable="FT_T_ISID" name="MIXRISID">
			<fromColumns>
				<column name="ISID_OID"/>
			</fromColumns>
			<toColumns>
				<column name="ISID_OID"/>
			</toColumns>
			<condition>
        <sql>exists (select 1 from FT_T_MIXR mixr where (mixr.end_tms IS NULL or mixr.end_tms  > p_asOfDate) and #TO_TABLE#.ISID_OID=mixr.isid_oid)</sql>
			</condition>
		</relation></table><table name="FT_T_MKIS"><relation relatedTable="FT_T_ISSU" name="ISSUMKIS">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<condition>
				<sql>(#FROM_TABLE#.prim_trd_mkt_ind=''Y'' or (select count(*) from ft_t_mkis where ft_t_mkis.instr_id=#TO_TABLE#.instr_id and (ft_t_mkis.end_tms is null or ft_t_mkis.end_tms  >= SYSDATE()))=1)</sql>
			</condition>
		</relation></table><table name="FT_T_MIXR"><relation relatedTable="FT_T_MKIS" name="MKISMIXR">
			<fromColumns>
				<column name="MKT_ISS_OID"/>
			</fromColumns>
			<toColumns>
				<column name="MKT_ISS_OID"/>
			</toColumns>
		</relation></table><table name="FT_T_ISGU"><relation relatedTable="FT_T_ISSU" name="ISSUISGU">
            <fromColumns>
                <column name="INSTR_ID"/>
            </fromColumns>
            <toColumns>
                <column name="INSTR_ID"/>
            </toColumns>
            <condition>
                <sql>#FROM_TABLE#.gu_typ =''COUNTRY''</sql>
            </condition>
        </relation></table><table name="FT_T_PEDF"><relation relatedTable="FT_T_ISSU" name="pedffactorissu">
            <fromColumns>
                <column name="instr_id"/>
            </fromColumns>
            <toColumns>
                <column name="instr_id"/>
            </toColumns>
            <condition>
                <sql>#FROM_TABLE#.ev_typ IN (''FACTOR'')</sql>
            </condition>
        </relation></table><table name="FT_T_ISID"><relation relatedTable="FT_T_ISSU" name="ISSUISID">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<condition>
					<sql>not exists (select 1 from ft_t_mixr mixr where (mixr.end_tms is null or mixr.end_tms  > SYSDATE()) and #FROM_TABLE#.ISID_OID=mixr.isid_oid) and #FROM_TABLE#.MKT_OID is null</sql>
				</condition>
		</relation></table><table name="FT_T_ISID"><relation relatedTable="FT_T_ISSU" name="MRKTISID">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<condition>
				<sql>not exists (select 1 from ft_t_mixr mixr where (mixr.end_tms is null or mixr.end_tms  > SYSDATE()) and #FROM_TABLE#.ISID_OID=mixr.isid_oid) and #FROM_TABLE#.MKT_OID is not null</sql>
		</condition>
		</relation></table><table name="FT_T_ISID"><relation relatedTable="FT_T_ISSU" name="MRKTISIDPUB">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<condition>			
				<sql>not exists (select 1 from ft_t_mixr mixr where (mixr.end_tms is null or mixr.end_tms  > SYSDATE()) and #FROM_TABLE#.ISID_OID=mixr.isid_oid) and #FROM_TABLE#.MKT_OID is not null</sql>			
			</condition>
		</relation></table><table name="FT_T_ISCL"><relation relatedTable="FT_T_ISSU" name="SUBTYPE">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<condition>
				<sql>#FROM_TABLE#.indus_cl_set_id in (''TKISSTYP'',''BBSECTYP'',''FTISSTYP'',''ASSETCLS'')</sql>
			</condition>
		</relation></table><table name="FT_T_ISCL"><relation relatedTable="FT_T_ISSU" name="SUBTYPE">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<condition>
				<sql>#FROM_TABLE#.indus_cl_set_id in (''TKISSTYP'',''BBSECTYP'',''FTISSTYP'',''ASSETCLS'')</sql>
			</condition>
		</relation></table><table name="FT_T_ISLL"><relation relatedTable="FT_T_ISSU" name="isllissu">
            <fromColumns>
                <column name="instr_id"/>
            </fromColumns>
            <toColumns>
                <column name="instr_id"/>
            </toColumns>
            <condition>
                <sql>#FROM_TABLE#.last_chg_tms in (SELECT max(last_chg_tms) FROM ft_t_isll where instr_id = #TO_TABLE#.instr_id)</sql>
            </condition>
        </relation></table><table name="FT_T_RIST"><relation relatedTable="FT_T_ISSU" name="RIST_INSTR">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
		</relation></table><table name="FT_T_LMST"><relation relatedTable="FT_T_ISSU" name="latestlmst">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<condition>
				<sql>#FROM_TABLE#.last_chg_tms = (SELECT MAX (last_chg_tms) FROM ft_t_lmst WHERE ft_t_lmst.instr_id = #TO_TABLE#.instr_id)</sql>
			</condition>
		</relation></table><table name="FT_T_AISR"><relation relatedTable="FT_T_ISSU" name="MyAccountIssueRole">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<condition>
				<sql>#FROM_TABLE#.ACCT_ISSU_RL_TYP is not null</sql>
			</condition>
		</relation></table><table name="FT_T_AISR"><relation relatedTable="FT_T_ISSU" name="MyIssueAccountRole">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<!--Commented as AISR.ISSU_ACCT_RL_TYP has been removed (GT 37778)-->
			<!--<condition>
        <sql>#FROM_TABLE#.ISSU_ACCT_RL_TYP is not null</sql>
      </condition>-->
		</relation></table><table name="FT_T_ISRT"><relation relatedTable="FT_T_ISSU" name="RTNG_HIST" checkService="RATING_SERVICE">
			<condition>
				<sql>#FROM_TABLE#.SYS_EFF_END_TMS IS NULL AND (#FROM_TABLE#.INSTR_ID) = (#TO_TABLE#.INSTR_ID)</sql>
			</condition>
		</relation></table><table name="FT_T_MIXR"><relation relatedTable="FT_T_ISID" name="MIXRISIDPUB">
			<fromColumns>
				<column name="ISID_OID"/>
			</fromColumns>
			<toColumns>
				<column name="ISID_OID"/>
			</toColumns>
			<condition>				
				<sql>exists (select 1 from FT_T_MIXR mixr where (mixr.end_tms IS NULL or mixr.end_tms  > SYSDATE()) and #TO_TABLE#.ISID_OID=mixr.isid_oid)</sql>				
			</condition>
		</relation></table><table name="FT_T_MKIS"><relation relatedTable="FT_T_ISPC" name="LATESTPRICE">
			<fromColumns>
				<column name="INSTR_ID"/>
				<column name="MKT_OID"/>
				<column name="PRC_CURR_CDE"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
				<column name="MKT_OID"/>
				<column name="PRC_CURR_CDE"/>
			</toColumns>
			<condition>
				<sql>#TO_TABLE#.prc_tms = 
             (select max(prc_tms)
                from ft_t_ispc maxprc
               where maxprc.instr_id = #TO_TABLE#.instr_id
                 and maxprc.mkt_oid = #TO_TABLE#.mkt_oid
                 and maxprc.prc_curr_cde = #TO_TABLE#.prc_curr_cde)</sql>
			</condition>
		</relation></table><table name="FT_T_MUST"><relation relatedTable="FT_T_MKIS" name="mkismust">
            <fromColumns>
                <column name="MKT_ISS_OID"/>
            </fromColumns>
            <toColumns>
                <column name="MKT_ISS_OID"/>
            </toColumns>
        </relation></table><table name="FT_T_ISPC"><relation name="latestclosingprice" relatedTable="FT_T_ISSU">
            <fromColumns>
                <column name="INSTR_ID"/>
            </fromColumns>
            <toColumns>
                <column name="INSTR_ID"/>
            </toColumns>
            <condition>
                <sql>(#FROM_TABLE#.last_chg_tms
                      , #FROM_TABLE#.prc_tms
                      , COALESCE (#FROM_TABLE#.data_src_id, ''999'')
                      , #FROM_TABLE#.prc_srce_typ
                      , #FROM_TABLE#.prc_typ
                      || COALESCE (TRIM (#FROM_TABLE#.addnl_prc_qual_typ), ''999'')) IN
                            (  SELECT   MAX (last_chg_tms)
                                        , MAX (prc_tms)
                                        , COALESCE (data_src_id, ''999'')
                                        , prc_srce_typ
                                        , prc_typ
                                        || COALESCE (TRIM (addnl_prc_qual_typ), ''999'')
                                 FROM   ft_t_ispc ispc1
                                WHERE   instr_id = #FROM_TABLE#.instr_id
                                AND trim(prc_typ) || trim(addnl_prc_qual_typ) IN (''BID2171'',''ASKED2124'',''ASKED1'',''0031'',''0033'',''ASKED3'')      
                             GROUP BY   prc_tms,
                                        data_src_id,
                                        prc_srce_typ,
                                        prc_typ,
                                        addnl_prc_qual_typ,
                                        prc_qt_meth_typ)</sql>
            </condition>
        </relation></table><table name="FT_T_IEDF"><relation relatedTable="FT_T_ISSU" name="issuiedfinterest">
            <fromColumns>
                <column name="instr_id"/>
            </fromColumns>
            <toColumns>
                <column name="instr_id"/>
            </toColumns>
            <condition>
                <sql>#FROM_TABLE#.ev_typ IN (''INTEREST'')</sql>
            </condition>
        </relation></table><table name="FT_T_IEVP"><relation relatedTable="FT_T_IEDF" name="iedfievpestdiv">
            <fromColumns>
                <column name="INC_EV_DEF_ID"/>
            </fromColumns>
            <toColumns>
                <column name="INC_EV_DEF_ID"/>
            </toColumns>
            <condition>
                <sql>#FROM_TABLE#.prt_purp_typ IN (''ESTIMATE'',''DIVIDEND'')</sql>
            </condition>
        </relation></table><table name="FT_T_IPDF"><relation relatedTable="FT_T_IEVP" name="ipdfbasecpi">
            <fromColumns>
                <column name="INC_EV_PRT_ID"/>
            </fromColumns>
            <toColumns>
                <column name="INC_EV_PRT_ID"/>
            </toColumns>
            <condition>
                <sql>#FROM_TABLE#.rate_fixing_base_crte is not null and #FROM_TABLE#.start_tms = (select max(start_tms) from ft_t_ipdf where inc_ev_prt_id=#FROM_TABLE#.inc_ev_prt_id and rate_fixing_base_crte is not null)</sql>
            </condition>
        </relation></table><table name="FT_T_PEVP"><relation relatedTable="FT_T_PEDF" name="pevpfactorissu">
            <fromColumns>
                <column name="prin_ev_def_id"/>
            </fromColumns>
            <toColumns>
                <column name="prin_ev_def_id"/>
            </toColumns>
            <condition>
                <sql>#FROM_TABLE#.prt_purp_typ IN (''FACTOR'')</sql>
            </condition>
        </relation></table><table name="FT_T_PPDF"><relation relatedTable="FT_T_PEVP" name="ppdf_pevp">
            <fromColumns>
                <column name="PRIN_EV_PRT_ID"/>
            </fromColumns>
            <toColumns>
                <column name="PRIN_EV_PRT_ID"/>
            </toColumns>
            <condition>
                <sql>ROWNUM=1</sql>
            </condition>
        </relation></table><table name="FT_T_IRCL"><relation relatedTable="FT_T_ISSU" name="IRCL_ISSU">
			<fromColumns>
				<column name="INSTR_ISSR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ISSR_ID"/>
			</toColumns>
			<condition>
				<sql>(#FROM_TABLE#.instr_id = #TO_TABLE#.instr_id or #FROM_TABLE#.instr_id is null)</sql> 
			</condition>
		</relation></table><table name="FT_T_ISGP"><relation relatedTable="FT_T_ISSU" name="isgpuniv">
			<fromColumns>
				<column name="instr_id"/>
			</fromColumns>
			<toColumns>
				<column name="instr_id"/>
			</toColumns>
			<condition>
				<sql>TRIM(#FROM_TABLE#.PRNT_ISS_GRP_OID) in (SELECT TRIM(ISS_GRP_OID) FROM FT_T_ISGR WHERE GRP_PURP_TYP=''UNIVERSE'')</sql>
			</condition>
		</relation></table></relations></model>' WHERE modl_id ='OPTIONS' AND modl_typ = 'ISSU';		

UPDATE FT_T_MDDF SET modl_schema ='<?xml version="1.0" encoding="UTF-8"?>
<model xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" headerInfoXPath="concat(%modelPath:BASEISSU:ft_t_issu.pref_iss_nme%,'' - '',%modelPath:BASEISSU:ft_t_issu.pref_id_ctxt_typ% ,''-'',%modelPath:BASEISSU:ft_t_issu.pref_iss_id%)" id="REITS" extends="BASEISSU" xsi:noNamespaceSchemaLocation="../../schemas/Model.xsd" minLevelToEnableChangeApproval="2">
  <!--<model xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="../../schemas/Model.xsd" >-->
  <occurrence extends="BASEISSU" id="BASEISSU" table="ft_t_issu" level="1" label="Issue Description/Issue Details">
    <inputFields>
      <field name="ft_t_issu.nom_val_unit_camt"/>
      <field name="ft_t_issu.instr_issr_id"/>
    <field name="ft_t_issu.iss_typ" level="1" label="Instrument Type"/><field name="ft_t_issu.denom_curr_cde" level="2"/><field name="ft_t_issu.sec_form_typ"/><field name="ft_t_issu.distribution_curr_cde"/><field name="ft_t_issu.iss_tms" label="Instrument Date"/><field name="ft_t_issu.cl_typ"/></inputFields>
    <validationRules>
      <rule id="ValidationISID">
				<xPath value="boolean((count(/root/issueidentifiers/identifier[@status!=''deleted'' or string-length(@status)=0]) >0)  or (/root/issue[@status!=''new'' or  string-length(@status)=0]))"/>

				<errorMessage value="At least one Instrument Level Identifier has to be entered."/>
			</rule>
			<rule id="ValidationISID_ACTIVITYSTATUS">
				<xPath value="boolean((count(/root/issueidentifiers/identifier[@status!=''deleted'' or string-length(@status)=0]) >0 or string(/root/issue/issu.iss_actvy_stat_typ)=''INACTIVE'')  or (/root/issue[@status=''new'' or  string-length(@status)!=0]))"/>
				<errorMessage value="User has either to mark the Issue activity status(Instrument Status)  as inactive or have at least one identifier active."/>
			</rule>
    <rule id="MultiplePrimaryMarkets" pageName="Market"> 
        <xPath value="boolean(count(%modelPath:MKISDEFBISSU%[(string-length(mkis.end_tms) = 0) and (mkis.prim_trd_mkt_ind = ''Y'')])  <  2)"/>  
        <errorMessage value="There should not be multiple primary markets for a single issue."/> 
      </rule></validationRules>
  <defaultFields> 
      <field name="ft_t_issu.access_auth_typ" dataType="STRING" value="PUBLIC"/>  
      <field name="ft_t_issu.iss_actvy_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_issu.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>         
    </defaultFields></occurrence>
  <occurrence extends="MKISDEFBISSU" table="ft_t_mkis" id="MKISDEFBISSU" parentId="BASEISSU" autoCreate="false" multiple="true">
    <inputFields>
      <field name="ft_t_mkis.trdng_stat_typ" label="Market Status"/>
      <field name="ft_t_mkis.actively_traded_ind"/>
      <field name="ft_t_mkis.norm_mkt_sz_cqty" label="Quote Lot Size"/>
      <field name="ft_t_mkis.mrgn_sec_ind" label="Marginable"/>
      <field name="ft_t_mkis.settle_curr_cde"/>
      <field name="ft_t_mkis.trd_lot_size_cqty"/>
      <field name="ft_t_mkis.prim_trd_mkt_ind" label="Primary Exchange"/>
      <field name="ft_t_mkis.prc_curr_cde" label="Quotation Currency"/>
      <field name="ft_t_mkis.mkt_oid" label="Exchange Name"/>
    <field name="ft_t_mkis.trdng_curr_cde"/><field name="ft_t_mkis.iss_prc_ut_camt"/><field name="ft_t_mkis.rnd_lot_sz_cqty"/><field name="ft_t_mkis.gu_id" label="Trading Country"/><field name="ft_t_mkis.opol_ind"/></inputFields>
    <!--<defaultFields>
      <field name="ft_t_mkis.prim_trd_mkt_ind" dataType="STRING" value="N"/>
    </defaultFields>-->
  <defaultFields>      
      <!--<field name="ft_t_mkis.trdng_stat_typ" value="ACTIVE" dataType="STRING"/>  
      -->  
      <field name="ft_t_mkis.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_mkis.last_chg_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_mkis.last_chg_usr_id" dataType="STRING" valueOfFunction="APPUSER"/> 
    </defaultFields></occurrence>
  <occurrence extends="MIXRBISSU" table="ft_t_mixr" id="MIXRBISSU" parentId="MKISDEFBISSU" multiple="true" dbConstraint="MKISMIXR"><defaultFields> 
      <field name="ft_t_mixr.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>        
      <field name="ft_t_mixr.trdng_stat_typ" dataType="STRING" srcOccurrence="MKISDEFBISSU" valueOf="ft_t_mkis.trdng_stat_typ"/>  
      <field name="ft_t_mixr.last_chg_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_mixr.last_chg_usr_id" dataType="STRING" valueOfFunction="APPUSER"/> 
    </defaultFields><inputFields> 
      <field name="ft_t_mixr.end_tms"/> 
    </inputFields></occurrence>
  <occurrence table="ft_t_eqst" id="EQSTBDIV" parentId="BASEISSU" label="DividendDetails/IssueInformation" multiple="false" level="3" autoDelete="false">
    <inputFields>
      <field name="ft_t_eqst.div_paid_tms"/>
      <field name="ft_t_eqst.last_div_paid_typ"/>
      <field name="ft_t_eqst.div_ex_tms"/>
      <field name="ft_t_eqst.div_declared_tms"/>
      <field name="ft_t_eqst.grs_dps_crte"/>
      <field name="ft_t_eqst.net_dps_crte"/>
      <field name="ft_t_eqst.net_dps_12m_crte"/>
      <field name="ft_t_eqst.shr_outst_cqty" level="3"/>
      <field name="ft_t_eqst.voting_rights_crte"/>
      <field name="ft_t_eqst.div_rcdt_tms"/>
      <field name="ft_t_eqst.split_tms"/>
      <field name="ft_t_eqst.split_ratio_crte"/>
      <field name="ft_t_eqst.grs_dps_12m_crte"/>
      <field name="ft_t_eqst.stats_curr_cde"/>
    </inputFields>
    <defaultFields>
      <field name="ft_t_eqst.stats_eff_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>
    </defaultFields>
  </occurrence>
  <occurrence table="ft_t_eqch" id="EQCHBDIV" parentId="BASEISSU" label="DividendDetails/IssueInformation" level="3" autoDelete="false">
    <inputFields>
      <field name="ft_t_eqch.div_fq_sp_typ" level="3"/>
      <field name="ft_t_eqch.div_fq_dy_typ"/>
      <field name="ft_t_eqch.div_fq_qty"/>
      <field name="ft_t_eqch.voting_rights_typ"/>
      <field name="ft_t_eqch.div_rights_typ"/>
      <field name="ft_t_eqch.annual_dividend_curr_cde" label="Dividend Currency" level="3"/>
    </inputFields>
  </occurrence>
  <occurrence table="ft_t_iscm" id="ISSISCM" parentId="BASEISSU" label="TransferAgent">
    <inputFields>
      <field name="ft_t_iscm.cmnt_txt"/>
    </inputFields>
    <where>
      <field name="ft_t_iscm.cmnt_reas_typ" dataType="STRING" value="TRAGENT"/>
    </where>
    <defaultFields>
      <field name="ft_t_iscm.cmnt_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>
      <field name="ft_t_iscm.ln_num" dataType="NUMBER" value="1"/>
    </defaultFields>
  </occurrence>
  <occurrence extends="MKISPMBISSU" table="ft_t_mkis" id="MKISPMBISSU" parentId="BASEISSU" multiple="false" label="Market Details"><validationRules> 
      <rule id="Warning" messageType="WARNING"> 
        <xPath value="boolean(string-length(%modelPath:MKISPMBISSU:ft_t_mkis.end_tms%)= 0 or string-length(%modelPath:MKISPMBISSU:ft_t_mkis.end_tms%) <  SYSDATE())"/>  
        <errorMessage value="Primary Market is end dated"/> 
      </rule> 
    </validationRules><where> 
      <field name="ft_t_mkis.prim_trd_mkt_ind" dataType="STRING" value="Y"/> 
    </where><defaultFields> 
      <!--<field name="ft_t_mkis.trdng_stat_typ" dataType="STRING" value="ACTIVE"/>  
      -->  
      <field name="ft_t_mkis.prc_ut_meas_typ" dataType="STRING" value="NOMINAL"/>  
      <!--<field name="ft_t_mkis.mkt_iss_oid" dataType="STRING" valueOfFunction="OID" uiOnly="true"/> 
      --> 
    </defaultFields><inputFields> 
      <field name="ft_t_mkis.mkt_oid"/>  
      <field name="ft_t_mkis.iss_prc_ut_camt"/>  
      <field name="ft_t_mkis.rnd_lot_sz_cqty"/>  
      <field name="ft_t_mkis.trdng_curr_cde"/>  
      <field name="ft_t_mkis.trdng_stat_typ"/> 
    </inputFields></occurrence>
  <occurrence extends="MIXR_PRIM" table="ft_t_mixr" id="MIXR_PRIM" parentId="MKISPMBISSU" label=" Market Issue Cross Reference ((Primary)" dbConstraint="MKISMIXR"><defaultFields> 
      <field name="ft_t_mixr.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>   
      <field name="ft_t_mixr.trdng_stat_typ" dataType="STRING" srcOccurrence="MKISPMBISSU" valueOf="ft_t_mkis.trdng_stat_typ"/> 
    </defaultFields></occurrence>
  <occurrence table="ft_t_must" id="MUSTBISSU" parentId="MKISPMBISSU" label="Relative Index" level="2">
    <where>
      <field name="ft_t_must.stat_def_id" dataType="STRING" value="RELINDEX"/>
    </where>
    <inputFields>
      <field name="ft_t_must.stat_char_val_txt" level="2"/>
    </inputFields>
    <defaultFields>
      <field name="ft_t_must.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>
    </defaultFields>
  </occurrence>
  <occurrence extends="IEDF_DIV_or_INT" label="Income Event Definition - Dividend" table="ft_t_iedf" id="IEDF_DIV_or_INT" parentId="BASEISSU">
    <where>
      <field name="ft_t_iedf.ev_typ" dataType="STRING" value="DIVIDEND"/>
    </where>
  <defaultFields> 
      <field name="ft_t_iedf.verif_ind" dataType="STRING" value="Y"/>  
      <field name="ft_t_iedf.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields><inputFields> 
      <field name="ft_t_iedf.first_py_tms" label="First Payment Date"/>  
      <field name="ft_t_iedf.days_mth_bas_typ"/>  
      <field name="ft_t_iedf.days_yr_bas_typ"/>  
      <field name="ft_t_iedf.calc_meth_typ" label="Calculation Method"/>  
      <field name="ft_t_iedf.py_dte_fq_qty" label="Payable Date Frequency"/>  
      <field name="ft_t_iedf.py_dte_fq_dy_typ"/>  
      <field name="ft_t_iedf.py_dte_fq_sp_typ"/>  
      <field name="ft_t_iedf.start_tms"/>  
      <field name="ft_t_iedf.end_tms"/> 
    </inputFields></occurrence>
  <presentation>
    <until level="100">
      <override class="codf" rendered="false"/>
      <override class="eqch" rendered="false"/>
      <override class="mnch" rendered="false"/>
      <override class="fnch" rendered="false"/>
      <override class="ench" rendered="false"/>
      <override class="fech" rendered="false"/>
      <override class="epst" rendered="false"/>
    </until>
  </presentation>
<occurrence table="ft_t_isde" id="ISDEBISSU" parentId="BASEISSU" label="Issue Description" level="1"> 
    <defaultFields> 
      <field name="ft_t_isde.desc_srce_typ" dataType="STRING" value="INHOUSE"/>  
      <field name="ft_t_isde.nls_cde" dataType="STRING" value="ENGLISH"/>  
      <field name="ft_t_isde.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_isde.iss_nme" label="Instrument Name" level="1"/>  
      <field name="ft_t_isde.start_tms"/>  
      <field name="ft_t_isde.iss_desc" label="Instrument Description"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_isde.desc_usage_typ" dataType="STRING" value="PRIMARY"/> 
    </where> 
  </occurrence><occurrence table="ft_t_isde" id="ISDE_VENDOR" parentId="BASEISSU" label="Issue Description"> 
    <defaultFields> 
      <field name="ft_t_isde.nls_cde" dataType="STRING" value="ENGLISH"/>  
      <field name="ft_t_isde.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_isde.iss_nme" label="Instrument Name"/>  
      <field name="ft_t_isde.start_tms"/>  
      <field name="ft_t_isde.iss_desc" label="Instrument Description"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_isde.desc_srce_typ" dataType="STRING" value="VENDOR"/> 
    </where> 
  </occurrence><occurrence table="ft_t_isid" id="ISID_Iss_level" parentId="BASEISSU" label="Issue Identifiers" multiple="true" dbConstraint="ISSUISID"> 
    <inputFields> 
      <field name="ft_t_isid.iss_id" label="Identifier Value"/>  
      <field name="ft_t_isid.id_ctxt_typ" label="Identifier Type"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <validationRules> 
      <rule id="ISINMarket"> 
        <xPath value="boolean(not(%modelPath:ISID_Iss_level:ft_t_isid.id_ctxt_typ% =''ISIN'' and not(string-length(%modelPath:ISID_Iss_level:ft_t_isid.mkt_oid%) = 0)))"/>  
        <errorMessage value="ISIN identifier cannot have market."/> 
      </rule>  
      <!--<rule id="ISSUTXTTYPNOTSUPPORTED" messageType="WARNING"> 
	   <xPath value="boolean(not(%modelPath:ISID_Iss_level%/intlvlid_supported=''0''))"/>
          <errorMessageXPath value="concat(%modelPath:ISID_Iss_level:ft_t_isid.id_ctxt_typ%,'' is no longer supported as a valid Instrument Level Identifier. Please take necessary action.'')"/>
		 </rule>--> 
    </validationRules> 
  </occurrence><occurrence table="ft_t_isid" id="ISID_MKT_Iss_level_PUB" parentId="BASEISSU" label="Global Market Identifiers pub" multiple="true" dbConstraint="MRKTISIDPUB"> 
    <!-- <where> 
      <field name="ft_t_isid.mkt_oid" dataType="STRING" isNull="false"/> 
    </where> -->  
    <inputFields> 
      <field name="ft_t_isid.iss_id" label="Identifier Value"/>  
      <field name="ft_t_isid.id_ctxt_typ" label="Identifier Type"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <validationRules> 
      <rule id="ISINMarket"> 
        <xPath value="boolean(not(%modelPath:ISID_MKT_Iss_level_PUB:ft_t_isid.id_ctxt_typ% =''ISIN'' and not(string-length(%modelPath:ISID_MKT_Iss_level_PUB:ft_t_isid.mkt_oid%) = 0)))"/>  
        <errorMessage value="ISIN identifier cannot have market."/> 
      </rule> 
    </validationRules> 
  </occurrence><occurrence table="ft_t_isid" id="ISIDBISIN" parentId="BASEISSU" label="Identifiers"> 
    <inputFields> 
      <field name="ft_t_isid.iss_id"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_isid.id_ctxt_typ" dataType="STRING" value="ISIN"/> 
    </where> 
  </occurrence><occurrence table="ft_t_isid" id="ISIDBINH" parentId="BASEISSU" label="Identifiers"> 
    <inputFields> 
      <field name="ft_t_isid.iss_id"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_isid.id_ctxt_typ" dataType="STRING" value="INHOUSE"/> 
    </where> 
  </occurrence><occurrence table="ft_t_isid" id="ISIDBCUS" parentId="BASEISSU" label="Identifiers"> 
    <inputFields> 
      <field name="ft_t_isid.iss_id"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_isid.id_ctxt_typ" dataType="STRING" value="CUSIP"/> 
    </where> 
  </occurrence><occurrence table="ft_t_isid" id="ISIDBCOM" parentId="BASEISSU" label="Identifiers"> 
    <inputFields> 
      <field name="ft_t_isid.iss_id"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_isid.id_ctxt_typ" dataType="STRING" value="COMMON"/> 
    </where> 
  </occurrence><occurrence table="ft_t_isid" id="ISIDVAL" parentId="BASEISSU" label="Identifiers"> 
    <inputFields> 
      <field name="ft_t_isid.iss_id"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_isid.id_ctxt_typ" dataType="STRING" value="VALOREN"/> 
    </where> 
  </occurrence><occurrence table="ft_t_iscl" id="ISCL_INSUBTYP" parentId="BASEISSU" label="Issue Classification" dbConstraint="SUBTYPE" multiple="false"> 
    <where> 
      <field name="ft_t_iscl.clsf_purp_typ" dataType="STRING" value="INSUBTYP"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_iscl.cl_value" label="Instrument Sub-Type"/>  
      <field name="ft_t_iscl.indus_cl_set_id"/>  
      <field name="ft_t_iscl.clsf_oid"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_iscl.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_fnch" id="FNCH_ALL" parentId="BASEISSU" label="Fund Characteristics"> 
    <defaultFields> 
      <!--<field name="ft_t_fnch.chars_eff_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>-->  
       
    </defaultFields> 
  </occurrence><occurrence table="ft_t_iscm" id="ISCMBISSU" parentId="BASEISSU" label="Comments"> 
    <defaultFields> 
      <field name="ft_t_iscm.cmnt_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_iscm.ln_num" dataType="NUMBER" value="1"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_iscm.cmnt_txt"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_iscm.cmnt_reas_typ" dataType="STRING" value="COMMENT"/> 
    </where> 
  </occurrence><occurrence table="ft_t_isrt" id="ISRTBISSU" parentId="BASEISSU" multiple="true" label="Rating"> 
    <inputFields> 
      <field name="ft_t_isrt.rtng_curr_typ"/>  
      <field name="ft_t_isrt.rtng_purp_typ"/>  
      <field name="ft_t_isrt.rtng_set_oid"/>  
      <field name="ft_t_isrt.rtng_cde"/>  
      <field name="ft_t_isrt.start_tms"/>  
      <field name="ft_t_isrt.rtng_eff_tms"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isrt.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>    
    </defaultFields> 
  </occurrence><occurrence table="ft_t_rgch" id="RGCHBISSU" parentId="BASEISSU" label="Regulatory Information"> 
    <inputFields> 
      <field name="ft_t_rgch.gu_id"/>  
      <field name="ft_t_rgch.gu_cnt"/>  
      <field name="ft_t_rgch.gu_typ"/>  
      <field name="ft_t_rgch.isma_regulated_ind"/>  
      <field name="ft_t_rgch.rule_144a_ind"/>  
      <field name="ft_t_rgch.reg_s_ind"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_rgch.start_tms" dataType="DATETIME" srcOccurrence="BASEISSU" valueOf="ft_t_issu.start_tms"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_isid" id="ISID_TIC_PM_PUB" parentId="MIXR_PRIM" label="Issue Identifier-Ticker" dbConstraint="MIXRISIDPUB"> 
    <where> 
      <field name="ft_t_isid.id_ctxt_typ" dataType="STRING" value="TICKER"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_isid.iss_id" label="Primary Ticker"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isid.isid_oid" dataType="STRING" srcOccurrence="MIXR_PRIM" valueOf="ft_t_mixr.isid_oid"/>  
      <field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_isid.mkt_oid" dataType="STRING" srcOccurrence="MKISPMBISSU" valueOf="ft_t_mkis.mkt_oid"/>  
      <field name="ft_t_isid.instr_id" dataType="STRING" srcOccurrence="BASEISSU" valueOf="ft_t_issu.instr_id"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_isxr" id="BISSU_ISXR_ISID" parentId="LISTISID_BISSU" multiple="true" autoDelete="false"> 
    <where> 
      <field name="ft_t_isxr.isid_oid" dataType="STRING" srcOccurrence="LISTISID_BISSU" valueOf="ft_t_isid.isid_oid"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_isxr.last_chg_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_isxr.last_chg_usr_id" dataType="STRING" valueOfFunction="APPUSER"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_isxr.isxr_rel_purp_typ"/>  
      <field name="ft_t_isxr.start_tms"/>  
      <field name="ft_t_isxr.end_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_must" id="MUST_MICOPOL" parentId="MKISDEFBISSU" autoDelete="false"> 
    <where> 
      <field name="ft_t_must.stat_def_id" dataType="STRING" value="MICOPOL"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_must.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_must.stat_char_val_txt" label="OPOL"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_must" id="MUST_CDREXCH" parentId="MKISDEFBISSU" autoDelete="false"> 
    <where> 
      <field name="ft_t_must.stat_def_id" dataType="STRING" value="CDREXCH"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_must.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_must.stat_char_val_txt" label="Exchange Calendar"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_ispc" id="ISPCBISSU" parentId="BASEISSU" label="Issue Price Details"> 
    <inputFields> 
      <field name="ft_t_ispc.prc_typ"/>  
      <field name="ft_t_ispc.prc_srce_typ"/>  
      <field name="ft_t_ispc.prc_tms"/>  
      <field name="ft_t_ispc.unit_cprc"/>  
      <field name="ft_t_ispc.prc_curr_cde"/> 
    </inputFields>  
    <defaultFields> 
      <!--      <field name="ft_t_ispc.prc_curr_cde" dataType="STRING" srcOccurrence="BASEISSU" valueOf="ft_t_issu.denom_curr_cde"/>  -->  
      <field name="ft_t_ispc.prc_qt_meth_typ" dataType="STRING" value="1"/>  
      <field name="ft_t_ispc.prc_valid_typ" dataType="STRING" value="VALID"/>  
      <field name="ft_t_ispc.prcng_meth_typ" dataType="STRING" value="1"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_ievp" id="IEVP_DIV_or_INT" parentId="IEDF_DIV_or_INT" label="Income Event Participant(Dividend/Interest)"> 
    <defaultFields> 
      <field name="ft_t_ievp.prt_purp_typ" dataType="STRING" value="PMTDTLS"/>  
      <field name="ft_t_ievp.start_tms" dataType="DATETIME" srcOccurrence="IEDF_DIV_or_INT" valueOf="ft_t_iedf.start_tms"/> 
    </defaultFields>  
    <!--<validationRules>
			<rule id="Unique_IPDF">
				<xPath value="is-unique(%modelPath:IPDF_DIV_or_INT%, &quot;concat(ipdf.pay_curr_cde, substring((ipdf.start_tms), 1, 10))&quot;)"/>
				<errorMessage value="Payment currency and Start Date/Time combination should be unique in Income Payments of Dividend/Interest Section"/>			
			</rule>
		</validationRules>--> 
  </occurrence><occurrence table="ft_t_ipdf" id="IPDF_DIV_or_INT" parentId="IEVP_DIV_or_INT" multiple="true" label="Income Payment Definition(Dividend/Interest)"> 
    <inputFields> 
      <field name="ft_t_ipdf.start_tms"/>  
      <field name="ft_t_ipdf.ev_rate_typ"/>  
      <field name="ft_t_ipdf.ev_crte"/>  
      <field name="ft_t_ipdf.iss_part_rl_typ"/>  
      <field name="ft_t_ipdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ipdf.pay_curr_cde"/>  
      <field name="ft_t_ipdf.end_tms"/> 
    </inputFields>  
    <defaultFields/> 
  </occurrence><occurrence table="ft_t_pedf" id="PEDF_CALL_or_SINK" parentId="BASEISSU" label="Principal Event Definition(Call/Sink)" autoDelete="false"> 
    <inputFields> 
      <field name="ft_t_pedf.days_mth_bas_typ"/>  
      <field name="ft_t_pedf.days_yr_bas_typ"/>  
      <field name="ft_t_pedf.end_tms"/>  
      <field name="ft_t_pedf.first_py_tms" label="First Payment Date"/>  
      <field name="ft_t_pedf.py_dte_fq_qty" label="Payable Date Frequency"/>  
      <field name="ft_t_pedf.py_dte_fq_dy_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_sp_typ"/>  
      <field name="ft_t_pedf.start_tms"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_pedf.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_pedf.verif_ind" dataType="STRING" value="Y"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_pevp" id="PEVP_CALL_or_SINK" parentId="PEDF_CALL_or_SINK" label="Principal Event Participant(Call/Sink)" autoDelete="false"> 
    <defaultFields> 
      <field name="ft_t_pevp.start_tms" dataType="DATETIME" srcOccurrence="PEDF_CALL_or_SINK" valueOf="ft_t_pedf.start_tms" keepInSync="true"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_pevp.prt_purp_typ" dataType="STRING" value="SNKFDRED"/> 
    </where>  
    <validationRules> 
      <rule id="Unique_PPDF_Call_or_Sink"> 
        <xPath value="is-unique(%modelPath:PPDF_CALL_or_SINK%, &quot;concat(ppdf.pay_curr_cde,substring((ppdf.start_tms), 1, 10))&quot;)"/>  
        <!--        <xPath value="is-unique(%modelPath:PPDF_CALL_or_SINK%,&quot;substring((ppdf.start_tms), 1,10)&quot;)"/>  -->  
        <errorMessage value="Payment currency and Start Date/Time combination should be unique in Principal Payments of Call/Sink Section"/> 
      </rule> 
    </validationRules> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_CALL_or_SINK" parentId="PEVP_CALL_or_SINK" multiple="true" label="Principal Payment Definition(Call/Sink)" autoDelete="false"> 
    <inputFields> 
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.start_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/> 
    </inputFields>  
    <defaultFields/> 
  </occurrence><occurrence table="ft_t_pedf" id="PEDF_PUT_or_FACTOR" parentId="BASEISSU" label="Principal Event Defitnition(Put/Factor)" autoDelete="false"> 
    <inputFields> 
      <field name="ft_t_pedf.days_mth_bas_typ"/>  
      <field name="ft_t_pedf.days_yr_bas_typ"/>  
      <field name="ft_t_pedf.end_tms"/>  
      <field name="ft_t_pedf.first_py_tms" label="First Payment Date"/>  
      <field name="ft_t_pedf.py_dte_fq_dy_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_sp_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_qty" label="Payable Date Frequency"/>  
      <field name="ft_t_pedf.start_tms"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_pedf.verif_ind" dataType="STRING" value="Y"/>  
      <!--<field name="ft_t_pedf.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>--> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_PUT_or_FACTOR" parentId="PEVP_PUT_or_FACTOR" multiple="true" label="Principal Payment Definition(Factor)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_pedf" id="PEDF_PUT" parentId="BASEISSU" label="Principal Event Defitnition(Put)" autoDelete="false"> 
    <inputFields> 
      <field name="ft_t_pedf.days_mth_bas_typ"/>  
      <field name="ft_t_pedf.days_yr_bas_typ"/>  
      <field name="ft_t_pedf.end_tms"/>  
      <field name="ft_t_pedf.first_py_tms" label="First Payment Date"/>  
      <field name="ft_t_pedf.py_dte_fq_dy_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_sp_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_qty" label="Payable Date Frequency"/>  
      <field name="ft_t_pedf.start_tms"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_pedf.verif_ind" dataType="STRING" value="Y"/>  
      <!--<field name="ft_t_pedf.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>--> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_PUT" parentId="PEVP_PUT" multiple="true" label="Principal Payment Definition(Put)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_NEXTPUT" parentId="PEVP_NEXTPUT" multiple="true" label="Principal Payment Definition(NextPut)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_NXTPARPT" parentId="PEVP_NXTPARPT" multiple="true" label="Principal Payment Definition(NxtParpt)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_PUTPROV" parentId="PEVP_PUTPROV" multiple="true" label="Principal Payment Definition(PutProv)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_PUTSCHED" parentId="PEVP_PUTSCHED" multiple="true" label="Principal Payment Definition(PutSched)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_pedf" id="PEDF_CALLABLE" parentId="BASEISSU" label="Principal Event Defitnition(Call)" autoDelete="false"> 
    <inputFields> 
      <field name="ft_t_pedf.days_mth_bas_typ"/>  
      <field name="ft_t_pedf.days_yr_bas_typ"/>  
      <field name="ft_t_pedf.end_tms"/>  
      <field name="ft_t_pedf.first_py_tms" label="First Payment Date"/>  
      <field name="ft_t_pedf.py_dte_fq_dy_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_sp_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_qty" label="Payable Date Frequency"/>  
      <field name="ft_t_pedf.start_tms"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_pedf.verif_ind" dataType="STRING" value="Y"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_CALLABLE" parentId="PEVP_CALLABLE" multiple="true" label="Principal Payment Definition(Callable)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_pedf" id="PEDF_CALLED" parentId="BASEISSU" label="Principal Event Defitnition(Call)" autoDelete="false"> 
    <inputFields> 
      <field name="ft_t_pedf.days_mth_bas_typ"/>  
      <field name="ft_t_pedf.days_yr_bas_typ"/>  
      <field name="ft_t_pedf.end_tms"/>  
      <field name="ft_t_pedf.first_py_tms" label="First Payment Date"/>  
      <field name="ft_t_pedf.py_dte_fq_dy_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_sp_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_qty" label="Payable Date Frequency"/>  
      <field name="ft_t_pedf.start_tms"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_pedf.verif_ind" dataType="STRING" value="Y"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_CALLED" parentId="PEVP_CALLED" multiple="true" label="Principal Payment Definition(Called)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_pedf" id="PEDF_CALATPAR" parentId="BASEISSU" label="Principal Event Defitnition(Call)" autoDelete="false"> 
    <inputFields> 
      <field name="ft_t_pedf.days_mth_bas_typ"/>  
      <field name="ft_t_pedf.days_yr_bas_typ"/>  
      <field name="ft_t_pedf.end_tms"/>  
      <field name="ft_t_pedf.first_py_tms" label="First Payment Date"/>  
      <field name="ft_t_pedf.py_dte_fq_dy_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_sp_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_qty" label="Payable Date Frequency"/>  
      <field name="ft_t_pedf.start_tms"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_pedf.verif_ind" dataType="STRING" value="Y"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_CALATPAR" parentId="PEVP_CALATPAR" multiple="true" label="Principal Payment Definition(Calatpar)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_pedf" id="PEDF_CALATPRE" parentId="BASEISSU" label="Principal Event Defitnition(Call)" autoDelete="false"> 
    <inputFields> 
      <field name="ft_t_pedf.days_mth_bas_typ"/>  
      <field name="ft_t_pedf.days_yr_bas_typ"/>  
      <field name="ft_t_pedf.end_tms"/>  
      <field name="ft_t_pedf.first_py_tms" label="First Payment Date"/>  
      <field name="ft_t_pedf.py_dte_fq_dy_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_sp_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_qty" label="Payable Date Frequency"/>  
      <field name="ft_t_pedf.start_tms"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_pedf.verif_ind" dataType="STRING" value="Y"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_CALATPRE" parentId="PEVP_CALATPRE" multiple="true" label="Principal Payment Definition(Calatpre)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_isgp" id="ISGP_UNIV" parentId="BASEISSU" label="Issue Group Participant" multiple="true" dbConstraint="isgpuniv"> 
    <defaultFields> 
      <field name="ft_t_isgp.prt_purp_typ" dataType="STRING" value="MANUAL"/>  
      <field name="ft_t_isgp.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_isgp.prnt_iss_grp_oid"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_cucn" id="CUCN" parentId="BASEISSU"> 
    <defaultFields> 
      <field name="ft_t_cucn.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_cucf" id="CUCF" parentId="CUCN"> 
    <defaultFields> 
      <field name="ft_t_cucf.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_cucf.instr_id" dataType="STRING" valueOfXPath="/root/issue/issu.instr_id"/> 
    </defaultFields> 
  </occurrence><relations><table name="FT_T_MKIS"><relation relatedTable="FT_T_ISSU" name="ISSUMKIS">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<condition>
				<sql>(#FROM_TABLE#.prim_trd_mkt_ind=''Y'' or (select count(*) from ft_t_mkis where ft_t_mkis.instr_id=#TO_TABLE#.instr_id and (ft_t_mkis.end_tms is null or ft_t_mkis.end_tms  >= SYSDATE()))=1)</sql>
			</condition>
		</relation></table><table name="FT_T_MIXR"><relation relatedTable="FT_T_MKIS" name="MKISMIXR">
			<fromColumns>
				<column name="MKT_ISS_OID"/>
			</fromColumns>
			<toColumns>
				<column name="MKT_ISS_OID"/>
			</toColumns>
		</relation></table><table name="FT_T_MIXR"><relation relatedTable="FT_T_ISID" name="MIXRISID">
			<fromColumns>
				<column name="ISID_OID"/>
			</fromColumns>
			<toColumns>
				<column name="ISID_OID"/>
			</toColumns>
			<condition>
        <sql>exists (select 1 from FT_T_MIXR mixr where (mixr.end_tms IS NULL or mixr.end_tms  > p_asOfDate) and #TO_TABLE#.ISID_OID=mixr.isid_oid)</sql>
			</condition>
		</relation></table><table name="FT_T_MUST"><relation relatedTable="FT_T_MKIS" name="mkismust">
            <fromColumns>
                <column name="MKT_ISS_OID"/>
            </fromColumns>
            <toColumns>
                <column name="MKT_ISS_OID"/>
            </toColumns>
        </relation></table><table name="FT_T_IEDF"><relation relatedTable="FT_T_ISSU" name="issuiedfinterest">
            <fromColumns>
                <column name="instr_id"/>
            </fromColumns>
            <toColumns>
                <column name="instr_id"/>
            </toColumns>
            <condition>
                <sql>#FROM_TABLE#.ev_typ IN (''INTEREST'')</sql>
            </condition>
        </relation></table><table name="FT_T_ISID"><relation relatedTable="FT_T_ISSU" name="ISSUISID">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<condition>
					<sql>not exists (select 1 from ft_t_mixr mixr where (mixr.end_tms is null or mixr.end_tms  > SYSDATE()) and #FROM_TABLE#.ISID_OID=mixr.isid_oid) and #FROM_TABLE#.MKT_OID is null</sql>
				</condition>
		</relation></table><table name="FT_T_ISID"><relation relatedTable="FT_T_ISSU" name="MRKTISID">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<condition>
				<sql>not exists (select 1 from ft_t_mixr mixr where (mixr.end_tms is null or mixr.end_tms  > SYSDATE()) and #FROM_TABLE#.ISID_OID=mixr.isid_oid) and #FROM_TABLE#.MKT_OID is not null</sql>
		</condition>
		</relation></table><table name="FT_T_ISID"><relation relatedTable="FT_T_ISSU" name="MRKTISIDPUB">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<condition>			
				<sql>not exists (select 1 from ft_t_mixr mixr where (mixr.end_tms is null or mixr.end_tms  > SYSDATE()) and #FROM_TABLE#.ISID_OID=mixr.isid_oid) and #FROM_TABLE#.MKT_OID is not null</sql>			
			</condition>
		</relation></table><table name="FT_T_ISCL"><relation relatedTable="FT_T_ISSU" name="SUBTYPE">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<condition>
				<sql>#FROM_TABLE#.indus_cl_set_id in (''TKISSTYP'',''BBSECTYP'',''FTISSTYP'',''ASSETCLS'')</sql>
			</condition>
		</relation></table><table name="FT_T_ISCL"><relation relatedTable="FT_T_ISSU" name="SUBTYPE">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<condition>
				<sql>#FROM_TABLE#.indus_cl_set_id in (''TKISSTYP'',''BBSECTYP'',''FTISSTYP'',''ASSETCLS'')</sql>
			</condition>
		</relation></table><table name="FT_T_ISLL"><relation relatedTable="FT_T_ISSU" name="isllissu">
            <fromColumns>
                <column name="instr_id"/>
            </fromColumns>
            <toColumns>
                <column name="instr_id"/>
            </toColumns>
            <condition>
                <sql>#FROM_TABLE#.last_chg_tms in (SELECT max(last_chg_tms) FROM ft_t_isll where instr_id = #TO_TABLE#.instr_id)</sql>
            </condition>
        </relation></table><table name="FT_T_RIST"><relation relatedTable="FT_T_ISSU" name="RIST_INSTR">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
		</relation></table><table name="FT_T_LMST"><relation relatedTable="FT_T_ISSU" name="latestlmst">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<condition>
				<sql>#FROM_TABLE#.last_chg_tms = (SELECT MAX (last_chg_tms) FROM ft_t_lmst WHERE ft_t_lmst.instr_id = #TO_TABLE#.instr_id)</sql>
			</condition>
		</relation></table><table name="FT_T_ISGU"><relation relatedTable="FT_T_ISSU" name="ISSUISGU">
            <fromColumns>
                <column name="INSTR_ID"/>
            </fromColumns>
            <toColumns>
                <column name="INSTR_ID"/>
            </toColumns>
            <condition>
                <sql>#FROM_TABLE#.gu_typ =''COUNTRY''</sql>
            </condition>
        </relation></table><table name="FT_T_AISR"><relation relatedTable="FT_T_ISSU" name="MyAccountIssueRole">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<condition>
				<sql>#FROM_TABLE#.ACCT_ISSU_RL_TYP is not null</sql>
			</condition>
		</relation></table><table name="FT_T_AISR"><relation relatedTable="FT_T_ISSU" name="MyIssueAccountRole">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<!--Commented as AISR.ISSU_ACCT_RL_TYP has been removed (GT 37778)-->
			<!--<condition>
        <sql>#FROM_TABLE#.ISSU_ACCT_RL_TYP is not null</sql>
      </condition>-->
		</relation></table><table name="FT_T_ISRT"><relation relatedTable="FT_T_ISSU" name="RTNG_HIST" checkService="RATING_SERVICE">
			<condition>
				<sql>#FROM_TABLE#.SYS_EFF_END_TMS IS NULL AND (#FROM_TABLE#.INSTR_ID) = (#TO_TABLE#.INSTR_ID)</sql>
			</condition>
		</relation></table><table name="FT_T_MIXR"><relation relatedTable="FT_T_ISID" name="MIXRISIDPUB">
			<fromColumns>
				<column name="ISID_OID"/>
			</fromColumns>
			<toColumns>
				<column name="ISID_OID"/>
			</toColumns>
			<condition>				
				<sql>exists (select 1 from FT_T_MIXR mixr where (mixr.end_tms IS NULL or mixr.end_tms  > SYSDATE()) and #TO_TABLE#.ISID_OID=mixr.isid_oid)</sql>				
			</condition>
		</relation></table><table name="FT_T_MKIS"><relation relatedTable="FT_T_ISPC" name="LATESTPRICE">
			<fromColumns>
				<column name="INSTR_ID"/>
				<column name="MKT_OID"/>
				<column name="PRC_CURR_CDE"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
				<column name="MKT_OID"/>
				<column name="PRC_CURR_CDE"/>
			</toColumns>
			<condition>
				<sql>#TO_TABLE#.prc_tms = 
             (select max(prc_tms)
                from ft_t_ispc maxprc
               where maxprc.instr_id = #TO_TABLE#.instr_id
                 and maxprc.mkt_oid = #TO_TABLE#.mkt_oid
                 and maxprc.prc_curr_cde = #TO_TABLE#.prc_curr_cde)</sql>
			</condition>
		</relation></table><table name="FT_T_ISPC"><relation name="latestclosingprice" relatedTable="FT_T_ISSU">
            <fromColumns>
                <column name="INSTR_ID"/>
            </fromColumns>
            <toColumns>
                <column name="INSTR_ID"/>
            </toColumns>
            <condition>
                <sql>(#FROM_TABLE#.last_chg_tms
                      , #FROM_TABLE#.prc_tms
                      , COALESCE (#FROM_TABLE#.data_src_id, ''999'')
                      , #FROM_TABLE#.prc_srce_typ
                      , #FROM_TABLE#.prc_typ
                      || COALESCE (TRIM (#FROM_TABLE#.addnl_prc_qual_typ), ''999'')) IN
                            (  SELECT   MAX (last_chg_tms)
                                        , MAX (prc_tms)
                                        , COALESCE (data_src_id, ''999'')
                                        , prc_srce_typ
                                        , prc_typ
                                        || COALESCE (TRIM (addnl_prc_qual_typ), ''999'')
                                 FROM   ft_t_ispc ispc1
                                WHERE   instr_id = #FROM_TABLE#.instr_id
                                AND trim(prc_typ) || trim(addnl_prc_qual_typ) IN (''BID2171'',''ASKED2124'',''ASKED1'',''0031'',''0033'',''ASKED3'')      
                             GROUP BY   prc_tms,
                                        data_src_id,
                                        prc_srce_typ,
                                        prc_typ,
                                        addnl_prc_qual_typ,
                                        prc_qt_meth_typ)</sql>
            </condition>
        </relation></table><table name="FT_T_IEVP"><relation relatedTable="FT_T_IEDF" name="iedfievpestdiv">
            <fromColumns>
                <column name="INC_EV_DEF_ID"/>
            </fromColumns>
            <toColumns>
                <column name="INC_EV_DEF_ID"/>
            </toColumns>
            <condition>
                <sql>#FROM_TABLE#.prt_purp_typ IN (''ESTIMATE'',''DIVIDEND'')</sql>
            </condition>
        </relation></table><table name="FT_T_IPDF"><relation relatedTable="FT_T_IEVP" name="ipdfbasecpi">
            <fromColumns>
                <column name="INC_EV_PRT_ID"/>
            </fromColumns>
            <toColumns>
                <column name="INC_EV_PRT_ID"/>
            </toColumns>
            <condition>
                <sql>#FROM_TABLE#.rate_fixing_base_crte is not null and #FROM_TABLE#.start_tms = (select max(start_tms) from ft_t_ipdf where inc_ev_prt_id=#FROM_TABLE#.inc_ev_prt_id and rate_fixing_base_crte is not null)</sql>
            </condition>
        </relation></table><table name="FT_T_PEDF"><relation relatedTable="FT_T_ISSU" name="pedffactorissu">
            <fromColumns>
                <column name="instr_id"/>
            </fromColumns>
            <toColumns>
                <column name="instr_id"/>
            </toColumns>
            <condition>
                <sql>#FROM_TABLE#.ev_typ IN (''FACTOR'')</sql>
            </condition>
        </relation></table><table name="FT_T_PEVP"><relation relatedTable="FT_T_PEDF" name="pevpfactorissu">
            <fromColumns>
                <column name="prin_ev_def_id"/>
            </fromColumns>
            <toColumns>
                <column name="prin_ev_def_id"/>
            </toColumns>
            <condition>
                <sql>#FROM_TABLE#.prt_purp_typ IN (''FACTOR'')</sql>
            </condition>
        </relation></table><table name="FT_T_PPDF"><relation relatedTable="FT_T_PEVP" name="ppdf_pevp">
            <fromColumns>
                <column name="PRIN_EV_PRT_ID"/>
            </fromColumns>
            <toColumns>
                <column name="PRIN_EV_PRT_ID"/>
            </toColumns>
            <condition>
                <sql>ROWNUM=1</sql>
            </condition>
        </relation></table><table name="FT_T_IRCL"><relation relatedTable="FT_T_ISSU" name="IRCL_ISSU">
			<fromColumns>
				<column name="INSTR_ISSR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ISSR_ID"/>
			</toColumns>
			<condition>
				<sql>(#FROM_TABLE#.instr_id = #TO_TABLE#.instr_id or #FROM_TABLE#.instr_id is null)</sql> 
			</condition>
		</relation></table><table name="FT_T_ISGP"><relation relatedTable="FT_T_ISSU" name="isgpuniv">
			<fromColumns>
				<column name="instr_id"/>
			</fromColumns>
			<toColumns>
				<column name="instr_id"/>
			</toColumns>
			<condition>
				<sql>TRIM(#FROM_TABLE#.PRNT_ISS_GRP_OID) in (SELECT TRIM(ISS_GRP_OID) FROM FT_T_ISGR WHERE GRP_PURP_TYP=''UNIVERSE'')</sql>
			</condition>
		</relation></table></relations></model>' WHERE modl_id ='REITS' AND modl_typ = 'ISSU';		

UPDATE FT_T_MDDF SET modl_schema ='<?xml version="1.0" encoding="UTF-8"?>
<model xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" headerInfoXPath="concat(%modelPath:BASEISSU:ft_t_issu.pref_iss_nme%,'' - '',%modelPath:BASEISSU:ft_t_issu.pref_id_ctxt_typ% ,''-'',%modelPath:BASEISSU:ft_t_issu.pref_iss_id%)" id="WARRANT" extends="BDERIVAT" xsi:noNamespaceSchemaLocation="../../schemas/Model.xsd" minLevelToEnableChangeApproval="2">
	<!--<model xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="../../schemas/Model.xsd" >  -->
	<occurrence extends="BASEISSU" id="BASEISSU" table="ft_t_issu" level="1" label="Issue Description/Issue Details">
		<validationRules>
			<rule id="ValidationISID">
				<xPath value="boolean((count(/root/issueidentifiers/identifier[@status!=''deleted'' or string-length(@status)=0]) >0)  or (/root/issue[@status!=''new'' or  string-length(@status)=0]))"/>

				<errorMessage value="At least one Instrument Level Identifier has to be entered."/>
			</rule>
			<rule id="ValidationISID_ACTIVITYSTATUS">
				<xPath value="boolean((count(/root/issueidentifiers/identifier[@status!=''deleted'' or string-length(@status)=0]) >0 or string(/root/issue/issu.iss_actvy_stat_typ)=''INACTIVE'')  or (/root/issue[@status=''new'' or  string-length(@status)!=0]))"/>

				<errorMessage value="User has either to mark the Issue activity status(Instrument Status)  as inactive or have at least one identifier active."/>
			</rule>
		<rule id="MultiplePrimaryMarkets" pageName="Market"> 
        <xPath value="boolean(count(%modelPath:MKISDEFBISSU%[(string-length(mkis.end_tms) = 0) and (mkis.prim_trd_mkt_ind = ''Y'')])  <  2)"/>  
        <errorMessage value="There should not be multiple primary markets for a single issue."/> 
      </rule></validationRules>

		<inputFields>
			<field name="ft_t_issu.iss_typ" label="Warrant Type" level="1"/>
		<field name="ft_t_issu.denom_curr_cde" label="Currency" level="2"/><field name="ft_t_issu.sec_form_typ"/><field name="ft_t_issu.instr_issr_id"/><field name="ft_t_issu.nom_val_unit_camt"/><field name="ft_t_issu.distribution_curr_cde"/><field name="ft_t_issu.iss_tms" label="Instrument Date"/><field name="ft_t_issu.cl_typ"/></inputFields>
	<defaultFields> 
      <field name="ft_t_issu.access_auth_typ" dataType="STRING" value="PUBLIC"/>  
      <field name="ft_t_issu.iss_actvy_stat_typ" dataType="STRING" value="ACTIVE"/>  
      <field name="ft_t_issu.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
    </defaultFields></occurrence>
	<occurrence table="ft_t_isll" id="ISLL" parentId="BASEISSU" label="Collateral Type" multiple="false">
		<inputFields>
			<field name="ft_t_isll.coll_typ"/>
		</inputFields>
		<defaultFields>
			<field name="ft_t_isll.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>
			<field name="ft_t_isll.iss_coll_nme" valueOf="ft_t_isll.coll_typ" srcOccurrence="ISLL" dataType="STRING"/>
		</defaultFields>
	</occurrence>
	<occurrence table="ft_t_ridf" id="RIDF_WAR" parentId="BASEISSU" label="Warrant Related Issue Definition" autoDelete="false">
		<defaultFields>
			<field name="ft_t_ridf.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>
			<field name="ft_t_ridf.xpd_start_tms" dataType="DATETIME" srcOccurrence="BASEISSU" valueOf="ft_t_issu.iss_tms" keepInSync="true"/>
			<field name="ft_t_ridf.xpd_end_tms" dataType="DATETIME" srcOccurrence="BASEISSU" valueOf="ft_t_issu.mat_exp_tms" keepInSync="true"/>
		</defaultFields>
		<!--<validationRules>
    <rule id="Validation_Exercise_Period" > 
        <xPath value="boolean((%modelPath:RIDF_WAR:ft_t_ridf.xpd_start_tms%  <  %modelPath:RIDF_WAR:ft_t_ridf.xpd_end_tms%) or (string-length(%modelPath:RIDF_WAR:ft_t_ridf.xpd_start_tms%)=0 or string-length(%modelPath:RIDF_WAR:ft_t_ridf.xpd_end_tms%)=0))"/>  
        <errorMessage value="Exercise Period Start Date should be less than Exercise Period End date"/> 
      </rule>
    </validationRules> -->
		<inputFields>
			<field name="ft_t_ridf.cnvr_exer_cprc"/>
		</inputFields>
		<where>
			<field name="ft_t_ridf.rel_typ" dataType="STRING" value="WARRANT"/>
		</where>
	</occurrence>
	<!--	Added the Occurrence RIDF_ALL so that the Validation condition can be checked for all records -->

	<!--	other than the one that is being defaulted in RIDF_UND occurrence -->

	<occurrence table="ft_t_ridf" id="RIDF_ALL" parentId="BASEISSU" label="Contract Details">
		<defaultFields>
			<field name="ft_t_ridf.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>
		</defaultFields>
		<where>
		</where>
		<validationRules>
			<rule id="Validation_Exercise_Period_All">
				<xPath value="boolean((%modelPath:RIDF_ALL:ft_t_ridf.xpd_start_tms%  < = %modelPath:RIDF_ALL:ft_t_ridf.xpd_end_tms%) or (string-length(%modelPath:RIDF_ALL:ft_t_ridf.xpd_start_tms%)=0 or string-length(%modelPath:RIDF_ALL:ft_t_ridf.xpd_end_tms%)=0))"/>
				<errorMessage value="Exercise Start Date should be less than Exercise End Date"/>
			</rule>
		</validationRules>
	</occurrence>
	<occurrence table="ft_t_riss" id="RISS_WAR" parentId="RIDF_WAR" label="Warrant Related Issue">
		<defaultFields>
			<field name="ft_t_riss.ev_bas_prt_camt" dataType="NUMBER" value="1"/>
			<field name="ft_t_riss.part_units_typ" dataType="STRING" value="ALL"/>
			<field name="ft_t_riss.ev_amt_typ" dataType="STRING" value="UNIT"/>
		</defaultFields>
		<where>
			<field name="ft_t_riss.iss_part_rl_typ" dataType="STRING" value="UNDLYING"/>
		</where>
		<inputFields>
			<field name="ft_t_riss.ev_part_camt" label="Number of Shares/Warrant"/>
			<field name="ft_t_riss.instr_id"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_uwch" id="UWCH" parentId="BASEISSU" label="Underwriting Characteristics">
		<defaultFields>
			<field name="ft_t_uwch.offer_num" dataType="NUMBER" value="1"/>
		</defaultFields>
	</occurrence>
	<occurrence table="ft_t_iscm" id="ISCM_LEADMGR" parentId="BASEISSU" label="Lead Manager Issue Comments">
		<defaultFields>
			<field name="ft_t_iscm.cmnt_reas_typ" dataType="STRING" value="LEADMGR"/>
			<field name="ft_t_iscm.ln_num" dataType="NUMBER" value="1"/>
		</defaultFields>
	</occurrence>
	<occurrence table="ft_t_iscm" id="ISCM_TRA" parentId="BASEISSU" label="Conversion Agent">
		<defaultFields>
			<field name="ft_t_iscm.ln_num" dataType="NUMBER" value="1"/>
			<field name="ft_t_iscm.cmnt_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>
		</defaultFields>
		<where>
			<field name="ft_t_iscm.cmnt_reas_typ" dataType="STRING" value="TRAGENT"/>
		</where>
		<inputFields>
			<field name="ft_t_iscm.cmnt_txt" label="Conversion Agent"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_ench" id="ENCH" parentId="BASEISSU" label="Covered/Uncovered">
		<where>
			<field name="ft_t_ench.entlmnt_typ" dataType="STRING" value="WARRANT"/>
		</where>
		<inputFields>
			<field name="ft_t_ench.covered_ind" label="Covered/Uncovered"/>
			<field name="ft_t_ench.subs_prd_start_tms" label="Exercise Date"/>
			<field name="ft_t_ench.subs_prd_end_tms" label="Expiry date"/>
			<field name="ft_t_ench.call_put_typ" label="Put/Call Indicator"/>
		</inputFields>
	</occurrence>
	<occurrence table="ft_t_iscm" id="ISCM_GUARNTOR" parentId="BASEISSU" label="GUARNTOR Issue Comments">
		<where>
			<field name="ft_t_iscm.cmnt_reas_typ" dataType="STRING" value="GUARNTOR"/>
		</where>
		<defaultFields>
			<field name="ft_t_iscm.ln_num" dataType="NUMBER" value="1"/>
		</defaultFields>
	</occurrence>
	<occurrence extends="MKISPMBISSU" table="ft_t_mkis" id="MKISPMBISSU" parentId="BASEISSU" multiple="false" label="Market Details">
		<inputFields>
			<!--<field name="ft_t_mkis.mkt_oid"/>
			<field name="ft_t_mkis.trdng_curr_cde" level="2"/>
			<field name="ft_t_mkis.rnd_lot_sz_cqty" level="2"/>-->
			<field name="ft_t_mkis.iss_prc_ut_camt" label="Minimun Denom"/>
		<field name="ft_t_mkis.mkt_oid"/><field name="ft_t_mkis.rnd_lot_sz_cqty"/><field name="ft_t_mkis.trdng_curr_cde"/><field name="ft_t_mkis.trdng_stat_typ"/></inputFields>
	<validationRules> 
      <rule id="Warning" messageType="WARNING"> 
        <xPath value="boolean(string-length(%modelPath:MKISPMBISSU:ft_t_mkis.end_tms%)= 0 or string-length(%modelPath:MKISPMBISSU:ft_t_mkis.end_tms%) <  SYSDATE())"/>  
        <errorMessage value="Primary Market is end dated"/> 
      </rule> 
    </validationRules><where> 
      <field name="ft_t_mkis.prim_trd_mkt_ind" dataType="STRING" value="Y"/> 
    </where><defaultFields> 
      <!--<field name="ft_t_mkis.trdng_stat_typ" dataType="STRING" value="ACTIVE"/>  
      -->  
      <field name="ft_t_mkis.prc_ut_meas_typ" dataType="STRING" value="NOMINAL"/>  
      <!--<field name="ft_t_mkis.mkt_iss_oid" dataType="STRING" valueOfFunction="OID" uiOnly="true"/> 
      --> 
    </defaultFields></occurrence>
	<occurrence extends="MIXR_PRIM" table="ft_t_mixr" id="MIXR_PRIM" parentId="MKISPMBISSU" label=" Market Issue Cross Reference ((Primary)" dbConstraint="MKISMIXR"><defaultFields> 
      <field name="ft_t_mixr.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>     
      <field name="ft_t_mixr.trdng_stat_typ" dataType="STRING" srcOccurrence="MKISPMBISSU" valueOf="ft_t_mkis.trdng_stat_typ"/> 
    </defaultFields></occurrence>
	<occurrence extends="OPCH" label="Issue Details/Conversion Details" table="ft_t_opch" id="OPCH" parentId="BASEISSU">
		<inputFields>
			<field name="ft_t_opch.strke_cprc" label="Contract Rate"/>
			<field name="ft_t_opch.call_put_typ" label="Put/Call Indicator"/>
		</inputFields>
	</occurrence>
	<!--Added Occurrences for Identifiers which has been additionally given by Nancy-->
<!--<occurrence extends="ISID_TIC_EX" label="Trading Ticker">
		<validationRules>
			<rule id="Iss_Usage_req" messageType="WARNING">
				<xPath value="(string-length(%modelPath:ISID_TIC_EX:ft_t_isid.iss_usage_typ%)!= 0) "/>
				<errorMessage value="Issue Usage has to be entered for Trading Ticker"/>
			</rule>
		</validationRules>
	</occurrence>-->
	<presentation>
		<until level="100">
			<override class="codf" rendered="false"/>
			<override class="eqch" rendered="false"/>
			<override class="mnch" rendered="false"/>
			<override class="lmch" rendered="false"/>
			<override class="fnch" rendered="false"/>
			<override class="ench" rendered="true"/>
			<override class="fech" rendered="false"/>
			<override class="epst" rendered="false"/>
		</until>
	</presentation>
<occurrence table="ft_t_isgu" id="ISGU_RISK" parentId="BASEISSU" label="Country of Risk"> 
    <inputFields> 
      <field name="ft_t_isgu.gu_cnt"/>  
      <field name="ft_t_isgu.gu_id"/>  
      <field name="ft_t_isgu.gu_typ"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isgu.start_tms" valueOf="ft_t_issu.start_tms" srcOccurrence="BASEISSU" dataType="DATETIME"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_isgu.iss_gu_purp_typ" dataType="STRING" value="RISK"/> 
    </where> 
  </occurrence><occurrence table="ft_t_isgu" id="ISGU_TRDG" parentId="BASEISSU" label="Country of Trading"> 
    <where> 
      <field name="ft_t_isgu.iss_gu_purp_typ" dataType="STRING" value="TRADING"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_isgu.start_tms" valueOf="ft_t_issu.start_tms" srcOccurrence="BASEISSU" dataType="DATETIME"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_isgu.gu_cnt"/>  
      <field name="ft_t_isgu.gu_id"/>  
      <field name="ft_t_isgu.gu_typ"/> 
    </inputFields> 
  </occurrence><occurrence extends="ISDEBISSU" table="ft_t_isde" id="ISDEBISSU" parentId="BASEISSU" label="Issue Description" level="1"><where> 
      <field name="ft_t_isde.desc_usage_typ" dataType="STRING" value="PRIMARY"/> 
    </where><defaultFields> 
      <field name="ft_t_isde.desc_srce_typ" dataType="STRING" value="INHOUSE"/>  
      <field name="ft_t_isde.nls_cde" dataType="STRING" value="ENGLISH"/>  
      <field name="ft_t_isde.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields><inputFields> 
      <field name="ft_t_isde.iss_nme" label="Instrument Name" level="1"/>  
      <field name="ft_t_isde.start_tms"/>  
      <field name="ft_t_isde.iss_desc" label="Instrument Description"/> 
    </inputFields></occurrence><occurrence extends="PEDF_CALL_or_SINK" label="Principal Event Definition - Callable" autoDelete="false" table="ft_t_pedf" id="PEDF_CALL_or_SINK" parentId="BASEISSU"> 
    <where> 
      <field name="ft_t_pedf.ev_typ" dataType="STRING" value="CALLABLE"/> 
    </where> 
  <defaultFields> 
      <field name="ft_t_pedf.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_pedf.verif_ind" dataType="STRING" value="Y"/> 
    </defaultFields><inputFields> 
      <field name="ft_t_pedf.days_mth_bas_typ"/>  
      <field name="ft_t_pedf.days_yr_bas_typ"/>  
      <field name="ft_t_pedf.end_tms"/>  
      <field name="ft_t_pedf.first_py_tms" label="First Payment Date"/>  
      <field name="ft_t_pedf.py_dte_fq_qty" label="Payable Date Frequency"/>  
      <field name="ft_t_pedf.py_dte_fq_dy_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_sp_typ"/>  
      <field name="ft_t_pedf.start_tms"/> 
    </inputFields></occurrence><occurrence extends="PEDF_PUT_or_FACTOR" label="Principal Event Definition - Put" autoDelete="false" table="ft_t_pedf" id="PEDF_PUT_or_FACTOR" parentId="BASEISSU"> 
    <where> 
      <field name="ft_t_pedf.ev_typ" dataType="STRING" value="PUT"/> 
    </where> 
  <defaultFields> 
      <field name="ft_t_pedf.verif_ind" dataType="STRING" value="Y"/>  
      <!--<field name="ft_t_pedf.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>--> 
    </defaultFields><inputFields> 
      <field name="ft_t_pedf.days_mth_bas_typ"/>  
      <field name="ft_t_pedf.days_yr_bas_typ"/>  
      <field name="ft_t_pedf.end_tms"/>  
      <field name="ft_t_pedf.first_py_tms" label="First Payment Date"/>  
      <field name="ft_t_pedf.py_dte_fq_dy_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_sp_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_qty" label="Payable Date Frequency"/>  
      <field name="ft_t_pedf.start_tms"/> 
    </inputFields></occurrence><occurrence extends="MKISDEFBISSU" table="ft_t_mkis" id="MKISDEFBISSU" parentId="BASEISSU" autoCreate="false" multiple="true"> 
    <inputFields> 
      <field name="ft_t_mkis.trdng_stat_typ" label="Market Status"/>  
      <field name="ft_t_mkis.actively_traded_ind"/>  
      <field name="ft_t_mkis.norm_mkt_sz_cqty" label="Quote Lot Size"/>  
      <field name="ft_t_mkis.mrgn_sec_ind" label="Marginable"/>  
      <field name="ft_t_mkis.settle_curr_cde"/>  
      <field name="ft_t_mkis.trd_lot_size_cqty"/>  
      <field name="ft_t_mkis.prim_trd_mkt_ind" label="Primary Exchange"/>  
      <field name="ft_t_mkis.prc_curr_cde" label="Quotation Currency"/>  
      <field name="ft_t_mkis.mkt_oid" label="Exchange Name"/>  
      <field name="ft_t_mkis.trdng_ut_meas_typ"/>  
      <field name="ft_t_mkis.first_trdng_tms"/>  
      <field name="ft_t_mkis.last_trdng_tms"/>  
      <field name="ft_t_mkis.settle_meth_typ"/> 
    <field name="ft_t_mkis.trdng_curr_cde"/><field name="ft_t_mkis.iss_prc_ut_camt"/><field name="ft_t_mkis.rnd_lot_sz_cqty"/><field name="ft_t_mkis.gu_id" label="Trading Country"/><field name="ft_t_mkis.opol_ind"/></inputFields>  
    <!--<defaultFields>
      <field name="ft_t_mkis.prim_trd_mkt_ind" dataType="STRING" value="N"/>
    </defaultFields>-->  
    <!-- remove for GT 94712<validationRules> 
      <rule id="Listing_ID_Validation"> 
        <xPath value="boolean(string-length(%modelPath:LISTISID_BISSU:ft_t_isid.iss_id%)  > 0 )"/>  
        <errorMessage value="At least one Exchange Level Identifier has to be entered for every Market 123"/> 
      </rule> 
    </validationRules>--> 
  <defaultFields>      
      <!--<field name="ft_t_mkis.trdng_stat_typ" value="ACTIVE" dataType="STRING"/>  
      -->  
      <field name="ft_t_mkis.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_mkis.last_chg_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_mkis.last_chg_usr_id" dataType="STRING" valueOfFunction="APPUSER"/> 
    </defaultFields></occurrence><occurrence extends="MIXRBISSU" table="ft_t_mixr" id="MIXRBISSU" parentId="MKISDEFBISSU" multiple="true" dbConstraint="MKISMIXR"><defaultFields> 
      <field name="ft_t_mixr.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
      <field name="ft_t_mixr.trdng_stat_typ" dataType="STRING" srcOccurrence="MKISDEFBISSU" valueOf="ft_t_mkis.trdng_stat_typ"/>  
      <field name="ft_t_mixr.last_chg_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_mixr.last_chg_usr_id" dataType="STRING" valueOfFunction="APPUSER"/> 
    </defaultFields><inputFields> 
      <field name="ft_t_mixr.end_tms"/> 
    </inputFields></occurrence><occurrence table="ft_t_isde" id="ISDE_VENDOR" parentId="BASEISSU" label="Issue Description"> 
    <defaultFields> 
      <field name="ft_t_isde.nls_cde" dataType="STRING" value="ENGLISH"/>  
      <field name="ft_t_isde.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_isde.iss_nme" label="Instrument Name"/>  
      <field name="ft_t_isde.start_tms"/>  
      <field name="ft_t_isde.iss_desc" label="Instrument Description"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_isde.desc_srce_typ" dataType="STRING" value="VENDOR"/> 
    </where> 
  </occurrence><occurrence table="ft_t_isid" id="ISID_Iss_level" parentId="BASEISSU" label="Issue Identifiers" multiple="true" dbConstraint="ISSUISID"> 
    <inputFields> 
      <field name="ft_t_isid.iss_id" label="Identifier Value"/>  
      <field name="ft_t_isid.id_ctxt_typ" label="Identifier Type"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <validationRules> 
      <rule id="ISINMarket"> 
        <xPath value="boolean(not(%modelPath:ISID_Iss_level:ft_t_isid.id_ctxt_typ% =''ISIN'' and not(string-length(%modelPath:ISID_Iss_level:ft_t_isid.mkt_oid%) = 0)))"/>  
        <errorMessage value="ISIN identifier cannot have market."/> 
      </rule>  
      <!--<rule id="ISSUTXTTYPNOTSUPPORTED" messageType="WARNING"> 
	   <xPath value="boolean(not(%modelPath:ISID_Iss_level%/intlvlid_supported=''0''))"/>
          <errorMessageXPath value="concat(%modelPath:ISID_Iss_level:ft_t_isid.id_ctxt_typ%,'' is no longer supported as a valid Instrument Level Identifier. Please take necessary action.'')"/>
		 </rule>--> 
    </validationRules> 
  </occurrence><occurrence table="ft_t_isid" id="ISID_MKT_Iss_level_PUB" parentId="BASEISSU" label="Global Market Identifiers pub" multiple="true" dbConstraint="MRKTISIDPUB"> 
    <!-- <where> 
      <field name="ft_t_isid.mkt_oid" dataType="STRING" isNull="false"/> 
    </where> -->  
    <inputFields> 
      <field name="ft_t_isid.iss_id" label="Identifier Value"/>  
      <field name="ft_t_isid.id_ctxt_typ" label="Identifier Type"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <validationRules> 
      <rule id="ISINMarket"> 
        <xPath value="boolean(not(%modelPath:ISID_MKT_Iss_level_PUB:ft_t_isid.id_ctxt_typ% =''ISIN'' and not(string-length(%modelPath:ISID_MKT_Iss_level_PUB:ft_t_isid.mkt_oid%) = 0)))"/>  
        <errorMessage value="ISIN identifier cannot have market."/> 
      </rule> 
    </validationRules> 
  </occurrence><occurrence table="ft_t_isid" id="ISIDBISIN" parentId="BASEISSU" label="Identifiers"> 
    <inputFields> 
      <field name="ft_t_isid.iss_id"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_isid.id_ctxt_typ" dataType="STRING" value="ISIN"/> 
    </where> 
  </occurrence><occurrence table="ft_t_isid" id="ISIDBINH" parentId="BASEISSU" label="Identifiers"> 
    <inputFields> 
      <field name="ft_t_isid.iss_id"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_isid.id_ctxt_typ" dataType="STRING" value="INHOUSE"/> 
    </where> 
  </occurrence><occurrence table="ft_t_isid" id="ISIDBCUS" parentId="BASEISSU" label="Identifiers"> 
    <inputFields> 
      <field name="ft_t_isid.iss_id"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_isid.id_ctxt_typ" dataType="STRING" value="CUSIP"/> 
    </where> 
  </occurrence><occurrence table="ft_t_isid" id="ISIDBCOM" parentId="BASEISSU" label="Identifiers"> 
    <inputFields> 
      <field name="ft_t_isid.iss_id"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_isid.id_ctxt_typ" dataType="STRING" value="COMMON"/> 
    </where> 
  </occurrence><occurrence table="ft_t_isid" id="ISIDVAL" parentId="BASEISSU" label="Identifiers"> 
    <inputFields> 
      <field name="ft_t_isid.iss_id"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_isid.id_ctxt_typ" dataType="STRING" value="VALOREN"/> 
    </where> 
  </occurrence><occurrence table="ft_t_iscl" id="ISCL_INSUBTYP" parentId="BASEISSU" label="Issue Classification" dbConstraint="SUBTYPE" multiple="false"> 
    <where> 
      <field name="ft_t_iscl.clsf_purp_typ" dataType="STRING" value="INSUBTYP"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_iscl.cl_value" label="Instrument Sub-Type"/>  
      <field name="ft_t_iscl.indus_cl_set_id"/>  
      <field name="ft_t_iscl.clsf_oid"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_iscl.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_fnch" id="FNCH_ALL" parentId="BASEISSU" label="Fund Characteristics"> 
    <defaultFields> 
      <!--<field name="ft_t_fnch.chars_eff_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>-->    
    </defaultFields> 
  </occurrence><occurrence table="ft_t_iscm" id="ISCMBISSU" parentId="BASEISSU" label="Comments"> 
    <defaultFields> 
      <field name="ft_t_iscm.cmnt_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_iscm.ln_num" dataType="NUMBER" value="1"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_iscm.cmnt_txt"/> 
    </inputFields>  
    <where> 
      <field name="ft_t_iscm.cmnt_reas_typ" dataType="STRING" value="COMMENT"/> 
    </where> 
  </occurrence><occurrence table="ft_t_isrt" id="ISRTBISSU" parentId="BASEISSU" multiple="true" label="Rating"> 
    <inputFields> 
      <field name="ft_t_isrt.rtng_curr_typ"/>  
      <field name="ft_t_isrt.rtng_purp_typ"/>  
      <field name="ft_t_isrt.rtng_set_oid"/>  
      <field name="ft_t_isrt.rtng_cde"/>  
      <field name="ft_t_isrt.start_tms"/>  
      <field name="ft_t_isrt.rtng_eff_tms"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isrt.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>   
    </defaultFields> 
  </occurrence><occurrence table="ft_t_rgch" id="RGCHBISSU" parentId="BASEISSU" label="Regulatory Information"> 
    <inputFields> 
      <field name="ft_t_rgch.gu_id"/>  
      <field name="ft_t_rgch.gu_cnt"/>  
      <field name="ft_t_rgch.gu_typ"/>  
      <field name="ft_t_rgch.isma_regulated_ind"/>  
      <field name="ft_t_rgch.rule_144a_ind"/>  
      <field name="ft_t_rgch.reg_s_ind"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_rgch.start_tms" dataType="DATETIME" srcOccurrence="BASEISSU" valueOf="ft_t_issu.start_tms"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_isid" id="ISID_TIC_PM_PUB" parentId="MIXR_PRIM" label="Issue Identifier-Ticker" dbConstraint="MIXRISIDPUB"> 
    <where> 
      <field name="ft_t_isid.id_ctxt_typ" dataType="STRING" value="TICKER"/> 
    </where>  
    <inputFields> 
      <field name="ft_t_isid.iss_id" label="Primary Ticker"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_isid.isid_oid" dataType="STRING" srcOccurrence="MIXR_PRIM" valueOf="ft_t_mixr.isid_oid"/>  
      <field name="ft_t_isid.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_isid.mkt_oid" dataType="STRING" srcOccurrence="MKISPMBISSU" valueOf="ft_t_mkis.mkt_oid"/>  
      <field name="ft_t_isid.instr_id" dataType="STRING" srcOccurrence="BASEISSU" valueOf="ft_t_issu.instr_id"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_isxr" id="BISSU_ISXR_ISID" parentId="LISTISID_BISSU" multiple="true" autoDelete="false"> 
    <where> 
      <field name="ft_t_isxr.isid_oid" dataType="STRING" srcOccurrence="LISTISID_BISSU" valueOf="ft_t_isid.isid_oid"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_isxr.last_chg_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_isxr.last_chg_usr_id" dataType="STRING" valueOfFunction="APPUSER"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_isxr.isxr_rel_purp_typ"/>  
      <field name="ft_t_isxr.start_tms"/>  
      <field name="ft_t_isxr.end_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_must" id="MUST_MICOPOL" parentId="MKISDEFBISSU" autoDelete="false"> 
    <where> 
      <field name="ft_t_must.stat_def_id" dataType="STRING" value="MICOPOL"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_must.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_must.stat_char_val_txt" label="OPOL"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_must" id="MUST_CDREXCH" parentId="MKISDEFBISSU" autoDelete="false"> 
    <where> 
      <field name="ft_t_must.stat_def_id" dataType="STRING" value="CDREXCH"/> 
    </where>  
    <defaultFields> 
      <field name="ft_t_must.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_must.stat_char_val_txt" label="Exchange Calendar"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_ispc" id="ISPCBISSU" parentId="BASEISSU" label="Issue Price Details"> 
    <inputFields> 
      <field name="ft_t_ispc.prc_typ"/>  
      <field name="ft_t_ispc.prc_srce_typ"/>  
      <field name="ft_t_ispc.prc_tms"/>  
      <field name="ft_t_ispc.unit_cprc"/>  
      <field name="ft_t_ispc.prc_curr_cde"/> 
    </inputFields>  
    <defaultFields> 
      <!--      <field name="ft_t_ispc.prc_curr_cde" dataType="STRING" srcOccurrence="BASEISSU" valueOf="ft_t_issu.denom_curr_cde"/>  -->  
      <field name="ft_t_ispc.prc_qt_meth_typ" dataType="STRING" value="1"/>  
      <field name="ft_t_ispc.prc_valid_typ" dataType="STRING" value="VALID"/>  
      <field name="ft_t_ispc.prcng_meth_typ" dataType="STRING" value="1"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_iedf" id="IEDF_DIV_or_INT" parentId="BASEISSU" label="Income Event Definition(Dividend/Interest)"> 
    <defaultFields> 
      <field name="ft_t_iedf.verif_ind" dataType="STRING" value="Y"/>  
      <field name="ft_t_iedf.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_iedf.first_py_tms" label="First Payment Date"/>  
      <field name="ft_t_iedf.days_mth_bas_typ"/>  
      <field name="ft_t_iedf.days_yr_bas_typ"/>  
      <field name="ft_t_iedf.calc_meth_typ" label="Calculation Method"/>  
      <field name="ft_t_iedf.py_dte_fq_qty" label="Payable Date Frequency"/>  
      <field name="ft_t_iedf.py_dte_fq_dy_typ"/>  
      <field name="ft_t_iedf.py_dte_fq_sp_typ"/>  
      <field name="ft_t_iedf.start_tms"/>  
      <field name="ft_t_iedf.end_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_ievp" id="IEVP_DIV_or_INT" parentId="IEDF_DIV_or_INT" label="Income Event Participant(Dividend/Interest)"> 
    <defaultFields> 
      <field name="ft_t_ievp.prt_purp_typ" dataType="STRING" value="PMTDTLS"/>  
      <field name="ft_t_ievp.start_tms" dataType="DATETIME" srcOccurrence="IEDF_DIV_or_INT" valueOf="ft_t_iedf.start_tms"/> 
    </defaultFields>  
    <!--<validationRules>
			<rule id="Unique_IPDF">
				<xPath value="is-unique(%modelPath:IPDF_DIV_or_INT%, &quot;concat(ipdf.pay_curr_cde, substring((ipdf.start_tms), 1, 10))&quot;)"/>
				<errorMessage value="Payment currency and Start Date/Time combination should be unique in Income Payments of Dividend/Interest Section"/>
				
			</rule>
		</validationRules>--> 
  </occurrence><occurrence table="ft_t_ipdf" id="IPDF_DIV_or_INT" parentId="IEVP_DIV_or_INT" multiple="true" label="Income Payment Definition(Dividend/Interest)"> 
    <inputFields> 
      <field name="ft_t_ipdf.start_tms"/>  
      <field name="ft_t_ipdf.ev_rate_typ"/>  
      <field name="ft_t_ipdf.ev_crte"/>  
      <field name="ft_t_ipdf.iss_part_rl_typ"/>  
      <field name="ft_t_ipdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ipdf.pay_curr_cde"/>  
      <field name="ft_t_ipdf.end_tms"/> 
    </inputFields>  
    <defaultFields/> 
  </occurrence><occurrence table="ft_t_pevp" id="PEVP_CALL_or_SINK" parentId="PEDF_CALL_or_SINK" label="Principal Event Participant(Call/Sink)" autoDelete="false"> 
    <defaultFields> 
      <field name="ft_t_pevp.start_tms" dataType="DATETIME" srcOccurrence="PEDF_CALL_or_SINK" valueOf="ft_t_pedf.start_tms" keepInSync="true"/> 
    </defaultFields>  
    <where> 
      <field name="ft_t_pevp.prt_purp_typ" dataType="STRING" value="SNKFDRED"/> 
    </where>  
    <validationRules> 
      <rule id="Unique_PPDF_Call_or_Sink"> 
        <xPath value="is-unique(%modelPath:PPDF_CALL_or_SINK%, &quot;concat(ppdf.pay_curr_cde,substring((ppdf.start_tms), 1, 10))&quot;)"/>  
        <!--        <xPath value="is-unique(%modelPath:PPDF_CALL_or_SINK%,&quot;substring((ppdf.start_tms), 1,10)&quot;)"/>  -->  
        <errorMessage value="Payment currency and Start Date/Time combination should be unique in Principal Payments of Call/Sink Section"/> 
      </rule> 
    </validationRules> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_CALL_or_SINK" parentId="PEVP_CALL_or_SINK" multiple="true" label="Principal Payment Definition(Call/Sink)" autoDelete="false"> 
    <inputFields> 
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.start_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/> 
    </inputFields>  
    <defaultFields/> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_PUT_or_FACTOR" parentId="PEVP_PUT_or_FACTOR" multiple="true" label="Principal Payment Definition(Factor)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_pedf" id="PEDF_PUT" parentId="BASEISSU" label="Principal Event Defitnition(Put)" autoDelete="false"> 
    <inputFields> 
      <field name="ft_t_pedf.days_mth_bas_typ"/>  
      <field name="ft_t_pedf.days_yr_bas_typ"/>  
      <field name="ft_t_pedf.end_tms"/>  
      <field name="ft_t_pedf.first_py_tms" label="First Payment Date"/>  
      <field name="ft_t_pedf.py_dte_fq_dy_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_sp_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_qty" label="Payable Date Frequency"/>  
      <field name="ft_t_pedf.start_tms"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_pedf.verif_ind" dataType="STRING" value="Y"/>  
      <!--<field name="ft_t_pedf.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>--> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_PUT" parentId="PEVP_PUT" multiple="true" label="Principal Payment Definition(Put)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_NEXTPUT" parentId="PEVP_NEXTPUT" multiple="true" label="Principal Payment Definition(NextPut)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_NXTPARPT" parentId="PEVP_NXTPARPT" multiple="true" label="Principal Payment Definition(NxtParpt)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_PUTPROV" parentId="PEVP_PUTPROV" multiple="true" label="Principal Payment Definition(PutProv)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_PUTSCHED" parentId="PEVP_PUTSCHED" multiple="true" label="Principal Payment Definition(PutSched)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_pedf" id="PEDF_CALLABLE" parentId="BASEISSU" label="Principal Event Defitnition(Call)" autoDelete="false"> 
    <inputFields> 
      <field name="ft_t_pedf.days_mth_bas_typ"/>  
      <field name="ft_t_pedf.days_yr_bas_typ"/>  
      <field name="ft_t_pedf.end_tms"/>  
      <field name="ft_t_pedf.first_py_tms" label="First Payment Date"/>  
      <field name="ft_t_pedf.py_dte_fq_dy_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_sp_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_qty" label="Payable Date Frequency"/>  
      <field name="ft_t_pedf.start_tms"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_pedf.verif_ind" dataType="STRING" value="Y"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_CALLABLE" parentId="PEVP_CALLABLE" multiple="true" label="Principal Payment Definition(Callable)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_pedf" id="PEDF_CALLED" parentId="BASEISSU" label="Principal Event Defitnition(Call)" autoDelete="false"> 
    <inputFields> 
      <field name="ft_t_pedf.days_mth_bas_typ"/>  
      <field name="ft_t_pedf.days_yr_bas_typ"/>  
      <field name="ft_t_pedf.end_tms"/>  
      <field name="ft_t_pedf.first_py_tms" label="First Payment Date"/>  
      <field name="ft_t_pedf.py_dte_fq_dy_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_sp_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_qty" label="Payable Date Frequency"/>  
      <field name="ft_t_pedf.start_tms"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_pedf.verif_ind" dataType="STRING" value="Y"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_CALLED" parentId="PEVP_CALLED" multiple="true" label="Principal Payment Definition(Called)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_pedf" id="PEDF_CALATPAR" parentId="BASEISSU" label="Principal Event Defitnition(Call)" autoDelete="false"> 
    <inputFields> 
      <field name="ft_t_pedf.days_mth_bas_typ"/>  
      <field name="ft_t_pedf.days_yr_bas_typ"/>  
      <field name="ft_t_pedf.end_tms"/>  
      <field name="ft_t_pedf.first_py_tms" label="First Payment Date"/>  
      <field name="ft_t_pedf.py_dte_fq_dy_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_sp_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_qty" label="Payable Date Frequency"/>  
      <field name="ft_t_pedf.start_tms"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_pedf.verif_ind" dataType="STRING" value="Y"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_CALATPAR" parentId="PEVP_CALATPAR" multiple="true" label="Principal Payment Definition(Calatpar)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_pedf" id="PEDF_CALATPRE" parentId="BASEISSU" label="Principal Event Defitnition(Call)" autoDelete="false"> 
    <inputFields> 
      <field name="ft_t_pedf.days_mth_bas_typ"/>  
      <field name="ft_t_pedf.days_yr_bas_typ"/>  
      <field name="ft_t_pedf.end_tms"/>  
      <field name="ft_t_pedf.first_py_tms" label="First Payment Date"/>  
      <field name="ft_t_pedf.py_dte_fq_dy_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_sp_typ"/>  
      <field name="ft_t_pedf.py_dte_fq_qty" label="Payable Date Frequency"/>  
      <field name="ft_t_pedf.start_tms"/> 
    </inputFields>  
    <defaultFields> 
      <field name="ft_t_pedf.verif_ind" dataType="STRING" value="Y"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_ppdf" id="PPDF_CALATPRE" parentId="PEVP_CALATPRE" multiple="true" label="Principal Payment Definition(Calatpre)" autoDelete="false"> 
    <defaultFields/>  
    <inputFields> 
      <field name="ft_t_ppdf.iss_part_rl_typ"/>  
      <field name="ft_t_ppdf.ev_rate_typ"/>  
      <field name="ft_t_ppdf.ev_rate_bas_typ"/>  
      <field name="ft_t_ppdf.ev_crte"/>  
      <field name="ft_t_ppdf.ev_camt"/>  
      <field name="ft_t_ppdf.end_tms"/>  
      <field name="ft_t_ppdf.pay_curr_cde"/>  
      <field name="ft_t_ppdf.start_tms"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_isgp" id="ISGP_UNIV" parentId="BASEISSU" label="Issue Group Participant" multiple="true" dbConstraint="isgpuniv"> 
    <defaultFields> 
      <field name="ft_t_isgp.prt_purp_typ" dataType="STRING" value="MANUAL"/>  
      <field name="ft_t_isgp.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields>  
    <inputFields> 
      <field name="ft_t_isgp.prnt_iss_grp_oid"/> 
    </inputFields> 
  </occurrence><occurrence table="ft_t_cucn" id="CUCN" parentId="BASEISSU"> 
    <defaultFields> 
      <field name="ft_t_cucn.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/> 
    </defaultFields> 
  </occurrence><occurrence table="ft_t_cucf" id="CUCF" parentId="CUCN"> 
    <defaultFields> 
      <field name="ft_t_cucf.start_tms" dataType="DATETIME" valueOfFunction="CURRTMS"/>  
      <field name="ft_t_cucf.instr_id" dataType="STRING" valueOfXPath="/root/issue/issu.instr_id"/> 
    </defaultFields> 
  </occurrence><relations><table name="FT_T_ISLL"><relation relatedTable="FT_T_ISSU" name="isllissu">
            <fromColumns>
                <column name="instr_id"/>
            </fromColumns>
            <toColumns>
                <column name="instr_id"/>
            </toColumns>
            <condition>
                <sql>#FROM_TABLE#.last_chg_tms in (SELECT max(last_chg_tms) FROM ft_t_isll where instr_id = #TO_TABLE#.instr_id)</sql>
            </condition>
        </relation></table><table name="FT_T_RIDF"><relation relatedTable="FT_T_ISSU" name="ridfwarrant">
            <fromColumns>
                <column name="instr_id"/>
            </fromColumns>
            <toColumns>
                <column name="instr_id"/>
            </toColumns>
            <condition>
                <sql>#FROM_TABLE#.rel_typ IN (''WARRANT'',''WRT CALL'',''WRT PUT'')</sql>
            </condition>
        </relation></table><table name="FT_T_RISS"><relation relatedTable="FT_T_RIDF" name="risswarrant">
            <fromColumns>
                <column name="rld_iss_feat_id"/>
            </fromColumns>
            <toColumns>
                <column name="rld_iss_feat_id"/>
            </toColumns>
            <condition>
                <sql>#FROM_TABLE#.iss_part_rl_typ IN (''DELIVER'',''RECEIVE'',''UNDLYING'')</sql>
            </condition>
        </relation></table><table name="FT_T_MKIS"><relation relatedTable="FT_T_ISSU" name="ISSUMKIS">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<condition>
				<sql>(#FROM_TABLE#.prim_trd_mkt_ind=''Y'' or (select count(*) from ft_t_mkis where ft_t_mkis.instr_id=#TO_TABLE#.instr_id and (ft_t_mkis.end_tms is null or ft_t_mkis.end_tms  >= SYSDATE()))=1)</sql>
			</condition>
		</relation></table><table name="FT_T_MIXR"><relation relatedTable="FT_T_MKIS" name="MKISMIXR">
			<fromColumns>
				<column name="MKT_ISS_OID"/>
			</fromColumns>
			<toColumns>
				<column name="MKT_ISS_OID"/>
			</toColumns>
		</relation></table><table name="FT_T_MIXR"><relation relatedTable="FT_T_ISID" name="MIXRISID">
			<fromColumns>
				<column name="ISID_OID"/>
			</fromColumns>
			<toColumns>
				<column name="ISID_OID"/>
			</toColumns>
			<condition>
        <sql>exists (select 1 from FT_T_MIXR mixr where (mixr.end_tms IS NULL or mixr.end_tms  > p_asOfDate) and #TO_TABLE#.ISID_OID=mixr.isid_oid)</sql>
			</condition>
		</relation></table><table name="FT_T_ISGU"><relation relatedTable="FT_T_ISSU" name="ISSUISGU">
            <fromColumns>
                <column name="INSTR_ID"/>
            </fromColumns>
            <toColumns>
                <column name="INSTR_ID"/>
            </toColumns>
            <condition>
                <sql>#FROM_TABLE#.gu_typ =''COUNTRY''</sql>
            </condition>
        </relation></table><table name="FT_T_PEDF"><relation relatedTable="FT_T_ISSU" name="pedffactorissu">
            <fromColumns>
                <column name="instr_id"/>
            </fromColumns>
            <toColumns>
                <column name="instr_id"/>
            </toColumns>
            <condition>
                <sql>#FROM_TABLE#.ev_typ IN (''FACTOR'')</sql>
            </condition>
        </relation></table><table name="FT_T_ISID"><relation relatedTable="FT_T_ISSU" name="ISSUISID">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<condition>
					<sql>not exists (select 1 from ft_t_mixr mixr where (mixr.end_tms is null or mixr.end_tms  > SYSDATE()) and #FROM_TABLE#.ISID_OID=mixr.isid_oid) and #FROM_TABLE#.MKT_OID is null</sql>
				</condition>
		</relation></table><table name="FT_T_ISID"><relation relatedTable="FT_T_ISSU" name="MRKTISID">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<condition>
				<sql>not exists (select 1 from ft_t_mixr mixr where (mixr.end_tms is null or mixr.end_tms  > SYSDATE()) and #FROM_TABLE#.ISID_OID=mixr.isid_oid) and #FROM_TABLE#.MKT_OID is not null</sql>
		</condition>
		</relation></table><table name="FT_T_ISID"><relation relatedTable="FT_T_ISSU" name="MRKTISIDPUB">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<condition>			
				<sql>not exists (select 1 from ft_t_mixr mixr where (mixr.end_tms is null or mixr.end_tms  > SYSDATE()) and #FROM_TABLE#.ISID_OID=mixr.isid_oid) and #FROM_TABLE#.MKT_OID is not null</sql>			
			</condition>
		</relation></table><table name="FT_T_ISCL"><relation relatedTable="FT_T_ISSU" name="SUBTYPE">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<condition>
				<sql>#FROM_TABLE#.indus_cl_set_id in (''TKISSTYP'',''BBSECTYP'',''FTISSTYP'',''ASSETCLS'')</sql>
			</condition>
		</relation></table><table name="FT_T_ISCL"><relation relatedTable="FT_T_ISSU" name="SUBTYPE">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<condition>
				<sql>#FROM_TABLE#.indus_cl_set_id in (''TKISSTYP'',''BBSECTYP'',''FTISSTYP'',''ASSETCLS'')</sql>
			</condition>
		</relation></table><table name="FT_T_RIST"><relation relatedTable="FT_T_ISSU" name="RIST_INSTR">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
		</relation></table><table name="FT_T_LMST"><relation relatedTable="FT_T_ISSU" name="latestlmst">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<condition>
				<sql>#FROM_TABLE#.last_chg_tms = (SELECT MAX (last_chg_tms) FROM ft_t_lmst WHERE ft_t_lmst.instr_id = #TO_TABLE#.instr_id)</sql>
			</condition>
		</relation></table><table name="FT_T_AISR"><relation relatedTable="FT_T_ISSU" name="MyAccountIssueRole">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<condition>
				<sql>#FROM_TABLE#.ACCT_ISSU_RL_TYP is not null</sql>
			</condition>
		</relation></table><table name="FT_T_AISR"><relation relatedTable="FT_T_ISSU" name="MyIssueAccountRole">
			<fromColumns>
				<column name="INSTR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
			</toColumns>
			<!--Commented as AISR.ISSU_ACCT_RL_TYP has been removed (GT 37778)-->
			<!--<condition>
        <sql>#FROM_TABLE#.ISSU_ACCT_RL_TYP is not null</sql>
      </condition>-->
		</relation></table><table name="FT_T_ISRT"><relation relatedTable="FT_T_ISSU" name="RTNG_HIST" checkService="RATING_SERVICE">
			<condition>
				<sql>#FROM_TABLE#.SYS_EFF_END_TMS IS NULL AND (#FROM_TABLE#.INSTR_ID) = (#TO_TABLE#.INSTR_ID)</sql>
			</condition>
		</relation></table><table name="FT_T_MIXR"><relation relatedTable="FT_T_ISID" name="MIXRISIDPUB">
			<fromColumns>
				<column name="ISID_OID"/>
			</fromColumns>
			<toColumns>
				<column name="ISID_OID"/>
			</toColumns>
			<condition>				
				<sql>exists (select 1 from FT_T_MIXR mixr where (mixr.end_tms IS NULL or mixr.end_tms  > SYSDATE()) and #TO_TABLE#.ISID_OID=mixr.isid_oid)</sql>				
			</condition>
		</relation></table><table name="FT_T_MKIS"><relation relatedTable="FT_T_ISPC" name="LATESTPRICE">
			<fromColumns>
				<column name="INSTR_ID"/>
				<column name="MKT_OID"/>
				<column name="PRC_CURR_CDE"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ID"/>
				<column name="MKT_OID"/>
				<column name="PRC_CURR_CDE"/>
			</toColumns>
			<condition>
				<sql>#TO_TABLE#.prc_tms = 
             (select max(prc_tms)
                from ft_t_ispc maxprc
               where maxprc.instr_id = #TO_TABLE#.instr_id
                 and maxprc.mkt_oid = #TO_TABLE#.mkt_oid
                 and maxprc.prc_curr_cde = #TO_TABLE#.prc_curr_cde)</sql>
			</condition>
		</relation></table><table name="FT_T_MUST"><relation relatedTable="FT_T_MKIS" name="mkismust">
            <fromColumns>
                <column name="MKT_ISS_OID"/>
            </fromColumns>
            <toColumns>
                <column name="MKT_ISS_OID"/>
            </toColumns>
        </relation></table><table name="FT_T_ISPC"><relation name="latestclosingprice" relatedTable="FT_T_ISSU">
            <fromColumns>
                <column name="INSTR_ID"/>
            </fromColumns>
            <toColumns>
                <column name="INSTR_ID"/>
            </toColumns>
            <condition>
                <sql>(#FROM_TABLE#.last_chg_tms
                      , #FROM_TABLE#.prc_tms
                      , COALESCE (#FROM_TABLE#.data_src_id, ''999'')
                      , #FROM_TABLE#.prc_srce_typ
                      , #FROM_TABLE#.prc_typ
                      || COALESCE (TRIM (#FROM_TABLE#.addnl_prc_qual_typ), ''999'')) IN
                            (  SELECT   MAX (last_chg_tms)
                                        , MAX (prc_tms)
                                        , COALESCE (data_src_id, ''999'')
                                        , prc_srce_typ
                                        , prc_typ
                                        || COALESCE (TRIM (addnl_prc_qual_typ), ''999'')
                                 FROM   ft_t_ispc ispc1
                                WHERE   instr_id = #FROM_TABLE#.instr_id
                                AND trim(prc_typ) || trim(addnl_prc_qual_typ) IN (''BID2171'',''ASKED2124'',''ASKED1'',''0031'',''0033'',''ASKED3'')      
                             GROUP BY   prc_tms,
                                        data_src_id,
                                        prc_srce_typ,
                                        prc_typ,
                                        addnl_prc_qual_typ,
                                        prc_qt_meth_typ)</sql>
            </condition>
        </relation></table><table name="FT_T_IEDF"><relation relatedTable="FT_T_ISSU" name="issuiedfinterest">
            <fromColumns>
                <column name="instr_id"/>
            </fromColumns>
            <toColumns>
                <column name="instr_id"/>
            </toColumns>
            <condition>
                <sql>#FROM_TABLE#.ev_typ IN (''INTEREST'')</sql>
            </condition>
        </relation></table><table name="FT_T_IEVP"><relation relatedTable="FT_T_IEDF" name="iedfievpestdiv">
            <fromColumns>
                <column name="INC_EV_DEF_ID"/>
            </fromColumns>
            <toColumns>
                <column name="INC_EV_DEF_ID"/>
            </toColumns>
            <condition>
                <sql>#FROM_TABLE#.prt_purp_typ IN (''ESTIMATE'',''DIVIDEND'')</sql>
            </condition>
        </relation></table><table name="FT_T_IPDF"><relation relatedTable="FT_T_IEVP" name="ipdfbasecpi">
            <fromColumns>
                <column name="INC_EV_PRT_ID"/>
            </fromColumns>
            <toColumns>
                <column name="INC_EV_PRT_ID"/>
            </toColumns>
            <condition>
                <sql>#FROM_TABLE#.rate_fixing_base_crte is not null and #FROM_TABLE#.start_tms = (select max(start_tms) from ft_t_ipdf where inc_ev_prt_id=#FROM_TABLE#.inc_ev_prt_id and rate_fixing_base_crte is not null)</sql>
            </condition>
        </relation></table><table name="FT_T_PEVP"><relation relatedTable="FT_T_PEDF" name="pevpfactorissu">
            <fromColumns>
                <column name="prin_ev_def_id"/>
            </fromColumns>
            <toColumns>
                <column name="prin_ev_def_id"/>
            </toColumns>
            <condition>
                <sql>#FROM_TABLE#.prt_purp_typ IN (''FACTOR'')</sql>
            </condition>
        </relation></table><table name="FT_T_PPDF"><relation relatedTable="FT_T_PEVP" name="ppdf_pevp">
            <fromColumns>
                <column name="PRIN_EV_PRT_ID"/>
            </fromColumns>
            <toColumns>
                <column name="PRIN_EV_PRT_ID"/>
            </toColumns>
            <condition>
                <sql>ROWNUM=1</sql>
            </condition>
        </relation></table><table name="FT_T_IRCL"><relation relatedTable="FT_T_ISSU" name="IRCL_ISSU">
			<fromColumns>
				<column name="INSTR_ISSR_ID"/>
			</fromColumns>
			<toColumns>
				<column name="INSTR_ISSR_ID"/>
			</toColumns>
			<condition>
				<sql>(#FROM_TABLE#.instr_id = #TO_TABLE#.instr_id or #FROM_TABLE#.instr_id is null)</sql> 
			</condition>
		</relation></table><table name="FT_T_ISGP"><relation relatedTable="FT_T_ISSU" name="isgpuniv">
			<fromColumns>
				<column name="instr_id"/>
			</fromColumns>
			<toColumns>
				<column name="instr_id"/>
			</toColumns>
			<condition>
				<sql>TRIM(#FROM_TABLE#.PRNT_ISS_GRP_OID) in (SELECT TRIM(ISS_GRP_OID) FROM FT_T_ISGR WHERE GRP_PURP_TYP=''UNIVERSE'')</sql>
			</condition>
		</relation></table></relations></model>' WHERE modl_id ='WARRANT' AND modl_typ = 'ISSU';	
		