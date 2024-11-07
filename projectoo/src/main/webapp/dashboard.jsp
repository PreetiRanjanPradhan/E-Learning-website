<!--jvathttdce-->
<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Quizooo</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/dashboard.css">
</head>
<body>
    <header>
        <nav>
            <div class="logo">Quizooo</div>
            <ul>
                <li><a href="index.html"><i class="fas fa-home"></i> Home</a></li>
                <li><a href="profile.jsp"><i class="fas fa-user"></i> Profile</a></li>
                <li><a href="review.jsp"><i class="fas fa-star"></i> Review</a></li>
                <li><a href="LogoutServlet"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
            </ul>
        </nav>
    </header>

    <main class="dashboard-container">
        <section class="welcome-section">
            <h1 class="welcome-message">Welcome, ${username}!</h1>
            <p>Ready to challenge yourself today?</p>
        </section>

        <div class="stats-grid">
            <div class="stat-card">
                <div class="stat-number">0</div>
                <p>Quizzes Taken</p>
            </div>
            <div class="stat-card">
                <div class="stat-number">0</div>
                <p>Average Score</p>
            </div>
            <div class="stat-card">
                <div class="stat-number">0</div>
                <p>Quizzes Created</p>
            </div>
        </div>
<!--  -->
        <section class="dashboard-section">
            <h2><i class="fas fa-pencil-alt"></i> Your Created Quizzes</h2>
            <c:if test="${empty createdQuizzes}">
            </c:if>
            <c:if test="${not empty createdQuizzes}">
            
            </c:if>
            <a href="CreateQuiz.jsp" class="btn"><i class="fas fa-plus"></i> Create New Quiz</a>
        </section>

        <section class="dashboard-section">
            <h2><i class="fas fa-chart-bar"></i> Recent Quiz Results</h2>
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
            <a href="TakeQuiz.jsp" class="btn"><i class="fas fa-play"></i> Take a Quiz</a>
        </section>

        <section class="dashboard-section">
            <h2><i class="fas fa-bolt"></i> Quick Actions</h2>
            <div class="action-buttons">
                
                <a href="profile.jsp" class="btn"><i class="fas fa-user-edit"></i> Update Profile</a>
            </div>
        </section>
    </main>

    <footer>
        <p>&copy; 2024 Quizooo. All rights reserved.</p>
    </footer>

    <script>
        // Animate stats numbers
        document.querySelectorAll('.stat-number').forEach(stat => {
            const finalValue = parseInt(stat.textContent);
            let currentValue = 0;
            const duration = 1000;
            const increment = finalValue / (duration / 16);
            
            const animate = () => {
                currentValue += increment;
                if (currentValue < finalValue) {
                    stat.textContent = Math.round(currentValue) + (stat.textContent.includes('%') ? '%' : '');
                    requestAnimationFrame(animate);
                } else {
                    stat.textContent = finalValue + (stat.textContent.includes('%') ? '%' : '');
                }
            };
            
            animate();
        });
    </script>
</body>
</html>