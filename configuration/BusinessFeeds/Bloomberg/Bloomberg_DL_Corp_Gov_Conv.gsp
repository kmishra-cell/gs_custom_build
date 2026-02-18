<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.07">
<package-comment/>
<businessobject displayString="Bloomberg_DL_Corp_Gov_Conv" type="com.j2fe.processing.BusinessFeed">
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
<file id="7">corp_pfd_convert_*.dif.gz.enc.20*</file>
<group id="8">4</group>
<messageType id="9">
<applicationName id="10">SECURITIESANDPROD</applicationName>
<businessEntity>false</businessEntity>
<businessFeed idref="0"/>
<caputureProcessMessage>true</caputureProcessMessage>
<commitMode>None</commitMode>
<createMarketRealTimeInd id="11">false</createMarketRealTimeInd>
<dataLineageEnabled>false</dataLineageEnabled>
<endOfFileEvents id="12" type="java.util.ArrayList"/>
<isKeyStreaming>true</isKeyStreaming>
<isVDDB>true</isVDDB>
<mappingResource id="13">db://resource/mapping/Bloomberg/BBCorpGovtConvPrfd.omdx</mappingResource>
<metaData id="14" type="java.util.HashMap"/>
<name id="15">BBCorpGovtConvPrfd</name>
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
<file id="20">corp_pfd_asia.dif.gz.enc.20*</file>
<group id="21">2</group>
<messageType idref="9"/>
</item>
<item id="22" type="com.j2fe.processing.FileDefinition">
<file id="23">corp_pfd_asia.out.gz.enc.20*</file>
<group id="24">1</group>
<messageType idref="9"/>
</item>
<item id="25" type="com.j2fe.processing.FileDefinition">
<file id="26">corp_pfd_convert_*.out.gz.enc.20*</file>
<group id="27">3</group>
<messageType idref="9"/>
</item>
<item id="28" type="com.j2fe.processing.FileDefinition">
<file id="29">corp_pfd_euro.dif.gz.enc.20*</file>
<group idref="21"/>
<messageType idref="9"/>
</item>
<item id="30" type="com.j2fe.processing.FileDefinition">
<file id="31">corp_pfd_euro.out.gz.enc.20*</file>
<group idref="24"/>
<messageType idref="9"/>
</item>
<item id="32" type="com.j2fe.processing.FileDefinition">
<file id="33">corp_pfd_lamr.dif.gz.enc.20*</file>
<group idref="21"/>
<messageType idref="9"/>
</item>
<item id="34" type="com.j2fe.processing.FileDefinition">
<file id="35">corp_pfd_lamr.out.gz.enc.20*</file>
<group idref="24"/>
<messageType idref="9"/>
</item>
<item id="36" type="com.j2fe.processing.FileDefinition">
<file id="37">corp_pfd_namr.dif.gz.enc.20*</file>
<group idref="21"/>
<messageType idref="9"/>
</item>
<item id="38" type="com.j2fe.processing.FileDefinition">
<file id="39">corp_pfd_namr.out.gz.enc.20*</file>
<group idref="24"/>
<messageType idref="9"/>
</item>
<item id="40" type="com.j2fe.processing.FileDefinition">
<file id="41">govt_agency_regl_*.dif.gz.enc.20*</file>
<group idref="21"/>
<messageType idref="9"/>
</item>
<item id="42" type="com.j2fe.processing.FileDefinition">
<file id="43">govt_agency_regl_*.out.gz.enc.20*</file>
<group idref="24"/>
<messageType idref="9"/>
</item>
<item id="44" type="com.j2fe.processing.FileDefinition">
<file id="45">govt_national_*.dif.gz.enc.20*</file>
<group idref="21"/>
<messageType idref="9"/>
</item>
<item id="46" type="com.j2fe.processing.FileDefinition">
<file id="47">govt_national_*.out.gz.enc.20*</file>
<group idref="24"/>
<messageType idref="9"/>
</item>
<item id="48" type="com.j2fe.processing.FileDefinition">
<file id="49">corp_pfd_convert_*.dif.gz.20*</file>
<group idref="8"/>
<messageType idref="9"/>
</item>
<item id="50" type="com.j2fe.processing.FileDefinition">
<file id="51">corp_pfd_asia.dif.gz.20*</file>
<group idref="21"/>
<messageType idref="9"/>
</item>
<item id="52" type="com.j2fe.processing.FileDefinition">
<file id="53">corp_pfd_asia.out.gz.20*</file>
<group idref="24"/>
<messageType idref="9"/>
</item>
<item id="54" type="com.j2fe.processing.FileDefinition">
<file id="55">corp_pfd_convert_*.out.gz.20*</file>
<group idref="27"/>
<messageType idref="9"/>
</item>
<item id="56" type="com.j2fe.processing.FileDefinition">
<file id="57">corp_pfd_euro.dif.gz.20*</file>
<group idref="21"/>
<messageType idref="9"/>
</item>
<item id="58" type="com.j2fe.processing.FileDefinition">
<file id="59">corp_pfd_euro.out.gz.20*</file>
<group idref="24"/>
<messageType idref="9"/>
</item>
<item id="60" type="com.j2fe.processing.FileDefinition">
<file id="61">corp_pfd_lamr.dif.gz.20*</file>
<group idref="21"/>
<messageType idref="9"/>
</item>
<item id="62" type="com.j2fe.processing.FileDefinition">
<file id="63">corp_pfd_lamr.out.gz.20*</file>
<group idref="24"/>
<messageType idref="9"/>
</item>
<item id="64" type="com.j2fe.processing.FileDefinition">
<file id="65">corp_pfd_namr.dif.gz.20*</file>
<group idref="21"/>
<messageType idref="9"/>
</item>
<item id="66" type="com.j2fe.processing.FileDefinition">
<file id="67">corp_pfd_namr.out.gz.20*</file>
<group idref="24"/>
<messageType idref="9"/>
</item>
<item id="68" type="com.j2fe.processing.FileDefinition">
<file id="69">govt_agency_regl_*.dif.gz.20*</file>
<group idref="21"/>
<messageType idref="9"/>
</item>
<item id="70" type="com.j2fe.processing.FileDefinition">
<file id="71">govt_agency_regl_*.out.gz.20*</file>
<group idref="24"/>
<messageType idref="9"/>
</item>
<item id="72" type="com.j2fe.processing.FileDefinition">
<file id="73">govt_national_*.dif.gz.20*</file>
<group idref="21"/>
<messageType idref="9"/>
</item>
<item id="74" type="com.j2fe.processing.FileDefinition">
<file id="75">govt_national_*.out.gz.20*</file>
<group idref="24"/>
<messageType idref="9"/>
</item>
<item id="76" type="com.j2fe.processing.FileDefinition">
<file id="77">fixedincome_bo_*.dif.gz.enc.20*</file>
<group idref="21"/>
<messageType idref="9"/>
</item>
<item id="78" type="com.j2fe.processing.FileDefinition">
<file id="79">fixedincome_bo_*.out.gz.enc.20*</file>
<group idref="24"/>
<messageType idref="9"/>
</item>
<item id="80" type="com.j2fe.processing.FileDefinition">
<file id="81">corp_pfd_convert_namr.dif.gz.enc.20*</file>
<group idref="8"/>
<messageType idref="9"/>
</item>
<item id="82" type="com.j2fe.processing.FileDefinition">
<file id="83">corp_pfd_convert_namr.out.gz.enc.20*</file>
<group idref="27"/>
<messageType idref="9"/>
</item>
<item id="84" type="com.j2fe.processing.FileDefinition">
<file id="85">govt_agency_regl_namr.dif.gz.enc.20*</file>
<group idref="21"/>
<messageType idref="9"/>
</item>
<item id="86" type="com.j2fe.processing.FileDefinition">
<file id="87">govt_agency_regl_namr.out.gz.enc.20*</file>
<group idref="24"/>
<messageType idref="9"/>
</item>
<item id="88" type="com.j2fe.processing.FileDefinition">
<file id="89">govt_national_namr.dif.gz.enc.20*</file>
<group idref="21"/>
<messageType idref="9"/>
</item>
<item id="90" type="com.j2fe.processing.FileDefinition">
<file id="91">govt_national_namr.out.gz.enc.20*</file>
<group idref="24"/>
<messageType idref="9"/>
</item>
<item id="92" type="com.j2fe.processing.FileDefinition">
<file id="93">corpPfdAsiaV2.out.gz.enc.20*</file>
<group idref="24"/>
<messageType idref="9"/>
</item>
<item id="94" type="com.j2fe.processing.FileDefinition">
<file id="95">corpPfdEuroV2.out.gz.enc.20*</file>
<group idref="24"/>
<messageType idref="9"/>
</item>
<item id="96" type="com.j2fe.processing.FileDefinition">
<file id="97">corpPfdLamrV2.out.gz.enc.20*</file>
<group idref="24"/>
<messageType idref="9"/>
</item>
<item id="98" type="com.j2fe.processing.FileDefinition">
<file id="99">corpPfdNamrV2.out.gz.enc.20*</file>
<group idref="24"/>
<messageType idref="9"/>
</item>
<item id="100" type="com.j2fe.processing.FileDefinition">
<file id="101">corpPfdAsiaV2.dif.gz.enc.20*</file>
<group idref="21"/>
<messageType idref="9"/>
</item>
<item id="102" type="com.j2fe.processing.FileDefinition">
<file id="103">corpPfdEuroV2.dif.gz.enc.20*</file>
<group idref="21"/>
<messageType idref="9"/>
</item>
<item id="104" type="com.j2fe.processing.FileDefinition">
<file id="105">corpPfdLamrV2.dif.gz.enc.20*</file>
<group idref="21"/>
<messageType idref="9"/>
</item>
<item id="106" type="com.j2fe.processing.FileDefinition">
<file id="107">corpPfdNamrV2.dif.gz.enc.20*</file>
<group idref="21"/>
<messageType idref="9"/>
</item>
<item id="108" type="com.j2fe.processing.FileDefinition">
<file id="109">fixedincomeBo.out.gz.enc.20*</file>
<group idref="24"/>
<messageType idref="9"/>
</item>
<item id="110" type="com.j2fe.processing.FileDefinition">
<file id="111">fixedincomeBo.dif.gz.enc.20*</file>
<group idref="21"/>
<messageType idref="9"/>
</item>
<item id="112" type="com.j2fe.processing.FileDefinition">
<file id="113">corp_pfd_convert_lamr.dif.gz.enc.20*</file>
<group idref="8"/>
<messageType idref="9"/>
</item>
<item id="114" type="com.j2fe.processing.FileDefinition">
<file id="115">corp_pfd_convert_euro.dif.gz.enc.20*</file>
<group idref="8"/>
<messageType idref="9"/>
</item>
<item id="116" type="com.j2fe.processing.FileDefinition">
<file id="117">corp_pfd_convert_asia.dif.gz.enc.20*</file>
<group idref="8"/>
<messageType idref="9"/>
</item>
<item id="118" type="com.j2fe.processing.FileDefinition">
<file id="119">corp_pfd_convert_lamr.out.gz.enc.20*</file>
<group idref="27"/>
<messageType idref="9"/>
</item>
<item id="120" type="com.j2fe.processing.FileDefinition">
<file id="121">corp_pfd_convert_euro.out.gz.enc.20*</file>
<group idref="27"/>
<messageType idref="9"/>
</item>
<item id="122" type="com.j2fe.processing.FileDefinition">
<file id="123">corp_pfd_convert_asia.out.gz.enc.20*</file>
<group idref="27"/>
<messageType idref="9"/>
</item>
<item id="124" type="com.j2fe.processing.FileDefinition">
<file id="125">govt_agency_regl_lamr.dif.gz.enc.20*</file>
<group idref="21"/>
<messageType idref="9"/>
</item>
<item id="126" type="com.j2fe.processing.FileDefinition">
<file id="127">govt_agency_regl_euro.dif.gz.enc.20*</file>
<group idref="21"/>
<messageType idref="9"/>
</item>
<item id="128" type="com.j2fe.processing.FileDefinition">
<file id="129">govt_agency_regl_asia.dif.gz.enc.20*</file>
<group idref="21"/>
<messageType idref="9"/>
</item>
<item id="130" type="com.j2fe.processing.FileDefinition">
<file id="131">govt_agency_regl_lamr.out.gz.enc.20*</file>
<group idref="24"/>
<messageType idref="9"/>
</item>
<item id="132" type="com.j2fe.processing.FileDefinition">
<file id="133">govt_agency_regl_euro.out.gz.enc.20*</file>
<group idref="24"/>
<messageType idref="9"/>
</item>
<item id="134" type="com.j2fe.processing.FileDefinition">
<file id="135">govt_agency_regl_asia.out.gz.enc.20*</file>
<group idref="24"/>
<messageType idref="9"/>
</item>
<item id="136" type="com.j2fe.processing.FileDefinition">
<file id="137">govt_national_lamr.dif.gz.enc.20*</file>
<group idref="21"/>
<messageType idref="9"/>
</item>
<item id="138" type="com.j2fe.processing.FileDefinition">
<file id="139">govt_national_euro.dif.gz.enc.20*</file>
<group idref="21"/>
<messageType idref="9"/>
</item>
<item id="140" type="com.j2fe.processing.FileDefinition">
<file id="141">govt_national_asia.dif.gz.enc.20*</file>
<group idref="21"/>
<messageType idref="9"/>
</item>
<item id="142" type="com.j2fe.processing.FileDefinition">
<file id="143">govt_national_lamr.out.gz.enc.20*</file>
<group idref="24"/>
<messageType idref="9"/>
</item>
<item id="144" type="com.j2fe.processing.FileDefinition">
<file id="145">govt_national_euro.out.gz.enc.20*</file>
<group idref="24"/>
<messageType idref="9"/>
</item>
<item id="146" type="com.j2fe.processing.FileDefinition">
<file id="147">govt_national_asia.out.gz.enc.20*</file>
<group idref="24"/>
<messageType idref="9"/>
</item>
</fileDefinitions>
<grouping>false</grouping>
<messageTypes id="148" type="java.util.HashSet">
<item idref="9" type="com.j2fe.processing.MessageType"/>
</messageTypes>
<name id="149">Bloomberg_DL_Corp_Gov_Conv</name>
</com.j2fe.processing.BusinessFeed>
</businessobject>
</goldensource-package>
