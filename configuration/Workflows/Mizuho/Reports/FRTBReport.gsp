<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.07">
<package-comment/>
<businessobject displayString="10 - V10-Concat_Query_Corrected" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>true</alwaysPersist>
<clustered>true</clustered>
<comment id="1">V10-Concat_Query_Corrected</comment>
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
<name id="11">Call Subworkflow</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="12">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="13" type="java.util.HashSet">
<item id="14" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="15">["Attachment"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="16">input["Attachment"]</name>
<objectValue id="17" type="java.lang.String">FRTBReport</objectValue>
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
<objectValue id="25" type="java.lang.String">Please find attached your FRTB Issuers of Interest report</objectValue>
<type>CONSTANT</type>
</item>
<item id="26" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="27">["Recipients"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="28">input["Recipients"]</name>
<stringValue id="29">Recipients</stringValue>
<type>VARIABLE</type>
</item>
<item id="30" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="31">["Subject"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="32">input["Subject"]</name>
<objectValue id="33" type="java.lang.String">FRTB Issuers of Interest Report</objectValue>
<type>CONSTANT</type>
</item>
<item id="34" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="35">["sqlSelect"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="36">input["sqlSelect"]</name>
<objectValue id="37" type="java.lang.String">select '"issuerName","Status","clientRef","BBGCompanyId","BBGCompanyName","LEI","RiskUltimateParentName","RiskUltimateParentClientRef","RiskUltimateParentBBGCompanyId","RiskUltimateParentGroupId","CntryOfIncorporation","CntryOfResidence","CntryOfRisk","ProvinceOfRisk","DerivedPartyPolicyRating","BaselIIIssuerRating","BaselIIIssuerRatingStandard","BOEClassification","DerivedGICS","IndustrySector","IndustryGroup","IndustrySubGroup","OfInterest","isZeroRiskWeight","FRTBCategory"'
union all
select concat(
  '"' , IssuerName
  , '","' , Active
  , '","' , IssuerClientRef
  , '","' , BloombergCompanyID
  , '","' , InstitutionName
  , '","' , LEI
  , '","' , UltParentInstitutionName
  , '","' , UltParentClientRef
  , '","' , UltParentBloombergCompanyID
  , '","' , UltParentGroupRef
  , '","' , cntryOfIncorp
  , '","' , cntryOfRes
  , '","' , cntryOfRisk
  , '","' , provnceOfRisk
  , '","' , drvPolicyRtng
  , '","' , bslRtng
  , '","' , bslStdRtng
  , '","' , finsBOECode
  , '","' , finsGICSCode
  , '","' , finsIndustrySector
  , '","' , finsIndustryGrp
  , '","' , finsIndustrySubGrp
  , '","' , IOIMember
  , '","' , finsRsWwgt
  , '","' , finsFRTBCat
  , '"')
from
  (select
    issuer.ISSR_NME IssuerName,
    issuer.DATA_STAT_TYP Active,
    issuerClientRef.ISSR_ID IssuerClientRef,
    issuerFINSbbgCmpyId.FINS_ID BloombergCompanyID,
    issuerFINS.INST_NME InstitutionName,
    finsLEI.FINS_ID LEI,
    RUPFINS.INST_NME UltParentInstitutionName,
    RUPClientRef.issr_id UltParentClientRef,
    RUPbbgCmpyId.FINS_ID UltParentBloombergCompanyID,
    RUPGrpRef.FINS_ID UltParentGroupRef,
    cntryOfIncorp.GU_ID cntryOfIncorp,
    cntryOfRes.GU_ID cntryOfRes,
    cntryOfRisk.GU_ID cntryOfRisk,
    provnceOfRisk.GU_ID provnceOfRisk,
    drvPolicyRtng.rtng_cde drvPolicyRtng,
    bslRtng.rtng_cde bslRtng,
    bslStdRtng.rtng_cde bslStdRtng,
    finsBOE.CL_VALUE finsBOECode,
    finsGICS.CL_VALUE finsGICSCode,
    finsIndustrySector.cl_value finsIndustrySector,
    finsIndustryGrp.cl_value finsIndustryGrp,
    finsIndustrySubGrp.cl_value finsIndustrySubGrp,
    'Y' IOIMember,
    finsRsWwgt.cl_value finsRsWwgt,
    finsFRTBCat.cl_value finsFRTBCat 
  from FT_T_IRGP irgp 
  inner join FT_T_IRGR igroup on igroup.ISSR_GRP_OID=irgp.PRNT_ISSR_GRP_OID and igroup.GRP_NME='MHI Inventory'
  inner join FT_T_ISSR issuer on issuer.INSTR_ISSR_ID = irgp.INSTR_ISSR_ID and issuer.END_TMS is null
  inner join FT_T_FINS issuerFINS on issuerFINS.INST_MNEM = issuer.FINS_INST_MNEM and issuerFINS.END_TMS is null
  left join FT_T_FIID issuerFINSbbgCmpyId on issuerFINS.INST_MNEM = issuerFINSbbgCmpyId.INST_MNEM and issuerFINSbbgCmpyId.END_TMS is null and issuerFINSbbgCmpyId.FINS_ID_CTXT_TYP = 'BBCMPYID'
  left join FT_T_FIID finsLEI on issuerFINS.INST_MNEM = finsLEI.INST_MNEM and finsLEI.END_TMS is null and finsLEI.FINS_ID_CTXT_TYP = 'LEI'
  left join FT_T_IRID issuerClientRef on issuerClientRef.INSTR_ISSR_ID = issuer.INSTR_ISSR_ID and issuerClientRef.END_TMS is null and issuerClientRef.ISSR_ID_CTXT_TYP = 'CLIENTREF'
  left join FT_T_FINS RUPFINS on RUPFINS.INST_MNEM = (select MHI_FINS_UP(issuerFINS.INST_MNEM)) and RUPFINS.END_TMS is null
  left join FT_T_ISSR RUPISSR on RUPISSR.FINS_INST_MNEM = RUPFINS.INST_MNEM and RUPISSR.END_TMS is null
  left join FT_T_IRID RUPClientRef on RUPClientRef.INSTR_ISSR_ID = RUPISSR.INSTR_ISSR_ID and RUPClientRef.END_TMS is null and RUPClientRef.ISSR_ID_CTXT_TYP = 'CLIENTREF'
  left join FT_T_FIID RUPbbgCmpyId on RUPbbgCmpyId.INST_MNEM = RUPFINS.INST_MNEM and RUPbbgCmpyId.END_TMS is null and RUPbbgCmpyId.FINS_ID_CTXT_TYP = 'BBCMPYID'
  left join FT_T_FIID RUPGrpRef on RUPGrpRef.INST_MNEM = RUPFINS.INST_MNEM and RUPGrpRef.END_TMS is null and RUPGrpRef.FINS_ID_CTXT_TYP = 'SECOREFE'
  left join FT_T_FIGU cntryOfIncorp on cntryOfIncorp.INST_MNEM = issuerFINS.INST_MNEM and cntryOfIncorp.END_TMS is null and cntryOfIncorp.FINS_GU_PURP_TYP = 'INCRPRTE' and cntryOfIncorp.GU_TYP = 'COUNTRY'
  left join FT_T_FIGU cntryOfRes on cntryOfRes.INST_MNEM = issuerFINS.INST_MNEM and cntryOfRes.END_TMS is null and cntryOfRes.FINS_GU_PURP_TYP = 'DOMICILE' and cntryOfRes.GU_TYP = 'COUNTRY'
  left join FT_T_FIGU cntryOfRisk on cntryOfRisk.INST_MNEM = issuerFINS.INST_MNEM and cntryOfRisk.END_TMS is null and cntryOfRisk.FINS_GU_PURP_TYP = 'RISK' and cntryOfRisk.GU_TYP = 'COUNTRY'
  left join FT_T_FIGU provnceOfRisk on provnceOfRisk.INST_MNEM = issuerFINS.INST_MNEM and provnceOfRisk.END_TMS is null and provnceOfRisk.FINS_GU_PURP_TYP = 'RISK' and provnceOfRisk.GU_TYP = 'PROVINCE'
  left join FT_T_FIRT drvPolicyRtng on drvPolicyRtng.INST_MNEM = issuerFINS.INST_MNEM and drvPolicyRtng.RTNG_SET_OID ='MIZRTNG3' and drvPolicyRtng.SYS_EFF_END_TMS is null and drvPolicyRtng.END_TMS is null
  left join FT_T_FIRT bslRtng on bslRtng.INST_MNEM = issuerFINS.INST_MNEM and bslRtng.RTNG_SET_OID ='MIZRTNG1' and bslRtng.SYS_EFF_END_TMS is null and bslRtng.END_TMS is null
  left join FT_T_FIRT bslStdRtng on bslStdRtng.INST_MNEM = issuerFINS.INST_MNEM and bslStdRtng.RTNG_SET_OID ='MIZRTNG2' and bslStdRtng.SYS_EFF_END_TMS is null and bslStdRtng.END_TMS is null
  left join FT_T_FICL finsBOE on finsBOE.INST_MNEM =  issuerFINS.INST_MNEM and finsBOE.INDUS_CL_SET_ID = 'BOE' and finsBOE.end_tms is null
  left join FT_T_FICL finsGICS on finsGICS.INST_MNEM =  issuerFINS.INST_MNEM and finsGICS.INDUS_CL_SET_ID = 'GICS' and finsGICS.end_tms is null
  left join ft_T_FICL finsIndustrySector on finsIndustrySector.INST_MNEM = issuerFINS.INST_MNEM and finsIndustrySector.end_tms is null and finsIndustrySector.INDUS_CL_SET_ID =  'BBINDSEC'
  left join ft_T_FICL finsIndustryGrp on finsIndustryGrp.INST_MNEM = issuerFINS.INST_MNEM and finsIndustryGrp.end_tms is null and finsIndustryGrp.INDUS_CL_SET_ID =  'BBINDGRP'
  left join ft_T_FICL finsIndustrySubGrp on finsIndustrySubGrp.INST_MNEM = issuerFINS.INST_MNEM and finsIndustrySubGrp.end_tms is null and finsIndustrySubGrp.INDUS_CL_SET_ID =  'BBINDSGR'
  left join FT_T_FICL finsFRTBCat on finsFRTBCat.INST_MNEM =  issuerFINS.INST_MNEM and finsFRTBCat.INDUS_CL_SET_ID    ='FRTBCATG' and finsFRTBCat.end_tms is null
  left join FT_T_FICL finsRsWwgt on finsRsWwgt.INST_MNEM =  issuerFINS.INST_MNEM  and finsRsWwgt.INDUS_CL_SET_ID  ='RISKWGHT' and finsRsWwgt.END_TMS is null
  where 1=1
  and irgp.PRT_PURP_TYP='INTEREST' and irgp.END_TMS is null and irgp.START_TMS &gt; DATE_TRUNC('day', sysdate() - INTERVAL '5 days')
  --and issuer.INSTR_ISSR_ID in (select INSTR_ISSR_ID from FT_T_IRGP where START_TMS &gt; sysdate - 360)
  and (cntryOfIncorp.GU_ID in ('AT','BE','BG','HR','CY','CZ','DK','EE','FI','FR','DE','GR','HU','IS','IE','IT','LV','LI','LT','LU','MT','NL','NO','PL','PT','RO','SK','SI','ES','SE','GB')
        --or cntryOfRes.GU_ID in ('AT','BE','BG','HR','CY','CZ','DK','EE','FI','FR','DE','GR','HU','IS','IE','IT','LV','LI','LT','LU','MT','NL','NO','PL','PT','RO','SK','SI','ES','SE','GB')
        --or cntryOfRisk.GU_ID in ('AT','BE','BG','HR','CY','CZ','DK','EE','FI','FR','DE','GR','HU','IS','IE','IT','LV','LI','LT','LU','MT','NL','NO','PL','PT','RO','SK','SI','ES','SE','GB')
      )
  and finsBOE.CL_VALUE in ('2122400120','2202400500','2322400400','3200900730','3201200730','3201300730','3202300730','3202400730','3205100730','4312400500','4319500510','4324700730','4332400120',
                            '4420900730','4421200730','4421300730','4422300730','4422400730','4425100730','4323600730','4323300730','4220000600','4323800730')                                                                                                                                     
  and finsIndustrySubGrp.cl_value in ('Energy-Alternate Sources',     'Electric-Integrated',        'Sovereign Agency',       'Non-hazardous Waste Disp',
                                  'Rental Auto/Equipment',        'Machinery-General Indust',   'Water',                  'Bicycle Manufacturing',
                                  'Human Resources',              'Auto/Trk Prts&amp;Equip-Orig',   'Industrial Gases',       'Aerospace/Defense-Equip',
                                  'Filtration/Separat Prod',      'Building-Maint&amp;Service',     'Auto-Cars/Light Trucks', 'Machinery-Constr&amp;Mining',
                                  'Sovereign',                    'Municipal-County',           'Aerospace/Defense',      'Recycling',
                                  'Gas-Transportation',           'Electric-Generation',        'Machinery-Farm',         'Electric-Distribution',
                                  'Travel Services',              'Gas-Distribution',           'Municipal-City',         'Electric-Transmission',
                                  'Municipal-Local Auth',         'Bldg Prod-Air&amp;Heating',      'Auto/Trk Prts&amp;Equip-Repl','Recreational Vehicles',
                                  'Regional Agencies',            'Regional Authority',         'Security Services',      'Machinery-Therml Process',
                                  'Engines-Internal Combust',     'Machinery-Print Trade',      'Machinery-Pumps',        'Independ Power Producer',
                                  'Machinery-Material Handl',     'Water Treatment Systems',    'Oil Field Mach&amp;Equip',   'Shipbuilding',
                                  'Auto-Med&amp;Heavy Duty Trks',     'Mach Tools&amp;Rel Products',    'Protection-Safety',      'Finance-Mtge Loan/Banker',
                                  'Public Thoroughfares',         'Winding-up Agency',          'Special Purpose Banks',      'Regional Banks-Non US')
  order by issuer.ISSR_NME) as t1</objectValue>
<type>CONSTANT</type>
</item>
<item id="38" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="39">name</name>
<stringValue id="40">EmailExcelReport</stringValue>
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
<name id="46">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="47">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="48" type="java.util.HashSet"/>
<targets id="49" type="java.util.HashSet">
<item idref="42" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="9"/>
</item>
</sources>
<targets id="50" type="java.util.HashSet">
<item idref="7" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="2"/>
</item>
</sources>
<targets id="51" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="52">Mizuho/Reports</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="53">user1</lastChangeUser>
<lastUpdate id="54">2025-12-01T08:09:54.000+0000</lastUpdate>
<name id="55">FRTBReport</name>
<nodes id="56" type="java.util.HashSet">
<item idref="9" type="com.j2fe.workflow.definition.Node"/>
<item idref="44" type="com.j2fe.workflow.definition.Node"/>
<item idref="2" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>true</optimize>
<parameter id="57" type="java.util.HashMap">
<entry>
<key id="58" type="java.lang.String">CopyIn</key>
<value id="59" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="60">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="61">Multiple addresses separated by ;</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="62" type="java.lang.String">Recipients</key>
<value id="63" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="64">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="65">Multiple addresses separated by ;</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
</parameter>
<permissions id="66" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>false</purgeAtEnd>
<retries>0</retries>
<startNode idref="44"/>
<status>RELEASED</status>
<variables id="67" type="java.util.HashMap">
<entry>
<key id="68" type="java.lang.String">CopyIn</key>
<value id="69" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="70">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="71">Multiple addresses separated by ;</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="72" type="java.lang.String">Recipients</key>
<value id="73" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="74">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="75">Multiple addresses separated by ;</description>
<persistent>false</persistent>
</value>
</entry>
</variables>
<version>10</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
