<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<goldensource-package version="10.0.0.02">
    <package-comment/>
    <businessobject displayString="Bloomberg_EXT_High_Quality_Liquid_Assets" type="com.j2fe.processing.BusinessFeed">
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
                        <isKeyStreaming>true</isKeyStreaming>
                        <isVDDB>false</isVDDB>
                        <mappingResource id="13">db://resource/mapping/Bloomberg/BBXT_HQLA.mdx</mappingResource>
                        <metaData id="14" type="java.util.HashMap"/>
                        <name id="15">BBXT_HQLA</name>
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
                    <file id="20">equity_amer.out.gz.enc.20*</file>
                    <group idref="8"/>
                    <messageType idref="9"/>
                </item>
                <item id="21" type="com.j2fe.processing.FileDefinition">
                    <file id="22">equity_asia.out.gz.enc.20*</file>
                    <group idref="8"/>
                    <messageType idref="9"/>
                </item>
                <item id="23" type="com.j2fe.processing.FileDefinition">
                    <file id="24">equity_ext_hqla_amer.out.gz.enc.20*</file>
                    <group id="25">1</group>
                    <messageType idref="9"/>
                </item>
                <item id="26" type="com.j2fe.processing.FileDefinition">
                    <file id="27">equity_ext_hqla_euro.out.gz.enc.20*</file>
                    <group idref="25"/>
                    <messageType idref="9"/>
                </item>
                <item id="28" type="com.j2fe.processing.FileDefinition">
                    <file id="29">equity_ext_hqla_asia.out.gz.enc.20*</file>
                    <group idref="25"/>
                    <messageType idref="9"/>
                </item>
                <item id="30" type="com.j2fe.processing.FileDefinition">
                    <file id="31">fixedincome_ext_hqla_amer.dif.gz.enc.20*</file>
                    <group id="32">2</group>
                    <messageType idref="9"/>
                </item>
                <item id="33" type="com.j2fe.processing.FileDefinition">
                    <file id="34">fixedincome_ext_hqla_euro.dif.gz.enc.20*</file>
                    <group idref="32"/>
                    <messageType idref="9"/>
                </item>
                <item id="35" type="com.j2fe.processing.FileDefinition">
                    <file id="36">fixedincome_ext_hqla_asia.dif.gz.enc.20*</file>
                    <group idref="32"/>
                    <messageType idref="9"/>
                </item>
                <item id="37" type="com.j2fe.processing.FileDefinition">
                    <file id="38">mtge_cmo_ext_hqla_euro.dif.gz.enc.20*</file>
                    <group id="39">3</group>
                    <messageType idref="9"/>
                </item>
                <item id="40" type="com.j2fe.processing.FileDefinition">
                    <file id="41">mtge_cmo_ext_hqla_asia.dif.gz.enc.20*</file>
                    <group idref="39"/>
                    <messageType idref="9"/>
                </item>
                <item id="42" type="com.j2fe.processing.FileDefinition">
                    <file id="43">mtge_cmo_ext_hqla_amer.dif.gz.enc.20*</file>
                    <group idref="39"/>
                    <messageType idref="9"/>
                </item>
                <item id="44" type="com.j2fe.processing.FileDefinition">
                    <file id="45">muni_ext_hqla_amer.dif.gz.enc.20*</file>
                    <group id="46">4</group>
                    <messageType idref="9"/>
                </item>
                <item id="47" type="com.j2fe.processing.FileDefinition">
                    <file id="48">muni_ext_hqla_euro.dif.gz.enc.20*</file>
                    <group idref="46"/>
                    <messageType idref="9"/>
                </item>
                <item id="49" type="com.j2fe.processing.FileDefinition">
                    <file id="50">muni_ext_hqla_asia.dif.gz.enc.20*</file>
                    <group idref="46"/>
                    <messageType idref="9"/>
                </item>
                <item id="51" type="com.j2fe.processing.FileDefinition">
                    <file id="52">mtge_pools_ext_hqla_amer.dif.gz.enc.20*</file>
                    <group id="53">5</group>
                    <messageType idref="9"/>
                </item>
                <item id="54" type="com.j2fe.processing.FileDefinition">
                    <file id="55">mtge_pools_ext_hqla_euro.dif.gz.enc.20*</file>
                    <group idref="53"/>
                    <messageType idref="9"/>
                </item>
                <item id="56" type="com.j2fe.processing.FileDefinition">
                    <file id="57">mtge_pools_ext_hqla_asia.dif.gz.enc.20*</file>
                    <group idref="53"/>
                    <messageType idref="9"/>
                </item>
                <item id="58" type="com.j2fe.processing.FileDefinition">
                    <file id="59">gs000*.out</file>
                    <group id="60">6</group>
                    <messageType idref="9"/>
                </item>
            </fileDefinitions>
            <grouping>false</grouping>
            <messageTypes id="61" type="java.util.HashSet">
                <item idref="9" type="com.j2fe.processing.MessageType"/>
            </messageTypes>
            <name id="62">Bloomberg_EXT_High_Quality_Liquid_Assets</name>
        </com.j2fe.processing.BusinessFeed>
    </businessobject>
</goldensource-package>
