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

@WebServlet("/edit_business")
public class EditBusinessServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    try {
	        // Retrieve data from the form
	        int id = Integer.parseInt(request.getParameter("id"));
	        String newsTitle = request.getParameter("newsTitle");
	        String newsDescription = request.getParameter("newsDescription");
	        String newsImage = request.getParameter("newsImage");
	        String businessEvents = request.getParameter("businessEvents");

	        // Update the record in the database
	        Class.forName("com.mysql.cj.jdbc.Driver");
	        Connection con = DriverManager.getConnection(
	                "jdbc:mysql://localhost:3306/smart_city_db?serverTimezone=UTC", "root", "MouadJG@1964");

	        String query = "UPDATE business_info SET news_title=?, news_description=?, news_image=?, business_events=? WHERE id=?";
	        try (PreparedStatement pst = con.prepareStatement(query)) {
	            pst.setString(1, newsTitle);
	            pst.setString(2, newsDescription);
	            pst.setString(3, newsImage);
	            pst.setString(4, businessEvents);
	            pst.setInt(5, id);
	            pst.executeUpdate();
	        }

	        con.close();
	        
	        // Redirect back to the business.jsp page
	        response.sendRedirect("business.jsp");
	    } catch (ClassNotFoundException | SQLException e) {
	        e.printStackTrace();
	        // Handle the exception as needed, or leave it empty
	    }
	}


}
