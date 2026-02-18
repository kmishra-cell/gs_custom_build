<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<goldensource-package version="8.4.1.284">
<package-comment/>
<businessobject displayString="S&amp;P_XF_GR_Entity_Ratings_Staging" type="com.j2fe.processing.BusinessFeed">
<com.j2fe.processing.BusinessFeed id="0">
<dataSource id="1">
<businessFeeds id="2" type="java.util.HashSet">
<item idref="0" type="com.j2fe.processing.BusinessFeed"/>
</businessFeeds>
<id id="3">S&amp;PStaging</id>
</dataSource>
<description id="4">S&amp;P_XF_GR_Entity_Ratings_Staging</description>
<feedDefinition id="5">db://resource/xml/feeds/standardandpoors/select.xml</feedDefinition>
<fileDefinitions id="6" type="java.util.ArrayList">
<item id="7" type="com.j2fe.processing.FileDefinition">
<file id="8">spEntityLevelData*.final</file>
<group id="9">0</group>
<messageType id="10">
<applicationName id="11">SECURITIESANDPROD</applicationName>
<businessEntity>false</businessEntity>
<businessFeed idref="0"/>
<caputureProcessMessage>false</caputureProcessMessage>
<commitMode>None</commitMode>
<createMarketRealTimeInd id="12">false</createMarketRealTimeInd>
<isKeyStreaming>false</isKeyStreaming>
<isVDDB>false</isVDDB>
<mappingResource id="13">db://resource/mapping/standard&amp;poors/SP_XF_GR_EntityRatings.mdx</mappingResource>
<metaData id="14" type="java.util.HashMap">
<entry>
<key id="15" type="java.lang.String">IsStaging</key>
<value id="16" type="java.lang.String">Y</value>
</entry>
</metaData>
<name id="17">SP_XF_GR_EntityRatings_Staging</name>
<nearRealtimePublishing>false</nearRealtimePublishing>
<nearRealtimePublishingEvents id="18" type="java.util.ArrayList"/>
<publishingEvents id="19" type="java.util.ArrayList"/>
<rollbackOnError>false</rollbackOnError>
<saveVendorDataType>None</saveVendorDataType>
<streetLamp id="20">
<saveInputMessage>ERROR</saveInputMessage>
<saveNotifications>WARNING</saveNotifications>
<saveProcessedMessage>ERROR</saveProcessedMessage>
<saveTranslatedMessage>ERROR</saveTranslatedMessage>
<write>SUCCESS</write>
</streetLamp>
<syncPublishing>false</syncPublishing>
</messageType>
</item>
<item id="21" type="com.j2fe.processing.FileDefinition">
<file id="22">spRatingIdentifier*.final</file>
<group id="23">0</group>
<messageType idref="10"/>
</item>
<item id="24" type="com.j2fe.processing.FileDefinition">
<file id="25">spEntitySector*.final</file>
<group id="26">0</group>
<messageType idref="10"/>
</item>
<item id="27" type="com.j2fe.processing.FileDefinition">
<file id="28">spInstrumentToEntity*.final</file>
<group id="29">0</group>
<messageType idref="10"/>
</item>
<item id="30" type="com.j2fe.processing.FileDefinition">
<file id="31">spRatingData*.final</file>
<group id="32">0</group>
<messageType idref="10"/>
</item>
<item id="33" type="com.j2fe.processing.FileDefinition">
<file id="34">spRatingLevelData*.final</file>
<group id="35">0</group>
<messageType idref="10"/>
</item>
<item id="36" type="com.j2fe.processing.FileDefinition">
<file id="37">spAssessmentData*.final</file>
<group id="38">0</group>
<messageType idref="10"/>
</item>
<item id="39" type="com.j2fe.processing.FileDefinition">
<file id="40">spAssessmentLevelData*.final</file>
<group id="41">0</group>
<messageType idref="10"/>
</item>
<item id="42" type="com.j2fe.processing.FileDefinition">
<file id="43">spIndustryChar*.final</file>
<group id="44">0</group>
<messageType idref="10"/>
</item>
</fileDefinitions>
<grouping>false</grouping>
<messageTypes id="45" type="java.util.HashSet">
<item idref="10" type="com.j2fe.processing.MessageType"/>
</messageTypes>
<name id="46">S&amp;P_XF_GR_Entity_Ratings_Staging</name>
</com.j2fe.processing.BusinessFeed>
</businessobject>
</goldensource-package>
