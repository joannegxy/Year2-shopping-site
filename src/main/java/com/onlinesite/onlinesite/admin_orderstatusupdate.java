package com.onlinesite.onlinesite;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/CustomerProductsOrderStatus")
public class admin_orderstatusupdate extends HttpServlet
{

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        try
        {
            int statusMode = 0;
            //Taking input from admin order-id to get the order status from the database of online shopping system in Java
            ResultSet rs = Connect_to_sql.getResultFromSqlQuery("select order_status from orders natural join orders_custinfo natural join orders_item where order_no='" + request.getParameter("orderId") + "'");
            while (rs.next())
            {
                if (rs.getString(1).equals("Deliver"))
                {
                    statusMode = Connect_to_sql.insertUpdateFromSqlQuery("update orders set order_status='Pending' where order_no='" + request.getParameter("orderId") + "'");
                }
                else
                {
                    statusMode = Connect_to_sql.insertUpdateFromSqlQuery("update orders set order_status='Deliver' where order_no='" + request.getParameter("orderId") + "'");
                }
            }
            if (statusMode > 0)
            {
                //Sending response back to admin-all-orders.jsp page when sql query executed successfully
                response.sendRedirect("vieworders_admin.jsp");
            }
            else
            {
                //Sending response back to admin-all-orders.jsp page
                response.sendRedirect("vieworders_admin.jsp");
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
}
