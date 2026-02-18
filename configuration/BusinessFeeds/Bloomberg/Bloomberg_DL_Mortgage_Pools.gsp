<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.07">
<package-comment/>
<businessobject displayString="Bloomberg_DL_Mortgage_Pools" type="com.j2fe.processing.BusinessFeed">
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
<file id="7">mtge_canadian_namr.dif.gz.enc.20*</file>
<group id="8">2</group>
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
<mappingResource id="13">db://resource/mapping/Bloomberg/BBMortgagePools.omdx</mappingResource>
<metaData id="14" type="java.util.HashMap">
<entry>
<key id="15" type="java.lang.String">IssuerData</key>
<value id="16" type="java.lang.String">Y</value>
</entry>
<entry>
<key id="17" type="java.lang.String">SecurityData</key>
<value id="18" type="java.lang.String">Y</value>
</entry>
</metaData>
<name id="19">BBMortgagePools</name>
<nearRealtimePublishing>false</nearRealtimePublishing>
<nearRealtimePublishingEvents id="20" type="java.util.ArrayList"/>
<publishingEvents id="21" type="java.util.ArrayList"/>
<rollbackOnError>false</rollbackOnError>
<saveVendorDataType>None</saveVendorDataType>
<streetLamp id="22">
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
<item id="23" type="com.j2fe.processing.FileDefinition">
<file id="24">mtge_canadian_namr.out.gz.enc.20*</file>
<group id="25">1</group>
<messageType idref="9"/>
</item>
<item id="26" type="com.j2fe.processing.FileDefinition">
<file id="27">mtge_fhlmc_namr.dif.gz.enc.20*</file>
<group idref="8"/>
<messageType idref="9"/>
</item>
<item id="28" type="com.j2fe.processing.FileDefinition">
<file id="29">mtge_fhlmc_namr.out.gz.enc.20*</file>
<group idref="25"/>
<messageType idref="9"/>
</item>
<item id="30" type="com.j2fe.processing.FileDefinition">
<file id="31">mtge_fnma_namr.dif.gz.enc.20*</file>
<group idref="8"/>
<messageType idref="9"/>
</item>
<item id="32" type="com.j2fe.processing.FileDefinition">
<file id="33">mtge_fnma_namr.out.gz.enc.20*</file>
<group idref="25"/>
<messageType idref="9"/>
</item>
<item id="34" type="com.j2fe.processing.FileDefinition">
<file id="35">mtge_generic_namr.dif.gz.enc.20*</file>
<group idref="8"/>
<messageType idref="9"/>
</item>
<item id="36" type="com.j2fe.processing.FileDefinition">
<file id="37">mtge_generic_namr.out.gz.enc.20*</file>
<group idref="25"/>
<messageType idref="9"/>
</item>
<item id="38" type="com.j2fe.processing.FileDefinition">
<file id="39">mtge_gnma_namr.dif.gz.enc.20*</file>
<group idref="8"/>
<messageType idref="9"/>
</item>
<item id="40" type="com.j2fe.processing.FileDefinition">
<file id="41">mtge_gnma_namr.out.gz.enc.20*</file>
<group idref="25"/>
<messageType idref="9"/>
</item>
<item id="42" type="com.j2fe.processing.FileDefinition">
<file id="43">mtge_sba_namr.dif.gz.enc.20*</file>
<group idref="8"/>
<messageType idref="9"/>
</item>
<item id="44" type="com.j2fe.processing.FileDefinition">
<file id="45">mtge_sba_namr.out.gz.enc.20*</file>
<group idref="25"/>
<messageType idref="9"/>
</item>
<item id="46" type="com.j2fe.processing.FileDefinition">
<file id="47">mtge_tba_namr.dif.gz.enc.20*</file>
<group idref="8"/>
<messageType idref="9"/>
</item>
<item id="48" type="com.j2fe.processing.FileDefinition">
<file id="49">mtge_tba_namr.out.gz.enc.20*</file>
<group idref="25"/>
<messageType idref="9"/>
</item>
<item id="50" type="com.j2fe.processing.FileDefinition">
<file id="51">mtgeCanadianNamrV2.dif.gz.enc.20*</file>
<group idref="8"/>
<messageType idref="9"/>
</item>
<item id="52" type="com.j2fe.processing.FileDefinition">
<file id="53">mtgeCanadianNamrV2.out.gz.enc.20*</file>
<group idref="25"/>
<messageType idref="9"/>
</item>
<item id="54" type="com.j2fe.processing.FileDefinition">
<file id="55">mtgeFnmaNamrV2.dif.gz.enc.20*</file>
<group idref="8"/>
<messageType idref="9"/>
</item>
<item id="56" type="com.j2fe.processing.FileDefinition">
<file id="57">mtgeFnmaNamrV2.out.gz.enc.20*</file>
<group idref="25"/>
<messageType idref="9"/>
</item>
<item id="58" type="com.j2fe.processing.FileDefinition">
<file id="59">mtgeGenericNamrV2.dif.gz.enc.20*</file>
<group idref="8"/>
<messageType idref="9"/>
</item>
<item id="60" type="com.j2fe.processing.FileDefinition">
<file id="61">mtgeGenericNamrV2.out.gz.enc.20*</file>
<group idref="25"/>
<messageType idref="9"/>
</item>
<item id="62" type="com.j2fe.processing.FileDefinition">
<file id="63">mtgeGnmaNamrV2.dif.gz.enc.20*</file>
<group idref="8"/>
<messageType idref="9"/>
</item>
<item id="64" type="com.j2fe.processing.FileDefinition">
<file id="65">mtgeGnmaNamrV2.out.gz.enc.20*</file>
<group idref="25"/>
<messageType idref="9"/>
</item>
<item id="66" type="com.j2fe.processing.FileDefinition">
<file id="67">mtgeSbaNamrV2.dif.gz.enc.20*</file>
<group idref="8"/>
<messageType idref="9"/>
</item>
<item id="68" type="com.j2fe.processing.FileDefinition">
<file id="69">mtgeSbaNamrV2.out.gz.enc.20*</file>
<group idref="25"/>
<messageType idref="9"/>
</item>
<item id="70" type="com.j2fe.processing.FileDefinition">
<file id="71">mtgeTbaNamrV2.dif.gz.enc.20*</file>
<group idref="8"/>
<messageType idref="9"/>
</item>
<item id="72" type="com.j2fe.processing.FileDefinition">
<file id="73">mtgeTbaNamrV2.out.gz.enc.20*</file>
<group idref="25"/>
<messageType idref="9"/>
</item>
<item id="74" type="com.j2fe.processing.FileDefinition">
<file id="75">mtgeFhlmcNamrV3.dif.gz.enc.20*</file>
<group idref="8"/>
<messageType idref="9"/>
</item>
<item id="76" type="com.j2fe.processing.FileDefinition">
<file id="77">mtgeFhlmcNamrV3.out.gz.enc.20*</file>
<group idref="25"/>
<messageType idref="9"/>
</item>
<item id="78" type="com.j2fe.processing.FileDefinition">
<file id="79">mtgeFhlmcNamrV3_bbid.dif.gz.enc.20*</file>
<group idref="8"/>
<messageType idref="9"/>
</item>
<item id="80" type="com.j2fe.processing.FileDefinition">
<file id="81">mtgeFhlmcNamrV3_bbid.out.gz.enc.20*</file>
<group idref="25"/>
<messageType idref="9"/>
</item>
<item id="82" type="com.j2fe.processing.FileDefinition">
<file id="83">*gs*.out</file>
<group idref="25"/>
<messageType idref="9"/>
</item>
</fileDefinitions>
<grouping>false</grouping>
<messageTypes id="84" type="java.util.HashSet">
<item idref="9" type="com.j2fe.processing.MessageType"/>
</messageTypes>
<name id="85">Bloomberg_DL_Mortgage_Pools</name>
</com.j2fe.processing.BusinessFeed>
</businessobject>
</goldensource-package>
