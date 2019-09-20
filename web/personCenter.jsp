<%@ page import="com.totoro.model.User" %><%--
  Created by IntelliJ IDEA.
  User: Totoro
  Date: 2019/9/17
  Time: 10:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>personCenter</title>
</head>
<body>
个人中心
<hr/>
<%
    User user=(User)session.getAttribute("User");
%>
用户名：<%=user.getUsername()%><br/>
年龄：<%=user.getAge()%><br/>
性别：<%=user.getSex()%><br/>
</body>
</html>
