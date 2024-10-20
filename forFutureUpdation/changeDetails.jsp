<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
        <title>Change Details</title>
</head>
<body>
    <div class="register-container">
        <h1>Change Details</h1>
        <form action="changeDetails" method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>

			<label for=recovery>recovery Code:</label>
            <input type="text" id="recovery" name="recovery" required>
            
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>

            <button type="submit">Register</button>
        </form>
    
        
        <% String error = request.getParameter("error");
           if (error != null && error.equals("1")) { %>
            <p style="color: red;">Details changing failed. Please try again.</p>
        <% } %>
    </div>
    
      
   
</body>
</html>