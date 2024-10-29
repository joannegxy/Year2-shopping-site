package com.onlinesite.onlinesite;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/AddCustomer")
public class customer_registration extends HttpServlet
{

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {

        //Retrieving values from the frontend
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String mobile = request.getParameter("mobile");
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");
        String pincode = request.getParameter("pincode");

        //Creating Session
        HttpSession hs = request.getSession();

        //Inserting all values inside the database
        try
        {
            //Connecting database connection and querying in the database
            int addCustomer = Connect_to_sql.insertUpdateFromSqlQuery("insert into customer(address,email,gender,name,password,phone,pin_code)values('" + address + "','" + email + "','" + gender + "','" + name + "','" + password + "','"
                    + mobile + "','" + pincode + "')");

            //If customer registered successfully in java online shopping system
            if (addCustomer > 0)
            {
                String message = "Customer register successfully.";
                //Passing message via session.
                hs.setAttribute("success-message", message);
                //Sending response back to the user/customer
                response.sendRedirect("registerpage_customer.jsp");
            }
            else
            {
                //If customer fails to register
                String message = "Customer registration fail";
                //Passing message via session.
                hs.setAttribute("fail-message", message);
                //Sending response back to the user/customer
                response.sendRedirect("registerpage_customer.jsp");
            }
        }
        catch (Exception ex)
        {
            ex.printStackTrace();
        }
    }
}