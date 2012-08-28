<%@ page import="com.erp.guice.InjectorFactory" %>
<%@ page import="com.erp.dao.UserDao" %>
<%--
  Created by IntelliJ IDEA.
  User: Milind
  Date: Mar 7, 2012
  Time: 11:57:27 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="/includes/_taglibInclude.jsp" %>
<link rel="stylesheet" href="css/general.css" type="text/css" media="screen" />
<link rel="stylesheet" type="text/css" href="css/stylesheet.css"/>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="css/general.css" type="text/css" media="screen" />
 <script type="text/javascript">
           function GetItemDetail(button) {
                   var rowid=button.name.substring(button.name.indexOf("[")+1,button.name.indexOf("]"));
        $.post('PurchaseOrder.action?getItemDetails', {id:button.value}, function (data) {
        var result=eval(data);
        $('#item'+rowid+'').attr("value",result.name);
        $('#uom'+rowid+'').attr("value",result.uom.name);
    });
    return false;
    }
           $(document).ready(function(){
               $('#add').click(function(){
                          var count=$('#family #tabletr').length+1;
                          $('#family #tabletr:last').clone(true).insertAfter('#family #tabletr:last');
                          $('#family #tabletr:last input').removeAttr("value");
                          $('#family #tabletr:last select:eq(0)').attr("name","purchasedetailarray["+count+"].item.id");
                          $('#family #tabletr:last input:eq(0)').attr("id","item"+count);
                          $('#family #tabletr:last input:eq(1)').attr("id","uom"+count);
                          $('#family #tabletr:last input:eq(2)').attr("name","purchasedetailarray["+count+"].description");
                   $('#family #tabletr:last input:eq(3)').attr("name","purchasedetailarray["+count+"].make");
                   $('#family #tabletr:last input:eq(4)').attr("name","purchasedetailarray["+count+"].specification");
                          $('#family #tabletr:last input:eq(5)').attr("name","purchasedetailarray["+count+"].orderedQty");
                          $('#family #tabletr:last input:eq(6)').attr("name","purchasedetailarray["+count+"].rate");
                          $('#family #tabletr:last input:eq(7)').attr("name","purchasedetailarray["+count+"].amount");
                            });
                         });
       </script>
<script type="text/javascript">
    $(document).ready(function(){

      $("#getToGenaratePurchaseOrder").click(function(){

              if ($("#vendorName").val()=="0"){
                              alert("please select the Purcahse Order Number");

                              return false;
                          }
         });        });
        </script>
<s:useActionBean beanclass="com.erp.action.PurchaseOrderActionBean" var="listofpo" event="generateUpdatePOLink"></s:useActionBean>

    <%   Long id=(Long)request.getSession().getAttribute("user");
                        String role= InjectorFactory.getInjector().getInstance(UserDao.class).findById(id).getRole().getName();%>


<s:layout-render name="/layout/_base.jsp">
    <s:layout-component name="left-menu">

                 <ul >  <li>&nbsp;</li>
                      <li class="left_menu_heading">Purchase Order</li>

                     <li style="margin-top:35px"><s:link beanclass="com.erp.action.PurchaseOrderActionBean" event="addPOLink">Create</s:link></li>
                     <li><s:link beanclass="com.erp.action.PurchaseOrderActionBean" event="generatePurchaseOrderLink">Generate</s:link></li>
                      <li><s:link beanclass="com.erp.action.PurchaseOrderActionBean" event="deletePOLink">Delete</s:link></li>
                        <li><s:link beanclass="com.erp.action.PurchaseOrderActionBean" event="viewPOLink">View PO</s:link></li>
                     <% if(role.toLowerCase().contains("superadmin")){   %>
                                                   <li><s:link beanclass="com.erp.action.PurchaseOrderActionBean" event="approvePOLink">Approve PO(LM)</s:link></li>
                                              <li><s:link beanclass="com.erp.action.PurchaseOrderActionBean" event="approveVp">Approve PO(VP)</s:link></li>
                                           <%}%>
                                                <% if(role.toLowerCase().contains("manager")){   %>
                                                   <li><s:link beanclass="com.erp.action.PurchaseOrderActionBean" event="approvePOLink">Approve PO(LM)</s:link></li>

                                           <%}%>
                  </ul>

         </s:layout-component>
<s:layout-component name="body">


    <table  class="heading_table">
       <br>
    <tr>
    <td align="left" class="pageheading" valign="top">
     <div class="sub_heading">Generate Order</div>
    </td>
    </tr>
 </table>


