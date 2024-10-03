package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import util.DBUtil;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dao.UserDao;
import dao.UserDaoImpl;

@WebServlet("/changePassword")
public class changePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false); 

	    if (session == null || session.getAttribute("username")== null) {
	        response.sendRedirect("Login.jsp");
	        return;
	    }
	    String Fusername = (String) session.getAttribute("username");
	    String newPass = request.getParameter("newPassword");
	    String query = "UPDATE users SET password = ? WHERE username ="+"'"+ Fusername+"'";
		try (Connection connection = DBUtil.getConnection();
	             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
	            preparedStatement.setString(1, newPass);
	            int rs = preparedStatement.executeUpdate();
	            response.sendRedirect("Login.jsp");
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }

}
}
