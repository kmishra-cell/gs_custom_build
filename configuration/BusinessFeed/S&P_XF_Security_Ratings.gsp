<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<goldensource-package version="8.4.1.201REL">
<package-comment/>
<businessobject displayString="S&amp;P_XF_Security_Ratings" type="com.j2fe.processing.BusinessFeed">
<com.j2fe.processing.BusinessFeed id="0">
<dataSource id="1">
<businessFeeds id="2" type="java.util.HashSet">
<item idref="0" type="com.j2fe.processing.BusinessFeed"/>
</businessFeeds>
<id id="3">S&amp;P</id>
</dataSource>
<description id="4">S&amp;P_XF_Security_Ratings</description>
<feedDefinition id="5">db://resource/xml/feeds/standardandpoors/select.xml</feedDefinition>
<fileDefinitions id="6" type="java.util.ArrayList">
<item id="7" type="com.j2fe.processing.FileDefinition">
<file id="8">RatingData20*.Hfinalsecurity</file>
<group id="9">14</group>
<messageType id="10">
<applicationName id="11">SECURITIESANDPROD</applicationName>
<businessEntity>false</businessEntity>
<businessFeed idref="0"/>
<caputureProcessMessage>false</caputureProcessMessage>
<commitMode>None</commitMode>
<createMarketRealTimeInd id="12">false</createMarketRealTimeInd>
<isKeyStreaming>true</isKeyStreaming>
<isVDDB>false</isVDDB>
<mappingResource id="13">db://resource/mapping/standard&amp;poors/SP_XF_SecurityRatings.omdx</mappingResource>
<metaData id="14" type="java.util.HashMap">
<entry>
<key id="15" type="java.lang.String">IsStaging</key>
<value id="16" type="java.lang.String">N</value>
</entry>
</metaData>
<name id="17">SP_XF_SecurityRatings</name>
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
<file id="22">RatingData20*.Pfinalsecurity</file>
<group id="23">15</group>
<messageType idref="10"/>
</item>
<item id="24" type="com.j2fe.processing.FileDefinition">
<file id="25">RatingData20*.Cfinalsecurity</file>
<group id="26">16</group>
<messageType idref="10"/>
</item>
<item id="27" type="com.j2fe.processing.FileDefinition">
<file id="28">RatingData20*.finalsecurity</file>
<group id="29">11</group>
<messageType idref="10"/>
</item>
<item id="30" type="com.j2fe.processing.FileDefinition">
<file id="31">AssessmentData20*.Hfinalsecurity.no</file>
<group id="32">14</group>
<messageType idref="10"/>
</item>
<item id="33" type="com.j2fe.processing.FileDefinition">
<file id="34">AssessmentData20*.Pfinalsecurity.no</file>
<group id="35">15</group>
<messageType idref="10"/>
</item>
<item id="36" type="com.j2fe.processing.FileDefinition">
<file id="37">AssessmentData20*.Cfinalsecurity.no</file>
<group id="38">16</group>
<messageType idref="10"/>
</item>
<item id="39" type="com.j2fe.processing.FileDefinition">
<file id="40">AssessmentData20*.finalsecurity.no</file>
<group id="41">11</group>
<messageType idref="10"/>
</item>
<item id="42" type="com.j2fe.processing.FileDefinition">
<file id="43">RXISIN20*.final</file>
<group id="44">8</group>
<messageType idref="10"/>
</item>
<item id="45" type="com.j2fe.processing.FileDefinition">
<file id="46">RatingSecurity20*.final.no</file>
<group id="47">7</group>
<messageType idref="10"/>
</item>
<item id="48" type="com.j2fe.processing.FileDefinition">
<file id="49">RatingSecurityData20*.final.no</file>
<group id="50">8</group>
<messageType idref="10"/>
</item>
<item id="51" type="com.j2fe.processing.FileDefinition">
<file id="52">RatingInstrument20*.final.no</file>
<group id="53">9</group>
<messageType idref="10"/>
</item>
<item id="54" type="com.j2fe.processing.FileDefinition">
<file id="55">RatingInstrumentData20*.final.no</file>
<group id="56">10</group>
<messageType idref="10"/>
</item>
<item id="57" type="com.j2fe.processing.FileDefinition">
<file id="58">RatingObjectToEntity20*.finalsecurity.no</file>
<group id="59">12</group>
<messageType idref="10"/>
</item>
<item id="60" type="com.j2fe.processing.FileDefinition">
<file id="61">AssessmentData20*.ISINfinalsecurity.no</file>
<group id="62">13</group>
<messageType idref="10"/>
</item>
<item id="63" type="com.j2fe.processing.FileDefinition">
<file id="64">RatingData20*.ISINfinalsecurity</file>
<group id="65">13</group>
<messageType idref="10"/>
</item>
<item id="66" type="com.j2fe.processing.FileDefinition">
<file id="67">AssessmentData20*.CUSIPfinalsecurity.no</file>
<group id="68">14</group>
<messageType idref="10"/>
</item>
<item id="69" type="com.j2fe.processing.FileDefinition">
<file id="70">RatingData20*.CUSIPfinalsecurity</file>
<group id="71">14</group>
<messageType idref="10"/>
</item>
<item id="72" type="com.j2fe.processing.FileDefinition">
<file id="73">AssessmentData20*.CUSIPHfinalsecurity.no</file>
<group id="74">14</group>
<messageType idref="10"/>
</item>
<item id="75" type="com.j2fe.processing.FileDefinition">
<file id="76">RatingData20*.ISINHfinalsecurity</file>
<group id="77">14</group>
<messageType idref="10"/>
</item>
<item id="78" type="com.j2fe.processing.FileDefinition">
<file id="79">AssessmentData20*.CUSIPPfinalsecurity.no</file>
<group id="80">15</group>
<messageType idref="10"/>
</item>
<item id="81" type="com.j2fe.processing.FileDefinition">
<file id="82">RatingData20*.ISINPfinalsecurity</file>
<group id="83">15</group>
<messageType idref="10"/>
</item>
<item id="84" type="com.j2fe.processing.FileDefinition">
<file id="85">AssessmentData20*.CUSIPCfinalsecurity.no</file>
<group id="86">16</group>
<messageType idref="10"/>
</item>
<item id="87" type="com.j2fe.processing.FileDefinition">
<file id="88">RatingData20*.ISINCfinalsecurity</file>
<group id="89">16</group>
<messageType idref="10"/>
</item>
</fileDefinitions>
<grouping>true</grouping>
<messageTypes id="90" type="java.util.HashSet">
<item idref="10" type="com.j2fe.processing.MessageType"/>
</messageTypes>
<name id="91">S&amp;P_XF_Security_Ratings</name>
</com.j2fe.processing.BusinessFeed>
</businessobject>
</goldensource-package>
