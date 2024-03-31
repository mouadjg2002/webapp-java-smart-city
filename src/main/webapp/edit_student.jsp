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

        label {
            display: block;
            margin: 15px;
            text-align: left;
        }

        input, textarea {
            margin: 5px 15px;
            padding: 10px;
            width: calc(100% - 30px);
            box-sizing: border-box;
        }

        button {
            margin-top: 15px;
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
    <title>Edit Student Record</title>
</head>
<body>
    <div class="module-container">
        <h1>Edit Student Record</h1>

        <form action="${pageContext.request.contextPath}/edit_student" method="post">
    <%
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/smart_city_db?serverTimezone=UTC", "root", "MouadJG@1964");

            String id = request.getParameter("id");
            String query = "SELECT * FROM student WHERE id = ?";
            try (PreparedStatement pst = con.prepareStatement(query)) {
                pst.setString(1, id);
                ResultSet rs = pst.executeQuery();
                if (rs.next()) {
    %>
                    <!-- Populate form fields with existing record values -->
                    <label for="academic_info">Academic Information:</label>
                    <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
                    <input type="text" id="academic_info" name="academic_info" value="<%= rs.getString("academic_info") %>">

                    <label for="school_name">School Name:</label>
                    <input type="text" id="school_name" name="school_name" value="<%= rs.getString("school_name") %>">

                    <label for="school_location">School Location:</label>
                    <input type="text" id="school_location" name="school_location" value="<%= rs.getString("school_location") %>">

                    <label for="upcoming_events">Upcoming Events:</label>
                    <textarea id="upcoming_events" name="upcoming_events"><%= rs.getString("upcoming_events") %></textarea>

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

<button class="back-button" onclick="window.location.href='student.jsp'">Back to Student Module</button>
    </div>
</body>
</html>
