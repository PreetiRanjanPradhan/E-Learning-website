package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import dao.UserDao;
import dao.UserDaoImpl;


@WebServlet("/Dashboard")
public class Dashboard extends HttpServlet {
	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
	 HttpSession session = request.getSession(false);
	 if (session != null) {
	   String username = (String) session.getAttribute("username");
	   // Use username
	 } else {
	   // Handle case where no session exists (e.g., redirect to login)
	 }
        // Get distinct names from database
	 	UserDao userDao = new UserDaoImpl();
        List<String> distinctNames = userDao.getDistinctQuizNames();
        
        // Store names in request attribute
        request.setAttribute("names", distinctNames);
        
        // Forward to JSP page
        RequestDispatcher dispatcher = request.getRequestDispatcher("/dashboard.jsp");
        dispatcher.forward(request, response);
    }
 @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
	 HttpSession session = request.getSession(false);
	 if (session != null) {
	   String username = (String) session.getAttribute("username");
	   // Use username
	 } else {
	   // Handle case where no session exists (e.g., redirect to login)
	 }
        // Get distinct names from database
	 	UserDao userDao = new UserDaoImpl();
        List<String> distinctNames = userDao.getDistinctQuizNames();
        
        // Store names in request attribute
        request.setAttribute("names", distinctNames);
        
        // Forward to JSP page
        RequestDispatcher dispatcher = request.getRequestDispatcher("/dashboard.jsp");
        dispatcher.forward(request, response);
    }

}
