package com.uniquedeveloper.register;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/student_submit")
public class StudentSubmitServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String academicInfo = request.getParameter("academic_info");
        String schoolName = request.getParameter("school_name");
        String schoolLocation = request.getParameter("school_location");
        String upcomingEvents = request.getParameter("upcoming_events");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smart_city_db?serverTimezone=UTC",
                    "root", "MouadJG@1964");
            String insertQuery = "INSERT INTO student (academic_info, school_name, school_location, upcoming_events) VALUES (?, ?, ?, ?)";
            PreparedStatement pst = con.prepareStatement(insertQuery);
            pst.setString(1, academicInfo);
            pst.setString(2, schoolName);
            pst.setString(3, schoolLocation);
            pst.setString(4, upcomingEvents);

            int rowsAffected = pst.executeUpdate();
            if (rowsAffected > 0) {
                response.sendRedirect("student.jsp");
            } else {
                response.sendRedirect("error.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
