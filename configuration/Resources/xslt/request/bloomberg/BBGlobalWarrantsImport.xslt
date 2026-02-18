<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="text"/>
	<xsl:template name="extra-fields"><!-- The list of fields should be added here.
Separated by Newlines -->
<xsl:if test="/VendorRequest/Request/RequestType='Warrants'">
PRE_EURO_CRNCY
SECURITY_NAME
WRT_PAR_AMT
WRT_SETTLE_CRNCY
WARRANT_CHAIN
NACE_SECTOR_CODE
NACE_DIVISION_CODE
NACE_GROUP_CODE
NACE_CLASS_CODE
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