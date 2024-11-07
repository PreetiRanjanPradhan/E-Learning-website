<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Quiz Details</title>
</head>
<body>
	<%
String quizName = (String) request.getAttribute("quizName");
String createdAt = (String) request.getAttribute("createdAt");
String updatedAt = (String) request.getAttribute("updatedAt");
%>



    <h1>Quiz Details</h1>
    <p>Quiz Name: ${quizName}</p>
    <p>Created At: ${createdAt}</p>
    <p>Updated At: ${updatedAt}</p>
    <form action="takeQuiz" method="post">
    	<input type="hidden" name="quizName" value="<%= quizName %>">
    	<button type="submit">Take Quiz</button>
	</form>
</body>
</html>