<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.07">
<package-comment/>
<businessobject displayString="Bloomberg_DL_Global_Index" type="com.j2fe.processing.BusinessFeed">
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
<file id="7">index_*.out.gz.enc.20*</file>
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
<mappingResource id="13">db://resource/mapping/Bloomberg/BBIndexPricing.omdx</mappingResource>
<metaData id="14" type="java.util.HashMap">
<entry>
<key id="15" type="java.lang.String">DescriptiveData</key>
<value id="16" type="java.lang.String">Y</value>
</entry>
<entry>
<key id="17" type="java.lang.String">PriceData</key>
<value id="18" type="java.lang.String">N</value>
</entry>
</metaData>
<name id="19">BBIndexPricing</name>
<nearRealtimePublishing>false</nearRealtimePublishing>
<nearRealtimePublishingEvents id="20" type="java.util.ArrayList"/>
<publishingEvents id="21" type="java.util.ArrayList"/>
<rollbackOnError>false</rollbackOnError>
<saveVendorDataType>None</saveVendorDataType>
<streetLamp id="22">
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
<item id="23" type="com.j2fe.processing.FileDefinition">
<file id="24">index_*.px.gz.enc.20*</file>
<group idref="8"/>
<messageType idref="9"/>
</item>
<item id="25" type="com.j2fe.processing.FileDefinition">
<file id="26">index_*.epx.gz.enc.20*</file>
<group idref="8"/>
<messageType id="27">
<applicationName id="28">SECURITIESANDPROD</applicationName>
<businessEntity>false</businessEntity>
<businessFeed idref="0"/>
<caputureProcessMessage>true</caputureProcessMessage>
<commitMode>None</commitMode>
<createMarketRealTimeInd idref="11"/>
<dataLineageEnabled>false</dataLineageEnabled>
<endOfFileEvents id="29" type="java.util.ArrayList"/>
<isKeyStreaming>true</isKeyStreaming>
<isVDDB>false</isVDDB>
<mappingResource id="30">db://resource/mapping/Bloomberg/BBIndexEPX.mdx</mappingResource>
<metaData id="31" type="java.util.HashMap"/>
<name id="32">BBIndexEPX</name>
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
<file id="37">index_*.diff.gz.enc.20*</file>
<group id="38">2</group>
<messageType idref="9"/>
</item>
<item id="39" type="com.j2fe.processing.FileDefinition">
<file id="40">*gs*.out</file>
<group idref="8"/>
<messageType idref="9"/>
</item>
</fileDefinitions>
<grouping>false</grouping>
<messageTypes id="41" type="java.util.HashSet">
<item idref="27" type="com.j2fe.processing.MessageType"/>
<item idref="9" type="com.j2fe.processing.MessageType"/>
</messageTypes>
<name id="42">Bloomberg_DL_Global_Index</name>
</com.j2fe.processing.BusinessFeed>
</businessobject>
</goldensource-package>
