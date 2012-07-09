<%@ include file="/includes/_taglibInclude.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<s:layout-render name="/layout/_base.jsp">
    <s:layout-component name="body">
        <table id="dashMainTable" border="1" height="100%" width="100%" style="">

            <tr width="100%" height="100%;">
                <td style="height:300px;">
                    <div> Latest purchase orders. </div>
                   <div align="center" style="overflow:auto;height:80%;"><jsp:include page="/jsp/dashPOMenu.jsp"/></div>
                </td>
                <td style="height:300px;">
                    <div> Vendor details. </div>
                   <div align="center" style="overflow:auto;height:80%;"><jsp:include page="/jsp/dashPOMenu.jsp"/></div>
                </td>
            </tr>
            <tr width="100%" height="100%;">
                <td style="height:300px;">
                    <div> Latest purchase orders. </div>
                   <div align="center" style="overflow:auto;height:80%;"><jsp:include page="/jsp/dashPOMenu.jsp"/></div>
                </td>
                <td style="height:300px;">
                    <div> Latest purchase orders. </div>
                   <div align="center"  style="overflow:auto;height:80%;"><jsp:include page="/jsp/dashPOMenu.jsp"/></div>
                </td>
            </tr>
            
        </table>
        <%--<div style="height:50%;">
        <div style="position:relative;width:49%;float:left;border-color:black;border-style:double;border-width:medium;">

        <jsp:include page="/jsp/dashPOMenu.jsp"/>
        </div>
        <div style="position:relative;width:49%;float:right;border-color:black;border-style:double;border-width:medium;">
        <jsp:include page="/jsp/dashVendorMenu.jsp"/>
        </div>
        </div>
        <div style="height:50%;">
        <div style="position:relative;width:50%;float:left;">
        <jsp:include page="/jsp/dashVendorMenu.jsp"/>
        </div>
        <div style="position:relative;width:50%;float:right;">
        <jsp:include page="/jsp/dashVendorMenu.jsp"/>
        </div>
        </div>--%>
    </s:layout-component>
</s:layout-render>
