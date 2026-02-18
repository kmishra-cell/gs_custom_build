<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.03">
<package-comment/>
<businessobject displayString="3 - V-10" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>true</alwaysPersist>
<clustered>false</clustered>
<comment id="1">V-10</comment>
<endNode id="2">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="3"/>
<directJoin>false</directJoin>
<name id="4">Stop</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="5">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="6" type="java.util.HashSet">
<item id="7" type="com.j2fe.workflow.definition.Transition">
<name id="8">goto-next</name>
<source id="9">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="10"/>
<directJoin>false</directJoin>
<name id="11">Write File to FTP Loc</name>
<nodeHandler>com.j2fe.general.activities.File</nodeHandler>
<nodeHandlerClass id="12">com.j2fe.general.activities.File</nodeHandlerClass>
<parameters id="13" type="java.util.HashSet">
<item id="14" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="15">directory</name>
<stringValue id="16">DestinationFTP</stringValue>
<type>VARIABLE</type>
</item>
<item id="17" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="18">fileName</name>
<stringValue id="19">filename</stringValue>
<type>VARIABLE</type>
</item>
<item id="20" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="21">text</name>
<stringValue id="22">inputMgs</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="23" type="java.util.HashSet">
<item id="24" type="com.j2fe.workflow.definition.Transition">
<name id="25">goto-next</name>
<source id="26">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="27"/>
<directJoin>false</directJoin>
<name id="28">Create File Name</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="29">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="30" type="java.util.HashSet">
<item id="31" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="32">statements</name>
<stringValue id="33">import java.util.Date;&#13;
&#13;
import java.text.DateFormat;&#13;
&#13;
import java.text.SimpleDateFormat;&#13;
&#13;
DateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd-HH_mm_ss_SSS");&#13;
&#13;
Date date = new Date();&#13;
&#13;
String filename = basename+"_"+ dateFormat.format(date) + ".xml";&#13;
</stringValue>
<type>CONSTANT</type>
</item>
<item id="34" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="35">["basename"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="36">variables["basename"]</name>
<stringValue id="37">BaseName</stringValue>
<type>VARIABLE</type>
</item>
<item id="38" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="39">["filename"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="40">variables["filename"]</name>
<stringValue id="41">filename</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="42" type="java.util.HashSet">
<item id="43" type="com.j2fe.workflow.definition.Transition">
<name id="44">goto-next</name>
<source id="45">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="46"/>
<directJoin>false</directJoin>
<name id="47">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="48">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="49" type="java.util.HashSet"/>
<targets id="50" type="java.util.HashSet">
<item idref="43" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="26"/>
</item>
</sources>
<targets id="51" type="java.util.HashSet">
<item idref="24" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="9"/>
</item>
</sources>
<targets id="52" type="java.util.HashSet">
<item idref="7" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="2"/>
</item>
</sources>
<targets id="53" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="54">Mizuho</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="55">user1</lastChangeUser>
<lastUpdate id="56">2025-05-29T02:05:59.000+0100</lastUpdate>
<name id="57">WriteFile</name>
<nodes id="58" type="java.util.HashSet">
<item idref="26" type="com.j2fe.workflow.definition.Node"/>
<item idref="45" type="com.j2fe.workflow.definition.Node"/>
<item idref="2" type="com.j2fe.workflow.definition.Node"/>
<item idref="9" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>false</optimize>
<parameter id="59" type="java.util.HashMap">
<entry>
<key id="60" type="java.lang.String">BaseName</key>
<value id="61" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="62">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="63" type="java.lang.String">DestinationFTP</key>
<value id="64" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="65">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="66" type="java.lang.String">filename</key>
<value id="67" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="68">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>false</input>
<output>true</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="69" type="java.lang.String">inputMgs</key>
<value id="70" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="71">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
</parameter>
<permissions id="72" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>false</purgeAtEnd>
<retries>0</retries>
<startNode idref="45"/>
<status>RELEASED</status>
<variables id="73" type="java.util.HashMap">
<entry>
<key id="74" type="java.lang.String">BaseName</key>
<value id="75" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="76">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="77" type="java.lang.String">Test</value>
</value>
</entry>
<entry>
<key id="78" type="java.lang.String">DestinationFTP</key>
<value id="79" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="80">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="81" type="java.lang.String">${gs.bin.path}/../tmp</value>
</value>
</entry>
<entry>
<key id="82" type="java.lang.String">filename</key>
<value id="83" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="84">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>true</persistent>
</value>
</entry>
<entry>
<key id="85" type="java.lang.String">inputMgs</key>
<value id="86" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="87">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
</variables>
<version>3</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
