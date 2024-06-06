<%@ page import="User.User" %>
<nav class="navbar navbar-expand-lg navbar-dark bg-custom navbar-custom">
    <a class="navbar-brand" href="#"><i class="fa-sharp fa-solid fa-user-plus"></i>ENotes</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="home.jsp"><i class="fas fa-home"></i> Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="addNotes.jsp"><i class="fas fa-plus"></i> Add Notes</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="shownotes.jsp"><i class="fas fa-address-book"></i> Show Notes</a>
            </li>
        </ul>

    <%
      User u3=(User)  session.getAttribute("userD");
      if (u3 != null) {%>
        <a href="" class="btn btn-light my-2 my-sm-0" data-toggle="modal" data-target="#exampleModal" type="submit"><i class="fas fa-user-plus"></i> <%=u3.getName()%></a>

        <a href="LogoutServlet" class="btn btn-light my-2 my-sm-0 mr-2" type="submit"><i class="fas fa-user"></i> Logout</a>
        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <div class="container text-center">
                            <h5></h5>
                            <table class="table">
                                <tbody>
                                <tr>
                                    <th>User Id</th>
                                    <td><%=u3.getId()%> </td>
                                </tr>
                                <tr>
                                    <th>Full Name</th>
                                    <td><%=u3.getName()%></td>
                                </tr>
                                <tr>
                                    <th>Email Id</th>
                                    <td><%=u3.getEmail()%></td>
                                </tr>
                                </tbody>
                            </table>
                            <div>
                                <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                            </div>
                        </div>




                    </div>

                </div>
            </div>
        </div>

        <%}else {
        %>

        <a href="login.jsp" class="btn btn-light my-2 my-sm-0 mr-2" type="submit"><i class="fas fa-user"></i> Login</a>
        <a href="register.jsp" class="btn btn-light my-2 my-sm-0" type="submit"><i class="fas fa-user-plus"></i> Register</a>

        <%
        }

    %>



    </div>
    <!-- Button trigger modal -->



</nav>