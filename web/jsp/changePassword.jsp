    <%@ page import="com.erp.dao.UserDao" %>
    <%@ page import="com.erp.guice.InjectorFactory" %>
    <%--
    Created by IntelliJ IDEA.
    User: Minal
    Date: Feb 17, 2012
    Time: 4:28:07 PM
    To change this template use File | Settings | File Templates.
    --%>
    <%@ include file="/includes/_taglibInclude.jsp" %>
    <link rel="stylesheet" href="css/general.css" type="text/css" media="screen" />

    <link rel="stylesheet" type="text/css" href="css/stylesheet.css"/>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <s:useActionBean beanclass="com.erp.action.PurchaseOrderActionBean" var="termslist" event="termsPageRedirect"></s:useActionBean>
    <% request.setAttribute("term",termslist.getTerm());
    %>
    <script type="text/javascript">
    function CheckPassword() {


    $.post("User.action?checkPassword", {addUserName:$("#oldpassword").val().trim()}, function (data) {
    var flag=eval(data);

    if(flag)
    {
    alert("Please enter valid old password.");
    $("#oldpassword").val("");
    $("#oldpassword").focus();
    return false;
    }
    });

    }

    $(document).ready(function(){
    $("#changebtn").click(function(){
    if ($("#oldpassword").val().trim() ==""){
    alert("Please enter old password.");
    $("#oldpassword").focus() ;
    return false;
    }
    if ($("#password1").val().trim() ==""){
    alert("Please enter new password.");
    $("#password1").focus() ;
    return false;
    }
    if ($("#confpass").val().trim() ==""){
    alert("Please enter confirm password.");
    $("#confpass").focus() ;
    return false;
    }
    if($('#password1').val() !=$('#confpass').val())
    {
    alert("passwords do not match.");
    $("#confpass").val("");
    $("#confpass").focus() ;
    return false;
    }
    });
    });

    </script>

    <s:layout-render name="/layout/_base.jsp">
    <s:layout-component name="body">
    <s:form beanclass="com.erp.action.UserActionBean">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" >
    <tr valign="top"><td >&nbsp;
    </td></tr>
    <tr><td align="left" class="pageheading" valign="top">
    Admin  > Change Password
    </td></tr>
    <tr valign="top"><td align="center"><div class="msg"><s:messages/></div>
    </td></tr>
    </table>
    <table border="1" width="66%" bgcolor="#FCFCFC" ><tr><td>
    <table width="100%" border="0" cellspacing="1" bordercolor="#FCFCFC">
    <tr>


    </tr>
    <tr>
    <td align="right" valign="top"><div align="right" style="margin-left: 2px;" class="labels">Old Password<span style="color:#FF0000"> *</span></div></td>
    <td align="left" valign="top"><div align="left"><s:password name="confirmPassword" class="textbox" id="oldpassword" onchange="return CheckPassword()"></s:password>
    </div></td>

    </tr>
    <tr>
    <td align="right" valign="top"><div align="right" style="margin-left: 2px;" class="labels">New Password<span style="color:#FF0000"> *</span></div></td>
    <td align="left" valign="top"><div align="left"><s:password name="password" class="textbox" id="password1"></s:password></div></td>

    </tr>
    <tr>
    <td align="right" valign="top"><div align="right" style="margin-left: 2px;" class="labels">Confirm Password<span style="color:#FF0000"> *</span></div></td>
    <td align="left" valign="top"><div align="left"><s:password name="user.confirmPassword" class="textbox" id="confpass"></s:password>
    </div></td>

    </tr>
    <tr>
    <td>&nbsp;
    </td>
    <td>

    </td>
    </tr>


    <tr >
    <td >&nbsp;</td>
    <td  align="center">

    <div align="left" style="margin-left:65px;">

    <s:submit name="updatePassword" id="changebtn" value="Change" ></s:submit> &nbsp;&nbsp;&nbsp;&nbsp;
    <s:button name="Cancel" value="Cancel" onclick="javascript:window.close();"></s:button></div>
    </td>
    </tr>

    </table></td></tr></table>
    </s:form>
    </s:layout-component>
    </s:layout-render>
