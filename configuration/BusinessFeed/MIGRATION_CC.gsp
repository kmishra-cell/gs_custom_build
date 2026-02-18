<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<goldensource-package version="8.4.1.175REL">
<package-comment/>
<businessobject displayString="MIGRATION_CC" type="com.j2fe.processing.BusinessFeed">
<com.j2fe.processing.BusinessFeed id="0">
<dataSource id="1">
<businessFeeds id="2" type="java.util.HashSet">
<item idref="0" type="com.j2fe.processing.BusinessFeed"/>
</businessFeeds>
<id id="3">MIZ_CUSTOM</id>
</dataSource>
<feedDefinition id="4">db://resource/xml/feeds/select.xml</feedDefinition>
<fileDefinitions id="5" type="java.util.ArrayList"/>
<grouping>false</grouping>
<messageTypes id="6" type="java.util.HashSet">
<item id="7" type="com.j2fe.processing.MessageType">
<businessEntity>false</businessEntity>
<businessFeed idref="0"/>
<caputureProcessMessage>true</caputureProcessMessage>
<commitMode>None</commitMode>
<createMarketRealTimeInd id="8">false</createMarketRealTimeInd>
<isKeyStreaming>true</isKeyStreaming>
<isVDDB>false</isVDDB>
<mappingResource id="9">db://resource/mapping/Migration/MigrationRatings.mdx</mappingResource>
<metaData id="10" type="java.util.HashMap"/>
<name id="11">Migration_Ratings</name>
<nearRealtimePublishing>false</nearRealtimePublishing>
<nearRealtimePublishingEvents id="12" type="java.util.ArrayList"/>
<publishingEvents id="13" type="java.util.ArrayList"/>
<rollbackOnError>false</rollbackOnError>
<saveVendorDataType>None</saveVendorDataType>
<streetLamp id="14">
<saveInputMessage>ERROR</saveInputMessage>
<saveNotifications>WARNING</saveNotifications>
<saveProcessedMessage>ERROR</saveProcessedMessage>
<saveTranslatedMessage>FATAL</saveTranslatedMessage>
<write>SUCCESS</write>
</streetLamp>
<syncPublishing>false</syncPublishing>
</item>
<item id="15" type="com.j2fe.processing.MessageType">
<applicationName id="16">SECURITIESANDPROD</applicationName>
<businessEntity>false</businessEntity>
<businessFeed idref="0"/>
<caputureProcessMessage>false</caputureProcessMessage>
<commitMode>None</commitMode>
<createMarketRealTimeInd idref="8"/>
<isKeyStreaming>true</isKeyStreaming>
<isVDDB>false</isVDDB>
<mappingResource id="17">db://resource/mapping/Migration/Migration.mdx</mappingResource>
<metaData id="18" type="java.util.HashMap"/>
<name id="19">MIGRATION_CC</name>
<nearRealtimePublishing>false</nearRealtimePublishing>
<nearRealtimePublishingEvents id="20" type="java.util.ArrayList"/>
<publishingEvents id="21" type="java.util.ArrayList"/>
<rollbackOnError>false</rollbackOnError>
<saveVendorDataType>None</saveVendorDataType>
<streetLamp id="22">
<saveInputMessage>ERROR</saveInputMessage>
<saveNotifications>WARNING</saveNotifications>
<saveProcessedMessage>ERROR</saveProcessedMessage>
<saveTranslatedMessage>ERROR</saveTranslatedMessage>
<write>SUCCESS</write>
</streetLamp>
<syncPublishing>false</syncPublishing>
</item>
</messageTypes>
<name id="23">MIGRATION_CC</name>
</com.j2fe.processing.BusinessFeed>
</businessobject>
</goldensource-package>
