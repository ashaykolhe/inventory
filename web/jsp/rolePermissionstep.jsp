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
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript">

$(document).ready(function(){

$("#getRolePermissionsById").click(function(){
if($("#roledropdown").attr("value")=="0"){
alert("please select a value");
return false;
}
$("#checkGetClicked").attr("value","Y");
});

$("#grantRolePermission").click(function(){
if($("#roledropdown").attr("value")=="0"){
alert("please select a value");
return false;
}
/*else if($("#checkGetClicked").attr("value")=="N"){
alert("Please click on Get button");
return false;
} */


});


});


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
</script>
<s:useActionBean beanclass="com.erp.action.UserActionBean" var="listofuser" event="rolePermissionLink"></s:useActionBean>
<% request.setAttribute("rolelst",listofuser.getRolelst());
%>
<s:layout-render name="/layout/_base.jsp">
<s:layout-component name="body">
<s:form beanclass="com.erp.action.UserActionBean">
<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" >
<tr valign="top"><td >&nbsp;
</td></tr>
<tr><td align="left" class="pageheading" valign="top">
User Management > Set Role Permission
</td></tr>
<tr valign="top"><td align="center">&nbsp;
</td></tr>
</table>
<table width="70%"  border="1"  cellspacing="0" cellpadding="0"   align="left" bgcolor="#FCFCFC"  >
<tr>
<td align="left">
<table width="100%" border="0" cellspacing="0" cellpadding="0"  align="center">
<tr><td width="19%" align="left" valign="top">
<div align="right" style="margin-left: 2px;" class="labels">Select Role<span style="color:#FF0000"> *</span></div></td>
<td width="78%" align="left" valign="top" >
<s:form beanclass="com.erp.action.UserActionBean" id="getRolePermissions" name="getRolePermissions" method="get">
<s:text name="user.username" id="addusername" class="textbox"readonly="readonly"/>
<s:hidden name="checkGetClicked" id="checkGetClicked" value="N"/>
    <s:hidden name="id"  value="role.id"/>
<%--<s:submit id="getRolePermissionsById" name="getRolePermissionsById" value="Get" style="visibility:visible;" onclick="jqCheckAll('chk_Add');jqCheckAll2('chk_Delete');jqCheckAll1('chk_Update');"></s:submit>                      --%>
</s:form>
</td>
</tr>
<tr>
<td></td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td colspan="3"><div style="margin-left:10px;">
<table width="60%" border="0" cellspacing="0" cellpadding="0" style="border:1px solid #000000;" align="left" id="family">
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
<s:text  name="rolePermission[${loop.index}].name" value="${moduleloop}" class="labels" readonly="readonly"  style=" border:none; text-align:right;margin-right:2px;width:200px;font-weight:bold; "/>
</div></div></td>
<td style="border-top:1px solid #000000;border-right:1px solid #000000;">
<div align="left" style="margin-left:4px;">
<div align="right">
<s:checkbox name="rolePermission[${loop.index}].add" id="chk_Add" checked="rolePermission[${loop.index}].add"/>
</div></div></td>
<td style="border-top:1px solid #000000;border-right:1px solid #000000;">
<div align="left" style="margin-left:4px;">
<div align="right">
<s:checkbox name="rolePermission[${loop.index}].update" id="chk_Update" checked="rolePermission[${loop.index}].update"/>
</div></div></td>
<td style="border-top:1px solid #000000;">
<div align="left" style="margin-left:4px;">
<div align="right">
<s:checkbox name="rolePermission[${loop.index}].delete" id="chk_Delete" checked="rolePermission[${loop.index}].delete"/>
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
<s:submit name="grantRolePermission" id="grantRolePermission" value="Add"></s:submit>
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
