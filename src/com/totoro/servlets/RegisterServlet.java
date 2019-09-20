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
        System.out.println("�û�����"+username);
        System.out.println("����:"+password);
        System.out.println("����:"+age);
        System.out.println("�Ա�:"+sex);
        boolean isSuccessful= DBUtil.addUser(username,password,age,sex);
        if (isSuccessful) {
            request.setAttribute("message","ע��ɹ������¼!");
            request.getRequestDispatcher("login.jsp").forward(request,response);
        }else{
            request.setAttribute("message","ע��ʧ�ܣ�������ע��!");
            request.getRequestDispatcher("register.jsp").forward(request,response);
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at:").append(request.getContextPath());
    }
}
