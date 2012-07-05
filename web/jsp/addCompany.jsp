<%@ include file="/includes/_taglibInclude.jsp" %>
    <link rel="stylesheet" href="css/general.css" type="text/css" media="screen" />
<%--<%@ taglib prefix="s" uri="http://stripes.sourceforge.net/stripes.tld" %>--%>
<%--
  Created by IntelliJ IDEA.
  User: Atul
  Date: Jul 3, 2012
  Time: 3:09:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript">
    $(document).ready(function(){

         var phoneval = /^([0-9]{0,10})$/;
         var emailval =  /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
        $("#addcompanybutton").click(function(){
            if ($("#addcompanyname").val().trim() =="")
            {
                alert("Please enter the company name.");
                $("#addcompanyname").focus() ;
                return false;
            }
            if ($("#addaddress").val().trim() =="")
            {
                alert("Please enter the company address name.");
                $("#addaddress").focus() ;
                return false;
            }
            if ($("#addcity").val().trim() =="")
            {
                alert("Please enter the city.");
                $("#addcity").focus() ;
                return false;
            }
            if ($("#addstate").val().trim() =="")
            {
                alert("Please enter the state.");
                $("#addstate").focus() ;
                return false;
            }
            if ($("#addcountry").val().trim() =="")
            {
                alert("Please enter the country.");
                $("#addcountry").focus() ;
                return false;
            }
            if ($("#addpin").val().trim() =="")
            {
                alert("Please enter the pin.");
                $("#addpin").focus() ;
                return false;
            }
            if ($("#addphone").val().trim() ==""){
                alert("please enter vendor phone number.");
                $("#addphone").focus() ;
                return false;
                }
                else
                if(!phoneval.test($('#addphone').val()))
                {
                alert("please give the phone number in number format and upto 10 digits only");
                $("#addphone").val("") ;
                $("#addphone").focus() ;

                return false;
                }

                if(!emailval.test($('#addemail').val()) )
                {
                  alert("please give the email address like abc@xyz.com");
                      $("#addemail").val("");
                   $("#addemail").focus() ;
                   return false;
                }

        })
        
    })
