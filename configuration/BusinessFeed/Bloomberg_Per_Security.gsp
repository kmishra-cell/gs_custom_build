<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<goldensource-package version="10.0.0.02">
    <package-comment/>
    <businessobject displayString="Bloomberg_Per_Security" type="com.j2fe.processing.BusinessFeed">
        <com.j2fe.processing.BusinessFeed id="0">
            <dataSource id="1">
                <businessFeeds id="2" type="java.util.HashSet">
                    <item idref="0" type="com.j2fe.processing.BusinessFeed"/>
                </businessFeeds>
                <id id="3">BB</id>
            </dataSource>
            <feedDefinition id="4">db://resource/xml/feeds/bloomberg/getdata.xml</feedDefinition>
            <fileDefinitions id="5" type="java.util.ArrayList"/>
            <grouping>false</grouping>
            <messageTypes id="6" type="java.util.HashSet"/>
            <name id="7">Bloomberg_Per_Security</name>
        </com.j2fe.processing.BusinessFeed>
    </businessobject>
</goldensource-package>
