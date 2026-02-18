<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<goldensource-package version="10.0.0.02">
    <package-comment/>
    <businessobject displayString="9 - V-10" type="com.j2fe.workflow.definition.Workflow">
        <com.j2fe.workflow.definition.Workflow id="0">
            <alwaysPersist>true</alwaysPersist>
            <clustered>true</clustered>
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
                            <activation>ASYNCHRONOUS</activation>
                            <clusteredCall>false</clusteredCall>
                            <description idref="3"/>
                            <directJoin>true</directJoin>
                            <name id="10">Synchronize</name>
                            <nodeHandler>com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandler>
                            <nodeHandlerClass id="11">com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandlerClass>
                            <sources id="12" type="java.util.HashSet">
                                <item id="13" type="com.j2fe.workflow.definition.Transition">
                                    <name id="14">end-loop</name>
                                    <source id="15">
                                        <activation>ASYNCHRONOUS</activation>
                                        <clusteredCall>false</clusteredCall>
                                        <description idref="3"/>
                                        <directJoin>false</directJoin>
                                        <name id="16">Loop each instrument</name>
                                        <nodeHandler>com.j2fe.workflow.handler.impl.ForEach</nodeHandler>
                                        <nodeHandlerClass id="17">com.j2fe.workflow.handler.impl.ForEach</nodeHandlerClass>
                                        <parameters id="18" type="java.util.HashSet">
                                            <item id="19" type="com.j2fe.workflow.definition.Parameter">
                                                <input>true</input>
                                                <name id="20">counter</name>
                                                <stringValue id="21">LoopCounter</stringValue>
                                                <type>VARIABLE</type>
                                            </item>
                                            <item id="22" type="com.j2fe.workflow.definition.Parameter">
                                                <input>false</input>
                                                <name id="23">counter</name>
                                                <stringValue id="24">LoopCounter</stringValue>
                                                <type>VARIABLE</type>
                                            </item>
                                            <item id="25" type="com.j2fe.workflow.definition.Parameter">
                                                <input>true</input>
                                                <name id="26">input</name>
                                                <stringValue id="27">BulkInstruments</stringValue>
                                                <type>VARIABLE</type>
                                            </item>
                                            <item id="28" type="com.j2fe.workflow.definition.Parameter">
                                                <input>false</input>
                                                <name id="29">output</name>
                                                <stringValue id="30">instrument</stringValue>
                                                <type>VARIABLE</type>
                                            </item>
                                        </parameters>
                                        <sources id="31" type="java.util.HashSet">
                                            <item id="32" type="com.j2fe.workflow.definition.Transition">
                                                <name id="33">ToSplit</name>
                                                <source id="34">
                                                    <activation>INVOKE</activation>
                                                    <clusteredCall>false</clusteredCall>
                                                    <description id="35">Automatically generated</description>
                                                    <directJoin>false</directJoin>
                                                    <name id="36">Merge</name>
                                                    <nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
                                                    <nodeHandlerClass id="37">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
                                                    <sources id="38" type="java.util.HashSet">
                                                        <item id="39" type="com.j2fe.workflow.definition.Transition">
                                                            <name id="40">goto-next</name>
                                                            <source id="41">
                                                                <activation>INVOKE</activation>
                                                                <clusteredCall>false</clusteredCall>
                                                                <description idref="3"/>
                                                                <directJoin>false</directJoin>
                                                                <name id="42">Bean Shell Script (Standard)</name>
                                                                <nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
                                                                <nodeHandlerClass id="43">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
                                                                <parameters id="44" type="java.util.HashSet">
                                                                    <item id="45" type="com.j2fe.workflow.definition.Parameter">
                                                                        <input>true</input>
                                                                        <name id="46">statements</name>
                                                                        <stringValue id="47">int loopCounter =0;</stringValue>
                                                                        <type>CONSTANT</type>
                                                                    </item>
                                                                    <item id="48" type="com.j2fe.workflow.definition.Parameter">
                                                                        <input>false</input>
                                                                        <name id="49">variables["loopCounter"]</name>
                                                                        <stringValue id="50">LoopCounter</stringValue>
                                                                        <type>VARIABLE</type>
                                                                    </item>
                                                                </parameters>
                                                                <sources id="51" type="java.util.HashSet">
                                                                    <item id="52" type="com.j2fe.workflow.definition.Transition">
                                                                        <name id="53">goto-next</name>
                                                                        <source id="54">
                                                                            <activation>INVOKE</activation>
                                                                            <clusteredCall>false</clusteredCall>
                                                                            <description idref="3"/>
                                                                            <directJoin>true</directJoin>
                                                                            <name id="55">Bulk Items</name>
                                                                            <nodeHandler>com.j2fe.general.activities.BulkItems</nodeHandler>
                                                                            <nodeHandlerClass id="56">com.j2fe.general.activities.BulkItems</nodeHandlerClass>
                                                                            <parameters id="57" type="java.util.HashSet">
                                                                                <item id="58" type="com.j2fe.workflow.definition.Parameter">
                                                                                    <input>true</input>
                                                                                    <name id="59">bulk</name>
                                                                                    <stringValue id="60">BulkSize</stringValue>
                                                                                    <type>VARIABLE</type>
                                                                                </item>
                                                                                <item id="61" type="com.j2fe.workflow.definition.Parameter">
                                                                                    <input>true</input>
                                                                                    <name id="62">input</name>
                                                                                    <stringValue id="63">instruments</stringValue>
                                                                                    <type>VARIABLE</type>
                                                                                </item>
                                                                                <item id="64" type="com.j2fe.workflow.definition.Parameter">
                                                                                    <input>false</input>
                                                                                    <name id="65">output</name>
                                                                                    <stringValue id="66">BulkInstruments</stringValue>
                                                                                    <type>VARIABLE</type>
                                                                                </item>
                                                                            </parameters>
                                                                            <sources id="67" type="java.util.HashSet">
                                                                                <item id="68" type="com.j2fe.workflow.definition.Transition">
                                                                                    <name id="69">rows-found</name>
                                                                                    <source id="70">
                                                                                        <activation>INVOKE</activation>
                                                                                        <clusteredCall>false</clusteredCall>
                                                                                        <description idref="3"/>
                                                                                        <directJoin>false</directJoin>
                                                                                        <name id="71">Found Assets in MHI,MHEU SOI</name>
                                                                                        <nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
                                                                                        <nodeHandlerClass id="72">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
                                                                                        <parameters id="73" type="java.util.HashSet">
                                                                                            <item id="74" type="com.j2fe.workflow.definition.Parameter">
                                                                                                <input>true</input>
                                                                                                <name id="75">database</name>
                                                                                                <stringValue id="76">jdbc/GSDM-1</stringValue>
                                                                                                <type>REFERENCE</type>
                                                                                            </item>
                                                                                            <item id="77" type="com.j2fe.workflow.definition.Parameter">
                                                                                                <input>false</input>
                                                                                                <name id="78">firstColumnsResult</name>
                                                                                                <stringValue id="79">instruments</stringValue>
                                                                                                <type>VARIABLE</type>
                                                                                            </item>
                                                                                            <item id="80" type="com.j2fe.workflow.definition.Parameter">
                                                                                                <input>true</input>
                                                                                                <name id="81">querySQL</name>
                                                                                                <stringValue id="82">SELECT distinct isgp.INSTR_ID FROM FT_T_ISGP isgp&#13;
