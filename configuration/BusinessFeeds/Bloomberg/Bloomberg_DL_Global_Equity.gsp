<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.07">
<package-comment/>
<businessobject displayString="Bloomberg_DL_Global_Equity" type="com.j2fe.processing.BusinessFeed">
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
<file id="7">equity_euro.out.gz.enc.20*</file>
<group id="8">1</group>
<messageType id="9">
<applicationName id="10">SECURITIESANDPROD</applicationName>
<businessEntity>false</businessEntity>
<businessFeed idref="0"/>
<caputureProcessMessage>false</caputureProcessMessage>
<commitMode>None</commitMode>
<createMarketRealTimeInd id="11">false</createMarketRealTimeInd>
<dataLineageEnabled>false</dataLineageEnabled>
<endOfFileEvents id="12" type="java.util.ArrayList"/>
<isKeyStreaming>true</isKeyStreaming>
<isVDDB>true</isVDDB>
<mappingResource id="13">db://resource/mapping/Bloomberg/BBGlobalEquity.omdx</mappingResource>
<metaData id="14" type="java.util.HashMap"/>
<name id="15">BBGlobalEquity</name>
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
<saveNotifications>ERROR</saveNotifications>
<saveProcessedMessage>ERROR</saveProcessedMessage>
<saveTranslatedMessage>ERROR</saveTranslatedMessage>
<saveUnprocessedInputMessage>false</saveUnprocessedInputMessage>
</streetLamp>
<syncPublishing>false</syncPublishing>
</messageType>
</item>
<item id="19" type="com.j2fe.processing.FileDefinition">
<file id="20">equity_asia1.out.gz.enc.20*</file>
<group idref="8"/>
<messageType idref="9"/>
</item>
<item id="21" type="com.j2fe.processing.FileDefinition">
<file id="22">equity_asia2.out.gz.enc.20*</file>
<group idref="8"/>
<messageType idref="9"/>
</item>
<item id="23" type="com.j2fe.processing.FileDefinition">
<file id="24">equity_lamr.out.gz.enc.20*</file>
<group idref="8"/>
<messageType idref="9"/>
</item>
<item id="25" type="com.j2fe.processing.FileDefinition">
<file id="26">equity_namr.out.gz.enc.20*</file>
<group idref="8"/>
<messageType idref="9"/>
</item>
<item id="27" type="com.j2fe.processing.FileDefinition">
<file id="28">equity_euro.dif.gz.enc.20*</file>
<group id="29">2</group>
<messageType idref="9"/>
</item>
<item id="30" type="com.j2fe.processing.FileDefinition">
<file id="31">equity_asia1.dif.gz.enc.20*</file>
<group idref="29"/>
<messageType idref="9"/>
</item>
<item id="32" type="com.j2fe.processing.FileDefinition">
<file id="33">equity_asia2.dif.gz.enc.20*</file>
<group idref="29"/>
<messageType idref="9"/>
</item>
<item id="34" type="com.j2fe.processing.FileDefinition">
<file id="35">equity_lamr.dif.gz.enc.20*</file>
<group idref="29"/>
<messageType idref="9"/>
</item>
<item id="36" type="com.j2fe.processing.FileDefinition">
<file id="37">equity_namr.dif.gz.enc.20*</file>
<group idref="29"/>
<messageType idref="9"/>
</item>
<item id="38" type="com.j2fe.processing.FileDefinition">
<file id="39">equity_euro.out.gz.enc</file>
<group idref="8"/>
<messageType idref="9"/>
</item>
<item id="40" type="com.j2fe.processing.FileDefinition">
<file id="41">equity_asia1.out.gz.enc</file>
<group idref="8"/>
<messageType idref="9"/>
</item>
<item id="42" type="com.j2fe.processing.FileDefinition">
<file id="43">equity_asia2.out.gz.enc</file>
<group idref="8"/>
<messageType idref="9"/>
</item>
<item id="44" type="com.j2fe.processing.FileDefinition">
<file id="45">equity_lamr.out.gz.enc</file>
<group idref="8"/>
<messageType idref="9"/>
</item>
<item id="46" type="com.j2fe.processing.FileDefinition">
<file id="47">equity_namr.out.gz.enc</file>
<group idref="8"/>
<messageType idref="9"/>
</item>
<item id="48" type="com.j2fe.processing.FileDefinition">
<file id="49">equity_euro.dif.gz.enc</file>
<group idref="29"/>
<messageType idref="9"/>
</item>
<item id="50" type="com.j2fe.processing.FileDefinition">
<file id="51">equity_asia1.dif.gz.enc</file>
<group idref="29"/>
<messageType idref="9"/>
</item>
<item id="52" type="com.j2fe.processing.FileDefinition">
<file id="53">equity_asia2.dif.gz.enc</file>
<group idref="29"/>
<messageType idref="9"/>
</item>
<item id="54" type="com.j2fe.processing.FileDefinition">
<file id="55">equity_lamr.dif.gz.enc</file>
<group idref="29"/>
<messageType idref="9"/>
</item>
<item id="56" type="com.j2fe.processing.FileDefinition">
<file id="57">equity_namr.dif.gz.enc</file>
<group idref="29"/>
<messageType idref="9"/>
</item>
<item id="58" type="com.j2fe.processing.FileDefinition">
<file id="59">pfd_exch_namr.out.gz.enc.20*</file>
<group idref="8"/>
<messageType id="60">
<applicationName id="61">SECURITIESANDPROD</applicationName>
<businessEntity>false</businessEntity>
<businessFeed idref="0"/>
<caputureProcessMessage>false</caputureProcessMessage>
<commitMode>None</commitMode>
<dataLineageEnabled>false</dataLineageEnabled>
<endOfFileEvents id="62" type="java.util.ArrayList"/>
<isKeyStreaming>true</isKeyStreaming>
<isVDDB>true</isVDDB>
<mappingResource id="63">db://resource/mapping/Bloomberg/BBPreferredExchangeTraded.mdx</mappingResource>
<metaData id="64" type="java.util.HashMap"/>
<name id="65">BBPreferredExchangeTraded</name>
<nearRealtimePublishing>false</nearRealtimePublishing>
<nearRealtimePublishingEvents id="66" type="java.util.ArrayList"/>
<publishingEvents id="67" type="java.util.ArrayList"/>
<rollbackOnError>false</rollbackOnError>
<saveVendorDataType>None</saveVendorDataType>
<streetLamp id="68">
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
<item id="69" type="com.j2fe.processing.FileDefinition">
<file id="70">pfd_exch_namr.dif.gz.enc.20*</file>
<group idref="29"/>
<messageType idref="60"/>
</item>
<item id="71" type="com.j2fe.processing.FileDefinition">
<file id="72">pfd_exch_asia.out.gz.enc.20*</file>
<group idref="8"/>
<messageType idref="60"/>
</item>
<item id="73" type="com.j2fe.processing.FileDefinition">
<file id="74">pfd_exch_asia.dif.gz.enc.20*</file>
<group idref="29"/>
<messageType idref="60"/>
</item>
<item id="75" type="com.j2fe.processing.FileDefinition">
<file id="76">pfd_exch_lamr.out.gz.enc.20*</file>
<group idref="8"/>
<messageType idref="60"/>
</item>
<item id="77" type="com.j2fe.processing.FileDefinition">
<file id="78">pfd_exch_lamr.dif.gz.enc.20*</file>
<group idref="29"/>
<messageType idref="60"/>
</item>
<item id="79" type="com.j2fe.processing.FileDefinition">
<file id="80">pfd_exch_euro.out.gz.enc.20*</file>
<group idref="8"/>
<messageType idref="60"/>
</item>
<item id="81" type="com.j2fe.processing.FileDefinition">
<file id="82">pfd_exch_euro.dif.gz.enc.20*</file>
<group idref="29"/>
<messageType idref="60"/>
</item>
<item id="83" type="com.j2fe.processing.FileDefinition">
<file id="84">equity_euro.out.gz.20*</file>
<group idref="8"/>
<messageType idref="9"/>
</item>
<item id="85" type="com.j2fe.processing.FileDefinition">
<file id="86">equity_asia1.out.gz.20*</file>
<group idref="8"/>
<messageType idref="9"/>
</item>
<item id="87" type="com.j2fe.processing.FileDefinition">
<file id="88">equity_asia2.out.gz.20*</file>
<group idref="8"/>
<messageType idref="9"/>
</item>
<item id="89" type="com.j2fe.processing.FileDefinition">
<file id="90">equity_lamr.out.gz.20*</file>
<group idref="8"/>
<messageType idref="9"/>
</item>
<item id="91" type="com.j2fe.processing.FileDefinition">
<file id="92">equity_namr.out.gz.20*</file>
<group idref="8"/>
<messageType idref="9"/>
</item>
<item id="93" type="com.j2fe.processing.FileDefinition">
<file id="94">equity_euro.dif.gz.20*</file>
<group idref="29"/>
<messageType idref="9"/>
</item>
<item id="95" type="com.j2fe.processing.FileDefinition">
<file id="96">equity_asia1.dif.gz.20*</file>
<group idref="29"/>
<messageType idref="9"/>
</item>
<item id="97" type="com.j2fe.processing.FileDefinition">
<file id="98">equity_asia2.dif.gz.20*</file>
<group idref="29"/>
<messageType idref="9"/>
</item>
<item id="99" type="com.j2fe.processing.FileDefinition">
<file id="100">equity_lamr.dif.gz.20*</file>
<group idref="29"/>
<messageType idref="9"/>
</item>
<item id="101" type="com.j2fe.processing.FileDefinition">
<file id="102">equity_namr.dif.gz.20*</file>
<group idref="29"/>
<messageType idref="9"/>
</item>
<item id="103" type="com.j2fe.processing.FileDefinition">
<file id="104">equity_euro.out.gz</file>
<group idref="8"/>
<messageType idref="9"/>
</item>
<item id="105" type="com.j2fe.processing.FileDefinition">
<file id="106">equity_asia1.out.gz</file>
<group idref="8"/>
<messageType idref="9"/>
</item>
<item id="107" type="com.j2fe.processing.FileDefinition">
<file id="108">equity_asia2.out.gz</file>
<group idref="8"/>
<messageType idref="9"/>
</item>
<item id="109" type="com.j2fe.processing.FileDefinition">
<file id="110">equity_lamr.out.gz</file>
<group idref="8"/>
<messageType idref="9"/>
</item>
<item id="111" type="com.j2fe.processing.FileDefinition">
<file id="112">equity_namr.out.gz</file>
<group idref="8"/>
<messageType idref="9"/>
</item>
<item id="113" type="com.j2fe.processing.FileDefinition">
<file id="114">equity_euro.dif.gz</file>
<group idref="29"/>
<messageType idref="9"/>
</item>
<item id="115" type="com.j2fe.processing.FileDefinition">
<file id="116">equity_asia1.dif.gz</file>
<group idref="29"/>
<messageType idref="9"/>
</item>
<item id="117" type="com.j2fe.processing.FileDefinition">
<file id="118">equity_asia2.dif.gz</file>
<group idref="29"/>
<messageType idref="9"/>
</item>
<item id="119" type="com.j2fe.processing.FileDefinition">
<file id="120">equity_lamr.dif.gz</file>
<group idref="29"/>
<messageType idref="9"/>
</item>
<item id="121" type="com.j2fe.processing.FileDefinition">
<file id="122">equity_namr.dif.gz</file>
<group idref="29"/>
<messageType idref="9"/>
</item>
<item id="123" type="com.j2fe.processing.FileDefinition">
<file id="124">pfd_exch_namr.out.gz.20*</file>
<group idref="8"/>
<messageType idref="60"/>
</item>
<item id="125" type="com.j2fe.processing.FileDefinition">
<file id="126">pfd_exch_namr.dif.gz.20*</file>
<group idref="29"/>
<messageType idref="60"/>
</item>
<item id="127" type="com.j2fe.processing.FileDefinition">
<file id="128">pfd_exch_asia.out.gz.20*</file>
<group idref="8"/>
<messageType idref="60"/>
</item>
<item id="129" type="com.j2fe.processing.FileDefinition">
<file id="130">pfd_exch_asia.dif.gz.20*</file>
<group idref="29"/>
<messageType idref="60"/>
</item>
<item id="131" type="com.j2fe.processing.FileDefinition">
<file id="132">pfd_exch_lamr.out.gz.20*</file>
<group idref="8"/>
<messageType idref="60"/>
</item>
<item id="133" type="com.j2fe.processing.FileDefinition">
<file id="134">pfd_exch_lamr.dif.gz.20*</file>
<group idref="29"/>
<messageType idref="60"/>
</item>
<item id="135" type="com.j2fe.processing.FileDefinition">
<file id="136">pfd_exch_euro.out.gz.20*</file>
<group idref="8"/>
<messageType idref="60"/>
</item>
<item id="137" type="com.j2fe.processing.FileDefinition">
<file id="138">pfd_exch_euro.dif.gz.20*</file>
<group idref="29"/>
<messageType idref="60"/>
</item>
<item id="139" type="com.j2fe.processing.FileDefinition">
<file id="140">equity_asia1.px.gz.20*</file>
<group idref="8"/>
<messageType id="141">
<applicationName id="142">SECURITIESANDPROD</applicationName>
<businessEntity>false</businessEntity>
<businessFeed idref="0"/>
<caputureProcessMessage>false</caputureProcessMessage>
<commitMode>None</commitMode>
<createMarketRealTimeInd idref="11"/>
<dataLineageEnabled>false</dataLineageEnabled>
<endOfFileEvents id="143" type="java.util.ArrayList"/>
<isKeyStreaming>true</isKeyStreaming>
<isVDDB>false</isVDDB>
<mappingResource id="144">db://resource/mapping/Bloomberg/MHIBBGlobalEquityPrice.mdx</mappingResource>
<metaData id="145" type="java.util.HashMap"/>
<name id="146">BBGlobalEquityPrice</name>
<nearRealtimePublishing>false</nearRealtimePublishing>
<nearRealtimePublishingEvents id="147" type="java.util.ArrayList"/>
<publishingEvents id="148" type="java.util.ArrayList"/>
<rollbackOnError>false</rollbackOnError>
<saveVendorDataType>None</saveVendorDataType>
<streetLamp id="149">
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
<item id="150" type="com.j2fe.processing.FileDefinition">
<file id="151">equity_asia2.px.gz.20*</file>
<group idref="8"/>
<messageType idref="141"/>
</item>
<item id="152" type="com.j2fe.processing.FileDefinition">
<file id="153">*gs*.out</file>
<group idref="8"/>
<messageType idref="9"/>
</item>
</fileDefinitions>
<grouping>false</grouping>
<messageTypes id="154" type="java.util.HashSet">
<item idref="141" type="com.j2fe.processing.MessageType"/>
<item id="155" type="com.j2fe.processing.MessageType">
<applicationName id="156">SECURITIESANDPROD</applicationName>
<businessEntity>false</businessEntity>
<businessFeed idref="0"/>
<caputureProcessMessage>false</caputureProcessMessage>
<commitMode>None</commitMode>
<createMarketRealTimeInd idref="11"/>
<dataLineageEnabled>false</dataLineageEnabled>
<endOfFileEvents id="157" type="java.util.ArrayList"/>
<isKeyStreaming>false</isKeyStreaming>
<isVDDB>false</isVDDB>
<mappingResource id="158">db://resource/mapping/Bloomberg/BBGlobalEquityShortSaleCircuitBreak.mdx</mappingResource>
<metaData id="159" type="java.util.HashMap"/>
<name id="160">BBGlobalEquityShortSaleCircuitBreak</name>
<nearRealtimePublishing>false</nearRealtimePublishing>
<nearRealtimePublishingEvents id="161" type="java.util.ArrayList"/>
<publishingEvents id="162" type="java.util.ArrayList"/>
<rollbackOnError>false</rollbackOnError>
<saveVendorDataType>None</saveVendorDataType>
<streetLamp id="163">
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
</item>
<item idref="60" type="com.j2fe.processing.MessageType"/>
<item id="164" type="com.j2fe.processing.MessageType">
<applicationName id="165">SECURITIESANDPROD</applicationName>
<businessEntity>false</businessEntity>
<businessFeed idref="0"/>
<caputureProcessMessage>false</caputureProcessMessage>
<commitMode>None</commitMode>
<createMarketRealTimeInd idref="11"/>
<dataLineageEnabled>false</dataLineageEnabled>
<endOfFileEvents id="166" type="java.util.ArrayList"/>
<isKeyStreaming>false</isKeyStreaming>
<isVDDB>false</isVDDB>
<mappingResource id="167">db://resource/mapping/Bloomberg/BBGlobalEquityShortSale.mdx</mappingResource>
<metaData id="168" type="java.util.HashMap"/>
<name id="169">BBGlobalEquityShortSale</name>
<nearRealtimePublishing>false</nearRealtimePublishing>
<nearRealtimePublishingEvents id="170" type="java.util.ArrayList"/>
<publishingEvents id="171" type="java.util.ArrayList"/>
<rollbackOnError>false</rollbackOnError>
<saveVendorDataType>None</saveVendorDataType>
<streetLamp id="172">
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
</item>
<item idref="9" type="com.j2fe.processing.MessageType"/>
</messageTypes>
<name id="173">Bloomberg_DL_Global_Equity</name>
</com.j2fe.processing.BusinessFeed>
</businessobject>
</goldensource-package>
