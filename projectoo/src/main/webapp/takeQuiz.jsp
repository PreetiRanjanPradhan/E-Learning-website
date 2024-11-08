<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Take Quiz: ${quizName}</title>
    <style>
        .question-container {
            margin: 20px;
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        .options {
            margin-left: 20px;
        }
        .option {
            margin: 10px 0;
        }
        .submit-button {
            margin: 20px;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
</head>
<body>
<h1>Quiz: ${quizName}</h1>

<!-- Debug information -->
<div style="background-color: #f0f0f0; padding: 10px; margin: 10px;">
    <p>QUIZ INFO:</p>
    <p>Quiz ID: ${quizId}</p>
    <p>Quiz Name: ${quizName}</p>
    <p>Number of questions: ${questions.size()}</p>
</div>

<form action="resOfQuiz" method="post">
    <input type="hidden" name="quizId" value="${quizId}">

    <c:forEach items="${questions}" var="question" varStatus="status">
        <div class="question-container">
            <h3>Question ${status.count}: ${question.questionText}</h3>
            <div class="options">
                <div class="option">
                    <input type="radio" name="answer_${status.count}" value="1" required>
                    <label>${question.option1}</label>
                </div>
                <div class="option">
                    <input type="radio" name="answer_${status.count}" value="2">
                    <label>${question.option2}</label>
                </div>
                <div class="option">
                    <input type="radio" name="answer_${status.count}" value="3">
                    <label>${question.option3}</label>
                </div>
                <div class="option">
                    <input type="radio" name="answer_${status.count}" value="4">
                    <label>${question.option4}</label>
                </div>
            </div>
        </div>
    </c:forEach>
    <input type="hidden" name="startTime" value="${startTime}">
    <button type="submit" class="submit-button">Submit Quiz</button>
</form>
</body>
</html>