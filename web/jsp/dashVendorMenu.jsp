
<%@ include file="/includes/_taglibInclude.jsp" %>
<%--
  Created by IntelliJ IDEA.
  User: Atul
  Date: Jul 6, 2012
  Time: 11:21:27 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<s:useActionBean beanclass="com.erp.action.VendorActionBean" var="listofitems" event="deleteVendorLink"></s:useActionBean>
    <% request.setAttribute("vendorlst",listofitems.getVendorlst());


    %>
<html>
  <head><title></title></head>
  <body>
        <table width="90%" style="table-layout:fixed;"><tr><td>
  <d:table name="vendorlst" id="vendor1" class="disp" varTotals="totals" requestURI="/Vendor.action">

    <d:column value="${vendor1_rowNum}"  title="No" />


    <d:column property="name" title="Vendor Name"/>
    <d:column property="address" title="Vendor Address"  />
    <d:column property="emailId" title="Email Id" />
    <d:column property="phoneNo" title="Phone Number" />
      </d:table>
            </td>
            </tr>
            </table>
  </body>
</html>