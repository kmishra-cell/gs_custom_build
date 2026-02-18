<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.07">
<package-comment/>
<businessobject displayString="Bloomberg_DL_Global_Commodities" type="com.j2fe.processing.BusinessFeed">
<com.j2fe.processing.BusinessFeed id="0">
<dataSource id="1">
<businessFeeds id="2" type="java.util.HashSet">
<item idref="0" type="com.j2fe.processing.BusinessFeed"/>
</businessFeeds>
<id id="3">BB</id>
</dataSource>
<feedDefinition id="4">db://resource/xml/feeds/bloomberg/getdata.xml</feedDefinition>
<fileDefinitions id="5" type="java.util.ArrayList">
<item id="6" type="com.j2fe.processing.FileDefinition">
<file id="7">comdty_euro.out.gz.enc.20*</file>
<group id="8">1</group>
<messageType id="9">
<applicationName id="10">SECURITIESANDPROD</applicationName>
<businessEntity>false</businessEntity>
<businessFeed idref="0"/>
<caputureProcessMessage>true</caputureProcessMessage>
<commitMode>None</commitMode>
<createMarketRealTimeInd id="11">false</createMarketRealTimeInd>
<dataLineageEnabled>false</dataLineageEnabled>
<endOfFileEvents id="12" type="java.util.ArrayList"/>
<isKeyStreaming>true</isKeyStreaming>
<isVDDB>false</isVDDB>
<mappingResource id="13">db://resource/mapping/Bloomberg/BBGlobalCommodityFutures.omdx</mappingResource>
<metaData id="14" type="java.util.HashMap"/>
<name id="15">BBGlobalCommodityFutures</name>
<nearRealtimePublishing>false</nearRealtimePublishing>
<nearRealtimePublishingEvents id="16" type="java.util.ArrayList"/>
<publishingEvents id="17" type="java.util.ArrayList"/>
<rollbackOnError>false</rollbackOnError>
<saveVendorDataType>None</saveVendorDataType>
<streetLamp id="18">
<filterVDDBNotifications>false</filterVDDBNotifications>
<inputMessageSaveOnly>false</inputMessageSaveOnly>
<saveInputMessage>ERROR</saveInputMessage>
<saveLowLevelNotificationsOnlyForErrors>false</saveLowLevelNotificationsOnlyForErrors>
<saveNotifications>WARNING</saveNotifications>
<saveProcessedMessage>ERROR</saveProcessedMessage>
<saveTranslatedMessage>ERROR</saveTranslatedMessage>
<saveUnprocessedInputMessage>false</saveUnprocessedInputMessage>
</streetLamp>
<syncPublishing>false</syncPublishing>
</messageType>
</item>
<item id="19" type="com.j2fe.processing.FileDefinition">
<file id="20">comdty_namr.out.gz.enc.20*</file>
<group idref="8"/>
<messageType idref="9"/>
</item>
<item id="21" type="com.j2fe.processing.FileDefinition">
<file id="22">comdty_asia.out.gz.enc.20*</file>
<group idref="8"/>
<messageType idref="9"/>
</item>
<item id="23" type="com.j2fe.processing.FileDefinition">
<file id="24">comdty_lamr.out.gz.enc.20*</file>
<group idref="8"/>
<messageType idref="9"/>
</item>
<item id="25" type="com.j2fe.processing.FileDefinition">
<file id="26">comdty_option_euro.out.gz.enc.20*</file>
<group idref="8"/>
<messageType id="27">
<applicationName id="28">SECURITIESANDPROD</applicationName>
<businessEntity>false</businessEntity>
<businessFeed idref="0"/>
<caputureProcessMessage>false</caputureProcessMessage>
<commitMode>None</commitMode>
<dataLineageEnabled>false</dataLineageEnabled>
<endOfFileEvents id="29" type="java.util.ArrayList"/>
<isKeyStreaming>true</isKeyStreaming>
<isVDDB>false</isVDDB>
<mappingResource id="30">db://resource/mapping/Bloomberg/BBCommodityOptions.omdx</mappingResource>
<metaData id="31" type="java.util.HashMap"/>
<name id="32">BBCommodityOptions</name>
<nearRealtimePublishing>false</nearRealtimePublishing>
<nearRealtimePublishingEvents id="33" type="java.util.ArrayList"/>
<publishingEvents id="34" type="java.util.ArrayList"/>
<rollbackOnError>false</rollbackOnError>
<saveVendorDataType>None</saveVendorDataType>
<streetLamp id="35">
<filterVDDBNotifications>false</filterVDDBNotifications>
<inputMessageSaveOnly>false</inputMessageSaveOnly>
<saveInputMessage>ERROR</saveInputMessage>
<saveLowLevelNotificationsOnlyForErrors>false</saveLowLevelNotificationsOnlyForErrors>
<saveNotifications>WARNING</saveNotifications>
<saveProcessedMessage>ERROR</saveProcessedMessage>
<saveTranslatedMessage>ERROR</saveTranslatedMessage>
<saveUnprocessedInputMessage>false</saveUnprocessedInputMessage>
</streetLamp>
<syncPublishing>false</syncPublishing>
</messageType>
</item>
<item id="36" type="com.j2fe.processing.FileDefinition">
<file id="37">comdty_option_namr.out.gz.enc.20*</file>
<group idref="8"/>
<messageType idref="27"/>
</item>
<item id="38" type="com.j2fe.processing.FileDefinition">
<file id="39">comdty_option_asia.out.gz.enc.20*</file>
<group idref="8"/>
<messageType idref="27"/>
</item>
<item id="40" type="com.j2fe.processing.FileDefinition">
<file id="41">comdty_option_lamr.out.gz.enc.20*</file>
<group idref="8"/>
<messageType idref="27"/>
</item>
<item id="42" type="com.j2fe.processing.FileDefinition">
<file id="43">*gs*.out</file>
<group idref="8"/>
<messageType idref="9"/>
</item>
</fileDefinitions>
<grouping>false</grouping>
<messageTypes id="44" type="java.util.HashSet">
<item idref="27" type="com.j2fe.processing.MessageType"/>
<item idref="9" type="com.j2fe.processing.MessageType"/>
</messageTypes>
<name id="45">Bloomberg_DL_Global_Commodities</name>
</com.j2fe.processing.BusinessFeed>
</businessobject>
</goldensource-package>
