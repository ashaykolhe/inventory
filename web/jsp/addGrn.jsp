<%@ page import="com.erp.dao.UserDao" %>
<%@ page import="com.erp.guice.InjectorFactory" %>
<%--
Created by IntelliJ IDEA.
User: Minal
Date: Feb 20, 2012
Time: 3:55:31 PM
To change this template use File | Settings | File Templates.
--%>
<%@ include file="/includes/_taglibInclude.jsp" %>
<link rel="stylesheet" href="css/general.css" type="text/css" media="screen" />
<link rel="stylesheet" type="text/css" href="css/stylesheet.css"/>
<script type="text/javascript">

function GetItemDetail(button) {

var rowid=button.name.substring(button.name.indexOf("[")+1,button.name.indexOf("]"));
$.post('Grn.action?getItemDetails', {id:button.value}, function (data) {
var result=eval(data);
$('#item'+rowid+'').attr("value",result.itemCode);
$('#uom'+rowid+'').attr("value",result.uom.name);

});
return false;
}

function checkReceived(p){
var rowid=p.name.substring(p.name.indexOf("[")+1,p.name.indexOf("]"));
if(p.value!=0){
var chk = /^[0-9]+$/.test(p.value);
if (!chk) {
    alert('please Enter Numeric value');

    $('#receivedQty'+rowid+'').attr("value","");
    $('#receivedQty'+rowid+'').focus();
    return false;
}//end of chk loop
else if($('#receivedQty'+rowid+'').val().trim()!=""){

    if(parseFloat($('#receivedQty'+rowid+'').val())>parseFloat($('#ordqty'+rowid+'').val())){
        alert("Received quantity cannot be greater than ordered quantity.");
        $('#receivedQty'+rowid+'').focus();
        $('#receivedQty'+rowid+'').attr("value","");
        return false;
    }
    else if($('#accqty'+rowid+'').val().trim()!="")
    {
        if(parseFloat($('#accqty'+rowid+'').val())>parseFloat(p.value))
            alert("Accepted quantity can not be greater than received quantity")
        $('#accqty'+rowid+'').val("");
        $('#accqty'+rowid+'').focus();
    }

}


}//end of p.value!=0 if
else{
rowid;
alert("Please enter valid received Quantity");
$('#receivedQty'+rowid+'').attr("value","");
$('#receivedQty'+rowid+'').focus();
}



}
function calculateBalance(p,r,a){

var rowid=p.name.substring(p.name.indexOf("[")+1,p.name.indexOf("]"));

if(p.value!=0){
var chk = /^[0-9]+$/.test(p.value);
if (!chk) {
    alert('please Enter Numeric value');

    $('#accqty'+rowid+'').attr("value","");
    $('#accqty'+rowid+'').focus();
    return false;
}//end of chk loop
else if($('#accqty'+rowid+'').val().trim()!=""){

    if(parseFloat(p.value)>parseFloat(a)){
        alert("Accepted quantity cannot be greater than ordered quantity.");
        $('#accqty'+rowid+'').attr("value","");
        $('#family #tabletr:eq('+rowid+') input:eq(4)').focus();
        return false;
    }
    else if($('#receivedQty'+rowid+'').val()=="")
    {
        alert("enter received Qty");
        $('#receivedQty'+rowid+'').focus();

    }
    else if(parseFloat(p.value)>parseFloat($('#receivedQty'+rowid+'').val()))
        {
            alert("Accepted quantity can not be greater than Received Quantity")
            $('#accqty'+rowid+'').attr("value","");
            $('#family #tabletr:eq('+rowid+') input:eq(4)').focus();
        }
        else
            $('#value'+rowid+'').attr("value",parseFloat(p.value)*parseFloat(r));


}
else{
    alert("Please enter Accepted quantity");
    $('#accqty'+rowid+'').focus();
}//ennd of else
}//end of p.value!=0 if
else{
alert("Please enter valid Accepted Qty");
$('#accqty'+rowid+'').attr("value","");
$('#accqty'+rowid+'').focus();

}

}//end of function
$(document).ready(function(){

$("#getpurchaseorderbutton").click(function(){

if ($("#purchaseno").val()=="0"){
    alert("please select the purchase order no");

    return false;
}
});
$("#addgrn").click(function(){
var numeric = /^[0-9]+$/;
var count=$('#family #tabletr').length;
for(var i=0;i<count;i++){

    if($('#family #tabletr:eq('+i+') input:eq(9)').attr("value").trim()==""){
        alert("please enter received quantity");
        $('#family #tabletr:eq('+i+') input:eq(9)').focus();
        return false;
    }
    if($('#family #tabletr:eq('+i+') input:eq(10)').attr("value").trim()==""){
        alert("please enter accepted quantity");
        $('#family #tabletr:eq('+i+') input:eq(10)').focus();
        return false;
    }
}

   });

});

