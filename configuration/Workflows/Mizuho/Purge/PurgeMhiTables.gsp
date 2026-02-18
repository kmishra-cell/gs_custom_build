<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<goldensource-package version="10.0.0.02">
    <package-comment/>
    <businessobject displayString="4 - V-10 Schema_correction" type="com.j2fe.workflow.definition.Workflow">
        <com.j2fe.workflow.definition.Workflow id="0">
            <alwaysPersist>true</alwaysPersist>
            <clustered>true</clustered>
            <comment id="1">V-10 Schema_correction</comment>
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
                            <name id="10">Shrink FT_T_PBAT</name>
                            <nodeHandler>com.j2fe.event.RaiseEvent</nodeHandler>
                            <nodeHandlerClass id="11">com.j2fe.event.RaiseEvent</nodeHandlerClass>
                            <parameters id="12" type="java.util.HashSet">
                                <item id="13" type="com.j2fe.workflow.definition.Parameter">
                                    <input>true</input>
                                    <name id="14">eventName</name>
                                    <stringValue id="15">ShrinkEvent</stringValue>
                                    <type>CONSTANT</type>
                                </item>
                                <item id="16" type="com.j2fe.workflow.definition.Parameter">
                                    <input>true</input>
                                    <name id="17">parameters["Table"]</name>
                                    <stringValue id="18">FT_T_PBAT</stringValue>
                                    <type>VARIABLE</type>
                                </item>
                            </parameters>
                            <sources id="19" type="java.util.HashSet">
                                <item id="20" type="com.j2fe.workflow.definition.Transition">
                                    <name id="21">goto-next</name>
                                    <source id="22">
                                        <activation>INVOKE</activation>
                                        <clusteredCall>false</clusteredCall>
                                        <description idref="3"/>
                                        <directJoin>false</directJoin>
                                        <name id="23">Shrink FT_T_PBDP</name>
                                        <nodeHandler>com.j2fe.event.RaiseEvent</nodeHandler>
                                        <nodeHandlerClass id="24">com.j2fe.event.RaiseEvent</nodeHandlerClass>
                                        <parameters id="25" type="java.util.HashSet">
                                            <item id="26" type="com.j2fe.workflow.definition.Parameter">
                                                <input>true</input>
                                                <name id="27">eventName</name>
                                                <stringValue id="28">ShrinkEvent</stringValue>
                                                <type>CONSTANT</type>
                                            </item>
                                            <item id="29" type="com.j2fe.workflow.definition.Parameter">
                                                <input>true</input>
                                                <name id="30">parameters["Table"]</name>
                                                <stringValue id="31">FT_T_PBDP</stringValue>
                                                <type>VARIABLE</type>
                                            </item>
                                        </parameters>
                                        <sources id="32" type="java.util.HashSet">
                                            <item id="33" type="com.j2fe.workflow.definition.Transition">
                                                <name id="34">goto-next</name>
                                                <source id="35">
                                                    <activation>INVOKE</activation>
                                                    <clusteredCall>false</clusteredCall>
                                                    <description idref="3"/>
                                                    <directJoin>false</directJoin>
                                                    <name id="36">Shrink MHI_TB_EVENTLOG</name>
                                                    <nodeHandler>com.j2fe.event.RaiseEvent</nodeHandler>
                                                    <nodeHandlerClass id="37">com.j2fe.event.RaiseEvent</nodeHandlerClass>
                                                    <parameters id="38" type="java.util.HashSet">
                                                        <item id="39" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="40">eventName</name>
                                                            <stringValue id="41">ShrinkEvent</stringValue>
                                                            <type>CONSTANT</type>
                                                        </item>
                                                        <item id="42" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="43">parameters["Table"]</name>
                                                            <stringValue id="44">MHI_TB_EVENTLOG</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                    </parameters>
                                                    <sources id="45" type="java.util.HashSet">
                                                        <item id="46" type="com.j2fe.workflow.definition.Transition">
                                                            <name id="47">goto-next</name>
                                                            <source id="48">
                                                                <activation>INVOKE</activation>
                                                                <clusteredCall>false</clusteredCall>
                                                                <description idref="3"/>
                                                                <directJoin>false</directJoin>
                                                                <name id="49">Start Shrinks</name>
                                                                <nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
                                                                <nodeHandlerClass id="50">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
                                                                <sources id="51" type="java.util.HashSet">
                                                                    <item id="52" type="com.j2fe.workflow.definition.Transition">
                                                                        <name id="53">goto-next</name>
                                                                        <source id="54">
                                                                            <activation>INVOKE</activation>
                                                                            <clusteredCall>false</clusteredCall>
                                                                            <description idref="3"/>
                                                                            <directJoin>false</directJoin>
                                                                            <name id="55">Log Events in Orchestrator Log</name>
                                                                            <nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
                                                                            <nodeHandlerClass id="56">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
                                                                            <parameters id="57" type="java.util.HashSet">
                                                                                <item id="58" type="com.j2fe.workflow.definition.Parameter">
                                                                                    <input>true</input>
                                                                                    <name id="59">statements</name>
                                                                                    <stringValue id="60">import org.apache.log4j.Logger;&#13;
