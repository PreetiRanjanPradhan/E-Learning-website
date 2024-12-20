<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quizooo - Modern Learning Platform</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="css/indexStyle.css" rel="stylesheet"/>
</head>
<body>
    <header>
        <h1 class="quiz-name">Quizooo</h1>
        <p>Your Gateway to Interactive Learning</p>
    </header>
    
    <nav>
        <ul class="navbar">
            <li><a href="Login.jsp"><i class="fas fa-book"></i> Quizzes</a></li>
            <li><a href="Login.jsp"><i class="fas fa-sign-in-alt"></i> Login</a></li>
            <li><a href="Register.jsp"><i class="fas fa-user-plus"></i> Register</a></li>
            <li><a href="#"><i class="fas fa-trophy"></i> Leaderboard</a></li>
        </ul>
    </nav>

    <div class="container">
        <section class="hero-section">
            <h2>Transform Your Learning Journey</h2>
            <p>Join thousands of learners worldwide in their quest for knowledge</p>
            <a href="Login.jsp" class="cta-button">Get Started Now</a>
        </section>

        <div class="features">
            <div class="feature">
                <i class="fas fa-book-reader"></i>
                <h3>Interactive Learning</h3>
                <p>Engage with dynamic quizzes and real-time feedback to enhance your understanding</p>
            </div>
            
            <div class="feature">
                <i class="fas fa-clock"></i>
                <h3>Learn at Your Pace</h3>
                <p>Access content 24/7 and progress through materials at your own comfortable speed</p>
            </div>
            
            <div class="feature">
                <i class="fas fa-trophy"></i>
                <h3>Track Progress</h3>
                <p>Monitor your performance with detailed analytics and achievement badges</p>
            </div>
        </div>

        <div class="stats">
            <div class="stat">
                <div class="stat-number">10,000+</div>
                <p>Active Users</p>
            </div>
            <div class="stat">
                <div class="stat-number">500+</div>
                <p>Quizzes Available</p>
            </div>
            <div class="stat">
                <div class="stat-number">95%</div>
                <p>Satisfaction Rate</p>
            </div>
        </div>
    </div>

    <footer>
        <p>&copy; 2024 Quizooo Learning Platform. All rights reserved.</p>
    </footer>

    <script>
        // Animate stats numbers on scroll
        const stats = document.querySelectorAll('.stat-number');
        const animateStats = () => {
            stats.forEach(stat => {
                const value = parseInt(stat.textContent);
                let current = 0;
                const increment = value / 50;
                const updateCount = () => {
                    if(current < value) {
                        current += increment;
                        stat.textContent = Math.ceil(current) + (stat.textContent.includes('%') ? '%' : '+');
                        setTimeout(updateCount, 20);
                    } else {
                        stat.textContent = value + (stat.textContent.includes('%') ? '%' : '+');
                    }
                }
                updateCount();
            });
        }

        // Trigger animation when stats come into view
        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    animateStats();
                    observer.unobserve(entry.target);
                }
            });
        });

        document.querySelector('.stats').querySelectorAll('.stat').forEach(stat => {
            observer.observe(stat);
        });
    </script>
</body>
</html>