</script>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<s:useActionBean beanclass="com.erp.action.GrnActionBean" var="listofvendor" event="addGrnLink"></s:useActionBean>
<%
request.setAttribute("purchaseorderlst",listofvendor.getPurchaseorderlst());
    Long id=(Long)request.getSession().getAttribute("user");
                        String role= InjectorFactory.getInjector().getInstance(UserDao.class).findById(id).getRole().getName();
%>
<s:layout-render name="/layout/_base.jsp">
     <s:layout-component name="left-menu">

                 <ul >  <li>&nbsp;</li>
                      <li class="left_menu_heading1">Stock Management</li>

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
<s:form beanclass="com.erp.action.GrnActionBean">
<table  class="heading_table1" >
       <br>
    <tr>
    <td align="left" class="pageheading" valign="top">
     <div class="sub_heading">Add GRN </div>
    </td>
    </tr>
   <%-- <tr valign="top"><td align="center" class="pageheading"><div class="msg"><s:messages/></div>
    </td>
    </tr>--%>

    </table>
    <table  class="second_table1" ><tr><td>
<table width="100%" border="0" cellspacing="0" cellpadding="0"> <div class="msg"><s:messages/></div>
<tr>
<td width="16%" align="left" valign="top">
<div align="left" style="margin-left: 2px;" class="labels">
    <div align="right">Purchase Order<span style="color:#FF0000"> *</span></div>
</div></td>
<td width="21%" align="left" valign="top"><div align="left">
<s:select id="purchaseno"  name="iddrop" class="dropdown">
    <option  value="0">---Select Purchase Order No---</option>
    <c:forEach items="${purchaseorderlst}" var="purchaseorderloop" varStatus="loop" >
        <c:choose>
            <c:when test="${actionBean.purchaseOrder.id eq purchaseorderloop.id}">
                <option value ="<c:out value="${actionBean.purchaseOrder.id}"/>" selected="selected"> <c:out value="${actionBean.purchaseOrder.purchaseOrderNo}"/></option>
            </c:when>
            <c:otherwise>
                <option value ="<c:out value="${purchaseorderloop.id}"/>"> <c:out value="${purchaseorderloop.purchaseOrderNo}"/></option>
            </c:otherwise>
        </c:choose>
    </c:forEach>
</s:select>

</div></td>
<td width="15%"><s:submit name="getorderlstforgrn" class="buttons" id="getpurchaseorderbutton" value="Get"/></td>
<td width="48%">&nbsp;</td>
</tr>
</s:form>
<c:if test="${actionBean.purchaseOrder!=null}">
<s:form beanclass="com.erp.action.GrnActionBean">
<tr>
<td width="16%" align="left" valign="top">
    <div align="left" style="margin-left: 15px;" class="labels">
        <div align="right">Vendor Name</div>
    </div></td>
<td valign="top"><div align="left">
    <s:text name="gr" value="${actionBean.purchaseOrder.vendor.name}" readonly="readonly" class="textbox"></s:text>
    <s:hidden  name="grn.purchaseOrder.id" value="${actionBean.purchaseOrder.id}" class="textbox"></s:hidden>
    <s:hidden  name="grn.orderNo" value="${actionBean.purchaseOrder.purchaseOrderNo}" class="textbox"></s:hidden>
</div></td>
<td>	<div align="left" style="margin-left: 15px;" class="labels">
    <div align="right">Order Date</div>
</div></td>
<td valign="top"><div align="left">
    <s:text name="grn.orderDate" readonly="readonly" value="${actionBean.purchaseOrder.createDate}"  class="textbox"></s:text>
</div></td>
</tr>

