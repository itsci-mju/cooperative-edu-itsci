package it_sci.model;

import javax.persistence.*;

@Entity
@Table(name = "mentoranswer")
public class MentorAnswer {
    @Id
    @Column(name = "answerid")
    private int answer_id;
    @Column(name = "answertext",length = 200 ,nullable = false)
    private String answer_text;
    @Column(name = "answerradio" ,nullable = false,length = 1)
    private String answer_radio;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "assessmentid")
    private MentorEvaluate mentorEvaluate;
}
