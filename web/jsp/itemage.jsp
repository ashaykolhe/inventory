    <%--
    Created by IntelliJ IDEA.
    User: Milind
    Date: Mar 2, 2012
    Time: 10:21:30 AM
    To change this template use File | Settings | File Templates.
    --%>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ include file="/includes/_taglibInclude.jsp" %>
    <link rel="stylesheet" href="css/general.css" type="text/css" media="screen"/>
    <link rel="stylesheet" type="text/css" href="css/stylesheet.css"/>
    <script type="text/javascript">
    var availableTags;
    $(function() {
    $.get("Item.action?itemcodeforage",function(result) {

    availableTags =eval(result);
    $("input#autocomplete").autocomplete({
    source: availableTags
    });
    });
    });
    $(document).ready(function() {
    $("#btnitemage").click(function(){
    if ($("#autocomplete").val().trim()==""){
    alert("Enter Item Code")
    $("#autocomplete").val("");
    return false;
    }
    });
    });
    </script>
    <s:useActionBean beanclass="com.erp.action.ItemActionBean" event="itemage" var="i"></s:useActionBean>
    <%
    request.setAttribute("itemcode",i.getItemcodelst());
    %>
    <s:layout-render name="/layout/_base.jsp">
        <s:layout-component name="left-menu">

                 <ul>
                      <li><s:link beanclass="com.erp.action.ItemActionBean" event="pagedirect">Add</s:link></li>
                      <li><s:link beanclass="com.erp.action.ItemActionBean" event="updateitemlink">Update</s:link></li>
                                <li><s:link beanclass="com.erp.action.ItemActionBean" event="deleteitemlink">Delete</s:link></li>
                                   <li><s:link beanclass="com.erp.action.ItemActionBean" event="itemage">Item Age</s:link></li>
                                   <li><s:link beanclass="com.erp.action.ItemActionBean" event="viewSectionLink">View Section</s:link></li>
                  </ul>

         </s:layout-component>
    <s:layout-component name="body">
    <s:form beanclass="com.erp.action.ItemActionBean" >
    <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" >
    
    <tr><td align="left" class="pageheading" valign="top">
    <strong>Item Age</strong>
    </td></tr>
    <tr valign="top"><td align="center">&nbsp;
    </td></tr>
    </table>
    <table bordercolor="#FCFCFC" width="77%" border="1">
    <tr align="center">
    <td width="70%"  height="58">
    <table width="100%" cellspacing="1">
    <tr>
    <td width="13%" align="left" valign="top">Enter Item Code</td>
    <td width="87%" align="left" valign="top">

    <s:text name="itemcode" id="autocomplete" class="textbox"></s:text>
    &nbsp;&nbsp; <s:submit name="calculateage" id="btnitemage" value="Get"></s:submit>
    </td>
    </tr>
    </table>
    </td>
    </tr>
    </table>

    <c:if test="${actionBean.itemcode eq 'getAge'}">
    <s:useActionBean beanclass="com.erp.action.ItemActionBean" event="calculateage" var="f"></s:useActionBean>
    <%
    request.setAttribute("first",f.getFirst());
    request.setAttribute("age",f.getNoOfDays());
    request.setAttribute("last",f.getLast());
    request.setAttribute("instk",f.getInStock());

    %>
    <table id="itemdailytable"  width="100%"><tr><td>
    <d:table name="first" id="v"  class="disp" requestURI="/Item.action">
    <d:column property="item.name" title="Item Name"/>
    <d:column property="item.uom.name" title="UOM"/>
    <d:column property="item.section.name" title="Section"/>
    <d:column property="date" format="{0,date,yyyy-MM-dd}" sortable="false" title="Entry Date"/>
    <d:column property="receivedQuantity" title="Open Quantity"/>
    <d:column value="${age}" title="Item Age"/>
    <d:column value="${last.closingQuantity}" title="Today Available Qty"/>
    <d:column value="${instk}" title="In Stock"/>   </d:table></td></tr>
    </table>
    </c:if>
    <c:if test="${actionBean.itemcode eq 'NotInList'}">
    <s:useActionBean beanclass="com.erp.action.ItemActionBean" event="calculateage" var="f"></s:useActionBean>
    <%
    request.setAttribute("itemlst",f.getItemlst());

    %>
    <table id="itemdailytable"  width="100%"><tr><td>
    <d:table name="itemlst" id="v" pagesize="10" class="disp" requestURI="/Item.action">
    <d:column property="name" title="Item Name"/>
    <d:column property="uom.name" title="UOM"/>
    <d:column property="section.name" title="Section"/>
    <d:column value="-" title="Open Quantity"/>
    <d:column value="-" title="Item Age"/>
    <d:column value="-" title="Today Available Qty"/>
    <d:column value="No" title="In Stock"/>   </d:table></td></tr>
    </table>
    </c:if>

    </s:form>
    </s:layout-component>
         <s:layout-component name="footer">
             <div  style="border-top:10px solid #ccccff;">&nbsp;</div>

         </s:layout-component>
    </s:layout-render>
