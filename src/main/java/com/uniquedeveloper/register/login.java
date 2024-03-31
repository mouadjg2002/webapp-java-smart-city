package com.uniquedeveloper.register;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        HttpSession session = request.getSession();
        RequestDispatcher dispatcher = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smart_city_db?serverTimezone=UTC",
                    "root", "MouadJG@1964");
            PreparedStatement pst = con.prepareStatement("SELECT * FROM users WHERE email = ? AND password = ?");
            pst.setString(1, email);
            pst.setString(2, password);

            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                // Set user information in session
                session.setAttribute("name", rs.getString("first_name"));
                session.setAttribute("category", rs.getString("account_type"));

                // Redirect based on category
                String category = rs.getString("account_type");
                if ("student".equals(category)) {
                    dispatcher = request.getRequestDispatcher("student_info.jsp");
                } else if ("tourist".equals(category)) {
                    dispatcher = request.getRequestDispatcher("tourism_info.jsp");
                } else if ("businessman".equals(category)) {
                    dispatcher = request.getRequestDispatcher("business_info.jsp");
                } else if ("jobseeker".equals(category)) {
                    dispatcher = request.getRequestDispatcher("job_application_info.jsp");
                } else if ("admin".equals(category)) {
                    dispatcher = request.getRequestDispatcher("admin.jsp");
                } else {
                    // Handle the case when category is not recognized
                    dispatcher = request.getRequestDispatcher("error.jsp");
                    request.setAttribute("errorMessage", "Invalid user category");
                }
            } else {
                request.setAttribute("status", "failed");
                dispatcher = request.getRequestDispatcher("login.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            dispatcher = request.getRequestDispatcher("error.jsp");
            request.setAttribute("errorMessage", "Error processing login");
        }

        dispatcher.forward(request, response);
    }
}
