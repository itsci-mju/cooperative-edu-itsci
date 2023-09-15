package it_sci.model;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

@Entity
@Table(name = "teacheranswer")
public class TeacherAnswer {

    @Id
    @Column(name = "answerid",nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @GenericGenerator(name = "increment", strategy = "increment")
    private int answer_id;
    @Column(name = "answertext",length = 200,nullable = false)
    private String answer_text;
    @Column(name = "answerradio",nullable = false)
    private String answer_radio;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "assessmentid")
    private TeacherEvaluate teacherEvaluate;

    public TeacherAnswer() {
    }

    public TeacherAnswer(String answer_text, String answer_radio, TeacherEvaluate teacherEvaluate) {
        this.answer_text = answer_text;
        this.answer_radio = answer_radio;
        this.teacherEvaluate = teacherEvaluate;
    }

    public int getAnswer_id() {
        return answer_id;
    }

    public void setAnswer_id(int answer_id) {
        this.answer_id = answer_id;
    }

    public String getAnswer_text() {
        return answer_text;
    }

    public void setAnswer_text(String answer_text) {
        this.answer_text = answer_text;
    }

    public String getAnswer_radio() {
        return answer_radio;
    }

    public void setAnswer_radio(String answer_radio) {
        this.answer_radio = answer_radio;
    }

    public TeacherEvaluate getTeacherEvaluate() {
        return teacherEvaluate;
    }

    public void setTeacherEvaluate(TeacherEvaluate teacherEvaluate) {
        this.teacherEvaluate = teacherEvaluate;
    }
}
