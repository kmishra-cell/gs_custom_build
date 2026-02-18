<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<goldensource-package version="8.4.1.288">
<package-comment/>
<businessobject displayString="Equity" type="com.j2fe.connector.RequestType">
<com.j2fe.connector.RequestType id="0">
<dataSource id="1">
<id id="2">BB</id>
<requestTypes id="3" type="java.util.HashSet">
<item idref="0" type="com.j2fe.connector.RequestType"/>
</requestTypes>
</dataSource>
<dataTypes id="4" type="java.util.HashSet">
<item id="5" type="java.lang.String">SECMASTER</item>
</dataTypes>
<externalIssueTypes id="6" type="java.util.HashSet">
<item id="7" type="java.lang.String">Sec Lending</item>
<item id="8" type="java.lang.String">BDR</item>
<item id="9" type="java.lang.String">CDR</item>
<item id="10" type="java.lang.String">German Cert</item>
<item id="11" type="java.lang.String">Common Stock</item>
<item id="12" type="java.lang.String">Unit</item>
<item id="13" type="java.lang.String">GDR</item>
<item id="14" type="java.lang.String">Unit Inv Tst</item>
<item id="15" type="java.lang.String">A/T Unit</item>
<item id="16" type="java.lang.String">ETP</item>
<item id="17" type="java.lang.String">Ltd Part</item>
<item id="18" type="java.lang.String">REIT</item>
<item id="19" type="java.lang.String">French Cert</item>
<item id="20" type="java.lang.String">Swiss Cert</item>
<item id="21" type="java.lang.String">NY Reg Shrs</item>
<item id="22" type="java.lang.String">Dutch Cert</item>
<item id="23" type="java.lang.String">IDR</item>
<item id="24" type="java.lang.String">PRES</item>
<item id="25" type="java.lang.String">Receipt</item>
<item id="26" type="java.lang.String">Right</item>
<item id="27" type="java.lang.String">FDIC</item>
<item id="28" type="java.lang.String">Foreign Sh.</item>
<item id="29" type="java.lang.String">Conv Bond</item>
<item id="30" type="java.lang.String">Savings Share</item>
<item id="31" type="java.lang.String">Royalty Trst</item>
<item id="32" type="java.lang.String">EDR</item>
<item id="33" type="java.lang.String">Conv Prfd</item>
<item id="34" type="java.lang.String">Car Forward</item>
<item id="35" type="java.lang.String">Misc.</item>
<item id="36" type="java.lang.String">ADR</item>
<item id="37" type="java.lang.String">Bond</item>
<item id="38" type="java.lang.String">Private Comp</item>
<item id="39" type="java.lang.String">Austrian Crt</item>
<item id="40" type="java.lang.String">Private Eqty</item>
<item id="41" type="java.lang.String">Preference</item>
<item id="42" type="java.lang.String">Preferred</item>
<item id="43" type="java.lang.String">Variable Annuity</item>
<item id="44" type="java.lang.String">NVDR</item>
<item id="45" type="java.lang.String">Tracking Stk</item>
<item id="46" type="java.lang.String">RDC</item>
<item id="47" type="java.lang.String">Belgium Cert</item>
<item id="48" type="java.lang.String">MLP</item>
</externalIssueTypes>
<filePattern id="49">gs*.req</filePattern>
<marketSector id="50" type="java.util.HashSet">
<item id="51" type="java.lang.String">Equity</item>
</marketSector>
<messageType id="52">
<businessEntity>false</businessEntity>
<caputureProcessMessage>false</caputureProcessMessage>
<commitMode>None</commitMode>
<isKeyStreaming>false</isKeyStreaming>
<isVDDB>false</isVDDB>
<name id="53">BBGlobalEquity</name>
<nearRealtimePublishing>false</nearRealtimePublishing>
<rollbackOnError>false</rollbackOnError>
<saveVendorDataType>None</saveVendorDataType>
<syncPublishing>false</syncPublishing>
</messageType>
<requestType id="54">Equity</requestType>
<templateURI id="55">db://resource/xslt/request/bloomberg/BBGlobalEquityMizuho.xslt</templateURI>
</com.j2fe.connector.RequestType>
</businessobject>
</goldensource-package>
