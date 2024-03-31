<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Library Information</title>
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
        }

        .navbar h1 {
            margin: 0;
            font-size: 1.2em;
            color: #fff;
        }

        .navbar a {
            color: #fff;
            text-decoration: none;
            margin: 0 10px;
            font-size: 0.9em;
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

        .info-container {
            margin-top: 20px;
            margin-bottom: 20px;
        }

        p {
            margin: 0;
            padding: 10px;
            border-bottom: 1px solid #ddd;
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
    </style>
</head>
<body>
    <div class="navbar">
        <h1>Smart City</h1>
        <div class="nav-links">
            <a href="student_info.jsp">Student</a>
            <a href="library_info.jsp">Libraries</a>
            <a href="#" class="logout-button" onclick="navigateTo('home.jsp')">Log Out</a>
        </div>
    </div>

    <div class="module-container">
        <h1>Library Information</h1>

        <div class="info-container">
            <% 
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smart_city_db?serverTimezone=UTC",
                            "root", "MouadJG@1964");

                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM libraries");

                    while (rs.next()) { %>
                        <p>Library Name: <%= rs.getString("library_name") %></p>
                        <p>Library Location: <%= rs.getString("library_location") %></p>
                        <p>Library Facilities: <%= rs.getString("library_facilities") %></p>
                        <p>Upcoming Events: <%= rs.getString("upcoming_events") %></p>
                        <hr>
                    <% }

                    con.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
        </div>
    </div>

    <script>
        function navigateTo(page) {
            window.location.href = page;
        }
    </script>
</body>
</html>
