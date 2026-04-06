package com.foodapp.servlet;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.foodapp.dao.MenuDAO;
import com.foodapp.daoimpl.MenuDAOImpl;
import com.foodapp.model.Menu;

@WebServlet("/menu")
public class MenuServlet extends HttpServlet {

    private MenuDAO menuDAO;

    @Override
    public void init() {
        menuDAO = new MenuDAOImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Get restaurantId from URL
        int restaurantId = Integer.parseInt(request.getParameter("restaurantId"));
        
        HttpSession session = request.getSession();
        session.setAttribute("restaurantId", restaurantId);

        // 2. Fetch menus based on restaurantId
        List<Menu> menuList = menuDAO.getMenuByRestaurantId(restaurantId);

        // 3. Send to JSP
        request.setAttribute("menus", menuList);

        request.getRequestDispatcher("menu.jsp").forward(request, response);
    }
}