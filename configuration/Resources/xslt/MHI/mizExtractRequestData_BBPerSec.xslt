<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="text" encoding="UTF-8" indent="yes"/>	

	<xsl:variable name='newline'>
		<xsl:text>&#xa;</xsl:text>
	</xsl:variable>

	<xsl:template match="VendorRequest">
	   <xsl:text disable-output-escaping="yes">&lt;root&gt;</xsl:text>
	   <xsl:value-of select="$newline"/>
	   <xsl:for-each select="Request">
			<xsl:text disable-output-escaping="yes">&lt;RequestData&gt;</xsl:text>
			<xsl:value-of select="IDContext"/>,<xsl:value-of select="Identifier"/>,<xsl:value-of select="../Requestor"/>,<xsl:value-of select="Param[@Key='SOI1']"/>,<xsl:value-of select="Param"/>,<xsl:value-of select="DataType"/>,<xsl:value-of select="Vendor"/>,<xsl:value-of select="TableType"/>,<xsl:value-of select="Param[@Key='Header_YELLOWKEY']"/>
			<xsl:text disable-output-escaping="yes">&lt;/RequestData&gt;</xsl:text>
			<xsl:if test="not(position()=last())">
				<xsl:value-of select="$newline"/>
			</xsl:if>
		</xsl:for-each>
		<xsl:value-of select="$newline"/>
		<xsl:text disable-output-escaping="yes">&lt;/root&gt;</xsl:text>
	</xsl:template>

	<xsl:template match="*/text()[normalize-space()]">
		<xsl:value-of select="normalize-space()"/>
	</xsl:template>

	<xsl:template match="*/text()[not(normalize-space())]"/>

</xsl:stylesheet>