Logger logger = Logger.getLogger("PurgeMhiTables");&#13;
logger.info("Purge FT_T_PBAT Completed");&#13;
logger.info("Shrink Started...");&#13;
</stringValue>
                                                                                    <type>CONSTANT</type>
                                                                                </item>
                                                                            </parameters>
                                                                            <sources id="61" type="java.util.HashSet">
                                                                                <item id="62" type="com.j2fe.workflow.definition.Transition">
                                                                                    <name id="63">goto-next</name>
                                                                                    <source id="64">
                                                                                        <activation>INVOKE</activation>
                                                                                        <clusteredCall>false</clusteredCall>
                                                                                        <description idref="3"/>
                                                                                        <directJoin>false</directJoin>
                                                                                        <name id="65">Log Events in DB</name>
                                                                                        <nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
                                                                                        <nodeHandlerClass id="66">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
                                                                                        <parameters id="67" type="java.util.HashSet">
                                                                                            <item id="68" type="com.j2fe.workflow.definition.Parameter">
                                                                                                <input>true</input>
                                                                                                <name id="69">database</name>
                                                                                                <stringValue id="70">jdbc/GSDM-1</stringValue>
                                                                                                <type>REFERENCE</type>
                                                                                            </item>
                                                                                            <item id="71" type="com.j2fe.workflow.definition.Parameter">
                                                                                                <input>true</input>
                                                                                                <name id="72">querySQL</name>
                                                                                                <stringValue id="73">call&#13;
 mhi_sp_eventlog (&#13;
	  'PurgeMhiTables Workflow',&#13;
	  'PurgeMhiTables Workflow',&#13;
	  'Purge FT_T_PBAT Completed'&#13;
	); &#13;
 call mhi_sp_eventlog (&#13;
	  'PurgeMhiTables Workflow',&#13;
	  'PurgeMhiTables Workflow',&#13;
	  'Shrink Started'&#13;
	);</stringValue>
                                                                                                <type>CONSTANT</type>
                                                                                            </item>
                                                                                        </parameters>
                                                                                        <sources id="74" type="java.util.HashSet">
                                                                                            <item id="75" type="com.j2fe.workflow.definition.Transition">
                                                                                                <name id="76">goto-next</name>
                                                                                                <source id="77">
                                                                                                    <activation>TRANSACTIONAL</activation>
                                                                                                    <clusteredCall>false</clusteredCall>
                                                                                                    <description idref="3"/>
                                                                                                    <directJoin>false</directJoin>
                                                                                                    <name id="78">FT_T_PBAT</name>
                                                                                                    <nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
                                                                                                    <nodeHandlerClass id="79">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
                                                                                                    <parameters id="80" type="java.util.HashSet">
                                                                                                        <item id="81" type="com.j2fe.workflow.definition.Parameter">
                                                                                                            <input>true</input>
                                                                                                            <name id="82">database</name>
                                                                                                            <stringValue id="83">jdbc/GSDM-1</stringValue>
                                                                                                            <type>REFERENCE</type>
                                                                                                        </item>
                                                                                                        <item id="84" type="com.j2fe.workflow.definition.Parameter">
                                                                                                            <UITypeHint id="85">[0]@java/lang/Integer@</UITypeHint>
                                                                                                            <input>true</input>
                                                                                                            <name id="86">indexedParameters[0]</name>
                                                                                                            <stringValue id="87">DaysToKeep</stringValue>
                                                                                                            <type>VARIABLE</type>
                                                                                                        </item>
                                                                                                        <item id="88" type="com.j2fe.workflow.definition.Parameter">
                                                                                                            <input>true</input>
                                                                                                            <name id="89">indexedParameters[1]</name>
                                                                                                            <stringValue id="90">MaxRowsToDelete</stringValue>
                                                                                                            <type>VARIABLE</type>
                                                                                                        </item>
                                                                                                        <item id="91" type="com.j2fe.workflow.definition.Parameter">
                                                                                                            <input>true</input>
                                                                                                            <name id="92">querySQL</name>
                                                                                                            <stringValue id="93">DELETE FROM gc_own.FT_T_PBAT&#13;
