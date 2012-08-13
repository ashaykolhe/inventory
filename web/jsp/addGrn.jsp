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
    function add()
    {
//                               alert($('#family').html());
//           alert(global);
        var faq = new Array(global);
    for(var i=0;i<global;i++){

        faq[i]=new Array(global);
//            alert($('#family .tabletr'+i+' input:eq(0)').attr("value"));
//            alert($('#family .tabletr'+i+' input:eq(0)').attr("value"));
        faq[i][0]=$('#family .tabletr'+i+' input:eq(13)').attr("value");
         $('#itemid'+i).attr("value",$('#family .tabletr'+i+' input:eq(13)').attr("value"));
//            document.getElementById("#itemid"+i).value=$('#family .tabletr'+i+' input:eq(13)').attr("value");
          faq[i][1]=$('#family .tabletr'+i+' input:eq(0)').attr("value");
//            alert("adsfasfs"+faq[i][1]);
//            $('#orderedQty'+i).attr("value",$('#family .tabletr'+i+' input:eq(3)').attr("value"));
          faq[i][2]=$('#family .tabletr'+i+' input:eq(1)').attr("value");
//            alert("adsfasfs2222"+faq[i][2]);
//            alert("adsfasfs"+('#family .tabletr'+i+' input:eq(1)').attr("value"));
//             $('#rate'+i).attr("value",$('#family .tabletr'+i+' input:eq(4)').attr("value"));
          faq[i][3]=$('#family .tabletr'+i+' input:eq(2)').attr("value");
//            alert("adsfasfs3333"+faq[i][3]);
//             $('#challanQty'+i).attr("value",$('#family .tabletr'+i+' input:eq(5)').attr("value"));
          faq[i][4]=$('#family .tabletr'+i+' input:eq(3)').attr("value");
//            alert("adsfasfs444"+faq[i][4]);
//             $('#receivedQty'+i).attr("value",$('#family .tabletr'+i+' input:eq(6)').attr("value"));
          faq[i][5]=$('#family .tabletr'+i+' input:eq(4)').attr("value");
//            alert("adsfasfs5555"+faq[i][5]);
//             $('#accqty'+i).attr("value",$('#family .tabletr'+i+' input:eq(7)').attr("value"));
          faq[i][6]=$('#family .tabletr'+i+' input:eq(5)').attr("value");
//            alert("adsfasfs666"+faq[i][6]);
//             $('#value'+i).attr("value",$('#family .tabletr'+i+' input:eq(8)').attr("value"));
          faq[i][7]=$('#family .tabletr'+i+' input:eq(6)').attr("value");
//            alert("adsfasfs777"+faq[i][7]);
//             $('#batchNumber'+i).attr("value",$('#family .tabletr'+i+' input:eq(9)').attr("value"));
          faq[i][8]=$('#family .tabletr'+i+' input:eq(7)').attr("value");
//            alert("adsfasfs88888"+faq[i][8]);
//             $('#date'+i).attr("value",$('#family .tabletr'+i+' input:eq(10)').attr("value"));
          faq[i][9]=$('#family .tabletr'+i+' input:eq(8)').attr("value");
//            alert("adsfasfs999"+faq[i][9]);
//             $('#remark'+i).attr("value",$('#family .tabletr'+i+' input:eq(11)').attr("value"));
          faq[i][10]=$('#family .tabletr'+i+' input:eq(9)').attr("value");
//            alert("adsfasfs10"+faq[i][10]);
//             $('itemid'+i).attr("value",$('#family .tabletr'+i+' input:eq(0)').attr("value"));
          faq[i][11]=$('#family .tabletr'+i+' input:eq(10)').attr("value");
//        alert("adsfasfs11"+faq[i][11]);
//             $('itemid'+i).attr("value",$('#family .tabletr'+i+' input:eq(0)').attr("value"));
          faq[i][12]=$('#family .tabletr'+i+' input:eq(11)').attr("value");
//        alert("adsfasfs12"+faq[i][12]);
//             $('itemid'+i).attr("value",$('#family .tabletr'+i+' input:eq(0)').attr("value"));
//                                             alert("lastt"+faq[i][12]);
//            if($('#family #tabletr:eq('+i+') input:eq(6)').attr("value").trim()==""){
//            alert("please enter received quantity");
//            $('#family #tabletr:eq('+i+') input:eq(6)').focus();
//
//        }
//        if($('#family #tabletr:eq('+i+') input:eq(7)').attr("value").trim()==""){
//            alert("please enter accepted quantity");
//            $('#family #tabletr:eq('+i+') input:eq(7)').focus();
//
//        }
        $.post('Grn.action?res', {faqlst:faq[i]}, function (data) {
                     eval(data);

         });

}
//            document.getElementById("clone").value=faq;
//         alert(faq);


    }
    var global=0.0;
    function deletethis(p){
        var rowid=p.name.substring(p.name.indexOf("[")+1,p.name.indexOf("]"));
           var count=$('#family #tabletr').length;
//               var t=$('#family #tabletr').length;
//               var t=$('#family #tabletr:last input:eq(13)').attr("value");

        global=parseFloat(count)+1;
//               alert($('#family #tabletr:eq('+rowid+')').attr("class"));
         $('#family #tabletr:eq('+rowid+')').clone(true).insertAfter('#family #tabletr:last').attr("class","tabletr"+count);
//        alert($('#family #tabletr:last').html());
            $('#family #tabletr:last input:eq(5)').removeAttr("value");
            $('#family #tabletr:last input:eq(6)').removeAttr("value");
            $('#family #tabletr:last input:eq(7)').removeAttr("value");
            $('#family #tabletr:last input:eq(8)').removeAttr("value");
            $('#family #tabletr:last input:eq(9)').removeAttr("value");
            $('#family #tabletr:last input:eq(10)').removeAttr("value");
            $('#family #tabletr:last input:eq(11)').removeAttr("value");
            $('#family #tabletr:last input:eq(12)').removeAttr("value");
//            $('#family #tabletr:last input:eq(13)').removeAttr("value");
        //....................................................................




//            alert($('#family #tabletr:last').attr("class"));

        $('#family #tabletr:last input:eq(0)').attr("id","item"+count);
        $('#family #tabletr:last input:eq(1)').attr("id","itemcode"+count);
        $('#family #tabletr:last input:eq(2)').attr("id","uom"+count);
        $('#family #tabletr:last input:eq(3)').attr("name","grndetailarray["+count+"].orderedQty");
//            $('#family #tabletr:last input:eq(3)').attr("name","grndetailarrayclone["+count+"].orderedQty");
        $('#family #tabletr:last input:eq(3)').attr("id","ordqty"+count);
        $('#family #tabletr:last input:eq(4)').attr("name","grndetailarray["+count+"].rate");
//            $('#family #tabletr:last input:eq(4)').attr("name","grndetailarrayclone["+count+"].rate");
        $('#family #tabletr:last input:eq(4)').attr("id","rate"+count);
        $('#family #tabletr:last input:eq(5)').attr("name","grndetailarray["+count+"].challanQty");
//            $('#family #tabletr:last input:eq(5)').attr("name","grndetailarrayclone["+count+"].challanQty");
        $('#family #tabletr:last input:eq(5)').attr("id","challanQty"+count);
        $('#family #tabletr:last input:eq(6)').attr("name","grndetailarray["+count+"].receivedQty");
//            $('#family #tabletr:last input:eq(6)').attr("name","grndetailarrayclone["+count+"].receivedQty");
        $('#family #tabletr:last input:eq(6)').attr("id","receivedQty"+count);
        $('#family #tabletr:last input:eq(7)').attr("name","grndetailarray["+count+"].accqty");
//            $('#family #tabletr:last input:eq(7)').attr("name","grndetailarrayclone["+count+"].accqty");
        $('#family #tabletr:last input:eq(7)').attr("id","accqty"+count);
        $('#family #tabletr:last input:eq(8)').attr("name","grndetailarray["+count+"].value");
//            $('#family #tabletr:last input:eq(8)').attr("name","grndetailarrayclone["+count+"].value");
        $('#family #tabletr:last input:eq(8)').attr("id","value"+count);
        $('#family #tabletr:last input:eq(9)').attr("name","grndetailarray["+count+"].batchNumber");
//            $('#family #tabletr:last input:eq(9)').attr("name","grndetailarrayclone["+count+"].batchNumber");
        $('#family #tabletr:last input:eq(9)').attr("id","batchNumber"+count);
        $('#family #tabletr:last input:eq(10)').attr("name","grndetailarray["+count+"].date");
//            $('#family #tabletr:last input:eq(10)').attr("name","grndetailarrayclone["+count+"].date");
        $('#family #tabletr:last input:eq(10)').attr("id","date"+count);
        $('#family #tabletr:last input:eq(11)').attr("name","grndetailarray["+count+"].remark");
//            $('#family #tabletr:last input:eq(11)').attr("name","grndetailarrayclone["+count+"].remark");
        $('#family #tabletr:last input:eq(11)').attr("id","remark"+count);
        $('#family #tabletr:last input:eq(12)').attr("name","delete["+count+"]");
        $('#family #tabletr:last input:eq(12)').attr("id","delete"+count);
        $('#family #tabletr:last input:eq(13)').attr("name","grndetailarray["+count+"].item.id");
//            $('#family #tabletr:last input:eq(13)').attr("name","grndetailarrayclone["+count+"].item.id");
//            $('#family #tabletr:last input:eq(13)').attr("value",t);
        $('#family #tabletr:last input:eq(13)').attr("id","itemid"+count);

//            alert($('#family .tabletr'+rowid+':last').attr("class"));

        }

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
if (!chk){
    alert('please Enter Numeric value');
$('#receivedQty'+rowid+'').val("");
    $('#receivedQty'+rowid+'').focus();
    return false;
}//end of chk loop
else if(parseFloat(p.value)!=""){
       if(parseFloat($('#receivedQty'+rowid+'').val())>parseFloat($('#ordqty'+rowid+'').val())){
        alert("Received quantity cannot be greater than ordered quantity.");
        $('#receivedQty'+rowid+'').focus();
        $('#receivedQty'+rowid+'').attr("value","");
        return false;
    }
    else if($('#accqty'+rowid+'').val().trim()!="")
    {
        if(parseFloat($('#accqty'+rowid+'').val())>parseFloat(p.value))
            alert("Accepted quantity can not be greater than received quantity");
        $('#accqty'+rowid+'').val("");
        $('#accqty'+rowid+'').focus();
    }

}


}//end of p.value!=0 if
else{

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
else if(parseFloat($('#accqty'+rowid+'').val().trim())!=""){

    if(parseFloat(p.value)>parseFloat(a)){
        alert("Accepted quantity cannot be greater than ordered quantity.");
        $('#accqty'+rowid+'').attr("value","");
        $('#family #tabletr:eq('+rowid+') input:eq(4)').focus();
        return false;
    }
    else if(parseFloat($('#receivedQty'+rowid+'').val())=="")
    {
        alert("enter received Qty");
        $('#receivedQty'+rowid+'').focus();

    }
    else if(parseFloat(p.value)>parseFloat(r))
        {
            alert("Accepted quantity can not be greater than Received Quantity");
            $('#accqty'+rowid+'').attr("value","");
            $('#family #tabletr:eq('+rowid+') input:eq(4)').focus();
        }
        else
        {
            $('#value'+rowid+'').attr("value",parseFloat(p.value)*parseFloat(r));
            }
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
  /*  $("#addgrn").click(function(){
var numeric = /^[0-9]+$/;
var count=$('#family #tabletr').length+1;
    alert($('#family #tabletr').html());

for(var i=0;i<count;i++){

    if($('#family #tabletr:eq('+i+') input:eq(6)').attr("value").trim()==""){
        alert("please enter received quantity");
        $('#family #tabletr:eq('+i+') input:eq(6)').focus();
        return false;
    }
    if($('#family #tabletr:eq('+i+') input:eq(7)').attr("value").trim()==""){
        alert("please enter accepted quantity");
        $('#family #tabletr:eq('+i+') input:eq(7)').focus();
        return false;
    }

}
  return false;
   });

  */  });

