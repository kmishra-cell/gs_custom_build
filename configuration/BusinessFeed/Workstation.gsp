<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<goldensource-package version="8.4.1.255REL">
<package-comment/>
<businessobject displayString="Workstation" type="com.j2fe.processing.BusinessFeed">
<com.j2fe.processing.BusinessFeed id="0">
<dataSource id="1">
<businessFeeds id="2" type="java.util.HashSet">
<item idref="0" type="com.j2fe.processing.BusinessFeed"/>
</businessFeeds>
<id id="3">GS</id>
</dataSource>
<description id="4">GoldenSource Workstation Web UI</description>
<feedDefinition id="5">com/j2fe/feeds/xml.xml</feedDefinition>
<fileDefinitions id="6" type="java.util.ArrayList"/>
<grouping>false</grouping>
<messageTypes id="7" type="java.util.HashSet">
<item id="8" type="com.j2fe.processing.MessageType">
<businessEntity>false</businessEntity>
<businessFeed idref="0"/>
<caputureProcessMessage>true</caputureProcessMessage>
<commitMode>None</commitMode>
<createMarketRealTimeInd id="9">false</createMarketRealTimeInd>
<isKeyStreaming>false</isKeyStreaming>
<isVDDB>false</isVDDB>
<metaData id="10" type="java.util.HashMap"/>
<name id="11">MHI</name>
<nearRealtimePublishing>false</nearRealtimePublishing>
<nearRealtimePublishingEvents id="12" type="java.util.ArrayList"/>
<publishingEvents id="13" type="java.util.ArrayList">
<item id="14" type="java.lang.String">PublishTxnEvent</item>
</publishingEvents>
<rollbackOnError>true</rollbackOnError>
<saveVendorDataType>None</saveVendorDataType>
<streetLamp id="15">
<saveInputMessage>ERROR</saveInputMessage>
<saveNotifications>WARNING</saveNotifications>
<saveProcessedMessage>ERROR</saveProcessedMessage>
<saveTranslatedMessage>ERROR</saveTranslatedMessage>
<write>SUCCESS</write>
</streetLamp>
<syncPublishing>false</syncPublishing>
</item>
<item id="16" type="com.j2fe.processing.MessageType">
<businessEntity>false</businessEntity>
<businessFeed idref="0"/>
<caputureProcessMessage>true</caputureProcessMessage>
<commitMode>None</commitMode>
<createMarketRealTimeInd idref="9"/>
<isKeyStreaming>false</isKeyStreaming>
<isVDDB>false</isVDDB>
<metaData id="17" type="java.util.HashMap"/>
<name id="18">GUNT</name>
<nearRealtimePublishing>false</nearRealtimePublishing>
<nearRealtimePublishingEvents id="19" type="java.util.ArrayList"/>
<publishingEvents id="20" type="java.util.ArrayList">
<item id="21" type="java.lang.String">GUNTpublishing</item>
</publishingEvents>
<rollbackOnError>true</rollbackOnError>
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
<item id="23" type="com.j2fe.processing.MessageType">
<businessEntity>false</businessEntity>
<businessFeed idref="0"/>
<caputureProcessMessage>true</caputureProcessMessage>
<commitMode>None</commitMode>
<createMarketRealTimeInd idref="9"/>
<isKeyStreaming>false</isKeyStreaming>
<isVDDB>false</isVDDB>
<metaData id="24" type="java.util.HashMap"/>
<name id="25">SD</name>
<nearRealtimePublishing>false</nearRealtimePublishing>
<nearRealtimePublishingEvents id="26" type="java.util.ArrayList"/>
<publishingEvents id="27" type="java.util.ArrayList"/>
<rollbackOnError>true</rollbackOnError>
<saveVendorDataType>None</saveVendorDataType>
<streetLamp id="28">
<saveInputMessage>ERROR</saveInputMessage>
<saveNotifications>WARNING</saveNotifications>
<saveProcessedMessage>ERROR</saveProcessedMessage>
<saveTranslatedMessage>ERROR</saveTranslatedMessage>
<write>SUCCESS</write>
</streetLamp>
<syncPublishing>false</syncPublishing>
</item>
</messageTypes>
<name id="29">Workstation</name>
</com.j2fe.processing.BusinessFeed>
</businessobject>
</goldensource-package>
