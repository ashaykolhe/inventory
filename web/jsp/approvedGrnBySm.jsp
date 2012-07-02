    <%--
    Created by IntelliJ IDEA.
    User: Minal
    Date: Feb 15, 2012
    Time: 10:06:09 PM
    To change this template use File | Settings | File Templates.
    --%>
    <%@ include file="/includes/_taglibInclude.jsp" %>
    <link rel="stylesheet" href="css/general.css" type="text/css" media="screen" />

    <s:useActionBean beanclass="com.erp.action.GrnActionBean" var="grnBean"></s:useActionBean>
    <% request.setAttribute("grnlist",grnBean.getGrnlst());

    %>
    <s:layout-render name="/layout/_base.jsp">
    <s:layout-component name="body">
    <s:form beanclass="com.erp.action.GrnActionBean">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" >
    <tr valign="top"><td >&nbsp;
    </td></tr>
    <tr><td align="left" class="pageheading" valign="top">
    GRN Management > Approved GRNS
    </td></tr>
    <tr valign="top"><td align="center">&nbsp;
    </td></tr>
    </table>
    <table width="100%"><tr><td>
    <d:table name="grnlist" id="grn1" pagesize="10" class="disp" requestURI="/Grn.action?forAccountant">
    <d:column property="id" title="GRN No."/>
    <d:column property="purchaseOrder.purchaseOrderNo" title="PO No."/>

    <d:column property="orderDate" title="Date"   format="{0,date,yyyy-MM-dd}" sortable="false"/>
    <d:column property="status" title="Status"/>

    </d:table></td></tr></table>
    </s:form></s:layout-component></s:layout-render>