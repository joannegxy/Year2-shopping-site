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
                    <a href="javascript:;" class="simpleCart_empty">My Cart</a>
                </p>
            </div>
        </div>
        <div class="top_nav_left">
            <nav class="navbar navbar-default">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed"
                                data-toggle="collapse"
                                data-target="#bs-example-navbar-collapse-1"
                                aria-expanded="false">
                            <span class="sr-only">Toggle navigation</span> <span
                                class="icon-bar"></span> <span class="icon-bar"></span> <span
                                class="icon-bar"></span>
                        </button>
                    </div>
                    <jsp:include page="header.jsp"></jsp:include>
                </div>
            </nav>
        </div>
        <div class="clearfix"></div>
    </div>
</div>
<%
    String search=request.getParameter("search");
%>
<div class="page-head">
    <div class="container">
        <h3> Search Results</h3>
    </div>
</div>
<br/>
<div class="electronics">
    <div class="container">
        <div class="clearfix"></div>
        <div class="ele-bottom-grid">
            <%
                String sql="select * from product where name like '%" +search+ "%'";
                ResultSet retriveProduct = Connect_to_sql.getResultFromSqlQuery(sql);
                while (retriveProduct.next()) {
            %>
            <form action="AddToCart" method="post">
                <div class="col-md-3 product-men">
                    <div class="men-pro-item simpleCart_shelfItem">
                        <div class="men-thumb-item">
                            <input type="hidden" name="productId" value="<%=retriveProduct.getInt("id")%>">
                            <img src="uploads/<%=retriveProduct.getString("image_name")%>" alt="" class="pro-image-front">
                            <img src="uploads/<%=retriveProduct.getString("image_name")%>" alt="" class="pro-image-back"> <span class="product-new-top">New</span>
                        </div>
                        <div class="item-info-product ">
                            <h4>
                                <%=retriveProduct.getString("name")%>
                            </h4>
                            <h5>
                                Category: <%=retriveProduct.getString("product_category")%>
                            </h5>
                            <div class="info-product-price">
                                <input type="hidden" name="price" value="<%=retriveProduct.getString("price")%>">
                                <input type="hidden" name="ori_price" value="<%=retriveProduct.getString("ori_price")%>"> <span class="item_price"><%=retriveProduct.getString("price")%></span>
                                <del><%=retriveProduct.getString("ori_price")%></del>
                            </div>
                            <input type="submit" value="Add to cart" class="btn btn-warning" onclick="return confirm('Are you sure Do you want to add this item in cart?');">
                        </div>
                    </div>
                </div>
            </form>
            <%
                }
            %>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>