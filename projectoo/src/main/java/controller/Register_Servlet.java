package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import dao.User;
import dao.UserDao;
import dao.UserDaoImpl;

@WebServlet("/Register_Servlet")
public class Register_Servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Register_Servlet() {
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
        String email = request.getParameter("email");

        User user = new User();
        user.setUsername(username);
        user.setEmail(email);
        user.setPassword(password);

        UserDao userDao = new UserDaoImpl(); // Instantiate UserDaoImpl
        if (userDao.addUser(user)) {
            response.sendRedirect("Login.jsp?registration=success");
        } else {
            response.sendRedirect("Register.jsp?error=1");
            System.out.println("Registration failed: Could not add user");
        }
    }
}
