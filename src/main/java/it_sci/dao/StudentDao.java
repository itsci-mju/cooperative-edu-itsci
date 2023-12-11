package it_sci.dao;

import it_sci.model.Student;
import java.util.List;

public interface StudentDao {

    List<Student> getAllStudents();
    Student getStudentById(String student_id);
    List<Student> getStudentByCompanyId(int company_id, String Fterm);
    void saveStudent(Student student);
    void updateStudent(Student student);
    void deleteStudent(String student_id);

    List<Student> getStudentsBySemester (String semester);

    List<Student> getListStudentsBySemester(String semester);

    List<Student> getListStudents();

    List<Student> getListStudentsByTerm(String semester);

}
