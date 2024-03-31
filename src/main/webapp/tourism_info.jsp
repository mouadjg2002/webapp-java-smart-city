<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tourism Information</title>
    <style>
        body {
            margin: 0;
            font-family: 'Arial', sans-serif;
            background-color: #f0f0f0;
            display: flex;
            flex-direction: column;
            align-items: center;
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
            text-align: left;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 80%;
            margin-top: 20px;
        }

        h1 {
            color: #333333;
            margin-bottom: 20px;
        }

        .info-container {
            margin-top: 20px;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        th, td {
            padding: 15px;
            border: 1px solid #dddddd;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <h1>Smart City</h1>
        <div class="nav-links">
            <a href="tourism_info.jsp">Restaurant</a>
            <a href="attraction_info.jsp">Attractions</a>
            <a href="#" class="logout-button" onclick="navigateTo('home.jsp')">Log Out</a>
        </div>
    </div>

    <div class="module-container">
        <h1>Tourism Information</h1>

        <div class="info-container">
            <table id="tourismTable">
                <tr>
                    <th>Restaurant Description</th>
                    <th>Restaurant Location</th>
                    <th>Special Offers/Events</th>
                    <th>Website URL</th>
                </tr>
                <% 
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smart_city_db?serverTimezone=UTC",
                                "root", "MouadJG@1964");

                        Statement stmt = con.createStatement();
                        ResultSet rs = stmt.executeQuery("SELECT * FROM tourism");

                        while (rs.next()) { %>
                            <tr>
                                <td><%= rs.getString("restaurant_description") %></td>
                                <td><%= rs.getString("restaurant_location") %></td>
                                <td><%= rs.getString("special_offers_events") %></td>
                                <td><a href="<%= rs.getString("website_url") %>" target="_blank"><%= rs.getString("website_url") %></a></td>
                            </tr>
                        <% }

                        con.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </table>
        </div>
    </div>

    <script>
        function navigateTo(page) {
            window.location.href = page;
        }
    </script>
</body>
</html>
