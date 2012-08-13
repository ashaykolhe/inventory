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
         <s:layout-component name="left-menu">

                 <ul>
                          <li>&nbsp;</li>
                      <li class="left_menu_heading">Vendor</li>
                     <li style="margin-top:35px"><s:link beanclass="com.erp.action.VendorActionBean" event="addVendorLink">Add</s:link></li>
                                <li><s:link beanclass="com.erp.action.VendorActionBean" event="UpdateVendorLink">Update</s:link></li>
                                <li><s:link beanclass="com.erp.action.VendorActionBean" event="deleteVendorLink">Delete</s:link></li>
                                <li><s:link beanclass="com.erp.action.VendorActionBean" event="viewVendor">View</s:link></li>
                  </ul>

         </s:layout-component>
    <s:layout-component name="body">
      <br>
    <table class="heading_table">

    <tr><td align="left" class="pageheading" valign="top">
      <div class="sub_heading" >Update Vendor</div>
    </td></tr>
   <%-- <tr valign="top"><td align="center"><div class="msg"><s:messages/></div>
    </td></tr>--%>
    </table>


      <table class="second_table"  >   <s:form beanclass="com.erp.action.VendorActionBean">
       <tr>
    <td align="left">
    <table width="100%" border="0" cellspacing="0" cellpadding="0"  align="center"><tr><td width="22%" align="left" valign="top">
    <div align="right" style="margin-left: 1px;" class="labels">Please select Vendor Name<span style="color:#FF0000"> *</span></div></td>
    <td width="22%" align="left" valign="top" >
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
    <td align="left" valign="top" colspan="2"> <s:submit name="updateVendor" class="buttons" id="getvendorbutton"  value="Get"/>
   </td>
    </tr>        </s:form>
    <c:if test="${actionBean.vendor!=null}">
    <s:form beanclass="com.erp.action.VendorActionBean">


   

    <tr>
    <td width="22%" align="right"> <div align="right" style="margin-left: 2px;" class="labels">Vendor Name<span style="color:#FF0000"> *</span></div>     </td>
    <td width="22%" align="left" valign="top"><div align="left"><s:text name="vendor.name" id="updtvendorname" class="textbox"></s:text></div><s:hidden id="updatevendorid" name="id" class="textbox"></s:hidden></td>
    <td width="18%" align="right" valign="top"><div align="right" style="margin-left: 2px;" class="labels">Product Supplied<span style="color:#FF0000"> *</span></div></td>
    <td width="38%" align="left" valign="bottom"><div align="left" ><s:text   name="vendor.productSupplied" id="updtvendorprdt" class="textbox"></s:text></div></td>
    </tr>

    <tr>
    <td align="left" valign="top" colspan="4" ><b>Contact Details</b></td>
    
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
    <td align="right" valign="top" colspan="4"><div align="left" style="margin-left: 2px;" ><b>Bank Details</b></div></td>
   
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
    <tr><td colspan="4">&nbsp;</td></tr>
    <tr>
    <td >&nbsp;</td>
    <td colspan="2" align="right" valign="top"><div align="left"><s:submit name="update" class="buttons" id="updtvendorbutton" value="Update"></s:submit>&nbsp;&nbsp;
    <s:reset name="reset" value="Reset" class="buttons"></s:reset>     &nbsp;&nbsp;
    <s:submit name="cancel" value="Cancel" class="buttons"></s:submit></div></td>
    <td >&nbsp;</td>

    </tr>
    </table></td></tr></table>
    </s:form>
    </c:if>
    </s:layout-component>
         <%--<s:layout-component name="footer">
             <div  style="border-top:10px solid #ccccff;">&nbsp;</div>

         </s:layout-component>--%>
    </s:layout-render>
