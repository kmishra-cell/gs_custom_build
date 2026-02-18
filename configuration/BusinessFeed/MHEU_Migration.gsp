<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<goldensource-package version="8.4.1.201REL">
<package-comment/>
<businessobject displayString="MHEU_Migration" type="com.j2fe.processing.BusinessFeed">
<com.j2fe.processing.BusinessFeed id="0">
<dataSource id="1">
<businessFeeds id="2" type="java.util.HashSet">
<item idref="0" type="com.j2fe.processing.BusinessFeed"/>
</businessFeeds>
<id id="3">MIZ_CUSTOM</id>
</dataSource>
<description id="4">New for MHEU Migration</description>
<feedDefinition id="5">com/j2fe/feeds/LineByLine.xml</feedDefinition>
<fileDefinitions id="6" type="java.util.ArrayList"/>
<grouping>false</grouping>
<messageTypes id="7" type="java.util.HashSet">
<item id="8" type="com.j2fe.processing.MessageType">
<applicationName id="9">CUSTOMERANDCTPTY</applicationName>
<businessEntity>false</businessEntity>
<businessFeed idref="0"/>
<caputureProcessMessage>true</caputureProcessMessage>
<commitMode>None</commitMode>
<createMarketRealTimeInd id="10">false</createMarketRealTimeInd>
<isKeyStreaming>false</isKeyStreaming>
<isVDDB>true</isVDDB>
<mappingResource id="11">db://resource/mapping/Mizuho/MHEUAccountMigration.mdx</mappingResource>
<metaData id="12" type="java.util.HashMap"/>
<name id="13">MHEU_Account</name>
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
<item id="17" type="com.j2fe.processing.MessageType">
<applicationName id="18">CUSTOMERANDCTPTY</applicationName>
<businessEntity>false</businessEntity>
<businessFeed idref="0"/>
<caputureProcessMessage>true</caputureProcessMessage>
<commitMode>None</commitMode>
<createMarketRealTimeInd idref="10"/>
<isKeyStreaming>false</isKeyStreaming>
<isVDDB>true</isVDDB>
<mappingResource id="19">db://resource/mapping/Mizuho/MHEUAccountStatistics.mdx</mappingResource>
<metaData id="20" type="java.util.HashMap"/>
<name id="21">MHEU_ACST</name>
<nearRealtimePublishing>false</nearRealtimePublishing>
<nearRealtimePublishingEvents id="22" type="java.util.ArrayList"/>
<publishingEvents id="23" type="java.util.ArrayList"/>
<rollbackOnError>false</rollbackOnError>
<saveVendorDataType>None</saveVendorDataType>
<streetLamp id="24">
<saveInputMessage>ERROR</saveInputMessage>
<saveNotifications>WARNING</saveNotifications>
<saveProcessedMessage>ERROR</saveProcessedMessage>
<saveTranslatedMessage>ERROR</saveTranslatedMessage>
<write>SUCCESS</write>
</streetLamp>
<syncPublishing>false</syncPublishing>
</item>
<item id="25" type="com.j2fe.processing.MessageType">
<applicationName id="26">CUSTOMERANDCTPTY</applicationName>
<businessEntity>false</businessEntity>
<businessFeed idref="0"/>
<caputureProcessMessage>true</caputureProcessMessage>
<commitMode>None</commitMode>
<createMarketRealTimeInd idref="10"/>
<isKeyStreaming>false</isKeyStreaming>
<isVDDB>true</isVDDB>
<mappingResource id="27">db://resource/mapping/Mizuho/MHEUAccountAddresses.mdx</mappingResource>
<metaData id="28" type="java.util.HashMap"/>
<name id="29">MHEU_Account_Address</name>
<nearRealtimePublishing>false</nearRealtimePublishing>
<nearRealtimePublishingEvents id="30" type="java.util.ArrayList"/>
<publishingEvents id="31" type="java.util.ArrayList"/>
<rollbackOnError>false</rollbackOnError>
<saveVendorDataType>None</saveVendorDataType>
<streetLamp id="32">
<saveInputMessage>ERROR</saveInputMessage>
<saveNotifications>WARNING</saveNotifications>
<saveProcessedMessage>ERROR</saveProcessedMessage>
<saveTranslatedMessage>ERROR</saveTranslatedMessage>
<write>SUCCESS</write>
</streetLamp>
<syncPublishing>false</syncPublishing>
</item>
<item id="33" type="com.j2fe.processing.MessageType">
<applicationName id="34">CUSTOMERANDCTPTY</applicationName>
<businessEntity>false</businessEntity>
<businessFeed idref="0"/>
<caputureProcessMessage>true</caputureProcessMessage>
<commitMode>None</commitMode>
<createMarketRealTimeInd idref="10"/>
<isKeyStreaming>false</isKeyStreaming>
<isVDDB>true</isVDDB>
<mappingResource id="35">db://resource/mapping/Mizuho/MHEUAccountIAAS.mdx</mappingResource>
<metaData id="36" type="java.util.HashMap"/>
<name id="37">MHEU_Product</name>
<nearRealtimePublishing>false</nearRealtimePublishing>
<nearRealtimePublishingEvents id="38" type="java.util.ArrayList"/>
<publishingEvents id="39" type="java.util.ArrayList"/>
<rollbackOnError>false</rollbackOnError>
<saveVendorDataType>None</saveVendorDataType>
<streetLamp id="40">
<saveInputMessage>ERROR</saveInputMessage>
<saveNotifications>WARNING</saveNotifications>
<saveProcessedMessage>ERROR</saveProcessedMessage>
<saveTranslatedMessage>ERROR</saveTranslatedMessage>
<write>SUCCESS</write>
</streetLamp>
<syncPublishing>false</syncPublishing>
</item>
</messageTypes>
<name id="41">MHEU_Migration</name>
</com.j2fe.processing.BusinessFeed>
</businessobject>
</goldensource-package>
