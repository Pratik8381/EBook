package Servlet;

import Controller.Controller;
import User.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collections;

@WebServlet("/UserServelet")
public class UserServelet extends HttpServlet {
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        String username = req.getParameter("fname");
        String email = req.getParameter("uemail");
        String password = req.getParameter("upassword");

         User user =User.builder()
                 .name(username)
                 .email(email)
                 .password(password)
                 .build();

        Controller controller =new Controller();
    boolean f=    controller.adduser(user);
        HttpSession session = null;
        if(f) {
     session = req.getSession();
    session.setAttribute("reg-success", "Registration Successful....");
    res.sendRedirect("register.jsp");


}else {
            session.setAttribute("failed-msg", " Something went wrong on server....");
            res.sendRedirect("register.jsp");

}
    }



}
