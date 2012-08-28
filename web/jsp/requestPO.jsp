<%@ page import="com.erp.dao.UserDao" %>
<%@ page import="com.erp.guice.InjectorFactory" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ include file="/includes/_taglibInclude.jsp" %>
    <link rel="stylesheet" href="css/general.css" type="text/css" media="screen" />
    <link rel="stylesheet" type="text/css" href="css/stylesheet.css"/>
    <s:useActionBean beanclass="com.erp.action.PoRequestActionBean" var="listofitem" event="addPOReqLink"></s:useActionBean>
    <%
    request.setAttribute("itemidlst",listofitem.getItemidlst());
          Long id=(Long)request.getSession().getAttribute("user");
                        String role= InjectorFactory.getInjector().getInstance(UserDao.class).findById(id).getRole().getName();
    %>

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
    $('#family #tabletr:last select:eq(0)').attr("name","poRequestarray["+count+"].item.id");
    $('#family #tabletr:last select:eq(0)').attr("id","itemcode"+count);
    $('#family #tabletr:last input:eq(0)').attr("id","item"+count);
    $('#family #tabletr:last input:eq(1)').attr("id","uom"+count);
    $('#family #tabletr:last input:eq(2)').attr("name","poRequestarray["+count+"].requiredQty");
    $('#family #tabletr:last input:eq(3)').attr("name","delete["+count+"]");
    $('#family #tabletr:last input:eq(3)').attr("id","delete"+count);
    });




    $("#addPoRequest").click(function(){
    var numeric = /^[0-9]+$/;

    if ($("#addcontname").val()==""){
    alert("please enter the Requestor name");
    $("#addusername").focus();
    return false;
    }
    if ($("#adddep").val()==""){
    alert("please enter department");
    $("#addusername").focus();
    return false;
    }
if ($("#addlocationname").val()==""){
    alert("please enter location");
    $("#addlocationname").focus();
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
           <s:layout-component name="left-menu">

                <ul>
                     <li>&nbsp;</li>
                       <li class="left_menu_heading">Purchase Request</li>
                         <li style="margin-top:35px"><s:link beanclass="com.erp.action.PoRequestActionBean" event="addPOReqLink">Create</s:link></li>
                  <%
                      if(role.toLowerCase().contains("superadmin") || role.toLowerCase().contains("manager")){   %>
                                  <li><s:link beanclass="com.erp.action.PoRequestActionBean" event="notificationPoLink">Notification PO</s:link></li>
                               <%}%>

                               <li><s:link beanclass="com.erp.action.PoRequestActionBean" event="approvePOLink">Approve PO</s:link></li>
                  </ul>

         </s:layout-component>
    <s:layout-component name="body">
    <s:form beanclass="com.erp.action.PoRequestActionBean">     <br>
    <table class="heading_table">

    <tr><td align="left" class="pageheading" valign="top">
      <div class="sub_heading" >Create</div>
    </td></tr>
    </table>
     <table class="second_table"  >
    <tr><td>
    <table width="100%" border="0" cellspacing="1" bordercolor="#FCFCFC">       <div class="msg"><s:messages/></div>
    <tr>
    <td width="19%" align="right" valign="top"> <div align="right" style="margin-left: 2px;" class="labels">Name Of Requestor</div>     </td>
    <td width="19%" align="left" valign="top"><div align="left"><s:text name="poRequest.user" id="addcontname" class="textbox"></s:text></div> </td>
    <td width="25%" align="right" valign="top"><div align="right" style="margin-left: 2px;" class="labels">Department<span style="color:#FF0000"> *</span></div></td>
    <td width="21%" align="right" valign="top"><s:text name="poRequest.department" id="adddep" class="textbox"></s:text><s:hidden name="poRequest.approvePO" value="No"></s:hidden></td>
    </tr>
<tr>
    <td width="19%" align="right" valign="top"> <div align="right" style="margin-left: 2px;" class="labels">Location<span style="color:#FF0000"> *</span></div>     </td>
    <td width="19%" align="left" valign="top"><div align="left"><s:text name="poRequest.location" id="addlocationname" class="textbox"></s:text></div> </td>

    </tr>


    <!--....................................................................................................................... -->
    <tr>
    <td colspan="4"><br><div align="left" style="margin-left:10px;">
    <table width="95%" border="0"  cellspacing="0" cellpadding="0"  align="left" id="family">
   <tr class="foreach_table">
    <td width="25%"  class="foreach_table_firstth"><div align="center"><strong><span style="color:#3B3131;font-size:13px;font-weight:bold;" >Item name</span></strong></div></td>
    <td width="20%"  class="foreach_table_th"><div align="center"><strong><span style="color:#3B3131;font-size:13px;font-weight:bold;">Item Code</span></strong></div></td>
    <td width="15%"  class="foreach_table_th"><div align="center"><strong><span style="color:#3B3131;font-size:13px;font-weight:bold;">UoM</span></strong></div></td>
    <td width="15%"  class="foreach_table_th"><div align="center"><strong><span style="color:#3B3131;font-size:13px;font-weight:bold;">Requested Quantity</span></strong></div></td>
    <td width="3%"  class="foreach_table_th"><div align="center"><strong><span style="color:#3B3131;font-size:13px;font-weight:bold;"><img src="images/delete.jpg"  name="delete"></span></strong></div></td>

    </tr>
    <c:forEach var="i" begin="1" end="4" step="1" varStatus ="status" >


    <tr id="tabletr">
     <td class="foreach_table_firstth">
    <div align="left" style="margin-left:4px;">
    <div align="right">
    <s:select id="itemcode${i}" name="poRequestarray[${i}].item.id" class="dropdowntable" onchange= "return GetItemDetail(this);">
    <option  value="0">---Select Item---</option>
    <c:forEach items="${itemidlst}" var="itemidloop" varStatus="loop" >
    <option value ="${itemidloop.id}"><c:out value="${itemidloop.name}"/></option>
    </c:forEach>

    </s:select>
    <%--   <s:text name="grndetailarray[${i}].item.id"  style="text-align:right;margin-right:2px;width:100px; "  />--%>
    </div></div></td>
   <td class="foreach_table_th">
    <div class="foreach_table_div">
    <div align="right">
    <s:text name="requisitiondetail.itemName" readonly="readonly" id="item${i}" class="foreach_table_td" style=" width:200px;"  />
    </div></div></td>
     <td class="foreach_table_th">
    <div class="foreach_table_div">
    <div align="right">
    <s:text  name="requisitiondetail.uom" readonly="readonly" id="uom${i}" class="foreach_table_td"  style="width:70px;"/>
    </div></div></td>

     <td class="foreach_table_th">
    <div class="foreach_table_div">
    <div align="right">
    <s:text  name="poRequestarray[${i}].orderedQty"  class="foreach_table_td"  style="width:70px;"/>
    </div></div></td>
   <td class="foreach_table_th">
    <div class="foreach_table_div">
    <div align="left">
    <s:text name="delete[${i}]"   id="delete${i}"  style="background-image:url('images/delete.jpg');border :none;cursor:auto;"    onclick="return deletethis(this)"/>
    </div></div></td>
    </tr>
    </c:forEach>
    </table>
    <tr>
    </div></td>
    </tr>
    <td colspan="4" align="left" valign="top" >
     <div style="text-align:right; cursor: pointer;" class="links"><span style="vertical-align: top;text-align: left; " class="addRow" id="add" >Add row</span></div>
    </td>

    </tr>


    <tr>
    <td align="left">&nbsp;</td>
    <td align="left" colspan="3">&nbsp;</td>
    <td align="left">&nbsp;</td>
    </tr>
    <tr>
    <td align="left">&nbsp;</td>
    <td align="left" colspan="3"><s:submit name="addPoRequest" class="buttons" id="addPoRequest" value="Add"></s:submit>
    &nbsp;&nbsp;&nbsp;&nbsp;
    <s:reset name="reset" value="Reset" class="buttons"></s:reset>
    &nbsp;&nbsp;&nbsp;&nbsp;
    <s:submit name="cancel" value="Cancel" class="buttons"></s:submit></td>
    <td width="16%" align="left">&nbsp;</td>
    </tr>
    </table></td></tr>
    </table>
    </table>
    </s:form>
    </s:layout-component>
    </s:layout-render>
