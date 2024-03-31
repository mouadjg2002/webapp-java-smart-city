<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Your existing styles and meta tags -->
    <title>Delete Job Application</title>
</head>
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
        margin: 15px 0;
        color: #333333;
    }

    button {
        padding: 10px 20px;
        font-size: 16px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

    button:hover {
        opacity: 0.8;
    }

    .back-button {
        margin-top: 20px;
        background-color: #e74c3c;
        color: #ffffff;
    }

    .back-button:hover {
        background-color: #c0392b;
    }
</style>
<body>
    <div class="module-container">
        <h1>Delete Job Application</h1>
        <!-- Your confirmation message and form for deleting the record -->
        <p>Are you sure you want to delete this record?</p>
        <form action="${pageContext.request.contextPath}/delete_job_application" method="post">
            <% 
                try {
                    String id = request.getParameter("id");
                    if (id != null && !id.isEmpty()) {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smart_city_db?serverTimezone=UTC", "root", "MouadJG@1964");

                        String query = "DELETE FROM job_application WHERE id = ?";
                        
                        try (PreparedStatement pst = con.prepareStatement(query)) {
                            pst.setString(1, id);
                            pst.executeUpdate();
                        }

                        con.close();
                    } else {
                        // Handle the case where id is not provided
                        response.sendRedirect("error.jsp");
                    }
            %>
            <button type="submit">Delete</button>
            <%
                } catch (Exception e) {
                    System.out.println(e);
                }
            %>
        </form>
        <button class="back-button" onclick="window.location.href='job_application.jsp'">Cancel</button>
    </div>
</body>
</html>
