package com.uniquedeveloper.register;

import java.io.*;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/edit_student")
public class EditStudentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/smart_city_db?serverTimezone=UTC", "root", "MouadJG@1964");

            int id = Integer.parseInt(request.getParameter("id"));
            String academicInfo = request.getParameter("academic_info");
            String schoolName = request.getParameter("school_name");
            String schoolLocation = request.getParameter("school_location");
            String upcomingEvents = request.getParameter("upcoming_events");

            String query = "UPDATE student SET academic_info=?, school_name=?, school_location=?, upcoming_events=? WHERE id=?";
            try (PreparedStatement pst = con.prepareStatement(query)) {
                pst.setString(1, academicInfo);
                pst.setString(2, schoolName);
                pst.setString(3, schoolLocation);
                pst.setString(4, upcomingEvents);
                pst.setInt(5, id);
                pst.executeUpdate();
            }

            con.close();

            // Redirect back to the student.jsp page
            response.sendRedirect("student.jsp");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }
    }
}

