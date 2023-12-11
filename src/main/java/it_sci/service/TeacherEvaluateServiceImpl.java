package it_sci.service;


import it_sci.dao.StudentDao;
import it_sci.dao.TeacherEvaluateDao;
import it_sci.model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
public class TeacherEvaluateServiceImpl implements TeacherEvaluateService {

    @Autowired
    private TeacherEvaluateDao teacherEvaluateDao;

    @Autowired
    private StudentDao studentDao;




    @Override
    @Transactional
    public List<TeacherEvaluate> getTeacherEvaluateByTeacherId(int tEvaId, int companyId,String semester) {
        return teacherEvaluateDao.getTeacherEvaluateByTeacherId(tEvaId,companyId,semester);
    }

    @Override
    @Transactional
    public List<TeacherEvaluate> getViewTeacherEvaluateByStudentSemester(String semester, int teacher_id) {
        return teacherEvaluateDao.getViewTeacherEvaluateByStudentSemester(semester,teacher_id);
    }

//    @Override
//    @Transactional
//    public List<TeacherEvaluate> getTeacherEvaluateByTeacherId(int tEvaId, int companyId,String semester) {
//            return teacherEvaluateDao.getTeacherEvaluateByTeacherId(tEvaId,companyId,semester);
//    }

    @Override
    @Transactional
    public List<TeacherEvaluate> getViewTeacherEvaluate(int teacher_id) {
        return teacherEvaluateDao.getViewTeacherEvaluate(teacher_id);
    }

    @Override
    @Transactional
    public List<TeacherEvaluate> getStatusByStudentSemester(String semester) {
        return teacherEvaluateDao.getStatusByStudentSemester(semester);
    }


    @Override
    @Transactional
    public List<String> getAllListSemester()  {
        return teacherEvaluateDao.getAllListSemester();

    }

    @Override
    @Transactional
    public List<TeacherAnswer> getTeacherAnswerBySemester() {
        return teacherEvaluateDao.getTeacherAnswerBySemester();
    }

    @Override
    @Transactional
    public void saveTeacherEvaluate(TeacherEvaluate teacherEvaluate) {
        teacherEvaluateDao.saveTeacherEvaluate(teacherEvaluate);
    }

    @Override
    @Transactional
    public List<MentorAnswer> getMentorAnswerBySemester(String semester) {
       return teacherEvaluateDao.getMentorAnswerBySemester(semester);
    }

    @Override
    @Transactional
    public List<TeacherAnswer> getTeacherAnswerBySemester(String semester) {
        return teacherEvaluateDao.getTeacherAnswerBySemester(semester);
    }

    @Override
    @Transactional
    public TeacherEvaluate updateTeacherEvaluate (TeacherEvaluate teacherEvaluate) {
        teacherEvaluateDao.updateTeacherEvaluate(teacherEvaluate);
        return teacherEvaluate;
    }

    @Override
    @Transactional
    public void updateTeacherEvaluateByCompanyId(TeacherEvaluate teacherEvaluate) {
        teacherEvaluateDao.updateTeacherEvaluateByCompanyId(teacherEvaluate);
    }

    @Override
    @Transactional
    public void saveTeacherAnswer(TeacherAnswer teacherAnswer) {
        teacherEvaluateDao.saveTeacherAnswer(teacherAnswer);
    }

    @Override
    @Transactional
    public TeacherEvaluate getTeacherEvaluateById(long ass_id) {
        return teacherEvaluateDao.getTeacherEvaluateById(ass_id);
    }

    @Override
    @Transactional
    public List<TeacherEvaluate> getTeacherEvaluate() {
        return teacherEvaluateDao.getTeacherEvaluate();
    }

    @Override
    @Transactional
    public List<TeacherEvaluate> getTeacherStatusBySemester(String semester) {
        return teacherEvaluateDao.getTeacherStatusBySemester(semester);
    }

    @Override
    @Transactional
    public List<MentorEvaluate> getMentorStatusBySemester(String semester) {
        return teacherEvaluateDao.getMentorStatusBySemester(semester);
    }

    @Override
    @Transactional
    public List<TeacherEvaluate> getTeacherStatusBySemester() {
        return teacherEvaluateDao.getTeacherStatusBySemester();
    }

    @Override
    @Transactional
    public List<MentorEvaluate> getMentorStatusBySemester() {
        return teacherEvaluateDao.getMentorStatusBySemester();
    }

    @Override
    @Transactional
    public List<TeacherEvaluate> getListTeacherEvaluateBySemester(String semester) {
        return teacherEvaluateDao.getListTeacherEvaluateBySemester(semester);
    }

    @Override
    @Transactional
    public List<TeacherEvaluate> getCompanyAssignBySemester(String semester) {
        return teacherEvaluateDao.getCompanyAssignBySemester(semester);
    }

    @Override
    @Transactional
    public List<Teacher> getAssignTeacher(int company_id, String semester, Date teacher_super_vision_date, String teacher_super_vision_time) {
        return teacherEvaluateDao.getAssignTeacher(company_id,semester,teacher_super_vision_date,teacher_super_vision_time);
    }

    @Override
    @Transactional
    public Teacher getUpdateAssignTeacher(int company_id, String semester, Date teacher_super_vision_date, String teacher_super_vision_time) {
        return teacherEvaluateDao.getUpdateAssignTeacher(company_id,semester,teacher_super_vision_date,teacher_super_vision_time);
    }

    @Override
    @Transactional
    public List<Teacher> getTeacherByStatusOn() {
        return teacherEvaluateDao.getTeacherByStatusOn();
    }

    @Override
    @Transactional
    public List<TeacherEvaluate> getSubmitAssignTeacher(int company_id, String semester) {
        return teacherEvaluateDao.getSubmitAssignTeacher(company_id,semester);
    }

    @Override
    @Transactional
    public List<TeacherEvaluate> getCheckAssignTeacher() {
        return teacherEvaluateDao.getCheckAssignTeacher();
    }


}
