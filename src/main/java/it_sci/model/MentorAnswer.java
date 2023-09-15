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
    @Column(name = "answertext",length = 200 ,nullable = false)
    private String answer_text;
    @Column(name = "answerradio" ,nullable = false,length = 1)
    private String answer_radio;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "assessmentid")
    private MentorEvaluate mentorEvaluate;

    public MentorAnswer() {
    }

    public MentorAnswer(String answer_text, String answer_radio, MentorEvaluate mentorEvaluate) {
        this.answer_text = answer_text;
        this.answer_radio = answer_radio;
        this.mentorEvaluate = mentorEvaluate;
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

    public MentorEvaluate getMentorEvaluate() {
        return mentorEvaluate;
    }

    public void setMentorEvaluate(MentorEvaluate mentorEvaluate) {
        this.mentorEvaluate = mentorEvaluate;
    }
}