WHERE (PUB_AUDIT_ID || '/' || PUB_SQ_NUM) IN (&#13;
  SELECT PUB_AUDIT_ID || '/' || PUB_SQ_NUM&#13;
  FROM gc_own.FT_T_PBAT&#13;
  WHERE LAST_CHG_TMS &lt;= sysdate() - make_interval(days =&gt; ?)&#13;
  LIMIT ?&#13;
)</stringValue>
                                                                                                            <type>CONSTANT</type>
                                                                                                        </item>
                                                                                                    </parameters>
                                                                                                    <sources id="94" type="java.util.HashSet">
                                                                                                        <item id="95" type="com.j2fe.workflow.definition.Transition">
                                                                                                            <name id="96">goto-next</name>
                                                                                                            <source id="97">
                                                                                                                <activation>INVOKE</activation>
                                                                                                                <clusteredCall>false</clusteredCall>
                                                                                                                <description idref="3"/>
                                                                                                                <directJoin>false</directJoin>
                                                                                                                <name id="98">Log Events in Orchestrator Log</name>
                                                                                                                <nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
                                                                                                                <nodeHandlerClass id="99">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
                                                                                                                <parameters id="100" type="java.util.HashSet">
                                                                                                                    <item id="101" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                        <input>true</input>
                                                                                                                        <name id="102">statements</name>
                                                                                                                        <stringValue id="103">import org.apache.log4j.Logger;&#13;
Logger logger = Logger.getLogger("PurgeMhiTables");&#13;
logger.info("Purge FT_T_PBDP Completed");&#13;
logger.info("Purge FT_T_PBAT Started...");&#13;
</stringValue>
                                                                                                                        <type>CONSTANT</type>
                                                                                                                    </item>
                                                                                                                </parameters>
                                                                                                                <sources id="104" type="java.util.HashSet">
                                                                                                                    <item id="105" type="com.j2fe.workflow.definition.Transition">
                                                                                                                        <name id="106">goto-next</name>
                                                                                                                        <source id="107">
                                                                                                                            <activation>INVOKE</activation>
                                                                                                                            <clusteredCall>false</clusteredCall>
                                                                                                                            <description idref="3"/>
                                                                                                                            <directJoin>false</directJoin>
                                                                                                                            <name id="108">Log Events in DB</name>
                                                                                                                            <nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
                                                                                                                            <nodeHandlerClass id="109">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
                                                                                                                            <parameters id="110" type="java.util.HashSet">
                                                                                                                                <item id="111" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="112">database</name>
                                                                                                                                    <stringValue id="113">jdbc/GSDM-1</stringValue>
                                                                                                                                    <type>REFERENCE</type>
                                                                                                                                </item>
                                                                                                                                <item id="114" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="115">querySQL</name>
                                                                                                                                    <stringValue id="116">call&#13;
 mhi_sp_eventlog (&#13;
	  'PurgeMhiTables Workflow',&#13;
	  'PurgeMhiTables Workflow',&#13;
	  'Purge FT_T_PBDP Completed'&#13;
	); &#13;
 call mhi_sp_eventlog (&#13;
	  'PurgeMhiTables Workflow',&#13;
	  'PurgeMhiTables Workflow',&#13;
	  'Purge FT_T_PBAT Started'&#13;
	); </stringValue>
                                                                                                                                    <type>CONSTANT</type>
                                                                                                                                </item>
                                                                                                                            </parameters>
                                                                                                                            <sources id="117" type="java.util.HashSet">
                                                                                                                                <item id="118" type="com.j2fe.workflow.definition.Transition">
                                                                                                                                    <name id="119">goto-next</name>
                                                                                                                                    <source id="120">
                                                                                                                                        <activation>TRANSACTIONAL</activation>
                                                                                                                                        <clusteredCall>false</clusteredCall>
                                                                                                                                        <description idref="3"/>
                                                                                                                                        <directJoin>false</directJoin>
                                                                                                                                        <name id="121">FT_T_PBDP</name>
                                                                                                                                        <nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
                                                                                                                                        <nodeHandlerClass id="122">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
                                                                                                                                        <parameters id="123" type="java.util.HashSet">
                                                                                                                                            <item id="124" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                                <input>true</input>
                                                                                                                                                <name id="125">database</name>
                                                                                                                                                <stringValue id="126">jdbc/GSDM-1</stringValue>
                                                                                                                                                <type>REFERENCE</type>
                                                                                                                                            </item>
                                                                                                                                            <item id="127" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                                <UITypeHint id="128">[0]@java/lang/Integer@</UITypeHint>
                                                                                                                                                <input>true</input>
                                                                                                                                                <name id="129">indexedParameters[0]</name>
                                                                                                                                                <stringValue id="130">DaysToKeep</stringValue>
                                                                                                                                                <type>VARIABLE</type>
                                                                                                                                            </item>
                                                                                                                                            <item id="131" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                                <input>true</input>
                                                                                                                                                <name id="132">indexedParameters[1]</name>
                                                                                                                                                <stringValue id="133">MaxRowsToDelete</stringValue>
                                                                                                                                                <type>VARIABLE</type>
                                                                                                                                            </item>
                                                                                                                                            <item id="134" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                                <input>true</input>
                                                                                                                                                <name id="135">querySQL</name>
                                                                                                                                                <stringValue id="136">DELETE FROM gc_own.FT_T_PBAT&#13;
