<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<goldensource-package version="10.0.0.02">
    <package-comment/>
    <businessobject displayString="4 - V-10 Modified For Each Split Activity" type="com.j2fe.workflow.definition.Workflow">
        <com.j2fe.workflow.definition.Workflow id="0">
            <alwaysPersist>true</alwaysPersist>
            <clustered>false</clustered>
            <comment id="1">V-10 Modified For Each Split Activity</comment>
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
                            <directJoin>true</directJoin>
                            <name id="10">Synchronize</name>
                            <nodeHandler>com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandler>
                            <nodeHandlerClass id="11">com.j2fe.workflow.handler.impl.StandardAndJoinHandler</nodeHandlerClass>
                            <sources id="12" type="java.util.HashSet">
                                <item id="13" type="com.j2fe.workflow.definition.Transition">
                                    <name id="14">goto-next</name>
                                    <source id="15">
                                        <activation>INVOKE</activation>
                                        <clusteredCall>false</clusteredCall>
                                        <description idref="3"/>
                                        <directJoin>false</directJoin>
                                        <name id="16">merge</name>
                                        <nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
                                        <nodeHandlerClass id="17">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
                                        <sources id="18" type="java.util.HashSet">
                                            <item id="19" type="com.j2fe.workflow.definition.Transition">
                                                <name id="20">goto-next</name>
                                                <source id="21">
                                                    <activation>INVOKE</activation>
                                                    <clusteredCall>false</clusteredCall>
                                                    <description idref="3"/>
                                                    <directJoin>false</directJoin>
                                                    <name id="22">Purge Archived Files</name>
                                                    <nodeHandler>com.j2fe.general.activities.CommandLine</nodeHandler>
                                                    <nodeHandlerClass id="23">com.j2fe.general.activities.CommandLine</nodeHandlerClass>
                                                    <parameters id="24" type="java.util.HashSet">
                                                        <item id="25" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="26">commandLine</name>
                                                            <stringValue id="27">purgeArchivedFilesScript</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                        <item id="28" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>false</input>
                                                            <name id="29">id</name>
                                                            <stringValue id="30">UniqueProcessId</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                        <item id="31" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="32">killTimeout</name>
                                                            <stringValue id="33">KillTimeoutSecs</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                        <item id="34" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="35">logDirectory</name>
                                                            <stringValue id="36">tmpDirPath</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                        <item id="37" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>false</input>
                                                            <name id="38">logFile</name>
                                                            <stringValue id="39">LogFile</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                        <item id="40" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>false</input>
                                                            <name id="41">pid</name>
                                                            <stringValue id="42">ProcessID</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                        <item id="43" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>false</input>
                                                            <name id="44">returnCode</name>
                                                            <stringValue id="45">ReturnCode</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                        <item id="46" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>false</input>
                                                            <name id="47">returnCodeMeaning</name>
                                                            <stringValue id="48">UNIXReturnCodeMeaning</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                        <item id="49" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>false</input>
                                                            <name id="50">timeoutShutdown</name>
                                                            <stringValue id="51">TimedOut</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                        <item id="52" type="com.j2fe.workflow.definition.Parameter">
                                                            <input>true</input>
                                                            <name id="53">waitForEnd</name>
                                                            <stringValue id="54">PurgeWaitForEnd</stringValue>
                                                            <type>VARIABLE</type>
                                                        </item>
                                                    </parameters>
                                                    <sources id="55" type="java.util.HashSet">
                                                        <item id="56" type="com.j2fe.workflow.definition.Transition">
                                                            <name id="57">goto-next</name>
                                                            <source id="58">
                                                                <activation>INVOKE</activation>
                                                                <clusteredCall>false</clusteredCall>
                                                                <description idref="3"/>
                                                                <directJoin>false</directJoin>
                                                                <name id="59">Archive Files</name>
                                                                <nodeHandler>com.j2fe.general.activities.CommandLine</nodeHandler>
                                                                <nodeHandlerClass id="60">com.j2fe.general.activities.CommandLine</nodeHandlerClass>
                                                                <parameters id="61" type="java.util.HashSet">
                                                                    <item id="62" type="com.j2fe.workflow.definition.Parameter">
                                                                        <input>true</input>
                                                                        <name id="63">commandLine</name>
                                                                        <stringValue id="64">archiveScript</stringValue>
                                                                        <type>VARIABLE</type>
                                                                    </item>
                                                                    <item id="65" type="com.j2fe.workflow.definition.Parameter">
                                                                        <input>false</input>
                                                                        <name id="66">id</name>
                                                                        <stringValue id="67">UniqueProcessId</stringValue>
                                                                        <type>VARIABLE</type>
                                                                    </item>
                                                                    <item id="68" type="com.j2fe.workflow.definition.Parameter">
                                                                        <input>true</input>
                                                                        <name id="69">killTimeout</name>
                                                                        <stringValue id="70">KillTimeoutSecs</stringValue>
                                                                        <type>VARIABLE</type>
                                                                    </item>
                                                                    <item id="71" type="com.j2fe.workflow.definition.Parameter">
                                                                        <input>true</input>
                                                                        <name id="72">logDirectory</name>
                                                                        <stringValue id="73">tmpDirPath</stringValue>
                                                                        <type>VARIABLE</type>
                                                                    </item>
                                                                    <item id="74" type="com.j2fe.workflow.definition.Parameter">
                                                                        <input>false</input>
                                                                        <name id="75">logFile</name>
                                                                        <stringValue id="76">LogFile</stringValue>
                                                                        <type>VARIABLE</type>
                                                                    </item>
                                                                    <item id="77" type="com.j2fe.workflow.definition.Parameter">
                                                                        <input>false</input>
                                                                        <name id="78">pid</name>
                                                                        <stringValue id="79">ProcessID</stringValue>
                                                                        <type>VARIABLE</type>
                                                                    </item>
                                                                    <item id="80" type="com.j2fe.workflow.definition.Parameter">
                                                                        <input>false</input>
                                                                        <name id="81">returnCode</name>
                                                                        <stringValue id="82">ReturnCode</stringValue>
                                                                        <type>VARIABLE</type>
                                                                    </item>
                                                                    <item id="83" type="com.j2fe.workflow.definition.Parameter">
                                                                        <input>false</input>
                                                                        <name id="84">returnCodeMeaning</name>
                                                                        <stringValue id="85">UNIXReturnCodeMeaning</stringValue>
                                                                        <type>VARIABLE</type>
                                                                    </item>
                                                                    <item id="86" type="com.j2fe.workflow.definition.Parameter">
                                                                        <input>false</input>
                                                                        <name id="87">timeoutShutdown</name>
                                                                        <stringValue id="88">TimedOut</stringValue>
                                                                        <type>VARIABLE</type>
                                                                    </item>
                                                                    <item id="89" type="com.j2fe.workflow.definition.Parameter">
                                                                        <input>true</input>
                                                                        <name id="90">waitForEnd</name>
                                                                        <stringValue id="91">ArchiveWaitForEnd</stringValue>
                                                                        <type>VARIABLE</type>
                                                                    </item>
                                                                </parameters>
                                                                <sources id="92" type="java.util.HashSet">
                                                                    <item id="93" type="com.j2fe.workflow.definition.Transition">
                                                                        <name id="94">goto-next</name>
                                                                        <source id="95">
                                                                            <activation>INVOKE</activation>
                                                                            <clusteredCall>false</clusteredCall>
                                                                            <description idref="3"/>
                                                                            <directJoin>false</directJoin>
                                                                            <name id="96">Build Archive Script</name>
                                                                            <nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
                                                                            <nodeHandlerClass id="97">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
                                                                            <parameters id="98" type="java.util.HashSet">
                                                                                <item id="99" type="com.j2fe.workflow.definition.Parameter">
                                                                                    <input>true</input>
                                                                                    <name id="100">statements</name>
                                                                                    <stringValue id="101">String archiveFileName = "archive_"+vendorName+"_"+filePattern+"_$(date +%Y%m%d%H%M%S).tar.gz";&#13;
