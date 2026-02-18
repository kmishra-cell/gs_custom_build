<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.04">
<package-comment>TPS-1.gsp</package-comment>
<businessobject displayString="TPS-1" type="com.j2fe.config.ContainerConfig">
<com.j2fe.config.ContainerConfig id="0">
<configValues id="1">
<positionsConfig id="2">
<IADIACRetentionDays>0</IADIACRetentionDays>
<IAExcludeATEVIndicator>true</IAExcludeATEVIndicator>
<ILOGEngineCount>8</ILOGEngineCount>
<ILOGRuleDir id="3">$INSTALL_ROOT/rulefile</ILOGRuleDir>
<SRILOGRuleExtensionClass id="4"/>
<createMissingDS>false</createMissingDS>
<deltaSnapArchiveCount>0</deltaSnapArchiveCount>
<enableACAHSuppression>false</enableACAHSuppression>
<enableAnticipated>true</enableAnticipated>
<enableBalanceAgent>false</enableBalanceAgent>
<enableCrossRateBasis>false</enableCrossRateBasis>
<enableDeltaSnapshot>true</enableDeltaSnapshot>
<enableEncumLookup>true</enableEncumLookup>
<enableExtendedKeys>false</enableExtendedKeys>
<enableFastpath>false</enableFastpath>
<enableHistoryAgent>false</enableHistoryAgent>
<enableLockSubsequentEvents>true</enableLockSubsequentEvents>
<enableSummaryAgent>false</enableSummaryAgent>
<enableTransactionLog>true</enableTransactionLog>
<enableValuations>false</enableValuations>
<executeILogRule>false</executeILogRule>
<lockType>A</lockType>
<processingLocationGroup>Disabled</processingLocationGroup>
<skipSevtEV>PART</skipSevtEV>
<suppressZeroJournals>true</suppressZeroJournals>
</positionsConfig>
<referenceConfig id="5">
<VTTRMode>false</VTTRMode>
<cacheTableObjectResults id="6">FT_T_MKID;FT_T_ISID;FT_T_GUNT;FT_T_INCL;FT_T_ISSU</cacheTableObjectResults>
<cacheTableObjects>true</cacheTableObjects>
<completeOnly>false</completeOnly>
<enableAuditTrail>false</enableAuditTrail>
<enableChangeApproval>false</enableChangeApproval>
<enableConditionalCompleteness>false</enableConditionalCompleteness>
<enableDefinitionOfEOI>false</enableDefinitionOfEOI>
<enableDeprecatedChangeApprovalLogic>false</enableDeprecatedChangeApprovalLogic>
<enableImplicitDelete>false</enableImplicitDelete>
<enableInternalDomainValueCheck>true</enableInternalDomainValueCheck>
<enableModel>true</enableModel>
<enableVSH>true</enableVSH>
<enableVerboseLineage>false</enableVerboseLineage>
<extendedInternalDomainValueCheck>true</extendedInternalDomainValueCheck>
<normalLockExpiryDays id="7">0</normalLockExpiryDays>
<perpetualLockExpiryDays idref="7"/>
<ruleDlls id="8">GenericRules;CamsRules;BenchmarkRules;SRJavaRules;DataWarehouseRules</ruleDlls>
<tableDlls id="9">DynamicTO</tableDlls>
<useChangeApprPostAuthorization>false</useChangeApprPostAuthorization>
<useSubscriptionNotification>false</useSubscriptionNotification>
<useTimeSeries>true</useTimeSeries>
</referenceConfig>
<taskDirectorConfig id="10">
<preSelectAccountsByBalanceFilter>false</preSelectAccountsByBalanceFilter>
</taskDirectorConfig>
</configValues>
<lastChangeUser id="11">user1</lastChangeUser>
<lastUpdate id="12">2025-08-06T08:35:50.000+0100</lastUpdate>
<name id="13">TPS-1</name>
</com.j2fe.config.ContainerConfig>
</businessobject>
</goldensource-package>
