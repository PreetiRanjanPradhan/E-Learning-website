package controller;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String firstname = request.getParameter("fName");
        String lastname = request.getParameter("lName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/e_learning_web", "root", "preeti@003");
             CallableStatement stmt = con.prepareCall("{CALL sp_registerUser(?, ?, ?, ?)}")) {

            // Load MySQL driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Set parameters and execute stored procedure
            stmt.setString(1, firstname);
            stmt.setString(2, lastname);
            stmt.setString(3, email);
            stmt.setString(4, password);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    String message = rs.getString("message");
                    if ("User Registered Successfully".equals(message)) {
                        // Registration successful
                        response.sendRedirect("login.jsp");
                    } else {
                        // Email already exists
                        request.setAttribute("errorMessage", "Email already exists!");
                        request.getRequestDispatcher("register.jsp").forward(request, response);
                    }
                }
            }

        } catch (ClassNotFoundException e) {
            // Handle driver class not found
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database driver not found. Please contact the administrator.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        } catch (SQLException e) {
            // Handle SQL exceptions
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred while accessing the database. Please try again.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }
}
