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

@WebServlet("/library")
public class LibraryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("submit".equals(action)) {
            addLibraryProfile(request.getParameter("library_name"), request.getParameter("location"),
                    request.getParameter("additional_info"));
        } else if ("update".equals(action)) {
            updateLibraryProfile(Integer.parseInt(request.getParameter("id")),
                    request.getParameter("library_name"), request.getParameter("location"),
                    request.getParameter("additional_info"));
        } else if ("delete".equals(action)) {
            deleteLibraryProfile(Integer.parseInt(request.getParameter("id")));
        }

        response.sendRedirect("library.jsp");
    }

    private void addLibraryProfile(String libraryName, String location, String additionalInfo) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/smart_city_db?serverTimezone=UTC", "root", "MouadJG@1964");

            String sql = "INSERT INTO library (library_name, location, additional_info) VALUES (?, ?, ?)";
            PreparedStatement pstmt = con.prepareStatement(sql);

            pstmt.setString(1, libraryName);
            pstmt.setString(2, location);
            pstmt.setString(3, additionalInfo);

            pstmt.executeUpdate();

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void updateLibraryProfile(int id, String libraryName, String location, String additionalInfo) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/smart_city_db?serverTimezone=UTC", "root", "MouadJG@1964");

            String sql = "UPDATE library SET library_name=?, location=?, additional_info=? WHERE id=?";
            PreparedStatement pstmt = con.prepareStatement(sql);

            pstmt.setString(1, libraryName);
            pstmt.setString(2, location);
            pstmt.setString(3, additionalInfo);
            pstmt.setInt(4, id);

            pstmt.executeUpdate();

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void deleteLibraryProfile(int id) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/smart_city_db?serverTimezone=UTC", "root", "MouadJG@1964");

            String sql = "DELETE FROM library WHERE id = ?";
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, id);

            pstmt.executeUpdate();

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
