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

@WebServlet("/update_tourism")
public class UpdateTourismServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/smart_city_db?serverTimezone=UTC", "root", "MouadJG@1964");

            String id = request.getParameter("id");
            String restaurantDescription = request.getParameter("restaurant_description");
            String restaurantLocation = request.getParameter("restaurant_location");
            String specialOffersEvents = request.getParameter("special_offers_events");
            String websiteUrl = request.getParameter("website_url");

            String query = "UPDATE tourism SET restaurant_description=?, restaurant_location=?, special_offers_events=?, website_url=? WHERE id=?";
            try (PreparedStatement pst = con.prepareStatement(query)) {
                pst.setString(1, restaurantDescription);
                pst.setString(2, restaurantLocation);
                pst.setString(3, specialOffersEvents);
                pst.setString(4, websiteUrl);
                pst.setString(5, id);
                pst.executeUpdate();
            }

            con.close();
            response.sendRedirect("tourism.jsp"); // Redirect to the tourism page after updating
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp"); // Redirect to error page in case of an exception
        }
    }
}
