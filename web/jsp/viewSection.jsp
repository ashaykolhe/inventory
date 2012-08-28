<%--
  Created by IntelliJ IDEA.
  User: Atul
  Date: Jul 9, 2012
  Time: 4:16:51 PM
  To change this template use File | Settings | File Templates.
--%>
  <%@ include file="/includes/_taglibInclude.jsp" %>
    <link rel="stylesheet" href="css/general.css" type="text/css" media="screen" />
    <script type="text/javascript">
    var availableTags;
    $(function() {
    $.get("Item.action?sectionDetails",function(result)
    {

        availableTags =eval(result);
        
        $("input#autocomplete").autocomplete({
        source: availableTags
    });
    });
    });
    $(document).ready(function() {
    $("#getbuttonid").click(function(){
    if ($("#autocomplete").val().trim()==""){
    alert("Please select the section")
    $("#autocomplete").val("");
    return false;
    }
    });
    });
    </script>

<s:useActionBean beanclass="com.erp.action.ItemActionBean" event="getItemBySection" var="f"></s:useActionBean>
    <%
    request.setAttribute("itemlst",f.getItemlistbysection());
   request.setAttribute("sectionlst",f.getSectionlst());
    %>

 <s:layout-render name="/layout/_base.jsp">
         <s:layout-component name="left-menu">

                 <ul>
                     <li>&nbsp;</li>
                      <li class="left_menu_heading">Item Management</li>
                      <li style="margin-top:35px"><s:link beanclass="com.erp.action.ItemActionBean" event="pagedirect">Add</s:link></li>
                      <li ><s:link beanclass="com.erp.action.ItemActionBean" event="updateitemlink">Update</s:link></li>
                                <li><s:link beanclass="com.erp.action.ItemActionBean" event="deleteitemlink">Delete</s:link></li>
                                  <%-- <li><s:link beanclass="com.erp.action.ItemActionBean" event="itemage">Item Age</s:link></li>--%>
                                   <li><s:link beanclass="com.erp.action.ItemActionBean" event="viewSectionLink">View Section</s:link></li>
                  </ul>

         </s:layout-component>
     <s:layout-component name="body">
         <s:form beanclass="com.erp.action.ItemActionBean">
          <br>
    <table class="heading_table">

    <tr><td align="left" class="pageheading" valign="top">
      <div class="sub_heading" >View Section</div>
    </td></tr>
         <%--   <tr valign="top"><td align="center"><div class="msg"><s:messages/></div>
            </td></tr>--%>
    </table>
    <table class="second_table"  >
        <tr align="center">
        <td >
        <table width="100%" cellspacing="1">
        <tr>
        <td width="16%" align="left" valign="top">Please Enter Section<span style="color:#FF0000"> *</span></td>
        <td width="84%" align="left" valign="top">
          <s:select name="sectionname" id="itemdropdown" class="dropdown">
    <option value="">---Select Section---</option>

    <c:forEach items="${sectionlst}" var="sectionloop" varStatus="loop" >
    <c:choose>
    <c:when test="${actionBean.section.id eq sectionloop.id}">
    <option value ="<c:out value="${actionBean.section.id}"/>" selected="selected"> <c:out value="${actionBean.section.name}"/></option>
    </c:when>

    <c:otherwise>
    <option value ="<c:out value="${sectionloop.id}"/>"> <c:out value="${sectionloop.name}"/></option>
    </c:otherwise>
    </c:choose>
    </c:forEach>

    </s:select>
      <%--  <s:text name="sectionname" id="autocomplete" class="textbox"></s:text>--%>
        &nbsp;&nbsp; <s:submit name="getItemBySection" class="buttons" id="getbuttonid" value="Get"></s:submit>
        </td>
        </tr>
        </table>

       <c:if test="${actionBean.itemlistbysection ne null}">

    <table id="itemdailytable"    width="915px;"><tr><td>
    <d:table name="itemlst" id="v" pagesize="10" class="disp" requestURI="/Item.action">
        <d:column property="itemCode" title="Item Code"/>
    <d:column property="name" title="Item Name"/>
    <d:column property="uom.name" title="UOM"/>
    <d:column property="section.name" title="Section"/>
    
       </d:table></td></tr>
    </table>
    </c:if>
        </td>
        </tr>
    </table>
         </s:form>
     </s:layout-component>
       <s:layout-component name="footer">
             <div  style="border-top:10px solid #ccccff;">&nbsp;</div>

         </s:layout-component>
     </s:layout-render>