WHERE isgp.END_TMS IS NULL AND isgp.PRNT_ISS_GRP_OID IN (SELECT ISS_GRP_OID FROM FT_T_ISGR WHERE GRP_PURP_TYP = 'INTEREST' AND END_TMS IS NULL AND ORG_ID IS NOT NULL)&#13;
AND ISGP.PRT_PURP_TYP = 'INTEREST' AND ISGP.PRNT_ISS_GRP_OID not in (select ISS_GRP_OID from FT_T_ISGR where GRP_NME like 'MHSC%')&#13;
AND exists (SELECT 1 FROM FT_T_ISCL b WHERE b.INSTR_Id = isgp.INSTR_ID AND b.INDUS_CL_SET_ID = 'SFTRTYPE' AND b.END_TMS IS NULL AND b.CL_VALUE IN ( 'OEQU','MEQU','OTHR'))&#13;
</stringValue>
                                                                                                <type>CONSTANT</type>
                                                                                            </item>
                                                                                        </parameters>
                                                                                        <sources id="83" type="java.util.HashSet">
                                                                                            <item id="84" type="com.j2fe.workflow.definition.Transition">
                                                                                                <name id="85">goto-next</name>
                                                                                                <source id="86">
                                                                                                    <activation>INVOKE</activation>
                                                                                                    <clusteredCall>false</clusteredCall>
                                                                                                    <description idref="3"/>
                                                                                                    <directJoin>false</directJoin>
                                                                                                    <name id="87">Start</name>
                                                                                                    <nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
                                                                                                    <nodeHandlerClass id="88">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
                                                                                                    <sources id="89" type="java.util.HashSet"/>
                                                                                                    <targets id="90" type="java.util.HashSet">
                                                                                                        <item idref="84" type="com.j2fe.workflow.definition.Transition"/>
                                                                                                    </targets>
                                                                                                    <type>START</type>
                                                                                                </source>
                                                                                                <target idref="70"/>
                                                                                            </item>
                                                                                        </sources>
                                                                                        <targets id="91" type="java.util.HashSet">
                                                                                            <item id="92" type="com.j2fe.workflow.definition.Transition">
                                                                                                <name id="93">nothing-found</name>
                                                                                                <source idref="70"/>
                                                                                                <target idref="2"/>
                                                                                            </item>
                                                                                            <item idref="68" type="com.j2fe.workflow.definition.Transition"/>
                                                                                        </targets>
                                                                                        <type>XORSPLIT</type>
                                                                                    </source>
                                                                                    <target idref="54"/>
                                                                                </item>
                                                                            </sources>
                                                                            <targets id="94" type="java.util.HashSet">
                                                                                <item idref="52" type="com.j2fe.workflow.definition.Transition"/>
                                                                            </targets>
                                                                            <type>ANDSPLIT</type>
                                                                        </source>
                                                                        <target idref="41"/>
                                                                    </item>
                                                                </sources>
                                                                <targets id="95" type="java.util.HashSet">
                                                                    <item idref="39" type="com.j2fe.workflow.definition.Transition"/>
                                                                </targets>
                                                                <type>ACTIVITY</type>
                                                            </source>
                                                            <target idref="34"/>
                                                        </item>
                                                        <item id="96" type="com.j2fe.workflow.definition.Transition">
                                                            <name id="97">goto-next</name>
                                                            <source id="98">
                                                                <activation>INVOKE</activation>
                                                                <clusteredCall>false</clusteredCall>
                                                                <description idref="3"/>
                                                                <directJoin>false</directJoin>
                                                                <name id="99">NOP  #4</name>
                                                                <nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
                                                                <nodeHandlerClass id="100">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
                                                                <sources id="101" type="java.util.HashSet">
                                                                    <item id="102" type="com.j2fe.workflow.definition.Transition">
                                                                        <name id="103">goto-next</name>
                                                                        <source id="104">
                                                                            <activation>INVOKE</activation>
                                                                            <clusteredCall>false</clusteredCall>
                                                                            <description idref="3"/>
                                                                            <directJoin>false</directJoin>
                                                                            <name id="105">end of one Instrument</name>
                                                                            <nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
                                                                            <nodeHandlerClass id="106">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
                                                                            <sources id="107" type="java.util.HashSet">
                                                                                <item id="108" type="com.j2fe.workflow.definition.Transition">
                                                                                    <name id="109">goto-next</name>
                                                                                    <source id="110">
                                                                                        <activation>INVOKE</activation>
                                                                                        <clusteredCall>false</clusteredCall>
                                                                                        <description idref="3"/>
                                                                                        <directJoin>false</directJoin>
                                                                                        <name id="111">end of publishing change</name>
                                                                                        <nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
                                                                                        <nodeHandlerClass id="112">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
                                                                                        <sources id="113" type="java.util.HashSet">
                                                                                            <item id="114" type="com.j2fe.workflow.definition.Transition">
                                                                                                <name id="115">goto-next</name>
                                                                                                <source id="116">
                                                                                                    <activation>INVOKE</activation>
                                                                                                    <clusteredCall>false</clusteredCall>
                                                                                                    <description idref="3"/>
                                                                                                    <directJoin>false</directJoin>
                                                                                                    <name id="117">Call Subworkflow</name>
                                                                                                    <nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
                                                                                                    <nodeHandlerClass id="118">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
                                                                                                    <parameters id="119" type="java.util.HashSet">
                                                                                                        <item id="120" type="com.j2fe.workflow.definition.Parameter">
                                                                                                            <UITypeHint id="121">["InstrumentId"]@java/lang/String@</UITypeHint>
                                                                                                            <input>true</input>
                                                                                                            <name id="122">input["InstrumentId"]</name>
                                                                                                            <stringValue id="123">instrument</stringValue>
                                                                                                            <type>VARIABLE</type>
                                                                                                        </item>
                                                                                                        <item id="124" type="com.j2fe.workflow.definition.Parameter">
                                                                                                            <UITypeHint id="125">["No. Of Parallel Branches"]@java/lang/Integer@</UITypeHint>
                                                                                                            <input>true</input>
                                                                                                            <name id="126">input["No. Of Parallel Branches"]</name>
                                                                                                            <objectValue id="127" type="java.lang.Integer">1</objectValue>
                                                                                                            <type>CONSTANT</type>
                                                                                                        </item>
                                                                                                        <item id="128" type="com.j2fe.workflow.definition.Parameter">
                                                                                                            <input>true</input>
                                                                                                            <name id="129">name</name>
                                                                                                            <stringValue id="130">AssetById</stringValue>
                                                                                                            <type>CONSTANT</type>
                                                                                                        </item>
                                                                                                    </parameters>
                                                                                                    <sources id="131" type="java.util.HashSet">
                                                                                                        <item id="132" type="com.j2fe.workflow.definition.Transition">
                                                                                                            <name id="133">goto-next</name>
                                                                                                            <source id="134">
                                                                                                                <activation>INVOKE</activation>
                                                                                                                <clusteredCall>false</clusteredCall>
                                                                                                                <description idref="3"/>
                                                                                                                <directJoin>false</directJoin>
                                                                                                                <name id="135">start of publishing change</name>
                                                                                                                <nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
                                                                                                                <nodeHandlerClass id="136">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
                                                                                                                <sources id="137" type="java.util.HashSet">
                                                                                                                    <item id="138" type="com.j2fe.workflow.definition.Transition">
                                                                                                                        <name id="139">goto-next</name>
                                                                                                                        <source id="140">
                                                                                                                            <activation>INVOKE</activation>
                                                                                                                            <clusteredCall>false</clusteredCall>
                                                                                                                            <description idref="3"/>
                                                                                                                            <directJoin>false</directJoin>
                                                                                                                            <name id="141">Log SFTRQUAL insert</name>
                                                                                                                            <nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
                                                                                                                            <nodeHandlerClass id="142">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
                                                                                                                            <parameters id="143" type="java.util.HashSet">
                                                                                                                                <item id="144" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="145">database</name>
                                                                                                                                    <stringValue id="146">jdbc/GSDM-1</stringValue>
                                                                                                                                    <type>REFERENCE</type>
                                                                                                                                </item>
                                                                                                                                <item id="147" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="148">indexedParameters[0]</name>
                                                                                                                                    <stringValue id="149">instrument</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="150" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="151">querySQL</name>
                                                                                                                                    <stringValue id="152">CALL  mhi_sp_eventlog (&#13;
	  'SFTR_Quality_NOAP',&#13;
	  'insert SFTRQUAL=NOAP for Instrument',&#13;
	  ?&#13;
	);</stringValue>
                                                                                                                                    <type>CONSTANT</type>
                                                                                                                                </item>
                                                                                                                            </parameters>
                                                                                                                            <sources id="153" type="java.util.HashSet">
                                                                                                                                <item id="154" type="com.j2fe.workflow.definition.Transition">
                                                                                                                                    <name id="155">goto-next</name>
                                                                                                                                    <source id="156">
                                                                                                                                        <activation>INVOKE</activation>
                                                                                                                                        <clusteredCall>false</clusteredCall>
                                                                                                                                        <description idref="3"/>
                                                                                                                                        <directJoin>false</directJoin>
                                                                                                                                        <name id="157">Insert SFTRQUAL</name>
                                                                                                                                        <nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
                                                                                                                                        <nodeHandlerClass id="158">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
                                                                                                                                        <parameters id="159" type="java.util.HashSet">
                                                                                                                                            <item id="160" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                                <input>true</input>
                                                                                                                                                <name id="161">database</name>
                                                                                                                                                <stringValue id="162">jdbc/GSDM-1</stringValue>
                                                                                                                                                <type>REFERENCE</type>
                                                                                                                                            </item>
                                                                                                                                            <item id="163" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                                <input>true</input>
                                                                                                                                                <name id="164">indexedParameters[0]</name>
                                                                                                                                                <stringValue id="165">instrument</stringValue>
                                                                                                                                                <type>VARIABLE</type>
                                                                                                                                            </item>
                                                                                                                                            <item id="166" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                                <input>true</input>
                                                                                                                                                <name id="167">querySQL</name>
                                                                                                                                                <stringValue id="168">INSERT INTO FT_T_ISCL(ISS_CLSF_OID,INSTR_ID,INDUS_CL_SET_ID,CLSF_OID,CL_VALUE,CLSF_PURP_TYP,START_TMS,END_TMS,LAST_CHG_TMS,LAST_CHG_USR_ID)&#13;
