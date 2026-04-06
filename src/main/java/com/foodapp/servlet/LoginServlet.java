package com.foodapp.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;

import org.mindrot.jbcrypt.BCrypt;

import com.foodapp.dao.UserDAO;
import com.foodapp.daoimpl.UserDAOImpl;
import com.foodapp.model.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/callingLoginServlet")
public class LoginServlet extends HttpServlet {

    int count = 3;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String useremail = request.getParameter("useremail");
        String password = request.getParameter("password");

        UserDAO dao = new UserDAOImpl();
        User user = dao.getUserByEmail(useremail);

        if(user != null && BCrypt.checkpw(password, user.getPassword())) {

            count = 3;
            	
             PrintWriter out = response.getWriter();
            
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            
            Timestamp loginTime = new Timestamp(System.currentTimeMillis());
            dao.updateLastLogin(user.getUserId(), loginTime);
            
//            out.print("Welcome back, [" + useremail+ "]! You have successfully signed in.");

            response.sendRedirect("restaurants");

        } else {

            count--;

            if(count > 0){
                request.setAttribute("msg",
                        "Invalid Password. Remaining Attempts: " + count + " of 3");
            } else {
                request.setAttribute("msg","Account Blocked Contact Admin");
            }

            RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
            rd.forward(request, response);
        }
    }
}