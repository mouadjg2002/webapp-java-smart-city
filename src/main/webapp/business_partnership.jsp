<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

        .nav-links a:hover {
            color: #f0f0f0;
            background-color: #667eea;
            border-radius: 5px;
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

        .partnership-section {
            margin-top: 20px;
        }

        .partnership-item {
            text-align: left;
            margin: 20px 0;
            padding: 20px;
            background-color: #f2f2f2;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .partner-logo {
            max-width: 100px;
            max-height: 100px;
            margin-bottom: 10px;
        }

        .learn-more-button {
            display: inline-block;
            padding: 10px 20px;
            font-size: 14px;
            background-color: #3498db;
            color: #ffffff;
            text-decoration: none;
            border-radius: 5px;
            margin-top: 10px;
        }

        .learn-more-button:hover {
            opacity: 0.8;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <h1>Smart City</h1>
        <div class="nav-links">
            <a href="business_info.jsp">Events</a>
            <a href="business_partnership.jsp">Business Partnerships</a>
            <a href="#" class="logout-button" onclick="navigateTo('home.jsp')">Log Out</a>
        </div>
    </div>

    <div class="module-container">
   

        <!-- Other Business Information -->

        <div class="partnership-section">
            <h2>Business Partnerships</h2>

            <div class="partnership-item">
                <img class="partner-logo" src="futuretech.jpg" alt="Partner 1 Logo">
                <h3>FutureTech Innovations</h3>
                <p>
                    FutureTech Innovations is a cutting-edge technology company that specializes in artificial intelligence, 
                    machine learning, and sustainable solutions. Our partnership with FutureTech aims to leverage their 
                    expertise to implement innovative solutions for a smarter and more sustainable city.
                </p>
                <a href="https://www.futuretech.ma/home/" class="learn-more-button">Learn More</a>
            </div>

            <div class="partnership-item">
                <img class="partner-logo" src="GreenScape.png" alt="Partner 2 Logo">
                <h3>GreenScape Eco Solutions</h3>
                <p>
                    GreenScape Eco Solutions is a leading environmental solutions provider, specializing in green 
                    infrastructure, renewable energy, and sustainable urban development. Our partnership with GreenScape 
                    is focused on creating eco-friendly spaces and promoting environmental awareness in our community.
                </p>
                <a href="https://www.greenscape.us.com/" class="learn-more-button">Learn More</a>
            </div>

            <!-- Add more partnership items as needed -->

        </div>
    </div>

    <script>
        function navigateTo(page) {
            window.location.href = page;
        }
    </script>
</body>
</html>
