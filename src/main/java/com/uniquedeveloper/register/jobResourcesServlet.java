package com.uniquedeveloper.register;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/job_resources")
public class jobResourcesServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("submit".equals(action)) {
            addCompanyProfile(request.getParameter("company_name"), request.getParameter("location"),
                    request.getParameter("additional_info"));
        } else if ("update".equals(action)) {
            updateCompanyProfile(
                    Integer.parseInt(request.getParameter("id")),
                    request.getParameter("edited_company_name"),
                    request.getParameter("edited_location"),
                    request.getParameter("edited_additional_info")
            );
        } else if ("delete".equals(action)) {
            deleteCompanyProfile(Integer.parseInt(request.getParameter("id")));
        }

        response.sendRedirect("job_resources.jsp");
    }

    private void addCompanyProfile(String companyName, String location, String additionalInfo) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/smart_city_db?serverTimezone=UTC", "root", "MouadJG@1964");

            String sql = "INSERT INTO company_profile (company_name, location, additional_info) VALUES (?, ?, ?)";
            PreparedStatement pstmt = con.prepareStatement(sql);

            pstmt.setString(1, companyName);
            pstmt.setString(2, location);
            pstmt.setString(3, additionalInfo);

            pstmt.executeUpdate();

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void updateCompanyProfile(int id, String companyName, String location, String additionalInfo) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/smart_city_db?serverTimezone=UTC", "root", "MouadJG@1964");

            String sql = "UPDATE company_profile SET company_name=?, location=?, additional_info=? WHERE id=?";
            PreparedStatement pstmt = con.prepareStatement(sql);

            pstmt.setString(1, companyName);
            pstmt.setString(2, location);
            pstmt.setString(3, additionalInfo);
            pstmt.setInt(4, id);

            pstmt.executeUpdate();

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void deleteCompanyProfile(int id) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/smart_city_db?serverTimezone=UTC", "root", "MouadJG@1964");

            String sql = "DELETE FROM company_profile WHERE id = ?";
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, id);

            pstmt.executeUpdate();

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
