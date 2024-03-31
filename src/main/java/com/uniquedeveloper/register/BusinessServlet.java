package com.uniquedeveloper.register;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/BusinessServlet")
public class BusinessServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String newsDescription = request.getParameter("newsDescription");
        String newsTitle = request.getParameter("newsTitle");
        String newsImage = request.getParameter("newsImage");
        String businessEvents = request.getParameter("businessEvents");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/smart_city_db?serverTimezone=UTC", "root", "MouadJG@1964");

            String query = "INSERT INTO business_info (news_description, news_title, news_image, business_events) VALUES (?, ?, ?, ?)";
            try (PreparedStatement pst = con.prepareStatement(query)) {
                pst.setString(1, newsDescription);
                pst.setString(2, newsTitle);
                pst.setString(3, newsImage);
                pst.setString(4, businessEvents);

                pst.executeUpdate();
            }

            con.close();
            response.sendRedirect("business.jsp"); // Redirect to the info page after insertion
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp"); // Redirect to error page in case of an exception
        }
    }
}
