<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<goldensource-package version="10.0.0.02">
    <package-comment/>
    <businessobject displayString="Bloomberg_DL_Global_Preferred" type="com.j2fe.processing.BusinessFeed">
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
                    <file id="7">pfd_euro.dif.gz.enc.20*</file>
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
                        <mappingResource id="13">db://resource/mapping/Bloomberg/BBPreferreds.omdx</mappingResource>
                        <metaData id="14" type="java.util.HashMap"/>
                        <name id="15">BBPreferreds</name>
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
                    <file id="20">pfd_euro.out.gz.enc.20*</file>
                    <group id="21">1</group>
                    <messageType idref="9"/>
                </item>
                <item id="22" type="com.j2fe.processing.FileDefinition">
                    <file id="23">pfd_namr.out.gz.enc.20*</file>
                    <group idref="21"/>
                    <messageType idref="9"/>
                </item>
                <item id="24" type="com.j2fe.processing.FileDefinition">
                    <file id="25">pfd_asia.dif.gz.enc.20*</file>
                    <group idref="8"/>
                    <messageType idref="9"/>
                </item>
                <item id="26" type="com.j2fe.processing.FileDefinition">
                    <file id="27">pfd_asia.out.gz.enc.20*</file>
                    <group idref="21"/>
                    <messageType idref="9"/>
                </item>
                <item id="28" type="com.j2fe.processing.FileDefinition">
                    <file id="29">pfd_lamr.dif.gz.enc.20*</file>
                    <group idref="8"/>
                    <messageType idref="9"/>
                </item>
                <item id="30" type="com.j2fe.processing.FileDefinition">
                    <file id="31">pfd_lamr.out.gz.enc.20*</file>
                    <group idref="21"/>
                    <messageType idref="9"/>
                </item>
                <item id="32" type="com.j2fe.processing.FileDefinition">
                    <file id="33">pfd_euro.dif.gz.20*</file>
                    <group idref="8"/>
                    <messageType idref="9"/>
                </item>
                <item id="34" type="com.j2fe.processing.FileDefinition">
                    <file id="35">pfd_euro.out.gz.20*</file>
                    <group idref="21"/>
                    <messageType idref="9"/>
                </item>
                <item id="36" type="com.j2fe.processing.FileDefinition">
                    <file id="37">pfd_namr.out.gz.20*</file>
                    <group idref="21"/>
                    <messageType idref="9"/>
                </item>
                <item id="38" type="com.j2fe.processing.FileDefinition">
                    <file id="39">pfd_asia.dif.gz.20*</file>
                    <group idref="8"/>
                    <messageType idref="9"/>
                </item>
                <item id="40" type="com.j2fe.processing.FileDefinition">
                    <file id="41">pfd_asia.out.gz.20*</file>
                    <group idref="21"/>
                    <messageType idref="9"/>
                </item>
                <item id="42" type="com.j2fe.processing.FileDefinition">
                    <file id="43">pfd_lamr.dif.gz.20*</file>
                    <group idref="8"/>
                    <messageType idref="9"/>
                </item>
                <item id="44" type="com.j2fe.processing.FileDefinition">
                    <file id="45">pfd_lamr.out.gz.20*</file>
                    <group idref="21"/>
                    <messageType idref="9"/>
                </item>
            </fileDefinitions>
            <grouping>false</grouping>
            <messageTypes id="46" type="java.util.HashSet">
                <item idref="9" type="com.j2fe.processing.MessageType"/>
            </messageTypes>
            <name id="47">Bloomberg_DL_Global_Preferred</name>
        </com.j2fe.processing.BusinessFeed>
    </businessobject>
</goldensource-package>
