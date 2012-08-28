
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


    $("#getyearbtn").click(function(){
    if ($('#radioitem').is(':checked') ) {
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
        });
         $("#getbymonthbtngrn").click(function(){


    if ($('#radioGrn').is(':checked') ) {
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
         if ($('#radioPo').is(':checked') ) {
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
                 if ($('#radioRequisition').is(':checked') ) {
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
    $('#podailytable').hide();
      $('#getbymonthbtngrn').hide();
    $('.forYeartxt').show();

    });
    $('#radioGrn').click(function() {
    $('.foritem').hide();
    $('#grndailytable').hide();
    $('#itemdailytable').hide();
       $('#podailytable').hide();
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
      $('#podailytable').hide();
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
      $('#podailytable').hide();
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
    <br>
    <table class="heading_table">

    <tr><td align="left" class="pageheading" valign="top">
      <div class="sub_heading" >Ledger</div>
    </td></tr>
     </table>
     <table class="second_table"  ><tr><td>
    <table width="100%" border="0" cellspacing="0">
  
    <tr>
    <td width="8%" height="21"  align="left" valign="top">Ledger </td>
    <td width="1%"  align="right" valign="top">
        <s:radio  value="byDailyLedger" id="radioitem"  name="stock"></s:radio></td>
    <td width="8%"  align="left" valign="top">Item</td>
   
    <td width="4%"  align="right" valign="top">

    <s:radio  value="bySection" id="radioGrn"  name="stock"></s:radio>

    </td>
    <td width="7%"  align="left" valign="top">GRN</td>
        <td width="1%">&nbsp;</td>
    <td width="3%"  align="right" valign="top">

    <s:radio  value="byPo" id="radioPo"  name="stock"></s:radio>

    </td>
    <td width="15%"  align="left" valign="top">Purchase Order</td>
           <td width="1%">&nbsp;</td>
    <td width="3%"  align="right" valign="top">

    <s:radio  value="byRequisition" id="radioRequisition"  name="stock"></s:radio>

    </td>
    <td width="20%"  align="left" valign="top">Material Requisition</td>
    <td width="24%" colspan="3"></td>
    </tr>

   

    <tr class="formonth" style="display:none;" >


    <td  align="left" colspan="4" valign="top"><div align="center" style="margin-left:59px">Select Month & Year</div> </td>
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


    <s:submit name="byMonthGrn" id="getbymonthbtngrn" class="buttons" value="Get" style="display:none;"></s:submit>
    </td>

    </tr>



    <tr class="forYeartxt" style="display:none;" >

    <td  align="right" colspan="4" valign="top"><div align="center" style="margin-left:40px">Enter Item Name</div> </td>
    <td  align="left" colspan="9" valign="top">
    <s:text name="itemcodetxt" class="textbox" id="itemcode" />
    &nbsp;&nbsp;<s:submit name="byLedger" class="buttons" id="getyearbtn" value="Get"></s:submit>
    </td>
    </tr>



    <c:if test="${actionBean.stock eq 'byDailyLedger'}">
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
          <c:if test="${actionBean.stock eq 'byPo'}">
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
             <c:if test="${actionBean.stock eq 'byRequisition'}">
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
    <table id="itemdailytable"  width="87%"><tr><td>
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
    <table id="grndailytable"  width="87%"><tr><td>
    <d:table name="grnList" id="gr" pagesize="50" class="disp" requestURI="/Report.action">
    <d:column property="createDate" format="{0,date,yyyy-MM-dd}" sortable="false" title="Create Date"/>
    <d:column property="id" title="Grn No"/>
    <d:column property="billValue" title="Bill Value" />
    <d:column property="purchaseOrder.purchaseOrderNo" title="Purchase Order No" />
    </d:table></td></tr>
    </table>
    </c:if>
    <c:if test="${actionBean.poHistory!=null}">
    <s:useActionBean beanclass="com.erp.action.ReportActionBean" event="byMonthGrn" var="poLst"></s:useActionBean>
    <%
    request.setAttribute("poList",poLst.getPoHistory());
    %>
    <table id="podailytable"  width="87%"><tr><td>
    <d:table name="poList" id="gr" pagesize="50" class="disp" requestURI="/Report.action">
    <d:column property="createDate" format="{0,date,yyyy-MM-dd}" sortable="false" title="Create Date"/>
    <d:column property="purchaseOrderNo" title="Purchase Order No"/>
    <d:column property="vendor.name" title="Vendor" />
   
    </d:table></td></tr>
    </table>
    </c:if>
     <c:if test="${actionBean.reqHistory!=null}">
    <s:useActionBean beanclass="com.erp.action.ReportActionBean" event="byMonthGrn" var="reqLst"></s:useActionBean>
    <%
    request.setAttribute("reqLst",reqLst.getReqHistory());
    %>
    <table id="reqdailytable"  width="87%"><tr><td>
    <d:table name="reqLst" id="gr" pagesize="50" class="disp" requestURI="/Report.action">
    <d:column property="requisitionDate" format="{0,date,yyyy-MM-dd}" sortable="false" title="Create Date"/>
    <d:column property="nameOfUser" title="User Name"/>
    <d:column title="Item name">
                <table>
                    <c:forEach items="${gr.requisitiondetailarray}" var="loopstore" varStatus="loop" >
                        <tr>  <td>${loopstore.item.name}</td></tr>
                    </c:forEach>
                </table>     </d:column>
             <d:column title="Item name">
                <table>
                    <c:forEach items="${gr.requisitiondetailarray}" var="loopstore1" varStatus="loop" >
                        <tr>  <td>${loopstore1.requiredQty}</td></tr>
                    </c:forEach>
                </table>     </d:column>
    </d:table></td></tr>
    </table>
    </c:if>
    </s:form>
    </s:layout-component>
    </s:layout-render>