<table class="second_table"  >
       <s:form beanclass="com.erp.action.PurchaseOrderActionBean">
           <td align="left">
               <table width="100%" border="0" cellspacing="0" cellpadding="0"  align="center">
           <div class="msg"><s:messages/></div>
           <tr><td width="25%" align="left" valign="top">

   <div align="left" style="margin-left: 1px;" class="labels">Please Select Purchase Order No  <span style="color:#FF0000"> *</span></div></td>
		  <td width="19%" align="left" valign="top" >

<s:select id="vendorName" name="id" class="dropdown">
                        <option  value="0">---Select PO No---</option>
              <c:forEach items="${actionBean.purchaseorderlst}" var="purchaseorderlst" varStatus="loop" >
                    <c:choose>
                  <c:when test="${actionBean.purchaseOrder.purchaseOrderNo eq purchaseorderlst.purchaseOrderNo}">
			            <option value ="<c:out value="${actionBean.purchaseOrder.id}"/>" selected="selected"> <c:out value="${actionBean.purchaseOrder.purchaseOrderNo}"/></option>
                  </c:when>

                <c:otherwise>
               <option value ="${purchaseorderlst.id}"><c:out value="${purchaseorderlst.purchaseOrderNo}"/></option>
                  </c:otherwise>
                  </c:choose>


		      </c:forEach>

                </s:select>

	        </td>

