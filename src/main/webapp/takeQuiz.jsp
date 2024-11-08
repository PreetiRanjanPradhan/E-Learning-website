<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Take Quiz: ${quizName}</title>
    <link rel="stylesheet" href="quiz-styles.css">
</head>
<body>
<div class="quiz-container">
    <h1 class="quiz-title">Quiz: ${quizName}</h1>

    <!-- Debug information -->
    <div class="debug-info">
        <p>QUIZ INFO:</p>
        <p>Quiz ID: ${quizId}</p>
        <p>Quiz Name: ${quizName}</p>
        <p>Number of questions: ${questions.size()}</p>
    </div>

    <form action="resOfQuiz" method="post">
        <input type="hidden" name="quizId" value="${quizId}">

        <c:forEach items="${questions}" var="question" varStatus="status">
            <div class="question-container">
                <h3 class="question-text">Question ${status.count}: ${question.questionText}</h3>
                <div class="options">
                    <div class="option">
                        <input type="radio" name="answer_${status.count}" value="1" required>
                        <label><span class="option-label">${question.option1}</span></label>
                    </div>
                    <div class="option">
                        <input type="radio" name="answer_${status.count}" value="2">
                        <label><span class="option-label">${question.option2}</span></label>
                    </div>
                    <div class="option">
                        <input type="radio" name="answer_${status.count}" value="3">
                        <label><span class="option-label">${question.option3}</span></label>
                    </div>
                    <div class="option">
                        <input type="radio" name="answer_${status.count}" value="4">
                        <label><span class="option-label">${question.option4}</span></label>
                    </div>
                </div>
            </div>
        </c:forEach>

        <button type="submit" class="submit-button">Submit Quiz</button>
    </form>
</div>
</body>
</html>