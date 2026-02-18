<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.07">
<package-comment/>
<businessobject displayString="MoodysRDSInstrument" type="com.j2fe.processing.BusinessFeed">
<com.j2fe.processing.BusinessFeed id="0">
<dataSource id="1">
<businessFeeds id="2" type="java.util.HashSet">
<item idref="0" type="com.j2fe.processing.BusinessFeed"/>
</businessFeeds>
<id id="3">MOODYS</id>
</dataSource>
<description id="4">MoodysRDSInstrument</description>
<feedDefinition id="5">db://resource/xml/feeds/Moodys/MoodysRDS_Instrument.xml</feedDefinition>
<fileDefinitions id="6" type="java.util.ArrayList">
<item id="7" type="com.j2fe.processing.FileDefinition">
<file id="8">cfg_inst_current_rating_*.split</file>
<group id="9">2</group>
<messageType id="10">
<applicationName id="11">SECURITIESANDPROD</applicationName>
<businessEntity>false</businessEntity>
<businessFeed idref="0"/>
<caputureProcessMessage>false</caputureProcessMessage>
<commitMode>None</commitMode>
<createMarketRealTimeInd id="12">false</createMarketRealTimeInd>
<dataLineageEnabled>false</dataLineageEnabled>
<endOfFileEvents id="13" type="java.util.ArrayList"/>
<isKeyStreaming>true</isKeyStreaming>
<isVDDB>false</isVDDB>
<mappingResource id="14">db://resource/mapping/Moodys/MoodysRDS_Instrument.omdx</mappingResource>
<metaData id="15" type="java.util.HashMap"/>
<name id="16">MoodysRDS_Instrument</name>
<nearRealtimePublishing>false</nearRealtimePublishing>
<nearRealtimePublishingEvents id="17" type="java.util.ArrayList"/>
<publishingEvents id="18" type="java.util.ArrayList"/>
<rollbackOnError>false</rollbackOnError>
<saveVendorDataType>None</saveVendorDataType>
<streetLamp id="19">
<filterVDDBNotifications>false</filterVDDBNotifications>
<inputMessageSaveOnly>false</inputMessageSaveOnly>
<saveInputMessage>ERROR</saveInputMessage>
<saveLowLevelNotificationsOnlyForErrors>false</saveLowLevelNotificationsOnlyForErrors>
<saveNotifications>ERROR</saveNotifications>
<saveProcessedMessage>ERROR</saveProcessedMessage>
<saveTranslatedMessage>ERROR</saveTranslatedMessage>
<saveUnprocessedInputMessage>false</saveUnprocessedInputMessage>
</streetLamp>
<syncPublishing>false</syncPublishing>
</messageType>
</item>
<item id="20" type="com.j2fe.processing.FileDefinition">
<file id="21">pfg_inst_current_rating_*.split</file>
<group idref="9"/>
<messageType idref="10"/>
</item>
<item id="22" type="com.j2fe.processing.FileDefinition">
<file id="23">*.Zip</file>
<group id="24">0</group>
<messageType idref="10"/>
</item>
</fileDefinitions>
<grouping>false</grouping>
<messageTypes id="25" type="java.util.HashSet">
<item idref="10" type="com.j2fe.processing.MessageType"/>
</messageTypes>
<name id="26">MoodysRDSInstrument</name>
</com.j2fe.processing.BusinessFeed>
</businessobject>
</goldensource-package>
