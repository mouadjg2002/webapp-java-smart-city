package com.uniquedeveloper.register;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/delete_job_application")
public class DeleteJobApplicationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/smart_city_db?serverTimezone=UTC", "root", "MouadJG@1964");

            String id = request.getParameter("id");
            String query = "DELETE FROM job_application WHERE id = ?";
            try (PreparedStatement pst = con.prepareStatement(query)) {
                pst.setString(1, id);
                pst.executeUpdate();
            }

            con.close();
            response.sendRedirect("job_application.jsp"); // Redirect to the job application page after deletion
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            // Handle the exception as needed
            response.sendRedirect("error.jsp");
        }
    }
}
