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

        .edit-button,
        .delete-button {
            background-color: #4CAF50;
            color: white;
            padding: 8px 12px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .edit-button:hover,
        .delete-button:hover {
            background-color: #45a049;
        }
    </style>
    <title>Business Module</title>
</head>
<body>
    <div class="module-container">
        <h1>Business Module</h1>
        <form action="${pageContext.request.contextPath}/job_application_submit" method="post">
            <!-- Your existing form fields -->
            <input type="text" class="input-field" name="job_description" placeholder="Enter news description..." required>
            <input type="text" class="input-field" name="job_location" placeholder="Enter new title..." required>
            <input type="text" class="input-field" name="job_image" placeholder="Enter date..." required>
            <textarea class="input-field" name="skills_qualifications" placeholder="Enter business event..." required></textarea>
            <button class="submit-button" type="submit">Submit</button>
        </form>
        <button class="back-button" onclick="window.location.href='admin.jsp'">Back to Admin Panel</button>

        <!-- Display existing records -->
        <table class="record-table">
            <thead>
                <tr>
                    <th>news description</th>
                    <th>news title</th>
                    <th>date</th>
                    <th>business event</th>
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
                        ResultSet rs = stmt.executeQuery("SELECT * FROM business_info");

                        while (rs.next()) {
                %>
                            <tr>
                                <td><%= rs.getString("news_description") %></td>
                                <td><%= rs.getString("news_title") %></td>
                                <td><%= rs.getString("news_image") %></td>
                                <td><%= rs.getString("business_events") %></td>
                                <td class="record-actions">
                                    <form action="${pageContext.request.contextPath}/edit_business.jsp" method="post">
                                        <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
                                        <button type="submit" class="edit-button">Edit</button>
                                    </form>
                                    <form action="${pageContext.request.contextPath}/delete_business" method="post" onsubmit="return confirm('Are you sure you want to delete this record?');">
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
