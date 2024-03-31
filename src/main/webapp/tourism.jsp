<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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

        .input-field {
            margin: 15px;
            padding: 10px;
            width: 80%;
            box-sizing: border-box;
        }

        .submit-button,
        .back-button,
        .edit-button,
        .delete-button {
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .submit-button {
            background-color: #3498db;
            color: #ffffff;
        }

        .submit-button:hover {
            opacity: 0.8;
        }

        .back-button {
            background-color: #e74c3c;
            color: #ffffff;
            margin-top: 20px;
        }

        .back-button:hover {
            background-color: #c0392b;
        }

        .edit-button,
        .delete-button {
            background-color: #4CAF50;
            color: white;
            margin-right: 5px;
        }

        .edit-button:hover,
        .delete-button:hover {
            background-color: #45a049;
        }

        /* Styles for displaying records */
        .record-table {
            width: 80%;
            margin: 30px auto;
            border-collapse: collapse;
        }

        .record-table th, .record-table td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        .record-actions {
            display: flex;
            gap: 10px;
        }

        .website-url {
            max-width: 150px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }
    </style>
    <title>Tourism Module</title>
</head>
<body>
    <div class="module-container">
        <h1>Tourism Module</h1>
        <form action="tourism_submit" method="post">
            <!-- Your existing form fields -->
            <input type="text" class="input-field" name="restaurant_description" placeholder="Enter restaurant description...">
            <input type="text" class="input-field" name="restaurant_location" placeholder="Enter restaurant location...">
            <textarea class="input-field" name="special_offers_events" placeholder="Any special offers or events?"></textarea>
            <input type="url" class="input-field" name="website_url" placeholder="Enter website URL...">
            <button class="submit-button" type="submit">Submit</button>
        </form>
        <button class="back-button" onclick="window.location.href='admin.jsp'">Back to Admin Panel</button>

        <!-- Display existing records -->
        <table class="record-table">
            <thead>
                <tr>
                    <th>Description</th>
                    <th>Location</th>
                    <th>Special Offers/Events</th>
                    <th>Website URL</th>
                    <th>Actions</th>
                </tr>
            </thead>
             <tbody>
                <% 
                    // Fetch records from the database and display them
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smart_city_db?serverTimezone=UTC", "root", "MouadJG@1964");
                        Statement stmt = con.createStatement();
                        ResultSet rs = stmt.executeQuery("SELECT * FROM tourism");

                        while (rs.next()) {
                %>
                            <tr>
                                <td><%= rs.getString("restaurant_description") %></td>
                                <td><%= rs.getString("restaurant_location") %></td>
                                <td><%= rs.getString("special_offers_events") %></td>
                                <td class="website-url"><%= rs.getString("website_url") %></td>
                                <td class="record-actions">
                                    <form action="${pageContext.request.contextPath}/edit_tourism" method="post">
                                        <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
                                        <button type="submit" class="edit-button">Edit</button>
                                    </form>
                                    <form action="${pageContext.request.contextPath}/delete_tourism.jsp" method="post" onsubmit="return confirm('Are you sure you want to delete this record?');">
                                        <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
                                        <button type="submit" class="delete-button">Delete</button>
                                    </form>
                                </td>
                            </tr>
                <%
                        }
                        con.close();
                    } catch (Exception e) {
                        System.out.println(e);
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>
