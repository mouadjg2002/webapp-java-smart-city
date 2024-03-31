<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Smart City</title>
    <style>
        /* Your existing styles here */

        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f4f4;
            color: #333;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        nav {
            background: linear-gradient(to right, #667eea, #764ba2);
            overflow: hidden;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
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

        .login-container {
            width: 300px;
            padding: 20px;
            border: 2px solid #667eea;
            border-radius: 10px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .login-container h2 {
            text-align: center;
            color: #333;
        }

        .login-container form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #666;
        }

        input {
            width: 100%;
            padding: 8px;
            margin-bottom: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #667eea;
            color: #fff;
            cursor: pointer;
            border: none;
            border-radius: 4px;
            padding: 10px;
            font-size: 1em;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #764ba2;
        }
    </style>

    <!-- Include SweetAlert library -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
</head>
<body>
    <!-- Your existing HTML body content here -->

    <nav>
        <h1 style="margin: 0; font-size: 1.2em;">Smart City</h1>
        <div class="nav-links">
            <a href="home.jsp">Home</a>
            <a href="login.jsp">Login</a>
            <a href="register.jsp">Register</a>
        </div>
    </nav>

    <!-- Login Form -->
    <div class="login-container">
        <h2>Login</h2>

        <form method="post" action="login">
            <label for="username">Email:</label>
            <input type="text" id="email" name="email" required>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>

            <input type="submit" value="Login">
        </form>
    </div>

    <!-- JavaScript to display SweetAlert on failed login -->
    <script type="text/javascript">
        var status = document.getElementById("status").value;
        if (status == "failed") {
            Swal.fire("Sorry", "Wrong Email or Password", "error");
        }
    </script>
</body>
</html>
