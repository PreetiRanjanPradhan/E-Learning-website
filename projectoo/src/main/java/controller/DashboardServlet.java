package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import dao.QuizDao;
import dao.ResultDao;
import dao.UserDao;
import dao.UserDaoImpl;
import Model.Quiz;
import Model.Result;
import dao.User;

@WebServlet("/DashboardServlet")
public class DashboardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        
        if (username == null) {
            response.sendRedirect("Login.jsp");
            return;
        }
        
        UserDao userDao = new UserDaoImpl();
        QuizDao quizDao = new QuizDao();
        ResultDao resultDao = new ResultDao();
        
        try {
            User user = userDao.getUserByUsername(username);
            List<Quiz> createdQuizzes = quizDao.getQuizzesByCreator(user.getId());
            List<Result> recentResults = resultDao.getRecentResultsByUser(user.getId(), 5); // Get last 5 results
            
            request.setAttribute("user", user);
            request.setAttribute("createdQuizzes", createdQuizzes);
            request.setAttribute("recentResults", recentResults);
            
            request.getRequestDispatcher("dashboard.jsp").forward(request, response);
        } catch (Exception e) {
            throw new ServletException("Error loading dashboard", e);
        }
    }
}