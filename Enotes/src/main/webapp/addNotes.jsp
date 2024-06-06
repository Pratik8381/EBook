<%--
  Created by IntelliJ IDEA.
  User: Sai Infotech
  Date: 5/21/2024
  Time: 3:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%
    User user=(User) session.getAttribute("userD");
    if(user==null)
    {
        response.sendRedirect("login.jsp");
        session.setAttribute("Login_error","Please Login..");
    }
%>














<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@include file="allcss.jsp"%>
<head>
    <title>Add Notes</title>
</head>
<body>
<div class="container-fluid">
    <%@include file="navbar.jsp"%>
<h1 class="text-center">ADD YOUR NOTES</h1>
   <div class="container">
       <div class="row">
           <div class="col-md-12">
               <form action="AddNotesServlet" method="post">
                   <div class="form-group">


                       <%


//               User user=(User) session.getAttribute("userD");
                           user=(User) session.getAttribute("userD");

                           if (user!=null){%>
                       <input type="hidden" value="<%=u3.getId() %>" name="uid">


                       <%}
                       %>


                       <label for="exampleInputEmail1">Enter Title</label>
                       <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="title" required>
                   </div>

                   <div class="form-group">
                       <label for="exampleInputEmail1">Enter Content</label>
                       <textarea rows="9" cols="" class="form-control" name="content" required></textarea>
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
