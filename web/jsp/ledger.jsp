
    <%--
    Created by IntelliJ IDEA.
    User: Milind
    Date: Mar 28, 2012
    Time: 11:55:47 AM
    To change this template use File | Settings | File Templates.
    --%>


    <%@ include file="/includes/_taglibInclude.jsp" %>
    <link rel="stylesheet" href="css/general.css" type="text/css" media="screen"/>
    <link rel="stylesheet" type="text/css" href="css/stylesheet.css"/>
    <script type="text/javascript">
    var availableTags;
    $(function() {
    $.get("Report.action?getItemCodeLst",function(result) {

    availableTags =eval(result);
    $("input#itemcode").autocomplete({
    source: availableTags
    });
    $("input#itemcode1").autocomplete({
    source: availableTags
    });
    $("input#itemcode2").autocomplete({
    source: availableTags
    });
    });
    });
    $(document).ready(function() {
    $("#getselectbydatebtn").click(function(){
    if ($("#textboxh").val().trim() ==""){
    alert("please Enter the Details.");
    $("#textboxh").focus() ;
    return false;
    }

    });

    $("#getyearbtn").click(function(){
    if ($('#radio4').is(':checked') ) {
    if ($("#month").attr("value") =="0"){
    alert("please select the month.");
    $("#month").focus() ;
    return false;
    }
    else if($("#year").attr("value") =="0"){
    alert("please select the year.");
    $("#year").focus() ;
    return false;
    }
    else if( $("#itemcode").val().trim() ==""){
    alert("Please enter item name");
    $("#year").focus() ;
    return false;
    }

    }
    if ($('#radio5').is(':checked') ) {
    if ($("#yearonly").attr("value") =="0"){
    alert("please select the year.");
    $("#yearonly").focus() ;
    return false;
    }
    else if( $("#itemcode").val().trim() ==""){
    alert("Please enter item name");
    $("#year").focus() ;
    return false;
    }
    }
    if ($('#radio6').is(':checked') ) {
    if ($("#fromd").val().trim() ==""){
    alert("please enter from date.");
    $("#fromd").focus() ;
    return false;
    }
    else if($("#tod").val().trim() ==""){
    alert("please enter TO date.");
    $("#tod").focus() ;
    return false;
    }
    else if( $("#itemcode").val().trim() ==""){
    alert("Please enter item name");
    $("#year").focus() ;
    return false;
    }
    }
    if ($('#radio7').is(':checked') ) {
    if ($("#month").attr("value") =="0"){
    alert("please select the month.");
    $("#month").focus() ;
    return false;
    }
    else if($("#year").attr("value") =="0"){
    alert("please select the year.");
    $("#year").focus() ;
    return false;
    }

    }

    });
    $('#radioitem').click(function() {
    $("#itemcode").val("");
    $('.forfromto').hide();
    $('.foritemselectdate').hide();
    $('.foritemdate').hide();
    $('#itemselectdatetable').hide();
    $('.foritemselectdate').hide();
    $('.texboxh').hide();
    $('.formonth').show();
    $('.foryear').hide();
    $('#grndailytable').hide();
    $('#itemdailytable').hide();

 
    $('.forYeartxt').show();

    });
    $('#radioGrn').click(function() {
    $('.foritem').hide();
    $('#grndailytable').hide();
    $('#itemdailytable').hide();
   
    $('#month').attr("value","0");
    $('#year').attr("value","0");
    $('.formonth').show();
    $('.forfromto').hide();
    $('.foryear').hide();
    $('#getbymonthbtngrn').show();
    $('.foritemselectdate').hide();
    $('.foritemdate').hide();
    $('#itemselectdatetable').hide();
    $('.forYeartxt').hide();
    });
         $('#radioPo').click(function() {
    $('.foritem').hide();
    $('#grndailytable').hide();
    $('#itemdailytable').hide();

    $('#month').attr("value","0");
    $('#year').attr("value","0");
    $('.formonth').show();
    $('.forfromto').hide();
    $('.foryear').hide();
    $('#getbymonthbtngrn').show();
    $('.foritemselectdate').hide();
    $('.foritemdate').hide();
    $('#itemselectdatetable').hide();
    $('.forYeartxt').hide();
    });
         $('#radioRequisition').click(function() {
    $('.foritem').hide();
    $('#grndailytable').hide();
    $('#itemdailytable').hide();

    $('#month').attr("value","0");
    $('#year').attr("value","0");
    $('.formonth').show();
    $('.forfromto').hide();
    $('.foryear').hide();
    $('#getbymonthbtngrn').show();
    $('.foritemselectdate').hide();
    $('.foritemdate').hide();
    $('#itemselectdatetable').hide();
    $('.forYeartxt').hide();
    });

   
    });
    </script>

    <s:layout-render name="/layout/_base.jsp">
    <s:layout-component name="body">
    <s:form beanclass="com.erp.action.ReportActionBean">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" >
    <tr valign="top"><td >&nbsp;
    </td></tr>
    <tr><td align="left" class="pageheading" valign="top">
    <strong>Report</strong>
    </td></tr>
    <tr valign="top"><td align="center">&nbsp;
    </td></tr>
    </table>
    <table bordercolor="#FF6600" width="77%" border="1">
    <tr>
    <td width="100%" height="119">
    <table width="100%" height="91" cellspacing="1">
    <tr>
    <td width="8%" height="21"  align="left" valign="top">Ledger </td>
    <td width="1%"  align="right" valign="top">
        <s:radio  value="byDailyLedger" id="radioitem"  name="stock"></s:radio></td>
    <td width="8%"  align="left" valign="top">Item</td>
    <td width="1%">&nbsp;</td>
    <td width="3%"  align="right" valign="top">

    <s:radio  value="bySection" id="radioGrn"  name="stock"></s:radio>

    </td>
    <td width="9%"  align="left" valign="top">Grn</td>
        <td width="1%">&nbsp;</td>
    <td width="3%"  align="right" valign="top">

    <s:radio  value="byPo" id="radioPo"  name="stock"></s:radio>

    </td>
    <td width="15%"  align="left" valign="top">Purchase Order</td>
           <td width="1%">&nbsp;</td>
    <td width="3%"  align="right" valign="top">

    <s:radio  value="byRequisition" id="radioRequisition"  name="stock"></s:radio>

    </td>
    <td width="15%"  align="left" valign="top">Material Requisition</td>
    <td colspan="3"></td>
    </tr>

   

    <tr class="formonth" style="display:none;" >
    <td width="8%" height="21" align="left" valign="top"></td>
    <td width="1%" colspan=""  align="right" valign="top"></td>
    <td  align="left" colspan="3" valign="top">Select Month & Year </td>
    <td  align="left" colspan="10" valign="top">

    <s:select name="month" id="month" class="dropdown">
    <option  value="0">----Select Month----</option>
    <option value="01">January</option><option value="02">February</option><option value="03">March</option><option value="04">April</option><option value="05">May</option><option value="06">June</option><option value="07">July</option><option value="08">August</option><option value="09">September</option><option value="10">October</option><option value="11">November</option><option value="12">December</option>
    </s:select>
    <s:select id="year" name="year" class="dropdown">
    <%int year = 2011;%>
    <option  value="0">---Select Year---</option>
    <c:forEach var="i" begin="<%=year %>" end="<%=year + 20 %>">
    <option value="<c:out value="${i+1}"/>"><c:out value="${i+1}"/></option>
    </c:forEach>
    </s:select>&nbsp;&nbsp;


    <s:submit name="byMonthGrn" id="getbymonthbtngrn" value="Get" style="display:none;"></s:submit>
    </td>

    </tr>



    <tr class="forYeartxt" style="display:none;" >
    <td width="8%" height="21" align="left" valign="top"></td>
    <td width="1%"  align="right" valign="top"></td>
    <td  align="right" colspan="3" valign="top">Enter Item Name </td>
    <td  align="left" colspan="9" valign="top">
    <s:text name="itemcodetxt" class="textbox" id="itemcode"/>
    &nbsp;&nbsp;<s:submit name="byLedger" id="getyearbtn" value="Get"></s:submit>
    </td>
    </tr>



    <c:if test="${actionBean.search eq 'byDailyLedger'}">
    <script type="text/javascript">
    $(document).ready(function() {
    $('.formonth').show();
    $('.foritem').show();
    $('.forYeartxt').show();
    $('.foritemselectdate').hide();
    $('.foritemdate').hide();
    var fromact=${actionBean.month};
    if(fromact<9)
    {
    var m="0"+${actionBean.month};
    $('#month').attr("value",m);
    }
    else
    $('#month').attr("value",fromact);

    $('#year').attr("value",${actionBean.year});

    $('#itemcode').attr("value",${actionBean.itemcodetxt});
    });
    </script>
    </c:if >

    <c:if test="${actionBean.stock eq 'bySection'}">
    <script type="text/javascript">
    $(document).ready(function() {

    $('.formonth').show();
    $('.foritem').hide();
    $('.forYeartxt').hide();
    $('.foritemselectdate').hide();
    $('.foritemdate').hide();
    $('#getbymonthbtngrn').show();

    var fromact=${actionBean.month};
    if(fromact<9)
    {
    var m="0"+${actionBean.month};
    $('#month').attr("value",m);
    }
    else
    $('#month').attr("value",fromact);

    $('#year').attr("value",${actionBean.year});


    });
    </script>
    </c:if >
    </table></td>
    </tr>
    </table>
    <%

    org.displaytag.decorator.TotalTableDecorator totals = new org.displaytag.decorator.TotalTableDecorator();
    totals.setTotalLabel("Total");
    totals.setSubtotalLabel("partial total");
    pageContext.setAttribute("totals", totals);

    %>

   
    <c:if test="${actionBean.dailyLedger!=null}">
    <s:useActionBean beanclass="com.erp.action.ReportActionBean" event="byDailyLedger" var="lst"></s:useActionBean>
    <%
    request.setAttribute("dailyLedger",lst.getDailyLedger());
    %>
    <table id="itemdailytable"  width="100%"><tr><td>
    <d:table name="dailyLedger" id="v" class="disp" requestURI="Report.action" decorator="totals">
    <d:column property="date" format="{0,date,yyyy-MM-dd}" sortable="false" title="Create Date"/>

    <d:column property="item.itemCode" title="Item Code" group="1"/>

    <d:column property="openQuantity" title="Open Quantity"/>
    <d:column property="receivedQuantity" title="Received Quantity" total="true"  class="r"/>
    <d:column property="issuedQuantity" title="Issued Quantity" total="true" class="r"/>
    <d:column property="closingQuantity" title="Closing Quantity"/>


    </d:table></td></tr>
    </table>
    </c:if>

    <c:if test="${actionBean.grnHistory!=null}">
    <s:useActionBean beanclass="com.erp.action.ReportActionBean" event="byMonthGrn" var="Grnlst"></s:useActionBean>
    <%
    request.setAttribute("grnList",Grnlst.getGrnHistory());
    %>
    <table id="grndailytable"  width="100%"><tr><td>
    <d:table name="grnList" id="gr" pagesize="50" class="disp" requestURI="/Report.action">
    <d:column property="createDate" format="{0,date,yyyy-MM-dd}" sortable="false" title="Create Date"/>
    <d:column property="id" title="Grn No"/>
    <d:column property="billValue" title="Bill Value" />
    <d:column property="purchaseOrder.purchaseOrderNo" title="Purchase Order No" />
    </d:table></td></tr>
    </table>
    </c:if>
    </s:form>
    </s:layout-component>
    </s:layout-render>