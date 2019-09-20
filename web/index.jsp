<%@ page import="com.totoro.model.User" %><%--
  Created by IntelliJ IDEA.
  User: Totoro
  Date: 2019/9/16
  Time: 20:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>主页</title>
  </head>
  <body>
  主页
  <hr/>
  <%
    int number=0;
    Object n=application.getAttribute("userNumber");
    if (n!=null){
        number=(Integer) n;
    }
    out.println("当前共有"+number+"个用户在线<br/>");
  %>
  <%
    Object o=session.getAttribute("User");
    if (o!=null){
        User user=(User)o;
        out.println("当前登录用户:"+user.getUsername()+"<br/>");
    }
  %>
<a href="login.jsp">登录</a><br/>
<a href="register.jsp">注册</a>
  </body>
</html>
