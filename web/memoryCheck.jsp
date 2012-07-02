<%@ page import="java.lang.management.ManagementFactory" %>
<%@ page import="java.lang.management.MemoryPoolMXBean" %>
<%@ page import="java.util.List" %>
<%@ page import="java.lang.management.MemoryMXBean" %>
<%--
  Created by IntelliJ IDEA.
  User: Ashay
  Date: Mar 19, 2012
  Time: 10:36:46 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="includes/_taglibInclude.jsp"%>
<html>
  <head>
    <title>JVM Memory Monitor</title>
    <style type="text/css">
      td {
        text-align: right;
      }
    </style>
  </head>
<body>
  <%
    MemoryMXBean memoryBean = ManagementFactory.getMemoryMXBean();
    pageContext.setAttribute("memoryBean", memoryBean);

    List<MemoryPoolMXBean> poolBeans = ManagementFactory.getMemoryPoolMXBeans();
    pageContext.setAttribute("poolBeans", poolBeans);
  %>

  <h3>Total Memory</h3>
  <table border="1" width="100%">
    <tr>
      <th>usage</th>
      <th>init</th>
      <th>used</th>
      <th>committed</th>
      <th>max</th>
    </tr>
    <tr>
      <td style="text-align: left">Heap Memory Usage</td>
      <td><fmt:formatNumber value="${memoryBean.heapMemoryUsage.init / (1024 * 1024)}" maxFractionDigits="1"/> Mb</td>
      <td><fmt:formatNumber value="${memoryBean.heapMemoryUsage.used / (1024 * 1024)}" maxFractionDigits="1"/> Mb</td>
      <td><fmt:formatNumber value="${memoryBean.heapMemoryUsage.committed / (1024 * 1024)}" maxFractionDigits="1"/> Mb</td>
      <td><fmt:formatNumber value="${memoryBean.heapMemoryUsage.max / (1024 * 1024)}" maxFractionDigits="1"/> Mb</td>
    </tr>
    <tr>
      <td style="text-align: left">Non-heap Memory Usage</td>
      <td><fmt:formatNumber value="${memoryBean.nonHeapMemoryUsage.init / (1024 * 1024)}" maxFractionDigits="1"/> Mb</td>
      <td><fmt:formatNumber value="${memoryBean.nonHeapMemoryUsage.used / (1024 * 1024)}" maxFractionDigits="1"/> Mb</td>
      <td><fmt:formatNumber value="${memoryBean.nonHeapMemoryUsage.committed / (1024 * 1024)}" maxFractionDigits="1"/> Mb</td>
      <td><fmt:formatNumber value="${memoryBean.nonHeapMemoryUsage.max / (1024 * 1024)}" maxFractionDigits="1"/> Mb</td>
    </tr>
  </table>

  <h3>Memory Pools</h3>
  <table border="1" width="100%">
    <tr>
      <th>name</th>
      <th>usage</th>
      <th>init</th>
      <th>used</th>
      <th>committed</th>
      <th>max</th>
    </tr>
    <c:forEach var="bean" items="${poolBeans}">
      <tr>
        <td style="text-align: left">${bean.name}</td>
        <td style="text-align: left">Memory Usage</td>
        <td><fmt:formatNumber value="${bean.usage.init / (1024 * 1024)}" maxFractionDigits="1"/> Mb</td>
        <td><fmt:formatNumber value="${bean.usage.used / (1024 * 1024)}" maxFractionDigits="1"/> Mb</td>
        <td><fmt:formatNumber value="${bean.usage.committed / (1024 * 1024)}" maxFractionDigits="1"/> Mb</td>
        <td><fmt:formatNumber value="${bean.usage.max / (1024 * 1024)}" maxFractionDigits="1"/> Mb</td>
      </tr>
      <tr>
        <td></td>
        <td style="text-align: left">Peak Usage</td>
        <td><fmt:formatNumber value="${bean.peakUsage.init / (1024 * 1024)}" maxFractionDigits="1"/> Mb</td>
        <td><fmt:formatNumber value="${bean.peakUsage.used / (1024 * 1024)}" maxFractionDigits="1"/> Mb</td>
        <td><fmt:formatNumber value="${bean.peakUsage.committed / (1024 * 1024)}" maxFractionDigits="1"/> Mb</td>
        <td><fmt:formatNumber value="${bean.peakUsage.max / (1024 * 1024)}" maxFractionDigits="1"/> Mb</td>
      </tr>
    </c:forEach>
  </table>

</body>
</html>