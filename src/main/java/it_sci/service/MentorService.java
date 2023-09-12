package it_sci.service;

import it_sci.model.Mentor;
import it_sci.model.Student;

import java.util.List;

public interface MentorService {
    Mentor getMentorById(int mentor_id);
    List<Mentor> getMentorByIdAndStuId(int mentor_id);
    Mentor getMentorProfile(int id);

    void updateMentor(Mentor mentor);
    List<Student> getMentorDoesNotHaveStudent(int id);
}
