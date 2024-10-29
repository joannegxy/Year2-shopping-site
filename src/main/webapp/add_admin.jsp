<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.onlinesite.onlinesite.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Online Shopping System</title>
    <!-- Importing all ui libs -->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    <link href="assets/css/style.css" rel="stylesheet" />
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
    <script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
    <script src="js/simpleCart.min.js"></script>
    <script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>
    <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,900,900italic,700italic' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    <script src="js/jquery.easing.min.js"></script>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
<%
    //Checking whether admin in session or not
    if (session.getAttribute("uname") != null && session.getAttribute("uname") != "") {
%>
<jsp:include page="header_admin.jsp"></jsp:include>
<div class="content-wrapper">
    <div class="container">
        <div class="row pad-botm">
            <div class="col-md-12">
                <h4 class="header-line">Add Admin</h4>
            </div>
        </div>
        <%
            String success = (String) session.getAttribute("success-message");
            if (success != null) {
                session.removeAttribute("success-message");
        %>
        <div class='alert alert-success' id='success' style="width: 680px;">Admin
            Register Successfully.</div>
        <%
            }
            String fail = (String) session.getAttribute("fail-message");
            if (fail != null) {
                session.removeAttribute("fail-message");
        %>
        <div class="alert alert-danger" id='danger' style="width: 680px;">Admin
            Registration Fail,Please try again</div>
        <%
            }
        %>
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-info">
                    <div class="panel-heading">Add Admin</div>
                    <div class="panel-body">
                        <form role="form" action="add_admin" method="post">
                            <div class="sign-up">
                                <label>Enter email</label> <input class="form-control" type="text" name="email" required />
                            </div>
                            <br>
                            <div class="sign-up">
                                <label>Set Password</label> <input class="form-control" type="password" name="password" required/>
                            </div>
                            <br>
                            <div class="sign-up">
                                <label>Name</label> <input class="form-control" type="text" name="name" required/>
                            </div>
                            <br>
                            <button type="submit" class="btn btn-success" onclick="return confirm('Are you sure Do you want to add this admin?');">Add Admin</button>
                            <button type="reset" class="btn btn-danger">Reset</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
<script src="assets/js/jquery-1.10.2.js"></script>
<script src="assets/js/bootstrap.js"></script>
<script src="assets/js/custom.js"></script>
<%
    } else {
        response.sendRedirect("login_admin.jsp");
    }
%>
</body>
</html>