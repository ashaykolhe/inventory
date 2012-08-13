<%--
Created by IntelliJ IDEA.
User: Milind
Date: Mar 2, 2012
Time: 10:21:30 AM
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/includes/_taglibInclude.jsp" %>
<link rel="stylesheet" href="css/general.css" type="text/css" media="screen"/>
<link rel="stylesheet" type="text/css" href="css/stylesheet.css"/>
<c:set var = "TR1" value="receiptgrn"/>
<c:if test="${actionBean.hdnvalue eq TR1}">
<script type="text/javascript">
        function OpenPopup(){
            var w = 760;
            var h = 450;
            var winl = (screen.width-w)/2;
            var wint = (screen.height-h)/2;
            if (winl < 0) winl = 0;
            if (wint < 0) wint = 0;
            var page = "Search.action?redirectgrnpopup=&id="+${actionBean.id}+"";
            windowprops = "height="+h+",width="+w+",top="+ wint +",left="+ winl +",location=no," + "scrollbars=yes,menubars=no,toolbars=no,resizable=no,status=yes";
            window.open(page, "Popup", windowprops);
            return;
        }
        window.onLoad =OpenPopup();
    </script>
</c:if >
<c:set var = "TR2" value="receipt"/>
<c:if test="${actionBean.hdnvalue eq TR2}">
<script type="text/javascript">
        function OpenPopup(){
            var w = 760;
            var h = 450;
            var winl = (screen.width-w)/2;
            var wint = (screen.height-h)/2;
            if (winl < 0) winl = 0;
            if (wint < 0) wint = 0;
            var page = "Search.action?redirectpopup=&id="+${actionBean.id}+"&name=+${actionBean.name}+";
            windowprops = "height="+h+",width="+w+",top="+ wint +",left="+ winl +",location=no," + "scrollbars=yes,menubars=no,toolbars=no,resizable=no,status=yes";
            window.open(page, "Popup", windowprops);
            return;
        }
        window.onLoad =OpenPopup();
    </script>
</c:if >
<c:set var = "TR3" value="receiptpurchase"/>
<c:if test="${actionBean.hdnvalue eq TR3}">
    <script type="text/javascript">
        function OpenPopup(){

            var w = 780;
            var h = 450;
            var winl = (screen.width-w)/2;
            var wint = (screen.height-h)/2;
            if (winl < 0) winl = 0;
            if (wint < 0) wint = 0;
            var page = "Search.action?redirectpurchase=&id="+${actionBean.id}+"";
            windowprops = "height="+h+",width="+w+",top="+ wint +",left="+ winl +",location=no,"
                    + "scrollbars=yes,menubars=no,toolbars=no,resizable=no,status=yes";
            window.open(page, "Popup", windowprops);
            return;
        }
        window.onLoad =OpenPopup();
    </script>
</c:if >
<script type="text/javascript">

function combo(){
    var submenuvalue=$('#hiddenSubMenu').html();
    var aval=$('#autocompleteval').html();

    if(blank !="")
        blank="";
    else
    {
        $('#myDiv1').hide();
            $('#myDiv2').hide();
            $('#myDiv3').hide();
            $('.t').hide();

    }

    if($('#menu').val()=='byPurchaseOrder')
    {


        var po=document.getElementById("submenu");
         var options=po.getElementsByTagName("option");
         var i;
         // Loop through the array of options and remove each
         // each one from the parent's childNode list.
         for (i=0; i<options.length; i++)
         {
         po.removeChild(options[i]);
         }// end for i
        var povalue=new Array("none","poNumber","poVendorName","poVendorId","poDate","poBetweenDate");
        var poshow=new Array("--Select PO Options--","PO Number","Vendor Name","Vendor Id","PO Date","PO Between Date");
        for(var i=0;i<povalue.length;i++){
                    var t=povalue[i];
                    if(t==submenuvalue){
                       po.options[i]=new Option(poshow[i],povalue[i],false,true);
                        
                    }
                    else
                       po.options[i]=new Option(poshow[i],povalue[i]);
               }    //end of for
    }
    else if($('#menu').val()=='byGrn')
    {
        var grn=document.getElementById("submenu");
         var options=grn.getElementsByTagName("option");
         var i;
          for (i=0; i<options.length; i++)
         {
         grn.removeChild(options[i]);
         }// end for i
        var grnvalue=new Array("none","grnNumber","grnPoNumber","grnVendorName","grnVendorId","grnDate","grnOrderDate","grnBetweenDate");
        var grnshow=new Array("--Select Grn Options--","Grn Number","PO Number","Vendor Name","Vendor Id","Grn Date","Order Date","Grn Between Date");
        for(var i=0;i<grnvalue.length;i++){
                    var t=grnvalue[i];
                    if(t==submenuvalue){
                       grn.options[i]=new Option(grnshow[i],grnvalue[i],false,true);}
                    else
                       grn.options[i]=new Option(grnshow[i],grnvalue[i]);
               }    //end of for

    }
    else if($('#menu').val()=='byItem')
        {
            var item=document.getElementById("submenu");
            var options=item.getElementsByTagName("option");
            var i;

            for (i=0; i<options.length; i++)
            {
                item.removeChild(options[i]);
            }// end for i
            var itemvalue=new Array("none","itemiName","itemiCode","itemUom","itemSection");
                var itemshow=new Array("--Select Item Option --","By Item Name","By Item Code","By UOM","By Section");
                for(var i=0;i<itemvalue.length;i++){
                    var t=itemvalue[i];
                    if(t==submenuvalue){
                       item.options[i]=new Option(itemshow[i],itemvalue[i],false,true);}
                    else
                       item.options[i]=new Option(itemshow[i],itemvalue[i]);
               }    //end of for

        }
        else if($('#menu').val()=='byVendor')
            {
                var v=document.getElementById("submenu");
                var options=v.getElementsByTagName("option");
                for (i=0; i<options.length; i++)
                {
                    v.removeChild(options[i]);
                }
                var vvalue=new Array("none","vendorName","vendorId","vendorProduct");
                var vshow=new Array("--Select Vendor Option --","Vendor Name","Vendor Id","Vendor Product");
                for(var i=0;i<vvalue.length;i++){
                    var t=vvalue[i];
                    if(t==submenuvalue){
                       v.options[i]=new Option(vshow[i],vvalue[i],false,true);}
                    else
                       v.options[i]=new Option(vshow[i],vvalue[i]);
               }    //end of for
          }
            else if($('#menu').val()=='byStoreIssue')
                {
                    var si=document.getElementById("submenu");
                    var options=si.getElementsByTagName("option");
                    var i;
                    for (i=0; i<options.length; i++)
                    {
                        si.removeChild(options[i]);
                    }// end for i
                    var sivalue=new Array("none","siNumber","siRequisitionId","siDate");
                    var sishow=new Array("--Select StoreIssue Options--","By StoreIssue Number","By Requisition Id","By StoreIssue Date");
                    for(var i=0;i<sivalue.length;i++){
                    var t=sivalue[i];
                    if(t==submenuvalue){
                       si.options[i]=new Option(sishow[i],sivalue[i],false,true);
                    }
                    else
                       si.options[i]=new Option(sishow[i],sivalue[i]);
               }    //end of for

                }

}
  var hide=$('#hiddenSubMenu').html();
  var blank=$('#hiddenSubMenu').html();