WHERE PUB_AUDIT_ID || '/' || PUB_SQ_NUM IN (&#13;
  SELECT PUB_AUDIT_ID || '/' || PUB_SQ_NUM&#13;
  FROM gc_own.FT_T_PBAT&#13;
  WHERE LAST_CHG_TMS &lt;= sysdate() - make_interval(days =&gt; ?)&#13;
  LIMIT ?&#13;
);</stringValue>
                                                                                                                                                <type>CONSTANT</type>
                                                                                                                                            </item>
                                                                                                                                        </parameters>
                                                                                                                                        <sources id="137" type="java.util.HashSet">
                                                                                                                                            <item id="138" type="com.j2fe.workflow.definition.Transition">
                                                                                                                                                <name id="139">goto-next</name>
                                                                                                                                                <source id="140">
                                                                                                                                                    <activation>INVOKE</activation>
                                                                                                                                                    <clusteredCall>false</clusteredCall>
                                                                                                                                                    <description idref="3"/>
                                                                                                                                                    <directJoin>false</directJoin>
                                                                                                                                                    <name id="141">Log Events in Orchestrator Log</name>
                                                                                                                                                    <nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
                                                                                                                                                    <nodeHandlerClass id="142">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
                                                                                                                                                    <parameters id="143" type="java.util.HashSet">
                                                                                                                                                        <item id="144" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                                            <input>true</input>
                                                                                                                                                            <name id="145">statements</name>
                                                                                                                                                            <stringValue id="146">import org.apache.log4j.Logger;&#13;
Logger logger = Logger.getLogger("PurgeMhiTables");&#13;
logger.info("Purge MHI_TB_EVENTLOG Completed");&#13;
logger.info("Purge FT_T_PBDP Started...");</stringValue>
                                                                                                                                                            <type>CONSTANT</type>
                                                                                                                                                        </item>
                                                                                                                                                    </parameters>
                                                                                                                                                    <sources id="147" type="java.util.HashSet">
                                                                                                                                                        <item id="148" type="com.j2fe.workflow.definition.Transition">
                                                                                                                                                            <name id="149">goto-next</name>
                                                                                                                                                            <source id="150">
                                                                                                                                                                <activation>INVOKE</activation>
                                                                                                                                                                <clusteredCall>false</clusteredCall>
                                                                                                                                                                <description idref="3"/>
                                                                                                                                                                <directJoin>false</directJoin>
                                                                                                                                                                <name id="151">Log Events in DB</name>
                                                                                                                                                                <nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
                                                                                                                                                                <nodeHandlerClass id="152">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
                                                                                                                                                                <parameters id="153" type="java.util.HashSet">
                                                                                                                                                                    <item id="154" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                                                        <input>true</input>
                                                                                                                                                                        <name id="155">database</name>
                                                                                                                                                                        <stringValue id="156">jdbc/GSDM-1</stringValue>
                                                                                                                                                                        <type>REFERENCE</type>
                                                                                                                                                                    </item>
                                                                                                                                                                    <item id="157" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                                                        <input>true</input>
                                                                                                                                                                        <name id="158">querySQL</name>
                                                                                                                                                                        <stringValue id="159">call&#13;
 mhi_sp_eventlog (&#13;
	  'PurgeMhiTables Workflow',&#13;
	  'PurgeMhiTables Workflow',&#13;
	  'Purge MHI_TB_EVENTLOG Completed'&#13;
	); &#13;
