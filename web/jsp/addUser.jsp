
    <%--
    Created by IntelliJ IDEA.
    User: Minal
    Date: Feb 17, 2012
    Time: 4:28:07 PM
    To change this template use File | Settings | File Templates.
    --%>
    <%@ include file="/includes/_taglibInclude.jsp" %>
    <%@ page  import="java.util.*" %>
    <link rel="stylesheet" href="css/general.css" type="text/css" media="screen" />
    <link rel="stylesheet" type="text/css" href="css/steps.css"/>

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
    function checkpwd(){

        var strong = new RegExp("^(?=.{8,})(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\W).*$", "g");
var medium = new RegExp("^(?=.{7,})(((?=.*[A-Z])(?=.*[a-z]))|((?=.*[A-Z])(?=.*[0-9]))|((?=.*[a-z])(?=.*[0-9]))).*$", "g");
var simple = new RegExp("(?=.{6,}).*", "g");
var password = $("#password1").val();
 if (password.length==0) {
    alert("please enter Password.");
    $("#password1").focus() ;
    return false;
} else if (false == simple.test(password)) {
$("#strength").html('<span style="color:red">Password is to simple</span>');
} else if (strong.test(password)) {
$("#strength").html('<span style="color:green">Strong!</span>');
} else if (medium.test(password)) {
$("#strength").html('<span style="color:blue">Medium!</span>');
} else {
$("#strength").html('<span style="color:red">Weak!</span>');
}
    }
    $(document).ready(function() {
    $('#err').hide();
    $('#add').click(function(){

        if ($("#adduserfullname").val().trim() ==""){
    alert("please enter name.");
    $("#adduserfullname").focus() ;
    return false;
    }
         if ($("#adduserempid").val().trim() ==""){
    alert("please enter emp id.");
    $("#adduserempid").focus() ;
    return false;
    }
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
       $("#closePopUp").click(function(){
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
    <s:form beanclass="com.erp.action.UserActionBean">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" >
    <br>
    <table class="heading_table">

    <tr><td align="left" class="pageheading" valign="top">
      <div class="sub_heading" style="height:40px">Add User</div>
        <div align="right" ><s:link beanclass="com.erp.action.UserActionBean" event="addUserLink" class="pageheading_link">Add</s:link>
                                   &nbsp;| &nbsp;    <s:link beanclass="com.erp.action.UserActionBean" event="updateUserLink" class="pageheading_link">Update</s:link>
                                    &nbsp;| &nbsp;    <s:link beanclass="com.erp.action.UserActionBean" event="deleteUserLink" class="pageheading_link">Delete</s:link>
          &nbsp;| &nbsp;    <s:link beanclass="com.erp.action.UserActionBean" event="rolePermissionLink" class="pageheading_link">Role Permission</s:link>
                                    &nbsp;| &nbsp;          <s:link beanclass="com.erp.action.UserActionBean" event="userPermissionLink" class="pageheading_link">User Permission</s:link>
        </div>
    </td></tr>
   

  <tr><td><div class="wizard-steps">
  <div class="active-step"><a href="#step-one"><span>1</span> Add User</a></div>
  <div ><a href="#"><span>2</span> Set Role Permission</a></div>
  <div ><a href="#"><span>3</span> Set User Permission</a></div>

</div></td>
    </tr>
         <tr><td>&nbsp;</td></tr>
    </table>

    <table class="second_table"  >
    <tr><td>
    <table width="100%" border="0" cellspacing="1" bordercolor="#FCFCFC">
      <tr>
    <td width="19%" align="right"> <div align="right" style="margin-left: 2px;" class="labels">Name<span style="color:#FF0000"> *</span></div>     </td>
    <td width="27%" align="left" valign="top"><div align="left"><s:text name="user.name"  id="adduserfullname" class="textbox"/>

    </div> </td>
        <c:if test="${listofuser.flag eq true}">

        <s:hidden name="user.user_id"/>
        </c:if>
    <td width="18%"><div align="left" style="margin-left: 2px;" class="labels">Department</div></td>
    <td width="36%"><div align="left"><s:text name="user.dep"  id="adduserdep" class="textbox"/>


    </div></td>
     </tr>
       
            <tr>
    <td width="19%" align="right"> <div align="right" style="margin-left: 2px;" class="labels">Email Id</div>     </td>
    <td width="27%" align="left" valign="top"><div align="left"><s:text name="user.emailId"  id="adduseremailid" class="textbox"/>


    </div> </td>

    <td width="18%"> <div align="left" style="margin-left: 2px;" class="labels">Emp Id<span style="color:#FF0000"> *</span></div></td>
    <td width="36%"><div align="left"><s:text name="user.empId"  id="adduserempid" class="textbox"/>


    </div></td>
     </tr>
           
    <tr>
    <td width="19%" align="right"> <div align="right" style="margin-left: 2px;" class="labels">User Name<span style="color:#FF0000"> *</span></div>     </td>
    <td width="27%" align="left" valign="top"><div align="left"><s:text name="user.username" onchange="return checkuser()" id="addusername" class="textbox"/>
    <s:hidden name="user.deleted" value="0"/>

    </div> </td>

    <td width="18%">   </td>
    <td width="36%">&nbsp;</td>
     </tr>
    <tr>
    <td align="right" valign="top"><div align="right" style="margin-left: 2px;" class="labels">Password<span style="color:#FF0000"> *</span></div></td>
    <td align="left" valign="top"><div align="left"><s:password name="user.password" class="textbox" onchange="return checkpwd()" id="password1"></s:password>

    </div>
     <td> <span id="strength"></span></td>
   

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
    <c:forEach items="${actionBean.rolelst}" var="role" varStatus="loop" >
    <c:choose>
    <c:when test="${actionBean.user.role.id eq role.id}">
    <option value ="<c:out value="${actionBean.user.role.id}"/>" selected="selected"> <c:out value="${actionBean.user.role.name}"/></option>
    </c:when>

    <c:otherwise>
    <option value ="<c:out value="${role.id}"/>"> <c:out value="${role.name}"/></option>
    </c:otherwise>
    </c:choose>

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
    <td  colspan="2" align="left" ><div style="margin-left: 2px;"><s:submit name="addUser" class="buttons"  value="Add" id="add"></s:submit>&nbsp;&nbsp;&nbsp;&nbsp;
    <s:reset name="reset" value="Reset" class="buttons"></s:reset>   &nbsp;&nbsp;&nbsp;&nbsp;
    <s:submit name="cancel" value="Cancel" class="buttons"></s:submit></div>
        <s:hidden name="id"  value="role.id"/></td></tr>
    </table>
    </td>
    </tr>

    </table>
    </s:form>
    <div id="popupContact" >
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
        <tr><td colspan="3" align="right"><div align="right"><s:button name="Done" id="closePopUp" value="Done"></s:button></div></td></tr>
    </table>
    </s:form>
    </p>
    </div>
    <div id="backgroundPopup"></div>
    </s:layout-component>
    </s:layout-render>
