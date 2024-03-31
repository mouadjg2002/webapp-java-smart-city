<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Smart City</title>
    <style>
        body {
            margin: 0;
            font-family: 'Arial', sans-serif;
            background-color: #f0f0f0;
            color: #333;
        }

        /* Navigation Bar Styles */
        nav {
            background: linear-gradient(to right, #667eea, #764ba2);
            overflow: hidden;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 8px 20px;
        }

        nav h1 {
            margin: 0;
            font-size: 1.2em;
            color: #fff;
        }

        nav a {
            color: #fff;
            text-decoration: none;
            transition: color 0.3s;
            margin: 0 10px;
            font-size: 0.9em;
        }

        nav a:hover {
            color: #f0f0f0;
            background-color: #667eea;
            border-radius: 5px;
        }

        /* Header Styles */
        header {
            background: linear-gradient(to right, #667eea, #764ba2);
            padding: 5px;
            text-align: left;
            color: #fff;
        }

        /* Main Content Styles */
        main {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px;
            text-align: left;
        }

        /* Image Styles */
        .home-image {
            width: 45%;
            height: auto;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        /* Description Styles */
        .description {
            width: 45%;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 8px;
            background-color: #ffffff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .description h2 {
            color: #333333;
        }

        .description p {
            color: #666666;
        }

        /* Learn More Button Styles */
        .learn-more-button {
            display: inline-block;
            padding: 10px 20px;
            font-size: 14px;
            border: none;
            border-radius: 5px;
            background-color: #3498db;
            color: #ffffff;
            text-decoration: none;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .learn-more-button:hover {
            background-color: #2077b8;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            main {
                flex-direction: column;
                align-items: center;
            }
        }
    </style>
</head>
<body>

    <nav>
        <h1>Smart City</h1>
        <div class="nav-links">
            <a href="home.jsp">Home</a>
            <a href="login.jsp">Login</a>
            <a href="register.jsp">Register</a>
        </div>
    </nav>

    <header>
    </header>

    <main>
        <div class="description">
            <h2>Welcome to the Smart City Experience</h2>
            <p>Discover the future of urban living with our Smart City. Immerse yourself in a seamless blend of innovation, sustainability, and connectivity. From intelligent mobility solutions to data-driven governance, our digital landscape awaits you. Embrace a city designed for a high quality of life, safety, and dynamic community engagement. Join us in shaping a smarter, more connected, and sustainable urban future.</p>
            <a href="#" class="learn-more-button">Learn More</a>
        </div>
        <img src="smartcity.jpg" alt="Home Image" class="home-image">
    </main>

    <form method="get" action="webservlet">
    </form>
</body>
</html>
