package it_sci.model;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "company")
public class Company {
    @Id
    @Column(name = "companyid", length = 11)
//    @GeneratedValue(strategy = GenerationType.IDENTITY)
//    @GenericGenerator(name = "increment", strategy = "increment")
    private int company_id;

    @Column(name = "companyname",nullable = false,length = 100)
    private String company_name;
    @Column(name = "companyaddress",nullable = false,columnDefinition = "TEXT")
    private String company_address;
    @Column(name = "coordinatorname",nullable = false,length = 100)
    private String coordinator_name;
    @Column(name = "phonenumber",nullable = false,length = 10)
    private String phone_number;
    @Column(name = "email",nullable = false,length = 50)
    private String email;
    @Column(name = "website",nullable = false,length = 100)
    private String website;
    @Column(name = "facebook",nullable = false,length = 100)
    private String facebook;
    @Column(name = "average",nullable = false)
    private double average;

//    @OneToMany(mappedBy = "company", cascade = CascadeType.ALL)
//    private List<Student> students;

    @OneToMany(mappedBy = "company", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private List<Student> students;


    public Company() {
    }

    public int getCompany_id() {
        return company_id;
    }

    public void setCompany_id(int company_id) {
        this.company_id = company_id;
    }

    public String getCompany_name() {
        return company_name;
    }

    public void setCompany_name(String company_name) {
        this.company_name = company_name;
    }

    public String getCompany_address() {
        return company_address;
    }

    public void setCompany_address(String company_address) {
        this.company_address = company_address;
    }

    public String getCoordinator_name() {
        return coordinator_name;
    }

    public void setCoordinator_name(String coordinator_name) {
        this.coordinator_name = coordinator_name;
    }

    public String getPhone_number() {
        return phone_number;
    }

    public void setPhone_number(String phone_number) {
        this.phone_number = phone_number;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        this.website = website;
    }

    public String getFacebook() {
        return facebook;
    }

    public void setFacebook(String facebook) {
        this.facebook = facebook;
    }

    public double getAverage() {
        return average;
    }

    public void setAverage(double average) {
        this.average = average;
    }

    public List<Student> getStudents() {
        return students;
    }

    public void setStudents(List<Student> students) {
        this.students = students;
    }
}
