<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.03">
<package-comment/>
<businessobject displayString="4 - V-10" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>false</alwaysPersist>
<clustered>false</clustered>
<comment id="1">V-10</comment>
<endNode id="2">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="3"/>
<directJoin>false</directJoin>
<name id="4">Stop</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="5">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="6" type="java.util.HashSet">
<item id="7" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="8">statements</name>
<stringValue id="9">import org.apache.log4j.Logger;&#13;
Logger logger = Logger.getLogger("Initialize RSRT workflow ");&#13;
&#13;
logger.info("Stopped.");</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="10" type="java.util.HashSet">
<item id="11" type="com.j2fe.workflow.definition.Transition">
<name id="12">goto-next</name>
<source id="13">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="14"/>
<directJoin>false</directJoin>
<name id="15">Info Log</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="16">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="17" type="java.util.HashSet">
<item id="18" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="19">statements</name>
<stringValue id="20">import org.apache.log4j.Logger;&#13;
Logger logger = Logger.getLogger("Initialize RSRT Workflow");&#13;
&#13;
logger.info("No new files found in directory '" + Directory + "' on filesystem '" + FileSystem + "'.");</stringValue>
<type>CONSTANT</type>
</item>
<item id="21" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="22">["Directory"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="23">variables["Directory"]</name>
<stringValue id="24">Directory</stringValue>
<type>VARIABLE</type>
</item>
<item id="25" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="26">["FileSystem"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="27">variables["FileSystem"]</name>
<stringValue id="28">FileSystem</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="29" type="java.util.HashSet">
<item id="30" type="com.j2fe.workflow.definition.Transition">
<name id="31">empty</name>
<source id="32">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="33"/>
<directJoin>false</directJoin>
<name id="34">List Files</name>
<nodeHandler>com.j2fe.feeds.activities.ListFiles</nodeHandler>
<nodeHandlerClass id="35">com.j2fe.feeds.activities.ListFiles</nodeHandlerClass>
<parameters id="36" type="java.util.HashSet">
<item id="37" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="38">businessFeedFilter</name>
<stringValue id="39">BusinessFeed</stringValue>
<type>VARIABLE</type>
</item>
<item id="40" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="41">dataSourceFilter</name>
<stringValue id="42">VendorDefinition</stringValue>
<type>VARIABLE</type>
</item>
<item id="43" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="44">directory</name>
<stringValue id="45">Directory</stringValue>
<type>VARIABLE</type>
</item>
<item id="46" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="47">fileSystem</name>
<stringValue id="48">FileSystem</stringValue>
<type>VARIABLE</type>
</item>
<item id="49" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="50">list</name>
<stringValue id="51">Files</stringValue>
<type>VARIABLE</type>
</item>
<item id="52" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="53">pattern</name>
<stringValue id="54">Patterns</stringValue>
<type>VARIABLE</type>
</item>
<item id="55" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="56">sort</name>
<stringValue id="57">SortOrder</stringValue>
<type>VARIABLE</type>
</item>
<item id="58" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="59">sortAscending</name>
<stringValue id="60">SortAscending</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="61" type="java.util.HashSet">
<item id="62" type="com.j2fe.workflow.definition.Transition">
<name id="63">goto-next</name>
<source id="64">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="65"/>
<directJoin>false</directJoin>
<name id="66">Start</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="67">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="68" type="java.util.HashSet">
<item id="69" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="70">statements</name>
<stringValue id="71">import org.apache.log4j.Logger;&#13;
Logger logger = Logger.getLogger("InitializeRSRT workflow");&#13;
&#13;
logger.info("Started.");</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="72" type="java.util.HashSet"/>
<targets id="73" type="java.util.HashSet">
<item idref="62" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="32"/>
</item>
</sources>
<targets id="74" type="java.util.HashSet">
<item idref="30" type="com.j2fe.workflow.definition.Transition"/>
<item id="75" type="com.j2fe.workflow.definition.Transition">
<name id="76">not-empty</name>
<source idref="32"/>
<target id="77">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="78">Automatically generated</description>
<directJoin>false</directJoin>
<name id="79">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="80">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="81" type="java.util.HashSet">
<item id="82" type="com.j2fe.workflow.definition.Transition">
<name id="83">goto-next</name>
<source id="84">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="85"/>
<directJoin>false</directJoin>
<name id="86">NOP</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="87">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="88" type="java.util.HashSet">
<item id="89" type="com.j2fe.workflow.definition.Transition">
<name id="90">false</name>
<source id="91">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="92"/>
<directJoin>false</directJoin>
<name id="93">Is New File?</name>
<nodeHandler>com.j2fe.feeds.activities.CheckRestart</nodeHandler>
<nodeHandlerClass id="94">com.j2fe.feeds.activities.CheckRestart</nodeHandlerClass>
<parameters id="95" type="java.util.HashSet">
<item id="96" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="97">file</name>
<stringValue id="98">File</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="99" type="java.util.HashSet">
<item id="100" type="com.j2fe.workflow.definition.Transition">
<name id="101">loop</name>
<source id="102">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="103"/>
<directJoin>false</directJoin>
<name id="104">For Loop</name>
<nodeHandler>com.j2fe.workflow.handler.impl.ForEach</nodeHandler>
<nodeHandlerClass id="105">com.j2fe.workflow.handler.impl.ForEach</nodeHandlerClass>
<parameters id="106" type="java.util.HashSet">
<item id="107" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="108">counter</name>
<stringValue id="109">FileCounter</stringValue>
<type>VARIABLE</type>
</item>
<item id="110" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="111">counter</name>
<stringValue id="112">FileCounter</stringValue>
<type>VARIABLE</type>
</item>
<item id="113" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="114">input</name>
<stringValue id="115">Files</stringValue>
<type>VARIABLE</type>
</item>
<item id="116" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="117">output</name>
<stringValue id="118">File</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="119" type="java.util.HashSet">
<item id="120" type="com.j2fe.workflow.definition.Transition">
<name id="121">ToSplit</name>
<source idref="77"/>
<target idref="102"/>
</item>
</sources>
<targets id="122" type="java.util.HashSet">
<item id="123" type="com.j2fe.workflow.definition.Transition">
<name id="124">end-loop</name>
<source idref="102"/>
<target id="125">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="126"/>
<directJoin>false</directJoin>
<name id="127">Files Available?</name>
<nodeHandler>com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandler>
<nodeHandlerClass id="128">com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandlerClass>
<parameters id="129" type="java.util.HashSet">
<item id="130" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="131">caseItem</name>
<stringValue id="132">FilesAvailable</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="133" type="java.util.HashSet">
<item idref="123" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="134" type="java.util.HashSet">
<item id="135" type="com.j2fe.workflow.definition.Transition">
<name id="136">false</name>
<source idref="125"/>
<target idref="13"/>
</item>
<item id="137" type="com.j2fe.workflow.definition.Transition">
<name id="138">true</name>
<source idref="125"/>
<target idref="2"/>
</item>
</targets>
<type>XORSPLIT</type>
</target>
</item>
<item idref="100" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="91"/>
</item>
</sources>
<targets id="139" type="java.util.HashSet">
<item idref="89" type="com.j2fe.workflow.definition.Transition"/>
<item id="140" type="com.j2fe.workflow.definition.Transition">
<name id="141">true</name>
<source idref="91"/>
<target id="142">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="143"/>
<directJoin>false</directJoin>
<name id="144">SET DONE_IND=Y</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="145">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="146" type="java.util.HashSet">
<item id="147" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="148">database</name>
<stringValue id="149">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="150" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="151">[0]@java/io/File@</UITypeHint>
<input>true</input>
<name id="152">indexedParameters[0]</name>
<stringValue id="153">File</stringValue>
<type>VARIABLE</type>
<variablePart id="154">name</variablePart>
</item>
<item id="155" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="156">querySQL</name>
<stringValue id="157">UPDATE FT_O_RSRT SET DONE_IND = 'Y' WHERE POSITION(REPLACE(?, '//./', '/') IN FILE_ID) &gt; 0</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="158" type="java.util.HashSet">
<item idref="140" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="159" type="java.util.HashSet">
<item id="160" type="com.j2fe.workflow.definition.Transition">
<name id="161">goto-next</name>
<source idref="142"/>
<target idref="84"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="84"/>
</item>
<item idref="160" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="162" type="java.util.HashSet">
<item idref="82" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="77"/>
</item>
<item idref="75" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="163" type="java.util.HashSet">
<item idref="120" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</target>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="13"/>
</item>
<item idref="135" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="164" type="java.util.HashSet">
<item idref="11" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="2"/>
</item>
<item idref="137" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="165" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="166">Mizuho</group>
<haltOnError>true</haltOnError>
<lastChangeUser id="167">user1</lastChangeUser>
<lastUpdate id="168">2025-05-28T10:36:34.000+0100</lastUpdate>
<name id="169">InitializeRSRT</name>
<nodes id="170" type="java.util.HashSet">
<item idref="125" type="com.j2fe.workflow.definition.Node"/>
<item idref="102" type="com.j2fe.workflow.definition.Node"/>
<item idref="13" type="com.j2fe.workflow.definition.Node"/>
<item idref="91" type="com.j2fe.workflow.definition.Node"/>
<item idref="32" type="com.j2fe.workflow.definition.Node"/>
<item idref="77" type="com.j2fe.workflow.definition.Node"/>
<item idref="84" type="com.j2fe.workflow.definition.Node"/>
<item idref="142" type="com.j2fe.workflow.definition.Node"/>
<item idref="64" type="com.j2fe.workflow.definition.Node"/>
<item idref="2" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>true</optimize>
<parameter id="171" type="java.util.HashMap">
<entry>
<key id="172" type="java.lang.String">BusinessFeed</key>
<value id="173" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="174">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="175">Business Feed name</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="176" type="java.lang.String">Directory</key>
<value id="177" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="178">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="179">Vendor filesystem directory</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="180" type="java.lang.String">FileSystem</key>
<value id="181" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="182">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="183">Vendor filesystem  e.g. filesystem/ftp/persecurity</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="184" type="java.lang.String">FilesAvailable</key>
<value id="185" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="186">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="187" type="java.lang.String">Patterns</key>
<value id="188" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="189">[Ljava.lang.String;</className>
<clazz>[Ljava.lang.String;</clazz>
<description id="190">Vendor File patterns</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="191" type="java.lang.String">RecursiveSearch</key>
<value id="192" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="193">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="194" type="java.lang.String">SortAscending</key>
<value id="195" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="196">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="197" type="java.lang.String">SortOrder</key>
<value id="198" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="199">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="200" type="java.lang.String">VendorDefinition</key>
<value id="201" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="202">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
</parameter>
<permissions id="203" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>true</purgeAtEnd>
<retries>3</retries>
<startNode idref="64"/>
<status>RELEASED</status>
<variables id="204" type="java.util.HashMap">
<entry>
<key id="205" type="java.lang.String">BusinessFeed</key>
<value id="206" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="207">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="208">Business Feed name</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="209" type="java.lang.String">Directory</key>
<value id="210" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="211">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="212">Vendor filesystem directory</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="213" type="java.lang.String">FileCounter</key>
<value id="214" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="215">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<persistent>false</persistent>
<value id="216" type="java.lang.Integer">0</value>
</value>
</entry>
<entry>
<key id="217" type="java.lang.String">FileSystem</key>
<value id="218" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="219">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="220">Vendor filesystem  e.g. filesystem/ftp/persecurity</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="221" type="java.lang.String">FilesAvailable</key>
<value id="222" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="223">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<persistent>false</persistent>
<value id="224" type="java.lang.Boolean">false</value>
</value>
</entry>
<entry>
<key id="225" type="java.lang.String">Patterns</key>
<value id="226" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="227">[Ljava.lang.String;</className>
<clazz>[Ljava.lang.String;</clazz>
<description id="228">Vendor File patterns</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="229" type="java.lang.String">RecursiveSearch</key>
<value id="230" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="231">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<persistent>false</persistent>
<value idref="224"/>
</value>
</entry>
<entry>
<key id="232" type="java.lang.String">SortAscending</key>
<value id="233" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="234">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<persistent>false</persistent>
<value id="235" type="java.lang.Boolean">true</value>
</value>
</entry>
<entry>
<key id="236" type="java.lang.String">SortOrder</key>
<value id="237" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="238">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="239" type="java.lang.String">NATURAL</value>
</value>
</entry>
<entry>
<key id="240" type="java.lang.String">VendorDefinition</key>
<value id="241" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="242">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
</variables>
<version>4</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
