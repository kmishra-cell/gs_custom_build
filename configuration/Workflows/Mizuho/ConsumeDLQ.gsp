<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<goldensource-package version="10.0.0.02">
    <package-comment/>
    <businessobject displayString="3 - V-10" type="com.j2fe.workflow.definition.Workflow">
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
                <nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
                <nodeHandlerClass id="5">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
                <sources id="6" type="java.util.HashSet">
                    <item id="7" type="com.j2fe.workflow.definition.Transition">
                        <name id="8">goto-next</name>
                        <source id="9">
                            <activation>INVOKE</activation>
                            <clusteredCall>false</clusteredCall>
                            <description idref="3"/>
                            <directJoin>false</directJoin>
                            <name id="10">Do not publish customer</name>
                            <nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
                            <nodeHandlerClass id="11">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
                            <sources id="12" type="java.util.HashSet">
                                <item id="13" type="com.j2fe.workflow.definition.Transition">
                                    <name id="14">gs.output.approved.client</name>
                                    <source id="15">
                                        <activation>INVOKE</activation>
                                        <clusteredCall>false</clusteredCall>
                                        <description idref="3"/>
                                        <directJoin>false</directJoin>
                                        <name id="16">Switch Case</name>
                                        <nodeHandler>com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandler>
                                        <nodeHandlerClass id="17">com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandlerClass>
                                        <parameters id="18" type="java.util.HashSet">
                                            <item id="19" type="com.j2fe.workflow.definition.Parameter">
                                                <input>true</input>
                                                <name id="20">caseItem</name>
                                                <stringValue id="21">JMSDestinationName</stringValue>
                                                <type>VARIABLE</type>
                                            </item>
                                            <item id="22" type="com.j2fe.workflow.definition.Parameter">
                                                <input>true</input>
                                                <name id="23">defaultItem</name>
                                                <stringValue id="24">default</stringValue>
                                                <type>CONSTANT</type>
                                            </item>
                                            <item id="25" type="com.j2fe.workflow.definition.Parameter">
                                                <input>true</input>
                                                <name id="26">nullTransition</name>
                                                <stringValue id="27">default</stringValue>
                                                <type>CONSTANT</type>
                                            </item>
                                        </parameters>
                                        <sources id="28" type="java.util.HashSet">
                                            <item id="29" type="com.j2fe.workflow.definition.Transition">
                                                <name id="30">0</name>
                                                <source id="31">
                                                    <activation>INVOKE</activation>
                                                    <clusteredCall>false</clusteredCall>
                                                    <description idref="3"/>
                                                    <directJoin>false</directJoin>
                                                    <name id="32">Bean Shell Script (Xor Split)</name>
                                                    <nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
                                                    <nodeHandlerClass id="33">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
                                                    <parameters id="34" type="java.util.HashSet">
                                                        <item id="35" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="36">statements</name>
                                                            <stringValue id="37">if ( retry == void) {&#13;
	retry = 1;&#13;
	return 0;&#13;
} else {&#13;
	retry = retry + 1;&#13;
	if ( retry &gt; 3 ) {&#13;
		return 1;&#13;
	} else {&#13;
		return 0;&#13;
	}&#13;
}</stringValue>
                                                            <type>CONSTANT</type>
                                                        </item>
                                                        <item id="38" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="39">variables</name>
                                                            <stringValue id="40">JMSProperties</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                        <item id="41" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>false</input>
                                                            <name id="42">variables["retry"]</name>
                                                            <stringValue id="43">Retry</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                    </parameters>
                                                    <sources id="44" type="java.util.HashSet">
                                                        <item id="45" type="com.j2fe.workflow.definition.Transition">
                                                            <name id="46">goto-next</name>
                                                            <source id="47">
                                                                <activation>INVOKE</activation>
                                                                <clusteredCall>false</clusteredCall>
                                                                <description idref="3"/>
                                                                <directJoin>false</directJoin>
                                                                <name id="48">Start</name>
                                                                <nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
                                                                <nodeHandlerClass id="49">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
                                                                <sources id="50" type="java.util.HashSet"/>
                                                                <targets id="51" type="java.util.HashSet">
                                                                    <item idref="45" type="com.j2fe.workflow.definition.Transition"/>
                                                                </targets>
                                                                <type>START</type>
                                                            </source>
                                                            <target idref="31"/>
                                                        </item>
                                                    </sources>
                                                    <targets id="52" type="java.util.HashSet">
                                                        <item idref="29" type="com.j2fe.workflow.definition.Transition"/>
                                                        <item id="53" type="com.j2fe.workflow.definition.Transition">
                                                            <name id="54">1</name>
                                                            <source idref="31"/>
                                                            <target id="55">
                                                                <activation>INVOKE</activation>
                                                                <clusteredCall>false</clusteredCall>
                                                                <description idref="3"/>
                                                                <directJoin>false</directJoin>
                                                                <name id="56">Get env</name>
                                                                <nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
                                                                <nodeHandlerClass id="57">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
                                                                <parameters id="58" type="java.util.HashSet">
                                                                    <item id="59" type="com.j2fe.workflow.definition.Parameter">
                                                                        <input>true</input>
                                                                        <name id="60">database</name>
                                                                        <stringValue id="61">jdbc/GSDM-1</stringValue>
                                                                        <type>REFERENCE</type>
                                                                    </item>
                                                                    <item id="62" type="com.j2fe.workflow.definition.Parameter">
                                                                        <input>false</input>
                                                                        <name id="63">firstColumnsResult[0]</name>
                                                                        <stringValue id="64">env</stringValue>
                                                                        <type>VARIABLE</type>
                                                                    </item>
                                                                    <item id="65" type="com.j2fe.workflow.definition.Parameter">
                                                                        <input>true</input>
                                                                        <name id="66">indexedParameters[0]</name>
                                                                        <stringValue id="67">JMSDestinationName</stringValue>
                                                                        <type>VARIABLE</type>
                                                                    </item>
                                                                    <item id="68" type="com.j2fe.workflow.definition.Parameter">
                                                                        <input>true</input>
                                                                        <name id="69">querySQL</name>
                                                                        <stringValue id="70">SELECT '[' || CASE &#13;
                 WHEN ora_database_name = 'OPLRDDB.UK.MIZUHO-SC.COM' THEN 'PRD'&#13;
                 WHEN ora_database_name = 'OULRDDB.UK.MIZUHO-SC.COM' THEN 'UAT'&#13;
                 ELSE SUBSTRING(ora_database_name FROM 1 FOR POSITION('.' IN ora_database_name) - 1)&#13;
               END || ']: DLQ Message failed to re-queue 3 times to queue ' || ? AS env &#13;
