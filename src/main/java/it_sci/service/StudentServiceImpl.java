package it_sci.service;

import it_sci.dao.StudentDao;
import it_sci.model.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class StudentServiceImpl implements StudentService {

    @Autowired
    private StudentDao studentDao;

    @Override
    @Transactional
    public List<Student> getAllStudents() {
        return studentDao.getAllStudents();
    }

    @Override
    @Transactional
    public Student getStudentById(String student_id) {
        return studentDao.getStudentById(student_id);
    }

    @Override
    @Transactional
    public List<Student> getStudentByCompanyId(int company_id) {
        return studentDao.getStudentByCompanyId(company_id);
    }

    @Override
    @Transactional
    public void saveStudent(Student student) {
        studentDao.saveStudent(student);
    }

    @Override
    @Transactional
    public void updateStudent(Student student) {
        studentDao.updateStudent(student);
    }

    @Override
    @Transactional
    public void deleteStudent(String student_id) {
        studentDao.deleteStudent(student_id);
    }
}