function fillsubmenu(){

   if(hide != "")
      hide="";
   else
   {
       $('.t').hide();
       $('#autocomplete').val("");
       $('.textbox').val("");

   }
    if($('#submenu').val() == 'itemiName'){
         $('#myDiv3').hide();
              $('#myDiv2').hide();
              $('#myDiv1').show();
          $.post("Search.action?autoitem", {ajaxSubmenu:$('#submenu').val()}, function (result) {
            var availableTags=eval(result);
            $("input#autocomplete").autocomplete({
                source: availableTags
            });
        });
    }
    else if($('#submenu').val() == 'itemiCode'){
          $('#myDiv3').hide();
              $('#myDiv2').hide();
              $('#myDiv1').show();
          $.post("Search.action?autoitem", {ajaxSubmenu:$('#submenu').val()}, function (result) {
            var availableTags=eval(result);
            $("input#autocomplete").autocomplete({
                source: availableTags
            });
        });
    }
     else if($('#submenu').val() == 'itemUom'){
             $('#myDiv3').hide();
              $('#myDiv2').hide();
              $('#myDiv1').show();
          $.post("Search.action?autoitem", {ajaxSubmenu:$('#submenu').val()}, function (result) {
            var availableTags=eval(result);
            $("input#autocomplete").autocomplete({
                source: availableTags
            });
        });
    }
    else if($('#submenu').val() == 'itemSection'){
               $('#myDiv3').hide();
              $('#myDiv2').hide();
              $('#myDiv1').show();
          $.post("Search.action?autoitem", {ajaxSubmenu:$('#submenu').val()}, function (result) {
            var availableTags=eval(result);
            $("input#autocomplete").autocomplete({
                source: availableTags
            });
        });
    }
    else if($('#submenu').val() == 'grnNumber'){
                     $('#myDiv3').hide();
              $('#myDiv2').hide();
              $('#myDiv1').show();
          $.post("Search.action?autogrn", {ajaxSubmenu:$('#submenu').val()}, function (result) {
            var availableTags=eval(result);
            $("input#autocomplete").autocomplete({
                source: availableTags
            });
        });
    }
    else if($('#submenu').val() == 'grnPoNumber'){
               $('#myDiv3').hide();
              $('#myDiv2').hide();
              $('#myDiv1').show();
                 $.post("Search.action?autogrn", {ajaxSubmenu:$('#submenu').val()}, function (result) {

                var availableTags=eval(result);
                $("input#autocomplete").autocomplete({
                    source: availableTags
                });
            });
        }
       else if($('#submenu').val() == 'grnVendorName'){
              $('#myDiv3').hide();
              $('#myDiv2').hide();
              $('#myDiv1').show();
                 $.post("Search.action?autogrn", {ajaxSubmenu:$('#submenu').val()}, function (result) {

                var availableTags=eval(result);
                $("input#autocomplete").autocomplete({
                    source: availableTags
                });
            });
        }
       else if($('#submenu').val() == 'grnVendorId'){
              $('#myDiv3').hide();
              $('#myDiv2').hide();
              $('#myDiv1').show();
              $.post("Search.action?autogrn", {ajaxSubmenu:$('#submenu').val()}, function (result) {
              var availableTags=eval(result);
                $("input#autocomplete").autocomplete({
                    source: availableTags
                });
            });
        }
       else if($('#submenu').val() == 'grnDate'){
                $('#myDiv3').hide();
                $('#myDiv2').show();
                $('#myDiv1').hide();
                $.post("Search.action?autogrn", {ajaxSubmenu:$('#submenu').val()}, function (result) {
                var availableTags=eval(result);
                $("input#autocomplete").autocomplete({
                    source: availableTags
                });
            });
        }
       else if($('#submenu').val() == 'grnOrderDate'){
              $('#myDiv3').hide();
              $('#myDiv2').show();
              $('#myDiv1').hide();
                 $.post("Search.action?autogrn", {ajaxSubmenu:$('#submenu').val()}, function (result) {

                var availableTags=eval(result);
                $("input#autocomplete").autocomplete({
                    source: availableTags
                });
            });
        }
       else if($('#submenu').val() == 'grnBetweenDate'){
              $('#myDiv3').show();
              $('#myDiv2').hide();
              $('#myDiv1').hide();
                 $.post("Search.action?autogrn", {ajaxSubmenu:$('#submenu').val()}, function (result) {

                var availableTags=eval(result);
                $("input#autocomplete").autocomplete({
                    source: availableTags
                });
            });
        }
       else if($('#submenu').val() == 'vendorName'){
              $('#myDiv3').hide();
              $('#myDiv2').hide();
              $('#myDiv1').show();
                 $.post("Search.action?autovendor", {ajaxSubmenu:$('#submenu').val()}, function (result) {

                var availableTags=eval(result);
                $("input#autocomplete").autocomplete({
                    source: availableTags
                });
            });
        }
       else if($('#submenu').val() == 'vendorId'){
                      $('#myDiv3').hide();
              $('#myDiv2').hide();
              $('#myDiv1').show();
                 $.post("Search.action?autovendor", {ajaxSubmenu:$('#submenu').val()}, function (result) {

                var availableTags=eval(result);
                $("input#autocomplete").autocomplete({
                    source: availableTags
                });
            });
        }
       else if($('#submenu').val() == 'vendorProduct'){
                $('#myDiv3').hide();
                $('#myDiv2').hide();
                $('#myDiv1').show();
                 $.post("Search.action?autovendor", {ajaxSubmenu:$('#submenu').val()}, function (result) {

                var availableTags=eval(result);
                $("input#autocomplete").autocomplete({
                    source: availableTags
                });
            });
        }
        else if($('#submenu').val() == 'siNumber'){
                         $('#myDiv3').hide();
              $('#myDiv2').hide();
              $('#myDiv1').show();
                $.get("Search.action?autoStoreIssue ",function(result) {
                    var availableTags=eval(result);

                    $("input#autocomplete").autocomplete({
                        source: availableTags
                    });
                });
            }
        else if($('#submenu').val() == 'siRequisitionId'){
              $('#myDiv3').hide();
              $('#myDiv2').hide();
              $('#myDiv1').show();
                $.get("Search.action?autoStoreIssue ",function(result) {
                    var availableTags=eval(result);

                    $("input#autocomplete").autocomplete({
                        source: availableTags
                    });
                });
            }
            else if($('#submenu').val()== 'siDate'){

                             $('#myDiv3').hide();
                             $('#myDiv2').show();
                             $('#myDiv1').hide();
                           $.post("Search.action?autoStoreIssue", {ajaxSubmenu:$('#submenu').val()}, function (result) {
                                var availableTags=eval(result);
                                $("input#autocomplete").autocomplete({
                                    source: availableTags
                                });
                            });
                        }
            else if($('#submenu').val()== 'poNumber'){
                     $('#myDiv3').hide();
              $('#myDiv2').hide();
              $('#myDiv1').show();
                    $.post("Search.action?autoPurchaseOrder", {ajaxSubmenu:$('#submenu').val()}, function (result) {
                        var availableTags=eval(result);
                        $("input#autocomplete").autocomplete({
                            source: availableTags
                        });
                    });
                }
        else if($('#submenu').val()== 'poVendorName'){
                   $('#myDiv3').hide();
              $('#myDiv2').hide();
              $('#myDiv1').show();
                   $.post("Search.action?autoPurchaseOrder", {ajaxSubmenu:$('#submenu').val()}, function (result) {
                           var availableTags=eval(result);
                        $("input#autocomplete").autocomplete({
                            source: availableTags
                        });
                    });
                }
          else if($('#submenu').val()== 'poVendorId'){
              $('#myDiv3').hide();
              $('#myDiv2').hide();
              $('#myDiv1').show();
                                                                    

                   $.post("Search.action?autoPurchaseOrder", {ajaxSubmenu:$('#submenu').val()}, function (result) {
                           var availableTags=eval(result);
                        $("input#autocomplete").autocomplete({
                            source: availableTags
                        });
                    });
                }
         else if($('#submenu').val()== 'poDate'){

                             $('#myDiv3').hide();
                             $('#myDiv2').show();
                             $('#myDiv1').hide();
                           $.post("Search.action?autoPurchaseOrder", {ajaxSubmenu:$('#submenu').val()}, function (result) {
                                var availableTags=eval(result);
                                $("input#autocomplete").autocomplete({
                                    source: availableTags
                                });
                            });
                        }
            else if($('#submenu').val()== 'poBetweenDate'){
                                         $('#myDiv3').show();
                                         $('#myDiv2').hide();
                                         $('#myDiv1').hide();
                                       $.post("Search.action?autoPurchaseOrder", {ajaxSubmenu:$('#submenu').val()}, function (result) {
                                            var availableTags=eval(result);
                                            $("input#autocomplete").autocomplete({
                                                source: availableTags
                                            });
                                        });
                                    }
}
$(document).ready(function() {

    $('#menu').change();

           fillsubmenu();
  
    $("#seperategetbtn").click(function(){
        if ($("#autocomplete").val().trim()==""){
            alert("please enter search details.");
            return false;
        }
        var varsubmenu=$("#submenu option:selected").val().trim().toString();
       if(varsubmenu=='none')
        {
        alert("Please,Select Search By Option");
        return false;
        }
        else if(varsubmenu=='grnNumber' || varsubmenu=='siNumber' || varsubmenu=='siRequisitionId')
       {
            var chk = /^[0-9]+$/.test($('#autocomplete').val().trim());
                    if (!chk) {
                            alert("Enter Number for "+$("#submenu option:selected").text().trim().toString()+"");
                            $('#autocomplete').val("");
                            return false;
                            }
       }

    });

});
</script>
<s:useActionBean beanclass="com.erp.action.SearchActionBean" event="lst" var="searchlst"></s:useActionBean>
<%
    request.setAttribute("itemlst",searchlst.getItemlst());
    request.setAttribute("vendorlst",searchlst.getVendorlst());
    request.setAttribute("grnlst",searchlst.getGrnlst());
    request.setAttribute("storeissuelst",searchlst.getStoreissuelst());
    request.setAttribute("purchaseOrderlst",searchlst.getPurchaseOrderlst());

