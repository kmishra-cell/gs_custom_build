<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<goldensource-package version="10.0.0.02">
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
                        <mappingResource id="14">db://resource/mapping/standard&amp;poors/SP_XF_GR_SecurityRatings.mdx</mappingResource>
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
                        <name id="24">spInstrumentLevelData</name>
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
                    <messageType id="31">
                        <applicationName id="32">SECURITIESANDPROD</applicationName>
                        <businessEntity>false</businessEntity>
                        <businessFeed idref="0"/>
                        <caputureProcessMessage>false</caputureProcessMessage>
                        <commitMode>None</commitMode>
                        <createMarketRealTimeInd idref="12"/>
                        <dataLineageEnabled>false</dataLineageEnabled>
                        <endOfFileEvents id="33" type="java.util.ArrayList"/>
                        <isKeyStreaming>true</isKeyStreaming>
                        <isVDDB>true</isVDDB>
                        <mappingResource id="34">db://resource/mapping/standard&amp;poors/SP_XF_GR_SecurityRatings.mdx</mappingResource>
                        <metaData id="35" type="java.util.HashMap">
                            <entry>
                                <key id="36" type="java.lang.String">DescriptiveData</key>
                                <value id="37" type="java.lang.String">Y</value>
                            </entry>
                            <entry>
                                <key id="38" type="java.lang.String">IsStaging</key>
                                <value id="39" type="java.lang.String">N</value>
                            </entry>
                            <entry>
                                <key id="40" type="java.lang.String">StageFile</key>
                                <value id="41" type="java.lang.String">N</value>
                            </entry>
                            <entry>
                                <key id="42" type="java.lang.String">VALIDATE_EXPRESSION</key>
                                <value id="43" type="java.lang.String">true</value>
                            </entry>
                        </metaData>
                        <name id="44">spSecurityLevelData</name>
                        <nearRealtimePublishing>false</nearRealtimePublishing>
                        <nearRealtimePublishingEvents id="45" type="java.util.ArrayList"/>
                        <publishingEvents id="46" type="java.util.ArrayList"/>
                        <rollbackOnError>false</rollbackOnError>
                        <saveVendorDataType>None</saveVendorDataType>
                        <streetLamp id="47">
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
                <item id="48" type="com.j2fe.processing.FileDefinition">
                    <file id="49">spRatingData*.security</file>
                    <group id="50">3</group>
                    <messageType id="51">
                        <applicationName id="52">SECURITIESANDPROD</applicationName>
                        <businessEntity>false</businessEntity>
                        <businessFeed idref="0"/>
                        <caputureProcessMessage>false</caputureProcessMessage>
                        <commitMode>None</commitMode>
                        <createMarketRealTimeInd idref="12"/>
                        <dataLineageEnabled>false</dataLineageEnabled>
                        <endOfFileEvents id="53" type="java.util.ArrayList"/>
                        <isKeyStreaming>true</isKeyStreaming>
                        <isVDDB>true</isVDDB>
                        <mappingResource id="54">db://resource/mapping/standard&amp;poors/SP_XF_GR_SecurityRatings.mdx</mappingResource>
                        <metaData id="55" type="java.util.HashMap">
                            <entry>
                                <key id="56" type="java.lang.String">DescriptiveData</key>
                                <value id="57" type="java.lang.String">Y</value>
                            </entry>
                            <entry>
                                <key id="58" type="java.lang.String">IsStaging</key>
                                <value id="59" type="java.lang.String">N</value>
                            </entry>
                            <entry>
                                <key id="60" type="java.lang.String">StageFile</key>
                                <value id="61" type="java.lang.String">N</value>
                            </entry>
                            <entry>
                                <key id="62" type="java.lang.String">VALIDATE_EXPRESSION</key>
                                <value id="63" type="java.lang.String">true</value>
                            </entry>
                        </metaData>
                        <name id="64">spRatingDataSec</name>
                        <nearRealtimePublishing>false</nearRealtimePublishing>
                        <nearRealtimePublishingEvents id="65" type="java.util.ArrayList"/>
                        <publishingEvents id="66" type="java.util.ArrayList"/>
                        <rollbackOnError>false</rollbackOnError>
                        <saveVendorDataType>None</saveVendorDataType>
                        <streetLamp id="67">
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
                <item id="68" type="com.j2fe.processing.FileDefinition">
                    <file id="69">spRatingDataNoCUSIP*.security</file>
                    <group idref="50"/>
                    <messageType idref="51"/>
                </item>
                <item id="70" type="com.j2fe.processing.FileDefinition">
                    <file id="71">spAssessmentData*.security</file>
                    <group idref="50"/>
                    <messageType id="72">
                        <applicationName id="73">SECURITIESANDPROD</applicationName>
                        <businessEntity>false</businessEntity>
                        <businessFeed idref="0"/>
                        <caputureProcessMessage>false</caputureProcessMessage>
                        <commitMode>None</commitMode>
                        <createMarketRealTimeInd idref="12"/>
                        <dataLineageEnabled>false</dataLineageEnabled>
                        <endOfFileEvents id="74" type="java.util.ArrayList"/>
                        <isKeyStreaming>true</isKeyStreaming>
                        <isVDDB>true</isVDDB>
                        <mappingResource id="75">db://resource/mapping/standard&amp;poors/SP_XF_GR_SecurityRatings.mdx</mappingResource>
                        <metaData id="76" type="java.util.HashMap">
                            <entry>
                                <key id="77" type="java.lang.String">DescriptiveData</key>
                                <value id="78" type="java.lang.String">Y</value>
                            </entry>
                            <entry>
                                <key id="79" type="java.lang.String">IsStaging</key>
                                <value id="80" type="java.lang.String">N</value>
                            </entry>
                            <entry>
                                <key id="81" type="java.lang.String">StageFile</key>
                                <value id="82" type="java.lang.String">N</value>
                            </entry>
                            <entry>
                                <key id="83" type="java.lang.String">VALIDATE_EXPRESSION</key>
                                <value id="84" type="java.lang.String">true</value>
                            </entry>
                        </metaData>
                        <name id="85">spAssessmentDataSec</name>
                        <nearRealtimePublishing>false</nearRealtimePublishing>
                        <nearRealtimePublishingEvents id="86" type="java.util.ArrayList"/>
                        <publishingEvents id="87" type="java.util.ArrayList"/>
                        <rollbackOnError>false</rollbackOnError>
                        <saveVendorDataType>None</saveVendorDataType>
                        <streetLamp id="88">
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
                <item id="89" type="com.j2fe.processing.FileDefinition">
                    <file id="90">spAssessmentDataNoCUSIP*.security</file>
                    <group idref="50"/>
                    <messageType idref="72"/>
                </item>
                <item id="91" type="com.j2fe.processing.FileDefinition">
                    <file id="92">spInstrumentSector*.security</file>
                    <group id="93">4</group>
                    <messageType id="94">
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
                        <mappingResource id="97">db://resource/mapping/standard&amp;poors/SP_XF_GR_SecurityRatings.mdx</mappingResource>
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
                            <entry>
                                <key id="105" type="java.lang.String">VALIDATE_EXPRESSION</key>
                                <value id="106" type="java.lang.String">true</value>
                            </entry>
                        </metaData>
                        <name id="107">spInstrumentSector</name>
                        <nearRealtimePublishing>false</nearRealtimePublishing>
                        <nearRealtimePublishingEvents id="108" type="java.util.ArrayList"/>
                        <publishingEvents id="109" type="java.util.ArrayList"/>
                        <rollbackOnError>false</rollbackOnError>
                        <saveVendorDataType>None</saveVendorDataType>
                        <streetLamp id="110">
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
                <item id="111" type="com.j2fe.processing.FileDefinition">
                    <file id="112">spParticipants*.security</file>
                    <group id="113">5</group>
                    <messageType id="114">
                        <applicationName id="115">SECURITIESANDPROD</applicationName>
                        <businessEntity>false</businessEntity>
                        <businessFeed idref="0"/>
                        <caputureProcessMessage>false</caputureProcessMessage>
                        <commitMode>None</commitMode>
                        <createMarketRealTimeInd idref="12"/>
                        <dataLineageEnabled>false</dataLineageEnabled>
                        <endOfFileEvents id="116" type="java.util.ArrayList"/>
                        <isKeyStreaming>true</isKeyStreaming>
                        <isVDDB>true</isVDDB>
                        <mappingResource id="117">db://resource/mapping/standard&amp;poors/SP_XF_GR_SecurityRatings.mdx</mappingResource>
                        <metaData id="118" type="java.util.HashMap">
                            <entry>
                                <key id="119" type="java.lang.String">DescriptiveData</key>
                                <value id="120" type="java.lang.String">Y</value>
                            </entry>
                            <entry>
                                <key id="121" type="java.lang.String">IsStaging</key>
                                <value id="122" type="java.lang.String">N</value>
                            </entry>
                            <entry>
                                <key id="123" type="java.lang.String">StageFile</key>
                                <value id="124" type="java.lang.String">N</value>
                            </entry>
                            <entry>
                                <key id="125" type="java.lang.String">VALIDATE_EXPRESSION</key>
                                <value id="126" type="java.lang.String">true</value>
                            </entry>
                        </metaData>
                        <name id="127">spParticipantsSec</name>
                        <nearRealtimePublishing>false</nearRealtimePublishing>
                        <nearRealtimePublishingEvents id="128" type="java.util.ArrayList"/>
                        <publishingEvents id="129" type="java.util.ArrayList"/>
                        <rollbackOnError>false</rollbackOnError>
                        <saveVendorDataType>None</saveVendorDataType>
                        <streetLamp id="130">
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
                <item id="131" type="com.j2fe.processing.FileDefinition">
                    <file id="132">spInstrumentToEntity*.security</file>
                    <group idref="113"/>
                    <messageType id="133">
                        <applicationName id="134">SECURITIESANDPROD</applicationName>
                        <businessEntity>false</businessEntity>
                        <businessFeed idref="0"/>
                        <caputureProcessMessage>false</caputureProcessMessage>
                        <commitMode>None</commitMode>
                        <createMarketRealTimeInd idref="12"/>
                        <dataLineageEnabled>false</dataLineageEnabled>
                        <endOfFileEvents id="135" type="java.util.ArrayList"/>
                        <isKeyStreaming>true</isKeyStreaming>
                        <isVDDB>true</isVDDB>
                        <mappingResource id="136">db://resource/mapping/standard&amp;poors/SP_XF_GR_SecurityRatings.mdx</mappingResource>
                        <metaData id="137" type="java.util.HashMap">
                            <entry>
                                <key id="138" type="java.lang.String">DescriptiveData</key>
                                <value id="139" type="java.lang.String">Y</value>
                            </entry>
                            <entry>
                                <key id="140" type="java.lang.String">IsStaging</key>
                                <value id="141" type="java.lang.String">N</value>
                            </entry>
                            <entry>
                                <key id="142" type="java.lang.String">StageFile</key>
                                <value id="143" type="java.lang.String">N</value>
                            </entry>
                            <entry>
                                <key id="144" type="java.lang.String">VALIDATE_EXPRESSION</key>
                                <value id="145" type="java.lang.String">true</value>
                            </entry>
                        </metaData>
                        <name id="146">spInstrumentToEntitySec</name>
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
                            <saveNotifications>ERROR</saveNotifications>
                            <saveProcessedMessage>ERROR</saveProcessedMessage>
                            <saveTranslatedMessage>ERROR</saveTranslatedMessage>
                            <saveUnprocessedInputMessage>false</saveUnprocessedInputMessage>
                        </streetLamp>
                        <syncPublishing>false</syncPublishing>
                    </messageType>
                </item>
            </fileDefinitions>
            <grouping>true</grouping>
            <messageTypes id="150" type="java.util.HashSet">
                <item idref="72" type="com.j2fe.processing.MessageType"/>
                <item idref="133" type="com.j2fe.processing.MessageType"/>
                <item idref="31" type="com.j2fe.processing.MessageType"/>
                <item idref="114" type="com.j2fe.processing.MessageType"/>
                <item idref="94" type="com.j2fe.processing.MessageType"/>
                <item idref="10" type="com.j2fe.processing.MessageType"/>
                <item idref="51" type="com.j2fe.processing.MessageType"/>
            </messageTypes>
            <name id="151">S&amp;P_XF_GR_Security_Ratings</name>
        </com.j2fe.processing.BusinessFeed>
    </businessobject>
</goldensource-package>
