package it_sci.service;

import it_sci.model.Mentor;
import it_sci.model.MentorEvaluate;
import it_sci.model.TeacherEvaluate;

import java.util.List;

public interface TeacherEvaluateService {

    List<TeacherEvaluate> getTeacherEvaluateByTeacherId (int tEvaId, int companyId);
    List<TeacherEvaluate> getViewTeacherEvaluate(int teacher_id);
    void saveTeacherEvaluate(TeacherEvaluate teacherEvaluate);

    TeacherEvaluate updateTeacherEvaluate (TeacherEvaluate teacherEvaluate);

    TeacherEvaluate getTeacherEvaluateById(long ass_id);
    List<TeacherEvaluate> getTeacherEvaluate();
}
