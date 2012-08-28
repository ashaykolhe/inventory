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
      <s:layout-component name="left-menu">

             <ul>
                 <li>&nbsp;</li>
                  <li class="left_menu_heading">Setting</li>
                  <li style="margin-top:35px">  <li> <s:link beanclass="com.erp.action.CompanyActionBean" event="pre">Setup</s:link></li>
                  <li ><s:link beanclass="com.erp.action.UserActionBean" event="addUserLink">User</s:link></li>
                             <li><s:link beanclass="com.erp.action.PurchaseOrderActionBean" event="termsPageRedirect">Terms & Condition</s:link></li>
                            <li><s:link beanclass="com.erp.action.UserActionBean" event="changePasswordLink">Change Password</s:link></li>
                               <li><s:link beanclass="com.erp.action.RestoreActionBean" event="restoreItemLink">Restore</s:link> </li>
              </ul>

     </s:layout-component>
<s:layout-component name="body">
<s:form beanclass="com.erp.action.PurchaseOrderActionBean">
   <br>
<table class="heading_table">

<tr><td align="left" class="pageheading" valign="top">
  <div class="sub_heading" >Add Terms And Condition</div>
</td></tr>
  <%--  <tr valign="top"><td align="center">&nbsp;
<div class="msg"><s:messages/></div>
</td></tr>--%>
</table>
<table class="second_table"  >
<tr>
<td align="left">
<table width="100%" border="0" cellspacing="1" bordercolor="#FCFCFC"> <div class="msg"><s:messages/></div>
<tr>
<td colspan="2">
<div align="left" ><b>Please Enter Terms And Condition:</b></div>
</td>

</tr>
<tr>
<td width="33" align="right" valign="top">
<div align="right" ></div>
</td>
<td width="717"><textarea name="term.firstTerm" id="test1" style="height:250px;width:800px;resize:none;" >${term.firstTerm}</textarea></td>
</tr>
<%--
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
--%>


<tr ><s:hidden name="term.id" ></s:hidden>
<td >&nbsp;</td>
<td  align="center">

<div align="left" style="margin-left:80px;">

<s:submit name="saveTerm" value="Add" id="add" class="buttons"></s:submit> &nbsp;&nbsp;&nbsp;&nbsp;
<s:button name="Cancel" value="Cancel" class="buttons" onclick="javascript:window.close();"></s:button></div>
</td>
</tr>

</table></td></tr></table>
</s:form>
</s:layout-component>
</s:layout-render>
