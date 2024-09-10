package dao;

public interface UserDao {
    boolean isValidUser(String email, String password);
    boolean addUser(User user);
}
