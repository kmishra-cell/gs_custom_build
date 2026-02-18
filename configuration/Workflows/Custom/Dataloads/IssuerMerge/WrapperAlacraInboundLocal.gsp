<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<goldensource-package version="10.0.0.02">
    <package-comment/>
    <businessobject displayString="6 - V10_FinalTest" type="com.j2fe.workflow.definition.Workflow">
        <com.j2fe.workflow.definition.Workflow id="0">
            <alwaysPersist>true</alwaysPersist>
            <clustered>false</clustered>
            <comment id="1">V10_FinalTest</comment>
            <description id="2">To Create a pass the Parent Job id to the sub workflow.</description>
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
                            <description idref="4"/>
                            <directJoin>false</directJoin>
                            <name id="11">Close Job</name>
                            <nodeHandler>com.j2fe.streetlamp.activities.CloseJob</nodeHandler>
                            <nodeHandlerClass id="12">com.j2fe.streetlamp.activities.CloseJob</nodeHandlerClass>
                            <parameters id="13" type="java.util.HashSet">
                                <item id="14" type="com.j2fe.workflow.definition.Parameter">
                                    <input>true</input>
                                    <name id="15">jobId</name>
                                    <stringValue id="16">ParentJobID</stringValue>
                                    <type>VARIABLE</type>
                                </item>
                            </parameters>
                            <sources id="17" type="java.util.HashSet">
                                <item id="18" type="com.j2fe.workflow.definition.Transition">
                                    <name id="19">goto-next</name>
                                    <source id="20">
                                        <activation>INVOKE</activation>
                                        <clusteredCall>false</clusteredCall>
                                        <description idref="4"/>
                                        <directJoin>false</directJoin>
                                        <name id="21">Consolidate Job</name>
                                        <nodeHandler>com.j2fe.streetlamp.activities.ConsolidateJob</nodeHandler>
                                        <nodeHandlerClass id="22">com.j2fe.streetlamp.activities.ConsolidateJob</nodeHandlerClass>
                                        <parameters id="23" type="java.util.HashSet">
                                            <item id="24" type="com.j2fe.workflow.definition.Parameter">
                                                <input>true</input>
                                                <name id="25">jobId</name>
                                                <stringValue id="26">ParentJobID</stringValue>
                                                <type>VARIABLE</type>
                                            </item>
                                        </parameters>
                                        <sources id="27" type="java.util.HashSet">
                                            <item id="28" type="com.j2fe.workflow.definition.Transition">
                                                <name id="29">goto-next</name>
                                                <source id="30">
                                                    <activation>INVOKE</activation>
                                                    <clusteredCall>false</clusteredCall>
                                                    <description idref="4"/>
                                                    <directJoin>false</directJoin>
                                                    <name id="31">Call Subworkflow</name>
                                                    <nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
                                                    <nodeHandlerClass id="32">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
                                                    <parameters id="33" type="java.util.HashSet">
                                                        <item id="34" type="com.j2fe.workflow.definition.Parameter">
                                                            <UITypeHint id="35">["AlacraInboundLocalDirectory"]@java/lang/String@</UITypeHint>
                                                            <input>true</input>
                                                            <name id="36">input["AlacraInboundLocalDirectory"]</name>
                                                            <stringValue id="37">AlacraInboundLocalDirectory</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                        <item id="38" type="com.j2fe.workflow.definition.Parameter">
                                                            <UITypeHint id="39">["AlacraInboundProcessedDirectory"]@java/lang/String@</UITypeHint>
                                                            <input>true</input>
                                                            <name id="40">input["AlacraInboundProcessedDirectory"]</name>
                                                            <stringValue id="41">AlacraInboundProcessedDirectory</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                        <item id="42" type="com.j2fe.workflow.definition.Parameter">
                                                            <UITypeHint id="43">["BaseFileName"]@java/lang/String@</UITypeHint>
                                                            <input>true</input>
                                                            <name id="44">input["BaseFileName"]</name>
                                                            <stringValue id="45">ParentJobID</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                        <item id="46" type="com.j2fe.workflow.definition.Parameter">
                                                            <UITypeHint id="47">["File"]@java/lang/String@</UITypeHint>
                                                            <input>true</input>
                                                            <name id="48">input["File"]</name>
                                                            <stringValue id="49">FileParameterNotSet</stringValue>
                                                            <type>CONSTANT</type>
                                                        </item>
                                                        <item id="50" type="com.j2fe.workflow.definition.Parameter">
                                                            <UITypeHint id="51">["LocalFileName"]@java/lang/String@</UITypeHint>
                                                            <input>true</input>
                                                            <name id="52">input["LocalFileName"]</name>
                                                            <stringValue id="53">LocalFileName</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                        <item id="54" type="com.j2fe.workflow.definition.Parameter">
                                                            <UITypeHint id="55">["ParentJobID"]@java/lang/String@</UITypeHint>
                                                            <input>true</input>
                                                            <name id="56">input["ParentJobID"]</name>
                                                            <stringValue id="57">ParentJobID</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                        <item id="58" type="com.j2fe.workflow.definition.Parameter">
                                                            <UITypeHint id="59">["entityType"]@java/lang/String@</UITypeHint>
                                                            <input>true</input>
                                                            <name id="60">input["entityType"]</name>
                                                            <stringValue id="61">FINS</stringValue>
                                                            <type>CONSTANT</type>
                                                        </item>
                                                        <item id="62" type="com.j2fe.workflow.definition.Parameter">
                                                            <UITypeHint id="63">["outputFileDirectory"]@java/lang/String@</UITypeHint>
                                                            <input>true</input>
                                                            <name id="64">input["outputFileDirectory"]</name>
                                                            <stringValue id="65">outputFileDirectory</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                        <item id="66" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="67">name</name>
                                                            <stringValue id="68">AlacraInboundLocal</stringValue>
                                                            <type>CONSTANT</type>
                                                        </item>
                                                    </parameters>
                                                    <sources id="69" type="java.util.HashSet">
                                                        <item id="70" type="com.j2fe.workflow.definition.Transition">
                                                            <name id="71">goto-next</name>
                                                            <source id="72">
                                                                <activation>INVOKE</activation>
                                                                <clusteredCall>false</clusteredCall>
                                                                <description idref="4"/>
                                                                <directJoin>false</directJoin>
                                                                <name id="73">Create Parent Job Id</name>
                                                                <nodeHandler>com.j2fe.streetlamp.activities.CreateJob</nodeHandler>
                                                                <nodeHandlerClass id="74">com.j2fe.streetlamp.activities.CreateJob</nodeHandlerClass>
                                                                <parameters id="75" type="java.util.HashSet">
                                                                    <item id="76" type="com.j2fe.workflow.definition.Parameter">
                                                                        <input>true</input>
                                                                        <name id="77">configInfo</name>
                                                                        <stringValue id="78">WrapperAlacraInboundLocal</stringValue>
                                                                        <type>CONSTANT</type>
                                                                    </item>
                                                                    <item id="79" type="com.j2fe.workflow.definition.Parameter">
                                                                        <input>false</input>
                                                                        <name id="80">jobId</name>
                                                                        <stringValue id="81">ParentJobID</stringValue>
                                                                        <type>VARIABLE</type>
                                                                    </item>
                                                                </parameters>
                                                                <sources id="82" type="java.util.HashSet">
                                                                    <item id="83" type="com.j2fe.workflow.definition.Transition">
                                                                        <name id="84">goto-next</name>
                                                                        <source id="85">
                                                                            <activation>INVOKE</activation>
                                                                            <clusteredCall>false</clusteredCall>
                                                                            <description idref="4"/>
                                                                            <directJoin>false</directJoin>
                                                                            <name id="86">Start</name>
                                                                            <nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
                                                                            <nodeHandlerClass id="87">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
                                                                            <sources id="88" type="java.util.HashSet"/>
                                                                            <targets id="89" type="java.util.HashSet">
                                                                                <item idref="83" type="com.j2fe.workflow.definition.Transition"/>
                                                                            </targets>
                                                                            <type>START</type>
                                                                        </source>
                                                                        <target idref="72"/>
                                                                    </item>
                                                                </sources>
                                                                <targets id="90" type="java.util.HashSet">
                                                                    <item idref="70" type="com.j2fe.workflow.definition.Transition"/>
                                                                </targets>
                                                                <type>ACTIVITY</type>
                                                            </source>
                                                            <target idref="30"/>
                                                        </item>
                                                    </sources>
                                                    <targets id="91" type="java.util.HashSet">
                                                        <item idref="28" type="com.j2fe.workflow.definition.Transition"/>
                                                    </targets>
                                                    <type>ACTIVITY</type>
                                                </source>
                                                <target idref="20"/>
                                            </item>
                                        </sources>
                                        <targets id="92" type="java.util.HashSet">
                                            <item idref="18" type="com.j2fe.workflow.definition.Transition"/>
                                        </targets>
                                        <type>ACTIVITY</type>
                                    </source>
                                    <target idref="10"/>
                                </item>
                            </sources>
                            <targets id="93" type="java.util.HashSet">
                                <item idref="8" type="com.j2fe.workflow.definition.Transition"/>
                            </targets>
                            <type>ACTIVITY</type>
                        </source>
                        <target idref="3"/>
                    </item>
                </sources>
                <targets id="94" type="java.util.HashSet"/>
                <type>END</type>
            </endNode>
            <forcePurgeAtEnd>false</forcePurgeAtEnd>
            <group id="95">Custom/Dataloads/IssuerMerge</group>
            <haltOnError>true</haltOnError>
            <lastChangeUser id="96">user1</lastChangeUser>
            <lastUpdate id="97">2025-07-04T10:56:45.000+0000</lastUpdate>
            <name id="98">WrapperAlacraInboundLocal</name>
            <nodes id="99" type="java.util.HashSet">
                <item idref="30" type="com.j2fe.workflow.definition.Node"/>
                <item idref="10" type="com.j2fe.workflow.definition.Node"/>
                <item idref="20" type="com.j2fe.workflow.definition.Node"/>
                <item idref="72" type="com.j2fe.workflow.definition.Node"/>
                <item idref="85" type="com.j2fe.workflow.definition.Node"/>
                <item idref="3" type="com.j2fe.workflow.definition.Node"/>
            </nodes>
            <optimize>true</optimize>
            <parameter id="100" type="java.util.HashMap">
                <entry>
                    <key id="101" type="java.lang.String">AlacraInboundLocalDirectory</key>
                    <value id="102" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="103">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description idref="4"/>
                        <input>true</input>
                        <output>false</output>
                        <required>false</required>
                    </value>
                </entry>
                <entry>
                    <key id="104" type="java.lang.String">AlacraInboundProcessedDirectory</key>
                    <value id="105" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="106">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description idref="4"/>
                        <input>true</input>
                        <output>false</output>
                        <required>false</required>
                    </value>
                </entry>
                <entry>
                    <key id="107" type="java.lang.String">LocalFileName</key>
                    <value id="108" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="109">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <input>true</input>
                        <output>false</output>
                        <required>false</required>
                    </value>
                </entry>
                <entry>
                    <key id="110" type="java.lang.String">outputFileDirectory</key>
                    <value id="111" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="112">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description idref="4"/>
                        <input>true</input>
                        <output>false</output>
                        <required>false</required>
                    </value>
                </entry>
            </parameter>
            <permissions id="113" type="java.util.HashSet"/>
            <priority>50</priority>
            <purgeAtEnd>false</purgeAtEnd>
            <retries>0</retries>
            <startNode idref="85"/>
            <status>RELEASED</status>
            <variables id="114" type="java.util.HashMap">
                <entry>
                    <key id="115" type="java.lang.String">AlacraInboundLocalDirectory</key>
                    <value id="116" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="117">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description idref="4"/>
                        <persistent>false</persistent>
                        <value id="118" type="java.lang.String">/gold/app/AlacraInboundLocal/AlacraInboundLocalDirectory</value>
                    </value>
                </entry>
                <entry>
                    <key id="119" type="java.lang.String">AlacraInboundProcessedDirectory</key>
                    <value id="120" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="121">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description idref="4"/>
                        <persistent>false</persistent>
                        <value id="122" type="java.lang.String">/gold/app/AlacraInboundLocal/AlacraInboundProcessedDirectory</value>
                    </value>
                </entry>
                <entry>
                    <key id="123" type="java.lang.String">LocalFileName</key>
                    <value id="124" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="125">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <persistent>false</persistent>
                    </value>
                </entry>
                <entry>
                    <key id="126" type="java.lang.String">outputFileDirectory</key>
                    <value id="127" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="128">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description idref="4"/>
                        <persistent>false</persistent>
                        <value id="129" type="java.lang.String">/gold/app/AlacraInboundLocal/outputFileDirectory</value>
                    </value>
                </entry>
            </variables>
            <version>6</version>
        </com.j2fe.workflow.definition.Workflow>
    </businessobject>
</goldensource-package>
