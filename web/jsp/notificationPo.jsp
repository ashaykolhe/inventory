<%@ page import="org.displaytag.decorator.TotalTableDecorator" %>
<%@ page import="org.displaytag.tags.TableTagParameters" %>
<%--
Created by IntelliJ IDEA.
User: Minal
Date: Feb 17, 2012
Time: 3:48:01 PM
To change this template use File | Settings | File Templates.
--%>
    <%
        org.displaytag.decorator.TotalTableDecorator tdeco = new org.displaytag.decorator.TotalTableDecorator();
        tdeco.setTotalLabel("total");
        pageContext.getRequest().setAttribute("tdecorator", tdeco);
      
      %>
     
    <%@ include file="/includes/_taglibInclude.jsp"%>
    <link rel="stylesheet" href="css/general.css" type="text/css" media="screen" />
             <script type="text/javascript">
                 $(document).ready(function(){

                     var r=$('table#tablecss tr.total:last-child').html();
                     alert(r);
                 /*    var length=$("#family #tabletr").length;
               var nextlength=$('#total').html();
             if(length>nextlength)
             length=length;
             else
             length=nextlength;
             for(var i=1;i<=length;i++){
                 var t=$("table .disp .total").html();
//                     alert(t);
//                alert($('#star'+i).html());
             }*/
                     $('#submitbtn').click(function(){
                              var dropdownname=$("#drop option:selected").text().trim().toString();
                         alert(dropdownname);
                     });
                 });
             </script>
    <s:useActionBean beanclass="com.erp.action.PoRequestActionBean" var="listofporeq" event="notificationPoLink"></s:useActionBean>
            <%
               request.setAttribute("purchasereqlst",listofporeq.getPoReqlst());
               request.setAttribute("itemlst",listofporeq.getItemidlst());
               request.setAttribute("lstfortotalorderqty",listofporeq.getListforitemorderqty());
                request.setAttribute("vendorlst",listofporeq.getVendorlst());
            %>
        
    <s:layout-render name="/layout/_base.jsp">
    <s:layout-component name="body">
    <s:form beanclass="com.erp.action.PoRequestActionBean">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" >
    <tr valign="top"><td >&nbsp;
    </td></tr>
    <tr><td align="left" class="pageheading" valign="top">
    Purchase Order Request > notification
    </td></tr>
    <tr valign="top"><td align="center"><div  class="msg"><s:messages/></div>
    </td></tr>
    </table>

    <table width="100%"><tr><td>
      <%--<d:table name="purchasereqlst" id="poreq" pagesize="10" class="disp" requestURI="/PoRequest.action?notificationPoLink">
   <c:set var="po" value="${poreq}"/>
  <c:set var="nestedName" value="${poreq.purchasereqdetailarray}" scope="request" />
  <c:set var="nesting" value="${lstfortotalorderqty}" scope="request" />

      <d:column property="user" title="Name Of Requester"/>
      <d:column property="createDate" title="Date"   format="{0,date,yyyy-MM-dd}" sortable="false"/>
    <d:column property="department" title="Department"/>
    <d:column property="location" title="Location"/>
      <d:column title="nesting">
      --%>
          <d:table name="lstfortotalorderqty" varTotals="t"   defaultsort="5" class="disp" requestURI="/PoRequest.action" decorator="tdecorator" id="tablecss">
          <c:set var="list_for_ordered_qty" value="${lstfortotalorderqty}" scope="request"/>
          <d:column title="Name Of Requester" property="user" group="2"/>
          <d:column title="Requested Date" property="create_date"  format="{0,date,yyyy-MM-dd}" sortable="false"/>
          <d:column title="Location" property="location"/>
          <d:column title="Department" property="department"/>
          <d:column title="Item Name" property="name" group="1"/>
          <d:column title="Requested Qty" property="ordered_qty" group="3" total="true"/>
          <d:column title="Vendors" group="2">
                  <s:select name="list${tablecss_rowNum}" class="dropdown" id="drop" style="height :50px" accesskey="true"  multiple="true">
                  <c:forEach var="v" items="${vendorlst}" varStatus="loop">
                      <c:choose>
                          <c:when test="${fn:contains(v.productSupplied,tablecss.name )}">

                               <s:option value="${v.emailId}">${v.name}</s:option>
                          </c:when>
                          <c:otherwise>

                          </c:otherwise>

                      </c:choose>

                  </c:forEach>
                </s:select>
             
              
          </d:column>
          </d:table>
          <s:button name="submit" value="Submit" id="submitbtn"/>
