<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<goldensource-package version="8.4.1.286">
<package-comment/>
<businessobject displayString="ProductMasterAsset" type="com.j2fe.processing.BusinessFeed">
<com.j2fe.processing.BusinessFeed id="0">
<dataSource id="1">
<businessFeeds id="2" type="java.util.HashSet">
<item idref="0" type="com.j2fe.processing.BusinessFeed"/>
</businessFeeds>
<id id="3">MIZ_CUSTOM</id>
</dataSource>
<description id="4">Asset data from ProductMaster system in MHSC</description>
<feedDefinition id="5">com/j2fe/feeds/xml.xml</feedDefinition>
<fileDefinitions id="6" type="java.util.ArrayList"/>
<grouping>false</grouping>
<messageTypes id="7" type="java.util.HashSet">
<item id="8" type="com.j2fe.processing.MessageType">
<applicationName id="9">SECURITIESANDPROD</applicationName>
<businessEntity>false</businessEntity>
<businessFeed idref="0"/>
<caputureProcessMessage>true</caputureProcessMessage>
<commitMode>None</commitMode>
<createMarketRealTimeInd id="10">false</createMarketRealTimeInd>
<isKeyStreaming>false</isKeyStreaming>
<isVDDB>false</isVDDB>
<mappingResource id="11">db://resource/mapping/Mizuho/ProductMasterAsset.mdx</mappingResource>
<metaData id="12" type="java.util.HashMap"/>
<name id="13">PMASSET</name>
<nearRealtimePublishing>false</nearRealtimePublishing>
<nearRealtimePublishingEvents id="14" type="java.util.ArrayList"/>
<publishingEvents id="15" type="java.util.ArrayList"/>
<rollbackOnError>false</rollbackOnError>
<saveVendorDataType>None</saveVendorDataType>
<streetLamp id="16">
<saveInputMessage>ERROR</saveInputMessage>
<saveNotifications>WARNING</saveNotifications>
<saveProcessedMessage>ERROR</saveProcessedMessage>
<saveTranslatedMessage>ERROR</saveTranslatedMessage>
<write>SUCCESS</write>
</streetLamp>
<syncPublishing>false</syncPublishing>
</item>
</messageTypes>
<name id="17">ProductMasterAsset</name>
</com.j2fe.processing.BusinessFeed>
</businessobject>
</goldensource-package>
