package com.uniquedeveloper.register;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private Connection con;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String first_name = request.getParameter("first_name");
        String last_name = request.getParameter("last_name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String account_type = request.getParameter("account_type");
        RequestDispatcher dispatcher = null;
        Connection con1 = null;

        // Validate that 'first_name' is not null or empty
        if (first_name == null || first_name.trim().isEmpty()) {
            // Handle the error, for example, redirect to an error page
            dispatcher = request.getRequestDispatcher("error.jsp");
            request.setAttribute("errorMessage", "First name cannot be null or empty");
            dispatcher.forward(request, response);
            return; // Stop the execution of the method
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/smart_city_db?serverTimezone=UTC", "root",
                    "MouadJG@1964");
            PreparedStatement pst = con1
                    .prepareStatement("insert into users(first_name, last_name, email, password, account_type) values(?, ?, ?, ?, ?)");
            pst.setString(1, first_name);
            pst.setString(2, last_name);
            pst.setString(3, email);
            pst.setString(4, password);
            pst.setString(5, account_type);

            int rowCount = pst.executeUpdate();
            dispatcher = request.getRequestDispatcher("register.jsp");
            if (rowCount > 0) {
                request.setAttribute("status", "success");
            } else {
                request.setAttribute("status", "failed");
            }
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (con1 != null) {
                    con1.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
