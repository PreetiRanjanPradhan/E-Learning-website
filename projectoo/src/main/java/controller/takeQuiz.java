package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Question;
import util.DBUtil;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


@WebServlet("/takeQuiz")
public class takeQuiz extends HttpServlet {
	private static final String JDBC_URL = "jdbc:mysql://localhost:3306/adj_project";
    private static final String JDBC_USER = "root1";
    private static final String JDBC_PASSWORD = "1234";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String quizName = request.getParameter("quizName");
        System.out.println("Quiz Name received: " + quizName); // Debug print

        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);

            // First get the quiz ID
            String quizQuery = "SELECT quiz_id FROM quizzes WHERE quiz_name = ?";
            PreparedStatement quizStmt = conn.prepareStatement(quizQuery);
            quizStmt.setString(1, quizName);
            ResultSet quizRs = quizStmt.executeQuery();

            if (!quizRs.next()) {
                throw new ServletException("Quiz not found");
            }
            int quizId = quizRs.getInt("quiz_id");
            System.out.println("Quiz ID found: " + quizId); // Debug print

            // Now get all questions for this quiz
            String questionQuery = "SELECT * FROM questions WHERE quiz_id = ?";
            PreparedStatement questionStmt = conn.prepareStatement(questionQuery);
            questionStmt.setInt(1, quizId);
            ResultSet rs = questionStmt.executeQuery();

            List<Question> questions = new ArrayList<>();
            while (rs.next()) {
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
                System.out.println("Added question: " + question.getQuestionText()); // Debug print
            }

            System.out.println("Total questions loaded: " + questions.size()); // Debug print

            // Set attributes and forward to JSP
            request.setAttribute("quizId", quizId);
            request.setAttribute("quizName", quizName);
            request.setAttribute("questions", questions);

            // Debug prints
            System.out.println("Attributes set:");
            System.out.println("quizId: " + request.getAttribute("quizId"));
            System.out.println("quizName: " + request.getAttribute("quizName"));
            System.out.println("questions size: " + ((List<Question>)request.getAttribute("questions")).size());

            request.getRequestDispatcher("/takeQuiz.jsp").forward(request, response);

        } catch (Exception e) {
            System.out.println("Error occurred: " + e.getMessage()); // Debug print
            e.printStackTrace();
            throw new ServletException("Error loading quiz", e);
        } finally {
            try {
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

}