VALUES (new_oid(),?,'SFTRQUAL','SFTRQUAL04','NOAP','SECUQUAL',current_timestamp,NULL,current_timestamp,'SFTRQUL_NOAP')</stringValue>
                                                                                                                                                <type>CONSTANT</type>
                                                                                                                                            </item>
                                                                                                                                        </parameters>
                                                                                                                                        <sources id="169" type="java.util.HashSet">
                                                                                                                                            <item id="170" type="com.j2fe.workflow.definition.Transition">
                                                                                                                                                <name id="171">nothing-found</name>
                                                                                                                                                <source id="172">
                                                                                                                                                    <activation>INVOKE</activation>
                                                                                                                                                    <clusteredCall>false</clusteredCall>
                                                                                                                                                    <description idref="3"/>
                                                                                                                                                    <directJoin>false</directJoin>
                                                                                                                                                    <name id="173">check SFTRQUAL row exists</name>
                                                                                                                                                    <nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
                                                                                                                                                    <nodeHandlerClass id="174">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
                                                                                                                                                    <parameters id="175" type="java.util.HashSet">
                                                                                                                                                        <item id="176" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                                            <input>true</input>
                                                                                                                                                            <name id="177">database</name>
                                                                                                                                                            <stringValue id="178">jdbc/GSDM-1</stringValue>
                                                                                                                                                            <type>REFERENCE</type>
                                                                                                                                                        </item>
                                                                                                                                                        <item id="179" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                                            <input>false</input>
                                                                                                                                                            <name id="180">firstColumnsResult</name>
                                                                                                                                                            <stringValue id="181">instruments</stringValue>
                                                                                                                                                            <type>VARIABLE</type>
                                                                                                                                                        </item>
                                                                                                                                                        <item id="182" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                                            <UITypeHint id="183">[0]@java/lang/Object@</UITypeHint>
                                                                                                                                                            <input>true</input>
                                                                                                                                                            <name id="184">indexedParameters[0]</name>
                                                                                                                                                            <stringValue id="185">instrument</stringValue>
                                                                                                                                                            <type>VARIABLE</type>
                                                                                                                                                        </item>
                                                                                                                                                        <item id="186" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                                            <input>true</input>
                                                                                                                                                            <name id="187">querySQL</name>
                                                                                                                                                            <stringValue id="188">SELECT DISTINCT INSTR_ID FROM FT_T_ISCL ISCL&#13;
