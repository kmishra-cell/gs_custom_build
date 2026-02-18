<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<goldensource-package version="10.0.0.02">
    <package-comment/>
    <businessobject displayString="cmfDataRequestBBPerSec" type="com.j2fe.translation.template.QueryDefinition">
        <com.j2fe.translation.template.QueryDefinition id="0">
            <name id="1">cmfDataRequestBBPerSec</name>
            <parameters id="2" type="java.util.ArrayList">
                <item id="3" type="com.j2fe.translation.template.QueryParameter">
                    <description id="4">MurexSOI</description>
                    <name id="5">MurexSOI</name>
                    <type>12</type>
                </item>
                <item id="6" type="com.j2fe.translation.template.QueryParameter">
                    <description id="7">BBBOSOI</description>
                    <name id="8">BBBOSOI</name>
                    <type>12</type>
                </item>
                <item id="9" type="com.j2fe.translation.template.QueryParameter">
                    <description id="10">SOI</description>
                    <name id="11">SOI</name>
                    <type>12</type>
                </item>
            </parameters>
            <text id="12">SELECT  &#13;
    XMLELEMENT(NAME "VendorRequest",&#13;
        XMLELEMENT(NAME "User", 'WF'),&#13;
        XMLELEMENT(NAME "UserRequestID"),&#13;
        XMLELEMENT(NAME "Universe"),&#13;
        XMLAGG(&#13;
            XMLELEMENT(NAME "Request",&#13;
                XMLELEMENT(NAME "DataType", 'SECMASTER'),&#13;
                XMLELEMENT(NAME "Vendor", 'BB'),&#13;
                XMLELEMENT(NAME "TableType", 'ISSU'),&#13;
                XMLELEMENT(NAME "Identifier", iss_id),&#13;
                XMLELEMENT(NAME "IDContext", &#13;
                    CASE &#13;
                        WHEN id_ctxt_typ = 'BBUNIQUE' THEN 'BB_UNIQUE'&#13;
                        ELSE id_ctxt_typ&#13;
                    END)&#13;
            )&#13;
        )&#13;
    ) AS xml_output&#13;
FROM (&#13;
    SELECT DISTINCT &#13;
        isid.instr_id, &#13;
        isid.iss_id, &#13;
        isid.id_ctxt_typ, &#13;
        RANK() OVER (&#13;
            PARTITION BY isid.instr_id &#13;
            ORDER BY isid.id_ctxt_typ&#13;
        ) AS rank&#13;
    FROM ft_t_isid isid&#13;
    INNER JOIN ft_t_isgp isgp ON isgp.instr_id = isid.instr_id&#13;
    WHERE &#13;
        id_ctxt_typ IN ('BBUNIQUE', 'ISIN') AND&#13;
        sysdate() BETWEEN isid.start_tms AND COALESCE(isid.end_tms, sysdate()) AND&#13;
        isgp.start_tms &gt; DATE_TRUNC('day', sysdate()) AND&#13;
        sysdate() BETWEEN isgp.start_tms AND COALESCE(isgp.end_tms, sysdate()) AND&#13;
        NOT EXISTS (&#13;
            SELECT 1 FROM ft_t_isgp mt &#13;
            WHERE mt.instr_id = isgp.instr_id &#13;
            AND mt.prt_purp_typ = ?&#13;
            AND mt.start_tms &lt;= sysdate() &#13;
            AND (mt.end_tms IS NULL OR mt.end_tms &gt; sysdate())&#13;
        ) AND&#13;
        NOT EXISTS (&#13;
            SELECT 1 FROM ft_t_isgp bb &#13;
            WHERE bb.instr_id = isgp.instr_id &#13;
            AND bb.prt_purp_typ = ?&#13;
            AND bb.start_tms &lt;= sysdate() &#13;
            AND (bb.end_tms IS NULL OR bb.end_tms &gt; sysdate())&#13;
        ) AND&#13;
        isgp.prt_purp_typ = ?&#13;
) AS subquery&#13;
WHERE rank = 1;</text>
        </com.j2fe.translation.template.QueryDefinition>
    </businessobject>
</goldensource-package>
