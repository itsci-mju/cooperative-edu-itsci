package it_sci.dao;

import it_sci.model.*;

import java.util.List;

public interface TeacherEvaluateDao {


    List<TeacherEvaluate> getTeacherEvaluateByTeacherId (int tEvaId,int companyId,String semester);

    List<TeacherEvaluate> getViewTeacherEvaluateByStudentSemester(String semester,int teacher_id);

    List<TeacherEvaluate> getStatusByStudentSemester(String semester);

    List<TeacherEvaluate> getViewTeacherEvaluate (int teacher_id);
    List<TeacherEvaluate> getTeacherEvaluate();

    List<String> getAllListSemester();
    void saveTeacherAnswer(TeacherAnswer teacherAnswer);

    void saveTeacherEvaluate(TeacherEvaluate teacherEvaluate);

    TeacherEvaluate updateTeacherEvaluate (TeacherEvaluate teacherEvaluate);

    TeacherEvaluate getTeacherEvaluateById(long ass_id);

//    List<TeacherEvaluate> getTeacherEvaluateByCompany(int companyId);
}
