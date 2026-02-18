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
			<xsl:for-each select="Param">
                        <xsl:text disable-output-escaping="yes">&lt;RequestData&gt;</xsl:text>
                        <xsl:value-of select="../IDContext"/>,<xsl:value-of select="../Identifier"/>,<xsl:value-of select="../../Requestor"/>,<xsl:value-of select="../Param[@Key!='Header_YELLOWKEY']"/>,<xsl:value-of select="../DataType"/>,<xsl:value-of select="../Vendor"/>,<xsl:value-of select="../TableType"/>,<xsl:value-of select="./@Key"/>,<xsl:value-of select="../Param[@Key='Header_YELLOWKEY']"/>
                        <xsl:text disable-output-escaping="yes">&lt;/RequestData&gt;</xsl:text>
                        <xsl:value-of select="$newline"/>
			   </xsl:for-each>
		</xsl:for-each>
		<xsl:text disable-output-escaping="yes">&lt;/root&gt;</xsl:text>
	</xsl:template>
	<xsl:template match="*/text()[normalize-space()]">
		<xsl:value-of select="normalize-space()"/>
	</xsl:template>
	<xsl:template match="*/text()[not(normalize-space())]"/>
</xsl:stylesheet>