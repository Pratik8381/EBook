<%@ page import="java.sql.Connection" %>
<%@ page import="UtillConnectior.UtillConnection" %>
<html>
<head>
<style type="text/css">
    .back-img {
        background: url("map-of-the-world-2401458_1280.jpg");
        background-repeat: no-repeat; /* Ensure the background image doesn't repeat */
        background-size: cover; /* Scale the background image to cover the entire element */
        background-size: cover;
        width: 100%;
        height: 80vh;
    }

</style>
    <title>Home Page</title>
    <%@include file="allcss.jsp"%>
</head>
<body>

<%@include file="navbar.jsp"%>

<div class="container-fluid back-img">
   <div class="text-center">
       <h1 class="text-white">E Notes Your Notes</h1>
       <a href="login.jsp" class="btn btn-light">Login</a>
       <a href="register.jsp" class="btn btn-light">register</a>
   </div>
   </div>

<%@include file="footer.jsp"%>
</body>
</html>
