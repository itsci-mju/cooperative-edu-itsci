package it_sci.model;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "mentorevaluate")
public class MentorEvaluate {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @GenericGenerator(name = "increment", strategy = "increment")
    @Column(name = "assessmentid")
    private long assessment_id;

    @Column(name = "score" ,nullable = false)
    private int score;
    @Column(name = "assessmentdate" ,nullable = false)
    private Date assessment_date;
    @Column(name = "assessmentstartdate" ,nullable = false)
    private Date assessment_startdate;
    @Column(name = "assessmentenddate" ,nullable = false)
    private Date assessment_enddate;
    @Column(name = "assessmentstatus" ,nullable = false)
    private String assessment_status;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "student_studentid")
    private Student student;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "mentorid")
    private Mentor mentor;

    public String getAssessment_status() {
        return assessment_status;
    }

    public MentorEvaluate(long assessment_id, int score, Date assessment_date, Date assessment_startdate, Date assessment_enddate, String assessment_status, Student student, Mentor mentor) {
        this.assessment_id = assessment_id;
        this.score = score;
        this.assessment_date = assessment_date;
        this.assessment_startdate = assessment_startdate;
        this.assessment_enddate = assessment_enddate;
        this.assessment_status = assessment_status;
        this.student = student;
        this.mentor = mentor;
    }
    public MentorEvaluate(long assessment_id, int score, Date assessment_date, Date assessment_startdate, Date assessment_enddate, String assessment_status, Mentor mentor) {
        this.assessment_id = assessment_id;
        this.score = score;
        this.assessment_date = assessment_date;
        this.assessment_startdate = assessment_startdate;
        this.assessment_enddate = assessment_enddate;
        this.assessment_status = assessment_status;
        this.mentor = mentor;
    }

    public MentorEvaluate(int score, Date assessment_date, Date assessment_startdate, Date assessment_enddate, String assessment_status, Student student, Mentor mentor) {
        this.score = score;
        this.assessment_date = assessment_date;
        this.assessment_startdate = assessment_startdate;
        this.assessment_enddate = assessment_enddate;
        this.assessment_status = assessment_status;
        this.student = student;
        this.mentor = mentor;
    }

    public MentorEvaluate() {

    }

    public long getAssessment_id() {
        return assessment_id;
    }

    public void setAssessment_id(long assessment_id) {
        this.assessment_id = assessment_id;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public Date getAssessment_date() {
        return assessment_date;
    }

    public void setAssessment_date(Date assessment_date) {
        this.assessment_date = assessment_date;
    }

    public Date getAssessment_startdate() {
        return assessment_startdate;
    }

    public void setAssessment_startdate(Date assessment_startdate) {
        this.assessment_startdate = assessment_startdate;
    }

    public Date getAssessment_enddate() {
        return assessment_enddate;
    }

    public void setAssessment_enddate(Date assessment_enddate) {
        this.assessment_enddate = assessment_enddate;
    }

    public String isAssessment_status() {
        return assessment_status;
    }

    public void setAssessment_status(String assessment_status) {
        this.assessment_status = assessment_status;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public Mentor getMentor() {
        return mentor;
    }

    public void setMentor(Mentor mentor) {
        this.mentor = mentor;
    }

}
