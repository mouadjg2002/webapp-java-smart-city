<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Business Record</title>
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
        }

        h1 {
            color: #333333;
        }

        input {
            margin: 15px;
            padding: 10px;
            width: calc(100% - 30px);
            box-sizing: border-box;
        }

        button {
            padding: 15px 30px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            background-color: #3498db;
            color: #ffffff;
            cursor: pointer;
        }

        button:hover {
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

        .error-message {
            color: #e74c3c;
            font-weight: bold;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="module-container">
        <h1>Edit Business Record</h1>

        <form action="${pageContext.request.contextPath}/edit_business" method="post">
            <%
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection(
                            "jdbc:mysql://localhost:3306/smart_city_db?serverTimezone=UTC", "root", "MouadJG@1964");

                    String id = request.getParameter("id");
                    String query = "SELECT * FROM business_info WHERE id = ?";
                    try (PreparedStatement pst = con.prepareStatement(query)) {
                        pst.setString(1, id);
                        ResultSet rs = pst.executeQuery();
                        if (rs.next()) {
            %>
                            <!-- Populate form fields with existing record values -->
                            <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
                            <input type="text" name="newsTitle" value="<%= rs.getString("news_title") %>">
                            <input type="text" name="newsDescription" value="<%= rs.getString("news_description") %>">
                            <input type="text" name="newsImage" value="<%= rs.getString("news_image") %>">
                            <input type="text" name="businessEvents" value="<%= rs.getString("business_events") %>">
                            <button type="submit">Update</button>
            <%
                        } else {
            %>
                            <p class="error-message">Record not found.</p>
            <%
                        }
                    }
                    con.close();
                } catch (Exception e) {
            %>
                    <p class="error-message">An error occurred: <%= e.getMessage() %></p>
            <%
                }
            %>
        </form>

        <button class="back-button" onclick="window.location.href='business.jsp'">Back to Business Module</button>
    </div>
</body>
</html>
