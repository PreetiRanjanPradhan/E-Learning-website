
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ChangePassword</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body class="login">
	<%
	HttpSession session1 = request.getSession(false);
	if (session1 != null && session1.getAttribute("username") != null) {
    String username = (String) session1.getAttribute("username");
	%>
	<h1>Change the Password below,<%= username %>! 🌟</h1>
    <div class="login-container">
    
	
        <h1>Change Password</h1>
        <form action="changePassword" method="post">

            <label for="newPassword">New Password</label>
            <input type="text" id="newPassword" name="newPassword" required>

            <button type="submit">Change Password</button>
        </form>

        <p>Go back to Login page <a href="Login.jsp">Login</a></p>
        
        <p><a href="index.html">Back to Home</a></p>
    </div>
<%
} else {
    response.sendRedirect("newPass.jsp");
}
%>
</body>
</html>