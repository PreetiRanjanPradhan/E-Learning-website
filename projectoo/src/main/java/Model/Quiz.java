package Model;

import java.util.List;

public class Quiz {
    private int id;
    private String title;
    private int creatorId;
    private String code;
    private List<Question> questions;

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    
    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }
    
    public int getCreatorId() { return creatorId; }
    public void setCreatorId(int creatorId) { this.creatorId = creatorId; }
    
    public String getCode() { return code; }
    public void setCode(String code) { this.code = code; }
    
    public List<Question> getQuestions() { return questions; }
    public void setQuestions(List<Question> questions) { this.questions = questions; }
}