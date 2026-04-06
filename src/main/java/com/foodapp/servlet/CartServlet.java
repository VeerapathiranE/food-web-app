package com.foodapp.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.foodapp.model.Cart;
import com.foodapp.model.CartItem;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");

        if (cart == null) {
            cart = new Cart();
        }

        String action = request.getParameter("action");

        // ✅ ADD TO CART (from menu.jsp)
        if (action == null) {

            int menuId = Integer.parseInt(request.getParameter("menuId"));
            String name = request.getParameter("name");
            double price = Double.parseDouble(request.getParameter("price"));

            CartItem item = new CartItem(menuId, name, price, 1);
            cart.addItem(item);

            session.setAttribute("cart", cart);

            // ✅ IMPORTANT CHANGE → go to cart page
            response.sendRedirect("cart.jsp");
            return;
        }
        	
     // ✅ HANDLE CLEAR CART FIRST
        if ("clear".equals(action)) {
            cart.clear();
            session.setAttribute("cart", cart);
            response.sendRedirect("cart.jsp");
            return;
        }
        // ✅ FROM CART PAGE
        int id = Integer.parseInt(request.getParameter("id"));

        CartItem foundItem = null;
        for (CartItem i : cart.getAllItems()) {
            if (i.getId() == id) {
                foundItem = i;
                break;
            }
        }

        if (foundItem != null) {

            if (action.equals("increase")) {
                cart.updateItemQuantity(id, foundItem.getQuantity() + 1);

            } else if (action.equals("decrease")) {

                // ✅ IMPORTANT FIX → remove when quantity = 1
                if (foundItem.getQuantity() > 1) {
                    cart.updateItemQuantity(id, foundItem.getQuantity() - 1);
                } else {
                    cart.removeItem(id);
                }

            } else if (action.equals("clear")) {
                cart.clear();
            }
        }

        session.setAttribute("cart", cart);

        response.sendRedirect("cart.jsp");
    }
}