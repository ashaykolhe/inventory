    <%--
    Created by IntelliJ IDEA.
    User: Minal
    Date: Feb 15, 2012
    Time: 10:06:09 PM
    To change this template use File | Settings | File Templates.
    --%>
    <%@ include file="/includes/_taglibInclude.jsp" %>
    <link rel="stylesheet" href="css/general.css" type="text/css" media="screen" />

    <script src="js/popup.js" type="text/javascript"></script>

    <script type="text/javascript">
    var sectname;
    var uomname;
    function ajaxLink(link, update) {
    if (confirm("Are you sure, you want to delete selected record."))
    {
    $ .post(link, function (data) {
    $(update).html(data);
    $(update).show();
    });
    }
    return false;
    }
    function checkitem() {

    $.post("Item.action?checkItemAlreadyPresent", {addItemName:$("#updateitemname").val().trim()}, function (data) {
    var flag=eval(data);
    var updatename=$('#updateitemname').val().trim().toString();
    var dropdownname=$("#itemdropdown option:selected").text().trim().toString();

    if(updatename == dropdownname)
    {
    return true;
    }
    else if(flag)
    {
    alert("Item Already Exist !");
    $("#updateitemname").val("");
    $("#updateitemname").focus();
    return false;
    }
    });

    }
    function submitForm(button,update) {

    var form = button.form;
    var resolution=button.name;
    var params = $(form).serializeArray();
    if ($("#sectiontxt").val().trim() ==""){
    alert("Please enter section name");
    $("#sectiontxt").focus() ;
    return false;
    }   else if($("#sectiontxt").val().trim().length< 3)
    {
    alert("section name must be Greater than or equal to three character !");
    $("#sectiontxt").focus() ;
    return false;
    }
    else{
    $.post("Item.action?checkSectionAlreadyPresent", {addSectionName:$("#sectiontxt").val().trim()}, function (data) {
    var flag=eval(data);
    var updatename=$('#sectiontxt').val().trim().toString();


    if(updatename == sectname)
    {
    params.push({name: '_eventName' , value: button.name});
    $.post("Section.action?resolution", params, function (data) {
    $( update ).html(data);
    $(update).show();
    $('#sectiontxt').val("");
    $('#savesectionbtn').show();
    $('#updatesectionbtn').hide();
             sectname=null;
    });
    return true;
    }
    else
    if(flag)
    {
    alert("Section Already Exist !");
    $("#sectiontxt").val("");
    $("#sectiontxt").focus();
    }
    else
    {
    params.push({name: '_eventName' , value: button.name});
    $.post("Section.action?resolution", params, function (data) {
    $( update ).html(data);
    $(update).show();
    $('#sectiontxt').val("");
    $('#savesectionbtn').show();
    $('#updatesectionbtn').hide();
    });
    }

    });


    }
    return false;
    }

    function submitFormuom(button,update) {
    var form = button.form;
    var resolution=button.name;
    var params = $(form).serializeArray();
    if ($("#uomtxt").val().trim() ==""){
    alert("Please enter Uom name");
    $("#uomtxt").focus() ;
    return false;
    }else{
    $.post("Item.action?checkUomAlreadyPresent", {addUomName:$("#uomtxt").val().trim()}, function (data) {
    var flag=eval(data);
    var updatename=$('#uomtxt').val().trim().toString();

    if(updatename == uomname)
    {
    params.push({name: '_eventName' , value: button.name});
    $.post("Uom.action?resolution", params, function (data) {
    $( update ).html(data);
    $(update).show();
    $('#uomtxt').val("");
    $('#saveuombtn').show();
    $('#updateuombtn').hide();
           uomname=null;
    });
    return true;
    }
    else   if(flag)
    {
    alert("Uom Already Exist !");
    $("#uomtxt").val("");
    $("#uomtxt").focus();
    }
    else
    {
    params.push({name: '_eventName' , value: button.name});
    $.post("Uom.action?resolution", params, function (data) {
    $( update ).html(data);
    $(update).show();
    $('#uomtxt').val("");
    $('#saveuombtn').show();
    $('#updateuombtn').hide();
    });
    }

    });

    }//end of else
    return false;
    }

    function updateLink(link) {

    $ .get(link, function (data) {

    var result=eval(data);

    $('#sectiontxt').attr("value",result.name);
    $('#sectionhdnid').attr("value",result.id);
    sectname=$('#sectiontxt').val().trim().toString();
    $('#savesectionbtn').hide();
    $('#updatesectionbtn').show();

    });
    return false;
    }
    function updateLinkuom(link) {

    $ .get(link, function (data) {

    var result=eval(data);

    $('#uomtxt').attr("value",result.name);
    $('#uomhdnid').attr("value",result.id);
    uomname=$('#uomtxt').val().trim().toString();
    $('#saveuombtn').hide();
    $('#updateuombtn').show();

    });
    return false;
    }

    $(document).ready(function(){
          var phoneval = /^[0-9 ]+$/;
    $("#getitembutton").click(function(){
    if ($("#itemdropdown").val().trim() ==""){
    alert("please select the Item name");

    return false;
    }
    });

    $("#updateitembutton").click(function()
    {

    var characterReg = /^\s*[a-zA-Z,\s]+\s*$/;

    if ($("#updateitemname").val().trim() ==""){
    alert("please enter item name.");
    $("#updateitemname").focus() ;
    return false;
    }
    /* else
    {
    if(!characterReg.test($('#updateitemname').val()))
    {
    alert("Only  characters allowed.") ;
    $("#updateitemname").val("");
    $("#updateitemname").focus() ;
    return false;
    }
    }*/
    if ($("#uomdropdown").val().trim() ==""){
    alert("please select the UOM name");

    return false;
    }

    if ($("#sectiondropdown").val().trim() ==""){
    alert("please select the Section name");

    return false;
    }
    if ($("#rol").val().trim() ==""){
    alert("please enter ROL.");
    $("#rol").focus() ;
    return false;
    }
    else
    if(!phoneval.test($('#rol').val()))
    {
    alert("please give Rol in number format");
    $("#rol").val("") ;
    $("#rol").focus() ;

    return false;
    }
    return true;
    });

    //LOADING POPUP
    //Click the button event!
    $("#sectionbutton").click(function(){
    //centering with css

    centerPopup();
    //load popup

    loadPopup();
    });
    $("#uombutton").click(function(){
    //centering with css

    centerPopup1();
    //load popup

    loadPopup1();
    });


    $("#popupContactClose1").click(function(){
    disablePopup1();

    $.get("Uom.action?paginationUom", function (result) {
    var data=eval(result);
    var options = '<option value="">---Select UOM---</option>';
    for (var i = 0; i < data.length; i++) {
    options += '<option value="' + data[i].id + '">' + data[i].name + '</option>';
    }
    $("#uomdropdown").html(options);


    });
    $("#uomtxt").val("");
    $("#uomhdnid").val("");
    $('#saveuombtn').show();
    $('#updateuombtn').hide();
    });
    //Click out event!
    /*
    $("#backgroundPopup").click(function(){
    disablePopup1();
    });
    */
    //CLOSING POPUP
    //Click the x event!
    $("#popupContactClose").click(function(){
    disablePopup();
    $.get("Section.action?paginationSection", function (result) {
    var data=eval(result);
    var options = '<option value="">---Select Section---</option>';
    for (var i = 0; i < data.length; i++) {
    options += '<option value="' + data[i].id + '">' + data[i].name + '</option>';
    }
    $("#sectiondropdown").html(options);


    });
    $("#sectiontxt").val("");
    $("#sectionhdnid").val("");
    $('#savesectionbtn').show();
    $('#updatesectionbtn').hide();
    });
    
    //Press Escape event!
    $(document).keypress(function(e){
    if(e.keyCode==27 && popupStatus==1){
    disablePopup();
    }
    });
    });
    </script>
    <s:useActionBean beanclass="com.erp.action.ItemActionBean" var="listofitems" event="pagedirect"></s:useActionBean>
    <% request.setAttribute("itemlst",listofitems.getItemlst());
    request.setAttribute("sectionlst",listofitems.getSectionlst());
    request.setAttribute("uomlst",listofitems.getUomlst());
    %>
    <s:layout-render name="/layout/_base.jsp">
    <s:layout-component name="body">

    <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" >
    <tr valign="top"><td >&nbsp;
    </td></tr>
    <tr><td align="left" class="pageheading" valign="top">
    Item Management > Update Item
    </td></tr>
    <tr valign="top"><td align="center">
    <div class="msg"><s:messages/></div>
    </td></tr>
    </table>
    <s:form beanclass="com.erp.action.ItemActionBean">
    <table width="50%" border="0"><tr><td width="34%" align="left" valign="top">
    <div align="right" style="margin-left: 1px;" class="labels">Please select Item Name<span style="color:#FF0000"> *</span></div></td>
    <td width="36%" align="left" valign="top" >
    <s:select name="id" id="itemdropdown" class="dropdown">
    <option value="">---Select Item---</option>

    <c:forEach items="${itemlst}" var="itemloop" varStatus="loop" >
    <c:choose>
    <c:when test="${actionBean.itemnew.name eq itemloop.name}">
    <option value ="<c:out value="${actionBean.itemnew.id}"/>" selected="selected"> <c:out value="${actionBean.itemnew.name}"/></option>
    </c:when>

    <c:otherwise>
    <option value ="<c:out value="${itemloop.id}"/>"> <c:out value="${itemloop.name}"/></option>
    </c:otherwise>
    </c:choose>
    </c:forEach>

    </s:select>

    </td>

    <td width="30%" align="left" valign="top" > <s:submit name="getitem" id="getitembutton"  value="Get"/></td>
    </tr></table>        </s:form>
    <c:if test="${actionBean.itemnew!=null}">
    <s:form beanclass="com.erp.action.ItemActionBean">
    <table width="70%"  border="1"  cellspacing="0" cellpadding="0"   align="left" bgcolor="#FCFCFC" id="itemupdate_table">
    <tr>
    <td align="left">
    <table width="100%" border="0" cellspacing="0" cellpadding="0"  align="center">

    <tr ><td width="24%" align="left" valign="top">
    <div align="right" style="margin-left: 2px;" class="labels"><s:label name="Item Name"></s:label><span style="color:#FF0000"> *</span></div></td>
    <td width="25%" align="left" valign="top" ><s:text id="updateitemname" name="itemnew.name" class="textbox" onchange="return checkitem()"></s:text>
    <s:hidden name="itemnew.deleted"   value="0"/>
    </td>
    <td width="22%" align="left" valign="top" ><s:hidden id="updateitemname" name="itemnew.id" class="textbox"></s:hidden> </td>

    </tr>

    <tr ><td width="24%" align="left" valign="top">
    <div align="right" style="margin-left: 2px;" class="labels"><s:label name="Item Code"></s:label></div></td>
    <td width="25%" align="left" valign="top" ><s:text id="itemcode" readonly="readonly" name="itemnew.itemCode" class="textbox"></s:text>

    </td>
    <td width="22%" align="left" valign="top" > </td>

    </tr>

    <tr><td align="left" valign="top">
    <div align="right" style="margin-left: 2px;" class="labels">Item UoM<span style="color:#FF0000"> *</span></div></td>
    <td align="left" valign="top" >

    <s:select name="itemnew.uom.id" id="uomdropdown" class="dropdown">
    <option value="">---Select UoM---</option>
    <c:forEach items="${uomlst}" var="uomloop" varStatus="loop" >
    <c:choose>
    <c:when test="${actionBean.itemnew.uom.name eq uomloop.name}">
    <option value ="<c:out value="${actionBean.itemnew.uom.id}"/>" selected="selected"> <c:out value="${actionBean.itemnew.uom.name}"/></option>
    </c:when>

    <c:otherwise>
    <option value ="<c:out value="${uomloop.id}"/>"> <c:out value="${uomloop.name}"/></option>
    </c:otherwise>
    </c:choose>
    </c:forEach>




    </s:select>

    </td>
    <td align="left" valign="top" ><s:button name="add" class="links" id="uombutton" value="Add/Update UoM"></s:button></td>
    <td width="26%" align="left" valign="top" ></td>
    </tr>


    <tr><td align="left" valign="top">
    <div align="right" style="margin-left: 2px;" class="labels">Item Section<span style="color:#FF0000"> *</span></div></td>
    <td align="left" valign="top" >
    <s:select name="itemnew.section.id" id="sectiondropdown" class="dropdown">
    <option value="">---Select Section---</option>
    <c:forEach items="${sectionlst}" var="sectionloop" varStatus="loop" >
    <c:choose>
    <c:when test="${actionBean.itemnew.section.name eq sectionloop.name}">
    <option value ="<c:out value="${actionBean.itemnew.section.id}"/>" selected="selected"> <c:out value="${actionBean.itemnew.section.name}"/></option>
    </c:when>

    <c:otherwise>
    <option value ="<c:out value="${sectionloop.id}"/>"> <c:out value="${sectionloop.name}"/></option>
    </c:otherwise>
    </c:choose>
    </c:forEach>




    </s:select>
    </td>
    <td align="left" valign="top" ><s:button name="add" class="links" id="sectionbutton" value="Add/Update section"></s:button></td>
    <td align="left" valign="top" ></td>
    </tr>
      <tr ><td width="14%" align="left" valign="top">
    <div align="right" style="margin-left: 2px;" class="labels"><s:label name="ROL"></s:label><span style="color:#FF0000"> *</span></div></td>
    <td width="21%" align="left" valign="top" ><s:text name="itemnew.rol" class="textbox" id="rol" ></s:text></td>
    <td width="34%" align="left" valign="top" >
    <s:hidden name="itemnew.deleted" value="0"/>
    </td>

    </tr>
     <tr>
    <td align="right" valign="top"><div align="right" style="margin-left: 2px;" class="labels">Expiry Date Applicable<span style="color:#FF0000"> *</span></div></td>
    <td colspan="2" align="left" valign="top" class="labels"><div align="left">
        <s:radio  value="Yes" id="radio1"  name="itemnew.expiryDate"></s:radio>
        Yes&nbsp;
        <s:radio  value="No" id="radio2"   name="itemnew.expiryDate"></s:radio>
        No</div></td>


    </tr>

    <tr>
    <td></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    </tr>

    <tr>
    <td align="left">&nbsp;</td>
    <td align="left" colspan="3"><div align="left">
    <s:submit name="updateitem" id="updateitembutton"  value="Update"></s:submit>

    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <s:submit name="cancel" value="Cancel"></s:submit>
    </div></td>
    <td width="3%" align="left">&nbsp;</td>
    </tr>
    <tr>
    <td align="left">&nbsp;</td>
    <td align="left">&nbsp;</td>
    <td align="left">&nbsp;</td>
    <td align="left">&nbsp;</td>
    </tr>
    </table>
    </td>
    </tr>

    </table>
    </s:form>

    <div id="popupContact">
    <a id="popupContactClose">x</a>

    <h1>Add Section</h1>
    <p id="contactArea">
    <s:form beanclass="com.erp.action.SectionActionBean" id="savesection" >
    <table width="100%" border="0"><tr><td>
    <s:label name="Section Name"></s:label><span style="color:#FF0000"> *</span></td>
    <td width="27%" align="left" valign="top" ><s:text name="section.name"  id="sectiontxt" class="textbox"></s:text>
    <s:hidden name="section.deleted" value="0"/>
    </td>

    <td id="savesectionbtn"><s:hidden name="section.id" id="sectionhdnid"></s:hidden>
    <s:submit name="addsection"  value="Save" onclick= "return submitForm(this,'#section_table');"/>

    </td>
    <td id="updatesectionbtn" style="display:none;">
    <s:submit name="update"  value="Update"  onclick= "return submitForm(this,'#section_table');"/>
    </td>
    </tr>
    <tr><td colspan="3" >

    <div  id="section_table">
    <%@include file="/jsp/displaytag/section.jsp"%>
    </div>

    </td></tr>
    </table>
    </s:form>
    </p>
    </div>
    <div id="backgroundPopup"></div>

    <div id="popupContact1">
    <a id="popupContactClose1">x</a>

    <h1>Add UoM</h1>
    <p id="contactArea1">

    <s:form beanclass="com.erp.action.UomActionBean" id="saveuom" >
    <table width="100%" border="0"><tr><td>
    <s:label name="UoM Name"></s:label><span style="color:#FF0000"> *</span></td>
    <td width="27%" align="left" valign="top" ><s:text name="uom.name"  id="uomtxt" class="textbox"></s:text>
    <s:hidden name="uom.deleted" value="0"/>
    </td>

    <td id="saveuombtn"><s:hidden name="uom.id" id="uomhdnid"></s:hidden>
    <s:submit name="adduom"  value="Save" onclick= "return submitFormuom(this,'#uom_table');"/>

    </td>
    <td id="updateuombtn" style="display:none;">
    <s:submit name="update"  value="Update"  onclick= "return submitFormuom(this,'#uom_table');"/>
    </td>
    </tr>
    <tr><td colspan="3" >

    <div  id="uom_table">
    <%@include file="/jsp/displaytag/uom.jsp"%>
    </div>

    </td></tr>
    </table>
    </td></tr>
    </table></s:form>
    </p>
    </div>
    <div id="backgroundPopup"></div>
    </c:if>
    </s:layout-component></s:layout-render>