WHERE ISCL.INDUS_CL_SET_ID = 'SFTRQUAL' AND ISCL.END_TMS IS NULL &#13;
AND INSTR_ID = ?</stringValue>
                                                                                                                                                            <type>CONSTANT</type>
                                                                                                                                                        </item>
                                                                                                                                                    </parameters>
                                                                                                                                                    <sources id="189" type="java.util.HashSet">
                                                                                                                                                        <item id="190" type="com.j2fe.workflow.definition.Transition">
                                                                                                                                                            <name id="191">nothing-found</name>
                                                                                                                                                            <source id="192">
                                                                                                                                                                <activation>INVOKE</activation>
                                                                                                                                                                <clusteredCall>false</clusteredCall>
                                                                                                                                                                <description idref="3"/>
                                                                                                                                                                <directJoin>false</directJoin>
                                                                                                                                                                <name id="193">check SFTRQUAL lock</name>
                                                                                                                                                                <nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
                                                                                                                                                                <nodeHandlerClass id="194">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
                                                                                                                                                                <parameters id="195" type="java.util.HashSet">
                                                                                                                                                                    <item id="196" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                                                        <input>true</input>
                                                                                                                                                                        <name id="197">database</name>
                                                                                                                                                                        <stringValue id="198">jdbc/GSDM-1</stringValue>
                                                                                                                                                                        <type>REFERENCE</type>
                                                                                                                                                                    </item>
                                                                                                                                                                    <item id="199" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                                                        <input>false</input>
                                                                                                                                                                        <name id="200">firstColumnsResult</name>
                                                                                                                                                                        <stringValue id="201">instruments</stringValue>
                                                                                                                                                                        <type>VARIABLE</type>
                                                                                                                                                                    </item>
                                                                                                                                                                    <item id="202" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                                                        <UITypeHint id="203">[0]@java/lang/Object@</UITypeHint>
                                                                                                                                                                        <input>true</input>
                                                                                                                                                                        <name id="204">indexedParameters[0]</name>
                                                                                                                                                                        <stringValue id="205">instrument</stringValue>
                                                                                                                                                                        <type>VARIABLE</type>
                                                                                                                                                                    </item>
                                                                                                                                                                    <item id="206" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                                                        <input>true</input>
                                                                                                                                                                        <name id="207">querySQL</name>
                                                                                                                                                                        <stringValue id="208">SELECT DISTINCT INSTR_ID FROM FT_T_ISCL ISCL&#13;
