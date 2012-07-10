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

    %>

 <s:layout-render name="/layout/_base.jsp">
     <s:layout-component name="body">
         <s:form beanclass="com.erp.action.ItemActionBean">
     <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" >
            <tr valign="top"><td >&nbsp;
            </td></tr>
            <tr><td align="left" class="pageheading" valign="top">
            Item Management > View Section
            </td></tr>
            <tr valign="top"><td align="center"><div class="msg"><s:messages/></div>
            </td></tr>
    </table>
    <table bordercolor="#FF6600" width="77%" border="1">
        <tr align="center">
        <td width="70%"  height="58">
        <table width="100%" cellspacing="1">
        <tr>
        <td width="13%" align="left" valign="top">Select The Section</td>
        <td width="87%" align="left" valign="top">

        <s:text name="sectionname" id="autocomplete" class="textbox"></s:text>
        &nbsp;&nbsp; <s:submit name="getItemBySection" id="getbuttonid" value="Get"></s:submit>
        </td>
        </tr>
        </table>
        </td>
        </tr>
    </table>
       <c:if test="${actionBean.itemlistbysection ne null}">

    <table id="itemdailytable"  width="77%"><tr><td>
    <d:table name="itemlst" id="v" pagesize="10" class="disp" requestURI="/Item.action">
    <d:column property="name" title="Item Name"/>
    <d:column property="uom.name" title="UOM"/>
    <d:column property="section.name" title="Section"/>
    
       </d:table></td></tr>
    </table>
    </c:if>

         </s:form>
     </s:layout-component>
     </s:layout-render>