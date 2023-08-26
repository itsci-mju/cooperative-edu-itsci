package it_sci.service;

import it_sci.dao.UserDao;
import it_sci.model.Mentor;
import it_sci.model.Teacher;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserServiceImpl implements UserService{

    @Autowired
    private UserDao userDao;


    BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
    @Override
    @Transactional
    public Mentor loginMentor(String email, String password) {
        Mentor mentor = userDao.getMentorByUsername(email);
        return (mentor != null && mentor.getMentor_email()!=null && bCryptPasswordEncoder.matches(password,mentor.getPassword())?mentor:null);
    }

    @Override
    @Transactional
    public Teacher loginTeacher(String email, String password) {
        Teacher teacher = userDao.getTeacherByUsername(email);
        return (teacher != null && teacher.getTeacher_email() != null && teacher.getPassword().equals(password)?teacher:null);
    }
}