<tr>
<td width="16%" align="left" valign="top">
    <div align="left" style="margin-left: 15px;" class="labels">
        <div align="right">Challan No</div>
    </div></td>
<td valign="top"><div align="left">
    <s:text name="grn.challanNo" class="textbox"></s:text>
</div></td>
<td>	<div align="left" style="margin-left: 15px;" class="labels">
    <div align="right">Challan Date</div>
</div></td>
<td valign="top"><div align="left">
    <s:text name="grn.challanDate" readonly="readonly" onFocus="showCalendarControl(this);" class="textbox"></s:text>
</div></td>
</tr>

<tr>
<td width="16%" align="left" valign="top">
    <div align="left" style="margin-left: 15px;" class="labels">
        <div align="right">Bill No</div>
    </div></td>
<td valign="top"><div align="left">
    <s:text name="grn.billNo" class="textbox">

    </s:text>
</div></td>
<td>	<div align="left" style="margin-left: 15px;" class="labels">
    <div align="right">Bill Date</div>
</div></td>
<td valign="top"><div align="left">
    <s:text name="grn.billDate" readonly="readonly" onFocus="showCalendarControl(this);" class="textbox"></s:text>
</div></td>
</tr>

<tr>
<td width="16%" align="left" valign="top">
    <div align="left" style="margin-left: 15px;" class="labels">
        <div align="right">Bill Value</div>
    </div></td>
<td valign="top"><div align="left">
    <s:text name="grn.billValue" class="textbox"></s:text>
    <s:hidden name="grn.verified" value="N"/><s:hidden name="grn.paymentStatus" value="Requested"/>
</div></td>
<td>	<div align="left" style="margin-left: 15px;" class="labels">
    <div align="right">Truck No</div>
</div></td>
<td valign="top"><div align="left">
    <s:text name="grn.truckNo" class="textbox"></s:text>   <s:hidden name="grn.deleted" value="0"/>
