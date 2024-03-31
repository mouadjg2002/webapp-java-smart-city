<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Business Information</title>
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
            font-size: 1.5em;
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
            margin: 0 15px;
            font-size: 1em;
        }

        .nav-links a:hover {
            color: #f0f0f0;
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

        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
        }

        th, td {
            padding: 10px;
            border: 1px solid #dddddd;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
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
            <a href="business_info.jsp">Events</a>
            <a href="business_partnership.jsp">Business Partnershipp</a>
            <a href="#" class="logout-button" onclick="navigateTo('home.jsp')">Log Out</a>
        </div>
    </div>

    <div class="module-container">
        <h1>Business Information</h1>

        <table id="businessTable">
            <tr>
                <th>News Description</th>
                <th>News Title</th>
                <th>News Date</th>
                <th>Business Events</th>
            </tr>
            <% 
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection(
                        "jdbc:mysql://localhost:3306/smart_city_db?serverTimezone=UTC", "root", "MouadJG@1964");

                String query = "SELECT * FROM business_info";
                try (PreparedStatement pst = con.prepareStatement(query);
                     ResultSet rs = pst.executeQuery()) {
                    while (rs.next()) { %>
                        <tr>
                            <td><%= rs.getString("news_description") %></td>
                            <td><%= rs.getString("news_title") %></td>
                            <td><%= rs.getString("news_image") %></td>
                            <td><%= rs.getString("business_events") %></td>
                        </tr>
                    <% }
                }
            } catch (Exception e) {
                e.printStackTrace();
            } %>
        </table>
    </div>

    <script>
        function navigateTo(page) {
            window.location.href = page;
        }
    </script>
</body>
</html>
