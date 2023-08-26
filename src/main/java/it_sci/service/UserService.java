package it_sci.service;

import it_sci.model.Mentor;
import it_sci.model.Teacher;

public interface UserService {

    Mentor loginMentor (String email, String password);

    Teacher loginTeacher (String email, String password);
}
