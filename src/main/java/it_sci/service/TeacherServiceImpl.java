package it_sci.service;

import it_sci.dao.CompanyDao;
import it_sci.dao.TeacherDao;
import it_sci.model.Company;
import it_sci.model.MentorEvaluate;
import it_sci.model.Teacher;
import it_sci.model.TeacherEvaluate;
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
    public void saveTeacherEvaluate (TeacherEvaluate teacherEvaluate) {
        teacherDao.saveTeacherEvaluate(teacherEvaluate);
    }

    @Override
    @Transactional
    public List<Company> getCompanyToAssignByTeacher(int teacher_id) {
        return teacherDao.getCompanyToAssignByTeacher(teacher_id);
    }
}
