<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<goldensource-package version="8.4.1.94REL">
<package-comment>EG-1597 COB for RegRep initial version</package-comment>
<businessobject displayString="MZ_CustomerOBReportRegRep" type="com.j2fe.event.ApplicationEvent">
<com.j2fe.event.ApplicationEvent id="0">
<clazz id="1">com.j2fe.event.GenericEvent</clazz>
<description id="2">Weekly COB report for RegRep. Based on the daily COB report with additional items (BOE, Classifications).</description>
<name id="3">MZ_CustomerOBReportRegRep</name>
<parameter id="4" type="java.util.HashMap">
<entry>
<key id="5" type="java.lang.String">FtpFileDirectory</key>
<value id="6" type="java.lang.String">/opt/gs/reports/CustomerOBReportRegRep</value>
</entry>
<entry>
<key id="7" type="java.lang.String">LastNumDaysToCheck</key>
<value id="8" type="java.lang.String">7</value>
</entry>
</parameter>
<workflow id="9">MZ_CustomerOBReportRegRep</workflow>
</com.j2fe.event.ApplicationEvent>
</businessobject>
</goldensource-package>
