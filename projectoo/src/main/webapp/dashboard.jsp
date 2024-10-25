<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Quizooo</title>
    <link rel="stylesheet" type="text/css" href="css/dashboard.css">
</head>
<body>
    <header>
        <nav>
            <div class="logo">Quizooo</div>
            <ul>
                <li><a href="index.html">Home</a></li>
                <li><a href="profile.jsp">Profile</a></li>
                <li><a href="LogoutServlet">Logout</a></li>
            </ul>
        </nav>
    </header>

    <main class="dashboard-container">
        <h1>Welcome, ${user.username}!</h1>
        
        <section class="dashboard-section">
            <h2>Your Created Quizzes</h2>
            <c:if test="${empty createdQuizzes}">
                <p>You haven't created any quizzes yet.</p>
            </c:if>
            <c:if test="${not empty createdQuizzes}">
                <ul class="quiz-list">
                    <c:forEach var="quiz" items="${createdQuizzes}">
                        <li>
                            <span>${quiz.title}</span>
                            <span>Code: ${quiz.code}</span>
                            <a href="EditQuizServlet?id=${quiz.id}" class="btn btn-small">Edit</a>
                        </li>
                    </c:forEach>
                </ul>
            </c:if>
            <a href="createQuiz.jsp" class="btn">Create New Quiz</a>
        </section>
        
        <section class="dashboard-section">
            <h2>Recent Quiz Results</h2>
            <c:if test="${empty recentResults}">
                <p>You haven't taken any quizzes yet.</p>
            </c:if>
            <c:if test="${not empty recentResults}">
                <ul class="result-list">
                    <c:forEach var="result" items="${recentResults}">
                        <li>
                            <span>Quiz: ${result.quizTitle}</span>
                            <span>Score: ${result.score}%</span>
                            <span>Date: ${result.completionTime}</span>
                        </li>
                    </c:forEach>
                </ul>
            </c:if>
            <a href="availableQuizzes.jsp" class="btn">Take a Quiz</a>
        </section>
        
        <section class="dashboard-section">
            <h2>Quick Actions</h2>
            <div class="action-buttons">
                <a href="enterCode.jsp" class="btn">Enter Quiz Code</a>
                <a href="profile.jsp" class="btn">Update Profile</a>
            </div>
        </section>
    </main>

    <footer>
        <p>&copy; 2024 Quizooo. All rights reserved.</p>
    </footer>
</body>
</html>