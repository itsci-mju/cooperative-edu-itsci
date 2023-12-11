package it_sci.model;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

@Entity
@Table(name = "mentoranswer")
public class MentorAnswer {
    @Id
    @Column(name = "answerid")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @GenericGenerator(name = "increment", strategy = "increment")
    private int answer_id;
    @Column(name = "answertext1", nullable = false)
    private String answer_text1;

    @Column(name = "answertext2", nullable = false)
    private String answer_text2;

    @Column(name = "answertext3", nullable = false)
    private String answer_text3;

    @Column(name = "answertext4", nullable = false)
    private String answer_text4;

    @Column(name = "answertext5", nullable = false)
    private String answer_text5;


    @Column(name = "answerscore", nullable = false)
    private String answer_score;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "assessmentid")
    private MentorEvaluate mentorEvaluate;

    public MentorAnswer() {
    }

    public MentorAnswer(String answer_text1, String answer_text2, String answer_text3, String answer_text4, String answer_text5, String answer_score, MentorEvaluate mentorEvaluate) {
        this.answer_text1 = answer_text1;
        this.answer_text2 = answer_text2;
        this.answer_text3 = answer_text3;
        this.answer_text4 = answer_text4;
        this.answer_text5 = answer_text5;
        this.answer_score = answer_score;
        this.mentorEvaluate = mentorEvaluate;
    }

    public int getAnswer_id() {
        return answer_id;
    }

    public void setAnswer_id(int answer_id) {
        this.answer_id = answer_id;
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

    public String getAnswer_text3() {
        return answer_text3;
    }

    public void setAnswer_text3(String answer_text3) {
        this.answer_text3 = answer_text3;
    }

    public String getAnswer_text4() {
        return answer_text4;
    }

    public void setAnswer_text4(String answer_text4) {
        this.answer_text4 = answer_text4;
    }

    public String getAnswer_text5() {
        return answer_text5;
    }

    public void setAnswer_text5(String answer_text5) {
        this.answer_text5 = answer_text5;
    }

    public String getAnswer_score() {
        return answer_score;
    }

    public void setAnswer_score(String answer_score) {
        this.answer_score = answer_score;
    }

    public MentorEvaluate getMentorEvaluate() {
        return mentorEvaluate;
    }

    public void setMentorEvaluate(MentorEvaluate mentorEvaluate) {
        this.mentorEvaluate = mentorEvaluate;
    }
}