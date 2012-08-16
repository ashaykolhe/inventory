    <%--
    Created by IntelliJ IDEA.
    User: Milind
    Date: Jan 24, 2012
    Time: 9:04:56 PM
    To change this template use File | Settings | File Templates.
    --%>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@taglib prefix="stripes" uri="http://stripes.sourceforge.net/stripes.tld" %>
    <html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

    <title>Login Page</title>
    <script type="text/javascript" src="js/jquery.js"></script>
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <script type="text/javascript">
    var userFocus = false;
    var passwordFocus = false;
    $(document).ready(function() {
    $('#loginname').focus(function() {
    userFocus = true;
    passwordFocus = false;
    });
    $('#loginpassword').focus(function() {
    passwordFocus = true;
    userFocus = false;
    });
    if (!userFocus && !passwordFocus) {
    if ($('#loginname').val().length > 0) $('#loginpassword').focus(); else $('#loginname').focus();
    }
    });
    </script>
    </head>

    <body>
    <stripes:form beanclass="com.erp.action.LoginActionBean" >
    <fieldset >
    <legend>Log in</legend>
    <div class="clear"></div>
    <label class="usernamelabel">Username</label>
    <stripes:text name="user.username" class="usernameinput" id="loginname" value=""/>
    <br>    <br>
    <div class="clear"></div>
    <label class="passwordlabel" >Password</label>
    <stripes:password name="user.password" class="passwordinput" id="loginpassword" value=""/>
    <div class="clear"></div>
    <br >
    <stripes:submit  style="margin: 0 0 0 106px;" class="button" name="login" value="Login"/>
    </fieldset>
    <div class="error_div1">
    <stripes:errors/>  </div>
    <div class="error_div2">
    <stripes:messages/>  </div>
    </stripes:form>

    </body>
    </html>