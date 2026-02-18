<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<goldensource-package version="8.4.1.94REL">
<package-comment/>
<businessobject displayString="SMHolidayCalendar" type="com.j2fe.processing.BusinessFeed">
<com.j2fe.processing.BusinessFeed id="0">
<dataSource id="1">
<businessFeeds id="2" type="java.util.HashSet">
<item idref="0" type="com.j2fe.processing.BusinessFeed"/>
</businessFeeds>
<id id="3">SMONITOR</id>
</dataSource>
<feedDefinition id="4">db://resource/xml/feeds/swapsmonitor/swap_hcal.xml</feedDefinition>
<fileDefinitions id="5" type="java.util.ArrayList">
<item id="6" type="com.j2fe.processing.FileDefinition">
<file id="7">ibjim.csv</file>
<group id="8">0</group>
<messageType id="9">
<businessEntity>false</businessEntity>
<businessFeed idref="0"/>
<caputureProcessMessage>false</caputureProcessMessage>
<commitMode>None</commitMode>
<createMarketRealTimeInd id="10">false</createMarketRealTimeInd>
<isKeyStreaming>false</isKeyStreaming>
<isVDDB>false</isVDDB>
<mappingResource id="11">db://resource/mapping/SwapsMonitor/SMHolidayCalendar.mdx</mappingResource>
<metaData id="12" type="java.util.HashMap"/>
<name id="13">SMHolidayCalendar</name>
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
</messageType>
</item>
<item id="17" type="com.j2fe.processing.FileDefinition">
<file id="18">IBJIM*.csv</file>
<group id="19">3</group>
<messageType idref="9"/>
</item>
<item id="20" type="com.j2fe.processing.FileDefinition">
<file id="21">IBJIM*.ZIP</file>
<group id="22">0</group>
<messageType idref="9"/>
</item>
</fileDefinitions>
<grouping>false</grouping>
<messageTypes id="23" type="java.util.HashSet">
<item idref="9" type="com.j2fe.processing.MessageType"/>
</messageTypes>
<name id="24">SMHolidayCalendar</name>
</com.j2fe.processing.BusinessFeed>
</businessobject>
</goldensource-package>
