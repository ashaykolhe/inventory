    <%--
    Created by IntelliJ IDEA.
    User: Minal
    Date: Feb 17, 2012
    Time: 3:48:01 PM
    To change this template use File | Settings | File Templates.
    --%>
    <%@ include file="/includes/_taglibInclude.jsp" %>
    <link rel="stylesheet" href="css/general.css" type="text/css" media="screen" />
    <script type="text/javascript">
    function show_confirm()
    {
   var r=confirm("You are attempting to delete a record.Are you sure, you want to delete selected record?");
    if (r)
    {
    return true;
    }
    else
    {
    return false;
    }
    return false;
    }
    </script>
    <s:useActionBean beanclass="com.erp.action.VendorActionBean" var="listofvendor" event="deleteVendorLink"></s:useActionBean>
    <% request.setAttribute("vendorlst",listofvendor.getVendorlst());

    %>
    <s:layout-render name="/layout/_base.jsp">
    <s:layout-component name="body">
    <s:form beanclass="com.erp.action.VendorActionBean">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" >
    <tr valign="top"><td >&nbsp;
    </td></tr>
    <tr><td align="left" class="pageheading" valign="top">
    Vendor Management > Delete Vendor
    </td></tr>
    <tr valign="top"><td align="center"><div class="msg"><s:messages/></div>
    </td></tr>
    </table>
    <table width="100%"><tr><td>
    <d:table name="vendorlst" id="vendor1" pagesize="10" class="disp" requestURI="/Vendor.action">
    <d:column property="name" title="Vendor Name"/>
    <d:column property="address" title="Vendor Address"  />
    <d:column property="emailId" title="Email Id" />
    <d:column property="phoneNo" title="Phone Number" />
    <d:column property="productSupplied" title="Product Supplied" />

    <d:column title="Delete" class="delete">

    <s:link beanclass="com.erp.action.VendorActionBean" event="delete" onclick="return show_confirm();" >
    <s:param name="id" value="${vendor1.id}"></s:param>
    <img src="images/Close-2-icon.png" />   </s:link>

    </d:column>

    </d:table></td></tr></table>

    </s:form></s:layout-component></s:layout-render>