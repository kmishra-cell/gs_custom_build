<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.04">
<package-comment/>
<businessobject displayString="Fitch_RDS_Issuer_Ratings" type="com.j2fe.processing.BusinessFeed">
<com.j2fe.processing.BusinessFeed id="0">
<dataSource id="1">
<businessFeeds id="2" type="java.util.HashSet">
<item idref="0" type="com.j2fe.processing.BusinessFeed"/>
</businessFeeds>
<id id="3">FITCH</id>
</dataSource>
<description id="4">Fitch_RDS_Issuer_Ratings</description>
<feedDefinition id="5">db://resource/xml/feeds/Fitch/Fitch_New.xml</feedDefinition>
<fileDefinitions id="6" type="java.util.ArrayList">
<item id="7" type="com.j2fe.processing.FileDefinition">
<file id="8">*_*.iir</file>
<group id="9">1</group>
<messageType id="10">
<applicationName id="11">SECURITIESANDPROD</applicationName>
<businessEntity>false</businessEntity>
<businessFeed idref="0"/>
<caputureProcessMessage>true</caputureProcessMessage>
<commitMode>None</commitMode>
<createMarketRealTimeInd id="12">false</createMarketRealTimeInd>
<dataLineageEnabled>false</dataLineageEnabled>
<endOfFileEvents id="13" type="java.util.ArrayList"/>
<isKeyStreaming>true</isKeyStreaming>
<isVDDB>true</isVDDB>
<mappingResource id="14">db://resource/mapping/Fitch/FitchRDS_IssuerRatings.omdx</mappingResource>
<metaData id="15" type="java.util.HashMap">
<entry>
<key id="16" type="java.lang.String">CaseSensitiveInputFields</key>
<value id="17" type="java.lang.String">false</value>
</entry>
<entry>
<key id="18" type="java.lang.String">DescriptiveData</key>
<value id="19" type="java.lang.String">Y</value>
</entry>
</metaData>
<name id="20">FitchRDS_IssuerRatings</name>
<nearRealtimePublishing>false</nearRealtimePublishing>
<nearRealtimePublishingEvents id="21" type="java.util.ArrayList"/>
<publishingEvents id="22" type="java.util.ArrayList"/>
<rollbackOnError>false</rollbackOnError>
<saveVendorDataType>None</saveVendorDataType>
<streetLamp id="23">
<filterVDDBNotifications>false</filterVDDBNotifications>
<inputMessageSaveOnly>false</inputMessageSaveOnly>
<saveInputMessage>SUCCESS</saveInputMessage>
<saveLowLevelNotificationsOnlyForErrors>false</saveLowLevelNotificationsOnlyForErrors>
<saveNotifications>ERROR</saveNotifications>
<saveProcessedMessage>SUCCESS</saveProcessedMessage>
<saveTranslatedMessage>SUCCESS</saveTranslatedMessage>
<saveUnprocessedInputMessage>false</saveUnprocessedInputMessage>
</streetLamp>
<syncPublishing>false</syncPublishing>
</messageType>
</item>
<item id="24" type="com.j2fe.processing.FileDefinition">
<file id="25">*.dir</file>
<group idref="9"/>
<messageType idref="10"/>
</item>
<item id="26" type="com.j2fe.processing.FileDefinition">
<file id="27">*.mir</file>
<group idref="9"/>
<messageType idref="10"/>
</item>
<item id="28" type="com.j2fe.processing.FileDefinition">
<file id="29">*.mir.zip</file>
<group idref="9"/>
<messageType idref="10"/>
</item>
<item id="30" type="com.j2fe.processing.FileDefinition">
<file id="31">*_*.iir.zip</file>
<group idref="9"/>
<messageType idref="10"/>
</item>
</fileDefinitions>
<grouping>false</grouping>
<messageTypes id="32" type="java.util.HashSet">
<item idref="10" type="com.j2fe.processing.MessageType"/>
</messageTypes>
<name id="33">Fitch_RDS_Issuer_Ratings</name>
</com.j2fe.processing.BusinessFeed>
</businessobject>
</goldensource-package>