%>
<s:layout-render name="/layout/_base.jsp">
<s:layout-component name="body">
<s:form beanclass="com.erp.action.SearchActionBean" id="searchForm">
 <br>
    <table class="heading_table">

    <tr><td align="left" class="pageheading" valign="top">
      <div class="sub_heading" >Search</div>
    </td></tr>
     </table>
     <table class="second_table"  ><tr><td>
    <table width="100%" border="0" cellspacing="0"><tr>
                    <td width="13%" align="left" valign="top">Search What ?</td>
                    <td width="87%" align="left" valign="top">
                        <%
                            String[] menu={"byPurchaseOrder","byGrn","byItem","byVendor","byStoreIssue"};
                            String[] name={"Purchase Order","GRN","Item","Vendor","Store Issue"};
                        %>
                        <s:select name="searchMenu" id="menu" class="dropdown" onchange="combo()">
                            <option value="0">----Select Menu----</option>
                            <%for(int i=0;i<menu.length;i++){%>
                            <c:set var="temp" value="<%=menu[i] %>"/>
                            <c:choose>
                                <c:when test="${actionBean.searchMenu eq temp}">
                                    <option value="<%= menu[i]%>" selected="selected"><%=name[i]%></option>
                                </c:when>
                                <c:otherwise>
                                    <option value="<%= menu[i]%>"><%=name[i]%></option>
                                </c:otherwise>

                            </c:choose>
                            <%}%>

                        </s:select>
                    </td>
                </tr>
                <tr>
                    <td>Search By</td>
                    <td align="left" valign="top">
                        <s:select id="submenu" name="searchSubmenu" class="dropdown" onchange="fillsubmenu()">
                             <option  value="0">---Select Submenu---</option>
                        </s:select>
                    </td>

                </tr>
                <tr>

                    <td>&nbsp;<span style="visibility:hidden;" id="hiddenSubMenu">${actionBean.searchSubmenu}</span>
                    </td>

                    <td align="left" valign="top">
                        <div align="left">
                        <div id="myDiv1"  align="left" style="display:none;text-align:left;" class="labels">

                           <s:text class="textbox" name="name" id="autocomplete" value=""/>
                            <s:submit name="search" id="seperategetbtn" class="buttons" value="Get" ></s:submit>

                        </div>

                        <div id="myDiv2"  align="left" style="display:none;text-align:left;" class="labels">

                            <s:text name="date"  readonly="readonly" onFocus="showCalendarControl(this);" class="textbox" />
                            <s:submit name="search" id="seperategetbtn" class="buttons" value="Get" ></s:submit>

                        </div>

                        <div id="myDiv3"  align="left" style="display:none;text-align:left;" class="labels">

                            <s:text name="fromdate"  readonly="readonly" onFocus="showCalendarControl(this);" class="textbox" />
                            &nbsp;&nbsp;        <s:text name="todate" style="height: 23px; width: 173px;" readonly="readonly" onFocus="showCalendarControl(this);" class="textbox" />
                            <s:submit name="search" id="seperategetbtn" class="buttons" value="Get" ></s:submit>

                        </div> </div>
                    </td>

                </tr>
          </table>
        </td>
    </tr>
