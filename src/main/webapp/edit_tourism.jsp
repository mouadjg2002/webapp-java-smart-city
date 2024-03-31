<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Your existing styles and meta tags -->
    <title>Edit Tourism Record</title>
</head>
<style>
    body {
        margin: 0;
        font-family: 'Arial', sans-serif;
        background-color: #f0f0f0;
    }

    .module-container {
        text-align: center;
        margin: 100px auto;
        padding: 20px;
        background-color: #ffffff;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        width: 80%;
    }

    h1 {
        color: #333333;
    }

    .input-field {
        margin: 15px;
        padding: 10px;
        width: calc(100% - 30px);
        box-sizing: border-box;
    }

    textarea {
        height: 100px;
    }

    .submit-button {
        padding: 15px 30px;
        font-size: 16px;
        border: none;
        border-radius: 5px;
        background-color: #3498db;
        color: #ffffff;
        cursor: pointer;
    }

    .submit-button:hover {
        opacity: 0.8;
    }

    .back-button {
        margin-top: 20px;
        padding: 10px 20px;
        font-size: 14px;
        border: none;
        border-radius: 5px;
        background-color: #e74c3c;
        color: #ffffff;
        cursor: pointer;
    }

    .back-button:hover {
        opacity: 0.8;
    }
</style>

<body>
    <div class="module-container">
        <h1>Edit Tourism Record</h1>
        <!-- Your form for editing existing records -->
        <form action="${pageContext.request.contextPath}/update_tourism" method="post">
            <% 
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smart_city_db?serverTimezone=UTC", "root", "MouadJG@1964");
                    String id = request.getParameter("id");
                    String query = "SELECT * FROM tourism WHERE id = ?";
                    try (PreparedStatement pst = con.prepareStatement(query)) {
                        pst.setString(1, id);
                        ResultSet rs = pst.executeQuery();
                        if (rs.next()) {
            %>
                            <!-- Populate form fields with existing record values -->
                            <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
                            <input type="text" class="input-field" name="restaurant_description" value="<%= rs.getString("restaurant_description") %>">
                            <input type="text" class="input-field" name="restaurant_location" value="<%= rs.getString("restaurant_location") %>">
                            <textarea class="input-field" name="special_offers_events"><%= rs.getString("special_offers_events") %></textarea>
                            <input type="url" class="input-field" name="website_url" value="<%= rs.getString("website_url") %>">
                            <button class="submit-button" type="submit">Update</button>
            <%
                        } else {
                            // Handle record not found
                        }
                    }
                    con.close();
                } catch (Exception e) {
                    System.out.println(e);
                }
            %>
        </form>
        <button class="back-button" onclick="window.location.href='tourism.jsp'">Back to Tourism Module</button>
    </div>
</body>
</html>