String purgeArchivedFilesScript = "find " + updFilesystemDirPath + "/" + filePattern + " -mtime +" + archiveThresholdDays + " -exec rm {} \\;";&#13;
String archiveScript = "find " + updFilesystemDirPath + "/" + filePattern + " -maxdepth 1 -mtime +" + archiveThresholdDays + " -type f | xargs tar -zcvf " + updFilesystemDirPath + "/" + archiveFileName ;</stringValue>
                                                                                    <type>CONSTANT</type>
                                                                                </item>
                                                                                <item id="102" type="com.j2fe.workflow.definition.Parameter">
                                                                                    <input>false</input>
                                                                                    <name id="103">variables["archiveFileName"]</name>
                                                                                    <stringValue id="104">archiveFileName</stringValue>
                                                                                    <type>VARIABLE</type>
                                                                                </item>
                                                                                <item id="105" type="com.j2fe.workflow.definition.Parameter">
                                                                                    <input>false</input>
                                                                                    <name id="106">variables["archiveScript"]</name>
                                                                                    <stringValue id="107">archiveScript</stringValue>
                                                                                    <type>VARIABLE</type>
                                                                                </item>
                                                                                <item id="108" type="com.j2fe.workflow.definition.Parameter">
                                                                                    <input>true</input>
                                                                                    <name id="109">variables["archiveThresholdDays"]</name>
                                                                                    <stringValue id="110">ArchiveThresholdDays</stringValue>
                                                                                    <type>VARIABLE</type>
                                                                                </item>
                                                                                <item id="111" type="com.j2fe.workflow.definition.Parameter">
                                                                                    <input>true</input>
                                                                                    <name id="112">variables["filePattern"]</name>
                                                                                    <stringValue id="113">FilePattern</stringValue>
                                                                                    <type>VARIABLE</type>
                                                                                </item>
                                                                                <item id="114" type="com.j2fe.workflow.definition.Parameter">
                                                                                    <input>false</input>
                                                                                    <name id="115">variables["purgeArchivedFilesScript"]</name>
                                                                                    <stringValue id="116">purgeArchivedFilesScript</stringValue>
                                                                                    <type>VARIABLE</type>
                                                                                </item>
                                                                                <item id="117" type="com.j2fe.workflow.definition.Parameter">
                                                                                    <input>true</input>
                                                                                    <name id="118">variables["updFilesystemDirPath"]</name>
                                                                                    <stringValue id="119">updFilesystemDirPath</stringValue>
                                                                                    <type>VARIABLE</type>
                                                                                </item>
                                                                                <item id="120" type="com.j2fe.workflow.definition.Parameter">
                                                                                    <input>true</input>
                                                                                    <name id="121">variables["vendorName"]</name>
                                                                                    <stringValue id="122">VendorName</stringValue>
                                                                                    <type>VARIABLE</type>
                                                                                </item>
                                                                            </parameters>
                                                                            <sources id="123" type="java.util.HashSet">
                                                                                <item id="124" type="com.j2fe.workflow.definition.Transition">
                                                                                    <name id="125">Y</name>
                                                                                    <source id="126">
                                                                                        <activation>INVOKE</activation>
                                                                                        <clusteredCall>false</clusteredCall>
                                                                                        <description idref="3"/>
                                                                                        <directJoin>false</directJoin>
                                                                                        <name id="127">Archive Files ?</name>
                                                                                        <nodeHandler>com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandler>
                                                                                        <nodeHandlerClass id="128">com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandlerClass>
                                                                                        <parameters id="129" type="java.util.HashSet">
                                                                                            <item id="130" type="com.j2fe.workflow.definition.Parameter">
                                                                                                <input>true</input>
                                                                                                <name id="131">caseInsensitive</name>
                                                                                                <objectValue id="132" type="java.lang.Boolean">true</objectValue>
                                                                                                <type>CONSTANT</type>
                                                                                            </item>
                                                                                            <item id="133" type="com.j2fe.workflow.definition.Parameter">
                                                                                                <input>true</input>
                                                                                                <name id="134">caseItem</name>
                                                                                                <stringValue id="135">ArchiveFlag</stringValue>
                                                                                                <type>VARIABLE</type>
                                                                                            </item>
                                                                                            <item id="136" type="com.j2fe.workflow.definition.Parameter">
                                                                                                <input>true</input>
                                                                                                <name id="137">defaultItem</name>
                                                                                                <stringValue id="138">N</stringValue>
                                                                                                <type>CONSTANT</type>
                                                                                            </item>
                                                                                            <item id="139" type="com.j2fe.workflow.definition.Parameter">
                                                                                                <input>true</input>
                                                                                                <name id="140">nullTransition</name>
                                                                                                <stringValue id="141">N</stringValue>
                                                                                                <type>CONSTANT</type>
                                                                                            </item>
                                                                                            <item id="142" type="com.j2fe.workflow.definition.Parameter">
                                                                                                <input>true</input>
                                                                                                <name id="143">trimSpaces</name>
                                                                                                <objectValue idref="132"/>
                                                                                                <type>CONSTANT</type>
                                                                                            </item>
                                                                                        </parameters>
                                                                                        <sources id="144" type="java.util.HashSet">
                                                                                            <item id="145" type="com.j2fe.workflow.definition.Transition">
                                                                                                <name id="146">goto-next</name>
                                                                                                <source id="147">
                                                                                                    <activation>INVOKE</activation>
                                                                                                    <clusteredCall>false</clusteredCall>
                                                                                                    <description idref="3"/>
                                                                                                    <directJoin>false</directJoin>
                                                                                                    <name id="148">update FilesystemDirPath</name>
                                                                                                    <nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
                                                                                                    <nodeHandlerClass id="149">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
                                                                                                    <parameters id="150" type="java.util.HashSet">
                                                                                                        <item id="151" type="com.j2fe.workflow.definition.Parameter">
                                                                                                            <input>true</input>
                                                                                                            <name id="152">statements</name>
                                                                                                            <stringValue id="153">String updFilesystemDirPath = filesystemDirPath.replace("${gs.bin.path}", gsBinPath);</stringValue>
                                                                                                            <type>CONSTANT</type>
                                                                                                        </item>
                                                                                                        <item id="154" type="com.j2fe.workflow.definition.Parameter">
                                                                                                            <UITypeHint id="155">["filesystemDirPath"]@java/lang/String@</UITypeHint>
                                                                                                            <input>true</input>
                                                                                                            <name id="156">variables["filesystemDirPath"]</name>
                                                                                                            <stringValue id="157">FilesystemDirPath</stringValue>
                                                                                                            <type>VARIABLE</type>
                                                                                                        </item>
                                                                                                        <item id="158" type="com.j2fe.workflow.definition.Parameter">
                                                                                                            <UITypeHint id="159">["gsBinPath"]@java/lang/String@</UITypeHint>
                                                                                                            <input>true</input>
                                                                                                            <name id="160">variables["gsBinPath"]</name>
                                                                                                            <stringValue id="161">gsBinPath</stringValue>
                                                                                                            <type>VARIABLE</type>
                                                                                                        </item>
                                                                                                        <item id="162" type="com.j2fe.workflow.definition.Parameter">
                                                                                                            <UITypeHint id="163">["updFilesystemDirPath"]@java/lang/String@</UITypeHint>
                                                                                                            <input>false</input>
                                                                                                            <name id="164">variables["updFilesystemDirPath"]</name>
                                                                                                            <stringValue id="165">updFilesystemDirPath</stringValue>
                                                                                                            <type>VARIABLE</type>
                                                                                                        </item>
                                                                                                    </parameters>
                                                                                                    <sources id="166" type="java.util.HashSet">
                                                                                                        <item id="167" type="com.j2fe.workflow.definition.Transition">
                                                                                                            <name id="168">goto-next</name>
                                                                                                            <source id="169">
                                                                                                                <activation>INVOKE</activation>
                                                                                                                <clusteredCall>false</clusteredCall>
                                                                                                                <description idref="3"/>
                                                                                                                <directJoin>true</directJoin>
                                                                                                                <name id="170">For Each Split</name>
                                                                                                                <nodeHandler>com.j2fe.workflow.handler.impl.GenericSplit</nodeHandler>
                                                                                                                <nodeHandlerClass id="171">com.j2fe.workflow.handler.impl.GenericSplit</nodeHandlerClass>
                                                                                                                <parameters id="172" type="java.util.HashSet">
                                                                                                                    <item id="173" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                        <input>true</input>
                                                                                                                        <name id="174">input</name>
                                                                                                                        <stringValue id="175">MappedResult</stringValue>
                                                                                                                        <type>VARIABLE</type>
                                                                                                                    </item>
                                                                                                                    <item id="176" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                        <input>false</input>
                                                                                                                        <name id="177">output</name>
                                                                                                                        <stringValue id="178">Output</stringValue>
                                                                                                                        <type>VARIABLE</type>
                                                                                                                    </item>
                                                                                                                    <item id="179" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                        <UITypeHint id="180">["archive_flag"]@java/lang/String@</UITypeHint>
                                                                                                                        <input>false</input>
                                                                                                                        <name id="181">output["archive_flag"]</name>
                                                                                                                        <stringValue id="182">ArchiveFlag</stringValue>
                                                                                                                        <type>VARIABLE</type>
                                                                                                                    </item>
                                                                                                                    <item id="183" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                        <UITypeHint id="184">["archive_threshold_days"]@java/lang/Integer@</UITypeHint>
                                                                                                                        <input>false</input>
                                                                                                                        <name id="185">output["archive_threshold_days"]</name>
                                                                                                                        <stringValue id="186">ArchiveThresholdDays</stringValue>
                                                                                                                        <type>VARIABLE</type>
                                                                                                                    </item>
                                                                                                                    <item id="187" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                        <UITypeHint id="188">["file_pattern"]@java/lang/String@</UITypeHint>
                                                                                                                        <input>false</input>
                                                                                                                        <name id="189">output["file_pattern"]</name>
                                                                                                                        <stringValue id="190">FilePattern</stringValue>
                                                                                                                        <type>VARIABLE</type>
                                                                                                                    </item>
                                                                                                                    <item id="191" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                        <UITypeHint id="192">["filesystem_directory_path"]@java/lang/String@</UITypeHint>
                                                                                                                        <input>false</input>
                                                                                                                        <name id="193">output["filesystem_directory_path"]</name>
                                                                                                                        <stringValue id="194">FilesystemDirPath</stringValue>
                                                                                                                        <type>VARIABLE</type>
                                                                                                                    </item>
                                                                                                                    <item id="195" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                        <UITypeHint id="196">["purge_threshold_days"]@java/lang/Integer@</UITypeHint>
                                                                                                                        <input>false</input>
                                                                                                                        <name id="197">output["purge_threshold_days"]</name>
                                                                                                                        <stringValue id="198">PurgeThresholdDays</stringValue>
                                                                                                                        <type>VARIABLE</type>
                                                                                                                    </item>
                                                                                                                    <item id="199" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                        <UITypeHint id="200">["vendor_name"]@java/lang/String@</UITypeHint>
                                                                                                                        <input>false</input>
                                                                                                                        <name id="201">output["vendor_name"]</name>
                                                                                                                        <stringValue id="202">VendorName</stringValue>
                                                                                                                        <type>VARIABLE</type>
                                                                                                                    </item>
                                                                                                                </parameters>
                                                                                                                <sources id="203" type="java.util.HashSet">
                                                                                                                    <item id="204" type="com.j2fe.workflow.definition.Transition">
                                                                                                                        <name id="205">rows-found</name>
                                                                                                                        <source id="206">
                                                                                                                            <activation>INVOKE</activation>
                                                                                                                            <clusteredCall>false</clusteredCall>
                                                                                                                            <description idref="3"/>
                                                                                                                            <directJoin>false</directJoin>
                                                                                                                            <name id="207">Query mhi_tb_cleanupfiles</name>
                                                                                                                            <nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
                                                                                                                            <nodeHandlerClass id="208">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
                                                                                                                            <parameters id="209" type="java.util.HashSet">
                                                                                                                                <item id="210" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="211">database</name>
                                                                                                                                    <stringValue id="212">jdbc/GSDM-1</stringValue>
                                                                                                                                    <type>REFERENCE</type>
                                                                                                                                </item>
                                                                                                                                <item id="213" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <input>false</input>
                                                                                                                                    <name id="214">firstColumnsResult</name>
                                                                                                                                    <stringValue id="215">FirstColumnResultList</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="216" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <input>false</input>
                                                                                                                                    <name id="217">indexedResult</name>
                                                                                                                                    <stringValue id="218">ResultList</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="219" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <input>false</input>
                                                                                                                                    <name id="220">mappedResult</name>
                                                                                                                                    <stringValue id="221">MappedResult</stringValue>
                                                                                                                                    <type>VARIABLE</type>
                                                                                                                                </item>
                                                                                                                                <item id="222" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                    <input>true</input>
                                                                                                                                    <name id="223">querySQL</name>
                                                                                                                                    <stringValue id="224">SELECT vendor_name, filesystem_directory_path, file_pattern, purge_threshold_days, archive_flag, archive_threshold_days  FROM mhi_tb_cleanupfiles</stringValue>
                                                                                                                                    <type>CONSTANT</type>
                                                                                                                                </item>
                                                                                                                            </parameters>
                                                                                                                            <sources id="225" type="java.util.HashSet">
                                                                                                                                <item id="226" type="com.j2fe.workflow.definition.Transition">
                                                                                                                                    <name id="227">goto-next</name>
                                                                                                                                    <source id="228">
                                                                                                                                        <activation>INVOKE</activation>
                                                                                                                                        <clusteredCall>false</clusteredCall>
                                                                                                                                        <description idref="3"/>
                                                                                                                                        <directJoin>false</directJoin>
                                                                                                                                        <name id="229">get gs.bin.path &amp; java.io.tmpdir</name>
                                                                                                                                        <nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
                                                                                                                                        <nodeHandlerClass id="230">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
                                                                                                                                        <parameters id="231" type="java.util.HashSet">
                                                                                                                                            <item id="232" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                                <input>true</input>
                                                                                                                                                <name id="233">statements</name>
                                                                                                                                                <stringValue id="234">gsBinPath = com.j2fe.misc.StringPropertyReplacer.replaceProperties(gsBinPath);&#13;

