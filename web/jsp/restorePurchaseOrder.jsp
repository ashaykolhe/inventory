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
     <s:layout-component name="body">
    <s:form beanclass="com.erp.action.RestoreActionBean">
        <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" >
            <tr valign="top"><td >&nbsp;
            </td></tr>
            <tr><td align="left" class="pageheading" valign="top">
            Restore Purchase
            </td></tr>
            <tr valign="top"><td align="center"><div class="msg"><s:messages/></div>
            </td></tr>
    </table>
        <table bordercolor="#FF6600" width="77%" border="1">
        <tr>
           <td colspan="2">

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

                    <s:submit name="restorePurchaseOrder"  value="Restore All" id="restoreallbutton" style="margin-left:6px"></s:submit>
                   <s:submit name="restorePurchaseOrder"  value="Restore Selected" id="restorebuttonid" style="margin-left:6px" ></s:submit>
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