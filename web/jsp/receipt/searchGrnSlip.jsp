<%@ include file="/includes/_taglibInclude.jsp"%>
<%@page contentType="text/html" import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.erp.dao.GrnDao" %>

<script src="/js/jquery-1.2.6.min.js" type="text/javascript"></script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

 <script type="text/javascript">
        $(document).ready(function(){
            $('#printPDF').click(function(){
                window.print();
                $('#hide').css("display","none");
                $('#content').attr("value",$('#printContent').html());

            });
        });

    </script>
<s:useActionBean beanclass="com.erp.action.GrnActionBean" var="listofgrn" event="redirectpopup"></s:useActionBean>
<%
    request.setAttribute("grn",listofgrn.getGrn());
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Enterpride-Stores</title>
<link rel="stylesheet" type="text/css" href="css/stylesheet.css"/>
      <link rel="stylesheet" type="text/css" href="css/print.css" />
</head>
<body>
<s:form beanclass="com.erp.action.GrnActionBean">
     <div id="printContent">
<table width="760px" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td></td>
  </tr>
  <tr>
    <td><div align="center" class="style2">SHAKTI RAIL-INFRA LIMITED</div></td>
  </tr>
  <tr>
    <td><div align="center" class="style3">Unit-l/Regd.Office :5/1,Industrial Area,Rourkela-769 004</div></td>
  </tr>
  <tr>
    <td><div align="center" class="style3">Unit-ll : Plot No. 1444,1443,1266,1456,San Nuagaon, Chikatmati, Kalunga</div></td>
  </tr>
  <tr>
    <td><div align="center" class="style3" style="margin-top:5px; text-decoration:underline">GOODS RECEIPT NOTE</div></td>
  </tr>
  <tr>
    <td><table width="102%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td valign="top">&nbsp;</td>
        <td valign="top">&nbsp;</td>
        <td>&nbsp;</td>
        <td width="22%">&nbsp;</td>
        <td>&nbsp;</td>
        <td width="18%">&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <s:hidden name="grn.id" value="${grn.id}"></s:hidden>
        <s:hidden name="hndvalue" value="test"></s:hidden>
        <td width="7%" align="right" valign="top"><div align="center"><span class="style1">Name<strong>:</strong></span></div></td>
        <td width="22%" align="left" valign="top"><div align="left">&nbsp;&nbsp;${grn.purchaseOrder.vendor.name}</div></td>
        <td width="15%" align="right" valign="top"><div align="right"><span class="style1">Grn No<strong>:</strong></span></div></td>
        <td align="left" valign="top"><div align="left">&nbsp;&nbsp;${grn.id}</div></td>
        <td width="14%" align="right" valign="top"><div align="right"><span class="style1">Date<strong>:</strong></span></div></td>
        <fmt:formatDate value="<%=new Date()%>" var="d" pattern="yyyy-MM-dd"></fmt:formatDate>
        <td align="left" valign="top"><div align="left">&nbsp;&nbsp;${d}</div></td>
        <td width="2%" valign="top"></td>
      </tr>
      <tr>
        <td valign="top">&nbsp;</td>
        <td valign="top">&nbsp;</td>
        <td width="15%" align="right" valign="top" class="style1"><div align="right">Order No<strong>:</strong></div></td>
        <td align="left" valign="top"><div align="left">&nbsp;&nbsp;${grn.orderNo}</div></td>
        <td align="right" valign="top"><div align="right"><span class="style1">Order Date<strong>:</strong></span></div></td>
                   <fmt:formatDate value="${grn.orderDate}" var="orderdate" pattern="yyyy-MM-dd"></fmt:formatDate>
        <td align="left" valign="top"><div align="left">&nbsp;&nbsp;${orderdate} </div></td>
        <td valign="top">&nbsp;</td>
      </tr>
      <tr>
        <td valign="top">&nbsp;</td>
        <td valign="top">&nbsp;</td>
        <td width="15%" align="right" valign="top"><div align="right" class="style1">Challen No<strong>:</strong></div></td>
        <td align="left" valign="top"><div align="left">&nbsp;&nbsp;${grn.challanNo}</div></td>
        <fmt:formatDate value="${grn.challanDate}" var="challandate" pattern="yyyy-MM-dd"></fmt:formatDate>

        <td align="right" valign="top"><div align="right"><span class="style1">Challan Date<strong>:</strong></span></div></td>
        <td align="left" valign="top"><div align="left">&nbsp;&nbsp;${challandate}</div></td>
        <td valign="top">&nbsp;</td>
      </tr>
      <tr>
        <td valign="top">&nbsp;</td>
        <td valign="top">&nbsp;</td>
        <td width="15%" align="right" valign="top" class="style1"><div align="right"> Bill No<strong>:</strong></div></td>
        <td align="left" valign="top"><div align="left">&nbsp;&nbsp;${grn.billNo}</div></td>
        <td align="right" valign="top"><div align="right"><span class="style1">Bill Date<strong>:</strong></span></div></td>
          <fmt:formatDate value="${grn.billDate}" var="billdate" pattern="yyyy-MM-dd"></fmt:formatDate>
        <td align="left" valign="top"><div align="left">&nbsp;&nbsp;${billdate}</div></td>
        <td valign="top">&nbsp;</td>
      </tr>
      <tr>
        <td valign="top">&nbsp;</td>
        <td valign="top">&nbsp;</td>
        <td width="15%" align="right" valign="top" class="style1"><div align="right">Bill Value<strong>:</strong></div></td>
        <td align="left" valign="top"><div align="left">&nbsp;&nbsp;${grn.billValue}</div></td>
        <td align="right" valign="top" class="style1"><div align="right">Trunk No<strong>:</strong></div></td>
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
					        <td align="right" >

                               ${grnvar.item.id}
					         </td>
					       <td align="right" >
                               ${grnvar.item.name}
					         </td>
                            <td align="right">
                              	           ${grnvar.item.uom.name}
	                  </td>
                              <td align="right" >

					            ${grnvar.challanQty}
				            </td>
					       <td align="right" >
					         					            ${grnvar.receivedQty}
				            </td>
                           <td align="right" >

					            ${grnvar.acceptedQty}
					        </td>
                           <td align="right" >

									${grnvar.value}
           			        </td>
                           <td align="right" >
                             
					         			            ${grnvar.remark}
					        </td>
					     </tr>
                  </c:forEach>

        <tr>
        <td colspan="5">&nbsp;</td>

        <td align="center">Total</td>
        <td><s:text  name="v" id="calvalue" value="${actionBean.tot}" style="text-align:right;margin-right:2px; width:80px; border:none; "></s:text> </td>
        <td>&nbsp;</td>
      </tr>

    </table></td>
  </tr>
  <tr>
            <td>&nbsp;</td>



  </tr>
   <tr id="hide">
        <td><table width="80%" border="0" align="center">
            <tr >
                <td  align="center">
                    <s:hidden name="content" id="content"/>
                    <s:hidden name="grnnopdf" value="${actionBean.grn.id}"/>
                    <s:hidden name="vendorName" value="${actionBean.grn.purchaseOrder.vendor.name}"/>
                    <s:submit name="print" value="Print" id="printPDF"></s:submit> &nbsp;&nbsp;&nbsp;&nbsp;
                    <s:button name="Cancel" value="Cancel" onclick="javascript:window.close();"></s:button>
                </td>
            </tr>
        </table>
        </td>

    </tr>
  <tr>
    <td></td>
  </tr>
</table>   </div>
 </s:form>
</body>
</html>


















