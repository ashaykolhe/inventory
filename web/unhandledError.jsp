<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/includes/_taglibInclude.jsp" %>

<s:layout-render name="/layout/_base.jsp" pageTitle="Error">

  <s:layout-component name="heading">oops! there was an error processing your request</s:layout-component>
  <s:layout-component name="content">
    <p class="imp_note">The site encountered an unexpected error</p>
    <p>
      An unexpected error has occured and we've been informed about it.
    </p>
    <p>
      If you've been experiencing this problem for a long duration, then please
      write to us , with a few lines on when you're getting this error.
      That will help us resolve any problems much quicker. Apologies about the inconvenience.
    </p>
  </s:layout-component>

</s:layout-render>
