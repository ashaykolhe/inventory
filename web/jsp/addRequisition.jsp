
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ include file="/includes/_taglibInclude.jsp" %>
    <link rel="stylesheet" href="css/general.css" type="text/css" media="screen" />
    <link rel="stylesheet" type="text/css" href="css/stylesheet.css"/>
    <s:useActionBean beanclass="com.erp.action.RequisitionActionBean" var="listofitem" event="addRequisitionLink"></s:useActionBean>
    <%
    request.setAttribute("itemidlst",listofitem.getItemidlst());
    %>
    <c:set var = "setvalue" value="popupvalue"/>

    <c:if test="${listofitem.popup eq setvalue}">
    <script type="text/javascript" language="javascript">

    function OpenPopup(){
    var w = 770;
    var h = 450;
    var winl = (screen.width-w)/2;
    var wint = (screen.height-h)/2;
    if (winl < 0) winl = 0;
    if (wint < 0) wint = 0;
    var page = "StoreIssue.action?redirectpopup";
    windowprops = "height="+h+",width="+w+",top="+ wint +",left="+ winl +",location=no,"
    + "scrollbars=yes,menubars=no,toolbars=no,resizable=no,status=yes";
    window.open(page, "Popup", windowprops);
    }
    window.onLoad =OpenPopup();

    </script>  </c:if>
    <script type="text/javascript">
    function GetItemDetail(button) {
    var rowid=button.name.substring(button.name.indexOf("[")+1,button.name.indexOf("]"));

    $.get('Requisition.action?getItemDetails', {id:button.value}, function (data) {
    var result=eval(data);

    $('#item'+rowid+'').attr("value",result.itemCode);
    $('#uom'+rowid+'').attr("value",result.uom.name);

    });
    return false;
    }

    function deletethis(p){

    var tr=$('#family #tabletr').length;
    if(tr==1){
    alert("You can not delete the last row.");
    }
    else{
    var count=$('#family #tabletr').length;
    var rowid=p.name.substring(p.name.indexOf("[")+1,p.name.indexOf("]"))-1;

    $('#family #tabletr:eq('+rowid+') input').attr("value","");
    $('#family #tabletr:eq('+rowid+') select:eq(0)').attr("value","0");
    }
    }
    $(document).ready(function(){
    $('#add').click(function(){
    var count=$('#family #tabletr').length+1;
    $('#family #tabletr:last').clone(true).insertAfter('#family #tabletr:last');
    $('#family #tabletr:last input').removeAttr("value");
    $('#family #tabletr:last select:eq(0)').attr("value","0");
    $('#family #tabletr:last select:eq(0)').attr("name","requisitiondetailarray["+count+"].item.id");
    $('#family #tabletr:last select:eq(0)').attr("id","itemcode"+count);
    $('#family #tabletr:last input:eq(0)').attr("id","item"+count);
    $('#family #tabletr:last input:eq(1)').attr("id","uom"+count);
    $('#family #tabletr:last input:eq(2)').attr("name","requisitiondetailarray["+count+"].requiredQty");
    $('#family #tabletr:last input:eq(3)').attr("name","delete["+count+"]");
    $('#family #tabletr:last input:eq(3)').attr("id","delete"+count);
    });
    $("#addreqbutton").click(function(){
    var numeric = /^[0-9]+$/;

    if ($("#addusername").val()==""){
    alert("please enter the Requestor name");
    $("#addusername").focus();
    return false;
    }

    var count=$('#family #tabletr').length;

    for(var i=0;i<count;i++){

    if(i==0){
    if($('#family #tabletr:eq('+i+') select:eq(0)').attr("value")=="0"){
    alert("please select Item Code")

    return false;
    }
    else
    if($('#family #tabletr:eq('+i+') input:eq(2)').attr("value").trim()==""){
    alert("please enter required quantity");
    $('#family #tabletr:eq('+i+') input:eq(2)').focus();
    return false;
    }
    else
    if(!numeric.test($('#family #tabletr:eq('+i+') input:eq(2)').val())){
    alert("please enter valid quanity");
    $('#family #tabletr:eq('+i+') input:eq(2)').val("");
    $('#family #tabletr:eq('+i+') input:eq(2)').focus();
    return false;
    }

    }
    }

    return true;
    });
    });
    </script>

    <s:layout-render name="/layout/_base.jsp">
    <s:layout-component name="body">
    <s:form beanclass="com.erp.action.RequisitionActionBean">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" >
    <tr valign="top"><td >&nbsp;
    </td></tr>
    <tr><td align="left" class="pageheading" valign="top">
    Material Requisition > Add
    </td></tr>
    <tr valign="top"><td align="center"><div class="msg"><s:messages/></div>
    </td></tr>
    </table>
    <table border="1" width="70%" bgcolor="#FCFCFC" ><tr><td>
    <table width="100%" border="0" cellspacing="1" bordercolor="#FCFCFC">
    <tr>
    <td width="19%" align="right" valign="top"> <div align="right" style="margin-left: 2px;" class="labels">Name Of Contractor</div>     </td>
    <td width="19%" align="left" valign="top"><div align="left"><s:text name="requisition.nameOfContractor" id="addcontname" class="textbox"></s:text></div> </td>
    <td width="25%" align="right" valign="top"><div align="right" style="margin-left: 2px;" class="labels">Name Of Requestor<span style="color:#FF0000"> *</span></div></td>
    <td width="21%" align="right" valign="top"><s:text name="requisition.nameOfUser" id="addusername" class="textbox"></s:text></td>
    </tr>
    <tr>
    <td align="right" valign="top"><div align="right" style="margin-left: 2px;" class="labels">Job</div></td>
    <td align="left" valign="top"><div align="left"><s:text name="requisition.job" class="textbox"></s:text></div></td>
    <td align="right" valign="top"><div align="right" style="margin-left: 2px;" class="labels">Drawing No</div></td>
    <td width="21%" align="right" valign="top"><s:text name="requisition.drawingNo" class="textbox"></s:text></td>
    </tr>
    <tr>
    <td align="right" valign="top"><div align="right" style="margin-left: 2px;" class="labels">Part No</div></td>
    <td align="left" valign="top"><div align="left">
    <s:text name="requisition.partNo" class="textbox"></s:text>
    </div></td>
    <td align="right" valign="top"><div align="right" style="margin-left: 2px;" class="labels">Person Authorising</div></td>
    <td  align="right" valign="top"><s:text name="requisition.personAuthorising" class="textbox"></s:text></td>
    </tr>

    <!--....................................................................................................................... -->
    <tr>
    <td colspan="4"><br><div align="left" style="margin-left:10px;">
    <table width="90%" border="0" cellspacing="0" cellpadding="0" style="border:1px solid #000000;" align="left" id="family">
    <tr>
    <td width="25%" height="28px" style="border-right:1px solid #000000;background:#FFCC66;"><div align="center"><strong><span style="color:#3B3131;font-size:13px;font-weight:bold;" >Item name</span></strong></div></td>
    <td width="20%"  style="border-right:1px solid #000000; background:#FFCC66;"><div align="center"><strong><span style="color:#3B3131;font-size:13px;font-weight:bold;">Item Code</span></strong></div></td>
    <td width="15%"  style=" border-right:1px solid #000000;background:#FFCC66;"><div align="center"><strong><span style="color:#3B3131;font-size:13px;font-weight:bold;">UoM</span></strong></div></td>
    <td width="15%"  style=" border-right:1px solid #000000;background:#FFCC66;"><div align="center"><strong><span style="color:#3B3131;font-size:13px;font-weight:bold;">Requested Quantity</span></strong></div></td>
    <td width="17%"  style=" background:#FFCC66;"><div align="center"><strong><span style="color:#3B3131;font-size:13px;font-weight:bold;"><img src="images/Cfthrow.gif"  name="delete"></span></strong></div></td>

    </tr>
    <c:forEach var="i" begin="1" end="4" step="1" varStatus ="status" >


    <tr id="tabletr">
    <td style="border-top:1px solid #000000;border-right:1px solid #000000;">
    <div align="left" style="margin-left:4px;">
    <div align="right">
    <s:select id="itemcode${i}" name="requisitiondetailarray[${i}].item.id"  onchange= "return GetItemDetail(this);">
    <option  value="0">---Select Item---</option>
    <c:forEach items="${itemidlst}" var="itemidloop" varStatus="loop" >
    <option value ="${itemidloop.id}"><c:out value="${itemidloop.name}"/></option>
    </c:forEach>

    </s:select>

    </div></div></td>
    <td style="border-top:1px solid #000000;border-right:1px solid #000000;"><div align="left" style="margin-left:4px;">
    <div align="right">
    <s:text name="requisitiondetail.itemName" readonly="readonly" id="item${i}" class="hello" style="text-align:right;margin-right:2px; width:200px; "  />
    </div></div></td>
    <td style="border-top:1px solid #000000;border-right:1px solid #000000;">
    <div align="left" style="margin-left:4px;">
    <div align="right">
    <s:text  name="requisitiondetail.uom" readonly="readonly" id="uom${i}" style="text-align:right;margin-right:2px;width:200px; "/>
    </div></div></td>

    <td style="border-top:1px solid #000000;border-right:1px solid #000000;">
    <div align="left" style="margin-left:4px;">
    <div align="right">
    <s:text  name="requisitiondetailarray[${i}].requiredQty"  style="text-align:right;margin-right:2px;width:100px; "/>
    </div></div></td>
    <td style="border-top:1px solid #000000;"><div align="left" style="margin-left:1px;">
    <div align="left">
    <s:text name="delete[${i}]"   id="delete${i}"  style="background-image:url('images/Cfthrow.gif');border :none;cursor:auto;"    onclick="return deletethis(this)"/>
    </div></div></td>
    </tr>
    </c:forEach>
    </table>
    <tr>
    </div></td>
    </tr>
    <td colspan="4" align="left" valign="top" >
    <div style="text-align:right; cursor: pointer;" class="links"><span style="vertical-align: top;text-align: left;font-size:medium; " class="addRow" id="add" >Add row</span></div>
    </td>

    </tr>


    <tr>
    <td align="left">&nbsp;</td>
    <td align="left" colspan="3">&nbsp;</td>
    <td align="left">&nbsp;</td>
    </tr>
    <tr>
    <td align="left">&nbsp;</td>
    <td align="left" colspan="3"><s:submit name="addrequisition" id="addreqbutton" value="Add"></s:submit>
    &nbsp;&nbsp;&nbsp;&nbsp;
    <s:reset name="reset" value="Reset"></s:reset>
    &nbsp;&nbsp;&nbsp;&nbsp;
    <s:submit name="cancel" value="Cancel"></s:submit></td>
    <td width="16%" align="left">&nbsp;</td>
    </tr>
    </table></td></tr>
    </table>
    </table>
    </s:form>
    </s:layout-component>
    </s:layout-render>
