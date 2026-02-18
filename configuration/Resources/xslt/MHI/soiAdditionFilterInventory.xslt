<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" encoding="UTF-8" indent="yes"/>
	<!--<xsl:param name="xyz" select="'MHI MX inventory'"/>-->
	<xsl:param name="filterSoiGroup" select="'MHI MX Inventory'"/>
	<xsl:template match="cmfSOIAdditionCollection">
		<xsl:element name="cmfSOIAdditionCollection">
			<!--<xsl:for-each select="cmfSOIAddition/instrumentId[not(.=preceding::*)]">-->
			<xsl:for-each select="cmfSOIAddition/instrumentId">
				<xsl:if test="../securityOfInterestIds/securityOfInterestId=$filterSoiGroup">
					<xsl:variable name="saveInst">
						<xsl:value-of select="."/>
					</xsl:variable>
					<xsl:variable name="saveInstScheme">
						<xsl:value-of select="./@instrumentIdScheme"/>
					</xsl:variable>
					<xsl:variable name="saveSourceSystemId">
						<xsl:value-of select="../sourceSystemId"/>
					</xsl:variable>
					<xsl:element name="cmfSOIAddition">
						<xsl:element name="instrumentId">
							<xsl:attribute name="instrumentIdScheme">
								<xsl:value-of select="$saveInstScheme"/>
							</xsl:attribute>
							<xsl:value-of select="$saveInst"/>
						</xsl:element>
						<xsl:if test="../exchangeId/text()">
							<xsl:element name="exchangeId">
								<xsl:attribute name="exchangeIdScheme">
									<xsl:value-of select="../exchangeId/@exchangeIdScheme"/>
								</xsl:attribute>
								<xsl:value-of select="../exchangeId"/>
							</xsl:element>
						</xsl:if>
						<xsl:if test="../yellowKey">
							<xsl:element name="yellowKey">
								<xsl:value-of select="../yellowKey"/>
							</xsl:element>
						</xsl:if>
						<xsl:element name="sourceSystemId">
							<xsl:value-of select="$saveSourceSystemId"/>
						</xsl:element>
						<xsl:for-each select="/cmfSOIAdditionCollection/cmfSOIAddition/instrumentId[text()=$saveInst]">
							<!--<xsl:element name="securityOfInterestId">-->
							<xsl:for-each select="../securityOfInterestIds/securityOfInterestId">
								<xsl:if test=".=$filterSoiGroup">
									<xsl:element name="securityOfInterestIds">
										<xsl:variable name="thisSecurityOfInterestId">
											<xsl:value-of select="."/>
										</xsl:variable>
										<xsl:variable name="thisSecurityOfInterestIdScheme">
											<xsl:value-of select="./@securityOfInterestIdScheme"/>
										</xsl:variable>
										<xsl:element name="securityOfInterestId">
											<xsl:attribute name="securityOfInterestIdScheme">
												<xsl:value-of select="$thisSecurityOfInterestIdScheme"/>
											</xsl:attribute>
											<xsl:value-of select="$thisSecurityOfInterestId"/>
										</xsl:element>
									</xsl:element>
								</xsl:if>
							</xsl:for-each>
							<!--</xsl:element>-->
						</xsl:for-each>
						<xsl:choose>
							<xsl:when test="../alternateId">
								<xsl:variable name="thisAltInstrumentId">
									<xsl:value-of select="../alternateId"/>
								</xsl:variable>
								<xsl:variable name="thisAltInstrumentIdScheme">
									<xsl:value-of select="../alternateId/@instrumentIdScheme"/>
								</xsl:variable>
								<xsl:if test="$saveInst!=$thisAltInstrumentId">
								<xsl:element name="alternateId">
									<xsl:attribute name="instrumentIdScheme">
										<xsl:value-of select="$thisAltInstrumentIdScheme"/>
									</xsl:attribute>
									<xsl:value-of select="$thisAltInstrumentId"/>
								</xsl:element>
								</xsl:if>
							</xsl:when>
						</xsl:choose>
					</xsl:element>
				</xsl:if>
			</xsl:for-each>
		</xsl:element>
	</xsl:template>
</xsl:stylesheet>