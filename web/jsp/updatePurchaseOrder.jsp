    <%--
    Created by IntelliJ IDEA.
    User: Admin
    Date: Mar 1, 2012
    Time: 3:44:59 PM
    To change this template use File | Settings | File Templates.
    --%>
    <%@ include file="/includes/_taglibInclude.jsp" %>
    <link rel="stylesheet" href="css/general.css" type="text/css" media="screen" />
    <link rel="stylesheet" type="text/css" href="css/stylesheet.css"/>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>

    <script type="text/javascript">

    function GetItemDetail(button){

    var count=$('#family #tabletr').length;
    var rowid=button.name.substring(button.name.indexOf("[")+1,button.name.indexOf("]"));
    var flag=true;
    var check=$('#itemcode'+rowid+'').val();

    for(var i=0;i<=count;i++)
    {
    if(rowid==i){
    continue;
    }
    var temp=$('#itemcode'+i+'').val();

    if(check==temp)
    {
    flag=false;

    //  -- rowid;
    //  --i;
    alert("This Item has been already added. Please select another item.");
    $('#family #tabletr:eq('+rowid+') select:eq(0)').attr("value","0");
    $('#family #tabletr:eq('+rowid+') input').removeAttr("value");
    return false;
    }//end of if
    }//end of for
    if(flag)
    {
    $.post('PurchaseOrder.action?getItemDetails', {id:button.value}, function (data) {
    var result=eval(data);
    $('#item'+rowid+'').attr("value",result.itemCode);
    $('#uom'+rowid+'').attr("value",result.uom.name);
    });//end of post funtion
    }//end of flag==true if
    } //end of getItem Funntion
    /*the function calculateBalance is use to validate rate textfiled for numeric as well as blank
    this function is called onChange of rate textfield  */
    function calculateBalance(p,i){

    var rowid=p.name.substring(p.name.indexOf("[")+1,p.name.indexOf("]"));

    if(p.value!=0){
    var chk = /^[0-9]+$/.test(p.value);
    if (!chk) {
    alert('please Enter Numeric value for rate');
    rowid;
    $('#family #tabletr:eq('+rowid+') input:eq(6)').val("");
    $('#family #tabletr:eq('+rowid+') input:eq(7)').val("");
    $('#family #tabletr:eq('+rowid+') input:eq(6)').focus();
    }//end of chk loop
    else if($('#ordqty'+rowid+'').val().trim()!=""){
    var ordqty=$('#ordqty'+rowid+'').val();
    var valueset=parseFloat(p.value)*parseFloat(ordqty);
    $('#amount'+rowid+'').attr("value",valueset);
    }//end of else if loop
    else{
    rowid;
    alert("Please enter order quantity");
    $('#family #tabletr:eq('+rowid+') input:eq(5)').focus();
    }//ennd of else
    }//end of p.value!=0 if
    else{
    rowid;
    alert("Please enter valid rate");
    $('#family #tabletr:eq('+rowid+') input:eq(6)').val("");
    $('#family #tabletr:eq('+rowid+') input:eq(7)').val("");
    $('#family #tabletr:eq('+rowid+') input:eq(6)').focus();
    }

    }//end of function
    /*the function calculateBalancechangeorder is use to validate quantity textfiled for numeric as well as blank
    this function is called onChange of quantity  textfield  */
    function calculateBalancechaneorder(p,i){
    var rowid=p.name.substring(p.name.indexOf("[")+1,p.name.indexOf("]"));

    if(p.value!=0){
    var chk = /^[0-9]+$/.test(p.value);
    if (!chk) {

    alert('please Enter Numeric value for Order Quantity');
    $('#family #tabletr:eq('+rowid+') input:eq(5)').val("");
    $('#family #tabletr:eq('+rowid+') input:eq(7)').val("");
    $('#family #tabletr:eq('+rowid+') input:eq(5)').focus();
    }
    else if($('#rate'+rowid+'').val().trim()!=""){
    var rate=$('#rate'+rowid+'').val();
    var valueset=parseFloat(p.value)*parseFloat(rate);
    $('#amount'+rowid+'').attr("value",valueset);
    }
    }
    else{

    alert("Please enter valid Quantity");
    $('#family #tabletr:eq('+i+') input:eq(5)').val("");
    $('#family #tabletr:eq('+i+') input:eq(7)').val("");
    $('#family #tabletr:eq('+i+') input:eq(5)').focus();
    }
    }//end of function

    function deletethis(p,a){
    var tr=$('#family #tabletr').length;
    if(tr==1){
    alert("You can not delete the last row.");
    }
    else{
    var count=$('#family #tabletr').length;
    var rowid=p.name.substring(p.name.indexOf("[")+1,p.name.indexOf("]"));
    $('#family #tabletr:eq('+rowid+') input').removeAttr("value");
    $('#family #tabletr:eq('+rowid+') select:eq(0)').attr("value","0");
    }
    }
    $(document).ready(function(){

    $("#updatepopreview").click(function(){
    var numeric = /^[0-9]+$/;
    var count=$('#family #tabletr').length;
    if($('#vendorName').com){
    alert("please select Vendor Name");
    $('#vendorName').focus();
    return false;
    }

    for(var i=0;i<count;i++){


    if($('#family #tabletr:eq('+i+') select:eq(0)').attr("value")!="0"){
    if($('#family #tabletr:eq('+i+') input:eq(5)').attr("value").trim()=="" || $('#family #tabletr:eq('+i+') input:eq(5)').attr("value").trim()=="0"){

    $('#family #tabletr:eq('+i+') input:eq(5)').focus();
    alert("please enter ordered  quantity");
    return false;
    }
    else if($('#family #tabletr:eq('+i+') input:eq(6)').attr("value").trim()=="" || $('#family #tabletr:eq('+i+') input:eq(6)').attr("value").trim()=="0"){

    $('#family #tabletr:eq('+i+') input:eq(4)').focus();
    alert("please enter  rate");
    return false;
    }
    }
    }


    return true;
    });
    $('#add').click(function(){
    var count=$('#family #tabletr').length;
    $('#family #tabletr:last').clone(true).insertAfter('#family #tabletr:last');
    $('#family #tabletr:last select:eq(0)').attr("value","0");
    $('#family #tabletr:last input').removeAttr("value");
    $('#family #tabletr:last select:eq(0)').attr("name","purchasedetailarray["+count+"].item.id");
    $('#family #tabletr:last select:eq(0)').attr("id","itemcode"+count);
    $('#family #tabletr:last input:eq(0)').attr("id","item"+count);
    $('#family #tabletr:last input:eq(1)').attr("id","uom"+count);
    $('#family #tabletr:last input:eq(2)').attr("name","purchasedetailarray["+count+"].description");
         $('#family #tabletr:last input:eq(3)').attr("name","purchasedetailarray["+count+"].make");
         $('#family #tabletr:last input:eq(4)').attr("name","purchasedetailarray["+count+"].specification");
    $('#family #tabletr:last input:eq(5)').attr("name","purchasedetailarray["+count+"].orderedQty");
    $('#family #tabletr:last input:eq(5)').attr("id","ordqty"+count);
    $('#family #tabletr:last input:eq(6)').attr("name","purchasedetailarray["+count+"].rate");
    $('#family #tabletr:last input:eq(6)').attr("id","rate"+count);
    $('#family #tabletr:last input:eq(7)').attr("name","purchasedetailarray["+count+"].amount");
    $('#family #tabletr:last input:eq(7)').attr("id","amount"+count);
    $('#family #tabletr:last input:eq(8)').attr("name","delete["+count+"]");
    $('#family #tabletr:last input:eq(8)').attr("id","delete"+count);

    });
    });
    </script>
    <s:useActionBean beanclass="com.erp.action.PurchaseOrderActionBean" var="listofpo" event="updatePOLink"></s:useActionBean>
    <%
    request.setAttribute("vendorlst",listofpo.getVendorlst());
    request.setAttribute("itemidlst",listofpo.getItemidlst());

    %>

      <s:layout-render name="/layout/_base.jsp">
         <s:layout-component name="body">
     <table  class="heading_table">
       <br>
    <tr>
    <td align="left" class="pageheading" valign="top">
     <div class="sub_heading">Preview Purchase Order</div>
    </td>
    </tr>
  <%--  <tr valign="top"><td align="center"><div class="msg"><s:messages/></div>
    </td>
    </tr>--%>

    </table>

    <c:if test="${actionBean.purchaseOrder!=null}">
        <s:form beanclass="com.erp.action.PurchaseOrderActionBean">
               <table  class="second_table" ><tr><td>
        
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <div class="msg"><s:messages/></div>
    <tr>
    <td width="16%" align="left" valign="top">
    <div align="left" style="margin-left: 2px;" class="labels">
    <div align="right">Name of Supplier<span style="color:#FF0000"> *</span></div>
    </div></td>
    <td width="21%" align="left" valign="top"><div align="left">
    <s:select id="vendorName" name="purchaseOrder.vendor.id" class="dropdown">
    <option  value="0">---Select Vendor---</option>
    <c:forEach items="${vendorlst}" var="vendor" varStatus="loop" >
    <c:choose>
    <c:when test="${actionBean.purchaseOrder.vendor.id eq vendor.id}">
    <option value ="<c:out value="${actionBean.purchaseOrder.vendor.id}"/>" selected="selected"> <c:out value="${actionBean.purchaseOrder.vendor.name}"/></option>
    </c:when>

    <c:otherwise>
    <option value ="${vendor.id}"><c:out value="${vendor.name}"/></option>
    </c:otherwise>
    </c:choose>

    </c:forEach>

    </s:select>

    </div></td>
    <td width="15%">&nbsp;<s:hidden name="purchaseOrder.deleted" value="0"/><s:hidden name="purchaseOrder.status" value="open"/></td>
    <s:hidden id="id" name="id" value="${actionBean.id}" class="textbox"></s:hidden>
    <td width="48%">&nbsp;<s:hidden id="purchaseOrderid" name="purchaseOrder.id" value="${actionBean.purchaseOrder.id}" class="textbox"></s:hidden></td>
    <td width="48%">&nbsp;<s:hidden id="purchaseOrderno" name="purchaseOrder.purchaseOrderNo" value="${actionBean.purchaseOrder.purchaseOrderNo}" class="textbox"></s:hidden></td>


    </tr>
    <tr>
    <td colspan="4"><br><div align="left" style="margin-left:10px;">
   <table width="95%" border="0"  cellspacing="0" cellpadding="0"  align="left" id="family">
    <tr class="foreach_table">
    <td width="14%" class="foreach_table_firstth"><div align="center"><span class="foreach_th_span">Item name</span></div></td>
    <td width="22%"  class="foreach_table_th"><div align="center"><span class="foreach_th_span">Item Code</span></div></td>
    <td width="9%"  class="foreach_table_th"><div align="center"><span class="foreach_th_span">UoM</span></div></td>
    <td width="12%"  class="foreach_table_th"><div align="center"><span class="foreach_th_span">Description</span></div></td>
           <td width="12%"  class="foreach_table_th"><div align="center"><span class="foreach_th_span">Make</span></div></td>
        <td width="12%"  class="foreach_table_th"><div align="center"><span class="foreach_th_span">Specification</span></div></td>
    <td width="13%"  class="foreach_table_th"><div align="center"><span class="foreach_th_span">Ordered Qty</span></div></td>
    <td width="12%"  class="foreach_table_th"><div align="center"><span class="foreach_th_span">Rate</span></div></td>
    <td width="5%"  class="foreach_table_th"><div align="center"><span class="foreach_th_span">Amount</span></div></td>
    <td width="2%"  class="foreach_table_th"><div align="center"><span class="foreach_th_span"><img src="images/delete.jpg"></span></div></td>
    </tr>
    <c:forEach items="${actionBean.purchaseOrder.purchasedetailarray}" var="purchasedetailarray" varStatus="loop" >
    <tr id="tabletr">
    <td class="foreach_table_firstth">
    <div align="left" style="margin-left:4px;">
    <div align="right">
    <s:select id="itemcode${loop.index}" class="dropdowntable" name="purchasedetailarray[${loop.index}].item.id"  onchange= "return GetItemDetail(this);">
    <option  value="0">---Select Item---</option>
    <c:forEach items="${itemidlst}" var="itemidloop" >
    <c:choose>
    <c:when test="${purchasedetailarray.item.id eq itemidloop.id}">
    <option value ="<c:out value="${purchasedetailarray.item.id}"/>" selected="selected"> <c:out value="${purchasedetailarray.item.name}"/></option>
    </c:when>

    <c:otherwise>
    <option value ="${itemidloop.id}"><c:out value="${itemidloop.name}"/></option>
    </c:otherwise>
    </c:choose>


    </c:forEach>

    </s:select>
    <%--               <c:set var="newIndex" value="${loop.index + 1}" scope="page"/>--%>
    </div></div></td>
   <td class="foreach_table_th"><div align="left" style="margin-left:4px;">
    <div align="right">
    <s:text readonly="readonly" type="text" name="purchasedetailarray[${loop.index}].item.itemCode" value="${purchasedetailarray.item.itemCode}" id="item${loop.index}" class="foreach_table_td" style="width:90px; "  />
    </div></div></td>
    <td class="foreach_table_th">
     <div class="foreach_table_div">
    <div align="right">
    <s:text readonly="readonly"  name="purchasedetailarray[${loop.index}].item.uom.name" id="uom${loop.index}" value="${purchasedetailarray.item.uom.name}" class="foreach_table_td" style="width:70px; "/>
    </div></div></td>
    <td class="foreach_table_th">
    <div class="foreach_table_div">
    <div align="right">
    <s:text  name="purchasedetailarray[${loop.index}].description" value="${purchasedetailarray.description}" class="foreach_table_td" style="width:70px; "/>
    </div></div></td>

         
              <td class="foreach_table_th">
   <div class="foreach_table_div">
    <div align="right">
    <s:text  name="purchasedetailarray[${loop.index}].make" value="${purchasedetailarray.make}" class="foreach_table_td" style="width:70px; "/>
    </div></div></td>
              <td class="foreach_table_th">
   <div class="foreach_table_div">
    <div align="right">
    <s:text  name="purchasedetailarray[${loop.index}].specification" value="${purchasedetailarray.specification}" class="foreach_table_td" style="width:70px; "/>
    </div></div></td>
    <td class="foreach_table_th">
     <div class="foreach_table_div">
    <div align="right">
    <s:text  name="purchasedetailarray[${loop.index}].orderedQty" value="${purchasedetailarray.orderedQty}" id="ordqty${loop.index}" onchange="return calculateBalancechaneorder(this,${loop.index})"  class="foreach_table_td" style="width:70px; "/>
    </div></div></td>
   <td class="foreach_table_th">
     <div class="foreach_table_div">
    <div align="right">
    <s:text  name="purchasedetailarray[${loop.index}].rate" value="${purchasedetailarray.rate}"  id="rate${loop.index}" class="foreach_table_td" style="width:70px; " onchange="return calculateBalance(this,${loop.index})"/>
    </div></div></td>
   <td class="foreach_table_th"> <div class="foreach_table_div"> <div align="right">
    <s:text readonly="readonly"  name="purchasedetailarray[${loop.index}].amount" value="${purchasedetailarray.amount}" id="amount${loop.index}"  class="foreach_table_td" style="width:70px; "/>
    </div></div></td>
   <td class="foreach_table_th">
    <div class="foreach_table_div">
    <div align="right">
    <s:text name="delete[${loop.index}]"   id="delete${loop.index}"  style="background-image:url('images/delete.jpg');border :none;cursor:auto;width :18px"    onclick="return deletethis(this)"/>

    </div></div></td>

    </tr>             </c:forEach>
    </table>
    <tr><td colspan="4">
     <div style="text-align:right; cursor: pointer;" class="links"><span style="vertical-align: top;text-align: left; " class="addRow" id="add" >Add row</span></div>
    </td></tr>
    </div></td>
    </tr>
    <tr>
    <td align="left">&nbsp;</td>
    <td align="left" colspan="3">&nbsp;</td>
    <td align="left">&nbsp;</td>
    </tr>
    <tr>
    <td align="left">&nbsp;</td>
    <td align="left" colspan="3"><div align="left" style="margin-left:20px"> &nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;
    <s:submit name="updatePurchaseOrder" value="Preview" class="buttons" id="updatepopreview"></s:submit>

    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <s:submit name="cancel" value="Cancel" class="buttons"></s:submit>
    </div></td>
    <td width="3%" align="left">&nbsp;</td>
    </tr>
    </table></td></tr></table></s:form>   </c:if>
   </s:layout-component></s:layout-render>
