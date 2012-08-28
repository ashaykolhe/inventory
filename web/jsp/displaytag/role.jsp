<%@ taglib prefix="d" uri="http://displaytag.sf.net/el"%>
<%@ taglib prefix="s" uri="http://stripes.sourceforge.net/stripes-dynattr.tld" %>
  <s:useActionBean beanclass="com.erp.action.UserActionBean" var="listofuser" event="addUserLink"></s:useActionBean>
<%
  request.setAttribute("rolelst",listofuser.getRolelst());

%>
 <div style="height:200px;overflow-y:auto">
<d:table name="rolelst"  class="disp" id="rolel" requestURI="/Role.action?paginationRole">
<d:column property="name" title="Role Name"/>
                  <d:column  title="update">
                        <s:link beanclass="com.erp.action.RoleActionBean" event="readname" onclick= "return updateLink(this);">
                          <s:param name="id" value="${rolel.id}"></s:param>
                      <img src="images/edit-icon.png" />
                       </s:link>

                  </d:column>
                   <d:column title="Delete" class="delete">
                       <s:link beanclass="com.erp.action.RoleActionBean" event="delete1" onclick= "return ajaxLink(this,'#role_table');">
                           <s:param name="id" value="${rolel.id}"></s:param>
                       <img src="images/delete.jpg" />
                       </s:link>
                   </d:column>
	 </d:table>
    </div>