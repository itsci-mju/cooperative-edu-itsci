package it_sci.service;

import it_sci.dao.MentorEvaluateDao;
import it_sci.model.Company;
import it_sci.model.Mentor;
import it_sci.model.MentorEvaluate;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class MentorEvaluateServiceImpl implements MentorEvaluateService {

    @Autowired
    private MentorEvaluateDao mentorEvaluateDao;

    @Override
    public List<MentorEvaluate> getAllMentorEvaluates() {
        return null;
    }

    @Override
    public MentorEvaluate getMentorEvaluateById(String mEvaId) {
        return null;
    }

    @Override
    @Transactional
    public void saveMentorEvaluate(MentorEvaluate mentorEvaluate) {
        mentorEvaluateDao.saveMentorEvaluate(mentorEvaluate);
    }

    @Override
    @Transactional
    public MentorEvaluate updateMentorEvaluate(MentorEvaluate mentorEvaluate) {
        mentorEvaluateDao.updateMentorEvaluate(mentorEvaluate);
        return mentorEvaluate;
    }

    @Override
    @Transactional
    public List<MentorEvaluate> getMentorEvaluateByMentorId(int id) {
        return mentorEvaluateDao.getMentorEvaluateByMentorId(id);
    }

    @Override
    public void deleteMentorEvaluate(String mEvaId) {

    }

    @Override
    public double getSumScoreMentor(String stu_id) {
        return mentorEvaluateDao.getSumScoreMentor(stu_id);
    }
}