<%--<d:column title="Email" group="2">
                  <c:forEach var="v" items="${vendorlst}" varStatus="loop">
                      <c:choose>
                          <c:when test="${v.productSupplied == tablecss.name}">
                              <s:link beanclass="com.erp.action.PoRequestActionBean" event="sendemail">
                                  <s:param name="emailid" value="${v.emailId}"/>
                                  <img src="images/email_notifications.gif"/>
                              </s:link>
                              <br>  <br>
                          </c:when>
                          <c:otherwise>
                          </c:otherwise>
                  </c:choose>
        </c:forEach>
      </d:column>--%>



         <%-- <d:column title="select vendor" group="2">
                
               <s:select name="emailid" id="vendornameneamil" size="4" multiple="true" class="textbox">
                    <s:option value="email">select multiple</s:option>                   
                    <s:option value="email">1</s:option>
                    <s:option value="email">2</s:option>
                    <s:option value="email">3</s:option>
               </s:select>
           </d:column>--%>
         <%--  <d:column title="Send Mail" group="2">
            <table width="95%" border="0" cellspacing="0" cellpadding="0"  align="left" id="family">
            <tr id="tabletr">  
            <td>
            <div align="left" style="margin-left:4px;">
            <div align="left">
            <div style="display:none;" class="star" id="star${tablecss_rowNum}">${tablecss.vendorname}</div>
            <div style="display:none;" class="rate"></div>
            <s:hidden name="name[${tablecss_rowNum}]" value="${tavlecss.email_id}"/>
            <div style="display:none;" id="total">${tablecss_rowNum}</div>
            </div></div></td>
            </tr>
            </table>
              <s:link beanclass="com.erp.action.PoRequestActionBean" event="sendemail">
                  <s:param name="emailid" value="${tablecss.email_id}"/>
                                      <img src="images/email_notifications.gif"/>
              </s:link>
           </d:column>--%>

          <%--<d:footer>
            <tr>
                <td></td>
                <td></td>
                <td><c:out value="${t.column3}" /></td>
            <tr>
          </d:footer>--%>

   <%--   </d:column>
      <d:column title="Related fields">
                 <d:table name="nestedName" varTotals="totals"   id="i">



                     <d:column property="item.name" title="name" />
          <d:column value="${poreq.user}" title="User" />
                  <d:column property="orderedQty" title="orderedQty" total="true"/>
                     <d:footer>
    <tr>
      <td></td>
      <td></td>
      <td>total</td>
      <td><c:out value="${totals.column4}" /></td>
    <tr>
  </d:footer>
      <d:column value="${poreq.createDate}" title="Date"   format="{0,date,yyyy-MM-dd}" sortable="false"/>
    <d:column value="${poreq.department}" title="Department"/>
    <d:column value="${poreq.location}" title="Location"/>
               </d:table>

       </d:column>
     </d:table>
--%>
  <%--<d:table name="purchasereqlst" id="poreq" pagesize="10" class="disp" requestURI="/PoRequest.action?notificationPoLink">
   <c:set var="po" value="${poreq}"/>
  <c:set var="nestedName" value="${poreq.purchasereqdetailarray}" scope="request" />
      <d:column property="user" title="Name Of Requester"/>
      <d:column property="createDate" title="Date"   format="{0,date,yyyy-MM-dd}" sortable="false"/>
    <d:column property="department" title="Department"/>
    <d:column property="location" title="Location"/>
      <d:column title="Related fields">
                 <d:table name="nestedName"   id="i">

                       <d:column property="id" title="Id" />
                     <d:column value="${poreq.user}" title="User" sortable="true" />


                       <d:column property="item.name" title="name" />



                       <d:column property="orderedQty" title="orderedQty" />
      <d:column value="${poreq.createDate}" title="Date"   format="{0,date,yyyy-MM-dd}" sortable="false"/>
    <d:column value="${poreq.department}" title="Department"/>
    <d:column value="${poreq.location}" title="Location"/>
               </d:table>

       </d:column>
     </d:table>--%>




    <%--<d:column title="Ordered Qty">
      <table>
                    <c:forEach items="${poreq.purchasereqdetailarray}" var="qty" varStatus="loop" >
                        <tr>
                            <td>${qty.orderedQty}</td></tr>
                    </c:forEach>
                </table>


     </d:column>
     <d:column title="Item Name" property="po" >
      <table>
                    <c:forEach items="${poreq.purchasereqdetailarray}" var="qty" varStatus="loop" >
                        <tr>
                            <td>${qty.item.name}</td></tr>
                    </c:forEach>
                </table>


     </d:column>
--%>



    </td></tr></table>



<%--<table width="100%"><tr><td>
  <d:table name="purchasereqlst" id="poreq" pagesize="10" class="disp" requestURI="/PoRequest.action?notificationPoLink">
    <d:column property="user" title="Name Of Requester"/>
      <d:column property="createDate" title="Date"   format="{0,date,yyyy-MM-dd}" sortable="false"/>
    <d:column property="department" title="Department"/>
    <d:column property="location" title="Location"/>
    <d:column property="approvePO" title="ApprovePO"/>

    <d:column title="Ordered Qty">
      <table>
                    <c:forEach items="${poreq.purchasereqdetailarray}" var="qty" varStatus="loop" >
                        <tr>
                            <td>${qty.orderedQty}</td></tr>
                    </c:forEach>
                </table>
</d:column>
     <d:column title="Item Name" property="po" >
      --%><%--<table>
                    <c:forEach items="${poreq.purchasereqdetailarray}" var="qty" varStatus="loop" >
                        <tr>
                            <td>${qty.item.name}</td></tr>
                    </c:forEach>
                </table>
--%><%--

     </d:column>

    </d:table>


    </td></tr></table>--%>

    </s:form></s:layout-component></s:layout-render>
