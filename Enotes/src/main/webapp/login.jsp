<%--
  Created by IntelliJ IDEA.
  User: Sai Infotech
  Date: 5/19/2024
  Time: 12:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@include file="allcss.jsp"%>

<head>

    <title>Login</title>
</head>

<%@include file="navbar.jsp"%>
<div class="container-fluid div-color">
    <div class="row">
        <div class="col-md-4 offset-4">

            <div class="card mr-2">
                <div class="card-header text-center text-white bg-custom">
                    <h4>Login Page</h4>

                </div>

                <%

String invalidMsg  =(String) session.getAttribute("login-faild");
if (invalidMsg != null) {
    %>

                <div class="alert alert-danger" role="alert">
               <%=invalidMsg %>
                </div>
                <%}
session.removeAttribute("login-faild");
                %>
<%
    String withoutlogin=(String) session.getAttribute("Login_error");
    if (withoutlogin!=null){%>
                <div class="alert alert-danger" role="alert">
                         <%=withoutlogin %>
                </div>

                <%
                        session.removeAttribute("Login_error");

                    }
%>

                <%

       String logoutMsg=             (String)  session.getAttribute("logoutMsg");
       if(logoutMsg!=null){
           %>

                <div class="alert alert-danger" role="alert">
                    <%=logoutMsg %>
                </div>

                <%
                        session.removeAttribute("logoutMsg");

       }
                %>




                <div class="card-body">


                    <form action="loginServlet" method="post">

                        <div class="form-group">
                            <label>Enter Email</label>

                            <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="uemail" >
                        </div>
                        <div class="form-group">

                            <label for="exampleInputPassword1">Enter Password</label>
                            <input type="password" class="form-control" id="exampleInputPassword1"   name="upassword">
                        </div>

                        <button type="submit" class="btn btn-primary badge-pill btn-block">login</button>
                    </form></div>
            </div>


        </div>
    </div>
</div>
<%@include file="footer.jsp"%>
<body>




</body>
</html>
