package it_sci.model;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "teacherevaluate")
public class TeacherEvaluate {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @GenericGenerator(name = "increment", strategy = "increment")
    @Column(name = "assessmentid")
    private long assessment_id;
    @Column(name = "score",nullable = false)
    private int score;
    @Column(name = "semester",nullable = false)
    private String semester;
    @Column(name = "assessmentdate")
    private Date assessment_date;
    @Column(name = "assessmentstartdate",nullable = false)
    private Date assessment_startdate;
    @Column(name = "assessmentenddate",nullable = false)
    private Date assessment_enddate;
    @Column(name = "assessmentstatus",nullable = false)
    private String assessment_status;
    @Column(name = "teachersupervisiondate",nullable = false)
    private Date teacher_super_vision_date;
    @Column(name = "teachersupervisiontime",nullable = false)
    private String teacher_super_vision_time;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "teacherid")
    private Teacher teacher;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "student_studentid")
    private Student student;

    public TeacherEvaluate(int score, String semester, Date assessment_startdate, Date assessment_enddate, String assessment_status, Date teacher_super_vision_date, String teacher_super_vision_time, Teacher teacher, Student student) {
        this.score = score;
        this.semester = semester;
        this.assessment_startdate = assessment_startdate;
        this.assessment_enddate = assessment_enddate;
        this.assessment_status = assessment_status;
        this.teacher_super_vision_date = teacher_super_vision_date;
        this.teacher_super_vision_time = teacher_super_vision_time;
        this.teacher = teacher;
        this.student = student;
    }

    public TeacherEvaluate() {

    }

    public TeacherEvaluate(int score, Date assessment_date, Date assessment_startdate, Date assessment_enddate, String assessment_status,Student student, Teacher teacher) {
        this.score = score;
        this.assessment_date = assessment_date;
        this.assessment_startdate = assessment_startdate;
        this.assessment_enddate = assessment_enddate;
        this.assessment_status = assessment_status;
        this.student = student;
        this.teacher = teacher;
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

    public String getSemester() {
        return semester;
    }

    public void setSemester(String semester) {
        this.semester = semester;
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

    public String getAssessment_status() {
        return assessment_status;
    }

    public void setAssessment_status(String assessment_status) {
        this.assessment_status = assessment_status;
    }

    public Date getTeacher_super_vision_date() {
        return teacher_super_vision_date;
    }

    public void setTeacher_super_vision_date(Date teacher_super_vision_date) {
        this.teacher_super_vision_date = teacher_super_vision_date;
    }

    public String getTeacher_super_vision_time() {
        return teacher_super_vision_time;
    }

    public void setTeacher_super_vision_time(String teacher_super_vision_time) {
        this.teacher_super_vision_time = teacher_super_vision_time;
    }

    public Teacher getTeacher() {
        return teacher;
    }

    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }
}
