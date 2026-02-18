<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<goldensource-package version="8.4.1.288">
<package-comment/>
<businessobject displayString="cmfSOIAdditionEvent" type="com.j2fe.event.ApplicationEvent">
<com.j2fe.event.ApplicationEvent id="0">
<clazz id="1">com.j2fe.event.OnJMSMessage</clazz>
<description id="2">trigger cmfSOIAdditionWrapper workflow to allow processing of each SOI group individually. This is to avoid split /duplicate instruments and ensure all instruments are added to all relevant groups</description>
<name id="3">cmfSOIAdditionEvent</name>
<parameter id="4" type="java.util.HashMap"/>
<workflow id="5">cmfSOIAdditionWrapper</workflow>
</com.j2fe.event.ApplicationEvent>
</businessobject>
</goldensource-package>
