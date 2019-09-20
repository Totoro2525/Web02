<%@ page import="com.totoro.util.DBUtil" %><%--
  Created by IntelliJ IDEA.
  User: Totoro
  Date: 2019/9/16
  Time: 20:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
</body>
</html>
<%
    String username=request.getParameter("username");
    String password=request.getParameter("password");
    int age=Integer.parseInt(request.getParameter("age"));
    String sex= new String(request.getParameter("sex").getBytes("iso-8859-1"),"utf-8");
    System.out.println("用户名："+username);
    System.out.println("密码:"+password);
    System.out.println("年龄:"+age);
    System.out.println("性别:"+sex);
    boolean isSuccessful=DBUtil.addUser(username,password,age,sex);
    if (isSuccessful) {
        request.setAttribute("message","注册成功，请登录!");
        request.getRequestDispatcher("login.jsp").forward(request,response);
    }else{
        request.setAttribute("message","注册失败，请重新注册!");
        request.getRequestDispatcher("register.jsp").forward(request,response);
    }
%>

<%--
        }
        out.println("<font color='green'>注册成功</font>");
        %>
            <font color='green'>用户名：<%=username%>,注册成功</font>
        <%
    }else{
        //out.println("<font color='red'>注册失败</font>");
        %>
            <font color='red'>注册失败</font>
        <%
    }

%>
--%>