</table>

<c:if test="${actionBean.grnlst!=null}">
<c:if test="${actionBean.searchSubmenu eq 'grnNumber'}">
    <table class="t" id="grntable" width="86%"><tr><td>
        <d:table name="grnlst" id="grn1" pagesize="10" class="disp" requestURI="/Search.action?search">
            <d:column property="id" title="Grn No"/>
            <d:column property="createDate" title="Date"   format="{0,date,yyyy-MM-dd}" sortable="false"/>
            <d:column property="billValue" title="Bill Value" />
            <d:column property="purchaseOrder.purchaseOrderNo" title="Purchase Order No" />
            <d:column title="Item Name">
                <table>
                    <c:forEach items="${grn1.grndetailarray}" var="grnloop" varStatus="loop" >
                        <tr>  <td>${grnloop.item.name}</td></tr>
                    </c:forEach>
                </table>     </d:column>
            <d:column title="Ordered Qty">
                <table>
                    <c:forEach items="${grn1.purchaseOrder.purchasedetailarray}" var="grnloop1" varStatus="loop" >
                        <tr>  <td>${grnloop1.orderedQty} </td> </tr>
                    </c:forEach>  </table>
            </d:column>
            <d:column title="Accepted Qty">
                <table>
                    <c:forEach items="${grn1.grndetailarray}" var="grnloop2" varStatus="loop" >
                        <tr>  <td>${grnloop2.acceptedQty} </td> </tr>
                    </c:forEach>  </table>
            </d:column>
            <d:column title="View" class="delete" >
                <s:link beanclass="com.erp.action.SearchActionBean" event="print" >
                    <s:param name="id" value="${grn1.id}"></s:param>
                    <s:param name="date" value="${actionBean.date}"></s:param>
                    <s:param name="name" value="${grn1.id}"></s:param>
                    <s:param name="hdnvalue" value="testgrn"></s:param>
                    <s:param name="viewmenu" value="byGrn"></s:param>
                                  <s:param name="viewsubmenu" value="${actionBean.searchSubmenu}"></s:param>

                <img src="images/view.gif" />
                </s:link>
            </d:column>
        </d:table></td></tr></table>
</c:if>
<c:if test="${actionBean.searchSubmenu eq 'grnVendorName'}">
    <table class="t" id="grntable" width="86%"><tr><td>
        <d:table name="grnlst" id="grn1" pagesize="10" class="disp" requestURI="/Search.action?search">
            <d:column property="id" title="Grn No"/>
            <d:column property="createDate" title="Date"   format="{0,date,yyyy-MM-dd}" sortable="false"/>
            <d:column property="billValue" title="Bill Value" />
            <d:column property="purchaseOrder.purchaseOrderNo" title="Purchase Order No" />
            <d:column title="Item Name">
                <table>
                    <c:forEach items="${grn1.grndetailarray}" var="grnloop" varStatus="loop" >
                        <tr>  <td>${grnloop.item.name}</td></tr>
                    </c:forEach>
                </table>     </d:column>
            <d:column title="Ordered Qty">
                <table>
                    <c:forEach items="${grn1.purchaseOrder.purchasedetailarray}" var="grnloop1" varStatus="loop" >
                        <tr>  <td>${grnloop1.orderedQty} </td> </tr>
                    </c:forEach>  </table>
            </d:column>
            <d:column title="Accepted Qty">
                <table>
                    <c:forEach items="${grn1.grndetailarray}" var="grnloop2" varStatus="loop" >
                        <tr>  <td>${grnloop2.acceptedQty} </td> </tr>
                    </c:forEach>  </table>
            </d:column>
            <d:column title="View" class="delete" >
                <s:link beanclass="com.erp.action.SearchActionBean" event="print" >
                    <s:param name="id" value="${grn1.id}"></s:param>
                    <s:param name="date" value="${actionBean.date}"></s:param>
                    <s:param name="name" value="${grn1.purchaseOrder.vendor.name}"></s:param>
                    <s:param name="hdnvalue" value="testgrn"></s:param>
                    <s:param name="viewmenu" value="byGrn"></s:param>
                                  <s:param name="viewsubmenu" value="${actionBean.searchSubmenu}"></s:param>

                <img src="images/view.gif" />
                </s:link>
            </d:column>
        </d:table></td></tr></table>
