package Servlet;

import Dao.PostDao;
import UtillConnectior.UtillConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Arrays;

@WebServlet("/AddNotesServlet")
public class AddNotesServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userID = Integer.parseInt(request.getParameter("uid"));
        String title = request.getParameter("title");
        String content = request.getParameter("content");


            PostDao postDao = new PostDao();
            // Call the addPost method with the provided data
        boolean flag = false;
        try {
            flag = postDao.addPost(title, content, userID);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        if (flag) {
                System.out.println("Data inserted successfully");
                response.sendRedirect("shownotes.jsp");
            } else {
                System.out.println("Data insertion failed");
            }

    }
}
