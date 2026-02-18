<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.04">
<package-comment/>
<businessobject displayString="MIZ_CUSTOM" type="com.j2fe.processing.DataSource">
<com.j2fe.processing.DataSource id="0">
<businessFeeds id="1" type="java.util.HashSet">
<item id="2" type="com.j2fe.processing.BusinessFeed">
<dataSource idref="0"/>
<description id="3">New for MHEU Migration</description>
<feedDefinition id="4">db://resource/xml/feeds/LineByLine.xml</feedDefinition>
<fileDefinitions id="5" type="java.util.ArrayList"/>
<grouping>false</grouping>
<messageTypes id="6" type="java.util.HashSet"/>
<name id="7">MHEU_Migration</name>
</item>
<item id="8" type="com.j2fe.processing.BusinessFeed">
<dataSource idref="0"/>
<feedDefinition id="9">db://resource/mapping/Migration/Splitter/SkipHeaderSplitter.xml</feedDefinition>
<fileDefinitions id="10" type="java.util.ArrayList"/>
<grouping>false</grouping>
<messageTypes id="11" type="java.util.HashSet"/>
<name id="12">Locking</name>
</item>
<item id="13" type="com.j2fe.processing.BusinessFeed">
<dataSource idref="0"/>
<feedDefinition id="14">db://resource/xml/feeds/bloomberg/getdata.xml</feedDefinition>
<fileDefinitions id="15" type="java.util.ArrayList"/>
<grouping>false</grouping>
<messageTypes id="16" type="java.util.HashSet"/>
<name id="17">RepoAgreement_Migration</name>
</item>
<item id="18" type="com.j2fe.processing.BusinessFeed">
<dataSource idref="0"/>
<description id="19">MTNASSETunvalidated</description>
<feedDefinition id="20">db://resource/xml/feeds/xml.xml</feedDefinition>
<fileDefinitions id="21" type="java.util.ArrayList"/>
<grouping>false</grouping>
<messageTypes id="22" type="java.util.HashSet"/>
<name id="23">MTNASSETunvalidated</name>
</item>
<item id="24" type="com.j2fe.processing.BusinessFeed">
<dataSource idref="0"/>
<feedDefinition id="25">db://resource/xml/feeds/select.xml</feedDefinition>
<fileDefinitions id="26" type="java.util.ArrayList"/>
<grouping>false</grouping>
<messageTypes id="27" type="java.util.HashSet"/>
<name id="28">MIGRATION_CC</name>
</item>
<item id="29" type="com.j2fe.processing.BusinessFeed">
<dataSource idref="0"/>
<feedDefinition id="30">db://resource/xml/feeds/xml.xml</feedDefinition>
<fileDefinitions id="31" type="java.util.ArrayList"/>
<grouping>false</grouping>
<messageTypes id="32" type="java.util.HashSet"/>
<name id="33">MizuhoLDAPSynchronization</name>
</item>
<item id="34" type="com.j2fe.processing.BusinessFeed">
<dataSource idref="0"/>
<description id="35">Asset data from ProductMaster system in MHSC</description>
<feedDefinition id="36">db://resource/xml/feeds/xml.xml</feedDefinition>
<fileDefinitions id="37" type="java.util.ArrayList"/>
<grouping>false</grouping>
<messageTypes id="38" type="java.util.HashSet"/>
<name id="39">ProductMasterAsset</name>
</item>
<item id="40" type="com.j2fe.processing.BusinessFeed">
<dataSource idref="0"/>
<description id="41">Asset data from CDW in the event of a GS major outage</description>
<feedDefinition id="42">db://resource/xml/feeds/xml.xml</feedDefinition>
<fileDefinitions id="43" type="java.util.ArrayList"/>
<grouping>false</grouping>
<messageTypes id="44" type="java.util.HashSet"/>
<name id="45">GSTacticalAssetReLive</name>
</item>
<item id="46" type="com.j2fe.processing.BusinessFeed">
<dataSource idref="0"/>
<description id="47">Legal Entity message from Fenergo</description>
<feedDefinition id="48">db://resource/xml/feeds/xml.xml</feedDefinition>
<fileDefinitions id="49" type="java.util.ArrayList"/>
<grouping>false</grouping>
<messageTypes id="50" type="java.util.HashSet"/>
<name id="51">FenergoLegalEntity</name>
</item>
<item id="52" type="com.j2fe.processing.BusinessFeed">
<dataSource idref="0"/>
<description id="53">Tokyo LiquidityReport file to store Expected Maturity Date for MTN.</description>
<feedDefinition id="54">db://resource/xml/feeds/LineByLine.xml</feedDefinition>
<fileDefinitions id="55" type="java.util.ArrayList"/>
<grouping>false</grouping>
<messageTypes id="56" type="java.util.HashSet"/>
<name id="57">MTNExpectedMaturityDate</name>
</item>
<item id="58" type="com.j2fe.processing.BusinessFeed">
<dataSource idref="0"/>
<feedDefinition id="59">db://resource/xml/feeds/Mizuho/cmfSOIStatement.xml</feedDefinition>
<fileDefinitions id="60" type="java.util.ArrayList"/>
<grouping>false</grouping>
<messageTypes id="61" type="java.util.HashSet"/>
<name id="62">cmfSOIStatement</name>
</item>
<item id="63" type="com.j2fe.processing.BusinessFeed">
<dataSource idref="0"/>
<feedDefinition id="64">db://resource/xml/feeds/Mizuho/taxonomy_csv.xml</feedDefinition>
<fileDefinitions id="65" type="java.util.ArrayList"/>
<grouping>false</grouping>
<messageTypes id="66" type="java.util.HashSet"/>
<name id="67">MHI_taxonomy</name>
</item>
<item id="68" type="com.j2fe.processing.BusinessFeed">
<dataSource idref="0"/>
<description id="69">MurexSOI</description>
<feedDefinition id="70">db://resource/CSTM/feed/MIZLineByLine.xml</feedDefinition>
<fileDefinitions id="71" type="java.util.ArrayList"/>
<grouping>false</grouping>
<messageTypes id="72" type="java.util.HashSet"/>
<name id="73">MurexSOI</name>
</item>
<item id="74" type="com.j2fe.processing.BusinessFeed">
<dataSource idref="0"/>
<description id="75">ICE Pay Date/Record Date feed daily in csv format</description>
<feedDefinition id="76">db://resource/xml/feeds/select.xml</feedDefinition>
<fileDefinitions id="77" type="java.util.ArrayList"/>
<grouping>false</grouping>
<messageTypes id="78" type="java.util.HashSet"/>
<name id="79">ICE</name>
</item>
<item id="80" type="com.j2fe.processing.BusinessFeed">
<dataSource idref="0"/>
<feedDefinition id="81">db://resource/xml/feeds/Mizuho/cmfDataRequest.xml</feedDefinition>
<fileDefinitions id="82" type="java.util.ArrayList"/>
<grouping>false</grouping>
<messageTypes id="83" type="java.util.HashSet">
<item id="84" type="com.j2fe.processing.MessageType">
<businessEntity>false</businessEntity>
<businessFeed idref="80"/>
<caputureProcessMessage>false</caputureProcessMessage>
<commitMode>None</commitMode>
<createMarketRealTimeInd id="85">false</createMarketRealTimeInd>
<dataLineageEnabled>false</dataLineageEnabled>
<endOfFileEvents id="86" type="java.util.ArrayList"/>
<isKeyStreaming>false</isKeyStreaming>
<isVDDB>false</isVDDB>
<mappingResource id="87">db://resource/mapping/Mizuho/cmfDataRequest.mdx</mappingResource>
<metaData id="88" type="java.util.HashMap"/>
<name id="89">cmfDataRequest</name>
<nearRealtimePublishing>false</nearRealtimePublishing>
<nearRealtimePublishingEvents id="90" type="java.util.ArrayList"/>
<publishingEvents id="91" type="java.util.ArrayList"/>
<rollbackOnError>false</rollbackOnError>
<saveVendorDataType>None</saveVendorDataType>
<streetLamp id="92">
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
</messageTypes>
<name id="93">cmfDataRequest</name>
</item>
<item id="94" type="com.j2fe.processing.BusinessFeed">
<dataSource idref="0"/>
<description id="95">Issuer data from CDW in the event of a GS major outage</description>
<feedDefinition id="96">db://resource/xml/feeds/xml.xml</feedDefinition>
<fileDefinitions id="97" type="java.util.ArrayList"/>
<grouping>false</grouping>
<messageTypes id="98" type="java.util.HashSet"/>
<name id="99">GSTacticalIssuerReLive</name>
</item>
<item id="100" type="com.j2fe.processing.BusinessFeed">
<dataSource idref="0"/>
<feedDefinition id="101">db://resource/xml/feeds/bloomberg/getdata.xml</feedDefinition>
<fileDefinitions id="102" type="java.util.ArrayList"/>
<grouping>false</grouping>
<messageTypes id="103" type="java.util.HashSet"/>
<name id="104">MHI_HQLA</name>
</item>
<item id="105" type="com.j2fe.processing.BusinessFeed">
<dataSource idref="0"/>
<feedDefinition id="106">db://resource/mapping/Migration/Splitter/DataMigrationSplitter.xml</feedDefinition>
<fileDefinitions id="107" type="java.util.ArrayList"/>
<grouping>false</grouping>
<messageTypes id="108" type="java.util.HashSet"/>
<name id="109">Migration</name>
</item>
</businessFeeds>
<id id="110">MIZ_CUSTOM</id>
<name id="111">MIZ_CUSTOM</name>
<requestTypes id="112" type="java.util.HashSet"/>
</com.j2fe.processing.DataSource>
</businessobject>
</goldensource-package>
