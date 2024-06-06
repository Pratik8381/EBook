<%--
  Created by IntelliJ IDEA.
  User: Sai Infotech
  Date: 5/20/2024
  Time: 4:55 PM
  To change this template use File | Settings | File Templates.
--%>

<%
    User user1=(User) session.getAttribute("userD");
    if(user1==null)
    {
        response.sendRedirect("login.jsp");
        session.setAttribute("Login_error","Please Login..");
    }
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="allcss.jsp"%>
</head>
<body>
<%@include file="navbar.jsp"%>
<div class="container-fluid">
<div class="card mt-3">
<div class="card-body text-center">
    <img src="OqjY1y.jpg" >
    <h1>
        START TAKING YOUR NOTES
    </h1>
    <a href="addNotes.jsp" class="btn btn-outline-primary">Start here</a>
</div>
</div>
</div>
<%@include file="footer.jsp"%>
</body>
</html>
