<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile</title>
</head>
<body>
<%
    HttpSession session1 = request.getSession(false);
    String username = (String) session1.getAttribute("username");
    String email = (String) session1.getAttribute("email");
    String recovery = (String) session1.getAttribute("recovery");
%>

<h1><%= username %></h1><br>
<h6>Username</h6>

<h1><%= email %></h1><br>
<h6>Email</h6>

<h1><%= recovery %></h1><br>
<h6>Recovery Code</h6>

<h1></h1>
<h6>Password</h6>

<a href=changeDetail.jsp>Change Details</a>
</body>
</html>