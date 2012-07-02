    <%--
    Created by IntelliJ IDEA.
    User: Milind
    Date: Mar 1, 2012
    Time: 3:44:59 PM
    To change this template use File | Settings | File Templates.
    --%>
    <%@ include file="/includes/_taglibInclude.jsp" %>
    <link rel="stylesheet" href="css/general.css" type="text/css" media="screen" />

    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <s:useActionBean beanclass="com.erp.action.PurchaseOrderActionBean" var="listofpo" event="updatePOLink"></s:useActionBean>
    <%
    request.setAttribute("purchaseOrder",listofpo.getPurchaseOrder());
    %>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" >
    <tr valign="top">
    <td>
    &nbsp;
    </td>
    </tr>
    <tr>
    <td align="left" class="pageheading" valign="top">
    Purchase Order > Review
    </td>
    </tr>
    <tr valign="top"><td align="center"><div class="msg"><s:messages/></div>
    </td>
    </tr>
    </table>
    <s:form beanclass="com.erp.action.PurchaseOrderActionBean" id="frmPopMessage">
    <table border="1" width="78%" bgcolor="#FCFCFC" ><tr><td>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>

    <td width="16%" align="left" valign="top">
    <div align="left" style="margin-left: 2px;" class="labels">
    <div align="right">
    Name of Supplier
    </div>
    </div>
    </td>
    <td width="21%" align="left" valign="top">
    <div align="left">
    ${purchaseOrder.vendor.name}
    </div>
    </td>
    <td width="15%">&nbsp;
    <s:hidden name="purchaseOrder.deleted" value="0"/>
    </td>
    <td width="48%">&nbsp;
    <s:hidden id="purchaseOrderid" name="purchaseOrder.id" class="textbox"></s:hidden>
    </td> <s:hidden id="vendorid" name="purchaseOrder.vendor.id" value="${purchaseOrder.vendor.name}" class="textbox"></s:hidden>
    <td width="48%">&nbsp;<s:hidden name="test" value="dd"/>   <s:hidden name="purchaseOrder.status" value="open"/>
    <s:hidden id="purchaseOrderNo" name="purchaseOrder.purchaseOrderNo" value="${purchaseOrder.purchaseOrderNo}" class="textbox"></s:hidden>
    </td>
    <tr>
    <td width="16%" align="left" valign="top">
    <div align="left" style="margin-left: 15px;" class="labels">
    <div align="right">
    Purchase Order No
    </div>
    </div>
    </td>
    <td valign="top">
    <div align="left">
    ${purchaseOrder.purchaseOrderNo}
    </div>
    </td>
    </tr>
    <tr>
    <td  colspan="4"><br><div align="left" style="margin-left:10px;">
    <table  width="95%" border="0" cellspacing="0" cellpadding="0" style="border:1px solid #000000;" align="left" id="family">
    <tr>
    <td width="14%" height="28px" style="border-right:1px solid #000000;background:#FFCC66;"><div align="center"><strong><span style="color:#3B3131;font-size:13px;font-weight:bold;" >Item name</span></strong></div></td>
    <td width="22%"  style="border-right:1px solid #000000; background:#FFCC66;"><div align="center"><strong><span style="color:#3B3131;font-size:13px;font-weight:bold;">Item Code</span></strong></div></td>
    <td width="9%"  style=" border-right:1px solid #000000;background:#FFCC66;"><div align="center"><strong><span style="color:#3B3131;font-size:13px;font-weight:bold;">UoM</span></strong></div></td>
    <td width="12%"  style=" border-right:1px solid #000000;background:#FFCC66;"><div align="center"><strong><span style="color:#3B3131;font-size:13px;font-weight:bold;">Description</span></strong></div></td>
    <td width="13%"  style=" border-right:1px solid #000000;background:#FFCC66;"><div align="center"><strong><span style="color:#3B3131;font-size:13px;font-weight:bold;">Ordered Quantity</span></strong></div></td>
    <td width="12%"  style=" border-right:1px solid #000000;background:#FFCC66;"><div align="center"><strong><span style="color:#3B3131;font-size:13px;font-weight:bold;">Rate</span></strong></div></td>
    <td width="5%"  style=" background:#FFCC66;"><div align="center"><strong><span style="color:#3B3131;font-size:13px;font-weight:bold;">Amount</span></strong></div></td>
    </tr>
    <c:forEach items="${purchaseOrder.purchasedetailarray}" var="purchasedetailarray" varStatus="loop" >
    <tr id="tabletr">
    <td style="border-top:1px solid #000000;border-right:1px solid #000000;">
    <div align="left" style="margin-left:4px;">
    <div align="right">
    <s:text readonly="readonly" name="purchasedetailarray[${loop.index}].item.name" value="${purchasedetailarray.item.name}" id="item${loop.index}" class="hello" style="text-align:right;margin-right:2px; width:200px; border:none; "  />
    </div>
    </div>
    </td>
    <td style="border-top:1px solid #000000;border-right:1px solid #000000;"><div align="left" style="margin-left:4px;width:100px;">
    <div align="right">
    <s:hidden  name="purchasedetailarray[${loop.index}].item.id" value="${purchasedetailarray.item.id}" class="textbox"></s:hidden>
    ${purchasedetailarray.item.itemCode}

    </div>
    </div>
    </td>
    <td style="border-top:1px solid #000000;border-right:1px solid #000000;">
    <div align="left" style="margin-left:4px;">
    <div align="right">
    <s:text readonly="readonly"  name="purchasedetailarray[${loop.index}].item.uom.name" id="uom${loop.index}" value="${purchasedetailarray.item.uom.name}" style="text-align:right;margin-right:2px;width:100px; border:none;"/>
    </div>
    </div>
    </td>
    <td style="border-top:1px solid #000000;border-right:1px solid #000000;">
    <div align="left" style="margin-left:4px;">
    <div align="right">
    <s:text readonly="readonly"  name="purchasedetailarray[${loop.index}].description" value="${purchasedetailarray.description}" style="text-align:right;margin-right:2px;width:100px; border:none;"/>
    </div>
    </div>
    </td>
    <td style="border-top:1px solid #000000;border-right:1px solid #000000;">
    <div align="left" style="margin-left:4px;">
    <div align="right">
    <s:text readonly="readonly"  name="purchasedetailarray[${loop.index}].orderedQty" value="${purchasedetailarray.orderedQty}"  style="text-align:right;margin-right:2px;width:100px;border:none; "/>
    </div>
    </div>
    </td>
    <td style="border-top:1px solid #000000;border-right:1px solid #000000;"><div align="left" style="margin-left:4px;">  <div align="right">
    <s:text readonly="readonly"  name="purchasedetailarray[${loop.index}].rate" value="${purchasedetailarray.rate}"    style="text-align:right;margin-right:2px;width:70px;border:none; "/>
    </div></div></td>
    <td style="border-top:1px solid #000000;"><div align="left" style="margin-left:4px;">  <div align="right">
    <s:text readonly="readonly"  name="purchasedetailarray[${loop.index}].amount" value="${purchasedetailarray.amount}" style="text-align:right;margin-right:2px;width:100px;border:none;"/>
    </div></div></td>
    </tr>             </c:forEach>
    </table>
    </div></td>
    </tr>
    <tr>
    <td align="left">&nbsp;</td>
    <td align="left" colspan="3">&nbsp;</td>
    <td align="left">&nbsp;</td>
    </tr>
    <tr>
    <td align="left">&nbsp;</td>
    <td align="left" colspan="3">
    <div align="left" style="margin-left:20px"> &nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;
    <s:submit name="generatePurchaseOrder" id="generatebtn" value="Generate PO"></s:submit>&nbsp;&nbsp;&nbsp;&nbsp;
    <s:submit name="updatePOLink" value="Edit"></s:submit>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <s:submit name="cancel" value="Cancel"></s:submit>
    </div>
    </td>
    <td width="3%" align="left">&nbsp;</td>
    </tr>
    </table></td></tr></table></s:form>

