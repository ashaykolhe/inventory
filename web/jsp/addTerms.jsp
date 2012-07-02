    <%--
    Created by IntelliJ IDEA.
    User: Minal
    Date: Feb 17, 2012
    Time: 4:28:07 PM
    To change this template use File | Settings | File Templates.
    --%>
    <%@ include file="/includes/_taglibInclude.jsp" %>
    <link rel="stylesheet" href="css/general.css" type="text/css" media="screen" />
    <script type="text/javascript">
         $(document).ready(function() {
              $('#add').click(function(){  
                    if ($("#test1").val().trim() ==""){
    alert("please enter terms");
    $("#test1").focus() ;
    return false;
    }
                   });
           
         });
        </script>
    <link rel="stylesheet" type="text/css" href="css/stylesheet.css"/>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <s:useActionBean beanclass="com.erp.action.PurchaseOrderActionBean" var="termslist" event="termsPageRedirect"></s:useActionBean>
    <% request.setAttribute("term",termslist.getTerm());
    %>
    <s:layout-render name="/layout/_base.jsp">
    <s:layout-component name="body">
    <s:form beanclass="com.erp.action.PurchaseOrderActionBean">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" >
    <tr valign="top"><td >&nbsp;
    </td></tr>
    <tr><td align="left" class="pageheading" valign="top">
    Admin  > Add Terms And Condition
    </td></tr>
    <tr valign="top"><td align="center"><div class="msg"><s:messages/></div>
    </td></tr>
    </table>
    <table border="1" width="66%" bgcolor="#FCFCFC" ><tr><td>
    <table width="100%" border="0" cellspacing="1" bordercolor="#FCFCFC">
    <tr>
    <td colspan="2">
    <div align="left" ><b>Please Enter Terms And Condition:</b></div>
    </td>

    </tr>
    <tr>
    <td width="33" align="right" valign="top">
    <div align="right" ><b>1:</b></div>
    </td>
    <td width="717"><textarea name="term.firstTerm" id="test1" style="height:40px;width:600px;resize:none;" >${term.firstTerm}</textarea></td>
    </tr>
    <tr>
    <td width="33" align="right" valign="top">
    <div align="right" ><b>2:</b></div>
    </td>
    <td width="717"><textarea name="term.secondTerm" style="height:40px;width:600px;resize:none;" >${term.secondTerm}</textarea></td>
    </tr>
    <tr>
    <td width="33" align="right" valign="top">
    <div align="right" ><b>3:</b></div>
    </td>
    <td width="717"><textarea name="term.thirdTerm" style="height:40px;width:600px;resize:none;" >${term.thirdTerm}</textarea></td>
    </tr>
    <tr>
    <td width="33" align="right" valign="top">
    <div align="right" ><b>4:</b></div>
    </td>
    <td width="717"><textarea name="term.forthTerm" style="height:40px;width:600px;resize:none;" >${term.forthTerm}</textarea></td>
    </tr>
    <tr>
    <td>&nbsp;   <s:hidden name="term.id" ></s:hidden>
    </td>
    <td>

    </td>
    </tr>
    

    <tr >
    <td >&nbsp;</td>
    <td  align="center">

    <div align="left" style="margin-left:80px;">

    <s:submit name="saveTerm" value="Add" id="add"></s:submit> &nbsp;&nbsp;&nbsp;&nbsp;
    <s:button name="Cancel" value="Cancel" onclick="javascript:window.close();"></s:button></div>
    </td>
    </tr>

    </table></td></tr></table>
    </s:form>
    </s:layout-component>
    </s:layout-render>
