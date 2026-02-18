<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="text"/>
	<xsl:template name="extra-fields"><!-- The list of fields should be added here.
Separated by Newlines -->
<xsl:if test="/VendorRequest/Request/RequestType='Municipals'">
CALL_SCHEDULE
DES_CASH_FLOW
FACTOR_SCHEDULE
FLOATER_ACC_SCHEDULE
MUNI_RECENT_REDEMP_HIST
PRPL
PUT_SCHEDULE
SINK_SCHEDULE
CALL_FREQ
ID_CUSIP_ID_NUM
PUT_FREQ
PRE_EURO_CRNCY
SECURITY_NAME
NOTES_CONTAIN_CVT_TERMS
FLOATER_ACC_SCHEDULE
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