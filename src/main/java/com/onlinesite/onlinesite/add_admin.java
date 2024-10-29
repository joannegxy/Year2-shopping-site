package com.onlinesite.onlinesite;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/add_admin")
public class add_admin extends HttpServlet
{

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        //Creating Session
        HttpSession hs = request.getSession();

        //Retrieving values from the frontend
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String name = request.getParameter("name");

        //Inserting all values inside the database
        try
        {
            //Connecting database connection and querying in the database
            String sql="INSERT INTO admin(email,password,name) VALUES('"+email+"','"+password+"','"+name+"')";
            int addAdmin = Connect_to_sql.insertUpdateFromSqlQuery(sql);

            //If customer registered successfully in java online shopping system
            if (addAdmin > 0)
            {
                String message = "Admin register successfully.";
                //Passing message via session.
                hs.setAttribute("success-message", message);
                //Sending response back to the user/customer
                response.sendRedirect("add_admin.jsp");
            }
            else
            {
                //If customer fails to register
                String message = "Admin registration fail";
                //Passing message via session.
                hs.setAttribute("fail-message", message);
                //Sending response back to the user/customer
                response.sendRedirect("add_admin.jsp");
            }
        }
        catch (Exception ex)
        {
            ex.printStackTrace();
            request.setAttribute("message", " Failed due to " + ex);
        }

    }
}