</c:if>
<c:if test="${actionBean.searchSubmenu eq 'grnVendorId'}">
    <table class="t" id="grntable" width="86%"><tr><td>
        <d:table name="grnlst" id="grn1" pagesize="10" class="disp" requestURI="/Search.action?search">
            <d:column property="id" title="Grn No"/>
            <d:column property="createDate" title="Date"   format="{0,date,yyyy-MM-dd}" sortable="false"/>
            <d:column property="billValue" title="Bill Value" />
            <d:column property="purchaseOrder.purchaseOrderNo" title="Purchase Order No" />
            <d:column title="Item name">
                <table>
                    <c:forEach items="${grn1.grndetailarray}" var="grnloop" varStatus="loop" >
                        <tr>  <td>${grnloop.item.name}</td></tr>
                    </c:forEach>
                </table>     </d:column>
            <d:column title="Ordered Qty">
                <table>
                    <c:forEach items="${grn1.purchaseOrder.purchasedetailarray}" var="grnloop1" varStatus="loop" >
                        <tr>  <td>${grnloop1.orderedQty} </td> </tr>
                    </c:forEach>  </table>
            </d:column>
            <d:column title="Accepted Qty">
                <table>
                    <c:forEach items="${grn1.grndetailarray}" var="grnloop2" varStatus="loop" >
                        <tr>  <td>${grnloop2.acceptedQty} </td> </tr>
                    </c:forEach>  </table>
            </d:column>
            <d:column title="View" class="delete">
                <s:link beanclass="com.erp.action.SearchActionBean" event="print" >
                    <s:param name="id" value="${grn1.id}"></s:param>
                    <s:param name="date" value="${actionBean.date}"></s:param>
                    <s:param name="name" value="${grn1.purchaseOrder.vendor.vendorCode}"></s:param>
                    <s:param name="hdnvalue" value="testgrn"></s:param>
                    <s:param name="viewmenu" value="byGrn"></s:param>
                                  <s:param name="viewsubmenu" value="${actionBean.searchSubmenu}"></s:param>

                <img src="images/view.gif" />
                </s:link>
            </d:column>
        </d:table></td></tr></table>
</c:if>
    <c:if test="${actionBean.searchSubmenu eq 'grnPoNumber'}">
    <table class="t" id="grntable" width="86%"><tr><td>
        <d:table name="grnlst" id="grn1" pagesize="10" class="disp" requestURI="/Search.action?search">
            <d:column property="id" title="Grn No"/>
            <d:column property="createDate" title="Date"   format="{0,date,yyyy-MM-dd}" sortable="false"/>
            <d:column property="billValue" title="Bill Value" />
            <d:column property="purchaseOrder.purchaseOrderNo" title="Purchase Order No" />
            <d:column title="Item name">
                <table>
                    <c:forEach items="${grn1.grndetailarray}" var="grnloop" varStatus="loop" >
                        <tr>  <td>${grnloop.item.name}</td></tr>
                    </c:forEach>
                </table>     </d:column>
            <d:column title="Ordered Qty">
                <table>
                    <c:forEach items="${grn1.purchaseOrder.purchasedetailarray}" var="grnloop1" varStatus="loop" >
                        <tr>  <td>${grnloop1.orderedQty} </td> </tr>
                    </c:forEach>  </table>
            </d:column>
            <d:column title="Accepted Qty">
                <table>
                    <c:forEach items="${grn1.grndetailarray}" var="grnloop2" varStatus="loop" >
                        <tr>  <td>${grnloop2.acceptedQty} </td> </tr>
                    </c:forEach>  </table>
            </d:column>
            <d:column title="View" class="delete">
                <s:link beanclass="com.erp.action.SearchActionBean" event="print" >
                    <s:param name="id" value="${grn1.id}"></s:param>
                    <s:param name="date" value="${actionBean.date}"></s:param>
                    <s:param name="name" value="${grn1.purchaseOrder.purchaseOrderNo}"></s:param>
                    <s:param name="hdnvalue" value="testgrn"></s:param>
                    <s:param name="viewmenu" value="byGrn"></s:param>
                                  <s:param name="viewsubmenu" value="${actionBean.searchSubmenu}"></s:param>

                <img src="images/view.gif" />
                </s:link>
            </d:column>
        </d:table></td></tr></table>
