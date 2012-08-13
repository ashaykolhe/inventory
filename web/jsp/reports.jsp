
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
    $('.foritem').show();
    $('.formonth').hide();
    $('.forfromto').hide();
    $('#grndailytable').hide();
    $('#itemdailytable').hide();
    $('#itemdailytable2').hide();
    $('#itemdailytable1').hide();
    $('.forYeartxt').hide();
    $('.foryear').hide();
    $('.foritemdate').hide();

    });

    $('#radio3').click(function() {
    $('.foritemdate').show();
    $('#getbymonthbtngrn').hide();
    $('.formonth').hide();
    $('.foryear').hide();
    $('#grndailytable').hide();
    $('#itemdailytable').hide();
    $('#itemdailytable2').hide();
    $('#itemdailytable1').hide();
    $('.forfromto').hide();
    $('.forYeartxt').hide();
    });
    $('#radio4').click(function() {
    $("#itemcode").val("");
    $('.foritemselectdate').hide();
    $('.fordailyledgerGrn').hide();
    $('.foritemdate').hide();
    $('.foryear').hide();
    $('#itemselectdatetable').hide();
    $('#textboxh').hide();
    $('.forYeartxt').show();
    $('#grndailytable').hide();
    $('#itemdailytable').hide();
    $('#itemdailytable2').hide();
    $('#itemdailytable1').hide();
    $('#month').attr("value","0");
    $('#year').attr("value","0");
    $('.foritemselectdate').hide();
    $('#texboxh').hide();
    $('.formonth').show();
    $('#getbymonthbtngrn').hide();
    $('.foryear').hide();
    $('.forfromto').hide();
    });
    $('#radio5').click(function() {
    $("#itemcode").val("");
    $('.forfromto').hide();
    $('.foritemselectdate').hide();
    $('.foritemdate').hide();
    $('#grndailytable').hide();
    $('#itemdailytable').hide();
    $('#itemdailytable2').hide();
    $('#itemdailytable1').hide();
    $('#itemselectdatetable').hide();
    $('.foritemselectdate').hide();
    $('.texboxh').hide();
    $('.formonth').hide();
    $('.foryear').show();
    $('.forYeartxt').show();
    $('#getbymonthbtngrn').hide();
    });
    $('#radio7').click(function() {
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
    $('#itemdailytable2').hide();
    $('#itemdailytable1').hide();
    $('#getbymonthbtngrn').hide();
    $('.forYeartxt').show();
    });
    $('#radio6').click(function() {
    $("#itemcode").val("");
    $('.forfromto').show();
    $('#fromd').val("");
    $('#tod').val("");
    $('.foritemselectdate').hide();
    $('.foritemdate').hide();
    $('#itemselectdatetable').hide();
    $('.foritemselectdate').hide();
    $('.texboxh').hide();
    $('.formonth').hide();
    $('.foryear').hide();
    $('#getbymonthbtngrn').hide();
    $('.forYeartxt').show();
    });
    $('#radio8').click(function() {
    $('.forfromto').hide();
    $('#d').show();
    $('#itemselectdatetable').hide();
    $('.foritemselectdate').hide();
    $('.texboxh').hide();
    $('.texboxh').val("");
    $('.formonth').hide();
    $("#itemcode").val("");
    $('#getbymonthbtngrn').hide();
    $('.foryear').hide();
    $('.forYeartxt').hide();
    });
    $('#radio9').click(function() {
    $('#d').hide();
    $('#textboxh').val("");
    $('#textboxh').show();
    $('.foritemselectdate').show();
    $('#month').attr("value","0");
    $('#year').attr("value","0");
    $("#itemcode").val("");
    $('#yearonly').attr("value","0");
    $('.itemdailytable').hide();
    $('.formonth').hide();
    $('.foryear').hide();
    $('#getbymonthbtngrn').hide();
    $('.forfromto').hide();
    $('.forYeartxt').hide();
    });
    });
    </script>

    <s:layout-render name="/layout/_base.jsp">
    <s:layout-component name="body">
    <s:form beanclass="com.erp.action.ReportActionBean">
    <br>
    <table class="heading_table">

    <tr><td align="left" class="pageheading" valign="top">
      <div class="sub_heading" >Report</div>
    </td></tr>
     </table>
     <table class="second_table"  >
     <tr>
         <td>
    <table width="100%" border="0" cellspacing="0">
    <tr>
    <td width="11%" height="21"  align="left" valign="top">Search By</td>
    <td width="4%"  align="right" valign="top"><s:radio  value="byItem" id="radioitem"  name="stock"></s:radio></td>
    <td width="7%"  align="left" valign="top"> <div align="left">By Item</div></td>
    <td width="1%">&nbsp;</td>


    <td colspan="9"></td>
    </tr>

    <tr class="foritem" style="display:none;" >
    <td  >&nbsp;</td>
    <td align="right" valign="top"><s:radio  value="byDaily" id="radio3" class="search"  name="search"></s:radio></td>
    <td align="left" valign="top">Daily</td>
    <td width="1%">&nbsp;</td>
    <td width="1%" align="right" valign="top"><s:radio  value="byMonthly" id="radio4"  name="search"></s:radio></td>
    <td align="left" valign="top">Monthly</td>
    <td width="1%" >&nbsp;</td>
    <td width="1%"  align="right" valign="top"><s:radio  value="byYearly" id="radio5"  name="search"></s:radio></td>
    <td  align="left" width="7%" valign="top">Yearly</td>
    <td width="1%" >&nbsp;</td>
    <td width="1%"  align="right" valign="top"><s:radio  value="byFromTo" id="radio6"  name="search"></s:radio></td>
    <td width="7%"  align="left" valign="top">From-To</td>
    <td width="1%" >&nbsp;</td>
    <td width="1%"  align="right" valign="top"><s:radio  value="byDailyLedger" id="radio7"  name="search"></s:radio></td>
    <td width="40%"  align="left" valign="top">Daily Ledger</td>
    </tr>
    
    <tr class="foritemdate" style="display:none; border-bottom:1 ">
    <td width="11%"  align="left" valign="top"></td>
    <td width="0%"  align="right" valign="top">
    <s:link beanclass="com.erp.action.ReportActionBean" event="byToday">
    <s:param name="daily" value="byToday"></s:param>
    <s:radio  value="byToday" id="radio8"  name="daily"></s:radio>
    </s:link>
    </td>
    <td   align="left" valign="top">By Today</td>
    <td>&nbsp;</td>
    <td   align="right" valign="top"><s:radio  value="bySelectDate" id="radio9"  name="daily"></s:radio></td>
    <td width="7%"  align="left" valign="top">By Date</td>
    </tr>
    <tr class="foritemselectdate" style="display:none;" >
    <td  height="21" align="left" valign="top"></td>
    <td   align="right" valign="top"></td>
    <td  align="left"  valign="top">Select Date</td>
    <td  align="left" colspan="7" valign="top"><s:text name="sdate" id="textboxh" readonly="readonly" onFocus="showCalendarControl(this);" class="textbox"></s:text> &nbsp;&nbsp;<s:submit name="bySelectDate"  id="getselectbydatebtn" class="buttons" value="Get"></s:submit></td>
    <td  align="left" colspan="3" valign="top"></td>
    </tr>
    </table>
      <table width="100%" border="0" cellspacing="0">
    <tr class="formonth" style="display:none;" >
    <td width="12%"  align="left" valign="top"></td>
    
    <td  align="left" width="14%"  valign="top">Select Month & Year </td>
    <td  align="left" colspan="3"  valign="top">

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


    <s:submit name="byMonthGrn" id="getbymonthbtngrn" class="buttons" value="Get" style="display:none;"></s:submit>
    </td>

    </tr>

    <tr class="foryear" style="display:none;" >
     <td width="12%"  align="left" valign="top"></td>
   
    <td  align="left" width="14%" valign="top">Select Year </td>

    <td  align="left"  valign="top">


    <s:select id="yearonly" name="y" class="dropdown">
    <%int year = 2011;%>
    <option  value="0">---Select Year---</option>

    <c:forEach var="i" begin="<%=year %>" end="<%=year + 20 %>">
    <option value="<c:out value="${i+1}"/>"><c:out value="${i+1}"/></option>
    </c:forEach>
    </s:select>
   
    </td>
