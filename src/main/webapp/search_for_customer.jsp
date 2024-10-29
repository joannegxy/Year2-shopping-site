<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.onlinesite.onlinesite.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Online Shopping System</title>
    <!-- Importing all ui libs -->
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.10.1/bootstrap-table.min.css">
    <script src="//code.jquery.com/jquery.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.10.1/bootstrap-table.min.js"></script>
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
</head>
<body>
<%
    //Checking whether admin in session or not
    if (session.getAttribute("uname") != null && session.getAttribute("uname") != "") {
%>
<jsp:include page="header_admin.jsp"></jsp:include>
<div class="content-wrapper">
    <div class="container-fluid">
        <div class="row pad-botm">
            <div class="col-md-12">
                <h4 class="header-line">View Customers</h4>
            </div>
        </div>
        <div class="navbar-search">
            <div class="search-container">
                <form action="search_for_customer.jsp">
                    <input type="text" placeholder="Search customer by email..." name="search">
                    <button type="submit"><i class="fa fa-search"></i></button>
                </form>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="panel panel-success">
                    <div class="panel-heading">View Customers</div>
                    <div class="panel-body">
                        <table data-toggle="table"
                               data-classes="table table-hover table-condensed"
                               data-row-style="rowStyle"
                               data-striped="true"
                               data-pagination="true"
                        >
                            <thead>
                            <tr>
                                <th class="col-xs-1" data-field="#" data-sortable="true">#</th>
                                <th class="col-xs-1" data-field="Name" data-sortable="true">Name</th>
                                <th class="col-xs-1" data-field="Email" >Email</th>
                                <th class="col-xs-1" data-field="Gender" data-sortable="true">Gender</th>
                                <th class="col-xs-1" data-field="Mobile" data-sortable="true">Mobile</th>
                                <th class="col-xs-1" data-field="Address" >Address</th>
                                <th class="col-xs-1" data-field="Date" data-sortable="true">Date</th>
                            </tr>
                            </thead>
                            <%
                                Connection connection = Connect_to_sql.getConnection();
                                Statement statement = connection.createStatement();
                                String search=request.getParameter("search");
                                String sql="select * from customer where email like '%" +search+ "%'";
                                ResultSet resultSet = statement.executeQuery(sql);
                                while (resultSet.next()) {
                            %>
                            <tbody>

                            <tr id="tr-id-2" class="tr-class-2">
                                <td><%=resultSet.getInt(1)%></td>
                                <td><%=resultSet.getString("name")%></td>
                                <td><%=resultSet.getString("email")%></td>
                                <td><%=resultSet.getString("gender")%></td>
                                <td><%=resultSet.getString("phone")%></td>
                                <td><%=resultSet.getString("address")%></td>
                                <td><%=resultSet.getString("added_date")%></td>
                            </tr>
                            </tbody>
                            <%
                                }
                            %>
                        </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
<script>
    function queryParams() {
        return {
            type: 'owner',
            sort: 'updated',
            direction: 'desc',
            per_page: 100,
            page: 1
        };
    }
    function rowStyle(row, index) {
        var classes = ['active', 'success', 'info', 'warning', 'danger'];

        if (index % 2 === 0 && index / 2 < classes.length) {
            return {
                classes: classes[index / 2]
            };
        }
        return {};
    }
</script>
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
