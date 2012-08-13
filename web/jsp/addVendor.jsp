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
    var phoneval = /^([0-9]{0,10})$/;

    var emailval =  /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
    $("#addvendorbutton").click(function(){
    if ($("#addvendorname").val().trim() ==""){
    alert("please enter vendor name.");
    $("#addvendorname").focus() ;
    return false;
    }
    if ($("#addvendorprdt").val().trim() ==""){
    alert("please enter product supplied.");
    $("#addvendorprdt").focus() ;
    return false;
    }

    if ($("#addvendoraddr").val().trim() ==""){
    alert("please enter vendor address");
    $("#addvendoraddr").focus() ;
    return false;
    }
    if ($("#addvendorphnno").val().trim() ==""){
    alert("please enter vendor phone number.");
    $("#addvendorphnno").focus() ;
    return false;
    }
    else
    if(!phoneval.test($('#addvendorphnno').val()))
    {
    alert("please give the phone number in number format and upto 10 digits only");
    $("#addvendorphnno").val("") ;
    $("#addvendorphnno").focus() ;

    return false;
    }

    if(!emailval.test($('#addvendoremailid').val()) )
    {
      alert("please give the email address like abc@xyz.com");
          $("#addvendoremailid").val("");
       $("#addvendoremailid").focus() ;
       return false;
    }


    });
    });

    </script>
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
    <s:form beanclass="com.erp.action.VendorActionBean">
      <br>
    <table class="heading_table">

    <tr><td align="left" class="pageheading" valign="top">
      <div class="sub_heading" >Add Vendor</div>
    </td></tr>
   <%-- <tr valign="top"><td align="center"><div class="msg"><s:messages/></div>
    </td></tr>--%>
    </table>
     <table class="second_table"  ><tr><td>
    <table width="100%" border="0" cellspacing="0">

    <tr>
    <td width="21%" align="left"> <div align="left" style="margin-left: 2px;" class="labels">Vendor Name<span style="color:#FF0000"> *</span></div>     </td>
    <td width="16%" align="left" valign="top"><div align="left"><s:text name="vendor.name" id="addvendorname" class="textbox"></s:text></div> </td>
    <td width="21%" align="left" valign="top"><div align="left" style="margin-left: 2px;" class="labels">Products Supplied<span style="color:#FF0000"> *</span></div></td>

    <td width="39%" align="left" valign="bottom"><div align="left" ><s:text id="addvendorprdt"  name="vendor.productSupplied" class="textbox"></s:text>
    <s:hidden name="vendor.deleted" value="0"/>
    </div></td>


    <tr>
    <td align="left" valign="top" colspan="4" ><b>Contact Details</b></td>
  
    </tr>
    <tr>
    <td align="left" valign="top"><div align="left" style="margin-left: 2px;" class="labels">Address<span style="color:#FF0000"> *</span></div></td>
    <td align="left" valign="top"><div align="left"><s:text name="vendor.address" id="addvendoraddr" class="textbox"></s:text></div></td>
    <td align="left" valign="top"><div align="left" style="margin-left: 2px;" class="labels">Phone No<span style="color:#FF0000"> *</span></div></td>
    <td align="left" valign="top"><div align="left"><s:text name="vendor.phoneNo" id="addvendorphnno"  class="textbox"></s:text></div></td>
    </tr>
    <tr>
    <td align="left" valign="top"><div align="left" style="margin-left: 2px;" class="labels">Email Id</div></td>
    <td align="left" valign="top"><div align="left"><s:text name="vendor.emailId" id="addvendoremailid" class="textbox"></s:text></div></td>
    <td align="left" valign="top"><div align="left" style="margin-left: 2px;" class="labels"></div></td>
    <td align="left" valign="top"><div align="left"></div></td>
    </tr>
    <tr>
    <td align="left" valign="top" colspan="4"><div align="left" style="margin-left: 2px;font-weight:bold"  >Bank Details</div></td>
    
    </tr>
    <tr>
    <td align="left" valign="top"><div align="left" style="margin-left: 2px;" class="labels">Account No</div></td>
    <td align="left" valign="top"><div align="left"><s:text name="vendor.accountNo" class="textbox"></s:text></div></td>
    <td align="left" valign="top"><div align="left" style="margin-left: 2px;" class="labels">Account Name</div></td>
    <td align="left" valign="top"><div align="left"><s:text name="vendor.accountName" class="textbox"></s:text></div></td>
    </tr>
    <tr>
    <td align="left" valign="top"><div align="left" style="margin-left: 2px;" class="labels">Bank</div></td>
    <td align="left" valign="top"><div align="left"><s:text name="vendor.bank" class="textbox"></s:text></div></td>
    <td align="left" valign="top"><div align="left" style="margin-left: 2px;" class="labels">Branch</div></td>
    <td align="left" valign="top"><div align="left"><s:text name="vendor.branch" class="textbox"></s:text></div></td>
    </tr>
    <tr>
    <td align="left" valign="top"><div align="left" style="margin-left: 2px;" class="labels">IFSC Code</div></td>
    <td align="left" valign="top"><div align="left"><s:text name="vendor.ifscCode" class="textbox"></s:text></div></td>
    <td align="left" valign="top"><div align="left" style="margin-left: 2px;" class="labels">Sales Tax</div></td>
    <td align="left" valign="top"><div align="left"><s:text name="vendor.salestax" id="addvendorsalestax" class="textbox"></s:text></div></td>
    </tr>
    <tr>  <td align="left" valign="top"><div align="left" style="margin-left: 2px;" class="labels">Service Tax</div></td>
    <td align="left" valign="top"><div align="left"><s:text name="vendor.servicetax" id="addvendorservicetax" class="textbox"></s:text></div></td>
    <td align="left" valign="top"><div align="left" style="margin-left: 2px;" class="labels">PAN Number</div></td>
    <td align="left" valign="top"><div align="left"><s:text name="vendor.panno" id="addvendorpanno" class="textbox"></s:text></div></td>

    </tr>
        <tr><td colspan="4"></td></tr>
    <tr>
    <td >&nbsp;</td>
    <td colspan="3" align="left" valign="top"><div align="left">
        <s:submit id="addvendorbutton" class="buttons" name="addVendor" value="Add"></s:submit>&nbsp;&nbsp;&nbsp;&nbsp;
    <s:reset name="reset" value="Reset" class="buttons"></s:reset>   &nbsp;&nbsp;&nbsp;&nbsp;
    <s:submit name="cancel" class="buttons" value="Cancel"></s:submit></div></td>
  

    </tr>
    </table></td></tr></table>
    </s:form>
    </s:layout-component>
         <s:layout-component name="footer">
             <div  style="border-top:10px solid #ccccff;">&nbsp;</div>

         </s:layout-component>
    </s:layout-render>
