<%@ page import="com.totoro.model.User" %><%--
  Created by IntelliJ IDEA.
  User: Totoro
  Date: 2019/9/16
  Time: 20:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>login</title>
</head>
<body>
登录
<hr/>
<%
    Object o=session.getAttribute("User");
    if (o!=null){
        User user=(User)o;
        out.println("当前登录用户:"+user.getUsername()+"<br/>");
    }
%>
<%
    Object msg=request.getAttribute("message");
    if (msg!=null){
        out.println(msg);
    }
%>
<form action="login_do.jsp" method="post">
    用户名：<input type="text" name="username"/><br/>
    密码：<input type="password" name="password"/><br/>
    <input type="submit" value="登录"/><br/>
</form>
</body>
</html>
