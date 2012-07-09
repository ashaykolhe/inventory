<%@ include file="/includes/_taglibInclude.jsp" %>
<%--
  Created by IntelliJ IDEA.
  User: Atul
  Date: Jul 6, 2012
  Time: 12:05:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<s:useActionBean beanclass="com.erp.action.PurchaseOrderActionBean" var="listofPO" event="deletePOLink"></s:useActionBean>
    <% request.setAttribute("purchaseorderlst",listofPO.getPurchaseorderlst());
    %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head><title></title></head>
  <body><table width="90%" style="table-layout:fixed;"><tr><td>
    <d:table name="purchaseorderlst" id="purchaseorder1"  class="disp" requestURI="/PurchaseOrder.action">
    <d:column property="vendor.name" title="Supplier Name" />
    <d:column property="purchaseOrderNo" title="Purchase Order No"  />
    <d:column property="createDate" title="Date" />

  </d:table></td></tr></table></body>
</html>