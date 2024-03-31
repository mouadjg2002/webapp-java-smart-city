<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

        p {
            margin: 15px;
            font-size: 16px;
        }

        button {
            padding: 15px 30px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            background-color: #e74c3c;
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
            background-color: #3498db;
            color: #ffffff;
            cursor: pointer;
        }

        .back-button:hover {
            opacity: 0.8;
        }
    </style>
    <title>Delete Student Record</title>
</head>
<body>
    <div class="module-container">
        <h1>Delete Student Record</h1>

        <p>Are you sure you want to delete this student record?</p>

        <form action="${pageContext.request.contextPath}/delete_student" method="post">
            <input type="hidden" name="id" value="<%= request.getParameter("id") %>">
            <button type="submit">Delete</button>
        </form>

        <button class="back-button" onclick="window.location.href='student.jsp'">Back to Student Module</button>
    </div>
</body>
</html>