call mhi_sp_eventlog (&#13;
	  'PurgeMhiTables Workflow',&#13;
	  'PurgeMhiTables Workflow',&#13;
	  'Purge FT_T_PBDP Started'&#13;
	);</stringValue>
                                                                                                                                                                        <type>CONSTANT</type>
                                                                                                                                                                    </item>
                                                                                                                                                                </parameters>
                                                                                                                                                                <sources id="160" type="java.util.HashSet">
                                                                                                                                                                    <item id="161" type="com.j2fe.workflow.definition.Transition">
                                                                                                                                                                        <name id="162">goto-next</name>
                                                                                                                                                                        <source id="163">
                                                                                                                                                                            <activation>TRANSACTIONAL</activation>
                                                                                                                                                                            <clusteredCall>false</clusteredCall>
                                                                                                                                                                            <description idref="3"/>
                                                                                                                                                                            <directJoin>false</directJoin>
                                                                                                                                                                            <name id="164">MHI_TB_EVENTLOG</name>
                                                                                                                                                                            <nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
                                                                                                                                                                            <nodeHandlerClass id="165">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
                                                                                                                                                                            <parameters id="166" type="java.util.HashSet">
                                                                                                                                                                                <item id="167" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                                                                    <input>true</input>
                                                                                                                                                                                    <name id="168">database</name>
                                                                                                                                                                                    <stringValue id="169">jdbc/GSDM-1</stringValue>
                                                                                                                                                                                    <type>REFERENCE</type>
                                                                                                                                                                                </item>
                                                                                                                                                                                <item id="170" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                                                                    <UITypeHint id="171">[0]@java/lang/Integer@</UITypeHint>
                                                                                                                                                                                    <input>true</input>
                                                                                                                                                                                    <name id="172">indexedParameters[0]</name>
                                                                                                                                                                                    <stringValue id="173">DaysToKeep</stringValue>
                                                                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                                                                </item>
                                                                                                                                                                                <item id="174" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                                                                    <input>true</input>
                                                                                                                                                                                    <name id="175">indexedParameters[1]</name>
                                                                                                                                                                                    <stringValue id="176">MaxRowsToDelete</stringValue>
                                                                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                                                                </item>
                                                                                                                                                                                <item id="177" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                                                                    <input>true</input>
                                                                                                                                                                                    <name id="178">querySQL</name>
                                                                                                                                                                                    <stringValue id="179">DELETE FROM GC_OWN.MHI_TB_EVENTLOG&#13;
WHERE ctid IN (&#13;
  SELECT ctid FROM GC_OWN.MHI_TB_EVENTLOG&#13;
  WHERE EVENT_TMS &lt; sysdate()- make_interval(days =&gt; ?)&#13;
  LIMIT ?&#13;
)</stringValue>
                                                                                                                                                                                    <type>CONSTANT</type>
                                                                                                                                                                                </item>
                                                                                                                                                                            </parameters>
                                                                                                                                                                            <sources id="180" type="java.util.HashSet">
                                                                                                                                                                                <item id="181" type="com.j2fe.workflow.definition.Transition">
                                                                                                                                                                                    <name id="182">goto-next</name>
                                                                                                                                                                                    <source id="183">
                                                                                                                                                                                        <activation>INVOKE</activation>
                                                                                                                                                                                        <clusteredCall>false</clusteredCall>
                                                                                                                                                                                        <description idref="3"/>
                                                                                                                                                                                        <directJoin>false</directJoin>
                                                                                                                                                                                        <name id="184">Log Events in Orchestrator Log</name>
                                                                                                                                                                                        <nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
                                                                                                                                                                                        <nodeHandlerClass id="185">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
                                                                                                                                                                                        <parameters id="186" type="java.util.HashSet">
                                                                                                                                                                                            <item id="187" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                                                                                <input>true</input>
                                                                                                                                                                                                <name id="188">statements</name>
                                                                                                                                                                                                <stringValue id="189">import org.apache.log4j.Logger;&#13;
