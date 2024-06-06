package Servlet;

import Dao.PostDao;
import User.Post;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/EditServelet")
public class EditServelet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {


        Integer noteid = Integer.parseInt(req.getParameter("note_id"));

String title = req.getParameter("title");
        String content = req.getParameter("content");
            PostDao postDao = new PostDao();
          boolean f=postDao.postUpdate(noteid, title, content);

          if (f){
              try {
                  System.out.println("Data update successfully");


                  HttpSession session = req.getSession();
                  session.setAttribute("updateMsg", "Notes update successfully");
                  resp.sendRedirect("shownotes.jsp");
              } catch (Exception e) {
                  throw new RuntimeException(e);
              }
          }else {
              System.out.println("Data update failed");
          }


        } catch (NumberFormatException | SQLException e) {
            throw new RuntimeException(e);
        }

    }
}
