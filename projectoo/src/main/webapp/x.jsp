<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Quiz Details</title>
    <link rel="stylesheet" href="css/x.css">

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

<div class="container">
    <h1>Quiz Leaderboard</h1>

    <c:if test="${empty leaderboard}">
        <div class="no-data">No entries found in the leaderboard.</div>
    </c:if>

    <c:if test="${not empty leaderboard}">
        <table>
            <thead>
            <tr>
                <th>Rank</th>
                <th>Player</th>
                <th>Score</th>
                <th>Time Taken</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${leaderboard}" var="entry" varStatus="status">
                <tr>
                    <td class="rank">
                        <c:choose>
                            <c:when test="${status.index == 0}">
                                <span class="medal">🥇</span>
                            </c:when>
                            <c:when test="${status.index == 1}">
                                <span class="medal">🥈</span>
                            </c:when>
                            <c:when test="${status.index == 2}">
                                <span class="medal">🥉</span>
                            </c:when>
                            <c:otherwise>
                                ${status.index + 1}
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td>${entry.userName}</td>
                    <td>
                        <fmt:formatNumber value="${entry.score}" pattern="#.##"/>
                    </td>
                    <td class="time">
                        <fmt:formatNumber value="${entry.timeTaken / 60}" pattern="#"/>m
                        <fmt:formatNumber value="${entry.timeTaken % 60}" pattern="#"/>s
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:if>
</div>

</body>
</html>