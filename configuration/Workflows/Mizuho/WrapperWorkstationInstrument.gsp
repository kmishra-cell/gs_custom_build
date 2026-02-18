<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.04">
<package-comment/>
<businessobject displayString="25 - v10" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>true</alwaysPersist>
<clustered>true</clustered>
<comment id="1">v10</comment>
<description id="2"/>
<endNode id="3">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="4"/>
<directJoin>false</directJoin>
<name id="5">Stop</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="6">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="7" type="java.util.HashSet">
<item id="8" type="com.j2fe.workflow.definition.Transition">
<name id="9">goto-next</name>
<source id="10">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="11"/>
<directJoin>false</directJoin>
<name id="12">Raise Event #1</name>
<nodeHandler>com.j2fe.event.RaiseEvent</nodeHandler>
<nodeHandlerClass id="13">com.j2fe.event.RaiseEvent</nodeHandlerClass>
<parameters id="14" type="java.util.HashSet">
<item id="15" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="16">eventName</name>
<stringValue id="17">WrapperWorkstationInstrumentSub_Event</stringValue>
<type>CONSTANT</type>
</item>
<item id="18" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="19">["IsrtXpath"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="20">parameters["IsrtXpath"]</name>
<stringValue id="21">IsrtXpath</stringValue>
<type>VARIABLE</type>
</item>
<item id="22" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="23">["Messages"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="24">parameters["Messages"]</name>
<stringValue id="25">Messages</stringValue>
<type>VARIABLE</type>
<variablePart id="26">[0]</variablePart>
</item>
<item id="27" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="28">["ModelId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="29">parameters["ModelId"]</name>
<stringValue id="30">ModelId</stringValue>
<type>VARIABLE</type>
</item>
<item id="31" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="32">["Result"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="33">parameters["Result"]</name>
<stringValue id="34">Result</stringValue>
<type>VARIABLE</type>
</item>
<item id="35" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="36">["TransactionId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="37">parameters["TransactionId"]</name>
<stringValue id="38">TransactionId</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="39" type="java.util.HashSet">
<item id="40" type="com.j2fe.workflow.definition.Transition">
<name id="41">goto-next</name>
<source id="42">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="43"/>
<directJoin>false</directJoin>
<name id="44">Call Workstation W/F</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="45">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="46" type="java.util.HashSet">
<item id="47" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="48">["Database"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="49">input["Database"]</name>
<stringValue id="50">filesystem/local/user</stringValue>
<type>REFERENCE</type>
</item>
<item id="51" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="52">["IsWorkstationMessage"]@java/lang/Boolean@</UITypeHint>
<input>true</input>
<name id="53">input["IsWorkstationMessage"]</name>
<objectValue id="54" type="java.lang.Boolean">true</objectValue>
<type>CONSTANT</type>
</item>
<item id="55" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="56">["MessageType"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="57">input["MessageType"]</name>
<objectValue id="58" type="java.lang.String">SD</objectValue>
<type>CONSTANT</type>
</item>
<item id="59" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="60">["Messages"]@[Ljava/lang/String;@</UITypeHint>
<input>true</input>
<name id="61">input["Messages"]</name>
<stringValue id="62">Messages</stringValue>
<type>VARIABLE</type>
<variablePart id="63">[0]</variablePart>
</item>
<item id="64" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="65">name</name>
<stringValue id="66">Workstation Workflow</stringValue>
<type>CONSTANT</type>
</item>
<item id="67" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="68">output["Result"]</name>
<stringValue id="69">Result</stringValue>
<type>VARIABLE</type>
</item>
<item id="70" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="71">output["TransactionId"]</name>
<stringValue id="72">TransactionId</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="73" type="java.util.HashSet">
<item id="74" type="com.j2fe.workflow.definition.Transition">
<name id="75">goto-next</name>
<source id="76">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="77"/>
<directJoin>false</directJoin>
<name id="78">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="79">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="80" type="java.util.HashSet"/>
<targets id="81" type="java.util.HashSet">
<item idref="74" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="42"/>
</item>
</sources>
<targets id="82" type="java.util.HashSet">
<item idref="40" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="10"/>
</item>
</sources>
<targets id="83" type="java.util.HashSet">
<item idref="8" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="3"/>
</item>
</sources>
<targets id="84" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="85">Mizuho</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="86">user1</lastChangeUser>
<lastUpdate id="87">2025-10-30T14:00:21.000+0000</lastUpdate>
<name id="88">WrapperWorkstationInstrument</name>
<nodes id="89" type="java.util.HashSet">
<item idref="42" type="com.j2fe.workflow.definition.Node"/>
<item idref="10" type="com.j2fe.workflow.definition.Node"/>
<item idref="76" type="com.j2fe.workflow.definition.Node"/>
<item idref="3" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>false</optimize>
<parameter id="90" type="java.util.HashMap">
<entry>
<key id="91" type="java.lang.String">IsrtXpath</key>
<value id="92" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="93">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="94" type="java.lang.String">Messages</key>
<value id="95" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="96">[Ljava.lang.String;</className>
<clazz>[Ljava.lang.String;</clazz>
<description id="97"/>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="98" type="java.lang.String">ModelId</key>
<value id="99" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="100">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="101">			</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="102" type="java.lang.String">Result</key>
<value id="103" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="104">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>false</input>
<output>true</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="105" type="java.lang.String">TransactionId</key>
<value id="106" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="107">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>false</input>
<output>true</output>
<required>false</required>
</value>
</entry>
</parameter>
<permissions id="108" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>false</purgeAtEnd>
<retries>0</retries>
<startNode idref="76"/>
<status>RELEASED</status>
<variables id="109" type="java.util.HashMap">
<entry>
<key id="110" type="java.lang.String">ISRTOidArr</key>
<value id="111" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="112">[Ljava.lang.String;</className>
<clazz>[Ljava.lang.String;</clazz>
<persistent>true</persistent>
</value>
</entry>
<entry>
<key id="113" type="java.lang.String">IsrtXpath</key>
<value id="114" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="115">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="116" type="java.lang.String">/STREET_REF/SEGMENT[@TYPE="IssueRating"]/IssueRating/ISSRTNGOID/@VALUE</value>
</value>
</entry>
<entry>
<key id="117" type="java.lang.String">Messages</key>
<value id="118" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="119">[Ljava.lang.String;</className>
<clazz>[Ljava.lang.String;</clazz>
<description id="120"/>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="121" type="java.lang.String">ModelId</key>
<value id="122" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="123">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="124">			</description>
<persistent>false</persistent>
<value id="125" type="java.lang.String">ISSUPUB</value>
</value>
</entry>
<entry>
<key id="126" type="java.lang.String">Result</key>
<value id="127" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="128">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="129" type="java.lang.String">TransactionId</key>
<value id="130" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="131">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
</variables>
<version>25</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
