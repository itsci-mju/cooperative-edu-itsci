package it_sci.service;

import it_sci.dao.MentorDao;
import it_sci.model.Mentor;
import it_sci.model.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class MentorServiceImpl implements MentorService {

    @Autowired
    private MentorDao mentorDao;

    @Override
    @Transactional
    public Mentor getMentorById(int mentor_id) {
        return mentorDao.getMentorById(mentor_id);
    }

    @Override
    @Transactional
    public Mentor getMentorProfile(int id) {
        return mentorDao.getMentorProfile(id);
    }

    @Override
    @Transactional
    public void updateMentor(Mentor mentor) {
        mentorDao.updateMentor(mentor);
    }

    @Override
    @Transactional
    public List<Student> getMentorDoesNotHaveStudent(int id) {
        return mentorDao.getMentorDoesNotHaveStudent(id);
    }


}
