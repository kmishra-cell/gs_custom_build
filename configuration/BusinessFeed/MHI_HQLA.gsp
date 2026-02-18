<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<goldensource-package version="8.4.1.201REL">
<package-comment/>
<businessobject displayString="MHI_HQLA" type="com.j2fe.processing.BusinessFeed">
<com.j2fe.processing.BusinessFeed id="0">
<dataSource id="1">
<businessFeeds id="2" type="java.util.HashSet">
<item idref="0" type="com.j2fe.processing.BusinessFeed"/>
</businessFeeds>
<id id="3">MIZ_CUSTOM</id>
</dataSource>
<feedDefinition id="4">db://resource/xml/feeds/bloomberg/getdata.xml</feedDefinition>
<fileDefinitions id="5" type="java.util.ArrayList">
<item id="6" type="com.j2fe.processing.FileDefinition">
<file id="7">ISIN_HQLA*.out</file>
<group id="8">0</group>
<messageType id="9">
<applicationName id="10">SECURITIESANDPROD</applicationName>
<businessEntity>false</businessEntity>
<businessFeed idref="0"/>
<caputureProcessMessage>true</caputureProcessMessage>
<commitMode>None</commitMode>
<createMarketRealTimeInd id="11">false</createMarketRealTimeInd>
<isKeyStreaming>true</isKeyStreaming>
<isVDDB>false</isVDDB>
<mappingResource id="12">db://resource/mapping/Mizuho/BBXT_HQLA_CTSM.mdx</mappingResource>
<metaData id="13" type="java.util.HashMap"/>
<name id="14">MHI_HQLA</name>
<nearRealtimePublishing>false</nearRealtimePublishing>
<nearRealtimePublishingEvents id="15" type="java.util.ArrayList"/>
<publishingEvents id="16" type="java.util.ArrayList"/>
<rollbackOnError>false</rollbackOnError>
<saveVendorDataType>All</saveVendorDataType>
<streetLamp id="17">
<saveInputMessage>SUCCESS</saveInputMessage>
<saveNotifications>SUCCESS</saveNotifications>
<saveProcessedMessage>SUCCESS</saveProcessedMessage>
<saveTranslatedMessage>SUCCESS</saveTranslatedMessage>
<write>SUCCESS</write>
</streetLamp>
<syncPublishing>false</syncPublishing>
</messageType>
</item>
</fileDefinitions>
<grouping>false</grouping>
<messageTypes id="18" type="java.util.HashSet">
<item idref="9" type="com.j2fe.processing.MessageType"/>
</messageTypes>
<name id="19">MHI_HQLA</name>
</com.j2fe.processing.BusinessFeed>
</businessobject>
</goldensource-package>
