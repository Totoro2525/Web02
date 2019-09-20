<%@ page import="com.totoro.util.DBUtil" %>
<%@ page import="com.totoro.model.User" %><%--
  Created by IntelliJ IDEA.
  User: Totoro
  Date: 2019/9/17
  Time: 9:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String username=request.getParameter("username");
    String password=request.getParameter("password");
    User user=DBUtil.verifAccount(username,password);
    if(user!=null){
        //out.println("登录成功");
        int number=0;
        if (application.getAttribute("userNumber")!=null){
            number=(Integer) application.getAttribute("userNumber");
        }
        number++;
        application.setAttribute("userNumber",number);
        session.setAttribute("User",user);
        request.getRequestDispatcher("personCenter.jsp").forward(request,response);
    }else{
        request.setAttribute("message","<font color='red'>登陆失败，请重新登录!</font>");
        request.getRequestDispatcher("login.jsp").forward(request,response);
        //out.println("登录失败，用户名或密码错误");
    }
%>
</body>
</html>
