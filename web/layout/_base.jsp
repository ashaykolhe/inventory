<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.erp.security.MyActionBeanContext" %>
<%@ page import="com.erp.pojo.User" %>
<%@ page import="com.erp.guice.InjectorFactory" %>
<%@ page import="com.google.inject.Injector" %>
<%@ page import="com.erp.dao.UserDao" %>
<script src="javascript/jquery.js" type="text/javascript"></script>
<%@ include file="/includes/_taglibInclude.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Enterpride-Stores</title>
    <script type="text/javascript">
        function MakeArrayday(size) {
            this.length = size;
            for(var i = 1; i <= size; i++) {
                this[i] = "";
            }
            return this;
        }
        function MakeArraymonth(size) {
            this.length = size;
            for(var i = 1; i <= size; i++) {
                this[i] = "";
            }
            return this;
        }
        function funClock() {
            var runTime = new Date();
            var hours = runTime.getHours();
            var minutes = runTime.getMinutes();
            var seconds = runTime.getSeconds();
            var dn = "AM";

            if (hours >= 12) {

                dn = "PM";
                hours = hours - 12;
            }
            if (hours == 0) {
                hours = 12;
            }
            if (minutes <= 9) {
                minutes = "0" + minutes;
            }
            if (seconds <= 9) {
                seconds = "0" + seconds;
            }
            movingtime = ""+ hours + ":" + minutes + ":" + seconds + " " + dn + "";

            document.getElementById("clock").innerHTML = movingtime;
            setTimeout("funClock()", 1000);
        }
        setTimeout("funClock()", 100);
    </script>
