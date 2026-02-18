<?xml version="1.0" encoding="UTF-8"?><goldensource-package version="10.0.0.07">
<package-comment/>
<businessobject displayString="14 - regex added" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>false</alwaysPersist>
<clustered>true</clustered>
<comment id="1">regex added</comment>
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
<name id="11">File Operations</name>
<nodeHandler>com.j2fe.general.activities.FileOperator</nodeHandler>
<nodeHandlerClass id="12">com.j2fe.general.activities.FileOperator</nodeHandlerClass>
<parameters id="13" type="java.util.HashSet">
<item id="14" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="15">operationToPerform</name>
<stringValue id="16">Delete</stringValue>
<type>CONSTANT</type>
</item>
<item id="17" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="18">sourceURI</name>
<stringValue id="19">uriFile</stringValue>
<type>VARIABLE</type>
<variablePart id="20"/>
</item>
</parameters>
<sources id="21" type="java.util.HashSet">
<item id="22" type="com.j2fe.workflow.definition.Transition">
<name id="23">goto-next</name>
<source id="24">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="25"/>
<directJoin>false</directJoin>
<name id="26">Email</name>
<nodeHandler>com.j2fe.general.activities.EMAIL</nodeHandler>
<nodeHandlerClass id="27">com.j2fe.general.activities.EMAIL</nodeHandlerClass>
<parameters id="28" type="java.util.HashSet">
<item id="29" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="30">EMAIL_PATTERN</name>
<stringValue id="31">^[A-Za-z0-9._%+\-&amp;]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$</stringValue>
<type>CONSTANT</type>
</item>
<item id="32" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="33">attachmentsName[0]</name>
<stringValue id="34">Attachment</stringValue>
<type>VARIABLE</type>
<variablePart id="35"/>
</item>
<item id="36" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="37">[0]@java/net/URI@</UITypeHint>
<input>true</input>
<name id="38">attachments[0]</name>
<stringValue id="39">uriFile</stringValue>
<type>VARIABLE</type>
<variablePart id="40"/>
</item>
<item id="41" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="42">cc_recipients</name>
<stringValue id="43">CopyInArray</stringValue>
<type>VARIABLE</type>
<variablePart id="44"/>
</item>
<item id="45" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="46">emailText</name>
<stringValue id="47">mail</stringValue>
<type>VARIABLE</type>
<variablePart id="48"/>
</item>
<item id="49" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="50">from</name>
<stringValue id="51">noreply@thegoldensource.com</stringValue>
<type>CONSTANT</type>
</item>
<item id="52" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="53">mimeType</name>
<stringValue id="54">text/html</stringValue>
<type>CONSTANT</type>
</item>
<item id="55" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="56">recipients</name>
<stringValue id="57">RecipientArray</stringValue>
<type>VARIABLE</type>
<variablePart id="58"/>
</item>
<item id="59" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="60">session</name>
<stringValue id="61">email/session</stringValue>
<type>REFERENCE</type>
</item>
<item id="62" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="63">subject</name>
<stringValue id="64">env</stringValue>
<type>VARIABLE</type>
<variablePart id="65"/>
</item>
</parameters>
<sources id="66" type="java.util.HashSet">
<item id="67" type="com.j2fe.workflow.definition.Transition">
<name id="68">goto-next</name>
<source id="69">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="70"/>
<directJoin>false</directJoin>
<name id="71">Get env</name>
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
<name id="78">firstColumnsResult[0]</name>
<stringValue id="79">env</stringValue>
<type>VARIABLE</type>
</item>
<item id="80" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="81">indexedParameters[0]</name>
<stringValue id="82">Subject</stringValue>
<type>VARIABLE</type>
</item>
<item id="83" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="84">querySQL</name>
<stringValue id="85">SELECT '[' || 
       (SELECT Env_Nme FROM MIZ_Environment_Name) || 
       ']: ' || ? AS env from dual</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="86" type="java.util.HashSet">
