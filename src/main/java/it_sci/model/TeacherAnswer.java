package it_sci.model;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

@Entity
@Table(name = "teacheranswer")
public class TeacherAnswer {

    @Id
    @Column(name = "answerid", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @GenericGenerator(name = "increment", strategy = "increment")
    private int answer_id;

    @Column(name = "answerscore", nullable = false)
    private String answer_score;

    @Column(name = "answertext1", nullable = false)
    private String answer_text1;

    @Column(name = "answertext2", nullable = false)
    private String answer_text2;


    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "assessmentid")
    private TeacherEvaluate teacherEvaluate;

    public TeacherAnswer() {
    }

    public TeacherAnswer(String answer_score, String answer_text1, String answer_text2, TeacherEvaluate teacherEvaluate) {
        this.answer_score = answer_score;
        this.answer_text1 = answer_text1;
        this.answer_text2 = answer_text2;
        this.teacherEvaluate = teacherEvaluate;
    }

    public int getAnswer_id() {
        return answer_id;
    }

    public void setAnswer_id(int answer_id) {
        this.answer_id = answer_id;
    }

    public String getAnswer_score() {
        return answer_score;
    }

    public void setAnswer_score(String answer_score) {
        this.answer_score = answer_score;
    }

    public String getAnswer_text1() {
        return answer_text1;
    }

    public void setAnswer_text1(String answer_text1) {
        this.answer_text1 = answer_text1;
    }

    public String getAnswer_text2() {
        return answer_text2;
    }

    public void setAnswer_text2(String answer_text2) {
        this.answer_text2 = answer_text2;
    }

    public TeacherEvaluate getTeacherEvaluate() {
        return teacherEvaluate;
    }

    public void setTeacherEvaluate(TeacherEvaluate teacherEvaluate) {
        this.teacherEvaluate = teacherEvaluate;
    }
}

