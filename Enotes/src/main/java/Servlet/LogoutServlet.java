package Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) {
        try {
            HttpSession session=req.getSession();
            session.removeAttribute("userD");

            HttpSession session1=req.getSession();
            session1.setAttribute("logoutMsg","Logout Successful");
            resp.sendRedirect("login.jsp");


        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
