<%@ include file="/includes/_taglibInclude.jsp"%>
<%@page contentType="text/html" import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.DateFormat" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css/print.css" />
    <link rel="stylesheet" type="text/css" href="css/stylesheet.css"/>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    <script type="text/javascript">
        $(document).ready(function(){
            $('#printPDF').click(function(){
                window.print();
                $('#hide').css("display","none");
                $('#content').attr("value",$('#printContent').html());
            });
        });

    </script>
</head>
<body>
<s:form beanclass="com.erp.action.PurchaseOrderActionBean">
    <div id="printContent">
<table width="750px" border="0" cellspacing="0" cellpadding="0" align="center" class="borderstyle">
    <tr>
        <td>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
        <tr>
            <td></td>
        </tr>
        <tr>
            <td>
                <div align="center" class="style2">SHAKTI RAIL-INFRA LIMITED</div>
            </td>
        </tr>
        <tr>
            <td><div align="center" class="style3">Unit-l/Regd.Office :5/1,Industrial Area,Rourkela-769 004</div></td>
        </tr>
        <tr>
            <td><div align="center" class="style3">Unit-ll : Plot No. 1444,1443,1266,1456,San Nuagaon, Chikatmati, Kalunga</div></td>
        </tr>
        <tr>
            <td><div align="center" class="style3" style="margin-top:5px; text-decoration:underline">Purchase Order</div></td>
        </tr>
    </table>
        </td>
</tr>
    <tr>
        <td><table width="100%" >
            <tr>
                <td width="9%" align="right" class="style1"><div align="right"><b>To</b></div></td>
                <td width="35%">&nbsp;</td>
                <td width="23%" align="right" class="pageText"> </td>
                <td width="33%" align="left" class="pageText"></td>
            </tr>
            <tr valign="top">
                <td width="9%">&nbsp;</td>
                <td  width="35%" align="left" class="pageText">
                <div align="left">
                ${actionBean.purchaseOrder.vendor.name}<br>${actionBean.purchaseOrder.vendor.address}<br>
                        ${actionBean.purchaseOrder.vendor.phoneNo}<br>VID: ${actionBean.purchaseOrder.vendor.vendorCode}</div></td>
            <td  width="23%" align="left" class="style1"><div align="right"><b>Purchase Order No : <br> Purchase Order Date : </b></div></td>
                <fmt:formatDate value="${actionBean.purchaseOrder.createDate}" var="orderdate" pattern="yyyy-MM-dd"></fmt:formatDate>
                <td valign="top" width="33%" align="left" class="pageText">
                <div align="left">
                ${actionBean.purchaseOrder.purchaseOrderNo} <br>${orderdate}</div></td>
            </tr>
            <tr>
                <td>&nbsp;  <s:hidden name="id" value="${actionBean.purchaseOrder.id}"></s:hidden></td>
                <td class="pageText">
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="4" align="left" >&nbsp;<p align="left"> Please supply the following Material subject to Special Terms and Condition mentioned below.For all other terms and condition please refer General Terms and Conditions printed overleaf .</p> </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        </td>
    </tr>
    <tr>
        <td><table width="98%" border="1" cellpadding="0" cellspacing="0" align="center" class="borderstyle" style={border-color:#A0A0A0} >
            <tr>
                <td width="4%" height="30" valign="middle"><div align="center" class="style3">Sr.</div></td>
                <td width="10%" valign="middle"><div align="center" class="style3">Item Code</div></td>
                <td width="18%" valign="middle"><div align="center" class="style3">Item Name</div></td>
                <td width="20%" valign="middle"><div align="center" class="style3">Description</div></td>
                <td width="10%" valign="middle"><div align="center" class="style3">UoM</div></td>
                <td width="13%" valign="middle"><div align="center" class="style3">Ordered Qty</div></td>
                <td width="6%" valign="middle"><div align="center" class="style3">Rate</div></td>
                <td width="8%" valign="middle"><div align="center" class="style3">Amount</div></td>
            </tr>
            <c:forEach items="${actionBean.purchaseOrder.purchasedetailarray}" var="purchasedetailarray" varStatus="loop" >

                <tr id="tabletr">
                    <td >
                        <div align="left" style="margin-left:4px;"> <div align="center" class="pageText">
                                ${loop.index+1}  </div></div></td>
                    <td ><div align="left" style="margin-left:4px;"> <div align="center" class="pageText">
                            ${purchasedetailarray.item.itemCode}
                    </div></div></td>
                    <td ><div align="left" style="margin-left:4px;">
                        <div align="center" class="pageText">
                                ${purchasedetailarray.item.name}
                        </div></div></td>
                    <td >
                        <div align="left" style="margin-left:4px;">
                            <div align="center" class="pageText">
                                    ${purchasedetailarray.description}
                            </div></div></td>
                    <td >
                        <div align="left" style="margin-left:4px;">
                            <div align="center" class="pageText">
                                    ${purchasedetailarray.item.uom.name}
                            </div></div></td>
                    <td >
                        <div align="left" style="margin-left:4px;">
                            <div align="center" class="pageText">
                                    ${purchasedetailarray.orderedQty}
                            </div></div></td>
                    <td ><div align="left" style="margin-left:4px;">  <div align="center" class="pageText">
                            ${purchasedetailarray.rate}
                    </div></div></td>
                    <td ><div align="left" style="margin-left:4px;">  <div align="center" class="pageText">
                            ${purchasedetailarray.amount}
                    </div></div></td>
                </tr>        </c:forEach>

        </table>
        </td>


    <tr>
        <td>&nbsp;</td> </tr>
     <c:if test="${actionBean.term!=null && actionBean.term.firstTerm!=null}">
    <tr>
        <td align="left" class="style1">
            <div align="left" style="margin-left:8px">
            &nbsp; ${actionBean.term.firstTerm}
        <br>
            <c:if test="${actionBean.term!=null && actionBean.term.secondTerm!=null}">
          <b>2.</b>&nbsp; ${actionBean.term.secondTerm}
               </c:if>  
            <br>
                <c:if test="${actionBean.term!=null && actionBean.term.thirdTerm!=null}">
            <b>3.</b>&nbsp; ${actionBean.term.thirdTerm}        </c:if>
            <br>
                <c:if test="${actionBean.term!=null && actionBean.term.forthTerm!=null}">
            <b>4.</b>&nbsp; ${actionBean.term.forthTerm}      </c:if>     </div>
        </td>
    </tr>
       </c:if>
   
    <tr id="hide">
        <td><table width="80%" border="0" align="center">
            <tr >
                <td  align="center">
                    <s:hidden name="content" id="content"/>
                    <s:hidden name="purchaseOrderNumber" value="${actionBean.purchaseOrder.purchaseOrderNo}"/>
                    <s:hidden name="vendorName" value="${actionBean.purchaseOrder.vendor.name}"/>
                    <s:submit name="print" value="Print" id="printPDF"></s:submit> &nbsp;&nbsp;&nbsp;&nbsp;
                    <s:button name="Cancel" value="Cancel" onclick="javascript:window.close();"></s:button>
                </td>
            </tr>
        </table>
        </td>

    </tr>

    <tr>
        <td>&nbsp;</td>
    </tr>



</table>
        </div>
    </s:form>
</body></html>
