<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<goldensource-package version="10.0.0.02">
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
                        <mappingResource id="14">db://resource/mapping/standard&amp;poors/SP_XF_GR_EntityRatings.mdx</mappingResource>
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
                        <name id="22">spEntityLevelData</name>
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
                    <messageType id="29">
                        <applicationName id="30">SECURITIESANDPROD</applicationName>
                        <businessEntity>false</businessEntity>
                        <businessFeed idref="0"/>
                        <caputureProcessMessage>false</caputureProcessMessage>
                        <commitMode>None</commitMode>
                        <createMarketRealTimeInd idref="12"/>
                        <dataLineageEnabled>false</dataLineageEnabled>
                        <endOfFileEvents id="31" type="java.util.ArrayList"/>
                        <isKeyStreaming>true</isKeyStreaming>
                        <isVDDB>true</isVDDB>
                        <mappingResource id="32">db://resource/mapping/standard&amp;poors/SP_XF_GR_EntityRatings.mdx</mappingResource>
                        <metaData id="33" type="java.util.HashMap">
                            <entry>
                                <key id="34" type="java.lang.String">DescriptiveData</key>
                                <value id="35" type="java.lang.String">Y</value>
                            </entry>
                            <entry>
                                <key id="36" type="java.lang.String">IsStaging</key>
                                <value id="37" type="java.lang.String">N</value>
                            </entry>
                            <entry>
                                <key id="38" type="java.lang.String">StageFile</key>
                                <value id="39" type="java.lang.String">N</value>
                            </entry>
                        </metaData>
                        <name id="40">spRatingIdentifier</name>
                        <nearRealtimePublishing>false</nearRealtimePublishing>
                        <nearRealtimePublishingEvents id="41" type="java.util.ArrayList"/>
                        <publishingEvents id="42" type="java.util.ArrayList"/>
                        <rollbackOnError>false</rollbackOnError>
                        <saveVendorDataType>None</saveVendorDataType>
                        <streetLamp id="43">
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
                <item id="44" type="com.j2fe.processing.FileDefinition">
                    <file id="45">spEntitySector*.entity</file>
                    <group id="46">5</group>
                    <messageType id="47">
                        <applicationName id="48">SECURITIESANDPROD</applicationName>
                        <businessEntity>false</businessEntity>
                        <businessFeed idref="0"/>
                        <caputureProcessMessage>false</caputureProcessMessage>
                        <commitMode>None</commitMode>
                        <createMarketRealTimeInd idref="12"/>
                        <dataLineageEnabled>false</dataLineageEnabled>
                        <endOfFileEvents id="49" type="java.util.ArrayList"/>
                        <isKeyStreaming>true</isKeyStreaming>
                        <isVDDB>true</isVDDB>
                        <mappingResource id="50">db://resource/mapping/standard&amp;poors/SP_XF_GR_EntityRatings.mdx</mappingResource>
                        <metaData id="51" type="java.util.HashMap">
                            <entry>
                                <key id="52" type="java.lang.String">DescriptiveData</key>
                                <value id="53" type="java.lang.String">Y</value>
                            </entry>
                            <entry>
                                <key id="54" type="java.lang.String">IsStaging</key>
                                <value id="55" type="java.lang.String">N</value>
                            </entry>
                            <entry>
                                <key id="56" type="java.lang.String">StageFile</key>
                                <value id="57" type="java.lang.String">N</value>
                            </entry>
                        </metaData>
                        <name id="58">spEntitySector</name>
                        <nearRealtimePublishing>false</nearRealtimePublishing>
                        <nearRealtimePublishingEvents id="59" type="java.util.ArrayList"/>
                        <publishingEvents id="60" type="java.util.ArrayList"/>
                        <rollbackOnError>false</rollbackOnError>
                        <saveVendorDataType>None</saveVendorDataType>
                        <streetLamp id="61">
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
                <item id="62" type="com.j2fe.processing.FileDefinition">
                    <file id="63">spInstrumentToEntity*.entity</file>
                    <group id="64">6</group>
                    <messageType id="65">
                        <applicationName id="66">SECURITIESANDPROD</applicationName>
                        <businessEntity>false</businessEntity>
                        <businessFeed idref="0"/>
                        <caputureProcessMessage>false</caputureProcessMessage>
                        <commitMode>None</commitMode>
                        <createMarketRealTimeInd idref="12"/>
                        <dataLineageEnabled>false</dataLineageEnabled>
                        <endOfFileEvents id="67" type="java.util.ArrayList"/>
                        <isKeyStreaming>true</isKeyStreaming>
                        <isVDDB>true</isVDDB>
                        <mappingResource id="68">db://resource/mapping/standard&amp;poors/SP_XF_GR_EntityRatings.mdx</mappingResource>
                        <metaData id="69" type="java.util.HashMap">
                            <entry>
                                <key id="70" type="java.lang.String">DescriptiveData</key>
                                <value id="71" type="java.lang.String">Y</value>
                            </entry>
                            <entry>
                                <key id="72" type="java.lang.String">IsStaging</key>
                                <value id="73" type="java.lang.String">N</value>
                            </entry>
                            <entry>
                                <key id="74" type="java.lang.String">StageFile</key>
                                <value id="75" type="java.lang.String">N</value>
                            </entry>
                        </metaData>
                        <name id="76">spInstrumentToEntity</name>
                        <nearRealtimePublishing>false</nearRealtimePublishing>
                        <nearRealtimePublishingEvents id="77" type="java.util.ArrayList"/>
                        <publishingEvents id="78" type="java.util.ArrayList"/>
                        <rollbackOnError>false</rollbackOnError>
                        <saveVendorDataType>None</saveVendorDataType>
                        <streetLamp id="79">
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
                <item id="80" type="com.j2fe.processing.FileDefinition">
                    <file id="81">spRatingData*.entity</file>
                    <group id="82">3</group>
                    <messageType id="83">
                        <applicationName id="84">SECURITIESANDPROD</applicationName>
                        <businessEntity>false</businessEntity>
                        <businessFeed idref="0"/>
                        <caputureProcessMessage>false</caputureProcessMessage>
                        <commitMode>None</commitMode>
                        <createMarketRealTimeInd idref="12"/>
                        <dataLineageEnabled>false</dataLineageEnabled>
                        <endOfFileEvents id="85" type="java.util.ArrayList"/>
                        <isKeyStreaming>true</isKeyStreaming>
                        <isVDDB>true</isVDDB>
                        <mappingResource id="86">db://resource/mapping/standard&amp;poors/SP_XF_GR_EntityRatings.mdx</mappingResource>
                        <metaData id="87" type="java.util.HashMap">
                            <entry>
                                <key id="88" type="java.lang.String">DescriptiveData</key>
                                <value id="89" type="java.lang.String">Y</value>
                            </entry>
                            <entry>
                                <key id="90" type="java.lang.String">IsStaging</key>
                                <value id="91" type="java.lang.String">N</value>
                            </entry>
                            <entry>
                                <key id="92" type="java.lang.String">StageFile</key>
                                <value id="93" type="java.lang.String">N</value>
                            </entry>
                        </metaData>
                        <name id="94">spRatingData</name>
                        <nearRealtimePublishing>false</nearRealtimePublishing>
                        <nearRealtimePublishingEvents id="95" type="java.util.ArrayList"/>
                        <publishingEvents id="96" type="java.util.ArrayList"/>
                        <rollbackOnError>false</rollbackOnError>
                        <saveVendorDataType>None</saveVendorDataType>
                        <streetLamp id="97">
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
                <item id="98" type="com.j2fe.processing.FileDefinition">
                    <file id="99">spAssessmentData*.entity</file>
                    <group idref="82"/>
                    <messageType id="100">
                        <applicationName id="101">SECURITIESANDPROD</applicationName>
                        <businessEntity>false</businessEntity>
                        <businessFeed idref="0"/>
                        <caputureProcessMessage>false</caputureProcessMessage>
                        <commitMode>None</commitMode>
                        <createMarketRealTimeInd idref="12"/>
                        <dataLineageEnabled>false</dataLineageEnabled>
                        <endOfFileEvents id="102" type="java.util.ArrayList"/>
                        <isKeyStreaming>true</isKeyStreaming>
                        <isVDDB>true</isVDDB>
                        <mappingResource id="103">db://resource/mapping/standard&amp;poors/SP_XF_GR_EntityRatings.mdx</mappingResource>
                        <metaData id="104" type="java.util.HashMap">
                            <entry>
                                <key id="105" type="java.lang.String">DescriptiveData</key>
                                <value id="106" type="java.lang.String">Y</value>
                            </entry>
                            <entry>
                                <key id="107" type="java.lang.String">IsStaging</key>
                                <value id="108" type="java.lang.String">N</value>
                            </entry>
                            <entry>
                                <key id="109" type="java.lang.String">StageFile</key>
                                <value id="110" type="java.lang.String">N</value>
                            </entry>
                        </metaData>
                        <name id="111">spAssessmentData</name>
                        <nearRealtimePublishing>false</nearRealtimePublishing>
                        <nearRealtimePublishingEvents id="112" type="java.util.ArrayList"/>
                        <publishingEvents id="113" type="java.util.ArrayList"/>
                        <rollbackOnError>false</rollbackOnError>
                        <saveVendorDataType>None</saveVendorDataType>
                        <streetLamp id="114">
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
                <item id="115" type="com.j2fe.processing.FileDefinition">
                    <file id="116">spAssessmentLevelData*.entity</file>
                    <group id="117">4</group>
                    <messageType id="118">
                        <applicationName id="119">SECURITIESANDPROD</applicationName>
                        <businessEntity>false</businessEntity>
                        <businessFeed idref="0"/>
                        <caputureProcessMessage>false</caputureProcessMessage>
                        <commitMode>None</commitMode>
                        <createMarketRealTimeInd idref="12"/>
                        <dataLineageEnabled>false</dataLineageEnabled>
                        <endOfFileEvents id="120" type="java.util.ArrayList"/>
                        <isKeyStreaming>true</isKeyStreaming>
                        <isVDDB>true</isVDDB>
                        <mappingResource id="121">db://resource/mapping/standard&amp;poors/SP_XF_GR_EntityRatings.mdx</mappingResource>
                        <metaData id="122" type="java.util.HashMap">
                            <entry>
                                <key id="123" type="java.lang.String">DescriptiveData</key>
                                <value id="124" type="java.lang.String">Y</value>
                            </entry>
                            <entry>
                                <key id="125" type="java.lang.String">IsStaging</key>
                                <value id="126" type="java.lang.String">N</value>
                            </entry>
                            <entry>
                                <key id="127" type="java.lang.String">StageFile</key>
                                <value id="128" type="java.lang.String">N</value>
                            </entry>
                        </metaData>
                        <name id="129">spAssessmentLevelData</name>
                        <nearRealtimePublishing>false</nearRealtimePublishing>
                        <nearRealtimePublishingEvents id="130" type="java.util.ArrayList"/>
                        <publishingEvents id="131" type="java.util.ArrayList"/>
                        <rollbackOnError>false</rollbackOnError>
                        <saveVendorDataType>None</saveVendorDataType>
                        <streetLamp id="132">
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
                <item id="133" type="com.j2fe.processing.FileDefinition">
                    <file id="134">spIndustryChar*.entity</file>
                    <group id="135">7</group>
                    <messageType id="136">
                        <applicationName id="137">SECURITIESANDPROD</applicationName>
                        <businessEntity>false</businessEntity>
                        <businessFeed idref="0"/>
                        <caputureProcessMessage>false</caputureProcessMessage>
                        <commitMode>None</commitMode>
                        <createMarketRealTimeInd idref="12"/>
                        <dataLineageEnabled>false</dataLineageEnabled>
                        <endOfFileEvents id="138" type="java.util.ArrayList"/>
                        <isKeyStreaming>true</isKeyStreaming>
                        <isVDDB>true</isVDDB>
                        <mappingResource id="139">db://resource/mapping/standard&amp;poors/SP_XF_GR_EntityRatings.mdx</mappingResource>
                        <metaData id="140" type="java.util.HashMap">
                            <entry>
                                <key id="141" type="java.lang.String">DescriptiveData</key>
                                <value id="142" type="java.lang.String">Y</value>
                            </entry>
                            <entry>
                                <key id="143" type="java.lang.String">IsStaging</key>
                                <value id="144" type="java.lang.String">N</value>
                            </entry>
                            <entry>
                                <key id="145" type="java.lang.String">StageFile</key>
                                <value id="146" type="java.lang.String">N</value>
                            </entry>
                        </metaData>
                        <name id="147">spIndustryChar</name>
                        <nearRealtimePublishing>false</nearRealtimePublishing>
                        <nearRealtimePublishingEvents id="148" type="java.util.ArrayList"/>
                        <publishingEvents id="149" type="java.util.ArrayList"/>
                        <rollbackOnError>false</rollbackOnError>
                        <saveVendorDataType>None</saveVendorDataType>
                        <streetLamp id="150">
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
                <item id="151" type="com.j2fe.processing.FileDefinition">
                    <file id="152">spParticipants*.entity</file>
                    <group idref="64"/>
                    <messageType id="153">
                        <applicationName id="154">SECURITIESANDPROD</applicationName>
                        <businessEntity>false</businessEntity>
                        <businessFeed idref="0"/>
                        <caputureProcessMessage>false</caputureProcessMessage>
                        <commitMode>None</commitMode>
                        <createMarketRealTimeInd idref="12"/>
                        <dataLineageEnabled>false</dataLineageEnabled>
                        <endOfFileEvents id="155" type="java.util.ArrayList"/>
                        <isKeyStreaming>true</isKeyStreaming>
                        <isVDDB>true</isVDDB>
                        <mappingResource id="156">db://resource/mapping/standard&amp;poors/SP_XF_GR_EntityRatings.mdx</mappingResource>
                        <metaData id="157" type="java.util.HashMap">
                            <entry>
                                <key id="158" type="java.lang.String">DescriptiveData</key>
                                <value id="159" type="java.lang.String">Y</value>
                            </entry>
                            <entry>
                                <key id="160" type="java.lang.String">IsStaging</key>
                                <value id="161" type="java.lang.String">N</value>
                            </entry>
                            <entry>
                                <key id="162" type="java.lang.String">StageFile</key>
                                <value id="163" type="java.lang.String">N</value>
                            </entry>
                        </metaData>
                        <name id="164">spParticipants</name>
                        <nearRealtimePublishing>false</nearRealtimePublishing>
                        <nearRealtimePublishingEvents id="165" type="java.util.ArrayList"/>
                        <publishingEvents id="166" type="java.util.ArrayList"/>
                        <rollbackOnError>false</rollbackOnError>
                        <saveVendorDataType>None</saveVendorDataType>
                        <streetLamp id="167">
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
            <messageTypes id="168" type="java.util.HashSet">
                <item idref="29" type="com.j2fe.processing.MessageType"/>
                <item idref="65" type="com.j2fe.processing.MessageType"/>
                <item idref="136" type="com.j2fe.processing.MessageType"/>
                <item idref="83" type="com.j2fe.processing.MessageType"/>
                <item idref="118" type="com.j2fe.processing.MessageType"/>
                <item idref="10" type="com.j2fe.processing.MessageType"/>
                <item idref="100" type="com.j2fe.processing.MessageType"/>
                <item idref="153" type="com.j2fe.processing.MessageType"/>
                <item idref="47" type="com.j2fe.processing.MessageType"/>
            </messageTypes>
            <name id="169">S&amp;P_XF_GR_Entity_Ratings</name>
        </com.j2fe.processing.BusinessFeed>
    </businessobject>
</goldensource-package>