INNER JOIN FT_T_OVRC OVRC ON OVRC.OVR_REF_OID = ISCL.INSTR_ID AND OVRC.OVR_REF_TYP = 'ISSU' AND OVRC.END_TMS IS NULL AND OVRC.OVR_TBL_KEY_TXT = 'ISS_CLSF_OID=' || ISCL.ISS_CLSF_OID || ';'&#13;
WHERE ISCL.INDUS_CL_SET_ID = 'SFTRQUAL' AND ISCL.END_TMS IS NULL &#13;
AND INSTR_ID = ?</stringValue>
                                                                                                                                                                        <type>CONSTANT</type>
                                                                                                                                                                    </item>
                                                                                                                                                                </parameters>
                                                                                                                                                                <sources id="209" type="java.util.HashSet">
                                                                                                                                                                    <item id="210" type="com.j2fe.workflow.definition.Transition">
                                                                                                                                                                        <name id="211">rows-found</name>
                                                                                                                                                                        <source id="212">
                                                                                                                                                                            <activation>INVOKE</activation>
                                                                                                                                                                            <clusteredCall>false</clusteredCall>
                                                                                                                                                                            <description idref="3"/>
                                                                                                                                                                            <directJoin>false</directJoin>
                                                                                                                                                                            <name id="213">check SFTRQUAL not NOAP</name>
                                                                                                                                                                            <nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
                                                                                                                                                                            <nodeHandlerClass id="214">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
                                                                                                                                                                            <parameters id="215" type="java.util.HashSet">
                                                                                                                                                                                <item id="216" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                                                                    <input>true</input>
                                                                                                                                                                                    <name id="217">database</name>
                                                                                                                                                                                    <stringValue id="218">jdbc/GSDM-1</stringValue>
                                                                                                                                                                                    <type>REFERENCE</type>
                                                                                                                                                                                </item>
                                                                                                                                                                                <item id="219" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                                                                    <input>false</input>
                                                                                                                                                                                    <name id="220">firstColumnsResult</name>
                                                                                                                                                                                    <stringValue id="221">instruments</stringValue>
                                                                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                                                                </item>
                                                                                                                                                                                <item id="222" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                                                                    <UITypeHint id="223">[0]@java/lang/Object@</UITypeHint>
                                                                                                                                                                                    <input>true</input>
                                                                                                                                                                                    <name id="224">indexedParameters[0]</name>
                                                                                                                                                                                    <stringValue id="225">instrument</stringValue>
                                                                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                                                                </item>
                                                                                                                                                                                <item id="226" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                                                                    <input>true</input>
                                                                                                                                                                                    <name id="227">querySQL</name>
                                                                                                                                                                                    <stringValue id="228">select 1 from dual where not exists (select instr_id from ft_t_iscl where instr_id = ? and INDUS_CL_SET_ID = 'SFTRQUAL' AND END_TMS IS NULL AND CL_VALUE = 'NOAP')</stringValue>
                                                                                                                                                                                    <type>CONSTANT</type>
                                                                                                                                                                                </item>
                                                                                                                                                                            </parameters>
                                                                                                                                                                            <sources id="229" type="java.util.HashSet">
                                                                                                                                                                                <item id="230" type="com.j2fe.workflow.definition.Transition">
                                                                                                                                                                                    <name id="231">rows-found</name>
                                                                                                                                                                                    <source id="232">
                                                                                                                                                                                        <activation>INVOKE</activation>
                                                                                                                                                                                        <clusteredCall>false</clusteredCall>
                                                                                                                                                                                        <description idref="3"/>
                                                                                                                                                                                        <directJoin>false</directJoin>
                                                                                                                                                                                        <name id="233">check SFTRTYPE is eligible</name>
                                                                                                                                                                                        <nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
                                                                                                                                                                                        <nodeHandlerClass id="234">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
                                                                                                                                                                                        <parameters id="235" type="java.util.HashSet">
                                                                                                                                                                                            <item id="236" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                                                                                <input>true</input>
                                                                                                                                                                                                <name id="237">database</name>
                                                                                                                                                                                                <stringValue id="238">jdbc/GSDM-1</stringValue>
                                                                                                                                                                                                <type>REFERENCE</type>
                                                                                                                                                                                            </item>
                                                                                                                                                                                            <item id="239" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                                                                                <input>false</input>
                                                                                                                                                                                                <name id="240">firstColumnsResult</name>
                                                                                                                                                                                                <stringValue id="241">instruments</stringValue>
                                                                                                                                                                                                <type>VARIABLE</type>
                                                                                                                                                                                            </item>
                                                                                                                                                                                            <item id="242" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                                                                                <UITypeHint id="243">[0]@java/lang/Object@</UITypeHint>
                                                                                                                                                                                                <input>true</input>
                                                                                                                                                                                                <name id="244">indexedParameters[0]</name>
                                                                                                                                                                                                <stringValue id="245">instrument</stringValue>
                                                                                                                                                                                                <type>VARIABLE</type>
                                                                                                                                                                                            </item>
                                                                                                                                                                                            <item id="246" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                                                                                <input>true</input>
                                                                                                                                                                                                <name id="247">querySQL</name>
                                                                                                                                                                                                <stringValue id="248">SELECT  CL_VALUE FROM FT_T_ISCL&#13;
