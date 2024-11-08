<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body class="login">
    <div class="login-container">
        <h1>Login</h1>
        <form action="LoginServ" method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>

            <button type="submit">Login</button>
        </form>

        <p>Don't have an account? <a href="Register.jsp">Register here</a></p>
        <br>
        <p>Forgot your password? <a href="forgot.jsp">Click here</a></p>

        <p><a href="index.html">Back to Home</a></p>

        <%-- Display error message if login fails --%>
        <% String error = request.getParameter("error");
        if (error != null && error.equals("1")) { %>
            <p style="color: red;">Invalid username or password. Please try again.</p>
        <% } %>

        <%-- Display success message if registration is successful --%>
        <% String rs = request.getParameter("registration");
        if (rs != null && rs.equals("success")) { %>
            <p style="color: green;">Your Registration is Successful. Please Login.</p>
        <% } %>

        <%-- Display logout success message --%>
        <% String logout = request.getParameter("logout");
        if (logout != null && logout.equals("success")) { %>
            <p style="color: green;">You have been successfully logged out.</p>
        <% } %>
    </div>
</body>
</html>