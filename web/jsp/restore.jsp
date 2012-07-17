<%--
  Created by IntelliJ IDEA.
  User: Atul
  Date: Jul 12, 2012
  Time: 10:35:30 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/includes/_taglibInclude.jsp" %>
    <link rel="stylesheet" href="css/general.css" type="text/css" media="screen" />
<script type="text/javascript">

    $(document).ready(function(){
        var temp= $("#count").html();

        for(var i=1;i<=temp;i++)
        {
            $("#singleitemcheckboxid"+i).click(function(){

                if($("#restoreallceckboxid").is(':checked'))
                {
                    $("#restoreallceckboxid").attr("checked",false);
                    $("#restorebuttonid").attr("disabled",false);
                }
                for(var i=1;i<=temp;i++)
                {
                    if($("#singleitemcheckboxid"+i).is(':checked'))
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
                if($("#singleitemcheckboxid"+i).is(':checked'))
                {
                    $("#singleitemcheckboxid"+i).attr("checked",false);
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

<s:useActionBean beanclass="com.erp.action.ItemActionBean" var="listofitems" event="restoreItemLink"></s:useActionBean>
    <% request.setAttribute("itemlst",listofitems.getItemlst());

    %>
<s:layout-render name="/layout/_base.jsp">
     <s:layout-component name="body">
    <s:form beanclass="com.erp.action.ItemActionBean">
        <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" >
            <tr valign="top"><td >&nbsp;
            </td></tr>
            <tr><td align="left" class="pageheading" valign="top">
            Restore Item
            </td></tr>
            <tr valign="top"><td align="center"><div class="msg"><s:messages/></div>
            </td></tr>
    </table>
        <table bordercolor="#FF6600" width="77%" border="1">
        <tr>
           <td colspan="2">

               <c:if test="${actionBean.restorelistempty eq false}">
                <d:table name="itemlst" id="item1" pagesize="10" class="disp" requestURI="/Item.action">

                    <d:column title="Select Item">
                      <s:checkbox name="itemLstForRestore[${item1_rowNum}]" value="${item1.id}" id="singleitemcheckboxid${item1_rowNum}" ></s:checkbox>
                    </d:column>

                    <d:column property="itemCode" title="Item Code"/>
                    <d:column property="name" title="Item Name"  />
                    <d:column property="uom.name" title="UoM" />

                    <d:column property="section.name" title="Section" />

                    </d:table>
                   <div id="count" style="display:none;">${item1_rowNum}</div>


              <s:checkbox name="restoreAll" id="restoreallceckboxid" class="labels" value="restoreall"></s:checkbox>Restore All Items<span style="color:#FF0000"></span>

                    <s:submit name="restoreItem"  value="Restore All" id="restoreallbutton"></s:submit>
                   <s:submit name="restoreItem"  value="Restore Selected" id="restorebuttonid" ></s:submit>
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