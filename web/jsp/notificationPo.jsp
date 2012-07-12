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

         $(document).ready(function(){

         });


    </script>
    <s:useActionBean beanclass="com.erp.action.PoRequestActionBean" var="listofporeq" event="notificationPoLink"></s:useActionBean>
            <%
               request.setAttribute("purchasereqlst",listofporeq.getPoReqlst());
            %>
        
    <s:layout-render name="/layout/_base.jsp">
    <s:layout-component name="body">
    <s:form beanclass="com.erp.action.PoRequestActionBean">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" >
    <tr valign="top"><td >&nbsp;
    </td></tr>
    <tr><td align="left" class="pageheading" valign="top">
    Purchase Order Request > notification
    </td></tr>
    <tr valign="top"><td align="center"><div class="msg"><s:messages/></div>
    </td></tr>
    </table>
    <table width="100%"><tr><td>
  <d:table name="purchasereqlst" export="true" id="poreq" pagesize="10" class="disp" requestURI="/PoRequestAction.action?notificationPoLink">
    <d:column property="user" title="Name Of Requester"/>
      <d:column property="createDate" title="Date"   format="{0,date,yyyy-MM-dd}" sortable="false"/>
    <d:column property="department" title="Department"/>
    <d:column property="location" title="Location"/>
    <d:column property="approvePO" title="ApprovePO"/>

    <d:column title="Ordered Qty">
      <table>
                    <c:forEach items="${poreq.purchasereqdetailarray}" var="qty" varStatus="loop" >
                        <tr>
                            <td>${qty.orderedQty}</td></tr>
                    </c:forEach>
                </table>


     </d:column>
     <d:column title="Item Name" >
      <table>
                    <c:forEach items="${poreq.purchasereqdetailarray}" var="qty" varStatus="loop" >
                        <tr>
                            <td>${qty.item.name}</td></tr>
                    </c:forEach>
                </table>


     </d:column>

    </d:table>


    </td></tr></table>

    </s:form></s:layout-component></s:layout-render>
<%--
<%@ include file="/includes/_taglibInclude.jsp" %>
   <%@ page contentType="text/html;charset=UTF-8" language="java" %>
   <s:layout-render name="/layout/_base.jsp">
       <s:useActionBean beanclass="com.erp.action.PoRequestActionBean" var="listofporeq" event="notificationPoLink"></s:useActionBean>
           <%
              request.setAttribute("purchasereqlst",listofporeq.getPoReqlst());
           %>
    <s:layout-component name="body">
    <s:form beanclass="com.erp.action.PoRequestActionBean">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" >
    <tr valign="top"><td >&nbsp;
    </td></tr>
    <tr><td align="left" class="pageheading" valign="top">
    Purchase Order Request > Notification
    </td></tr>
    <tr valign="top"><td align="center"><div class="msg"><s:messages/></div>
    </td></tr>
    </table>
       <table width="100%"><tr><td>
    <d:table name="purchasereqlst" id="preq" pagesize="10" class="disp" requestURI="/PoRequestAction.action?notificationPoLink">
    <d:column property="user" title="Name Of Requester"/>
    <d:column property="department" title="Department"/>
    <d:column property="location" title="Location"/>
    <d:column property="approvePO" title="ApprovePO"/>
    <d:column property="createDate" title="Date"   format="{0,date,yyyy-MM-dd}" sortable="false"/>
    </d:table></td></tr></table>
        </s:form>
        </s:layout-component>
        
   </s:layout-render>
--%>
