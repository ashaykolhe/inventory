    <%--
    Created by IntelliJ IDEA.
    User: Admin
    Date: Apr 18, 2012
    Time: 10:59:36 AM
    To change this template use File | Settings | File Templates.
    --%>
    <%@ include file="/includes/_taglibInclude.jsp" %>
    <link rel="stylesheet" href="css/general.css" type="text/css" media="screen" />
    <link rel="stylesheet" type="text/css" href="css/stylesheet.css"/>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>


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
    <s:useActionBean beanclass="com.erp.action.StoreIssueActionBean" var="listofstoreissue" event="redirectLink"></s:useActionBean>
    <%

    request.setAttribute("itemidlst",listofstoreissue.getItemidlst());
    request.setAttribute("requisition",listofstoreissue.getRequisition());
    %>

    <s:layout-render name="/layout/_base.jsp">
    <s:layout-component name="body">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" >
    <tr valign="top"><td >&nbsp;
    </td></tr>
    <tr><td align="left" class="pageheading" valign="top">
    Store Issue
    </td></tr>
    <tr valign="top"><td align="center"><div class="msg"><s:messages/></div>
    </td></tr>
    </table>



    <s:form beanclass="com.erp.action.StoreIssueActionBean">

    <table border="1" width="70%" bgcolor="#FCFCFC" ><tr><td>
    <table width="100%" border="0" cellspacing="1" bordercolor="#FCFCFC">

    <tr>

    <td width="22%" align="right" valign="top"> <div align="right" style="margin-left: 2px;" class="labels">Name Of User</div>     </td>
    <td width="17%" align="left" valign="top"><div align="left"><s:text name="requisition.nameOfUser" readonly="readonly" class="textbox"></s:text></div> </td>
    <td width="14%" align="right" valign="top"><div align="right" style="margin-left: 2px;" class="labels">Requisition id</div></td>
    <td width="31%" align="right" valign="top"><s:text name="storeissue.requisition.id" readonly="readonly" class="textbox" value="${requisition.id}" ></s:text>
    <s:hidden id="requisitionid" name="storeissue.requisition.id" value="${actionBean.requisition.id}" class="textbox"></s:hidden></td>

    <!--....................................................................................................................... -->
    <tr>
    <td colspan="4"><br><div align="left" style="margin-left:10px;">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" style="border:1px solid #000000;" align="left" id="family">
    <tr>
    <td width="25%" height="28px" style="border-right:1px solid #000000;background:#FFCC66;"><div align="center"><strong><span style="color:#3B3131;font-size:13px;font-weight:bold;" >Item name</span></strong></div></td>
    <td width="27%"  style="border-right:1px solid #000000; background:#FFCC66;"><div align="center"><strong><span style="color:#3B3131;font-size:13px;font-weight:bold;">Item Code</span></strong></div></td>
    <td width="22%"  style=" border-right:1px solid #000000;background:#FFCC66;"><div align="center"><strong><span style="color:#3B3131;font-size:13px;font-weight:bold;">Uom</span></strong></div></td>
    <td width="26%"  style=" border-right:1px solid #000000;background:#FFCC66;"><div align="center"><strong><span style="color:#3B3131;font-size:13px;font-weight:bold;">Available Quantity</span></strong></div></td>
    <td width="26%"  style=" border-right:1px solid #000000;background:#FFCC66;"><div align="center"><strong><span style="color:#3B3131;font-size:13px;font-weight:bold;">Requested Qty</span></strong></div></td>
    <td width="26%"  style=" border-right:1px solid #000000;background:#FFCC66;"><div align="center"><strong><span style="color:#3B3131;font-size:13px;font-weight:bold;">Issued Qty</span></strong></div></td>

    </tr>
    <c:forEach items="${requisition.requisitiondetailarray}" var="requisitiondetailarray" varStatus="loop" >


    <tr id="tabletr">
    <td style="border-top:1px solid #000000;border-right:1px solid #000000;">
    <div align="left" style="margin-left:4px;">
    <div align="right">
    <s:text type="text" name="storeissuedetailarray123" readonly="readonly" value="${requisitiondetailarray.item.name}" id="itemcode${loop.index}" class="hello" style="text-align:right;margin-right:2px; width:90px; "  />

    </div></div></td>
    <td style="border-top:1px solid #000000;border-right:1px solid #000000;"><div align="left" style="margin-left:4px;">
    <div align="right">
    <s:text name="storeissuedetailarray[${loop.index}].item.name" readonly="readonly" value="${requisitiondetailarray.item.itemCode}" id="item${loop.index}" class="hello" style="text-align:right;margin-right:2px; width:90px; "  />
    </div></div></td>
    <td style="border-top:1px solid #000000;border-right:1px solid #000000;">
    <div align="left" style="margin-left:4px;">
    <div align="right">
    <s:text  name="storeissuedetailarray[${loop.index}].item.uom.name" readonly="readonly" id="uom${loop.index}" value="${requisitiondetailarray.item.uom.name}" style="text-align:right;margin-right:2px;width:100px; "/>
    </div></div></td>
    <td style="border-top:1px solid #000000;border-right:1px solid #000000;">
    <div align="left" style="margin-left:4px;">
    <div align="right">
    <s:text  name="availableQuantity[${loop.index}]" id="availableQuantity${loop.index}" value="${requisitiondetailarray.availableQuantity}" readonly="readonly" style="text-align:right;margin-right:2px;width:100px; "/>
    </div></div></td>
    <td style="border-top:1px solid #000000;border-right:1px solid #000000;">
    <div align="left" style="margin-left:4px;">
    <div align="right">
    <s:text  name="requisitiondetailarray[${loop.index}].requiredQty" readonly="readonly" value="${requisitiondetailarray.requiredQty}" style="text-align:right;margin-right:2px;width:100px; "/>
    </div></div></td>
    <td style="border-top:1px solid #000000;border-right:1px solid #000000;">
    <div align="left" style="margin-left:4px;">
    <div align="right">
    <s:text  name="storeissuedetailarray[${loop.index}].issueQty" id="issueQty${loop.index}" onchange="return GetClosingQtyDetail(this);"  style="text-align:right;margin-right:2px;width:100px; "/>
    <s:hidden name="storeissuedetailarray[${loop.index}].item.id"   value="${requisitiondetailarray.item.id}"></s:hidden>
    </div></div></td>

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
    <td align="left" colspan="3"><s:submit name="addissuebyreq" id="addstoreissue" value="Add"></s:submit>
    &nbsp;&nbsp;&nbsp;&nbsp;
    <s:submit name="cancel" value="Cancel"></s:submit>

    </td>
    <td width="16%" align="left">&nbsp;</td>
    </tr>
    </table></td></tr>
    <!--............................................................................................................................. -->


    </table>
    </table>
    </s:form>

    </s:layout-component>
    </s:layout-render>