WHERE INSTR_ID = ? AND INDUS_CL_SET_ID = 'SFTRTYPE' AND CL_VALUE IN ('MEQU','OEQU','OTHR') AND END_TMS IS NULL</stringValue>
                                                                                                                                                                                                <type>CONSTANT</type>
                                                                                                                                                                                            </item>
                                                                                                                                                                                        </parameters>
                                                                                                                                                                                        <sources id="249" type="java.util.HashSet">
                                                                                                                                                                                            <item id="250" type="com.j2fe.workflow.definition.Transition">
                                                                                                                                                                                                <name id="251">loop</name>
                                                                                                                                                                                                <source idref="15"/>
                                                                                                                                                                                                <target idref="232"/>
                                                                                                                                                                                            </item>
                                                                                                                                                                                        </sources>
                                                                                                                                                                                        <targets id="252" type="java.util.HashSet">
                                                                                                                                                                                            <item id="253" type="com.j2fe.workflow.definition.Transition">
                                                                                                                                                                                                <name id="254">nothing-found</name>
                                                                                                                                                                                                <source idref="232"/>
                                                                                                                                                                                                <target idref="104"/>
                                                                                                                                                                                            </item>
                                                                                                                                                                                            <item idref="230" type="com.j2fe.workflow.definition.Transition"/>
                                                                                                                                                                                        </targets>
                                                                                                                                                                                        <type>XORSPLIT</type>
                                                                                                                                                                                    </source>
                                                                                                                                                                                    <target idref="212"/>
                                                                                                                                                                                </item>
                                                                                                                                                                            </sources>
                                                                                                                                                                            <targets id="255" type="java.util.HashSet">
                                                                                                                                                                                <item id="256" type="com.j2fe.workflow.definition.Transition">
                                                                                                                                                                                    <name id="257">nothing-found</name>
                                                                                                                                                                                    <source idref="212"/>
                                                                                                                                                                                    <target idref="104"/>
                                                                                                                                                                                </item>
                                                                                                                                                                                <item idref="210" type="com.j2fe.workflow.definition.Transition"/>
                                                                                                                                                                            </targets>
                                                                                                                                                                            <type>XORSPLIT</type>
                                                                                                                                                                        </source>
                                                                                                                                                                        <target idref="192"/>
                                                                                                                                                                    </item>
                                                                                                                                                                </sources>
                                                                                                                                                                <targets id="258" type="java.util.HashSet">
                                                                                                                                                                    <item idref="190" type="com.j2fe.workflow.definition.Transition"/>
                                                                                                                                                                    <item id="259" type="com.j2fe.workflow.definition.Transition">
                                                                                                                                                                        <name id="260">rows-found</name>
                                                                                                                                                                        <source idref="192"/>
                                                                                                                                                                        <target idref="104"/>
                                                                                                                                                                    </item>
                                                                                                                                                                </targets>
                                                                                                                                                                <type>XORSPLIT</type>
                                                                                                                                                            </source>
                                                                                                                                                            <target idref="172"/>
                                                                                                                                                        </item>
                                                                                                                                                    </sources>
                                                                                                                                                    <targets id="261" type="java.util.HashSet">
                                                                                                                                                        <item idref="170" type="com.j2fe.workflow.definition.Transition"/>
                                                                                                                                                        <item id="262" type="com.j2fe.workflow.definition.Transition">
                                                                                                                                                            <name id="263">rows-found</name>
                                                                                                                                                            <source idref="172"/>
                                                                                                                                                            <target id="264">
                                                                                                                                                                <activation>INVOKE</activation>
                                                                                                                                                                <clusteredCall>false</clusteredCall>
                                                                                                                                                                <description idref="3"/>
                                                                                                                                                                <directJoin>false</directJoin>
                                                                                                                                                                <name id="265">Update SFTRQUAL</name>
                                                                                                                                                                <nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
                                                                                                                                                                <nodeHandlerClass id="266">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
                                                                                                                                                                <parameters id="267" type="java.util.HashSet">
                                                                                                                                                                    <item id="268" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                                                        <input>true</input>
                                                                                                                                                                        <name id="269">database</name>
                                                                                                                                                                        <stringValue id="270">jdbc/GSDM-1</stringValue>
                                                                                                                                                                        <type>REFERENCE</type>
                                                                                                                                                                    </item>
                                                                                                                                                                    <item id="271" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                                                        <input>true</input>
                                                                                                                                                                        <name id="272">indexedParameters[0]</name>
                                                                                                                                                                        <stringValue id="273">instrument</stringValue>
                                                                                                                                                                        <type>VARIABLE</type>
                                                                                                                                                                    </item>
                                                                                                                                                                    <item id="274" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                                                        <input>true</input>
                                                                                                                                                                        <name id="275">querySQL</name>
                                                                                                                                                                        <stringValue id="276">UPDATE FT_T_ISCL SET CL_VALUE='NOAP', CLSF_OID='SFTRQUAL04',LAST_CHG_TMS=current_timestamp, LAST_CHG_USR_ID='SFTRQUL_NOAP', CLSF_PURP_TYP = 'SECUQUAL'&#13;
