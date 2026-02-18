<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.07">
<package-comment/>
<businessobject displayString="S&amp;P_XF_GR_Entity_Ratings" type="com.j2fe.processing.BusinessFeed">
<com.j2fe.processing.BusinessFeed id="0">
<dataSource id="1">
<businessFeeds id="2" type="java.util.HashSet">
<item idref="0" type="com.j2fe.processing.BusinessFeed"/>
</businessFeeds>
<id id="3">S&amp;P</id>
</dataSource>
<description id="4">S&amp;P_XF_GR_Entity_Ratings</description>
<feedDefinition id="5">db://resource/xml/feeds/standardandpoors/select.xml</feedDefinition>
<fileDefinitions id="6" type="java.util.ArrayList">
<item id="7" type="com.j2fe.processing.FileDefinition">
<file id="8">spEntityLevelData*.entity</file>
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
<isVDDB>true</isVDDB>
<mappingResource id="14">db://resource/mapping/standard&amp;poors/SP_XF_GR_EntityRatings.omdx</mappingResource>
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
</metaData>
<name id="22">SP_XF_GR_EntityRatings</name>
<nearRealtimePublishing>false</nearRealtimePublishing>
<nearRealtimePublishingEvents id="23" type="java.util.ArrayList"/>
<publishingEvents id="24" type="java.util.ArrayList"/>
<rollbackOnError>false</rollbackOnError>
<saveVendorDataType>None</saveVendorDataType>
<streetLamp id="25">
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
<item id="26" type="com.j2fe.processing.FileDefinition">
<file id="27">spRatingIdentifier*.entity</file>
<group id="28">1</group>
<messageType idref="10"/>
</item>
<item id="29" type="com.j2fe.processing.FileDefinition">
<file id="30">spEntitySector*.entity</file>
<group id="31">5</group>
<messageType idref="10"/>
</item>
<item id="32" type="com.j2fe.processing.FileDefinition">
<file id="33">spInstrumentToEntity*.entity</file>
<group id="34">6</group>
<messageType idref="10"/>
</item>
<item id="35" type="com.j2fe.processing.FileDefinition">
<file id="36">spRatingData*.entity</file>
<group id="37">3</group>
<messageType idref="10"/>
</item>
<item id="38" type="com.j2fe.processing.FileDefinition">
<file id="39">spAssessmentData*.entity</file>
<group idref="37"/>
<messageType idref="10"/>
</item>
<item id="40" type="com.j2fe.processing.FileDefinition">
<file id="41">spAssessmentLevelData*.entity</file>
<group id="42">4</group>
<messageType idref="10"/>
</item>
<item id="43" type="com.j2fe.processing.FileDefinition">
<file id="44">spIndustryChar*.entity</file>
<group id="45">7</group>
<messageType idref="10"/>
</item>
<item id="46" type="com.j2fe.processing.FileDefinition">
<file id="47">spParticipants*.entity</file>
<group idref="34"/>
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
<mappingResource id="52">db://resource/mapping/standard&amp;poors/SP_XF_GR_EntityRatings.mdx</mappingResource>
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
</metaData>
<name id="60">spParticipants</name>
<nearRealtimePublishing>false</nearRealtimePublishing>
<nearRealtimePublishingEvents id="61" type="java.util.ArrayList"/>
<publishingEvents id="62" type="java.util.ArrayList"/>
<rollbackOnError>false</rollbackOnError>
<saveVendorDataType>None</saveVendorDataType>
<streetLamp id="63">
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
<item id="64" type="com.j2fe.processing.MessageType">
<applicationName id="65">SECURITIESANDPROD</applicationName>
<businessEntity>false</businessEntity>
<businessFeed idref="0"/>
<caputureProcessMessage>false</caputureProcessMessage>
<commitMode>None</commitMode>
<createMarketRealTimeInd idref="12"/>
<dataLineageEnabled>false</dataLineageEnabled>
<endOfFileEvents id="66" type="java.util.ArrayList"/>
<isKeyStreaming>true</isKeyStreaming>
<isVDDB>true</isVDDB>
<mappingResource id="67">db://resource/mapping/standard&amp;poors/SP_XF_GR_EntityRatings.mdx</mappingResource>
<metaData id="68" type="java.util.HashMap">
<entry>
<key id="69" type="java.lang.String">DescriptiveData</key>
<value id="70" type="java.lang.String">Y</value>
</entry>
<entry>
<key id="71" type="java.lang.String">IsStaging</key>
<value id="72" type="java.lang.String">N</value>
</entry>
<entry>
<key id="73" type="java.lang.String">StageFile</key>
<value id="74" type="java.lang.String">N</value>
</entry>
</metaData>
<name id="75">spAssessmentLevelData</name>
<nearRealtimePublishing>false</nearRealtimePublishing>
<nearRealtimePublishingEvents id="76" type="java.util.ArrayList"/>
<publishingEvents id="77" type="java.util.ArrayList"/>
<rollbackOnError>false</rollbackOnError>
<saveVendorDataType>None</saveVendorDataType>
<streetLamp id="78">
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
<item id="79" type="com.j2fe.processing.MessageType">
<applicationName id="80">SECURITIESANDPROD</applicationName>
<businessEntity>false</businessEntity>
<businessFeed idref="0"/>
<caputureProcessMessage>false</caputureProcessMessage>
<commitMode>None</commitMode>
<createMarketRealTimeInd idref="12"/>
<dataLineageEnabled>false</dataLineageEnabled>
<endOfFileEvents id="81" type="java.util.ArrayList"/>
<isKeyStreaming>true</isKeyStreaming>
<isVDDB>true</isVDDB>
<mappingResource id="82">db://resource/mapping/standard&amp;poors/SP_XF_GR_EntityRatings.mdx</mappingResource>
<metaData id="83" type="java.util.HashMap">
<entry>
<key id="84" type="java.lang.String">DescriptiveData</key>
<value id="85" type="java.lang.String">Y</value>
</entry>
<entry>
<key id="86" type="java.lang.String">IsStaging</key>
<value id="87" type="java.lang.String">N</value>
</entry>
<entry>
<key id="88" type="java.lang.String">StageFile</key>
<value id="89" type="java.lang.String">N</value>
</entry>
</metaData>
<name id="90">spRatingData</name>
<nearRealtimePublishing>false</nearRealtimePublishing>
<nearRealtimePublishingEvents id="91" type="java.util.ArrayList"/>
<publishingEvents id="92" type="java.util.ArrayList"/>
<rollbackOnError>false</rollbackOnError>
<saveVendorDataType>None</saveVendorDataType>
<streetLamp id="93">
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
<item id="94" type="com.j2fe.processing.MessageType">
<applicationName id="95">SECURITIESANDPROD</applicationName>
<businessEntity>false</businessEntity>
<businessFeed idref="0"/>
<caputureProcessMessage>false</caputureProcessMessage>
<commitMode>None</commitMode>
<createMarketRealTimeInd idref="12"/>
<dataLineageEnabled>false</dataLineageEnabled>
<endOfFileEvents id="96" type="java.util.ArrayList"/>
<isKeyStreaming>true</isKeyStreaming>
<isVDDB>true</isVDDB>
<mappingResource id="97">db://resource/mapping/standard&amp;poors/SP_XF_GR_EntityRatings.mdx</mappingResource>
<metaData id="98" type="java.util.HashMap">
<entry>
<key id="99" type="java.lang.String">DescriptiveData</key>
<value id="100" type="java.lang.String">Y</value>
</entry>
<entry>
<key id="101" type="java.lang.String">IsStaging</key>
<value id="102" type="java.lang.String">N</value>
</entry>
<entry>
<key id="103" type="java.lang.String">StageFile</key>
<value id="104" type="java.lang.String">N</value>
</entry>
</metaData>
<name id="105">spEntitySector</name>
<nearRealtimePublishing>false</nearRealtimePublishing>
<nearRealtimePublishingEvents id="106" type="java.util.ArrayList"/>
<publishingEvents id="107" type="java.util.ArrayList"/>
<rollbackOnError>false</rollbackOnError>
<saveVendorDataType>None</saveVendorDataType>
<streetLamp id="108">
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
<item id="109" type="com.j2fe.processing.MessageType">
<applicationName id="110">SECURITIESANDPROD</applicationName>
<businessEntity>false</businessEntity>
<businessFeed idref="0"/>
<caputureProcessMessage>false</caputureProcessMessage>
<commitMode>None</commitMode>
<createMarketRealTimeInd idref="12"/>
<dataLineageEnabled>false</dataLineageEnabled>
<endOfFileEvents id="111" type="java.util.ArrayList"/>
<isKeyStreaming>true</isKeyStreaming>
<isVDDB>true</isVDDB>
<mappingResource id="112">db://resource/mapping/standard&amp;poors/SP_XF_GR_EntityRatings.mdx</mappingResource>
<metaData id="113" type="java.util.HashMap">
<entry>
<key id="114" type="java.lang.String">DescriptiveData</key>
<value id="115" type="java.lang.String">Y</value>
</entry>
<entry>
<key id="116" type="java.lang.String">IsStaging</key>
<value id="117" type="java.lang.String">N</value>
</entry>
<entry>
<key id="118" type="java.lang.String">StageFile</key>
<value id="119" type="java.lang.String">N</value>
</entry>
</metaData>
<name id="120">spAssessmentData</name>
<nearRealtimePublishing>false</nearRealtimePublishing>
<nearRealtimePublishingEvents id="121" type="java.util.ArrayList"/>
<publishingEvents id="122" type="java.util.ArrayList"/>
<rollbackOnError>false</rollbackOnError>
<saveVendorDataType>None</saveVendorDataType>
<streetLamp id="123">
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
<item id="124" type="com.j2fe.processing.MessageType">
<applicationName id="125">SECURITIESANDPROD</applicationName>
<businessEntity>false</businessEntity>
<businessFeed idref="0"/>
<caputureProcessMessage>false</caputureProcessMessage>
<commitMode>None</commitMode>
<createMarketRealTimeInd idref="12"/>
<dataLineageEnabled>false</dataLineageEnabled>
<endOfFileEvents id="126" type="java.util.ArrayList"/>
<isKeyStreaming>true</isKeyStreaming>
<isVDDB>true</isVDDB>
<mappingResource id="127">db://resource/mapping/standard&amp;poors/SP_XF_GR_EntityRatings.mdx</mappingResource>
<metaData id="128" type="java.util.HashMap">
<entry>
<key id="129" type="java.lang.String">DescriptiveData</key>
<value id="130" type="java.lang.String">Y</value>
</entry>
<entry>
<key id="131" type="java.lang.String">IsStaging</key>
<value id="132" type="java.lang.String">N</value>
</entry>
<entry>
<key id="133" type="java.lang.String">StageFile</key>
<value id="134" type="java.lang.String">N</value>
</entry>
</metaData>
<name id="135">spIndustryChar</name>
<nearRealtimePublishing>false</nearRealtimePublishing>
<nearRealtimePublishingEvents id="136" type="java.util.ArrayList"/>
<publishingEvents id="137" type="java.util.ArrayList"/>
<rollbackOnError>false</rollbackOnError>
<saveVendorDataType>None</saveVendorDataType>
<streetLamp id="138">
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
<item id="139" type="com.j2fe.processing.MessageType">
<applicationName id="140">SECURITIESANDPROD</applicationName>
<businessEntity>false</businessEntity>
<businessFeed idref="0"/>
<caputureProcessMessage>false</caputureProcessMessage>
<commitMode>None</commitMode>
<createMarketRealTimeInd idref="12"/>
<dataLineageEnabled>false</dataLineageEnabled>
<endOfFileEvents id="141" type="java.util.ArrayList"/>
<isKeyStreaming>true</isKeyStreaming>
<isVDDB>true</isVDDB>
<mappingResource id="142">db://resource/mapping/standard&amp;poors/SP_XF_GR_EntityRatings.mdx</mappingResource>
<metaData id="143" type="java.util.HashMap">
<entry>
<key id="144" type="java.lang.String">DescriptiveData</key>
<value id="145" type="java.lang.String">Y</value>
</entry>
<entry>
<key id="146" type="java.lang.String">IsStaging</key>
<value id="147" type="java.lang.String">N</value>
</entry>
<entry>
<key id="148" type="java.lang.String">StageFile</key>
<value id="149" type="java.lang.String">N</value>
</entry>
</metaData>
<name id="150">spEntityLevelData</name>
<nearRealtimePublishing>false</nearRealtimePublishing>
<nearRealtimePublishingEvents id="151" type="java.util.ArrayList"/>
<publishingEvents id="152" type="java.util.ArrayList"/>
<rollbackOnError>false</rollbackOnError>
<saveVendorDataType>None</saveVendorDataType>
<streetLamp id="153">
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
<item id="154" type="com.j2fe.processing.MessageType">
<applicationName id="155">SECURITIESANDPROD</applicationName>
<businessEntity>false</businessEntity>
<businessFeed idref="0"/>
<caputureProcessMessage>false</caputureProcessMessage>
<commitMode>None</commitMode>
<createMarketRealTimeInd idref="12"/>
<dataLineageEnabled>false</dataLineageEnabled>
<endOfFileEvents id="156" type="java.util.ArrayList"/>
<isKeyStreaming>true</isKeyStreaming>
<isVDDB>true</isVDDB>
<mappingResource id="157">db://resource/mapping/standard&amp;poors/SP_XF_GR_EntityRatings.mdx</mappingResource>
<metaData id="158" type="java.util.HashMap">
<entry>
<key id="159" type="java.lang.String">DescriptiveData</key>
<value id="160" type="java.lang.String">Y</value>
</entry>
<entry>
<key id="161" type="java.lang.String">IsStaging</key>
<value id="162" type="java.lang.String">N</value>
</entry>
<entry>
<key id="163" type="java.lang.String">StageFile</key>
<value id="164" type="java.lang.String">N</value>
</entry>
</metaData>
<name id="165">spRatingIdentifier</name>
<nearRealtimePublishing>false</nearRealtimePublishing>
<nearRealtimePublishingEvents id="166" type="java.util.ArrayList"/>
<publishingEvents id="167" type="java.util.ArrayList"/>
<rollbackOnError>false</rollbackOnError>
<saveVendorDataType>None</saveVendorDataType>
<streetLamp id="168">
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
<item id="169" type="com.j2fe.processing.MessageType">
<applicationName id="170">SECURITIESANDPROD</applicationName>
<businessEntity>false</businessEntity>
<businessFeed idref="0"/>
<caputureProcessMessage>false</caputureProcessMessage>
<commitMode>None</commitMode>
<createMarketRealTimeInd idref="12"/>
<dataLineageEnabled>false</dataLineageEnabled>
<endOfFileEvents id="171" type="java.util.ArrayList"/>
<isKeyStreaming>true</isKeyStreaming>
<isVDDB>true</isVDDB>
<mappingResource id="172">db://resource/mapping/standard&amp;poors/SP_XF_GR_EntityRatings.mdx</mappingResource>
<metaData id="173" type="java.util.HashMap">
<entry>
<key id="174" type="java.lang.String">DescriptiveData</key>
<value id="175" type="java.lang.String">Y</value>
</entry>
<entry>
<key id="176" type="java.lang.String">IsStaging</key>
<value id="177" type="java.lang.String">N</value>
</entry>
<entry>
<key id="178" type="java.lang.String">StageFile</key>
<value id="179" type="java.lang.String">N</value>
</entry>
</metaData>
<name id="180">spInstrumentToEntity</name>
<nearRealtimePublishing>false</nearRealtimePublishing>
<nearRealtimePublishingEvents id="181" type="java.util.ArrayList"/>
<publishingEvents id="182" type="java.util.ArrayList"/>
<rollbackOnError>false</rollbackOnError>
<saveVendorDataType>None</saveVendorDataType>
<streetLamp id="183">
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
<name id="184">S&amp;P_XF_GR_Entity_Ratings</name>
</com.j2fe.processing.BusinessFeed>
</businessobject>
</goldensource-package>
