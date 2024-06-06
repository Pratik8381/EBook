<%@ page import="Dao.PostDao" %>
<%@ page import="User.*" %>
<%@ page import="java.util.List" %>
<%
    User user3=(User) session.getAttribute("userD");
    if(user3==null) {
        response.sendRedirect("login.jsp");
        session.setAttribute("Login_error","Please Login..");
    }
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@include file="allcss.jsp"%>
<head>
    <title>Show Notes</title>
</head>
<body>
<%@include file="navbar.jsp"%>
<%
 String updateMsg=(String)   session.getAttribute("updateMsg");
 if(updateMsg==null) {
     %>

<div class="alert alert-success" role="alert">
    <%=updateMsg %>
</div>
<%
        session.removeAttribute("updateMsg");

    }
%>


<%
    String DeleteMsg=(String)   session.getAttribute("DeleteMsg");
    if(updateMsg==null) {
%>

<div class="alert alert-danger" role="alert">
    <%=DeleteMsg %>
</div>
<%
        session.removeAttribute("DeleteMsg");

    }
%>


<div class="container">
    <h2 class="text-center">All Notes</h2>
    <div class="row">
        <div class="col-md-12">
            <%
                if(user3!=null){
                    PostDao postDao=new PostDao();
                    List<Post> post=postDao.getData(user3.getId());
                    for (Post post1 : post)
                    {%>
            <div class="card mt-3">
                <img src="OIUGFI0.jpg" class="card-img-top mt-2 mx-auto" style="max-width: 100px">
                <div class="card-body p-4">
                    <h5 class="card-title"><%= post1.getTitle() %></h5>
                    <p>
                        <%= post1.getContent() %>.
                    </p>
                    <p>
                        <b class="text-success">Published By: <%= user3.getName() %></b><br></br><b class="text-primary"></b>
                    </p>
                    <p>
                        <b class="text-success">Published Date: <%= post1.getPdate() %></b><br></br><b class="text-success"></b>
                    </p>
                    <div class="container text-center mt-2">
                        <a href="deleteServlet?note_id=<%= post1.getId() %>" class="btn btn-danger">Delete</a>
                        <a href="edit.jsp?note_id=<%= post1.getId() %>" class="btn btn-primary">Edit</a>
                    </div>
                </div>
            </div>
            <% }
            }
            %>
        </div>
    </div>
</div>
<%@include file="footer.jsp"%>
</body>
</html>
