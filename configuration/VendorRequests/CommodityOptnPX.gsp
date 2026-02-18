<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<goldensource-package version="8.4.1.288">
<package-comment/>
<businessobject displayString="CommodityOptnPX" type="com.j2fe.connector.RequestType">
<com.j2fe.connector.RequestType id="0">
<dataSource id="1">
<id id="2">BB</id>
<requestTypes id="3" type="java.util.HashSet">
<item idref="0" type="com.j2fe.connector.RequestType"/>
</requestTypes>
</dataSource>
<dataTypes id="4" type="java.util.HashSet">
<item id="5" type="java.lang.String">SECMASTER</item>
</dataTypes>
<externalIssueTypes id="6" type="java.util.HashSet">
<item id="7" type="java.lang.String">Physical index option.</item>
<item id="8" type="java.lang.String">Physical commodity option.</item>
<item id="9" type="java.lang.String">Index Option</item>
<item id="10" type="java.lang.String">Financial index option.</item>
<item id="11" type="java.lang.String">Currency option.</item>
<item id="12" type="java.lang.String">Calendar Spread Option</item>
<item id="13" type="java.lang.String">Index OTC Option</item>
<item id="14" type="java.lang.String">Financial commodity option.</item>
</externalIssueTypes>
<filePattern id="15">gs*.req</filePattern>
<marketSector id="16" type="java.util.HashSet">
<item id="17" type="java.lang.String">Comdty</item>
</marketSector>
<messageType id="18">
<businessEntity>false</businessEntity>
<caputureProcessMessage>false</caputureProcessMessage>
<commitMode>None</commitMode>
<isKeyStreaming>false</isKeyStreaming>
<isVDDB>false</isVDDB>
<name id="19">BBCommodityOptions</name>
<nearRealtimePublishing>false</nearRealtimePublishing>
<rollbackOnError>false</rollbackOnError>
<saveVendorDataType>None</saveVendorDataType>
<syncPublishing>false</syncPublishing>
</messageType>
<requestType id="20">CommodityOptnPX</requestType>
<templateURI id="21">db://resource/xslt/request/bloomberg/BBCommodityOptionsMizuho.xslt</templateURI>
</com.j2fe.connector.RequestType>
</businessobject>
</goldensource-package>
