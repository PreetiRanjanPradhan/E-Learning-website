package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import Model.Quiz;
import util.DBUtil;

public class QuizDao {
    
    public boolean createQuiz(Quiz quiz) throws SQLException {
        String sql = "INSERT INTO quizzes (title, creator_id, code) VALUES (?, ?, ?)";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            pstmt.setString(1, quiz.getTitle());
            pstmt.setInt(2, quiz.getCreatorId());
            pstmt.setString(3, quiz.getCode());
            int affectedRows = pstmt.executeUpdate();
            if (affectedRows > 0) {
                try (ResultSet generatedKeys = pstmt.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        quiz.setId(generatedKeys.getInt(1));
                    }
                }
                return true;
            }
        }
        return false;
    }
    
    public Quiz getQuizByCode(String code) throws SQLException {
        String sql = "SELECT * FROM quizzes WHERE code = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, code);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    Quiz quiz = new Quiz();
                    quiz.setId(rs.getInt("id"));
                    quiz.setTitle(rs.getString("title"));
                    quiz.setCreatorId(rs.getInt("creator_id"));
                    quiz.setCode(rs.getString("code"));
                    return quiz;
                }
            }
        }
        return null;
    }

    public List<Quiz> getQuizzesByCreator(int creatorId) throws SQLException {
        String sql = "SELECT * FROM quizzes WHERE creator_id = ?";
        List<Quiz> quizzes = new ArrayList<>();

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, creatorId);

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Quiz quiz = new Quiz();
                    quiz.setId(rs.getInt("id"));
                    quiz.setTitle(rs.getString("title"));
                    quiz.setCreatorId(rs.getInt("creator_id"));
                    quiz.setCode(rs.getString("code"));
                    quizzes.add(quiz);
                }
            }
        }
        return quizzes;
    }

    
    // Add more methods for updating, deleting, and listing quizzes
}