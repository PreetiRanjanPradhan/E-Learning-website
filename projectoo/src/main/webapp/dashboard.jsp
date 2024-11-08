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

    <a href="CreateQuiz.html" class="btn" style="display: inline-block; margin-bottom: 10px;"><i class="fas fa-plus"></i> Create New Quiz</a>

    <section class="dashboard-section">
        <h2><i class="fas fa-pencil-alt"></i> Available Quizzes</h2>


        <%
            List<String> names = (List<String>) request.getAttribute("names");
        %>

        <div class= "button-container">
            <% for (String quizName : names) { %>

            <form action="QuizDetail" method="post" style="display: inline-block; margin-bottom: 10px;">
                <input type="hidden" name="quizName" value="<%= quizName %>">
                <button type="submit" class ="btn" ><%= quizName %></button>
            </form>

            <% } %>
        </div>
    </section>

</main>

<footer>
    <p>&copy; 2024 Quizooo. All rights reserved.</p>
</footer>

<script src="dashboard.js">
</script>
</body>
</html>