package dao;

import java.util.List;
import dao.Review;

public interface ReviewDao {
    boolean addReview(Review review);
    List<Review> getAllReviews();
}
