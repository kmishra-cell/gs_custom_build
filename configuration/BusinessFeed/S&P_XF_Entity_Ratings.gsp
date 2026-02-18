<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<goldensource-package version="8.4.1.201REL">
<package-comment/>
<businessobject displayString="S&amp;P_XF_Entity_Ratings" type="com.j2fe.processing.BusinessFeed">
<com.j2fe.processing.BusinessFeed id="0">
<dataSource id="1">
<businessFeeds id="2" type="java.util.HashSet">
<item idref="0" type="com.j2fe.processing.BusinessFeed"/>
</businessFeeds>
<id id="3">S&amp;P</id>
</dataSource>
<description id="4">S&amp;P_XF_Entity_Ratings</description>
<feedDefinition id="5">db://resource/xml/feeds/standardandpoors/select.xml</feedDefinition>
<fileDefinitions id="6" type="java.util.ArrayList">
<item id="7" type="com.j2fe.processing.FileDefinition">
<file id="8">RXCUSIP20*.finalentity</file>
<group id="9">1</group>
<messageType id="10">
<applicationName id="11">SECURITIESANDPROD</applicationName>
<businessEntity>false</businessEntity>
<businessFeed idref="0"/>
<caputureProcessMessage>false</caputureProcessMessage>
<commitMode>None</commitMode>
<createMarketRealTimeInd id="12">false</createMarketRealTimeInd>
<isKeyStreaming>true</isKeyStreaming>
<isVDDB>false</isVDDB>
<mappingResource id="13">db://resource/mapping/standard&amp;poors/SP_XF_EntityRatings.omdx</mappingResource>
<metaData id="14" type="java.util.HashMap">
<entry>
<key id="15" type="java.lang.String">IsStaging</key>
<value id="16" type="java.lang.String">N</value>
</entry>
</metaData>
<name id="17">SP_XF_EntityRatings</name>
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
<file id="22">RatingData20*.Hfinalentity</file>
<group id="23">5</group>
<messageType idref="10"/>
</item>
<item id="24" type="com.j2fe.processing.FileDefinition">
<file id="25">RatingData20*.Pfinalentity</file>
<group id="26">6</group>
<messageType idref="10"/>
</item>
<item id="27" type="com.j2fe.processing.FileDefinition">
<file id="28">RatingData20*.Cfinalentity</file>
<group id="29">7</group>
<messageType idref="10"/>
</item>
<item id="30" type="com.j2fe.processing.FileDefinition">
<file id="31">RatingData20*.finalentity</file>
<group id="32">5</group>
<messageType idref="10"/>
</item>
<item id="33" type="com.j2fe.processing.FileDefinition">
<file id="34">AssessmentData20*.Hfinalentity.no</file>
<group id="35">5</group>
<messageType idref="10"/>
</item>
<item id="36" type="com.j2fe.processing.FileDefinition">
<file id="37">AssessmentData20*.Pfinalentity.no</file>
<group id="38">6</group>
<messageType idref="10"/>
</item>
<item id="39" type="com.j2fe.processing.FileDefinition">
<file id="40">AssessmentData20*.Cfinalentity.no</file>
<group id="41">7</group>
<messageType idref="10"/>
</item>
<item id="42" type="com.j2fe.processing.FileDefinition">
<file id="43">AssessmentData20*.finalentity.no</file>
<group id="44">5</group>
<messageType idref="10"/>
</item>
<item id="45" type="com.j2fe.processing.FileDefinition">
<file id="46">RatingEntity20*.final.no</file>
<group id="47">2</group>
<messageType idref="10"/>
</item>
<item id="48" type="com.j2fe.processing.FileDefinition">
<file id="49">RatingEntityData20*.final.no</file>
<group id="50">3</group>
<messageType idref="10"/>
</item>
<item id="51" type="com.j2fe.processing.FileDefinition">
<file id="52">IndustryChar20*.final.no</file>
<group id="53">4</group>
<messageType idref="10"/>
</item>
<item id="54" type="com.j2fe.processing.FileDefinition">
<file id="55">RatingObjectToEntity20*.finalentity.no</file>
<group id="56">8</group>
<messageType idref="10"/>
</item>
<item id="57" type="com.j2fe.processing.FileDefinition">
<file id="58">RatingParticipant20*.finalentity.no</file>
<group id="59">8</group>
<messageType idref="10"/>
</item>
</fileDefinitions>
<grouping>true</grouping>
<messageTypes id="60" type="java.util.HashSet">
<item idref="10" type="com.j2fe.processing.MessageType"/>
</messageTypes>
<name id="61">S&amp;P_XF_Entity_Ratings</name>
</com.j2fe.processing.BusinessFeed>
</businessobject>
</goldensource-package>
