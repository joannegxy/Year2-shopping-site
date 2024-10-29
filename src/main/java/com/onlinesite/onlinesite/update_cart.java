package com.onlinesite.onlinesite;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.*;

@WebServlet("/UpdateProductQuantity")
public class update_cart extends HttpServlet
{

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        //Getting all the data from the user/cutomer
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        int productId = Integer.parseInt(request.getParameter("productId"));
        HttpSession session = request.getSession();
        String discount_price = null;
        Double productPrice = 0.0;
        try
        {
            //Querying to database
            ResultSet rs = Connect_to_sql.getResultFromSqlQuery("select discount_price from cart where customer_id='" + session.getAttribute("id") + "' and product_id='" + productId + "'");
            while (rs.next())
            {
                //Getting data
                discount_price = rs.getString("discount_price");
                //Converting into double from string
                productPrice = Double.parseDouble(discount_price);
            }
            productPrice = productPrice * quantity;
            //Update Query for updating product quantity
            int updateQuantity = Connect_to_sql.insertUpdateFromSqlQuery("update cart set quantity='" + quantity + "',total_price='" + productPrice + "' where customer_id='" + session.getAttribute("id") + "' and product_id='" + productId + "' ");
            //If cart of online shopping systemis sucessfully updated
            if (updateQuantity > 0)
            {
                //Sending response back to the user/customer.
                response.sendRedirect("checkout_page.jsp");
                //If cart is not updated
            }
            else
            {
                //Sending response back to the user/customer.
                response.sendRedirect("checkout_page.jsp");
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
}