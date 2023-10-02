package it_sci.service;

import it_sci.model.*;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface TeacherEvaluateService {

    List<TeacherEvaluate> getTeacherEvaluateByTeacherId (int tEvaId, int companyId);

    List<TeacherEvaluate> getViewTeacherEvaluate(int teacher_id);

    List<String> getAllListSemester() ;
    void saveTeacherEvaluate(TeacherEvaluate teacherEvaluate);

    TeacherEvaluate updateTeacherEvaluate (TeacherEvaluate teacherEvaluate);

    void saveTeacherAnswer(TeacherAnswer teacherAnswer);
    TeacherEvaluate getTeacherEvaluateById(long ass_id);
    List<TeacherEvaluate> getTeacherEvaluate();

}
