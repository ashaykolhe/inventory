    <%@ page import="com.erp.dao.UserDao" %>
    <%@ page import="com.erp.guice.InjectorFactory" %>
    <%--
    Created by IntelliJ IDEA.
    User: Milind
    Date: May 14, 2012
    Time: 12:19:26 PM
    To change this template use File | Settings | File Templates.
    --%>
    <%@ include file="/includes/_taglibInclude.jsp" %>
    <link rel="stylesheet" href="css/general.css" type="text/css" media="screen" />
    <link rel="stylesheet" type="text/css" href="css/stylesheet.css"/>
    <c:set var = "TR1" value="redirectpopup"/>
    <c:if test="${actionBean.hdnvalue eq TR1}">
    <script type="text/javascript">
    function OpenPopup(){
    var w = 760;
    var h = 450;
    var winl = (screen.width-w)/2;
    var wint = (screen.height-h)/2;
    if (winl < 0) winl = 0;
    if (wint < 0) wint = 0;
    var page = "PurchaseOrder.action?redirectlmpopup=&id="+${actionBean.id}+"";
    windowprops = "height="+h+",width="+w+",top="+ wint +",left="+ winl +",location=no," + "scrollbars=yes,menubars=no,toolbars=no,resizable=no,status=yes";
    window.open(page, "Popup", windowprops);
    return;
    }
    window.onLoad =OpenPopup();
    </script>
    </c:if >
    <c:set var = "TR2" value="closePopup"/>
    <c:if test="${actionBean.hdnvalue eq TR2}">
    <script type="text/javascript">
    window.close();
    </script>

    </c:if>

    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <s:useActionBean beanclass="com.erp.action.PurchaseOrderActionBean" var="listofvendor" event="approveLink"></s:useActionBean>
    <%

    request.setAttribute("purchaseorderlst",listofvendor.getPurchaseorderlst());
    %>
    <s:layout-render name="/layout/_base.jsp">
    <s:layout-component name="body">
    <s:form beanclass="com.erp.action.PurchaseOrderActionBean" id="frmPopMessage">   
      <br>
        <table class="heading_table">

           <tr><td align="left" class="pageheading" valign="top">
             <div class="sub_heading" >Approve Purchase Order</div>
           </td></tr>
           </table>
            <table class="second_table"  >
           <tr><td>
    <d:table name="purchaseorderlst" id="po" pagesize="10" class="disp" requestURI="/PurchaseOrder.action?approvePO">

    <d:column property="purchaseOrderNo" title="PO No."/>
    <d:column property="vendor.name" title="Vendor"/>
    <d:column property="createDate" title="Date"   format="{0,date,yyyy-MM-dd}" sortable="false"/>

    <d:column title="Approve" class="delete">
    <s:link beanclass="com.erp.action.PurchaseOrderActionBean" event="viewapprovepo" onclick="return lm_confirm();" >
    <s:param name="id" value="${po.id}"></s:param>

    <img src="images/view.png" />   </s:link>

    </d:column>

    </d:table></td></tr></table>
    </s:form>
    </s:layout-component>
    </s:layout-render>