</c:if>
    <c:if test="${actionBean.searchSubmenu eq 'grnDate' or actionBean.searchSubmenu eq 'grnBetweenDate' or actionBean.searchSubmenu eq 'grnOrderDate'}">
    <table class="t" id="grntable" width="86%"><tr><td>
        <d:table name="grnlst" id="grn1" pagesize="10" class="disp" requestURI="/Search.action?search">
            <d:column property="id" title="Grn No"/>
            <d:column property="createDate" title="Date"   format="{0,date,yyyy-MM-dd}" sortable="false"/>
            <d:column property="billValue" title="Bill Value" />
            <d:column property="purchaseOrder.purchaseOrderNo" title="Purchase Order No" />
            <d:column title="Item Name">
                <table>
                    <c:forEach items="${grn1.grndetailarray}" var="grnloop" varStatus="loop" >
                        <tr>  <td>${grnloop.item.name}</td></tr>
                    </c:forEach>
                </table>     </d:column>
            <d:column title="Ordered Qty">
                <table>
                    <c:forEach items="${grn1.purchaseOrder.purchasedetailarray}" var="grnloop1" varStatus="loop" >
                        <tr>  <td>${grnloop1.orderedQty} </td> </tr>
                    </c:forEach>  </table>
            </d:column>
            <d:column title="Accepted Qty">
                <table>
                    <c:forEach items="${grn1.grndetailarray}" var="grnloop2" varStatus="loop" >
                        <tr>  <td>${grnloop2.acceptedQty} </td> </tr>
                    </c:forEach>  </table>
            </d:column>
            <d:column title="View" class="delete">
                <s:link beanclass="com.erp.action.SearchActionBean" event="print" >
                    <s:param name="id" value="${grn1.id}"></s:param>
                    <s:param name="date" value="${actionBean.date}"></s:param>
                    <s:param name="fromdate" value="${actionBean.fromdate}"></s:param>
                    <s:param name="todate" value="${actionBean.todate}"></s:param>

                    <%--<s:param name="name" value="${grn1.purchaseOrder.vendor.vendorCode}"></s:param>--%>
                    <s:param name="hdnvalue" value="testgrn"></s:param>
                    <s:param name="viewmenu" value="byGrn"></s:param>
                                  <s:param name="viewsubmenu" value="${actionBean.searchSubmenu}"></s:param>

                <img src="images/view.gif" />
                </s:link>
            </d:column>
        </d:table></td></tr></table>
</c:if>
</c:if>
<c:if test="${actionBean.purchaseOrderlst!=null}">
    <c:if test="${actionBean.searchSubmenu eq 'poDate' or actionBean.searchSubmenu eq 'poBetweenDate'}">
    <table class="t" id="purchaseOrdertable" width="86%"><tr><td>  <!--print item in table format-->
        <d:table name="purchaseOrderlst" id="purchase" pagesize="10" class="disp" requestURI="/Search.action?search">
            <d:column property="vendor.name" title="Vendor Name"/>
            <d:column property="vendor.productSupplied" title="Product Supplied"/>
            <d:column property="purchaseOrderNo" title="Purchase Order No"/>
            <d:column property="createDate" title="Purchase Order Date"  format="{0,date,yyyy-MM-dd}" sortable="false"/>
            <d:column property="status" title="Status"/>
            <d:column title="Item Name">
                <table>
                    <c:forEach items="${purchase.purchasedetailarray}" var="purchaseloop" varStatus="loop" >
                        <tr>  <td>${purchaseloop.item.name}</td></tr>
                    </c:forEach>
                </table>     </d:column>
            <d:column title="Ordered Qty">
                <table>
                    <c:forEach items="${purchase.purchasedetailarray}" var="purchaseloop1" varStatus="loop" >
                        <tr>  <td>${purchaseloop1.orderedQty} </td> </tr>
                    </c:forEach>  </table>
            </d:column>
            <d:column title="Amount">
                <table>
                    <c:forEach items="${purchase.purchasedetailarray}" var="purchaseloop2" varStatus="loop" >
                        <tr>  <td>${purchaseloop2.rate * purchaseloop2.orderedQty}</td></tr>
                    </c:forEach></table> </d:column>

            <d:column title="View" class="delete" >
                <s:link beanclass="com.erp.action.SearchActionBean" event="print" >
                    <s:param name="id" value="${purchase.id}"></s:param>
                    <s:param name="hdnvalue" value="testpurchase"></s:param>
                    <s:param name="date" value="${actionBean.date}"></s:param>

                                   <s:param name="fromdate" value="${actionBean.fromdate}"></s:param>
                                   <s:param name="todate" value="${actionBean.todate}"></s:param>
                    <s:param name="viewmenu" value="byPurchaseOrder"></s:param>
                    <s:param name="viewsubmenu" value="${actionBean.searchSubmenu}"></s:param>

                 <img src="images/view.gif" />
                </s:link>
            </d:column>
        </d:table></td></tr>
    </table>

    </c:if>
<c:if test="${actionBean.searchSubmenu eq 'poNumber'}">
    <table class="t" id="purchaseOrdertable" width="86%"><tr><td>  <!--print item in table format-->
            <d:table name="purchaseOrderlst" id="purchase" pagesize="10" class="disp" requestURI="/Search.action?search">
                <d:column property="vendor.name" title="Vendor Name"/>
                <d:column property="vendor.productSupplied" title="Product Supplied"/>
                <d:column property="purchaseOrderNo" title="Purchase Order No"/>
                <d:column property="createDate" title="Purchase Order Date"  format="{0,date,yyyy-MM-dd}" sortable="false"/>
                <d:column property="status" title="Status"/>
                <d:column title="Item Name">
                    <table>
                        <c:forEach items="${purchase.purchasedetailarray}" var="purchaseloop" varStatus="loop" >
                            <tr>  <td>${purchaseloop.item.name}</td></tr>
                        </c:forEach>
                    </table>     </d:column>
                <d:column title="Ordered Qty">
                    <table>
                        <c:forEach items="${purchase.purchasedetailarray}" var="purchaseloop1" varStatus="loop" >
                            <tr>  <td>${purchaseloop1.orderedQty} </td> </tr>
                        </c:forEach>  </table>
                </d:column>
                <d:column title="Amount">
                    <table>
                        <c:forEach items="${purchase.purchasedetailarray}" var="purchaseloop2" varStatus="loop" >
                            <tr>  <td>${purchaseloop2.rate * purchaseloop2.orderedQty}</td></tr>
                        </c:forEach></table> </d:column>

                <d:column title="View" class="delete" >
                    <s:link beanclass="com.erp.action.SearchActionBean" event="print" >
                        <s:param name="id" value="${purchase.id}"></s:param>
                        <s:param name="hdnvalue" value="testpurchase"></s:param>
                        <s:param name="name" value="${purchase.purchaseOrderNo}"></s:param>
                        <s:param name="viewmenu" value="byPurchaseOrder"></s:param>
                        <s:param name="viewsubmenu" value="${actionBean.searchSubmenu}"></s:param>

                     <img src="images/view.gif" />
                    </s:link>
                </d:column>
            </d:table></td></tr>
        </table>

    </c:if>
