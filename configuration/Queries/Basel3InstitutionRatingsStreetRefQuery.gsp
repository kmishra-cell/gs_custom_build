<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.03">
<package-comment/>
<businessobject displayString="Basel3InstitutionRatingsStreetRefQuery" type="com.j2fe.translation.template.QueryDefinition">
<com.j2fe.translation.template.QueryDefinition id="0">
<name id="1">Basel3InstitutionRatingsStreetRefQuery</name>
<parameters id="2" type="java.util.ArrayList">
<item id="3" type="com.j2fe.translation.template.QueryParameter">
<description id="4"/>
<name id="5">INSTMNEM</name>
<type>12</type>
</item>
</parameters>
<text id="6">SELECT &#13;
XMLElement(NAME "STREET_REF",XMLAttributes( '10000002' AS "MESSAGE_ID",  'GUEST' AS "USERID"), &#13;
XMLElement(NAME "HEADER", &#13;
XMLElement(NAME "MAIN_ENTITY_ID", XMLAttributes( pref_fins_id AS "VALUE")), &#13;
XMLElement(NAME "MAIN_ENTITY_ID_CTXT_TYP",XMLAttributes( pref_fins_id_ctxt_typ AS "VALUE")), &#13;
XMLElement(NAME "MAIN_ENTITY_NME",XMLAttributes(INST_NME AS "VALUE")), &#13;
XMLElement(NAME "MAIN_ENTITY_TBL_TYP",XMLAttributes('FINS' AS "VALUE")), &#13;
XMLElement(NAME "MSGCLASSIFICATION",XMLAttributes('B3FINSRTNGCALBTCH' AS "VALUE")), &#13;
XMLElement(NAME "LASTCHGUSRID",XMLAttributes('B3FINSRTNGCALBTCH' AS "VALUE"))  ), &#13;
XMLElement(NAME "SEGMENT", XMLAttributes( 'FinancialInstitution' AS "TYPE", 'REFERENCE' AS "ACTION"), &#13;
XMLElement(NAME "FinancialInstitution", XMLElement(NAME "INSTMNEM", XMLAttributes( INST_MNEM AS "VALUE")) &#13;
))) FROM FT_T_FINS WHERE INST_MNEM = ?</text>
</com.j2fe.translation.template.QueryDefinition>
</businessobject>
</goldensource-package>
