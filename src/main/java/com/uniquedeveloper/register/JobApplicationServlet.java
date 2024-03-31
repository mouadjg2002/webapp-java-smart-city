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

@WebServlet("/job_application_submit")
public class JobApplicationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String jobDescription = request.getParameter("job_description");
        String jobLocation = request.getParameter("job_location");
        String jobImage = request.getParameter("job_image");
        String skillsQualifications = request.getParameter("skills_qualifications");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smart_city_db?serverTimezone=UTC",
                    "root", "MouadJG@1964");
            String insertQuery = "INSERT INTO job_application (job_description, job_location, job_image, skills_qualifications) VALUES (?, ?, ?, ?)";
            PreparedStatement pst = con.prepareStatement(insertQuery);
            pst.setString(1, jobDescription);
            pst.setString(2, jobLocation);
            pst.setString(3, jobImage);
            pst.setString(4, skillsQualifications);

            int rowsAffected = pst.executeUpdate();
            if (rowsAffected > 0) {
                response.sendRedirect("job_application.jsp");
            } else {
                response.sendRedirect("error.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
