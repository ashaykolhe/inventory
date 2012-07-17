    <%--
    Created by IntelliJ IDEA.
    User: Admin
    Date: Feb 23, 2012
    Time: 11:52:37 AM
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
    <s:useActionBean beanclass="com.erp.action.UserActionBean" var="listofusers" event="addUserLink"></s:useActionBean>
    <% request.setAttribute("userlst",listofusers.getUserlst());

    %>
    <s:layout-render name="/layout/_base.jsp">
    <s:layout-component name="body">
    <s:form beanclass="com.erp.action.UserActionBean">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" >
    <tr valign="top"><td >&nbsp;
    </td></tr>
    <tr><td align="left" class="pageheading" valign="top">
    User Management > Delete User
    </td></tr>
    <tr valign="top"><td align="center">&nbsp;
    </td></tr>
    </table>
    <table width="100%"><tr><td>
    <d:table name="userlst" id="user1" pagesize="10" class="disp" requestURI="/User.action">
    <d:column property="user_id" title="Id"/>
    <d:column property="username" title="User Name"  />
    <d:column title="Delete" class="delete">

    <s:link beanclass="com.erp.action.UserActionBean" event="delete" onclick="return show_confirm();" >
    <s:param name="id" value="${user1.user_id}"></s:param>
    <img src="images/Close-2-icon.png" />   </s:link>

    </d:column>

    </d:table></td></tr></table>

    </s:form></s:layout-component></s:layout-render>