tmpDirPath = com.j2fe.misc.StringPropertyReplacer.replaceProperties(tmpDirPath);</stringValue>
                                                                                                                                                <type>CONSTANT</type>
                                                                                                                                            </item>
                                                                                                                                            <item id="235" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                                <input>true</input>
                                                                                                                                                <name id="236">variables["gsBinPath"]</name>
                                                                                                                                                <stringValue id="237">gs.bin.path</stringValue>
                                                                                                                                                <type>VARIABLE</type>
                                                                                                                                            </item>
                                                                                                                                            <item id="238" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                                <input>false</input>
                                                                                                                                                <name id="239">variables["gsBinPath"]</name>
                                                                                                                                                <stringValue id="240">gsBinPath</stringValue>
                                                                                                                                                <type>VARIABLE</type>
                                                                                                                                            </item>
                                                                                                                                            <item id="241" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                                <input>true</input>
                                                                                                                                                <name id="242">variables["tmpDirPath"]</name>
                                                                                                                                                <stringValue id="243">java.io.tmpdir</stringValue>
                                                                                                                                                <type>VARIABLE</type>
                                                                                                                                            </item>
                                                                                                                                            <item id="244" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                                                <input>false</input>
                                                                                                                                                <name id="245">variables["tmpDirPath"]</name>
                                                                                                                                                <stringValue id="246">tmpDirPath</stringValue>
                                                                                                                                                <type>VARIABLE</type>
                                                                                                                                            </item>
                                                                                                                                        </parameters>
                                                                                                                                        <sources id="247" type="java.util.HashSet">
                                                                                                                                            <item id="248" type="com.j2fe.workflow.definition.Transition">
                                                                                                                                                <name id="249">goto-next</name>
                                                                                                                                                <source id="250">
                                                                                                                                                    <activation>INVOKE</activation>
                                                                                                                                                    <clusteredCall>false</clusteredCall>
                                                                                                                                                    <description idref="3"/>
                                                                                                                                                    <directJoin>false</directJoin>
                                                                                                                                                    <name id="251">Start</name>
                                                                                                                                                    <nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
                                                                                                                                                    <nodeHandlerClass id="252">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
                                                                                                                                                    <sources id="253" type="java.util.HashSet"/>
                                                                                                                                                    <targets id="254" type="java.util.HashSet">
                                                                                                                                                        <item idref="248" type="com.j2fe.workflow.definition.Transition"/>
                                                                                                                                                    </targets>
                                                                                                                                                    <type>START</type>
                                                                                                                                                </source>
                                                                                                                                                <target idref="228"/>
                                                                                                                                            </item>
                                                                                                                                        </sources>
                                                                                                                                        <targets id="255" type="java.util.HashSet">
                                                                                                                                            <item idref="226" type="com.j2fe.workflow.definition.Transition"/>
                                                                                                                                        </targets>
                                                                                                                                        <type>ACTIVITY</type>
                                                                                                                                    </source>
                                                                                                                                    <target idref="206"/>
                                                                                                                                </item>
                                                                                                                            </sources>
                                                                                                                            <targets id="256" type="java.util.HashSet">
                                                                                                                                <item id="257" type="com.j2fe.workflow.definition.Transition">
                                                                                                                                    <name id="258">nothing-found</name>
                                                                                                                                    <source idref="206"/>
                                                                                                                                    <target idref="2"/>
                                                                                                                                </item>
                                                                                                                                <item idref="204" type="com.j2fe.workflow.definition.Transition"/>
                                                                                                                            </targets>
                                                                                                                            <type>XORSPLIT</type>
                                                                                                                        </source>
                                                                                                                        <target idref="169"/>
                                                                                                                    </item>
                                                                                                                </sources>
                                                                                                                <targets id="259" type="java.util.HashSet">
                                                                                                                    <item idref="167" type="com.j2fe.workflow.definition.Transition"/>
                                                                                                                </targets>
                                                                                                                <type>ANDSPLIT</type>
                                                                                                            </source>
                                                                                                            <target idref="147"/>
                                                                                                        </item>
                                                                                                    </sources>
                                                                                                    <targets id="260" type="java.util.HashSet">
                                                                                                        <item idref="145" type="com.j2fe.workflow.definition.Transition"/>
                                                                                                    </targets>
                                                                                                    <type>ACTIVITY</type>
                                                                                                </source>
                                                                                                <target idref="126"/>
                                                                                            </item>
                                                                                        </sources>
                                                                                        <targets id="261" type="java.util.HashSet">
                                                                                            <item id="262" type="com.j2fe.workflow.definition.Transition">
                                                                                                <name id="263">N</name>
                                                                                                <source idref="126"/>
                                                                                                <target id="264">
                                                                                                    <activation>INVOKE</activation>
                                                                                                    <clusteredCall>false</clusteredCall>
                                                                                                    <description idref="3"/>
                                                                                                    <directJoin>false</directJoin>
                                                                                                    <name id="265">Build Purge Script</name>
                                                                                                    <nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
                                                                                                    <nodeHandlerClass id="266">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
                                                                                                    <parameters id="267" type="java.util.HashSet">
                                                                                                        <item id="268" type="com.j2fe.workflow.definition.Parameter">
                                                                                                            <input>true</input>
                                                                                                            <name id="269">statements</name>
                                                                                                            <stringValue id="270">String purgeScript = "find " + updFilesystemDirPath + "/" + filePattern + " -mtime +" + purgeThresholdDays + " -exec rm {} \\;";</stringValue>
                                                                                                            <type>CONSTANT</type>
                                                                                                        </item>
                                                                                                        <item id="271" type="com.j2fe.workflow.definition.Parameter">
                                                                                                            <input>true</input>
                                                                                                            <name id="272">variables["filePattern"]</name>
                                                                                                            <stringValue id="273">FilePattern</stringValue>
                                                                                                            <type>VARIABLE</type>
                                                                                                        </item>
                                                                                                        <item id="274" type="com.j2fe.workflow.definition.Parameter">
                                                                                                            <input>false</input>
                                                                                                            <name id="275">variables["purgeScript"]</name>
                                                                                                            <stringValue id="276">purgeScript</stringValue>
                                                                                                            <type>VARIABLE</type>
                                                                                                        </item>
                                                                                                        <item id="277" type="com.j2fe.workflow.definition.Parameter">
                                                                                                            <input>true</input>
                                                                                                            <name id="278">variables["purgeThresholdDays"]</name>
                                                                                                            <stringValue id="279">PurgeThresholdDays</stringValue>
                                                                                                            <type>VARIABLE</type>
                                                                                                        </item>
                                                                                                        <item id="280" type="com.j2fe.workflow.definition.Parameter">
                                                                                                            <input>true</input>
                                                                                                            <name id="281">variables["updFilesystemDirPath"]</name>
                                                                                                            <stringValue id="282">updFilesystemDirPath</stringValue>
                                                                                                            <type>VARIABLE</type>
                                                                                                        </item>
                                                                                                    </parameters>
                                                                                                    <sources id="283" type="java.util.HashSet">
                                                                                                        <item idref="262" type="com.j2fe.workflow.definition.Transition"/>
                                                                                                    </sources>
                                                                                                    <targets id="284" type="java.util.HashSet">
                                                                                                        <item id="285" type="com.j2fe.workflow.definition.Transition">
                                                                                                            <name id="286">goto-next</name>
                                                                                                            <source idref="264"/>
                                                                                                            <target id="287">
                                                                                                                <activation>INVOKE</activation>
                                                                                                                <clusteredCall>false</clusteredCall>
                                                                                                                <description idref="3"/>
                                                                                                                <directJoin>false</directJoin>
                                                                                                                <name id="288">Purge Files</name>
                                                                                                                <nodeHandler>com.j2fe.general.activities.CommandLine</nodeHandler>
                                                                                                                <nodeHandlerClass id="289">com.j2fe.general.activities.CommandLine</nodeHandlerClass>
                                                                                                                <parameters id="290" type="java.util.HashSet">
                                                                                                                    <item id="291" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                        <input>true</input>
                                                                                                                        <name id="292">commandLine</name>
                                                                                                                        <stringValue id="293">purgeScript</stringValue>
                                                                                                                        <type>VARIABLE</type>
                                                                                                                    </item>
                                                                                                                    <item id="294" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                        <input>false</input>
                                                                                                                        <name id="295">id</name>
                                                                                                                        <stringValue id="296">UniqueProcessId</stringValue>
                                                                                                                        <type>VARIABLE</type>
                                                                                                                    </item>
                                                                                                                    <item id="297" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                        <input>true</input>
                                                                                                                        <name id="298">killTimeout</name>
                                                                                                                        <stringValue id="299">KillTimeoutSecs</stringValue>
                                                                                                                        <type>VARIABLE</type>
                                                                                                                    </item>
                                                                                                                    <item id="300" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                        <input>true</input>
                                                                                                                        <name id="301">logDirectory</name>
                                                                                                                        <stringValue id="302">tmpDirPath</stringValue>
                                                                                                                        <type>VARIABLE</type>
                                                                                                                    </item>
                                                                                                                    <item id="303" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                        <input>false</input>
                                                                                                                        <name id="304">logFile</name>
                                                                                                                        <stringValue id="305">LogFile</stringValue>
                                                                                                                        <type>VARIABLE</type>
                                                                                                                    </item>
                                                                                                                    <item id="306" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                        <input>false</input>
                                                                                                                        <name id="307">pid</name>
                                                                                                                        <stringValue id="308">ProcessID</stringValue>
                                                                                                                        <type>VARIABLE</type>
                                                                                                                    </item>
                                                                                                                    <item id="309" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                        <input>false</input>
                                                                                                                        <name id="310">returnCode</name>
                                                                                                                        <stringValue id="311">ReturnCode</stringValue>
                                                                                                                        <type>VARIABLE</type>
                                                                                                                    </item>
                                                                                                                    <item id="312" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                        <input>false</input>
                                                                                                                        <name id="313">returnCodeMeaning</name>
                                                                                                                        <stringValue id="314">UNIXReturnCodeMeaning</stringValue>
                                                                                                                        <type>VARIABLE</type>
                                                                                                                    </item>
                                                                                                                    <item id="315" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                        <input>false</input>
                                                                                                                        <name id="316">timeoutShutdown</name>
                                                                                                                        <stringValue id="317">TimedOut</stringValue>
                                                                                                                        <type>VARIABLE</type>
                                                                                                                    </item>
                                                                                                                    <item id="318" type="com.j2fe.workflow.definition.Parameter">
                                                                                                                        <input>true</input>
                                                                                                                        <name id="319">waitForEnd</name>
                                                                                                                        <stringValue id="320">PurgeWaitForEnd</stringValue>
                                                                                                                        <type>VARIABLE</type>
                                                                                                                    </item>
                                                                                                                </parameters>
                                                                                                                <sources id="321" type="java.util.HashSet">
                                                                                                                    <item idref="285" type="com.j2fe.workflow.definition.Transition"/>
                                                                                                                </sources>
                                                                                                                <targets id="322" type="java.util.HashSet">
                                                                                                                    <item id="323" type="com.j2fe.workflow.definition.Transition">
                                                                                                                        <name id="324">goto-next</name>
                                                                                                                        <source idref="287"/>
                                                                                                                        <target idref="15"/>
                                                                                                                    </item>
                                                                                                                </targets>
                                                                                                                <type>ACTIVITY</type>
                                                                                                            </target>
                                                                                                        </item>
                                                                                                    </targets>
                                                                                                    <type>ACTIVITY</type>
                                                                                                </target>
                                                                                            </item>
                                                                                            <item idref="124" type="com.j2fe.workflow.definition.Transition"/>
                                                                                        </targets>
                                                                                        <type>XORSPLIT</type>
                                                                                    </source>
                                                                                    <target idref="95"/>
                                                                                </item>
                                                                            </sources>
                                                                            <targets id="325" type="java.util.HashSet">
                                                                                <item idref="93" type="com.j2fe.workflow.definition.Transition"/>
                                                                            </targets>
                                                                            <type>ACTIVITY</type>
                                                                        </source>
                                                                        <target idref="58"/>
                                                                    </item>
                                                                </sources>
                                                                <targets id="326" type="java.util.HashSet">
                                                                    <item idref="56" type="com.j2fe.workflow.definition.Transition"/>
                                                                </targets>
                                                                <type>ACTIVITY</type>
                                                            </source>
                                                            <target idref="21"/>
                                                        </item>
                                                    </sources>
                                                    <targets id="327" type="java.util.HashSet">
                                                        <item idref="19" type="com.j2fe.workflow.definition.Transition"/>
                                                    </targets>
                                                    <type>ACTIVITY</type>
                                                </source>
                                                <target idref="15"/>
                                            </item>
                                            <item idref="323" type="com.j2fe.workflow.definition.Transition"/>
                                        </sources>
                                        <targets id="328" type="java.util.HashSet">
                                            <item idref="13" type="com.j2fe.workflow.definition.Transition"/>
                                        </targets>
                                        <type>ACTIVITY</type>
                                    </source>
                                    <target idref="9"/>
                                </item>
                            </sources>
                            <targets id="329" type="java.util.HashSet">
                                <item idref="7" type="com.j2fe.workflow.definition.Transition"/>
                            </targets>
                            <type>ANDJOIN</type>
                        </source>
                        <target idref="2"/>
                    </item>
                    <item idref="257" type="com.j2fe.workflow.definition.Transition"/>
                </sources>
                <targets id="330" type="java.util.HashSet"/>
                <type>END</type>
            </endNode>
            <forcePurgeAtEnd>false</forcePurgeAtEnd>
            <group id="331">Mizuho/Housekeeping</group>
            <haltOnError>true</haltOnError>
            <lastChangeUser id="332">user1</lastChangeUser>
            <lastUpdate id="333">2025-06-13T07:44:29.000+0000</lastUpdate>
            <name id="334">MZ_CleanupFiles</name>
            <nodes id="335" type="java.util.HashSet">
                <item idref="58" type="com.j2fe.workflow.definition.Node"/>
                <item idref="126" type="com.j2fe.workflow.definition.Node"/>
                <item idref="95" type="com.j2fe.workflow.definition.Node"/>
                <item idref="264" type="com.j2fe.workflow.definition.Node"/>
                <item idref="169" type="com.j2fe.workflow.definition.Node"/>
                <item idref="21" type="com.j2fe.workflow.definition.Node"/>
                <item idref="287" type="com.j2fe.workflow.definition.Node"/>
                <item idref="206" type="com.j2fe.workflow.definition.Node"/>
                <item idref="250" type="com.j2fe.workflow.definition.Node"/>
                <item idref="2" type="com.j2fe.workflow.definition.Node"/>
                <item idref="9" type="com.j2fe.workflow.definition.Node"/>
                <item idref="228" type="com.j2fe.workflow.definition.Node"/>
                <item idref="15" type="com.j2fe.workflow.definition.Node"/>
                <item idref="147" type="com.j2fe.workflow.definition.Node"/>
            </nodes>
            <optimize>false</optimize>
            <parameter id="336" type="java.util.HashMap">
                <entry>
                    <key id="337" type="java.lang.String">ArchiveWaitForEnd</key>
                    <value id="338" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="339">java.lang.Boolean</className>
                        <clazz>java.lang.Boolean</clazz>
                        <description id="340">Wait till the archive command completes</description>
                        <input>true</input>
                        <output>false</output>
                        <required>true</required>
                    </value>
                </entry>
                <entry>
                    <key id="341" type="java.lang.String">KillTimeoutSecs</key>
                    <value id="342" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="343">java.lang.Integer</className>
                        <clazz>java.lang.Integer</clazz>
                        <description id="344">Time in seconds after which the shell script will be forcefully shut down.</description>
                        <input>true</input>
                        <output>false</output>
                        <required>true</required>
                    </value>
                </entry>
                <entry>
                    <key id="345" type="java.lang.String">PurgeWaitForEnd</key>
                    <value id="346" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="347">java.lang.Boolean</className>
                        <clazz>java.lang.Boolean</clazz>
                        <description id="348">Wait till the purge command completes</description>
                        <input>true</input>
                        <output>false</output>
                        <required>true</required>
                    </value>
                </entry>
                <entry>
                    <key id="349" type="java.lang.String">gs.bin.path</key>
                    <value id="350" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="351">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <input>true</input>
                        <output>false</output>
                        <required>true</required>
                    </value>
                </entry>
                <entry>
                    <key id="352" type="java.lang.String">java.io.tmpdir</key>
                    <value id="353" type="com.j2fe.workflow.definition.WorkflowParameter">
                        <className id="354">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <input>true</input>
                        <output>false</output>
                        <required>true</required>
                    </value>
                </entry>
            </parameter>
            <permissions id="355" type="java.util.HashSet"/>
            <priority>50</priority>
            <purgeAtEnd>false</purgeAtEnd>
            <retries>0</retries>
            <startNode idref="250"/>
            <status>RELEASED</status>
            <variables id="356" type="java.util.HashMap">
                <entry>
                    <key id="357" type="java.lang.String">ArchiveWaitForEnd</key>
                    <value id="358" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="359">java.lang.Boolean</className>
                        <clazz>java.lang.Boolean</clazz>
                        <description id="360">Wait till the archive command completes</description>
                        <persistent>false</persistent>
                        <value idref="132"/>
                    </value>
                </entry>
                <entry>
                    <key id="361" type="java.lang.String">KillTimeoutSecs</key>
                    <value id="362" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="363">java.lang.Integer</className>
                        <clazz>java.lang.Integer</clazz>
                        <description id="364">Time in seconds after which the shell script will be forcefully shut down.</description>
                        <persistent>false</persistent>
                        <value id="365" type="java.lang.Integer">1800</value>
                    </value>
                </entry>
                <entry>
                    <key id="366" type="java.lang.String">PurgeWaitForEnd</key>
                    <value id="367" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="368">java.lang.Boolean</className>
                        <clazz>java.lang.Boolean</clazz>
                        <description id="369">Wait till the purge command completes</description>
                        <persistent>false</persistent>
                        <value id="370" type="java.lang.Boolean">false</value>
                    </value>
                </entry>
                <entry>
                    <key id="371" type="java.lang.String">gs.bin.path</key>
                    <value id="372" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="373">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <persistent>false</persistent>
                        <value id="374" type="java.lang.String">${gs.bin.path}</value>
                    </value>
                </entry>
                <entry>
                    <key id="375" type="java.lang.String">java.io.tmpdir</key>
                    <value id="376" type="com.j2fe.workflow.definition.GlobalVariable">
                        <className id="377">java.lang.String</className>
                        <clazz>java.lang.String</clazz>
                        <persistent>false</persistent>
                        <value id="378" type="java.lang.String">${java.io.tmpdir}</value>
                    </value>
                </entry>
            </variables>
            <version>4</version>
        </com.j2fe.workflow.definition.Workflow>
    </businessobject>
</goldensource-package>
