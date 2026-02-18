<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" encoding="UTF-8" indent="yes"/>

    <xsl:template match="node()|@*">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="IDContext/text()[.='BBUNIQUE']">BB_UNIQUE</xsl:template>
    <xsl:template match="IDContext/text()[.='BBGLOBAL']">BB_GLOBAL</xsl:template>
    <xsl:template match="IDContext/text()[.='BB8CHR']">TICKER</xsl:template>

</xsl:stylesheet>
