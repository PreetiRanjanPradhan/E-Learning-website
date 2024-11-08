<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quiz Results - ${quizName}</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f5f5f5;
        }
        .result-container {
            max-width: 800px;
            margin: 0 auto;
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        .summary {
            text-align: center;
            padding: 20px;
            margin-bottom: 30px;
            background-color: #f8f9fa;
            border-radius: 5px;
        }
        .score {
            font-size: 24px;
            color: #2c3e50;
            margin: 10px 0;
        }
        .percentage {
            font-size: 48px;
            color: #27ae60;
            margin: 20px 0;
        }
        .question-review {
            margin: 20px 0;
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        .correct {
            background-color: #d4edda;
            border-color: #c3e6cb;
        }
        .incorrect {
            background-color: #f8d7da;
            border-color: #f5c6cb;
        }
        .question-text {
            font-weight: bold;
            margin-bottom: 10px;
        }
        .options {
            margin-left: 20px;
        }
        .option {
            margin: 5px 0;
            padding: 5px;
        }
        .correct-answer {
            color: #28a745;
            font-weight: bold;
        }
        .wrong-answer {
            color: #dc3545;
            font-weight: bold;
        }
        .buttons {
            text-align: center;
            margin-top: 20px;
        }
        .button {
            display: inline-block;
            padding: 10px 20px;
            margin: 0 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            color: white;
        }
        .retry {
            background-color: #007bff;
        }
        .home {
            background-color: #6c757d;
        }
    </style>
</head>
<body>
<div class="result-container">
    <h1 style="text-align: center;">Quiz Results: ${quizName}</h1>

    <div class="summary">
        <div class="score">Score: ${correctAnswers} / ${totalQuestions}</div>
        <div class="percentage">
            <fmt:formatNumber value="${percentage}" maxFractionDigits="1"/>%
        </div>

        <c:choose>
            <c:when test="${percentage >= 80}">
                <p>Excellent work! Outstanding performance!</p>
            </c:when>
            <c:when test="${percentage >= 60}">
                <p>Good job! You've passed successfully.</p>
            </c:when>
            <c:otherwise>
                <p>Keep practicing! You can improve!</p>
            </c:otherwise>
        </c:choose>
    </div>

    <h2>Detailed Review</h2>

    <c:forEach items="${questions}" var="question" varStatus="status">
        <div class="question-review ${results[status.count] ? 'correct' : 'incorrect'}">
            <div class="question-text">
                Question ${status.count}: ${question.questionText}
            </div>
            <div class="options">
                <div class="option">
                    <c:choose>
                        <c:when test="${question.correctOption == 1}">
                            <span class="correct-answer">✓ ${question.option1} (Correct Answer)</span>
                        </c:when>
                        <c:otherwise>
                            ${question.option1}
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="option">
                    <c:choose>
                        <c:when test="${question.correctOption == 2}">
                            <span class="correct-answer">✓ ${question.option2} (Correct Answer)</span>
                        </c:when>
                        <c:otherwise>
                            ${question.option2}
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="option">
                    <c:choose>
                        <c:when test="${question.correctOption == 3}">
                            <span class="correct-answer">✓ ${question.option3} (Correct Answer)</span>
                        </c:when>
                        <c:otherwise>
                            ${question.option3}
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="option">
                    <c:choose>
                        <c:when test="${question.correctOption == 4}">
                            <span class="correct-answer">✓ ${question.option4} (Correct Answer)</span>
                        </c:when>
                        <c:otherwise>
                            ${question.option4}
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </c:forEach>

    <div class="buttons">
        <form action="Dashboard" method="post" class="buttons">
            <button type="submit">Back to Home</button>
        </form>
    </div>
</div>
</body>
</html>