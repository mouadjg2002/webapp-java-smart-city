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

    .admin-panel {
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

    .button-container {
      display: flex;
      flex-wrap: wrap;
      justify-content: center;
      margin-top: 20px;
    }

    .button {
      display: inline-block;
      padding: 15px 30px;
      margin: 10px;
      text-align: center;
      text-decoration: none;
      font-size: 16px;
      border-radius: 5px;
      cursor: pointer;
    }

    .student-button {
      background-color: #3498db;
      color: #ffffff;
    }

    .tourism-button {
      background-color: #2ecc71;
      color: #ffffff;
    }

    .job-app-button {
      background-color: #e74c3c;
      color: #ffffff;
    }

    .business-button {
      background-color: #f39c12;
      color: #ffffff;
    }

    .library-button {
      background-color: #9b59b6;
      color: #ffffff;
    }

    .attractions-button {
      background-color: #e67e22;
      color: #ffffff;
    }

    .job-resources-button {
      background-color: #27ae60;
      color: #ffffff;
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

    .logout-button:hover,
    .button:hover {
      opacity: 0.8;
    }
  </style>
  <title>Smart City Admin Panel</title>
</head>
<body>
  <div class="admin-panel">
    <h1>Welcome, Admin!</h1>
    <div class="button-container">
      <button class="button student-button" onclick="navigateTo('student.jsp')">Student</button>
      <button class="button tourism-button" onclick="navigateTo('tourism.jsp')">Tourism</button>
      <button class="button job-app-button" onclick="navigateTo('job_application.jsp')">Job Application</button>
      <button class="button business-button" onclick="navigateTo('business.jsp')">Business</button>
      <button class="button library-button" onclick="navigateTo('library.jsp')">Library</button>
      <button class="button attractions-button" onclick="navigateTo('attractions.jsp')">Attractions</button>
      <button class="button job-resources-button" onclick="navigateTo('job_resources.jsp')">Job Resources</button>
    </div>
    <div id="module-content"></div>
    <button class="logout-button" onclick="navigateTo('home.jsp')">Log Out</button>
  </div>

  <script>
    function navigateTo(page) {
      window.location.href = page;
    }
  </script>
</body>
</html>
