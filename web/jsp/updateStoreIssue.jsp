
    <%@ include file="/includes/_taglibInclude.jsp" %>
    <link rel="stylesheet" href="css/general.css" type="text/css" media="screen" />
    <link rel="stylesheet" type="text/css" href="css/stylesheet.css"/>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <script type="text/javascript">

    function GetItemDetail(button) {
    var rowid=button.name.substring(button.name.indexOf("[")+1,button.name.indexOf("]"));
    $.post('StoreIssue.action?getItemDetails', {id:button.value}, function (data) {
    var result=eval(data);
    $('#item'+rowid+'').attr("value",result.name);
    $('#uom'+rowid+'').attr("value",result.uom.name);

    });
    return false;
    }




    </script>
    <s:useActionBean beanclass="com.erp.action.StoreIssueActionBean" var="listofstoreissue" event="addStoreIssueLink"></s:useActionBean>
    <%
    request.setAttribute("storeissuelst",listofstoreissue.getStoreissuelst());
    request.setAttribute("requisitionlst",listofstoreissue.getRequisitionlst());
    request.setAttribute("issuedids",listofstoreissue.getIssuedids());
    request.setAttribute("itemidlst",listofstoreissue.getItemidlst());

    %>
    <s:layout-render name="/layout/_base.jsp">
    <s:layout-component name="body">

    <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" >
    <tr valign="top"><td >&nbsp;
    </td></tr>
    <tr><td align="left" class="pageheading" valign="top">
    Store Issue > Update
    </td></tr>
    <tr valign="top"><td align="center"><div class="msg"><s:messages/></div>
    </td></tr>
    </table>
    <s:form beanclass="com.erp.action.StoreIssueActionBean">

    <table width="50%" border="0"><tr>
    <td width="4%"></td>
    <td width="37%" align="left" valign="top">
    <div align="right" style="margin-left: 1px;" class="labels">Please select Requisition<span style="color:#FF0000"> *</span></div></td>
    <td width="20%" align="right" valign="top" >

    <s:select id="vendorName" name="id" class="dropdown">
    <option  value="0">---Select Id---</option>
    <c:forEach items="${issuedids}" var="requisition" varStatus="loop" >
    <c:choose>
    <c:when test="${actionBean.requisition.id eq requisition}">
    <option value ="<c:out value="${requisition}"/>" selected="selected"> <c:out value="${requisition}"/></option>
    </c:when>

    <c:otherwise>
    <option value ="${requisition}"><c:out value="${requisition}"/></option>
    </c:otherwise>
    </c:choose>


    </c:forEach>

    </s:select>

    </td>

    <td width="43%" align="left" valign="top" > <s:submit name="updateStoreIssue"  value="Get"/></td>
    </tr></table>
    </s:form>
    <c:if test="${actionBean.requisition!=null}">
    <s:form beanclass="com.erp.action.StoreIssueActionBean">

    <table border="1" width="66%" bgcolor="#FCFCFC" ><tr><td>
    <table width="100%" border="0" cellspacing="1" bordercolor="#FCFCFC">

    <tr>

    <td width="24%" align="right" valign="top"> <div align="right" style="margin-left: 2px;" class="labels">Name Of Contractor</div>     </td>
    <td width="16%" align="left" valign="top"><div align="left"><s:text readonly="readonly" name="requisition.nameOfContractor" class="textbox"></s:text></div> </td>
    <td width="14%" align="right" valign="top"><div align="right" style="margin-left: 2px;" class="labels">Name Of User</div></td>
    <td width="30%" align="right" valign="top"><s:text readonly="readonly" name="requisition.nameOfUser" class="textbox"></s:text>
    <s:hidden id="requisitionid" value="${actionBean.storeissue.id}" name="id" class="textbox"></s:hidden></td>


    <tr>
    <td colspan="4"><br><div align="left" style="margin-left:10px;">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" style="border:1px solid #000000;" align="left" id="family">
    <tr>
    <td width="27%" height="28px" style="border-right:1px solid #000000;background:#FFCC66;"><div align="center"><strong><span style="color:#3B3131;font-size:13px;font-weight:bold;" >Item Code</span></strong></div></td>
    <td width="25%"  style="border-right:1px solid #000000; background:#FFCC66;"><div align="center"><strong><span style="color:#3B3131;font-size:13px;font-weight:bold;">Item name</span></strong></div></td>
    <td width="22%"  style=" border-right:1px solid #000000;background:#FFCC66;"><div align="center"><strong><span style="color:#3B3131;font-size:13px;font-weight:bold;">UoM</span></strong></div></td>
    <td width="26%"  style=" border-right:1px solid #000000;background:#FFCC66;"><div align="center"><strong><span style="color:#3B3131;font-size:13px;font-weight:bold;">Cost Centre</span></strong></div></td>
    <td width="26%"  style=" border-right:1px solid #000000;background:#FFCC66;"><div align="center"><strong><span style="color:#3B3131;font-size:13px;font-weight:bold;">Required Qty</span></strong></div></td>
    <td width="26%"  style=" border-right:1px solid #000000;background:#FFCC66;"><div align="center"><strong><span style="color:#3B3131;font-size:13px;font-weight:bold;">Issued Qty</span></strong></div></td>

    </tr>
    <c:forEach items="${actionBean.storeissue.requisition.requisitiondetailarray}" var="storeissuevar" varStatus="loop" >


    <tr id="tabletr">
    <td style="border-top:1px solid #000000;border-right:1px solid #000000;">
    <div align="left" style="margin-left:4px;">
    <div align="right">
    <s:select   id="itemcode" name="storeissuedetailarray[${loop.index}].item.id"  onchange= "return GetItemDetail(this);">
    <option   value="0">---Select Item---</option>
    <c:forEach items="${actionBean.itemidlst}" var="itemidloop" >
    <c:choose>
    <c:when test="${storeissuevar.item.id eq itemidloop.id}">
    <option value ="<c:out value="${storeissuevar.item.id}"/>" selected="selected" > <c:out value="${storeissuevar.item.itemCode}"/></option>
    </c:when>

    <c:otherwise>
    <option value ="${itemidloop.id}"><c:out value="${itemidloop.itemCode}"/></option>
    </c:otherwise>
    </c:choose>


    </c:forEach>

    </s:select>

    </div></div></td>
    <td style="border-top:1px solid #000000;border-right:1px solid #000000;"><div align="left" style="margin-left:4px;">
    <div align="right">
    <s:text readonly="readonly" name="storeissuevar.itemName" value="${storeissuevar.item.name}" id="item${loop.index}" class="hello" style="text-align:right;margin-right:2px; width:200px; "  />
    </div></div></td>
    <td style="border-top:1px solid #000000;border-right:1px solid #000000;">
    <div align="left" style="margin-left:4px;">
    <div align="right">
    <s:text readonly="readonly"  name="storeissuevar.uom" id="uom${loop.index}" value="${storeissuevar.item.uom.name}" style="text-align:right;margin-right:2px;width:100px; "/>
    </div></div></td>
    <td style="border-top:1px solid #000000;border-right:1px solid #000000;">
    <div align="left" style="margin-left:4px;">
    <div align="right">
    <c:forEach items="${actionBean.storeissue.storeissuedetailarray}" begin="${loop.index}" var="storeissuevardetail" end="${loop.index}" >
    <s:text name="storeissuedetailarray[${loop.index}].costCentre" value="${storeissuevardetail.costCentre}"  style="text-align:right;margin-right:2px;width:100px; "/>
    </c:forEach>
    </div></div></td>
    <td style="border-top:1px solid #000000;border-right:1px solid #000000;">
    <div align="left" style="margin-left:4px;">
    <div align="right">
    <s:text readonly="readonly"  name="storeissuevar[${loop.index}].requiredQty" value="${storeissuevar.requiredQty}" style="text-align:right;margin-right:2px;width:100px; "/>
    </div></div></td>

    <td style="border-top:1px solid #000000;border-right:1px solid #000000;"><div align="left" style="margin-left:4px;">
    <div align="right">
    <c:forEach items="${actionBean.storeissue.storeissuedetailarray}" begin="${loop.index}" var="storeissuevardetail" end="${loop.index}" >
    <s:text name="storeissuedetailarray[${loop.index}].issueQty" value="${storeissuevardetail.issueQty}"  style="text-align:right;margin-right:2px;width:100px; "/>
    </c:forEach>
    </div></div></td>

    </tr>
    </c:forEach>
    </table>
    <tr>
    <td colspan="4" align="left" valign="top" >
    </td>
    </tr>
    </div></td>
    </tr>
    <tr>
    <td align="left">&nbsp;</td>
    <td align="left" colspan="3">&nbsp;</td>
    <td align="left">&nbsp;</td>
    </tr>
    <tr>
    <td align="left">&nbsp;</td>
    <td align="left" colspan="3"><s:submit name="update" value="Update"></s:submit>
    &nbsp;&nbsp;&nbsp;&nbsp;
    <s:submit name="cancel" value="Cancel"></s:submit>

    </td>
    <td width="16%" align="left">&nbsp;</td>
    </tr>
    </table></td></tr>

    </table>
    </table>
    </s:form>
    </c:if>
    </s:layout-component>
    </s:layout-render>

