package com.totoro.servlets;

import com.totoro.model.User;
import com.totoro.util.DBUtil;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "login_do",urlPatterns="/login_do")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        User user= DBUtil.verifAccount(username,password);
        if(user!=null){
            //out.println("µÇÂ¼³É¹¦");
            int number=0;
            ServletContext application=this.getServletContext();
            if (application.getAttribute("userNumber")!=null){
                number=(Integer) application.getAttribute("userNumber");
            }
            number++;
            application.setAttribute("userNumber",number);
            request.getSession().setAttribute("User",user);
            request.getRequestDispatcher("personCenter.jsp").forward(request,response);
        }else{
            request.setAttribute("message","<font color='red'>µÇÂ½Ê§°Ü£¬ÇëÖØÐÂµÇÂ¼!</font>");
            request.getRequestDispatcher("login.jsp").forward(request,response);
            //out.println("µÇÂ¼Ê§°Ü£¬ÓÃ»§Ãû»òÃÜÂë´íÎó");
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at:").append(request.getContextPath());
    }
}
