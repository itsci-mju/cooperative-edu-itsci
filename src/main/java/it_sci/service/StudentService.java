package it_sci.service;

import it_sci.model.Student;

import java.util.List;

public interface StudentService {

    List<Student> getAllStudents();
    Student getStudentById(String student_id);

    List<Student> getStudentByCompanyId(int company_id);
    void saveStudent(Student student);
    void updateStudent(Student student);
    void deleteStudent(String student_id);

    List<Student> getStudentsBySemester(String semester);

}
