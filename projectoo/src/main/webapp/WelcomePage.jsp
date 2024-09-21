<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quiz Platform - Welcome</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #333;
        }
        .container {
            background: rgba(255, 255, 255, 0.9);
            border-radius: 20px;
            padding: 2rem;
            box-shadow: 0 8px 32px rgba(31, 38, 135, 0.37);
            backdrop-filter: blur(8px);
            border: 1px solid rgba(255, 255, 255, 0.18);
            width: 90%;
            max-width: 800px;
            text-align: center;
        }
        h1 {
            color: #4a4a4a;
            margin-bottom: 1rem;
            font-size: 2.5rem;
        }
        h3 {
            color: #6a11cb;
            margin: 1rem 0;
        }
        p {
            margin-bottom: 1rem;
            line-height: 1.6;
        }
        .btn {
            display: inline-block;
            padding: 10px 20px;
            margin: 10px;
            border: none;
            border-radius: 5px;
            background-color: #6a11cb;
            color: white;
            font-size: 1rem;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.1s ease;
            text-decoration: none;
        }
        .btn:hover {
            background-color: #5a0cb1;
        }
        .btn:active {
            transform: scale(0.98);
        }
        #quizContainer {
            display: none;
            margin-top: 2rem;
        }
        #question {
            font-size: 1.2rem;
            margin-bottom: 1rem;
        }
        #options {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        #options button {
            margin: 5px;
            width: 80%;
            max-width: 300px;
        }
        #result {
            margin-top: 1rem;
            font-weight: bold;
        }
        #nextQuestionBtn {
            display: none;
        }
        #quizStats {
            margin-top: 1rem;
            font-style: italic;
        }
    </style>
</head>
<body>
<%
HttpSession session1 = request.getSession(false);
if (session1 != null && session1.getAttribute("username") != null) {
    String username = (String) session1.getAttribute("username");
%>
    <div class="container">
        <h1>Welcome, <%= username %>! 🌟</h1>
        <p>Ready to challenge your knowledge? Let's dive into our interactive quiz!</p>
        <button id="startQuizBtn" class="btn">Start Quiz</button>
        <div id="quizContainer">
            <h3 id="question"></h3>
            <div id="options"></div>
            <p id="result"></p>
            <button id="nextQuestionBtn" class="btn">Next Question</button>
            <p id="quizStats"></p>
        </div>
        <p>When you're done exploring, you can <a href="logout.jsp" class="btn">Logout</a> securely.</p>
    </div>

    <script>
        const quizData = [
            {
                question: "What is the capital of France?",
                options: ["London", "Berlin", "Paris", "Madrid"],
                correct: 2
            },
            {
                question: "Which planet is known as the Red Planet?",
                options: ["Mars", "Venus", "Jupiter", "Saturn"],
                correct: 0
            },
            {
                question: "What is the largest mammal in the world?",
                options: ["Elephant", "Blue Whale", "Giraffe", "Hippopotamus"],
                correct: 1
            }
        ];

        let currentQuestion = 0;
        let score = 0;

        const startQuizBtn = document.getElementById('startQuizBtn');
        const quizContainer = document.getElementById('quizContainer');
        const questionEl = document.getElementById('question');
        const optionsEl = document.getElementById('options');
        const resultEl = document.getElementById('result');
        const nextQuestionBtn = document.getElementById('nextQuestionBtn');
        const quizStats = document.getElementById('quizStats');

        startQuizBtn.addEventListener('click', startQuiz);
        nextQuestionBtn.addEventListener('click', loadNextQuestion);

        function startQuiz() {
            startQuizBtn.style.display = 'none';
            quizContainer.style.display = 'block';
            loadQuestion();
        }

        function loadQuestion() {
            const question = quizData[currentQuestion];
            questionEl.textContent = question.question;
            optionsEl.innerHTML = '';
            question.options.forEach((option, index) => {
                const button = document.createElement('button');
                button.textContent = option;
                button.classList.add('btn');
                button.addEventListener('click', () => checkAnswer(index));
                optionsEl.appendChild(button);
            });
            resultEl.textContent = '';
            nextQuestionBtn.style.display = 'none';
            updateQuizStats();
        }

        function checkAnswer(selectedIndex) {
            const question = quizData[currentQuestion];
            if (selectedIndex === question.correct) {
                resultEl.textContent = "Correct! Well done!";
                resultEl.style.color = "green";
                score++;
            } else {
                resultEl.textContent = "Sorry, that's incorrect. The correct answer is: " + question.options[question.correct];
                resultEl.style.color = "red";
            }
            Array.from(optionsEl.children).forEach(button => button.disabled = true);
            nextQuestionBtn.style.display = 'inline-block';
            updateQuizStats();
        }

        function loadNextQuestion() {
            currentQuestion++;
            if (currentQuestion < quizData.length) {
                loadQuestion();
            } else {
                showFinalResult();
            }
        }

        function showFinalResult() {
            quizContainer.innerHTML = 
                '<h3>Quiz Completed!</h3>' +
                '<p>Your final score: ' + score + ' out of ' + quizData.length + '</p>' +
                '<p>' + getFeedback() + '</p>' +
                '<button onclick="location.reload()" class="btn">Restart Quiz</button>';
        }

        function getFeedback() {
            const percentage = (score / quizData.length) * 100;
            if (percentage === 100) return "Perfect score! You're a quiz master! 🏆";
            if (percentage >= 80) return "Great job! You've got some serious knowledge! 🎉";
            if (percentage >= 60) return "Good effort! Keep learning and you'll improve! 📚";
            if (percentage >= 40) return "Not bad, but there's room for improvement. Keep studying! 💪";
            return "Don't worry, everyone starts somewhere. Keep practicing! 🌱";
        }

        function updateQuizStats() {
            quizStats.textContent = 'Question ' + (currentQuestion + 1) + ' of ' + quizData.length + ' | Score: ' + score;
        }
    </script>
<%
} else {
    response.sendRedirect("Login.jsp");
}
%>
</body>
</html>