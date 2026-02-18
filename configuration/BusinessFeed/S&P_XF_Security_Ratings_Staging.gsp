<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<goldensource-package version="8.4.1.193REL">
<package-comment/>
<businessobject displayString="S&amp;P_XF_Security_Ratings_Staging" type="com.j2fe.processing.BusinessFeed">
<com.j2fe.processing.BusinessFeed id="0">
<dataSource id="1">
<businessFeeds id="2" type="java.util.HashSet">
<item idref="0" type="com.j2fe.processing.BusinessFeed"/>
</businessFeeds>
<id id="3">S&amp;PStaging</id>
</dataSource>
<description id="4">S&amp;P_XF_Security_Ratings_Staging</description>
<feedDefinition id="5">db://resource/xml/feeds/standardandpoors/select.xml</feedDefinition>
<fileDefinitions id="6" type="java.util.ArrayList">
<item id="7" type="com.j2fe.processing.FileDefinition">
<file id="8">RXISIN20*.final</file>
<group id="9">2</group>
<messageType id="10">
<applicationName id="11">SECURITIESANDPROD</applicationName>
<businessEntity>false</businessEntity>
<businessFeed idref="0"/>
<caputureProcessMessage>false</caputureProcessMessage>
<commitMode>None</commitMode>
<createMarketRealTimeInd id="12">false</createMarketRealTimeInd>
<isKeyStreaming>false</isKeyStreaming>
<isVDDB>false</isVDDB>
<mappingResource id="13">db://resource/mapping/standard&amp;poors/SP_XF_SecurityRatings.mdx</mappingResource>
<metaData id="14" type="java.util.HashMap">
<entry>
<key id="15" type="java.lang.String">IsStaging</key>
<value id="16" type="java.lang.String">Y</value>
</entry>
</metaData>
<name id="17">SP_XF_SecurityRatings_Staging</name>
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
<file id="22">RatingObjectDetail20*.finalsecurity</file>
<group id="23">2</group>
<messageType idref="10"/>
</item>
<item id="24" type="com.j2fe.processing.FileDefinition">
<file id="25">AssessmentObjectDetail20*.finalsecurity</file>
<group id="26">2</group>
<messageType idref="10"/>
</item>
<item id="27" type="com.j2fe.processing.FileDefinition">
<file id="28">RatingSecurity20*.final</file>
<group id="29">2</group>
<messageType idref="10"/>
</item>
<item id="30" type="com.j2fe.processing.FileDefinition">
<file id="31">RXCUSIP20*.finalsecurity</file>
<group id="32">2</group>
<messageType idref="10"/>
</item>
<item id="33" type="com.j2fe.processing.FileDefinition">
<file id="34">RatingData20*.final</file>
<group id="35">1</group>
<messageType idref="10"/>
</item>
<item id="36" type="com.j2fe.processing.FileDefinition">
<file id="37">AssessmentData20*.final</file>
<group id="38">1</group>
<messageType idref="10"/>
</item>
<item id="39" type="com.j2fe.processing.FileDefinition">
<file id="40">RatingDataToQualifier20*.final</file>
<group id="41">2</group>
<messageType idref="10"/>
</item>
<item id="42" type="com.j2fe.processing.FileDefinition">
<file id="43">AssessmentDataToQualifier20*.final</file>
<group id="44">2</group>
<messageType idref="10"/>
</item>
</fileDefinitions>
<grouping>true</grouping>
<messageTypes id="45" type="java.util.HashSet">
<item idref="10" type="com.j2fe.processing.MessageType"/>
</messageTypes>
<name id="46">S&amp;P_XF_Security_Ratings_Staging</name>
</com.j2fe.processing.BusinessFeed>
</businessobject>
</goldensource-package>
