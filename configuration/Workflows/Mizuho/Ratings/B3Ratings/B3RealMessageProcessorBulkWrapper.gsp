<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.03">
<package-comment/>
<businessobject displayString="3 - GU-313" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>false</alwaysPersist>
<clustered>true</clustered>
<comment id="1">GU-313</comment>
<endNode id="2">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="3">Stop</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="4">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="5" type="java.util.HashSet">
<item id="6" type="com.j2fe.workflow.definition.Transition">
<name id="7">end-loop</name>
<source id="8">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="9">For Loop</name>
<nodeHandler>com.j2fe.workflow.handler.impl.ForEach</nodeHandler>
<nodeHandlerClass id="10">com.j2fe.workflow.handler.impl.ForEach</nodeHandlerClass>
<parameters id="11" type="java.util.HashSet">
<item id="12" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="13">counter</name>
<stringValue id="14">loopCnt</stringValue>
<type>VARIABLE</type>
</item>
<item id="15" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="16">counter</name>
<stringValue id="17">loopCnt</stringValue>
<type>VARIABLE</type>
</item>
<item id="18" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="19">input</name>
<stringValue id="20">bulkRealMsgs</stringValue>
<type>VARIABLE</type>
</item>
<item id="21" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="22">output</name>
<stringValue id="23">singleMsgRaw</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="24" type="java.util.HashSet">
<item id="25" type="com.j2fe.workflow.definition.Transition">
<name id="26">ToSplit</name>
<source id="27">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="28">Automatically generated</description>
<directJoin>false</directJoin>
<name id="29">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="30">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="31" type="java.util.HashSet">
<item id="32" type="com.j2fe.workflow.definition.Transition">
<name id="33">goto-next</name>
<source id="34">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="35">Call Subworkflow</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="36">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="37" type="java.util.HashSet">
<item id="38" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="39">["JobID"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="40">input["JobID"]</name>
<stringValue id="41">JobID</stringValue>
<type>VARIABLE</type>
</item>
<item id="42" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="43">["realMsg"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="44">input["realMsg"]</name>
<stringValue id="45">singleMsgRaw</stringValue>
<type>VARIABLE</type>
</item>
<item id="46" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="47">name</name>
<stringValue id="48">B3RealMessageProcessor</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="49" type="java.util.HashSet">
<item id="50" type="com.j2fe.workflow.definition.Transition">
<name id="51">loop</name>
<source idref="8"/>
<target idref="34"/>
</item>
</sources>
<targets id="52" type="java.util.HashSet">
<item idref="32" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="27"/>
</item>
<item id="53" type="com.j2fe.workflow.definition.Transition">
<name id="54">goto-next</name>
<source id="55">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="56">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="57">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="58" type="java.util.HashSet"/>
<targets id="59" type="java.util.HashSet">
<item idref="53" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="27"/>
</item>
</sources>
<targets id="60" type="java.util.HashSet">
<item idref="25" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="8"/>
</item>
</sources>
<targets id="61" type="java.util.HashSet">
<item idref="6" type="com.j2fe.workflow.definition.Transition"/>
<item idref="50" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="2"/>
</item>
</sources>
<targets id="62" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="63">Mizuho/Ratings/B3Ratings</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="64">user1</lastChangeUser>
<lastUpdate id="65">2025-07-25T11:57:13.000+0100</lastUpdate>
<name id="66">B3RealMessageProcessorBulkWrapper</name>
<nodes id="67" type="java.util.HashSet">
<item idref="34" type="com.j2fe.workflow.definition.Node"/>
<item idref="8" type="com.j2fe.workflow.definition.Node"/>
<item idref="27" type="com.j2fe.workflow.definition.Node"/>
<item idref="55" type="com.j2fe.workflow.definition.Node"/>
<item idref="2" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>true</optimize>
<parameter id="68" type="java.util.HashMap">
<entry>
<key id="69" type="java.lang.String">JobID</key>
<value id="70" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="71">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="72" type="java.lang.String">bulkRealMsgs</key>
<value id="73" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="74">[Ljava.lang.String;</className>
<clazz>[Ljava.lang.String;</clazz>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
</parameter>
<permissions id="75" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>true</purgeAtEnd>
<retries>0</retries>
<startNode idref="55"/>
<status>RELEASED</status>
<variables id="76" type="java.util.HashMap">
<entry>
<key id="77" type="java.lang.String">JobID</key>
<value id="78" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="79">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="80" type="java.lang.String">bulkRealMsgs</key>
<value id="81" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="82">[Ljava.lang.String;</className>
<clazz>[Ljava.lang.String;</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="83" type="java.lang.String">loopCnt</key>
<value id="84" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="85">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<persistent>false</persistent>
<value id="86" type="java.lang.Integer">0</value>
</value>
</entry>
</variables>
<version>3</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
