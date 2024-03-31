package com.uniquedeveloper.register;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/attractions")
public class AttractionServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("submit".equals(action)) {
            addAttractionProfile(request);
        } else if ("update".equals(action)) {
            updateAttractionProfile(request);
        } else if ("delete".equals(action)) {
            deleteAttractionProfile(request);
        }

        // Redirect to the attractions.jsp page
        response.sendRedirect("attractions.jsp");
    }

    private void addAttractionProfile(HttpServletRequest request) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/smart_city_db?serverTimezone=UTC", "root", "MouadJG@1964");

            String sql = "INSERT INTO attractions (attraction_name, location, description) VALUES (?, ?, ?)";
            PreparedStatement pstmt = con.prepareStatement(sql);

            pstmt.setString(1, request.getParameter("attraction_name"));
            pstmt.setString(2, request.getParameter("location"));
            pstmt.setString(3, request.getParameter("description"));

            pstmt.executeUpdate();

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void updateAttractionProfile(HttpServletRequest request) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/smart_city_db?serverTimezone=UTC", "root", "MouadJG@1964");

            String sql = "UPDATE attractions SET attraction_name=?, location=?, description=? WHERE id=?";
            PreparedStatement pstmt = con.prepareStatement(sql);

            pstmt.setString(1, request.getParameter("edited_attraction_name"));
            pstmt.setString(2, request.getParameter("edited_location"));
            pstmt.setString(3, request.getParameter("edited_description"));
            pstmt.setInt(4, Integer.parseInt(request.getParameter("id")));

            pstmt.executeUpdate();

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void deleteAttractionProfile(HttpServletRequest request) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/smart_city_db?serverTimezone=UTC", "root", "MouadJG@1964");

            String sql = "DELETE FROM attractions WHERE id = ?";
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, Integer.parseInt(request.getParameter("id")));

            pstmt.executeUpdate();

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
