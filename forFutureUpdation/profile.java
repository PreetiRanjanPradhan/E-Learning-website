package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import util.DBUtil;
import dao.User;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;



@WebServlet("/profile")
public class profile extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("username")== null) {
            response.sendRedirect("Login.jsp");
            return;
        }
        String Fusername = (String) session.getAttribute("username");

        String query = "SELECT email, recovery FROM user WHERE username = ' "+ Fusername + "'";
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query))
        {
            ResultSet rs = preparedStatement.executeQuery();
            User user = new User();
            while (rs.next())
            {
                user.setEmail(rs.getString("email"));
                user.setRecovery(rs.getString("recovery"));
            }
            session.setAttribute("username", Fusername);
            session.setAttribute("email", user.getEmail());
            session.setAttribute("recovery", user.getRecovery());

            response.sendRedirect("profile.jsp");
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
    }

}