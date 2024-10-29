<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.onlinesite.onlinesite.*"%>
<%@ page import="java.sql.*"%>
<%
  int id = Integer.parseInt(request.getParameter("id"));
  int deleteProduct = Connect_to_sql.insertUpdateFromSqlQuery("delete from product where id='" + id + "' ");
  if (deleteProduct > 0) {
    response.sendRedirect("viewproducts_admin.jsp");
  } else {
    response.sendRedirect("viewproducts_admin.jsp");
  }
%>