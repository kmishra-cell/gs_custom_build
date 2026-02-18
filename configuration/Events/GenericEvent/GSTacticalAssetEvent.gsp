<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<goldensource-package version="8.4.1.288">
<package-comment/>
<businessobject displayString="GSTacticalAssetEvent" type="com.j2fe.event.ApplicationEvent">
<com.j2fe.event.ApplicationEvent id="0">
<clazz id="1">com.j2fe.event.GenericEvent</clazz>
<description id="2">Consume cmfAsset messages in the event of using the GS tactical tool</description>
<name id="3">GSTacticalAssetEvent</name>
<parameter id="4" type="java.util.HashMap">
<entry>
<key id="5" type="java.lang.String">Directory</key>
<value id="6" type="java.lang.String">/opt/gs/jboss-dev/jboss-as/server/development/GS-QueueMsg/assetInput/input</value>
</entry>
<entry>
<key id="7" type="java.lang.String">MessageType</key>
<value id="8" type="java.lang.String">GSTACTICALASSETRELIVE</value>
</entry>
<entry>
<key id="9" type="java.lang.String">OutputDirectory</key>
<value id="10" type="java.lang.String">/opt/gs/jboss-dev/jboss-as/server/development/GS-QueueMsg/assetInput/output</value>
</entry>
<entry>
<key id="11" type="java.lang.String">SuccessAction</key>
<value id="12" type="java.lang.String">MOVE</value>
</entry>
</parameter>
<workflow id="13">Process Files in Directory</workflow>
</com.j2fe.event.ApplicationEvent>
</businessobject>
</goldensource-package>
