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
        <!-- Your existing CSS styles -->
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
            width: calc(100% - 30px);
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
    </style>
    <title>Edit Job Application</title>
</head>
<body>
    <div class="module-container">
        <h1>Edit Job Application</h1>

        <% 
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smart_city_db?serverTimezone=UTC", "root", "MouadJG@1964");

                // Retrieve data from the database based on the ID passed in the request parameter
                int id = Integer.parseInt(request.getParameter("id"));
                String query = "SELECT * FROM job_application WHERE id=?";
                try (PreparedStatement pst = con.prepareStatement(query)) {
                    pst.setInt(1, id);
                    ResultSet rs = pst.executeQuery();

                    // Check if there is a record with the given ID
                    if (rs.next()) {
        %>
                        <form action="${pageContext.request.contextPath}/edit_job_application" method="post">
                            <!-- Your form fields for editing job application -->
                            <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
                            <input type="text" class="input-field" name="job_description" placeholder="Enter job description..." value="<%= rs.getString("job_description") %>">
                            <input type="text" class="input-field" name="job_location" placeholder="Enter job location..." value="<%= rs.getString("job_location") %>">
                            <input type="text" class="input-field" name="job_image" placeholder="Enter job image URL..." value="<%= rs.getString("job_image") %>">
                            <textarea class="input-field" name="skills_qualifications" placeholder="Enter skills and qualifications..."><%= rs.getString("skills_qualifications") %></textarea>
                            <button class="submit-button" type="submit">Update</button>
                        </form>
        <%
                    } else {
                        // Handle the case where no record is found for the given ID
                        out.println("Record not found");
                    }
                }
                con.close();
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
                // Handle the exception as needed, or leave it empty
            }
        %>

        <button class="back-button" onclick="window.location.href='job_application.jsp'">Back to Job Applications</button>
    </div>
</body>
</html>
