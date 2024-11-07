package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Enumeration;


@WebServlet("/CreateQuiz")
public class CreateQuiz extends HttpServlet {

	
	private static final String JDBC_URL = "jdbc:mysql://localhost:3306/adj_project";
    private static final String JDBC_USER = "root1";
    private static final String JDBC_PASSWORD = "1234";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    	HttpSession session = request.getSession(false);
    	if (session != null) {
    	  String username = (String) session.getAttribute("username");
    	  
    	} else {
    	  
    	}
    	System.out.println("Received parameters:");
        Enumeration<String> parameterNames = request.getParameterNames();
        while (parameterNames.hasMoreElements()) {
            String paramName = parameterNames.nextElement();
            String paramValue = request.getParameter(paramName);
            System.out.println(paramName + ": " + paramValue);
        }

        Connection conn = null;
        try {
            
            String quizName = request.getParameter("quizName");
            String questionCountStr = request.getParameter("questionCount");

            if (quizName == null || quizName.trim().isEmpty()) {
                throw new ServletException("Quiz name is required");
            }

            if (questionCountStr == null || questionCountStr.trim().isEmpty()) {
                throw new ServletException("Question count is required");
            }

            int questionCount = Integer.parseInt(questionCountStr);
            if (questionCount < 1) {
                throw new ServletException("At least one question is required");
            }

            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
            conn.setAutoCommit(false);

            try {
                
                String insertQuizSQL = "INSERT INTO quizzes (quiz_name) VALUES (?)";
                PreparedStatement quizStmt = conn.prepareStatement(insertQuizSQL,
                        Statement.RETURN_GENERATED_KEYS);
                quizStmt.setString(1, quizName);
                quizStmt.executeUpdate();

                
                ResultSet rs = quizStmt.getGeneratedKeys();
                int quizId = -1;
                if (rs.next()) {
                    quizId = rs.getInt(1);
                    System.out.println("Generated quiz ID: " + quizId);
                } else {
                    throw new ServletException("Failed to get generated quiz ID");
                }

                
                for (int i = 1; i <= questionCount; i++) {
                    String questionText = request.getParameter("question" + i);
                    String option1 = request.getParameter("option1_" + i);
                    String option2 = request.getParameter("option2_" + i);
                    String option3 = request.getParameter("option3_" + i);
                    String option4 = request.getParameter("option4_" + i);
                    String correctOptionStr = request.getParameter("correct" + i);

                    System.out.println("\nProcessing Question " + i);
                    System.out.println("Question Text: " + questionText);
                    System.out.println("Option 1: " + option1);
                    System.out.println("Option 2: " + option2);
                    System.out.println("Option 3: " + option3);
                    System.out.println("Option 4: " + option4);
                    System.out.println("Correct Answer: " + correctOptionStr);

                    
                    if (questionText == null || questionText.trim().isEmpty() ||
                            option1 == null || option1.trim().isEmpty() ||
                            option2 == null || option2.trim().isEmpty() ||
                            option3 == null || option3.trim().isEmpty() ||
                            option4 == null || option4.trim().isEmpty() ||
                            correctOptionStr == null || correctOptionStr.trim().isEmpty()) {
                        throw new ServletException("All fields are required for question " + i);
                    }

                    int correctOption = Integer.parseInt(correctOptionStr);
                    if (correctOption < 1 || correctOption > 4) {
                        throw new ServletException("Invalid correct option for question " + i);
                    }

                    
                    String insertQuestionSQL = "INSERT INTO questions (quiz_id, question_text, " +
                            "option1, option2, option3, option4, correct_option) " +
                            "VALUES (?, ?, ?, ?, ?, ?, ?)";
                    PreparedStatement questionStmt = conn.prepareStatement(insertQuestionSQL);
                    questionStmt.setInt(1, quizId);
                    questionStmt.setString(2, questionText);
                    questionStmt.setString(3, option1);
                    questionStmt.setString(4, option2);
                    questionStmt.setString(5, option3);
                    questionStmt.setString(6, option4);
                    questionStmt.setInt(7, correctOption);
                    questionStmt.executeUpdate();
                }

                conn.commit();
                System.out.println("Transaction committed successfully");
                response.sendRedirect(request.getContextPath() + "/Dashboard");

            } catch (SQLException e) {
                if (conn != null) {
                    conn.rollback();
                }
                throw e;
            }
        } catch (Exception e) {
            System.err.println("Error in QuizServlet: " + e.getMessage());
            e.printStackTrace();
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                System.err.println("Error closing connection: " + e.getMessage());
            }
        }
    }

}
