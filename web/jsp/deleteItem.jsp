    <%--
    Created by IntelliJ IDEA.
    User: Minal
    Date: Feb 15, 2012
    Time: 10:06:09 PM
    To change this template use File | Settings | File Templates.
    --%>
    <%@ include file="/includes/_taglibInclude.jsp" %>
    <link rel="stylesheet" href="css/general.css" type="text/css" media="screen" />
    <script type="text/javascript">
    function show_confirm()
    {
    var r=confirm("Are you sure, you want to delete selected record.");
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
    <s:useActionBean beanclass="com.erp.action.ItemActionBean" var="listofitems" event="pagedirect"></s:useActionBean>
    <% request.setAttribute("itemlst",listofitems.getItemlst());

    %>
    <s:layout-render name="/layout/_base.jsp">
    <s:layout-component name="body">
    <s:form beanclass="com.erp.action.ItemActionBean">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" >
    <tr valign="top"><td >&nbsp;
    </td></tr>
    <tr><td align="left" class="pageheading" valign="top">
    Item Management > Delete Item
    </td></tr>
    <tr valign="top"><td align="center">
    <div class="msg"><s:messages/></div>
    </td></tr>
    </table>
    <table width="100%"><tr><td>
    <d:table name="itemlst" id="item1" pagesize="10" class="disp" requestURI="/Item.action">
    <d:column property="itemCode" title="Item Code"/>
    <d:column property="name" title="Item Name"  />
    <d:column property="uom.name" title="UoM" />
    <d:column property="section.name" title="Section" />
    <d:column title="Delete" class="delete">

    <s:link beanclass="com.erp.action.ItemActionBean" event="delete" onclick="return show_confirm();" >
    <s:param name="id" value="${item1.id}"></s:param>
    <img src="images/Close-2-icon.png" />   </s:link>

    </d:column>

    </d:table></td></tr></table>

    </s:form></s:layout-component></s:layout-render>