<%@ page import="com.erp.dao.UserDao" %>
<%@ page import="com.erp.guice.InjectorFactory" %>
<%--
Created by IntelliJ IDEA.
User: Admin
Date: Mar 2, 2012
Time: 10:48:17 AM
To change this template use File | Settings | File Templates.
--%>
    <%@ include file="/includes/_taglibInclude.jsp" %>
    <link rel="stylesheet" href="css/general.css" type="text/css" media="screen" />
    <script type="text/javascript">
    function show_confirm(){

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

    <s:useActionBean beanclass="com.erp.action.PurchaseOrderActionBean" var="listofPO" event="deletePOLink"></s:useActionBean>
    <% request.setAttribute("purchaseorderlst",listofPO.getPurchaseorderlst());
        Long id=(Long)request.getSession().getAttribute("user");
                        String role= InjectorFactory.getInjector().getInstance(UserDao.class).findById(id).getRole().getName();
    %>
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
      <div class="sub_heading" >Delete Purchase</div>
    </td></tr>
   <%-- <tr valign="top"><td align="center">
    <div class="msg"><s:messages/></div>
    </td></tr>--%>
    </table>
   <table class="second_table"  ><tr><td> <div class="msg"><s:messages/></div>
    <d:table name="purchaseorderlst" id="purchaseorder1" pagesize="10" class="disp" requestURI="/PurchaseOrder.action">
    <d:column property="vendor.name" title="Supplier Name"/>
    <d:column property="purchaseOrderNo" title="Purchase Order No"  />
    <d:column property="createDate" title="Date"  />
    <d:column title="Delete" class="delete">

    <s:link beanclass="com.erp.action.PurchaseOrderActionBean" event="delete" onclick="return show_confirm();">
    <s:param name="id" value="${purchaseorder1.id}"></s:param>
     <img src="images/delete.jpg" />   </s:link>

    </d:column>

    </d:table></td></tr></table>

    </s:form></s:layout-component></s:layout-render>