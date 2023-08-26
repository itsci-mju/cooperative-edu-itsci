package it_sci.dao;

import it_sci.model.Mentor;
import it_sci.model.Student;
import java.util.List;

public interface MentorDao {
    Mentor getMentorById(int mentor_id);
    Mentor getMentorProfile(int id);

    Mentor updateMentor (Mentor mentor) ;
    List<Student> getMentorDoesNotHaveStudent(int id);

}
