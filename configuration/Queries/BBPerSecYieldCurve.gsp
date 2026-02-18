<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<goldensource-package version="10.0.0.02">
    <package-comment/>
    <businessobject displayString="BBPerSecYieldCurve" type="com.j2fe.translation.template.QueryDefinition">
        <com.j2fe.translation.template.QueryDefinition id="0">
            <name id="1">BBPerSecYieldCurve</name>
            <parameters id="2" type="java.util.ArrayList"/>
            <text id="3">SELECT  &#13;
    XMLELEMENT(NAME "VendorRequest",&#13;
        XMLELEMENT(NAME "User", 'YieldCurves'),&#13;
        XMLELEMENT(NAME "Requestor", 'YieldCurves'),&#13;
        XMLELEMENT(NAME "UserRequestID"),&#13;
        XMLELEMENT(NAME "Universe"),&#13;
        XMLAGG(&#13;
            XMLELEMENT(NAME "Request",&#13;
                XMLELEMENT(NAME "RequestType", 'IndexPricing'),&#13;
                XMLELEMENT(NAME "Vendor", 'BB'),&#13;
                XMLELEMENT(NAME "TableType", 'ISSU'),&#13;
                XMLELEMENT(NAME "Identifier", iss_id),&#13;
                XMLELEMENT(NAME "IDContext", &#13;
                    CASE &#13;
                        WHEN id_ctxt_typ = 'BBUNIQUE' THEN 'BB_UNIQUE'&#13;
                        WHEN id_ctxt_typ = 'BB8CHR' THEN 'TICKER'&#13;
                        ELSE id_ctxt_typ&#13;
                    END),&#13;
                CASE &#13;
                    WHEN cl_value IS NOT NULL THEN XMLELEMENT(NAME "Param", XMLATTRIBUTES('MarketSector' AS "Key"), cl_value)&#13;
                    ELSE NULL &#13;
                END&#13;
            )&#13;
        )&#13;
    ) AS xml_output&#13;
FROM (&#13;
    SELECT DISTINCT &#13;
        isid.instr_id, &#13;
        isid.iss_id, &#13;
        isid.id_ctxt_typ, &#13;
        iscl.cl_value, &#13;
        RANK() OVER (&#13;
            PARTITION BY isid.instr_id &#13;
            ORDER BY &#13;
                CASE WHEN isid.id_ctxt_typ = 'BB8CHR' THEN 'TICKER' ELSE isid.id_ctxt_typ END&#13;
        ) AS rank&#13;
    FROM ft_t_isid isid&#13;
    LEFT JOIN ft_t_iscl iscl ON &#13;
        isid.instr_id = iscl.instr_id AND &#13;
        iscl.indus_cl_set_id = 'BBMKTSCT' AND&#13;
        iscl.start_tms &lt;= sysdate() AND &#13;
        (iscl.end_tms IS NULL OR iscl.end_tms &gt; sysdate())&#13;
    LEFT JOIN ft_t_iscl bbsec ON &#13;
        isid.instr_id = bbsec.instr_id AND &#13;
        bbsec.indus_cl_set_id = 'BBSECTYP' AND&#13;
        bbsec.start_tms &lt;= sysdate() AND &#13;
        (bbsec.end_tms IS NULL OR bbsec.end_tms &gt; sysdate())&#13;
    WHERE &#13;
        id_ctxt_typ IN ('BBUNIQUE', 'ISIN', 'BB8CHR') AND&#13;
        isid.start_tms &lt;= sysdate() AND &#13;
        (isid.end_tms IS NULL OR isid.end_tms &gt; sysdate()) AND&#13;
        bbsec.cl_value = 'Yield Curve' AND&#13;
        EXISTS (&#13;
            SELECT 1 FROM ft_t_isgp inv &#13;
            WHERE inv.instr_id = isid.instr_id &#13;
            AND inv.prt_purp_typ = 'INTEREST'&#13;
            AND inv.start_tms &lt;= sysdate() &#13;
            AND (inv.end_tms IS NULL OR inv.end_tms &gt; sysdate())&#13;
        )&#13;
) AS subquery&#13;
WHERE rank = 1;</text>
        </com.j2fe.translation.template.QueryDefinition>
    </businessobject>
</goldensource-package>
