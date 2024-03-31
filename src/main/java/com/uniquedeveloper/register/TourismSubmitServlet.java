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

@WebServlet("/tourism_submit")
public class TourismSubmitServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String restaurantDescription = request.getParameter("restaurant_description");
        String restaurantLocation = request.getParameter("restaurant_location");
        String specialOffersEvents = request.getParameter("special_offers_events");
        String websiteUrl = request.getParameter("website_url");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smart_city_db?serverTimezone=UTC",
                    "root", "MouadJG@1964");
            String insertQuery = "INSERT INTO tourism (restaurant_description, restaurant_location, special_offers_events, website_url) VALUES (?, ?, ?, ?)";
            PreparedStatement pst = con.prepareStatement(insertQuery);
            pst.setString(1, restaurantDescription);
            pst.setString(2, restaurantLocation);
            pst.setString(3, specialOffersEvents);
            pst.setString(4, websiteUrl);

            int rowsAffected = pst.executeUpdate();
            if (rowsAffected > 0) {
                response.sendRedirect("tourism.jsp");
            } else {
                response.sendRedirect("error.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
