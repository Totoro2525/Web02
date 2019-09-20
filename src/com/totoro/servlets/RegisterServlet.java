package com.totoro.servlets;

import com.totoro.util.DBUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "register_do",urlPatterns="/register_do")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        int age=Integer.parseInt(request.getParameter("age"));
        String sex= new String(request.getParameter("sex").getBytes("iso-8859-1"),"utf-8");
        System.out.println("用户名："+username);
        System.out.println("密码:"+password);
        System.out.println("年龄:"+age);
        System.out.println("性别:"+sex);
        boolean isSuccessful= DBUtil.addUser(username,password,age,sex);
        if (isSuccessful) {
            request.setAttribute("message","注册成功，请登录!");
            request.getRequestDispatcher("login.jsp").forward(request,response);
        }else{
            request.setAttribute("message","注册失败，请重新注册!");
            request.getRequestDispatcher("register.jsp").forward(request,response);
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at:").append(request.getContextPath());
    }
}
