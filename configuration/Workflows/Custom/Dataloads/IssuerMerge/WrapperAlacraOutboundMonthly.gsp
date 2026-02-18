<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<goldensource-package version="10.0.0.02">
    <package-comment/>
    <businessobject displayString="5 - V-10" type="com.j2fe.workflow.definition.Workflow">
        <com.j2fe.workflow.definition.Workflow id="0">
            <alwaysPersist>false</alwaysPersist>
            <clustered>false</clustered>
            <comment id="1">V-10</comment>
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
                                                            <UITypeHint id="35">["AlacraOutboundFileDirectory"]@java/lang/String@</UITypeHint>
                                                            <input>true</input>
                                                            <name id="36">input["AlacraOutboundFileDirectory"]</name>
                                                            <stringValue id="37">AlacraOutboundFileDirectory</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                        <item id="38" type="com.j2fe.workflow.definition.Parameter">
                                                            <UITypeHint id="39">["BaseFileName"]@java/lang/String@</UITypeHint>
                                                            <input>true</input>
                                                            <name id="40">input["BaseFileName"]</name>
                                                            <stringValue id="41">BaseFileName</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                        <item id="42" type="com.j2fe.workflow.definition.Parameter">
                                                            <UITypeHint id="43">["ParentJobID"]@java/lang/String@</UITypeHint>
                                                            <input>true</input>
                                                            <name id="44">input["ParentJobID"]</name>
                                                            <stringValue id="45">ParentJobID</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                        <item id="46" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="47">name</name>
                                                            <stringValue id="48">AlacraOutboundMonthly</stringValue>
                                                            <type>CONSTANT</type>
                                                        </item>
                                                    </parameters>
                                                    <sources id="49" type="java.util.HashSet">
                                                        <item id="50" type="com.j2fe.workflow.definition.Transition">
                                                            <name id="51">goto-next</name>
                                                            <source id="52">
                                                                <activation>INVOKE</activation>
                                                                <clusteredCall>false</clusteredCall>
                                                                <description idref="4"/>
                                                                <directJoin>false</directJoin>
                                                                <name id="53">Create Parent Job Id</name>
                                                                <nodeHandler>com.j2fe.streetlamp.activities.CreateJob</nodeHandler>
                                                                <nodeHandlerClass id="54">com.j2fe.streetlamp.activities.CreateJob</nodeHandlerClass>
                                                                <parameters id="55" type="java.util.HashSet">
                                                                    <item id="56" type="com.j2fe.workflow.definition.Parameter">
                                                                        <input>true</input>
                                                                        <name id="57">configInfo</name>
                                                                        <stringValue id="58">WrapperAlacraOutboundMonthly</stringValue>
                                                                        <type>CONSTANT</type>
                                                                    </item>
                                                                    <item id="59" type="com.j2fe.workflow.definition.Parameter">
                                                                        <input>false</input>
                                                                        <name id="60">jobId</name>
                                                                        <stringValue id="61">ParentJobID</stringValue>
                                                                        <type>VARIABLE</type>
                                                                    </item>
                                                                </parameters>
                                                                <sources id="62" type="java.util.HashSet">
                                                                    <item id="63" type="com.j2fe.workflow.definition.Transition">
                                                                        <name id="64">goto-next</name>
                                                                        <source id="65">
                                                                            <activation>INVOKE</activation>
                                                                            <clusteredCall>false</clusteredCall>
                                                                            <description idref="4"/>
                                                                            <directJoin>false</directJoin>
                                                                            <name id="66">Start</name>
                                                                            <nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
                                                                            <nodeHandlerClass id="67">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
                                                                            <sources id="68" type="java.util.HashSet"/>
                                                                            <targets id="69" type="java.util.HashSet">
                                                                                <item idref="63" type="com.j2fe.workflow.definition.Transition"/>
                                                                            </targets>
                                                                            <type>START</type>
                                                                        </source>
                                                                        <target idref="52"/>
                                                                    </item>
                                                                </sources>
                                                                <targets id="70" type="java.util.HashSet">
                                                                    <item idref="50" type="com.j2fe.workflow.definition.Transition"/>
                                                                </targets>
                                                                <type>ACTIVITY</type>
                                                            </source>
                                                            <target idref="30"/>
                                                        </item>
                                                    </sources>
                                                    <targets id="71" type="java.util.HashSet">
                                                        <item idref="28" type="com.j2fe.workflow.definition.Transition"/>
                                                    </targets>
                                                    <type>ACTIVITY</type>
                                                </source>
                                                <target idref="20"/>
                                            </item>
                                        </sources>
                                        <targets id="72" type="java.util.HashSet">
                                            <item idref="18" type="com.j2fe.workflow.definition.Transition"/>
                                        </targets>
                                        <type>ACTIVITY</type>
                                    </source>
                                    <target idref="10"/>
                                </item>
                            </sources>
                            <targets id="73" type="java.util.HashSet">
                                <item idref="8" type="com.j2fe.workflow.definition.Transition"/>
                            </targets>
                            <type>ACTIVITY</type>
                        </source>
                        <target idref="3"/>
                    </item>
                </sources>
                <targets id="74" type="java.util.HashSet"/>
                <type>END</type>
            </endNode>
            <forcePurgeAtEnd>false</forcePurgeAtEnd>
            <group id="75">Custom/Dataloads/IssuerMerge</group>
            <haltOnError>true</haltOnError>
            <lastChangeUser id="76">user1</lastChangeUser>
            <lastUpdate id="77">2025-07-04T03:14:43.000+0000</lastUpdate>
            <name id="78">WrapperAlacraOutboundMonthly</name>
            <nodes id="79" type="java.util.HashSet">
                <item idref="30" type="com.j2fe.workflow.definition.Node"/>
                <item idref="10" type="com.j2fe.workflow.definition.Node"/>
                <item idref="20" type="com.j2fe.workflow.definition.Node"/>
                <item idref="52" type="com.j2fe.workflow.definition.Node"/>
                <item idref="65" type="com.j2fe.workflow.definition.Node"/>
                <item idref="3" type="com.j2fe.workflow.definition.Node"/>
            </nodes>
            <optimize>true</optimize>
            <parameter id="80" type="java.util.HashMap">
                <entry>
                    <key id="81" type="java.lang.String">AlacraOutboundFileDirectory</key>
                    <value id="82" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="83">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description idref="4"/>
                        <input>true</input>
                        <output>false</output>
                        <required>false</required>
                    </value>
                </entry>
                <entry>
                    <key id="84" type="java.lang.String">BaseFileName</key>
                    <value id="85" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="86">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <input>true</input>
                        <output>false</output>
                        <required>false</required>
                    </value>
                </entry>
            </parameter>
            <permissions id="87" type="java.util.HashSet"/>
            <priority>50</priority>
            <purgeAtEnd>true</purgeAtEnd>
            <retries>0</retries>
            <startNode idref="65"/>
            <status>RELEASED</status>
            <variables id="88" type="java.util.HashMap">
                <entry>
                    <key id="89" type="java.lang.String">AlacraOutboundFileDirectory</key>
                    <value id="90" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="91">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description idref="4"/>
                        <persistent>false</persistent>
                        <value id="92" type="java.lang.String">/gold/app/AlacraOutboundMonthly</value>
                    </value>
                </entry>
                <entry>
                    <key id="93" type="java.lang.String">BaseFileName</key>
                    <value id="94" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="95">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <persistent>false</persistent>
                        <value id="96" type="java.lang.String">Alacra_DeDup_File</value>
                    </value>
                </entry>
            </variables>
            <version>5</version>
        </com.j2fe.workflow.definition.Workflow>
    </businessobject>
</goldensource-package>