<td width="9%" align="left" valign="top" > <s:submit name="getToGenaratePurchaseOrder" id="getToGenaratePurchaseOrder" class="buttons" value="Get"/></td>
				<td width="42%" align="left" valign="top">&nbsp;</td>		</tr>  

           </s:form>
           <c:if test="${actionBean.purchaseOrder!=null}">
        <s:form beanclass="com.erp.action.PurchaseOrderActionBean">
     
    <tr>
        <td colspan="4"  align="left" valign="top">
              <table width="100%" border="0" cellspacing="0" cellpadding="0"  align="center"><tr>
                  <td width="20%" align="left" valign="top">
            <div align="left" style="margin-left: 27px;text-align:left;" class="labels">
               
                   <b> Name of Supplier
               
            :</b></div>
        </td>
	    <td width="42%" align="left" valign="top">
                <div align="left">
		            ${actionBean.purchaseOrder.vendor.name}
                </div>
        </td>
        <td width="2%">&nbsp;
                <s:hidden name="purchaseOrder.deleted" value="0"/>
        </td>                       <s:hidden name="test" value="gettestvalue"/>
        <td width="36%">&nbsp;
                <s:hidden id="purchaseOrderid" name="purchaseOrder.id" value="${actionBean.purchaseOrder.id}" class="textbox"></s:hidden>
         <s:hidden id="vendorid" name="purchaseOrder.vendor.id" value="${actionBean.purchaseOrder.vendor.name}" class="textbox"></s:hidden>
        &nbsp;    <s:hidden name="purchaseOrder.status" value="open"/>
                <s:hidden id="purchaseOrderNo" name="purchaseOrder.purchaseOrderNo" value="${actionBean.purchaseOrder.purchaseOrderNo}" class="textbox"></s:hidden>
                <s:hidden id="id" name="id" value="${actionBean.purchaseOrder.id}" class="textbox"></s:hidden>
        </td>
                  </tr>
     <tr>
        <td width="20%" align="left" valign="top">
             <div align="left" style="margin-left: 27px;text-align:left;" class="labels">   <b>      Purchase Order No
                :</b></div>
            </div>
        </td>
        <td valign="top">
            <div align="left">
                ${actionBean.purchaseOrder.purchaseOrderNo}
            </div>
        </td>
     </tr>             </table>           </td></tr>
     <tr>
            <td  colspan="4"><br><div align="left" style="margin-left:10px;">
				<table width="95%" border="0"  cellspacing="0" cellpadding="0"  align="left" id="family">
				<tr class="foreach_table">
						<td width="14%" class="foreach_table_firstth"><div align="center"><span class="foreach_th_span">Item name</span></div></td>
					    <td width="22%"  class="foreach_table_th"><div align="center"><span class="foreach_th_span">Item Code</span></div></td>
					    <td width="9%"  class="foreach_table_th"><div align="center"><span class="foreach_th_span">UoM</span></div></td>
					    <td width="12%"   class="foreach_table_th"><div align="center"><span class="foreach_th_span">Description</span></div></td>
                      <td width="12%"  class="foreach_table_th"><div align="center"><span class="foreach_th_span">Make</span></div></td>
        <td width="12%"  class="foreach_table_th"><div align="center"><span class="foreach_th_span">Specification</span></div></td>
					    <td width="13%" class="foreach_table_th"><div align="center"><span class="foreach_th_span">Ordered Qty</span></div></td>
                        <td width="12%"  class="foreach_table_th"><div align="center"><span class="foreach_th_span">Rate</span></div></td>
                        <td width="5%"  class="foreach_table_th"><div align="center"><span class="foreach_th_span">Amount</span></div></td>
        			  </tr>
                              <c:forEach items="${actionBean.purchaseOrder.purchasedetailarray}" var="purchasedetailarray" varStatus="loop" >
                      <tr id="tabletr">
					     <td class="foreach_table_firstth">
					         <div align="left" style="margin-left:4px;">
					            <div align="right">
                                  	  <s:text readonly="readonly" name="purchasedetailarray[${loop.index}].item.name" value="${purchasedetailarray.item.name}" id="item${loop.index}" class="foreach_table_td" style=" width:120px;"  />
    					         </div>
                             </div>
                         </td>
					      <td class="foreach_table_th"><div class="foreach_table_div">

                                           <s:hidden name="purchasedetailarray[${loop.index}].item.id" value="${purchasedetailarray.item.id}"  />
                              <s:text readonly="readonly" name="purchasedetailarray123[${loop.index}]" value="${purchasedetailarray.item.itemCode}"  class="foreach_table_td" style=" width:70px;"  />




                                    </div>
                         </td>
					       <td class="foreach_table_th"><div class="foreach_table_div">
					                     <s:text readonly="readonly"  name="purchasedetailarray[${loop.index}].item.uom.name" id="uom${loop.index}" value="${purchasedetailarray.item.uom.name}" class="foreach_table_td" style="width:80px; "/>

                                </div>
                           </td>
                          <td class="foreach_table_th">
                              <div class="foreach_table_div">
                                        <s:text readonly="readonly"  name="purchasedetailarray[${loop.index}].description" value="${purchasedetailarray.description}" class="foreach_table_td" style="width:80px; "/>

                                </div>
                           </td>
                           <td class="foreach_table_th">
                              <div class="foreach_table_div">
                                        <s:text readonly="readonly"  name="purchasedetailarray[${loop.index}].make" value="${purchasedetailarray.make}" class="foreach_table_td" style="width:80px; "/>

                                </div>
                           </td>
                           <td class="foreach_table_th">
                              <div class="foreach_table_div">
                                        <s:text readonly="readonly"  name="purchasedetailarray[${loop.index}].specification" value="${purchasedetailarray.specification}" class="foreach_table_td" style="width:80px; "/>

                                </div>
                           </td>
                          <td class="foreach_table_th">
                              <div class="foreach_table_div">
                                         <s:text readonly="readonly"  name="purchasedetailarray[${loop.index}].orderedQty" value="${purchasedetailarray.orderedQty}" class="foreach_table_td" style="width:70px; "/>

                                  </div>
                           </td>
                          <td class="foreach_table_th">
                              <div class="foreach_table_div">

                                <s:text readonly="readonly"  name="purchasedetailarray[${loop.index}].rate" value="${purchasedetailarray.rate}"   class="foreach_table_td" style="width:70px; "/>
					        </div></td>
                          <td class="foreach_table_th">
                              <div class="foreach_table_div">

					              <s:text readonly="readonly"  name="purchasedetailarray[${loop.index}].amount" value="${purchasedetailarray.amount}" class="foreach_table_td" style="width:70px; "/>
					        </div></td>
  					     </tr>             </c:forEach>
				</table>
				</div></td>
      </tr>
      <tr>
        <td align="left">&nbsp;</td>
        <td align="left" colspan="3">&nbsp;</td>
        <td align="left">&nbsp;</td>
      </tr>
      <tr>
	<td align="left">&nbsp;</td>
	<td align="left" colspan="3">
        <div align="left" style="margin-left:20px"> 
	        <s:submit name="generatePurchaseOrder" class="buttonbig" value="Generate PO"></s:submit>&nbsp;&nbsp;&nbsp;&nbsp;
            <s:submit name="generateUpdatePOLink" class="buttons" value="Edit"></s:submit>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	        <s:submit name="cancel" class="buttons" value="Cancel"></s:submit>
	    </div>
    </td>
	<td width="5%" align="left">&nbsp;</td>
	</tr>
    </table></td></tr>
  </table></s:form>
               </c:if>
 </s:layout-component>
    </s:layout-render>
