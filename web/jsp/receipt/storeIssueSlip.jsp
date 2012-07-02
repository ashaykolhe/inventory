<%@ include file="/includes/_taglibInclude.jsp"%>
<%@page contentType="text/html" import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.DateFormat" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Enterpride-Stores</title>
<link rel="stylesheet" type="text/css" href="css/stylesheet.css"/>
      <link rel="stylesheet" type="text/css" href="css/print.css" />
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
<body >
<s:form beanclass="com.erp.action.StoreIssueActionBean">
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
    <td><div align="center" class="style3" style="margin-top:5px; text-decoration:underline">STORE ISSUE INVOICE / SLIP</div></td>
  </tr>
  <tr>
    <td><table width="760px" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td width="83" align="right" valign="top"><div align="right"  >
      <div align="center" class="style1" style="margin-bottom:2px"><b>DATE :</b></div>
    </div></td>
    <td width="192" align="left" valign="top"><div align="left"><%	Date date1 = Calendar.getInstance().getTime();
						DateFormat formatter1 = new SimpleDateFormat("dd/MM/yyyy");
					%><%= formatter1.format(date1) %></div></td>
    <td width="309" align="right" valign="top"><div align="right" class="style1"><b>No.  :</b></div></td>
    <td width="176" align="left" valign="top">
    <div align="left">
    ${actionBean.storeissue.id}</div></td>
  </tr>
</table>    </td>
  </tr>
  <tr>
    <td><table width="730px" border="1" cellspacing="0" cellpadding="0" align="center">
      <tr>
        <td width="12%" height="30" valign="middle"><div align="center" class="style3">Item Code</div></td>
        <td width="40%" valign="middle"><div align="center" class="style3">Item Name</div></td>
        <td width="11%" valign="middle"><div align="center" class="style3">UOM</div></td>
        <td width="12%" valign="middle"><div align="center" class="style3">Cost Center</div></td>
        <td width="14%" valign="middle"><div align="center" class="style3">Requisition Qty</div></td>
        <td width="11%" valign="middle"><div align="center" class="style3">Issued Qty</div></td>
      </tr>
         <c:forEach items="${actionBean.storeissue.requisition.requisitiondetailarray}" var="storeissuevar" varStatus="loop" >


					      <tr id="tabletr">
					        <td >
					         <div align="left" style="margin-left:4px;">
					          <div align="right">
                               ${storeissuevar.item.itemCode}
					          </div></div></td>
					       <td ><div align="left" style="margin-left:4px;">
					         <div align="right">
					           ${storeissuevar.item.name}
					         </div></div></td>
					       <td >
					         <div align="left" style="margin-left:4px;">
					         <div align="right">
					            ${storeissuevar.item.uom.name}
					         </div></div></td>
                             <td >
					         <div align="left" style="margin-left:4px;">
					         <div align="right">
					            <c:forEach items="${actionBean.storeissue.storeissuedetailarray}" begin="${loop.index}" var="storeissuevardetail" end="${loop.index}" >
                            <c:choose>
                            <c:when test="${storeissuevardetail.costCentre eq null}">
                            -
                            </c:when>
                             <c:otherwise>
                                ${storeissuevardetail.costCentre}
                            </c:otherwise>
                            </c:choose>
                       </c:forEach>
					         </div></div></td>
                               <td >
					         <div align="left" style="margin-left:4px;">
					         <div align="right">
					            ${storeissuevar.requiredQty}
					         </div></div></td>

                             <td ><div align="left" style="margin-left:4px;">
					         <div align="right">

                                  <c:forEach items="${actionBean.storeissue.storeissuedetailarray}" begin="${loop.index}" var="storeissuevardetail" end="${loop.index}" >

					              <c:choose>
                  <c:when test="${storeissuevardetail.issueQty eq 0}">
			            -
                  </c:when>

                <c:otherwise>
               ${storeissuevardetail.issueQty}
                  </c:otherwise>
                  </c:choose> 

                                  </c:forEach>

                             </div></div></td>

					     </tr>
                  </c:forEach>
    </table></td>
  </tr>
 
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="13%" height="27" class="style1"><div align="left" style="margin-left:2px">
          <div align="right">Prepared By :</div>
        </div></td>
        <td width="13%" class="style1">&nbsp;</td>
        <td width="15%" class="style1">Received By :</td>
        <td width="12%" class="style1">&nbsp;</td>
        <td width="12%" class="style1">Verified By :</td>
        <td width="11%" class="style1">&nbsp;</td>
        <td width="12%" class="style1">Checked By :</td>
        <td width="12%" class="style1">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
      <tr>
    <td>&nbsp;</td>
  </tr>
     <tr>
    <td>&nbsp;</td>
  </tr>
    <tr id="hide">
        <td><table width="80%" border="0" align="center">
            <tr >
                <td  align="center">
                    <s:hidden name="content" id="content"/>
                  
                    <s:hidden name="storeNo" value="${actionBean.storeissue.id}"/>
                    <s:submit name="print" value="Print" id="printPDF"></s:submit> &nbsp;&nbsp;&nbsp;&nbsp;
                    <s:button name="Cancel" value="Cancel" onclick="javascript:window.close();"></s:button>
                </td>
            </tr>
        </table>
        </td>

    </tr>
</table>
        </div>
    </s:form>
</body>
</html>
