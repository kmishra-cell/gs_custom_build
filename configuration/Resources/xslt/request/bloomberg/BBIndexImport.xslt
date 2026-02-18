<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="text"/>
	<xsl:template name="extra-fields"><!-- The list of fields should be added here.
Separated by Newlines -->
SW_SERIES
CURVE_MEMBERS
<!-- New fields for EQuity Index Members -->
INDX_MWEIGHT
ID_BB_SEC_NUM_DES
LONG_COMP_NAME
</xsl:template>
<xsl:template name="extra-header-fields">
<xsl:if test="/VendorRequest/Request/Param[@Key='Header_YELLOWKEY']">
YELLOWKEY=<xsl:value-of select="/VendorRequest/Request/Param[@Key='Header_YELLOWKEY']"/></xsl:if>
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