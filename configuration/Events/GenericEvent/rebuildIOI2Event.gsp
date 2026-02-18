<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<goldensource-package version="8.4.1.288">
<package-comment/>
<businessobject displayString="rebuildIOI2Event" type="com.j2fe.event.ApplicationEvent">
<com.j2fe.event.ApplicationEvent id="0">
<clazz id="1">com.j2fe.event.GenericEvent</clazz>
<description id="2">trigger rebuildIOI2 workflow.&#13;
Required parameters are &#13;
OrgId&#13;
SubdivId</description>
<name id="3">rebuildIOI2Event</name>
<parameter id="4" type="java.util.HashMap">
<entry>
<key id="5" type="java.lang.String">OrgId</key>
<value id="6" type="java.lang.String">MHBK</value>
</entry>
<entry>
<key id="7" type="java.lang.String">SubdivId</key>
<value id="8" type="java.lang.String">LDN</value>
</entry>
</parameter>
<workflow id="9">rebuildIOI2</workflow>
</com.j2fe.event.ApplicationEvent>
</businessobject>
</goldensource-package>