</div></td>
</tr>
<tr>
<td colspan="4"><br><div align="left" style="margin-left:10px;">
    <table width="98%" border="0" cellspacing="0" cellpadding="0"  align="left" id="family">
        <tr class="foreach_table">
            <td width="20%" class="foreach_table_firstth"><div align="center"><span class="foreach_th_span">Item name</span></div></td>
            <td width="12%"  class="foreach_table_th"><div align="center"><span class="foreach_th_span">Item Code</span></div></td>
            <td width="7%"  class="foreach_table_th"><div align="center"><span class="foreach_th_span">UoM</span></div></td>
            <td width="10%"  class="foreach_table_th"><div align="center"><span class="foreach_th_span">OrdQty</span></div></td>
            <td width="10%"  class="foreach_table_th"><div align="center"><span class="foreach_th_span">Rate/Qty</span></div></td>
             <td width="10%"  class="foreach_table_th"><div align="center"><span class="foreach_th_span">Make</span></div></td>
             <td width="10%"  class="foreach_table_th"><div align="center"><span class="foreach_th_span">Specification</span></div></td>
            <td width="10%"  class="foreach_table_th"><div align="center"><span class="foreach_th_span">ChallanQty</span></div></td>
            <td width="10%"  class="foreach_table_th"><div align="center"><span class="foreach_th_span">ReceivedQty</span></div></td>
            <td width="10%"  class="foreach_table_th"><div align="center"><span class="foreach_th_span">AcceptedQty</span></div></td>

            <td width="10%"  class="foreach_table_th"><div align="center"><span class="foreach_th_span">Value</span></div></td>
            <td width="8%"  class="foreach_table_th"><div align="center"><span class="foreach_th_span">Remarks</span></div></td>
        </tr>

        <c:forEach items="${actionBean.purchaseOrder.purchasedetailarray}" var="grndetailarray" varStatus="loop" >
             <tr id="tabletr" >
    <td class="foreach_table_firstth">
    <div class="foreach_table_div">
                      <s:text type="text" name="grndetailarray1" readonly="readonly" value="${grndetailarray.item.name}" id="itemcode${loop.index}" class="foreach_table_td" style="width:90px; "  />
                        <s:hidden name="grndetailarray[${loop.index}].item.id"   value="${grndetailarray.item.id}"></s:hidden>

                        </div></td>
              <td class="foreach_table_th"><div class="foreach_table_div">
                        <s:text type="text" name="itemNamefor" readonly="readonly" value="${grndetailarray.item.itemCode}" id="item${loop.index}" class="foreach_table_td" style="width:90px; "  />
                    </div></td>
                <td class="foreach_table_th"><div class="foreach_table_div">
                            <s:text  name="uomfor" id="uom${loop.index}" readonly="readonly" value="${grndetailarray.item.uom.name}" class="foreach_table_td" style="width:90px; "/>
                        </div></td>
                 <td class="foreach_table_th"><div class="foreach_table_div">
                     <s:text  name="grndetailarray[${loop.index}].orderedQty" id="ordqty${loop.index}" readonly="readonly" value="${grndetailarray.orderedQty}" class="foreach_table_td" style="width :60px; "/>
                        </div></td>
                <td class="foreach_table_th"><div class="foreach_table_div">
                            <s:text name="rate" readonly="readonly" value="${grndetailarray.rate}" class="foreach_table_td" style="width:60px; "/>

                        </div></td>
                  <td class="foreach_table_th"><div class="foreach_table_div">
                            <s:text name="rate" readonly="readonly" value="${grndetailarray.make}" class="foreach_table_td" style="width:60px; "/>

                        </div></td>
                  <td class="foreach_table_th"><div class="foreach_table_div">
                            <s:text name="rate" readonly="readonly" value="${grndetailarray.specification}" class="foreach_table_td" style="width:60px; "/>

                        </div></td>
              <td class="foreach_table_th"><div class="foreach_table_div">
                            <s:text  name="grndetailarray[${loop.index}].challanQty" class="foreach_table_td" style="width :60px; "/>
                        </div></td>
               <td class="foreach_table_th"><div class="foreach_table_div">
                            <s:text  name="grndetailarray[${loop.index}].receivedQty" id="receivedQty${loop.index}" onchange="return checkReceived(this)" class="foreach_table_td" style="width :60px; "/>
                        </div></td>
              <td class="foreach_table_th"><div class="foreach_table_div">
                            <s:text  id="accqty${loop.index}"  name="grndetailarray[${loop.index}].acceptedQty" onchange="return calculateBalance(this,${grndetailarray.rate},${grndetailarray.orderedQty})" class="foreach_table_td"  style="width:60px; "/>

                        </div></td>
               <td class="foreach_table_th"><div class="foreach_table_div">
                    <s:text readonly="readonly"  name="grndetailarray[${loop.index}].value" id="value${loop.index}" class="foreach_table_td" style="width :60px;"/>
                </div></td>
               <td class="foreach_table_th"><div class="foreach_table_div">
                    <s:text  name="grndetailarray[${loop.index}].remark" class="foreach_table_td"  style="width:100px; "/>
                </div></td>
            </tr>             </c:forEach>

    </table>

</div></td>
</tr>
<tr>
<td align="left">&nbsp;</td>
<td align="left" colspan="3">&nbsp;</td>
<td align="left">&nbsp;</td>
</tr>
<%-- <tr>
<td align="right" valign="top"><div align="right" style="margin-left: 2px;" class="labels">Status<span style="color:#FF0000"> *</span></div></td>
<td colspan="2" align="left" valign="top" class="labels"><div align="left">
    <s:radio  value="open" id="radio1"  name="grn.status"></s:radio>
    Open&nbsp;
    <s:radio  value="close" id="radio2"   name="grn.status"></s:radio>
    Close</div></td>


</tr>--%>

<tr>
<td align="left">&nbsp;<s:hidden name="grn.status" value="close"></s:hidden></td>
<td align="left" colspan="3">&nbsp;</td>
<td align="left">&nbsp;</td>
</tr>
<tr>
<td align="left">&nbsp;</td>
<td align="left" colspan="3"><div align="left" style="margin-left:20px"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <s:submit name="addGrn" value="Add" id="addgrn" class="buttons"></s:submit>
    &nbsp;&nbsp;&nbsp;&nbsp;
    <input type="reset"  value="Reset" name="reset"  class="buttons"/>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <s:submit name="cancel" value="Cancel" class="buttons"></s:submit>
</div></td>
<td width="3%" align="left">&nbsp;</td>
</tr> </s:form> </c:if>
</table></td></tr></table>
</s:layout-component>
</s:layout-render>
