package Servlet;

import Dao.Dao;
import User.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
String useremail = req.getParameter("uemail");
String password = req.getParameter("upassword");
        User user = User.builder()
                .email(useremail)
                .password(password)
                .build();
        Dao dao = new Dao();
     User user1=   dao.login(user);
     if(user1!=null){

         HttpSession session = req.getSession();
         session.setAttribute("userD", user1);
resp.sendRedirect("home.jsp");
     }
     else {
HttpSession session = req.getSession();
session.setAttribute("login-faild", "invalid username or password");
    resp.sendRedirect("login.jsp");
     }
    }
}
