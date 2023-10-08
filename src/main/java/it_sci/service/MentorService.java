package it_sci.service;

import it_sci.model.Mentor;
import it_sci.model.Student;

import java.util.List;

public interface MentorService {
    Mentor getMentorById(int mentor_id);
    List<Mentor> getMentorByIdAndStuId(int mentor_id);
    Mentor getMentorProfile(int id);

    List<Mentor> getManageLoginMentor();

    void updateMentorPassword(Mentor mentor);
    void updateMentor(Mentor mentor);
//    List<Student> getMentorDoesNotHaveStudent(int id);

    List<Mentor> getListStudentByMenterId(int mentor_id);
}
