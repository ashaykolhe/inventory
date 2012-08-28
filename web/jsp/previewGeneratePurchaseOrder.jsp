    <%--
    Created by IntelliJ IDEA.
    User: Milind
    Date: Mar 1, 2012
    Time: 3:44:59 PM
    To change this template use File | Settings | File Templates.
    --%>
    <%@ include file="/includes/_taglibInclude.jsp" %>
    <link rel="stylesheet" href="css/general.css" type="text/css" media="screen" />
    <link rel="stylesheet" type="text/css" href="css/stylesheet.css"/>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <s:useActionBean beanclass="com.erp.action.PurchaseOrderActionBean" var="listofpo" event="generateUpdatePOLink"></s:useActionBean>
    <%
    request.setAttribute("purchaseOrder",listofpo.getPurchaseOrder());

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
    <s:form beanclass="com.erp.action.PurchaseOrderActionBean">
        <table  class="second_table" ><tr><td>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <div class="msg"><s:messages/></div>
            <tr>

            <td width="18%" align="left" valign="top">
            <div align="left" style="margin-left: 2px;" class="labels">
            <div align="right">
            <b>Name of Supplier</b>
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
    <s:hidden id="purchaseOrderid" name="purchaseOrder.id" class="textbox"><s:hidden name="purchaseOrder.status" value="open"/></s:hidden>
    </td> <s:hidden id="vendorid" name="purchaseOrder.vendor.id" value="${purchaseOrder.vendor.name}" class="textbox"></s:hidden>
    <td width="48%">&nbsp;                                  <s:hidden name="test" value="gettestvalue"/>
    <s:hidden id="id" name="id" value="${purchaseOrder.id}" ></s:hidden>
    <s:hidden id="purchaseOrderNo" name="purchaseOrder.purchaseOrderNo" value="${purchaseOrder.purchaseOrderNo}" class="textbox"></s:hidden>
    </td>
    <tr>
    <td width="16%" align="left" valign="top">
    <div align="left" style="margin-left: 15px;" class="labels">
    <div align="right">
   <b> Purchase Order No</b>
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
    <table width="95%" border="0"  cellspacing="0" cellpadding="0"  align="left" id="family">
    <tr class="foreach_table">
    <td width="14%" class="foreach_table_firstth"><div align="center"><span class="foreach_th_span">Item name</span></div></td>
    <td width="22%"   class="foreach_table_th"><div align="center"><span class="foreach_th_span">Item Code</span></div></td>
    <td width="9%"   class="foreach_table_th"><div align="center"><span class="foreach_th_span">UoM</span></div></td>
    <td width="12%"   class="foreach_table_th"><div align="center"><span class="foreach_th_span">Description</span></div></td>
          <td width="12%"  class="foreach_table_th"><div align="center"><span class="foreach_th_span">Make</span></div></td>
        <td width="12%"  class="foreach_table_th"><div align="center"><span class="foreach_th_span">Specification</span></div></td>
    <td width="13%"   class="foreach_table_th"><div align="center"><span class="foreach_th_span">Ordered Quantity</span></div></td>
    <td width="12%"   class="foreach_table_th"><div align="center"><span class="foreach_th_span">Rate</span></div></td>
    <td width="5%"   class="foreach_table_th"><div align="center"><span class="foreach_th_span">Amount</span></div></td>
    </tr>
    <c:forEach items="${purchaseOrder.purchasedetailarray}" var="purchasedetailarray" varStatus="loop" >
    <tr id="tabletr">
   <td class="foreach_table_firstth">
    <div align="left" style="margin-left:4px;">
   
    <div align="right">
    <s:text readonly="readonly" name="purchasedetailarray[${loop.index}].item.name" value="${purchasedetailarray.item.name}" id="item${loop.index}" class="foreach_table_td" style="width:150px; "   />
    </div>
    </div>
    </td>
    <td class="foreach_table_th"><div align="left" style="margin-left:4px;width:80px;">
    <s:hidden  name="purchasedetailarray[${loop.index}].item.id" value="${purchasedetailarray.item.id}" />
    ${purchasedetailarray.item.itemCode}

    </div>
    </div>
    </td>
    <td class="foreach_table_th">
    <div align="left" style="margin-left:4px;">
    <div align="right">
    <s:text readonly="readonly"  name="purchasedetailarray[${loop.index}].item.uom.name" id="uom${loop.index}" value="${purchasedetailarray.item.uom.name}" class="foreach_table_td" style="width:70px; "/>
    </div>
    </div>
    </td>
    <td class="foreach_table_th">
    <div align="left" style="margin-left:4px;">
    <div align="right">
    <s:text readonly="readonly"  name="purchasedetailarray[${loop.index}].description" value="${purchasedetailarray.description}" class="foreach_table_td" style="width:80px; "/>
    </div>
    </div>
    </td>
        <td class="foreach_table_th">
    <div align="left" style="margin-left:4px;">
    <div align="right">
    <s:text readonly="readonly"  name="purchasedetailarray[${loop.index}].make" value="${purchasedetailarray.make}" class="foreach_table_td" style="width:80px; "/>
    </div>
    </div>
    </td>
        <td class="foreach_table_th">
    <div align="left" style="margin-left:4px;">
    <div align="right">
    <s:text readonly="readonly"  name="purchasedetailarray[${loop.index}].specification" value="${purchasedetailarray.specification}" class="foreach_table_td" style="width:80px; "/>
    </div>
    </div>
    </td>
   <td class="foreach_table_th">
    <div align="left" style="margin-left:4px;">
    <div align="right">
    <s:text readonly="readonly"  name="purchasedetailarray[${loop.index}].orderedQty" value="${purchasedetailarray.orderedQty}"  class="foreach_table_td" style="width:70px; "/>
    </div>
    </div>
    </td>
  <td class="foreach_table_th">
    <div align="left" style="margin-left:4px;">
    <s:text readonly="readonly"  name="purchasedetailarray[${loop.index}].rate" value="${purchasedetailarray.rate}"    class="foreach_table_td" style="width:60px; "/>
    </div></td>
   <td class="foreach_table_th">
    <div align="left" style="margin-left:4px;">
    <s:text readonly="readonly"  name="purchasedetailarray[${loop.index}].amount" value="${purchasedetailarray.amount}" class="foreach_table_td" style="width:60px; "/>
    </div></td>
    </tr>             </c:forEach>
    </table>
    </td>
    </tr>
    <tr>
    <td align="left">&nbsp;</td>
    <td align="left" colspan="3">&nbsp;</td>
    <td align="left">&nbsp;</td>
    </tr>
    <tr>
    <td align="left">&nbsp;</td>
    <td align="left" colspan="3"><div align="left" style="margin-left:20px"> &nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;
    <s:submit name="generatePurchaseOrder" class="buttonbig" value="Generate PO"></s:submit>
    &nbsp;&nbsp;&nbsp;&nbsp;

    <s:submit name="generateUpdatePOLink" class="buttons" value="Edit"></s:submit>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <s:submit name="cancel" value="Cancel" class="buttons"></s:submit>
    </div></td>
    <td width="3%" align="left">&nbsp;</td>
    </tr>
    </table></td></tr></table></s:form>

 </s:layout-component></s:layout-render>