<%--
  Created by IntelliJ IDEA.
  User: Atul
  Date: Jul 18, 2012
  Time: 12:10:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/includes/_taglibInclude.jsp" %>
    <link rel="stylesheet" href="css/general.css" type="text/css" media="screen" />
<script type="text/javascript">

    $(document).ready(function(){
        var temp= $("#count").html();

        $(function(){
            function selectItem()
            {

                var flagchk=0;
                if(!$("#restoreallceckboxid").is(':checked'))
                {

                  for(var i=1;i<=temp;i++)
                    {
                        if($("#singlepocheckboxid"+i).is(':checked'))
                        {
                             flagchk++;
                        }
                    }
                   if(flagchk==0)
                   {
                         alert("Please select the Vendor to Restore.");
                         return false;
                   }
                }


            }
            $("#restoreallbutton").click(selectItem);
            $("#restorebuttonid").click(selectItem);

        });

        for(var i=1;i<=temp;i++)
        {
            $("#singlepocheckboxid"+i).click(function(){

                if($("#restoreallceckboxid").is(':checked'))
                {
                    $("#restoreallceckboxid").attr("checked",false);
                    $("#restorebuttonid").attr("disabled",false);
                }
                for(var i=1;i<=temp;i++)
                {
                    if($("#singlepocheckboxid"+i).is(':checked'))
                    {
                        var flag=1;
                    }
                }
                if(flag==1)
                {
                    $("#restoreallbutton").attr("disabled",true);
                }
                else
                {
                    $("#restoreallbutton").attr("disabled",false);
                }
            })

        }

        $("#restoreallceckboxid").click(function()
        {
            for(var i=1;i<=temp;i++)
            {
                if($("#singlepocheckboxid"+i).is(':checked'))
                {
                    $("#singlepocheckboxid"+i).attr("checked",false);
                    $("#restoreallbutton").attr("disabled",false);
                }
            }
            if($("#restoreallceckboxid").is(':checked'))
            {
                $("#restorebuttonid").attr("disabled",true);
            }
            else
            {
                 $("#restorebuttonid").attr("disabled",false);
            }
        })


    })
</script>

<s:useActionBean beanclass="com.erp.action.RestoreActionBean" var="listofitems" event="restorePOLink"></s:useActionBean>
    <% request.setAttribute("polist",listofitems.getPoList());

    %>
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
    <s:form beanclass="com.erp.action.RestoreActionBean">
        <br>
 <table class="heading_table">

 <tr><td align="left" class="pageheading" valign="top">
   <div class="sub_heading" >Restore Purchase Order</div>
      <div align="right" ><s:link beanclass="com.erp.action.RestoreActionBean" event="restoreItemLink" class="pageheading_link">Restore Items</s:link>
                                &nbsp;| &nbsp;    <s:link beanclass="com.erp.action.RestoreActionBean" event="restoreVendorLink"  class="pageheading_link">Restore Vendor</s:link>
                                 &nbsp;| &nbsp;    <s:link beanclass="com.erp.action.RestoreActionBean" event="restorePOLink" class="pageheading_link">Restore PO</s:link>

     </div>
 </td></tr>
<%-- <tr valign="top"><td align="center">
 <div class="msg"><s:messages/></div>
 </td></tr>--%>
 </table>
<table class="second_table"  ><tr><td colspan="2">
       

               <c:if test="${actionBean.restorelistempty eq false}">
                <d:table name="polist" id="poid" pagesize="10" class="disp" requestURI="/Restore.action">

                    <d:column title="Select PO">
                      <s:checkbox name="poListForRestore[${poid_rowNum}]" value="${poid.id}" id="singlepocheckboxid${poid_rowNum}" ></s:checkbox>
                    </d:column>
                      <d:column property="purchaseOrderNo" title="Purchase Order Number"  />
                    <d:column property="createDate" title="Create Date"/>

                    <d:column property="status" title="Purchase Order Status" />



                    </d:table>
                   <div id="count" style="display:none;">${poid_rowNum}</div>

                    <div style="margin-left:6px">
              <s:checkbox name="restoreAll" id="restoreallceckboxid" class="labels" value="restoreall"></s:checkbox>Restore All Items<span style="color:#FF0000"></span>

                    <s:submit name="restorePurchaseOrder"  value="Restore All" class="buttonbig" id="restoreallbutton" style="margin-left:6px"></s:submit>
                   <s:submit name="restorePurchaseOrder"  value="Restore Selected" class="buttonbig1" id="restorebuttonid" style="margin-left:6px" ></s:submit>
                  </div>
               </c:if>
               <c:if test="${actionBean.restorelistempty eq true}">
                   No Items Found For Restore.
                   </c:if>

           </td>
        </tr>


    </table>
    </s:form>
     </s:layout-component>
    </s:layout-render>