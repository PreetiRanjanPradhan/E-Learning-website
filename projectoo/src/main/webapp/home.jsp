<% Object firstname = null; %><!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        header {
            background-color: #4CAF50;
            color: white;
            padding: 15px 0;
            text-align: center;
        }
        .container {
            text-align: center;
            padding: 40px 20px;
        }
        h1 {
            color: #333;
        }
        p {
            color: #555;
        }
        .btn {
            display: inline-block;
            padding: 10px 20px;
            margin: 10px;
            color: white;
            background-color: #4CAF50;
            text-decoration: none;
            border-radius: 4px;
            font-size: 16px;
        }
        .btn:hover {
            background-color: #45a049;
        }
        .logout {
            margin-top: 20px;
        }
        .logout a {
            color: red;
            text-decoration: none;
            font-weight: bold;
        }
        .logout a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<header>
    <h1>Welcome to the E-Learning Platform</h1>
</header>

<div class="container">
    <h1>Hello, <%= firstname %>!</h1>
    <p>You're successfully logged in. Explore our courses and resources below.</p>

    <!-- Example Navigation Links -->
    <a href="courses.html" class="btn">View Courses</a>
    <a href="profile.html" class="btn">My Profile</a>
    <a href="settings.html" class="btn">Settings</a>

    <div class="logout">
        <a href="logout.jsp">Logout</a>
    </div>
</div>
</body>
</html>
