<%@ page import="com.totoro.model.User" %><%--
  Created by IntelliJ IDEA.
  User: Totoro
  Date: 2019/9/16
  Time: 20:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>register</title>
</head>
<body>
注册
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
<form action="register_do" method="post">
        用户名：<input type="text" name="username"/><br/>
        密码：<input type="password" name="password"/><br/>
        年龄：<input type="text" name="age"/><br/>
        性别：男<input type="radio" name="sex" value="男"/>女<input type="radio" name="sex" value="女"/><br/>
        <input type="submit" value="注册"/><br/>
</form>
</body>
</html>
