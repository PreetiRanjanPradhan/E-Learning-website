package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import dao.UserDao;
import dao.UserDaoImpl;

@WebServlet("/LoginServ")
public class LoginServ extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public LoginServ() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        UserDao userDao = new UserDaoImpl();
        if (userDao.isValidUser(username, password)) 
        {
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/Dashboard");
            dispatcher.forward(request, response);
//            response.sendRedirect("dashboard.jsp");
        } 
        else 
        {
        	response.sendRedirect("Login.jsp?error=1");
            System.out.println("Login failed: Invalid username or password");
        }
    
    }
}
