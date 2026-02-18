<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<goldensource-package version="10.0.0.02">
    <package-comment/>
    <businessobject displayString="Bloomberg_DL_Currencies" type="com.j2fe.processing.BusinessFeed">
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
                    <file id="7">curncy_euro.out.gz.enc.20*</file>
                    <group id="8">1</group>
                    <messageType id="9">
                        <applicationName id="10">SECURITIESANDPROD</applicationName>
                        <businessEntity>false</businessEntity>
                        <businessFeed idref="0"/>
                        <caputureProcessMessage>false</caputureProcessMessage>
                        <commitMode>None</commitMode>
                        <dataLineageEnabled>false</dataLineageEnabled>
                        <endOfFileEvents id="11" type="java.util.ArrayList"/>
                        <isKeyStreaming>true</isKeyStreaming>
                        <isVDDB>true</isVDDB>
                        <mappingResource id="12">db://resource/mapping/Bloomberg/BBCurrency.mdx</mappingResource>
                        <metaData id="13" type="java.util.HashMap"/>
                        <name id="14">BBCurrency</name>
                        <nearRealtimePublishing>false</nearRealtimePublishing>
                        <nearRealtimePublishingEvents id="15" type="java.util.ArrayList"/>
                        <publishingEvents id="16" type="java.util.ArrayList"/>
                        <rollbackOnError>false</rollbackOnError>
                        <saveVendorDataType>None</saveVendorDataType>
                        <streetLamp id="17">
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
                <item id="18" type="com.j2fe.processing.FileDefinition">
                    <file id="19">curncy_namr.out.gz.enc.20*</file>
                    <group idref="8"/>
                    <messageType idref="9"/>
                </item>
                <item id="20" type="com.j2fe.processing.FileDefinition">
                    <file id="21">curncy_asia1.out.gz.enc.20*</file>
                    <group idref="8"/>
                    <messageType idref="9"/>
                </item>
                <item id="22" type="com.j2fe.processing.FileDefinition">
                    <file id="23">curncy_asia2.out.gz.enc.20*</file>
                    <group idref="8"/>
                    <messageType idref="9"/>
                </item>
                <item id="24" type="com.j2fe.processing.FileDefinition">
                    <file id="25">curncy_lamr.out.gz.enc.20*</file>
                    <group idref="8"/>
                    <messageType idref="9"/>
                </item>
            </fileDefinitions>
            <grouping>false</grouping>
            <messageTypes id="26" type="java.util.HashSet">
                <item idref="9" type="com.j2fe.processing.MessageType"/>
            </messageTypes>
            <name id="27">Bloomberg_DL_Currencies</name>
        </com.j2fe.processing.BusinessFeed>
    </businessobject>
</goldensource-package>
