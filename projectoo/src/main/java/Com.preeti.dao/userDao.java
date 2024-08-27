public interface userDao {
    boolean isValidUser(String email, char password);
    boolean addUser(User user);
}