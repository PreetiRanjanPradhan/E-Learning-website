<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to QuizMaster</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            overflow: hidden;
        }
        .container {
            background-color: white;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            text-align: center;
            max-width: 80%;
            opacity: 0;
            transform: translateY(20px);
            animation: fadeIn 1s ease-out forwards;
        }
        h1 {
            color: #333;
            margin-bottom: 1rem;
        }
        p {
            color: #666;
            margin-bottom: 2rem;
        }
        .start-button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 1rem;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.1s;
        }
        .start-button:hover {
            background-color: #45a049;
        }
        .start-button:active {
            transform: scale(0.98);
        }
        @keyframes fadeIn {
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome to QuizMas</h1>
        <p>Test your knowledge with our exciting quizzes! Are you ready to challenge yourself?</p>
        <button class="start-button" onclick="startQuiz()">Start Quiz</button>
    </div>

    <script>
        function startQuiz() {
            // Add your logic here to start the quiz
            alert("Starting the quiz!");
            // You can redirect to the quiz page or load quiz questions dynamically
        }
    </script>
</body>
</html>