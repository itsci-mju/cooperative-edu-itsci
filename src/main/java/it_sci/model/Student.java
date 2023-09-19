package it_sci.model;

import it_sci.service.TeacherEvaluateService;
import org.springframework.beans.factory.annotation.Autowired;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "student")
public class Student {
    @Id
    @Column(name = "studentid" ,length = 10)
    private String student_id;

    @Column(name = "studentname",length = 50 ,nullable = false)
    private String student_name;

    @Column(name = "studentlastname" ,length = 50,nullable = false)
    private String student_lastname;

    @Column(name = "password" ,length = 10,nullable = false)
    private String password;

    @Column(name = "workposition" ,length = 45,nullable = false)
    private String workposition;

    @Column(name = "startdate" ,nullable = false)
    private Date startdate;

    @Column(name = "enddate" ,nullable = false)
    private Date enddate;

    @Column(name = "semester" ,length = 45,nullable = false)
    private String semester;

    @Column(name = "mentorscore" ,nullable = false)
    private double mentor_score;

    @Column(name = "teacherscore" ,nullable = false)
    private double teacher_score;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "Company_companyid")
    private Company company;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "Teacher_teacherid")
    private Teacher teacher;

    @ManyToMany(cascade=CascadeType.ALL, mappedBy="students")
    private List<Mentor> mentors;

    @OneToMany(mappedBy = "student", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private List<MentorEvaluate> mentorEvaluateList = new ArrayList<>();
    @OneToMany(mappedBy = "student", cascade = CascadeType.ALL,fetch = FetchType.LAZY)
    private List<TeacherEvaluate> teacherEvaluates = new ArrayList<>();

    // เมธอดเพื่อเพิ่มข้อมูล Register เข้า List
    public double getSumScoreMentor() {
        double sum = 0.0;
        int count = 0;
        for (MentorEvaluate mentorEvaluate : mentorEvaluateList) {
            if (student_id.equals(mentorEvaluate.getStudent().getStudent_id())) {
                sum += mentorEvaluate.getScore();
                count++;
            }
        }
        if (!mentorEvaluateList.isEmpty()) {
            sum /= count;
        }
        System.out.println(sum);
        return sum;
    }
    // เมธอดเพื่อรวมคะแนนครู
    public double getSumScoreTeacher() {
        double sum = 0.0;
        for (TeacherEvaluate teacherEvaluates : teacherEvaluates) {
            if (student_id.equals(teacherEvaluates.getStudent().getStudent_id())) {
                sum += teacherEvaluates.getScore();
            }
        }
        System.out.println(sum);
        return sum;
    }
    public double calculateSumScoreTeacher() {
        double sum = 0.0;
        for (TeacherEvaluate teacherEvaluate : teacherEvaluates) {
            sum += teacherEvaluate.getScore();
        }
        return sum;
    }




    public Student() {
    }

    public Student(String student_id, String student_name, String student_lastname, String password, String workposition, Date startdate, Date enddate, String semester, double mentor_score, double teacher_score, Company company, Teacher teacher, List<Mentor> mentors) {
        this.student_id = student_id;
        this.student_name = student_name;
        this.student_lastname = student_lastname;
        this.password = password;
        this.workposition = workposition;
        this.startdate = startdate;
        this.enddate = enddate;
        this.semester = semester;
        this.mentor_score = mentor_score;
        this.teacher_score = teacher_score;
        this.company = company;
        this.teacher = teacher;
        this.mentors = mentors;
    }

    public String getStudent_id() {
        return student_id;
    }

    public void setStudent_id(String student_id) {
        this.student_id = student_id;
    }

    public String getStudent_name() {
        return student_name;
    }

    public void setStudent_name(String student_name) {
        this.student_name = student_name;
    }

    public String getStudent_lastname() {
        return student_lastname;
    }

    public void setStudent_lastname(String student_lastname) {
        this.student_lastname = student_lastname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getWorkposition() {
        return workposition;
    }

    public void setWorkposition(String workposition) {
        this.workposition = workposition;
    }

    public Date getStartdate() {
        return startdate;
    }

    public void setStartdate(Date startdate) {
        this.startdate = startdate;
    }

    public Date getEnddate() {
        return enddate;
    }

    public void setEnddate(Date enddate) {
        this.enddate = enddate;
    }

    public String getSemester() {
        return semester;
    }

    public void setSemester(String semester) {
        this.semester = semester;
    }

    public double getMentor_score() {
        return mentor_score;
    }

    public void setMentor_score(double mentor_score) {
        this.mentor_score = mentor_score;
    }

    public double getTeacher_score() {
        return teacher_score;
    }

    public void setTeacher_score(double teacher_score) {
        this.teacher_score = teacher_score;
    }

    public Company getCompany() {
        return company;
    }

    public void setCompany(Company company) {
        this.company = company;
    }

    public Teacher getTeacher() {
        return teacher;
    }

    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
    }

    public List<Mentor> getMentors() {
        return mentors;
    }

    public void setMentors(List<Mentor> mentors) {
        this.mentors = mentors;
    }

    public List<MentorEvaluate> getMentorEvaluateList() {
        return mentorEvaluateList;
    }

    public void setMentorEvaluateList(List<MentorEvaluate> mentorEvaluateList) {
        this.mentorEvaluateList = mentorEvaluateList;
    }

    public List<TeacherEvaluate> getTeacherEvaluates() {
        return teacherEvaluates;
    }

    public void setTeacherEvaluates(List<TeacherEvaluate> teacherEvaluates) {
        this.teacherEvaluates = teacherEvaluates;
    }
}
