package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import util.DBUtil;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


@WebServlet("/QuizDetail")
public class QuizDetail extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        String quizName = request.getParameter("quizName");

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.getConnection();
            stmt = conn.prepareStatement("SELECT created_at, updated_at FROM quizzes WHERE quiz_name = ?");
            stmt.setString(1, quizName);
            rs = stmt.executeQuery();

            if (rs.next()) {
                String createdAt = rs.getString("created_at");
                String updatedAt = rs.getString("updated_at");

                // Set all attributes
                request.setAttribute("quizName", quizName);  // Add this line
                request.setAttribute("createdAt", createdAt);
                request.setAttribute("updatedAt", updatedAt);
                
                // Use RequestDispatcher instead of redirect
                RequestDispatcher dispatcher = request.getRequestDispatcher("/x.jsp");  // Change to .jsp
                dispatcher.forward(request, response);
            } else {
                response.sendRedirect("error.jsp");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Close resources
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

}
