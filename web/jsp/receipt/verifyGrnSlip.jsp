<%@ page import="java.util.Date" %>
<%@ page import="com.erp.dao.GrnDao" %>
<%@ taglib prefix="s" uri="http://stripes.sourceforge.net/stripes.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="http://jqueryjs.googlecode.com/files/jquery-1.2.6.min.js" type="text/javascript"></script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script type="text/javascript">
function reloadParentAndClose(i)
{
    /*window.opener.location.href="/Grn.action?verification=";
    window.opener.location.reload();*/
   var n=parseInt(i);
   /* window.close();*/
}
</script>
<s:useActionBean beanclass="com.erp.action.GrnActionBean" var="listofgrn" event="redirectpopup"></s:useActionBean>
<%
    request.setAttribute("grn",listofgrn.getGrn());
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>ERP APPLICATION</title>
<link rel="stylesheet" type="text/css" href="css/stylesheet.css"/>
</head>
<body>
<s:form beanclass="com.erp.action.GrnActionBean">
<table width="760px" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td><div align="center" class="style3" style="text-decoration:underline">GOODS RECEIPT NOTE</div></td>
  </tr>
  <tr>
    <td><table width="102%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td valign="top">&nbsp;</td>
        <td valign="top">&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <s:hidden name="grn.id" value="${grn.id}"></s:hidden>
        <s:hidden name="hndvalue" value="test"></s:hidden>
        <td width="6%" align="right" valign="top"><div align="center"><span class="style1">NAME<strong>:</strong></span></div></td>
        <td width="25%" align="left" valign="top"><div align="left">&nbsp;&nbsp;${grn.purchaseOrder.vendor.name}</div></td>
        <td width="1%" rowspan="5" valign="top">&nbsp;</td>
        <td width="13%" align="right" valign="top"><div align="right"><span class="style1">GRN NO<strong>:</strong></span></div></td>
        <td align="left" valign="top"><div align="left">&nbsp;&nbsp;${grn.id}</div></td>
        <td width="2%" valign="top"></td>
        <td width="12%" align="right" valign="top"><div align="right"><span class="style1">Date<strong>:</strong></span></div></td>
        <fmt:formatDate value="<%=new Date()%>" var="d" pattern="yyyy-MM-dd"></fmt:formatDate>
        <td align="left" valign="top"><div align="left">&nbsp;&nbsp;${d}</div></td>
        <td width="1%" valign="top"></td>
      </tr>
      <tr>
        <td valign="top">&nbsp;</td>
        <td valign="top">&nbsp;</td>
        <td width="13%" align="right" valign="top" class="style1"><div align="right">Order No<strong>:</strong></div></td>
        <td align="left" valign="top"><div align="left">&nbsp;&nbsp;${grn.orderNo}</div></td>
        <td valign="top">&nbsp;</td>
        <td align="right" valign="top"><div align="right"><span class="style1">Order Date<strong>:</strong></span></div></td>
                   <fmt:formatDate value="${grn.orderDate}" var="orderdate" pattern="yyyy-MM-dd"></fmt:formatDate>
        <td align="left" valign="top"><div align="left">&nbsp;&nbsp;${orderdate} </div></td>
        <td valign="top">&nbsp;</td>
      </tr>
      <tr>
        <td valign="top">&nbsp;</td>
        <td valign="top">&nbsp;</td>
        <td width="13%" align="right" valign="top"><div align="right" class="style1">Challen No<strong>:</strong></div></td>
        <td align="left" valign="top"><div align="left">&nbsp;&nbsp;${grn.challanNo}</div></td>
        <td valign="top">&nbsp;</td>
                <fmt:formatDate value="${grn.challanDate}" var="challandate" pattern="yyyy-MM-dd"></fmt:formatDate>

        <td align="right" valign="top"><div align="right"><span class="style1">Challan Date<strong>:</strong></span></div></td>
        <td align="left" valign="top"><div align="left">&nbsp;&nbsp;${challandate}</div></td>
        <td valign="top">&nbsp;</td>
      </tr>
      <tr>
        <td valign="top">&nbsp;</td>
        <td valign="top">&nbsp;</td>
        <td width="13%" align="right" valign="top" class="style1"><div align="right"> Bill No<strong>:</strong></div></td>
        <td align="left" valign="top"><div align="left">&nbsp;&nbsp;${grn.billNo}</div></td>
        <td valign="top">&nbsp;</td>
        <td align="right" valign="top"><div align="right"><span class="style1">Bill Date<strong>:</strong></span></div></td>
          <fmt:formatDate value="${grn.billDate}" var="billdate" pattern="yyyy-MM-dd"></fmt:formatDate>
        <td align="left" valign="top"><div align="left">&nbsp;&nbsp;${billdate}</div></td>
        <td valign="top">&nbsp;</td>
      </tr>
      <tr>
        <td valign="top">&nbsp;</td>
        <td valign="top">&nbsp;</td>
        <td width="13%" align="right" valign="top" class="style1">Bill Value<strong>:</strong></td>
        <td align="left" valign="top"><div align="left">&nbsp;&nbsp;${grn.billValue}</div></td>
        <td valign="top">&nbsp;</td>
        <td align="right" valign="top" class="style1">Trunk No<strong>:</strong></td>
        <td align="left" valign="top"><div align="left">&nbsp;&nbsp;${grn.truckNo}</div></td>
        <td>&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><table width="730px" border="1" cellspacing="0" cellpadding="0" align="center">
      <tr>
        <td  height="34" align="center" valign="middle">Item Code</td>
        <td  align="center">Item Name</td>
        <td  align="center">UOM</td>
        <td  align="center">Challan Qty</td>
        <td  align="center">Received Qty</td>
        <td  align="center">Accepted Qty</td>
        <td  align="center">Value</td>
        <td  align="center">Remarks</td>
      </tr>

    <c:forEach items="${actionBean.grn.grndetailarray}" var="grnvar" varStatus="loop" >

					      <tr id="tabletr">
					        <td align="right" style="border-top:1px solid #000000;border-right:1px solid #000000;">

                               ${grnvar.item.id}
					         </td>
					       <td align="right" style="border-top:1px solid #000000;border-right:1px solid #000000;">
                               ${grnvar.item.name}
					         </td>
                            <td align="right" style="border-top:1px solid #000000;border-right:1px solid #000000;">
                              	           ${grnvar.item.uom.name}
	                  </td>
                              <td align="right" style="border-top:1px solid #000000;border-right:1px solid #000000;">

					            ${grnvar.challanQty}
				            </td>
					       <td align="right" style="border-top:1px solid #000000;border-right:1px solid #000000;">
					         					            ${grnvar.receivedQty}
				            </td>
                           <td align="right" style="border-top:1px solid #000000;border-right:1px solid #000000;">

					            ${grnvar.acceptedQty}
					        </td>
                           <td align="right" style="border-top:1px solid #000000;border-right:1px solid #000000;">

									${grnvar.value}
           			        </td>
                           <td align="right" style="border-top:1px solid #000000;border-right:1px solid #000000;">
					         			            ${grnvar.remark}
					        </td>
					     </tr>
                  </c:forEach>

        <tr>
        <td colspan="5">&nbsp;   <s:hidden name="hdnvalue" value="te" id="hdnvalueid"/></td>

        <td align="center">Total</td>
        <td><s:text  name="v" id="calvalue" value="${actionBean.tot}" style="text-align:right;margin-right:2px; width:200px; border:none; "></s:text> </td>
        <td>&nbsp;</td>
      </tr>

    </table></td>
  </tr>
  <tr>
            <td>&nbsp;</td>



  </tr>
  <tr>

       <td align="center">
           <s:submit name="verification" value="Approve" onclick="return reloadParentAndClose(${grn.id});"></s:submit> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           <s:button name="cancel"  id="cancel" value="Cancel"></s:button></td>

  </tr>
  <tr>
    <td></td>
  </tr>
</table>
 </s:form>
</body>
</html>


















