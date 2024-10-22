package Model;

import java.util.Date;

public class Result {
    private int id;
    private int userId;
    private int quizId;
    private int score;
    private Date completionTime;

    // Getters and setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    
    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }
    
    public int getQuizId() { return quizId; }
    public void setQuizId(int quizId) { this.quizId = quizId; }
    
    public int getScore() { return score; }
    public void setScore(int score) { this.score = score; }
    
    public Date getCompletionTime() { return completionTime; }
    public void setCompletionTime(Date completionTime) { this.completionTime = completionTime; }
}