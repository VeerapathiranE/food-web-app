package com.foodapp.servlet;

import java.io.IOException;

import org.mindrot.jbcrypt.BCrypt;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.foodapp.dao.UserDAO;
import com.foodapp.daoimpl.UserDAOImpl;
import com.foodapp.model.User;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String role = "customer";
        
        String hashpassword=BCrypt.hashpw(password, BCrypt.gensalt());

        User user = new User(username, hashpassword, email, phone, address, role);

        UserDAO dao = new UserDAOImpl();

        boolean status = dao.insertUser(user);

        if (status) {
            response.sendRedirect("Login.jsp");
        } else {
            response.getWriter().println("Registration Failed");
        }
    }
}