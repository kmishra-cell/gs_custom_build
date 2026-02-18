<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.07">
<package-comment/>
<businessobject displayString="Bloomberg_DL_Ratings" type="com.j2fe.processing.BusinessFeed">
<com.j2fe.processing.BusinessFeed id="0">
<dataSource id="1">
<businessFeeds id="2" type="java.util.HashSet">
<item idref="0" type="com.j2fe.processing.BusinessFeed"/>
</businessFeeds>
<id id="3">BB</id>
</dataSource>
<feedDefinition id="4">com/j2fe/feeds/bloomberg/getdata.xml</feedDefinition>
<fileDefinitions id="5" type="java.util.ArrayList">
<item id="6" type="com.j2fe.processing.FileDefinition">
<file id="7">credit_risk_fitch.out.gz.20*</file>
<group id="8">0</group>
<messageType id="9">
<applicationName id="10">SECURITIESANDPROD</applicationName>
<businessEntity>false</businessEntity>
<businessFeed idref="0"/>
<caputureProcessMessage>false</caputureProcessMessage>
<commitMode>None</commitMode>
<createMarketRealTimeInd id="11">false</createMarketRealTimeInd>
<dataLineageEnabled>false</dataLineageEnabled>
<endOfFileEvents id="12" type="java.util.ArrayList"/>
<isKeyStreaming>false</isKeyStreaming>
<isVDDB>false</isVDDB>
<mappingResource id="13">db://resource/mapping/BloombergRatings/BB_DL_CreditRisk_fitch.mdx</mappingResource>
<metaData id="14" type="java.util.HashMap"/>
<name id="15">BB_DL_CreditRisk_fitch</name>
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
<file id="20">credit_risk_fitch.dif.gz.20*</file>
<group idref="8"/>
<messageType idref="9"/>
</item>
<item id="21" type="com.j2fe.processing.FileDefinition">
<file id="22">credit_risk_moody.out.gz.20*</file>
<group idref="8"/>
<messageType id="23">
<applicationName id="24">SECURITIESANDPROD</applicationName>
<businessEntity>false</businessEntity>
<businessFeed idref="0"/>
<caputureProcessMessage>false</caputureProcessMessage>
<commitMode>None</commitMode>
<createMarketRealTimeInd idref="11"/>
<dataLineageEnabled>false</dataLineageEnabled>
<endOfFileEvents id="25" type="java.util.ArrayList"/>
<isKeyStreaming>false</isKeyStreaming>
<isVDDB>false</isVDDB>
<mappingResource id="26">db://resource/mapping/BloombergRatings/BB_DL_CreditRisk_moodys.mdx</mappingResource>
<metaData id="27" type="java.util.HashMap"/>
<name id="28">BB_DL_CreditRisk_moodys</name>
<nearRealtimePublishing>false</nearRealtimePublishing>
<nearRealtimePublishingEvents id="29" type="java.util.ArrayList"/>
<publishingEvents id="30" type="java.util.ArrayList"/>
<rollbackOnError>false</rollbackOnError>
<saveVendorDataType>None</saveVendorDataType>
<streetLamp id="31">
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
<item id="32" type="com.j2fe.processing.FileDefinition">
<file id="33">credit_risk_moody.dif.gz.20*</file>
<group idref="8"/>
<messageType idref="23"/>
</item>
<item id="34" type="com.j2fe.processing.FileDefinition">
<file id="35">credit_risk_ratings1.out.gz.20*</file>
<group idref="8"/>
<messageType id="36">
<applicationName id="37">SECURITIESANDPROD</applicationName>
<businessEntity>false</businessEntity>
<businessFeed idref="0"/>
<caputureProcessMessage>false</caputureProcessMessage>
<commitMode>None</commitMode>
<createMarketRealTimeInd idref="11"/>
<dataLineageEnabled>false</dataLineageEnabled>
<endOfFileEvents id="38" type="java.util.ArrayList"/>
<isKeyStreaming>false</isKeyStreaming>
<isVDDB>false</isVDDB>
<mappingResource id="39">db://resource/mapping/BloombergRatings/BB_DL_CreditRisk_JCR.mdx</mappingResource>
<metaData id="40" type="java.util.HashMap"/>
<name id="41">BB_DL_CreditRisk_jcr</name>
<nearRealtimePublishing>false</nearRealtimePublishing>
<nearRealtimePublishingEvents id="42" type="java.util.ArrayList"/>
<publishingEvents id="43" type="java.util.ArrayList"/>
<rollbackOnError>false</rollbackOnError>
<saveVendorDataType>None</saveVendorDataType>
<streetLamp id="44">
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
<item id="45" type="com.j2fe.processing.FileDefinition">
<file id="46">credit_risk_ratings1.dif.gz.20*</file>
<group idref="8"/>
<messageType idref="36"/>
</item>
<item id="47" type="com.j2fe.processing.FileDefinition">
<file id="48">credit_risk_ri.out.gz.20*</file>
<group idref="8"/>
<messageType id="49">
<businessEntity>false</businessEntity>
<businessFeed idref="0"/>
<caputureProcessMessage>false</caputureProcessMessage>
<commitMode>None</commitMode>
<createMarketRealTimeInd idref="11"/>
<dataLineageEnabled>false</dataLineageEnabled>
<endOfFileEvents id="50" type="java.util.ArrayList"/>
<isKeyStreaming>false</isKeyStreaming>
<isVDDB>false</isVDDB>
<mappingResource id="51">db://resource/mapping/BloombergRatings/BB_DL_CreditRisk_R&amp;I.mdx</mappingResource>
<metaData id="52" type="java.util.HashMap"/>
<name id="53">BB_DL_CreditRisk_R&amp;I</name>
<nearRealtimePublishing>false</nearRealtimePublishing>
<nearRealtimePublishingEvents id="54" type="java.util.ArrayList"/>
<publishingEvents id="55" type="java.util.ArrayList"/>
<rollbackOnError>false</rollbackOnError>
<saveVendorDataType>None</saveVendorDataType>
<streetLamp id="56">
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
<item id="57" type="com.j2fe.processing.FileDefinition">
<file id="58">credit_risk_ri.dif.gz.20*</file>
<group idref="8"/>
<messageType idref="49"/>
</item>
<item id="59" type="com.j2fe.processing.FileDefinition">
<file id="60">credit_risk_sp.out.gz.20*</file>
<group idref="8"/>
<messageType id="61">
<applicationName id="62">SECURITIESANDPROD</applicationName>
<businessEntity>false</businessEntity>
<businessFeed idref="0"/>
<caputureProcessMessage>false</caputureProcessMessage>
<commitMode>None</commitMode>
<createMarketRealTimeInd idref="11"/>
<dataLineageEnabled>false</dataLineageEnabled>
<endOfFileEvents id="63" type="java.util.ArrayList"/>
<isKeyStreaming>false</isKeyStreaming>
<isVDDB>false</isVDDB>
<mappingResource id="64">db://resource/mapping/BloombergRatings/BB_DL_CreditRisk_S&amp;P.mdx</mappingResource>
<metaData id="65" type="java.util.HashMap"/>
<name id="66">BB_DL_CreditRisk_S&amp;P</name>
<nearRealtimePublishing>false</nearRealtimePublishing>
<nearRealtimePublishingEvents id="67" type="java.util.ArrayList"/>
<publishingEvents id="68" type="java.util.ArrayList"/>
<rollbackOnError>false</rollbackOnError>
<saveVendorDataType>None</saveVendorDataType>
<streetLamp id="69">
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
<item id="70" type="com.j2fe.processing.FileDefinition">
<file id="71">credit_risk_sp.dif.gz.20*</file>
<group idref="8"/>
<messageType idref="61"/>
</item>
<item id="72" type="com.j2fe.processing.FileDefinition">
<file id="73">creditRiskMultiAgencyRatings.out.gz</file>
<group idref="8"/>
<messageType idref="36"/>
</item>
<item id="74" type="com.j2fe.processing.FileDefinition">
<file id="75">creditRiskMultiAgencyRatings.dif.gz.20*</file>
<group idref="8"/>
<messageType idref="36"/>
</item>
</fileDefinitions>
<grouping>false</grouping>
<messageTypes id="76" type="java.util.HashSet">
<item idref="49" type="com.j2fe.processing.MessageType"/>
<item idref="9" type="com.j2fe.processing.MessageType"/>
<item idref="61" type="com.j2fe.processing.MessageType"/>
<item idref="36" type="com.j2fe.processing.MessageType"/>
<item idref="23" type="com.j2fe.processing.MessageType"/>
</messageTypes>
<name id="77">Bloomberg_DL_Ratings</name>
</com.j2fe.processing.BusinessFeed>
</businessobject>
</goldensource-package>
