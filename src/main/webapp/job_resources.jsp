<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
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

        .input-field {
            margin: 15px;
            padding: 10px;
            width: 80%;
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

        .record-table {
            width: 80%;
            margin: 30px auto;
            border-collapse: collapse;
        }

        .record-table th, .record-table td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        .record-actions {
            display: flex;
            gap: 10px;
        }

        .edit-button, .delete-button {
            background-color: #4CAF50;
            color: white;
            padding: 8px 12px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .edit-button:hover, .delete-button:hover {
            background-color: #45a049;
        }

        /* Add a new style for the edit form */
        .edit-form {
            display: none;
            background-color: #f9f9f9;
            padding: 10px;
            margin-top: 10px;
            border-radius: 5px;
        }
    </style>
    <title>Job Resources - Enhancing Applications</title>
</head>
<body>
    <div class="module-container">
        <h1>Job Resources - Enhancing Applications</h1>
        <form action="job_resources" method="post">
            <input type="text" class="input-field" name="company_name" placeholder="Enter company name...">
            <input type="text" class="input-field" name="location" placeholder="Enter location...">
            <textarea class="input-field" name="additional_info" placeholder="Provide additional information..."></textarea>
            <button class="submit-button" type="submit" name="action" value="submit">Submit</button>
        </form>
        <button class="back-button" onclick="window.location.href='admin.jsp'">Back to Admin Panel</button>

        <table class="record-table">
            <thead>
                <tr>
                    <th>Company Name</th>
                    <th>Location</th>
                    <th>Additional Information</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smart_city_db?serverTimezone=UTC", "root", "MouadJG@1964");
                        Statement stmt = con.createStatement();
                        ResultSet rs = stmt.executeQuery("SELECT * FROM company_profile");

                        while (rs.next()) {
                %>
                            <tr>
                                <td><%= rs.getString("company_name") %></td>
                                <td><%= rs.getString("location") %></td>
                                <td><%= rs.getString("additional_info") %></td>
                                <td class="record-actions">
                                    <button type="button" class="edit-button" onclick="showEditForm(<%= rs.getInt("id") %>)">Edit</button>
                                    <form action="job_resources" method="post">
                                        <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
                                        <button type="submit" class="delete-button" name="action" value="delete">Delete</button>
                                    </form>
                                </td>
                            </tr>
                            <!-- Edit form for each record -->
                            <tr class="edit-form" id="editForm<%= rs.getInt("id") %>">
                                <td colspan="4">
                                    <form action="job_resources" method="post">
                                        <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
                                        <input type="text" class="input-field" name="edited_company_name" value="<%= rs.getString("company_name") %>">
                                        <input type="text" class="input-field" name="edited_location" value="<%= rs.getString("location") %>">
                                        <textarea class="input-field" name="edited_additional_info"><%= rs.getString("additional_info") %></textarea>
                                        <button type="submit" class="submit-button" name="action" value="update">Update</button>
                                    </form>
                                </td>
                            </tr>
                <%
                        }
                        con.close();
                    } catch (Exception e) {
                        System.out.println(e);
                    }
                %>
            </tbody>
        </table>

        <script>
            function showEditForm(id) {
                var editForm = document.getElementById('editForm' + id);
                if (editForm.style.display === 'none' || editForm.style.display === '') {
                    editForm.style.display = 'table-row';
                } else {
                    editForm.style.display = 'none';
                }
            }
        </script>
    </div>
</body>
</html>
