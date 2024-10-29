package com.onlinesite.onlinesite;

import com.onlinesite.onlinesite.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;

@WebServlet(name = "GetProductsOrder", urlPatterns = {"/GetProductsOrder"})
public class get_product_order extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Creating Session
        HttpSession hs = request.getSession();
        int order_no = 1000;
        int orderInfo = 0;
        int orderItems=0;
        int orderCustInfo=0;
        //Getting all the parameters from the user
        int paymentId = Integer.parseInt(request.getParameter("payment_id"));
        String customerName = request.getParameter("name");
        String mobile_number = request.getParameter("phone");
        String email_id = request.getParameter("email");
        String address = request.getParameter("address");
        String address_type = request.getParameter("addressType");
        String pincode = request.getParameter("pincode");
        String product_name = null;
        int quantity = 0;
        String product_price = null;
        String product_selling_price = null;
        String product_total_price = null;
        String order_status = null;
        String payment_mode = request.getParameter("payment");
        HttpSession session = request.getSession();
        //Storing payment attrbute in session
        session.setAttribute("paymentId", paymentId);

        try {
            //Getting maximum column of "orders" table
            ResultSet rsMaxOrderNo = Connect_to_sql.getResultFromSqlQuery("select max(order_no) from orders natural join orders_custinfo natural join orders_item");
            if (rsMaxOrderNo.next()) {
                order_no = rsMaxOrderNo.getInt(1);
                order_no = 1000 + order_no;
            }
            //Getting all the orders from the database
            ResultSet totalProduct = Connect_to_sql.getResultFromSqlQuery("select product.image_name,product.name,cart.quantity,cart.ori_price,cart.discount_price,cart.total_price,cart.product_id from product,cart where product.id=cart.product_id and customer_id='"
                    + session.getAttribute("id") + "' ");
            while (totalProduct.next()) {
                order_no++;
                String image_name = totalProduct.getString(1);
                product_name = totalProduct.getString(2);
                quantity = totalProduct.getInt(3);
                product_price = totalProduct.getString(4);
                product_selling_price = totalProduct.getString(5);
                product_total_price = totalProduct.getString(6);
                order_status = "Pending";
                //Inserting product details inside the table
                orderInfo = Connect_to_sql.insertUpdateFromSqlQuery(
                        "insert into orders(order_no,email_id,order_status,payment_mode,payment_id) values('"
                                + order_no + "','" + email_id + "','" + order_status + "','" + payment_mode + "','" + paymentId + "')");
                orderItems = Connect_to_sql.insertUpdateFromSqlQuery(
                        "insert into orders_item(order_no,image,product_name,quantity,product_price,product_selling_price,product_total_price) values('"
                                + order_no + "','" + image_name + "','" + product_name + "','" + quantity + "','" + product_price + "','"
                                + product_selling_price + "','" + product_total_price + "')");
                orderCustInfo = Connect_to_sql.insertUpdateFromSqlQuery(
                        "insert into orders_custinfo(email_id,customer_name,mobile_number,address,address_type,pincode) values('" + email_id + "','" + customerName + "'," +
                                "'" + mobile_number + "','" + address + "','" + address_type + "','" + pincode + "')");
            }
            Connect_to_sql.insertUpdateFromSqlQuery("delete from cart where customer_id='" + session.getAttribute("id") + "'");
            if (orderInfo > 0 && orderItems>0 && orderCustInfo>0) {
                //Sending response back to the user/customer
                String message = "Thank you for your order.";
                hs.setAttribute("success", message);
                response.sendRedirect("checkout_page.jsp");
            } else {
                response.sendRedirect("checkout_page.jsp");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
