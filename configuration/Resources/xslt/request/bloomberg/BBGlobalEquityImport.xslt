<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="text"/>
	<xsl:template name="extra-fields"><!-- The list of fields should be added here.
Separated by Newlines -->
<xsl:if test="/VendorRequest/Request/RequestType='Equity'">
EQY_INIT_PO_SH_OFFER
ADR_SH_OUT
EQY_DVD_HIST_GROSS
DES_NOTES
PRPL
CDS_SPREAD_TICKER_10Y
CDS_SPREAD_TICKER_1Y
CDS_SPREAD_TICKER_2Y
CDS_SPREAD_TICKER_3Y
CDS_SPREAD_TICKER_4Y
CDS_SPREAD_TICKER_5Y
CDS_SPREAD_TICKER_6M
CDS_SPREAD_TICKER_7Y
ID_CUSIP_ID_NUM
ID_PRPL
LISTED_MIC
RTG_JCR_SENIOR_DEBT
RTG_JCR_SEN_RTG_DT
DVD_HIST_ALL
PRE_EURO_CRNCY
SECURITY_NAME
INDEX_LIST
FUND_ASSET_CLASS_FOCUS
NACE_SECTOR_CODE
NACE_DIVISION_CODE
NACE_GROUP_CODE
NACE_CLASS_CODE
SZSE_SEHK_CONN_ASSC_FIGI
SZSE_SEHK_CONN_ASSC_COMP_FIGI
CUR_MKT_CAP
</xsl:if>
</xsl:template>
<xsl:template name="extra-header-fields">
CLOSINGVALUES=yes
DERIVED=yes
SECID=ISIN
SECMASTER=yes</xsl:template>
</xsl:stylesheet>
<!-- Stylus Studio meta-information - (c)1998-2003 Copyright Sonic Software Corporation. All rights reserved.
<metaInformation>
<scenarios/><MapperInfo srcSchemaPath="" srcSchemaRoot="" srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/>
</metaInformation>
-->