FROM dual</stringValue>
                                                                        <type>CONSTANT</type>
                                                                    </item>
                                                                </parameters>
                                                                <sources id="71" type="java.util.HashSet">
                                                                    <item idref="53" type="com.j2fe.workflow.definition.Transition"/>
                                                                </sources>
                                                                <targets id="72" type="java.util.HashSet">
                                                                    <item id="73" type="com.j2fe.workflow.definition.Transition">
                                                                        <name id="74">goto-next</name>
                                                                        <source idref="55"/>
                                                                        <target id="75">
                                                                            <activation>INVOKE</activation>
                                                                            <clusteredCall>false</clusteredCall>
                                                                            <description idref="3"/>
                                                                            <directJoin>false</directJoin>
                                                                            <name id="76">Email GS - Retry failed</name>
                                                                            <nodeHandler>com.j2fe.general.activities.EMAIL</nodeHandler>
                                                                            <nodeHandlerClass id="77">com.j2fe.general.activities.EMAIL</nodeHandlerClass>
                                                                            <parameters id="78" type="java.util.HashSet">
                                                                                <item id="79" type="com.j2fe.workflow.definition.Parameter">
                                                                                    <input>true</input>
                                                                                    <name id="80">attachmentsName[0]</name>
                                                                                    <stringValue id="81">DLQ.xml</stringValue>
                                                                                    <type>CONSTANT</type>
                                                                                </item>
                                                                                <item id="82" type="com.j2fe.workflow.definition.Parameter">
                                                                                    <input>true</input>
                                                                                    <name id="83">attachments[0]</name>
                                                                                    <stringValue id="84">JMSTextMessage</stringValue>
                                                                                    <type>VARIABLE</type>
                                                                                </item>
                                                                                <item id="85" type="com.j2fe.workflow.definition.Parameter">
                                                                                    <input>true</input>
                                                                                    <name id="86">emailText</name>
                                                                                    <stringValue id="87">GoldenSource Support Team,&#13;
&#13;
The attached message was sent to GoldenSource DLQ and it failed to re-queue 3 times. Please investigate and resolve.&#13;
&#13;
This is an automated message from the GoldenSource application. Do not reply to this email</stringValue>
                                                                                    <type>CONSTANT</type>
                                                                                </item>
                                                                                <item id="88" type="com.j2fe.workflow.definition.Parameter">
                                                                                    <input>true</input>
                                                                                    <name id="89">from</name>
                                                                                    <stringValue id="90">SWDL-MHI-GoldenSource-Support@uk.mizuho-sc.com</stringValue>
                                                                                    <type>CONSTANT</type>
                                                                                </item>
                                                                                <item id="91" type="com.j2fe.workflow.definition.Parameter">
                                                                                    <input>true</input>
                                                                                    <name id="92">recipients</name>
                                                                                    <stringValue id="93">DL-MHI-GoldenSource-Support@uk.mizuho-sc.com</stringValue>
                                                                                    <type>CONSTANT</type>
                                                                                </item>
                                                                                <item id="94" type="com.j2fe.workflow.definition.Parameter">
                                                                                    <input>true</input>
                                                                                    <name id="95">session</name>
                                                                                    <stringValue id="96">TESTEMAIL</stringValue>
                                                                                    <type>VARIABLE</type>
                                                                                </item>
                                                                                <item id="97" type="com.j2fe.workflow.definition.Parameter">
                                                                                    <input>true</input>
                                                                                    <name id="98">subject</name>
                                                                                    <stringValue id="99">env</stringValue>
                                                                                    <type>VARIABLE</type>
                                                                                </item>
                                                                            </parameters>
                                                                            <sources id="100" type="java.util.HashSet">
                                                                                <item idref="73" type="com.j2fe.workflow.definition.Transition"/>
                                                                            </sources>
                                                                            <targets id="101" type="java.util.HashSet">
                                                                                <item id="102" type="com.j2fe.workflow.definition.Transition">
                                                                                    <name id="103">goto-next</name>
                                                                                    <source idref="75"/>
                                                                                    <target idref="2"/>
                                                                                </item>
                                                                            </targets>
                                                                            <type>ACTIVITY</type>
                                                                        </target>
                                                                    </item>
                                                                </targets>
                                                                <type>ACTIVITY</type>
                                                            </target>
                                                        </item>
                                                    </targets>
                                                    <type>XORSPLIT</type>
                                                </source>
                                                <target idref="15"/>
                                            </item>
                                        </sources>
                                        <targets id="104" type="java.util.HashSet">
                                            <item id="105" type="com.j2fe.workflow.definition.Transition">
                                                <name id="106">default</name>
                                                <source idref="15"/>
                                                <target id="107">
                                                    <activation>INVOKE</activation>
                                                    <clusteredCall>false</clusteredCall>
                                                    <description idref="3"/>
                                                    <directJoin>false</directJoin>
                                                    <name id="108">Get env</name>
                                                    <nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
                                                    <nodeHandlerClass id="109">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
                                                    <parameters id="110" type="java.util.HashSet">
                                                        <item id="111" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="112">database</name>
                                                            <stringValue id="113">jdbc/GSDM-1</stringValue>
                                                            <type>REFERENCE</type>
                                                        </item>
                                                        <item id="114" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>false</input>
                                                            <name id="115">firstColumnsResult[0]</name>
                                                            <stringValue id="116">env</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                        <item id="117" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="118">indexedParameters[0]</name>
                                                            <stringValue id="119">JMSDestinationName</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                        <item id="120" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="121">querySQL</name>
                                                            <stringValue id="122">SELECT '[' || CASE &#13; &#13;
                 WHEN ora_database_name = 'OPLRDDB.UK.MIZUHO-SC.COM' THEN 'PRD'&#13;&#13;
                 WHEN ora_database_name = 'OULRDDB.UK.MIZUHO-SC.COM' THEN 'UAT'&#13;&#13;
                 ELSE SUBSTRING(ora_database_name FROM 1 FOR POSITION('.' IN ora_database_name) - 1)&#13;&#13;
               END || ']: DLQ Message from unknown queue ' || ? AS env&#13;&#13;
