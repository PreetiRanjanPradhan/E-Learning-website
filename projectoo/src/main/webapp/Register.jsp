<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
        <title>Register Page</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body class="register">
    <div class="register-container">
        <h1>Create an Account</h1>
        <form action="Register_Servlet" method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>

            <button type="submit">Register</button>
        </form>

        <p>Already have an account? <a href="Login.jsp">Login here</a></p>
          <p><a href="index.html">Back to Home</a></p>
    
        
        <% String error = request.getParameter("error");
           if (error != null && error.equals("1")) { %>
            <p style="color: red;">Registration failed. Please try again.</p>
        <% } %>
    </div>
    
      
   
</body>
</html>