</script>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<s:useActionBean beanclass="com.erp.action.GrnActionBean" var="listofvendor" event="addGrnLink"></s:useActionBean>
<%
request.setAttribute("purchaseorderlst",listofvendor.getPurchaseorderlst());
%>
<s:layout-render name="/layout/_base.jsp">
<s:layout-component name="body">
<s:form beanclass="com.erp.action.GrnActionBean">
<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" >
<tr valign="top"><td >&nbsp;
</td></tr>
<tr><td align="left" class="pageheading" valign="top">
Stock Management > Add Grn
</td></tr>
<tr valign="top"><td align="center"><div class="msg"><s:messages/></div>
</td></tr>
</table>
<table border="1" width="78%" bgcolor="#FCFCFC" ><tr><td>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
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
<td width="15%"><s:submit name="getorderlstforgrn" id="getpurchaseorderbutton" value="Get"/></td>
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
    <table width="98%" border="0" cellspacing="0" cellpadding="0" style="border:1px solid #000000;" align="left" id="family">

        <tr>
            <td width="20%" height="28px" style="border-right:1px solid #000000;background:#FFCC66;"><div align="center"><strong><span style="color:#3B3131;font-size:13px;font-weight:bold;" >Item name</span></strong></div></td>
            <td width="12%"  style="border-right:1px solid #000000; background:#FFCC66;"><div align="center"><strong><span style="color:#3B3131;font-size:13px;font-weight:bold;">Item Code</span></strong></div></td>
            <td width="7%"  style=" border-right:1px solid #000000;background:#FFCC66;"><div align="center"><strong><span style="color:#3B3131;font-size:13px;font-weight:bold;">UoM</span></strong></div></td>
            <td width="10%"  style=" border-right:1px solid #000000;background:#FFCC66;"><div align="center"><strong><span style="color:#3B3131;font-size:13px;font-weight:bold;">OrdQty</span></strong></div></td>
            <td width="10%"  style=" border-right:1px solid #000000;background:#FFCC66;"><div align="center"><strong><span style="color:#3B3131;font-size:13px;font-weight:bold;">Rate/Qty</span></strong></div></td>
            <td width="10%"  style=" border-right:1px solid #000000;background:#FFCC66;"><div align="center"><strong><span style="color:#3B3131;font-size:13px;font-weight:bold;">ChallanQty</span></strong></div></td>
            <td width="10%"  style=" border-right:1px solid #000000;background:#FFCC66;"><div align="center"><strong><span style="color:#3B3131;font-size:13px;font-weight:bold;">ReceivedQty</span></strong></div></td>
            <td width="10%"  style=" border-right:1px solid #000000;background:#FFCC66;"><div align="center"><strong><span style="color:#3B3131;font-size:13px;font-weight:bold;">AcceptedQty</span></strong></div></td>
            <td width="10%"  style=" border-right:1px solid #000000;background:#FFCC66;"><div align="center"><strong><span style="color:#3B3131;font-size:13px;font-weight:bold;">Value</span></strong></div></td>
            <td width="8%"  style="background:#FFCC66;"><div align="center"><strong><span style="color:#3B3131;font-size:13px;font-weight:bold;">Batch Number</span></strong></div></td>
            <td width="8%"  style="background:#FFCC66;"><div align="center"><strong><span style="color:#3B3131;font-size:13px;font-weight:bold;">Date</span></strong></div></td>
            <td width="8%"  style="background:#FFCC66;"><div align="center"><strong><span style="color:#3B3131;font-size:13px;font-weight:bold;">Remarks</span></strong></div></td>
            <td width="5%"  style=" background:#FFCC66;"><div align="center"><strong><span style="color:#3B3131;font-size:13px;font-weight:bold;"><img src="images/Cfthrow.gif"></span></strong></div></td>
        </tr>

        <c:forEach items="${actionBean.purchaseOrder.purchasedetailarray}" var="grndetailarray" varStatus="loop" >
        <tr id="tabletr" class="tabletr${loop.index}">
                <td style="border-top:1px solid #000000;border-right:1px solid #000000;">
                    <div align="left" style="margin-left:4px;">
                        <div align="right">
                      <s:text type="text" name="grndetailarray1" readonly="readonly" value="${grndetailarray.item.name}" id="itemcode${loop.index}" class="hello" style="text-align:right;margin-right:2px; width:90px; "  />

                </div></div></td>
                <td style="border-top:1px solid #000000;border-right:1px solid #000000;"><div align="left" style="margin-left:4px;">
                    <div align="right">
                        <s:text type="text" name="itemNamefor" readonly="readonly" value="${grndetailarray.item.itemCode}" id="item${loop.index}" class="hello" style="text-align:right;margin-right:2px; width:90px; "  />
                    </div></div></td>
                <td style="border-top:1px solid #000000;border-right:1px solid #000000;">
                    <div align="left" style="margin-left:4px;">
                        <div align="right">
                            <s:text  name="uomfor" id="uom${loop.index}" readonly="readonly" value="${grndetailarray.item.uom.name}" style="text-align:right;margin-right:2px;width:90px; "/>
                        </div></div></td>
                <td style="border-top:1px solid #000000;border-right:1px solid #000000;">
                    <div align="left" style="margin-left:4px;">
                        <div align="right">
                            <s:text  name="grndetailarray[${loop.index}].orderedQty" id="ordqty${loop.index}" readonly="readonly" value="${grndetailarray.orderedQty}" style="text-align:right;margin-right:2px;width :60px; "/>
                        </div></div></td>
                <td style="border-top:1px solid #000000;border-right:1px solid #000000;">
                    <div align="left" style="margin-left:4px;">
                        <div align="right">
                            <s:text name="rate" id="rate${loop.index}" readonly="readonly" value="${grndetailarray.rate}"  style="text-align:right;margin-right:2px;width:60px; "/>

                        </div></div></td>
                <td style="border-top:1px solid #000000;border-right:1px solid #000000;">
                    <div align="left" style="margin-left:4px;">
                        <div align="right">
                            <s:text id="challanQty${loop.index}"  name="grndetailarray[${loop.index}].challanQty" style="text-align:right;margin-right:2px;width :60px; "/>
                        </div></div></td>
                <td style="border-top:1px solid #000000;border-right:1px solid #000000;">
                    <div align="left" style="margin-left:4px;">
                        <div align="right">
                            <s:text id="receivedQty${loop.index}"  name="grndetailarray[${loop.index}].receivedQty"  onchange="return checkReceived(this)" style="text-align:right;margin-right:2px;width :60px; "/>
                        </div></div></td>
                <td style="border-top:1px solid #000000;border-right:1px solid #000000;">
                    <div align="left" style="margin-left:4px;">
                        <div align="right">
                            <s:text id="accqty${loop.index}"  name="grndetailarray[${loop.index}].acceptedQty" onchange="return calculateBalance(this,${grndetailarray.rate},${grndetailarray.orderedQty})"  style="text-align:right;margin-right:2px;width:60px; "/>

                        </div></div></td>
                <td style="border-top:1px solid #000000;border-right:1px solid #000000;"><div align="left" style="margin-left:4px;">  <div align="right">
                    <s:text readonly="readonly"  name="grndetailarray[${loop.index}].value" id="value${loop.index}" style="text-align:right;margin-right:2px;width :60px;"/>
                </div></div></td>
                <td style="border-top:1px solid #000000;"><div align="left" style="margin-left:4px;">  <div align="right">
                    <s:text id="batchNumber${loop.index}"  name="grndetailarray[${loop.index}].batchNumber"  style="text-align:right;margin-right:2px;width:100px; "/>
                </div></div></td>
                <td style="border-top:1px solid #000000;"><div align="left" style="margin-left:4px;">  <div align="right">
                    <s:text id="date${loop.index}"  name="grndetailarray[${loop.index}].date" class="textbox" readonly="readonly" onFocus="showCalendarControl(this);"    style="text-align:right;margin-right:2px;width:100px; "/>
                </div></div></td>
                <td style="border-top:1px solid #000000;"><div align="left" style="margin-left:4px;">  <div align="right">
                    <s:text id="remark${loop.index}"  name="grndetailarray[${loop.index}].remark" style="text-align:right;margin-right:2px;width:100px; "/>
                </div></div></td>
                <td style="border-top:1px solid #000000;">
<div align="left" style="margin-left:0px;">
<div align="right">
<s:text name="delete[${loop.index}]"   id="delete${loop.index}"  style="background-image:url('images/Cfthrow.gif');border :none;cursor:auto;"    onclick="return deletethis(this)"/>
 <s:hidden name="grndetailarray[${loop.index}].item.id" id="itemid${loop.index}"   value="${grndetailarray.item.id}"></s:hidden>
</div></div></td>
    </tr>
        </c:forEach>
          </div>
    </table>
</td>
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
<td align="left" colspan="3"><div align="left" style="margin-left:20px">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <s:hidden id="clone" name="grndetailarrayclone"/>
    <s:submit name="addGrn" value="Add" onclick="return add()"></s:submit>
    &nbsp;&nbsp;&nbsp;&nbsp;
    <input type="reset"  value="Reset" name="reset"  style="width:80px" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <s:submit name="cancel" value="Cancel"></s:submit>
</div></td>
<td width="3%" align="left">&nbsp;</td>
</tr> </s:form> </c:if>
</table></td></tr></table>
</s:layout-component>
</s:layout-render>
