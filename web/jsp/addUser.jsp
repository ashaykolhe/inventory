
    <%--
    Created by IntelliJ IDEA.
    User: Minal
    Date: Feb 17, 2012
    Time: 4:28:07 PM
    To change this template use File | Settings | File Templates.
    --%>
    <%@ include file="/includes/_taglibInclude.jsp" %>
    <link rel="stylesheet" href="css/general.css" type="text/css" media="screen" />


    <script src="js/popup.js" type="text/javascript"></script>
    <script type="text/javascript">
      var rolename;
    function checkuser(){

    $.post("User.action?checkUserAlreadyPresent", {addUserName:$('#addusername').val()}, function (data) {
    var flag=eval(data);

    if(flag)
    {
    alert("User Already Exist !");
    $('#addusername').val("");
    $('#addusername').focus();
    }

    });


    }//end of function

    $(document).ready(function() {
    $('#err').hide();
    $('#add').click(function(){
    if ($("#addusername").val().trim() ==""){
    alert("please enter user name.");
    $("#addusername").focus() ;
    return false;
    }
    if ($("#password1").val().trim() ==""){
    alert("please enter Password.");
    $("#password1").focus() ;
    return false;
    }
    if ($("#confpass").val().trim() ==""){
    alert("please enter confirm password.");
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


    if ($("#roledropdown").val()=="0"){
    alert("please select the role");

    return false;
    }
    });


    });

    function ajaxLink(link, update) {
    if (confirm("Are you sure, you want to delete selected record."))
    {
    $ .get(link, function (data) {
    $(update).html(data);
    $(update).show();
    });
    }
    return false;
    }
    ////////////////////////////////
     function submitForm(button,update) {

    var form = button.form;
    var resolution=button.name;
    var params = $(form).serializeArray();
    if ($("#roletxt").val().trim() ==""){
    alert("Please enter role");
    $("#roletxt").focus() ;
    return false;
    }else{
    $.post("Role.action?checkRoleAlreadyPresent", {addRoleName:$("#roletxt").val().trim()}, function (data) {
    var flag=eval(data);
            
          var updatename=$('#roletxt').val().trim().toString();


    if(updatename == rolename)
    {
    params.push({name: '_eventName' , value: button.name});

    $.post("Role.action?resolution", params, function (data) {
  $( update ).html(data);
    $(update).show();
    $('#roletxt').val("");
    $('#saverolebtn').show();
    $('#updaterolebtn').hide();
        rolename=null;
    });
    return true;
    }
    else if(flag)
    {
    alert("Role Already Exist !");
    $("#roletxt").val("");
    $("#roletxt").focus();
    }
    else
    {
    params.push({name: '_eventName' , value: button.name});
    $.post("Role.action?resolution", params, function (data) {
  $( update ).html(data);
    $(update).show();
    $('#roletxt').val("");
    $('#saverolebtn').show();
    $('#updaterolebtn').hide();
    });
    }

    });

    }//end of else
    return false;
    }
    ////////////////////////////////////////
  

    function updateLink(link) {

    $ .get(link, function (data) {

    var result=eval(data);

    $('#roletxt').attr("value",result.name);
    $('#rolehdnid').attr("value",result.id);
           rolename=$('#roletxt').val().trim().toString();

    $('#saverolebtn').hide();
    $('#updaterolebtn').show();

    });
    return false;
    }

    $(document).ready(function(){


    //LOADING POPUP
    //Click the button event!
    $("#rolebutton").click(function(){
    //centering with css

    centerPopup();
    //load popup

    loadPopup();
    });



    //CLOSING POPUP
    //Click the x event!
    $("#popupContactClose").click(function(){
    disablePopup();
    $.get("Role.action?paginationRole", function (result) {
    var data=eval(result);
    var options = '<option value="0">---Select Role---</option>';
    for (var i = 0; i < data.length; i++) {
    options += '<option value="' + data[i].id + '">' + data[i].name + '</option>';
    }
    $("#roledropdown").html(options);


    });
    $("#roletxt").val("");
    $("#rolehdnid").val("");
    $('#saverolebtn').show();
    $('#updaterolebtn').hide();
    });

    //Press Escape event!
    $(document).keypress(function(e){
    if(e.keyCode==27 && popupStatus==1){
    disablePopup();
    }
    });
    });

    </script>
    <s:useActionBean beanclass="com.erp.action.UserActionBean" var="listofuser" event="addUserLink"></s:useActionBean>
    <% 
    request.setAttribute("rolelst",listofuser.getRolelst());

    %>

    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <s:layout-render name="/layout/_base.jsp">
    <s:layout-component name="body">
    <s:form beanclass="com.erp.action.UserActionBean">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" >
    <tr valign="top"><td >&nbsp;
    </td></tr>
    <tr><td align="left" class="pageheading" valign="top">
    User Management > Add User
    </td></tr>
    <tr valign="top"><td align="center">&nbsp;
    </td></tr>
    </table>

    <table border="1" width="70%" bgcolor="#FCFCFC" ><tr><td>
    <table width="100%" border="0" cellspacing="1" bordercolor="#FCFCFC">

    <tr>
    <td width="19%" align="right"> <div align="right" style="margin-left: 2px;" class="labels">Name<span style="color:#FF0000"> *</span></div>     </td>
    <td width="27%" align="left" valign="top"><div align="left"><s:text name="user.username" onchange="return checkuser()" id="addusername" class="textbox"/>
    <s:hidden name="user.deleted" value="0"/>

    </div> </td>

    <td width="24%">&nbsp;</td>
    <td width="30%">&nbsp;</td>

    <tr>
    <td align="right" valign="top"><div align="right" style="margin-left: 2px;" class="labels">Password<span style="color:#FF0000"> *</span></div></td>
    <td align="left" valign="top"><div align="left"><s:password name="user.password" class="textbox" id="password1"></s:password></div></td>

    </tr>
    <tr>
    <td align="right" valign="top"><div align="right" style="margin-left: 2px;" class="labels">Confirm Password<span style="color:#FF0000"> *</span></div></td>
    <td align="left" valign="top"><div align="left"><s:password name="user.confirmPassword" class="textbox" id="confpass"></s:password><span id="err">Passwrd doesnot match</span>
    </div></td>

    </tr>
    <tr>
    <td align="right" valign="top"><div align="right" style="margin-left: 2px;" class="labels">Role<span style="color:#FF0000"> *</span></div></td>
    <td align="left" valign="top" >

    <s:select name="user.role.id" id="roledropdown" class="dropdown">
    <option value="0">---Select Role---</option>

    <c:forEach items="${rolelst}" var="role" varStatus="loop" >

    <option value ="<c:out value="${role.id}"/>"> <c:out value="${role.name}"/></option>

    </c:forEach></s:select>
    </div></td>
    <td align="left" valign="top" >
    &nbsp;
    <s:useActionBean id="beanId" beanclass="com.erp.action.RoleActionBean"></s:useActionBean>
    <security:allowed bean="beanId" event="addroledb">
    <s:button name="add" class="links" id="rolebutton" value="Add/Update Role"></s:button>
    </security:allowed>

    </td>

    <td align="left" valign="top" ><s:errors field="user.role"/></td>

    </tr>
    <tr>
    <td>&nbsp;</td>
    <td  colspan="2" align="left" ><div style="margin-left: 2px;"><s:submit name="addUser"  value="Add" id="add"></s:submit>&nbsp;&nbsp;&nbsp;&nbsp;
    <s:reset name="reset" value="Reset"></s:reset>   &nbsp;&nbsp;&nbsp;&nbsp;
    <s:submit name="cancel" value="Cancel"></s:submit></div></td></tr>
    </table>
    </td>
    </tr>

    </table>
    </s:form>
    <div id="popupContact">
    <a id="popupContactClose">x</a>

    <h1>Add Role</h1>
    <p id="contactArea">
    <s:form beanclass="com.erp.action.RoleActionBean" id="saverole">
    <table width="100%" border="0"><tr><td>
    <s:label name="Role Name"></s:label><span style="color:#FF0000"> *</span></td>
    <td width="27%" align="left" valign="top" ><s:text name="role.name"  id="roletxt" class="textbox"></s:text>
    <s:hidden name="role.deleted" value="0"/>
    </td>

    <td id="saverolebtn"><s:hidden name="role.id" id="rolehdnid"></s:hidden>
    <s:submit name="addroledb"  value="Save"  onclick= "return submitForm(this,'#role_table');"/>

    </td>
    <td id="updaterolebtn" style="display:none;">
    <s:submit name="update"  value="Update"  onclick= "return submitForm(this,'#role_table');"/>
    </td>
    </tr>
    <tr><td colspan="3" >

    <div  id="role_table">
    <%@include file="/jsp/displaytag/role.jsp"%>
    </div>
    </td></tr>
    </table>
    </s:form>
    </p>
    </div>
    <div id="backgroundPopup"></div>
    </s:layout-component>
    </s:layout-render>
