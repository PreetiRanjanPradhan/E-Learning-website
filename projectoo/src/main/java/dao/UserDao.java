package dao;

import java.util.List;

import dao.User;

public interface UserDao {

	boolean addUser(User user);
	boolean isValidUser(String username, String password);
	boolean isRecoveryCorrect(String username,String recovery);
	User getUserByUsername(String username);
	List<String> getDistinctQuizNames();
}