<c:if test="${actionBean.searchSubmenu eq 'poVendorId'}">
    <table class="t" id="purchaseOrdertable" width="86%"><tr><td>  <!--print item in table format-->
        <d:table name="purchaseOrderlst" id="purchase" pagesize="10" class="disp" requestURI="/Search.action?search">
            <d:column property="vendor.name" title="Vendor Name"/>
            <d:column property="vendor.productSupplied" title="Product Supplied"/>
            <d:column property="purchaseOrderNo" title="Purchase Order No"/>
            <d:column property="createDate" title="Purchase Order Date"  format="{0,date,yyyy-MM-dd}" sortable="false"/>
            <d:column property="status" title="Status"/>
            <d:column title="Item Name">
                <table>
                    <c:forEach items="${purchase.purchasedetailarray}" var="purchaseloop" varStatus="loop" >
                        <tr>  <td>${purchaseloop.item.name}</td></tr>
                    </c:forEach>
                </table>     </d:column>
            <d:column title="Ordered Qty">
                <table>
                    <c:forEach items="${purchase.purchasedetailarray}" var="purchaseloop1" varStatus="loop" >
                        <tr>  <td>${purchaseloop1.orderedQty} </td> </tr>
                    </c:forEach>  </table>
            </d:column>
            <d:column title="Amount">
                <table>
                    <c:forEach items="${purchase.purchasedetailarray}" var="purchaseloop2" varStatus="loop" >
                        <tr>  <td>${purchaseloop2.rate * purchaseloop2.orderedQty}</td></tr>
                    </c:forEach></table> </d:column>

            <d:column title="View" class="delete" >
                <s:link beanclass="com.erp.action.SearchActionBean" event="print" >
                    <s:param name="id" value="${purchase.id}"></s:param>
                    <s:param name="hdnvalue" value="testpurchase"></s:param>
                    <s:param name="name" value="${purchase.vendor.vendorCode}"></s:param>
                    <%--<s:param name="searchMenu" value="byPurchaseOrder"></s:param>--%>
                    <%--<s:param name="searchSubmenu" value="poVendorId"></s:param>--%>
                     <s:param name="viewmenu" value="byPurchaseOrder"></s:param>
                    <s:param name="viewsubmenu" value="${actionBean.searchSubmenu}"></s:param>

                    <img src="images/view.gif" />
                </s:link>
            </d:column>
        </d:table></td></tr>
    </table>

    </c:if>
<c:if test="${actionBean.searchSubmenu eq 'poVendorName'}">
    <table class="t" id="purchaseOrdertable" width="86%"><tr><td>  <!--print item in table format-->
        <d:table name="purchaseOrderlst" id="purchase" pagesize="10" class="disp" requestURI="/Search.action?search">
            <d:column property="vendor.vendorCode" title="Vendor Code"/>
            <d:column property="vendor.productSupplied" title="Product Supplied"/>
            <d:column property="purchaseOrderNo" title="Purchase Order No"/>
            <d:column property="createDate" title="Purchase Order Date"  format="{0,date,yyyy-MM-dd}" sortable="false"/>
            <d:column property="status" title="Status"/>
            <d:column title="Item Name">
                <table>
                    <c:forEach items="${purchase.purchasedetailarray}" var="purchaseloop" varStatus="loop" >
                        <tr>  <td>${purchaseloop.item.name}</td></tr>
                    </c:forEach>
                </table>     </d:column>
            <d:column title="Ordered Qty">
                <table>
                    <c:forEach items="${purchase.purchasedetailarray}" var="purchaseloop1" varStatus="loop" >
                        <tr>  <td>${purchaseloop1.orderedQty} </td> </tr>
                    </c:forEach>  </table>
            </d:column>
            <d:column title="Amount">
                <table>
                    <c:forEach items="${purchase.purchasedetailarray}" var="purchaseloop2" varStatus="loop" >
                        <tr>  <td>${purchaseloop2.rate * purchaseloop2.orderedQty}</td></tr>
                    </c:forEach></table> </d:column>

            <d:column title="View" class="delete" >
                <s:link beanclass="com.erp.action.SearchActionBean" event="print" >
                    <s:param name="id" value="${purchase.id}"></s:param>
                    <s:param name="hdnvalue" value="testpurchase"></s:param>
                    <s:param name="name" value="${purchase.vendor.name}"></s:param>
                 
                     <s:param name="viewmenu" value="byPurchaseOrder"></s:param>
                    <s:param name="viewsubmenu" value="${actionBean.searchSubmenu}"></s:param>
                    <img src="images/view.gif" />
                </s:link>
            </d:column>
        </d:table></td></tr>
    </table>

    </c:if>
</c:if>
<c:if test="${actionBean.itemlst!=null}">
    <table class="t" id="itemtable" width="86%"><tr><td>  <!--print item in table format-->
        <d:table name="itemlst" id="item1" pagesize="6" class="disp" requestURI="/Search.action?">
            <d:column property="itemCode" title="Item Code"/>
            <d:column property="name" title="Item Name"  />
            <d:column property="uom.name" title="UOM" />
            <d:column property="section.name" title="Section" />
        </d:table></td></tr>
    </table>
</c:if>
<c:if test="${actionBean.vendorlst!=null}">
    <table class="t" id="vendortable" width="86%"><tr><td>
        <d:table name="vendorlst" id="vendor1" pagesize="10" class="disp" requestURI="/Search.action?">
            <d:column property="name" title="Vendor Name"/>
            <d:column property="address" title="Vendor Address"  />
            <d:column property="emailId" title="Email Id" />
            <d:column property="phoneNo" title="Phone Number" />
            <d:column property="productSupplied" title="Product Supplied" />
        </d:table></td></tr></table>
