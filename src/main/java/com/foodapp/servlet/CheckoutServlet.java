package com.foodapp.servlet;

import java.io.IOException;
import java.sql.Timestamp;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.foodapp.model.*;
import com.foodapp.daoimpl.*;

@WebServlet("/CheckoutServlet")
public class CheckoutServlet extends HttpServlet {
	
	

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
    	
    	System.out.println("CheckoutServlet HIT");

        HttpSession session = req.getSession();

        Cart cart = (Cart) session.getAttribute("cart");
        User user = (User) session.getAttribute("user");
        Integer restaurantId = (Integer) session.getAttribute("restaurantId");

        String paymentMethod = req.getParameter("paymentMethod");
        String address = req.getParameter("address");

        if (user != null) {

            if (cart != null && !cart.getItems().isEmpty()) {

                double totalAmount = 0;

                for (CartItem item : cart.getItems().values()) {
                    totalAmount += item.getPrice() * item.getQuantity();
                }

                Orders order = new Orders(
                        user.getUserId(),
                        restaurantId,
                        new Timestamp(System.currentTimeMillis()),
                        totalAmount,
                        "pending",
                        paymentMethod
                );

                OrdersDAOImpl orderDAOImpl = new OrdersDAOImpl();
                int orderId = orderDAOImpl.insertOrder(order);               

                OrderItemDAOImpl orderItemDAOImpl = new OrderItemDAOImpl();

                for (CartItem item : cart.getItems().values()) {

                    int menuId = item.getId();
                    double price = item.getPrice();
                    int quantity = item.getQuantity();

                    double totalPrice = price * quantity;

                    OrderItem orderItem = new OrderItem(
                            orderId,
                            menuId,
                            quantity,
                            totalPrice
                    );

                    boolean insertOrderItem = orderItemDAOImpl.insertOrderItem(orderItem);
                    System.out.println(insertOrderItem);
                }

                session.removeAttribute("cart");

                resp.sendRedirect("order-success.jsp");

            } else {
                resp.sendRedirect("cart.jsp");
            }

        } else {
            resp.sendRedirect("Login.jsp");
        }
    }
}