package dao;

import dao.User;

//@SuppressWarnings("unused")
public interface UserDao {

	boolean addUser(User user);
	boolean isValidUser(String username, String password);
}