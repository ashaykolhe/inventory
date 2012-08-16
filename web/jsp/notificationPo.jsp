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
      <link rel="stylesheet" type="text/css" href="/css/style1.css"/>
             <script type="text/javascript">
                 $(document).ready(function(){
                     var temp=0;
                     var tempvalue=null;
                      var loop1=$('#ti').html();
                        var lst=new Array();
                      for(var l=1;l<=loop1;l++)
                     {

                          var drop="#drop"+l;
//                         var v="table#tablecss tr #id"+i+"";

                            var v=tempvalue;
                          tempvalue=$("table#tablecss tr td:last-child #id"+l+"").html();


                         if(temp == 0)
                         {

                             $(drop).show();
                              $('#id'+l).hide();
                             temp=1;
                         }
                         if(temp == 1)
                         {
                            if(tempvalue == v)
                            {
                               $(drop).hide();
                                $('#id'+l).hide();
                            }
                             else
                            {
                                 temp=0;
                                 $('#id'+l).hide();
                            }
                         }


                    }
                     $('#submitbtn').click(function(){
                        /*var loop1=$('#total').html();
                         alert(loop1);*/

                         lst[0]="blank"+",";
                        var loop2=$('#ti').html();
                    for(var i=1;i<=loop2;i++)
                     {


                            var btndropdown="#drop"+i+" option:selected";

                            var dropdownname=$(btndropdown).text().trim().toString();
                         if(dropdownname == "" || dropdownname == null)
                         {

                         }
                         else
                         {

                          var n=$('#drop'+i).val();

                         lst[i]=n;

                         $('#hidden'+i).val(lst[i]);

                         }

                     }


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
    <s:form beanclass="com.erp.action.PoRequestActionBean">        <br>
        <table class="heading_table">

           <tr><td align="left" class="pageheading" valign="top">
             <div class="sub_heading" >Notification</div>
           </td></tr>
           </table>
            <table class="second_table"  >
           <tr><td>
           <d:table name="lstfortotalorderqty" varTotals="t"   defaultsort="5" class="disp" requestURI="/PoRequest.action" decorator="tdecorator" id="tablecss">
            <c:set var="list_for_ordered_qty" value="${lstfortotalorderqty}" scope="request"/>

            <d:column title="Name Of Requester" property="user" group="2"/>
            <d:column title="Requested Date" property="create_date"  format="{0,date,yyyy-MM-dd}" sortable="false"/>
            <d:column title="Location" property="location"/>
            <d:column title="Department" property="department"/>
            <d:column title="Item Name" property="name" group="1"/>
            <d:column title="Requested Qty" property="ordered_qty" group="3" total="true"/>
            <d:column title="Vendors" group="2">
                <s:select name="list" multiple="true" class="dropdown"  id="drop${tablecss_rowNum}" style="height :50px">
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
                <div id="id${tablecss_rowNum}">${tablecss.name}</div>

                <s:hidden name="listOfEmail[${tablecss_rowNum}]" id="hidden${tablecss_rowNum}"/>
            </d:column>
        </d:table>
          <div style="display:none;" class="tc" id="ti">${tablecss_rowNum}</div>
     <c:if test="${purchasereqlst != null}">
          <s:submit name="trylst" value="Submit" id="submitbtn"/>
     </c:if>
    </td></tr></table>
 </s:form></s:layout-component></s:layout-render>
