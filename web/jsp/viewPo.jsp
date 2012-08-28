<%@ page import="com.erp.dao.UserDao" %>
<%@ page import="com.erp.guice.InjectorFactory" %>
<%--
Created by IntelliJ IDEA.
User: Minal
Date: Feb 17, 2012
Time: 3:48:01 PM
To change this template use File | Settings | File Templates.
--%>
    <%@ include file="/includes/_taglibInclude.jsp" %>
    <link rel="stylesheet" href="css/general.css" type="text/css" media="screen" />
     <s:useActionBean beanclass="com.erp.action.PurchaseOrderActionBean" var="listofPO" event="viewPOLink"></s:useActionBean>
     <% request.setAttribute("purchaseorderlst",listofPO.getPurchaseorderlst());
        Long id=(Long)request.getSession().getAttribute("user");
                        String role= InjectorFactory.getInjector().getInstance(UserDao.class).findById(id).getRole().getName();
    %>
<c:set var = "TR3" value="receiptpurchase"/>
<c:if test="${actionBean.hdnvalue eq TR3}">
    <script type="text/javascript">
        function OpenPopup(){

            var w = 780;
            var h = 450;
            var winl = (screen.width-w)/2;
            var wint = (screen.height-h)/2;
            if (winl < 0) winl = 0;
            if (wint < 0) wint = 0;
            var page = "Search.action?redirectpurchase=&id="+${actionBean.id}+"";
            windowprops = "height="+h+",width="+w+",top="+ wint +",left="+ winl +",location=no,"
                    + "scrollbars=yes,menubars=no,toolbars=no,resizable=no,status=yes";
            window.open(page, "Popup", windowprops);
            return;
        }
        window.onLoad =OpenPopup();
    </script>
</c:if >
    <s:layout-render name="/layout/_base.jsp">


           <s:layout-component name="left-menu">

                 <ul >  <li>&nbsp;</li>
                      <li class="left_menu_heading">Purchase Order</li>

                     <li style="margin-top:35px"><s:link beanclass="com.erp.action.PurchaseOrderActionBean" event="addPOLink">Create</s:link></li>
                     <li><s:link beanclass="com.erp.action.PurchaseOrderActionBean" event="generatePurchaseOrderLink">Generate</s:link></li>
                      <li><s:link beanclass="com.erp.action.PurchaseOrderActionBean" event="deletePOLink">Delete</s:link></li>
                        <li><s:link beanclass="com.erp.action.PurchaseOrderActionBean" event="viewPOLink">View PO</s:link></li>
                     <% if(role.toLowerCase().contains("superadmin")){   %>
                                                   <li><s:link beanclass="com.erp.action.PurchaseOrderActionBean" event="approvePOLink">Approve PO(LM)</s:link></li>
                                              <li><s:link beanclass="com.erp.action.PurchaseOrderActionBean" event="approveVp">Approve PO(VP)</s:link></li>
                                           <%}%>
                                                <% if(role.toLowerCase().contains("manager")){   %>
                                                   <li><s:link beanclass="com.erp.action.PurchaseOrderActionBean" event="approvePOLink">Approve PO(LM)</s:link></li>

                                           <%}%>
                  </ul>

         </s:layout-component>
    <s:layout-component name="body">
    <s:form beanclass="com.erp.action.PurchaseOrderActionBean">
     <br>
    <table class="heading_table">

    <tr><td align="left" class="pageheading" valign="top">
      <div class="sub_heading" >View Purchase Order</div>
    </td></tr>
         <%--   <tr valign="top"><td align="center"><div class="msg"><s:messages/></div>
            </td></tr>--%>
    </table>
    <table class="second_table"  >    <tr align="center">
        <td >
  <d:table name="purchaseorderlst" id="purchase" pagesize="10" class="disp" varTotals="totals" requestURI="/Vendor.action">

    <d:column property="vendor.name" title="Vendor Name"/>
            <d:column property="vendor.productSupplied" title="Product Supplied"/>
            <d:column property="purchaseOrderNo" title="Purchase Order No"/>
            <d:column property="createDate" title="Purchase Order Date"  format="{0,date,yyyy-MM-dd}" sortable="false"/>
            <d:column property="status" title="Status"/>
            <d:column title="Item Name">
                <table>
                    <c:forEach items="${purchase.purchasedetailarray}" var="purchaseloop" varStatus="loop" >
                        <tr>  <td>${purchaseloop.item.name}</td></tr>
                    </c:forEach>
                </table>     </d:column>
            <d:column title="Ordered Qty">
                <table>
                    <c:forEach items="${purchase.purchasedetailarray}" var="purchaseloop1" varStatus="loop" >
                        <tr>  <td>${purchaseloop1.orderedQty} </td> </tr>
                    </c:forEach>  </table>
            </d:column>
            <d:column title="Amount">
                <table>
                    <c:forEach items="${purchase.purchasedetailarray}" var="purchaseloop2" varStatus="loop" >
                        <tr>  <td>${purchaseloop2.rate * purchaseloop2.orderedQty}</td></tr>
                    </c:forEach></table> </d:column>

            <d:column title="View" class="delete" >
                <s:link beanclass="com.erp.action.PurchaseOrderActionBean" event="printView" >
                    <s:param name="id" value="${purchase.id}"></s:param>

                 <img src="images/view.gif" />
                </s:link>
            </d:column>
    </d:table>



    </td></tr></table>


    </s:form></s:layout-component>
     <s:layout-component name="footer">
             <div  style="border-top:10px solid #ccccff;">&nbsp;</div>

         </s:layout-component>
    </s:layout-render>