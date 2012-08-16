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

    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <s:useActionBean beanclass="com.erp.action.PoRequestActionBean" var="listofvendor" event="approveLink"></s:useActionBean>
    <%

    request.setAttribute("poReqlst",listofvendor.getPoReqlst());
    %>
    <s:layout-render name="/layout/_base.jsp">
    <s:layout-component name="body">
    <s:form beanclass="com.erp.action.PoRequestActionBean" id="frmPopMessage">    <br>
        <table class="heading_table">

           <tr><td align="left" class="pageheading" valign="top">
             <div class="sub_heading" >Approve Purchase Order</div>
           </td></tr>
           </table>
            <table class="second_table"  >
           <tr><td>                                                   
       <d:table name="poReqlst" id="po" pagesize="10" class="disp" requestURI="/PoRequest.action?approvePO">
    <d:column property="id" title="PORequest No."/>
    <d:column property="createDate" title="Date"   format="{0,date,yyyy-MM-dd}" sortable="false"/>
    <d:column title="Approve" class="delete">
    <d:column title="Item Name">
    <table>
    <c:forEach items="${po.purchasereqdetailarray}" var="purchaseloop" varStatus="loop" >
    <tr>  <td>${purchaseloop.item.name}</td></tr>
    </c:forEach>
    </table>     </d:column>
    <d:column title="Ordered Qty">
    <table>
    <c:forEach items="${po.purchasereqdetailarray}" var="purchaseloop1" varStatus="loop" >
    <tr>  <td>${purchaseloop1.orderedQty} </td> </tr>
    </c:forEach>  </table>
    </d:column>
    <s:link beanclass="com.erp.action.PoRequestActionBean" event="viewapprovepo" onclick="return lm_confirm();" >
    <s:param name="id" value="${po.id}"></s:param>

    <img src="images/view.png" />   </s:link>

    </d:column>

    </d:table></td></tr></table>
    </s:form>
    </s:layout-component>
    </s:layout-render>
