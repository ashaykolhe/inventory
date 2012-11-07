
<%@ taglib prefix="d" uri="http://displaytag.sf.net/el"%>
<%@ taglib prefix="s" uri="http://stripes.sourceforge.net/stripes-dynattr.tld" %>
<s:useActionBean beanclass="com.erp.action.ItemActionBean" var="listofitems" event="pagedirect"></s:useActionBean>
<%
request.setAttribute("uomlst",listofitems.getUomlst());
%>
<div style="height:200px;overflow-y:auto">
<d:table name="uomlst" class="disp" id="uom1" requestURI="/Uom.action?paginationUom">
<d:column property="name" title="UOM Name" />
                  <d:column  title="update">
                        <s:link beanclass="com.erp.action.UomActionBean" event="readname" onclick= "return updateLinkuom(this);">
                           <s:param name="id" value="${uom1.id}"></s:param>
                      <img src="images/edit-icon.png" />
                       </s:link>
                  </d:column>
                   <d:column title="Delete" class="delete">                                                                                               
                       <s:link beanclass="com.erp.action.UomActionBean" event="delete" onclick= "return ajaxLink(this, '#uom_table');">
                           <s:param name="id" value="${uom1.id}"></s:param>
                       <img src="images/delete.jpg" />
                       </s:link>
                   </d:column>
	 </d:table>
    </div>