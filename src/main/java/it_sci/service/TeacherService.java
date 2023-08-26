package it_sci.service;

import it_sci.model.Company;
import it_sci.model.MentorEvaluate;
import it_sci.model.Teacher;
import it_sci.model.TeacherEvaluate;

import java.util.List;

public interface TeacherService {
    Teacher getTeacherById(int teacher_id);
    List<Teacher> getAllTeachers();

    void saveTeacherEvaluate (TeacherEvaluate teacherEvaluate);
    List<Company> getCompanyToAssignByTeacher(int teacher_id);
}
