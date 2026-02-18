<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.07">
<package-comment/>
<businessobject displayString="S&amp;P_XF_GR_Security_Ratings" type="com.j2fe.processing.BusinessFeed">
<com.j2fe.processing.BusinessFeed id="0">
<dataSource id="1">
<businessFeeds id="2" type="java.util.HashSet">
<item idref="0" type="com.j2fe.processing.BusinessFeed"/>
</businessFeeds>
<id id="3">S&amp;P</id>
</dataSource>
<description id="4">S&amp;P_XF_GR_Security_Ratings</description>
<feedDefinition id="5">db://resource/xml/feeds/standardandpoors/select.xml</feedDefinition>
<fileDefinitions id="6" type="java.util.ArrayList">
<item id="7" type="com.j2fe.processing.FileDefinition">
<file id="8">spInstrumentLevelData*.security</file>
<group id="9">1</group>
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
<isVDDB>true</isVDDB>
<mappingResource id="14">db://resource/mapping/standard&amp;poors/SP_XF_GR_SecurityRatings.omdx</mappingResource>
<metaData id="15" type="java.util.HashMap">
<entry>
<key id="16" type="java.lang.String">DescriptiveData</key>
<value id="17" type="java.lang.String">Y</value>
</entry>
<entry>
<key id="18" type="java.lang.String">IsStaging</key>
<value id="19" type="java.lang.String">N</value>
</entry>
<entry>
<key id="20" type="java.lang.String">StageFile</key>
<value id="21" type="java.lang.String">N</value>
</entry>
<entry>
<key id="22" type="java.lang.String">VALIDATE_EXPRESSION</key>
<value id="23" type="java.lang.String">true</value>
</entry>
</metaData>
<name id="24">SP_XF_GR_SecurityRatings</name>
<nearRealtimePublishing>false</nearRealtimePublishing>
<nearRealtimePublishingEvents id="25" type="java.util.ArrayList"/>
<publishingEvents id="26" type="java.util.ArrayList"/>
<rollbackOnError>false</rollbackOnError>
<saveVendorDataType>None</saveVendorDataType>
<streetLamp id="27">
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
<item id="28" type="com.j2fe.processing.FileDefinition">
<file id="29">spSecurityLevelData*.security</file>
<group id="30">2</group>
<messageType idref="10"/>
</item>
<item id="31" type="com.j2fe.processing.FileDefinition">
<file id="32">spRatingData*.security</file>
<group id="33">3</group>
<messageType idref="10"/>
</item>
<item id="34" type="com.j2fe.processing.FileDefinition">
<file id="35">spRatingDataNoCUSIP*.security</file>
<group idref="33"/>
<messageType idref="10"/>
</item>
<item id="36" type="com.j2fe.processing.FileDefinition">
<file id="37">spAssessmentData*.security</file>
<group idref="33"/>
<messageType idref="10"/>
</item>
<item id="38" type="com.j2fe.processing.FileDefinition">
<file id="39">spAssessmentDataNoCUSIP*.security</file>
<group idref="33"/>
<messageType idref="10"/>
</item>
<item id="40" type="com.j2fe.processing.FileDefinition">
<file id="41">spInstrumentSector*.security</file>
<group id="42">4</group>
<messageType idref="10"/>
</item>
<item id="43" type="com.j2fe.processing.FileDefinition">
<file id="44">spParticipants*.security</file>
<group id="45">5</group>
<messageType idref="10"/>
</item>
<item id="46" type="com.j2fe.processing.FileDefinition">
<file id="47">spInstrumentToEntity*.security</file>
<group idref="45"/>
<messageType idref="10"/>
</item>
</fileDefinitions>
<grouping>true</grouping>
<messageTypes id="48" type="java.util.HashSet">
<item id="49" type="com.j2fe.processing.MessageType">
<applicationName id="50">SECURITIESANDPROD</applicationName>
<businessEntity>false</businessEntity>
<businessFeed idref="0"/>
<caputureProcessMessage>false</caputureProcessMessage>
<commitMode>None</commitMode>
<createMarketRealTimeInd idref="12"/>
<dataLineageEnabled>false</dataLineageEnabled>
<endOfFileEvents id="51" type="java.util.ArrayList"/>
<isKeyStreaming>true</isKeyStreaming>
<isVDDB>true</isVDDB>
<mappingResource id="52">db://resource/mapping/standard&amp;poors/SP_XF_GR_SecurityRatings.mdx</mappingResource>
<metaData id="53" type="java.util.HashMap">
<entry>
<key id="54" type="java.lang.String">DescriptiveData</key>
<value id="55" type="java.lang.String">Y</value>
</entry>
<entry>
<key id="56" type="java.lang.String">IsStaging</key>
<value id="57" type="java.lang.String">N</value>
</entry>
<entry>
<key id="58" type="java.lang.String">StageFile</key>
<value id="59" type="java.lang.String">N</value>
</entry>
<entry>
<key id="60" type="java.lang.String">VALIDATE_EXPRESSION</key>
<value id="61" type="java.lang.String">true</value>
</entry>
</metaData>
<name id="62">spAssessmentDataSec</name>
<nearRealtimePublishing>false</nearRealtimePublishing>
<nearRealtimePublishingEvents id="63" type="java.util.ArrayList"/>
<publishingEvents id="64" type="java.util.ArrayList"/>
<rollbackOnError>false</rollbackOnError>
<saveVendorDataType>None</saveVendorDataType>
<streetLamp id="65">
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
</item>
<item idref="10" type="com.j2fe.processing.MessageType"/>
<item id="66" type="com.j2fe.processing.MessageType">
<applicationName id="67">SECURITIESANDPROD</applicationName>
<businessEntity>false</businessEntity>
<businessFeed idref="0"/>
<caputureProcessMessage>false</caputureProcessMessage>
<commitMode>None</commitMode>
<createMarketRealTimeInd idref="12"/>
<dataLineageEnabled>false</dataLineageEnabled>
<endOfFileEvents id="68" type="java.util.ArrayList"/>
<isKeyStreaming>true</isKeyStreaming>
<isVDDB>true</isVDDB>
<mappingResource id="69">db://resource/mapping/standard&amp;poors/SP_XF_GR_SecurityRatings.mdx</mappingResource>
<metaData id="70" type="java.util.HashMap">
<entry>
<key id="71" type="java.lang.String">DescriptiveData</key>
<value id="72" type="java.lang.String">Y</value>
</entry>
<entry>
<key id="73" type="java.lang.String">IsStaging</key>
<value id="74" type="java.lang.String">N</value>
</entry>
<entry>
<key id="75" type="java.lang.String">StageFile</key>
<value id="76" type="java.lang.String">N</value>
</entry>
<entry>
<key id="77" type="java.lang.String">VALIDATE_EXPRESSION</key>
<value id="78" type="java.lang.String">true</value>
</entry>
</metaData>
<name id="79">spInstrumentLevelData</name>
<nearRealtimePublishing>false</nearRealtimePublishing>
<nearRealtimePublishingEvents id="80" type="java.util.ArrayList"/>
<publishingEvents id="81" type="java.util.ArrayList"/>
<rollbackOnError>false</rollbackOnError>
<saveVendorDataType>None</saveVendorDataType>
<streetLamp id="82">
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
</item>
<item id="83" type="com.j2fe.processing.MessageType">
<applicationName id="84">SECURITIESANDPROD</applicationName>
<businessEntity>false</businessEntity>
<businessFeed idref="0"/>
<caputureProcessMessage>false</caputureProcessMessage>
<commitMode>None</commitMode>
<createMarketRealTimeInd idref="12"/>
<dataLineageEnabled>false</dataLineageEnabled>
<endOfFileEvents id="85" type="java.util.ArrayList"/>
<isKeyStreaming>true</isKeyStreaming>
<isVDDB>true</isVDDB>
<mappingResource id="86">db://resource/mapping/standard&amp;poors/SP_XF_GR_SecurityRatings.mdx</mappingResource>
<metaData id="87" type="java.util.HashMap">
<entry>
<key id="88" type="java.lang.String">DescriptiveData</key>
<value id="89" type="java.lang.String">Y</value>
</entry>
<entry>
<key id="90" type="java.lang.String">IsStaging</key>
<value id="91" type="java.lang.String">N</value>
</entry>
<entry>
<key id="92" type="java.lang.String">StageFile</key>
<value id="93" type="java.lang.String">N</value>
</entry>
<entry>
<key id="94" type="java.lang.String">VALIDATE_EXPRESSION</key>
<value id="95" type="java.lang.String">true</value>
</entry>
</metaData>
<name id="96">spParticipantsSec</name>
<nearRealtimePublishing>false</nearRealtimePublishing>
<nearRealtimePublishingEvents id="97" type="java.util.ArrayList"/>
<publishingEvents id="98" type="java.util.ArrayList"/>
<rollbackOnError>false</rollbackOnError>
<saveVendorDataType>None</saveVendorDataType>
<streetLamp id="99">
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
</item>
<item id="100" type="com.j2fe.processing.MessageType">
<applicationName id="101">SECURITIESANDPROD</applicationName>
<businessEntity>false</businessEntity>
<businessFeed idref="0"/>
<caputureProcessMessage>false</caputureProcessMessage>
<commitMode>None</commitMode>
<createMarketRealTimeInd idref="12"/>
<dataLineageEnabled>false</dataLineageEnabled>
<endOfFileEvents id="102" type="java.util.ArrayList"/>
<isKeyStreaming>true</isKeyStreaming>
<isVDDB>true</isVDDB>
<mappingResource id="103">db://resource/mapping/standard&amp;poors/SP_XF_GR_SecurityRatings.mdx</mappingResource>
<metaData id="104" type="java.util.HashMap">
<entry>
<key id="105" type="java.lang.String">DescriptiveData</key>
<value id="106" type="java.lang.String">Y</value>
</entry>
<entry>
<key id="107" type="java.lang.String">IsStaging</key>
<value id="108" type="java.lang.String">N</value>
</entry>
<entry>
<key id="109" type="java.lang.String">StageFile</key>
<value id="110" type="java.lang.String">N</value>
</entry>
<entry>
<key id="111" type="java.lang.String">VALIDATE_EXPRESSION</key>
<value id="112" type="java.lang.String">true</value>
</entry>
</metaData>
<name id="113">spInstrumentSector</name>
<nearRealtimePublishing>false</nearRealtimePublishing>
<nearRealtimePublishingEvents id="114" type="java.util.ArrayList"/>
<publishingEvents id="115" type="java.util.ArrayList"/>
<rollbackOnError>false</rollbackOnError>
<saveVendorDataType>None</saveVendorDataType>
<streetLamp id="116">
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
</item>
<item id="117" type="com.j2fe.processing.MessageType">
<applicationName id="118">SECURITIESANDPROD</applicationName>
<businessEntity>false</businessEntity>
<businessFeed idref="0"/>
<caputureProcessMessage>false</caputureProcessMessage>
<commitMode>None</commitMode>
<createMarketRealTimeInd idref="12"/>
<dataLineageEnabled>false</dataLineageEnabled>
<endOfFileEvents id="119" type="java.util.ArrayList"/>
<isKeyStreaming>true</isKeyStreaming>
<isVDDB>true</isVDDB>
<mappingResource id="120">db://resource/mapping/standard&amp;poors/SP_XF_GR_SecurityRatings.mdx</mappingResource>
<metaData id="121" type="java.util.HashMap">
<entry>
<key id="122" type="java.lang.String">DescriptiveData</key>
<value id="123" type="java.lang.String">Y</value>
</entry>
<entry>
<key id="124" type="java.lang.String">IsStaging</key>
<value id="125" type="java.lang.String">N</value>
</entry>
<entry>
<key id="126" type="java.lang.String">StageFile</key>
<value id="127" type="java.lang.String">N</value>
</entry>
<entry>
<key id="128" type="java.lang.String">VALIDATE_EXPRESSION</key>
<value id="129" type="java.lang.String">true</value>
</entry>
</metaData>
<name id="130">spRatingDataSec</name>
<nearRealtimePublishing>false</nearRealtimePublishing>
<nearRealtimePublishingEvents id="131" type="java.util.ArrayList"/>
<publishingEvents id="132" type="java.util.ArrayList"/>
<rollbackOnError>false</rollbackOnError>
<saveVendorDataType>None</saveVendorDataType>
<streetLamp id="133">
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
</item>
<item id="134" type="com.j2fe.processing.MessageType">
<applicationName id="135">SECURITIESANDPROD</applicationName>
<businessEntity>false</businessEntity>
<businessFeed idref="0"/>
<caputureProcessMessage>false</caputureProcessMessage>
<commitMode>None</commitMode>
<createMarketRealTimeInd idref="12"/>
<dataLineageEnabled>false</dataLineageEnabled>
<endOfFileEvents id="136" type="java.util.ArrayList"/>
<isKeyStreaming>true</isKeyStreaming>
<isVDDB>true</isVDDB>
<mappingResource id="137">db://resource/mapping/standard&amp;poors/SP_XF_GR_SecurityRatings.mdx</mappingResource>
<metaData id="138" type="java.util.HashMap">
<entry>
<key id="139" type="java.lang.String">DescriptiveData</key>
<value id="140" type="java.lang.String">Y</value>
</entry>
<entry>
<key id="141" type="java.lang.String">IsStaging</key>
<value id="142" type="java.lang.String">N</value>
</entry>
<entry>
<key id="143" type="java.lang.String">StageFile</key>
<value id="144" type="java.lang.String">N</value>
</entry>
<entry>
<key id="145" type="java.lang.String">VALIDATE_EXPRESSION</key>
<value id="146" type="java.lang.String">true</value>
</entry>
</metaData>
<name id="147">spSecurityLevelData</name>
<nearRealtimePublishing>false</nearRealtimePublishing>
<nearRealtimePublishingEvents id="148" type="java.util.ArrayList"/>
<publishingEvents id="149" type="java.util.ArrayList"/>
<rollbackOnError>false</rollbackOnError>
<saveVendorDataType>None</saveVendorDataType>
<streetLamp id="150">
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
</item>
<item id="151" type="com.j2fe.processing.MessageType">
<applicationName id="152">SECURITIESANDPROD</applicationName>
<businessEntity>false</businessEntity>
<businessFeed idref="0"/>
<caputureProcessMessage>false</caputureProcessMessage>
<commitMode>None</commitMode>
<createMarketRealTimeInd idref="12"/>
<dataLineageEnabled>false</dataLineageEnabled>
<endOfFileEvents id="153" type="java.util.ArrayList"/>
<isKeyStreaming>true</isKeyStreaming>
<isVDDB>true</isVDDB>
<mappingResource id="154">db://resource/mapping/standard&amp;poors/SP_XF_GR_SecurityRatings.mdx</mappingResource>
<metaData id="155" type="java.util.HashMap">
<entry>
<key id="156" type="java.lang.String">DescriptiveData</key>
<value id="157" type="java.lang.String">Y</value>
</entry>
<entry>
<key id="158" type="java.lang.String">IsStaging</key>
<value id="159" type="java.lang.String">N</value>
</entry>
<entry>
<key id="160" type="java.lang.String">StageFile</key>
<value id="161" type="java.lang.String">N</value>
</entry>
<entry>
<key id="162" type="java.lang.String">VALIDATE_EXPRESSION</key>
<value id="163" type="java.lang.String">true</value>
</entry>
</metaData>
<name id="164">spInstrumentToEntitySec</name>
<nearRealtimePublishing>false</nearRealtimePublishing>
<nearRealtimePublishingEvents id="165" type="java.util.ArrayList"/>
<publishingEvents id="166" type="java.util.ArrayList"/>
<rollbackOnError>false</rollbackOnError>
<saveVendorDataType>None</saveVendorDataType>
<streetLamp id="167">
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
</item>
</messageTypes>
<name id="168">S&amp;P_XF_GR_Security_Ratings</name>
</com.j2fe.processing.BusinessFeed>
</businessobject>
</goldensource-package>
