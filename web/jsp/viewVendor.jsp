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
            <s:layout-component name="left-menu">

                 <ul>
                          <li>&nbsp;</li>
                      <li class="left_menu_heading">Vendor</li>
                     <li style="margin-top:35px"><s:link beanclass="com.erp.action.VendorActionBean" event="addVendorLink">Add</s:link></li>
                                <li><s:link beanclass="com.erp.action.VendorActionBean" event="UpdateVendorLink">Update</s:link></li>
                                <li><s:link beanclass="com.erp.action.VendorActionBean" event="deleteVendorLink">Delete</s:link></li>
                                <li><s:link beanclass="com.erp.action.VendorActionBean" event="viewVendor">View</s:link></li>
                  </ul>

         </s:layout-component>
    <s:layout-component name="body">
    <s:form beanclass="com.erp.action.VendorActionBean">
     <br>
    <table class="heading_table">

    <tr><td align="left" class="pageheading" valign="top">
      <div class="sub_heading" >View Vendor</div>
    </td></tr>
         <%--   <tr valign="top"><td align="center"><div class="msg"><s:messages/></div>
            </td></tr>--%>
    </table>
    <table class="second_table"  >    <tr align="center">
        <td >
  <d:table name="vendorlst" id="vendor1" pagesize="10" class="disp" varTotals="totals" requestURI="/Vendor.action">

    <d:column value="${vendor1_rowNum}"  title="No" />


    <d:column property="name" title="Vendor Name"/>
    <d:column property="address" title="Vendor Address"  />
    <d:column property="emailId" title="Email Id" />
    <d:column property="phoneNo" title="Phone Number" />


    <d:column property="productSupplied" title="Product Supplied" />



    <d:column title="Rating" class="delete">
        <table width="95%" border="0" cellspacing="0" cellpadding="0"  align="left" id="family">

    <tr id="tabletr">


           

    <td >
    <div align="left" style="margin-left:4px;">
    <div align="left">

       <div  class="star" id="star${vendor1_rowNum}">${vendor1.vendorRate}</div>

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


    </s:form></s:layout-component>
     <s:layout-component name="footer">
             <div  style="border-top:10px solid #ccccff;">&nbsp;</div>

         </s:layout-component>
    </s:layout-render>