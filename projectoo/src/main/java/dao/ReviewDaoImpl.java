package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import util.DBUtil;

public class ReviewDaoImpl implements ReviewDao {

    @Override
    public boolean addReview(Review review) {
        String query = "INSERT INTO reviews (username, message) VALUES (?, ?)";
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, review.getUsername());
            preparedStatement.setString(2, review.getMessage());
            int rowsAffected = preparedStatement.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public List<Review> getAllReviews() {
        String query = "SELECT * FROM reviews";
        List<Review> reviews = new ArrayList<>();
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query);
             ResultSet resultSet = preparedStatement.executeQuery()) {
            while (resultSet.next()) {
                Review review = new Review();
                review.setId(resultSet.getInt("id"));
                review.setUsername(resultSet.getString("username"));
                review.setMessage(resultSet.getString("message"));
                review.setCreatedAt(resultSet.getTimestamp("created_at"));
                reviews.add(review);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reviews;
    }
}