WHERE INSTR_ID = ? AND INDUS_CL_SET_ID = 'SFTRQUAL' AND END_TMS IS NULL</stringValue>
                                                                                                                                                                        <type>CONSTANT</type>
                                                                                                                                                                    </item>
                                                                                                                                                                </parameters>
                                                                                                                                                                <sources id="277" type="java.util.HashSet">
                                                                                                                                                                    <item idref="262" type="com.j2fe.workflow.definition.Transition"/>
                                                                                                                                                                </sources>
                                                                                                                                                                <targets id="278" type="java.util.HashSet">
                                                                                                                                                                    <item id="279" type="com.j2fe.workflow.definition.Transition">
                                                                                                                                                                        <name id="280">goto-next</name>
                                                                                                                                                                        <source idref="264"/>
                                                                                                                                                                        <target id="281">
                                                                                                                                                                            <activation>INVOKE</activation>
                                                                                                                                                                            <clusteredCall>false</clusteredCall>
                                                                                                                                                                            <description idref="3"/>
                                                                                                                                                                            <directJoin>false</directJoin>
                                                                                                                                                                            <name id="282">Log SFTRQUAL update</name>
                                                                                                                                                                            <nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
                                                                                                                                                                            <nodeHandlerClass id="283">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
                                                                                                                                                                            <parameters id="284" type="java.util.HashSet">
                                                                                                                                                                                <item id="285" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                                                                    <input>true</input>
                                                                                                                                                                                    <name id="286">database</name>
                                                                                                                                                                                    <stringValue id="287">jdbc/GSDM-1</stringValue>
                                                                                                                                                                                    <type>REFERENCE</type>
                                                                                                                                                                                </item>
                                                                                                                                                                                <item id="288" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                                                                    <input>true</input>
                                                                                                                                                                                    <name id="289">indexedParameters[0]</name>
                                                                                                                                                                                    <stringValue id="290">instrument</stringValue>
                                                                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                                                                </item>
                                                                                                                                                                                <item id="291" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                                                                    <input>true</input>
                                                                                                                                                                                    <name id="292">querySQL</name>
                                                                                                                                                                                    <stringValue id="293">CALL  mhi_sp_eventlog (&#13;
	  'SFTR_Quality_NOAP',&#13;
	  'update SFTRQUAL=NOAP for Instrument',&#13;
	  ?&#13;
	);</stringValue>
                                                                                                                                                                                    <type>CONSTANT</type>
                                                                                                                                                                                </item>
                                                                                                                                                                            </parameters>
                                                                                                                                                                            <sources id="294" type="java.util.HashSet">
                                                                                                                                                                                <item idref="279" type="com.j2fe.workflow.definition.Transition"/>
                                                                                                                                                                            </sources>
                                                                                                                                                                            <targets id="295" type="java.util.HashSet">
                                                                                                                                                                                <item id="296" type="com.j2fe.workflow.definition.Transition">
                                                                                                                                                                                    <name id="297">goto-next</name>
                                                                                                                                                                                    <source idref="281"/>
                                                                                                                                                                                    <target idref="134"/>
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
                                                                                                                                                <target idref="156"/>
                                                                                                                                            </item>
                                                                                                                                        </sources>
                                                                                                                                        <targets id="298" type="java.util.HashSet">
                                                                                                                                            <item idref="154" type="com.j2fe.workflow.definition.Transition"/>
                                                                                                                                        </targets>
                                                                                                                                        <type>ACTIVITY</type>
                                                                                                                                    </source>
                                                                                                                                    <target idref="140"/>
                                                                                                                                </item>
                                                                                                                            </sources>
                                                                                                                            <targets id="299" type="java.util.HashSet">
                                                                                                                                <item idref="138" type="com.j2fe.workflow.definition.Transition"/>
                                                                                                                            </targets>
                                                                                                                            <type>ACTIVITY</type>
                                                                                                                        </source>
                                                                                                                        <target idref="134"/>
                                                                                                                    </item>
                                                                                                                    <item idref="296" type="com.j2fe.workflow.definition.Transition"/>
                                                                                                                </sources>
                                                                                                                <targets id="300" type="java.util.HashSet">
                                                                                                                    <item idref="132" type="com.j2fe.workflow.definition.Transition"/>
                                                                                                                </targets>
                                                                                                                <type>ACTIVITY</type>
                                                                                                            </source>
                                                                                                            <target idref="116"/>
                                                                                                        </item>
                                                                                                    </sources>
                                                                                                    <targets id="301" type="java.util.HashSet">
                                                                                                        <item idref="114" type="com.j2fe.workflow.definition.Transition"/>
                                                                                                    </targets>
                                                                                                    <type>ACTIVITY</type>
                                                                                                </source>
                                                                                                <target idref="110"/>
                                                                                            </item>
                                                                                        </sources>
                                                                                        <targets id="302" type="java.util.HashSet">
                                                                                            <item idref="108" type="com.j2fe.workflow.definition.Transition"/>
                                                                                        </targets>
                                                                                        <type>ACTIVITY</type>
                                                                                    </source>
                                                                                    <target idref="104"/>
                                                                                </item>
                                                                                <item idref="256" type="com.j2fe.workflow.definition.Transition"/>
                                                                                <item idref="253" type="com.j2fe.workflow.definition.Transition"/>
                                                                                <item idref="259" type="com.j2fe.workflow.definition.Transition"/>
                                                                            </sources>
                                                                            <targets id="303" type="java.util.HashSet">
                                                                                <item idref="102" type="com.j2fe.workflow.definition.Transition"/>
                                                                            </targets>
                                                                            <type>ACTIVITY</type>
                                                                        </source>
                                                                        <target idref="98"/>
                                                                    </item>
                                                                </sources>
                                                                <targets id="304" type="java.util.HashSet">
                                                                    <item idref="96" type="com.j2fe.workflow.definition.Transition"/>
                                                                </targets>
                                                                <type>ACTIVITY</type>
                                                            </source>
                                                            <target idref="34"/>
                                                        </item>
                                                    </sources>
                                                    <targets id="305" type="java.util.HashSet">
                                                        <item idref="32" type="com.j2fe.workflow.definition.Transition"/>
                                                    </targets>
                                                    <type>ACTIVITY</type>
                                                </source>
                                                <target idref="15"/>
                                            </item>
                                        </sources>
                                        <targets id="306" type="java.util.HashSet">
                                            <item idref="13" type="com.j2fe.workflow.definition.Transition"/>
                                            <item idref="250" type="com.j2fe.workflow.definition.Transition"/>
                                        </targets>
                                        <type>XORSPLIT</type>
                                    </source>
                                    <target idref="9"/>
                                </item>
                            </sources>
                            <targets id="307" type="java.util.HashSet">
                                <item idref="7" type="com.j2fe.workflow.definition.Transition"/>
                            </targets>
                            <type>ANDJOIN</type>
                        </source>
                        <target idref="2"/>
                    </item>
                    <item idref="92" type="com.j2fe.workflow.definition.Transition"/>
                </sources>
                <targets id="308" type="java.util.HashSet"/>
                <type>END</type>
            </endNode>
            <forcePurgeAtEnd>false</forcePurgeAtEnd>
            <group id="309">Mizuho/Ratings</group>
            <haltOnError>false</haltOnError>
            <lastChangeUser id="310">user1</lastChangeUser>
            <lastUpdate id="311">2025-06-09T13:16:51.000+0000</lastUpdate>
            <name id="312">SFTR_Quality_NOAP</name>
            <nodes id="313" type="java.util.HashSet">
                <item idref="41" type="com.j2fe.workflow.definition.Node"/>
                <item idref="54" type="com.j2fe.workflow.definition.Node"/>
                <item idref="116" type="com.j2fe.workflow.definition.Node"/>
                <item idref="70" type="com.j2fe.workflow.definition.Node"/>
                <item idref="156" type="com.j2fe.workflow.definition.Node"/>
                <item idref="140" type="com.j2fe.workflow.definition.Node"/>
                <item idref="281" type="com.j2fe.workflow.definition.Node"/>
                <item idref="15" type="com.j2fe.workflow.definition.Node"/>
                <item idref="34" type="com.j2fe.workflow.definition.Node"/>
                <item idref="98" type="com.j2fe.workflow.definition.Node"/>
                <item idref="86" type="com.j2fe.workflow.definition.Node"/>
                <item idref="2" type="com.j2fe.workflow.definition.Node"/>
                <item idref="9" type="com.j2fe.workflow.definition.Node"/>
                <item idref="264" type="com.j2fe.workflow.definition.Node"/>
                <item idref="192" type="com.j2fe.workflow.definition.Node"/>
                <item idref="212" type="com.j2fe.workflow.definition.Node"/>
                <item idref="172" type="com.j2fe.workflow.definition.Node"/>
                <item idref="232" type="com.j2fe.workflow.definition.Node"/>
                <item idref="104" type="com.j2fe.workflow.definition.Node"/>
                <item idref="110" type="com.j2fe.workflow.definition.Node"/>
                <item idref="134" type="com.j2fe.workflow.definition.Node"/>
            </nodes>
            <optimize>true</optimize>
            <parameter id="314" type="java.util.HashMap">
                <entry>
                    <key id="315" type="java.lang.String">BulkSize</key>
                    <value id="316" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="317">java.lang.Integer</className>
                        <clazz>java.lang.Integer</clazz>
                        <input>true</input>
                        <output>false</output>
                        <required>false</required>
                    </value>
                </entry>
            </parameter>
            <permissions id="318" type="java.util.HashSet"/>
            <priority>50</priority>
            <purgeAtEnd>false</purgeAtEnd>
            <retries>0</retries>
            <startNode idref="86"/>
            <status>RELEASED</status>
            <variables id="319" type="java.util.HashMap">
                <entry>
                    <key id="320" type="java.lang.String">BulkSize</key>
                    <value id="321" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="322">java.lang.Integer</className>
                        <clazz>java.lang.Integer</clazz>
                        <persistent>false</persistent>
                        <value idref="127"/>
                    </value>
                </entry>
            </variables>
            <version>9</version>
        </com.j2fe.workflow.definition.Workflow>
    </businessobject>
</goldensource-package>
