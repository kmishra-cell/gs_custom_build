<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<goldensource-package version="8.4.1.94REL">
<package-comment/>
<businessobject displayString="S&amp;P_RX_GI&amp;SF_Master&amp;Daily" type="com.j2fe.processing.BusinessFeed">
<com.j2fe.processing.BusinessFeed id="0">
<dataSource id="1">
<businessFeeds id="2" type="java.util.HashSet">
<item idref="0" type="com.j2fe.processing.BusinessFeed"/>
</businessFeeds>
<id id="3">S&amp;P</id>
</dataSource>
<feedDefinition id="4">db://resource/xml/feeds/standardandpoors/default.xml</feedDefinition>
<fileDefinitions id="5" type="java.util.ArrayList">
<item id="6" type="com.j2fe.processing.FileDefinition">
<file id="7">GISF_EIM_*</file>
<group id="8">1</group>
<messageType id="9">
<applicationName id="10">SECURITIESANDPROD</applicationName>
<businessEntity>false</businessEntity>
<businessFeed idref="0"/>
<caputureProcessMessage>false</caputureProcessMessage>
<commitMode>None</commitMode>
<createMarketRealTimeInd id="11">false</createMarketRealTimeInd>
<isKeyStreaming>true</isKeyStreaming>
<isVDDB>false</isVDDB>
<mappingResource id="12">db://resource/mapping/standard&amp;poors/SPGISFEntityIdentifiers.mdx</mappingResource>
<metaData id="13" type="java.util.HashMap"/>
<name id="14">SPGISFEntityIdentifiers</name>
<nearRealtimePublishing>false</nearRealtimePublishing>
<nearRealtimePublishingEvents id="15" type="java.util.ArrayList"/>
<publishingEvents id="16" type="java.util.ArrayList"/>
<rollbackOnError>false</rollbackOnError>
<saveVendorDataType>None</saveVendorDataType>
<streetLamp id="17">
<saveInputMessage>ERROR</saveInputMessage>
<saveNotifications>WARNING</saveNotifications>
<saveProcessedMessage>ERROR</saveProcessedMessage>
<saveTranslatedMessage>ERROR</saveTranslatedMessage>
<write>SUCCESS</write>
</streetLamp>
<syncPublishing>false</syncPublishing>
</messageType>
</item>
<item id="18" type="com.j2fe.processing.FileDefinition">
<file id="19">GISF_EID_*</file>
<group id="20">1</group>
<messageType idref="9"/>
</item>
<item id="21" type="com.j2fe.processing.FileDefinition">
<file id="22">GISF_ERM_*</file>
<group id="23">3</group>
<messageType id="24">
<applicationName id="25">SECURITIESANDPROD</applicationName>
<businessEntity>false</businessEntity>
<businessFeed idref="0"/>
<caputureProcessMessage>false</caputureProcessMessage>
<commitMode>None</commitMode>
<createMarketRealTimeInd idref="11"/>
<isKeyStreaming>true</isKeyStreaming>
<isVDDB>false</isVDDB>
<mappingResource id="26">db://resource/mapping/standard&amp;poors/SPGISFEntityRatings.omdx</mappingResource>
<metaData id="27" type="java.util.HashMap">
<entry>
<key id="28" type="java.lang.String">INCLData</key>
<value id="29" type="java.lang.String">Y</value>
</entry>
<entry>
<key id="30" type="java.lang.String">IssuerData</key>
<value id="31" type="java.lang.String">Y</value>
</entry>
</metaData>
<name id="32">SPGISFEntityRatings</name>
<nearRealtimePublishing>false</nearRealtimePublishing>
<nearRealtimePublishingEvents id="33" type="java.util.ArrayList"/>
<publishingEvents id="34" type="java.util.ArrayList"/>
<rollbackOnError>false</rollbackOnError>
<saveVendorDataType>None</saveVendorDataType>
<streetLamp id="35">
<saveInputMessage>ERROR</saveInputMessage>
<saveNotifications>WARNING</saveNotifications>
<saveProcessedMessage>ERROR</saveProcessedMessage>
<saveTranslatedMessage>ERROR</saveTranslatedMessage>
<write>SUCCESS</write>
</streetLamp>
<syncPublishing>false</syncPublishing>
</messageType>
</item>
<item id="36" type="com.j2fe.processing.FileDefinition">
<file id="37">GISF_ERD_*</file>
<group id="38">3</group>
<messageType idref="24"/>
</item>
<item id="39" type="com.j2fe.processing.FileDefinition">
<file id="40">GISF_IMM_*</file>
<group id="41">5</group>
<messageType id="42">
<applicationName id="43">SECURITIESANDPROD</applicationName>
<businessEntity>false</businessEntity>
<businessFeed idref="0"/>
<caputureProcessMessage>false</caputureProcessMessage>
<commitMode>None</commitMode>
<createMarketRealTimeInd idref="11"/>
<isKeyStreaming>true</isKeyStreaming>
<isVDDB>false</isVDDB>
<mappingResource id="44">db://resource/mapping/standard&amp;poors/SPGISFIssueMaturityRatings.mdx</mappingResource>
<metaData id="45" type="java.util.HashMap">
<entry>
<key id="46" type="java.lang.String">IssuerData</key>
<value id="47" type="java.lang.String">N</value>
</entry>
<entry>
<key id="48" type="java.lang.String">SecurityData</key>
<value id="49" type="java.lang.String">Y</value>
</entry>
</metaData>
<name id="50">SPGISFIssueMaturityRatings</name>
<nearRealtimePublishing>false</nearRealtimePublishing>
<nearRealtimePublishingEvents id="51" type="java.util.ArrayList"/>
<publishingEvents id="52" type="java.util.ArrayList"/>
<rollbackOnError>false</rollbackOnError>
<saveVendorDataType>None</saveVendorDataType>
<streetLamp id="53">
<saveInputMessage>ERROR</saveInputMessage>
<saveNotifications>WARNING</saveNotifications>
<saveProcessedMessage>ERROR</saveProcessedMessage>
<saveTranslatedMessage>ERROR</saveTranslatedMessage>
<write>SUCCESS</write>
</streetLamp>
<syncPublishing>false</syncPublishing>
</messageType>
</item>
<item id="54" type="com.j2fe.processing.FileDefinition">
<file id="55">GISF_IMD_*</file>
<group id="56">5</group>
<messageType idref="42"/>
</item>
<item id="57" type="com.j2fe.processing.FileDefinition">
<file id="58">GISF_IRM_*</file>
<group id="59">4</group>
<messageType id="60">
<applicationName id="61">SECURITIESANDPROD</applicationName>
<businessEntity>false</businessEntity>
<businessFeed idref="0"/>
<caputureProcessMessage>false</caputureProcessMessage>
<commitMode>None</commitMode>
<isKeyStreaming>true</isKeyStreaming>
<isVDDB>false</isVDDB>
<mappingResource id="62">db://resource/mapping/standard&amp;poors/SPGISFInstrumentRatings.mdx</mappingResource>
<metaData id="63" type="java.util.HashMap"/>
<name id="64">SPGISFInstrumentRatings</name>
<nearRealtimePublishing>false</nearRealtimePublishing>
<nearRealtimePublishingEvents id="65" type="java.util.ArrayList"/>
<publishingEvents id="66" type="java.util.ArrayList"/>
<rollbackOnError>false</rollbackOnError>
<saveVendorDataType>None</saveVendorDataType>
<streetLamp id="67">
<saveInputMessage>ERROR</saveInputMessage>
<saveNotifications>WARNING</saveNotifications>
<saveProcessedMessage>ERROR</saveProcessedMessage>
<saveTranslatedMessage>ERROR</saveTranslatedMessage>
<write>SUCCESS</write>
</streetLamp>
<syncPublishing>false</syncPublishing>
</messageType>
</item>
<item id="68" type="com.j2fe.processing.FileDefinition">
<file id="69">GISF_IRD_*</file>
<group id="70">4</group>
<messageType idref="60"/>
</item>
<item id="71" type="com.j2fe.processing.FileDefinition">
<file id="72">GISF_IPM_*</file>
<group id="73">2</group>
<messageType id="74">
<applicationName id="75">SECURITIESANDPROD</applicationName>
<businessEntity>false</businessEntity>
<businessFeed idref="0"/>
<caputureProcessMessage>false</caputureProcessMessage>
<commitMode>None</commitMode>
<isKeyStreaming>true</isKeyStreaming>
<isVDDB>false</isVDDB>
<mappingResource id="76">db://resource/mapping/standard&amp;poors/SPGISFParticipants.mdx</mappingResource>
<metaData id="77" type="java.util.HashMap"/>
<name id="78">SPGISFParticipants</name>
<nearRealtimePublishing>false</nearRealtimePublishing>
<nearRealtimePublishingEvents id="79" type="java.util.ArrayList"/>
<publishingEvents id="80" type="java.util.ArrayList"/>
<rollbackOnError>false</rollbackOnError>
<saveVendorDataType>None</saveVendorDataType>
<streetLamp id="81">
<saveInputMessage>ERROR</saveInputMessage>
<saveNotifications>WARNING</saveNotifications>
<saveProcessedMessage>ERROR</saveProcessedMessage>
<saveTranslatedMessage>ERROR</saveTranslatedMessage>
<write>SUCCESS</write>
</streetLamp>
<syncPublishing>false</syncPublishing>
</messageType>
</item>
<item id="82" type="com.j2fe.processing.FileDefinition">
<file id="83">GISF_ERS_*</file>
<group id="84">3</group>
<messageType idref="24"/>
</item>
<item id="85" type="com.j2fe.processing.FileDefinition">
<file id="86">GISF_IMS_*</file>
<group id="87">5</group>
<messageType idref="42"/>
</item>
<item id="88" type="com.j2fe.processing.FileDefinition">
<file id="89">GISF_IRS_*</file>
<group id="90">4</group>
<messageType idref="60"/>
</item>
</fileDefinitions>
<grouping>false</grouping>
<messageTypes id="91" type="java.util.HashSet">
<item idref="9" type="com.j2fe.processing.MessageType"/>
<item idref="60" type="com.j2fe.processing.MessageType"/>
<item idref="42" type="com.j2fe.processing.MessageType"/>
<item idref="74" type="com.j2fe.processing.MessageType"/>
<item idref="24" type="com.j2fe.processing.MessageType"/>
</messageTypes>
<name id="92">S&amp;P_RX_GI&amp;SF_Master&amp;Daily</name>
</com.j2fe.processing.BusinessFeed>
</businessobject>
</goldensource-package>
