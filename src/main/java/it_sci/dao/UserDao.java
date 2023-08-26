package it_sci.dao;

import it_sci.model.Mentor;
import it_sci.model.Teacher;

public interface UserDao {

    Mentor getMentorByUsername (String email);

    Teacher getTeacherByUsername (String email);



}
