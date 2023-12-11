package it_sci.model;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "teacher")
public class Teacher {

    @Id
    @Column(name = "teacherid", length = 11)
//    @GeneratedValue(strategy = GenerationType.IDENTITY)
//    @GenericGenerator(name = "increment", strategy = "increment")
    private int teacher_id;

    @Column(name = "teachername", length = 50, nullable = false)
    private String teacher_name;

    @Column(name = "teacherlastname", length = 50, nullable = false)
    private String teacher_lastname;
    @Column(name = "phonenumber", length = 10, nullable = false)
    private String phone_number;
    @Column(name = "teacheremail", length = 50, nullable = false)
    private String teacher_email;
    @Column(name = "password", length = 10, nullable = false)
    private String password;
    @Column(name = "teachertype", length = 20, nullable = false)
    private String teacher_type;
    @Column(name = "teacherimg", length = 100, nullable = false)
    private String teacher_image;
    @Column(name = "status", length = 15, nullable = false)
    private String status;

    @OneToMany(mappedBy = "teacher", cascade = CascadeType.ALL)
    private List<TeacherEvaluate> teacherEvaluates;

    public Teacher() {
    }

    public Teacher(int teacher_id, String teacher_name, String teacher_lastname, String phone_number, String teacher_email, String password, String teacher_type, String teacher_image, String status) {
        this.teacher_id = teacher_id;
        this.teacher_name = teacher_name;
        this.teacher_lastname = teacher_lastname;
        this.phone_number = phone_number;
        this.teacher_email = teacher_email;
        this.password = password;
        this.teacher_type = teacher_type;
        this.teacher_image = teacher_image;
        this.status = status;
    }

    public int getTeacher_id() {
        return teacher_id;
    }

    public void setTeacher_id(int teacher_id) {
        this.teacher_id = teacher_id;
    }

    public String getTeacher_name() {
        return teacher_name;
    }

    public void setTeacher_name(String teacher_name) {
        this.teacher_name = teacher_name;
    }

    public String getTeacher_lastname() {
        return teacher_lastname;
    }

    public void setTeacher_lastname(String teacher_lastname) {
        this.teacher_lastname = teacher_lastname;
    }

    public String getPhone_number() {
        return phone_number;
    }

    public void setPhone_number(String phone_number) {
        this.phone_number = phone_number;
    }

    public String getTeacher_email() {
        return teacher_email;
    }

    public void setTeacher_email(String teacher_email) {
        this.teacher_email = teacher_email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getTeacher_type() {
        return teacher_type;
    }

    public void setTeacher_type(String teacher_type) {
        this.teacher_type = teacher_type;
    }

    public String getTeacher_image() {
        return teacher_image;
    }

    public void setTeacher_image(String teacher_image) {
        this.teacher_image = teacher_image;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public List<TeacherEvaluate> getTeacherEvaluates() {
        return teacherEvaluates;
    }

    public void setTeacherEvaluates(List<TeacherEvaluate> teacherEvaluates) {
        this.teacherEvaluates = teacherEvaluates;
    }
}
