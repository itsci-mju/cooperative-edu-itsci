package it_sci.service;

import it_sci.model.*;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface TeacherEvaluateService {

    List<TeacherEvaluate> getTeacherEvaluateByTeacherId (int tEvaId, int companyId,String semester);

    List<TeacherEvaluate> getViewTeacherEvaluateByStudentSemester(String semester,int teacher_id);

    List<TeacherEvaluate> getViewTeacherEvaluate(int teacher_id);

    List<TeacherEvaluate> getStatusByStudentSemester(String semester);

    List<String> getAllListSemester() ;

    @Transactional
//    List<String> getAllListSemester(String semester);

    void saveTeacherEvaluate(TeacherEvaluate teacherEvaluate);

    TeacherEvaluate updateTeacherEvaluate (TeacherEvaluate teacherEvaluate);

    void saveTeacherAnswer(TeacherAnswer teacherAnswer);
    TeacherEvaluate getTeacherEvaluateById(long ass_id);
    List<TeacherEvaluate> getTeacherEvaluate();

}
