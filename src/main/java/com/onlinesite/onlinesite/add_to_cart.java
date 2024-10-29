package com.onlinesite.onlinesite;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/AddToCart")
public class add_to_cart extends HttpServlet
{

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {

        int id = 0;

        //Getting all the parameters from the user
        int productId = Integer.parseInt(request.getParameter("productId"));
        String price = request.getParameter("price");
        String ori_price = request.getParameter("ori_price");
        HttpSession hs = request.getSession();
        try
        {
            //If user session is null user have to re-login
            if ((String) hs.getAttribute("name") == null)
            {
                response.sendRedirect("login_customer.jsp");
                //Inserting cart details to the database
            }
            else
            {
                int customerId = (int) hs.getAttribute("id");
                //Querying to the database.
                int addToCart = Connect_to_sql.insertUpdateFromSqlQuery("insert into cart values('" + id + "','" + price + "',1,'" + price + "','" + customerId + "','" + productId + "','" + ori_price + "')");
                if (addToCart > 0)
                {
                    response.sendRedirect("viewallproducts_customer.jsp");
                }
            }

        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
}