<item id="87" type="com.j2fe.workflow.definition.Transition">
<name id="88">goto-next</name>
<source id="89">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="90"/>
<directJoin>false</directJoin>
<name id="91">Create Excel</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="92">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="93" type="java.util.HashSet">
<item id="94" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="95">statements</name>
<objectValue id="96" type="java.lang.String">import java.io.FileOutputStream;&#13;
import java.io.IOException;&#13;
import java.net.URI;&#13;
import java.util.ArrayList;&#13;
import java.util.Calendar;&#13;
import java.text.SimpleDateFormat;&#13;
&#13;
import org.apache.poi.hssf.usermodel.HSSFCell;&#13;
import org.apache.poi.hssf.usermodel.HSSFRow;&#13;
import org.apache.poi.hssf.usermodel.HSSFSheet;&#13;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;&#13;
import org.apache.poi.ss.usermodel.Cell;&#13;
import org.apache.poi.ss.usermodel.CellStyle;&#13;
import org.apache.poi.ss.usermodel.Font;&#13;
import org.apache.poi.ss.usermodel.Row;&#13;
import org.apache.poi.hssf.util.CellReference;&#13;
import org.apache.poi.ss.util.CellRangeAddress;&#13;
import org.apache.log4j.Logger;&#13;
&#13;
private static final Logger logger = Logger.getLogger(String.class);&#13;
 &#13;
      &#13;
SimpleDateFormat sdf =  new SimpleDateFormat("yyyyMMdd");&#13;
Calendar c1 = Calendar.getInstance(); &#13;
&#13;
Object[] resultArray=resultArray;&#13;
&#13;
&#13;
 &#13;
ArrayList arList=new ArrayList();&#13;
attachment = attachment+ sdf.format(c1.getTime()) + ".xls";&#13;
String attachFile = "/tmp/" + attachment;&#13;
URI uriFile = new URI("file:" + attachFile);&#13;
String[] CopyInArray= CopyIn.split(";");&#13;
String[] RecipientArray = Recipients.split(";");&#13;
String mail = "&lt;html&gt;&lt;body&gt;&lt;p&gt;All&lt;/p&gt;&lt;p&gt;"+ EmailText+"&lt;/p&gt;";&#13;
mail = mail + "&lt;p&gt;Thanks&lt;/p&gt;&amp;nbsp;&lt;/p&gt;";&#13;
if(NoteText !=null  &amp;&amp;  !"".equals(NoteText)){&#13;
	mail = mail + "&lt;p&gt;&lt;i&gt;"+NoteText+"&lt;/i&gt;&lt;/p&gt;";&#13;
}&#13;
mail = mail + "&lt;p&gt;&lt;/p&gt;&amp;nbsp;&lt;/p&gt;&lt;/body&gt;&lt;/html&gt;"; &#13;
    &#13;
