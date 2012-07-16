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
                     <li><s:link beanclass="com.erp.action.VendorActionBean" event="addVendorLink">Add</s:link></li>
                                <li><s:link beanclass="com.erp.action.VendorActionBean" event="UpdateVendorLink">Update</s:link></li>
                                <li><s:link beanclass="com.erp.action.VendorActionBean" event="deleteVendorLink">Delete</s:link></li>
                                <li><s:link beanclass="com.erp.action.VendorActionBean" event="viewVendor">View</s:link></li>
                  </ul>

         </s:layout-component>
    <s:layout-component name="body">
    <s:form beanclass="com.erp.action.VendorActionBean">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" >
   
    <tr><td align="left" class="pageheading" valign="top">
    Vendor Management > Add Vendor
    </td></tr>
    <tr valign="top"><td align="center"><div class="msg"><s:messages/></div>
    </td></tr>
    </table>
    <table border="1" width="70%" bgcolor="#FCFCFC" ><tr><td>
    <table width="100%" border="0" cellspacing="1" bordercolor="#FCFCFC">

    <tr>
    <td width="19%" align="right"> <div align="right" style="margin-left: 2px;" class="labels">Vendor Name<span style="color:#FF0000"> *</span></div>     </td>
    <td width="29%" align="left" valign="top"><div align="left"><s:text name="vendor.name" id="addvendorname" class="textbox"></s:text></div> </td>
    <td width="25%" align="right" valign="top"><div align="right" style="margin-left: 2px;" class="labels">Products Supplied<span style="color:#FF0000"> *</span></div></td>

    <td width="27%" align="left" valign="bottom"><div align="left" ><s:text id="addvendorprdt"  name="vendor.productSupplied" class="textbox"></s:text>
    <s:hidden name="vendor.deleted" value="0"/>
    </div></td>


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
    <td colspan="2" align="right" valign="top"><div align="center"><s:submit id="addvendorbutton" name="addVendor" value="Add"></s:submit>&nbsp;&nbsp;&nbsp;&nbsp;
    <s:reset name="reset" value="Reset"></s:reset>   &nbsp;&nbsp;&nbsp;&nbsp;
    <s:submit name="cancel" value="Cancel"></s:submit></div></td>
    <td >&nbsp;</td>

    </tr>
    </table></td></tr></table>
    </s:form>
    </s:layout-component>
         <s:layout-component name="footer">
             <div  style="border-top:10px solid #ccccff;">&nbsp;</div>

         </s:layout-component>
    </s:layout-render>