Logger logger = Logger.getLogger("PurgeMhiTables");&#13;
logger.info("******PurgeMhiTables Workflow STARTED******");&#13;
logger.info("Purge MHI_TB_EVENTLOG Started...");</stringValue>
                                                                                                                                                                                                <type>CONSTANT</type>
                                                                                                                                                                                            </item>
                                                                                                                                                                                        </parameters>
                                                                                                                                                                                        <sources id="190" type="java.util.HashSet">
                                                                                                                                                                                            <item id="191" type="com.j2fe.workflow.definition.Transition">
                                                                                                                                                                                                <name id="192">goto-next</name>
                                                                                                                                                                                                <source id="193">
                                                                                                                                                                                                    <activation>INVOKE</activation>
                                                                                                                                                                                                    <clusteredCall>false</clusteredCall>
                                                                                                                                                                                                    <description idref="3"/>
                                                                                                                                                                                                    <directJoin>false</directJoin>
                                                                                                                                                                                                    <name id="194">Log Events in DB</name>
                                                                                                                                                                                                    <nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
                                                                                                                                                                                                    <nodeHandlerClass id="195">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
                                                                                                                                                                                                    <parameters id="196" type="java.util.HashSet">
                                                                                                                                                                                                        <item id="197" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                                                                                            <input>true</input>
                                                                                                                                                                                                            <name id="198">database</name>
                                                                                                                                                                                                            <stringValue id="199">jdbc/GSDM-1</stringValue>
                                                                                                                                                                                                            <type>REFERENCE</type>
                                                                                                                                                                                                        </item>
                                                                                                                                                                                                        <item id="200" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                                                                                            <input>true</input>
                                                                                                                                                                                                            <name id="201">querySQL</name>
                                                                                                                                                                                                            <stringValue id="202">call &#13;
 mhi_sp_eventlog (&#13;
	  'PurgeMhiTables Workflow',&#13;
	  'PurgeMhiTables Workflow',&#13;
	  '***STARTED***' &#13;
	); &#13;
 call mhi_sp_eventlog (&#13;
	  'PurgeMhiTables Workflow',&#13;
	  'PurgeMhiTables Workflow',&#13;
	  'Purge MHI_TB_EVENTLOG Started' &#13;
	);</stringValue>
                                                                                                                                                                                                            <type>CONSTANT</type>
                                                                                                                                                                                                        </item>
                                                                                                                                                                                                    </parameters>
                                                                                                                                                                                                    <sources id="203" type="java.util.HashSet">
                                                                                                                                                                                                        <item id="204" type="com.j2fe.workflow.definition.Transition">
                                                                                                                                                                                                            <name id="205">goto-next</name>
                                                                                                                                                                                                            <source id="206">
                                                                                                                                                                                                                <activation>INVOKE</activation>
                                                                                                                                                                                                                <clusteredCall>false</clusteredCall>
                                                                                                                                                                                                                <description idref="3"/>
                                                                                                                                                                                                                <directJoin>false</directJoin>
                                                                                                                                                                                                                <name id="207">Start</name>
                                                                                                                                                                                                                <nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
                                                                                                                                                                                                                <nodeHandlerClass id="208">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
                                                                                                                                                                                                                <sources id="209" type="java.util.HashSet"/>
                                                                                                                                                                                                                <targets id="210" type="java.util.HashSet">
                                                                                                                                                                                                                    <item idref="204" type="com.j2fe.workflow.definition.Transition"/>
                                                                                                                                                                                                                </targets>
                                                                                                                                                                                                                <type>START</type>
                                                                                                                                                                                                            </source>
                                                                                                                                                                                                            <target idref="193"/>
                                                                                                                                                                                                        </item>
                                                                                                                                                                                                    </sources>
                                                                                                                                                                                                    <targets id="211" type="java.util.HashSet">
                                                                                                                                                                                                        <item idref="191" type="com.j2fe.workflow.definition.Transition"/>
                                                                                                                                                                                                    </targets>
                                                                                                                                                                                                    <type>ACTIVITY</type>
                                                                                                                                                                                                </source>
                                                                                                                                                                                                <target idref="183"/>
                                                                                                                                                                                            </item>
                                                                                                                                                                                        </sources>
                                                                                                                                                                                        <targets id="212" type="java.util.HashSet">
                                                                                                                                                                                            <item idref="181" type="com.j2fe.workflow.definition.Transition"/>
                                                                                                                                                                                        </targets>
                                                                                                                                                                                        <type>ACTIVITY</type>
                                                                                                                                                                                    </source>
                                                                                                                                                                                    <target idref="163"/>
                                                                                                                                                                                </item>
                                                                                                                                                                            </sources>
                                                                                                                                                                            <targets id="213" type="java.util.HashSet">
                                                                                                                                                                                <item idref="161" type="com.j2fe.workflow.definition.Transition"/>
                                                                                                                                                                            </targets>
                                                                                                                                                                            <type>ACTIVITY</type>
                                                                                                                                                                        </source>
                                                                                                                                                                        <target idref="150"/>
                                                                                                                                                                    </item>
                                                                                                                                                                </sources>
                                                                                                                                                                <targets id="214" type="java.util.HashSet">
                                                                                                                                                                    <item idref="148" type="com.j2fe.workflow.definition.Transition"/>
                                                                                                                                                                </targets>
                                                                                                                                                                <type>ACTIVITY</type>
                                                                                                                                                            </source>
                                                                                                                                                            <target idref="140"/>
                                                                                                                                                        </item>
                                                                                                                                                    </sources>
                                                                                                                                                    <targets id="215" type="java.util.HashSet">
                                                                                                                                                        <item idref="138" type="com.j2fe.workflow.definition.Transition"/>
                                                                                                                                                    </targets>
                                                                                                                                                    <type>ACTIVITY</type>
                                                                                                                                                </source>
                                                                                                                                                <target idref="120"/>
                                                                                                                                            </item>
                                                                                                                                        </sources>
                                                                                                                                        <targets id="216" type="java.util.HashSet">
                                                                                                                                            <item idref="118" type="com.j2fe.workflow.definition.Transition"/>
                                                                                                                                        </targets>
                                                                                                                                        <type>ACTIVITY</type>
                                                                                                                                    </source>
                                                                                                                                    <target idref="107"/>
                                                                                                                                </item>
                                                                                                                            </sources>
                                                                                                                            <targets id="217" type="java.util.HashSet">
                                                                                                                                <item idref="105" type="com.j2fe.workflow.definition.Transition"/>
                                                                                                                            </targets>
                                                                                                                            <type>ACTIVITY</type>
                                                                                                                        </source>
                                                                                                                        <target idref="97"/>
                                                                                                                    </item>
                                                                                                                </sources>
                                                                                                                <targets id="218" type="java.util.HashSet">
                                                                                                                    <item idref="95" type="com.j2fe.workflow.definition.Transition"/>
                                                                                                                </targets>
                                                                                                                <type>ACTIVITY</type>
                                                                                                            </source>
                                                                                                            <target idref="77"/>
                                                                                                        </item>
                                                                                                    </sources>
                                                                                                    <targets id="219" type="java.util.HashSet">
                                                                                                        <item idref="75" type="com.j2fe.workflow.definition.Transition"/>
                                                                                                    </targets>
                                                                                                    <type>ACTIVITY</type>
                                                                                                </source>
                                                                                                <target idref="64"/>
                                                                                            </item>
                                                                                        </sources>
                                                                                        <targets id="220" type="java.util.HashSet">
                                                                                            <item idref="62" type="com.j2fe.workflow.definition.Transition"/>
                                                                                        </targets>
                                                                                        <type>ACTIVITY</type>
                                                                                    </source>
                                                                                    <target idref="54"/>
                                                                                </item>
                                                                            </sources>
                                                                            <targets id="221" type="java.util.HashSet">
                                                                                <item idref="52" type="com.j2fe.workflow.definition.Transition"/>
                                                                            </targets>
                                                                            <type>ACTIVITY</type>
                                                                        </source>
                                                                        <target idref="48"/>
                                                                    </item>
                                                                </sources>
                                                                <targets id="222" type="java.util.HashSet">
                                                                    <item idref="46" type="com.j2fe.workflow.definition.Transition"/>
                                                                </targets>
                                                                <type>ACTIVITY</type>
                                                            </source>
                                                            <target idref="35"/>
                                                        </item>
                                                    </sources>
                                                    <targets id="223" type="java.util.HashSet">
                                                        <item idref="33" type="com.j2fe.workflow.definition.Transition"/>
                                                    </targets>
                                                    <type>ACTIVITY</type>
                                                </source>
                                                <target idref="22"/>
                                            </item>
                                        </sources>
                                        <targets id="224" type="java.util.HashSet">
                                            <item idref="20" type="com.j2fe.workflow.definition.Transition"/>
                                        </targets>
                                        <type>ACTIVITY</type>
                                    </source>
                                    <target idref="9"/>
                                </item>
                            </sources>
                            <targets id="225" type="java.util.HashSet">
                                <item idref="7" type="com.j2fe.workflow.definition.Transition"/>
                            </targets>
                            <type>ACTIVITY</type>
                        </source>
                        <target idref="2"/>
                    </item>
                </sources>
                <targets id="226" type="java.util.HashSet"/>
                <type>END</type>
            </endNode>
            <forcePurgeAtEnd>false</forcePurgeAtEnd>
            <group id="227">Mizuho/Purge</group>
            <haltOnError>false</haltOnError>
            <lastChangeUser id="228">user1</lastChangeUser>
            <lastUpdate id="229">2025-06-11T12:33:27.000+0000</lastUpdate>
            <name id="230">PurgeMhiTables</name>
            <nodes id="231" type="java.util.HashSet">
                <item idref="77" type="com.j2fe.workflow.definition.Node"/>
                <item idref="120" type="com.j2fe.workflow.definition.Node"/>
                <item idref="64" type="com.j2fe.workflow.definition.Node"/>
                <item idref="107" type="com.j2fe.workflow.definition.Node"/>
                <item idref="150" type="com.j2fe.workflow.definition.Node"/>
                <item idref="193" type="com.j2fe.workflow.definition.Node"/>
                <item idref="54" type="com.j2fe.workflow.definition.Node"/>
                <item idref="140" type="com.j2fe.workflow.definition.Node"/>
                <item idref="97" type="com.j2fe.workflow.definition.Node"/>
                <item idref="183" type="com.j2fe.workflow.definition.Node"/>
                <item idref="163" type="com.j2fe.workflow.definition.Node"/>
                <item idref="9" type="com.j2fe.workflow.definition.Node"/>
                <item idref="22" type="com.j2fe.workflow.definition.Node"/>
                <item idref="35" type="com.j2fe.workflow.definition.Node"/>
                <item idref="206" type="com.j2fe.workflow.definition.Node"/>
                <item idref="48" type="com.j2fe.workflow.definition.Node"/>
                <item idref="2" type="com.j2fe.workflow.definition.Node"/>
            </nodes>
            <optimize>false</optimize>
            <parameter id="232" type="java.util.HashMap">
                <entry>
                    <key id="233" type="java.lang.String">DaysToKeep</key>
                    <value id="234" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="235">java.lang.Integer</className>
                        <clazz>java.lang.Integer</clazz>
                        <input>true</input>
                        <output>false</output>
                        <required>false</required>
                    </value>
                </entry>
                <entry>
                    <key id="236" type="java.lang.String">MaxRowsToDelete</key>
                    <value id="237" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="238">java.lang.Integer</className>
                        <clazz>java.lang.Integer</clazz>
                        <input>true</input>
                        <output>false</output>
                        <required>true</required>
                    </value>
                </entry>
            </parameter>
            <permissions id="239" type="java.util.HashSet"/>
            <priority>50</priority>
            <purgeAtEnd>false</purgeAtEnd>
            <retries>0</retries>
            <startNode idref="206"/>
            <status>RELEASED</status>
            <variables id="240" type="java.util.HashMap">
                <entry>
                    <key id="241" type="java.lang.String">DaysToKeep</key>
                    <value id="242" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="243">java.lang.Integer</className>
                        <clazz>java.lang.Integer</clazz>
                        <persistent>false</persistent>
                        <value id="244" type="java.lang.Integer">730</value>
                    </value>
                </entry>
                <entry>
                    <key id="245" type="java.lang.String">FT_T_PBAT</key>
                    <value id="246" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="247">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <persistent>true</persistent>
                        <value id="248" type="java.lang.String">FT_T_PBAT</value>
                    </value>
                </entry>
                <entry>
                    <key id="249" type="java.lang.String">FT_T_PBDP</key>
                    <value id="250" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="251">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <persistent>true</persistent>
                        <value id="252" type="java.lang.String">FT_T_PBDP</value>
                    </value>
                </entry>
                <entry>
                    <key id="253" type="java.lang.String">MHI_TB_EVENTLOG</key>
                    <value id="254" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="255">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <persistent>true</persistent>
                        <value id="256" type="java.lang.String">MHI_TB_EVENTLOG</value>
                    </value>
                </entry>
                <entry>
                    <key id="257" type="java.lang.String">MaxRowsToDelete</key>
                    <value id="258" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="259">java.lang.Integer</className>
                        <clazz>java.lang.Integer</clazz>
                        <persistent>true</persistent>
                        <value id="260" type="java.lang.Integer">100000</value>
                    </value>
                </entry>
            </variables>
            <version>4</version>
        </com.j2fe.workflow.definition.Workflow>
    </businessobject>
</goldensource-package>
