<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.onlinesite.onlinesite.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Online Shopping System</title>
    <!-- Importing all ui libs -->
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
    <script src='../../../../../../ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js'></script>
    <script src="../../../../../../m.servedby-buysellads.com/monetization.js" type="text/javascript"></script>
</head>
<body>
<%
    //Checking whether customer in session or not
    if (session.getAttribute("name") != null && session.getAttribute("name") != "") {
%>
<div class="ban-top">
    <div class="container">
        <div class="top_nav_right">
            <div class="cart box_1">
                <a href="checkout_page.jsp">
                    <%
                        ResultSet resultCount = Connect_to_sql.getResultFromSqlQuery("select count(*) from cart where customer_id='" + session.getAttribute("id") + "'");
                        resultCount.next();
                        int count = resultCount.getInt(1);
                    %>
                    <h3>
                        <div class="total">
                            <i class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></i>
                            (
                            <%=count%>
                            items )
                        </div>
                    </h3>
                </a>
                <p>
                    <a href="javascript:;" class="simpleCart_empty">Empty Cart</a>
                </p>
            </div>
        </div>
        <div class="top_nav_left">
            <nav class="navbar navbar-default">
                <div class="container-fluid">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed"
                                data-toggle="collapse"
                                data-target="#bs-example-navbar-collapse-1"
                                aria-expanded="false">
                            <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
                        </button>
                    </div>
                    <jsp:include page="header.jsp"></jsp:include>
                </div>
            </nav>
        </div>
        <div class="clearfix"></div>
    </div>
</div>
<br>
<div class="modal-dialog" role="document">
    <div class="modal-content modal-info">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"
                    aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <div class="modal-body modal-spa">
            <div class="login-grids">
                <div class="login">
                    <div class="login-bottom">
                        <h3>Edit Account Info</h3>
                        <%
                            String success = (String) session.getAttribute("success-message");
                            if (success != null) {
                                session.removeAttribute("success-message");
                        %>
                        <div class='alert alert-success' id='success' style="width: 680px;">Customer
                            Info Updated Successfully.</div>
                        <%
                            }
                            String fail = (String) session.getAttribute("fail-message");
                            if (fail != null) {
                                session.removeAttribute("fail-message");
                        %>
                        <div class="alert alert-danger" id='danger' style="width: 680px;">Customer
                            Info Update Failed ,Please try again</div>
                        <%
                            }
                        %>
                        <%
                            //Querying to database
                            ResultSet updateResult = Connect_to_sql.getResultFromSqlQuery("select * from customer where id='" + session.getAttribute("id") + "' ");
                            while (updateResult.next()) {
                        %>
                            <form action="editaccinfo2_customer.jsp"
                                  method="post">
                                <div class="form-group">
                                    <label>Enter Name</label> <input class="form-control" type="text" name="name" value="<%=updateResult.getString("name")%>" />
                                </div>
                                <div class="form-group">
                                    <label>Email</label> <input class="form-control" type="text" name="email" value="<%=updateResult.getString("email")%>" readonly />
                                </div>
                                <div class="form-group">
                                    <label>Password</label> <input class="form-control" type="text" name="password" value="<%=updateResult.getString("password")%>" />
                                </div>
                                <div class="form-group">
                                    <label>Phone</label> <input class="form-control" type="text" name="phone" value="<%=updateResult.getString("phone")%>" />
                                </div>
                                <div class="form-group">
                                    <label>Address</label> <input class="form-control" type="text" style="min-height: 100px;" name="address" value="<%=updateResult.getString("address")%>" />
                                </div>
                                <div class="form-group">
                                    <label>Pin Code</label> <input class="form-control" type="text" name="pin_code" value="<%=updateResult.getString("pin_code")%>" />
                                </div>
                                <button type="submit" class="btn btn-success">Update Info</button>
                            </form>
                        <%
                            }
                        %>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
    </div>
</div>
<%
    } else {
        response.sendRedirect("login_customer.jsp");
    }
%>
<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>