FROM dual</stringValue>
                                                            <type>CONSTANT</type>
                                                        </item>
                                                    </parameters>
                                                    <sources id="123" type="java.util.HashSet">
                                                        <item idref="105" type="com.j2fe.workflow.definition.Transition"/>
                                                    </sources>
                                                    <targets id="124" type="java.util.HashSet">
                                                        <item id="125" type="com.j2fe.workflow.definition.Transition">
                                                            <name id="126">goto-next</name>
                                                            <source idref="107"/>
                                                            <target id="127">
                                                                <activation>INVOKE</activation>
                                                                <clusteredCall>false</clusteredCall>
                                                                <description idref="3"/>
                                                                <directJoin>false</directJoin>
                                                                <name id="128">Email GS - Unknown queue</name>
                                                                <nodeHandler>com.j2fe.general.activities.EMAIL</nodeHandler>
                                                                <nodeHandlerClass id="129">com.j2fe.general.activities.EMAIL</nodeHandlerClass>
                                                                <parameters id="130" type="java.util.HashSet">
                                                                    <item id="131" type="com.j2fe.workflow.definition.Parameter">
                                                                        <input>true</input>
                                                                        <name id="132">attachmentsName[0]</name>
                                                                        <stringValue id="133">DLQ.xml</stringValue>
                                                                        <type>CONSTANT</type>
                                                                    </item>
                                                                    <item id="134" type="com.j2fe.workflow.definition.Parameter">
                                                                        <input>true</input>
                                                                        <name id="135">attachments[0]</name>
                                                                        <stringValue id="136">JMSTextMessage</stringValue>
                                                                        <type>VARIABLE</type>
                                                                    </item>
                                                                    <item id="137" type="com.j2fe.workflow.definition.Parameter">
                                                                        <input>true</input>
                                                                        <name id="138">emailText</name>
                                                                        <stringValue id="139">GoldenSource Support Team,&#13;