</script>
    <s:layout-render name="/layout/_base.jsp">
    <s:layout-component name="body">
    <s:form beanclass="com.erp.action.CompanyActionBean">
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
    <td width="18%" align="right"> <div align="right" style="margin-left: 2px;" class="labels">Company Name<span style="color:#FF0000"> *</span></div>     </td>
    <td width="32%" align="left" valign="top"><div align="left"><s:text name="companyInfo.compName" id="addcompanyname" class="textbox"></s:text></div> </td>
    <td width="18%" align="right" valign="top"></td>

    <td width="32%" align="left" valign="bottom"><div align="left" >
    <s:hidden name="vendor.deleted" value="0"/>
    </div></td>
    </tr>
        <tr>
    <td width="18%" align="right"> <div align="right" style="margin-left: 2px;" class="labels">Address<span style="color:#FF0000"> *</span></div>     </td>
    <td width="32%" align="left" valign="top"><div align="left"><s:text name="companyInfo.compAddress" id="addaddress" class="textbox"></s:text></div> </td>
    <td width="18%" align="right" valign="top"><div align="right" style="margin-left: 2px;" class="labels">City<span style="color:#FF0000"> *</span></div></td>

    <td width="32%" align="left" valign="bottom"><div align="left" ><s:text id="addcity"  name="companyInfo.compCity" class="textbox"></s:text>
    
    </div></td>
    </tr>
        <tr>
    <td width="18%" align="right"> <div align="right" style="margin-left: 2px;" class="labels">State<span style="color:#FF0000"> *</span></div>     </td>
    <td width="32%" align="left" valign="top"><div align="left"><s:text name="companyInfo.compState" id="addstate" class="textbox"></s:text></div> </td>
    <td width="18%" align="right" valign="top"><div align="right" style="margin-left: 2px;" class="labels">Country<span style="color:#FF0000"> *</span></div></td>

    <td width="32%" align="left" valign="bottom"><div align="left" ><s:text id="addcountry"  name="companyInfo.compCountry" class="textbox"></s:text>

    </div></td>
    </tr>
        <tr>
    <td width="18%" align="right"> <div align="right" style="margin-left: 2px;" class="labels">Pin<span style="color:#FF0000"> *</span></div>     </td>
    <td width="32%" align="left" valign="top"><div align="left"><s:text name="companyInfo.compPin" id="addpin" class="textbox"></s:text></div> </td>
    <td width="18%" align="right" valign="top"><div align="right" style="margin-left: 2px;" class="labels">Phone<span style="color:#FF0000"> *</span></div></td>

    <td width="32%" align="left" valign="bottom"><div align="left" ><s:text id="addphone"  name="companyInfo.compPhone" class="textbox"></s:text>

    </div></td>
    </tr>
        <tr>
    <td width="18%" align="right"> <div align="right" style="margin-left: 2px;" class="labels">Email<span style="color:#FF0000"> *</span></div>     </td>
    <td width="32%" align="left" valign="top"><div align="left"><s:text name="companyInfo.compEmail" id="addemail" class="textbox"></s:text></div> </td>
    <td width="18%" align="right" valign="top"><div align="right" style="margin-left: 2px;" class="labels">Fax</div></td>

    <td width="32%" align="left" valign="bottom"><div align="left" ><s:text id="addfax"  name="companyInfo.compFax" class="textbox"></s:text>

    </div></td>
    </tr>
        <tr>
    <td width="18%" align="right"> <div align="right" style="margin-left: 2px;" class="labels">Tin Number</div>     </td>
    <td width="32%" align="left" valign="top"><div align="left"><s:text name="companyInfo.compTin" id="addtin" class="textbox"></s:text></div> </td>
    <td width="18%" align="right" valign="top"><div align="right" style="margin-left: 2px;" class="labels">Pan Number</div></td>

    <td width="32%" align="left" valign="bottom"><div align="left" ><s:text id="addpan"  name="companyInfo.compPan" class="textbox"></s:text>

    </div></td>
    </tr>
        <tr>
    <td width="18%" align="right"> <div align="right" style="margin-left: 2px;" class="labels">Excise</div>     </td>
    <td width="32%" align="left" valign="top"><div align="left"><s:text name="companyInfo.compExcise" id="addexcise" class="textbox"></s:text></div> </td>
    <td width="18%" align="right" valign="top"><div align="right" style="margin-left: 2px;" class="labels">ECC</div></td>

    <td width="32%" align="left" valign="bottom"><div align="left" ><s:text id="addecc"  name="companyInfo.compEcc" class="textbox"></s:text>

    </div></td>
    </tr>
        <tr>
    <td width="18%" align="right"> <div align="right" style="margin-left: 2px;" class="labels">License</div>     </td>
    <td width="32%" align="left" valign="top"><div align="left"><s:text name="companyInfo.licenseKey" id="addlicense" class="textbox"></s:text></div> </td>
    <td width="18%" align="right" valign="top"></td>

    <td width="32%" align="left" valign="bottom"><div align="left" >
    </div></td>
    </tr>

        <tr>
    <td >&nbsp;</td>
    <td colspan="2" align="right" valign="top"><div align="center"><s:submit id="addcompanybutton" name="addCompany" value="Add"></s:submit>&nbsp;&nbsp;&nbsp;&nbsp;
    <s:reset name="reset" value="Reset"></s:reset>   &nbsp;&nbsp;&nbsp;&nbsp;
    <s:submit name="cancel" value="Cancel"></s:submit></div></td>
    <td >&nbsp;</td>

    </tr>
        
        </table> </td> </tr>
        </table>
        </s:form>
        </s:layout-component>
        </s:layout-render>