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

@WebServlet("/edit_job_application")
public class EditJobApplicationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Retrieve data from the form
            int id = Integer.parseInt(request.getParameter("id"));
            String jobDescription = request.getParameter("job_description");
            String jobLocation = request.getParameter("job_location");
            String jobImage = request.getParameter("job_image");
            String skillsQualifications = request.getParameter("skills_qualifications");

            // Update the record in the database
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/smart_city_db?serverTimezone=UTC", "root", "MouadJG@1964");

            String query = "UPDATE job_application SET job_description=?, job_location=?, job_image=?, skills_qualifications=? WHERE id=?";
            try (PreparedStatement pst = con.prepareStatement(query)) {
                pst.setString(1, jobDescription);
                pst.setString(2, jobLocation);
                pst.setString(3, jobImage);
                pst.setString(4, skillsQualifications);
                pst.setInt(5, id);
                pst.executeUpdate();
            }

            con.close();

            // Redirect back to the job_application.jsp page
            response.sendRedirect("job_application.jsp");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            // Handle the exception as needed, or leave it empty
        }
    }
}
