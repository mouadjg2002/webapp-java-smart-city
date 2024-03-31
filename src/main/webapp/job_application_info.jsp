<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Job Application Information</title>
    <style>
        body {
            margin: 0;
            font-family: 'Arial', sans-serif;
            background-color: #f0f0f0;
        }

        .navbar {
            background: linear-gradient(to right, #667eea, #764ba2);
            overflow: hidden;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 8px 20px;
            width: 100%;
        }

        .navbar h1 {
            margin: 0;
            font-size: 1.2em;
            color: #fff;
        }

        .nav-links {
            display: flex;
            align-items: center;
        }

        .nav-links a {
            color: #fff;
            text-decoration: none;
            transition: color 0.3s;
            margin: 0 10px;
            font-size: 0.9em;
        }

        .nav-links a.logout-button {
            background-color: #e74c3c;
            color: #ffffff;
            padding: 10px 20px;
            font-size: 14px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .nav-links a.logout-button:hover {
            background-color: #c0392b;
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

        .logout-button {
            margin-top: 20px;
            padding: 10px 20px;
            font-size: 14px;
            background-color: #e74c3c;
            color: #ffffff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .logout-button:hover {
            opacity: 0.8;
        }

        .job-image {
            max-width: 100%; /* Ensure the image doesn't exceed its container */
            height: auto; /* Maintain aspect ratio */
        }
    </style>
</head>
<body>
    <div class="navbar">
        <h1>Smart City</h1>
        <div class="nav-links">
            <a href="job_application_info.jsp">Jobs</a>
            <a href="job_resource_info.jsp">company profile</a> <!-- Add your link related to jobs here -->
            <a href="#" class="logout-button" onclick="navigateTo('home.jsp')">Log Out</a>
        </div>
    </div>

    <div class="module-container">
        <h1>Job Application Information</h1>

        <% 
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smart_city_db?serverTimezone=UTC",
                        "root", "MouadJG@1964");

                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM job_application");

                while (rs.next()) {
        %>
                    <p>Job Description: <%= rs.getString("job_description") %></p>
                    <p>Job Location: <%= rs.getString("job_location") %></p>
                    <a href="<%= rs.getString("job_image") %>" target="_blank">
                        <img class="job-image" src="<%= rs.getString("job_image") %>" alt="Job Image">
                    </a>
                    <p>Skills Qualifications: <%= rs.getString("skills_qualifications") %></p>
                    <hr>
        <%
                }

                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </div>

    <script>
        function navigateTo(page) {
            window.location.href = page;
        }
    </script>
</body>
</html>
