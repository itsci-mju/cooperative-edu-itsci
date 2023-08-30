package it_sci.dao;

import it_sci.model.*;

import java.util.List;

public interface TeacherDao {

    Teacher getTeacherById(int teacher_id);

    Teacher getteacherProfile(int id);
    Student getStudent(String id);
    List<Mentor> getMentorsByStudentId(String studentId);

    List<Teacher> getAllTeachers();

    void saveTeacherEvaluate (TeacherEvaluate teacherEvaluate);

    List<Company>getCompanyToAssignByTeacher(int teacher_id);
}
