package Model;

public class Question {
    private int id;
    private String questionText;
    private String answer;
    private String[] options;

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getQuestionText() { return questionText; }
    public void setQuestionText(String questionText) { this.questionText = questionText; }

    public String getAnswer() { return answer; }
    public void setAnswer(String answer) { this.answer = answer; }

    public String[] getOptions() { return options; }
    public void setOptions(String[] options) { this.options = options; }
}
