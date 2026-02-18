<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<goldensource-package version="8.4.1.179REL">
<package-comment/>
<businessobject displayString="S&amp;P_XF_All_Zipped_files" type="com.j2fe.processing.BusinessFeed">
<com.j2fe.processing.BusinessFeed id="0">
<dataSource id="1">
<businessFeeds id="2" type="java.util.HashSet">
<item idref="0" type="com.j2fe.processing.BusinessFeed"/>
</businessFeeds>
<id id="3">S&amp;PStaging</id>
</dataSource>
<description id="4">Dummy business feed for use in downloading S&amp;P XF zip files in the custom wrapper piece</description>
<feedDefinition id="5">db://resource/xml/feeds/standardandpoors/select.xml</feedDefinition>
<fileDefinitions id="6" type="java.util.ArrayList">
<item id="7" type="com.j2fe.processing.FileDefinition">
<file id="8">*SpanChange*.zip</file>
<group id="9">0</group>
<messageType id="10">
<businessEntity>false</businessEntity>
<businessFeed idref="0"/>
<caputureProcessMessage>false</caputureProcessMessage>
<commitMode>None</commitMode>
<createMarketRealTimeInd id="11">false</createMarketRealTimeInd>
<isKeyStreaming>false</isKeyStreaming>
<isVDDB>true</isVDDB>
<metaData id="12" type="java.util.HashMap"/>
<name id="13">ZipDummy</name>
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
<file id="18">*SpanFull*.zip</file>
<group id="19">0</group>
<messageType idref="10"/>
</item>
</fileDefinitions>
<grouping>false</grouping>
<messageTypes id="20" type="java.util.HashSet">
<item idref="10" type="com.j2fe.processing.MessageType"/>
</messageTypes>
<name id="21">S&amp;P_XF_All_Zipped_files</name>
</com.j2fe.processing.BusinessFeed>
</businessobject>
</goldensource-package>
