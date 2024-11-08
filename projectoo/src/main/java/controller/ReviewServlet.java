package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import dao.Review;
import dao.ReviewDao;
import dao.ReviewDaoImpl;


@WebServlet("/ReviewServlet")
public class ReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private ReviewDao reviewDao = new ReviewDaoImpl();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String message = request.getParameter("message");

        // Create and set the review object
        Review review = new Review();
        review.setUsername(username);
        review.setMessage(message);

        // Save to database
        boolean success = reviewDao.addReview(review);

        if (success) {
            response.sendRedirect("review.jsp?success=1");
        } else {
            response.sendRedirect("review.jsp?error=1");
        }
    }
}