for(int i=0; i&lt;resultArray.length; i++)&#13;
{&#13;
&#13;
&#13;
 &#13;
    ArrayList al = new ArrayList();&#13;
    String[] strar = resultArray[i].toString().split("\",\"");&#13;
    for(int j=0;j&lt;strar.length;j++)&#13;
    {&#13;
    al.add(strar[j]);&#13;
    }&#13;
    arList.add(al);&#13;
}&#13;
&#13;
try&#13;
{&#13;
 HSSFWorkbook hwb = new HSSFWorkbook();&#13;
 HSSFSheet sheet = hwb.createSheet("Report");&#13;
  for(int k=0;k&lt;arList.size();k++)&#13;
  {&#13;
   ArrayList ardata = (ArrayList)arList.get(k);&#13;
   HSSFRow row = sheet.createRow((short) 0+k);&#13;
   for(int p=0;p&lt;ardata.size();p++)&#13;
   {&#13;
	HSSFCell cell = row.createCell((short) p);&#13;
	String data = ardata.get(p).toString();&#13;
	data=data.replaceAll("\"", "");&#13;
	//cell.setCellType(Cell.CELL_TYPE_STRING);&#13;
	cell.setCellValue(data);&#13;
   }&#13;
  }&#13;
&#13;
CellStyle style = hwb.createCellStyle();//Create style&#13;
Font font = hwb.createFont();//Create font&#13;
//font.setBoldweight(Font.BOLDWEIGHT_BOLD);//Make font bold&#13;
font.setBold(true);&#13;
style.setFont(font);//set it to bold&#13;
&#13;
Row row = sheet.getRow(sheet.getTopRow());&#13;
for(int j = 0; j &lt; row.getLastCellNum(); j++){&#13;
    row.getCell(j).setCellStyle(style);&#13;
    sheet.autoSizeColumn(j);&#13;
}&#13;
&#13;
sheet.createFreezePane(0, 1);&#13;
FileOutputStream fileOut = new FileOutputStream(attachFile);&#13;
hwb.write(fileOut);&#13;
fileOut.close();&#13;
System.out.println("Your excel file has been generated");&#13;
&#13;
} catch ( Exception ex ) {&#13;
	 ex.printStackTrace();&#13;
}</objectValue>
<type>CONSTANT</type>
</item>
<item id="97" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="98">variables["CopyIn"]</name>
<stringValue id="99">CopyIn</stringValue>
<type>VARIABLE</type>
</item>
<item id="100" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="101">variables["CopyInArray"]</name>
<stringValue id="102">CopyInArray</stringValue>
<type>VARIABLE</type>
</item>
<item id="103" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="104">variables["EmailText"]</name>
<stringValue id="105">EmailText</stringValue>
<type>VARIABLE</type>
</item>
<item id="106" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="107">variables["NoteText"]</name>
<stringValue id="108">NoteText</stringValue>
<type>VARIABLE</type>
</item>
<item id="109" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="110">variables["RecipientArray"]</name>
<stringValue id="111">RecipientArray</stringValue>
<type>VARIABLE</type>
</item>
<item id="112" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="113">["Recipients"]@java/lang/Object@</UITypeHint>
<input>true</input>
<name id="114">variables["Recipients"]</name>
<stringValue id="115">Recipients</stringValue>
<type>VARIABLE</type>
</item>
<item id="116" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="117">variables["attachment"]</name>
<stringValue id="118">Attachment</stringValue>
<type>VARIABLE</type>
</item>
<item id="119" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="120">variables["attachment"]</name>
<stringValue id="121">Attachment</stringValue>
<type>VARIABLE</type>
</item>
<item id="122" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="123">variables["mail"]</name>
<stringValue id="124">mail</stringValue>
<type>VARIABLE</type>
</item>
<item id="125" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="126">variables["resultArray"]</name>
<stringValue id="127">resultSetArray</stringValue>
<type>VARIABLE</type>
</item>
<item id="128" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="129">["uriFile"]@java/net/URI@</UITypeHint>
<input>false</input>
<name id="130">variables["uriFile"]</name>
<stringValue id="131">uriFile</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="132" type="java.util.HashSet">
<item id="133" type="com.j2fe.workflow.definition.Transition">
<name id="134">rows-found</name>
<source id="135">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="136"/>
<directJoin>false</directJoin>
<name id="137">Database Select (Xor Split)</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="138">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="139" type="java.util.HashSet">
<item id="140" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="141">database</name>
<stringValue id="142">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="143" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="144">firstColumnsResult</name>
<stringValue id="145">resultSetArray</stringValue>
<type>VARIABLE</type>
</item>
<item id="146" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="147">querySQL</name>
<stringValue id="148">sqlSelect</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="149" type="java.util.HashSet">
<item id="150" type="com.j2fe.workflow.definition.Transition">
<name id="151">goto-next</name>
<source id="152">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="153"/>
<directJoin>false</directJoin>
<name id="154">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="155">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="156" type="java.util.HashSet"/>
<targets id="157" type="java.util.HashSet">
<item idref="150" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="135"/>
</item>
</sources>
<targets id="158" type="java.util.HashSet">
<item id="159" type="com.j2fe.workflow.definition.Transition">
<name id="160">nothing-found</name>
<source idref="135"/>
<target idref="2"/>
</item>
<item idref="133" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="89"/>
</item>
</sources>
<targets id="161" type="java.util.HashSet">
<item idref="87" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="69"/>
</item>
</sources>
<targets id="162" type="java.util.HashSet">
<item idref="67" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="24"/>
</item>
</sources>
<targets id="163" type="java.util.HashSet">
<item idref="22" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="9"/>
</item>
</sources>
<targets id="164" type="java.util.HashSet">
<item idref="7" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="2"/>
</item>
<item idref="159" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="165" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="166">Mizuho/Reports</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="167">user1</lastChangeUser>
<lastUpdate id="168">2025-11-26T16:39:23.000+0000</lastUpdate>
<name id="169">EmailExcelReport</name>
<nodes id="170" type="java.util.HashSet">
<item idref="89" type="com.j2fe.workflow.definition.Node"/>
<item idref="135" type="com.j2fe.workflow.definition.Node"/>
<item idref="24" type="com.j2fe.workflow.definition.Node"/>
<item idref="9" type="com.j2fe.workflow.definition.Node"/>
<item idref="69" type="com.j2fe.workflow.definition.Node"/>
<item idref="152" type="com.j2fe.workflow.definition.Node"/>
<item idref="2" type="com.j2fe.workflow.definition.Node"/>
</nodes>
<optimize>true</optimize>
<parameter id="171" type="java.util.HashMap">
<entry>
<key id="172" type="java.lang.String">Attachment</key>
<value id="173" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="174">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="175">Name of the file attachment, without the file extension</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="176" type="java.lang.String">CopyIn</key>
<value id="177" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="178">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="179">Multiple addresses separated by ;</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="180" type="java.lang.String">EmailText</key>
<value id="181" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="182">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="183">Email body, minus the pleasantries</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="184" type="java.lang.String">NoteText</key>
<value id="185" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="186">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="187" type="java.lang.String">Recipients</key>
<value id="188" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="189">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="190">Multiple addresses separated by ;</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="191" type="java.lang.String">Subject</key>
<value id="192" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="193">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="194">The email subject</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="195" type="java.lang.String">sqlSelect</key>
<value id="196" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="197">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="198">Resultant data needs to be a single column, comma separated, and in double quotes</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
</parameter>
<permissions id="199" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>false</purgeAtEnd>
<retries>0</retries>
<startNode idref="152"/>
<status>RELEASED</status>
<variables id="200" type="java.util.HashMap">
<entry>
<key id="201" type="java.lang.String">Attachment</key>
<value id="202" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="203">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="204">Name of the file attachment, without the file extension</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="205" type="java.lang.String">CopyIn</key>
<value id="206" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="207">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="208">Multiple addresses separated by ;</description>
<persistent>false</persistent>
<value id="209" type="java.lang.String">noreply@thegoldensource.com</value>
</value>
</entry>
<entry>
<key id="210" type="java.lang.String">EmailText</key>
<value id="211" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="212">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="213">Email body, minus the pleasantries</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="214" type="java.lang.String">NoteText</key>
<value id="215" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="216">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="217" type="java.lang.String">Recipients</key>
<value id="218" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="219">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="220">Multiple addresses separated by ;</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="221" type="java.lang.String">Subject</key>
<value id="222" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="223">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="224">The email subject</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="225" type="java.lang.String">sqlSelect</key>
<value id="226" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="227">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="228">Resultant data needs to be a single column, comma separated, and in double quotes</description>
<persistent>false</persistent>
</value>
</entry>
</variables>
<version>14</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
