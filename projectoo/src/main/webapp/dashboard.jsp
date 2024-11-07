<%@ page import="java.util.List" %>
<%
  String username= (String) session.getAttribute("username");
%>
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
                <li><a href="index.jsp"><i class="fas fa-home"></i> Home</a></li>
                <li><a href="profile.jsp"><i class="fas fa-user"></i> Profile</a></li>
                <li><a href="review.jsp"><i class="fas fa-star"></i> Review</a></li>
                <li><a href="OutServ"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
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
			<h2>What do you want to do??</h2>
        	<a href="CreateQuiz.html" class="btn"><i class="fas fa-plus"></i> Create New Quiz</a>
        	<a href="CreateQuiz.html" class="btn"><i class="fas fa-plus"></i> Check Performance History</a>
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
        </section>
        
        <section class="dashboard-section">
            <h2><i class="fas fa-pencil-alt"></i> Available Quizzes</h2>
            
            
        <%
            List<String> names = (List<String>) request.getAttribute("names");
        %>
    
    	<ol>
    	<% for (String quizName : names) { %>
    	    <li>
    	        <form action="QuizDetail" method="post">
    	            <input type="hidden" name="quizName" value="<%= quizName %>">
    	            <button type="submit" ><%= quizName %></button>
    	        </form>
    	    </li>
    	<% } %>
		</ol>

        </section>
        
    </main>

    <footer>
        <p>&copy; 2024 Quizooo. All rights reserved.</p>
    </footer>

    <script src="dashboard.js">
     </script>
</body>
</html>