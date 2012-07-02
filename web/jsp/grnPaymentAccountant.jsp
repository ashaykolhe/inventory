    <%--
    Created by IntelliJ IDEA.
    User: Minal
    Date: Feb 15, 2012
    Time: 10:06:09 PM
    To change this template use File | Settings | File Templates.
    --%>
    <%@ include file="/includes/_taglibInclude.jsp" %>
    <link rel="stylesheet" href="css/general.css" type="text/css" media="screen" />
    <c:set var = "TR2" value="receipt"/>
    <c:if test="${actionBean.hdnvalue eq TR2}">
    <script type="text/javascript">
    function OpenPopup(){
    var w = 800;
    var h = 500;
    var winl = (screen.width-w)/2;
    var wint = (screen.height-h)/2;
    if (winl < 0) winl = 0;
    if (wint < 0) wint = 0;
    var page = "Grn.action?redirectpopupforverified=&id="+${actionBean.id}+"";
    windowprops = "height="+h+",width="+w+",top="+ wint +",left="+ winl +",location=no,"
    + "scrollbars=yes,menubars=no,toolbars=no,resizable=no,status=yes";
    window.open(page, "Popup", windowprops);
    return;
    }
    window.onLoad =OpenPopup();
    </script>
    </c:if >
    <c:set var = "TR3" value="test12"/>
    <c:if test="${actionBean.hdnvalue eq TR3}">

    <script type="text/javascript">

    window.close();

    </script>

    </c:if>
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
    GRN Management > Pending GRN
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
    <d:column title="Approve" class="delete">
    <s:link beanclass="com.erp.action.GrnActionBean" event="makePayment" >
    <s:param name="id" value="${grn1.id}"></s:param>
    <s:param name="hdnvalue" value="test"></s:param>

    <img src="images/view.png" />   </s:link>

    </d:column>
    </d:table></td></tr></table>


    </s:form></s:layout-component></s:layout-render>