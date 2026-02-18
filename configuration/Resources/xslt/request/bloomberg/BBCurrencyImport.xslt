<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="text"/>
	<xsl:template name="extra-fields"><!-- The list of fields should be added here.
Separated by Newlines -->
PRPL
ID_CUSIP_ID_NUM
PRE_EURO_CRNCY
SECURITY_NAME
REAL_PRIMARY_RO_ISIN
NACE_SECTOR_CODE
NACE_DIVISION_CODE
NACE_GROUP_CODE
NACE_CLASS_CODE
ID_BB_GLOBAL_COMPANY
ID_BB_GLOBAL_COMPANY_NAME
</xsl:template>
<xsl:template name="extra-header-fields">
CLOSINGVALUES=yes
DERIVED=yes
SECMASTER=yes</xsl:template>
</xsl:stylesheet>
