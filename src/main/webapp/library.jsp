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

h2 {
    color: #333333;
    margin-bottom: 10px;
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

.edit-button,
.delete-button {
    background-color: #4CAF50;
    color: white;
    padding: 8px 12px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

.edit-button:hover,
.delete-button:hover {
    background-color: #45a049;
}
    </style>
    <title>Library Module</title>
</head>
<body>
    <div class="module-container">
        <h1>Library Module</h1>
        <form action="library" method="post">
            <input type="text" class="input-field" name="library_name" placeholder="Enter library name...">
            <input type="text" class="input-field" name="location" placeholder="Enter location...">
            <textarea class="input-field" name="additional_info" placeholder="Provide additional information..."></textarea>
            <button class="submit-button" type="submit" name="action" value="submit">Submit</button>
        </form>
        <button class="back-button" onclick="window.location.href='admin.jsp'">Back to Admin Panel</button>

        <div id="edit-section" style="display:none;">
            <h2>Edit Library Record</h2>
            <form action="library" method="post">
                <input type="hidden" name="id" id="edit-id">
                <input type="text" class="input-field" name="library_name" id="edit-library_name" placeholder="Enter library name...">
                <input type="text" class="input-field" name="location" id="edit-location" placeholder="Enter location...">
                <textarea class="input-field" name="additional_info" id="edit-additional_info" placeholder="Provide additional information..."></textarea>
                <button class="submit-button" type="submit" name="action" value="update">Update</button>
            </form>
        </div>

        <table class="record-table">
            <thead>
                <tr>
                    <th>Library Name</th>
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
                        ResultSet rs = stmt.executeQuery("SELECT * FROM library");

                        while (rs.next()) {
                %>
                            <tr>
                                <td><%= rs.getString("library_name") %></td>
                                <td><%= rs.getString("location") %></td>
                                <td><%= rs.getString("additional_info") %></td>
                                <td class="record-actions">
                                    <button type="button" class="edit-button" onclick="editRecord(<%= rs.getInt("id") %>, '<%= rs.getString("library_name") %>', '<%= rs.getString("location") %>', '<%= rs.getString("additional_info") %>')">Edit</button>
                                    <form action="library" method="post">
                                        <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
                                        <button type="submit" class="delete-button" name="action" value="delete">Delete</button>
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
            function editRecord(id, library_name, location, additional_info) {
                document.getElementById('edit-id').value = id;
                document.getElementById('edit-library_name').value = library_name;
                document.getElementById('edit-location').value = location;
                document.getElementById('edit-additional_info').value = additional_info;

                // Show the edit section
                document.getElementById('edit-section').style.display = 'block';
            }
        </script>
    </div>
</body>
</html>
</html>
