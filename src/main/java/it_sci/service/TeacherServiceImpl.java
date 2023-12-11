package it_sci.service;

import it_sci.dao.CompanyDao;
import it_sci.dao.StudentDao;
import it_sci.dao.TeacherDao;
import it_sci.model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
public class TeacherServiceImpl implements TeacherService{
    @Autowired
    private TeacherDao teacherDao;

    @Override
    @Transactional
    public Teacher getTeacherById(int teacher_id) {
        return teacherDao.getTeacherById(teacher_id);
    }
    @Override
    @Transactional
    public List<Teacher> getAllTeachers() {
        return teacherDao.getAllTeachers();
    }

    @Override
    @Transactional
    public Student getStudent(String student_id) {
        return teacherDao.getStudent(student_id);
    }

    @Override
    @Transactional
    public List<Mentor> getMentorsByStudentId(String studentId) {
        return teacherDao.getMentorsByStudentId(studentId);
    }

    @Override
    public List<Student> getSemester(String semester) {
        return teacherDao.getSemester(semester);
    }


    @Override
    @Transactional
    public void saveTeacherEvaluate (TeacherEvaluate teacherEvaluate) {
        teacherDao.saveTeacherEvaluate(teacherEvaluate);
    }

    @Override
    @Transactional
    public List<Company> getCompanyToAssignByTeacher(int teacher_id) {
        return teacherDao.getCompanyToAssignByTeacher(teacher_id);
    }

    @Override
    @Transactional
    public List<Company> getListCompanySupervision(String semester,int teacher_id) {
        return teacherDao.getListCompanySupervision(semester,teacher_id);
    }

    @Override
    @Transactional
    public List<Company> getListCompanySupervision(int teacher_id) {
        return teacherDao.getListCompanySupervision(teacher_id);
    }
}
