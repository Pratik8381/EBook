<%@ page import="Dao.PostDao" %>
<%@ page import="User.*" %>
<%
    User user = (User) session.getAttribute("userD");
    if (user == null) {
        response.sendRedirect("login.jsp");
        session.setAttribute("Login_error", "Please Login..");
    }

    Integer noteid = null; // Initialize noteid as null
    String noteIdParam = request.getParameter("note_id");
    if (noteIdParam != null && !noteIdParam.isEmpty()) {
        noteid = Integer.parseInt(noteIdParam);
    }
%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<%@include file="allcss.jsp"%>
<head>
    <title>Edit Page</title>
</head>
<body>

<%
    noteid = Integer.parseInt(request.getParameter("note_id"));
    PostDao postDao = new PostDao();
  Post post= postDao.getDataByID(noteid);
%>







<div class="container-fluid">
    <%@include file="navbar.jsp"%>
    <h1 class="text-center">EDIT YOUR NOTES</h1>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <form action="EditServelet" method="post">
                    <input type="hidden"  value="<%=noteid%>"  name="note_id"> <!-- Add hidden input field for note_id -->
                    <div class="form-group">
                        <label for="exampleInputEmail1">Enter Title</label>
                        <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="title" required value="<%=post.getTitle()%>">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Enter Content</label>
                        <textarea rows="9" cols="" class="form-control" name="content" required><%=post.getContent()%></textarea>
                    </div>
                    <div class="container text-center">
                        <button type="submit" class="btn btn-primary">Add Notes</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<%@include file="footer.jsp"%>
</body>
</html>
