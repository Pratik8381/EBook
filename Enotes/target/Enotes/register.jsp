<%--
  Created by IntelliJ IDEA.
  User: Sai Infotech
  Date: 5/19/2024
  Time: 12:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register Page</title>
    <%@include file="allcss.jsp"%>
</head>
<body>
<%@include file="navbar.jsp"%>
<div class="container-fluid div-color">
    <div class="row">
        <div class="col-md-4 offset-4">

            <div class="card mr-2">
                <div class="card-header text-center text-white bg-custom">
                    <h4>Registration</h4>


<%
 String reg=(String)   session.getAttribute("reg-success");
 if (reg != null) {%>
                </div>
                <div class="alert alert-success" role="alert">
                    <%= reg%> login<a href="login.jsp">Click here</a>
                </div>
 <%
 session.removeAttribute("reg-success");
 }
%>

                <%
                    String failedmsg=(String)   session.getAttribute("failed-msg");
                    if (failedmsg != null) {%>
            </div>
            <div class="alert alert-success" role="alert">
                <%= failedmsg%>
            </div>
            <%
                    session.removeAttribute("failed-msg");
                    }
            %>




                <div class="card-body">
                    <form action="UserServelet" method="post">
                        <div class="form-group">
                            <label>Enter Full Name</label>
                            <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp"
                            name="fname">
                        </div>
                    <div class="form-group">
                        <label>Enter Email</label>

                        <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="uemail" >
                    </div>
                    <div class="form-group">

                        <label for="exampleInputPassword1">Enter Password</label>
                        <input type="password" class="form-control" id="exampleInputPassword1" name="upassword" >
                    </div>

                    <button type="submit" class="btn btn-primary badge-pill btn-block">Register</button>
                </form></div>
            </div>


        </div>
    </div>
</div>
<%@include file="footer.jsp"%>
</body>
</html>