&#13;
The attached message was sent to GoldenSource DLQ and came from an unsupported queue. Please investigate and resolve.&#13;
&#13;
This is an automated message from the GoldenSource application. Do not reply to this email</stringValue>
                                                                        <type>CONSTANT</type>
                                                                    </item>
                                                                    <item id="140" type="com.j2fe.workflow.definition.Parameter">
                                                                        <input>true</input>
                                                                        <name id="141">from</name>
                                                                        <stringValue id="142">SWDL-MHI-GoldenSource-Support@uk.mizuho-sc.com</stringValue>
                                                                        <type>CONSTANT</type>
                                                                    </item>
                                                                    <item id="143" type="com.j2fe.workflow.definition.Parameter">
                                                                        <input>true</input>
                                                                        <name id="144">recipients</name>
                                                                        <stringValue id="145">DL-MHI-GoldenSource-Support@uk.mizuho-sc.com</stringValue>
                                                                        <type>CONSTANT</type>
                                                                    </item>
                                                                    <item id="146" type="com.j2fe.workflow.definition.Parameter">
                                                                        <input>true</input>
                                                                        <name id="147">session</name>
                                                                        <stringValue id="148">TESTEMAIL</stringValue>
                                                                        <type>VARIABLE</type>
                                                                    </item>
                                                                    <item id="149" type="com.j2fe.workflow.definition.Parameter">
                                                                        <input>true</input>
                                                                        <name id="150">subject</name>
                                                                        <stringValue id="151">env</stringValue>
                                                                        <type>VARIABLE</type>
                                                                    </item>
                                                                </parameters>
                                                                <sources id="152" type="java.util.HashSet">
                                                                    <item idref="125" type="com.j2fe.workflow.definition.Transition"/>
                                                                </sources>
                                                                <targets id="153" type="java.util.HashSet">
                                                                    <item id="154" type="com.j2fe.workflow.definition.Transition">
                                                                        <name id="155">goto-next</name>
                                                                        <source idref="127"/>
                                                                        <target idref="2"/>
                                                                    </item>
                                                                </targets>
                                                                <type>ACTIVITY</type>
                                                            </target>
                                                        </item>
                                                    </targets>
                                                    <type>ACTIVITY</type>
                                                </target>
                                            </item>
                                            <item id="156" type="com.j2fe.workflow.definition.Transition">
                                                <name id="157">gs.input.mtn.preapproved.security</name>
                                                <source idref="15"/>
                                                <target id="158">
                                                    <activation>INVOKE</activation>
                                                    <clusteredCall>false</clusteredCall>
                                                    <description idref="3"/>
                                                    <directJoin>false</directJoin>
                                                    <name id="159">Publish mtnSecurity</name>
                                                    <nodeHandler>com.j2fe.general.activities.JMS</nodeHandler>
                                                    <nodeHandlerClass id="160">com.j2fe.general.activities.JMS</nodeHandlerClass>
                                                    <parameters id="161" type="java.util.HashSet">
                                                        <item id="162" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="163">JMSType</name>
                                                            <stringValue id="164">JMSType</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                        <item id="165" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="166">connectionFactory</name>
                                                            <stringValue id="167">JMSConnectionFactory</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                        <item id="168" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="169">correlationId</name>
                                                            <stringValue id="170">JMSCorrelationID</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                        <item id="171" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="172">destination</name>
                                                            <stringValue id="173">JMSDestinationName</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                        <item id="174" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="175">headerProperties["retry"]</name>
                                                            <stringValue id="176">Retry</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                        <item id="177" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="178">persistent</name>
                                                            <stringValue id="179">true</stringValue>
                                                            <type>CONSTANT</type>
                                                        </item>
                                                        <item id="180" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="181">textInput</name>
                                                            <stringValue id="182">JMSTextMessage</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                    </parameters>
                                                    <sources id="183" type="java.util.HashSet">
                                                        <item idref="156" type="com.j2fe.workflow.definition.Transition"/>
                                                    </sources>
                                                    <targets id="184" type="java.util.HashSet">
                                                        <item id="185" type="com.j2fe.workflow.definition.Transition">
                                                            <name id="186">goto-next</name>
                                                            <source idref="158"/>
                                                            <target idref="2"/>
                                                        </item>
                                                    </targets>
                                                    <type>ACTIVITY</type>
                                                </target>
                                            </item>
                                            <item id="187" type="com.j2fe.workflow.definition.Transition">
                                                <name id="188">gs.input.soiAddition</name>
                                                <source idref="15"/>
                                                <target id="189">
                                                    <activation>INVOKE</activation>
                                                    <clusteredCall>false</clusteredCall>
                                                    <description idref="3"/>
                                                    <directJoin>false</directJoin>
                                                    <name id="190">Publish soiAddition</name>
                                                    <nodeHandler>com.j2fe.general.activities.JMS</nodeHandler>
                                                    <nodeHandlerClass id="191">com.j2fe.general.activities.JMS</nodeHandlerClass>
                                                    <parameters id="192" type="java.util.HashSet">
                                                        <item id="193" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="194">JMSType</name>
                                                            <stringValue id="195">JMSType</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                        <item id="196" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="197">connectionFactory</name>
                                                            <stringValue id="198">JMSConnectionFactory</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                        <item id="199" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="200">correlationId</name>
                                                            <stringValue id="201">JMSCorrelationID</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                        <item id="202" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="203">destination</name>
                                                            <stringValue id="204">JMSDestinationName</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                        <item id="205" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="206">headerProperties["retry"]</name>
                                                            <stringValue id="207">Retry</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                        <item id="208" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="209">persistent</name>
                                                            <stringValue id="210">true</stringValue>
                                                            <type>CONSTANT</type>
                                                        </item>
                                                        <item id="211" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="212">textInput</name>
                                                            <stringValue id="213">JMSTextMessage</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                    </parameters>
                                                    <sources id="214" type="java.util.HashSet">
                                                        <item idref="187" type="com.j2fe.workflow.definition.Transition"/>
                                                    </sources>
                                                    <targets id="215" type="java.util.HashSet">
                                                        <item id="216" type="com.j2fe.workflow.definition.Transition">
                                                            <name id="217">goto-next</name>
                                                            <source idref="189"/>
                                                            <target idref="2"/>
                                                        </item>
                                                    </targets>
                                                    <type>ACTIVITY</type>
                                                </target>
                                            </item>
                                            <item id="218" type="com.j2fe.workflow.definition.Transition">
                                                <name id="219">gs.input.soiStatement</name>
                                                <source idref="15"/>
                                                <target id="220">
                                                    <activation>INVOKE</activation>
                                                    <clusteredCall>false</clusteredCall>
                                                    <description idref="3"/>
                                                    <directJoin>false</directJoin>
                                                    <name id="221">Publish soiStatement</name>
                                                    <nodeHandler>com.j2fe.general.activities.JMS</nodeHandler>
                                                    <nodeHandlerClass id="222">com.j2fe.general.activities.JMS</nodeHandlerClass>
                                                    <parameters id="223" type="java.util.HashSet">
                                                        <item id="224" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="225">JMSType</name>
                                                            <stringValue id="226">JMSType</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                        <item id="227" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="228">connectionFactory</name>
                                                            <stringValue id="229">JMSConnectionFactory</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                        <item id="230" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="231">correlationId</name>
                                                            <stringValue id="232">JMSCorrelationID</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                        <item id="233" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="234">destination</name>
                                                            <stringValue id="235">JMSDestinationName</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                        <item id="236" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="237">headerProperties["retry"]</name>
                                                            <stringValue id="238">Retry</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                        <item id="239" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="240">persistent</name>
                                                            <stringValue id="241">true</stringValue>
                                                            <type>CONSTANT</type>
                                                        </item>
                                                        <item id="242" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="243">textInput</name>
                                                            <stringValue id="244">JMSTextMessage</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                    </parameters>
                                                    <sources id="245" type="java.util.HashSet">
                                                        <item idref="218" type="com.j2fe.workflow.definition.Transition"/>
                                                    </sources>
                                                    <targets id="246" type="java.util.HashSet">
                                                        <item id="247" type="com.j2fe.workflow.definition.Transition">
                                                            <name id="248">goto-next</name>
                                                            <source idref="220"/>
                                                            <target idref="2"/>
                                                        </item>
                                                    </targets>
                                                    <type>ACTIVITY</type>
                                                </target>
                                            </item>
                                            <item idref="13" type="com.j2fe.workflow.definition.Transition"/>
                                            <item id="249" type="com.j2fe.workflow.definition.Transition">
                                                <name id="250">gs.output.approved.geographicUnit</name>
                                                <source idref="15"/>
                                                <target id="251">
                                                    <activation>INVOKE</activation>
                                                    <clusteredCall>false</clusteredCall>
                                                    <description idref="3"/>
                                                    <directJoin>false</directJoin>
                                                    <name id="252">Publish GeoUnit</name>
                                                    <nodeHandler>com.j2fe.general.activities.JMS</nodeHandler>
                                                    <nodeHandlerClass id="253">com.j2fe.general.activities.JMS</nodeHandlerClass>
                                                    <parameters id="254" type="java.util.HashSet">
                                                        <item id="255" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="256">JMSType</name>
                                                            <stringValue id="257">JMSType</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                        <item id="258" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="259">connectionFactory</name>
                                                            <stringValue id="260">JMSConnectionFactory</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                        <item id="261" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="262">correlationId</name>
                                                            <stringValue id="263">JMSCorrelationID</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                        <item id="264" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="265">destination</name>
                                                            <stringValue id="266">JMSDestinationName</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                        <item id="267" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="268">headerProperties["retry"]</name>
                                                            <stringValue id="269">Retry</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                        <item id="270" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="271">persistent</name>
                                                            <stringValue id="272">true</stringValue>
                                                            <type>CONSTANT</type>
                                                        </item>
                                                        <item id="273" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="274">textInput</name>
                                                            <stringValue id="275">JMSTextMessage</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                    </parameters>
                                                    <sources id="276" type="java.util.HashSet">
                                                        <item idref="249" type="com.j2fe.workflow.definition.Transition"/>
                                                    </sources>
                                                    <targets id="277" type="java.util.HashSet">
                                                        <item id="278" type="com.j2fe.workflow.definition.Transition">
                                                            <name id="279">goto-next</name>
                                                            <source idref="251"/>
                                                            <target idref="2"/>
                                                        </item>
                                                    </targets>
                                                    <type>ACTIVITY</type>
                                                </target>
                                            </item>
                                            <item id="280" type="com.j2fe.workflow.definition.Transition">
                                                <name id="281">gs.output.approved.issuer</name>
                                                <source idref="15"/>
                                                <target id="282">
                                                    <activation>INVOKE</activation>
                                                    <clusteredCall>false</clusteredCall>
                                                    <description idref="3"/>
                                                    <directJoin>false</directJoin>
                                                    <name id="283">Publish Issuer</name>
                                                    <nodeHandler>com.j2fe.general.activities.JMS</nodeHandler>
                                                    <nodeHandlerClass id="284">com.j2fe.general.activities.JMS</nodeHandlerClass>
                                                    <parameters id="285" type="java.util.HashSet">
                                                        <item id="286" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="287">JMSType</name>
                                                            <stringValue id="288">JMSType</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                        <item id="289" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="290">connectionFactory</name>
                                                            <stringValue id="291">JMSConnectionFactory</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                        <item id="292" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="293">correlationId</name>
                                                            <stringValue id="294">JMSCorrelationID</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                        <item id="295" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="296">destination</name>
                                                            <stringValue id="297">JMSDestinationName</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                        <item id="298" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="299">headerProperties["retry"]</name>
                                                            <stringValue id="300">Retry</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                        <item id="301" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="302">persistent</name>
                                                            <objectValue id="303" type="java.lang.Boolean">true</objectValue>
                                                            <type>CONSTANT</type>
                                                        </item>
                                                        <item id="304" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="305">textInput</name>
                                                            <stringValue id="306">JMSTextMessage</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                    </parameters>
                                                    <sources id="307" type="java.util.HashSet">
                                                        <item idref="280" type="com.j2fe.workflow.definition.Transition"/>
                                                    </sources>
                                                    <targets id="308" type="java.util.HashSet">
                                                        <item id="309" type="com.j2fe.workflow.definition.Transition">
                                                            <name id="310">goto-next</name>
                                                            <source idref="282"/>
                                                            <target idref="2"/>
                                                        </item>
                                                    </targets>
                                                    <type>ACTIVITY</type>
                                                </target>
                                            </item>
                                            <item id="311" type="com.j2fe.workflow.definition.Transition">
                                                <name id="312">gs.output.approved.legalAgreement</name>
                                                <source idref="15"/>
                                                <target id="313">
                                                    <activation>INVOKE</activation>
                                                    <clusteredCall>false</clusteredCall>
                                                    <description idref="3"/>
                                                    <directJoin>false</directJoin>
                                                    <name id="314">Publish Legal</name>
                                                    <nodeHandler>com.j2fe.general.activities.JMS</nodeHandler>
                                                    <nodeHandlerClass id="315">com.j2fe.general.activities.JMS</nodeHandlerClass>
                                                    <parameters id="316" type="java.util.HashSet">
                                                        <item id="317" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="318">JMSType</name>
                                                            <stringValue id="319">JMSType</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                        <item id="320" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="321">connectionFactory</name>
                                                            <stringValue id="322">JMSConnectionFactory</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                        <item id="323" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="324">correlationId</name>
                                                            <stringValue id="325">JMSCorrelationID</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                        <item id="326" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="327">destination</name>
                                                            <stringValue id="328">JMSDestinationName</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                        <item id="329" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="330">headerProperties["retry"]</name>
                                                            <stringValue id="331">Retry</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                        <item id="332" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="333">persistent</name>
                                                            <objectValue idref="303"/>
                                                            <type>CONSTANT</type>
                                                        </item>
                                                        <item id="334" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="335">textInput</name>
                                                            <stringValue id="336">JMSTextMessage</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                    </parameters>
                                                    <sources id="337" type="java.util.HashSet">
                                                        <item idref="311" type="com.j2fe.workflow.definition.Transition"/>
                                                    </sources>
                                                    <targets id="338" type="java.util.HashSet">
                                                        <item id="339" type="com.j2fe.workflow.definition.Transition">
                                                            <name id="340">goto-next</name>
                                                            <source idref="313"/>
                                                            <target idref="2"/>
                                                        </item>
                                                    </targets>
                                                    <type>ACTIVITY</type>
                                                </target>
                                            </item>
                                            <item id="341" type="com.j2fe.workflow.definition.Transition">
                                                <name id="342">gs.output.approved.mhscLegalAgreement</name>
                                                <source idref="15"/>
                                                <target id="343">
                                                    <activation>INVOKE</activation>
                                                    <clusteredCall>false</clusteredCall>
                                                    <description idref="3"/>
                                                    <directJoin>false</directJoin>
                                                    <name id="344">Publish MHSC Legal</name>
                                                    <nodeHandler>com.j2fe.general.activities.JMS</nodeHandler>
                                                    <nodeHandlerClass id="345">com.j2fe.general.activities.JMS</nodeHandlerClass>
                                                    <parameters id="346" type="java.util.HashSet">
                                                        <item id="347" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="348">JMSType</name>
                                                            <stringValue id="349">JMSType</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                        <item id="350" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="351">connectionFactory</name>
                                                            <stringValue id="352">JMSConnectionFactory</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                        <item id="353" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="354">correlationId</name>
                                                            <stringValue id="355">JMSCorrelationID</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                        <item id="356" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="357">destination</name>
                                                            <stringValue id="358">JMSDestinationName</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                        <item id="359" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="360">headerProperties["retry"]</name>
                                                            <stringValue id="361">Retry</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                        <item id="362" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="363">persistent</name>
                                                            <stringValue id="364">true</stringValue>
                                                            <type>CONSTANT</type>
                                                        </item>
                                                        <item id="365" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="366">textInput</name>
                                                            <stringValue id="367">JMSTextMessage</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                    </parameters>
                                                    <sources id="368" type="java.util.HashSet">
                                                        <item idref="341" type="com.j2fe.workflow.definition.Transition"/>
                                                    </sources>
                                                    <targets id="369" type="java.util.HashSet">
                                                        <item id="370" type="com.j2fe.workflow.definition.Transition">
                                                            <name id="371">goto-next</name>
                                                            <source idref="343"/>
                                                            <target idref="2"/>
                                                        </item>
                                                    </targets>
                                                    <type>ACTIVITY</type>
                                                </target>
                                            </item>
                                            <item id="372" type="com.j2fe.workflow.definition.Transition">
                                                <name id="373">gs.output.approved.security</name>
                                                <source idref="15"/>
                                                <target id="374">
                                                    <activation>INVOKE</activation>
                                                    <clusteredCall>false</clusteredCall>
                                                    <description idref="3"/>
                                                    <directJoin>false</directJoin>
                                                    <name id="375">Publish Issue</name>
                                                    <nodeHandler>com.j2fe.general.activities.JMS</nodeHandler>
                                                    <nodeHandlerClass id="376">com.j2fe.general.activities.JMS</nodeHandlerClass>
                                                    <parameters id="377" type="java.util.HashSet">
                                                        <item id="378" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="379">JMSType</name>
                                                            <stringValue id="380">JMSType</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                        <item id="381" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="382">connectionFactory</name>
                                                            <stringValue id="383">JMSConnectionFactory</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                        <item id="384" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="385">correlationId</name>
                                                            <stringValue id="386">JMSCorrelationID</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                        <item id="387" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="388">destination</name>
                                                            <stringValue id="389">JMSDestinationName</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                        <item id="390" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="391">headerProperties["retry"]</name>
                                                            <stringValue id="392">Retry</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                        <item id="393" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="394">persistent</name>
                                                            <objectValue idref="303"/>
                                                            <type>CONSTANT</type>
                                                        </item>
                                                        <item id="395" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="396">textInput</name>
                                                            <stringValue id="397">JMSTextMessage</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                    </parameters>
                                                    <sources id="398" type="java.util.HashSet">
                                                        <item idref="372" type="com.j2fe.workflow.definition.Transition"/>
                                                    </sources>
                                                    <targets id="399" type="java.util.HashSet">
                                                        <item id="400" type="com.j2fe.workflow.definition.Transition">
                                                            <name id="401">goto-next</name>
                                                            <source idref="374"/>
                                                            <target idref="2"/>
                                                        </item>
                                                    </targets>
                                                    <type>ACTIVITY</type>
                                                </target>
                                            </item>
                                            <item id="402" type="com.j2fe.workflow.definition.Transition">
                                                <name id="403">gs.output.approved.securityPriority</name>
                                                <source idref="15"/>
                                                <target id="404">
                                                    <activation>INVOKE</activation>
                                                    <clusteredCall>false</clusteredCall>
                                                    <description idref="3"/>
                                                    <directJoin>false</directJoin>
                                                    <name id="405">Publish Issue Priority</name>
                                                    <nodeHandler>com.j2fe.general.activities.JMS</nodeHandler>
                                                    <nodeHandlerClass id="406">com.j2fe.general.activities.JMS</nodeHandlerClass>
                                                    <parameters id="407" type="java.util.HashSet">
                                                        <item id="408" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="409">JMSType</name>
                                                            <stringValue id="410">JMSType</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                        <item id="411" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="412">connectionFactory</name>
                                                            <stringValue id="413">JMSConnectionFactory</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                        <item id="414" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="415">correlationId</name>
                                                            <stringValue id="416">JMSCorrelationID</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                        <item id="417" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="418">destination</name>
                                                            <stringValue id="419">JMSDestinationName</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                        <item id="420" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="421">headerProperties["retry"]</name>
                                                            <stringValue id="422">Retry</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                        <item id="423" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="424">persistent</name>
                                                            <objectValue idref="303"/>
                                                            <type>CONSTANT</type>
                                                        </item>
                                                        <item id="425" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="426">textInput</name>
                                                            <stringValue id="427">JMSTextMessage</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                    </parameters>
                                                    <sources id="428" type="java.util.HashSet">
                                                        <item idref="402" type="com.j2fe.workflow.definition.Transition"/>
                                                    </sources>
                                                    <targets id="429" type="java.util.HashSet">
                                                        <item id="430" type="com.j2fe.workflow.definition.Transition">
                                                            <name id="431">goto-next</name>
                                                            <source idref="404"/>
                                                            <target idref="2"/>
                                                        </item>
                                                    </targets>
                                                    <type>ACTIVITY</type>
                                                </target>
                                            </item>
                                        </targets>
                                        <type>XORSPLIT</type>
                                    </source>
                                    <target idref="9"/>
                                </item>
                            </sources>
                            <targets id="432" type="java.util.HashSet">
                                <item idref="7" type="com.j2fe.workflow.definition.Transition"/>
                            </targets>
                            <type>ACTIVITY</type>
                        </source>
                        <target idref="2"/>
                    </item>
                    <item idref="102" type="com.j2fe.workflow.definition.Transition"/>
                    <item idref="154" type="com.j2fe.workflow.definition.Transition"/>
                    <item idref="278" type="com.j2fe.workflow.definition.Transition"/>
                    <item idref="400" type="com.j2fe.workflow.definition.Transition"/>
                    <item idref="430" type="com.j2fe.workflow.definition.Transition"/>
                    <item idref="309" type="com.j2fe.workflow.definition.Transition"/>
                    <item idref="339" type="com.j2fe.workflow.definition.Transition"/>
                    <item idref="370" type="com.j2fe.workflow.definition.Transition"/>
                    <item idref="185" type="com.j2fe.workflow.definition.Transition"/>
                    <item idref="216" type="com.j2fe.workflow.definition.Transition"/>
                    <item idref="247" type="com.j2fe.workflow.definition.Transition"/>
                </sources>
                <targets id="433" type="java.util.HashSet"/>
                <type>END</type>
            </endNode>
            <forcePurgeAtEnd>false</forcePurgeAtEnd>
            <group id="434">Mizuho</group>
            <haltOnError>false</haltOnError>
            <lastChangeUser id="435">user1</lastChangeUser>
            <lastUpdate id="436">2025-06-05T07:26:59.000+0000</lastUpdate>
            <name id="437">ConsumeDLQ</name>
            <nodes id="438" type="java.util.HashSet">
                <item idref="31" type="com.j2fe.workflow.definition.Node"/>
                <item idref="9" type="com.j2fe.workflow.definition.Node"/>
                <item idref="75" type="com.j2fe.workflow.definition.Node"/>
                <item idref="127" type="com.j2fe.workflow.definition.Node"/>
                <item idref="55" type="com.j2fe.workflow.definition.Node"/>
                <item idref="107" type="com.j2fe.workflow.definition.Node"/>
                <item idref="251" type="com.j2fe.workflow.definition.Node"/>
                <item idref="374" type="com.j2fe.workflow.definition.Node"/>
                <item idref="404" type="com.j2fe.workflow.definition.Node"/>
                <item idref="282" type="com.j2fe.workflow.definition.Node"/>
                <item idref="313" type="com.j2fe.workflow.definition.Node"/>
                <item idref="343" type="com.j2fe.workflow.definition.Node"/>
                <item idref="158" type="com.j2fe.workflow.definition.Node"/>
                <item idref="189" type="com.j2fe.workflow.definition.Node"/>
                <item idref="220" type="com.j2fe.workflow.definition.Node"/>
                <item idref="47" type="com.j2fe.workflow.definition.Node"/>
                <item idref="2" type="com.j2fe.workflow.definition.Node"/>
                <item idref="15" type="com.j2fe.workflow.definition.Node"/>
            </nodes>
            <optimize>false</optimize>
            <parameter id="439" type="java.util.HashMap">
                <entry>
                    <key id="440" type="java.lang.String">JMSByteMessage</key>
                    <value id="441" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="442">[B</className>
                        <clazz>[B</clazz>
                        <description id="443">If a byte message is set then this property contains the value.</description>
                        <input>true</input>
                        <output>false</output>
                        <required>false</required>
                    </value>
                </entry>
                <entry>
                    <key id="444" type="java.lang.String">JMSConnectionFactory</key>
                    <value id="445" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="446">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description idref="3"/>
                        <input>true</input>
                        <output>false</output>
                        <required>false</required>
                    </value>
                </entry>
                <entry>
                    <key id="447" type="java.lang.String">JMSCorrelationID</key>
                    <value id="448" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="449">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description id="450">The Correlation ID is an ID supplied by the customer that identifies one or more related transactions throughout processing.</description>
                        <input>true</input>
                        <output>false</output>
                        <required>false</required>
                    </value>
                </entry>
                <entry>
                    <key id="451" type="java.lang.String">JMSDestinationName</key>
                    <value id="452" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="453">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description id="454">This property displays the JMS destination name.</description>
                        <input>true</input>
                        <output>false</output>
                        <required>false</required>
                    </value>
                </entry>
                <entry>
                    <key id="455" type="java.lang.String">JMSMessageID</key>
                    <value id="456" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="457">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description id="458">The Message ID contains a value that uniquely identifies each message sent by a JMS provider. The scope of its uniqueness depdends on your JMS system</description>
                        <input>true</input>
                        <output>false</output>
                        <required>false</required>
                    </value>
                </entry>
                <entry>
                    <key id="459" type="java.lang.String">JMSMessages</key>
                    <value id="460" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="461">java.util.Map</className>
                        <clazz>java.util.Map</clazz>
                        <description id="462">If the JMS message type is MapMessage then this property contains the map of messages.</description>
                        <input>true</input>
                        <output>false</output>
                        <required>false</required>
                    </value>
                </entry>
                <entry>
                    <key id="463" type="java.lang.String">JMSObjectMessage</key>
                    <value id="464" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="465">java.lang.Object</className>
                        <clazz>java.lang.Object</clazz>
                        <description id="466">If the JMS message type is Object then this property contains the message.</description>
                        <input>true</input>
                        <output>false</output>
                        <required>false</required>
                    </value>
                </entry>
                <entry>
                    <key id="467" type="java.lang.String">JMSProperties</key>
                    <value id="468" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="469">java.util.Map</className>
                        <clazz>java.util.Map</clazz>
                        <description id="470">This property displays the JMS header properties.</description>
                        <input>true</input>
                        <output>false</output>
                        <required>false</required>
                    </value>
                </entry>
                <entry>
                    <key id="471" type="java.lang.String">JMSTextMessage</key>
                    <value id="472" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="473">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description id="474">If the JMS message type is Text then this property contains the message.</description>
                        <input>true</input>
                        <output>false</output>
                        <required>false</required>
                    </value>
                </entry>
                <entry>
                    <key id="475" type="java.lang.String">JMSTimestamp</key>
                    <value id="476" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="477">java.util.Date</className>
                        <clazz>java.util.Date</clazz>
                        <description id="478">This property displays the JMS timestamp.</description>
                        <input>true</input>
                        <output>false</output>
                        <required>false</required>
                    </value>
                </entry>
                <entry>
                    <key id="479" type="java.lang.String">JMSType</key>
                    <value id="480" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="481">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description id="482">This property defines the JMS type.</description>
                        <input>true</input>
                        <output>false</output>
                        <required>false</required>
                    </value>
                </entry>
                <entry>
                    <key id="483" type="java.lang.String">Path</key>
                    <value id="484" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="485">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <input>true</input>
                        <output>false</output>
                        <required>false</required>
                    </value>
                </entry>
                <entry>
                    <key id="486" type="java.lang.String">TESTEMAIL</key>
                    <value id="487" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="488">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description idref="3"/>
                        <input>true</input>
                        <output>false</output>
                        <required>false</required>
                    </value>
                </entry>
                <entry>
                    <key id="489" type="java.lang.String">metadata</key>
                    <value id="490" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="491">java.util.Map</className>
                        <clazz>java.util.Map</clazz>
                        <description id="492">Metadata for the event-instance.</description>
                        <input>true</input>
                        <output>false</output>
                        <required>false</required>
                    </value>
                </entry>
                <entry>
                    <key id="493" type="java.lang.String">name</key>
                    <value id="494" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="495">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description id="496">The name of the event-instance.</description>
                        <input>true</input>
                        <output>false</output>
                        <required>false</required>
                    </value>
                </entry>
            </parameter>
            <permissions id="497" type="java.util.HashSet"/>
            <priority>50</priority>
            <purgeAtEnd>false</purgeAtEnd>
            <retries>0</retries>
            <startNode idref="47"/>
            <status>RELEASED</status>
            <variables id="498" type="java.util.HashMap">
                <entry>
                    <key id="499" type="java.lang.String">JMSByteMessage</key>
                    <value id="500" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="501">[B</className>
                        <clazz>[B</clazz>
                        <description id="502">If a byte message is set then this property contains the value.</description>
                        <persistent>false</persistent>
                    </value>
                </entry>
                <entry>
                    <key id="503" type="java.lang.String">JMSConnectionFactory</key>
                    <value id="504" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="505">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description idref="3"/>
                        <persistent>false</persistent>
                        <value id="506" type="java.lang.String">TESTJMSCONFACT</value>
                    </value>
                </entry>
                <entry>
                    <key id="507" type="java.lang.String">JMSCorrelationID</key>
                    <value id="508" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="509">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description id="510">The Correlation ID is an ID supplied by the customer that identifies one or more related transactions throughout processing.</description>
                        <persistent>false</persistent>
                    </value>
                </entry>
                <entry>
                    <key id="511" type="java.lang.String">JMSDestinationName</key>
                    <value id="512" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="513">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description id="514">This property displays the JMS destination name.</description>
                        <persistent>false</persistent>
                    </value>
                </entry>
                <entry>
                    <key id="515" type="java.lang.String">JMSMessageID</key>
                    <value id="516" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="517">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description id="518">The Message ID contains a value that uniquely identifies each message sent by a JMS provider. The scope of its uniqueness depdends on your JMS system</description>
                        <persistent>false</persistent>
                    </value>
                </entry>
                <entry>
                    <key id="519" type="java.lang.String">JMSMessages</key>
                    <value id="520" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="521">java.util.Map</className>
                        <clazz>java.util.Map</clazz>
                        <description id="522">If the JMS message type is MapMessage then this property contains the map of messages.</description>
                        <persistent>false</persistent>
                    </value>
                </entry>
                <entry>
                    <key id="523" type="java.lang.String">JMSObjectMessage</key>
                    <value id="524" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="525">java.lang.Object</className>
                        <clazz>java.lang.Object</clazz>
                        <description id="526">If the JMS message type is Object then this property contains the message.</description>
                        <persistent>false</persistent>
                    </value>
                </entry>
                <entry>
                    <key id="527" type="java.lang.String">JMSProperties</key>
                    <value id="528" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="529">java.util.Map</className>
                        <clazz>java.util.Map</clazz>
                        <description id="530">This property displays the JMS header properties.</description>
                        <persistent>false</persistent>
                    </value>
                </entry>
                <entry>
                    <key id="531" type="java.lang.String">JMSTextMessage</key>
                    <value id="532" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="533">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description id="534">If the JMS message type is Text then this property contains the message.</description>
                        <persistent>false</persistent>
                    </value>
                </entry>
                <entry>
                    <key id="535" type="java.lang.String">JMSTimestamp</key>
                    <value id="536" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="537">java.util.Date</className>
                        <clazz>java.util.Date</clazz>
                        <description id="538">This property displays the JMS timestamp.</description>
                        <persistent>false</persistent>
                    </value>
                </entry>
                <entry>
                    <key id="539" type="java.lang.String">JMSType</key>
                    <value id="540" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="541">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description id="542">This property defines the JMS type.</description>
                        <persistent>false</persistent>
                    </value>
                </entry>
                <entry>
                    <key id="543" type="java.lang.String">Path</key>
                    <value id="544" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="545">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <persistent>false</persistent>
                        <value id="546" type="java.lang.String">${gs.log.path}/../GS-QueueMsg/DLQ</value>
                    </value>
                </entry>
                <entry>
                    <key id="547" type="java.lang.String">Retry</key>
                    <value id="548" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="549">java.lang.Integer</className>
                        <clazz>java.lang.Integer</clazz>
                        <persistent>false</persistent>
                        <value id="550" type="java.lang.Integer">1</value>
                    </value>
                </entry>
                <entry>
                    <key id="551" type="java.lang.String">TESTEMAIL</key>
                    <value id="552" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="553">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description idref="3"/>
                        <persistent>false</persistent>
                        <value id="554" type="java.lang.String">testemail</value>
                    </value>
                </entry>
                <entry>
                    <key id="555" type="java.lang.String">metadata</key>
                    <value id="556" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="557">java.util.Map</className>
                        <clazz>java.util.Map</clazz>
                        <description id="558">Metadata for the event-instance.</description>
                        <persistent>false</persistent>
                    </value>
                </entry>
                <entry>
                    <key id="559" type="java.lang.String">name</key>
                    <value id="560" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="561">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <description id="562">The name of the event-instance.</description>
                        <persistent>false</persistent>
                    </value>
                </entry>
            </variables>
            <version>3</version>
        </com.j2fe.workflow.definition.Workflow>
    </businessobject>
</goldensource-package>
