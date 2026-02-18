<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<goldensource-package version="8.4.1.286">
<package-comment/>
<businessobject displayString="cmfSOIStatement" type="com.j2fe.processing.BusinessFeed">
<com.j2fe.processing.BusinessFeed id="0">
<dataSource id="1">
<businessFeeds id="2" type="java.util.HashSet">
<item idref="0" type="com.j2fe.processing.BusinessFeed"/>
</businessFeeds>
<id id="3">MIZ_CUSTOM</id>
</dataSource>
<feedDefinition id="4">db://resource/xml/feeds/Mizuho/cmfSOIStatement.xml</feedDefinition>
<fileDefinitions id="5" type="java.util.ArrayList"/>
<grouping>false</grouping>
<messageTypes id="6" type="java.util.HashSet">
<item id="7" type="com.j2fe.processing.MessageType">
<businessEntity>false</businessEntity>
<businessFeed idref="0"/>
<caputureProcessMessage>false</caputureProcessMessage>
<commitMode>None</commitMode>
<createMarketRealTimeInd id="8">false</createMarketRealTimeInd>
<isKeyStreaming>false</isKeyStreaming>
<isVDDB>false</isVDDB>
<mappingResource id="9">db://resource/mapping/Mizuho/cmfSOIStatement.mdx</mappingResource>
<metaData id="10" type="java.util.HashMap"/>
<name id="11">cmfSOIStatement</name>
<nearRealtimePublishing>false</nearRealtimePublishing>
<nearRealtimePublishingEvents id="12" type="java.util.ArrayList"/>
<publishingEvents id="13" type="java.util.ArrayList"/>
<rollbackOnError>false</rollbackOnError>
<saveVendorDataType>None</saveVendorDataType>
<streetLamp id="14">
<saveInputMessage>ERROR</saveInputMessage>
<saveNotifications>ERROR</saveNotifications>
<saveProcessedMessage>ERROR</saveProcessedMessage>
<saveTranslatedMessage>ERROR</saveTranslatedMessage>
<write>ERROR</write>
</streetLamp>
<syncPublishing>false</syncPublishing>
</item>
</messageTypes>
<name id="15">cmfSOIStatement</name>
</com.j2fe.processing.BusinessFeed>
</businessobject>
</goldensource-package>
