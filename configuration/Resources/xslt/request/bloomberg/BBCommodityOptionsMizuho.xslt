<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:import href="db://resource/xslt/request/bloomberg/BBCommodityOptionsImport.xslt"/>
	<xsl:param name="Firmname" select="'Please specify the firmname in the configuration of the service'"></xsl:param>
	<xsl:output method="text"/>
	<xsl:template match="/VendorRequest">START-OF-FILE
FIRMNAME=<xsl:value-of select="$Firmname"/>
DATEFORMAT=yyyymmdd
PROGRAMNAME=getdata<xsl:if test="/VendorRequest/Request/Param[@Key='DATERANGE']">
DATERANGE=<xsl:value-of select="/VendorRequest/Request/Param[@Key='DATERANGE']"/></xsl:if>
		<xsl:if test="/VendorRequest/Request/Param[@Key='ACTIONS']">ACTIONS=<xsl:value-of select="/VendorRequest/Request/Param[@Key='ACTIONS']"/></xsl:if>
		<xsl:if test="/VendorRequest/Request/Param[@Key='ACTIONS_DATE']">ACTIONS_DATE=<xsl:value-of select="/VendorRequest/Request/Param[@Key='ACTIONS_DATE']"/></xsl:if>
<xsl:if test="/VendorRequest/ProgramFlag/text()">
PROGRAMFLAG=<xsl:value-of select="/VendorRequest/ProgramFlag/text()"/></xsl:if>
<xsl:if test="/VendorRequest/DiffFlag/text()">
DIFFFLAG=<xsl:value-of select="/VendorRequest/DiffFlag/text()"/></xsl:if>
<xsl:if test="/VendorRequest/Request/Param[@Key='Header_YELLOWKEY']">
YELLOWKEY=<xsl:value-of select="/VendorRequest/Request/Param[@Key='Header_YELLOWKEY']"/></xsl:if>
<xsl:if test="/VendorRequest/RunDate/text()">
RUNDATE=<xsl:value-of select="/VendorRequest/RunDate/text()"/></xsl:if>
<xsl:if test="/VendorRequest/Time/text()">
TIME=<xsl:value-of select="/VendorRequest/Time/text()"/></xsl:if>
<xsl:if test="/VendorRequest/ReplyFileName/text()">
REPLYFILENAME=<xsl:value-of select="/VendorRequest/ReplyFileName/text()"/></xsl:if>
		<xsl:call-template name="extra-header-fields"/>

START-OF-FIELDS
#BBRequestReplyFile
TICKER
NAME
ID_MIC_PRIM_EXCH
UNDERLYING_CUSIP
OPT_PUT_CALL
OPT_UNDL_PX
OPT_STRIKE_PX
PX_BID
PX_MID
PX_ASK
PX_LAST
PX_OPEN
PX_HIGH
PX_LOW
PX_VOLUME
OPT_OPEN_INT
OPT_PX
SETTLE_DT
MARKET_SECTOR_DES
SECURITY_TYP
COUNTRY_ISO
EXCH_CODE
OPT_UNDL_TICKER
OPT_EXPIRE_DT
OPT_EXER_TYP
OPT_UNDL_CRNCY
OPT_UNDL_ISIN
OPT_FIRST_TRADE_DT
OPT_TICK_VAL
HIGH_52WEEK
LOW_52WEEK
HIGH_DT_52WEEK
LOW_DT_52WEEK
PX_EVAL
LAST_UPDATE
LAST_UPDATE_DT
ID_BB_UNIQUE
ID_BB_COMPANY
ID_BB_SECURITY
ID_ISIN
CRNCY
PRICING_SOURCE
CNTRY_ISSUE_ISO
LONG_COMP_NAME
CASH_SETTLED
OPT_CONT_SIZE_REAL
FUTURES_CATEGORY
PX_SETTLE_LAST_DT
PX_SETTLE
UNDL_ID_BB_UNIQUE
OPT_CRNCY_FOREIGN
FUT_PX_SESSION
SECURITY_DES
FUT_TICK_SIZE
UNIQUE_ID_FUT_OPT
LAST_TRADEABLE_DT
FUT_VAL_PT
QUOTED_CRNCY
OPTION_ROOT_TICKER
ALT_INSTRUMENT_ID
OCC_SYMBOL
OPRA_SYMBOL
ID_BB_GLOBAL
ID_EXCH_SYMBOL
ID_FULL_EXCHANGE_SYMBOL
PX_SCALING_FACTOR
ID_BB_SEC_NUM_DES
FEED_SOURCE
COMPOSITE_ID_BB_GLOBAL
UNDERLYING_ID_BB_GLOBAL
OPEN_INT_DATE
OPEN_INT_CHANGE
CDR_SETTLE_CODE
FEED_INSTRUMENT_IDENTIFIER
FUT_TRADING_UNITS
FUT_TRADING_HRS
FUT_MONTH_YR<xsl:call-template name="extra-fields"/>
END-OF-FIELDS

START-OF-DATA
<xsl:apply-templates select="Request"/>END-OF-DATA
END-OF-FILE</xsl:template>
	<xsl:template match="Request">#Identifier=<xsl:value-of select="Identifier"/>|<xsl:for-each select="OID"><xsl:value-of select="text()"/><xsl:if test="position()!=last()"><xsl:text>,</xsl:text></xsl:if></xsl:for-each>|<xsl:for-each select="MSGTYP"><xsl:value-of select="text()"/><xsl:if test="position()!=last()"><xsl:text>,</xsl:text></xsl:if></xsl:for-each><xsl:text>
</xsl:text>
		<xsl:value-of select="Identifier"/>
		<xsl:text> </xsl:text>
		<xsl:if test="Param[@Key='Header_YELLOWKEY']"><xsl:value-of select="Param[@Key='Header_YELLOWKEY']"/><xsl:text> </xsl:text></xsl:if>
		<xsl:if test="Param[@Key='Exchange']">
			<xsl:value-of select="Param[@Key='Exchange']"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="Param[@Key='MarketSector']">
			<xsl:value-of select="Param[@Key='MarketSector']"/>
			<xsl:text> </xsl:text>
		</xsl:if>| <xsl:value-of select="IDContext"/><xsl:text>
</xsl:text></xsl:template>
</xsl:stylesheet>