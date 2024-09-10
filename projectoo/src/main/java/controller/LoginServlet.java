package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/e_learning_web", "root", "preeti@003");
             CallableStatement stmt = con.prepareCall("{CALL sp_validateUser(?, ?)}")) {

            // Load MySQL driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Set parameters and execute stored procedure
            stmt.setString(1, email);
            stmt.setString(2, password);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    String message = rs.getString("message");
                    if ("Login Success".equals(message)) {
                        // Login successful
                        HttpSession session = request.getSession();
                        session.setAttribute("email", email);
                        response.sendRedirect("home.jsp");
                    } else {
                        // Login failed
                        request.setAttribute("errorMessage", "Invalid email or password!");
                        request.getRequestDispatcher("login.jsp").forward(request, response);
                    }
                }
            }

        } catch (ClassNotFoundException | SQLException e) {
            request.setAttribute("errorMessage", "An error occurred during login. Please try again.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
