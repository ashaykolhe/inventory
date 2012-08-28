<%@ page import="com.erp.dao.UserDao" %>
<%@ page import="com.erp.guice.InjectorFactory" %>
<%@ include file="/includes/_taglibInclude.jsp" %>
    <link rel="stylesheet" href="css/general.css" type="text/css" media="screen" />
    <link rel="stylesheet" type="text/css" href="css/stylesheet.css"/>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <s:useActionBean beanclass="com.erp.action.StoreIssueActionBean" var="listofstoreissue" event="addStoreIssueLink"></s:useActionBean>
    <c:set var = "setvalue" value="popupvalue"/>

    <c:if test="${listofstoreissue.popup eq setvalue}">
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
    $.post('StoreIssue.action?getItemDetails', {id:button.value}, function (data) {
    var result=eval(data);
    $('#item'+rowid+'').attr("value",result.itemCode);
    $('#uom'+rowid+'').attr("value",result.uom.name);

    });
    return false;
    }


    $(document).ready(function(){
    $("#getstoreissuedetail").click(function(){
    if ($("#requisitionid").val()=="0"){
    alert("please select the requisition");
    return false;
    }
    });
    $("#addstoreissue").click(function(){
    var numeric = /^[0-9]+$/;
    var count=$('#family #tabletr').length;

    for(var i=0;i<count;i++){
    var issueqty=  parseFloat($('#family #tabletr:eq('+i+') input:eq(5)').val().trim());
    var req=parseFloat($('#family #tabletr:eq('+i+') input:eq(4)').val().trim());
    var avail=parseFloat($('#family #tabletr:eq('+i+') input:eq(3)').val().trim());

    if($('#family #tabletr:eq('+i+') select:eq(0)').attr("value")=="0"){
    alert("please select Item Code");
    return false;
    }

    else if($('#family #tabletr:eq('+i+') input:eq(5)').val().trim()=="" || issueqty == "0")
    {
    alert("please select Item Code1");
    for(var r=0;i<count;r++){
    if(i==r)
    continue
    else if($('#family #tabletr:eq('+r+') input:eq(5)').val().trim() > 0)
    {
    return true;
    }
    else
    {
    alert("please issue atleast one item");
    return false;
    }

    }

    }


    else if(parseFloat(issueqty) > parseFloat(req)){

    alert("Issue quantity can not exceed required quantity");
    $('#family #tabletr:eq('+i+') input:eq(5)').val("");
    $('#family #tabletr:eq('+i+') input:eq(5)').focus();
    return false;
    }
    else if(parseFloat(issueqty) > parseFloat(avail)){

    alert("Issue quantity can not exceed available quantity");
    $('#family #tabletr:eq('+i+') input:eq(5)').val("");
    $('#family #tabletr:eq('+i+') input:eq(5)').focus();
    return false;
    }

    }
    });
    });
    </script>

    <%
    request.setAttribute("requisitionids",listofstoreissue.getRequisitionIds());
         Long id=(Long)request.getSession().getAttribute("user");
                        String role= InjectorFactory.getInjector().getInstance(UserDao.class).findById(id).getRole().getName();
    %>
    <s:layout-render name="/layout/_base.jsp">
          <s:layout-component name="left-menu">

                 <ul >  <li>&nbsp;</li>
                      <li class="left_menu_heading">Stock Management</li>

                     <li style="margin-top:35px"><s:link beanclass="com.erp.action.GrnActionBean" event="addGrnLink">Create</s:link></li>
                    <%if(role.toLowerCase().contains("manager")){%>
                                        <li><s:link beanclass="com.erp.action.GrnActionBean" event="verify">Pending GRNS</s:link></li>
                                          <li><s:link beanclass="com.erp.action.GrnActionBean" event="ApprovedGrnByManager">Approved GRNS</s:link></li>
                                        <%}%>
                       <%if(role.toLowerCase().contains("superadmin")){%>
                                        <li><s:link beanclass="com.erp.action.GrnActionBean" event="verify">Pending GRNS(SM)</s:link></li>
                                         <li><s:link beanclass="com.erp.action.GrnActionBean" event="ApprovedGrnByManager">Approved GRNS(SM)</s:link></li>
                                        <li><s:link beanclass="com.erp.action.GrnActionBean" event="forAccountant">Pending GRNS(AM)</s:link></li>
                                         <li><s:link beanclass="com.erp.action.GrnActionBean" event="ApprovedGrnByAccountant">Approved GRNS(AM)</s:link></li>
                                        <%}%>
                  <li>   <s:link beanclass="com.erp.action.RequisitionActionBean" event="addRequisitionLink">Material Requisition</s:link>  </li>
                      <li><s:link beanclass="com.erp.action.StoreIssueActionBean" event="addStoreIssueLink">Issue</s:link>

                  </ul>

         </s:layout-component>
    <s:layout-component name="body">
        <s:form beanclass="com.erp.action.StoreIssueActionBean">
    <table  class="heading_table">
       <br>
    <tr>
    <td align="left" class="pageheading" valign="top">
     <div class="sub_heading">Add Store</div>
    </td>
    </tr>
   <%-- <tr valign="top"><td align="center" class="pageheading"><div class="msg"><s:messages/></div>
    </td>
    </tr>--%>

    </table>
    <table  class="second_table" ><tr><td width="21%">    <div class="msg"><s:messages/></div>
    <div align="left" style="margin-left: 1px;" class="labels">Please select Requisition Id <span style="color:#FF0000">*</span></div></td>
    <td width="21%" align="right" valign="top" >

    <s:select id="requisitionid" name="id" class="dropdown">
    <option  value="0">---Select Id---</option>
    <c:forEach items="${requisitionids}" var="requisition" varStatus="loop" >
    <c:choose>
    <c:when test="${actionBean.requisition.id eq requisition}">
    <option value ="<c:out value="${requisition}"/>" selected="selected"> <c:out value="${requisition}"/></option>
    </c:when>

    <c:otherwise>
    <option value ="${requisition}"><c:out value="${requisition}"/></option>
    </c:otherwise>
    </c:choose>


    </c:forEach>

    </s:select>

    </td>

    <td width="13%" align="left" valign="top" > <s:submit name="addStoreIssue" id="getstoreissuedetail" class="buttons" value="Get"/></td><td>&nbsp;</td>
    </tr>
    </s:form>
    <c:if test="${actionBean.requisition!=null}">
    <s:form beanclass="com.erp.action.StoreIssueActionBean">

   
    <tr>

    <td width="21%" align="right" valign="top"> <div align="right" style="margin-left: 2px;" class="labels">Name Of Contractor</div>     </td>
    <td width="21%" align="left" valign="top"><div align="left"><s:text name="requisition.nameOfContractor" readonly="readonly" class="textbox"></s:text></div> </td>
    <td width="13%" align="right" valign="top"><div align="left" style="margin-left: 2px;" class="labels">Name Of User</div></td>
    <td width="33%" align="right" valign="top"><s:text name="requisition.nameOfUser" readonly="readonly" class="textbox"></s:text>
    <s:hidden id="requisitionid" name="storeissue.requisition.id" value="${actionBean.requisition.id}" class="textbox"></s:hidden></td>

    <!--....................................................................................................................... -->
    <tr>
    <td colspan="4"><br><div align="left" style="margin-left:10px;">
  <table width="95%" border="0"  cellspacing="0" cellpadding="0"  align="left" id="family">
    <tr class="foreach_table">
    <td width="25%" class="foreach_table_firstth"><div align="center"><strong><span style="color:#3B3131;font-size:13px;font-weight:bold;" >Item name</span></strong></div></td>
    <td width="27%"  class="foreach_table_th"><div align="center"><strong><span style="color:#3B3131;font-size:13px;font-weight:bold;">Item Code</span></strong></div></td>
    <td width="22%"  class="foreach_table_th"><div align="center"><strong><span style="color:#3B3131;font-size:13px;font-weight:bold;">UoM</span></strong></div></td>
    <td width="26%"  class="foreach_table_th"><div align="center"><strong><span style="color:#3B3131;font-size:13px;font-weight:bold;">Available Qty</span></strong></div></td>
    <td width="26%"  class="foreach_table_th"><div align="center"><strong><span style="color:#3B3131;font-size:13px;font-weight:bold;">Required Qty</span></strong></div></td>
    <td width="26%"  class="foreach_table_th"><div align="center"><strong><span style="color:#3B3131;font-size:13px;font-weight:bold;">Issued Qty</span></strong></div></td>

    </tr>
    <c:forEach items="${actionBean.requisition.requisitiondetailarray}" var="requisitiondetailarray" varStatus="loop" >


    <tr id="tabletr">
    <td class="foreach_table_firstth">
    <div class="foreach_table_div">

    <s:text type="text" name="storeissuedetailarray123" readonly="readonly" value="${requisitiondetailarray.item.name}" id="itemcode${loop.index}" class="foreach_table_td" style=" width:200px;"  />


    </div></td>
     <td class="foreach_table_th"><div class="foreach_table_div">

    <s:text name="storeissuedetailarray[${loop.index}].item.name" readonly="readonly" value="${requisitiondetailarray.item.itemCode}" id="item${loop.index}" class="foreach_table_td"  style="width:100px;"  />
   </div></td>
    <td class="foreach_table_th"><div class="foreach_table_div">
    <s:text  name="storeissuedetailarray[${loop.index}].item.uom.name" readonly="readonly" id="uom${loop.index}" value="${requisitiondetailarray.item.uom.name}" class="foreach_table_td"  style="width:100px;"/>
    </div></td>
     <td class="foreach_table_th"><div class="foreach_table_div"><s:text  name="availableQuantity[${loop.index}]" id="availableQuantity${loop.index}" value="${requisitiondetailarray.availableQuantity}" readonly="readonly" class="foreach_table_td"  style="width:70px;"/>
    </div></td>
     <td class="foreach_table_th"><div class="foreach_table_div">
    <s:text  name="requisitiondetailarray[${loop.index}].requiredQty" readonly="readonly" value="${requisitiondetailarray.requiredQty}" class="foreach_table_td"  style="width:70px;"/>
    </div></td>
    <td class="foreach_table_th"><div class="foreach_table_div">
    <s:text  name="storeissuedetailarray[${loop.index}].issueQty" id="issueQty${loop.index}" onchange="return GetClosingQtyDetail(this);"  class="foreach_table_td"  style="width:70px;"/>
    <s:hidden name="storeissuedetailarray[${loop.index}].item.id"   value="${requisitiondetailarray.item.id}"></s:hidden>
    </div></td>

    </tr>             </c:forEach>
    </table>
    <tr>
    <td colspan="4" align="left" valign="top" >
    <s:hidden name="popup" value="pop"/>
    
    </td>
    </tr>
    </div></td>
    </tr>
    <tr>
    <td align="left">&nbsp;</td>
    <td align="left" colspan="3">&nbsp;</td>
    <td align="left">&nbsp;</td>
    </tr>
    <tr>
    <td align="left">&nbsp;</td>
    <td align="left" colspan="3"><s:submit name="addissue" class="buttons" id="addstoreissue" value="Add"></s:submit>
    &nbsp;&nbsp;&nbsp;&nbsp;
    <s:submit name="cancel" value="Cancel" class="buttons"></s:submit>

    </td>
    <td width="12%" align="left">&nbsp;</td>
    </tr>
   
    <!--............................................................................................................................. -->


    </table>
    </table>
    </s:form>
    </c:if>
    </s:layout-component>
    </s:layout-render>