</c:if>
<c:if test="${actionBean.storeissuelst!=null}">
<c:if test="${actionBean.searchSubmenu eq 'siNumber'}">
    <table class="t" id="SItable" width="86%"><tr><td>
        <d:table name="storeissuelst" id="storeissue" pagesize="10" class="disp" requestURI="/Search.action?autoStoreIssue">
            <d:column property="id" title="Store Issue No"/>
            <d:column title="Item Name">
                <table>
                    <c:forEach items="${storeissue.storeissuedetailarray}" var="loopstore" varStatus="loop" >
                        <tr>  <td>${loopstore.item.name}</td></tr>
                    </c:forEach>
                </table>     </d:column>
            <d:column title="Required Qty">
                <table>
                    <c:forEach items="${storeissue.requisition.requisitiondetailarray}" var="requisitionloop" varStatus="loop" >
                        <tr>  <td>${requisitionloop.requiredQty} </td> </tr>
                    </c:forEach>  </table>
            </d:column>
            <d:column title="Issue Qty">
                <table>
                    <c:forEach items="${storeissue.storeissuedetailarray}" var="loopstore1" varStatus="loop" >
                        <tr>  <td>${loopstore1.issueQty}</td></tr>
                    </c:forEach></table> </d:column>

            <d:column property="issueDate" title="Issue Date"    format="{0,date,yyyy-MM-dd}" sortable="false"/>
            <d:column title="View" class="delete" style="valign:middle">
                <s:link beanclass="com.erp.action.SearchActionBean" event="print" >
                    <s:param name="id" value="${storeissue.id}" ></s:param>
                    <s:param name="viewsubmenu" value="siNumber"></s:param>
                    <s:param name="viewmenu" value="${actionBean.searchMenu}"></s:param>
                    <s:param name="hdnvalue" value="test"></s:param>

                    <s:param name="name" value="${storeissue.id}"></s:param>
                    <img src="images/view.gif" />
                </s:link>
            </d:column>
        </d:table></td></tr></table>
</c:if>
<c:if test="${actionBean.searchSubmenu eq 'siRequisitionId'}">
    <table class="t" id="SItable" width="86%"><tr><td>
        <d:table name="storeissuelst" id="storeissue" pagesize="10" class="disp" requestURI="/Search.action?autoStoreIssue">
            <d:column property="id" title="Store Issue No"/>
            <d:column property="requisition.nameOfUser" title="Name Of User"/>
            <d:column title="Item name">
                <table>
                    <c:forEach items="${storeissue.storeissuedetailarray}" var="loopstore" varStatus="loop" >
                        <tr>  <td>${loopstore.item.name}</td></tr>
                    </c:forEach>
                </table>     </d:column>
            <d:column title="Required Qty">
                <table>
                    <c:forEach items="${storeissue.requisition.requisitiondetailarray}" var="requisitionloop" varStatus="loop" >
                        <tr>  <td>${requisitionloop.requiredQty} </td> </tr>
                    </c:forEach>  </table>
            </d:column>
            <d:column title="Issue Qty">
                <table>
                    <c:forEach items="${storeissue.storeissuedetailarray}" var="loopstore1" varStatus="loop" >
                        <tr>  <td>${loopstore1.issueQty}</td></tr>
                    </c:forEach></table> </d:column>

            <d:column property="requisition.requisitionDate" title="Requisition Date"    format="{0,date,yyyy-MM-dd}" sortable="false"/>
            <d:column title="View" class="delete" style="valign:middle">
                <s:link beanclass="com.erp.action.SearchActionBean" event="print" >
                    <s:param name="id" value="${storeissue.id}" ></s:param>
                    <s:param name="hdnvalue" value="test"></s:param>
                    <s:param name="viewsubmenu" value="siRequisitionId"></s:param>
                    <s:param name="viewmenu" value="${actionBean.searchMenu}"></s:param>
                    <s:param name="name" value="${storeissue.requisition.id}"></s:param>
                    <img src="images/view.gif" />
                </s:link>
            </d:column>
        </d:table></td></tr></table>
</c:if>
<c:if test="${actionBean.searchSubmenu eq 'siDate'}">
    <table class="t" id="SItable" width="86%"><tr><td>
        <d:table name="storeissuelst" id="storeissue" pagesize="10" class="disp" requestURI="/Search.action?autoStoreIssue">
            <d:column property="id" title="Store Issue No"/>
            <d:column property="requisition.nameOfUser" title="Name Of User"/>
            <d:column title="Item name">
                <table>
                    <c:forEach items="${storeissue.storeissuedetailarray}" var="loopstore" varStatus="loop" >
                        <tr>  <td>${loopstore.item.name}</td></tr>
                    </c:forEach>
                </table>     </d:column>
            <d:column title="Required Qty">
                <table>
                    <c:forEach items="${storeissue.requisition.requisitiondetailarray}" var="requisitionloop" varStatus="loop" >
                        <tr>  <td>${requisitionloop.requiredQty} </td> </tr>
                    </c:forEach>  </table>
            </d:column>
            <d:column title="Issue Qty">
                <table>
                    <c:forEach items="${storeissue.storeissuedetailarray}" var="loopstore1" varStatus="loop" >
                        <tr>  <td>${loopstore1.issueQty}</td></tr>
                    </c:forEach></table> </d:column>

            <d:column property="requisition.requisitionDate" title="Requisition Date"    format="{0,date,yyyy-MM-dd}" sortable="false"/>
            <d:column title="View" class="delete" style="valign:middle">
                <s:link beanclass="com.erp.action.SearchActionBean" event="print" >
                    <s:param name="id" value="${storeissue.id}" ></s:param>
                    <s:param name="hdnvalue" value="test"></s:param>
                    <s:param name="viewsubmenu" value="siDate"></s:param>
                    <s:param name="viewmenu" value="${actionBean.searchMenu}"></s:param>
                       <s:param name="date" value="${actionBean.date}"></s:param>
                    <img src="images/view.gif" />
                </s:link>
            </d:column>
        </d:table></td></tr></table>
</c:if>
</c:if>
</s:form>
</s:layout-component>
</s:layout-render>