</head>
<body>
<s:useActionBean id="securityBean" beanclass="com.erp.action.GrnActionBean"/>
<s:layout-definition>
    <table width="100%" height="100%" border="0" align="center"  style="background-color:#f7f7fa;">
     <%
                        Long iduser=(Long)request.getSession().getAttribute("user");
                        String Name= InjectorFactory.getInjector().getInstance(UserDao.class).findById(iduser).getUsername();

                    %>
        <tr >  <td colspan="2" height="27px"><table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td width="30%"><img src="images/enterpride_banner.jpg"  style="cursor:pointer;" /></td>
            <td  align="right" style="vertical-align:text-top;">   <s:layout-component name="header">
                <table width="100%" border="0" cellpadding="0" cellspacing="0" ><tr valign="top"><td >  <div style="vertical-align:top;margin-top:-25px;">
               <div align="right" style="margin-right: 5px;color:black;font-size:10px;font-family:sans-serif; font-weight: bold;vertical-align:text-top;">WELCOME  <%= Name.toUpperCase() %>   <s:link beanclass="com.erp.action.LoginActionBean" event="logout" class="links" style="font-size:11px;">(Logout)</s:link></a></div>
                <div align="right" style="margin-right:5px;color:black;margin-bottom:10px;" class="labels">
                    <%	Date date = Calendar.getInstance().getTime();
                        DateFormat formatter = new SimpleDateFormat("dd MMMM, yyyy");
                    %>
                    <%= formatter.format(date) %>
                    <input type="hidden" name="inDate1" id="inDate1" value="<%= formatter.format(date) %>"/>
                    <span id="clock" style="position:relative;"></span>
                </div></div> </td></tr></table>   </s:layout-component>
            </td>
        </tr></table></td></tr>
        <tr style=" background-color:#396a9c;">
     <%--<tr >--%>
            <td height="22" colspan="2"> <s:layout-component name="menu">
                <div class="menu">
                                                
                    <%
                        Long id=(Long)request.getSession().getAttribute("user");
                        String role= InjectorFactory.getInjector().getInstance(UserDao.class).findById(id).getRole().getName();
                        if(role.toLowerCase().contains("account")){
                    %>


                    <ul>
                        <li><s:link beanclass="com.erp.action.GrnActionBean" event="forAccountant">Pending GRNS</s:link></li>
                        <li><s:link beanclass="com.erp.action.GrnActionBean" event="ApprovedGrnByAccountant">Approved GRNs</s:link></li>
                    </ul>
                     <%}else if(role.toLowerCase().contains("vp")){%>
                    <ul>
                            <li><s:link beanclass="com.erp.action.PurchaseOrderActionBean" event="approveVp">Approve PO</s:link></li>

                    </ul>

                    <%}else{%>

                    <ul>
                    </li>
                                <li><s:link beanclass="com.erp.action.PoRequestActionBean" event="addPOReqLink">Purchase Request</s:link>

                            <!--[if lte IE 6]>
                            <a href="../boxes/index.html">BOXES
                            <table><tr><td>
                            <![endif]-->

                          <%--  <ul>
                                <% if(role.toLowerCase().contains("superadmin") || role.toLowerCase().contains("manager")){   %>
                                  <li><s:link beanclass="com.erp.action.PoRequestActionBean" event="notificationPoLink">Notification PO</s:link></li>
                               <%}%>
                                 <li><s:link beanclass="com.erp.action.PoRequestActionBean" event="addPOReqLink">Create</s:link></li>
                               <li><s:link beanclass="com.erp.action.PoRequestActionBean" event="approvePOLink">Approve PO</s:link></li>

                                   

                            </ul>--%>

                            <!--[if lte IE 6]>
                            </td></tr></table>
                            </a>
                            <![endif]-->

                        </li>
                        <li><s:link beanclass="com.erp.action.PurchaseOrderActionBean" event="addPOLink">Purchase Order</s:link>

                                                   <!--[if lte IE 6]>
                                                   <a href="../menu/index.html">DEMOS
                                                   <table><tr><td>
                                                   <![endif]-->

                                                 <%--  <ul>

                                                       <li><s:link beanclass="com.erp.action.PurchaseOrderActionBean" event="addPOLink">Create</s:link></li>
                                                       <li><s:link beanclass="com.erp.action.PurchaseOrderActionBean" event="generatePurchaseOrderLink">Generate</s:link></li>
                                                       <li><s:link beanclass="com.erp.action.PurchaseOrderActionBean" event="deletePOLink">Delete</s:link></li>

                                                       <% if(role.toLowerCase().contains("superadmin")){   %>
                                                   <li><s:link beanclass="com.erp.action.PurchaseOrderActionBean" event="approvePOLink">Approve PO(LM)</s:link></li>
                                              <li><s:link beanclass="com.erp.action.PurchaseOrderActionBean" event="approveVp">Approve PO(VP)</s:link></li>
                                           <%}%>
                                                <% if(role.toLowerCase().contains("manager")){   %>
                                                   <li><s:link beanclass="com.erp.action.PurchaseOrderActionBean" event="approvePOLink">Approve PO(LM)</s:link></li>

                                           <%}%>

                                                   </ul>--%>

                                                   <!--[if lte IE 6]>
                                                   </td></tr></table>
                                                   </a>
                                                   <![endif]-->

                                               </li>

                       <li><s:link beanclass="com.erp.action.ItemActionBean" event="pagedirect">Item</s:link></li>

                            <!--[if lte IE 6]>
                            </td></tr></table>
                            </a>
                            <![endif]-->


                        <li><s:link beanclass="com.erp.action.VendorActionBean" event="addVendorLink">Vendor</s:link>

                            <!--[if lte IE 6]>
                            <a href="../boxes/index.html">BOXES
                            <table><tr><td>
                            <![endif]-->



                          

                        </li>


                        <li><s:link beanclass="com.erp.action.GrnActionBean" event="addGrnLink">Stock</s:link>

                            <!--[if lte IE 6]>
                            <a href="index.html">MENUS
                            <table><tr><td>
                            <![endif]-->

                        <%--    <ul>
                                <li><a  href="#" >GRN &gt;</a>

                                    <!--[if lte IE 6]>
                                    <a class="sub" href="../menu/hover_click.html" title="Hover/click with no active/focus borders">HOVER/CLICK &gt;
                                    <table><tr><td>
                                    <![endif]-->

                                    <ul>
                                        <li><s:link beanclass="com.erp.action.GrnActionBean" event="addGrnLink">Create</s:link></li>
                                       --%><%-- <li><s:link beanclass="com.erp.action.GrnActionBean" event="updateGrnLink">Update</s:link></li>--%><%--
                                        <%if(role.toLowerCase().contains("manager")){%>
                                        <li><s:link beanclass="com.erp.action.GrnActionBean" event="verify">Pending GRNS</s:link></li>
                                          <li><s:link beanclass="com.erp.action.GrnActionBean" event="ApprovedGrnByManager">Approved GRNS</s:link></li>
                                        <%}%>
                                        <%if(role.toLowerCase().contains("superadmin")){%>
                                        <li><s:link beanclass="com.erp.action.GrnActionBean" event="verify">Pending GRNS(SM)</s:link></li>
                                         <li><s:link beanclass="com.erp.action.GrnActionBean" event="ApprovedGrnByManager">Approved GRNS(SM)</s:link></li>
                                        <li><s:link beanclass="com.erp.action.GrnActionBean" event="forAccountant">Pending GRNS(AM)</s:link></li>
                                         <li><s:link beanclass="com.erp.action.GrnActionBean" event="ApprovedGrnByAccountant">Approved GRNS(AM)</s:link></li>
                                        <%}%>


                                    </ul>

                                    <!--[if lte IE 6]>
                                    </td></tr></table>
                                    </a>
                                    <![endif]-->

                                </li>
                                <li><s:link beanclass="com.erp.action.RequisitionActionBean" event="addRequisitionLink">Material Requisition</s:link><ul>
                                  --%><%--  <li><s:link beanclass="com.erp.action.RequisitionActionBean" event="addRequisitionLink" title="Add Material Requisition">Add</s:link></li>--%><%--
                                    --%><%--<li><s:link beanclass="com.erp.action.RequisitionActionBean" event="updateRequisitionLink">Update</s:link></li>--%><%--

                                </ul></li>
                                <li><s:link beanclass="com.erp.action.StoreIssueActionBean" event="addStoreIssueLink">Issue</s:link>--%><%--<ul>
<li><s:link beanclass="com.erp.action.StoreIssueActionBean" event="addStoreIssueLink">Add</s:link></li>
<li><s:link beanclass="com.erp.action.StoreIssueActionBean" event="updateStoreIssueLink">Update</s:link></li>


</ul>--%><%--</li>

                            </ul>--%>

                            <!--[if lte IE 6]>
                            </td></tr></table>
                            </a>
                            <![endif]-->

                        </li>
                          <li><s:link beanclass="com.erp.action.ReportActionBean" event="ledgerLink">Ledgers</s:link></li>

                        <!--[if lte IE 6]>
                        <a href="../ie/index.html">EXPLORER
                        <table><tr><td>
                        <![endif]-->



                        <!--[if lte IE 6]>
                        </td></tr></table>
                        </a>
                        <![endif]-->
                           <li><s:link beanclass="com.erp.action.SearchActionBean" event="searchLink">Search</s:link></li>

                        <!--[if lte IE 6]>
                        <a href="../ie/index.html">EXPLORER
                        <table><tr><td>
                        <![endif]-->



                        <!--[if lte IE 6]>
                        </td></tr></table>
                        </a>
                        <![endif]-->

                        <li><s:link beanclass="com.erp.action.ReportActionBean" event="reportLink">Reports</s:link></li>

                        <!--[if lte IE 6]>
                        <a href="../mozilla/index.html">MOZILLA
                        <table><tr><td>
                        <![endif]-->



                        <!--[if lte IE 6]>
                        </td></tr></table>
                        </a>
                        <![endif]-->




                            <li><s:link beanclass="com.erp.action.CompanyActionBean" event="pre">Settings</s:link></li>


                         <%--  <li><a class="hide" href="#">Setting</a>

                            <!--[if lte IE 6]>
                            <a href="../layouts/index.html">LAYOUTS
                            <table><tr><td>
                            <![endif]-->

                            <ul>
                                 <li><a href="#">Setup</a>
                                    <ul>
                                        <li> <s:link beanclass="com.erp.action.CompanyActionBean" event="pre">Company Info</s:link></li>

                                    </ul>
                                 </li>

                                 <li><a  href="#">User </a>
                                    <ul>
                                        <li><s:link beanclass="com.erp.action.UserActionBean" event="addUserLink">Add</s:link></li>
                                        <li><s:link beanclass="com.erp.action.UserActionBean" event="updateUserLink">Update</s:link></li>
                                        <li><s:link beanclass="com.erp.action.UserActionBean" event="deleteUserLink">Delete</s:link></li>
                                        <li><s:link beanclass="com.erp.action.UserActionBean" event="rolePermissionLink">Role Permission</s:link></li>
                                        <li><s:link beanclass="com.erp.action.UserActionBean" event="userPermissionLink">User Permission</s:link></li>
                                    </ul>
                                </li>

                                <li><s:link beanclass="com.erp.action.PurchaseOrderActionBean" event="termsPageRedirect">Terms & Condition</s:link></li>
                                <li><s:link beanclass="com.erp.action.UserActionBean" event="changePasswordLink">Change Password</s:link></li>
                                
                                <li> <a href="#">Restore</a> 
                                    <ul>
                                         <li><s:link beanclass="com.erp.action.RestoreActionBean" event="restoreItemLink">Restore Items</s:link> </li>
                                         <li><s:link beanclass="com.erp.action.RestoreActionBean" event="restoreVendorLink">Restore Vendor</s:link> </li>
                                         <li><s:link beanclass="com.erp.action.RestoreActionBean" event="restorePOLink">Restore PO</s:link> </li>
                                    </ul>
                                </li>--%>

                            </ul>

                            <!--[if lte IE 6]>
                            </td></tr></table>
                            </a>
                            <![endif]-->

                        </li>

                    </ul>

                    <!--[if lte IE 6]>
                    </td></tr></table>
                    </a>
                    <![endif]-->

                            <%}%>

                </div>
                <%--<p id="iepara">Rest of content here</p>--%>
            </s:layout-component></td>
        </tr>
        <tr valign="top">
                <%--<td width="15%" height="432">${left_menu}</td>--%>
              <td valign="top" <%--style="border-right:10px solid #ccccff;"--%> class="leftMenuCss">
                  <s:layout-component name="left-menu"></s:layout-component>
                        </td>
                  <td width="80%">
            <s:layout-component name="body"></s:layout-component>
              </td>
            
        </tr>
       <%-- <tr >
            <td height="30" colspan="2" ><s:layout-component name="footer"></s:layout-component></td>
        </tr>--%>
    </table>
</s:layout-definition>
</body>
</html>