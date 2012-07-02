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
                          $('#family #tabletr:last input:eq(3)').attr("name","purchasedetailarray["+count+"].orderedQty");
                          $('#family #tabletr:last input:eq(4)').attr("name","purchasedetailarray["+count+"].rate");
                          $('#family #tabletr:last input:eq(5)').attr("name","purchasedetailarray["+count+"].amount");
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

<s:layout-render name="/layout/_base.jsp">
<s:layout-component name="body">


    <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" >
 <tr valign="top"><td >&nbsp;
 </td></tr>
 <tr><td align="left" class="pageheading" valign="top">
Purchase Order > Generate
 </td></tr>
 <tr valign="top"><td align="center">&nbsp;
 </td></tr>
 </table>
          <s:form beanclass="com.erp.action.PurchaseOrderActionBean">

 <table width="50%" border="0"><tr>
     <td width="48%" align="left" valign="top">
   <div align="right" style="margin-left: 1px;" class="labels">Please Select Purchase Order No  <span style="color:#FF0000"> *</span></div></td>
		  <td width="21%" align="left" valign="top" >

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
              <td width="3%" align="left" valign="top">&nbsp;</td>
<td width="33%" align="left" valign="top" > <s:submit name="getToGenaratePurchaseOrder" id="getToGenaratePurchaseOrder" value="Get"/></td>
						</tr></table>
           </s:form>
           <c:if test="${actionBean.purchaseOrder!=null}">
        <s:form beanclass="com.erp.action.PurchaseOrderActionBean">
     <table border="1" width="78%" bgcolor="#FCFCFC" ><tr><td>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td width="16%" align="left" valign="top">
            <div align="left" style="margin-left: 2px;" class="labels">
                <div align="right">
                    Name of Supplier
                </div>
            </div>
        </td>
	    <td width="21%" align="left" valign="top">
                <div align="left">
		            ${actionBean.purchaseOrder.vendor.name}
                </div>
        </td>
        <td width="15%">&nbsp;
                <s:hidden name="purchaseOrder.deleted" value="0"/>
        </td>                       <s:hidden name="test" value="gettestvalue"/>
        <td width="48%">&nbsp;
                <s:hidden id="purchaseOrderid" name="purchaseOrder.id" value="${actionBean.purchaseOrder.id}" class="textbox"></s:hidden>
        </td> <s:hidden id="vendorid" name="purchaseOrder.vendor.id" value="${actionBean.purchaseOrder.vendor.name}" class="textbox"></s:hidden>
        <td width="48%">&nbsp;    <s:hidden name="purchaseOrder.status" value="open"/>
                <s:hidden id="purchaseOrderNo" name="purchaseOrder.purchaseOrderNo" value="${actionBean.purchaseOrder.purchaseOrderNo}" class="textbox"></s:hidden>
                <s:hidden id="id" name="id" value="${actionBean.purchaseOrder.id}" class="textbox"></s:hidden>
        </td>
     <tr>
        <td width="16%" align="left" valign="top">
            <div align="left" style="margin-left: 15px;" class="labels">
                <div align="right">
                    Purchase Order No
                </div>
            </div>
        </td>
        <td valign="top">
            <div align="left">
                ${actionBean.purchaseOrder.purchaseOrderNo}
            </div>
        </td>
     </tr>
     <tr>
            <td  colspan="4"><br><div align="left" style="margin-left:10px;">
				<table  width="95%" border="0" cellspacing="0" cellpadding="0" style="border:1px solid #000000;" align="left" id="family">
					<tr>
						<td width="14%" height="28px" style="border-right:1px solid #000000;background:#FFCC66;"><div align="center"><strong><span style="color:#3B3131;font-size:13px;font-weight:bold;" >Item name</span></strong></div></td>
					    <td width="22%"  style="border-right:1px solid #000000; background:#FFCC66;"><div align="center"><strong><span style="color:#3B3131;font-size:13px;font-weight:bold;">Item Code</span></strong></div></td>
					    <td width="9%"  style=" border-right:1px solid #000000;background:#FFCC66;"><div align="center"><strong><span style="color:#3B3131;font-size:13px;font-weight:bold;">UoM</span></strong></div></td>
					    <td width="12%"  style=" border-right:1px solid #000000;background:#FFCC66;"><div align="center"><strong><span style="color:#3B3131;font-size:13px;font-weight:bold;">Description</span></strong></div></td>
					    <td width="13%"  style=" border-right:1px solid #000000;background:#FFCC66;"><div align="center"><strong><span style="color:#3B3131;font-size:13px;font-weight:bold;">Ordered Quantity</span></strong></div></td>
                        <td width="12%"  style=" border-right:1px solid #000000;background:#FFCC66;"><div align="center"><strong><span style="color:#3B3131;font-size:13px;font-weight:bold;">Rate</span></strong></div></td>
                        <td width="5%"  style=" background:#FFCC66;"><div align="center"><strong><span style="color:#3B3131;font-size:13px;font-weight:bold;">Amount</span></strong></div></td>
        			  </tr>
                              <c:forEach items="${actionBean.purchaseOrder.purchasedetailarray}" var="purchasedetailarray" varStatus="loop" >
                      <tr id="tabletr">
					     <td style="border-top:1px solid #000000;border-right:1px solid #000000;">
					         <div align="left" style="margin-left:4px;">
					            <div align="right">
                                  	  <s:text readonly="readonly" name="purchasedetailarray[${loop.index}].item.name" value="${purchasedetailarray.item.name}" id="item${loop.index}" class="hello" style="text-align:right;margin-right:2px; width:200px; border:none; "  />			       
    					         </div>
                             </div>
                         </td>
					     <td style="border-top:1px solid #000000;border-right:1px solid #000000;"><div align="left" style="margin-left:4px;width:100px;">
					                <div align="right">
                                           <s:hidden name="purchasedetailarray[${loop.index}].item.id" value="${purchasedetailarray.item.id}"  />
                                        ${purchasedetailarray.item.itemCode}

					                    </div>
                                    </div>
                         </td>
					       <td style="border-top:1px solid #000000;border-right:1px solid #000000;">
					            <div align="left" style="margin-left:4px;">
					                <div align="right">
					                     <s:text readonly="readonly"  name="purchasedetailarray[${loop.index}].item.uom.name" id="uom${loop.index}" value="${purchasedetailarray.item.uom.name}" style="text-align:right;margin-right:2px;width:100px; border:none;"/>
					                </div>
                                </div>
                           </td>
                           <td style="border-top:1px solid #000000;border-right:1px solid #000000;">
					            <div align="left" style="margin-left:4px;">
					                 <div align="right">
					                    <s:text readonly="readonly"  name="purchasedetailarray[${loop.index}].description" value="${purchasedetailarray.description}" style="text-align:right;margin-right:2px;width:100px; border:none;"/>
					                </div>
                                </div>
                           </td>
                           <td style="border-top:1px solid #000000;border-right:1px solid #000000;">
					              <div align="left" style="margin-left:4px;">
					                 <div align="right">
					                     <s:text readonly="readonly"  name="purchasedetailarray[${loop.index}].orderedQty" value="${purchasedetailarray.orderedQty}"  style="text-align:right;margin-right:2px;width:100px;border:none; "/>
					                 </div>
                                  </div>
                           </td>
                           <td style="border-top:1px solid #000000;border-right:1px solid #000000;"><div align="left" style="margin-left:4px;">  <div align="right">
                                <s:text readonly="readonly"  name="purchasedetailarray[${loop.index}].rate" value="${purchasedetailarray.rate}"    style="text-align:right;margin-right:2px;width:70px;border:none; "/>
					         </div></div></td>
					         <td style="border-top:1px solid #000000;"><div align="left" style="margin-left:4px;">  <div align="right">
					              <s:text readonly="readonly"  name="purchasedetailarray[${loop.index}].amount" value="${purchasedetailarray.amount}" style="text-align:right;margin-right:2px;width:100px;border:none;"/>
					        </div></div></td>
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
        <div align="left" style="margin-left:20px"> &nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;
	        <s:submit name="generatePurchaseOrder" value="Generate PO"></s:submit>&nbsp;&nbsp;&nbsp;&nbsp;
            <s:submit name="generateUpdatePOLink" value="Edit"></s:submit>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	        <s:submit name="cancel" value="Cancel"></s:submit>
	    </div>
    </td>
	<td width="3%" align="left">&nbsp;</td>
	</tr>
    </table></td></tr>
  </table></s:form>
               </c:if>
 </s:layout-component>
    </s:layout-render>
