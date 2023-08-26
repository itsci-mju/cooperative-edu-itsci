package it_sci.model;

import javax.persistence.*;

@Entity
@Table(name = "teacheranswer")
public class TeacherAnswer {

    @Id
    @Column(name = "answerid",nullable = false)
    private int answer_id;
    @Column(name = "answertext",length = 200,nullable = false)
    private String answer_text;
    @Column(name = "answerradio",nullable = false)
    private int answer_radio;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "assessmentid")
    private TeacherEvaluate teacherEvaluate;
}
