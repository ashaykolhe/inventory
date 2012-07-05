    <%--
    Created by IntelliJ IDEA.
    User: Minal
    Date: Feb 17, 2012
    Time: 3:48:01 PM
    To change this template use File | Settings | File Templates.
    --%>
    <%@ include file="/includes/_taglibInclude.jsp" %>
    <link rel="stylesheet" href="css/general.css" type="text/css" media="screen" />
    <script type="text/javascript">

    function show_confirm()
    {
    var r=confirm("Are you sure, you want to delete selected record.");
    if (r)
    {
    return true;
    }
    else
    {
    return false;
    }
    return false;
    }


         $(document).ready(function(){
             var length=$("#family #tabletr").length;

                   var nextlength=$('#total').html();
             
             if(length>nextlength)
             length=length;
             else
             length=nextlength;
             for(var i=1;i<=length;i++){


             $('#star'+i).raty({
               cancel    : true,
               score     : $('#star'+i).html(),
               mouseover : function(score, evt) {
                 var target = $('#mouseover-target');

                 if (score === null) {
                   target.html(0);
                 } else if (score === undefined) {
                   target.html(0);
                 } else {
                 $('.rate').html(score);
                   target.html(score);


                 }
               }

             });
             }
               $('.star').click(function(){
                   var vendorid=$(this).parents("div").children("input").attr("value");

                    var rt=$('.rate').html();


     $.post("Vendor.action?storeVendorRate", {rate:rt,id:vendorid}, function (data) {
                alert("Rate Set is :"+data);
     });
               });

         });



    </script>
    <s:useActionBean beanclass="com.erp.action.VendorActionBean" var="listofvendor" event="deleteVendorLink"></s:useActionBean>
    <% request.setAttribute("vendorlst",listofvendor.getVendorlst());

    %>
    <s:layout-render name="/layout/_base.jsp">
    <s:layout-component name="body">
    <s:form beanclass="com.erp.action.VendorActionBean">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" >
    <tr valign="top"><td >&nbsp;
    </td></tr>
    <tr><td align="left" class="pageheading" valign="top">
    Vendor Management > View Vendor
    </td></tr>
    <tr valign="top"><td align="center"><div class="msg"><s:messages/></div>
    </td></tr>
    </table>
    <table width="100%"><tr><td>
<<<<<<< HEAD
    <d:table name="vendorlst" id="vendor1" pagesize="10" class="disp" requestURI="/Vendor.action">
=======

       
    <d:table name="vendorlst" id="vendor1" pagesize="10" class="disp" varTotals="totals" requestURI="/Vendor.action">
    <d:column value="${vendor1_rowNum}"  title="No" />

>>>>>>> 388cb63d99a6263a5bdaa898f400ff491601891f
    <d:column property="name" title="Vendor Name"/>
    <d:column property="address" title="Vendor Address"  />
    <d:column property="emailId" title="Email Id" />
    <d:column property="phoneNo" title="Phone Number" />
<<<<<<< HEAD
    <d:column property="productSupplied" title="Product Supplied" />

    <d:column title="Rating" class="delete">
        <!-- Free Rate Hosting By Ratingcode.com -->
        <table cellpadding="0" cellspacing="0" width="133"><tr><td><iframe src="http://www.ratingcode.com/show.php?id=134122510388&st=2&bg=663399" border="0" width="115" height="37" marginwidth="0" marginheight="0" hspace="0" vspace="0" frameborder="0" scrolling="no" bgcolor=663399></iframe></td><td width="18" align="center" valign="top" style="padding-top:5px"></td></tr></table>
        <!-- Free Rate Hosting By Ratingcode.com -->
   


    </d:column>

    </d:table></td></tr></table>
=======



         <c:choose>
             <c:when test="${vendor1.name eq 'milind'}">
                 <font color="red">
                 <d:column property="productSupplied" title="Product Supplied" />
                     </font>
             </c:when>
             <c:otherwise>
                <d:column property="productSupplied" title="Product Supplied" /> 
             </c:otherwise>
         </c:choose>
    <d:column title="Rating" class="delete">
        <table width="95%" border="0" cellspacing="0" cellpadding="0"  align="left" id="family">

    <tr id="tabletr">


           

    <td >
    <div align="left" style="margin-left:4px;">
    <div align="left">

       <div class="star" id="star${vendor1_rowNum}">${vendor1.vendorRate}</div>

        <div style="display:none;" class="rate"></div>
        <s:hidden name="name[${vendor1_rowNum}]" value="${vendor1.id}"/>
        <%--<s:hidden name="name[${totals.column1}]" value="${totals.column1}"/>--%>
        <div style="display:none;" id="total">${vendor1_rowNum}</div>

    </div></div></td>


    </tr>

    </table>
    </d:column>
    </d:table>



    </td></tr></table>
>>>>>>> 388cb63d99a6263a5bdaa898f400ff491601891f

    </s:form></s:layout-component></s:layout-render>