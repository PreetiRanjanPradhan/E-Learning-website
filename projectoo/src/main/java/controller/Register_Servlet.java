package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.CallableStatement;
import java.sql.SQLException;
import dao.User;
import dao.UserDao;
import dao.UserDaoImpl;
import util.DBUtil; // Assuming you have a DBConnection utility class

@WebServlet("/Register_Servlet")
public class Register_Servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String recovery = request.getParameter("recovery");
        
        System.out.println("Attempting to register user: " + username);
        
        try (Connection conn = DBUtil.getConnection();
             CallableStatement stmt = conn.prepareCall("{CALL add_user(?, ?, ?, ?)}")) {
            
            // Set parameters for the stored procedure
            stmt.setString(1, username);
            stmt.setString(2, email);
            stmt.setString(3, password);
            stmt.setString(4, recovery);
            
            int result = stmt.executeUpdate();
            
            if (result > 0) {
                System.out.println("User registered successfully: " + username);
                response.sendRedirect("Login.jsp?registration=success");
            } else {
                System.out.println("Registration failed for user: " + username);
                response.sendRedirect("Register.jsp?error=1");
            }
            
        } catch (SQLException e) {
            System.err.println("SQL Exception during registration for user " + username + ": " + e.getMessage());
            e.printStackTrace();
            
            // Check for duplicate entry error (commonly error code 1062 in MySQL)
            if (e.getErrorCode() == 1062) {
                response.sendRedirect("Register.jsp?error=duplicate");
            } else {
                response.sendRedirect("Register.jsp?error=2");
            }
        } catch (Exception e) {
            System.err.println("Exception during registration for user " + username + ": " + e.getMessage());
            e.printStackTrace();
            response.sendRedirect("Register.jsp?error=2");
        }
    }
}