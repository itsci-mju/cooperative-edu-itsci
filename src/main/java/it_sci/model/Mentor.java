package it_sci.model;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "mentor")
public class Mentor {
    @Id
    @Column(name = "mentorid", length = 11)
//    @GeneratedValue(strategy = GenerationType.IDENTITY)
//    @GenericGenerator(name = "increment", strategy = "increment")
    private int mentor_id;
    @Column(name = "mentorname", length = 50, nullable = false)
    private String mentor_name;
    @Column(name = "mentorlastname", length = 50, nullable = false)
    private String mentor_lastname;
    @Column(name = "mentornickname", length = 50, nullable = false)
    private String mentor_nickname;
    @Column(name = "mentorposition", length = 50, nullable = false)
    private String mentor_position;
    @Column(name = "metoremail", length = 50, nullable = false)
    private String mentor_email;
    @Column(name = "password", length = 10, nullable = false)
    private String password;
    @Column(name = "mentorline", length = 100, nullable = false)
    private String mentor_line;
    @Column(name = "mentorfacebook", length = 100, nullable = false)
    private String mentor_facebook;
    @Column(name = "phonenumber", length = 10, nullable = false)
    private String phone_number;
    @Column(name = "mentorimg", length = 200, nullable = false)
    private String mentor_image;
    @Column(name = "mentorprefix",length = 7)
    private String mentor_prefix;

    @ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinTable(name="mentor_student", joinColumns=@JoinColumn(name="mentor_mentorid"), inverseJoinColumns=@JoinColumn(name="student_studentid"))
    private List<Student> students;

    public int getMentor_id() {
        return mentor_id;
    }

    public void setMentor_id(int mentor_id) {
        this.mentor_id = mentor_id;
    }

    public String getMentor_name() {
        return mentor_name;
    }

    public void setMentor_name(String mentor_name) {
        this.mentor_name = mentor_name;
    }

    public String getMentor_lastname() {
        return mentor_lastname;
    }

    public void setMentor_lastname(String mentor_lastname) {
        this.mentor_lastname = mentor_lastname;
    }

    public String getMentor_nickname() {
        return mentor_nickname;
    }

    public void setMentor_nickname(String mentor_nickname) {
        this.mentor_nickname = mentor_nickname;
    }

    public String getMentor_position() {
        return mentor_position;
    }

    public void setMentor_position(String mentor_position) {
        this.mentor_position = mentor_position;
    }

    public String getMentor_email() {
        return mentor_email;
    }

    public void setMentor_email(String mentor_email) {
        this.mentor_email = mentor_email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getMentor_line() {
        return mentor_line;
    }

    public void setMentor_line(String mentor_line) {
        this.mentor_line = mentor_line;
    }

    public String getMentor_facebook() {
        return mentor_facebook;
    }

    public void setMentor_facebook(String mentor_facebook) {
        this.mentor_facebook = mentor_facebook;
    }

    public String getPhone_number() {
        return phone_number;
    }

    public void setPhone_number(String phone_number) {
        this.phone_number = phone_number;
    }

    public String getMentor_image() {
        return mentor_image;
    }

    public void setMentor_image(String mentor_image) {
        this.mentor_image = mentor_image;
    }

    public String getMentor_prefix() {
        return mentor_prefix;
    }

    public void setMentor_prefix(String mentor_prefix) {
        this.mentor_prefix = mentor_prefix;
    }

    public List<Student> getStudents() {
        return students;
    }

    public void setStudents(List<Student> students) {
        this.students = students;
    }
}
