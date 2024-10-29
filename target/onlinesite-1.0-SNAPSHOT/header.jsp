<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!-- Defining Header for the user/customer -->

<div class="collapse navbar-collapse menu--shylock" id="bs-example-navbar-collapse-1">
  <ul class="nav navbar-nav menu__list">
    <li class="menu__item"><a class="menu__link" href="index.jsp">Home <span class="sr-only">(current)</span></a></li>
    <li class=" menu__item"><a class="menu__link" href="viewallproducts_customer.jsp">Products</a></li>
    <%
      if ((String) session.getAttribute("name") != null) {
    %>
    <li class="menu__item"><a class="menu__link" href="editaccinfo_customer.jsp">Edit Acc Info</a></li>
    <li class="menu__item"><a class="menu__link" href="ownorders_customer.jsp">My Orders</a></li>
    <li class="menu__item"><a class="menu__link" href="logout_customer.jsp">Logout</a></li>
    <%
    } else {
    %>
    <li class="menu__item"><a class="menu__link" href="login_customer.jsp">Customer Login</a></li>
    <li class="menu__item"><a class="menu__link" href="registerpage_customer.jsp">Customer Register</a></li>
    <li class="menu__item"><a class="menu__link" href="login_admin.jsp">Admin Login</a></li>
    <%
      }
    %>
  </ul>
  <div class="navbar-search-cust">
    <div class="search-container">
      <form action="search_for_product_customer.jsp">
        <input type="text" placeholder="Search for product name..." name="search">
        <button type="submit"><i class="fa fa-search"></i></button>
      </form>
    </div>
  </div>
</div>
