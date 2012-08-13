<%@ page import="com.erp.enums.EnumModule" %>
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
<link rel="stylesheet" type="text/css" href="css/steps.css"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript">



function jqCheckAll(name)
{
if ($('#chk_add').attr('checked') )
{
$('#'+name+'[type="checkbox"]' ).attr('checked', true);
}
else {
$('#'+name+'[type="checkbox"]').attr('checked', false);
}
}
function jqCheckAll1(name)  {
if($('#chk_update').attr('checked'))
{
$('#'+name+'[type="checkbox"]').attr('checked', true);
}
else {
$('#'+name+'[type="checkbox"]').attr('checked', false);
}
}
function jqCheckAll2(name){
if($('#chk_delete').attr('checked'))
{
$('#'+name+'[type="checkbox"]' ).attr('checked', true);
}else{
$('#'+name+'[type="checkbox"]').attr('checked', false);
}
}

$(document).ready(function(){

$("#getUserPermissionsById").click(function(){
if($("#userdropdown").attr("value")=="0"){
alert("please select a value");
return false;
}

$("#checkGetClicked").attr("value","Y");
});

$("#grantUserPermission").click(function(){
if($("#userdropdown").attr("value")=="0"){
alert("please select a value");
return false;
}
/*else if($("#checkGetClicked").attr("value")=="N"){
alert("Please click on Get button");
return false;
} */
});


});

</script>
<s:useActionBean beanclass="com.erp.action.UserActionBean" var="listofuser" event="userPermissionLink"></s:useActionBean>
<% request.setAttribute("userlist",listofuser.getUserlst());
%>
<s:layout-render name="/layout/_base.jsp">
<s:layout-component name="body">
<s:form beanclass="com.erp.action.UserActionBean">
<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" >
<tr valign="top"><td >&nbsp;
</td></tr>
<tr><td align="left" class="pageheading" valign="top">
User Management > Set User Permission
</td></tr>
<tr><td><div class="wizard-steps">
  <div class="completed-step"><s:link beanclass="com.erp.action.UserActionBean" event="userLink"><span>1</span> Add User</a></s:link></div>
  <div class="completed-step"><s:link beanclass="com.erp.action.UserActionBean" event="roleLink"><span>2</span> Set Role Permission</a></s:link></div>
  <div class="active-step"><a href="#step-three"><span>3</span> Set User Permission</a></div>

</div> </td></tr>
    <tr><td>&nbsp;</td></tr>
</table>
<table width="70%"  border="1"  cellspacing="0" cellpadding="0"   align="left" bgcolor="#FCFCFC"  >
<tr>
<td align="left">
<table width="100%" border="0" cellspacing="0" cellpadding="0"  align="center">
<tr><td width="19%" align="left" valign="top">
<div align="right" style="margin-left: 2px;" class="labels">Select User<span style="color:#FF0000"> *</span></div></td>
<td width="78%" align="left" valign="top" >
<s:form beanclass="com.erp.action.UserActionBean" id="getUserPermissions" name="getUserPermissions" method="get">
<s:text name="user.username" id="addusername" class="textbox" readonly="readonly"/>
<s:hidden name="checkGetClicked" id="checkGetClicked" value="N"/>
<%--<s:submit id="getUserPermissionsById" name="getUserPermissionsById" value="Get" style="visibility:visible;" onclick="jqCheckAll('chk_Add');jqCheckAll2('chk_Delete');jqCheckAll1('chk_Update');"></s:submit>--%>
</s:form>

</td>
</tr>
<tr>
<td></td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td colspan="3"><div style="margin-left:10px;">	<table width="60%" border="0" cellspacing="0" cellpadding="0" style="border:1px solid #000000;" align="left" id="family">
<tr>
<td width="41%"   style="border-right:1px solid #000000;background:#FFCC66;"><div align="center"><strong><span style="color:#3B3131;font-size:13px;font-weight:bold;" >Modules Name</span></strong></div></td>
<td width="19%"   style="border-right:1px solid #000000; background:#FFCC66;"><div align="center"><strong><span style="color:#3B3131;font-size:13px;font-weight:bold;">Add</span></strong>
<div><input type="checkbox" name="chk_add" id="chk_add" value="chkAdd"   onclick="jqCheckAll('chk_Add');"/></div>
</div></td>
<td width="20%"   style=" border-right:1px solid #000000;background:#FFCC66;"><div align="center"><strong><span style="color:#3B3131;font-size:13px;font-weight:bold;">Update</span></strong>
<div><input type="checkbox" name="chk_update" id="chk_update" value="chkUpdate"  onclick="jqCheckAll1('chk_Update');"></div>
</div></td>
<td width="20%"   style=" background:#FFCC66;"><div align="center"><strong><span style="color:#3B3131;font-size:13px;font-weight:bold;">Delete
</span></strong>	<div><input type="checkbox" name="chk_delete" id="chk_delete" value="chkDel"   onclick="jqCheckAll2('chk_Delete');"></div></div></td>

</tr>
<c:forEach items="<%= EnumModule.values() %>" var="moduleloop" varStatus="loop" >
<tr id="tabletr">
<td style="border-top:1px solid #000000;border-right:1px solid #000000;"><div align="left" style="margin-left:4px;">
<div align="right">
<s:text  name="userPermission[${loop.index}].name" value="${moduleloop}" class="labels" readonly="readonly"  style=" border:none; text-align:right;margin-right:2px;width:200px;font-weight:bold; "/>
</div></div></td>
<td style="border-top:1px solid #000000;border-right:1px solid #000000;">
<div align="left" style="margin-left:4px;">
<div align="right">
<s:checkbox name="userPermission[${loop.index}].add" id="chk_Add" checked="userPermission[${loop.index}].add"/>
</div></div></td>
<td style="border-top:1px solid #000000;border-right:1px solid #000000;">
<div align="left" style="margin-left:4px;">
<div align="right">
<s:checkbox name="userPermission[${loop.index}].update" id="chk_Update" checked="userPermission[${loop.index}].update"/>
</div></div></td>
<td style="border-top:1px solid #000000;">
<div align="left" style="margin-left:4px;">
<div align="right">
<s:checkbox name="userPermission[${loop.index}].delete" id="chk_Delete" checked="userPermission[${loop.index}].delete"/>
</div></div></td>
</tr>   </c:forEach>
</table></div></td>
</tr>
<tr>
<td></td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td align="left">&nbsp;</td>
<td align="left" colspan="2"><div align="left">
<s:submit id="grantUserPermissionstep" name="grantUserPermissionstep" value="Add"></s:submit>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<s:submit name="cancel" value="Cancel"></s:submit>
</div></td>
</tr>
<tr>
<td align="left">&nbsp;</td>
<td align="left">&nbsp;</td>
<td align="left">&nbsp;</td>
</tr>
</table>
</td></tr></table>
</s:form>
</s:layout-component>
</s:layout-render>
