    <%@ include file="/includes/_taglibInclude.jsp" %>
    <link rel="stylesheet" href="css/general.css" type="text/css" media="screen" />
    <link rel="stylesheet" type="text/css" href="css/stylesheet.css"/>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <script type="text/javascript">
    $(document).ready(function(){

    $("#getvendorbutton").click(function(){

    if ($("#vendorName").val()=="0"){
    alert("please select the vendor name");

    return false;
    }
    });


    var phoneval = /^([0-9]{0,10})$/;

    var emailval =  /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
    $("#updtvendorbutton").click(function(){
    if ($("#updtvendorname").val().trim() ==""){
    alert("please enter vendor name.");
    $("#updtvendorname").focus() ;
    return false;
    }
    if ($("#updtvendorprdt").val().trim() ==""){
    alert("please enter product supplied.");
    $("#updtvendorprdt").focus() ;
    return false;
    }

    if ($("#updtvendoraddr").val().trim() ==""){
    alert("please enter vendor address");
    $("#updtvendoraddr").focus() ;
    return false;
    }
    if ($("#updtvendorphnno").val().trim() ==""){
    alert("please enter vendor phone number.");
    $("#updtvendorphnno").focus() ;
    return false;
    }
    else
    if(!phoneval.test($('#updtvendorphnno').val()))
    {
    alert("please give the phone number in number format and upto 10 digits only");
    $("#updtvendorphnno").val("") ;
    $("#updtvendorphnno").focus() ;

    return false;
    }

    if(!emailval.test($('#updtvendoremailid').val()) )
    {
    alert("please give the email address like abc@xyz.com");
    $("#updtvendoremailid").val("");
    $("#updtvendoremailid").focus() ;
    return false;
    }


    });
    });

    </script>
    <s:useActionBean beanclass="com.erp.action.VendorActionBean" var="listofvendor" event="deleteVendorLink"></s:useActionBean>
    <% request.setAttribute("vendorlst",listofvendor.getVendorlst());
    %>
    <s:layout-render name="/layout/_base.jsp">
    <s:layout-component name="body">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" >
    <tr valign="top"><td >&nbsp;
    </td></tr>
    <tr><td align="left" class="pageheading" valign="top">
    Vendor Management > Update Vendor
    </td></tr>
    <tr valign="top"><td align="center"><div class="msg"><s:messages/></div>
    </td></tr>
    </table>
    <s:form beanclass="com.erp.action.VendorActionBean">
    <table width="50%" border="0"><tr><td width="34%" align="left" valign="top">
    <div align="right" style="margin-left: 1px;" class="labels">Please select Vendor Name<span style="color:#FF0000"> *</span></div></td>
    <td width="36%" align="left" valign="top" >
    <s:select id="vendorName" name="id"  class="dropdown">
    <option  value="0">---Select Vendor---</option>
    <c:forEach items="${vendorlst}" var="vendor" varStatus="loop" >
    <c:choose>
    <c:when test="${actionBean.vendor.name eq vendor.name}">
    <option value ="<c:out value="${actionBean.vendor.id}"/>" selected="selected"> <c:out value="${actionBean.vendor.name}"/></option>
    </c:when>
    <c:otherwise>
    <option value ="${vendor.id}"><c:out value="${vendor.name}"/></option>
    </c:otherwise>
    </c:choose>
    </c:forEach>
    </s:select>
    </td>
    <td width="30%" align="left" valign="top" > <s:submit name="updateVendor" id="getvendorbutton"  value="Get"/></td>
    </tr></table>
    </s:form>
    <c:if test="${actionBean.vendor!=null}">
    <s:form beanclass="com.erp.action.VendorActionBean">

    <table border="1" width="66%" bgcolor="#FCFCFC" ><tr><td>
    <table width="100%" border="0" cellspacing="1" bordercolor="#FCFCFC">

    <tr>
    <td width="18%" align="right"> <div align="right" style="margin-left: 2px;" class="labels">Vendor Name<span style="color:#FF0000"> *</span></div>     </td>
    <td width="32%" align="left" valign="top"><div align="left"><s:text name="vendor.name" id="updtvendorname" class="textbox"></s:text></div><s:hidden id="updatevendorid" name="id" class="textbox"></s:hidden></td>
    <td width="18%" align="right" valign="top"><div align="right" style="margin-left: 2px;" class="labels">Product Supplied<span style="color:#FF0000"> *</span></div></td>
    <td width="32%" align="left" valign="bottom"><div align="left" ><s:text   name="vendor.productSupplied" id="updtvendorprdt" class="textbox"></s:text></div></td>
    </tr>

    <tr>
    <td align="left" valign="top" colspan="2" class="labels">Contact Details</td>
    <td align="left" valign="top" class="labels"></td>
    <td align="left" valign="top">&nbsp;</td>
    </tr>
    <tr>
    <td align="right" valign="top"><div align="right" style="margin-left: 2px;" class="labels">Address<span style="color:#FF0000"> *</span></div></td>
    <td align="left" valign="top"><div align="left"><s:text name="vendor.address" id="addvendoraddr" class="textbox"></s:text></div></td>
    <td align="right" valign="top"><div align="right" style="margin-left: 2px;" class="labels">Phone No<span style="color:#FF0000"> *</span></div></td>
    <td align="left" valign="top"><div align="left"><s:text name="vendor.phoneNo" id="addvendorphnno"  class="textbox"></s:text></div></td>
    </tr>
    <tr>
    <td align="right" valign="top"><div align="right" style="margin-left: 2px;" class="labels">Email Id</div></td>
    <td align="left" valign="top"><div align="left"><s:text name="vendor.emailId" id="addvendoremailid" class="textbox"></s:text></div></td>
    <td align="right" valign="top"><div align="right" style="margin-left: 2px;" class="labels"></div></td>
    <td align="left" valign="top"><div align="left"></div></td>
    </tr>
    <tr>
    <td align="right" valign="top"><div align="left" style="margin-left: 2px;" class="labels">Bank Details</div></td>
    <td align="left" valign="top"><div align="left"></div></td>
    <td align="right" valign="top"><div align="right" style="margin-left: 2px;" class="labels"></div></td>
    <td align="left" valign="top"><div align="left"></div></td>
    </tr>
    <tr>
    <td align="right" valign="top"><div align="right" style="margin-left: 2px;" class="labels">Account No</div></td>
    <td align="left" valign="top"><div align="left"><s:text name="vendor.accountNo" class="textbox"></s:text></div></td>
    <td align="right" valign="top"><div align="right" style="margin-left: 2px;" class="labels">Account Name</div></td>
    <td align="left" valign="top"><div align="left"><s:text name="vendor.accountName" class="textbox"></s:text></div></td>
    </tr>
    <tr>
    <td align="right" valign="top"><div align="right" style="margin-left: 2px;" class="labels">Bank</div></td>
    <td align="left" valign="top"><div align="left"><s:text name="vendor.bank" class="textbox"></s:text></div></td>
    <td align="right" valign="top"><div align="right" style="margin-left: 2px;" class="labels">Branch</div></td>
    <td align="left" valign="top"><div align="left"><s:text name="vendor.branch" class="textbox"></s:text></div></td>
    </tr>
    <tr>
    <td align="right" valign="top"><div align="right" style="margin-left: 2px;" class="labels">IFSC Code</div></td>
    <td align="left" valign="top"><div align="left"><s:text name="vendor.ifscCode" class="textbox"></s:text></div></td>
    <td align="right" valign="top"><div align="right" style="margin-left: 2px;" class="labels">Sales Tax</div></td>
    <td align="left" valign="top"><div align="left"><s:text name="vendor.salestax" id="addvendorsalestax" class="textbox"></s:text></div></td>
    </tr>
    <tr>  <td align="right" valign="top"><div align="right" style="margin-left: 2px;" class="labels">Service Tax</div></td>
    <td align="left" valign="top"><div align="left"><s:text name="vendor.servicetax" id="addvendorservicetax" class="textbox"></s:text></div></td>
    <td align="right" valign="top"><div align="right" style="margin-left: 2px;" class="labels">PAN Number</div></td>
    <td align="left" valign="top"><div align="left"><s:text name="vendor.panno" id="addvendorpanno" class="textbox"></s:text></div></td>

    </tr>
    <tr>
    <td >&nbsp;</td>
    <td colspan="2" align="right" valign="top"><div align="center"><s:submit name="update" id="updtvendorbutton" value="Update"></s:submit>&nbsp;&nbsp;
    <s:reset name="reset" value="Reset"></s:reset>
    <s:submit name="cancel" value="Cancel"></s:submit></div></td>
    <td >&nbsp;</td>

    </tr>
    </table></td></tr></table>
    </s:form>
    </c:if>
    </s:layout-component>
    </s:layout-render>
