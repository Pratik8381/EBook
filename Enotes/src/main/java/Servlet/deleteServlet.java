package Servlet;

import Dao.PostDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/deleteServlet")
public class deleteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer id = Integer.parseInt(req.getParameter("note_id"));
        PostDao postDao = new PostDao();
        try {
            boolean f=    postDao.deleteNotesByID(id);
            HttpSession session=null;
            if (f){
                 session = req.getSession();
                session.setAttribute("updateMsg", "Note : Deleted Successfully");
                resp.sendRedirect("shownotes.jsp");

            }else {
                session = req.getSession();
                session.setAttribute("DeleteMsg", "Note : Not Deleted Successfully");
                resp.sendRedirect("shownotes.jsp");

            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
