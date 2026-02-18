<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="text"/>
	<xsl:template name="extra-fields"><!-- The list of fields should be added here.
Separated by Newlines -->
STD_SECONDARY_MKT_SETTLEMENT_PER
NACE_SECTOR_CODE
NACE_DIVISION_CODE
NACE_GROUP_CODE
NACE_CLASS_CODE
ID_BB_GLOBAL_COMPANY
ID_BB_GLOBAL_COMPANY_NAME
<xsl:if test="/VendorRequest/Request/RequestType='Mortgage Non Pool' or /VendorRequest/Request/RequestType='Mortgage Non PoolAddn'">
MTG_CALENDAR_CODE
RATEDET_CALENDAR
MTG_CASH_FLOW
MTG_HIST_CPN
MTG_HIST_FACT
MTG_RE_SECUR_COMPOSITION
MTG_TRANCHE_TYP
PAY_RULE
PRPL
CALENDAR_CODE_UNION
ID_CUSIP_ID_NUM
ID_PRPL
NON_EOM
PRE_EURO_CRNCY
SECURITY_NAME
FLOATER_ACC_SCHEDULE
MM_DP_RTG_PROG
OBSRVTN_PERD_ADJSTD_DAYS
OBSRVTN_PERD_ADJSTMNT_HOLDY_CDR
</xsl:if><xsl:comment> end for non pool </xsl:comment><xsl:if test="/VendorRequest/Request/RequestType='MortgagePools' or /VendorRequest/Request/RequestType='MortgagePoolsAddn'">
MTG_TRANCHE_TYP
PRPL
CALENDAR_CODE_UNION
ID_CUSIP_ID_NUM
ID_PRPL
NON_EOM
RATEDET_CALENDAR
MTG_CASH_FLOW
MTG_HIST_CPN
MM_DP_RTG_PROG
PRE_EURO_CRNCY
SECURITY_NAME
FLOATER_ACC_SCHEDULE
MTG_HIST_FACT
DAYS_TO_SETTLE
MIN_DENOMINATION
OBSRVTN_PERD_ADJSTD_DAYS
OBSRVTN_PERD_ADJSTMNT_HOLDY_CDR
</xsl:if><xsl:comment> end for mortgage pool </xsl:comment>
</xsl:template>
<xsl:template name="extra-header-fields">
CLOSINGVALUES=yes
USERNUMBER=3256503
DERIVED=yes
SECID=ISIN
SECMASTER=yes
HISTORICAL=yes</xsl:template>
</xsl:stylesheet>
<!-- Stylus Studio meta-information - (c)1998-2003 Copyright Sonic Software Corporation. All rights reserved.
<metaInformation>
<scenarios/><MapperInfo srcSchemaPath="" srcSchemaRoot="" srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/>
</metaInformation>
-->