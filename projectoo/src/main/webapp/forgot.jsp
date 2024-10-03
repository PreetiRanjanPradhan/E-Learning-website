
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>forgotPassword</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body class="login">
<div class="login-container">
    <h1>Forgot Password??</h1>
    <form action="forgot" method="post">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required>

        <label for="recovery">Recovery Code</label>
        <input type="text" id="recovery" name="recovery" required>

        <button type="submit">Change Password</button>
    </form>

    <p>Go back to Login page <a href="Login.jsp">Login</a></p>

    <p><a href="index.html">Back to Home</a></p>

    <%-- Display error message if login fails --%>
    <% String error = request.getParameter("error");
        if (error != null && error.equals("1")) { %>
    <p style="color: red;">Invalid username or recovery code. Please try again.</p>
    <% } %>

    <%-- Display success message if registration is successful --%>
    <% String rs = request.getParameter("registration");
        if (rs != null && rs.equals("success")) { %>
    <p style="color: green;">You can change the password now</p>
    <% } %>
</div>

</body>
</html>