<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.onlinesite.onlinesite.*"%>
<%@ page import="java.sql.*"%>
<%
    //Getting all the inputs from the customer
    int id = (int)session.getAttribute("id");
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String phone = request.getParameter("phone");
    String gender=(String)session.getAttribute("gender");
    String address = request.getParameter("address");
    String pin_code = request.getParameter("pin_code");
    //Querying to the database
    int updateProduct = Connect_to_sql.insertUpdateFromSqlQuery("update customer set name='" + name + "',email='" + email + "',password='" + password + "',phone='" + phone + "',gender='" + gender + "',address='" + address + "',pin_code='" + pin_code + "' where id='" + id + "'");
    if (updateProduct > 0) {
        response.sendRedirect("editaccinfo_customer.jsp");
    } else {
        response.sendRedirect("editaccinfo_customer.jsp");
    }
%>
