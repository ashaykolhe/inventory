<%--
  Created by IntelliJ IDEA.
  User: Minal
  Date: Feb 15, 2012
  Time: 12:25:45 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib prefix="d" uri="http://displaytag.sf.net/el"%>
<%@ taglib prefix="s" uri="http://stripes.sourceforge.net/stripes-dynattr.tld" %>
<s:useActionBean beanclass="com.erp.action.ItemActionBean" var="listofitems" event="pagedirect"></s:useActionBean>
<% 
request.setAttribute("sectionlst",listofitems.getSectionlst());
%>
 <div style="height:200px;overflow-y:auto">
<d:table name="sectionlst" class="disp" id="section1" requestURI="/Section.action?paginationSection">
   
<d:column property="name" title="Section Name"/>
                  <d:column  title="update">
                        <s:link beanclass="com.erp.action.SectionActionBean" event="readname" onclick= "return updateLink(this);">
                           <s:param name="id" value="${section1.id}"></s:param>
                      <img src="images/edit-icon.png" />
                       </s:link>

                  </d:column>
                   <d:column title="Delete" class="delete">
                       <s:link beanclass="com.erp.action.SectionActionBean" event="delete" onclick= "return ajaxLink(this, '#section_table');">
                           <s:param name="id" value="${section1.id}"></s:param>
                       <img src="images/delete.jpg" />
                       </s:link>
                   </d:column>
	 </d:table>                           </div>
