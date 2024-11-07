package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Question;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Servlet implementation class resOfQuiz
 */
@WebServlet("/resOfQuiz")
public class resOfQuiz extends HttpServlet {
	private static final String JDBC_URL = "jdbc:mysql://localhost:3306/adj_project";
    private static final String JDBC_USER = "root1";
    private static final String JDBC_PASSWORD = "1234";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int quizId = Integer.parseInt(request.getParameter("quizId"));
        Connection conn = null;
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);

            // Get quiz name
            String quizNameQuery = "SELECT quiz_name FROM quizzes WHERE quiz_id = ?";
            PreparedStatement quizStmt = conn.prepareStatement(quizNameQuery);
            quizStmt.setInt(1, quizId);
            ResultSet quizRs = quizStmt.executeQuery();
            quizRs.next();
            String quizName = quizRs.getString("quiz_name");

            // Get all questions for this quiz
            String questionQuery = "SELECT * FROM questions WHERE quiz_id = ? ORDER BY question_id";
            PreparedStatement questionStmt = conn.prepareStatement(questionQuery);
            questionStmt.setInt(1, quizId);
            ResultSet rs = questionStmt.executeQuery();

            List<Question> questions = new ArrayList<>();
            Map<Integer, Boolean> results = new HashMap<>();
            int totalQuestions = 0;
            int correctAnswers = 0;

            while (rs.next()) {
                totalQuestions++;
                Question question = new Question(
                    rs.getInt("quiz_id"),
                    rs.getString("question_text"),
                    rs.getString("option1"),
                    rs.getString("option2"),
                    rs.getString("option3"),
                    rs.getString("option4"),
                    rs.getInt("correct_option")
                );
                questions.add(question);

                // Get user's answer for this question
                String answerParam = "answer_" + totalQuestions;
                String userAnswerStr = request.getParameter(answerParam);
                
                if (userAnswerStr != null) {
                    int userAnswer = Integer.parseInt(userAnswerStr);
                    boolean isCorrect = (userAnswer == question.getCorrectOption());
                    results.put(totalQuestions, isCorrect);
                    if (isCorrect) {
                        correctAnswers++;
                    }
                }
            }

            // Calculate percentage
            double percentage = (double) correctAnswers / totalQuestions * 100;

            // Set attributes for the result page
            request.setAttribute("quizName", quizName);
            request.setAttribute("totalQuestions", totalQuestions);
            request.setAttribute("correctAnswers", correctAnswers);
            request.setAttribute("percentage", percentage);
            request.setAttribute("questions", questions);
            request.setAttribute("results", results);

            // Forward to result page
            request.getRequestDispatcher("/quizResult.jsp").forward(request, response);

        } catch (Exception e) {
            throw new ServletException("Error processing quiz submission", e);
        } finally {
            try {
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

}
