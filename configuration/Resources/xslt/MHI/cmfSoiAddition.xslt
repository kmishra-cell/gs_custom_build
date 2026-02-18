<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/">
		<xsl:element name="VendorRequest">
			<xsl:variable name="UserId">
						<xsl:value-of select="/cmfSOIAdditionCollection/cmfSOIAddition[1]/sourceSystemId"/>
			</xsl:variable>
			<xsl:element name="User">
				<xsl:value-of select="$UserId"/>
			</xsl:element>
			<xsl:element name="Requestor">
				<xsl:value-of select="$UserId"/>
			</xsl:element>
			
			<xsl:for-each select="/cmfSOIAdditionCollection/cmfSOIAddition">
				<xsl:element name="Request">
					<xsl:element name="DataType">SECMASTER</xsl:element>
					<xsl:element name="Vendor">BB</xsl:element>
					<xsl:element name="TableType">ISSU</xsl:element>
					<xsl:element name="Identifier"><xsl:value-of select="./instrumentId"/></xsl:element>
					<xsl:element name="IDContext"><xsl:value-of select="substring-after(./instrumentId/@instrumentIdScheme,'mizuho:')"/>
					</xsl:element>
					<xsl:if test="./alternateId/text()">
						<xsl:element name="UserRequestID">
							<xsl:value-of select="concat(concat(concat('cmfSOIAddition,',./alternateId),','),substring-after(./alternateId/@instrumentIdScheme,'mizuho:'))"/>
						</xsl:element>
					</xsl:if>
					<xsl:if test="./yellowKey/text()">
						<xsl:element name="Param">
							<xsl:attribute name="Key">Header_YELLOWKEY</xsl:attribute>
							<xsl:value-of select="./yellowKey"/>
						</xsl:element>
					</xsl:if>
					<xsl:if test="./exchangeId/text()">
						<xsl:element name="Param">
							<xsl:attribute name="Key">Exchange</xsl:attribute>
							<xsl:value-of select="./exchangeId"/>
						</xsl:element>
					</xsl:if>
					<xsl:for-each select="./securityOfInterestIds/securityOfInterestId">
						<xsl:element name="Param">
							<xsl:attribute name="Key"><xsl:value-of select="concat('SOI',position())"/></xsl:attribute>
							<xsl:value-of select="."/>
						</xsl:element>
					</xsl:for-each>
				</xsl:element>
			</xsl:for-each>
		</xsl:element>
	</xsl:template>
</xsl:stylesheet>