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