<%@ page import="com.erp.dao.UserDao" %>
<%@ page import="com.erp.guice.InjectorFactory" %>
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
        Long id1=(Long)request.getSession().getAttribute("user");
                        String role1= InjectorFactory.getInjector().getInstance(UserDao.class).findById(id1).getRole().getName();
    %>
    <s:layout-render name="/layout/_base.jsp">
       
             <s:layout-component name="left-menu">

                 <ul >  <li>&nbsp;</li>
                      <li class="left_menu_heading">Stock Management</li>

                     <li style="margin-top:35px"><s:link beanclass="com.erp.action.GrnActionBean" event="addGrnLink">Create</s:link></li>
                    <%if(role1.toLowerCase().contains("manager")){%>
                                        <li><s:link beanclass="com.erp.action.GrnActionBean" event="verify">Pending GRNS</s:link></li>
                                          <li><s:link beanclass="com.erp.action.GrnActionBean" event="ApprovedGrnByManager">Approved GRNS</s:link></li>
                                        <%}%>
                       <%if(role1.toLowerCase().contains("superadmin")){%>
                                        <li><s:link beanclass="com.erp.action.GrnActionBean" event="verify">Pending GRNS(SM)</s:link></li>
                                         <li><s:link beanclass="com.erp.action.GrnActionBean" event="ApprovedGrnByManager">Approved GRNS(SM)</s:link></li>
                                        <li><s:link beanclass="com.erp.action.GrnActionBean" event="forAccountant">Pending GRNS(AM)</s:link></li>
                                         <li><s:link beanclass="com.erp.action.GrnActionBean" event="ApprovedGrnByAccountant">Approved GRNS(AM)</s:link></li>
                                        <%}%>
                  <li>   <s:link beanclass="com.erp.action.RequisitionActionBean" event="addRequisitionLink">Material Requisition</s:link>  </li>
                      <li><s:link beanclass="com.erp.action.StoreIssueActionBean" event="addStoreIssueLink">Issue</s:link>

                  </ul>

         </s:layout-component>
    <s:layout-component name="body">
    <s:form beanclass="com.erp.action.GrnActionBean">
    <table  class="heading_table">
       <br>
    <tr>
    <td align="left" class="pageheading" valign="top">
     <div class="sub_heading">Approved Grn</div>
    </td>
    </tr>
   <%-- <tr valign="top"><td align="center" class="pageheading"><div class="msg"><s:messages/></div>
    </td>
    </tr>--%>

    </table>
    <table  class="second_table" ><tr><td>
    <d:table name="grnlist" id="grn1" pagesize="10" class="disp" requestURI="/Grn.action?forAccountant">
    <d:column property="id" title="GRN No."/>
    <d:column property="purchaseOrder.purchaseOrderNo" title="PO No."/>

    <d:column property="orderDate" title="Date"   format="{0,date,yyyy-MM-dd}" sortable="false"/>
    <d:column property="status" title="Status"/>

    </d:table></td></tr></table>
    </s:form></s:layout-component></s:layout-render>