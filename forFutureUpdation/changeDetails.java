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

@WebServlet("/changeDetails")
public class changeDetails extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String recovery= request.getParameter("recovery");
        
        System.out.println("Attempting to change details: " + username);

        User user = new User();
        user.setUsername(username);
        user.setEmail(email);
        user.setPassword(password);
        user.setRecovery(recovery);
        
//        UserDao userDao = new UserDaoImpl();
//        try {
//            if (userDao.addUser(user)) {
//                System.out.println("User registered successfully: " + username);
//                response.sendRedirect("Login.jsp?registration=success");
//            } else {
//                System.out.println("Registration failed for user: " + username);
//                response.sendRedirect("Register.jsp?error=1");
//            }
//        } catch (Exception e) {
//            System.err.println("Exception during registration for user " + username + ": " + e.getMessage());
//            e.printStackTrace();
//            response.sendRedirect("Register.jsp?error=2");
//        }
//        
//        to be changed
    }
}