<!-- merge conflict checked -->
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Welcome to E-Learning</title>
	<link rel="stylesheet" href="css/indexStyle.css">
	<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
</head>

<body>
	<div class="container">
		<h1>Welcome to Quizooo!</h1>
		<p><marque>
			This platform offers a variety of quizzes to test knowledge, sharpen skills, compete with friends, and have fun, catering to various interests and categories.
		</marque></p>

		<div class="cta-buttons">
			<a href="Login.jsp" class="btn">Login</a>
			<a href="Register.jsp" class="btn">Register</a>
		</div>

		<div class="features">
			<h2>Why Choose Us?</h2>
			<div class="feature">
				<h3>📚 Diverse Courses</h3>
				<p>Access a wide range of courses to enhance your skills.</p>
			</div>
			
			<div class="feature">
				<h3>💻 Flexible Learning</h3>
				<p>Learn at your own pace, anytime and anywhere.</p>
			</div>
		</div>

		<footer>
			<p>&copy; 2024 E-Learning Platform. All rights reserved.</p>
		</footer>
	</div>

	<script>
		// Optional: Add a simple animation to the buttons
		const buttons = document.querySelectorAll('.btn');
		buttons.forEach(btn => {
			btn.addEventListener('mouseenter', () => {
				btn.style.transform = 'scale(1.1)';
			});
			btn.addEventListener('mouseleave', () => {
				btn.style.transform = 'scale(1)';
			});
		});
	</script>
</body>

</html>