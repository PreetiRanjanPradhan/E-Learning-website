package dao;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.DBUtil;

public class UserDaoImpl implements UserDao {
    

    public boolean addUser(User user) {
        String query = "{CALL ADJ_Project.add_user(?, ?, ?, ?)}";
        try (Connection connection = DBUtil.getConnection();
             CallableStatement callableStatement = connection.prepareCall(query)) {
            callableStatement.setString(1, user.getUsername());
            callableStatement.setString(2, user.getEmail());
            callableStatement.setString(3, user.getPassword());
            callableStatement.setString(4, user.getRecovery());
            int rowsAffected = callableStatement.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("User added successfully");
                return true;
            } else {
                System.out.println("No rows affected when adding user");
                return false;
            }
        } catch (SQLException e) {
            System.err.println("SQL Exception when adding user: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    public boolean isValidUser(String username, String password) {
        String query = "SELECT * FROM users WHERE username = ? AND password = ?";
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);
            ResultSet resultSet = preparedStatement.executeQuery();
            return resultSet.next();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

	public boolean isRecoveryCorrect(String username, String recovery) {
		String query = "SELECT * FROM users WHERE username = ? and recovery =?";
		try (Connection connection = DBUtil.getConnection();
	             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
	            preparedStatement.setString(1, username);
	            preparedStatement.setString(2, recovery);
	            ResultSet resultSet = preparedStatement.executeQuery();
	            return resultSet.next();
	        } catch (SQLException e) {
	            e.printStackTrace();
	            return false;
	        }
	}
	
	public User getUserByUsername(String username) {
	    String query = "SELECT * FROM users WHERE username = ?";
	    try (Connection connection = DBUtil.getConnection();
	         PreparedStatement preparedStatement = connection.prepareStatement(query)) {
	        preparedStatement.setString(1, username);
	        ResultSet resultSet = preparedStatement.executeQuery();
	        if (resultSet.next()) {
	            User user = new User();
	            user.setUsername(resultSet.getString("username"));
	            user.setEmail(resultSet.getString("email"));
	            user.setPassword(resultSet.getString("password"));
	            user.setRecovery(resultSet.getString("recovery"));
	            return user;
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return null; // Return null if no user is found or an exception occurs
	}
	
	public List<String> getDistinctQuizNames() {
		List<String> names = new ArrayList<>();
        String query = "SELECT DISTINCT quiz_name FROM quizzes ORDER BY quiz_name";
        
        try (Connection connection = DBUtil.getConnection();
   	         PreparedStatement preparedStatement = connection.prepareStatement(query);
             ResultSet rs = preparedStatement.executeQuery()) {
            
            while (rs.next()) {
                names.add(rs.getString("quiz_name"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return names;
    }
    
    
}