<td colspan="2">&nbsp;</td>
    </tr>
    <tr class="forfromto" style="display:none;" >
     <td width="12%"  align="left" valign="top"></td>
   
    <td  align="left" width="14%"  valign="top">From Date </td>
    <td  align="left" width="20%"  valign="top">
    <s:text name="fromdate" id="fromd" class="textbox" onFocus="showCalendarControl(this);" />
    </td>
    <td width="9%"  align="right"  valign="top">To Date </td>
    <td width="45%"    align="left" valign="top">
    <s:text name="todate" class="textbox" id="tod" onFocus="showCalendarControl(this);"/>
    &nbsp;&nbsp;
    </td>
    </tr>
    
    <tr class="forYeartxt" style="display:none;" >
   <td width="12%"  align="left" valign="top"></td>
   
    <td  align="left" width="14%" valign="top">Enter Item Name </td>
    <td  align="left"  valign="top" colspan="2">
    <s:text name="itemcodetxt" class="textbox" id="itemcode"/>
    &nbsp;&nbsp;<s:submit name="byYear" class="buttons" id="getyearbtn" value="Get"></s:submit>
    </td>
    </tr>


    <c:if test="${actionBean.daily eq 'bySelectDate'}">
    <script type="text/javascript">
    $(document).ready(function() {
    $('.foritem').show();
    $('.foritemdate').show();
    $('.foritemselectdate').show();
    });
    </script>
    </c:if >
    <c:if test="${actionBean.daily eq 'byToday'}">
    <script type="text/javascript">
    $(document).ready(function() {
    $('.foritem').show();
    $('.foritemdate').show();

    });
    </script>
    </c:if >
    <c:if test="${actionBean.search eq 'byMonthly'}">
    <script type="text/javascript">
    $(document).ready(function() {
    $('.foritem').show();
    $('.forYeartxt').show();
    $('.formonth').show();


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
    <c:if test="${actionBean.search eq 'byYearly'}">
    <script type="text/javascript">
    $(document).ready(function() {
    $('.foritem').show();
    $('.foryear').show();
    $('.forYeartxt').show();

    $('.foritemselectdate').hide();
    $('.foritemdate').hide();
    $('#yearonly').attr("value",${actionBean.y});


    $('#itemcode').attr("value",${actionBean.itemcodetxt});
    });
    </script>
    </c:if >
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
    <c:if test="${actionBean.search eq 'byFromTo'}">
    <script type="text/javascript">
    $(document).ready(function() {
    $('.foritem').show();
    $('.forfromto').show();
    $('.foritemselectdate').hide();
    $('.foritemdate').hide();
    $('.forYeartxt').show();
    $('#itemcode').attr("value",${actionBean.itemcodetxt});
    });
    </script>
    </c:if >
  
    </table></td>
    </tr>
    </table>
    <%

    org.displaytag.decorator.TotalTableDecorator totals = new org.displaytag.decorator.TotalTableDecorator();
    totals.setTotalLabel("total");
    totals.setSubtotalLabel("partial total");
    pageContext.setAttribute("totals", totals);

    %>

    <c:if test="${actionBean.dailystocktoday!=null}">
    <s:useActionBean beanclass="com.erp.action.ReportActionBean" event="byToday" var="lst"></s:useActionBean>
    <%
    request.setAttribute("dailystocktodaylst",lst.getDailystocktoday());
    %>
    <table id="itemdailytable1"  width="86%"><tr><td>
    <d:table name="dailystocktodaylst" id="v" pagesize="10" class="disp" requestURI="/Report.action" decorator="totals">

    <d:column property="item.itemCode" title="Item Code" group="1"/>
    <d:column  property="date" format="{0,date,yyyy-MM-dd}" sortable="false" title="Create Date"/>

    <d:column property="openQuantity" title="Open Quantity"/>
    <d:column property="receivedQuantity" title="Received Quantity" total="true" class="r" />
    <d:column property="issuedQuantity" title="Issued Quantity" total="true" class="r"/>
    <d:column property="closingQuantity" title="Closing Quantity"/>

    </d:table></td></tr>
    </table>
    </c:if>
    <c:if test="${actionBean.dailystock!=null}">
    <s:useActionBean beanclass="com.erp.action.ReportActionBean" event="byDailyLedger" var="lst"></s:useActionBean>
    <%
    request.setAttribute("dailystocktodaylst",lst.getDailystock());
    %>
    <table id="itemdailytable2"  width="86%"><tr><td>
    <d:table name="dailystocktodaylst" id="v" pagesize="10" class="disp" requestURI="/Report.action" decorator="totals">
    <d:column property="create_date" format="{0,date,yyyy-MM-dd}" sortable="false" title="Create Date"/>
    <d:column property="name" title="Item Name" group="1"/>
    <d:column property="item_code" title="Item Code"/>
    <d:column property="open_quantity" title="Open Quantity"/>
    <d:column property="received_quantity" title="Received Quantity" total="true" class="r"/>
    <d:column property="issued_quantity" title="Issued Quantity" total="true" class="r"/>
    <d:column property="closing_quantity" title="Closing Quantity"/>

    </d:table></td></tr>
    </table>
    </c:if>
    <c:if test="${actionBean.dailyLedger!=null}">
    <s:useActionBean beanclass="com.erp.action.ReportActionBean" event="byDailyLedger" var="lst"></s:useActionBean>
    <%
    request.setAttribute("dailyLedger",lst.getDailyLedger());
    %>
    <table id="itemdailytable"  width="86%"><tr><td>
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
    <table id="grndailytable"  width="86%"><tr><td>
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